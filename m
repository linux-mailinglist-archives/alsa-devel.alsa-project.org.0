Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DCEA2BB86
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:34:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EAD9601EC;
	Fri,  7 Feb 2025 07:34:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EAD9601EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738910055;
	bh=BQMhtp2kOKO4vzyf5vlaSq/VFnrxiijL1E42xXNaWrg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RovdLORPYPLKkAqAKdWz5Rab9VWNpkCMr+wevKvXfxGO7UkcUioS0TN2GQftvZpfL
	 DVtKY4A4eUy9B0wBeRgDWKJtq2CcBIRlTxmuCWmsFt0JQPZwrmNXRMRg9C97SCiLox
	 A55VB7ic5wrwCYofVFMv+SoGuOl3qzgFNrUhXfOE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E83BF80C72; Fri,  7 Feb 2025 07:30:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16FEBF80C41;
	Fri,  7 Feb 2025 07:30:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0792CF8060A; Fri,  7 Feb 2025 07:30:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::607])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7DB4F805F5
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:30:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7DB4F805F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wK/FkF2y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJ/GBQC3vgnSFrLFI+v80BdH2mHNo6e7+BzCtP9+KxqN0kJ1AwCZ/YNG0GhG041jKaZdVgcRMet2gSVp04n9r9O99Rypos2iK8jEbQBLG7pQTQt0wSt0bvGSxbmQvugZ5YDE1Gr06bKg20GwkLpQ4/EjWw06ag+jjFnKVP8jNlHgeticxIy8exgzrkK0GnN3XVXpwl6BcsmoFr4vPsq/LjNza64Ie9M7X8pXmPYnbrKfyU6+uKkxUXX0g1UGFICxg7yHWHrmIkIkNREu/wZWpRD2hNac3JSHQKpJwjEbpGVeB9urK2wRjorqnTPyWnFfQebrLBVhffNbwg7IuVpRdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L/FDr3ag6KXILiIofsdSbgl2zutMcoCbZxQwfHz5UjU=;
 b=RVj4AUexcXO7egUhUWv0Uxnnv6dmJk+e/Agae7/ueQZlSozSB48mDGBDN+pEclHjIVxgt52FyPQ8ruBrEEDmntgy0I0hTvR+f6/lkU3LPGtI5/3cxKOJwmPsht2YCxSSXhWLkjPzlHLcm91EsDHoxpnUno5/aDrvIdEe2Rztclrv3NvIuwSaF/vWNdNMnV/eUVRm2/M0EvRPouOUp2du/eChkN3ZMgRFgs7nVSQu2/hH1M7SZD1kkRs5JE0NTh8Q9gQhOXAIKv8aS3e+vkUTgOhpNYgqCsAEZkkP035TqneUVKvsyGY5/H5cDcawmB8O5PWPaqAiEBZIhZnxvOkT5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L/FDr3ag6KXILiIofsdSbgl2zutMcoCbZxQwfHz5UjU=;
 b=wK/FkF2yjktVna79Da4N24DNDyzK206k1X0FpFbFLTNtMVUO9zKciHaRRWmvx8Odi246S/A6Z9IQ7PzR6JMKrt51U63tnHqND09vYZTMgChNg0kIOKohf5gMDr3+yKIqkRnL7OJbzZ113chJFd2VKcL8CJzacZtpeXcSQugZ414=
Received: from PH8PR07CA0026.namprd07.prod.outlook.com (2603:10b6:510:2cf::21)
 by PH8PR12MB8431.namprd12.prod.outlook.com (2603:10b6:510:25a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Fri, 7 Feb
 2025 06:30:08 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:510:2cf:cafe::2c) by PH8PR07CA0026.outlook.office365.com
 (2603:10b6:510:2cf::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.28 via Frontend Transport; Fri,
 7 Feb 2025 06:30:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8445.2 via Frontend Transport; Fri, 7 Feb 2025 06:30:07 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:30:03 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 16/25] ASoC: amd: ps: add soundwire dma interrupts handling
 for ACP7.0 platform
