Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A768C9D3C
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 14:29:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75F03F55;
	Mon, 20 May 2024 14:29:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75F03F55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716208161;
	bh=TubX/36XEmExFl6XLrEH+PKk8r98TGBVXhenGnp/8RQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tNptzCSCwJM15g6aijcv5YBuU2ZmLULGfStgtZlgXxr9eHrctp7pqYZ2e8qMXfYla
	 eyzTroAP0kCsqRvHxVYrtu5moDxIiN9fI99qLKHwuGPbw6kfWR9j//tsiidsX6ZL5y
	 28q2vlImfkPxs1fnC0e7aiSoCxyaKsjO9MeDDK3g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B883AF806CF; Mon, 20 May 2024 14:26:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06695F806D2;
	Mon, 20 May 2024 14:26:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DE05F8042F; Mon, 20 May 2024 14:22:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2408::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62755F800DF
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 14:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62755F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=kUQkszKd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sc9o9lBN6o3UFpjDzOPoq0nYdehOhhqsmvIeJyQW818LnYdCsLqBaGHrp7HNcPuN6eugKC6jjmPA34F4h6MCMKea9E8KIHNCqQn8zCeYzgW5lOJ+EajoHmqwZdFJNh9230l2A8S51NWRD3Ehbp1HhCSikM9qaXR+xt6HaC06y+n0Q1+euzKXa9L2y9W5OQlDJub3Lvwb6WeyA/5PFnmqreEGsu+ppkZkqy9op3cnkja3dYq5Iba6hvWdOyhxowglmBgK8Q90N8BhyDb6O6fBXKq6qV34K2IagqAa4j03tXyA9ah5fgLXSzwtgCFyKPZopLKfMiJ/IPJEWeA5N0ChTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lyprnbm1tIxrcuI12Z8zIjyjUaS7KPCHCBbmbSiWE1Q=;
 b=QKFRo02Ib5Iq3ORilVbRIbBblfyZw+rDnKYZVxtapa2PJIFSE81uiRhmwaRuVOD4mPducvFYS55/FatwrJ+hVaz9iX6YA5rC/XRRTEFwB7L6m0f5hNswJEBLisx8BwVulfu/0ZsZTUtS6SAwohW7tL7lRKX12Rig4Ag/Qa4km14mr0p48VOtJImLD0Ozn8j5HR4BFQSytYHYpR30i27zao4/j0U6wWPk/b+Cx1yaIAw7V2/PatIPTXUqwCKBBQebUy95Pyce/4ocJ05b3eS7QVAec/1GTuo4SzR6jSpwzGwBoobkn3s1Mh6czVIGXveJDqVZojN6tPoWoV+kEivBBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lyprnbm1tIxrcuI12Z8zIjyjUaS7KPCHCBbmbSiWE1Q=;
 b=kUQkszKdvtba5pPeesxgHUeITTncb65D9DVDqdKwO6qzIB3QvAAro8p84WwlVgWeSfhgR4HOw5N0lSOGm7q2BhPkFcyq5lNtSHPdZTfqiBaGFjrLRjio8WYoNF86WrUbXsSjEaAA8pEyoKV7LHgwiWzU6L1e0EPegACgCvC4EkHPnEslTJfTYbkLWFfhgdrxL0ZbYyJkx0Gql+b4m/WQENz3tfsyENi3lxt7OcaKRUa5AnarvRiieCEa10pitgm2ZtZHjKkx+nQQURVmPA88rMSKRE8JpexbsJ1z9X4QtKrfr+dlO9Oc3Tstem3h2dKVA1N7SZ6pmCbA8o7hWoha5g==
