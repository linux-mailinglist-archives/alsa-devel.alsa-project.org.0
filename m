Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F81598992E
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 04:17:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0BF41903;
	Mon, 30 Sep 2024 04:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0BF41903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727662654;
	bh=G6O3FbFLkZiAkNzy3cz47yXID6ka4yLo1YV64oO7Gw0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=icf+188sKCuU+pTeNYufdKdteWjhhuzk7PH1wqRQfEz24cdxozwAriD7gXaboqQWd
	 jppuBWqnHcmMD2iflk9eboGnAq0m9sLdHD0V8f7gzXq83Tj4LxsPUSgQftEtUXnze2
	 RL3xLrCqOl/Dv8IQ6qSchTHwsmgriiQP1nym+AJo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29C02F8075E; Mon, 30 Sep 2024 04:14:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52883F8074A;
	Mon, 30 Sep 2024 04:14:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63008F805D4; Mon, 30 Sep 2024 04:14:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 991ABF805B4
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 04:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 991ABF805B4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=WQbKI8eL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3XY2v69UuEYegsbntxnTJzjQdb9Kr2r9HWF3gGzraL+QVl8QYkme+GC8Iu4EeeH/FoA4PjWidDhlKXIObpaXZcAqoeQcLCJkmQluGBdcO8bQ8c3x5EKPTU1nu9QMt6lrXmxA2wwpsUkroFVrvK/tyYDMqaFpv2QZl1Asex+cqXevnurxTxsow+/wUB52nCiPv6+5XhgARcrgMKDSgFASJY58YA9+UYlCNajlzs7774t2SP4Vj6ucDSwEtBk+WFlFt3em4+npwHHLP1v14b8qmjEdylZeBnNUwkbjuzP3nOhJucvK+v5FVivaAuIf/enH2mSmpeGNsqI2ToTxCCA5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFI9/tZ+iCX79zEhF0xVSCFczVQqTc/RxNEUXk7rTOM=;
 b=GulOSZQwmbuBVHy1rH9aNiUV2T9XKp+VK+CmrPPb3gHQMLbRi41UerxaxY/eJq3lPk9eVnwgm376+L/RiSJpIjmo22o7oK96aUHgyu6/8090nfd59xVfGlE1Z67NPStVEe9V1ACzhlHbl/Le7AWDOZo648Xz6LyvZ4oJnUNfq5SbozrlArVkqgO6renHHl2kGyKLTERKUl8pHwxw9NkAf/92eRktKDCJHU8IdSAbyLECgb6KMcZuiMY6Du9nndWJjeR+uGG/+SpcMpT6cVes6rcCZplsmvVCT1IK6cBTphadh292H9u81FfSSEHO99YXbt1HB652SHMXLDJosLKsCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFI9/tZ+iCX79zEhF0xVSCFczVQqTc/RxNEUXk7rTOM=;
 b=WQbKI8eLJ1DXH2r33gRyYX8bmzyfTi/x4i1kaVVmuG0ZlfdvJuOYgOgEgJdchXJNhxioxEEe+88ADroLvIfq4j2/WuqBvtLoJ9vPTMN3OhxQ3wRHeatQou+mC9HffKQG401jqIp/4vaF1lHlqX15V9U4a3LdeK7fmWXFwUqpuKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5798.jpnprd01.prod.outlook.com
 (2603:1096:604:c3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 02:14:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 02:14:37 +0000
Message-ID: <87bk05lwfm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 11/13] ASoC: soc-pcm: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 30 Sep 2024 02:14:37 +0000
X-ClientProxiedBy: TY2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:404:f6::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: cf95862e-7fa0-41b3-822c-08dce0f5a23c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9XdgQSXlp2nO59vNWWy9rrkmSa3gS1Ma4pbYtLBPIYOjjBJL0eEiK2SzI4PH?=
 =?us-ascii?Q?3nd1kad77LUnQQ4qu4dKB6Fb7Xp3pst3kwV3i2vIm6K1XiFWch+jDKKhIiR0?=
 =?us-ascii?Q?1ABsZ/ps/SLfP+ESHuyF/4eWMMHsBVH3liTfNJ8rqhs7Wn5qZMQdX99jcxR+?=
 =?us-ascii?Q?IM/1pLBypPyXonqavmjczuno6iVoJHrNpx+F4PHbETk6ZZaE+snRVZFI3Mb3?=
 =?us-ascii?Q?MJxlCjD/6bxrANvHzAttmiNrtlm5E/Nd76RnQPf5yBnq5UIbp8xAXfANID2s?=
 =?us-ascii?Q?nw0kURr+sWYMGs6+2JI6iA8lTVhF/q9aBjIMe+ENYiOhe9M28/2PkdYX96W9?=
 =?us-ascii?Q?Srow2x7tU0vMQjfBN3AWvYunIG0j4hNHm70NquocwnVYNmKvQrK6ksFcC3Y2?=
 =?us-ascii?Q?32CE2QpXG94953Lbwc0Gr4s5EjYK/emz3CMOAfdQbhbVGcPSF2H391vsUYaw?=
 =?us-ascii?Q?rQDMIxtXCHYTfMopwGLBwsqINyDoBm3Q6ctEooYN/ELb1WBaAjsOc6CEoqXY?=
 =?us-ascii?Q?mTPSwZe15KOgCRyjdhnrXCz0f4JW8p5F6Q/A0iU9637isE1wK1Kvkd6Q/a1W?=
 =?us-ascii?Q?NxLdY1DQ4JM5k76LvTAhXVuhp2QfGDn4kfEt8x579rIDbxqjOZfQqWk7ppYs?=
 =?us-ascii?Q?kSagpw4mAT4UxfaYbvPDWV45gNzEKy/Lvslu9WCVXqlV0rez/uIXghmTePB5?=
 =?us-ascii?Q?SFbhfYUgl7BI/qqUxWONsDFzOMzlKiTe3bscy9IiX0yOB4Qz5g8lzMmZOSYS?=
 =?us-ascii?Q?qQUUApxA+LCl8aAI8fQqV0HalDYzDBXmtuX9tU3e612DSkg4jWAhYUcp4eCX?=
 =?us-ascii?Q?H/hy/kqML68ptc0dr2SlOVBJeN7V3hy/McSEhlub8Ok22SzJ9hqXZ3e8aP4A?=
 =?us-ascii?Q?P53RrGPDjyLOvFnkGF0yAkhSFg5CQVSjweAkNn4kQRKr4PX9WKqMIa69ow2x?=
 =?us-ascii?Q?BkTlekWqA8UAqihJZmVbx6brc/fsigLNzaZij8b2V5+/eac1VQ2F80sLlyjl?=
 =?us-ascii?Q?3YEXGu97DK8NM9mF39TXj/4fnI90vVQNhBZAYehLBETKrn76H/sHwc6RqesX?=
 =?us-ascii?Q?BongG+jcx1GVO6jIWIlUCMJ7JZlfF0gcU1ecNcVBk0Cn9IfJ5O3eFKaG2Ply?=
 =?us-ascii?Q?WpOcZ8sEtbEwSpC5CsSHgTtCim69LgiV7E8IEm+ulc7ZXret/VmF/3Y5fd/p?=
 =?us-ascii?Q?uC6S6BdgAO3H7Ksg5PW8cyTa6WdwiCUEe/tZoN1uJsAmOwk6M+iPGeD2JLZR?=
 =?us-ascii?Q?BgA4cMqS2WUEKjreo7LnKT16Uz5eG3l7Qc66fsk1Vq1BruxafGxG+er59tgE?=
 =?us-ascii?Q?PYGEh2YpjHOb/LFZxCjGthIPfyAcR3CZbXB7f1ikz6LuHeDd5O8fXk//colV?=
 =?us-ascii?Q?ugVTDXG1oH5GkGU1l+ZzoRi2jZmaUWC7C5AF6g6mUdE8lcTmmQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jzuTKPEbVSC6MYqwwmoBiGkh9I6tRuIMMFzj9PVtuqwVpj8OXzKty2ZeM8Qm?=
 =?us-ascii?Q?2AMGKvm0E/0py6GX2g6c5nnK8HyJL4jOQxyY1CrskNiIvqiI6gPh+4n0eDfc?=
 =?us-ascii?Q?EDpyZFI5WG/VTKZ+r6FZ+x0MeqfO6MoJQGiTRLQLkAPyRawX28EvdOxvidQK?=
 =?us-ascii?Q?D7OnKXhwZSTN6QknNST55RoAfey5ZXZiA5LjRLQ3XSIOAMyxIg+zVPbIr+a/?=
 =?us-ascii?Q?Xxi5p/34887tVuOTPiUcCjlqWysyZJRUD0rbyniIk80hnKvej48pyRLCO7gZ?=
 =?us-ascii?Q?Z27FlxsHPUg+yigVzb3BfWlvnpSdoyQoLF+SXk30dQ/dDyYLmKpYpeN3C7ZV?=
 =?us-ascii?Q?HAmhfefe00CY+HfoPGY0pN+TJWXV7mEv9zJ9K6ko8wg4EaOyIBhccPkUwMRz?=
 =?us-ascii?Q?mmDplRJtoZYFbP3SYXj1HtlH7YwS/9rRy8VmbC9JSvl/aDHIPHKxdiRMRaOh?=
 =?us-ascii?Q?COSj0jj2bP4i9bNxziFYpfxV+CwwR88e0p6Nww//244bQrTUx6XNca+cUWUY?=
 =?us-ascii?Q?H39D0Qtk3LRLgQYqn3Fc+Vj1lpFEsYR9/xzYaMi23RrkWhWP264NTuHKszQs?=
 =?us-ascii?Q?aZ1tbUBKH2VnUkNbjFxdXLPzKWCkZvHy/JOzAcu2gSk3RJw1MUkQUdcgGP8+?=
 =?us-ascii?Q?FhyTCT1/9XEg0hP0+wsRUcgj1ge0GVuDFQpsZrdDVfGgk3MSzxQ7IyKrOFo1?=
 =?us-ascii?Q?9OA/yITSTCwEU/et9Zm/p1hPFzKojZzTnveRLxf2WW3JduVB6o9znvt6+Dgl?=
 =?us-ascii?Q?EZV/gipvCcrZWdMYrYzXXK/qSuM4Y3/v9VFfB3OXEo4NA7UrZ3wmxIxgw8LQ?=
 =?us-ascii?Q?5k8bBYuo8Q1Nn4FgBYiM55PWIotgSnazIMOIItAkj/59R6KvxCbGeUMvtqUV?=
 =?us-ascii?Q?yt92jxxoiBB4XR/niRO6UYgg2XAlwPMPO2Q6Hq1Ua3FGn+ZNWxjLwxXmRnb3?=
 =?us-ascii?Q?SMUSICHUIU3WpmDTYFkUcHZHfe4+X5qsnCFuaZVNWcw3pLYqAjUXYMxpDTgI?=
 =?us-ascii?Q?gUZ3N6QcfA0H0osp/8Im9ULe63+wfwMehCkqeJGdsuPFYauHJCHx04h8Lrz7?=
 =?us-ascii?Q?cst1eBgefbCG8iAu4cdggx/X7cN5qGtea3f1P74rUe0TaxKMDYQX1+7Ierf/?=
 =?us-ascii?Q?ubwlM9QyfYG1hSPxQeOBsWuFaYQXbeymr9xonSeINvxj3XQw2RMmwfxh9EHt?=
 =?us-ascii?Q?7eo27TVoHN0zqd+TvUYOvn4lYtE8l29EJZnEQ3hralOggqgaiN5dD1Sas71H?=
 =?us-ascii?Q?dAsT7qhkPUXEzJw3ca7E45q3YoUKho+fCavs2y1QGtmuUu5YYmJuKKMq+hhr?=
 =?us-ascii?Q?wED9v/feO7QTc6Q1bU6ZmBuRd0T/lQhT1NQfsH2G0Nrt/FWPk2Ru38gThs27?=
 =?us-ascii?Q?0CbHo77jxjMVaGQAppjXYHj8I5B7tCRgpc43gK2C6ByXewZkpsUQpHfyxy67?=
 =?us-ascii?Q?zCyaqk9SzaXH1ZMxWlgE6SzK1Xyx/nt1/A7eewBobJLGjics7lAOzfA5qgV4?=
 =?us-ascii?Q?Bt0Q4fyPyNeVafwogeB83RbJM8NMsETl2/ZgQF9mLW/zUMDuz5myvL9NOZ3m?=
 =?us-ascii?Q?nPaJxMWskbpV0B3bVKTpw9TobuNhzwQRWU4+Q6LD7fP1Gl/rn2s/a770ebqT?=
 =?us-ascii?Q?Et6keaWNHM8ZQOABh0CSHPA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cf95862e-7fa0-41b3-822c-08dce0f5a23c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 02:14:37.6864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8IaAwojD1fmqLCLqIu5qn9dmBZ0Ts0wq+opzZJ5DRm1vFmivxw5PAEJr93bfk/GDl1yeVFu/em9T19uMw8xUH+eDsU1ep9eniaXZZjEuuuHbJP4JaGPx3HJcdfvQ7Ab4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5798
