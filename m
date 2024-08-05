Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A1894728E
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:48:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CD9539A8;
	Mon,  5 Aug 2024 02:46:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CD9539A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818815;
	bh=RO9sGYPtH4FnSGA69e1GZXgXLCVyeAgQOYghxEQzqn0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rlZmD+02d++iON/XxcG6wM1/U5jJIL/udl9WSiSOoFygrqlFAJecZy1BuYObJNDh4
	 NbP+OE3UVPvN1d64eN8QR77OxjyhYSpOOlFlxv8HK6YPpqy2mo7/lPDX9IbnvG5dnA
	 iRNSAy/JCwNUGWJSfYumDA+kXECjN89NT89d6Uqg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80658F89739; Mon,  5 Aug 2024 02:39:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86E5EF8972D;
	Mon,  5 Aug 2024 02:39:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FA32F802DB; Mon,  5 Aug 2024 02:36:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 215C5F800B0
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 215C5F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=K64AodmO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+w1u599502mzEY03P7GNWm9eXJ2dZPSf2ZHwo06HkjDpwO9iX9sYpsOpXFQhqlRR3XsosimqtdLgDLJVjKwBVPTMdbwlEJi0df9frL8ZREnUYadLeHpyFYj0lH4wHRwDDBGy1Jopfoi/XgbLKzRuoUFhacrR6QeSOFwueTLLGa+YqdKiackaihcsDqT6wYU+RIHUKBFL6fpfl/VwXOOaoUfqu/iksQTTZeEAWOdo647OxY4HbGSjY1hhClyJhUe6Jsh7GCr18iCJwh5kjLu2kW70tRYXPWS2KcFjgKTyWNoa+I3a2vnW109ob5NZMc1xb/WV/DQewhlOL8quPQezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fc0zE345D0DOcFhECJyWKv2hc7dMyEdP61dty9apzvQ=;
 b=AL/YHHT6M+nbJhEsLviLXZ5DzWhIkyLnoT2K1+NDACop6Noqp4u1iykvRx2DMtUV8iuzwfLI6dymSwbfnwQbNnAjhJus6Rk7kAGdsg5n/IMEedSG80VpThsRPuqIfnIZbzpbY/YMr5Qj4nebU8wloHU/xk7ZtW5o6dKG3QwkjVeLJcfNSdCB3LEM+v0C6xfp5zdfsk1+2SWpXQRwzTtLc5hXuZC9SB9qq8TMHJ4ggczzsjPRXr5ibGAxiOcbvjAD/pvthEnKxWBl1AaA9w2NJkjTFNGrnAffgCOwCUcFApdPwpWoBqj11DuMrGEhMyFL94fxn0NU30wsQce87Xvaqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fc0zE345D0DOcFhECJyWKv2hc7dMyEdP61dty9apzvQ=;
 b=K64AodmOQODq/LIsN/pH/V1VOWvmf5U2X++XBI6eSmUW0Vov+V5STwJE707uACL8pFiJ29LNIvecX5AR/Fb1BatV8voGHc4TSnHDO5gODhF3bsDX/S+ZlizqLni/sZNm4p5eCtIpRo4G91Ij8cOH1HQ/wRAx48Abw3nEgH5bqhY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6318.jpnprd01.prod.outlook.com
 (2603:1096:400:7a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:36:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:36:16 +0000
Message-ID: <87a5hr24cg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 021/113] ALSA: pci: mixart: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:36:15 +0000
X-ClientProxiedBy: TYAPR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 382d6311-730b-44bb-d095-08dcb4e69d9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jrk33gdofdEQhNv6HRxC6aTNVyaNDPKyiW7YhJvxnF5Z17eVp6F2gafaUfrT?=
 =?us-ascii?Q?BNimKzW8JctvQ+pQZz13BuZ9uzaCjsmEBvJZ8STWMegQpf8T/HOPoKxxL7lu?=
 =?us-ascii?Q?c0m0mQLGpcQoLMGIu77WdlszgAOkKYWUaTt353V2cpOBnL0sOpgYDrtFBAJj?=
 =?us-ascii?Q?I1K7EHr4ahE+AU1goakZSWiqhM7okfnouc3d6vtKIK5lqBDuqUp9isW6NPYP?=
 =?us-ascii?Q?RbBUfD9lebch7WoeBlJxbEm0FKyeqonQNuDYfkfDdvSZH2sfToPIkjzhMUXx?=
 =?us-ascii?Q?2LDFxMJm/4XeV9Zx1ltvrRawTwLHHOquigQDcyQtV4wPS2+JteRVzQ88p1b0?=
 =?us-ascii?Q?Kl3b0OBE3Cqoob8A8fnK8fKPmxm3ColDPpGuJ/mbNoaUWJHQRqm0jLK+oblv?=
 =?us-ascii?Q?IjrGxWsoX6HeTrQ3AhV1oSb6ITjZxg4yDOzUk8smgQCpNWl8rj25WjRXDq/N?=
 =?us-ascii?Q?wVTFcwUogunbHWyvGRYMoq78YwnUNcNRB/GEgeOm4HGk8SfbIP59h0CoNihQ?=
 =?us-ascii?Q?jH3oEpZRuMh0MvsC+Oy+F28HvGnv3NgsWv4nRI7N57fKRRAxstX9TqHH2pki?=
 =?us-ascii?Q?dVk0eS8M+/N5nlJLeqorp67dX2pdVk0WchUFjiM9UhicbuWojVUoA4hYapdp?=
 =?us-ascii?Q?iZ8WpCr3xFNosq0tUVE2WRr05CbqcZzj4EipG+DaDBSKJ19BHLbIH6FV7Ma+?=
 =?us-ascii?Q?/Efj3Y2cTQMhQ51stQ3GShRsIyrRl771NICu3w+hR887LDn/ahJ1otTVoUHb?=
 =?us-ascii?Q?iFzRECWJEPsf7S88W4ohtVzjRtICBsFU3+eKeslDuEw2vLa8hg8eUWjAxspI?=
 =?us-ascii?Q?hhMs87EUUOL/riezuxFSwW9y+4EbxDHU9iHpKCMgcaRARTQPGvuSTaPZnLs+?=
 =?us-ascii?Q?+CUTsSFOecYl4GI+VoHuA7mnR905BoKqlYxI6/Az8Kb6zZOenwS/wT+/9X5U?=
 =?us-ascii?Q?oXLWDUmRfKbhtgP+JIW66/jv2/ohAwqv3rgOhEqGsD1cqJJ9Sy+9f+edXoBH?=
 =?us-ascii?Q?hFFN5yh8eVS0NAF4rL4Sb0BB2GecAMo0h/mvhpxlkaeP2gyJRKyldTkfOk07?=
 =?us-ascii?Q?lDYdyCkYkQiVUwB7HxlUU5saEsOTOrq9NTppRcVCM+HSNf7YVlybdqCFNf6x?=
 =?us-ascii?Q?/Tij+hn6KyWs6s+ib7bsxEwphylPh1fHDA1qXXEYSPwfVknR7Y/ion/whV9e?=
 =?us-ascii?Q?QFNYipCZtbQ4QPb5rphFkdqK3A2d6p/HPN/PlsoVL2LZECgztFjSAi8d476Y?=
 =?us-ascii?Q?/RxT6s/BP0ClQYm8wLxhxkZwF0Ej0SSCTjHcoMIubWnyW6bFcJbJjSwK8U4y?=
 =?us-ascii?Q?XmabTeFu6/6AQsNPB3cpqLX/skH/nsgIa4YeQQT/1toxvBOzPsdsGZb8c1Jc?=
 =?us-ascii?Q?5okDlYruPAcqvFPdQ8lLSczbnOGL9YJjEPi8aaA+uNGQb9DTKg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ns21YsUeKA2lyyqnYfz3y2WJhDkkL64EB2kX1v8UlzalHGROOfMSSFavVM6I?=
 =?us-ascii?Q?SBOKau/v/Np0va70AoDn0mpJVgRx9DNzcEqLD8e7DNWIGI55fcxldNjl8Fu6?=
 =?us-ascii?Q?HbokOBFR0bs5z0ospfORCUQeSuNsgRctk9h6kDldu0dkIqkiFwH6TjpDn8HW?=
 =?us-ascii?Q?lmCZGep3RB0+h22NiKIwV66alcB/hwtHF3Q0Te86x+IY7hBJr643wyt9HGMn?=
 =?us-ascii?Q?D/976zbKlUmIEqtN3D6H1g+bv6TufOoiw4r0wF+gIC6yzD4Frl8NRpu6DZdw?=
 =?us-ascii?Q?+RVaOb23HSxRwo926zDLtbltmo2gf/ycMPpLCUsZ200Le0MJ9XTTn9MQY9Bj?=
 =?us-ascii?Q?wFEfjnc2tDGjj4zK75B3kYgPwMeoOYYrPq322ZiqNhH9YE8euZEy0V7/EThd?=
 =?us-ascii?Q?d73Kul4IYbYMeOyal35X21FALJQWYeQ3brug//ZQurIC25g3UeO+OT1YAmaD?=
 =?us-ascii?Q?T1MR/wmdqrracWzuRpGJQgHqk90Lfh71roHkbd+Syh7CJHhIiP1DkB7KqcQO?=
 =?us-ascii?Q?YTujqPmzWHsVlDB8b3MyG46yjStTiWjhO+UoOB4ZW0v+i9+dhDo13Y+da815?=
 =?us-ascii?Q?eZ18fk1AOspyFD4Reii5no9sYfReU8i004QvDFwyiP/uoytud4f+IpWfw6zc?=
 =?us-ascii?Q?EddjESfEQs2P885+tuqH3S6dDX4q72vWu79/UfQ520TWGvg/gDQ1K1ZjvtNF?=
 =?us-ascii?Q?V7qrqUkBaxAR4L+kiEspkN7EcxMUzEm5aDv7n+AXWZZNnURsjO7HgOGKH2Xm?=
 =?us-ascii?Q?tsP8nEoxFRXXwFVzpNLUDlHQaoF/8eKplgeN8k7oLBXscy0YVFfNBPymvu4r?=
 =?us-ascii?Q?X5VZrtOiatWOyOjgqAQAmJXBdumwLI1IXuYZapR7Mu2IXANN1p5OLirUroXK?=
 =?us-ascii?Q?Q2v7z7j5ibZI8kzJIaQyhzdvKC0zIgFglXGBzB+MhSs9w/aLcrn6yoWR+tju?=
 =?us-ascii?Q?AbuiMuN+1DKxM3KSB4oRfROjjPLD8V9jfD/zwcobcMJdMo7fyKtdwreu5iBB?=
 =?us-ascii?Q?WfG09huMuDYThWC+RNXP0Y7j4R6PkzjF7hh+9VjzBh1adHt5FiyH7VAwH/dB?=
 =?us-ascii?Q?mNYGOTuGNtkE225ApucrxgDnuZBKAoJL7xtWkbkGjr/jnxVlEqWQT24vk7Wj?=
 =?us-ascii?Q?itfS0fPUgfPBtWG39UJunRKAjsghkLXm4a/Rpl22UwQsUI9/ImLP7/Pa1Sn9?=
 =?us-ascii?Q?4ttBLKP+ZXg1wow5fG3AA+RGswgFsjdoB+Jqg9KuM21KhHOCFOrXNop39YVO?=
 =?us-ascii?Q?EJWPTTpoSw8214JLXIzBinrQULgNQChPYE8iQ5WYl3cV2soh0ozpqfH2eSv2?=
 =?us-ascii?Q?MdAPBW3me0yFH9XB+lxUP3cTINRCaVZBWoI2SlyxVw7WP6ws3GD+4tPRFdGP?=
 =?us-ascii?Q?9NPGAoujnDpy8QedyzDoMnDJhjAJzidI89vxCdmRDfHNPgthk6giH+8hwGjN?=
 =?us-ascii?Q?h2wxkoArvmcx48lt+0OINO8LJkactQCiyncM78x8rk/RIwlNGcCQDGToEFHj?=
 =?us-ascii?Q?HhhoRe07EGpygaclvTJ0AinyGPpC3fR19lzC+5prOkC2OelcBoutmf/3Cknj?=
 =?us-ascii?Q?v4mT//A3cEqKIzZ4tajDoQ5xrP/bAukJyeviiLE3EOqrv6E35H5uY3xJmTdU?=
 =?us-ascii?Q?2rQr/q+TJZJrRfzBmF76U8E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 382d6311-730b-44bb-d095-08dcb4e69d9e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:36:16.0658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gy2SxBYi1WX6bd6b8dRw86+aOzGRXx5fnlNDKN1pSiMSn0ds/HQmHkedc+bFt827HwS0N2EPzifJ/99Mm3R2MyRxmd7EsHut0jPJ85/k353UKrB+gcFSdjHjo2nGpAys
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6318
Message-ID-Hash: ZCSFFPDMSMEUCUUEF3ZNECLHNNBS4ZB4
X-Message-ID-Hash: ZCSFFPDMSMEUCUUEF3ZNECLHNNBS4ZB4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZCSFFPDMSMEUCUUEF3ZNECLHNNBS4ZB4/>
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
 sound/pci/mixart/mixart.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/mixart/mixart.c b/sound/pci/mixart/mixart.c
