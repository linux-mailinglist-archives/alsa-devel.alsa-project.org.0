Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A4C73790E
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 04:22:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 370A0836;
	Wed, 21 Jun 2023 04:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 370A0836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687314179;
	bh=JjE34Jd2But6De2FMN0iOxyj89atp8EwfCke625edjo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m0cQTKD9hIuA2tGRr5ZOKOhHaI7zyjw5SAGOeyQgrf2h1uZK5OKBQNjCQ/cxuzMbT
	 3JYe/kKIv7bLy4iXnvMA2RmI3XPlqrdw1Uh5+F6GQiAndKDcfod/Q/aIlelPxTrqeL
	 xXsGrLBbWi6uFp5Gtxwr3PFesUjpzKR0Pa1bsS5U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A712AF80607; Wed, 21 Jun 2023 04:19:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58C1FF805FF;
	Wed, 21 Jun 2023 04:19:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47CCDF80603; Wed, 21 Jun 2023 04:19:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20724.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::724])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82949F805E4
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 04:19:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82949F805E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=o8dS807y
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqAUngZXpNCPH7mXYCuXGs6nAhrQDzUVKC5oNcDZbecRkwNfEWHoMgaOCUBB/Ke3zUvY7SKBK8MApG7mFxYrwgl3h6eKpLNN1HooAfZYKqV+MY2MtJfd3b2f2n+6+z9pjPlGp6ZGcxNvUjvBqJiCvGgeJsGJ6oqervudoHih7c3ZK6/eBBGNhwKfbgs+WS2AiZ+2w1XkEOWz51dl0vc+IaVuo/omXSRkYIHCmzYcpbDvC7oNLOvdlybuGrtMG3kT2LwNp495w5X5vH8SwIYXGvbGsx9zQskXMs/Bq/FPbboi1Ws8RM5gEtAaryVH7R4GAppboJ1d/1RGY9yVFRkT9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XTRKCPjGgjyDxCAyPvubwyCywfxoXn/giWNhRXQ+/E=;
 b=BkXAUAl1yYDUIomrXKD6czLmuwkt8Y14gOxkmzln2LzR+ypUVyovU/WMEGXKAiD+QONO0VcVEEL3xPu8JNJSYcf3genS7/GAYsD4QsY/867eHxbmmHqeK2VNbw+HOyQvaMkvurJbTGBqBQz3TMLvQpzL9ub5KbKemVdkOR9roo8oGGbv9h3YxtgiB65w3MUv7do/0tZga/W0Bt51uK24inaUBm8pQwnZTfCnias/HqAh2VFdNdPU+W2rP1k7db1XAJOC9jk/OoqrZ1vGN79hpxMjTinlUcQ4b2T3XnEtGvBFhIkZCzokBZmNlGvSlaVfqiK8iD8J4js5pPPCaVodPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XTRKCPjGgjyDxCAyPvubwyCywfxoXn/giWNhRXQ+/E=;
 b=o8dS807yC/vElj/AbI81XogMqG6nD4d4O3GL+YgmQcUNqbLnV3Zxs9IEISsLhMU/k0PpJiUS4M0kBQaYoTBUbUEipzC5r7YjeTwAwYNg09m36C/8K09t9jZdDTQOtyrRd2R/+olY7EevC84yf0EEQk1fBzAqF6nw8FotXDKY8lg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB9694.jpnprd01.prod.outlook.com (2603:1096:400:230::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 02:19:36 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 02:19:36 +0000
Message-ID: <87a5wtblqf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/14] ASoC: rsnd: enable multi Component support for Audio
 Graph Card/Card2
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0q5blta.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Jun 2023 02:19:36 +0000
X-ClientProxiedBy: TYCP286CA0049.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB9694:EE_
X-MS-Office365-Filtering-Correlation-Id: 82f74e58-f700-4c68-f08f-08db71fdf5b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2E97hQyvJ3CI93Smv7xWgr+kj8WyTZeRk5OVNQeaip2oYgbsOChNR6aZZOQLHeYu9+pBEX0KfSbA7RJmkwwAzFbxuGHfdhzOlqGoHjtzN73Lbae9EQavOBS15f7SrRqPv8M6k3nSoVlJ8O1tAPpgm4YkV2MvW08daaBav9T7/Gd1Kxx50mU+BoMYeZDQsWIPUUmwgVjVmYEDO7mYCnA/B5VrGQv7jVvaMFmWIMnHl618y1ye5b8RlZHULkHxv7T1d/bWhCr6ZHuuGjTPX6mhYwIBSQ6O83y9rVP+qFMVP2MMJR5oFMwMdvytyK6WfoBzMzviLr0Qx6U7rKDldPQ+ahSZCAdzpdpHy6T+aGXC1DdrKq5P4GCdibRjKSpK818iFF4n9YKU7bUm8yOR6yg5LXjAm5faGNumgJXOgyXQuTm7v9grfEabKDXoqVOCRJGXa8QcunhEB2WN9dHP23IhO1un+R/j1N5jKFb+CaxQomq6BpveeYFnzCiJh2zBnctWdCzrna7LtuHOGiNDrBC9HE+JKFlToKMrtkZGN0bmQcQSZN8JmXviin8L0JToMoAM7VzhR9rd4dzvOeriju2dEyU6RtoFu0JflwzmebL2VMsoAG2CrHoRxFl8yYdSPryA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199021)(36756003)(66946007)(66476007)(478600001)(83380400001)(52116002)(6486002)(5660300002)(86362001)(66556008)(2906002)(41300700001)(8936002)(316002)(4326008)(6916009)(8676002)(186003)(6512007)(38100700002)(38350700002)(6506007)(2616005)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Mjvzryi3NoTl1IWVE9C0ghURq6+RJLe4BJCJEBLaU0sEmmtZogFllcWSKjAl?=
 =?us-ascii?Q?2A0aEj2s4IsSoks3Dw52rKs/C6VQyjsBgulDYlw2hZY1kGhdfMBSTLW3Hpnl?=
 =?us-ascii?Q?UBWor1FJDGQwGBjLoAssdWHqMCzQhF+75qSAVZojq5HFaEqJBjCgaOVRFUN6?=
 =?us-ascii?Q?K4Efyud0w9xA+m1QjoYdYx51ZGkGN2QLTi2q3mnBvZlpZttE/1oUYMZuJsPJ?=
 =?us-ascii?Q?yfSr/qFC/7QlgeJRzyuC4jpDSqwPizB6idQKVHz8s+NZ5Q9OT+tfaluV/4gX?=
 =?us-ascii?Q?RXdzkmvdBYT2g0J04DTn9zo1S+855AeEOWj4RcFTALZy52Aijo+XOn9f0Q1u?=
 =?us-ascii?Q?ReYsyIbm8BPld6SD1fV/iaq1xj4uZe2T4DA5rvdnBFvXFB7vv76ZUdj1qH/B?=
 =?us-ascii?Q?y6BEje20o1/8FoeYbClUIS1Nxs0mBJCMCP8jpIOhF0MOL6lT2pJBWFndcFIh?=
 =?us-ascii?Q?4MDlc7XervzwJjxi0KseXu2AYOjNNuWyfX2TwYcEqqdu/RK03/ABja4eTgJb?=
 =?us-ascii?Q?FoDWkRI055BrYqZenKIdvAUPsegZ055iv8gAKJ0NaDWRXPxW9kyZ6s6GAZCy?=
 =?us-ascii?Q?Q0dV6y+OSI+u77WpqRsEQ0mBddGdkZVHJJvAqe0RIl1wcSfnCnRPDP+EopqB?=
 =?us-ascii?Q?CnTQhg21xjT+VwX36HNugh0m7OWQ0rfeO7tsWhfp77sk2vkdTTdlsT+iFXMc?=
 =?us-ascii?Q?Vw1Ez78yvXjy9F2J9WXQ/17iOwc8vyiZQO1rtwiAVtYOz+bFEfbrUNxcIy/U?=
 =?us-ascii?Q?cciKal+AhofgXGKNk8iVk5qw/8BK3cJuV3pNRriSGsl8mwadTo28H05rKEoQ?=
 =?us-ascii?Q?NGIKms0SYvhRtVuuoupl/ilwrWn0OH+VEg1VBjuHYwV2xAAZernCO0M1YzGC?=
 =?us-ascii?Q?pEb8u6IbJFljRo2rYual4s/3Sk6j4iq7yGFywhbc20FDJHcSu5X940nkgnlE?=
 =?us-ascii?Q?UY3+tJG6YRMPu6FIIF8Q9mFTXm9ExVkdd2IgFUJJuXrfbxkuoR/XaAmxqGAY?=
 =?us-ascii?Q?B77g3nxYIK3w5HW9cOkVnl1r/ixg3Fc1u9Te+4zwZ/fHJEdKK1Hq8sy3ZOkv?=
 =?us-ascii?Q?ZOoXcLpDLg8yKSqUP5tHYmTi0k9nFF60amWyDtHUMskWk6x0uy2s5wFrQWDb?=
 =?us-ascii?Q?I0UYlhGxsA6kKbrAzeUiEp5zgc5BnPWLUt3z3m4wThk1InCRyfcFP5LdVmkQ?=
 =?us-ascii?Q?/zDKvzaV8y161gqHFkORHoRrMuvcsvpB73FK7Ruy7eGm3BIBnQ1YpuZ+U2g0?=
 =?us-ascii?Q?DvwCm6uez4dXLLNLCyJvxaL/rCCdlyNNzmCL1qfivxYvtJOhTYnT9NCyyWBa?=
 =?us-ascii?Q?gmMJXSjzGvLxR26+r2tgYXOnsXVwX0bm+2H6a4VcA6GsHQQX6/xWULSBk5NE?=
 =?us-ascii?Q?tk5IKi/Ji2VO1ypDXlGmoHh9jqsyXpVmecHRKNU8Vu5lhUduzaEc7cjYBr9u?=
 =?us-ascii?Q?VWll5FQ5n+h+qiFLaTN0c0Psei5hYpMyfqzwetjGIDyp38CDQardHo0GQhxc?=
 =?us-ascii?Q?z+5tqA6boGFj9Askhu9ipXMTn0yjsw/Jx1eVq2jQft0GYI8QFFL1EMZIE+s9?=
 =?us-ascii?Q?Td/dhPBhDabLZaZc4tuCQtMhkE3erPBMducR3twRXd66oKjBESJ3cR9GZbo0?=
 =?us-ascii?Q?jGGoLqsgeECV9Vjve8R0tfA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 82f74e58-f700-4c68-f08f-08db71fdf5b1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 02:19:36.6727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pVxsCh0YjJt+GaVUwKKIa+IJcK57ecGRw+iA/5SjBD62eUN60nW2vv2bYStQPbrwNRDoVfCR6OCh5frv7qIY70sKWOGNcC0emTVLB0NbyQKzlA/bIlUanzjbu8b2XUN5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9694
