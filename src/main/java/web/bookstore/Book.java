package web.bookstore;

public class Book {
    private String name;
    private String author;
    private String description;
    private float price;

    public Book(String name, String author, String description, float price) {
        this.name = name;
        this.author = author;
        this.description = description;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public String getAuthor() {
        return author;
    }

    public String getDescription() {
        return description;
    }

    public float getPrice() {
        return price;
    }
}
