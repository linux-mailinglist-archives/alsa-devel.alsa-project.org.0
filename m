Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 725CE94EB95
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2024 13:07:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0D52211E;
	Mon, 12 Aug 2024 13:06:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0D52211E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723460823;
	bh=3XUo9c9DE1GNLO11yxvjkWOwbfYRmg5q6qFtaJ81+TQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CJVksbkM6GU9UU4DhReEa0RCHETGv1NAMvJ3VOAFm/uKdvWc+4MjO1cUjcoKiNzIH
	 JPgp7QAXPWcDN9U+05j04Ep0Jq+0uJPfoujfE22D715qQ8IyQAkMmDd3rTT9c/4fkm
	 L3Irra5McBTmIAgWUfiKk254a4xjUhj0L3XoQilo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA637F805EB; Mon, 12 Aug 2024 13:06:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32A27F8057A;
	Mon, 12 Aug 2024 13:06:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93726F80517; Mon, 12 Aug 2024 13:06:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60C23F805B4;
	Mon, 12 Aug 2024 13:06:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60C23F805B4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=LdmUU2Xm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CdeH8txaf76rqVCkmmDlOUEH3Q64pd20DDSgPtn4BSbPnKtcsIHTxh4nvm14gPkBv7365MtjdHtcnvTRNfpXc25fFI/roNlLosW8We6a447YMFFmIzw3xodwCeh1dK0jLTouHIPaF77jPij7vNGQwLvVVOF/2L7EX20pqjDuuO4Nweq4VqMNSLs4JJr6vHfuzv8Su8j08NSTp1o2xv1YNzrDFfEA1EtGi+pODa8yjq+NBKe8BQag/DKG0libO+6gxEbmHX86R4ubr4OeQVWqIWsogByJMUDSj9krqtA0UyTQuG8S+BoOe1sg3FKddaeprOdCk6+TFJIAkxtqbO4QGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcmkoqsNd4nWwkCnm67ZOYyd3mri0Gh9VEU8tq4p73g=;
 b=xFWEq+q72htE8s0+/2CjTb8W/CBOI7ue36NYCoXOMn84B9A71FE8InpR16CSVnq0dAKwydE7hDWaAVC/X9+wse/6HW6loJjgMmWhuLYIJUifRiQ+vTn6eJ4hMOFHYoo1oShp1ooQEJeNRZ/tpxjl95oigAqerbsE1HnD9eYHwa/trGP1zQbcnopjMae4F+qcnZsNlsgC1+/VDZhLRA8hv0oViaUvSz1/f3ys9gqa9SXAuOC8Yl+ig9cBEV19XqZbRA12P8v2y2OAfawBcoXSOnUwZPBDiZl452OrNBMUSHzqRGhWe5xVe//KZJ7KVsXD8aF5lj8Pu9TPgmoJy5nNDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcmkoqsNd4nWwkCnm67ZOYyd3mri0Gh9VEU8tq4p73g=;
 b=LdmUU2Xm7xgyThKS7/N3q0+wY12WwtBeKz9Ytt1FVSqXcIJFXhKZN+3qxhP+sw+pHy8IoCy/MIlgFFpAx//zKFYys04K3Oqt1N24Xb+zXkGBOxDINgHgaDbfS0+CX8TwSfEKxeuf3bFPi0wLG8WNQjOuotZ5WNNkQvC/WMl2haA=
