#!/usr/bin/env bun
import { Command } from "commander";
import chalk from "chalk";
import ora from "ora";

const program = new Command();

program
  .name("cli")
  .description("项目 CLI 工具")
  .version("0.1.0");

program
  .command("hello")
  .description("打印欢迎信息")
  .argument("[name]", "名称", "World")
  .action((name: string) => {
    console.log(chalk.blue(`你好，${name}！`));
  });

program
  .command("build")
  .description("构建项目")
  .option("-p, --project <name>", "项目名称")
  .action((options) => {
    const spinner = ora("正在构建项目...").start();
    
    setTimeout(() => {
      spinner.succeed(chalk.green(`项目 ${options.project || "全部"} 构建成功！`));
    }, 2000);
  });

program
  .command("dev")
  .description("启动开发服务器")
  .option("-p, --port <port>", "端口号", "3000")
  .action((options) => {
    console.log(chalk.cyan(`🚀 开发服务器启动于端口 ${options.port}`));
  });

program
  .command("info")
  .description("显示项目信息")
  .action(() => {
    console.log(chalk.yellow("📦 Monorepo 项目模板"));
    console.log(chalk.gray("版本: 0.1.0"));
    console.log(chalk.gray("运行时: Bun"));
    console.log(chalk.gray(""));
    console.log(chalk.green("项目结构:"));
    console.log(chalk.gray("  - apps/api: Python FastAPI 后端"));
    console.log(chalk.gray("  - apps/web: Svelte 前端"));
    console.log(chalk.gray("  - apps/desktop: Tauri 桌面应用"));
    console.log(chalk.gray("  - packages/cli: CLI 工具"));
  });

program
  .command("api")
  .description("与 API 服务交互")
  .option("-u, --url <url>", "API URL", "http://localhost:8000")
  .action(async (options) => {
    const spinner = ora("正在连接 API 服务...").start();
    
    try {
      const response = await fetch(`${options.url}/api/health`);
      const data = await response.json();
      
      spinner.succeed(chalk.green("API 服务运行正常"));
      console.log(chalk.gray(JSON.stringify(data, null, 2)));
    } catch (error) {
      spinner.fail(chalk.red("无法连接到 API 服务"));
      console.log(chalk.gray(`请确保 API 服务正在运行: ${options.url}`));
    }
  });

program
  .command("items")
  .description("获取数据项列表")
  .option("-u, --url <url>", "API URL", "http://localhost:8000")
  .action(async (options) => {
    const spinner = ora("正在获取数据项...").start();
    
    try {
      const response = await fetch(`${options.url}/api/items`);
      const data = await response.json() as any[];
      
      spinner.succeed(chalk.green(`获取到 ${data.length} 个数据项`));
      console.log(chalk.gray(JSON.stringify(data, null, 2)));
    } catch (error) {
      spinner.fail(chalk.red("无法获取数据项"));
    }
  });

program.parse();
