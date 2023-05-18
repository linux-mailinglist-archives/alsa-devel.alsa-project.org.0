Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CE37079CD
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:49:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCE43208;
	Thu, 18 May 2023 07:48:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCE43208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684388940;
	bh=f9t7pQvIAvG5diIuB3H71jbef+GhX+JHpo5wnTz5Awg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LExaAkOFkJm5f/c5hTr8rS1f8XHH1SabJsJhHcHSXzE97cUhtHlN3nOMOnvyaQr45
	 nUFMR21H0R6GdAVxMWt1SsA1dhW2JM6J3aY+S385lPO69b3cYDgHvcqFYQtwLLbLp3
	 M1WKCJW+qNxrrCSZUw011LYnbISSVQlStqgageWU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5039F805A9; Thu, 18 May 2023 07:47:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65B77F80272;
	Thu, 18 May 2023 07:47:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6416F805A8; Thu, 18 May 2023 07:47:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::708])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61609F80568
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61609F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=gagUnPBX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6mRZBkM9okLJsku2rA/dK4kmsOmZulpW03/y+Jma9g7w1ktiBreQGv/KZV1eIvt7ZiGZabCPWxneclerppD3CiNDHLao9ksaOb+UHzhBVaqM18TR767ZAmAEavG4AY9iiU0/Nxnrxo2zphwuZIEQvE69NlcGxMj2bvS2Z9hx2u/x5Kw6+HT+FAK9pz/9R22I6V4styPqNhTwCUuk9trGysbyViEytadj3VNowKKHgjLhqfBouuxCqkTPgSDUS1uHLEQQKvXb5MeSe19zz3Pb+VREF/1ox4waf6fw/Wuf6PoJM3AbmtOqZPh6niQmHwzDewHTrrMQ7dvz6WaASSGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULj13shoB+QHIfl0JEO9eMZ9W4jdjGLeAGLTOaLQuh0=;
 b=Hq9qJRUiuYwbaSK3EZJGPuYZIY0z9hExvbp0kuw1O3tgtvXBcU5YrQUwMBIFj48DQtmcAor5WkF21sSripUbub7zesmy28+ySh93H9bbnIcMnv60sTXpvaN4A3zx4yVANR3306CBsjo97ycz5EGLQsUV7Qs8POFCg5p8PCCMhdKZUZhasLmkYLBBVreyy3QnI1cf3ifdZneUftJdQ+HwZBCUp1BMgOlYh3Jw2I0qtJXRlxutD4Xy7W9wCCa3/lHe1mq4y0ozkPc96v2Ui1GEdC7vqJqJ13aWmG9VlJtHzOJrqBGGyM6HjX/WHG1yXiKcSqWT+dW9d7JSQbkFDL2lYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULj13shoB+QHIfl0JEO9eMZ9W4jdjGLeAGLTOaLQuh0=;
 b=gagUnPBXGRv75QwrsCeXXlGcMaiUUoUTZIY9SOu6iSCV9HPOCJRy84eq7A2rI1+JQuatafcXpbuKBWBnri7Zjrw8li/bjKaFulYFtOOnE9yCTJr2AS3lltcQG8Q55TF08C/OZk9C+KV/pKMOlGaulFxE1ptEsWXtehdD1S9XLY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5591.jpnprd01.prod.outlook.com (2603:1096:604:b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 05:47:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:47:04 +0000
Message-ID: <87wn16p4x4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/20] ASoC: soc-pcm.c: use temporary variable at
 soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:47:03 +0000
