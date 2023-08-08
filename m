Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1828774EE2
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:02:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8B47E9F;
	Wed,  9 Aug 2023 01:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8B47E9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535732;
	bh=D51zCh8fiqPzYXROzJiZFRzD7RfJLtLg5ATHf8g2Ng8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U0Vi52Y9g6UgtXoqBXyHFAskEwfE/z875yTGplvFzgICXQuVBVLwJx/6LGBJF84G6
	 Hm9met/dLx+ZgV0uUcK5l/a17KPHQKtZ8jc+pJKzPIVBzLfEPUlg9pnHWUdbp6qfDb
	 e8WiUs9LNSjF0KXCFwfF5GrEvsWNg3yItkI2sxn0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C208F80652; Wed,  9 Aug 2023 00:57:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E47BF80649;
	Wed,  9 Aug 2023 00:57:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E1F4F8063A; Wed,  9 Aug 2023 00:57:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20710.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8BF7F8063C
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:57:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8BF7F8063C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=IWC9UgzD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfxo1FVavnD6iiltnFcbMTQjzFVw+lkGoWVLxxEpieBOQ9Taz8mGfGXEZ1hEAICW2BXNuiND60w7mynWGZWojl0mg4dO1ygO1lf++K4MeYpvj3xRw/Yb4DtXOnXYduSo6Pq8DJ5/TU7SjmIW6LYvO9vdOrarSEucjJKn3YY+xTcteQ8NaJC83bja9r3CHk0AlEFPFtlU7C7TSUTfcfhHQk1o2fDXhPiTGCKsCTu+cza7f2iISXMDO6L/RPm+JwcgJSKe1R68iY5Wnh5ZX/I39gqNgor39XIuu7vEFssvh6qPFlSG5rll8jZQy5+1e2EmrKlm5dGOP+U6S9YsOt5tIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1pDo/Lee5v6n+jYyDZo6M8AOWbYs9BN6KtnkrdtSW9M=;
 b=mxo0UckJtOSi0xIK9D4MtVQio9tKs4B2JhxbfFEFhZeA8YerMDoMDwcryOMgZaAwCtyRDabFkO/cioJo6HQl8ywrBrrnw2TG9iRGaT5xmDfyGk5CcqA5Rg1FcWTRh9je6CrWe+gXjipPqL4UjdLL1ER5Qtxo1dZbZ+nGJPVuLBcmUFikx1/m8WsbycQMeU3sCDJR29cPpF4gm/KmJBKLfwWMQgw/hbBHKnxOEQoTtRhgF97lse2ssqC5mtSpcYS8B6wevNmxpxaU4LHnlrSEGs/dsomd5JJ4Du+kcR+g1UrsvpD56SHccWRAO49HmzQiZ+n9mO3zuvqEw7if7L+yHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pDo/Lee5v6n+jYyDZo6M8AOWbYs9BN6KtnkrdtSW9M=;
 b=IWC9UgzDUp7EelLIq0IccD5iI3RpWhb5twWjFp7SZS7KW4ZCHAAjuurUq6+QjHlfqi8b653ynZt13rKkwhxiXQ8yN8DrhKgJXr/PCc7CczXnBNUhREfNfkHucIHEOCjCgh3N1kgNch31L/crm6KqrFf14ym7GzbCheq7vDfpUwY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11379.jpnprd01.prod.outlook.com (2603:1096:400:3f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:57:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:57:12 +0000
Message-ID: <871qgdb0sa.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 22/39] ASoC: intel: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:57:09 +0000
X-ClientProxiedBy: TYCPR01CA0128.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11379:EE_
X-MS-Office365-Filtering-Correlation-Id: 7597c36b-ff35-4574-1eb2-08db9862cbeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PxfaSMBQ09nX+tgSe++oSlPxYGAjjDs9JczZiYWw4ErYra4amR3UKZJWHn/3eTwqNG0+kkI7XZ6h9C38WQ2VZomQMWtoajr2kFPct/W+qadV1F0bd+iqIhapO28tN2d+frLann9AtT1NeV0utQ8vZaoVVmv5OrOCUEKKxdbnYEHy7SvhqrfsErHYZEbuepq1li82018xcPgYBXrRNgfMXYji8PXc0Xo3DgUqbuJT3fZ9WOUO0Iplqxvv9NlEvHAQBCg0x18mJtOBJHo8BdFfb0+Kg+a3eAEj9noxnxyPM+W+K6zdrlg7Xet4gbIc9U5ZHXbp2/Dn0jhCmYPOA1gZ6xQnVIisbZDhlkwcvr9Bg0v/1V2Z0G0ys1m4wV4Pj8IK8Vcgjy9W2zZnFWZf02XaKD/q4fxDpQK7AVJ/mgqSMaYgkJN2DSpHuXsFgL07hD4UHCXZVRNRM1oADrRtaWcGYcU1yJExeO0X1eh1lEOjjL98AXUXGRld0xpdQku4cptZXvfjHqXoBX/ofStvx2LHpP87GgOSKLvw49v0ziDoA+CTOYU1b5mLHO/CineUI2uiIgLTDaKC2UI/ffktjv2Jw4tli2xtBOjjhIZhsaAhbsfx9mduDkIJQEB8u0VKBVfnysPFZ6hddlFXMrkqOcemPw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(1800799006)(186006)(5660300002)(8676002)(8936002)(7416002)(921005)(38100700002)(38350700002)(2906002)(86362001)(2616005)(52116002)(6666004)(6486002)(110136005)(83380400001)(478600001)(6506007)(26005)(6512007)(36756003)(4326008)(41300700001)(316002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sHFY6qHJFdUWHSfjq/wYXDx4X4r0bQOdFA+o4Xux283GzL8WgiWwUik+7RXU?=
 =?us-ascii?Q?QS54+uxjegaPzuAmFtF33RJpkIbJEw4RYQDGHl1abgWQ6wAQWyavBVQrQhI5?=
 =?us-ascii?Q?ckMvlQj0eo4Iwp1XJQUqtWHiXq4abHx70yLsphnYPfsjDzO31X1T0qClmeI8?=
 =?us-ascii?Q?01WyOIbSIAtgqcsWtmWWMvpfN8Pjm0RWcn4sAUOVleOgWPlsbB+Ar6FwfrbP?=
 =?us-ascii?Q?zqeSH3swnhMmr82/leuAJJbf+XotDa2y+nAfTp7ZNsonNvE8H7a7FCfAtVGq?=
 =?us-ascii?Q?GJmV31a/Paba+D04CbHMMNIr4Lh/OdrY0KX7N4xzIkiTylABS9zRLIPUJs7/?=
 =?us-ascii?Q?Nmil6a/6TUsv2J9Yvxpz+u1QNrjLAiDwR1YpL+g443JCP4fpr72OsUlMIbKx?=
 =?us-ascii?Q?KhhcfxxLhebmS7LKGJqnq75a3zi8mAbBE/PvdI9MmL9LBth+s5g+7F+o5MHC?=
 =?us-ascii?Q?2ng2gY8bewv30PDIsbZbYaIvVCjiUnjNXfGqW/UaritcY8D2AWyBXODpTjLu?=
 =?us-ascii?Q?eSGEkomuKeuLI9Um2/Edhm2VVUeblUaxcMQWhVZDng0e1fd4H+Rre8O39tXm?=
 =?us-ascii?Q?T/MLqnxlUtesJsGSsaaG2ele2TZd4ChVdXj6ggVk8L7+rhYt8o0uBZ6v5ZOj?=
 =?us-ascii?Q?WpjPPd2HQbNLlNrloU3/swktxBxVx5iUnpLI6pWsmDCI10xTclQ12/pN99q9?=
 =?us-ascii?Q?2Q0USiVnvYmGiuLk9QGnwBFlNbaqg0eRwOrqGhRqNc/IB779S8a1PHr1PmW5?=
 =?us-ascii?Q?5cevXwHNdyX3tKzYzk1slQ24Q4WJGEbuuVjPz41xEenlkqp65f22Su3sXsoU?=
 =?us-ascii?Q?BvC9uxvzKQ7U14wVBmZFQv9XuqACImGZ3b1rRU+Bw14XJwd8oW7p28wyH65b?=
 =?us-ascii?Q?4sPRGNZx6ROG1NYukESbF5EmCcecWBgG8E8P4iUKuro01vpgDe9qvTSYW4JP?=
 =?us-ascii?Q?ngNN+HoCEG4RsN1WYs8QNy6e+4ME0iHCavsprqInHSLfZsOmVK6XwBd3uuEZ?=
 =?us-ascii?Q?BORRVOIGasm0ncoY16FJOkfcnKMmgYRp7zFJLPkcMnFYg79HeQS8QepzaTlE?=
 =?us-ascii?Q?5sB1GMN/b3RYnA4WVNqEKnlsl0Y3lRMxfS6LJb6XCzvOQzW6zrKXbX00U56w?=
 =?us-ascii?Q?7JL4mHF7MdxA+EjxoAbag5kv83CtG5srCPKodjn7cI++eatpnJvRG0PV+tlw?=
 =?us-ascii?Q?uTFuSJxGCgSUrP2COgI0pO6MorG3g2V9tb/BDJss4kTVerSGDPFDkslIdW9t?=
 =?us-ascii?Q?obQlFlRHQWD077fyPtXXleq3Zj1WQf+SH8oM3ezoElKjeD7d42B2KIcBeGQT?=
 =?us-ascii?Q?UTozTKnuV76PiQ7fkq7vilh/GWE5yb90RPcxCeJ6ioeuB/NrD2fIk3yFwUgC?=
 =?us-ascii?Q?MQ9fQN8dZDZ9yb3hYAIJPx6PXs6xuaGWFNQywuLmC38Lkhs8FfQOHDTCySHu?=
 =?us-ascii?Q?6VwxocOSAv1HpX9l1q3uvhG2DDMqqP0Z2FGUtArPAKUUvCATwtsOIYkytKSF?=
 =?us-ascii?Q?jXEAyNN4X+c4i47lOVJFO6Czn1t65M2NO6LHRT0nQUGjdchqfIadlFn66b+w?=
 =?us-ascii?Q?qVQ4Ul1Eyy7ffWHgcuYFfgvXA5N1VIr09U8tHFDjAyILgOFxdNSxjxGEHak9?=
 =?us-ascii?Q?DdZfBKsp2P5Ef4PdR4vTBQk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7597c36b-ff35-4574-1eb2-08db9862cbeb
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:57:12.5041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1O9Ma4SOHaDvFl4JlqsV4hVySn62v9otFwyNUbTBZBQtXBwx/I2nfieiLVaChfsxQiB8GxJfzDOclgdb+ZRZC03BelHZXrcaxSvEnkMoteiPpLQvlIdB1Xj6zBR4TLh4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11379
Message-ID-Hash: I3HUNPECLCJRIGBBKSL7NSFGWIKVHCAM
X-Message-ID-Hash: I3HUNPECLCJRIGBBKSL7NSFGWIKVHCAM
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I3HUNPECLCJRIGBBKSL7NSFGWIKVHCAM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c |  2 +-
 sound/soc/intel/avs/probes.c                 | 10 +++++++---
 sound/soc/intel/catpt/pcm.c                  |  8 ++++++--
 sound/soc/intel/keembay/kmb_platform.c       |  4 +---
 4 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index ba4597bdf32e..6f986c7bbc8b 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -467,6 +467,7 @@ static const struct snd_soc_dai_ops sst_media_dai_ops = {
 };
 
 static const struct snd_soc_dai_ops sst_compr_dai_ops = {
+	.compress_new = snd_soc_new_compress,
 	.mute_stream = sst_media_digital_mute,
 };
 
@@ -510,7 +511,6 @@ static struct snd_soc_dai_driver sst_platform_dai[] = {
 },
 {
 	.name = "compress-cpu-dai",
-	.compress_new = snd_soc_new_compress,
 	.ops = &sst_compr_dai_ops,
 	.playback = {
 		.stream_name = "Compress Playback",
diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 275928281c6c..4cab8c6c4576 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -249,7 +249,7 @@ static int avs_probe_compr_copy(struct snd_soc_component *comp, struct snd_compr
 	return count;
 }
 
-static const struct snd_soc_cdai_ops avs_probe_dai_ops = {
+static const struct snd_soc_cdai_ops avs_probe_cdai_ops = {
 	.startup = avs_probe_compr_open,
 	.shutdown = avs_probe_compr_free,
 	.set_params = avs_probe_compr_set_params,
@@ -257,6 +257,10 @@ static const struct snd_soc_cdai_ops avs_probe_dai_ops = {
 	.pointer = avs_probe_compr_pointer,
 };
 
+static const struct snd_soc_dai_ops avs_probe_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static const struct snd_compress_ops avs_probe_compress_ops = {
 	.copy = avs_probe_compr_copy,
 };
@@ -264,8 +268,8 @@ static const struct snd_compress_ops avs_probe_compress_ops = {
 static struct snd_soc_dai_driver probe_cpu_dais[] = {
 {
 	.name = "Probe Extraction CPU DAI",
-	.compress_new = snd_soc_new_compress,
-	.cops = &avs_probe_dai_ops,
+	.cops = &avs_probe_cdai_ops,
+	.ops  = &avs_probe_dai_ops,
 	.capture = {
 		.stream_name = "Probe Extraction",
 		.channels_min = 1,
diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 30ca5416c9a3..f1a5cb825ff1 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -684,6 +684,10 @@ static int catpt_dai_pcm_new(struct snd_soc_pcm_runtime *rtm,
 	return 0;
 }
 
+static const struct snd_soc_dai_ops catpt_dai_ops = {
+	.pcm_new = catpt_dai_pcm_new,
+};
+
 static struct snd_soc_dai_driver dai_drivers[] = {
 /* FE DAIs */
 {
@@ -764,7 +768,6 @@ static struct snd_soc_dai_driver dai_drivers[] = {
 {
 	.name = "ssp0-port",
 	.id = CATPT_SSP_IFACE_0,
-	.pcm_new = catpt_dai_pcm_new,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 8,
@@ -773,11 +776,11 @@ static struct snd_soc_dai_driver dai_drivers[] = {
 		.channels_min = 1,
 		.channels_max = 8,
 	},
+	.ops = &catpt_dai_ops,
 },
 {
 	.name = "ssp1-port",
 	.id = CATPT_SSP_IFACE_1,
-	.pcm_new = catpt_dai_pcm_new,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 8,
@@ -786,6 +789,7 @@ static struct snd_soc_dai_driver dai_drivers[] = {
 		.channels_min = 1,
 		.channels_max = 8,
 	},
+	.ops = &catpt_dai_ops,
 },
 };
 
diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index b4893365d01d..6b06b7b5ede8 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -733,6 +733,7 @@ static int kmb_dai_hw_free(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops kmb_dai_ops = {
+	.probe		= kmb_probe,
 	.startup	= kmb_dai_startup,
 	.trigger	= kmb_dai_trigger,
 	.hw_params	= kmb_dai_hw_params,
@@ -755,7 +756,6 @@ static struct snd_soc_dai_driver intel_kmb_hdmi_dai[] = {
 				    SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE),
 		},
 		.ops = &kmb_dai_ops,
-		.probe = kmb_probe,
 	},
 };
 
@@ -787,7 +787,6 @@ static struct snd_soc_dai_driver intel_kmb_i2s_dai[] = {
 				    SNDRV_PCM_FMTBIT_S16_LE),
 		},
 		.ops = &kmb_dai_ops,
-		.probe = kmb_probe,
 	},
 };
 
@@ -807,7 +806,6 @@ static struct snd_soc_dai_driver intel_kmb_tdm_dai[] = {
 				    SNDRV_PCM_FMTBIT_S16_LE),
 		},
 		.ops = &kmb_dai_ops,
-		.probe = kmb_probe,
 	},
 };
 
-- 
2.25.1

