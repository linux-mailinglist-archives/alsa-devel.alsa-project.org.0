Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA55989929
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 04:16:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11123EDB;
	Mon, 30 Sep 2024 04:16:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11123EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727662604;
	bh=dWJ9aiL0KPdEdwUWlUtMQzWpBBRw5tjhFlKXxKwqj90=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ERX0br5fQjao4ZnX3WsnwhVDKMEReCuo/ZYmtzMEDxlOnROUssl9OPtlQOdMl6bru
	 ND0ApG+gj2GynLSqgLpZiGUcPVMFQyGRY+D4TPX1zTJHDmOYbTDIMUMndI1acPD0fh
	 P1Ut0Yj2MH6SOUfhI957AX6w8OdaBGLHAGxksYMw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF230F806D9; Mon, 30 Sep 2024 04:14:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 742AEF806D7;
	Mon, 30 Sep 2024 04:14:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD97DF805AF; Mon, 30 Sep 2024 04:14:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 410BDF806A2
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 04:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 410BDF806A2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=EVqcHncG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxAMmiCY0gXeqcOMvnNwB7QmlekqKFmg8wKOckyp7qcCaUnMeEK70LiD50d69IbsIE9l3M3r5XxqVlM7n3EkiJ+DdgPmq3e6ywMqrNJzP/3Srqhf6hWO9Y0anoJiswUaTqFqcjxpLJ6W0l8xxKOnTEJ2KbNjbW+6TBnY8Fdju8eKvyOy0zrAUaGsph9kzsZfRoYAF0NOy70pxmBs3a3pYAqGtwuzzbqi41OEA88CAUitMZZAF7I+HKBLLcFdnz7/ij+y8+e98wx7K8DUUTwzp1yfdzu3yIEwuLJ0Pr9nlmzwpCv9WbdQSaFZIjAwxWst1aGcWgbZOhxEPHG+BT+YUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipWWxJjMu/EVkBUzGA8d5t1ousLvweYqHA9t/geTqS8=;
 b=e1quLcm7Bx6H7lY0w8BgV/xBIQe5cvAFontL+FnaLZ1QbvZjAdcRTUSCxbr1WiQl4eX9V8Ies9bUoKHWwXK+nQkKkDOEYbd3vKSAOyuFIDxv4w1CD+7pwcv56edSEdPEJKlw3HAcKeR3T37In1I3umB8oPfSiOVgnu70wB6IuGUTi7N0EVCgqNaFgHOWORJibUquTs4fA6FiTxcpYeik4TfpXwQS8hH31TR0AwEAyaQGmyuIDZhBVbrjSPI1JCUuMxK2P4zKzGuR0RQKuG6nGxVvtYaGmWbOfYsRZWHellPnqiWuuuZ3rPPXEdTR5hs5VTnTgU4AD6V6YEx1WnSAMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipWWxJjMu/EVkBUzGA8d5t1ousLvweYqHA9t/geTqS8=;
 b=EVqcHncGO1bQd8JGDGS0r4KU1H0SzV7H5iyJd+Qp5qbvS7w9gamCAIXNiOyX5Kxv1nBTAYu6jVvikDeGaEwtIsJVEs+7dWS+NdoT/vURI3V5MSwjvB3ZzyMJxkw66JBiD6CSPpkThvp7xfEuytWlKqA2zV71MW7KC4yF8M+Fc6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5798.jpnprd01.prod.outlook.com
 (2603:1096:604:c3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 02:14:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 02:14:23 +0000
Message-ID: <87frphlwg0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 08/13] ASoC: soc-compress: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 30 Sep 2024 02:14:23 +0000
X-ClientProxiedBy: TYAPR01CA0183.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: c941dc0c-bd24-487f-4983-08dce0f599ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2rTs2LJOglhJRWbbOa87zeJWXCXv5ogbqRM/V9RgvQphI0PiQne5MGvAEaQu?=
 =?us-ascii?Q?51+7myemEx4FDr1inVLnbPJ1VEao5MwIE0xPYrHxCk4Jkv9fS/3ZFyOhmcC4?=
 =?us-ascii?Q?GAn8t0v9/BpqNgcMED7Ovcwqv1UMEnt9+bshrRy+OaB4BuELo0L258+rePa7?=
 =?us-ascii?Q?N02ppb65vHg0fTeIQ65BcI2x33CXO4oHqhnhOWBuwreJKoCh8K2JWz0qhw/9?=
 =?us-ascii?Q?nCkG7Vfo8mLrVSqM7WvVNUttXZ7unmBAEk60slcOK2m8DQAA9vR8N1iTKr3Z?=
 =?us-ascii?Q?b7B9UCW2m5PIQ4W2mDmFhxf1mvrpTP8IT4siY65gU6zne1o1ClEJBgm29waj?=
 =?us-ascii?Q?nmSwXN8WLa12ycChXttf90QCJitvu8+iTStFXG6ox8rtrZWEUg/Wvq4XgW6L?=
 =?us-ascii?Q?c+w4bnbMllOFPA05x5nHVLvnXi5o3x+zK5GAu1tPtQiekElkobdRux7Xw0Qr?=
 =?us-ascii?Q?+z5Eyw+Hh7TCFKo/BfxOLIPU3LnlixmLczMEGwEr+sEKofds59jYuqPGMOWB?=
 =?us-ascii?Q?X/xlDgBjs1C9seYkaaA+zQYiqWlZx6XWof36m/DYIDTqHWxk89NC3Nyuv1iA?=
 =?us-ascii?Q?jR+NPj/P2lRkliEZBgDsudXmNO8CxBxjNQO1viCop2Vu4LJ/oq/0iF+8x7xu?=
 =?us-ascii?Q?0OLZegSZ/+zilDoryHghP0R73436pD2OF6whBIKR/Z1np5dIEKsjq2gLf1H8?=
 =?us-ascii?Q?3pp7Ylirj00q7iv8IeuEueF4+YemvfbGENuySwTu+/T30OIarV26niZ/tao4?=
 =?us-ascii?Q?zXdxYzUmmsYgZWaEG4db7GZPOSzSM1ybI/Bi+omf8+9YJ6N5ZnNilTIFLh2/?=
 =?us-ascii?Q?7zAlRk2e0lTgSjAn3iQ/745WXMIMxzX+h95yuoeaJdpSJdGrmS+jtvb2fLi9?=
 =?us-ascii?Q?X+11x4gsv9AwHcUTRsDwGD6VqYzV0+742xHXDCJUaCRXxhFECGGjqVf0AOYn?=
 =?us-ascii?Q?ax0etQ0XQY+6mJNXaPTShb3wPygW9Z6GIrjTQJzsSRm8PRbUMRf/heQesMJb?=
 =?us-ascii?Q?WspPEgY82T0LhJhZL+H4+hZSKu+q8eVC6HNV3j7AqxlpA2tb13cArKDzKQFq?=
 =?us-ascii?Q?hNEAf0Nd7UUVe45qr3hbAKj/pLMdrq1KSdg5UvRqD67lAj/EaTzWlOKjz+43?=
 =?us-ascii?Q?gqDNSZbGfUv3zo07IimQICYQ6TD59sTKfBZABt82mdWnt4wjOLTvp0giW2ht?=
 =?us-ascii?Q?L0RkeOhKCwT2CmNn79bm7teysNeqgfgN6OD6fun8yYCdQr5HSKpktX9vTfwN?=
 =?us-ascii?Q?7C4Yrb4A5Q/YEdYjXH1RJQ3zqS0vv2VHnRnSW7XoEZL6OhZc7blPeyPmPEoS?=
 =?us-ascii?Q?Zdv0gLlU5EmRi0mB00fmWX0VPrSEGAS4lVN1X17SNCFfXvmfvcKuVZaO+pap?=
 =?us-ascii?Q?2g4bI3D59fZN7AkWpDUf1NC4TwSvDNOsAEIYekcBLcepqWnVcQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SKLYjVkAlj73BLEcvWm/G9R98cj/Rt5O0pbBge4x2ec5FzkVnPmthFHmIk5v?=
 =?us-ascii?Q?cGQyrnslMT88gJ3IbliogaQYFF6apIh2G3BGxhyvB2R5BTYSZkKS8BmF64Nc?=
 =?us-ascii?Q?r+SKCWoTsLYYEQJRLEp2ot3OxCnQXop6uHp57eCSjN0DUdcIK6pAIzQcX1B1?=
 =?us-ascii?Q?WKGCZ02ndkjTOrScFzNqB+0MY7n1P7ppxEksmEJbMMAWdiorKx2TUieaCbxU?=
 =?us-ascii?Q?DK768HJkkjKjdp4V9d26xxLmQ287NcHesViRGVLs1q+9mx1HBIuz7d5Y2QQz?=
 =?us-ascii?Q?yVZpfgHvUtyi4l5Jw5JRZl0VetZPNevzrlosqToEl6bNR+MdT6o/cn6+wdKQ?=
 =?us-ascii?Q?bNc72xOzodxR48RTHGorAGcxQBKMMXyY+r912/cxCnArgJXHl5MgxsPvZJUf?=
 =?us-ascii?Q?hHyS7IsHneyWXPiFcuRzb8GAaN3vyDxSngp3EFVtBwPvRHVrcq9SF97G9Ef0?=
 =?us-ascii?Q?Hwx3XPFZhXUxHPa0mV3WLaZfX2tPMgUOamZAPPgE+03W6jbY2rTv8NQRDUNy?=
 =?us-ascii?Q?OnC04FVerf6s18UXCsqqBqZGiFl3rou7w0oZYBUrLfH2eP95QM/XGB4UIbVD?=
 =?us-ascii?Q?k+8dnY5SQ8pwHRSorQesCx2d+TLSBwlU5Q/7OWmpHVLjGmFkPSI4TM3PertX?=
 =?us-ascii?Q?CLimVxj0DslAaPA/cdCIfJMQCLgq+isDDX0Vpj0A0Wl/grrH97hvVA2T051O?=
 =?us-ascii?Q?OCNeZuIZlX3vff2d8UIezQTdxDPwpDi6VPfALjn7gtjAnxoxRaTjExweda0m?=
 =?us-ascii?Q?87hdkXKEHeBCOFhyrBATy1Ou61HAoDZ3ZpVIX1VLfirQtB6QZaLGRY1LGL9P?=
 =?us-ascii?Q?xyAGglDSWnWkUSqFlf1+URAcut+Gsmi72WvvbRHh50WbcO8FoXTQMFQuodhY?=
 =?us-ascii?Q?QhCSSz2vXJdSBhACkbt7ajQjTRXlxVDnrIN5XhfGo3HzEy1MjEx7Z9ShbAdX?=
 =?us-ascii?Q?xjc/xqgQQRkdt6y/OAm9zk9Fk4RFJKdlmPB7yDKqma8FOO50rXIcYv0Oo4sw?=
 =?us-ascii?Q?dGZATpJtq9zR+Ajc0b/ItJ2+y0/41AuYwCgD50EVMmSdPN1+5FqpXSNGCskN?=
 =?us-ascii?Q?p7LeKqUsbXPin+fJT1NFMBLp1FUjnBgWUN4uODu8Ov/Zsqkb6OnMRyT9/1yG?=
 =?us-ascii?Q?TncaMQPPjvEnSDak50zjgli5E6kLVukZAMi8Jx3b/9ibotHOvvcjNZzuulFl?=
 =?us-ascii?Q?9nUwrzsCTT1V2Fjr7aGswWTRFvlX0xQwaLDyFc1CMXBUjjdFZYpRNRDsDPRf?=
 =?us-ascii?Q?MkhGWSKMKWBpAuLxlWkPYYV9tV8Net1/zwFawSBqiec89B6ZXZ5KFPqh92y9?=
 =?us-ascii?Q?3iyAb+WnkNyW2TKZVfO1vmq6BZHBC6eXJ8Z9qSggq9nQuobTbkR/w5MJbbJd?=
 =?us-ascii?Q?eeB0O1W74Xpkp5gq2sdlq8jNLNj+EhionFwtTZWfyfAfIdZWQ1TlFdmI1ruq?=
 =?us-ascii?Q?DnIiauoUSzlxhxDBco71iU08Os0FxGoG1QPmDYBL8U9oSgSRjxTlzeKFdPBb?=
 =?us-ascii?Q?g360ruwjzy11/wyBF3iDKyiS7t1fl1woZS3pMa2Tu8AMmRwdNfJpmsUKQ2Fu?=
 =?us-ascii?Q?KXnc9s1dwwSX3OuLpev0gKNa0U+XzhdReRCLlnEWsWZcka/QSmTjT+Wko/SH?=
 =?us-ascii?Q?JAmir2j8/TZ4ozt/xX/touo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c941dc0c-bd24-487f-4983-08dce0f599ee
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 02:14:23.4739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fQouuIo0/RBZZstcJ3SrTxjU9usiQS/FKjoag7DccP+BiukAIL/PmWoH9Oxofg75wcDXYSdwvFBUZGZRbBc2kkEUtur1yvjabLy4UiClURRTJLel5hHBshF/oHPhmZwG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5798
Message-ID-Hash: KZQ52IO4G7F2YIJD7KS3NNMUAMMBJABI
X-Message-ID-Hash: KZQ52IO4G7F2YIJD7KS3NNMUAMMBJABI
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZQ52IO4G7F2YIJD7KS3NNMUAMMBJABI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-compress.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index e692aa3b8b22f..a0c55246f424b 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -606,12 +606,19 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 		return -ENOMEM;
 
 	if (rtd->dai_link->dynamic) {
+		int playback = 1;
+		int capture  = 1;
+
+		if (rtd->dai_link->capture_only)
+			playback = 0;
+		if (rtd->dai_link->playback_only)
+			capture = 0;
+
 		snprintf(new_name, sizeof(new_name), "(%s)",
 			rtd->dai_link->stream_name);
 
 		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, num,
-				rtd->dai_link->dpcm_playback,
-				rtd->dai_link->dpcm_capture, &be_pcm);
+				playback, capture, &be_pcm);
 		if (ret < 0) {
 			dev_err(rtd->card->dev,
 				"Compress ASoC: can't create compressed for %s: %d\n",
@@ -624,9 +631,9 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 
 		rtd->pcm = be_pcm;
 		rtd->fe_compr = 1;
-		if (rtd->dai_link->dpcm_playback)
+		if (playback)
 			be_pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
-		if (rtd->dai_link->dpcm_capture)
+		if (capture)
 			be_pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->private_data = rtd;
 		memcpy(compr->ops, &soc_compr_dyn_ops, sizeof(soc_compr_dyn_ops));
 	} else {
-- 
2.43.0

