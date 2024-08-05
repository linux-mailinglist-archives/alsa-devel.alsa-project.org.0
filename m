Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4871C9472CA
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:03:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A08D5795;
	Mon,  5 Aug 2024 03:00:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A08D5795
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819624;
	bh=dtDxKYXzaihL07zyBf0CI5eVsPGd9MgBvDVOdQKRi/g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MpFbUWDM/CyUrqeUEPwKz6Vldun/WdHz80YLV82tBY/3v7rfUaTXa2eK7PYIFghJs
	 jpkmKRXmZSRhC4kBrBRGBLXfP/yoV4PpoEP+WNEgwzaesOJbzL4OG8XYDtvu+1jSLx
	 HEHg5tGApbQzkg0Ne5DWgbgG+xjPkp6VjZVdvSWQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B163F806FA; Mon,  5 Aug 2024 02:42:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B142DF80787;
	Mon,  5 Aug 2024 02:42:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 160CCF806ED; Mon,  5 Aug 2024 02:42:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEE3BF80580
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:42:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEE3BF80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VhrSM1sC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtC07e+6QloRzbc+PxGIwigQirH7AdOg8D3Ht6bTnLltMuhtDPlSe+p21CJnHA0FXXVihbcB25sxR1c1yFQMQo/mSbgcXJVJMsk2fQp4G93zhOI8XzyFr5ThcVE/wlU+Q2G3UNgCujHuHDunJAyJxQp7Qy/zvWrIIH7Vs4C9qpIKIeyFmbcFKFeRpCtD1+a61iupQiyJBWmAzcnTmhY+hXxyWTzPLM8WvStwPMazvhXS5cSzR80UULxLafos4+Ag0x4u7hdvbKMmgoHAMN4af2R9dHEUKXaYXtWIHO5sVaq3VPv742yt1EVSZWZG9aleewfMMwjecnY6pXiVPG95DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aF+P81Oto2g4Ejdeqj2vWGlqxdj4i0+OPE7KNSz9NwE=;
 b=KOZ1dz1/C9B/7yEVGKiHJ2AxFhwXZ9lT8KxklaSisqvW/c2BeFJfHGHgCYvy1IOiEcMRQoyhrtAGEacthKGTgMCxUh8Zo52E33kwHRAvljLaCFouqJqF/QTsCQbsMPx3rh6PQdniKeD3valYNiQmYQCQCARy+TD4V4Qv6wUns9OP+TkquH+FhCKzUnAV64IkwVyxyStzflbBFeFTiybnM3bl/baMmWac0fVl3lqBPg/KAFmcy//dmdzfHTMHoVrxm5LxjCrblA/9KffdTMJUZ5xMiq8ghzbNUEF/CmxRTs4BHGcXc1GkK1hoip4EbyKkd2jVo491moOGJXN861Rm6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aF+P81Oto2g4Ejdeqj2vWGlqxdj4i0+OPE7KNSz9NwE=;
 b=VhrSM1sC1KZ6K+ACrOBQc1iBMCq7BeDon2jMDBsTEF1wMOREaK51IKcbbAIrCkd26eWZy6FISId1txOHCtcOiWLVUhKpW/q3Mxo6dXnNU+czPsuWF8VrS7TA7Ya1x1RWKP2HZ68pH0uZwyXfMH0t5FucyHyDYeCd84Kn2k6QMwY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8678.jpnprd01.prod.outlook.com
 (2603:1096:400:15a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:42:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:41:59 +0000
Message-ID: <87y15bx0kp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 079/113] ASoC: codecs: ak46xx: use
 snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:41:58 +0000
