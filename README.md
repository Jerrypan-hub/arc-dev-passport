# Arc Dev Passport

一个面向 Arc Testnet 的极简开发者身份与贡献记录合约。

它不会发行代币，也不承诺任何空投收益；它的目标是帮你留下一个干净、可展示、可验证的 Arc 开发者足迹：

- 部署一个自己的 Solidity 合约
- 注册你的开发者 handle 和项目地址
- 记录你的 GitHub、教程、演示、社区贡献链接
- 在 Arc Testnet Explorer 上留下真实交易记录

## 0. 准备工具

安装 Foundry：

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

确认安装成功：

```bash
forge --version
cast --version
```

## 1. 配置钱包和 Arc Testnet

Arc Testnet 参数：

- RPC: `https://rpc.testnet.arc.network`
- Chain ID: `5042002`
- Gas token: `USDC`
- Explorer: `https://testnet.arcscan.app`

生成一个专门用于测试网的新钱包：

```bash
cast wallet new
```

把输出里的 `Private key` 复制到 `.env`。不要把主钱包私钥放进来。

复制环境变量模板：

```bash
cp .env.example .env
```

编辑 `.env`：

```bash
ARC_TESTNET_RPC_URL="https://rpc.testnet.arc.network"
PRIVATE_KEY="0x你的测试钱包私钥"
CONTRACT_ADDRESS=""
```

去 Circle Faucet 领取 Arc Testnet USDC：

https://faucet.circle.com

选择 Arc Testnet，填入刚生成的钱包地址。

## 2. 本地测试

```bash
forge test
```

## 3. 部署合约

```bash
./scripts/deploy.sh
```

部署成功后，终端会显示类似：

```text
Deployed to: 0x...
Transaction hash: 0x...
```

把 `Deployed to` 后面的地址填回 `.env`：

```bash
CONTRACT_ADDRESS="0x你的合约地址"
```

然后去 Explorer 查询交易：

https://testnet.arcscan.app

## 4. 注册你的开发者身份

先编辑 `scripts/register-example.sh`，把 `@your-handle` 和 GitHub 链接改成你的。

然后运行：

```bash
./scripts/register-example.sh
```

## 5. 记录一次贡献

先编辑 `scripts/log-contribution-example.sh`，把贡献链接改成你的项目 README、教程、演示视频或社区帖子。

然后运行：

```bash
./scripts/log-contribution-example.sh
```

## 6. 读取链上资料

```bash
cast call "$CONTRACT_ADDRESS" \
  "getContributionCount(address)(uint256)" \
  "你的钱包地址" \
  --rpc-url "$ARC_TESTNET_RPC_URL"
```

## 建议你公开展示的材料

在 GitHub README 里放这些内容：

1. 项目名称：Arc Dev Passport
2. 项目说明：Arc Testnet developer identity and contribution log
3. 合约地址
4. 部署交易 hash
5. 交互交易 hash
6. 截图：Explorer 交易页面
7. 你写的一段中文或英文教程：我是如何部署第一个 Arc 合约的

## 安全提醒

- 不要提交 `.env`
- 不要把私钥发给任何人
- 用新测试钱包，不要用主钱包
- Testnet USDC 没有真实价值
- 这个项目只用于合法测试和开发展示，不要用于刷量、虚假贡献或多账号滥用
