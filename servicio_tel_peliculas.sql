-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 08-04-2022 a las 21:11:51
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `servicio_tel_peliculas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cine`
--

CREATE TABLE `cine` (
  `id` int(11) NOT NULL,
  `id_p` int(11) DEFAULT NULL,
  `lugar_cine` text,
  `horacio_cine` time DEFAULT NULL,
  `sala_p` varchar(50) DEFAULT NULL,
  `pace_p` varchar(50) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  `dia` varchar(100) DEFAULT NULL,
  `precio` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cine`
--

INSERT INTO `cine` (`id`, `id_p`, `lugar_cine`, `horacio_cine`, `sala_p`, `pace_p`, `telefono`, `dia`, `precio`) VALUES
(1, 1, 'centro_americano', '12:30:00', '5A', '320A', 3294212, 'verano,festivo', 30000),
(2, 2, 'jumbo', '04:30:00', '2B', '230B', 30271245, 'otoño,invierno', 25000),
(3, 3, 'unico', '06:00:00', '6A', '560C', 3015317229, 'festivo,verano,invierno', 40000);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `cine_v`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `cine_v` (
`nombre_pelicula` varchar(50)
,`nom_protagonistas` text
,`genero` text
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `id` int(11) NOT NULL,
  `id_u` int(11) DEFAULT NULL,
  `nombre_pelicula` varchar(50) DEFAULT NULL,
  `nombre_director` varchar(50) DEFAULT NULL,
  `nom_protagonistas` text,
  `genero` text,
  `clasificacion` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id`, `id_u`, `nombre_pelicula`, `nombre_director`, `nom_protagonistas`, `genero`, `clasificacion`) VALUES
(1, 1, 'it', 'andres_muschieti', 'richie,beverly,eddie', 'terror', 'mayores_20'),
(2, 2, 'avengers', 'joe_russo', 'cris_evans,robert_downey,scarlet_jhonson', 'accion,ciencia_ficcion', 'mayores_15'),
(3, 3, 'jumanji', 'jake_kasdan,joe_johnston', 'richard', 'aventura,fantasia,comedia', 'mayores_10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `edad`) VALUES
(1, 'orlay', 'marchena', 21),
(2, 'angelica', 'molina', 19),
(3, 'andres', 'ruiz', 14);

-- --------------------------------------------------------

--
-- Estructura para la vista `cine_v`
--
DROP TABLE IF EXISTS `cine_v`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cine_v`  AS  select `peliculas`.`nombre_pelicula` AS `nombre_pelicula`,`peliculas`.`nom_protagonistas` AS `nom_protagonistas`,`peliculas`.`genero` AS `genero` from `peliculas` where (`peliculas`.`id` = 1) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cine`
--
ALTER TABLE `cine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relacion2` (`id_p`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `relacion1` (`id_u`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cine`
--
ALTER TABLE `cine`
  ADD CONSTRAINT `relacion2` FOREIGN KEY (`id_p`) REFERENCES `peliculas` (`id`);

--
-- Filtros para la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD CONSTRAINT `relacion1` FOREIGN KEY (`id_u`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
