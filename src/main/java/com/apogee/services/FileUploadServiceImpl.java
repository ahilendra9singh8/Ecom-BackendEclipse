package com.apogee.services;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadServiceImpl implements FileUploadService {

	@Override
	public String uploadImage(String path, MultipartFile file) {
		String originalFileName = file.getOriginalFilename();
		try {
//        String randomImageName = UUID.randomUUID().toString();

//        String randomImageNameWithExtension = randomImageName.concat(originalFileName.substring(originalFileName.lastIndexOf(".")));
			String fullpath = path + File.separator + originalFileName;

			File folderFile = new File(path);

			if (!folderFile.exists()) {
				folderFile.mkdirs();
			}
			Files.copy(file.getInputStream(), Paths.get(fullpath));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return originalFileName;
	}
}
