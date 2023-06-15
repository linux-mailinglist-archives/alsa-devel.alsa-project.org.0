Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDBB730EB4
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 07:35:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CCB0822;
	Thu, 15 Jun 2023 07:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CCB0822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686807319;
	bh=lnxeajXCxmxseEbyX09XodbHhxJ0AVUUso28EkJ4kUw=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZVe2FJwS3pi0LSOEX2sJ/xZgercGbOI4AYzMnYL2ITbX0pPhQ85I332EA3NYyzNcv
	 N26U1dsTv2MZsi2jJO65yrJs+sCXehAMdKZPVgiFcsofdKS+OYKmRQK1SeYxmjJQHa
	 a/MpILrsOr1zy0oXx7SrZ+R9G/lNWegmWdoS0aIY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF37DF80533; Thu, 15 Jun 2023 07:34:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 835FBF80130;
	Thu, 15 Jun 2023 07:34:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38BFAF80149; Thu, 15 Jun 2023 07:33:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::719])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79B37F800ED
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 07:32:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79B37F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GZ58612n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kny5Nug0UtZRpYHFrf7PrPMV78sAi/73dI2bHhTpaK0F9UT2xBXaVazmvEID2hKxbDI3mWOiLsUH3RY/5GkSP0ZeCirHvVIP3qlyjYYo7v31dQr03uzieVryyScI6RaOLU4psqWtw1htmpxPTQncaAD0Xt3xQ/rcYKrtgjyuTUKd6kPTjyhXvF5k53qmdeDBnLnF9ttucawo6/VYHBQ45E/g4BU1xauZWcKvgWLX7xB/p4z12bCnycP1v6tjEF1Y3ZNNRQo1PcEbK/l7Q5X2POSC6P9A7dflQT6FgRSa7iy5mAT6eEQFYA58rsBcA72RmcTP/bnbh6YQMtLvw+9K6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnN2bg18j1QtUGEFVBOpr/x8ziM9VF4IaW9D7bw8ur0=;
 b=Sr9n09nC9x3IOcnJz+85pwGmMYiHjwqX+vilwwht2pkJmDnLIUeR/6bwMLt5svThvwVebDYHbn/qKDW41ecV0gVDd7jAAgXYkziQlVIdHPogfBbBfxvo0NIrJ6jyTjPBg1NbfDDv1zE1fxiPQFlPw4xw0L4BiRfde55AFo1cFn1gfyyotDQU/brrjYJoFJ04n4USlI31jdbTL30IjjKwbbjVg1lONsw/hhNn4zhFau9urLUF4r+4Tqrmo7dIV1AiywVlXnrCYNUBFTTq66XhxmEeLCQJWzQrfMmoai0XvRJiN6bpRYF+Qclfp+q8TxYKftUANT66sjG9h34P0bILhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rnN2bg18j1QtUGEFVBOpr/x8ziM9VF4IaW9D7bw8ur0=;
 b=GZ58612nA8wIbsFnmCy9LF5CHdYp5bdnKitAbXsDCspSZwOv6uPv1Qp7FlplZBUvJPgM0YifmgTHIjo0Vcwv6ME4+hZB0RjZ+KKFOi1KMw7xuFO2iXTziqDN6e+RapIGOe1d4e4B6v7lFUCGAakRQ0/ifCmO1na45ijmzdDXmjc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB9472.jpnprd01.prod.outlook.com (2603:1096:604:1d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Thu, 15 Jun
 2023 05:32:43 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::76e9:8b5c:8ca5:40e0]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::76e9:8b5c:8ca5:40e0%4]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 05:32:42 +0000
