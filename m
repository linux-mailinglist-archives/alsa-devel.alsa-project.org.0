Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF80C7AE5C4
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:24:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4373E86;
	Tue, 26 Sep 2023 08:23:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4373E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709477;
	bh=pHv3Rp1p5kxvOHaJBM3Kg6ZpxLOuh68XyB/0yFNebpg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i4JHjt4RAKg5nWw5SYV1/in2Q2pSfTT84EGDNuKiRfMuFRatiNOMh1qsQMRj6DtAp
	 ZA98EbcJTJCvi5HJRBo9/5QafauiFwy/L2yybkr3ezrfrdNNujqPu5pVvBlNGWPQ0r
	 kM5PPqmUbsdKp7MY4Ak3unG82whiB6n8fsxztmsY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E89F4F805E5; Tue, 26 Sep 2023 08:21:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66283F805E4;
	Tue, 26 Sep 2023 08:21:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34024F805E5; Tue, 26 Sep 2023 08:21:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14754F805D4
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:21:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14754F805D4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jrLbZZE7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aSOXpAHAv/nfQxlhy1VGlGU7gGRcnad2Ma/LQM0FUtDLRiOuiuWDjwizYWa6A9tXMCi68A/FpgYmG4kuxs3er24k/IG4YzgvYcIpy7yAtKXQyUdPL1SxUtvKlDQtffEjFT1vqe1RwZk4PIfUIhtocmVyCyZNvHu4yEKoesLujeJtrMPf5of8m7OOsA8s8JnQngrItDdWtgcPVkQ5iQA3PFE/qmpgzxrIc9Q3Pl0l86/GWPSqUv6OG2iUXn0qexG9SbdrcJGDOs/nXf68A+jh8ptbR4WNqdH6zU/T08sA5gDnRCKQJP5tShNouOe0PI0tGvxR1XHgHa1bNM+W88iYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIr5+JoJvyss2nVux0VtA6nj8q0yC/y4nUyXWQPmUfg=;
 b=acYsyF4imXeRUrbmNqPIUYlntavLrCkA/iESqh149+Nkh8knqH/cfN5kGFmXMHOh5Ntrr5r6YkLVTU+5QeFxOtG3AIqWzAjozQEeov+Cvd/vVh16SrdD8koxYjPTAKafwV80PsgFCxjyO9NOCJn5FnBDI0FEz23V7LuytKkgqE36ZAuLrYnLpcdCiBsGphRNjonw865thnEr9Qec/pWzz4C3ISDK7m8UJXDLJ68mSYnFb04tacsm2uafWLb3vNsO8PT/GB/rRITlAnl3wTrH5y0EMCzfLV0vEn7KxPNEqfYSgMmHJEpiPH2RQOWIePoAxuyA7syoofjtofET2Qy+og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIr5+JoJvyss2nVux0VtA6nj8q0yC/y4nUyXWQPmUfg=;
 b=jrLbZZE7Ztwr5XvBsazx7OfI1ToPViC2k7ytVuebZpI9OzyDMzYFLllUBoq4gAiYyQx5F1VhTNuwZkZ3j8CaTLQryxaMynZHbyZUDLvXwweXOwBrgCqzN5WoeYKU9JdcwdqxWwGI7Apc2T0zR86M9uW8VqCnjlrzyeOGiwPnJ7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10426.jpnprd01.prod.outlook.com (2603:1096:400:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:21:40 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:21:40 +0000
Message-ID: <87wmwdh2to.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Daniel Mack <daniel@zonque.org>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Takashi Iwai <tiwai@suse.com>, Yangtao Li
 <frank.li@vivo.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 12/54] ASoC: pxa: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:21:40 +0000
