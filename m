Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DD36C3F77
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 02:13:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C68456C1;
	Wed, 22 Mar 2023 02:12:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C68456C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679447620;
	bh=N1xPXNK+xvVBvKPY4STdUcVGhHJhneVZ2MQyS9SWwYY=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lAzV1mdrt5eDPGOS0+tJW2AZtzgG3QIFmb7GEOUessHzNGp2j+fVP4Ac7ff5JpgW6
	 7OIzl2w8IDkVl0Y6Hh+hXHui4C8r+rLQqKDUqO5r5/FTepxiAm2dD7SrjardK4J6tG
	 5mnpzByNln80cqiN9S6m63TTQTlIZf94+4ua6510=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6696F80482;
	Wed, 22 Mar 2023 02:12:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68B63F804FE; Wed, 22 Mar 2023 02:12:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20710.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BAE71F80254
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 02:12:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAE71F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=P/t06Q8J
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjeRrxwG8vaoAO0s9RhjM1pzYyjiJyFkDw91vknZxB6USCWQIjs/fQk2GDdeW2B1ur/C8brBQVvmjC1a4x9adk7MKnigxomma8vLtA4eU8rbkjLRlzVTXmLog0bmAIlW6gnlZHBcUM1UHcD3eML4e0OXoSn9L2l1as+okkqzGpXkXKOm9G5R/LJJbv0o+nCLncZncvus5IaYQGGSeE9bFL5P3A2r5Vh/9HCEm4yaaC8fdSphV3Ey/g4IURCufOl7msqzXlS+GdeYkpjvoz20fnCNxUlqMXlHGAKVUZhTv639pEo+CQauDYM38r/SFbY6Yfa8y+A9XFenn4OsyrWADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWSlIO+hznpqmBH9PiszimjbvP0u+mIIsJPx15deXDQ=;
 b=OiFlGeSIycjq7I1wz0rEu+12PBEAqG+94NyyYal20qLHoKbudOpsEt6uvT53F2EFxv407wM0RyXgHwq3HTujXi/u42SkhfU2JYxkf0GAP2/h3mKOSTSUjhuq2AVyv/XevWOGnNTeWRTh1FmJcx5nYp2HUU/MhnSHNQenat3KMXNMC8DR4XqedA9D4eXRA3E4sJpnJ33cM78w6OAOOttUJ+Qscl7TH+oTkRkSJn9vQh5BkfkvK5Dq+gUjGSWv3oiefO1KHbCbBe5A36jb0A/I4jZTwqeFrLNJ5pdwz7+XvwamxU8LMYXqvNUA36auHE9SkVanyXX5xhlcrqjR9bkQ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWSlIO+hznpqmBH9PiszimjbvP0u+mIIsJPx15deXDQ=;
 b=P/t06Q8JWki6PMRupJ292Q2tbk9x/TxK0vNMBAoH4MK8icM4piID82LGCU0omLWXoFri6oSASeKNdI7asdJYc5n+/xWIWX9JE2JnfXcUzqbiapgZBB4y+Urxc5QKEFifsIw2237TdC+tSx5M1WHsMv3rj5QBXMYNsFp+YGksayo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8882.jpnprd01.prod.outlook.com (2603:1096:400:18f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 01:12:25 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 01:12:25 +0000
Message-ID: <875yattwqv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: simple-card: add comment to indicate don't remove
 platforms
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Mar 2023 01:12:24 +0000
X-ClientProxiedBy: TYCP301CA0013.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: 04f42e98-2972-4ddf-cf68-08db2a727edb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mXE8/WQWX4bkeAB3uFlWeinTHA8uyT1jkq8w85OZYXa8ZU4vIAi9W2LZF/dbZmlECoh4bbntlooObxah7aE/yIRReEJ5mqyop9wY3eIh8vvPu3pH0CPvRtt+lDtYTggK0QuRJR7iHYjccgnVttF7aWTFQxj9d06XHJ1aY9aplL57Un40ouhskKK3g0WBMM7gcVXy9/n33cZxqIex59o9OyynzN1SLomonu5eWHyeI5GQgviWpl3KsEjekxpODGBj+e3J3QU7XQ5DztF1kFKfNgti6zZnd9Zh4c/VuBHpnxNsU9cS8Rm1hQxfMYeKtMrTpluNyTcw6/sYo7fza9vXwDtlgys6L6WxRBtz9SB2DfKsoGLrWY23b5jA9vGGaPz3yrsZ6bBoOZyGdsHlYvgxWk4lk8DKRaIu4eaf8vV6uwSzpa7wHL1kT81oy9VyPzGtXSsEfaaW2KzXH3DdDIknn8noe/mk7Hdy+SofoJAwFsxFYh5/YLww/QebYt5aaVE9Of5s9jas9vPkKhcMPpVNEGeLOKafrQ1zKyJIthP8ORnWXTWVNah5gpENjroOhz2ZLvjBb8mr/pSj/aDIUUw0yYPu+XWIJ5SpsI7yv3RDFeO+1w9bagQ8+ZC7R58YH6AQOXC9n7hgs1HDx+vhN/oYaXIGvNJdVajJxWRF3UAMULMcqPOgierVN/WgZ2CZdYt5EG3BQOIdU9Mo5rSVBZ4zdQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199018)(2616005)(6512007)(6506007)(6486002)(478600001)(316002)(26005)(52116002)(5660300002)(186003)(83380400001)(38350700002)(38100700002)(86362001)(66946007)(6916009)(41300700001)(8936002)(2906002)(66476007)(8676002)(4326008)(66556008)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uMlyA4H1gPfabxHeQo8AHx+dfzR0qQhyppZz1G4kc+fnimUOZR6Tisg2C+yh?=
 =?us-ascii?Q?djQTM7XnzHwRfnhwkArZjcFObGomTSmzjNJw1p1nW2c1TtecFjQr7xVmhI78?=
 =?us-ascii?Q?TIezx9Cb8sPKCaHKllLR8S8d2fRGXd41RH03zZ06O6sp1Rma/oJgOQJDenBa?=
 =?us-ascii?Q?U4eqFFcO4uaJ5053qmR1PGrztt3F5L7RFYMTbGpaK3RJOso0wLwIM3vmoa2E?=
 =?us-ascii?Q?xeZDeobiLzn2J08NDeQ/+xyDBVjgFQyY3Dd4NRmBZl7m2ZIs6HfXVw7wcAof?=
 =?us-ascii?Q?xhqnlqRAVUQrGLudRi+TCu/ZttBBKAD890sLvnx1bi0inpbzk8qvKaCPjItv?=
 =?us-ascii?Q?vBffkUC16Dthiw36Wp249hE1ZiK84I4iK2NW2Hk42O/rmWl4SFJqrpYSaErI?=
 =?us-ascii?Q?5CNXSeHDII8NHjvHBQyylbj9pEDwDcC2uv3XctF1lVgkXG5xrxfikYmVSI4d?=
 =?us-ascii?Q?Lnx5XPjeY+ZR3Tfcste0+09KZe6K/AMprhewEKaCHhBfWlu2ybC4OyhUvdN/?=
 =?us-ascii?Q?v/QfGV7LSFWcL1OpJWuDO4zQwVWqnBF0YAdu9E/agoW0vJtU+SoV1foeNQO2?=
 =?us-ascii?Q?xP9EnzttTZWIMb1+idCcgUijIXjK2AmonvUKkNBCUT6x5MuwZu8ZGFs4127l?=
 =?us-ascii?Q?mCHr1JDHt+c+E5WxV1WbYGF+p9gztY8mCQGnKQWZE1fKN9A7QKdTKDF5XioL?=
 =?us-ascii?Q?zirHViArDlKkHuRdvwHUwn/jDeBpHu2yN11MpCsO/l+L/5c1sUvBoEDdP5cm?=
 =?us-ascii?Q?O2L5O48HeDzWgy73WrbetzZDwcsQK5zKZDRpL+OOutBGiqmWibyDFlxxx2Ck?=
 =?us-ascii?Q?N4t3v61yPKLPJaDutmpIaY/nU9NHPKv9lV1CQ4Vyw/myCRQPaAjQRoSZTZ9B?=
 =?us-ascii?Q?nFoNNNFEJY2RrbhzLfk6YZIWve6/rK8PsvdHzPIUL9bjGFGrpEDcovL4QU7t?=
 =?us-ascii?Q?AxuMfc0ahIBJHXVVrEf+2i79w1aAot8EUm2YgvHOki+7RAfw4qefjzv9ineZ?=
 =?us-ascii?Q?/WmI1tzJ80lJXrFRggwptPtI1dBmeeyGcc88Q5YhTubunk513dDIV4YKq1H3?=
 =?us-ascii?Q?eA7wa7xVdPXp6kY7uUXiCnmXPL6ATJMA77VHogcjJuAsW8ZWABEuR+gFoOI8?=
 =?us-ascii?Q?sKvLRYx4h/122EHAeoeQk1znVHH2o6cjaBWdQhpg4VwuzYKHmxfKtVjHRqfU?=
 =?us-ascii?Q?ybJkc/y+1QtHFk5fkqzdWCLjc6h5UMSjTiFXWYuYE3u2tKelw1Bhz8F6if2x?=
 =?us-ascii?Q?Ctw/RSeGFYB+oeFhw7gNHVYi8MU2X7T1gSNnxnKDBBm2T57wixH6Y4UPX/Zf?=
 =?us-ascii?Q?aRt+xJWWK0PIRZH5L61Dydu1wZ0LZw+xLge6k6YqBZulBZxUw5qsnp1nGFra?=
 =?us-ascii?Q?GqMG75hfxUnYkxu7Ag+maaeHN05XW4veuiOKzpCQRjeTyuWgxpxxgrDLnKD1?=
 =?us-ascii?Q?px6QZc9/X01mQhmNmJLr8jPI87mVfZ2KGDTTdf5xZBt0OzPYRl4mSVXxc40q?=
 =?us-ascii?Q?eDdvrRwCD0OLWocy5byEgOniIYsLZ1W60VcgP+wE4dAQ9sIY3PpVFw7GyOFv?=
 =?us-ascii?Q?nzK45t6CXMdFlMINNdTYGipji9zjW+/bDBya//Owjcj98B8lWdAWxY8yaXoy?=
 =?us-ascii?Q?xvSRHrS6518Gdnusi/t5oJY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 04f42e98-2972-4ddf-cf68-08db2a727edb
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 01:12:25.0716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 T66Ug3FQyTTt1GYawEHK2fvc+yZ2674m+6794r/s+uUUq3H01z1dgA+TpWdCiEOwvFwtOciaYKhqv/eFArYNLd5w0BlHHHpb5dOm43G2V4NyZtcYMIUEEMuyv3qyOoKQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8882
Message-ID-Hash: EPAKWA6T7EWBRDPQONLI2CZ2TN6FE4H2
X-Message-ID-Hash: EPAKWA6T7EWBRDPQONLI2CZ2TN6FE4H2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPAKWA6T7EWBRDPQONLI2CZ2TN6FE4H2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Basically CPU and Platform are different Component, but if CPU is using
soc-generic-dmaengine-pcm, same dev will be shared between CPU and
Platform, and Simple Card had been supporting it.

