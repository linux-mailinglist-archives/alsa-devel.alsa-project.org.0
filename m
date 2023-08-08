Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AF6774EE9
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:03:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25EDDE97;
	Wed,  9 Aug 2023 01:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25EDDE97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535810;
	bh=mmdj8CwR4VtCcYckifZuyJ11acs2hcV2GO64oRWFPcg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WJllxZ8D+xTGH6MWNw2pRr7XBCgVWa3JCSnSAq3jnqSEDdfomRDWyZcImvpIN07ZT
	 QnJ28T9My1Q4eo0Z2HxNEfQgcESp/+pGgs1ZZuEQ3KZzm4OgqhvgNfWfa1YNIY2v1E
	 jtij9JhFVLDuYQqoqxjEz6IVe1ZsmGPw+Bxv9eNc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 006BEF8016E; Wed,  9 Aug 2023 00:57:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77AD7F805CB;
	Wed,  9 Aug 2023 00:57:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C35EF805DF; Wed,  9 Aug 2023 00:57:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93DD6F8016E
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:57:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93DD6F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=hd3zpwvi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4ZpFpYD3Zkwr4SsWzXq1x7Z21KTbDxsBHysLRKDGz9W1CWX8E5m/ih/SaB0WJR7V5ZN/gc2u/8+KbkG3A5VW3vyWMUKIVhWHMNF24FWJMRuzPh+nMGSMcodRhBA+ehHFLRrhdLEV2cyAn7eHZYgAtV0TNOsdc+s64UjsvDjYe7b48YCkGBFJa6Pk+i6CHQSiXcjk6GanHbsRKpluIIrTkSmCXad1diketDrdTynaxGv+MG79ZkIq9I82zVjnryy4q64g8FKaLjazRkHNu/rcJZ3SWdrAadbYeGvxIMv7HSi2UDMbZUnSUEoySs7n+6RBt37eS/wH7lDBuKjCPPIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpN3bGHjjyvhawnaJn0eT8kDrHcxSncqQv6+lFhPqjM=;
 b=NzckaXi9CjkgdgKvT/OzOg9L+WGumUt6WMCEFlSo6ic2OrOAzl7AkY3dKdyqziHuv6pgL732LdhMhI0c3Vsue5+2YlTMFNPu8TIG4goXUC4wXqx+dnwPI/09LrBiCJhc+xjwkEO4co8ohCJ5CijDS+5fhWpb8BQdZw00iaSx6KFAcEqqBgQrxRDsfGgUbqSitNIcSPKy4L270ump6DY3c8/q0SCZqKM3aX/yux01iXdQlkeKZx/du14nmvuMMdgw/VRRR1RVVMmteSl2yz5InccRVnwmIMNlk3CUwC/Vu+IGu0QRNBHBKd+yhF+XmnL8aklRYZE61ut6Qttk7gITVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpN3bGHjjyvhawnaJn0eT8kDrHcxSncqQv6+lFhPqjM=;
 b=hd3zpwviQighMhzLY6mm/0fTeAPHRRO1+R2QFvZeMdpftbGFYrTk/Fg/adV1dywRaYwiZXY2h3kK9HD66ejlvrtiYauiWOcL+JU2VNfQweoRxRWUhSgBvNnG8QZxy1qh4niMHPHg/jKRxJkK9EmBKbgdtTZqhxX8ID/fQyeR4NI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11379.jpnprd01.prod.outlook.com (2603:1096:400:3f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:57:43 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:57:43 +0000
Message-ID: <87ttt99m6y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 27/39] ASoC: samsung: merge DAI call back functions into
 ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:57:41 +0000
