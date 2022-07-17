<h1 align="center">Ethereum-based-DApp-GPS-smart-contract</h1>
<div>
<a href="https://github.com/STT-Data-Engineering/Speech_to_text"><img src="https://img.shields.io/github/forks/STT-Data-Engineering/Speech_to_text" alt="Forks Badge"/></a>
<a "https://github.com/STT-Data-Engineering/Speech_to_text/pulls"><img src="https://img.shields.io/github/issues-pr/STT-Data-Engineering/Speech_to_text" alt="Pull Requests Badge"/></a>
<a href="https://github.com/STT-Data-Engineering/Speech_to_text/issues"><img src="https://img.shields.io/github/issues/STT-Data-Engineering/Speech_to_text" alt="Issues Badge"/></a>
<a href="https://github.com/STT-Data-Engineering/Speech_to_text/graphs/contributors"><img alt="GitHub contributors" src="https://img.shields.io/github/contributors/STT-Data-Engineering/Speech_to_text?color=2b9348"></a>
<a href="https://github.com/STT-Data-Engineering/Speech_to_text/blob/main/LICENSE"><img src="https://img.shields.io/github/license/STT-Data-Engineering/Speech_to_text?color=2b9348" alt="License Badge"/></a>
</div>
</br>

**Table of content**

- [Introduction](#Introduction)
- [Pipeline](#Pipeline)
- [Architecture](#Architecture)
- [Project  Structure](#ProjectStructure)
- [Installation](#Installation)


## Introduction
The refund by location smart contract is aimed to be used when one party, for example an employer, agrees to pay another party, for example an employee, for being present in a certain geographic area for a certain duration. The employee’s phone sends its GPS location to a smart contract at a certain interval. Based on the pre-agreed contract codified in an Ethereum smart contract, a cryptocurrency payment is executed when all the agreed conditions are met.  If, at any point, the GPS sensor indicates that an employee is outside the range of the agreed GPS area, the contract state will be updated to indicate that it is out of compliance.  
In this project, an Ethereum based dApp is developed  that has both the smart contract tested and deployed in a testnet and a front end that will allow monitoring of the status.

## Pipeline
This is our pipeline of this project that will be used to record millions of Amharic and Swahili speakers reading digital texts in-app and web platforms.  
![Speech-to-text data collection](data/end-to-end-details-design.jpg)

## Project Structure
There are several files in the repository, including Python scripts, Jupyter notebooks,  and text files. 

## Installation
```
git clone https://github.com/STT-Data-Engineering/Speech_to_text
```

## Contributors
* [Tadesse Kebede](https://github.com/tadesse381)
