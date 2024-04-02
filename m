Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7382894954
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 04:25:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7E8F23D4;
	Tue,  2 Apr 2024 04:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7E8F23D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712024751;
	bh=RcuBCc1hI6mYn2nBjllBUwPIZ/snnQB5uJTo497fbyM=;
	h=To:Cc:In-Reply-To:References:From:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l9Hm/miDyxk245WILri4DpSHtksBvi4tI7qXEVX386JrzVGLblo3sG3JbkVnPCeqn
	 PinFNIMnW5cIkZemRWiARb4prV35EPvHuD/CoxlJlvQMvXoxDab28JHm9CgaR+WDwX
	 1i1JTmxK7Nkz8PSBhOa5scPUWD1NO1laIjGBAvhs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F9BAF80637; Tue,  2 Apr 2024 04:24:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A20FBF805C5;
	Tue,  2 Apr 2024 04:24:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37DA6F805B2; Tue,  2 Apr 2024 04:24:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4816F8056F
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 04:24:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4816F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fKcsiLz5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJI3gCmM19LGCFxXXXJEfyNt4yEhAhbuOY/JzAdIizOXqGy4YpRy9VYBSYW3cDib/RFrJgc6CBxW8ylM1zp1jMk+7ooFtHIeWKFKNRtSWreBVF5jQFxUPow8PIDxvPMy6RJsu6stUY7HOqggxvcQZIpHmeDhP68OuFCFpvl5baTcl6sRvkB1HuRRUWmNN3D16fBHgO09ezjE4AoHdV+v/n/z7vsNBjg1AwZHRegQtmQ3i4kH3PE/tn2umdpmUMejqccMhL3Hlqi7lmO3EoJHBqlF7yf9qSg9ke0A72X6a8NUL3bYTx0myeu/Widkou0A8PmZBOh5X8IfDU8eFLxTCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOnWMOL2z8ejzyivRcwq1uk6GGK4WxrOXuVBBwZVUjw=;
 b=ioUvAoxUksoMhDpZKxVEMcDQuhQBlwgFVhU1h8mCEZiufB8det79emKKYGL53C11QDI37J/ZNoFhmr2e4sYl1nGh+Q1sOMOh5UCdfCGqBrm7fmKawEDvM+pH72uDEej5AU5XnHBLuvQ40knEg/ahzLLy+vwPj656bMPffedYZdAi1NA5N49g34EfB+WwF2PZxII/UvsXb4nSBYMC88gKylGu3AFHKEJDEXNvhIMsZ2jAO8m9WnOPepLOyu0IYSusuZwWdvb7e+mTvFCD2V0nnvVNuLgKbTpg3RgurIajy3ki0+bbtlORjt7s0dYbTxPpqwo7MrXhri/10XosSpDMXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOnWMOL2z8ejzyivRcwq1uk6GGK4WxrOXuVBBwZVUjw=;
 b=fKcsiLz5PT/O2KHNCRA5eFQrYRFPOqZqlAwkqLmLUH8iPPZhVwVZwBWAE9FGmq1BZzLj4SZjwqiobgq/PacD84x3wQ1kVhhRmmVpl4Jxfi/+h1HxYGJMqtv6x5ZYF8SB4Em1Zw/ipRoUlGSgvYof0xG87/KPIly2W7MAv/QCmLA=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11608.jpnprd01.prod.outlook.com
 (2603:1096:400:370::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 02:24:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Tue, 2 Apr 2024
 02:24:23 +0000
Message-ID: <87v850a4dl.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <8734s4bizh.wl-kuninori.morimoto.gx@renesas.com>
References: <8734s4bizh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/5] ASoC: rsnd: no exception for SCU
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 2 Apr 2024 02:24:22 +0000
X-ClientProxiedBy: TYAPR03CA0024.apcprd03.prod.outlook.com
 (2603:1096:404:14::36) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11608:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Uc0LhtpPhZ7Ov1BIlmolmKL86Q1qiJVD2ydFGyhJWfn8MEAeY2RUkX2tVf4FeLgeNqCPUQ0UMQWC2DdVWs5nxd/R3yoJiqT8dGC1Iaz4A3PGm8r2eGkx1bol/Z39vYD2FXQLmzLAKIHThnSXlAXyPxnSfx8UePG4O8CaZvECDPqPOb1Dna2oJueTozmczJ4yh+dlWOxHhcvl94D71IPL7Sd++DQUkccyxnvSjsFmqNIW7uuvgKpKksKMztsISFk7Xu/DpoMoSmaelUM2IGp9LyB8y5oaSHhbZkr/rbbRWTDsRZhgCs+lINoxnEN2/oG6xWF+B5L3/pz5dLT+IoRlL0+vgVlH8ccvTAl1niU/7iCN09vTCMCNU56nSBGYnNnN9X6Lr3QEpEjMVH2VmcGZZPEcbImbH5nlMtxfl2UCib5RxclqZgts7DTLr/cpXLNQ1hGuV/LvtP5EIq1QuD7SFq8iKEcb1tuUSnmuyfi7x+Dpz0REvctteWeB/6/MxfnbWeHqxWJq5E2A3XlKzG0OzsTccdwSeaiHXkCw//QdmMnnTaP76dDoYzNEzzwIw6Vi5ymlC6YJfWe+0V7qjzWI41YHcra7REqlcR2dcU7zC0gjwN7EZW7QSPObKZPGBqMm//uoIs5olOhrOPyYkbV/KPR4Y/p94mDQiSuIb2gF9GDogx1RnFzd+Do5RFfxgBwsbiYewhVSPB7bARgQGFPipmPtksmy6oJ1EUHpfezBAsI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+OHQI6dFHhCxzxZ636Mxd0slS0i5Idl519gkDd7JsBsDQ6xZEJdZX8f1Fiy5?=
 =?us-ascii?Q?QDdugvZkJIGTX1OcWli2KyUhKwa+35+GeiK5S+Q7qMie/Ujwt0UAnnRoWyl+?=
 =?us-ascii?Q?Ps2Obb5lHIRn74oILGTCZb5qzlhQCWZmR0eXc2z3dpB9jMBjdse8holm+CHR?=
 =?us-ascii?Q?j3hkg0Na+e4o+OGVkFx6m6I3eSPqtEbyXaz8FN9WiVJfrTlZWPrEG36KlcXy?=
 =?us-ascii?Q?shwbdcahuhK2AV+5r7lmGUjwZy3yhyk01nnHj2pC7ebckpWfySDiVe1SPpEw?=
 =?us-ascii?Q?H9+YmCvZOYgJayZAKqzqlEpMSiRYYpEBuqzJmj7eLEyR1I3KAPR5qQy40CDb?=
 =?us-ascii?Q?ywpWrh/k20G7pTwQYoOV/D/XmjqTxvkjnN9NAR3cIEtYjTxcdUa+zysWyKnQ?=
 =?us-ascii?Q?ZvE07lQi4juL25jor4e/kLlppnzjc/zHIxoZ2Fbf50EX09EJDE+AbokENktB?=
 =?us-ascii?Q?TrO5iLkRJm7dRcs6kVjCkHAEbncOzRdcH3BZytoUnFNcXtoAJ2Dc0mPaAfgZ?=
 =?us-ascii?Q?hvZVn3yLULLicnSXXATeTeyMO6wM+2cJtnZgzwomCHPnwPm9NXH79FZXwddT?=
 =?us-ascii?Q?P6VlR7/rKbImTwYknE+lpB3dadxwUFHl/ZEhJLtWFtsHV7tQAycz9AQ45vBo?=
 =?us-ascii?Q?5wLwahTUqcSy1Rqkv0PfCBIFusbeqi74eog1oZ3V7h7IJLa3CYgcMlOocDR4?=
 =?us-ascii?Q?RGFbw/jJBd/YWpxiqDlPCjYM9x7FN6ovsL/IQr7jT8J9/UCwX+s483qMmRYP?=
 =?us-ascii?Q?mxlnTDIzVCDv/fSSl0ppzqaA2jtTjKAKGLRr1tveUqyQ3uPg9/Gr1EVcy8ej?=
 =?us-ascii?Q?YfKCDPF2SU8zvplFTHLqlGyJ6/xNlyjCqbF+gSMux+a9grwlNtGjg3HfqYgg?=
 =?us-ascii?Q?uxPtFORTKc23fdD18N69wKw7lTTiGZY317ZIrLXYsjzEqvSenYo7ELBpJ7FK?=
 =?us-ascii?Q?ssh4qL+CSUo6+RLBqrYeu4p4MnHlRIeZLKEz+Ypw3UK8tkmgcRL7BebcHelr?=
 =?us-ascii?Q?DF63cH43/23A260hQT1MbEO4PM9I+psWQQN3vLnB9wcEQ5eMCTW6AifsGILd?=
 =?us-ascii?Q?98+3itliWtHq5jKSaj1ODkg3UOs3n72y+F0HRhbCIjij9ga2Uq2JgmMS15cd?=
 =?us-ascii?Q?Fk5pxIo9xAPMnJXE5L/yo4rEjSF2p4134F4o2PdjM+Ko96S12BPl9fcrBiN0?=
 =?us-ascii?Q?8lSh4Z5ugZsgQwuIDkiogchGSiBdxSTcRMykQkduFv4p6Eqh/Naci+Zcd1dA?=
 =?us-ascii?Q?Mqi/kLa25bFQ+cGX6pBByL7l3gl4cV9rs0QU/1q3ozveYNwjmZsJbkaErgfa?=
 =?us-ascii?Q?dC2uAQBoHNM/CEFOXRotS378BA3p/jc4FtQFgMGrSPxOwWbm2374tSz9rfpj?=
 =?us-ascii?Q?MQ9Mz/5dsUh75k6qcYviNKnBx3nSRJ872B6ErSwesVUJPMvdo/O24vwDXZ1s?=
 =?us-ascii?Q?dEVlK5xq8Ra6r/jWY6D5wsg43b/x2vD6yZFpxoMKaLw6FrulLE7v2ZxlU9ll?=
 =?us-ascii?Q?W0spXVDyvKNyPBPRPjp/zMkJJhABC2cxoGIZmhZdM9E9Zv4aKwwgWcnfL+Ze?=
 =?us-ascii?Q?128sA5LuBF8nBWvzpRGQIxMv60RLZy6bdmWkMP7TdRDvFB4FEZpDVuyGBIB/?=
 =?us-ascii?Q?grPE7+qSB5EV7j5HHE+FOSw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e7d57da2-c2e0-4be7-ebdb-08dc52bc0259
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 02:24:22.8628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 m4enaUGZcQmPtE0lflpUi7Vk7COEXhAoHHB19EPq62chxUvY1AxK6aS9JaLOGACk6XLy+iajLRuCJ4+RogdtLMlsO9BBppuXOrNmjk73MAtvBoJB2PPmqPO9WMYVA932
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11608
Message-ID-Hash: UOKD4F3EL3ECIYFYYRN2HM5KMTTBUC3A
X-Message-ID-Hash: UOKD4F3EL3ECIYFYYRN2HM5KMTTBUC3A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOKD4F3EL3ECIYFYYRN2HM5KMTTBUC3A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

