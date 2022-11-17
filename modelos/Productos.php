<?php 
//Incluímos inicialmente la conexión a la base de datos
require "../config/Conexion.php";

Class Productos
{
	//Implementamos nuestro constructor
	public function __construct()
	{

	}

	//Implementamos un método para insertar registros
	public function insertar($nombre,$precio,$imagen)
	{
		$sql="INSERT INTO productos (nombre,precio,imagen,estado)
		VALUES ('$nombre','$precio','$imagen','1')";
       // return ejecutarConsulta($sql);
        $idnew=ejecutarConsulta_retornarID($sql);

		$num_elementos=0;
		$sw=true;

		return $sw;
	}

	//Implementamos un método para editar registros
	public function editar($id,$nombre,$precio,$imagen)
	{
		$sql="UPDATE productos SET 
        nombre='$nombre',
        precio='$precio',
        imagen='$imagen' 
        WHERE id='$id'";
		
        ejecutarConsulta($sql);

		//Eliminamos todos los permisos asignados para volverlos a registrar
		
		$sw=true;


		return $sw;

	}


	//Implementar un método para mostrar los datos de un registro a modificar
	public function mostrar($id)
	{
		$sql="SELECT * FROM productos WHERE id='$id'";
		return ejecutarConsultaSimpleFila($sql);
	}

	//Implementar un método para listar los registros
	public function listar()
	{
		$sql="SELECT * FROM productos";
		return ejecutarConsulta($sql);		
	}
	//Implementar un método para listar los permisos marcados
	public function listarmarcados($id)
	{
		$sql="SELECT * FROM productopermiso WHERE id='$id'";
		return ejecutarConsulta($sql);
	}

    
    public function select()
	{
		$sql="SELECT * FROM productos WHERE estado=1 ORDER BY nombre DESC";
		return ejecutarConsulta($sql);		
	}

	public function desactivar($id)
	{
		$sql="UPDATE productos SET estado='0' WHERE id='$id'";
		return ejecutarConsulta($sql);
	}
	public function activar($id)
	{
		$sql="UPDATE productos SET estado='1' WHERE id='$id'";
		return ejecutarConsulta($sql);
	}
}

?>