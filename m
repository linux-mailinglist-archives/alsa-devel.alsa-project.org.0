Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D47175E5DA
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 02:29:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 650E3204;
	Mon, 24 Jul 2023 02:28:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 650E3204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690158553;
	bh=JjE34Jd2But6De2FMN0iOxyj89atp8EwfCke625edjo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dzuywNFInBqmjgkfXjLGW9+Tm2Dao82PUKYtME0Ej0z0C9akxg907b7Xma5271NN8
	 sHD9rhOuXn+id7eOcZj/3iLysXaNvpYJn6mIzGEcyf//NHSIEUchu203u8PFm+wOLM
	 ZauCsIcYzkpXjFfegSVTllwzfVXcIBIVDqWNqYZc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CDA8F8057A; Mon, 24 Jul 2023 02:27:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D19BF80549;
	Mon, 24 Jul 2023 02:27:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5086BF80548; Mon, 24 Jul 2023 02:22:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78A95F80544
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 02:21:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78A95F80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=NkQAllte
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLtXj9Xkoxw4upLB1fez+x1E7xXG910MJ7hGs4+gLMPK7akHluNdwTQhilabXFPQZ4/APV3DHAkmLFdQCb8Eed/NdqQlwosWnGFAdRV+U/9gyNKWC0rZZKy7LnMgGhRuTfCUxSBCeZNs06FOsU6N7Kplhu8HBm8xlb54be2qdNAED6R+LHTgx/mvv+FucpU+m2qShIe1QCP3YI0VYL6TWyBN5ONEiftQKBT6qQNjRc2ySCJ370e0QTboeehOFVxSYBFdPtdH1i57ggUMoJy/yQPPSg43Bpvn9mlx+AKLyCbVg6Q7L6T92CWdo5wnyd6fK7DDMsuL9YOzAAUKW5+F6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XTRKCPjGgjyDxCAyPvubwyCywfxoXn/giWNhRXQ+/E=;
 b=D7cnWNxyKkleVbYteCwiJi/XVL9SgAmJLl5tBhm0/FBj5ZbFVz3PQCVL1ZCPYoZNBIASEUFmnXMgi3nzCkEJrcfZ/V0260OiLyj+hEOKWksm88k7zTuNvEO1QG+oO8BtlU9R3tf5cPtDGrevKigWjdu+YBecDqRy8ToRM0sC+/YhqanwS0Q/cd095r4wpwtfD5YiLRMI3rBYZek8kLuak31e/EYx/n3t1nSAxNTIthjanfDVee5kHxE3vic/K/ZE7R02d7Ffw9XtKMnzRk+vmhBoDkW5bYmV2n6Xm797dj43KHDl1+XL4XfSOMKdnaJYrIbCvIItjcfBupbGTyjVLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XTRKCPjGgjyDxCAyPvubwyCywfxoXn/giWNhRXQ+/E=;
 b=NkQAlltew+YGpYHqmQUXwxqxictexMmWx+8yqdlsHKdr5/RXhB49XG8fLdt2YthjJuksgqL5CIHrrPF4K1tZd+pB3BvOw5XXZ8BHzelOI0DB0W06D1cSzvd6fRN83XMKuAnjSerMusSHWZYyT8IPYqQ4zvMmH+Lr2Tnib1TFMps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11420.jpnprd01.prod.outlook.com (2603:1096:604:234::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 00:21:40 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 00:21:40 +0000
Message-ID: <87tttub1m4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/5] ASoC: rsnd: enable multi Component support for Audio
 Graph Card/Card2
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
In-Reply-To: <87y1j6b1ne.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1j6b1ne.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Jul 2023 00:21:39 +0000
X-ClientProxiedBy: TYAPR03CA0024.apcprd03.prod.outlook.com
 (2603:1096:404:14::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11420:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da539f1-2bd3-4a2e-9cdb-08db8bdbf356
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0SjccH+LTBbh3/xfdxM/byxoajawsuQbF/cxUo0tGMJ+q0FwRAb34mjZxW76EWEGPLObeNfdb8oKZKcBdjDz1nkQOHf89W+9qXoay+YyMc8KG1JEusgCRbijhahYnStQ8nnLuPn4Sbm/xes+JpRV6ImzjSkLSq0fZAtd581kQFls8IQ2omIvUXOyB5DX09I1osPsiGIm+1MmUD5rcqovWtb/N6BIg7r8VqR04nB89xxz8XGrQHD+v1bUlutbjpsrFENUk9V2PNrgwJrMTHt2CNwWK3CMjrIjAQ9twdjS/6h/qwqXGnc7u99w7CoJ/Cd9dDgfryP8uwVqdYZ3cWDNTO4O2OgQxfk7QV+cpZ8WK2uI4V74TrdNyl3gejMwEufz38awxh9tn5BbhfYE+G4qjCKmTgjnqssObdUmxOx7mTu5jnebZdMlHpDf/guYteRN6sGaLlxVcP+C/kvJkxSeVdlWYkHQ23meaQSLFRuRlahEoyuWKitf99jiAL40cDCjjNf1ab1PK6yPK1mHUTc9qBsuCI83gPWHgsWirmSO8pkMaEC/x1SarLHoCY6f4Wvhvk9taUosVcpp6vy/jMQUUAFpjHcy6F/8sxNEfU8ldU1FQ+qLVcJafhd6fhP8zuL+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199021)(2906002)(38350700002)(38100700002)(6512007)(83380400001)(186003)(2616005)(26005)(6506007)(5660300002)(86362001)(8936002)(8676002)(36756003)(478600001)(6486002)(52116002)(4326008)(66476007)(66556008)(66946007)(41300700001)(316002)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tKRu/DeOBQ6jIV0f0UoPJ72cBwh6Uf5Hq2Ya7gk7Bke8ehot4ctp+/3Sfhz3?=
 =?us-ascii?Q?iONMMv/DXe+8pnUEwMa0IWuo+gJw1Ddx5yjYPuYe4k3V5fzhnBrYIRbgERqM?=
 =?us-ascii?Q?cz2HyBWLTF0RLBDK9nPxC3lyISZfecAx6P9WQN9VZF2MBIOyNezsiQ/7N0vw?=
 =?us-ascii?Q?mvlO5UFvMzArH+4bUEH2SkN0wenHt+63M/TFZ66uldehI3JDSiWdpPGpPDYb?=
 =?us-ascii?Q?TEgg9U8ARqtmBkTNNvvTlrYsgBcYzNOlqNvCh11W3i1M9q2Jed/LHS0KgbmD?=
 =?us-ascii?Q?iUB0A0jEyqfCdW6TzZF818f1qNjWESLK5IG/T5VzRlMQzTD8eqEbiA2LBT5S?=
 =?us-ascii?Q?nuFWa8hZdzxac/D0zWXfOKto61+kdoJp8DrKS6ZbYagn4oAE2+7yvghuCcsr?=
 =?us-ascii?Q?EXGOYqfMUYvEkCR4ug5lTB4Z5A4zIwvGPQmFQOwZulbowinFtIJjljkRmgqe?=
 =?us-ascii?Q?BeVb4uHQO/hnrEO/7ad+Y1iLroS5n7LpMgW1OcoiGXTkTs31WoYz+Gnb9MZw?=
 =?us-ascii?Q?nag4zv7bXfZl5H2ye8XKDUQ5ocEXXCvHJm/typAvkYJlkn5/vYVELmwGZwOG?=
 =?us-ascii?Q?hUeaGHJuhgz7JXCzqv8KEdfOAVRohGRrjnMeYINKE1jY9pa16UEljEvWE4Xd?=
 =?us-ascii?Q?wMCHxjJcCHOviMf2O9a626HrHgBIA9ZfNQIlwvX5P+VFov2+ffqocNNM94zp?=
 =?us-ascii?Q?pzM5YA+xdQk2kRXmBWwnl4HZvlCecCNlhoyIJif2Ngduhhh5ddpLyBpYbUPf?=
 =?us-ascii?Q?e7k0xwkSnUOhU39AeGOsYKvAcDfoq757VNlM1HtbGRKVYW2Oafpu/HKk17dg?=
 =?us-ascii?Q?fVSEvhv8+yO2DGKqx7kuxLxpsiy2RzMznyoWO53rks5jI4r16ArpQuekkH1I?=
 =?us-ascii?Q?VTFPSo5/ruhgC+SUaSM1zBMix94RRDByn78gYr3/rC9ox/JKSalpW2YucEDc?=
 =?us-ascii?Q?H5X096Ca5EZwYBWuVWAT3tAVVdt7LcirD9RZ5WYh1rk8Yc/xlTYVVeK8Mf5W?=
 =?us-ascii?Q?Icn1b5K8fPav7FyKaXQY4UFRhicrFplCAzRklu13Y7bDlR/LidzTlAY6Sppk?=
 =?us-ascii?Q?KyKNyQEHcV9nfDulq8lF44jWCuaGjgLxzc19QOdTML7FKmSkGnlW1uLkKJLh?=
 =?us-ascii?Q?oVQHsTMD/tSZ99s0P6bOnvkWW2G1HF6PSTd9FiNhGn8bvnWr0tOAZYaTPKpy?=
 =?us-ascii?Q?leopnbr82hFNC2WKtTfuCkm+wKiZ7eBYjK6VfC6BFjXOyvMTBvLhByoC8pcq?=
 =?us-ascii?Q?iZZzUB33xZ777MdNXZ51MudTt4ekGWbygQmvhslff0CTK5Qf0xkl2ZINS+yl?=
 =?us-ascii?Q?+svrOZrOAJwTw92kGFUTugD3mRgp7XVhFoWoFJFLTE/v2yNJKYNPBzwFY6oR?=
 =?us-ascii?Q?Qx0SSvSBINxhYuOkJ5Vqd2LdMfZqvQl8TRzpMcyXOs3BD0DOoTsCWKvQuSMm?=
 =?us-ascii?Q?bpz20iLmOhg95hOahKLtDL2pXSdl1iqKUrEORY+zcZzf0E4C9IScb6k4zPMM?=
 =?us-ascii?Q?qcieTWvCqDXmxIOdkLzlK5kz/S2e0m0yD7aDut3vtbsE3Fa1Oqn30Dnka4j5?=
 =?us-ascii?Q?eHszsgqnaceyWvPX7zQ2mYSTfNZrKzmGWzOSedrfwcDf3+2PQ0oL2qDnrtuq?=
 =?us-ascii?Q?I+ssKhhWaCQ2fsXBeh7FYek=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4da539f1-2bd3-4a2e-9cdb-08db8bdbf356
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 00:21:40.1351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HaGehMQfDIzGqrd49vzDQrt8WCCO2puX8zLHugQI3loXs1f0OX3GQeN35MNhkavVBPuthgm2q/eBuIl/fF1zql3/1k+6buDe1SBPPCwbL8TrNPfdaJ+6SR4zQzz8DnLo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11420
Message-ID-Hash: JPINRXDFINF7SBCTVJMOENNKOLFUJPM2
X-Message-ID-Hash: JPINRXDFINF7SBCTVJMOENNKOLFUJPM2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JPINRXDFINF7SBCTVJMOENNKOLFUJPM2/>
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

