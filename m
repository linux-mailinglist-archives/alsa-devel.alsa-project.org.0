Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 226C472F0E7
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 02:20:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 316E2844;
	Wed, 14 Jun 2023 02:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 316E2844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686702056;
	bh=sThBh9CANAyFgEwOKlVIZMDiX8/Hi+yxljF6atV4/HY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QYsqWVH3vOsWFq5Sw4E2YmRtvQptkZX+iieSdrtDe2/qBXXx3wKkEn6+kjrTsKS6H
	 BICMHv+VJO87RbBAvNmiF73Achox4xo1ImEhREpzDDwVbkRUgDMLi4WyL0hsrAeex0
	 v+zQcu0UEXzwy6VbucWJ3GKiIk0qMl+ecslOTKZQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2C69F80553; Wed, 14 Jun 2023 02:20:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A630AF80544;
	Wed, 14 Jun 2023 02:20:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDC7FF80551; Wed, 14 Jun 2023 02:20:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4571BF80246
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 02:19:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4571BF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=IsPNm3nO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KqV2wIItuW+RnYi4okLAf5BbCsl2msqSOBIFSEBWGdjFfoiRthT8Slfc6qjawOz9AJPyls8I3j3ZrsaN06fMml09WfeHRZ11MubbTSKl9Up+EwVww0NnB8wiYq/weWtKH9GebMwpE+sAYaEX744YGVdO9ECRTJEb7C+Zc5pnwMs6dWMoI+xtsyjP5ndiYoIQpGQK56gX+aH0c8WzUKiHthE5s8geAuB5fUdc4o75xGcEXmTCIUWhxxMxo1LLC0ShtVPHXboGpQhabZPFqCFjJ4I6EodeP185hCffaF+gTHJYzw5TCqwd+jN8IDFfWlMc+U7jbNHCvEEWwcWAUeHr6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XArk0njumHjOYVXHbxOAWfCFth7uv5h7+T2/ANYBKo=;
 b=JVXiKsbR2kfCzfdqo7V48lCh/b9jyR61SAGLgYLJkWMqCEDZ6KlJg5xmKzz0LPI01avq1kBsAOHS1LtWgBLSSkccr2VRqPdasKO/f7CZ/7xcJkjswNLW6fPg8f/szgrdh1JXXyyzcxheEZvFThDjRCwo0FQSAF4hqxPnmNzf7IyZJC7fs1+Un4YScgqvUO19cgsIFvRieawYdFcZIR9PDbRabFxk+yCP0Yqo1Kah9+oM+fw3YfIZGvGbW7rN1g9OGwy9RgIa+vqfzGi30k5GuWC6HWrT502SEVtTgfi2IojWAn0gdCos1URiuTYMUQEwN+PPItyzEu3ND8k5RuCTfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XArk0njumHjOYVXHbxOAWfCFth7uv5h7+T2/ANYBKo=;
 b=IsPNm3nODZZnFHdNT23KWorzX3Ly2fWZPjVDyv7snAu2BdTM7qgK25LSFcI5b1W68QOfwPjrFPQG3EykgA5BCp0dehNQbxSFWs4rs+T+IM/S7CFSVY1JLkPuuTWMgGoZ1QGIMXthfYN1mHz3xBLVc1iCBUebZteKqbuky3yomlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB11658.jpnprd01.prod.outlook.com (2603:1096:400:378::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 00:19:45 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 00:19:45 +0000
Message-ID: <87h6rahp3z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Banajit Goswami <bgoswami@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 4/8] ASoC: qcom: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
References: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Jun 2023 00:19:44 +0000
X-ClientProxiedBy: TY2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:404:56::29) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB11658:EE_
X-MS-Office365-Filtering-Correlation-Id: 17ee576e-3a05-4d03-f109-08db6c6d0e56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	plryk2IyYtygsBdrLPc5On6XNXzprLzFUYO7Ys+lwd+FDFsayZTUUhpz/TpClh0iVhp3Eh/6Ie+ulv0YvU14mtYaNMN0A9MXuPE0o38h0zIQaYTf8ofC5wmO24u98dsHnhNUUEh/DelblEr4eEtwmVe0aZHbZGZ9Qd21yStOcpYEX0+z7U40TJGY2j02bxPvhj9THawaP2fOgzDsxF18qUkf1yxitfA42PzwcVlpuDxzANLKEQwNYzp0NXD2EYPAFC9/6KLmr2TwRU4SYnkMm38kxOe8erzc7eV4u7ANsBZceX/MdfK/ms6HZ3xApuUkxvWIjUbCXGcqdHa4nExVGoNiUsOgOFp2G0mYUfPo7BEt5nqeqAIITCMCjBm6oT2V7W2ECmgHsV6m9He25ckb6z8K47Qb8lf2Xq0pjS4zfsUvolOMqAWzTc3sFpnuIN7TPoLnkCNwiMhgwHXBIDR+iAtnPnu1HK0r5pCBooQNpegwCEOH8rw7FkS1xM9i2WFBuLJE85B2qhEPrESe95pOP+dGvn8mHxFTpx+NElzG1nS4798PnO8CUPrBVgTOIjN80yRbsSYlikT7pUNo/XSpt5X3ilHozvZZ8UbWuFPQ2Au2qhnRcSWJOJK/IRA4qq6T
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199021)(6486002)(316002)(52116002)(41300700001)(83380400001)(86362001)(2616005)(6506007)(26005)(2906002)(6512007)(38350700002)(38100700002)(186003)(36756003)(5660300002)(8676002)(8936002)(66946007)(66556008)(110136005)(478600001)(66476007)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dA19G/Fj7qcJMwpxhw7F13ag3pFtCHxFUxAZ99QuLngPg41hYkjxC2I4fUp6?=
 =?us-ascii?Q?hU3hmRi5/6doIgneI8wVIxk46/9qtLhWDzWb5xsCx7Xozj8ZsCvRgANh25Is?=
 =?us-ascii?Q?PuPIYHSMY4i8S1/cCqF+ffSsgRjA9PJhYYlZDUbk76yNIiuBJkjp+A+/y/dc?=
 =?us-ascii?Q?e0AfAQjqExf+vgisGIxemXJjp5OWHGkr2Cdt233A35zF8o6BQ6OVLpK9t89F?=
 =?us-ascii?Q?J4C8cq+KAQBNh4NX/oIFM1sCvk9zT7cSiNQHo+xdmdE+Vzb/NAhOUpDCbhO1?=
 =?us-ascii?Q?c9deYFLvlarFGHrHg0sipsYvVz44r3w6q3Q1Lc/dI3LjL6pzrTYH26PKP7+f?=
 =?us-ascii?Q?YGHqvs0pZKjGpqBd2QrKnqhglYpzmouyqljkP5fogozFQMJQ5x4LLPb4MNgP?=
 =?us-ascii?Q?eKapy5Pyxyd4x3W8jRmKxT2q9wTLgde5PLf4uEnoaM+rcooYoxzBtlgApWm8?=
 =?us-ascii?Q?px8W1ebLRWJP2zmtDKNm7YPFDoFuWs9/6Gg7Lp7JxR2XnRiR/y7L/waQdXqQ?=
 =?us-ascii?Q?+d2tIt7Ncq3HzOH4lHqvkiXj2QT0SnTFlGjcS6dgxEYJa7s5H1of3XdnC/CC?=
 =?us-ascii?Q?KWb6XKiq3olZfcRxC1BWMnuzonKehUCEP5kEmXid5dCesb3c4mB3k/8XGw1X?=
 =?us-ascii?Q?xMh0WhxYvJoYJ7qWr8Var4fwYW8JMYGFeunCLwUm1wyC+e5SoR+cqdmBZBIX?=
 =?us-ascii?Q?k0FcNgPa72H/DMqp9PFRvc1ej6lILqFHst7QReddpI33A+FZENtvCDI74r+F?=
 =?us-ascii?Q?+Ra+RkmjldBZKQ0XtWpFyCx/H/ZWYRcUmz8tTKEgrEUe8N3AyswZOH3b4fqM?=
 =?us-ascii?Q?CPQXmgjAKp07IL8GLlQLUlRR5SSpuviZUc1e9AvsH6itZb4XPhHqFKI2yqm+?=
 =?us-ascii?Q?25x27bmJ4rp7DC8SKzPhTOGBMC+JQfIbqwb1eFOkTy/vwmMUV4Fqz8p/anPR?=
 =?us-ascii?Q?Z9Ch6G36ANAD0Rq/uk7nHovqgXYhihVRxdA/fDQ1cCy85ld1qdmkAHt3ymIk?=
 =?us-ascii?Q?Oxn8fTrcZtHhZ8pLldRpMubLNLrR4EQd8K1eKNM0QttGkkf2GpuuPvO6rubG?=
 =?us-ascii?Q?cSZmuxfJpQGo8h37UOxug4nmOijPgLQREpN+tzE7x6y5+jexnIEN5hBJqa7S?=
 =?us-ascii?Q?y9I5/ntRGWMwTxvLCftmu8R51CviwZ56uylZpnFiszLgCRJEn/pRtH09vvAD?=
 =?us-ascii?Q?szPN2PRrICBfR1hn2Eu5uoxTKOkDIEI/f4bSWvNPbitwQFDDZ56VAKR+yrKi?=
 =?us-ascii?Q?QuedewVjBa183UUvovUMSIx3JMfwBtyLfbaqiazgygTLFOxTfzv9t47x5KmF?=
 =?us-ascii?Q?Tyqjy4S86pPeR5oy+RBZ9KXntJeOTmHyTWSUE/Cl4dDJrYB57WJG7o3DFv0N?=
 =?us-ascii?Q?ETYB+cXY92pqNdVZTqVkTWwuyZUMi6E/Zqj0LlrdBvVt3qm0Pnsr4krL/TlX?=
 =?us-ascii?Q?99CHVYWHmWsMl0Xg8LJi8bx6WAXTG8TvmNFWvIEohqWdN4LrYWcLuz9EAb52?=
 =?us-ascii?Q?ZAfLoAkMF6cM9o6e/56FsvgxC8bB3qXizXfcHdm56u6ZpRZRtRGja3J8BSdM?=
 =?us-ascii?Q?abrz7E2h9gcgxxT+sV2KWsnuzQiQZ7+8WNRAhD7HDn4IZewWKdnii5F41KCa?=
 =?us-ascii?Q?uXVYef49Pan8/WzN6YD1rfg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 17ee576e-3a05-4d03-f109-08db6c6d0e56
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 00:19:45.1938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1nYa9xxxtmcAIePObEiill7QbLwVVbOtO9jxMxDdprw9gmnf+KzZTU6/8TW1RLyqBi1uFJhVaNSi8YY8sVD5hpoQfolKwNSsnNoJS5MJ1TGenl6A6XO1bj9GYpXcwNfg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11658
Message-ID-Hash: FGEJC3227IF5OBS2AKGK5TC7ZWZFXQVX
X-Message-ID-Hash: FGEJC3227IF5OBS2AKGK5TC7ZWZFXQVX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FGEJC3227IF5OBS2AKGK5TC7ZWZFXQVX/>
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
 sound/soc/qcom/common.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index d9ebb883b999..43b0a888f1e8 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -96,22 +96,15 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			goto err;
 		}
 
-		ret = of_parse_phandle_with_args(cpu, "sound-dai",
-					"#sound-dai-cells", 0, &args);
-		if (ret) {
-			dev_err(card->dev, "%s: error getting cpu phandle\n", link->name);
-			goto err;
-		}
-		link->cpus->of_node = args.np;
-		link->id = args.args[0];
-
-		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name, 0);
+		ret = snd_soc_of_get_dlc(cpu, &args, link->cpus, 0);
 		if (ret) {
 			dev_err_probe(card->dev, ret,
 				      "%s: error getting cpu dai name\n", link->name);
 			goto err;
 		}
 
+		link->id = args.args[0];
+
 		if (platform) {
 			link->platforms->of_node = of_parse_phandle(platform,
 					"sound-dai",
-- 
2.25.1