When we focus to clean up Simple Card driver, we tend to remove platforms
if no Platform was selected, but it is wrong because of above reasons.

This patch adds comment why we shouldn't remove platforms.

In case of CPU is not using soc-generic-dmaengine-pcm, CPU and Platform
will be duplicated, but it will be ignored by snd_soc_rtd_add_component().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2

	- add +1 comment on asoc_simple_canonicalize_platform()

 sound/soc/generic/audio-graph-card.c  | 13 ++++++++++++-
 sound/soc/generic/audio-graph-card2.c | 17 +++++++++++++++++
 sound/soc/generic/simple-card-utils.c | 11 ++++++++++-
 sound/soc/generic/simple-card.c       | 22 +++++++++++++++++++++-
 4 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index d788f5f23a8a..4e85536a1b26 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -613,10 +613,16 @@ static int graph_count_noml(struct asoc_simple_priv *priv,
 		return -EINVAL;
 	}
 
+	/*
+	 * DON'T REMOVE platforms
+	 * see
+	 *	simple-card.c :: simple_count_noml()
+	 */
 	li->num[li->link].cpus		= 1;
-	li->num[li->link].codecs	= 1;
 	li->num[li->link].platforms     = 1;
 
+	li->num[li->link].codecs	= 1;
+
 	li->link += 1; /* 1xCPU-Codec */
 
 	dev_dbg(dev, "Count As Normal\n");