Message-ID-Hash: UHKWTGBSCAEHVNRSZXRHEE6WN2BOR6QX
X-Message-ID-Hash: UHKWTGBSCAEHVNRSZXRHEE6WN2BOR6QX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UHKWTGBSCAEHVNRSZXRHEE6WN2BOR6QX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h |  5 -----
 sound/soc/soc-pcm.c | 33 ---------------------------------
 2 files changed, 38 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index e6e359c1a2ac4..123a0140a23cf 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -815,11 +815,6 @@ struct snd_soc_dai_link {
 	/* This DAI link can route to other DAI links at runtime (Frontend)*/
 	unsigned int dynamic:1;
 
-	/* REMOVE ME */
-	/* DPCM capture and Playback support */
-	unsigned int dpcm_capture:1;
-	unsigned int dpcm_playback:1;
-
 	/* DPCM used FE & BE merged format */
 	unsigned int dpcm_merged_format:1;
 	/* DPCM used FE & BE merged channel */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 7a59121fc323c..27810f6f86302 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2860,39 +2860,6 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				has_capture = 1;
 		}
 
-		/*
-		 * REMOVE ME
-		 *
-		 * dpcm_xxx flag will be removed soon, Indicates warning if dpcm_xxx flag was used
-		 * as availability limitation
-		 */
-		if (has_playback && has_capture) {
-			if ( dai_link->dpcm_playback &&
-			    !dai_link->dpcm_capture  &&
-			    !dai_link->playback_only) {
-				dev_warn(rtd->card->dev,
-					 "both playback/capture are available,"
-					 " but not using playback_only flag (%s)\n",
-					 dai_link->stream_name);
-				dev_warn(rtd->card->dev,
-					 "dpcm_playback/capture are no longer needed,"
-					 " please use playback/capture_only instead\n");
-				has_capture = 0;
-			}
-
-			if (!dai_link->dpcm_playback &&
-			     dai_link->dpcm_capture  &&
-			    !dai_link->capture_only) {
-				dev_warn(rtd->card->dev,
-					 "both playback/capture are available,"
-					 " but not using capture_only flag (%s)\n",
-					 dai_link->stream_name);
-				dev_warn(rtd->card->dev,
-					 "dpcm_playback/capture are no longer needed,"
-					 " please use playback/capture_only instead\n");
-				has_playback = 0;
-			}
-		}
 	} else {
 		struct snd_soc_dai *codec_dai;
 
-- 
2.43.0

