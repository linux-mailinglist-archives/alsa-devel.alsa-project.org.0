Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AD6947297
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:51:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9B114F4A;
	Mon,  5 Aug 2024 02:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9B114F4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818984;
	bh=IVl5Pnocno5JypN9QmpCuk9Uqn9w1YkaCklg587gOaY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fYN7vEq/K2EaRfTvwEwn4Oc6a5VYfomW67/6VUtGcNJAWS8fAkM+s5w47phIURxJY
	 h4MxK1FIxG/d/XW5jNRp2Zom8hzGFM5vT9amgFsHvDRSSRDywO46sXBGrWn2CiapKi
	 +A97EPjiNaY2QP2KNdpuu0qEE7a/C1x94Bk2k42Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E85ACF899B5; Mon,  5 Aug 2024 02:39:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50419F899BB;
	Mon,  5 Aug 2024 02:39:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E914AF808C3; Mon,  5 Aug 2024 02:39:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16038F80632
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16038F80632
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=M/aDZsmH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XM/7Dr5DcJh1ASq/aCgBu/4lXKvs0N1WUIS18Mjc925senksRmfGv0pTwEwC45FJ2cl1YcGaHr6Qq94CCiT7JECb1hfqHvuTyL59gZhBuqj352IdVWDybE/SPQSKJlyebQNo8S0lnMfSp+Xj5Eb5UbqaWT4GSeOGRBgQgd/22BEmyZK+/19C//AdEhT6iBe8paXr0UoBHn4SKRqtv6AtToMY/Oz30el7f5WpBWtmG5ni0XmDqbN5MjoT/FWY4v7N0YioHo02+snSytQvqA/aIwmzYdo8yZTBXGzyYhlFVAGFH/QXvmXlJhbx6f8bVZjzDltAs/XYTFKmVoo8W8hiuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d1Tnz0jM8EDkt1JVWqMhraSWs42HkTV2gkn31r6HzZs=;
 b=wkWbCgS8ddL0xpX2rC2qYNSjRXhdFoXr2BwQZIctHrIsAeqVMF9cnWcllo8y7HsSug5z3QC715EnsY6AkDV9LmGeodtYgOgzsyItsAw27aPxP/id06zLHp9Pnyst3265UMFIb0xKrCJX0PWS1m1sUaMZyUJ0NQZ96friAH4dyKO42jARNc1z9usEMIikl3qHc0v7bejnVSP8TdPoy/hVGqfxC4qBjIvLOT6T7iwd9RRxfkztyoVMhnu0h3UMn8GXqun4eCWwqcm7vBif9XawYnW/odcPBHU7aVTGg047wUyJ/3cxpMCPLRj0+MhEdEGXZvhh+vd7Tnnle3unXsxggg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d1Tnz0jM8EDkt1JVWqMhraSWs42HkTV2gkn31r6HzZs=;
 b=M/aDZsmHQTIq0Et5PcPZ95F12FYieMwUaUa+ijA3sH77b3PWvPiZWw2Jc3koOQhOgO4EF0O7rqcJ+32Sp1Wy/hxoI5e5+78VI5JchD3vXmxaRaqxmM0WnRrvbJa2hr5DzAEVVIkwGsiX2ZsACxEygOryldSZ8LHawwWp0Uk/GOs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:38:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:38:45 +0000
