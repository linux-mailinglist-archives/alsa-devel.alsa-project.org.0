Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 243BFA591BA
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 11:50:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 910ED6076A;
	Mon, 10 Mar 2025 11:50:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 910ED6076A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741603810;
	bh=A5MM7gScOOTm1B30Ac1sIc4rA12+OiP/DOY+0PXzVqc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SwDArXJMd0QDwM3ghIt0b7fKF7e8CCb6LRvav3HLJjlFejdV09+2+dalL8spEM9Oa
	 EPZbN8FDyXGSKoaqc1cBHUPq4jTUGDYIVZzVQd/dMJcQisvwr4yaVU1QvyXDEX5DSk
	 EmfahwYljGiXYk9fpST4Q9GyFuYVQX7gc278UoVc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFD76F806ED; Mon, 10 Mar 2025 11:47:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 742A6F806DE;
	Mon, 10 Mar 2025 11:47:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1D8CF80601; Mon, 10 Mar 2025 11:47:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F06ABF805FD
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 11:47:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F06ABF805FD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=lPMkfJaJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTuo+EchNQJWUQjGHlriTcnlwIn7VZgAs0Bi0WozV6qL1ruCtIz6LunJkI1MX6aVaFRh2h+Z2CEVRtpZ1ZhBqRQZxrcnQFZmUtHPOXE3BK7xFez9P0fUz9xCRWAUBTtTdvG3g9HUDlsqQ0zKyKmtEtJmtXJ/kjk2E7WyQtoZbW4VpQDI5LDfzWJzdnXNoGqt6fIutIQUh5p/qnpfAytpr9RqBo7R2GxVyh8jDRiICcI6+8mVMXQNoi/TRg6AdM7tzZQUU/OewCiuvJQs0HlA6eBn9KXvPZiKhDc7pYbZ3fXxo6bOJWyw7OE351pWJ8XUu24RQqGrFSsdxC2A/j3fug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uco30oRIkKedQvay93ZOdtFKfEU13/Cn8f7g0ynonw=;
 b=FXbAlqIduZrQ+IRxAuYuhMdA5ipFJPg8Vu4zj4lfsOTf1s3EaQ94byVrRgX/cdkGEeZ61zxy+jMAzQvRN2lcOHj8B1qJ78KEo5S+1Vie/iBiVudaRHcnzTMNciH0hurfU8BA0DeZkf4mmwqaUnGto5+gb+hlVihH7teKwVPox+AOTkErvkbEcXywI3CDShvc2V0MOetdjVgOkfBNC1WxuSrg9XMWiNhRe/zXJunZiS0ZbivWsTal5WRUjjxKwfz6izZLY7nm5uBFO/W7RBUUOSMeY5QKjBX+VRuXy/zbqyvZrbuxniMwcvnzrRR8pY5awpbJyJqRK0o1pWD1vS4T1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uco30oRIkKedQvay93ZOdtFKfEU13/Cn8f7g0ynonw=;
 b=lPMkfJaJnyFelhB4qaOe1FKOEE4jGc2wNibeX80s6YXV+HsvXahYw9ZIDYUludJxaV3ev8Es+qazelLx8Xz3kKt6d3uOwIwft9eWjHTS0mObgSV0bsNW7k+JnIka/KXZQ2IS6txI7XyTOKE0mRlYJLh5gfD7zYbYQbsr4kmivuE=
