Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D266F9F7457
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 06:55:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AE0C60253;
	Thu, 19 Dec 2024 06:55:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AE0C60253
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734587713;
	bh=jp0i3G4vkrmLXB2QNH1rP0c51KJsRozHriVIW2r5lus=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fJtjqvRiKZplE57VdL8FuV9h2W/YNkxwGWpCqjGpMPEoPh8H69tMPouv7tP8akLSi
	 mIcw1LONNSx4/41m8r2kYTrk2hHnl2wiQNbmw6KshOMmJ/dk6e161RjLC+gO3j3XRa
	 Zhh2TeOmK9XiBJUJ3SXz7nQ5cXBVawgaeELj87HE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7600F8080B; Thu, 19 Dec 2024 06:52:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BB48F80808;
	Thu, 19 Dec 2024 06:52:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AC07F8075A; Thu, 19 Dec 2024 06:51:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::612])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77E59F8074B
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 06:51:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77E59F8074B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=HEGB7JKb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hW7c2jUkc+8MxUM9Qy7AKMDQCWUaadyvF62XxMvQf+olLCyFEkUZ1Hk5joQ/sDonxgUX6EnkwBeQ9dpk8aUMIi22J9+YA8PGC69Th+kp8yrgiH+aru07ThKKeZur4OH/iBJLRnY7ZyhbhN+KjiGREu6qchEe4Q0bC7B1YoeLFC72FY+D77g2jVsIQPfDCDA8ReWO8il8cet1ZZR0GSplD7nH1F8afaCcbMa4V7uySFItTwtPhQ+GFD5nmMMfd3LDFSnJmo7nxgGqG5RWeLYZCBPTD/u8Y9b1DOsQL1jySejy3nmz+ZsxYt4Rj5AauGP5tdRQ8UzjnzHH2nBUddHYqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TraM2FYo9IztrRMluX7qFCVgeINcrtGiWt4k6mE3Y14=;
 b=pB+o8O3ds/J/kekfrraaUhYZSC+MScjcZ65ewVxZj+XJYBM6jEQYu03HgVxEutFU5r5nybYTjxNV8FYubx876mdOJrb+SLsXc9xfQeogtL+CIf/jKTa2CW6JVYdLlWoOP0cnVrAWCa2OUl340swIys3L7UVs4O03gSK3vc3iwiCVNod9Zq4mtjDa9/PzmFt+SGtkU+xHDj5G/wz1GRPFi6QP2qUFydEOB1Ys9tPtLBNXhbWBk4vG/TJFURCoXxJ8sV22zrzjWPgBpNVy9dLBSvtc+B6RCF/F5Gbqv9vuh5QAnHfi76opTi6NRNY/bi9Yla0ftbv59Llo7T6I7L6/hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TraM2FYo9IztrRMluX7qFCVgeINcrtGiWt4k6mE3Y14=;
 b=HEGB7JKb8/xMZM6wpFB7rccNj2YQGXNB4/oraHNLNAsL2f/48FJpmV93E1hA1eOf8rutKapuGW2p5tiO3gkWxo3B0GWUU4+MOf4ze9vagCYUzqZFG5BP4O1XVg9+XVdMPhkDC0pUYa19ENl6HjC5aJ9I6QHNN7W/EIMvQcAmFog=
Received: from CH5P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::27)
 by DM4PR12MB6541.namprd12.prod.outlook.com (2603:10b6:8:88::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 05:51:47 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:1ee:cafe::b2) by CH5P222CA0006.outlook.office365.com
 (2603:10b6:610:1ee::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.25 via Frontend Transport; Thu,
 19 Dec 2024 05:51:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 05:51:46 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Dec 2024 23:51:43 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Mario.Limonciello@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 17/21] ASoC: amd: acp70: add soundwire host wake interrupt
 handling
