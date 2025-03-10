Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E6AA5A315
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 19:36:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21547607B0;
	Mon, 10 Mar 2025 19:36:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21547607B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741631772;
	bh=dwAiFiWv8cfQ41QcrHxh8mrfGj7bWxIwzPQjt0RyNrs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C4TOg2wFT5FVlX8rz1LSZcoqhZzHqCvjlzSe+E29YThNUqfvChSNFfkTiyIp51zt0
	 wXllLfKCHeeSuhvCPZNXfiRZJQlpOR8l+0Chvdl4yRzcAbpTEQ/XytbKovPvZWW4Jw
	 UDXy/dBE65HGzQpAa2ql8VN/5Vf/teT70lTlPZsY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F795F80717; Mon, 10 Mar 2025 19:33:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B5FFF80709;
	Mon, 10 Mar 2025 19:33:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E27DF806ED; Mon, 10 Mar 2025 19:33:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::61a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C5E7F806E9
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 19:33:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C5E7F806E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=34IDZveo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laPUFyGITrxFpZJT2j3FRAZ4aSbkuOad1hNpi+q4FzFGXlNKAOlQkoGbUWA415g8nMvEAAfpydJITgG1+CTWsScseGOINeJtpFjh2izI873x8UYsxeTwJugxev+jhg7fkYMGPIHfvYD5gHNmrS93KkZ0oUeMMz4alNuccaw2C6CWxKou1yz0hyphz3rELuiEdPAco1usZek2C7GY9nlEfU1W9YSvAyvs+VtwGz0PdAJymiGh653hwsuYul/NfjjJ27kuQ0pUjzXPs27gC0mTd859KxDJ5jBbyiAEjkED9Ulec1PowDcf1BrPjyq9stDVyV5B9Kk3B518wVH3Hqs2Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nR/K8dR6D3D/MbEO1pHo7C+hX/q2kbFX9W1xP5LlaRY=;
 b=Ce3KCo1ak2o9WFtR6xMKQuTDHRJSiYsdHX6NI7ZVH8gUWB78haD2rskGKPOkLZ2NudnndqSz397yFtJxkFNftCChHsWIKYAh/snFB7zxrbwpITdFazQd6WPy6x7bvWx0LaBciint025uNGEBwSAUGjcbV2TniTpIkwJdAH+ja2tsHupmc4EE9aZ7ULyp3UrHvNKToPWGsSOpLgyD8BJ7fy/A4B1+Wg2qxQT2P/b+nsu3pEzPyOL0M2UgwrFgizfqx6IDHH0FyTf8cnVG/OB0doF/8acqj1XJb8HmBVjRFN78GcRqE4JAvHWbm0dCkhzpcuRp13/IIMy+svwxdVUYoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nR/K8dR6D3D/MbEO1pHo7C+hX/q2kbFX9W1xP5LlaRY=;
 b=34IDZveoTHaQclfqccE8Lcq4UMVZ2x+Xrh+txL8tXT62lP34h74FC6h64UUUYenBan6oBWs3lOKvhYxqqgRa2USUZdQVEr2gI8NXSbyyzPcrKWodfcKuCp4Wgq68rNF+92G+Vn6ysIfTKNqoQN9reHaA2tp8wg6aCSNlJfML/mQ=
