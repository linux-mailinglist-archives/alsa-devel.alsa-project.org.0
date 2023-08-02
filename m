Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9BC76C1BF
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:57:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5511583E;
	Wed,  2 Aug 2023 02:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5511583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937839;
	bh=BUPBfK4mkXTonz9ttoCOMQsqjxgl0XNnJFhPd10p0b8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fXa4Rhjy1MBjgoizvlFcLU95MrVADSONqyX4y0NodxVyHa2w01OP6X7SKZNBdCLYG
	 ZWje/CsbXP2ySO/uYnA2aRHLMG/QYA/riw+bUV5JeSY2GkA7IbRcswH4FpnYRDwP/h
	 0J8gJbyfKlh5d/0B8QlZ5qsSY+1WIHd/LONAbnv8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D35C1F8055A; Wed,  2 Aug 2023 02:54:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57FCCF8057D;
	Wed,  2 Aug 2023 02:54:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77DE9F8057D; Wed,  2 Aug 2023 02:54:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20724.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::724])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 251AEF80564
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 251AEF80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AeZYPTBY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQ/usmsBszqD8oaC8A/pFORT0wG5LKu/KBaxMA0u5gZ6DXtST7so4ev3jaXVXKeKoXhg9ZXCDGKU1LibJpDsW7BK8lNYhyjFGQ0fui+NBDqOp8fnYMd9C5Unpa+0l9SQ3nmF6c+2fdUrCrnXsAhRwmpZAFc9/qd6RNOcpEHlzdSmSc4F5z7zvEWiUDvBZHobroe/NXlG/eCBghDA9v4PCP0uKmwa9Tn9q4WhtX0ag5c12bCBivji325es2AIqny7Egr6PcGkCq5ZryrNHnFFWT25ts2pHVBhC1RrCBEIyKuu10XQeVGOtXJKoCjqyhD11KmE+jYiLrIiTFwrH/gIWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WmiUPVojK7AZdyEKKpFFk3xWkNAqbAL7L3XFxfcgIY=;
 b=nT+w0cMXIePz5uUeJUW8XFoZY7fRJGgzsrZ/F12BzhsHMDQjfrczip3nb/Ha/qDIose5eZk0ZbHf7Ywvr0JtFsdl2uB7A2OlI7bePn2iwZ6xPz/K3Lz1m1GMfU2apMfn+34iTJvVS9uzUaTIhum2ZNLU3G8DLOKFETNsb+3dq8u5MRxl4139LXuxyVTyalj5qV04ei7aPKEVsVhmUNY0EUI6HRS8TtiWWBcc4XmUs10RK+CNCNMFCyr152COtS4vWA2E+ValLiF1FuBUMYTJmgkQRq2o4C2Yj8M5U3SAFK8BNB3Smnb9GTZbSmf5Tg/rpoDfQ0+hs79NH4AHWYKW4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WmiUPVojK7AZdyEKKpFFk3xWkNAqbAL7L3XFxfcgIY=;
 b=AeZYPTBYZRgfBMoqN/P3LJJq1ygMnzL2Qan8b9kn77Tq7nvJxk96MaMBsJMsudBUKcUBhlkHda70I2VXVC0rtgUgq0j+itB7E0jmpHMILPWxoMbk7oZcHZvciDZL5hftocr8ab2oyysAaJHledTfZLoW3g4a69AEP6FphoOMNxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8348.jpnprd01.prod.outlook.com (2603:1096:400:177::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:54:27 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:54:27 +0000
Message-ID: <87o7jqtgal.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 15/38] ASoC: rsnd: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:54:26 +0000
X-ClientProxiedBy: TY2PR0101CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a6680b-112d-4da1-8cf3-08db92f3057f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ks+6KtBSvIXm1phTRqM1e7l1U5RgCmogJeIQr5Xity8LyzXPbTgqp72l8I60VTPULBRtKf5vmISPLqkijFOvzhQk5eqHxmdN5mSsNGMcZQgeMF2Z2siRKzXt4JVkrCCtaNdnBqDiftyxaCE1tEFppjRmLrfMy6Jwu0Gm92lnCh83piuGlja/1FZN8Z1sDh6pOR9tWNQOmg/paiGAT0tRgnQHqvXKe8L2Ojh+FeqsY8pNLaCUQdjTYKXiTTYpjLbzujF5hx/Yn9HOJJHACXHyh+4NVd8fauQKzkxrWYHmGpfihDPJ4u3MIJbi0gjJhqLGzibGtQ3io86QS7NQD37Ei4coNxsce1hJOehXhUyipZBXJAc7em1EoqwHi4d2cvT+pcx6lciVkq11ujv7d1BSz37NfxyAqQFT9tEiHYLZZKBFU45ZtEaK9546JorrVB9HZ15Bj3WhK8wfiYl4UFoJlZoA+ftUKVNqaoV7lC/+nvb1flWJvFq/33gbUiRCnEtnKBzLwa2aseTi1D0NotlxaSy5ipF0A64O90WWdJhxYgxwvqcVxWW4e/cO1/YZTOIUNK5rCcCAI2v7L0eef48845m/MD9b2FFY+QolEa3CMQZzPL6vJMNfXEwCIWExn97C
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199021)(5660300002)(8936002)(8676002)(41300700001)(316002)(4326008)(66476007)(66556008)(66946007)(2906002)(26005)(6506007)(38100700002)(2616005)(110136005)(83380400001)(6512007)(86362001)(6486002)(52116002)(38350700002)(36756003)(478600001)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MNSn/Ll3PEE7O/9sdkw60PVRL/WDOBdFUvHPduRjNJ8rJQLlJ58e3XS+cB/x?=
 =?us-ascii?Q?nv2VE+Yc8Hhb7fyzXW3e9rwctDZCFfsDBU4a/Vqz9sJMioxB/YR75Wg3YOyM?=
 =?us-ascii?Q?0sDG5s11M6sW0tysHTamXd1GwUfIrg5jmLi+kvlxU9psDeceKynLTMzzdhXm?=
 =?us-ascii?Q?2GVdBtbClcHKsvi8XT/0Gyi4C7VDbTHrZp1V/jfhvAKg5YuorZOIhucVTMrj?=
 =?us-ascii?Q?ORCe+wsuxpnEiIT7/ly352v9/Z8llfsHD1ejzcL8Ov5sWWzftTyWjNKmFkzY?=
 =?us-ascii?Q?XE+rz1UChS+Ev5Xkee3GFxKW84eYp3ZK78dCuAMxzhRLwrsWIsli+PGvyc1A?=
 =?us-ascii?Q?BPsHGy6Rsn2tOMKssmGfz4Pk0gqECF9e+8oNwe0YV6aDsxSC/LmpXQIp+bB2?=
 =?us-ascii?Q?tS3OtR89uS7VuwqzHoMITP/vvMc4FzCnRRwqnmfnQPyQ7LKDyDIiATrVZI8y?=
 =?us-ascii?Q?wK4ZpL428lFBk+LnUlYTKwGbdZmd5Xjx20aAMJoV2lYepFEbzZFUXUBS2ycS?=
 =?us-ascii?Q?+onp4Zr5JdpE2wir31ylDr9vLPqbnn7iQ52r5woy8UjicYM7XT5ft4kuGgjs?=
 =?us-ascii?Q?Sg9is9dbZKQAqChp1dgFqn5Tz7RkN6lIVJVfFB87RgXIo50MM2NheL4rwNjy?=
 =?us-ascii?Q?1050rKCA7/AqHTJ/QXcoR5OYfgQ5JdRsCH1siDa9HbGIHGJrzbAcM6CcAcu2?=
 =?us-ascii?Q?yB4lIWO8L6qtyevtGpEWjamlEIDDxBYD3JqZ+dUwu8W7noehVUmjlx8uZ8yX?=
 =?us-ascii?Q?Mk8U2anHbDnTYQy+HsAbRlBYcHng7HUjq8exM7nwUQlgABCxlsHfpM/3OF7P?=
 =?us-ascii?Q?fMtDos7anLTJTwm1omSScVD23Vl+22Oc6tQJIrKKl5i01lbJ4q84/SgFsi7w?=
 =?us-ascii?Q?lfADhJ2q5CrNE6frwi0QJOy4pMoNsz9+MF372zQFXFgAm6zl/nZwZ5Ns1kRT?=
 =?us-ascii?Q?Z6r2rShX4gITjPJ6LCxfbBT+GjEMbSRPIQraEoTTaMrJWQBFKhpDsBxe8F2S?=
 =?us-ascii?Q?YhX5vMxaQ1xk5l5flx3hzDALry/7l+yc3eX7zR+7mcq3CwlP5ZyTA821g5H9?=
 =?us-ascii?Q?pcqO5oBk54MxJaET4HsBcciTDZTcyLocNjokBAgsJgRctkA0+h0goEshb4XM?=
 =?us-ascii?Q?zZCUJ6zO/C8aum/0Le/3gh+B6ssfZyHT6jyh3d1HuY5YwosBqzPRXTmj9ozd?=
 =?us-ascii?Q?Ka0pgrxwrxf1y/l0EvnVgLZyryICXHihx0wYA7TRg3/GM01mDOYInxgOCgc/?=
 =?us-ascii?Q?Nx3TbPJy63kRa16hFoR4qtjj+0FsVko+S292lVQdbIW1O2gPPviA0DEJMiDe?=
 =?us-ascii?Q?RctvRbLfjgNKytwB6+d9oo+bJTGvyz6Lt4xUTUDfKge10KXbJf/uXmzqAK5U?=
 =?us-ascii?Q?0zFy9p1HHNoh4aWOsVNqFzP0tCgkzFMfNbjTFc7B6uOg6Wk9vBEifRio9ehg?=
 =?us-ascii?Q?DyR9wEhEe6bDqjRrJwzYMGrDouNdkdh0wSJA/VHNRQHsWjP1mTb40iatwQEe?=
 =?us-ascii?Q?GdOOEIdvjvY4CiCZcCu72wpODJ9y1Ou8euJg1Tc+LKB31F6fKUnKkYv/i6f5?=
 =?us-ascii?Q?sUUMiPz7wGVZ4QrATuHXhU2HAHO4pW8xoN3cPJkuIZ6XXkcJF2mMODHT+iG/?=
 =?us-ascii?Q?4otfWF7w4l2QvP8gDQpM5fE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d0a6680b-112d-4da1-8cf3-08db92f3057f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:54:27.0991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pVznqQY8M+tZp3oDQLa3H/lkR53c6Vn0dftdv0dEOXAAQYzjlWi24iEqFZ7vgDuKM3pYEmOFWarhnoOkOOI7jueorsQgPAaP2XSUTEqBrhWOXh2gK8RCzlbomPOZc0yI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8348
