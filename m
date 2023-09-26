Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B43D7AE5B9
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:23:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8E0AE87;
	Tue, 26 Sep 2023 08:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8E0AE87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709380;
	bh=JuPDrA5V+0dCyXtI2haWaEByqLHGvFCT/8S5pgNGZDc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aeNqTd0qO0rYVEu2uY5VGv6Vx3JlR2aAovoPfbYmb1gvwHtFy0FhOEDzEhcbXuIk3
	 xi+t7TwjybC9cg5giYN/sJ8Bf+9ksrUO5barULjaSI6IFVxoj0TIJavbx+NHB8foN5
	 a0TCy+9nvBfi/RFCMw8lUC7CkAViPMVSDKOmxjfw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA3DCF805AF; Tue, 26 Sep 2023 08:21:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5F66F8001D;
	Tue, 26 Sep 2023 08:21:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26CAFF805B5; Tue, 26 Sep 2023 08:21:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20720.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::720])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73C8DF8016A
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:21:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73C8DF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RBAM+8E0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKqeU400ijtuze48gcyS9W3dkT0q8hGwjw5iKxKuqNU9G84E2pGX93UTI7toMcriv/oKw8wHbfKgMPiTbk46Z5CHGJr17G3htBCAVY3dvwvyz4yUub8Np7Kj2h+hc7+04p2jx3tYKATTD7hrxa2KbHp/sVYP3hrF5Y94Q/BZFUTDXOI9bSfTs+9p8X9nn9U8UpjbdtuWB0nNgVHUHpfPIsR8LZcZbIF3CexEume8G+7S8XE7h+Js3tcCqhbKT14GMEnt5021fi4JsVfqNrxALTEF3FmHN2fotjOCOajSywxtjZ/CRNAj89CXNTFmpsSqYpL2IQjtJ++cA7KdvZ7iqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRPLzbl0ueWE5OebSDN2vn6ZkOw3tHiUvzktvGKHsOw=;
 b=MEFgu2jfawMbnBMttHRYERAnS9hrLoLEAGkU+40PmUc+A8aXA8OdC1foTKUCmdLAPLGOppsDGSQFCisbWxZsr0NHEpKVrChy2AUnGKMnvhTo3HfHpT88d1cDy3Ye8hrx/23/BpykjP0A4zg+QVf1CU3A/7xnA7bECnVPMlttgfY17wVTn3vILfxgzMcySAyOHxlS74XXoiA2RLI7g50pjbvqTHdtTiPwPG+o8Xv7GrTl9olKZ22U5AZRbvCZBLf1/Z+wdwNiW5QGjR4xuZBLTnDJashst1mzdVycvW2g1wvuHiTZtGZ+QvE4D2PxS2sn2I9PAUJ+JhLgm5J6CCHX0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRPLzbl0ueWE5OebSDN2vn6ZkOw3tHiUvzktvGKHsOw=;
 b=RBAM+8E0pb5/jgZistfRSa+YOwmx/89cNSSbLHDfh0R4PKhUzCds8TcyMtk9tXdnjtSOhRhZdO+yywrMm/R1kTqB0wdhEaVp51RRxAHtx6jYTt45s5vwKnLOkpVPxbSEnTcfPPtEWQBDyJGbvI5lNW9K47oup40w6AWvxyMnL30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10426.jpnprd01.prod.outlook.com (2603:1096:400:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:21:01 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:21:01 +0000
Message-ID: <875y3xihf7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood
 <lgirdwood@gmail.com>, Marian Postevca <posteuca@mutex.one>, Mark Brown
 <broonie@kernel.org>, Syed Saba Kareem <Syed.SabaKareem@amd.com>, Takashi
 Iwai <tiwai@suse.com>, Venkata Prasad Potturu
 <venkataprasad.potturu@amd.com>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 06/54] ASoC: amd: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:21:00 +0000