X-ClientProxiedBy: TYCP286CA0340.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6d85b1-7728-4b09-cd8a-08dcb4e76a24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7U3QtWjGcbKvs86ZzMh7LLOIxrQanDFpbv4AQER9smEHoW7R1lcf/zL2kXvA?=
 =?us-ascii?Q?uAqgZHf+zF9GnwMv8EbXdhlkLGeYJModKlfJ7DiNKDEtzrt+8q+qzJZw6rWx?=
 =?us-ascii?Q?RKr3tDi7HmmKuW+1oAAAkl8z6L1/Sr7MZCBXvju01cyyVuzvuxHwdtqgtVY1?=
 =?us-ascii?Q?2+qDz/PPpnlJaXRx1XzTgwP71gaqZZCSIJ2Fk6hzF0ve2tjJ4DtrMV/8RVK7?=
 =?us-ascii?Q?yDFb60qpj/PtoagYsJmxX6lfTi+Ve0ffKLhPY+eIKNAfdE8mmQ2NJvrHeTfz?=
 =?us-ascii?Q?E9B/1jHmsfCaa8a1jJCqBH0+1B/C3PQKjU9d5YIlMEdopiP5P/C4uekIlJpE?=
 =?us-ascii?Q?HcWuw4s7jfslYgT7HTlyuOoVud66XC9RUnKy/FqBOPgIc2Aau8ubjeo4/k2r?=
 =?us-ascii?Q?dLxP8zQNLDOkYhi8A1+v6mRaj1WD0pMiX5zu0MZVHa0sV+plUtFkYy0aUELz?=
 =?us-ascii?Q?ibICf4XdQHFY/01zxqxmigieSocA9r5IgvAbI/8yGULytdMK++Y3UguX+2FP?=
 =?us-ascii?Q?4tSoCRd2DmwC0/lM7yCQyRXwyfUVH7/LW4N7N0RXvgCcRcl5uMIVoz/W/sch?=
 =?us-ascii?Q?3eIhWOwDIVtXeVJiW6BezOsloryDFnl8iyrHXUHcB8mT4xWgwUIqXjUno1JJ?=
 =?us-ascii?Q?e8z0CgO4V8Kxfw84kHeoucpcCkCSuWW7digVMca2+wix5Vz051HOOWcsHYCM?=
 =?us-ascii?Q?PWTbfX9YhfgfIh0tSvoZ9naz6mG/01S2+CbG1xng30NAkzFOtxDzvUyoUOa8?=
 =?us-ascii?Q?cTd8ncnVE4i6EeNC9wMgQTjP03N12xDAu8lxNCzpnQhzNx5muTwHOR7+nIF2?=
 =?us-ascii?Q?mOEdTuDuOolsM1w3yW+ap3KYR19+pgvzKbLpWqTZZFECPgyBJaHA+nwqhZgC?=
 =?us-ascii?Q?XHHrWcaBVhqeTtKfxs1BBUSPKeGc9kByKtOmDmHxtmsjtUxictx65UY/S1Y7?=
 =?us-ascii?Q?IHdqTNdp5NV6tEfCmRkSB+lyyMhQo+Xomu8ggKG1S2T2RZZeQjTah886cFdF?=
 =?us-ascii?Q?yaBMLIHFIccKUUD46HyV2PotrWfnpQD4GnhuKEtFC2j5TMxkKiZSTDMH5vIY?=
 =?us-ascii?Q?QXDz5LJ5gxhCqix1V9cZpJ2BjiqBudurTxGjAbvQOJvvK3ywlyegzdmoPt18?=
 =?us-ascii?Q?ECFoWOFaFsA7TxO9ephWvxyvME6JtSuS/G2/ccrjhN7Kq3yMUk97Ab8RJAox?=
 =?us-ascii?Q?tIH3tbIjRFcZLnmg32R3GK69xeT5mSISLDSF9r0CDdax3QoeJeYH03ioY8W2?=
 =?us-ascii?Q?ubaDN+0OCNa6cvpxZepE1jBS00JC3iHER9no8cPJ84/NSoOCVMdzNdL2kgfa?=
 =?us-ascii?Q?r8Ai9W0wXqyPIRcbIDZxlY1oBalO9PcqMRJTg4dtFXGv9HITf+BGCvmIZaJL?=
 =?us-ascii?Q?wpJv36FIv9ZK3ICunSztbEMjUlf8J/u0KAkWhG+dfI4tOq3FMw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jLc7e0z1bLMhvWj1WkmDd1Z3VPCsoLXMsAXes0pMekLJasxVJwOpeaGdXmg4?=
 =?us-ascii?Q?TUFsu1Z7g7QNJ2liifG06cxDDOAaZw0m/4yZki97Ib/ywFx+EHFZE4a2KviW?=
 =?us-ascii?Q?0JF7oAFuYt39MIqDycn8hgiyEF4JcZcXFQk/JHGZE4I/dDf+ylecI4Pz/Taz?=
 =?us-ascii?Q?1ffoc2hUEHrxC/nKLFSPUgRYXXLCo/GDU1AFWBRRZDpMGJCpeQt0M/rkilqi?=
 =?us-ascii?Q?H7ZwfP9loukjV1x9cUwfIHIlOTIJ1jfK/BxhdNZZ1oDwpxZRFeovOIEIaWCU?=
 =?us-ascii?Q?Ab9sqQ2n74yFSUj47Se8RAKkbgKkolSntZD7ouWC+PgZ3lWV8T1ywXQmwtTM?=
 =?us-ascii?Q?VlNlHQDP0GYALrHgm8kgfTokL1Wl/oqBn701Bm5ehid4GjY84lxPTftEVbX3?=
 =?us-ascii?Q?JogGTHiwktPbaS3YKKtA43XH6JkTmEQXOPZlY+/O/f2XxVWNN9sbjMY5Orcv?=
 =?us-ascii?Q?aIOgWyadCIxO1P/EiWH6fqSLMnJQ06CDzh0WH8l6y58YKvncBe7oc0Fp+NfL?=
 =?us-ascii?Q?omA2bmI9uE+eOMEURs8+UeAae4Dgn6LPQVM9lTnJyQrF+0Ni3uMcapFVF7Yq?=
 =?us-ascii?Q?qt4qKfLj761Gb5AcAF83HpE0kgr6BcFQUfyvmfPllcXes4PISCGl00l178Xj?=
 =?us-ascii?Q?s6K7GbhLH0B+tgVUuM92crtdEu5SkSu/kryZLNjcdje1LiXQHOiuDMrYkFMf?=
 =?us-ascii?Q?rF9lPA9waKZIk2STYBdIVWs0RbEHO7m3ti/4XZAdbGX6itUts/53qEgWfjv8?=
 =?us-ascii?Q?wwVapbbst8OfJTWhiPtTtHF7Ia2yAJAGB8MLBqUNDCZvCVHut94jIETtkDns?=
 =?us-ascii?Q?GMwcTeoblNqLwmYB3vYG4/02kCbHxY0ZeF9g3igRv7k2OWL992AEvD33P8vz?=
 =?us-ascii?Q?uI87bpRze0fcVjA3Olb7wsZY8A2AWpCZ2b1o0iR+9TSK3nnzIIxOteWCNoWi?=
 =?us-ascii?Q?lF6ywBzK/I2g9H119tCFVJgzWg3sIv6xemb60k4tzzuktS9QDbvwV8u67beW?=
 =?us-ascii?Q?jkDEBfiTh5co10k2lmUjlqap1avwN9E9XVeGGeuwDsu6dh27nDN6k5ni47Bc?=
 =?us-ascii?Q?E2YrEc7rA7lJ2IYaj/hFxtPoCXs+4bTIxxPEC9ljWWCP08sgENn3mmiXD6JE?=
 =?us-ascii?Q?DHZJ9epbpfv9fBoRqplAB4qZvmwM/cAGSddp3qu3ZpUhIoNYkKwju4KGo669?=
 =?us-ascii?Q?eDx3JlyqgZoi9rEFdf64ZXP+n3yuGS2WAMqAUzAzviz3pzjbOY+fUTT5vPWr?=
 =?us-ascii?Q?ZG/GQBwo+LpZHWPkoytDEwFlxExOhc1LloQF0IETRIzJCYWm+Q2n3a83munn?=
 =?us-ascii?Q?pC3lF+5oGAXBFZYDXM/ouGxd+volzfcBHUigZNfS3lsbkOaFwje4aJfxyFXe?=
 =?us-ascii?Q?UEf/Yn4Ndki/0TNVfSRLd26qHIVR7Y1MsnRpU15No046sm0QLBze9Y5ZT9Sv?=
 =?us-ascii?Q?OgQ/UH7Pr5GYGqjAKJrJ6QHEZ2go4CQQTM8no8jjdlHB/LWOenBSuwMZPXCp?=
 =?us-ascii?Q?svqidbEAbWqYKv5YtiOKi1C9O4bDasFWRo+U2yiQhuq8vhHT8Lx/xuWDn7g4?=
 =?us-ascii?Q?Ez4VJT3c+kGM29Zp3S0OOEWK647yrFhIOgR02Rw6YtFtCOJyGfy5NfbE3MCH?=
 =?us-ascii?Q?mTKiuVY5ewJY3SyLx0/tj3k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1a6d85b1-7728-4b09-cd8a-08dcb4e76a24
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:41:59.8434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uE4UZv8x0LlS1hAWpUwx95LEirohPD9OGfZyktUuX62Q7M08Z2vgyDFRpJJ2AVwHhIUushJ0E8DWziPobedJU/XG1f/IRov6BTEuHPeqNJnIDl+OliI2aM3heBtYnG5H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8678
Message-ID-Hash: 5PI2JFRVED6R7WLFFLQTU3MXOU75HK7L
X-Message-ID-Hash: 5PI2JFRVED6R7WLFFLQTU3MXOU75HK7L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5PI2JFRVED6R7WLFFLQTU3MXOU75HK7L/>
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
 sound/soc/codecs/ak4613.c | 4 ++--
 sound/soc/codecs/ak4619.c | 2 +-
 sound/soc/codecs/ak4641.c | 2 +-
 sound/soc/codecs/ak4642.c | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index de9e431855559..3d73c659545d1 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -434,7 +434,7 @@ static void ak4613_hw_constraints(struct ak4613_priv *priv,
 	unsigned int mask;
 	unsigned int mode;
 	unsigned int fs;
-	int is_play = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	int is_play = snd_pcm_is_playback(substream);
 	int sdti_num;
 	int i;
 
@@ -739,7 +739,7 @@ static int ak4613_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	    (cmd != SNDRV_PCM_TRIGGER_RESUME))
 		return 0;
 
