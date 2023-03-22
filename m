Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2A96C3F4F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 01:49:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D94B7208;
	Wed, 22 Mar 2023 01:48:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D94B7208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679446142;
	bh=76vA1jla2mtwvZl8ZaQOeSiAr+/9Ps+xrH914OMde6Y=;
	h=From:Subject:To:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=g9mu9IlUxsX78j1XZqpopgzi0h7x4Ap39+AcatoCMIUsLQtvBzZRMVMF1AmMMXKik
	 TRohqKl4A4YcMfiZ54krgP0kCT8lKoWwHyW3MR6snjDMOpSXcFmtXoODGLcAB2Np4v
	 na0DkjKkvcBbT7wlL3atITA6X8Reu6E6w2d8hYIc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B7AFF80254;
	Wed, 22 Mar 2023 01:48:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A5FDF8027B; Wed, 22 Mar 2023 01:48:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-3.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20704.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::704])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6DDDF80105
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 01:47:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6DDDF80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=JCJrUBov
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INa6oncbmSkV5a5rW1KFxN1tbj75ctI1QqbBfWLALiI6fBOw94i9pO/Ik3xlAE9pjQLZj8U2P2qnRrRKLN1smIFU+aMymYaz6XSwkbZN5p8OLdkSiKz9VOZKmOUJZcoplXEoiG2xeoyy5lUVLy/ctE51IEIhgehsTy58u3/radEnlks97aViw0zBR/Pfal4sTmBSJQAHSS0wcYGfPQMmWCyKDjZc2hg9VGMym+yRjE6ubt0jo6OP3hm/2wEw2aamxwyEeDhbfzEi8CK8RqBlcIFbRogJxq76aK6Tj3fwNNi3nrhIe11UbC1WsrwzGKmEV27fb3aekQxmiTQYfO1Rcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3i9R5WBkBx3hkSbvU2rsttTmNIAh4DiU9UJGtNOX4zo=;
 b=FX+Jfmc0wFQ7nhklrSiPCH1/3jboPf+10LwYyhaStFHFt8BIDdNLV5KT03cGfD+0VBMHzJ9TxIKYlYgBWpIVDNhEUnbXq2uDaTKEUomWGsVDYoPH8Uj3P/SXMURomrNo3bAKzqop/S2R2qgLXCf7BGqBbQs70y8FtQhwKlQJ7AsJzXKXETVdmcWQT2Bj4Le/TAfZB7hGLkkO6fStCvEFY8l7/kzEOPeu7B+YbHNT9/dcvrdjyjHGRFjJCSD6v50yR70U/VyHxOGlnExWZnnXWxO97wRBpKOZbRqhka0EOWla2cRQynMAMCdK04hA+YCR5c9+2Y09fmua0HXTDEfE4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3i9R5WBkBx3hkSbvU2rsttTmNIAh4DiU9UJGtNOX4zo=;
 b=JCJrUBovVYgYE0HeWeDuDnK0pEO6iDN1e3vOkAS7fP4rS3/Tz0Er1P+hePJPP5HErodKSS8mh3viqHsl9B6WSCVNihXPaf+nqBGX0AUWoiSBuyYYAxmTcq3ops5Q4vI/FbSgP0FJkHCjxi4OjRQRMz4jvnrmulJVtwT0xJey3j0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB6167.jpnprd01.prod.outlook.com (2603:1096:604:d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 00:47:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 00:47:48 +0000
Message-ID: <878rfptxvv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: simple-card: add comment to indicate don't remove
 platforms
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 22 Mar 2023 00:47:48 +0000
X-ClientProxiedBy: TYCP286CA0184.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: db55e637-678f-4efe-d3c7-08db2a6f0f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NuWyyhp38GcuoS0j6d1NWZ5Z9RaMfsufzhxgouuwYbh+/f1aunjQ4lG+RQbDErK3ctDRjjW2kx7HVrSPqLGVlx3G280uwYYx7HTy8Sce8Dnty4PUpa5TeVHIRj88LBOWZRO9dX8AYJgSh45ZJs6kb5kOIEbP3xhIJb//PtLDlxr+url5gJfplfDHaSBo0yTP9ghjI3SCoDvufEwEeuEwZA5hDoIox7SCtR9u3yLyHiNcwMOhb1HarCc9v14ot929bsm32SvAUTqi7FG2C1y0aH5oW6WvBv2tsXFf4oqWLq0i8NXx9WJelESi2p/zH3Be3esPSN98+0jue/oZUaW1vLYiqqOShhQLVyjaHIotwSS8Ski9rP6eiT/5+m3o3gvjSds0ghG+89f2KhE8nLdeyzbKlxl68EqWI1eXjBulREMCUlHkUOwKJ6GFhXD0hS/lydvZnSutW9+xMJ8+4NeVOuNfX4RmlRNAWs+1zH3ahxiHiiKK7D/bN5P17akfP0uuiJML236CZlhqQ3sgz37/gGHjZIdvOGgSulFNZX2WwPgPZ3rc+tpbpTemN4yAIriqMEPqyqKs/W15DeUzdfYA+eKfc3neNvV1r0gOJsVS720Taf8YVZkAV0SzSL6Bv+W2kS+fYy6XPbEunAsj19iayUTM9LcfaFdVuyGNIMb8WNmoGSy6r2Xzae72VTF+0hCUHwThRDIcXa23Q12CbuKrsQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199018)(2616005)(6512007)(41300700001)(52116002)(186003)(6486002)(4326008)(83380400001)(478600001)(316002)(8676002)(66556008)(6916009)(66946007)(66476007)(6506007)(26005)(8936002)(5660300002)(38350700002)(38100700002)(2906002)(36756003)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TuFnrU30Ma1K78bsQcsJTMdTUPna/4mJpwVvc4Qckgraw8EP60FhjMre7hFV?=
 =?us-ascii?Q?IheNUONmgayMt1zSZSGAwAVl+yS3d1aerJ9jx+OOYXJ9rVbTWgOYpPgpaLXB?=
 =?us-ascii?Q?1jS213zrC6TS4Ao7p1awC3tanxZmQQ/Q2BIboM88QWliuunOPdcJUprE50hf?=
 =?us-ascii?Q?OUw+E8uL6e3DD6PUtrzkixTlctsMCzI99PXAbT1lVealssFzgirkGk/tdUM9?=
 =?us-ascii?Q?/EQZTv2GQRVBkdgZ+dDzKvEwqLqsupAkoRBtLKxQ7x8pqBiAqn0B5l8snjMG?=
 =?us-ascii?Q?NjO0H4H/G4qgJBT9u5+U+iQK3fERHaabKFZrD032PpnRt7CmQWwxjnPTh2Og?=
 =?us-ascii?Q?D8zL7KwANNJtHSD5wOQYeFZR/r+/TnMn8Yl4lgxJ7Umqr1fzZDwlPdIf00zx?=
 =?us-ascii?Q?5/aiQyEnCdWA0s33ZIp0GqMJtNkUAgEkoml0HoxzUA1gLoT++KYdcS8+xyfD?=
 =?us-ascii?Q?C9FneT2/RDOfty2nhBmTWTWp7Uy98I9ABqe5XX5X2L1WdXSVfqGsCHnYOXwK?=
 =?us-ascii?Q?pm6QuVz5QPbHG00P3xXEHpIez2xx/u3JgEhI/kBufohUfyNrwjERcxhRGLDd?=
 =?us-ascii?Q?eIttsmyitEosJpfsKucarlgokZnOhailGAk2Rl+tbwVKRjzbFsxgnSj6xyjz?=
 =?us-ascii?Q?bSYNCuqGrs43VSBcisKdfd+YNa368HFvfOMak5x5ffYiClAtdoLhC7soooiG?=
 =?us-ascii?Q?Pkh+w/x1w9IuM0XT523CcExaxEW/VbON+BXPi/YExhRrQcFpdU6do9NKkrZk?=
 =?us-ascii?Q?rAG03vZGfv1jJY/3w438qtWvqklacuEeVnwy9UYyh0GFUFZfDhX+GqcDKDVt?=
 =?us-ascii?Q?MTSkFtWTr0EKZMoQXrlLhUwn9JZocRohgy7ox/DK24qKRQsZP/KG+IE0O8xN?=
 =?us-ascii?Q?Fbeu6U5JzOg68Nex6IjjbskaHCgldOUrYtU447nAUCJt0kEyf6S5eylmaTEj?=
 =?us-ascii?Q?Yaqi+lKwc+nLt0EJz4xhjTblyypwv3qw6B05WjN24F1t+rCn3UdTDeM1NLIc?=
 =?us-ascii?Q?I74OWy2+qSXYMaEbo9LsHBKcYcv8CJTsLkEzSHYyZJfMX23boX6KsQ2XBtlB?=
 =?us-ascii?Q?t4xC3pfLQM3K7wnjlQrwryhj7CcS5tk6UEFqkauLajuCP2uaT58H4KPRzCag?=
 =?us-ascii?Q?REs6HCn1HpAzjYOVvzNbJrbY+5X47bQCfm8lDYlCp3yNcAxjkOjS8/Jt31Zo?=
 =?us-ascii?Q?zQ45FVq5ynExSv6vXErn954TqyRIRNbi/ONCggtMy97FOwNKxEYkdLpHoP53?=
 =?us-ascii?Q?Px0utlP1am4BiV77wHlhnEUDGVepecbqFQizNowXWuRkOV6iyk/16G0rGQf4?=
 =?us-ascii?Q?evKT0I/FyH/lEi9uU3NFHNnokDitFcsfdHza1ejO2WBcdmVxsFgrzpagbTHB?=
 =?us-ascii?Q?ilYGautaq67DqvSXxkVhV1J1USarNq4l4ZYCRQ7iojtUioh4HBeVUrq2sicZ?=
 =?us-ascii?Q?heqH7aKD5HmbCGQDPZo4+/l3u7KLrXJx70UAzvmTLHaM0EWBSbf7O+x87o03?=
 =?us-ascii?Q?wcmq0Fw/n9azNxHyoTFoO2Ppfwk10rClPkN+lO7WEy+MXJG9gK1xCVgkN15d?=
 =?us-ascii?Q?GKaebkcDkMBT/4oRff+GtR6Em1XtO7N/CUDB+ymnXPxdNLffRgPN/s4mY3aX?=
 =?us-ascii?Q?LL9F4ZO05Idai17YWbUFq6U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db55e637-678f-4efe-d3c7-08db2a6f0f2a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 00:47:48.8196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 o2JdoOoNyG2Ze1bYuU4fFFQc3+i4G4CyZxcf7Qf8eXbB0JdiqWfhrer8nu1af7QmScw1IPREkMifBdOLGNoQjt90LWo4twoSQLg3neX1AVB3dHYSP6PsNYgBPXDubjFv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6167
Message-ID-Hash: EQFT4UNM7D6HAWYOE4BJ52Z4DCUMQBR3
X-Message-ID-Hash: EQFT4UNM7D6HAWYOE4BJ52Z4DCUMQBR3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EQFT4UNM7D6HAWYOE4BJ52Z4DCUMQBR3/>
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
 sound/soc/generic/audio-graph-card.c  | 13 ++++++++++++-
 sound/soc/generic/audio-graph-card2.c | 17 +++++++++++++++++
 sound/soc/generic/simple-card.c       | 19 ++++++++++++++++++-
 3 files changed, 47 insertions(+), 2 deletions(-)

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
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index e98932c16754..fc044978e057 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -509,10 +509,22 @@ static int simple_count_noml(struct asoc_simple_priv *priv,
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
+	 */
 	li->num[li->link].cpus		= 1;
-	li->num[li->link].codecs	= 1;
 	li->num[li->link].platforms	= 1;
 
+	li->num[li->link].codecs	= 1;
+
 	li->link += 1;
 
 	return 0;
@@ -531,6 +543,11 @@ static int simple_count_dpcm(struct asoc_simple_priv *priv,
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

