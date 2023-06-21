Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AE1737909
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 04:21:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C1C383B;
	Wed, 21 Jun 2023 04:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C1C383B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687314086;
	bh=xoAgHozFrR0HGhXz8E6fIPRZR0WTIDZmcZWgQQbBx60=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ucevG5g3bKYEq69PeqJgcqTnJu4PkZGWOKcuLkQb0zK/EEldystRqEHBJuD+zEiYv
	 j6QGiqtUDp0Sc7JgKplkMCpxU4T7ETcvE4yGm4zXyZosNNvBZrkKcU4K5b/VrS5p9T
	 7f63mfqIhEGcg/iAtwYJuStph9YT+m/m3H+SPGNc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DE12F80163; Wed, 21 Jun 2023 04:19:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1DF2F80169;
	Wed, 21 Jun 2023 04:19:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F31AAF8055B; Wed, 21 Jun 2023 04:19:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20709.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::709])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 834A7F80022
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 04:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 834A7F80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RyG7eq3C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PbT/pQIxP4VZcfej5IRUWmpKHb2iH/tuUwri9adY5wmjSp6hTELxxx8GvYZzjo5TaV4M5o5WgA0ULuN492Xgp1W0uoRRllGma9XIjOVaqvmVt/R10f/gqGgBOFlj4uVQDa84CJ2wNDm9Phjvzu+nrhpe1nT6fgVCl81ka+9oDqe3dpEW0BZiraRvw42vViNduBsVEUhwHeMh/sUTd2KGCVbf5sD2DMmvnYe3+R4U9Gf6YvGbxt34aPDVHIJ27YbHWsq56cxFodfdj7XZYGoaelqhB0NqYxQGopXyf6FdGFcOMLWPztqsseA6gneRESfrpx9JM9Hvk1JBsiS6L4ZpdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+z96GYYGa7qPF1z8yFQHXha/8a3v1mDxhTgodkxhYM=;
 b=N5QzN8fSE6utIxd8tVEmRneqBbxing/WpenR+DMwS8FCdXNrwnzQWkJ9v7Kt9hzSGSCqdG1oY4LLomiKY3ghc7Vz97IKoj2i77EpFTFJBWkMeWXoBlJyS5yEhZkvnQVTw6CQCJw5Bt5MnkdH1MmUmPW1yuKwtpLguNO8myt+/0Hzw0/y2e9/U/qGX+BylxmEsvNExAAwtVIBq/o/VYGEGpdUnzELBAbPlBC2uPRzgwDndjguPMRBV6rOgzmEfQgwkL8WHvMjRSil5uX97tUd8kvvMX1LGXNTrADU0An1wcNT/II1cXmhnRemsAV2ZzkI4Vyk4DjC3yR9+Km1BRLFeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+z96GYYGa7qPF1z8yFQHXha/8a3v1mDxhTgodkxhYM=;
 b=RyG7eq3Ct9EMZkgKXKT02yzgwuDyNqDEGajymhIl/SD3nGps/hM7rAcICXd4D4vvcnrwBy6q3gl7UKX97B0ofEAUfXt4WKCWDTMnCHu4UYTJV+IwsGCgdTQVR8aryJmk1UN6nRRF+WP8IPJCsfB8aD37Q/ifMKsuqmqZKSWrMOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9694.jpnprd01.prod.outlook.com (2603:1096:400:230::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 02:19:07 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 02:19:07 +0000
Message-ID: <87fs6lblr9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/14] ASoC: simple-card-utils.c: enable multi Component
 support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Jun 2023 02:19:06 +0000