R-Car Gen1 and Gen4 doesn't have SCU, and current driver checks Gen1
(only) on each devices (A). But these drivers are assuming it might be
not enabled after that (B).

	/* This driver doesn't support Gen1 at this point */
(A)	if (rsnd_is_gen1(priv))
		return 0;

(B)	node = rsnd_src_of_node(priv);
	if (!node)
		return 0; /* not used is not error */

Gen4 DT doesn't have these device settings. (A) check doesn't work for
it, but (B) check handling it.
Gen1 DT doesn't have these device settings either, and (A) is handling
it, but (B) only is very enough. (A) is no longer needed.

This patch removes (A)

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/cmd.c | 4 ----
 sound/soc/sh/rcar/ctu.c | 4 ----
 sound/soc/sh/rcar/dvc.c | 4 ----
 sound/soc/sh/rcar/mix.c | 4 ----
 sound/soc/sh/rcar/src.c | 4 ----
 5 files changed, 20 deletions(-)

diff --git a/sound/soc/sh/rcar/cmd.c b/sound/soc/sh/rcar/cmd.c
index ec086d8e4d44..8d9a1e345a22 100644
--- a/sound/soc/sh/rcar/cmd.c
+++ b/sound/soc/sh/rcar/cmd.c
@@ -157,10 +157,6 @@ int rsnd_cmd_probe(struct rsnd_priv *priv)
 	struct rsnd_cmd *cmd;
 	int i, nr;
 
