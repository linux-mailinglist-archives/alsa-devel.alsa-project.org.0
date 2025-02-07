Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B901A2BB6C
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:31:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 173DF6022B;
	Fri,  7 Feb 2025 07:31:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 173DF6022B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738909887;
	bh=aj4kola1+MhVVaaMwJ/N+SW+iNGKWaob2Q2ULdt046g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TGUyPlOyC2rohhu56tOgRgrw0me5bPybwe5Lix3c6F6C6cOG8bEIySTS4lnrYGLef
	 SC+W7jRh8YaMi5l77ZqLrqSQiX+qlS2LA5XeuFG/spNq11fQVbhv3sDCM/h1vlk8yt
	 DFpzJi+Ev+PA5GfrPqUTS88mdAHdMNm4LVwfwkhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EBA6F805C1; Fri,  7 Feb 2025 07:29:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F577F806C0;
	Fri,  7 Feb 2025 07:29:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 078E8F80680; Fri,  7 Feb 2025 07:29:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2416::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8311F8069D
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:29:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8311F8069D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ne8OVSe3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zF9To7fMxtj4HeZoLjODA4Oz+H5XdcbAVaOwMazeqYdbKUGPSIDOjTK7pBSw8REDypb2I7Opei8zxDOhh5UGNcD9qWHRUjZxJqHZVplsJWFc/B/C2aIgChTKoBePh+SHll2Qd2i2ipr95KeG8l+QFO2mjE9X8Fk2vfU8UTkI2gn4eY1SEFD+QzTNq9ZQlDK2bm4ZKA+zZC3ieoHxCEOcfkvC9HZYK/F3TABAq3oMLen8nxJpz22ghlOrLgjVT2nc3+LJ9KGd2ZYASVerxQ0Ss0FOKdygcyfFoPL4CMmprlPkykE4cxuCziadgq974q8roYdIwVYIV346vBakf7LL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFX89Bp41ObFcvD3saujfUmF7WOoRwK3EYsHGKUmT90=;
 b=ECpXPxy8tyMcY91H+N9jXQ1QmIvDa9CsLnt9mWsj37GXRjNpvHViuxoviIgbbebekoXIrbosYIVuMyLozBAhUOCTm+eD63IE7G8b2BrQ1XKFu/gR1M3VRE+0XLISh06lUrZNsBN9nbDOsFNV7ohCzFBBGj2Evr92iVyj72uVJxUAwlj2x2MP5OOjxzZMM1x4F9QH1+WAhbRgyNyjik7tegUM05GfvTsd5fiULam98qdd0/J6F+ifGrVYn+9Ipz2AaX2pgrryWjuvJLysTozh34kGOVlrIUW9dP5c3kAxijOcuh3BIfyqgHRO2oXp/iD0MCOI3+9VPGXvBc7Aw790YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFX89Bp41ObFcvD3saujfUmF7WOoRwK3EYsHGKUmT90=;
 b=ne8OVSe309mzc23fcHrMiNH5V6CptDeAY11TOo342Y2W748c3FILF2P/gwIw3wzmGNm7itA0p4lvparcBCI8gy9C9ht4MFwNK7NGVfrtjBqVU/gR0PP2yMuvdwnoszcRtmgiAFSdvvkR/GlQV6l/aW95QnFU1yTVxfd/miDj5Z0=
Received: from MN0PR02CA0011.namprd02.prod.outlook.com (2603:10b6:208:530::33)
 by PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 06:28:59 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::4a) by MN0PR02CA0011.outlook.office365.com
 (2603:10b6:208:530::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Fri,
 7 Feb 2025 06:28:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:28:59 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:28:55 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 06/25] ASoC: amd: ps: add soundwire dma irq thread callback
