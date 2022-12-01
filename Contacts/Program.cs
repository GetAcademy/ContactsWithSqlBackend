using System.Data.SqlClient;
using System.Text.Json;
using Contacts.Model;
using Dapper;

var connStr = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Contacts;Integrated Security=True";
var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();
app.UseHttpsRedirection();
app.UseStaticFiles();


app.MapGet("/people", async () =>
{
    var conn = new SqlConnection(connStr);
    var sql = "SELECT * FROM Contacts";
    var contacts = await conn.QueryAsync<Person>(sql);
    return contacts;

});
app.MapDelete("/people/{id}", async (Guid id) =>
{
    var conn = new SqlConnection(connStr);
    var obj = new { Id = id };
    var deleteSql = "DELETE FROM Contacts WHERE Id = @Id";
    var rowsAffected = await conn.ExecuteAsync(deleteSql, obj);
    return rowsAffected;

});
app.MapPost("/people", (Person person) =>
{
    var conn = new SqlConnection(connStr);
    var insertIntoSql = "INSERT INTO Contacts (Id, FirstName, Email) VALUES (@Id, @FirstName, @Email)";
    var rowsAffected = conn.Execute(insertIntoSql, person);
});
app.MapPut("/people", (Person person) =>
{
    var conn = new SqlConnection(connStr);
    var updateSql = "UPDATE Contacts SET Email = @Email, FirstName = @FirstName WHERE Id = @Id";
    var rowsAffected2 = conn.Execute(updateSql, person);
});
app.Run();

/*
    var createOrUpdate = (Person person) =>
    {
        var json = JsonSerializer.Serialize(person);
        File.WriteAllText("people/" + person.Id.ToString() + ".json", json);
    };
    app.MapPost("/people", createOrUpdate);
    app.MapPut("/people", createOrUpdate); 
 */


/*
    var builder = WebApplication.CreateBuilder(args);
    var app = builder.Build();
    app.UseHttpsRedirection();
    app.UseStaticFiles();

    var people = new List<Person>{
        new Person ("Per", "per@mail.com"),
        new Person ("Pål", "pål@mail.com"),
        new Person ("Espen", "espen@mail.com"),
        new Person ("Terje", "terje@mail.com"),
    };

    app.MapGet("/people", () =>
    {
        return people;
    });
    app.MapDelete("/people/{id}", (Guid id) =>
    {
        people = people.Where(p => p.Id != id).ToList();
    });
    app.MapPost("/people", (Person person) =>
    {
        people.Add(person);
    });
    app.MapPut("/people", (Person person) =>
    {
        var thePerson = people.SingleOrDefault(p => p.Id == person.Id);
        thePerson.FirstName = person.FirstName;
        thePerson.Email = person.Email;
    });
    app.Run();
*/ 