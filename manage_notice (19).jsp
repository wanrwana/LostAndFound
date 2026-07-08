package com.user.dao;


import com.user.model.Handover;

import java.sql.*;
import java.util.*;



public class HandoverDAO {



private final String url =
"jdbc:derby://localhost:1527/LostAndFound";


private final String user="app";

private final String password="app";





public List<Handover> getAllRecords(){


List<Handover> list =
new ArrayList<>();



String sql =

"SELECT h.ID,"
+"h.CLAIM_ID,"
+"h.HANDOVER_DATE,"
+"h.STATUS,"
+"h.ITEM_ID,"
+"l.ITEM_NAME,"
+"l.LOCATION,"
+"c.USERNAME AS STUDENT_NAME "

+"FROM APP.HANDOVER_LOG h "

+"JOIN APP.CLAIM c "
+"ON h.CLAIM_ID=c.CLAIM_ID "

+"JOIN APP.LOST_ITEMS l "
+"ON h.ITEM_ID=l.ID";





try(Connection conn =
DriverManager.getConnection(
url,user,password);



PreparedStatement ps =
conn.prepareStatement(sql);



ResultSet rs =
ps.executeQuery())

{



while(rs.next()){



Handover h =
new Handover();



h.setId(
rs.getInt("ID"));



h.setClaimId(
rs.getInt("CLAIM_ID"));



h.setHandoverDate(
rs.getDate("HANDOVER_DATE"));



h.setStatus(
rs.getString("STATUS"));



h.setItemName(
rs.getString("ITEM_NAME"));



h.setStudentName(
rs.getString("STUDENT_NAME"));



h.setLocation(
rs.getString("LOCATION"));



list.add(h);



}



}

catch(Exception e){

e.printStackTrace();

}



return list;


}






public void updateStatus(
int id,String status){



String sql =
"UPDATE APP.HANDOVER_LOG "
+"SET STATUS=? WHERE ID=?";



try(Connection conn =
DriverManager.getConnection(
url,user,password);



PreparedStatement ps =
conn.prepareStatement(sql)){



ps.setString(1,status);

ps.setInt(2,id);



ps.executeUpdate();



}

catch(Exception e){

e.printStackTrace();

}



}



}