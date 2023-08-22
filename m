Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31708784D7D
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 01:53:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C06491;
	Wed, 23 Aug 2023 01:52:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C06491
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692748383;
	bh=XST5bEp+m0XqHFlCtIbtYKdnXSlzuxf1qul8hBMAhfc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hhFmqUXQge5wxYaGSZkQj2tXfDfR26QRrNzEUS7X/eKFFDLCRhzB9w2l9TSDMkAVd
	 eBdubw4PonUhvAzMFqO6GOlny94RngoYh/Go0YqOEkCIHe+VvVy2ujdv/KygFcs/Ck
	 QyoY8BAmB/6TPzSIv2GMJ7C6oXqBq0K2GOVF5Ug0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B822F805AD; Wed, 23 Aug 2023 01:51:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44C67F80589;
	Wed, 23 Aug 2023 01:51:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05A78F8058C; Wed, 23 Aug 2023 01:51:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20704.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::704])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B268F8057C
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 01:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B268F8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=klTWv2wY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOWKY5nNSNFV4FUk13wUmn+aBWso1Ys5dmZy1vIG0Ot4FjrVjbNoO9HGK+Fkv3gYnW6VbdICRDYv2yPM4CJDa5GZHn+q3zBUj58hAvJ5Zab11pBsWNh1+zUUb3uR/RINCtydtNrCqYxZSbwRncOnbbEjPHJ5ErZPzi9VQ6vkpPtGzHMvNLt7L2fG+VwPZTEgSu+JR96EC2JU4XFX7AgCRxdHkAW+Ydkhw6utG/RT8rQJIk15tpo6R7Sk7VqYMMv/ukSdOYfdnEEGFAZHZmSCuJXhMXcwZReOkXeTBpIb9kghGToQl/PY5qxG6LoTySS0qvIu8AH6O7V0aUnj/12sng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXAA+9iT5r8vuBlVI+pqS2xhNxwcMO7gpQRfBMTKkB0=;
 b=EUltv7NbA0GSQq1QSfE9F6IQ8vUYr8s+YG/6CApPeK6T2h5EQ7za5v85dLfyyw9KYkx8ee+UBcL0HeYVn8U2HyxMGlBQja3qFdwFWBCk039SDY3/U0oOKCN7/kPS9uF7ERg1qG5RH+uGL+DCdFxWMeEyoBYgw2zHzdoc5Cb+5U+ra5nQbiiPA44hMKji7fxRu0zfBIth/PzI5zWbgdIJvApoKlMmQ4jqZaVvJffN0kBkrLKTds40iwHna4fOUcZu4FtP8O5nTYgVeujE2XoUpE0KrpcnPfVOQpT53w3B6Fqh+KpILXxHC3tqVYP67KSZ8628qzKY+edeBbsNRhis1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXAA+9iT5r8vuBlVI+pqS2xhNxwcMO7gpQRfBMTKkB0=;
 b=klTWv2wY1w+jx+bd2JkafEgIsib4sTOLiXdieSvT5yOlbhxbJvUE2+PtONCbnAbjQVALorP82bWXPRdRY7rzWI/1frs26qQgH50Qu3T3RdVYwctDVTQxNbCNQSgM+gtwL8QK2XRdXpHIjOZ1L+YH2p38SAp1b1Nq+dmkQPyM+Ts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TY3PR01MB11948.jpnprd01.prod.outlook.com (2603:1096:400:405::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 23:50:54 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::7b2c:6f3a:1aa:79d3]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::7b2c:6f3a:1aa:79d3%4]) with mapi id 15.20.6699.025; Tue, 22 Aug 2023
 23:50:54 +0000
Message-ID: <87il96zlep.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/5] ASoC: rsnd: remove default division of clock out
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Adnan Ali <adnan.ali@bp.renesas.com>,
 Vincenzo De Michele <vincenzo.michele@davinci.de>,
 Patrick Keil <patrick.keil@conti-engineering.com>
