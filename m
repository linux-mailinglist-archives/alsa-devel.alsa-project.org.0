Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2D997B7E8
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2024 08:23:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15A6EB65;
	Wed, 18 Sep 2024 08:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15A6EB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726640592;
	bh=WjTAS1K2L4UWOtNZuASNRs3zvxWdgoRLi2uw7rJAiE4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gW4uwbhF2hywXf5FNGLKi5qLFLTEOBUf67tRAVQFtKKSM3qtsFWDSx+H2Qp3lI/8b
	 NoMHa0iL79KN4ZKn8mVJuqzEUL0/u9PzajsJpcKfMM63xELBStYIf2DEoAcgLgpuUQ
	 4levlv/j7RgsaVg/3BUyneI7qXeTeSmkJOpODvB8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB8F0F805B5; Wed, 18 Sep 2024 08:22:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9077AF805A0;
	Wed, 18 Sep 2024 08:22:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8BBDF80518; Wed, 18 Sep 2024 08:22:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 040F5F8020D
	for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2024 08:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 040F5F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=XQnDn5TK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTZwGz4Ntmh/lUwQKHseAOTCXDVeu27DzUaGSnNDGcoXLo11YLuoVFLxjIKu0nSVe3liRYgqZqUCQGmNH9UwOwDbXN/hlLZXSWq7qoH4ICsGtBSQ3Y5B9j0dXvSmwRsZ05E1Z4lXSYYP01taFS7KlgkQ3jIsUBdbHYcqiC7BJRCrqRGNw16DwFjRfmm1RDzAFbebO7v4BilK6uvW2bALZcSxHzUh28OOleWrjmh1xR+8v5uKn/SOwaahfPzamIx25GNT/gErpNQ77Iym5SQbDJVhuV43uqQpcJIDVfwvG1U2nlEdV7Wq7C0yogGhl3NMQBRy28OPNQIOrcPYpzKnow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xACMO2b4h4TWup/kb8NMxouIM6azWSC3MNSN6Lodgsg=;
 b=l2cL2qSYb0/MyENWz6VlLQ9Fav9//jj7eCNn2IPaSXoGLQ9dJmnu0kujFbYwbwHRgeaAw2BCC1RgZFdgSmRDF8N+48btJDtI8823HuOF7RAXPcXm97FEmvbz7EVF8a9xVRTe6JcXJFAwjkfixFxWh6AnE9JR9JdN3Rge0mG7Z6D/OFIe9h2GtXqfEZBG37SZBDmPH7+SFnd1YsfbGxGo3dXwe9v/4hC6/ZxqbAB2SyYjN67yfHRBCo5Z+QKLBPnFSLjn4LwkBgi4SqU5fUsxeMlxGWe9tMyM6Uxm6JyglcRwrfnP46FT0RFlrTJyOm7a/CP+20S7RpPsDMlEWj0p9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xACMO2b4h4TWup/kb8NMxouIM6azWSC3MNSN6Lodgsg=;
 b=XQnDn5TKMjXzuVJOyhqbxMFV3rUqzDpqfwbmRkb1kQJSjgH3MoEQ1h0v3ZzHoXmNMuM0Iv8ChMo2NWqX51dmtLbjTyIAp1hDoMROjh3WVEKD6mQBnGWRQdBPOTyJ/YVQzkMfgIRYd53BB6SR9LyhwUKYlqFLw0ESgOHn677Cg+k=
Received: from LV3P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::34)
 by MN0PR12MB5737.namprd12.prod.outlook.com (2603:10b6:208:370::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Wed, 18 Sep
 2024 06:22:38 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:234:cafe::d2) by LV3P220CA0013.outlook.office365.com
 (2603:10b6:408:234::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 06:22:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 06:22:37 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 01:21:52 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH 7/8] ASoC: amd: acp: replace adata->platform conditional check
