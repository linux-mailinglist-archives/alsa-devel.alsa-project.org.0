Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 322E06E55C0
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 02:24:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ABF9A4C;
	Tue, 18 Apr 2023 02:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ABF9A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681777480;
	bh=Rg4IMg9HSQc2Sr58+u9l3fWjEPnlBoiFdfeVUui35Ws=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iCP/HggSG95mdgPYOZ+B+UUMfaoAwlWyNf5Uc7szbTQfae1miC9ggLqA9pGMDjFLl
	 dLzTnHA0ccu7pwXmtt9G2wCfjWi+1fBURMBnal/+WW18OOL7KFx8t9+o+BJ/to/S3F
	 a3t9jMMGIkyNFUdTlUbqxy2/VlnxBeSnD3j/Vg3k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0102DF80149;
	Tue, 18 Apr 2023 02:23:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59578F80155; Tue, 18 Apr 2023 02:23:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35EA1F80149
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 02:23:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35EA1F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=kfJkda4N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbW4yvXXHgs0mVdXYPxhSRYuZGTfu7B5ry5u4wMJ2A3ZVyW/gwbCy8qDQh22WZhITkNCOYvYqaEemDeHYNvKG9CmPjx4tBhsaPR520Z7pybmLvVA4vRByGtBPxaNd1v2K1AxmHuT/hGXtzgabo2hmHoyKb+IvkozSLeRuPKOvNxEU94HTH+aykdyv6Oh1EqtAMsVAw+y1YCzSH5SvMcs9sI8DShS/yemGEJOWd5gDA2cxYLOXWUQSYayb1K4wlbN2OEqs4+3QLMlD5tLlJBWn6cXlBn2GDCDBIjoO0WfPbOx9bJrn/VzcRDrf3A5Ulue5v2C9qo/0NdEVPewOHjE8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGdsGLXilvyRuqIfhQ5sQ2F04f/JwMzcCnoqTqDCXB4=;
 b=VVi3LJNAFk/GwxXoqwBw4t+ygIBrybt1z7gOkHI2yGJmVI0hKl+10CpJm36IQyhisk52tT/QX6M7yO3S5NavJHV+N5syh1q+2LGgvBrKrcabaGNxwUFuzI6+WbxOzefDjl9I2fGQzHEDXUAta9YcaBOjotKA9rzkHgD9ODnSiIHvWgWeoHC20UtOqkGxRoMHNetAZ3pjLVAHlSwRElpbhQdsSKf7/t7tBm/vmvn03PBlMIAc7A2/Lj8SnrqN14JEkkaVMuXoZ9DH4iU9+w9HUy3+22dMEKoARdzT9INhpUBEVMbR+j+D2JW5nu0mF/cW44AuUKXMMh2FyME7XlXY0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGdsGLXilvyRuqIfhQ5sQ2F04f/JwMzcCnoqTqDCXB4=;
 b=kfJkda4NNwEPjvFgJTcUh6nR35CUAPnDmtcv0iSoi6bu8j7VukczTH2N+ww6opxAS+EH7PLVU6K/gwKJeH6ynk7AykUSF5dHh7ZdDv3yUvywBi4XKZ8AuqPRU4zj7OPPUcnfYfGA3K4pGQHiUarTv4iZypCSuKs37fsWYMMxrkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8855.jpnprd01.prod.outlook.com (2603:1096:400:17c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 00:23:28 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 00:23:27 +0000
Message-ID: <871qki3uo0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
References: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/11] ASoC: simple_card_utils.c: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Apr 2023 00:23:27 +0000
X-ClientProxiedBy: TYCPR01CA0086.jpnprd01.prod.outlook.com
 (2603:1096:405:3::26) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 08558188-6435-4446-6d07-08db3fa3217b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BHUQpDnwE7fpbmIsHfGzmdPuEyHokas2Mhr3g9fOwXQAClFG7HihgkL3gB3LbNhCvnTphmISQ/fvUrd3p5kWCsdez8Hdv4ol8CodqIN5/DdnHfIv7pWQtykR2J7abcX/1H2uz/fqL90RQNlCpCCE3wlIvLBii4GhFyUqm0YBfcq+FjoEN9xcbPtyzT6cJ+nI5RVExmsu/8JOUJYZAaR0tPxL/Ko3lh+NIocsvS/JR+wdtsBg5z311xcRxRjTzXiUdHzTb/XC6kvS8Y4NwM4RPrOurxYlbGE/4wLuW+r4xr+99KFePdK7noASNxe5zDlfOWRVazaZWGhnttX+OBqVPmZhxip/lmPPSM19rEzHZ/WKnNCb19bJOgpwAcJwYKwsHAaROiCx+rCDdPhQWuheZmbf+m5pZWKHkeHwlF0YrdOqw6NgjGwGjMwaM5h1idl9ReN3K+gHudeHibC9uXX8ELuqoSKMbWiPhw0xzBVEGmj+VlCGB12OHPeZsFawK31rkArr/9F5s2IjWVERe61iWcrybQmqQNWZs0Fur6i2IdFt+BS0XB2SrXwTvBraJmBF2JMfaKenZsbCHTBBIdm/YsiYwVv7IFRkG6/2bNh0fkAiEFPDDlFYobszcPFGT5Cq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(6486002)(478600001)(86362001)(2616005)(36756003)(26005)(83380400001)(6512007)(6506007)(186003)(38100700002)(38350700002)(52116002)(66556008)(66946007)(66476007)(316002)(2906002)(4326008)(6916009)(8936002)(5660300002)(8676002)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CeJn1YdN3AceSgEnTbJ3POIsMtxApqBFl/AJRupUSmFIcZQvwmmbyybb1J97?=
 =?us-ascii?Q?PpNqw0xfP9CYoH7MuNopA7A3ev3sZYeuvYd3fx/sU+aGV6mKwq6GR7ExJkgc?=
 =?us-ascii?Q?mT/31c6fMBF6w4IQXosIFnR/+F9CiAkOW4Ju3+zJWjyvlDozBt/C/apVjImS?=
 =?us-ascii?Q?0KkX3UErKyQ+DcoamEQpBxN2CEuHc2e2YgfaVfUYnlSca+cIf6MAaSwUfq93?=
 =?us-ascii?Q?Mz9Avj8y/1T84gifP0fonNKQqw1oiVS9iUikWr5IYrxdMalAIsMv9MJGcYpZ?=
 =?us-ascii?Q?LhVVK/bCkikx/lfnWkSNztJOh5RkSpWzLpnSLG5Vk2zWwZ8qE/IGvBssR4+f?=
 =?us-ascii?Q?QhdRf4nqY9YtoCIgjnDXjbxWHfAOAXw2t8PpRmfl4BCdWgDuLFbebm+DtqyU?=
 =?us-ascii?Q?xZPjZl74IJs6cNcSCQq52SbO4wCo/WO730ySq5TGfkcbotkwO5OqnkrNVMFk?=
 =?us-ascii?Q?OyAomSELW6lfUvnsrodlKpgC5Q5lqtPf8GIig7DDjyMeUVk86gdOuppPIyoX?=
 =?us-ascii?Q?JC0H6A3iCdGG1V1Fg7Dn3yf6srarzN+2ZTqKpP9wvtWNQMohlw0skoT4kywk?=
 =?us-ascii?Q?xdvj0EgZT3D5ypAfti+Y0qngNzkaICXd5u10u+RmFwx19A63iaxI4BeQBfpt?=
 =?us-ascii?Q?WDjtU95h9Pdw7qK1GV81nL4X6TLdxfAp0pX0WAWTuKBUrbrZIBfLvGwGHVyJ?=
 =?us-ascii?Q?sv6rc48kBuMej4PAMEKMl/JxKyf/rtaPSvz6Aqe6AweMj1SLlLHt42tV1cFK?=
 =?us-ascii?Q?zyZSeQWVA2hgdFfGMSeT68cS4iyEQ6aTke7QlgUrHtnDm6ftkTjzZrQzor/Z?=
 =?us-ascii?Q?xqzsCMBjKnM3j9tO3jN3WNI7s6/Hvqm9ymkGM6apr2uJxCtAOX9Q++RB/Kk9?=
 =?us-ascii?Q?xEtyWSHOmjnQ3mK66e3XhQ/0qgZEzIvMwFDjab2E3UC4dAnupOkrq1prQTzB?=
 =?us-ascii?Q?kw5b/nD0Kh2BTX62ls5VwXqalPq9tHlFXEDdo+qrjbmxxWvzCAxSZK1OifPf?=
 =?us-ascii?Q?piUeYezSxt246EgONWSRDaQLIBMlDV6WFBJ9bhJOhJEe02Htj9ZoBcLoUkZP?=
 =?us-ascii?Q?PILA4Dj5HYn3B3peKv/GHipNMSRxpmf3DrrdpeZ66oBq6no0v5JOBntZ18jO?=
 =?us-ascii?Q?hviHvTgSmoHRLfb1+NmCxUj1Y0oaxudob4/424yrdZPyZQIBYOmQ8xp5Nzk/?=
 =?us-ascii?Q?4oZEfp3IOFE8dCYNdNZOBiDmuClOYL36tUpo1UOUHPppEAM5IPabcEK/sVVb?=
 =?us-ascii?Q?NrVjq+Jng7hQKJ9Y3rXIYzHqtNt+NYHCrLbvQh6SoJHtlZMdAXDh9x8UcCFl?=
 =?us-ascii?Q?+XDQ6hq2R3BO12+JaAhVSRJs5HgEiFBCsd/vGBFrMgPb860ayF/YIJUwmLAu?=
 =?us-ascii?Q?wOibpyXfQMrw03f9f4FVbjFO1fnS0i519L+IkAtKqu+iNayVc/8gkYCEAGW1?=
 =?us-ascii?Q?qQRYzcfjCiVz18zm5DXlhza6p2ycVOpbAqQYzM4/haumA7H2n8BajW9/ViDQ?=
 =?us-ascii?Q?wFic11pD5BRI/dc4UZq9M1GwXMwAoeuOZWPpejwpqsqZKd/GjNVEu835HUjs?=
 =?us-ascii?Q?8PdQb2BskyGIBoELj91+ZYpbvSKIWmKfQ4Cl3o6hDR5z6xqAvP6detYxdzmF?=
 =?us-ascii?Q?saLc4CUXouH3ce7V/xdJNqI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 08558188-6435-4446-6d07-08db3fa3217b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 00:23:27.8051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AueMTLIfnDsFsaES1oMDnPIAfwZsInIf4sOgzx3ziNoaF1DCXBx2zBRwIXbh5c8RJUdehLJ5mdBnWO7TvHiVyIAU5vfzF53HdX41yHgM++6A/VBOSl9JRlx0VFVqq9FO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8855
