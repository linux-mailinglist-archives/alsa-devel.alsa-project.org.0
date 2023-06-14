Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFBC72F0C6
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 02:04:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A6C03E8;
	Wed, 14 Jun 2023 02:03:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A6C03E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686701057;
	bh=rhKOhRpoaUbQapeg+ElVPB4L5WsSmQ651RbQyfxB3qo=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OS50z32QG0wiVlsQIYqUh974EaSCEJLKWLbwAaYt58OQuguFiO7DoMjPCDx0KN6pY
	 7jJmC+vZOc4xOYMZ6ZOXAMKwWOsq0lUIhd8ztjSXTKxrDj+4CnE6UG5GdV9cHkWU9T
	 3cU97+9TxmJJB6m19pOPNsksZz/92G5ZAL4xhK08=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90672F8025E; Wed, 14 Jun 2023 02:03:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DACDF80132;
	Wed, 14 Jun 2023 02:03:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31002F80149; Wed, 14 Jun 2023 02:03:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-2.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20712.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::712])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9A0EF800BA
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 02:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9A0EF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RESLV6R6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jxK3RsOy/W1ffQSNS3trAAbsqkHaCGgoR3NYWnb+4nvA41FTz1tKwx/66Q51EjuCw1CVNAybMpL4vbstctg0Idp40V0hTjmcvNtmao9AvH331ava6NUyAd9Irlc9hX/sz7lZJnHCk794HbxPddapgm88ZberHQ56fNCC5chE2uCZOHPJvFBcwQBD1js9KPAdC5opdvYoGHimQYzlYLXRHG31eDXxIPRifZ+A5wWYV6IZp7wgERrT/X0qe4VWN++0dqTLiNeLhvRbS9nhHNxzE7MvmT9IDY2AqhyD/E67uERJJPF04MAXOc+Dctfqgfu2KMgmgpLx6Nn868fr3re45w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNinnJrZkX5+rd0yP5ZqA9YVUpOs66XeRTp0sQA+7H8=;
 b=bCITsBDiVOvaM8v6hjdcVXu00BV9cOq5z6ScQRrPhLaTsvYdgvUg9KoeUS4OSDCcXeOVJ6wtBcIcF0QqA0+xv9lPmYJfF4/AvTF8hZZ789UZHX0tZ4uMtTTVCsqUtf3xmMkh8K9MbDBq2CYK5HhFzlq9HMLXrOJr4bV9+JJckmbhfDJNgy4Qock9kDPf1KWZnlSE5unMyk0Xr8ea58anKRihMTIF6epIlHlPbPY5aBb6W3IaLjNmJh19eiGRjjNE6SS71hu9v0GCmt0pXaIHLN8AfO0ezX4Ujb+tFTZEJ+f/mmK17O77Hn4IjHdn+PIre2EFaw586NQz8IkPN19bJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNinnJrZkX5+rd0yP5ZqA9YVUpOs66XeRTp0sQA+7H8=;
 b=RESLV6R6MgeC0MCMmTPL0rrkU4PXDGyiHP9E0QkZeWt6c8qWRGMyBI2RZsDR4Xzw05Pb2dCfJQosteHGJYseLQgLwMl0tKlNAnDoK33cQ18MF4vJKfuYHTU/OwL159Sf0j/xrEo06D7ms+UgwvwXDQ5w5BdPaY/aQwdFBR0G2qo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYWPR01MB8710.jpnprd01.prod.outlook.com (2603:1096:400:16a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 00:02:57 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 00:02:57 +0000
Message-ID: <87o7lihpvy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: simple-card-utils.c: share asoc_graph_parse_dai()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Jun 2023 00:02:57 +0000
X-ClientProxiedBy: TY2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:404:f6::16) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYWPR01MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: e74eb13c-a7f7-48d9-eb0f-08db6c6ab5bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	el8WYOICjTs1JobHwWQismcDpP8lyzXkqb5sZk9Ss1V5Uo0bIupDRRnMMCN3jvRb+2VYIp2XGxw/nm/cD5oJhV04YSoxICfXIWnAdlFCxdOBITAQdH6ZeYJMj/P2t19EwTyCUtaUG+GNOUqkeSHwZmAu7IPekp1H1NM7yAKocUwlwKfiqlntPo0EgQ5bU6cR47oM+5IeIbz8SMmo/OdAY+PJePYGvQxHL0f7hpfIa6NRiTCfMmpIf2/ytXyH69KQAp4thIU2ECkgDmGN7Y42TxsHzNXZvdLsNgf6tB2w02OgZdCBzJ+chsJXP2yWjJoU9Yj6sPyjqCJo92KCDooSRw0mHLEe6w7DHf/ojk9lN7ioRRsIUfhD6zY9ndjNspU5CFkngk3OzofcIRvhQMm/LwUuiyGq/c8X5L500gsuJ7hAyoLfKzvgJxOUB6xBPo35irCgJn9Rv49x8/RUOTptJiY4PWdNM+d33J3YAp6jWNfqtshaepFRnKTnkRmawhzZUB7jAktlNvOMRSwTyv4YKS85BO79+CZO1MVgYxC1HLXgbvhHSl00nE/JipJXUbw4QNzMal8h0KRyexKMkpbG3Lw5DB125j3Kgq7sEbJ3PsTFAjuWMlguzk5FrgMQDw1g
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(451199021)(52116002)(6486002)(2616005)(36756003)(83380400001)(86362001)(38100700002)(38350700002)(6506007)(26005)(6512007)(186003)(2906002)(30864003)(6916009)(66476007)(66556008)(316002)(4326008)(41300700001)(5660300002)(478600001)(66946007)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?x/PFz/EdAtlBgiz2t/2CiMp4XHl9yYHQwexMKOEX2YL8GebLw4FmRJaFbeJ/?=
 =?us-ascii?Q?SqGMCQvUP03cMmwl0D5wFBQHKStOiIVHYkuxqWzANW/TM1WecAAXqPgGwJO5?=
 =?us-ascii?Q?RCJzFlX8+5GU8o8uEz6eZNJefYM5T1jgZjuPu8WN2r1H7waDeNHnv7sSaDEf?=
 =?us-ascii?Q?8QPLhEUtwdLneJa/xEGTx/cufjUDxnlt9gAAxCFJU4L4Yz5tBN04rQbmkvyL?=
 =?us-ascii?Q?4Gwm4n88hEJ6WZLabQtU2Vktx5qRmpVlz8tjsFGXmghS6dPQA1cfBVbtyBec?=
 =?us-ascii?Q?aH9KCQllQQSj0+X+GTgjzKlutGDxbWPzGxdKmTCN3lcI/qSnuDKLGrleupVt?=
 =?us-ascii?Q?qAtZUdxYx8un1ONg/LWK2DgPP54m7Wt19zPT1MDrDDA264Q1hhje2cRIrrH7?=
 =?us-ascii?Q?biaJTTR9oz5hHT8W+jI6dW3SbqWfaVpU0P4fDefYyc83JLPc1/MHm+1sELwx?=
 =?us-ascii?Q?HjiSHG3RkhkAanTirzfLMUpA261bchLgzKSY0Si3yrrjULO6uCEUVkuBkwXs?=
 =?us-ascii?Q?50HqYoCi2VRHzG6xUTJDrl5ST+52kyeWDS6oXpBXaIlWBXPRTY6M2dnwlZHx?=
 =?us-ascii?Q?Gz4/RYqTbV5js0iBQQN4sZAED/nAVxG2ZTbnI5kWrzT1QOElW8t8HphikC/b?=
 =?us-ascii?Q?V6cydOCYlfOdwYPY4keu3B20g+hqcrWGML58Szf+8IZTkKo020mmQiMiM/Qd?=
 =?us-ascii?Q?IRqOY1+kTXeNQ0docNkAO43Qkfg4jH6va584Z4aZSmW3BA806mJfuxr+ywfF?=
 =?us-ascii?Q?7ykWB4GbvLx0T5jn0umZ7u+FkOA3oVp6grAyIWB12I0xVjdzOD8/A+eYSTHh?=
 =?us-ascii?Q?foTTeXr/WevFwYUfoS9cKYzkhSRuIfJGj+BTOROnqtdZWZGi1wjEUMgInre7?=
 =?us-ascii?Q?6XhrbtGgUf8oKNIZp/L+vNU/m5DMkqzSwBtALf0vFJUYo963arqqS9wk8sHP?=
 =?us-ascii?Q?SEkTVQPVqmPpxoIdDfgT50tq9StpvNlFWkZq+AhuTffoU/WAuKRjs+FsgB02?=
 =?us-ascii?Q?kEMoWIzdkgAWEuyIP80Am6wAiCZsPOn1TI6PiDvoN92FLKDYNgcPHupQa+PX?=
 =?us-ascii?Q?NtspUyUAiRKNi11k3GNFc8iFq1bgW6R8fG+w32iy0mhszDXL3pwSyJxLOGy0?=
 =?us-ascii?Q?40+NpeoTFDGz7EDX6Qsi/1FlijNCvl9fXAy71O0Xpv9nzhewfx/dNQ2SUbUw?=
 =?us-ascii?Q?ALCwi9Xp9MAlXQBydBLSvxgBZK2p2QhEUdIuVhPjVe+P65YdZjPYC7FKFLnZ?=
 =?us-ascii?Q?A7r8+/SDH/OVbKVn8O4pj0/LnGXgejLInWPSGGs3lrLx3ua07TPvvW5gCx83?=
 =?us-ascii?Q?C4C7AygNy2TdUlvK4LMBooemFb/S13V9XILqJhYePaJnzgHcBnqW6mMX9ihH?=
 =?us-ascii?Q?jEqlc0uK+1xXcvUpiQbsnHK0qe7MeiN2atPmMAKOQoJkn/GYnmMOg8/ccqb9?=
 =?us-ascii?Q?/wdezuzekKETho9s2Mw0FXS9fVo54+3zxGW7Afr51GT9mCwPBLD0+6YBZv5+?=
 =?us-ascii?Q?jP3ZMhlQ8d72V0zFY9MEd8HLr//5E2tnsy33D+fuxBZZ49b1xK2k7tAi0e50?=
 =?us-ascii?Q?+ryJnmb41sR4cgzU1/FHmxbCYfNcL35comJwXUWtl/C6tmE7AbN7Rg0zwreS?=
 =?us-ascii?Q?uUGZh7P45Ab74io7ryBL/fk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e74eb13c-a7f7-48d9-eb0f-08db6c6ab5bc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 00:02:57.5957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4h55FwN3BUCG4SmlJ4kMWXEwX91Mo5j6D+zQ9K3TmMynHLDpSN0RNPvdN2ISwL5c83o8V7kF9exOg+OJ90XHR/g20g0iy0X5RawsASUjdQYEufG3F9zHiJRoUHtgWHdr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8710
