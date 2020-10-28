<%@page import="java.sql.*"%>
<%@page import="config.Conexao"%>
<%@page import="com.mysql.jdbc.Driver"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Login</title>
   <!--Made with love by Mutiullah Samim -->
        <link href="css/estilo.css" rel="stylesheet">
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css">
        
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
            <%     
                Statement st = null;
                ResultSet rs = null;
             %>
<body>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Login</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><i class="fab fa-facebook-square"></i></span>
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span>
				</div>
			</div>
			<div class="card-body">
				<form>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" name="usuario" placeholder="email">
						
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
                                            <input type="password" class="form-control" name="senha" placeholder="senha">
					</div>
					<div class="row align-items-center remember">
						<input type="checkbox">Remember Me
					</div>
					<div class="form-group">
						<input type="submit" value="Login" class="btn float-right login_btn">
					</div>
				</form>

                       <%
                          String user = request.getParameter("usuario"); 
                          String pass = request.getParameter("senha"); 
                          String nomeUsuario = "";
                          String usuario = "";
                          String senha = "";
                          
                          int i = 0;


                          try{
                          st = new Conexao().conectar().createStatement();
                          rs = st.executeQuery("SELECT * FROM usuarios WHERE email = '"+user+"' and senha= '"+pass+"'");
                          while (rs.next()){
                             // out.println(rs.getString(2));
                             usuario = rs.getString(3);
                             senha = rs.getString(4);
                             nomeUsuario = rs.getString(2);
                             rs.last();
                             i = rs.getRow();
                          }
                          } catch (Exception e){
                              out.println(e);
                          }
                          
                          if((user == null) || (pass == null)){
                              out.println("Preencha os dados");
                          } else{
                              if(i>0){
                                  session.setAttribute("nomeUsuario", nomeUsuario);
                                  response.sendRedirect("usuarios.jsp");
                              }
                          }
                        %>
			</div>
                    
		</div> 
	</div> 
</div>
</body>
</html>