Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6C879B14B
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:51:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AC74E12;
	Tue, 12 Sep 2023 01:50:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AC74E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476292;
	bh=Mz2AqdxOuEvrZJn7xUYBfFge0cxa1mO6NbwigfE+Cns=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HESqK2KGGON3ATvWJIl5Vr0+c1W6sDr4bZBnYW8tHfJeyGt1Mom1Zw6Eh1zTUhUVZ
	 /Ft2la+xgOcr9cCvlJvZWxm484Ef5e5nlT5oTzPqQMq7mInaT1I2xksbpsRgKHwtJT
	 iH2sEKL6lhsKPXKdmzuqEt4yYh1f+Kdut+2e9h4o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05BB5F80601; Tue, 12 Sep 2023 01:48:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A8AEF805F0;
	Tue, 12 Sep 2023 01:48:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA6ADF805F5; Tue, 12 Sep 2023 01:48:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9150CF805A1
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:48:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9150CF805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fjZcB1T/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CeQIwwAjylpy1YSRAWOydJe8X5I/H4mevHpvgkz/mB4DAvGq+TSPZHHvj724tyYraK5kA/mnfyEjz2RS90O7cxhz0kqS5VZwMKyBDTh6ePfDFawtpdIHoBn8L34UUa4zJZnKg8KYqnqdL77p+3Q+kVnML/MlyfsNHjwfG495K6K3FTUCKcx2nNpA9+DaysV0WxW6woogjSuXE+S/uWJYmh6FjVN3p1ABGRbU6FneSuqQJhXpT8KWW7EqoOQ89T7wjbq9wOiv0JtIsrzylThsS5IRK/kJwUZFsu6919TcmYadLcTn5cHnv+bEVyuGFdKiSU4oxL5zvxAeKyIu0LYT1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIa1O8Ra/cZgzS+4mcm2IjPk7dIJdBx5578MQUrkgf0=;
 b=EoBVvtpsirQNNL3a0J/pzFbczqqNiO59rYIVa1SKFW5zYmtF5+ZHeG8qZr4+LghtDt+bvqnNO4U5/HbPtK3gQlQtxS5dculu9cKo+j1uAXzbxd88pVsPJOsyZYtPnmo77YepFsPB4KdkGyy9HjMdB62E19HK/+RChZmNOjuuq4INHorPatGiOblRbF3jvgJCMUzOOAiOxhWwxE1MMsFyN6J3/43fqNSKg0fyW1Ue323NUHTClpX7rEt0XSc3HX1jGqkNffOoxJ/WOPUNZYI9rTHdmhL1xvhJlC+fwkX/wHWzL2fene0gq5syO1p1jh1d0hlj8iYJbukGgXZUylaYkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIa1O8Ra/cZgzS+4mcm2IjPk7dIJdBx5578MQUrkgf0=;
 b=fjZcB1T/uiRJ48AwLqOtiN+iYM/p/LKxs/gjyXGcF7O+d3jRvDUNvTnuCJVz6WUbC9cYpU3VhilgOFiiaX1JZ/NDPHz0ctJwzt4mjxF5ByppCZK90CGYB/wDMZKRRdU7nQ1fJtGdRP8wORr5sStOTl7cotyPRQDda0pWbld/Ue8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6192.jpnprd01.prod.outlook.com (2603:1096:400:4b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:48:23 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:48:22 +0000
Message-ID: <87zg1sqnjt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Daniel Mack <daniel@zonque.org>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Takashi Iwai <tiwai@suse.com>, Yangtao Li
 <frank.li@vivo.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/54] ASoC: pxa: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:48:22 +0000
