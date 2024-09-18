Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E2897B7D8
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2024 08:19:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B04EEA3;
	Wed, 18 Sep 2024 08:19:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B04EEA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726640385;
	bh=lOX1HUGFHBX1DNs2BNOg1eNej5qsVEYz7keCjTQ/4w4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O1OS1lDsUk4hiy2MkaDclBcygLauW2JAwsuEXKiUOalJnDdYqNIYxaQRXkZ6UqMdY
	 3LKy/jqDIvfT7TSQlQiM8I0ffZUz23+NnufDcmlJLJAzlj1bRJNVUJoJXsm7JPFNDG
	 qutJt7nQezu0MD5+aIGlYbIPqlvUDDsUek4Z9B9c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1D6CF805DA; Wed, 18 Sep 2024 08:19:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71A99F805DF;
	Wed, 18 Sep 2024 08:19:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16AA4F805CA; Wed, 18 Sep 2024 08:19:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2414::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4CEEF805D4
	for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2024 08:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4CEEF805D4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=meHYYsGv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJC3RCSLnBFmilItpYn+OjcIRo0zupsH6vMCJ3J74JdhPameRJnE/4ZVPbWs9lMLj9wFMw0uXWVmOZDonvTMhL1gLA65DmG3K6ogX25QmkZqpsNVyHIgLmyTwQt9AxH946C/k4lUizAyfRfG+0ZJSsqEJ6bXV554VB2O8q8MzRH4Ch7cS+VzKDawdO82A79TiQaMATgoTHKt8Wj5JKzmpOuHU/OI7dj8z/WIaCv6XMryMAaQ8obPEX5JPk9fqnXfcx4n1boYLzjWNOwZ4USzW01MA7EnB/s6Y34n3n7heISS9tc4VjijgPLNYTqzaC9SL19VRDVHSnm1PQd5gbiITg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5H0wI6+uJGaRPBAubRwJVI2iQJgonhHPTKDcye/8Cfo=;
 b=jjH20ZOmgntqFudEELwdIegb70L8W93/0Q/bq3NRF0M/RW5M3QftqV2DdvhK5tPWJzxOf3q/w98diTKHlGYQFAsTDjFdt9AYYNOwKtS8QC/bkEoLDpqFdJpWfWPxOkkhzNOEEDXGxpd/e05sdSgY98d+IB2o9lDwvo8Wp9TtD2NnGy/xPXq0CybROWa/xCdhe3KPN8mr4HtYCC2ly74rW5DQUzLcNjyYUJCGNDJA/gBWUcHG47r/558Q7q+0r5o1s/b8Ui5hQc60wpAzIU8YaA0sxF9LNMMwMRC2dOQm4qEz+kDzi1GwBZg8X8Q1lkAyMWw6ac0wtdI0BJytIs3DZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5H0wI6+uJGaRPBAubRwJVI2iQJgonhHPTKDcye/8Cfo=;
 b=meHYYsGvYJNx5RENepv05IyuxPDBWFTyfpv7PHyLmRqlLZs6H2XYTEEmqr6v6V5PCAOtiDHeUOOwL9hborSP8eDnEsGyazOtXdljCvSDlRxa8idG282nqAm1DcL4XDzF1M3vFi2PUUfeUamad9zum5KJboCFP3uOMZSWY1cF6as=
Received: from PH8PR07CA0043.namprd07.prod.outlook.com (2603:10b6:510:2cf::28)
 by CH3PR12MB7740.namprd12.prod.outlook.com (2603:10b6:610:145::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 06:19:01 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::76) by PH8PR07CA0043.outlook.office365.com
 (2603:10b6:510:2cf::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 06:19:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 06:19:01 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 01:18:40 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 3/8] ASoC: amd: acp: use acp pci revision id for platform
 differntiation
