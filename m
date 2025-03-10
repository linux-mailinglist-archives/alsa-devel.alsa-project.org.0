Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E241A591B6
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 11:49:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36018606FF;
	Mon, 10 Mar 2025 11:49:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36018606FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741603790;
	bh=Sz0b9ovFA0w0pSiimwC1zqNQgWZOHuSBlcViEiTNvpA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KSKjENM3QjwlXVzMn1skmNLaZ0kxNEeGWZbrqb2zGtzsL+uhNLXyC2CZEtEkUVQyd
	 ZeiH6ZUuwrSQNlwul8S9XMKkEndWycI1w/cjptU3Y8StuU/djQCYmfPxY8mr2bcrVu
	 /aFha5vKP4AM57ctJk9OV6M0g4V6v8cLLJ8IMccA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F26EF80608; Mon, 10 Mar 2025 11:47:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FCA4F806BC;
	Mon, 10 Mar 2025 11:47:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5539EF80600; Mon, 10 Mar 2025 11:47:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::611])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CEC9F805F3
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 11:47:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CEC9F805F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=abz8PKta
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9shCBPuA1fjpDG7effph1UIcDf0dl3rGWrOzi7uaWSwTi8Fk8x5t72RDRg76oO6QcCbTLyMh33b4b+y+l3XiNhDf35HBxOM5NnU5SrbPm1hzWuAMzyd1r/FwripMj21dmduVViNH6/pbvDn/6J3q44EpP8xnE5jfBjCsfKEEDNpdGBJJjUoI+ZTm2+3YFWK3JEVpTPaDrVLHziZqlX8yX6vF64gVsAF15WedM4+tQjN8BGogDLtW7yTnVpukBXiC+58Fwio6rjhQ+xwEdP8d7X1UuAPfqprjCTvL4qKM88q/CeE0KrCwZrjeBsDNbZox0YL2R30OUCgCPIX9qyzpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3Pru57q8S4o+CH08VjwxyoDBdY569biy1Fm5tdsXgQ=;
 b=nw8wcQT9V7xino+q9SAiPkj/QhttrXRxtvwiRlkC44vQa6JjrRlAzNZDQxC9GAo9UoM7lV4tU+D3FGlE6ySOt48Wv8iPFpNhUaaWqk6to6+qTz6zeOBQKTRRvrZ2kSwK7nuiO01K1RFFDLU8ydPKzv5+T1R5jXNErex4TWNKHQcTZ9UxMT2Yf2bqXH3+smItqv5V0Dn+8BIoa5zbObYRunJ6AqILYXXl6YnMiDdROorpe89Gcc38/OXBUwGWYcJKoz0YcTkFE2QQlLao1sHdoC4z8Ma1OlK/fti7h8zxS3Lui08/uhMqKJEOMxQGfym9Wok5TpZYjb44ImS6hx583w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3Pru57q8S4o+CH08VjwxyoDBdY569biy1Fm5tdsXgQ=;
 b=abz8PKtafO4pWLCP3BSsnylC/yFRuwBLQA5x9d+WeNZYYwN4dvoRRIbL7o4gxkI9EDz7DP6UKJLJiEp3DdFEevcIeNvyAc5g/k2CRq9HZAPvszpfTQGfaYq7vgsYNFc6356l1WN4RvIJ4yEwHOtnMdPS4qIjpfLmZL9UfQLJxIg=
