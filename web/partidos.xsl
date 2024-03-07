<?xml version="1.0" encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" doctype-system="legacy-compat" encoding="utf-8"/>
	<xsl:template match='/club_voleibol'>
		<html lang="es">
			<head>
				<link href="../css/estilo.css" rel="stylesheet" type="text/css" />
				<meta charset="utf-8"/>
				<meta name="description" content="Página partidos" />
				<title>Partidos</title>
			</head>
			
			<body>
				<header>
					<img src= "../img/logotipo.png" alt= "Reservas" />
					<a href="tienda.xml">Tienda</a>
					<a href="equipos.xml">Equipos</a>
					<a href="partidos.xml">Partidos</a>
				</header>
				
				<main>
					<h1>PARTIDOS</h1>
					<table>
						<tr>
							<th>PARTIDO</th>
							<th>FECHA</th>
							<th>RESULTADO</th>
						</tr>
						<!-- Selecciono partidos jugados en la ciudad de Lima -->
						<xsl:apply-templates select="partido[lugar/@ciudad='Lima']">
						<!-- Se ordenan por fecha desde el más reciente  -->
							<xsl:sort select="fecha" order="descending"/>
						</xsl:apply-templates>
					</table>			
				</main>
				<footer>
					<address>&#169; Desarrollado por info@birt.eus</address>
				</footer>
			</body>
		</html>
	</xsl:template>
	
	<!-- Plantilla partidos -->
	<xsl:template match="partido">
		<tr>
			<td><xsl:value-of select="equipos/local"/> - <xsl:value-of select="equipos/visitante"/></td>
			<td><xsl:value-of select="fecha"/></td>
			<xsl:choose>
			<!-- Si gana el visitante se mostrara en azul. Se aplica la clase "azul" -->
				<xsl:when test="equipos/local/@puntuacion&lt;equipos/visitante/@puntuacion">
					<td class="azul"><xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/></td>	
				</xsl:when>
				<xsl:otherwise>
					<td><xsl:value-of select="equipos/local/@puntuacion"/> - <xsl:value-of select="equipos/visitante/@puntuacion"/></td>
				</xsl:otherwise>
			</xsl:choose>
		</tr>
		
	</xsl:template>
</xsl:stylesheet>