Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1681F7152AB
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 02:52:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EEC9843;
	Tue, 30 May 2023 02:51:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EEC9843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685407931;
	bh=ZuNMos54AIJNlqmD0jq22TXyOPV/7yJ53PYTpNN2gro=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iWKVS7MbTRV/Uk4sQizOtuL1wV1YbVr27/Dv4uy2lPA+qHrHDq2uNcc1eFh4ylahV
	 EXsxFwfVPaWAu57rBwKL52CmBnYgUoU+eMO1L8AfDMwzXwCWL6ckz++wkZTCjvQBOp
	 XooaVbnIV+5dahqgRY6AHKn73jGgQH3m7tn0eD+s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38722F805A0; Tue, 30 May 2023 02:50:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0586F80571;
	Tue, 30 May 2023 02:50:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97DAFF80564; Tue, 30 May 2023 02:50:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E03BF804FC
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 02:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E03BF804FC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KXbJ/HJf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtVIA80OS9tzCKuaFsTUgl2336PjitDFvFTGOzdwIVYxFxD3RtN8lQtL6fu+Kby9B5vh8BIQPQY7fhI5Nf6MvzcZ1VhjLKckd+qMu7HP3otA59JR1Z1VLhDyGf667ureb2+ZDZmSWHG13I9SArllHTVwbEV4cyoF0fzjTiYnwBbL8RcF1zZbjFj5ZAVIo71g1zp4qu2eFNPjWcZlRBHqn5m4Q7LJDkda955fswtRSTy3UiGas2DMGQKl8nR1XxmuGJu1bridlKOKG9uKISaiVyJTFU8CGI0+z5ChyHyvvMAoQ4RMUcryXqwksHZPHABhc7oBM2leImLg0GObG1n2Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+oOkqhKbkTL/3SiEEeyds8HkZVDM28kI07WMjcz5kLc=;
 b=ExxOiRF2gbilSgSnOYUbiXhkjjpT8NDfjcljtgYpPbBK3q5A894HwM4WeipFSymJhayYBxIwSep52bVGOj0MZsMblh6gaBBLTLWzMQlfV/X2JhIKTwFHlsf4whNdgzVXoiGqMetIfxylvg+iJE2QfwNkDGDNCZERvQ7kGk+Us3foXxsv2eWW0vthOdmyixrE4gwPXX+VoGLOzI6jSP4BgQMk/l2VNLLAt0Wb9vadSPy4L+5gv2Baq7mAXASTxweVlwR6A/cx6iMPZJxr5ynkOhpuUoyK+az0QuVTnO7d5ePCtO3T0HRMUn94UL2zOp3Tknxq3EMbWR98AkHA1V7ZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+oOkqhKbkTL/3SiEEeyds8HkZVDM28kI07WMjcz5kLc=;
 b=KXbJ/HJfkzGqsR1Q87jemRjP/XatUE4pP0jk5uGrtpFoXueHGhc/fd9YL76Rs5pzdAroJwLOteZ17WQ/EUpkMBhJFviT4tHezj7Wa85gB55CeZxsUuVVh6Pz8sYqbbrf6jA417wD1XtTWwEe8T2/vtn1gwE/j9ipBpoCv0xX+2U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS7PR01MB11502.jpnprd01.prod.outlook.com (2603:1096:604:243::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 00:50:01 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 00:50:01 +0000
Message-ID: <87ttvuzlqe.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/5] ASoC: soc-pcm.c: use temporary variable at
 soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87zg5mzlrc.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg5mzlrc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 May 2023 00:50:01 +0000
