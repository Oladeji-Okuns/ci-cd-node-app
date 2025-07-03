const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware for logging requests
app.use((req, res, next) => {
  console.log(`[${new Date().toISOString()}] ${req.method} ${req.url}`);
  next();
});

// Test route
app.get('/api/test', (req, res) => {
  res.json({ message: 'Test route is working!' });
});

// Root route
app.get('/', (req, res) => {
  res.send('Hello from CI/CD Node.js App!');
});

// Error handling middleware
app.use((err, req, res, next) => {
  console.error('Unhandled Error:', err);
  res.status(500).json({ error: 'Something went wrong!' });
});

app.listen(PORT, () => {
  console.log(`✅ App listening at http://localhost:${PORT}`);
});

