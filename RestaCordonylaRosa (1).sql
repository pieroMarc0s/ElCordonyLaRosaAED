create database RestaCordonylaRosa
use RestaCordonylaRosa

CREATE TABLE Clientes(
    ID INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(50),
    Apellidos VARCHAR(50),
    Email VARCHAR(50),
    Numerotele VARCHAR(50)
);

CREATE TABLE Empleados(
    EmpleadoID INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(50),
    Apellidos VARCHAR(50),
    PosiciónTrabajo VARCHAR(50),
    FechaContratación DATE
);
CREATE TABLE Mesas (
    MesaID INT PRIMARY KEY IDENTITY,
    NumeroMesa INT,
    CapacidadMesa INT
);
CREATE TABLE Reservación (
    ReservaciónID INT PRIMARY KEY IDENTITY,
    ID INT FOREIGN KEY REFERENCES Clientes(ID),
    MesaID INT FOREIGN KEY REFERENCES Mesas(MesaID),
    FechaReserva DATETIME,
    NumeroPersonas INT
);
CREATE TABLE CategoriaPlatos (
    CategoriaPlatoID INT PRIMARY KEY IDENTITY,
    Nombrecategoria VARCHAR(50)
);

CREATE TABLE Platos (
    PlatosID INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(100),
    Precio DECIMAL(10, 2),
    CategoriaPlatoID INT FOREIGN KEY REFERENCES CategoriaPlatos(CategoriaPlatoID)
);
CREATE TABLE Orden (
    OrdenID INT PRIMARY KEY IDENTITY,
    IDcliente INT FOREIGN KEY REFERENCES clientes(ID),
    EmpleadoID INT FOREIGN KEY REFERENCES Empleados(EmpleadoID),
	PlatosID INT FOREIGN KEY REFERENCES Platos(PlatosID),
    FechaOrden DATETIME,
    CantidadTotal DECIMAL(10, 2)
	
);

CREATE TABLE Facturas (
    FacturasID INT PRIMARY KEY IDENTITY,
    OrdenID INT FOREIGN KEY REFERENCES Orden(OrdenID),
    FechasFacturas DATETIME,
    Cantidad DECIMAL(10, 2)
);
CREATE TABLE DeliveryDireccion (
    DeliverydireccionID INT PRIMARY KEY IDENTITY,
    IDcliente INT FOREIGN KEY REFERENCES clientes(ID),
    Dirección VARCHAR(100),
    Distrito VARCHAR(50),
    Estado VARCHAR(50),
);

CREATE TABLE DeliveryPedido1 (
    DeliveryPedidoID INT PRIMARY KEY IDENTITY,
    OrdenID INT FOREIGN KEY REFERENCES Orden(OrdenID),
    DeliverydireccionID INT FOREIGN KEY REFERENCES DeliveryDireccion(DeliverydireccionID),
    Fechaentrega DATETIME,
    Estadopedido VARCHAR(50)
);

CREATE TABLE Cartas (
    CartaID INT PRIMARY KEY IDENTITY,
    FechaInicial DATE,
    FechaFinal DATE,
    Description VARCHAR(400)
);

CREATE TABLE CartaPlatos (
    CartaID INT FOREIGN KEY REFERENCES Cartas(CartaID),
    PlatosID INT FOREIGN KEY REFERENCES Platos(PlatosID),
);

CREATE TABLE Mozos (
    MozoID INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(50),
    Apellidos VARCHAR(50),
    FechaContratación DATE,
	EmpleadoID INT FOREIGN KEY REFERENCES Empleados(EmpleadoID)
);

INSERT INTO Mozos (Nombre, Apellidos, FechaContratación)VALUES 
('Juan', 'Pérez Torres', '2023-01-01'),
('Pablo', 'Ruiz Paz', '2023-01-01'),
('Jose', 'Mendoza Flores', '2023-01-01'),
('Leandro', 'Ramirez Ramos', '2023-01-01');

select * from CategoriaPlatos  

