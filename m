Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F17AE2878
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Jun 2025 12:00:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5C25601EF;
	Sat, 21 Jun 2025 12:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5C25601EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750500021;
	bh=d3oH/jm0hVley4rBqx0hTJxM90/Au7C4bLJz2I2Gozw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ebRbye8znCF5A2t6oE/jQVD4DuslHsQCuKqTUlNWU7PGhp/UgP5tNQGw8xJCD0efT
	 d4bcmXR38GvIlsk1JbnykSVkURWouhnyzmr3DYhL2P9T/nCrOGfnYa5Uh2O0p1dZVa
	 rvkxYHG6q00loUk2oJejUkW/bVck794qiUyxv4kc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 522FBF805C6; Sat, 21 Jun 2025 11:50:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37EC2F805BA;
	Sat, 21 Jun 2025 11:50:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55BF4F8025A; Sat, 21 Jun 2025 11:50:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::604])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5710F800D0
	for <alsa-devel@alsa-project.org>; Sat, 21 Jun 2025 11:50:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5710F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=SBMQWhnp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yc8404Jq/l6nRSZRj7R8FAACFcX/W2QAAKIT/uuMD49mvSZucZPS5cFMbhAjyh0d35PsJT55yC+c0r/oPyTa7QT6E89T/np42sfdIlMUNe/awvxYJCnow5032rfzcZxH4MlkXWnZXpqpRRq71hxzkcGfU6tg37E2YZLJrdySDvLKp7fWq+TaM3jCFw2H3C/UyL7kDRzYaBTy8pkQQk+R4g676cF5Wansv+33Y3MLs60YxJWFC+QwOXOQw32/h7cc2GG/hR5IxtvFR59br+ML7dcYR72ncSybOSYFRQjHskXjih1wl29P13MwOGj6DUZ7e9xGGjD2fThXvm2M0f12Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aiKXv+BWPK812kC9y//HntNm4rrxvyo6Lw9cyPny2Q=;
 b=Jx0sC2A0qNR7q/nEjBxlfilo90AFhQLz+1N2qzOMcr1Qhoum6fkTZ7CrpuE7/ixCR24KVp/Pz2t+VFPZAyrD4UDsAYMkqkPIjJitCLw5iOCTfOjjnuRTuUb81urlfMzR0Q8G3QhQ4oOod3cY8qT6kv0zVheYT70Oh4bzkPYSDKUszWfWpPsaNVJA6IwJrxZHIc3Ewg+mX4+YZ/Wn3TZfO3KHkqf2LS/yYFXAXwe0oWJ70AWNV5y04RZ6dDilFWiNPlCvBCOq2SnS5fTXSso8KXm/EFNEasd/7HrihPlRRL2f17WasC7VYg0miaRQqoirA0Ywh+YXRkpSu7i+ZBsXJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+aiKXv+BWPK812kC9y//HntNm4rrxvyo6Lw9cyPny2Q=;
 b=SBMQWhnpYFFqye8SS5BMxAeljstkMWplZLG04orRp5fffU+Zhpg87/RZyz5foj5WGbsgQ7xvp8/hadSBW1HP/CcFF/mB4SSb45c3I+Ux9wUFnPvQRYkNVp/6ymg9Zlmprtt6DPu5Jq05B9DEp0Qnxe9wCqt0DzRnkBN4TsxoIJU=
Received: from SJ0PR03CA0367.namprd03.prod.outlook.com (2603:10b6:a03:3a1::12)
 by BL3PR12MB6643.namprd12.prod.outlook.com (2603:10b6:208:38f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Sat, 21 Jun
 2025 09:50:20 +0000
Received: from SJ1PEPF00002317.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::18) by SJ0PR03CA0367.outlook.office365.com
 (2603:10b6:a03:3a1::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.27 via Frontend Transport; Sat,
 21 Jun 2025 09:50:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002317.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Sat, 21 Jun 2025 09:50:20 +0000
Received: from vijendar-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 21 Jun
 2025 04:50:16 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH] ASoC: amd: ps: fix for soundwire failures during hibernation
 exit sequence
