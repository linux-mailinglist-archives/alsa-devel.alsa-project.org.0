Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2187079D5
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:50:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEA647F4;
	Thu, 18 May 2023 07:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEA647F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684389010;
	bh=2jtDmaDl6KtbEYmFxhZmFmeOcN8HO+8tYSfkplOAz88=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uvEollLoL98iAuDjVZb9px2DZx8BlepeiPuE+Jau9twGRLa6W5PYB8gsW7wkzH0NX
	 dWFyT88+/MsT4Mrp5Wn0g1urdzOfwtlytlJOXl+pkRbSmQJu0yiYGbP0oT/O6ZlIK6
	 mP9UVcWxKgz/+7ueBUB8AVOPWN7Vt1bN7skLz00Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 619D0F8055B; Thu, 18 May 2023 07:47:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DABA3F8055B;
	Thu, 18 May 2023 07:47:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33C5FF805C6; Thu, 18 May 2023 07:47:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::719])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 065C6F80549
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:47:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 065C6F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GHie+ss4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLcY1bkDYG0H4n00Lr6VKRGa+lhydhPc4MEpY1XK4JD+KbvXgmCa2ULAaXyK7p9GMLk+nybUh/OqXJQpoVjhCnap8LZmHK9iR+dx43DTPz4g6ks2oLeLwh6cynrdz3eqqOaK6GljlYjwfx9vBZ6AGjM2B8m5D2psMdBYSJomXs7U4RPr9WoiWhYcxI7LLNGodGPA0eEaS+noZFiVxtE2kYI/dP/uqeAXPJcl3A4Tylc9DVvbvLf+kU8rbJ9F/3T6FncYukBXSwn+XJUtwkVw98t4okD+wqnu+zSJ4AKGR8S8dDqJpgMLU9B82n8+PLWCdp0KoxI3iMGt8cpHnP7fxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9+jAkZZwTLW4RCPhHGy3V60PYRmm/pJsYTfZKnJpA8=;
 b=axXfoVhLvNXH03iHR6LJqRRSG8lRMyWITao141Ih4bIBn/MmLQyHYEHEAH2Fr5W0QQ4LLcjRVwjCderRLJOv7q2EdKq9Fp0Foyjhm78fZYeMSIf3yv1h3Gg5UxuUSe5KgfE871aj2+Zr9loCyaMguOh0VRBbbBTZBcj6yfL/wuLjS0XTip4KK2VEoRRyqLtZJfWMNtYSf0S/Pn6aK/HIFQpLL7gOWZ285w6yF7mekQdb7/rNCY5x89hsWXuRxgUEKDPASjLiXBqNQQQyaj9Hwt/+Ck1IUODzZsacc91FLnpYDt+oP/yt2RmSZHzQiB2PjQwX+H2h1aF5ye+S5kKBZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9+jAkZZwTLW4RCPhHGy3V60PYRmm/pJsYTfZKnJpA8=;
 b=GHie+ss4+5/MgYLLoWY63a6mY8aymdrHIReZkk5vHW66QUS5G4j/GyTYNORjyF2Rddh+peu1NL99McqqVLR3xp/vq287ykLuYbMFCfEmWSWX+Sd3jfifCgvxpr8s4aeux6vB/ow6NZHZAhudaSGhP+BJap+/+4eTh6X3vH7Rbu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5591.jpnprd01.prod.outlook.com (2603:1096:604:b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 05:47:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:47:30 +0000
Message-ID: <87r0rep4we.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/20] ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:47:30 +0000
X-ClientProxiedBy: TYBP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e0d18d9-e24a-43e6-c8c3-08db57635e8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	logaJIwwWaywXFsL2XyTpS5uoZ2pxjm+cSD0Dejt7onxBuClahro01h0ZTXYcy4BlpDM1RJPbT/9RCHsBtcYp6HJirlJ1aXOy7FRvLMPrxmNh8QvD16JEMFzmSpNuW4/Nn4rgt+kQK3E9svqX1xqhF3ibZa7crrYRgwabZ0qMg8DOy/VIPTreMnlzn801eVfl6MqqsFcaMuDinu/fBOAdcmsS5FwDTLwbbgneuIfPvah/2RsfVPOdFFn9st7l6KErj+xDt4Hrp3rmC9b0ymb+uz8dfixk7mIue+XMbqe+OvSWy4JXJYqdIniY8rrfVtyAS42n7MSeU10JICLU+86Fedxjyg5NtYNS/hBRtDk4wUa1Nvy3D5siFmi1P6Y9LVYWd8AtF230fZZ9wOph41GzGG/YWEOx7EgqXHXaNuQcGmKhaKRv6iYV8J59+BlpkjGCXz+1LpuV32HZsoTXBMF807WyxGI6NNZIZqb/MedI12CqMishRDHquEdNImGRgiVDUbOSjcDOq76NdHGGLDSEZaBoov5ZQ0yXlN3luX/nhXRmZrfPODNPnNgd+C27Y0y4+r6X6fan4EXx1ALUonUytwvZW6M+3YF1yn8qOEaRNzMnj7esEFl5L1Jq1VMDRyV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(316002)(4326008)(66946007)(66556008)(478600001)(66476007)(52116002)(110136005)(86362001)(36756003)(83380400001)(6506007)(26005)(6512007)(186003)(2616005)(41300700001)(6486002)(5660300002)(8676002)(8936002)(2906002)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8CIbmkjS9IQugk0viqQDjY2lzcpcvaDu0PORLuzHJ3tch84giHC8pQxlw5by?=
 =?us-ascii?Q?ljxojN+7CyM9I5143OSbjQJ3pYdCjtXGHDsh592U5UHpqGfC50couGbSYDk/?=
 =?us-ascii?Q?d+1BZkUsGNeApeVRpjiA3YQzvALcwrbwSpBobhIffAq4CSOe8w72nFNXqep4?=
 =?us-ascii?Q?oQUDDUOzvqhBSbrM3+v5kI/ErS1Vv40jwL/osg+nRM0u6TMOLwzHXa8ZhBSJ?=
 =?us-ascii?Q?JNu6pMak9vV3vEztw6rzdiuxmO837x/ti/qAojA3wfzwkV+cMh0KfwPUI80v?=
 =?us-ascii?Q?eDA6VoInK/M+xMUFLJZrK056XtrUO2c5Ski36u0bAzlVulMcoFxIt49ldHHT?=
 =?us-ascii?Q?wc/3jrf/usFmxkJUz/CwOs1+2kVKeT5eB4tQOYhEzm2aB0wvXvANaX5oY/RW?=
 =?us-ascii?Q?H2HGAKlhJ+p7E7FrqYKx+Iq9bYbzOVf+B8yrysmv6WWVvus0Hi0PnAzgKzbr?=
 =?us-ascii?Q?fZRlD4a9i/JjbXTTv2G9SylSLcTd5JOTRL677rpIUSJ7+NNd1/XIUBa/MxkU?=
 =?us-ascii?Q?k68+dcKy+PnENhtqlDb1+l9zrMPQHqWHFYegO/84BVRhtiOx4BlA+wcJGYj9?=
 =?us-ascii?Q?2zNXomjDZ8qQsgIKRmvS0Eg1YV93/1DylKboVfwZ/OR7FOS+WWzRlbs1gBor?=
 =?us-ascii?Q?F+b7J9IG0VQil0TZsdz2LJKppBK7jys+N2+zhhvMo3TYJk95Q0qpYee7234T?=
 =?us-ascii?Q?IaQhBl1UBI7+ty/nus0rehX4RrNshYbYtTcUKC4fGAzZyJ2XWc1LQzyIBq3G?=
 =?us-ascii?Q?egzcmU6AXWd6sFEbxuojhVzyEWroTWRRPKAyRpThlRYahqqcvl5uRYhIIO0g?=
 =?us-ascii?Q?q0NvYV0TaAI9y7kpsTzlaeSrz4J2xUkznjO9QzNXMUd4VyiPbU9efHnDWTf1?=
 =?us-ascii?Q?nJxRkbofdsp1lB/MjlGBUq459HV8oXh01eA8PRj45kyoD6Pz5lZabvaV5Y0V?=
 =?us-ascii?Q?xFelZMSoSSoovd096bySMpBVm+5XcwFRlBO7ot7mV8uVjbTrinM7bCPBKA+H?=
 =?us-ascii?Q?G3ky3KD7aZp+nRuddChbHaWp6OetDHMOTG8A1H9MlYO/jnDqNq1gJuu7zev9?=
 =?us-ascii?Q?F4b2S9+C6r99hvTbPrA2qzsDi10tnwdfjf4FHC+Yvb35P4jv/Wc4SLH+FGns?=
 =?us-ascii?Q?+Niu0h9LbEZyd/XR+wtTivWV/cZYEAo/BYZjNnqb9tFOXEBud7MgRUxa7GGh?=
 =?us-ascii?Q?OUgMdBSja3BFm9MTUtfr+DLuEdP2xMbBcl8cF7E5Weap9lttLXBenraGrf0j?=
 =?us-ascii?Q?IsQCbO2wMOV36DhjiMSlLuAHbv/EWWRPXJTZI571hlZeqvMHtngC/00LVNIB?=
 =?us-ascii?Q?NIhICaCuuCVrhszAkEhgH0Ky1HDzSARif7LuwHyulcRLlinAgHysXLCVwvGS?=
 =?us-ascii?Q?ZlWnMZVP5yxPac0WCWAGKkTCfSfAiZnqZ3nzQ8a/0yXin8TOn6oWzLzDVn4Q?=
 =?us-ascii?Q?y/mT+JMbp8D1jEFcJfX9cC0f1OSItCgf3N1UbhQsptbI43JKfdqczc/ghZ6e?=
 =?us-ascii?Q?ESJR8+qWkdgv1KSH7Wgw+zf02Ss9Pm2p1obSRHEgo3BFvdQi6E5Zf9ioKCiB?=
 =?us-ascii?Q?KlYeHPp4OMhPIJTG8ZQ5bJEI2OtfxG6nKRNJcEAeQmbOdjZpaMZ+R5UV9Bt8?=
 =?us-ascii?Q?ZuT5rb9xpIH/nCjo987YXHQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1e0d18d9-e24a-43e6-c8c3-08db57635e8a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:47:30.3697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hk8zI8xbT/8UBzodrMdRFFaBQo/rHRPwJDr8uU89B3hPYZJCQEUs0Mio+9ThSLk0kupjuppu5Bo1D8do8CySWGjtv02RxXjGucz6LMZCdFPQh6f8HA7ZWik2d1THoj2q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5591
