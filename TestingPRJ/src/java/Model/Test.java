/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import DAL.UserTestDAO;

/**
 *
 * @author lvhn1
 */
public class Test {
    
    private int id;
    private String title;
    private String status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getAvg() {
        return String.format("%.2f", new UserTestDAO().getAverageScoreByTestId(id));
    }
    
    public int getTotal() {
        return new UserTestDAO().getTotalTestsTakenByTestId(id);
    }
    
}
