Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EB16917E8
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 06:14:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C38183D;
	Fri, 10 Feb 2023 06:14:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C38183D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676006095;
	bh=gUEDwkh4GZI4qizDXgUU/XPuXWrABqftBlqhiDxLf7c=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IIDYSpom7lejYE2AtUx+T7PK2Kgl221tEnMCMbmnqMKBevz7Pxr7w8yGXjFA2wFTi
	 d0o7pVM3hyTODLrtZ5c0X8tEw6K5VH8HeelcIARcfk5iHibkhlgEgj/NHdvRLR5yK3
	 cDecHtC+SeCoEsEC/sw/BAITUxjMouKMXKV2CbW4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41A97F800B8;
	Fri, 10 Feb 2023 06:14:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D4B3F800E4; Fri, 10 Feb 2023 06:13:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2071e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::71e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A78DF80086
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 06:13:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A78DF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=StSMY/Ys
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnhI5Q1lEWXQQgNDTJfA0e9r/DcdQQYFGg0J8L74GXqqrmE37qJGH+SMve0ylK/vJk1hxalggn9uDrd+Gjers9Rn/OhLDlo6mOmyLQsBDn2isW57RIfPb8y3X/4R4ZtsRAHd83E5MnyDRlJvMQfllKIt8M0HHkuL2ZgYni1aEY5+n01DCGmqB4VACaBblwmUB+vnkqeAEEZ01xNUM8PX6s0tvY1guKQRUiH2xaHjGf834tNvMDu65uJz4egriI0clyRd4buBzIdm8/HuckqjGdq+JHkV5HMnQYpXh1ou8s8Cf5aYCqvqMfZzOx2X0n3wdpYU3XCso+T3IsP4Sdw6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmC8wQgIHOfdL1rwnUInkrjz66IjKZkXqsVy7ykVkWw=;
 b=io+Bt0eKWEkP0kPoQX2JjorIC0Hj8RDceR0BB/9Ljex91XKbwRHNvEUyXT/NaD3PpfWIgQE6vNYLUow6lplk2tLYsntUMnpIidAxEu5KVgVwARw8UFxCYxsT0fup4VpG6ilSSMZ1qte/An5H8ZVHz1rtDKlnd9Oz4rPWQPich1tqHLKGcDuCuuW4E6MTDfhsg3Syepgqoui3yS9fp0Sy0KeLgrso8cMK6dn4FJ3pS+I7M55edyi1oU7hI3gTzjePwGnCM00BEwa98ha6VEbaXVZ2Iq7xe9RxTEqLb2/tJPf7o7T5D2D5pM27pVvbJZGWXylfTivyb6z+WRwkiOcsAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmC8wQgIHOfdL1rwnUInkrjz66IjKZkXqsVy7ykVkWw=;
 b=StSMY/YsbC8i27XALlujRaLV5Vt97hyVeSjH0Q3jrA6jQjMz3AVooDt4MYhaByCax0I7pr6IXK8kJiB9qjxc9GLnkVHcB3ztvb4f21jFPGMb8Hw/PdImbsXGvBRWGiRqYQg16Oy/T/spxPZnjNLHt2pmH0eQbeap+Cn1H/KVAMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9814.jpnprd01.prod.outlook.com (2603:1096:400:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.20; Fri, 10 Feb
 2023 05:13:43 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%9]) with mapi id 15.20.6086.019; Fri, 10 Feb 2023
 05:13:43 +0000
