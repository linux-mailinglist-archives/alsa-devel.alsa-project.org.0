Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 211BAA5A304
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 19:34:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BDC560710;
	Mon, 10 Mar 2025 19:34:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BDC560710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741631679;
	bh=liZl/Y6fGih/3cvFbHkLxARRBQwGW4tdwR9Q1qrp01Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TfSPxPQdaY0AkdEC09q0RWBjL/B03f+yNG83por7DiZ91iIRUQiSqjLHa7CJlmcCb
	 os3ZrdjTZMuXUVRzgw9Xmp35xGEZwan1PrEwiHJiGtjK2Pvt+7mqqoEy5LnFEb/nAA
	 uRNEuEHzBx43a3JftiRnl9sCHd0al9tVKRJvVg3k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC2D5F805AD; Mon, 10 Mar 2025 19:33:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C38FF805B6;
	Mon, 10 Mar 2025 19:33:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47D49F8051D; Mon, 10 Mar 2025 19:33:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::603])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3274F8025F
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 19:33:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3274F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=NBg75fFB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqceNRaS9D0rK2QKZLmN4OjuGUZ32rK6hqG5avaJE08GU/DWKzFrxW3AD4pCETwBDuOpOQLbHa9Eb+eC95qRgZ8agAJZX6aqR1vbsnRc0G1h6Qhkw9GMZ1fkwKm679rFVVv7AtugfX3PI7IK5jPdLuj/zyrvPMvpDXAurKFtb16j5dnu0AhCk4ZHwldpY9REwyQAlpZxac2ihLX+VVYByN0vRIi8mC2Gjq8gvhptFHmh9JjFBWd5S1l1vgf+jwPD90rMCn1Ez964ZmigVuhgpnE4zwKX4/NWSJY0NM4qGOy8gJld7kRMs8f7DFBzc8X56xYQdX7U8hX2/znmYh0SkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uY7rv5gohp7osrs+Bv15b+sQwGFQGw3FQ55QEGZCClg=;
 b=U7haaYvsjI0i60azydL9h7IEoicj93dQ8YFkPYbFs7SEzwCB5A+6qJ3KIlB4dXPbZ5dN9dondNPR17ye6trkbAU08DK4fi5dWnVmK0vK0CfbwVlkRmmga36xBngG7haxZCsV5ofW+yIL6FsCHjNmicKsgYNfNtdxmdsWOABUtwF7QWx+UWp6N4Nh2UwfVhn7CF3mQXF4FV9NzZ0eUYhPBm67JnPCIT7Wv+1Rpush7cdf7OXvrHYZP8q6Uka/VrAv8w4ocEp1mV5+cfuzyzdixv20DauyX3rPp5vtZ7hyZrKQtt0k6tZnC/4JY8xOda39FcqSmZ64ZnHDIctF4QvnYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uY7rv5gohp7osrs+Bv15b+sQwGFQGw3FQ55QEGZCClg=;
 b=NBg75fFBE/wEUUWR1bu48MBgqvwwPAgF9EcNew7bINxTskPGfhhfh65Zf0T4tv9f2YgRVvtQFeHVfBJaZ89K2fhFZLC7yTnlxSGnqjz6U/0nmDI2ZVl3whd2fDZL/Cr1CtFlVltNr1m9DDK6EoD0okQ808HbCvX27WI1pCXgSHY=