Date: Sat, 21 Jun 2025 15:17:34 +0530
Message-ID: <20250621095002.1336167-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002317:EE_|BL3PR12MB6643:EE_
X-MS-Office365-Filtering-Correlation-Id: 85143ffb-33fe-47c5-2b71-08ddb0a9090a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6p5xWJ5h8oQfl1o3wwo6ssYA2k7n0g1tm7eJZKGmbHyQOzSzeqeKzpU/iyja?=
 =?us-ascii?Q?F37+492QBRgE7z7S5w1QNWMfFy601TN0A/QtZUSW76y5i+0G5zx++Ls+Sy2t?=
 =?us-ascii?Q?p6bkf3De1R9XNI0TTFmBhYLGmm1m1YEnITOhCCC//kyIT6vL+HGD1hHzB3jK?=
 =?us-ascii?Q?NnNxNPFjRZaHe0PUMVmbi3H5EPQX30/Nk+sRhXx1pQQAhKaBCT51HEZfBnJR?=
 =?us-ascii?Q?aKwa9XkKY7U3yKUYdmpOqpVkuvSBqKVzb3m5rcKGwkYGuT9/g9Sud5i9zB6T?=
 =?us-ascii?Q?j60/M3HMn7crfFhwithS9SccuScY7m6eOpoac2gGK5vcG6QRGqxTmbosYVkX?=
 =?us-ascii?Q?YSTU6D2njjophywWU/kpiHF6mQEmJRDjFRUG3CnaclHOS/rDtaMr1bZ/3l3a?=
 =?us-ascii?Q?csmbafei5Vyhj7/0aAg3ToUTUN8/+OGETldggfBoRWDLhemaiw24KJxekVf1?=
 =?us-ascii?Q?iOSK4pcmIXdASk0Ac/o4HXT7SbQeD8dLbHgf7ZfRxCIT8wMeKxpnuc/eyqhb?=
 =?us-ascii?Q?zF46T7UQ5JVdzrA0hW6PhWSipWD8c2Acn8mJPffF/DFQANqLzXFPFNdfyfF9?=
 =?us-ascii?Q?tTsknV5wFIhyyJMXF5jmiVirD7VQxJycVYe8NdniZeJnb50kEpzqU4oFDRCM?=
 =?us-ascii?Q?hwVfGZQrCN84GleE814efQyhoNfG+gI9iAfDNF2ouB2BWVMbD1BTA6U6cMqJ?=
 =?us-ascii?Q?6262RaPvIRCyK7br5iqMV6pEhPyxpzHTSz4MKSFLyz3Wl4YXKOTpNNPILesa?=
 =?us-ascii?Q?wN5YzHfaPdJpEuKBiW+tOVYl/8I0wSDALdQt+cStzjVHbQzzFDm5Kqsiru83?=
 =?us-ascii?Q?aqp/ELy07+bUiLELfKf609fgZ+RuafumiRRzCFN8Cyy50QbqIsRRrobZaRjT?=
 =?us-ascii?Q?R1VheFFb3ok1yyS8z1EXo8OkMAqVamCOpelGC5lQFaaS6+GGNTWPNiXNm+3I?=
 =?us-ascii?Q?A3NR30jBPVxbryo1qrC1XDbEYEbeUg0VYPZr1QPXx9Eid5gRFN0jIPVJPLXD?=
 =?us-ascii?Q?/xnbzEGkpjjCPY9sY0IB8pXhUGtpayC39x24//PJ16uB6BoCaWZ0U9vwoeoz?=
 =?us-ascii?Q?/yrQllcKfud6Pdh8ro+4JSM6VYSH7aQw0eWfLSUlhJeOl7bTc9fYBXVeYdG/?=
 =?us-ascii?Q?fTO8n5KFX9gn81SEg/eMoubfwtvF0TmxRTADcRxKR9s+g40eHYBWJXYZ+7di?=
 =?us-ascii?Q?B9cEB/EuuIH2tSjvfpcVQsokPrOMCv+DUA78Ilu6T545UkSxMfrFEDEBclYd?=
 =?us-ascii?Q?HeOUp+Ddjx+cN2tCy3KwZAoO0QaHFmvf/Xg4ZYivtKH2N9m7ywgwWyllVDzn?=
 =?us-ascii?Q?fZ3yPij+m0rMO6SGd7fDx4RtNaHsuOE0rOf1xyGFJNRdD5QPz8hMx5wtgfqq?=
 =?us-ascii?Q?NahOk/sYzYHyreSPQHQS9bckb/LA5zZ4wM4zZMA+IS9LMnTZUDkYi/4SPm+v?=
 =?us-ascii?Q?Bren9QzRIgxcBuRpqrYYnjBV+uWWRhMzb3WjZSX+cAodJKP4Q1X4q0E33IMe?=
 =?us-ascii?Q?yF65wNjc5+1DKwewcJb1ou3tQUyl6bFjkiAo?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 09:50:20.2763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 85143ffb-33fe-47c5-2b71-08ddb0a9090a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002317.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6643