X-ClientProxiedBy: TYCP286CA0176.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a334975-29e6-4f3d-4073-08db57634ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YAwRe0sAoiWKQA+TnAyAF2XRRjt5N2xWBX/66W786W7sE7aU1sSkNt/0/JraFjyE06xunGcLoXEYU+KnpZfXkbsrZFkNU3R7pibMyIG8dwswdTM6cjDqJnZKJ9Wcu759l7Lh2QT4vGodUADGq29hLt7djkdaBjx/WFvOz6d48+rgMf2rMz4NNI6Q1CoHrIL+5QBcsT90Tbk9aLc/bGwaVRKCM67LtSlmI4O/t17eYbb0dGUl43DLEOmvEsearrjPbb7dyq0cP7S5rzqJrCj8ifZU4tM/zwVmBw2ZM3KoyQHtpCkM6u5WdaWPSryVPz2YaaZUm+6QARetQk2FeJ4aMZHUNYQiUHN2yToXrW5CU+jG1rNa3cObfuPfQxzgnCSrgXSZmYQRNGv0qj65ITD1z1/ffN4ZKe5gHHB0J3DoRDNTb5j/1raXd+CHwX63ND9r2sjWIRTtqMTQxRIggt5UU0TtIKx+pH3NglOz1hwMAOXIQgebTjdNPNtfxX5Zx3bUu39g8Z/s0tdHZA4I+6cm1qEapCcskUaxve9F6SvrzbbxiHxxyTbbh1h3YxoXfOTM5dlhquAIW/QD2snUXtXlS2/EuG1OKmxJ+2qawc3Ez5j1Uk3VinHWNWsHy1wDx/ozY1FebXvaFcdENp1cGpn5aw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(316002)(4326008)(66946007)(66556008)(478600001)(66476007)(52116002)(110136005)(86362001)(36756003)(83380400001)(6506007)(26005)(6512007)(186003)(2616005)(41300700001)(6486002)(5660300002)(8676002)(8936002)(2906002)(38100700002)(38350700002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YFj2KAQ2B7Y6Q4dj6uXWYTYUaMRr+lIWGy3m4GsKNEFDALSbs4HdDjMUApbb?=
 =?us-ascii?Q?J71mSfllZdzG4i27s9wSZFzwyvznHvmJlvjT1SNtyDwAvgSKjVzNIfw7O58V?=
 =?us-ascii?Q?iO+hngDFNCz60kOsLNxqdLYIXbPi5WzwtAIyUmDKhpR5KAlaCJ4JOxuM8S5K?=
 =?us-ascii?Q?nm40OUaBg2kiNrWwtRB7U+aiiH0aJemrxEw09BIRQDsigF0VDlb1lKsdH2iW?=
 =?us-ascii?Q?Fw1slMzOjJ/Ah2UtSjS8NXQOrCIdFSkhnryo4SR4nlF5omaPi8Qfa9p45L5v?=
 =?us-ascii?Q?rA2aMcVprIPZo1BN00SrJv8ooWAzM0Zh0qN19yw9+0n6V9hDyAwrxVk4l6Q7?=
 =?us-ascii?Q?TPBMJjpcqpj6zrqg1qiO6ytaFy8yGthcdvH2P3cAfcps+jz9Ig23BNUI5d4q?=
 =?us-ascii?Q?kyuLEyQaN4+8M8Dtj6Hrk65rMPjlzcQ+8CGr4Q3EhYAbmtTyPJa+biUGljv/?=
 =?us-ascii?Q?iLWQUggferjapfSrkn/bUuznsbD7bgz8G5GLFPVIl5KTGr31+3ofYTCRqQrD?=
 =?us-ascii?Q?k/z9QeB1nAdhtrvSFyVkHxSHC43zlOqfrwBkh0Xwq+awMm5fTMpmziPVH8/o?=
 =?us-ascii?Q?CQAV38t+h8QcZLMzsTS8RgeA/xoBmixXfn9Z6aXzYa5juYFvpLtlekZfOPGZ?=
 =?us-ascii?Q?ZvKlV1j3JSVDZNatDYBKRGB++RiFrmvdaaeKt7v/TBt8ER44jU/f/nc11NFr?=
 =?us-ascii?Q?pvly4uK49NzbZdD6+rZnsQ2TbSYms964PKQdpRdLRgG1e9WLGLdYrrAL+ylv?=
 =?us-ascii?Q?r5TzH3cJ93TduZ+3ucFJuK1FBgtrSxZWc150qulV1rQClLYgWhImZdHLayvP?=
 =?us-ascii?Q?j/DgFv94vuYcL0jGpkV7YU3z7amEg8j0vVHwJJ+KYGTy6FSVYKKwYcqDMRhd?=
 =?us-ascii?Q?Ay6RzSNnCWmdzBQ3bIDvWq+b0QO3Jp1yCezbMrpjQ8x6sIwELdVcqjoy85Kk?=
 =?us-ascii?Q?0m0BXWEeP8GuwylmT0y9AtS1WxRWUaWYX+V4L2zbr7shs9iDup9pNhTbIdCz?=
 =?us-ascii?Q?J9XT9duTKKDQTFjetFkES82NCyKJLB0NLgZy+uDWRQTY9rOLwI1dPBSo0nsy?=
 =?us-ascii?Q?OwQIhWuYkRdN4V8BTH6J+nfl2ePW6iXmy7qTqoAnvdAS1VmBtlW7eI6usKzH?=
 =?us-ascii?Q?PbMjkD4A35JFnrhU7aKVj/QLA56N/BXHyxLlmaO5kJ2lZxMJEh31crsPER66?=
 =?us-ascii?Q?x463UBbVI3p1o13JroEhBZr3pf3A1B10zqNKtFHJylXjOsTUARlWa+0UkPua?=
 =?us-ascii?Q?LN0lecmvzKclyvRpuRDluEklP88ZRt29kRlaM9ghE6QnOG1JspAehp1/bJfN?=
 =?us-ascii?Q?VdnLKjTxd1xnOxd1BrlMnUphHLwbo/2c/y+rYzUDPnjnoLUpn2haGJWsuUp6?=
 =?us-ascii?Q?MuSxpvNjM1FDq/PyKhU55EOXzXORivkqpwmkaOpOzA0KmC+3nclMCtqjMoMB?=
 =?us-ascii?Q?5JbmUTeemG4B1nh8RjyeUiY5y/wO56sFRubYU6IxxWaPh1o21WGO1++brwdw?=
 =?us-ascii?Q?OM0ljCAx+eeAm9ClhPKPz2y8XSYnvXwtdkvVv/QC3HSMaN+IDkh4UqaLkZqw?=
 =?us-ascii?Q?tpVcrYfCq9D+cUPpVjxCvp9PNypoLswzPC+odS6Cs0Nz50R0TDdiLD8L4i3W?=
 =?us-ascii?Q?q87GTpGnyJWooqyl23ot6Xw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6a334975-29e6-4f3d-4073-08db57634ee1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:47:04.0787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PzPL1pJyA4IYQFydHvDPOnxgMnFST7H2vK0gLVWHnHujGshiFnyuwJTwCBAy7lPTfMHhRNIU+oIm/Tv6+UMGlp3PTL0kzXx3A76tkUmGvSWDHOrNPu9s2dmxFmV9kOqm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5591
Message-ID-Hash: SE2GNXLSI3PDD74P7SKXNP7WNYJZ5XJC
X-Message-ID-Hash: SE2GNXLSI3PDD74P7SKXNP7WNYJZ5XJC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SE2GNXLSI3PDD74P7SKXNP7WNYJZ5XJC/>
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
index 47da3be0ff46..c127ab9de61f 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2733,6 +2733,8 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai;
+	int tmp_playback = 0;
+	int tmp_capture  = 0;
 	int i;
 
 	if (dai_link->dynamic && dai_link->num_cpus > 1) {
@@ -2748,11 +2750,11 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 
 			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					*playback = 1;
+					tmp_playback = 1;
 					break;
 				}
 			}
