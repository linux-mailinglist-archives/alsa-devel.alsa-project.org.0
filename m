Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7FB894953
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 04:25:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A137F23CD;
	Tue,  2 Apr 2024 04:25:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A137F23CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712024729;
	bh=slNqMxuPq4l8l2zEnwsZFnXV9YmRIBN8eUtk/d3laPM=;
	h=To:Cc:In-Reply-To:References:From:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=F25nusieUZtWAePTcLuLE0LTfv27xleSGccvbnYHanTHZFFEgIy3llCjDwYMOJX1U
	 iwYltjbW2aLASrPWUPuPV+FADN/ES3XLyCQN7KVFcNterf7qRW/qsLPhFlx/ommXyL
	 gl1PUH4F5ZnWRU2XyukZQyBYZHZzoYk5oynjoy6E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B105DF80615; Tue,  2 Apr 2024 04:24:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03DE4F80619;
	Tue,  2 Apr 2024 04:24:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCFA3F805B3; Tue,  2 Apr 2024 04:24:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38DD0F80236
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 04:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38DD0F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lHzWPpIH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZBrODI7Gh/mxlIOgoLXBoX2hHzPJuaW6T62uSQiLHGL1ZHXnvx/BiaTONJchY5FvuBh90rAwfNHRNltBZFlDZTdyXPIJtHhoWapXZoBzhslTaa2IGYPg9MIL6D8FnpA0R87mTe6FzQKbt6FijtpIhuKBYOUx/jSdVaqs7Id7Qtuuv3MlbsQeLxuinXvlNdFDewR0Y4Yb9wCMtP6p++OU/Es9Vw95wJ5P1AUmxUKNXrouqxIHRuzZz1xMPH/a+Vcoyghryg42uxcKakJTQ5YqALrEvLtc+UYWCeL72C4a65p5MjHuCjByLinuOhjjqAS8UUnlp38iI4lWvDbcFMQ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sojclz7l8YFCgCR3Uj7LApNPiZsxG+qFeKQJAkMxdjU=;
 b=ItkeXp36APaqFcexf156GcnHBwtnoCB+vdxiH6qsVInAZrPvBpJm2H+yVVLPBuQF6Z7j/fd4Ur1Rpuhn6EFQBsMokt+AVqsLDl3sGoKLPnR5KabvlH+wGdu1nj8C5vmASljoX7slvmJfkULCXP8Noi2G5kYKXRJ/VozXjVRzkoiGihOCR8jOxK78yp+TCdylR1De4bR53HWb3BqG5ZreeBMoXYIat4ZRZGy96bFbBz2TuXFVkV9c+oFnC0SVP8XGFYiV1OyMPTpikodiIfCzlFl8ubnTiLcodtmN4MwPV/MnmK0Bld/Zge+uTUQu9odDufhUvV0p6fhZB3kccF4UKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sojclz7l8YFCgCR3Uj7LApNPiZsxG+qFeKQJAkMxdjU=;
 b=lHzWPpIHvNfccUzunHQxDb7SdCPiinEloAcQrC8/mPJjY1uJ902zil2vqfhkGpgzYiAf3L5Sg4wGi3IHpf2AOTV+tddtI8iqYxqtnsWz/6kNKkCxK4q2s5utvgFr4DXc4COqZoI9at+nRkgbsasdwuakSiU67fZv8W9srfKw+lA=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5959.jpnprd01.prod.outlook.com
 (2603:1096:604:d9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.45; Tue, 2 Apr
 2024 02:24:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Tue, 2 Apr 2024
 02:24:15 +0000
Message-ID: <87wmpga4ds.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <8734s4bizh.wl-kuninori.morimoto.gx@renesas.com>
References: <8734s4bizh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/5] ASoC: rsnd: R-Car Gen1/Gen2 exception
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 2 Apr 2024 02:24:15 +0000
X-ClientProxiedBy: TY2PR0101CA0035.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::21) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5959:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YxXGby2iiF7nIoZTqgjM0rWmH4kaOI2+NKXoxKIRwlkYtU5h/c4zRse0WkeMK1IJLr3u4zXIp81RUGoMjitfHpkrxeG4cMtd+S50hJTnq6c+dTkEAPVOG+vVw0dCTU6/NYINvTMZ6w6JBvGtc5MF2Jp4pWjurhEBYYMv6tLLVpocWIrPhjxoT1lvdYVH3eZ9FtkwQEb1jcLr62CvvV54lh3KbMDmYNpH4EJwuu9ZjjLzJ1Q5Gs33EBAZvAfxf3ZqiUflBzZnPWqRsEDa8I1mvsQxOyhi2yHOPAkh4xk8kkRH8E/4tyYADlSsWdbkFYchggdBXNx1R6Punnz7x7ak1PQ4q5EMfn3oUBSN98b3TR/xRUMooA3ZW3QGzcMCvsRVqRRxN0qOf9UspTxGiA8E6ZRN7CdOJlHHvMd26fDpDBJ7I37aGFhZheM8ZAn1aFrD5Asf61gMHFs+VqHQqc4GDfhOn3SdvWyTsbIqLIe1L5XaJwaOtzMbtO4fv/qYb14OclCrVubwWjU3vDLMHFjLDuMrKx2XwMz/Q8rQd8BYNHL47SqcQ+vnNY4hw01B3YOaTNLHlADZ6+OTLizUEA2hoQMnezmyhvnBVESgppl1kCUFQmCVGiVj8De257Ni6CKmIzGniKGB0pLFFkxCeJoLMRmoMBSIH8+dN6wfRrNOmEJgPL7gaPdFrYqp/H8GkTxBKwSx101SVdacpCvxFhe5FZO7K3V3BPhLlKjtBlywE8A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m48DlWlKWVxdmqBx6p/IOzQ7oHsCsIZNNbhAFrOzCtAl7U7dPwGHTwMotd97?=
 =?us-ascii?Q?b6Boa7Qav/jv9L5D8CNhKReU+uIEeVnwBz9gFZF1qtSWRg5Rsv88CpMWX6m4?=
 =?us-ascii?Q?alTY3K+6oEuIJsGiqaZ3NZqDPkElWApNgY6m7sEG2+wytCAC1MoDxOLi4I5u?=
 =?us-ascii?Q?cC4At9+nnVB6YPWJW5gEZooXXsUD9U4AmRsG6eImiZHp0+4Q5VXBwq5a67US?=
 =?us-ascii?Q?DdWxME4bdYJPXUMPtESHeRIq3hOvNOa1vBCGwRVqv+PMIFZt3mpsLP8jtvoN?=
 =?us-ascii?Q?1TTWQ9C3rN7daDE8vcgHiUl+WAWvk9K+RY3wn9XYU7VThDTtHGn3DdimuhRa?=
 =?us-ascii?Q?z34VGSmlWrlw4WASD4eeNUmklw029Zcur60VtVv2wG0AcmKpIhwbTG8W1xf4?=
 =?us-ascii?Q?xof32U/tVKD9z2Q3pDWJSnhSqDf86JchyqWwPfESOTADrRdEfSuF7TxIxRR0?=
 =?us-ascii?Q?b4SNdtI4+R7FwPs/aI4s8+DWlyY20kdqYVTIJriDVooCM6E3iwiy9Fsik91/?=
 =?us-ascii?Q?S1NcuUTscSO/sul0QmI7ONH5oXsIKxnppjMMUj6L40xMYianhwT48Majh3iZ?=
 =?us-ascii?Q?kuBtF7MlKlgBKMMB21M3onOhnUjCCPgJZmnNOpXJeTJbdPWpQ1HUE56CYOes?=
 =?us-ascii?Q?jctOUlEt2A0jpvV+pV0NhIb2N3CruW/4/88SUhIN9/nYpMkMMy+mC/8h2n5v?=
 =?us-ascii?Q?R4p1/GD5WGJQyI/NWjrgcggq0HT5DJQDe/kdxbzP/iHiuXDAcWg1zYo6o7oT?=
 =?us-ascii?Q?x0CPuIyunylUZdzrKdiS8T0EY/PnnTHEYihwRpxqrmkzxDXXQFyKg2b4tJJL?=
 =?us-ascii?Q?R9I80exJymNSgWscylZwyI+zI+fUfIzLWhfXrzT262k/Wunz0Wj2Mur2RPyk?=
 =?us-ascii?Q?zqrG3oV2sb1Soa7eB/yf3RcxrNpKrVUTZt9EkWPHgyvNji1YV1BIIXneM91h?=
 =?us-ascii?Q?+kt2OgHmyWIdAiX3xGUF7WFEfkQ8BH9BuuT7gz+VEcxGGZoHtOUxnkra9sXk?=
 =?us-ascii?Q?C1xPOthXdp0oHk7dYz8TOK1ATxmHVDb07nnm3SpNPudxHs8Djd+UMK/P6oFe?=
 =?us-ascii?Q?D9z8XqjFqwN+A9Xh2mUEn/KL1u9AFJohHYOtKQP+zsw7B9hRJELSlmLcYsQ0?=
 =?us-ascii?Q?tJHb95cey2Dyu+6NDfT0JCKtxLQGz7dHMGvXKWm0QrZlc0y0wRCou3FsDzSu?=
 =?us-ascii?Q?yxFPMTIx2H5vBvWkFdWekRfRJcjJ5vZFWC2BSI4aHNwH/3VwwoojM2ARhROV?=
 =?us-ascii?Q?T4OTmzwkzYZqev48k0qiloxc6L5D82khrBmCUa7rlVZ8G5sf14hHoasSrD1R?=
 =?us-ascii?Q?BB1DHubBUn/9zbsRvpveeZ/FMBkWpf3AxUVWUMh9cc/WbRDuw+j7gCT2CZid?=
 =?us-ascii?Q?ObmL+XTXQ3lNxKrgnAkrhP6OvSbnJlY+f1rm0F0aazmO7IhAfA4086EwUBol?=
 =?us-ascii?Q?X9Xxe49+fW48mXYT1dOOXD4qACGGxPNeoy/UN72vmn1tl7610HFF0JUd8DhF?=
 =?us-ascii?Q?FXz3Z///qJpNouEAgeJCcb7OL18E4RZtob33BehyHNM1D3BCcVvzcEuN9tXC?=
 =?us-ascii?Q?F4CTy4YHWKYHYegFV708r5AS9K0eeJN7uefnZv8XyyXbRI6u3ukThhZLdh+O?=
 =?us-ascii?Q?qfWkc1JUoOxQEtYDipXLCE4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9c2f5c06-32ff-4e1c-32b2-08dc52bbfe43
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 02:24:15.9101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qAS9q8/SQ7vZKqob7LP9O9F9GmoK0SFXtTDqU6H97Z+UbDae9krMmb8RuYzZihJ0LRTSb8zHPpXVGpnKEZTrWVvMRrjDFEbTZSPXnN0ECEX03xI0K2yuXIHR/8ZXNgGD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5959
Message-ID-Hash: DLW2CXAU3FIUIVINUNNRGPNKILEWYCZB
X-Message-ID-Hash: DLW2CXAU3FIUIVINUNNRGPNKILEWYCZB
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DLW2CXAU3FIUIVINUNNRGPNKILEWYCZB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Renesas Sound driver is using rsnd_is_genX() macro to handling
difference. We can use "grep rsnd_is_gen" to find-out difference for
each SoC today.