Received: from DM6PR07CA0043.namprd07.prod.outlook.com (2603:10b6:5:74::20) by
 LV2PR12MB5920.namprd12.prod.outlook.com (2603:10b6:408:172::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 11:06:05 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::4b) by DM6PR07CA0043.outlook.office365.com
 (2603:10b6:5:74::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Mon, 12 Aug 2024 11:06:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 11:06:05 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 06:05:58 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Sunil-kumar.Dommati@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <venkataprasad.potturu@amd.com>,
	<pierre-louis.bossart@linux.intel.com>, <lgirdwood@gmail.com>,
	<yung-chuan.liao@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<cristian.ciocaltea@collabora.com>, <sound-open-firmware@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<kai.vehmanen@linux.intel.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	Rander Wang <rander.wang@intel.com>
Subject: [PATCH 2/2] ASoC: SOF: amd: Fix for incorrect acp error register
 offsets
Date: Mon, 12 Aug 2024 16:35:10 +0530
Message-ID: <20240812110514.2683056-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812110514.2683056-1-Vijendar.Mukunda@amd.com>
References: <20240812110514.2683056-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|LV2PR12MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cf0a03b-5357-40cb-96d4-08dcbabec2db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/o0NeJ7QUkuYFvs5EwEnt1fuSVtQ/KDd6P0we0KVElIeoYLmMpw80lGeZzHf?=
 =?us-ascii?Q?HvX3rkldZJgVRpok+sAJbvMQNDIh+mOD5w83bzIUAGn4k7+2y22HfnBgWREI?=
 =?us-ascii?Q?kd11IIY1tKNxFvYKakLcsOGyJPni/qO9IepokyNNCghFZbDQk6vnMV6aBtBj?=
 =?us-ascii?Q?kuNk0o3lmUhk9hCb97+M6dALplPZiyFbTIXkrw9BLeFCpOIOjbpFGylA3nIq?=
 =?us-ascii?Q?Dzm0Y3O9eNycN8HwjPAF2zXHOnCORKmrjqzQ14RKixamH9WPVpEF+NyYax72?=
 =?us-ascii?Q?lVtZNcyGqu4bpft6leyn4/P1rzP6D9kM84DFaFeYqUhNT3+eUkm29DVanD9e?=
 =?us-ascii?Q?a40pWxP3n/WHU1jlo/e7NWDSgKTzAgmXrExtP7cWzxS3fzjDKhoCDOdp0htv?=
 =?us-ascii?Q?/J+cIi4iGNR+9uAD8zm/nFQ2UoxKIPxeRYoqfrKPRYoffCiIHgGW6HUBy4lU?=
 =?us-ascii?Q?7fZm0d1Jl1XcG17T/IJrml83fviopk4pbz63ch7G4jHnXuELDAPBg3TUGLRj?=
 =?us-ascii?Q?2Hdqw63F+kd3ssOr6WByJL+Xplfi6uJRgoQe9BFzQSkOE5p6e1u31dY4cCPU?=
 =?us-ascii?Q?zEfMGhloF9CkKzOCfPrAx3XiIIA1x2+/R1IR6WaipZf5w0AzftP14q88jW7w?=
 =?us-ascii?Q?8Xy/wNhPi3eqKNWP+b+XFPVUgmzpDtEYavhLAImtNIA506MIFdvpWdNLRvkQ?=
 =?us-ascii?Q?g6jWr/umx89gKJjPvYFO2y3D1Y6fHlX3OhwWS8xpiFA5Iyg+FdsSoGvPy8ni?=
 =?us-ascii?Q?9ewVJtcm2y/UBbIwA+8UqBSiyJ1PZ5L5vxM/Ca/VrYgs0t9w8y0urz8ztkPZ?=
 =?us-ascii?Q?D4mA6JkWZE5kIKqdpcDkJTIpeZXpjvFJUnYukLRkbcVCFL4nlXCqanH7WQwj?=
 =?us-ascii?Q?kJIriKaK2+3AKbpE6uWlZty8OvrYjkJUM/AWyWH5rPfsvhp8gDOFIA7zZQcH?=
 =?us-ascii?Q?PvtuAJuxPlnNd+tlncVAc3G7VRppD5phCI7lhnTn5Dq01u/v45E45eiOeFe+?=
 =?us-ascii?Q?PHdw//FwJ+bq5hPmNRjqLfvuT2o/+uETXSwldqO2LhVRYadi9KOzlOM4aTpH?=
 =?us-ascii?Q?T5fLrMSnGG+IQFZqv7T6zwsTNhLHbdOZ/VnwVSahkCGl9d3DTJGRB6JcN3lE?=
 =?us-ascii?Q?7iasZfED4meMk+wBbjx4FYa8lEYSeIxkfcJc2/F96KNkX8bz2lhnm6KDK9Ih?=
 =?us-ascii?Q?yYQFHGBV8JrfJns6aOCCHhanbcXYYTn1S3bT8fB07jvzussoKhYpNhdlKDWi?=
 =?us-ascii?Q?fWkvSD3aUPALSOIlg+/yx5mkM9uMjs2TaqKoUUIvgsz9kJkHoS6CPEqvoFYE?=
 =?us-ascii?Q?WfmJZxkwr7nsasEVQ9aUltWiq60SFKw3VIC/WrWTuBSykPwJlPrE4I7kZaN0?=
 =?us-ascii?Q?WCMJn44IirL0Pu48KEAQ4kUnVvZ2qCwXW2/qKjqN2uNUlzKvcqNGhXnYfw9h?=
 =?us-ascii?Q?pPl6j0V9aKGOe/qukgDoVa5a9Pn0hWKf?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 11:06:05.4397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5cf0a03b-5357-40cb-96d4-08dcbabec2db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5920
Message-ID-Hash: 5FB756HIJ4EZLMESZYBBGNRXI6CTKF4Z
X-Message-ID-Hash: 5FB756HIJ4EZLMESZYBBGNRXI6CTKF4Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5FB756HIJ4EZLMESZYBBGNRXI6CTKF4Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adding 'dsp_intr_base' to ACP error status register offset in irq handler
points to wrong register offset. ACP error status register offset got
changed from ACP 6.0 onwards. Add 'acp_error_stat' descriptor field and
update the value based on the ACP variant.

Fix the incorrect register offsets for acp error reason registers.
Add 'acp_sw0_i2s_err_reason' as register field in acp descriptor structure
and update the value based on the acp variant.
ACP_SW1_ERROR_REASON register was added from Rembrandt platform onwards.
Add conditional check for the same.

Fixes: 96eb81851012 ("ASoC: SOF: amd: add interrupt handling for SoundWire manager devices")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/sof/amd/acp-dsp-offset.h |  6 ++++--
 sound/soc/sof/amd/acp.c            | 11 +++++++----
 sound/soc/sof/amd/acp.h            |  2 ++
 sound/soc/sof/amd/pci-acp63.c      |  2 ++
 sound/soc/sof/amd/pci-rmb.c        |  2 ++
 sound/soc/sof/amd/pci-rn.c         |  2 ++
 6 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
index 59afbe2e0f42..072b703f9b3f 100644
--- a/sound/soc/sof/amd/acp-dsp-offset.h
+++ b/sound/soc/sof/amd/acp-dsp-offset.h
@@ -76,13 +76,15 @@
 #define DSP_SW_INTR_CNTL_OFFSET			0x0
 #define DSP_SW_INTR_STAT_OFFSET			0x4
 #define DSP_SW_INTR_TRIG_OFFSET			0x8
-#define ACP_ERROR_STATUS			0x18C4
+#define ACP3X_ERROR_STATUS			0x18C4
+#define ACP6X_ERROR_STATUS			0x1A4C
 #define ACP3X_AXI2DAGB_SEM_0			0x1880
 #define ACP5X_AXI2DAGB_SEM_0			0x1884
 #define ACP6X_AXI2DAGB_SEM_0			0x1874
 
 /* ACP common registers to report errors related to I2S & SoundWire interfaces */
-#define ACP_SW0_I2S_ERROR_REASON		0x18B4
+#define ACP3X_SW_I2S_ERROR_REASON		0x18C8
+#define ACP6X_SW0_I2S_ERROR_REASON		0x18B4
 #define ACP_SW1_I2S_ERROR_REASON		0x1A50
 
 /* Registers from ACP_SHA block */
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index b8d4f986f89d..35e56d22930f 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -92,6 +92,7 @@ static int config_dma_channel(struct acp_dev_data *adata, unsigned int ch,
 			      unsigned int idx, unsigned int dscr_count)
 {
 	struct snd_sof_dev *sdev = adata->dev;
+	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
 	unsigned int val, status;
 	int ret;
 
@@ -102,7 +103,7 @@ static int config_dma_channel(struct acp_dev_data *adata, unsigned int ch,
 					    val & (1 << ch), ACP_REG_POLL_INTERVAL,
 					    ACP_REG_POLL_TIMEOUT_US);
 	if (ret < 0) {
-		status = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_ERROR_STATUS);
+		status = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->acp_error_stat);
 		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_DMA_ERR_STS_0 + ch * sizeof(u32));
 
 		dev_err(sdev->dev, "ACP_DMA_ERR_STS :0x%x ACP_ERROR_STATUS :0x%x\n", val, status);
