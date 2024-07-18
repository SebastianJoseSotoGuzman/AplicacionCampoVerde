

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Pasarela de Pago </title>
    <link rel="stylesheet" href="css/pasarela.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
    <div class="container">
            <form action="ProcesarPagoServlet" method="post">
            <div class="row">
                <div class="column">
                    <h3 class="title">Dirección de Facturación</h3>
                    <div class="input-box">
                        <span>Nombre Completo:</span>
                        <input type="text" placeholder="Jacob Aiden" name="full_name" required > 
                    </div>
                    <div class="input-box">
                        <span>Email:</span>
                        <input type="email" placeholder="example@example.com" name="email" required>
                    </div>
                    <div class="input-box">
                        <span>Dirección:</span>
                        <input type="text" placeholder="Room - Street Locality" name="address" required>
                    </div>
                    <div class="input-box">
                        <span>Ciudad:</span>
                        <input type="text" placeholder="Ica" name="city" required>
                    </div>
                    <div class="flex">
                        <div class="input-box">
                            <span>Estado:</span>
                            <input type="text" placeholder="Ica" name="state" required>
                        </div>
                        <div class="input-box">
                            <span>Código Postal:</span>
                            <input type="number" placeholder="123456" name="postal_code" required>
                        </div>
                    </div>
                </div>
                <div class="column">
                    <h3 class="title">Pago</h3>
                    <div class="input-box">
                        <span>Tarjeta Aceptada:</span>
                        <img src="img/imgcards.png" alt="Accepted Cards" id="cardImage" required>
                    </div>
                    <div class="input-box">
                        <span>Nombre en la Tarjeta:</span>
                        <input type="text" placeholder="Mr. Jacob Aiden" name="card_name" required>
                    </div>
                    <div class="input-box">
                        <span>Número de la Tarjeta:</span>
                        <input type="text" placeholder="1111 2222 3333 4444" name="card_number" required>
                    </div>
                    <div class="input-box">
                        <span>Mes de Expiración:</span>
                        <input type="text" placeholder="Agosto" name="exp_month" required>
                    </div>
                    <div class="flex">
                        <div class="input-box">
                            <span>Expiración:</span>
                            <input type="number" placeholder="2025" name="exp_year" required>
                        </div>
                        <div class="input-box">
                            <span>CVV:</span>
                            <input type="number" placeholder="123" name="cvv" required>
                        </div>
                    </div>
                </div>
            </div>
            <button type="submit" class="btn">Enviar</button>
        </form>
    </div>

    <!-- Modal -->
    <div id="paymentModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <div class="title">
                <h4>Select a <span style="color: #6064b6">Payment</span> method</h4>
            </div>
            <form action="#">
                <input type="radio" name="payment" id="visa">
                <input type="radio" name="payment" id="mastercard">
                <input type="radio" name="payment" id="paypal">
                <input type="radio" name="payment" id="AMEX">
                <div class="category">
                    <label for="visa" class="visaMethod">
                        <div class="imgName">
                            <div class="imgContainer visa">
                                <img src="https://i.ibb.co/vjQCN4y/Visa-Card.png" alt="Visa">
                            </div>
                            <span class="name">VISA</span>
                        </div>
                        <span class="check"><i class="fa-solid fa-circle-check" style="color: #6064b6;"></i></span>
                    </label>
                    <label for="mastercard" class="mastercardMethod">
                        <div class="imgName">
                            <div class="imgContainer mastercard">
                                <img src="https://i.ibb.co/vdbBkgT/mastercard.jpg" alt="Mastercard">
                            </div>
                            <span class="name">Mastercard</span>
                        </div>
                        <span class="check"><i class="fa-solid fa-circle-check" style="color: #6064b6;"></i></span>
                    </label>
                    <label for="paypal" class="paypalMethod">
                        <div class="imgName">
                            <div class="imgContainer paypal">
                                <img src="https://i.ibb.co/KVF3mr1/paypal.png" alt="Paypal">
                            </div>
                            <span class="name">Paypal</span>
                        </div>
                        <span class="check"><i class="fa-solid fa-circle-check" style="color: #6064b6;"></i></span>
                    </label>
                    <label for="AMEX" class="amexMethod">
                        <div class="imgName">
                            <div class="imgContainer AMEX">
                                <img src="https://i.ibb.co/wQnrX86/American-Express.jpg" alt="AMEX">
                            </div>
                            <span class="name">Interbank</span>
                        </div>
                        <span class="check"><i class="fa-solid fa-circle-check" style="color: #6064b6;"></i></span>
                    </label>
                </div>
            </form>
        </div>
    </div>

    <script src="js/modal.js"></script>
</body>

</html>
