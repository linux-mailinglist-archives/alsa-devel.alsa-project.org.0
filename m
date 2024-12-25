Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0FC9FC3FB
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Dec 2024 08:26:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B886602B3;
	Wed, 25 Dec 2024 08:26:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B886602B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735111603;
	bh=OOdXyhMkqgScgDpHVSpCwuWzGddqnAvvJL/f7v8aA2M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C1MY4rmT1LYg9xC4Sog82lVR/ulqkeVYytNRUIxoxky2TmZ7L3Y9GAmb0a90GGUXD
	 xJTP70XTJ/6q5RwlpF/1u3W7YQex7slnyFZSDd6NnfYfiwAeLfRu5r11aI9P/HRLFk
	 MVHsN+016VwUCpycpLoVJjzoqU9zA22jBotb1dWg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 687EAF80697; Wed, 25 Dec 2024 08:24:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6412F80694;
	Wed, 25 Dec 2024 08:24:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C7F1F80621; Wed, 25 Dec 2024 08:24:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::604])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DAABDF805EB
	for <alsa-devel@alsa-project.org>; Wed, 25 Dec 2024 08:24:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAABDF805EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=L0uSTFap
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q939F3LQascPqgVlI6gyW5KsOCAWMiVW1zKnleB7kEHlqimFsYLA79jp3CQsx4vxWdUBb/asN9PtHFywLEIn/2f3xifG/qKZ4PGv0fuLzvYi4N+sYPMY0ehzwHe/fjffoQU6MAsNAbFP4H+9SaK83NOMZmDI14YEoX6T/nT/hTD8dIadfWxvWavtM55RIHddKoXTMJnrmvstQ2BMjX9zXMRHLyi2S3U16tRTRLXD1faxrN1kA5ADw5rY4ysxzWYo75Mfqcey85Halm20THL/l7ZWlb+OGFrLn0IUN31npwiMaGt553HHALH3kUgywt3+Vmxn+awftJpYpGh6C60vvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=waGrjmuNGIXeE5ThG6mUrYD42PwNTenpevEuZb6f5fo=;
 b=q7xq1jv/A/gp9b5SNFBrlPCtZHB0wlUj5T53O6hIX/RX7Hse7MlL8A5Lo2rThco3RexzLgbNtLrA8VQacRFas3K5Fri+36ZzAROcSgvT5Yj0B5AXROTEej3QDA/J3wBUM9tdpWXjV+JNEuRKjF0oKiKvNHvcSd/ksCduv+Dfw2tjOVBbAK6uKMpNj0EhBgBN20yu9HQgVKAEsSamLcOZtZ0XiLXo89ygj8AfyguDFdUu3hMKf6UrqylJpyDW7FWvBJYgNe8opPGvs5jV1azyYBXN6YYAYurL/UODp3dXyirxktup2sBxFwp6EDJR6cYP/Je89U8r34cGtVG8HCsP1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=waGrjmuNGIXeE5ThG6mUrYD42PwNTenpevEuZb6f5fo=;
 b=L0uSTFap/YC7y356XgiGfMBXL1K7q88ZRUCujo+803IoN4c/DCneLcLH2F7Jq5cQWNPOT14Y1X1VwNgreP8xkk/HbwlQB3dYpn1Fbs159pXkvnZveZ90OuCKhsJOtsf7vmeAseaS9l6clFOOOiVW5qyY3o2XF7upYmpXW0970iU=
Received: from PH7PR17CA0022.namprd17.prod.outlook.com (2603:10b6:510:324::7)
 by SJ1PR12MB6268.namprd12.prod.outlook.com (2603:10b6:a03:455::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Wed, 25 Dec
 2024 07:24:34 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:510:324:cafe::40) by PH7PR17CA0022.outlook.office365.com
 (2603:10b6:510:324::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.13 via Frontend Transport; Wed,
 25 Dec 2024 07:24:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Wed, 25 Dec 2024 07:24:33 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 25 Dec 2024 01:24:29 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<sanyog.r.kale@intel.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 5/5] soundwire: amd: clear soundwire pme wake status