Received: from BN8PR12CA0013.namprd12.prod.outlook.com (2603:10b6:408:60::26)
 by CH3PR12MB9169.namprd12.prod.outlook.com (2603:10b6:610:1a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 18:32:53 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:408:60:cafe::97) by BN8PR12CA0013.outlook.office365.com
 (2603:10b6:408:60::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.24 via Frontend Transport; Mon,
 10 Mar 2025 18:32:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 18:32:53 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 13:32:52 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 13:32:52 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 13:32:47 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Mario.Limonciello@amd.com>, <Vijendar.Mukunda@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<ssabakar@amd.com>, Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Peter Zijlstra <peterz@infradead.org>, Greg KH
	<gregkh@linuxfoundation.org>, Daniel Baluta <daniel.baluta@nxp.com>, "Jeff
 Johnson" <quic_jjohnson@quicinc.com>, Murad Masimov <m.masimov@maxima.ru>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 06/14] ASoC: amd: acp: Add new interrupt handle callbacks
 in acp_common_hw_ops
Date: Tue, 11 Mar 2025 00:01:53 +0530
Message-ID: <20250310183201.11979-7-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
References: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|CH3PR12MB9169:EE_
X-MS-Office365-Filtering-Correlation-Id: 229346e7-16eb-4124-fa71-08dd6001f833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3j3hc/ETFrYucuIGkUHWFAqOtzUQ0N/iA1rDy9VslbvbqXBE4Mz9D7F1WKph?=
 =?us-ascii?Q?xGpJvKrxXglEJWMdG4rDgTN1VUJqDTDq8/y7UJDozqha4xuvm20sfcw5lTTT?=
 =?us-ascii?Q?3OToczkO2Bnr3RCd46Hr0InVCJeQYAklWVQImpyQdXdO2wU3Q5tEOTS2rgVD?=
 =?us-ascii?Q?SVINTlu7Ft7YXr63Arf2egyOe99YF3Aw2qrkVzxqSO9CiT/f7+yrPuK1rHbv?=
 =?us-ascii?Q?/Ifr2nB4pBWa+LpPPoxKKRBvyUhd7JCIsyEqt6JB/6Jos+XB74e5zxZpGdhm?=
 =?us-ascii?Q?tjOKzzfAdOM/BXdvjIv7ZvCyHzy0UBXz7YnCwkFHyJP01VlmdruiLk3hdN8v?=
 =?us-ascii?Q?uxL3BsCQ+sfRE8hK7yMflytvfyMv7nAuXQXGotjSq4a8wGwj8MWgDag1KIpc?=
 =?us-ascii?Q?tHgq690h3z8nFmegeOZTgisVJhMS6oN4jsx200BVlOZSSOVYhW+QGhvWrs0R?=
 =?us-ascii?Q?OhanXQCCSQ6RzbyhBWdc8SDYGXjMhrYsoSwrQ5+e0vyqRjQl9TF+mypHTDr0?=
 =?us-ascii?Q?V4Eyq3Jt+I3FDU4i2nwc62BH/mV+rLSLy4/ON8L/OIhNHItN6ckDd/uWsfv9?=
 =?us-ascii?Q?apmZL7cFK5bUjaoPRwwzHZmrffeQsvZAWu87L+KtwEPKUR7rHQDCVcF1R6K8?=
 =?us-ascii?Q?huvPJ2vh8ZGHlFsUk5wud7+9n0m32JRO1pYm+awcFH821Ff3P0lHUMAPk5AE?=
 =?us-ascii?Q?9qVYnp9oP5xDHUL4GShDixbU055XdsRh6D6WohH4n25lYX39lV8pdw/ntxgi?=
 =?us-ascii?Q?RjVn7VtF6tCL2Zwb54zhXurxiknR2QtwluReqZvGKM8IxszLg6UGs7TpYY/I?=
 =?us-ascii?Q?JRjejDwEHyHW1cPgAqN3kt8Vb5nLhVb3joP1YvXOfdKcSZa+rrkyn9LLw8vl?=
 =?us-ascii?Q?OKpvun0qZh/f4amg8krx+ocRRznwJOg74PtMbO2VLOu/nyexBe3MD9WiI5FY?=
 =?us-ascii?Q?Kco05JeUPTCPWe3K/JLLCll/zFaHXJRD9B4D7VEczJoXo6fdiZ+rV0H+KoUl?=
 =?us-ascii?Q?jnpv86ekH/xmy6tCZykPt/jOrlb7vckTqGQ+y7yPSN5s1KwNIm9JE939kzv2?=
 =?us-ascii?Q?g/eoVFq53y8gjpC9QYXSY0lDO3jJYvePaPAZ96f0wNBdSw861OeOW+hvbq3V?=
 =?us-ascii?Q?D0zBONfW677oZQtOqnAD42L3mWrX5Y+KhRKjrQbIqoo5e6NhmC08GyN7BdYN?=
 =?us-ascii?Q?TEOQr52V7HdLkLgtvJV9xXg/FgtwGknCb2CioLHJp4+mZrEMzmeCR7/UWHwG?=
 =?us-ascii?Q?yWIKPMM+nY77BeUdixNdklCFJRMT8vKLsznwPF5codb0/3tzPyHFyx7s9ves?=
 =?us-ascii?Q?xotOW2ACUFjIt6QamRApuWon7ArslQ19pqyadumGNsKKGUC+QdMJgvUmhf+D?=
 =?us-ascii?Q?YyZGesy35vAJ1kQxw43c0OfqD6gfeAMRACBZZaJFDbJtMiqjGGFEoa1YpEIV?=
 =?us-ascii?Q?gPljyHwsGvUoVxqDhL18J/xw9qv23cmH3/VmsqRUa0JBT0MiHZrD/A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 18:32:53.1399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 229346e7-16eb-4124-fa71-08dd6001f833
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9169
Message-ID-Hash: HRAUT4KLTAK63TK6QI6UUVDVRWI5I4C3
X-Message-ID-Hash: HRAUT4KLTAK63TK6QI6UUVDVRWI5I4C3
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HRAUT4KLTAK63TK6QI6UUVDVRWI5I4C3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add new interrupt handle callbacks in acp_common_hw_ops.
Refactor and move interrupt handler registration form platform
driver to pci driver.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-i2s.c           |  4 +-
 sound/soc/amd/acp/acp-legacy-common.c | 79 +++++++++++++++++++++++----
 sound/soc/amd/acp/acp-pci.c           | 29 +++++++---
 sound/soc/amd/acp/acp-pdm.c           | 12 ++--
 sound/soc/amd/acp/acp-platform.c      | 50 +++--------------
 sound/soc/amd/acp/acp-rembrandt.c     | 15 ++++-
 sound/soc/amd/acp/acp-renoir.c        | 15 ++++-
 sound/soc/amd/acp/acp63.c             | 15 ++++-
 sound/soc/amd/acp/acp70.c             | 15 ++++-
 sound/soc/amd/acp/amd.h               | 29 +++++++++-
 sound/soc/amd/acp/chip_offset_byte.h  | 12 ++--
 11 files changed, 184 insertions(+), 91 deletions(-)

diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 89e99ed4275a..2f458c76f9fc 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -617,7 +617,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 	writel(acp_fifo_addr, adata->acp_base + reg_fifo_addr);
 	writel(FIFO_SIZE, adata->acp_base + reg_fifo_size);
 
-	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
+	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(chip, rsrc->irqp_used));
 	ext_int_ctrl |= BIT(I2S_RX_THRESHOLD(rsrc->offset)) |
 			BIT(BT_RX_THRESHOLD(rsrc->offset)) |
 			BIT(I2S_TX_THRESHOLD(rsrc->offset)) |
