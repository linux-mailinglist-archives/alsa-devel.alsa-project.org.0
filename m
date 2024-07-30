Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB53E940546
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 04:33:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A711DE9A;
	Tue, 30 Jul 2024 04:32:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A711DE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722306788;
	bh=HEQKq4onP49J9txY9T9/N2rQAIeVPHnq8yJxkpAbgkU=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SiDbhY5ZWIeSTmy+lk/azDn1qn5SxI5CkolRRgCP/dYZ1uJlxlsijVQ/OTpe6bSdG
	 ujdIcK7+2zmD9SWHt/vjGk0m0rAS3V38tXoWwOCEeHt+LvZcVMxdiDvJ0zrGE5XMt7
	 BYRPPItEIKgIreVFNH3OLNY+mIBKdRbIK1WU8WmA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66252F805B5; Tue, 30 Jul 2024 04:32:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7012FF805B1;
	Tue, 30 Jul 2024 04:32:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44CD8F80269; Tue, 30 Jul 2024 04:32:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35AD6F800C9
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 04:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35AD6F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=N2q/Akc+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y15OezYIatUAoFrN8eBCKtq6nMNTk9UkBINCgmQv3uHQiB/KzO8b/LX0FnRgaoJju8yvk/csiLfRp3xJYT48WKKy8NYw+fUYXgYB47tFERIYNN3xbLAD/LEmsX6nvlcCedGYCFaG7/3gTfZ6b7W1jmuBdoR0Fog2/aXPSJAKIuG5XOXC6gSc8EBdLyGFJ8ea+tO9T2Hw6sRlsiCetPiP29fNmioFaoeUrZCL5tmk0o8Bgf6e0rCB4Ny0Z9SPI34wE2w+J22ELaGDknq6oiV79Q3R/UAH5NKsyTUoJiuxu0VTWlVO970Kxp/1IyY1h+4P3UuiJ1AYdGzN426qZe6CfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCOuxnKrPmp+QdAQ/lpN/A4KnkagsEp0HxZzkm5TM6k=;
 b=sZ29ixHwI+9NGlANMM6EcEmmBJMvQPOZK+m/RXAR2FwlYEnaPDq3Vl0OTjLqILJeld44RL6iFg0padpCCDG4vJ89QJOPhhBJLqdZC/4vdxj41rfqVTHt7Q8JZYnffaMZlP6fZhvFYVaQn4WjUstK7d99MiDQGvT+wRenU0nWkrdldMljVF83imkHln7atKucut2KZL6NVJS4lnT5XWDP+xFKIgcYLptecCxb6zUx+lBb6K4pml2xvwGwDsj44eBezgGuRgu+HUc6D8svgTAiF9Iv4I+0CO+0SW1L+JpBUkF4DGu3bR7hlJlCj85SHQhkrfZgzceeyMWKRx89+QhxhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCOuxnKrPmp+QdAQ/lpN/A4KnkagsEp0HxZzkm5TM6k=;
 b=N2q/Akc+guSYK0VbZUDlM0CUNGs9NxZmXDpM834dluvdrwmsXUuUiraYSPIdUj+poqLXHAWxvu3hD6pGt7rYAQ/yXpUry+7embAPkmDx1l3saGO72jmhqcxFD352Ma7oMjVqhCohIV+eWMVKGLpSh3t0PCZENkTd8IOSlLuq47s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11814.jpnprd01.prod.outlook.com
 (2603:1096:400:3fc::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 02:32:22 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:32:22 +0000
Message-ID: <87cymvk3t5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: rsnd: use pcm_dmaengine code
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 02:32:22 +0000
X-ClientProxiedBy: TYAPR01CA0224.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11814:EE_
X-MS-Office365-Filtering-Correlation-Id: dc7f0a30-8cad-492d-e90c-08dcb03fd789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?K3zVqW+iRB5oiVFSEj3Z+neaVAyUfhFkfzrWaKdryqXgsIO6D5VW0TU66mXs?=
 =?us-ascii?Q?FbLn7N0dCxXt6mN38rz65Ot84u5pk7eqklVSkAiQfq7SU4qEAhI2l+oraI9v?=
 =?us-ascii?Q?4TU9xh28hZ7DU5pq/IfDzNYMLG8obW01gey3r9DQ40LcJNLi6uEJLzx5ARdh?=
 =?us-ascii?Q?+4rW5jsznjIdvndTcqknD45nGuCpa+rL+JhEfnUW2UsrshRjMTkpz+TJMbbr?=
 =?us-ascii?Q?9Hh/XzZrFEBtaVOu4rek/xbJmpE3TW/sYz4rp7bxQIze7eGiSe/geIghOQVK?=
 =?us-ascii?Q?NeLXR4QkDwOM2ZQUUmx2Fu4fDFryt1Zi2Cf13CLWtNGqVxAn7hD0Uw2+SNAA?=
 =?us-ascii?Q?rYTUzNeX0Jg4k46vckW2XD744+yIBOPSNj8Gzj3+/c58/LYcJX4Yen3RhOO4?=
 =?us-ascii?Q?UDdFJl8hxAKMGAYWGKu5iRVRn2tRtp4OVMvaBwIzh1LgY+RQJQTbB157jLIa?=
 =?us-ascii?Q?3b9OND4vjoUB517uupXKuTfMmAKdbI4N3L6nXoe2g9ILDfbZpjASynHrdien?=
 =?us-ascii?Q?nh1NLV/bB5EEIXacvok171LJB/rJ43SMiXdEd+BLvERf3jtJmmXVtLB7ZCg9?=
 =?us-ascii?Q?PL3hgkx/PRj66A7qneAqOTjjgl9u4AdPhSR/cwd6n7Xrl4Y8HgymJz62Mwx0?=
 =?us-ascii?Q?Xo87inMw5ZyK4zY2PkjNxEQbkQF4nIKw7Ue/WZ3w0Hk3UcDL/zFxFGN+13hD?=
 =?us-ascii?Q?Z+IVDECHMZpaSB+BgJis6RqToeePI5aOukjK2P4y5u6k1oXwoJZgnKD5+wtB?=
 =?us-ascii?Q?6vX2p1RYCS55MbiHSbmGYxrH324gDROXeKx/MdIQFPNk8JC7WWN8dOO+EGS2?=
 =?us-ascii?Q?ea/XsSMMELpIJ8EoK0+0XibHTTG8ozT9REOTJSywEibfGtdcYL0GNht9s3Jo?=
 =?us-ascii?Q?c09Cto6/RYFomW2sMvyIqKL5PLS1XmrTOmkDMaWdE/aKll/yIGAzPIWr5aV2?=
 =?us-ascii?Q?CNgc7k6QcYq9EvKCKedPRZVRxFg8zM/7LW3AbUvC3KxOknrrn+NbmNtVVw8h?=
 =?us-ascii?Q?VetHJSZGWbvAhSM/lGVJSLpSPbbmOdOWaYGXhcusvtabt1uCjHpVLRusja7H?=
 =?us-ascii?Q?NIiPh34eaL6WTU/hDxJpyhLXBpOXWmbhkmfYmTOj3oHyRe/52hS9LBqzOl9j?=
 =?us-ascii?Q?b7vX46WK1yjnXHm7fwa1uNAw5YoJFgjHp/HhA2WvADAQHTlH+HJDVYVH7iKn?=
 =?us-ascii?Q?MzK0cFs74gyvbGqKM4gFqq8Mn+h7eLxrNLMKvdZ2NRdNOJzRxKqVMDsUo5Rl?=
 =?us-ascii?Q?aPzZccePkokvAldRqsb2MMkxpN4OFw34kHvQVKnljkYGVDBAVd+JwLFFKgYH?=
 =?us-ascii?Q?N+1C+X8CRaSYr02+h+VAfFs32bruKcs7nSHsED9s9831WYxsGmJ8BWYWi8N6?=
 =?us-ascii?Q?tPBCw8i5eBek/ucnk6/nhai6iLwqNbCJheLrqIrMJHKAkxRUqg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lhoo+2U962tGFuaSgYlnsweGtSiwObE6OZ66Do3pdNOgB6YAxhSsRAMqHdDn?=
 =?us-ascii?Q?nkVFjw106ZZOOqHS70rHqOV7NfLd3L6RfooG1Kww1hR1BmIHKv6kqMFXMvrn?=
 =?us-ascii?Q?/4kcV0TX8oCRAiLo8LBo2xPIi3nHBKwkUn+YB+UxUh+45+UznZRu9V0o2Vdi?=
 =?us-ascii?Q?8Vs0VvLy9J8VQxiqv0z8ShtOYcwojAozVuQuJY6wvs3d/GyhxKzWgTUqIJf6?=
 =?us-ascii?Q?gLbmN/8CrymHAhXjbv+JwEN3Bm0LIcHND42zCQ5puTHypp60YfK0VzSy8+CD?=
 =?us-ascii?Q?mTsevlDxSLY4Dig+LY8rrcBLLND2S2mD4kiMdlNuSTY2NR12Z6g5T7TC/bec?=
 =?us-ascii?Q?L4RW79fSzSr1yzK8p0lwjgGLlreozdcHc9OEZwlp4SS16VSt9+0mU0CzVazh?=
 =?us-ascii?Q?slFl0YJybB5hSGZBofFOFvn6x1ErWn/0XXaPth2qiR8wK/s5+rqscrA3uZCp?=
 =?us-ascii?Q?Tjku0KoS/pG9+GKFioixyu01F9Q+tXNCBpXnt3uXNpHlpbJXeYdVqzN10WYu?=
 =?us-ascii?Q?enUxbUYoG+o0bHdkymqX+tR081rJ9CDneskv93OnLkkgbaD4Idw4xSWaHnfL?=
 =?us-ascii?Q?DSwWCrkd9GMekY2L2WTz4vTLZztqZco/qBnkUgf7Ygy3GtXxb75KZ8JQgDy9?=
 =?us-ascii?Q?+ZsMKYwexScNAMFIJr0ZOMOsDL8H6oaVfP+jlpju4Z1WlfeB5cesFxsQTxwL?=
 =?us-ascii?Q?LtRRwYrHOZQyS9FKj8pCRuenP9N5n0oIR8lkRktENcOrDLOxu2VGNzcQMsPJ?=
 =?us-ascii?Q?hVhI6h73uaJJl9NS5ilyetYDLJn3e+oleIwYPgPbkxdS9Mw2Gyv1/JgIPalu?=
 =?us-ascii?Q?NZ9X6FFZBfV7TUpsptOxkFOBQkNYGA8wnHUljobWypQZYStPvfqfo2rTDGZY?=
 =?us-ascii?Q?PGGcr6fgJGg7srMNTnWrNzQg0Nmo1YHG31fBMEuZnCPYpG9bNB8qyrW7PmaY?=
 =?us-ascii?Q?NnqoHLnbFXRmZ4nF1tNpVgIhhWHC45Fzgt7YxRTcRQU8xFCuwp1ujchQV5IP?=
 =?us-ascii?Q?rdH0RhM15zJFiZhW3FRqGGwVB6yLzAIAYJsesBM0IK+LH5L6Ngv2CuEi324t?=
 =?us-ascii?Q?HJiPgTCAWIwp8ZvXr45u96+4/sXMclMxoReIiYMmRxFXCW+s5Vmm91eCWrzR?=
 =?us-ascii?Q?fwa57k/CySSDmlzZj3BmUXasMj74KMS2t//MSVidcI1/aYS9c9OmygOXrwW/?=
 =?us-ascii?Q?TLkG1X2/pksWoerwYDIXuIvRyVNZxiKaL3JwfVtkOkmEKgEF3JtzfMV7B9WC?=
 =?us-ascii?Q?pQZ3DDNbPQJvzaXmg8TsbzULO4lmgN6bTYSIhkRp1xygP6dnQ6t655xPvlr2?=
 =?us-ascii?Q?E+2ml+MkC1FrwpBWqPgp1BiGxpXD8lJ/ZwIwbHSqMaSn4bpKJs3uJpCEWse/?=
 =?us-ascii?Q?oVwu14uQgTPCEkjY/rNqbk+hqYFXZbqjWy7d3mXhIbjLEJt215ZSGhB67EJN?=
 =?us-ascii?Q?hQrWBWfbjLdX1HN4fFbapXLB2kc9uLFWsALPWNMuNm1o9j2s22QaDGRe3N5u?=
 =?us-ascii?Q?knHaY4IK+ct0pCTPFdu5ktVn6OYtxhqhaFdn31OhV0WM8All6cQDjhyxIXL5?=
 =?us-ascii?Q?IzdS6kzv4/8jzvpOHLP6szm0A8iRrry6vKQtrS8rxSSfsTGI0SlUOU1jsxNo?=
 =?us-ascii?Q?P4QuNbGa2gw7oLMgkiTl6IY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dc7f0a30-8cad-492d-e90c-08dcb03fd789
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 02:32:22.6576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Mg+WNUlrg4R/d2puj952qL/6G3TsEqNTv9Zkin96Qky0hJlnD+3pB8Ow1diteB9YBu25xG2v9G00q7hEmKhydUXwBW6utYNNnCQaBhJIbr/PQEUhhUIKEupo/F/J79BC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11814
Message-ID-Hash: 47TUEPLNID23XDQPINCCDK6ZRTS5VNYK
X-Message-ID-Hash: 47TUEPLNID23XDQPINCCDK6ZRTS5VNYK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/47TUEPLNID23XDQPINCCDK6ZRTS5VNYK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

rsnd is implementing own DMAEngine code, but we can replace it with
pcm_dmaengine code, because these are almost same.
Let's use existing and stable code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/Kconfig     |  1 +
 sound/soc/sh/rcar/core.c | 17 ---------
 sound/soc/sh/rcar/dma.c  | 75 ++++------------------------------------
 sound/soc/sh/rcar/rsnd.h |  1 -
 sound/soc/sh/rcar/ssi.c  |  2 +-
 5 files changed, 9 insertions(+), 87 deletions(-)

diff --git a/sound/soc/sh/Kconfig b/sound/soc/sh/Kconfig
index 7bddfd5e38d6c..426632996a0a3 100644
--- a/sound/soc/sh/Kconfig
+++ b/sound/soc/sh/Kconfig
@@ -41,6 +41,7 @@ config SND_SOC_RCAR
 	depends on COMMON_CLK
 	depends on OF
 	select SND_SIMPLE_CARD_UTILS
+	select SND_DMAENGINE_PCM
 	select REGMAP_MMIO
 	help
 	  This option enables R-Car SRU/SCU/SSIU/SSI sound support
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 6bc7027ed4dbf..233128c8ff145 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -660,23 +660,6 @@ static struct rsnd_dai *rsnd_dai_to_rdai(struct snd_soc_dai *dai)
 	return rsnd_rdai_get(priv, dai->id);
 }
 