Date: Wed, 25 Dec 2024 12:54:00 +0530
Message-ID: <20241225072400.912445-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241225072400.912445-1-Vijendar.Mukunda@amd.com>
References: <20241225072400.912445-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|SJ1PR12MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 908fcd25-cfed-4025-4c23-08dd24b52e3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XqVexGUYHvca/ADAQKtZSA3hxK7/MGeTP4Bru54y7gnzdFjMAfgd8FgFPVSI?=
 =?us-ascii?Q?xFV0Gjrm6y5gPVRQncvC3oVLHAEU0zCv7S8b5LFrU/8ZiQ2aCiEpXu87GZyQ?=
 =?us-ascii?Q?QPXp8hQNzFUEJ60b6oj9LKW/266WTNA4HtHXUug4bMUvgFX3qwOP0HXbW9pG?=
 =?us-ascii?Q?9mSBgO7ZbXlR5mDEUdTVlSWBN+1Djc6MYv5JhiV2k0n7ZJjgGkK3PVIx+7Re?=
 =?us-ascii?Q?qyZ7jsPRpcCu5zUdCVKWzCL+Vo+ZpN/FPS70Wg94+fpcD0U8dGKpcqNuFsoy?=
 =?us-ascii?Q?39SzEZRd+zTNwhLKcUiGUk7sFI7cURPtPojRRP4kWVwwNzACX75F0S6G/26v?=
 =?us-ascii?Q?/OuDYWb16Y9MUZc2/VHsdrVw9/LmUkdpy6uwE0xACfbbv4vHyWomHXJlLWCQ?=
 =?us-ascii?Q?SVPYXTLsXvUVGEW6gmqXKT6aV/GQmmh/9tWQ2v5E+3+t+LtH54NGYvtxTATk?=
 =?us-ascii?Q?KkbSSZpbeSaVB2ckpfmRQQEB+BxNMMJje+9xdi95BMI5GcXThF39M6Fpjnq/?=
 =?us-ascii?Q?/5egLqsxOvGsmpblCIaNHDjvL79z7PGOJ7oQR9CXA95qgQEFUSg4VzkSqieW?=
 =?us-ascii?Q?VKAC0E5iep+csf/ccNVDZkWHq9uqmwGTnCB9QSJ4GpDWO0OZG9Tx1zRJKCRr?=
 =?us-ascii?Q?2y/4+kwYDihJScBOAas7gcQk9cPwBIz1xZ3/i7bQZWIR+jYbiXjk/F+unKsW?=
 =?us-ascii?Q?pyxBOShOLVTSbdgS7aLFeKOl6D2U9B6NqTlCVJMH6S8xD7dsTFOBZzEfFdsS?=
 =?us-ascii?Q?AX3iSB+j3bgCQCHmyREXVHtppWsm9RXjXrmv77434vG8VUjauw/e167R6bzc?=
 =?us-ascii?Q?Wp6qo+YUkJtXm567FEDIG54JhfpDAIIj21ucxIEqspgBL6ccysSHk1xik9p/?=
 =?us-ascii?Q?gs8x+kH25eZhT6KgFqKB5o44NOsVKE6fgojAi1sy1PE0orCJaQZZ1WiE4Cgm?=
 =?us-ascii?Q?eA+DbxD8DM3MyvCgXnETnncYs5r/wbfK3KR8p9WBg7xX4M1NBYDZIPxXNnMl?=
 =?us-ascii?Q?IlFMg8ESKt5qIyfheDkOUj1VwYZXAlC88yHp3qaXFxMCMM7H6puBq6NliU/7?=
 =?us-ascii?Q?f2qTWg7clHuZFYwoR8B218UWX4tkx3VlVtA6VyAIGIADshPwQSJVo8BR5JiM?=
 =?us-ascii?Q?5P4nAH234nbI/UX7fhUYfq61DH7y1jwb/esNUXvefi1UyqX3E91y6D/qU4cJ?=
 =?us-ascii?Q?E0S7zLXeCv6gkPvkcgN2rwiGP2gX02iaDJUQwniUEKLUpoYJ0m+KMbHCKRGY?=
 =?us-ascii?Q?Q5eh9qv9M/pBuKqupJFifag9aLgSQiUaz+taohFDfO+4pQomG4Fw/RaenLr1?=
 =?us-ascii?Q?EbXBlSXxpVoMoxVWPyUFc0y+xs1PFV6mgN+DJocTi2fA9hoE+fEjFpLHfIzM?=
 =?us-ascii?Q?p08TvXaO8XGcmPebdlrBaOaWGAUq2vT20JxxiFu/kPgrts4eBOAAMKidFAky?=
 =?us-ascii?Q?V4T5L9dkCUM8UtpbUu3JrDrMQieDEzDaeB0L6MokmGSNZ2sjJVisPw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 07:24:33.8168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 908fcd25-cfed-4025-4c23-08dd24b52e3a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6268