Received: from DM6PR17CA0012.namprd17.prod.outlook.com (2603:10b6:5:1b3::25)
 by LV8PR12MB9358.namprd12.prod.outlook.com (2603:10b6:408:201::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 11:49:47 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:5:1b3:cafe::34) by DM6PR17CA0012.outlook.office365.com
 (2603:10b6:5:1b3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Mon, 20 May 2024 11:49:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 11:49:47 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 20 May
 2024 04:49:34 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 20 May
 2024 04:49:33 -0700
Received: from build-spujar-20240506T080629452.internal (10.127.8.9) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Mon, 20 May 2024 04:49:33 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>
Subject: [PATCH 2/2] ASoC: tegra: I2S client convert formats handling
Date: Mon, 20 May 2024 11:49:02 +0000
Message-ID: <20240520114902.1663695-3-spujar@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240520114902.1663695-1-spujar@nvidia.com>
References: <20240520114902.1663695-1-spujar@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|LV8PR12MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a672f80-9055-41ef-0989-08dc78c2f2f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IrHoTDDkom87IabeMhKJArun53wlegEOLGP5ZxRDCAg2zrn85aGJstWCSd//?=
 =?us-ascii?Q?s5dHFGw27ZEolZDMBM2ROpB0On/F2qGhP9qKlxBmeKOz9coGnZuEwbYYVwIk?=
 =?us-ascii?Q?jG/HqR0JAv3gvTsHD/QIOiHw/WhMLQeawyH6G7mLojkBbrHDK81+oYmqpvMU?=
 =?us-ascii?Q?gH6zx5B5JKpEdbVgev0CYDsYDBhckpVutOpt57iYTzcj5hkBYP7dufVBKxbA?=
 =?us-ascii?Q?GaLebl+yAFje3aigHjrRgP4tZnk/hk8omAFFrikU1zS2rLot0QQSi2DSqWdu?=
 =?us-ascii?Q?N05oK6X8wvKME5VFgYIr90Pc8XcRhtdaWYvKUICsQPuvUUAc64Ea0pcggpX6?=
 =?us-ascii?Q?p3RwyezYwV/uPm6byR6/HDHMonvt6U+c0swpJH+mYV9Ej6C5ypnkhP2X9udV?=
 =?us-ascii?Q?Wl2uPpU4sx1CztpS3en3MNOs8rUv2+xwOn1OJJzqIRBghRhh+WXvW/AGEqcq?=
 =?us-ascii?Q?V56lATslc7i7OChzxuyPAuAgprbpa9kJG0v9KP9sm0IrCsFPNiDhe8Xdq/p3?=
 =?us-ascii?Q?Oip7e2/qtf2RW7VGdvxkGAl032x9xjxdpaBlu2mi4ChtcWqqoitFBpxmAwEY?=
 =?us-ascii?Q?Ax/S4zuk5yGVwQ47YSHH00rWxeyyu3rRTYg8oatGrA0JsUBign+rtqqKZ9Hk?=
 =?us-ascii?Q?PbfjjNG3GS24lcNhBVa0iv7d8ZE1mQoQ1xUrY1IeY3XCYCsRBbCNw78uK/0y?=
 =?us-ascii?Q?9KdlM0freY52+LuNKwciC2V2Jvk/+QkALNkylfjQ1R6ALrEjmLp5IZFOjcZU?=
 =?us-ascii?Q?MBTThaFKR9QmNvvEA71m6uwQQvt+HLpOyZvqnivQH3eU9Q+/ZZ/XmnJowBfs?=
 =?us-ascii?Q?rEXRjL0fQoX6BlzA6PfB9gCS6dpesfijQnO5DJBPvfCWwmv9qEnMNF4nJYvD?=
 =?us-ascii?Q?JK2dVLUZM3aa4OHwzo6vILOwNJDrUDvvKaCyvmVwQHxc6ElwPP9rZi8t9gXF?=
 =?us-ascii?Q?nSJL0un4OfH9BWN+v8MMPaOl+nUQ9Kyo1zljJQgaunUY3q+lk2s4hwhu0g5u?=
 =?us-ascii?Q?TU1Gb2VQnBjrH1Pzec6O94lgrzq4zz06wnLATk6XEttIby+tJt2jFzZuJPaZ?=
 =?us-ascii?Q?UoOZiLYUokfeFfZ+vignzYkVliwvHHiSGTm4I/BFExua2+srkJV7BXeEymMn?=
 =?us-ascii?Q?yuJGJZYSmgLkMqNQRj9rNhRH1G8GrFwF9SGMxdK7HgDkKkKyRdPRkzaz3vPd?=
 =?us-ascii?Q?h34FtDLPIboN0Da5NFmLSU/IjZODPJ22XIdmUs9hI/LVGAXRRWgRBVH0sWY4?=
 =?us-ascii?Q?IqdBWItacjZY624N8VVlY++CaU+81pFhZrc2lry8KAlIho+ZuwKcU4fVrN3T?=
 =?us-ascii?Q?9fJFH2bZ9TjnGQkiWngaXys9PayezhhkVwQH3JDZnIu4NCh1bGuU3yiiVr5W?=
 =?us-ascii?Q?FhI3LcL/5MnsxalMqCejaGE8TP/9?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 11:49:47.3757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5a672f80-9055-41ef-0989-08dc78c2f2f9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9358
Message-ID-Hash: D5DSFBOLWQV67YBDNCJFHMU7UM6HWFOI
X-Message-ID-Hash: D5DSFBOLWQV67YBDNCJFHMU7UM6HWFOI
X-MailFrom: spujar@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 mkumard@nvidia.com, spujar@nvidia.com
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mohan Kumar <mkumard@nvidia.com>

The AHUB HW modules are interconnected with CIF which are capable of
supporting Channel and Sample bit format conversion. Due to this, the
I2S Client can have different Channel and Sample bit from the hw_params()
and this config is passed from CIF port of I2S DT node which can help to
perform this conversion.

For e.g. HFP usecase consists of BT SCO with 1ch and 8k audio data
which needs to be converted and mixed with external codec playback and
capture path which is of 2ch and 48k format.

For HFP Playback:
  The path includes mono to stereo and 8k to 48k conversion
    _ _ _ _       _ _ _          _ _ _        _ _ _ _ _       _ _ _ _ _ _
   |       |1ch  |      | 1ch   |     |2ch   | SFC     | 2ch |           |
   |BT SCO |---->| I2Sx |------>| CIF |----->| 8k->48k |---->| Codec I2Sy|
   |_ _ _ _|     |_ _ __|client |_ _ _|audio |_ _ _ _ _|     |_ _ _ _ _ _|

For HFP Capture:
  The path includes stereo to mono and 48k to 8k conversion
    _ _ _ _ _ _       _ _ _ _ _        _ _ _         _ _ _ _       _ _ _ _
   |           | 2ch | SFC     | 2ch  |     | 1ch   |       | 1ch |       |
   | codec I2Sy|---->| 48k->8k |----->| CIF |------>| I2Sx  |---->| BT SCO|
   |_ _ _ _ _ _|     |_ _ _ _ _| audio|_ _ _|client |_ _ _ _|     |_ _ _ _|

For above two path, I2S client channel uses existing DT binding to pass
channels and format conversion in I2Sx CIF Port.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/tegra/tegra210_i2s.c | 71 ++++++++++++++++++++++++++++++++--
 sound/soc/tegra/tegra210_i2s.h |  2 +
 2 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index ba7fdd7405ac..454719126ad2 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -8,11 +8,13 @@
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <sound/core.h>
 #include <sound/pcm_params.h>
+#include <sound/simple_card_utils.h>
 #include <sound/soc.h>
 #include "tegra210_i2s.h"
 #include "tegra_cif.h"
@@ -603,6 +605,7 @@ static int tegra210_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct tegra210_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	unsigned int sample_size, channels, srate, val, reg, path;
 	struct tegra_cif_conf cif_conf;
+	unsigned int sample_format;
 
 	memset(&cif_conf, 0, sizeof(struct tegra_cif_conf));
 
@@ -615,28 +618,51 @@ static int tegra210_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	cif_conf.audio_ch = channels;
 	cif_conf.client_ch = channels;
+	if (i2s->client_channels)
+		cif_conf.client_ch = i2s->client_channels;
 
+	/* AHUB CIF Audio bits configs */
 	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S8:
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_8;
+		break;
+	case SNDRV_PCM_FORMAT_S16_LE:
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_16;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_32;
+		break;
+	default:
+		dev_err(dev, "unsupported params audio bit format!\n");
+		return -EOPNOTSUPP;
+	}
+
+	sample_format = params_format(params);
+	if (i2s->client_sample_format >= 0)
+		sample_format = i2s->client_sample_format;
+
+	/*
+	 * Format of the I2S for sending/receiving the audio
+	 * to/from external device.
+	 */
+	switch (sample_format) {
 	case SNDRV_PCM_FORMAT_S8:
 		val = I2S_BITS_8;
 		sample_size = 8;
-		cif_conf.audio_bits = TEGRA_ACIF_BITS_8;
 		cif_conf.client_bits = TEGRA_ACIF_BITS_8;
 		break;
 	case SNDRV_PCM_FORMAT_S16_LE:
 		val = I2S_BITS_16;
 		sample_size = 16;
-		cif_conf.audio_bits = TEGRA_ACIF_BITS_16;
 		cif_conf.client_bits = TEGRA_ACIF_BITS_16;
 		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
 		val = I2S_BITS_32;
 		sample_size = 32;
-		cif_conf.audio_bits = TEGRA_ACIF_BITS_32;
 		cif_conf.client_bits = TEGRA_ACIF_BITS_32;
 		break;
 	default:
-		dev_err(dev, "unsupported format!\n");
+		dev_err(dev, "unsupported client bit format!\n");
 		return -EOPNOTSUPP;
 	}
 
