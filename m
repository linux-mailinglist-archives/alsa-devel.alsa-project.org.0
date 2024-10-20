Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4879A578C
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 01:59:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00983857;
	Mon, 21 Oct 2024 01:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00983857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729468779;
	bh=D30Eim8Ln02RXwksD6qpDFu9qxLf5s07lw3x4XwjsC8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sKHSiP67CqXHCIykXg3Ob6V2ayt+phxD4NN7m1M+FugcQAdna6V0ySETNrfaUVNpo
	 klvu2UObtvFe+RBUnS6R4KxET7D5DURejSU/ZL2lbe1fbCTMD+QNz76acGtahsWa3B
	 b6w7DGb/H9C0njeN3VlT5BmFszI68dsG6poVHAAk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E488F80601; Mon, 21 Oct 2024 01:58:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75F2AF805FA;
	Mon, 21 Oct 2024 01:58:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F113DF80588; Mon, 21 Oct 2024 01:58:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 198F8F80272
	for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2024 01:58:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 198F8F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lJXmAyUM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ru3cuhrll7y9UhlWc8k1CEYiyAurd4ZcJ08gdWufs/mheS0xejCVMozAfuTyw18rzmDrBjbTNtnO1TuYzs55ZL4elSaU92Byu29ojozpzV4DTPIvq1IoFjREKmZMe5sDeDqtxBWeK2SZI/9/HFq79b5f67ALtcGOjxIwVXr7QTSOs8dDrfdzoZVNWr4AQNCc0dAhCdfJJ/ILCnMiWQS7yCzYGnXMvS3/i/F5Jzl/G2SLuy2CmSLnwvBYZxmZroWSq98U7FurYu/ON19aiPexcq4qAQuq+/XDujp+0EHQwtIfwVIazumpceg3YH3LdK4UGqVGrTMdoVTtJeYBebaYFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3PQdVvaZ1VYKzr8aoP2xlzfTMD50pWZg5Olj/6FycE=;
 b=olHvQmWRZtHfeEVGtKaQ7f6oapY+QZwgkLUVQdY7CmfBr7r25e15CFcyHLIEFQ68xRO4cc8eH//4LmnDO9GeobGwnJz39b0gN8Ddp2pSLXuEu+Wj+tIWDilYKeTtVHk4UxFapuhxLLlO5yv6O3zwWWtxDyPyq2j9MK5fKDWF/sIvFT22EsH3UZ8UgRe09eP0wqbjOFW03+kLuwu3sn8aR7ZYDsKVTITREWArU3g9OK/yT0pvLmTbQ5SIRxX6v3MP8u60TYdX1GNwha8XPef98AY95ZusUMPEFWzeQbGELGpQ2SaAQeVDVRt07d1pFqmN1o6ROtIFPHX44d34yqCBlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3PQdVvaZ1VYKzr8aoP2xlzfTMD50pWZg5Olj/6FycE=;
 b=lJXmAyUMoub8T9p3qzRncYIljq75P7ft5M69REi2hut+FgEXk3GOCzLIcYxIqTgp1vRWc1DlONSs9R6/1eAm2giBZdrP1ihs0FfxwLt2M+DAilBVy4e3t4YKru6bS3ZzOIy2FDYo9p1nPSZUfX+UoAGCjluFYqL4PCD9JFFghx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12916.jpnprd01.prod.outlook.com
 (2603:1096:405:1b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 23:58:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.027; Sun, 20 Oct 2024
 23:58:45 +0000
Message-ID: <87iktm9vij.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 02/13] ASoC: fsl: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 20 Oct 2024 23:58:44 +0000
X-ClientProxiedBy: TYCPR01CA0132.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12916:EE_
X-MS-Office365-Filtering-Correlation-Id: b66ccf17-d171-45e1-b6ea-08dcf16321af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eutTW8Kgch9NcE2oo9k7ISrHdavzmqrEvjFeyyOOMCYyqwsvs+v6bA126AYg?=
 =?us-ascii?Q?/+e63MBw3M2LhbmPXeMu62lxLsK71u2ufoDhRDX9rLqDhnTMjB53s4xX7Rq4?=
 =?us-ascii?Q?dAc8U94OoZanykdTiwGaB5Q8t9xCZptA8kHNVjtYmCWM3O+u6o8KUKW8XS+q?=
 =?us-ascii?Q?01ghAatNGOfVl7QfbX/SP7KKRGaSSFbs00czWvV5wUxakrIzhvtj+MP8qaGL?=
 =?us-ascii?Q?XVAyxTEcj5XsZpoVP4f0PnmCKJoXuqSlPkHa2FwYwZPwqJmve3VVvwsxjsbZ?=
 =?us-ascii?Q?LCQixdj2VqC2+ram1Txeu92WkLdYTT0acxzYCN3XalU1VcHziXMrH9f+3gL7?=
 =?us-ascii?Q?EWaadiCKnpE8Po7S60AcGzBHDbHJO5EeTss6Admwt92OpIjcMSgEdiv7ZXIH?=
 =?us-ascii?Q?YvJzG2ra96Ei4A3sc6Pe9KmxA3vbuzjp8jdQGzfGi5i8XU5LZEXP36zWVUMG?=
 =?us-ascii?Q?WGbmmBFu8J5+oGk2WtG8RNw2GVZNTeMzgR12ffwoipV/RBvFkN+S7PT287bQ?=
 =?us-ascii?Q?aejL17Bc+SRD5g1QSCjic0Lf0A5jQwAh+l5ekd+gb4G6VEKw3HMU8NiDJ2v2?=
 =?us-ascii?Q?Q1CMa44PhVjlk1wNoGdRpDsXUAU3v5M5zx/Kgf25esLAKGm1LKD7DHqjHEnE?=
 =?us-ascii?Q?bTRVqkAYN+cdXDntCv7w3110t/vhH+zaISoG37e9Cd3p9r3iGM+HdNdnAIKr?=
 =?us-ascii?Q?bJ35yb4sHexeeGEBg7uAEQlq0Cj8C2ZkPLqF1NPkudwZZLZSiYj4xvf+2ST/?=
 =?us-ascii?Q?g6waUFxlPK/6PbwDHg1AR6LV4+tt1+5MHLD9AvmfHgu83eKpnmgjkoZRqntw?=
 =?us-ascii?Q?M80NxJs7p3bnqLjUpw7Rb0tVIO7pgyA7EDLiUDieiDOXSM1NBL2MqrxU/LCA?=
 =?us-ascii?Q?PL0hBUlhdW+4PtHbnSN+YU07lPCsQ6dxY/VBwh2C4x5CFdtC+FbeDo67xojt?=
 =?us-ascii?Q?fJ3mrM4ncfXwnvHnJlUb/glW81rc6Y9imc7GXiDcMaw0u7wdYhIjvsimtFVn?=
 =?us-ascii?Q?skcitY59G0RgnM4D+6MdjU1lpFCqEta4eBp/Ny2E4ZifMk626ikgmVd292TO?=
 =?us-ascii?Q?QBftGrOTfpSA147keyNIZ+vOMSExO1P0KiROLK7QzED8zie7Vqwh/TdpmeP7?=
 =?us-ascii?Q?YGNd9fY4lrLRgipL/3AyT3ElrzIHQ9fmhNMMfeigvI8w0GzGrKHDvguaYLWL?=
 =?us-ascii?Q?0NhsotYWTe/O6lMioDHKYBeDXZA0WyBPHYgyu9WZDWnqJMXEVonMY8ufCjxP?=
 =?us-ascii?Q?TQzkYtEhrCIvIn25zT2Rs91LUzbWice9RWccqIcBaS9ktb//4gh0SN9H77vc?=
 =?us-ascii?Q?1lABDjCRHW1QlbLxctSLa5opnODldCz9vHSflip02KbUlfNBLfKDJF74zkvW?=
 =?us-ascii?Q?gGdDKC4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RrR/wFtgpK+aYSpsI92RwlfQm2ggVBue3gPWNVySluNDhPknhdrrn4VpgJv4?=
 =?us-ascii?Q?DsQaW90XI9A0No5qgwnNEUPjfqO8O6nUcmPh+w6c7VVGqOB8GGl2Sbl52pKW?=
 =?us-ascii?Q?JSDSIgkrq15vZky8OmKqXp+iPW2v38w+4Fn15FR+l+YVOmWVQPWH7cXM3PtW?=
 =?us-ascii?Q?yM4+kTMNDRTz6//nxlTVtuq3+vsWOivfF8HT4aCzoYQt3+75j2ePavjfRqrp?=
 =?us-ascii?Q?FpN3av7WTh7quykwnp+awJCwXr1YeY4xLzmNiyLf9bdJtfZPY5Qv4sjSEjn+?=
 =?us-ascii?Q?CUeZYaQLHlNiM6tYd7anr5tvTxOWQTei71OuftzlTyYFp3C4WF/rZ6MznhqY?=
 =?us-ascii?Q?dc/3MrHTXpkLnIr7bdtV+f/FDRa1MXhwD9+w6xQFLqJ1GI28KkHctLje49vS?=
 =?us-ascii?Q?DBIfVU8tKi+5q4EMtlElnZH3v7VrKC4sJtt3FO8lD8znRqXrKqlf68yASHMB?=
 =?us-ascii?Q?zNDwcy2lUimPeMZFD45gpoTvH73fde9m4UuWruscBnDpacPTgmq3vBjCo9E2?=
 =?us-ascii?Q?/QhHV7HGQS8CiaGu0s3FHhswIXHg0DaZvZVLK+f0Su8b4Hf4+2D+lfdIOWSC?=
 =?us-ascii?Q?+homtSBKDBzLzHolt/STleqmYPlQR2Gxx+AB7guB6HVihnHOweXrHUuzyvyW?=
 =?us-ascii?Q?f6qozQxCmoPwWKSEwtV/j7stdyGsNouw9/xhhVvFG/1aN+8dOefaqheS89No?=
 =?us-ascii?Q?YjtbL3bqcchckvupWO2jlQacWZSn83ttWZ1N1geojyOHvyEKOVzOlEtXTPMY?=
 =?us-ascii?Q?ll5DVNNapm4MX4SVE2WOkWabEq1KrUIIdTx+MmbTzq4aZikpMkiMfdQQvh4E?=
 =?us-ascii?Q?n3YDkfMdSn5fwLJ7Qv0wty3p2kFpxhWKRzwSFzgXKCrwNE8BAmlVbMKiIz5Q?=
 =?us-ascii?Q?wialMS3AjQGwYcpPya0/WDyMkRfAqlRHC7ltk/22BtWj0TbAlyi3UrEjAo35?=
 =?us-ascii?Q?TWpfppueWKfoJkEDZ0S1+CnzJWcSqhmu4Mi6sK1sxuhmH6Cy1h3mM0h4b55r?=
 =?us-ascii?Q?93MyE9Cswiy6CfX18xihZNUtZpLKfgJlAeEWjA0I7DAozY80mnPOxVXq/5lj?=
 =?us-ascii?Q?vEIDR32lG43WXHAaVcIcUAl+0Qc+e8wvtyxVzfqvNqKKYsFIuc0e4eMpbaDi?=
 =?us-ascii?Q?BOGEBdJs8NlKTsW+LyIM2skkX0eAQBvtJaymx4ZfrOtxT81BhHAhwcQlaVXx?=
 =?us-ascii?Q?C6VH1lYMsU2kWFf2qx8q3eZC+83nlYlEd8YQqHaztsSvoFigTTWjpPTyFETL?=
 =?us-ascii?Q?D0RVQjwB9OoHR6rL8elQ27gHgYDg8LTc9AK2WVDvAR+eD/tKWXu+DBX31+8u?=
 =?us-ascii?Q?AABHtv7jbzFoMrLnGR0+BZVHsVqbZrzVwd/kv1PAVQyDodMG9MC78PNVE8LH?=
 =?us-ascii?Q?kYOQoleXLnVwQ2w2t2U0WYn/i3AY7Pn2UnCgj/9CiEPk6pTzTYNnEqV4HR5y?=
 =?us-ascii?Q?vNgRbo//j/b/h3XwsXzepYouWgE2LImqJuYSaGfgRFUrvoHOLQAHCBX2W1GQ?=
 =?us-ascii?Q?hpGjbCzSQwI+S6tJ/lGXUNHWAiUXJYsRhN3XT+ABjTAx0eYEg+3VPVuxR7qo?=
 =?us-ascii?Q?MoGN31nkvR8GlDPuX81r4CsepnFJ4ynsGOz+vnp6OXy7Bf9a/9rEVVO70Dfi?=
 =?us-ascii?Q?7SPgePnOrQ/qTrALJxnNzGk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b66ccf17-d171-45e1-b6ea-08dcf16321af
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 23:58:44.9920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +NSmNRuFvj0scYBOQcJhZQU3bfYfu9LMVAPTitBYHpUV5JgZwgAspGYVMe/cmVsx3pEItSXw4ULoaovzxcPWad0nq27BQYAlzPPeZi1lOroDjtTD6pKUtG3HvPfzDEgi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12916
Message-ID-Hash: WA565TE5FXYUHO5XIN76KNLJK5TCNCJB
X-Message-ID-Hash: WA565TE5FXYUHO5XIN76KNLJK5TCNCJB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WA565TE5FXYUHO5XIN76KNLJK5TCNCJB/>
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
 sound/soc/fsl/fsl-asoc-card.c | 24 ++++++++++--------------
 sound/soc/fsl/imx-audmix.c    | 18 ++++++++----------
 sound/soc/fsl/imx-card.c      |  4 ++--
 3 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index a0c2ce84c32b1..02e1594e8223c 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -317,8 +317,6 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 	{
 		.name = "HiFi-ASRC-FE",
 		.stream_name = "HiFi-ASRC-FE",
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.dynamic = 1,
 	},
 	{
@@ -326,8 +324,6 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 		.stream_name = "HiFi-ASRC-BE",
 		.be_hw_params_fixup = be_hw_params_fixup,
 		.ops = &fsl_asoc_card_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.no_pcm = 1,
 	},
 };