Received: from PH7P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::9)
 by PH7PR12MB6811.namprd12.prod.outlook.com (2603:10b6:510:1b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 10:47:27 +0000
Received: from SJ1PEPF000026C3.namprd04.prod.outlook.com
 (2603:10b6:510:338:cafe::54) by PH7P223CA0012.outlook.office365.com
 (2603:10b6:510:338::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 10:47:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C3.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 10:47:27 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 05:47:24 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 05:47:20 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <mario.limonciello@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<syed.sabakareem@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>, "Jeff
 Johnson" <quic_jjohnson@quicinc.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 10/14] ASoC: amd: acp: Refactor acp70 platform resource
 structure
Date: Mon, 10 Mar 2025 16:15:57 +0530
Message-ID: <20250310104601.7325-11-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
References: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C3:EE_|PH7PR12MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: a35b5c3f-e59f-4363-fccb-08dd5fc0f30c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3ZLuWfc+rQY+8vcNqFUVZ3V/03Cc9fFz1ES1xbJvz+rtONcJZHLdbPjRGDk6?=
 =?us-ascii?Q?7z5GRb0OrvOuRCOFJ8mDOMeTfi1iEuLv1VoHvUbOjHiTT4+p81Po75tnCvCb?=
 =?us-ascii?Q?/hXL33B1o7ah3EU+sfEDDukMbt3cMBeL8FyXfYUSNZKX4iosC7oPgzLMAhhn?=
 =?us-ascii?Q?oGjQmGNiqp7gP4iVAUnPc1Kv10z0Fa3cwcOqKiORKa+UDiCUagVMIwGqu0nj?=
 =?us-ascii?Q?H6nmDaCi1G1IwJDg8+iM8/hG3qMboOwIqD0zK1/9cDN2x5P3/vQlvUZTWkZn?=
 =?us-ascii?Q?YwvnLMQaY7ucCkRVFMLiJoXSbUjA2Tmy5iRy2TX7o3rZ4L35Kv16c8WiVQNS?=
 =?us-ascii?Q?5muOH2BNvDPCqF9t+sjEe0fTNnEJJtyWpQW8+8V69m9Gzpqxu9nVi969WshG?=
 =?us-ascii?Q?HUnxFdxyMu9I/MxNHrUYXjCk2OgNtExIAxJw9NBTJeMwdq9S8rtYaKyvzdQb?=
 =?us-ascii?Q?KpqGYf9ktUOq1bhtevxpayZgxYMXPvKX/7hh3IvLrWN8qAPWFk1qbrbOgUKS?=
 =?us-ascii?Q?skuJ/fTTGUtqLLmZ2MaIdXS+cZo0v5Sh8eGIcBzhYaE4HQbVqvCsKA4oJfy0?=
 =?us-ascii?Q?KhwWrZephm31LIPv/2dxE8/hcFWm0Ycbp3l+j9qJdd5SYIkT2FMwoPe2uXj2?=
 =?us-ascii?Q?crDNdySOLCYQYQpES9JVrejS92t4de5ot6Ry6ipevlTYl/Snh6YNrbz+5NQE?=
 =?us-ascii?Q?2/f9mNmFV95jSv1oDdKa8UBlGTiSzXcMIahD/pfCHgeNgLzKhpXaUnCv7ds9?=
 =?us-ascii?Q?anxwj9umMiw9DdnZCLzVhLPiv1hXmwbyA6T+2BnR2LFamK0u+hLjpFGkqPKH?=
 =?us-ascii?Q?YntSW/cMmFaUDpDZb82x6RtClU0bz10e3Cz8SlGQOf+8YtfMp5oCiR3DHaK+?=
 =?us-ascii?Q?gFZBRI3wa13/JLlcDMPLUxuDkDW+CJHbks3w6iSmaauUsqg7jcs5ufEs7wPZ?=
 =?us-ascii?Q?s4yK281v1UuDKEcwZiTG/yR1wEswOC2x3tcShbG2dJbCv99jEE3geoHMJJ01?=
 =?us-ascii?Q?dz9+a5oIp5iK9i1qksJ3AuVqYqEOrXxoi9fmv2BxclemuabaMDR4kR313AXk?=
 =?us-ascii?Q?fwvU4JNUBCIvRoAO68cyASHlEkoK/nLeWki20XtNQ0QUuke1CypP/E26A6xM?=
 =?us-ascii?Q?Pg+AqPAazm/DbU0cpyhRAP5B3dg/CU7j06YeISwvQb5Yyl6t/XV2caMHgl0h?=
 =?us-ascii?Q?b4lgI6HaA1X/w9qKPWfDpxWd9prb2hgOEhd8SSFylAX+/6goAofYpRHd4oss?=
 =?us-ascii?Q?CrWYJnLV7Wqth1+d2mfW90mCcNcGIC3JLZS67mZT8f569cHaa4yZsq2cREeT?=
 =?us-ascii?Q?BMLIGLvzTiPhWqHCWDm3jUTVO4hVnhFsW6pARH/IbhA3xmec6X+FJ6U9tsDb?=
 =?us-ascii?Q?tZzDSC0aSf1U13J0UFAk8ydFq3hXsY/gNZ97d7hp4/F2N9Oc4kYjZmVKQgtw?=
 =?us-ascii?Q?A2gkt27iTdDVvRhUA08W+nAm+o3gagLtNOtj4Jq1TIDlFRDkZIRS5zzXoI9F?=
 =?us-ascii?Q?UVFO1POyhO6aiTE=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 10:47:27.0989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a35b5c3f-e59f-4363-fccb-08dd5fc0f30c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6811
Message-ID-Hash: ROFCSSJ7JPIGKDRX6IIW23BTERSGKZV7
X-Message-ID-Hash: ROFCSSJ7JPIGKDRX6IIW23BTERSGKZV7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ROFCSSJ7JPIGKDRX6IIW23BTERSGKZV7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor acp70 platform resource private structure to amd.h
header file.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-pci.c |  1 +
 sound/soc/amd/acp/acp70.c   | 11 -----------
 sound/soc/amd/acp/amd.h     | 10 ++++++++++
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index e89b39190200..2ced982e320c 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -151,6 +151,7 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 	case 0x70:
 	case 0x71:
 		chip->name = "acp_asoc_acp70";
+		chip->rsrc = &acp70_rsrc;
 		chip->acp_hw_ops_init = acp70_hw_ops_init;
 		chip->machines = snd_soc_acpi_amd_acp70_acp_machines;
 		break;
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index adc29b9131ad..9d066aadf1b6 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -30,16 +30,6 @@
 #define CLK7_CLK0_DFS_CNTL_N1		0X0006C1A4
 #define CLK0_DIVIDER			0X19
 
-static struct acp_resource rsrc = {
-	.offset = 0,
-	.no_of_ctrls = 2,
-	.irqp_used = 1,
-	.soc_mclk = true,
-	.irq_reg_offset = 0x1a00,
-	.scratch_reg_offset = 0x10000,
-	.sram_pte_offset = 0x03800000,
-};
-
 static struct snd_soc_dai_driver acp70_dai[] = {
 {
 	.name = "acp-i2s-sp",
@@ -153,7 +143,6 @@ static int acp_acp70_audio_probe(struct platform_device *pdev)
 	}
 
 	chip->dev = dev;
-	chip->rsrc = &rsrc;
 	chip->dai_driver = acp70_dai;
 	chip->num_dai = ARRAY_SIZE(acp70_dai);
 
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index 570aa20f02a9..de1e05fcf164 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -238,6 +238,16 @@ enum acp_config {
 	ACP_CONFIG_20,
 };
 
+struct acp_resource acp70_rsrc = {
+	.offset = 0,
+	.no_of_ctrls = 2,
+	.irqp_used = 1,
+	.soc_mclk = true,
+	.irq_reg_offset = 0x1a00,
+	.scratch_reg_offset = 0x10000,
+	.sram_pte_offset = 0x03800000,
+};
+
 struct snd_soc_acpi_codecs amp_rt1019 = {
 	.num_codecs = 1,
 	.codecs = {"10EC1019"}
-- 
2.39.2

