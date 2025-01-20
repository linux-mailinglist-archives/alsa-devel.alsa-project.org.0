Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD943A16A4A
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 11:05:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 038E76018B;
	Mon, 20 Jan 2025 11:05:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 038E76018B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737367511;
	bh=tjvuItLl2ipucrxFV0dJEEx8ihFUfRy2+qnlQ9UVWYA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qYrUO/4nIgOAxOsZjh5ElmUvjD/h4PKyycVQbrSzEV3HomyxHRDBcQta372LXvQxj
	 k4X3vkuRHC5u+L45TbFBVLlcshwfG6IJGeNmm3hvCVUhsORTya7mWFozIORnxKJdMY
	 t6emZOhBWEZrQOiozghjK2Lzsc7auM4uAkjO/Atc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1410DF80611; Mon, 20 Jan 2025 11:04:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7CE8F805CB;
	Mon, 20 Jan 2025 11:04:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FF9BF80614; Mon, 20 Jan 2025 11:02:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::621])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22C50F80602
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 11:02:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22C50F80602
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=nYp5OdK8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Alh3tzEEiX6OrRDerpPSRhANIymi9iuuy0dPIgyMD+uPILhxADgO/6DH3jAnbsCdjBjzK66tuLhCim7nVdD7JnRe4foG+D8X7f69gwFF/ksBCjCSelNPT/kpCXY6M1e9uKdYD461qfUJxIJJqMOhDhSeyaCXRCCkKHzbZkOb7/nC4Bmf2qgYqunuwZ6UX245pT/8j6oxI3XFzJ3PF4Vrf0VOTD0bduHWbrjePGaRHzdxUuokWSFVL8SQrnHxSgif+hvx/g89TmCmgPAlKaEG+PFDjLJLIFheRnsVAmOxGvFaOzIDgyPsaeDAf/YobdI5Pauix4UoXtZ7SgTXT3b40g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fk6FoldldQf1a87QnUneWjChYtE4d49bzLbcxUx2EFM=;
 b=amrdTu2qJR5mas6Il57j8blcrX1sFpRMkoIStHn/1ksEU77lqI0xqEmZTbaEcNFizw7ttck83WpgQ57ZZ+T/AIiJTOBhqTwgMGpyI1QzodL/Slt9b9sMkNYrdZtOkdKfs5WKHZTkHGHMngfFWKEWd0AFBAfG1e2Bvw6sDApU+8czEVUdIaBooDd3rnEY5qqpXpuyiEudNXtcA99Bf/qJOuWYeiODoj/V0FhdOv86yESkmAUQxSxB20hOuu3QNdgXUyq57+GFyzG/d/j9b0THnsXtemrXTB1k0Q7UzbqeaiXrlAGbeDO6TMZZ15RoJJQhfiECymIBwb3Gn5la32WunQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fk6FoldldQf1a87QnUneWjChYtE4d49bzLbcxUx2EFM=;
 b=nYp5OdK8dym70kkN4C1nP7T4Tg2TYYDM9ivgByZSoNnricMYkztPZhgXUh0SPDW16hMGJIlm9sN05vTi8PxznqXx24yuAgbhx8uTRBYPzEMq+gepXJNEPAdRNPQKyJM9qJC8VMI4YKDrmEV/YzVu/1dCyPUymBB4B77glZDOfrE=
