<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품 등록</title>
</head>
<body>
	<form role="form" method="post" autocomplete="off">

		<div class="inputArea">
			<label>1차 분류</label> <select class="category">
				<option value="">전체</option>
			</select>
		</div>

		<div class="inputArea">
			<label for="p_name">상품명</label> <input type="text" id="p_name"
				name="p_name" />
		</div>

		<div class="inputArea">
			<label for="p_price">상품가격</label> <input type="text" id="p_price"
				name="p_price" />
		</div>

		<div class="inputArea">
			<label for="p_stock">상품수량</label> <input type="text" id="p_stock"
				name="p_stock" />
		</div>

		<div class="inputArea">
			<label for="p_content">상품소개</label>
			<textarea rows="5" cols="50" id="p_content" name="p_content"></textarea>
		</div>

		<div class="inputArea">
			<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
		</div>

	</form>

</body>
</html>