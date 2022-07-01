Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BF9562AD1
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 07:20:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD61816EB;
	Fri,  1 Jul 2022 07:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD61816EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656652803;
	bh=LOgmRlb304ZIkJR6KmlNe7yuzo2V+myM5yEegAndcmQ=;
	h=From:Subject:To:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d5UavTHS5az+DA/oXyS7WkJk+fnVUr67fP8gf2IhxTVLR0L+YX9eTFGtk7AA6dxh1
	 G8is0N1zrrjjI67K5PWs6Q25ErKzI86yzfxy2mC8wVuZjKA+K2M93++GD+23j3Np+t
	 MUcT9rF2kl3E2U5VxWIlWikI9h9XRKIWnPwNXm14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8B7BF8053C;
	Fri,  1 Jul 2022 07:18:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 534ABF8053C; Fri,  1 Jul 2022 07:18:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2130.outbound.protection.outlook.com [40.107.113.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B0C4F80152
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 07:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B0C4F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="QjAR1iAE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzT/IvcdwG9hmfje1ekTSQE1moWV3+U44fAp4jQLs4/9gvQavQ372lfpmbHAmo4JxTv2luJIapoLk9T/+xlaO2C4XCZJrgJZ7qCwFvPfFQpbarjvGLi2OWtWdtrh3bYDr8+9oXjzwXgWhZRTUxxtZ+3nGj1cBfVYjuyK8WW5PCoi023IwxZVFOjbxyRgf24gNh2M1DGuRa9Y4EW1uXM52PY3ZvXv2Tv6ltgeZ0EmA2wMNFObhpexe0IHTkG8rH+jryFCYe+BZ49suHSGQ1Vx4yWT4qUtzWMH8UiE9UxpwFJoi4ozDQcEFTffV2vZKvdLPbZGdjKHkynoiPpMEi+QYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7fVDHlIsED8+zz0zg59BUef8pqBwerhK7kcix4DqIM=;
 b=SQwW/Sv6ooJnkx3Lji7BHteKTY5zjyPO3xh3GpkKc3enCOF5GyVyZsTNnqHdxfYoXg4X2Tm3HtnlSXqbX8fyOWVfa74q7pEbozgNQKDalP+ETjyovgefLQEk3i2j112Pn4/6QQTvIV3nhGl5MDccTZ7GteFF8GMmMx0kfE4CzPGDTnlolOM2IHEb+V/kOPQVy7jk3AN9HWEfZyXWbnWS6NvsdRYBqvMebSmntZFch9sMya1Pna1iaIbsv/9VeUwWdZiyRNhEVJbizcaJSK3jfDiKQVD3O7fI/yVy+My3dDZrFsKf6tNNZocnTPkgpqGezYMfpQWPMlW6CDwbK+TJDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7fVDHlIsED8+zz0zg59BUef8pqBwerhK7kcix4DqIM=;
 b=QjAR1iAEiq1sLnMMv7f50z8V/iSAApb/B/e5y+ZegESnBu8Ei6oZvDP+XmPAVQiSKd/07vINOMhzpCnrXC7+3Bz1ziJImxZq6OgNc1fwT7MGyd+vdsMglI8erMgjamqHDmgsCWT7ZB2PnlywVAft3RI93qAPMnZp2WaZeK7kywg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB2776.jpnprd01.prod.outlook.com (2603:1096:604:12::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Fri, 1 Jul
 2022 05:18:29 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 05:18:29 +0000
Message-ID: <87edz5s95o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/6] ASoC: audio-graph-card2.c: remove pre-alloced Codec2Codec
 space
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87ilohs96p.wl-kuninori.morimoto.gx@renesas.com>
References: <87ilohs96p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 1 Jul 2022 05:18:27 +0000
X-ClientProxiedBy: TYBP286CA0048.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 691b535f-6fe2-4eae-23df-08da5b21211f
X-MS-TrafficTypeDiagnostic: OSBPR01MB2776:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GYAAsMJipy1ISRssqTW8UN6AYggRo77LoXpQ7vfKDzSgWE3RVVk98wbyhX4msF3buzFcnuc91H/sqwc7uu6jlS/Z/dnYRcbXZIOJJcb4QqwJRPHXSJP/LNkXnD0RqbtLJEmbeAf4C/5YXkuDvEYfk5/98nOY4B/AkzB5LR9fwAJhx7vQC2J+hDYmyFFAdJzRbEM76MyFu86amTKaP60x/TR8vhWiJ19vu0F4EcwNfzrPafdg/hnY0hYY8hNJR8m1zKBRrZ5MebgJWXZA4zwXFacW/5nSDIyTkVI6dlFw/kFv9pChXXDiNuY+M21RE0l0gplHl8AC5PoU+auz+eIty/CgmDszhdENF1x/FVn9Qt7ttSx7zpFH8WpWafVYWMzRy4mObKmSV7fpVO7B0n/wMl5H6VUXP0wDOAgd6Q00q7nHQ0wySKgAuMxHkG0rQRBYlanhMpP0el74VgqgeqNCXcOMaCngqPbnmKV3Jkw4pyH6d2lcs5wVKtMxZShFuDN0gZKt/6YOGT5IgQESck4JWIDRu+1Fpv3LIkPImpeGqm332/uMNicZ/TsOJZ8XwtR6ZoFwLoi+zG4sfXE3FT0qUsmOkwmHz/ke/t22+K5Uv1Lqvj+G0wAEoR2WRITaFbUTNqBdEiWAfMhgJvV7OSTsTFMigXOSQ5j0p7u+y9geolmyNXcGVG2Xv+TbCZwGrqLJdu5+7s2mmjQRRQ6vuP9GPBObwRj3wY3pbWxFfm3HbR728AcHltSAu7fGqBEbwS0mFsgFKJ5U/9D0Fp1YV2AoKPwgriZxhqixSHvZJA4ML+wDCZuoHLtwfXSzVNjyJ0uo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(316002)(26005)(38100700002)(8676002)(41300700001)(38350700002)(6512007)(86362001)(6506007)(66476007)(66556008)(4326008)(478600001)(6486002)(8936002)(83380400001)(52116002)(6916009)(66946007)(2906002)(36756003)(2616005)(186003)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SoIENJpkrc851K7U2Lj7Od3PmkKIXkH7pITS4HvWUOFBwBJ+E/k6FTIN0GlU?=
 =?us-ascii?Q?Qip4UNXMRi/vbfCCcvVSXlP4fqm3fpEVpoUJx9o1dRNZqAE+7eTwtFBAfJoI?=
 =?us-ascii?Q?s+6jUhJmpbTqkUCvVf7k2jQzq/IZ3ljwSDGMyYAeBSj7o3lPVb2CqOfnwVC+?=
 =?us-ascii?Q?1Piu0eGYXh3NFbmZjVd+PGkgOQXMqyhJJJ4IAZLPDGkrmy5K9u6FjC/lpfp0?=
 =?us-ascii?Q?Vq6oxkwWrjgxnkF9o2VhyMzcbGtjzXr3kul2EKQWHDImHCsnBQWNMvZlyvMH?=
 =?us-ascii?Q?GNr3TJnIepCBJvdxR3sIK8asfPYZgxL/IllxWDYya54c0M4OqVwHLSeIRLW0?=
 =?us-ascii?Q?cnwvf8pAj3Md0a1S2UWOGDsb1Rrg/HQO/lmWudocBWnOWo2no8sWJSm50pwD?=
 =?us-ascii?Q?uVxUaYjbGjZkMPIPtQYIekKPb0x+sPs4JjYja4Yp4GxWVNH3bCEznZtm5EVJ?=
 =?us-ascii?Q?O3lWsEzjmuvDoRxqubniF2XXmfmv9FquQjsuk2PoJrlBp/yDTLR5ORltgyuB?=
 =?us-ascii?Q?tDvWaXarXxW1hBPrquO0avpM0D0DTm3QYIdmhY98Ck9aLViOkFNRGLwjcm4J?=
 =?us-ascii?Q?BI7PmBWDeL8V20x5Duk9ny2Jf1no1QkF8Nshh3QdlFyJEGIGQH5+PpIkNQeO?=
 =?us-ascii?Q?zi9Ddlz4wrIHKda5W5IVH9KMJRCBz1eapFcTImUGPkDVgx38PWPX9Gtajvc7?=
 =?us-ascii?Q?1XPgqZxmdqAY7R6ISh6b2hgcInywYia1b8yZrKVgdsxknYwKh/zWjJaXQ9rp?=
 =?us-ascii?Q?rsxuTJ52veMvFy8gsq10MADOcgUBFjD7fnL10Qj3GN5pmiynx4M9POk0gGen?=
 =?us-ascii?Q?eVc3YmYQtA0LBAtAdA9Mf0Iazh2Uy76H+aBzdaETDecKJZI0Uk7XpLKtlUK2?=
 =?us-ascii?Q?PSyQOeNl62Q53YHsxzDlaQ9UxwD/bF6xH4adO+7UrjgoLgwnW9AB5+b3H6dz?=
 =?us-ascii?Q?ZQT1gXyqfk2Cmrp0PzhxYayoG/Gq9HzfpV6pgI18E7Km9W/McaJuR5CuGBQW?=
 =?us-ascii?Q?gQFJKCeYwEogNvsIXtlq8dlX60txK9Iyp4IOk5IVIV0qpZtKZScqS2InJKMq?=
 =?us-ascii?Q?p6CtEIVhAKdxUrodMFUAKyIdIqyqVjiWHP+bIwUVWL1bl/7Qht/LXdTClqmD?=
 =?us-ascii?Q?L2nS8p0QPXyKw9h5tc6eIiAAiXJTpv72Z5PUR9i/Erjo1UJAVKHgp/GBuOmr?=
 =?us-ascii?Q?U2VCkvNnSvcoZ2P8ilEQKJvKnMvkUsCCLG7t3NLl/HQvZZiBVqgLGp99AAqU?=
 =?us-ascii?Q?5pgfVT3eMly0/PX2mPnSjdu2TU+jeXoOirLrSVmbgxEwl5oelZitYzhJ+joR?=
 =?us-ascii?Q?H8ZXmrhIJDVaBjPEjAj+LsaMZMSZ5ISnEClCUnRvcOOb7NVmJax/w+pS7tqE?=
 =?us-ascii?Q?VdhAqU3w9hENqhHNWTTZ/N/OO7w0SLdiYQjhUIWvlocnT7SoJRf0Vd6BzrI3?=
 =?us-ascii?Q?C9djvsFGKuegfK7ghTvhn6jeiCRN4JK29hy0kQ3ZhWvV4qiBJbR+UwKaFR0m?=
 =?us-ascii?Q?ZGehgStmldwpos7d8lV8k0gHMQNgddWhmQ7LpS5jk3KSEvzytzQbHRPxrqs/?=
 =?us-ascii?Q?LB/BMH/0pDgwlVr7YRCjJqw4Dl5/7u67GCJ14TS3TBkcDEsu7LHK/EIMSahZ?=
 =?us-ascii?Q?ZHZu4/EI7xPRUB2hBn1Yz6s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 691b535f-6fe2-4eae-23df-08da5b21211f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 05:18:29.5500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: El82PPLEKDIi0rkJSbL/phuSFXkdueU/w9CODjdcAQSteoD30ZUWGCGw1PRn6bR3a9wOP5D4KS1QR0sGV8omyJsX1eDYmu+FOwyZnLamWt2K9ChZsLj3+SCviJLl2EAv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2776
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Because Codec2Codec settings becomes optional, we don't need to keep
its parameter space when init time. This patch removes its default
memory allocation from simple-card-utils.c, and allocate it at
audio-graph-card2 ondemand.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     |  3 ---
 sound/soc/generic/audio-graph-card2.c | 10 +++++++---
 sound/soc/generic/simple-card-utils.c | 18 +-----------------
 3 files changed, 8 insertions(+), 23 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index fe2337fde1f4..ab55f40896e0 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -51,7 +51,6 @@ struct prop_nums {
 	int cpus;
 	int codecs;
 	int platforms;
-	int c2c;
 };
 
 struct asoc_simple_priv {
@@ -64,7 +63,6 @@ struct asoc_simple_priv {
 		struct snd_soc_dai_link_component *platforms;
 		struct asoc_simple_data adata;
 		struct snd_soc_codec_conf *codec_conf;
-		struct snd_soc_pcm_stream *c2c_conf;
 		struct prop_nums num;
 		unsigned int mclk_fs;
 	} *dai_props;
@@ -75,7 +73,6 @@ struct asoc_simple_priv {
 	struct snd_soc_dai_link_component *dlcs;
 	struct snd_soc_dai_link_component dummy;
 	struct snd_soc_codec_conf *codec_conf;
-	struct snd_soc_pcm_stream *c2c_conf;
 	struct gpio_desc *pa_gpio;
 	const struct snd_soc_ops *ops;
 	unsigned int dpcm_selectable:1;
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 510058c47a92..19e31d53422a 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -888,8 +888,12 @@ int audio_graph2_link_c2c(struct asoc_simple_priv *priv,
 	 */
 	of_property_read_u32(ports, "rate", &val);
 	if (val) {
-		struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
-		struct snd_soc_pcm_stream *c2c_conf = dai_props->c2c_conf;
+		struct device *dev = simple_priv_to_dev(priv);
+		struct snd_soc_pcm_stream *c2c_conf;
+
+		c2c_conf = devm_kzalloc(dev, sizeof(*c2c_conf), GFP_KERNEL);
+		if (!c2c_conf)
+			goto err1;
 
 		c2c_conf->formats	= SNDRV_PCM_FMTBIT_S32_LE; /* update ME */
 		c2c_conf->rates		= SNDRV_PCM_RATE_8000_384000;
@@ -930,6 +934,7 @@ int audio_graph2_link_c2c(struct asoc_simple_priv *priv,
 	of_node_put(ep1);
 	of_node_put(codec0_port);
 	of_node_put(codec1_port);
+err1:
 	of_node_put(ports);
 	of_node_put(port0);
 	of_node_put(port1);
@@ -1093,7 +1098,6 @@ static int graph_count_c2c(struct asoc_simple_priv *priv,
 	li->num[li->link].cpus		=
 	li->num[li->link].platforms	= graph_counter(codec0);
 	li->num[li->link].codecs	= graph_counter(codec1);
-	li->num[li->link].c2c		= 1;
 
 	of_node_put(ports);
 	of_node_put(port1);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 7be84c7840cb..a761af6b13b6 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -746,8 +746,7 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 	struct asoc_simple_dai *dais;
 	struct snd_soc_dai_link_component *dlcs;
 	struct snd_soc_codec_conf *cconf = NULL;
-	struct snd_soc_pcm_stream *c2c_conf = NULL;
-	int i, dai_num = 0, dlc_num = 0, cnf_num = 0, c2c_num = 0;
+	int i, dai_num = 0, dlc_num = 0, cnf_num = 0;
 
 	dai_props = devm_kcalloc(dev, li->link, sizeof(*dai_props), GFP_KERNEL);
 	dai_link  = devm_kcalloc(dev, li->link, sizeof(*dai_link),  GFP_KERNEL);
@@ -766,8 +765,6 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 
 		if (!li->num[i].cpus)
 			cnf_num += li->num[i].codecs;
-
-		c2c_num += li->num[i].c2c;
 	}
 
 	dais = devm_kcalloc(dev, dai_num, sizeof(*dais), GFP_KERNEL);
@@ -781,12 +778,6 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 			return -ENOMEM;
 	}
 
-	if (c2c_num) {
-		c2c_conf = devm_kcalloc(dev, c2c_num, sizeof(*c2c_conf), GFP_KERNEL);
-		if (!c2c_conf)
-			return -ENOMEM;
-	}
-
 	dev_dbg(dev, "link %d, dais %d, ccnf %d\n",
 		li->link, dai_num, cnf_num);
 
@@ -800,7 +791,6 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 	priv->dais		= dais;
 	priv->dlcs		= dlcs;
 	priv->codec_conf	= cconf;
-	priv->c2c_conf		= c2c_conf;
 
 	card->dai_link		= priv->dai_link;
 	card->num_links		= li->link;
@@ -818,12 +808,6 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 
 			dlcs += li->num[i].cpus;
 			dais += li->num[i].cpus;
-
-			if (li->num[i].c2c) {
-				/* Codec2Codec */
-				dai_props[i].c2c_conf = c2c_conf;
-				c2c_conf += li->num[i].c2c;
-			}
 		} else {
 			/* DPCM Be's CPU = dummy */
 			dai_props[i].cpus	=
-- 
2.25.1