Date: Thu, 19 Dec 2024 11:18:53 +0530
Message-ID: <20241219054857.2070420-18-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|DM4PR12MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: 81897ee8-9161-421c-f5e8-08dd1ff13980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uNrrNtu2DYAsEU/Ru9cxzzigHZ96xIqKpVGpXTeEcn1uxoxaVMktdXScql3l?=
 =?us-ascii?Q?b1cn+rJxTANS//1X+2X96HyqUC5+aVrNB9UpQmQKjw3Hq6HuFg+3TAtP5Yym?=
 =?us-ascii?Q?EAUv68eW6LdV7rVP3iQHPTKBXl42aNUafxOPhB6U21vjB0O0XyW6dbAxEhY4?=
 =?us-ascii?Q?V8ILrvbQdmKk4bAWtAABf0MUI1j9rBQ7lwnQnFH7eLJ5xKEXnjlqM7qpMDqE?=
 =?us-ascii?Q?et5wdnJ2kQejGXAx3C4LHSL8VSr/96s2//gPqkq+fMZ9Wlxb9FdnFzb6NCOA?=
 =?us-ascii?Q?dVdvjGbzFCSqe6k2QVIOIfWHihsdMXDXtzbmzZsZGnBYBB5LDnbMzDjdpHTU?=
 =?us-ascii?Q?9ppusIvm5Gr4dIPy66Zj2X318Hid1TfckWwMsvSVGiVRt3zkmibk0M/IiLaa?=
 =?us-ascii?Q?56Wwp39L3jA+SOwPNwg5nyaEvSd9/RuMmtxYJL3Yik9wAqYVYzYKK8W1n1eK?=
 =?us-ascii?Q?Kt97xx706vYyxUbI1saUc8u94J3whIXmOOAoIUSGjx9W4PWvk62n6XZobTxE?=
 =?us-ascii?Q?x8uo93IWE8W9/aMFRMqS2m7mRYtl2SKzs530J8QdrW1g5jOScSMywl9fvJ6k?=
 =?us-ascii?Q?ia4LGIK08xosWOdnUl4IGI22nX+RMMwiwJgbJQQN0D3t1skP6bkailrZGtbl?=
 =?us-ascii?Q?90eyNoU1P33XFEi93ndeatQFX4k+RL7olIMWBfaeYMaB8kUhWIc/5z8HaGbF?=
 =?us-ascii?Q?5n0baXaAVpzEhxg6BV/WINiTfxHGgRW+sG8a5n7e/5GksTz9IAXnMxINo8eQ?=
 =?us-ascii?Q?1Km8ogQY7DJuK7ikcJe1E0PnYhkEuwSrzrLbdpAY1EtRR9ZqqShHqylxILPq?=
 =?us-ascii?Q?/XtQiXu1eT43+BuBg8UWws5RyRwEaKT/LVCKXGvwjjxDn0sS2rX40c+A47i0?=
 =?us-ascii?Q?cQDlWLHMP37ELMyxHGK7zkAQH+hfqVabzro7dQBPgZP0r0UA9C1QukJ5p42V?=
 =?us-ascii?Q?GZZ6/uHI/TpVNEkgWqsp6ZHxy56m+V72LcPLYcDZGOkOfgePFQ/zKw0k7pEH?=
 =?us-ascii?Q?H5nRca/LfL/UaU40hfQlh+xfFxI68Gh+Vw93EcyWcFsWXVJRi2RAeX0gTH0P?=
 =?us-ascii?Q?Rqi/X2HDXOsGdIgUagvIxJ+5T+KqauoZRmPPFNlIPF3sc6hvKV0I9dhXMTSH?=
 =?us-ascii?Q?k/bp/3tWQ8Xa1nvOlbzcxIqEcTC6cCPLXmugFe/tgiddTZyJnvF7UinL2Omd?=
 =?us-ascii?Q?mMvVTzQse27RQjg1hb8u2XP01BxEZkvdtHcnJHQ7KLkHkmwePA7S2zxkiBC+?=
 =?us-ascii?Q?3jqkswTlFKeP4jKmCXzuPhOVlZtrhKRON5Mdka4PtCuBLzXqUKAJkr4w9JN/?=
 =?us-ascii?Q?bgByLc9iMG5ms71VIyEavodsH7x28zD5NmhYUuYVjDoRjLIc6VqxO/vx9UU1?=
 =?us-ascii?Q?Y09OtBrilg+TbBfgvYKEwbOGY2Ywk5/EIe8KCLQfWltwg+WIQZRBz697HFL/?=
 =?us-ascii?Q?JeBOxZ6YStww1TNy6nlm9vq4//kR/lc//sAUpd7H9Ht3lyrLYgh5KKj3efEd?=
 =?us-ascii?Q?6RPxU2P+vG3wYSc=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 05:51:46.8029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 81897ee8-9161-421c-f5e8-08dd1ff13980
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6541
Message-ID-Hash: NTMNRWHA5RG3NTGT3VMD3YWW6OWS6AKP
X-Message-ID-Hash: NTMNRWHA5RG3NTGT3VMD3YWW6OWS6AKP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NTMNRWHA5RG3NTGT3VMD3YWW6OWS6AKP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When ACP is in D0 state and SoundWire manager instance is in D3 state,
If SoundWire wake event is asserted, Soundwire host wake interrupt will
be triggered for that SoundWire manager instance. In this case, ACP PCI
driver should clear the host wake interrupt and queue up the runtime
resume of the SoundWire manager instance.

