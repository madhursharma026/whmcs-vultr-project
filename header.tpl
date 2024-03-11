<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Deploy Servers - Vultr.com</title>
  <link rel="icon" type="image/x-icon" href="https://avatars.githubusercontent.com/u/8527264?s=200&v=4">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="vultr.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<style>
.sidebarFirstCSS {
    float: left;
    width: 93px;
    height: 100vh;
    background: #020617;
}

.sidebarSecondCSS {
    float: left;
    width: 239px;
    height: 100vh;
    background-color: #F9FAFB;
    border-right: 1px solid #C3C4C6;
}

.contentCSS {
    height: 100vh;
    vertical-align: top;
    display: inline-block;
    width: calc(100% - 332px);
}

.hoverStyleFirstSidebar {
    border-right: 8px solid #020617;
}

.hoverStyleFirstSidebar:hover {
    border-right: 8px solid #60A5FA;
}

.activeTab {
    border-right: 8px solid #60A5FA;
    background: #1E293B;
}

.hoverStyleSecondSidebar:hover {
    background-color: #ECF4FD;
}

.contentTopAfterMDScrn {
    display: none;
}
.dataAfterLGScrn{
    display: none;
}

@media (max-width: 991px) {
    .dataBeforeLGScrn {
        display: none;
    }
    .dataAfterLGScrn{
        display: block;
    }
}

@media (max-width: 1279px) {
    .sidebarSecondCSS {
        display: none;
    }

    .contentCSS {
        width: calc(100% - 93px);
    }
}

@media (max-width: 767px) {
    .sidebarFirstCSS {
        display: none;
    }

    .contentTopBeforeMDScrn {
        display: none;
    }

    .contentTopAfterMDScrn {
        display: block;
    }

    .contentCSS {
        width: calc(100%);
    }
}
</style>

