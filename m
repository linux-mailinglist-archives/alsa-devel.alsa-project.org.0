Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2B5949F0F
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 07:20:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BFE0190B;
	Wed,  7 Aug 2024 07:20:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BFE0190B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723008036;
	bh=EYvWmbwapxhXRrApxnPn19zusiErRpPzHSu/Ib9cSag=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Fa9RQHU5vlBAUx7THBMCAofIYNV1lTrEW6IIx0Xs5sIA42GP1S6KSsi4wd1FuunJe
	 NleZsjGguBa5zqEJvlgkxcDvw5LoiFXhMDoWl6IZiitI/nhMt7rACsSnyBgOn7Zqn5
	 fS+znIqrksCfAkzPy2m2nJlWqkw9aKJEC3qspBIo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25093F805C1; Wed,  7 Aug 2024 07:19:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 355F3F805D7;
	Wed,  7 Aug 2024 07:19:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9A9CF8047C; Wed,  7 Aug 2024 07:14:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0BB5F8023A;
	Wed,  7 Aug 2024 07:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0BB5F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=u+wHKsEi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9xJsEc9wjYoyhAuOGgIjOfVp6U0AFrA41bAHXYOjJUfpDe4v2c4cMJg425S+MKaFBTy5PDSjSp46fWU+SRP6FZPpLrQdGFrdLBfFd46WbNiry6hn6hlpKwX1PLJhKZBFb7YNTHQ/D6kZsVi5IW483Dy7+2kh/jqzg1qatUP4LvWbyFjtfRv/WlvuJ2eQF4CEGzeHnfUJ2bVLGd4wH4vBVSqdeMdSHO14r/ew7lzC9CgsDprQRfDj/wuC3bAj0ENM2fDuD53QYDHs7uMfFphAOpe3BTPZsGG01PRwtkLdJxOh7lC2epJazeaBko7/UC+jey7PrGS5L5YSSmjN/vXIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niKGXD7RG6SLE2Z/Fkk9hOW6fVU5W+mLoOggWoOsWho=;
 b=UPGoq5td8Uih9c3XJHNWn9D7Ebe8MxlKUCCroJJKbAUpbIgqy7RWWBSijJfqQOSUyfA+jw+cRPtNVhLUYv5VAVTGRW+xzgXY76NbClrsXM5K+DJl2u7l8xU2ogOXsA8AwSf8B+TuGIfwvwxaaxPzfztDhVwo27Qm2tbBOYULK/x+YBZbb8Msy6tXjfx3/MGyTbi0pMAzFUQh67H6hJzfNZ98TUCs+2kcb1vlrjbaHPcrwWGgzaIYWEdBvAOCYy0CcaTTEycPjsYe6h3cUJvjlc9QgQ+q2b19p26bjUNlNAstCZMnl2uQCBCfWzcq1ctnl5Shg0A4cX/U6D6pj/pUFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niKGXD7RG6SLE2Z/Fkk9hOW6fVU5W+mLoOggWoOsWho=;
 b=u+wHKsEiSsJ7T23vAF4uB3CdOLmCJZ9rx+F+bofq0DlKD6b/HGuN6s9q7s9/BnEUa4nm1w9uwqMeJRRXOk9rO4Wq7hWGCj7cDqbWqZdUQbRlHUJ4W1NiUGXdrXWFNXdtoLbbXZbN5Ys0TX4a4kAj4CsXoR3lp6ko3dMjZAiWqj4=
