Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B44E73790C
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 04:22:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72C24A4D;
	Wed, 21 Jun 2023 04:21:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72C24A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687314130;
	bh=uHfGZsWQlIaWPXIOISjEx33qMR61fUrzglPCK8bC7AY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WfeoAQyQI8Sj6X2tXOkgm/2TR7spjgQVCBsgn9onD7Wb48+Dgth2fgKX35NeujxSZ
	 eFVi6wwSzpIGkBRyUWtqiopK3lqmtOfRoOcUmEJ1mqYv6Iy4Q8XZRFcd4G89d2U2ut
	 1YFocu3+EABuG8VBv29GfWF+8f26RksAFITa/07U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 513FBF805E2; Wed, 21 Jun 2023 04:19:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1FDBF805CB;
	Wed, 21 Jun 2023 04:19:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27DB1F805CA; Wed, 21 Jun 2023 04:19:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65478F80552
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 04:19:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65478F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=kkTh1BPT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyypSyGpfnj/xtjJ68kLNx0wzxZF4uUPc7begCqGpMl0HkQTKkUr78Pokw9kajCVzGRhQAMaa/f+AmBGWMGZgs1NTR+JQGdY57K0+NJ1x6WJVqj0dmOkcOZo2Lz0lidqA48Chu0tUVvofocx2WC0B71m20YoRR9mPuq0mPY1tfukadoB50mECabLQSF6IKAOT9MOB8rn1f/lm6qFp9skoca29yyURefOGOXF/TkuwDVH7CXcfcCG2cIkQaysOP3W0LJsjL7RQXu+94POOt9L8v6Nnbs+M674tPotuZycl/jDVhdtcVnpcReDZ/MFEVQJJ5eBXpG0QVtbrn258yKL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPQjkV/yUGqOnlH0brfqHlDsVtEbqQhTz6n3QSPRYAE=;
 b=bUGSHWLH6ceul26+17wV1PVsZ6BkWVh7LFpJSw/5C+38hvkObHxnBSM/Okpk7GvJoVPWbo/5pYZRGDhgV0xwUoWeYHbI33db+KouAIRvHaOR6X/bW2tp6Flpca1ohEsbfEAjDvvfKJXg7UKLYgwOlkEjRPwmDbQAQ2774bYCo2Gti4l9gM8tH7eqiI0YNeVNQoCxQ2G4CQ9QWWJgWq7uFV+8gQ+iDQWX4DjJ4J4801A8YYPHQMdbRemLtWID6CFSffwVBgKCxx+Gk6mIJupgCs2g8htd0qEbYNuJMfMURb/i22U36nTXWXFNRmYnHOgpeoi9oztW6BWTdTGUmr4L4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPQjkV/yUGqOnlH0brfqHlDsVtEbqQhTz6n3QSPRYAE=;
 b=kkTh1BPTvZ6zk3Uuu7OhEte3Pfwz2iZNEZK5z38yCE6W92EwUbkxOxUB4ffFb8cH4xlBhM/wp/vqIM4gZv/SlONfJXVOeGJLYgOHOCfFIZchIZo5mOxqLqy/EqVQvowdBX7FoZW8wuQglfU5OtiWVq5PLEfQr1+G5tLVKTaoNAs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9694.jpnprd01.prod.outlook.com (2603:1096:400:230::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 02:19:21 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 02:19:21 +0000
Message-ID: <87cz1pblqv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/14] ASoC: rsnd: use DAI driver ID instead of DAI ID
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Jun 2023 02:19:20 +0000
X-ClientProxiedBy: TYWPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9694:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a456d3-f440-445a-f652-08db71fdec47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qrFSvOHRWwvHE/O9BjF4JvTyehdpltQeCCUg3vBWuNAsOp/SJLOqIbzx575KuNqiGjoGJqwdXxVAiR+CCXpi7/U6yysXwP13d/rZEx+HvKT7S3vIOIHz+/TT3HOqgEPuKplCHRTU6wwwTrG4oN7uPqNhffWwhIyriuz9MJ4xb6Loe8hVDHDQ12DJ8jF2Nd9JeieYTRIqiaTr7dgUYDtxa7YtdQLY1ko6HtqfrYI/trS2xmCcOSrqrwPNQng/qZ/YFLS96q19+/I4qswtEi2f7iuayQUilbyt4n4VeNrjSHx5W1omFQOyRuJQAyn0SLM7t7yqyqQTK2BrNqB6iAdZ52uuqJQ6FyjYWagOxVjv2Kj5ga5lSG0ncuLR7klGGngc8BiRv6s3VK5Kvx7pFjiWlX++NAWUU92UZ5WafKIIJAGWQhtWRTiajYEd0a7Qyyv2Qy+NH5/aNeXjz+qFOla71R18t/HZW4e7yR14GZzDYBN8tN+oGnX67+gfZNqRFktccF6V6rAjPVNCiPhJA53XarbBwnnrI+rhAIYgGOQoquHm9uqnuc9Ow032Cvx4umhAc0md1p/MArf2AlPv7cWSy3RRtQXDkimz6Zkxw+RUW+447EsBJJMvKzg2YRUhlt+l
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199021)(36756003)(66946007)(66476007)(478600001)(52116002)(6486002)(5660300002)(86362001)(66556008)(4744005)(2906002)(41300700001)(8936002)(316002)(4326008)(6916009)(8676002)(186003)(6512007)(38100700002)(38350700002)(6506007)(2616005)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yNV3avVaS27O3HtCYJ2mVEgFN4hwQUzrSGQTcUDF4c3nYQBQjZVmVVcMMsJr?=
 =?us-ascii?Q?lmBH9yL9yXz2wHMr3KOVXOCq8nyVKUQj8i6mG0DePe58GgMBmcMJx1Fw7ADC?=
 =?us-ascii?Q?QBrtuNdDWojFAVjxQDxvh7jeoryRZHhMrtRWDfgQTWqLsWOqh1vcvgepnPr9?=
 =?us-ascii?Q?kBj+7bezFmR01zVwetrye6ezeqTNVW5HA/RuraNpCvGGXYnwZr7VWyBp1PpG?=
 =?us-ascii?Q?TuXxfaa0HttuSLi126fksLRSSdh2ergB0W9U6G8E900LsQcnf2KC8/i0oyts?=
 =?us-ascii?Q?+oPfIWDikjH3LH2mPMyFgxv1AIOc/UHRKUSWQ6pRVSa5UpO4cBGtj57b30RE?=
 =?us-ascii?Q?wyf6lvRWysCb/Yp3fycJZqN221P981Wp+GjD807CVqXqMLINs9iRpHokwOmf?=
 =?us-ascii?Q?BNmYNUWxRcT1Tp3Ie9T2ffJgD86/IGtGa0eDEtkENoQKRrnNs9rGc8MBsDNK?=
 =?us-ascii?Q?JT2gokDdZR2mrprDZYHbpX6fdDwEC3F+oVU1orO1EUZ1JoASIQLSXrIcjVAc?=
 =?us-ascii?Q?ttgNlDMA0M+j1IkASoBXH5zYBemLuuis3ul8832t+5UmNSxkjpRADC6VtP6i?=
 =?us-ascii?Q?vnu0IC89T3JVYb817JzWz0hj1RdgSwTvBnqiFIBaICs7L/E3RkrdEzGMADBg?=
 =?us-ascii?Q?x08xdYuL5urHt0ckmdFGOSr+Tu0M4Pspt5DEAir/HHtDNvIb4+xG/WfLXBbr?=
 =?us-ascii?Q?GblkyAwG2+dvw36nLyCGA5CjKzvejMrWoNbckaDy1yr8xEHjf737fEjYB6FK?=
 =?us-ascii?Q?/tvjTahWj8O7kC4M9609C3NOSGykaMKYgwDRhZ2iQnbgHPeczSgK4DpTPrJX?=
 =?us-ascii?Q?nyU8GQIm0gSD2qZPFaiu4FKmcIkW0puStpn/ScAiCllGWhsoQ3F802E6Bevu?=
 =?us-ascii?Q?rMM2k2DfsPmUYwFTX6nh42tdUHql92Boz+N1x4gulWGlRnWdL+PEPFA/RwDr?=
 =?us-ascii?Q?GVTdFRaFrnYNiDcxMe2kYc8DFxGZOTFZnV9g0FTOU8nVMds4TiZClvGwPJ6z?=
 =?us-ascii?Q?ReyNcdEWFPmZqC08M3HijJipiUBLPSb2UMVFoY3xfwCBUrU82Z0brrgYlw+W?=
 =?us-ascii?Q?QRc2TVJGAEe1Ir3/sCqpqm2Afuc93geEqEfxLqss9bW85qZDmh449ZHgNU4s?=
 =?us-ascii?Q?5xGCpGFasYp0AS+9L0r8hqoc3N/RftlkzMAn9SGvfriBK8Okk21IWzJ2gZvO?=
 =?us-ascii?Q?4UCUWchun6a5TQtDBd/lA39UDrik10OaVno7vYyAiLkbriMMT6eeeOqKODK2?=
 =?us-ascii?Q?5VpRF3CWit1bT/w8LMxIhnketVCPgTngsbbl4VAYrStPF+8eOqtGU8xwhRIf?=
 =?us-ascii?Q?E+K6qdAhGH54on/G1joQfPFFwosb1jjhO8OnXVSboUhrkvduq4Byd/QsFy9G?=
 =?us-ascii?Q?e+HmYIVyxQC3eVNJ/vejHQUv+Vm+oeYmi/pP6i5jxQBiT1krueJHfo1bZtPT?=
 =?us-ascii?Q?ywfb8XThC1q/df4I6WRl92Drw7kSw1P5KRCwaB8ehEzC9xGwhc1/jxZn/D+e?=
 =?us-ascii?Q?H7Sl3XvP8eIYWZ5AA5G0scwARPDimyEm7YQdYgjfsAhKknlsh6ouUaNCburm?=
 =?us-ascii?Q?5pRnhI4B/Sg0KHpUl73r1CFNg6TAvYK6i45epdvei5gcdbBdS3AdK8f9kc2x?=
 =?us-ascii?Q?SWlil2LMMLYuSpymhH2Vcrc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 42a456d3-f440-445a-f652-08db71fdec47
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 02:19:21.3340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2Qeg8SxU+5JlCkQrzUVKMUMkgFoHfJ9v3ya9b8ZnEEm1TnGJH7jW6yIgCWed/795NK0xkNnQ/vIgE0HQeb0M2wGPlzF2WL8TtzZdKHV4CA3Oh2YI0zpLkfpRGnwQ35V1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9694
Message-ID-Hash: N3E6LXJECK6S64ZGXP2OFCUJZ7I35EVQ
X-Message-ID-Hash: N3E6LXJECK6S64ZGXP2OFCUJZ7I35EVQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N3E6LXJECK6S64ZGXP2OFCUJZ7I35EVQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current rsnd is using DAI ID to get own priv data without setting
driver->id. It was no problem for Single Component, but will be problem
in case of Multi Component, because it is not a DAI serial number.

	struct snd_soc_dai *snd_soc_register_dai(...)
	{
		...
		if (dai_drv->id)
			dai->id = dai_drv->id;
		else
			dai->id = component->num_dai;
		...
	}

This patch sets driver->id, and get serial number.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 6a522e6dd85a..f3f17b784025 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1378,6 +1378,7 @@ static void __rsnd_dai_probe(struct rsnd_priv *priv,
 	drv->name	= rdai->name;
 	drv->ops	= &rsnd_soc_dai_ops;
 	drv->pcm_new	= rsnd_pcm_new;
+	drv->id		= dai_i;
 
 	io_playback->rdai		= rdai;
 	io_capture->rdai		= rdai;
-- 
2.25.1