Message-ID-Hash: FRVXGXTDGXK6CA5EQKTCXOEYI7GHCCVE
X-Message-ID-Hash: FRVXGXTDGXK6CA5EQKTCXOEYI7GHCCVE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FRVXGXTDGXK6CA5EQKTCXOEYI7GHCCVE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current Audio Graph Card/Card2 implements asoc_simple_parse_dai()
on each driver, but these are same function.
This patch share it as asoc_graph_parse_dai().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     |   3 +
 sound/soc/generic/audio-graph-card.c  | 107 +-------------------------
 sound/soc/generic/audio-graph-card2.c | 107 +-------------------------
 sound/soc/generic/simple-card-utils.c | 105 +++++++++++++++++++++++++
 4 files changed, 110 insertions(+), 212 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 0e46f985eeda..9daef37fe9a8 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -195,6 +195,9 @@ int asoc_simple_remove(struct platform_device *pdev);
 
 int asoc_graph_card_probe(struct snd_soc_card *card);
 int asoc_graph_is_ports0(struct device_node *port);
+int asoc_graph_parse_dai(struct device_node *ep,
+			 struct snd_soc_dai_link_component *dlc,
+			 int *is_single_link);
 
 #ifdef DEBUG
 static inline void asoc_simple_debug_dai(struct asoc_simple_priv *priv,
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 4e85536a1b26..c6e0f9132193 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -55,60 +55,6 @@ static const struct snd_soc_ops graph_ops = {
 	.hw_params	= asoc_simple_hw_params,
 };
 
-static int graph_get_dai_id(struct device_node *ep)
-{
-	struct device_node *node;
-	struct device_node *endpoint;
-	struct of_endpoint info;
-	int i, id;
-	const u32 *reg;
-	int ret;
-
-	/* use driver specified DAI ID if exist */
-	ret = snd_soc_get_dai_id(ep);
-	if (ret != -ENOTSUPP)
-		return ret;
-
-	/* use endpoint/port reg if exist */
-	ret = of_graph_parse_endpoint(ep, &info);
-	if (ret == 0) {
-		/*
-		 * Because it will count port/endpoint if it doesn't have "reg".
-		 * But, we can't judge whether it has "no reg", or "reg = <0>"
-		 * only of_graph_parse_endpoint().
-		 * We need to check "reg" property
-		 */
-		if (of_property_present(ep,   "reg"))
-			return info.id;
-
-		node = of_get_parent(ep);
-		reg = of_get_property(node, "reg", NULL);
-		of_node_put(node);
-		if (reg)
-			return info.port;
-	}
-	node = of_graph_get_port_parent(ep);
-
-	/*
-	 * Non HDMI sound case, counting port/endpoint on its DT
-	 * is enough. Let's count it.
-	 */
-	i = 0;
-	id = -1;
-	for_each_endpoint_of_node(node, endpoint) {
-		if (endpoint == ep)
-			id = i;
-		i++;
-	}
-
-	of_node_put(node);
-
-	if (id < 0)
-		return -ENODEV;
-
-	return id;
-}
-
 static bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc)
 {
 	struct snd_soc_dai *dai = snd_soc_find_dai_with_mutex(dlc);
@@ -120,57 +66,6 @@ static bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc)
 	return false;
 }
 