Received: from BY5PR04CA0019.namprd04.prod.outlook.com (2603:10b6:a03:1d0::29)
 by BY5PR12MB4276.namprd12.prod.outlook.com (2603:10b6:a03:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 7 Aug
 2024 05:14:27 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::35) by BY5PR04CA0019.outlook.office365.com
 (2603:10b6:a03:1d0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27 via Frontend
 Transport; Wed, 7 Aug 2024 05:14:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 7 Aug 2024 05:14:27 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 00:14:21 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	"Kai Vehmanen" <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cristian Ciocaltea
	<cristian.ciocaltea@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>,
	"moderated list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
	<sound-open-firmware@alsa-project.org>, "open list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/8] ASoC: SOF: amd: fix for acp error reason registers wrong
 offset
Date: Wed, 7 Aug 2024 10:43:14 +0530
Message-ID: <20240807051341.1616925-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
References: <20240807051341.1616925-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|BY5PR12MB4276:EE_
X-MS-Office365-Filtering-Correlation-Id: ba82c707-306a-48a1-47d6-08dcb69fcf2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3g7u15CPQ3XBPgMXcHLt6l/28TY5qZCdRcL8GzQnRtLpl4PFmvmhZ7iOzuNm?=
 =?us-ascii?Q?91a6Q6CC5/NbV0w/+nC0yTv9yTt8ZIKKR/3fnGAAaoycwLdFpvRG+EMiKwpU?=
 =?us-ascii?Q?tx3/TE8Rimn/3zA8A7rIlrOmKy0M+ovzxTTgLPrEzeROybjUHTDeaRiuUY+j?=
 =?us-ascii?Q?Fnl+CN5Po1ouEW4/N3f6mWum+ZOSIH5+ygT3d4bAmaAh/VYSgs4ECC5hmZgY?=
 =?us-ascii?Q?HQo+GppIU8B7LX2wjfZxQH5luXk5H+B/EKn9oqURdFQtc9KJQ1nMeHfo0GAa?=
 =?us-ascii?Q?Dq5AbaYBinmed3/gkab99WtNjKsoKtUJExzmJQShx0zoyeIfH1Jl7BDraEaA?=
 =?us-ascii?Q?/9XGrGOxnNOzWQvPvj38Faaxl6PfNNVCtvT4M2IEBWV7gngAt1hKD71mjCD7?=
 =?us-ascii?Q?DgVkyJDc8GtaIQAkF9/ZJbIyQfIGhTuhIVOqwaJzhzFKqfbu9ZHUjRKkQA5C?=
 =?us-ascii?Q?Dw+HQTru7zxUhztrtsk9pwzk8kFt3luNnnFr3IxC3ZjIRGcDpYLyDq0R0Rgf?=
 =?us-ascii?Q?W8fMOL1S3TekpM3U9AQ7XsoGohDKwudm5A5xl9BlGIjT3MduuGJQ/jE1B0MH?=
 =?us-ascii?Q?zKX5XVG68tSIMH4EXwlJphkZq+5z/Mpalbh2hmIzZX0F+q1LX5OwXX1tpBfT?=
 =?us-ascii?Q?KXoWQzMfth8Rprmr7L6eoopnm+pownC24B2dOP7+FuDIr+77M1XJkejHUB7d?=
 =?us-ascii?Q?fnVAxueGPVtNKkcRB6lHEQnbc0Ml7npq21g2QOqBUSWJjOp4zXG2XpQVx2IP?=
 =?us-ascii?Q?EhK5B8YXUTetZFU74A4VsZtccfjv34Ic0kblHmZGz4s3ZzIW/p1AXfl3lP3r?=
 =?us-ascii?Q?KHcF//gf+EmV4Kfwhid8JVYLwNUHfS9trX7kLv2YZm7yZGp3T2Enhv7uG+lV?=
 =?us-ascii?Q?OcF8qAo3/2j4qPMbBCHcZNW24JuymkqWgGIA2HC7Ibe4IyzVMjBr+9yKN4sl?=
 =?us-ascii?Q?ilE7FEFjMIy5lw/3ohakSGTMIgzNi1EpMAlcrcK7CHKfw2X2gRsjhXcC3KUP?=
 =?us-ascii?Q?48FO6Nfjbg+tFnIyZXxD7iJn8ASwanTQC7gXAZ2rl9CZ9WpSDrJDkrfpb2o3?=
 =?us-ascii?Q?YtHlDQSUhOZCYEqlCrBLbY5QZ/JHKEOGXyAsjVokzOUqj2BZ2a0uDjyu/ZUl?=
 =?us-ascii?Q?BlqZ+B7tbuyaVbRwgWF8WibB5hmTBI3bhji7iV4ks76qPz6+bMosg7zdPOb2?=
 =?us-ascii?Q?XxrFL200rzwQx2KpOYIaYTUBENoZ0swxOcG9zSPbQKcvWyi0yltQVHDI8SvW?=
 =?us-ascii?Q?OcgZ+/CLwtS/vqXWKbYgTCaJJl4mW6g6nnqxcaX9/G1DZQz6v5PvG84A0a4W?=
 =?us-ascii?Q?ticmYnen50iNfuZ5OgIydXulANtv9lHQYWKSm+xHGZ+Aj2nAs0g9+xyot2tt?=
 =?us-ascii?Q?zoNk6dcmCJpyQgM5yGZ2fsRN1X1cyPBGFJooQ6mbzQISdu3oeMZspkrTHRln?=
 =?us-ascii?Q?9dYQWYhngExMFY9PaoPFE6uUYQh9tUlz?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 05:14:27.0333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ba82c707-306a-48a1-47d6-08dcb69fcf2e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4276
Message-ID-Hash: VCWIHOXKNAHKK46C6ZKRVXJB47OAOBRJ
X-Message-ID-Hash: VCWIHOXKNAHKK46C6ZKRVXJB47OAOBRJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCWIHOXKNAHKK46C6ZKRVXJB47OAOBRJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix the incorrect register offsets for acp error reason registers.
Add 'acp_sw0_i2s_err_reason' as register field in acp descriptor structure
and update the value based on the acp variant.
ACP_SW1_ERROR_REASON register was added from Rembrandt platform onwards.
Add conditional check for the same.

Fixes: 96eb81851012 ("ASoC: SOF: amd: add interrupt handling for SoundWire manager devices")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp-dsp-offset.h | 3 ++-
 sound/soc/sof/amd/acp.c            | 5 +++--
 sound/soc/sof/amd/acp.h            | 1 +
 sound/soc/sof/amd/pci-acp63.c      | 1 +
 sound/soc/sof/amd/pci-rmb.c        | 1 +
 sound/soc/sof/amd/pci-rn.c         | 1 +
 6 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
index 66968efda869..072b703f9b3f 100644
--- a/sound/soc/sof/amd/acp-dsp-offset.h
+++ b/sound/soc/sof/amd/acp-dsp-offset.h
@@ -83,7 +83,8 @@
 #define ACP6X_AXI2DAGB_SEM_0			0x1874
 
 /* ACP common registers to report errors related to I2S & SoundWire interfaces */
-#define ACP_SW0_I2S_ERROR_REASON		0x18B4
+#define ACP3X_SW_I2S_ERROR_REASON		0x18C8
+#define ACP6X_SW0_I2S_ERROR_REASON		0x18B4
 #define ACP_SW1_I2S_ERROR_REASON		0x1A50
 
 /* Registers from ACP_SHA block */
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index d0b7d1c54248..9ce8b5ccb3d7 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -403,8 +403,9 @@ static irqreturn_t acp_irq_handler(int irq, void *dev_id)
 
 	if (val & ACP_ERROR_IRQ_MASK) {
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_ERROR_IRQ_MASK);
-		snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + ACP_SW0_I2S_ERROR_REASON, 0);
-		snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + ACP_SW1_I2S_ERROR_REASON, 0);
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_sw0_i2s_err_reason, 0);
+		if (adata->pci_rev >= ACP_RMB_PCI_ID)
+			snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SW1_I2S_ERROR_REASON, 0);
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_error_stat, 0);
 		irq_flag = 1;
 	}
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 6ac853ff6093..f6f0fcfeb691 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -204,6 +204,7 @@ struct sof_amd_acp_desc {
 	u32 reg_start_addr;
 	u32 reg_end_addr;
 	u32 acp_error_stat;
+	u32 acp_sw0_i2s_err_reason;
 	u32 sdw_max_link_count;
 	u64 sdw_acpi_dev_addr;
 };
