Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7A976C1D4
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 03:02:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93341844;
	Wed,  2 Aug 2023 03:01:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93341844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690938155;
	bh=8Z/MCqsx0h+DY9c0xXO8JS+YaSBYA8vMVgQFs2ituRU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sCja1H1y8qIiX12yKfz6dQHoutRmi1QUEa3p2RkQNGzvAwlv+1I5d0oCgYiq/P3eU
	 o4TsPcNboXJ+YIET5LmLYtFguaPv3flWgWcmACVjln5G2CUBnzzRwqOJu/WAWISixe
	 yNm0ndCOf24ycJfKCY6YhdCssLGjhWyQ7b5G5SLg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 414F8F80163; Wed,  2 Aug 2023 02:58:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC96FF80580;
	Wed,  2 Aug 2023 02:58:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F5E2F805EC; Wed,  2 Aug 2023 02:58:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51728F80563
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:57:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51728F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Ts3gqutk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6PYW/rjXBw2apcIr5VvSp+3bTab3SuWgFWTBgmr80+wFz5jKqd/2PO6d8fLEv/W6r2ffniwVFHVIjRDnjgHKPgyI/WNSx3w/eCljKgdPZ8EpgMxQnmagfg51bNFioRJky/0LAHISxLxvGAErZeP+81gs42DyVKEDAMso36PDPGnJEWoJa2aNYUksH+0FI22XYBMxFiEaKFBO+YuihvGhmytc9ML+VZB0SWTbJjkjvOwzoxStbgJ+jhDZ9Pj7a396T9px3DNeKwASZ5BI56pASNHBELuiTVdkB8/vbM+FYYDG7xKKumeDUHSM0k+XANL8uZW/bRekwX7pscSS1OXTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKLP9db6c9rs5TAktt94Gc3j20qrM7kQXp8pOEPBIcI=;
 b=EmgLiWwPIQvdbZuQNIvYgDZ06cJxYRkqJHZ3sejllADbCr6veURX9BjDI0+uCwieeu1SaGOVP8G3enwVhGDYlCQMoOhArXK6AbN5P60sW+BkcGp+d8f9tXsmc8sDutwApo+g+yxfoBm8HqQVHAtXISbHjb4eA+FSNNz6HbnyiC71YkpPG7LQ5aqWf97vREG6lYGLzr7bFFhYpeGWVzPQO8Y7bAlOWvfnT4BgJM+ftNKZ8o+QsUUOdBUKqD5pj2Ib9Okr4xWbH9npYmdGHarkKqeiR2EK8fR8yKdJvtfhGGy8KDRlX9t5mZ2Y1xzLkrvk1KiqmkmUJyLcYDCmku4Bnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKLP9db6c9rs5TAktt94Gc3j20qrM7kQXp8pOEPBIcI=;
 b=Ts3gqutkTBYWSoJCbLXdf2fYeeWfeDJqMzcyaYjlGnE5SS7ofAqThYS67ivLBpgasI0xRQiC2Aieur0t5Tf9UmUEIklHkmrWdGMxFvl4UPuXH01K2+TsTjc1MtAwz4EvAtzcScoexcp0/SLaaFxmUmFrU8nPOZ+/TPodZl+OO/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7797.jpnprd01.prod.outlook.com (2603:1096:400:17b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:57:55 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:57:55 +0000
Message-ID: <87y1ius1kd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Uwe" <u.kleine-koenig@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 33/38] ASoC: codecs/wm*: merge DAI call back functions into
 ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:57:54 +0000
X-ClientProxiedBy: TYWPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a8023a2-88cc-4f38-920c-08db92f3816a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eMj045X1fW3xoAxLn/DTQAyE7ICr+y3LHQ05hb4AdhWzNhuHQnoNLO09tiXn+i4hpMOb8COHy3N1m/w/EzKxRmdQnCqxV45QekJi8dGVLDawQpAe8fHCmGUq+VhMPAPmw20/VM83ctbkVFhM3GLOSkH0n4BiNAlcczwRqhPkHsUV0gV963Y0pBfvuYYBzODoT/NJ4H03H3cAOf75+HC5tA0HMIG15ApRtL3HCVr6p72ijMxrsTVHYNlj+9kVpr9gS4uhrg/e3VxsAXFN/iQHS9lvg2+B2XW+QuW8w8esnCHcwtnf5cVo78dU+y7mKx1EMCSUg3ky++VvqOcPV79UjpS09WFIS3xBV2WZ4W2MSdW0CPXsqDTS9R9fHcW9QzyzW7QiCfOnY4QaWhlKpa2ogz8dWYg0E2GPLn09WpLQoFOd3Zlc0DmnL677olXBKErj88VAyNR2zej6Adr/yMhyIxJkRoubwJoolgaHc5zVLqqLNwhlL3NtBmayv+94k1wodveBcO2X+MiJO22OBvv+62RvX/k61AvxB5AOsqLWHCL57W/CTUzut0EGCI2Y59LmBl4GlZMk4hhH2YGvx38dFgTbTilJx3e59qcHI5GEPZ8DpAvJJQbbycOM9XdPOcwM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(52116002)(6512007)(6486002)(26005)(6506007)(186003)(2616005)(110136005)(478600001)(83380400001)(36756003)(38100700002)(2906002)(5660300002)(86362001)(8676002)(8936002)(66556008)(41300700001)(66476007)(66946007)(316002)(38350700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2SJ0JKA96k3UXhYwru4L6vGtLV4EnW8xlF0MM7PDTIJLYdeGdmkOF5xF7wr4?=
 =?us-ascii?Q?k0GLNKfR3U6I47vAnjDVkHOe8xdlVIrytChbLQiroY/5HsJ1NkvTPI6IX0RI?=
 =?us-ascii?Q?gUni3uCNw4dCTO7itqb5VovsysjYkUu9zUxABUQEd0yHe7E1QR629Z8S6o6B?=
 =?us-ascii?Q?g+M4BO7GKLgTIbBtm7NklojTp7Yxq+jhD6NQqh4ph8K4ZOKiRmAEL9o9B1z+?=
 =?us-ascii?Q?KQ4xBvthbtBEbMDe3A6HzqPzd1Mtap/0vP74Ex/hLG4yV0Dn/A+llNrSIgh5?=
 =?us-ascii?Q?BgfSHsp7/Lb9Bv08sbVBYrDxT42Dhdg6BEilmnNDaCkqavCS+dTxO3p0kJjM?=
 =?us-ascii?Q?VDtNLUCvYYl6GaVSbmv1xRSbftYD2w2iHb7IC3Lc37zxGKVA24kL5A8CnpbU?=
 =?us-ascii?Q?n2KhEWP6jBIfyyCZNOcpLE5cVrWWG4cJyN3j4t6qSUT13VPmJ2cEvw9zBkvA?=
 =?us-ascii?Q?d3MG8biBAWVXVhBCnKajMn+dcyTAsO122VkgHmkc5mvwvB3AqYocJTcTsp9/?=
 =?us-ascii?Q?MYmeAKdQEcsdmjOoTRvRYGSPU2qJ2TU9FjJM6EvvZ2szXTDwzbYxq0mpvdF6?=
 =?us-ascii?Q?sVfae/vxU7kaV/azeNhTwocVG8AnAAfa1pJ+2VUJD2E04AaOja1Tk0h5V0IV?=
 =?us-ascii?Q?wvOeKD+w7z+hQQjiWojB17ixUpunQGXYD0biR8FXqApvaXI/IoFr7SaXNVNB?=
 =?us-ascii?Q?azw9eUpVAAVDKftpeRNafRN6BpJ4lAY66cDTaiTokmkn5bWLBhwo1YvNA7jF?=
 =?us-ascii?Q?MkcY4M3uzOBwsqdx8mupcKbwCN1C4jCrw79qlhTtp7xl6d2ZRQdnHy2ncMto?=
 =?us-ascii?Q?uEQJEJsaaUmtqudCjmMFv/VurhDD5gUa4MNVlDbNsJ8rQC2w8sP+gyZGqyuz?=
 =?us-ascii?Q?Ws6130Kmo/Th6smsVl6EZZIQva7x9IMl1IcvonJP2zhctI8y0YOeLwVO8xWy?=
 =?us-ascii?Q?8naiXPd3yi0CLE2CWYi7zxxZdUXA8lASYI/XfGnbtGMi4TPhaWGor2a68w/b?=
 =?us-ascii?Q?SKIKE1hkFsUienqUznG16B2ksMrCF5xrqoGTeSOveSocGIY5EooEksTrs/5o?=
 =?us-ascii?Q?vFACYR5xcez1r4uRsDFm6DrNUvjNqbY2aBoSh4U8r0wL3FtSdlRqSW/PeLAs?=
 =?us-ascii?Q?6g86FE/G7ui80K2C019+DZiZuwqSte7pcBseC5I53t0FpNr2QUH8uNm1+1UE?=
 =?us-ascii?Q?PpJJY1ld2tROZA490xQwB9D6VtU5G6ub1tKn8xqZI7/GwxcMi4s7Q4LUXLO5?=
 =?us-ascii?Q?nEwWMzI+8n9Gqjmf8VxXzKVa+0fMj/oYU/toNmLnjmEnsfXArQ4bynLIuiDW?=
 =?us-ascii?Q?gMthfDf4OOSHCzWqTqEJSCMkCNaXO0mus/UK7dgqOsiikFzVmKhbOvZ/cVdu?=
 =?us-ascii?Q?lazfWKQAmIPzeoBHLBJVsiT3J5BNAY6Skx/kzOWV2pQdYFvhtICXL9hyd+I2?=
 =?us-ascii?Q?ROvjOCb4r9xAgGoJ5ZS6ZsBd3xKzB6qqNqdpDaFdEjIQsKK5iXb1Q2P+uFKf?=
 =?us-ascii?Q?aquh9Kz++5984U67d0DqRsWIM0RLkO1fLKcu+ibufrlTcYuoSR/Wr+8nq/N/?=
 =?us-ascii?Q?3u5lZ1PyvdM9TBaHwYnhzj8piNvqEng6JaIOZZwyrlxZu3ReAupBcHUTQUuq?=
 =?us-ascii?Q?BDDiCP9BY3Ovr/mxmkTdZRU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7a8023a2-88cc-4f38-920c-08db92f3816a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:57:54.9893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8qY5T/GiU4QBNvFrjCQpyCPoMB4Nq2+lX19ZiClsi6TpnHOI7vhmqIKDmWyFh7YlDNN9/1tknne2SBnCmCZ8v2GtjdkNr4XNceDHPDpGtCRgfP8SwDWRlCO86PeCER5j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7797
Message-ID-Hash: TRG4WZST3Z37TVF4D4JXYZKDSWFAW4B4
X-Message-ID-Hash: TRG4WZST3Z37TVF4D4JXYZKDSWFAW4B4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TRG4WZST3Z37TVF4D4JXYZKDSWFAW4B4/>
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
 sound/soc/codecs/wm2200.c | 12 ++++++------
 sound/soc/codecs/wm5102.c |  6 +++++-
 sound/soc/codecs/wm5110.c |  8 ++++++--
 sound/soc/codecs/wm8994.c |  2 +-
 4 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wm2200.c b/sound/soc/codecs/wm2200.c
index 36cdf97993a5..9679906c6bd5 100644
--- a/sound/soc/codecs/wm2200.c
+++ b/sound/soc/codecs/wm2200.c
@@ -1770,11 +1770,6 @@ static int wm2200_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops wm2200_dai_ops = {
-	.set_fmt = wm2200_set_fmt,
-	.hw_params = wm2200_hw_params,
-};
-
 static int wm2200_set_sysclk(struct snd_soc_component *component, int clk_id,
 			     int source, unsigned int freq, int dir)
 {
@@ -2068,6 +2063,12 @@ static int wm2200_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops wm2200_dai_ops = {
+	.probe = wm2200_dai_probe,
+	.set_fmt = wm2200_set_fmt,
+	.hw_params = wm2200_hw_params,
+};
+
 #define WM2200_RATES SNDRV_PCM_RATE_8000_48000
 
 #define WM2200_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
@@ -2075,7 +2076,6 @@ static int wm2200_dai_probe(struct snd_soc_dai *dai)
 
 static struct snd_soc_dai_driver wm2200_dai = {
 	.name = "wm2200",
-	.probe = wm2200_dai_probe,
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 2,
diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index 3bdbdf3770b5..4ecf07c7448c 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -1773,6 +1773,10 @@ static int wm5102_set_fll(struct snd_soc_component *component, int fll_id,
 #define WM5102_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const struct snd_soc_dai_ops wm5102_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static struct snd_soc_dai_driver wm5102_dai[] = {
 	{
 		.name = "wm5102-aif1",
@@ -1906,7 +1910,7 @@ static struct snd_soc_dai_driver wm5102_dai[] = {
 			.rates = WM5102_RATES,
 			.formats = WM5102_FORMATS,
 		},
-		.compress_new = snd_soc_new_compress,
+		.ops = &wm5102_dai_ops,
 	},
 	{
 		.name = "wm5102-dsp-trace",
diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index ad670300de8d..ac1f2c850346 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2073,6 +2073,10 @@ static int wm5110_set_fll(struct snd_soc_component *component, int fll_id,
 #define WM5110_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const struct snd_soc_dai_ops wm5110_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static struct snd_soc_dai_driver wm5110_dai[] = {
 	{
 		.name = "wm5110-aif1",
@@ -2206,7 +2210,7 @@ static struct snd_soc_dai_driver wm5110_dai[] = {
 			.rates = WM5110_RATES,
 			.formats = WM5110_FORMATS,
 		},
-		.compress_new = snd_soc_new_compress,
+		.ops = &wm5110_dai_ops,
 	},
 	{
 		.name = "wm5110-dsp-voicectrl",
@@ -2227,7 +2231,7 @@ static struct snd_soc_dai_driver wm5110_dai[] = {
 			.rates = WM5110_RATES,
 			.formats = WM5110_FORMATS,
 		},
-		.compress_new = snd_soc_new_compress,
+		.ops = &wm5110_dai_ops,
 	},
 	{
 		.name = "wm5110-dsp-trace",
diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index bca3ebe0dac4..a48e904a9740 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -3215,6 +3215,7 @@ static const struct snd_soc_dai_ops wm8994_aif1_dai_ops = {
 };
 
 static const struct snd_soc_dai_ops wm8994_aif2_dai_ops = {
+	.probe		= wm8994_aif2_probe,
 	.set_sysclk	= wm8994_set_dai_sysclk,
 	.set_fmt	= wm8994_set_dai_fmt,
 	.hw_params	= wm8994_hw_params,
@@ -3269,7 +3270,6 @@ static struct snd_soc_dai_driver wm8994_dai[] = {
 			.formats = WM8994_FORMATS,
 			.sig_bits = 24,
 		},
-		.probe = wm8994_aif2_probe,
 		.ops = &wm8994_aif2_dai_ops,
 	},
 	{
-- 
2.25.1