Message-ID-Hash: J2GJDSOPMIAJSIUDVQOVCO33ZQLSEN2C
X-Message-ID-Hash: J2GJDSOPMIAJSIUDVQOVCO33ZQLSEN2C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2GJDSOPMIAJSIUDVQOVCO33ZQLSEN2C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current soc_get_playback_capture() (A) is checking playback/capture
availability for DPCM (X) / Normal (Y) / Codec2Codec (Z) connections.

(A)	static int soc_get_playback_capture(...)
	{
		...
 ^		if (dai_link->dynamic || dai_link->no_pcm) {
 |			...
 |(a)			if (dai_link->dpcm_playback) {
 |				...
 | ^				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 |(*)					...
 | v				}
 |				...
(X)			}
 |(b)			if (dai_link->dpcm_capture) {
 |				...
 | ^				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 |(*)					...
 | v				}
 |				...
 v			}
		} else {
 ^ ^			/* Adapt stream for codec2codec links */
 |(Z)			int cpu_capture = ...
 | v			int cpu_playback = ...
(Y)
 | ^			for_each_rtd_codec_dais(rtd, i, codec_dai) {
 |(*)				...
 v v			}
		}
		...
	}

(*) part is checking each DAI's availability.

At first, (X) part is for DPCM, and it checks playback/capture
availability if dai_link has dpcm_playback/capture flag (a)(b).
But we are already using playback/capture_only flag.
for Normal (Y) and Codec2Codec (Z). We can use this flags for DPCM too.

