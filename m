Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F140C73790D
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 04:22:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 865F3847;
	Wed, 21 Jun 2023 04:21:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 865F3847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687314157;
	bh=8Su+tqEeeYpVjM3Jc3N/Qb4bDgW4DFXePuZm6cHq+ts=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XFLJbLBOJmoADyb53BySUsjtF71qt4motmy8HXCwo+C0hjHfdrL1lk+RHVbw8DQa2
	 TCePVosTxBK7zMNNjvQNFiXQN44M2VaDIBYVIRGqqYGQnJy5cU6dMsAVZGHCuL/G07
	 GqEZwrcfofu3LStdVR1qngjQqSJMxjpi85aBjofk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06298F805EB; Wed, 21 Jun 2023 04:19:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA550F80535;
	Wed, 21 Jun 2023 04:19:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86DB2F805E0; Wed, 21 Jun 2023 04:19:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D40D1F80551
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 04:19:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D40D1F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=C7S2UYpx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiGP2mU2WqUCczgO72iVF7vH1HKFHiqAbgU73neJ1mZDOB4vHk4us/rNNvJEfSpyWLOrHWFma81iC8QX02kX80CKxK+RSmJFBOy6zIgiPqhRCRTBtWHx3l+/kdSNQN0X8nvNzhnFLi7QGPuKiMeN9cTEE5ab1bnRwMu2ZQiUw/TZXEfkTfM5A0bjpfLJBru+pzffadjDWNf/MwbL2tKC/kdAJATOSX/51YoatfcorJgeqNqd7DsDzD8Ip8Ko91CrgLbFq5nZAFupctYSRtyp7AVENn6t9OU41MmPKPCfzqI8zXyJqf5r35aGKPjsogYh3LTipbo5qar5yk7btFNmkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhEl3GMfXoWSN/+Hu5gK7wW3vMPVDfdRQW/p01UWKFA=;
 b=PwTz49AAHYq9bOCjod8MdF6sGk4w3C84kYd96nrNG/kAgNl4ceQZWBSSVlVu5zFe0a5P9OvKQzDI2xakCUA/OnJyf/D1xGhD+ZsH8dHEgbCxhiD8aEJ1mVDvSPlBIJxw4Ws5iI589pYU8a1FTzuuzxeuETaMV6RCPIhQuwMtqodhl+LL+Tar/hglHn33HJ4b9zm/EccvEMLNwdCnFmTJ5qxJhUyXUP5Xi25H7o3SobShdH14Fl+BlCVeAmNiEn8VnrGHupjhG2p5W2sHFws0z1Hcq3lhq31i1l3575rCMeak672A1EFjWc2MA9oQCqnNUVybwIUjH+27qP1ffzd9Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhEl3GMfXoWSN/+Hu5gK7wW3vMPVDfdRQW/p01UWKFA=;
 b=C7S2UYpxL7IrFkB+5RKYKJWnr99vI67WJ+AxkrFVPuL420VEeX/ubFoPj/9E2cqrsiTGmmdSq4UW7VihzehijeROJBKSlcirJ02jES0m2vyra6pI37i1bFWEajCDfdWKzAqjalQM2uO6iVIQ+xkIU+CDmfBQ63TF50OLd78MDuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9694.jpnprd01.prod.outlook.com (2603:1096:400:230::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 02:19:30 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 02:19:30 +0000
Message-ID: <87bkh9blqm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/14] ASoC: rsnd: cleanup rsnd_dai_of_node()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Jun 2023 02:19:30 +0000
X-ClientProxiedBy: TYCP286CA0057.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9694:EE_
X-MS-Office365-Filtering-Correlation-Id: d60efca8-0331-4d9f-1092-08db71fdf1d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I37Zas7FaxVDxlHwASGgBnSiRqwUoSQYDPGjcY/OXC0Afg/zN63PLNxNjs1AjGMlFWrFXzwAimlhdugR2/gIbaKhFkvEGCq8pKjTNmVmX4GvsOQn+KbG7AgeNM5uTWCHYM5EsjG1PBAiKIAK6PNNjdpfHP/xIoHFwmW/H8IrSkq8DwrhpTBnkrFWI1F3AB3xC1r2eZs0yfggADxVs5GZE2a1sDYE4CcOhJc9dk85qs7/028q9Ne8bB/++nrKcZYPBia2wmLXJRR71sxRjLCm0o1b4aAwXialTbMkGvL0jcx6UUVyDK+x8CzLzyrGmbxi64pu5/6CbS94VZiBe9XHZHK7OWbAhhNkXstaMWCF8l6nivLEvcyC++MfytObAvh8Jcj9CLrgrw1kRpG53J6WG/Aeqf0rOWInzuZyo3zootliF8Td+WrfO3lt6SCjdFQCQ+wI8u6XmO/oI/3vR99I+LoKA1op7wCu36zWgm3mqNsrM2m4bZfdZuvEWH14SalHlG3eUP67sxXrVlIbp4P2X749lO+pQ8BBfdY7sqM6hagnMvB2sFjRpiqPBW9X2WQz+jpvYsOyNfHfB4ofLiPAfM89Vgw8yYUdZfcxwFrA8yGQ7Bq2yIb3q2IfUjXIb2Eg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199021)(36756003)(66946007)(66476007)(478600001)(83380400001)(52116002)(6486002)(5660300002)(86362001)(66556008)(2906002)(41300700001)(8936002)(316002)(4326008)(6916009)(8676002)(186003)(6512007)(38100700002)(38350700002)(6506007)(2616005)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WS/sffWCfnNqQ4eGHWyQZUuV9it/T3zRsGdJXfhwuRZ8QMkxC1giqCTC72t7?=
 =?us-ascii?Q?pw3XSQiyJ08P1fBhcMIJitvYHRYOr2L+dspe8YwI4fcZMI8U5MgzISWLtCKC?=
 =?us-ascii?Q?xsUpO/qfjzTB0hsj4VNJ6Icyid4DGRcUzVwRqpMcha5lKE8KuzqdC36dh9+x?=
 =?us-ascii?Q?58K1Cs6yLeuosI1Wf5P9OVqyJbhLZGAEb8KlH/krYmgyjOKoa0HBwVxW2x0z?=
 =?us-ascii?Q?wuNL64HHsif+M5/ZG8M8qJ2zKcpBdiU/bicWVOh4nhA5oa1CMxuyuhu3eqsm?=
 =?us-ascii?Q?U4zHIES0u67M4Q0WQ1IVAQw++MNVaD7nJVUbeVa8RxQzBT6JsQlOOxlfCFS/?=
 =?us-ascii?Q?IcwSGftAkfFdRvO28JZHPhfNyyVoENtIbtKeu7Gq2exQlxyKSyq4Dy06g4OJ?=
 =?us-ascii?Q?3mfAqCTox7e5sxQL9VNkSowisshkEuFpxRKBkB0d++uyNdpqC3TEIFsjvzyF?=
 =?us-ascii?Q?3KSDn9pcTxV/f4lVPQ7xNH15ZrnvBwkKdCrbxQy42Q2tgkEuisqYaginhgPo?=
 =?us-ascii?Q?SNuREj+pPAYjzGmVZlU3RZq6nXheF+cmT7pfPhI7UZg/cPlblZt3YzGJ4q6n?=
 =?us-ascii?Q?eQ59OeWF2XGUeWvHBDHjSeEraQHmc+3P0p+bEl/y5GufdWivha85jC0JfJq/?=
 =?us-ascii?Q?euoK1uL/Yy2IOglf1aN6WkVH/1lp2umBoV523Xq8XddWgIDOQ633nroSL/ee?=
 =?us-ascii?Q?m9C4XV+1x4hwaJ+yPgvY1JS4vrDjcLeZ0ie4EzcDUV5D7sQXggI2O0vTKV7p?=
 =?us-ascii?Q?RUElaWkojcs2rbgnjauxbajVckm40cwOFgp7OAegYvHEu3RejBaTtkfNgNLH?=
 =?us-ascii?Q?Zgfz4fc1bJr26EpAQgBOxdAFPPHh56jlamLc3GYy7RBuUFdpG36Abo0bD8oN?=
 =?us-ascii?Q?9bi8nQUfMz8F7E1hV6GC4o5la6CELk30a17dOpBR14sk/6fP29n4QeqKhVCi?=
 =?us-ascii?Q?Kpwh/m7mB4cS7E7UvAYNfey73Gp7vZI9s0VrwujGok1K5M1ZO9SILRi0Jczh?=
 =?us-ascii?Q?mXgtYoObl6D27SzBxlHT31OxSKTnHkY9DPz7IKQAICxTjWNo6gZhq4yCcZhK?=
 =?us-ascii?Q?0rgBYVtkp4srQHl1dhCFExhEcvbCCi1H1jAW91gC5GEjSubrgxv6YaEQa+BE?=
 =?us-ascii?Q?n10PodqFioGQimtGpvxvNcV6w3cjK/E6LXchZq6kbYa2sz+paIgf8z8s7lph?=
 =?us-ascii?Q?NNnaKZSuRqfjCBId7sIak/BwqGUXsVftMpq1MO1FxgX410ApD/FZXBgiKbbo?=
 =?us-ascii?Q?Vyw9FZR8wGZzEVS3C1EtayR2s+rgQDSP5ytL7+bQSmah8w+hYTjab5DJHimt?=
 =?us-ascii?Q?D6hJDAnys4OzyR41w4qnMAQw51NzkYxC8AH3qH+OUSL0IQAv444VNC3eW3V0?=
 =?us-ascii?Q?jpdAIHCdvEBtHsFQaOtHe/qZjiEhsle4HBDurxeir+38XmzLk2oXkc5qPK+5?=
 =?us-ascii?Q?++WOcSNfjOovoN/tn18m7BxDenzSY17kKAA+Li/UBH0cDobPN/xaZm+at/n0?=
 =?us-ascii?Q?KuKtu6QJ2EmtjL1Zq8Tt/GS6Y+PnXjnkGKEx4pBTZVI4I+aQVDkm97tJ6ZxQ?=
 =?us-ascii?Q?uL40CMGVBhUk8dr778N3PxCIH+Z9z75LbwvTCX6oCllzKjm2dXH9ORNFj1eM?=
 =?us-ascii?Q?x/PYyzNvFk/POf9x3vWcMFw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d60efca8-0331-4d9f-1092-08db71fdf1d7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 02:19:30.2540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FTLAX6hElHymwouYJwp0wNkDuGBeffmUtfxaTbrZrau9YiLK4iGExHe5SrWp8QOLjTILsZ51JE98+gSCm0QGSWua4gVS+ws5zT7jRijj8WD4ra4bhBJS9dtMEcLJ9B5B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9694
