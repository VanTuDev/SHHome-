<%--
  Created by IntelliJ IDEA.
  User: duong
  Date: 11/3/2023
  Time: 8:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Post</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <jsp:include page="metaClient.jsp"/>
    <style>

        td,th,tr{
            font-size:12px;
        }

        .progress {
            margin: 20px 0px;
        }
        .progress-bar {
            display: flex;
            flex-direction: column;
            justify-content: center;
            overflow: hidden;
            color: #fff;
            text-align: center;
            white-space: nowrap;
            background-color: #0d6efd;
            transition: width 0.6s ease;
        }
        @media (prefers-reduced-motion: reduce) {
            .progress-bar {
                transition: none;
            }
        }

        .progress-bar-striped {
            background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
            background-size: 1rem 1rem;
        }

        .progress-bar-animated {
            -webkit-animation: 1s linear infinite progress-bar-stripes;
            animation: 1s linear infinite progress-bar-stripes;
        }
        @media (prefers-reduced-motion: reduce) {
            .progress-bar-animated {
                -webkit-animation: none;
                animation: none;
            }
        }
        .number-tag {
            /* margin: 10px; */
            padding: 3px 6px;
            box-sizing: content-box;
            border-radius: 100%;
            background-color: blue;
            color: white;
        }

        .guide {
            margin: 10px 0px;
            background-color: #f9f9f9;
        }

        th,
        tr {
            border: 1px solid;
            margin: 20px 0px;
            padding: 7px 10px;
            box-sizing: content-box;
        }

        td{
            padding:10px;

        }

        .create_post {
            padding: 20px;
        }


        .notion {
            background-color: rgb(237, 206, 206);
            color: rgb(229, 40, 40);
            height: 60px;
            display: flex;
            align-items: center;
            border-radius: 10px;
        }

        .progress {
            margin: 20px 0px;
        }


        #pro_description {
            height: 160px;
            width: 688px;
        }

        .item{
            margin-top: 8px;
        }


        .red {
            color: red;
        }

        #imageloadbutton{
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            padding:10px;
            box-sizing: content-box;
            line-height: 33px;
            width: 666px;
            /* này dùng để dịch sang */
            margin-left: 12px;
        }


        body{
            margin: 0;
            padding: 0;
            color: #333;
            font-family: Arial, Helvetica, Sans-serif;
            font-size: 12px;
            line-height: 18px;
        }

        a, h1, h2, h3, h4, h5, h6, li, p, ul {
            margin: 0;
            padding: 0;
            text-decoration: none!important;
            color: #1a3560;
        }

        hr {
            margin: 5px 0px;
        }

        p {
            margin: 0px;
        }

        label {
            float: left;
            width: 100px;
            line-height: 36px;
            min-height: 10px;
        }

        input,select {
            border-radius: 1px;
            border: 1px solid #dfdfdf;
            padding: 5px;
            width: 688px;
            height: 33px;
            margin:8px 0px;
            position: relative;
            /* right:10px */
        }


        textarea {
            border: 1px solid #bdc7d8;
            height: 160px;
            width: 100px;
            position: relative;
            padding: 5px;
            /* right: 10px; */
        }

        textarea #pro_description {
            width: 688px;
        }

        .camera-image {
            background-image: url('img/bg_upload_1.png');
            background-repeat: no-repeat;
            width: 100%; /* Điều chỉnh kích thước hình ảnh tùy ý */
            height: 90px !important;
            background-size:contain;
        }

        * {
            margin: 0px;
            box-sizing: border-box;
        }



        .btnSubmit {
            background: #f57301 !important;
            color: #fff !important;
            padding: 15px 0;
            display: block;
            font-size: 15px;
            border: none;
            float: left;
            border-radius: 5px;
            width: 200px;
            text-align: center;
            height: 50px;
        }



    </style>

</head>

