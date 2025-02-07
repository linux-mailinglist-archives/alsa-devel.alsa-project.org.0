Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B201EA2BB5D
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 07:29:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFD83601DF;
	Fri,  7 Feb 2025 07:29:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFD83601DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738909790;
	bh=z4V0cpml089OqW8VAQSHlVwl36PgQ+52+82F7R4SpvQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QI3HyTFwC7FCByQSK45yesQ5wtmh8oeJrpSie72B4nPGfVH2X6LHaMXLaV75cAvvq
	 RzuaZ8mkXTY+m1AL5YeH+xuddqB86qLHfRfqdEgaIjhEY7t9IrxPgWAWsmx+4AsZZs
	 iff0o35tbz/AIQNR4Bi1ykVvXFFdzUJD99U2u9XA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3404F805E6; Fri,  7 Feb 2025 07:28:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FC3FF805E9;
	Fri,  7 Feb 2025 07:28:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF998F80246; Fri,  7 Feb 2025 07:28:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:200a::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5DAAF80169
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 07:28:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5DAAF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=m1Tg6+BJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EGXwFsGmz/KFWU308TOmz56Q3OzrCjQyLHDT+buAwd75DH5waQOgSFKn9uMgdogBp/FoblpiX1dENZD8RNHAYK6j0wQyFq5+mav1eEXu18bWVkjxF69UrDYhlFq3G0xzvuuoEnqiEqiCMRAQlpov3wyHZNnRZHCsassYUMwSr/Ui69YwmuObXH5vvQvJB2KH3s8g1JnAl5Hk2KVFNZnBB0aq5IuxfDS5IMfiPP+2uhXfjg15UNjIfI0WHTaGjP+zp91fttgOIeBLhPdbznoLxLLtATgX6Sta57IvQu9dq7D246WSdG9aTQG18ykgSj/TKc/iDtxmdQ0xuUkB/Ys/bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccRvVBHj+hXh0lYzRrA5hxUUaGQELTztT3d5MJ7GiPE=;
 b=Hu20hqYt7cOYf26ljMHLwSP6xg2lFe5RGb2XNkg9wmXyEGuqthElZW8Fruf5Cr7M5TDmh7356VROCE9eyTpMLVZd9WGh0QRs8iv2BEBIJSzM1Fp+c4hYtDkJkQt3MniGEfuTC2+OodJvgB/Ble1J0O99ZfpNaHv9L24fXwOSKvAF4RWBJDMJnZiLg7+Cy0rbI5vNOyJ+g/aCZoDwGUTy/9z8sQNH9SZgP4q0C1L+i+HS3HEIxaFLb4UOlst76Iiu0NLWMQdUDZanfHKJ4qUZZ3Y5o63+6aNMG9TF9KB1YcH4Gb+PKHWQxdriR4spL9lFasZQCX0s3V5duXMw8Mof0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccRvVBHj+hXh0lYzRrA5hxUUaGQELTztT3d5MJ7GiPE=;
 b=m1Tg6+BJDx4iYg6y82K8aNH3qGpRX0tVwNNQcTCu/2COlGmF/jLwl9dDE8c1TUpT26fuJ8rZ8r8K9LEE6kSxxawofK9PWYvsWhc1T0m8b2pu1oq7cp8mRAXy0i08hskZ7imL5tqjCG8oU+i5eYE20fN047arC3SaXE/JVQEpolA=
Received: from BLAPR03CA0140.namprd03.prod.outlook.com (2603:10b6:208:32e::25)
 by SA1PR12MB7198.namprd12.prod.outlook.com (2603:10b6:806:2bf::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.28; Fri, 7 Feb
 2025 06:28:39 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:32e:cafe::7) by BLAPR03CA0140.outlook.office365.com
 (2603:10b6:208:32e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Fri,
 7 Feb 2025 06:28:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 06:28:39 +0000
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Feb 2025 00:28:34 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <venkataprasad.potturu@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH V3 01/25] ASoC: amd: ps: rename structure names,
 variable and other macros
