SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "America/Mexico_City";

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_inventario` int(11) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

CREATE TABLE `equipos_computo` (
`id_producto_inventario` varchar(50)
,`descripcion` varchar(255)
,`area` varchar(50)
,`departamento_equipo` varchar(50)
,`nombre_posicion_equipo` varchar(100)
,`ubicacion` varchar(250)
,`estado` varchar(100)
,`hostname_equipo` varchar(100)
,`tipo_computadora_equipo` varchar(100)
,`modelo` varchar(100)
,`etiqueta_servicio_equipo` varchar(100)
,`express_code_equipo` varchar(100)
,`procesador_equipo` varchar(100)
,`generacion_equipo` varchar(50)
,`memoria_equipo` varchar(50)
,`almacenamiento_equipo` varchar(50)
,`sistema_operativo_equipo` varchar(100)
,`cargador_equipo` varchar(50)
,`IPv4_v6_equipo` varchar(50)
,`observaciones` text
);

CREATE TABLE `inventarios` (
  `id_inventario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

CREATE TABLE `productos` (
  `id_producto_inventario` varchar(50) NOT NULL,
  `id_subcategoria` int(11) DEFAULT NULL,
  `descripcion` varchar(255) NOT NULL,
  `area` varchar(50) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `ubicacion` varchar(250) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `fecha_introduccion` date DEFAULT NULL,
  `fecha_salida` date DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `no_serie` varchar(50) DEFAULT NULL,
  `necesidad` text DEFAULT NULL,
  `linea_equipo` varchar(50) DEFAULT NULL,
  `departamento_equipo` varchar(50) DEFAULT NULL,
  `nombre_posicion_equipo` varchar(100) DEFAULT NULL,
  `hostname_equipo` varchar(100) DEFAULT NULL,
  `tipo_computadora_equipo` varchar(100) DEFAULT NULL,
  `etiqueta_servicio_equipo` varchar(100) DEFAULT NULL,
  `express_code_equipo` varchar(100) DEFAULT NULL,
  `procesador_equipo` varchar(100) DEFAULT NULL,
  `generacion_equipo` varchar(50) DEFAULT NULL,
  `nucleos` varchar(20) DEFAULT NULL,
  `memoria_equipo` varchar(50) DEFAULT NULL,
  `tipo_disco` varchar(45) DEFAULT NULL,
  `almacenamiento_equipo` varchar(50) DEFAULT NULL,
  `sistema_operativo_equipo` varchar(100) DEFAULT NULL,
  `cargador_equipo` varchar(50) DEFAULT NULL,
  `IPv4_v6_equipo` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `adicional` text DEFAULT NULL,
  `especificaciones` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

CREATE TABLE `productos_escanear` (
  `codigo_barras` varchar(20) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `productos_escanear` (`codigo_barras`, `descripcion`, `imagen`, `fecha`) VALUES
('7500463970917', 'Slimpop Sweet & Salty 125g', 'prod_7500463970917_1761334533.jpg', '2025-10-23'),
('7503036785103', 'Slimpop Netflix Sabor Salsas Negras 125g', 'prod_7503036785103_1761251383.jpg', '2025-10-23'),
('7503036787141', 'Slimpop Netflix Sabor a chamoy 140g', 'prod_7503036787141_1761251357.jpg', '2025-10-23'),
('7503036787165', 'Slimpop Netflix Sabor Cheddar & Caramel Mix 140g', 'prod_7503036787165_1761237331.jpg', '2025-10-23');

CREATE TABLE `registros_escaneos` (
  `id_escaneado` int(11) NOT NULL,
  `codigo_barras_producto` varchar(20) DEFAULT NULL,
  `descripcion_producto` varchar(255) DEFAULT NULL,
  `lote_escaneado` varchar(50) DEFAULT NULL,
  `fecha_escaneo` date DEFAULT NULL,
  `hora_escaneo` time DEFAULT NULL,
  `estado_escaneo` varchar(45) DEFAULT NULL,
  `nombre_colaborador_usuarios` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

CREATE TABLE `retiros` (
  `codigo_retiro` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `operacion` varchar(50) DEFAULT NULL,
  `no_colaborador_retiro` varchar(15) DEFAULT NULL,
  `inventario_retiro` int(11) DEFAULT NULL,
  `categoria_retiro` int(11) DEFAULT NULL,
  `subcategoria_retiro` int(11) DEFAULT NULL,
  `descripcion_retiro` varchar(255) NOT NULL,
  `cantidad_retiro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

CREATE TABLE `subcategorias` (
  `id_subcategoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

CREATE TABLE `usuarios` (
  `no_colaborador` varchar(15) NOT NULL,
  `nombre_colaborador` varchar(45) NOT NULL,
  `rol_colaborador` varchar(15) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `contrasena` varchar(15) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

INSERT INTO `usuarios` (`no_colaborador`, `nombre_colaborador`, `rol_colaborador`, `area`, `contrasena`, `fecha`, `estatus`) VALUES
('DELTA 580', 'Daniela', 'Administrador', 'TI', 'Buycraf7', '2025-10-16', 'activo');

ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD KEY `id_inventario` (`id_inventario`);

ALTER TABLE `inventarios`
  ADD PRIMARY KEY (`id_inventario`);

ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto_inventario`),
  ADD UNIQUE KEY `descripcion_unica` (`descripcion`),
  ADD KEY `fk_id_subcategoria` (`id_subcategoria`);

ALTER TABLE `productos_escanear`
  ADD PRIMARY KEY (`codigo_barras`),
  ADD UNIQUE KEY `descripcion` (`descripcion`);

ALTER TABLE `registros_escaneos`
  ADD PRIMARY KEY (`id_escaneado`),
  ADD KEY `fk_codigo_barras` (`codigo_barras_producto`),
  ADD KEY `fk_descripcion` (`descripcion_producto`);

ALTER TABLE `retiros`
  ADD PRIMARY KEY (`codigo_retiro`),
  ADD KEY `fk_no_colaborador` (`no_colaborador_retiro`),
  ADD KEY `fk_inventario` (`inventario_retiro`),
  ADD KEY `fk_categoria` (`categoria_retiro`),
  ADD KEY `fk_subcategoria` (`subcategoria_retiro`),
  ADD KEY `fk_descripcion_producto` (`descripcion_retiro`);

ALTER TABLE `subcategorias`
  ADD PRIMARY KEY (`id_subcategoria`),
  ADD KEY `id_categoria` (`id_categoria`);

ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`no_colaborador`),
  ADD UNIQUE KEY `nombre_colaborador` (`nombre_colaborador`),
  ADD UNIQUE KEY `nombre_colaborador_2` (`nombre_colaborador`),
  ADD UNIQUE KEY `nombre_colaborador_3` (`nombre_colaborador`),
  ADD UNIQUE KEY `nombre_colaborador_4` (`nombre_colaborador`);

ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `inventarios`
  MODIFY `id_inventario` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `registros_escaneos`
  MODIFY `id_escaneado` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `retiros`
  MODIFY `codigo_retiro` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `subcategorias`
  MODIFY `id_subcategoria` int(11) NOT NULL AUTO_INCREMENT;

DROP TABLE IF EXISTS `equipos_computo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`mypruebassd5`@`10.100.0.%` SQL SECURITY DEFINER VIEW `equipos_computo`  AS SELECT `productos`.`id_producto_inventario` AS `id_producto_inventario`, `productos`.`descripcion` AS `descripcion`, `productos`.`area` AS `area`, `productos`.`departamento_equipo` AS `departamento_equipo`, `productos`.`nombre_posicion_equipo` AS `nombre_posicion_equipo`, `productos`.`ubicacion` AS `ubicacion`, `productos`.`estado` AS `estado`, `productos`.`hostname_equipo` AS `hostname_equipo`, `productos`.`tipo_computadora_equipo` AS `tipo_computadora_equipo`, `productos`.`modelo` AS `modelo`, `productos`.`etiqueta_servicio_equipo` AS `etiqueta_servicio_equipo`, `productos`.`express_code_equipo` AS `express_code_equipo`, `productos`.`procesador_equipo` AS `procesador_equipo`, `productos`.`generacion_equipo` AS `generacion_equipo`, `productos`.`memoria_equipo` AS `memoria_equipo`, `productos`.`almacenamiento_equipo` AS `almacenamiento_equipo`, `productos`.`sistema_operativo_equipo` AS `sistema_operativo_equipo`, `productos`.`cargador_equipo` AS `cargador_equipo`, `productos`.`IPv4_v6_equipo` AS `IPv4_v6_equipo`, `productos`.`observaciones` AS `observaciones` FROM `productos` ;

ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`id_inventario`) REFERENCES `inventarios` (`id_inventario`) ON UPDATE CASCADE;

ALTER TABLE `productos`
  ADD CONSTRAINT `fk_id_subcategoria` FOREIGN KEY (`id_subcategoria`) REFERENCES `subcategorias` (`id_subcategoria`);

ALTER TABLE `retiros`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`categoria_retiro`) REFERENCES `categorias` (`id_categoria`),
  ADD CONSTRAINT `fk_descripcion_producto` FOREIGN KEY (`descripcion_retiro`) REFERENCES `productos` (`descripcion`),
  ADD CONSTRAINT `fk_inventario` FOREIGN KEY (`inventario_retiro`) REFERENCES `inventarios` (`id_inventario`),
  ADD CONSTRAINT `fk_no_colaborador` FOREIGN KEY (`no_colaborador_retiro`) REFERENCES `usuarios` (`no_colaborador`),
  ADD CONSTRAINT `fk_subcategoria` FOREIGN KEY (`subcategoria_retiro`) REFERENCES `subcategorias` (`id_subcategoria`);

ALTER TABLE `subcategorias`
  ADD CONSTRAINT `subcategorias_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON UPDATE CASCADE;
COMMIT;
