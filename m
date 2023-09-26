Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6C47AE5B3
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:22:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 795AADF3;
	Tue, 26 Sep 2023 08:21:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 795AADF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709324;
	bh=pZhEvL7K2NJhUdJi2tcRAzlBnVngAYjkGdMtGs8lN/E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tcw8HDmpZawKeabkhuJthoDMNnZEM3Xt53Z8yI+P3Q7x5rJl5fUT1hFcKS9xRJyKB
	 K6nsz5o4ByLY7pkzRssT7A1ANzHNNl7UPiHfbQWJtTBJu7Bwxxo/joDPft4Zp2pTqT
	 KS1VpnA/cGX79SzXbFpPBhSX5Y8Uc7Y0D5QmPJx8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E7D6F80570; Tue, 26 Sep 2023 08:20:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFB33F8055A;
	Tue, 26 Sep 2023 08:20:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79FC6F8055B; Tue, 26 Sep 2023 08:20:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D64F0F80558
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:20:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D64F0F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=j+RWlfLw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvuxKG5vRvcXYYtD/8P2KRIC6d6xjtq9FeMVgQ0iEn/ezvsVFhikPAo8OLYCSRaqx2Pom1Wq8q/qHsuQ6IPhh3DAh1C+pH+vodwpfFCZ55VVuAoAdd/2D5amfI+SM1K5hGVPjpcosxkljcsUvMcdHBIuPR/qJCNPafW2eDTX5zvx0twM+C1pFelsk+K3xDfjJGiXbtiQ26ThJr/7He46uDGf2X9jEoO4W0TnN2EXYxojBgmseB2Z7/7QX5N1yO5OTK+IEjn/fHCWZTaxMtzgtWr/edHxb9qxTA43NwP7PX8rUOjTBKW2lDmsUTco8mwpoiYr17m6yfHVbUlPqsmufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2v02ovmHlb9jr+CD6n7OEdY/48ZuKDUIfBkZg7uyBY=;
 b=NZuSSaA6cRJbZHgbNZ72tkkypSz4kg0sGwlxLI+MkEDLW0GHzmmlr1Mr5MBCjfifbf869trV7X4ZtZo2IlClfSLaRqeRhOtORzdTCpyzIR5nBsihCe9DvLPUIQmGzBMZhuZnBbd7AI7nVnaVNWj5uvzHQiN3CUevVYKU069368A1UxFOUOAaR1w11NU10C/Me81IIOr4LLqTProF/K6fjrCBZpSBHvFAJrM2+BVx1zX5LZVYVioBoEpC0HDZNVz71PiemNOvUHYfM057RHQbJnp5b11xonuiKi9YItBMf8hrTSgKoZQ84FB8rRmnKN19ROLybvWzWmDtOx36ep/rhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2v02ovmHlb9jr+CD6n7OEdY/48ZuKDUIfBkZg7uyBY=;
 b=j+RWlfLwq8yUtKzIia4OMYaqHJzV1jYwW8EaF8cwGJElFCiLQVcXT058PsjicJONryj2mwjh/PRKRz1EKAqhXoI+XH61fdNa25vMjH2aDP6jcWYU2yaFEoMmk0OLttb4GIY2XjWBW6gZHP88h3Em2Q3ulTZSPmICmgvK68yc/ns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10426.jpnprd01.prod.outlook.com (2603:1096:400:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:20:20 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:20:20 +0000
Message-ID: <87bkdpihgc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 02/54] ASoC: simple_card_utils.h: convert not to use
 asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:20:20 +0000
