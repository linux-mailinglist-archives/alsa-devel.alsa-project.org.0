Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D9C786508
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 04:04:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF50983B;
	Thu, 24 Aug 2023 04:03:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF50983B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692842678;
	bh=+ythICu/Bsp8jyIEbRCvaLLYrHx9djvn+1KN0UZ6pdI=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qvGyqhx/eDIb7HXrrdkvQaueWByKl6gYlBRSzc+F/SrOW9w3JFSjziZI1lmU0MNZu
	 9d8P/RAPmBHAl+q/hdsmo27f+aeH82wrLfCuA2Tvblpg/xOSu5i2dTisva6WISANsY
	 NRPN1yCjXicei3ajA/wG57jJrQ44KItvi0Iz5Mdc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBCD2F800F5; Thu, 24 Aug 2023 04:03:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE69FF800F5;
	Thu, 24 Aug 2023 04:03:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6924FF80158; Thu, 24 Aug 2023 04:03:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::730])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE481F800AE
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 04:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE481F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=WgqX6Zjv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRDnEzGtGw86A966ZwbP6R99++WeDQ95ixr5AxjFUjhO/ElImysjQVFVBB/ap2Kz3huHCvC+gDQ4yokYX5RxJo66uAmWBJInDhdnqKT0QdTkqkt1R1qRn1PMfTlk0aHJY21wLZS9+n1BqR1/XXWm90eWwuO134cEjGM2mK0VNdd0Z4/gVcjBELw3jxYt26hJtBanEr838UIHjWqkEtvEfi5KRHTGpRepu3MLorHQmwlb18YurzTziWfmQZdvrvtZuLHadI3vNVn+Inr6xxZ83BsxsKDjAfn0GEUWGCDykYDJc45dKwEN1BI150+TFFoDidMYK4yLEQnit7Bi1c2uVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgaXiX13lbQM4WPs2mgRyOGwO6YsnVtW3ANj4YcDGrI=;
 b=LVOdUA7TtjBtWBrou7zDYC00NnhBOfZ67NyGp5YfSsLa+uL4D3NSCBB3SWZ2SvKlfdPZt/KtIhrJDV5Pw7wSu6buQx/pehu6sriN2JWhFyxGMGZYME6Eh3+EUFlm7aJfRXP9UisQHszN+5z2+EkU4n9ACH8/OkfchzuEnwSNKa+Q25CSdl4nSbNAJqEe2bojro1wquS/mDBThn/Eyd8r3XxEt+bm9H8eQeZjfTPsri4l/3p8lklCTK9kbtdv7UsG8mT5txIl+Fyk+vumUwKdfqyzQ1lNFIanWf0emx1h7aJwOjOOVq/UQRCO6nf3Tdv11W3A9RlL9MkJiZbvS/MiJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgaXiX13lbQM4WPs2mgRyOGwO6YsnVtW3ANj4YcDGrI=;
 b=WgqX6ZjvJcFj3EBucLX2gYPdlmFgT1j98zzveg4DAw1Pq5TJh+cWlecNAE2hKJEVvNZ6kVmvZ8fDw8ljP79jtGTd4ew2AayPaXHUlDWVmuW9bp9RoysI7O3trc1csM/RHfbvVTC4D4xRN0mqHQ3+cgK/BTOBb8un94ODANhgjQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB9336.jpnprd01.prod.outlook.com (2603:1096:400:194::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Thu, 24 Aug
 2023 02:02:50 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::7b2c:6f3a:1aa:79d3]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::7b2c:6f3a:1aa:79d3%4]) with mapi id 15.20.6699.026; Thu, 24 Aug 2023
 02:02:49 +0000
