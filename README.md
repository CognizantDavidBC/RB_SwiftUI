# SwiftUI Assignment

![Screenshot simulator](https://user-images.githubusercontent.com/88148565/167357658-62fe0763-1f2d-44da-a89e-cd8e8ffff2e8.png)

## Architecture: **MVVM**
- Model: `User`
- View: `IssueCell` inside a `LazyVStack`
- ViewModel: Shared using **Combine** (`EnvironmentObject`) 

## CSV Decode Method:

- `DataFrame()` from the Apple Framework **TabularData**

## Tabular Data
This new framework is optimezed for speed and performance of table data. The app takes advantage of this by using information available as `mean` or `standard deviation`. The cell background color and the cell image depends on the `issue count` of that user related to the other users.

## Notes
App performace tested using a list of 10K users. To test this scenario, switch comments between lines `6` & `7` at `ViewModel/ViewModel.swift`