Message-ID-Hash: XBID3TEXIB2FPXEUIJFNBIZUWVOZAN4I
X-Message-ID-Hash: XBID3TEXIB2FPXEUIJFNBIZUWVOZAN4I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XBID3TEXIB2FPXEUIJFNBIZUWVOZAN4I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

During the hibernate entry sequence, ACP registers will be reset to
default values and acp ip will be completely powered off including acp
SoundWire pads. During resume sequence, if acp SoundWire pad keeper enable
register is not restored along with pad pulldown control register value,
then SoundWire manager links won't be powered on correctly results in
peripheral register access failures and completely audio function is
broken.

Add code to store the acp SoundWire pad keeper enable register and acp pad
pulldown ctrl register values before entering into suspend state and
restore the register values during resume sequence based on condition check
for acp SoundWire pad keeper enable register for ACP6.3, ACP7.0 & ACP7.1
platforms.

Fixes: 491628388005 ("ASoC: amd: ps: add callback functions for acp pci driver pm ops")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h     |  5 +++++
 sound/soc/amd/ps/ps-common.c | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 85feae45c44c..babf2fa7ea27 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -82,6 +82,7 @@
 #define ACP63_SDW0_DMA_MAX_STREAMS	6
 #define ACP63_SDW1_DMA_MAX_STREAMS	2
 #define ACP63_P1_AUDIO_TX_THRESHOLD	6
