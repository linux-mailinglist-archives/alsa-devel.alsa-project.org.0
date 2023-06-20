Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3352D736067
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 02:06:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7D21DED;
	Tue, 20 Jun 2023 02:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7D21DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687219604;
	bh=TKMcsJdjDct6fxgU3yrn2J1Au9docZmnkPHOF040L48=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gdLe9q36jpe91BJ5WzLr4/q0ac1hRcbO+akfcf6ioLA8zGBZ1eDynr60eZBva5fI4
	 QCAsu+wXdDkbLP7yzhNcO4HwXJbHFvu6KKVfVlPlzKe7A5IU0FFMN1xedVMO3nN/WC
	 FI5dEBSqWFGqgx3ASh8f5dpDYVee4Iy0EuMYtnT0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A664F8057A; Tue, 20 Jun 2023 02:05:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF09DF80553;
	Tue, 20 Jun 2023 02:05:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C84AF80553; Tue, 20 Jun 2023 02:05:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::730])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5682F80558
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 02:05:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5682F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Teid/Rev
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aShIEUzmHv9spgJHQVB9+kO7GYLwOww50Bn7qzhrL8R3Ov0xvpRSBzHnP5xGFqvgg10cZpOxbOq73eqKOwjdme5IFYRxLpsd2v3jy4JgnR72OEb9m8oaPYVHZN/7Be9xIUu+BmrWA7m9vp+3cZXvRwFNvezuLhZ+QgdL/I06S9WTBHIJ9FTADzSvWcldzOTkohv6ZBMXw15ijxCZMOwDAptt37eHYoy9QO5ZIGnnd+7wQvY3M+pZdEbuG/IJLgcoS8PS8OvQxHks9EkcVKtIgORbC5ie5iSxKryD9Wvi/MHNKXMJ2bi/Mz9iywRfToJF9hDuagsHITaxoF+jWGYNTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPkSwybPvWp/m43idPntF7ZIzkj+MnuR1p14B9pv4T8=;
 b=XLh5BcEoEWW1iNUc9Sd0bm0YTb+QDCPKgEDKcdOjJQXLNFzBQ+HtoayolQdsAlHGt/3yk+4LTf1ROTxBv0EiAEATcTqqndhOxVuY/WxxaDzoQ5sQ2cKAC6czdtHLLoZ0gczA9/aGEJU9kAqYsUUov4GqNIR597fpAdoUtSzupQznjVrBT2Z4b7utE3IIm1ulLSDFu9UMtTKN9Iekae48AenUYZLP+JYIRsOtUARBFPgPpggjr6cIdFhiVmLLt85Rql7VRGaorP3x6Urz8ydve/AVmspyf+nlLR9l1/+VkVmM84xGMMwgaqbsI+PM9FaaCc62p0R5E97++we9ofy1Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPkSwybPvWp/m43idPntF7ZIzkj+MnuR1p14B9pv4T8=;
 b=Teid/RevZSm8ik5uXXYv6m+d0ItImEohXs3nDhUVDWoWieHQVzhm06nPfmQH1eytHA/zYDXUJ5Hey1LS3EsQbflz8xNjbPAeqEEzKAgJpSU48eg/KJPUH8hCoiUSGPamK2s+fcRq2yUbfIe3etBNQgBFKtVoQdm+HBvZ90vUF6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10425.jpnprd01.prod.outlook.com (2603:1096:400:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 00:04:58 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 00:04:57 +0000
Message-ID: <875y7jdmmw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH v2 5/9] ASoC: meson: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 00:04:56 +0000
X-ClientProxiedBy: TYAPR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:404:28::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10425:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a46135-c948-427f-a065-08db7121fb1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KNRIVkF/o2SSfxeybcxON2qlkKdqHqOwATDXZTS0sf33+8RGAnT5ssaiMZhEEVkT2h9qbABvOdAlNTFRiWwUFBW0iKp0y6io+cfimCOgB8p8ASJvmneJ7E7yhg9dJFHzKPM5UvWsY3JhUJNNhazPMLNiRsn9kbVKdy3DY6cNSSi88lx1vW+4W/vEsVggkXUFBG6KUhnPKzMBbd3m/U91njTfR1P+++n0bRRWV/4ifuiJTwxpBnckV1uBauiaMJJjZ203VZuHPZVw2Rcrr+VQnfcRZNfCxvdn3zNvPrt7fz0W2drNX+y4YkH7xi80DrM23XAct09ddzr0NhkgFisAhGOaHpo04expJUaDBBWyTWwoa3KPFAtd5aJVtjIwVlu1Lj7wrK0RNi3OZU0E5acm0jiE5ngxbOssE1PLwDykrrbroZ6R/Qfe7ty/wye8w7ur1kRg8hAmx5EwNMDWub0naq9kaSbM4AJSD9zlqapoXRViIw5YrXh1pX2mc8WNSk9wNuxHLdd6PTirhouFqDDygHWJbvluctwQA3lYI0nWO40xqWUtcvj/cV8NuOhcUCErCQx28KgoSk360v3LVts+HsePDfWpfClOAxHNI7UTCxS7FXk5uhcj5q5hAGc5Ciik
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(8676002)(8936002)(38350700002)(38100700002)(5660300002)(26005)(6506007)(6512007)(186003)(6486002)(52116002)(86362001)(2616005)(83380400001)(478600001)(110136005)(316002)(41300700001)(36756003)(4326008)(66476007)(66556008)(66946007)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?K4kq70Y/QuNR5mgqWRqIRSE41ate2zNB5MV2Jgj4k+TyFn0TlrHYSJKs9B3G?=
 =?us-ascii?Q?v9VVgDL3ctZm1pv+sl5BnJi10c+tNJOf0lS3Imc2SzpdewFEriaiU894sezw?=
 =?us-ascii?Q?0fCzX34sk6iDHBoNf5IwQ7o0PDSew6jSB9dD++VFyHUNWa7NtaBz18PZyS4Y?=
 =?us-ascii?Q?UxpyXrBLsSwVnfhouEZQ5dG97H/i2SfnD0ZRgOI8OsFs7Hn0Tdyc2SWPfmnQ?=
 =?us-ascii?Q?RhtpS1vVnpwApWezqqlgXCque1Hhvn3c22BnxGlVAfJ2jQI0vdSvdq3EHhlZ?=
 =?us-ascii?Q?nIQ589wq4QS1sfde4ccz5Cx3P9hIawsH89nQGI4BEip1mIXlHJrlc3KseaGL?=
 =?us-ascii?Q?e4/jxP/alPFDhJBWxncjMA3ZTvgqVyhqMeEJJ0BL+ZmsK3kPSTgz9SRwszfR?=
 =?us-ascii?Q?VEFOtMMcf7YpOIOhu5r/awiEAT52WUg1B1lgz9n53IgvfCOPRxp/M5ETSDAC?=
 =?us-ascii?Q?z+hBd6BNmHUzXbbNWBtSKAXUUYIDMEN5FnKP9J/ReMtHO5c82ZbAtHZDAmNp?=
 =?us-ascii?Q?L88FcraOROJqlekzMKVrmomk+c5zNF0m9S01T3lKhJRauu1WWg5i4duBB73z?=
 =?us-ascii?Q?iTNfsDd7tLwW6GBrKiAjS/upnhnPheH3TdmOjug8Be9Lk5iISilVrRA+M3og?=
 =?us-ascii?Q?cFXFar98otYe9IzfE34vz75HbvgRMjKeZ0YHwl/8NkB3rlolHUiJl2jP7c6I?=
 =?us-ascii?Q?7dRz9og3Z+DioC9PL6uS/vBOgPtF6aa9SQxDaAidz9oqAhs5xSeG2OY8awBM?=
 =?us-ascii?Q?F+7xrBxh9OoY/pr0DP0330AWiPuObbpSvNvRLplPsc8WLP9/Gy9A8JsxTTIV?=
 =?us-ascii?Q?XrHldA/E06rKCTtJmlBcHWTBjBa6oC+iZjT04BlC6YzzrBPEFaCyh4uJ8/RV?=
 =?us-ascii?Q?eW57yQ6rx36xPCTpQYupR5LHWzx7X5wO7o6Dbzt4FLglY43oFWo+kp6hLhCi?=
 =?us-ascii?Q?JAmvVYAZili4eAaC1zuXuFXqwGGVC3WATtWU68UlG3Ee+lSetH4aXDe8Enfr?=
 =?us-ascii?Q?wobWes9uK16olT5Lr9+dMO1HLmz8lq1j+5skUNF7X3CxkQAON/HPm/pA0yq7?=
 =?us-ascii?Q?lKd0j7uqkAAQKSAQuaJFSKrorzPzJLvcPj5ahqQUQKi3rTwIeqysbAV6T9Sw?=
 =?us-ascii?Q?1BQaOqmntbCQUNrjZuJKUEi8FlgYDM4xupDIJKy52mO3lgzpe7J3NFs0GfKY?=
 =?us-ascii?Q?y3s+SMl6XGEwSzuxboT0xHyd7ykAACatoh2kxfMi48KAnYy8K/wyVWRIjEs2?=
 =?us-ascii?Q?agXYFWN6fUqpqyWKTA8BqMKaQqQJGKVRyrJWYawU7akcDWHcHkKKfMWL4ViW?=
 =?us-ascii?Q?jo5bQLr3M3MjwquFZBeVKrp7iQpsp6pBRsT0LcJ1yxFwalcYmsL+xDVSWjDF?=
 =?us-ascii?Q?sJz1c4+p1pG1zmnWACvJdl7J6Y2ibKYGXS2NEyimS9JUl5JW4e3YIMr4XVfl?=
 =?us-ascii?Q?vbR2y31d6CAS0+MQ4OiY2/SAdocK8olakWWCTRBOa8x2YoUh+e3IGjOPIQSP?=
 =?us-ascii?Q?VPmX90IFdU+7GQUdm1b7jMd8sNfzO3ko3PD7f8Dc2mYVF4ro1ReP1mrBgiwe?=
 =?us-ascii?Q?L0jrPiZqfgkIhRwiXevtIQlFSePIrgV4o/qjvir+OZaquIiKMcvN79SPy+AP?=
 =?us-ascii?Q?P6tqEFQ5tPG+vFJ62bWl8qs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 97a46135-c948-427f-a065-08db7121fb1f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 00:04:57.9273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cakHX/v8q6DNF+gQhu9SlC9R66vvZZhuIBwXAX5QfR3QRwpXaXhG3NDwtRnKPoz+TJeeCcgR/fnXk9HemEF+pIO6pxRsRqj3swwLaXyReJT6VCgkdzZx9iHxoFFZcLQP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10425
Message-ID-Hash: YG3TDLQXD72G3DKJZO6WQDKNF23APP3M
X-Message-ID-Hash: YG3TDLQXD72G3DKJZO6WQDKNF23APP3M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YG3TDLQXD72G3DKJZO6WQDKNF23APP3M/>
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