index 7ceaf6a7a77ea..ed4959c517d2d 100644
--- a/sound/pci/mixart/mixart.c
+++ b/sound/pci/mixart/mixart.c
@@ -391,7 +391,7 @@ static int mixart_set_stream_state(struct mixart_stream *stream, int start)
 	stream_state_req.stream_info.stream_desc.uid_pipe = stream->pipe->group_uid;
 	stream_state_req.stream_info.stream_desc.stream_idx = stream->substream->number;
 
-	if (stream->substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(stream->substream))
 		request.message_id = start ? MSG_STREAM_START_INPUT_STAGE_PACKET : MSG_STREAM_STOP_INPUT_STAGE_PACKET;
 	else
 		request.message_id = start ? MSG_STREAM_START_OUTPUT_STAGE_PACKET : MSG_STREAM_STOP_OUTPUT_STAGE_PACKET;
@@ -608,7 +608,7 @@ static int snd_mixart_hw_params(struct snd_pcm_substream *subs,
 	/* update the stream levels */
 	if( stream->pcm_number <= MIXART_PCM_DIGITAL ) {
 		int is_aes = stream->pcm_number > MIXART_PCM_ANALOG;
-		if( subs->stream == SNDRV_PCM_STREAM_PLAYBACK )
+		if(snd_pcm_is_playback(subs))
 			mixart_update_playback_stream_level(chip, is_aes, subs->number);
 		else
 			mixart_update_capture_stream_level( chip, is_aes);
@@ -626,7 +626,7 @@ static int snd_mixart_hw_params(struct snd_pcm_substream *subs,
 	if (subs->runtime->buffer_changed) {
 		struct mixart_bufferinfo *bufferinfo;
 		int i = (chip->chip_idx * MIXART_MAX_STREAM_PER_CARD) + (stream->pcm_number * (MIXART_PLAYBACK_STREAMS+MIXART_CAPTURE_STREAMS)) + subs->number;
-		if( subs->stream == SNDRV_PCM_STREAM_CAPTURE ) {
+		if(snd_pcm_is_capture(subs)) {
 			i += MIXART_PLAYBACK_STREAMS; /* in array capture is behind playback */
 		}
 		
-- 
2.43.0

