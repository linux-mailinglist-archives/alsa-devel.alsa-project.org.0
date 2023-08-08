Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9C3774EF6
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:06:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA0F8EBE;
	Wed,  9 Aug 2023 01:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA0F8EBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535984;
	bh=uXSgYYtfWmuy8xUaysURVsc2mZvLsxvi2WKRBwOnOjA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p3gbSWjVii6hdk50AYgOffcMzJBHCPlDR4zhgL9oPDiU8y1kTzQgeW/EvE76kZXRL
	 0SN6CVnAmDUjOYcDFscnlnf0+TmXZ8b2u7TH3UzguxulCXXv22YrZDY1TIG0LkJ86z
	 yH1hXPqeb8PJs/OBGLB7b5XjeqjfEuY0COPyhFyI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07A52F806C7; Wed,  9 Aug 2023 00:59:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BFE6F806BE;
	Wed,  9 Aug 2023 00:59:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB55FF805FD; Wed,  9 Aug 2023 00:59:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E49AF806BE
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:58:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E49AF806BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=K6/Pa2FW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1192vUzDDolak+/7AacRdkFFrd3aclyCsQECJwAedkq4Oi9pE9W7t/+QNcvGjwwTEVl7epEN5AmmwrjFerODfC/v4fej4RIiA8uNFgeyo3FsGtUNqLwdciTN/t22qfLmBV4YQsEFsmYqEqxyilPB0ymuhm3P5P4EFTzpRXcHyUMdv/YOXIpvK1sy2uAStMvB8Jqd5OAIH8JQuXIGl6gWkfyRCl//MxYnRQLjhitvVNEJ3bPR9rxwF+xm8reHWN/g3iDQJtZ7XXej5qNw0vbppYLkV3SUdTqLzv/ptoF+dJKRvoKkWIq/In5X7A8f2krTVLgwgVWIR9PLYugySOcUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHFLSEcvTs3ab7hgBHBYA0G8LXCFjgzk4lrIVzlSETg=;
 b=GnIvcdQf6BcVGK6kS7pRAMerI4cMfPcV0VFqHXEY8fgG1OtXKZtCzXZYLLgNrhunjhP8l9NTj0W3KuGizUKGPqXkmJTQIZS4/mAp1U4+0YzDLNDbU7Xyl9LebKoaF7jUPERS6gzWYF6PgfkS0yS6jARoPOhF8+S/K0E2uYw5Kv+Z/kX16261GzbtsfN9LORiHRNKHI8UxQ4td0Ml4bP18rgibACVSNuAT969s8rhID5qUiUjFWWvFOr35kByvBBulYZVWKezl2aBftJAXeOK0DKeN1o0TPfnk2PvO37fTZ8547RZ6Q3oppGid2vaukbpJWyM9wD4qsRmLjWEnqylzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHFLSEcvTs3ab7hgBHBYA0G8LXCFjgzk4lrIVzlSETg=;
 b=K6/Pa2FWYpsC3TYbqy7/WmYH/8oP5HaiHx/gRUdQvx+ne5sh2l+so6MOT9qp1oyWvEwrJPzB5FkYj9G7WKWYknyzNucoLDB2AJzhN2CaOTFOLaWgg1LTQFLH3D0bixdoY98ea7mrX5sKFhgDvxOd47hXWe8KmsGgAp8+zgpjxGQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8414.jpnprd01.prod.outlook.com (2603:1096:604:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:58:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:58:53 +0000
Message-ID: <87fs4t9m4y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 37/39] ASoC: codecs/cx2072x: merge DAI call back functions
 into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:58:53 +0000
