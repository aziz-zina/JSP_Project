<%@ page import="java.sql.*" %>
<%
out.println(session.getAttribute("login"));
                out.println(request.getParameter("idClient"));
                out.println(request.getParameter("time"));
                out.println(request.getParameter("date"));
                out.println(request.getParameter("pet"));
                out.println(request.getParameter("service"));
    session.setMaxInactiveInterval(60 * 60); // Set session timeout to 1 hour (optional)
    if (session.getAttribute("login") != null && request.getParameter("idClient") != null && request.getParameter("date") != null
            && request.getParameter("time") != null && request.getParameter("pet") != null && request.getParameter("service") != null) {
                out.println(session.getAttribute("login"));
                out.println(request.getParameter("idClient"));
                out.println(request.getParameter("time"));
                out.println(request.getParameter("date"));
                out.println(request.getParameter("pet"));
                out.println(request.getParameter("service"));
            }
        /*if (request.getParameter("idReservation") != null) {
            idReservation = request.getParameter("idReservation");
        }
        user = request.getParameter("idClient");
        if (session.getAttribute("function").equals("4")) {
            response.sendRedirect("homePage.jsp?state=1");
        } else {
            date = request.getParameter("date");
            time = request.getParameter("time");
            pet = request.getParameter("pet");
            String[] services = request.getParameterValues("service");
            if (services.length == 1) {
                srv = services[0];
            } else if (services.length == 2) {
                srv = "Both";
            } else {
                response.setHeader("Refresh", "2;url=PgReservation.jsp?state=2");
                return;
            }
        }else {
        response.sendRedirect("PgReservation.jsp?state=1");
    }*/
%>
