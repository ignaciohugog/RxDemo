package com.ncalderini.rxdemo;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.widget.Button;
import android.widget.EditText;

import com.jakewharton.rxbinding2.widget.RxTextView;

import io.reactivex.Observable;
import io.reactivex.functions.Function3;
import io.reactivex.observers.DisposableObserver;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        final EditText firstNameTextField = findViewById(R.id.editText);
        final EditText lastNameTextField = findViewById(R.id.editText2);
        final EditText emailTextField = findViewById(R.id.editText3);
        final Button submitButton = findViewById(R.id.button);

        final Observable<CharSequence> observableName = RxTextView.textChanges(firstNameTextField);
        final Observable<CharSequence> observableLastName = RxTextView.textChanges(lastNameTextField);
        final Observable<CharSequence> observableEmail = RxTextView.textChanges(emailTextField);

        Observable.combineLatest(observableName, observableLastName, observableEmail, new Function3<CharSequence, CharSequence, CharSequence, Boolean>() {
            @Override
            public Boolean apply(CharSequence firstName, CharSequence lastName, CharSequence email) {
                return !firstName.toString().isEmpty() && !lastName.toString().isEmpty() && !email.toString().isEmpty();
            }
        }).subscribe(new DisposableObserver<Boolean>() {
            @Override
            public void onNext(Boolean enabled) {
                submitButton.setEnabled(enabled);
            }

            @Override
            public void onError(Throwable e) {

            }

            @Override
            public void onComplete() {

            }
        });

    }
}
