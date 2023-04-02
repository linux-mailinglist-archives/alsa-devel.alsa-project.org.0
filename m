Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B966D3AE3
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 01:02:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A1B03E8;
	Mon,  3 Apr 2023 01:01:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A1B03E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680476547;
	bh=aCzeecKsSVWfYe8dcz/jkMW8/0xLnLYMBgb3s4tY0iY=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XizjXzvFD2fphmddBeWfTTNz74kwiUTITEInBrVB8ni7IDN28BS9SmPsTT6pwYcHx
	 NplJV/Ye3XCZZw2HM5r83pqA1Jtem55vJlAp9K0+DBpiwoRIVfE4nEAyYI1Hf+Ww2V
	 8fG2zl9BZbyIyRkMAh4kG9pKXZgkTxhO4CXb/6oo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 039C9F80542;
	Mon,  3 Apr 2023 01:01:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1762FF80544; Mon,  3 Apr 2023 01:00:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F178EF80495
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 00:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F178EF80495
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=L68HRUit
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mG8ArhWy0aliQQZozHfEDMhRykj4sPAG6kw7l7Yko0rhTvEs1WEwcBJXlWE+ImFgWVfQX7s8HX6LHTQ1sqMMTvZeuMsPkBu2mIvzg91Yp2Z3ReHyjYSFY9SxzaBA1W8yZ3cRo1pIht3qeQ9je52z4pQmJGI5vZYHhOnKDcW4XcBtm+z+vr8W9Mavn5BPzktPN96FYfNQnfiWMNjbtlHpOpEf6BmKgjdB/hHUn0FM5Ce8oeAXYtaG661PAp2HNqfbP3HP2QRE2J+h7t9802Y3//Rx84VJ2dcK8laZqhQ2HgpmgDI2uFqfKqlNjiZDq0BmCiRgnwU7m0DSq7tRmOt5cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mfeok9zOGnZlz4K6D19cMMSRZA4g0/nZmGoB9j01m8o=;
 b=JUWZuGK5C6dZSGehhee8mmG08DeK8RLqNZTaUOJTvwB+1oQyd7stVBkWO5I2B+6B7qbSyYEhVRVipG4fHGXOyUBFV0ci6E+9/5g57vumW/607RncxbueeDLxn/kr4kr+0ETuGR1jcLzJvFCVsaGoZGq952LRwqTuMJd66BK5kFn/zdXVAK9HbUgG7KuvpN1K/CyHyX/5n0wYK8jR/QHyXVtTHAmVnVTqjiVXn3/F3ZKxIG4afJo7ymzRcldTSP++TaNjvwR3GvyhDLQsDeMUsKl7wAR1RH4kGKGlwWPlLUq7WgEcNML1b0wbP4S+EsuBjQCIc5EO9bti1ejhTjGKVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mfeok9zOGnZlz4K6D19cMMSRZA4g0/nZmGoB9j01m8o=;
 b=L68HRUitRfhi1IY8vAu3ro8cnT1HmtBXGszTAetJyzNK/iUsHh7ff02ezIAQ5qchAmMKEt20QcsCiyVEMtpvQiSsBC+k7VDZiGMSMnOJMTWBSIw4QZmaWNbpCphgO5yjZrSuwphotf3CyPDcK1/MSsrzbrMhmwI+du24gpF8EDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB9395.jpnprd01.prod.outlook.com (2603:1096:604:1d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Sun, 2 Apr
 2023 22:59:46 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6254.033; Sun, 2 Apr 2023
 22:59:46 +0000
Message-ID: <87mt3pc2la.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend 2/5] ASoC: audio-graph-card2: switch to use c2c_params
 instead of params
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87pm8lc2m7.wl-kuninori.morimoto.gx@renesas.com>
References: <87pm8lc2m7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 2 Apr 2023 22:59:45 +0000
X-ClientProxiedBy: TYWPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: 696f2c1b-8692-4dc6-8a1a-08db33cdf417
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7ILyH2xJL5z1vAycwHy5Y6qWtKABT4vh0H/9l5EVxASGHdaGBt+X4eBgzdV7DQ/EeX8qL4fATWJzoGyxoQKAgTn0aq7tlsOGMWg7Vi/MtNgoWymrhHKocK0yPUGPTb/hPrygQYkVKp2OIjIpQa3NOSs5ZJUpWDzihzcW1eQuAPbKN6VAABd8hjK8C9LWIU6y7mEsA73nf0KBP46OPHh0PM7DZwbBDncoXRUX6ncD5WVtqYUyD2Y+lPfU+CrGwPo+YcoHs6kM9j45A+Sc0E6KtNY0Yjw7uEhT1Ag1RuKTHlpKfbRXhcLtabaBXRMip0reI2Zf/SNsOx8lbs7H3HLNrmTFTuMW6KiTLnJ/JQZVBUdEnPWTd2Y3STSMzazBIKeEFiVzTU1DeleO/hAbuDPxqNEqzoUwM9ijlbwRlVM94LZvdltY4Etad7xb3VNCM/wML4AJ0+0UaQMUGyzQOVtMSQmB/ksN3L/d9QkMk686oIEmOi7zuPACC5zOVw82E/R6cXE/wEg8JrY+w6zt0FEuFXpUHRNZQz1cC+X8SxgPAJKgIouM2eDttzWx5e9oiMN9nkRTylvRD8cQpPqrfaDRkPaqcPtcaaXMOAqczY0dTRd/o5BbXw5GpnWi5VDZKjDW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199021)(478600001)(186003)(6512007)(6506007)(26005)(2616005)(52116002)(6486002)(36756003)(2906002)(83380400001)(86362001)(66556008)(66946007)(66476007)(5660300002)(8936002)(8676002)(38350700002)(41300700001)(38100700002)(4326008)(6916009)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LEILkGHgbc8R4J7VbCsejxNEBJrDRrrY1MhLjpHTj0nOxjlQ9+2nkZs6aEcR?=
 =?us-ascii?Q?UK8hwWS+lebRjH6TB0YUWsohX8skdxZjUwqV2+hkL+7y3cedLkT9tIEBsQ3x?=
 =?us-ascii?Q?oEkuxp39j0Cx0FnYQJ+uCtdTcaovRoZp7r/TxSy/IWHchwnL6k0hblmmIDw0?=
 =?us-ascii?Q?QjuYu/bxUXZ0r32jsCaUQfpru6tIAEaqWvCczBBZH56uT29GlzK+DoU0j3mF?=
 =?us-ascii?Q?638hkkfQVMmJpsG94ulmmMyvjKm3T3TPWeXtuwNS7AT5qW+MpP1TgPfIw3jr?=
 =?us-ascii?Q?Jaot9MMZr+n/2bQCPG5ltJc0p4eddA7uM5k1WZ83OZLIQKPOz9yB/N0TDKIj?=
 =?us-ascii?Q?hm1AoRulTmNkVTeoAbWNvnbYIiYxeN6K8K0yWj6fvoiuV0zay/umpcN0obVa?=
 =?us-ascii?Q?4bBwyjgPWbAz5BCq11bCXg8Sqfznra2WH7KRTe9pNhLf+dbX07Pt23jDrw0w?=
 =?us-ascii?Q?TNQVvlyVDvu8BAjKwRWma/Bpc1wFaE1kTySWm8Xt7rduBM26kYPvyXO2LUCm?=
 =?us-ascii?Q?SOWXyAQJfKK0Zru5yEnGJIzTGN5k35KWtUwmyoByqmzxZsQr/djbOyGkBT0R?=
 =?us-ascii?Q?hgJ7ldncJSwe0atvEmjzQhyyGlpvl0qYable8tnp+b++8l0VYowbvafL+Jry?=
 =?us-ascii?Q?cWV0m/JcGkKFskaB4+dZVLtgzx4GaUaxu4yWA+fMYjIXPoB2v8x8Ti81BL5x?=
 =?us-ascii?Q?jk4zi/e831OvKkLS2/f/bzh/q4VUi6mliUE9Dl21/hAM9/MCjWFI53LAiJvB?=
 =?us-ascii?Q?luAtJB9Hk8fo6+UpJ23olxQ6xjT8tYWTyzsU8ruQWwVX6xB/UrR9qwWHVu5D?=
 =?us-ascii?Q?DAQYXuEGy9HEg+aYOB67FO2tbmcMoXUIwY0L2LEF2igjDwFcBF7X+UAFyS68?=
 =?us-ascii?Q?OfFgKYiBUl7EQQreDSd/IuodYBwJoWRa3tmpEN3UYD3PGDp5UJACWiwaPWie?=
 =?us-ascii?Q?iht5/9Ug1nJRaqd3apKBBcMs/U6ZW8njZ4SV5Tu+FAFhATD734bP/a73RIZ4?=
 =?us-ascii?Q?0norYvVjFm0usIRQttCxM8dr6diOoMRmVWOyZpDmnYzUMIbuu8IJLY7WMggY?=
 =?us-ascii?Q?UCjeO4UOjRQVhbNeBVyQeuGjBvmdw2PMndEiQJ7qME04Bv/0D1sRqdUY+3Bj?=
 =?us-ascii?Q?5lPBadQG/p0H4wNoLpwixt2jaJdukFk1fvFRdZlMDqQ+d6q4VP/5gHa1AyJR?=
 =?us-ascii?Q?GCWpLzug3z8HCFtWsn42MFwFArMgfCNFQISDxSS6OaWC0heyY0JlpA3NCHaA?=
 =?us-ascii?Q?uws9/amSu93KxlpWThzIibCXE9RGPyJeme3xZCiir/3vTKr6mt7ycC4Bpf2G?=
 =?us-ascii?Q?HKlnbCGUuf6fZbHU3L93ryARV/JL62LFAkzeVbuf/4TQ7c9RrEK2QKKREnpc?=
 =?us-ascii?Q?PT3m8q2Oi0rndSpQ2U24lARRi8SmceNw+Avhts2TnWFgOqHLvMtYlKpQ7rI0?=
 =?us-ascii?Q?XklDD4bhiYo+mA6qTun0Qzun3U7BUWuTLrYdqjknJbnSQXQplrENqUsZtihc?=
 =?us-ascii?Q?Xy3ZCx+dvaZTKOqaX3hHpXGIRslyuvJQK3PRFBoMQRoC0ROuhZkHskEsliVv?=
 =?us-ascii?Q?WpnUHoqnPudPb72iYShdSKzrQszOpwj4alJhY0dDzAu3PDGsoI0ypZ6VVg0X?=
 =?us-ascii?Q?D82IB9IyqoLT5oOLyHgp7Lo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 696f2c1b-8692-4dc6-8a1a-08db33cdf417
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 22:59:46.0349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5bbjaTBEiNIvKgjBCGodneCArj0DoJqTgN6PHddDoUVqE2BoiPP/QizXHNAncNQSGrN4r2UHbZj+XCafjeQwWgf2l3OxG63NTlF74/YE3wL+JRhIMYq19DBf/teebiQS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9395
Message-ID-Hash: GRIUJTJKFIQKPVGEZNEUOJ6ZO255VPDB
X-Message-ID-Hash: GRIUJTJKFIQKPVGEZNEUOJ6ZO255VPDB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GRIUJTJKFIQKPVGEZNEUOJ6ZO255VPDB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