Date: Wed, 18 Sep 2024 11:45:35 +0530
Message-ID: <20240918061540.685579-4-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918061540.685579-1-Vijendar.Mukunda@amd.com>
References: <20240918061540.685579-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|CH3PR12MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: 3acdcbf9-8af4-46bb-c2bb-08dcd7a9c98d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sX5A6ZY0fsT8CK/GahpSyDRNhWZDRji7hmCSSniApNoDwwLFPPWCIDqFoJr+?=
 =?us-ascii?Q?eZYUb6/KkvofIfV981WMxuH91e5gPHEv2WQXFFxcKczoyld021/aB5BQV+7H?=
 =?us-ascii?Q?zZPi7elFtey/Lj+gZEdbaqhtr+R8thbhYuanMJZH6iyU+cUdfVvFxvVma7h/?=
 =?us-ascii?Q?Kv5l5HUM9GWQ7uHchqjNEtT7QIzQtQ+x+3h3OgkgOowd2ao5SlLVsYseKvBg?=
 =?us-ascii?Q?ZbxmWJg90d9/A3vl5ZASUJ3oHOpkFLxyDcMaIzhshH04zpKOnReXz88fFiWf?=
 =?us-ascii?Q?ZHo8/o8ytcq9QML9ILyMFfzex00LZbZVQOfYzch/NyRzQ+Keq4YUWzuS3UT9?=
 =?us-ascii?Q?LQ4Ilbb9HpMG/4Ze0omUOwWYJbSZc7W79iHLeSCnKlg30OmTYn1WuSCrwgaW?=
 =?us-ascii?Q?9xp0n9gSa/+AnbF3S7wS9DYMavfRmRLBMJJN26kaCaS5JXlmwLyGaOURm+rP?=
 =?us-ascii?Q?yyJeynPTLCCuH50Hjpn9Lafa71oMziE5oL1J8QiV25fLueWPpP3zvN9DzQPG?=
 =?us-ascii?Q?quCMem6NRNgKAiik66WiWAxGA522/XA/ePckRBtHPQYjQRUQjN+9JOG/pXuU?=
 =?us-ascii?Q?NcihqgN8Ldhqu289A7pYg04ASqeu86Vywxqu9ykgnm6WRMJx67iv3PwKIaMs?=
 =?us-ascii?Q?PwG/1vMJJSczfnujjxnPmZwZtPabtL6SXQeybNKmnnE49arJLTHRH61Ib2ps?=
 =?us-ascii?Q?ZeXtKMqTwhnZQsB6Fqjq59eiEA21ilwZ2Z7J8Np9EAuVmj/S2kk6Gf2dv9RK?=
 =?us-ascii?Q?oVlTK2+AzV9rd7GMy684fqXRlZ38qndaqSbNdq3Xd3pdgTDsmgLanxDTLsGy?=
 =?us-ascii?Q?P8uqH34vi4GmDB9r39jQDkQuXAusSkSfr4aNImpJh+PG0om5Bhp06y5MA3W0?=
 =?us-ascii?Q?IFyG3ZIwJinUOlFG9SojzFFjQWcWZtEgGdw+6XcyZxnkALIT/FIiSjOl60dW?=
 =?us-ascii?Q?hrykiF1wYvM6pIZlIcIE3hL3hUnarz5e6hwquJbRcl4dvA8qrehoobOW45X/?=
 =?us-ascii?Q?NRS0GQMVHqebpGDDtgqXwsTzekz3GyKL0DIXY1FRellOx7RtitGs2xkkIOKM?=
 =?us-ascii?Q?U9QogTRwVh9a6ifXZePZ0iElERWVXB+25wCFh2Tne+4FpLqw8C+n9BuJlvqf?=
 =?us-ascii?Q?iDlwq2MFv77Z//3pteOEaf/lL2lNILag60yQ4KkKaNkZDoYZ1aTCdePYFRff?=
 =?us-ascii?Q?aAYifBcPKxSNrwS03g77YEe0ciZx7qDv4eXDq42vjSL5n4lL+kggiqZUFzMs?=
 =?us-ascii?Q?vuhab+MnARQfFhlpxLdemBQgeXl8Upc9Go2Wx2Y1I/TWdX5yece/uz13cw+P?=
 =?us-ascii?Q?6KbMNz8dDIsSBG4xLVDoHtP8y1IYp0Kd4/5cydOFRmqfceEkSxApFlZPiCsM?=
 =?us-ascii?Q?WSDtH12s61SQ53v9Eepm2PTlBFIJuVJrbYVJhvau1HEYI0POvovGu0f2inTA?=
 =?us-ascii?Q?UaIcKeHoOI+RKPrwzm0BseI5FvBvPGsk?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 06:19:01.0098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3acdcbf9-8af4-46bb-c2bb-08dcd7a9c98d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7740
