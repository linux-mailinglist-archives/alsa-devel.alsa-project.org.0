Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D64C685CF7
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 03:02:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B144B1F2;
	Wed,  1 Feb 2023 03:01:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B144B1F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675216947;
	bh=CAc1Hrpa/1ttWCcTuFg8ndHTOr2Kw4XsX2EEAFE1L/M=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=azmLWonVdKkwb7lCJyZwTuNZ6KyBrgVJMJRSzRiR03/dhHzq9QViNdoT4ZccMHmri
	 zxQQX1sr/F+0bxMWwaKRjtcX5HqOcXev7l7JgYYZzmX/AFD8SpJxUi3a+DGLYiSpl+
	 9s6kIDeLyFDVu+qbEZBWMLsJaqrzoBxh5sLDl9TE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02512F80579;
	Wed,  1 Feb 2023 03:00:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0D78F8057B; Wed,  1 Feb 2023 03:00:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
 version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::70a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BCFBF8056F
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 03:00:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BCFBF8056F
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MHsuGOE+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LE2C8potvQJxf2IW375Df7pkdBlA62+jFmcH4+XeDM8T1T4O/vrC7K3X/ScWopvJqM7ilyeSmVdNc4Uo83JL/lTQ6SubA+gwkNVs32XNXd3G2bvFPzYsXlW8xiZmAgcokul8mKB76kM7DQSgXjWWLC3OA16V2ZKkceESS9060H++bhV/1o9ELtV+Xl33Ss1Z9msza4ZU/bZic2OUAabXoRIjXsWlz7n69M03Kw+eM0iZMmVd7loRdJlTxy7IjUKZJKYH1TUx0+okbb5yLbGaG5EagtkZA1OyiBqBGWeEIdFu45M0d0sL2Go3Weq5kLpZQ83Jfk6HbPc2GYKCQGbVOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqgI3iX66aDYaaPaSBMt0wOzUgHFjXkU8sB8qsSvnK4=;
 b=j8gHEUj0gEUQmmK3QD28tAgfLUIHfr4XhuwwgbBZlUmIdFhOf5ws3rW9/QKG2Ch2FeFwojucp5i9qxd8y9/2L/zItnn+7jlmeMVXk5nQcHFjvhhhE9Bwe1mXSGn2z1ihL4/RlHRdYMVeZA4XPN8Xs0P2DoHbtCK6gGzCgfz6Pw+6aNHBP5NZ3G20/5tMr9uTHh44JSQT3ysO+0lb9X+vQ9vUCu78gZxew+ziqJmc8xK9iMQfrRvksCcr9nZMebT4eUFfEgFAFcBrhCSQRXF78zzf0BfvIErOdqOFuDpBZwcJpVd0ZP94lA1ZFNVSWuZwFkk124Wg7VZIraplBZw+8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqgI3iX66aDYaaPaSBMt0wOzUgHFjXkU8sB8qsSvnK4=;
 b=MHsuGOE+jdzU8xhVF4A3vST5nkdjywXz6bydcwqPslC/FtoBZpaq5EmPLomziu9vNViQGt2kTam9A9MehIcPCDtLrXXjv54WvLCntB6JhLsN04cNNWn9jIuc2AYB3EV3BUySUtFTW4Y7L5vYC75g8HpQRvJJgdG22dM8or5vU+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10342.jpnprd01.prod.outlook.com (2603:1096:604:1fa::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.22; Wed, 1 Feb
 2023 02:00:08 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 02:00:08 +0000
Message-ID: <87357q6t7b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 05/15] ASoC: rsnd: indicate warning once if it can't handle
 requested rule
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 1 Feb 2023 02:00:08 +0000
X-ClientProxiedBy: TYCP286CA0141.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10342:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf15ef8-134e-4d52-abee-08db03f80bb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pgunDnXx7d47ieqLBHgD34oaSuBuBcW7uWJKINEJiDdJE0/suhhH/g0HxymnnnchTivJYkTEwyvfwaVF6fe74v841zayLAQDEhkA2zwlojZ2I24CyxFAZx5r7eZuOb3HP4DTORnHG/xW9AWu6Fbqy3g2KJV1TtSvLMn7Q0yM4Ht2xTnZLLIrjJuGnPrzFhWA4NGkpxfAGgl5gz+wY5j2adBJsRSx0YQ3qThjhZiIPWo5uFhV34eH7upW/ighqXliHf2O0IXyceAn0kT0q6rQzo4DvV78WpaoHPA5iUrQKDAzTPOe6J3g0v6VWnhGPQEPF3+MA+D6sWAkxbxIkaAbxke6Iy8YuKvEtVUkAcVDy8nKTMOIYWRkO1jWAN3RooaEFCbVJWFXPaTa9ZbSxidS8wGqb/Mp00YVmOVVKc3wvRtC94/D0j4bnHvWVPLSnPxKk0xJi1b0f915onyr0BCwfuXfhEPKMVxRsmoWlGlUki/b2yJ05+usI9QWWAMp7B2C6R9/ZD3gvvV5izPaoqB0m6C6gch60MpfIdA/i1hQXMqTnH99rGwF+qu6XzDRJcOGoap6PuU1+R7M4kmmRe31hpmfqo3PB+/wgQYtNQ2/dY+Zl31bUneo2+ncYZW3Y0CVw0Ga/oXdA42/nPo/S2HKNXMSvPqPxtOKcauQthGJYE1+B5uKbOPaFpqt0Q3PZ4iw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199018)(86362001)(36756003)(38350700002)(38100700002)(83380400001)(6506007)(6512007)(186003)(26005)(2616005)(2906002)(316002)(66476007)(52116002)(8676002)(6486002)(478600001)(66556008)(6916009)(66946007)(4326008)(5660300002)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SZN8BetLjxvlDCqekab7tgAaTcfgYkvBBOrdtHMK8JK7xzXEd0zzsxnH4ECY?=
 =?us-ascii?Q?IX6QtWdCo1lqKQMCL1vOnDhp1rnFZXXiLHiE8OFuMseZ8mZUU7SvD7PrDWxg?=
 =?us-ascii?Q?bnSYnU7YSvvdpb/p/12W3FLWyTQ1ASruxx+dZCGE4Dk9Ele2hwmuMDBCeTpV?=
 =?us-ascii?Q?NkCBWho4G9pMRT/9Hj2ge7hzPe5iBNIrMFbalGP37Eqd6u1Z1HZ7i+5/b5r7?=
 =?us-ascii?Q?g9yih9aeUlMS7Na43Tro4eGXME6BxHTt7CGH5/kTA5QAQomB1m4pVo3FYEkf?=
 =?us-ascii?Q?Moe/1wujD1kYpZ76VcwYO7EwQnn73+0V1G1JIxDrnfzKuGkCPZo1M6woiFzd?=
 =?us-ascii?Q?M971wI/khf/NPhSWddVUpfICj8iTw+HdSjdaoDmAcbbc4kMVCZwxtwdjXO3M?=
 =?us-ascii?Q?GN2+9Ta6LneqvOhETMExfwbjHciperl122RteZqcxqPDQl50n5cDQPN4A6x0?=
 =?us-ascii?Q?AJxoYNA4QMUZXi+qKEiFSDmLE6NbwkcOBao2IBRWPdpkOnDi5jUjXXfkcRtq?=
 =?us-ascii?Q?HItVorU+VDliABI/6hzCw8LG8ZIBuYbEky3N2yN0l02iicoTyDQ/ISjNiVXZ?=
 =?us-ascii?Q?CPUUw995aRMFJw0ak1blqGQVyiyQcLrPzQBNJnEzcyMcieZNz2QkzHv/IlPr?=
 =?us-ascii?Q?k+My18rfTXdzny5YGf+2QnEr0GANetDy4R6YioCHZegEBe5MJ64vxUQ0N0K2?=
 =?us-ascii?Q?u28gLYv3dWf+EpZu51n0pyA9HyXOYewetV1U6f1QFWAEbMyQ+40533gshniG?=
 =?us-ascii?Q?DqZZWxx3OMFfKkzajyyoSW8aJzo8tR4ApHi2LIPCWFNM+HKamoxgXe41+Tyh?=
 =?us-ascii?Q?hF4pSpZH/HCYK5Zt7a9cIlsg6ypz188yxXakeyV1cwWiF7V2OF+ciSZTRmC0?=
 =?us-ascii?Q?CKpJ4g7NAqcC1Rkx0qtLFhCWCFSnpUR6ZTc92bYTl8fJNlU25I1sAOHbucuD?=
 =?us-ascii?Q?8YNmhcIYzH9O79TUUt8hxncERMjieicqdi0teewpVjZ56kpz4RcTWlMkWrJz?=
 =?us-ascii?Q?lcIT0tD3ePec3oBvEhTPcqi7nkA6XBQmO+DH4TZSsxKfjn4Y2/NweA8/qWSG?=
 =?us-ascii?Q?9hEsj8Qfx/C42GYmUe8VBuIH/ZrtCKqGghtYW27uVbPhYR5SeNURfgPdnuOO?=
 =?us-ascii?Q?mADA55pdYVLSKfLTX339ORmrLZ7r3ZgqJvUw5LS9ITGexyUKAlyZTQHSfyLe?=
 =?us-ascii?Q?zD/Sp8yYEILf9CAUCvUYCwwDYPixtiavKRuLhHWssixzsJFTZNWm1B1kT35m?=
 =?us-ascii?Q?kQIDzSTPcNG/ZtyA5d4PeHshoYcGEY+68JCLl1tX/rV+YYMM/9mwyYmEZdRG?=
 =?us-ascii?Q?8VY6LwhrNtTgsWZYTpUe576TTTqNWE2COxNZAipqk2fmxLK+mtXGJFYFYG7c?=
 =?us-ascii?Q?rMhcB1PnZ7MYSCmVfoNxijWa6A4ZXd31/42xKKTXQo8PHXoh6fMz6D+sHn1h?=
 =?us-ascii?Q?cmMk43/kGJN7ungFUw4Z8Y4AS+yxzldOm3oeCLJQIgYzxlPCw2VdOwgu9aHs?=
 =?us-ascii?Q?A2hV3JTkPpooaa9Y3Wxym8FmnCg0QpiGvFHRA7lrtRvLSIfWyxp24jiepEN5?=
 =?us-ascii?Q?WinLw8Gr7XYL7B/iERfzbIdQ/3foiu8rX8jSdgkHfhp5fsGn1Mhg2uZIkWw5?=
 =?us-ascii?Q?OG8RiUlVYvk0Gnjimu01DQo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf15ef8-134e-4d52-abee-08db03f80bb9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 02:00:08.7484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lAhtW/H9jaE59L8ZtdETY/hxN6i15co0S4wwWAiwlIVCVSIabK+A0iFSuoNt1aaGGyVKPNftiI6KYsDrVNceUAoCa2MIUO6P2N4Y6sQXF6dQj1JCV0Fv/sf8xva9FiS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10342
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Some SoC can't handle all requested hw rule. In such case, it will indicate
like below, but it is unclear why it didn't work to user.
This patch indicates warning in such case once, because player will try to
similar rule many times.

	# aplay sound.wav
	Playing WAVE 'sound.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Stereo
	aplay: aplay.c: 1359: set_params: Assertion `err >= 0' failed.
	Aborted by signal Aborted...

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/core.c | 19 ++++++++++++++++---
 sound/soc/sh/rcar/rsnd.h |  1 +
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index ca3a0f285092..3de81af41ffc 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -869,7 +869,8 @@ static unsigned int rsnd_soc_hw_rate_list[] = {
 
 static int rsnd_soc_hw_rule(struct rsnd_dai *rdai,
 			    unsigned int *list, int list_num,
-			    struct snd_interval *baseline, struct snd_interval *iv)
+			    struct snd_interval *baseline, struct snd_interval *iv,
+			    struct rsnd_dai_stream *io, char *unit)
 {
 	struct snd_interval p;
 	unsigned int rate;
@@ -899,6 +900,16 @@ static int rsnd_soc_hw_rule(struct rsnd_dai *rdai,
 		}
 	}
 
+	/* Indicate error once if it can't handle */
+	if (!rsnd_flags_has(io, RSND_HW_RULE_ERR) && (p.min > p.max)) {
+		struct rsnd_priv *priv = rsnd_rdai_to_priv(rdai);
+		struct device *dev = rsnd_priv_to_dev(priv);
+
+		dev_warn(dev, "It can't handle %d %s <-> %d %s\n",
+			 baseline->min, unit, baseline->max, unit);
+		rsnd_flags_set(io, RSND_HW_RULE_ERR);
+	}
+
 	return snd_interval_refine(iv, &p);
 }
 
@@ -922,7 +933,7 @@ static int rsnd_soc_hw_rule_rate(struct snd_pcm_hw_params *params,
 
 	return rsnd_soc_hw_rule(rdai, rsnd_soc_hw_rate_list,
 				ARRAY_SIZE(rsnd_soc_hw_rate_list),
-				&ic, ir);
+				&ic, ir, io, "ch");
 }
 
 static int rsnd_soc_hw_rule_channels(struct snd_pcm_hw_params *params,
@@ -945,7 +956,7 @@ static int rsnd_soc_hw_rule_channels(struct snd_pcm_hw_params *params,
 
 	return rsnd_soc_hw_rule(rdai, rsnd_soc_hw_channels_list,
 				ARRAY_SIZE(rsnd_soc_hw_channels_list),
-				ir, &ic);
+				ir, &ic, io, "Hz");
 }
 
 static const struct snd_pcm_hardware rsnd_pcm_hardware = {
@@ -970,6 +981,8 @@ static int rsnd_soc_dai_startup(struct snd_pcm_substream *substream,
 	unsigned int max_channels = rsnd_rdai_channels_get(rdai);
 	int i;
 
+	rsnd_flags_del(io, RSND_HW_RULE_ERR);
+
 	rsnd_dai_stream_init(io, substream);
 
 	/*
diff --git a/sound/soc/sh/rcar/rsnd.h b/sound/soc/sh/rcar/rsnd.h
index a09b3612b7f9..3e1184f56ffd 100644
--- a/sound/soc/sh/rcar/rsnd.h
+++ b/sound/soc/sh/rcar/rsnd.h
@@ -513,6 +513,7 @@ struct rsnd_dai_stream {
 #define RSND_STREAM_HDMI0	(1 << 0) /* for HDMI0 */
 #define RSND_STREAM_HDMI1	(1 << 1) /* for HDMI1 */
 #define RSND_STREAM_TDM_SPLIT	(1 << 2) /* for TDM split mode */
+#define RSND_HW_RULE_ERR	(1 << 3) /* hw_rule error */
 
 #define rsnd_io_to_mod(io, i)	((i) < RSND_MOD_MAX ? (io)->mod[(i)] : NULL)
 #define rsnd_io_to_mod_ssi(io)	rsnd_io_to_mod((io), RSND_MOD_SSI)
-- 
2.25.1