@@ -872,6 +898,40 @@ static const struct regmap_config tegra210_i2s_regmap_config = {
 	.cache_type		= REGCACHE_FLAT,
 };
 
+/*
+ * The AHUB HW modules are interconnected with CIF which are capable of
+ * supporting Channel and Sample bit format conversion. This needs different
+ * CIF Audio and client configuration. As one of the config comes from
+ * params_channels() or params_format(), the extra configuration is passed from
+ * CIF Port of DT I2S node which can help to perform this conversion.
+ *
+ *    4ch          audio = 4ch      client = 2ch       2ch
+ *   -----> ADMAIF -----------> CIF -------------> I2S ---->
+ */
+static void tegra210_parse_client_convert(struct device *dev)
+{
+	struct tegra210_i2s *i2s = dev_get_drvdata(dev);
+	struct device_node *ports, *ep;
+	struct simple_util_data data = {};
+	int cif_port = 0;
+
+	ports = of_get_child_by_name(dev->of_node, "ports");
+	if (ports) {
+		ep = of_graph_get_endpoint_by_regs(ports, cif_port, -1);
+		if (ep) {
+			simple_util_parse_convert(ep, NULL, &data);
+			of_node_put(ep);
+		}
+		of_node_put(ports);
+	}
+
+	if (data.convert_channels)
+		i2s->client_channels = data.convert_channels;
+
+	if (data.convert_sample_format)
+		i2s->client_sample_format = simple_util_get_sample_fmt(&data);
+}
+
 static int tegra210_i2s_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -887,6 +947,7 @@ static int tegra210_i2s_probe(struct platform_device *pdev)
 	i2s->tx_mask = DEFAULT_I2S_SLOT_MASK;
 	i2s->rx_mask = DEFAULT_I2S_SLOT_MASK;
 	i2s->loopback = false;
+	i2s->client_sample_format = -EINVAL;
 
 	dev_set_drvdata(dev, i2s);
 
@@ -916,6 +977,8 @@ static int tegra210_i2s_probe(struct platform_device *pdev)
 		return PTR_ERR(i2s->regmap);
 	}
 
+	tegra210_parse_client_convert(dev);
+
 	regcache_cache_only(i2s->regmap, true);
 
 	err = devm_snd_soc_register_component(dev, &tegra210_i2s_cmpnt,
diff --git a/sound/soc/tegra/tegra210_i2s.h b/sound/soc/tegra/tegra210_i2s.h
index 030d70c45e18..fe478f3d8435 100644
--- a/sound/soc/tegra/tegra210_i2s.h
+++ b/sound/soc/tegra/tegra210_i2s.h
@@ -112,6 +112,8 @@ struct tegra210_i2s {
 	struct clk *clk_i2s;
 	struct clk *clk_sync_input;
 	struct regmap *regmap;
+	int client_sample_format;
+	unsigned int client_channels;
 	unsigned int stereo_to_mono[I2S_PATHS];
 	unsigned int mono_to_stereo[I2S_PATHS];
 	unsigned int dai_fmt;
-- 
2.45.1