Message-ID-Hash: YGR2BHSZSBZ4TQYQ33CSWOE5AT7XBPRT
X-Message-ID-Hash: YGR2BHSZSBZ4TQYQ33CSWOE5AT7XBPRT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGR2BHSZSBZ4TQYQ33CSWOE5AT7XBPRT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

	+-- Basic Board ---------+
	|+--------+      +------+|
	|| CPU ch0| <--> |CodecA||
	||     ch1| <-+  +------+|
	|+--------+   |          |
	+-------------|----------+
	+-- expansion board -----+
	|             |  +------+|
	|             +->|CodecB||
	|                +------+|
	+------------------------+

In above HW connection case, we intuitively think we want to handle these
as "2 Sound Cards".

	card0,0: CPU-ch0 - CodecA
	card1,0: CPU-ch1 - CodecB

But, we needed to handle it as "1 big Sound Card", because of
Component vs Card limitation.

	card0,0: CPU-ch0 - CodecA
	card0,1: CPU-ch1 - CodecB

This patch enables multi Component to handle multi Cards.
To support it, it needs

	- Fill dai_args for each DAI on snd_soc_dai_driver
	- Parse DT for each Component (Simple Card/Audio Graph Card)

Ex) Simple Card

	rcar_sound {
		...

		/* Component0 */
		rcar_sound,dai@0 {
			...
		};

		/* Component1 */
		rcar_sound,dai@1 {
			...
		};
	};

