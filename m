Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EBC797064
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 08:57:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E8DD84B;
	Thu,  7 Sep 2023 08:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E8DD84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694069855;
	bh=fqg1FdaUiRuUDqAaoj4UeFRhfSRxZygw4qrBWN0uApU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nk4Hk5BuUNQD9pPmw1XJKSMpkCWQeASpT57kDfqsNv8DkiKD1Zaoocx99LfCtJt5B
	 17zeEXcXDgEirX3hH3YJQs+cdZJ6K5I22DiUkOGocaR9Gqz1isjWYk2Q6Z8uSLMwbY
	 cLOaueqjSytD/8oJw/1IOX6JQR5cLvmE2C5ulWno=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83469F80578; Thu,  7 Sep 2023 08:56:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02066F80563;
	Thu,  7 Sep 2023 08:56:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2168AF80563; Thu,  7 Sep 2023 08:56:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9EC48F800AA
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 08:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EC48F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=Q9Rsa7nD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTWG9q4i1WyK79NcEmlLYnb7anQ498O9CKzYS8RsZTkFCSVRKntMn6a3V1sHf2GTgGLH5V1JsN0+XGumA6o8SrMEJKgoWweDI/9vjCDB//FjufVnZ0A4wQsZnJjaYktGVaR2eur6iKYzsNFM8rpakHE7sImBAOMQ8yeXD8ri2XPDrZ0j3hHgOOSCMbEyhqUWMT4dIqSVT7Ij0oJtjkXNm9Ih20aAH9Y9IWNyCYUrIH0WjrdK1MrHiN2bwg2T14A41coDbabJaMM0RDPf4qoaCVnpdioBjrd3FwSx6XvpqYIiHfM0Cy7VnB8LTdf1c6sKeO6Qw6Wvk7oYlscadW/0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJuiGrznQHeTkUH37N+lmE8ZVtAmsvybaRqKwX6kf0c=;
 b=D6Of6PhIDB4lUJiuG3knpVN6rATSU0Tgj2JGOlacLRRZ2olEACpWPTRPtd7N86tygnyLC064/fMAe3B/g/vK6BW1HF1QqcicDibp4Z2eR4jBtlG7KiCQEQ46eIehEINv3aifcBCftdz4IAl1ErWZ+SX53P0jsHOmaImV0uiZeezJ3Ius/i/d61Gn7frM2lYYF6Pvva5hOQpb5s5T0gqTSH08q99jDJ5HyCqBEdeC6KYgJ/e47kapUZqv8z2LGrZg9kujF+suem8eIReUvej4fBq22P993ngZazUhhE3DcUVaGLX6oLDIKHiV/duxUbVz5t1BB95cZwG1GySolCP0Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJuiGrznQHeTkUH37N+lmE8ZVtAmsvybaRqKwX6kf0c=;
 b=Q9Rsa7nDUfONWLXmbCp+bED+v2+9Ma7o2VO23sc51ePZuBc6MYlxu0S8g9+EM9ZVral+Tgez4n6H7XK7XhORRiHbYpBJ/K0J/LRavvbhf4By+y3hseM/CDk94z3BNX4NWaSNrBm+HWMRlXiNUy4mw7Ig2p3bm7L2bCLjR7ZgOyYaQ8WEdarOwV8xxQGuM05EQP8f0ZYEqRF2um070rMkeB2ZBwpvWQpZqMh1ZYhT1v6RSl4Jg1lM6TdEUG3IllAY2o9Pv4BMUY2dUSfB9J5iS74+b9dzv0eVeL9Q6ywsdJsV0IAanRryb47+3Pkkas8iwUlCqarLIlFzac4pAuFRbQ==
