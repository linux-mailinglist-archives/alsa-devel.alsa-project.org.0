Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F13EE72F0E5
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 02:20:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6632C836;
	Wed, 14 Jun 2023 02:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6632C836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686702039;
	bh=GcBHaS25lGEJfkAavE7htpIoNLv94JyV+AORIOtE0tc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eEY+LO+2Tbo0lfgS1ozs0aIVWJBNSTqqL6YBpkpMF421P/CKTdx2rFLmSzrDrir8n
	 KXvA/spS2J0nPmCfwjIHCOXzRkCAM4HH7Lwn6AMCUGTmvMPZDyoNibnUESCXLHScsQ
	 E4HITwDVPbVAx/ju5CuguE1YyodwTqdjnVbDmChg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33DEFF80132; Wed, 14 Jun 2023 02:19:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 228C7F80132;
	Wed, 14 Jun 2023 02:19:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F5F0F8025E; Wed, 14 Jun 2023 02:19:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::708])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52045F800BA
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 02:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52045F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oOmQ9dsV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9atrO2Lqd8zq5ZU1WHzt9sB5mcsHu5h23p9HMWH0jDYk1pdVfg89HECObEivytNZHey8bj5/sJCqF4uQyd+5670rFCzi3b+Qlea4Vfga3H+UEK0mPBQ90j5Qb4y9+nvpJ62bkZx5xxEKvKJk1fIDs1CmiaGitiErj9UwTbGFYD//kYcRakRv5Og9PWjgtRyvRYHLHdNMxUq29Jir7mHcgM1JUdX9CWs8VTpZHSJJANa3N0rpF6djxINKMezkbUmNld7Oev9//+6k5fYdE3hpfvYXr+9/2LeHYLIZ1k7uHH9Akas9mMMhWAxqiQC70+CE1e6cZZH/GRbk9em6mLSfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1coBhtUtGNyDCCRinhxlR6QNCLtYO0UYbRExXSwh+w=;
 b=gVqWa/zgg0zf0oudbPPx3NJPLYDFxNfi7BpJidaJxMekdgqgka4EyXgOIez2f80WnjeNAx6GZwvM4IkKnmXlEKgtHpE8KaVg9Y9JGT/NZbu3Ko14EnfN0Pm2D3E5lI8+jeZPYST0X69pYg/gJ+gCsFWm0Il9zfLcr5tFERkaG+YCw9gJyMWRvGEuBxsrQPx2+iu2dwAmJrB9VwcS6qdz66DklQ2qmYeRM6g3Sl2miWlWiv6grzfFYJIwLB1bq+cHtgE1vq6gCXZVB9wU0xAuI+wlHKGV+F7bOb+vapOksws/JfCQ0a2+36szt9Dj0tlt0KzgwS17544HbGE+iw8oKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1coBhtUtGNyDCCRinhxlR6QNCLtYO0UYbRExXSwh+w=;
 b=oOmQ9dsVZ8EFml8YN11uIn8i8YovtynT0mUSZMdd/B8pLaTRnOCJYVUfbu95ItDBK2bdfiuz83JchebxV+C4RdEDLUoifjnq2VC6ZNejGhFxnv77NgVhTxJP1rtjHSjMe4kLWplibaLY+Pzf25sD9k/FZmHh95YjF/oOZkFx6Xk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB11658.jpnprd01.prod.outlook.com (2603:1096:400:378::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 00:19:28 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 00:19:28 +0000
Message-ID: <87ilbqhp4g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org
Subject: [PATCH 3/8] ASoC: fsl: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
References: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Jun 2023 00:19:28 +0000
X-ClientProxiedBy: TYCP286CA0225.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::13) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB11658:EE_
X-MS-Office365-Filtering-Correlation-Id: d53d9509-4a65-4be7-4641-08db6c6d044d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3zPvHuHB2xAobd5coQj20GosTnnbMsb+xqqhL18q8uzoZvUQjiOMdF/y1G3vwxdslEfqhIAY9TFuj+57O8w3PaGX2VKpd3/ULI7VzEAAmb+MeAel5+XGEfnJ+XKUYJYVMF8x35RAF5WgAXb0LRxYVLyMMpKR0gr5NLYSohvTzS1ZESODKjAxmEgYXjx7orwkQ6NT22i7k/tK8J+tSp+KOhhi4VbshWRUU+W9iaudDVi43Kf7w3QZwbwHsDJAnH0l2hIs8ex3/fpr2X+nHRXKttobIwYGVChZ7YTsM/s151G5DRjjEV5EQbBqxE6kOeYIBw5YWuwsbuxGs89sa7QguFcngChUVk7cYBaFg7ZNBiZvLlII//OhfTv7a5wC4DVGsOfm5iN0r08RAw2MRGRnGSsX1NArjSNqOQqEhmN3t+tKfRv6G8adex4sg+GJKqUJ/0+T/822JKkfqMZYsUw+IkIP/ViyTQecM7q1ZuGV0Kpp9imVfFFO5D0wIGmwB7MTF2A+3di7x/YIcNxhXe+av14S/Wx0O1NYtGenz8SHrQXlSfQOBwLJ2javNi+rsBuoFpS252LUJiobEyGG+Wcc3CKJo5eD0T+c0HkPdISpFzkr244W2giVoacJouiJ3zQn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199021)(6486002)(316002)(52116002)(41300700001)(83380400001)(86362001)(2616005)(7416002)(6506007)(26005)(2906002)(6512007)(38350700002)(38100700002)(186003)(36756003)(5660300002)(8676002)(8936002)(66946007)(66556008)(54906003)(110136005)(478600001)(66476007)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1/duMo9RdjTFvBFxGnmCUBbjS9OKnA/JWgdnMEjYStSvqiv7Uyo1roJnrKeD?=
 =?us-ascii?Q?H19pmrsq/GtSxDu+FmC7t1qZNtUJR9ikesuT/bjmxHZK53+r9GEP+p2Tdh3x?=
 =?us-ascii?Q?C+nfkDu3ptejhVTHrifSMLZmImaWqIjImAOhCbGbUvMwfzJgCfCCkH25zlrY?=
 =?us-ascii?Q?AW9iqH28AmDCuXkJSw7/Uqpr2jB35DOUIUAGpjWM/+6wjdK2IjNsy5dA5JZ8?=
 =?us-ascii?Q?GHKbkwvFmidQr5Q39W+f6bxMG1YiDtXPtzgefUpAap5Msh3XXMPxT+WM92sV?=
 =?us-ascii?Q?0oiPgDq0uJX/YbQxa9JVDO4HSXiGEVu6qST5HWt5BtrR3tINnHLFuO/hxVJF?=
 =?us-ascii?Q?/Rat5ThXTYmMFnQDvCI6YbSQMhktG23fLDmuLWls43kJB+cyTo+Cvq6ofepc?=
 =?us-ascii?Q?sPwDePwX/JnvYWfZB9kAWnwA+eUFXWWw2l3gTKWtxy5wnvxVpKjrG41txEwY?=
 =?us-ascii?Q?PSbSM2BnwLpemWSlm0pxRSxtDYl0oM9RmFfIoQnD9UZo2hhNSmO8i7MqnSDU?=
 =?us-ascii?Q?zEu31Y/qc67Lpf/7+e63KS/xOQqqG3f+RhS48WzdTI/f+zB/jRle+Q6q6WH2?=
 =?us-ascii?Q?PGrOS69ASk1ml+7lEzzdwzv8LgjyEo4llixd7pVMEKrLo917z0EOKVauvwWc?=
 =?us-ascii?Q?lK05a2vIUE3c7JgXer9SX5ZCNhjvxz+ZlV7ahn5ZZUEmUYTlFEoflzLSeQ2q?=
 =?us-ascii?Q?b/h+adEqRe/1cFXf1Kn3Qz3Hiz5QeKLmrliivoViqwiNQYFCHvKeMePe2uFh?=
 =?us-ascii?Q?yauN/PIV4h2YMZ9z1zoKal477HiI6i1dtKrWbbh5Sur3+dMbXX4uRAZu369v?=
 =?us-ascii?Q?o0QPG61Za+XbSjKl16o4kF3WgCNckErf/GNISmN6u6BpQ+yWnBQvTm4/08pL?=
 =?us-ascii?Q?Lc/Jg6awIqENBAL7j1Dcf9yVvgK36s30d8f6KvTLE39o8JS0L9Cj52Y+2n0V?=
 =?us-ascii?Q?yIYCbJ1iSmlxE8gE778CR1yk4z9nPYml9gKVz3GefISi9BoDCcMGKbf1tDrs?=
 =?us-ascii?Q?9/N8N+C3FcWyFr+XFUDe8aiMnXWF2Xw5O9tjjgGWTfGJbg9OXVCYflO2j3J6?=
 =?us-ascii?Q?vXA3t9opncM1ulp9BJi39OB3O5a8SMW5pxQNbk/xBE++vR9KHcSfpOQyFK5t?=
 =?us-ascii?Q?MG/xDx7+kduIncv7L+m67IK3EvzmBvU8ALsb3da0cmcusnRWLFf3IUsWpqyM?=
 =?us-ascii?Q?4t/ETWZqQIWSQfSQ1F/JO5shzCaROl9bcWd9OYPC0m4j8aTzS95XbApwbNta?=
 =?us-ascii?Q?9WtgU6/7DiW3g1RbJKdopUiSopPQDpCuyYDAjjsMKwwz8sv6N5vv8lCkaFyJ?=
 =?us-ascii?Q?3IJI8IZCO8RRcMGulQpL0K2nW/ziSr9UMue/ZtmH4oQkjLQYHr96R4xL6DjZ?=
 =?us-ascii?Q?eEDyhNfbqtxSUUXCpW35BD9OD/bQhxjGiBIKCnty996/CTwZ3j3wD0cNsVVW?=
 =?us-ascii?Q?Q8L9vlNNK5GQ2oFdh6lZVS//cFEXuqyBJBO8yKB7zQczTM4bC055cvwPPoet?=
 =?us-ascii?Q?poh3g/Z5Jx9zCebTe6Xc2qiZ1mlRg+Xdx313yPKQb6DkheA86UKTKA9dvLJ9?=
 =?us-ascii?Q?58q9Ff4H2dd4yncm8agrPyLCzg4V5HzlujpHgD+gPqkoCUlHGBpbUc/pe5Ag?=
 =?us-ascii?Q?HD62/OHCuxE1nZOmXImeVOg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d53d9509-4a65-4be7-4641-08db6c6d044d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 00:19:28.3453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1LfqhRJbyu0zpmIeLewgktueq9ibZc0k9fRW8KPOWaC5Qio2OauKHg2FmUX5XcO4e5QVfmsPrtWodSenVMNrQzeQIHPVjgbd9lmFSkSxnqqAIA4JQJg7xS7XVx1AYSUz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11658
