Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC69BA16A54
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:06:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FDF260259;
	Mon, 20 Jan 2025 11:06:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FDF260259
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367599;
	bh=2DLLAcn0QGCogNDu/mz9L1jpqhgPgtko4u2oVNEFEV4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NKaUBc2bEZGW19CqNmUnXlyGe/fT7VZssbZdQ7yK2xvlwRKB4YDGMqtKndTyJw/Il
	 fZ/lisoplQILLcH0v2UdM9QAOeue1VdKQkLM5AuX64tebbu1rv7sB2Hw2NV/0521ut
	 6IsHBczwfsR9ic2EFmbG9hbSB+vjzQVFnfCrILOM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5484F806A5; Mon, 20 Jan 2025 11:04:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFA4EF806A2;
	Mon, 20 Jan 2025 11:04:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5E81F805BE; Mon, 20 Jan 2025 11:02:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::60c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7919CF805AE
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:02:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7919CF805AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=QBy/0Frs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3xvaX/+8Y3nkPfmFK5RD8l3Wk2W7JiGsoq5re4rR34KIt9uYPJIlhG67rHXtqEPWD2uDYEtEUYM7Xr7M8/qg911rVbtA9BBC65oPELvpKnmc9T/Fv1dmYBD07MZo5VASSbEWrRgAi0q+YjiBXTqycw/3X7CbJYEDx9U86KkAjNbu32O9cLSTav1hXXnU88ODy4XVBlrW4CAMPn+en5FLjk6jYV0Tgc3G5kOBvEnwT+5XTuXxY55pQXhtFEyvsFc29oY24+xSo0GLqTDl/h6DeqDQUSziCOzJD96j1w/8H+zD8Hs7lvAgA7poFWiJWESEcJZiX/+754gd3XFhMc99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7/yTQeHNtmdxnm0k1s+wffRwfi9FaOQjVYSwNos5L0=;
 b=j5oot2ZACEdUDJgK01bCkR7zc0NDTsD5CEqxHT3/BgfPauD3ywsH65pLp1GomXOW47aNUgBh78M9QJyWDBEpsiag5I2LuujZCNFV2qTIcsYYuUwPVSD9+nFcwDzP2DGW3mCGECf8xhNCd9wVZQmNy55lcW9NnuPbszGmOzAEgzIUv5XlKvbuwAXEsCdGiRCcr8BkdaiJuiblLmOonjG7sEdS3VZi/gkeFWz16KrK9o1pfndWtNkk0e2HZ4d/ZrKKm5qQnso6Ba60e4cksZ8QeFqDrkGquFw1v4xeV9EJrGq855BYwEc0HCf0jgsYVw8Xs/y0YMVrSNWFHnVVX9SAAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7/yTQeHNtmdxnm0k1s+wffRwfi9FaOQjVYSwNos5L0=;
 b=QBy/0FrsrXpH0TshDNPL50MlIxSTKqel0SU4bkncEO4vDMNbD6OKsluGiCFFtkMIs+Gt3F72IVqmH5AbB6Xu8aStj+quE0L0VRsOwQ5tW2WQpoFMfyFKg+kZ0+r9aFb/QoESMadANJ0nrs/Oa7lOTbm16VFAbCc/V15/3MMy0xw=
Received: from CH0P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::7)
 by MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 10:02:34 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:11d:cafe::1e) by CH0P221CA0029.outlook.office365.com
 (2603:10b6:610:11d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 10:02:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:02:34 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:02:30 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 14/23] ASoC: amd: acp70: add pm ops support for soundwire
 dma driver
