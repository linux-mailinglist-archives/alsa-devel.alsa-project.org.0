Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2169472BD
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:01:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90FBE3AFF;
	Mon,  5 Aug 2024 02:57:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90FBE3AFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819445;
	bh=jE8KH36tyH1Y57k3yx7h0opIjyUKDJYTLOVnLAJTy6E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q7GTaChHr53qTgq+Q+7i4o4AhBCvmLjf1G64xVcBg9Y8yAKbeOUHkB+k+CRNJ/NkH
	 rWwYHwJqZxhJSFzH5rOBKtMNsJszbpzbzRf1St1TBfhqtWDDKBompsicNlG3NCpGyt
	 eVUbqcnnnoa4kqveIML/aRw+zX55P0CsOw2UEkbA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DB1BF89BFB; Mon,  5 Aug 2024 02:41:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD65AF806C4;
	Mon,  5 Aug 2024 02:41:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7AE9F89B5E; Mon,  5 Aug 2024 02:40:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31CEDF80688
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:40:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31CEDF80688
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=HL91gG//
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcWQwxZHhEpqVtVwm7LRXEFyLYF+wXraeMNxAxR9L/60XkYVByfJ45UjFXEt5XHZ40Ks/h5F6bUx7qPNHPqkvfr6Qgo6RTqUjMq4zuwy2owJ/5s4dvyR19HbRpIPxSe8h4Z30sbnezGtnTeM1WyUATyPymlqqYw+X7VJ4A6LhWXD11UZemme0FxS2yVdIgRy4nhiYyqVEKA+CF5FREuRT2km8SApAn5Qm6StTJJFjNl5E18lnxREqz7HdyG9bL9XpshvqUpmsVL3AGBLuqvfjfyfOsxyKHDyfb5Cakzzt9BEIju9wDTs1bJRHfiNsoQp3VgIjHACApkPS2VgMA67ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjbb72CLScHpNKCs8p4LtmKCCE56Zyr3leDrloQbTXY=;
 b=GilnhDV4eQ99spXBpAPWPAxogNkBPb4trWnY4Thwlgm5t1cS9G+EcyX5trH8UU16cdHmjsBtHeFD9nEJxRVC9XKPFhqqcyz2uLDdV8WU1MYElB1DBKjJsJihUtX0KKRqTMcwWz+/Ldl3K6SUKQb1/rHG2e4SXRSGLClNNUoODWKt3R0RgxDC36qu+rB9g3cRgVl+9UDfYZZ57YZVtaD6CVtk72F0m1GsTbPhiNLaun0l4lu0JYXQFooHoGZKgslgjSX3MjrRZIZxTuHynqiflInDjq/pM2eJN4QE08pNe3lKr89scYRE3jT1Cm+v++p4V6ywleBiFtcuLqDekU05CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjbb72CLScHpNKCs8p4LtmKCCE56Zyr3leDrloQbTXY=;
 b=HL91gG//cQ9MBhGBxTtjyQH2jWzvmZpaaKHW3nHJsgx6xIAvFr+5Z7CGCvLqphNYsxVxVOFL0A2RajgmZ1CMFChVwJGq3jx/l9IXA8uxKMMq+bUoO9eBoaRJ7+wyAtL1CsLUPQRqhP97DcWBBbRYEWI3Cg4K8gUl0lXegdeYL5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9302.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:40:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:40:30 +0000
