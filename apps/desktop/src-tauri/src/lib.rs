// Tauri 命令定义
#[tauri::command]
fn greet(name: &str) -> String {
    format!("你好，{}！这是来自 Rust 的问候！", name)
}

#[tauri::command]
fn get_system_info() -> String {
    let os = std::env::consts::OS;
    let arch = std::env::consts::ARCH;
    format!("操作系统: {}, 架构: {}", os, arch)
}

#[cfg_attr(mobile, tauri::mobile_entry_point)]
pub fn run() {
    tauri::Builder::default()
        .plugin(tauri_plugin_opener::init())
        .invoke_handler(tauri::generate_handler![greet, get_system_info])
        .run(tauri::generate_context!())
        .expect("error while running tauri application");
}