Before				After
	dpcm_playback = 1;	=>	/* no flags */
	dpcm_capture  = 1;

	dpcm_playback = 1;	=>	playback_only = 1;

	dpcm_capture = 1;	=>	capture_only = 1;

This patch enables both flags case, but dpcm_playback/capture flags
will be removed if all driver were switched to new playback/capture_only
flags.

Here, CPU <-> Codec relationship is like this

	DPCM
		[CPU/dummy]-[dummy/Codec]
		^^^^^^^^^^^
	Normal
		[CPU/Codec]
		^^^^^^^^^^^

(X) part is checking only CPU       DAI, and
(Y) part is checking both CPU/Codec DAI

This means (X)/(Y) are checking same position.
Because dammy DAI is always available,
we can share same code for all cases (= X/Y/Z).

This patch merge these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 75 +++++++++++++--------------------------------
 1 file changed, 22 insertions(+), 53 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index af5d4e1effdf..f47ddf660c57 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2732,7 +2732,10 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				    int *playback, int *capture)
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
+	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai *cpu_dai;
+	int cpu_capture  = SNDRV_PCM_STREAM_CAPTURE;
+	int cpu_playback = SNDRV_PCM_STREAM_PLAYBACK;
 	int tmp_playback = 0;
 	int tmp_capture  = 0;
 	int i;