Received: from CH2PR11CA0026.namprd11.prod.outlook.com (2603:10b6:610:54::36)
 by IA0PR12MB8227.namprd12.prod.outlook.com (2603:10b6:208:406::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 10:47:32 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::ec) by CH2PR11CA0026.outlook.office365.com
 (2603:10b6:610:54::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 10:47:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Mon, 10 Mar 2025 10:47:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 05:47:31 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Mar
 2025 05:47:31 -0500
Received: from prasad-lnx-mach.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 10 Mar 2025 05:47:27 -0500
From: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
CC: <Vijendar.Mukunda@amd.com>, <mario.limonciello@amd.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<syed.sabakareem@amd.com>, Venkata Prasad Potturu
	<venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Greg KH
	<gregkh@linuxfoundation.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, Peter
 Zijlstra <peterz@infradead.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>, "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 11/14] ASoC: amd: acp: Refactor acp63 platform resource
 structure
Date: Mon, 10 Mar 2025 16:15:58 +0530
Message-ID: <20250310104601.7325-12-venkataprasad.potturu@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
References: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: venkataprasad.potturu@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|IA0PR12MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: c0444484-4cf9-4ac2-74c9-08dd5fc0f5e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mLM35/T3erBYkgpSg8lYnnzcGUUzIbqONhguR5nq5SHuDPWDveKhsJDdrx8b?=
 =?us-ascii?Q?Ivqod1lyeAfWIrCOEt6prMfgjeKTRPg+B321F8ggGCMRnIL2HS7+SMAYpUTD?=
 =?us-ascii?Q?akoc4Lw0yiNMfCyN9xfb/fV38iNGmmcybe9JqxAmU6p9CXdS7D99e60dUZXt?=
 =?us-ascii?Q?LhA8ePAIkcwMPxKXkQxnofLAUrTzOYPkqBdCUj45aGANT0LvfWHtrzsBSf8s?=
 =?us-ascii?Q?hrQvCSdyIDaRgMwId7bagYNOnOo6v4EJKqscyItmcLf76OUbbWdS3S1+bocI?=
 =?us-ascii?Q?75GaXK7zPSPPNG5iF2vCQg9K+t0IEQkkPtmvu+prGqxqpL26unMzTLNvLCV+?=
 =?us-ascii?Q?DpmhPWggV9A+bujVyV4XbeMNkLDxg8r1QBuad5u1OoFGVCH2nprR1Y3T+kZh?=
 =?us-ascii?Q?xub1s3C2/eRVyK+NcY+uZ+489Ev86+aS50LDjjCYaoMkNyhs2cz/0xLGzgxb?=
 =?us-ascii?Q?X23PNcZm8R3IbysbeGwBen7k94myC9oh8Jnmt9r2E6y4gb7S2JAz0I5MEddi?=
 =?us-ascii?Q?foD0FW11Acuw+38jolfc5WyVS8u7FQh0ly3B113wyxnS26VqcwtIUz6ArRFw?=
 =?us-ascii?Q?qUalzI7cCVqhTbRe2BgJHLGnZbyXFU6sKqygZiICaJELEBjjAEdVUjOyJvPa?=
 =?us-ascii?Q?CaeUy2cLHWdCn6yP9YmBR69XSatlqmnnwvzzv3Jd4qSVNbs7rcWksrpIds3s?=
 =?us-ascii?Q?TWHU7e4NRfC1SLkIg9C7BQVNFXkDMDeJUX4rg4EhAN3mjgUs1y9UBD4ufun9?=
 =?us-ascii?Q?libhX8Qa9Mya8T9F5jW3CiI7eDc8rxy7oWfG2vScWxvIJAaVKzdL4K/rHVhd?=
 =?us-ascii?Q?Fiwm7klvNNJnn33TSquVzjMqOwnxIHqqq6B4BZHT32ugfolMntvk/RovODtJ?=
 =?us-ascii?Q?FJtrcMNhPPAmNeZTM8d/Uwy70dQLqLqmIv1hgD0LFXWnT3Hptim+UzM//Gic?=
 =?us-ascii?Q?K5/2sXU8885uvcVjhd8U1Na6nlbJsQ+WEv0wgoom1dJFQBdb3BCSlkgcOvKz?=
 =?us-ascii?Q?6NpGJG9KdljXCMa1r97jIFq4q1lQCXJ0YKXuUVGtwLD4RNAyvDD5lmADTUY7?=
 =?us-ascii?Q?FF82lE+6I9o+4q7Rx8ChIHW8ygRJ7+lj7NhiMzK9iFlDAcZiYZMqQ4BeVoaS?=
 =?us-ascii?Q?PF9pkTXFzpvT41ikJDOciSfZNnWEz+9WVDPmYKcFtEcUGzxaAwJIQHRnkSet?=
 =?us-ascii?Q?ycGPjsxhBcMWXeYD1+JL+DMe5WIHOgRFioWGUhWnTluwBDfhlrS8jGb9HmdM?=
 =?us-ascii?Q?9cyXNaQeg1DiFMHvb5VNsWp99BOqTUNgR2fh7Qq7oEhcvmLL33xXA4AZvWGZ?=
 =?us-ascii?Q?szTDUPFOvcrxdM6xNsGL8TinMUavaXAYprYEEECw7ebJ4kXQMUQuD2fig00W?=
 =?us-ascii?Q?8/rXfafiWP5L3IdG6J/ajXkzdb/iG3b8aK+53ftqCa1AVHvdTTPmXpcC+ZY7?=
 =?us-ascii?Q?qvuXRE70eeHJNQraNjCVTvnC6qLc/EerHaEBLkn3AtZRt1wYaBnAzr8OUhyH?=
 =?us-ascii?Q?qfxUT0buMvLAke4=3D?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 10:47:31.9512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c0444484-4cf9-4ac2-74c9-08dd5fc0f5e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8227
Message-ID-Hash: I7MJ36X2NC6MQ5KNQGJIIA4N2A3FL4MX
X-Message-ID-Hash: I7MJ36X2NC6MQ5KNQGJIIA4N2A3FL4MX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I7MJ36X2NC6MQ5KNQGJIIA4N2A3FL4MX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Refactor acp63 platform resource private structure to amd.h
header file.

Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
---
 sound/soc/amd/acp/acp-pci.c |  1 +
 sound/soc/amd/acp/acp63.c   | 13 +------------
 sound/soc/amd/acp/amd.h     | 10 ++++++++++
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index 2ced982e320c..91c6476c7371 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -145,6 +145,7 @@ static int acp_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id
 		break;
 	case 0x63:
 		chip->name = "acp_asoc_acp63";
+		chip->rsrc = &acp63_rsrc;
 		chip->acp_hw_ops_init = acp63_hw_ops_init;
 		chip->machines = snd_soc_acpi_amd_acp63_acp_machines;
 		break;
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index 49786e1a214f..53c013a64854 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -52,16 +52,6 @@ union clk_pll_req_no {
 	u32 clk_pll_req_no_reg;
 };
 
-static struct acp_resource rsrc = {
-	.offset = 0,
-	.no_of_ctrls = 2,
-	.irqp_used = 1,
-	.soc_mclk = true,
-	.irq_reg_offset = 0x1a00,
-	.scratch_reg_offset = 0x12800,
-	.sram_pte_offset = 0x03802800,
-};
-
 static struct snd_soc_dai_driver acp63_dai[] = {
 {
 	.name = "acp-i2s-sp",
@@ -222,11 +212,10 @@ static int acp63_audio_probe(struct platform_device *pdev)
 	}
 
 	chip->dev = dev;
-	chip->rsrc = &rsrc;
 	chip->dai_driver = acp63_dai;
 	chip->num_dai = ARRAY_SIZE(acp63_dai);
 
-	if (chip->is_i2s_config && rsrc.soc_mclk) {
+	if (chip->is_i2s_config && chip->rsrc->soc_mclk) {
 		ret = acp63_i2s_master_clock_generate(chip);
 		if (ret)
 			return ret;
diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
index de1e05fcf164..5f1d513148f3 100644
--- a/sound/soc/amd/acp/amd.h
+++ b/sound/soc/amd/acp/amd.h
@@ -238,6 +238,16 @@ enum acp_config {
 	ACP_CONFIG_20,
 };
 
+struct acp_resource acp63_rsrc = {
+	.offset = 0,
+	.no_of_ctrls = 2,
+	.irqp_used = 1,
+	.soc_mclk = true,
+	.irq_reg_offset = 0x1a00,
+	.scratch_reg_offset = 0x12800,
+	.sram_pte_offset = 0x03802800,
+};
+
 struct acp_resource acp70_rsrc = {
 	.offset = 0,
 	.no_of_ctrls = 2,
-- 
2.39.2

