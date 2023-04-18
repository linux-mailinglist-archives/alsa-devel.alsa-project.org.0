Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B56596E55CB
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 02:25:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA9FAE73;
	Tue, 18 Apr 2023 02:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA9FAE73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681777555;
	bh=LAmiyTwlAKxFHLwd6Zg3vZM8aD6pk0Xqh2BzQi8OIUE=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XwZROSQakpyHpl1iXjKjLvEVy+Okif1tIKJmf0qVZn93m4hx75/6v+J3Ze9belxM5
	 kMFz7Bk0mFj2fNHGZqVFh8oLzyCaSbADlrQqlg9gIEk0zfiWQxINZWlqZJdUGQxaVz
	 einBkD52xBnQ/L4QZ65AMfvZWO//0PgQ0MUytEGU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94737F80528;
	Tue, 18 Apr 2023 02:25:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B790F80529; Tue, 18 Apr 2023 02:25:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20716.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::716])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33637F8019B
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 02:24:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33637F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Q1jJLSEk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDChEHLQUGE56pg0HvjJtmqA0fVWbaaS/0ncmraIYhqSOAO1CRAkPw+dZ+FTgx7mn4VoomLQqlRgsdBIlTzWsQug3RMKS6PPZif3JyZ5w+XFMwuPoKqCo/KwZoB25l6iO8fB5icor0WULAlSEVc2M7EAP0uTEzkoXWjQScRJZV6GP6muL3XONIGOfryLRR+pMaThgmLd1mSiATcWOpfYUb1owg5Ed6Lj5Z9hof5EG64E8ISkZl3lPgoFpTJSrwX5u+YXUF6C6NO8G0FRYeqbNyNeU96GBkH96F+9GOJJYzYtX2dc7poiYx2fp0PJHuujAunEHwbEmPsmDaomMez7BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFtqxj9wVAMvKAU/U1S2aAG7wPeT2lGiGrBx+NcqQxE=;
 b=Oxs6/M8KTjIeqOUaHwrPSX+lgzk22VIpOu/tgAeicEA9CTxxdrRwdDjzeB+3s2Pvi3itTaFou/+4C98Gu5pvyBmCyjgFCVar7kDcSbmtTkEKRGsSRSFsT4wWR6BtJV4KnSh9tHjKkswP1SmNlduROB65I51S3wWRQzPPjaIdt1qshg04SJpAtvVtI0U9Un9IUwoBuZuq94hi0iT2El5G3hOdDmJ6JwdyB3mfHJeiUjt9DW3JQoJd6Suj92X52O4Ov1EGD9/ouR267EqLeaTzz1/bvKhyuXWAOHFjdMvR8QXvKrbw0Bj2GrH/BT/4zuhE94p5miuQQt47wZSJupM1Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFtqxj9wVAMvKAU/U1S2aAG7wPeT2lGiGrBx+NcqQxE=;
 b=Q1jJLSEkQ+DnBH/jciKUFXoW+S8mtvq9dWXCOrRMxkhzJsoDbMBpv6IY2yWNag83EDDjkkhVhKF4TgoorZKxZAo6HeyrwLwRAfDB1kpM6LnYJMyRJZnePIo2iSx7kfymTQpo+gl9MnXowLs2lyUONVF+r6rdNZL5S+Jc/1upMg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8855.jpnprd01.prod.outlook.com (2603:1096:400:17c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 00:24:55 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 00:24:55 +0000
Message-ID: <87sfcy2g15.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
References: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/11] ASoC: atmel: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Apr 2023 00:24:55 +0000
X-ClientProxiedBy: TYCP301CA0047.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5d4ff4-ef7b-45c9-74a1-08db3fa355c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xPKqbUcxerc7QMSLXSi1sBANV3Ez28RU9/Xmmph3aMQvIzTHqkL7uQkrSoJSXLsL395EhiacKChOu15MEzq+dH0VtUKi8AJrtG8M+Q9VZCcxGaRNW9vAcs5SDXWej/023yMT9oC3EYYzxGa5FOprl+OASzLwWR/JVWQHXTWBKjkiBlE6rjw7Ox+SplqLC+ZfMyOaqP6KIhMFCXtiEwi7o6SwjXNC5RrBwwHcWPQqgdhS3NasnACUrpOHEXOyYqpdXPzbhr4/UW8QX3283G09Vss5X3LNBFQVvFj0ZMNyHHHEq2srCMKwj6dJfKM0ZQ+Smcz1I67hKtW10je7W/LKACuxIZMgJSt98vHhiY8dJ8JQQN2iwG3usIPY0imc7Kbgt7R+Kae5i2O3GVD/YBHWV882kVnuLGmfvq/0xd06NLXg9quye7cyusSnpqlY6qd6YvEhczXpnaIGYWRA7uzRSQK1J5tuIYxbNJtsYc6tSHL3NCIyiogY2S3NsGG0zN6TTuI4F7XL8vLtZbjUhucYIhpideMn5cHndkkMAaNibINDkfeDc9Rd3TYCyaKGofKauLHJtYmR2XZIZ12TdW9vBhlhIK/FuvasZF9k3DWSJVpZ26XJxyMh01S5BZTLb46r
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(6486002)(478600001)(86362001)(2616005)(36756003)(26005)(83380400001)(6512007)(6506007)(186003)(38100700002)(38350700002)(52116002)(66556008)(66946007)(66476007)(316002)(2906002)(4326008)(6916009)(8936002)(5660300002)(8676002)(41300700001)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cGjM/WdiBLEkRbwhnOaPAvtepWmovl+7dFKajVTOA0woaMlXoVt7evPrnmXK?=
 =?us-ascii?Q?WmfRkOzMO9Am5P8rav7oeCfsluxtrmPcHMVNMGQkIfM3o/aKY/tRnQNfTfPD?=
 =?us-ascii?Q?+j+lTZEDEAX6x0moW4euHKLRDj9JkzKruqd/IIML6Rb9jeE7oS23/2gPo8FG?=
 =?us-ascii?Q?m1FMU05rCCe+4sSD6Rs1np3WWhGeEXsfnJ2IEKboNEPYb688wWhvw3aeLWV1?=
 =?us-ascii?Q?kr6wGk56MGiYl52sf5TO3NsqB/Jpfm/wPhdHoLAmfzXSish3at0Zc1fJeTLO?=
 =?us-ascii?Q?qJO3sj+fH5QWidW/Dd9cZ3/CQyNBbOz/XOR2lZAxFDv3Y/q0vGlX1+pL8GCC?=
 =?us-ascii?Q?yLLvgEerHamrV6aBZmGWkRVhcABiWZwBUc/IPtJVHjYkcZjcEpRcCzP8VNW5?=
 =?us-ascii?Q?ArW2MBxOUi7U9zTMQVUNmYPgNIegwbAkvYhusQqF6si+WsBnVZ56yUMMl2oR?=
 =?us-ascii?Q?/NM2+wmhFnbJs6hDW6aJhAXZAarOHQc8OrmiZq0K1cPCI79CNB4nRAOuPHLo?=
 =?us-ascii?Q?22VTGCHtCqarjwgkdkUQQXiwig6fQvLcvM76EX8k1X72nmX3vtbiAobxZcKV?=
 =?us-ascii?Q?a6uvz4K0kqFYt2nJutrKU4Gp9M81v/D0ntCxYpTRT7zjJQ/s5v/s7t0cbB3R?=
 =?us-ascii?Q?WWra0dOWjQR2eFUWsgeQDKg8nnki8O99JJSomgkBx15vTg7twK3p8+JNlrWu?=
 =?us-ascii?Q?QfpvGJAEtElH8ZXpKXy56FiCIPlkg5PUPnabMC55skVP1wVCJXV/OnUFcKKI?=
 =?us-ascii?Q?4PbvkhsfPMJqWz0J7fXmQ62wty93tQeyjqsr5pD4tR6guPRoZQCrV34QmybH?=
 =?us-ascii?Q?CwdJ9CFCHLWKqM7B9cVBz03pWXThJ2VjHuZqSPuJGodzmMwTpThPNWGGwq8x?=
 =?us-ascii?Q?8ALIODHhkNGsQ80fhZwD67Dv4PMlXKdiJUDz03Xo5Zqzjej3/gwNk+WXLKLH?=
 =?us-ascii?Q?C2A2SjkqfPfQ9OTykdqEfKIr2UDFARcMHJG28iEdyfEFAj2DtVa+htR63CvM?=
 =?us-ascii?Q?p82yVhBbbdgor6NYAcwF8TkNLBBImOdiKjznBK6YtFffn9a1nhayOo+0qPLL?=
 =?us-ascii?Q?VPOWXe51BVW8VUxu2FpANAKKvZ4B9OSQA5xiN7C0sG+uK632jH6ldFoMw+hI?=
 =?us-ascii?Q?+n63XLhiM1o1pls4Qsc97qbbdaKcLNneVLVYdagA5jxZsBgsjKWK08urvsZ2?=
 =?us-ascii?Q?U8EGyiqzeKOWIi7O7aCUAAsq6rvtKYo0fAU6sV+dCiSKdoTcX7YfGw6V+70v?=
 =?us-ascii?Q?Ho0V6l5KeUo6v2mj40IPXC8pWnlKys3llstjyye1HiJJzCj+RNVew4YcA4wF?=
 =?us-ascii?Q?0ApgmQhckmC+QD95cNmEd1fz1CFZQR9qB/6dDM/5q2qHhcIugZvx7VshfNb8?=
 =?us-ascii?Q?u1BqrrWjS8wOjRGaKC1FK8sptRVNcGc4ZsrSxl0r87DhEISdPGyvSin8OtUe?=
 =?us-ascii?Q?wHn4TOve1kUwB5IcKTAlWlQenqXcxsBSWn4dkEzSSeVzFh2hMDSoS5KKjMcN?=
 =?us-ascii?Q?BKK7fT0PO1Rp0JI+KXV9HunMpVKROc/OS9ayWWJMl7Rox1zz+wsuiyEjzDGr?=
 =?us-ascii?Q?Q1bOS/zvkwU19v9ijrMxA7P24djdekbncJXSFQDc4GSV9psV5RwiWYQVNWAQ?=
 =?us-ascii?Q?gsWj2k67rA07GQ178FzRJh8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5f5d4ff4-ef7b-45c9-74a1-08db3fa355c0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 00:24:55.6305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 MJxuMudvgWYEIwCBYZpIQCocXLVO9/pRsGH5kfaQ7S+IOsRzuR/Lo4aTsr78JUr73yXWywNQgJQaM0me2GFaJtAmSTPA6vvop1KO62upXaPykPl3FAgHfFyKpgQ9S6eJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8855
