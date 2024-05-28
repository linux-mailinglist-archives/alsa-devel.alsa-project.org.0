Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2968D13B3
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2024 07:08:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BE3E868;
	Tue, 28 May 2024 07:08:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BE3E868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716872919;
	bh=Kxs3MQM9tMF6AmkgPh9kQK8vqkgFVRAEEfKiaunbNQM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PO5OkmAi2aQKmQfTskNIjlXEOkOBvyur685yIi2c/BxCWurlJ54U/I9zGNZ8U0rfF
	 RQlme7eVbpE2eq050wSOyqy+4m5J87qCJZlBnKP3ctgyyHpCXQpbk1jcd6vr6JDj2v
	 rOxDwSmKuNFVL5/SjkHu8+7CQsA6IEaVdRQU+h50=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B843EF805AF; Tue, 28 May 2024 07:06:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AD57F805C4;
	Tue, 28 May 2024 07:06:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3141AF806E9; Tue, 28 May 2024 07:06:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECC75F806B6
	for <alsa-devel@alsa-project.org>; Tue, 28 May 2024 07:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECC75F806B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lPYYLn1h
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l72TEX3vQDxEANHSWDofdcUUDZ4cPznQOlf5RYcn4gC3uQBIp25vnM2waiByZIEAjIFo4tMxV6x5MNZN6k/2iWM7JJP91LANcFWuZo3kswDYuaOpDyBQjJfU8SbP+SQ8d3Ohi/5zHMwsijw15eBek9liic0LOr7D+Cq1cgm2bk+C0fPUAlJ8Uuyvn8jaec2j/qJMdC2eBc0jsWzh+MLQndrw8xuOwVtSa69izeqhnKsBAbi1VUISYxst7+vj4KDSN7dKElA3DDoiZ5tdHyaDsKQvgW8YXK+08d325DHJ3c7DaJ2Y832EE2VoXCKRTEE2suZ4t62AnZ44czR0eS0h0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1z/NSHbAdkWBE6TnyfeicDPrjm4pqVUHQhuwnYBkVM=;
 b=BrXhr/dvVSW1wcWBHH+xs6QnKGMA14gb29/lLCl6E5JxzqCJSKnaDo/AL8I/Irt5vjSOhvoKwVZVztRYK/fFm5wUaajmqbY2TzJGtoYwjX20x2vdWDU5fz2l3LaTcv/H+tywiGrBFrEDsxzhhwtG+7dTGpdE7CAxXOYnWzrq2f43LY7eoWJLPiTKpj7vfYFHspupUroqNOa0CtubNrJr7i0/LV3LDx8an7tmTJhJTFXQWQhmiQvE4ccFQPd0Jb1cOhzB3ElI2HYW3T7tIDSoSmzMzckU02b0Log8IKJ7xMnkv+0pVn3ygiukyM+WEV/uRQxwECxFYIoHeLbMf7sGPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1z/NSHbAdkWBE6TnyfeicDPrjm4pqVUHQhuwnYBkVM=;
 b=lPYYLn1hPbhW3w50eGg2ItLrPU7fRGHqTjE8Ev7ksMx9L824CQahCf1Hyf6JDCGj+chr9bn2qdsQXjrM6ZPNyw5EcAt6FvdSYHpi33iLNRL+KYh2sXxl0On3KpRPSaKjUn7GlQo8zkCrK3GyRRLS+4lJ0eoigcszp8VWVUhzmHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7090.jpnprd01.prod.outlook.com
 (2603:1096:400:c1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 05:05:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 05:05:51 +0000
Message-ID: <87wmnefrv4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/11] ASoC: simple-audio-card: enable playback/capture_only
 property
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk4qh6h8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 28 May 2024 05:05:51 +0000
X-ClientProxiedBy: TYCP301CA0074.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a71641-a3d7-49a9-740d-08dc7ed3d8b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XoH54Sj28jlf+4JvTWKg1crca9WsrY0gic4NZYvetAwgxqmvhj4yjUkxpIeC?=
 =?us-ascii?Q?8LZyCfX+XU8J/hMWaI3SLfGwp66c7/ayoKJuBGBxQCbUH3zUuL4udmBqjYhm?=
 =?us-ascii?Q?4xa46b9B83xFilIJziLGZsDFa5YcBbVHLYiJekFPQaKuNdQIKVCkXq+nk1bE?=
 =?us-ascii?Q?wkAC0bkqvQ5gxkAh/gvKDkgWnIo7DVUEDpJVW30xC0i+0z6zW8ahU88boAlX?=
 =?us-ascii?Q?NtJSKuz2k8blIobhdeVffDWDj1kEZxkIAWmqsILqxrmUP38oa5KTR1hGAOFu?=
 =?us-ascii?Q?iCkn7du0NBH/SJzSny/yfqZNtH4M1YzLzM772U52g2RVAwoKvPdWexGzi8RY?=
 =?us-ascii?Q?yOA7OGVucUZCGxQWoCdI//lrkAdjiALNAMj/MBusYjQraalulcQAQrT1r8Tw?=
 =?us-ascii?Q?pEpNtuoChokz0SaPwd/4gD2qNcPJI6gMtdevpVOuMWpQKqa/fcubqqQpQW59?=
 =?us-ascii?Q?OLEvAEfbX/wL1SIGo7EX2+gTV97GyrW3yqgx5r5p/qILe7lGtx9NYw1kX45l?=
 =?us-ascii?Q?jz5IuicMEWTCXlWyz+xmpFaol+aE2ItRV/N/M6Tg1cR7gQ88RfM6B533ecEL?=
 =?us-ascii?Q?/CHGVN8UEtxeavp+Y1l/Tb4NJuf2PbKyM6FSA2sv5/vh1d6bLQ/N6/DRTCCS?=
 =?us-ascii?Q?RpnSj+1MdXkbMnVwEZEC4P9GoISBgrdM05+SfDXLQIKLQPd7SY/a90RCXDZl?=
 =?us-ascii?Q?xHMtwRzhTWPPA5ypAZlLHgAa0nMlWIfCt0/2hLyL/eP6TinAzcp7BQR0SM7Z?=
 =?us-ascii?Q?QQF2XurNbUfgkuAN0dXUTX5UUbx5KJpseRi15E+aM51wZ1/vI+Wt6HWlBJH1?=
 =?us-ascii?Q?Ag7MWIttvajepezlgD2Ap2hdJgk97KYa/DYUwi9kDEQVSFYBHnGY7a5KQIsH?=
 =?us-ascii?Q?HS7PKPrGea2y1jEfDiQ42cvM1JktHNhDNdOX9pOmAXmt9hfXwvIAqGznyciq?=
 =?us-ascii?Q?PVX3CNtt7FBmFCzh+mUoa53Us9tpP1huCWspGUYRZz2FGiXS3GZ3RiHSdKC4?=
 =?us-ascii?Q?hI0tP8m3+zTIYyNbIOYhj30R84td8nblcjJjZWb8zdMOBNu7145qYHcvHTla?=
 =?us-ascii?Q?F7/hGJ34IbT//ZfTps1RqQtUY/1ywENdFV+08heDBn6AJtUhHjm2B+Jipihk?=
 =?us-ascii?Q?tVNLOm/4sBic1Tg4OBNVINv9C1w4YQ4UL4JDcBRLjMK4kTgF2Bc0tVm7kEx4?=
 =?us-ascii?Q?L3vdEVki0CuVXGXD+CUF/zTgszOmXjvrnymWhbxOyOiUDH63ezmo1MrfGFpt?=
 =?us-ascii?Q?wkb4ImkNnJYkc0nJ+5r2lZBul5dUDM1cGq/o9qVz5azalwLJcqC22hdzYDxa?=
 =?us-ascii?Q?usutTiltAfoX+2rvq6z5XIh2C6CJptZIayZp2NLxnCRXww=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ED9zWegML3cZHlDF1LNHR2AgmWkPYp0qTz9SJ4DKjdwR1ZQY7Q+4JapN41qc?=
 =?us-ascii?Q?yhHnqdyQ3hhy3JFnTvGSuCcfyznWs+/SUgfq+/Lgn10oVMX4dQimJMqUMO+g?=
 =?us-ascii?Q?JjxiiW+lbkjSqRY2/TEv5Mh00/H69JMbZ21BpBFpApK4ZUGVqzaWh7fxoYfT?=
 =?us-ascii?Q?rnGjsNabKRO3e9+UkCXERdm/I5Nwx1xyP8NygDDoXnp5VfzXCYPTlIMOPreV?=
 =?us-ascii?Q?OXEQkFpPiZxCqNDlNwLH/p6uL7INJa/HprNfWv09w8cAREL5moA12msHtJmG?=
 =?us-ascii?Q?lsVYVQxVQFtoQaYYutR3b32XWOMvZUTVyCJTKbvL0rGKfUbsAcdh+1wQiSXN?=
 =?us-ascii?Q?ny/Ac3l9c1nqgNKGZJ/frXBETL/NpPwLG+67MHoCbhHX+0OmzJqRkD8yXrpo?=
 =?us-ascii?Q?gJRV2vD3bF7tscjLlFH+jC8rUP+4tPkZLhdSyhLgtUeDcStTI7FnSdNZLfUJ?=
 =?us-ascii?Q?lJTS1ndZTafsKvwVT/EZdH6zM6XeDfgSx6N0QROtShZAMTLsCujNVophyGxw?=
 =?us-ascii?Q?ALFmwpEgGxnhQezDxy4sbuWLmFPUy5rfDcPrnVPSLcm26fO33082K9kFoqa1?=
 =?us-ascii?Q?vBRmV95nEKEqgcbP3kqzJqezx0tRBRV9BaP4EhVHhk2L2gD3n7GJRp6z72ZU?=
 =?us-ascii?Q?6aRC6AvbwdPE4fEc46+Wd8cv5QyLBImN4lu0HVlmU0TUSOGK38DMuoSryy4g?=
 =?us-ascii?Q?RuB7q6d9aMUTEezoHd4r4TU9t2h0leovPILoNFQ5VC7x97g+1W2/650AUl3x?=
 =?us-ascii?Q?tTHdIlj7t+sFkNX1ywTPrhLidUocEADrMPtH7zV149gdRx2g27sLF2vGPzB4?=
 =?us-ascii?Q?htp1wMEMt9b3mhSZr7VuZ+p+8uZ6nZ5ebSWwSw8JRTNzUM9GjCRd7MGzdlXY?=
 =?us-ascii?Q?bDXao6OL38dmvVkLC94HJpFoHqn+YvbYy2DxR/kP6OZfNJTOX0l4WSds6SQn?=
 =?us-ascii?Q?K5+Z42NeHxWEt3rRzTGlf1HfTzzOFiH4tU/LMJLplvlJ2UZeZnTODnUWnmiw?=
 =?us-ascii?Q?sR2Kh+8bVtfox21eN7vkObKGFnwqP4FookIsCfa//d1sOpxtaXr20Z8Kbr6S?=
 =?us-ascii?Q?xUcZfvBWSztazBDzObvAGzgeF9LCguElvKc8gYq/sdHNe20S06LDZSONJjfb?=
 =?us-ascii?Q?hVzls7jNMyhNdGpcNtMLC5/LMCpcYtFTR+NvQWoOpbJCqe4iv+Xe26prT7V2?=
 =?us-ascii?Q?wa4q/bir5R8YYbGBVcVNzMjrspROKVbtOkNd0S6852qWj+9OIp4Sw4Lc3bWg?=
 =?us-ascii?Q?NI/BL3q7fo6IKGidoz59sxEb2eNeiR+FP6Yuh5HokeyNr1ABfmBAsQCUzTPs?=
 =?us-ascii?Q?QzQjWnPA+9e1Wdal8T0F9ZGkggbqZsyeWfPaPZwgq4TuhCueLweI8Tg7CIf1?=
 =?us-ascii?Q?IYGumAzg0to/cb+rw+shg/7jCm3Cdj4fjeTfgZIOquwGWguOn9HdD88c6ug1?=
 =?us-ascii?Q?f/qIHf193WRKyeW7XuaFfqARpWk5lt0N44rf6W7jGuPoCRIBn1HwJ3e4sdh9?=
 =?us-ascii?Q?61z21sYU4xWflZ6omO7zAJgq08bjqysllNcef3T1yaxubrvsA+jaV27pEwjl?=
 =?us-ascii?Q?h6+6x4+b4iTTHfCHFcWoonwzF/XksR+YiYAKArPA9ibpEPQr7q/LV76SsFfx?=
 =?us-ascii?Q?unfnpyENzTNlFXHgiFLTLxo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d1a71641-a3d7-49a9-740d-08dc7ed3d8b3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 05:05:51.9293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6CAuEhekDY6ZTvJmiHmQxRCLJx+DMcVt9bwIv8IIY5mEXf1TWrHwp4YmlaeuIzYYPyT1VDP8QNrIB1KgUYzESGfVeAD5gbSHPOdrW0puBFfMYgUxoAdlBkQqo8mhTCpf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7090
