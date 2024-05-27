Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E53768D00BB
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 15:00:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24472DEE;
	Mon, 27 May 2024 14:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24472DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716814807;
	bh=a0REPNbuIHSoWHoQfsgWgJbtychCnXXW6GLy4PNwQok=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oCZ0Vqj3SqlIyT6oU8XRA7lAJq/msP5eh4t/s4SOhY2+TU3/qe4BRX69vHpqn4cCN
	 4IN5AY4MdTmaeMYIyMdNPK/Go+A2Rme+jygpS0zIwY3K1/buCR9IO5oS37ZO8YtdMC
	 32+ivnpq4osqbBRL7pZ4MMUGM7XReF08OtrK8EFs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA677F805E9; Mon, 27 May 2024 14:59:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55C88F805F2;
	Mon, 27 May 2024 14:59:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 627DEF8026D; Mon, 27 May 2024 14:58:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEF12F800BA
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 14:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEF12F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=ZZoINmhH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVTCoY/eYPgjdomx6QqwL1H60wVhHvjmJtFh+9vqw46+gYT72YOmeDCsX+Hy9yu6eVGV0rg03gUeLQF8adic4mQhRm4D3ieZjfnszyN3i4yRUspIKsGRwol8DPvEWusyE4vVdbR6BjLrg8mQfoEl7w/5hZHGliTF783UJrotZbV1/76SmU5ctHGQ8/DXZFerbvs3jpCQVIvWYpldUZun+CB4XQjLQh4XNqkAzUjO0WI7Re4AyILmFp/f1S+82jxM6iyPL9VNwwA3+aH+w6/sIo1C2X3kWlMWOzsiy+8Lo0llOLqTEYj/uYSlnIEk9Tl0b1s/ZYJEni2ZRtBtohFHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bl/ZA2+WnCpyMbxp7vZHNbPEAEvoiRjkFL+KokRs0Oo=;
 b=hH2r/qRcJT/cKcolSepG9Bja3SlTr3VcXU7pLyiHmjiR5fkPqN/Idk7k2d+Vf9kNFInTSPAHDQWlvyYmHy5aCRW8QL1JyqbhccRfExyAld5g8PsW7oznS8maPQgBlt+rcJQK6bTclFYzQLY7H53AdqqAmuMLVyx3HEN3V1Os2JF9i/l82R4aPEFSfbMXLE5tm1XtSUD/DAGpptEhQgqgvAxkzhAWVCLNG92j8FNXvibrDfz3wPMizqRfeqNHkt0jwMh6t+K5TY86DuYewcR3XepzOkETBjI+yeoK6RXjwYDAJLUVuqazShp774CMkn0oDsHRn9tRU81CMeNiUj96FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bl/ZA2+WnCpyMbxp7vZHNbPEAEvoiRjkFL+KokRs0Oo=;
 b=ZZoINmhHfiQLED99u6UKdNDJSuzsqK4RRJmg9xFlmwcYzptHSGNK48M7dtxGE4Gtuet1+h0fQGy1YUEheZrHfiAgIgl+CclrqSogW2QI1O0F3KlgVus7ckPg/XzqpcJ/uDbRFmCDH2MEK15Le9P0kv9QXdCgFBozbO4aWGGHHNoHBW/Q9Q4bPdmAtI1pWb8cH9piiA7oRXF+QiopTHSZEeHE9+ivLDqW8EobGMmD/ldzW5KN13X9tQwcCyhXKCs1Ab7/+ZdyAae95+XdmxWi2sqgr/KXeL1fCs7CnH4tb7wQodzVsiR1noxERgbU54/Nm8oX543lmrhUHGX4QG+V1Q==