In general, driver uses flag to handling SoC difference. But in Renesas
Sound case, the differences are very specific, if you try to make it
general, the code will become be very complicated.

Some of them can use flag to handling, but we can find-out all diffence
by using "grep rsnd_is_gen" today. It is not so good, but not so bad so
far. So we will keep current style for a while.

This patch cares Gen1/Gen2 exception by using negative handling to makes no
more update for this part when we support Gen5 or later.

	- if (rsnd_is_gen3() || rsnd_is_gen4() || rsnd_is_gen5() || ...)
	+ if (!rsnd_is_gen1() && !rsnd_is_gen2())

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 0b1aa23c1189..6bc7027ed4db 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1512,7 +1512,7 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 				continue;
 			for_each_endpoint_of_node(ports, dai_np) {
 				__rsnd_dai_probe(priv, dai_np, dai_np, 0, dai_i);
-				if (rsnd_is_gen3(priv) || rsnd_is_gen4(priv)) {
+				if (!rsnd_is_gen1(priv) && !rsnd_is_gen2(priv)) {
 					rdai = rsnd_rdai_get(priv, dai_i);
 
 					rsnd_parse_connect_graph(priv, &rdai->playback, dai_np);
@@ -1531,7 +1531,7 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 
 			for_each_child_of_node(node, dai_np) {
 				__rsnd_dai_probe(priv, dai_np, np, dai_i, dai_i);
-				if (rsnd_is_gen3(priv) || rsnd_is_gen4(priv)) {
+				if (!rsnd_is_gen1(priv) && !rsnd_is_gen2(priv)) {
 					rdai = rsnd_rdai_get(priv, dai_i);
 
 					rsnd_parse_connect_simple(priv, &rdai->playback, dai_np);
-- 
2.25.1