X-ClientProxiedBy: TYCPR01CA0156.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11379:EE_
X-MS-Office365-Filtering-Correlation-Id: c4865b26-8d01-497d-606d-08db9862decd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pdMf32JvbOJkdrhVPV+lIQp/OSFqVkzGpqAuPESOdVPuv6iXjsUcRASwSLtrdarbIjdLlxc8K5EgV9AGVzdhGmwim3Sxm9sB7EyfWrE62K3xGWDe9lYKd6nI4/gowpPoLa8x41qLSx15Hn3szZ5PGWtdrOdb+b7/pIlVohcXjvXj+qS5PXIi+S8EOq0cuhgLB8hJJ7pB0WOeIZ3SV876kdXb4whitjJ1b3JxjNEFZ3wx6ZeIY3J4NiqVqyYBvA6j543DWFH7enG1laNol8GpFJpqKKL0oqRmaIhlel3VPwnQSI2HXjlu4ev4xzz9ZDxK4LVg/r3GUD5Qx4PFqNPaDlkhtA0VX+tTvI1ephfMCiliYxlrdSHnYfyrf99OUaa4Pe9IWa3czVhot4oCrIct2g888ZUU75ogqrqmMbLCpHQe2jiFhM2DKx5bYU2rV+FrX41W76P2lREeveEX+LD6q9Egb5d0ywPgmIbswBuyqPvBpsKn2ng4u/+ERmRITxkgGznXn1HNuojozjgaEQ/D2+ecfaBIomMqp2MxzNBQn5BNkeJ0DDujMaEIco6RMwkLOnSqfDsRxIdVh5b2J05/6GcPk4MAfelmSYrLNLbTI7NyE1zOMfenlR5q0iaxv/a+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(1800799006)(186006)(5660300002)(8676002)(8936002)(38100700002)(38350700002)(2906002)(86362001)(2616005)(52116002)(6486002)(110136005)(83380400001)(478600001)(6506007)(26005)(6512007)(36756003)(4326008)(41300700001)(316002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T5gUPqMJNa63BVRkXIqj14Ag+YD+x8DuxiqCvB3yl7b+WM5ITC6SvT5zrDJQ?=
 =?us-ascii?Q?YDSi3EEcl6lAg/ID4U2mrKLU2+O5+iTMC/fA4JiOn6MzIKYMF9vTIWaV9ubS?=
 =?us-ascii?Q?l62kR8rGJj19XbgpJcljs//kZN3xviXWxEgnU2LSF8q3+vkXWI12lz+HeRhf?=
 =?us-ascii?Q?KEbSmilJKBUUayIAC/2jyoOp+BrmoV6MWAxaT8hysEEDrbKExX5+TZSMkUy4?=
 =?us-ascii?Q?evap9nFM1AWVeA4TVFIjvxE+wv4ZEH8xuqcR1KxT5krBvqDj+Sdg3Valdaep?=
 =?us-ascii?Q?zMy0QyZLkirf0LSeFrLjxGnnrCOHRnR3vjHjCLfKibg1ZYlAOU3deKy8r3Xf?=
 =?us-ascii?Q?iXgMct29mC69sWLqQ+SNc0VSvMNQdFqnjRWnNVG6IPYpb86m9aDBKo2CbSEU?=
 =?us-ascii?Q?k+6lfHiuofpWvscUeDAJSAPzWS+jE0xfQRUPDgaOBRFVwZTD5q4OxLy1kBh4?=
 =?us-ascii?Q?P1JkMrm+/nwYNkKIu9ogZjWjNvQOXwHySBwZ/iKnmYU0P2LUJfpHsf2MithZ?=
 =?us-ascii?Q?otMvjh9f8zGNbL9W9RvorV0XKHdejoJn7ewtz4oMTcQX7uuaJwa3auTmXM4S?=
 =?us-ascii?Q?Q/yJgpDGq0V6htHIBGnJVIXj1okGpF2AyCa8b2fMiOfVKtskht19c/sTqP1P?=
 =?us-ascii?Q?XgQD8lh30bu5Ki5QMOxTREue29URHPjKat5p9v4DfaxgAAoyJQzsAvRtLQYm?=
 =?us-ascii?Q?wm899FEdtZPXLgZ8yiO8lNO47iJ/lQgFH2FqVea4Alj6r0RdAc95xBIw7Wgl?=
 =?us-ascii?Q?SorIbDFgZKaGOz2rt+BsGVS1GTIB1696ppbscLSR/CWb30dSVrDkbzWo/bYq?=
 =?us-ascii?Q?VbLl8bgWqRYZtGq87FpNFd4YrjGjtYEMOiG3I6OCuSdRP/PWKDWg/tCxuYCd?=
 =?us-ascii?Q?sIB5qt6UI46PurMeEBYdhYtKJHq8adPNyDZlyZ6i1R9YQfWLtfWK9tT0nR58?=
 =?us-ascii?Q?JpxoFuGfBQsoTRlu8oKpoW/HfK+7C0ZHUB9Spc8pzN2sgZ/g3lQjBge0fyAQ?=
 =?us-ascii?Q?BUsNQc3R2LPdFaD2fgm2oe0Eft6YyIJBSQz9ngz28XhKk3lcbSD4coXNdFaa?=
 =?us-ascii?Q?bZjS+RwNZErz2hPPkaYnAWE+yy8EmQukuumtch29Fr5/pcK68J0uol9btCI2?=
 =?us-ascii?Q?9jtmYT0PB+zPyxCOIoxJ+6HWbrzboyUenVZ6ATYPa2Q7zXdabRcCZ6IIIJd4?=
 =?us-ascii?Q?E04hw9a9S5AgtC0VbEoId5Ujk2HfeqZOxU4yRD//HezJsAx1MdByI2ytnlCV?=
 =?us-ascii?Q?zZQjgTpuqXDemJrXYB4RiEeaDUMSec4HkqJhE+MTrBJSAD7u/JG/G2tmZMaK?=
 =?us-ascii?Q?veoRvokjaIOFw4IeFFxAotMwvAxIZb+7rICLnW5PY5NCNu0XTDinxcB+ymnt?=
 =?us-ascii?Q?mwbFphn3QH7X5dx0+uJ7tF1NRdPIrcJ3PxXmsJiwYKLkYx/9zdr3b+gf6ymT?=
 =?us-ascii?Q?A1nS4+3lS+nSVrbrD5MWbBSlZxCar+QDWAYcZd6zEIHDBg73EhrkFu+2khqg?=
 =?us-ascii?Q?X1nEtjrwNyYYdRFdrVXydxYYkhLSau04xaa6dvXcBsJereawzdGkeHv5MjFO?=
 =?us-ascii?Q?SHq2ikvI9hjX82cnxneHaIv8d+CM3H68PPfZ2j8wP3ZqzyI8IzX4D3MlkCLu?=
 =?us-ascii?Q?0mvWOAAwSBGUFMgnGf4Z0EE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c4865b26-8d01-497d-606d-08db9862decd
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:57:43.4071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KOo1QQGUrDiZUHJLoiRE6x1qQrnRfv5wiKEPY5QHK3lso5cRKb1cPBs2o/rAQ+K7Brsx/YpVv7XzNnq9zwSJmu6hE9u8RMAzURlUrbKPdBUHVRrr6Yh9OoNlaYELHrA3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11379
Message-ID-Hash: Y5IDNZZ7NTQMH2PCIJNQNGVSJNZX4TCU
X-Message-ID-Hash: Y5IDNZZ7NTQMH2PCIJNQNGVSJNZX4TCU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y5IDNZZ7NTQMH2PCIJNQNGVSJNZX4TCU/>
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
 sound/soc/samsung/i2s.c |  5 ++---
 sound/soc/samsung/pcm.c | 18 +++++++++---------
 2 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index f3d98abd5f0d..3af48c9b5ab7 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1120,6 +1120,8 @@ static int samsung_i2s_dai_remove(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops samsung_i2s_dai_ops = {
+	.probe = samsung_i2s_dai_probe,
+	.remove = samsung_i2s_dai_remove,
 	.trigger = i2s_trigger,
 	.hw_params = i2s_hw_params,
 	.set_fmt = i2s_set_fmt,
@@ -1188,9 +1190,6 @@ static int i2s_alloc_dais(struct samsung_i2s_priv *priv,
 	for (i = 0; i < num_dais; i++) {
 		dai_drv = &priv->dai_drv[i];
 
-		dai_drv->probe = samsung_i2s_dai_probe;
-		dai_drv->remove = samsung_i2s_dai_remove;
-
 		dai_drv->symmetric_rate = 1;
 		dai_drv->ops = &samsung_i2s_dai_ops;
 
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 335fe5cb9cfc..d2cdc5c8e05b 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -432,14 +432,6 @@ static int s3c_pcm_set_sysclk(struct snd_soc_dai *cpu_dai,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops s3c_pcm_dai_ops = {
-	.set_sysclk	= s3c_pcm_set_sysclk,
-	.set_clkdiv	= s3c_pcm_set_clkdiv,
-	.trigger	= s3c_pcm_trigger,
-	.hw_params	= s3c_pcm_hw_params,
-	.set_fmt	= s3c_pcm_set_fmt,
-};
-
 static int s3c_pcm_dai_probe(struct snd_soc_dai *dai)
 {
 	struct s3c_pcm_info *pcm = snd_soc_dai_get_drvdata(dai);
@@ -449,11 +441,19 @@ static int s3c_pcm_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops s3c_pcm_dai_ops = {
+	.probe		= s3c_pcm_dai_probe,
+	.set_sysclk	= s3c_pcm_set_sysclk,
+	.set_clkdiv	= s3c_pcm_set_clkdiv,
+	.trigger	= s3c_pcm_trigger,
+	.hw_params	= s3c_pcm_hw_params,
+	.set_fmt	= s3c_pcm_set_fmt,
+};
+
 #define S3C_PCM_RATES  SNDRV_PCM_RATE_8000_96000
 
 #define S3C_PCM_DAI_DECLARE			\
 	.symmetric_rate = 1,					\
-	.probe = s3c_pcm_dai_probe,				\
 	.ops = &s3c_pcm_dai_ops,				\
 	.playback = {						\
 		.channels_min	= 2,				\
-- 
2.25.1

