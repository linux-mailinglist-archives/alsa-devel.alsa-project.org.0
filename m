Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33771A2BB80
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:33:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DC8A60242;
	Fri,  7 Feb 2025 07:33:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DC8A60242
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738910020;
	bh=PKWaoiZWN7rBc1IwzZt9eHQWyO//rbxQQcnm4dOjSTY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lYGu7erdV3wlIHPoOHb9RyVq+nh0rsJAFlKuiHWxw2grK7afEvmCkmqEoMZR637xz
	 Rhn/YIgQUlWiljivyOldTCYwkIZgADmjIJzwSy7Qa7Sm2tEwyuhqzf+zs7VdVbFaC4
	 r5HRegzKlMeWOr1bty1wG2cVJDMYK8ai4rcKwzAw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 242EEF805FA; Fri,  7 Feb 2025 07:30:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3421F805FD;
	Fri,  7 Feb 2025 07:30:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A048F805E8; Fri,  7 Feb 2025 07:30:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::612])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3852AF805E4
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:30:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3852AF805E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=KeDxVM8K
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNYEUNupT4GdrUa9sqJoQZHtrYq/Tv49NrqaUlDTfBZGYJzXcDnfCd+LjxRu3vXv27HBAug7EBcl0NLcsMgeDIZdt65l28jrdB6lrqb9b3Rik2soP3DQYzUdQVLobQIMZDI+Fw9CwLCpW3MaH/eBuEfiEaKmWPuRCXGrUw69ZFSOfCZhqu6kDM/YvtycbDIPs42woXBcwf/q0QdcjHkFx08GvCr+G6YS8/W0Zz0I8Aun4rKU0cNK8T9btdSh19w+PFJH3jDzkbBjf94dImdU5MiwMy5W1zx9PPzoYa3xcnLkJRFXSTzSU+9TvIu+pu/aOgHzYS0CTch5dX7E999LkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIuBGknZOxnM9om7Uij7FTIko+jOt0gSH0vpBzcWqio=;
 b=m8RUjU5h9jv9fUuWzLiPXsHDCuMr9qNllkz7wnpah9B2CLnIgr+mUTKC/n9bLwxMPkQbjSIVjMvf0CP7gbNE9jJmus4roAegsTqDRdGrLs1iNn6MmTLx34G4prq8eAwAixoPUaTG7ZjeEIl5wbRLXEi5rYSmYp0lhtmcBVoIU5YOP10HXDUAT9mWNIxvAb6k4iHQPA9pWNpJyBaKviiNuXJd8y7+kPo3ZUJNl2MmaA1BPcu+7WwDKOf+yRabnpRX6jZbnm5MLfBjMYgeqTIeW2wTw/q5nA+U5N+6FqRSzgVmZVql8eX9vrFcbOkLbhqnKRUPjHywvhA6lve7Et60LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIuBGknZOxnM9om7Uij7FTIko+jOt0gSH0vpBzcWqio=;
 b=KeDxVM8Kyq83jq4ex91Udu2lQOje87zqiXmnW5vkCzRZQAJgEHxXl7R8vYWxse7c0QI8SMZ+a148Zve/cvf/1voAmxRKMAEofLQaALEcib0LZBm4yN0v4uiDUWcQDPYNIKml9HmkqERAW5I+ZwBoq+dAQwXaKe5GQLilRVnIoH0=
Received: from PH8PR07CA0044.namprd07.prod.outlook.com (2603:10b6:510:2cf::12)
 by SJ0PR12MB8168.namprd12.prod.outlook.com (2603:10b6:a03:4e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 06:30:01 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:510:2cf:cafe::86) by PH8PR07CA0044.outlook.office365.com
 (2603:10b6:510:2cf::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.30 via Frontend Transport; Fri,
 7 Feb 2025 06:30:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Fri, 7 Feb 2025 06:30:00 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:29:26 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 14/25] ASoC: amd: ps: add ACP7.0 & ACP7.1 specific
 soundwire dma driver changes
