package com.example.demo.Servlet.Client;


import com.example.demo.Service.PostService;
import com.example.demo.Service.RoomTypeService;
import com.example.demo.Utils.ImageUtils;
import com.example.demo.Utils.Protector;
import com.example.demo.Utils.Validator;
import com.example.demo.beans.Address;
import com.example.demo.beans.Post;
import com.example.demo.beans.RoomType;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@WebServlet(name = "createPostFromUser",value = "/createPostFromUser")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 5, // 5 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 10 // 10 MB
)
public class CreatePostServlet extends HttpServlet {
    private final RoomTypeService roomTypeService = new RoomTypeService();
    private final PostService postService = new PostService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<RoomType> roomTypes = Protector.of(()-> roomTypeService.getPart(10,0)).get(ArrayList::new);
        req.setAttribute("roomTypes" ,roomTypes);
        req.getRequestDispatcher("/WEB-INF/views/client/createPost.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Post post = new Post();
        Address address = new Address(
                48 ,
                "Đà Nẵng" ,
                Integer.parseInt(req.getParameter("districtCode")) ,
                req.getParameter("districtName") ,
                Integer.parseInt(req.getParameter("wardsCode")) ,
                req.getParameter("wardsName")
        );
        post.setTitle(req.getParameter("title").trim().isEmpty()
                ? null : req.getParameter("title"));
        post.setDescriptions(req.getParameter("descriptions").trim().isEmpty()
                ? null : req.getParameter("description"));

        post.setPrice(Protector.of(() -> Double.parseDouble(req.getParameter("price"))).get(0d));
        post.setArea(req.getParameter("area").trim().isEmpty()
                ? null : req.getParameter("area"));
        post.setAddressDetail(req.getParameter("addressDetail").trim().isEmpty()
                ? null : req.getParameter("addressDetail"));
        post.setUserId( Protector.of(() -> Long.parseLong(req.getParameter("userId"))).get(0L));
        post.setRoomTypeId( Protector.of(() -> Long.parseLong(req.getParameter("roomType"))).get(0L));
        post.setStartAt(LocalDateTime.now());

        post.setEndAt(
                LocalDateTime.of(
                                        LocalDate.parse(
                                                req.getParameter("endAt"),
                                                DateTimeFormatter.ofPattern("dd/MM/yyyy")
                                        ), LocalTime.MIDNIGHT)
        );

        post.setProvinceCode(address.getProvinceCode());
        post.setDistrictCode(address.getDistrictCode());
        post.setWardCode(address.getWardsCode());
        post.setCreateAt(LocalDateTime.now());
        List<RoomType> roomTypesFromServer = roomTypeService.getAll();
        Map<String, List<String>> violations = new HashMap<>();
        violations.put("titleViolations", Validator.of(post.getTitle())
                        .isNotBlankAtBothEnds()
                        .isAtMostOfLength(100)
                        .isNotNullAndEmpty()
                        .toList()
        );
        violations.put("descriptionViolations",Validator.of(post.getDescriptions())
                .isAtMostOfLength(350)
                .toList()
        );
        violations.put("priceViolations",Validator.of(post.getPrice())
                .isLargerThan(0, "Giá gốc")
                .isNotNullAndEmpty()
                .toList()
        );
        violations.put("areaViolations",Validator.of(post.getArea())
                .isNotNullAndEmpty()
                .toList()
        );
        violations.put("addressDetail",Validator.of(post.getAddressDetail())
                .isAtMostOfLength(50)
                .isNotNullAndEmpty()
                .toList()
        );
        violations.put("createAtViolations",Validator.of(post.getCreateAt())
                .isNotNullAndEmpty()
                .toList()
        );
        int sumOfViolations = violations.values().stream().mapToInt(List::size).sum();
        String successMessage = "Thêm thành công!";
        String errorMessage = "Thêm thất bại!";
        if (sumOfViolations == 0) {
            ImageUtils.upload(req).ifPresent(post::setImageName);
            Protector.of(() -> postService.insert(post))
                    .done(r ->{
                        req.setAttribute("roomType",roomTypesFromServer);
                        req.setAttribute("successMessage", successMessage);
                        req.setAttribute("operationResult", "success");

                    } )
                    .fail(e -> {
                        req.setAttribute("roomType",roomTypesFromServer);
                        req.setAttribute("post", post);
                        req.setAttribute("errorMessage", errorMessage);
                        req.setAttribute("operationResult", "failure");
                    });
        } else {
            req.setAttribute("roomType",roomTypesFromServer);
            req.setAttribute("post", post);
            req.setAttribute("violations", violations);
        }

        req.setAttribute("roomType",roomTypesFromServer);
        req.getRequestDispatcher("/WEB-INF/views/client/createPost.jsp").forward(req,resp);

    }
}