Date: Fri, 7 Feb 2025 11:58:00 +0530
Message-ID: <20250207062819.1527184-7-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
References: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|PH7PR12MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cab3678-7920-4fbc-05b4-08dd4740b4d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NlVk+b/JJ6lHysHJlrFh6zbLcPhNY3BUD94LcITRy4xQDpw5rjPllseZ3LXa?=
 =?us-ascii?Q?1gJAYjUOPbNbDvuaN3BM6spJ3A4O5O9UcyPKLTNz0atk/KBoq1xSe4XVm1RS?=
 =?us-ascii?Q?Z1VGEK4SZlrRRiFpRe0WlIkymS+aYmMtagQrkBlJmucN9NPgRNBRdMhCpE4v?=
 =?us-ascii?Q?JHL1kM8h9ZIAkoxrCQX3WkrF2/LHfydWrIyJ/UuFHoQATLUNvPMcz0KYBXcj?=
 =?us-ascii?Q?/jPFmZOElAMzjVPsXFUPvKSPYwcQFKW/s3Equ2XoSV3zMdJucg6QVUzOyxE+?=
 =?us-ascii?Q?4G9gvVjb7F7l59KXRUXo+a4Wi+HslV6ABKCRJGZ7RxJCVGPmP/HznyFA/HEu?=
 =?us-ascii?Q?E3IYi71sSJVOldliTLbJTWw3Ldj9SwXMQJT1th6mwm8TZ6pab+lK8FcVaxAe?=
 =?us-ascii?Q?XQtjBQmeiRo5IGmQ2Wyeqjk23kWqSEN8TYkyu8Al1Rivfzal696HU+TASJlg?=
 =?us-ascii?Q?+4NwacsJi4GR8GTVxtkrRaeqT1Mt57QhvHpRZrtZ631ZeOHTJAjcuvYhS6Xs?=
 =?us-ascii?Q?TYPy53j7ovwhuLaKcP3+vZcrC/wZVH3HFMY/CWvsZM6s+NMP/LIpc3YfeKJW?=
 =?us-ascii?Q?nX5qGY/w6LCTS4Udgv7IpjhNJo6EI+SilXOrLZ4V8iYIxflRIAJ5yCTBd0T5?=
 =?us-ascii?Q?nnJlTShkRwBxu3FCk47zvhJmGhSodB1t9OwvM6+XMBBkANN4VK3EpX9TEXYe?=
 =?us-ascii?Q?MWf6AawmAZPUqv4LSd4brKxe/qxJBBUU0WN7AkJsxYaM75XF65FS9+4k6oF5?=
 =?us-ascii?Q?0JEihueZpt/ObhLm3nvzB0nuaWT7Ce2+3xG9gLrWt+vSZUwNID72WVElbWfw?=
 =?us-ascii?Q?IgYq0K8wtbYAPDi3Dv7PMZDKSF8tHGiqxAoGj0kTQvCASNDEDlNEA3WPDzTf?=
 =?us-ascii?Q?MbAlWBwL6xdNVaNAFF+siLC0eBvrLI0vl4uTJdcefi5QCb3NpQg/s6ODfb6E?=
 =?us-ascii?Q?n3vbvz3CVqzp1olnLlE1kxCOFFAsiTYXxSjh/n0UAakEA01BJlayxqtw4fM6?=
 =?us-ascii?Q?Lh1UHe39VtA3zDz5dFqXba9OiKRa/IMy6YLoz/tH3J1SaOq3n3y1rvdpZUm2?=
 =?us-ascii?Q?Hm9S8L/DP8u9feYh5tmW6KwzlZYYSWRnfyjhncs7peiEDhAyQjBIW8ExIidI?=
 =?us-ascii?Q?bQGMjRlOdhqtLYlmDiZ4jS0VMKCCzCqbGyDi8KsJmnpP3OjAhaV6ScUJpUAE?=
 =?us-ascii?Q?0ZuwLPeEzR86Krz4I45UzrUzxt0aXWpuF3/sAWKHbCIj7GOeTORFXvT10eTA?=
 =?us-ascii?Q?z8TBARm75dJNzOcVL6cbMVqQmjL3FWM/bM5WUXueNa8rDkTKzaAiHXIh1Usl?=
 =?us-ascii?Q?PkPvsOC1Ygb1Yeb50ya7e9U0do6pQJbKLZv+X1/VLnsRcMBfr4hkVmLDdtW2?=
 =?us-ascii?Q?XYuiyogzmYpdqvCI5kA/Av2HN3xjGeoDSMi3v28qP2jXLJGuCibYcgbMZW3R?=
 =?us-ascii?Q?L8+zQGd40YtvXpREJbhyWoAoh7q9u0mVkwLKMaG74+KtCySEX/MtK39u7+0q?=
 =?us-ascii?Q?G/6I5Z3VmI5ADCg=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:28:59.3192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7cab3678-7920-4fbc-05b4-08dd4740b4d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5974
Message-ID-Hash: QU4CEUNK5KL3DZD52ET7V25HUX6AWYZY
X-Message-ID-Hash: QU4CEUNK5KL3DZD52ET7V25HUX6AWYZY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QU4CEUNK5KL3DZD52ET7V25HUX6AWYZY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add acp pci driver Soundwire DMA irq thread callaback
for ACP6.3 platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h     |  8 ++++++++
 sound/soc/amd/ps/pci-ps.c    | 19 +------------------
 sound/soc/amd/ps/ps-common.c | 25 +++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index a918a988e4d8..9a20846d30ff 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -222,6 +222,7 @@ struct acp63_dev_data;
  * @acp_init: ACP initialization
  * @acp_deinit: ACP de-initialization
  * @acp_get_config: function to read the acp pin configuration
+ * @acp_sdw_dma_irq_thread: ACP SoundWire DMA interrupt thread
  * acp_suspend: ACP system level suspend callback
  * acp_resume: ACP system level resume callback
  * acp_suspend_runtime: ACP runtime suspend callback