diff --git a/sound/soc/sof/amd/pci-acp63.c b/sound/soc/sof/amd/pci-acp63.c
index c3da70549995..e90658ba2bd7 100644
--- a/sound/soc/sof/amd/pci-acp63.c
+++ b/sound/soc/sof/amd/pci-acp63.c
@@ -36,6 +36,7 @@ static const struct sof_amd_acp_desc acp63_chip_info = {
 	.ext_intr_stat	= ACP6X_EXT_INTR_STAT,
 	.ext_intr_stat1	= ACP6X_EXT_INTR_STAT1,
 	.acp_error_stat = ACP6X_ERROR_STATUS,
+	.acp_sw0_i2s_err_reason = ACP6X_SW0_I2S_ERROR_REASON,
 	.dsp_intr_base	= ACP6X_DSP_SW_INTR_BASE,
 	.sram_pte_offset = ACP6X_SRAM_PTE_OFFSET,
 	.hw_semaphore_offset = ACP6X_AXI2DAGB_SEM_0,
diff --git a/sound/soc/sof/amd/pci-rmb.c b/sound/soc/sof/amd/pci-rmb.c
index 194b7ff37e9e..a366f904e6f3 100644
--- a/sound/soc/sof/amd/pci-rmb.c
+++ b/sound/soc/sof/amd/pci-rmb.c
@@ -34,6 +34,7 @@ static const struct sof_amd_acp_desc rembrandt_chip_info = {
 	.ext_intr_stat	= ACP6X_EXT_INTR_STAT,
 	.dsp_intr_base	= ACP6X_DSP_SW_INTR_BASE,
 	.acp_error_stat = ACP6X_ERROR_STATUS,
+	.acp_sw0_i2s_err_reason = ACP6X_SW0_I2S_ERROR_REASON,
 	.sram_pte_offset = ACP6X_SRAM_PTE_OFFSET,
 	.hw_semaphore_offset = ACP6X_AXI2DAGB_SEM_0,
 	.fusion_dsp_offset = ACP6X_DSP_FUSION_RUNSTALL,
diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
index bff2d979ea6a..2b7c53470ce8 100644
--- a/sound/soc/sof/amd/pci-rn.c
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -34,6 +34,7 @@ static const struct sof_amd_acp_desc renoir_chip_info = {
 	.ext_intr_stat	= ACP3X_EXT_INTR_STAT,
 	.dsp_intr_base	= ACP3X_DSP_SW_INTR_BASE,
 	.acp_error_stat = ACP3X_ERROR_STATUS,
+	.acp_sw0_i2s_err_reason = ACP3X_SW_I2S_ERROR_REASON,
 	.sram_pte_offset = ACP3X_SRAM_PTE_OFFSET,
 	.hw_semaphore_offset = ACP3X_AXI2DAGB_SEM_0,
 	.acp_clkmux_sel	= ACP3X_CLKMUX_SEL,
-- 
2.34.1