@@ -625,7 +625,7 @@ static int acp_i2s_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 			BIT(HS_RX_THRESHOLD(rsrc->offset)) |
 			BIT(HS_TX_THRESHOLD(rsrc->offset));
 
-	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
+	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(chip, rsrc->irqp_used));
 
 	return 0;
 }
diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index 886615798b93..13fddce8df56 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -27,26 +27,76 @@ const struct snd_acp_hw_ops acp_common_hw_ops = {
 	/* ACP hardware initilizations */
 	.acp_init = acp_init,
 	.acp_deinit = acp_deinit,
+
+	/* ACP Interrupts*/
+	.irq = acp_irq_handler,
+	.en_interrupts = acp_enable_interrupts,
+	.dis_interrupts = acp_disable_interrupts,
 };
 EXPORT_SYMBOL_NS_GPL(acp_common_hw_ops, "SND_SOC_ACP_COMMON");
-void acp_enable_interrupts(struct acp_dev_data *adata)
+
+irqreturn_t acp_irq_handler(int irq, void *data)
 {
+	struct acp_chip_info *chip = data;
+	struct acp_dev_data *adata = chip->adata;
 	struct acp_resource *rsrc = adata->rsrc;
+	struct acp_stream *stream;
+	u16 i2s_flag = 0;
+	u32 ext_intr_stat, ext_intr_stat1;
+
+	if (adata->rsrc->no_of_ctrls == 2)
+		ext_intr_stat1 = readl(ACP_EXTERNAL_INTR_STAT(chip, (rsrc->irqp_used - 1)));
+
+	ext_intr_stat = readl(ACP_EXTERNAL_INTR_STAT(chip, rsrc->irqp_used));
+
+	spin_lock(&adata->acp_lock);
+	list_for_each_entry(stream, &adata->stream_list, list) {
+		if (ext_intr_stat & stream->irq_bit) {
+			writel(stream->irq_bit,
+			       ACP_EXTERNAL_INTR_STAT(chip, rsrc->irqp_used));
+			snd_pcm_period_elapsed(stream->substream);
+			i2s_flag = 1;
+		}
+		if (adata->rsrc->no_of_ctrls == 2) {
+			if (ext_intr_stat1 & stream->irq_bit) {
+				writel(stream->irq_bit, ACP_EXTERNAL_INTR_STAT(chip,
+				       (rsrc->irqp_used - 1)));
+				snd_pcm_period_elapsed(stream->substream);
+				i2s_flag = 1;
+			}
+		}
+	}
+	spin_unlock(&adata->acp_lock);
+	if (i2s_flag)
+		return IRQ_HANDLED;
+
+	return IRQ_NONE;
+}
+
+int acp_enable_interrupts(struct acp_chip_info *chip)
+{
+	struct acp_resource *rsrc;
 	u32 ext_intr_ctrl;
 
-	writel(0x01, ACP_EXTERNAL_INTR_ENB(adata));
-	ext_intr_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
+	rsrc = chip->rsrc;
+	writel(0x01, ACP_EXTERNAL_INTR_ENB(chip));
+	ext_intr_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(chip, rsrc->irqp_used));
 	ext_intr_ctrl |= ACP_ERROR_MASK;
