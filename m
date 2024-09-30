Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BBB989924
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 04:15:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9336D14FD;
	Mon, 30 Sep 2024 04:15:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9336D14FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727662511;
	bh=GgGhujaI0woWlgYqdJG4tJyAc+dIuukpTkAfJ3dobUU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KjM9N58zPs/0CFcBMmuEqq79+7byHD3yOH47ysXTaVCaLAe0LLjO5OMiVfj+IPF/g
	 /SwM+SSOWpvq03e2nts/HyDFdYQWuC63Zef1lqTWgY5ApvOYehUn+wnBBuLggAhCph
	 DSY6JZoxEPPyoi8+vkXTAvT4mLD3/uXaR8y2YGqo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 790F9F80601; Mon, 30 Sep 2024 04:14:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DEA4F8062D;
	Mon, 30 Sep 2024 04:14:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7DF9F805EA; Mon, 30 Sep 2024 04:14:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C63EEF805E9
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 04:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C63EEF805E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=V7o7REzA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJm6Je0T99gDPy4ilu3etum/L52WpKoTwgvIfNfyG7kXBxNnA4T/zHpVSc66vkCsjYu9R3TCr/Z4DdT3adzLDgD1xXVNO0a8QHRMRNMTtdrlJkFoOfyBDnyQO5P8oSCqYH0KnctQnSNhwQxhs4ozTIjttfaI/ZXqD83eJQ6R1uM512ANbCRIIU7NQl/0nUx6k2jV2V4nADk0LzV55qGhnObaW+hX67BymFeFHlwNXYSmDg3scLtxGptlqZNfKJsYKsER+vWvPu1sZzkTC5P2ppNnJKjB5/zDgOtofuwrI2eSa5Js44FjNgw6Hc/+nvq+i+HPJUWa6XKJ98NUBrR2Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZAxs4yzTaa6Dg7lirfzVAAaYESTfbXLM12N5GBpcfg=;
 b=vysd1v2QLTGTKui57eE4PQZZWwbQfnzTgawMgFkx71y3AASYJgUc2lvtUndl8BHJGyX5wYOogVom9MuQ8XqYrRsVm6kcThu01q+E0j301oC2cOwmoBZpfNdnJub6hZbfRjmNs+D0Gh52cBdehtI9DJKYRfSp1JrCrDKHUMek/D8rnGiItznZ8bTAj5BwtoqwvGVjH6jOIolZ40cxqGfWgb1ljwAuygCnhzUXDJOuuD4/lvBg8tNdsY7B86ShozBrSefJ81i0AqB6V7KPa8LsGFYSW+3QpjiYwvC8t7zklN/mJ1gOYnAx2LmYbMC8l/Onec8qVToIeZpaDE1vRuMvxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZAxs4yzTaa6Dg7lirfzVAAaYESTfbXLM12N5GBpcfg=;
 b=V7o7REzA28k7JtEtv12XD6kmSAS1ezK3sQJwOqcuugAMd1N8F+SMPQfRYjOsvyUx/LEyKqidpKaec0GNLCXkeVbsScLeYO9+2YHrlINKyY/CEe3kwEe1saWtNmLLZXYM+NJ5bBLQbFxHMK58b0ZujFPY5PpNEPTn9DDyDJOLaxM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8143.jpnprd01.prod.outlook.com
 (2603:1096:400:104::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 02:13:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 02:13:58 +0000
Message-ID: <87msjplwgp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 03/13] ASoC: sof: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 30 Sep 2024 02:13:58 +0000
X-ClientProxiedBy: TYWPR01CA0029.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c1d7c9b-a063-4a3a-1207-08dce0f58b42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DCLJyD95mlPZSyJhh/hOcRSF/C1CUj2g5NL04isaQKCvXRP/oSBSfcSWeEJK?=
 =?us-ascii?Q?yTyqZIYhFeS1s4nE40oVeFFEtXF/P2+2VCJ78A3ugrXIxy6KCUilK9vNKrhv?=
 =?us-ascii?Q?+MJ97KVOy5GHEMx5NK3LitQPH3TWeeQ0K+55hRNVx1Dk5mzsp5OO4wDLaa5C?=
 =?us-ascii?Q?uUp26ND1cC5wrqozbHW+FdW6EZvd9oy1Y/onhUIyjeFRmpsw8u8AATRCp5YP?=
 =?us-ascii?Q?13Sd9X5Bu2ubsdI91IGkrVRRl1xqnF8X5b5Td/JWQOtfbVpp3AJuc/Z8r7Nh?=
 =?us-ascii?Q?zI7DEfkJx7vAW377LO0gdPIYCp6Ea0lFFJPTMDVLBNBjkiVk9KJTbg6GGnpZ?=
 =?us-ascii?Q?rTMKClgYoxQMK9QR9ClTQys1QaVUU12XL8+A1ZrpfnqPdU6N9i96z78hVeyF?=
 =?us-ascii?Q?gnj+FlNReDcqkfgTZdCI6aunCqC05xjZ8eWAj7MxsyeAcAwSCNrJ3zzeL9a+?=
 =?us-ascii?Q?nmsMBuccZ43yp48knb+ZPHQiIdq1KsJMhsvTzH8u0yi81zItfcay4DGjJMbP?=
 =?us-ascii?Q?JYOtm2CQ9K7v/CbBeZgl4V5tRlIqgPAgvjn/Rl3tOC6lOYlumtwA1je1zkka?=
 =?us-ascii?Q?ncWGeGzz1vrltjZ62nKmkpRPDN5aarRl9RtVPoe/Aqcqq9DvxjpTKj9KVJpM?=
 =?us-ascii?Q?3UCeHSExhlSgaifGGzsuxbNRNdnBQ08h/t5Ej9NAn7j/pDI1bvc+WF52+Pew?=
 =?us-ascii?Q?lPkUlW+ffqFh/KBft8sCRtjR2a4JhUfTa+3eb1vS4LpKFde9N+6UXvDCaWPx?=
 =?us-ascii?Q?j18Ea15mNuB+mYi2mwkpo11Ml8PnqqPAg0HD4pI4kV05X083/r0j9NH/HHcf?=
 =?us-ascii?Q?B73BaNd8Nol7vu/+vSi44lDo5shQ2PnsPFVGYTc/2uoBT4bm4nMNfSNW1eee?=
 =?us-ascii?Q?ZhCmhj1ESuX6AoHKA9xpijO/OPv0MWTt+aej3012B1PZMtPB+PpzkJQinRvi?=
 =?us-ascii?Q?W4tjW0HJMWNnn6r3P76OBeAuKR3dpbWYeTtJQLDB9Vuv8XNaYzXHSQzGjA1C?=
 =?us-ascii?Q?mstoS8oRY/EYYy26j8MV0ut2squCQc7SSj7MVktS955CKgcO1iXgcOuTSZAN?=
 =?us-ascii?Q?taY3LYyEG++WhvzArsSVLJamO8uiOFCbxYHmAIeOEh8yUERbpLSEYh+17ccg?=
 =?us-ascii?Q?RlDifvx+OEa8Q7FVPcxMIQ9WqSCBfBSu1Rb/Pu0DayhBHyMhGoAVD+R8hLMp?=
 =?us-ascii?Q?LZ36+Dm8hFbx1r7Xyn0eiI2R4uGPl2jDKFO4BilI8bYvLg6+Z8Fy84U/p3YT?=
 =?us-ascii?Q?Q6ZS7YMndZJsYK6V+945btL4UxdWdZA++dX8EZ/QhYu1Lu2oId5IRHDy3ySw?=
 =?us-ascii?Q?TTqJZWFOo50Y6hOhJnUGz+H0y2HY38ACHlYcGUjIyDf+u1IX7naQMNIFVdD9?=
 =?us-ascii?Q?PCn1eOw5H73fT8GB/9v6XysrVWTunW1ujoLJgclW3el3YFnQyg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Pf/mXcGTKvsBNrGZfym5jGN7iAsArIhF9DfdaO3qFO4Ahxeu3tICJ3D7QRv3?=
 =?us-ascii?Q?kst5kvvDuPmwO16tj+mJTdk2rzqHmr5CpWLltaagnFyNeBqz5owmhQVA3Zb5?=
 =?us-ascii?Q?2bmMkCYuBK/e3us5tRgIoa+lzrJCJSP2kLSPyhVfiugNC+bwPDfIvHTTsJbk?=
 =?us-ascii?Q?p4csrI60i+Ntb2mquYjX9un9dyy769hb37milwEokRtuJqTurM5dmmcqkwUQ?=
 =?us-ascii?Q?sx2pf8hvxLDbPJ1D6i+7pRQZ0a7MpqDgVm1LM9GZj+PuyjFM/ZieAZypjqh4?=
 =?us-ascii?Q?lEfkDPUSlND24cbJtzvVLTE/q+ovHstoYsPDagpJHuUE31Utax9np9rWbYYU?=
 =?us-ascii?Q?RLDE2OWtdkcmexd+We+2aa86ikxYpJiVd49L1NB5VUXONV/3/Gzw0ogMKxYv?=
 =?us-ascii?Q?nVCyURfJTMI63FDnEvydkS/iULkUq8igPxtk9Ye4IamLSqG77Z8uUpQFfYIt?=
 =?us-ascii?Q?k2V67l1oaBDP6obGDVYWCxlydu3IrvpiNJO7tuwDhvXIAnUwWzwWrQtClKRx?=
 =?us-ascii?Q?wFHeBKH8oXoLvEqYWIWCP8aPglLUT6wWvf7ID+cXGrxyd8DgXa/JjELBtr6d?=
 =?us-ascii?Q?PZYnjdJtvyC5CDNKVmeK+B8S6CAb0+hEPRRVSX2Bl7Cm/ZqF4LwW9OTjVMOY?=
 =?us-ascii?Q?IUGZmVXUpK/y7zFT1u3tFHodard2hErdFM2++zUlXFz+mdiJj2hbQRG/XXRD?=
 =?us-ascii?Q?YSLCi5prowuqQL0/C7FSkvTGyeelDia4F6pynqNIC6Pn+vSPPyUtIWINu7kL?=
 =?us-ascii?Q?MuSq7HIFdL3hDt4vcZL+E/Fj/zrYtMZE9PvU24SFpPoCpqNpUv11xQSLfP4n?=
 =?us-ascii?Q?dsYKGTG2Hl5AuIQ6nkChtbSxXd0kBnXfWYUotBw/YL6OuZZQptdgrmvkyL5+?=
 =?us-ascii?Q?w+0p5WGpI08aOGvv57DpBTb/bdMY5KhZTpgoiJywTyhwDfRYddK4MwYmSbra?=
 =?us-ascii?Q?CujLv1W1U5o5Pep7i5NxBmN/xRQb0wRuW4To/EiGDpXkuLviku+WpFZUnagn?=
 =?us-ascii?Q?SVJt4zCOTJSMN63xF5Jc86Sk5/wdSRwcFUPnezmvGvnGZu6Hd/BRo7tWxiTC?=
 =?us-ascii?Q?9H2YDHC6Ho0BYdzipy9uKN7AgA58DPEtPK50P0dV0xEjsmUMCIAuWW9egAXW?=
 =?us-ascii?Q?8yX/aHQwsS5PmU6z4IQjLfAkP2F6dxclv+xwOhSUJNQY+PMN4qlpZVFybCrC?=
 =?us-ascii?Q?QmQtW4zxCVv34Qn9eM6v02oBNVKz3w+WOC0FQNuKIsZlLW5vYRcDZ9ioEyVb?=
 =?us-ascii?Q?K29BviSM+vHVgTxYARxT2lU7CNodWpUQO9Gnn4Ucxf1xZscnJH16V07hZFIy?=
 =?us-ascii?Q?51pt2xHaZgowV1gIKYJT7Jv6yAFIY9hbGj8MRW5LHzwBPL4Vgunh5f6lZyfJ?=
 =?us-ascii?Q?NhnWia1TL+0/5quuKnKtDZlJly0KwS83wqKkz/WCNFJdhm4imfVTBJU94/n5?=
 =?us-ascii?Q?QaNl5ntwO3u7hO4L3B6md4Ce0TQOoFhkkcKCS5b9T4fHEvfEXXVecxrd0lDN?=
 =?us-ascii?Q?gz9VpoQHQA1CZYoIapN17vUM0Comqnctk5Mdu+A4PIbglCD6jDNs4Iky0gER?=
 =?us-ascii?Q?CMBwJ+XspwjG5O2w3MN3UTos+RdrR/qbp+zhBL8BFSEScARj/xrCxFG12fpj?=
 =?us-ascii?Q?C4hAkWEu0HC6Z78vXAK9s/U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0c1d7c9b-a063-4a3a-1207-08dce0f58b42
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 02:13:58.8454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BqvIx6E0UBOo82dqucfSXwY2lSRuPi23FWYGGOrsrycFThfFKTSeQglrDBYb6bHzMYiOSI1670xpRjsTxnMc/2PRsuxZ2A29NKf9W/oj8sRrmOcs+prVfqKlfgNHCVD6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8143
Message-ID-Hash: KOLNAQOUVHMR34MR2YHRK4ZUDA2LSPZT
X-Message-ID-Hash: KOLNAQOUVHMR34MR2YHRK4ZUDA2LSPZT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KOLNAQOUVHMR34MR2YHRK4ZUDA2LSPZT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/nocodec.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index b12b3d865ae30..c0c906a78ebae 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -55,10 +55,9 @@ static int sof_nocodec_bes_setup(struct device *dev,
 		links[i].no_pcm = 1;
 		links[i].cpus->dai_name = drv[i].name;
 		links[i].platforms->name = dev_name(dev->parent);
-		if (drv[i].playback.channels_min)
-			links[i].dpcm_playback = 1;
-		if (drv[i].capture.channels_min)
-			links[i].dpcm_capture = 1;
+
+		links[i].playback_only =  drv[i].playback.channels_min && !drv[i].capture.channels_min;
+		links[i].capture_only  = !drv[i].playback.channels_min &&  drv[i].capture.channels_min;
 
 		links[i].be_hw_params_fixup = sof_pcm_dai_link_fixup;
 	}
-- 
2.43.0