Received: from CH0PR04CA0011.namprd04.prod.outlook.com (2603:10b6:610:76::16)
 by SA1PR12MB9514.namprd12.prod.outlook.com (2603:10b6:806:458::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 10:02:13 +0000
Received: from CH1PEPF0000AD7E.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::55) by CH0PR04CA0011.outlook.office365.com
 (2603:10b6:610:76::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Mon,
 20 Jan 2025 10:02:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7E.mail.protection.outlook.com (10.167.244.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.8 via Frontend Transport; Mon, 20 Jan 2025 10:02:13 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 20 Jan 2025 04:02:09 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V2 08/23] ASoC: amd: acp70: add acp pdm driver dma ops and dai
 ops
Date: Mon, 20 Jan 2025 15:31:15 +0530
Message-ID: <20250120100130.3710412-9-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7E:EE_|SA1PR12MB9514:EE_
X-MS-Office365-Filtering-Correlation-Id: c8db8dc5-956a-4209-9502-08dd3939835c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zYXhK0Ucyj5i5Aogm8AqdPevYW5pTtEAf3zlTR/zbS2enaO52kH2tJjPYGZr?=
 =?us-ascii?Q?7rkTtlFssVawoGphX2Gsots8yFp/jU09nSJy8LiE+qGwt0oStRiK8TcHeA0u?=
 =?us-ascii?Q?c0d7QuT0q+b0AkBk50ZyJc6xVgKdHtHezoKgrAQyq2EArTAaLhZ/6nZ7woDF?=
 =?us-ascii?Q?XXCaOoXLAHmfFJibzUHHhateM6OEAKW4lWRqSo7pxroyTBNeHi08DDF0wfhJ?=
 =?us-ascii?Q?uqJHiueNo2mAXVVTLgD1EDaklvFtOVwwVEOuRQPGhX9g8Vn1wlmKdjk7c9bH?=
 =?us-ascii?Q?bdBCTjxOHU7ErNDqro3gk6uGHvrdR2GVtpip4z2kFYE8yM09ebq41hkm5snv?=
 =?us-ascii?Q?gQKHL/hzOKPpXILgZbq3RHG7U54DxdXijpF9o9QF/+rg/mm+3Z3wN9rfg8Sp?=
 =?us-ascii?Q?38iYkHbeu068Lh9bc9O1xQTezVTv3DVy9gsX83HnbxUrA2gqGbDxcjyli2WR?=
 =?us-ascii?Q?llPRN/9sJBH7ZVYo0Bk6WmgrwmUjdL0olyINUgcpUv7QaBO/d1RkGzPUhtr1?=
 =?us-ascii?Q?7mxuJtkJMRTTcKp5T9g6Xs5ZoMhJMWLVPpQVGWTYtS0nN8r2Q/6aERw5e0ea?=
 =?us-ascii?Q?UtT3NS4787CLVR/J0UuCx+EoxJMzgZ2eX7nV7+mCn63OucEtGd3snAfRNf2A?=
 =?us-ascii?Q?sPULBPX7juRFn49eS+bzEC6hFsoUyQe5JvPdFsAJJYzxU51hXFx4XUqqH7kk?=
 =?us-ascii?Q?QFrmUwSEabidhNPVwmFFb2WN3zgDGyHAeqDsILfFnlUUIZvKn8nMdBtHWvrg?=
 =?us-ascii?Q?kY8H+66v+IE3m5utSEv8qUN9q+2iqhf/bD9xHBAVLiFo8Unroe8kZGyfRU7V?=
 =?us-ascii?Q?YkTVRynY10aIIsBSsKvSmtkuH51ylZItAssGSVfxSE9GYX7MLp9dX6KwPsko?=
 =?us-ascii?Q?taPdkw8RtSVKqR2fCCHdt8vIKb2yMFU5Wihj79G+RKUCFUpdPbuTs2T8nPS3?=
 =?us-ascii?Q?NqxPclc/VZ2IIOCr8Hek814tyv5KnLxZKY9rJtC8tWSFbAW+NURYOtdUVXjG?=
 =?us-ascii?Q?Mzxq1C6rRGApK3IDfZPEYpPf81Sst7dAiTZHCxd3LW9MaVLmrn10NGEQw0uw?=
 =?us-ascii?Q?rQ0/vgH8b5prH3bPkqlLKG8eAUypv1pV8wxSTEeu12VxKCzd2Oe0Q901/T5f?=
 =?us-ascii?Q?tLp3beY+ZdGLz+NEu9XsBSVUcOzpYakvnFKBQHvTk+PDZyhaqm9u2WXjQmOw?=
 =?us-ascii?Q?SWL8kSPIKLmuVK/E61afpCjDHB42horZ0X8UFiE1/Ve6yaRa+tN01jQBnTBH?=
 =?us-ascii?Q?sf3lbQj67GaV+BV7X+Xb73w1ybR+DtDDo7pm9kVnwzQ0RkQiFF9PnbRypTf6?=
 =?us-ascii?Q?ANtDhMwcuaCic8ir7MzKc5wIUYyL1PSmL6BlSJ/VmNyTJr3lhxLesob59jzx?=
 =?us-ascii?Q?vWfkkk5Z7sFsq3LIrg6s2s8bX9NcZwlSdB1Bl6sZbkHbPqvGQueRbbhDYZN0?=
 =?us-ascii?Q?v9gb3zgpXt6CSx/ntZc/GAWK5tisPtmeY5feDztUsEAZ4qcdUCk70P/MK+sV?=
 =?us-ascii?Q?J7rUrev13gMtYoI=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 10:02:13.5342
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c8db8dc5-956a-4209-9502-08dd3939835c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9514
Message-ID-Hash: J5VQFJY37KGU5GUKYQUTA5F7K2RRMN6U
X-Message-ID-Hash: J5VQFJY37KGU5GUKYQUTA5F7K2RRMN6U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J5VQFJY37KGU5GUKYQUTA5F7K2RRMN6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add acp pdm driver dma ops and dai ops for ACP7.0 & ACP7.1 platforms.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/acp70-pdm-dma.c | 319 ++++++++++++++++++++++++++++
 sound/soc/amd/acp70/acp70.h         |  32 +++
 2 files changed, 351 insertions(+)

diff --git a/sound/soc/amd/acp70/acp70-pdm-dma.c b/sound/soc/amd/acp70/acp70-pdm-dma.c
index fd31e31a02a6..197214e68489 100644
--- a/sound/soc/amd/acp70/acp70-pdm-dma.c
+++ b/sound/soc/amd/acp70/acp70-pdm-dma.c
@@ -18,6 +18,319 @@
 
 #define DRV_NAME "acp70_pdm_dma"
 
+static int pdm_gain = 3;
+module_param(pdm_gain, int, 0644);
+MODULE_PARM_DESC(pdm_gain, "Gain control (0-3)");
+
+static const struct snd_pcm_hardware acp70_pdm_hardware_capture = {
+	.info = SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER |
+		SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
+	.formats = SNDRV_PCM_FMTBIT_S32_LE,
+	.channels_min = 2,
+	.channels_max = 2,
+	.rates = SNDRV_PCM_RATE_48000,
+	.rate_min = 48000,
+	.rate_max = 48000,
+	.buffer_bytes_max = CAPTURE_MAX_NUM_PERIODS * CAPTURE_MAX_PERIOD_SIZE,
+	.period_bytes_min = CAPTURE_MIN_PERIOD_SIZE,
+	.period_bytes_max = CAPTURE_MAX_PERIOD_SIZE,
+	.periods_min = CAPTURE_MIN_NUM_PERIODS,
+	.periods_max = CAPTURE_MAX_NUM_PERIODS,
+};
+
+static void acp70_init_pdm_ring_buffer(u32 physical_addr, u32 buffer_size,
+				       u32 watermark_size, void __iomem *acp_base)
+{
+	writel(physical_addr, acp_base + ACP_WOV_RX_RINGBUFADDR);
+	writel(buffer_size, acp_base + ACP_WOV_RX_RINGBUFSIZE);
+	writel(watermark_size, acp_base + ACP_WOV_RX_INTR_WATERMARK_SIZE);
+	writel(0x01, acp_base + ACPAXI2AXI_ATU_CTRL);
+}
+
+static void acp70_enable_pdm_clock(void __iomem *acp_base)
+{
+	u32 pdm_clk_enable, pdm_ctrl;
+
+	pdm_clk_enable = ACP_PDM_CLK_FREQ_MASK;
+	pdm_ctrl = 0x00;
+
+	writel(pdm_clk_enable, acp_base + ACP_WOV_CLK_CTRL);
+	pdm_ctrl = readl(acp_base + ACP_WOV_MISC_CTRL);
+	pdm_ctrl &= ~ACP_WOV_GAIN_CONTROL;
+	pdm_ctrl |= FIELD_PREP(ACP_WOV_GAIN_CONTROL, clamp(pdm_gain, 0, 3));
+	writel(pdm_ctrl, acp_base + ACP_WOV_MISC_CTRL);
+}
+
+static void acp70_enable_pdm_interrupts(struct pdm_dev_data *adata)
+{
+	u32 ext_int_ctrl;
+
+	mutex_lock(adata->acp_lock);
+	ext_int_ctrl = readl(adata->acp70_base + ACP_EXTERNAL_INTR_CNTL);
+	ext_int_ctrl |= PDM_DMA_INTR_MASK;
+	writel(ext_int_ctrl, adata->acp70_base + ACP_EXTERNAL_INTR_CNTL);
+	mutex_unlock(adata->acp_lock);
+}
+
+static void acp70_disable_pdm_interrupts(struct pdm_dev_data *adata)
+{
+	u32 ext_int_ctrl;
+
+	mutex_lock(adata->acp_lock);
+	ext_int_ctrl = readl(adata->acp70_base + ACP_EXTERNAL_INTR_CNTL);
+	ext_int_ctrl &= ~PDM_DMA_INTR_MASK;
+	writel(ext_int_ctrl, adata->acp70_base + ACP_EXTERNAL_INTR_CNTL);
+	mutex_unlock(adata->acp_lock);
+}
+
+static bool acp70_check_pdm_dma_status(void __iomem *acp_base)
+{
+	bool pdm_dma_status;
+	u32 pdm_enable, pdm_dma_enable;
+
+	pdm_dma_status = false;
+	pdm_enable = readl(acp_base + ACP_WOV_PDM_ENABLE);
+	pdm_dma_enable = readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
+	if ((pdm_enable & ACP_PDM_ENABLE) && (pdm_dma_enable & ACP_PDM_DMA_EN_STATUS))
+		pdm_dma_status = true;
+
+	return pdm_dma_status;
+}
+
+static int acp70_start_pdm_dma(void __iomem *acp_base)
+{
+	u32 pdm_enable;
+	u32 pdm_dma_enable;
+	int timeout;
+
+	pdm_enable = 0x01;
+	pdm_dma_enable  = 0x01;
+
+	acp70_enable_pdm_clock(acp_base);
+	writel(pdm_enable, acp_base + ACP_WOV_PDM_ENABLE);
+	writel(pdm_dma_enable, acp_base + ACP_WOV_PDM_DMA_ENABLE);
+	timeout = 0;
+	while (++timeout < ACP_COUNTER) {
+		pdm_dma_enable = readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
+		if ((pdm_dma_enable & 0x02) == ACP_PDM_DMA_EN_STATUS)
+			return 0;
+		udelay(DELAY_US);
+	}
+	return -ETIMEDOUT;
+}
+
+static int acp70_stop_pdm_dma(void __iomem *acp_base)
+{
+	u32 pdm_enable, pdm_dma_enable;
+	int timeout;
+
+	pdm_enable = 0x00;
+	pdm_dma_enable  = 0x00;
+
+	pdm_enable = readl(acp_base + ACP_WOV_PDM_ENABLE);
+	pdm_dma_enable = readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
+	if (pdm_dma_enable & 0x01) {
+		pdm_dma_enable = 0x02;
+		writel(pdm_dma_enable, acp_base + ACP_WOV_PDM_DMA_ENABLE);
+		timeout = 0;
+		while (++timeout < ACP_COUNTER) {
+			pdm_dma_enable = readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
+			if ((pdm_dma_enable & 0x02) == 0x00)
+				break;
+			udelay(DELAY_US);
+		}
+		if (timeout == ACP_COUNTER)
+			return -ETIMEDOUT;
+	}
+	if (pdm_enable == ACP_PDM_ENABLE) {
+		pdm_enable = ACP_PDM_DISABLE;
+		writel(pdm_enable, acp_base + ACP_WOV_PDM_ENABLE);
+	}
+	writel(0x01, acp_base + ACP_WOV_PDM_FIFO_FLUSH);
+	return 0;
+}
+
+static void acp70_config_dma(struct pdm_stream_instance *rtd, int direction)
+{
+	u16 page_idx;
+	u32 low, high, val;
+	dma_addr_t addr;
+
+	addr = rtd->dma_addr;
+	val = PDM_PTE_OFFSET;
+
+	/* Group Enable */
+	writel(ACP_SRAM_PTE_OFFSET | BIT(31), rtd->acp70_base + ACPAXI2AXI_ATU_BASE_ADDR_GRP_1);
+	writel(PAGE_SIZE_4K_ENABLE, rtd->acp70_base + ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1);
+	for (page_idx = 0; page_idx < rtd->num_pages; page_idx++) {
+		/* Load the low address of page int ACP SRAM through SRBM */
+		low = lower_32_bits(addr);
+		high = upper_32_bits(addr);
+
+		writel(low, rtd->acp70_base + ACP_SCRATCH_REG_0 + val);
+		high |= BIT(31);
+		writel(high, rtd->acp70_base + ACP_SCRATCH_REG_0 + val + 4);
+		val += 8;
+		addr += PAGE_SIZE;
+	}
+}
+
+static int acp70_pdm_dma_open(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime;
+	struct pdm_dev_data *adata;
+	struct pdm_stream_instance *pdm_data;
+	int ret;
+
+	runtime = substream->runtime;
+	adata = dev_get_drvdata(component->dev);
+	pdm_data = kzalloc(sizeof(*pdm_data), GFP_KERNEL);
+	if (!pdm_data)
+		return -EINVAL;
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		runtime->hw = acp70_pdm_hardware_capture;
+
+	ret = snd_pcm_hw_constraint_integer(runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0) {
+		dev_err(component->dev, "set integer constraint failed\n");
+		kfree(pdm_data);
+		return ret;
+	}
+
+	acp70_enable_pdm_interrupts(adata);
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		adata->capture_stream = substream;
+
+	pdm_data->acp70_base = adata->acp70_base;
+	runtime->private_data = pdm_data;
+	return ret;
+}
+
+static int acp70_pdm_dma_hw_params(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	struct pdm_stream_instance *rtd;
+	size_t size, period_bytes;
+
+	rtd = substream->runtime->private_data;
+	if (!rtd)
+		return -EINVAL;
+	size = params_buffer_bytes(params);
+	period_bytes = params_period_bytes(params);
+	rtd->dma_addr = substream->runtime->dma_addr;
+	rtd->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
+	acp70_config_dma(rtd, substream->stream);
+	acp70_init_pdm_ring_buffer(PDM_MEM_WINDOW_START, size,
+				   period_bytes, rtd->acp70_base);
+	return 0;
+}
+
+static u64 acp70_pdm_get_byte_count(struct pdm_stream_instance *rtd,
+				    int direction)
+{
+	u32 high, low;
+	u64 byte_count;
+
+	high = readl(rtd->acp70_base + ACP_WOV_RX_LINEARPOSITIONCNTR_HIGH);
+	byte_count = high;
+	low = readl(rtd->acp70_base + ACP_WOV_RX_LINEARPOSITIONCNTR_LOW);
+	byte_count = (byte_count << 32) | low;
+	return byte_count;
+}
+
+static snd_pcm_uframes_t acp70_pdm_dma_pointer(struct snd_soc_component *comp,
+					       struct snd_pcm_substream *stream)
+{
+	struct pdm_stream_instance *rtd;
+	u32 pos, buffersize;
+	u64 bytescount;
+
+	rtd = stream->runtime->private_data;
+	buffersize = frames_to_bytes(stream->runtime,
+				     stream->runtime->buffer_size);
+	bytescount = acp70_pdm_get_byte_count(rtd, stream->stream);
+	if (bytescount > rtd->bytescount)
+		bytescount -= rtd->bytescount;
+	pos = do_div(bytescount, buffersize);
+	return bytes_to_frames(stream->runtime, pos);
+}
+
+static int acp70_pdm_dma_new(struct snd_soc_component *component,
+			     struct snd_soc_pcm_runtime *rtd)
+{
+	struct device *parent = component->dev->parent;
+
+	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
+				       parent, MIN_BUFFER, MAX_BUFFER);
+	return 0;
+}
+
+static int acp70_pdm_dma_close(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream)
+{
+	struct pdm_dev_data *adata = dev_get_drvdata(component->dev);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	acp70_disable_pdm_interrupts(adata);
+	adata->capture_stream = NULL;
+	kfree(runtime->private_data);
+	return 0;
+}
+
+static int acp70_pdm_dai_trigger(struct snd_pcm_substream *substream,
+				 int cmd, struct snd_soc_dai *dai)
+{
+	struct pdm_stream_instance *rtd;
+	int ret;
+	bool pdm_status;
+	unsigned int ch_mask;
+
+	rtd = substream->runtime->private_data;
+	ret = 0;
+	switch (substream->runtime->channels) {
+	case TWO_CH:
+		ch_mask = 0x00;
+		break;
+	default:
+		return -EINVAL;
+	}
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		writel(ch_mask, rtd->acp70_base + ACP_WOV_PDM_NO_OF_CHANNELS);
+		writel(PDM_DECIMATION_FACTOR, rtd->acp70_base + ACP_WOV_PDM_DECIMATION_FACTOR);
+		rtd->bytescount = acp70_pdm_get_byte_count(rtd, substream->stream);
+		pdm_status = acp70_check_pdm_dma_status(rtd->acp70_base);
+		if (!pdm_status)
+			ret = acp70_start_pdm_dma(rtd->acp70_base);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		pdm_status = acp70_check_pdm_dma_status(rtd->acp70_base);
+		if (pdm_status)
+			ret = acp70_stop_pdm_dma(rtd->acp70_base);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
+static const struct snd_soc_dai_ops acp70_pdm_dai_ops = {
+	.trigger   = acp70_pdm_dai_trigger,
+};
+
 static struct snd_soc_dai_driver acp70_pdm_dai_driver = {
 	.name = "acp_acp70_pdm_dma.0",
 	.capture = {
@@ -28,10 +341,16 @@ static struct snd_soc_dai_driver acp70_pdm_dai_driver = {
 		.rate_min = 48000,
 		.rate_max = 48000,
 	},
+	.ops = &acp70_pdm_dai_ops,
 };
 
 static const struct snd_soc_component_driver acp70_pdm_component = {
 	.name		= DRV_NAME,
+	.open		= acp70_pdm_dma_open,
+	.close		= acp70_pdm_dma_close,
+	.hw_params	= acp70_pdm_dma_hw_params,
+	.pointer	= acp70_pdm_dma_pointer,
+	.pcm_construct	= acp70_pdm_dma_new,
 };
 
 static int acp70_pdm_audio_probe(struct platform_device *pdev)
diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
index c7cabb98cc1a..d6c99d43ed4f 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -34,6 +34,30 @@
 #define ACP70_SDW_ADDR			5
 #define AMD_SDW_MAX_MANAGERS		2
 
+#define PDM_DMA_STAT		0x10
+#define PDM_DMA_INTR_MASK	0x10000
+#define ACP_ERROR_STAT	29
+#define PDM_DECIMATION_FACTOR	2
+#define ACP_PDM_CLK_FREQ_MASK	7
+#define ACP_WOV_GAIN_CONTROL	GENMASK(4, 3)
+#define ACP_PDM_ENABLE		1
+#define ACP_PDM_DISABLE		0
+#define ACP_PDM_DMA_EN_STATUS	2
+#define TWO_CH		2
+
+#define ACP_SRAM_PTE_OFFSET	0x03800000
+#define PAGE_SIZE_4K_ENABLE	2
+#define PDM_PTE_OFFSET		0
+#define PDM_MEM_WINDOW_START	0x4000000
+
+#define CAPTURE_MIN_NUM_PERIODS     4
+#define CAPTURE_MAX_NUM_PERIODS     4
+#define CAPTURE_MAX_PERIOD_SIZE     8192
+#define CAPTURE_MIN_PERIOD_SIZE     4096
+
+#define MAX_BUFFER (CAPTURE_MAX_PERIOD_SIZE * CAPTURE_MAX_NUM_PERIODS)
+#define MIN_BUFFER MAX_BUFFER
+
 enum acp_config {
 	ACP_CONFIG_0 = 0,
 	ACP_CONFIG_1,
@@ -58,6 +82,14 @@ enum acp_config {
 	ACP_CONFIG_20,
 };
 
+struct pdm_stream_instance {
+	u16 num_pages;
+	u16 channels;
+	dma_addr_t dma_addr;
+	u64 bytescount;
+	void __iomem *acp70_base;
+};
+
 struct pdm_dev_data {
 	u32 pdm_irq;
 	void __iomem *acp70_base;
-- 
2.34.1

