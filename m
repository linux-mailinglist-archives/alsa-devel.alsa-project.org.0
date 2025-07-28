Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7153BB137DD
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jul 2025 11:44:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD79460231;
	Mon, 28 Jul 2025 11:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD79460231
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753695857;
	bh=Ac/e3WOlI1BK6L0MOb2bSDzeMco9hftuTLwPesefgWY=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aB2cbzdC7XBl4zSiUtRzLrmyZ+2IVtN9wpkwgNdxUt4GiVjQnOhirdAJVQnZ6g5JM
	 +kfaP3ME571EGWf5lFfFCzQ9cWDVnHXPaaieQ7HguFvlT7FAFn7/ik9+a+uHyltdWK
	 jfNM7xuxRTTFe2RRKhkQTNZcPQeiQpKYM7xyq8tw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BCB0F805C8; Mon, 28 Jul 2025 11:43:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4671F805C3;
	Mon, 28 Jul 2025 11:43:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9032F80494; Mon, 28 Jul 2025 11:43:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A06F2F80093
	for <alsa-devel@alsa-project.org>; Mon, 28 Jul 2025 11:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A06F2F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=physhgb8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xa2kh30wh+lqIiLhKApbecNn3bei5HYllMnVXTLWmayUS4Ekhfz63Ytlt1NLA6fIyoHVMeDF3rZz5YzbOiYrNhINGA/Ibuw3n2VUYMjr0uaS0f8H+NJIcB0E0TBw0cwx60jWapVxG7eAwcpnkkAtYSpfmGOSXgjG1Wcw6EbsX2lPtNFni3mW+/CSAD+iSXOxmuvQorBSm0GlR3M4AbT8uMBN6WR5DfTc9V1nYW2Y72y1ec86B/p1kZfVQP75x1ggeXckmnqwZmel924xcZTsyU57NP1jZjAWGp4fnM+4bt5xMKkadhN8Re1t/qXbiaCwTOzIpUqws/3zF55zE0vQkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3exCClgwMZGUEiF2WOxyqU1W7XFOhZdQBiEwgfAbFEU=;
 b=CjDdLn+QcSE2PHmWB7wq9/Jy36AYwSMlSRhqtZSWyup2kf7/FDslDQvWJjblncjV9XXQXltHUOXDLykJ7P7Z4zq71zzgA7VsB+Hj9+dwx6jB1LwIH5udreM5nWaethHKejSn9xTxuUQjwZTVHBjvZ4F93iYSEL86Lo/iKRaEI2SmIkU7detpRDscvugLQ65QVNuYWqVqWKd25SSI1QqBiDLQhINeEOK9QbHSxCgPv2t/HjUNGtSAHaLToIX1oNmhdu2JtpD06NWyuAfm8XP0hv7nKMNYSnmOptkNC8s7gIBiZjUTRBMm4L4clTQDvSrLU1MZc2kbsCrwhdLRG/vV9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3exCClgwMZGUEiF2WOxyqU1W7XFOhZdQBiEwgfAbFEU=;
 b=physhgb8BKYfRcCLRU1TbETTIOmDdZgd8MxMQmAp43fI6qQl31NmI91w0tELAwrz5kvxSRVU7RYje687kQji/8zS0jmOTsSjheCS5pycvtjGkssNVZj11S1YvgLzuuQC5vdJrqiZifwqXQrBs3wOgiU2kDm2N82l4yn3PxTlABg=
Received: from CH0PR03CA0346.namprd03.prod.outlook.com (2603:10b6:610:11a::32)
 by DM3PR12MB9392.namprd12.prod.outlook.com (2603:10b6:0:44::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.26; Mon, 28 Jul 2025 09:42:51 +0000
Received: from DS3PEPF000099DA.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::df) by CH0PR03CA0346.outlook.office365.com
 (2603:10b6:610:11a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.25 via Frontend Transport; Mon,
 28 Jul 2025 09:42:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DA.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Mon, 28 Jul 2025 09:42:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 04:42:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 04:42:48 -0500
Received: from r9-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 28 Jul 2025 04:42:44 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <syed.sabakareem@amd.com>, "Venkata Prasad
 Potturu" <venkataprasad.potturu@amd.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Mario Limonciello <mario.limonciello@amd.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>, "open
 list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
	<linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH] ASoC: amd: acp: Adjust pdm dmic gain using module parameter
