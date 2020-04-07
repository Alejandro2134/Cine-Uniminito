-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 07-04-2020 a las 20:29:46
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Unimonito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asiento`
--

CREATE TABLE `asiento` (
  `idAsiento` int(11) NOT NULL,
  `disponibilidad` tinyint(1) NOT NULL DEFAULT 0,
  `Sala_idSala` int(11) NOT NULL,
  `tipoAsiento` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Costo_idCosto` int(11) NOT NULL,
  `numeroAsiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `asiento`
--

INSERT INTO `asiento` (`idAsiento`, `disponibilidad`, `Sala_idSala`, `tipoAsiento`, `Costo_idCosto`, `numeroAsiento`) VALUES
(2, 0, 1, 'General', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `idCargo` int(11) NOT NULL,
  `nombreCargo` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`idCargo`, `nombreCargo`) VALUES
(1, 'Cajero Ticket'),
(2, 'Acomodador'),
(3, 'Cajero Snacks'),
(4, 'Servicios Generales'),
(5, 'Supervisor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `fechaNacimiento` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `contraseña` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `puntaje` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `costo`
--

CREATE TABLE `costo` (
  `idCosto` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `valor` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `costo`
--

INSERT INTO `costo` (`idCosto`, `nombre`, `valor`) VALUES
(1, 'General', 11000),
(2, 'Preferencial', 15000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `cedula` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `fechaInicio` date NOT NULL,
  `salario` double NOT NULL,
  `Multiplex_idMultiplex` int(11) NOT NULL,
  `Cargo_idCargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`idEmpleado`, `cedula`, `nombre`, `telefono`, `fechaInicio`, `salario`, `Multiplex_idMultiplex`, `Cargo_idCargo`) VALUES