Message-ID: <87r0ntmc3c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: audio-graph-card.c: move audio_graph_parse_of()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 24 Aug 2023 02:02:49 +0000
X-ClientProxiedBy: TYCP286CA0109.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::6) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB9336:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e76094-1d70-4290-4c7f-08dba44637bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mVgUwk4lZYfSSzlZ8YNfFnQUNm+ri03jx82kPwpDSnFXhPMN0ksbYm5zBA7oRPShxpKLX9cmot9fNHsMex/23dZgWDjjU2jZ4jxvdhYy0XB7gj34QRGFH24uHnVdHnn1sk1hxrntNBeV410z1mmDatiB2sUT/6sI6qSQiyLKlAAvJFZN/xdvGYNgXASUv1wtIYISkkrGRtqU19CJVq+rzPNts6SsZvg8U2UzKtQvBlF7mOZ5E/AiGqYAarTD5Md9GuB9U2Xy+nSGw68DXDG9Nho7ygEh/jzV9nYZN/RJVqYjjjgoefoeZZC7U2M/ty9SJPiccknpgH9m6bc/8DZkH5bwJeUCo41SkRRKb4MTwc3O9+gjAxyfHY9GDE23uPFIM0f5/6acBXity+LMhgzu3A7+Su4ks3x58zX38hXVoONrShEveA1uL8FnEH97FQw1qoQ/9Z0rxxnj761OKS4vTyaVMySzeaHRUeiaZ1eXMOaodUWB5KlLex42o4CK/Mn+G20jaiDNnf5LDSajTwpXuqHS/6fiFZztxT3xX1WV8bACWGswbLlkI2slp/IFNQMWM7FfxzuuCMy27kMijt24mxaNv/+xXAcgvWpPgXStyE3vdCV8rLkhY84eJctXKxdv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199024)(186009)(1800799009)(66556008)(66476007)(66946007)(316002)(6916009)(478600001)(38100700002)(26005)(38350700002)(41300700001)(52116002)(86362001)(6486002)(2906002)(6506007)(6512007)(4326008)(8676002)(8936002)(2616005)(5660300002)(83380400001)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VrxCBgAZ+28WtiEaaALD3VZfz4YkQnfUSl0zRRxdZK4L6jZnOvFq0WT4+b9L?=
 =?us-ascii?Q?DmSdmxuwFern2nLjpTuKkXX+HaDwUIyNIE2eJXZ4hyrlGAekNszC/Q7gScWG?=
 =?us-ascii?Q?ui4ICePijbuF/bu7TdVfL/N+mWCqC/oWJY7/XkCMvp1RT3FYIDhGdbTRGijF?=
 =?us-ascii?Q?CN7FPtHidbvWzVV3pzsZ6iQk6d+6xD0zA6PHQpkx2OiOemQXM9F5S6WZ1boA?=
 =?us-ascii?Q?G8TZCLREnxDEYrw0spL4qwODoKZBMfkg9JqxdwBa+QCLvusFT8eA8XYzerxC?=
 =?us-ascii?Q?QG26ROq0AHvKvJubCz2IyNPuIMY5b/xp2bGySJCsgGoyG54NUuavdOAG4kAg?=
 =?us-ascii?Q?bVNi93hz1ATO9/hv2st08OWT+Y1GVbORToSGfkk81/rp3QCGJcCx2nC81tUY?=
 =?us-ascii?Q?HUnruER8Riyiy4ijEFmAgVE+7NKqHU/Hj4PT78kvXo+Rk7hIOfKuH1U9qOa7?=
 =?us-ascii?Q?k0xe1Xkr5DSX++SzaQliHvnr5FtSHCneWSTNf8m5gk/lfMbAPKh4Sy+KLkSj?=
 =?us-ascii?Q?EXJfkm/tZlKayGlRb4/LkvtUQTXrnRYL/w9XHY9aRyWrFI1W0/XW3zrHbxrq?=
 =?us-ascii?Q?LmE4o3GKX35n3vIYxu4wuiDUgqAtmZZYXpeFnlyc0TupCxNM6U3719sLCPCr?=
 =?us-ascii?Q?DXW0UpkyPNQE9w/FCRfhQj0lY8gNT1c0Weqdh0IqlOA+pG1tc6DC9E+Vzw0t?=
 =?us-ascii?Q?CDQJgReiKsW3vhEBRAPlALLf11xntvuKTg90tClpdT8/z3KQZdX6p5XSBV1Y?=
 =?us-ascii?Q?j+EJmjBlipoocGBNlW0/RKgQJOGJvIlLxEUhLo/UvEJ9UgiDYz8LCrha/ZV7?=
 =?us-ascii?Q?FqU+ScgR6oK+WCr8E8MvxGEL/Wc3wIQ6utzVVhApgTX6GeIhp+Ieb0mbAAlt?=
 =?us-ascii?Q?osXJdB+Knm32Z6dgaIpc+rObcVzjanWsPyuu2ckuACxYMGDPYQdUXAhrcxOE?=
 =?us-ascii?Q?asuwatumgXVrcAWvOl5wcC47rtraT4SvnnErkREzJbdTVqoC9QigQU8vgRAZ?=
 =?us-ascii?Q?i2QFnGSYVKI0oazyyAjDSyP1irhkJM87BZDn4Zn/wKJ5mSAtNJkfqDWd9tCw?=
 =?us-ascii?Q?sSrlEWwg6W+ya+dEaqBaySeMH/imHzQynNZyeGNtkZvkDxnBJX+QscW+ij8V?=
 =?us-ascii?Q?+FryLIpyhcp+AG/sYjn1KazdoeWUWON8cGSGXg8rnNJ3TBIV/1K4QdHON0xV?=
 =?us-ascii?Q?X7enCmP+QBR1fz1iEUhZXCiqMKDA3py5Alc3r8yRb7kQyq6UWn2gRaKbfSh7?=
 =?us-ascii?Q?GWTIFPeWQqMHuP0ebDy3vMPCtHiX8Sv3zfCzL3hjXGZQwfFDCPNb2AAyzTml?=
 =?us-ascii?Q?TM88RSP0p5quGSa0eg2ZjyodUd5sShABhf1Ur+8D7T+BitJ9ld3Cr2YLcDNk?=
 =?us-ascii?Q?OG9sMr7XrevjFNbssjXa7rXnW+1Xu5TwG7x5AToY3zGb0GTBvTjPvZaKAW4U?=
 =?us-ascii?Q?cW+OH0uGfWdwrSzbzC8wff0HZzxRqK+D3IctdpevBcyIqgWErHo+8R4v4DIy?=
 =?us-ascii?Q?a+sqdnlqchmrgbHi2cvwLh1r5zhcyTU1Eku+fN0FYQf1RvcIWwtcSph5W1hy?=
 =?us-ascii?Q?qZ0gF+WC3Hw/ZsIFf9vSIGfiGsI0KtwuL71EOyaV+U6G8Gmercdgj0vWWbzu?=
 =?us-ascii?Q?MceHQ/Xm3g4mWxdIMR5rMEo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f6e76094-1d70-4290-4c7f-08dba44637bc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 02:02:49.8467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VC2TZ0kVcqQo6aZA8C42lCcUWQapGEoA9yEgj7/8N7akH894tJkDnwLelE8S7+7tg9LZYIEf4Uw7Oed9vhUIaO4xY5h3vH2ScJ3DGsooZ+EHMLitlrQTSZZyluALXoeu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9336
