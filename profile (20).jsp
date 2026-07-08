package com.user.dao;
import com.user.model.Report;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReportDAO {
    private String url = "jdbc:derby://localhost:1527/LostAndFound";
    private String user = "app";
    private String pass = "app";

    public List<Report> getAllReports() {
        List<Report> list = new ArrayList<>();
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM APP.LOST_ITEMS");
            
            while(rs.next()) {
                list.add(new Report(
                    rs.getString("ID"),
                    rs.getString("ITEM_NAME"),
                    rs.getString("LOCATION"),
                    rs.getString("DATE_LOST"),
                    rs.getString("STATUS")
                ));
            }
            conn.close();
        } catch (ClassNotFoundException | SQLException e) { e.printStackTrace(); }
        return list;
    }
}