Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49167774EE7
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:03:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA454E7B;
	Wed,  9 Aug 2023 01:02:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA454E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535789;
	bh=jNsZunAATjABojKpRxLkHtTHyXX4G8JWby2srSXSL6E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fXrNixHZy3Zm118WhrVr983zxoMMI2Ji5SbkUiRFO9PyJUQsqJLy6pQsv8yvNiseV
	 r1RYNFHuCod4H+0EukiiqtQ16CXFI0a+IqkQI/AMYJcMJliYxz9PCyhbo1B1x39QG4
	 QeyaBVEwy2pmt+hBC71OllgToTH5vzfDokhimI1g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2A4BF8067D; Wed,  9 Aug 2023 00:57:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D89EF8067D;
	Wed,  9 Aug 2023 00:57:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 051A4F80677; Wed,  9 Aug 2023 00:57:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20710.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15742F805AB
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15742F805AB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jc2129Pl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jOkMq+UJGWXR/OEN6+x8LXoF3Z+SP8i+UiWupNL/r8hb1mtSes1p8Ln1ldFLrargLkkrIiaZIcVy3CQtPgkQ3LTCDiX4ZGCbYtzEwm3jYbrTD6Aito7r8XYgXObJDDsQ1s4UIiqnpZ3XDFOiNl9SssblqyFaTlPqsNEmWtoQxvW6bxxpIcUgMTDWOUgWn06srnUQp5DZraP1hIPbCAqfap5BRJzmCqE2gmdfL7YU/qcTKFZ3mGGDYy58C0U0b6gSzdfqUM2bq4+e6t5Tmo0AW53HfwyZd20LzKKMmqewJiHEe8CTbJ10nOILlT5Eqwbz6AvZY+qeKYsKCJRmRMfLVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tos+f4z0cyXQdOzBTPA3q8VHnbg0F3VYLIbBlJNirvU=;
 b=Ygzb9crbtsRt4haog5tBk/4Zna6IDMW+S/5yWE1vrEKiKEvfCuzTmGks3NupPxzrAyndEWERDfpqDvy5c5GenHOGH59HnA0A9fzX7wkELa6AQ3VAUaSejp5iVfWlfSLAz0SiHvMISykLk4rRdrmp1UWI3qHjwQQkloTJVn0Sgnpd0R3Uo7sN0AUHgOGAdT+XDVs52bGDGNell+6A+lrIkhUGOBIEbWbWN1Scv2lRLpsBG67MxrJw5I3qety/YVStBDlXPHm05G7UWpLcDpJPeRLJ0z6Ws+QJ4ElAsY4Uu2WTIZ9C1CwBLKD1qyPn/DNbYYQoy3oBdE8hSHbhU2+hzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tos+f4z0cyXQdOzBTPA3q8VHnbg0F3VYLIbBlJNirvU=;
 b=jc2129Pl5rXFR4AbDlA4gdCZyt1IVOiqlSMCvcAVpoqLMlUIBFwPqxbLUN0pZkhvoUrZoHuveu7VJxoWI2V8e8t315hBY1pRYi7GIfetOIBbk69M0tVS1Zd6Js8w/q1a6hIYBWVDYLrQYc02G+wVIsPgyQJ01QFYX3XjIcwj74o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11379.jpnprd01.prod.outlook.com (2603:1096:400:3f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:57:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:57:30 +0000
Message-ID: <87wmy59m7a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 25/39] ASoC: cirrus: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:57:29 +0000
X-ClientProxiedBy: TYCPR01CA0095.jpnprd01.prod.outlook.com
 (2603:1096:405:3::35) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11379:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b8eb1ef-9ca8-4427-7a83-08db9862d7dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7MqmP64rt6hTd9Kjv3e8w/htkJ6XIIIbjYROp0KtZ6BHbMi+CMQaZSOq/CyPsHbAQSIFJSJhWOAG4UVi1PFgFSHh2eU4lDC9mUQ4kQRX13Zvk/SQpxVjpYEZN39LNfhb9JpqV3Gr+ELChWXKm0aNh7a5k0Tmy3JJkvj54mPpO9D5sAEKGmgl2aAmGKWRtCzqVPdmZQAIb26khRiKfgJXzdCykYqcvxU9h+oiw8S7pwRB8aPvDQ0F+K2qjGXjZY6HLLmSoCY9BJFysUIAlHNj4KXBSbx8hamRCxA8PI9Pl+ZaklOXHazbp9bUiUtaisjIFyYSKeK3GnE6dDiOi3kr7/9kFiXG642qjY6IKmIhbIS5NLPrh1zjQTcpTMgiQmFC05WIizsRAMIBv3kTB8gfUh0nJ2U97S+FFsqbDyOLGrTsX1ycF6L9SNGMDzQk+6ld3R+SPBTz9u7tqokrhr3fCEBgjyntjFJbmCV5bSJBrJHDiyu7C6+yvEAhtFOORTQgoUy0wcYnP5PMMLqWy0Pngk5NCCR0Ww7eqGOoS8nVsGBvAUJQIiEoGpJQAEuQC5mjNuy8xAmt3b7kmlohdbgtB3KAnaW3iJgfA5wCMjCt3jeSHujuULm41GouT0XUJgLh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(1800799006)(186006)(5660300002)(8676002)(8936002)(38100700002)(38350700002)(2906002)(86362001)(2616005)(52116002)(6486002)(110136005)(83380400001)(478600001)(6506007)(26005)(6512007)(36756003)(4326008)(41300700001)(316002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ub6YgotzA+dnQ7K8iP6TI/JvCQpR974nLTTHuM1OGgJIaa9uDaKncsB7n8+0?=
 =?us-ascii?Q?RWYVdKYZEHuKC+KJREE1kM5TcncfrX8ySg3EL9GqPpZY3uicKEKvy3Ev2FaZ?=
 =?us-ascii?Q?7/21xBJrKNXTHt3VyqvBXvr08ifHq5h7UeAj+QNCiwTCBAxN9ZwJwR3/aKAA?=
 =?us-ascii?Q?bQqMmplU8ojmOqp+0lA7FSJPpY16c0hc27NR1uyAUtW57MTAscb2lq9hAzxF?=
 =?us-ascii?Q?U69WTSFChw5b2XOCTsDG82DKOEKWue7Zf0trARGaE56qpz9kHEDDlXxJRTLs?=
 =?us-ascii?Q?VdfSa9FCpc0821oDHsI0GDO8ylp4q68JQmqQwVX2qqo8q4hfsvx548Qbzzpt?=
 =?us-ascii?Q?v6bFIYngfXp9ZhCSVyNlhMmM1DJ3YbL1awG/R+Vgbh/ecgePqdMS81TtMMsZ?=
 =?us-ascii?Q?PwD5NNKTrS7pdMlcKuBAJRjrchdEh3rN+P5HwP0vD0AzDvqofT69FHACAEXV?=
 =?us-ascii?Q?UvS0bpkqVQz3D9f5uWrXtij9xooPNNuQfTZVpYgXDDLRB6gOGBwzjg4hrtr/?=
 =?us-ascii?Q?It+Lh6bYvw30nJA+jITGikpDU4olh9+cHFZJ7guahIhFaY+IHksnvMhF1kIn?=
 =?us-ascii?Q?yfFuVlr7W5SCNpMlHSND8gRTJE0Dr4R1dSWvFc2/gawUwM/h504ogJqhmd82?=
 =?us-ascii?Q?jRjX/OUU0aUznuHtsiPHN+hHDyC2SXQKfZ0kbZah/Jjrw1vX3/5mLGx1LQFs?=
 =?us-ascii?Q?MS2PugXGGvroY3EYv0wKVSXwPAmzg/n5bFZM3zgKo39bZs/4Tv7OyHuzlf0u?=
 =?us-ascii?Q?UbJs6Qym5usYNiTUI3nZNleW1M10DsjimlP1l+srlLiqLssrf8zh1PTr36pw?=
 =?us-ascii?Q?MPXOgkIMbpSIdl5WIb90Or9iAMMdGQjZj6UIYSM0LrSCRgSAWqYB1GCGe15P?=
 =?us-ascii?Q?H6PiCqTrGaqasX43yGncrJdPoLtUM/N6K/cxuSB10jwchvbBYDd6wWF68sXK?=
 =?us-ascii?Q?nRYRIEancZDTks/HHM839KC+m817hH+fLKO826R5iJtjvTxbS8Z765g3Qvr/?=
 =?us-ascii?Q?yslK/jZN7gdiFDNn1RVSb/7XPkZsNYmMOLf/FRnFh3T2Cx3VvYdIZ6cFyVYK?=
 =?us-ascii?Q?fHzW0d4k3ReX5PWvuG5OvEClXHhyRX5WPtMvx5H+MkojfsIfniGgbF6Ie9TB?=
 =?us-ascii?Q?K7RerQ8oYfN2KeZJt5n0SdbuOIEq38S/ke3IwGqTBTv27Dj75knobiWnt3FK?=
 =?us-ascii?Q?kcb58HhJObfx1K1yz4JJ9gqHsir1NasES93cRmAuL5uiOoKhnC7tUYqcAVJU?=
 =?us-ascii?Q?rTqioDDZjXCXmkaoGzayGBX/oaK7m47bFCSTsFxgN0QLzei1T+6PGVUEsxMx?=
 =?us-ascii?Q?rSxmap9drErsafjgcGbiPjY1bGbiLw4kaprjy4gQWlFE//uU6LWGa42CUIC1?=
 =?us-ascii?Q?KHH1DGHBf5FX/Z6dsmc4SvxEB8n+MStGPmWN6LMArmd1VqNtl4UO12/Z9m3Y?=
 =?us-ascii?Q?NekDBtK9vatjV7r23chpnixc5+07BU4cMmysebI+cJ04fLUYt9hH34yGcpUD?=
 =?us-ascii?Q?Z9N5TjcOBjYcI0UcbQbUhgpqFkLkHRXeK7HfRy9SAvaBfGyOSTBE7nbJoeHW?=
 =?us-ascii?Q?N/00QnxXj1FgmjMMXNc4S9JZPdQ4YWwdjZoyL8r76OgiFsUmY8+fZv6k38IL?=
 =?us-ascii?Q?xSb8BMN+ilpTBggTp8ON4/U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8b8eb1ef-9ca8-4427-7a83-08db9862d7dd
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:57:29.9935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 V4TMp/thBRGlPb4rzN71cNbUh+9yKOwRY6hSa6EtCt6gzjq/DrcLfroBUFzgtBufBs7I4mmoKwDsrYC8j0K7eHBRVExTLGzO086mEQ7Cms0RoeqOzhmoS6N7O7ajPGaB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11379
Message-ID-Hash: IIRKKDV5UVPT6FDZCTVHGV4J56NLMSJV
X-Message-ID-Hash: IIRKKDV5UVPT6FDZCTVHGV4J56NLMSJV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IIRKKDV5UVPT6FDZCTVHGV4J56NLMSJV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 sound/soc/cirrus/ep93xx-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index afc6b5b570ea..522de4b80293 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -407,6 +407,7 @@ static int ep93xx_i2s_resume(struct snd_soc_component *component)
 #endif
 
 static const struct snd_soc_dai_ops ep93xx_i2s_dai_ops = {
+	.probe		= ep93xx_i2s_dai_probe,
 	.startup	= ep93xx_i2s_startup,
 	.shutdown	= ep93xx_i2s_shutdown,
 	.hw_params	= ep93xx_i2s_hw_params,
@@ -418,7 +419,6 @@ static const struct snd_soc_dai_ops ep93xx_i2s_dai_ops = {
 
 static struct snd_soc_dai_driver ep93xx_i2s_dai = {
 	.symmetric_rate	= 1,
-	.probe		= ep93xx_i2s_dai_probe,
 	.playback	= {
 		.channels_min	= 2,
 		.channels_max	= 2,
-- 
2.25.1

