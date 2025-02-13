Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4B7A33CDC
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2025 11:38:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CDC160244;
	Thu, 13 Feb 2025 11:38:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CDC160244
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739443114;
	bh=8fThFyPgopj9CxMl8VuUuX06i2MvK58ogjoqLB0sxag=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MYr7JsZ8epJ3ylcYNugtjRP36q/OQIBlC1v0uG5As4n24Fx2+TmivmXzseIBzn0qh
	 DgYuI7qJOI4RxoIe/OEgcQ0+At/K819JlYI3RghJLOxwpcMpi1fyNFrBPr0nadJ70k
	 KfyaJRRHuoCGqO379yj0EYSdYJ0+DzCCUzCqBtLw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CC1CF805BE; Thu, 13 Feb 2025 11:38:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 234DAF805B6;
	Thu, 13 Feb 2025 11:38:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 418A5F80269; Thu, 13 Feb 2025 11:37:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20614.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2409::614])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCB96F80185
	for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2025 11:37:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCB96F80185
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=yiYMFmlV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfGu884o+CXHKj93aYVApg27/zWy9/8ZLSNsbQYjmZIAI2+Jcb88su6xUprtzNQN5fB4FTDmu1sgCbstOzss9nhk+Q3DR9JxQVq2tpBpc6SL+t034iLPgCHKr3XVAKq6tu2G/I7aCSPokMDxMcLxUguSqG4MLM/q9z4ow/yeUt7QWPuAWGuUpb3Gg9Rdzjs6UjtQBJa64TzKDlKKdvxqDy6noOIx7Df9dg5FzGMnHcIR/cqlyv1jxyTLwMEEehps27LsDd23paj7r/8OP/D2xYno5CMcIWJaEcu9hwZZioDiohr4vyOUk4zmLPv+ZisOK+eScJDsAn1JYiq5HsWAFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhexIHlToGnPYaq0r9lMR8jYHALG97KweOlNfijanVQ=;
 b=bw0uKMnGt4pAXYDaM5rGvp+9t7PYt48p/eoEqpK6IoaOxKCaj1W5QY17SB+dXaJk84cJOJ7gGKZ6zHs0bz7WfMdqKfi4lJ6/t8Aff6/XIrRfI+hNXINTow6hb6aEcnc/v006zyJQSz00yd3Al5bGPfoxb463816DLfZ5D9qVQF2oHbHItgspkZL6YcvoZz1VEfxWGw4Atm1xT5Q8ZmrmAm+d4XtrDGL58W+hV0SKyF5VeLWoRtfbUTe17wb5oRSf9IfJW20V2SrrArDNqEPgiDIQzo8YeOtyngTRgwPaM8gr0tTi+dm2h9GUr3nTeo0Bvdj9l9zpJBCJbgdNU7LLmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhexIHlToGnPYaq0r9lMR8jYHALG97KweOlNfijanVQ=;
 b=yiYMFmlVgvuDZBZX35wsuPkWz+LAOjllMkT+zE2sZBMCn9rzxUQWDCs8gF7mSEhW7eCljOWo6xDgVkCveMEPcSbU9wVXM51sxOjEpOYMn5qsbRlqiKQxruXTgvCI28H9rU+nS9n+shk7QhuYm9PFUJKxWF5GVObkzfha0iIScQ0=
Received: from DM6PR11CA0019.namprd11.prod.outlook.com (2603:10b6:5:190::32)
 by MW6PR12MB8867.namprd12.prod.outlook.com (2603:10b6:303:249::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 10:37:09 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:5:190:cafe::34) by DM6PR11CA0019.outlook.office365.com
 (2603:10b6:5:190::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.14 via Frontend Transport; Thu,
 13 Feb 2025 10:37:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.10 via Frontend Transport; Thu, 13 Feb 2025 10:37:08 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Feb 2025 04:37:03 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH] ASoC: amd: ps: use switch statements for acp pci revision id
 check
