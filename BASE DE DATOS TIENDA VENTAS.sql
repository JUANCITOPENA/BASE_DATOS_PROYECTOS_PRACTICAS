-- Crear la base de datos
CREATE DATABASE VentasDB;
GO

-- Usar la base de datos creada
USE VentasDB;
GO



-- Crear la tabla de Dimensión: Productos
CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Categoria NVARCHAR(50) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL
);
GO

-- Crear la tabla de Dimensión: Vendedores
CREATE TABLE Vendedores (
    VendedorID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL
);
GO

-- Crear la tabla de Dimensión: Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL
);
GO

-- Crear la tabla de Dimensión: Ubicaciones
CREATE TABLE Ubicaciones (
    UbicacionID INT PRIMARY KEY IDENTITY(1,1),
    Ciudad NVARCHAR(100) NOT NULL,
    Pais NVARCHAR(100) NOT NULL
);
GO

-- Crear la tabla de Hechos: Ventas
CREATE TABLE Ventas (
    VentaID INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATE NOT NULL,
    ProductoID INT NOT NULL,
    VendedorID INT NOT NULL,
    ClienteID INT NOT NULL,
    UbicacionID INT NOT NULL,
    Cantidad INT NOT NULL,
    MontoTotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID),
    FOREIGN KEY (VendedorID) REFERENCES Vendedores(VendedorID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (UbicacionID) REFERENCES Ubicaciones(UbicacionID)
);
GO
-- Insertar registros en la tabla de Productos
INSERT INTO Productos (Nombre, Categoria, Precio) VALUES
('Laptop Dell', 'Electrónica', 800.00),
('Smartphone Samsung', 'Electrónica', 600.00),
('Televisor LG', 'Electrónica', 1200.00),
('Auriculares Sony', 'Accesorios', 150.00),
('Reloj Garmin', 'Accesorios', 250.00),
('Tablet Apple', 'Electrónica', 500.00),
('Cámara Canon', 'Fotografía', 900.00),
('Impresora HP', 'Oficina', 300.00),
('Monitor ASUS', 'Electrónica', 400.00),
('Teclado Logitech', 'Accesorios', 100.00);
GO


-- Crear la tabla Imagenes
CREATE TABLE Imagenes (
    ImagenID INT PRIMARY KEY IDENTITY(1,1),
    ProductoID INT,
    URL NVARCHAR(255),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);
GO


--===========================================================================================
--TAREA DE USTEDES BUSCAR E INSERTAR LAS IMAGENES DE CADA PRODCUTO CON FORMATO TRANSPARENTE
--===========================================================================================