-	writel(ext_intr_ctrl, ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
+	writel(ext_intr_ctrl, ACP_EXTERNAL_INTR_CNTL(chip, rsrc->irqp_used));
+
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(acp_enable_interrupts, "SND_SOC_ACP_COMMON");
 
-void acp_disable_interrupts(struct acp_dev_data *adata)
+int acp_disable_interrupts(struct acp_chip_info *chip)
 {
-	struct acp_resource *rsrc = adata->rsrc;
+	struct acp_resource *rsrc;
+
+	rsrc = chip->rsrc;
+	writel(ACP_EXT_INTR_STAT_CLEAR_MASK, ACP_EXTERNAL_INTR_STAT(chip, rsrc->irqp_used));
+	writel(0x00, ACP_EXTERNAL_INTR_ENB(chip));
 
-	writel(ACP_EXT_INTR_STAT_CLEAR_MASK, ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
-	writel(0x00, ACP_EXTERNAL_INTR_ENB(adata));
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(acp_disable_interrupts, "SND_SOC_ACP_COMMON");
 
@@ -90,19 +140,23 @@ void restore_acp_pdm_params(struct snd_pcm_substream *substream,
 			    struct acp_dev_data *adata)
 {
 	struct snd_soc_dai *dai;
+	struct device *dev;
+	struct acp_chip_info *chip;
 	struct snd_soc_pcm_runtime *soc_runtime;
 	u32 ext_int_ctrl;
 
 	soc_runtime = snd_soc_substream_to_rtd(substream);
 	dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
+	dev = dai->component->dev;
+	chip = dev_get_platdata(dev);
 	/* Programming channel mask and sampling rate */
 	writel(adata->ch_mask, adata->acp_base + ACP_WOV_PDM_NO_OF_CHANNELS);
 	writel(PDM_DEC_64, adata->acp_base + ACP_WOV_PDM_DECIMATION_FACTOR);
 
 	/* Enabling ACP Pdm interuppts */
-	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(adata, 0));
+	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(chip, 0));
 	ext_int_ctrl |= PDM_DMA_INTR_MASK;
-	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(adata, 0));
+	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(chip, 0));
 	set_acp_pdm_clk(substream, dai);
 }
 EXPORT_SYMBOL_NS_GPL(restore_acp_pdm_params, "SND_SOC_ACP_COMMON");
@@ -113,6 +167,7 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 	struct device *dev = dai->component->dev;
 	struct acp_dev_data *adata = dev_get_drvdata(dev);
 	struct acp_resource *rsrc = adata->rsrc;
+	struct acp_chip_info *chip = dev_get_platdata(dev);
 	struct acp_stream *stream = substream->runtime->private_data;
 	u32 reg_dma_size, reg_fifo_size, reg_fifo_addr;
 	u32 phy_addr, acp_fifo_addr, ext_int_ctrl;
@@ -185,7 +240,7 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 	writel(acp_fifo_addr, adata->acp_base + reg_fifo_addr);
 	writel(FIFO_SIZE, adata->acp_base + reg_fifo_size);
 
