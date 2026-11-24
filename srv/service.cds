using {cap.bookstore as db} from '../db/schema';

service LibraryService {
    @restrict: [
        {
            grant: 'READ',
            to   : 'User'
        },
        {
            grant: '*',
            to   : 'Admin'
        }
    ]
    entity Books     as projection on db.Books;

    entity Authors   as projection on db.Authors;
    entity Addresses as projection on db.Addresses;

    @requires: 'Admin'
    action deleteBook(book_id: Integer) returns String;
}