X-ClientProxiedBy: TYCP301CA0037.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e4d9706-f1b4-4f89-ba69-08dbbe58a8ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VYY90edtj07dl2UPlABWGFK616K3vv/Fde3aBWIDxZzDskZ2hLI6uE5UT4fZ1DdWWfra9wMQvjYdp+cylI+t93IkMP4sm3WX8lfSwhqBKYM1fD0NjbcPwWkaU6rWPXo3/pg+jnENaABFVmrSnwS0uXvTpAEqkYLWZQx9vlqNwikaQojrjk+Rz540QoK1jPeN/ZXwIHShB/fSTBs0WfVKVx+YrGYbVL5QkYqCrnXTtfLV4Zk7qxdyyDT0dbYqMfB/f0HiRs7za2Mb6OGjIAmkSK4PmpltdvD9K+k36NugJT9OF7LGdr48zas7wlg/HQ+75rBwUkw4LpdFYC/tSRQ4fwPoRyOCJLYrIQYfFiA6F5dsHAe8GUTQiHOnmT5swLZCf61s/1FgPUGzUX0+F6/U7uPo/VFeWjluzNCg20awB+0G/Y88h9g8gHRlS3DasKPcD4Jfp3APRb4BqIGWCxA7s39hbNoRznc5a7fEFsmj8BmS0uq4wV/kISCJp/4/o47v8/nvd+kX8+c9UAOe4WjwuYoHeriAImFifXeN0wB6RmwKAb7MPJgwhlBaPe4G9yLDyRAbNhEtUtLe4GOxa87MCvJCqdKq90xFwRFaEMmTAkdLuKg7g1U5KsVSyws0JYFrz0cAfoVuFSafn6cVPU56ng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(396003)(346002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(5660300002)(316002)(30864003)(41300700001)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i/cDI9/dffRNOKEzCtW2rhd0U/j7vBGKwHC3j+V+N6i3TyqUsrFzLgnY9rya?=
 =?us-ascii?Q?SLXkDDEqRTRlktUte2PIvoxyNzsI7GthyD7mcidhw/xwZ0rpHaRoGRlH/62s?=
 =?us-ascii?Q?tCotI5fDqrxFUjpgao3sAchWm1ifaz78+r037u84Hj/jsUcNVWexpzVZ2/M8?=
 =?us-ascii?Q?WnzQ5CVIoajURAoRTlQIBAWK6l8k/HKGJgGNLz5O+JEXVty5FWAye5O4QEXT?=
 =?us-ascii?Q?MyotahWjCAbAptbxilMOsAjqo5LjnhnKlBLWIQF+mvi4/8Wy7/1eWfX3vkDV?=
 =?us-ascii?Q?pY7i1Nz/83Gnr2VLpeQbFonDYl36979Ss3lkvwVohzYn+yC9bJngUoOeYczf?=
 =?us-ascii?Q?zL49/komL8eupA/ouKA2SaQPgKr3h6dHmfy7JNA9k+BOIndWKC0NWfF8SVNN?=
 =?us-ascii?Q?tPZd1Kg0SKJZquwcA6FSTFRkAIaIucnMgliAPaJEbSSNC8vE0JQ65bgtSodq?=
 =?us-ascii?Q?QUOlxwDsUe8ft81RvfHZ4gnZn1Oo++emq0faSlfy5JDr659sGSmkDlmp1pBf?=
 =?us-ascii?Q?vwCzYkf07hK5z7AXF0bdBBD5zfNa6sOHIZqRLaBK3vjX/o8WnfRYlLhEnJTB?=
 =?us-ascii?Q?5vxNf6BWH5gCvdQA3wYbArzhtVzksTis4JuoBF2rw0NDjan9pgaoDhkTrKhp?=
 =?us-ascii?Q?h7JgN0/h7Bcc41sR3OrUGoCEydgaoEY3DZRLg5Um+324ZPWcYgHI8+RU6cwl?=
 =?us-ascii?Q?cQ05eAOK/FZsUJL7lcH/PTh+ulZq5NyqGtE7DJWy6PiUETCnTilfd677FzBW?=
 =?us-ascii?Q?qARyjV9q8gV7kl6RwtjgfFE7cansC7M6h+HawccIOFqmcj+V7AOJvC3C5Ixw?=
 =?us-ascii?Q?gHbAs/jMitP8rs1d2ZrzqaweJIas/vjNIPpFFnUInfRbRsqzHZi7Voqwoy07?=
 =?us-ascii?Q?92UW5p7U9hbLH7tTNDKKz+bn6Md3aEV4Wj74OKI/mqgVloq8Xqyw+LyBVT4L?=
 =?us-ascii?Q?euc0qNU2X0CBEBpb6wekeqvogAnYRW2UGST33upgDsd8CHZFrU/LMRqSh8Ml?=
 =?us-ascii?Q?0R/iJ2jgxk23lW8WQcp3II95hWli5Gdk3sqvyV1DFvR7+B1B1PjC2LdDvePK?=
 =?us-ascii?Q?/EBO1swZ/Z8s+F9NUxgxSK5UJe7szCOLA2hUlXaMM03H4Oh72aA9YwDWYufx?=
 =?us-ascii?Q?sX7CYydhsGLxE2QgkxdrxISilYqXZLFOzi2RbGw62xy4UKuNQmw70Jz6K2Rf?=
 =?us-ascii?Q?ZGwsq7CUN8DIZBBgRR0fMl/U6kzA5bsXvtCq5ZIJw4Dl/174LwOsF80aMQco?=
 =?us-ascii?Q?j8Z6/mXJzghIY7Q88HwmPbNw+r3pExIhUQbF+rk6QCYMhOquVACmg28OsuTS?=
 =?us-ascii?Q?poXzCHkSwN7OvbfkskALmoyGdoMhSEVVLWadHGW34JO8aqaHdNhPIuWBaKwJ?=
 =?us-ascii?Q?sBSPTyYEbmUufeVyTFbtuoosqguFbuR79g5rXGiDOg3WFgwZs3b0G+Td4UXT?=
 =?us-ascii?Q?yikdIvfptpH/q8vpURX5RYRfkE8w2yg6MSWN/Zj7wC+madiU/n+h9r0Ip9PP?=
 =?us-ascii?Q?L6969NyZV84t4FFz5KaUJHA1FFsLkdnX5Y+24pVssHTJJBU4TwRtMNa0R7ne?=
 =?us-ascii?Q?PipxnwvM5B60KHuYijne5322LpUDKel0WlMg9d4kIyfwlXcJYsP24/TrirC3?=
 =?us-ascii?Q?ZGSb+BN2dZ3LNgFho3SKkko=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1e4d9706-f1b4-4f89-ba69-08dbbe58a8ed
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:20:20.7010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 D7XV4GoDiMAyIsHF+hN6Clw3mqOW7fYylTN5eDbfSM8rHBcS7ZAqloVYc0xJWNaRC9jMsafN5XAnRHfuZMSIjoZCodHhIRs63euOE0qEwFOSHxjTSxd6irNkLTKCRnfB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10426
Message-ID-Hash: PRYAOVB7JMRS2ORTOVOMB2DIAKYMI377
X-Message-ID-Hash: PRYAOVB7JMRS2ORTOVOMB2DIAKYMI377
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PRYAOVB7JMRS2ORTOVOMB2DIAKYMI377/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is using 2 type of prefix (asoc_xxx() vs snd_soc_xxx()),
but these are unified into snd_soc_xxx().

simple_card / audio_graph drivers are historically using
asoc_xxx() prefix too. simple_card / audio_graph are not
ASoC framework, so let's use simple_card_xxx_() / audio_graph_xxx()
for global function prefix.

This patch has asoc_xxx() as define to keep compatible.
It will be removed if all drivers were switched to new style.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/graph_card.h            |  16 +--
 include/sound/simple_card.h           |   9 +-
 include/sound/simple_card_utils.h     | 148 ++++++++++++++++----------
 sound/soc/generic/simple-card-utils.c | 100 ++++++++---------
 4 files changed, 158 insertions(+), 115 deletions(-)

diff --git a/include/sound/graph_card.h b/include/sound/graph_card.h
index 4c8b94c77b8e..8e2e15dfcb1e 100644
--- a/include/sound/graph_card.h
+++ b/include/sound/graph_card.h
@@ -9,27 +9,27 @@
 
 #include <sound/simple_card_utils.h>
 
-typedef int (*GRAPH2_CUSTOM)(struct asoc_simple_priv *priv,
+typedef int (*GRAPH2_CUSTOM)(struct simple_util_priv *priv,
 			     struct device_node *lnk,
 			     struct link_info *li);
 
 struct graph2_custom_hooks {
-	int (*hook_pre)(struct asoc_simple_priv *priv);
-	int (*hook_post)(struct asoc_simple_priv *priv);
+	int (*hook_pre)(struct simple_util_priv *priv);
+	int (*hook_post)(struct simple_util_priv *priv);
 	GRAPH2_CUSTOM custom_normal;
 	GRAPH2_CUSTOM custom_dpcm;
 	GRAPH2_CUSTOM custom_c2c;
 };
 
-int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev);
-int audio_graph2_parse_of(struct asoc_simple_priv *priv, struct device *dev,
+int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev);
+int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 			  struct graph2_custom_hooks *hooks);
 