X-ClientProxiedBy: TYBP286CA0038.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::26) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: 653aa3c2-86a6-4a5e-f565-08dbbe58c0fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bS+sid46941/S0TZGWtlUA/NlbklToEFmcQhJh57Y6R2MRZmWY3AYuBMWcYOPq3hsvunCo/5rV94+no2FoBC82JXC4XAk6l6OsPke/CyfSyySmEKRVl1G6UyCtCz23bkAG4eccV1jjFk9/cvx9V8hwUHSCL+jCurcaYVBVaYAsft2Q/ITNOPPZkgdPCwAwaw1LKUD8y56nbbg8SfNfgqHqpjzBkbdyVuG1zp1IuU9t/rLo/lgropo1uckQDhIKOXpAOE5hJuQ+3HXyf4aethMySipSMNG4xv/XoJitG03KpSIlO2ZsT+RI/X7z0lcbNeI6NsYcPt4KiaM+p8+VzYmqzSG2pjj5QSt+xM3vcA1BoRIgHqVVAJKHuVYRWwPFUgVzcctpWwXdSgf/cd0t1r+iundobxl5/rTPtfQopNmHSbj0XWEq0K5aDv729vGU969+VgMINidx3xgz2I9w8sEfISIR829i6mthkg8/ovyZ8iixNv1M1Rs9L5k0Rhwn3VjOASHlFm0oLb0pFM7/wRd1xNvGQxjReA1F5MJ5J+t5l6r1oEkkFJOsbWzkXQS5m2/MRCn23Gv+g1VaMs1/kqOMZl6Zo7zwT/mq1TH2IrXeZiXBQX/BeJxeGi+HX0pZLQGXqcILX+7su+YhmwNq2p696re1LdxL7Iz+fdBlz8j0o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(396003)(346002)(230922051799003)(1800799009)(186009)(451199024)(921005)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(7416002)(5660300002)(316002)(30864003)(41300700001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RJoG0s2/7KyGv2LUcFlRRiVKWz/zCawgSK35WM3geXBhatth5RmyLKf3NVHi?=
 =?us-ascii?Q?duLcTx42PM+cDgbb0IcCxb52jR0LigdlQN6eg2lxB1ESOvLLEcMeEx0ch+xG?=
 =?us-ascii?Q?nK3rOZ2CSDWTNMPpsgiKULxHTEUMlDNcLOXjfeIK1keEb2e0nDWDta7N8sgI?=
 =?us-ascii?Q?m0PWJ1m6MXxLG8R24qKsemxn2SsKMcSiFyr0kKcy2QdFPXPu8GB6E+s0nePp?=
 =?us-ascii?Q?yHQhQCDqHrKBQ3+brMAcCEQnYpe/zzhAY+wG3y0GKVJjVmGiztzIL5S3Bpih?=
 =?us-ascii?Q?8vmaiYPOrkaW9Pm7zXsYU54ixK3xvEN2LbTpZy5hJJS+fHVBKwff3I+IAYJc?=
 =?us-ascii?Q?0hPKHtjlUlYip9PWBeKGt31EsUvEFJpJcoAFECkV07pO0wfqj7prneH4EKFn?=
 =?us-ascii?Q?BbixPEr0hMSxda23z9Z4DYgCo63wf8Y0wQ8V64Yt98jNdxTNb/Vjivt+wxrI?=
 =?us-ascii?Q?t0jNT1Gd+sjMznoxFmQ+Zo05nekwk2w8kdjdoCQgqFgjYvkjOzZTwvMW80A7?=
 =?us-ascii?Q?13nE53ooEH2zAKvSa+BIgBsgBfY5xPRX8wIv0wM7bKlmeQyaqo4GLLPLFUcK?=
 =?us-ascii?Q?kCUQ3TxGM46Jg2/VvkyB4UVNENWiwkmmrw3Z7t3OwvCKYU4lWS06VvTpeXOW?=
 =?us-ascii?Q?8Ss0UjhCjZdY38bE9WVr8XDJvcJitg3jFZ8vZsDun1bQ8Tk//t68xrEpdTPb?=
 =?us-ascii?Q?5wQbk6bxLRCV5NKqr+7+YKqmFEXsRVFyzmSv7XuJNUHpNHbPiD9oxy31O9W6?=
 =?us-ascii?Q?M3s6+69fNEqVvAWQWT/7EdH6x8yp2QAVBVHJcmw97ZYjeVaGVEvmLexBzLcI?=
 =?us-ascii?Q?wYjMrIq0Dd46qC/3pkRpUKGgBOvyk3pRAGAb65KIZzgZ4VsqHBNzdlI2651F?=
 =?us-ascii?Q?rCTUuN5dfc+SSAxyV1m28VNZGjh2qgXKBvUjVCBCI0vKutsoeJBfoTgHvoi4?=
 =?us-ascii?Q?Ct4gODevKzbKNSBfcCxMhCKCKVBq0ShDkGRy+7DeK7s9/+CJYKZJwstxugfn?=
 =?us-ascii?Q?SfQYDpbo7y1DXbabIsma49MrA3skhiHKaLc+oJGXx8GOx+Pkgyg6W0hzGU2V?=
 =?us-ascii?Q?toSp8+zly1eqWsNozSw+JENlx2OdwcYibON9eVHAsxL/LHN8Wcft7+gITmoR?=
 =?us-ascii?Q?x2PCXcM/X1G9fWs2BwtnLSkglljQh7rszFQUdHb8xrHQI+HGpeyr7KCVZVhl?=
 =?us-ascii?Q?ivwO+J/SbEI8WosCPLHalkqWj2IgRihlP9ghUQ4JDB+U6sq3Q1ioNXbzDCNA?=
 =?us-ascii?Q?56MeuGBzP80nGiMWmpF2ig4mybfUWNtVg0jMYuerUVsu2qPcQ7sUmABpvJnZ?=
 =?us-ascii?Q?F4XwQBoDbr97WYANejFIlzxgSiDWe6lKTgzwljqMAbnYb6PdoMwOY+bgM15h?=
 =?us-ascii?Q?vE0KdL6uMMjZjFNoark0RjU4mIGZ1GcL92BY3ISEV59mA7fLpoVaZgHjWN+P?=
 =?us-ascii?Q?AAAPDVOaDWXOXY4rIkWDophS5unXVxlywo3RqDi+YhwcIRPkBzzZGoyj1+r6?=
 =?us-ascii?Q?juuPxtKup6PGNSBAP4XEjAH0t60b7VzrYSUrVKlj8/A0ciBUpWZ9F/ehp0mp?=
 =?us-ascii?Q?At78d4drxVNy6x5/h6QNu9TKaWWFeZVCiH5/CD2nmlaM4DHyilEIZZqXK1Rg?=
 =?us-ascii?Q?TTzr5kfZE49YI98XsUMKHnQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 653aa3c2-86a6-4a5e-f565-08dbbe58c0fa
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:21:01.0312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 H/AumAagnNHYxHYl058XrTCQwsVT8cwZth2iKWjDt3TbpNpTxWno5mh8wNOz5XqoE6dfcN1i5cmOBBI8xDH0LSVDg34y7bRbWUlSC1M0lZq6a8jzr9vwVX7DwcSpMOkB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10426
Message-ID-Hash: YRMOSNP2YBWRH6QK76SDVG3D3E5YMY7R
X-Message-ID-Hash: YRMOSNP2YBWRH6QK76SDVG3D3E5YMY7R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YRMOSNP2YBWRH6QK76SDVG3D3E5YMY7R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/acp-da7219-max98357a.c          | 28 +++++-----
 sound/soc/amd/acp-es8336.c                    |  6 +--
 sound/soc/amd/acp-pcm-dma.c                   |  2 +-
 sound/soc/amd/acp-rt5645.c                    |  6 +--
 sound/soc/amd/acp/acp-legacy-common.c         |  8 +--
 sound/soc/amd/acp/acp-mach-common.c           | 54 +++++++++----------
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c |  6 +--
 sound/soc/amd/acp3x-rt5682-max9836.c          | 12 ++---
 sound/soc/amd/ps/ps-sdw-dma.c                 |  2 +-
 sound/soc/amd/raven/acp3x-i2s.c               |  2 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c           |  6 +--
 sound/soc/amd/vangogh/acp5x-i2s.c             |  2 +-
 sound/soc/amd/vangogh/acp5x-mach.c            | 12 ++---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c         |  6 +--
 14 files changed, 76 insertions(+), 76 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 9e3133bec2b1..84f3d65ba52e 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -54,7 +54,7 @@ static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 
 	dev_info(rtd->dev, "codec dai name = %s\n", codec_dai->name);
@@ -106,7 +106,7 @@ static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
 static int da7219_clk_enable(struct snd_pcm_substream *substream)
 {
 	int ret = 0;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	/*
 	 * Set wclk to 48000 because the rate constraint of this driver is
@@ -134,7 +134,7 @@ static int cz_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 
 	dev_info(codec_dai->dev, "codec dai name = %s\n", codec_dai->name);
@@ -191,7 +191,7 @@ static int cz_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 static int rt5682_clk_enable(struct snd_pcm_substream *substream)
 {
 	int ret;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	/*
 	 * Set wclk to 48000 because the rate constraint of this driver is
@@ -245,7 +245,7 @@ static const struct snd_pcm_hw_constraint_list constraints_channels = {
 static int cz_da7219_play_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -266,7 +266,7 @@ static int cz_da7219_play_startup(struct snd_pcm_substream *substream)
 static int cz_da7219_cap_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -288,7 +288,7 @@ static int cz_da7219_cap_startup(struct snd_pcm_substream *substream)
 static int cz_max_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -309,7 +309,7 @@ static int cz_max_startup(struct snd_pcm_substream *substream)
 static int cz_dmic0_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -330,7 +330,7 @@ static int cz_dmic0_startup(struct snd_pcm_substream *substream)
 static int cz_dmic1_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -357,7 +357,7 @@ static void cz_da7219_shutdown(struct snd_pcm_substream *substream)
 static int cz_rt5682_play_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -378,7 +378,7 @@ static int cz_rt5682_play_startup(struct snd_pcm_substream *substream)
 static int cz_rt5682_cap_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -400,7 +400,7 @@ static int cz_rt5682_cap_startup(struct snd_pcm_substream *substream)
 static int cz_rt5682_max_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -421,7 +421,7 @@ static int cz_rt5682_max_startup(struct snd_pcm_substream *substream)
 static int cz_rt5682_dmic0_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -442,7 +442,7 @@ static int cz_rt5682_dmic0_startup(struct snd_pcm_substream *substream)
 static int cz_rt5682_dmic1_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index 5e56d3a53be7..e079b3218c6f 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -62,7 +62,7 @@ static int st_es8336_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card;
 	struct snd_soc_component *codec;
 
-	codec = asoc_rtd_to_codec(rtd, 0)->component;
+	codec = snd_soc_rtd_to_codec(rtd, 0)->component;
 	card = rtd->card;
 
 	ret = snd_soc_card_jack_new_pins(card, "Headset", SND_JACK_HEADSET | SND_JACK_BTN_0,
@@ -111,10 +111,10 @@ static int st_es8336_codec_startup(struct snd_pcm_substream *substream)
 	int ret;
 
 	runtime = substream->runtime;
-	rtd = asoc_substream_to_rtd(substream);
+	rtd = snd_soc_substream_to_rtd(substream);
 	card = rtd->card;
 	machine = snd_soc_card_get_drvdata(card);
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	ret = snd_soc_dai_set_sysclk(codec_dai, 0, ES8336_PLL_FREQ, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set codec sysclk: %d\n", ret);
diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index d41df316da58..b857e2676fe8 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -849,7 +849,7 @@ static int acp_dma_hw_params(struct snd_soc_component *component,
 	u32 val = 0;
 	struct snd_pcm_runtime *runtime;
 	struct audio_substream_data *rtd;
-	struct snd_soc_pcm_runtime *prtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *prtd = snd_soc_substream_to_rtd(substream);
 	struct audio_drv_data *adata = dev_get_drvdata(component->dev);
 	struct snd_soc_card *card = prtd->card;
 	struct acp_platform_info *pinfo = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/amd/acp-rt5645.c b/sound/soc/amd/acp-rt5645.c
index c8ed1e0b1ccd..72ddad24dbda 100644
--- a/sound/soc/amd/acp-rt5645.c
+++ b/sound/soc/amd/acp-rt5645.c
@@ -57,8 +57,8 @@ static int cz_aif1_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
 	int ret = 0;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	ret = snd_soc_dai_set_pll(codec_dai, 0, RT5645_PLL1_S_MCLK,
 				  CZ_PLAT_CLK, params_rate(params) * 512);
@@ -83,7 +83,7 @@ static int cz_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card;
 	struct snd_soc_component *codec;
 
-	codec = asoc_rtd_to_codec(rtd, 0)->component;
+	codec = snd_soc_rtd_to_codec(rtd, 0)->component;
 	card = rtd->card;
 
 	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index ba58165cc6e6..217b4c89b975 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -80,8 +80,8 @@ void restore_acp_pdm_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *soc_runtime;
 	u32 ext_int_ctrl;
 
-	soc_runtime = asoc_substream_to_rtd(substream);
-	dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	soc_runtime = snd_soc_substream_to_rtd(substream);
+	dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	/* Programming channel mask and sampling rate */
 	writel(adata->ch_mask, adata->acp_base + ACP_WOV_PDM_NO_OF_CHANNELS);
 	writel(PDM_DEC_64, adata->acp_base + ACP_WOV_PDM_DECIMATION_FACTOR);
@@ -192,8 +192,8 @@ int restore_acp_i2s_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *soc_runtime;
 	u32 tdm_fmt, reg_val, fmt_reg, val;
 
-	soc_runtime = asoc_substream_to_rtd(substream);
-	dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	soc_runtime = snd_soc_substream_to_rtd(substream);
+	dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		tdm_fmt = adata->tdm_tx_fmt[stream->dai_id - 1];
 		switch (stream->dai_id) {
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index 8f968c12e54a..9def77bfc608 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -117,7 +117,7 @@ static int acp_card_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	int ret;
 
@@ -172,10 +172,10 @@ static int acp_card_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 static int acp_card_hs_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 	unsigned int fmt;
 
@@ -206,7 +206,7 @@ static int acp_card_hs_startup(struct snd_pcm_substream *substream)
 
 static void acp_card_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
 
@@ -220,8 +220,8 @@ static int acp_card_rt5682_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 	unsigned int fmt, srate, ch, format;
 
@@ -342,7 +342,7 @@ static int acp_card_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	int ret;
 
@@ -402,8 +402,8 @@ static int acp_card_rt5682s_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 	unsigned int fmt, srate, ch, format;
 
@@ -573,7 +573,7 @@ static int acp_card_rt1019_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
 	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int i, ret = 0;
 	unsigned int fmt, srate, ch, format;
 
@@ -737,7 +737,7 @@ static int acp_card_maxim_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	unsigned int fmt, srate, ch, format;
 	int ret;
 
@@ -928,7 +928,7 @@ static int acp_card_nau8825_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	int ret;
 
@@ -980,11 +980,11 @@ static int acp_card_nau8825_init(struct snd_soc_pcm_runtime *rtd)
 static int acp_nau8825_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 	unsigned int fmt;
 
@@ -1142,7 +1142,7 @@ static struct snd_pcm_hw_constraint_list constraints_sample_bits = {
 static int acp_8821_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	int ret;
 
@@ -1204,10 +1204,10 @@ static int acp_8821_startup(struct snd_pcm_substream *substream)
 static int acp_nau8821_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 	unsigned int fmt;
 
@@ -1358,7 +1358,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = &asoc_dummy_dlc;
+			links[i].codecs = &snd_soc_dummy_dlc;
 			links[i].num_codecs = 1;
 		}
 		if (drv_data->hs_codec_id == RT5682) {
@@ -1395,7 +1395,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = &asoc_dummy_dlc;
+			links[i].codecs = &snd_soc_dummy_dlc;
 			links[i].num_codecs = 1;
 		}
 		if (drv_data->hs_codec_id == NAU8825) {
@@ -1425,7 +1425,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = &asoc_dummy_dlc;
+			links[i].codecs = &snd_soc_dummy_dlc;
 			links[i].num_codecs = 1;
 		}
 		if (drv_data->amp_codec_id == RT1019) {
@@ -1457,7 +1457,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = &asoc_dummy_dlc;
+			links[i].codecs = &snd_soc_dummy_dlc;
 			links[i].num_codecs = 1;
 		}
 		if (drv_data->amp_codec_id == MAX98360A) {
@@ -1537,7 +1537,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = &asoc_dummy_dlc;
+			links[i].codecs = &snd_soc_dummy_dlc;
 			links[i].num_codecs = 1;
 		}
 		if (drv_data->hs_codec_id == RT5682) {
@@ -1578,7 +1578,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = &asoc_dummy_dlc;
+			links[i].codecs = &snd_soc_dummy_dlc;
 			links[i].num_codecs = 1;
 		}
 		if (drv_data->hs_codec_id == NAU8825) {
@@ -1606,7 +1606,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].dpcm_playback = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = &asoc_dummy_dlc;
+			links[i].codecs = &snd_soc_dummy_dlc;
 			links[i].num_codecs = 1;
 		}
 		if (drv_data->amp_codec_id == RT1019) {
@@ -1641,7 +1641,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].dpcm_playback = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = &asoc_dummy_dlc;
+			links[i].codecs = &snd_soc_dummy_dlc;
 			links[i].num_codecs = 1;
 		}
 		if (drv_data->amp_codec_id == MAX98360A) {
@@ -1669,7 +1669,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].num_codecs = ARRAY_SIZE(dmic_codec);
 		} else {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = &asoc_dummy_dlc;
+			links[i].codecs = &snd_soc_dummy_dlc;
 			links[i].num_codecs = 1;
 		}
 		links[i].cpus = pdm_dmic;