Message-ID: <87h6bzyf7l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 066/113] ASoC: tegra: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:40:30 +0000
X-ClientProxiedBy: TYWPR01CA0005.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a555b4-38f3-457a-2fec-08dcb4e7356f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uvazzlAzCGZKQhezRb7yL2xAWgii/61/eRtfNJSWplVVmE7SKf0S7eJw77E0?=
 =?us-ascii?Q?z0au1BmC9mu64L5JJi+EFlvWZhCnC3aYe86buMfAFOlSSDLqnLxXhQ4RKCPQ?=
 =?us-ascii?Q?fPTBKnouIXDjwJAWSX7laJt1uy2JgooOnW6HQHzQfL5MrWPEf/xx9k6TRCeB?=
 =?us-ascii?Q?LROZ5if7lNHsoOq5ktp4zW3zeARDJo3vxqiOl5zbXtMjIFYeNNAJw6eemuOV?=
 =?us-ascii?Q?bcmWoi5Y92M1b86p50XxUylITkInZxpkm2sd1A/CQX8W0rKDlJEFK0/4pmuM?=
 =?us-ascii?Q?DectArFSsoMhcRQcAvvZAb/65p5x5VoY24pEZRRHK7nqGG0pcmWTiTWB02nj?=
 =?us-ascii?Q?IUrNSBp5WbRhpAfC65yxKlyb+x8CsxPZ7EBVU5bRb8L92FQjVo9MCwoOFEFB?=
 =?us-ascii?Q?hVFCv4r6D99K4ymHtw1L7SyUCWx6KPmjrGGoVCmFcadA+aSQkL2yZuz/EDs2?=
 =?us-ascii?Q?ifl2WB7VJjTuQmYyKeLOtuQAjctEDgSaaIQnagPk/BnJ9ks96U/ELbLG/91M?=
 =?us-ascii?Q?C6yVTq2oT+YtsHrhZIyY+vguegiCjul0uafWxNOZKasW4bKL/jRuHFGJR9wO?=
 =?us-ascii?Q?ckrTBsFdv+iEpQdIqV4/nYWDsIK0+AIfqCYgO0ggCRLc0ozj7aj15n9/EYZs?=
 =?us-ascii?Q?QkZ4F2NZd8ELHvvXB08802madidZoE92de7WHkePNdsGFxOOgcJzc3LHoZHx?=
 =?us-ascii?Q?1g1v7hRJ4M3UNFS3HEXN36FGQk+BBwRUodmHszkD2Q3BuWZte3k9XfutGsu+?=
 =?us-ascii?Q?b4mH8jJI/4s6T73fg1XgzgP8TZ5Dih75yLtQKMX4I394Z01RmvQZamhizjag?=
 =?us-ascii?Q?PUby6k+Y4ummsbEOhtYngov8Tp78wsPBgZtlekvDUwKSisjz+U1+hyxCz/J1?=
 =?us-ascii?Q?Idn2tWvBqZNCBM3VDc1zNrhEp3OTAe7m78A/S9SZcvaS2RnSxj2C3FhUPafI?=
 =?us-ascii?Q?4yDNSZeD/1W0yD/qq3M0YzfybRb9igUy40bXSCOJTgvCTRBoCfpTd5NY7z1K?=
 =?us-ascii?Q?qja7bjQJlj4cxdEFpHxtgHg6k9e4YGBeb3GzBE+9lkGrOxCUH2drvpIz3gSF?=
 =?us-ascii?Q?c/Q9hGIuYh99UusD6KMBQoZDODISHizWMjLTUI0VqOFAwWZpam58yEy0sDr4?=
 =?us-ascii?Q?K861ElkpscrwIZfz0JICgi7ZC+YKkj1HToikhKhmsd9MMR9oTxgrp3iAJIiH?=
 =?us-ascii?Q?mK/wspYXid+6tRquI2+11JZIhIp0JGYQ3cFmETPFpJyoJekp17dcqeByj7iq?=
 =?us-ascii?Q?DAKIbKdXxjhzjcuwNUcry3MSxDAJQ7RCCB1PZDN/DyhRfer84/2zRKQuX+gL?=
 =?us-ascii?Q?2huhik6/AzOIuxs1h04ErjOwuy9wnM6WjeDhcOahjgd/pTZaj2MD9mz/zJjj?=
 =?us-ascii?Q?dJj1GzeNW66z6yc30vYOVFQmwUY430oHnZCqNMzs/adJUGcXkQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fSCZQe2U7T2CO3a/FkekdRnv+T1J9Fb/HgyxF+uRbvvNoTY/pwBuBuXRA8Iq?=
 =?us-ascii?Q?zB3N1ar4rA89HtnZmKU6sdyH5vBOnoYNYlg6aHs+6G9ElhrB8vNspSVajbZ+?=
 =?us-ascii?Q?yFrrmfunAnUOZ8+ZQ7nPry12HVOJ14W2StdkX2+RLwzVLd5P4Nz3LJ/WCsm9?=
 =?us-ascii?Q?Rr6NTJp/JCtoMyok15YO8iiuWhcb91uS9655RPj5XLff+wiwoSzd0JcbXtKB?=
 =?us-ascii?Q?TknpTG8TFEDGH/k7u1K5F7hGGZi5VnUreOe7CQiJvp8tJ+QJSITrLsczo9SL?=
 =?us-ascii?Q?e1IpQGL1CsRvuTAcJehMj0g2sjeCHY04RDgWEPa1+TO91KWUirUyAf2LUUPf?=
 =?us-ascii?Q?VPNtHqGGqDPk1AURABAQJtH/lISMLIX2eaw97yq0piy/hCJav/S7DfJ7VekW?=
 =?us-ascii?Q?5F/97SR5CpK//1nhhzyImZJ9Itb5wHEfkKNn1T9Om6s/MlQEQNfd3DOy2kLq?=
 =?us-ascii?Q?ANTiAAt562Ds5UJYxxIj903zWcf92GEdt2nP4HulCSVJi24C4GQLNaSWd7EY?=
 =?us-ascii?Q?pQE2qI2wJlhUt2mTBDkUYdgxSluXQtCxxx+dsY9FOt4wU1hp2fLnCk9RIZGB?=
 =?us-ascii?Q?QuvZGQA8WOTXAlpoWBim8eigP16d5IP/riWdfg4xwxHwHZE6cl9Gv4jsl2Ot?=
 =?us-ascii?Q?nPa9YgV9TvmbZz/xavFEf/SfkgdFMz+Py+SiPHvqzS2gM+bbVxIMPNVBQ+1s?=
 =?us-ascii?Q?/AoYi0Xl6IBS1jOFdnDb7D/pHh9S5llPkANLcd2XuPlPd3zps/GrFX8PCF87?=
 =?us-ascii?Q?DPNlSMycQGbEUDhK5xyN1Hz48K8RNeLWsouhr0eCzXH1WlohZKjrTmqKx28q?=
 =?us-ascii?Q?rym+1HoLBDxxdyHgibQbhb7/xpIWqXTkCd751Ra0IE8lulQXFQKbi4labIMJ?=
 =?us-ascii?Q?Cmu+vKgkMsfsgC4kLcuRHV9ivfvKCq0PHCLHtDHIYWB+146zoJMW9JO5N1zm?=
 =?us-ascii?Q?5/ZUwfCYscL+K2FhkSePmn1DLfeC0E17x3YwL1Gk/JueFCIy1R3CftgSEZcI?=
 =?us-ascii?Q?YUdwvwbWxMGKL9KdfVbzzENfyyeKUAJNiaFWg5Gjjd68uQLqmVpCpVqlX0WC?=
 =?us-ascii?Q?IzAIB3NaqWaE2s+RHcxpG8vL3VCWOcufr1jNow39cUowu0j5aBqt3zes8nm8?=
 =?us-ascii?Q?dQlGTuT/ZNg0/X2f/DMnPm+X4tmo1iaQFPnd/YNSUW/JJA60NwfVYBh1U4Xi?=
 =?us-ascii?Q?NlTZTuYlvBnapcA7+5pyxDSol7wZkPfJhZbQqoaYqq6h661N5Xu09BHpaGOo?=
 =?us-ascii?Q?R7dpK1oy0TzFrOcnKvpvUjJ1cxsiV6/gifxvUX3lQlJzO4aLtfYVDhoXWcoy?=
 =?us-ascii?Q?gR33P1OCDb63kGsOJ8pQdpXv7wexA60a+9w6CGPj9hQAXPybQLWk7n3C+b/t?=
 =?us-ascii?Q?Am/gqnKtOc0MxaCJypLMeKD848pdRlOfe0ciay9IEHnUKhPcAOHnWBgDCapQ?=
 =?us-ascii?Q?eQ6HRHTFqmlfKKBwwWoN2iIw2VtX9AAc+YSwJmJTr0oPmlrvTynq67IGnbMw?=
 =?us-ascii?Q?5UDtWECXeujDer6PBW2gsKeCmUI14rNTS6eW6pQXqoAu3Ul0JHoX9eKZkZHm?=
 =?us-ascii?Q?TYV8OuOYNVNyiRPzNx5M0y67BoRlE1ODpFWi/hUrgTXMcVFWyPJs3FuCgOc3?=
 =?us-ascii?Q?gn/kBaWZcM5oXUJVb/CHCQw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 13a555b4-38f3-457a-2fec-08dcb4e7356f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:40:30.9168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iPD3XUgIk38ShI7tA/LWlYi9PGYI2jBCVDh0/L0uOg5jMpniegPgAaY6eD3E/fk2ba7DcDart+kVJQrgOvV9/EghmG2MvLHoAfnlKEP6TcXds4M3xc3sAwSTDp0XsIBC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9302