X-ClientProxiedBy: TYCP301CA0044.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS7PR01MB11502:EE_
X-MS-Office365-Filtering-Correlation-Id: eac4f4f4-8412-488d-c16d-08db60a7cd00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cgcrEI3hxa1nzCBu7pzQ+y91qxLkV5mtuctON11E8XPqXHVlYQru2EPGtWB6PR9aoYpU7BH5YamwdYo9TFN2iItpE0qcGQMeITSJFQiDb90If/Lddbdbs3WynhNDHeNXFs+oOhI+uZ3IDwXekiaBmIIOdVES1nkgFEZ8vSaosL+ex2M5JSeGiAaIGiPrnhwNXKljQkmWIUq4g7LTyykGzZrd6DRP1i1qMv7f3TvZCBmUadDutAFHCcUaXhQeVlJ0GoIQ9QBH0cBlLHwhjiq69uW6TABwvFCq0fvqXJd20pgRXqYFCaraKtVFtvJt0fAX80yQz+4AjaSLMuuEJMFmb1UY/iywERcJCrmm1IzDboLaSRJTa5JYNFa3CA0Qcf/l1ulRFGAAUWzA9LKQr2vLhyQEqQbq8dDCXaM4IBAP7/Mr7uov1XJ8rmAjaXvn0V5yZcRvfAEeMpy3MC2jtrRI12/QGvlccqGjFdJZGTecRrL0/nGUd/c291npVANaelhvCmM3eHNWyzfHCYIGUd/ll/rrKq8MH7c0Vvzo/jBXvqu6YukOtyhhsgvi4FOEijTcMR7/swU0sxRdu9B6Qh07ysqqKmNEW+mHvIdENdHgSte95kNnt+akW9jimkN08NpyGg8aTz7g6cM79zz7aBUXFw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199021)(186003)(2616005)(38350700002)(38100700002)(41300700001)(83380400001)(6506007)(26005)(6512007)(6486002)(52116002)(478600001)(6916009)(4326008)(66476007)(66946007)(66556008)(316002)(5660300002)(8676002)(8936002)(2906002)(86362001)(36756003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sNHibJRFQq66e3FuGJ0Qk7AKW7dvGHVqR6+pFZuSLhar/MUqOat2RotjKuE0?=
 =?us-ascii?Q?6yZ9o7+txTGZPS6m5OnL7/5R3thRjxnRw5cNrfCtRZaPmEtf3AHEpjL+fFTy?=
 =?us-ascii?Q?CHWhpuekQDxRcEMep3KzYhpHRupho3plIgWWqDCEKnZ/SKRj9AvhS2/37a1e?=
 =?us-ascii?Q?YBIQhpsYhfKgVOC12TZ8eWylnM2yLmbvgQl6XAptNQnzbd5NKUTLjjwxGbH4?=
 =?us-ascii?Q?ZgJuYFn0UPgJRiQsy1P99JVrNovss1Lt+bwUm2X9tTcSvDRmGiOPOcdfhtu3?=
 =?us-ascii?Q?bz+0nzLs46DaJtmlt6cOYEvu5koWBGrjEivkSXSKZHJWu2ZfRmylrsTXIJRI?=
 =?us-ascii?Q?q3g99pX2ORS6BwuK/aX4A4U/44K/gEGm8SHRij3C3sEhg0VS1qQKzOdgRT/J?=
 =?us-ascii?Q?1r12xZoKlq7kc3ql6cudKA2AErolKCPGS6VJZXJ5Qgn1Wjv3s5RmAJ1eX+3Y?=
 =?us-ascii?Q?BXj8hhCzOl+c+qD8epw53H/e1LENdN50w2SIFPPOB+wz25PJzP5mugnaRvoR?=
 =?us-ascii?Q?SAsnPjy6VfFSzPPJZKktp07DjjEXnSsU6k/b/zTchGjxCZEGtcrns6piaf9J?=
 =?us-ascii?Q?QjsK0uIu4oVStMUTdoHWJUdOfNeFLpCzRSrCsTcls2Cl+p0YKFVTwwyLbyi5?=
 =?us-ascii?Q?czVJdKQwQ79vbuvuVS+lY8LZr0s0S6v4m1prDTeTgEvjhsAe2RaAV0iKdid4?=
 =?us-ascii?Q?+w39o4aiBtNtX3j4Rq7XXW8bNsIXkllCfmycWUOxAZHWXGV7cKNvMqs9VuiI?=
 =?us-ascii?Q?aStREUZ+BAL/+1S1gDm2HrYxDbYnYE9g87vev8wk9/nMbZUv75s/ay4BLFCb?=
 =?us-ascii?Q?dSYtsS6ubusmFtpo156QkduZZkokMyIH4Z8M+fjS9VFXMCfQMvC62AJ26SAa?=
 =?us-ascii?Q?6E3RAdPDbrdz3E3rQZHRxaILdAO7eiu+ISwkpw/zpTvxwJBT8uH3eMbhxJIH?=
 =?us-ascii?Q?9dfQWGFGa81E8po9tmyPWeUselkwwXTeslAkBChaUALAausItq4x2ylCA/2U?=
 =?us-ascii?Q?jLmTgQGtFghBGq6QFc2ojIFeL51zDBZeBmURhKnWgJkD7Nv+vVMOCeK7FSA5?=
 =?us-ascii?Q?N3MUj+8Ev151uLh9rHglG9GUuRTQFORnppGyGQ4Lzom4Qg5RYycQEtkev1Co?=
 =?us-ascii?Q?yd8UhK3/mdSskYxw6gNUvdj88NRn1FN+baC6VP2Jn2L7xY0rk/2oellIB06e?=
 =?us-ascii?Q?NU2OH+NQ5E+h3JqQQrVoTeFJe8jt2Qtj0iCFZKhdSa5H9HayGryYCgmIdQb2?=
 =?us-ascii?Q?JpoIt9r4CCUDD+wHEI3tK4c0tRRejTwfnjJmguZj6yd1ma45+BKzCtEit9mJ?=
 =?us-ascii?Q?+X1Ea7icv83QaVPgiMFJUz5JHL47RJc568np8gJ0IdOaRtW7gAyMAEr5IEdW?=
 =?us-ascii?Q?awF8PVR1degqNjmgm5JLrs560xHwO2IRr3dxkCmuCo31OYrCnll8uepcAaA3?=
 =?us-ascii?Q?R0DJAFJjJ3PBrex6bJ+BrvJifUaAoEKwTvgS/q5Qr/12hfvWbaKQOkwtXvxJ?=
 =?us-ascii?Q?FLOgIUCs9tPgP5RvrrL45loQeLQ89WFlU6MlI1+APiIbRCiwsxb2qj9HCGSf?=
 =?us-ascii?Q?GlIUPdyuaOUT2trGNTxkTJqk58z2JVB7lyICniJiRS9vuWnZC25ksQPeQYgB?=
 =?us-ascii?Q?sDzRWlAEgqOwFzibcOkdFhI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eac4f4f4-8412-488d-c16d-08db60a7cd00
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 00:50:01.9160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Xdn8d4CAXD3rrfQucPem1ESFwwijmitPgHGcj99nh1/fxPGn/kBzhUam5a2c98oS6jgsjBHDaunjfPpPj/Qi0QpILuA1lU/kYzSM9ni+6mYizeRH33dKSVQlBp0glJld
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11502
Message-ID-Hash: ODY2WIYPN5HUVIPMFOKYFLU27GRDZGVT
X-Message-ID-Hash: ODY2WIYPN5HUVIPMFOKYFLU27GRDZGVT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ODY2WIYPN5HUVIPMFOKYFLU27GRDZGVT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) returns number of substreams for
playback/capture (B).

