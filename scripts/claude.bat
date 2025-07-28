@echo off
REM Claude Code WSL Wrapper Script
REM This script starts WSL terminal with claude command

REM Start WSL with interactive bash and execute claude with arguments
wsl -e bash -ic "claude %*"