Message-ID-Hash: 7OSH4QY623VUKO7S3VPGHG4UBRDA5MRN
X-Message-ID-Hash: 7OSH4QY623VUKO7S3VPGHG4UBRDA5MRN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7OSH4QY623VUKO7S3VPGHG4UBRDA5MRN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current audio-graph-card functions definition are like below

(A)'	static int graph_get_dais_count();

(B)	int audio_graph_parse_of(...)
	{
		...
(A)		ret = graph_get_dais_count();
		...
	}

(A)	static int graph_get_dais_count(...)
	{
		...
	}
(C)

We don't need to have (A)' definition if audio_graph_parse_of() (B) was
defined at (C). This patch moves (B) to (C).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c | 139 +++++++++++++--------------
 1 file changed, 68 insertions(+), 71 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 13693ef9c242..844a2ef15948 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -425,77 +425,6 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 	return ret;
 }
 
-static int graph_get_dais_count(struct asoc_simple_priv *priv,
-				struct link_info *li);
-
-int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
-{
-	struct snd_soc_card *card = simple_priv_to_card(priv);
-	struct link_info *li;
-	int ret;
-
-	li = devm_kzalloc(dev, sizeof(*li), GFP_KERNEL);
-	if (!li)
-		return -ENOMEM;
-
-	card->owner = THIS_MODULE;
-	card->dev = dev;
-
-	ret = graph_get_dais_count(priv, li);
-	if (ret < 0)
-		return ret;
-
-	if (!li->link)
-		return -EINVAL;
-
-	ret = asoc_simple_init_priv(priv, li);
-	if (ret < 0)
-		return ret;
-
-	priv->pa_gpio = devm_gpiod_get_optional(dev, "pa", GPIOD_OUT_LOW);
-	if (IS_ERR(priv->pa_gpio)) {
-		ret = PTR_ERR(priv->pa_gpio);
-		dev_err(dev, "failed to get amplifier gpio: %d\n", ret);
-		return ret;
-	}
-
-	ret = asoc_simple_parse_widgets(card, NULL);
-	if (ret < 0)
-		return ret;
-
-	ret = asoc_simple_parse_routing(card, NULL);
-	if (ret < 0)
-		return ret;
-
-	memset(li, 0, sizeof(*li));
-	ret = graph_for_each_link(priv, li,
-				  graph_dai_link_of,
-				  graph_dai_link_of_dpcm);
-	if (ret < 0)
-		goto err;
-
-	ret = asoc_simple_parse_card_name(card, NULL);
-	if (ret < 0)
-		goto err;
-
-	snd_soc_card_set_drvdata(card, priv);
-
-	asoc_simple_debug_info(priv);
-
-	ret = devm_snd_soc_register_card(dev, card);
-	if (ret < 0)
-		goto err;
-
-	devm_kfree(dev, li);
-	return 0;
-
-err:
-	asoc_simple_clean_reference(card);
-
-	return dev_err_probe(dev, ret, "parse error\n");
-}
-EXPORT_SYMBOL_GPL(audio_graph_parse_of);
-
 static int graph_count_noml(struct asoc_simple_priv *priv,
 			    struct device_node *cpu_ep,
 			    struct device_node *codec_ep,
@@ -612,6 +541,74 @@ static int graph_get_dais_count(struct asoc_simple_priv *priv,
 				   graph_count_dpcm);
 }
 