+#define ACP_SW_PAD_KEEPER_EN		0x0001454
 
 /*
  * Below entries describes SDW0 instance DMA stream id and DMA irq bit mapping
@@ -334,6 +335,8 @@ struct acp_hw_ops {
  * @addr: pci ioremap address
  * @reg_range: ACP reigister range
  * @acp_rev: ACP PCI revision id
+ * @acp_sw_pad_keeper_en: store acp SoundWire pad keeper enable register value
+ * @acp_pad_pulldown_ctrl: store acp pad pulldown control register value
  * @acp63_sdw0-dma_intr_stat: DMA interrupt status array for ACP6.3 platform SoundWire
  * manager-SW0 instance
  * @acp63_sdw_dma_intr_stat: DMA interrupt status array for ACP6.3 platform SoundWire
@@ -367,6 +370,8 @@ struct acp63_dev_data {
 	u32 addr;
 	u32 reg_range;
 	u32 acp_rev;
+	u32 acp_sw_pad_keeper_en;
+	u32 acp_pad_pulldown_ctrl;
 	u16 acp63_sdw0_dma_intr_stat[ACP63_SDW0_DMA_MAX_STREAMS];
 	u16 acp63_sdw1_dma_intr_stat[ACP63_SDW1_DMA_MAX_STREAMS];
 	u16 acp70_sdw0_dma_intr_stat[ACP70_SDW0_DMA_MAX_STREAMS];
diff --git a/sound/soc/amd/ps/ps-common.c b/sound/soc/amd/ps/ps-common.c
index 1c89fb5fe1da..f18d2a0d83aa 100644
--- a/sound/soc/amd/ps/ps-common.c
+++ b/sound/soc/amd/ps/ps-common.c
@@ -160,6 +160,8 @@ static int __maybe_unused snd_acp63_suspend(struct device *dev)
 
 	adata = dev_get_drvdata(dev);
 	if (adata->is_sdw_dev) {
+		adata->acp_sw_pad_keeper_en = readl(adata->acp63_base + ACP_SW_PAD_KEEPER_EN);
+		adata->acp_pad_pulldown_ctrl = readl(adata->acp63_base + ACP_PAD_PULLDOWN_CTRL);
 		adata->sdw_en_stat = check_acp_sdw_enable_status(adata);
 		if (adata->sdw_en_stat) {
 			writel(1, adata->acp63_base + ACP_ZSC_DSP_CTRL);
@@ -197,6 +199,7 @@ static int __maybe_unused snd_acp63_runtime_resume(struct device *dev)
 static int __maybe_unused snd_acp63_resume(struct device *dev)
 {
 	struct acp63_dev_data *adata;
+	u32 acp_sw_pad_keeper_en;
 	int ret;
 
 	adata = dev_get_drvdata(dev);
@@ -209,6 +212,12 @@ static int __maybe_unused snd_acp63_resume(struct device *dev)
 	if (ret)
 		dev_err(dev, "ACP init failed\n");
 
+	acp_sw_pad_keeper_en = readl(adata->acp63_base + ACP_SW_PAD_KEEPER_EN);
+	dev_dbg(dev, "ACP_SW_PAD_KEEPER_EN:0x%x\n", acp_sw_pad_keeper_en);
+	if (!acp_sw_pad_keeper_en) {
+		writel(adata->acp_sw_pad_keeper_en, adata->acp63_base + ACP_SW_PAD_KEEPER_EN);
+		writel(adata->acp_pad_pulldown_ctrl, adata->acp63_base + ACP_PAD_PULLDOWN_CTRL);
+	}
 	return ret;
 }
 
@@ -408,6 +417,8 @@ static int __maybe_unused snd_acp70_suspend(struct device *dev)
 
 	adata = dev_get_drvdata(dev);
 	if (adata->is_sdw_dev) {
+		adata->acp_sw_pad_keeper_en = readl(adata->acp63_base + ACP_SW0_PAD_KEEPER_EN);
+		adata->acp_pad_pulldown_ctrl = readl(adata->acp63_base + ACP_PAD_PULLDOWN_CTRL);
 		adata->sdw_en_stat = check_acp_sdw_enable_status(adata);
 		if (adata->sdw_en_stat) {
 			writel(1, adata->acp63_base + ACP_ZSC_DSP_CTRL);
@@ -445,6 +456,7 @@ static int __maybe_unused snd_acp70_runtime_resume(struct device *dev)
 static int __maybe_unused snd_acp70_resume(struct device *dev)
 {
 	struct acp63_dev_data *adata;
+	u32 acp_sw_pad_keeper_en;
 	int ret;
 
 	adata = dev_get_drvdata(dev);
@@ -459,6 +471,12 @@ static int __maybe_unused snd_acp70_resume(struct device *dev)
 	if (ret)
 		dev_err(dev, "ACP init failed\n");
 
+	acp_sw_pad_keeper_en = readl(adata->acp63_base + ACP_SW_PAD_KEEPER_EN);
+	dev_dbg(dev, "ACP_SW_PAD_KEEPER_EN:0x%x\n", acp_sw_pad_keeper_en);
+	if (!acp_sw_pad_keeper_en) {
+		writel(adata->acp_sw_pad_keeper_en, adata->acp63_base + ACP_SW0_PAD_KEEPER_EN);
+		writel(adata->acp_pad_pulldown_ctrl, adata->acp63_base + ACP_PAD_PULLDOWN_CTRL);
+	}
 	return ret;
 }
 
-- 
2.45.2

