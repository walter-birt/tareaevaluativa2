<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" doctype-system="legacy-compat" encoding="utf-8"/>
	<xsl:template match='/club_voleibol'>


		<html lang="es">
			
			<head>
				<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
				<meta charset="utf-8"/>
				<meta name="description" content="Página equipos" />
				<title>Equipos</title>
			</head>
			
			<body>
				<header>
					<img src= "../img/logotipo.png" alt= "Reservas" />
					<a href="tienda.xml">Tienda</a>
					<a href="equipos.xml">Equipos</a>
					<a href="partidos.xml">Partidos</a>
				</header>
				
				<main>
					<!-- Obtener nombre del entrenador -->
					<xsl:variable name="nombreEntrenador" select="equipo[1]/entrenador/nombre"/>
					<h1><a href="{equipo[1]/entrenador/url}"><xsl:value-of select='$nombreEntrenador'/></a></h1>
					
					<article class="equipos">
						<!-- Seleccionar equipo según el nombre del entrenador(en la variable) -->
						<h4><xsl:value-of select="equipo[entrenador/nombre=$nombreEntrenador]/nombre"/></h4>
						<!-- Aplicar plantilla jugadores que pertecen al equipo entrenado por $nombreEntrenador -->
						<xsl:apply-templates select="equipo[entrenador/nombre=$nombreEntrenador]/jugadores"/>
					</article>
				</main>
				<footer>
					<address>&#169; Desarrollado por info@birt.eus</address>
				</footer>
			</body>
		</html>
	</xsl:template>
	 
	<!-- Plantilla jugador -->
	<xsl:template match="jugador">   
		<xsl:choose>
			<xsl:when test='@titular="si"'>
				<p><xsl:value-of select="@camiseta"/> - <xsl:value-of select="nombre"/></p>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	
</xsl:stylesheet>