Add code to handle SoundWire host wake interrupt in ACP7.0 interrupt
handler.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp70/acp70.h     |  2 ++
 sound/soc/amd/acp70/pci-acp70.c | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/amd/acp70/acp70.h b/sound/soc/amd/acp70/acp70.h
index 1b5661a86352..9774db1ac537 100644
--- a/sound/soc/amd/acp70/acp70.h
+++ b/sound/soc/amd/acp70/acp70.h
@@ -60,6 +60,8 @@
 
 #define ACP_SDW0_STAT			BIT(21)
 #define ACP_SDW1_STAT			BIT(2)
+#define ACP_SDW0_HOST_WAKE_STAT		BIT(24)
+#define ACP_SDW1_HOST_WAKE_STAT		BIT(25)
 #define ACP_SDW0_PME_STAT		BIT(26)
 #define ACP_SDW1_PME_STAT		BIT(27)
 #define ACP_ERROR_IRQ			BIT(29)
diff --git a/sound/soc/amd/acp70/pci-acp70.c b/sound/soc/amd/acp70/pci-acp70.c
index 5e0f7bb68eb8..6884e8516a2c 100644
--- a/sound/soc/amd/acp70/pci-acp70.c
+++ b/sound/soc/amd/acp70/pci-acp70.c
@@ -169,6 +169,22 @@ static irqreturn_t acp70_irq_handler(int irq, void *dev_id)
 		irq_flag = 1;
 	}
 
+	if (ext_intr_stat1 & ACP_SDW0_HOST_WAKE_STAT) {
+		writel(ACP_SDW0_HOST_WAKE_STAT, adata->acp70_base + ACP_EXTERNAL_INTR_STAT1);
+		amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
+		if (amd_manager)
+			pm_request_resume(amd_manager->dev);
+		irq_flag = 1;
+	}
+
+	if (ext_intr_stat1 & ACP_SDW1_HOST_WAKE_STAT) {
+		writel(ACP_SDW1_HOST_WAKE_STAT, adata->acp70_base + ACP_EXTERNAL_INTR_STAT1);
+		amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
+		if (amd_manager)
+			pm_request_resume(amd_manager->dev);
+		irq_flag = 1;
+	}
+
 	if (ext_intr_stat & BIT(PDM_DMA_STAT)) {
 		ps_pdm_data = dev_get_drvdata(&adata->pdm_dev->dev);
 		writel(BIT(PDM_DMA_STAT), adata->acp70_base + ACP_EXTERNAL_INTR_STAT);
-- 
2.34.1