Received: from DM5PR07CA0116.namprd07.prod.outlook.com (2603:10b6:4:ae::45) by
 SJ0PR12MB5453.namprd12.prod.outlook.com (2603:10b6:a03:37f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.34; Thu, 7 Sep 2023 06:53:17 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::d8) by DM5PR07CA0116.outlook.office365.com
 (2603:10b6:4:ae::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30 via Frontend
 Transport; Thu, 7 Sep 2023 06:53:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.25 via Frontend Transport; Thu, 7 Sep 2023 06:53:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 6 Sep 2023
 23:53:05 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Wed, 6 Sep 2023
 23:53:05 -0700
Received: from audio.nvidia.com (10.127.8.10) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.986.37 via Frontend Transport; Wed, 6 Sep
 2023 23:53:02 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>
CC: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <spujar@nvidia.com>,
	<alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <stable@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: tegra: Fix redundant PLLA and PLLA_OUT0 updates
Date: Thu, 7 Sep 2023 12:22:13 +0530
Message-ID: <1694069533-7832-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1694069533-7832-1-git-send-email-spujar@nvidia.com>
References: <1694069533-7832-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|SJ0PR12MB5453:EE_
X-MS-Office365-Filtering-Correlation-Id: e0078b4a-b27d-4d27-2cbf-08dbaf6f1d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/yMMYPTWwSQb6pq/cme5dcLtUMgsyTf3UmfXfQVeXoj9L8oRDGCsHOcidOzpX7aeQsVGdH+VloFSLO8Lmf0hKF7GPVVmXoWNo1qiodZFPk0oxX1S3+kXK+EZK/t5TFI/WeVnM3ia9zINwvGNtN2DufK8n4iwU618dwfKQTWJMdmfW8n2xEsABk+HLmNZ5u+n1XFZHZcjS2XJzKbSeyjLFF6Ujtu+TPzaN6OzyNGr47UbWKwgwawNfbR35YtAhn4MQDqbuBJs1NyAuWSF+TX+uoQF3j+oxE4SSRs9jVRCN6cTxIWaYhVW15S4SHRciXeOT6Ff0dMC+Sz6893+owTYe62wNwzt8MKVSyiORE49FvAhv4pDvBQaMkqKw12hJ2ILGN4FTbBKSY7/zoOhPToqQFi//O444OS6du+S9vsJzTOy0n6AzLZJFXmrtGgr2G7uqcYKgRhOGKYYaXeERnmONidJQSzzIWrTahFkyWQ/d64+i/4NozeQb1IBGrdjNDFOul20E/VHPRKnHAa4BPVzQ8yHx8iAUc9/hKr8yxdCIzKdXfX4+TH3kU49cyrJv07igl0uv3E0oWApz9n9Gk9p7aEZdSuUQK/GGrehrro/XBtL6D7tKcCa2+/LQEQYNhuzgEBg1sfbQOKjf/JG0PRn3EKbMwE68kE7KtvvJjnjW3pmn5vvxUpPxoPx10Pkbu+4K5qKqs7ONjM2maNHfm6DKYb81Tyc7488WL2fZMXliT3gKWn8cpVEUbXBZu/E49iw
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199024)(186009)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(478600001)(70206006)(40480700001)(70586007)(316002)(15650500001)(110136005)(54906003)(83380400001)(8676002)(2906002)(8936002)(41300700001)(4326008)(5660300002)(6666004)(7696005)(40460700003)(2616005)(26005)(36860700001)(336012)(426003)(356005)(36756003)(7636003)(82740400003)(86362001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 06:53:16.8848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e0078b4a-b27d-4d27-2cbf-08dbaf6f1d41
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5453
Message-ID-Hash: JTNKZW3Q2DTKRZC46XHZ4TIAEUCDMJUG
X-Message-ID-Hash: JTNKZW3Q2DTKRZC46XHZ4TIAEUCDMJUG
X-MailFrom: spujar@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JTNKZW3Q2DTKRZC46XHZ4TIAEUCDMJUG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Tegra audio graph card has many DAI links which connects internal
AHUB modules and external audio codecs. Since these are DPCM links,
hw_params() call in the machine driver happens for each connected
BE link and PLLA is updated every time. This is not really needed
for all links as only I/O link DAIs derive respective clocks from
PLLA_OUT0 and thus from PLLA. Hence add checks to limit the clock
updates to DAIs over I/O links.

Fixes: 202e2f774543 ("ASoC: tegra: Add audio graph based card driver")
Cc: stable@vger.kernel.org
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra_audio_graph_card.c | 30 ++++++++++++++----------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index 1f2c5018bf5a..4737e776d383 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -10,6 +10,7 @@
 #include <linux/platform_device.h>
 #include <sound/graph_card.h>
 #include <sound/pcm_params.h>
+#include <sound/soc-dai.h>
 
 #define MAX_PLLA_OUT0_DIV 128
 
@@ -44,6 +45,21 @@ struct tegra_audio_cdata {
 	unsigned int plla_out0_rates[NUM_RATE_TYPE];
 };
 
+static bool need_clk_update(struct snd_soc_dai *dai)
+{
+	if (snd_soc_dai_is_dummy(dai) ||
+	    !dai->driver->ops ||
+	    !dai->driver->name)
+		return false;
+
+	if (strstr(dai->driver->name, "I2S") ||
+	    strstr(dai->driver->name, "DMIC") ||
+	    strstr(dai->driver->name, "DSPK"))
+		return true;
+
+	return false;
+}
+
 /* Setup PLL clock as per the given sample rate */
 static int tegra_audio_graph_update_pll(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
@@ -140,19 +156,7 @@ static int tegra_audio_graph_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	int err;
 
-	/*
-	 * This gets called for each DAI link (FE or BE) when DPCM is used.
-	 * We may not want to update PLLA rate for each call. So PLLA update
-	 * must be restricted to external I/O links (I2S, DMIC or DSPK) since
-	 * they actually depend on it. I/O modules update their clocks in
-	 * hw_param() of their respective component driver and PLLA rate
-	 * update here helps them to derive appropriate rates.
-	 *
-	 * TODO: When more HW accelerators get added (like sample rate
-	 * converter, volume gain controller etc., which don't really
-	 * depend on PLLA) we need a better way to filter here.
-	 */
-	if (cpu_dai->driver->ops && rtd->dai_link->no_pcm) {
+	if (need_clk_update(cpu_dai)) {
 		err = tegra_audio_graph_update_pll(substream, params);
 		if (err)
 			return err;
-- 
2.17.1