Message-ID-Hash: WCJV56RV5Y7QA6PXE5PFRUNMDT3B6XHW
X-Message-ID-Hash: WCJV56RV5Y7QA6PXE5PFRUNMDT3B6XHW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WCJV56RV5Y7QA6PXE5PFRUNMDT3B6XHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Store acp pci revision id value in 'acp_rev' variable.
Use common ACP PCI revision id macros throughout the code for acp_rev
check and remove unused macros for platform differentiation from
common header file for acp platform driver.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c           | 38 +++++++++++++--------------
 sound/soc/amd/acp/acp-legacy-common.c | 24 ++++++++---------
 sound/soc/amd/acp/acp-pci.c           |  7 +----
 sound/soc/amd/acp/acp-pdm.c           |  2 +-
 sound/soc/amd/acp/acp-platform.c      |  6 ++---
 sound/soc/amd/acp/acp-rembrandt.c     |  2 +-
 sound/soc/amd/acp/acp-renoir.c        |  2 +-
 sound/soc/amd/acp/acp63.c             |  2 +-
 sound/soc/amd/acp/acp70.c             |  6 ++---
 sound/soc/amd/acp/amd.h               |  7 +----
 10 files changed, 43 insertions(+), 53 deletions(-)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 56ce9e4b6acc..515bf862deb5 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -59,9 +59,9 @@ static inline void acp_set_i2s_clk(struct acp_dev_data *adata, int dai_id)
 		val |= BIT(1);
 
 	switch (chip->acp_rev) {
-	case ACP63_DEV:
-	case ACP70_DEV:
-	case ACP71_DEV:
+	case ACP63_PCI_ID:
+	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		val |= FIELD_PREP(ACP63_LRCLK_DIV_FIELD, adata->lrclk_div);
 		val |= FIELD_PREP(ACP63_BCLK_DIV_FIELD, adata->bclk_div);
 		break;
@@ -121,8 +121,8 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 	}
 
 	switch (chip->acp_rev) {
-	case ACP3X_DEV:
-	case ACP6X_DEV:
+	case ACP_RN_PCI_ID:
+	case ACP_RMB_PCI_ID:
 		switch (slots) {
 		case 1 ... 7:
 			no_of_slots = slots;
@@ -135,9 +135,9 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 			return -EINVAL;
 		}
 		break;
-	case ACP63_DEV:
-	case ACP70_DEV:
-	case ACP71_DEV:
+	case ACP63_PCI_ID:
+	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		switch (slots) {
 		case 1 ... 31:
 			no_of_slots = slots;
@@ -160,8 +160,8 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 	spin_lock_irq(&adata->acp_lock);
 	list_for_each_entry(stream, &adata->stream_list, list) {
 		switch (chip->acp_rev) {
-		case ACP3X_DEV:
-		case ACP6X_DEV:
+		case ACP_RN_PCI_ID:
+		case ACP_RMB_PCI_ID:
 			if (tx_mask && stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
 				adata->tdm_tx_fmt[stream->dai_id - 1] =
 					FRM_LEN | (slots << 15) | (slot_len << 18);
@@ -169,9 +169,9 @@ static int acp_i2s_set_tdm_slot(struct snd_soc_dai *dai, u32 tx_mask, u32 rx_mas
 				adata->tdm_rx_fmt[stream->dai_id - 1] =
 					FRM_LEN | (slots << 15) | (slot_len << 18);
 			break;
-		case ACP63_DEV:
-		case ACP70_DEV:
-		case ACP71_DEV:
+		case ACP63_PCI_ID:
+		case ACP70_PCI_ID:
+		case ACP71_PCI_ID:
 			if (tx_mask && stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
 				adata->tdm_tx_fmt[stream->dai_id - 1] =
 						FRM_LEN | (slots << 13) | (slot_len << 18);
@@ -534,7 +534,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			reg_fifo_addr =	ACP_I2S_TX_FIFOADDR(adata);
 			reg_fifo_size = ACP_I2S_TX_FIFOSIZE(adata);
 
-			if (chip->acp_rev >= ACP70_DEV)
+			if (chip->acp_rev >= ACP70_PCI_ID)
 				phy_addr = ACP7x_I2S_SP_TX_MEM_WINDOW_START;
 			else
 				phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
@@ -546,7 +546,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			reg_fifo_addr = ACP_I2S_RX_FIFOADDR(adata);
 			reg_fifo_size = ACP_I2S_RX_FIFOSIZE(adata);
 
-			if (chip->acp_rev >= ACP70_DEV)
+			if (chip->acp_rev >= ACP70_PCI_ID)
 				phy_addr = ACP7x_I2S_SP_RX_MEM_WINDOW_START;
 			else
 				phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
@@ -561,7 +561,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			reg_fifo_addr = ACP_BT_TX_FIFOADDR(adata);
 			reg_fifo_size = ACP_BT_TX_FIFOSIZE(adata);
 
-			if (chip->acp_rev >= ACP70_DEV)
+			if (chip->acp_rev >= ACP70_PCI_ID)
 				phy_addr = ACP7x_I2S_BT_TX_MEM_WINDOW_START;
 			else
 				phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
@@ -573,7 +573,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			reg_fifo_addr = ACP_BT_RX_FIFOADDR(adata);
 			reg_fifo_size = ACP_BT_RX_FIFOSIZE(adata);
 
-			if (chip->acp_rev >= ACP70_DEV)
+			if (chip->acp_rev >= ACP70_PCI_ID)
 				phy_addr = ACP7x_I2S_BT_RX_MEM_WINDOW_START;
 			else
 				phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
@@ -588,7 +588,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			reg_fifo_addr = ACP_HS_TX_FIFOADDR;
 			reg_fifo_size = ACP_HS_TX_FIFOSIZE;
 
-			if (chip->acp_rev >= ACP70_DEV)
+			if (chip->acp_rev >= ACP70_PCI_ID)
 				phy_addr = ACP7x_I2S_HS_TX_MEM_WINDOW_START;
 			else
 				phy_addr = I2S_HS_TX_MEM_WINDOW_START + stream->reg_offset;
@@ -600,7 +600,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			reg_fifo_addr = ACP_HS_RX_FIFOADDR;
 			reg_fifo_size = ACP_HS_RX_FIFOSIZE;
 
-			if (chip->acp_rev >= ACP70_DEV)
+			if (chip->acp_rev >= ACP70_PCI_ID)
 				phy_addr = ACP7x_I2S_HS_RX_MEM_WINDOW_START;
 			else
 				phy_addr = I2S_HS_RX_MEM_WINDOW_START + stream->reg_offset;
diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index be01b178172e..3f76d1f0a9e7 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -257,20 +257,20 @@ static int acp_power_on(struct acp_chip_info *chip)
 
 	base = chip->base;
 	switch (chip->acp_rev) {
-	case ACP3X_DEV:
+	case ACP_RN_PCI_ID:
 		acp_pgfsm_stat_reg = ACP_PGFSM_STATUS;
 		acp_pgfsm_ctrl_reg = ACP_PGFSM_CONTROL;
 		break;
-	case ACP6X_DEV:
+	case ACP_RMB_PCI_ID:
 		acp_pgfsm_stat_reg = ACP6X_PGFSM_STATUS;
 		acp_pgfsm_ctrl_reg = ACP6X_PGFSM_CONTROL;
 		break;
-	case ACP63_DEV:
+	case ACP63_PCI_ID:
 		acp_pgfsm_stat_reg = ACP63_PGFSM_STATUS;
 		acp_pgfsm_ctrl_reg = ACP63_PGFSM_CONTROL;
 		break;
-	case ACP70_DEV:
-	case ACP71_DEV:
+	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		acp_pgfsm_stat_reg = ACP70_PGFSM_STATUS;
 		acp_pgfsm_ctrl_reg = ACP70_PGFSM_CONTROL;
 		break;
@@ -322,7 +322,7 @@ int acp_init(struct acp_chip_info *chip)
 		pr_err("ACP reset failed\n");
 		return ret;
 	}
-	if (chip->acp_rev >= ACP70_DEV)
+	if (chip->acp_rev >= ACP70_PCI_ID)
 		writel(0, chip->base + ACP_ZSC_DSP_CTRL);
 	return 0;
 }
@@ -337,7 +337,7 @@ int acp_deinit(struct acp_chip_info *chip)
 	if (ret)
 		return ret;
 
-	if (chip->acp_rev < ACP70_DEV)
+	if (chip->acp_rev < ACP70_PCI_ID)
 		writel(0, chip->base + ACP_CONTROL);
 	else
 		writel(0x01, chip->base + ACP_ZSC_DSP_CTRL);
@@ -448,20 +448,20 @@ void check_acp_config(struct pci_dev *pci, struct acp_chip_info *chip)
 	u32 pdm_addr;
 
 	switch (chip->acp_rev) {
-	case ACP3X_DEV:
+	case ACP_RN_PCI_ID:
 		pdm_addr = ACP_RENOIR_PDM_ADDR;
 		check_acp3x_config(chip);
 		break;
-	case ACP6X_DEV:
+	case ACP_RMB_PCI_ID:
 		pdm_addr = ACP_REMBRANDT_PDM_ADDR;
 		check_acp6x_config(chip);
 		break;
-	case ACP63_DEV:
+	case ACP63_PCI_ID:
 		pdm_addr = ACP63_PDM_ADDR;
 		check_acp6x_config(chip);
 		break;
-	case ACP70_DEV:
-	case ACP71_DEV:
+	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		pdm_addr = ACP70_PDM_ADDR;
 		check_acp70_config(chip);
 		break;
diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index f7450a5bd103..4b6ad7abc3ba 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -77,27 +77,22 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 
 	res_acp = acp_res;
 	num_res = ARRAY_SIZE(acp_res);
-
+	chip->acp_rev = pci->revision;
 	switch (pci->revision) {
 	case 0x01:
 		chip->name = "acp_asoc_renoir";
-		chip->acp_rev = ACP3X_DEV;
 		break;
 	case 0x6f:
 		chip->name = "acp_asoc_rembrandt";
-		chip->acp_rev = ACP6X_DEV;
 		break;
 	case 0x63:
 		chip->name = "acp_asoc_acp63";
-		chip->acp_rev = ACP63_DEV;
 		break;
 	case 0x70:
 		chip->name = "acp_asoc_acp70";
-		chip->acp_rev = ACP70_DEV;
 		break;
 	case 0x71:
 		chip->name = "acp_asoc_acp70";
-		chip->acp_rev = ACP71_DEV;
 		break;
 	default:
 		dev_err(dev, "Unsupported device revision:0x%x\n", pci->revision);
diff --git a/sound/soc/amd/acp/acp-pdm.c b/sound/soc/amd/acp/acp-pdm.c
index 22dd8988d005..48faafe724ed 100644
--- a/sound/soc/amd/acp/acp-pdm.c
+++ b/sound/soc/amd/acp/acp-pdm.c
@@ -47,7 +47,7 @@ static int acp_dmic_prepare(struct snd_pcm_substream *substream,
 	size_dmic = frames_to_bytes(substream->runtime,
 			substream->runtime->buffer_size);
 
-	if (chip->acp_rev >= ACP70_DEV)
+	if (chip->acp_rev >= ACP70_PCI_ID)
 		physical_addr = ACP7x_DMIC_MEM_WINDOW_START;
 	else
 		physical_addr = stream->reg_offset + MEM_WINDOW_START;
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 3a7a467b7063..c772520227c7 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -270,9 +270,9 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 	stream->substream = substream;
 	chip = dev_get_platdata(dev);
 	switch (chip->acp_rev) {
-	case ACP63_DEV:
-	case ACP70_DEV:
-	case ACP71_DEV:
+	case ACP63_PCI_ID:
+	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			runtime->hw = acp6x_pcm_hardware_playback;
 		else
diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index 396434a45eea..af6005888c82 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -197,7 +197,7 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	if (chip->acp_rev != ACP6X_DEV) {
+	if (chip->acp_rev != ACP_RMB_PCI_ID) {
 		dev_err(&pdev->dev, "Un-supported ACP Revision %d\n", chip->acp_rev);
 		return -ENODEV;
 	}
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index 5e3f730aa6bf..65782023435e 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -157,7 +157,7 @@ static int renoir_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	if (chip->acp_rev != ACP3X_DEV) {
+	if (chip->acp_rev != ACP_RN_PCI_ID) {
 		dev_err(&pdev->dev, "Un-supported ACP Revision %d\n", chip->acp_rev);
 		return -ENODEV;
 	}
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index f325c374f228..099e2df5558d 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -207,7 +207,7 @@ static int acp63_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	if (chip->acp_rev != ACP63_DEV) {
+	if (chip->acp_rev != ACP63_PCI_ID) {
 		dev_err(&pdev->dev, "Un-supported ACP Revision %d\n", chip->acp_rev);
 		return -ENODEV;
 	}
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index 68d2590e1a4e..0cd3daf677f5 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -175,8 +175,8 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 	}
 
 	switch (chip->acp_rev) {
-	case ACP70_DEV:
-	case ACP71_DEV:
+	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		break;
 	default:
 		dev_err(&pdev->dev, "Un-supported ACP Revision %d\n", chip->acp_rev);
@@ -209,7 +209,7 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 	adata->num_dai = ARRAY_SIZE(acp70_dai);
 	adata->rsrc = &rsrc;
 	adata->machines = snd_soc_acpi_amd_acp70_acp_machines;
-	if (chip->acp_rev == ACP70_DEV)
+	if (chip->acp_rev == ACP70_PCI_ID)
 		adata->platform = ACP70;
 	else
 		adata->platform = ACP71;
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 854269fea875..c82e438a1712 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -16,14 +16,9 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-dai.h>
 
+#include "acp_common.h"
 #include "chip_offset_byte.h"
 
-#define ACP3X_DEV			3
-#define ACP6X_DEV			6
-#define ACP63_DEV			0x63
-#define ACP70_DEV			0x70
-#define ACP71_DEV			0x71
-
 #define DMIC_INSTANCE			0x00
 #define I2S_SP_INSTANCE			0x01
 #define I2S_BT_INSTANCE			0x02
-- 
2.34.1