Received: from CH3P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::19)
 by DS0PR12MB7680.namprd12.prod.outlook.com (2603:10b6:8:11c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 12:56:34 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::d7) by CH3P220CA0008.outlook.office365.com
 (2603:10b6:610:1e8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36 via Frontend
 Transport; Mon, 27 May 2024 12:56:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Mon, 27 May 2024 12:56:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 05:56:20 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 05:56:19 -0700
Received: from build-spujar-20240506T080629452.internal (10.127.8.9) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Mon, 27 May 2024 05:56:19 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lgirdwood@gmail.com>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<mkumard@nvidia.com>, <spujar@nvidia.com>
Subject: [PATCH v2 1/2] ASoC: simple-card-utils: Split simple_fixup_sample_fmt
 func
Date: Mon, 27 May 2024 12:56:06 +0000
Message-ID: <20240527125608.2461300-2-spujar@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527125608.2461300-1-spujar@nvidia.com>
References: <20240527125608.2461300-1-spujar@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|DS0PR12MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d92d2b-7d32-404c-9dd2-08dc7e4c6ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/Nqkcfo3QWXpSu4i9FJ6Ckbh6uxzPt6LzpI6YzZQiuHs92MWWBK0rbdDIUmf?=
 =?us-ascii?Q?WEVk8X/fqNPh+eBFvd7eRl80clkN8TqWmjg9nwEsMh0EU7p9Br75Uht8/E0F?=
 =?us-ascii?Q?KTUoEh4wZpxX4J6ukyH12hwizf1oEBWSRLpkxSBVjNEsgmSEXCgZtz0Q2Li7?=
 =?us-ascii?Q?b7WmuT71ey5hSnsDBtlSyO1U926cA+N7KdG7byp9F65BCu/X7JrqxQvVcfaN?=
 =?us-ascii?Q?60orFiRVdXa2RcHH/bGgYfUL5aXae++pPvZQ96d35z853i7q5quu3ZqaRaV5?=
 =?us-ascii?Q?8i8undD/Mm2xGy7bL+fi4pulvfo+Q3VhgQgAOrG6eSXMU+Z4DY1kt0WRq5oM?=
 =?us-ascii?Q?aW2OEe+Ql3lGTOuoZvWwTeB0ONKSefdxGDp8buQHPk/luMgKEQen4sbitlz7?=
 =?us-ascii?Q?zEWTrX9hRjkZEAm53pQuYkdWLizOfCCPS6/ATiMm5PzPS8Fcjsd9kdJlIMHc?=
 =?us-ascii?Q?FHfEpF+3S+T7U9CkjvZ4ndWiZZYu8nmOzHyrZPi+y+kTnR2YHNiU9C49t38+?=
 =?us-ascii?Q?965AAiIwb5BI5wiH+a2TiZIgLXP3NXuFlgSzlglh8j/pV410VGsd8hvkdsHw?=
 =?us-ascii?Q?cHFtOK9h632n7PhcjU6A4ZQpnjujTgm/Zkl+MZ01EnWrQ79JUB5lplrfQjZA?=
 =?us-ascii?Q?psDxz4/5uySVcInQ7vnbNxWxsIORYRDmq6Z245i2thw0qjwSvxtL8QTFhKT9?=
 =?us-ascii?Q?v4xjyHGIqr2GKiN5KfYHPppo6D5BFDtzukjirYPtDUyoP4ttIDwOcLx37BN+?=
 =?us-ascii?Q?e4geFNd495Y9++fbwSTRXoTa5icMPsKuxCjV7hoz0A4DC8Efplyu3McMnGN8?=
 =?us-ascii?Q?Q68PExbuYzhamylIEEJW+LuAa25bbx6u7Foz3XPVTM1gnEWJ/wci6aAjjSsT?=
 =?us-ascii?Q?8S5T8vaPzhFB6nLUUlmut2Q2NHqtvmXfAIm/s8qsuhpmC/zTk5AL1zfX3DM4?=
 =?us-ascii?Q?6f2Jqsoi0R5O1cd/EPM70TMXkiT4UqdJfVjLV3cHpJqqa5lsuqaty3m50372?=
 =?us-ascii?Q?Y+O7pE/8pzZb54lyvUSzGDi7apfqYWfBdMMt/atT5hcj2IOVfILWI6C8C8u/?=
 =?us-ascii?Q?MOwtZLcHNm51T2xY1M32Ec6NwAGedfv/4jMXUcmEdBiUK3FCOtL5sKWCVxas?=
 =?us-ascii?Q?ymMuNHRxVL3fQU5VvTnw70562A7EsYwO8968VbQK9Gc+9GumLkCrPdNIzeV7?=
 =?us-ascii?Q?95dFHWBADiSwoCGqnQKxUZ/Dc3cMg4mfJ3/YdoFpfMlAQeNXNO09O3DvrtHy?=
 =?us-ascii?Q?HDqI6dBlMx8Ufx0BUBTQo9Q2BqHaEflSc2IeUKNoNOqFZhHlXwGEO6gS0eTX?=
 =?us-ascii?Q?dTeM5QKldhn343wAR5zwGr2l9jl2EqCsuo/kkgQVevJWG3Mv8yK5daLu3OUr?=
 =?us-ascii?Q?duEA0fgms9zC87UYZVi0BxgyGtNc?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 12:56:33.9056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 54d92d2b-7d32-404c-9dd2-08dc7e4c6ff3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7680
Message-ID-Hash: XHH6EQPLZ3WLO6WRICIZU3I5YESITMXW
X-Message-ID-Hash: XHH6EQPLZ3WLO6WRICIZU3I5YESITMXW
X-MailFrom: spujar@nvidia.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XHH6EQPLZ3WLO6WRICIZU3I5YESITMXW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mohan Kumar <mkumard@nvidia.com>

Split the simple_fixup_sample_fmt() into two functions by adding
one more function named simple_util_get_sample_fmt() to return
the sample format value.

This is useful for drivers that wish to simply get the sample format
without setting the mask.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 include/sound/simple_card_utils.h     |  2 ++
 sound/soc/generic/simple-card-utils.c | 26 ++++++++++++++++++++------
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index ad67957b7b48..2c2279d082ec 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -174,6 +174,8 @@ void simple_util_parse_convert(struct device_node *np, char *prefix,
 			       struct simple_util_data *data);
 bool simple_util_is_convert_required(const struct simple_util_data *data);
 
+int simple_util_get_sample_fmt(struct simple_util_data *data);
+
 int simple_util_parse_routing(struct snd_soc_card *card,
 				      char *prefix);
 int simple_util_parse_widgets(struct snd_soc_card *card,
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 81077d16d22f..f1f5a1c025fc 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -13,12 +13,11 @@
 #include <sound/pcm_params.h>
 #include <sound/simple_card_utils.h>
 
-static void simple_fixup_sample_fmt(struct simple_util_data *data,
-					 struct snd_pcm_hw_params *params)
+int simple_util_get_sample_fmt(struct simple_util_data *data)
 {
 	int i;
-	struct snd_mask *mask = hw_param_mask(params,
-					      SNDRV_PCM_HW_PARAM_FORMAT);
+	int val = -EINVAL;
+
 	struct {
 		char *fmt;
 		u32 val;
@@ -33,11 +32,26 @@ static void simple_fixup_sample_fmt(struct simple_util_data *data,
 	for (i = 0; i < ARRAY_SIZE(of_sample_fmt_table); i++) {
 		if (!strcmp(data->convert_sample_format,
 			    of_sample_fmt_table[i].fmt)) {
-			snd_mask_none(mask);
-			snd_mask_set(mask, of_sample_fmt_table[i].val);
+			val = of_sample_fmt_table[i].val;
 			break;
 		}
 	}
+	return val;
+}
+EXPORT_SYMBOL_GPL(simple_util_get_sample_fmt);
+
+static void simple_fixup_sample_fmt(struct simple_util_data *data,
+				    struct snd_pcm_hw_params *params)
+{
+	int val;
+	struct snd_mask *mask = hw_param_mask(params,
+					      SNDRV_PCM_HW_PARAM_FORMAT);
+
+	val = simple_util_get_sample_fmt(data);
+	if (val >= 0) {
+		snd_mask_none(mask);
+		snd_mask_set(mask, val);
+	}
 }
 
 void simple_util_parse_convert(struct device_node *np,
-- 
2.45.1

