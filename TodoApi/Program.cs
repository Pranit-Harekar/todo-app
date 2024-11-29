using Microsoft.AspNetCore.Rewrite;
using Microsoft.EntityFrameworkCore;
using TodoApi.Models;

var builder = WebApplication.CreateBuilder(args);

// -- Add services to the container

builder.Services.AddControllers();

var connectionString = Environment.GetEnvironmentVariable("DB_CONNECTION_STRING");
builder.Services.AddDbContext<TodoContext>(x => x.UseSqlServer(connectionString));

builder.Services.AddOpenApi();

// -- Build app

var app = builder.Build();

// -- Middlewares

app.UseRewriter(new RewriteOptions().AddRedirect("api/tasks/(.*)", "api/todoItems/$1"));

app.Use(async (context, next) =>
{
    Console.WriteLine($"[{context.Request.Method} {context.Request.Path} {DateTime.UtcNow}] Started.");
    await next(context);
    Console.WriteLine($"[{context.Request.Method} {context.Request.Path} {DateTime.UtcNow}] Finished.");
});

if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}

app.UseDefaultFiles();

app.UseStaticFiles();

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