X-ClientProxiedBy: TYCPR01CA0186.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: d2e04a51-8803-4abc-23d5-08dbb3219579
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vT2VfLzNTMiqQcwJYsXlQQaQgzJcIB9wy2j5a7dSsPU52ZX670ylWRtGhrDtZouz4Ql05if148ZJLS3u+6oseDvJBCy0BemAAvyandt3EUOv+zhc1lMltSq1hrtDJ0rJYP9GPUlCBMnwUlcenDv4IuE4Fmj6/b2gha5U7+MZQkpwFi3ty+4BQjPCojqIja6RIiaxy1/JC4x4t9gkBnNVT8+gQ0lUNVFAG9FFodT8vWU6nTf29ml7/0NsrV1ziKI5hRMt/z8dL48eWrLn7Yi7cF7M1GuXrfsIOdfknP2jW/bPPo4WgnBZYeOIIYOyfGja54yMz7faBSt2u5cvucp7AVPY5dTY9tkhC+GlfmazNlHXkHieJ5YzVN8rNhdN/Lu7seh9dyRHYaFX04NBngm7z7vZCteEq0kd9vx2z7VPASvHkk5gWk2c2eMJEtKlhquZn69GYNCJBpTDVyi0jkGB/PSnSjjXfPMtKgNkcN8z/GfFHlQkhpH75PPtsGb4BPu2HnOGxosB9BObirYDGlk2KyBeKUq7DeJ4geIVQvkTut+hhZZzxoRgETje4cSE6TK1MWUHx2NWDz4szxszTXKwZIqvXTzsXQRJp+AY6RHnk6QJ5KchmvLsRgTPZcz+FwoKz0PeZAAT08hXf0w/f3NsgoIuI0PMrUM9wCpDtONu6/0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(1800799009)(186009)(451199024)(6506007)(6486002)(52116002)(6512007)(478600001)(83380400001)(2616005)(26005)(7416002)(2906002)(66946007)(66476007)(66556008)(4326008)(5660300002)(316002)(110136005)(41300700001)(8936002)(8676002)(86362001)(36756003)(38100700002)(38350700002)(21314003)(41080700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BukcPWSllOr3OxPvEINSwvK8vi5mnNRE75Dv5XGZW4w9D2D8LvdWeDv7Xoz2?=
 =?us-ascii?Q?yMsxTVO5Dvzgs+Z1UGUj0De4ewHcAA05Wr5xxvNDdfO5S5On8gwLclwdOXna?=
 =?us-ascii?Q?efFZMMeHPkkWWr41aRziNNDxWMV+VHoFs2c+xBQnb3PHozBv1ZAMSunnBYzt?=
 =?us-ascii?Q?kwShQVqrMDm/+AiQ5OriLAD0q2hHneJQWg1HE6uaFPYW4PZv6KkdSc4NW+LW?=
 =?us-ascii?Q?Y4yBZaxiKQzU1WwKCUtBiqL7TWnTEjDJtewu2C28azj2eiCU6jYevWxEZW61?=
 =?us-ascii?Q?raaZb3PboeiQbkLmeGvLtAJdXhqnCYzEvbOFaLa9uESFUU1Nd8EIf1/lo/gK?=
 =?us-ascii?Q?1pjphJIJ1dBt0LRbbtVc9aoTmcFjdE6g37J2r9epxs27HldLIU88rjv+oJ0b?=
 =?us-ascii?Q?hBO2AJXS0ozIQS0/bYGUOtTNyOmY76F50GAgWswYCSVc/Zc3YMQS6qDNcMyq?=
 =?us-ascii?Q?gOhqW4mm5z1AwiEhtf6K6Egqt1RuweR5ouodzrzU4A3FPq8J3yVxCpYnYN2/?=
 =?us-ascii?Q?TjUbMw1iG3VpSihVhcPOdH5GA1Ks8UIydg84DwsgxT6TYWAru3zVa5yB9MNJ?=
 =?us-ascii?Q?A/QHhPlwrW5NUh2Wmg1YscsLpu61wKJSW2q2JfW40+LjlsKIYy7q2IZPBPQa?=
 =?us-ascii?Q?7pomiJBOZr9i/tm6UpdRWwspYcilfwIXV4e1TKBlPQq+rFtE8bTuVCpcDYvG?=
 =?us-ascii?Q?EYgfe1MSMM5cv/rTMZbeCbVPFoGG1PsAlaM9QPMaMtfHg1sdyDxk7+T+b9pG?=
 =?us-ascii?Q?6enRNLXLfO8f612MQEGv65qxOqu5fGGwtfDlHr6o7YTPAtXvopg9j6KD8ATh?=
 =?us-ascii?Q?wcnmOil9fHweYgN1QNtO0JsxlCQ5JwuUWrTXIjbQ3Ct73g2P+UlmIuH6niph?=
 =?us-ascii?Q?MCrV/JcAu6Y8uOIolklvpqR4N9HGaA/P6LN9yEVgUUUEGIoyk+OJDEaoNa/o?=
 =?us-ascii?Q?XEsJu82+yViZbGwmWSbUTw9mpoOLgCZoArytrSTiKAJhhpEqM/7eYk7wePVa?=
 =?us-ascii?Q?zS15o7bIrhDV1OW+fici2EM6BzMS6/XEIsQrmYS0mnlBZreYrLhHmltzyzkY?=
 =?us-ascii?Q?/o/ax7wz/xozAabjN9tnqU0C4E4NEUp2J+i3tNYLSR6xSKDgMFU07z1vtxQc?=
 =?us-ascii?Q?1a4BiEd63X05balvWPHoJGZXM/tbzyAov8NJZJ7r8qmC2d42wurFlMKV+2L4?=
 =?us-ascii?Q?Fx3wwJdq61kDqmPCR32EkQyM5L1nuBdgLWR2IQGi2HmJll/ohVLK45IjxQC8?=
 =?us-ascii?Q?d8SS7eAv1hnQzf0x+6LuBFjVE6zqKmAJHJ2Ru+wIVvJomJH7PIld5P683Mph?=
 =?us-ascii?Q?JU+LZET7SwkTDQ0KjwFfymynD7HwN5ZhaivchXwlvjqmpS+/789/t1D8t5oh?=
 =?us-ascii?Q?lNrAyOmXS9ElVIsiS4Ke7GGSrTZhn31AgRFmvvHsmcc+PC63FM4WC6le5dOg?=
 =?us-ascii?Q?QeAR00DTidpfqPMhdrEe+d8n2VFFZstpiuFXlIQlQrqjK7LGR1u/8NiDfzUl?=
 =?us-ascii?Q?CRHPasmTjhhgvlP7vsMPEguls0Y6rtiwTEbipKAxQjZq4hbmK9J2BH1yPMeR?=
 =?us-ascii?Q?5AhlUcVWIjm8gzCqwL5MP4qi4UaBnhsJ+aISQgUBbqPBWwwxLYwE5YCksEp2?=
 =?us-ascii?Q?F09OpNe5mt3HXftHqwudv94=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d2e04a51-8803-4abc-23d5-08dbb3219579
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:48:22.6931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1/lu/EdhGl6IQyKGn8hd6RL5kcz8/OEHPWs3cIof+1lF1akH58oztvjXFNjjV7wVyemW9xeY6iL5VBy/RDktVHyigJWTEztJYmhdkqXqBcVg08ai9+0gbvqrX7t96n1j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6192
Message-ID-Hash: 4YBXR65JF54VV3QC6RMRL3GOKZCS4XL3
X-Message-ID-Hash: 4YBXR65JF54VV3QC6RMRL3GOKZCS4XL3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4YBXR65JF54VV3QC6RMRL3GOKZCS4XL3/>
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
 sound/soc/pxa/pxa2xx-i2s.c | 4 ++--
 sound/soc/pxa/spitz.c      | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/pxa/pxa2xx-i2s.c b/sound/soc/pxa/pxa2xx-i2s.c
index 437bfccd04f8b..849fbf176a70f 100644
--- a/sound/soc/pxa/pxa2xx-i2s.c
+++ b/sound/soc/pxa/pxa2xx-i2s.c
@@ -93,8 +93,8 @@ static struct snd_dmaengine_dai_dma_data pxa2xx_i2s_pcm_stereo_in = {
 static int pxa2xx_i2s_startup(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	if (IS_ERR(clk_i2s))
 		return PTR_ERR(clk_i2s);
diff --git a/sound/soc/pxa/spitz.c b/sound/soc/pxa/spitz.c
index 70442315f5c59..8caa1aa99bdc1 100644
--- a/sound/soc/pxa/spitz.c
+++ b/sound/soc/pxa/spitz.c
@@ -104,7 +104,7 @@ static void spitz_ext_control(struct snd_soc_dapm_context *dapm)
 
 static int spitz_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	/* check the jack status at stream startup */
 	spitz_ext_control(&rtd->card->dapm);
@@ -115,9 +115,9 @@ static int spitz_startup(struct snd_pcm_substream *substream)
 static int spitz_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	unsigned int clk = 0;
 	int ret = 0;
 
-- 
2.25.1

