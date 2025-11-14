const express = require('express');
const app = express();
const PORT = 3000;

// Example version flag
const version = "v2.0 - Green Deployment";

app.get('/', (req, res) => {
  res.send(`<h1>Blue-Green Deployment</h1><p>Node.js App — ${version}</p>`);
});

app.listen(PORT, () => {
  console.log(`App running on port ${PORT}`);
});

