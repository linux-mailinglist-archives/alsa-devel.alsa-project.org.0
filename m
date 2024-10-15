Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A35899DB01
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2024 02:59:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02A3BE76;
	Tue, 15 Oct 2024 02:59:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02A3BE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728953952;
	bh=n7fERorHze2JmC+6AyjZBH0qej2nC8phi50bjVYRW4E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FxF9v+iLZLRmtnVH2NEkhUvoj5VjmJ8ciXt/nMkeyc70B95WdGwmpkh94hLV3K7oy
	 +VfnypdF66rhb/8q8h63R78CWe3/rkas8St0z8Z/kQ1lNIdArtMOfOltCycYtv1wzU
	 tZTXlzpXw8YpGQ0qtw9xMU+/pwZVLM0ZQAkgWWeY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4668F806B9; Tue, 15 Oct 2024 02:56:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E47F3F806B5;
	Tue, 15 Oct 2024 02:56:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADA98F806A8; Tue, 15 Oct 2024 02:56:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80F9FF80679
	for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2024 02:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80F9FF80679
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GsqiGFa6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhvQwWWTPp+xNnPEam0ZM+zGbCtWl5A2e7MVKbaJYb0J1ypVjFMD93r06r2L4f6Pf8buGUv1kX8XqA4mDRGlIjiTPUa9X3mbJK/DVhCilQR/bEKBoT6c+Ai1I7unCqHJRZaLWHehAnvVE8RYllrALm+DZzf0iRHqnDtRpiImQJB+Kk0VGhoh6hXObvc85gIVxROOCmblcgyDYiU9GizIytVPnMb9emChy1qYVjxWS8xx1X4VHCkO05eJcZN33+Bdyj0g2nsvrjpu9zi0RUqanAz9AWj26TlEkEviJXxGmK8eVwSQNckLLdCBHHWdUIe3X+znD0K7By7Phmgt0JI6Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQbtWGqjWwJrlbSHrPG6x4hwYFF+NyLgnSgjClQ7fyo=;
 b=KQiSRn1NlOBH9xwRUsrrZdBdpqwjj/ycdVs9EfMmnpT6DOQ9aWHb21elIKF0ODyi0eseYKROC5ja8CfF6wtQ6ck0q39UVN+uMTuVmG6vMC6qn7zXErNHExLXxsvKmiODUJRDzXOEZOvfFOIFreRGuY+YgQpE0UxT0GzFXNIzGhSW7SWgYCxEwKLoOIISbHr3I//GO4YS+brgv0c6GrXknr9D2rVvQH6JtiToKbj1F37wbWSTrK9Xg5oFZ6W9RW0R0T+zwnaKceKpeCBWAnqWAb5dEEeUU5L+667wXMgVQTkMfaYBTaWumB9eZtKr/8cpey3DXcx/dlz7BeaavaSN9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQbtWGqjWwJrlbSHrPG6x4hwYFF+NyLgnSgjClQ7fyo=;
 b=GsqiGFa67sM7lgLfKUB4qCTPmmjt+0ceQZrk0ILD+ezat3UhUvzfsiSOJmNJ4a2oXPpkzqslR2MtwCDr/wMb5v79UUdEY4je0LzUshSiKdOjJXMqJ5x8lagU+u94zmwRrKMDZTpL4T51Jk6/X2+YrIXoteUr7nWEXc+I8XBR2Xw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB6130.jpnprd01.prod.outlook.com
 (2603:1096:604:cb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 00:56:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 00:56:25 +0000
Message-ID: <87ed4iqj46.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 07/13] ASoC: soc-core: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
References: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Oct 2024 00:56:25 +0000
X-ClientProxiedBy: TYCPR01CA0141.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 4061ec9d-8d92-4280-87d3-08dcecb43206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eYj8NXfHa/6aauG958IZf0C3IzBN9gJhn3u1xyu+xA5+kmymyhZoWcfJgdyA?=
 =?us-ascii?Q?gmuNt6+/+SCtdxh1FOtu7YfxGKAiCEB5o98y1mu6NgNbtZY0ukhK1VCzp8ed?=
 =?us-ascii?Q?rsW9zxwQxsfUxLmgBHC+7ooXQkfYAuJNhmJMOWJUohOAEPdLsKaD5n4qriFj?=
 =?us-ascii?Q?zAjYLQmZLk+reT45Xh0EmCwzVupHbXvhycTFWXQbhRyIrZpFKv4r4lctTh6k?=
 =?us-ascii?Q?9BAIXNFad7P/fzZH+iksxtHSrRNSFF+9gjas2WYCpuxomWnlSvSuQU9tbZ5C?=
 =?us-ascii?Q?9qcxS+nhe68Ei6eXzs7OeamTHzXF00qbDL9TwJ6PQB4g+7JTH3/ubP5rQn1T?=
 =?us-ascii?Q?UWVDPHFFzkhbI1yjC+8y65UpKEgulttLa+381Z1zHcpOoS4IK9ucBZCcGbKI?=
 =?us-ascii?Q?cChNwsu7a3BVu/GUzgMdaJWLzj+zZCC90qm+sAZ8LZwtI+K0bt3Y+hCiPvPw?=
 =?us-ascii?Q?o5eVkjZEynD3SQlTKjdjpkC9+zSWu/GWCBkAJkR/DxAjRfigN07yi1d5A7t9?=
 =?us-ascii?Q?m3CTpp6Y6ugabaK9rdftkX5RjSYvL8lRE/w2OBWjkYhNUrn1IAuGx40Jwz/V?=
 =?us-ascii?Q?gLQUgchZ1pH2aN0QbLKZvsNUag5Qy9KhvmjX1Ba93RgS8iV6U7Xrkz6KXD+M?=
 =?us-ascii?Q?uGvvK694tGXA1pDuLG/8ZtR55JYOXdTfHE0FH37RoN7P7arhkHhHXOj8rGJx?=
 =?us-ascii?Q?CSxvo2eMFvqcDmZeis1UMJJt4QrZ0SMgatt4mOZKUjoiUT0lxOww3/tj8Viw?=
 =?us-ascii?Q?NSOrZYLkJyXrtCT/maBPBp3u9YaF0W1I3hrExdkkIuAEbGJ6iYKVsc+LJLkG?=
 =?us-ascii?Q?zzc0Cf0LuAdWblnFLHuDj8VfbuQdN55Llati8Jp10emEifSYTkd06Exej8wL?=
 =?us-ascii?Q?Z0HrGru+WPf5K7j8yVLoShQDrvHQBbaS5H3HZ5FXb70HOds+PgM1EghUMDOX?=
 =?us-ascii?Q?NEaYUXlBc/QRU0tkXd92xoMUXeN+Sk4v5z4vJAqG0H2vkwnukOUHkmHsBm1o?=
 =?us-ascii?Q?HXZHaZMZm4jbo8GObusFmasxNoa6QqtiTCfL4QwoJqjf3IO108mZDXl2AThx?=
 =?us-ascii?Q?4x+9nYxRvK9iozNijkFki1nMmlK5PZ58MUfImbi2eMrdNxCDAg03WJZTK/OC?=
 =?us-ascii?Q?PNzSbY8kS/X6optlmrTic342qb/1zpF34Tk6Ll4efJVob+DjUEiJyQpN9Pt/?=
 =?us-ascii?Q?6rK7bOU4xNi8yjf23j+8wk0K0nVliRBilpAMp63u5aQTrMmvcasdYDXbyMNA?=
 =?us-ascii?Q?nbRYonfNtClspg3Gcd0VNDH62IY0wLX0qYi4U3cwiJaETggUy/deAvFwYNlS?=
 =?us-ascii?Q?D+U2VIGvtt4G6CzAaJYwnwSLSF0gF+lgCYOGY+zaaDTx6A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g06bJDR5DQACKsE/0FG3t0kN9LS5rZ875vU69X6SGBlS5Dd4tJYRavwKxCRU?=
 =?us-ascii?Q?TGTf9AaeJC/Zvvtalw+WOM5bOYMuXXGQcF+mBqbTyvqbiZzo+GfCW23+5g+w?=
 =?us-ascii?Q?LvC402O6ckWxhMlbMCvKuVmy5Wrt1ix1bCXw1o9jDfUKJt8UOo+8T1MMCAcb?=
 =?us-ascii?Q?r4PMtPahjcQbbw5FQscttSBmdDfKst8YUpuvBN68QLRbY0GWF4MktgpA6Yrk?=
 =?us-ascii?Q?OWfnt/ceydyxG1/DuD/9v9CnctnleVOBNrvXJow6jAPjSqZNFlkne3XJubpT?=
 =?us-ascii?Q?okPUVGVAGduI/QYUUEbQG9vFq/Nvi1QdjjhFf3RZa+eMGRHe78Mv6b2tgRqC?=
 =?us-ascii?Q?fMqC6kvq9BzDJ0TcjxO6hSOzJc/389w19skjyV/1uUuw6pL0IZKDfUWIY081?=
 =?us-ascii?Q?bFSbmxT92NqaFet9RxLIhrcMV7FG2AxxRjdZDgltzPmB+hFw35fkkUnCNFOE?=
 =?us-ascii?Q?QtMzB7gQ38dZ7HjFfXu3hLnd+I8vqeeXaYl48gIRnAgEbuyIR48CaAqw3zNS?=
 =?us-ascii?Q?4iCiFxwyLeTxj7U05dfGgOPCtu06knnyo/EJiM8Pyhux8MhdB2ZX6nDYgOUw?=
 =?us-ascii?Q?hTF6k5GMfcieVNXnf6SLFJAhx3zt6CF/CsHhAIfJDNZ05YLAzARoU3D5rQ+M?=
 =?us-ascii?Q?dkvlJMcdqByA5qfxFAunRVJ+xr6MyGGHIy2VFun/t9+dmxP+GEKswFnM6BYr?=
 =?us-ascii?Q?tn7ZxUwjJXNGGRxGiNT6ZTYsexT8pIZcUdL3hbqr58scbHFLTWqXNksxRMQp?=
 =?us-ascii?Q?AdrS+zhoWKwJ1LwyKoqsCFZ5Qozuhkl3zdImMPkdtnUjWnfZVpLQmMC8M7Ai?=
 =?us-ascii?Q?gB7fXvnN14VM9d623Vd3DUUI+DAeWU615jA1SC9qI3kA7ChSf+18nKXjyfZ1?=
 =?us-ascii?Q?EytZJlF94GCSUJjsvgiRn6StnWyFwjg1//Za6NmCwv9NFD5UN6fhsBsyFdrM?=
 =?us-ascii?Q?YZw9gQW9INhsIxQsOQRZp8krLvUmFd76QsGSubGiZhiXFv/afPgisC6pANLD?=
 =?us-ascii?Q?Zb3nm/sJ8aH4eiUkr8DAmQuhoxE0UqGXRv6Z6agXVDJNdTgT2oMF63cyW0ZR?=
 =?us-ascii?Q?ERGcKepPjAQLFzXX67Eo8PDLY5Y2RI2oz7y0S+PxZOw4NehhTtxK+0Tln7oi?=
 =?us-ascii?Q?6BF7DhZYbSbaB6dsMN4YxkrCfI8byicQ9Enk4h0XtxgP5vZhMNPkHJ8ixuKB?=
 =?us-ascii?Q?pxww0Kdn0QobyCBC3/rkkf+0PlrXVuQdB8nnqCduIGkvrhwfZwIslQGSQBAf?=
 =?us-ascii?Q?8J63aezpS0R7JbM+7HC3BAIjpr6sUkZFA/TM8pFSkozI5PPGPar6bh+vvOKV?=
 =?us-ascii?Q?wWVAZLuevk6RzvtEUDwFk6U+pWR2mGXw6zGUOx1RmR7BOAzu84v/snfll2tv?=
 =?us-ascii?Q?aI1WIsEGw4CEH+BkhfqMErxNMpXVW4PDt4Kt+YUiSixIjpS7UVgG9+TZP5Dm?=
 =?us-ascii?Q?zuPR4RViPmhGvE3B64ivdTg027JEJl0U0UmCojQf3uY/0oLG+g3LYRNvIRAi?=
 =?us-ascii?Q?S49CzjdD9bxj8v/WHrzsmhRIoHDPejChfINBOWkVCBA3tAyaIkKJz+cm2PLE?=
 =?us-ascii?Q?ESC8lM8plEyAjP0kDo+OIyl6XkUHdpDIvGiPgkIcYr2Kw7ulkP3Yn+7CqfHO?=
 =?us-ascii?Q?DgIVJMS/ZNo89uL5fZJeGVY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4061ec9d-8d92-4280-87d3-08dcecb43206
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 00:56:25.7980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 USYC9GJghgIIUM7uDKDmKXxN3F2NlcUgzdjGXpEEwsKYUaXrgf5oDODNixL9gHpeB9oEZwxybw6bQf0QsxETz8TPWhGtPIUt1Sb/uZaaeLNSaowfxV0oOilfxzz2Y4H2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6130
Message-ID-Hash: 37QLP5BNCRYPBFZKVVBI4NAFHPA2NLIW
X-Message-ID-Hash: 37QLP5BNCRYPBFZKVVBI4NAFHPA2NLIW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37QLP5BNCRYPBFZKVVBI4NAFHPA2NLIW/>
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
 sound/soc/soc-core.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 20248a29d1674..f04b671ce33ea 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1999,25 +1999,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 				dai_link->platforms->name = component->name;
 
 			/* convert non BE into BE */
-			if (!dai_link->no_pcm) {
-				dai_link->no_pcm = 1;
-
-				if (dai_link->dpcm_playback)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_playback=1\n",
-						 dai_link->name);
-				if (dai_link->dpcm_capture)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_capture=1\n",
-						 dai_link->name);
-
-				/* convert normal link into DPCM one */
-				if (!(dai_link->dpcm_playback ||
-				      dai_link->dpcm_capture)) {
-					dai_link->dpcm_playback = !dai_link->capture_only;
-					dai_link->dpcm_capture = !dai_link->playback_only;
-				}
-			}
+			dai_link->no_pcm = 1;
 
 			/*
 			 * override any BE fixups
-- 
2.43.0