X-ClientProxiedBy: TYCP301CA0052.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c570071-049f-4053-927f-08db986309ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O22/N0vwz+7o2YkgEP0epy4uUqjeE0LKe3zxwtbXfZcVRy1VOQerpezoZ7OUhp8uatZBI83GwPXmfaVRv2z53tpoQFFM92+stK/BBY1ozu801hzJnmF2VE/fqeABfGsPDa5VuSLpd1FNTtZVvcDmge7BrVitF85nLJ7J21daiKXFft6TMj3Y+tZivzHEjqH+o9szzeGY6p1Q16INyLQPeSqvVdgDXTpQKX2x+Mg9a2trkaNbVWJekJMdymYO6vEVaEjqSCIfJg6P2Q7zDZqTwoEXc+inL/19rnuj7Xj4p7Ohh5x7yNLCSHTjd62ms1qysuK1Y4dUxDmxoDag4wZHOSRr6Ym0PU8rBGHQ+UmjaqEtEsUyDLs78OH7Zz3jBcR0dSjcENS0uCAfycPP6SDSlKiKtKF0iwQK7EWCY1ZYzndqsBIKAT1u9o7kDSIc10176LJmhvLfYOsuINlSY3ZNN3hjfjs45zwTkQkwyhf0Kw2mTsL+teEVOcRhrsLaRnIalKV/zoty0b6MoXWsIOw/r/xK/dk0vY98t8q+mCdkhbtxZAwBU8o8mRftzYhFjqk+KnzXbq9Uk11i0r3WaQhnDbmw6u5AfkcU+PGKkBU7/20VNbuCEk4dhxPIdgbY2PmX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(1800799006)(451199021)(186006)(5660300002)(38350700002)(8676002)(8936002)(38100700002)(2906002)(86362001)(52116002)(6512007)(6486002)(2616005)(110136005)(83380400001)(478600001)(66556008)(6506007)(26005)(4326008)(41300700001)(36756003)(316002)(66476007)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xScjr2x1ZRaLyAdxZ4VYNz2hNFZMdMXwobZ8VAWBYUAWC+7YbcNI2Jqu/TtX?=
 =?us-ascii?Q?JssQGWHplbd8qJ4kXR6I9tpEjlTcai7hn4tPv6ZDwLVS/jvUxqcusCBhA7jz?=
 =?us-ascii?Q?WmBmhdRJeC/yWGwUcSYIFLjTrBuSWiBD/R0cfG0yIdEH6+dZ7mqkHOI8Sm9i?=
 =?us-ascii?Q?PPMWpkzniYKmVODA1ICh5ITHGX6gl/Pp9e3BHssvIDzlWGeSvJmXSiCzhMHn?=
 =?us-ascii?Q?smlKxzFcCocw/4gxk3Y5dXtXRHTeMipmw0+VG7gGiBg6c+IbYtiZBlKShm1L?=
 =?us-ascii?Q?xijFJanG1YZT94tAQFpp1jnHfZ5lTD2FzZxb5LcNcC3zIJVHo9zdyzJsO9qh?=
 =?us-ascii?Q?FWCA8SGuBdGIIKEZsIsaF5mGUXK4JcIYj5R5hY33+8mc1zGEGRMDZg4LcQyN?=
 =?us-ascii?Q?FKnx+q+7egAiV3s7SkI2Qdvnc+o86NkA7f3FVwtYcUAVhkA8xMRpAN9KypmV?=
 =?us-ascii?Q?Y/fHGvAiFForvlKldCFz7qEXxOR7jGYLWzhTqG4WzWGDGS0ux+c8OZlDEdel?=
 =?us-ascii?Q?oCrAqPU7Nslo1LKQhZzqwpa/gNBOy7b/zahQTCyHxkAyDPdnTGLzR01/XSJ1?=
 =?us-ascii?Q?R5gWWMs8hSNuXTTh8VJa/DsP//bDaH/hLInbZd/YFW4doH8eaT2IDF3u/GUv?=
 =?us-ascii?Q?Ze7ZpzuovE4KuEGntCPix3YBL9AYug52W94QYzOFL4f7YkI9v3XXXCZ34f3k?=
 =?us-ascii?Q?nwxI6T06QY5nALOQ9OrPjsEoTntTQcLk0MUia+BaAUQbcdJfqqx8yoV+dtq7?=
 =?us-ascii?Q?xu+i3W0kuX8MY0QFL6SnFM6bLu+7hxhRpjHDpqRxETAcBHeFNTnHeMicfvH1?=
 =?us-ascii?Q?RDSsBRFdh2CF+dk4SPRvTZvX2VVEEfg67ZoT/hJZjTOKuICeHi9iPdVYXdNV?=
 =?us-ascii?Q?qJxGd8bRHIb+zRAO4KzULRazv9ZZxLyu0ffIPKzxJRILpga3XyS1pYQAFgW0?=
 =?us-ascii?Q?jh6SlgrT6J/8MKOFHNbqjkj0+KOeJRQk4V0CQJK/HCGl+slvEa+HjPwv/5kr?=
 =?us-ascii?Q?okLUEW6lfBErneo+JQULtHFceUhy4iLxGaYScMjn2lMsJegMkVeykDUamL8/?=
 =?us-ascii?Q?Y0tUHka+SF0MrRSFkoIAxjdEYWLO3QVxOzslHzmzq1wM50SfL5pTJHWC/OaJ?=
 =?us-ascii?Q?GKDpBziBLk0hXVAdDa8VA5v2QLKmpmnbzHH9ChL1RnBK8/VtLkdwfWDwldCq?=
 =?us-ascii?Q?tKkju7bWGV/eObs2r1DtiShkOTb5h46XJv3iKrbUGbepg1QZYlGG2DOKMscE?=
 =?us-ascii?Q?/TAx1VnvZjN8CfpqApc2Y25WMpbBm+WYDqVRyJ4MCGFLFanmIrJOCCb+6xw9?=
 =?us-ascii?Q?aTEzi1tgw6r9SShwkbDMBBWzOwcF0729R20gfsTvScWs5+YQT4PsQ0pLq01q?=
 =?us-ascii?Q?dYuCrs3X+MOTMgoqUhMdzqUEcb2tsN00qzy1a7qc+N/epKCt9h38UMZulMq0?=
 =?us-ascii?Q?T94ahqgmlPdcfwku8rrXAEDhGNn6fIjxWIdv6HQozcULhuqPHpEKvzJu+VyL?=
 =?us-ascii?Q?LbNw1VtKLAeNIOiRjfOhNsLBPU2HMPWVf2/OZJHNMHWDg+T+9gjwMA3GqTv3?=
 =?us-ascii?Q?oSkDMkfbbrkTDmDi+TDzvtX+ySFqK5xqOYrRX/b5Cx898lAlAewmporCDlfa?=
 =?us-ascii?Q?AIaPxVXxjl9gENxiPglLUwk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9c570071-049f-4053-927f-08db986309ae
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:58:53.6451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QnlrrkizCjHxJoCW5ZvHeyPyHl8bZtstbzlV6QFhw0rbwIS7xhq9vuiwXXWRiJ8hXtnwryv/Xxovb02gnfMxzu2mAsgQvLz28Lauvc9CotME8voVZxpc0WokiiKJAPrA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8414
Message-ID-Hash: FKIT4HWJX6X4DZCZLEU6MYX7QCVCENP6
X-Message-ID-Hash: FKIT4HWJX6X4DZCZLEU6MYX7QCVCENP6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FKIT4HWJX6X4DZCZLEU6MYX7QCVCENP6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cx2072x.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 082231088a26..f8b128084015 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1546,6 +1546,14 @@ static int cx2072x_dsp_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops cx2072x_dai_ops2 = {
+	.probe		= cx2072x_dsp_dai_probe,
+	.set_sysclk	= cx2072x_set_dai_sysclk,
+	.set_fmt	= cx2072x_set_dai_fmt,
+	.hw_params	= cx2072x_hw_params,
+	.set_bclk_ratio	= cx2072x_set_dai_bclk_ratio,
+};
+
 #define CX2072X_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
 static struct snd_soc_dai_driver soc_codec_cx2072x_dai[] = {
@@ -1572,7 +1580,6 @@ static struct snd_soc_dai_driver soc_codec_cx2072x_dai[] = {
 	{ /* plabayck only, return echo reference to Conexant DSP chip */
 		.name = "cx2072x-dsp",
 		.id	= CX2072X_DAI_DSP,
-		.probe = cx2072x_dsp_dai_probe,
 		.playback = {
 			.stream_name = "DSP Playback",
 			.channels_min = 2,
@@ -1580,7 +1587,7 @@ static struct snd_soc_dai_driver soc_codec_cx2072x_dai[] = {
 			.rates = CX2072X_RATES_DSP,
 			.formats = CX2072X_FORMATS,
 		},
-		.ops = &cx2072x_dai_ops,
+		.ops = &cx2072x_dai_ops2,
 	},
 	{ /* plabayck only, return echo reference through I2S TX */
 		.name = "cx2072x-aec",
-- 
2.25.1