Message-ID-Hash: ZKGY7VSIAE6KHH7BFDDMFAN7XTHPPFKE
X-Message-ID-Hash: ZKGY7VSIAE6KHH7BFDDMFAN7XTHPPFKE
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZKGY7VSIAE6KHH7BFDDMFAN7XTHPPFKE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/tegra/tegra20_ac97.c    | 4 ++--
 sound/soc/tegra/tegra20_i2s.c     | 4 ++--
 sound/soc/tegra/tegra210_admaif.c | 2 +-
 sound/soc/tegra/tegra210_i2s.c    | 6 +++---
 sound/soc/tegra/tegra30_i2s.c     | 6 +++---
 sound/soc/tegra/tegra_pcm.c       | 2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index 8011afe93c96e..0314402361558 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -182,7 +182,7 @@ static int tegra20_ac97_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			tegra20_ac97_start_playback(ac97);
 		else
 			tegra20_ac97_start_capture(ac97);
@@ -190,7 +190,7 @@ static int tegra20_ac97_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			tegra20_ac97_stop_playback(ac97);
 		else
 			tegra20_ac97_stop_capture(ac97);
diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index f11618e8f13ee..330400d0e530c 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -232,7 +232,7 @@ static int tegra20_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			tegra20_i2s_start_playback(i2s);
 		else
 			tegra20_i2s_start_capture(i2s);