@@ -637,6 +643,11 @@ static int graph_count_dpcm(struct asoc_simple_priv *priv,
 	}
 
 	if (li->cpu) {
+		/*
+		 * DON'T REMOVE platforms
+		 * see
+		 *	simple-card.c :: simple_count_noml()
+		 */
 		li->num[li->link].cpus		= 1;
 		li->num[li->link].platforms     = 1;
 
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 259544f64df9..d145b74d41e4 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1046,8 +1046,14 @@ static int graph_count_normal(struct asoc_simple_priv *priv,
 	 * =>		lnk: port { endpoint { .. }; };
 	 *	};
 	 */
+	/*
+	 * DON'T REMOVE platforms
+	 * see
+	 *	simple-card.c :: simple_count_noml()
+	 */
 	li->num[li->link].cpus		=
 	li->num[li->link].platforms	= graph_counter(cpu_port);
+
 	li->num[li->link].codecs	= graph_counter(codec_port);
 
 	of_node_put(cpu_ep);
@@ -1079,6 +1085,11 @@ static int graph_count_dpcm(struct asoc_simple_priv *priv,
 	 */
 
 	if (asoc_graph_is_ports0(lnk)) {
+		/*
+		 * DON'T REMOVE platforms
+		 * see
+		 *	simple-card.c :: simple_count_noml()
+		 */
 		li->num[li->link].cpus		= graph_counter(rport); /* FE */
 		li->num[li->link].platforms	= graph_counter(rport);
 	} else {
@@ -1113,8 +1124,14 @@ static int graph_count_c2c(struct asoc_simple_priv *priv,
 	 *	};
 	 * };
 	 */
+	/*
+	 * DON'T REMOVE platforms
+	 * see
+	 *	simple-card.c :: simple_count_noml()
+	 */
 	li->num[li->link].cpus		=
 	li->num[li->link].platforms	= graph_counter(codec0);
+
 	li->num[li->link].codecs	= graph_counter(codec1);
 
 	of_node_put(ports);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 56552a616f21..34a9b91e676f 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -638,7 +638,16 @@ EXPORT_SYMBOL_GPL(asoc_simple_dai_init);
 void asoc_simple_canonicalize_platform(struct snd_soc_dai_link_component *platforms,
 				       struct snd_soc_dai_link_component *cpus)
 {
-	/* Assumes platform == cpu */
+	/*
+	 * Assumes Platform == CPU
+	 *
+	 * Some CPU might be using soc-generic-dmaengine-pcm. This means CPU and Platform
+	 * are different Component, but are sharing same component->dev.
+	 *
+	 * Let's assume Platform is same as CPU if it doesn't identify Platform on DT.
+	 * see
+	 *	simple-card.c :: simple_count_noml()
+	 */
 	if (!platforms->of_node)
 		platforms->of_node = cpus->of_node;
 }
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index e98932c16754..fcd6c44f89f6 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -509,10 +509,25 @@ static int simple_count_noml(struct asoc_simple_priv *priv,
 		return -EINVAL;
 	}
 
+	/*
+	 * DON'T REMOVE platforms
+	 *
+	 * Some CPU might be using soc-generic-dmaengine-pcm. This means CPU and Platform
+	 * are different Component, but are sharing same component->dev.
+	 * Simple Card had been supported it without special Platform selection.
+	 * We need platforms here.
+	 *
+	 * In case of no Platform, it will be Platform == CPU, but Platform will be
+	 * ignored by snd_soc_rtd_add_component().
+	 *
+	 * see
+	 *	simple-card-utils.c :: asoc_simple_canonicalize_platform()
+	 */
 	li->num[li->link].cpus		= 1;
-	li->num[li->link].codecs	= 1;
 	li->num[li->link].platforms	= 1;
 
+	li->num[li->link].codecs	= 1;
+
 	li->link += 1;
 
 	return 0;
@@ -531,6 +546,11 @@ static int simple_count_dpcm(struct asoc_simple_priv *priv,
 	}
 
 	if (li->cpu) {
+		/*
+		 * DON'T REMOVE platforms
+		 * see
+		 *	simple_count_noml()
+		 */
 		li->num[li->link].cpus		= 1;
 		li->num[li->link].platforms	= 1;
 
-- 
2.25.1

