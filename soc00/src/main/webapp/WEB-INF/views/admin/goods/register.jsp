<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ǰ ���</title>
</head>
<body>
	<form role="form" method="post" autocomplete="off">

		<div class="inputArea">
			<label>1�� �з�</label> <select class="category">
				<option value="">��ü</option>
			</select>
		</div>

		<div class="inputArea">
			<label for="p_name">��ǰ��</label> <input type="text" id="p_name"
				name="p_name" />
		</div>

		<div class="inputArea">
			<label for="p_price">��ǰ����</label> <input type="text" id="p_price"
				name="p_price" />
		</div>

		<div class="inputArea">
			<label for="p_stock">��ǰ����</label> <input type="text" id="p_stock"
				name="p_stock" />
		</div>

		<div class="inputArea">
			<label for="p_content">��ǰ�Ұ�</label>
			<textarea rows="5" cols="50" id="p_content" name="p_content"></textarea>
		</div>

		<div class="inputArea">
			<button type="submit" id="register_Btn" class="btn btn-primary">���</button>
		</div>

	</form>

</body>
</html>