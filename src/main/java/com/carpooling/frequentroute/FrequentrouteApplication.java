package com.carpooling.frequentroute;

import com.github.chen0040.fpm.AssocRuleMiner;
import com.github.chen0040.fpm.data.ItemSets;
import com.github.chen0040.fpm.data.MetaData;
import com.github.chen0040.fpm.fpg.FPGrowth;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.File;
import java.io.FileNotFoundException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.*;

@SpringBootApplication
@RequiredArgsConstructor
public class FrequentrouteApplication {

    public static void main(String[] args) {
        SpringApplication.run(FrequentrouteApplication.class, args);

        long startingTime = System.currentTimeMillis();
        List<List<String>> database = new ArrayList<>();

        readFile(database,"sampledata.txt");

        AssocRuleMiner method = new FPGrowth();
        method.setMinSupportLevel(4);
        MetaData metaData = new MetaData(database);

//        ItemSets frequent_item_sets = method.minePatterns(database, metaData.getUniqueItems());
//        frequent_item_sets.stream().forEach(itemSet -> System.out.println("item-set: " + itemSet));

// obtain the max frequent item sets
//        ItemSets max_frequent_item_sets = method.findMaxPatterns(database, metaData.getUniqueItems());
//        max_frequent_item_sets.stream().forEach(itemSet -> System.out.println("item-set: " + itemSet));
//        long endingTime = System.currentTimeMillis();
//        System.out.println("Running time: " + (endingTime - startingTime)/1000.0);
        LocalDate date = LocalDate.of(2021, 3, 4);
        DayOfWeek day = date.getDayOfWeek();
        System.out.println(day.getValue());
    }

    public static void readFile(List<List<String>> transections, String fileName){
        try {
            Scanner scan = new Scanner(new File(fileName));
            while (scan.hasNextLine()) {
                String t = scan.nextLine();
                ArrayList<String> transection = new ArrayList<String>();
                StringTokenizer st = new StringTokenizer(t, ", ");
                while(st.hasMoreTokens()){
                    String token = st.nextToken();
                    transection.add(token);
                }
                transections.add(transection);
            }
        } catch (FileNotFoundException e) {
            System.err.println("couldn't read file: " + fileName);
        }
    }

}
