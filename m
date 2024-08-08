Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB5B94C431
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2024 20:20:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFBA3832;
	Thu,  8 Aug 2024 20:20:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFBA3832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723141258;
	bh=EYvWmbwapxhXRrApxnPn19zusiErRpPzHSu/Ib9cSag=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m72nwMyKjO3xU5/UlOfQxw2lyKZw1i44VsouLQdTV0oN5gyJaL5DKOSk7KXHINxLg
	 0z7CowijVP1+bpD6CxR/3TW3C2lbQgeUDdHkSMMggXtTNQzAD2QzCRPZGRCy4K0opR
	 IQfbZI0kFcnFC1eQQiOl/e1IFvc+/4Wc7jLxz32c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4EB7F8058C; Thu,  8 Aug 2024 20:20:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46F27F805A0;
	Thu,  8 Aug 2024 20:20:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A9D9F8047C; Thu,  8 Aug 2024 18:58:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58F67F8023A;
	Thu,  8 Aug 2024 18:58:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58F67F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=kRRu9WCc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qwnfuz5yElhw6mV0bvuexrXU8ivrXLXvxAGMZGNTQs1pQPKvXMD6FNSJNwCWjzCYEgqcDzgf3Gazer6uXG8dn/cFk9qypARo/9tJnNHfdgyXwIO3VRADBdZMWyeosF3L5wsoraWIqPfYUy/Yb7vZhf5Sj4wVUJShv64gx6Me/x0dWe54cKM4sS2lvrDqR2RtLeAVBz/LT86hIwl5hAaFhgLX37J/otQvMWesrMVj1DJMVxDxx5lnyaY6kP4npBC7E2eVCTP+AOCICn5m4vBGYHzg4YdaEgThTrvpC4eIRkAxC1jnOQsrvyA1Npo/L6svsqq6SBz7jtdcXtxHGYbhbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niKGXD7RG6SLE2Z/Fkk9hOW6fVU5W+mLoOggWoOsWho=;
 b=S0m823CM9mj/eShNj5rJ5mucYgDZ6m0HRzNYa5ULKEuU3U+zpHbIvcTtXpWR5Kn09/5v6/ParL1BUOHh0S9gk72FJxMtn0+iaynkY7WV9ck5fuV9KVnIZZJx+x19UfoswdAYhFg4ilr9LRv392ZWMCkxohFnbi6uNim9b+heaFZnPlAZ76xE5/Yt7xDKemH2ZORGG+8TBel5ryogcOTI8rR6T96ny1XhiWzsVIiIxm4q8STst0uU+c/lHase30IIDjA0hPqewdwKp2zdKVTbJZWS1d4K/7qYsuTD5ULjN6JwyuS+6IaTf4H1ss3MY+ECVJheAqVNRDFMJ51yQ1vhHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niKGXD7RG6SLE2Z/Fkk9hOW6fVU5W+mLoOggWoOsWho=;
 b=kRRu9WCca24vJNKhz4SbtYMxvKbM6JHTtC5FtDNMs4x/GbGVJymYWzatDabiQurjUTi+NKvFCx1vsrQqEBjg6M253ReXVOyiohNPGbJ22jNs9A5hxVsz3j91tftdUxdKd6TVCrFzRcNnVhl7KQfsnExKowkwnPtqLdd2dNCZwC4=
