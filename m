Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A95DF6C98FC
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 02:35:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BB7084C;
	Mon, 27 Mar 2023 02:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BB7084C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679877326;
	bh=pJnleCP+Q3l2Sl53pOtVCy9WDu4tGIWINqjoX4H3Mrg=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=KS2GtgxTiMwyWGc2OLFydaDvcC3lDceq8m6yHTPWVkW3e18adCEF4QSieWdTfR50X
	 PCOPp3y4TTTtqC9HPfYkrhtT7VAGs00SqJzAKt95dkwYauw6FNG4eDKb/xQtbW301e
	 SI7VHzGT1P4DdWXpLpOs67gUetqBDXddXsxEAYwI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84150F80272;
	Mon, 27 Mar 2023 02:34:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06998F80272; Mon, 27 Mar 2023 02:34:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-3.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC143F800C9
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 02:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC143F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PI+g8PGg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESSYXQiIYI5aM7hOaKOCPmE2ycVaM162ZppKvVtOZ9FQA76uCrl3WMsBKHwxoCkaBpKE1Y0mNrserFH/byqo7bbUV50FfM7ZaCR8agU9ogiMjB4Kb8RU+y6RKLlCDeGVe5vNgHSnL+tIxA+EuF/k1Hy5BS5WJwHb5PuFNccLksqIhI8//94RCbuw4JMEPszwzUKcVP/3MAlylXdPfJTO+dn4V+xTDL1/DSfTxvRkPohouQ74Zc4vGngOCA3JM4PEtxNj3wFlZdgWCz9NCHEQJWhH4oKqNnVFc5R4/YfY/5XyWpubbuu1edqNPg+mcOyDOaa76AF3PceBdoLVqr9L3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5/TDL18iiQUIeBPfV7xdOmk+LuJFBRMdzm9ihjPE8M=;
 b=LMnu3Vk3Gjxf3yx4mhbXk7Nxw5cAbTTsFDYC6rBRkWikQQKtIFxSyBlb1cF/kolLL6cqnZytX/oQqyvM2ca2jktf/AL2HSqGZeu+K/frQpbek4EMZmnc0Q8GjeSVrQ/mxuVjjnFi2zniYkElc+BWPrGjXRidsb/+KQ8+hXCPqpwGdLjNdsB3hPw3J5rJElibqdudH85iFxVYFdg/2q9Riyr9x+KaZHhGy3D9dJehb/1bjO7AIPn/f/PswnC+EUhuzcAzJ2Q1zQbV44ObG/3IrtQnFzpLQT6qcx5LLXrYYhVGUvOD5ytKXkFGjY+ivrxiXJQQGc7ZxMgL/M8rn3pSvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5/TDL18iiQUIeBPfV7xdOmk+LuJFBRMdzm9ihjPE8M=;
 b=PI+g8PGgYib2HhuiJbbrdkK7iNw1CZ09rbNCgbedFcLaPII9P4uv6b70L819Njwg7P34S9XhidzY4ruXi3kSg0bowMCl+YcQkDkXSZTVBhlqmW5GC4zqrcFdYTAcCh+T2MsThITkA38cDgplQZhG75JRTz8sZpp9yfBV7EX5V0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5396.jpnprd01.prod.outlook.com (2603:1096:604:ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 00:34:14 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6222.030; Mon, 27 Mar 2023
 00:34:14 +0000
Message-ID: <87ilen6ni4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-dapm.c: tidyup dapm_connect_dai_pair()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 27 Mar 2023 00:34:12 +0000
X-ClientProxiedBy: TYCPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5396:EE_
X-MS-Office365-Filtering-Correlation-Id: df2981e8-f31d-4783-d234-08db2e5afc9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/9WT0iUO4aFx2vdTUgLe5I5JwKUlmfB688GiVBCGlqsO9UgDPAKAMkUFYDROxhatEvvmz+au5XZNJR9mEE2IJXH/nK1oTb5spnt93dkgzvruPetXhbweDtd2yPhFtW62/fQicsG9HEVJuHDtKK/o+gBjnfXm55P83NUvQMFJChUepHTHKZZGyxlJOa5QkYjP98dBAg1Pq6ZhNhiXfqAGidq6ZcXeotoljARk2PwF5o9hXXDymHKKrdqLYmJW8BHBRgojArRIM/7Irmvpnl+SQcY5HF+aPMQljKNN6zlSZLVEkewjjzWHUG0k6sfJIrjWNdvkrBzMsVlysa7KjnG8X5lSvc8bCslB3XNgTpB0IEkHjM9vd+KOIB68gVyOPZ0W+qvbWMKVJjl0KAfYNILPNmI3Z/FR0aJL4AyjaivWwxA5BNGbhG3tVt27jps5lORv4iie7Na4Ca0XZxos3HUiuCZsiyy/93MpuEGGoRQjM5MY16crfgOb/Kv9oAOJv//Fl4pRh3ALLT/nSPCZnEsfL0rOj8HCozclrt/FBFhr229jSkhXrumB1iZL5YNjuQzFmSWYnKSZtysMDBRFDW6dy7VZ1OaT1SyyNEXig2Xzh3Hf3gjhoOitZla5ELqkQ3GS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(19627235002)(5660300002)(8936002)(6916009)(38350700002)(66946007)(316002)(41300700001)(2616005)(38100700002)(4326008)(8676002)(66556008)(66476007)(2906002)(478600001)(52116002)(83380400001)(36756003)(6486002)(186003)(86362001)(26005)(6512007)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OoB6+gzgftVI9bAT4FkfpLWG5i7oJPlJXXPA4f8WwXoDbmuKhbee+1wzn5HY?=
 =?us-ascii?Q?zEPp8bnuIp2osHqt0Hod/bx7sJSmwtTINH3Si4nr1Hpk/gbJ54YwFCQdfTl6?=
 =?us-ascii?Q?0pWseEW87iv3NHeKSeQOKMqIU9+17V4yJxR55xL0wA+BsMEinxe2tkx/uB9C?=
 =?us-ascii?Q?NR102JWziFdEKUlivSy714NpzLby6dA/vr4i074Cx2u5wrz7159V687cvCGv?=
 =?us-ascii?Q?gDHBGfCCyF5YsHdKgKDofq3ujS59N6Gg7vkq95e0VF8yaQv4PxzwLloFJSPU?=
 =?us-ascii?Q?/c1RzmRCGLq6Q5vxP7X94DxdbSlhqREYGiz5azIygrdsx8gvfvRvsJfbk7Gv?=
 =?us-ascii?Q?1Pc8BYUkjU1BFWHZidnHROxcm91aeXM5C13nJnCPVS5SCKQbuvU4TwH4n3zZ?=
 =?us-ascii?Q?K2h1IL+G9mGV74qZqvcoTIIkWYpqsSrtpivB7Pk+1frf6cmMYlr0lMOoJMO6?=
 =?us-ascii?Q?ZO8b+z9tFiUEceT8bFMFThOv08KK/HzHFHsj4+NH8bO2QKRPL4S6NHd9WWVS?=
 =?us-ascii?Q?bHRw5mpEL/jnqYJW4fSGG5GdaJbCcKpiD+S7WAIZ0TOyHrr/deFP6gMaJsHj?=
 =?us-ascii?Q?nX6D6cMb3CYALilWv5qs3eW3iUY2u7U97rVYnl6F2ghZk6IarNCr7YPPUILV?=
 =?us-ascii?Q?rWXqdD32zhfnfcL6yc38RNsbsJ5wXmMvmmsd1XWwv2VQZk69M8Nph6u5K4op?=
 =?us-ascii?Q?GguvqeyzCcjDq8M10atXTz+SY3qQ3Rj5q/0NUWqqNc+F3ZdQ8ZsInJSENk0Y?=
 =?us-ascii?Q?vVVSbJNGlKePHU33J+LETD0lyq4uZTD7nBVm7mKvmdKLfW2Fdi+hvoOcB9sV?=
 =?us-ascii?Q?SizwVTJ1mYRDrV+VbWFS+TvEA9udAGY0ZJHgjKpO9aGrWcGnT1lSRB3YU0Pu?=
 =?us-ascii?Q?QAABWQVgv+7YY1ml+fg101V62MUu2fSAKxjp9/vjW5b35nUzxZTDwpfPmwe4?=
 =?us-ascii?Q?24tFg1Z18avV1sdL3HC/pIP8eAWV1wOkG24YNmCjHy1PWevgy1x7/ILjgKIH?=
 =?us-ascii?Q?gS12TXbyjrCY5KsRcXAELP54zsUxloeiGKQ58wDjlxFqbxakrutDGLsBEfrf?=
 =?us-ascii?Q?U+UJ/QPRrxSC14zBoXpwUXdGlSxg2ZI8Kzox8CzOB/buf9f9trwLDPDXWCTh?=
 =?us-ascii?Q?b/6waP3bMEetm8swr9H686HakVBhZLfGjfoJzsWss+052kUk17cba4tUn2c4?=
 =?us-ascii?Q?ED8TvxQ07Fa4eSOtaOgSH5pf+/H3iVx9leEenulsHveRTODPOisEg8QhXyau?=
 =?us-ascii?Q?LDLscllAo/cVH02Lzz5pWG/aiaqTjMUnU/YEVIDBmMXD/41JUJ7Kfux1djDp?=
 =?us-ascii?Q?NnWhvvBGh5lzm2J7QZRTwiXfam3ofFmudKgh5BKifvP7SP9xNQMQfQ7vSiql?=
 =?us-ascii?Q?MdYEq6aww8zYSVMUtIg31aHFv3xGeq0ano+PZ2CeGqWlYJv5HhNf9J5W6agV?=
 =?us-ascii?Q?TaFC27p+Mc9B7CCbcgIcZ/+DVCoGdi3ved8DVZv55Slovuze7ZE7Lf9Z8vJi?=
 =?us-ascii?Q?VJKT/0e0gh456KYBJlQ3+X3/CVDJ6Hfl2Vrw/aSvJ/7FcvpDvDOEjYq5UqI5?=
 =?us-ascii?Q?aLbqEfFRHm+YCosmeG3U9cYu0YMr3Ub7bwH+mZs2CiRYFsxND6P52M63scP9?=
 =?us-ascii?Q?r2dgIKae7tfFyiOUS0ppylQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 df2981e8-f31d-4783-d234-08db2e5afc9d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 00:34:14.0173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DUspopONjUdPKFf2w5s6LId/cuVDitInezKUa7U2zhbI9D0Jv6BLlkKiGDE36+iH9epBIFBR9Q52w7SYUfADqqsYEJNp3CzUch/ksCo5XoYPy1dl9o/OH+k07ZuIHD+N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5396
Message-ID-Hash: I3LS3ZBU4HUXPZ6L7P6KYXHHRM4L2I2V
X-Message-ID-Hash: I3LS3ZBU4HUXPZ6L7P6KYXHHRM4L2I2V
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I3LS3ZBU4HUXPZ6L7P6KYXHHRM4L2I2V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dapm_connect_dai_pair() handles
"Normal/Codec2Codec" x "CPU/Codec" x "Playback/Capture".

(A) is "Codec2Codec" case of "CPU"   widget x "Playback/Capture",
(B) is "Normal"      case of "CPU"   widget x "Playback/Capture",
(C) is each          case of "Codec" widget.

(X) is handling "Playback" case DAI connecting,
(Y) is handling "Capture"  case DAI connecting.

	static void dapm_connect_dai_pair(...)
	{
		...

(A)		if (dai_link->params) {
			playback_cpu	= ...
			capture_cpu	= ...
(B)		} else {
			playback_cpu	= ...
			capture_cpu	= ...
		}

 ^		/* connect BE DAI playback if widgets are valid */
 |		stream = SNDRV_PCM_STREAM_PLAYBACK;
 | (C)		codec = codec_dai->playback_widget;
 |
 |		if (playback_cpu && codec) {
(X)			if (dai_link->params && !rtd->c2c_widget[stream]) {
 |				...
 |			}
 |
 | (z)			dapm_connect_dai_routes(...);
 v		}

	capture:
 ^		/* connect BE DAI capture if widgets are valid */
 |		stream = SNDRV_PCM_STREAM_CAPTURE;
 | (C)		codec = codec_dai->capture_widget;
 |
 |		if (codec && capture_cpu) {
(Y)			if (dai_link->params && !rtd->c2c_widget[stream]) {
 |				...
 |			}
 |
 | (z)			dapm_connect_dai_routes(...);
 v		}
	}

(X) part and (Y) part are almost same.
Main purpose of these parts (and this function) is calling
dapm_connect_dai_routes() (= z) on each cases.
The difference is "parameter"
(= Normal/Codec2Codec x CPU/Codec x Playback/Capture).

This patch cleanup these, but nothing changed for meaning.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 93 +++++++++++++++++++++++++++-----------------
 1 file changed, 58 insertions(+), 35 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 3fa30a3afec2..064547e77063 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4325,60 +4325,83 @@ static void dapm_connect_dai_routes(struct snd_soc_dapm_context *dapm,
 	snd_soc_dapm_add_path(dapm, src, sink, NULL, NULL);
 }
 
+static int convert_stream(int stream)
+{
+	if (stream == SNDRV_PCM_STREAM_CAPTURE)
+		return SNDRV_PCM_STREAM_PLAYBACK;
+
+	return SNDRV_PCM_STREAM_CAPTURE;
+}
+
 static void dapm_connect_dai_pair(struct snd_soc_card *card,
 				  struct snd_soc_pcm_runtime *rtd,
 				  struct snd_soc_dai *codec_dai,
 				  struct snd_soc_dai *cpu_dai)
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
-	struct snd_soc_dapm_widget *dai, *codec, *playback_cpu, *capture_cpu;
-	struct snd_pcm_substream *substream;
-	struct snd_pcm_str *streams = rtd->pcm->streams;
+	struct snd_soc_dapm_widget *codec, *cpu;
+	struct snd_soc_dai *src_dai[]		= { cpu_dai,	codec_dai };
+	struct snd_soc_dai *sink_dai[]		= { codec_dai,	cpu_dai };
+	struct snd_soc_dapm_widget **src[]	= { &cpu,	&codec };
+	struct snd_soc_dapm_widget **sink[]	= { &codec,	&cpu };
+	char *widget_name[]			= { "playback",	"capture" };
 	int stream;
 
-	if (dai_link->c2c_params) {
-		playback_cpu	= snd_soc_dai_get_widget_capture(cpu_dai);
-		capture_cpu	= snd_soc_dai_get_widget_playback(cpu_dai);
-	} else {
-		playback_cpu	= snd_soc_dai_get_widget_playback(cpu_dai);
-		capture_cpu	= snd_soc_dai_get_widget_capture(cpu_dai);
-	}
+	for_each_pcm_streams(stream) {
+		int stream_cpu, stream_codec;
 
-	/* connect BE DAI playback if widgets are valid */
-	stream = SNDRV_PCM_STREAM_PLAYBACK;
-	codec = snd_soc_dai_get_widget(codec_dai, stream);
-
-	if (playback_cpu && codec) {
-		if (dai_link->c2c_params && !rtd->c2c_widget[stream]) {
-			substream = streams[stream].substream;
-			dai = snd_soc_dapm_new_dai(card, substream, "playback");
-			if (IS_ERR(dai))
-				goto capture;
-			rtd->c2c_widget[stream] = dai;
+		if (dai_link->c2c_params) {
+			/*
+			 * [Codec2Codec]
+			 *
+			 * Playback
+			 *	CPU  : SNDRV_PCM_STREAM_CAPTURE
+			 *	Codec: SNDRV_PCM_STREAM_PLAYBACK
+			 *
+			 * Capture
+			 *	CPU  : SNDRV_PCM_STREAM_PLAYBACK
+			 *	Codec: SNDRV_PCM_STREAM_CAPTURE
+			 */
+			stream_cpu   = convert_stream(stream);
+			stream_codec = stream;
+		} else {
+			/*
+			 * [Normal]
+			 *
+			 * Playback
+			 *	CPU  : SNDRV_PCM_STREAM_PLAYBACK
+			 *	Codec: SNDRV_PCM_STREAM_PLAYBACK
+			 *
+			 * Playback
+			 *	CPU  : SNDRV_PCM_STREAM_CAPTURE
+			 *	Codec: SNDRV_PCM_STREAM_CAPTURE
+			 */
+			stream_cpu   = stream;
+			stream_codec = stream;
 		}
 
-		dapm_connect_dai_routes(&card->dapm, cpu_dai, playback_cpu,
-					rtd->c2c_widget[stream],
-					codec_dai, codec);
-	}
+		/* connect BE DAI playback if widgets are valid */
+		cpu	= snd_soc_dai_get_widget(cpu_dai,	stream_cpu);
+		codec	= snd_soc_dai_get_widget(codec_dai,	stream_codec);
 
-capture:
-	/* connect BE DAI capture if widgets are valid */
-	stream = SNDRV_PCM_STREAM_CAPTURE;
-	codec = snd_soc_dai_get_widget(codec_dai, stream);
+		if (!cpu || !codec)
+			continue;
 
-	if (codec && capture_cpu) {
+		/* special handling for [Codec2Codec] */
 		if (dai_link->c2c_params && !rtd->c2c_widget[stream]) {
-			substream = streams[stream].substream;
-			dai = snd_soc_dapm_new_dai(card, substream, "capture");
+			struct snd_pcm_substream *substream = rtd->pcm->streams[stream].substream;
+			struct snd_soc_dapm_widget *dai = snd_soc_dapm_new_dai(card, substream,
+									       widget_name[stream]);
+
 			if (IS_ERR(dai))
-				return;
+				continue;
+
 			rtd->c2c_widget[stream] = dai;
 		}
 
-		dapm_connect_dai_routes(&card->dapm, codec_dai, codec,
+		dapm_connect_dai_routes(&card->dapm, src_dai[stream], *src[stream],
 					rtd->c2c_widget[stream],
-					cpu_dai, capture_cpu);
+					sink_dai[stream], *sink[stream]);
 	}
 }
 
-- 
2.25.1

