import 'package:project_dart/project_dart.dart' as project_dart;

import 'dart:io'; 
import 'dart:core';
int number=1;
int count=1;
List<TravelAgency>Trips=new List();
DateTime dates=new DateTime(1212,5,4);
DateTime date=new DateTime(1212,5,4);
void main() {
  TravelAgency t=new TravelAgency("lloo",2,date,44.2);
  Passenger p=new Passenger("g","h","j",1);
    while(true){
   print("*****************************************************");
   print("* Welcome in Travel Agency please enter your choice *");
   print("*****************************************************");
   print("1-Add Trip");
   print("2-Edit Trip");
   print("3-Delete Trip");
   print("4-View Trip");
   print("5-Search Trip");
   print("6-Reserve Trip");
   print("7-Print Passengers");
   print("8-print last Trips");
   print("9-Exit");
   int choice  = int.parse(stdin.readLineSync());
  switch(choice){
    case 1:
    print("enter trip location");
    String name = stdin.readLineSync();
    print("enter trip passlimit ");
    int limit  = int.parse(stdin.readLineSync());
    print ("enter trip number day");
    int day  = int.parse(stdin.readLineSync());
    print ("enter trip number month");
    int month  = int.parse(stdin.readLineSync());
    print ("enter trip number year");
    int year  = int.parse(stdin.readLineSync());
    print("enter trip price");
    double price = double.parse(stdin.readLineSync());
     date=new DateTime(year,month,day);
    TravelAgency o=new TravelAgency(name,limit,date,price);
    t.Addtravel(o);
    break;
    
    case 2:
       t.editTrip();
     break;

     case 3:
     int id=0;
     print("Enter id of trip that want delete it");
     id =int.parse(stdin.readLineSync());
     t.DeleteTrip(id);
     break;

     case 4:
     t.viewTrips();
     break;

     case 5:
     double price=0;
     print("Enter price of Trip");
     price = double.parse(stdin.readLineSync());
     t.searchTrip(price);
     break;

     case 6:
     int id=0;
     print("***********************************************************");
     print("* Welcome customer this is All trip please  reserve by id *");
     print("***********************************************************");
     t.viewTrips();
     print("Enter Trip id");
     id =int.parse(stdin.readLineSync());
     print("Enter your name :");
     String name=stdin.readLineSync();
     print("Enter your email :");
     String email=stdin.readLineSync();
     print("Enter your phone :");
     String phone=stdin.readLineSync();
     Passenger l= new Passenger(name,email,phone,id);
     p.AddPassenger(l);
     p.reserve(id);
        break;

    case 7:
    p.printPassengers();
    break;

    case 8:
    t.lastTrips();
    break;

     case 9:
     print("Good bye");
     return;
     break;

      default:
         print("your choose is invaild please try Again");
  }
   }
    
}
class TravelAgency
{
  int tripNumber;
  String location;
  int passengerLimit;
  DateTime date;
  double price;

  TravelAgency(String location,int passengerLimit,DateTime date,double price)
  {
    this.tripNumber=number;
    this.location=location;
    this.passengerLimit=passengerLimit;
    this.date=date;
    this.price=price;
  }

  void setLocation(String location)
  {
    this.location=location;
  }

  void setPassengerLimit(int passengerLimit)
  {
    this.passengerLimit=passengerLimit;
  }

  void setDate(DateTime date)
  {
    this.date=date;
  }

  void setPrice(double price)
  {
    this.price=price;
  }

  int get getTripNumber
  {
    return tripNumber;
  }
  String get getLocation
  {
    return location;
  }

  int get getPassengerLimit
  {
    return passengerLimit;
  }

  DateTime get getDate
  {
    return date;
  }

  double get getPrice
  {
    return price;
  }

  void Addtravel(TravelAgency trip)
  {
    Trips.add(new TravelAgency(trip.getLocation,trip.getPassengerLimit,trip.getDate,trip.getPrice));
    number++;
  }
  void DeleteTrip(int id)
  {
    for(int i=0;i<Trips.length;i++)
    {
      if(Trips[i].getTripNumber==id)
      {
        Trips.remove(Trips[i]);
      }
    }
  }
  void viewTrips()
  {
    if(Trips.length==0)
    {
      print("There is no Trips");
      return ;
    }
     print("****************************");
     print("* Welcome this is All trip *");
     print("*****************************");
    Trips.sort((a, b) => a.date.compareTo(b.date));
    for(int i=0;i<Trips.length;i++)
    {
      dynamic value=Trips[i].getTripNumber;
      int counter=i+1;
      print("******************************");
      print("  The Trip number $counter  ");
      print("******************************");
      print("The $counter trip number is : $value");      
      value=Trips[i].getLocation;
      print("The $counter Location is : $value");
      value=Trips[i].getPassengerLimit;
      print("The $counter passenger limit is : $value");
      value=Trips[i].getDate;
      print("The $counter date is : $value");
      value=Trips[i].getPrice;
      print("The $counter price is : $value");
    }
  }
  void editTrip()
  {
    
    print("The menu of EDIT Trip ");
    print("************************");
    String newValue2="";
    do {
    print("What do you want to change ?");
    print("[1] Location");
    print("[2] Passenger limit");
    print("[3] Date");
    print("[4] price");
    int change = int.parse(stdin.readLineSync());
    print("Enter the trip number of the trip you want to change it's info");
    int tripNum = int.parse(stdin.readLineSync());
    for(int i=0;i<Trips.length;i++)
    {
      if(tripNum==Trips[i].getTripNumber)
      {
        if(change==1)
        {
          print("What is your new value ?");
          dynamic newValue=stdin.readLineSync();
    
          Trips[i].setLocation(newValue);
        }
        else if(change==2)
        {
          print("What is your new value ?");
          dynamic newValue=stdin.readLineSync();
    
          int v=int.parse(newValue);
          Trips[i].setPassengerLimit(v);
        }
        else if(change==3)
        {
          print ("enter the new value of day in numbers");
          int day  = int.parse(stdin.readLineSync());
          print ("enter the new value of month in numbers");
          int month  = int.parse(stdin.readLineSync());
          print ("enter the new value of year in numbers");
          int year  = int.parse(stdin.readLineSync());
          date=new DateTime(year,month,day);
          Trips[i].setDate(date); 
        }
        else if(change==4)
        {
          print("What is your new value ?");
          dynamic newValue=stdin.readLineSync();
    
          double v=double.parse(newValue);
          assert(v is double);
          Trips[i].setPrice(v);
        }
      }
    }
    print("You edited successfully");
    print("Do you wanna to change anything else ?");
     newValue2=stdin.readLineSync();
   } while (newValue2 == 'yes');
  }
  void searchTrip(double price)
  {
    int counter=1;
    for(int i=0;i<Trips.length;i++)
    {
      if(Trips[i].getPrice==price)
      {
        dynamic value=Trips[i].getTripNumber;
        print("The $counter trip number is : $value");      
        value=Trips[i].getLocation;
        print("The $counter Location is : $value");
        value=Trips[i].getPassengerLimit;
        print("The $counter passenger limit is : $value");
        value=Trips[i].getDate;
        print("The $counter date is : $value");
        value=Trips[i].getPrice;
        print("The $counter price is : $value");
        counter++;
      }
    }
  }

