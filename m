Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B4C9472B4
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:57:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A04B527B;
	Mon,  5 Aug 2024 02:54:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A04B527B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819304;
	bh=jD3jdd01lywzk5OaFp9sJbRzB9qifED9jzWkT5YfVm0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ARv7+AerZc9Sv+WGOBYgwvmd+Za7zCf2XBS8CrZVCSsb0tAWTUo++shwBCejNUrfI
	 PlwOSIQEUCc4qNnI2NUIXELK/BBuOu00PLQMHiPmn9gnWd+xnerOQhnehJkMgQnnYN
	 pL/C+WkUtP8ftDyTvXRMnnOGRIZqxfx6ySk4sfyA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C3ECF89B27; Mon,  5 Aug 2024 02:40:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0D00F89B33;
	Mon,  5 Aug 2024 02:40:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7DABF89A29; Mon,  5 Aug 2024 02:40:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9491F80624
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9491F80624
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dW4Zl1Qo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3fo1wR/KuoRYzT9RY5qHaLdvUzftet+YDqOg+dsfUyQH7TCGAGg/2KfOCZ9pf8YT9ZKq9Wul5d8rj8kTGRjCUpl3+2EFAofNHHF7TfUlh19N80DMTyp7gge1ZngZbCywjaN/we748UT+mUKiLekr2MEmS8Vd8ORhXWYCFg1R8U8UuZZHEGQIMVm8l7EDjvyScx8zWpR4cVfUx00me4x/DfduIXE1iP/1X84InMwM2wLEMF3aV7nUx4Y+Q3Xd1v4LfgvkL+NOsRC0f6QryJtYskAMFkgcBEzo2cOqcH89y2/mb88O3jdB6x86/JZxcl+KapzXOu5C9bwXyeRxAtYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUgbNhARjoegvwgtNCo7MUNh7GYdwpYywqkR/DU77BM=;
 b=gqI0ISi9uWivrUTexA08PMqzes0SXt7TiWYfl8MulF2kh8LAyrH5GY1ExS7WXZvER54OaUnI/0E0tPIyTYiAVNFCjZ/6aeLMOlCmHMsUIawJbjiw4hDabq/Uu10BUZy5phg3WpbPW1gX8I6lyn52xLyH2yGiGl26ISLNTxm+8dasKRKGf0LXvG+ABLepyTvOeO5un+2gWX9h6exm0pPLOaE6QyCgPpTB1fkXYtcdQ4ch4SDrZQsT6o/PL5z7ClDZNTOAlSlX4gStfiHVqtc9p3emCqa/mvO0zzlFrT9Ottdg0tj4fxQwUPdqv9s7cMlaY5pKWj/cOyIOHA2r2vGvXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUgbNhARjoegvwgtNCo7MUNh7GYdwpYywqkR/DU77BM=;
 b=dW4Zl1QoyIG5erFgAb/gpnP6UrmYZwu8/D2KTR/uVPHdwV6+Wf4bTD4U/tcbULFi7hw82zZn9tu91OhVj1QEjO+SN8LkQv/FNbWKw2LU2RFcTRm/ajtOTF/9G1xe5PS3UL7NE+iY6P7yBTOFu3/AB/YP9RkbVJW03q3yajiXeA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9459.jpnprd01.prod.outlook.com
 (2603:1096:604:1d0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:39:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:39:59 +0000
Message-ID: <87r0b3yf8g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 059/113] ASoC: apple: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:39:59 +0000
X-ClientProxiedBy: TYCP301CA0041.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f30503-438f-4aed-c940-08dcb4e722fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/J7+lKX4pgabmcUOM6+l8bLNlVXjN7l12HFsTuGXaom+dckacSrE249ypdgh?=
 =?us-ascii?Q?P+yvwRgE0YpIa2mjmgJjL6ho7QFW43chhe8n5stRBmQ25v5y9PdR8g5Z5TKm?=
 =?us-ascii?Q?HpwHkt7FZn4y0AqXLm53skklGhEw5DYFRmugqxLNTPHE2pXNsXgiFGq0tyav?=
 =?us-ascii?Q?24aGLBUgqCWwDIi5j63W02FuovR1/hfSOch+eFZZMeAaw1BPKbr0Ay45YbDz?=
 =?us-ascii?Q?pvfybV4zFMTkbA4AhTWZq24O2RwBgM0MB04tpCmbLHAMzb/OL2yZu/m/4smE?=
 =?us-ascii?Q?tmHJaLhoIOEdxAhLxjHCtsUUc664Ws/weqkohmKW5T2eXwJWv0nTHOQSBn43?=
 =?us-ascii?Q?A/rehhIQnc0XegYRPWDoAaqGbHnnwE+uHNSAkQhmhfHckyS3vI/zz4Jt6j8P?=
 =?us-ascii?Q?p22Z+Od+fzJ7eXI2OIQbARlyReXsL9Tu9E1Hch4vzvyESu8VrVTIJJJ0E9EP?=
 =?us-ascii?Q?L2NnWggO5RLV6UTscwGIjS72fDGFbPbvro4t55S07oroHb9uppDMNc0qqyuH?=
 =?us-ascii?Q?axDAG5toi6RUmIZvzhFoNU47TC0jMYPl+zpQJjgUSFK3pvdp33VXUvLvz2yX?=
 =?us-ascii?Q?WK5YuMYKEaGFmzocQm3psGD1yvN/dL8v6bIWorjD7xiZIOhrxcCH1iO5Lc5R?=
 =?us-ascii?Q?6qgnGvmlr/we62CHj25BOmlFCWS+K5Lno4GBbq8jx4SCYNziqbp3p+pTJ3yc?=
 =?us-ascii?Q?uLQUqaXllSI1mpi9v4TaczsC6Hwhe8JuiutNj5tZhY17Q8CGPskygAwm6pxV?=
 =?us-ascii?Q?0krR04wWa+3Z9lP7kr8J+VJlc8pp8ld7PpvK81zzD9Ji23ylQeSRYGWtPbCd?=
 =?us-ascii?Q?RSZAzdur7qm1bn4ToukuwwIYYIs/ZNGjBc6ne0L9Tl3Bs9wZaLcnoBiiduVf?=
 =?us-ascii?Q?6YhyPEcm05GuReIxukIIom7Dj5dMS6WTW+sTs/ObTk8DpqI2bHGJGOP3FreY?=
 =?us-ascii?Q?vGcgFMSVxsH7XtXRsxKlW/9rp7nGcyRG/yPeMEmbSbDLzeD3jMlEM46XBKBJ?=
 =?us-ascii?Q?heGL0rHS+MWPdiYy4tGw3Dny83fLJgfnXmb6TfgmP6Gmqlb5F2GXRUFmr7D7?=
 =?us-ascii?Q?sw1eZPuRtDfk5Uv1fOSVLPoofU8YE6/WDTfzw2YLpVPEy9aN/fSWgnwdrbHO?=
 =?us-ascii?Q?zWHMLDXKXRXOmytUPig7CCATbgcoFvgvVt7ztpTOvUFnCEiZ9g67gUmRx7N2?=
 =?us-ascii?Q?FIDDq6pfJUOqOG4AXoHnY4k+bV0tGXlMYs3hOgOTWa2hAs+uq4SuP5fkUxUq?=
 =?us-ascii?Q?srwcKmVL2Wydeoc8/6Do7ydTqMlRmSG05l7rzEp1hhre+hv5OoqrujMHYOqr?=
 =?us-ascii?Q?pYDK7KS8DA3AxwN8qgXN5VKMP9dEjzwkRcdpucqDSC7i1MEiL2/waLssz3x5?=
 =?us-ascii?Q?xKqiEZUpzdKMPbo2B1rHZABi801pmgJBzvSp5cq8KdGx4sToEQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l3MRwYl1iEiY25/94oSeprvHabpP6aDNwTTB/t9FjdI9jMhn1HwnNjYo7NHI?=
 =?us-ascii?Q?Qn/Sm8wa1c5ZbLVpMxXwV56cavxKKZOKRpAcHffeAlc2VDX+afwXkmY6vuay?=
 =?us-ascii?Q?RqxjQIvxVP436tGVpqIKBgwMZ4+gKFO681hv9iJOvOO8wLVxHS2atkidOBk0?=
 =?us-ascii?Q?SjprlB1zuGFsFJ0Af+y+xfSluH1Lg8HnxUHDp2HWu7pr50Plr7eUgq8kCmPk?=
 =?us-ascii?Q?hVrUzd8lkXGp312bjGH4bCMa1mPXoCY7EbIHV325U3i5PiD3CZ13i2SUamMf?=
 =?us-ascii?Q?c9Hg8PoJixmJek3ugcQv20adrWoiUAC+4PFr5+WhsUv1qtC2gWXRxsPLSgA/?=
 =?us-ascii?Q?VTCZnv44eJ09/YvzDAYqYu/Q6aWUWQpyl6fJZxJ5Tfa2VerevKK2o/gbLhal?=
 =?us-ascii?Q?+hnP4B4i2DsvLQ6LsTOyYA9K0HzMu5ZDO22b9cMpt7DfH2J9tRDMV9Hv/Kbb?=
 =?us-ascii?Q?1q0hWQH+kMdyrl1WS8wfSZe9m+7espw1nxA0LrDO2fUoNaNUJfya9UcQy+bH?=
 =?us-ascii?Q?hxX37bH9XgwYHA+Hfl1KcksD+fck0tCZhF/uvh/HZSyla2Li/bmoJ/ugUPKs?=
 =?us-ascii?Q?QzgkiE4CS38DXpA7ZzV2ugp8I2Uqyzis+5ZyNS7cjLUN6ZMstVhFD32232ej?=
 =?us-ascii?Q?dFOmp7/IASLHgMr39i+byYKb7MTOI+yjrvS2f25YGyLiaU7Bp5TeYJLNAs7A?=
 =?us-ascii?Q?cNQUOT2qnthpZVukapHn9FWn0MJdLB7aoE+ENUo6vftqbliwfrvAhaInP2kw?=
 =?us-ascii?Q?n7rnUlINrFy3uGmnFrCfAgHU5haF1mhxyEbP8RPsio+y3cOPuf4Klddp86Pm?=
 =?us-ascii?Q?tjTvsnJaDTCG+nzvZjEEsSuyOeFPx56Klo2vtcg5N2c8gKPufknwXihIQDc7?=
 =?us-ascii?Q?bGpXQJhNvLFfbrhSB245paXqjG8FO/P4ANVWis6wgkD2AVVK780AKVkCQoUC?=
 =?us-ascii?Q?gt1u1Nr50IzY/Iw+NDIFs6qzd2JMq+dxdLjrd2WiNOq/0hPMAyrtr9oUGt0A?=
 =?us-ascii?Q?vkgfNlo1Q58/XX2nDKmlLqfrLYDXq5hy0eOFPyg7Ei+g6leFlb9R5hFqMqzu?=
 =?us-ascii?Q?x6IfbeDMInkx49XYd4GkJXeQIcBGylNAo6lPI+rBRpzJfr4Cf5jTVAW3DeMK?=
 =?us-ascii?Q?mReM9gFecPnHx//bqGsxbH18a9bv5UTBUiIa/mGtPvbSim7+A/BzVxyukWto?=
 =?us-ascii?Q?dAmNfgKtsFKJxLwqzk2VBtkMe+Odl/vE3zuiQz6XBEtOiP6v4uagwPbPvYis?=
 =?us-ascii?Q?EhZ6o8WmuiLT8SEqc9HEcBZtb44Lt5+edWWwdT2dtRK6mX9x0R8I2MDc6V1F?=
 =?us-ascii?Q?dGNfP/tNu9VCBukNGlzHFl4u/MFsWftVw25/S0MNJx5DHtqJaQMNC72doMmO?=
 =?us-ascii?Q?Ej62XxVHmHveT4v0udKe8oRrIEroVHNAYwLkT1/bdmNs87F+TQyYXEnhfYBJ?=
 =?us-ascii?Q?jPxlF0KxnFQzRUy7iVo2zIjbm4TyQ27i7rSPEu9YIoV+v0pwW+/GdLaUs+w2?=
 =?us-ascii?Q?xed0NEqvh7SUi/KD2KcJx3ZDGoSgZBy8NrcDrqhJgCJEocPQCB+yvLXKZu/t?=
 =?us-ascii?Q?HiVRvxMHUVfjHOCCdevJr6kXTPVrMsPN+NKnkWAwbTcZgLLVFIbGgdf3+0J0?=
 =?us-ascii?Q?GQ11yYxdAjbCKefJvRHU4I4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 10f30503-438f-4aed-c940-08dcb4e722fe
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:39:59.8696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mnI5APbOwwhKn52a2rEKRbtA9HEi5S/j62XxkmP34LB6VQPtGyaiqH3igG6JE9RYW63+dMUKFgT+efuxluXl1dr8g7rfWnU0aOUK0vTv/f4i+VSQQ1EaqFUcmLhsqe05
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9459
Message-ID-Hash: HGMYBZUY2RYQI5MELFGRFTMLW6AGZT5B
X-Message-ID-Hash: HGMYBZUY2RYQI5MELFGRFTMLW6AGZT5B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HGMYBZUY2RYQI5MELFGRFTMLW6AGZT5B/>
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
 sound/soc/apple/mca.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 3780aca710769..60a5ecbd5f756 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -193,7 +193,7 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 				 struct snd_soc_dai *dai)
 {
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
-	bool is_tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool is_tx = snd_pcm_is_playback(substream);
 	int serdes_unit = is_tx ? CLUSTER_TX_OFF : CLUSTER_RX_OFF;
 	int serdes_conf =
 		serdes_unit + (is_tx ? REG_TX_SERDES_CONF : REG_RX_SERDES_CONF);
@@ -230,7 +230,7 @@ static int mca_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 			  struct snd_soc_dai *dai)
 {
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
-	bool is_tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool is_tx = snd_pcm_is_playback(substream);
 	int serdes_unit = is_tx ? CLUSTER_TX_OFF : CLUSTER_RX_OFF;
 
 	switch (cmd) {
@@ -570,7 +570,7 @@ static int mca_fe_hw_params(struct snd_pcm_substream *substream,
 	struct mca_data *mca = cl->host;
 	struct device *dev = mca->dev;
 	unsigned int samp_rate = params_rate(params);
-	bool is_tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool is_tx = snd_pcm_is_playback(substream);
 	bool refine_tdm = false;
 	unsigned long bclk_ratio;
 	unsigned int tdm_slots, tdm_slot_width, tdm_mask;
@@ -844,7 +844,7 @@ static int mca_hw_params(struct snd_soc_component *component,
 	if (ret < 0)
 		return ret;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		slave_config.dst_port_window_size =
 			min_t(u32, params_channels(params), 4);
 	else
@@ -895,7 +895,7 @@ static snd_pcm_uframes_t mca_pointer(struct snd_soc_component *component,
 
 static struct dma_chan *mca_request_dma_channel(struct mca_cluster *cl, unsigned int stream)
 {
-	bool is_tx = (stream == SNDRV_PCM_STREAM_PLAYBACK);
+	bool is_tx = snd_pcm_is_playback(stream);
 #ifndef USE_RXB_FOR_CAPTURE
 	char *name = devm_kasprintf(cl->host->dev, GFP_KERNEL,
 				    is_tx ? "tx%da" : "rx%da", cl->no);
-- 
2.43.0