Date: Fri, 7 Feb 2025 11:58:08 +0530
Message-ID: <20250207062819.1527184-15-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
References: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|SJ0PR12MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: dce9e38f-5f64-414b-0674-08dd4740d93d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rg8y1gsguwsfc1ryGI2O/tYyv4sxjkrM5zGPG/0oKXcpDcHXdsvtU92flPe8?=
 =?us-ascii?Q?46OtNVSanSYRtXb4RC4rYiiCxhSAn2nbjYkTZapHZNdsdNhQ5QYDJLmjSAHZ?=
 =?us-ascii?Q?aAJCZ2UFFU3m6tWEUzPLbtLVHYicdXLYq9OTI0CiqGp3iW08iM/cMUM8KuXb?=
 =?us-ascii?Q?qg1+mKkDjtt/ce3hJ+DyqSdGM1a8l3N3YlDn0QOW7oIMBURjDWepFOdXeKAr?=
 =?us-ascii?Q?dszFH9wgHYp9GERSDFU/1st/sYkGOIrdaWXyJ3Jdit6+jzPUbm/3oD0pTqpy?=
 =?us-ascii?Q?kWQBdPeh6RwnNqeXMrv6GkLdKp/Vsx6O1rgZPGCT1V7XfxXrmjVGcDRcDZ3w?=
 =?us-ascii?Q?BjlHftHBzoQ4+podalCLhdorxShjuQDBHiMqY9aUMAIuldHwF85ZQlmqyK6f?=
 =?us-ascii?Q?9OyaeyUeq7gO8uiOsET/ngWpPWtKVSAjUx6ex2SiGCvPqPyls89iwvFOGrp7?=
 =?us-ascii?Q?RjusJpE0RP5bCULQYvpAZY8Nj3YmD3jBBg4pTzrbuzY2Kv9l7b0WT2FFIi/N?=
 =?us-ascii?Q?Log8Km8XxTVfwyWp6xoAnmOGMhE+V/U4we0CA8V4sUwvvrcL0r006b2A6Jwc?=
 =?us-ascii?Q?s60D6UQol3WgPrZhxLJBHe5gUhQHFnejUYa6u9dXSErhEKsl87/wNLbiv0gw?=
 =?us-ascii?Q?+e87S+FFw6sWta7R/vs5lZIEskvLAu+YzVrySVjqBC/cLp/78MmdOfHUsA67?=
 =?us-ascii?Q?VJom9gk//osxzPzAHuVs/JRbaleEbrKqEc7PWf7O5PszltNzBDNhWqn5yq+9?=
 =?us-ascii?Q?Syn+e4bp0qCk3RAHkT9GVgoFUHFejedDxkRzGGg9tKELNxVGs37+DB7L4srK?=
 =?us-ascii?Q?xTzfYsTQs2Ss5l/ruL96Ok17gryC8FCShowxBHepjjmseH91ioAqAB13Sz0i?=
 =?us-ascii?Q?qexHanfstNKzEklT+YYf0DXmZOgNoUvsil1gp39KIAxRfOD9bxlcekN+RLnl?=
 =?us-ascii?Q?Bt7AyDWGTbRksT5A2kqYjXG0afrNf5rype74g8wiz7kYd/yJKFbudRfgEIG6?=
 =?us-ascii?Q?5mbPt9ZsoAoWZRu3rS9025+5CSs+b/8IxS/M3blcwlAZEytfMwq+OfNTB81z?=
 =?us-ascii?Q?jn/wWYbaZ9nq/Xvs2RrDVvE5Pfqqe12BHkS8gO4fxTqd03wdSqBiC7W+29OP?=
 =?us-ascii?Q?yI0nW3JjbFB2MJFVLAujOmYODBeM8aMvM6aGewGXpnp77E867tkHgTVcZDwv?=
 =?us-ascii?Q?6iZVbHXOpq4USFY3xA9FwQICnriQldIl/zCnbIGKNaKIx/lwmIVqt7rfY2cX?=
 =?us-ascii?Q?xoh/lix6TtaRkMbCfM+lOLIERzJ5E3zahh/lsnkuVof45lbFjV9k5sVuLkNX?=
 =?us-ascii?Q?CAfOFA0XgodY5dmyTFvSZEsF44ERSAIwJWEU+gQgZyynWhavrd4SqdHSDiAq?=
 =?us-ascii?Q?btXkMIc3VE0lmJQfBbcvlFCKOvCSCfuxmZ7HxW01mVYVaoohk1FREdNAZBe2?=
 =?us-ascii?Q?yNdL0YATLOaPW0SSk+vn6QvmByHMldTHa6jStHZCbL6raJbUFsmleoaqC6AP?=
 =?us-ascii?Q?BDzJ8bfRS+PM3Sw=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:30:00.3050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dce9e38f-5f64-414b-0674-08dd4740d93d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8168
