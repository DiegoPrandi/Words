const express = require("express");
const fs = require("fs");
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware para permitir JSON
app.use(express.json());
app.use(express.static("public"));

// Carregar palavras do arquivo JSON
const words = JSON.parse(fs.readFileSync("words.json", "utf-8"));

// Rota para verificar a palavra
app.post("/check-word", (req, res) => {
  const guess = req.body.guess;
  const isValid = words.includes(guess.toLowerCase());
  if (isValid) {
    res.json({ message: "Palavra válida!" });
  } else {
    res.json({ message: "Palavra inválida!" });
  }
});

// Iniciar o servidor
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