Date: Thu, 13 Feb 2025 16:06:52 +0530
Message-ID: <20250213103652.1082203-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|MW6PR12MB8867:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b6295b-808c-44ce-b623-08dd4c1a5e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NHvUiEZbpC9arqBm9vMOBANy8ZX1i85EGMw2N7PjWz5enph6z9KQirjdPDGe?=
 =?us-ascii?Q?Z8biudCrC0usWV0mYGXs8MpCmjc2qTbikjl/tLLtM5xv7Losbp3lZOhgfBxG?=
 =?us-ascii?Q?4F5WPD2IIlAaDYa23RdXiOcWFNycSrudCwFGZECCr5zO9k/yE7+eVfmNpcgk?=
 =?us-ascii?Q?oxyyfx3GA78rNH6WgWoVFYjLq3ngkGCJiYFw9NqMeryIXiqXADLPWNDJy2qG?=
 =?us-ascii?Q?E8miraEKXPzmVVEEBirBK/y8x5VpiZ+ZWpvPDFsVT/qawax7Rvw47jYuqxmF?=
 =?us-ascii?Q?+jETuXm5RKgVRqf5Qyx5vSe4aHBrX1JhoZ/AiFNPqdpCBCzDS4Zyib0OWNkc?=
 =?us-ascii?Q?IBzrRm3qgxymtwqwPoBHRwvuJ5J+CpsY/wzrj731dUh/kBExeZIvMUYyiFJZ?=
 =?us-ascii?Q?Z8tZzs0zX48Gt548euhYLb2SE+OYTJsCrgdbLJL2bUgXysMpXlKWTVjMiH/t?=
 =?us-ascii?Q?jlL4g+NecXGGDj53yagANvDW4m/vKJTCjDEvgWhygu5s/bBpq9Pj9/yy+WTz?=
 =?us-ascii?Q?dkrM50thX36G57+bpxqBKQck1pJykeK8QT45BODTXQTYsQXFwRizdI23L2JS?=
 =?us-ascii?Q?wfaIGkCkrItCNn7jeclIhCCTskv/hEGEeWHd9uI78FSh2NHqytGkokjKws1/?=
 =?us-ascii?Q?OMwjmHkrBTFiKv+sbH/c7deEpn9oLsYRW115YIGdAvWpoijCZM9paCgCyYPi?=
 =?us-ascii?Q?JyHTI6clGAHgQGi1bwhZAXCD+RE4Gn9tUEzKnJz26dQdfGwz80W1dZWVkFwL?=
 =?us-ascii?Q?GxepuK6tT6iDZhQSqHQ800R5au9FU4GaN1613AXgKAB3X1IrauLFaNJ1k/dw?=
 =?us-ascii?Q?jxyspeOYdETR++6oHwIR7TnoO+29Ejs/jvENgvLlJRAJkLA3JtWZHJNElnMy?=
 =?us-ascii?Q?Ix46nAFn5SULx/n62DEJSx6XoldaSWWuaKCOGAZ5kGgh3vf6zWqp/qFmfDho?=
 =?us-ascii?Q?YyOA9WXcLUVYV3Tt9ggfVXFcWZXxdT82IugHLhCZoyNsaUmP828nyXrsoG5P?=
 =?us-ascii?Q?SVYlE+ZjS9iWzckxv5S4vjzzxnE+ICepvROPdiDYxBBkurdGZDsoALaofozR?=
 =?us-ascii?Q?2tfZUPFA9yNsUvhkahZJQ1OYomb9rEQhVeLd5XJQbR7AbETxhI/orBI231hP?=
 =?us-ascii?Q?mxyqqjFDB8YPs3zaorzSJFr98O8Dh1YeJUpvXRrKjK6IjLwnpbMfSF+S+Nbq?=
 =?us-ascii?Q?WnpdHXiZR2ndGuXxKlYLaWZWqu4xkMPu1sLu6JCTOde73CKjI4FNhlzhWz2x?=
 =?us-ascii?Q?tsh7h86Y5EcI3mcfyMS0QKGO5sOgS2dvLEHWeR7ASXWivBV5wyDbfM2gzJ6U?=
 =?us-ascii?Q?6GiYpJIJOQO7dQJdqY9c2LBooY4HYYJIde54vGTakUUkwem5GPQt4qdjbY8j?=
 =?us-ascii?Q?TH7ROQaWfhEBnkCk0kdvuKQrJSkinGsIOymUOrglHQlihVnrhc8bCCCjj0NF?=
 =?us-ascii?Q?lpgiBXww4swwbcFjjmCLBo0R2D5QGrG0Lyz68gsQbg+PquOFknwX4zN2XssA?=
 =?us-ascii?Q?xn3FscIcrgZFsAY=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 10:37:08.9806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 02b6295b-808c-44ce-b623-08dd4c1a5e44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8867
Message-ID-Hash: O6BYAVAZPHA3WH4L6WDD5CRQAFJITMDH
X-Message-ID-Hash: O6BYAVAZPHA3WH4L6WDD5CRQAFJITMDH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O6BYAVAZPHA3WH4L6WDD5CRQAFJITMDH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use switch statements for acp pci revision id check in SoundWire
dma irq handling.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/pci-ps.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 220dca8cba85..2ff8e67c19bd 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -111,16 +111,21 @@ static short int check_and_handle_sdw_dma_irq(struct acp63_dev_data *adata, u32
 					stream_id = ACP63_SDW0_AUDIO2_RX;
 					break;
 				}
-				if (adata->acp_rev >= ACP70_PCI_REV)
-					adata->acp70_sdw0_dma_intr_stat[stream_id] = 1;
-				else
+				switch (adata->acp_rev) {
+				case ACP63_PCI_REV:
 					adata->acp63_sdw0_dma_intr_stat[stream_id] = 1;
-
+					break;
+				case ACP70_PCI_REV:
+				case ACP71_PCI_REV:
+					adata->acp70_sdw0_dma_intr_stat[stream_id] = 1;
+					break;
+				}
 				sdw_dma_irq_flag = 1;
 			}
 		}
 	}
-	if (adata->acp_rev == ACP63_PCI_REV) {
+	switch (adata->acp_rev) {
+	case ACP63_PCI_REV:
 		if (ext_intr_stat1 & ACP63_P1_AUDIO1_RX_THRESHOLD) {
 			writel(ACP63_P1_AUDIO1_RX_THRESHOLD,
 			       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
@@ -133,7 +138,9 @@ static short int check_and_handle_sdw_dma_irq(struct acp63_dev_data *adata, u32
 			adata->acp63_sdw1_dma_intr_stat[ACP63_SDW1_AUDIO1_TX] = 1;
 			sdw_dma_irq_flag = 1;
 		}
-	} else  {
+		break;
+	case ACP70_PCI_REV:
+	case ACP71_PCI_REV:
 		if (ext_intr_stat1 & ACP70_P1_SDW_DMA_IRQ_MASK) {
 			for (index = ACP70_P1_AUDIO2_RX_THRESHOLD;
 			     index <= ACP70_P1_AUDIO0_TX_THRESHOLD; index++) {
@@ -166,6 +173,7 @@ static short int check_and_handle_sdw_dma_irq(struct acp63_dev_data *adata, u32
 				}
 			}
 		}
+		break;
 	}
 	return sdw_dma_irq_flag;
 }
-- 
2.34.1