Date: Mon, 28 Jul 2025 15:12:27 +0530
Message-ID: <20250728094243.3824450-1-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DA:EE_|DM3PR12MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: 45f052d3-51a3-4d80-48cf-08ddcdbb1d95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?M7N0dtsqisR71kn8TKAfdAsTgdR3blfJu2SL2VMIBlXKPeWfzX2qSOkxqtFO?=
 =?us-ascii?Q?oO40h3LTu77McRDJ1YIzXlyuyiu7Z7Sj6jB7qRDLeL1G6g0cmFVfo6CrHM15?=
 =?us-ascii?Q?4c+6V5yPfVgy2MXzQ2oxZht20OK5gOQ1SsFyJ4pk9B3PSru/qoLPG4ML3w1Z?=
 =?us-ascii?Q?y9xgTd/83N8Uq+uWeft44SJaL/4hx6k0gNZfweE+DbQLlFKoPLKwRrEaJk9/?=
 =?us-ascii?Q?MI9cB1GZDMSrt3B2/A1+v7xg13bSnNXJiqZYhHoYRwCIVMXOIg7ElVyZ421P?=
 =?us-ascii?Q?ukLCa8X4/wXeo5o0h7nAXYSOLGw06Znc7TZAjuyAixyig8VRwyGOSNjESmmA?=
 =?us-ascii?Q?lAFlmiULbG5PhQaumnu+pXBW9zdG8sn7OzEhgNIQU+9AaxYPEL0xdUffI4GK?=
 =?us-ascii?Q?dtHs9ytK5WFMrdT5YOzNvJP83s8bJ1uHNT1jEX/UdZFdDW8ZVaTYyYEDAVrp?=
 =?us-ascii?Q?Sq8fqqTFN5eme4sHbDtkpwA8+SBn5XD6l13Cng+kZibA5u6qRf0ASpvZ1Lgh?=
 =?us-ascii?Q?V9I6sOXVk2MuyLv848xVynGWswg0wQFKJ4o3HSRYxdzimPpjuWegGO5zW+51?=
 =?us-ascii?Q?LTXT+NNSFCVnyU5YzzYV9f8TmNhAY94rQYw5+W2XHBiSbkbIsxxEchOxXdxK?=
 =?us-ascii?Q?X0my9UWF7iaNzkVgm3bj0rZPPLAqVFdf+gk9mD65iHfx4tMIKeydP7oiNrka?=
 =?us-ascii?Q?Ib9AlpFfwTXCiA8DNNKw/Jb1zg1/GxR7VXptDl3ENreNWjyNsOly7uQVSq2d?=
 =?us-ascii?Q?ldxeF2n6QvudlWVGi9vGfZbbHAJTSjIRWs8RQnvu0222FST4yutCijIuCD8O?=
 =?us-ascii?Q?G86xtGTtb0fB/HSNxCxTLE3XYLOHRfockLSHsMgi4djmeaYUtofKaVaZL5Dr?=
 =?us-ascii?Q?HIFz4N6Deg21b3OFOzJeERQviBcwqT7qCydvnXdmmS5Bha8RZTpCl1QKaq0o?=
 =?us-ascii?Q?L2yDCHlgGv/tLdxKt3yaS0pdDIXN15R0T60aNYiuMt5cEZdufKNiDNJytrYL?=
 =?us-ascii?Q?EIvjx+o+1s0eEeimXPr+pdeGYDdUkfi06xYnE7+2GOY8FhZN9WXatkGy51mP?=
 =?us-ascii?Q?DX1Qoj1L3HYX86BNoeJHffdJsS1fnUDeo23/YXFP2bML2i0AVZehKPisuyz9?=
 =?us-ascii?Q?kGMCGP6ohlTWTRCCkKxTdAG4Nh6FfQI0+t+cAwmbzR76ce3IQQNmZ4ALn29D?=
 =?us-ascii?Q?FtLjU+rLT4mQzF3MUGq/fhk7jJlYoY2pfJftvCJ6wAxafi/ZmxVkZvHRhBCg?=
 =?us-ascii?Q?IIySpU5tVBKL1xvC246uXWQMmVR5Vuk7M1l2DlnIKuvlAs0YE1jz6qv+Ldx1?=
 =?us-ascii?Q?MRZWq+Pxf6Vc9K2W6S//qABkzGJsVyQLnXAlS8ARXei/pqlMTsayy5qi53+E?=
 =?us-ascii?Q?r9qzuCx6rPKI5T7aTt0PGBnXf8+AEaXTXZiXUC/RMOs08ugwu0n/ze2zmvAv?=
 =?us-ascii?Q?iIRShse9a/d4fy3etFyhAmBB3Etl0Pt+qsLDuWG2R4NRuDIuhh2cXJxVsF27?=
 =?us-ascii?Q?lRBZ7IX4+8ecOpUBHAyM5p97t6k9Up/lQIRE?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 09:42:49.4571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 45f052d3-51a3-4d80-48cf-08ddcdbb1d95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9392