Received: from MN2PR02CA0014.namprd02.prod.outlook.com (2603:10b6:208:fc::27)
 by LV2PR12MB6013.namprd12.prod.outlook.com (2603:10b6:408:171::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14; Thu, 8 Aug
 2024 16:58:22 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:fc:cafe::73) by MN2PR02CA0014.outlook.office365.com
 (2603:10b6:208:fc::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.14 via Frontend
 Transport; Thu, 8 Aug 2024 16:58:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Thu, 8 Aug 2024 16:58:22 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 11:58:16 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <sound-open-firmware@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<pierre-louis.bossart@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
	<ranjani.sridharan@linux.intel.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<lgirdwood@gmail.com>, <kai.vehmanen@linux.intel.com>,
	<daniel.baluta@nxp.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<cristian.ciocaltea@collabora.com>, Vijendar Mukunda
	<Vijendar.Mukunda@amd.com>
Subject: [PATCH RESEND 2/8] ASoC: SOF: amd: fix for acp error reason registers
 wrong offset
Date: Thu, 8 Aug 2024 22:27:47 +0530
Message-ID: <20240808165753.3414464-3-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240808165753.3414464-1-Vijendar.Mukunda@amd.com>
References: <20240808165753.3414464-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|LV2PR12MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: e86d17f8-a62c-4aa7-c532-08dcb7cb4fbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rWAr5VKk+KWbFce8IMSz+i4KwU2RGqaJrqIofG1oaJ0EvWi3Euwpq1PrJda3?=
 =?us-ascii?Q?3lGc8yyFxBw2nw53iLa8ZBtagY4aS4rk++lcOHzxWqlwbtlrrgk35NxVAtlH?=
 =?us-ascii?Q?c7unmD7KT1MXw4GsB1bzzrM3icCQ8bkCr8a1Ao4pQPkDslmMx2WZ6fu50SZl?=
 =?us-ascii?Q?Y/V7YLQ8jLGjB9kdtuiX3Ib2GeftnQnJ0LPahNGtt3KyQYQdGbmlAZBWGNTU?=
 =?us-ascii?Q?Q4S2ToDLyMrKWk8o+PuCAdXkqIa8enJ7vzIGAutfsvKzai6gE7QGxgmiKQ4R?=
 =?us-ascii?Q?CNcy2RBDa9/tlTh7eP7KyqaNCZPVrZ9UAst4ugl8Nb3hAGlz9IAOt2JjHYS6?=
 =?us-ascii?Q?uEmYL2iax3Rpz7Pgl292q6qDEGFLQuZs5Lu9JNvLz1xHork8+GK1sfq0+szj?=
 =?us-ascii?Q?XSGolN9ETLnMY83kRkxCaMpIONATRVSwftUB//LFHesd4NxU1lGDAyhFwFmj?=
 =?us-ascii?Q?Xwj2GXNdEJgVvnsSjcb1/3doRp8cJhxUggUUiG6HNikId/LDAuPJx6jiegP1?=
 =?us-ascii?Q?SlRANrnhwJlkkS759HD+sbrXeIEqueWv/WbO+sy0/CoFrZp7M0uf6V9I9q+j?=
 =?us-ascii?Q?73AqqOvapszGRtjqS+VvITX3z72yTn56TPGDCsefPS1kE6G6tzVoQO5GJ1QW?=
 =?us-ascii?Q?TFDxUNWjSig8I6c8XRHRmrkOO0Ep+N1EQQUi6jYbfZVr8rkhHQDS3wDbBV9+?=
 =?us-ascii?Q?ap+kgUZzHRqtcHPm39D2OtIw2I1T/g2qo88pMZQY0+hUdQeCrYwnJ1nGnL2e?=
 =?us-ascii?Q?Ye8W7SxDThoLk9NP7rSH1IPkZPyBudSmo/friakchdwYvaVuGWzvg2Bw5pA6?=
 =?us-ascii?Q?V0vVXgGZebOmxZ+SfsbEIpk2AM0XoG9/hvuTOuV105gvk0izEFdk55Y4RyNQ?=
 =?us-ascii?Q?cwUIVvNcbs/+sj/bOH5D5K2QKZNiFC2i/G7SfoGtYIW2hJIZLc6SEHiJ+Dyc?=
 =?us-ascii?Q?ohb5yow44XcXZZJM04oV183MsUN7TMDQVRCzS0ZylffagoeIoLm9K+oS2qTD?=
 =?us-ascii?Q?gMGQqccsYrIahq57pBjc6Pcs29R2tLPMJmgxo4hUXKvqlEsEIWR/NE+M4qg4?=
 =?us-ascii?Q?DW/eGghe6xO2YKJdjsTNIAPrhK0CChZq9mpu3yGOvuKlofaOOfs6tUc+/KSP?=
 =?us-ascii?Q?qALw3gG1oUwdccpBtSDFoGa67t3ea5f0l6irl2ggs03ITEHOH5QpTHIt+rAF?=
 =?us-ascii?Q?FT9CIOCnqPT7qS/7XRQ6Kq71asyLAeC7S9sXWgA2JJKhhHrfO31hJy/bfQls?=
 =?us-ascii?Q?tUbCFk7K1oRCkzCfPFEH04HZIcseZYsvGMnhlqYMFVv63XxTZeq0QSw5p6ge?=
 =?us-ascii?Q?Fj0gL4y0hZmkpCB5wTVTBNcRpjgrURDt2/91vuEAcLKC4h20IOY21HaExNaV?=
 =?us-ascii?Q?e9GOzAzucZIx9LtKNStdVhkUnU/aoI03Zq5BppW9vk+gyx9JzrPtdZl5c9Hs?=
 =?us-ascii?Q?cMk+Jd0uUTDG2YpnxmwXtwf6PohHtnVx?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 16:58:22.3067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e86d17f8-a62c-4aa7-c532-08dcb7cb4fbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6013
Message-ID-Hash: 7ZFRSZAJEHCPMFIV4FKQFZEWENUP5ZZT
X-Message-ID-Hash: 7ZFRSZAJEHCPMFIV4FKQFZEWENUP5ZZT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ZFRSZAJEHCPMFIV4FKQFZEWENUP5ZZT/>
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

