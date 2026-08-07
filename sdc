Experiment 1: Demonstrate JSX and Virtual DOM

npm create vite@latest MY_APP -- --template react
cd MY_APP
npm install
npm run dev

//App.jsx
import React, { useState } from "react";

function App() {

  const [count, setCount] = useState(0);

  return (
    <div>
      <h1>JSX and Virtual DOM Demo</h1>

      <p>Count: {count}</p>

      <button onClick={() => setCount(count + 1)}>
        Increment
      </button>

    </div>
  );
}

export default App;



Experiment 2: Product Listing Page
MY_APP
 ↓
src
 ↓
Right Click
 ↓
New File
 ↓
ProductCard.jsx

//ProductCard.jsx 

import React from "react";

function ProductCard({ name, price, category }) {

  return (
    <div style={{border:"1px solid black", margin:"10px", padding:"10px"}}>

      <h3>{name}</h3>

      <p>Price: ₹{price}</p>

      <p>Category: {category}</p>

      <button onClick={() => alert(`${name} Purchased`)}>
        Buy Now
      </button>

    </div>
  );
}

export default ProductCard;

//App.jsx

import React from "react";
import ProductCard from "./ProductCard";

function App() {

  const products = [
    {
      id: 1,
      name: "Laptop",
      price: 50000,
      category: "Electronics"
    },

    {
      id: 2,
      name: "Mobile",
      price: 20000,
      category: "Electronics"
    },

    {
      id: 3,
      name: "Shoes",
      price: 1500,
      category: "Fashion"
    }
  ];


  return (
    <div>

      <h1>Product Listing</h1>

      {
        products.map((product) => (

          <ProductCard
            key={product.id}
            name={product.name}
            price={product.price}
            category={product.category}
          />

        ))
      }

    </div>
  );
}

export default App;




Experiment 3: Inventory Management Using Hooks

//App.jsx

import React, { useState, useMemo } from "react";

export default function App() {

  const [products] = useState([
    { name: "Pen", qty: 10, price: 20 },
    { name: "Book", qty: 5, price: 100 }
  ]);

  const [search, setSearch] = useState("");

  const [dark, setDark] = useState(false);


  const totalValue = useMemo(() => {

    return products.reduce(
      (sum, item) => sum + item.qty * item.price,
      0
    );

  }, [products]);


  const filtered = products.filter((p) =>
    p.name.toLowerCase().includes(search.toLowerCase())
  );


  return (

    <div
      style={{
        backgroundColor: dark ? "#222" : "#fff",
        color: dark ? "#fff" : "#000",
        minHeight: "100vh",
        padding: "20px"
      }}
    >

      <h2>Inventory Management</h2>


      <button onClick={() => setDark(!dark)}>
        Toggle Theme
      </button>


      <br /><br />


      <input
        type="text"
        placeholder="Search Product"
        value={search}
        onChange={(e) => setSearch(e.target.value)}
      />


      <ul>

        {
          filtered.map((p, index) => (

            <li key={index}>
              {p.name} - Qty: {p.qty} - ₹{p.price}
            </li>

          ))
        }

      </ul>


      <h3>
        Total Value: ₹{totalValue}
      </h3>


    </div>

  );
}





1.Write a C program that contains a string (char pointer) with a value 'Hello world'. The program should
XOR each character in this string with 0 and displays the result.
#include <stdio.h>
int main ()
 {
char *str = "Hello world";
// Iterate through each character in the string
 for (int i = 0; str[i] != '\0'; i++) 
{
 // XOR the character with 0 (which doesn't change the character) 
char result = str[i] ^ 0; 
// Print the character 
printf("%c", result); 
} 
printf("\n"); 
// Print a newline at the end 
return 0;
 }





2.Write a C progam that contains a shing (char pointer) with a value 'Hello world'. The program should AND or and XOR each character in this string with 127 and display the result.
#include <stdio.h>
int main() {
    // Initialize the string
    char *str = "Hello world";
    
    // Iterate through each character in the string
    for (int i = 0; str[i] != '\0'; i++) {
        char ch = str[i];
        
        // Perform AND operation with 127 and print the result
        printf("Character '%c' AND 127 = %c (ASCII: %d)\n", ch, ch & 127, ch & 127);
        
        // Perform XOR operation with 127 and print the result
        printf("Character '%c' XOR 127 = %c (ASCII: %d)\n", ch, ch ^ 127, ch ^ 127);
    }

    return 0;
}





3.Write a Java progmm to perform encryption and decryption using the following algorithms a. Ceaser cipher b. Substitution cipher c. Hill Cipher
1. Caesar Cipher:
Caesar Cipher is a substitution cipher that shifts characters by a fixed number.
import java.util.Scanner;

public class CaesarCipher {

    // Method to encrypt the text
    public static String encrypt(String text, int shift) {
        StringBuilder result = new StringBuilder();

        for (int i = 0; i < text.length(); i++) {
            char ch = text.charAt(i);

            if (Character.isUpperCase(ch)) {
                char c = (char) ((ch - 'A' + shift) % 26 + 'A');
                result.append(c);
            } else if (Character.isLowerCase(ch)) {
                char c = (char) ((ch - 'a' + shift) % 26 + 'a');
                result.append(c);
            } else {
                result.append(ch); // Keep other characters unchanged
            }
        }

        return result.toString();
    }

    // Method to decrypt the text
    public static String decrypt(String text, int shift) {
        return encrypt(text, 26 - (shift % 26));
    }

    // Main method
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the text for Caesar Cipher: ");
        String text = sc.nextLine();

        System.out.println("Enter the shift value (0-25): ");
        int shift = sc.nextInt();

        // Ensure the shift value is within 0-25
        shift = shift % 26;

        String encrypted = encrypt(text, shift);
        System.out.println("Encrypted Text: " + encrypted);

        String decrypted = decrypt(encrypted, shift);
        System.out.println("Decrypted Text: " + decrypted);

        sc.close();  // Closing the Scanner
    }
}

SAMPLE INPUT:
Enter the text for Caesar Cipher: 
HelloWorld
Enter the shift value: 
3
SAMPLE OUTPUT:
Enter the text for Caesar Cipher: 
HelloWorld
Enter the shift value: 
3
Encrypted Text: KhoorZruog
Decrypted Text: HelloWorld