@@ -504,13 +500,13 @@ static int fsl_asoc_card_spdif_init(struct device_node *codec_np[],
 	}
 
 	if (priv->dai_link[0].playback_only) {
-		priv->dai_link[1].dpcm_capture = false;
-		priv->dai_link[2].dpcm_capture = false;
+		priv->dai_link[1].playback_only = true;
+		priv->dai_link[2].playback_only = true;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (priv->dai_link[0].capture_only) {
-		priv->dai_link[1].dpcm_playback = false;
-		priv->dai_link[2].dpcm_playback = false;
+		priv->dai_link[1].capture_only = true;
+		priv->dai_link[2].capture_only = true;
 		priv->card.dapm_routes = audio_map_rx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_rx);
 	}
@@ -764,8 +760,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic31xx")) {
 		codec_dai_name[0] = "tlv320dac31xx-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.sysclk_dir[TX] = SND_SOC_CLOCK_OUT;
 		priv->cpu_priv.sysclk_dir[RX] = SND_SOC_CLOCK_OUT;
 		priv->card.dapm_routes = audio_map_tx;
@@ -791,15 +787,15 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
 				SND_SOC_DAIFMT_CBC_CFC |
 				SND_SOC_DAIFMT_NB_NF;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8524")) {
 		codec_dai_name[0] = "wm8524-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBC_CFC;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.slot_width = 32;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 6fbcf33fd0dea..dcf770b55c4bd 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -264,11 +264,10 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[i].cpus->dai_name = name[1][i];
 
 		priv->dai[i].dynamic = 1;