Date: Wed, 18 Sep 2024 11:45:39 +0530
Message-ID: <20240918061540.685579-8-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|MN0PR12MB5737:EE_
X-MS-Office365-Filtering-Correlation-Id: 21fa4ea4-5ea7-4409-6df8-08dcd7aa4ade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zggmbvynBbTXRwPSf9/LFmVPKgU+CgAo8M7iH8GSyUKOXq20dFidXycWUZ9j?=
 =?us-ascii?Q?LOP9FjBVziW4OsWN1u+hi9f4qtZi2rGaUvmnGm2yc53jZdwsCIvvvhpsDjZS?=
 =?us-ascii?Q?5I5CsXmihFVk2Y7/P5qFlIWJqLYhFbP93qPTmlbdC4+KMCpI48CBwHm+TpP0?=
 =?us-ascii?Q?PppxuEgfdgykxCphHrQGELtR2VX2NagW1SKrxmIkbtNCc/CndHpTfpt0qJvE?=
 =?us-ascii?Q?o3FQxvF/UtgDzLlpRsHec/YukD1mlRb0H17upRgKXzz1MMcdRfR9VgB08ukE?=
 =?us-ascii?Q?qX3/iAHhBhlZeA+08Fws4+9ejET77DpDpCRxTnsiYX3nO9DgpOAWuN2L74y6?=
 =?us-ascii?Q?a1P8PyzbUZtfwFwMk3Jg8P66JcODh6AGGWStWhg/6D6TviKgdBw2rncz11Q7?=
 =?us-ascii?Q?B8M6HGb2ArgQOD3PFcnShL99QMAJtMRheMrMcoTJgPKl5imUuStX4Q2mWWbv?=
 =?us-ascii?Q?D/4Jj/JxQ6aPPZ/jXb/L2ftBzbX//lfP2ENLwU5ZLwFZj3EsTTlFYWIiF8YC?=
 =?us-ascii?Q?QTsVIouY1KgWSjXxki/gC1Fu+Kj5WNFtzkOyUmyijiqMo/WF346pM/Jwpfiu?=
 =?us-ascii?Q?2eltctl5fGo/GjnZTJUyzP8f0bwhmRyBvL6wUovFRCs8cxfGynCKF5Lr3U2H?=
 =?us-ascii?Q?Dsv3+0bDXXCJet5PkvTVIOGkspl9zwsYz5wmWM1LMrh+q8Irz1rjkqqI/QwN?=
 =?us-ascii?Q?qdsQTpSZ0kIhu6d5r8L2g3gS3LMvycE7LFMQExZlpjSkNEkpVeAm5pN+aYud?=
 =?us-ascii?Q?qdXWtBnEwlV3ILOv5hr9fgm88n7FHIu+WKi5WpvHzl3OIJrKayIPYrp2Ld+S?=
 =?us-ascii?Q?Ub7LmkbtYduZbbD6FFUnxaN1cGa5QY8IsEsgh2Tf6lkYFFOl9gvvt8PaTlae?=
 =?us-ascii?Q?SzoE9BjPXACXwSoB9XteIG/+4b+/2TWp8Sj03122/T1SLyOhuWRyJIADP0oN?=
 =?us-ascii?Q?vUYE639bB/klkqc/el54rBsNtR1x70xQxJAz6q6eGI2HQ1j04VdM/n2AMrmk?=
 =?us-ascii?Q?JZ/cMqPht7S2xV+ZG9xL4RaLTGFpOqH6F2g2lFWe37LEDDTDIdossYwAnq5i?=
 =?us-ascii?Q?63Tf7xC53I2Uqpx2WlqjX5Ly4/1/oHXaoX/gcgBSyzEvChd1CpZiXOWvPCFr?=
 =?us-ascii?Q?pxmq17rTNjFh6nmYMc6QyhI77ZsM/o/1FUsy0O8r7CCHf9o1MJVcZLWdmYkd?=
 =?us-ascii?Q?f2iBymusCBGNvSoY6j1TX4UJme1l4nF+jhOjfFSA6XjiuVZAGNNr9x63XDDg?=
 =?us-ascii?Q?ZLNiDzloSfpeiSG64DU6bRUppZ8DBjXiokGDnq4Fj4HTugzV9sotMdaDPRGu?=
 =?us-ascii?Q?0ztaqGbcelIphlTIaxnwfpEol7MR7uLBAx3JLvElrk0/gblbqoTCkwdFRCfh?=
 =?us-ascii?Q?8x2JKtzfjNrV39CebuLrgR3ZwqMC8FYncHrjnHWIDTrv/4DZtaHrZAqw6WBW?=
 =?us-ascii?Q?Pp2gsB4r9j3joq0h2POT2H5Rc13VVIDU?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 06:22:37.9489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 21fa4ea4-5ea7-4409-6df8-08dcd7aa4ade
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5737
Message-ID-Hash: JHRRNWITSLD6PRX2P2WO7D252KYX27L3
X-Message-ID-Hash: JHRRNWITSLD6PRX2P2WO7D252KYX27L3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHRRNWITSLD6PRX2P2WO7D252KYX27L3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace adata->platform condition check with acp pci revision id
variable in config_acp_dma() & acp70_i2s_master_clock_generate()
functions.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp/acp-platform.c | 6 +++---
 sound/soc/amd/acp/acp70.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index a6e5cb263377..b66e7f69ec75 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -204,9 +204,9 @@ void config_acp_dma(struct acp_dev_data *adata, struct acp_stream *stream, int s
 	u32 low, high, val;
 	u16 page_idx;
 
-	switch (adata->platform) {
-	case ACP70:
-	case ACP71:
+	switch (adata->acp_rev) {
+	case ACP70_PCI_ID:
+	case ACP71_PCI_ID:
 		switch (stream->dai_id) {
 		case I2S_SP_INSTANCE:
 			if (stream->dir == SNDRV_PCM_STREAM_PLAYBACK)
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index 82c26e4fefc1..db5dd64969b0 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -142,9 +142,9 @@ static int acp70_i2s_master_clock_generate(struct acp_dev_data *adata)
 	struct pci_dev *smn_dev;
 	u32 device_id;
 
-	if (adata->platform == ACP70)
+	if (adata->acp_rev == ACP70_PCI_ID)
 		device_id = 0x1507;
-	else if (adata->platform == ACP71)
+	else if (adata->acp_rev == ACP71_PCI_ID)
 		device_id = 0x1122;
 	else
 		return -ENODEV;
-- 
2.34.1