-	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
+	if (!snd_pcm_is_playback(substream))
 		return  0;
 
 	priv->component = component;
diff --git a/sound/soc/codecs/ak4619.c b/sound/soc/codecs/ak4619.c
index 8f2442482f725..1d63e5c447e1b 100644
--- a/sound/soc/codecs/ak4619.c
+++ b/sound/soc/codecs/ak4619.c
@@ -538,7 +538,7 @@ static int ak4619_dai_hw_params(struct snd_pcm_substream *substream,
 	unsigned int width;
 	unsigned int rate;
 	unsigned int fs;
-	bool is_play = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool is_play = snd_pcm_is_playback(substream);
 	u8 dai_ctrl = 0;
 	u8 clk_mode = 0;
 
diff --git a/sound/soc/codecs/ak4641.c b/sound/soc/codecs/ak4641.c
index ec33e7d73c6c2..179d391083c57 100644
--- a/sound/soc/codecs/ak4641.c
+++ b/sound/soc/codecs/ak4641.c
@@ -344,7 +344,7 @@ static int ak4641_i2s_hw_params(struct snd_pcm_substream *substream,
 	snd_soc_component_update_bits(component, AK4641_MODE2, (0x3 << 5), mode2);
 
 	/* Update de-emphasis filter for the new rate */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		ak4641->playback_fs = rate;
 		ak4641_set_deemph(component);
 	}
diff --git a/sound/soc/codecs/ak4642.c b/sound/soc/codecs/ak4642.c
index fe035d2fc9131..9cf3bc9387b13 100644
--- a/sound/soc/codecs/ak4642.c
+++ b/sound/soc/codecs/ak4642.c
@@ -277,7 +277,7 @@ static const struct reg_default ak4648_reg[] = {
 static int ak4642_dai_startup(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
-	int is_play = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	int is_play = snd_pcm_is_playback(substream);
 	struct snd_soc_component *component = dai->component;
 
 	if (is_play) {
@@ -320,7 +320,7 @@ static int ak4642_dai_startup(struct snd_pcm_substream *substream,
 static void ak4642_dai_shutdown(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	int is_play = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	int is_play = snd_pcm_is_playback(substream);
 	struct snd_soc_component *component = dai->component;
 
 	if (is_play) {
-- 
2.43.0