<body>
<%@include file="_header.jsp" %>
<div class="container">
    <div class="row">
        <div class="container mt-3">
            <div class="progress">
                <div class="progress-bar" style="width:60%"></div>
            </div>
        </div>
        <p><span class="number-tag">2</span> Thông tin nhà đăng | <Strong><a href="createPost_first.jsp">Chọn lại
            danh mục bài đăng</a> </Strong></p>
        <div class="col-3">
            <div class="guide">
                <table>
                    <tr>
                        <th class="title">
                            <p><strong>Hướng dẫn đăng tin</strong></p>
                        </th>
                    </tr>
                    <tr>
                        <td><strong>Nội dung tốt</strong>
                            <ul>
                                <p>- Nhập ảnh thật được nhiều người xem hơn
                                </p>
                                <p>- Nhập đầy đủ địa chỉ nhà đất cho thuê
                                </p>
                                <p>- Nhập đầy đủ diện tích nhà đất cho thuê
                                </p>
                                <p>- Nhập đầy đủ giá cả, chứng nhận pháp lý
                                </p>
                                <p>- Miêu tả những điểm nổi bật, đặc thù của bất động sản.
                                </p>
                            </ul>
                            <strong>Nội dung không tốt</strong>
                            <ul>
                                <p>- Thông tin trùng lặp với bài đã đăng</p>
                                <p>- Thiếu địa chỉ nhà đất đất cụ thể</p>
                                <p>- Thiếu diện tích cụ thể</p>
                                <p>- Thiếu giá cả, chứng nhận pháp lý cụ thể</p>
                            </ul>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="col-9">
            <form method="POST" action="" class="user_form " enctype="multipart/form-data">

                <div class="item row">
                    <label class="col-2" for="photoimg"><strong>Đăng ảnh</strong></label>
                    <div class="col-9" id="imageloadbutton">
                        <p><b>"Một hình ảnh bằng cả ngàn lời nói". Hãy đăng ảnh để được nhiều người xem hơn.</p>
                        <p>Click vào ảnh bạn muốn chọn làm ảnh đại diện. Mặc định là ảnh đầu tiên.</p>
                        <label for="photoimg" class="camera-image">
                            <input type="file" name="photos[]" id="photoimg" multiple="true" style="display: none;" />
                        </label>
                    </div>
                </div>
                <div class="item row">
                    <label class="col-2">Title<span class="red">(*)</span></label>
                    <div class="col-9 item_input">
                        <input name="pro_title" class="pro_title" type="text" id="pro_title" value=""
                               placeholder="Cho thuê nhà trọ, phòng trọ ở đâu...">
                    </div>
                </div>

                <div class="item row">
                    <label class="col-2">Description <span class="red">(*)</span></label>
                    <div class="col-9 item_input">
                            <textarea name="pro_description" class="input_des pro_description" id="pro_description"
                                      placeholder="Mô tả thêm thông tin, tiện ích, qui định, giá cả..."></textarea>
                    </div>
                </div>

                <div class="item row">
                    <div class="row item_sub item_sub_first">
                        <label class="col-2">Ward</label>
                        <div class="col-9 item_input">
                            <select class="input_select pro_city_pa_id" name="pro_city_pa_id" id="pro_city_pa_id">
                                <option value="">Choose ware -</option>
                                <option value="3"> Ngũ Hành Sơn Ward</option>
                            </select>
                        </div>
                    </div>
                    <div class="row item_sub item_sub_last ">
                        <label class="col-2" for="#pro_city_id">Address</label>
                        <div class=" col-9 item_input">
                            <select class="input_select pro_city_id" name="pro_city_id" id="pro_city_id">
                                <option value="">Choose address -</option>
                            </select>
                        </div>
                    </div>

                </div>

                <div class="row item">
                    <div class="row item_sub item_sub_first">
                        <label class="col-2">Diện tích(m&#178)</label>
                        <div class=" col-9 item_input">
                            <input name="pro_acreage" class="pro_acreage" type="text" id="pro_acreage" value="">
                        </div>
                    </div>

                    <div class="row item_sub item_sub_last">
                        <label class="col-2">Địa chỉ</label>
                        <div class=" col-9 item_input">
                            <input name="pro_addr" class="pro_addr" type="text" id="pro_addr" value="">
                        </div>
                    </div>


                </div>



                <div class="item">
                    <div class="item_sub item_sub_first row">
                        <label class="col-2">Giá <span class="red">(*)</span></label>
                        <div class="col-9 item_input">
                            <input name="pro_price" class="pro_price" type="text" id="pro_price" value="">
                        </div>
                    </div>
                    <div class="item_sub">
                        <b class="pro_price_view red"></b>
                    </div>
                </div>

                <div class="module_title mg_top_20">
                    <b>Thông tin liên hệ</b>
                </div>
                <div class="item">
                    <div class="row item_sub item_sub_first">
                        <label class="col-2">Name</label>
                        <div class="col-9 item_input">
                            <input name="pro_user_name" class="pro_user_name" type="text" id="pro_user_name"
                                   value="(K17 DN) Le Ngoc Hieu">
                        </div>
                    </div>

                    <div class="row item_sub item_sub_last ">
                        <label class="col-2">Phone </label>
                        <div class="col-9 item_input">
                            <input name="pro_user_phone" class="pro_user_phone" type="text" id="pro_user_phone"
                                   value="">
                        </div>
                    </div>
                </div>
                <div class="row item">
                    <label class="col-2">Address </label>
                    <div class="col-9 item_input">
                        <input name="pro_user_addr" class="pro_user_addr" type="text" id="pro_user_addr" value="">
                    </div>
                </div>


                <div class="item_message">
                    <label>&nbsp;</label>
                    <p class="message"></p>
                </div>

                <div class="item">
                    <label>&nbsp;</label>
                    <input type="hidden" value="" id="pro_avatar" class="pro_avatar" name="pro_avatar" />
                    <input type="hidden" value="10" class="pro_cat_id" name="pro_cat_id" />
                    <input type="hidden" value="" id="pro_avatar_list" class="pro_avatar_list"
                           name="pro_avatar_list" />
                    <input type="hidden" name="action" value="add" />
                    <input type="submit" value="Đăng tin" class="btnSubmit" />
                </div>

                <div class="clear"></div>
            </form>
        </div>
    </div>
</div>
<%@include file="_footer.jsp" %>
</body>
</html>