Date: Mon, 20 Jan 2025 15:31:21 +0530
Message-ID: <20250120100130.3710412-15-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eebfcdb-bc42-4742-0a6d-08dd39398ffd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9fHp67jDIgB1ZxheZr4HB/Xep6cqX53kNM1rgl8s9Zo98u46deljMquUH3Ap?=
 =?us-ascii?Q?D5a8Fwc5GdgJFU/RMMlpDVbKQQDY+DR7Gz5ooKbskX9Zh+7HZK5fEM7ftV+3?=
 =?us-ascii?Q?DBNuCygODsPpmc/NwUHW69EriQIOditAmFnSMqNRMBKY5Oj4w+zPEesxU6sC?=
 =?us-ascii?Q?2adapx5/TA2JDBpVCN8jGqY7qGCMFrR8U4i+hgPATDQRGNMJwpjokTGR8e2z?=
 =?us-ascii?Q?z6l3ZlO/ABjhgmxtrCDG4POUdyKaLoxDX+HIjHaGT8wK7wi2Q5MTY22Uw+ZV?=
 =?us-ascii?Q?C2vu1Pax6Z9xYVx9Ne2hQiDqSkVwkR/pUAyEFe9FEOkS2/hgyBozuTX93/o7?=
 =?us-ascii?Q?VHIctIX+uDFdCul0pALmQuvuvUm0J9+OLv0zQYRzdhRtIDwDEHGXYebPj8is?=
 =?us-ascii?Q?VRpDxuDX0ZLXqnMoBpkdbP+J/85rfupG9fSMrO+0qFfwMTKSjOwL46iF1j2a?=
 =?us-ascii?Q?odMZcZBH4ooEfckiwmK8JX6XOJ2bR16eQiBR2PSDFd9jEzMTxrQ/HxhzVR2n?=
 =?us-ascii?Q?9A6/J/w6E0stO69qYivwJCxQq/MdQ1NU6eZJTO/Ec7t0dsEN1fy3Wt/FQrCa?=
 =?us-ascii?Q?7e2oIy/nvwe9kH1OP4EJgNc1vkDGT750KHif9INAxSGo57f+vEyNuo0fIDYr?=
 =?us-ascii?Q?KZF2gxu+PoXUid1wLnFhzA4Z/ycKRh3K2vk28d8Cq2jr6+0CrxIAm6Lza71V?=
 =?us-ascii?Q?tPOMb2v33EvKrn7izceCH0hIt11Ct3r/irA2gPlD9QY7b4/snLCNOG+gEtZq?=
 =?us-ascii?Q?RYOTI4aMheeb+hSwYG2qJgNDbnPb7GpDyAJJp7hlbW8sf5/+G87WUlpdUSdX?=
 =?us-ascii?Q?7kGnqkJP1rvrIN6YvEAcGWryk/1XrGlfl1dtjiHSPWl4FcBD7pCNT5NevEfA?=
 =?us-ascii?Q?mBW6OwMsD1xE9En5i726COOauObMq0vwghjh/FEOhSGmP6gViNA401O003ja?=
 =?us-ascii?Q?lyIRC0+Q1w9gZ3O1uCYElTSrPFPsLyigDWRx39OR34jkh121UdfV4yytGt8D?=
 =?us-ascii?Q?9a4aT+579wdPbICIa1q5tFMTcNi0XZNt5fZNpdnVFdmHFEQd0jCJtYAUjja+?=
 =?us-ascii?Q?NvGUfuyyxz43JhJS4cTwAZkABvaxghoMoC6bGvnY7O90qZqn7siYR2hsPIu6?=
 =?us-ascii?Q?1xrgE0VC9kKzin7KnA0Tj09yVnpHa2jribISPyGqHRoHX//r7zyq5FznBy24?=
 =?us-ascii?Q?wTPDp/e5so6MvcT9xwvU3tTLH2rxzt+EEXGFwsjtt55jLZdT/sy+YUgA1iYz?=
 =?us-ascii?Q?/rJdiewH3cCm6vAGpzBZBWySILermw5T7163g1HYD3RwawW/zRZm9FH0AxUJ?=
 =?us-ascii?Q?1EvinvLdIln9CDRp66aBqel71aA+atr3HX5e9HRsCgP2LD00Y3BIEFg5wRm0?=
 =?us-ascii?Q?wUZc/z7eUsiL2YPUrUMnSFuLZj9BVdKV5xAceIVpIUzIYkrNhd3NAzj1BAko?=
 =?us-ascii?Q?I2TKjfFCP+b7LuX2YCwn6mnKC3OXZaXARxD0BOs5VPmBzh2VduZy8Y8FzcFn?=
 =?us-ascii?Q?QZJfyLEWTPLPH88=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:02:34.7341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0eebfcdb-bc42-4742-0a6d-08dd39398ffd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834
Message-ID-Hash: 2BCUF5ZDKO57UFYD6V2R34H4LLOYBE3K
X-Message-ID-Hash: 2BCUF5ZDKO57UFYD6V2R34H4LLOYBE3K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2BCUF5ZDKO57UFYD6V2R34H4LLOYBE3K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add pm ops support for SoundWire dma driver for ACP7.0 and ACP7.1
platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/acp70-sdw-dma.c | 92 +++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/sound/soc/amd/acp70/acp70-sdw-dma.c b/sound/soc/amd/acp70/acp70-sdw-dma.c
index 2c01f60cf3b9..183db176725f 100644
--- a/sound/soc/amd/acp70/acp70-sdw-dma.c
+++ b/sound/soc/amd/acp70/acp70-sdw-dma.c
@@ -13,6 +13,7 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
+#include <linux/pm_runtime.h>
 #include <linux/soundwire/sdw_amd.h>
 #include "acp70.h"
 
