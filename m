Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 181D79AD94C
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2024 03:30:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5F18E0F;
	Thu, 24 Oct 2024 03:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5F18E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729733448;
	bh=ZEel4dCfYkKOtOGjtjgJDsj6QXsQA2/uS5QOI/y+vbE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=QobxbnhwQetJywk7GHKyUxWZlI8WnGr9EPEUvFd4MtXpE8TqhYhycRHPj12ju4J+m
	 1+iMZxaLr98kj4dz5AoKSlgz2XHb1XJvJ6ssxaLGHMWjpDLMgx24q3TYixPFSfgh89
	 fqPv6WXWVvZtErlGG5MNhkbprLOWRWA/T7FTJtFA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0AAAF80608; Thu, 24 Oct 2024 03:29:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CFF2F8060D;
	Thu, 24 Oct 2024 03:29:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B427AF805BA; Thu, 24 Oct 2024 03:29:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E03A7F805AA
	for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2024 03:29:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E03A7F805AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UiHJxibo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYbBA8en3vfKtGu30WZM7u79DOWz09H0LLHKQvvfLGNtBjIcFsIv1YbGnvmJHdmwhAFhGLyAVRvIfROquKoQombvxFuW/NJTVSzk1b1CBTpkRvCL/u4PmqjBYdwBygg4LFSDrRw2JK3h2Qvxh0nbM/KQG7KVYbqFtsDP0Km/s6dc9YqqHP3cAwOLgUNvdDu5wGZcmzdllv19c9y0z19Wxr+ETY3eHcrEvJ7SrRG9HdAaHWE+c6pYGA1FOtYPHoKXFIuNc2wdy9t8Tkw3NirUlqig1jly1fBJzLUNp7lFxn1SSiXAiiQKAevGk36I5/i5VGsxnAagrl3ZDrXhz58Ahw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZuWl+fMEfbEmrArWO7jccAklK7yIStKk0HLBhTH9d4=;
 b=HxNfGIDP5tIxBJ2viGLKXTPAPXziHh4zGSNvahIz4Uv36+qZ2V+CQ7lBIC11qbTrGjJRPgpVzy337Z/6N3uiZj0rBNzbc1Uke2zUkre3P23FnHtoJmcfIfFKk/XrcOS9W+F3L/F8zvBZyS3bddVOQGyRCTVx+3ha9WljLBQSIJ8XumrFwqAThnvECrERW+lEFS1vfkGofjzbnD2CqTOJW0bUYVHDQKMfv9NHvWENWvaqpQ7Ur2Wp/BcwBNWwx9gT4w94eDAo/U/iu91P/9LP6YJIEkuE7aUzhoG90W4a+O1w50m8lKmH32dRb1JLuMZ2d8hl+eNLFdcw5885XaIkeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZuWl+fMEfbEmrArWO7jccAklK7yIStKk0HLBhTH9d4=;
 b=UiHJxiboA9jPIYlPSlpa0NpIJyh2uW15/nyrjzPy+Gc2/Pdf+6fMNgXnwE9Pt+7yNPbqtliWzN6s8b+RcsuMhIirMTCgBEGcPgwpY7cJpao/FZO0ia1GndhuxhOpjAHGxk7K+djoJ1wDsbrupw0tnJAhg1q3rx3Ipux218HXU3Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB12111.jpnprd01.prod.outlook.com
 (2603:1096:400:43d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 01:29:34 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 01:29:34 +0000
Message-ID: <87v7xib85e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
In-Reply-To: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
References: <871q06cmsl.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/8] ASoC: sh: switch to use rtd->id from rtd->num
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 24 Oct 2024 01:29:34 +0000
X-ClientProxiedBy: TYCP286CA0188.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB12111:EE_
X-MS-Office365-Filtering-Correlation-Id: ef657516-fc58-4e46-0c00-08dcf3cb510e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hKl64GLYwVvhY8bRVCObvPtJb0gwCqBDQdFFKAwK+k96VD1hkp95dsIEPVUm?=
 =?us-ascii?Q?isgeTb201YrcFknMX+r2eKdiQO+VYIkp0H40Z/ViJ5I50heCfYyYoUff0pfq?=
 =?us-ascii?Q?Vpp7vsw8+h8atanS3Kxak0BB0sLmgVC1WVFf7OeO9LW4CzHf82vTyS691kDZ?=
 =?us-ascii?Q?5QgBoFE6CZQFcHIOc7UMnq5yxnJ/9+bv1tSUhLkQDjSF5VGp6yZaXuAqB3lG?=
 =?us-ascii?Q?9M2i6iuqdAC+LV3iPgSwaYnUOJFupEePa5QF2KRw2IATxTwOzaaonviqKLyt?=
 =?us-ascii?Q?+QkYBmD7T44OC+RHCh4g9dPDOyu5aZoz0KzEDWavAh3gKMt8ZPwOcMCY0lx1?=
 =?us-ascii?Q?pefDrk27718aj4HBjvJxgCmXeT3qqij0BbESfEp63kfa/7PmZOCwG7ulCoSB?=
 =?us-ascii?Q?i0t3bd1w/XE1Ce6r98lgt7A/1fswHqMiPC2yIeaXX5WP0cvICGlUXbf12n7N?=
 =?us-ascii?Q?hqqrcf6mxQSUblB7wQnPSG3kgC38szQh1PTwmBd3/nta/iTYp80lYxjQ+aDY?=
 =?us-ascii?Q?ccyLP4c72C7b8BiQarawQN1ayTw5RQKkhe89WYLEG/WmxAz608mMgS2+GgzV?=
 =?us-ascii?Q?K8S2qOM6SHVWJ93SZ0jqGuuVSTALmdkOCHnNmMdwjqk7lnrM0t7dmzjLJ422?=
 =?us-ascii?Q?PfJRvwIZgJ3jluzX4nPdN9HGs3nJjEF82/n8E0ZS0kZ3Wjhpk+cmNCbCjkqV?=
 =?us-ascii?Q?PnD4w/lCL9bST50xyCE2KX9EEFf3VYyceg4BI5Ys6G5r+8e0cIQXzfJ8e/M8?=
 =?us-ascii?Q?mTOmIP645cXRs4skTzYiyLBd3jorAylnhjQE6MuxcGJF7gRdIGRG5P8sY0TW?=
 =?us-ascii?Q?oRKsI5ghwX6LfzoOGe6tnNl0Gx10KLTbBR57VBhw6u0A7U4ZJ4v2M3LLDZMM?=
 =?us-ascii?Q?k/rGzgvJ+NWCQQUspA5SztmwJeK5rYu7Zpx3xuh+6ht15olk8N3l1SZ+m3WY?=
 =?us-ascii?Q?9vDMIXw5/wsU5DAN0LbSpwnQRQ4rVdO2+e/mC5/8MlcqurE1NIPJ3tdxNnSB?=
 =?us-ascii?Q?YVBR0C0CbyxtQJ2zYqJBmnDRQmgyhRj7nPTYIg2kXY24UkhRxwFBs9xD/kRq?=
 =?us-ascii?Q?RL+KnC5Xg+NgryFQkJgsqau0KgJnPBQZ1Z8cc4zHb8eQBYmHWMVoeTkDUqci?=
 =?us-ascii?Q?mklvssBUyaw9S3HLvN0q/3+qlDwXxanUB+ndn4gjZGGTRwEYvlVLFf3rHbZR?=
 =?us-ascii?Q?3OxaJNTflq6eLTTzxNIlrEZ1TckZNwPj3fdWgP8nP1Q2uI2iWcjxVP6dQpSX?=
 =?us-ascii?Q?Nh+PBSEl94MlEF1rTRyIlI7nYbWCehxsTGotgcWALgMPSubOjM36mddY/mdZ?=
 =?us-ascii?Q?3KIBZaqxCE7L9qCxT+kTuw+PjiGCPfzvv9de8TbBAgAR2Naojslf0dJqAHDG?=
 =?us-ascii?Q?jRq8oAjf3aCpbUon+8bWk20dWLtt?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GcW+L4+aNWprSDJXTVS0gYTu8Myl5yuOAWid4H6JOR8P+ZQV0cS/AaXxdNJm?=
 =?us-ascii?Q?fx5jjvjRRNCoFD/bfH/+UQ7jTqodUiKQK+/GeG6byfv8eiTptTssz+TQBMsk?=
 =?us-ascii?Q?08G6PC46e5C42m6vRiQq4/gmpv3vMftEvozBDhSQFXyqPsviFXgtuZWb3F8Q?=
 =?us-ascii?Q?/mC2jrMfE7LiaWQRnmT1rus+eD54bK/06SEpmYEx8Y9D1Wl4xAbTrGuNBJ21?=
 =?us-ascii?Q?s7WYwkSjJjK4RmsuEQ3B1AikodQYwgOd/IOjBL6K9mBh/MLNrO/Q/J5z9V4H?=
 =?us-ascii?Q?JS8f4vUatpaWG/zrbCU5Fhugi5T+V6jtWVGj5wRGTqIhqiPk/+HplLke71KD?=
 =?us-ascii?Q?oRav0KgVBbRgz6JjfpQ2NgH2su92G3OGft+EvVkFS4jSREis3ZnDTJcJP0K9?=
 =?us-ascii?Q?hzMrBCtCphbo+TT935uQspgW0HpecLBI3hq/LVanTwygNcyI2AOH0hBP2izV?=
 =?us-ascii?Q?OyzwvOQ738LTyEJy/NMy4xHilf8uDgyXDkIBzMRxy03czuCnuDBSt//YueSz?=
 =?us-ascii?Q?dc3pPRXcHJnt31jAXPp28S3tX3ovM3fYCtXtGbYneFLEiszhkOhI18XkwnUT?=
 =?us-ascii?Q?TEjiRGc8oWu+icPTzKYXcFCCFKMxwFPVcztEn5NC8yy5XEbCQSj43cEBMLad?=
 =?us-ascii?Q?bSFWIfciLRTnwviFxYTFHh4NzBV16izGwPsvOx1CX9AAIHSM5IxmiLEWe3+C?=
 =?us-ascii?Q?2gBhUvOdY0mElQ000e2yqSqEfl58c8rm8G9jSVUl3E1rN2C6A1J3iPIPvnPL?=
 =?us-ascii?Q?5FMVpMBBojxIBW0q/4EhEAjiAU4ULr983BQG6oGMRX1XVXSchYF2Z7shqRWt?=
 =?us-ascii?Q?t2gAPulpVoUpuUMD/jjhnZ0rV+GAEUOw8VXkulNFqrZQOjwYIVjv3yIxzWXy?=
 =?us-ascii?Q?6l5yNG+sbEUQF0u97dMTyTdf8Q1qEiYIraEDKfIlrUB9rErtkozJUbcBAfEr?=
 =?us-ascii?Q?K/e6ww99laBsRfvpIHiZavuL5Xs5EbfAvRRXAXcPMEGlboNzPPkBkr1+0ke3?=
 =?us-ascii?Q?CzUoG4KmeDc3dtIle3aVJTQyNL3up4NZJBfkI0ww+0Hu/oWihUNKKOhzWv+G?=
 =?us-ascii?Q?5niVtdcfxbT4gvCKPqYE6I2TMzXOxzCfp89tjqnx8pBwT6UEbF43bT+kmOPu?=
 =?us-ascii?Q?TOYFJaZrluz9bwHxU+EuLfYA4wNOlACA961BZ/5uhgfCvXsiWv7gfPo6ekWF?=
 =?us-ascii?Q?Ijl6FbNHBDNKQBAXPlO8VbtfBt1VOzbVF/1doo5OEzZ1YE809WUh/p4ybc9i?=
 =?us-ascii?Q?D6EZX0wKvhr25R0DiralEY8J0CJZhgBPl+tL4ReLb0+a02lxqK24bYI2djkZ?=
 =?us-ascii?Q?s7qGBm9m2EMp5WU3hG56qaJgXOeWEOd59W1X/IYvxOzYb6AHHKWAAcCOFCeO?=
 =?us-ascii?Q?tRZmi9i4Jvf3skHStN0iPaqzRnWjA8qo3A0mDLIQIfSxZPutb2G4KsiTMjen?=
 =?us-ascii?Q?W0roX4cvn/9a8mgN2OOI9LzvsVwAiJUoai/TXVug0AvBRQ51yTyqoEGkztJT?=
 =?us-ascii?Q?bIoVQ327Kek7LfT0i8OA9FvPYbktiBhL2dF+vxUeQtGpb8JPLY3iJwKCkj/B?=
 =?us-ascii?Q?MwhlQvRDuWkkTmrlAJJMN3O4ISEtZqn1pbMCnPmJ2HjwX9Nksyg+jMNHOuLf?=
 =?us-ascii?Q?nZdZ9OSM4YTfXr/oXr9nzEw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ef657516-fc58-4e46-0c00-08dcf3cb510e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 01:29:34.4500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tFcU0mIaNG2NPZSVTCOj2PA5iYpJsANj2IuHzd54W2JRhArcLVvi5cAGemQqOKMBoISvHhdotolpVkJQrO6ogwfaWFj0hY3eSHftmNGWJF5pHnno8GeLodDhXUkFZkfo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12111
Message-ID-Hash: BBNF6KKALOSWD6STP6HUJGBNTVGL5RDZ
X-Message-ID-Hash: BBNF6KKALOSWD6STP6HUJGBNTVGL5RDZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BBNF6KKALOSWD6STP6HUJGBNTVGL5RDZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now rtd->num is renamed to rtd->id. Let's switch.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index c32e88d6a141e..e2234928c9e88 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1843,7 +1843,7 @@ int rsnd_kctrl_new(struct rsnd_mod *mod,
 		.iface		= SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name		= name,
 		.info		= rsnd_kctrl_info,
-		.index		= rtd->num,
+		.index		= rtd->id,
 		.get		= rsnd_kctrl_get,
 		.put		= rsnd_kctrl_put,
 	};
-- 
2.43.0

