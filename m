Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F80379B166
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:55:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABA01E8B;
	Tue, 12 Sep 2023 01:54:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABA01E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476536;
	bh=0NW7Jd+jM93QMxuHGTMJNMuiyKuFdvlV0Pr9JGE3zZI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rSziPxY7qpHutFGO21I3KV6W5PadzNCScnCHQG0nPs4tphU95yNKLT0prw54N67L9
	 N2FDas6OupNBRjav2Z+8No4s1pOiDPZTA0Za0POGXP6OUgSHHGRDDhSKlmxrO8nG40
	 DcmRUUW81etdaROpYEW6rXW5Gb+oUs477KlXjRSM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B432F805F3; Tue, 12 Sep 2023 01:51:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91FB2F80684;
	Tue, 12 Sep 2023 01:51:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3F70F8067B; Tue, 12 Sep 2023 01:51:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E73BEF8047D
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E73BEF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UBwwdEA9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxYTHyrxzLkAFE2WuNTffCWfTaj2Fbsmr6/OEoBHNoCZmv5DJs/OCvfo0EmWUGsImmf4EPQaGzwPb2VcyVybP3YF0CytixvQN5glOmeOOgnX4Uu/RuTx11sddLoDLq6LSiAmvv7rPhPlrB7GYyxbNr3UtxlLcGCNbyx6cuosIqC4HiW/wucjSjwAN2c2Se89OC5lkWbc90FtoA6kMz4RTMyooIRDaKpXogtgmCKafbX1V8viHHRifApW3H2DodsMCjD+6fBdLqimakNcik5aPWmjezt20KOEC0K15eMYj2T1QOlqt1mDu/8E6bqhoWNuKDWbb6b2GcCn/fzStpY9fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v6/6SA3UzUd8mDge26qHMbZLmU4ZvCG7YtSqHMmSyQo=;
 b=VWpVD9AqiuZmiUc3IT7qk8A7Y1NQyRfFzE1EscY+e+LXxi1Y6zo25VljJD0DiZFePJNT2Cd62phDDuIJGxLs0h7sSwD7oCT4EbNGHf5W8FeBzIQqPXoSE8dzo5zMNfXl5cgYHEFoaGEyVP9EQIfxPb5xDtJiQi9YehSjXBEAs+yzshS8HqS6X9k3rhD8XClMAa12Stg0AXZ7m31kfYE5FGg9CmdWlmHS2dt4+Gme5VvYIOF4MMeqdJiWe6hVNCA/VTSjuJmb+qPRmAo8upU3cCcaSO/NAJ2m+ZeLeOHYNTxdxf2wgy+T2GqcReUSSnqC/NfleXi1qM/uoWTj8Zt1Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v6/6SA3UzUd8mDge26qHMbZLmU4ZvCG7YtSqHMmSyQo=;
 b=UBwwdEA9oyZ2XA7LuLkbBdHu5cApT/8Pe8juCq4Bzcl1QVkSuS2t56p+/rMoEVcL4XcmChD8rBLwusXgnLCxs7GS4SnUqG7bRxtIZqaL7DpNlwABI2RFIqHiaAS1MNTcu00j5ZaVtkRNOuGD11g5G8nd5iK/lmgOCPdUrhc1Nx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11567.jpnprd01.prod.outlook.com (2603:1096:604:22d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 23:49:40 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:49:40 +0000
Message-ID: <87h6o0qnho.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi
 Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 25/54] ASoC: generic: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:49:40 +0000
