Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE2E76C1C6
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:59:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 593E086F;
	Wed,  2 Aug 2023 02:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 593E086F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937943;
	bh=W/det5opQCa+9+AWg1gi3QtSWJgXkB5M4zQ3g5cNRJI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lbjllUsVgoKZHhsCENCU7ZLBzJbPNjDk5K3+PMtcAC1JCBojcxSfE3CyEQK55Aife
	 GJP5mVs+pvS2hHDZCFE13BpMXcDjAVCBzTdbqTN7wvQS7Q8pBTbVY6AF1z10L9F9b2
	 2BABUt43tVFa5RTS1Rz0d7vLri1dWvn873xRNyiQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EBECF80603; Wed,  2 Aug 2023 02:55:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44524F805B1;
	Wed,  2 Aug 2023 02:55:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BC35F80601; Wed,  2 Aug 2023 02:55:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20709.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::709])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97D35F805B1
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97D35F805B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=LiXS8CI2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnVNXUqSe5/Um1SqTkHhzi5h+6kBwVTKuSCHh7KowL5HnezyxNZYt0E0RWIOtuUQBEzY+vtmlvDYKD0Uyx9TlxPqFubbskq2wL5YVQ2Fc7m0nlZeUT+CdDzsZkW2mxEySwCEAVowwuRRx0Ws0z6eZbXiksqAyDx8fBLV5cXk9xVNGuK5qJ1Dh0/tYf6g+Hrkq602Hrhp+AUUo4PC3yoKpD4LtFespd3n9Rbv6uEa3gctRwRpq6odY2tR82MQqpQ4cjkNT8MUeoyNn2K3KPQGjoKBGKfs1nqNkpwbYR+jYWlubKuShK12Rz319N2EzNCTAjsqwch2M/1mOjINOHfhWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wESfwL0qmudg3Q2IRRPLe/QRf4jMu+z+ht1SlccGvEE=;
 b=Y+TOF6rT2KddxuX1M40Pb+r46geHW+aYPOJwRxDuU1iuZsO8tCVO5WD43HQ5cfqRtE5b2VIwzkLXEm5/XDmpuOoHWuP8tH3172DL1xhWI4/8Rb2BKhwaV922LNx0LAHlBOfn7q+PYKigz9HdhUiuyvuKU0i64sPIb6Z/d7tqtsijEZ4V3IkOe4YeIElDhW0W6GfjlJHkQ/+M97pzFZPDHLo0JGvBhEsge99RH4jBK6GdhE7mVe31beyJmbPGEaNw4Fc1tZHIZAWpmO8SVdtOA89R0EPl6tgX7+IaddlMT4hiNM5EWZcvPsyVI/Cz209HCiPqaVAF7o9jTNRaWd5HFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wESfwL0qmudg3Q2IRRPLe/QRf4jMu+z+ht1SlccGvEE=;
 b=LiXS8CI2+DWAG+syp/o3hB20wctloy60QZY+A1n5HLDPs7wGKLrtvXHJbzt6JvDyq5EJ82pFUE8Y/W2hVrNIFn2YCK0WJQrNm/KDGKyMxBG6N378/uXT4KPk4+ZGMwP8Z36/M9Wesr6/tBfDXPaBNxI3ZwcbPzZOWAS1bwU5KsM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8348.jpnprd01.prod.outlook.com (2603:1096:400:177::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:55:14 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:55:14 +0000
Message-ID: <87fs52tg9a.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 21/38] ASoC: intel: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:55:14 +0000
X-ClientProxiedBy: TYCP286CA0128.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 19d95252-4f02-4017-a205-08db92f321c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WVqQ4dQ4pwojm1ScxE+6MRYFc7Wgq2CPZqwzpq1tJGEhjokCtt2oHGYHYJ7AYOmr6Sb7pCyoRx7VuqCCBf08b3/bP9i6CGB0robwJGZNT8I44HHK20efTYGwY0yuTAQ3A40j16fTE4B7O9fEsOgH4wXOR7J3t75u+k1Gmh6W9hZ2A2pmD1AiMQBcVCrzmkp1EUVQBkAcjoiLtA5hzDnNXzCWIDcpWNmMU23OB8ftPI3QQ8sIKgX/ojjsKoTrTkw0J2aFwDaZf4GyFVAOno8Eo5GK1DqW7XifVZ7oRMH6bNVgT6H733lL+j6cqgNN5zvDpn1FWVTGiLKULwBkRsICmvs3kKc00ZWKa6sYmVl1oWsrTrOwbeOUFL7MkUKULGlqyuLKHm0sUJfmcyPJxcMh+y+5cdkcDbNtaS77xDBjPJ+Zxkjvk8wdZ7HmhRhQCupwvHv2bpqqBsGbpGNeijfU9g10irBEO+upQf6FL/mKKKN+AIPSbP3E4y9QW6ahG3lKmE0AAOez3+g8myWIk3GdBlwbHURf1jMKnIiGTQr0qQm8Qdev64gsFM6eVPhd5jj3chnkzA074vFHZ6gg8e3gwCJjWifGfYSXAaZ+yO8ypSr0yK+b190NQdhkmgaek3aY9bwNXxTC4iWzsytdHLsc3A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199021)(5660300002)(8936002)(8676002)(41300700001)(7416002)(316002)(4326008)(66476007)(66556008)(66946007)(2906002)(26005)(6506007)(38100700002)(2616005)(110136005)(83380400001)(6512007)(86362001)(6486002)(52116002)(921005)(38350700002)(36756003)(478600001)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Gkwf02jr2G815qnSOiH14hj06TO+DBHxN9+vKDlVqEqE0sFeziqWJ6PBkaKv?=
 =?us-ascii?Q?NakQ+NoDW6dLxkjtYeSiEbxINTz4czSCSkti0edK3A1OiT3UtCSi+VIiuAup?=
 =?us-ascii?Q?H2Ld/V81GdLmNuo/CJEe2pR3L/NrTgUcULUF8niicnYcbAJAYA6pEzMQ945H?=
 =?us-ascii?Q?gv4wt67dmwn/RWE3RTlrpw07skNAVl11TDgj4bXytEriEr/N3abk0uyzRYdK?=
 =?us-ascii?Q?BI2gdknkOFv1VgUR0HD7H/GpooZcaDVoFWKq5etBemo8mvG1rFf9NcZmNPnu?=
 =?us-ascii?Q?8GtvSo7fA0ztdmtIiNEy40L4XP1ggPn7aOqGbCDpkCqilkq9r+bbXvmZ/4Uu?=
 =?us-ascii?Q?4Fi3lDn9HoxIuGFOR1AVDbZtA/lqMM/Z2yeSv9QR3j16Yi7DF5UHkgdIi+Nk?=
 =?us-ascii?Q?o0ehj+8fwU29DAHcB+EJ9ppZmlD+tf0Iom4SVhHeymx/xFkLStlpz2dvRW5f?=
 =?us-ascii?Q?FLkkhsr5j7NV7Za3d8QgkLMyk0ANOOw5Oz5YMNOzNAUfhKAQmL+xNeheWVUT?=
 =?us-ascii?Q?czkD98lFL+77WrScTuczv+3tcpMntw/pXONHg2lTy4U0SLTEbi0OFockFqLg?=
 =?us-ascii?Q?92oe9S4vzpKRV5Sr8+STCTUKO5ebaHtBQJEVrIGFAKbIttX8AVZ2rHmd0ceX?=
 =?us-ascii?Q?VtvLl0tzSQC6Kb1OMPtJr3Ftt7eYzIiOpjOt8IKriw4xip845/5Ajfe2OD3F?=
 =?us-ascii?Q?kkhd9ESEYOhm4Wzu4UpzdUmUE3USNYNMiHtPR0vDQYDHSdyxSVovOcUZNQ7E?=
 =?us-ascii?Q?f+BgAZlF7sitHfHO/1na1sGXNzYQv/I3Anwu54ta4aEZ94uZ9CBoVKa6XGNZ?=
 =?us-ascii?Q?2rVThh/GkgSG4P8lC4VQ2NGi2WH3MtMDp1E0WbgusrmzNbMrNvdWY16OMGMq?=
 =?us-ascii?Q?Ivl+POI/mbTakvX2ZyYlkHvCeB9RnUY6T6jk5yr/pDgAvbAMiUitMFlgBms4?=
 =?us-ascii?Q?Z+HD+QhxViOwQwCAo/NzTObliPsp+beKXf9HM8aQ68Yo2U3xev0u/Xc1jTCz?=
 =?us-ascii?Q?ckHwmYFDPOQbclkDTMDARFtwQ71W+3q8TxQAt8SqPbFYYOIsagWuCw0KRcY3?=
 =?us-ascii?Q?PhtbeFs1hXlHF8m0fgxnTRtqNwjlH/ihm+WPvr9osDRgTD+fVmsPMzTUh8ng?=
 =?us-ascii?Q?YxmYp02WS/lmE+kyqdWqenLiA1Rtz8bOeiPDOWSGbWWv1nbbbJONPluRwKzQ?=
 =?us-ascii?Q?zuuGqr17eKHO2LX20B30TUAc0//Bb8aLPcfvpM02fZ+WS0gdI7oV8sS9/Kgv?=
 =?us-ascii?Q?tRjDWR1VNU6WIk1Re4Vgj3c5yG8VzcnQcR/4fPIB45SRWOChuIMJGwDPE0V6?=
 =?us-ascii?Q?D54Buci4K2WRDX4cVIrBwxACH7gPwXE3ya9G8G0M5EcYTjW8YdDwMXqYCk7q?=
 =?us-ascii?Q?5KH7uyUWM2Aj4fy9sHfUGpXW0+/PBngybWsM1sEkOjbQqFp1Z48+AoSWT8H4?=
 =?us-ascii?Q?SNCrtuwmh8hJNYR511zHhgA3AnMGKYgV+TRCLFItmCUWKrSAdZgOqri+S2dK?=
 =?us-ascii?Q?7SVe7U4dQox5selcYjOiC/OIU5ndegdst/zues6xpI97PAjvU+fOYsaTztb+?=
 =?us-ascii?Q?I2g9QImPD0YyTm6FQ91m3bFwyAteLm+3FRykKkj9TRQksETVvuB2KZ62tahd?=
 =?us-ascii?Q?xxVyE40OvKj81exED3l2T84=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 19d95252-4f02-4017-a205-08db92f321c4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:55:14.5518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 I3fp3eZ0A5bYZAZ6PZY/5c8+9vDHoVnZNGtvd864TiW3WFpOYb8tvxlMo/vb9vdCjM/5bWuu/dGqIG9VUBBeaiczMu+4u4rnvD6LZvJ8jyCcePaFR54YvOzNcUchs9Gd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8348
Message-ID-Hash: 5MXGK5PB73KKGQ75FSDHBZKHISBV64WL
X-Message-ID-Hash: 5MXGK5PB73KKGQ75FSDHBZKHISBV64WL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5MXGK5PB73KKGQ75FSDHBZKHISBV64WL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

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

