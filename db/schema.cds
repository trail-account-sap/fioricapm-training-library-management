namespace cap.bookstore;

entity Books {
    key ID      : UUID;

        @assert.notNull
        @assert.unique
        book_id : Integer;
        isbn    : String;
        name    : String;
        author  : Association to Authors;
        stock   : Integer;
}

entity Authors {
    key ID      : UUID;
        name    : String;
        book    : Association to many Books
                      on book.author = $self;
        address : Composition of many Addresses
                      on address.author = $self;
}

entity Addresses {
    key ID      : UUID;
        author  : Association to Authors;
        type    : String;
        city    : String;
        state   : String;
        country : String;
}
