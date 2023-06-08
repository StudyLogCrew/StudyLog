public class Evaluation {
    ArrayList<String> reviews = new ArrayList <String>; //graptes vathmologies
    int upvotes=0;
    public void ReviewFrame() {                              //frames
        setTitle("Review System");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        // Create a panel to hold the components
        JPanel panel = new JPanel();
        panel.setLayout(new BorderLayout());

        // Create a button for upvoting
        JButton upvoteButton = new JButton("Upvote");
        upvoteButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                upvotes++;
                updateCountLabel();
            }
        });
        panel.add(upvoteButton, BorderLayout.NORTH);

        // Create a text area for writing reviews
        JTextArea reviewTextArea = new JTextArea();
        reviewTextArea.setLineWrap(true);
        JScrollPane scrollPane = new JScrollPane(reviewTextArea);
        panel.add(scrollPane, BorderLayout.CENTER);

        // Create a button for submitting the review
        JButton submitButton = new JButton("Submit");
        submitButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String review = reviewTextArea.getText();
                reviews.add(review);
                reviewTextArea.setText("");
                System.out.println("Review submitted: " + review);
            }
        });
        panel.add(submitButton, BorderLayout.SOUTH);

        // Create a label to display the upvote count
        countLabel = new JLabel("Upvotes: 0");
        panel.add(countLabel, BorderLayout.WEST);

        // Add the panel to the frame
        add(panel);

        pack(); // Adjusts the frame size to fit the components
        setLocationRelativeTo(null); // Center the frame on the screen
    }

    private void updateCountLabel() {
        countLabel.setText("Upvotes: " + upvotes);
    }
}