-	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
+	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(chip, rsrc->irqp_used));
 	ext_int_ctrl |= BIT(I2S_RX_THRESHOLD(rsrc->offset)) |
 			BIT(BT_RX_THRESHOLD(rsrc->offset)) |
 			BIT(I2S_TX_THRESHOLD(rsrc->offset)) |
@@ -193,7 +248,7 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 			BIT(HS_RX_THRESHOLD(rsrc->offset)) |
 			BIT(HS_TX_THRESHOLD(rsrc->offset));
 
-	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
+	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(chip, rsrc->irqp_used));
 	return 0;
 }
 
diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 99297a388ed7..1ef9faba1d8a 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -26,6 +26,15 @@
 #define ACP3x_REG_START	0x1240000
 #define ACP3x_REG_END	0x125C000
 
+static irqreturn_t irq_handler(int irq, void *data)
+{
+	struct acp_chip_info *chip = data;
+
+	if (chip && chip->acp_hw_ops && chip->acp_hw_ops->irq)
+		return chip->acp_hw_ops->irq(irq, chip);
+
+	return IRQ_NONE;
+}
 static void acp_fill_platform_dev_info(struct platform_device_info *pdevinfo,
 				       struct device *parent,
 				       struct fwnode_handle *fw_node,
@@ -166,6 +175,13 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	if (ret)
 		goto release_regions;
 
+	ret = devm_request_irq(dev, pci->irq, irq_handler,
+			       IRQF_SHARED, "ACP_I2S_IRQ", chip);
+	if (ret) {
+		dev_err(&pci->dev, "ACP I2S IRQ request failed %d\n", ret);
+		return ret;
+	}
+
 	check_acp_config(pci, chip);
 	if (!chip->is_pdm_dev && !chip->is_i2s_config)
 		goto skip_pdev_creation;
@@ -213,20 +229,17 @@ static int __maybe_unused snd_acp_suspend(struct device *dev)
 static int __maybe_unused snd_acp_resume(struct device *dev)
 {
 	struct acp_chip_info *chip;
-	struct acp_dev_data *adata;
-	struct device child;
 	int ret;
 
 	chip = dev_get_drvdata(dev);
 	ret = acp_hw_init(chip);
 	if (ret)
 		dev_err(dev, "ACP init failed\n");
-	if (chip->chip_pdev) {
-		child = chip->chip_pdev->dev;
-		adata = dev_get_drvdata(&child);
-		if (adata)
-			acp_enable_interrupts(adata);
-	}
+
+	ret = acp_hw_en_interrupts(chip);
+	if (ret)
+		dev_err(dev, "ACP en-interrupts failed\n");
+
 	return ret;
 }
 
diff --git a/sound/soc/amd/acp/acp-pdm.c b/sound/soc/amd/acp/acp-pdm.c
index d4855da05b6a..9a820ef3bf46 100644
--- a/sound/soc/amd/acp/acp-pdm.c
+++ b/sound/soc/amd/acp/acp-pdm.c
@@ -145,7 +145,7 @@ static int acp_dmic_dai_startup(struct snd_pcm_substream *substream,
 {
 	struct acp_stream *stream = substream->runtime->private_data;
 	struct device *dev = dai->component->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
 	u32 ext_int_ctrl;
 
 	stream->dai_id = DMIC_INSTANCE;
@@ -154,9 +154,9 @@ static int acp_dmic_dai_startup(struct snd_pcm_substream *substream,
 	stream->reg_offset = ACP_REGION2_OFFSET;
 
 	/* Enable DMIC Interrupts */
-	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(adata, 0));
+	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(chip, 0));
 	ext_int_ctrl |= PDM_DMA_INTR_MASK;
-	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(adata, 0));
+	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(chip, 0));
 
 	return 0;
 }
@@ -165,13 +165,13 @@ static void acp_dmic_dai_shutdown(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct device *dev = dai->component->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
 	u32 ext_int_ctrl;
 
 	/* Disable DMIC interrupts */
-	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(adata, 0));
+	ext_int_ctrl = readl(ACP_EXTERNAL_INTR_CNTL(chip, 0));
 	ext_int_ctrl &= ~PDM_DMA_INTR_MASK;