Message-ID: <87lel6ksqn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: rsnd: core.c: indicate warning if strange TDM width was
 set
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 10 Feb 2023 05:13:43 +0000
X-ClientProxiedBy: TYCPR01CA0138.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9814:EE_
X-MS-Office365-Filtering-Correlation-Id: 39bdccb0-e734-4126-226f-08db0b259443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BzatZuLiqn4GzcatDBzM2tsFpz04ODMK/WrZc/vIPbTk+4dTFC9G/XUzmg17kENMIry/xE7msDDPjuDbYmZKqZgLrz7ZFhITse3p6cwELDwjcmZ+Ojv88MMdetl3fq4eWxFaBSj7h6/+GHYfue3qWk5F5SWmygShQtbdD1IXjWwYG6di1zoshoO7P32yDOJPx669njDn6aIgw1/J2dxav2Fsum/WlqRLpdEravLcBwBBXgi0oEUUByX59YSgwPTK4dhQhCnQcsNhh+2TjQbmoSkGtGyxubtnb3xJobrURiXFPWMuyzdq48BuJH53/EZyMQJ6hj1Mwfd5MBLSAatMvc70ptQmj685f4cWTH90qXWXIv9m4eYmLJ79vfyWzf13dGimeLLcSqGUu2IZFOUBGqKJsjSj8GVSgxDh6+3MWw7zUkbCLgcqTMBnYakWIfx8EiGzQb1iSiM5qXeoAL5KL65abaSUF4WCaG5+Z0hiABLQkvTyPJiy9Zcpb6GQ7KRRPcShVcbfXhDCnSDAJS9YZaC7i2sYVDPs6nIHLlo3wrZGl0OKLAFh5/0rPs0KwEkYEW/PZ4d0n3WIdJsPZWYqKMOcVrLxb6/K0bE28uSt+e0Qn/SXHpVVx5sW5EQ1oRcItkeoK3MPOOHnsptcuNKRiy48y6OwoTvGvEF4eNsCm/dhjHnNSPnkPDYkV/P25a2Q0e8hpVQ97zopYkO0SX/aCg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199018)(38100700002)(38350700002)(83380400001)(36756003)(86362001)(4744005)(4326008)(2906002)(66556008)(66476007)(8676002)(66946007)(6916009)(8936002)(41300700001)(5660300002)(6506007)(186003)(26005)(6512007)(2616005)(316002)(478600001)(52116002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U6tGscYXsvprOVSlLJioUgLgJqIXtS2hAEpq3kobAfmoq7GAsBzD2ULCHCv1?=
 =?us-ascii?Q?pXaVYLqjmd7M3VAHYS/UnoqyM+l2GGyUCQdHolrEWfwEPcpkIuF6ioeqnaSd?=
 =?us-ascii?Q?Itm/9CaLKLQrd+0WiMXn/wLttS5I8aOqAJcf7N81vtlofsPM5iZggifhV8P7?=
 =?us-ascii?Q?4i+0hvLh6fmHxtAqJupxZ/QFGFXI1VHtgiLBmYv9re7PMfJjyLW6ZE5txEVT?=
 =?us-ascii?Q?xHZHore8uOVUB2Xp73l1oz3NO/dCwVgG2Sud8nEOQQ1/STGMoNDWAwOcly6J?=
 =?us-ascii?Q?O/qkVIJAS28JSgFvONEyMWQG9TOKuwVXXuJbRzy1uw7ItjJ0gPJ2HAdsZL1c?=
 =?us-ascii?Q?7oRQwkH2Zo2zoajZOqapiG4l9vJvrnB29u4wEoHe7/w1QiFXzz64+Z5d556L?=
 =?us-ascii?Q?aqXAJMIyjKVf1m9+nIyBCqCBHOX1udHtLVL19M5lc40FzQYxJkt7WyzU3O6S?=
 =?us-ascii?Q?QVRCqGxHK5UpoimN0rVQk9jYAj4X9rzFbqzaWhxFkmtt0P+sCr2HSj9dyWX1?=
 =?us-ascii?Q?gO+UzIL3/gC09m63wGmHdnum2Lz5rWoglbhNer7gy9zr8ob3+C4Kxpn8OkyA?=
 =?us-ascii?Q?1L0uBv5gl9bSLzCLZxPUVE4PO6vr42mMBCdFz5jg73r5JIwHrTHm0xDgAZ1O?=
 =?us-ascii?Q?8DlB+2d6Kx7RpgfH01Bw8vubHPbHaoTaFOs7XvA3EnSo5Vpyb0EdVlDC3yTD?=
 =?us-ascii?Q?AaPiSqsGmHROvKaSSlEATPbNt5KDTUhPVXZ8ZInGOqJbX8c9zyuQgmGw5Leu?=
 =?us-ascii?Q?EG2x94Ow8EGflxInq9SO/zHd1rYYA72QhyPXEQbG6XfjtyrqhgDo98GguHaW?=
 =?us-ascii?Q?IEQ1C6z2CmuHtcfJcCq2rqS0m3cgxSI1oyTqcGjnjn1aM2dlQIh292iGKzRR?=
 =?us-ascii?Q?cYK4zDELpVeNAzs7KBBAxEdaRlla6IZVBV0VIX652Zmz23lysExZR4GpX8xq?=
 =?us-ascii?Q?5VC82uDY/qXXqkBbiRyjbqIsI5zngUptns6AfOQkY7e5ngLeOMwfAl7BCxjK?=
 =?us-ascii?Q?NMSho6kALhkSpwQPdfiX992jkUNjkQlhZY7Kt1z5WKx04/PKoA0Dht/lsJdJ?=
 =?us-ascii?Q?IA4bAMA+IOgPMy/trdoD9ZhZ2b49Qi6QTQJG3hGbHTRe+O9cZtAdUobxjR0G?=
 =?us-ascii?Q?hdKqR44XXcFdBK+vKmCTxgnkMK52PSQf0yy+ZyUhSCUcmow137OS7VQkTIxt?=
 =?us-ascii?Q?QWMaP54rcLVJL5PrSabPWGaEhFCiucjWoOTd3ReeUhX/fKk2G0c+dFOwx2U2?=
 =?us-ascii?Q?vdLvD8ID2CMUByDmzSENxB5X8RjxgnxqkiEwQ0kiLC4MKdmiL0vsOh5whs9O?=
 =?us-ascii?Q?ErGHIjJV0vU2h9GfoV37/EwCP7GV4epGEyTlalzhj0c0XwFr3gESAscKG6L7?=
 =?us-ascii?Q?h9NSkNqtD+xjr6KdyS1fXVhM9BugPJwJQLoigg70HdoHhKiGfFf9d4t7YhJ9?=
 =?us-ascii?Q?K7qOOSlA3FDXalfP7U2PJpQaiqvqzJqSMDQtEjZ97e/A39Tm231NQX7MX2Vf?=
 =?us-ascii?Q?Vj3rd9P4Iub/BN2PSdmFSubGVxiIgOIIPFmIQ0lGTy4aqm4VuXnUpFSgYeSC?=
 =?us-ascii?Q?S+mkyWU9e5actFc++uFQt8k3wRzjdcAMd3/4geZHOheaupH6g2D6mNzsAUGI?=
 =?us-ascii?Q?LuNCs/bfuvDUGcz91rrn54s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 39bdccb0-e734-4126-226f-08db0b259443
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 05:13:43.3117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3x3zDuCgPBHGIlvC+CgR66TKIIm0MFLAnPrRssgJ7fbPf/GM9nOLF1dcvDAkAG/Hg4ngzTMBMTO3YF1fMTp8NxsLq7K5uoAzBgOGGkiByqMdj3fHfHsM1RmfBoDst2RT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9814
Message-ID-Hash: 3WX3W4VS3VXWJ3UAJO47KHWXDPSQXFAZ
X-Message-ID-Hash: 3WX3W4VS3VXWJ3UAJO47KHWXDPSQXFAZ
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3WX3W4VS3VXWJ3UAJO47KHWXDPSQXFAZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current rsnd silently uses default TDM width if it was strange
settings. It is difficult to notice about it.
This patch indicates warning for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index a9125c1ff75a..cb17f7d0cf0c 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -828,6 +828,13 @@ static int rsnd_soc_set_dai_tdm_slot(struct snd_soc_dai *dai,
 		break;
 	default:
 		/* use default */
+		/*
+		 * Indicate warning if DT has "dai-tdm-slot-width"
+		 * but the value was not expected.
+		 */
+		if (slot_width)
+			dev_warn(dev, "unsupported TDM slot width (%d), force to use default 32\n",
+				 slot_width);
 		slot_width = 32;
 	}
 
-- 
2.25.1