<body style="overflow: hidden;">
    <div class="sidebarFirstCSS">
        <ul class="pt-4 p-0 m-0 text-center" style="list-style-type: none;">
            <li>
                <img src="https://avatars.githubusercontent.com/u/8527264?s=200&v=4" alt="#ImgNotFound" width="35"
                    height="35">
            </li>
            <li class="py-3 mt-3 activeTab hoverStyleFirstSidebar">
                <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiIGQ9Ik0yIDE4LjUxNjRDMiAxNy42ODggMi42NzE1NyAxNy4wMTY0IDMuNSAxNy4wMTY0SDIwLjQ5OTJDMjEuMzI3NiAxNy4wMTY0IDIxLjk5OTIgMTcuNjg4IDIxLjk5OTIgMTguNTE2NFYyMS41MDM2QzIxLjk5OTIgMjIuMzMyMSAyMS4zMjc2IDIzLjAwMzYgMjAuNDk5MiAyMy4wMDM2SDMuNUMyLjY3MTU3IDIzLjAwMzYgMiAyMi4zMzIxIDIgMjEuNTAzNlYxOC41MTY0Wk0zLjUgMTguMDE2NEMzLjIyMzg2IDE4LjAxNjQgMyAxOC4yNDAzIDMgMTguNTE2NFYyMS41MDM2QzMgMjEuNzc5OCAzLjIyMzg2IDIyLjAwMzYgMy41IDIyLjAwMzZIMjAuNDk5MkMyMC43NzUzIDIyLjAwMzYgMjAuOTk5MiAyMS43Nzk4IDIwLjk5OTIgMjEuNTAzNlYxOC41MTY0QzIwLjk5OTIgMTguMjQwMyAyMC43NzUzIDE4LjAxNjQgMjAuNDk5MiAxOC4wMTY0SDMuNVoiIGZpbGw9IndoaXRlIi8+CjxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBkPSJNMiAxMC41MDVDMiA5LjY3NjU1IDIuNjcxNTcgOS4wMDQ5NyAzLjUgOS4wMDQ5N0gyMC41QzIxLjMyODQgOS4wMDQ5NyAyMiA5LjY3NjU1IDIyIDEwLjUwNVYxMy41MDYyQzIyIDE0LjMzNDYgMjEuMzI4NCAxNS4wMDYyIDIwLjUgMTUuMDA2MkgzLjVDMi42NzE1NyAxNS4wMDYyIDIgMTQuMzM0NiAyIDEzLjUwNjJWMTAuNTA1Wk0zLjUgMTAuMDA1QzMuMjIzODYgMTAuMDA1IDMgMTAuMjI4OCAzIDEwLjUwNVYxMy41MDYyQzMgMTMuNzgyMyAzLjIyMzg2IDE0LjAwNjIgMy41IDE0LjAwNjJIMjAuNUMyMC43NzYxIDE0LjAwNjIgMjEgMTMuNzgyMyAyMSAxMy41MDYyVjEwLjUwNUMyMSAxMC4yMjg4IDIwLjc3NjEgMTAuMDA1IDIwLjUgMTAuMDA1SDMuNVoiIGZpbGw9IndoaXRlIi8+CjxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBkPSJNMiAyLjUwOTE2QzIgMS42ODA3MyAyLjY3MTU3IDEuMDA5MTYgMy41IDEuMDA5MTZIMjAuNDk5MkMyMS4zMjc2IDEuMDA5MTYgMjEuOTk5MiAxLjY4MDczIDIxLjk5OTIgMi41MDkxNlY1LjUwMzExQzIxLjk5OTIgNi4zMzE1NCAyMS4zMjc2IDcuMDAzMTEgMjAuNDk5MiA3LjAwMzExSDMuNUMyLjY3MTU3IDcuMDAzMTEgMiA2LjMzMTU0IDIgNS41MDMxMVYyLjUwOTE2Wk0zLjUgMi4wMDkxNkMzLjIyMzg2IDIuMDA5MTYgMyAyLjIzMzAxIDMgMi41MDkxNlY1LjUwMzExQzMgNS43NzkyNiAzLjIyMzg2IDYuMDAzMTEgMy41IDYuMDAzMTFIMjAuNDk5MkMyMC43NzUzIDYuMDAzMTEgMjAuOTk5MiA1Ljc3OTI2IDIwLjk5OTIgNS41MDMxMVYyLjUwOTE2QzIwLjk5OTIgMi4yMzMwMSAyMC43NzUzIDIuMDA5MTYgMjAuNDk5MiAyLjAwOTE2SDMuNVoiIGZpbGw9IndoaXRlIi8+CjxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBkPSJNNC4wNjI1IDQuMDMxMjhDNC4wNjI1IDMuNDc5IDQuNTEwMjIgMy4wMzEyOCA1LjA2MjUgMy4wMzEyOEg3QzcuNTUyMjggMy4wMzEyOCA4IDMuNDc5IDggNC4wMzEyOEM4IDQuNTgzNTcgNy41NTIyOCA1LjAzMTI4IDcgNS4wMzEyOEg1LjA2MjVDNC41MTAyMiA1LjAzMTI4IDQuMDYyNSA0LjU4MzU3IDQuMDYyNSA0LjAzMTI4Wk00LjA2MjUgMTIuMDMxM0M0LjA2MjUgMTEuNDc5IDQuNTEwMjIgMTEuMDMxMyA1LjA2MjUgMTEuMDMxM0g3QzcuNTUyMjggMTEuMDMxMyA4IDExLjQ3OSA4IDEyLjAzMTNDOCAxMi41ODM2IDcuNTUyMjggMTMuMDMxMyA3IDEzLjAzMTNINS4wNjI1QzQuNTEwMjIgMTMuMDMxMyA0LjA2MjUgMTIuNTgzNiA0LjA2MjUgMTIuMDMxM1pNNC4wNjI1IDIwLjAzMTNDNC4wNjI1IDE5LjQ3OSA0LjUxMDIyIDE5LjAzMTMgNS4wNjI1IDE5LjAzMTNIN0M3LjU1MjI4IDE5LjAzMTMgOCAxOS40NzkgOCAyMC4wMzEzQzggMjAuNTgzNiA3LjU1MjI4IDIxLjAzMTMgNyAyMS4wMzEzSDUuMDYyNUM0LjUxMDIyIDIxLjAzMTMgNC4wNjI1IDIwLjU4MzYgNC4wNjI1IDIwLjAzMTNaIiBmaWxsPSJ3aGl0ZSIvPgo8L3N2Zz4K"
                    alt="#ImgNotFound">
                <div class="text-white" style="font-size: 13px;">Products</div>
            </li>
            <li class="py-3 hoverStyleFirstSidebar">
                <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPGcgY2xpcC1wYXRoPSJ1cmwoI2NsaXAwXzQ2MzZfMTAzNjc4KSI+CjxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBkPSJNMTAgMUM3LjIzODU4IDEgNSAzLjIzODU4IDUgNkM1IDguNzYxNDIgNy4yMzg1OCAxMSAxMCAxMUMxMi43NjE0IDExIDE1IDguNzYxNDIgMTUgNkMxNSAzLjIzODU4IDEyLjc2MTQgMSAxMCAxWk02IDZDNiAzLjc5MDg2IDcuNzkwODYgMiAxMCAyQzEyLjIwOTEgMiAxNCAzLjc5MDg2IDE0IDZDMTQgOC4yMDkxNCAxMi4yMDkxIDEwIDEwIDEwQzcuNzkwODYgMTAgNiA4LjIwOTE0IDYgNloiIGZpbGw9IndoaXRlIi8+CjxwYXRoIGQ9Ik0xMC4wMDAyIDEzLjAwMThDOC4yMjQ0OCAxMy4wMDE4IDUuNzgxMDggMTMuNDEzMiAzLjc2NjA1IDE0LjI2OTZDMS43OTc2NSAxNS4xMDYyIC0wLjAwMzkwNjI1IDE2LjQ3OTggLTAuMDAzOTA2MjUgMTguNTIxMUwtMC4wMDM4ODU1MSAxOC41MjU3TDAuMDE0MTU1NiAyMC41MDU4QzAuMDIxNjU0NSAyMS4zMjg5IDAuNjkwOTk4IDIxLjk5MjEgMS41MTQwOSAyMS45OTIxSDEzLjUyMDhDMTMuMjQ3MiAyMS42ODU0IDEzLjAwNDcgMjEuMzUwNSAxMi43OTgyIDIwLjk5MjFIMS41MTQwOUMxLjIzOTczIDIwLjk5MjEgMS4wMTY2MSAyMC43NzExIDEuMDE0MTEgMjAuNDk2N0wwLjk5NjA5NCAxOC41MjExTDAuOTk2MDk1IDE4LjUxOUMwLjk5NzM5IDE3LjE0MzQgMi4yMzIyNCAxNi4wMDggNC4xNTcyIDE1LjE4OTlDNi4wMzY1NSAxNC4zOTEyIDguMzQ1MjMgMTQuMDAxOCAxMC4wMDAyIDE0LjAwMThDMTAuOTMwNSAxNC4wMDE4IDEyLjA2NzUgMTQuMTI0OCAxMy4yMTg5IDE0LjM3NDRDMTMuNDUxMiAxNC4wNjg1IDEzLjcxMjIgMTMuNzg1NiAxMy45OTc5IDEzLjUyOTdDMTIuNTgzNiAxMy4xNzQ3IDExLjE1MTUgMTMuMDAxOCAxMC4wMDAyIDEzLjAwMThaIiBmaWxsPSJ3aGl0ZSIvPgo8cGF0aCBmaWxsLXJ1bGU9ImV2ZW5vZGQiIGNsaXAtcnVsZT0iZXZlbm9kZCIgZD0iTTE4IDIzQzIwLjc2MTQgMjMgMjMgMjAuNzYxNCAyMyAxOEMyMyAxNS4yMzg2IDIwLjc2MTQgMTMgMTggMTNDMTUuMjM4NiAxMyAxMyAxNS4yMzg2IDEzIDE4QzEzIDIwLjc2MTQgMTUuMjM4NiAyMyAxOCAyM1pNMTggMjRDMjEuMzEzNyAyNCAyNCAyMS4zMTM3IDI0IDE4QzI0IDE0LjY4NjMgMjEuMzEzNyAxMiAxOCAxMkMxNC42ODYzIDEyIDEyIDE0LjY4NjMgMTIgMThDMTIgMjEuMzEzNyAxNC42ODYzIDI0IDE4IDI0WiIgZmlsbD0id2hpdGUiLz4KPHBhdGggZD0iTTIwIDE3QzIwIDE4LjEwNDYgMTkuMTA0NiAxOSAxOCAxOUMxNi44OTU0IDE5IDE2IDE4LjEwNDYgMTYgMTdDMTYgMTUuODk1NCAxNi44OTU0IDE1IDE4IDE1QzE5LjEwNDYgMTUgMjAgMTUuODk1NCAyMCAxN1oiIGZpbGw9IndoaXRlIi8+CjxwYXRoIGQ9Ik0xNyAxOEMxNyAxNy40NDc3IDE3LjQ0NzcgMTcgMTggMTdDMTguNTUyMyAxNyAxOSAxNy40NDc3IDE5IDE4VjIwQzE5IDIwLjU1MjMgMTguNTUyMyAyMSAxOCAyMUMxNy40NDc3IDIxIDE3IDIwLjU1MjMgMTcgMjBWMThaIiBmaWxsPSJ3aGl0ZSIvPgo8L2c+CjxkZWZzPgo8Y2xpcFBhdGggaWQ9ImNsaXAwXzQ2MzZfMTAzNjc4Ij4KPHJlY3Qgd2lkdGg9IjI0IiBoZWlnaHQ9IjI0IiBmaWxsPSJ3aGl0ZSIvPgo8L2NsaXBQYXRoPgo8L2RlZnM+Cjwvc3ZnPgo="
                    alt="#ImgNotFound">
                <div class="text-white" style="font-size: 13px;">Account</div>
            </li>
            <li class="py-3 hoverStyleFirstSidebar">
                <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPGcgY2xpcC1wYXRoPSJ1cmwoI2NsaXAwXzQ2MzZfMTAzNjgyKSI+CjxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBkPSJNMC4wMDg3ODkyMSAxLjUwMDg1QzAuMDA4Nzg5MjQgMC42NzI0MjggMC42ODAzNjIgMC4wMDA4NTQ0OTIgMS41MDg3OSAwLjAwMDg1NDQ5MkgxNy41MDM5QzE4LjMzMjMgMC4wMDA4NTQ0OTIgMTkuMDAzOSAwLjY3MjQyOCAxOS4wMDM5IDEuNTAwODVWMTEuNTA1OUMxOS4wMDM5IDEyLjMzNDMgMTguMzMyMyAxMy4wMDU5IDE3LjUwMzkgMTMuMDA1OUg3LjcyOTFDNy41Nzk2MyAxMy4wMDU5IDcuNDM4IDEzLjA3MjggNy4zNDMwMiAxMy4xODgyTDQuNjUzNjIgMTYuNDU2M0MzLjc1Nzg2IDE3LjU0NDcgMS45OTEzOSAxNi45MDg1IDEuOTk1MzkgMTUuNDk4OEwyLjAwMTA4IDEzLjQ5NDRDMi4wMDE4NSAxMy4yMTk5IDEuNzc5NSAxMi45OTY5IDEuNTA0OTMgMTIuOTk2OUMwLjY3ODYzNiAxMi45OTY5IDAuMDA4Nzg5MDYgMTIuMzI3IDAuMDA4Nzg5MDYgMTEuNTAwN0wwLjAwODc4OTIxIDEuNTAwODVaTTEuNTA4NzkgMS4wMDA4NUMxLjIzMjY1IDEuMDAwODUgMS4wMDg3OSAxLjIyNDcxIDEuMDA4NzkgMS41MDA4NUwxLjAwODc5IDExLjUwMDdDMS4wMDg3OSAxMS43NzQ4IDEuMjMwOTIgMTEuOTk2OSAxLjUwNDkzIDExLjk5NjlDMi4zMzI4OSAxMS45OTY5IDMuMDAzNDIgMTIuNjY5MyAzLjAwMTA3IDEzLjQ5NzNMMi45OTUzOSAxNS41MDE3QzIuOTk0MDUgMTUuOTcxNiAzLjU4Mjg4IDE2LjE4MzYgMy44ODE0NiAxNS44MjA4TDYuNTcwODcgMTIuNTUyN0M2Ljg1NTggMTIuMjA2NSA3LjI4MDY5IDEyLjAwNTkgNy43MjkxIDEyLjAwNTlIMTcuNTAzOUMxNy43ODAxIDEyLjAwNTkgMTguMDAzOSAxMS43ODIgMTguMDAzOSAxMS41MDU5VjEuNTAwODVDMTguMDAzOSAxLjIyNDcxIDE3Ljc4MDEgMS4wMDA4NSAxNy41MDM5IDEuMDAwODVIMS41MDg3OVoiIGZpbGw9IndoaXRlIi8+CjxwYXRoIGZpbGwtcnVsZT0iZXZlbm9kZCIgY2xpcC1ydWxlPSJldmVub2RkIiBkPSJNMjAgOC41MDAwM0MyMCA4LjIyMzg5IDIwLjIyMzkgOC4wMDAwMyAyMC41IDguMDAwMDNIMjIuNkMyMy4zNzMyIDguMDAwMDMgMjQgOC42MjY4MyAyNCA5LjQwMDAzVjE4LjZDMjQgMTkuMzczMiAyMy4zNzMyIDIwIDIyLjYgMjBIMjFWMjIuNzk3QzIxIDIzLjkwNjcgMTkuNjIzMSAyNC40MjE5IDE4Ljg5NDcgMjMuNTg0N0wxNS43NzU4IDIwSDguNEM3LjYyNjggMjAgNyAxOS4zNzMyIDcgMTguNlYxNS41QzcgMTUuMjIzOSA3LjIyMzg2IDE1IDcuNSAxNUM3Ljc3NjE0IDE1IDggMTUuMjIzOSA4IDE1LjVWMTguNkM4IDE4LjgyMDkgOC4xNzkwOSAxOSA4LjQgMTlIMTUuNzc1OEMxNi4wNjUxIDE5IDE2LjM0MDMgMTkuMTI1NCAxNi41MzAyIDE5LjM0MzZMMTkuNjQ5MSAyMi45MjgzQzE5Ljc3MDUgMjMuMDY3OCAyMCAyMi45ODIgMjAgMjIuNzk3VjIwQzIwIDE5LjQ0NzcgMjAuNDQ3NyAxOSAyMSAxOUgyMi42QzIyLjgyMDkgMTkgMjMgMTguODIwOSAyMyAxOC42VjkuNDAwMDNDMjMgOS4xNzkxMSAyMi44MjA5IDkuMDAwMDMgMjIuNiA5LjAwMDAzSDIwLjVDMjAuMjIzOSA5LjAwMDAzIDIwIDguNzc2MTcgMjAgOC41MDAwM1oiIGZpbGw9IndoaXRlIi8+CjxwYXRoIGQ9Ik0xMSA2LjUwMDAzQzExIDcuMzI4NDYgMTAuMzI4NCA4LjAwMDAzIDkuNSA4LjAwMDAzQzguNjcxNTcgOC4wMDAwMyA4IDcuMzI4NDYgOCA2LjUwMDAzQzggNS42NzE2IDguNjcxNTcgNS4wMDAwMyA5LjUgNS4wMDAwM0MxMC4zMjg0IDUuMDAwMDMgMTEgNS42NzE2IDExIDYuNTAwMDNaIiBmaWxsPSJ3aGl0ZSIvPgo8cGF0aCBkPSJNMTYgNi41MDAwM0MxNiA3LjMyODQ2IDE1LjMyODQgOC4wMDAwMyAxNC41IDguMDAwMDNDMTMuNjcxNiA4LjAwMDAzIDEzIDcuMzI4NDYgMTMgNi41MDAwM0MxMyA1LjY3MTYgMTMuNjcxNiA1LjAwMDAzIDE0LjUgNS4wMDAwM0MxNS4zMjg0IDUuMDAwMDMgMTYgNS42NzE2IDE2IDYuNTAwMDNaIiBmaWxsPSJ3aGl0ZSIvPgo8cGF0aCBkPSJNNiA2LjUwMDAzQzYgNy4zMjg0NiA1LjMyODQzIDguMDAwMDMgNC41IDguMDAwMDNDMy42NzE1NyA4LjAwMDAzIDMgNy4zMjg0NiAzIDYuNTAwMDNDMyA1LjY3MTYgMy42NzE1NyA1LjAwMDAzIDQuNSA1LjAwMDAzQzUuMzI4NDMgNS4wMDAwMyA2IDUuNjcxNiA2IDYuNTAwMDNaIiBmaWxsPSJ3aGl0ZSIvPgo8L2c+CjxkZWZzPgo8Y2xpcFBhdGggaWQ9ImNsaXAwXzQ2MzZfMTAzNjgyIj4KPHJlY3Qgd2lkdGg9IjI0IiBoZWlnaHQ9IjI0IiBmaWxsPSJ3aGl0ZSIvPgo8L2NsaXBQYXRoPgo8L2RlZnM+Cjwvc3ZnPgo="
                    alt="#ImgNotFound">
                <div class="text-white" style="font-size: 13px;">Support</div>
            </li>
        </ul>
    </div>

    <div class="sidebarSecondCSS">
        <h5 class="px-3 pt-3" style="font-weight: 400;">Products</h5>
        <hr class="p-0 m-0">
        <ul class="pt-4 p-0 m-0" style="list-style-type: none;">
            <li class="p-2 hoverStyleSecondSidebar">
                <div class="row px-2">
                    <div class="col-2">
                        <img src="https://my.vultr.com/_images/icons/nav/pull-zone.svg" alt="#ImgNotFound">
                    </div>
                    <div class="col-10">
                        CDN <span class="bg-primary text-white p-1" style="font-size: 12px;">Beta</span>
                    </div>
                </div>
            </li>
            <li class="p-2 hoverStyleSecondSidebar">
                <div class="row px-2">
                    <div class="col-2">
                        <img src="https://my.vultr.com/_images/icons/nav/networking.svg" alt="#ImgNotFound">
                    </div>
                    <div class="col-10">
                        Network
                    </div>
                </div>
            </li>
            <li class="p-2 hoverStyleSecondSidebar">
                <div class="row px-2">
                    <div class="col-2">
                        <img src="https://my.vultr.com/_images/icons/nav/orchestration.svg" alt="#ImgNotFound">
                    </div>
                    <div class="col-10">
                        Orchestration
                    </div>
                </div>
            </li>
        </ul>
    </div>
    <div class="contentCSS" style="overflow-y: scroll; overflow-x: hidden;">
        <div class="row">
            <div class="col-9 contentTopBeforeMDScrn">
                <h6 class="px-4 py-2 pt-3" style="font-weight: 400; font-size: 13px;">
                    <b class="text-primary">NEWS:</b> Vultr Offers NVIDIA GH200 Grace Hopper Superchip: Tap Into
                    Ultimate Power
                    and Efficiency
                </h6>
            </div>
            <div class="col-3 pt-lg-2 pt-3 contentTopBeforeMDScrn" style="text-align: right; padding-right: 50px;">
                <button type="button" class="btn btn-primary"
                    style="--bs-btn-padding-y: .30rem; --bs-btn-padding-x: .75rem; --bs-btn-font-size: .85rem;">Deploy +</button>
            </div>
        </div>
        <hr class="p-0 m-0 contentTopBeforeMDScrn">
        <div class="p-3 text-center contentTopAfterMDScrn"
            style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;">
            <img src="https://avatars.githubusercontent.com/u/8527264?s=200&v=4" alt="#ImgNotFound" width="45"
                height="45">
        </div>
        <div class="mx-3">
            <div class="container-xxl px-3 pt-5">
                <h1 style="font-weight: 300;">Deploy New Instance</h1>
            </div>
            <div class="p-3 mt-5"
                style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border-left: 5px solid #60A5FA;">
                <b class="text-primary">Welcome to the everywhere cloud.</b> <a href="">Continue setting up your
                    account.</a>
            </div>

            <h3 class="mt-5 pt-4" style="font-weight: 400;">Choose Type</h3>
            <div class="row">
                <div class="col-lg-3 col-md-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://my.vultr.com/_images/icons/nav/pull-zone.svg" alt="#ImgNotFound"
                                width="35px" height="35px">
                            <h6 class="mt-3">Optimized Cloud Compute - Dedicated CPU</h6>
                            <p>Virtual machines for more demanding business apps, e.g. production websites, CI/CD,
                                video transcoding, or larger databases.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://my.vultr.com/_images/icons/nav/pull-zone.svg" alt="#ImgNotFound"
                                width="35px" height="35px">
                            <h6 class="mt-3">Optimized Cloud Compute - Dedicated CPU</h6>
                            <p>Virtual machines for more demanding business apps, e.g. production websites, CI/CD,
                                video transcoding, or larger databases.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://my.vultr.com/_images/icons/nav/pull-zone.svg" alt="#ImgNotFound"
                                width="35px" height="35px">
                            <h6 class="mt-3">Optimized Cloud Compute - Dedicated CPU</h6>
                            <p>Virtual machines for more demanding business apps, e.g. production websites, CI/CD,
                                video transcoding, or larger databases.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 mt-4">
                    <div class="card"
                        style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: 2px solid #60A5FA;">
                        <div class="card-body">
                            <img src="https://my.vultr.com/_images/icons/nav/pull-zone.svg" alt="#ImgNotFound"
                                width="35px" height="35px">
                            <h6 class="mt-3">Optimized Cloud Compute - Dedicated CPU</h6>
                            <p>Virtual machines for more demanding business apps, e.g. production websites, CI/CD,
                                video transcoding, or larger databases.</p>
                        </div>
                    </div>
                </div>
            </div>


            <h3 class="mt-4" style="font-weight: 400;">Choose Location</h3>
            <ul class="nav nav-underline">
                <li class="nav-item">
                    <a class="nav-link text-black active">All Locations</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-black" href="#">Americas</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-black" href="#">Europe</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-black" href="#">Australia</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-black" href="#">Asia</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-black" href="#">Africa</a>
                </li>
            </ul>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/1200px-Flag_of_India.svg.png"
                                alt="#ImgNotFound" width="40px">
                            &ensp; Mumbai
                            <span style="float: right;">India</span>
                        </div>
                    </div>
                </div>
            </div>

            <h3 class="mt-5 mb-3" style="font-weight: 400;">Choose Image</h3>
            <ul class="nav nav-underline">
                <li class="nav-item">
                    <a class="nav-link text-black active">Operating System</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-black" href="#">Marketplace Apps</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-black" href="#">Upload ISO</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-black" href="#">ISO Library</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-black" href="#">Backup</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-black" href="#">Snapshot</a>
                </li>
            </ul>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body text-center">
                            <img src="https://avatars.githubusercontent.com/u/77327804?s=200&v=4" alt="#ImgNotFound"
                                width="50px">
                            <h5 class="pt-3">AlmaLinux</h5>
                            <hr>
                            <span>Select Version</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body text-center">
                            <img src="https://avatars.githubusercontent.com/u/77327804?s=200&v=4" alt="#ImgNotFound"
                                width="50px">
                            <h5 class="pt-3">AlmaLinux</h5>
                            <hr>
                            <span>Select Version</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body text-center">
                            <img src="https://avatars.githubusercontent.com/u/77327804?s=200&v=4" alt="#ImgNotFound"
                                width="50px">
                            <h5 class="pt-3">AlmaLinux</h5>
                            <hr>
                            <span>Select Version</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body text-center">
                            <img src="https://avatars.githubusercontent.com/u/77327804?s=200&v=4" alt="#ImgNotFound"
                                width="50px">
                            <h5 class="pt-3">AlmaLinux</h5>
                            <hr>
                            <span>Select Version</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body text-center">
                            <img src="https://avatars.githubusercontent.com/u/77327804?s=200&v=4" alt="#ImgNotFound"
                                width="50px">
                            <h5 class="pt-3">AlmaLinux</h5>
                            <hr>
                            <span>Select Version</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body text-center">
                            <img src="https://avatars.githubusercontent.com/u/77327804?s=200&v=4" alt="#ImgNotFound"
                                width="50px">
                            <h5 class="pt-3">AlmaLinux</h5>
                            <hr>
                            <span>Select Version</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body text-center">
                            <img src="https://avatars.githubusercontent.com/u/77327804?s=200&v=4" alt="#ImgNotFound"
                                width="50px">
                            <h5 class="pt-3">AlmaLinux</h5>
                            <hr>
                            <span>Select Version</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body text-center">
                            <img src="https://avatars.githubusercontent.com/u/77327804?s=200&v=4" alt="#ImgNotFound"
                                width="50px">
                            <h5 class="pt-3">AlmaLinux</h5>
                            <hr>
                            <span>Select Version</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body text-center">
                            <img src="https://avatars.githubusercontent.com/u/77327804?s=200&v=4" alt="#ImgNotFound"
                                width="50px">
                            <h5 class="pt-3">AlmaLinux</h5>
                            <hr>
                            <span>Select Version</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body text-center">
                            <img src="https://avatars.githubusercontent.com/u/77327804?s=200&v=4" alt="#ImgNotFound"
                                width="50px">
                            <h5 class="pt-3">AlmaLinux</h5>
                            <hr>
                            <span>Select Version</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body text-center">
                            <img src="https://avatars.githubusercontent.com/u/77327804?s=200&v=4" alt="#ImgNotFound"
                                width="50px">
                            <h5 class="pt-3">AlmaLinux</h5>
                            <hr>
                            <span>Select Version</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body text-center">
                            <img src="https://avatars.githubusercontent.com/u/77327804?s=200&v=4" alt="#ImgNotFound"
                                width="50px">
                            <h5 class="pt-3">AlmaLinux</h5>
                            <hr>
                            <span>Select Version</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body text-center">
                            <img src="https://avatars.githubusercontent.com/u/77327804?s=200&v=4" alt="#ImgNotFound"
                                width="50px">
                            <h5 class="pt-3">AlmaLinux</h5>
                            <hr>
                            <span>Select Version</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body text-center">
                            <img src="https://avatars.githubusercontent.com/u/77327804?s=200&v=4" alt="#ImgNotFound"
                                width="50px">
                            <h5 class="pt-3">AlmaLinux</h5>
                            <hr>
                            <span>Select Version</span>
                        </div>
                    </div>
                </div>
            </div>

            <h3 class="mt-5 mb-3" style="font-weight: 400;">Choose Plan</h3>
            <ul class="nav nav-underline">
                <li class="nav-item">
                    <a class="nav-link text-black active">General Purpose</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-black" href="#">CPU Optimized</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-black" href="#">Memory Optimized</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-black" href="#">Storage Optimized</a>
                </li>
            </ul>
            <table class="table dataBeforeLGScrn">
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Cores</th>
                        <th scope="col">Memory</th>
                        <th scope="col">Storage</th>
                        <th scope="col">Bandwidth</th>
                        <th scope="col">Price</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th scope="row">30 GB NVMe</th>
                        <td>1 vCPU</td>
                        <td>4 GB</td>
                        <td>30GB NVMe</td>
                        <td>4 TB</td>
                        <td>$30/month</td>
                    </tr>
                    <tr>
                        <th scope="row">30 GB NVMe</th>
                        <td>1 vCPU</td>
                        <td>4 GB</td>
                        <td>30GB NVMe</td>
                        <td>4 TB</td>
                        <td>$30/month</td>
                    </tr>
                    <tr>
                        <th scope="row">30 GB NVMe</th>
                        <td>1 vCPU</td>
                        <td>4 GB</td>
                        <td>30GB NVMe</td>
                        <td>4 TB</td>
                        <td>$30/month</td>
                    </tr>
                    <tr>
                        <th scope="row">30 GB NVMe</th>
                        <td>1 vCPU</td>
                        <td>4 GB</td>
                        <td>30GB NVMe</td>
                        <td>4 TB</td>
                        <td>$30/month</td>
                    </tr>
                    <tr>
                        <th scope="row">30 GB NVMe</th>
                        <td>1 vCPU</td>
                        <td>4 GB</td>
                        <td>30GB NVMe</td>
                        <td>4 TB</td>
                        <td>$30/month</td>
                    </tr>
                    <tr>
                        <th scope="row">30 GB NVMe</th>
                        <td>1 vCPU</td>
                        <td>4 GB</td>
                        <td>30GB NVMe</td>
                        <td>4 TB</td>
                        <td>$30/month</td>
                    </tr>
                    <tr>
                        <th scope="row">30 GB NVMe</th>
                        <td>1 vCPU</td>
                        <td>4 GB</td>
                        <td>30GB NVMe</td>
                        <td>4 TB</td>
                        <td>$30/month</td>
                    </tr>
                    <tr>
                        <th scope="row">30 GB NVMe</th>
                        <td>1 vCPU</td>
                        <td>4 GB</td>
                        <td>30GB NVMe</td>
                        <td>4 TB</td>
                        <td>$30/month</td>
                    </tr>
                    <tr>
                        <th scope="row">30 GB NVMe</th>
                        <td>1 vCPU</td>
                        <td>4 GB</td>
                        <td>30GB NVMe</td>
                        <td>4 TB</td>
                        <td>$30/month</td>
                    </tr>
                    <tr>
                        <th scope="row">30 GB NVMe</th>
                        <td>1 vCPU</td>
                        <td>4 GB</td>
                        <td>30GB NVMe</td>
                        <td>4 TB</td>
                        <td>$30/month</td>
                    </tr>
                </tbody>
            </table>
            <div class="dataAfterLGScrn">
                <div class="row">
                    <div class="col-md-6 mt-3">
                        <div class="card">
                            <div class="card-body">
                                <h6>30GB NVMe</h6>
                                <p>Cores: <b>1 vCPU</b> Memory: <b>4 GB</b></p>
                                <p>Storage: <b>30 GB NVMe</b> Bandwidth: <b>4 TB</b></p>
                                <hr>
                                <h6><b class="text-primary">$30/mo </b>$0.045/hour</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mt-3">
                        <div class="card">
                            <div class="card-body">
                                <h6>30GB NVMe</h6>
                                <p>Cores: <b>1 vCPU</b> Memory: <b>4 GB</b></p>
                                <p>Storage: <b>30 GB NVMe</b> Bandwidth: <b>4 TB</b></p>
                                <hr>
                                <h6><b class="text-primary">$30/mo </b>$0.045/hour</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mt-3">
                        <div class="card">
                            <div class="card-body">
                                <h6>30GB NVMe</h6>
                                <p>Cores: <b>1 vCPU</b> Memory: <b>4 GB</b></p>
                                <p>Storage: <b>30 GB NVMe</b> Bandwidth: <b>4 TB</b></p>
                                <hr>
                                <h6><b class="text-primary">$30/mo </b>$0.045/hour</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mt-3">
                        <div class="card">
                            <div class="card-body">
                                <h6>30GB NVMe</h6>
                                <p>Cores: <b>1 vCPU</b> Memory: <b>4 GB</b></p>
                                <p>Storage: <b>30 GB NVMe</b> Bandwidth: <b>4 TB</b></p>
                                <hr>
                                <h6><b class="text-primary">$30/mo </b>$0.045/hour</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mt-3">
                        <div class="card">
                            <div class="card-body">
                                <h6>30GB NVMe</h6>
                                <p>Cores: <b>1 vCPU</b> Memory: <b>4 GB</b></p>
                                <p>Storage: <b>30 GB NVMe</b> Bandwidth: <b>4 TB</b></p>
                                <hr>
                                <h6><b class="text-primary">$30/mo </b>$0.045/hour</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mt-3">
                        <div class="card">
                            <div class="card-body">
                                <h6>30GB NVMe</h6>
                                <p>Cores: <b>1 vCPU</b> Memory: <b>4 GB</b></p>
                                <p>Storage: <b>30 GB NVMe</b> Bandwidth: <b>4 TB</b></p>
                                <hr>
                                <h6><b class="text-primary">$30/mo </b>$0.045/hour</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mt-3">
                        <div class="card">
                            <div class="card-body">
                                <h6>30GB NVMe</h6>
                                <p>Cores: <b>1 vCPU</b> Memory: <b>4 GB</b></p>
                                <p>Storage: <b>30 GB NVMe</b> Bandwidth: <b>4 TB</b></p>
                                <hr>
                                <h6><b class="text-primary">$30/mo </b>$0.045/hour</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mt-3">
                        <div class="card">
                            <div class="card-body">
                                <h6>30GB NVMe</h6>
                                <p>Cores: <b>1 vCPU</b> Memory: <b>4 GB</b></p>
                                <p>Storage: <b>30 GB NVMe</b> Bandwidth: <b>4 TB</b></p>
                                <hr>
                                <h6><b class="text-primary">$30/mo </b>$0.045/hour</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mt-3">
                        <div class="card">
                            <div class="card-body">
                                <h6>30GB NVMe</h6>
                                <p>Cores: <b>1 vCPU</b> Memory: <b>4 GB</b></p>
                                <p>Storage: <b>30 GB NVMe</b> Bandwidth: <b>4 TB</b></p>
                                <hr>
                                <h6><b class="text-primary">$30/mo </b>$0.045/hour</h6>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 mt-3">
                        <div class="card">
                            <div class="card-body">
                                <h6>30GB NVMe</h6>
                                <p>Cores: <b>1 vCPU</b> Memory: <b>4 GB</b></p>
                                <p>Storage: <b>30 GB NVMe</b> Bandwidth: <b>4 TB</b></p>
                                <hr>
                                <h6><b class="text-primary">$30/mo </b>$0.045/hour</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <h3 class="mt-5 mb-3" style="font-weight: 400;">Additional Features</h3>
            <div class="row">
                <div class="col-lg-4 col-md-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://my.vultr.com/_images/icons/nav/pull-zone.svg" alt="#ImgNotFound"
                                width="35px" height="35px">
                            <h6 class="mt-3">Optimized Cloud Compute - Dedicated CPU</h6>
                            <p>Virtual machines for more demanding business apps, e.g. production websites, CI/CD,
                                video transcoding, or larger databases.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://my.vultr.com/_images/icons/nav/pull-zone.svg" alt="#ImgNotFound"
                                width="35px" height="35px">
                            <h6 class="mt-3">Optimized Cloud Compute - Dedicated CPU</h6>
                            <p>Virtual machines for more demanding business apps, e.g. production websites, CI/CD,
                                video transcoding, or larger databases.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://my.vultr.com/_images/icons/nav/pull-zone.svg" alt="#ImgNotFound"
                                width="35px" height="35px">
                            <h6 class="mt-3">Optimized Cloud Compute - Dedicated CPU</h6>
                            <p>Virtual machines for more demanding business apps, e.g. production websites, CI/CD,
                                video transcoding, or larger databases.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://my.vultr.com/_images/icons/nav/pull-zone.svg" alt="#ImgNotFound"
                                width="35px" height="35px">
                            <h6 class="mt-3">Optimized Cloud Compute - Dedicated CPU</h6>
                            <p>Virtual machines for more demanding business apps, e.g. production websites, CI/CD,
                                video transcoding, or larger databases.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://my.vultr.com/_images/icons/nav/pull-zone.svg" alt="#ImgNotFound"
                                width="35px" height="35px">
                            <h6 class="mt-3">Optimized Cloud Compute - Dedicated CPU</h6>
                            <p>Virtual machines for more demanding business apps, e.g. production websites, CI/CD,
                                video transcoding, or larger databases.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://my.vultr.com/_images/icons/nav/pull-zone.svg" alt="#ImgNotFound"
                                width="35px" height="35px">
                            <h6 class="mt-3">Optimized Cloud Compute - Dedicated CPU</h6>
                            <p>Virtual machines for more demanding business apps, e.g. production websites, CI/CD,
                                video transcoding, or larger databases.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://my.vultr.com/_images/icons/nav/pull-zone.svg" alt="#ImgNotFound"
                                width="35px" height="35px">
                            <h6 class="mt-3">Optimized Cloud Compute - Dedicated CPU</h6>
                            <p>Virtual machines for more demanding business apps, e.g. production websites, CI/CD,
                                video transcoding, or larger databases.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 mt-4">
                    <div class="card" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                        <div class="card-body">
                            <img src="https://my.vultr.com/_images/icons/nav/pull-zone.svg" alt="#ImgNotFound"
                                width="35px" height="35px">
                            <h6 class="mt-3">Optimized Cloud Compute - Dedicated CPU</h6>
                            <p>Virtual machines for more demanding business apps, e.g. production websites, CI/CD,
                                video transcoding, or larger databases.</p>
                        </div>
                    </div>
                </div>
            </div>

            <h3 class="mt-5 pt-4 mb-3" style="font-weight: 400;">Server Settings</h3>
            <div class="card w-100" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                <div class="card-body">
                    <div class="row">
                        <div class="col-6">
                            <label for="exampleInputEmail1" class="form-label">SSH Keys </label><span
                                style="float: right;">Manage</span>
                            <select class="form-select" aria-label="Default select example" id="exampleInputEmail1">
                                <option selected>Choose SSH Key</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>
                        <div class="col-6"></div>
                    </div>
                </div>
            </div>

            <h3 class="mt-5 pt-4 mb-3" style="font-weight: 400;">Server Hostname & Label</h3>
            <div class="card w-100" style="box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px; border: none;">
                <div class="card-body">
                    <div class="row">
                        <div class="col-6">
                            <label for="hostNameInput" class="form-label">Server Hostname</label>
                            <input type="text" class="form-control" id="hostNameInput">
                        </div>
                        <div class="col-6">
                            <label for="serverLabelInput" class="form-label">Server Label</label>
                            <input type="text" class="form-control" id="serverLabelInput">
                        </div>
                    </div>
                </div>
            </div>
            <br><br><br>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>