Message-ID-Hash: YDVIXH5CSFDPVLMXNKRPW6W7V3HEIM2U
X-Message-ID-Hash: YDVIXH5CSFDPVLMXNKRPW6W7V3HEIM2U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YDVIXH5CSFDPVLMXNKRPW6W7V3HEIM2U/>
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
 sound/soc/fsl/imx-card.c  | 14 +++-----------
 sound/soc/fsl/imx-rpmsg.c |  3 +--
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 6f3b1428a5ba..356a0bc3b126 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -551,10 +551,10 @@ static int imx_card_parse_of(struct imx_card_data *data)
 			goto err;
 		}
 
-		ret = of_parse_phandle_with_args(cpu, "sound-dai",
-						 "#sound-dai-cells", 0, &args);
+		ret = snd_soc_of_get_dlc(cpu, &args, link->cpus, 0);
 		if (ret) {
-			dev_err(card->dev, "%s: error getting cpu phandle\n", link->name);
+			dev_err_probe(card->dev, ret,
+				      "%s: error getting cpu dai info\n", link->name);
 			goto err;
 		}
 
@@ -582,17 +582,9 @@ static int imx_card_parse_of(struct imx_card_data *data)
 			}
 		}
 
-		link->cpus->of_node = args.np;
 		link->platforms->of_node = link->cpus->of_node;
 		link->id = args.args[0];
 
-		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name, 0);
-		if (ret) {
-			dev_err_probe(card->dev, ret,
-				      "%s: error getting cpu dai name\n", link->name);
-			goto err;
-		}
-
 		codec = of_get_child_by_name(np, "codec");
 		if (codec) {
 			ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 93fc976e98dc..3c7b95db2eac 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -96,8 +96,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	} else {
 		struct clk *clk;
 
-		data->dai.codecs->of_node = args.np;
-		ret = snd_soc_get_dai_name(&args, &data->dai.codecs->dai_name);
+		ret = snd_soc_get_dlc(&args, data->dai.codecs);
 		if (ret) {
 			dev_err(&pdev->dev, "Unable to get codec_dai_name\n");
 			goto fail;
-- 
2.25.1