Message-ID-Hash: 3EKKXXLL4ICUQXJUWIQQRZTLKS3IM73S
X-Message-ID-Hash: 3EKKXXLL4ICUQXJUWIQQRZTLKS3IM73S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3EKKXXLL4ICUQXJUWIQQRZTLKS3IM73S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adjust pdm dimc gain value using module param.
In case of regressions for any users that the new pdm_gain value is
too high and for additional debugging, introduce a module parameter
that would let them configure it.

This parameter should be removed in the future:
 * If it's determined that the parameter is not needed, just hardcode
   the correct value as before
 * If users do end up using it to debug and report different values
   we should introduce a config knob that can have policy set by ucm.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-legacy-common.c | 3 ++-
 sound/soc/amd/acp/acp-pdm.c           | 3 ++-
 sound/soc/amd/acp/amd.h               | 6 +++++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index 57982d057c3a..dd804fb95790 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -173,7 +173,8 @@ static void set_acp_pdm_clk(struct snd_pcm_substream *substream,
 	/* Enable default ACP PDM clk */
 	writel(PDM_CLK_FREQ_MASK, chip->base + ACP_WOV_CLK_CTRL);
 	pdm_ctrl = readl(chip->base + ACP_WOV_MISC_CTRL);
-	pdm_ctrl |= PDM_MISC_CTRL_MASK;
+	pdm_ctrl &= ~ACP_WOV_GAIN_CONTROL;
+	pdm_ctrl |= FIELD_PREP(ACP_WOV_GAIN_CONTROL, clamp(pdm_gain, 0, 3));
 	writel(pdm_ctrl, chip->base + ACP_WOV_MISC_CTRL);
 	set_acp_pdm_ring_buffer(substream, dai);
 }
diff --git a/sound/soc/amd/acp/acp-pdm.c b/sound/soc/amd/acp/acp-pdm.c
index 1bfc34c2aa53..ffb622a7a69a 100644
--- a/sound/soc/amd/acp/acp-pdm.c
+++ b/sound/soc/amd/acp/acp-pdm.c
@@ -38,7 +38,8 @@ static int acp_dmic_prepare(struct snd_pcm_substream *substream,
 	/* Enable default DMIC clk */
 	writel(PDM_CLK_FREQ_MASK, chip->base + ACP_WOV_CLK_CTRL);
 	dmic_ctrl = readl(chip->base + ACP_WOV_MISC_CTRL);
-	dmic_ctrl |= PDM_MISC_CTRL_MASK;
+	dmic_ctrl &= ~ACP_WOV_GAIN_CONTROL;
+	dmic_ctrl |= FIELD_PREP(ACP_WOV_GAIN_CONTROL, clamp(pdm_gain, 0, 3));
 	writel(dmic_ctrl, chip->base + ACP_WOV_MISC_CTRL);
 
 	period_bytes = frames_to_bytes(substream->runtime,
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index cb8d97122f95..f2567e06ccd3 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -130,7 +130,7 @@
 #define PDM_DMA_INTR_MASK       0x10000
 #define PDM_DEC_64              0x2
 #define PDM_CLK_FREQ_MASK       0x07
-#define PDM_MISC_CTRL_MASK      0x10
+#define ACP_WOV_GAIN_CONTROL	GENMASK(4, 3)
 #define PDM_ENABLE              0x01
 #define PDM_DISABLE             0x00
 #define DMA_EN_MASK             0x02
@@ -138,6 +138,10 @@
 #define PDM_TIMEOUT             1000
 #define ACP_REGION2_OFFSET      0x02000000
 
+static int pdm_gain = 3;
+module_param(pdm_gain, int, 0644);
+MODULE_PARM_DESC(pdm_gain, "Gain control (0-3)");
+
 struct acp_chip_info {
 	char *name;		/* Platform name */
 	struct resource *res;
-- 
2.43.0

