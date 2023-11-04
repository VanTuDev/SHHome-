<%--
  Created by IntelliJ IDEA.
  User: duong
  Date: 10/27/2023
  Time: 3:57 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <title>Chi tiết bài đăng</title>
    <jsp:include page="metaClient.jsp"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $(document).ready(function () {
            function loadDataFromServer(data) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/loadAddressName',
                    method: 'GET',
                    data: data,
                    success: function(response) {
                        $("#wardName").text(response[0]);
                        $("#districtName").text(response[1]);
                        $("#provinceName").text(response[2]);
                    },
                    error: function() {
                        console.log("Error loading data.");
                    }
                });
            }


            const postData = {
                wardCode: "${requestScope.post.wardCode}",
                districtCode: "${requestScope.post.districtCode}",
                provinceCode: "${requestScope.post.provinceCode}"
            };
            console.log(postData)

            loadDataFromServer(postData);
        });
    </script>
    <style>

        .info{
            display: flex;
            flex-direction: column;
            justify-content: space-around;
        }

        .root{
            --icon-color:#5c8bdb;
        }

        .pro_item{
            background-color: white !important;
        }

        .fas{
            color:var(--icon-color) !important;
        }

        body{
            padding: 0px;
            border: 0px;
            margin: 0px;
        }

        .infor-post {
            background-color: white;
            box-shadow: 0 4px 5px rgba(0, 0, 0, 0.4);
            margin: 15px;
            border-radius: 10px;
            padding: 10px;
            box-sizing: content-box;
        }

        .infor-main{
            margin-bottom: 20px;
        }

        .infor-account {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 10px 0px;
        }

        .infor-detail {
            display: flex;
            flex-direction: column;
            align-items: center;
        }


        .time-post{
            display: flex;
            justify-content: flex-end;
        }

        .carousel-control-prev-icon,.carousel-control-next-icon{
            /* padding:5px; */
            box-sizing: content-box;
            background-color: var(--font-heavy-color);
            border-radius: 100%;
        }

        .the-post .section {
            padding: 0;
            border: 0;
            border-radius: 0;
        }

        .section {
            margin-bottom: 20px;
        }

        .the-post table td.name {
            white-space: nowrap;
            width: 25%;
        }


        td {
            display: table-cell;
            vertical-align: inherit;
        }


        .section-top-location {
            text-align: center
        }

        .the-post .section {
            padding: 0;
            border: 0;
            border-radius: 0;
        }

        .section {
            margin-bottom: 20px;
        }

        .section {
            margin-bottom: 20px;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #dedede;
            border-radius: 8px
        }

        .section .section-header {
            margin-top: 0;
            margin-bottom: 15px
        }

        .section .section-title {
            font-size: 1.3rem;
            font-weight: 700;
            margin: 0;
            padding: 0
        }

        .section h2.section-title {
            font-size: 1.5rem
        }

        .section .section-title.small {
            font-size: 1.2rem
        }

        .section .section-title.big {
            font-size: 2rem
        }

        .section.section-text .section-content {
            font-size: 1.05rem;
            padding: 20px
        }

        .section.section-text .section-content :first-child {
            margin-top: 0;
            padding-top: 0
        }

        .section.section-text.has-readmore {
            position: relative;
            padding-bottom: 30px
        }

        .section.section-text.has-readmore .section-content {
            position: relative;
            margin-top: 0
        }

        .section.section-text.has-readmore .section-content :first-of-type {
            margin-top: 0;
            padding-top: 0
        }

        .section.section-text.has-readmore .section-content .content-read {
            max-height: 350px;
            position: relative;
            overflow: hidden
        }

        .section.section-text .button-readmore {
            display: none
        }

        .section.section-text.has-readmore .button-readmore {
            display: block;
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 100%;
            text-align: center;
            margin: 0;
            padding: 100px 0 0 0;
            background: #020024;
            background: linear-gradient(180deg,rgba(2,0,36,0) 0,rgba(255,255,255,1) 66%);
            color: #007aff;
            font-size: 1.1rem;
            font-weight: 700
        }

        .section.section-text.has-readmore .button-readmore span:hover {
            cursor: pointer;
            text-decoration: underline
        }

        .section.section-text h2 {
            font-size: 1.5rem
        }

        .section.section-text h3 {
            font-size: 1.2rem
        }

        .section.section-text h4 {
            font-size: 1.05rem
        }

        .section.section-text figure {
            background-color: transparent
        }

        .section.section-text figcaption {
            padding: 10px;
            font-size: 1rem
        }

        .section.section-text img {
            max-width: 600px;
            margin: 0 auto;
            height: auto
        }

        .section-top-location {
            text-align: center;
            background-color: transparent;
            border: 0;
            padding: 0
        }
        .section-whyus .section-content {
            padding: 20px 50px 50px;
            text-align: center
        }

        .section-whyus .section-content h3 {
            font-size: 1.8rem;
            font-weight: 700
        }

        .section-whyus .whyus-countup .whyus-countup-item {
            width: 25%;
            float: left;
            text-align: center
        }

        .section-whyus .whyus-countup .whyus-countup-item .whyus-countup-item-number {
            font-weight: 700;
            font-size: 1.5rem;
            display: block;
            margin-bottom: 5px
        }

        .section-whyus .testimonial {
            font-style: italic
        }

        .section-whyus .star.star-5 {
            width: 100px;
            height: 20px;
            background: url(../images/mobile/star2.png) left center repeat-x;
            background-size: 20px 20px;
            display: inline-block;
            margin-right: 3px;
            float: none
        }

        .section-support {
            border: 7px dashed #e8eefc;
            padding: 30px;
            margin-top: 30px;
            border-radius: 8px
        }

        .section-support .support-bg {
            height: 150px;
            background: url(../images/support-bg.jpg) center no-repeat;
            background-size: contain
        }

        .section-support .list-support {
            text-align: center;
            padding: 0 10px;
            margin-top: 30px
        }

        .section-support .list-support-title {
            font-size: 1.2rem;
            margin-bottom: 20px;
            color: #233762
        }

        .section-support .support-item {
            margin-bottom: 25px;
            width: 25%;
            float: left
        }

        .section-support .support-item-title {
            font-weight: 700;
            display: block;
            margin-bottom: 10px;
            color: #f60;
            text-transform: uppercase
        }

        .section-support .support-item a {
            display: block;
            color: #233762;
            font-size: 1.3rem;
            font-weight: 700;
            margin: 5px 0
        }

        .section-support a.btn {
            display: inline-flex;
            color: #fff;
            font-size: 1rem;
            font-weight: 700;
            padding: 10px 30px
        }

        .the-post .section {
            padding: 0;
            border: 0;
            border-radius: 0
        }
        .the-post .post-main-content .section-content {
            font-size: 1.1rem
        }

        .user-infor{
            border-radius: 10px;
            background-color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            height: 400px;
            box-shadow: 0 4px 5px rgba(0, 0, 0, 0.4);
        }


        .user-infor img {
            width: 100%;
            float: left;
            max-height: 200px;
            display: block;
            overflow: hidden;
            border-radius: 10px;
            margin: 5px;
        }

        .other-post{
            border-radius: 10px;
            background-color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            height: 400px;
            box-shadow: 0 4px 5px rgba(0, 0, 0, 0.4);
            margin: 10px 0px;
        }

        .detail-post{
            margin:0px 20px
        }

        .other-post img {
            /* width: 100px; */
            float: left;
            display: block;
            overflow: hidden;
            border-radius: 10px;
            margin: 5px;
            padding: 0px;
        }

        .user-infor-name{
            background-color: #1A3560;
            color:white
        }

        .user-infor-item{
            background-color: #CAE1FF;
        }

        .user-infor-name,.user-infor-item{
            width: 170px;
            height: 30px;
            border-radius: 5px;
            margin:5px;
            display: flex;
            justify-content: center;
            align-items: center
        }

        .breadcrumb{
            padding:0px 12px;
        }

        .info_item{
            padding:10px 12px
        }

        .info_item hr{
            margin: 10px 12px;
        }

        .info_item p{
            display: flex;
            justify-content: center;
            font-size: larger;
        }

        .post-button{
            display: flex;
            justify-content: center;
        }

        .view-button{
            background-color: #CAE1FF;
        }

        .contract-button{
            background-color: #1A3560;
        }

        .view-button, .contract-button{
            width: 30%;
            height: 40px;
            border-radius: 8px;
            border:0px;
            margin: 5px
        }

        .view-button a{
            color: #1E3570;
            font-size: larger;
        }

        .contract-button a{
            color: #CAE1FF;
            font-size: larger;
        }

        .other{
            margin-top: 15px;
        }

        .infor-little-post {
            display: flex;
            padding:0px;
        }

        .little-post{
            padding: 0px;
            padding: 2px;
            /* box-shadow: 0 1px 2px rgba(0, 0, 0, 0.4); */
            border-radius: 3px;
            margin-top: 2px;
            /* background-color: rgba(222, 233, 246, 0.5); */
        }

        .little-post hr{
            margin: 10px 0px
        }
    </style>
