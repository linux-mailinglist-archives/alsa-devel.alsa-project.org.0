Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F4572F0EB
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 02:21:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA60F847;
	Wed, 14 Jun 2023 02:21:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA60F847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686702113;
	bh=7I2IyxngwOWaqH99UNrfsn1UmhVvcEFgTjp+enRSlHU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uWqxeWTBFwwNhGkZpP0yuBUsinyKv7MlK656L4XEZMmbNlswAfFqO6bRwy7o6fMWl
	 D0zloJr44VJR49X3Atty13lEK0VolFo4g1yh/IabVpYSDqVIV99FmrSgsZbJJ1V16N
	 xRQKEjuTLZvEpEeJ5F6IjbHdLwAGvgcSwSJvTY7Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B7BFF8057A; Wed, 14 Jun 2023 02:20:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E636AF80552;
	Wed, 14 Jun 2023 02:20:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 406DBF80552; Wed, 14 Jun 2023 02:20:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 709FCF8056F
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 02:20:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 709FCF8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=g9+Wa5GN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5FE4UNcIcjQaEevdIhHbewduS4CPuVrK1BFxVhi6NxJGb17yWVK9YZdbENg8itbG3rRlu9YjpuRLQ4dQT/RvN/3qHL8OQYP/ChOfNjsbUUfmTdqZwI4VrSCpgIu6VEtJO3fIHqlU+Igwsmb5GpdLaWKh23HoabhIc7AScY5jARSEMtV1aquftvm2kphXsoS50+oZ3gEOH6ZvdPbCSAZFvSc10i6QRqKXW8/DKWiGtp7BqZhXsfmJ5XRAG54aUhxH6ArYbEcnxE4SsL8x21b7/d2obX5uY1zLjLv9Bx0LTs16peW4Tw+MM8MT1m3vk4bxuLH4irlm9NO1AKNafLDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PmRy9U49Y2o4iYeFlNQ2p/dmJsSuUMQZjXgzyE3kiY=;
 b=UJXwFnawTM2bO9KBAr9zsH5eSPZxTO/s5OT9SZixLb03t1mtA3H+JF5EKrrz/LAFDLqOfn73CxW2JAFsZPupDivPrQd3X3Z1qnoJT/QLZNZeZZPfXmAdEMnT1LgQB9YTjk1S+WjTDX3Wqp+2LTGDoyOkNTtEebbs0chlzkTv4VNSe/dlpkAVqNiRlpi0rysIXrlVE/zM/RM08Ke22W6xm6d5cTjtk4qt8OxCBh76WpILLlkghfRVAwrul6Je2TVOSsBfQSVkWFJaeCws28f3G3bBN/d03G6x6AKAPcXPYgqAy2MJc+/kNkUp9I8XlRTMnpWgVn4wk9AjI5i7xl10zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PmRy9U49Y2o4iYeFlNQ2p/dmJsSuUMQZjXgzyE3kiY=;
 b=g9+Wa5GNmQFG53UAj0vb58HFn80HTn8+NZ30Twu6pgaowW9foRiiGougppVUhsvW8HqjikPjb/v/7l8ldi0CRLBB7PlpCZGEpI6c90Yq9EPo5qbXrF6rIODHwBS9qcUOmwryQFuvyV2xI91F0DFEsJtlMMxE3wyFi5srzoj6uU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by OS7PR01MB11570.jpnprd01.prod.outlook.com (2603:1096:604:241::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Wed, 14 Jun
 2023 00:20:30 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 00:20:30 +0000
Message-ID: <87bkhihp2p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 8/8] ASoC: simple-card.c: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
References: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Jun 2023 00:20:30 +0000
X-ClientProxiedBy: TY1PR01CA0191.jpnprd01.prod.outlook.com (2603:1096:403::21)
 To TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|OS7PR01MB11570:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ccbdb0-ccb6-4257-7850-08db6c6d2987
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T6c4zJf1jFS05FFRHmyLPmfV0QSMYG0GlrDl8DsvGlPDLdkkZMPCveSj7O/EBFEZbmeCtCA1BL5LLesdxsXGOP8pvDne0pA197xnVt5f2caalYSZs870fdu29TeIsR+ao0N3KBPPg1utgCx2cQsvEt2tkix3aiRUnxO51uCjm3mCHtgRKAeKe8BlUCluClV6PecYEuRxr9inNLUXWewCG398wZctlb6KtS9qW/FTBS5K/YqBSTRvPEICiyXx9xWUX1xkr2EaJGUEw4Jn1aJTthOHLoGJWiyQ4M28lzImUtzUDNvc+WwmfYC83dVMcNkFZrrKiDal4Jx3UvAR3kmrMx+H1XMqVBpOxYXF+XE6zKbRRogLAWvWxZ3TlRz9bByJwm+YpkXzRiIjFbEcbl8UyHJz++uP9BDTbDeHKRT2fcXNIGSF2wKPOSgcasjpStZRSRZ5mbBQY1HZLL3y7fQIUBVcVvz+X6EnY6QHFG9COIKYiHDlhfGrgKsdNlqRXDOwQKWjMoSmaae8b5BNMPlMrJXeQdoWvobDOVhzXYfWZYQkG5j8YEGOJlsH5LG4k2c8swrdgsfSag0zCYW6dRQjMCI+sVCLVXjipfE1KE3c2lb9LIDCct5YNprabTnY3QT3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199021)(2616005)(110136005)(6486002)(66946007)(478600001)(5660300002)(41300700001)(8676002)(8936002)(4326008)(66476007)(316002)(38100700002)(38350700002)(66556008)(83380400001)(186003)(52116002)(26005)(6506007)(6512007)(86362001)(2906002)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZpYQ4jdYv3B4+VW8PNPaetEaoKy1yZUOwEedctTWMqxiJDUpuaFWhlnzBweQ?=
 =?us-ascii?Q?+0AC8aQC9xC4Ohxcb8AlGai/Glzl2ctSuqByECd1akOIbseK4SjhkEc7FEjl?=
 =?us-ascii?Q?VOhy5+WUSWeKtEjD7ioZz5LPfOAK6gtiR+ijTaoh1dEYujjhR55pXRzpAW2I?=
 =?us-ascii?Q?gEkxr3/+8eQvvQfseDdHEUW7x1VcnEtXtWxD0wJMkyFNGr391qXvnobvNEqg?=
 =?us-ascii?Q?yDaErnVjvn0x8Xli4juuyC9wc7VidK5DXWi66jeTzCGd4W03mqgVWwfPEnwK?=
 =?us-ascii?Q?bKDMxFSJ9/uMQVsw9e55wEoI+ZLVKPia4dgTk80k9DHaWnE/GT+Cxu1NDbjw?=
 =?us-ascii?Q?nybP94X5BzcJIL4IGvEBgBfUMKqfNVTv5MiMQf077ocPqpYcdL6NX+kITzA7?=
 =?us-ascii?Q?6L9k0aQET6qzcsQOPYsbbvMR/hfb9aino+ZXuw6qwtSthL403e0WqCtaK8+3?=
 =?us-ascii?Q?qAhBJygbG4Efr7L9B4XraTQxEfXtr9TnbKUiOFKpORn74eWUkneOMkFtoE7N?=
 =?us-ascii?Q?UwYskrzHfZvh1ciIneEAGwLj6zUyLTzxp8LpOMARpjE1M7qsVNlhfLAsserH?=
 =?us-ascii?Q?UNCfNPObMUlnTL2NIuL3qE48JlPib1D73GwxNGK01zGuncG1erIBwlzolSj4?=
 =?us-ascii?Q?SaqqkKiyjr9qSzX/ktpmio8y+M+Q7MpVE71EZCvGjWENlgAazOTdLFNC3qDS?=
 =?us-ascii?Q?V3+B9isqHqykVzabvzM6b76SMLlywrwpL5yiKG4crXbEsV4rHdH7N9PT7HH3?=
 =?us-ascii?Q?jhfI5dkIZO+MA6TjySGbDBcpm9IG9s3Q1xGh+4Aw1cBP/FD3Vk318UiildMN?=
 =?us-ascii?Q?sGLmRADCoKKwkcWqzppSjgAb1gq3Ua/QqUwFIX7BlCQ6Rbztz7qOqrZfn8Um?=
 =?us-ascii?Q?s1kq8CtQJoYC8NgYj7xy5bX2kXSgCv4cfQdkU5qKbyvTFqEPVbDhxl9p7cnk?=
 =?us-ascii?Q?5jI79MkhkuHHcAvX0pMHrgA7Wq87jtyUiTecnk0zXduRVXVe84xA6EEBIO7X?=
 =?us-ascii?Q?kplgLiMqlccxNySeyj01A5CQa7A7ijxJcWGy1e5ZFE/DXX9XtQtoMHUMWPRD?=
 =?us-ascii?Q?lth975KeJArSqbCHxm9y21gzqimKEibvfK5sx7JdJqSLDgg+R/SuxdqaNFsz?=
 =?us-ascii?Q?6e9pejunQ+wwlixS3xi6W/jDLtghh+Jfg5aPc/DGpyBP8lRXxOjW+wQYQjkL?=
 =?us-ascii?Q?bISi6eJ/748VhJk2K1OAabCaEvYRnuunuJUXMx8JUZaMDg++7fipHo5U/0en?=
 =?us-ascii?Q?yKezbdg5GjZG8U7uZ4p8wdZ8VWc6Y3FhUEWAQsg1k1icezZSrZTmq96rrZ8M?=
 =?us-ascii?Q?7qiJn1HsnF7/Ta0oOoDFzMAW5wn8nM2GCYQaATLFa4IsgPBMfGDE6t7pdUaq?=
 =?us-ascii?Q?JW/yAUuGyW6giDcUPkKX91roZfse54gshQBZFYSM/+g7Lf1xncmhF+vjHM+t?=
 =?us-ascii?Q?dsG9E2fv/i+eyJgXY936KKzMYqbIpQxgyBww/xg1pcKMF1Mt3OoUJCqHtqGX?=
 =?us-ascii?Q?IUFFALfuoWdFutyiGIyQ/vD6fYVdV3D7FZV/eY+AygZM8kSdLeZZn+VtRSJV?=
 =?us-ascii?Q?74gXDMCxxI9M4xlLD+cppNDpO7x3/+6cml5TDlP6BBdhBsnOvbZpYiINfCPp?=
 =?us-ascii?Q?d2K7IReX8NvSNgOEIyJLMDI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b6ccbdb0-ccb6-4257-7850-08db6c6d2987
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 00:20:30.9050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 i/LtdW1RAuC2BULVItBvDW/rrwaAql6X3c8fuLpwkCIBu7Gn1e4qwTIM1+ElRY7fGaFkSRKSr0TZCYMv1G+DBgkWCvQptz66B23PUrhrwlEa8CUo6i+3fjwr6Q3PEu/8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11570
Message-ID-Hash: GOMQK7UOLHL2PLOUHJKSPJP5ZPCLUZQM
X-Message-ID-Hash: GOMQK7UOLHL2PLOUHJKSPJP5ZPCLUZQM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GOMQK7UOLHL2PLOUHJKSPJP5ZPCLUZQM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC has snd_soc_{of_}get_dai_name() to get DAI name
for dlc (snd_soc_dai_link_component).
But we now can use snd_soc_{of_}get_dlc() for it. Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 4 +---
 sound/soc/generic/simple-card.c       | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 6a3c9e4e1cfe..8ac8bc358a17 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1109,14 +1109,12 @@ int asoc_graph_parse_dai(struct device_node *ep,
 	 * 2) user need to rebind Sound Card everytime
 	 *    if he unbinded CPU or Codec.
 	 */
-	ret = snd_soc_get_dai_name(&args, &dlc->dai_name);
+	ret = snd_soc_get_dlc(&args, dlc);
 	if (ret < 0) {
 		of_node_put(node);
 		return ret;
 	}
 
-	dlc->of_node = node;
-
 	if (is_single_link)
 		*is_single_link = of_graph_get_endpoint_count(node) == 1;
 
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 9e1047b46b68..873434edd2a2 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -89,12 +89,10 @@ static int asoc_simple_parse_dai(struct device_node *node,
 	 * 2) user need to rebind Sound Card everytime
 	 *    if he unbinded CPU or Codec.
 	 */
-	ret = snd_soc_of_get_dai_name(node, &dlc->dai_name, 0);
+	ret = snd_soc_get_dlc(&args, dlc);
 	if (ret < 0)
 		return ret;
 
-	dlc->of_node = args.np;
-
 	if (is_single_link)
 		*is_single_link = !args.args_count;
 
-- 
2.25.1