Message-ID: <87bkhhxpc6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: simple_card_utils: remove unused cpus/codecs/platforms
 from props
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 15 Jun 2023 05:32:42 +0000
X-ClientProxiedBy: TYCPR01CA0097.jpnprd01.prod.outlook.com
 (2603:1096:405:4::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB9472:EE_
X-MS-Office365-Filtering-Correlation-Id: 78531d41-2a55-482e-d8c8-08db6d61f121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TdLdKSiid8w8+tHlkxrh0TRRwVD+6ZtZi3nMTO11Ox+DHM/zPD4dojyZMLPHSvp8Y2o8cjtnm7eRuMlXDw4JiyS9WAWcoyalPsRGTnVfAxPCg7JeMk2KrV1g0lQt2QhJH+rYtblNtcsShK/oHyKS+fYfmYP72E9GnJtW0Cuul49xW9ynacHUH4yM3XDJQ3gXRPJNFy5K/AH9mtc5bdltRMWubaAByucf2jWy8vl0CATqlqn5vJd0HppMNuUZdZ4FAYypHf9QLLrC+vrBkfyeukq4JD44xj8QnVyRuM05o1mcPHPKsrov6OQps2EcutLdflcthK4mWD8BLPrvyKeHDCdNgsD4OQhnWUoSAvueJ91yI00KMv+Ngw7kyq2akE77X7WP34Z2P2NZUKrkjE54wrA74riAL4ChVRkXNGVYrzfgpUocJXdzMzSf9m4APr3MF4LXatTR+zPFjXYdJCxa6gIY1uTMt5CVu0IitQph6GPjPGrIuPg59LCJHFhXsPgXQkLVwcOMow0wHTlaVrng+PHfIFphICfUuThNbYniF/BwuLPRUhmFx+U0kdEdFeKsQdD/uKAnptNmysLsdFokSj3TqX4BQAfJx2hnIqV49QjE9FXAdy1b4S0oc4Dn5g1m
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(451199021)(86362001)(38350700002)(38100700002)(8676002)(5660300002)(316002)(8936002)(41300700001)(66556008)(66946007)(6916009)(4326008)(66476007)(83380400001)(2616005)(186003)(36756003)(478600001)(6512007)(6506007)(26005)(2906002)(52116002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ouVAtcxS7JaWucJ9dxJF272cZ6TOPVNVdrprA+aSpVba/pTLqp9kTLzNS5F4?=
 =?us-ascii?Q?8CHBV6sI/6keUt1NUxdToiBaqucoawUZb3EcgkB4Fn6Ow+Vp0uY3qAT67aeC?=
 =?us-ascii?Q?3usde48biJl+B4oPrWz6Pk48Grk6g9iH8DE5z/wxAwo2Xzn1emRa6xIzno4G?=
 =?us-ascii?Q?RJGDBTN1LxEp/2GVs0FiJhgdHqzeMKQBUT9zg3XIyUDcZ6ywn+6kyBoSUtVz?=
 =?us-ascii?Q?LxgO2xXhMznVDXygOrOLEK4AyT4nAfWbZrLL6aems1R6gpGrlDGE5S7+vG0c?=
 =?us-ascii?Q?CyelUFNs5aUOT8gl0atZm330F8WAXU9t7rg0R1A2TIP+5d8hW04dSJqVCksh?=
 =?us-ascii?Q?XmcqFmPc+fIkilsombaEKAQxro20+FoUkfz68daWegQPPLZKecWV/OuPZPNV?=
 =?us-ascii?Q?eih1cDxjowTyqSLBwYNSk4vCxUfcUV/jSgfrHOJ2aXE5/xf44lmJM2cCjNko?=
 =?us-ascii?Q?vY0HuXg9zim8UzREM9pGXVohFszYc5cAjI+4ltqqK6lmgZvx81t0jy3qj9qK?=
 =?us-ascii?Q?X9k31CGiNioHQNsoDUtUjK0Rdo81liF2tkxV/u4rsByqa2Fmg1Vx1yTnpn4K?=
 =?us-ascii?Q?IGDIDLOA7HfwBfR2kGOLmnh15ksBuxoVKeIx6XUQyt76NKfctifOmai3iazQ?=
 =?us-ascii?Q?K1VQq/gDW0hYGEmi8G2EEgLy+VX2GaUVhb/dWZEtxACVORBRL8uJwYpn3g9R?=
 =?us-ascii?Q?rO1AldzbxRCnBBjAtab/cRhmsAPUgcXXcam7adEQ8eza+ztV0mFws//WFRmh?=
 =?us-ascii?Q?58w0zjTsJA6RB5FdlsYhstgom2NjQZKQpd7KClls6Nm+A8vo5/kC8YlTEX2N?=
 =?us-ascii?Q?knFXvfOqDhItXfsL3mt8b3MY/XVLyg1SIIpIPhfYQfGAxr0Dv2hqvjjO7veS?=
 =?us-ascii?Q?h8LtpwgX6XQL1atTcUCy6dXba+ByVkSqU8m1c3m5itN8KEerL8I7VYMiyMZI?=
 =?us-ascii?Q?CJVRCMPXZRX8U43A7KzFMzzGDRZbIUpTYj6E1Z2CsPZfFmdKR6eMDMpIDAH/?=
 =?us-ascii?Q?xOd/bzmEZoO1p1bQXtQ9iLlWoCfgN8XBXOOrgQMyH69628F+UQnRQ0AAt9h1?=
 =?us-ascii?Q?BQFOhww228e88JvBP8EhSCT5uHa8VqOVCcl31YOSbs3z9Q/BZnslcA0UwEGV?=
 =?us-ascii?Q?L6Hq791H4bFcfEswikrDDYd2am6HE3jrwYB3w+FKG9vvQdzMnpLqm7SgZqgM?=
 =?us-ascii?Q?caUp6oOizuO1sDjUjCuj+0bCQupzV434M21gyONKYmYKtJ5lHznyX2jua/28?=
 =?us-ascii?Q?tBdyKJoCWeiTw2aPr/mfS5hv5fCgV79P+OPNouvl9u5WtPghgeIz2NcgFBrb?=
 =?us-ascii?Q?h28tnyiFl0m2w5RJ/WfD/luy2dWKm6eCIM24DTlGPNHZ2PnHo6x5lg2IjTje?=
 =?us-ascii?Q?xHjH3K8Qoa60vs2abtsD3GcTjevV1MB/MAWp4JcbmgOcFLd2+uHCObMzQGRt?=
 =?us-ascii?Q?+hQm3cjt+sZml6zAtGFfviYAdYfTO3dCEngJ/fJ3zQRLgnsqP3NU7z4mO3+s?=
 =?us-ascii?Q?9a+cIZm9JBg8PmHA8U9BUPOabATeZZlptp8y1M1FSNJ1A5g1eo+3xcP1Q9GD?=
 =?us-ascii?Q?ZiKxIiz4HyNABomag4AyhwY4hq/3LoPkINpRrPG6a14ahqiTDfa0vaco7mb1?=
 =?us-ascii?Q?FiPGLIYr5ZhdqMUNBelUFAs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 78531d41-2a55-482e-d8c8-08db6d61f121
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 05:32:42.9253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4EUbQ0R+J0VdIwtPPw/YP4yIeLwDNiowaw+GoaLUV9yox9zhlpK3ElA7x16ZIShbGGFvp3pRIvNFQHT9KZjb4n2q7WrV7SJhUG/l7sZ1WDLKY/O9+Om9ZClefEBoxiPz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9472
Message-ID-Hash: CDZPKEURE5JWRAIWEGTDKABABTMCJVS6
X-Message-ID-Hash: CDZPKEURE5JWRAIWEGTDKABABTMCJVS6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CDZPKEURE5JWRAIWEGTDKABABTMCJVS6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

simple_dai_props has cpus/codecs/platforms. These pointer were used
for dai_link before, but are allocated today since
commit 050c7950fd70 ("ASoC: simple-card-utils: alloc dai_link
information for CPU/Codec/Platform").
We don't need to keep it anymore. This patch removes these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     | 3 ---
 sound/soc/generic/simple-card-utils.c | 6 ------
 2 files changed, 9 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 9daef37fe9a8..b450d5873227 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -59,9 +59,6 @@ struct asoc_simple_priv {
 	struct simple_dai_props {
 		struct asoc_simple_dai *cpu_dai;
 		struct asoc_simple_dai *codec_dai;
-		struct snd_soc_dai_link_component *cpus;
-		struct snd_soc_dai_link_component *codecs;
-		struct snd_soc_dai_link_component *platforms;
 		struct asoc_simple_data adata;
 		struct snd_soc_codec_conf *codec_conf;
 		struct prop_nums num;
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 6a3c9e4e1cfe..f94c48aa126c 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -903,7 +903,6 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 	for (i = 0; i < li->link; i++) {
 		if (li->num[i].cpus) {
 			/* Normal CPU */
-			dai_props[i].cpus	=
 			dai_link[i].cpus	= dlcs;
 			dai_props[i].num.cpus	=
 			dai_link[i].num_cpus	= li->num[i].cpus;
@@ -913,7 +912,6 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 			dais += li->num[i].cpus;
 		} else {
 			/* DPCM Be's CPU = dummy */
-			dai_props[i].cpus	=
 			dai_link[i].cpus	= &asoc_dummy_dlc;
 			dai_props[i].num.cpus	=
 			dai_link[i].num_cpus	= 1;
@@ -921,7 +919,6 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 
 		if (li->num[i].codecs) {
 			/* Normal Codec */
-			dai_props[i].codecs	=
 			dai_link[i].codecs	= dlcs;
 			dai_props[i].num.codecs	=
 			dai_link[i].num_codecs	= li->num[i].codecs;
@@ -937,7 +934,6 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 			}
 		} else {
 			/* DPCM Fe's Codec = dummy */
-			dai_props[i].codecs	=
 			dai_link[i].codecs	= &asoc_dummy_dlc;
 			dai_props[i].num.codecs	=
 			dai_link[i].num_codecs	= 1;
@@ -945,7 +941,6 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 
 		if (li->num[i].platforms) {
 			/* Have Platform */
-			dai_props[i].platforms		=
 			dai_link[i].platforms		= dlcs;
 			dai_props[i].num.platforms	=
 			dai_link[i].num_platforms	= li->num[i].platforms;
@@ -953,7 +948,6 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 			dlcs += li->num[i].platforms;
 		} else {
 			/* Doesn't have Platform */
-			dai_props[i].platforms		=
 			dai_link[i].platforms		= NULL;
 			dai_props[i].num.platforms	=
 			dai_link[i].num_platforms	= 0;
-- 
2.25.1