Date: Fri, 7 Feb 2025 11:58:10 +0530
Message-ID: <20250207062819.1527184-17-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|PH8PR12MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 746c51ab-3a38-4921-5d20-08dd4740ddc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rPbgKV+4ioF0es6CctSRQZNqOwNb+wAXS5g4Jikjxh7suOUf3DXlEWjeTlSE?=
 =?us-ascii?Q?X1Nj08Xv5YtSQCg2t1xA0UCPxRZKzw9babnshX4My+XRfL/lIFpCDGiWNht5?=
 =?us-ascii?Q?jkSYMFPJS1X99xwMu9pIY22xxKknO0h8qwknpkdMKstSZq95Ctjsqui/STtY?=
 =?us-ascii?Q?EY8Okuus4SQrzDTvV6Ll1b4doNnXX+u9ZGgA14TvizL2fe7s95Hx6bKFjNZy?=
 =?us-ascii?Q?C27bl3s0m1RrP7xf4MSlugqZDfIsV949F9wn7Gcs9KBlsTLFtWdF1isiWF7J?=
 =?us-ascii?Q?6ZJE7+JLST7Wy9vN0jL/c7y43zEcPs2xChu+Ll6dRmjvmR4AvOk9+Sf0EW87?=
 =?us-ascii?Q?0DXWxihphEG8mGkMJXQzMEvGDelX9aFqYxDlNDSq8fyuSXQYLDdu899ePsSq?=
 =?us-ascii?Q?gFoT0FYw+aZyYxBf14bDfhpJxr8C6hc6naXd0cBBLPTLFtcgg2nTZcy0chDx?=
 =?us-ascii?Q?U8P4DGaL28mraOvIS1PzDtuzxNMn5XlDkNbr31O01qrD2ImlQj3FeFZfsl8Q?=
 =?us-ascii?Q?1Puejgl5faMYwJvGZcnC6AJZ2PsMJ6NJ2vsxoPJxRVdKjRhXGeGPD9GrMD9B?=
 =?us-ascii?Q?yAhIR5lPmqK3cLnwy8vDFuxzNmfLy7LFYciaaybgogkewvSQGTdzFr+2z8Xo?=
 =?us-ascii?Q?LSI7TVRF9GzYzlt9325vXyomQkCefhxVQxVTd56DSpcze1WYOfMVrNsyE8+E?=
 =?us-ascii?Q?jaMBMljAX72Fx6eqWmg4Ubv5sYv9FrxFgml1hp+MyWu9weU7ZGxefgPIkRS8?=
 =?us-ascii?Q?6bRosPmmKHKuSNZRO2ELsr7ZWrRmKTB9tjCm3y/b+roxHmgyGuzdPhE46Vpt?=
 =?us-ascii?Q?D5lx2KbVL3qu9GeykX8uW0DYGZIcqhqwAf0XPbLN3Y9QXQ5DMHhsXPNqaIwV?=
 =?us-ascii?Q?Xr9Y446/+VQzyng4+AiaorurlS12HsClXVBaOlIJjfrk++fAyqQCgphJx6Tr?=
 =?us-ascii?Q?m8ahza6pp7W+1vPqh3JwE2ng9QMelFTTrueX7OETSexVYMu57imYRirS0XtI?=
 =?us-ascii?Q?ZYT3jEC6ooaGk03MZx+6CX4rmHfOBeBnsbd3ys/wOzA7DOoYrkY7X9pWXjeM?=
 =?us-ascii?Q?i62LmX6hPqeN+fCAz1zX32dvSQEQqY2ORfHcK8+keFQadS9q8h9AdIdfd/fP?=
 =?us-ascii?Q?ApNJv/f7zcmcLIsyW7Wry7mcS5JVkr2BrTSTB9D3TnU6DQCD9B1aH6q76lZC?=
 =?us-ascii?Q?U3lDSF46bnRgWDcmpggE1tKYKWVTTFRLTJ62fXQZt9uNDYxhktk1gDc3bMjV?=
 =?us-ascii?Q?uMKNbDdeR6nHs8NpzOtyZGfPcoBVNnPDTG7T+GvNpI0Tod6dgJaz+jS9MpHJ?=
 =?us-ascii?Q?i2VZfQp8ObsW3pi3TqfkT5Xi9vZB49BWxspt/0utMiT4bqN0ay3ejxsiDfsn?=
 =?us-ascii?Q?8PSfaI41+lvDzWLVpUr/13JGJ9tR23DsOpP9hpJW4IPh3tfapYUE77GdjAhs?=
 =?us-ascii?Q?D1u7G6WILk1GEyyTU8Rx+yfaUUMZCNpr7kVM4TX546FmEKPeLetx5dJo804G?=
 =?us-ascii?Q?ZF3R7qDS8f9Mv4A=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:30:07.9457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 746c51ab-3a38-4921-5d20-08dd4740ddc1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8431