In-Reply-To: <87o7iyzlfy.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7iyzlfy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 22 Aug 2023 23:50:54 +0000
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TY3PR01MB11948:EE_
X-MS-Office365-Filtering-Correlation-Id: 2adaeee4-9691-47e8-4de7-08dba36a9fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	je39TDpNm2OIfWqI8CD+aSRUDnJLugV96too5AjGouy6vGoOK+obgYHWI++6PJgCSMAJDjAIMc/4wTmEcohPZCI6Oe0n/AMbQKUrA9hRl+XnIHagUt9UKUTHmfRfRuQAF0HLZxOzxiDQUB+cM5eL/ZyT8GJ9AULwfm+QnFyaTW6qtXsLircbR1KAJDFZFBAbkokcBT9Mky22odNyzLAUADpOCSAdTmdoi/rlQPaxjgRPpsqqvMC+fzj9QICVtRDy8z2p5axFmwoTIbGI7RMAs7roTFNtGQAjM/HL3EQ1f9l1cWfNIFwsngK09fl0+6KNEvUb/7SGNiHhZQXENVLzw8czrFHEE/L9aOckT5/hY94J5dZ/hHBMtIH8M7b3q2QKFjGfK7x0xQzBEZt+P+4IJxZSw62mljXQe1Pqrfg+tT2iwo0XkuYBmILZrdpF9CVqgl+Tx7QxqV0sEFB6VspnNiy5aB22Qe/UMAIW9TGphLQgT6ePykaRP6QBd/ne7NhJti5SkwPINIOTOFTaEzlUebgh4Fw1cPX3anxBPlD2g+fLzX6lFMAshly6ODOqFXOb2Eb9xwRDTYQNw2Sc5gAvqqFhhLnETZaf3JpYHztMP3urh0x6igNrxUBe1WVZixdJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(366004)(396003)(376002)(1800799009)(451199024)(186009)(41300700001)(66946007)(52116002)(54906003)(6506007)(66476007)(6916009)(316002)(66556008)(6486002)(4326008)(38350700002)(38100700002)(2906002)(26005)(8936002)(8676002)(2616005)(6512007)(5660300002)(83380400001)(86362001)(36756003)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2LQdCKcl+5WE0P/2Zw7REg+XbbpkzUyIpu7uNHj/dHqTipsvC5rzuLhD3P46?=
 =?us-ascii?Q?sBQYbhp5NR7VA4KBSrTw4LkRzubtLPmfziTWdz10bAuG3RJU317IMNDIJJVB?=
 =?us-ascii?Q?WnvL1J8o0hpQL9pSWriLHcMwicfNZc7cqVV+BdDBZGqWRAfWYURuhXVFnH1N?=
 =?us-ascii?Q?C9aGc/fkOfh8GYzvf7kzfO/487p/oEbBWZQiEx0wxZ9Hty9ZSrLH06lGcMDs?=
 =?us-ascii?Q?UDj4Ex69ji6deBl3+kLEUhOqtG46xcAtlq4V+HvBnQ607E8Dxl2pSNEDQjNh?=
 =?us-ascii?Q?ulpsa04+Tlt0BtP0lQwAeUS4IcmWF4cNFw25WJDh58gA6H/DmEqvRNvLXYcq?=
 =?us-ascii?Q?dgcWSMZubXlzjmLodhcNzJvKFyDFfF4JURzNcxxh1g6azj0aZTBG+d3iHhTq?=
 =?us-ascii?Q?dcuFZZ/f0CyFPRb2Zqzjws71PeixKKigToW03NY9In235ZHBCSnpq8wS4zn8?=
 =?us-ascii?Q?ODJWxDi5fMJSrS2WXH+48Bw6snxpv7vlopNLPaXSyW9cSOjB5Pw8rbwy9CEE?=
 =?us-ascii?Q?PpZQ3/foFkHBeII0Jl4kgRV6CXEy0i23Qe4w3kAVp2aE4FdaKu1c9pNH2etz?=
 =?us-ascii?Q?jlPQ8Lt82kJQVOtjb5pFbjL2pebIW9v7/ivKmd2LpcDA5eel5zQLuihj2QZo?=
 =?us-ascii?Q?5TBNS79nXf131dvWFPblvSGiL5J7n4D+xmrrwxnwUE78iFUVxEA+p1/r22yw?=
 =?us-ascii?Q?ijkkMJuoogNr8kgAs8xZkatVY0/JYSTJdCOuaLWdZekn/2McGp56h3+2vPuS?=
 =?us-ascii?Q?ewW3dXz7dYgbMJdAW8vXoJ2ymgevfN/y2m/2Sw9jhA4stzaVwPgsT3wILQYd?=
 =?us-ascii?Q?RtqgFoRsVp2qLNwlCKjO/cCZjzrQA+DiShPbfLjhB9fsSCYv7lJGn738eRwB?=
 =?us-ascii?Q?3nQWHcrwAsFbMAzni59jiRn9YRW2o/bYB5eRj4E8vS5JIvPa5dS8OU0jFBP8?=
 =?us-ascii?Q?G87ys1HiFDHineTuQ9dfRTIig7ZN+CZF4n//hU/Y95qE0cVyB5DEsmxi+nTO?=
 =?us-ascii?Q?ALFr4cKq6qcpcqZyEe1YWhoXQP7I7uu4X0jTQg1HJC/YWf7E/m9q/XhIsJ9l?=
 =?us-ascii?Q?XaL0mbgeTC+3C1m4nkVyzf4ZkK7ZIPvMlMxgmvXmittavMfAKLcOlNhzKw9G?=
 =?us-ascii?Q?2kG+tuZuUwdYWKACNFzfxrVhmFXfFDuIyzlYXK24zVT1fig7dKrnMMX6KP5v?=
 =?us-ascii?Q?qFawfCM3+1+SKV0FkjrRq18GDGGYM1Py4tu7vZdeHsU2jdDfH8P5Bpb94+Sx?=
 =?us-ascii?Q?kBGDUFrfJTXWoF1VW7z8jEPFXsxm5Yh0m0IjlEjoGGSJNYrjmrgDyjTmNK7e?=
 =?us-ascii?Q?tkoSzYo9mv+L+kh9RFrC+dCWiMOtFvB+ZySCbvXgfOiVRwXe5hgnLx70PraW?=
 =?us-ascii?Q?7UshJHZ4BLsJ+ogcoWdJ6vI5luwpCJYIFI1sHxeVIittAVpLV9e5KFFU99vf?=
 =?us-ascii?Q?1Un7dbelnQ1wv7xf4QABq30uqEOGWWWWQiXbFEdhvTdv3OP7pv19Ut7UmFWW?=
 =?us-ascii?Q?1K9uo3kPUu8t9UjM6Yi6mFh6cYXCsagti+wJqrwJkz2nZ34ZUpAUCzNiHfv+?=
 =?us-ascii?Q?+ALqTclfkQkdTeOJ3LeOA1FP0zAjk4O1kekhOoyZ+3xadNCbMlG0nLrGTvBV?=
 =?us-ascii?Q?1cbThk98jb4E0yllGg4swpw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2adaeee4-9691-47e8-4de7-08dba36a9fc7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 23:50:54.6450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AGJUDT5Do7nTP9I6G1AQMSy94wyKf26TLdqRmO1Yy0u5kVEm0lYjl4Sm0bU+qoWZkSs0oOO6xovGeR2T5F61owtDI1vOodLSIb9Z/jX3MvwRAbhnYYNH6TUWKmYBCn95
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11948
Message-ID-Hash: P32WKYMWWBUVDKNAXOP4D4WWQSWIMAQA
X-Message-ID-Hash: P32WKYMWWBUVDKNAXOP4D4WWQSWIMAQA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P32WKYMWWBUVDKNAXOP4D4WWQSWIMAQA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current adg has default division for BRRA/BRRB, but it was created at
very beginning of the driver implementation, and is now an unnecessary
settings.