-			if (!*playback) {
+			if (!tmp_playback) {
 				dev_err(rtd->card->dev,
 					"No CPU DAIs support playback for stream %s\n",
 					dai_link->stream_name);
@@ -2764,12 +2766,12 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 
 			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
 				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					*capture = 1;
+					tmp_capture = 1;
 					break;
 				}
 			}
 
-			if (!*capture) {
+			if (!tmp_capture) {
 				dev_err(rtd->card->dev,
 					"No CPU DAIs support capture for stream %s\n",
 					dai_link->stream_name);
@@ -2798,30 +2800,33 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
 			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-				*playback = 1;
+				tmp_playback = 1;
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
 			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
-				*capture = 1;
+				tmp_capture = 1;
 		}
 	}
 
 	if (dai_link->playback_only) {
-		*playback = 1;
-		*capture = 0;
+		tmp_playback = 1;
+		tmp_capture = 0;
 	}
 
 	if (dai_link->capture_only) {
-		*playback = 0;
-		*capture = 1;
+		tmp_playback = 0;
+		tmp_capture = 1;
 	}
 
-	if (!*playback && !*capture) {
+	if (!tmp_playback && !tmp_capture) {
 		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
 			dai_link->stream_name);
 
 		return -EINVAL;
 	}
 
+	*playback = tmp_playback;
+	*capture  = tmp_capture;
+
 	return 0;
 }
 
-- 
2.25.1

