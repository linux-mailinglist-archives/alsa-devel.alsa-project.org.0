Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B0172F0E8
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 02:21:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CC81850;
	Wed, 14 Jun 2023 02:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CC81850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686702069;
	bh=TKMcsJdjDct6fxgU3yrn2J1Au9docZmnkPHOF040L48=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D5n+MrgIMKNfHFkdBbDNFp0913aGI8OY2P8mI5cnYRkSZj3VcjpIePQUgLWUp3vqi
	 DDiygDkhrYNPdpgzfXNMVLhGbB1H+BNiR9c2i0q9QUqDQW0QnONiUIyPNYJkzCc7MM
	 8rTUz3pO6bxEFbOkDrU1J8p8iS/LYqvGnjRAkUdw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22BF1F80563; Wed, 14 Jun 2023 02:20:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24093F80533;
	Wed, 14 Jun 2023 02:20:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6039F80544; Wed, 14 Jun 2023 02:20:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20706.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::706])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1495EF8025E
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 02:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1495EF8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ErrnQ7sH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6Dt2JH4H6rnFKV5lmDhMhvryQN5Yj4oyuJzV5YriFdXHkppOh6JH/jreLLJrPTIGoR1GASjAanIyycWx0BpcZ84IlLe6SUY0ZekiSg3/8bJsbDmoNo1wgVzdcwwkvK99mJrq6EG5Tbh3fBpAQVp1/6MwP7ZzkcFwrB8QJD8ZeCR2kHrdaUbIXe2HrRvxYcgkMiWQkmi8ytPmM+FFlhoUcVsTXfWEUHtvHwia4elfTmd9WklF0nK1BHB85Y7QyhhxdYpZtI2CBfCCFz9SeCxI9KHVE4aBV/pWnAt7njLdxHUGt3SOCqL9Ow/FhY+BDBisE9TqgYwKD+d2G1xj/QDkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPkSwybPvWp/m43idPntF7ZIzkj+MnuR1p14B9pv4T8=;
 b=cw0t+Amm0mXetuFkAwOxf2SNWlcX7sC2UzgmLcPepnMpdgn2Yo5kkgH1bPFZY+PsRMUwoybIu/DRGxdTi+tz6MnjoYGf3pgzp1cgesk2k5NLtp5P18BYkg+fRR9YZWQ+z1MYKiSTxMtzMTdwz17A9OslHRpHWmzQjaxVkxY8PholPpkvLx1Su4M1+8H/GNO640ftoTd48QlkohKnN9MuUQmmugUicB2jV9RtkZnwCF6tkTB2SUKoWZxLqjS0CiH1S3TQ8KR4fFmqeFgiPeDaUuGEPIAbXRiLcOUdWfgfmDyZGBzbfZN6vonD+n41mr/FSJlkiI+Wpk+I5FtQ2AL+FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPkSwybPvWp/m43idPntF7ZIzkj+MnuR1p14B9pv4T8=;
 b=ErrnQ7sHQfr7lqKqpI8SzSB68zALfo1agXtnBRAOP2j8nEZYqOTsOVogU9XKq8F/Q2G/fBYDXGCRGBtbmwgBUqCWmS855HHGZmLxbK79Lp6EjMGTJ51MVFQSxeCacTwPkc3Lt03ITsbzC1g/Ce/FNgZXHH9CI3R3+jYEoUVi1KE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB11658.jpnprd01.prod.outlook.com (2603:1096:400:378::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 00:19:57 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 00:19:56 +0000
Message-ID: <87fs6uhp3n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH 5/8] ASoC: meson: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
References: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Jun 2023 00:19:56 +0000
X-ClientProxiedBy: TY2PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:404:56::17) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB11658:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e50b83-207d-4c0a-36ab-08db6c6d1549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lbbChOUNIsE+3yyCieCsAK8oiJjRwnLHvhXFr1Wa4oUbcouy6XKpZietp5ssshK6WHTmrYB24/NWzd14cHiMshkLdx5WgEQkMjHhtuYB1RDIlGJybD41505Tvu+h1iWOY2UeNHpzEBcP3thAEDoCuvMpqEXKH9lJLc/16qNjX1LJ32ozVsgEhKysulrAZAKxzYBQIrfN+30q/ANkYAAr5W1Fmm1BED/n6fPR92tiQ01hVDKRppPxVr39QFIqoiNESkZqoLWMGXGFfQUIM1JHoRqndFbPg+3ue/mV/qIkoNRx0qXMBcueatj1aR47bVy2kTO+cKqFBQkffWOd/QHyX55R902NbAmsugjaVSp1uRzerQ8IUz+dTK8xJSY2Zd47xbJxRhJ6I3yV7xjTHLbonab7HoWDTB/SbZdBVhJmuBPpEDCHps1s7Zim2ynLVZ4XtXpOKf+7/6M0tlgEzcY07yrLEfz0/l+joYPkfcLowlY7qbW4if1t6Hb2HAgSxQPqKICPyiMltgutyHizfqd8kkZsefKldzz9f1WfeZrHWOuFB/zBR3mvUxKA/pGnUOoIp8lbeFB0sdprub4iV4Ehiob3fpB/cj0kpIK2fosGe6wK4qdWELP6Dc8tffgoGICm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(451199021)(66556008)(66946007)(8936002)(36756003)(8676002)(5660300002)(478600001)(66476007)(4326008)(110136005)(52116002)(316002)(6486002)(41300700001)(38350700002)(38100700002)(186003)(26005)(2616005)(83380400001)(86362001)(6506007)(6512007)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c4B45+wHNkzM47qf5u/F0NknXaJMdGXi8HuR4PRrCGHJ8dQG6eSVKvLyymSE?=
 =?us-ascii?Q?OR+v55eSwb8Ew/ue69McI3FkTvsENJoVkosppvo7HdeQuFNtKk7JQOA0cPoq?=
 =?us-ascii?Q?RK/vx6RrhysLLyY6cZRw3IWTgA6wBnrmlT5j5oQc1sRx90kCQQmNQqAq/fyR?=
 =?us-ascii?Q?3qG22d5LpOPPZkZhmY/hE+ZePvnSJI3BaOp+YsPXUYwSacayD0MwjC5wESyV?=
 =?us-ascii?Q?CE7QnlbKMVmCyZ9DbXIrcKlbdbQjn8AHElDi+hpJixrxWkCE/BnNkRKjx2n6?=
 =?us-ascii?Q?8wbdljC0YKZTI9+QyxS70T8Bx3jK0x77w1ScNnPO6xKZvW6mtk/W/iQXSRMN?=
 =?us-ascii?Q?o2SfgVAfrmLOvg1f+7sZuV1Z1VHvy7dsxBw5IG5YDzwuWQJ0bu4cw//ktA51?=
 =?us-ascii?Q?ht5sff07ftInOdaQVkp6JTEvNYremYq22WyiJtp4eMUaCCTgfbPLIOY4T4LY?=
 =?us-ascii?Q?bd9kHVJrM73UQ1pKjS0orWl3BUkqB9aOdvjgqfzXCJkWb/wgNxcT2AQFX08f?=
 =?us-ascii?Q?XScJXkHro81rvY+ng1vSjEap8ADeAr5PYeyTrvAoVfc/WcSFnPouJQfv8j0t?=
 =?us-ascii?Q?MedNPLZsHRdhE1JiPNWrajFeQXH8aS/vgZzpRGyeHpHpMEfiu/+sOu27z6MK?=
 =?us-ascii?Q?x7DaYXsoDJEr95y2nOLIIudfMiFKQmCIww27N98IXAc9Z/CKiXywi4uAWfrd?=
 =?us-ascii?Q?BEEqc1Hsk8Ntl3oeZzqI3BklLq8hay5vHZtbIVi0tw/NzRnrc1jQiPLdbZlM?=
 =?us-ascii?Q?rR4DYSn7v5kexSUUqOnta1aTlwVCXKFqoK32iG2h7T7cgX6LGJSXXt5RdhWp?=
 =?us-ascii?Q?FEfrpJe31ZHrhSP//6lKjt+fux9apw/ws8Sr0u1OfyZOPpVI0WzD8M3iCr2d?=
 =?us-ascii?Q?DtW11rmibUYY5xe0ZKmyzHm4yWaZaevgLWv/nB7iSs9+NznZbj0t2MJGnwK/?=
 =?us-ascii?Q?ZxQvEoESnW1rrjQ9tWGz2xJ2/pbjki6tiheivM4O5cpmw52+b+NFKsjPS9oU?=
 =?us-ascii?Q?J0qlV1ul7sixC+cnm4HpeyR0UmTuLV0JreQsIRLpw4C1ybeGwDMxB/V4o56p?=
 =?us-ascii?Q?zc0QuLQtdlOcu0QesuhQBTFvmH7gQLkYzxR9cTfFE1KcgekMpk8Na2F4Mxe2?=
 =?us-ascii?Q?HhkaSHrTGpwg57SLpW45QbSKHnoqqcNjfJrKUFQVeEzARBPatxpyZ8TW0eRJ?=
 =?us-ascii?Q?AuvwPaB8G+zItcq8s8UCYC5CJhoQUXwFvs8oyNeV36c9OcJAzoOuHgIhbulf?=
 =?us-ascii?Q?RS7U/Uy/q5iBQiXnAafh9H/pLv7znl+2cZcuqeSRHlAepzufDV6vSjj0qvf8?=
 =?us-ascii?Q?VefsbwXq8gAaUoeTE67Z+W9PYq1xiRHLlpEj1vC0WHJdBmZ4rRskrONI3Ijt?=
 =?us-ascii?Q?gHOSrv5WqG3Y6hzwtXzN218Z9tPOWT6UCV/Eetd33FAQ/ONZILio/H5qBfuH?=
 =?us-ascii?Q?DC4Eav6GWr5gn1Dqn4LZDroa2PlAIVpt39JYLP+JvTkU/toaiFFZNJNGembo?=
 =?us-ascii?Q?GnGVp8CYUhTIbYY/VWC1rTyYgcGu50ItvYJaUbbwGM6CI00LY3MJ+z/Ga9Jv?=
 =?us-ascii?Q?lN9ruDrf+UFu3R2RwfG8ST4W6M/Ejpmu/oocFPwx07U8YUX+w+UE66gXDyAi?=
 =?us-ascii?Q?br4acn6RL2ZuSmzSftY1hMQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 19e50b83-207d-4c0a-36ab-08db6c6d1549
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 00:19:56.9237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 e6FI5TpVitDSuKqb4ROa41WHdpcrH2d4ObIHA+y3B716B4+XHxgAaTQxQIU6rrohVg031yAcFs2VjrQjo3EJOzkfJXYJf50HoywsKgWMcOgpMRNOiOK18/amvPUicbZh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11658
Message-ID-Hash: 6OLOMLAQRDERS4VG5K7TNVCXE2Q4O4ER
X-Message-ID-Hash: 6OLOMLAQRDERS4VG5K7TNVCXE2Q4O4ER
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6OLOMLAQRDERS4VG5K7TNVCXE2Q4O4ER/>
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
 sound/soc/meson/axg-card.c         |  3 +--
 sound/soc/meson/gx-card.c          |  3 +--
 sound/soc/meson/meson-card-utils.c | 16 +++++-----------
 sound/soc/meson/meson-card.h       |  3 +--
 4 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 74e7cf0ef8d5..f10c0c17863e 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -319,8 +319,7 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	dai_link->cpus = cpu;
 	dai_link->num_cpus = 1;
 
