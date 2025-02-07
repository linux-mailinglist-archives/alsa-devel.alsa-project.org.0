Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B95EA2BB98
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:36:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FDCB6027C;
	Fri,  7 Feb 2025 07:36:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FDCB6027C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738910205;
	bh=XvW7tQkxCfuBCH74QjqUQhH8LlOfRy5BQ7RLZ9UtxB4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EHpcRDwYSxWsHgZFyAOY4b6uwwBk5/sVWOwi8ZN7xlyLcYquBRt+69kWmd5fwNu5P
	 q5WhCtqroVUK1KLe+NUZ4i1D/zSheTWnWFfZj4Uoqn6pjq/xJz9L9X8s6fE0p1XGQf
	 nVe8u9+DboVtaMClVnFQ7H9QlagFdS7Olb7XXhZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77696F8067E; Fri,  7 Feb 2025 07:30:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1139DF89772;
	Fri,  7 Feb 2025 07:30:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1517F8067F; Fri,  7 Feb 2025 07:30:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::607])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC017F8065E
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:30:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC017F8065E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=TyvpMSoJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZKBZ6rf4dNhb0600oXfdknBWJtlm2qBMTGKeGrl5tUv/WXiJdkAjIK6e0DZnc/X65RtKIvjb5m6vSR2P3g1T5h/ZQqpYjS3n5n+lnBkdKjRPkdPmhGxgyl6o/LVD+3Odo4AWyqrQU+fsxwWDsJ8+GfNDYJduOK8ozJxYSAXzFPzNFsmDW57BCEq1zEL+slJqkIJfu7hXu0/nNCZqSoGIPxZQZs31zVVUSEkdp8qB444c/Nggh/UlNEMDKw2Wl06uNNNkB8+F4+5sjhTcDuqtgcx/30A3eaDQOhaCE2xtPZUB2pBBsWFzPR3JHrKqYxtGspiIU1oNi8kd9bjPfn08g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLjkj9S6yxnbSRqJYDjwdgIbZTMo5Nr3ixnZYGFgK9U=;
 b=qvm3+B9iTnykzL1ft5sQSNMb3R9SYX//Ep/NFeIlcdaEDO4V7IfLhO1diWELvpZ17Y1a6pgW99fSlSfsEB4BzM/uCm+IMJTEEvilo61/Q0FH4M6X3kebaODfvqUkLNSxfRkDZsRP2zRw3Oxw3+hBGzrcmlvUo03VwBLnXs7RBQdDppIr6H3ro69fX/JFpt8T2J9S4z+Etd+vt2/gLmWWAteRP+RB0v5DNZh263nm/pr5Q9mpxrRynZqp7Yx9bw0+dshxHF9Tvwxy9U6uBpD9XxAFFhb0Fpn8sKUImyalFGUGNaMTNfIqhyKN/6EQ5TRLAzV4MTfLFy9XI9cmd5yHHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLjkj9S6yxnbSRqJYDjwdgIbZTMo5Nr3ixnZYGFgK9U=;
 b=TyvpMSoJGxXutSVBJUaNJRo2p9PNdEduzcnCVHBXM+yEjGkenqavJRx8CFTEamwwr59UaWUhUhBZ0zw8M//3wmK1aJtpCmZ7+ZHYnwKQBs1V5YCDi47wQDPgG6pWueTxJ94eKqFKktLslBsAQQviHOUayo4LQ92S/VtxBav+cgU=
Received: from PH7P223CA0005.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::7)
 by DS7PR12MB8232.namprd12.prod.outlook.com (2603:10b6:8:e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 06:30:43 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:510:338:cafe::6c) by PH7P223CA0005.outlook.office365.com
 (2603:10b6:510:338::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Fri,
 7 Feb 2025 06:30:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Fri, 7 Feb 2025 06:30:43 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:30:38 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 25/25] ASoC: amd: amd_sdw: Add quirks for Dell SKU's
