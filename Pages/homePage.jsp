<%
    session.setMaxInactiveInterval(60 * 60); // Set session timeout to 1 hour (optional)

    String state = request.getParameter("state");
    if (state != null) {
        switch (state) {
            case "1":
                out.println("<script>alert('You are not authorized yet');</script>");
                break;
            case "2":
                out.println("<script>alert('You are not authorized yet');</script>");
                break;
            case "3":
                out.println("<script>alert('You don't have access to this page.');</script>");
                break;
            case "4":
                out.println("<script>alert('An error occurred!');</script>");
                break;
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap.css">
    <link rel="stylesheet" href="homePage.css">
    <title>Home Page</title>
</head>
<body>
    <div class="body">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Home Page</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01"
                    aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarColor01">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Home
                                <span class="visually-hidden">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <!-- <a class="nav-link" href="#">Features</a> -->
                            <a class="nav-link" href="#down">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#idservices">Our services</a>
                        </li>
                        <% 
                        if (session.getAttribute("login") != null) {
                        %>
                            <li class="buttons2"><a href="Redirection.jsp"><img class="account-icon" src="user-icon.png"></a><a href="logout.jsp"><img class="logout-icon" src="logout.png"></a></li>
                        <%
                        } else {
                        %>
                            <li class="buttons"><a href="PgLogin.jsp"><button type="button" class="btn btn-outline-light">Login</button></a><a href="PgRegister.jsp"><button type="button" class="btn btn-outline-light">Sign-in</button></a></li>
                        <%
                            session.invalidate();
                        }
                        %>

                    </ul>
                </div>
            </div>
        </nav>
        <br>
        <br>
        <br>
        <div class="banner">
            <h1>My Pet's Hair Salon</h1>
            <h3>The best place to cut & wash your pets.</h3>
            <a href="PgReservation.jsp"><button type="button" class="btn btn-outline-primary">Schedule An
                    Appointment!</button></a>
        </div>
    </div>
    <div class="about-us" id="down">
        <br><br><br>
        <h2>About us</h2>
        <div class="main-section">
            <p class="mb-0">
                We provide top-quality grooming services for your furry friends in a comfortable and calming
                environment.
                Our experienced groomers offer personalized attention and a range of services, from bathing and brushing
                to haircuts and nail trims, all aimed at making your pet look and feel their best. Come visit us and
                experience the difference our expert grooming can make for your beloved pet.
            </p>
            <img src="cats-and-dogs.jpg" class="abtUsImg">
        </div>
    </div>
    <div class="services">
        <h2>Our services</h2>
        <div class="service-section" id="idservices">
            <div class="service-box toast-body">
                <img src="diy-tips-to-bathe-your-cat.jpg" class="cat-wash">
                <button type="button" class="btn btn-primary">Wash</button>
            </div>
            <div class="service-box toast-body">
                <img src="dog-cut.png" class="dog-cut">
                <button type="button" class="btn btn-primary">Cut</button>
            </div>
        </div>
    </div>
    <h1 class="heading" style="margin:30px; margin-left:100px;"> Our location </h1>
    <section class="contact" id="contact">
        <div class="row">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3064.2558156862706!2d-7.490529188499693!3d39.82368179140217!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd3d5c299763e2ad%3A0xf22a9faa975a4b94!2sIdealPet%20-%20Andreia%20Nabais!5e0!3m2!1sen!2spt!4v1685205888815!5m2!1sen!2spt"
                width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"></iframe>

        </div>


    </section>

    <footer class="footer">
        <div class="footer-content">
            <div class="info">
                <div class="salon-info">
                    <h2>Pets' Hair Saloon</h2>
                    <p>R. Prior Vasconcelos 34, 6000-247 Castelo Branco</p>
                    <p>Phone: 123-456-7890</p>
                    <p>Everyday: 9am - 6:00pm</p>
                </div>
                <div class="img">
                    <img src="../Pages/paw.png">
                </div>
            </div>
        </div>
        <p class="copyright">&copy; 2023 Pets' Hair Saloon. All rights reserved.</p>
    </footer>


</body>

</html>