-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-12-2016 a las 15:38:32
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbrestaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atender`
--

CREATE TABLE `atender` (
  `id_atencion` bigint(20) NOT NULL,
  `atencion_usu` int(11) NOT NULL,
  `atencion_mozo` int(11) NOT NULL,
  `atencion_local` int(11) NOT NULL,
  `atencion_mesa` int(11) NOT NULL,
  `atencion_fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `atender`
--

INSERT INTO `atender` (`id_atencion`, `atencion_usu`, `atencion_mozo`, `atencion_local`, `atencion_mesa`, `atencion_fecha`) VALUES
(9, 1, 1, 1, 4, '2016-12-08'),
(11, 2, 3, 7, 6, '2016-12-08'),
(12, 2, 4, 2, 6, '2016-12-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `local`
--

CREATE TABLE `local` (
  `idlocal` int(11) NOT NULL,
  `nombrelocal` varchar(40) NOT NULL,
  `capacidad` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `local`
--

INSERT INTO `local` (`idlocal`, `nombrelocal`, `capacidad`) VALUES
(1, 'Miraflores', 375),
(2, 'Barranco', 500),
(3, 'Molina', 450),
(4, 'San Juan de Lurigancho', 340),
(7, 'Villa MarÃ­a del Triunfo', 340);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `idplato` int(100) NOT NULL,
  `nombreplato` varchar(40) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precio` float NOT NULL,
  `tipo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`idplato`, `nombreplato`, `descripcion`, `precio`, `tipo_id`) VALUES
(14, 'Arroz con Pollo', 'Plato a base de Pollo', 15, 1),
(15, 'Choritos a la Chalaca', 'Plato a base de mariscos', 17, 4),
(16, 'SalpicÃ³n de Pollo', 'Plato a base de pollo', 15, 1),
(19, 'Seco de Pollo', 'Plato a base de pollo', 16, 1),
(20, 'Ceviche', 'Plato a base de pescado', 20, 2),
(21, 'Chicharron de Pescado', 'Plato a base de pescado', 15, 3),
(22, 'Pizza Donatello', 'Contiene pollo, piÃ±a y ajos.', 22, 7),
(23, 'Asado de Carne', 'Plato a base de carne', 15, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesas`
--

CREATE TABLE `mesas` (
  `idmesa` int(11) NOT NULL,
  `nombre_mesa` varchar(20) NOT NULL,
  `local_id` int(11) NOT NULL,
  `estado_mesa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mesas`
--

INSERT INTO `mesas` (`idmesa`, `nombre_mesa`, `local_id`, `estado_mesa`) VALUES
(1, 'M1', 1, 0),
(2, 'B2', 2, 1),
(3, 'MO3', 3, 0),
(4, 'M4', 1, 1),
(6, 'B3', 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mozos`
--

CREATE TABLE `mozos` (
  `id_mozo` int(11) NOT NULL,
  `nombremozo` varchar(50) NOT NULL,
  `apellidomozo` varchar(50) NOT NULL,
  `apodomozo` varchar(50) NOT NULL,
  `puntos` int(11) NOT NULL,
  `votos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mozos`
--

INSERT INTO `mozos` (`id_mozo`, `nombremozo`, `apellidomozo`, `apodomozo`, `puntos`, `votos`) VALUES
(1, 'Maxwell ', 'Gonzales', 'Chinito', 5, 1),
(2, 'Carlos', 'Paye', 'El Paye', 0, 0),
(3, 'Maria', 'Torres', 'Panzita', 0, 0),
(4, 'Arturo', 'Arenillas', 'Arturin', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_plato` int(100) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_plato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_usuario`, `id_plato`, `fecha_pedido`, `cantidad`, `precio_plato`) VALUES
(3, 1, 14, '2016-12-07', 1, 15),
(4, 1, 22, '2016-12-07', 2, 22),
(5, 1, 21, '2016-12-07', 1, 15),
(6, 2, 16, '2016-12-07', 1, 15),
(7, 2, 22, '2016-12-07', 1, 22),
(8, 2, 15, '2016-12-07', 1, 17),
(10, 1, 22, '2016-12-07', 1, 22),
(11, 1, 14, '2016-12-08', 2, 15),
(12, 2, 19, '2016-12-08', 2, 16),
(13, 1, 22, '2016-12-08', 1, 22),
(14, 2, 21, '2016-12-09', 3, 15),
(15, 2, 16, '2016-12-09', 1, 15),
(16, 2, 22, '2016-12-09', 1, 22),
(17, 2, 23, '2016-12-09', 2, 15),
(18, 1, 21, '2016-01-11', 5, 15),
(19, 2, 22, '2016-06-13', 7, 22),
(20, 1, 22, '2016-03-16', 7, 22),
(21, 1, 22, '2016-04-11', 5, 22),
(22, 2, 20, '2016-03-22', 6, 20),
(23, 2, 20, '2016-03-30', 8, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones`
--

CREATE TABLE `reservaciones` (
  `id_reservacion` int(11) NOT NULL,
  `reser_nombres` varchar(50) NOT NULL,
  `reser_email` varchar(50) NOT NULL,
  `reser_dni` int(11) NOT NULL,
  `reser_celular` int(11) NOT NULL,
  `reser_fecha` date NOT NULL,
  `reser_hora` time NOT NULL,
  `reser_local` int(11) NOT NULL,
  `reser_mesa` int(11) NOT NULL,
  `reser_pago` int(11) NOT NULL,
  `reser_numtarjeta` int(11) NOT NULL,
  `reser_expiracion` date NOT NULL,
  `reser_seguridad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reservaciones`
--

INSERT INTO `reservaciones` (`id_reservacion`, `reser_nombres`, `reser_email`, `reser_dni`, `reser_celular`, `reser_fecha`, `reser_hora`, `reser_local`, `reser_mesa`, `reser_pago`, `reser_numtarjeta`, `reser_expiracion`, `reser_seguridad`) VALUES
(1, 'Ernesto Zhildeer', 'zhildeercf@gmail.com', 71508945, 943880581, '2016-12-17', '14:30:00', 1, 4, 1, 527345, '2017-04-07', 52845),
(2, 'Maria del Carmen', 'maria_carmen@gmail.com', 72436591, 943827561, '2016-12-25', '17:40:00', 2, 2, 2, 762449, '2017-04-08', 36846);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocomida`
--

CREATE TABLE `tipocomida` (
  `idtipo` int(11) NOT NULL,
  `descriptipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipocomida`
--

INSERT INTO `tipocomida` (`idtipo`, `descriptipo`) VALUES
(1, 'Pollo'),
(2, 'Carne'),
(3, 'Pescado'),
(4, 'Mariscos'),
(5, 'Bebidas'),
(6, 'Postres'),
(7, 'Pizza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuarios` int(11) NOT NULL,
  `nombreusuario` varchar(50) NOT NULL,
  `apellidousuario` varchar(50) NOT NULL,
  `telefonousuario` int(9) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `nivel` varchar(10) NOT NULL,
  `user` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuarios`, `nombreusuario`, `apellidousuario`, `telefonousuario`, `email`, `pass`, `nivel`, `user`) VALUES
(1, 'ERNESTO', 'ZHILDEER', 943880581, 'ernestogatoale@gmail.com', 'ernesto199803', 'cliente', 'erzhil'),
(2, 'CAMILA', 'FERNANDEZ', 951234532, 'camilita@outlook.com', 'camila123', 'cliente', 'camilafe');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `atender`
--
ALTER TABLE `atender`
  ADD PRIMARY KEY (`id_atencion`),
  ADD KEY `atencion_usu` (`atencion_usu`),
  ADD KEY `atencion_mozo` (`atencion_mozo`),
  ADD KEY `atencion_local` (`atencion_local`),
  ADD KEY `atencion_mesa` (`atencion_mesa`);

--
-- Indices de la tabla `local`
--
ALTER TABLE `local`
  ADD PRIMARY KEY (`idlocal`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idplato`),
  ADD KEY `tipo_id` (`tipo_id`);

--
-- Indices de la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD PRIMARY KEY (`idmesa`),
  ADD KEY `local_id` (`local_id`);

--
-- Indices de la tabla `mozos`
--
ALTER TABLE `mozos`
  ADD PRIMARY KEY (`id_mozo`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_plato` (`id_plato`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD PRIMARY KEY (`id_reservacion`),
  ADD KEY `reser_local` (`reser_local`),
  ADD KEY `reser_mesa` (`reser_mesa`);

--
-- Indices de la tabla `tipocomida`
--
ALTER TABLE `tipocomida`
  ADD PRIMARY KEY (`idtipo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `atender`
--
ALTER TABLE `atender`
  MODIFY `id_atencion` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `local`
--
ALTER TABLE `local`
  MODIFY `idlocal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `idplato` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `mesas`
--
ALTER TABLE `mesas`
  MODIFY `idmesa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `mozos`
--
ALTER TABLE `mozos`
  MODIFY `id_mozo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  MODIFY `id_reservacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tipocomida`
--
ALTER TABLE `tipocomida`
  MODIFY `idtipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `atender`
--
ALTER TABLE `atender`
  ADD CONSTRAINT `atender_ibfk_1` FOREIGN KEY (`atencion_usu`) REFERENCES `usuarios` (`idusuarios`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `atender_ibfk_2` FOREIGN KEY (`atencion_mozo`) REFERENCES `mozos` (`id_mozo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `atender_ibfk_3` FOREIGN KEY (`atencion_local`) REFERENCES `local` (`idlocal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `atender_ibfk_4` FOREIGN KEY (`atencion_mesa`) REFERENCES `mesas` (`idmesa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`tipo_id`) REFERENCES `tipocomida` (`idtipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mesas`
--
ALTER TABLE `mesas`
  ADD CONSTRAINT `mesas_ibfk_1` FOREIGN KEY (`local_id`) REFERENCES `local` (`idlocal`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_plato`) REFERENCES `menu` (`idplato`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`idusuarios`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD CONSTRAINT `reservaciones_ibfk_1` FOREIGN KEY (`reser_local`) REFERENCES `local` (`idlocal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservaciones_ibfk_2` FOREIGN KEY (`reser_mesa`) REFERENCES `mesas` (`idmesa`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