-- Insertar datos en la tabla Imagenes
INSERT INTO Imagenes (ProductoID, URL)
VALUES 
(1, 'https://dataimport.com/wp-content/uploads/2022/11/My-project-1-2022-11-11T133558.807-600x600.png'),
(2, 'https://img.global.news.samsung.com/co/wp-content/uploads/2023/10/Samsung_-Galaxy-M34Silver_Front-e1697120301129.png'),
(3, 'https://amazonas-store.com/wp-content/uploads/2023/11/Captura_de_pantalla_2024-05-10_144414-removebg-preview.png'),
(4, 'https://www.sony.com.do/image/dd18cf93606d238305a733d336c45537?fmt=png-alpha&wid=660&hei=660'),
(5, 'https://static.garmincdn.com/en_US/store/wearables/subcategory/2023/51901-wearables-banner-FR965.png'),
(6, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJI_GcdXifEhDPgnMagGRqCJLfHYGBCUVXgw&s'),
(7, 'https://i1.adis.ws/i/canon/eos_750d-ef-s18-135stm-frt_2607404232a34a8a9773201999d7a859'),
(8, 'https://ssl-product-images.www8-hp.com/digmedialib/prodimg/lowres/c08082426.png'),
(9, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMSpHacp2JQ4BsxCN7zrCiap06PMPVXbrTVg&s'),
(10, 'https://www.cybermarket.pe/wp-content/uploads/2023/10/Logitech-G-Pro-1.png');
GO

-- Insertar registros en la tabla de Vendedores
INSERT INTO Vendedores (Nombre, Email) VALUES
('Juan Pérez', 'juan.perez@example.com'),
('María López', 'maria.lopez@example.com'),
('Carlos García', 'carlos.garcia@example.com'),
('Ana Torres', 'ana.torres@example.com'),
('Luis Fernández', 'luis.fernandez@example.com');
GO

-- Insertar registros en la tabla de Clientes
INSERT INTO Clientes (Nombre, Email) VALUES
('Pedro Sánchez', 'pedro.sanchez@example.com'),
('Laura Martínez', 'laura.martinez@example.com'),
('Jorge Ramírez', 'jorge.ramirez@example.com'),
('Sofía Díaz', 'sofia.diaz@example.com'),
('Fernando Ruiz', 'fernando.ruiz@example.com');
GO

-- Insertar registros en la tabla de Ubicaciones
INSERT INTO Ubicaciones (Ciudad, Pais) VALUES
('Madrid', 'España'),
('Barcelona', 'España'),
('Lima', 'Perú'),
('Buenos Aires', 'Argentina'),
('Santiago', 'Chile');
GO

-- Insertar registros en la tabla de Hechos: Ventas
INSERT INTO Ventas (Fecha, ProductoID, VendedorID, ClienteID, UbicacionID, Cantidad, MontoTotal) VALUES
('2024-01-01', 1, 1, 1, 1, 2, 1600.00),
('2024-01-02', 2, 2, 2, 2, 1, 600.00),
('2024-01-03', 3, 3, 3, 3, 1, 1200.00),
('2024-01-04', 4, 4, 4, 4, 5, 750.00),
('2024-01-05', 5, 5, 5, 5, 3, 750.00),
('2024-01-06', 6, 1, 1, 1, 4, 2000.00),
('2024-01-07', 7, 2, 2, 2, 2, 1800.00),
('2024-01-08', 8, 3, 3, 3, 1, 300.00),
('2024-01-09', 9, 4, 4, 4, 1, 400.00),
('2024-01-10', 10, 5, 5, 5, 10, 1000.00),
('2024-01-11', 1, 1, 1, 1, 3, 2400.00),
('2024-01-12', 2, 2, 2, 2, 2, 1200.00),
('2024-01-13', 3, 3, 3, 3, 1, 1200.00),
('2024-01-14', 4, 4, 4, 4, 4, 600.00),
('2024-01-15', 5, 5, 5, 5, 2, 500.00),
('2024-01-16', 6, 1, 1, 1, 3, 1500.00),
('2024-01-17', 7, 2, 2, 2, 1, 900.00),
('2024-01-18', 8, 3, 3, 3, 1, 300.00),
('2024-01-19', 9, 4, 4, 4, 1, 400.00),
('2024-01-20', 10, 5, 5, 5, 5, 500.00),
('2024-01-21', 1, 1, 1, 1, 2, 1600.00),
('2024-01-22', 2, 2, 2, 2, 1, 600.00),
('2024-01-23', 3, 3, 3, 3, 1, 1200.00),
('2024-01-24', 4, 4, 4, 4, 5, 750.00),
('2024-01-25', 5, 5, 5, 5, 3, 750.00),
('2024-01-26', 6, 1, 1, 1, 4, 2000.00),
('2024-01-27', 7, 2, 2, 2, 2, 1800.00),
('2024-01-28', 8, 3, 3, 3, 1, 300.00),
('2024-01-29', 9, 4, 4, 4, 1, 400.00),
('2024-01-30', 10, 5, 5, 5, 10, 1000.00);
GO

-- Crear vista: Detalles de ventas por cliente y producto
CREATE VIEW VistaDetallesVentas AS
SELECT 
    c.Nombre AS NombreCliente,
    p.Nombre AS NombreProducto,
    v.Cantidad,
    v.MontoTotal
FROM 
    Ventas v
INNER JOIN 
    Clientes c ON v.ClienteID = c.ClienteID
INNER JOIN 
    Productos p ON v.ProductoID = p.ProductoID;
GO

-- Seleccionar todos los registros de la vista de detalles de ventas
SELECT * FROM VistaDetallesVentas;
GO

-- Crear vista: Ventas totales por país
CREATE VIEW VistaVentasPorPais AS
SELECT 
    u.Pais,
    SUM(v.MontoTotal) AS VentasTotales
FROM 
    Ventas v
INNER JOIN 
    Ubicaciones u ON v.UbicacionID = u.UbicacionID
GROUP BY 
    u.Pais;
GO

-- Seleccionar todos los registros de la vista de ventas por país
SELECT * FROM VistaVentasPorPais;
GO

-- Crear vista: Detalles de ventas combinando todas las tablas
CREATE VIEW VistaDetallesCompletos AS
SELECT 
    v.VentaID,
    v.Fecha,
    c.Nombre AS NombreCliente,
    ven.Nombre AS NombreVendedor,
    p.Nombre AS NombreProducto,
    v.Cantidad,
    v.MontoTotal,
    u.Ciudad,
    u.Pais
FROM 
    Ventas v
INNER JOIN 
    Clientes c ON v.ClienteID = c.ClienteID
INNER JOIN 
    Vendedores ven ON v.VendedorID = ven.VendedorID
INNER JOIN 
    Productos p ON v.ProductoID = p.ProductoID
INNER JOIN 
    Ubicaciones u ON v.UbicacionID = u.UbicacionID;
GO

-- Seleccionar todos los registros de la vista de detalles completos
SELECT * FROM VistaDetallesCompletos;
GO



-- Crear vista: Detalles de ventas combinando todas las tablas
CREATE VIEW VistaDetallesCompletos_Imagenes AS
SELECT 
    v.VentaID,
    v.Fecha,
    c.Nombre AS NombreCliente,
    ven.Nombre AS NombreVendedor,
    p.Nombre AS NombreProducto,
    v.Cantidad,
    v.MontoTotal,
    u.Ciudad,
    u.Pais,
	I.URL
FROM 
    Ventas v
INNER JOIN 
    Clientes c ON v.ClienteID = c.ClienteID
INNER JOIN 
    Vendedores ven ON v.VendedorID = ven.VendedorID
INNER JOIN 
    Productos p ON v.ProductoID = p.ProductoID
INNER JOIN 
    Ubicaciones u ON v.UbicacionID = u.UbicacionID
INNER JOIN 
    Imagenes I ON P.ProductoID = I.ProductoID;
GO

-- Seleccionar todos los registros de la vista de detalles completos
SELECT * FROM VistaDetallesCompletos_Imagenes;
GO


-- Crear un procedimiento almacenado para insertar ventas
CREATE PROCEDURE GenerarVentas
    @FechaInicio DATE,
    @FechaFin DATE,
    @Cantidad INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Fecha DATE;
    DECLARE @ProductoID INT;
    DECLARE @VendedorID INT;
    DECLARE @ClienteID INT;
    DECLARE @UbicacionID INT;
    DECLARE @CantidadVenta INT; -- Renombrar esta variable para evitar conflicto
    DECLARE @Precio DECIMAL(10, 2);
    DECLARE @MontoTotal DECIMAL(10, 2);
    
    -- Generar ventas
    DECLARE @i INT = 0;
    WHILE @i < @Cantidad
    BEGIN
        -- Generar una fecha aleatoria entre FechaInicio y FechaFin
        SET @Fecha = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % DATEDIFF(DAY, @FechaInicio, @FechaFin)), @FechaInicio);
        
        -- Seleccionar IDs aleatorios de las tablas de dimensión
        SET @ProductoID = ABS(CHECKSUM(NEWID()) % (SELECT COUNT(*) FROM Productos)) + 1;
        SET @VendedorID = ABS(CHECKSUM(NEWID()) % (SELECT COUNT(*) FROM Vendedores)) + 1;
        SET @ClienteID = ABS(CHECKSUM(NEWID()) % (SELECT COUNT(*) FROM Clientes)) + 1;
        SET @UbicacionID = ABS(CHECKSUM(NEWID()) % (SELECT COUNT(*) FROM Ubicaciones)) + 1;

        -- Generar una cantidad aleatoria entre 1 y 10
        SET @CantidadVenta = ABS(CHECKSUM(NEWID()) % 10) + 1;

        -- Obtener el precio del producto seleccionado
        SELECT @Precio = Precio FROM Productos WHERE ProductoID = @ProductoID;

        -- Calcular el monto total
        SET @MontoTotal = @CantidadVenta * @Precio;

        -- Insertar el registro en la tabla de Ventas
        INSERT INTO Ventas (Fecha, ProductoID, VendedorID, ClienteID, UbicacionID, Cantidad, MontoTotal)
        VALUES (@Fecha, @ProductoID, @VendedorID, @ClienteID, @UbicacionID, @CantidadVenta, @MontoTotal);

        SET @i = @i + 1;
    END