@@ -240,7 +240,7 @@ static int tegra20_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			tegra20_i2s_stop_playback(i2s);
 		else
 			tegra20_i2s_stop_capture(i2s);
diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 9f9334e480490..e79711ea65dc9 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -299,7 +299,7 @@ static int tegra_admaif_hw_params(struct snd_pcm_substream *substream,
 	cif_conf.client_ch = channels;
 	cif_conf.audio_ch = channels;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		path = ADMAIF_TX_PATH;
 		reg = CH_TX_REG(TEGRA_ADMAIF_CH_ACIF_TX_CTRL, dai->id);
 	} else {
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index e93ceb7afb4c4..74a0ada1e98c7 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -95,7 +95,7 @@ static int tegra210_i2s_sw_reset(struct snd_soc_component *compnt,
 	unsigned int cif_ctrl, stream_ctrl, i2s_ctrl, val;
 	int err;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		reset_reg = TEGRA210_I2S_RX_SOFT_RESET;
 		cif_reg = TEGRA210_I2S_RX_CIF_CTRL;
 		stream_reg = TEGRA210_I2S_RX_CTRL;
@@ -673,12 +673,12 @@ static int tegra210_i2s_hw_params(struct snd_pcm_substream *substream,
 	srate = params_rate(params);
 
 	/* For playback I2S RX-CIF and for capture TX-CIF is used */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		path = I2S_RX_PATH;
 	else
 		path = I2S_TX_PATH;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		unsigned int max_th;
 
 		/* FIFO threshold in terms of frames */
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index a8ff51d12edb5..edcb7095bf0ac 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -188,7 +188,7 @@ static int tegra30_i2s_hw_params(struct snd_pcm_substream *substream,
 	cif_conf.truncate = 0;
 	cif_conf.mono_conv = 0;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		cif_conf.direction = TEGRA30_AUDIOCIF_DIRECTION_RX;
 		reg = TEGRA30_I2S_CIF_RX_CTRL;
 	} else {
@@ -244,7 +244,7 @@ static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			tegra30_i2s_start_playback(i2s);
 		else
 			tegra30_i2s_start_capture(i2s);
@@ -252,7 +252,7 @@ static int tegra30_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			tegra30_i2s_stop_playback(i2s);
 		else
 			tegra30_i2s_stop_capture(i2s);
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 05d59e03b1c5e..1ed74f6b6431a 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -164,7 +164,7 @@ int tegra_pcm_hw_params(struct snd_soc_component *component,
 		return ret;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		slave_config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 		slave_config.dst_addr = dmap->addr;
 		slave_config.dst_maxburst = 8;
-- 
2.43.0