-	/* This driver doesn't support Gen1 at this point */
-	if (rsnd_is_gen1(priv))
-		return 0;
-
 	/* same number as DVC */
 	nr = priv->dvc_nr;
 	if (!nr)
diff --git a/sound/soc/sh/rcar/ctu.c b/sound/soc/sh/rcar/ctu.c
index a35fc5ef8770..a26ec7b780cd 100644
--- a/sound/soc/sh/rcar/ctu.c
+++ b/sound/soc/sh/rcar/ctu.c
@@ -323,10 +323,6 @@ int rsnd_ctu_probe(struct rsnd_priv *priv)
 	char name[CTU_NAME_SIZE];
 	int i, nr, ret;
 
-	/* This driver doesn't support Gen1 at this point */
-	if (rsnd_is_gen1(priv))
-		return 0;
-
 	node = rsnd_ctu_of_node(priv);
 	if (!node)
 		return 0; /* not used is not error */
diff --git a/sound/soc/sh/rcar/dvc.c b/sound/soc/sh/rcar/dvc.c
index f349d6ab9fe5..da91dd301aab 100644
--- a/sound/soc/sh/rcar/dvc.c
+++ b/sound/soc/sh/rcar/dvc.c
@@ -331,10 +331,6 @@ int rsnd_dvc_probe(struct rsnd_priv *priv)
 	char name[RSND_DVC_NAME_SIZE];
 	int i, nr, ret;
 
