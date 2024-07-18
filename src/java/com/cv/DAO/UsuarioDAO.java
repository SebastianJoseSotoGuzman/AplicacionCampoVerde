package com.cv.DAO;

import com.cv.conection.ConexionBD;
import com.cv.model.entity.Usuario;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

public class UsuarioDAO {

    ConexionBD cn = new ConexionBD();
    int mensaje = 0;
    PreparedStatement ps = null;
    ResultSet rs = null;
    Connection con = null;
    String mensaj = "";
    Usuario U = new Usuario();

    public List ListadoUsuario() {

        ArrayList<Usuario> list = new ArrayList<>();

        String sql = "select * from usuario";

        try {

            con = cn.getConnection();

            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();

            while (rs.next()) {

                Usuario usu = new Usuario();

                usu.setId(rs.getInt("id"));
                usu.setNombre(rs.getString("nombre"));
                usu.setUsu(rs.getString("usu"));
                usu.setPassword(rs.getString("password"));
                usu.setRol(rs.getString("rol"));
                usu.setFilename1(rs.getString("filename1"));

                list.add(usu);
            }
        } catch (Exception e) {

        }

        return list;

    }

    public Usuario list(int id) {
        ArrayList<Usuario> list = new ArrayList<>();
        String sql = "select * from usuario where id=" + id;

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                U.setId(rs.getInt("id"));
                U.setNombre(rs.getString("nombre"));
                U.setUsu(rs.getString("usu"));
                U.setPassword(rs.getString("password"));
                U.setRol(rs.getString("rol"));
                U.setFilename1(rs.getString("filename1"));
                list.add(U);
            }

        } catch (Exception e) {

        }
        return U;
    }

    public boolean addimg(Usuario i) {
        boolean rpt = false;
        try {

            con = cn.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into usuario values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setInt(1, i.getId());
            pst.setString(2, i.getCodigo());
            pst.setString(3, i.getNombre());
            pst.setInt(4, i.getIdTipodocumento());
            pst.setString(5, i.getNrodocumento());
            pst.setDouble(6, i.getSueldo());
            pst.setString(7, i.getTelefono());
            pst.setString(8, i.getDireccion());
            pst.setString(9, i.getEmail());
            pst.setString(10, i.getFechaderegistro());
            pst.setString(11, i.getFilename1());
            pst.setString(12, i.getPath1());
            pst.setString(13, i.getUsu());
            pst.setString(14, i.getPassword());
            pst.setString(15, i.getRol());
            pst.setString(16, i.getEstado());

            if (pst.executeUpdate() == 1) {
                rpt = true;
            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return rpt;
    }

    public boolean Editimgg(Usuario i) {
        boolean rpt = false;
        try {
            con = cn.getConnection();
            String sql = "UPDATE usuario SET nombre=?, usu=?, password=?, rol=?, filename1=?, path1=? WHERE id=?";
            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1, i.getNombre());
            pst.setString(2, i.getUsu());
            pst.setString(3, i.getPassword());
            pst.setString(4, i.getRol());
            pst.setString(5, i.getFilename1());
            pst.setString(6, i.getPath1());
            pst.setInt(7, i.getId());

            if (pst.executeUpdate() == 1) {
                rpt = true;
            }

        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return rpt;
    }

    public boolean Eliminar(int id) {
        boolean flag = false;
        String sql = "delete from usuario where id=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            if (ps.executeUpdate() == 1) {
                flag = true;
            }
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return flag;
    }

    public int usu(String usu, String pass) {
        String sql = "SELECT id FROM usuario WHERE usu ='" + usu + "' AND password='" + pass + "'";

        try {
            int Nfactura = 0;
            con = cn.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Nfactura = rs.getInt("id");
            }

            return Nfactura;

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return 0;
        }

    }

    public Usuario BuscarPorId(int idUsuario) {
        Usuario u = null;
        String sql = "select * from usuario where id = ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            rs = ps.executeQuery();
            if (rs.next()) {
                u = new Usuario();
                u.setNombre(rs.getString("nombre"));
                u.setUsu(rs.getString("usu"));
                u.setPassword(rs.getString("password"));
                u.setRol(rs.getString("rol"));
            }
        } catch (SQLException e) {
            mensaj = e.getMessage();
        } finally {
            cn.desconectar();
        }
        return u;
    }

    public boolean validacion(String cl) {
        boolean flag = false;
        String sql = "select usu from Usuario where usu=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cl);
            rs = ps.executeQuery();
            while (rs.next()) {
                flag = true;
            }
        } catch (Exception e) {

        }
        return flag;
    }

    public boolean vali(Usuario cli) {
        boolean flag = false;
        String sql = "select * from Usuario where id=" + cli.getNombre();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                flag = true;
            }
        } catch (Exception e) {

        }
        return flag;
    }

    public int BuscarNusuarios() {
        String sSQL = "SELECT COUNT(*) as Nusuarios FROM usuario";

        try {
            int Nusuarios = 0;
            con = cn.getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sSQL);
            while (rs.next()) {
                Nusuarios = rs.getInt("Nusuarios");
            }
            return Nusuarios;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return 0;
        }

    }

    public static String getNombre(int cod) {
        try {
            String sql = "Select Usu from Usuario where id=" + cod;
            Connection connection = ConexionBD.Conectar();
            PreparedStatement prepare = connection.prepareStatement(sql);
            ResultSet resultSet = prepare.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString("Usu");
            }
            return "--";
        } catch (Exception e) {
            return "--";
        }
    }

    public static Usuario listimg(String codigo) {
        Usuario U = new Usuario();
        Connection cn;
        ConexionBD con = new ConexionBD();
        cn = con.Conectar();

        try {
            CallableStatement cs = cn.prepareCall("CALL MOSTRAR_USUARIO_POR_CODIGO (?)");
            cs.setString(1, codigo);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                U.setId(rs.getInt("id"));
                U.setNombre(rs.getString("nombre"));
                U.setUsu(rs.getString("usu"));
                U.setPassword(rs.getString("password"));
                U.setRol(rs.getString("rol"));
                U.setFilename1(rs.getString("filename1"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return U;
    }

    public static void main(String[] args) {
        UsuarioDAO mp = new UsuarioDAO();

    }

}
