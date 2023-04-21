Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F666EA082
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 02:13:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 889E2EB7;
	Fri, 21 Apr 2023 02:12:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 889E2EB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682036003;
	bh=cPvplWlQ668mjPIj4/Es/3ellauhSUlTNkW6nEMCOXM=;
	h=To:In-Reply-To:References:From:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LJRWfrOJpjRc9YnMdm+C+85rN6EPr4+zdhd2lkW5v5aqIazYToZOg2fkGYQ4BQlQf
	 ViQ/hL+qZhY7RPzO3V2fDllcjCoMHaaxrskLlDiuqbYumxyIwft8D1Wivq0zQTR0d3
	 PU7T3z9VGQ+Fg/9msHl+pxrDI+UNownzTOHkH5jQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF87BF80551;
	Fri, 21 Apr 2023 02:11:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 055FDF80558; Fri, 21 Apr 2023 02:11:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::715])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEC45F80551
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 02:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEC45F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=HsrztZen
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jy/LU/sUxXFBxsPFQfWQIlB53h9WDXTL44gXRXNcMgGvXiEF9iigWuhqnSe9I3CIrxKLd6coY3LlnB0BrlcniPZ5tXV9rGhTxYGj0bpoibocEiZURYMh6SRAoBaPrWbWY+RPfgGswAC8VsUPkkfBErVjmM8vnpxkMZB3J3ZWnTyeEsoSEMZLAb7QcIwOT/kZyuf167sZi6imdmTqZabOJFtZK/68LMCcTu8f9vBjxQVr9RADBIy2Vo2shZjLvR8TmKaTh7FtBcXhO2nZkBd+XHofFHLPmo6xA+3MXEaTxXFu2KxattQw1Ex8kNl6BaNzVF1seC/OgKBpzejHa1axCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9ja7Y2Lq38JJv7FEfsLxMW81cxKcEouuHD30z02rto=;
 b=YXqgAziHC0IUS0bT4EnN3nUyy6j38hFds2yHz0nCmujlqMg2OV+ccwB/MEJLgn/p3Wtdf4clkL3qbnPuA3AK0osCB7MoFpX427+GFlhvUZ7PS6uSp8wWlH6rZcZvMUaFZ9uxVBahHdqA8GzGTeTajFicTRq/GCKeLSXfIJR5E5ZZjQhbN75MGdEKXwIb3bCWo4MsWrHx2DOAORT14JCjyc9bzDtzxS1mw5lcNN7wKkpj+7hpQjKjUG/9ZgGbDJAldvg8/o2vuCyw6amVfuG/qeN0aC2d595X3ecHKDK0vIDDWyy3yEADqvrXrXegpq9tjwXTvEquIFTUEyVBc5yWsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9ja7Y2Lq38JJv7FEfsLxMW81cxKcEouuHD30z02rto=;
 b=HsrztZenj72D9LfGY2/7WDynKMax0PQ5POyHCqBCTqfXlvkI7lOMZDmcZD0tVWbf6rnsBI7JLMDr4GUdAB3CAw41Hc6ksY2evBbXQOR6ZwjnxNAXqmU3Dfm+O0Odn88fUAFIryM+8xio0j/EiQBWwtEYuiE7i0U7hocyID31o48=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11167.jpnprd01.prod.outlook.com (2603:1096:400:3f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 00:11:31 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 00:11:31 +0000
Message-ID: <877cu6f619.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz3yf631.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz3yf631.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC][PATCH 4/4] ASoC: fsl: imx-audmix: remove dummy
 dai_link->platform
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 21 Apr 2023 00:11:31 +0000
X-ClientProxiedBy: TYBP286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::27) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11167:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f84083c-4b68-4651-3cbd-08db41fcf5ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vAc4uOduYVdPpmJxxTxU2++ZfVk9X8pl9XDZkXy7/CbpBBIPFNmn/xCfo89AT7PiRgVvEiRM6tcwdJwb9NoERmr+vJBByTtG2jAB9rXqIwCbOpS6OA+c4V/F72m/zBcVr5se1TqQPrXnN5msl30CVuCiHQCMol9i+IlYYM/ZOhtCwlg8U07EQhPuVtY5w6hj5KvKAMkCDSVxcZYGplLxt8E6m+BrH52qA/UfazyF7y/dZdri1Clt1GGiQHZgGyxEy+mikO0iXoK2ZEkobDjDz57cLtfslwEQ0NtEF4fPnDZ3DJrwLA6Sk31PuHxBkhb3EW4qiIpMDfx/XUl+51Qfer3E8vMc7Tb5ldRWwq5MxUbXjikHp6Gf2z202obLPRWtGa0L7HHJzgyst9+Gp5e2UCj1mEJBHS/jCdL4zq2lHbPVl5hO/y5hNpHfiiCXQmUTaNcK3EiT+52dmCxQKRrYLZQ5/mUtaXfUG307IbrBvUsP7rxu8JPCXCYIaQAo00WlvU9fisOME3ada4KLx12n7kMw+BJExKEb15CoX8rLusR1CUi43ivdFYdkT767s5D5vPRPcegoE5Wupgmf9hJYm46FRMlVwC+Q0aS04ndlW2k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(451199021)(36756003)(2906002)(38100700002)(8936002)(8676002)(38350700002)(5660300002)(86362001)(6486002)(52116002)(6512007)(26005)(6506007)(54906003)(478600001)(2616005)(83380400001)(186003)(66476007)(66946007)(316002)(66556008)(41300700001)(4326008)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mYha1rS4kKUkhDfSbIseroG4vd0dj9ylGwsOX8IzUzorsD+5Rzjy2pyv6mnX?=
 =?us-ascii?Q?pUdvreB28wWuexw4aVB4PTnFz+DkScY1m69cWlBFCGm4dc4LXj3FYhKT8b+T?=
 =?us-ascii?Q?V8/K8DnhV9tY+q0H1rU9s6gNf9EOJSKxE58SOCftL7bdQgQ3JtWI5F3cPFZi?=
 =?us-ascii?Q?HjuIutsNjz+/fpLWIpQv3rwlu6x/lLonKVHsEZ+PPWQHc8pliky9Q4rsPmn5?=
 =?us-ascii?Q?tTNfXfmfKCqCS5dMvrGItSidemzdvXANU0D/XFQmro8Z3kRS9oQnbZRSf1Cm?=
 =?us-ascii?Q?z0zEJUu3e8pnAW0Cyiq2z7PDgd26itUDGcv+3ilkfWLBFJeCqTKEqO67C7x9?=
 =?us-ascii?Q?Ac/LjreNDwxw0qO2nmVsMNy/oo5VlLoAAKUg5eBc4s646CjG0AUTRKjLtsEY?=
 =?us-ascii?Q?9XHuBWE8v6O1qXu8t5r/SvNy/q/OTctN30p4UJagzxww9Mo6mmGtiKwK1vNd?=
 =?us-ascii?Q?NbcYq2dr4Wl7OIJnI3Cdv+6ddLH/29FTlnvE/fIDms2bxPRLk2+kaU2WGE2y?=
 =?us-ascii?Q?wES7zVyPlInsq4BAFIIRGUKDU7d3fYwKEwW6TS0vDcTwm8gDR6Eqsk6kr/fF?=
 =?us-ascii?Q?/8mSPkWzp/X+YjzUYjTXCT7Efsij3OJppUFx8oX+OjDbvJwhKFplOatuoogJ?=
 =?us-ascii?Q?Q2zlk9YTAeyRqzXwy+GIQsNTvN98InE1crH8CRWkDRugQg1TzfVOKdu2RbEc?=
 =?us-ascii?Q?zT67qiO4lRNU/6JpdMz24NcA8vjv+MDqF/Je9uoaeRapCY3/yZiEL4voFLME?=
 =?us-ascii?Q?2YsmoowK4fsjXILPFgPgyBh79pKjpT8oYerMxFnBpIYUOnVrpR73+i28kG56?=
 =?us-ascii?Q?Q8qcS0KHv5rMM+m82HTBIEAPM3+H2K7VvibBiOJD8iq4Kv5iswZgx/w0aioX?=
 =?us-ascii?Q?oqVDl4yFQEcTYIsoIj3Ivoq1Lvld0PZpUYxGZfizBIy5cD3c6mORW7BvH7iX?=
 =?us-ascii?Q?gMLbsKuMsgCmq5yWUo88vM+NXcVWF63i/9+QMw5pCbWlcurHrJETpQN2j4PS?=
 =?us-ascii?Q?HiRU9+25CnlcdRspuhY4n2aApASf/rXT99Pz9ParMaTwdE+Nvh1y8YRvxV4+?=
 =?us-ascii?Q?7BcT81aQhLoylhjEm4ntlEyYkffPfNN+Rjf4/bj8c2Di/AG7LnQTZeeWwUKh?=
 =?us-ascii?Q?nNxMewxiNT6mg0py+eLl9dczAHbsZTarb6s/S5VaZ5gfg5Qy+WU5iY01i7p2?=
 =?us-ascii?Q?YB43lpsfNXpOMboqQ8NlmCJ/QEj8jcsRVlKu0GaTMtzc7VF9zvoDyziYN/ob?=
 =?us-ascii?Q?V56LO+6igO4I8jkHpAGS8BrjGWZrfWJpp6GJWCdxNy7wYeArdJuwhwOgElVr?=
 =?us-ascii?Q?rb8muJAz27rLkR75htTUfSHUndAbukgJ3nfeT2qV9aiYkima503Apzq95cHL?=
 =?us-ascii?Q?uCMFvtKPeLrsqQ2gr1LMvk1JVmyU9uAlGJlmuaRBhe8ROEwssNQyU+wrdoTo?=
 =?us-ascii?Q?gnVgN+7awKDHVJZYittaM5sMZIRYo9phfsYpbNAIg8RzXAsi9Vnr/HhtTbK0?=
 =?us-ascii?Q?rsUyJokp5KzYfE6RGNPtdVTgrMbQtGf43HjrFAE5o7w22SSJJeJkCwVlkfT1?=
 =?us-ascii?Q?LaVXw6iA5MU8EtvUnHEsC6nUJMG5bd6hsALoPc10UwpwrtV1IfpuTMgrOxq4?=
 =?us-ascii?Q?EaQTrh97KrGyW+mLjNqx5qQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4f84083c-4b68-4651-3cbd-08db41fcf5ec
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 00:11:31.8230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GLM9Mm5crDos3+87LCLxSQia3ogX6SW6NbKHY5arism+0aiRF/3E6xNQRk3Zwq/gt3lbUgUA9O8dVR20+bEmWmj4SZ6/OBweBF3pOkVQ/GwvNRFFT5nuWaYvYzkLrmI8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11167
Message-ID-Hash: R7ZYXY4ASDT4MSVLXYVFZCDVRKRHF4DU
X-Message-ID-Hash: R7ZYXY4ASDT4MSVLXYVFZCDVRKRHF4DU
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R7ZYXY4ASDT4MSVLXYVFZCDVRKRHF4DU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dummy dai_link->platform is not needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/imx-audmix.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index cabef0de3891..b2c5aca92c6b 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -207,8 +207,8 @@ static int imx_audmix_probe(struct platform_device *pdev)
 	for (i = 0; i < num_dai; i++) {
 		struct snd_soc_dai_link_component *dlc;
 
-		/* for CPU/Codec x 2 + Platform */
-		dlc = devm_kcalloc(&pdev->dev, 5, sizeof(*dlc), GFP_KERNEL);
+		/* for CPU/Codec x 2 */
+		dlc = devm_kcalloc(&pdev->dev, 4, sizeof(*dlc), GFP_KERNEL);
 		if (!dlc)
 			return -ENOMEM;
 
@@ -272,18 +272,15 @@ static int imx_audmix_probe(struct platform_device *pdev)
 
 		priv->dai[num_dai + i].cpus	= &dlc[2];
 		priv->dai[num_dai + i].codecs	= &dlc[3];
-		priv->dai[num_dai + i].platforms = &dlc[4];
 
 		priv->dai[num_dai + i].num_cpus = 1;
 		priv->dai[num_dai + i].num_codecs = 1;
-		priv->dai[num_dai + i].num_platforms = 1;
 
 		priv->dai[num_dai + i].name = be_name;
 		priv->dai[num_dai + i].codecs->dai_name = "snd-soc-dummy-dai";
 		priv->dai[num_dai + i].codecs->name = "snd-soc-dummy";
 		priv->dai[num_dai + i].cpus->of_node = audmix_np;
 		priv->dai[num_dai + i].cpus->dai_name = be_name;
-		priv->dai[num_dai + i].platforms->name = "snd-soc-dummy";
 		priv->dai[num_dai + i].no_pcm = 1;
 		priv->dai[num_dai + i].dpcm_playback = 1;
 		priv->dai[num_dai + i].dpcm_capture  = 1;
-- 
2.25.1