Message-ID-Hash: PS2TSFGFEYTKW4HIZXIQ7YOXZHCUX7GX
X-Message-ID-Hash: PS2TSFGFEYTKW4HIZXIQ7YOXZHCUX7GX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PS2TSFGFEYTKW4HIZXIQ7YOXZHCUX7GX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Audio Graph Card2 is supporting playback/capture_only property,
let's follow Simple Audio Card, too.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 9c79ff6a568f0..e436e8fcfa0f2 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -187,24 +187,39 @@ static int simple_parse_node(struct simple_util_priv *priv,
 }
 
 static int simple_link_init(struct simple_util_priv *priv,
-			    struct device_node *node,
+			    struct device_node *cpu,
 			    struct device_node *codec,
 			    struct link_info *li,
 			    char *prefix, char *name)
 {
 	struct device *dev = simple_priv_to_dev(priv);
+	struct device_node *top = dev->of_node;
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
+	struct device_node *node = of_get_parent(cpu);
+	bool playback_only = 0, capture_only = 0;
 	int ret;
 
 	ret = simple_util_parse_daifmt(dev, node, codec,
 				       prefix, &dai_link->dai_fmt);
 	if (ret < 0)
-		return 0;
+		goto init_end;
+
+	graph_util_parse_link_direction(top,	&playback_only, &capture_only);
+	graph_util_parse_link_direction(node,	&playback_only, &capture_only);
+	graph_util_parse_link_direction(cpu,	&playback_only, &capture_only);
+	graph_util_parse_link_direction(codec,	&playback_only, &capture_only);
+
+	dai_link->playback_only		= playback_only;
+	dai_link->capture_only		= capture_only;
 
 	dai_link->init			= simple_util_dai_init;
 	dai_link->ops			= &simple_ops;
 
-	return simple_util_set_dailink_name(dev, dai_link, name);
+	ret = simple_util_set_dailink_name(dev, dai_link, name);
+init_end:
+	of_node_put(node);
+
+	return ret;
 }
 
 static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
@@ -278,7 +293,7 @@ static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
 
 	snd_soc_dai_link_set_capabilities(dai_link);
 
-	ret = simple_link_init(priv, node, codec, li, prefix, dai_name);
+	ret = simple_link_init(priv, np, codec, li, prefix, dai_name);
 
 out_put_node:
 	li->link++;
@@ -336,7 +351,7 @@ static int simple_dai_link_of(struct simple_util_priv *priv,
 	simple_util_canonicalize_cpu(cpus, single_cpu);
 	simple_util_canonicalize_platform(platforms, cpus);
 
-	ret = simple_link_init(priv, node, codec, li, prefix, dai_name);
+	ret = simple_link_init(priv, cpu, codec, li, prefix, dai_name);
 
 dai_link_of_err:
 	of_node_put(plat);
-- 
2.43.0