Message-ID-Hash: UP2LLQH2W265WLSH67TE7POWM3AWPXPG
X-Message-ID-Hash: UP2LLQH2W265WLSH67TE7POWM3AWPXPG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UP2LLQH2W265WLSH67TE7POWM3AWPXPG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/core.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 9f3d97bc177a..069add7b1b71 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1085,17 +1085,6 @@ static u64 rsnd_soc_dai_formats[] = {
 	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
 };
 
-static const struct snd_soc_dai_ops rsnd_soc_dai_ops = {
-	.startup	= rsnd_soc_dai_startup,
-	.shutdown	= rsnd_soc_dai_shutdown,
-	.trigger	= rsnd_soc_dai_trigger,
-	.set_fmt	= rsnd_soc_dai_set_fmt,
-	.set_tdm_slot	= rsnd_soc_set_dai_tdm_slot,
-	.prepare	= rsnd_soc_dai_prepare,
-	.auto_selectable_formats	= rsnd_soc_dai_formats,
-	.num_auto_selectable_formats	= ARRAY_SIZE(rsnd_soc_dai_formats),
-};
-
 static void rsnd_parse_tdm_split_mode(struct rsnd_priv *priv,
 				      struct rsnd_dai_stream *io,
 				      struct device_node *dai_np)
