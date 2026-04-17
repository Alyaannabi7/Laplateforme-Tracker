package controller;

import java.util.ArrayList;
import model.Professor;

public class ProfessorManager {
    private ArrayList<Professor> professors = new ArrayList<>();
    
    public void addProfessor(Professor professor) {
        professors.add(professor);
    }
    public void showAllProfessors(){
        for (Professor p : professors) {
            System.out.println(p);
        }
    }
}