Ex) Audio Graph Card/Card2

	rcar_sound {
		/* Component0 */
		ports@0 {
			...
		};

		/* Component1 */
		ports@1 {
			...
		};
	};

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/core.c | 134 ++++++++++++++++++++++++++-------------
 sound/soc/sh/rcar/rsnd.h |   4 ++
 2 files changed, 95 insertions(+), 43 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index a87d7fa55f7b..9f3d97bc177a 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1260,13 +1260,13 @@ int rsnd_node_count(struct rsnd_priv *priv, struct device_node *node, char *name
 	return i;
 }
 
-static struct device_node *rsnd_dai_of_node(struct rsnd_priv *priv,
-					    int *nr, int *is_graph)
+static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
 {
 	struct device *dev = rsnd_priv_to_dev(priv);
 	struct device_node *np = dev->of_node;
-	struct device_node *dai_node;
-	struct device_node *ret;
+	struct device_node *ports, *node;
+	int nr = 0;
+	int i = 0;
 
 	*is_graph = 0;
 
@@ -1278,30 +1278,47 @@ static struct device_node *rsnd_dai_of_node(struct rsnd_priv *priv,
 	/*
 	 * Simple-Card
 	 */
-	dai_node = of_get_child_by_name(np, RSND_NODE_DAI);
-	if (dai_node) {
-		*nr = of_get_child_count(dai_node);
-		ret = dai_node;
-		goto of_node_compatible;
+	node = of_get_child_by_name(np, RSND_NODE_DAI);
+	if (!node)
+		goto audio_graph;
+
+	of_node_put(node);
+
+	for_each_child_of_node(np, node) {
+		if (!of_node_name_eq(node, RSND_NODE_DAI))
+			continue;
+
+		priv->component_dais[i] = of_get_child_count(node);
+		nr += priv->component_dais[i];
+		i++;
+		if (i >= RSND_MAX_COMPONENT) {
+			dev_info(dev, "reach to max component\n");
+			break;
+		}
 	}
 
+	return nr;
+
+audio_graph:
 	/*
 	 * Audio-Graph-Card
 	 */
-	dai_node = of_graph_get_next_endpoint(np, NULL);
-	if (dai_node) {
-		*nr = of_graph_get_endpoint_count(np);
-		*is_graph = 1;
-		ret = np;
-		goto of_node_compatible;
+	for_each_child_of_node(np, ports) {
+		if (!of_node_name_eq(ports, "ports") &&
+		    !of_node_name_eq(ports, "port"))
+			continue;
+		priv->component_dais[i] = of_graph_get_endpoint_count(ports);
+		nr += priv->component_dais[i];
+		i++;
+		if (i >= RSND_MAX_COMPONENT) {
+			dev_info(dev, "reach to max component\n");
+			break;
+		}
 	}
 
-	return NULL;
-
-of_node_compatible:
-	of_node_put(dai_node);
+	*is_graph = 1;
 
-	return ret;
+	return nr;
 }
 
 
@@ -1365,6 +1382,8 @@ static int rsnd_pcm_new(struct snd_soc_pcm_runtime *rtd,
 
 static void __rsnd_dai_probe(struct rsnd_priv *priv,
 			     struct device_node *dai_np,
+			     struct device_node *node_np,
+			     uint32_t node_arg,
 			     int dai_i)
 {
 	struct rsnd_dai_stream *io_playback;
@@ -1382,11 +1401,17 @@ static void __rsnd_dai_probe(struct rsnd_priv *priv,
 
 	snprintf(rdai->name, RSND_DAI_NAME_SIZE, "rsnd-dai.%d", dai_i);
 
+	/* for multi Component */
+	rdai->dai_args.np		= node_np;
+	rdai->dai_args.args_count	= 1;
+	rdai->dai_args.args[0]		= node_arg;
+
 	rdai->priv	= priv;
 	drv->name	= rdai->name;
 	drv->ops	= &rsnd_soc_dai_ops;
 	drv->pcm_new	= rsnd_pcm_new;
 	drv->id		= dai_i;
+	drv->dai_args	= &rdai->dai_args;
 
 	io_playback->rdai		= rdai;
 	io_capture->rdai		= rdai;
@@ -1450,16 +1475,15 @@ static void __rsnd_dai_probe(struct rsnd_priv *priv,
 
 static int rsnd_dai_probe(struct rsnd_priv *priv)
 {
-	struct device_node *dai_node;
-	struct device_node *dai_np;
 	struct snd_soc_dai_driver *rdrv;
 	struct device *dev = rsnd_priv_to_dev(priv);
+	struct device_node *np = dev->of_node;
 	struct rsnd_dai *rdai;
 	int nr = 0;
 	int is_graph;
 	int dai_i;
 
-	dai_node = rsnd_dai_of_node(priv, &nr, &is_graph);
+	nr = rsnd_dai_of_node(priv, &is_graph);
 	if (!nr)
 		return -EINVAL;
 
@@ -1477,26 +1501,42 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 	 */
 	dai_i = 0;
 	if (is_graph) {
-		for_each_endpoint_of_node(dai_node, dai_np) {
-			__rsnd_dai_probe(priv, dai_np, dai_i);
-			if (rsnd_is_gen3(priv) || rsnd_is_gen4(priv)) {
-				rdai = rsnd_rdai_get(priv, dai_i);
-
-				rsnd_parse_connect_graph(priv, &rdai->playback, dai_np);
-				rsnd_parse_connect_graph(priv, &rdai->capture,  dai_np);
+		struct device_node *ports;
+		struct device_node *dai_np;
+
+		for_each_child_of_node(np, ports) {
+			if (!of_node_name_eq(ports, "ports") &&
+			    !of_node_name_eq(ports, "port"))
+				continue;
+			for_each_endpoint_of_node(ports, dai_np) {
+				__rsnd_dai_probe(priv, dai_np, dai_np, 0, dai_i);
+				if (rsnd_is_gen3(priv) || rsnd_is_gen4(priv)) {
+					rdai = rsnd_rdai_get(priv, dai_i);
+
+					rsnd_parse_connect_graph(priv, &rdai->playback, dai_np);
+					rsnd_parse_connect_graph(priv, &rdai->capture,  dai_np);
+				}
+				dai_i++;
 			}
-			dai_i++;
 		}
 	} else {
-		for_each_child_of_node(dai_node, dai_np) {
-			__rsnd_dai_probe(priv, dai_np, dai_i);
-			if (rsnd_is_gen3(priv) || rsnd_is_gen4(priv)) {
-				rdai = rsnd_rdai_get(priv, dai_i);
+		struct device_node *node;
+		struct device_node *dai_np;
+
+		for_each_child_of_node(np, node) {
+			if (!of_node_name_eq(node, RSND_NODE_DAI))
+				continue;
 
-				rsnd_parse_connect_simple(priv, &rdai->playback, dai_np);
-				rsnd_parse_connect_simple(priv, &rdai->capture,  dai_np);
+			for_each_child_of_node(node, dai_np) {
+				__rsnd_dai_probe(priv, dai_np, np, dai_i, dai_i);
+				if (rsnd_is_gen3(priv) || rsnd_is_gen4(priv)) {
+					rdai = rsnd_rdai_get(priv, dai_i);
+
+					rsnd_parse_connect_simple(priv, &rdai->playback, dai_np);
+					rsnd_parse_connect_simple(priv, &rdai->capture,  dai_np);
+				}
+				dai_i++;
 			}
-			dai_i++;
 		}
 	}
 
@@ -1926,6 +1966,7 @@ static int rsnd_probe(struct platform_device *pdev)
 		rsnd_dai_probe,
 	};
 	int ret, i;
+	int ci;
 
 	/*
 	 *	init priv data
@@ -1962,11 +2003,18 @@ static int rsnd_probe(struct platform_device *pdev)
 	/*
 	 *	asoc register
 	 */
-	ret = devm_snd_soc_register_component(dev, &rsnd_soc_component,
-					 priv->daidrv, rsnd_rdai_nr(priv));
-	if (ret < 0) {
-		dev_err(dev, "cannot snd dai register\n");
-		goto exit_snd_probe;
+	ci = 0;
+	for (i = 0; priv->component_dais[i] > 0; i++) {
+		int nr = priv->component_dais[i];
+
+		ret = devm_snd_soc_register_component(dev, &rsnd_soc_component,
+						      priv->daidrv + ci, nr);
+		if (ret < 0) {
+			dev_err(dev, "cannot snd component register\n");
+			goto exit_snd_probe;
+		}
+
+		ci += nr;
 	}
 
 	pm_runtime_enable(dev);
diff --git a/sound/soc/sh/rcar/rsnd.h b/sound/soc/sh/rcar/rsnd.h
index 239705d52517..43c0d675cc34 100644
--- a/sound/soc/sh/rcar/rsnd.h
+++ b/sound/soc/sh/rcar/rsnd.h
@@ -545,6 +545,7 @@ struct rsnd_dai {
 	struct rsnd_dai_stream capture;
 	struct rsnd_priv *priv;
 	struct snd_pcm_hw_constraint_list constraint;
+	struct of_phandle_args dai_args;
 
 	int max_channels;	/* 2ch - 16ch */
 	int ssi_lane;		/* 1lane - 4lane */
@@ -702,6 +703,9 @@ struct rsnd_priv {
 	struct snd_soc_dai_driver *daidrv;
 	struct rsnd_dai *rdai;
 	int rdai_nr;
+
+#define RSND_MAX_COMPONENT 3
+	int component_dais[RSND_MAX_COMPONENT];
 };
 
 #define rsnd_priv_to_pdev(priv)	((priv)->pdev)
-- 
2.25.1

