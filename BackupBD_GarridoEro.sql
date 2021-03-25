-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-03-2021 a las 17:33:49
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tenda_hw_boa`
--
CREATE DATABASE IF NOT EXISTS `tenda_hw_boa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci;
USE `tenda_hw_boa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deseados`
--

CREATE TABLE `deseados` (
  `id_usuario` int(4) NOT NULL,
  `id_prod` int(4) NOT NULL,
  `cantidad` int(2) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(4) NOT NULL,
  `nome_marca` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `nome_marca`) VALUES
(1, 'intel'),
(2, 'amd'),
(3, 'Toshiba'),
(4, 'MSI'),
(5, 'ASUS'),
(6, 'Gigabyte'),
(7, 'AsRock'),
(8, 'NVIDIA'),
(14, 'Razer'),
(15, 'Logitech'),
(16, 'Corsair'),
(17, 'Coolbox'),
(18, 'Ozone'),
(19, 'Zowie'),
(20, 'Samsung'),
(21, 'Acer'),
(22, 'NZXT'),
(23, 'Cooler Master'),
(24, 'Noctua'),
(25, 'Talius'),
(26, 'LG'),
(27, 'Panasonic'),
(28, 'Mars Gaming'),
(29, 'Sony'),
(30, 'RODE'),
(31, 'Audio Technica'),
(32, 'Seagate');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_compra` int(4) NOT NULL,
  `n_productos` int(3) NOT NULL,
  `prezo_total` int(5) NOT NULL,
  `fecha_pedido` date NOT NULL DEFAULT current_timestamp(),
  `fecha_devolucion` date NOT NULL,
  `id_usuario` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_compra`, `n_productos`, `prezo_total`, `fecha_pedido`, `fecha_devolucion`, `id_usuario`) VALUES