-	ret = meson_card_parse_dai(card, np, &dai_link->cpus->of_node,
-				   &dai_link->cpus->dai_name);
+	ret = meson_card_parse_dai(card, np, dai_link->cpus);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 58c411d3c489..a26b620fc177 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -90,8 +90,7 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	dai_link->cpus = cpu;
 	dai_link->num_cpus = 1;
 
-	ret = meson_card_parse_dai(card, np, &dai_link->cpus->of_node,
-				   &dai_link->cpus->dai_name);
+	ret = meson_card_parse_dai(card, np, dai_link->cpus);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index ffc5111f9e3c..f7fd9c013e19 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -74,23 +74,18 @@ EXPORT_SYMBOL_GPL(meson_card_reallocate_links);
 
 int meson_card_parse_dai(struct snd_soc_card *card,
 			 struct device_node *node,
-			 struct device_node **dai_of_node,
-			 const char **dai_name)
+			 struct snd_soc_dai_link_component *dlc)
 {
-	struct of_phandle_args args;
 	int ret;
 
-	if (!dai_name || !dai_of_node || !node)
+	if (!dlc || !node)
 		return -EINVAL;
 
-	ret = of_parse_phandle_with_args(node, "sound-dai",
-					 "#sound-dai-cells", 0, &args);
+	ret = snd_soc_of_get_dlc(node, NULL, dlc, 0);
 	if (ret)
 		return dev_err_probe(card->dev, ret, "can't parse dai\n");
 
-	*dai_of_node = args.np;
-
-	return snd_soc_get_dai_name(&args, dai_name);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(meson_card_parse_dai);
 
@@ -160,8 +155,7 @@ int meson_card_set_be_link(struct snd_soc_card *card,
 	link->num_codecs = num_codecs;
 
 	for_each_child_of_node(node, np) {
-		ret = meson_card_parse_dai(card, np, &codec->of_node,
-					   &codec->dai_name);
+		ret = meson_card_parse_dai(card, np, codec);
 		if (ret) {
 			of_node_put(np);
 			return ret;
diff --git a/sound/soc/meson/meson-card.h b/sound/soc/meson/meson-card.h
index 74314071c80d..a5374324a189 100644
--- a/sound/soc/meson/meson-card.h
+++ b/sound/soc/meson/meson-card.h
@@ -39,8 +39,7 @@ int meson_card_reallocate_links(struct snd_soc_card *card,
 				unsigned int num_links);
 int meson_card_parse_dai(struct snd_soc_card *card,
 			 struct device_node *node,
-			 struct device_node **dai_of_node,
-			 const char **dai_name);
+			 struct snd_soc_dai_link_component *dlc);
 int meson_card_set_be_link(struct snd_soc_card *card,
 			   struct snd_soc_dai_link *link,
 			   struct device_node *node);
-- 
2.25.1

