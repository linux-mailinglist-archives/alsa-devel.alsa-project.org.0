Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0075B75E5D8
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 02:28:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27FD9204;
	Mon, 24 Jul 2023 02:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27FD9204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690158489;
	bh=8Su+tqEeeYpVjM3Jc3N/Qb4bDgW4DFXePuZm6cHq+ts=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tbxxFUrSoBbV0K5AFOIjYTuc5LeLfmysm5gd1/6XXnOAAVBQ041o5+tLxOtIgG46Q
	 6AWE3qKg1NCqevVkpnYhqu2VbXP0hoyZyM168RX+iyjWqSaD98qKGy8X5ZPxOivi44
	 BWivZlJSeL7a8G9IX4qzRecF6yZiL3ykKugAqr6I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5388F80551; Mon, 24 Jul 2023 02:27:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2695F80153;
	Mon, 24 Jul 2023 02:27:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B712F80549; Mon, 24 Jul 2023 02:21:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::728])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 983E8F801F5
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 02:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 983E8F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=XniQKHCY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8GVIfLgI+qQjHleTFA9sCfSslMB/luJ/3scXHHvleyRaK2K7Z7aBNbZFnCuf0XvNwBxSIa/jSdCiRMfG3yxhPz81XTmy1DkIzbJPqvco0P6D6IYS4qKJ+VjalUNR/gR/r6fMxfni3QYzXC7VyjS4NQft01TRMRuB1mlKUB2Irug9oevFLqGF91jgOuPXuXJdWX4CvVVDXzaZylvu5z4WLZjzK3rW4pevrH0BlwcMa5ejIrmfOQcND4WYRw10fRZQCuv5lQYo9ofhB7X514Tge3GAk0u8q5XQq0+vRUeiV6JPUIfWXX3rPYf0QB6L9XuaDKaqvELnNs66qeneT7RFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhEl3GMfXoWSN/+Hu5gK7wW3vMPVDfdRQW/p01UWKFA=;
 b=QKDHSkyv78Nd6vzQiAVhzsw/VsPXffwNnJpT07gqBPUftTc2t64gXZWOiF+C8mK+PK3x6tajIvuHEfSuQ1RBz4lxkNWQcix0ZTQQ9Bfef8d/EE0xkvm+aD982tkQ4xxSVW+F8QQmjb9S6MKTjZwE/ALzZa4cLkZS5mhYHZ6WExruPvypPf2w2nV2kVKMB1RE/Gh5FigxET+7jbejTPUJg4N0O+bOmmNtdBDP81xJNP4AxIL4MBVkIzScbV8Epg9dOmObWlkFExwshISwCjg9fT8zQoTsXmJhzSxqwX8ZCRpXtwp9UdX91OW+aN5+Y4wo4ILklLzjcPma9iQcBDxc0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhEl3GMfXoWSN/+Hu5gK7wW3vMPVDfdRQW/p01UWKFA=;
 b=XniQKHCYafjwaOQTs9WeK+rq0BYC2O6KFXOe6epB/ixrPvg2KFZ4EuPcXC2S0iwXXKT/OoXXEgB/I/p2DBygjsTOG8daPkLdRWkq3gKxPttRSY2DOq3ViXZCsQUBKx0onsasnZ4/yvlauucAdYweevrNisbIYjWgpC2VVcsxVdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11420.jpnprd01.prod.outlook.com (2603:1096:604:234::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 00:21:31 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 00:21:31 +0000
Message-ID: <87v8eab1md.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/5] ASoC: rsnd: cleanup rsnd_dai_of_node()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
In-Reply-To: <87y1j6b1ne.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1j6b1ne.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Jul 2023 00:21:31 +0000
X-ClientProxiedBy: TYCP301CA0058.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11420:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bae53b3-bc3c-4d1d-1869-08db8bdbee22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T3qR2jZbjEmhqPQRSHneWrAS21yuGrIkCOC/KL9JY+GIEtg1Q/0m9Aym4ONhMaN04iyYeFoKj2CP/DOFt60v9dWL3d14B6lS4devRK1abSw/66DbTkN+HgChiRYFMFXx2JMzeaSPiFMZN6+4Xq1bJMVjzVGL935TQyvAfXfwuIqCWX8iar/8qPWH6jA4bhSb2v++F90EXhQ12DXGK/h5+dZF84zGPKikcwEFrP4Z9VbcOfLGPWmlzOhDuNTa8yYMLNOaF+N8h8FUYKovXeuMmVm1wASjz5awIKqFYd3345e8QQLCXFPXCTWZFwJ6ZJkrSxiJ/4Y1Pzve/zUB2NsSI/t1FJvHcEdSua495YN2b0BFc5U6kvrZaXgR/sLAzkrORW90OCZiijzxwf2HDoO/ReEHIFxNW4Ojw3V9LoopoBrYJhJtU6QeV3kdHZBYBUGZ/MAxMfsf1LMoSyt8ccasSqGqjRZq/jWMu5JNlIto9Yn56zsD9B11XC6YVyXShMd89DcyKiIV+RyHKd1eUa4hfdfUS/v90w1C+YOv5DdT1BZ7WhCStOHb+cZMSvvKA0G9pJ+NPrhiz+eOdrFV4jTAhwokolV4WbO1Kz34E+37DlyhjtG/KhhIG3v0j6Eol+tC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199021)(2906002)(38350700002)(38100700002)(6512007)(83380400001)(186003)(2616005)(26005)(6506007)(5660300002)(86362001)(8936002)(8676002)(36756003)(478600001)(6486002)(52116002)(4326008)(66476007)(66556008)(66946007)(41300700001)(316002)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b3PJA76M9dm7RwdPuUYWzbtZvlWwdE8oJt7fUrwIAlaDciV44lXSz/h+LAL+?=
 =?us-ascii?Q?p/3Sh06IBkFRbRcxlmlbaODaM4xmYoQZDXK6aZP4HyvHHmmxbMEmP6Z+93IN?=
 =?us-ascii?Q?owQhOWwnBeVRgxsQjtb611hHH/a92QTqdhmJom/Afzhe8og/WezGAkVfKeSl?=
 =?us-ascii?Q?FM9x0PFvwmazXAWu78b/S2HWJe1grHD5koIl03fLFQnMwLqUOeKcTC94/cTH?=
 =?us-ascii?Q?5KtOwI8Z8XyNI/4nH4rAZ42oAAk25ya8CaFWVS77uwyh6187ePgPExQ6JQk0?=
 =?us-ascii?Q?MNV+jGt7R1pk0QJ+6+UNLg14uRtjUI0fcZahShjzfMbYAlmgru93VtOC1fby?=
 =?us-ascii?Q?N1wMGf2erKp8sScdv5fSUE5thfWr/AK9JFi1nNI6J3vtMlA/hstiiXckQ8iA?=
 =?us-ascii?Q?KYkA7N7l6mVsOb0g3OYgxqig5x9ktRllmdnyPKwkWd7OXzyjcialBGdTIfPr?=
 =?us-ascii?Q?g2CAUwLwpxB5/kB/0SDYjFr20Q/ntyW7DZTIkaBYDJbH1sELh9v58zZHtJdn?=
 =?us-ascii?Q?1aVzo57j9jivn+2OqDa7qo90r3ghvCCSOJ5hWv2cLlUkm2priZmDkT/hXAmW?=
 =?us-ascii?Q?8jE2wJx5rBll53u1dFIk8wS20fq1OR5AVjKeew2eb4ReRJSbpWQoeprf3KFu?=
 =?us-ascii?Q?YnRhBKh9pPGFP/LxReCd8ooZs1Nkb6BBxq8m8KQjbc0RoLenSXvcpDFgbPVP?=
 =?us-ascii?Q?jvEtAQrhv2OH+iOt/wAAXql6gQ3BHABvYAqKNU8WDuU8l3i9HlOJKgXkQbRr?=
 =?us-ascii?Q?UfsXv1DCG9Ff7EJbZx//0bzFQkBhxkI1WYxtPlXIbZNo/SC+8VoHIx85u/61?=
 =?us-ascii?Q?H+/BnJIIYqsGQyviCzg/7U2CN9DYuC7zG04FoPvPB8p2VFopIDHjrjV8hk8y?=
 =?us-ascii?Q?Cthez9nsRU7Ac2e8ajm4ZHfmWDZWd6DQ/z4I/iQrQjHVYRTZrBLYEaPeESdJ?=
 =?us-ascii?Q?oEK7dhWcoT7BeJmtAVhggGZBOL5Ulrz8/NGBooKvPRGDBze8mVMyHHZa+tpA?=
 =?us-ascii?Q?0zxutyPMEonz0QYgbF9lSqYz2YBgX2ZMit4VEeJwy93JbSmyvWL/rw+8Y3d6?=
 =?us-ascii?Q?aV/eInWC19B0NpDz9ciuuG1eC6Z0JT4S8f3Yib4+qvBMqNAt/KkvlQyP4d4g?=
 =?us-ascii?Q?Cw3/7ZWCk1IdkiMchIak6chekZCwqwTz1S4+fwmVfo1LC850hr9car811d5d?=
 =?us-ascii?Q?7EG3kekQJ1mm2QkmyEEyJBNcZWVRF+gDMOwvM5JinPZGZGfN4ROj0MWmJXWH?=
 =?us-ascii?Q?kPhKNj+VVq9/eoV11EzejZ9ckuDpQHVstH5/TIiSG/N8p4QG8s5J4h+Ckr/O?=
 =?us-ascii?Q?VWvkUPLoJZONFeuSDoodnz7ocPmvfJk1tckRw3Hy/yq/Zt5AI5WpHhP9QBMq?=
 =?us-ascii?Q?Vyou9bQ3jPAWMaLG+X2BIe1KkJdRYhOrLfAJ7oUalajrnskMZjQgjh03eK21?=
 =?us-ascii?Q?j7VI64t2RCSzF+kVqAu8OGIqXbyYDQ+YP/C5HknX8+igwBICdguatEsQ2DiL?=
 =?us-ascii?Q?B7edBiEV45tSSpR/sTK8BGwp/d6lVp34Xx4Tq2fRtxOR+V1MvpMfL6aj5ES/?=
 =?us-ascii?Q?rCfgXVPRQCIsXbsrvx1HjDYmgwpNjxdacX1ri5dp/8rkZE6zmtvjZ6KZ3ofS?=
 =?us-ascii?Q?JiPmC259CD9G1BMocd11j74=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2bae53b3-bc3c-4d1d-1869-08db8bdbee22
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 00:21:31.3242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KTJVCoyIduk0759lcT7nhnrlfcZsAswb7xa+CsiHGnQND6njMSjvcPFyehELJWVk3H+AK4ednRJtwlRvr5RCtzGbHCWVzYriXHG2xFDA7QySHqEEeYr8PEFcNY8Gvw9N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11420
Message-ID-Hash: B2HBQCDM74TGBSEQRKE6Q4CFKPQFMOIA
X-Message-ID-Hash: B2HBQCDM74TGBSEQRKE6Q4CFKPQFMOIA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B2HBQCDM74TGBSEQRKE6Q4CFKPQFMOIA/>
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