Message-ID: <87cymnztuy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 044/113] ASoC: sh: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:38:45 +0000
X-ClientProxiedBy: TYCPR01CA0199.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: d10e942a-6d6e-41ec-5c28-08dcb4e6f6ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UUE2ltwbmyhmJrIlfN0m6ZFpi0bnwjjifaAWe1IaNe7UpTBDJ0SKr+93hrIz?=
 =?us-ascii?Q?OMOz8TyfGxud119orYfgbx02jKYUkwzl+OVK5QGf/SSwJEFUBkSLGR2ovue6?=
 =?us-ascii?Q?Q6MdECnMEFKvqBMk99icH5nO7MUQic4ejMUkoUCPfuRfuG2zJ5eW03qJWkrD?=
 =?us-ascii?Q?1jzDwQfPB8hZQwz9461j92473C00+xLDjHuDfXtfQt4L0kscvBtaYE4i/vrK?=
 =?us-ascii?Q?Is8DbfkMsq9LJjdIGx/1e4Un81APgXVf+hjAfY9tN0Sg4hf0G4bxv6iDaNSm?=
 =?us-ascii?Q?gfMtfIQrC8s03qJV280inKO/ISMYnmCP3weHj1QtJ/tpShCMLvVOEwcs0caO?=
 =?us-ascii?Q?9h2oBp6SJjZGpGWALyUNycckDROE1EddhND5NVXEb7wFRSInsWHy4bRnykzR?=
 =?us-ascii?Q?KqiWZxMeRjxBKZpnKZGvFCc0IPsVnwF51gN44LnNL9r3dp6THwhUvBSO7jpe?=
 =?us-ascii?Q?j2Bj7YPPM6Gwel6JpWjnwFK8et6fYv4+pyYHKWteeTPsl20iLRq0x9O1f8R1?=
 =?us-ascii?Q?qo0Xjefu1Xwi/fZR/Dq2ULBkRlT5vYfU8e2GrBiSZo92+V41zRqlhvJFEHGX?=
 =?us-ascii?Q?5drd/bmIS2ustt24yWI0U5Q9dTEqydrId7V9XuFYHcGu6zgN5ThA8YrslEob?=
 =?us-ascii?Q?KdfuNMXldrZWylCTPAZ3Q6NNMEUEXvqAxsckDH+VO00DOvylo4PzraRIAdZk?=
 =?us-ascii?Q?gzLgRSjYIgs7DboHWnfEw33L9pcLHnT1Mr1ZodkilK6tKbUJ8aEH3FY5DkJ0?=
 =?us-ascii?Q?4ybUhcXv5VQbg2rsIzxaKmZwUcVigGfgoM6Be+/JTMWZm5MaE9A1xgZ72+an?=
 =?us-ascii?Q?IPeSpzsoqCDnjavUgWZxVapUIt/lkX71iP17BGvPYwjDJ57wdIet68mslWpD?=
 =?us-ascii?Q?/McO2TQ5qFNSnowZCKSxxjP+iHg6uJ5mvcc16ZjveyEpup3a1je4gBgvFsAn?=
 =?us-ascii?Q?p10qFYqUX8ylLuxPQKyHU6MV8GZp2WbNFg2usE3PNm1ztc687UCMMg15Gq0r?=
 =?us-ascii?Q?Q877AwQW3bi6Y9tkvwYHTrXxU6dCLHFET9tmX9R4BCrKtb+dXHLc1/jzUKc0?=
 =?us-ascii?Q?Rz/JNIha9RWli0er86V7SzrBmtlFrC/OGUkNyyIYyYaD/FC/+3jJx2rhF9m2?=
 =?us-ascii?Q?xnHMCgylgQKDVQOmGQiWfoB+0yAM8H1sax33BEqR8n68XHNLMzNO2W7hXn2j?=
 =?us-ascii?Q?nRnpESfYZryYzl9k3NpvF+4aGsJyuz90QdEBnDD4wET3ZpWraFQ0fgMqyU1Z?=
 =?us-ascii?Q?HOPbZw+GfByTOPrGeTseSTwJOLna+33f823On9lpV4zauPzNr0Bbm18dHsVD?=
 =?us-ascii?Q?NwD03UZkdwTfxm5oJqZhRZwaShS+RFkDsyjbQ7przE1UoztGh1xKj9dBFaBC?=
 =?us-ascii?Q?sEX7OUls6aWJEg+QGC3NSZYJlcCyeACDZQc2sMGTYkbtDx5tww=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Jg0oyS8VxK0fvFnyXZPkjjpJLwaNHOaGey3qZI1iN1j3+g9xTLPs8pXhm06D?=
 =?us-ascii?Q?e42BCIC/YyJCryt8Nw0woQO7einx6tyaWZtdciw+PYYC4/Sc7SMkLZhX3iRq?=
 =?us-ascii?Q?XCJwNOdTdqQ0S7/sn+rd+rYNhCFp315wvU+jjOaBTMrPHGJnOy5WUbyph0+U?=
 =?us-ascii?Q?q0HpXANJ3tTzZOhv87URfe4AOXs5eeKBfvdhe/V5FfBocJBWjTNevxxftXmG?=
 =?us-ascii?Q?XHp3iM0NYAuinX6q5tK0fFUP4B93fYexlvJ5hDmVuYy9ExuRekqyXNZiZtrm?=
 =?us-ascii?Q?RR2TTHX/JFpyUcHyFyeLHvbVFcO1YnMHmo3ujB8b63neezQfN7YEMHTe0t5+?=
 =?us-ascii?Q?g2iL6O8eO2tke+9A6UvJnr7qf0D3bchxRFXgd+FtJQMP5s8R7PMI94pJHORr?=
 =?us-ascii?Q?5ZI80CatSBMLLEYn539/4uFuWHwQ3fFMxileW5AuQsPafmVjurBifUbyL0dq?=
 =?us-ascii?Q?A1h+T8YKRR11dPqJUAyBeXVPPycP5mZQzhkoAQmCI8+Z9quTMZw1pXr9ireP?=
 =?us-ascii?Q?x9BSDs0QU8/MZneCPUjvBqZfzrQOAnmeqgWd86UwaK0RYYKPO1xH7JyxVFjE?=
 =?us-ascii?Q?xDHOtN2OMIegw90HLparrGqxu0tg2x5fyZMyQe8O4/13hGA2OVifABsfh63x?=
 =?us-ascii?Q?mwzTyn53gXhV7Iw+qywvUjKpixqhCgOFM3ey8TtB8QCIOfchltd6gw0bqXkS?=
 =?us-ascii?Q?qufk/O87McmBt11PKAebabLMbcpuwy7PiTWehpas1MXeujPVT8IQvYfum3+u?=
 =?us-ascii?Q?jWGgT7HwGgm8/XkjMZFBX43dMY97LdchEWFe3X6jXqJZTJLFiN3VJl+6D6ml?=
 =?us-ascii?Q?/7nhe/k8zbyCC4x7acD0vXO1fnUjvOEZZx1jjF7qaDyaxoCR2+w1wUvnHWJ0?=
 =?us-ascii?Q?h2QGo7bkW8UiMpu+oH+YVJgryTvWfu8o12xDv+gunaqT0oM7cnW7+TFw/pKu?=
 =?us-ascii?Q?Sxu6kF31TFlLk9uiJo3VCfpnXFEfuJtae+zanPwkiULTzwS/9NCFruRy99Sc?=
 =?us-ascii?Q?2+a+D8Slhj7kTb2vydB4Ux3KWrC1aAVl1DiXmby48Ij6DC2fc6h9O9B6pglh?=
 =?us-ascii?Q?b+i0LlXPit15ce+o6lfGHOUWn2OdeIddT6bdeQjOj9NCqcxPGG7a9M6aYp2u?=
 =?us-ascii?Q?VRDWwnAUXdx7Th7kPkOAdhM3uSLEDPlWhkCgNyefp3gXArjni9Lraw0aKnmX?=
 =?us-ascii?Q?uCUtzifqBwSgIj23L8STooz+clTfV9zVrgYNpuRIyEYufJy5sFJcngOYeuCq?=
 =?us-ascii?Q?mo5uhcB1qwTH9Moxw2gPcIOrEJ5z5OnL+NkU+tFGKM2ifCGkKaORcESe8kD4?=
 =?us-ascii?Q?26ODjvjXHlwZyHuCGCemzfQwjq3MO+Usk6YUm1XBvWYspmPm12lxryzWsKW0?=
 =?us-ascii?Q?wrAmnAb3p8IeV/euWZLJadfcurUUHloa8QGHegZqjyBJUXHAj2MuDgNkBLx4?=
 =?us-ascii?Q?pOyjb/18pIUsttVL9TIkXWaVUM++4YxAi5sGxCjMaSm/ZPm5DAZx6BZgGKPT?=
 =?us-ascii?Q?OTtJzCMuf0t33vPNt90eWgPE+kThck0cHho49hSSWR5gbeaiBcw7YZCEfGnw?=
 =?us-ascii?Q?S/saaIq93LR1bwpNAiY2Z03A7zZ+anL4a7OajUQ7TrlK2qOsYXwGWsj+FkPP?=
 =?us-ascii?Q?Y5ibry24DqX3K9CeN4NV9FU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d10e942a-6d6e-41ec-5c28-08dcb4e6f6ac
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:38:45.4687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5FFhpisahyfj2QOPNKwUfZqfiwHlCLTXC7f7syE6zs1/DVIxxjG4KyhmDKSulg2OvyzIA+j6sUlqMgA3IHkv6I7QFtbmOTrH0liMLEGqfsNjYkGyz1E+mVzznuz+AjIu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685
Message-ID-Hash: OOOJSWXJDUW6VI3AB4GP3YN4QDUYUAGX
X-Message-ID-Hash: OOOJSWXJDUW6VI3AB4GP3YN4QDUYUAGX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OOOJSWXJDUW6VI3AB4GP3YN4QDUYUAGX/>
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
 sound/soc/sh/dma-sh7760.c | 12 ++++++------
 sound/soc/sh/fsi.c        |  7 +------
 sound/soc/sh/hac.c        |  2 +-
 sound/soc/sh/rcar/core.c  |  4 ++--
 sound/soc/sh/rz-ssi.c     | 14 ++++----------
 sound/soc/sh/siu_dai.c    |  4 ++--
 sound/soc/sh/siu_pcm.c    | 14 +++++++-------
 sound/soc/sh/ssi.c        |  2 +-
 8 files changed, 24 insertions(+), 35 deletions(-)

