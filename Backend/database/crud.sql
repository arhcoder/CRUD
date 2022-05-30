-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-05-2022 a las 08:11:06
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE `courses` (
  `id` int(4) NOT NULL,
  `name` varchar(88) NOT NULL,
  `subject` varchar(88) NOT NULL,
  `level` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`id`, `name`, `subject`, `level`) VALUES
(1, 'Programación Estructurada', 'Ingeniería de Software', 'I'),
(2, 'Bases de Datos Simples', 'Ingeniería de Software', 'I'),
(3, 'Programación Orientada a Objetos', 'Ingeniería de Software', 'II'),
(4, 'Bases de Datos Avanzadas', 'Ingeniería de Software', 'II'),
(5, 'Aplicaciones Web', 'Ingeniería de Software', 'III'),
(6, 'Aplicaciones Móviles', 'Ingeniería de Software', 'III'),
(7, 'Sistemas Operativos', 'Ingeniería de Software', 'IV'),
(8, 'Administración de Redes', 'Ingeniería de Software', 'IV'),
(9, 'Seguridad Informática', 'Ingeniería de Software', 'V'),
(10, 'Programación Científica', 'Ingeniería de Software', 'V'),
(11, 'Estructuras de Datos', 'Ingeniería de Software', 'VI'),
(12, 'Programación en Ensamblador', 'Ingeniería de Software', 'VI'),
(13, 'Patrones de Diseño', 'Ingeniería de Software', 'VIII'),
(14, 'Sistemas Gestores de Versiones', 'Ingeniería de Software', 'VIII'),
(15, 'Derecho Informático', 'Ingeniería de Software', 'X'),
(16, 'Emprendimiento de Software', 'Ingeniería de Software', 'X'),
(17, 'Química Básica', 'Biomedicina', 'I'),
(18, 'Biología Básica', 'Biomedicina', 'I'),
(19, 'Biología Celular', 'Biomedicina', 'II'),
(20, 'Microbiología', 'Biomedicina', 'II'),
(21, 'Genética', 'Biomedicina', 'IV'),
(22, 'Biofísica', 'Biomedicina', 'IV'),
(23, 'Bioquímica', 'Biomedicina', 'VI'),
(24, 'Farmacéutica', 'Biomedicina', 'VI'),
(25, 'Estudio de células', 'Biomedicina', 'VIII'),
(26, 'Modificación de células', 'Biomedicina', 'X'),
(27, 'Aprendizaje y Conducta Adaptativa', 'Psicología', 'I'),
(28, 'Bases Biológicas de la Conducta', 'Psicología', 'I'),
(29, 'Ciclo de Vida', 'Psicología', 'II'),
(30, 'Historia de la Psicología', 'Psicología', 'II'),
(31, 'Transtornos psicológicos', 'Psicología', 'III'),
(32, 'Psiquiatría Básica', 'Psicología', 'IV'),
(33, 'Enfermedades Mentales', 'Psicología', 'VI'),
(34, 'Fobias de alto nivel', 'Psicología', 'VI'),
(35, 'Dinámica de grupos', 'Psicología', 'VIII'),
(36, 'Estudio matemático de masas poblacionales', 'Psicología', 'X'),
(37, 'Teoría Musical Básica', 'Música', 'I'),
(38, 'Piano Básico', 'Música', 'I'),
(39, 'Teoría Musica Avanzada', 'Música', 'II'),
(40, 'Piano Avanzado', 'Música', 'II'),
(41, 'Armonía', 'Música', 'III'),
(42, 'Improvisación', 'Música', 'IV'),
(43, 'Composición Musical Básica', 'Música', 'V'),
(44, 'Historia de la Música', 'Música', 'VI'),
(45, 'Interpretación en Público', 'Música', 'VIII'),
(46, 'Composición Musical Avanzada', 'Música', 'X'),
(47, 'Álgebra Lineal y Aritmética', 'Matemáticas Aplicadas', 'I'),
(48, 'Geometría Analítica', 'Matemáticas Aplicadas', 'II'),
(49, 'Cálculo Diferencial e Integral', 'Matemáticas Aplicadas', 'IV'),
(50, 'Ecuaciones Diferenciales', 'Matemáticas Aplicadas', 'VIII');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE `kardex` (
  `studentNumber` int(11) NOT NULL,
  `courseCompleted` int(11) NOT NULL,
  `score` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `kardex`
--

INSERT INTO `kardex` (`studentNumber`, `courseCompleted`, `score`) VALUES
(1, 1, 10),
(1, 2, 9.4),
(1, 3, 9.2),
(1, 4, 9.6),
(1, 5, 10),
(1, 6, 10),
(1, 8, 9.3),
(1, 9, 10),
(1, 10, 9.8),
(1, 15, 8.8),
(1, 31, 8.2),
(1, 32, 9),
(1, 39, 10),
(1, 40, 9.8),
(1, 41, 9.8),
(1, 42, 8),
(1, 46, 10),
(2, 1, 8.2),
(2, 2, 9),
(2, 4, 9.2),
(2, 6, 8.8),
(2, 8, 9.1),
(2, 9, 8.4),
(2, 10, 8.6),
(2, 11, 9.2),
(2, 12, 6.8),
(2, 47, 8.2),
(2, 49, 6.4),
(2, 50, 7.4),
(3, 17, 8.2),
(3, 18, 9.8),
(3, 19, 8),
(3, 20, 9.4),
(3, 21, 10),
(3, 22, 9.6),
(3, 23, 9.5),
(3, 24, 9.5),
(3, 25, 9.6),
(3, 26, 9.8),
(3, 27, 10),
(3, 28, 10),
(4, 1, 9.4),
(4, 2, 9.5),
(4, 3, 9.6),
(4, 4, 9.8),
(4, 5, 10),
(4, 6, 9.8),
(4, 7, 9.6),
(4, 8, 9.5),
(4, 10, 9.4),
(4, 14, 10),
(4, 16, 10),
(4, 50, 8),
(5, 31, 8.2),
(5, 32, 7.4),
(5, 33, 8.2),
(5, 34, 9),
(5, 35, 6.8),
(5, 36, 7),
(6, 37, 9.4),
(6, 38, 9.3),
(6, 39, 9.2),
(6, 40, 10),
(6, 41, 9.8),
(6, 42, 7.7),
(6, 43, 10),
(6, 44, 9.8),
(6, 45, 8.4),
(6, 46, 10),
(8, 10, 10),
(8, 47, 9.8),
(8, 48, 10),
(8, 49, 8.8),
(8, 50, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE `students` (
  `number` int(4) NOT NULL,
  `name` varchar(44) NOT NULL,
  `city` varchar(44) NOT NULL,
  `phone` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `students`
--

INSERT INTO `students` (`number`, `name`, `city`, `phone`) VALUES
(1, 'Alejandro Ramos', 'Aguascalientes', '+52 (449) 398 1375'),
(2, 'José Ramírez', 'Guanajuato', '+52 (488) 384 2208'),
(3, 'Adriana Maldonado', 'Tamaulipas', '+52 (558) 348 0022'),
(4, 'Jessica Willson', 'California', '+01 (322) 580 6982'),
(5, 'William Halleck', 'Bangor', '+01 (288) 248 9944'),
(6, 'Felipe Gonzáles', 'Monterrey', '+52 (556) 136 4422'),
(8, 'Juan Arriaga', 'Ciudad de México', '+52 (552) 480 1322');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`studentNumber`,`courseCompleted`),
  ADD KEY `FK_CourseID` (`courseCompleted`);

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`number`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `students`
--
ALTER TABLE `students`
  MODIFY `number` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD CONSTRAINT `FK_CourseID` FOREIGN KEY (`courseCompleted`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `kardex_ibfk_1` FOREIGN KEY (`studentNumber`) REFERENCES `students` (`number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;