@@ -128,6 +129,29 @@ static const struct snd_pcm_hardware acp70_sdw_hardware_capture = {
 	.periods_max = SDW_CAPTURE_MAX_NUM_PERIODS,
 };
 
+static void acp70_enable_disable_sdw_dma_interrupts(void __iomem *acp_base, bool enable)
+{
+	u32 ext_intr_cntl, ext_intr_cntl1;
+	u32 irq_mask = ACP_SDW_DMA_IRQ_MASK;
+	u32 irq_mask1 = ACP_P1_SDW_DMA_IRQ_MASK;
+
+	if (enable) {
+		ext_intr_cntl = readl(acp_base + ACP_EXTERNAL_INTR_CNTL);
+		ext_intr_cntl |= irq_mask;
+		writel(ext_intr_cntl, acp_base + ACP_EXTERNAL_INTR_CNTL);
+		ext_intr_cntl1 = readl(acp_base + ACP_EXTERNAL_INTR_CNTL1);
+		ext_intr_cntl1 |= irq_mask1;
+		writel(ext_intr_cntl1, acp_base + ACP_EXTERNAL_INTR_CNTL1);
+	} else {
+		ext_intr_cntl = readl(acp_base + ACP_EXTERNAL_INTR_CNTL);
+		ext_intr_cntl &= ~irq_mask;
+		writel(ext_intr_cntl, acp_base + ACP_EXTERNAL_INTR_CNTL);
+		ext_intr_cntl1 = readl(acp_base + ACP_EXTERNAL_INTR_CNTL1);
+		ext_intr_cntl1 &= ~irq_mask1;
+		writel(ext_intr_cntl1, acp_base + ACP_EXTERNAL_INTR_CNTL1);
+	}
+}
+
 static void acp70_config_dma(struct acp_sdw_dma_stream *stream, void __iomem *acp_base,
 			     u32 stream_id)
 {
@@ -476,13 +500,81 @@ static int acp70_sdw_platform_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Fail to register sdw dma component\n");
 		return status;
 	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
 	return 0;
 }
 
+static void acp70_sdw_platform_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+}
+
+static int acp_restore_sdw_dma_config(struct sdw_dma_dev_data *sdw_data)
+{
+	struct acp_sdw_dma_stream *stream;
+	struct snd_pcm_substream *substream;
+	struct snd_pcm_runtime *runtime;
+	u32 period_bytes, buf_size, water_mark_size_reg;
+	u32 stream_count;
+	int index, instance, ret;
+
+	for (instance = 0; instance < AMD_SDW_MAX_MANAGERS; instance++) {
+		if (instance == ACP_SDW0)
+			stream_count = ACP70_SDW0_DMA_MAX_STREAMS;
+		else
+			stream_count = ACP70_SDW1_DMA_MAX_STREAMS;
+
+		for (index = 0; index < stream_count; index++) {
+			if (instance == ACP_SDW0) {
+				substream = sdw_data->sdw0_dma_stream[index];
+				water_mark_size_reg =
+						sdw0_dma_ring_buf_reg[index].water_mark_size_reg;
+			} else {
+				substream = sdw_data->sdw1_dma_stream[index];
+				water_mark_size_reg =
+						sdw1_dma_ring_buf_reg[index].water_mark_size_reg;
+			}
+
+			if (substream && substream->runtime) {
+				runtime = substream->runtime;
+				stream = runtime->private_data;
+				period_bytes = frames_to_bytes(runtime, runtime->period_size);
+				buf_size = frames_to_bytes(runtime, runtime->buffer_size);
+				acp70_config_dma(stream, sdw_data->acp_base, index);
+				ret = acp70_configure_sdw_ringbuffer(sdw_data->acp_base, index,
+								     buf_size, instance);
+				if (ret)
+					return ret;
+				writel(period_bytes, sdw_data->acp_base + water_mark_size_reg);
+			}
+		}
+	}
+	acp70_enable_disable_sdw_dma_interrupts(sdw_data->acp_base, true);
+	return 0;
+}
+
+static int __maybe_unused acp70_sdw_pcm_resume(struct device *dev)
+{
+	struct sdw_dma_dev_data *sdw_data;
+
+	sdw_data = dev_get_drvdata(dev);
+	return acp_restore_sdw_dma_config(sdw_data);
+}
+
+static const struct dev_pm_ops acp70_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(NULL, acp70_sdw_pcm_resume)
+};
+
 static struct platform_driver acp70_sdw_dma_driver = {
 	.probe = acp70_sdw_platform_probe,
+	.remove = acp70_sdw_platform_remove,
 	.driver = {
 		.name = "amd_acp70_sdw_dma",
+		.pm = &acp70_pm_ops,
 	},
 };
 
-- 
2.34.1

