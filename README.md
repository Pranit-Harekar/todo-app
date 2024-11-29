# Todo App - ASP.NET Core Backend Development

This repository is a practical demonstration of building robust and scalable backend applications using ASP.NET Core.

**Covered Concepts:**

- Implementing routes, redirects, custom middlewares, and endpoint filters
- Utilizing C# LINQ for data manipulation
- Leveraging dependency injection for loose coupling
- Connecting to relational databases
- Creating and applying version control code-first migrations
- Running migrations independently of container deployments
- Dockerizing the application
- Testing and documenting endpoints

**Technologies Used:**

- [ASP.NET Core 9.0](https://dotnet.microsoft.com/en-us/apps/aspnet)
- [Entity Framework Core 9](https://learn.microsoft.com/en-us/ef/core/)
- [MS SQL Server](https://learn.microsoft.com/en-us/sql/linux/sql-server-linux-overview?view=sql-server-ver16)

## Getting Started

This project is fully Dockerized for a quick and easy setup.

**Prerequisites:**

- .NET 9 SDK installed
- [Visual Studio Code with C# Dev Kit](https://code.visualstudio.com/docs/languages/dotnet)
  or [Visual Studio](https://visualstudio.microsoft.com/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

**Instructions:**

1. **Generate a [self-signed certificate](https://learn.microsoft.com/en-us/dotnet/core/additional-tools/self-signed-certificates-guide):**

   ```sh
   dotnet dev-certs https -ep ./https/TodoApi.pfx -p <CERT_PASSWORD>
   ```

   Replace `<CERT_PASSWORD>` with a desired password.

2. **Set environment variables:**

   Rename `.env.example` to `.env` and configure the following:

   - `CERT_PASSWORD`: Use the password created in step 1.
   - `DB_PASSWORD`: Set your database password.

3. Start the application:

   Ensure Docker Desktop is running, then execute:

   ```sh
   make up
   ```

   View test requests in the [TodoApi.http](./TodoApi/TodoApi.http).
   Alternatively, access the simple web page at the below URLs.

   - HTTPS: https://localhost:7200
   - HTTP: http://localhost:5126

## Migrations

**Creating Migrations:**

1. Navigate to the [./TodoApi](/TodoApi) directory in your terminal.

2. Install the EF Core CLI if not yet available:

   ```sh
   dotnet tool install --global dotnet-ef
   ```

3. Update your data models as needed.

4. Replace `DB_CONNECTION_STRING` in `.env` file with the following:

   ```txt
   DB_CONNECTION_STRING="Server=localhost,1433;Database=TodoDb;User Id=SA;Password=${DB_PASSWORD};TrustServerCertificate=True;"
   ```

5. Generate a new migration:

   ```sh
   dotnet ef migrations add <your-migration-name>
   ```

**Applying Migrations:**

Database migrations are automatically applied when the API container builds. To manually apply new migrations:

```sh
make db_migrate
```

## Next Steps

- Implement authentication
- Allow sharing of todos
- Document architecture
- Integrate Kubernetes
- Deploy to Azure

Feel free to create an issue if you have any questions or suggestions.

## License

MIT