(1, '51-289-5631', 'Brandi Crepel', '312729981', '2002-05-23', 1000000, 1, 1),
(2, '71-006-5916', 'Haily Tremellier', '3139087653', '2009-04-25', 1000000, 4, 2),
(3, '86-180-7494', 'Temp Coke', '316789901', '2015-12-13', 1000000, 5, 3),
(4, '45-677-6849', 'Norah Bony', '3275349331', '2012-01-16', 800000, 7, 4),
(5, '39-167-8022', 'Vally Varlow', '3145678990', '2008-06-22', 1500000, 11, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE `evaluacion` (
  `idEvaluacion` int(11) NOT NULL,
  `comentario` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  `servicioEvaluar` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `puntaje` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `funcion`
--

CREATE TABLE `funcion` (
  `idFuncion` int(11) NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  `fechaFuncion` date NOT NULL,
  `Pelicula_idPelicula` int(11) NOT NULL,
  `Sala_idSala` int(11) NOT NULL,
  `precio` double NOT NULL DEFAULT 10000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multiplex`
--

CREATE TABLE `multiplex` (
  `idMultiplex` int(11) NOT NULL,
  `nombreMultiplex` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `multiplex`
--

INSERT INTO `multiplex` (`idMultiplex`, `nombreMultiplex`) VALUES
(1, 'Titan Plaza'),
(4, 'Unicentro'),
(5, 'Plaza Central'),
(7, 'Gran Estación'),
(9, 'Embajador'),
(11, 'Las Américas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `idPelicula` int(11) NOT NULL,
  `nombrePelicula` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `descripcionPelicula` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `Multiplex_idMultiplex` int(11) NOT NULL,
  `genero` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `portada` varchar(500) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `pelicula`
--

INSERT INTO `pelicula` (`idPelicula`, `nombrePelicula`, `descripcionPelicula`, `Multiplex_idMultiplex`, `genero`, `portada`) VALUES
(1, 'Joker', 'In Gotham City, mentally troubled comedian Arthur Fleck is disregarded and mistreated by society. He then embarks on a downward spiral of revolution and bloody crime. This path brings him face-to-face with his alter-ego: the Joker.', 1, 'Drama', 'https://m.media-amazon.com/images/M/MV5BNGVjNWI4ZGUtNzE0MS00YTJmLWE0ZDctN2ZiYTk2YmI3NTYyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SY1000_CR0,0,674,1000_AL_.jpg'),
(2, 'My Hero Academia: Héroes Rising', 'A group of youths aspiring to become professional superheroes, fight in a world full of people with abilities, also known as quirks. Deku and his fellow classmates from Hero Academy face Nine, the strongest villain yet.', 5, 'Acción', 'https://m.media-amazon.com/images/M/MV5BOTYyYjAxNDgtNjEwYi00ZjY0LTk2ZDAtOTBiZTVjMmZkYjk3XkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_SY1000_CR0,0,682,1000_AL_.jpg'),
(3, 'Midsommar', 'A couple travels to Sweden to visit a rural hometown\'s fabled mid-summer festival. What begins as an idyllic retreat quickly devolves into an increasingly violent and bizarre competition at the hands of a pagan cult.', 11, 'Terror', 'https://m.media-amazon.com/images/M/MV5BMzQxNzQzOTQwM15BMl5BanBnXkFtZTgwMDQ2NTcwODM@._V1_SY1000_CR0,0,674,1000_AL_.jpg'),
(4, 'El señor de los anillos: El retorno del rey', 'Gandalf and Aragorn lead the World of Men against Sauron\'s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', 7, 'Drama', 'https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SY1000_CR0,0,675,1000_AL_.jpg'),
(5, 'Drive', 'A mysterious Hollywood stuntman and mechanic moonlights as a getaway driver and finds himself in trouble when he helps out his neighbor in this action drama.', 1, 'Drama', 'https://m.media-amazon.com/images/M/MV5BZjY5ZjQyMjMtMmEwOC00Nzc2LTllYTItMmU2MzJjNTg1NjY0XkEyXkFqcGdeQXVyNjQ1MTMzMDQ@._V1_SY1000_SX675_AL_.jpg'),
(6, 'American Psycho', 'A wealthy New York City investment banking executive, Patrick Bateman, hides his alternate psychopathic ego from his co-workers and friends as he delves deeper into his violent, hedonistic fantasies. ', 7, 'Drama', 'https://m.media-amazon.com/images/M/MV5BZTM2ZGJmNjQtN2UyOS00NjcxLWFjMDktMDE2NzMyNTZlZTBiXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SY1000_CR0,0,674,1000_AL_.jpg'),
(8, 'Érase una vez en... Hollywood', ' A faded television actor and his stunt double strive to achieve fame and success in the film industry during the final years of Hollywood\'s Golden Age in 1969 Los Angeles.', 5, 'Comedia', 'https://m.media-amazon.com/images/M/MV5BOTg4ZTNkZmUtMzNlZi00YmFjLTk1MmUtNWQwNTM0YjcyNTNkXkEyXkFqcGdeQXVyNjg2NjQwMDQ@._V1_SY1000_CR0,0,674,1000_AL_.jpg'),
(9, 'Ford v Ferrari', 'American car designer Carroll Shelby and driver Ken Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order to defeat Ferrari at the 24 Hours of Le Mans in 1966. ', 4, 'Acción', 'https://m.media-amazon.com/images/M/MV5BM2UwMDVmMDItM2I2Yi00NGZmLTk4ZTUtY2JjNTQ3OGQ5ZjM2XkEyXkFqcGdeQXVyMTA1OTYzOTUx._V1_SY1000_CR0,0,675,1000_AL_.jpg'),
(10, 'Los siete samuráis', 'A poor village under attack by bandits recruits seven unemployed samurai to help them defend themselves.', 9, 'Acción', 'https://m.media-amazon.com/images/M/MV5BODdlYjU1Y2MtMWUxMy00YjJjLTgyMWItNzgzZmZkNTYxNWFkXkEyXkFqcGdeQXVyMTAwMjU1MzA2._V1_SX647_CR0,0,647,999_AL_.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `idReserva` int(11) NOT NULL,
  `tiempoEspera` time(6) NOT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  `fechaReserva` datetime NOT NULL,
  `fechaFuncion` datetime NOT NULL,
  `Funcion_idFuncion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `idSala` int(11) NOT NULL,
  `nombreSala` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `Multiplex_idMultiplex` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `sala`
--

INSERT INTO `sala` (`idSala`, `nombreSala`, `Multiplex_idMultiplex`) VALUES
(1, 'Sala 1', 1),
(3, 'Sala 2', 1),
(4, 'Sala 3', 1),
(5, 'Sala 4', 1),
(6, 'Sala 5', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `snack`
--

CREATE TABLE `snack` (
  `idSnack` int(11) NOT NULL,
  `nombre` varchar(35) COLLATE utf8_spanish_ci NOT NULL,
  `precio` double NOT NULL,
  `Multiplex_idMultiplex` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `snack`
--

INSERT INTO `snack` (`idSnack`, `nombre`, `precio`, `Multiplex_idMultiplex`) VALUES
(1, 'Hot Dog', 6000, 1),
(2, 'Nachos', 3000, 1),
(3, 'Sandwich', 6000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE `ticket` (
  `idTicket` int(11) NOT NULL,
  `fechaCompra` date NOT NULL,
  `Cliente_idCliente` int(11) NOT NULL,
  `Funcion_idFuncion` int(11) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asiento`
--
ALTER TABLE `asiento`
  ADD PRIMARY KEY (`idAsiento`),
  ADD KEY `Sala_idSala` (`Sala_idSala`),
  ADD KEY `Costo_idCosto` (`Costo_idCosto`);

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idCargo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `costo`
--
ALTER TABLE `costo`
  ADD PRIMARY KEY (`idCosto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `Multiplex_idMultiplex` (`Multiplex_idMultiplex`),
  ADD KEY `Cargo_idCargo` (`Cargo_idCargo`);

--
-- Indices de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD PRIMARY KEY (`idEvaluacion`),
  ADD KEY `Cliente_idCliente` (`Cliente_idCliente`);

--
-- Indices de la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD PRIMARY KEY (`idFuncion`),
  ADD KEY `Pelicula_idPelicula` (`Pelicula_idPelicula`),
  ADD KEY `Sala_idSala` (`Sala_idSala`);

--
-- Indices de la tabla `multiplex`
--
ALTER TABLE `multiplex`
  ADD PRIMARY KEY (`idMultiplex`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`idPelicula`),
  ADD KEY `Multiplex_idMultiplex` (`Multiplex_idMultiplex`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idReserva`),
  ADD KEY `Funcion_idFuncion` (`Funcion_idFuncion`),
  ADD KEY `Cliente_idCliente` (`Cliente_idCliente`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`idSala`),
  ADD KEY `Multiplex_idMultiplex` (`Multiplex_idMultiplex`);

--
-- Indices de la tabla `snack`
--
ALTER TABLE `snack`
  ADD PRIMARY KEY (`idSnack`),
  ADD KEY `Multiplex_idMultiplex` (`Multiplex_idMultiplex`);

--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`idTicket`),
  ADD KEY `Cliente_idCliente` (`Cliente_idCliente`),
  ADD KEY `Funcion_idFuncion` (`Funcion_idFuncion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asiento`
--
ALTER TABLE `asiento`
  MODIFY `idAsiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `costo`
--
ALTER TABLE `costo`
  MODIFY `idCosto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  MODIFY `idEvaluacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `funcion`
--
ALTER TABLE `funcion`
  MODIFY `idFuncion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `multiplex`
--
ALTER TABLE `multiplex`
  MODIFY `idMultiplex` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `idPelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `idReserva` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sala`
--
ALTER TABLE `sala`
  MODIFY `idSala` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `snack`
--
ALTER TABLE `snack`
  MODIFY `idSnack` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
  MODIFY `idTicket` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asiento`
--
ALTER TABLE `asiento`
  ADD CONSTRAINT `asiento_ibfk_1` FOREIGN KEY (`Sala_idSala`) REFERENCES `sala` (`idSala`),
  ADD CONSTRAINT `asiento_ibfk_2` FOREIGN KEY (`Costo_idCosto`) REFERENCES `costo` (`idCosto`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`Multiplex_idMultiplex`) REFERENCES `multiplex` (`idMultiplex`),
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`Cargo_idCargo`) REFERENCES `cargo` (`idCargo`);

--
-- Filtros para la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD CONSTRAINT `evaluacion_ibfk_1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD CONSTRAINT `funcion_ibfk_1` FOREIGN KEY (`Pelicula_idPelicula`) REFERENCES `pelicula` (`idPelicula`),
  ADD CONSTRAINT `funcion_ibfk_2` FOREIGN KEY (`Sala_idSala`) REFERENCES `sala` (`idSala`);

--
-- Filtros para la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD CONSTRAINT `pelicula_ibfk_1` FOREIGN KEY (`Multiplex_idMultiplex`) REFERENCES `multiplex` (`idMultiplex`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`Funcion_idFuncion`) REFERENCES `funcion` (`idFuncion`);

--
-- Filtros para la tabla `sala`
--
ALTER TABLE `sala`
  ADD CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`Multiplex_idMultiplex`) REFERENCES `multiplex` (`idMultiplex`);

--
-- Filtros para la tabla `snack`
--
ALTER TABLE `snack`
  ADD CONSTRAINT `snack_ibfk_1` FOREIGN KEY (`Multiplex_idMultiplex`) REFERENCES `multiplex` (`idMultiplex`);

--
-- Filtros para la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`Funcion_idFuncion`) REFERENCES `funcion` (`idFuncion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
