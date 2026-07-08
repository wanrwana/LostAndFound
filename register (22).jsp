package com.user.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.user.model.Claim;

public class VerifyDAO {
    private final String url = "jdbc:derby://localhost:1527/LostAndFound";
    private final String user = "app";
    private final String password = "app";

    // Update claim status + remarks
    public void updateClaim(int claimId, String status, String remarks) {
        String sql = "UPDATE APP.CLAIM SET STATUS = ?, REMARKS = ? WHERE CLAIM_ID = ?";
        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setString(2, remarks != null ? remarks : "");
            ps.setInt(3, claimId);
            ps.executeUpdate();

            // If approved, mark item as HANDED_OVER
            if ("APPROVED".equalsIgnoreCase(status)) {
                String updateItem = "UPDATE APP.LOST_ITEMS SET STATUS = ? " +
                                    "WHERE ID = (SELECT ITEM_ID FROM APP.CLAIM WHERE CLAIM_ID = ?)";
                try (PreparedStatement psItem = conn.prepareStatement(updateItem)) {
                    psItem.setString(1, "HANDED_OVER");
                    psItem.setInt(2, claimId);
                    psItem.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Get all pending claims
    public List<Claim> getPendingClaims() {
        List<Claim> list = new ArrayList<>();
        String sql = "SELECT CLAIM_ID, ITEM_ID, USERNAME, STATUS, REMARKS " +
                     "FROM APP.CLAIM WHERE STATUS = 'Pending'";
        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Claim c = new Claim();
                c.setClaimId(rs.getInt("CLAIM_ID"));
                c.setItemId(rs.getInt("ITEM_ID"));
                c.setUsername(rs.getString("USERNAME"));
                c.setStatus(rs.getString("STATUS"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Get all approved claims
    public List<Claim> getApprovedClaims() {
        List<Claim> list = new ArrayList<>();
        String sql = "SELECT CLAIM_ID, ITEM_ID, USERNAME, STATUS, REMARKS " +
                     "FROM APP.CLAIM WHERE STATUS = 'Approved'";
        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Claim c = new Claim();
                c.setClaimId(rs.getInt("CLAIM_ID"));
                c.setItemId(rs.getInt("ITEM_ID"));
                c.setUsername(rs.getString("USERNAME"));
                c.setStatus(rs.getString("STATUS"));
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
