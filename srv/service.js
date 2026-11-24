const cds = require('@sap/cds');

const { Books } = cds.entities;

module.exports = (srv) => {
    const db = cds.db;
    srv.on('deleteBook', async (req) => {
        try {
            console.log(req.user);
            console.log(req.data.book_id);
            if (req.data.book_id) {
                const book = await db.run(
                    SELECT.from('Books').where({ book_id: req.data.book_id })
                )
                if (book.length > 0) {
                    const res = await db.run(
                        DELETE.from(Books).where({ book_id: req.data.book_id })
                    )
                    return `Book with id - ${req.data.book_id} has been deleted successfully`
                }
                else {
                    return req.reject(400, `No book exist with id '${req.data.book_id}`);
                }
            } else {
                return req.error(400, 'Book Id is required to delete a book');
            }
        } catch (err) {
            return req.reject(500, `Internal Server Error, message : ${err.message}`);
        }

    })
}