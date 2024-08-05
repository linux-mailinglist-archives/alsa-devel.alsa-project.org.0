Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C3A9472B2
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:57:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A3845230;
	Mon,  5 Aug 2024 02:54:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A3845230
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819277;
	bh=8jmCrPdpLocqNKg4z33xnHD6Qw5aZbINp6YoNea6wZo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DtM3BuYqDYz+BJmC8Y55oTKorPqF+OWpWATqW0CfZ6CRnq8YJFSxu45oolzVFqJCF
	 95NM/8kbwklEdT9fdqmZDrlAYLJ4jkQkmrHk/PnzWzXAALfvgsWmn3bqBOsrATcpy/
	 Y9ei4JBgTcUACaeNMZdI2L9D3Q1wwF7hPwG5y9iA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A9A4F89AFD; Mon,  5 Aug 2024 02:40:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71B21F89B16;
	Mon,  5 Aug 2024 02:40:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 301DCF8069A; Mon,  5 Aug 2024 02:40:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 492EEF899A9
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 492EEF899A9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QWieQEnu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PFyrT7LMrQ0cIEyEAH7vW36DjuGxspIou6uPBoZENr6Tto2xzKMBG80+XzRSVNrjLAujqU7LbFSHNApTGr006D749WcwX7ysg1Gc5arUopAVxBWWXyP5foeGY5xZj0SGntzGwO7ZNAlzfKA1cQtHHMUlx06fv+55WV0PIULZDAw2xQnIoNrVPAZsMLoWdF82Fuosrs9hUCHo3WvlfbywljF8F2+BSXyXTOYNM8FNDsouo1+qLRqJHnO8isD8kWhgDHK4tL8IuyG9aidWJssHxrFu8TYhh/f3B1JW6wjjlKx+Tf1pIAsvm5YWTRy1t2LVo9oMBS997NkAuycMrUrSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYtrNYv/kg2CePMswQDA/S5NZEOx2q29Oodw5gpHO50=;
 b=GFMixgXIXi1dE8fje/DWRDcDvVKiGtUJXD/n9PfKvhUNijZ42d8Zo8/2T8i5PBvFPHAVR99Yhe84x5pkIBb+W6R+UUVErYLICinRtwDvsh5JmRJnoXZULKNn+uomGD5VYM4qtx1jUqngEJm+xQwyIee8Hasr0kJ7PdRqzD4vCWd585QNkNiqGRTuLbVbWaacLTaan3nLl8vQC7xlvN2TzqLQ3Zc98t/0L5GMZ/KtjasIRg1vpv3sXCYAbv4/GrUx3e3wRZIHM5SUGIWVS7v6JaBB0LEyRlz0PMsUfQUdHkHPxgC8yxdoIaeNX40fpk7G8uswBBfWjpa5mqD3rOXumg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYtrNYv/kg2CePMswQDA/S5NZEOx2q29Oodw5gpHO50=;
 b=QWieQEnuQBQx2OyK6h+SWAKwc3u1Om56P4esVkuk4ZFOG+psAK6z5GWlxbT+hitsj+ueUgWBxYGk9Ee0LmCL7ECaSGCQzX1hewRFx3CekwIzhyilRGfkvfy7ztrhqJMirujIG2e+JTZkCTEBr50lNHVeUvnRNSKJOejij61Hn7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9459.jpnprd01.prod.outlook.com
 (2603:1096:604:1d0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:39:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:39:50 +0000
Message-ID: <87ttfzyf8p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 057/113] ASoC: sprd: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:39:50 +0000
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: de5bf3fa-2cb8-43f8-edcc-08dcb4e71daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Yx0dx/KRkC2Mp/lvAVjDipTWPapsqIlnksheP3SZIDPIGqdHfzo0y+QmKrci?=
 =?us-ascii?Q?kJd+37sc3LKM5hRwlH5iF5FT0vkeLYa9arMaRz9CaLN4BH+0SFWRoIk4bnfY?=
 =?us-ascii?Q?FQk7YK1or3E3J7rGNmRZdEYnnhv8vWCHqFXGQQehgcJ78kNu0Oo2OXtovwXF?=
 =?us-ascii?Q?ITSmgZKZa4H4XwgWrIlpy+mFb+p1k2ji8kl+/VFP7RyswqB7UXwHHQ2xYrcJ?=
 =?us-ascii?Q?AaJgz7wa7Mz7bc7CVHqtBPe3TGilrgcOaXnwdZTBknlkZNQMK9WhbCzDBgT7?=
 =?us-ascii?Q?4A8876U53JZeUjmLP0RaOS6aNZ0RMLL9N8v2DO0p4Jv5GynIghbSmNzUawAK?=
 =?us-ascii?Q?jX3QhS5mMuFdxFNpuKaieAeM0Hz5TOU8yb8Fb6s/iBPJm6ws5Xpf/kILnFci?=
 =?us-ascii?Q?dK/qbNwYS+xA4FlrO1tK6amtboBSAqtTp/6A8zSc8c3sfVTcjD+HquP+dgAQ?=
 =?us-ascii?Q?oIQdzUsC8GQnApMiRRM7oZVb+3xEx+r4iTX7h0ia7t3Ng4zvgQFxwWmuxnq9?=
 =?us-ascii?Q?478hdT1/X98TOiWbkxjvUCcuGo1voqN74i0CskUDa7uT4pHvARUMm3fYTSaL?=
 =?us-ascii?Q?PUu7ZWrvll/lR68zXKb4Mcj1FbP/o/WsHMHPxm0IAyHj20kNZvf5NnJUBSgS?=
 =?us-ascii?Q?sHzLJfxSzChFH4s9nQ4B6PdsNE6MyW60/ruWLz2ccbrkRegENTbXDwB1WwqV?=
 =?us-ascii?Q?ppwMqDgtGiFfnzS87stiW618+mzHqSZ6od7UsvqKL1VgURGAJl3egCiRRFPl?=
 =?us-ascii?Q?XlZroKiQQp/rgmNYlHSHfctgt+mtLYgQhOZQNlK0DuPCS9TxXKmGdUTmkIYa?=
 =?us-ascii?Q?eN1xdbr0Jfb8wN4dUHVmlgrjjWVIZPViKaIIq/kNk02BPaYARNY/5sHXq+1g?=
 =?us-ascii?Q?NzMN/u9sQZGmTi58NttCEkafHAmr+oHXx+Ng2o5nocS0skrYUKGjEawHfCDH?=
 =?us-ascii?Q?Ftgbw1rLoa2ctRPaZnjzwJ+gi95Do4U2C09Ctl/JL6aW0HwaIrTMxI4jOMg6?=
 =?us-ascii?Q?1DmU7lTYLcJFSMARdHHhHIut+vs5zJZ8KxY5HUzehT9N2+qUyUc2P1xb2spD?=
 =?us-ascii?Q?ZNc0IUvM3n4MyVZ9FlWAJDPvvxY+nrHq8e6dMLFDLUNUt8JB4vnfkL/CIkqT?=
 =?us-ascii?Q?C1OgoUVt4iEEiwG+t6kJ389CBqDjlu/iXFJX+A9WEkChOMHeltaTEYs16u5U?=
 =?us-ascii?Q?BdNp2YAxHj4xnVJE4/lbvrBpJ8F7oqPPeu3Yp+Uf2u8qIPy5p8IS+cqMP6nY?=
 =?us-ascii?Q?ItdW/498qkn06HpisfICk7st5Fs9wMK3nuBC0x/a3S7wIrOkFJJLWtw0hw06?=
 =?us-ascii?Q?2A//NKehJ8dZvbEbgeWBml4Qr/PjICxp3JJbFvZjGeYxQUN8TsCCX4Tl/iYp?=
 =?us-ascii?Q?2duxDmEU8yR59H8HXqmmyPiCMRYvhRZhUIkgHhG2UxEvWhl51w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ynpFVxjr9an9jdHJil6Ymzd/Zy+TwCRTWGBknoQVQdNso0olWWypZ5O/72zP?=
 =?us-ascii?Q?nhesJlTGdp1hhAtS0305MEgqsV3kYS3UbsAyrJBIEP5gQqU87pl3ibXHqDdd?=
 =?us-ascii?Q?Dg2ND+aPW0sYueMSeHb5+nNbJnI5A5Fl8OK3OCHk5ZevIbsRookb38fB7Un6?=
 =?us-ascii?Q?YKPi3ssY1XX4CrBt5Ow1M3wXIE3qfBjFkBiPfdyvbPhi8bYEfovGoFx1RQeG?=
 =?us-ascii?Q?LdsxOJQxW+1YFNthQESrRhfXY0NzrMhvDvx50I5itl/8vSQweQwYZX/b7XQw?=
 =?us-ascii?Q?MKTcAQ/J3QIQfiQ/itdn3DeTHmdEk6k8N1M9jkSd/JPSp/U0SeY+PgTMmq5t?=
 =?us-ascii?Q?cggBADs+PPKTu8rTRwnfNcTG/BRBv/KG9eR/AyJ3bxlGfrUqObp4Kw2/X7GV?=
 =?us-ascii?Q?GotoOAd8JCMbzsBlm7O2NOITv2Y366k/GE7EqlSMM4ONg5rlaOTGVC6DuLT1?=
 =?us-ascii?Q?MhPwqgNFrR+SB8HPG9nczNmH1u7fgMmXua6gxAFkzQ3ptV4aQHaUpVZHboQY?=
 =?us-ascii?Q?EjQHORRJP4a6Bk8w0n8g7nxoz/dYAZO2u3OTfuWkgNiKjLn819ObGPkE5Jh0?=
 =?us-ascii?Q?OhH+qoju4c3LAEkRshJt8xqoveboB4F/y3mQkM/XuCclEC4YyouIslo0A/SN?=
 =?us-ascii?Q?WPGP9wPaQu0kMk4MzyfY7Sh4StjQXR5p58T6SCnAoOg9EApI9IY600KcSR+S?=
 =?us-ascii?Q?4x4QlhtNRLhS0aMso1zxePKviVPV0z9FbjW4SjcViZAmpb1GsFKzlMJVQFnN?=
 =?us-ascii?Q?vENEDJsDeDEYPMla71X3rtSd4ePr7LfDNj92wj1EYc1ZUYJQWqBt/DyYrcLw?=
 =?us-ascii?Q?nZkGT9X4ax1ZeCOyQWTR/7EqyBR/t2iJwDdm01Qc4/Fd0Eh0WR0B/TSHIP+1?=
 =?us-ascii?Q?bhYoZG0KRuNos/MzIFYqHnc3iUpAXToRio1VwzgKaYjJS6bKMyrT2TwSHgKJ?=
 =?us-ascii?Q?5Ac384/+z/O3ljXauZERj4QPwpRyl5GyKOgJcVwDQgnyOoGybYsRC/2dJXRn?=
 =?us-ascii?Q?fBBpa5Cp9k1OYqlUvVvfd6j5Dr+kzm8dh/XIRxCltGfECQkXaY2NNCRx8JCS?=
 =?us-ascii?Q?j6ZmFp4x1U7nxgwAD9DdyaYncvMy8R1xq9JtmQbRq43hG04OpOYbbNC9z4hm?=
 =?us-ascii?Q?5zWJCbrRJbMBb2FhYMHpRnaRos1v8PnERGE8+Wu5E02Ri2wCNsMWLc5Z4EqN?=
 =?us-ascii?Q?1tVyyQLRRkNOVWQRHmLvU+Qg4Hq30Fe7EJfjV9b1OHH34R/Np1e5C3K5zrpg?=
 =?us-ascii?Q?t9IymWiigsqpVNqXhW/4GS4uJgyepSip+TwLWFdzxg1HnalydJUa84Lml6xg?=
 =?us-ascii?Q?0KfYVTavk9ZsdrOsyZ6ss3t/nppA/6yCylFm9KMCfa/yPTzvVMIDUTzr5dVv?=
 =?us-ascii?Q?GmPC57culpN/IO5cmse80NegUQb2iibPY4CvqArhR9AYvcXSbrgCnjwql7+P?=
 =?us-ascii?Q?ej429Fr7pS/inmI6gHgWMP9ViivRLbaSQviT+PU7xH+c+Jy3MK+c9F1NWDim?=
 =?us-ascii?Q?/USZ42mmll8tGjriUYdXbdRfnrcQ2NIWgAEvbvgT2bWqSBDH8H84gIJ89ISN?=
 =?us-ascii?Q?f/MuRKMLxle0vMULCVm7diGhNV7YNFSIlVBHVuLjJyLXTarfCOYAiKAMN42D?=
 =?us-ascii?Q?mAXUw4CsMNFcnpg7wNXhPHg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 de5bf3fa-2cb8-43f8-edcc-08dcb4e71daa
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:39:50.8842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Dwm793ETU2OErgLQ3pIdq2niQ1NYh3LFw7O3bYAsCOx7OFbJFptfKS8Q211nONii6EwA/fn9/ZRSRpNLWZcIAnAaM3Xbn5pGsNQJ6peHF3lgvOTpL3z7hN2V9dVJz7Kh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9459
Message-ID-Hash: UNBG4XWI37FQ5TP3TMKV5TB3273IGXCG
X-Message-ID-Hash: UNBG4XWI37FQ5TP3TMKV5TB3273IGXCG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UNBG4XWI37FQ5TP3TMKV5TB3273IGXCG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sprd/sprd-pcm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index d6b96cc2f7087..b7149322b9858 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -195,7 +195,7 @@ static int sprd_pcm_hw_params(struct snd_soc_component *component,
 	size_t totsize = params_buffer_bytes(params);
 	size_t period = params_period_bytes(params);
 	int channels = params_channels(params);
-	int is_playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	int is_playback = snd_pcm_is_playback(substream);
 	struct scatterlist *sg;
 	unsigned long flags;
 	int ret, i, j, sg_num;
-- 
2.43.0