diff --git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
index 7ce15216c3f0..6cd3352dc38d 100644
--- a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
+++ b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
@@ -69,8 +69,8 @@ static int acp3x_es83xx_codec_startup(struct snd_pcm_substream *substream)
 	int ret;
 
 	runtime = substream->runtime;
-	rtd = asoc_substream_to_rtd(substream);
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	rtd = snd_soc_substream_to_rtd(substream);
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	priv = get_mach_priv(rtd->card);
 
 	if (priv->quirk & ES83XX_48_MHZ_MCLK) {
@@ -272,7 +272,7 @@ static int acp3x_es83xx_configure_mics(struct acp3x_es83xx_private *priv)
 
 static int acp3x_es83xx_init(struct snd_soc_pcm_runtime *runtime)
 {
-	struct snd_soc_component *codec = asoc_rtd_to_codec(runtime, 0)->component;
+	struct snd_soc_component *codec = snd_soc_rtd_to_codec(runtime, 0)->component;
 	struct snd_soc_card *card = runtime->card;
 	struct acp3x_es83xx_private *priv = get_mach_priv(card);
 	int ret = 0;
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 28ad5f5b9a76..d6cdb6d9fdd6 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -54,7 +54,7 @@ static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 
 	dev_info(rtd->dev, "codec dai name = %s\n", codec_dai->name);
@@ -126,7 +126,7 @@ static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
 static int rt5682_clk_enable(struct snd_pcm_substream *substream)
 {
 	int ret = 0;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	/* RT5682 will support only 48K output with 48M mclk */
 	clk_set_rate(rt5682_dai_wclk, 48000);
@@ -194,7 +194,7 @@ static const struct snd_pcm_hw_constraint_list constraints_channels = {
 static int acp3x_5682_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp3x_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -212,7 +212,7 @@ static int acp3x_5682_startup(struct snd_pcm_substream *substream)
 static int acp3x_max_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp3x_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -228,9 +228,9 @@ static int acp3x_max_startup(struct snd_pcm_substream *substream)
 
 static int acp3x_ec_dmic0_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct acp3x_platform_info *machine = snd_soc_card_get_drvdata(card);
 
 	machine->cap_i2s_instance = I2S_BT_INSTANCE;
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 6230d1b12225..9b59063798f2 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -222,7 +222,7 @@ static int acp63_sdw_dma_open(struct snd_soc_component *component,
 	int ret;
 
 	runtime = substream->runtime;
-	cpu_dai = asoc_rtd_to_cpu(prtd, 0);
+	cpu_dai = snd_soc_rtd_to_cpu(prtd, 0);
 	amd_manager = snd_soc_dai_get_drvdata(cpu_dai);
 	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
 	if (!stream)
diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index 4ba83689482a..e7f2a05e802c 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -80,7 +80,7 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
 	u32 val;
 	u32 reg_val, frmt_reg;
 
-	prtd = asoc_substream_to_rtd(substream);
+	prtd = snd_soc_substream_to_rtd(substream);
 	rtd = substream->runtime->private_data;
 	card = prtd->card;
 	adata = snd_soc_dai_get_drvdata(dai);
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 9538f3ffc5d9..3a50558f6751 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -215,7 +215,7 @@ static int acp3x_dma_open(struct snd_soc_component *component,
 	int ret;
 
 	runtime = substream->runtime;
-	prtd = asoc_substream_to_rtd(substream);
+	prtd = snd_soc_substream_to_rtd(substream);
 	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
 	adata = dev_get_drvdata(component->dev);
 	i2s_data = kzalloc(sizeof(*i2s_data), GFP_KERNEL);
@@ -252,7 +252,7 @@ static int acp3x_dma_hw_params(struct snd_soc_component *component,
 	struct i2s_dev_data *adata;
 	u64 size;
 
-	prtd = asoc_substream_to_rtd(substream);
+	prtd = snd_soc_substream_to_rtd(substream);
 	card = prtd->card;
 	pinfo = snd_soc_card_get_drvdata(card);
 	adata = dev_get_drvdata(component->dev);
@@ -327,7 +327,7 @@ static int acp3x_dma_close(struct snd_soc_component *component,
 	struct i2s_dev_data *adata;
 	struct i2s_stream_instance *ins;
 
-	prtd = asoc_substream_to_rtd(substream);
+	prtd = snd_soc_substream_to_rtd(substream);
 	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
 	adata = dev_get_drvdata(component->dev);
 	ins = substream->runtime->private_data;
diff --git a/sound/soc/amd/vangogh/acp5x-i2s.c b/sound/soc/amd/vangogh/acp5x-i2s.c
index 773e96f1b4dd..7dbe33f4b867 100644
--- a/sound/soc/amd/vangogh/acp5x-i2s.c
+++ b/sound/soc/amd/vangogh/acp5x-i2s.c
@@ -95,7 +95,7 @@ static int acp5x_i2s_hwparams(struct snd_pcm_substream *substream,
 
 	lrclk_div_val = 0;
 	bclk_div_val = 0;
-	prtd = asoc_substream_to_rtd(substream);
+	prtd = snd_soc_substream_to_rtd(substream);
 	rtd = substream->runtime->private_data;
 	card = prtd->card;
 	adata = snd_soc_dai_get_drvdata(dai);
diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index eda464545866..de4b478a983d 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -92,7 +92,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 
 static int acp5x_8821_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	/*
@@ -144,7 +144,7 @@ static struct snd_pcm_hw_constraint_list constraints_sample_bits = {
 static int acp5x_8821_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct acp5x_platform_info *machine = snd_soc_card_get_drvdata(rtd->card);
 
 	machine->play_i2s_instance = I2S_SP_INSTANCE;
@@ -165,7 +165,7 @@ static int acp5x_8821_startup(struct snd_pcm_substream *substream)
 static int acp5x_nau8821_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *dai = snd_soc_card_get_codec_dai(card, ACP5X_NAU8821_DAI_NAME);
 	int ret, bclk;
@@ -197,7 +197,7 @@ static const struct snd_soc_ops acp5x_8821_ops = {
 
 static int acp5x_cs35l41_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct acp5x_platform_info *machine = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
@@ -215,7 +215,7 @@ static int acp5x_cs35l41_startup(struct snd_pcm_substream *substream)
 static int acp5x_cs35l41_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int bclk, rate = params_rate(params);
 	struct snd_soc_component *comp;
 	int ret, i;
@@ -334,7 +334,7 @@ static struct snd_soc_card acp5x_8821_35l41_card = {
 
 static int acp5x_max98388_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct acp5x_platform_info *machine = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 587dec5bb33d..491b16e52a72 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -209,7 +209,7 @@ static int acp5x_dma_open(struct snd_soc_component *component,
 	int ret;
 
 	runtime = substream->runtime;
-	prtd = asoc_substream_to_rtd(substream);
+	prtd = snd_soc_substream_to_rtd(substream);
 	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
 	adata = dev_get_drvdata(component->dev);
 
@@ -245,7 +245,7 @@ static int acp5x_dma_hw_params(struct snd_soc_component *component,
 	struct i2s_dev_data *adata;
 	u64 size;
 
-	prtd = asoc_substream_to_rtd(substream);
+	prtd = snd_soc_substream_to_rtd(substream);
 	card = prtd->card;
 	pinfo = snd_soc_card_get_drvdata(card);
 	adata = dev_get_drvdata(component->dev);
@@ -322,7 +322,7 @@ static int acp5x_dma_close(struct snd_soc_component *component,
 	struct i2s_dev_data *adata;
 	struct i2s_stream_instance *ins;
 
-	prtd = asoc_substream_to_rtd(substream);
+	prtd = snd_soc_substream_to_rtd(substream);
 	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
 	adata = dev_get_drvdata(component->dev);
 	ins = substream->runtime->private_data;
-- 
2.25.1