X-ClientProxiedBy: TYCP286CA0119.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e977f50-43bc-4327-86a8-08dbbe58d8b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cVppuEgZw9KFbjTQXfZIShDVZiZ23ArL3hDzqshUimXEd5dIz+q7/Y6DAIHxziCDz/hBxpHYHQwq0nks6LGXm3gihKq0myvwmNYuWKZvhqEumKOCpfm56jQJcdrvIESLyV2aaAAzr28O/Z3PM7woVI//h8zUVfG3tSzUi2u5pIeZJpVrwPT5gNQloOZXL5L131pPTex2GdBoFhXcPqg8VIlloaKrZWlu/VhEdcLhHuM8myPpBTLKh1HMKZn/F78hI/dC4HFBHXUvMGYbh0kuCzX5T87rdjmxfpB5JhXptZr0ptg1r3/2QKF61N53rVmtydvgNkrxiQz0RcvU4n5i/qjlTYIO6Ej2kQQUUWspDw/gVx1xhEVlWNtkyYKoN0STT3S5MSB7XTT3o7fQ7a649QU4+mmTZ4BjGqHyOJG5fuZwkBfXmqylOWBdib9GPsLdBBoOvGZJX2zMMpcHVqLdLH5DQJw7AQKEYyW6hoD4Fve/9gAbpWAR/neZEb7Mbw3G7m8bya25noLozAfk0yFEkIamjxOWo0RDy3sNmaDJoTxQDYKLcZFNzo5HZRQ9SWEhS5p743CFFaJ2WhrgacN0ANWwMXTSKRgUoQdpTazbWB7bBiE5a20DNgjSfqnAU2PgReA1VWlGY8cUok3fQvwx0+9yAl0vO7XA9A0YvQO4BZU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(396003)(346002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(7416002)(5660300002)(316002)(41300700001)(21314003)(41080700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sWZq8Q2ShwIF0zj55D8Kwguuvs778Db2o8Ihea43V2FaQrEmH5LD5ltUZhaH?=
 =?us-ascii?Q?Nslj00gPg9L+eN3STseWVOa9cmjKIwMx+X1d63gebWX3XYYW3PB1UPrtOazO?=
 =?us-ascii?Q?ViloITxz18lLcVtt+6tFchs24+MJgdkkpUAGpUdIeTqe8ScNKAt2GCynCJyD?=
 =?us-ascii?Q?Ke+p2XYDIA1wCjBIayQ8fKfL9RIP4/REdfAatnOADJdpbM3kE6iAVI7WP9mE?=
 =?us-ascii?Q?kNM3it8qWdAwSxADspDx+mvOznMUmBHW1MJ77XR5XYfadyn74zXMRzLvsAE+?=
 =?us-ascii?Q?I0PpI9Oyt5vHBts/egMO8ZKL23JW/njxca7KmgK+6Dhpzy0H+yS3uucBRnal?=
 =?us-ascii?Q?FdUQc8eNXdIWWHtsF0viU9W9hbXs2/HvDtJ96DIfS3baZquN7vVl9lDjHxoY?=
 =?us-ascii?Q?zHwspI7lVZNcfyZR329s2CdUReb1Xcxt1LMydaR4LR57Y2chRhEM1zlxjx2o?=
 =?us-ascii?Q?fOU/aG+I7O+GbgngUoDlAgiHwLKfsyv44ER4oEgXy52NdOSNdBEPq78ywaBc?=
 =?us-ascii?Q?r/bqmtvpg0Lece1PX/IKdT7WRx/6SPYekru9ogAEQuM1G1LO8TcF2UXVCeUC?=
 =?us-ascii?Q?OiW8sKFgu5FkUUrJR5SHbDufcMw72yVkXMnuklCpzlfSBPc7aV3Hpk+dqN2c?=
 =?us-ascii?Q?LOinVxXClAsUvoKJ/Ec7UFJW++db/VFqJMX2LzUWdjEGZNexVQfgg1pnJ2Px?=
 =?us-ascii?Q?bdvyiR4QQ5eSnKH3IWmAog3ljmaVkyjmPbzSIOyZPNfGbo1yZCJw2it+UYR0?=
 =?us-ascii?Q?hROPCSCf5Ac9CUqaTdQHzL3oL0iPwC3ieMyU8bekfOVj2qiUgHzRDFhDiPrO?=
 =?us-ascii?Q?+jxx2amk6MmIFguDTYxhTRRXrGJLeQIjW5XM5fRhp0TeHSoJE8vSDyjBVxBR?=
 =?us-ascii?Q?YDwk/nT8sbq68adTGRP1f9S1LRvtJSf5BqgK1IKZvvwizro2+3bCDN7rK/59?=
 =?us-ascii?Q?9ouh/yXgs9buSFBxQLVflXLQiDV90Np3dLk7G6VOKChCAq3xQ9fw1FFYAJ8e?=
 =?us-ascii?Q?/eyCPlxfJ3rMp+lUvsFXfNXbs0dFpHnWiYNAjmMtL4l8mEGA3xI8jHG4fYg2?=
 =?us-ascii?Q?cmsPGJKDqbWYhwxLdTPsMuBf1NYZn5LLcvhw7WXEhmEfjgU2kGtLmLE7jp6+?=
 =?us-ascii?Q?fptXfwG/eBGeeVDSnnuhHCq7hTQJ/SYwBC7cmHXxEtjDusCIM37Ye/tQE19k?=
 =?us-ascii?Q?u1gAObxUDD6u7J1c8ggj9Vo3oJH4/NPXx2tlwTTN9UVZosMmhaFq7avCN8Sr?=
 =?us-ascii?Q?gVy/71R8REuTN3MjyfEvbZ9Mj4N7Gbqrkvu5eip0VUWbmLqVL6WzyjRnIky4?=
 =?us-ascii?Q?fLaCK0IbdnmfUDx+IGug4KWKkUeHUzSFriFmAWD6EpWg114dw4lCl0ZssgGc?=
 =?us-ascii?Q?geJgF4RGkFQIYzAuG57HmA72bGrryQpbIiJHqDMGeYOORAhhd+q7Ww05vBQX?=
 =?us-ascii?Q?HAsyeba2Ewi+zEXFZ/vrZ9HkPyjXJLEDPgS0zVf8+q65FvDnQoAFrslxe/VV?=
 =?us-ascii?Q?dK0EBwg5oOIYyHEkBsLkO5+oxp3Pc98cMKbuhcL/D6n8RlG0VRSL339y5/Pm?=
 =?us-ascii?Q?3QhZIy1Jd0H443PHUwBqmVxdtR5Dl1Nlc+DOTSbVsG+rtmaePYHraLC4HaV4?=
 =?us-ascii?Q?VR2hvv0qxEAmTTWFge/WrDQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6e977f50-43bc-4327-86a8-08dbbe58d8b9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:21:40.7248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DHBtZE8BqkeDKMdYNoGnnz5FcVtPCO1+6YLWbHh/9IYHw1R+GGq4Ea5jYuowLgHTmxBK9ep2dvMawisJdvj3YmrauPckfBpZ2NMjuzxWUwuvYzASTjaZrh6rMgBemxS/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10426
Message-ID-Hash: 4WDQDBOKOE4BESY4U6CDNGDF4FVSZMHI
X-Message-ID-Hash: 4WDQDBOKOE4BESY4U6CDNGDF4FVSZMHI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4WDQDBOKOE4BESY4U6CDNGDF4FVSZMHI/>
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
index 437bfccd04f8..849fbf176a70 100644
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
index 70442315f5c5..8caa1aa99bdc 100644
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

