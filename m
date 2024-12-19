Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A68789F7444
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 06:52:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08C7A6023C;
	Thu, 19 Dec 2024 06:52:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08C7A6023C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734587554;
	bh=tjvuItLl2ipucrxFV0dJEEx8ihFUfRy2+qnlQ9UVWYA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BwT8zTUcQh76vftxRDsGFU+03UsAnHsp990uYQ61jLp2U2nKg399WfY3M9br3wDO3
	 FvcDfVFUppf7vRz1j538RdfrDw3d529h4yHSS3xuAHOgYfvknszotVmhYr1IkX3Er3
	 t2Yw+Lw9x7t0giOKkERV6IR1VRg8HbnCNt2fYzh8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22857F8060C; Thu, 19 Dec 2024 06:51:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E85EF80606;
	Thu, 19 Dec 2024 06:51:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDDA5F805D2; Thu, 19 Dec 2024 06:51:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20624.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::624])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3265F80038
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 06:51:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3265F80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XzVdVtlt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QeO7Jcgie88e02n1qfYiXjBucHUw+RN6WblshlVsAC1LC89pcWDcLqG6ddEenOHmyngUvj0lLBCedr78ZqtyMaGze78dRUIBw4FgGXjWvT3fHLcgOla3HM7O2n4rc9UTapXP6TvjenWiWKmk73rx6t+3edY5BPGptgUCE5YV3Qdqs+jpiVn8E3GnnnXTgR53+2jUR2Zybqb1YQb0OCXiHaXnEdtjoYsY5CqA+hQvZxJqMXIzlBm0uznNkmfvCmsBzlF1HsjNG1pI7SUO9BW+KIvx0iGqj5KGBmasxKGTbl3LOUwXXsiyMH4LXtt9Sq5xW7pyx1WBfAUvDGRljB7Q5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fk6FoldldQf1a87QnUneWjChYtE4d49bzLbcxUx2EFM=;
 b=hXv2QCfAAjqfhKN9E2rtXlQeJyRuRXhMCAwORBB8fCeZWwwGGhtHsPL1KeH7aap0o916FqLigtNqB/WLzfYSLaQq9KMntufWJSLJXKi7W0wTXxAO/v7P447C2FI67IAl5KMuMzvFe7pn4R7NWDFU/xdv31LCSucS5XL5WP7llu9/2k5+OqSo4ytnIbX3vwXklq6o3Lr6NDrScR0ptdbIpamfSPMAJVU+9D2Mxo/N8ZGMyX46v7QLCcJm4sT1NVzP2fw7VKYenIt/UEOsKo0RzggWXzAVsxKXj/AFx8WMNrf6pHoC/v98BQiF2HGzaR/12hWetMm3MAUwjOEvEUnWvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fk6FoldldQf1a87QnUneWjChYtE4d49bzLbcxUx2EFM=;
 b=XzVdVtltIqjh6sSs3xOJPnRiKOkb34gOAVmkvRwd5wPGlJO08xTzYd8tEQMuX1A6LQ3QJcOAvH1/a18gHF/eESP8AWq1lZZp7X09IE31eOAa5U7rzluB8e52i351+s4P7zNCf/JZco6743+Kj1Y4E5/9xRIJWTGjXSXbW2rfmCU=
Received: from CH2PR18CA0058.namprd18.prod.outlook.com (2603:10b6:610:55::38)
 by CY5PR12MB6622.namprd12.prod.outlook.com (2603:10b6:930:42::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 05:51:16 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::76) by CH2PR18CA0058.outlook.office365.com
 (2603:10b6:610:55::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 05:51:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:51:15 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:51:12 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 08/21] ASoC: amd: acp70: add acp pdm driver dma ops and dai
 ops