Date: Fri, 7 Feb 2025 11:57:55 +0530
Message-ID: <20250207062819.1527184-2-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|SA1PR12MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: e78391dd-3eea-4ee1-d1e3-08dd4740a8bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?juhvQBeulVDfsMj+k27DjoAFOGBolkFFZluGHxN2ZlD+fknvgBkzyszqMtZr?=
 =?us-ascii?Q?spj1koKGJcK3QMLQjUXpjO03w3kunbibbtPCJShmPYKL8LC0v5GxBiS733LF?=
 =?us-ascii?Q?PJJdqnsdRpxILONTQoi5xgJXzrd4FYS9Zuxvpgyw2DNAGUiGtCyAKGS8g4Pc?=
 =?us-ascii?Q?7vj6XE0+IiTHiWRQxOeywob8vHOV7g3jvOO6g9Sx0xDZlBVaZcpi4foehYgZ?=
 =?us-ascii?Q?ZIcINlXgTMSzs5OQTsbnueT11wHzCnMcdo+3RXRjdULP0BufiAgv2WzG0HVp?=
 =?us-ascii?Q?Ne0d9HAvbo2RNDJfKu9tLjauqITmVe8KdhnluzDitaReV0U3pG/KuY81nA1c?=
 =?us-ascii?Q?SVAjZf0qR1YBlc+a5yka+lwh4328TGaX8FO1yGbEDvDpjZ67iV9t2mtUET9T?=
 =?us-ascii?Q?TrSMOn9psJMt0MOuPyDxi/CmX/prBcThu1mpg1LkqqoSIoRfc3OwVbIcDJi4?=
 =?us-ascii?Q?X8VAfjVNX19ArXIEZb2U9RbNJHRzr9G0l0N1AqpK2qqm27XkGkfDXtYYKv2E?=
 =?us-ascii?Q?iO9u8vkjiVAYQte40TpJ61XrVUms4p8f31JDD2C8LX7+L+uYoSIJ2swQx2sq?=
 =?us-ascii?Q?cEHhlcVpXWpWL2kYkpjnrIdLqRFVSmpwNvjqmADVzjc90Lj8ZskSAvTSJZJ0?=
 =?us-ascii?Q?x297sS748Fzr5vov0tE/JN8En2Ts1FibRyGzVpsKv6K76NnSmUf1Xvstrzzn?=
 =?us-ascii?Q?4uaMRp/+F25MtOoS+SqdHdt8iNihSynvsY0yLRs6Ssbra6N8G17MxaKiHpcX?=
 =?us-ascii?Q?oHo4alVJfRjIBcgXLsT1xGXaB/0TbZjA8pqDtXbmYorLbFD/IhQCgKWfaT8I?=
 =?us-ascii?Q?yaRn0cDFydMMwBZ4KM6WKI/MIYvAlUITkqKsopmoaYHtl7lzEa/pAtBtYo4O?=
 =?us-ascii?Q?Zr8iYPb77M/GFV6+Y6on3PMsIXglBf7bg8HloW1tBVMLVP0WF3Ppdx7zXoLM?=
 =?us-ascii?Q?8WG5kSJPyoLDS3k5IX+7Xu3zN4dg1t4f/lHW1ihnP0nJpnzvD28sUeko+ctj?=
 =?us-ascii?Q?3zolIGVNnE7yAj61AgFhgsvqLjVxhsPOnxmh/vzBpyTyIB51CkwFdofJdUM0?=
 =?us-ascii?Q?Lm8hNd7rGMNpHtX21J0CVTRUe481AWSz61JJhUeT1RQoB03hOosl5YZO8TEj?=
 =?us-ascii?Q?kCkiVX/XjEK8jZa8GKKQWgzgaGV37wRy11foDBgR5ooqCWsiTp+fQTn7TDWi?=
 =?us-ascii?Q?6WeEwieHt7qeRiTjHUlwOBzQWR67T0Qfa2HLtH9Ix/6UFeIml8chsYW42DuV?=
 =?us-ascii?Q?z4znxGk7jqYEabSOVXuCDUrEmqif5B3iP5XMqftztr1M9julrv/CN6bNnx7k?=
 =?us-ascii?Q?65AHqfVpptRNQYrQV3us1aLO8F7xdRndtvZNyjJpKS6MJxGGxAIelxzzDyln?=
 =?us-ascii?Q?DuAxYS9KoMv9822EO26903lVJu2k+qEE17VwezoMtpjnQxUzKPQmDa1EIujt?=
 =?us-ascii?Q?rFI3W/p/N5uCqrqH5F3Jlb6hJgdwcm5+2EtIHm0WP0BP/+lGQKZWzg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 06:28:39.0057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e78391dd-3eea-4ee1-d1e3-08dd4740a8bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7198
Message-ID-Hash: XYBVQ62GMZ26R76TUEIS7SKP2R5ZGI3D
X-Message-ID-Hash: XYBVQ62GMZ26R76TUEIS7SKP2R5ZGI3D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XYBVQ62GMZ26R76TUEIS7SKP2R5ZGI3D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rename macros and structure names, variable with ACP63 tag which are
specific to ACP6.3 platform.
Rename 'stream_index' and 'sdw_dma_data' variable names to avoid check
patch warnings.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h      | 66 ++++++++++++++++----------------
 sound/soc/amd/ps/pci-ps.c     | 64 +++++++++++++++----------------
 sound/soc/amd/ps/ps-sdw-dma.c | 72 +++++++++++++++++------------------
 3 files changed, 101 insertions(+), 101 deletions(-)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index e54eabaa4d3e..01910273624b 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -13,13 +13,13 @@
 #define ACP63_REG_END		0x125C000
 
 #define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