X-ClientProxiedBy: TYAPR01CA0150.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9694:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c73586-e4bb-4c4d-d059-08db71fde3e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H9SBD0uL+JATgyardNQ1daB3n8J0/Y05flWwXtvzLFTz+0zFnD/nL7KtcQbKNR9JCevRWgQWm3ip5LzlYdGWDdXtrz2kMs0G986j0uRestf4pcx/iKdV9zI60BGljChGwDjZJO2ubbjLI/NVVqsUgZawrtOBedTFVJqQ00mORjEg6tMhLgdywe3hq3eUGo+zRIpvQ+JUcEko3TJelkrsrevPiBj2wVjNB+ieVPAI+xiFAlEix3IEeNDXTDGkhy3/PmbihysEpdlvff55HR/dqblsxqL2+tE454C64LCggwzHZC2tB03wpNnAQ6H5azc80eLSzzu2fV50orZpd5/HyvWoKZkaAXjolrewzg5Gu7cPgLyA6ZVRud9VCGP2zd1yVH3mKTkut7be0Hlz5WomM9wCCpFk0vIi7leWPzc5G5szaMGYyCfX3700+DdnRSfC4V3nv4ZIG44KAP3ywPvNS5U4g4KCBiHEvIZxo2p7arnoJWWsD+67mHCSBYS0KM2/A2ImPAF2/IMrGM4/IG6+oTH2ZruOPRwayGQPlJOlKGAnKYcWbbtpSlC3RldJ3m3yTb/nOSsGeMU6d6sANd4SkRjdqlCN5li7Zld2sfE4MoELgD72cw621UWsakTlbaT4
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199021)(36756003)(66946007)(66476007)(478600001)(83380400001)(52116002)(6486002)(5660300002)(86362001)(66556008)(2906002)(41300700001)(8936002)(316002)(4326008)(6916009)(8676002)(186003)(6512007)(38100700002)(38350700002)(6506007)(2616005)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BModlJGOLv1MuIs5yztFvpCpof8uD2RKhNd34qhtfLeBPAtvxMxW7Z7TC7iT?=
 =?us-ascii?Q?ft1ITThSaeJPwEd3q0o5LHY2+psIQEvwCJtfOgVizImGHkMP73WQ8okMROqH?=
 =?us-ascii?Q?adASSeugBFUbhSSUTYdBL/YjC2Mw25XQqN6Aenp77UXXdgu3lO9Wmm1qgQU6?=
 =?us-ascii?Q?81gSYmPObYm6nTi4DG1MNf74DUIWSnxOvlqM4smalbTY5tM8zSwprcNSPjac?=
 =?us-ascii?Q?6pb7V+wGOMW8Y1E6GIgSG143clNHn1Xr+UaM2S1/tbKe46Jj+rNCGPzEbvtZ?=
 =?us-ascii?Q?0ztthWDKfKAUm+4U3vFGQlVOBTpwledFABLizyoiT9ueQHQM16oxBKh3JckR?=
 =?us-ascii?Q?viNyiknbBwcCzj9ACjtq5ZD/BcrygJ5hmuLNj/zA/K/m92uDN057xON5Sj+W?=
 =?us-ascii?Q?Espqn1V6OM2SpAJyRJA22HJ72FDbq/5NPknS8h9lMxDgzeq8n0FPJ0ZqM2uX?=
 =?us-ascii?Q?35PmwUSoEHjlsRRHNZrT9P4RZta1k5haZoS0egvnwXoWP3tzTCoUCwNuyvyO?=
 =?us-ascii?Q?LU7VnO61SoJANFYfG5ZPas6OYAQsT7Qy//NXB9wxpw/2mXiEvG7X0iIS2789?=
 =?us-ascii?Q?+McfuSpt69ulC/wrcFBnsW/6T8gF/imhs2hNToFN1ya0I+LQ2ekNb5KHjOwk?=
 =?us-ascii?Q?bEwXqRFHcyW7X4GlvQ2yj4K2S5zGnwskmxvnKHOxDh5Ffhiu1LpFZSg1fnut?=
 =?us-ascii?Q?+ATBZGkNKyP27IDrrxj2m7seDtA+yWKhiCakBd03ANBdXkDy4T2hfdY1cuwz?=
 =?us-ascii?Q?F/4oo2UKX3SjuVjYTbA31ToJt6Fx6/qekE6fHTiOvu+Jo0crkUZQ8C4N8dMI?=
 =?us-ascii?Q?S6u6BK86Mc45KTHKUX5IPWdv02rWdq4MH+6pgm0lcLZARH64/EWAJWc10j7N?=
 =?us-ascii?Q?q5OWlKw++H9jq+Gu4EwKhtHcPDiyE/XscgkXqSHaynovUu3fyobm69XYtnAw?=
 =?us-ascii?Q?jh0Bh8aiNzrYrj49B6bfWeIryzSV/5zzCVbBQ+7FNbFiiHPVus0N2AoqJdBV?=
 =?us-ascii?Q?9YKyKhLOnxMSu5QKUauiCEl01gT7JLXmnIozce2cHR2ZRCre6IwWjIuBWMy4?=
 =?us-ascii?Q?x7XYAN8TYf5CgRs1ZOQwsQFoHOY9SHv0j8EXa3ahn5In5NGf+3YUJJqwcHAu?=
 =?us-ascii?Q?PpoGVlgXgiSk9dQmNnrE/GUnkp80GQrAWVj7Fov6pWzKPQMOALGkVXzayuKM?=
 =?us-ascii?Q?HT3EZNYyV4ei0cEho/CykQ0Gd3XXCBOur6Q6GqlpP5ewrDLO9KeR9LWtA8uL?=
 =?us-ascii?Q?iFloxZ8tajWp614O41zISGyEkYEgeAApQa7VZG3DrVksgFbeSYSk/iAGi8UV?=
 =?us-ascii?Q?hGhQBmh0/g1ccQbZe0kTx7YEONv5x5is36k9njiR/QO4EpVNwst2Lj2PcWsm?=
 =?us-ascii?Q?Wck3duodRzfhTqrHaeNVBW4P1Z+jIuSMyeo3bKt5Eu06OOygT2MX6ZUQiBah?=
 =?us-ascii?Q?4UQZQtm2mViQQpo5lfhBMhqjo7dH7aiiSEehGeTNOmsXD0d1GO2hQnXPYnYK?=
 =?us-ascii?Q?LyeKnK/SNdAr8ndh+RRBEaL/jt4bbfLC4fRZq7s7V0po2OzVbv5iGfeu7JJP?=
 =?us-ascii?Q?pqhuNj37fZtd8otg1fJb+rvxQM+pqe8HNorKOzA2E1PqvvENoc1BpXbtgUGh?=
 =?us-ascii?Q?FMA8OAfJbEUrfbqnNEMxdH4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 44c73586-e4bb-4c4d-d059-08db71fde3e1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 02:19:07.5730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HIB/lC2uOQuMW2d4Q5YBxwGHoZOV+iZwRAFN9lJn0gKPcr5SIic8Wrm4Y3fAHdtnOcyGl7RmOUp9ZD7rGJc6YrEyv+ag5QNCD1q2MIzvrTBzNOTIHEEXmyzdh4fU5YNa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9694