Message-ID-Hash: Z4C3WTY6UDYYWF4C3UIB3H5KNCJ7PZR7
X-Message-ID-Hash: Z4C3WTY6UDYYWF4C3UIB3H5KNCJ7PZR7
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z4C3WTY6UDYYWF4C3UIB3H5KNCJ7PZR7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add SoundWire dma driver changes specific to ACP7.0 & ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h      |  52 ++++++++++++
 sound/soc/amd/ps/ps-sdw-dma.c | 154 ++++++++++++++++++++++++++++++++++
 2 files changed, 206 insertions(+)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index f65f242211e9..4d197bb8271a 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -140,6 +140,47 @@
 #define ACP70_TIMEOUT				2000
 #define ACP70_SDW_HOST_WAKE_MASK	0x0C00000
 
+#define ACP70_SDW0_DMA_MAX_STREAMS	6
+#define ACP70_SDW1_DMA_MAX_STREAMS	ACP70_SDW0_DMA_MAX_STREAMS
+
+#define ACP70_P1_AUDIO0_TX_THRESHOLD      0x8
+#define ACP70_P1_AUDIO1_TX_THRESHOLD      0x6
+#define ACP70_P1_AUDIO2_TX_THRESHOLD      0x4
+#define ACP70_P1_AUDIO0_RX_THRESHOLD      0x7
+#define ACP70_P1_AUDIO1_RX_THRESHOLD      0x5
+#define ACP70_P1_AUDIO2_RX_THRESHOLD      0x3
+
+#define ACP70_SDW0_DMA_TX_IRQ_MASK(i)	(ACP_AUDIO0_TX_THRESHOLD - (2 * (i)))
+#define ACP70_SDW0_DMA_RX_IRQ_MASK(i)	(ACP_AUDIO0_RX_THRESHOLD - (2 * ((i) - 3)))
+
+/*
+ * Below entries describes SDW1 instance DMA stream id and DMA irq bit mapping
+ * in ACP_EXTENAL_INTR_CNTL1 register for ACP70/ACP71 platforms
+ * Stream id		IRQ Bit
+ * 0 (SDW1_AUDIO0_TX)	8
+ * 1 (SDW1_AUDIO1_TX)	6
+ * 2 (SDW1_AUDIO2_TX)	4
+ * 3 (SDW1_AUDIO0_RX)	7
+ * 4 (SDW1_AUDIO1_RX)	5
+ * 5 (SDW1_AUDIO2_RX)	3
+ */
+#define ACP70_SDW1_DMA_TX_IRQ_MASK(i)	(ACP70_P1_AUDIO0_TX_THRESHOLD - (2 * (i)))
+#define ACP70_SDW1_DMA_RX_IRQ_MASK(i)	(ACP70_P1_AUDIO0_RX_THRESHOLD - (2 * ((i) - 3)))
+
+#define ACP70_SW0_AUDIO0_TX_EN		ACP_SW0_AUDIO0_TX_EN
+#define ACP70_SW0_AUDIO1_TX_EN		ACP_SW0_AUDIO1_TX_EN
+#define ACP70_SW0_AUDIO2_TX_EN		ACP_SW0_AUDIO2_TX_EN
+#define ACP70_SW0_AUDIO0_RX_EN		ACP_SW0_AUDIO0_RX_EN
+#define ACP70_SW0_AUDIO1_RX_EN		ACP_SW0_AUDIO1_RX_EN
+#define ACP70_SW0_AUDIO2_RX_EN		ACP_SW0_AUDIO2_RX_EN
+
+#define ACP70_SW1_AUDIO0_TX_EN		0x0003C10
+#define ACP70_SW1_AUDIO1_TX_EN		0x0003C50
+#define ACP70_SW1_AUDIO2_TX_EN		0x0003C6C
+#define ACP70_SW1_AUDIO0_RX_EN		0x0003C88
+#define ACP70_SW1_AUDIO1_RX_EN		0x0003D28
+#define ACP70_SW1_AUDIO2_RX_EN		0x0003D44
+
 enum acp_config {
 	ACP_CONFIG_0 = 0,
 	ACP_CONFIG_1,
@@ -178,6 +219,15 @@ enum amd_acp63_sdw1_channel {
 	ACP63_SDW1_AUDIO1_RX,
 };
 
+enum amd_acp70_sdw_channel {
+	ACP70_SDW_AUDIO0_TX = 0,
+	ACP70_SDW_AUDIO1_TX,
+	ACP70_SDW_AUDIO2_TX,
+	ACP70_SDW_AUDIO0_RX,
+	ACP70_SDW_AUDIO1_RX,
+	ACP70_SDW_AUDIO2_RX,
+};
+
 struct pdm_stream_instance {
 	u16 num_pages;
 	u16 channels;
@@ -199,6 +249,8 @@ struct sdw_dma_dev_data {
 	u32 acp_rev;
 	struct snd_pcm_substream *acp63_sdw0_dma_stream[ACP63_SDW0_DMA_MAX_STREAMS];
 	struct snd_pcm_substream *acp63_sdw1_dma_stream[ACP63_SDW1_DMA_MAX_STREAMS];
+	struct snd_pcm_substream *acp70_sdw0_dma_stream[ACP70_SDW0_DMA_MAX_STREAMS];
+	struct snd_pcm_substream *acp70_sdw1_dma_stream[ACP70_SDW1_DMA_MAX_STREAMS];
 };
 
 struct acp_sdw_dma_stream {
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 7cd153a4edc9..2966244eb25e 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -75,6 +75,72 @@ static u32 acp63_sdw1_dma_enable_reg[ACP63_SDW1_DMA_MAX_STREAMS] = {
 	ACP_SW1_AUDIO1_RX_EN,
 };
 
+static struct sdw_dma_ring_buf_reg acp70_sdw0_dma_reg[ACP70_SDW0_DMA_MAX_STREAMS] = {
+	{ACP_AUDIO0_TX_DMA_SIZE, ACP_AUDIO0_TX_FIFOADDR, ACP_AUDIO0_TX_FIFOSIZE,
+	 ACP_AUDIO0_TX_RINGBUFSIZE, ACP_AUDIO0_TX_RINGBUFADDR, ACP_AUDIO0_TX_INTR_WATERMARK_SIZE,
+	 ACP_AUDIO0_TX_LINEARPOSITIONCNTR_LOW, ACP_AUDIO0_TX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_AUDIO1_TX_DMA_SIZE, ACP_AUDIO1_TX_FIFOADDR, ACP_AUDIO1_TX_FIFOSIZE,
+	 ACP_AUDIO1_TX_RINGBUFSIZE, ACP_AUDIO1_TX_RINGBUFADDR, ACP_AUDIO1_TX_INTR_WATERMARK_SIZE,
+	 ACP_AUDIO1_TX_LINEARPOSITIONCNTR_LOW, ACP_AUDIO1_TX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_AUDIO2_TX_DMA_SIZE, ACP_AUDIO2_TX_FIFOADDR, ACP_AUDIO2_TX_FIFOSIZE,
+	 ACP_AUDIO2_TX_RINGBUFSIZE, ACP_AUDIO2_TX_RINGBUFADDR, ACP_AUDIO2_TX_INTR_WATERMARK_SIZE,
+	 ACP_AUDIO2_TX_LINEARPOSITIONCNTR_LOW, ACP_AUDIO2_TX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_AUDIO0_RX_DMA_SIZE, ACP_AUDIO0_RX_FIFOADDR, ACP_AUDIO0_RX_FIFOSIZE,
+	 ACP_AUDIO0_RX_RINGBUFSIZE, ACP_AUDIO0_RX_RINGBUFADDR, ACP_AUDIO0_RX_INTR_WATERMARK_SIZE,
+	 ACP_AUDIO0_RX_LINEARPOSITIONCNTR_LOW, ACP_AUDIO0_RX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_AUDIO1_RX_DMA_SIZE, ACP_AUDIO1_RX_FIFOADDR, ACP_AUDIO1_RX_FIFOSIZE,
+	 ACP_AUDIO1_RX_RINGBUFSIZE, ACP_AUDIO1_RX_RINGBUFADDR, ACP_AUDIO1_RX_INTR_WATERMARK_SIZE,
+	 ACP_AUDIO1_RX_LINEARPOSITIONCNTR_LOW, ACP_AUDIO1_RX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_AUDIO2_RX_DMA_SIZE, ACP_AUDIO2_RX_FIFOADDR, ACP_AUDIO2_RX_FIFOSIZE,
+	 ACP_AUDIO2_RX_RINGBUFSIZE, ACP_AUDIO2_RX_RINGBUFADDR, ACP_AUDIO2_RX_INTR_WATERMARK_SIZE,
+	 ACP_AUDIO2_RX_LINEARPOSITIONCNTR_LOW, ACP_AUDIO2_RX_LINEARPOSITIONCNTR_HIGH}
+};
+
+static struct sdw_dma_ring_buf_reg acp70_sdw1_dma_reg[ACP70_SDW1_DMA_MAX_STREAMS] = {
+	{ACP_P1_AUDIO0_TX_DMA_SIZE, ACP_P1_AUDIO0_TX_FIFOADDR, ACP_P1_AUDIO0_TX_FIFOSIZE,
+	 ACP_P1_AUDIO0_TX_RINGBUFSIZE, ACP_P1_AUDIO0_TX_RINGBUFADDR,
+	 ACP_P1_AUDIO0_TX_INTR_WATERMARK_SIZE,
+	 ACP_P1_AUDIO0_TX_LINEARPOSITIONCNTR_LOW, ACP_P1_AUDIO0_TX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_P1_AUDIO1_TX_DMA_SIZE, ACP_P1_AUDIO1_TX_FIFOADDR, ACP_P1_AUDIO1_TX_FIFOSIZE,
+	 ACP_P1_AUDIO1_TX_RINGBUFSIZE, ACP_P1_AUDIO1_TX_RINGBUFADDR,
+	 ACP_P1_AUDIO1_TX_INTR_WATERMARK_SIZE,
+	 ACP_P1_AUDIO1_TX_LINEARPOSITIONCNTR_LOW, ACP_P1_AUDIO1_TX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_P1_AUDIO2_TX_DMA_SIZE, ACP_P1_AUDIO2_TX_FIFOADDR, ACP_P1_AUDIO2_TX_FIFOSIZE,
+	 ACP_P1_AUDIO2_TX_RINGBUFSIZE, ACP_P1_AUDIO2_TX_RINGBUFADDR,
+	 ACP_P1_AUDIO2_TX_INTR_WATERMARK_SIZE,
+	 ACP_P1_AUDIO2_TX_LINEARPOSITIONCNTR_LOW, ACP_P1_AUDIO2_TX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_P1_AUDIO0_RX_DMA_SIZE, ACP_P1_AUDIO0_RX_FIFOADDR, ACP_P1_AUDIO0_RX_FIFOSIZE,
+	 ACP_P1_AUDIO0_RX_RINGBUFSIZE, ACP_P1_AUDIO0_RX_RINGBUFADDR,
+	 ACP_P1_AUDIO0_RX_INTR_WATERMARK_SIZE,
+	 ACP_P1_AUDIO0_RX_LINEARPOSITIONCNTR_LOW, ACP_P1_AUDIO0_RX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_P1_AUDIO1_RX_DMA_SIZE, ACP_P1_AUDIO1_RX_FIFOADDR, ACP_P1_AUDIO1_RX_FIFOSIZE,
+	 ACP_P1_AUDIO1_RX_RINGBUFSIZE, ACP_P1_AUDIO1_RX_RINGBUFADDR,
+	 ACP_P1_AUDIO1_RX_INTR_WATERMARK_SIZE,
+	 ACP_P1_AUDIO1_RX_LINEARPOSITIONCNTR_LOW, ACP_P1_AUDIO1_RX_LINEARPOSITIONCNTR_HIGH},
+	{ACP_P1_AUDIO2_RX_DMA_SIZE, ACP_P1_AUDIO2_RX_FIFOADDR, ACP_P1_AUDIO2_RX_FIFOSIZE,
+	 ACP_P1_AUDIO2_RX_RINGBUFSIZE, ACP_P1_AUDIO2_RX_RINGBUFADDR,
+	 ACP_P1_AUDIO2_RX_INTR_WATERMARK_SIZE,
+	 ACP_P1_AUDIO2_RX_LINEARPOSITIONCNTR_LOW, ACP_P1_AUDIO2_RX_LINEARPOSITIONCNTR_HIGH}
+};
+
+static u32 acp70_sdw0_dma_enable_reg[ACP70_SDW0_DMA_MAX_STREAMS] = {
+	ACP70_SW0_AUDIO0_TX_EN,
+	ACP70_SW0_AUDIO1_TX_EN,
+	ACP70_SW0_AUDIO2_TX_EN,
+	ACP70_SW0_AUDIO0_RX_EN,
+	ACP70_SW0_AUDIO1_RX_EN,
+	ACP70_SW0_AUDIO2_RX_EN,
+};
+
+static u32 acp70_sdw1_dma_enable_reg[ACP70_SDW1_DMA_MAX_STREAMS] = {
+	ACP70_SW1_AUDIO0_TX_EN,
+	ACP70_SW1_AUDIO1_TX_EN,
+	ACP70_SW1_AUDIO2_TX_EN,
+	ACP70_SW1_AUDIO0_RX_EN,
+	ACP70_SW1_AUDIO1_RX_EN,
+	ACP70_SW1_AUDIO2_RX_EN,
+};
+
 static const struct snd_pcm_hardware acp63_sdw_hardware_playback = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
@@ -200,6 +266,27 @@ static int acp63_configure_sdw_ringbuffer(void __iomem *acp_base, u32 stream_id,
 			return -EINVAL;
 		}
 		break;
+	case ACP70_PCI_REV:
+	case ACP71_PCI_REV:
+		switch (manager_instance) {
+		case ACP_SDW0:
+			reg_dma_size = acp70_sdw0_dma_reg[stream_id].reg_dma_size;
+			reg_fifo_addr =	acp70_sdw0_dma_reg[stream_id].reg_fifo_addr;
+			reg_fifo_size = acp70_sdw0_dma_reg[stream_id].reg_fifo_size;
+			reg_ring_buf_size = acp70_sdw0_dma_reg[stream_id].reg_ring_buf_size;
+			reg_ring_buf_addr = acp70_sdw0_dma_reg[stream_id].reg_ring_buf_addr;
+			break;
+		case ACP_SDW1:
+			reg_dma_size = acp70_sdw1_dma_reg[stream_id].reg_dma_size;
+			reg_fifo_addr =	acp70_sdw1_dma_reg[stream_id].reg_fifo_addr;
+			reg_fifo_size = acp70_sdw1_dma_reg[stream_id].reg_fifo_size;
+			reg_ring_buf_size = acp70_sdw1_dma_reg[stream_id].reg_ring_buf_size;
+			reg_ring_buf_addr = acp70_sdw1_dma_reg[stream_id].reg_ring_buf_addr;
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -292,6 +379,32 @@ static int acp63_sdw_dma_hw_params(struct snd_soc_component *component,
 			return -EINVAL;
 		}
 		break;
+	case ACP70_PCI_REV:
+	case ACP71_PCI_REV:
+		switch (stream->instance) {
+		case ACP_SDW0:
+			sdw_data->acp70_sdw0_dma_stream[stream_id] = substream;
+			water_mark_size_reg = acp70_sdw0_dma_reg[stream_id].water_mark_size_reg;
+			acp_ext_intr_cntl_reg = ACP_EXTERNAL_INTR_CNTL;
+			if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+				irq_mask = BIT(ACP70_SDW0_DMA_TX_IRQ_MASK(stream_id));
+			else
+				irq_mask = BIT(ACP70_SDW0_DMA_RX_IRQ_MASK(stream_id));
+			break;
+		case ACP_SDW1:
+			sdw_data->acp70_sdw1_dma_stream[stream_id] = substream;
+			acp_ext_intr_cntl_reg = ACP_EXTERNAL_INTR_CNTL1;
+			water_mark_size_reg = acp70_sdw1_dma_reg[stream_id].water_mark_size_reg;
+			if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+				irq_mask = BIT(ACP70_SDW1_DMA_TX_IRQ_MASK(stream_id));
+			else
+				irq_mask = BIT(ACP70_SDW1_DMA_RX_IRQ_MASK(stream_id));
+
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -335,6 +448,21 @@ static u64 acp63_sdw_get_byte_count(struct acp_sdw_dma_stream *stream, void __io
 			goto POINTER_RETURN_BYTES;
 		}
 		break;
+	case ACP70_PCI_REV:
+	case ACP71_PCI_REV:
+		switch (stream->instance) {
+		case ACP_SDW0:
+			pos_low_reg = acp70_sdw0_dma_reg[stream->stream_id].pos_low_reg;
+			pos_high_reg = acp70_sdw0_dma_reg[stream->stream_id].pos_high_reg;
+			break;
+		case ACP_SDW1:
+			pos_low_reg = acp70_sdw1_dma_reg[stream->stream_id].pos_low_reg;
+			pos_high_reg = acp70_sdw1_dma_reg[stream->stream_id].pos_high_reg;
+			break;
+		default:
+			goto POINTER_RETURN_BYTES;
+		}
+		break;
 	default:
 		goto POINTER_RETURN_BYTES;
 	}
@@ -398,6 +526,19 @@ static int acp63_sdw_dma_close(struct snd_soc_component *component,
 			return -EINVAL;
 		}
 		break;
+	case ACP70_PCI_REV:
+	case ACP71_PCI_REV:
+		switch (stream->instance) {
+		case ACP_SDW0:
+			sdw_data->acp70_sdw0_dma_stream[stream->stream_id] = NULL;
+			break;
+		case ACP_SDW1:
+			sdw_data->acp70_sdw1_dma_stream[stream->stream_id] = NULL;
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -430,6 +571,19 @@ static int acp63_sdw_dma_enable(struct snd_pcm_substream *substream,
 			return -EINVAL;
 		}
 		break;
+	case ACP70_PCI_REV:
+	case ACP71_PCI_REV:
+		switch (stream->instance) {
+		case ACP_SDW0:
+			sdw_dma_en_reg = acp70_sdw0_dma_enable_reg[stream_id];
+			break;
+		case ACP_SDW1:
+			sdw_dma_en_reg = acp70_sdw1_dma_enable_reg[stream_id];
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.34.1

