# app.py

import streamlit as st

def main():
    st.title("Gitleaks Test App")
    # Hardcoded secret for testing Gitleaks scanning
#    SECRET_API_KEY = "REMOVED"
    st.write("This is a sample Streamlit app.")
    st.write("Your secret API key is:", SECRET_API_KEY)

if __name__ == "__main__":
    main()

