import 'package:e_shopping_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({Key? key, this.onTap, required this.model}) : super(key: key);
  final void Function()? onTap;
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color:const Color(0xFFFFFFFF),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF696969),
            offset: Offset(0, 4),
            blurRadius: 2,
          ),
        ],

      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 153,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(model.image!),
                      fit: BoxFit.fill
                  )

              ),

            ),
          ),
          Padding(

            padding: const EdgeInsets.only(left: 10,top: 12,right: 45),
            child: Text(
             model.name!,
              textAlign: TextAlign.start,
              style: TextStyle (

                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.2125,
                color: Color(0xFF333333),

              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(

            children: [

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,top: 8),
                  child: Text(
                    "${model.price}\$",
                    textAlign: TextAlign.start,
                    style: const TextStyle (
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 1.2125,
                      color: Color(0xFFFF4500),

                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,top: 5),
                  child: Text(
                    "${model.oldPrice}\$",
                    textAlign: TextAlign.start,
                    style: const TextStyle (
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 1.2125,
                      color: Color(0xFF0074D9),

                    ),
                    overflow: TextOverflow.ellipsis,

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(

                  child: Icon(Icons.favorite,color: Color(0xFFFF4500),size: 20),
                  onTap: (){
                    onTap;
                  },

                ),
              )
            ],
          )
        ],
      ),

    );
  }
}