-int audio_graph2_link_normal(struct asoc_simple_priv *priv,
+int audio_graph2_link_normal(struct simple_util_priv *priv,
 			     struct device_node *lnk, struct link_info *li);
-int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
+int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 			   struct device_node *lnk, struct link_info *li);
-int audio_graph2_link_c2c(struct asoc_simple_priv *priv,
+int audio_graph2_link_c2c(struct simple_util_priv *priv,
 			  struct device_node *lnk, struct link_info *li);
 
 #endif /* __GRAPH_CARD_H */
diff --git a/include/sound/simple_card.h b/include/sound/simple_card.h
index d264e5463f22..a2f214388b53 100644
--- a/include/sound/simple_card.h
+++ b/include/sound/simple_card.h
@@ -12,15 +12,18 @@
 #include <sound/soc.h>
 #include <sound/simple_card_utils.h>
 
-struct asoc_simple_card_info {
+/* REMOVE ME */
+#define asoc_simple_card_info	simple_util_info
+
+struct simple_util_info {
 	const char *name;
 	const char *card;
 	const char *codec;
 	const char *platform;
 
 	unsigned int daifmt;
-	struct asoc_simple_dai cpu_dai;
-	struct asoc_simple_dai codec_dai;
+	struct simple_util_dai cpu_dai;
+	struct simple_util_dai codec_dai;
 };
 
 #endif /* __SIMPLE_CARD_H */
diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index d1a95bc33c56..0639c6df15e3 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -11,18 +11,29 @@
 #include <linux/clk.h>
 #include <sound/soc.h>
 
-#define asoc_simple_init_hp(card, sjack, prefix) \
-	asoc_simple_init_jack(card, sjack, 1, prefix, NULL)
-#define asoc_simple_init_mic(card, sjack, prefix) \
-	asoc_simple_init_jack(card, sjack, 0, prefix, NULL)
-
-struct asoc_simple_tdm_width_map {
+/* REMOVE ME */
+#define asoc_simple_init_hp	simple_util_init_hp
+#define asoc_simple_init_mic	simple_util_init_mic
+
+#define simple_util_init_hp(card, sjack, prefix)		\
+	simple_util_init_jack(card, sjack, 1, prefix, NULL)
+#define simple_util_init_mic(card, sjack, prefix)		\
+	simple_util_init_jack(card, sjack, 0, prefix, NULL)
+
+/* REMOVE ME */
+#define asoc_simple_tdm_width_map	simple_util_tdm_width_map
+#define asoc_simple_dai			simple_util_dai
+#define asoc_simple_data		simple_util_data
+#define asoc_simple_jack		simple_util_jack
+#define asoc_simple_priv		simple_util_priv
+
+struct simple_util_tdm_width_map {
 	u8 sample_bits;
 	u8 slot_count;
 	u16 slot_width;
 };
 
-struct asoc_simple_dai {
+struct simple_util_dai {
 	const char *name;
 	unsigned int sysclk;
 	int clk_direction;
@@ -32,17 +43,17 @@ struct asoc_simple_dai {
 	unsigned int rx_slot_mask;
 	struct clk *clk;
 	bool clk_fixed;
-	struct asoc_simple_tdm_width_map *tdm_width_map;
+	struct simple_util_tdm_width_map *tdm_width_map;
 	int n_tdm_widths;
 };
 
-struct asoc_simple_data {
+struct simple_util_data {
 	u32 convert_rate;
 	u32 convert_channels;
 	const char *convert_sample_format;
 };
 
-struct asoc_simple_jack {
+struct simple_util_jack {
 	struct snd_soc_jack jack;
 	struct snd_soc_jack_pin pin;
 	struct snd_soc_jack_gpio gpio;
@@ -54,21 +65,21 @@ struct prop_nums {
 	int platforms;
 };
 
-struct asoc_simple_priv {
+struct simple_util_priv {
 	struct snd_soc_card snd_card;
 	struct simple_dai_props {
-		struct asoc_simple_dai *cpu_dai;
-		struct asoc_simple_dai *codec_dai;
-		struct asoc_simple_data adata;
+		struct simple_util_dai *cpu_dai;
+		struct simple_util_dai *codec_dai;
+		struct simple_util_data adata;
 		struct snd_soc_codec_conf *codec_conf;
 		struct prop_nums num;
 		unsigned int mclk_fs;
 	} *dai_props;
-	struct asoc_simple_jack hp_jack;
-	struct asoc_simple_jack mic_jack;
+	struct simple_util_jack hp_jack;
+	struct simple_util_jack mic_jack;
 	struct snd_soc_jack *aux_jacks;
 	struct snd_soc_dai_link *dai_link;
-	struct asoc_simple_dai *dais;
+	struct simple_util_dai *dais;
 	struct snd_soc_dai_link_component *dlcs;
 	struct snd_soc_codec_conf *codec_conf;
 	struct gpio_desc *pa_gpio;
@@ -130,75 +141,104 @@ struct link_info {
 	struct prop_nums num[SNDRV_MAX_LINKS];
 };
 
-int asoc_simple_parse_daifmt(struct device *dev,
+/* REMOVE ME */
+#define asoc_simple_parse_daifmt		simple_util_parse_daifmt
+#define asoc_simple_parse_tdm_width_map		simple_util_parse_tdm_width_map
+#define asoc_simple_set_dailink_name		simple_util_set_dailink_name
+#define asoc_simple_parse_card_name		simple_util_parse_card_name
+#define asoc_simple_parse_clk			simple_util_parse_clk
+#define asoc_simple_startup			simple_util_startup
+#define asoc_simple_shutdown			simple_util_shutdown
+#define asoc_simple_hw_params			simple_util_hw_params
+#define asoc_simple_dai_init			simple_util_dai_init
+#define asoc_simple_be_hw_params_fixup		simple_util_be_hw_params_fixup
+#define asoc_simple_parse_tdm			simple_util_parse_tdm
+#define asoc_simple_canonicalize_platform	simple_util_canonicalize_platform
+#define asoc_simple_canonicalize_cpu		simple_util_canonicalize_cpu
+#define asoc_simple_clean_reference		simple_util_clean_reference
+#define asoc_simple_parse_convert		simple_util_parse_convert
+#define asoc_simple_is_convert_required		simple_util_is_convert_required
+#define asoc_simple_parse_routing		simple_util_parse_routing
+#define asoc_simple_parse_widgets		simple_util_parse_widgets
+#define asoc_simple_parse_pin_switches		simple_util_parse_pin_switches
+#define asoc_simple_init_jack			simple_util_init_jack
+#define asoc_simple_init_aux_jacks		simple_util_init_aux_jacks
+#define asoc_simple_init_priv			simple_util_init_priv
+#define asoc_simple_remove			simple_util_remove
+#define asoc_simple_debug_info			simple_util_debug_info
+#define asoc_graph_card_probe			graph_util_card_probe
+#define asoc_graph_is_ports0			graph_util_is_ports0
+#define asoc_graph_parse_dai			graph_util_parse_dai
+
+int simple_util_parse_daifmt(struct device *dev,
 			     struct device_node *node,
 			     struct device_node *codec,
 			     char *prefix,
 			     unsigned int *retfmt);
-int asoc_simple_parse_tdm_width_map(struct device *dev, struct device_node *np,
-				    struct asoc_simple_dai *dai);
+int simple_util_parse_tdm_width_map(struct device *dev, struct device_node *np,
+				    struct simple_util_dai *dai);
 
 __printf(3, 4)
-int asoc_simple_set_dailink_name(struct device *dev,
+int simple_util_set_dailink_name(struct device *dev,
 				 struct snd_soc_dai_link *dai_link,
 				 const char *fmt, ...);
-int asoc_simple_parse_card_name(struct snd_soc_card *card,
+int simple_util_parse_card_name(struct snd_soc_card *card,
 				char *prefix);
 
-int asoc_simple_parse_clk(struct device *dev,
+int simple_util_parse_clk(struct device *dev,
 			  struct device_node *node,
-			  struct asoc_simple_dai *simple_dai,
+			  struct simple_util_dai *simple_dai,
 			  struct snd_soc_dai_link_component *dlc);
-int asoc_simple_startup(struct snd_pcm_substream *substream);
-void asoc_simple_shutdown(struct snd_pcm_substream *substream);
-int asoc_simple_hw_params(struct snd_pcm_substream *substream,
+int simple_util_startup(struct snd_pcm_substream *substream);
+void simple_util_shutdown(struct snd_pcm_substream *substream);
+int simple_util_hw_params(struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params);
-int asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd);
-int asoc_simple_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+int simple_util_dai_init(struct snd_soc_pcm_runtime *rtd);
+int simple_util_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				   struct snd_pcm_hw_params *params);
 
-#define asoc_simple_parse_tdm(np, dai)			\
+#define simple_util_parse_tdm(np, dai)				\
 	snd_soc_of_parse_tdm_slot(np,	&(dai)->tx_slot_mask,	\
 					&(dai)->rx_slot_mask,	\
 					&(dai)->slots,		\
 					&(dai)->slot_width);
 
-void asoc_simple_canonicalize_platform(struct snd_soc_dai_link_component *platforms,
+void simple_util_canonicalize_platform(struct snd_soc_dai_link_component *platforms,
 				       struct snd_soc_dai_link_component *cpus);
-void asoc_simple_canonicalize_cpu(struct snd_soc_dai_link_component *cpus,
+void simple_util_canonicalize_cpu(struct snd_soc_dai_link_component *cpus,
 				  int is_single_links);
 
-void asoc_simple_clean_reference(struct snd_soc_card *card);
+void simple_util_clean_reference(struct snd_soc_card *card);
 
-void asoc_simple_parse_convert(struct device_node *np, char *prefix,
-			       struct asoc_simple_data *data);
-bool asoc_simple_is_convert_required(const struct asoc_simple_data *data);
+void simple_util_parse_convert(struct device_node *np, char *prefix,
+			       struct simple_util_data *data);
+bool simple_util_is_convert_required(const struct simple_util_data *data);
 
-int asoc_simple_parse_routing(struct snd_soc_card *card,
+int simple_util_parse_routing(struct snd_soc_card *card,
 				      char *prefix);
-int asoc_simple_parse_widgets(struct snd_soc_card *card,
+int simple_util_parse_widgets(struct snd_soc_card *card,
 				      char *prefix);
-int asoc_simple_parse_pin_switches(struct snd_soc_card *card,
+int simple_util_parse_pin_switches(struct snd_soc_card *card,
 				   char *prefix);
 
-int asoc_simple_init_jack(struct snd_soc_card *card,
-			       struct asoc_simple_jack *sjack,
+int simple_util_init_jack(struct snd_soc_card *card,
+			       struct simple_util_jack *sjack,
 			       int is_hp, char *prefix, char *pin);
-int asoc_simple_init_aux_jacks(struct asoc_simple_priv *priv,
+int simple_util_init_aux_jacks(struct simple_util_priv *priv,
 				char *prefix);
-int asoc_simple_init_priv(struct asoc_simple_priv *priv,
+int simple_util_init_priv(struct simple_util_priv *priv,
 			       struct link_info *li);
-int asoc_simple_remove(struct platform_device *pdev);
+int simple_util_remove(struct platform_device *pdev);
 
-int asoc_graph_card_probe(struct snd_soc_card *card);
-int asoc_graph_is_ports0(struct device_node *port);
-int asoc_graph_parse_dai(struct device *dev, struct device_node *ep,
+int graph_util_card_probe(struct snd_soc_card *card);
+int graph_util_is_ports0(struct device_node *port);
+int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 			 struct snd_soc_dai_link_component *dlc, int *is_single_link);
 
 #ifdef DEBUG
-static inline void asoc_simple_debug_dai(struct asoc_simple_priv *priv,
+static inline void simple_util_debug_dai(struct simple_util_priv *priv,
 					 char *name,
-					 struct asoc_simple_dai *dai)
+					 struct simple_util_dai *dai)
 {
 	struct device *dev = simple_priv_to_dev(priv);
 
@@ -228,7 +268,7 @@ static inline void asoc_simple_debug_dai(struct asoc_simple_priv *priv,
 			name, dai->clk_direction ? "OUT" : "IN");
 }
 
-static inline void asoc_simple_debug_info(struct asoc_simple_priv *priv)
+static inline void simple_util_debug_info(struct simple_util_priv *priv)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
 	struct device *dev = simple_priv_to_dev(priv);
@@ -241,7 +281,7 @@ static inline void asoc_simple_debug_info(struct asoc_simple_priv *priv)
 	for (i = 0; i < card->num_links; i++) {
 		struct simple_dai_props *props = simple_priv_to_props(priv, i);
 		struct snd_soc_dai_link *link = simple_priv_to_link(priv, i);
-		struct asoc_simple_dai *dai;
+		struct simple_util_dai *dai;
 		struct snd_soc_codec_conf *cnf;
 		int j;
 
@@ -249,10 +289,10 @@ static inline void asoc_simple_debug_info(struct asoc_simple_priv *priv)
 
 		dev_dbg(dev, "cpu num = %d\n", link->num_cpus);
 		for_each_prop_dai_cpu(props, j, dai)
-			asoc_simple_debug_dai(priv, "cpu", dai);
+			simple_util_debug_dai(priv, "cpu", dai);
 		dev_dbg(dev, "codec num = %d\n", link->num_codecs);
 		for_each_prop_dai_codec(props, j, dai)
-			asoc_simple_debug_dai(priv, "codec", dai);
+			simple_util_debug_dai(priv, "codec", dai);
 
 		if (link->name)
 			dev_dbg(dev, "dai name = %s\n", link->name);
@@ -270,7 +310,7 @@ static inline void asoc_simple_debug_info(struct asoc_simple_priv *priv)
 	}
 }
 #else
-#define  asoc_simple_debug_info(priv)
+#define  simple_util_debug_info(priv)
 #endif /* DEBUG */
 
 #endif /* __SIMPLE_CARD_UTILS_H */
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 5b18a4af022f..ecbd26dd7dfa 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -41,7 +41,7 @@ static void asoc_simple_fixup_sample_fmt(struct asoc_simple_data *data,
 	}
 }
 
-void asoc_simple_parse_convert(struct device_node *np,
+void simple_util_parse_convert(struct device_node *np,
 			       char *prefix,
 			       struct asoc_simple_data *data)
 {
@@ -62,7 +62,7 @@ void asoc_simple_parse_convert(struct device_node *np,
 	snprintf(prop, sizeof(prop), "%s%s", prefix, "convert-sample-format");
 	of_property_read_string(np, prop, &data->convert_sample_format);
 }
-EXPORT_SYMBOL_GPL(asoc_simple_parse_convert);
+EXPORT_SYMBOL_GPL(simple_util_parse_convert);
 
 /**
  * asoc_simple_is_convert_required() - Query if HW param conversion was requested
@@ -71,15 +71,15 @@ EXPORT_SYMBOL_GPL(asoc_simple_parse_convert);
  * Returns true if any HW param conversion was requested for this DAI link with
  * any "convert-xxx" properties.
  */
-bool asoc_simple_is_convert_required(const struct asoc_simple_data *data)
+bool simple_util_is_convert_required(const struct asoc_simple_data *data)
 {
 	return data->convert_rate ||
 	       data->convert_channels ||
 	       data->convert_sample_format;
 }
-EXPORT_SYMBOL_GPL(asoc_simple_is_convert_required);
+EXPORT_SYMBOL_GPL(simple_util_is_convert_required);
 
-int asoc_simple_parse_daifmt(struct device *dev,
+int simple_util_parse_daifmt(struct device *dev,
 			     struct device_node *node,
 			     struct device_node *codec,
 			     char *prefix,
@@ -113,9 +113,9 @@ int asoc_simple_parse_daifmt(struct device *dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(asoc_simple_parse_daifmt);
+EXPORT_SYMBOL_GPL(simple_util_parse_daifmt);
 
-int asoc_simple_parse_tdm_width_map(struct device *dev, struct device_node *np,
+int simple_util_parse_tdm_width_map(struct device *dev, struct device_node *np,
 				    struct asoc_simple_dai *dai)
 {
 	u32 *array_values, *p;
@@ -158,9 +158,9 @@ int asoc_simple_parse_tdm_width_map(struct device *dev, struct device_node *np,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(asoc_simple_parse_tdm_width_map);
+EXPORT_SYMBOL_GPL(simple_util_parse_tdm_width_map);
 
-int asoc_simple_set_dailink_name(struct device *dev,
+int simple_util_set_dailink_name(struct device *dev,
 				 struct snd_soc_dai_link *dai_link,
 				 const char *fmt, ...)
 {
@@ -181,9 +181,9 @@ int asoc_simple_set_dailink_name(struct device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(asoc_simple_set_dailink_name);
+EXPORT_SYMBOL_GPL(simple_util_set_dailink_name);
 
-int asoc_simple_parse_card_name(struct snd_soc_card *card,
+int simple_util_parse_card_name(struct snd_soc_card *card,
 				char *prefix)
 {
 	int ret;
@@ -207,7 +207,7 @@ int asoc_simple_parse_card_name(struct snd_soc_card *card,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(asoc_simple_parse_card_name);
+EXPORT_SYMBOL_GPL(simple_util_parse_card_name);
 
 static int asoc_simple_clk_enable(struct asoc_simple_dai *dai)
 {
@@ -223,7 +223,7 @@ static void asoc_simple_clk_disable(struct asoc_simple_dai *dai)
 		clk_disable_unprepare(dai->clk);
 }
 
-int asoc_simple_parse_clk(struct device *dev,
+int simple_util_parse_clk(struct device *dev,
 			  struct device_node *node,
 			  struct asoc_simple_dai *simple_dai,
 			  struct snd_soc_dai_link_component *dlc)
@@ -258,7 +258,7 @@ int asoc_simple_parse_clk(struct device *dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(asoc_simple_parse_clk);
+EXPORT_SYMBOL_GPL(simple_util_parse_clk);
 
 static int asoc_simple_check_fixed_sysclk(struct device *dev,
 					  struct asoc_simple_dai *dai,
@@ -276,7 +276,7 @@ static int asoc_simple_check_fixed_sysclk(struct device *dev,
 	return 0;
 }
 
-int asoc_simple_startup(struct snd_pcm_substream *substream)
+int simple_util_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
@@ -334,9 +334,9 @@ int asoc_simple_startup(struct snd_pcm_substream *substream)
 	}
 	return ret;
 }
-EXPORT_SYMBOL_GPL(asoc_simple_startup);
+EXPORT_SYMBOL_GPL(simple_util_startup);
 
-void asoc_simple_shutdown(struct snd_pcm_substream *substream)
+void simple_util_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
@@ -363,7 +363,7 @@ void asoc_simple_shutdown(struct snd_pcm_substream *substream)
 		asoc_simple_clk_disable(dai);
 	}
 }
-EXPORT_SYMBOL_GPL(asoc_simple_shutdown);
+EXPORT_SYMBOL_GPL(simple_util_shutdown);
 
 static int asoc_simple_set_clk_rate(struct device *dev,
 				    struct asoc_simple_dai *simple_dai,
@@ -424,7 +424,7 @@ static int asoc_simple_set_tdm(struct snd_soc_dai *dai,
 	return 0;
 }
 
-int asoc_simple_hw_params(struct snd_pcm_substream *substream,
+int simple_util_hw_params(struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
@@ -494,9 +494,9 @@ int asoc_simple_hw_params(struct snd_pcm_substream *substream,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(asoc_simple_hw_params);
+EXPORT_SYMBOL_GPL(simple_util_hw_params);
 
-int asoc_simple_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+int simple_util_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				   struct snd_pcm_hw_params *params)
 {
 	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
@@ -518,7 +518,7 @@ int asoc_simple_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(asoc_simple_be_hw_params_fixup);
+EXPORT_SYMBOL_GPL(simple_util_be_hw_params_fixup);
 
 static int asoc_simple_init_dai(struct snd_soc_dai *dai,
 				     struct asoc_simple_dai *simple_dai)
@@ -609,7 +609,7 @@ static int asoc_simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
-int asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd)
+int simple_util_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->num);
@@ -633,9 +633,9 @@ int asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(asoc_simple_dai_init);
+EXPORT_SYMBOL_GPL(simple_util_dai_init);
 
-void asoc_simple_canonicalize_platform(struct snd_soc_dai_link_component *platforms,
+void simple_util_canonicalize_platform(struct snd_soc_dai_link_component *platforms,
 				       struct snd_soc_dai_link_component *cpus)
 {
 	/*
@@ -651,9 +651,9 @@ void asoc_simple_canonicalize_platform(struct snd_soc_dai_link_component *platfo
 	if (!platforms->of_node)
 		snd_soc_dlc_use_cpu_as_platform(platforms, cpus);
 }
-EXPORT_SYMBOL_GPL(asoc_simple_canonicalize_platform);
+EXPORT_SYMBOL_GPL(simple_util_canonicalize_platform);
 
-void asoc_simple_canonicalize_cpu(struct snd_soc_dai_link_component *cpus,
+void simple_util_canonicalize_cpu(struct snd_soc_dai_link_component *cpus,
 				  int is_single_links)
 {
 	/*
@@ -668,9 +668,9 @@ void asoc_simple_canonicalize_cpu(struct snd_soc_dai_link_component *cpus,
 	if (is_single_links)
 		cpus->dai_name = NULL;
 }
-EXPORT_SYMBOL_GPL(asoc_simple_canonicalize_cpu);
+EXPORT_SYMBOL_GPL(simple_util_canonicalize_cpu);
 
-void asoc_simple_clean_reference(struct snd_soc_card *card)
+void simple_util_clean_reference(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_soc_dai_link_component *cpu;
@@ -684,9 +684,9 @@ void asoc_simple_clean_reference(struct snd_soc_card *card)
 			of_node_put(codec->of_node);
 	}
 }
-EXPORT_SYMBOL_GPL(asoc_simple_clean_reference);
+EXPORT_SYMBOL_GPL(simple_util_clean_reference);
 
-int asoc_simple_parse_routing(struct snd_soc_card *card,
+int simple_util_parse_routing(struct snd_soc_card *card,
 			      char *prefix)
 {
 	struct device_node *node = card->dev->of_node;
@@ -702,9 +702,9 @@ int asoc_simple_parse_routing(struct snd_soc_card *card,
 
 	return snd_soc_of_parse_audio_routing(card, prop);
 }
-EXPORT_SYMBOL_GPL(asoc_simple_parse_routing);
+EXPORT_SYMBOL_GPL(simple_util_parse_routing);
 
-int asoc_simple_parse_widgets(struct snd_soc_card *card,
+int simple_util_parse_widgets(struct snd_soc_card *card,
 			      char *prefix)
 {
 	struct device_node *node = card->dev->of_node;
@@ -721,9 +721,9 @@ int asoc_simple_parse_widgets(struct snd_soc_card *card,
 	/* no widgets is not error */
 	return 0;
 }
-EXPORT_SYMBOL_GPL(asoc_simple_parse_widgets);
+EXPORT_SYMBOL_GPL(simple_util_parse_widgets);
 
-int asoc_simple_parse_pin_switches(struct snd_soc_card *card,
+int simple_util_parse_pin_switches(struct snd_soc_card *card,
 				   char *prefix)
 {
 	char prop[128];
@@ -735,9 +735,9 @@ int asoc_simple_parse_pin_switches(struct snd_soc_card *card,
 
 	return snd_soc_of_parse_pin_switches(card, prop);
 }
-EXPORT_SYMBOL_GPL(asoc_simple_parse_pin_switches);
+EXPORT_SYMBOL_GPL(simple_util_parse_pin_switches);
 
-int asoc_simple_init_jack(struct snd_soc_card *card,
+int simple_util_init_jack(struct snd_soc_card *card,
 			  struct asoc_simple_jack *sjack,
 			  int is_hp, char *prefix,
 			  char *pin)
@@ -793,9 +793,9 @@ int asoc_simple_init_jack(struct snd_soc_card *card,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(asoc_simple_init_jack);
+EXPORT_SYMBOL_GPL(simple_util_init_jack);
 
-int asoc_simple_init_aux_jacks(struct asoc_simple_priv *priv, char *prefix)
+int simple_util_init_aux_jacks(struct asoc_simple_priv *priv, char *prefix)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
 	struct snd_soc_component *component;
@@ -842,9 +842,9 @@ int asoc_simple_init_aux_jacks(struct asoc_simple_priv *priv, char *prefix)
 	}
 	return 0;
 }
-EXPORT_SYMBOL_GPL(asoc_simple_init_aux_jacks);
+EXPORT_SYMBOL_GPL(simple_util_init_aux_jacks);
 
-int asoc_simple_init_priv(struct asoc_simple_priv *priv,
+int simple_util_init_priv(struct asoc_simple_priv *priv,
 			  struct link_info *li)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
@@ -956,9 +956,9 @@ int asoc_simple_init_priv(struct asoc_simple_priv *priv,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(asoc_simple_init_priv);
+EXPORT_SYMBOL_GPL(simple_util_init_priv);
 
-int asoc_simple_remove(struct platform_device *pdev)
+int simple_util_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 
@@ -966,9 +966,9 @@ int asoc_simple_remove(struct platform_device *pdev)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(asoc_simple_remove);
+EXPORT_SYMBOL_GPL(simple_util_remove);
 
-int asoc_graph_card_probe(struct snd_soc_card *card)
+int graph_util_card_probe(struct snd_soc_card *card)
 {
 	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(card);
 	int ret;
@@ -983,9 +983,9 @@ int asoc_graph_card_probe(struct snd_soc_card *card)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(asoc_graph_card_probe);
+EXPORT_SYMBOL_GPL(graph_util_card_probe);
 
-int asoc_graph_is_ports0(struct device_node *np)
+int graph_util_is_ports0(struct device_node *np)
 {
 	struct device_node *port, *ports, *ports0, *top;
 	int ret;
@@ -1011,7 +1011,7 @@ int asoc_graph_is_ports0(struct device_node *np)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(asoc_graph_is_ports0);
+EXPORT_SYMBOL_GPL(graph_util_is_ports0);
 
 static int graph_get_dai_id(struct device_node *ep)
 {
@@ -1066,7 +1066,7 @@ static int graph_get_dai_id(struct device_node *ep)
 	return id;
 }
 
-int asoc_graph_parse_dai(struct device *dev, struct device_node *ep,
+int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 			 struct snd_soc_dai_link_component *dlc, int *is_single_link)
 {
 	struct device_node *node;
@@ -1129,7 +1129,7 @@ int asoc_graph_parse_dai(struct device *dev, struct device_node *ep,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(asoc_graph_parse_dai);
+EXPORT_SYMBOL_GPL(graph_util_parse_dai);
 
 /* Module information */
 MODULE_AUTHOR("Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>");
-- 
2.25.1

