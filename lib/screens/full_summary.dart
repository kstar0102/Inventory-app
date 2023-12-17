import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_keeper/controllers/bill_controller.dart';
import 'package:shop_keeper/controllers/daily_sales_controller.dart';

class FullSummaryPage extends StatefulWidget {
  const FullSummaryPage({super.key});

  @override
  State<FullSummaryPage> createState() => _FullSummaryPageState();
}

class _FullSummaryPageState extends State<FullSummaryPage> {
  BillController controller=Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.generateSummaries();
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:Color.fromARGB(255, 20, 20, 20) ,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: width,
          height: height,
          child: 
              Obx((){
                if(controller.allSummaryLoading.value){
                  return CircularProgressIndicator();
                }else if(controller.summaries.isEmpty){
                  return Text('No Sales to Show!');
                }else{
                  return ListView.builder(
                    itemCount: controller.summaries.length,
                    itemBuilder: (BuildContext contex,index){
                    return Card(
                      elevation: 3,
                  
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                          children: [
                            Text('Date: ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            Text(controller.summaries[index].date,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Total Sales: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            Text(controller.summaries[index].total.toStringAsFixed(2),style: TextStyle(color: Colors.blueAccent),),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Total Income: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            Text(controller.summaries[index].income.toStringAsFixed(2),style: TextStyle(color: Colors.green),),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Total Debt: ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            Text(controller.summaries[index].depth.toStringAsFixed(2),style: TextStyle(color: Colors.orangeAccent),),
                          ],
                        ),
                          ],
                        ),
                        
                        ClipRRect(
                          
                          borderRadius: BorderRadius.circular(10),
                          child: Image(image: AssetImage('assets/cardback.png'),width: 70,height: 70,),
                        )
                        
                      ],
                    ),
                  ),
                );
                  });
                }
              })
            
          
        ),
      ),
    );
  }
}