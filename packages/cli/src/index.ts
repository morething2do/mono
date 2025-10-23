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
  });

program.parse();