</head>
<body>
<%@include file="_header.jsp" %>
<div class="">
    <div class="detail-post row">
        <div class="infor-post row col-8">
            <div class="container infor-main row">
                <ol class="col-6 breadcrumb">
                    <li><a href="${pageContext.request.contextPath}/homeView">Home/ </a></li>
                    <li class="active">${requestScope.post.title}</li>
                </ol>
                <div class="time-post col-6">
                    <p> <span class="info2_lable"><strong><i class="fas fa-calendar-check"></i></strong></span>
                        <span class="time">${requestScope.post.startAt}</span> </p>
                </div>
                <div id="demo" class="carousel slide" data-bs-ride="carousel">
                    <!-- Indicators/dots -->
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                        <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
                        <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
                    </div>
                    <!-- The slideshow/carousel -->
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="${pageContext.request.contextPath}/image/${requestScope.post.imageName}"
                                 alt="${requestScope.post.title}" class="d-block" style="width:100%;height: 400px;">
                        </div>
                        <div class="carousel-item">
                            <img src="https://sonthuanlamphanthiet.com/wp-content/uploads/2021/05/mau-trang-tri-phong-tro-7.jpg"
                                 alt="Chicago" class="d-block" style="width:100%;height: 400px;">
                        </div>
                        <div class="carousel-item">
                            <img src="https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2021/11/16/cho-thue-phong-tro-1613975723_1637034014.jpg"
                                 alt="New York" class="d-block" style="width:100%;height: 400px;">
                        </div>
                    </div>
                    <!-- Left and right controls/icons -->
                    <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon"></span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
                        <span class="carousel-control-next-icon"></span>
                    </button>
                </div>
                <div>
                    <h1><strong style="font-size: 30px;">${requestScope.post.title}</strong></h1>
                    <address class="col-12"><span><i class="fas fa-map-marked-alt"></i> Địa chỉ: </span>
                        <span>${requestScope.post.addressDetail}, ${requestScope.post.wardName}, ${requestScope.post.districtName}, Đà Nẵng</span></address>
                    <hr>
                </div>
                <div class="info_item row">
                    <p class="col-3"><span><i class="fas fa-hand-holding-usd"></i></span> <span
                            class="text-danger"><b>${requestScope.post.price} đ</b></span></p>
                    <p class="col-3"><span><i class="fas fa-chart-area"></i>
                            </span><span>${requestScope.post.area} cm&#178;</span></p>
                    <p class="col-3"><span><i class="fas fa-calendar-alt"></i></span>
                        ${requestScope.post.startAt}</p>
                    <p class="col-3"><span><i class="fas fa-hashtag"></i></span>
                        ${requestScope.post.id}</p>
                    <hr>
                </div>

                <div>
                    <h2><span><b>Thông tin mô tả: </b></span></h2>
                    <p>${requestScope.post.descriptions}</p>
                </div>
            </div>
            </section>
            <section class="section post-overview">
                <div class="section-header">
                    <h3 class="section-title">Đặc điểm tin đăng</h3>
                </div>
                <div class="section-content">
                    <table class="table">
                        <tr>
                            <td class="name">Mã tin:</td>
                            <td>#${requestScope.post.id}</td>
                        </tr>
                        <tr>
                            <td class="name">Khu vực</td>
                            <td> ${requestScope.post.districtName} </td>
                        </tr>
                        <tr>
                            <td class="name">Loại tin rao:</td>
                            <td>${requestScope.post.roomTypeName}</td>
                        </tr>
                        <tr>
                            <td class="name">Đối tượng thuê:</td>
                            <td>Tất cả</td>
                        </tr>
                        <tr>
                            <td class="name">Gói tin:</td>
                            <td><span style="color: #E13427;">Tin VIP nổi bật</span></td>
                        </tr>
                        <tr>
                            <td class="name">Ngày đăng:</td>
                            <td><time title="Thứ 4, 11:02 01/11/2023">${requestScope.post.startAt}</time></td>
                        </tr>
                        <tr>
                            <td class="name">Ngày hết hạn:</td>
                            <td><time title="Thứ 6, 11:02 10/11/2023">${requestScope.post.endAt}</time></td>
                        </tr>
                    </table>
                </div>
            </section>
            <div class="map">
                <h3><strong>Bản đồ</strong></h3>
                <address class="col-12"><span><i class="fas fa-map-marked-alt"></i> Địa chỉ: </span>
                    <span>${requestScope.post.addressDetail}, ${requestScope.post.wardName}, ${requestScope.post.districtName}, Đà Nẵng</span></address>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d54848.05382530855!2d108.17440819606561!3d16.040734114423124!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314219c792252a13%3A0xfc14e3a044436487!2zxJDDoCBO4bq1bmcsIEjhuqNpIENow6J1LCDEkMOgIE7hurVuZywgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1699037296428!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
            <div class="post-button">
                <c:choose>
                    <c:when test="${not empty sessionScope.currentUser}">
                        <div class="post-button">
                            <button type="button" class="view-button"><a href="contract">Đặt lịch hẹn</a></button>
                            <button type="button" class="contract-button"><a href="${pageContext.request.contextPath}/hopdong?id=${requestScope.post.id}">Tạo hợp đồng</a></button>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <button type="button" class="contract-button"><a class="header_user_nologin " href="${pageContext.request.contextPath}/signin" role="button">
                            <i class="fa-solid fa-right-to-bracket"></i> Đăng nhập để ký hợp đồng & đặt lịch hẹn
                        </a></button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="other col-3">
            <div class="user-infor container-fluid">
                <h1><strong>Được đăng bởi</strong></h1>
                <img src="${requestScope.user.imageName}" alt="${requestScope.user.username}" />
                <div class="infor-detail">
                    <h3 class="user-infor-name"><strong>${requestScope.user.fullname}</strong></h3>
                    <h5 class="user-infor-item">${requestScope.user.email}</h5>
                    <h5 class="user-infor-item">+84  ${requestScope.user.phoneNumber}</h5>
                </div>
            </div>
            <div class="other-post container-fluid">
                <h3 class="col-12"><b>Tin nổi bật</b></h3>
                <br>
                <div class="row container little-post">
                    <img class="col-3" src="https://tuvannhadep.com.vn/uploads/files/hinh-anh-nha-dep-8.jpg"
                         alt="nhaf khacs">
                    <div class="col-8 row container-fluid">
                        <div class="time-post col-6">
                            <p> <span class="time">${requestScope.post.startAt}</span> </p>
                        </div>
                        <span class="col-6 text-danger"><b>10000000đ</b></span>
                        <h1 class="col-12"><a href="">Nhà siêu đẹp</a></h1>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="_footer.jsp" %>
</body>
</html>
