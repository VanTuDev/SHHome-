<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Thanh toán</title>
    <style>
        #countdown {
            background-color: #007BFF;
            color: #FFFFFF;
            text-align: center;
            padding: 10px;
        }

        #countdownValue {
            font-size: 2rem;
        }

        #qrCodeImage {
            max-width: 100%;
            display: block;
            margin: 0 auto;
        }

    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            let countdownSeconds = 900;
            updateCountdown();
            const countdownInterval = setInterval(function () {
                countdownSeconds--;
                updateCountdown();
                if (countdownSeconds <= 0) {
                    regenerateQRCode();
                    countdownSeconds = 900;
                }
            }, 1000);

            function updateCountdown() {
                const minutes = Math.floor(countdownSeconds / 60);
                const seconds = countdownSeconds % 60;
                const countdownText = minutes + " phút " + seconds + " giây";
                $("#countdown").text("Thời gian còn lại: " + countdownText);
            }

        });
        $(document).ready(function() {
            let countdownSeconds = 900;
            updateCountdown();
            const countdownInterval = setInterval(function () {
                countdownSeconds--;
                updateCountdown();
                if (countdownSeconds <= 0) {
                    regenerateQRCode();
                    countdownSeconds = 900;
                }
            }, 1000);

            function updateCountdown() {
                const minutes = Math.floor(countdownSeconds / 60);
                const seconds = countdownSeconds % 60;
                const countdownText = minutes + " phút " + seconds + " giây";
                $("#countdown").text("Thời gian còn lại: " + countdownText);
            }

            trySendDataToGoogle();
        });

        function trySendDataToGoogle() {
            const payingId = $("#payingId").val();
            const description = $("#description").val();

            if (payingId !== "" && description !== "") {
                sendDataToGoogle(payingId, description);
            }
        }

        function sendDataToGoogle(payingId, description) {
            const dataToSend = {
                payingId: payingId,
                description: description
            };

            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath}/googleapi',
                data: dataToSend,
                success: function(response) {
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            });
        }


    </script>


</head>
<body>
<a href="${pageContext.request.contextPath}/googleapi">Xem lich su giao dich</a>
<div id="countdown" style="background-color: #007BFF; color: #FFFFFF; text-align: center; padding: 10px;">
    <h4>Thời gian còn lại:</h4>
    <span id="countdownValue" style="font-size: 2rem;"></span>
</div>
<div class="">Quý khách vui lòng không tắt trình duyệt cho đến khi nhận được kết quả giao dịch trên website.
    Trường hợp đã thanh toán nhưng chưa nhận kết quả giao dịch, vui lòng bấm "Tại đây" để nhận kết quả.
    Xin cảm ơn!</div>
<img id="qrCodeImage" src="${requestScope.qrdataURL}" alt="${requestScope.qrdataURL}" style="max-width: 100%; display: block; margin: 0 auto;">
<input type="hidden" value="${requestScope.randomId}">
<p>Vui lòng thanh toán và đặt mô tả theo cú pháp sau để hệ thống xác nhận đơn : <span>${requestScope.randomDescription}</span></p>

<form action="" id = "myform">
    <input id="payingId" type="hidden" name="payingId" value="${requestScope.payingId}">
    <input id="description" type="hidden" name="randomDescription" value="${requestScope.randomDescription}">

</form>
<c:if test="${not empty requestScope.successMessage}">
    <div class="alert alert-success mb-3" role="alert">
            ${requestScope.successMessage}
    </div>
</c:if>

</body>
</html>
