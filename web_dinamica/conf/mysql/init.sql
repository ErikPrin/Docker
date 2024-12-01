CREATE TABLE `proyectos` (
  `IdProyecto` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NOT NULL,
  `Descripcion` VARCHAR(500) NOT NULL,
  `foto` longblob DEFAULT NULL,
  PRIMARY KEY (`IdProyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `proyectos`
INSERT INTO `proyectos` (`IdProyecto`, `Nombre`, `Descripcion`, `foto`) VALUES
(1, 'Desarrollo I3', 'Este proyecto para empezar fue en colaboracion con Salesianos.', 'Imagenes/i3.jpeg'),
(2, 'Desarrollo Pagina Web', 'Este proyecto fue mas sencillo. Consistia en crear una pagina web con HTML y CSS.', 'Imagenes/pw.jpg'),
(3, 'Desarrollo y administracion de base de datos', 'En este proyecto nuestro equipo diseno una base de datos completa y su administracion.', 'Imagenes/bd.jpg');

COMMIT;


--                                                                          -- Índices para tablas volcadas                                             --

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`IdProyecto`);
ALTER TABLE `proyectos`
  MODIFY `IdProyecto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