@@ -231,6 +232,7 @@ struct acp_hw_ops {
 	int (*acp_init)(void __iomem *acp_base, struct device *dev);
 	int (*acp_deinit)(void __iomem *acp_base, struct device *dev);
 	void (*acp_get_config)(struct pci_dev *pci, struct acp63_dev_data *acp_data);
+	void (*acp_sdw_dma_irq_thread)(struct acp63_dev_data *acp_data);
 	int (*acp_suspend)(struct device *dev);
 	int (*acp_resume)(struct device *dev);
 	int (*acp_suspend_runtime)(struct device *dev);
@@ -311,6 +313,12 @@ static inline void acp_hw_get_config(struct pci_dev *pci, struct acp63_dev_data
 		ACP_HW_OPS(adata, acp_get_config)(pci, adata);
 }
 
+static inline void acp_hw_sdw_dma_irq_thread(struct acp63_dev_data *adata)
+{
+	if (adata && adata->hw_ops && adata->hw_ops->acp_sdw_dma_irq_thread)
+		ACP_HW_OPS(adata, acp_sdw_dma_irq_thread)(adata);
+}
+
 static inline int acp_hw_suspend(struct device *dev)
 {
 	struct acp63_dev_data *adata = dev_get_drvdata(dev);
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 96399acf906c..5d9c230043a6 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -23,26 +23,9 @@
 
 static irqreturn_t acp63_irq_thread(int irq, void *context)
 {
-	struct sdw_dma_dev_data *sdw_data;
 	struct acp63_dev_data *adata = context;
-	u32 stream_id;
 
-	sdw_data = dev_get_drvdata(&adata->sdw_dma_dev->dev);
-
-	for (stream_id = 0; stream_id < ACP63_SDW0_DMA_MAX_STREAMS; stream_id++) {
-		if (adata->acp63_sdw0_dma_intr_stat[stream_id]) {
-			if (sdw_data->acp63_sdw0_dma_stream[stream_id])
-				snd_pcm_period_elapsed(sdw_data->acp63_sdw0_dma_stream[stream_id]);
-			adata->acp63_sdw0_dma_intr_stat[stream_id] = 0;
-		}
-	}
-	for (stream_id = 0; stream_id < ACP63_SDW1_DMA_MAX_STREAMS; stream_id++) {
-		if (adata->acp63_sdw1_dma_intr_stat[stream_id]) {
-			if (sdw_data->acp63_sdw1_dma_stream[stream_id])
-				snd_pcm_period_elapsed(sdw_data->acp63_sdw1_dma_stream[stream_id]);
-			adata->acp63_sdw1_dma_intr_stat[stream_id] = 0;
-		}
-	}
+	acp_hw_sdw_dma_irq_thread(adata);
 	return IRQ_HANDLED;
 }
 
diff --git a/sound/soc/amd/ps/ps-common.c b/sound/soc/amd/ps/ps-common.c
index 30e9e5fe034b..9098974b3608 100644
--- a/sound/soc/amd/ps/ps-common.c
+++ b/sound/soc/amd/ps/ps-common.c
@@ -15,6 +15,7 @@
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <sound/pcm_params.h>
 
 #include "acp63.h"
 
@@ -211,11 +212,35 @@ static int __maybe_unused snd_acp63_resume(struct device *dev)
 	return ret;
 }
 
+static void acp63_sdw_dma_irq_thread(struct acp63_dev_data *adata)
+{
+	struct sdw_dma_dev_data *sdw_data;
+	u32 stream_id;
+
+	sdw_data = dev_get_drvdata(&adata->sdw_dma_dev->dev);
+
+	for (stream_id = 0; stream_id < ACP63_SDW0_DMA_MAX_STREAMS; stream_id++) {
+		if (adata->acp63_sdw0_dma_intr_stat[stream_id]) {
+			if (sdw_data->acp63_sdw0_dma_stream[stream_id])
+				snd_pcm_period_elapsed(sdw_data->acp63_sdw0_dma_stream[stream_id]);
+			adata->acp63_sdw0_dma_intr_stat[stream_id] = 0;
+		}
+	}
+	for (stream_id = 0; stream_id < ACP63_SDW1_DMA_MAX_STREAMS; stream_id++) {
+		if (adata->acp63_sdw1_dma_intr_stat[stream_id]) {
+			if (sdw_data->acp63_sdw1_dma_stream[stream_id])
+				snd_pcm_period_elapsed(sdw_data->acp63_sdw1_dma_stream[stream_id]);
+			adata->acp63_sdw1_dma_intr_stat[stream_id] = 0;
+		}
+	}
+}
+
 void acp63_hw_init_ops(struct acp_hw_ops *hw_ops)
 {
 	hw_ops->acp_init = acp63_init;
 	hw_ops->acp_deinit = acp63_deinit;
 	hw_ops->acp_get_config = acp63_get_config;
+	hw_ops->acp_sdw_dma_irq_thread = acp63_sdw_dma_irq_thread;
 	hw_ops->acp_suspend = snd_acp63_suspend;
 	hw_ops->acp_resume = snd_acp63_resume;
 	hw_ops->acp_suspend_runtime = snd_acp63_suspend;
-- 
2.34.1