-/*
- *	rsnd_soc_dai functions
- */
-void rsnd_dai_period_elapsed(struct rsnd_dai_stream *io)
-{
-	struct snd_pcm_substream *substream = io->substream;
-
-	/*
-	 * this function should be called...
-	 *
-	 * - if rsnd_dai_pointer_update() returns true
-	 * - without spin lock
-	 */
-
-	snd_pcm_period_elapsed(substream);
-}
-
 static void rsnd_dai_stream_init(struct rsnd_dai_stream *io,
 				struct snd_pcm_substream *substream)
 {
diff --git a/sound/soc/sh/rcar/dma.c b/sound/soc/sh/rcar/dma.c
index 7b499eee50806..2342bbb6fe92e 100644
--- a/sound/soc/sh/rcar/dma.c
+++ b/sound/soc/sh/rcar/dma.c
@@ -7,6 +7,7 @@
 
 #include <linux/delay.h>
 #include <linux/of_dma.h>
+#include <sound/dmaengine_pcm.h>
 #include "rsnd.h"
 
 /*
@@ -22,8 +23,6 @@
 
 struct rsnd_dmaen {
 	struct dma_chan		*chan;
-	dma_cookie_t		cookie;
-	unsigned int		dma_len;
 };
 
 struct rsnd_dmapp {
@@ -66,20 +65,6 @@ static struct rsnd_mod mem = {
 /*
  *		Audio DMAC
  */
-static void __rsnd_dmaen_complete(struct rsnd_mod *mod,
-				  struct rsnd_dai_stream *io)
-{
-	if (rsnd_io_is_working(io))
-		rsnd_dai_period_elapsed(io);
-}
-
-static void rsnd_dmaen_complete(void *data)
-{
-	struct rsnd_mod *mod = data;
-
-	rsnd_mod_interrupt(mod, __rsnd_dmaen_complete);
-}
-
 static struct dma_chan *rsnd_dmaen_request_channel(struct rsnd_dai_stream *io,
 						   struct rsnd_mod *mod_from,
 						   struct rsnd_mod *mod_to)
@@ -98,13 +83,7 @@ static int rsnd_dmaen_stop(struct rsnd_mod *mod,
 			   struct rsnd_dai_stream *io,
 			   struct rsnd_priv *priv)
 {
-	struct rsnd_dma *dma = rsnd_mod_to_dma(mod);
-	struct rsnd_dmaen *dmaen = rsnd_dma_to_dmaen(dma);
-
-	if (dmaen->chan)
-		dmaengine_terminate_async(dmaen->chan);
-
-	return 0;
+	return snd_dmaengine_pcm_trigger(io->substream, SNDRV_PCM_TRIGGER_STOP);
 }
 
 static int rsnd_dmaen_cleanup(struct rsnd_mod *mod,
@@ -120,7 +99,7 @@ static int rsnd_dmaen_cleanup(struct rsnd_mod *mod,
 	 * Let's call it under prepare
 	 */
 	if (dmaen->chan)
-		dma_release_channel(dmaen->chan);
+		snd_dmaengine_pcm_close_release_chan(io->substream);
 
 	dmaen->chan = NULL;
 
@@ -153,7 +132,7 @@ static int rsnd_dmaen_prepare(struct rsnd_mod *mod,
 		return -EIO;
 	}
 
-	return 0;
+	return snd_dmaengine_pcm_open(io->substream, dmaen->chan);
 }
 
 static int rsnd_dmaen_start(struct rsnd_mod *mod,
@@ -162,12 +141,9 @@ static int rsnd_dmaen_start(struct rsnd_mod *mod,
 {
 	struct rsnd_dma *dma = rsnd_mod_to_dma(mod);
 	struct rsnd_dmaen *dmaen = rsnd_dma_to_dmaen(dma);
-	struct snd_pcm_substream *substream = io->substream;
 	struct device *dev = rsnd_priv_to_dev(priv);
-	struct dma_async_tx_descriptor *desc;
 	struct dma_slave_config cfg = {};
 	enum dma_slave_buswidth buswidth = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	int is_play = rsnd_io_is_play(io);
 	int ret;
 
 	/*
@@ -195,7 +171,7 @@ static int rsnd_dmaen_start(struct rsnd_mod *mod,
 		}
 	}
 
-	cfg.direction	= is_play ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM;
+	cfg.direction	= snd_pcm_substream_to_dma_direction(io->substream);
 	cfg.src_addr	= dma->src_addr;
 	cfg.dst_addr	= dma->dst_addr;
 	cfg.src_addr_width = buswidth;
@@ -209,32 +185,7 @@ static int rsnd_dmaen_start(struct rsnd_mod *mod,
 	if (ret < 0)
 		return ret;
 
-	desc = dmaengine_prep_dma_cyclic(dmaen->chan,
-					 substream->runtime->dma_addr,
-					 snd_pcm_lib_buffer_bytes(substream),
-					 snd_pcm_lib_period_bytes(substream),
-					 is_play ? DMA_MEM_TO_DEV : DMA_DEV_TO_MEM,
-					 DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
-
-	if (!desc) {
-		dev_err(dev, "dmaengine_prep_slave_sg() fail\n");
-		return -EIO;
-	}
-
-	desc->callback		= rsnd_dmaen_complete;
-	desc->callback_param	= rsnd_mod_get(dma);
-
-	dmaen->dma_len		= snd_pcm_lib_buffer_bytes(substream);
-
-	dmaen->cookie = dmaengine_submit(desc);
-	if (dmaen->cookie < 0) {
-		dev_err(dev, "dmaengine_submit() fail\n");
-		return -EIO;
-	}
-
-	dma_async_issue_pending(dmaen->chan);
-
-	return 0;
+	return snd_dmaengine_pcm_trigger(io->substream, SNDRV_PCM_TRIGGER_START);
 }
 
 struct dma_chan *rsnd_dma_request_channel(struct device_node *of_node, char *name,
@@ -307,19 +258,7 @@ static int rsnd_dmaen_pointer(struct rsnd_mod *mod,
 			      struct rsnd_dai_stream *io,
 			      snd_pcm_uframes_t *pointer)
 {
-	struct snd_pcm_runtime *runtime = rsnd_io_to_runtime(io);
-	struct rsnd_dma *dma = rsnd_mod_to_dma(mod);
-	struct rsnd_dmaen *dmaen = rsnd_dma_to_dmaen(dma);
-	struct dma_tx_state state;
-	enum dma_status status;
-	unsigned int pos = 0;
-
-	status = dmaengine_tx_status(dmaen->chan, dmaen->cookie, &state);
-	if (status == DMA_IN_PROGRESS || status == DMA_PAUSED) {
-		if (state.residue > 0 && state.residue <= dmaen->dma_len)
-			pos = dmaen->dma_len - state.residue;
-	}
-	*pointer = bytes_to_frames(runtime, pos);
+	*pointer = snd_dmaengine_pcm_pointer(io->substream);
 
 	return 0;
 }
diff --git a/sound/soc/sh/rcar/rsnd.h b/sound/soc/sh/rcar/rsnd.h
index ff294aa2d6407..dba684e4334b1 100644
--- a/sound/soc/sh/rcar/rsnd.h
+++ b/sound/soc/sh/rcar/rsnd.h
@@ -576,7 +576,6 @@ int rsnd_rdai_ssi_lane_ctrl(struct rsnd_dai *rdai,
 #define rsnd_rdai_width_get(rdai) \
 	rsnd_rdai_width_ctrl(rdai, 0)
 int rsnd_rdai_width_ctrl(struct rsnd_dai *rdai, int width);
-void rsnd_dai_period_elapsed(struct rsnd_dai_stream *io);
 int rsnd_dai_connect(struct rsnd_mod *mod,
 		     struct rsnd_dai_stream *io,
 		     enum rsnd_mod_type type);
diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index 8d2a86383ae01..b3d4e8ae07eff 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -706,7 +706,7 @@ static void __rsnd_ssi_interrupt(struct rsnd_mod *mod,
 	spin_unlock(&priv->lock);
 
 	if (elapsed)
-		rsnd_dai_period_elapsed(io);
+		snd_pcm_period_elapsed(io->substream);
 
 	if (stop)
 		snd_pcm_stop_xrun(io->substream);
-- 
2.43.0

