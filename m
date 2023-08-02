Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7B476C1BE
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:57:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D37307F8;
	Wed,  2 Aug 2023 02:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D37307F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937833;
	bh=qM16m5EjDAWwjMSB/ru251gjwkgD1NC8R1vJ3vIgMzY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qrAV+mVqlSLRmhorwvKVIf/NUH4yuBHO0ys2tGAlzSrLF8hlm/brv1a6K9wKTk8Uo
	 IlQI4JUKnkdGPCM41yXxfO7IrfXq/0l4zo/ST2SjI0qi95HcsJ0roLGiHhuH9UarG+
	 ETkY5bW4MZTYJNdBUFZciH9jvhutICYn0t8NzHvU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C268F8059F; Wed,  2 Aug 2023 02:54:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC213F8055A;
	Wed,  2 Aug 2023 02:54:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDBCBF8056F; Wed,  2 Aug 2023 02:54:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBEABF80557
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBEABF80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VJQuXHC5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5P1qx+X+LRgaWF7DBtkOwjQeVIWViPSiRvsdcNih/fIBsi46PwWXsDSUrvkSVfgoApLuV2Pd/spxXGSIXGz5oULSiD2vOejFFL9MwOg993oBiZabzwg02VOda2A05Ci2DRspGyoUdpntG4dTz+PC+nlXpTcqPOoV/WBYGtX+faT3RZzat0Olb6DVlypCFM0gLYyrf0x1eu/trYea5PbJVM79rH4NaTy68tCtCO7HXjntwpTChYpP67PFVv9A1nx9dxV17T4P2RoYbXtYbgSCPBBDqRkAVbLMF2ZwowXdwgrAu/r0vDcNoHjwgEI0yLzQFjtA1lDqfSQY9/rBPHzlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxPlbXNRUqKwrVsB1xpkS+JqBbiHU1d0+jz9z0zmXQU=;
 b=eU1tjdgfYS6PJih4q4Jbg9Pkb9Sgz+3TP4oVsiID+wGG9kvlsGFkCVv+gTO9Ha9dwZ+m8Qn0OTJ25giMud6+JN40UnOYf+lLNmkH1f6ej9EE7r1UWQsUlP9cq+NRTOQq5jTHb+AyM/KZPAH+WFJzJtBeimd972oAxM0jXLVsNUMOBji/Uxig4f/xsnwvnzEEcFU35ZmwsIaV+S7dlrYQSqIkpZMnkyoFMZiOwpx1pSftdl3qWpoQ7xie5utEJ2GdSd5cka/ZMwZ5JC60Oh1X5guDr0ol+0gGcxdvz6nkHpJ16LJgv9i4gbxBX5HaSxd+U0gOMb7435aQFKk0zKF1lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxPlbXNRUqKwrVsB1xpkS+JqBbiHU1d0+jz9z0zmXQU=;
 b=VJQuXHC5h/J9ICpE05NLnJmIXUs1CwfkqRWK+ntgvKS03L2jATSauQl05Oje6SRXBVOFsCSCraussG311AACT7/tY0aOO5PqqKdPdcpLPQD38UXoqZln0guhCTFOTO/c6Le9oXO6Q5ez3r7uidKy6v/gFQfJXJaA8qBbpNqrsZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9381.jpnprd01.prod.outlook.com (2603:1096:604:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:54:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:54:12 +0000
Message-ID: <87pm46tgb0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 14/38] ASoC: pxa: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:54:11 +0000
X-ClientProxiedBy: TYCP286CA0281.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9381:EE_
X-MS-Office365-Filtering-Correlation-Id: dc9028da-2ac1-423c-104a-08db92f2fc9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nPxw9bluv60RyhoJT1Ska4uQgfx+tGQQWWBdLZLXd6LdDfDgwSgo4CnBttYvSSt/4K1aOth9P1fq0zjo3cWSmqq8gv6vSt/wl2p9ZzNRh0L7FJAvI+nfF5sUWmGoah1yqC9QhX/o/YQJekYkMhIuMzMCXVXoAf5j6aulQ6k/wayOvhLIpPK9HWaOUqIYucouZ1hx8AUWHAk3d+KnVzs4sk99Gtu3Aq/JQ/B5WlEaQHMLur/gJuxNC7rgiFEQQsJX6JJrEcvIJjvqcwXwakTpoYjnaysbyy/UZwVlTq2BGeh3nksMguHdslzyiXrKhCrVPNIVuTj94fwot+O1GsDQEmYBxPxfJcQPHk2KhvL8UR3TQ5OeQlKZ1RkDabSL0YsSV6qWoDodru2EYnnlMWlir5uA/gVXRKmUjRG5MA+gOa3eNTT2oAgBS7UelMLZhmmB5QLwTPw4RD/BTGDksXec7Llpc+Xs8PQJ+IUbhTIRuNZq8dfrevOr5wMS/0Fqhx831yH9mhMpkBRjInrv1m8RrchAZiEsUId/g49g1A4fMT+kaRudtP27UFxqQwPj15BpcwMxsuT36nDzMxNZzQhnyDqhwELWzT6chmAXv858K4WOWJltIukBQwQTV2AEGT1ZmLVw6Tl8wb9amZDNRV3xrw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(38350700002)(66476007)(66556008)(66946007)(2616005)(83380400001)(4326008)(316002)(6486002)(52116002)(6512007)(110136005)(478600001)(186003)(6506007)(2906002)(26005)(4744005)(86362001)(36756003)(41300700001)(38100700002)(5660300002)(8676002)(8936002)(41080700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZzSFssnBEzK61/1DW05VRkmplHa0dInTdjri2Ww9HvVLtLVJ9IafBDXk9oUw?=
 =?us-ascii?Q?jZaoWEGn+JjiLBiLEzEGpScw2z8CST5o3o1eYLFhp0VQLxPW7xje5De7BZ96?=
 =?us-ascii?Q?+CMyPNUL9oKRdc/OFwK8m0ZIjma4edZKlczCWfgwcruUrHI+gFilwHZ8RI8B?=
 =?us-ascii?Q?lrfkc2ccHFvbl0IywVK2oENOwiR7D7AjTsU/Q1A3HLMw9PPaK03x1counoaH?=
 =?us-ascii?Q?p2TgYHQp2yFHaefNCkkb55xpcv2FemgEg1Qsc3C3GsApUDrfZYz5yCrsZBqj?=
 =?us-ascii?Q?DTy4pMTI7aObAQFCX2Ys1+EY87NZqPDnAoNQvS6aWFatK0Ks6ZYHrEvDQDGH?=
 =?us-ascii?Q?+0PgV6tBNo9DWoFvbW2Zq7d08fwgpYU/G/6GcfO86aXO1EDTHfRALQ9SEr6g?=
 =?us-ascii?Q?VM40SoQCZxc0V06daNxctBG+TPw8JFufRlVd4YEqtC9GDt20KEsbB+PoTx54?=
 =?us-ascii?Q?4BeOq5nGIIxnfHKbMoyq+zRxMvknCGXgDBbnv4ywwkDBc4V6SISJiqRz/VU6?=
 =?us-ascii?Q?Uym2U49xgqg0pbGr+yeg2X2VBcFQhEciFn3GPN5LqUnhtxKjM/N0MjJvTEfT?=
 =?us-ascii?Q?w6KF13JhhjyCGbfiKF9En8UzwDJ0Kp8GYouvPJu/qyaphWg1dGi4KmDtEYNn?=
 =?us-ascii?Q?gSYOntcY0JoZq7Pt7oeESbSGT2ToFmh5uMR7ivSJQRQiOzMxGCMZTImKjJYR?=
 =?us-ascii?Q?soXiFDSipEF39KVFyjEQT9Q5kOZsnm2c0YeallnOy60koH+RV60wgmArlEza?=
 =?us-ascii?Q?gr9IS+sbfvPverDOtZ4gIt5oSk+h0QWDopKeNg25S2BiQc2LwNnQHlA4DcVY?=
 =?us-ascii?Q?3slUHoW25YxhdCKBTNnToWbn5NX9AajTb5fZ8J16E91OvCco+pNWt8KgVxMs?=
 =?us-ascii?Q?KXT7FOkGDiWW1IUlYw+yYSb1duCxY3MvFn5R09qbCWvAn0hQq1AJ9gLmyB8V?=
 =?us-ascii?Q?kMEugQ4JCqbp44O8jInA/iTY3xtkWFmFyLioi4nuDf30tyIDiGpmo/qm+L5Q?=
 =?us-ascii?Q?HxDM6bVmqs/hHKyKJnhb9lWjoTIPQyY9rD4nmIVNEsZwWbnx4rdvc6EF0LrZ?=
 =?us-ascii?Q?+7BUriotdrOn7cfY6/fkVsYAOXP6ArT16Vv5bDQzStuLlyRLlGrAKQzgGQN1?=
 =?us-ascii?Q?rkBiLib6AThKlNXsx52G73eNBW9iBybxySbY5GKDjv1hRUxRg570gkIdP+Ut?=
 =?us-ascii?Q?QhV/NCiQoJYKXA0mHzKPtdt/1hfmMPfaCXLuErnB6KQ1Vu3HNQhYr/64jOIy?=
 =?us-ascii?Q?mawBzOaN+0mneuXqXUa7dyQhNmEnY+1DyNnCZeVRzqJuyYFAg41Zdd85hgAR?=
 =?us-ascii?Q?Ok0WruuSaiZqcAhHzdqNrx3tQXLN0BE0/1DxAgT0hAPxiPBFR2D0XCo38ELG?=
 =?us-ascii?Q?hyqZKLBOOQWjPNcP6u/YR40zM6f/utDxmhSjitXMXvaTucpIF1cReLhzzZIe?=
 =?us-ascii?Q?uuRC3p2bRbP7CmFUG5rk8QC5/mHrQm96QJ3HiwHmntAP0+RIzqAj/fWMY3aD?=
 =?us-ascii?Q?tsb/m3wetYkQ0sUJePVKcCbV9W5r5C2hxB4MYVM70vJtQ78ewI7DuiFb/6Gi?=
 =?us-ascii?Q?JaYKSo3iaJ0Gv0J4evltc6VBEVAZ3DBmVI7oLYLHS8K3jqInnTlhjebLpbFG?=
 =?us-ascii?Q?BFwtWy+EERplq6AhDNx7HRM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dc9028da-2ac1-423c-104a-08db92f2fc9b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:54:12.2190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LubEZLDe6iT7KjZleHQZuJ17yxZeRLqUW9NpAse7gG9bYG6DzoXdRkNr2xatZWH4OIIOU5a31ZTVflUBr6cXV+15iKSw8v6w50Mt/ctLlhGy2tmfLQT504WWvHhrbWpS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9381
Message-ID-Hash: JGQ75OTB6T2PRVBDVPCX6G2M32GEEIVR
X-Message-ID-Hash: JGQ75OTB6T2PRVBDVPCX6G2M32GEEIVR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JGQ75OTB6T2PRVBDVPCX6G2M32GEEIVR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/pxa/pxa-ssp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 430dd446321e..32a8490d027a 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -819,6 +819,8 @@ static int pxa_ssp_remove(struct snd_soc_dai *dai)
 #define PXA_SSP_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
 static const struct snd_soc_dai_ops pxa_ssp_dai_ops = {
+	.probe		= pxa_ssp_probe,
+	.remove		= pxa_ssp_remove,
 	.startup	= pxa_ssp_startup,
 	.shutdown	= pxa_ssp_shutdown,
 	.trigger	= pxa_ssp_trigger,
@@ -830,8 +832,6 @@ static const struct snd_soc_dai_ops pxa_ssp_dai_ops = {
 };
 
 static struct snd_soc_dai_driver pxa_ssp_dai = {
-		.probe = pxa_ssp_probe,
-		.remove = pxa_ssp_remove,
 		.playback = {
 			.channels_min = 1,
 			.channels_max = 8,
-- 
2.25.1

