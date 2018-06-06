package com.ncalderini.rxdemo

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import com.jakewharton.rxbinding2.widget.RxTextView
import io.reactivex.rxkotlin.Observables

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val firstNameTextField = findViewById<EditText>(R.id.editText)
        val lastNameTextField = findViewById<EditText>(R.id.editText2)
        val emailTextField = findViewById<EditText>(R.id.editText3)
        val submitButton = findViewById<Button>(R.id.button)

        val observableName = RxTextView.textChanges(firstNameTextField)
        val observableLastName = RxTextView.textChanges(lastNameTextField)
        val observableEmail = RxTextView.textChanges(emailTextField)

        Observables.combineLatest(observableName, observableLastName, observableEmail)
        { firstName, lastName, email -> !firstName.isEmpty() && !lastName.isEmpty() && !email.isEmpty()}
                .subscribe({enabled -> submitButton.isEnabled = enabled })
    }
}