Message-ID-Hash: ZMCADG3D5XC4SHNPFMDFELDYAU632BZA
X-Message-ID-Hash: ZMCADG3D5XC4SHNPFMDFELDYAU632BZA
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Claudiu Beznea <claudiu.beznea@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZMCADG3D5XC4SHNPFMDFELDYAU632BZA/>
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
 sound/soc/atmel/atmel-classd.c | 6 ++----
 sound/soc/atmel/atmel-pdmic.c  | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 007ab746973d..0fe42543a47a 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -473,21 +473,19 @@ static int atmel_classd_asoc_card_init(struct device *dev,
 	if (!dai_link)
 		return -ENOMEM;
 
-	comp = devm_kzalloc(dev, 2 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
 	if (!comp)
 		return -ENOMEM;
 
 	dai_link->cpus		= &comp[0];
-	dai_link->codecs	= &comp[1];
+	dai_link->codecs	= &asoc_dummy_dlc;
 
 	dai_link->num_cpus	= 1;
 	dai_link->num_codecs	= 1;
 
 	dai_link->name			= "CLASSD";
 	dai_link->stream_name		= "CLASSD PCM";
-	dai_link->codecs->dai_name	= "snd-soc-dummy-dai";
 	dai_link->cpus->dai_name	= dev_name(dev);
-	dai_link->codecs->name		= "snd-soc-dummy";
 
 	card->dai_link	= dai_link;
 	card->num_links	= 1;
diff --git a/sound/soc/atmel/atmel-pdmic.c b/sound/soc/atmel/atmel-pdmic.c
index 00c7b3a34ef5..133f17ae24a5 100644
--- a/sound/soc/atmel/atmel-pdmic.c
+++ b/sound/soc/atmel/atmel-pdmic.c
@@ -496,21 +496,19 @@ static int atmel_pdmic_asoc_card_init(struct device *dev,
 	if (!dai_link)
 		return -ENOMEM;
 
-	comp = devm_kzalloc(dev, 2 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
 	if (!comp)
 		return -ENOMEM;
 
 	dai_link->cpus		= &comp[0];
-	dai_link->codecs	= &comp[1];
+	dai_link->codecs	= &asoc_dummy_dlc;
 
 	dai_link->num_cpus	= 1;
 	dai_link->num_codecs	= 1;
 
 	dai_link->name			= "PDMIC";
 	dai_link->stream_name		= "PDMIC PCM";
-	dai_link->codecs->dai_name	= "snd-soc-dummy-dai";
 	dai_link->cpus->dai_name	= dev_name(dev);
-	dai_link->codecs->name		= "snd-soc-dummy";
 
 	card->dai_link	= dai_link;
 	card->num_links	= 1;
-- 
2.25.1