-	/* This driver doesn't support Gen1 at this point */
-	if (rsnd_is_gen1(priv))
-		return 0;
-
 	node = rsnd_dvc_of_node(priv);
 	if (!node)
 		return 0; /* not used is not error */
diff --git a/sound/soc/sh/rcar/mix.c b/sound/soc/sh/rcar/mix.c
index e724103a2e8d..024d91cc8748 100644
--- a/sound/soc/sh/rcar/mix.c
+++ b/sound/soc/sh/rcar/mix.c
@@ -295,10 +295,6 @@ int rsnd_mix_probe(struct rsnd_priv *priv)
 	char name[MIX_NAME_SIZE];
 	int i, nr, ret;
 
-	/* This driver doesn't support Gen1 at this point */
-	if (rsnd_is_gen1(priv))
-		return 0;
-
 	node = rsnd_mix_of_node(priv);
 	if (!node)
 		return 0; /* not used is not error */
diff --git a/sound/soc/sh/rcar/src.c b/sound/soc/sh/rcar/src.c
index 431e6d195b09..e7f86db0d94c 100644
--- a/sound/soc/sh/rcar/src.c
+++ b/sound/soc/sh/rcar/src.c
@@ -652,10 +652,6 @@ int rsnd_src_probe(struct rsnd_priv *priv)
 	char name[RSND_SRC_NAME_SIZE];
 	int i, nr, ret;
 
-	/* This driver doesn't support Gen1 at this point */
-	if (rsnd_is_gen1(priv))
-		return 0;
-
 	node = rsnd_src_of_node(priv);
 	if (!node)
 		return 0; /* not used is not error */
-- 
2.25.1