Message-ID-Hash: 6NUCXNW2SYPH57TQF5662XIDEAC5H7VM
X-Message-ID-Hash: 6NUCXNW2SYPH57TQF5662XIDEAC5H7VM
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6NUCXNW2SYPH57TQF5662XIDEAC5H7VM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     | 1 -
 sound/soc/generic/simple-card-utils.c | 9 ++-------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index a3f3f3aa9e6e..0e46f985eeda 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -73,7 +73,6 @@ struct asoc_simple_priv {
 	struct snd_soc_dai_link *dai_link;
 	struct asoc_simple_dai *dais;
 	struct snd_soc_dai_link_component *dlcs;
-	struct snd_soc_dai_link_component dummy;
 	struct snd_soc_codec_conf *codec_conf;
 	struct gpio_desc *pa_gpio;
 	const struct snd_soc_ops *ops;
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 467edd96eae5..b5ac0f0d5e8e 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -889,11 +889,6 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 	dev_dbg(dev, "link %d, dais %d, ccnf %d\n",
 		li->link, dai_num, cnf_num);
 
-	/* dummy CPU/Codec */
-	priv->dummy.of_node	= NULL;
-	priv->dummy.dai_name	= "snd-soc-dummy-dai";
-	priv->dummy.name	= "snd-soc-dummy";
-
 	priv->dai_props		= dai_props;
 	priv->dai_link		= dai_link;
 	priv->dais		= dais;
@@ -919,7 +914,7 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 		} else {
 			/* DPCM Be's CPU = dummy */
 			dai_props[i].cpus	=
-			dai_link[i].cpus	= &priv->dummy;
+			dai_link[i].cpus	= &asoc_dummy_dlc;
 			dai_props[i].num.cpus	=
 			dai_link[i].num_cpus	= 1;
 		}
@@ -943,7 +938,7 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 		} else {
 			/* DPCM Fe's Codec = dummy */
 			dai_props[i].codecs	=
-			dai_link[i].codecs	= &priv->dummy;
+			dai_link[i].codecs	= &asoc_dummy_dlc;
 			dai_props[i].num.codecs	=
 			dai_link[i].num_codecs	= 1;
 		}
-- 
2.25.1

