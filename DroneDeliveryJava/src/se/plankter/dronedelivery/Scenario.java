package se.plankter.dronedelivery;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Scenario {
	
	public Map map;
	public int nrDrones;
	public int maxSimTime;
	public int maxPayload;
	public int nrProductTypes;
	public int nrWarehouses;
	public int nrOrders;
	

	public static Scenario loadFromFile(String filepath) {
		
		Scenario loadedScenario = new Scenario();
		
		try {
			Scanner scanner = new Scanner(new File(filepath));

			int rows = scanner.nextInt();
			int cols = scanner.nextInt();
			loadedScenario.nrDrones = scanner.nextInt();
			loadedScenario.maxSimTime = scanner.nextInt();
			loadedScenario.maxPayload = scanner.nextInt();
			loadedScenario.map = new Map(rows, cols);

			System.out.println("maxPayload: " + loadedScenario.maxPayload);
			
			loadedScenario.nrProductTypes = scanner.nextInt();
			System.out.println("nrProductTypes: " + loadedScenario.nrProductTypes);
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Boo!");
		
		return loadedScenario;
	}

}
