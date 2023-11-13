Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 358C37E9429
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 02:38:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0994C84A;
	Mon, 13 Nov 2023 02:38:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0994C84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699839538;
	bh=qXMk6wPl5s0oYGEv1K3A3lhfKxHGEfcxCoK8YaF1hY0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=muQ6obNOSQNnq5tjHMpzHXyGOS/NGHsfh/VPuApYEsAbOLetaRUs9vRvCBmkfZBaz
	 eL5LIackTa5CgUaFA+j5TgoxJExWk3qWqbSGkRIkVkHaUbWdRQsKx4SqthYF4U17K2
	 15Tyvr5EDa1rwam0fdHrGHkR6rmuF2DmMpJSRfMk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6390AF80564; Mon, 13 Nov 2023 02:37:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C755FF80563;
	Mon, 13 Nov 2023 02:37:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 067DCF802E8; Mon, 13 Nov 2023 02:29:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 362FEF80093
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 02:29:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 362FEF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=p0V8MGJD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dl4UoS8c+oOpvlqGl1F04CbFeUhncKM+lmtgdsm2ZtMtnn8ozqcuO4sPXwiKo621QDxIIBubsn3Vz+aq8f9HAdxM9L1vYxIt1Ioxn9oNSS2G0m0f3622syr9M6C4dPnao7AIUEMKL7QCJ1FxJu4C3HORQG27d/M1ciSuS/HrK3KdC74lE/7KUjeiQ4tkr6xj3UySuUGhxTFhIWhSVuvSjSFgBIXXzHoZzsyw0k7aNv9K61WLWWnHsQMlTplh8s7CEpdX/VcDowBuixYvHok5o+S2P/lwoFMDzagRrUtltEr9ex2dcH63denqPnDkh4GXWh51FV3AKAjS6wqjoGMbhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rh+zD44dFT2EJaVtm9IsUpVq9y8f8ECkxLzw1/NSXoU=;
 b=bMUc8if7BHoIaLqkKGcqXJGT9mOLmHMrNpMpYgj9d9D+Ok3w8U40Q9Fhqgsc2gJA5pfBcWeLJjen5EDvg3UnA8kg5fICDv7ef0Vxb0krMqOzDmj7rfQqiPs6gAMompPJ80B5Pb35F113/inl/zv3hxJg1zM44XQp5/eWJtThMgLgl6grHHa76BUtj9maQ0VX7DkM3aBNfXsFoAv2gcqMrxyWVb+aqGYWQh+dNGxfh2N0xztFDs1oac9xQpJ4KJ3XiDUrfuBpeIIW/tMe7hD+FJniKWuxJiMFn5cfAr+6lXSPx2wzl7LFonhXKfXO9WJc4EHlU+fTn1taH5rgtJYrdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rh+zD44dFT2EJaVtm9IsUpVq9y8f8ECkxLzw1/NSXoU=;
 b=p0V8MGJDsnfak/cxwJti9bQQkctNueeLe2z+U6nFbRdGGT4bndIj+NWVa09HT0Zp5o2zHlRsIU8B7ZSucALEGHSHFNkfYTwowiwq0FnRw5RwY2QgZM6a6ZFcpZ9j952zRSCo3vAZpYTB1ij27uKK0xNWFmXWmQCDw0yb1Iskxmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com (2603:1096:603:1a::14)
 by TYCPR01MB10494.jpnprd01.prod.outlook.com (2603:1096:400:306::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 01:29:24 +0000
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d]) by OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 01:29:24 +0000
Message-ID: <87r0ku4f0t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 3/5] ASoC: audio-graph-card2: add CPU:Codec = N:M support
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
In-Reply-To: <87v8a64f3d.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8a64f3d.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Nov 2023 01:29:23 +0000
X-ClientProxiedBy: TYCP301CA0011.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::14) To OSAPR01MB2178.jpnprd01.prod.outlook.com
 (2603:1096:603:1a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSAPR01MB2178:EE_|TYCPR01MB10494:EE_
X-MS-Office365-Filtering-Correlation-Id: 8424a243-2962-4790-b7fb-08dbe3e7f7f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IS40KBgvSZTdRx2+tR7D3w3bi7iJB+I2BtnKdJK7j2NxWNVUFebnJP8zNBlqNld398Sz8OgdO2aqaC42ZWdTJ2QCIVxQkCy1IijnicJucpDuA/QtEgRw7Pm7SSNohHuMIl+gsWn00F7PNlDUXnrRwGQ95+aN+PcA1DzU139qYQ4utJ/HI+9uHt7ug6sGW4qffXnUfXts779cr5oJhwOdxCPS6FTHKCzTY0y3Nl9eb8SUR3VRXHMJgZlZe3e3g6MVrSrz3EbuA8StxeJqT0yfd3yZBoU/FE965+C7nNkswVBwFOziC2MV/9fxUDS7CQ6KqSsfXZw19JmqHA4L2/eduz3+rnVwtNNJic55raWIUglHto9UCl/u+rGRhDygKbK57OnFdbxmNRptq/xUVcsfeurGxi9x+8BXJu7z1c9y0mmgOAai5fybW0v6YD9Lwr2vgc218fmVjcnL0yKGwv7j2HLLSpvbxv7pCyDBPWPNrRhtOL76cyzfkNrgbTq6GO09NKO7F1JgacogWPeOyhZFrFH6UbF0wh3bjqcqHxD4wFR2ZSd2FBlEU1/UBw+jFJBWZddHbEJEN1d2JXFEJ+wJ0dY4NQOMJp/92aUFT6onr27+TrL3dzcmKcNfwAtDXDrCUcnjIomU670eBrwE1xLJYQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(6506007)(52116002)(478600001)(86362001)(26005)(2616005)(6512007)(316002)(66556008)(66476007)(66946007)(6486002)(38100700002)(83380400001)(5660300002)(2013699003)(7416002)(38350700005)(8936002)(36756003)(8676002)(4326008)(110136005)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZfHciuw0IDXtIRtjPFxg4Wv/lfgmGL8EcUImT0RUR6LdqfKT22Fvf18i5B57?=
 =?us-ascii?Q?maSKbbf06GN8mccy6XfYUhB5LrNl12KxfwN/KjOY+Mfx6BrokFqjgDePyppm?=
 =?us-ascii?Q?J7Np6dU6U8uCOvEU7Jazheo3y000RJFSf0/J7abraUyl9r/J225jOAStZId5?=
 =?us-ascii?Q?K9U9RAUYc+YqC+wOs9VhwI1VNuk4EzfXLTIDoeb0wBCaUvoP3CjZuEO1dOby?=
 =?us-ascii?Q?juw6LxJrzzq0SHCxvgpg5xTQay9H5f8D5WSnPXkTJoCn/JwtvhMgjugXrTdN?=
 =?us-ascii?Q?3Xtu17Vd1rbUbvprNaUyxzKKhjFfLrlwxnv/u23XjiWbxrpOTmoEh4LsLRHc?=
 =?us-ascii?Q?xhFrWEV9FY0QScNGdCujLIm1AE0fshL1CD0vEVgCNiNAGAaVMI/ag08s2hYr?=
 =?us-ascii?Q?jg1GGswj/AV7YgMvQeKaIpuJgPPdXRNl+ZQaRoF1mQ7GGXX5Zk+Ig0YS/XTU?=
 =?us-ascii?Q?GKS2jbFp27hSQzrUmE5PJSOhsnd9LUn9gI1C4sVqNe+qEDOvl474BcVL587m?=
 =?us-ascii?Q?FGwdwobbU94L9hn58NQO7WFQgu0kZ2BvXa/+cFbne1GQQZjpHsEmtKqGOC+J?=
 =?us-ascii?Q?rSO13NYAhAj9upJ+rPF6HZSDSfbZNHL6mSgl4hylEdgEJBVvZVJhhjvwibXY?=
 =?us-ascii?Q?gTBUqG+2Z4tFG8NaS79RdSbW0f2IzyH9RuyVkezJJ0I5PaB7P5yor6RzZU+w?=
 =?us-ascii?Q?TgrDdzAJn4ieemIENqdN83JHjqQddQh6KIvSvCtGtRteJC+uQYneANKBKbV/?=
 =?us-ascii?Q?6dhC7Vx8uS+X7uFG6dPYE63KFzSVSMrxFfqEEZfP43oC35MvQPoGKM25vZgx?=
 =?us-ascii?Q?SYYih9NB226n7Xp+khCjsy7pY9Y3qkYxqSkjSh5UGjLbCN+KIifCM4ZgfBzb?=
 =?us-ascii?Q?cwHiEVtmU/xy/R53xMF3onelhvlvb1VLzP4/M9SF/Hr+pJYbw3ahY2s65XSZ?=
 =?us-ascii?Q?+Km70R85lbzj2YoBVUcvJZX3l/f26CblW5LMVOOz6JFwe/Nse19gYztw4M4C?=
 =?us-ascii?Q?9HHqMuw9a2iwvUoaQlVVepDuyIsCV4on/Bq3QhfVW3z/SZwQdLfZkCpjgPxE?=
 =?us-ascii?Q?ulM8ht//Fpe8gokmmBLDz2IpFEaMNX2faxIqkO0V2wVPgsLBWw15g1BxcmYO?=
 =?us-ascii?Q?5N1vrbwe6KgQmsnI5tZTmlHG52cfuGJ18WdBOEzucMdFnuRvFEPZkSksyjZp?=
 =?us-ascii?Q?c71LCHdLVULkbQJIUYZJ64u6AYu495lDJDsTWSMHuLNBk8AFG/7TiFT3yPgN?=
 =?us-ascii?Q?9Z204ORWfO5p2mZjXPwUGcvK3TzYDsL8blJbYyijZd1PhDyOqLdFnd7BMV9g?=
 =?us-ascii?Q?0d41X3SMSEhHdtBekTkZKlOdZ590kT8u0HO63IXqmXVwWadKrDyc1h4Iteif?=
 =?us-ascii?Q?XCIm4jwb5TXxPucVsPuLIzRxDJDCXstrVBe7KDRmvZPC8eZKlaliy1sURt7q?=
 =?us-ascii?Q?wyLuDkSp0EafBp4/M7tl1gvZbXOysaMGSIxVLkTgufokPFDZW7V+ZWUig/Qy?=
 =?us-ascii?Q?8A3zrs8zJG+DPKu0jBj8jUJ4E2EcZ+OGSP3u4IB7/iUgMjPdjWaKEl7d0Xkf?=
 =?us-ascii?Q?hxkSFAhmyEWaB14z5iW6rTbQBEx2UpNP7zvvK3hexzuXkDJI5+snkNInkmEn?=
 =?us-ascii?Q?JicmMdp4wgRVA5G6cuNzEOY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8424a243-2962-4790-b7fb-08dbe3e7f7f1
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 01:29:24.0706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DTilNRqHHz+4sNSGQ5zC41MsTzYJH+4H4IbLVFK+/B3lsda27qsXhyZwT+2JiBLoVIiEZ6eX0FkThqsgjnDDbn9wFW2CE7Dny0NGan2OLERBkd0ml8oHYx08ZftYyyUE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10494
Message-ID-Hash: WCNWOM2ZA4YAEF5BEQOR263HFRSLD7UM
X-Message-ID-Hash: WCNWOM2ZA4YAEF5BEQOR263HFRSLD7UM
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now ASoC is supporting CPU:Codec = N:M support.
This patch enables it on Audio Graph Card2.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 225 +++++++++++++++++++++++---
 1 file changed, 202 insertions(+), 23 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index c564f630abf6..d9e10308a508 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -504,40 +504,203 @@ static int __graph_parse_node(struct simple_util_priv *priv,
 	return 0;
 }
 
-static int graph_parse_node(struct simple_util_priv *priv,
-			    enum graph_type gtype,
-			    struct device_node *port,
-			    struct link_info *li, int is_cpu)
+static int graph_parse_node_multi_nm(struct snd_soc_dai_link *dai_link,
+				     int *nm_idx, int cpu_idx,
+				     struct device_node *mcpu_port)
 {
-	struct device_node *ep;
-	int ret = 0;
+	/*
+	 *		+---+		+---+
+	 *		|  X|<-@------->|x  |
+	 *		|   |		|   |
+	 *	cpu0 <--|A 1|<--------->|4 a|-> codec0
+	 *	cpu1 <--|B 2|<-----+--->|5 b|-> codec1
+	 *	cpu2 <--|C 3|<----/	+---+
+	 *		+---+
+	 *
+	 * multi {
+	 *	ports {
+	 *		port@0 { mcpu_top_ep	{...  = mcodec_ep;	}; };	// (X) to pair
+	 * <mcpu_port>	port@1 { mcpu0_ep	{ ... = cpu0_ep;	};	// (A) Multi Element
+	 *			 mcpu0_ep_0	{ ... = mcodec0_ep_0;	}; };	// (1) connected Codec
+	 *		port@2 { mcpu1_ep	{ ... = cpu1_ep;	};	// (B) Multi Element
+	 *			 mcpu1_ep_0	{ ... = mcodec1_ep_0;	}; };	// (2) connected Codec
+	 *		port@3 { mcpu2_ep	{ ... = cpu2_ep;	};	// (C) Multi Element
+	 *			 mcpu2_ep_0	{ ... = mcodec1_ep_1;	}; };	// (3) connected Codec
+	 *	};
+	 *
+	 *	ports {
+	 *		port@0 { mcodec_top_ep	{...  = mcpu_ep;	}; };	// (x) to pair
+	 * <mcodec_port>port@1 { mcodec0_ep	{ ... = codec0_ep;	};	// (a) Multi Element
+	 *			 mcodec0_ep_0	{ ... = mcpu0_ep_0;	}; };	// (4) connected CPU
+	 *		port@2 { mcodec1_ep	{ ... = codec1_ep;	};	// (b) Multi Element
+	 *			 mcodec1_ep_0	{ ... = mcpu1_ep_0;	};	// (5) connected CPU
+	 *			 mcodec1_ep_1	{ ... = mcpu2_ep_0;	}; };	// (5) connected CPU
+	 *	};
+	 * };
+	 */
+	struct device_node *mcpu_ep		= port_to_endpoint(mcpu_port);
+	struct device_node *mcpu_ep_n		= mcpu_ep;
+	struct device_node *mcpu_port_top	= of_get_next_child(of_get_parent(mcpu_port), NULL);
+	struct device_node *mcpu_ep_top		= port_to_endpoint(mcpu_port_top);
+	struct device_node *mcodec_ep_top	= of_graph_get_remote_endpoint(mcpu_ep_top);
+	struct device_node *mcodec_port_top	= of_get_parent(mcodec_ep_top);
+	struct device_node *mcodec_ports	= of_get_parent(mcodec_port_top);
+	int nm_max = max(dai_link->num_cpus, dai_link->num_codecs);
+	int ret = -EINVAL;
 
-	if (graph_lnk_is_multi(port)) {
-		int idx;
+	if (cpu_idx > dai_link->num_cpus)
+		goto mcpu_err;
 
-		of_node_get(port);
+	while (1) {
+		struct device_node *mcodec_ep_n;
+		struct device_node *mcodec_port_i;
+		struct device_node *mcodec_port;
+		int codec_idx;
 
-		for (idx = 0;; idx++) {
-			ep = graph_get_next_multi_ep(&port);
-			if (!ep)
-				break;
+		if (*nm_idx > nm_max)
+			break;
 
-			ret = __graph_parse_node(priv, gtype, ep,
-						 li, is_cpu, idx);
-			of_node_put(ep);
-			if (ret < 0)
+		mcpu_ep_n = of_get_next_child(mcpu_port, mcpu_ep_n);
+		if (!mcpu_ep_n) {
+			ret = 0;
+			break;
+		}
+
+		mcodec_ep_n	= of_graph_get_remote_endpoint(mcpu_ep_n);
+		mcodec_port	= of_get_parent(mcodec_ep_n);
+
+		if (mcodec_ports != of_get_parent(mcodec_port))
+			goto mcpu_err;
+
+		codec_idx = 0;
+		mcodec_port_i = of_get_next_child(mcodec_ports, NULL);
+		while (1) {
+			if (codec_idx > dai_link->num_codecs)
+				goto mcodec_err;
+
+			mcodec_port_i = of_get_next_child(mcodec_ports, mcodec_port_i);
+
+			if (!mcodec_port_i)
+				goto mcodec_err;
+
+			if (mcodec_port_i == mcodec_port)
 				break;
+
+			codec_idx++;
 		}
-	} else {
-		/* Single CPU / Codec */
-		ep = port_to_endpoint(port);
-		ret = __graph_parse_node(priv, gtype, ep, li, is_cpu, 0);
+
+		dai_link->ch_maps[*nm_idx].cpu		= cpu_idx;
+		dai_link->ch_maps[*nm_idx].codec	= codec_idx;
+
+		(*nm_idx)++;
+
+		of_node_put(mcodec_port_i);
+mcodec_err:
+		of_node_put(mcodec_port);
+		of_node_put(mcpu_ep_n);
+		of_node_put(mcodec_ep_n);
+	}
+mcpu_err:
+	of_node_put(mcpu_ep);
+	of_node_put(mcpu_port_top);
+	of_node_put(mcpu_ep_top);
+	of_node_put(mcodec_ep_top);
+	of_node_put(mcodec_port_top);
+	of_node_put(mcodec_ports);
+
+	return ret;
+}
+
+static int graph_parse_node_multi(struct simple_util_priv *priv,
+				  enum graph_type gtype,
+				  struct device_node *port,
+				  struct link_info *li, int is_cpu)
+{
+	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
+	struct device *dev = simple_priv_to_dev(priv);
+	struct device_node *ep;
+	int ret = -ENOMEM;
+	int nm_idx = 0;
+	int nm_max = max(dai_link->num_cpus, dai_link->num_codecs);
+
+	/*
+	 * create ch_maps if CPU:Codec = N:M
+	 * DPCM is out of scope
+	 */
+	if (gtype != GRAPH_DPCM && !dai_link->ch_maps &&
+	    dai_link->num_cpus > 1 && dai_link->num_codecs > 1 &&
+	    dai_link->num_cpus != dai_link->num_codecs) {
+
+		dai_link->ch_maps = devm_kcalloc(dev, nm_max,
+					sizeof(struct snd_soc_dai_link_ch_map), GFP_KERNEL);
+		if (!dai_link->ch_maps)
+			goto multi_err;
+	}
+
+	for (int idx = 0;; idx++) {
+		/*
+		 * multi {
+		 *	ports {
+		 * <port>	port@0 { ... 			    }; // to pair
+		 *		port@1 { mcpu1_ep { ... = cpu1_ep };}; // Multi Element
+		 *		port@2 { mcpu2_ep { ... = cpu2_ep };}; // Multi Element
+		 *	};
+		 * };
+		 *
+		 * cpu {
+		 *	ports {
+		 * <ep>		port@0 { cpu1_ep   { ... = mcpu1_ep };};
+		 *	};
+		 * };
+		 */
+		ep = graph_get_next_multi_ep(&port);
+		if (!ep)
+			break;
+
+		ret = __graph_parse_node(priv, gtype, ep, li, is_cpu, idx);
 		of_node_put(ep);
+		if (ret < 0)
+			goto multi_err;
+
+		/* CPU:Codec = N:M */
+		if (is_cpu && dai_link->ch_maps) {
+			ret = graph_parse_node_multi_nm(dai_link, &nm_idx, idx, port);
+			if (ret < 0)
+				goto multi_err;
+		}
 	}
 
+	if (is_cpu && dai_link->ch_maps && (nm_idx != nm_max))
+		ret = -EINVAL;
+
+multi_err:
 	return ret;
 }
 
+static int graph_parse_node_single(struct simple_util_priv *priv,
+				   enum graph_type gtype,
+				   struct device_node *port,
+				   struct link_info *li, int is_cpu)
+{
+	struct device_node *ep = port_to_endpoint(port);
+	int ret = __graph_parse_node(priv, gtype, ep, li, is_cpu, 0);
+
+	of_node_put(ep);
+
+	return ret;
+}
+
+static int graph_parse_node(struct simple_util_priv *priv,
+			    enum graph_type gtype,
+			    struct device_node *port,
+			    struct link_info *li, int is_cpu)
+{
+	if (graph_lnk_is_multi(port))
+		return graph_parse_node_multi(priv, gtype, port, li, is_cpu);
+	else
+		return graph_parse_node_single(priv, gtype, port, li, is_cpu);
+}
+
 static void graph_parse_daifmt(struct device_node *node,
 			       unsigned int *daifmt, unsigned int *bit_frame)
 {
@@ -929,8 +1092,24 @@ static int graph_counter(struct device_node *lnk)
 	 *
 	 * ignore first lnk part
 	 */
-	if (graph_lnk_is_multi(lnk))
-		return of_graph_get_endpoint_count(of_get_parent(lnk)) - 1;
+	if (graph_lnk_is_multi(lnk)) {
+		struct device_node *ports = of_get_parent(lnk);
+		struct device_node *port = NULL;
+		int cnt = 0;
+
+		/*
+		 * CPU/Codec = N:M case has many endpoints.
+		 * We can't use of_graph_get_endpoint_count() here
+		 */
+		while(1) {
+			port = of_get_next_child(ports, port);
+			if (!port)
+				break;
+			cnt++;
+		}
+
+		return cnt - 1;
+	}
 	/*
 	 * Single CPU / Codec
 	 */
-- 
2.25.1