+int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
+{
+	struct snd_soc_card *card = simple_priv_to_card(priv);
+	struct link_info *li;
+	int ret;
+
+	li = devm_kzalloc(dev, sizeof(*li), GFP_KERNEL);
+	if (!li)
+		return -ENOMEM;
+
+	card->owner = THIS_MODULE;
+	card->dev = dev;
+
+	ret = graph_get_dais_count(priv, li);
+	if (ret < 0)
+		return ret;
+
+	if (!li->link)
+		return -EINVAL;
+
+	ret = asoc_simple_init_priv(priv, li);
+	if (ret < 0)
+		return ret;
+
+	priv->pa_gpio = devm_gpiod_get_optional(dev, "pa", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->pa_gpio)) {
+		ret = PTR_ERR(priv->pa_gpio);
+		dev_err(dev, "failed to get amplifier gpio: %d\n", ret);
+		return ret;
+	}
+
+	ret = asoc_simple_parse_widgets(card, NULL);
+	if (ret < 0)
+		return ret;
+
+	ret = asoc_simple_parse_routing(card, NULL);
+	if (ret < 0)
+		return ret;
+
+	memset(li, 0, sizeof(*li));
+	ret = graph_for_each_link(priv, li,
+				  graph_dai_link_of,
+				  graph_dai_link_of_dpcm);
+	if (ret < 0)
+		goto err;
+
+	ret = asoc_simple_parse_card_name(card, NULL);
+	if (ret < 0)
+		goto err;
+
+	snd_soc_card_set_drvdata(card, priv);
+
+	asoc_simple_debug_info(priv);
+
+	ret = devm_snd_soc_register_card(dev, card);
+	if (ret < 0)
+		goto err;
+
+	devm_kfree(dev, li);
+	return 0;
+
+err:
+	asoc_simple_clean_reference(card);
+
+	return dev_err_probe(dev, ret, "parse error\n");
+}
+EXPORT_SYMBOL_GPL(audio_graph_parse_of);
+
 static int graph_probe(struct platform_device *pdev)
 {
 	struct asoc_simple_priv *priv;
-- 
2.25.1