-#define ACP_PGFSM_CNTL_POWER_ON_MASK	1
-#define ACP_PGFSM_CNTL_POWER_OFF_MASK	0
-#define ACP_PGFSM_STATUS_MASK		3
-#define ACP_POWERED_ON			0
-#define ACP_POWER_ON_IN_PROGRESS	1
-#define ACP_POWERED_OFF		2
-#define ACP_POWER_OFF_IN_PROGRESS	3
+#define ACP63_PGFSM_CNTL_POWER_ON_MASK	1
+#define ACP63_PGFSM_CNTL_POWER_OFF_MASK	0
+#define ACP63_PGFSM_STATUS_MASK		3
+#define ACP63_POWERED_ON			0
+#define ACP63_POWER_ON_IN_PROGRESS	1
+#define ACP63_POWERED_OFF		2
+#define ACP63_POWER_OFF_IN_PROGRESS	3
 
 #define ACP_ERROR_MASK 0x20000000
 #define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
@@ -60,7 +60,7 @@
 #define AMD_SDW_MAX_MANAGERS		2
 
 /* time in ms for acp timeout */
-#define ACP_TIMEOUT		500
+#define ACP63_TIMEOUT		500
 
 #define ACP_SDW0_STAT			BIT(21)
 #define ACP_SDW1_STAT			BIT(2)
@@ -72,13 +72,13 @@
 #define ACP_AUDIO0_RX_THRESHOLD		0x1b
 #define ACP_AUDIO1_RX_THRESHOLD		0x19
 #define ACP_AUDIO2_RX_THRESHOLD		0x17
-#define ACP_P1_AUDIO1_TX_THRESHOLD	BIT(6)
-#define ACP_P1_AUDIO1_RX_THRESHOLD	BIT(5)
-#define ACP_SDW_DMA_IRQ_MASK		0x1F800000
-#define ACP_P1_SDW_DMA_IRQ_MASK		0x60
+#define ACP63_P1_AUDIO1_TX_THRESHOLD	BIT(6)
+#define ACP63_P1_AUDIO1_RX_THRESHOLD	BIT(5)
+#define ACP63_SDW_DMA_IRQ_MASK		0x1F800000
+#define ACP63_P1_SDW_DMA_IRQ_MASK	0x60
 #define ACP63_SDW0_DMA_MAX_STREAMS	6
 #define ACP63_SDW1_DMA_MAX_STREAMS	2
-#define ACP_P1_AUDIO_TX_THRESHOLD	6
+#define ACP63_P1_AUDIO_TX_THRESHOLD	6
 
 /*
  * Below entries describes SDW0 instance DMA stream id and DMA irq bit mapping
@@ -91,8 +91,8 @@
  * 4 (SDW0_AUDIO1_RX)	25
  * 5 (SDW0_AUDIO2_RX)	23
  */
-#define SDW0_DMA_TX_IRQ_MASK(i)	(ACP_AUDIO0_TX_THRESHOLD - (2 * (i)))
-#define SDW0_DMA_RX_IRQ_MASK(i)	(ACP_AUDIO0_RX_THRESHOLD - (2 * ((i) - 3)))
+#define ACP63_SDW0_DMA_TX_IRQ_MASK(i)	(ACP_AUDIO0_TX_THRESHOLD - (2 * (i)))
+#define ACP63_SDW0_DMA_RX_IRQ_MASK(i)	(ACP_AUDIO0_RX_THRESHOLD - (2 * ((i) - 3)))
 
 /*
  * Below entries describes SDW1 instance DMA stream id and DMA irq bit mapping
@@ -101,7 +101,7 @@
  * 0 (SDW1_AUDIO1_TX)	6
  * 1 (SDW1_AUDIO1_RX)	5
  */
-#define SDW1_DMA_IRQ_MASK(i)	(ACP_P1_AUDIO_TX_THRESHOLD - (i))
+#define ACP63_SDW1_DMA_IRQ_MASK(i)	(ACP63_P1_AUDIO_TX_THRESHOLD - (i))
 
 #define ACP_DELAY_US		5
 #define ACP_SDW_RING_BUFF_ADDR_OFFSET (128 * 1024)
@@ -148,18 +148,18 @@ enum acp_config {
 	ACP_CONFIG_15,
 };
 