-	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(adata, 0));
+	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(chip, 0));
 }
 
 const struct snd_soc_dai_ops acp_dmic_dai_ops = {
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 7d6abff28b23..9b181fb5861c 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -107,43 +107,6 @@ static const struct snd_pcm_hardware acp6x_pcm_hardware_capture = {
 	.periods_max = CAPTURE_MAX_NUM_PERIODS,
 };
 
-static irqreturn_t i2s_irq_handler(int irq, void *data)
-{
-	struct acp_dev_data *adata = data;
-	struct acp_resource *rsrc = adata->rsrc;
-	struct acp_stream *stream;
-	u16 i2s_flag = 0;
-	u32 ext_intr_stat, ext_intr_stat1;
-
-	if (adata->rsrc->no_of_ctrls == 2)
-		ext_intr_stat1 = readl(ACP_EXTERNAL_INTR_STAT(adata, (rsrc->irqp_used - 1)));
-
-	ext_intr_stat = readl(ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
-
-	spin_lock(&adata->acp_lock);
-	list_for_each_entry(stream, &adata->stream_list, list) {
-		if (ext_intr_stat & stream->irq_bit) {
-			writel(stream->irq_bit,
-			       ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
-			snd_pcm_period_elapsed(stream->substream);
-			i2s_flag = 1;
-		}
-		if (adata->rsrc->no_of_ctrls == 2) {
-			if (ext_intr_stat1 & stream->irq_bit) {
-				writel(stream->irq_bit, ACP_EXTERNAL_INTR_STAT(adata,
-				       (rsrc->irqp_used - 1)));
-				snd_pcm_period_elapsed(stream->substream);
-				i2s_flag = 1;
-			}
-		}
-	}
-	spin_unlock(&adata->acp_lock);
-	if (i2s_flag)
-		return IRQ_HANDLED;
-
-	return IRQ_NONE;
-}
-
 void config_pte_for_stream(struct acp_dev_data *adata, struct acp_stream *stream)
 {
 	struct acp_resource *rsrc = adata->rsrc;
@@ -278,7 +241,7 @@ static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_subs
 	}
 	runtime->private_data = stream;
 
-	writel(1, ACP_EXTERNAL_INTR_ENB(adata));
+	writel(1, ACP_EXTERNAL_INTR_ENB(chip));
 
 	spin_lock_irq(&adata->acp_lock);
 	list_add_tail(&stream->list, &adata->stream_list);
@@ -363,16 +326,17 @@ static const struct snd_soc_component_driver acp_pcm_component = {
 int acp_platform_register(struct device *dev)
 {
 	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip;
 	struct snd_soc_dai_driver;
 	unsigned int status;
 
-	status = devm_request_irq(dev, adata->i2s_irq, i2s_irq_handler,
-				  IRQF_SHARED, "ACP_I2S_IRQ", adata);
-	if (status) {
-		dev_err(dev, "ACP I2S IRQ request failed\n");
-		return status;
+	chip = dev_get_platdata(dev);
+	if (!chip || !chip->base) {
+		dev_err(dev, "ACP chip data is NULL\n");
+		return -ENODEV;
 	}
 
+	chip->adata = adata;
 	status = devm_snd_soc_register_component(dev, &acp_pcm_component,
 						 adata->dai_driver,
 						 adata->num_dai);
diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index eb09878c0d5c..13633b3f3730 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -192,6 +192,7 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	chip->rsrc = &rsrc;
 	adata->i2s_irq = res->start;
 	adata->dev = dev;
 	adata->dai_driver = acp_rmb_dai;
@@ -208,7 +209,11 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 	}
-	acp_enable_interrupts(adata);
+	ret = acp_hw_en_interrupts(chip);
+	if (ret) {
+		dev_err(dev, "ACP en-interrupts failed\n");
+		return ret;
+	}
 	acp_platform_register(dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -221,9 +226,13 @@ static int rembrandt_audio_probe(struct platform_device *pdev)
 static void rembrandt_audio_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
+	int ret;
+
+	ret = acp_hw_dis_interrupts(chip);
+	if (ret)
+		dev_err(dev, "ACP dis-interrupts failed\n");
 
-	acp_disable_interrupts(adata);
 	acp_platform_unregister(dev);
 	pm_runtime_disable(&pdev->dev);
 }
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index 2b47c6bfc9e7..94ecb17684b7 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -142,6 +142,7 @@ static int renoir_audio_probe(struct platform_device *pdev)
 		return ret;
 	adata->i2s_irq = ret;
 
+	chip->rsrc = &rsrc;
 	adata->dev = dev;
 	adata->dai_driver = acp_renoir_dai;
 	adata->num_dai = ARRAY_SIZE(acp_renoir_dai);
@@ -150,7 +151,11 @@ static int renoir_audio_probe(struct platform_device *pdev)
 	adata->flag = chip->flag;
 
 	dev_set_drvdata(dev, adata);
-	acp_enable_interrupts(adata);
+	ret = acp_hw_en_interrupts(chip);
+	if (ret) {
+		dev_err(dev, "ACP en-interrupts failed\n");
+		return ret;
+	}
 	acp_platform_register(dev);
 
 	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
@@ -164,9 +169,13 @@ static int renoir_audio_probe(struct platform_device *pdev)
 static void renoir_audio_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
+	int ret;
+
+	ret = acp_hw_dis_interrupts(chip);
+	if (ret)
+		dev_err(dev, "ACP dis-interrupts failed\n");
 
-	acp_disable_interrupts(adata);
 	acp_platform_unregister(dev);
 }
 
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index 76a26b82e3ad..e38ad9f7fb48 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -243,6 +243,7 @@ static int acp63_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	chip->rsrc = &rsrc;
 	adata->i2s_irq = res->start;
 	adata->dev = dev;
 	adata->dai_driver = acp63_dai;
@@ -258,7 +259,11 @@ static int acp63_audio_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 	}
-	acp_enable_interrupts(adata);
+	ret = acp_hw_en_interrupts(chip);
+	if (ret) {
+		dev_err(dev, "ACP en-interrupts failed\n");
+		return ret;
+	}
 	acp_platform_register(dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -271,9 +276,13 @@ static int acp63_audio_probe(struct platform_device *pdev)
 static void acp63_audio_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
+	int ret;
+
+	ret = acp_hw_dis_interrupts(chip);
+	if (ret)
+		dev_err(dev, "ACP dis-interrupts failed\n");
 
-	acp_disable_interrupts(adata);
 	acp_platform_unregister(dev);
 	pm_runtime_disable(&pdev->dev);
 }
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index 3e603c5f736a..be4302a5a584 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -174,6 +174,7 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	chip->rsrc = &rsrc;
 	adata->i2s_irq = res->start;
 	adata->dev = dev;
 	adata->dai_driver = acp70_dai;
@@ -190,7 +191,11 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "Failed to set I2S master clock as 196.608MHz\n");
 		return ret;
 	}
-	acp_enable_interrupts(adata);
+	ret = acp_hw_en_interrupts(chip);
+	if (ret) {
+		dev_err(dev, "ACP en-interrupts failed\n");
+		return ret;
+	}
 	acp_platform_register(dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -203,9 +208,13 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 static void acp_acp70_audio_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct acp_dev_data *adata = dev_get_drvdata(dev);
+	struct acp_chip_info *chip = dev_get_platdata(dev);
+	int ret;
+
+	ret = acp_hw_dis_interrupts(chip);
+	if (ret)
+		dev_err(dev, "ACP dis-interrupts failed\n");
 
-	acp_disable_interrupts(adata);
 	acp_platform_unregister(dev);
 	pm_runtime_disable(&pdev->dev);
 }
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index b7a1b4aa8fef..4beaa9cae352 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -147,10 +147,12 @@ struct acp_chip_info {
 	struct snd_acp_hw_ops *acp_hw_ops;
 	int (*acp_hw_ops_init)(struct acp_chip_info *chip);
 	struct platform_device *chip_pdev;
+	struct acp_resource *rsrc; /* Platform specific resources*/
 	struct platform_device *dmic_codec_dev;
 	struct platform_device *acp_plat_dev;
 	struct platform_device *mach_dev;
 	struct snd_soc_acpi_mach *machines;
+	struct acp_dev_data *adata;
 	u32 addr;
 	unsigned int flag;	/* Distinguish b/w Legacy or Only PDM */
 	bool is_pdm_dev;	/* flag set to true when ACP PDM controller exists */
@@ -215,11 +217,19 @@ struct acp_dev_data {
  * struct snd_acp_hw_ops - ACP PCI driver platform specific ops
  * @acp_init: ACP initialization
  * @acp_deinit: ACP de-initialization
+ * @irq: ACP irq handler
+ * @en_interrupts: ACP enable interrupts
+ * @dis_interrupts: ACP disable interrupts
  */
 struct snd_acp_hw_ops {
 	/* ACP hardware initilizations */
 	int (*acp_init)(struct acp_chip_info *chip);
 	int (*acp_deinit)(struct acp_chip_info *chip);
+
+	/* ACP Interrupts*/
+	irqreturn_t (*irq)(int irq, void *data);
+	int (*en_interrupts)(struct acp_chip_info *chip);
+	int (*dis_interrupts)(struct acp_chip_info *chip);
 };
 
 enum acp_config {
@@ -332,8 +342,9 @@ int acp_machine_select(struct acp_chip_info *chip);
 
 int acp_init(struct acp_chip_info *chip);
 int acp_deinit(struct acp_chip_info *chip);
-void acp_enable_interrupts(struct acp_dev_data *adata);
-void acp_disable_interrupts(struct acp_dev_data *adata);
+int acp_enable_interrupts(struct acp_chip_info *chip);
+int acp_disable_interrupts(struct acp_chip_info *chip);
+irqreturn_t acp_irq_handler(int irq, void *data);
 
 extern struct snd_acp_hw_ops acp31_common_hw_ops;
 extern struct snd_acp_hw_ops acp6x_common_hw_ops;
@@ -370,6 +381,20 @@ static inline int acp_hw_deinit(struct acp_chip_info *chip)
 	return -EOPNOTSUPP;
 }
 
+static inline int acp_hw_en_interrupts(struct acp_chip_info *chip)
+{
+	if (chip && chip->acp_hw_ops && chip->acp_hw_ops->en_interrupts)
+		return chip->acp_hw_ops->en_interrupts(chip);
+	return -EOPNOTSUPP;
+}
+
+static inline int acp_hw_dis_interrupts(struct acp_chip_info *chip)
+{
+	if (chip && chip->acp_hw_ops && chip->acp_hw_ops->dis_interrupts)
+		chip->acp_hw_ops->dis_interrupts(chip);
+	return -EOPNOTSUPP;
+}
+
 static inline u64 acp_get_byte_count(struct acp_dev_data *adata, int dai_id, int direction)
 {
 	u64 byte_count = 0, low = 0, high = 0;
diff --git a/sound/soc/amd/acp/chip_offset_byte.h b/sound/soc/amd/acp/chip_offset_byte.h
index 117ea63e85c6..82275c9de53a 100644
--- a/sound/soc/amd/acp/chip_offset_byte.h
+++ b/sound/soc/amd/acp/chip_offset_byte.h
@@ -29,13 +29,13 @@
 #define ACP_PIN_CONFIG				0x1440
 #define ACP3X_PIN_CONFIG			0x1400
 
-#define ACP_EXTERNAL_INTR_REG_ADDR(adata, offset, ctrl) \
-	(adata->acp_base + adata->rsrc->irq_reg_offset + offset + (ctrl * 0x04))
+#define ACP_EXTERNAL_INTR_REG_ADDR(chip, offset, ctrl) \
+	(chip->base + chip->rsrc->irq_reg_offset + offset + (ctrl * 0x04))
 
-#define ACP_EXTERNAL_INTR_ENB(adata) ACP_EXTERNAL_INTR_REG_ADDR(adata, 0x0, 0x0)
-#define ACP_EXTERNAL_INTR_CNTL(adata, ctrl) ACP_EXTERNAL_INTR_REG_ADDR(adata, 0x4, ctrl)
-#define ACP_EXTERNAL_INTR_STAT(adata, ctrl) ACP_EXTERNAL_INTR_REG_ADDR(adata, \
-	(0x4 + (adata->rsrc->no_of_ctrls * 0x04)), ctrl)
+#define ACP_EXTERNAL_INTR_ENB(chip) ACP_EXTERNAL_INTR_REG_ADDR(chip, 0x0, 0x0)
+#define ACP_EXTERNAL_INTR_CNTL(chip, ctrl) ACP_EXTERNAL_INTR_REG_ADDR(chip, 0x4, ctrl)
+#define ACP_EXTERNAL_INTR_STAT(chip, ctrl) ACP_EXTERNAL_INTR_REG_ADDR(chip, \
+	(0x4 + (chip->rsrc->no_of_ctrls * 0x04)), ctrl)
 
 /* Registers from ACP_AUDIO_BUFFERS block */
 
-- 
2.39.2

