package sbkim.com.board;

import java.util.Scanner;

class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String n = sc.next().toLowerCase();
		
		System.out.println(Integer.parseInt(n, 16));
		
	}
}

