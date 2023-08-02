Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D12476C1CE
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 03:01:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C125593A;
	Wed,  2 Aug 2023 03:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C125593A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690938094;
	bh=RkmO/PPvSq/I9/GU18f2hF+h8DVtGJQTPjqni3Qk6Sg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cT6W4SODyOGJGWW9JGK+KJE+rkmeI1GsbhFfv3cFQW1traQKnDWdBNVIEN4+odMNM
	 UoQ6qGAZh5eEZJtrdKsZi5JFzjEkRoZMuCrcQaA/DVcy1p0Eva8Q1ZPojxbMkdcF+4
	 4Vl9SSZJDchYuc6gvfkZzA+n6YaMlmsS4xbrswaw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52D6AF805A0; Wed,  2 Aug 2023 02:57:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB364F80588;
	Wed,  2 Aug 2023 02:57:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 186BFF805A9; Wed,  2 Aug 2023 02:57:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83507F80544
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83507F80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=TUllrFcI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4FOIIRZFbjWHrPrOcV9H++fxGJdQpIc2mWnMGxhiNInUeZ4qL1169pauOOFNERd+VNkHbxX+9nZIM2FZ7qQ/Gj26FIwWDfMejROXmpvD1lIicwt5ycI23CLIZ7GY9zTE7G2+U4rtXhsY02AbLuCFi3N/dbaCjeaVY9ynQGHkXDuIsNCGXNpFwdAdY008ApYaQ0k6D1eAQ8dT0xxLZUw3ROeBWqiGpnOIxE/Igh7soSbaievWfIe1iu3Uvu/ZLQ23Pbr+SmUpGH+ah3SdnIclUNJGxXvWI0XecYlNtjcOOtl1wXqKTcZxoYF0Bizv3RYL4CTb0TcQXbJrJNMEUvkcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=up1e8zvfZVYET72K1BxMUcVZSIMEu0rdYz7BlRXTx18=;
 b=Y6XIZTZeRsttS/V+heU9O9olXCAilJXYve5FpS8QFpWQtLEDpGfMfMLZF6JuH6Y5BywnT3Q2T5mSqIbstVW+3MG4vEg/djPf2Q8UVp50i9YPbE8BfbfkLb1b5z/EVA7VQiXMD6ExZlYf0E0nngeaZHFGFRCGVQLXpMGGIcHxlqUS0G2UFT9O/W59Z1Nf7f8D8YG/j/vItWMU+Iu2Kj6guSNrrMbU895X/p56oWRCTPFrsUXc4L2UiNhPf3bqCTtBixbR6hXb8Xpb0tLCIzOkBK4MwWZAYLOA209h/EBw4ds167nGpl1DMPEb1FNB1IEsTWyhxQ+XM7R3YrD62ZH3hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=up1e8zvfZVYET72K1BxMUcVZSIMEu0rdYz7BlRXTx18=;
 b=TUllrFcIpUdr4n20YQSyz3/2XKghq85PlMxb9fBSD2igj1Ot5A3we+ZlLHrbWPzpYGREWWqy5oBSJuBEbhw0ZqxGos90TxEmhprM1vHro5W30WkozEt/sC298f/VoEAmHiqvhlbNldrEXW9yquUSdr6qS6AU+jXkA7IpOeaZwPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7797.jpnprd01.prod.outlook.com (2603:1096:400:17b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:57:18 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:57:17 +0000
Message-ID: <874jlitg5u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 29/38] ASoC: uniphier: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:57:17 +0000
X-ClientProxiedBy: TYCP286CA0254.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f852f3d-a6e6-49a0-9d9d-08db92f36b43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	srQe3BuXbci0aBVVO7Fj3wJCYnHAie86gZoIrQHcGClO4GKfC9eyW7iPc8l6E7yQk9NasZIaP4ij5AjzXrrO9RzdYB6WuiAIMNe25Rh0fiajDBhH73KJwm5iVBB2HNHL8bS5DrKf1LvherqyZGDb96YjJqOh7O6icU48Qet3G3DsJWxLQPxwp1H+d+Bss6HxLRKY6jETqYCH8y9GMBNjEaEyZkuksGt5YLri4YJTtIG3oQ8QNyzPR+AOMjjUcPpf7jVYN7BoOJvMYvJTzk/xBzxrIWbPJDYvPuq/czWa75ApMjhKmLGR/tWfc2Tv+kMfNgMwrlYT6ykDbR6vpGBtRpTGNnyO/8JIHhP4xCChfjU6m8hg8co4U1Ah0jUzYca6P6a+U0DJPvdpwz2qAA5DL/LYhLwGtz4ND/uMWaEesoeBJ2DYEpHCeWxut6EZqbvJLoTycOVtazL1jzXGf4lhwEjxDDzyCUTdCzhoKrg/wxsIF15lBwubEqRtIc7vwPMYcJPitM/s/6yWvUPn/RhJKWwH7uJcExYQkrhyx/M13GxoNrAoKebjPiHlX06HHbCOg5jZa0smil6X1WlOLsF4T2fq2o/fjYcK8JQOo1f5/1awg+jsOIKh+qxVUF2kL52V
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(52116002)(6512007)(6486002)(26005)(6506007)(186003)(2616005)(110136005)(478600001)(83380400001)(36756003)(38100700002)(30864003)(2906002)(5660300002)(86362001)(8676002)(8936002)(66556008)(41300700001)(66476007)(66946007)(316002)(38350700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vlS0Omtzm+n3i1vD5fPdzNfSPCk1rYvxoLSmFbFRm0sTBB+9M1tePzqd6QET?=
 =?us-ascii?Q?CyNj9Xpb2+w0jnciEnIWAsEghDXgwq8OdN4exMIAXNyMmzL0i9kaPUr+zYNK?=
 =?us-ascii?Q?xTpWa5RiSNagJNKy2CfYhVQBPBwzk5AzIGIgTnJBIUppIn8i0D7IfZZYQZaL?=
 =?us-ascii?Q?riIdc8tlbys+Deku5OUNtiFq6c6/LnJzPaZOKw6g8kFi8zmW1kLradayliHO?=
 =?us-ascii?Q?u4AEV47t38Ct2nk1KMwxxWFuuPoYws7eheb6ZV8cplGuOvm5/1FZyREtpkw5?=
 =?us-ascii?Q?Rpe9EmXZYohiIqC2qbCEZSUk3ZNxB1A8W7XtfIEIwTXNRPExI78pBcQcHCWk?=
 =?us-ascii?Q?q4m8jhjf5NlB9KsnCFxfgYU1dqQbNX1zHXr1HfgfdrcbJH3sDnk6f0UyKsfz?=
 =?us-ascii?Q?uTceXUQojdB/DONl9uCX6Da8kqjrHXpcZfSanZj8tFMsJpxxcX6Pg0WZdOGA?=
 =?us-ascii?Q?v/nyaUFAYwD4dlkUO52OxlQC1IKpC3cfBsQvMJ+GvqAKfPqcwUzOiiWazCsC?=
 =?us-ascii?Q?uNmasgLId6WNbzwV2g7g+8ItVRsZC/MMhPBBfl3EmtrWtVlWKls4DnqtW+OZ?=
 =?us-ascii?Q?KFzzGlHkfbZ3ifws8gDaKXVTGykRpHBUGoraZr//Q+JlT6aa7O9+/3K/ogev?=
 =?us-ascii?Q?9tCwz6vUYFgNK+kBFjIvwqUUUG79gKfTtkXFd+Azu3r4Qhsm5ZPcpAivdLzs?=
 =?us-ascii?Q?s60Wz+M1tgQgtzViwwnR2Xaz0GlyiSU9umvR4m6+W8nPX3aA3c6+8K/SB6mv?=
 =?us-ascii?Q?QNeCbK+WcQZn701Et+Zgtg3l2bANeBySNOY2oxVW+/ahjJR6KWEdeSNbShqL?=
 =?us-ascii?Q?XdCa4jgYfjbPsks3bHnejAlx27ezNO7Yh+OXqDNB56FW392dB3ETTytBQBLr?=
 =?us-ascii?Q?aOdm7Fy9mYKljiJDcP8L01v8DAZF7Qs1bezqhSHgSz3OGuUztCm5YXnmY9qb?=
 =?us-ascii?Q?jxxPF01QW+gQ2yH+1KVDTQ8bK8CKUe+Xs3TVgeAtrGIR1Xafauk94U6vZD0n?=
 =?us-ascii?Q?tqq7vmfnjbOtb4xQ0sKwaTWT3DLoA4/PjWZbcGAEDO7pIwWEzo01D/hSxyBb?=
 =?us-ascii?Q?mYLyXXa2LNQWwJTVK1zS8XoIpqvSM+pFh3B3CwHuY7nIgxZQyclkTdiZprJG?=
 =?us-ascii?Q?UpVeXK9y7wUk2VLTr7k2+WK3M52YTcmWDLCXwNoHp1wO6CdtbgIdKGXggQdV?=
 =?us-ascii?Q?VQxl0yF1kvEmYLq6AYpkqABB2ykf5hmj6Bo8b/l/VNDiq7Rk4+E1T+T0GdiZ?=
 =?us-ascii?Q?+cpbzGmCgtCauQwvOPGkmIw4sx4/nJlYul8N4ppzO7sWrzGRTqqrpxWjRK8U?=
 =?us-ascii?Q?wCUqYaQpHb36mME2QyUk5OILfW9xi6rlhllLltO1fpUojdBddP8RkyzAeCRW?=
 =?us-ascii?Q?YfIVNJttRJGjzDitECI3ixrRhW6bLSGs6UtDwRk6P/kilyTEbpJvX761+S/w?=
 =?us-ascii?Q?sQw1r1kGsSho0DNdPpy1zztFiS6r6sOSVUvTYgb1ARM7wZFF/Me1PvYc1h9Q?=
 =?us-ascii?Q?oJNqRpAvlL8MpckfExMbeHb+z9YrEUVxpAbjgQMwuxGFATEpswrXtAPTGwg8?=
 =?us-ascii?Q?wbqqYJQPZMfL5dzmOVUinZqXuj1DbCU4D0U74u31rhPIxH1XVoplrZLCeAl6?=
 =?us-ascii?Q?QUeUnBLelK2gh2QcmXmrSoU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7f852f3d-a6e6-49a0-9d9d-08db92f36b43
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:57:17.8816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 sf6sRErtOd8xCrRgjSjnFZ5hnD1dIakpLnYV3hRn0/0eUUy4xoMp7tHjn0JJJ1RXCtDaMM59x8euQcgKr/EmszRXFlhec53GWrjXX3pbIWNl1H0a9NaTiUBRlMpJuK8S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7797
Message-ID-Hash: UVIIOALXR5M5CPS4PZO2TMJDL7SCB6HI
X-Message-ID-Hash: UVIIOALXR5M5CPS4PZO2TMJDL7SCB6HI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UVIIOALXR5M5CPS4PZO2TMJDL7SCB6HI/>
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
 sound/soc/uniphier/aio-cpu.c  | 161 ++++++++++++++++++++++++++++------
 sound/soc/uniphier/aio-ld11.c |  62 ++-----------
 sound/soc/uniphier/aio-pxs2.c |  55 ++----------
 sound/soc/uniphier/aio.h      |  10 ++-
 4 files changed, 156 insertions(+), 132 deletions(-)

diff --git a/sound/soc/uniphier/aio-cpu.c b/sound/soc/uniphier/aio-cpu.c
index 4e8d5f7532ba..7c5188477b7c 100644
--- a/sound/soc/uniphier/aio-cpu.c
+++ b/sound/soc/uniphier/aio-cpu.c
@@ -355,30 +355,7 @@ static int uniphier_aio_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-const struct snd_soc_dai_ops uniphier_aio_i2s_ops = {
-	.set_sysclk  = uniphier_aio_set_sysclk,
-	.set_pll     = uniphier_aio_set_pll,
-	.set_fmt     = uniphier_aio_set_fmt,
-	.startup     = uniphier_aio_startup,
-	.shutdown    = uniphier_aio_shutdown,
-	.hw_params   = uniphier_aio_hw_params,
-	.hw_free     = uniphier_aio_hw_free,
-	.prepare     = uniphier_aio_prepare,
-};
-EXPORT_SYMBOL_GPL(uniphier_aio_i2s_ops);
-
-const struct snd_soc_dai_ops uniphier_aio_spdif_ops = {
-	.set_sysclk  = uniphier_aio_set_sysclk,
-	.set_pll     = uniphier_aio_set_pll,
-	.startup     = uniphier_aio_startup,
-	.shutdown    = uniphier_aio_shutdown,
-	.hw_params   = uniphier_aio_hw_params,
-	.hw_free     = uniphier_aio_hw_free,
-	.prepare     = uniphier_aio_prepare,
-};
-EXPORT_SYMBOL_GPL(uniphier_aio_spdif_ops);
-
-int uniphier_aio_dai_probe(struct snd_soc_dai *dai)
+static int uniphier_aio_dai_probe(struct snd_soc_dai *dai)
 {
 	struct uniphier_aio *aio = uniphier_priv(dai);
 	int i;
@@ -403,9 +380,8 @@ int uniphier_aio_dai_probe(struct snd_soc_dai *dai)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(uniphier_aio_dai_probe);
 
-int uniphier_aio_dai_remove(struct snd_soc_dai *dai)
+static int uniphier_aio_dai_remove(struct snd_soc_dai *dai)
 {
 	struct uniphier_aio *aio = uniphier_priv(dai);
 
@@ -413,7 +389,138 @@ int uniphier_aio_dai_remove(struct snd_soc_dai *dai)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(uniphier_aio_dai_remove);
+
+static int uniphier_aio_ld11_probe(struct snd_soc_dai *dai)
+{
+	int ret;
+
+	ret = uniphier_aio_dai_probe(dai);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_dai_set_pll(dai, AUD_PLL_A1, 0, 0, 36864000);
+	if (ret < 0)
+		return ret;
+	ret = snd_soc_dai_set_pll(dai, AUD_PLL_F1, 0, 0, 36864000);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_dai_set_pll(dai, AUD_PLL_A2, 0, 0, 33868800);
+	if (ret < 0)
+		return ret;
+	ret = snd_soc_dai_set_pll(dai, AUD_PLL_F2, 0, 0, 33868800);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int uniphier_aio_pxs2_probe(struct snd_soc_dai *dai)
+{
+	int ret;
+
+	ret = uniphier_aio_dai_probe(dai);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_dai_set_pll(dai, AUD_PLL_A1, 0, 0, 36864000);
+	if (ret < 0)
+		return ret;
+	ret = snd_soc_dai_set_pll(dai, AUD_PLL_F1, 0, 0, 36864000);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_soc_dai_set_pll(dai, AUD_PLL_A2, 0, 0, 33868800);
+	if (ret < 0)
+		return ret;
+	ret = snd_soc_dai_set_pll(dai, AUD_PLL_F2, 0, 0, 33868800);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+const struct snd_soc_dai_ops uniphier_aio_i2s_ld11_ops = {
+	.probe		= uniphier_aio_ld11_probe,
+	.remove		= uniphier_aio_dai_remove,
+	.set_sysclk	= uniphier_aio_set_sysclk,
+	.set_pll	= uniphier_aio_set_pll,
+	.set_fmt	= uniphier_aio_set_fmt,
+	.startup	= uniphier_aio_startup,
+	.shutdown	= uniphier_aio_shutdown,
+	.hw_params	= uniphier_aio_hw_params,
+	.hw_free	= uniphier_aio_hw_free,
+	.prepare	= uniphier_aio_prepare,
+};
+EXPORT_SYMBOL_GPL(uniphier_aio_i2s_ld11_ops);
+
+const struct snd_soc_dai_ops uniphier_aio_spdif_ld11_ops = {
+	.probe		= uniphier_aio_ld11_probe,
+	.remove		= uniphier_aio_dai_remove,
+	.set_sysclk	= uniphier_aio_set_sysclk,
+	.set_pll	= uniphier_aio_set_pll,
+	.startup	= uniphier_aio_startup,
+	.shutdown	= uniphier_aio_shutdown,
+	.hw_params	= uniphier_aio_hw_params,
+	.hw_free	= uniphier_aio_hw_free,
+	.prepare	= uniphier_aio_prepare,
+};
+EXPORT_SYMBOL_GPL(uniphier_aio_spdif_ld11_ops);
+
+const struct snd_soc_dai_ops uniphier_aio_spdif_ld11_ops2 = {
+	.probe		= uniphier_aio_ld11_probe,
+	.remove		= uniphier_aio_dai_remove,
+	.set_sysclk	= uniphier_aio_set_sysclk,
+	.set_pll	= uniphier_aio_set_pll,
+	.startup	= uniphier_aio_startup,
+	.shutdown	= uniphier_aio_shutdown,
+	.hw_params	= uniphier_aio_hw_params,
+	.hw_free	= uniphier_aio_hw_free,
+	.prepare	= uniphier_aio_prepare,
+	.compress_new	= snd_soc_new_compress,
+};
+EXPORT_SYMBOL_GPL(uniphier_aio_spdif_ld11_ops2);
+
+const struct snd_soc_dai_ops uniphier_aio_i2s_pxs2_ops = {
+	.probe		= uniphier_aio_pxs2_probe,
+	.remove		= uniphier_aio_dai_remove,
+	.set_sysclk	= uniphier_aio_set_sysclk,
+	.set_pll	= uniphier_aio_set_pll,
+	.set_fmt	= uniphier_aio_set_fmt,
+	.startup	= uniphier_aio_startup,
+	.shutdown	= uniphier_aio_shutdown,
+	.hw_params	= uniphier_aio_hw_params,
+	.hw_free	= uniphier_aio_hw_free,
+	.prepare	= uniphier_aio_prepare,
+};
+EXPORT_SYMBOL_GPL(uniphier_aio_i2s_pxs2_ops);
+
+const struct snd_soc_dai_ops uniphier_aio_spdif_pxs2_ops = {
+	.probe		= uniphier_aio_pxs2_probe,
+	.remove		= uniphier_aio_dai_remove,
+	.set_sysclk	= uniphier_aio_set_sysclk,
+	.set_pll	= uniphier_aio_set_pll,
+	.startup	= uniphier_aio_startup,
+	.shutdown	= uniphier_aio_shutdown,
+	.hw_params	= uniphier_aio_hw_params,
+	.hw_free	= uniphier_aio_hw_free,
+	.prepare	= uniphier_aio_prepare,
+};
+EXPORT_SYMBOL_GPL(uniphier_aio_spdif_pxs2_ops);
+
+const struct snd_soc_dai_ops uniphier_aio_spdif_pxs2_ops2 = {
+	.probe		= uniphier_aio_pxs2_probe,
+	.remove		= uniphier_aio_dai_remove,
+	.set_sysclk	= uniphier_aio_set_sysclk,
+	.set_pll	= uniphier_aio_set_pll,
+	.startup	= uniphier_aio_startup,
+	.shutdown	= uniphier_aio_shutdown,
+	.hw_params	= uniphier_aio_hw_params,
+	.hw_free	= uniphier_aio_hw_free,
+	.prepare	= uniphier_aio_prepare,
+	.compress_new	= snd_soc_new_compress,
+};
+EXPORT_SYMBOL_GPL(uniphier_aio_spdif_pxs2_ops2);
 
 static void uniphier_aio_dai_suspend(struct snd_soc_dai *dai)
 {
diff --git a/sound/soc/uniphier/aio-ld11.c b/sound/soc/uniphier/aio-ld11.c
index 7b3cf5d751f6..15dbded63804 100644
--- a/sound/soc/uniphier/aio-ld11.c
+++ b/sound/soc/uniphier/aio-ld11.c
@@ -188,36 +188,9 @@ static const struct uniphier_aio_pll uniphier_aio_pll_ld11[] = {
 	[AUD_PLL_HSC0] = { .enable = true, },
 };
 
-static int uniphier_aio_ld11_probe(struct snd_soc_dai *dai)
-{
-	int ret;
-
-	ret = uniphier_aio_dai_probe(dai);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_dai_set_pll(dai, AUD_PLL_A1, 0, 0, 36864000);
-	if (ret < 0)
-		return ret;
-	ret = snd_soc_dai_set_pll(dai, AUD_PLL_F1, 0, 0, 36864000);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_dai_set_pll(dai, AUD_PLL_A2, 0, 0, 33868800);
-	if (ret < 0)
-		return ret;
-	ret = snd_soc_dai_set_pll(dai, AUD_PLL_F2, 0, 0, 33868800);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
 static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 	{
 		.name    = AUD_GNAME_HDMI,
-		.probe   = uniphier_aio_ld11_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_PCMOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -234,12 +207,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_ld11_ops,
 	},
 	{
 		.name    = AUD_NAME_PCMIN2,
-		.probe   = uniphier_aio_ld11_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.capture = {
 			.stream_name = AUD_NAME_PCMIN2,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -247,12 +218,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_ld11_ops,
 	},
 	{
 		.name    = AUD_GNAME_LINE,
-		.probe   = uniphier_aio_ld11_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_PCMOUT2,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -267,12 +236,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_ld11_ops,
 	},
 	{
 		.name    = AUD_NAME_HPCMOUT1,
-		.probe   = uniphier_aio_ld11_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_HPCMOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -280,12 +247,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 			.channels_min = 2,
 			.channels_max = 8,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_ld11_ops,
 	},
 	{
 		.name    = AUD_NAME_PCMOUT3,
-		.probe   = uniphier_aio_ld11_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_PCMOUT3,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -293,12 +258,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_ld11_ops,
 	},
 	{
 		.name    = AUD_NAME_HIECOUT1,
-		.probe   = uniphier_aio_ld11_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_HIECOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -306,12 +269,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_spdif_ops,
+		.ops = &uniphier_aio_spdif_ld11_ops,
 	},
 	{
 		.name    = AUD_NAME_EPCMOUT2,
-		.probe   = uniphier_aio_ld11_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_EPCMOUT2,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -321,12 +282,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_ld11_ops,
 	},
 	{
 		.name    = AUD_NAME_EPCMOUT3,
-		.probe   = uniphier_aio_ld11_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_EPCMOUT3,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -336,19 +295,16 @@ static struct snd_soc_dai_driver uniphier_aio_dai_ld11[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_ld11_ops,
 	},
 	{
 		.name    = AUD_NAME_HIECCOMPOUT1,
-		.probe   = uniphier_aio_ld11_probe,
-		.remove  = uniphier_aio_dai_remove,
-		.compress_new = snd_soc_new_compress,
 		.playback = {
 			.stream_name = AUD_NAME_HIECCOMPOUT1,
 			.channels_min = 1,
 			.channels_max = 1,
 		},
-		.ops = &uniphier_aio_spdif_ops,
+		.ops = &uniphier_aio_spdif_ld11_ops2,
 	},
 };
 
diff --git a/sound/soc/uniphier/aio-pxs2.c b/sound/soc/uniphier/aio-pxs2.c
index 899904f7ffd6..305cb2a1253d 100644
--- a/sound/soc/uniphier/aio-pxs2.c
+++ b/sound/soc/uniphier/aio-pxs2.c
@@ -141,36 +141,9 @@ static const struct uniphier_aio_pll uniphier_aio_pll_pxs2[] = {
 	[AUD_PLL_HSC0] = { .enable = true, },
 };
 
-static int uniphier_aio_pxs2_probe(struct snd_soc_dai *dai)
-{
-	int ret;
-
-	ret = uniphier_aio_dai_probe(dai);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_dai_set_pll(dai, AUD_PLL_A1, 0, 0, 36864000);
-	if (ret < 0)
-		return ret;
-	ret = snd_soc_dai_set_pll(dai, AUD_PLL_F1, 0, 0, 36864000);
-	if (ret < 0)
-		return ret;
-
-	ret = snd_soc_dai_set_pll(dai, AUD_PLL_A2, 0, 0, 33868800);
-	if (ret < 0)
-		return ret;
-	ret = snd_soc_dai_set_pll(dai, AUD_PLL_F2, 0, 0, 33868800);
-	if (ret < 0)
-		return ret;
-
-	return 0;
-}
-
 static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 	{
 		.name    = AUD_GNAME_HDMI,
-		.probe   = uniphier_aio_pxs2_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_HPCMOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -178,12 +151,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_pxs2_ops,
 	},
 	{
 		.name    = AUD_GNAME_LINE,
-		.probe   = uniphier_aio_pxs2_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_PCMOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -198,12 +169,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_pxs2_ops,
 	},
 	{
 		.name    = AUD_GNAME_AUX,
-		.probe   = uniphier_aio_pxs2_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_PCMOUT2,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -218,12 +187,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_i2s_ops,
+		.ops = &uniphier_aio_i2s_pxs2_ops,
 	},
 	{
 		.name    = AUD_NAME_HIECOUT1,
-		.probe   = uniphier_aio_pxs2_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_HIECOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -231,12 +198,10 @@ static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_spdif_ops,
+		.ops = &uniphier_aio_spdif_pxs2_ops,
 	},
 	{
 		.name    = AUD_NAME_IECOUT1,
-		.probe   = uniphier_aio_pxs2_probe,
-		.remove  = uniphier_aio_dai_remove,
 		.playback = {
 			.stream_name = AUD_NAME_IECOUT1,
 			.formats     = SNDRV_PCM_FMTBIT_S32_LE,
@@ -244,31 +209,25 @@ static struct snd_soc_dai_driver uniphier_aio_dai_pxs2[] = {
 			.channels_min = 2,
 			.channels_max = 2,
 		},
-		.ops = &uniphier_aio_spdif_ops,
+		.ops = &uniphier_aio_spdif_pxs2_ops,
 	},
 	{
 		.name    = AUD_NAME_HIECCOMPOUT1,
-		.probe   = uniphier_aio_pxs2_probe,
-		.remove  = uniphier_aio_dai_remove,
-		.compress_new = snd_soc_new_compress,
 		.playback = {
 			.stream_name = AUD_NAME_HIECCOMPOUT1,
 			.channels_min = 1,
 			.channels_max = 1,
 		},
-		.ops = &uniphier_aio_spdif_ops,
+		.ops = &uniphier_aio_spdif_pxs2_ops2,
 	},
 	{
 		.name    = AUD_NAME_IECCOMPOUT1,
-		.probe   = uniphier_aio_pxs2_probe,
-		.remove  = uniphier_aio_dai_remove,
-		.compress_new = snd_soc_new_compress,
 		.playback = {
 			.stream_name = AUD_NAME_IECCOMPOUT1,
 			.channels_min = 1,
 			.channels_max = 1,
 		},
-		.ops = &uniphier_aio_spdif_ops,
+		.ops = &uniphier_aio_spdif_pxs2_ops2,
 	},
 };
 
diff --git a/sound/soc/uniphier/aio.h b/sound/soc/uniphier/aio.h
index 0b03571aa9f0..09ccb47337fd 100644
--- a/sound/soc/uniphier/aio.h
+++ b/sound/soc/uniphier/aio.h
@@ -306,12 +306,14 @@ static inline struct uniphier_aio *uniphier_priv(struct snd_soc_dai *dai)
 int uniphier_aiodma_soc_register_platform(struct platform_device *pdev);
 extern const struct snd_compress_ops uniphier_aio_compress_ops;
 
-int uniphier_aio_dai_probe(struct snd_soc_dai *dai);
-int uniphier_aio_dai_remove(struct snd_soc_dai *dai);
 int uniphier_aio_probe(struct platform_device *pdev);
 int uniphier_aio_remove(struct platform_device *pdev);
-extern const struct snd_soc_dai_ops uniphier_aio_i2s_ops;
-extern const struct snd_soc_dai_ops uniphier_aio_spdif_ops;
+extern const struct snd_soc_dai_ops uniphier_aio_i2s_ld11_ops;
+extern const struct snd_soc_dai_ops uniphier_aio_i2s_pxs2_ops;
+extern const struct snd_soc_dai_ops uniphier_aio_spdif_ld11_ops;
+extern const struct snd_soc_dai_ops uniphier_aio_spdif_ld11_ops2;
+extern const struct snd_soc_dai_ops uniphier_aio_spdif_pxs2_ops;
+extern const struct snd_soc_dai_ops uniphier_aio_spdif_pxs2_ops2;
 
 u64 aio_rb_cnt(struct uniphier_aio_sub *sub);
 u64 aio_rbt_cnt_to_end(struct uniphier_aio_sub *sub);
-- 
2.25.1