@@ -402,9 +403,11 @@ static irqreturn_t acp_irq_handler(int irq, void *dev_id)
 
 	if (val & ACP_ERROR_IRQ_MASK) {
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_ERROR_IRQ_MASK);
-		snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + ACP_SW0_I2S_ERROR_REASON, 0);
-		snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + ACP_SW1_I2S_ERROR_REASON, 0);
-		snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + ACP_ERROR_STATUS, 0);
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_sw0_i2s_err_reason, 0);
+		/* ACP_SW1_I2S_ERROR_REASON is newly added register from rmb platform onwards */
+		if (desc->rev >= 6)
+			snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SW1_I2S_ERROR_REASON, 0);
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_error_stat, 0);
 		irq_flag = 1;
 	}
 
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index ec9170b3f068..f6f0fcfeb691 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -203,6 +203,8 @@ struct sof_amd_acp_desc {
 	u32 probe_reg_offset;
 	u32 reg_start_addr;
 	u32 reg_end_addr;
+	u32 acp_error_stat;
+	u32 acp_sw0_i2s_err_reason;
 	u32 sdw_max_link_count;
 	u64 sdw_acpi_dev_addr;
 };
diff --git a/sound/soc/sof/amd/pci-acp63.c b/sound/soc/sof/amd/pci-acp63.c
index 54d42f83ce9e..e90658ba2bd7 100644
--- a/sound/soc/sof/amd/pci-acp63.c
+++ b/sound/soc/sof/amd/pci-acp63.c
@@ -35,6 +35,8 @@ static const struct sof_amd_acp_desc acp63_chip_info = {
 	.ext_intr_cntl = ACP6X_EXTERNAL_INTR_CNTL,
 	.ext_intr_stat	= ACP6X_EXT_INTR_STAT,
 	.ext_intr_stat1	= ACP6X_EXT_INTR_STAT1,
+	.acp_error_stat = ACP6X_ERROR_STATUS,
+	.acp_sw0_i2s_err_reason = ACP6X_SW0_I2S_ERROR_REASON,
 	.dsp_intr_base	= ACP6X_DSP_SW_INTR_BASE,
 	.sram_pte_offset = ACP6X_SRAM_PTE_OFFSET,
 	.hw_semaphore_offset = ACP6X_AXI2DAGB_SEM_0,
diff --git a/sound/soc/sof/amd/pci-rmb.c b/sound/soc/sof/amd/pci-rmb.c
index 4bc30951f8b0..a366f904e6f3 100644
--- a/sound/soc/sof/amd/pci-rmb.c
+++ b/sound/soc/sof/amd/pci-rmb.c
@@ -33,6 +33,8 @@ static const struct sof_amd_acp_desc rembrandt_chip_info = {
 	.pgfsm_base	= ACP6X_PGFSM_BASE,
 	.ext_intr_stat	= ACP6X_EXT_INTR_STAT,
 	.dsp_intr_base	= ACP6X_DSP_SW_INTR_BASE,
+	.acp_error_stat = ACP6X_ERROR_STATUS,
+	.acp_sw0_i2s_err_reason = ACP6X_SW0_I2S_ERROR_REASON,
 	.sram_pte_offset = ACP6X_SRAM_PTE_OFFSET,
 	.hw_semaphore_offset = ACP6X_AXI2DAGB_SEM_0,
 	.fusion_dsp_offset = ACP6X_DSP_FUSION_RUNSTALL,
diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
index e08875bdfa8b..2b7c53470ce8 100644
--- a/sound/soc/sof/amd/pci-rn.c
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -33,6 +33,8 @@ static const struct sof_amd_acp_desc renoir_chip_info = {
 	.pgfsm_base	= ACP3X_PGFSM_BASE,
 	.ext_intr_stat	= ACP3X_EXT_INTR_STAT,
 	.dsp_intr_base	= ACP3X_DSP_SW_INTR_BASE,
+	.acp_error_stat = ACP3X_ERROR_STATUS,
+	.acp_sw0_i2s_err_reason = ACP3X_SW_I2S_ERROR_REASON,
 	.sram_pte_offset = ACP3X_SRAM_PTE_OFFSET,
 	.hw_semaphore_offset = ACP3X_AXI2DAGB_SEM_0,
 	.acp_clkmux_sel	= ACP3X_CLKMUX_SEL,
-- 
2.34.1

