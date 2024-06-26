import app from './app.js';
import database from './config/dataBase.js';

const PORT = 3000;

database.connect((err) => {
    if (err) {
        console.error('Errore di connessione al database:', err);
        return;
    }
    console.log('Connessione al database avvenuta con successo!');
});

const server = app.listen(PORT, () => {
    console.log(`app is running on PORT https://localhost:${PORT}`);
});