-static int asoc_simple_parse_dai(struct device_node *ep,
-				 struct snd_soc_dai_link_component *dlc,
-				 int *is_single_link)
-{
-	struct device_node *node;
-	struct of_phandle_args args;
-	int ret;
-
-	if (!ep)
-		return 0;
-
-	node = of_graph_get_port_parent(ep);
-
-	/* Get dai->name */
-	args.np		= node;
-	args.args[0]	= graph_get_dai_id(ep);
-	args.args_count	= (of_graph_get_endpoint_count(node) > 1);
-
-	/*
-	 * FIXME
-	 *
-	 * Here, dlc->dai_name is pointer to CPU/Codec DAI name.
-	 * If user unbinded CPU or Codec driver, but not for Sound Card,
-	 * dlc->dai_name is keeping unbinded CPU or Codec
-	 * driver's pointer.
-	 *
-	 * If user re-bind CPU or Codec driver again, ALSA SoC will try
-	 * to rebind Card via snd_soc_try_rebind_card(), but because of
-	 * above reason, it might can't bind Sound Card.
-	 * Because Sound Card is pointing to released dai_name pointer.
-	 *
-	 * To avoid this rebind Card issue,
-	 * 1) It needs to alloc memory to keep dai_name eventhough
-	 *    CPU or Codec driver was unbinded, or
-	 * 2) user need to rebind Sound Card everytime
-	 *    if he unbinded CPU or Codec.
-	 */
-	ret = snd_soc_get_dai_name(&args, &dlc->dai_name);
-	if (ret < 0) {
-		of_node_put(node);
-		return ret;
-	}
-
-	dlc->of_node = node;
-
-	if (is_single_link)
-		*is_single_link = of_graph_get_endpoint_count(node) == 1;
-
-	return 0;
-}
-
 static void graph_parse_convert(struct device *dev,
 				struct device_node *ep,
 				struct asoc_simple_data *adata)