Date: Fri, 7 Feb 2025 11:58:19 +0530
Message-ID: <20250207062819.1527184-26-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|DS7PR12MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: e88505ee-862f-4778-722d-08dd4740f2d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?u/gXDP8VSAF+hjoPj2pLhoOaZPu1elnihExDn+1o9dYPxh44hoth+6a0efuP?=
 =?us-ascii?Q?uOdAeOfjWcnTwI8gvzSwblm7Ne2piDaG7Iskmd/dXmCoV+zChaSMlgg3ExHZ?=
 =?us-ascii?Q?KU9FQlFuwe8cm5sBrAUo4MHZB59u3EQokCmF8/JVQkAr4jv7vtsotSkDbIWS?=
 =?us-ascii?Q?1oJJnDU4h59Ug1JIwnwYg7nwXRkk5l+oA2BjtrWIGiYJ6lFISshBPfgopqcw?=
 =?us-ascii?Q?tvyA5Uh4ubE9YnlrivZE/7XXssmnxZqV97EquEiAyb0kStDd7to9/RAh61vk?=
 =?us-ascii?Q?RQIjTB+F5OLgf6/ZsRwhFnaSH/bC+fjXPlXKC4RUXSgl3QbdcVY1UM+YMfLt?=
 =?us-ascii?Q?7U5OYrWSkoDQ1xhIwfJLC9l44n1mZMdzAd2WDQTjofDloDb2x91V+k7vqVyc?=
 =?us-ascii?Q?NLQYAmdYS8Hnkq4A4mmcZziJjD6UPERre0XkNbesBiLfM7mChHaYWpyLJdTZ?=
 =?us-ascii?Q?qlofgYfxdoPm42R1fAIn8G3w0wQO03fPLy1M166MuxycNE1bHHbjn0CZyYto?=
 =?us-ascii?Q?ijUBFVKdyQm4vj3RYIMn+L2UIGTV6z6pi2GGQEI7LNWAjZaEVc8tm6Qn8PFV?=
 =?us-ascii?Q?z8a54/BEj2bSQYncNCHwSfcIwSPDwce02fNCbW4DF/baiKLpyNRhWvJkDHnM?=
 =?us-ascii?Q?/3DQBqFKNL0NrVKiDA+hfu1icXSEYuo1E2OVr6SPBXj4pgX1KuEKb0HdKvhU?=
 =?us-ascii?Q?G0ISNz5HQydvAgF/g9ZgBxBODvA/VEB2TPkBrohEVrOgbqv/p5w+OYiXnTlZ?=
 =?us-ascii?Q?B/ey9CbVMkYKmHPh4sXFIKbD4zkvXxVKzj98/+R42tGFinav8xyESrJ0QKum?=
 =?us-ascii?Q?YDilxUM3vai9FPNL91TVlA84YD1/rNS9XDlsYeu2F+92Pcfg9WxnJl1PV8Ja?=
 =?us-ascii?Q?DqgYPTPNU5xAOagbOC8PUqBm7cUNAL/u17OJ5+koa+kO9CAU2YfWS0Bsv/NS?=
 =?us-ascii?Q?uwVf90x7YB/4mvO795fDpUI6tyxx3IRncTiosAhm44IZhAVCZGRrLZPxRF9W?=
 =?us-ascii?Q?KZzktQ837eoqCQjhqaezHDEnS9VfjVd1RK6yy6DLhE4AhqaHzm4f0Bm89bMC?=
 =?us-ascii?Q?P7YRh6vURnEV55pSnVHo3vXirdHFRC66JjAZ+f8GxdDq6RUqbhX0jjZgXrmy?=
 =?us-ascii?Q?ffd0dJiR1mffiYePYctb1nBf5SXdOiH5YG2J7YwMMa3YqvSHf/Y59E8KubGw?=
 =?us-ascii?Q?/i2n69NSaCe/5cfPtOCgQdkZRbfIYrNvZD1ONF2AUROHHqo2saFc/vTYubJc?=
 =?us-ascii?Q?MaxMwfZfCcHKMLRVQOcbOk6bILoF72yrISWSkGqzbXNqio97DnQhNMcFTwIY?=
 =?us-ascii?Q?sLBtHlW8T4p6z4DVsnB7CVYcMRbA+rytbaKvruw53IP85Bs6Y+T1CBmhtt1n?=
 =?us-ascii?Q?0zool+lswYlzLE2djgpU6SMV7+BoZXllakcmP9ooPvlmyxBRv9ZXWZJDck0T?=
 =?us-ascii?Q?93UG4mRzVBQfWdPvRM+ag4eFe0peqFta0sfnOY7AX1ttpyM0UXCWAcIFOrJn?=
 =?us-ascii?Q?QSGpNp/Ws04lo0U=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:30:43.2469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e88505ee-862f-4778-722d-08dd4740f2d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8232
Message-ID-Hash: 7QVEIKCSNJL7EEH3TMVILLYPVTJCIWTO
X-Message-ID-Hash: 7QVEIKCSNJL7EEH3TMVILLYPVTJCIWTO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7QVEIKCSNJL7EEH3TMVILLYPVTJCIWTO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds a quirk to include the codec amplifier function for Dell
SKU's listed in quirk table.

Note: In these SKU's, the RT722 codec amplifier is excluded, and an
external amplifier is used instead.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-sdw-legacy-mach.c | 34 +++++++++++++++++++++++++
 sound/soc/amd/acp/soc_amd_sdw_common.h  |  1 +
 2 files changed, 35 insertions(+)

diff --git a/sound/soc/amd/acp/acp-sdw-legacy-mach.c b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
index 00aeea70f04e..2020c5cfb3d5 100644
--- a/sound/soc/amd/acp/acp-sdw-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-legacy-mach.c
@@ -28,6 +28,8 @@ static void log_quirks(struct device *dev)
 			SOC_JACK_JDSRC(soc_sdw_quirk));
 	if (soc_sdw_quirk & ASOC_SDW_ACP_DMIC)
 		dev_dbg(dev, "quirk SOC_SDW_ACP_DMIC enabled\n");
+	if (soc_sdw_quirk & ASOC_SDW_CODEC_SPKR)
+		dev_dbg(dev, "quirk ASOC_SDW_CODEC_SPKR enabled\n");
 }
 
 static int soc_sdw_quirk_cb(const struct dmi_system_id *id)
@@ -45,6 +47,38 @@ static const struct dmi_system_id soc_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)RT711_JD2,
 	},
+	{
+		.callback = soc_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0D80"),
+		},
+		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = soc_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0D81"),
+		},
+		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = soc_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0D82"),
+		},
+		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+	},
+	{
+		.callback = soc_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0D83"),
+		},
+		.driver_data = (void *)(ASOC_SDW_CODEC_SPKR),
+	},
 	{}
 };
 
diff --git a/sound/soc/amd/acp/soc_amd_sdw_common.h b/sound/soc/amd/acp/soc_amd_sdw_common.h
index 9bedccfe25a9..1f24e0e06487 100644
--- a/sound/soc/amd/acp/soc_amd_sdw_common.h
+++ b/sound/soc/amd/acp/soc_amd_sdw_common.h
@@ -24,6 +24,7 @@
 #define SOC_JACK_JDSRC(quirk)		((quirk) & GENMASK(3, 0))
 #define ASOC_SDW_FOUR_SPK		BIT(4)
 #define ASOC_SDW_ACP_DMIC		BIT(5)
+#define ASOC_SDW_CODEC_SPKR		BIT(15)
 
 #define AMD_SDW0	0
 #define AMD_SDW1	1
-- 
2.34.1