Because it has this default division, unexpected clockout might
be selected. For example if it requests only 44.1kHz base clockout,
unrequested 48kHz base clockout also will be selected.

This patch remove default division of clock out

Reported-by: Vincenzo De Michele <vincenzo.michele@davinci.de>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/adg.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index fbe209b2430d..94e048614c81 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -486,7 +486,6 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 	struct device_node *np = dev->of_node;
 	struct property *prop;
 	u32 ckr, brgx, brga, brgb;
-	u32 rate, div;
 	u32 req_rate[ADG_HZ_SIZE] = {};
 	uint32_t count = 0;
 	unsigned long req_Hz[ADG_HZ_SIZE];
@@ -560,6 +559,8 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 	 *	clock-frequency = <22579200 24576000>;
 	 */
 	for_each_rsnd_clkin(clk, adg, i) {
+		u32 rate, div;
+
 		rate = clk_get_rate(clk);
 
 		if (0 == rate) /* not used */
@@ -570,10 +571,8 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 		if (i == CLKI)
 			/* see [APPROXIMATE] */
 			rate = (clk_get_rate(clk) / req_Hz[ADG_HZ_441]) * req_Hz[ADG_HZ_441];
-		if (!adg->brg_rate[ADG_HZ_441] && (0 == rate % 44100)) {
-			div = 6;
-			if (req_Hz[ADG_HZ_441])
-				div = rate / req_Hz[ADG_HZ_441];
+		if (!adg->brg_rate[ADG_HZ_441] && req_Hz[ADG_HZ_441] && (0 == rate % 44100)) {
+			div = rate / req_Hz[ADG_HZ_441];
 			brgx = rsnd_adg_calculate_brgx(div);
 			if (BRRx_MASK(brgx) == brgx) {
 				brga = brgx;
@@ -591,10 +590,8 @@ static int rsnd_adg_get_clkout(struct rsnd_priv *priv)
 		if (i == CLKI)
 			/* see [APPROXIMATE] */
 			rate = (clk_get_rate(clk) / req_Hz[ADG_HZ_48]) * req_Hz[ADG_HZ_48];
-		if (!adg->brg_rate[ADG_HZ_48] && (0 == rate % 48000)) {
-			div = 6;
-			if (req_Hz[ADG_HZ_48])
-				div = rate / req_Hz[ADG_HZ_48];
+		if (!adg->brg_rate[ADG_HZ_48] && req_Hz[ADG_HZ_48] && (0 == rate % 48000)) {
+			div = rate / req_Hz[ADG_HZ_48];
 			brgx = rsnd_adg_calculate_brgx(div);
 			if (BRRx_MASK(brgx) == brgx) {
 				brgb = brgx;
-- 
2.25.1

