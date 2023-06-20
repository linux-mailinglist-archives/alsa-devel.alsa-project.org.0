Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E974A736173
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 04:17:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69DA6AEA;
	Tue, 20 Jun 2023 04:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69DA6AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687227442;
	bh=GcBHaS25lGEJfkAavE7htpIoNLv94JyV+AORIOtE0tc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pncIRecu1Zdeuo+hmemj9YG6ENEi3sj69w2VmJGaPPJroy4LcNhhVbPB2ap1sAndE
	 2mlaHcM741NQtybs0kH1JtvyU+Sw/1/NBDmgnGMM+IaArdDMAlTRLGtgPc+6bIkghg
	 iXJ1vM5PNR+AgMp9QgXEd1Ek9P6zt+VvfgUwC+qY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75ED1F805C2; Tue, 20 Jun 2023 04:14:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F268BF80544;
	Tue, 20 Jun 2023 04:14:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21386F805C0; Tue, 20 Jun 2023 04:14:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20709.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::709])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22CDDF80141
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 04:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22CDDF80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=c410RCot
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYYEha8K2lFeXo4svscpbZEAT7WALOZ1lpbiYRjzC+245fw0obExyqR1+3/ZhkNB+1fkZeTXUf8XGce9sjyygWIHu90colhieD8mpon15+jp6tvV5kt0N5GIgUjRryehuHu37XTs1m/7GYdwvIHwPWgHEPRdzM4NvbVB/mNHP8HAT1UKWdIvZef1jOLqxXfYN4sjxrVc2gb/m9gL18EnoLtzUir8M9PnS67zL+wSnVnpnA4IjltZJ9KI8lFbrFLwnEKv527VMnQ061UFVK/JC3+mzPFz1fCWP0P9jQbL5U79O1/in60iXqr6eVog6Lr3ALhw9rmZFLrgvDNA+V83pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1coBhtUtGNyDCCRinhxlR6QNCLtYO0UYbRExXSwh+w=;
 b=eg3W4tU307l/oR0kztEiQSnRsi8mR1RGw3S8EelYu5qduWTVXbQlRsyPEivun4O9Lyi6ey0zaCniDoi1iQOyI2FePfkHmZ3QpFTKytId/w+86K7sZkZ3CK7OkxJMF1HoOq9cBOZ7fNJv48qoyj6np2s+LvbJ25wcjpC4Oisfqv6l0UbMFcNSIEEbqEDkpwa7KvfJkHKmkePGB31licAa/WY7NJBhP5azhIkNX55SMTrark4R2GlV8Bq0xIZTne3396lezBlw4Oj/Em1h+40SDROizqWLwYXL1wNFUijps0gR6XSaAZqWTLX6he2BJF9DWNL+r95CqzCIMeL8wyz8bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1coBhtUtGNyDCCRinhxlR6QNCLtYO0UYbRExXSwh+w=;
 b=c410RCotSGHPyp/W45rBOqmZLRssBTnBG7KBUSbv7vr8+ovsPiII9R6QbrD+cnl8dERRB64K6gTJWbk0QYiORGelwd9BwGPDWJ82CzIwf5+ovgIRoqibFTKRg5J9SozqeSqH4m5n9ObSxWxxFm49EBcp09GX9fF4Q2K3EtSQN0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5665.jpnprd01.prod.outlook.com (2603:1096:604:b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 02:14:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 02:14:19 +0000
Message-ID: <87o7ladgn9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org
Subject: [PATCH v3 3/9] ASoC: fsl: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 02:14:18 +0000
X-ClientProxiedBy: TYCPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:405:1::31) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a20bc3-0422-48d7-9c20-08db71340e00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oxClGZNrmudgdPFMeJGQvoR93fdvoTe4WLLgW/fQKfnYHfou982FzQkfaGXHBXhlm7T+L5Orp6R3+G2fudPV3JyQx4hPyuOaltfbAC33V2X/UgLEtdXNhWmLBrK78bzP2JahqjZvY3K4I71PzFEvLac29n2c1cM5Fq7wULQ6y7ANop/EDZLJzvMkMTLdWiJj/JtBFBZEr6ikA+kLE3qo9qnijDITOBUCW0NoiNpjnml5Xz6BBTgYqfQjYBnsrbkCfzHSoJ5HNXw3aXtE9SqiZxUDrIVF87dEcjXGi9dUoZ4oHFkt8OYylmABuoYpvRIxPMafdYUEHcVwrz5xCdNDj4FEOZ3056oiGFuIigJFfzX2SZywGBoWlYhYDiTtcyVYf74cqrpxI8WGxAjArcPYZU8KrXcEKQ+0mD09RrGQkXNQn0hiQ0aez3VooGGE7uY1oyrkEYDZGzv+IBAwD9HjT26fww97kme2Wcn0JvIbCi1a7AlmxBIziZ3586HU0bNEt1wNh/CeoRYJgcrjhcB2419WrqoijrxfSNuBBQUtx8rHXxOsrok8oR7+Y0Dww/cugVR0W8s0FpPbp7SYY+jI+UB6JodYVXA3WGGZIZGZrLoZ48Y+1rJjDRj/ZPlFq5mJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199021)(2906002)(7416002)(5660300002)(8936002)(8676002)(36756003)(41300700001)(86362001)(478600001)(26005)(6506007)(6512007)(186003)(110136005)(54906003)(52116002)(6486002)(66946007)(66556008)(66476007)(4326008)(316002)(38100700002)(38350700002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JwOeNzCNkGN86mShRIC0Narumoss+LLujtc9PqbdKIq0o3/NzlUR7y8cQ79d?=
 =?us-ascii?Q?uNwWfp6qK2wcQ8m15DHniaKLqVz3kL+l1Oo64HyUF6hAHLTopVv3aGrdpXYs?=
 =?us-ascii?Q?XkDwHdOrE0+hwOVPsIfIp4Pp7/5kttP+BNB6vzkr5QM6Kq8dlQT2J114gT2f?=
 =?us-ascii?Q?iA6WLWJ2NeYS85wgMK/R30HD5fUmXbX5iWdVxm+PyQHOk2+RSTyu7sjxAiIu?=
 =?us-ascii?Q?0TD9+/yIYKZVFDPM+9fxkGIT2a48N4NJJ/JiI6btzSPyBZSrgJ7Iu312fZmc?=
 =?us-ascii?Q?Ulx64M8tXzcfVTHYU8QXWMXCZhYy6t7TgpgV7txJjF1nFcmj5Jy6CSMTJtxb?=
 =?us-ascii?Q?X3jrYP2zI49KBOCbmkLIeF9LVX9EQa6O1YPKmVnqIMu3pxpVl6JlUbN8HEDS?=
 =?us-ascii?Q?F4dNYQqJSK3BfASgLbpxDT0wXIMU9PwcHT6Kpv803aYCm5K4nDF8Hf3Lpkuz?=
 =?us-ascii?Q?W5Ycb6l3i6wgZQJYfbDT40qFCrFw8f+C8+TQL7Is7bPcX3l/ae+fvBXObRA2?=
 =?us-ascii?Q?qCFnylNBf8+6xJhWX4mbhp/lYQbm4GNbmDf2GWb65czEsYfWWTw528Ql+TgA?=
 =?us-ascii?Q?k7dxtPhOYWtpkstbT7PaRm14RjfehJv5iPwBQLs9Sl4ECOW+bdYaPW1XDFtc?=
 =?us-ascii?Q?jszwqGWrgEocTtYbhjCmkSxaddDecFRYUyuWJp+qVckcJKLWoDXs1JI3ugSK?=
 =?us-ascii?Q?RC9nZRiINjI8qgxY7JLbsaozLbe3d5vTFXpVhZ3uAflRuNQjzZod2Da9+Gch?=
 =?us-ascii?Q?B6l8FiniT+Ls7XSRNhmpQhJO9WycGsVlXbR8+PIfiTBjF5StKI4VVjUV3Vck?=
 =?us-ascii?Q?5HyNu3fcueWEqZYEcu3ZDUFpvAWWX8kj6uRyriuO6/ngj491Ol7EWUg3ioYX?=
 =?us-ascii?Q?h8Z+vjzH1+y3sMpiBOt6R+rLYxf5Z+A7LqWbXfOu/dFrDH0di5dr8Fpyilkk?=
 =?us-ascii?Q?lMJAKcAz3cRbMRH4w2E0zWFMtZuITkPQ45t4CRh6v2n9x6TjV42rPx+a1Cyt?=
 =?us-ascii?Q?lz3M8NDiWlknW322iiTnWvHs7lbnZ3IXeBMCrzmVysYFvxWntvdCF/q8W5Nc?=
 =?us-ascii?Q?zksJOHJo6xzY2hQRk1Sv8ZF0jKUK5CFRJ8JjJJrSByym3lUsyes1FVXw9/Zh?=
 =?us-ascii?Q?jCLSfXmC99+Sh9kVzMiUmEYepIGX7KEAQVS5AWvb7CySzoabYZCEG4E3uzH4?=
 =?us-ascii?Q?IqvSQj9VGw8SN/EUHbEGnL9u/h9QKEZEOQS7ow7PlZ6Ocdhyumy/boA6G1r7?=
 =?us-ascii?Q?LtimMWQnfDvXobJXZHhLxsukU0J7xixZ7lY04uTK9/YK0OvYXfdqp3Sp2UYL?=
 =?us-ascii?Q?96xnYjyU7YX0D1t9MUc17wEtSyd5Qe9tK3ol/SZpSuQti7jNgBk8k0adLGfD?=
 =?us-ascii?Q?TaLjpTSfETBdih68EGnriWn4i6vFkceTFkGMX/rhty1JmoBz9i/jFp9KA5zt?=
 =?us-ascii?Q?kpG9/Hw9dCNcwpnkOsEQuutKgAeRf0Nh1hdvQtOMiH76uYgMv6KDK+2mJyFa?=
 =?us-ascii?Q?CjUHqaHcOXyR2TjRVEHUTmYk0u0fnuhIx9NymyRGz2jeOKL7HfSP2xY8Up/F?=
 =?us-ascii?Q?10hSgB4KVXzMb3rG95PGOYvYxFCFVq6HH4N5u/tXvZYCrfE2XES+XYUF+f6p?=
 =?us-ascii?Q?kR/aof4KXqBBhdoZRmCcFaQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 50a20bc3-0422-48d7-9c20-08db71340e00
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 02:14:19.1118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fCybFXSFSUELDngspDGYnWoyaXo7rEjNDdBBH72Or3mNKQJ5g91srG6mireSUe22h8rIyxgEN6bPT31uqnvbipkZ0vOYuON0hHQVTpXA1VVNNDokXyXWe5iImbaPRNQm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5665
Message-ID-Hash: 2P4IVSDZCFJH7YW6MX36D62JB4LUZVLX
X-Message-ID-Hash: 2P4IVSDZCFJH7YW6MX36D62JB4LUZVLX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2P4IVSDZCFJH7YW6MX36D62JB4LUZVLX/>
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