Received: from BN9PR03CA0705.namprd03.prod.outlook.com (2603:10b6:408:ef::20)
 by DM6PR12MB4450.namprd12.prod.outlook.com (2603:10b6:5:28e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 18:33:30 +0000
Received: from BL02EPF00021F6A.namprd02.prod.outlook.com
 (2603:10b6:408:ef:cafe::d8) by BN9PR03CA0705.outlook.office365.com
 (2603:10b6:408:ef::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 18:33:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6A.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 18:33:30 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 13:33:29 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 13:33:28 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 13:33:25 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Mario.Limonciello@amd.com>, <Vijendar.Mukunda@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<ssabakar@amd.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Greg KH <gregkh@linuxfoundation.org>, "Jeff
 Johnson" <quic_jjohnson@quicinc.com>, Peter Zijlstra <peterz@infradead.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 11/14] ASoC: amd: acp: Refactor acp63 platform resource
 structure
Date: Tue, 11 Mar 2025 00:01:58 +0530
Message-ID: <20250310183201.11979-12-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
References: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6A:EE_|DM6PR12MB4450:EE_
X-MS-Office365-Filtering-Correlation-Id: 33731cf3-f87c-4f92-228f-08dd60020e36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QW7997/7N+VAg+eGJcQpSXV+S03saTfgePdWjm+hOPmAwlGiUUx9aFZQIsrW?=
 =?us-ascii?Q?S80LuMTzuuZkV6531fMvKiOnPTr87+qcd0IASIMSqStqINPosAXTCXNhu3m6?=
 =?us-ascii?Q?EhNfMSUcEXFtuVb7ue7Ys35QuKd6fUr+a2dOSbzPQ6Uxq33ZXhOjVwDgDbdk?=
 =?us-ascii?Q?1pGFQxKcEyESwEUVGa0fJbM8M/3C0kvWmab3JkEmY4eMT4oflDx4H+axFgak?=
 =?us-ascii?Q?mx5LRc+4qHCs+ppasmdzhl8qW5FFQtIT4+goKz+o/MV0pLrbAa74yG54WI+V?=
 =?us-ascii?Q?J5Q8SdBAQDcyHKblcG7JKSTxlRxqrEJME1zG5tVLawm43uHyHKYPjtO8s0Qp?=
 =?us-ascii?Q?OWGu/obpS7XzqSGQ66uSBIJbXoAuT/hcFa9InKix1fpsYEnAk/7gr9OSVlEc?=
 =?us-ascii?Q?7fybqHO/IWR4ts2ME1T2PUeOltToLDywJKp67AasxlJfxbPHyeIxvlTRMQ0y?=
 =?us-ascii?Q?mI8Knhzfj0YrOp4S02bQdiSC3Au3l7eUrXrF4Rvb9Dp+ZLlDvvXt1RlaILUi?=
 =?us-ascii?Q?fL9qcw8Jff+McC0nCUtvSR5Rtk5XYxYJWZEv7SMpkL1uW5vgvo5QOYpkxPvA?=
 =?us-ascii?Q?sl67PBRg0piLTf8GT+Vaf1nfkDHr6psBz8+dQp4snJV8cGYDUvfGckNg11vI?=
 =?us-ascii?Q?kPFPc1cyggFsTR/aC3UYYKHMyET2C42aFVr97WYU31oJEEfcq86PwwRCav5s?=
 =?us-ascii?Q?Qe2OEzNcxw7MbGielUXkHdsbhf1xxgUWqNqJhaybzJAcSQOQev2LDINXRyhr?=
 =?us-ascii?Q?oLaOg2JeqoXoCMuB91ntmqNm38WBl55TJniq2cmFnO+QFCrEXJKbufedvZia?=
 =?us-ascii?Q?fx96p4MRdSsZDEP+xucpIzWQwUMXuiVOVTGIWE8kuLEp5T3GaxzIs40IWbY2?=
 =?us-ascii?Q?ZSe3fh1gBQ4woLvg8AJ9zWgArHcZYDfHlcE0+m2QYGMScJvCS0oQa9zBUv+p?=
 =?us-ascii?Q?nLGiS2tjBC7z4THb6cvCRYl//79LncX6GlHyEmldVog0wUQYRwfuZldJlU34?=
 =?us-ascii?Q?rUQ1vzImmhnOjR4efZRYp1NQq6hY2IYERpUBmGTwQbNmwR5DfBQn00Y3U8t4?=
 =?us-ascii?Q?67e7uV/RaLGGD8nmD4+hSozjP9c6CVgz6sc7ecKY7p0yiK1RfqWhi1c0tl/5?=
 =?us-ascii?Q?q9Pg7kY3a7+BIshLWoxzXDGC1eP3XGw7h9MTPHck1r4q9u14+rT+UNvxcOnG?=
 =?us-ascii?Q?tRNR2k1Sq00DPK7TiMsFV9hURPuZxc6iA4tW1B24GfUBqJgHb0tu9EiV9q/l?=
 =?us-ascii?Q?JIusuoYBngmbjR4qBtv7afIep5I8kqNKuJ+FZWVN9FbYszEiD5aUpUXBNKQZ?=
 =?us-ascii?Q?LZLJRXw66cayig2GE+Vdfe+f5nQXG2FeOrc1e7f//IIJHxgJBfRyEYQeGNR0?=
 =?us-ascii?Q?0V9VxITy+2KuVR4unW616/cLEnmHrt6LsIxcg08LLJuN+2i+G6VC1OuI3wIH?=
 =?us-ascii?Q?px6UbNiAghbNjPIRGtyJqiJknG3iLk2jHY45FvGKD5B4JMoCPt1cQbjg5zDB?=
 =?us-ascii?Q?HE8JkslBvdZxIpE=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 18:33:30.0639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 33731cf3-f87c-4f92-228f-08dd60020e36
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4450
Message-ID-Hash: K2K5NOMMOWCWEFBPJHIKQOOT26MRCYBT
X-Message-ID-Hash: K2K5NOMMOWCWEFBPJHIKQOOT26MRCYBT
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K2K5NOMMOWCWEFBPJHIKQOOT26MRCYBT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor acp63 platform resource private structure to amd.h
header file.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-pci.c |  1 +
 sound/soc/amd/acp/acp63.c   | 13 +------------
 sound/soc/amd/acp/amd.h     | 10 ++++++++++
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 6728eee29993..3df665ca1b0b 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -145,6 +145,7 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		break;
 	case 0x63:
 		chip->name = "acp_asoc_acp63";
+		chip->rsrc = &acp63_rsrc;
 		chip->acp_hw_ops_init = acp63_hw_ops_init;
 		chip->machines = snd_soc_acpi_amd_acp63_acp_machines;
 		break;
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index 49786e1a214f..53c013a64854 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -52,16 +52,6 @@ union clk_pll_req_no {
 	u32 clk_pll_req_no_reg;
 };
 
-static struct acp_resource rsrc = {
-	.offset = 0,
-	.no_of_ctrls = 2,
-	.irqp_used = 1,
-	.soc_mclk = true,
-	.irq_reg_offset = 0x1a00,
-	.scratch_reg_offset = 0x12800,
-	.sram_pte_offset = 0x03802800,
-};
-
 static struct snd_soc_dai_driver acp63_dai[] = {
 {
 	.name = "acp-i2s-sp",
@@ -222,11 +212,10 @@ static int acp63_audio_probe(struct platform_device *pdev)
 	}
 
 	chip->dev = dev;
-	chip->rsrc = &rsrc;
 	chip->dai_driver = acp63_dai;
 	chip->num_dai = ARRAY_SIZE(acp63_dai);
 
-	if (chip->is_i2s_config && rsrc.soc_mclk) {
+	if (chip->is_i2s_config && chip->rsrc->soc_mclk) {
 		ret = acp63_i2s_master_clock_generate(chip);
 		if (ret)
 			return ret;
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 979d8b8801a3..075659fb3314 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -238,6 +238,16 @@ enum acp_config {
 	ACP_CONFIG_20,
 };
 
+struct acp_resource acp63_rsrc = {
+	.offset = 0,
+	.no_of_ctrls = 2,
+	.irqp_used = 1,
+	.soc_mclk = true,
+	.irq_reg_offset = 0x1a00,
+	.scratch_reg_offset = 0x12800,
+	.sram_pte_offset = 0x03802800,
+};
+
 struct acp_resource acp70_rsrc = {
 	.offset = 0,
 	.no_of_ctrls = 2,
-- 
2.39.2

