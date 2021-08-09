<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품등록</title>
</head>
<body>
	
	
	
	
	<!-- 인터넷 교재 -->
	
	
	
	
	
	
	<p class="addToCart">
		<button type="button" class="addCart_btn">카트에 담기</button>
		<script>
			$(".addCart_btn").click(function() {
				var p_no = $("#p_no").val();
				var c_count = $(".numBox").val();

				var data = {
					p_no : p_no,
					c_count : c_count
				};

				$.ajax({
					url : "/shop/shopView/addCart",
					type : "post",
					data : data,
					success : function(result) {

						if (result == 1) {
							alert("카트 담기 성공");
							$(".numBox").val("1");
						} else {
							alert("회원만 사용할 수 있습니다.")
							$(".numBox").val("1");
						}
					},
					error : function() {
						alert("카트 담기 실패");
					}
				});
			});
		</script>
</body>
</html>