Message-ID-Hash: V5EV5AGNTG2FTQYAYU52CBXR46U4D5DF
X-Message-ID-Hash: V5EV5AGNTG2FTQYAYU52CBXR46U4D5DF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V5EV5AGNTG2FTQYAYU52CBXR46U4D5DF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add Soundwie dma interrupts handling for ACP7.0 & ACP7.1 platforms.
Add acp pci revision id conditional checks for handling platform specific
implementation.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h     |  6 ++++
 sound/soc/amd/ps/pci-ps.c    | 61 ++++++++++++++++++++++++++++++------
 sound/soc/amd/ps/ps-common.c | 24 ++++++++++++++
 3 files changed, 81 insertions(+), 10 deletions(-)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 0aef3a852ff1..48dac2a044c2 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -332,6 +332,10 @@ struct acp_hw_ops {
  * manager-SW0 instance
  * @acp63_sdw_dma_intr_stat: DMA interrupt status array for ACP6.3 platform SoundWire
  * manager-SW1 instance
+ * @acp70_sdw0-dma_intr_stat: DMA interrupt status array for ACP7.0 platform SoundWire
+ * manager-SW0 instance
+ * @acp70_sdw_dma_intr_stat: DMA interrupt status array for ACP7.0 platform SoundWire
+ * manager-SW1 instance
  */
 
 struct acp63_dev_data {
@@ -357,6 +361,8 @@ struct acp63_dev_data {
 	u32 acp_rev;
 	u16 acp63_sdw0_dma_intr_stat[ACP63_SDW0_DMA_MAX_STREAMS];
 	u16 acp63_sdw1_dma_intr_stat[ACP63_SDW1_DMA_MAX_STREAMS];
+	u16 acp70_sdw0_dma_intr_stat[ACP70_SDW0_DMA_MAX_STREAMS];
+	u16 acp70_sdw1_dma_intr_stat[ACP70_SDW1_DMA_MAX_STREAMS];
 };
 
 void acp63_hw_init_ops(struct acp_hw_ops *hw_ops);
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 8f73d2ce2197..a9e140ca1296 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -52,20 +52,61 @@ static short int check_and_handle_sdw_dma_irq(struct acp63_dev_data *adata, u32
 					stream_id = ACP63_SDW0_AUDIO2_RX;
 					break;
 				}
-				adata->acp63_sdw0_dma_intr_stat[stream_id] = 1;
+				if (adata->acp_rev >= ACP70_PCI_REV)
+					adata->acp70_sdw0_dma_intr_stat[stream_id] = 1;
+				else
+					adata->acp63_sdw0_dma_intr_stat[stream_id] = 1;
+
 				sdw_dma_irq_flag = 1;
 			}
 		}
 	}