-		priv->dai[i].dpcm_playback = 1;
-		if (i == num_dai - 1) {
-			priv->dai[i].dpcm_capture = 1;
-			priv->dai[i].dpcm_playback = 0;
-		}
+		if (i == num_dai - 1)
+			priv->dai[i].capture_only  = 1;
+		else
+			priv->dai[i].playback_only = 1;
 		priv->dai[i].ignore_pmdown_time = 1;
 		priv->dai[i].ops = &imx_audmix_fe_ops;
 
@@ -285,11 +284,10 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[num_dai + i].cpus->of_node = audmix_np;
 		priv->dai[num_dai + i].cpus->dai_name = be_name;
 		priv->dai[num_dai + i].no_pcm = 1;
-		priv->dai[num_dai + i].dpcm_playback = 1;
-		if (i == num_dai - 1) {
-			priv->dai[num_dai + i].dpcm_capture  = 1;
-			priv->dai[num_dai + i].dpcm_playback  = 0;
-		}
+		if (i == num_dai - 1)
+			priv->dai[num_dai + i].capture_only  = 1;
+		else
+			priv->dai[num_dai + i].playback_only = 1;
 		priv->dai[num_dai + i].ignore_pmdown_time = 1;
 		priv->dai[num_dai + i].ops = &imx_audmix_be_ops;
 
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 306168b164d39..0f11f20dc51a4 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -860,8 +860,8 @@ static int imx_card_probe(struct platform_device *pdev)
 		}
 		for_each_card_prelinks(&data->card, i, link) {
 			if (link->dynamic == 1 && link_be) {
-				link->dpcm_playback = link_be->dpcm_playback;
-				link->dpcm_capture = link_be->dpcm_capture;
+				link->playback_only = link_be->playback_only;
+				link->capture_only  = link_be->capture_only;
 			}
 		}
 	}
-- 
2.43.0