X-ClientProxiedBy: TYCPR01CA0015.jpnprd01.prod.outlook.com (2603:1096:405::27)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11567:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a0ea1c-f083-4c03-2a36-08dbb321c3e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PN1Hsb7LJ2gyfplKJvalU+FQdCV65rVUNEgQTHQTIGlI60dYT4OLr0KkQT3sg23QSHNqnte4EhjgCKkPS4ahRhKaXtDCfW9RBs/DNHesYtCi7xKgHHW5M0cVUUHIgh1oKTOsQbu12SxBq9+XSm4r90nrJKAqSmKvy9w4aNCOvUI/i+egZ1BYApKNXqqe+ylZHhYfulF0JILRhyZ5JoM5gH4MR8Kdw0kRyutDYrani07jU9/PYJDGtVJAKkr2pCuf6dE04vENVkaGO08pawZE/pm3ODOZkQMuYCV40fYN7lZwF4qY+1xTgDYTtFQRuJkF5AYD7rmUOOyPdr6e9acltW6gqHoDgTKVMjsjOWZgjbGdawfgxdo23RyiJ+WOnsVyTE2btYGc4wOf9QIMbSgZ7B7bQHkYkHLsaXG9VmyYUqajijfYtDpD+lD2ElxWhCT+ZB6Urc46Vh3u9UCY4BRi+QOKmoy9An88A7PSTPW+ifFU5BKIHKU9K50Mn19YETffoHnWaY6/7PTailxt0kxW/6C7gSwXOsTFzDqNU3L4erde7JkyVt3C5Bt+CfKvloNPr49Jx+xHPVVcm6ZaRTq6bjDjINNjxq/Scb6n+3rZda522QYhHtjgdLPc533WdAUL2wp08Fo5QqoP8qjx/Twf700s6epfYKKmVdbOBSKP+aI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(186009)(1800799009)(451199024)(6506007)(52116002)(6486002)(6512007)(478600001)(83380400001)(30864003)(2616005)(26005)(2906002)(66556008)(66946007)(66476007)(41300700001)(110136005)(5660300002)(8676002)(4326008)(8936002)(86362001)(36756003)(38100700002)(38350700002)(316002)(41533002)(21314003)(579004)(559001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QPZwDJYop1fJvuNz2UkCMp+tw4aCLksAwFayl2//BG+QctWlNVn0EgsbhZFy?=
 =?us-ascii?Q?7Md1mG2DWAvhlm5gT2r3GM3/tUHK0AFKUUjCIIWffrwJXwiAzJM0dh18Qoac?=
 =?us-ascii?Q?BQEr+lAoQs+NPRMbin1hfG6kvEKXfImRCc7BdtbDPEcjUlmPIVWK1Hx2buZX?=
 =?us-ascii?Q?kKZ34kZ3WtYqxxZW+2aRMy+x/mCc09VtgxI5f3KTV9sqD3pRwWh3OdV9AQjA?=
 =?us-ascii?Q?ko76l+qL3yRLqMhmwZpY2SExs/XgNVFwA3nmnDAUov44cccA9PiDkKzFXifm?=
 =?us-ascii?Q?vGccbjn1jJ1PtLQ8osdXmOk3Obwv2cHK9HBnGXtMOVeROZO0VMBcmakh5clr?=
 =?us-ascii?Q?J7af3BCir4unc+mFLPzQT/fc7u/oRsUdEMZPUVjToWDQUAKGGr9c1RqzNEhD?=
 =?us-ascii?Q?+cYV7mz7eLebQaUJXQKO3rlRShWI5K/bR8T40Itrn+vcga/dq669We/FXM1s?=
 =?us-ascii?Q?9FgOKz45uZ/8ExlKyXiNnkZ+Im7+XJXb+AYGZPYT3x108WaodIBA1U7QKyOs?=
 =?us-ascii?Q?nh6cfzFQYR/S+HUR5MDeFksuQCCUDv1h08XfY+D8OIExMbhyePcQ7XSdnI7r?=
 =?us-ascii?Q?2+jdsJx+A2VcPMSX6GtPjlzDbMUk82zg/up/Yye3lKB8JvIgmJoVHqBemAAG?=
 =?us-ascii?Q?67GmEfmr6Nsmnoz5+piyoJGN4cnt4ZT+AokHZjElnmvNe1knUgNIZNigY3KZ?=
 =?us-ascii?Q?Q06e8l9MFSkLCK5+wOLApkkxhs1FjBAQipmMjJXws5QCBnrQRCdn2p4cI0lT?=
 =?us-ascii?Q?z1wbsRQCcmNt8UgZHFrx2q907/ufnOm3EvHI98lIuSw7evDCgSDjstnmYcKK?=
 =?us-ascii?Q?HPLd4U0t0h4jdu7IySF5fZsUPKGzHGb5XBE2bUWOGW0oAOYYAeYqVeMIC3gN?=
 =?us-ascii?Q?IZwG64JAt2WLAzkuY02WyZg2J1K4QKwXUlknZz/dqz6Hi6MT6Eoge/RhDBMa?=
 =?us-ascii?Q?XVvxaag2DbbeQ9u2oElBjq8RZdwhmRYTW8lM5vHm8paQvwa6owTodkIcLwpt?=
 =?us-ascii?Q?s8iF7yrYXbXybhFMbHTBXMYqFGULSqGwUUQ+T/fUa6sYYksLu4UOdMaPxalr?=
 =?us-ascii?Q?SQ4xeokf4uBJI3+ITx6I4+OQuInMhFlTroKlTGMJeU4EGNw3+h5OzX3D8HUH?=
 =?us-ascii?Q?IedqS8UOe7rCjVkdv2cGj2uK+RIzLRQWSspKISqyTnNIwHXRA6+eUGPFgRi6?=
 =?us-ascii?Q?ITJze3IvB35eh9j5EYN9zNKJXquzkk9ISwuOt8XafLXZ0eBUZ13MiGSl+yN1?=
 =?us-ascii?Q?jq99uSSvZDjODXSIeYu3fkYbMCYDm3E4Nfs8lcRaMzfQl3H14QHyOfRwWA1z?=
 =?us-ascii?Q?H6HJ5TbVcsctlTNwCnn8kF/oLwixp1oyQAAWIaP7beh92Xy0eEoPCuZeZQmC?=
 =?us-ascii?Q?zodotUCnXNfMKCzwggywZItUnc8TS7wzW+PPsw0T731UeOsb9brH+ut8nFgt?=
 =?us-ascii?Q?CD7ei8FFWqScKGUM3zP8WcKLl1ErzmjqLZ8MD1BIhzk7XN8Y907I+QGjeQ4d?=
 =?us-ascii?Q?6U2lftOf6ANSf07+IgAVMpPZ4yy/DFFbtyR/7zHpb5UtJxYVfYKl6JgX18TU?=
 =?us-ascii?Q?yBurlqOCGAC+5+KDkgaOPdiLpLwOXr7LHCopiFctlqh/7aIPtZKpMGjw1M+o?=
 =?us-ascii?Q?VIf9N7Yiar3ZYZrKStBDFyA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 15a0ea1c-f083-4c03-2a36-08dbb321c3e4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:49:40.6228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +EsZFtowYNsImSMAsFArIAhxSc0n+9kg3pZjcJ6Lfz0To50S7SlXPR8usVQqfEmHMcFuTwJ0G9zE8aq64av5JHFyEH2hrNA5e8xTFJKVl5lwzcLrd1XxuKlWrdacDCYw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11567
Message-ID-Hash: 7WLLOAYDCNXGRB3Y2AXVPA7NQHRWUYZ7
X-Message-ID-Hash: 7WLLOAYDCNXGRB3Y2AXVPA7NQHRWUYZ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7WLLOAYDCNXGRB3Y2AXVPA7NQHRWUYZ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card.c          | 114 +++++++-------
 .../generic/audio-graph-card2-custom-sample.c |  32 ++--
 sound/soc/generic/audio-graph-card2.c         | 108 ++++++-------
 sound/soc/generic/simple-card-utils.c         | 125 ++++++++-------
 sound/soc/generic/simple-card.c               | 147 +++++++++---------
 sound/soc/generic/test-component.c            |   2 +-
 6 files changed, 263 insertions(+), 265 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 844a2ef15948c..e4a9420bba85f 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -27,7 +27,7 @@ static int graph_outdrv_event(struct snd_soc_dapm_widget *w,
 			      int event)
 {
 	struct snd_soc_dapm_context *dapm = w->dapm;
-	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(dapm->card);
+	struct simple_util_priv *priv = snd_soc_card_get_drvdata(dapm->card);
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -50,9 +50,9 @@ static const struct snd_soc_dapm_widget graph_dapm_widgets[] = {
 };
 
 static const struct snd_soc_ops graph_ops = {
-	.startup	= asoc_simple_startup,
-	.shutdown	= asoc_simple_shutdown,
-	.hw_params	= asoc_simple_hw_params,
+	.startup	= simple_util_startup,
+	.shutdown	= simple_util_shutdown,
+	.hw_params	= simple_util_hw_params,
 };
 
 static bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc)
@@ -68,18 +68,18 @@ static bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc)
 
 static void graph_parse_convert(struct device *dev,
 				struct device_node *ep,
-				struct asoc_simple_data *adata)
+				struct simple_util_data *adata)
 {
 	struct device_node *top = dev->of_node;
 	struct device_node *port = of_get_parent(ep);
 	struct device_node *ports = of_get_parent(port);
 	struct device_node *node = of_graph_get_port_parent(ep);
 
-	asoc_simple_parse_convert(top,   NULL,   adata);
+	simple_util_parse_convert(top,   NULL,   adata);
 	if (of_node_name_eq(ports, "ports"))
-		asoc_simple_parse_convert(ports, NULL, adata);
-	asoc_simple_parse_convert(port,  NULL,   adata);
-	asoc_simple_parse_convert(ep,    NULL,   adata);
+		simple_util_parse_convert(ports, NULL, adata);
+	simple_util_parse_convert(port,  NULL,   adata);
+	simple_util_parse_convert(ep,    NULL,   adata);
 
 	of_node_put(port);
 	of_node_put(ports);
@@ -103,7 +103,7 @@ static void graph_parse_mclk_fs(struct device_node *top,
 	of_node_put(ports);
 }
 
-static int graph_parse_node(struct asoc_simple_priv *priv,
+static int graph_parse_node(struct simple_util_priv *priv,
 			    struct device_node *ep,
 			    struct link_info *li,
 			    int *cpu)
@@ -113,35 +113,35 @@ static int graph_parse_node(struct asoc_simple_priv *priv,
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	struct snd_soc_dai_link_component *dlc;
-	struct asoc_simple_dai *dai;
+	struct simple_util_dai *dai;
 	int ret;
 
 	if (cpu) {
-		dlc = asoc_link_to_cpu(dai_link, 0);
+		dlc = snd_soc_link_to_cpu(dai_link, 0);
 		dai = simple_props_to_dai_cpu(dai_props, 0);
 	} else {
-		dlc = asoc_link_to_codec(dai_link, 0);
+		dlc = snd_soc_link_to_codec(dai_link, 0);
 		dai = simple_props_to_dai_codec(dai_props, 0);
 	}
 
 	graph_parse_mclk_fs(top, ep, dai_props);
 
-	ret = asoc_graph_parse_dai(dev, ep, dlc, cpu);
+	ret = graph_util_parse_dai(dev, ep, dlc, cpu);
 	if (ret < 0)
 		return ret;
 
-	ret = asoc_simple_parse_tdm(ep, dai);
+	ret = simple_util_parse_tdm(ep, dai);
 	if (ret < 0)
 		return ret;
 
-	ret = asoc_simple_parse_clk(dev, ep, dai, dlc);
+	ret = simple_util_parse_clk(dev, ep, dai, dlc);
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static int graph_link_init(struct asoc_simple_priv *priv,
+static int graph_link_init(struct simple_util_priv *priv,
 			   struct device_node *cpu_ep,
 			   struct device_node *codec_ep,
 			   struct link_info *li,
@@ -151,20 +151,20 @@ static int graph_link_init(struct asoc_simple_priv *priv,
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	int ret;
 
-	ret = asoc_simple_parse_daifmt(dev, cpu_ep, codec_ep,
+	ret = simple_util_parse_daifmt(dev, cpu_ep, codec_ep,
 				       NULL, &dai_link->dai_fmt);
 	if (ret < 0)
 		return ret;
 
-	dai_link->init		= asoc_simple_dai_init;
+	dai_link->init		= simple_util_dai_init;
 	dai_link->ops		= &graph_ops;
 	if (priv->ops)
 		dai_link->ops	= priv->ops;
 
-	return asoc_simple_set_dailink_name(dev, dai_link, name);
+	return simple_util_set_dailink_name(dev, dai_link, name);
 }
 
-static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
+static int graph_dai_link_of_dpcm(struct simple_util_priv *priv,
 				  struct device_node *cpu_ep,
 				  struct device_node *codec_ep,
 				  struct link_info *li)
@@ -181,8 +181,8 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 
 	if (li->cpu) {
 		struct snd_soc_card *card = simple_priv_to_card(priv);
-		struct snd_soc_dai_link_component *cpus = asoc_link_to_cpu(dai_link, 0);
-		struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
+		struct snd_soc_dai_link_component *cpus = snd_soc_link_to_cpu(dai_link, 0);
+		struct snd_soc_dai_link_component *platforms = snd_soc_link_to_platform(dai_link, 0);
 		int is_single_links = 0;
 
 		/* Codec is dummy */
@@ -209,14 +209,14 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 		 */
 		if (card->component_chaining && !soc_component_is_pcm(cpus)) {
 			dai_link->no_pcm = 1;
-			dai_link->be_hw_params_fixup = asoc_simple_be_hw_params_fixup;
+			dai_link->be_hw_params_fixup = simple_util_be_hw_params_fixup;
 		}
 
-		asoc_simple_canonicalize_cpu(cpus, is_single_links);
-		asoc_simple_canonicalize_platform(platforms, cpus);
+		simple_util_canonicalize_cpu(cpus, is_single_links);
+		simple_util_canonicalize_platform(platforms, cpus);
 	} else {
 		struct snd_soc_codec_conf *cconf = simple_props_to_codec_conf(dai_props, 0);
-		struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, 0);
+		struct snd_soc_dai_link_component *codecs = snd_soc_link_to_codec(dai_link, 0);
 		struct device_node *port;
 		struct device_node *ports;
 
@@ -224,7 +224,7 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 
 		/* BE settings */
 		dai_link->no_pcm		= 1;
-		dai_link->be_hw_params_fixup	= asoc_simple_be_hw_params_fixup;
+		dai_link->be_hw_params_fixup	= simple_util_be_hw_params_fixup;
 
 		ret = graph_parse_node(priv, codec_ep, li, NULL);
 		if (ret < 0)
@@ -258,16 +258,16 @@ static int graph_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	return ret;
 }
 
-static int graph_dai_link_of(struct asoc_simple_priv *priv,
+static int graph_dai_link_of(struct simple_util_priv *priv,
 			     struct device_node *cpu_ep,
 			     struct device_node *codec_ep,
 			     struct link_info *li)
 {
 	struct device *dev = simple_priv_to_dev(priv);
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
-	struct snd_soc_dai_link_component *cpus = asoc_link_to_cpu(dai_link, 0);
-	struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, 0);
-	struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
+	struct snd_soc_dai_link_component *cpus = snd_soc_link_to_cpu(dai_link, 0);
+	struct snd_soc_dai_link_component *codecs = snd_soc_link_to_codec(dai_link, 0);
+	struct snd_soc_dai_link_component *platforms = snd_soc_link_to_platform(dai_link, 0);
 	char dai_name[64];
 	int ret, is_single_links = 0;
 
@@ -284,8 +284,8 @@ static int graph_dai_link_of(struct asoc_simple_priv *priv,
 	snprintf(dai_name, sizeof(dai_name),
 		 "%s-%s", cpus->dai_name, codecs->dai_name);
 
-	asoc_simple_canonicalize_cpu(cpus, is_single_links);
-	asoc_simple_canonicalize_platform(platforms, cpus);
+	simple_util_canonicalize_cpu(cpus, is_single_links);
+	simple_util_canonicalize_platform(platforms, cpus);
 
 	ret = graph_link_init(priv, cpu_ep, codec_ep, li, dai_name);
 	if (ret < 0)
@@ -296,9 +296,9 @@ static int graph_dai_link_of(struct asoc_simple_priv *priv,
 	return 0;
 }
 
-static inline bool parse_as_dpcm_link(struct asoc_simple_priv *priv,
+static inline bool parse_as_dpcm_link(struct simple_util_priv *priv,
 				      struct device_node *codec_port,
-				      struct asoc_simple_data *adata)
+				      struct simple_util_data *adata)
 {
 	if (priv->force_dpcm)
 		return true;
@@ -312,19 +312,19 @@ static inline bool parse_as_dpcm_link(struct asoc_simple_priv *priv,
 	 * or has convert-xxx property
 	 */
 	if ((of_get_child_count(codec_port) > 1) ||
-	    asoc_simple_is_convert_required(adata))
+	    simple_util_is_convert_required(adata))
 		return true;
 
 	return false;
 }
 
-static int __graph_for_each_link(struct asoc_simple_priv *priv,
+static int __graph_for_each_link(struct simple_util_priv *priv,
 			struct link_info *li,
-			int (*func_noml)(struct asoc_simple_priv *priv,
+			int (*func_noml)(struct simple_util_priv *priv,
 					 struct device_node *cpu_ep,
 					 struct device_node *codec_ep,
 					 struct link_info *li),
-			int (*func_dpcm)(struct asoc_simple_priv *priv,
+			int (*func_dpcm)(struct simple_util_priv *priv,
 					 struct device_node *cpu_ep,
 					 struct device_node *codec_ep,
 					 struct link_info *li))
@@ -337,7 +337,7 @@ static int __graph_for_each_link(struct asoc_simple_priv *priv,
 	struct device_node *codec_ep;
 	struct device_node *codec_port;
 	struct device_node *codec_port_old = NULL;
-	struct asoc_simple_data adata;
+	struct simple_util_data adata;
 	int rc, ret = 0;
 
 	/* loop for all listed CPU port */
@@ -392,13 +392,13 @@ static int __graph_for_each_link(struct asoc_simple_priv *priv,
 	return 0;
 }
 
-static int graph_for_each_link(struct asoc_simple_priv *priv,
+static int graph_for_each_link(struct simple_util_priv *priv,
 			       struct link_info *li,
-			       int (*func_noml)(struct asoc_simple_priv *priv,
+			       int (*func_noml)(struct simple_util_priv *priv,
 						struct device_node *cpu_ep,
 						struct device_node *codec_ep,
 						struct link_info *li),
-			       int (*func_dpcm)(struct asoc_simple_priv *priv,
+			       int (*func_dpcm)(struct simple_util_priv *priv,
 						struct device_node *cpu_ep,
 						struct device_node *codec_ep,
 						struct link_info *li))
@@ -425,7 +425,7 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 	return ret;
 }
 
-static int graph_count_noml(struct asoc_simple_priv *priv,
+static int graph_count_noml(struct simple_util_priv *priv,
 			    struct device_node *cpu_ep,
 			    struct device_node *codec_ep,
 			    struct link_info *li)
@@ -454,7 +454,7 @@ static int graph_count_noml(struct asoc_simple_priv *priv,
 	return 0;
 }
 
-static int graph_count_dpcm(struct asoc_simple_priv *priv,
+static int graph_count_dpcm(struct simple_util_priv *priv,
 			    struct device_node *cpu_ep,
 			    struct device_node *codec_ep,
 			    struct link_info *li)
@@ -487,7 +487,7 @@ static int graph_count_dpcm(struct asoc_simple_priv *priv,
 	return 0;
 }
 
-static int graph_get_dais_count(struct asoc_simple_priv *priv,
+static int graph_get_dais_count(struct simple_util_priv *priv,
 				struct link_info *li)
 {
 	/*
@@ -541,7 +541,7 @@ static int graph_get_dais_count(struct asoc_simple_priv *priv,
 				   graph_count_dpcm);
 }
 
-int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
+int audio_graph_parse_of(struct simple_util_priv *priv, struct device *dev)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
 	struct link_info *li;
@@ -561,7 +561,7 @@ int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 	if (!li->link)
 		return -EINVAL;
 
-	ret = asoc_simple_init_priv(priv, li);
+	ret = simple_util_init_priv(priv, li);
 	if (ret < 0)
 		return ret;
 
@@ -572,11 +572,11 @@ int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 		return ret;
 	}
 
-	ret = asoc_simple_parse_widgets(card, NULL);
+	ret = simple_util_parse_widgets(card, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = asoc_simple_parse_routing(card, NULL);
+	ret = simple_util_parse_routing(card, NULL);
 	if (ret < 0)
 		return ret;
 
@@ -587,13 +587,13 @@ int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 	if (ret < 0)
 		goto err;
 
-	ret = asoc_simple_parse_card_name(card, NULL);
+	ret = simple_util_parse_card_name(card, NULL);
 	if (ret < 0)
 		goto err;
 
 	snd_soc_card_set_drvdata(card, priv);
 
-	asoc_simple_debug_info(priv);
+	simple_util_debug_info(priv);
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret < 0)
@@ -603,7 +603,7 @@ int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 	return 0;
 
 err:
-	asoc_simple_clean_reference(card);
+	simple_util_clean_reference(card);
 
 	return dev_err_probe(dev, ret, "parse error\n");
 }
@@ -611,7 +611,7 @@ EXPORT_SYMBOL_GPL(audio_graph_parse_of);
 
 static int graph_probe(struct platform_device *pdev)
 {
-	struct asoc_simple_priv *priv;
+	struct simple_util_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct snd_soc_card *card;
 
@@ -623,7 +623,7 @@ static int graph_probe(struct platform_device *pdev)
 	card = simple_priv_to_card(priv);
 	card->dapm_widgets	= graph_dapm_widgets;
 	card->num_dapm_widgets	= ARRAY_SIZE(graph_dapm_widgets);
-	card->probe		= asoc_graph_card_probe;
+	card->probe		= graph_util_card_probe;
 
 	if (of_device_get_match_data(dev))
 		priv->dpcm_selectable = 1;
@@ -646,7 +646,7 @@ static struct platform_driver graph_card = {
 		.of_match_table = graph_of_match,
 	},
 	.probe = graph_probe,
-	.remove = asoc_simple_remove,
+	.remove = simple_util_remove,
 };
 module_platform_driver(graph_card);
 
diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.c b/sound/soc/generic/audio-graph-card2-custom-sample.c
index a3142be9323ee..4dc65e249ecbe 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.c
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.c
@@ -12,10 +12,10 @@
 
 /*
  * Custom driver can have own priv
- * which includes asoc_simple_priv.
+ * which includes simple_util_priv.
  */
 struct custom_priv {
-	struct asoc_simple_priv simple_priv;
+	struct simple_util_priv simple_priv;
 
 	/* custom driver's own params */
 	int custom_params;
@@ -26,7 +26,7 @@ struct custom_priv {
 
 static int custom_card_probe(struct snd_soc_card *card)
 {
-	struct asoc_simple_priv *simple_priv = snd_soc_card_get_drvdata(card);
+	struct simple_util_priv *simple_priv = snd_soc_card_get_drvdata(card);
 	struct custom_priv *custom_priv = simple_to_custom(simple_priv);
 	struct device *dev = simple_priv_to_dev(simple_priv);
 
@@ -35,10 +35,10 @@ static int custom_card_probe(struct snd_soc_card *card)
 	custom_priv->custom_params = 1;
 
 	/* you can use generic probe function */
-	return asoc_graph_card_probe(card);
+	return graph_util_card_probe(card);
 }
 
-static int custom_hook_pre(struct asoc_simple_priv *priv)
+static int custom_hook_pre(struct simple_util_priv *priv)
 {
 	struct device *dev = simple_priv_to_dev(priv);
 
@@ -48,7 +48,7 @@ static int custom_hook_pre(struct asoc_simple_priv *priv)
 	return 0;
 }
 
-static int custom_hook_post(struct asoc_simple_priv *priv)
+static int custom_hook_post(struct simple_util_priv *priv)
 {
 	struct device *dev = simple_priv_to_dev(priv);
 	struct snd_soc_card *card;
@@ -63,7 +63,7 @@ static int custom_hook_post(struct asoc_simple_priv *priv)
 	return 0;
 }
 
-static int custom_normal(struct asoc_simple_priv *priv,
+static int custom_normal(struct simple_util_priv *priv,
 			 struct device_node *lnk,
 			 struct link_info *li)
 {
@@ -78,7 +78,7 @@ static int custom_normal(struct asoc_simple_priv *priv,
 	return audio_graph2_link_normal(priv, lnk, li);
 }
 
-static int custom_dpcm(struct asoc_simple_priv *priv,
+static int custom_dpcm(struct simple_util_priv *priv,
 		       struct device_node *lnk,
 		       struct link_info *li)
 {
@@ -93,7 +93,7 @@ static int custom_dpcm(struct asoc_simple_priv *priv,
 	return audio_graph2_link_dpcm(priv, lnk, li);
 }
 
-static int custom_c2c(struct asoc_simple_priv *priv,
+static int custom_c2c(struct simple_util_priv *priv,
 		      struct device_node *lnk,
 		      struct link_info *li)
 {
@@ -121,26 +121,26 @@ static struct graph2_custom_hooks custom_hooks = {
 
 static int custom_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct device *dev = simple_priv_to_dev(priv);
 
 	dev_info(dev, "custom startup\n");
 
-	return asoc_simple_startup(substream);
+	return simple_util_startup(substream);
 }
 
 /* You can use custom ops */
 static const struct snd_soc_ops custom_ops = {
 	.startup	= custom_startup,
-	.shutdown	= asoc_simple_shutdown,
-	.hw_params	= asoc_simple_hw_params,
+	.shutdown	= simple_util_shutdown,
+	.hw_params	= simple_util_hw_params,
 };
 
 static int custom_probe(struct platform_device *pdev)
 {
 	struct custom_priv *custom_priv;
-	struct asoc_simple_priv *simple_priv;
+	struct simple_util_priv *simple_priv;
 	struct device *dev = &pdev->dev;
 	int ret;
 
@@ -176,7 +176,7 @@ static struct platform_driver custom_card = {
 		.of_match_table = custom_of_match,
 	},
 	.probe	= custom_probe,
-	.remove	= asoc_simple_remove,
+	.remove	= simple_util_remove,
 };
 module_platform_driver(custom_card);
 
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index b1c675c6b6db6..5d856942bcaee 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -282,7 +282,7 @@ static enum graph_type __graph_get_type(struct device_node *lnk)
 
 }
 
-static enum graph_type graph_get_type(struct asoc_simple_priv *priv,
+static enum graph_type graph_get_type(struct simple_util_priv *priv,
 				      struct device_node *lnk)
 {
 	enum graph_type type = __graph_get_type(lnk);
@@ -298,7 +298,7 @@ static enum graph_type graph_get_type(struct asoc_simple_priv *priv,
 
 		switch (type) {
 		case GRAPH_DPCM:
-			if (asoc_graph_is_ports0(lnk))
+			if (graph_util_is_ports0(lnk))
 				str = "DPCM Front-End";
 			else
 				str = "DPCM Back-End";
@@ -360,9 +360,9 @@ static struct device_node *graph_get_next_multi_ep(struct device_node **port)
 }
 
 static const struct snd_soc_ops graph_ops = {
-	.startup	= asoc_simple_startup,
-	.shutdown	= asoc_simple_shutdown,
-	.hw_params	= asoc_simple_hw_params,
+	.startup	= simple_util_startup,
+	.shutdown	= simple_util_shutdown,
+	.hw_params	= simple_util_hw_params,
 };
 
 static void graph_parse_convert(struct device_node *ep,
@@ -370,12 +370,12 @@ static void graph_parse_convert(struct device_node *ep,
 {
 	struct device_node *port = of_get_parent(ep);
 	struct device_node *ports = of_get_parent(port);
-	struct asoc_simple_data *adata = &props->adata;
+	struct simple_util_data *adata = &props->adata;
 
 	if (of_node_name_eq(ports, "ports"))
-		asoc_simple_parse_convert(ports, NULL, adata);
-	asoc_simple_parse_convert(port, NULL, adata);
-	asoc_simple_parse_convert(ep,   NULL, adata);
+		simple_util_parse_convert(ports, NULL, adata);
+	simple_util_parse_convert(port, NULL, adata);
+	simple_util_parse_convert(ep,   NULL, adata);
 
 	of_node_put(port);
 	of_node_put(ports);
@@ -396,7 +396,7 @@ static void graph_parse_mclk_fs(struct device_node *ep,
 	of_node_put(ports);
 }
 
-static int __graph_parse_node(struct asoc_simple_priv *priv,
+static int __graph_parse_node(struct simple_util_priv *priv,
 			      enum graph_type gtype,
 			      struct device_node *ep,
 			      struct link_info *li,
@@ -406,32 +406,32 @@ static int __graph_parse_node(struct asoc_simple_priv *priv,
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	struct snd_soc_dai_link_component *dlc;
-	struct asoc_simple_dai *dai;
+	struct simple_util_dai *dai;
 	int ret, is_single_links = 0;
 
 	if (is_cpu) {
-		dlc = asoc_link_to_cpu(dai_link, idx);
+		dlc = snd_soc_link_to_cpu(dai_link, idx);
 		dai = simple_props_to_dai_cpu(dai_props, idx);
 	} else {
-		dlc = asoc_link_to_codec(dai_link, idx);
+		dlc = snd_soc_link_to_codec(dai_link, idx);
 		dai = simple_props_to_dai_codec(dai_props, idx);
 	}
 
 	graph_parse_mclk_fs(ep, dai_props);
 
-	ret = asoc_graph_parse_dai(dev, ep, dlc, &is_single_links);
+	ret = graph_util_parse_dai(dev, ep, dlc, &is_single_links);
 	if (ret < 0)
 		return ret;
 
-	ret = asoc_simple_parse_tdm(ep, dai);
+	ret = simple_util_parse_tdm(ep, dai);
 	if (ret < 0)
 		return ret;
 
-	ret = asoc_simple_parse_tdm_width_map(dev, ep, dai);
+	ret = simple_util_parse_tdm_width_map(dev, ep, dai);
 	if (ret < 0)
 		return ret;
 
-	ret = asoc_simple_parse_clk(dev, ep, dai, dlc);
+	ret = simple_util_parse_clk(dev, ep, dai, dlc);
 	if (ret < 0)
 		return ret;
 
@@ -440,7 +440,7 @@ static int __graph_parse_node(struct asoc_simple_priv *priv,
 	 */
 	if (!dai_link->name) {
 		struct snd_soc_dai_link_component *cpus = dlc;
-		struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, idx);
+		struct snd_soc_dai_link_component *codecs = snd_soc_link_to_codec(dai_link, idx);
 		char *cpu_multi   = "";
 		char *codec_multi = "";
 
@@ -453,22 +453,22 @@ static int __graph_parse_node(struct asoc_simple_priv *priv,
 		case GRAPH_NORMAL:
 			/* run is_cpu only. see audio_graph2_link_normal() */
 			if (is_cpu)
-				asoc_simple_set_dailink_name(dev, dai_link, "%s%s-%s%s",
+				simple_util_set_dailink_name(dev, dai_link, "%s%s-%s%s",
 							       cpus->dai_name,   cpu_multi,
 							     codecs->dai_name, codec_multi);
 			break;
 		case GRAPH_DPCM:
 			if (is_cpu)
-				asoc_simple_set_dailink_name(dev, dai_link, "fe.%pOFP.%s%s",
+				simple_util_set_dailink_name(dev, dai_link, "fe.%pOFP.%s%s",
 						cpus->of_node, cpus->dai_name, cpu_multi);
 			else
-				asoc_simple_set_dailink_name(dev, dai_link, "be.%pOFP.%s%s",
+				simple_util_set_dailink_name(dev, dai_link, "be.%pOFP.%s%s",
 						codecs->of_node, codecs->dai_name, codec_multi);
 			break;
 		case GRAPH_C2C:
 			/* run is_cpu only. see audio_graph2_link_c2c() */
 			if (is_cpu)
-				asoc_simple_set_dailink_name(dev, dai_link, "c2c.%s%s-%s%s",
+				simple_util_set_dailink_name(dev, dai_link, "c2c.%s%s-%s%s",
 							     cpus->dai_name,   cpu_multi,
 							     codecs->dai_name, codec_multi);
 			break;
@@ -482,7 +482,7 @@ static int __graph_parse_node(struct asoc_simple_priv *priv,
 	 * if DPCM-BE case
 	 */
 	if (!is_cpu && gtype == GRAPH_DPCM) {
-		struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, idx);
+		struct snd_soc_dai_link_component *codecs = snd_soc_link_to_codec(dai_link, idx);
 		struct snd_soc_codec_conf *cconf = simple_props_to_codec_conf(dai_props, idx);
 		struct device_node *rport  = of_get_parent(ep);
 		struct device_node *rports = of_get_parent(rport);
@@ -497,16 +497,16 @@ static int __graph_parse_node(struct asoc_simple_priv *priv,
 
 	if (is_cpu) {
 		struct snd_soc_dai_link_component *cpus = dlc;
-		struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, idx);
+		struct snd_soc_dai_link_component *platforms = snd_soc_link_to_platform(dai_link, idx);
 
-		asoc_simple_canonicalize_cpu(cpus, is_single_links);
-		asoc_simple_canonicalize_platform(platforms, cpus);
+		simple_util_canonicalize_cpu(cpus, is_single_links);
+		simple_util_canonicalize_platform(platforms, cpus);
 	}
 
 	return 0;
 }
 
-static int graph_parse_node(struct asoc_simple_priv *priv,
+static int graph_parse_node(struct simple_util_priv *priv,
 			    enum graph_type gtype,
 			    struct device_node *port,
 			    struct link_info *li, int is_cpu)
@@ -590,7 +590,7 @@ static void graph_parse_daifmt(struct device_node *node,
 	update_daifmt(INV);
 }
 
-static void graph_link_init(struct asoc_simple_priv *priv,
+static void graph_link_init(struct simple_util_priv *priv,
 			    struct device_node *port,
 			    struct link_info *li,
 			    int is_cpu_node)
@@ -638,13 +638,13 @@ static void graph_link_init(struct asoc_simple_priv *priv,
 		daiclk = snd_soc_daifmt_clock_provider_flipped(daiclk);
 
 	dai_link->dai_fmt	= daifmt | daiclk;
-	dai_link->init		= asoc_simple_dai_init;
+	dai_link->init		= simple_util_dai_init;
 	dai_link->ops		= &graph_ops;
 	if (priv->ops)
 		dai_link->ops	= priv->ops;
 }
 
-int audio_graph2_link_normal(struct asoc_simple_priv *priv,
+int audio_graph2_link_normal(struct simple_util_priv *priv,
 			     struct device_node *lnk,
 			     struct link_info *li)
 {
@@ -678,7 +678,7 @@ int audio_graph2_link_normal(struct asoc_simple_priv *priv,
 }
 EXPORT_SYMBOL_GPL(audio_graph2_link_normal);
 
-int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
+int audio_graph2_link_dpcm(struct simple_util_priv *priv,
 			   struct device_node *lnk,
 			   struct link_info *li)
 {
@@ -687,7 +687,7 @@ int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
 	struct device_node *rport = of_graph_get_remote_port(ep);
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
-	int is_cpu = asoc_graph_is_ports0(lnk);
+	int is_cpu = graph_util_is_ports0(lnk);
 	int ret;
 
 	if (is_cpu) {
@@ -713,7 +713,7 @@ int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
 		/*
 		 * setup CPU here, Codec is already set as dummy.
 		 * see
-		 *	asoc_simple_init_priv()
+		 *	simple_util_init_priv()
 		 */
 		dai_link->dynamic		= 1;
 		dai_link->dpcm_merged_format	= 1;
@@ -744,12 +744,12 @@ int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
 		/*
 		 * setup Codec here, CPU is already set as dummy.
 		 * see
-		 *	asoc_simple_init_priv()
+		 *	simple_util_init_priv()
 		 */
 
 		/* BE settings */
 		dai_link->no_pcm		= 1;
-		dai_link->be_hw_params_fixup	= asoc_simple_be_hw_params_fixup;
+		dai_link->be_hw_params_fixup	= simple_util_be_hw_params_fixup;
 
 		ret = graph_parse_node(priv, GRAPH_DPCM, rport, li, 0);
 		if (ret < 0)
@@ -771,7 +771,7 @@ int audio_graph2_link_dpcm(struct asoc_simple_priv *priv,
 }
 EXPORT_SYMBOL_GPL(audio_graph2_link_dpcm);
 
-int audio_graph2_link_c2c(struct asoc_simple_priv *priv,
+int audio_graph2_link_c2c(struct simple_util_priv *priv,
 			  struct device_node *lnk,
 			  struct link_info *li)
 {
@@ -807,7 +807,7 @@ int audio_graph2_link_c2c(struct asoc_simple_priv *priv,
 	 * Card2 can use original Codec2Codec settings if DT has.
 	 * It will use default settings if no settings on DT.
 	 * see
-	 *	asoc_simple_init_for_codec2codec()
+	 *	simple_util_init_for_codec2codec()
 	 *
 	 * Add more settings here if needed
 	 */
@@ -868,7 +868,7 @@ int audio_graph2_link_c2c(struct asoc_simple_priv *priv,
 }
 EXPORT_SYMBOL_GPL(audio_graph2_link_c2c);
 
-static int graph_link(struct asoc_simple_priv *priv,
+static int graph_link(struct simple_util_priv *priv,
 		      struct graph2_custom_hooks *hooks,
 		      enum graph_type gtype,
 		      struct device_node *lnk,
@@ -940,7 +940,7 @@ static int graph_counter(struct device_node *lnk)
 		return 1;
 }
 
-static int graph_count_normal(struct asoc_simple_priv *priv,
+static int graph_count_normal(struct simple_util_priv *priv,
 			      struct device_node *lnk,
 			      struct link_info *li)
 {
@@ -969,7 +969,7 @@ static int graph_count_normal(struct asoc_simple_priv *priv,
 	return 0;
 }
 
-static int graph_count_dpcm(struct asoc_simple_priv *priv,
+static int graph_count_dpcm(struct simple_util_priv *priv,
 			    struct device_node *lnk,
 			    struct link_info *li)
 {
@@ -991,7 +991,7 @@ static int graph_count_dpcm(struct asoc_simple_priv *priv,
 	 * };
 	 */
 
-	if (asoc_graph_is_ports0(lnk)) {
+	if (graph_util_is_ports0(lnk)) {
 		/*
 		 * DON'T REMOVE platforms
 		 * see
@@ -1009,7 +1009,7 @@ static int graph_count_dpcm(struct asoc_simple_priv *priv,
 	return 0;
 }
 
-static int graph_count_c2c(struct asoc_simple_priv *priv,
+static int graph_count_c2c(struct simple_util_priv *priv,
 			   struct device_node *lnk,
 			   struct link_info *li)
 {
@@ -1051,7 +1051,7 @@ static int graph_count_c2c(struct asoc_simple_priv *priv,
 	return 0;
 }
 
-static int graph_count(struct asoc_simple_priv *priv,
+static int graph_count(struct simple_util_priv *priv,
 		       struct graph2_custom_hooks *hooks,
 		       enum graph_type gtype,
 		       struct device_node *lnk,
@@ -1094,10 +1094,10 @@ static int graph_count(struct asoc_simple_priv *priv,
 	return ret;
 }
 
-static int graph_for_each_link(struct asoc_simple_priv *priv,
+static int graph_for_each_link(struct simple_util_priv *priv,
 			       struct graph2_custom_hooks *hooks,
 			       struct link_info *li,
-			       int (*func)(struct asoc_simple_priv *priv,
+			       int (*func)(struct simple_util_priv *priv,
 					   struct graph2_custom_hooks *hooks,
 					   enum graph_type gtype,
 					   struct device_node *lnk,
@@ -1124,7 +1124,7 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 	return 0;
 }
 
-int audio_graph2_parse_of(struct asoc_simple_priv *priv, struct device *dev,
+int audio_graph2_parse_of(struct simple_util_priv *priv, struct device *dev,
 			  struct graph2_custom_hooks *hooks)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
@@ -1135,7 +1135,7 @@ int audio_graph2_parse_of(struct asoc_simple_priv *priv, struct device *dev,
 	if (!li)
 		return -ENOMEM;
 
-	card->probe	= asoc_graph_card_probe;
+	card->probe	= graph_util_card_probe;
 	card->owner	= THIS_MODULE;
 	card->dev	= dev;
 
@@ -1151,7 +1151,7 @@ int audio_graph2_parse_of(struct asoc_simple_priv *priv, struct device *dev,
 	if (ret < 0)
 		goto err;
 
-	ret = asoc_simple_init_priv(priv, li);
+	ret = simple_util_init_priv(priv, li);
 	if (ret < 0)
 		goto err;
 
@@ -1162,11 +1162,11 @@ int audio_graph2_parse_of(struct asoc_simple_priv *priv, struct device *dev,
 		goto err;
 	}
 
-	ret = asoc_simple_parse_widgets(card, NULL);
+	ret = simple_util_parse_widgets(card, NULL);
 	if (ret < 0)
 		goto err;
 
-	ret = asoc_simple_parse_routing(card, NULL);
+	ret = simple_util_parse_routing(card, NULL);
 	if (ret < 0)
 		goto err;
 
@@ -1175,7 +1175,7 @@ int audio_graph2_parse_of(struct asoc_simple_priv *priv, struct device *dev,
 	if (ret < 0)
 		goto err;
 
-	ret = asoc_simple_parse_card_name(card, NULL);
+	ret = simple_util_parse_card_name(card, NULL);
 	if (ret < 0)
 		goto err;
 
@@ -1187,7 +1187,7 @@ int audio_graph2_parse_of(struct asoc_simple_priv *priv, struct device *dev,
 			goto err;
 	}
 
-	asoc_simple_debug_info(priv);
+	simple_util_debug_info(priv);
 
 	ret = devm_snd_soc_register_card(dev, card);
 err:
@@ -1202,7 +1202,7 @@ EXPORT_SYMBOL_GPL(audio_graph2_parse_of);
 
 static int graph_probe(struct platform_device *pdev)
 {
-	struct asoc_simple_priv *priv;
+	struct simple_util_priv *priv;
 	struct device *dev = &pdev->dev;
 
 	/* Allocate the private data and the DAI link array */
@@ -1226,7 +1226,7 @@ static struct platform_driver graph_card = {
 		.of_match_table = graph_of_match,
 	},
 	.probe	= graph_probe,
-	.remove	= asoc_simple_remove,
+	.remove	= simple_util_remove,
 };
 module_platform_driver(graph_card);
 
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index ecbd26dd7dfa1..36ce3a4343f95 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -14,7 +14,7 @@
 #include <sound/pcm_params.h>
 #include <sound/simple_card_utils.h>
 
-static void asoc_simple_fixup_sample_fmt(struct asoc_simple_data *data,
+static void simple_fixup_sample_fmt(struct simple_util_data *data,
 					 struct snd_pcm_hw_params *params)
 {
 	int i;
@@ -43,7 +43,7 @@ static void asoc_simple_fixup_sample_fmt(struct asoc_simple_data *data,
 
 void simple_util_parse_convert(struct device_node *np,
 			       char *prefix,
-			       struct asoc_simple_data *data)
+			       struct simple_util_data *data)
 {
 	char prop[128];
 
@@ -65,13 +65,13 @@ void simple_util_parse_convert(struct device_node *np,
 EXPORT_SYMBOL_GPL(simple_util_parse_convert);
 
 /**
- * asoc_simple_is_convert_required() - Query if HW param conversion was requested
+ * simple_util_is_convert_required() - Query if HW param conversion was requested
  * @data: Link data.
  *
  * Returns true if any HW param conversion was requested for this DAI link with
  * any "convert-xxx" properties.
  */
-bool simple_util_is_convert_required(const struct asoc_simple_data *data)
+bool simple_util_is_convert_required(const struct simple_util_data *data)
 {
 	return data->convert_rate ||
 	       data->convert_channels ||
@@ -116,7 +116,7 @@ int simple_util_parse_daifmt(struct device *dev,
 EXPORT_SYMBOL_GPL(simple_util_parse_daifmt);
 
 int simple_util_parse_tdm_width_map(struct device *dev, struct device_node *np,
-				    struct asoc_simple_dai *dai)
+				    struct simple_util_dai *dai)
 {
 	u32 *array_values, *p;
 	int n, i, ret;
@@ -209,7 +209,7 @@ int simple_util_parse_card_name(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(simple_util_parse_card_name);
 
-static int asoc_simple_clk_enable(struct asoc_simple_dai *dai)
+static int simple_clk_enable(struct simple_util_dai *dai)
 {
 	if (dai)
 		return clk_prepare_enable(dai->clk);
@@ -217,7 +217,7 @@ static int asoc_simple_clk_enable(struct asoc_simple_dai *dai)
 	return 0;
 }
 
-static void asoc_simple_clk_disable(struct asoc_simple_dai *dai)
+static void simple_clk_disable(struct simple_util_dai *dai)
 {
 	if (dai)
 		clk_disable_unprepare(dai->clk);
@@ -225,7 +225,7 @@ static void asoc_simple_clk_disable(struct asoc_simple_dai *dai)
 
 int simple_util_parse_clk(struct device *dev,
 			  struct device_node *node,
-			  struct asoc_simple_dai *simple_dai,
+			  struct simple_util_dai *simple_dai,
 			  struct snd_soc_dai_link_component *dlc)
 {
 	struct clk *clk;
@@ -260,8 +260,8 @@ int simple_util_parse_clk(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(simple_util_parse_clk);
 
-static int asoc_simple_check_fixed_sysclk(struct device *dev,
-					  struct asoc_simple_dai *dai,
+static int simple_check_fixed_sysclk(struct device *dev,
+					  struct simple_util_dai *dai,
 					  unsigned int *fixed_sysclk)
 {
 	if (dai->clk_fixed) {
@@ -278,28 +278,28 @@ static int asoc_simple_check_fixed_sysclk(struct device *dev,
 
 int simple_util_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->num);
-	struct asoc_simple_dai *dai;
+	struct simple_util_dai *dai;
 	unsigned int fixed_sysclk = 0;
 	int i1, i2, i;
 	int ret;
 
 	for_each_prop_dai_cpu(props, i1, dai) {
-		ret = asoc_simple_clk_enable(dai);
+		ret = simple_clk_enable(dai);
 		if (ret)
 			goto cpu_err;
-		ret = asoc_simple_check_fixed_sysclk(rtd->dev, dai, &fixed_sysclk);
+		ret = simple_check_fixed_sysclk(rtd->dev, dai, &fixed_sysclk);
 		if (ret)
 			goto cpu_err;
 	}
 
 	for_each_prop_dai_codec(props, i2, dai) {
-		ret = asoc_simple_clk_enable(dai);
+		ret = simple_clk_enable(dai);
 		if (ret)
 			goto codec_err;
-		ret = asoc_simple_check_fixed_sysclk(rtd->dev, dai, &fixed_sysclk);
+		ret = simple_check_fixed_sysclk(rtd->dev, dai, &fixed_sysclk);
 		if (ret)
 			goto codec_err;
 	}
@@ -324,13 +324,13 @@ int simple_util_startup(struct snd_pcm_substream *substream)
 	for_each_prop_dai_codec(props, i, dai) {
 		if (i >= i2)
 			break;
-		asoc_simple_clk_disable(dai);
+		simple_clk_disable(dai);
 	}
 cpu_err:
 	for_each_prop_dai_cpu(props, i, dai) {
 		if (i >= i1)
 			break;
-		asoc_simple_clk_disable(dai);
+		simple_clk_disable(dai);
 	}
 	return ret;
 }
@@ -338,35 +338,35 @@ EXPORT_SYMBOL_GPL(simple_util_startup);
 
 void simple_util_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->num);
-	struct asoc_simple_dai *dai;
+	struct simple_util_dai *dai;
 	int i;
 
 	for_each_prop_dai_cpu(props, i, dai) {
-		struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, i);
+		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, i);
 
 		if (props->mclk_fs && !dai->clk_fixed && !snd_soc_dai_active(cpu_dai))
 			snd_soc_dai_set_sysclk(cpu_dai,
 					       0, 0, SND_SOC_CLOCK_OUT);
 
-		asoc_simple_clk_disable(dai);
+		simple_clk_disable(dai);
 	}
 	for_each_prop_dai_codec(props, i, dai) {
-		struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, i);
+		struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, i);
 
 		if (props->mclk_fs && !dai->clk_fixed && !snd_soc_dai_active(codec_dai))
 			snd_soc_dai_set_sysclk(codec_dai,
 					       0, 0, SND_SOC_CLOCK_IN);
 
-		asoc_simple_clk_disable(dai);
+		simple_clk_disable(dai);
 	}
 }
 EXPORT_SYMBOL_GPL(simple_util_shutdown);
 
-static int asoc_simple_set_clk_rate(struct device *dev,
-				    struct asoc_simple_dai *simple_dai,
+static int simple_set_clk_rate(struct device *dev,
+				    struct simple_util_dai *simple_dai,
 				    unsigned long rate)
 {
 	if (!simple_dai)
@@ -386,8 +386,8 @@ static int asoc_simple_set_clk_rate(struct device *dev,
 	return clk_set_rate(simple_dai->clk, rate);
 }
 
-static int asoc_simple_set_tdm(struct snd_soc_dai *dai,
-				struct asoc_simple_dai *simple_dai,
+static int simple_set_tdm(struct snd_soc_dai *dai,
+				struct simple_util_dai *simple_dai,
 				struct snd_pcm_hw_params *params)
 {
 	int sample_bits = params_width(params);
@@ -427,10 +427,10 @@ static int asoc_simple_set_tdm(struct snd_soc_dai *dai,
 int simple_util_hw_params(struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct asoc_simple_dai *pdai;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct simple_util_dai *pdai;
 	struct snd_soc_dai *sdai;
-	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->num);
 	unsigned int mclk, mclk_fs = 0;
 	int i, ret;
@@ -443,13 +443,13 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
 		mclk = params_rate(params) * mclk_fs;
 
 		for_each_prop_dai_codec(props, i, pdai) {
-			ret = asoc_simple_set_clk_rate(rtd->dev, pdai, mclk);
+			ret = simple_set_clk_rate(rtd->dev, pdai, mclk);
 			if (ret < 0)
 				return ret;
 		}
 
 		for_each_prop_dai_cpu(props, i, pdai) {
-			ret = asoc_simple_set_clk_rate(rtd->dev, pdai, mclk);
+			ret = simple_set_clk_rate(rtd->dev, pdai, mclk);
 			if (ret < 0)
 				return ret;
 		}
@@ -479,15 +479,15 @@ int simple_util_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	for_each_prop_dai_codec(props, i, pdai) {
-		sdai = asoc_rtd_to_codec(rtd, i);
-		ret = asoc_simple_set_tdm(sdai, pdai, params);
+		sdai = snd_soc_rtd_to_codec(rtd, i);
+		ret = simple_set_tdm(sdai, pdai, params);
 		if (ret < 0)
 			return ret;
 	}
 
 	for_each_prop_dai_cpu(props, i, pdai) {
-		sdai = asoc_rtd_to_cpu(rtd, i);
-		ret = asoc_simple_set_tdm(sdai, pdai, params);
+		sdai = snd_soc_rtd_to_cpu(rtd, i);
+		ret = simple_set_tdm(sdai, pdai, params);
 		if (ret < 0)
 			return ret;
 	}
@@ -499,9 +499,9 @@ EXPORT_SYMBOL_GPL(simple_util_hw_params);
 int simple_util_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				   struct snd_pcm_hw_params *params)
 {
-	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, rtd->num);
-	struct asoc_simple_data *data = &dai_props->adata;
+	struct simple_util_data *data = &dai_props->adata;
 	struct snd_interval *rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
 
@@ -514,14 +514,13 @@ int simple_util_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 		channels->max = data->convert_channels;
 
 	if (data->convert_sample_format)
-		asoc_simple_fixup_sample_fmt(data, params);
+		simple_fixup_sample_fmt(data, params);
 
 	return 0;
 }
 EXPORT_SYMBOL_GPL(simple_util_be_hw_params_fixup);
 
-static int asoc_simple_init_dai(struct snd_soc_dai *dai,
-				     struct asoc_simple_dai *simple_dai)
+static int simple_init_dai(struct snd_soc_dai *dai, struct simple_util_dai *simple_dai)
 {
 	int ret;
 
@@ -552,13 +551,13 @@ static int asoc_simple_init_dai(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static inline int asoc_simple_component_is_codec(struct snd_soc_component *component)
+static inline int simple_component_is_codec(struct snd_soc_component *component)
 {
 	return component->driver->endianness;
 }
 
-static int asoc_simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
-					    struct simple_dai_props *dai_props)
+static int simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
+				       struct simple_dai_props *dai_props)
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_component *component;
@@ -576,7 +575,7 @@ static int asoc_simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
 
 	/* Only Codecs */
 	for_each_rtd_components(rtd, i, component) {
-		if (!asoc_simple_component_is_codec(component))
+		if (!simple_component_is_codec(component))
 			return 0;
 	}
 
@@ -611,23 +610,23 @@ static int asoc_simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
 
 int simple_util_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct simple_util_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct simple_dai_props *props = simple_priv_to_props(priv, rtd->num);
-	struct asoc_simple_dai *dai;
+	struct simple_util_dai *dai;
 	int i, ret;
 
 	for_each_prop_dai_codec(props, i, dai) {
-		ret = asoc_simple_init_dai(asoc_rtd_to_codec(rtd, i), dai);
+		ret = simple_init_dai(snd_soc_rtd_to_codec(rtd, i), dai);
 		if (ret < 0)
 			return ret;
 	}
 	for_each_prop_dai_cpu(props, i, dai) {
-		ret = asoc_simple_init_dai(asoc_rtd_to_cpu(rtd, i), dai);
+		ret = simple_init_dai(snd_soc_rtd_to_cpu(rtd, i), dai);
 		if (ret < 0)
 			return ret;
 	}
 
-	ret = asoc_simple_init_for_codec2codec(rtd, props);
+	ret = simple_init_for_codec2codec(rtd, props);
 	if (ret < 0)
 		return ret;
 
@@ -738,7 +737,7 @@ int simple_util_parse_pin_switches(struct snd_soc_card *card,
 EXPORT_SYMBOL_GPL(simple_util_parse_pin_switches);
 
 int simple_util_init_jack(struct snd_soc_card *card,
-			  struct asoc_simple_jack *sjack,
+			  struct simple_util_jack *sjack,
 			  int is_hp, char *prefix,
 			  char *pin)
 {
@@ -795,7 +794,7 @@ int simple_util_init_jack(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(simple_util_init_jack);
 
-int simple_util_init_aux_jacks(struct asoc_simple_priv *priv, char *prefix)
+int simple_util_init_aux_jacks(struct simple_util_priv *priv, char *prefix)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
 	struct snd_soc_component *component;
@@ -844,14 +843,14 @@ int simple_util_init_aux_jacks(struct asoc_simple_priv *priv, char *prefix)
 }
 EXPORT_SYMBOL_GPL(simple_util_init_aux_jacks);
 
-int simple_util_init_priv(struct asoc_simple_priv *priv,
+int simple_util_init_priv(struct simple_util_priv *priv,
 			  struct link_info *li)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
 	struct device *dev = simple_priv_to_dev(priv);
 	struct snd_soc_dai_link *dai_link;
 	struct simple_dai_props *dai_props;
-	struct asoc_simple_dai *dais;
+	struct simple_util_dai *dais;
 	struct snd_soc_dai_link_component *dlcs;
 	struct snd_soc_codec_conf *cconf = NULL;
 	int i, dai_num = 0, dlc_num = 0, cnf_num = 0;
@@ -912,7 +911,7 @@ int simple_util_init_priv(struct asoc_simple_priv *priv,
 			dais += li->num[i].cpus;
 		} else {
 			/* DPCM Be's CPU = dummy */
-			dai_link[i].cpus	= &asoc_dummy_dlc;
+			dai_link[i].cpus	= &snd_soc_dummy_dlc;
 			dai_props[i].num.cpus	=
 			dai_link[i].num_cpus	= 1;
 		}
@@ -934,7 +933,7 @@ int simple_util_init_priv(struct asoc_simple_priv *priv,
 			}
 		} else {
 			/* DPCM Fe's Codec = dummy */
-			dai_link[i].codecs	= &asoc_dummy_dlc;
+			dai_link[i].codecs	= &snd_soc_dummy_dlc;
 			dai_props[i].num.codecs	=
 			dai_link[i].num_codecs	= 1;
 		}
@@ -962,7 +961,7 @@ int simple_util_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 
-	asoc_simple_clean_reference(card);
+	simple_util_clean_reference(card);
 
 	return 0;
 }
@@ -970,14 +969,14 @@ EXPORT_SYMBOL_GPL(simple_util_remove);
 
 int graph_util_card_probe(struct snd_soc_card *card)
 {
-	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(card);
+	struct simple_util_priv *priv = snd_soc_card_get_drvdata(card);
 	int ret;
 
-	ret = asoc_simple_init_hp(card, &priv->hp_jack, NULL);
+	ret = simple_util_init_hp(card, &priv->hp_jack, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = asoc_simple_init_mic(card, &priv->mic_jack, NULL);
+	ret = simple_util_init_mic(card, &priv->mic_jack, NULL);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 190f11366e84e..a88812ab3ed17 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -23,13 +23,12 @@
 #define PREFIX	"simple-audio-card,"
 
 static const struct snd_soc_ops simple_ops = {
-	.startup	= asoc_simple_startup,
-	.shutdown	= asoc_simple_shutdown,
-	.hw_params	= asoc_simple_hw_params,
+	.startup	= simple_util_startup,
+	.shutdown	= simple_util_shutdown,
+	.hw_params	= simple_util_hw_params,
 };
 
-static int asoc_simple_parse_platform(struct device_node *node,
-				      struct snd_soc_dai_link_component *dlc)
+static int simple_parse_platform(struct device_node *node, struct snd_soc_dai_link_component *dlc)
 {
 	struct of_phandle_args args;
 	int ret;
@@ -52,10 +51,10 @@ static int asoc_simple_parse_platform(struct device_node *node,
 	return 0;
 }
 
-static int asoc_simple_parse_dai(struct device *dev,
-				 struct device_node *node,
-				 struct snd_soc_dai_link_component *dlc,
-				 int *is_single_link)
+static int simple_parse_dai(struct device *dev,
+			    struct device_node *node,
+			    struct snd_soc_dai_link_component *dlc,
+			    int *is_single_link)
 {
 	struct of_phandle_args args;
 	struct snd_soc_dai *dai;
@@ -117,15 +116,15 @@ static int asoc_simple_parse_dai(struct device *dev,
 
 static void simple_parse_convert(struct device *dev,
 				 struct device_node *np,
-				 struct asoc_simple_data *adata)
+				 struct simple_util_data *adata)
 {
 	struct device_node *top = dev->of_node;
 	struct device_node *node = of_get_parent(np);
 
-	asoc_simple_parse_convert(top,  PREFIX, adata);
-	asoc_simple_parse_convert(node, PREFIX, adata);
-	asoc_simple_parse_convert(node, NULL,   adata);
-	asoc_simple_parse_convert(np,   NULL,   adata);
+	simple_util_parse_convert(top,  PREFIX, adata);
+	simple_util_parse_convert(node, PREFIX, adata);
+	simple_util_parse_convert(node, NULL,   adata);
+	simple_util_parse_convert(np,   NULL,   adata);
 
 	of_node_put(node);
 }
@@ -148,7 +147,7 @@ static void simple_parse_mclk_fs(struct device_node *top,
 	of_node_put(node);
 }
 
-static int simple_parse_node(struct asoc_simple_priv *priv,
+static int simple_parse_node(struct simple_util_priv *priv,
 			     struct device_node *np,
 			     struct link_info *li,
 			     char *prefix,
@@ -159,35 +158,35 @@ static int simple_parse_node(struct asoc_simple_priv *priv,
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	struct snd_soc_dai_link_component *dlc;
-	struct asoc_simple_dai *dai;
+	struct simple_util_dai *dai;
 	int ret;
 
 	if (cpu) {
-		dlc = asoc_link_to_cpu(dai_link, 0);
+		dlc = snd_soc_link_to_cpu(dai_link, 0);
 		dai = simple_props_to_dai_cpu(dai_props, 0);
 	} else {
-		dlc = asoc_link_to_codec(dai_link, 0);
+		dlc = snd_soc_link_to_codec(dai_link, 0);
 		dai = simple_props_to_dai_codec(dai_props, 0);
 	}
 
 	simple_parse_mclk_fs(top, np, dai_props, prefix);
 
-	ret = asoc_simple_parse_dai(dev, np, dlc, cpu);
+	ret = simple_parse_dai(dev, np, dlc, cpu);
 	if (ret)
 		return ret;
 
-	ret = asoc_simple_parse_clk(dev, np, dai, dlc);
+	ret = simple_util_parse_clk(dev, np, dai, dlc);
 	if (ret)
 		return ret;
 
-	ret = asoc_simple_parse_tdm(np, dai);
+	ret = simple_util_parse_tdm(np, dai);
 	if (ret)
 		return ret;
 
 	return 0;
 }
 
-static int simple_link_init(struct asoc_simple_priv *priv,
+static int simple_link_init(struct simple_util_priv *priv,
 			    struct device_node *node,
 			    struct device_node *codec,
 			    struct link_info *li,
@@ -197,18 +196,18 @@ static int simple_link_init(struct asoc_simple_priv *priv,
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	int ret;
 
-	ret = asoc_simple_parse_daifmt(dev, node, codec,
+	ret = simple_util_parse_daifmt(dev, node, codec,
 				       prefix, &dai_link->dai_fmt);
 	if (ret < 0)
 		return 0;
 
-	dai_link->init			= asoc_simple_dai_init;
+	dai_link->init			= simple_util_dai_init;
 	dai_link->ops			= &simple_ops;
 
-	return asoc_simple_set_dailink_name(dev, dai_link, name);
+	return simple_util_set_dailink_name(dev, dai_link, name);
 }
 
-static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
+static int simple_dai_link_of_dpcm(struct simple_util_priv *priv,
 				   struct device_node *np,
 				   struct device_node *codec,
 				   struct link_info *li,
@@ -230,8 +229,8 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 		prefix = PREFIX;
 
 	if (li->cpu) {
-		struct snd_soc_dai_link_component *cpus = asoc_link_to_cpu(dai_link, 0);
-		struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
+		struct snd_soc_dai_link_component *cpus = snd_soc_link_to_cpu(dai_link, 0);
+		struct snd_soc_dai_link_component *platforms = snd_soc_link_to_platform(dai_link, 0);
 		int is_single_links = 0;
 
 		/* Codec is dummy */
@@ -246,17 +245,17 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 
 		snprintf(dai_name, sizeof(dai_name), "fe.%s", cpus->dai_name);
 
-		asoc_simple_canonicalize_cpu(cpus, is_single_links);
-		asoc_simple_canonicalize_platform(platforms, cpus);
+		simple_util_canonicalize_cpu(cpus, is_single_links);
+		simple_util_canonicalize_platform(platforms, cpus);
 	} else {
-		struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, 0);
+		struct snd_soc_dai_link_component *codecs = snd_soc_link_to_codec(dai_link, 0);
 		struct snd_soc_codec_conf *cconf;
 
 		/* CPU is dummy */
 
 		/* BE settings */
 		dai_link->no_pcm		= 1;
-		dai_link->be_hw_params_fixup	= asoc_simple_be_hw_params_fixup;
+		dai_link->be_hw_params_fixup	= simple_util_be_hw_params_fixup;
 
 		cconf	= simple_props_to_codec_conf(dai_props, 0);
 
@@ -288,7 +287,7 @@ static int simple_dai_link_of_dpcm(struct asoc_simple_priv *priv,
 	return ret;
 }
 
-static int simple_dai_link_of(struct asoc_simple_priv *priv,
+static int simple_dai_link_of(struct simple_util_priv *priv,
 			      struct device_node *np,
 			      struct device_node *codec,
 			      struct link_info *li,
@@ -296,9 +295,9 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 {
 	struct device *dev = simple_priv_to_dev(priv);
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
-	struct snd_soc_dai_link_component *cpus = asoc_link_to_cpu(dai_link, 0);
-	struct snd_soc_dai_link_component *codecs = asoc_link_to_codec(dai_link, 0);
-	struct snd_soc_dai_link_component *platforms = asoc_link_to_platform(dai_link, 0);
+	struct snd_soc_dai_link_component *cpus = snd_soc_link_to_cpu(dai_link, 0);
+	struct snd_soc_dai_link_component *codecs = snd_soc_link_to_codec(dai_link, 0);
+	struct snd_soc_dai_link_component *platforms = snd_soc_link_to_platform(dai_link, 0);
 	struct device_node *cpu = NULL;
 	struct device_node *node = NULL;
 	struct device_node *plat = NULL;
@@ -327,15 +326,15 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 	if (ret < 0)
 		goto dai_link_of_err;
 
-	ret = asoc_simple_parse_platform(plat, platforms);
+	ret = simple_parse_platform(plat, platforms);
 	if (ret < 0)
 		goto dai_link_of_err;
 
 	snprintf(dai_name, sizeof(dai_name),
 		 "%s-%s", cpus->dai_name, codecs->dai_name);
 
-	asoc_simple_canonicalize_cpu(cpus, single_cpu);
-	asoc_simple_canonicalize_platform(platforms, cpus);
+	simple_util_canonicalize_cpu(cpus, single_cpu);
+	simple_util_canonicalize_platform(platforms, cpus);
 
 	ret = simple_link_init(priv, node, codec, li, prefix, dai_name);
 
@@ -348,13 +347,13 @@ static int simple_dai_link_of(struct asoc_simple_priv *priv,
 	return ret;
 }
 
-static int __simple_for_each_link(struct asoc_simple_priv *priv,
+static int __simple_for_each_link(struct simple_util_priv *priv,
 			struct link_info *li,
-			int (*func_noml)(struct asoc_simple_priv *priv,
+			int (*func_noml)(struct simple_util_priv *priv,
 					 struct device_node *np,
 					 struct device_node *codec,
 					 struct link_info *li, bool is_top),
-			int (*func_dpcm)(struct asoc_simple_priv *priv,
+			int (*func_dpcm)(struct simple_util_priv *priv,
 					 struct device_node *np,
 					 struct device_node *codec,
 					 struct link_info *li, bool is_top))
@@ -378,7 +377,7 @@ static int __simple_for_each_link(struct asoc_simple_priv *priv,
 
 	/* loop for all dai-link */
 	do {
-		struct asoc_simple_data adata;
+		struct simple_util_data adata;
 		struct device_node *codec;
 		struct device_node *plat;
 		struct device_node *np;
@@ -419,7 +418,7 @@ static int __simple_for_each_link(struct asoc_simple_priv *priv,
 			 * or has convert-xxx property
 			 */
 			if (dpcm_selectable &&
-			    (num > 2 || asoc_simple_is_convert_required(&adata))) {
+			    (num > 2 || simple_util_is_convert_required(&adata))) {
 				/*
 				 * np
 				 *	 |1(CPU)|0(Codec)  li->cpu
@@ -459,13 +458,13 @@ static int __simple_for_each_link(struct asoc_simple_priv *priv,
 	return ret;
 }
 
-static int simple_for_each_link(struct asoc_simple_priv *priv,
+static int simple_for_each_link(struct simple_util_priv *priv,
 				struct link_info *li,
-				int (*func_noml)(struct asoc_simple_priv *priv,
+				int (*func_noml)(struct simple_util_priv *priv,
 						 struct device_node *np,
 						 struct device_node *codec,
 						 struct link_info *li, bool is_top),
-				int (*func_dpcm)(struct asoc_simple_priv *priv,
+				int (*func_dpcm)(struct simple_util_priv *priv,
 						 struct device_node *np,
 						 struct device_node *codec,
 						 struct link_info *li, bool is_top))
@@ -494,12 +493,12 @@ static int simple_for_each_link(struct asoc_simple_priv *priv,
 
 static void simple_depopulate_aux(void *data)
 {
-	struct asoc_simple_priv *priv = data;
+	struct simple_util_priv *priv = data;
 
 	of_platform_depopulate(simple_priv_to_dev(priv));
 }
 
-static int simple_populate_aux(struct asoc_simple_priv *priv)
+static int simple_populate_aux(struct simple_util_priv *priv)
 {
 	struct device *dev = simple_priv_to_dev(priv);
 	struct device_node *node;
@@ -517,20 +516,20 @@ static int simple_populate_aux(struct asoc_simple_priv *priv)
 	return devm_add_action_or_reset(dev, simple_depopulate_aux, priv);
 }
 
-static int simple_parse_of(struct asoc_simple_priv *priv, struct link_info *li)
+static int simple_parse_of(struct simple_util_priv *priv, struct link_info *li)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
 	int ret;
 
-	ret = asoc_simple_parse_widgets(card, PREFIX);
+	ret = simple_util_parse_widgets(card, PREFIX);
 	if (ret < 0)
 		return ret;
 
-	ret = asoc_simple_parse_routing(card, PREFIX);
+	ret = simple_util_parse_routing(card, PREFIX);
 	if (ret < 0)
 		return ret;
 
-	ret = asoc_simple_parse_pin_switches(card, PREFIX);
+	ret = simple_util_parse_pin_switches(card, PREFIX);
 	if (ret < 0)
 		return ret;
 
@@ -542,7 +541,7 @@ static int simple_parse_of(struct asoc_simple_priv *priv, struct link_info *li)
 	if (ret < 0)
 		return ret;
 
-	ret = asoc_simple_parse_card_name(card, PREFIX);
+	ret = simple_util_parse_card_name(card, PREFIX);
 	if (ret < 0)
 		return ret;
 
@@ -555,7 +554,7 @@ static int simple_parse_of(struct asoc_simple_priv *priv, struct link_info *li)
 	return ret;
 }
 
-static int simple_count_noml(struct asoc_simple_priv *priv,
+static int simple_count_noml(struct simple_util_priv *priv,
 			     struct device_node *np,
 			     struct device_node *codec,
 			     struct link_info *li, bool is_top)
@@ -579,7 +578,7 @@ static int simple_count_noml(struct asoc_simple_priv *priv,
 	 * ignored by snd_soc_rtd_add_component().
 	 *
 	 * see
-	 *	simple-card-utils.c :: asoc_simple_canonicalize_platform()
+	 *	simple-card-utils.c :: simple_util_canonicalize_platform()
 	 */
 	li->num[li->link].cpus		= 1;
 	li->num[li->link].platforms	= 1;
@@ -591,7 +590,7 @@ static int simple_count_noml(struct asoc_simple_priv *priv,
 	return 0;
 }
 
-static int simple_count_dpcm(struct asoc_simple_priv *priv,
+static int simple_count_dpcm(struct simple_util_priv *priv,
 			     struct device_node *np,
 			     struct device_node *codec,
 			     struct link_info *li, bool is_top)
@@ -622,7 +621,7 @@ static int simple_count_dpcm(struct asoc_simple_priv *priv,
 	return 0;
 }
 
-static int simple_get_dais_count(struct asoc_simple_priv *priv,
+static int simple_get_dais_count(struct simple_util_priv *priv,
 				 struct link_info *li)
 {
 	struct device *dev = simple_priv_to_dev(priv);
@@ -690,27 +689,27 @@ static int simple_get_dais_count(struct asoc_simple_priv *priv,
 
 static int simple_soc_probe(struct snd_soc_card *card)
 {
-	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(card);
+	struct simple_util_priv *priv = snd_soc_card_get_drvdata(card);
 	int ret;
 
-	ret = asoc_simple_init_hp(card, &priv->hp_jack, PREFIX);
+	ret = simple_util_init_hp(card, &priv->hp_jack, PREFIX);
 	if (ret < 0)
 		return ret;
 
-	ret = asoc_simple_init_mic(card, &priv->mic_jack, PREFIX);
+	ret = simple_util_init_mic(card, &priv->mic_jack, PREFIX);
 	if (ret < 0)
 		return ret;
 
-	ret = asoc_simple_init_aux_jacks(priv, PREFIX);
+	ret = simple_util_init_aux_jacks(priv, PREFIX);
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static int asoc_simple_probe(struct platform_device *pdev)
+static int simple_probe(struct platform_device *pdev)
 {
-	struct asoc_simple_priv *priv;
+	struct simple_util_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct snd_soc_card *card;
@@ -739,7 +738,7 @@ static int asoc_simple_probe(struct platform_device *pdev)
 	if (!li->link)
 		return -EINVAL;
 
-	ret = asoc_simple_init_priv(priv, li);
+	ret = simple_util_init_priv(priv, li);
 	if (ret < 0)
 		return ret;
 
@@ -752,7 +751,7 @@ static int asoc_simple_probe(struct platform_device *pdev)
 		}
 
 	} else {
-		struct asoc_simple_card_info *cinfo;
+		struct simple_util_info *cinfo;
 		struct snd_soc_dai_link_component *cpus;
 		struct snd_soc_dai_link_component *codecs;
 		struct snd_soc_dai_link_component *platform;
@@ -770,7 +769,7 @@ static int asoc_simple_probe(struct platform_device *pdev)
 		    !cinfo->codec ||
 		    !cinfo->platform ||
 		    !cinfo->cpu_dai.name) {
-			dev_err(dev, "insufficient asoc_simple_card_info settings\n");
+			dev_err(dev, "insufficient simple_util_info settings\n");
 			return -EINVAL;
 		}
 
@@ -788,7 +787,7 @@ static int asoc_simple_probe(struct platform_device *pdev)
 		dai_link->name		= cinfo->name;
 		dai_link->stream_name	= cinfo->name;
 		dai_link->dai_fmt	= cinfo->daifmt;
-		dai_link->init		= asoc_simple_dai_init;
+		dai_link->init		= simple_util_dai_init;
 		memcpy(dai_props->cpu_dai, &cinfo->cpu_dai,
 					sizeof(*dai_props->cpu_dai));
 		memcpy(dai_props->codec_dai, &cinfo->codec_dai,
@@ -797,7 +796,7 @@ static int asoc_simple_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(card, priv);
 
-	asoc_simple_debug_info(priv);
+	simple_util_debug_info(priv);
 
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret < 0)
@@ -806,7 +805,7 @@ static int asoc_simple_probe(struct platform_device *pdev)
 	devm_kfree(dev, li);
 	return 0;
 err:
-	asoc_simple_clean_reference(card);
+	simple_util_clean_reference(card);
 
 	return ret;
 }
@@ -819,17 +818,17 @@ static const struct of_device_id simple_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, simple_of_match);
 
-static struct platform_driver asoc_simple_card = {
+static struct platform_driver simple_card = {
 	.driver = {
 		.name = "asoc-simple-card",
 		.pm = &snd_soc_pm_ops,
 		.of_match_table = simple_of_match,
 	},
-	.probe = asoc_simple_probe,
-	.remove = asoc_simple_remove,
+	.probe = simple_probe,
+	.remove = simple_util_remove,
 };
 
-module_platform_driver(asoc_simple_card);
+module_platform_driver(simple_card);
 
 MODULE_ALIAS("platform:asoc-simple-card");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index e10e5bf284323..8c3eb4424efc7 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -352,7 +352,7 @@ static const struct snd_pcm_hardware test_component_hardware = {
 static int test_component_open(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	mile_stone(component);
 
-- 
2.25.1

