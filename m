Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD55CB00FB
	for <lists+alsa-devel@lfdr.de>; Tue, 09 Dec 2025 14:31:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17D47601FD;
	Tue,  9 Dec 2025 14:31:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17D47601FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765287079;
	bh=2woq6sYaAyVBsYRQJy8h720HN2n+4Kj6rGcsFUW/4wY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vrohCRb1UhQY/OHuFOJklsg3wBVPVopT1ER/B1Ah1zd8kYJbUO4dmUN9YuMdXyXG0
	 SVxzf/4vzk59N8v4Fkdv4/vMS5a0hjP5Oy8pNNeJy1ok/A75Hjbg1HyU5AbGIHwiOr
	 inwx/HudUqTyoQxxQQNH2uvZPctihljiWf3e1cBM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F252F8062E; Tue,  9 Dec 2025 14:30:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA264F80671;
	Tue,  9 Dec 2025 14:30:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D64EF8051D; Wed,  3 Dec 2025 07:47:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,KHOP_HELO_FCRDNS,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012006.outbound.protection.outlook.com
 [40.107.200.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF1ECF800BA
	for <alsa-devel@alsa-project.org>; Wed,  3 Dec 2025 07:47:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF1ECF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=E0qVHS3z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ibvo6lRQwBOwUiip4a02iEinCjS5/yoZIGVSMyhuRsEpRXx4qkmi5Cu7rKxMzeGiQuaPk2KHnRAcC19mD1IoD3xYeR5fXYtLIb9YEm6Ty3pSYpzJA/jcF/xQOp3eXRpuWhSlKgGnod3TOcjwjTjscrGTA5gZkib8fSM67hVQB9mfwL3eBK/NMEKmqnAfPtGeOeZ166QvdzM0fEABoCraPymK0pRcf5eSUEYwydPeGDMFCd4RRtI87lFiiMYjYelTtRTrBT5fsZTORYg30u5IK4gz0Kju7EcyEzPnVWGLz154mXklSYGGgxWvgYzf763+MceF6+2nHEKvHITR628yCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPcFtkW1J0OsPs3G9sfrXaQn/tWjQvqZTRHPlZaJYxI=;
 b=iO7OjQM09T81WwL6VIikCPIiOlgjzamkTeCQR4gDCUou/4/0B3Y1SVYCslc/gDyhVvD+bisRGChujaezIczygBQRN8Tn8h+qbpIiGXrss+gKvjpb7paHcHctIseur0gTnzQQzkAxONX6YYtJl/710CcoPzjxzfj0boNXeFbDHGYZu6+o86hj7+dEP/toAQkJpv6tAOSfEOb/6wH0lCCwFpQoUvdjPMv1bGid8LCxjxvnc0Pq8BXuScEbvXMCFPfYue8RLsfBGZQfYTdwPcAop5gmGSvUg3WXK/4fvaHmrtBD4NjrPRjpIO8JAFuGnKy3ltOKUg5YDS7EuX1Oj4ONdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPcFtkW1J0OsPs3G9sfrXaQn/tWjQvqZTRHPlZaJYxI=;
 b=E0qVHS3zwxmRFaqmZp2qa3Ce8RHmTDtxM7xey+I3/A/DKm9eAWkHZ5hl3f+mOwLkx6pzowcq5vnVHETmszHS6JJZde9VyKIqFMpH1Env1FkVpKELY5jHu0mZ/T6hF9OmTGRxqyNasCWfWRa6jyiyPMdnxDwtAYXKXwsb8Lf2Pss=
Received: from SA0PR11CA0026.namprd11.prod.outlook.com (2603:10b6:806:d3::31)
 by MW3PR12MB4346.namprd12.prod.outlook.com (2603:10b6:303:58::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 06:46:55 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:806:d3:cafe::ad) by SA0PR11CA0026.outlook.office365.com
 (2603:10b6:806:d3::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 06:46:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 06:46:55 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 00:46:54 -0600
Received: from drvdevbldsrv2.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 2 Dec 2025 22:46:51 -0800
From: Raghavendra Prasad Mallela <raghavendraprasad.mallela@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, Hemalatha Pinnamreddy
	<hemalatha.pinnamreddy2@amd.com>, Raghavendra Prasad Mallela
	<raghavendraprasad.mallela@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Venkata
 Prasad Potturu" <venkataprasad.potturu@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] ASoC: amd: acp: Audio is not resuming after s0ix
Date: Wed, 3 Dec 2025 12:16:48 +0530
Message-ID: <20251203064650.2554625-1-raghavendraprasad.mallela@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|MW3PR12MB4346:EE_
X-MS-Office365-Filtering-Correlation-Id: cc7787e1-7e05-4cfa-045d-08de3237bf99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/4oNijRp9FbHRHU9eLvsNeE3DA8+g6Lih5TTjsT8d4D2azCswGnYYsKj9taq?=
 =?us-ascii?Q?OSaXH8oN1TypS/MDs9CI+mM3wu6VMUp0UkhqYytkuM+N7DxeU2a6LM4oD2W0?=
 =?us-ascii?Q?8WoC8GGTKa9A2bkNcxPv7e2QNu9iC8wQqq6+4gyjogLFqXIjkzGS3lPdHeHc?=
 =?us-ascii?Q?6crB3n0ZPG8kM8p/UnPGgBq1yG/xv16q8oyCd62T+kOBUql9t07rZK+OGNaF?=
 =?us-ascii?Q?SxBPorory5vGDoeuEeqbLF13fDWT6Tklj9kjvPZUG9gp/Y7DCc5VAYK7XMbE?=
 =?us-ascii?Q?icIow47D1vBmGY8XuIf1Zew69i70g6ooH4his0th/PftnY8ArnHknqxPkwzF?=
 =?us-ascii?Q?1N7BG+okZ+xeJ1AFMwSImBpBFvpUR4pu5h3egH3rjgo6cb72G43Id9tAKrU3?=
 =?us-ascii?Q?Nb7D/rI83CMZJyYC78iuX+2eFENT5C8l133GL4krqaQfZbIibEKSD64eu/uH?=
 =?us-ascii?Q?52AasoRZSAPpZSatoV/SZZbLlGPpeaYKeW8Ohb/2M3+mK43zcw41CTusBVmS?=
 =?us-ascii?Q?pSrOCarQTzomp91ZAfQvw4IMrxgQs8XmYLfw+8i+cWTb+11oefvG0BCGGMLe?=
 =?us-ascii?Q?hChGiFSXGBQcxM5QYUxo8xRNMEvLd8jhxslqOxKkPusRBRBEGJd/H/rpCiaj?=
 =?us-ascii?Q?WVyrKGkXBoGOV2B2ZLnjOoR7sQ6wJVvhNl1hl/u2LeiyjxzhU0rLw1YQAtrF?=
 =?us-ascii?Q?Neyjc5o3tijLr5XfPthdfO/JEgkjPoZvEoiU72EmKQeBLyBztj+PCMfs+new?=
 =?us-ascii?Q?xM69dOGmtSdnMk87LYRawETJTh5GUGisuhQv3Ubs/S6xMlzylw4rAOXE6u6z?=
 =?us-ascii?Q?Z+GcSUpsTA3RePuRy1sp02QRlFHd7yrokVhQYeIjNHMW6sCE1tUuHj61xyQx?=
 =?us-ascii?Q?36WBzPKLB8sIA1n2Y3mU3aN3rJoALj6iv0GNfqJqzOyznSVXLStYHEIldWbD?=
 =?us-ascii?Q?MJoP5s1awEmGDgxTJuNzn779FGi6H5NkMkdczCNv4HqtfrJALJ7/ylVIBH+K?=
 =?us-ascii?Q?FDsN/TuRGlrQqnk9Ikxt8B1rVc6pvyQf3wqiJLtm9e5gsPCFToGEmN1NBiqS?=
 =?us-ascii?Q?xDrh65jftCaVWQwWgt7/4PVgjD1N33uvDMw7fv7Krk+CrSYgpRLdh7h8rqKj?=
 =?us-ascii?Q?O2IWUv/9YdS68/m++UkJLXufgXtLfvDgfCSJj7rczERidTEofDvLvK2R6Tdy?=
 =?us-ascii?Q?3QcnR5/2ey7Zp/b2QLnNDMeVMawcQQ8RYJSqkGZwuXdg1Jcxc7ZpRuS2ZKOL?=
 =?us-ascii?Q?JrLtuOBHe9rSq8RBrb5cZjldd+yoKpcQKcFIaF7P1e+UW/YNiyi8h1huj2MH?=
 =?us-ascii?Q?hcdkwzdLttu5akGuRUSAOWFYg5qHHKCwWcDh2mM5RZAeHSfhXJb+x6YbkTFt?=
 =?us-ascii?Q?yB27D3MQRYi+NG07po1QTjo0qeOt9KjBHFa4q+Bio80YlbQYaRV0Ik8kweXk?=
 =?us-ascii?Q?odmVLKgXLsAeAfOb8rTxnOTZsILiETUkG8XuiPjXyHQ9Z/9X8FhUvGHjp9JU?=
 =?us-ascii?Q?jWAsgcejJddmgUcCIzEmSjBkSNPTVlz5eJ3ulLHeSTuLk+3WnYQlOuwsF46b?=
 =?us-ascii?Q?iaPhTh2xXdEmg4BRPPE=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:46:55.1626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cc7787e1-7e05-4cfa-045d-08de3237bf99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4346
X-MailFrom: RaghavendraPrasad.Mallela@amd.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RIWBWYIIESW43W5S2SHVXTXLOLFLQR6B
X-Message-ID-Hash: RIWBWYIIESW43W5S2SHVXTXLOLFLQR6B
X-Mailman-Approved-At: Tue, 09 Dec 2025 13:29:52 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RIWBWYIIESW43W5S2SHVXTXLOLFLQR6B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>

Audio fails to resume after system exits suspend mode
due to accessing incorrect ring buffer address during
resume. This patch resolves issue by selecting correct
address based on the ACP version.

Fixes: f6f7d25b11033 ("ASoC: amd: acp: Add pte configuration for ACP7.0 platform")
Signed-off-by: Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>
Signed-off-by: Raghavendra Prasad Mallela <raghavendraprasad.mallela@amd.com>
---

Changes since v1:
	- Include Fixes commit
	- drop unnecessary variable initialization
	
 sound/soc/amd/acp/acp-legacy-common.c | 30 +++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index 3078f459e005..4e477c48d4bd 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -219,7 +219,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 					SP_PB_FIFO_ADDR_OFFSET;
 			reg_fifo_addr = ACP_I2S_TX_FIFOADDR(chip);
 			reg_fifo_size = ACP_I2S_TX_FIFOSIZE(chip);
-			phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
+			if (chip->acp_rev >= ACP70_PCI_ID)
+				phy_addr = ACP7x_I2S_SP_TX_MEM_WINDOW_START;
+			else
+				phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
 			writel(phy_addr, chip->base + ACP_I2S_TX_RINGBUFADDR(chip));
 		} else {
 			reg_dma_size = ACP_I2S_RX_DMA_SIZE(chip);
@@ -227,7 +230,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 					SP_CAPT_FIFO_ADDR_OFFSET;
 			reg_fifo_addr = ACP_I2S_RX_FIFOADDR(chip);
 			reg_fifo_size = ACP_I2S_RX_FIFOSIZE(chip);
-			phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
+			if (chip->acp_rev >= ACP70_PCI_ID)
+				phy_addr = ACP7x_I2S_SP_RX_MEM_WINDOW_START;
+			else
+				phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
 			writel(phy_addr, chip->base + ACP_I2S_RX_RINGBUFADDR(chip));
 		}
 		break;
@@ -238,7 +244,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 					BT_PB_FIFO_ADDR_OFFSET;
 			reg_fifo_addr = ACP_BT_TX_FIFOADDR(chip);
 			reg_fifo_size = ACP_BT_TX_FIFOSIZE(chip);
-			phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
+			if (chip->acp_rev >= ACP70_PCI_ID)
+				phy_addr = ACP7x_I2S_BT_TX_MEM_WINDOW_START;
+			else
+				phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
 			writel(phy_addr, chip->base + ACP_BT_TX_RINGBUFADDR(chip));
 		} else {
 			reg_dma_size = ACP_BT_RX_DMA_SIZE(chip);
@@ -246,7 +255,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 					BT_CAPT_FIFO_ADDR_OFFSET;
 			reg_fifo_addr = ACP_BT_RX_FIFOADDR(chip);
 			reg_fifo_size = ACP_BT_RX_FIFOSIZE(chip);
-			phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
+			if (chip->acp_rev >= ACP70_PCI_ID)
+				phy_addr = ACP7x_I2S_BT_RX_MEM_WINDOW_START;
+			else
+				phy_addr = I2S_BT_RX_MEM_WINDOW_START + stream->reg_offset;
 			writel(phy_addr, chip->base + ACP_BT_RX_RINGBUFADDR(chip));
 		}
 		break;