  void lastTrips()
  {
    int counter=1;
    if(Trips.length==0)
    {
      print("There is no trips ");
      return;
    }
    if(Trips.length<10)
    {
      viewTrips();
      return ;
    }
    for(int i=Trips.length-10;i<Trips.length;i++)
    {
      dynamic value=Trips[i].getTripNumber;
        print("The $counter trip number is : $value");      
        value=Trips[i].getLocation;
        print("The $counter Location is : $value");
        value=Trips[i].getPassengerLimit;
        print("The $counter passenger limit is : $value");
        value=Trips[i].getDate;
        print("The $counter date is : $value");
        value=Trips[i].getPrice;
        print("The $counter price is : $value");
        counter++;
    }
  }
}
class Passenger
{
  int numPassenger;
  int id;
  String name;
  String email;
  String phone;
  int idTrip;
   
  List<Passenger>passengers=new List();
  TravelAgency travel=new TravelAgency("norhan",3,dates,44.2);

  String get getName
  {
    return name;
  }
  String get getEmail
  {
    return email;
  }
  String get getPhone
  {
    return phone;
  }
  int get getIdTrip
  {
    return idTrip;
  }

  Passenger(String name ,String email ,String phone,int idTrip)
  {
    this.numPassenger=0;
    this.id=count;
    this.name=name;
    this.email=email;
    this.phone=phone;
    this.idTrip=idTrip;
  }
  
  void AddPassenger(Passenger pass)
  {
    passengers.add(new Passenger(pass.getName,pass.getEmail,pass.getPhone,pass.getIdTrip));
    count++;
  }
  
  void printPassengers()
  {
    if(passengers.length==0)
    {
      print("There is no passengers yet");
      return ;
    }
    for(int i=0;i<passengers.length;i++)
    {
      int counter=1;
      dynamic value=passengers[i].getName;
      print("the $counter name : $value");
       value=passengers[i].getEmail;
      print("the $counter email : $value");
      
       value=passengers[i].getPhone;
      print("the $counter phone : $value");
      
      getTrip(passengers[i].getIdTrip);
    }
  }
  void getTrip(int idtrip)
  {
    for(int i=0;i<Trips.length;i++)
    {
      if(idtrip==Trips[i].getTripNumber)
      { 
       dynamic value=Trips[i].getTripNumber;
        print("The trip number is : $value");      
        value=Trips[i].getLocation;
        print("The  Location is : $value");
        value=Trips[i].getPassengerLimit;
        print("The passenger limit is : $value");
        value=Trips[i].getDate;
        print("The date is : $value");
        value=Trips[i].getPrice;
        print("The price is : $value");
        if(value>10000)
        {
          stdout.write("The price after discount is : ");
          print(getDiscount(value));
        }
      }
    }
  }

  double getDiscount(double value)
  {
    if(value>10000)
    {
      double result=20/100*value;
      result=value-result;
      return result;
    }
    return 0.0;
  }
  bool checkSpace(int id)
  {
    for(int i=0;i<Trips.length;i++)
    {
      if(id==Trips[i].getTripNumber)
      {
        if(Trips[i].getPassengerLimit>0)
        {
          return true;
        }
      }
    }
    return false;
  }

  void reserve(int id)
  {
    if(checkSpace(id))
    {
      for(int i=0;i<Trips.length;i++)
      {
        if(id==Trips[i].getTripNumber)
        {
          print("please enter the number of members you want : ");
          int numb=int.parse(stdin.readLineSync());
          if(numb<=Trips[i].getPassengerLimit)
          {
          Trips[i].setPassengerLimit(Trips[i].getPassengerLimit-numb);
          print("your booking is successful");
          return;
          }
        }
      } 
    }
    print("there is no space");
    return ;
  }
}
