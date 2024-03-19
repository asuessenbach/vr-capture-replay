:: SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
:: SPDX-License-Identifier: Apache-2.0
::
:: Licensed under the Apache License, Version 2.0 (the "License");
:: you may not use this file except in compliance with the License.
:: You may obtain a copy of the License at
::
:: http://www.apache.org/licenses/LICENSE-2.0
::
:: Unless required by applicable law or agreed to in writing, software
:: distributed under the License is distributed on an "AS IS" BASIS,
:: WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
:: See the License for the specific language governing permissions and
:: limitations under the License.

echo off
setlocal

set target=%~1
if "%target%" == "" set target=Release

if not "%target%" == "Debug" if not "%target%" == "Release" goto usage

echo building target %target%
mkdir _build
pushd _build
cmake ..\ -A x64
cmake --build . --config %target%
popd
goto :eof

:usage
echo build requires one argument: "Debug" or "Release". Default is "Release".