INSERT INTO CategoriaPlatos(Nombrecategoria)VALUES 
('Desayuno'),
('Platos Marinos'),
('Entradas criollas'),
('Entradas Marinas'),
('Platos criollos'),
('Carnes'),
('Pollos'),
('Guarniciones'),
('Bebidas'),
('Postres'),
('Cartas de vinos');

INSERT INTO Platos(Nombre, Precio, CategoriaPlatoID)VALUES 
('Club Sándwich', 25.00, 1),
('Sándwich de pollo a la plancha', 25.00,1),
('Triple tradicional', 20.00, 1),
('Ensalada de Frutas', 25.00, 1),
('Jugos', 20.00, 1),
('Desayuno Americano', 30.00, 1),
('Desayuno Continental', 30.00, 1),
('Omelette Especial', 28.00, 1),
('Pan con chicharrón', 20.00, 1),
('Pan con asado', 22.00, 1),
('Arroz con mariscos', 49.00, 2),
('Cau Cau de langostinos', 56.00, 2),
('Pescado a la plancha', 48.00, 2),
('Pescado a lo macho', 52.00, 2),
('Pescado en salsa de ajo', 52.00, 2),
('Parihuela', 56.00, 2),
('Chicharrón de pescado', 48.00, 2),
('Ensalada ed pallares verdes', 35.00, 3),
('Causa rellena', 28.00, 3),
('Papa a la Huancaína', 28.00, 3),
('Ensalada mixta', 25.00, 3),
('Causa con pulpo a la parrilla', 58.00, 4),
('Leche de tigre', 30.00, 4),
('Choritos a la chalaca', 38.00, 4),
('Pulpo al olivo', 48.00, 4),
('Causa con langostinos', 48.00, 4),
('Tacu Tacu son seco', 52.00, 5),
('Tacu Tacu a lo pobre', 65.00, 5),
('Palleres con asado', 48.00, 5),
('Frejoles con seco', 52.00, 5),
('Puré con Asado', 42.00, 5),
('Sopa a la criolla ', 45.00, 5),
('Lomo a la pimienta', 56.00, 6),
('Fetuccini en salsa huancaína', 56.00, 6),
('Fetuccini a lo Alfredo con lomo', 56.00, 6),
('Sabana a lo pobre', 56.00, 6),
('Lomo saltado', 56.00, 6),
('Arroz chaufa', 56.00, 6),
('Tallarín saltado', 56.00, 6),
('Pollo a lo pobre', 56.00, 7),
('Chicharrón de pollo', 48.00, 7),
('Pollo cordon blue', 48.00, 7),
('Milanesa a lo pobre', 56.00, 7),
('Porción de arroz', 12.00, 8),
('Porción de papas fritas', 12.00, 8),
('Porción de yucas fritas', 12.00, 8),
('Jarra de litro', 22.00, 9),
('Limonada', 25.00, 9),
('Gaseosa', 18.00, 9),
('Cerveza', 15.00, 9),
('Pisco Sour', 25.00, 9),
('Chilcano', 25.00, 9),
('Piña colada', 25.00, 9),
('Torta de pecana', 18.00, 10),
('Torta de chocolate', 18.00, 10),
('Torta de tres leches', 18.00, 10),
('Torta de Pie de limón', 18.00, 10),
('Crema volteada', 16.00, 10),
('Copa de helado', 18.00, 10),
('Don Manuel', 220.00, 11),
('Selección Especial', 150.00, 11),
('Gran Tinto', 75.00, 11),
('Tinto Semiseco', 70.00, 11),
('Gran Blanco', 75.00, 11),
('Blanco Semiseco', 70.00, 11);

select* from CategoriaPlatos

INSERT INTO Clientes(Nombre, Apellidos, Email, Numerotele)VALUES 
('Leonardo', 'Gonzales Ortiz', 'leogonzales@gmail.com', 978765899),
('Liliana', 'Alvares Gutierrez', 'lilialvarez@gmail.com', 987676879),
('Carlos', 'Perez Garcia', '',987878899),
('Sergio', 'Ramos Silva', '', 964456667);
