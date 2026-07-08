package com.user.dao;


import com.user.model.Claim;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;



public class ClaimDAO {


private final String URL=
"jdbc:derby://localhost:1527/LostAndFound";

private final String USER="app";

private final String PASS="app";




public List<Claim> getPendingClaims(){


List<Claim> list =
new ArrayList<>();



String sql =
"SELECT * FROM APP.CLAIM "
+"WHERE STATUS='PENDING'";



try{


Class.forName(
"org.apache.derby.jdbc.ClientDriver");



Connection conn =
DriverManager.getConnection(
URL,USER,PASS);



PreparedStatement ps =
conn.prepareStatement(sql);



ResultSet rs =
ps.executeQuery();



while(rs.next()){


Claim c=new Claim();



c.setClaimId(
rs.getInt("CLAIM_ID"));


c.setItemId(
rs.getInt("ITEM_ID"));


c.setItemName(
rs.getString("ITEM_NAME"));


c.setUsername(
rs.getString("USERNAME"));


c.setClaimDate(
rs.getString("CLAIM_DATE"));


c.setProofDescription(
rs.getString("PROOF_DESCRIPTION"));


c.setStatus(
rs.getString("STATUS"));



list.add(c);


}



conn.close();



}catch(Exception e){

e.printStackTrace();

}



return list;


}


}