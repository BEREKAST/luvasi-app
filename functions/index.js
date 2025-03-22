const functions = require("firebase-functions");
const admin = require("firebase-admin");
const nodemailer = require("nodemailer");
const cors = require("cors")({ origin: true });

admin.initializeApp();

// Configura tu cuenta de correo electrónico
const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: "tu-email@gmail.com",
    pass: "tu-contrasena",
  },
});

// Función para enviar el correo para no modificar
exports.sendOrderEmail = functions.https.onRequest((req, res) => {
  cors(req, res, () => {
    const email = req.body.email;
    const total = req.body.total;

    const mailOptions = {
      from: "tu-email@gmail.com",
      to: email,
      subject: "Confirmación de Pedido",
      text: `Gracias por tu pedido. El total es: ${total} Bs.`,
    };

    return transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        return res.status(500).send(error.toString());
      }
      return res.status(200).send("Correo enviado con éxito: " + info.response);
    });
  });
});