ASoC is now using c2c_params instead of params. This patch replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c |  4 ++--
 sound/soc/generic/simple-card-utils.c | 24 ++++++++++++------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index d145b74d41e4..25aa79dd55b3 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -920,8 +920,8 @@ int audio_graph2_link_c2c(struct asoc_simple_priv *priv,
 		c2c_conf->channels_min	=
 		c2c_conf->channels_max	= 2; /* update ME */
 
-		dai_link->params	= c2c_conf;
-		dai_link->num_params	= 1;
+		dai_link->c2c_params		= c2c_conf;
+		dai_link->num_c2c_params	= 1;
 	}
 
 	ep0 = port_to_endpoint(port0);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 34a9b91e676f..467edd96eae5 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -562,12 +562,12 @@ static int asoc_simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_component *component;
-	struct snd_soc_pcm_stream *params;
+	struct snd_soc_pcm_stream *c2c_params;
 	struct snd_pcm_hardware hw;
 	int i, ret, stream;
 
 	/* Do nothing if it already has Codec2Codec settings */
-	if (dai_link->params)
+	if (dai_link->c2c_params)
 		return 0;
 
 	/* Do nothing if it was DPCM :: BE */
@@ -592,19 +592,19 @@ static int asoc_simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	params = devm_kzalloc(rtd->dev, sizeof(*params), GFP_KERNEL);
-	if (!params)
+	c2c_params = devm_kzalloc(rtd->dev, sizeof(*c2c_params), GFP_KERNEL);
+	if (!c2c_params)
 		return -ENOMEM;
 
-	params->formats = hw.formats;
-	params->rates = hw.rates;
-	params->rate_min = hw.rate_min;
-	params->rate_max = hw.rate_max;
-	params->channels_min = hw.channels_min;
-	params->channels_max = hw.channels_max;
+	c2c_params->formats		= hw.formats;
+	c2c_params->rates		= hw.rates;
+	c2c_params->rate_min		= hw.rate_min;
+	c2c_params->rate_max		= hw.rate_max;
+	c2c_params->channels_min	= hw.channels_min;
+	c2c_params->channels_max	= hw.channels_max;
 
-	dai_link->params = params;
-	dai_link->num_params = 1;
+	dai_link->c2c_params		= c2c_params;
+	dai_link->num_c2c_params	= 1;
 
 	return 0;
 }
-- 
2.25.1

