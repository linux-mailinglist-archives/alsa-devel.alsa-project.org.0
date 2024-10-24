Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F159AD94E
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2024 03:31:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3CDCDF6;
	Thu, 24 Oct 2024 03:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3CDCDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729733489;
	bh=0EfI8lpJ/d1M7ToPiGlP4XTTVvuqHz8mMijjv717JiU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XSODyRusQaQQp6wrvVb+OEBhGqNIInKz7YCDwQ4i1Re94Awdx38q2jivqYpbRseQU
	 Kat+x0LnIMhxCvYHdYnpoYuJWNrA3N8noomD0UHy0Z+rEaRvn3+dz25Iw/6RDnffxK
	 B7quBfdyq8eFCbQk3JZIqZvra9tWEhM/Zu9PYiUs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE1E3F80624; Thu, 24 Oct 2024 03:30:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19FCAF80637;
	Thu, 24 Oct 2024 03:30:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBFB4F8060A; Thu, 24 Oct 2024 03:29:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D307F805EF
	for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2024 03:29:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D307F805EF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=aE6gxYyJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6sneuqSrE+V0dSuSItrWKiGz0FPY+n01bTwQxmm2cRw4gpGWD6mgDpCHxm2t/ZVglVOpVK2NRDZy4lAxbxyHIFpcykP+X9q2l9r8FX+kxTkwQg/096qYk01M8yvru2VzadJVBUL5WoZ76C8LuIVtpiOKM8T8OtX+eSZa1tD3dvMKsR8aaAWzWl5gW1J+x2g9kLCdWakWLJH4iZOo+qj2Hl/Oru+8dhrhGKSGdspc8pRqtbBz2pW6oSotYdAuq9NTVoALUpfDVLsD2vvlcueODyvaCZ6vqmbxj6K1GBNzPbDnAhvf6PX0lGWN7oiDUX6ZEhksTP7wEYanc5BmfpVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbrvkCgaVVaTFZlSwfig2zrTR3k5ccQFevSTjedpV6c=;
 b=vxiq4Lwue6BJetPnnvjpdEmKCFPKghvj1BE50q2MI2vwkgwDcaG2rj+0j9r1IKiDph9AhX0SGgKmHtMhlunPDDxIwhutUXhEl60Ze2LXZ9nHeHLfA2nJDjFkCJzsNzXkrKUpkuGHhjW3gwpsPiq8datxO38fiEt0gvilAdA3IrSrQEwBivqbBit+KrEL7VoKc6T5suTQdhjryG6ORGmKYx71PdD08Zu2gzJUlSUglvRZrHS4lKNNTsQu6dk2o9ph2qT3RG4/2rrPHQZcMGQ+i57bEVP4ZvpAVmbuedYi+Ps6dgD16X2SRs4Fn5jc/mC+/xdH1VW49hlXZXF5SAVNaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbrvkCgaVVaTFZlSwfig2zrTR3k5ccQFevSTjedpV6c=;
 b=aE6gxYyJN1fh7TJ+i+J8pbWoruTfYNRLbt920X5JItrwQNVrCX0hn7eMq2h0kHq5F9Emr6k/GqwI5IvAnNPPUjUlrxYSHBkB7ervqzdYKWiz/oCzH0g/pwowNmx4xoaclCVDmQOfQWovwlZc/WV2BMWnInquC3J3lF2buosrX4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB12111.jpnprd01.prod.outlook.com
 (2603:1096:400:43d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 01:29:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 01:29:46 +0000
Message-ID: <87sesmb852.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH 6/8] ASoC: remove rtd->num
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 24 Oct 2024 01:29:45 +0000
X-ClientProxiedBy: TYCP301CA0031.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB12111:EE_
X-MS-Office365-Filtering-Correlation-Id: c66f9607-00db-4866-3e79-08dcf3cb580f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?T7eV/pYUjFgbBCZ+TFD0P4FJzI4JmVzKzOwysqXU0DlLeuT5zFEtJB7geaze?=
 =?us-ascii?Q?zmc24G80Z2B8awHj7KVMkd/3piYpk8ClKf9EKsROfOrpgzD4x8MxCF0pQYWR?=
 =?us-ascii?Q?j4j1G8RrWQjIPE4aF7jn10o/QEl/eN6K7wukp9u/0waIILwoWs+Rd0+NlvKV?=
 =?us-ascii?Q?529C4mScRKyZYB04CrjoOXRMp6wcqydCG0RsWNUlLb4WgyWkRxF7YsUCNB8T?=
 =?us-ascii?Q?o1om/WjX1+wyIMjjtl/OuF4RzwNVoipUm34JW5yMo5V8xWDPieAWY+hOaj3X?=
 =?us-ascii?Q?Axo8Xae+pkmfQl7qtkqvK+0qWNHV7hOrfeNyoLtk3TMqU/D4TBXFTpfJNQSe?=
 =?us-ascii?Q?xEy3h5ExN7sXKPZV8gedRDpNJaHwMh1CcJLzQ06+mU+XX9639ybjsrO5S/Af?=
 =?us-ascii?Q?iMkH8KCVN5KPzoUU+278DyRxK2bkJDSE/HM54JHas+jPM3vQfyq7OCknSYQ8?=
 =?us-ascii?Q?5EQEwhEt3sjEmXTvmctTL2LNtvPTfPPmkZlO1mAQooGZzIj6JhPluf6LNiIN?=
 =?us-ascii?Q?6V7IPD5R0BcUqc1WzHSKjYZcS55Gi6JAUQ9DgYH6nHIzSIvRs2EMiyFD2L09?=
 =?us-ascii?Q?EASGC7sEUvy2hi8EeDidCOzgvggUAenJ3HA44DLpRUaJaYl219JbkKbE3s5S?=
 =?us-ascii?Q?1hS28PRPE6FwYebfLXyVRw2I+wJKWjyJMM7FyI2MC+B3ls72VPP5zyTSCUaK?=
 =?us-ascii?Q?4vUmDxabdE3vgVahC7yi+VoErmbBHTh1ArkF67kOE7Qt5avvm3uhHLL00pBt?=
 =?us-ascii?Q?kjL1QTyVa1+gCuU/CPSq1Ik2ZxYlYMkCjMEYTcPnuE2wwzGAHeCzLeGjNj6e?=
 =?us-ascii?Q?f/I1NvTyHL+op5TL2c+s9htjgH/qGgmSxuABO7SFCxvwxU9jUNSimhD7K/ya?=
 =?us-ascii?Q?bw6WiwtdMzoC9WxQmrpVj1wF4ARZgrvg1oV9s7gVu294cJUJFCTP4AhN39UP?=
 =?us-ascii?Q?efyrVeC5HAa6IAL8iVP0k5tsE/gn4Sdsdlj7LJYC0aqigKZOyMLY5vyNW/A+?=
 =?us-ascii?Q?oTSaWh4+dfrk5ZKhlpB7m9kKfapxNYwuCV45wXmJQkbPw6AazFRLhuakTgSn?=
 =?us-ascii?Q?LeHUBYYyK58QNzsEBcvCNBltPadnCGbZm7I8ipvsFaO+mw0oD9dDmMXkV3Iy?=
 =?us-ascii?Q?J60fEyGqHnLndo03gygQHEV7HDS6x801UbhEcociHtMg90Pf5ewSCaN73DSt?=
 =?us-ascii?Q?9axMIATVOmkPcQli5Q/Wa/l0n1mwCvgX5GYAkwIZYJcXSp5vukZxAAsxb+Vg?=
 =?us-ascii?Q?2YexmAxdD/4eRcs4BvpEByC+fZ/4TuCn9IlomvDH1StMLtv2Rih+foLd60n4?=
 =?us-ascii?Q?EbbLBXWFAdevIglfH4fZQbfSxpMoNDEE7skLuggCGiE5aIMtSEhMoRkfwjrv?=
 =?us-ascii?Q?KOKZFsYKRAP46wXluVq6hTvgurSn?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HHu6H28XtGocd5cp3iMAioggVghl5voa2HQBFshYyhmczz1kJIGw3XdQY2jq?=
 =?us-ascii?Q?Z4qm5z5NLigkEfkc8YBWSjM+yPb+OqjjCglOriQP9bbfb9O8SJHoL2n4r2wc?=
 =?us-ascii?Q?hSW9SeC6sCs4WlXMFHk8jf4a8ur3IdgU11QjaT+NdVs1/ilR4psHQZIl/9rv?=
 =?us-ascii?Q?ZdzsrS0n6kmp9bqj2cCRrP+n1AoOO+551tpgeD91M4YjNMPsFxE5v8H0TKsV?=
 =?us-ascii?Q?vV1TCUczTJUFOFfMDXNL9bMybty68JyQ39mHBpXNiKFam6gKDX4zhrED72cD?=
 =?us-ascii?Q?eElYb7iuukY54RjhbJKxzFRGLwKzF80b5eRTr8G3yp202ZO5jSZRBbG68NCW?=
 =?us-ascii?Q?fZt0xmV3MD97Jd8oR/6sXKxJzhXaVNTqnK5bDzT4Qsg4EugH1Kf2kfuTl+HZ?=
 =?us-ascii?Q?kmq2O3ZpJq0VU3U0vx1nrPXuWWRr2XLx1VZ82sLnXirlDfTWNV2W0GI76Suk?=
 =?us-ascii?Q?cFfMjadEFtvwA1Ibc2KixXwT0wqW02g0DpH2pULiUpzG5MDpAmmwlATP39vh?=
 =?us-ascii?Q?ymR7oxJv5Kb+e2UUAzhwhtDJyf/oV8LSibS45qskEeTKRUhhwUViDGOKnF5h?=
 =?us-ascii?Q?xIR/X/022MKwXtx40084LzijgVSaadjbvt1QJ7gHJjKXk/xbPyZtTnBkI7Vt?=
 =?us-ascii?Q?tZ9E23AO49HNEomhJeXvtY6osrLZznK20g1rWwKF3yv1qgtGYDhGwZts4A7H?=
 =?us-ascii?Q?soR/lbFMsAFDRyLdVni50NzcvwVWnv2KbMN/GzdSvG0B6bb0JeR7zqsPby8F?=
 =?us-ascii?Q?6Dey3niGUkr4tOT2Bcr81Gdlz5hmaAMcIVI9RzxPuekD81OCQm5oyKEyGWmv?=
 =?us-ascii?Q?BbrqyCXrnf1Z6uyGZCPBjcIdMFhQtvCmkWX9Iug0Iyc9+ul4+8fDLlBSeUGY?=
 =?us-ascii?Q?y6X+/1CC5S0jVL1mcGPRM+98mGpgf8QTv3AtFi3a7uQqGCA+zSYJpqr9+hZC?=
 =?us-ascii?Q?C/ehc/hIvj8hYRHpddZDjgBEEqLHakMRrHHPyz5oWt/+YgXSlsRwdIfqW/m4?=
 =?us-ascii?Q?D6wBC0qC0wQF35yQ2SufdW2KFzIL5TI7EjIe42ks/aX2XOkNhIofhAVpwYEu?=
 =?us-ascii?Q?kIHxT47iyxdyGaEtNkD6Cair6JWf+Pl0TI3xn2IS70P6u7X/Vk3tQper8QRs?=
 =?us-ascii?Q?4uF1Poc+IxP6YjF2eOah7pkKiUw9hW6kLlngjy7xc62W8hGk1TBi8gyK4u9r?=
 =?us-ascii?Q?IGFBxft5obO7wLIT6q7+2q+wiskklcomc8iVntlW5N2MEMpIZn+D8sOduTZN?=
 =?us-ascii?Q?R2eIFATFGazcsYuTLV1CZrQ4R/QtbK3BYgoiqWIcEvFEjnNJE9K1tJ6RZ08s?=
 =?us-ascii?Q?Zn74hB2XmYIY2UAlitZCtpvppJnNpImTf20PuHHAJVJcAPBtdQw+i8KL+Nx5?=
 =?us-ascii?Q?KkyOoJQPPJaxIx7fcCX9WHGQQN8Ltq0ZOUdCqV5jP+usBFzHxY+bJm8apHBV?=
 =?us-ascii?Q?L/HdaaHU6pqX9OILmJ65u72OL5G7BhAW4NPhpn/+W4BSt6DAQWYgXeoNbBr2?=
 =?us-ascii?Q?sReu4z0WYkrkQ1goG8GoWtv827ZYU1iyEHMq41KwOLUyUVkfKr+EHSLF1jNl?=
 =?us-ascii?Q?uxiC0rk7cTrKk36NBNY5D5wAFuSvQwNFc+2Gunro4yOwUrZyPpZGvCzEK9qP?=
 =?us-ascii?Q?LDyDSeic+mMsjch8sLu3A/g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c66f9607-00db-4866-3e79-08dcf3cb580f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 01:29:46.2684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5xXGUzxlLi+GTMZM7LeCXwt72pERjqZNOgayl/h7FH0TBq7Ui1YNnI7CaW04gXUDASj/P+dpSHo+e1yzlM+pzfBz2SJ4Vr4WXJ+DEPEvWLaADmQ5pySaRdjgOe0hz7gS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12111
Message-ID-Hash: XHZMIPXY3YCLHYCFNU5HDQQ5J3ZFC4T2
X-Message-ID-Hash: XHZMIPXY3YCLHYCFNU5HDQQ5J3ZFC4T2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XHZMIPXY3YCLHYCFNU5HDQQ5J3ZFC4T2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

No one is using rtd->num. Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  | 1 -
 sound/soc/soc-core.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 9acd3fbf7c7e1..828ab19258f0a 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1195,7 +1195,6 @@ struct snd_soc_pcm_runtime {
 	struct dentry *debugfs_dpcm_root;
 #endif
 
-	unsigned int num; /* REMOVE ME */
 	unsigned int id; /* 0-based and monotonic increasing */
 	struct list_head list; /* rtd list of the soc card */
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3cb7482791669..233c91e60f0cb 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -559,7 +559,6 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	rtd->card	= card;
 	rtd->dai_link	= dai_link;
 	rtd->id		= card->num_rtd++;
-	rtd->num	= rtd->id;			/* REMOVE ME */
 	rtd->pmdown_time = pmdown_time;			/* default power off timeout */
 
 	/* see for_each_card_rtds */
-- 
2.43.0