Message-ID-Hash: MAQAAIT5HED2SM6TPQICZFKODK7UNQTK
X-Message-ID-Hash: MAQAAIT5HED2SM6TPQICZFKODK7UNQTK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MAQAAIT5HED2SM6TPQICZFKODK7UNQTK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Clear the SoundWire PME wake status during resume sequence for
ACP7.0 & ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 33 ++++++++++++++++++++++++++++++++-
 drivers/soundwire/amd_manager.h |  2 ++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 6f9d9f765a20..8b1cb07e8aac 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1132,6 +1132,28 @@ static int amd_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
 	return 0;
 }
 
+static int amd_sdw_clear_pme_wake_status(struct amd_sdw_manager *amd_manager)
+{
+	u32 pme_stat, val;
+
+	switch (amd_manager->instance) {
+	case ACP_SDW0:
+		pme_stat = AMD_SDW0_PME_STAT;
+		break;
+	case ACP_SDW1:
+		pme_stat = AMD_SDW1_PME_STAT;
+		break;
+	default:
+		return -EINVAL;
+	}
+	val = readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_STAT(ACP_SDW1));
+	if (val & pme_stat)
+		writel(pme_stat, amd_manager->acp_mmio + ACP_EXTERNAL_INTR_STAT(ACP_SDW1));
+	val = readl(amd_manager->acp_mmio + ACP_EXTERNAL_INTR_STAT(ACP_SDW1));
+	dev_dbg(amd_manager->dev, "ACP_EXTERNAL_INTR_STAT1 : 0x%x\n", val);
+	return 0;
+}
+
 static int amd_resume_child_device(struct device *dev, void *data)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
@@ -1257,11 +1279,20 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 	}
 
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
+		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+			ret = amd_sdw_clear_pme_wake_status(amd_manager);
+			if (ret)
+				return ret;
+		}
 		return amd_sdw_clock_stop_exit(amd_manager);
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID)
+		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
 			amd_sdw_host_wake_enable(amd_manager, false);
+			ret = amd_sdw_clear_pme_wake_status(amd_manager);
+			if (ret)
+				return ret;
+		}
 		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
 		if (val) {
 			val |= AMD_SDW_CLK_RESUME_REQ;
diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
index 18faef593865..4f7e236b2e34 100644
--- a/drivers/soundwire/amd_manager.h
+++ b/drivers/soundwire/amd_manager.h
@@ -201,6 +201,8 @@
 #define AMD_SDW1_DEVICE_STATE_MASK			0xc
 #define AMD_SDW_DEVICE_STATE_D0				0
 #define AMD_SDW_DEVICE_STATE_D3				3
+#define AMD_SDW0_PME_STAT				BIT(26)
+#define AMD_SDW1_PME_STAT				BIT(27)
 
 static u32 amd_sdw_freq_tbl[AMD_SDW_MAX_FREQ_NUM] = {
 	AMD_SDW_DEFAULT_CLK_FREQ,
-- 
2.34.1