END;
GO

-- Ejecutar el procedimiento almacenado para generar ventas
EXEC GenerarVentas '2023-02-01', '2024-04-30', 30000;
GO




-- Crear un procedimiento almacenado para insertar ventas
CREATE PROCEDURE GenerarVentas2
    @FechaInicio DATE,
    @FechaFin DATE,
    @CantidadRegistros INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Fecha DATE;
    DECLARE @ProductoID INT;
    DECLARE @VendedorID INT;
    DECLARE @ClienteID INT;
    DECLARE @UbicacionID INT;
    DECLARE @CantidadProductos INT;
    DECLARE @Precio DECIMAL(10, 2);
    DECLARE @MontoTotal DECIMAL(10, 2);
    
    -- Generar ventas
    DECLARE @i INT = 0;
    WHILE @i < @CantidadRegistros
    BEGIN
        -- Generar una fecha aleatoria entre FechaInicio y FechaFin
        SET @Fecha = DATEADD(DAY, ABS(CHECKSUM(NEWID()) % DATEDIFF(DAY, @FechaInicio, @FechaFin)), @FechaInicio);
        
        -- Seleccionar IDs aleatorios de las tablas de dimensión
        SET @ProductoID = ABS(CHECKSUM(NEWID()) % (SELECT COUNT(*) FROM Productos)) + 1;
        SET @VendedorID = ABS(CHECKSUM(NEWID()) % (SELECT COUNT(*) FROM Vendedores)) + 1;
        SET @ClienteID = ABS(CHECKSUM(NEWID()) % (SELECT COUNT(*) FROM Clientes)) + 1;
        SET @UbicacionID = ABS(CHECKSUM(NEWID()) % (SELECT COUNT(*) FROM Ubicaciones)) + 1;

        -- Generar una cantidad aleatoria entre 1 y 10
        SET @CantidadProductos = ABS(CHECKSUM(NEWID()) % 10) + 1;

        -- Obtener el precio del producto seleccionado
        SELECT @Precio = Precio FROM Productos WHERE ProductoID = @ProductoID;

        -- Calcular el monto total
        SET @MontoTotal = @CantidadProductos * @Precio;

        -- Insertar el registro en la tabla de Ventas
        INSERT INTO Ventas (Fecha, ProductoID, VendedorID, ClienteID, UbicacionID, Cantidad, MontoTotal)
        VALUES (@Fecha, @ProductoID, @VendedorID, @ClienteID, @UbicacionID, @CantidadProductos, @MontoTotal);

        SET @i = @i + 1;
    END
END;
GO

-- Ejecutar el procedimiento almacenado para generar ventas
EXEC GenerarVentas '2024-02-01', '2024-02-28', 30;
GO