(A)	static int soc_get_playback_capture(...,
(B)					int *playback, int *capture)
	{
		...
		for_each_xxx(...) {
			if (xxx)
				return -EINVAL;
=>			*playback = 1;
			...
=>			*capture = 1;
			...
		}
		...
	}

But, it is directly updating playback/capture which is the result of this
function even though it might be error. It should be updated in case of
succeed only. This patch updates it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 47da3be0ff46..b3d569e7ba61 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2733,6 +2733,8 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai;
+	int has_playback = 0;
+	int has_capture  = 0;
 	int i;
 
 	if (dai_link->dynamic && dai_link->num_cpus > 1) {
@@ -2748,11 +2750,11 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 
 			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					*playback = 1;
+					has_playback = 1;
 					break;
 				}
 			}
-			if (!*playback) {
+			if (!has_playback) {
 				dev_err(rtd->card->dev,
 					"No CPU DAIs support playback for stream %s\n",
 					dai_link->stream_name);
@@ -2764,12 +2766,12 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 
 			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					*capture = 1;
+					has_capture = 1;
 					break;
 				}
 			}
 
-			if (!*capture) {
+			if (!has_capture) {
 				dev_err(rtd->card->dev,
 					"No CPU DAIs support capture for stream %s\n",
 					dai_link->stream_name);
@@ -2798,30 +2800,33 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
 			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-				*playback = 1;
+				has_playback = 1;
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
 			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
-				*capture = 1;
+				has_capture = 1;
 		}
 	}
 
 	if (dai_link->playback_only) {
-		*playback = 1;
-		*capture = 0;
+		has_playback = 1;
+		has_capture = 0;
 	}
 
 	if (dai_link->capture_only) {
-		*playback = 0;
-		*capture = 1;
+		has_playback = 0;
+		has_capture = 1;
 	}
 
-	if (!*playback && !*capture) {
+	if (!has_playback && !has_capture) {
 		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
 			dai_link->stream_name);
 
 		return -EINVAL;
 	}
 
+	*playback = has_playback;
+	*capture  = has_capture;
+
 	return 0;
 }
 
-- 
2.25.1