@@ -2748,61 +2751,27 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		return -EINVAL;
 	}
 
-	if (dai_link->dynamic || dai_link->no_pcm) {
-		int stream;
-
-		if (dai_link->dpcm_playback) {
-			stream = SNDRV_PCM_STREAM_PLAYBACK;
+	/* Adapt stream for codec2codec links */
+	if (dai_link->c2c_params) {
+		cpu_capture  = SNDRV_PCM_STREAM_PLAYBACK;
+		cpu_playback = SNDRV_PCM_STREAM_CAPTURE;
+	}
 
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					tmp_playback = 1;
-					break;
-				}
-			}
-			if (!tmp_playback) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support playback for stream %s\n",
-					dai_link->stream_name);
-				return -EINVAL;
-			}
-		}
-		if (dai_link->dpcm_capture) {
-			stream = SNDRV_PCM_STREAM_CAPTURE;
+	/* REMOVE ME */
+	if (dai_link->dpcm_playback && !dai_link->dpcm_capture)
+		dai_link->playback_only = 1;
+	if (!dai_link->dpcm_playback && dai_link->dpcm_capture)
+		dai_link->capture_only = 1;
 
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					tmp_capture = 1;
-					break;
-				}
-			}
-
-			if (!tmp_capture) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support capture for stream %s\n",
-					dai_link->stream_name);
-				return -EINVAL;
-			}
-		}
-	} else {
-		struct snd_soc_dai *codec_dai;
-
-		/* Adapt stream for codec2codec links */
-		int cpu_capture = dai_link->c2c_params ?
-			SNDRV_PCM_STREAM_PLAYBACK : SNDRV_PCM_STREAM_CAPTURE;
-		int cpu_playback = dai_link->c2c_params ?
-			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
-
-		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			cpu_dai = asoc_rtd_to_cpu(rtd, i);
-
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-				tmp_playback = 1;
-			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
-			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
-				tmp_capture = 1;
-		}
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+		codec_dai = asoc_rtd_to_codec(rtd, i); /* get paired codec */
+
+		if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
+		    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
+			tmp_playback = 1;
+		if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
+		    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
+			tmp_capture = 1;
 	}
 
 	if (dai_link->playback_only)
-- 
2.25.1