(10, 4, 715, '2021-02-28', '0000-00-00', 1),
(11, 1, 55, '2021-02-28', '0000-00-00', 1),
(12, 1, 200, '2021-02-28', '0000-00-00', 1),
(13, 1, 30, '2021-02-28', '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_productos`
--

CREATE TABLE `pedidos_productos` (
  `id_compra` int(4) NOT NULL,
  `id_prod` int(4) NOT NULL,
  `unidades` int(3) NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'Enviado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `pedidos_productos`
--

INSERT INTO `pedidos_productos` (`id_compra`, `id_prod`, `unidades`, `estado`) VALUES
(10, 1, 2, 'Devolto'),
(13, 21, 1, 'Devolto'),
(10, 37, 1, 'Devolto'),
(12, 58, 1, 'Devolto'),
(10, 60, 1, 'Devolto'),
(11, 60, 1, 'Devolto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_prod` int(4) NOT NULL,
  `titulo` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `caracteristicas` varchar(200) COLLATE utf8mb4_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8mb4_spanish_ci NOT NULL,
  `prezo` int(5) NOT NULL,
  `imaxe` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'imaxesproductos/default.png',
  `id_admin` int(4) NOT NULL,
  `id_marca` int(4) NOT NULL,
  `id_articulo` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_prod`, `titulo`, `caracteristicas`, `descripcion`, `prezo`, `imaxe`, `id_admin`, `id_marca`, `id_articulo`) VALUES
(1, 'AMD Ryzen 3600', 'Nucleos:6;Hilos:8;', 'Procesador de 4 nucleos y 8 hilos', 120, '../imaxesproductos/procesador.png', 2, 2, 1),
(2, 'AMD Ryzen 3600', 'Nucleos:4;Hilos:8;', 'Procesador de 4 nucleos y 8 hilos', 160, '../imaxesproductos/procesador.png', 2, 2, 1),
(3, 'AMD Ryzen 3600', 'Nucleos:4;Hilos:8;', 'Procesador de 4 nucleos y 8 hilos', 160, '../imaxesproductos/procesador.png', 2, 2, 1),
(4, 'Intel i5', 'Nucleos:6;Hilos:8;', 'Procesador de 4 nucleos y 8 hilos', 160, '../imaxesproductos/procesador.png', 2, 1, 1),
(5, 'Intel i7', 'Nucleos:4;Hilos:8;', 'Procesador de 8 nucleos y 16 hilos', 250, '../imaxesproductos/procesador.png', 2, 1, 1),
(6, 'AMD Ryzen 3600', 'Nucleos:4;Hilos:8;', 'Procesador de 4 nucleos y 8 hilos', 160, '../imaxesproductos/procesador.png', 2, 2, 1),
(7, 'AMD Ryzen 3600', 'Nucleos:4;Hilos:8;', 'Procesador de 4 nucleos y 8 hilos', 160, '../imaxesproductos/procesador.png', 2, 2, 1),
(8, 'Intel i7', 'Nucleos:4;Hilos:8;', 'Procesador de 8 nucleos y 16 hilos', 250, '../imaxesproductos/procesador.png', 2, 1, 1),
(9, 'AMD Ryzen 3600', 'Nucleos:4;Hilos:8;', 'Procesador de 4 nucleos y 8 hilos', 160, '../imaxesproductos/procesador.png', 2, 2, 1),
(10, 'AMD Ryzen 3600', 'Nucleos:4;Hilos:8;', 'Procesador de 4 nucleos y 8 hilos', 160, '../imaxesproductos/procesador.png', 2, 2, 1),
(11, 'AMD Ryzen 3600', 'Nucleos:4;Hilos:8;', 'Procesador de 4 nucleos y 8 hilos', 160, '../imaxesproductos/procesador.png', 2, 2, 1),
(12, 'Intel i5', 'Nucleos:4;Hilos:8;', 'Procesador de 4 nucleos y 8 hilos', 160, '../imaxesproductos/procesador.png', 2, 1, 1),
(13, 'Intel i7', 'Nucleos:4;Hilos:8;', 'Procesador de 8 nucleos y 16 hilos', 250, '../imaxesproductos/procesador.png', 2, 1, 1),
(14, 'AMD Ryzen 3600', 'Nucleos:4;Hilos:8;', 'Procesador de 4 nucleos y 8 hilos', 160, '../imaxesproductos/procesador.png', 2, 2, 1),
(15, 'AMD Ryzen 3600', 'Nucleos:4;Hilos:8;', 'Procesador de 4 nucleos y 8 hilos', 160, '../imaxesproductos/procesador.png', 2, 2, 1),
(16, 'Intel i7', 'Nucleos:8;Hilos:8;', 'Procesador de 8 nucleos y 16 hilos', 250, '../imaxesproductos/procesador.png', 2, 1, 1),
(17, 'AMD Ryzen 3600', 'Nucleos:4;Hilos:8;', 'Procesador de 4 nucleos y 8 hilos', 160, '../imaxesproductos/procesador.png', 2, 2, 1),
(18, 'AMD Ryzen 3600', 'Nucleos:4;Hilos:8;', 'Procesador de 4 nucleos y 8 hilos', 300, '../imaxesproductos/procesador.png', 2, 2, 1),
(19, 'Intel i5', 'Nucleos:4;Hilos:8;', 'Procesador de 6 nucleos y 8 hilos', 160, '../imaxesproductos/procesador.png', 2, 1, 1),
(20, 'DISCO CHINO', 'Capacidad:500MB;', 'Gran velocidad y capacidad', 60, '../imaxesproductos/procesador.png', 2, 3, 2),
(21, 'DISCO RUSO', 'Capacidad:1TB;', 'Poca velocidad pero gran capacidad', 30, '../imaxesproductos/procesador.png', 2, 2, 2),
(23, 'PLACA MSI X570', 'Formato:ATX;Chipset:X570', 'Placa con chipset x570 para AMD', 120, '../imaxesproductos/placa.jpg', 2, 4, 3),
(24, 'ASUS GTX 1080', 'Tipo:GTX 1080;', 'Tarjeta grafica de NVIDIA GTX 1080', 600, '../imaxesproductos/grafica.png', 2, 8, 4),
(25, 'AMD RX 5700', 'Tipo:RX 5700', 'Grafica potente de AMD', 600, '../imaxesproductos/grafica.png', 2, 2, 4),
(26, 'RATON INALAMBRICO MSI', 'Tipo:inalambrico;', 'Raton inálambrico de marca MSI', 20, '../imaxesproductos/raton.png', 2, 4, 5),
(27, 'RATON CON CABLE ASUS', 'Tipo:cable;', 'Raton cableado de marca ASUS', 30, '../imaxesproductos/raton.png', 2, 5, 5),
(28, 'Raton MSI cable', 'Tipo:cable;', 'Raton cable msi', 30, '../imaxesproductos/28.png', 2, 4, 5),
(29, 'RATON INALAMBRICO ASUS', 'Tipo:inalambrico;', 'Raton inalambrico ASUS', 20, '../imaxesproductos/29.png', 2, 5, 5),
(30, 'Razer Blackwidow', 'Tipo:mecanico;', 'Teclado premium marca Razer', 120, '../imaxesproductos/6.jpg', 21, 14, 6),
(31, 'CORSAIR DESKTOP DK101', 'Tipo:Membrana;', 'Teclado basico de membrána marca Corsair', 20, '../imaxesproductos/6.png', 21, 16, 6),
(34, 'Zowie Celeritas 2', 'Tipo:optomecanico;', 'Teclado alto rendimiento zowie', 200, '../imaxesproductos/744.png', 21, 1, 6),
(35, 'Zowie bq2123', 'Tipo:membrana;', 'Teclado barato zowie', 15, '../imaxesproductos/506.png', 21, 19, 6),
(36, 'ZOWIE XL2411P', 'Tipo:ips;', 'Monitor para ESPORTS ZOWIE', 190, '../imaxesproductos/647.jpg', 21, 19, 7),
(37, 'MONITOR CURVO SAMSUNG', 'Tipo:curvo;', 'Monitor curvo Samsung', 420, '../imaxesproductos/152.png', 21, 20, 7),
(38, 'CORSAIR ICUE 7200', 'Disipacion:liquida;', 'Disipación Líquida marca Corsair', 300, '../imaxesproductos/581.png', 21, 16, 8),
(39, 'NZXT KRAKEN X53', 'Disipacion:liquida;', 'Disipacion Líquida Premium NZXT', 320, '../imaxesproductos/486.jpg', 21, 22, 8),
(40, 'VENTILADOR HYPER T4', 'Disipacion:aire;', 'Ventilador por aire marca Cooler Master', 20, '../imaxesproductos/749.jpg', 21, 23, 8),
(42, 'CAJA MSI MINI ITX 2', 'Formato:miniitx;', 'Caja con formato miniitx', 80, '../imaxesproductos/122.jpg', 21, 4, 9),
(43, 'CAJA NZXT ATX', 'Formato:atx;', 'Caja grande formato ATX', 120, '../imaxesproductos/728.jpeg', 21, 22, 9),
(44, 'CAJA EATX COOLER MASTER', 'Formato:eatx;', 'Caja formato EATX marca Cooler Master', 140, '../imaxesproductos/568.png', 21, 23, 9),
(45, 'CAJA CORSAIR MINI ITX 1', 'Formato:miniitx;', 'Caja formato mini itx corsair', 55, '../imaxesproductos/325.jpg', 21, 16, 9),
(46, 'CAJA TALIUS MATX', 'Formato:microatx;', 'Caja con fomato micro ATX marca Talius', 80, '../imaxesproductos/143.jpg', 21, 25, 9),
(47, 'SAMSUNG 4K', 'resolucion:4096x2160;', 'Pantalla samsung 4k FULL', 600, '../imaxesproductos/734.png', 21, 20, 10),
(48, 'SAMSUNG 4K UHD', 'resolucion:3840x2160;', 'Pantalla samsung 4k UHD', 700, '../imaxesproductos/430.png', 21, 20, 10),
(49, 'SAMSUNG TELE 1080', 'Resolucion:1920x1080;', 'Tele samsung 1080', 200, '../imaxesproductos/650.jpg', 21, 20, 10),
(50, 'CASCOS JACK TALIUS', 'conexion:jack;', 'Cascos Talius conexion Jack', 35, '../imaxesproductos/192.jpg', 2, 25, 11),
(51, 'CASCOS OZONE JACK 3.5', 'conexion:jack35;', 'Cascos Marca Ozone Jack 3.5', 45, '../imaxesproductos/514.png', 2, 18, 11),
(52, 'MARS GAMING MICRO USB', 'conexion:microusb;', 'Cascos mars gaming conexion microusb', 50, '../imaxesproductos/345.png', 2, 28, 11),
(53, 'LOGITECH LGX45 MINI USB', 'conexion:miniusb;', 'Cascos Logitech mini usb', 80, '../imaxesproductos/555.png', 2, 15, 11),
(54, 'LOGITECH G430 USB', 'conexion:usb;', 'Cascos logitech usb', 90, '../imaxesproductos/300.png', 2, 15, 11),
(55, 'CORSAIR VOID PRO USB', 'conexion:usbc;', 'Cascos corsair conexion usb', 90, '../imaxesproductos/286.jpg', 2, 16, 11),
(56, 'Sony SN798 BLUETHOOT', 'conexion:bluetooth;', 'Cascos sony bluetooth', 76, '../imaxesproductos/404.png', 2, 29, 11),
(57, 'MICRO CONDENSADOR RODE', 'Micro:condensador;', 'Micrófono condensador Marca RODE', 250, '../imaxesproductos/673.jpg', 2, 30, 12),
(58, 'MICRO INALÁMBRICO SONY', 'micro:inalambrico;', 'Micrófono marca sony inalambrico', 200, '../imaxesproductos/315.png', 2, 29, 12),
(59, 'MICRO DINAMICO AUDIO TECHNICA', 'micro:dinamico;', 'Micrófono dinámico Audio Technica', 100, '../imaxesproductos/640.jpg', 2, 31, 12),
(60, 'PLACA ASUS B350', 'Chipset:b350;', 'Placa pase con chipset b350', 55, '../imaxesproductos/248.png', 21, 5, 3),
(61, 'DISOC SEAGATE 250MB', 'Capacidad:250MB;', 'Disco marca seagate buenisimo', 50, '../imaxesproductos/544.jpg', 21, 32, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_articulo`
--

CREATE TABLE `tipo_articulo` (
  `id_articulo` int(4) NOT NULL,
  `nome_articulo` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_articulo`
--

INSERT INTO `tipo_articulo` (`id_articulo`, `nome_articulo`) VALUES
(1, 'procesadores'),
(2, 'discos duros'),
(3, 'placa base'),
(4, 'tarjetas graficas'),
(5, 'ratones'),
(6, 'teclados'),
(7, 'monitores'),
(8, 'disipacion'),
(9, 'cajas'),
(10, 'television'),
(11, 'cascos'),
(12, 'microfonos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(4) NOT NULL,
  `nombre` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `apellido` varchar(20) COLLATE utf8mb4_spanish_ci NOT NULL,
  `telefono` varchar(9) COLLATE utf8mb4_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `tipo` varchar(7) COLLATE utf8mb4_spanish_ci NOT NULL DEFAULT 'normal',
  `contrasenha` varchar(50) COLLATE utf8mb4_spanish_ci NOT NULL,
  `imaxe` varchar(100) COLLATE utf8mb4_spanish_ci DEFAULT '../imaxesperfil/default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `telefono`, `email`, `tipo`, `contrasenha`, `imaxe`) VALUES
(1, 'ero', 'garrido', '628635720', 'ero@gmail.com', 'normal', 'abc123.', '../imaxesperfil/ero.png'),
(2, 'manolo', 'garcia', '629816589', 'manolo@gmail.com', 'admin', 'abc123.', 'imxperfil/perfilmanu.png'),
(3, 'Pedro', 'Garcia', '628664310', 'pedro@gmail.com', 'normal', 'abc123.', NULL),
(12, 'juan', 'mendez', '987674560', 'juan@gmail.com', 'normal', 'abc123.', NULL),
(17, 'martin', 'lopez', '972451249', 'martin@gmail.com', 'normal', 'abc123.', NULL),
(21, 'maria', 'besada', '754123123', 'maria@gmail.com', 'admin', 'abc123.', NULL),
(22, 'miguel', 'lopez', '895412738', 'miguel@gmail.com', 'normal', 'abc123.', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `deseados`
--
ALTER TABLE `deseados`
  ADD PRIMARY KEY (`id_usuario`,`id_prod`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_prod` (`id_prod`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_compra`);

--
-- Indices de la tabla `pedidos_productos`
--
ALTER TABLE `pedidos_productos`
  ADD PRIMARY KEY (`id_prod`,`id_compra`),
  ADD KEY `id_compra` (`id_compra`),
  ADD KEY `id_prod` (`id_prod`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_prod`),
  ADD KEY `id_marca` (`id_marca`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_articulo` (`id_articulo`);

--
-- Indices de la tabla `tipo_articulo`
--
ALTER TABLE `tipo_articulo`
  ADD PRIMARY KEY (`id_articulo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_compra` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_prod` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de la tabla `tipo_articulo`
--
ALTER TABLE `tipo_articulo`
  MODIFY `id_articulo` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `deseados`
--
ALTER TABLE `deseados`
  ADD CONSTRAINT `fk_id_prod_prod` FOREIGN KEY (`id_prod`) REFERENCES `productos` (`id_prod`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_usuario_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos_productos`
--
ALTER TABLE `pedidos_productos`
  ADD CONSTRAINT `fk_compra_pedidos_productos` FOREIGN KEY (`id_compra`) REFERENCES `pedidos` (`id_compra`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_productos_producto` FOREIGN KEY (`id_prod`) REFERENCES `productos` (`id_prod`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_admin_usuario` FOREIGN KEY (`id_admin`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_articulo_tipo_articulo` FOREIGN KEY (`id_articulo`) REFERENCES `tipo_articulo` (`id_articulo`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_marca_marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