@@ -231,7 +126,7 @@ static int graph_parse_node(struct asoc_simple_priv *priv,
 
 	graph_parse_mclk_fs(top, ep, dai_props);
 
-	ret = asoc_simple_parse_dai(ep, dlc, cpu);
+	ret = asoc_graph_parse_dai(ep, dlc, cpu);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 25aa79dd55b3..542c4a114940 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -353,111 +353,6 @@ static const struct snd_soc_ops graph_ops = {
 	.hw_params	= asoc_simple_hw_params,
 };
 
-static int graph_get_dai_id(struct device_node *ep)
-{
-	struct device_node *node;
-	struct device_node *endpoint;
-	struct of_endpoint info;
-	int i, id;
-	const u32 *reg;
-	int ret;
-
-	/* use driver specified DAI ID if exist */
-	ret = snd_soc_get_dai_id(ep);
-	if (ret != -ENOTSUPP)
-		return ret;
-
-	/* use endpoint/port reg if exist */
-	ret = of_graph_parse_endpoint(ep, &info);
-	if (ret == 0) {
-		/*
-		 * Because it will count port/endpoint if it doesn't have "reg".
-		 * But, we can't judge whether it has "no reg", or "reg = <0>"
-		 * only of_graph_parse_endpoint().
-		 * We need to check "reg" property
-		 */
-		if (of_property_present(ep,   "reg"))
-			return info.id;
-
-		node = of_get_parent(ep);
-		reg = of_get_property(node, "reg", NULL);
-		of_node_put(node);
-		if (reg)
-			return info.port;
-	}
-	node = of_graph_get_port_parent(ep);
-
-	/*
-	 * Non HDMI sound case, counting port/endpoint on its DT
-	 * is enough. Let's count it.
-	 */
-	i = 0;
-	id = -1;
-	for_each_endpoint_of_node(node, endpoint) {
-		if (endpoint == ep)
-			id = i;
-		i++;
-	}
-
-	of_node_put(node);
-
-	if (id < 0)
-		return -ENODEV;
-
-	return id;
-}
-
-static int asoc_simple_parse_dai(struct device_node *ep,
-				 struct snd_soc_dai_link_component *dlc,
-				 int *is_single_link)
-{
-	struct device_node *node;
-	struct of_phandle_args args;
-	int ret;
-
-	if (!ep)
-		return 0;
-
-	node = of_graph_get_port_parent(ep);
-
-	/* Get dai->name */
-	args.np		= node;
-	args.args[0]	= graph_get_dai_id(ep);
-	args.args_count	= (of_graph_get_endpoint_count(node) > 1);
-
-	/*
-	 * FIXME
-	 *
-	 * Here, dlc->dai_name is pointer to CPU/Codec DAI name.
-	 * If user unbinded CPU or Codec driver, but not for Sound Card,
-	 * dlc->dai_name is keeping unbinded CPU or Codec
-	 * driver's pointer.
-	 *
-	 * If user re-bind CPU or Codec driver again, ALSA SoC will try
-	 * to rebind Card via snd_soc_try_rebind_card(), but because of
-	 * above reason, it might can't bind Sound Card.
-	 * Because Sound Card is pointing to released dai_name pointer.
-	 *
-	 * To avoid this rebind Card issue,
-	 * 1) It needs to alloc memory to keep dai_name eventhough
-	 *    CPU or Codec driver was unbinded, or
-	 * 2) user need to rebind Sound Card everytime
-	 *    if he unbinded CPU or Codec.
-	 */
-	ret = snd_soc_get_dai_name(&args, &dlc->dai_name);
-	if (ret < 0) {
-		of_node_put(node);
-		return ret;
-	}
-
-	dlc->of_node = node;
-
-	if (is_single_link)
-		*is_single_link = of_graph_get_endpoint_count(node) == 1;
-
-	return 0;
-}
-
 static void graph_parse_convert(struct device_node *ep,
 				struct simple_dai_props *props)
 {
@@ -512,7 +407,7 @@ static int __graph_parse_node(struct asoc_simple_priv *priv,
 
 	graph_parse_mclk_fs(ep, dai_props);
 
-	ret = asoc_simple_parse_dai(ep, dlc, &is_single_links);
+	ret = asoc_graph_parse_dai(ep, dlc, &is_single_links);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index b5ac0f0d5e8e..6a3c9e4e1cfe 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1019,6 +1019,111 @@ int asoc_graph_is_ports0(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(asoc_graph_is_ports0);
 
+static int graph_get_dai_id(struct device_node *ep)
+{
+	struct device_node *node;
+	struct device_node *endpoint;
+	struct of_endpoint info;
+	int i, id;
+	int ret;
+
+	/* use driver specified DAI ID if exist */
+	ret = snd_soc_get_dai_id(ep);
+	if (ret != -ENOTSUPP)
+		return ret;
+
+	/* use endpoint/port reg if exist */
+	ret = of_graph_parse_endpoint(ep, &info);
+	if (ret == 0) {
+		/*
+		 * Because it will count port/endpoint if it doesn't have "reg".
+		 * But, we can't judge whether it has "no reg", or "reg = <0>"
+		 * only of_graph_parse_endpoint().
+		 * We need to check "reg" property
+		 */
+		if (of_property_present(ep,   "reg"))
+			return info.id;
+
+		node = of_get_parent(ep);
+		ret = of_property_present(node, "reg");
+		of_node_put(node);
+		if (ret)
+			return info.port;
+	}
+	node = of_graph_get_port_parent(ep);
+
+	/*
+	 * Non HDMI sound case, counting port/endpoint on its DT
+	 * is enough. Let's count it.
+	 */
+	i = 0;
+	id = -1;
+	for_each_endpoint_of_node(node, endpoint) {
+		if (endpoint == ep)
+			id = i;
+		i++;
+	}
+
+	of_node_put(node);
+
+	if (id < 0)
+		return -ENODEV;
+
+	return id;
+}
+
+int asoc_graph_parse_dai(struct device_node *ep,
+			 struct snd_soc_dai_link_component *dlc,
+			 int *is_single_link)
+{
+	struct device_node *node;
+	struct of_phandle_args args = {};
+	int ret;
+
+	if (!ep)
+		return 0;
+
+	node = of_graph_get_port_parent(ep);
+
+	/* Get dai->name */
+	args.np		= node;
+	args.args[0]	= graph_get_dai_id(ep);
+	args.args_count	= (of_graph_get_endpoint_count(node) > 1);
+
+	/*
+	 * FIXME
+	 *
+	 * Here, dlc->dai_name is pointer to CPU/Codec DAI name.
+	 * If user unbinded CPU or Codec driver, but not for Sound Card,
+	 * dlc->dai_name is keeping unbinded CPU or Codec
+	 * driver's pointer.
+	 *
+	 * If user re-bind CPU or Codec driver again, ALSA SoC will try
+	 * to rebind Card via snd_soc_try_rebind_card(), but because of
+	 * above reason, it might can't bind Sound Card.
+	 * Because Sound Card is pointing to released dai_name pointer.
+	 *
+	 * To avoid this rebind Card issue,
+	 * 1) It needs to alloc memory to keep dai_name eventhough
+	 *    CPU or Codec driver was unbinded, or
+	 * 2) user need to rebind Sound Card everytime
+	 *    if he unbinded CPU or Codec.
+	 */
+	ret = snd_soc_get_dai_name(&args, &dlc->dai_name);
+	if (ret < 0) {
+		of_node_put(node);
+		return ret;
+	}
+
+	dlc->of_node = node;
+
+	if (is_single_link)
+		*is_single_link = of_graph_get_endpoint_count(node) == 1;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(asoc_graph_parse_dai);
+
 /* Module information */
 MODULE_AUTHOR("Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>");
 MODULE_DESCRIPTION("ALSA SoC Simple Card Utils");
-- 
2.25.1

