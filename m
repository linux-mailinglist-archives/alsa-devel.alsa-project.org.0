Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FABB736064
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 02:05:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 460E693A;
	Tue, 20 Jun 2023 02:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 460E693A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687219550;
	bh=k9LNdLg+hyTk0A7fnBP00032WqW4pPNvJuSQ1aBeMu4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oni+epDU51L3N6kPu0izGyuarwzFvdCf7xta+0UG4uve/RDWREtXOS1nFenCvNQ+O
	 Y+HtN6MO+3WksptACakTVr8NleRRREmiUOLc+sAbvWQaC++/0XhKxnIizK9FYjlHqi
	 n+QgMaV/y7wl29GhHV6YfR0Am7w2ZYxlqRhQ8ZZY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18238F80578; Tue, 20 Jun 2023 02:04:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6E15F80568;
	Tue, 20 Jun 2023 02:04:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2911AF8056F; Tue, 20 Jun 2023 02:04:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E33DF80568
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 02:04:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E33DF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=E2zB8sas
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKJtizsdUo88RQrR4H76+kIN0kUqSM1UGkYMCqxWMmVzWfK9GaPM4YusggYb0SGgiPWv1ZMthZ+zcqoNHe77F86QB3s7I24hYpPHjKPCzm6Mg4GnAPPJTq8ex02CHm7B/k6e6md0T5VFAeZjopjoAlpNjl9IG5PJy8IM1BAQBqeMCifQ/YV583roaJZz71j59s8ot0R2rmSTL/Cp0XdFqTqrkBeKCIE/Bon25uoo0+iQolcq2GJKrOp6nIMpm42DemaZUN4cBotL8sbwY5QO5xPzHfxhJ7T59/wVND5VZ+LM5Pavsr9lSDSIZ+wHrjjrc4AVT1UZrJxBiC0upSxiJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RNVs7kE8p/rVH0xILu5hiG8IhkauBSFe5LGVg/AfdfI=;
 b=VDgj1t+DcjR58gmeP3A0fPKkjm6IfBfmk34cFJpphqFARZcp2TzeYWrEOkEytBX4g3vQl5HVaPCR/N4PCXZKm1MINgQbDAdg9WYAobJOSw5ybdtw9amQEHne1VBHnJkrVMjBLG66GTn3i8vomPUg1HI4dj4QkdIpIHs7OnaVQ+88FIDR6Uso+XcbHdoJHAaWZJEXgQfvYt2F8fmNwMzvB15IyfwyqhWv28a5Os1yT9BhVoq4lZ2TaltBTlONJlHkr8nvC4oGBxGGXuLJcPjUukfXsFxKvPe/pcTJ2tdOzGtR9IAf1c0jl5jIWmwEvjmw3lzGnZAfaD0j8C3fWWWRhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RNVs7kE8p/rVH0xILu5hiG8IhkauBSFe5LGVg/AfdfI=;
 b=E2zB8sasiIZLYoDxr0z/Uy8ULic3Ihb/HFB5IVIVdy4Talj7Y8TGKiOdCjEDbg6usCSbDK/mLBFNWeuALxTqgjL1z4w5z6QD7Kd8LYB49del0xjn1fTzI3bDjn557hFxdzHtBfXeoerostG4rL3ZL0GilBgLk+HJ5j2BVC55NIw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10425.jpnprd01.prod.outlook.com (2603:1096:400:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 00:04:21 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 00:04:21 +0000
Message-ID: <87a5wvdmnv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Banajit Goswami <bgoswami@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, Takashi Iwai <tiwai@suse.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org
Subject: [PATCH v2 2/9] ASoC: soc-core.c: add index on
 snd_soc_of_get_dai_name()
In-Reply-To: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 00:04:20 +0000
X-ClientProxiedBy: TYWP286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10425:EE_
X-MS-Office365-Filtering-Correlation-Id: 01b4bba0-19b0-4be5-bf1c-08db7121e5d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hBhoo6h5m8FxIKjJZWF50F3kVTx/uIQTT9BhcG5VuCQ7za49LqwMVY9VEnZvnDVK9szLIj61e6WNqc+t6WstbQg7wkwxFa92mrdZAfqQlkLAnHNg6N25D98dmLltivVnHy1FzbfWrIqwjnuG6I9D4X9dMkioVtIrUytcPv9r+O5LeafMfd5oFQQ1XWPIA3pSWRI0klkTn5ovOZNnvVR1vfOxu8FtYwHqxQoXH98TD8WDlkX02JcMARDTC8CTquNqzM1gHWXfw1KHxs+eAxBRZBHbQKKBhne7/iLppNwty7GaSkONFXZVR66+xUuH7dDOhjlBtyJQNY1incSF8EQHcV+soT+r6YYN6OrXtOC3UV64+/WhMMBDzIGOnxWy8tvD/C9VfzvNesI3UgDpK/QIJLpPnATtncUNEnh+BIRd2T5Zr84lZOLZbLC9JBUVcxwk/hrgsyNSZCmOKiY0SoZtYWOsRIQySE4p9KFCx/Mjfoj57Omd9AdHIpkUPYXEkRTkoaV+T9ilGzKpKQdC5QuHv4wBAOWZxlZ4+qupaL3xKdq4kubRB440pya5u8g06o8RIt/wzNxDrpBVHfgeAQ1sxvcMN16V7/tpdOPO4SeomeoLy+U2jZc0Ygx7xeiJP6SRj1awnaEXVHsjW0ZxcKcZPw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(8676002)(8936002)(38350700002)(921005)(38100700002)(5660300002)(26005)(6506007)(6512007)(186003)(6486002)(52116002)(86362001)(2616005)(83380400001)(478600001)(54906003)(110136005)(316002)(41300700001)(36756003)(4326008)(66476007)(66556008)(66946007)(2906002)(7416002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F5J+iij0yI6e9cB9+gmjbo6stDHQi9RgLeDQ903ewZqa+iNOzwzxyTot+g7H?=
 =?us-ascii?Q?j3z5mitil6VMcUM/mlgSGhe2CcN6/FVxctYCoJfWa/9Rw3FfF+GI3MhZB8Va?=
 =?us-ascii?Q?j5+Z/VgfIjdRLSMHiuPcDcs9JsriT5MqxKPFLdbPaIb0e7ji2DTFTHq6dlS4?=
 =?us-ascii?Q?WDO+qbF1GZysC1qFazWxSrATmw3KPTHDC7l2rC/9536ddvUG+u6GBvhTox5e?=
 =?us-ascii?Q?nbbsj5+GVYRPgUU0lxdNtv0keF/dbliO7Oc7lGer/b0lQQibNdVP+rmux8oK?=
 =?us-ascii?Q?cTo6FFTgBNsZEVvdZc8ctNq9UGuStMzEu48BVrqMIqlrVKhlOJ/KZQzX4lMy?=
 =?us-ascii?Q?9WMEJFqqqaHnzQahwTAyVX3NKJKi9qsct4R0SqqyF0c7SayrN6T6VuLTBPPw?=
 =?us-ascii?Q?z5Fvtd6WBnbb0zU8i2VFUar7ZcHmMY2kx1BQNqO3e2nDENg/G9d5RGBg+nSK?=
 =?us-ascii?Q?jVnIj4qr4tsIp4EPcOlOqBqRsH3txtKVvdKlb2SnCDQbZIUlPiTSAZg7FAas?=
 =?us-ascii?Q?Y33duM6TwB6CVUh3zfMnI7yLdtSN62vxvM8FyBF4QXKgyLr+hIwINwZQFoIT?=
 =?us-ascii?Q?h9xOmWqbAlBFtB/c1DyGdwt0AUjxox+EtAghWozA6A8ODWYdlmiA1rFwdS8w?=
 =?us-ascii?Q?L+wRsodx2fRp/9lmGK+x2k7fQhHmv+jP43Ykkhfg4aWuNgTqpPcqB6dMaVpa?=
 =?us-ascii?Q?kS4Xba1IMXvTkOSEPSochBKzqBmlMtKOZi91ph2ZSsTkdqkhVDeU5O+2GEvX?=
 =?us-ascii?Q?5ouvzOSWuJW4R8LhZ/+iYHbxEfsfXrEdFPnZ25Km2kUgMVsfE05lrmTLXrYR?=
 =?us-ascii?Q?E1cNiDcbc8Zl/DjCNpB9sX3GEy5UYccr3bb4xypCksjxp1vEMJUuv6U8k9p1?=
 =?us-ascii?Q?Qmx7TupdYdpHVGKRJWiV56VjKHSfeV0U9RzIt/yI8ehLAjfdmFgvk7tUwUI1?=
 =?us-ascii?Q?6P/fHvzB5zgxz6iIDLUZRJ9jTMTzJg4f7tpHR2zvLzHdkqWnYMA4R7f4pDxE?=
 =?us-ascii?Q?2rXreqOpUISkWv62u/lm87ToAajhf1E7tMY6TXczQ7N7+eonq8FU+xI5MOja?=
 =?us-ascii?Q?kUeXIhfVsIFFVoIpnFkkdVcIjixsDcLFT2L4hJmvXjTE6gjTcZfKGrnltJhE?=
 =?us-ascii?Q?BFqx/caqfBkvU8b1fcRrWyYeIrja4TSxoAnIS7tuhWFuJrI+GsiL1PARb5kb?=
 =?us-ascii?Q?OW6PEt8fGbhWtuPkGsESdV/YdsJrt9BV/agqtiwICi8tWx0HIGfhN8FNsZIu?=
 =?us-ascii?Q?rziuO1go4fWLjLnUmnBRcDNMNyaEM23be5+Xqpt2Hw3JJHaeqsx4H3YhpAHb?=
 =?us-ascii?Q?eWrcODopIvpgoykLoAYLfHdx6Xk+k9mxC6kFHsx6Y69hjjue0fKeo6Sjl7uD?=
 =?us-ascii?Q?erEHaClMDlOSICIN0H/StSZvJepDdfi4Hh3fmusF6PQ1jcSuOxktDg0zruBX?=
 =?us-ascii?Q?lgpD6BJweJlqHcXjBbms6ZCKR3/wKpepqOU8FFJdekr5owWrZm2Ey2QUXBV6?=
 =?us-ascii?Q?i9WvrUTvNincxnUCF8LgBDS64V0nJx5z4vSr9gQX5+0y+qi7eZ6B5EkFU8J1?=
 =?us-ascii?Q?YfXut8rXrmpShejM6fyOrXZQqqIvsOG+lpcDr7OawP219E2ihCglCr9djzrE?=
 =?us-ascii?Q?EdMuMWdPt0INNSzWuP9ShVI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 01b4bba0-19b0-4be5-bf1c-08db7121e5d8
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 00:04:21.3484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rzuoRo1pY1vrkPH8MQImhuqSlX2Ukao5oOOMTpoiCtgAH8RBdQSxUmx2WGgVvzS4Kovhq6844I56l74Yd6sf1+liyzvaMgZ8FjGuiCcEK/aEWz4aYCTaV+wQ+JagV80L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10425
Message-ID-Hash: ETOBEJZYCIB5V47SHWW63QE5ZVFCVWPX
X-Message-ID-Hash: ETOBEJZYCIB5V47SHWW63QE5ZVFCVWPX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ETOBEJZYCIB5V47SHWW63QE5ZVFCVWPX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current snd_soc_of_get_dai_name() doesn't accept index
for #sound-dai-cells. It is not useful for user.
This patch adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h                       | 2 +-
 sound/soc/fsl/imx-card.c                  | 2 +-
 sound/soc/generic/simple-card.c           | 2 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c | 2 +-
 sound/soc/qcom/common.c                   | 2 +-
 sound/soc/soc-core.c                      | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 943f0a1b2d27..b27f84580c5b 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1319,7 +1319,7 @@ int snd_soc_get_dai_id(struct device_node *ep);
 int snd_soc_get_dai_name(const struct of_phandle_args *args,
 			 const char **dai_name);
 int snd_soc_of_get_dai_name(struct device_node *of_node,
-			    const char **dai_name);
+			    const char **dai_name, int index);
 int snd_soc_of_get_dai_link_codecs(struct device *dev,
 				   struct device_node *of_node,
 				   struct snd_soc_dai_link *dai_link);
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 78e2e3932ba5..6f3b1428a5ba 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -586,7 +586,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 		link->platforms->of_node = link->cpus->of_node;
 		link->id = args.args[0];
 
-		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
+		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name, 0);
 		if (ret) {
 			dev_err_probe(card->dev, ret,
 				      "%s: error getting cpu dai name\n", link->name);
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 5a5e4ecd0f61..5b59198a0384 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -89,7 +89,7 @@ static int asoc_simple_parse_dai(struct device_node *node,
 	 * 2) user need to rebind Sound Card everytime
 	 *    if he unbinded CPU or Codec.
 	 */
-	ret = snd_soc_of_get_dai_name(node, &dlc->dai_name);
+	ret = snd_soc_of_get_dai_name(node, &dlc->dai_name, 0);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index e05f2b0231fe..3ece4b5eaca2 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -288,7 +288,7 @@ static int mt8173_rt5650_dev_probe(struct platform_device *pdev)
 
 	np = of_get_child_by_name(pdev->dev.of_node, "codec-capture");
 	if (np) {
-		ret = snd_soc_of_get_dai_name(np, &codec_capture_dai);
+		ret = snd_soc_of_get_dai_name(np, &codec_capture_dai, 0);
 		of_node_put(np);
 		if (ret < 0) {
 			dev_err(&pdev->dev,
diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index cab5a7937a57..d9ebb883b999 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -105,7 +105,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 		link->cpus->of_node = args.np;
 		link->id = args.args[0];
 
-		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
+		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name, 0);
 		if (ret) {
 			dev_err_probe(card->dev, ret,
 				      "%s: error getting cpu dai name\n", link->name);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 8dba5bb26ffe..7b13b1b232ef 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3355,10 +3355,10 @@ int snd_soc_get_dai_name(const struct of_phandle_args *args,
 EXPORT_SYMBOL_GPL(snd_soc_get_dai_name);
 
 int snd_soc_of_get_dai_name(struct device_node *of_node,
-			    const char **dai_name)
+			    const char **dai_name, int index)
 {
 	struct snd_soc_dai_link_component dlc;
-	int ret = snd_soc_of_get_dlc(of_node, NULL, &dlc, 0);
+	int ret = snd_soc_of_get_dlc(of_node, NULL, &dlc, index);
 
 	if (ret == 0)
 		*dai_name = dlc.dai_name;
-- 
2.25.1