@@ -257,7 +269,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 					HS_PB_FIFO_ADDR_OFFSET;
 			reg_fifo_addr = ACP_HS_TX_FIFOADDR;
 			reg_fifo_size = ACP_HS_TX_FIFOSIZE;
-			phy_addr = I2S_HS_TX_MEM_WINDOW_START + stream->reg_offset;
+			if (chip->acp_rev >= ACP70_PCI_ID)
+				phy_addr = ACP7x_I2S_HS_TX_MEM_WINDOW_START;
+			else
+				phy_addr = I2S_HS_TX_MEM_WINDOW_START + stream->reg_offset;
 			writel(phy_addr, chip->base + ACP_HS_TX_RINGBUFADDR);
 		} else {
 			reg_dma_size = ACP_HS_RX_DMA_SIZE;
@@ -265,7 +280,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 					HS_CAPT_FIFO_ADDR_OFFSET;
 			reg_fifo_addr = ACP_HS_RX_FIFOADDR;
 			reg_fifo_size = ACP_HS_RX_FIFOSIZE;
-			phy_addr = I2S_HS_RX_MEM_WINDOW_START + stream->reg_offset;
+			if (chip->acp_rev >= ACP70_PCI_ID)
+				phy_addr = ACP7x_I2S_HS_RX_MEM_WINDOW_START;
+			else
+				phy_addr = I2S_HS_RX_MEM_WINDOW_START + stream->reg_offset;
 			writel(phy_addr, chip->base + ACP_HS_RX_RINGBUFADDR);
 		}
 		break;
-- 
2.17.1