diff --git a/sound/soc/sh/dma-sh7760.c b/sound/soc/sh/dma-sh7760.c
index c53539482c208..32b30bbfaa88f 100644
--- a/sound/soc/sh/dma-sh7760.c
+++ b/sound/soc/sh/dma-sh7760.c
@@ -120,7 +120,7 @@ static int camelot_pcm_open(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct camelot_pcm *cam = &cam_pcm_data[snd_soc_rtd_to_cpu(rtd, 0)->id];
-	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
+	int recv = snd_pcm_is_capture(substream);
 	int ret, dmairq;
 
 	snd_soc_set_runtime_hwparams(substream, &camelot_pcm_hardware);
@@ -154,7 +154,7 @@ static int camelot_pcm_close(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct camelot_pcm *cam = &cam_pcm_data[snd_soc_rtd_to_cpu(rtd, 0)->id];
-	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
+	int recv = snd_pcm_is_capture(substream);
 	int dmairq;
 
 	dmairq = (recv) ? cam->txid + 2 : cam->txid;
@@ -176,7 +176,7 @@ static int camelot_hw_params(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct camelot_pcm *cam = &cam_pcm_data[snd_soc_rtd_to_cpu(rtd, 0)->id];
-	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
+	int recv = snd_pcm_is_capture(substream);
 
 	if (recv) {
 		cam->rx_period_size = params_period_bytes(hw_params);
@@ -198,7 +198,7 @@ static int camelot_prepare(struct snd_soc_component *component,
 	pr_debug("PCM data: addr %pad len %zu\n", &runtime->dma_addr,
 		 runtime->dma_bytes);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		BRGREG(BRGATXSAR) = (unsigned long)runtime->dma_area;
 		BRGREG(BRGATXTCR) = runtime->dma_bytes;
 	} else {
@@ -242,7 +242,7 @@ static int camelot_trigger(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct camelot_pcm *cam = &cam_pcm_data[snd_soc_rtd_to_cpu(rtd, 0)->id];
-	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
+	int recv = snd_pcm_is_capture(substream);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -270,7 +270,7 @@ static snd_pcm_uframes_t camelot_pos(struct snd_soc_component *component,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct camelot_pcm *cam = &cam_pcm_data[snd_soc_rtd_to_cpu(rtd, 0)->id];
-	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
+	int recv = snd_pcm_is_capture(substream);
 	unsigned long pos;
 
 	/* cannot use the DMABRG pointer register: under load, by the
diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index 087e379aa3bc4..59198f615ed6a 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -398,11 +398,6 @@ static int fsi_is_enable_stream(struct fsi_priv *fsi)
 	return fsi->enable_stream;
 }
 
-static int fsi_is_play(struct snd_pcm_substream *substream)
-{
-	return substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-}
-
 static struct snd_soc_dai *fsi_get_dai(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -492,7 +487,7 @@ static void fsi_count_fifo_err(struct fsi_priv *fsi)
 static inline struct fsi_stream *fsi_stream_get(struct fsi_priv *fsi,
 					struct snd_pcm_substream *substream)
 {
-	return fsi_is_play(substream) ? &fsi->playback : &fsi->capture;
+	return snd_pcm_is_playback(substream) ? &fsi->playback : &fsi->capture;
 }
 
 static int fsi_stream_is_working(struct fsi_priv *fsi,
diff --git a/sound/soc/sh/hac.c b/sound/soc/sh/hac.c
index cc200f45826c3..dc724042d336e 100644
--- a/sound/soc/sh/hac.c
+++ b/sound/soc/sh/hac.c
@@ -237,7 +237,7 @@ static int hac_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_soc_dai *dai)
 {
 	struct hac_priv *hac = &hac_cpu_data[dai->id];
-	int d = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0 : 1;
+	int d = snd_pcm_is_capture(substream);
 
 	switch (params->msbits) {
 	case 16:
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 15cb5e7008f9f..9e719a01769ba 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -683,7 +683,7 @@ static
 struct rsnd_dai_stream *rsnd_rdai_to_io(struct rsnd_dai *rdai,
 					struct snd_pcm_substream *substream)
 {
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		return &rdai->playback;
 	else
 		return &rdai->capture;
@@ -1004,7 +1004,7 @@ static int rsnd_soc_dai_startup(struct snd_pcm_substream *substream,
 	 * It depends on Clock Master Mode
 	 */
 	if (rsnd_rdai_is_clk_master(rdai)) {
-		int is_play = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+		int is_play = snd_pcm_is_playback(substream);
 
 		snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
 				    rsnd_soc_hw_rule_rate,
diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index d0bf0487bf1bd..d0afc9ced950b 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -171,18 +171,12 @@ rz_ssi_get_dai(struct snd_pcm_substream *substream)
 	return snd_soc_rtd_to_cpu(rtd, 0);
 }
 
-static inline bool rz_ssi_stream_is_play(struct rz_ssi_priv *ssi,
-					 struct snd_pcm_substream *substream)
-{
-	return substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-}
-
 static inline struct rz_ssi_stream *
 rz_ssi_stream_get(struct rz_ssi_priv *ssi, struct snd_pcm_substream *substream)
 {
 	struct rz_ssi_stream *stream = &ssi->playback;
 
-	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
+	if (!snd_pcm_is_playback(substream))
 		stream = &ssi->capture;
 
 	return stream;
@@ -349,7 +343,7 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
 
 static int rz_ssi_start(struct rz_ssi_priv *ssi, struct rz_ssi_stream *strm)
 {
-	bool is_play = rz_ssi_stream_is_play(ssi, strm->substream);
+	bool is_play = snd_pcm_is_playback(strm->substream);
 	bool is_full_duplex;
 	u32 ssicr, ssifcr;
 
@@ -682,7 +676,7 @@ static int rz_ssi_dma_transfer(struct rz_ssi_priv *ssi,
 		 */
 		return 0;
 
-	dir = rz_ssi_stream_is_play(ssi, substream) ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
+	dir = snd_pcm_is_playback(substream) ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
 
 	/* Always transfer 1 period */
 	amount = runtime->period_size;
@@ -808,7 +802,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		if (ssi->dma_rt) {
 			bool is_playback;
 
-			is_playback = rz_ssi_stream_is_play(ssi, substream);
+			is_playback = snd_pcm_is_playback(substream);
 			ret = rz_ssi_dma_slave_config(ssi, ssi->playback.dma_ch,
 						      is_playback);
 			/* Fallback to pio */
diff --git a/sound/soc/sh/siu_dai.c b/sound/soc/sh/siu_dai.c
index d0b5c543fd2f8..e747d34b51580 100644
--- a/sound/soc/sh/siu_dai.c
+++ b/sound/soc/sh/siu_dai.c
@@ -521,7 +521,7 @@ static void siu_dai_shutdown(struct snd_pcm_substream *substream,
 	dev_dbg(substream->pcm->card->dev, "%s: port=%d@%p\n", __func__,
 		info->port_id, port_info);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		port_info->play_cap &= ~PLAYBACK_ENABLED;
 	else
 		port_info->play_cap &= ~CAPTURE_ENABLED;
@@ -550,7 +550,7 @@ static int siu_dai_prepare(struct snd_pcm_substream *substream,
 		"%s: port %d, active streams %lx, %d channels\n",
 		__func__, info->port_id, port_info->play_cap, rt->channels);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		self = PLAYBACK_ENABLED;
 		siu_stream = &port_info->playback;
 	} else {
diff --git a/sound/soc/sh/siu_pcm.c b/sound/soc/sh/siu_pcm.c
index f15ff36e79345..27ee6fd6d35c2 100644
--- a/sound/soc/sh/siu_pcm.c
+++ b/sound/soc/sh/siu_pcm.c
@@ -214,7 +214,7 @@ static void siu_io_work(struct work_struct *work)
 		return;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		dma_addr_t buff;
 		size_t count;
 
@@ -306,7 +306,7 @@ static int siu_pcm_open(struct snd_soc_component *component,
 
 	dev_dbg(dev, "%s, port=%d@%p\n", __func__, port, port_info);
 
-	if (ss->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(ss)) {
 		siu_stream = &port_info->playback;
 		param = &siu_stream->param;
 		param->shdma_slave.slave_id = port ? pdata->dma_slave_tx_b :
@@ -340,7 +340,7 @@ static int siu_pcm_close(struct snd_soc_component *component,
 
 	dev_dbg(dev, "%s: port=%d\n", __func__, info->port_id);
 
-	if (ss->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(ss))
 		siu_stream = &port_info->playback;
 	else
 		siu_stream = &port_info->capture;
@@ -363,7 +363,7 @@ static int siu_pcm_prepare(struct snd_soc_component *component,
 	struct siu_stream *siu_stream;
 	snd_pcm_sframes_t xfer_cnt;
 
-	if (ss->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(ss))
 		siu_stream = &port_info->playback;
 	else
 		siu_stream = &port_info->capture;
@@ -413,7 +413,7 @@ static int siu_pcm_trigger(struct snd_soc_component *component,
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		if (ss->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(ss))
 			ret = siu_pcm_stmwrite_start(port_info);
 		else
 			ret = siu_pcm_stmread_start(port_info);
@@ -424,7 +424,7 @@ static int siu_pcm_trigger(struct snd_soc_component *component,
 
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
-		if (ss->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(ss))
 			siu_pcm_stmwrite_stop(port_info);
 		else
 			siu_pcm_stmread_stop(port_info);
@@ -455,7 +455,7 @@ siu_pcm_pointer_dma(struct snd_soc_component *component,
 	size_t ptr;
 	struct siu_stream *siu_stream;
 
-	if (ss->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(ss))
 		siu_stream = &port_info->playback;
 	else
 		siu_stream = &port_info->capture;
diff --git a/sound/soc/sh/ssi.c b/sound/soc/sh/ssi.c
index 96cf523c22734..f77b4d9a4a205 100644
--- a/sound/soc/sh/ssi.c
+++ b/sound/soc/sh/ssi.c
@@ -135,7 +135,7 @@ static int ssi_hw_params(struct snd_pcm_substream *substream,
 
 	channels = params_channels(params);
 	bits = params->msbits;
-	recv = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ? 0 : 1;
+	recv = snd_pcm_is_capture(substream);
 
 	pr_debug("ssi_hw_params() enter\nssicr was    %08lx\n", ssicr);
 	pr_debug("bits: %u channels: %u\n", bits, channels);
-- 
2.43.0

