package com.bloggersden.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {

	public static boolean deleteFile(String path) {

		boolean fileDeleted = false;

		try {

			File file = new File(path);
			fileDeleted = file.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return fileDeleted;
	}

	public static boolean saveFile(InputStream inputStream, String path) {
		boolean fileUpdate = false;

		try {

			byte b[] = new byte[inputStream.available()];

			inputStream.read(b);

			FileOutputStream outputStream = new FileOutputStream(path);
			outputStream.write(b);
			outputStream.flush();
			outputStream.close();

			fileUpdate = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return fileUpdate;
	}

}