Message-ID-Hash: AX6RZOG53HRLHFTSRNA5G2VUU6YF6KXW
X-Message-ID-Hash: AX6RZOG53HRLHFTSRNA5G2VUU6YF6KXW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AX6RZOG53HRLHFTSRNA5G2VUU6YF6KXW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It calls rsnd_dai_of_node() to know it was called from Audio Graph
Card/Card2, or from Simple Audio Card. And after that, it gets
number of related DAIs.

To be more simple code, this patch merges these.
This is prepare for multi Component support.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/core.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index f3f17b784025..a87d7fa55f7b 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1261,7 +1261,7 @@ int rsnd_node_count(struct rsnd_priv *priv, struct device_node *node, char *name
 }
 
 static struct device_node *rsnd_dai_of_node(struct rsnd_priv *priv,
-					    int *is_graph)
+					    int *nr, int *is_graph)
 {
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct device_node *np = dev->of_node;
@@ -1274,22 +1274,30 @@ static struct device_node *rsnd_dai_of_node(struct rsnd_priv *priv,
 	 * parse both previous dai (= rcar_sound,dai), and
 	 * graph dai (= ports/port)
 	 */
+
+	/*
+	 * Simple-Card
+	 */
 	dai_node = of_get_child_by_name(np, RSND_NODE_DAI);
 	if (dai_node) {
+		*nr = of_get_child_count(dai_node);
 		ret = dai_node;
 		goto of_node_compatible;
 	}
 
-	ret = np;
-
+	/*
+	 * Audio-Graph-Card
+	 */
 	dai_node = of_graph_get_next_endpoint(np, NULL);
-	if (dai_node)
-		goto of_node_graph;
+	if (dai_node) {
+		*nr = of_graph_get_endpoint_count(np);
+		*is_graph = 1;
+		ret = np;
+		goto of_node_compatible;
+	}
 
 	return NULL;
 
-of_node_graph:
-	*is_graph = 1;
 of_node_compatible:
 	of_node_put(dai_node);
 
@@ -1447,16 +1455,11 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 	struct snd_soc_dai_driver *rdrv;
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct rsnd_dai *rdai;
-	int nr;
+	int nr = 0;
 	int is_graph;
 	int dai_i;
 
-	dai_node = rsnd_dai_of_node(priv, &is_graph);
-	if (is_graph)
-		nr = of_graph_get_endpoint_count(dai_node);
-	else
-		nr = of_get_child_count(dai_node);
-
+	dai_node = rsnd_dai_of_node(priv, &nr, &is_graph);
 	if (!nr)
 		return -EINVAL;
 
-- 
2.25.1

