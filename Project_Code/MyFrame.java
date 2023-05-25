import java.awt.Color;

import javax.swing.JFrame;

public class MyFrame extends JFrame {
	MyFrame(){
		this.setTitle("LoginScreen");
		this.setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
		this.setSize(420,420);
		this.setVisible(true);
		this.getContentPane().setBackground(Color.blue);

	}

}
