Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D19DF774EC2
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 00:57:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21F9586F;
	Wed,  9 Aug 2023 00:56:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21F9586F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535465;
	bh=iNVI1dNqTjc5N0xITW/zwh9tQmCAC84TlhF5MpFTvWE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FvfdAcba+FmJF4XDl536YOaJzz09e+DJKGBvdeyoaAEZPkobURgLCQAwqBlkRRpMW
	 tHpRsesTZCDIzsiqF0/KbEzud54Mlmb7EBobxUZ67rHFlh7wdQp1hhe2k8eymR0iC9
	 XBylyS2n+CVJ06LnG8aFa4gVqvYYKrQNyTNDRv88=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02245F805C3; Wed,  9 Aug 2023 00:55:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A92ADF80134;
	Wed,  9 Aug 2023 00:55:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1A18F8055A; Wed,  9 Aug 2023 00:55:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3AC5F80558
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3AC5F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=LCyWLLU6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHp4aFFksRsmgO/xWX7ZREomhv9buhMqKwTS+swukcPGjR0hAUMyAlzHzvuOFASckGPu/mpBRrf2tFYFd1bB9abPbCvZPORJVlsYQhmMn9o1ZR3pIP6tBVN9iZ4cVp8IZQQQ0YzO0Q8DHjgCC44cOq3UkChOBUWiVXUrwOEPN7I2yXD2/H1ZvuWZ7ANzEYTW6qryAAYzp53kDTKlCVBxlFXfK+MlDWKtowBrFeMlu4Rg8nLzM/A14vxvW1mVjPZQ6xREN0vfO1k3hAZl0coy4aSh3v4Ps94gfPbLPtrmGlrrFhT1JHT1wccVDcWqi44j2XG7ffeskfBHPQ6KxcgDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/MCvqKgI3bH/KOHsGb7w9iK6nl1X7wsNOWp+wg1B+c=;
 b=SjbFzVwdsXFaySIswa4D/R7i55OsmFrxPHtediAV1Q+bGx2OzPpdrVjd5Ogsz0JBo+AHLNROEA4yc5OtcHawBNu2962AOaKk+mxOIPgr77RluB8aEovK5c7q/6fS5i0slMg8BpNhpUOxxcFQtkXHescXtcYfkcUKo4JWt/bsJzRI5tN7syWkQy9biHgWYD+GdwEw0+S5wxfjX//W56hF6CNHehGdwzqBliZU7TFla+TDVHqYhdQi2jiM94w0o6Xrdz3sA0y+9knUZ4hT81UScLJwGzH6BVBfGOJf0BYLgOtyMr/XcOpsKEJqXhKm2Z2GhxACgH/Q7m+B3/Q9Rn3geA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/MCvqKgI3bH/KOHsGb7w9iK6nl1X7wsNOWp+wg1B+c=;
 b=LCyWLLU6fWovQ1E2S+oMuBW0FcVYTWWGm2/Try0+6o4WIbanXfgYnEkXXRCo6FOhspxzWGFxfpSZv3e6D2gPNorsCmP4p8n3B8LKc7w+uTvw3AtZopSLyL7Oa5NwuvlSetfrp203xTeMUXp8SE2go5dWNFtJhixqzn+WlgDQPYs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11969.jpnprd01.prod.outlook.com (2603:1096:400:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:55:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:55:42 +0000
Message-ID: <87msz1b0uq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 07/39] ASoC: pxa: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:55:41 +0000
X-ClientProxiedBy: TYCP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: 88efa12c-4e30-4bcb-3109-08db9862977c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vv77gu+3Q/EFoICcJRo3t/fjSAxgSi6z1NyddoXAIec1J37bjnlwrsOE421lW8BC1/G+QNnI++kOXeS5An2vAtJHBtV8VDqbj0i6l+PsEEeQOJ2JTDnhJrah7bWr1GfhU6Jn82WeSj4iPWC017NtZPsh3WH/TK2aNoxqeInqInqvw9YRgCmNLbz0It2ewQ8knChozLLLye/jShVVo8U0I5SS8vhmhDru2sBUGDsxuM6ywMU09R1RuDfBIZGggGQF5gGR5X+24MG0IDHco0rmYt5Q1UFSWz7WaNBMV/GlLz7hyiDAyXj92KSaZzyzjZijhdZswy0Bfb8n4+xvW9tr+4vZEKgfGMWqCDdduuaGnA4b/6BGNWBrdbHBCdh7KTvvnLnQYOOxuJ294NWPES/BdQwDn0KH/Su7TOZ89xzgpJhXJl9rZAeOJn+EquvSOaB/p/Ls6YxLPlFtl2Y3UtyZAe6Ym82AUQussUtIPIzN+AQ4tDv6fzbyy6XbuPEolX3zyzXAUYdxcIxrtQS2mQvR4E7qAO3fdhYTU3AOBVznKAnwZFIB9hbvYUFq+7c7Ji3x5yWAqGJispnRbxlzuaOrIhF6xO85hbR5iZSggyv6jPb7pOgbAc03IFZ5R1EMfrWvp3TCJfscB3ozXVn8bWF7ww==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(186006)(1800799006)(2906002)(83380400001)(4744005)(316002)(2616005)(41300700001)(86362001)(5660300002)(26005)(6506007)(8936002)(8676002)(110136005)(6512007)(52116002)(6486002)(66946007)(66476007)(66556008)(38100700002)(36756003)(38350700002)(478600001)(4326008)(41080700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4qZYI2uhlindUQIMBqqi2RUCKIrlHZux5JrmyfGsFKSMttIvI83bwyOli4CF?=
 =?us-ascii?Q?QHi3PPDBZ+hkQI2uBCPOTraesLnhxEAotPBImQ4Ur8rWE6nbPJlVbYGIR2Hq?=
 =?us-ascii?Q?4u/cEctFNsMdttEiJMn+wVfRDh8ZxyPZo01BHnJz5Q2T8DoDuHQ+VO+B7MzZ?=
 =?us-ascii?Q?rQttL+djc0B6u5qoXjOEe581hBoFmrGcbsywQU441Y/mldVhE6gZfbhibt5g?=
 =?us-ascii?Q?VUgZj1ACCZE8EjITWCc87vydFKs94O3vC6+lbt0b9NBSMvgcxHzzkZF7/89F?=
 =?us-ascii?Q?0wMdWmYAlz6BqAMeEHubDuSEa9lVvOr3hC1GL7zvXgEGgceQJZYy2g15fr4i?=
 =?us-ascii?Q?vv4QA8o7wG8oZATBVTu4+rbwp6MTzTZOAjYH3/jQiHBY9R3nW4rr+c1V7iQK?=
 =?us-ascii?Q?HmNmBXZdcoyngca/ccpvEsMEP8W4E2TC/eK1FUoIWOnQbPN62JxpGanrySsU?=
 =?us-ascii?Q?VVfgGw+8r6YnnIDfXiaDnyCrcb1lkYp+MnO/Luk6vVnvYT2L/SediVgYYgW5?=
 =?us-ascii?Q?jsw7DS3dux+t2KYc7Z0ddwRe8XSuIPRQOSeJ6aCoZPzSFpq6Y9k6TpXgqiI8?=
 =?us-ascii?Q?gy0w2EdkrgEppQYAxW5rblpAU40W/UGp4UuAi9Mknu8Zzm8Alk/nwbMVET7w?=
 =?us-ascii?Q?g6GihaLlGbxROEGhmcShsC9fS7biZXks++jsPowvTQqXXxMd6XM3WxicAAK1?=
 =?us-ascii?Q?yyzTcBXFvwaSsHGGtNeAeqXZNnPdh5pOYmXTNItYedpntZX1LayFqwmACTPu?=
 =?us-ascii?Q?JldFNGUxuzoCphSDYeb3QmSbhuZvOrggs7dOttLiib9h5x6kknasDQ/m24+A?=
 =?us-ascii?Q?YIGQCJDsjwrOrHlAD2Rk7101Jenm+8bC8QyDbivJD5FkxYQ4cz9O/ZvxRltK?=
 =?us-ascii?Q?mgHR0oaDDtwPE8mfw/QHBBd96beAPgQkL8yoNKUS9ssxRcjz7RZBPDN6Fdmo?=
 =?us-ascii?Q?3bNRSG0a5NVyULJ1P3YdXhy2rY0fTwEZ8l2c1gwmWKb3HVFZCED/Zi+rx0tE?=
 =?us-ascii?Q?mJRF5tIPDUNJvrhg5iVm/TkjDO6m9ZAY9/ZLpDBGShSAB4dNKLvnyK7PrHhA?=
 =?us-ascii?Q?VdQfvcAbzHS0v1hD8xDfB6ol3lUZI7N7ld6UaafnBAqrO4SDzbaxuAYXWe7a?=
 =?us-ascii?Q?9q4NWFirgvHEyfgewFoly1Loh/pLvXnSludkgJ8f/MzTc3mvOW5rrkxzffBg?=
 =?us-ascii?Q?uivQrWGizcZ+Y+27icpxQ1mmqQENvsau6h+fCyhV1z+w36IeBmjpMWHPGGDq?=
 =?us-ascii?Q?22/PeMWbqYNLtUU8XD0sF4D7+/Odrw187sr3gO63nQ3dz1byz0PslL8XpXMj?=
 =?us-ascii?Q?c8DKfhGpIMkUCoKdcpcJJYa8eUb8Qs5DkyoLTx0D9vNtU/Pye9o+pBOFzbCj?=
 =?us-ascii?Q?z654abHPq/FnVOSIWMP2R6HMAaKNiP232OzlbBFjqzhPnTjJ+kS48ePiFXce?=
 =?us-ascii?Q?7VBrmuhi40QYPKKFmqjk3F6v65HYVBhkqc0Vio4cBwcFc1CN64R81xFqtGUG?=
 =?us-ascii?Q?HUjTG/AiMFrcRmYfLr+B3xNPQXwSrU7g5CGCM+O3v7HGL/NbDykYyPp6ASCW?=
 =?us-ascii?Q?P1pfSHQin0u/rbram2wF+1z2kL0WhgGP9vqEOVzq1xKabof57L951s360eeB?=
 =?us-ascii?Q?UhYCYsByjpA0vBFz9Yy3Kt4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 88efa12c-4e30-4bcb-3109-08db9862977c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:55:41.9959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BPhscQ+Rbpmsauv9n/06GbNDxOPbaBSuieE0oiigDu7ol++C2+WQ01+n62T8M5mj+ltCLgvG07OR00Fh8QgwWtruXFoxiUS/smnxnNd+1jbuZ8piNtJiJOO6MNLuBGlJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11969
Message-ID-Hash: PBX72IZZBEH5GCTUMHOWKMOQPLEVHXMW
X-Message-ID-Hash: PBX72IZZBEH5GCTUMHOWKMOQPLEVHXMW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBX72IZZBEH5GCTUMHOWKMOQPLEVHXMW/>
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
 sound/soc/pxa/mmp-sspa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index a1ed141b8795..abfaf3cdf5bb 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -340,6 +340,7 @@ static int mmp_sspa_probe(struct snd_soc_dai *dai)
 		SNDRV_PCM_FMTBIT_S32_LE)
 
 static const struct snd_soc_dai_ops mmp_sspa_dai_ops = {
+	.probe		= mmp_sspa_probe,
 	.startup	= mmp_sspa_startup,
 	.shutdown	= mmp_sspa_shutdown,
 	.trigger	= mmp_sspa_trigger,
@@ -350,7 +351,6 @@ static const struct snd_soc_dai_ops mmp_sspa_dai_ops = {
 };
 
 static struct snd_soc_dai_driver mmp_sspa_dai = {
-	.probe = mmp_sspa_probe,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 128,
-- 
2.25.1