Date: Thu, 19 Dec 2024 11:18:44 +0530
Message-ID: <20241219054857.2070420-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
References: <20241219054857.2070420-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|CY5PR12MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: efc72a86-de2e-42b8-5064-08dd1ff12709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YlWfgT4ScdIT4Uviw0boQ83P8rJ+twsUh5VarP9OzarleMqpkj7in9CxT138?=
 =?us-ascii?Q?GK7clP/zJWFnESROQ/v5FyI0N8hZLoV4d5+qIPF4qcdAqacsTc0XFl4kzAeg?=
 =?us-ascii?Q?3EMgyQc6vZohsTl7quJuGJjDa36sDDpoh0TKc4JQ+KCH6m+2ke604N/Lhp2X?=
 =?us-ascii?Q?F5UNzHTqTWZEcb8bMPye3gTxc3khaJUwD8Col18CQYlGpl0YkqmWgWbjZqBV?=
 =?us-ascii?Q?7+eIKPzPUC9IArA1lguFjN0oSq2ELNEz5QJskdJz/9ekoufohNO7ArUqyiu6?=
 =?us-ascii?Q?kXZ3fzBA8PBMQSLZ3c8hBWKCKg3HAfwK35bDbQf73WyR6hT+LdW9CAbazH37?=
 =?us-ascii?Q?Ef3LdBvJ4dKB9Iy/tJgW/cY7fAa/IRkFk+sUH+Gve/10MhbKmGgNQqPUnbG8?=
 =?us-ascii?Q?xIXcO+6UU1rLCMn0Z/lxuiZfn4UCpKXUfNXDnnhi518F15tajQnmyvj6om1y?=
 =?us-ascii?Q?3BOqkB4AQmlVGRGXkasvbMppU29fuGCHBjt/De0zX3BLfQkRyLCxZ1snzs01?=
 =?us-ascii?Q?EaVKe3lqiwm5lfTz+5jO/VfpnMTH9GMZ42x4SNs7qcfsJZ0BydY31WilaRDs?=
 =?us-ascii?Q?F5Q0Un8tNGEkxLsGpMkhZr9foN276eXykynoomgy0jYy+GEIxQK5SJ0nZmRl?=
 =?us-ascii?Q?XdKLMrZZYDNjY30jIQA4MdVBBFi2qgblhFrhHjrchjVS1+s1g5ONZHpxHKRr?=
 =?us-ascii?Q?2EHMt2apO+gaX/0/11kCrWfx09j6TDgZirYtXzWSFezC/MThj9YHHIURhgxO?=
 =?us-ascii?Q?L2rvriDOx2B87T04UM2r3LmPbEkOx000Yn7Codu7RCkLGWY2fdxa96y1ewix?=
 =?us-ascii?Q?8V9y7T0r8TyOqEDwouSqlMRVgdy/1X4NwefzuGj9C4fjGVScNSqx5opiWV/4?=
 =?us-ascii?Q?12fIi6JB5IxGGcRA6zh4/DqGI1EAZKbNhtu+3KoLpJVSRFK420hFZXZoz4Vb?=
 =?us-ascii?Q?VhDMbPhNS9OmEKbLxFfpl1UZa/rmeWF7vVIMUAzNbKuDylEzn+0DW+8zy+Mt?=
 =?us-ascii?Q?XfCfMu96iS+wNq4QKkf5FkpRDbmpE2m9umqwQ8i1NtKEfc8Lzqy3FoYD8WQl?=
 =?us-ascii?Q?i0njFhLHIE7mwZnt1tE5g+OTTYaI8GozsCR1ClbXHpfuUPB46McJj3aSgNEn?=
 =?us-ascii?Q?oAfnlQxx1OEZT6+avFXtnDo79WnN95k8OoU32KTS+mJZKyimfhSsiGJxXNAW?=
 =?us-ascii?Q?WjtFoi0/nlk+uWTwVqLngIpkGojl4UF7d9gtQWu/6eEM/2O16xIUXDdOPBpp?=
 =?us-ascii?Q?1Tjx1qO1EUmyOH2TODu5VSf3oHzxwozbnbaygfpVlbQYlHxyxfYkKmT/Vl/C?=
 =?us-ascii?Q?lpbcL3HdUj9AlVF9jx7joXvHMbCgAOxNcDvfqBRFMbUjWsSHCV1zrUlKbGNH?=
 =?us-ascii?Q?+2hsc/nL0pTK03PlaLKsNq5FyWRd8HIE8UxOgyx0G9dZrELr1qxgzALemXVL?=
 =?us-ascii?Q?lt7jJFv6tVYheMLnhCFDtd+uGtrpes5XRgt+enWT6E/iHx98z4HSDb8AOvaB?=
 =?us-ascii?Q?UegGIr3tXj2RfqE=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:51:15.8198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 efc72a86-de2e-42b8-5064-08dd1ff12709
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6622
Message-ID-Hash: SNZ3PD4ZOYS55I3FRN6HKLIYDSH62D2O
X-Message-ID-Hash: SNZ3PD4ZOYS55I3FRN6HKLIYDSH62D2O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SNZ3PD4ZOYS55I3FRN6HKLIYDSH62D2O/>
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