-	if (ext_intr_stat1 & ACP63_P1_AUDIO1_RX_THRESHOLD) {
-		writel(ACP63_P1_AUDIO1_RX_THRESHOLD, adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
-		adata->acp63_sdw1_dma_intr_stat[ACP63_SDW1_AUDIO1_RX] = 1;
-		sdw_dma_irq_flag = 1;
-	}
-	if (ext_intr_stat1 & ACP63_P1_AUDIO1_TX_THRESHOLD) {
-		writel(ACP63_P1_AUDIO1_TX_THRESHOLD, adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
-		adata->acp63_sdw1_dma_intr_stat[ACP63_SDW1_AUDIO1_TX] = 1;
-		sdw_dma_irq_flag = 1;
+	if (adata->acp_rev == ACP63_PCI_REV) {
+		if (ext_intr_stat1 & ACP63_P1_AUDIO1_RX_THRESHOLD) {
+			writel(ACP63_P1_AUDIO1_RX_THRESHOLD,
+			       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
+		       adata->acp63_sdw1_dma_intr_stat[ACP63_SDW1_AUDIO1_RX] = 1;
+			sdw_dma_irq_flag = 1;
+		}
+		if (ext_intr_stat1 & ACP63_P1_AUDIO1_TX_THRESHOLD) {
+			writel(ACP63_P1_AUDIO1_TX_THRESHOLD,
+			       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
+			adata->acp63_sdw1_dma_intr_stat[ACP63_SDW1_AUDIO1_TX] = 1;
+			sdw_dma_irq_flag = 1;
+		}
+	} else  {
+		if (ext_intr_stat1 & ACP70_P1_SDW_DMA_IRQ_MASK) {
+			for (index = ACP70_P1_AUDIO2_RX_THRESHOLD;
+			     index <= ACP70_P1_AUDIO0_TX_THRESHOLD; index++) {
+				if (ext_intr_stat1 & BIT(index)) {
+					writel(BIT(index),
+					       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
+					switch (index) {
+					case ACP70_P1_AUDIO0_TX_THRESHOLD:
+						stream_id = ACP70_SDW_AUDIO0_TX;
+						break;
+					case ACP70_P1_AUDIO1_TX_THRESHOLD:
+						stream_id = ACP70_SDW_AUDIO1_TX;
+						break;
+					case ACP70_P1_AUDIO2_TX_THRESHOLD:
+						stream_id = ACP70_SDW_AUDIO2_TX;
+						break;
+					case ACP70_P1_AUDIO0_RX_THRESHOLD:
+						stream_id = ACP70_SDW_AUDIO0_RX;
+						break;
+					case ACP70_P1_AUDIO1_RX_THRESHOLD:
+						 stream_id = ACP70_SDW_AUDIO1_RX;
+						break;
+					case ACP70_P1_AUDIO2_RX_THRESHOLD:
+						stream_id = ACP70_SDW_AUDIO2_RX;
+						break;
+					}
+
+					adata->acp70_sdw1_dma_intr_stat[stream_id] = 1;
+					sdw_dma_irq_flag = 1;
+				}
+			}
+		}
 	}
 	return sdw_dma_irq_flag;
 }
diff --git a/sound/soc/amd/ps/ps-common.c b/sound/soc/amd/ps/ps-common.c
index 6639dac0a415..1c89fb5fe1da 100644
--- a/sound/soc/amd/ps/ps-common.c
+++ b/sound/soc/amd/ps/ps-common.c
@@ -378,6 +378,29 @@ static void acp70_get_config(struct pci_dev *pci, struct acp63_dev_data *acp_dat
 	}
 }
 
+static void acp70_sdw_dma_irq_thread(struct acp63_dev_data *adata)
+{
+	struct sdw_dma_dev_data *sdw_data;
+	u32 stream_id;
+
+	sdw_data = dev_get_drvdata(&adata->sdw_dma_dev->dev);
+
+	for (stream_id = 0; stream_id < ACP70_SDW0_DMA_MAX_STREAMS; stream_id++) {
+		if (adata->acp70_sdw0_dma_intr_stat[stream_id]) {
+			if (sdw_data->acp70_sdw0_dma_stream[stream_id])
+				snd_pcm_period_elapsed(sdw_data->acp70_sdw0_dma_stream[stream_id]);
+			adata->acp70_sdw0_dma_intr_stat[stream_id] = 0;
+		}
+	}
+	for (stream_id = 0; stream_id < ACP70_SDW1_DMA_MAX_STREAMS; stream_id++) {
+		if (adata->acp70_sdw1_dma_intr_stat[stream_id]) {
+			if (sdw_data->acp70_sdw1_dma_stream[stream_id])
+				snd_pcm_period_elapsed(sdw_data->acp70_sdw1_dma_stream[stream_id]);
+			adata->acp70_sdw1_dma_intr_stat[stream_id] = 0;
+		}
+	}
+}
+
 static int __maybe_unused snd_acp70_suspend(struct device *dev)
 {
 	struct acp63_dev_data *adata;
@@ -444,6 +467,7 @@ void acp70_hw_init_ops(struct acp_hw_ops *hw_ops)
 	hw_ops->acp_init = acp70_init;
 	hw_ops->acp_deinit = acp70_deinit;
 	hw_ops->acp_get_config = acp70_get_config;
+	hw_ops->acp_sdw_dma_irq_thread = acp70_sdw_dma_irq_thread;
 	hw_ops->acp_suspend = snd_acp70_suspend;
 	hw_ops->acp_resume = snd_acp70_resume;
 	hw_ops->acp_suspend_runtime = snd_acp70_suspend;
-- 
2.34.1

