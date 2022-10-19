<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- Tag lib para fazer referencia aos imports do jar da pasta lib -->
<!-- O core � para usar fun�oes de decis�o, case, fluxos de decis�o etc e como prefixo � tipo um alias ou ate mesmo um IntelliSense pra chamar o core, colocamos o c  -->    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- O sql � para fazer a conex�o com o banco e pegar os elementos   --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- Esse � o recurso do JSTL, conseguir usar codigo java, sem precisar passar o java, mas sim em HTML -->
	
	<!-- Quando carregar a pagina eu carrego essa seguinte instru��o: -->
	<!-- 
	
	var = um atributo de nome pra tudo que eu prcisar referente a essa conex�o eu trabalho com esse elemento
	Driver = que � que vai conectar ao banco. Pra cada banco de dados tem um driver expecifico e jar do mysql tem haver com esse driver colocado aqui.
			O var tem a ver com o drive e arquivo jar, porque esse nome tem rela��o com esse drive. Ou seja n�o qualquer nome e nem qualquer driver
	
	Url = a onde esta o banco, no nosso caso estamos com o banco localmente e por padr�o na instala�ao do mysql ele coloca na porta 3306 e o nome do banco de dados que � pra se conectar
	useSSL=false e &serverTimezone=UTC � uma instru�ao para evitar problema de autentica�ao
	
	user e password = dados de login ao banco que foi configurado na IDE workbrench
	-->
	<sql:setDataSource 
		var="snapshot" 
		driver="com.mysql.jdbc.Driver" 
		url="jdbc:mysql://localhost:3306/contato?useSSL=false&serverTimezone=UTC" 
		user="root" password="admin"
	/>
	
	<!-- Banco selecionado, agora iremos fazer uma query e o var � a onde iremos guardar a query feita -->
	<!-- Evitar de usar o * para fazer query no banco de dados, pois pesa muito --> <!-- select id, nome, email from agenda -->
	<!-- nao pode escrever comentarios na query -->
	<sql:query dataSource="${snapshot}" var="result">
		select * from agenda 
	</sql:query>
	
	<table border="1" width="100%" >
		<tr>
			<th>Id empregado</th>
			<th>Funcionario</th>
			<th>E-mail</th>
			<!-- o rows vai percorrer e guardar cada linha do resultado da query na variavel registro, que � um objeto do tipo row do sql -->
			<c:forEach var="registro" items="${result.rows}">
				<tr>
					<td><c:out value="${registro.id}"/></td>
					<td><c:out value="${registro.nome}"/></td>
					<td><c:out value="${registro.email}"/></td>
				</tr>
			</c:forEach>
		</tr>
	</table>
	
</body>