Message-ID-Hash: O2NG3NNZXWTHH33ASLSRGH3W4I6ZYXMQ
X-Message-ID-Hash: O2NG3NNZXWTHH33ASLSRGH3W4I6ZYXMQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O2NG3NNZXWTHH33ASLSRGH3W4I6ZYXMQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If CPU/Codec driver keeps its DAI node, we can directly identify actual
DAI by using snd_soc_get_dai_via_args().
This means we can use multi Component.

This patch enables multi Component support on Audio Graph Card/Card2.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     |  5 ++---
 sound/soc/generic/audio-graph-card.c  |  2 +-
 sound/soc/generic/audio-graph-card2.c |  2 +-
 sound/soc/generic/simple-card-utils.c | 21 ++++++++++++++++++---
 4 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index b450d5873227..d1a95bc33c56 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -192,9 +192,8 @@ int asoc_simple_remove(struct platform_device *pdev);
 
 int asoc_graph_card_probe(struct snd_soc_card *card);
 int asoc_graph_is_ports0(struct device_node *port);
-int asoc_graph_parse_dai(struct device_node *ep,
-			 struct snd_soc_dai_link_component *dlc,
-			 int *is_single_link);
+int asoc_graph_parse_dai(struct device *dev, struct device_node *ep,
+			 struct snd_soc_dai_link_component *dlc, int *is_single_link);
 
 #ifdef DEBUG
 static inline void asoc_simple_debug_dai(struct asoc_simple_priv *priv,
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index c6e0f9132193..0b8258b6bd8e 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -126,7 +126,7 @@ static int graph_parse_node(struct asoc_simple_priv *priv,
 
 	graph_parse_mclk_fs(top, ep, dai_props);
 
-	ret = asoc_graph_parse_dai(ep, dlc, cpu);
+	ret = asoc_graph_parse_dai(dev, ep, dlc, cpu);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 542c4a114940..98732468a992 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -407,7 +407,7 @@ static int __graph_parse_node(struct asoc_simple_priv *priv,
 
 	graph_parse_mclk_fs(ep, dai_props);
 
-	ret = asoc_graph_parse_dai(ep, dlc, &is_single_links);
+	ret = asoc_graph_parse_dai(dev, ep, dlc, &is_single_links);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index c142571992a1..5b18a4af022f 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -1066,12 +1066,12 @@ static int graph_get_dai_id(struct device_node *ep)
 	return id;
 }
 
-int asoc_graph_parse_dai(struct device_node *ep,
-			 struct snd_soc_dai_link_component *dlc,
-			 int *is_single_link)
+int asoc_graph_parse_dai(struct device *dev, struct device_node *ep,
+			 struct snd_soc_dai_link_component *dlc, int *is_single_link)
 {
 	struct device_node *node;
 	struct of_phandle_args args = {};
+	struct snd_soc_dai *dai;
 	int ret;
 
 	if (!ep)
@@ -1079,6 +1079,20 @@ int asoc_graph_parse_dai(struct device_node *ep,
 
 	node = of_graph_get_port_parent(ep);
 
+	/*
+	 * Try to find from DAI node
+	 */
+	args.np = ep;
+	dai = snd_soc_get_dai_via_args(&args);
+	if (dai) {
+		dlc->dai_name = snd_soc_dai_name_get(dai);
+		dlc->dai_args = snd_soc_copy_dai_args(dev, &args);
+		if (!dlc->dai_args)
+			return -ENOMEM;
+
+		goto parse_dai_end;
+	}
+
 	/* Get dai->name */
 	args.np		= node;
 	args.args[0]	= graph_get_dai_id(ep);
@@ -1109,6 +1123,7 @@ int asoc_graph_parse_dai(struct device_node *ep,
 		return ret;
 	}
 
+parse_dai_end:
 	if (is_single_link)
 		*is_single_link = of_graph_get_endpoint_count(node) == 1;
 
-- 
2.25.1