@@ -1353,8 +1342,7 @@ static int rsnd_preallocate_pages(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
-static int rsnd_pcm_new(struct snd_soc_pcm_runtime *rtd,
-			struct snd_soc_dai *dai)
+static int rsnd_soc_dai_pcm_new(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct rsnd_dai *rdai = rsnd_dai_to_rdai(dai);
 	int ret;
@@ -1380,6 +1368,18 @@ static int rsnd_pcm_new(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+static const struct snd_soc_dai_ops rsnd_soc_dai_ops = {
+	.pcm_new			= rsnd_soc_dai_pcm_new,
+	.startup			= rsnd_soc_dai_startup,
+	.shutdown			= rsnd_soc_dai_shutdown,
+	.trigger			= rsnd_soc_dai_trigger,
+	.set_fmt			= rsnd_soc_dai_set_fmt,
+	.set_tdm_slot			= rsnd_soc_set_dai_tdm_slot,
+	.prepare			= rsnd_soc_dai_prepare,
+	.auto_selectable_formats	= rsnd_soc_dai_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(rsnd_soc_dai_formats),
+};
+
 static void __rsnd_dai_probe(struct rsnd_priv *priv,
 			     struct device_node *dai_np,
 			     struct device_node *node_np,
@@ -1409,7 +1409,6 @@ static void __rsnd_dai_probe(struct rsnd_priv *priv,
 	rdai->priv	= priv;
 	drv->name	= rdai->name;
 	drv->ops	= &rsnd_soc_dai_ops;
-	drv->pcm_new	= rsnd_pcm_new;
 	drv->id		= dai_i;
 	drv->dai_args	= &rdai->dai_args;
 
-- 
2.25.1