-enum amd_sdw0_channel {
-	ACP_SDW0_AUDIO0_TX = 0,
-	ACP_SDW0_AUDIO1_TX,
-	ACP_SDW0_AUDIO2_TX,
-	ACP_SDW0_AUDIO0_RX,
-	ACP_SDW0_AUDIO1_RX,
-	ACP_SDW0_AUDIO2_RX,
+enum amd_acp63_sdw0_channel {
+	ACP63_SDW0_AUDIO0_TX = 0,
+	ACP63_SDW0_AUDIO1_TX,
+	ACP63_SDW0_AUDIO2_TX,
+	ACP63_SDW0_AUDIO0_RX,
+	ACP63_SDW0_AUDIO1_RX,
+	ACP63_SDW0_AUDIO2_RX,
 };
 
-enum amd_sdw1_channel {
-	ACP_SDW1_AUDIO1_TX,
-	ACP_SDW1_AUDIO1_RX,
+enum amd_acp63_sdw1_channel {
+	ACP63_SDW1_AUDIO1_TX,
+	ACP63_SDW1_AUDIO1_RX,
 };
 
 struct pdm_stream_instance {
@@ -180,8 +180,8 @@ struct pdm_dev_data {
 struct sdw_dma_dev_data {
 	void __iomem *acp_base;
 	struct mutex *acp_lock; /* used to protect acp common register access */
-	struct snd_pcm_substream *sdw0_dma_stream[ACP63_SDW0_DMA_MAX_STREAMS];
-	struct snd_pcm_substream *sdw1_dma_stream[ACP63_SDW1_DMA_MAX_STREAMS];
+	struct snd_pcm_substream *acp63_sdw0_dma_stream[ACP63_SDW0_DMA_MAX_STREAMS];
+	struct snd_pcm_substream *acp63_sdw1_dma_stream[ACP63_SDW1_DMA_MAX_STREAMS];
 };
 
 struct acp_sdw_dma_stream {
@@ -232,8 +232,10 @@ struct sdw_dma_ring_buf_reg {
  * @addr: pci ioremap address
  * @reg_range: ACP reigister range
  * @acp_rev: ACP PCI revision id
- * @sdw0-dma_intr_stat: DMA interrupt status array for SoundWire manager-SW0 instance
- * @sdw_dma_intr_stat: DMA interrupt status array for SoundWire manager-SW1 instance
+ * @acp63_sdw0-dma_intr_stat: DMA interrupt status array for ACP6.3 platform SoundWire
+ * manager-SW0 instance
+ * @acp63_sdw_dma_intr_stat: DMA interrupt status array for ACP6.3 platform SoundWire
+ * manager-SW1 instance
  */
 
 struct acp63_dev_data {
@@ -256,8 +258,8 @@ struct acp63_dev_data {
 	u32 addr;
 	u32 reg_range;
 	u32 acp_rev;
-	u16 sdw0_dma_intr_stat[ACP63_SDW0_DMA_MAX_STREAMS];
-	u16 sdw1_dma_intr_stat[ACP63_SDW1_DMA_MAX_STREAMS];
+	u16 acp63_sdw0_dma_intr_stat[ACP63_SDW0_DMA_MAX_STREAMS];
+	u16 acp63_sdw1_dma_intr_stat[ACP63_SDW1_DMA_MAX_STREAMS];
 };
 
 int snd_amd_acp_find_config(struct pci_dev *pci);
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 8b556950b855..f5beb7f14913 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -30,10 +30,10 @@ static int acp63_power_on(void __iomem *acp_base)
 	if (!val)
 		return val;
 
-	if ((val & ACP_PGFSM_STATUS_MASK) != ACP_POWER_ON_IN_PROGRESS)
-		writel(ACP_PGFSM_CNTL_POWER_ON_MASK, acp_base + ACP_PGFSM_CONTROL);
+	if ((val & ACP63_PGFSM_STATUS_MASK) != ACP63_POWER_ON_IN_PROGRESS)
+		writel(ACP63_PGFSM_CNTL_POWER_ON_MASK, acp_base + ACP_PGFSM_CONTROL);
 
-	return readl_poll_timeout(acp_base + ACP_PGFSM_STATUS, val, !val, DELAY_US, ACP_TIMEOUT);
+	return readl_poll_timeout(acp_base + ACP_PGFSM_STATUS, val, !val, DELAY_US, ACP63_TIMEOUT);
 }
 
 static int acp63_reset(void __iomem *acp_base)
@@ -45,13 +45,13 @@ static int acp63_reset(void __iomem *acp_base)
 
 	ret = readl_poll_timeout(acp_base + ACP_SOFT_RESET, val,
 				 val & ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK,
-				 DELAY_US, ACP_TIMEOUT);
+				 DELAY_US, ACP63_TIMEOUT);
 	if (ret)
 		return ret;
 
 	writel(0, acp_base + ACP_SOFT_RESET);
 
-	return readl_poll_timeout(acp_base + ACP_SOFT_RESET, val, !val, DELAY_US, ACP_TIMEOUT);
+	return readl_poll_timeout(acp_base + ACP_SOFT_RESET, val, !val, DELAY_US, ACP63_TIMEOUT);
 }
 
 static void acp63_enable_interrupts(void __iomem *acp_base)
@@ -104,24 +104,24 @@ static int acp63_deinit(void __iomem *acp_base, struct device *dev)
 
 static irqreturn_t acp63_irq_thread(int irq, void *context)
 {
-	struct sdw_dma_dev_data *sdw_dma_data;
+	struct sdw_dma_dev_data *sdw_data;
 	struct acp63_dev_data *adata = context;
-	u32 stream_index;
+	u32 stream_id;
 
-	sdw_dma_data = dev_get_drvdata(&adata->sdw_dma_dev->dev);
+	sdw_data = dev_get_drvdata(&adata->sdw_dma_dev->dev);
 
-	for (stream_index = 0; stream_index < ACP63_SDW0_DMA_MAX_STREAMS; stream_index++) {
-		if (adata->sdw0_dma_intr_stat[stream_index]) {
-			if (sdw_dma_data->sdw0_dma_stream[stream_index])
-				snd_pcm_period_elapsed(sdw_dma_data->sdw0_dma_stream[stream_index]);
-			adata->sdw0_dma_intr_stat[stream_index] = 0;
+	for (stream_id = 0; stream_id < ACP63_SDW0_DMA_MAX_STREAMS; stream_id++) {
+		if (adata->acp63_sdw0_dma_intr_stat[stream_id]) {
+			if (sdw_data->acp63_sdw0_dma_stream[stream_id])
+				snd_pcm_period_elapsed(sdw_data->acp63_sdw0_dma_stream[stream_id]);
+			adata->acp63_sdw0_dma_intr_stat[stream_id] = 0;
 		}
 	}
-	for (stream_index = 0; stream_index < ACP63_SDW1_DMA_MAX_STREAMS; stream_index++) {
-		if (adata->sdw1_dma_intr_stat[stream_index]) {
-			if (sdw_dma_data->sdw1_dma_stream[stream_index])
-				snd_pcm_period_elapsed(sdw_dma_data->sdw1_dma_stream[stream_index]);
-			adata->sdw1_dma_intr_stat[stream_index] = 0;
+	for (stream_id = 0; stream_id < ACP63_SDW1_DMA_MAX_STREAMS; stream_id++) {
+		if (adata->acp63_sdw1_dma_intr_stat[stream_id]) {
+			if (sdw_data->acp63_sdw1_dma_stream[stream_id])
+				snd_pcm_period_elapsed(sdw_data->acp63_sdw1_dma_stream[stream_id]);
+			adata->acp63_sdw1_dma_intr_stat[stream_id] = 0;
 		}
 	}
 	return IRQ_HANDLED;
@@ -180,48 +180,48 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
 			snd_pcm_period_elapsed(ps_pdm_data->capture_stream);
 		irq_flag = 1;
 	}
-	if (ext_intr_stat & ACP_SDW_DMA_IRQ_MASK) {
+	if (ext_intr_stat & ACP63_SDW_DMA_IRQ_MASK) {
 		for (index = ACP_AUDIO2_RX_THRESHOLD; index <= ACP_AUDIO0_TX_THRESHOLD; index++) {
 			if (ext_intr_stat & BIT(index)) {
 				writel(BIT(index), adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
 				switch (index) {
 				case ACP_AUDIO0_TX_THRESHOLD:
-					stream_id = ACP_SDW0_AUDIO0_TX;
+					stream_id = ACP63_SDW0_AUDIO0_TX;
 					break;
 				case ACP_AUDIO1_TX_THRESHOLD:
-					stream_id = ACP_SDW0_AUDIO1_TX;
+					stream_id = ACP63_SDW0_AUDIO1_TX;
 					break;
 				case ACP_AUDIO2_TX_THRESHOLD:
-					stream_id = ACP_SDW0_AUDIO2_TX;
+					stream_id = ACP63_SDW0_AUDIO2_TX;
 					break;
 				case ACP_AUDIO0_RX_THRESHOLD:
-					stream_id = ACP_SDW0_AUDIO0_RX;
+					stream_id = ACP63_SDW0_AUDIO0_RX;
 					break;
 				case ACP_AUDIO1_RX_THRESHOLD:
-					stream_id = ACP_SDW0_AUDIO1_RX;
+					stream_id = ACP63_SDW0_AUDIO1_RX;
 					break;
 				case ACP_AUDIO2_RX_THRESHOLD:
-					stream_id = ACP_SDW0_AUDIO2_RX;
+					stream_id = ACP63_SDW0_AUDIO2_RX;
 					break;
 				}
 
-				adata->sdw0_dma_intr_stat[stream_id] = 1;
+				adata->acp63_sdw0_dma_intr_stat[stream_id] = 1;
 				sdw_dma_irq_flag = 1;
 			}
 		}
 	}
 
-	if (ext_intr_stat1 & ACP_P1_AUDIO1_RX_THRESHOLD) {
-		writel(ACP_P1_AUDIO1_RX_THRESHOLD,
+	if (ext_intr_stat1 & ACP63_P1_AUDIO1_RX_THRESHOLD) {
+		writel(ACP63_P1_AUDIO1_RX_THRESHOLD,
 		       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
-		adata->sdw1_dma_intr_stat[ACP_SDW1_AUDIO1_RX] = 1;
+		adata->acp63_sdw1_dma_intr_stat[ACP63_SDW1_AUDIO1_RX] = 1;
 		sdw_dma_irq_flag = 1;
 	}
 
-	if (ext_intr_stat1 & ACP_P1_AUDIO1_TX_THRESHOLD) {
-		writel(ACP_P1_AUDIO1_TX_THRESHOLD,
+	if (ext_intr_stat1 & ACP63_P1_AUDIO1_TX_THRESHOLD) {
+		writel(ACP63_P1_AUDIO1_TX_THRESHOLD,
 		       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
-		adata->sdw1_dma_intr_stat[ACP_SDW1_AUDIO1_TX] = 1;
+		adata->acp63_sdw1_dma_intr_stat[ACP63_SDW1_AUDIO1_TX] = 1;
 		sdw_dma_irq_flag = 1;
 	}
 
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index b602cca92b8b..878683619a05 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -18,7 +18,7 @@
 
 #define DRV_NAME "amd_ps_sdw_dma"
 
-static struct sdw_dma_ring_buf_reg sdw0_dma_ring_buf_reg[ACP63_SDW0_DMA_MAX_STREAMS] = {
+static struct sdw_dma_ring_buf_reg acp63_sdw0_dma_reg[ACP63_SDW0_DMA_MAX_STREAMS] = {
 	{ACP_AUDIO0_TX_DMA_SIZE, ACP_AUDIO0_TX_FIFOADDR, ACP_AUDIO0_TX_FIFOSIZE,
 	 ACP_AUDIO0_TX_RINGBUFSIZE, ACP_AUDIO0_TX_RINGBUFADDR, ACP_AUDIO0_TX_INTR_WATERMARK_SIZE,
 	 ACP_AUDIO0_TX_LINEARPOSITIONCNTR_LOW, ACP_AUDIO0_TX_LINEARPOSITIONCNTR_HIGH},
@@ -44,7 +44,7 @@ static struct sdw_dma_ring_buf_reg sdw0_dma_ring_buf_reg[ACP63_SDW0_DMA_MAX_STRE
  * For TX/RX streams DMA registers programming for SDW1 instance, it uses ACP_P1_AUDIO1 register
  * set as per hardware register documentation
  */
-static struct sdw_dma_ring_buf_reg sdw1_dma_ring_buf_reg[ACP63_SDW1_DMA_MAX_STREAMS] =  {
+static struct sdw_dma_ring_buf_reg acp63_sdw1_dma_reg[ACP63_SDW1_DMA_MAX_STREAMS] =  {
 	{ACP_P1_AUDIO1_TX_DMA_SIZE, ACP_P1_AUDIO1_TX_FIFOADDR, ACP_P1_AUDIO1_TX_FIFOSIZE,
 	 ACP_P1_AUDIO1_TX_RINGBUFSIZE, ACP_P1_AUDIO1_TX_RINGBUFADDR,
 	 ACP_P1_AUDIO1_TX_INTR_WATERMARK_SIZE,
@@ -55,7 +55,7 @@ static struct sdw_dma_ring_buf_reg sdw1_dma_ring_buf_reg[ACP63_SDW1_DMA_MAX_STRE
 	 ACP_P1_AUDIO1_RX_LINEARPOSITIONCNTR_LOW, ACP_P1_AUDIO1_RX_LINEARPOSITIONCNTR_HIGH},
 };
 
-static u32 sdw0_dma_enable_reg[ACP63_SDW0_DMA_MAX_STREAMS] = {
+static u32 acp63_sdw0_dma_enable_reg[ACP63_SDW0_DMA_MAX_STREAMS] = {
 	ACP_SW0_AUDIO0_TX_EN,
 	ACP_SW0_AUDIO1_TX_EN,
 	ACP_SW0_AUDIO2_TX_EN,
@@ -70,7 +70,7 @@ static u32 sdw0_dma_enable_reg[ACP63_SDW0_DMA_MAX_STREAMS] = {
  * it uses ACP_SW1_AUDIO1_TX_EN and ACP_SW1_AUDIO1_RX_EN registers
  * as per hardware register documentation.
  */
-static u32 sdw1_dma_enable_reg[ACP63_SDW1_DMA_MAX_STREAMS] = {
+static u32 acp63_sdw1_dma_enable_reg[ACP63_SDW1_DMA_MAX_STREAMS] = {
 	ACP_SW1_AUDIO1_TX_EN,
 	ACP_SW1_AUDIO1_RX_EN,
 };
@@ -117,8 +117,8 @@ static const struct snd_pcm_hardware acp63_sdw_hardware_capture = {
 static void acp63_enable_disable_sdw_dma_interrupts(void __iomem *acp_base, bool enable)
 {
 	u32 ext_intr_cntl, ext_intr_cntl1;
-	u32 irq_mask = ACP_SDW_DMA_IRQ_MASK;
-	u32 irq_mask1 = ACP_P1_SDW_DMA_IRQ_MASK;
+	u32 irq_mask = ACP63_SDW_DMA_IRQ_MASK;
+	u32 irq_mask1 = ACP63_P1_SDW_DMA_IRQ_MASK;
 
 	if (enable) {
 		ext_intr_cntl = readl(acp_base + ACP_EXTERNAL_INTR_CNTL);
@@ -182,18 +182,18 @@ static int acp63_configure_sdw_ringbuffer(void __iomem *acp_base, u32 stream_id,
 
 	switch (manager_instance) {
 	case ACP_SDW0:
-		reg_dma_size = sdw0_dma_ring_buf_reg[stream_id].reg_dma_size;
-		reg_fifo_addr =	sdw0_dma_ring_buf_reg[stream_id].reg_fifo_addr;
-		reg_fifo_size = sdw0_dma_ring_buf_reg[stream_id].reg_fifo_size;
-		reg_ring_buf_size = sdw0_dma_ring_buf_reg[stream_id].reg_ring_buf_size;
-		reg_ring_buf_addr = sdw0_dma_ring_buf_reg[stream_id].reg_ring_buf_addr;
+		reg_dma_size = acp63_sdw0_dma_reg[stream_id].reg_dma_size;
+		reg_fifo_addr =	acp63_sdw0_dma_reg[stream_id].reg_fifo_addr;
+		reg_fifo_size = acp63_sdw0_dma_reg[stream_id].reg_fifo_size;
+		reg_ring_buf_size = acp63_sdw0_dma_reg[stream_id].reg_ring_buf_size;
+		reg_ring_buf_addr = acp63_sdw0_dma_reg[stream_id].reg_ring_buf_addr;
 		break;
 	case ACP_SDW1:
-		reg_dma_size = sdw1_dma_ring_buf_reg[stream_id].reg_dma_size;
-		reg_fifo_addr =	sdw1_dma_ring_buf_reg[stream_id].reg_fifo_addr;
-		reg_fifo_size = sdw1_dma_ring_buf_reg[stream_id].reg_fifo_size;
-		reg_ring_buf_size = sdw1_dma_ring_buf_reg[stream_id].reg_ring_buf_size;
-		reg_ring_buf_addr = sdw1_dma_ring_buf_reg[stream_id].reg_ring_buf_addr;
+		reg_dma_size = acp63_sdw1_dma_reg[stream_id].reg_dma_size;
+		reg_fifo_addr =	acp63_sdw1_dma_reg[stream_id].reg_fifo_addr;
+		reg_fifo_size = acp63_sdw1_dma_reg[stream_id].reg_fifo_size;
+		reg_ring_buf_size = acp63_sdw1_dma_reg[stream_id].reg_ring_buf_size;
+		reg_ring_buf_addr = acp63_sdw1_dma_reg[stream_id].reg_ring_buf_addr;
 		break;
 	default:
 		return -EINVAL;
@@ -267,19 +267,19 @@ static int acp63_sdw_dma_hw_params(struct snd_soc_component *component,
 	stream_id = stream->stream_id;
 	switch (stream->instance) {
 	case ACP_SDW0:
-		sdw_data->sdw0_dma_stream[stream_id] = substream;
-		water_mark_size_reg = sdw0_dma_ring_buf_reg[stream_id].water_mark_size_reg;
+		sdw_data->acp63_sdw0_dma_stream[stream_id] = substream;
+		water_mark_size_reg = acp63_sdw0_dma_reg[stream_id].water_mark_size_reg;
 		acp_ext_intr_cntl_reg = ACP_EXTERNAL_INTR_CNTL;
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			irq_mask = BIT(SDW0_DMA_TX_IRQ_MASK(stream_id));
+			irq_mask = BIT(ACP63_SDW0_DMA_TX_IRQ_MASK(stream_id));
 		else
-			irq_mask = BIT(SDW0_DMA_RX_IRQ_MASK(stream_id));
+			irq_mask = BIT(ACP63_SDW0_DMA_RX_IRQ_MASK(stream_id));
 		break;
 	case ACP_SDW1:
-		sdw_data->sdw1_dma_stream[stream_id] = substream;
+		sdw_data->acp63_sdw1_dma_stream[stream_id] = substream;
 		acp_ext_intr_cntl_reg = ACP_EXTERNAL_INTR_CNTL1;
-		water_mark_size_reg = sdw1_dma_ring_buf_reg[stream_id].water_mark_size_reg;
-		irq_mask = BIT(SDW1_DMA_IRQ_MASK(stream_id));
+		water_mark_size_reg = acp63_sdw1_dma_reg[stream_id].water_mark_size_reg;
+		irq_mask = BIT(ACP63_SDW1_DMA_IRQ_MASK(stream_id));
 		break;
 	default:
 		return -EINVAL;
@@ -310,12 +310,12 @@ static u64 acp63_sdw_get_byte_count(struct acp_sdw_dma_stream *stream, void __io
 	byte_count.bytescount = 0;
 	switch (stream->instance) {
 	case ACP_SDW0:
-		pos_low_reg = sdw0_dma_ring_buf_reg[stream->stream_id].pos_low_reg;
-		pos_high_reg = sdw0_dma_ring_buf_reg[stream->stream_id].pos_high_reg;
+		pos_low_reg = acp63_sdw0_dma_reg[stream->stream_id].pos_low_reg;
+		pos_high_reg = acp63_sdw0_dma_reg[stream->stream_id].pos_high_reg;
 		break;
 	case ACP_SDW1:
-		pos_low_reg = sdw1_dma_ring_buf_reg[stream->stream_id].pos_low_reg;
-		pos_high_reg = sdw1_dma_ring_buf_reg[stream->stream_id].pos_high_reg;
+		pos_low_reg = acp63_sdw1_dma_reg[stream->stream_id].pos_low_reg;
+		pos_high_reg = acp63_sdw1_dma_reg[stream->stream_id].pos_high_reg;
 		break;
 	default:
 		goto POINTER_RETURN_BYTES;
@@ -369,10 +369,10 @@ static int acp63_sdw_dma_close(struct snd_soc_component *component,
 		return -EINVAL;
 	switch (stream->instance) {
 	case ACP_SDW0:
-		sdw_data->sdw0_dma_stream[stream->stream_id] = NULL;
+		sdw_data->acp63_sdw0_dma_stream[stream->stream_id] = NULL;
 		break;
 	case ACP_SDW1:
-		sdw_data->sdw1_dma_stream[stream->stream_id] = NULL;
+		sdw_data->acp63_sdw1_dma_stream[stream->stream_id] = NULL;
 		break;
 	default:
 		return -EINVAL;
@@ -395,10 +395,10 @@ static int acp63_sdw_dma_enable(struct snd_pcm_substream *substream,
 	stream_id = stream->stream_id;
 	switch (stream->instance) {
 	case ACP_SDW0:
-		sdw_dma_en_reg = sdw0_dma_enable_reg[stream_id];
+		sdw_dma_en_reg = acp63_sdw0_dma_enable_reg[stream_id];
 		break;
 	case ACP_SDW1:
-		sdw_dma_en_reg = sdw1_dma_enable_reg[stream_id];
+		sdw_dma_en_reg = acp63_sdw1_dma_enable_reg[stream_id];
 		break;
 	default:
 		return -EINVAL;
@@ -512,13 +512,11 @@ static int acp_restore_sdw_dma_config(struct sdw_dma_dev_data *sdw_data)
 
 		for (index = 0; index < stream_count; index++) {
 			if (instance == ACP_SDW0) {
-				substream = sdw_data->sdw0_dma_stream[index];
-				water_mark_size_reg =
-						sdw0_dma_ring_buf_reg[index].water_mark_size_reg;
+				substream = sdw_data->acp63_sdw0_dma_stream[index];
+				water_mark_size_reg = acp63_sdw0_dma_reg[index].water_mark_size_reg;
 			} else {
-				substream = sdw_data->sdw1_dma_stream[index];
-				water_mark_size_reg =
-						sdw1_dma_ring_buf_reg[index].water_mark_size_reg;
+				substream = sdw_data->acp63_sdw1_dma_stream[index];
+				water_mark_size_reg = acp63_sdw1_dma_reg[index].water_mark_size_reg;
 			}
 
 			if (substream && substream->runtime) {
-- 
2.34.1

