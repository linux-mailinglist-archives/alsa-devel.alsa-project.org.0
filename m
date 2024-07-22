Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF0B9388CC
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 08:14:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C477E7D;
	Mon, 22 Jul 2024 08:13:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C477E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721628842;
	bh=o2KzZYMJPCkknJWTrtJIXtqnpiIhOqr6PENEQlrWjuM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y7o7jlBrEki4sTU12SDX7+Wr0sK4495vXVTmYWsfqUnMpTxw2dNVYjy8NpnO2OMsU
	 By2KPILOpQ8rD1BObglvq4Q1oAnVLvskmaBI2604zgvps0dn0op1uIsWgmQ6HNe31y
	 cwrS1as/Q2kXWMIHdKM8QLPJ+dAjdcJw250fnEAI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67B37F80588; Mon, 22 Jul 2024 08:13:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBA65F805AE;
	Mon, 22 Jul 2024 08:13:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38755F8013D; Mon, 22 Jul 2024 08:04:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=TIME_LIMIT_EXCEEDED,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2AA0F8013D
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 07:58:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2AA0F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=j2lPo5nW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nlaylj/kcH8Xx8dig+3I80x0t/llv8vRtFFAroNwSsmV+ROQlPEE3wG5Wln/7isknufVUku9n08iD+pfNpth+SwW5cH9hoWux4Y6Wapzdpm1LKcY9lB0SX4qFUuj6CZnuolPXAo4DXh02eFq/5N08DQyztsObUXOZnKj06ewwF0E6GvkRbjSbGP+7p6Ouu7q+0OLKoeEsrbjuWDe6oM8iVvERJQ7sNqp1AnCK1JBmyvTr2hHHoub3O04yJpr8CfJAUvuRnY3EsU6JuYae0RMWAqOvaZS3qu486jIdMwzlJKcrqq7jmEKBEPXFZ03yYB1fhZJGecrZKOhe2X0NUzRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oBwHIKNoMZ425NuLpewyb8Xqcc6X7NNLVQIjviQLZf0=;
 b=n/DFyjOTdq1V5Q0noyuInK3gLS7oTUxF2AKLFy8d0Vb+phoXNmEz7e2+yPEJue5xvXGOTs3ScDD7Q3P/G/+qfHJczhJjPxid+e0Qg0G/Z2VZLuT6dLD3a6o2NW2NnqKLkpH+2Nx55IWXeqUWDXbGmRB4Z2VFwtkMPnlwosPZzlFUdXa64rDid5duLajfia/iwzJZS3/eHqEmNHxUpHkU7/kqNV/w8f4ZGKo6pcLFwXST0B6Ww9l+X3apYVL3NCRSHuYFXX/IUjCLIDVHFyHHNE2T5IRLGg6Qde2E8/fYRsiRWm3dLv1v1U2ltLpc9nBxqPvpAwjjstCOOOFiUlxUKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oBwHIKNoMZ425NuLpewyb8Xqcc6X7NNLVQIjviQLZf0=;
 b=j2lPo5nWef4q0hq5PflPKaIRUPLyyJWR8pgeg3+tPU5dPWpm+Tfdf1990rqnPiV81ieeulR9vPYBikOKwPOs+DrUVj0wuTIRzgZdtswFoWjg9x/eNAk0R3aPWYTWp8mQFFF7ZvaXHqL12osmRUHxXPE0u0Hnl+xSKWBYCORXz1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12292.jpnprd01.prod.outlook.com
 (2603:1096:604:2e5::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Mon, 22 Jul
 2024 05:58:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Mon, 22 Jul 2024
 05:58:42 +0000
Message-ID: <87wmle9dda.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [RFC 01/xx] ALSA: add snd_stream_is_playback/capture() macro
In-Reply-To: <87a5iab8gc.wl-kuninori.morimoto.gx@renesas.com>
References: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
	<87y15yl1fa.wl-kuninori.morimoto.gx@renesas.com>
	<9d0a16c8-5539-4977-9ac0-9bbf3df56676@linux.intel.com>
	<87a5iab8gc.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 22 Jul 2024 05:58:41 +0000
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12292:EE_
X-MS-Office365-Filtering-Correlation-Id: beb5a66e-f904-467e-fd54-08dcaa1356da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YOsgI3UO7ukrVDHLycNNIZxn9Ux6VNLZLGftqZQGJJM66JnpEtbp3wyLri4K?=
 =?us-ascii?Q?trY7gwdNVk7BnJO2EeQ8SDMOUMWNKwHXasEcX+UVQKpoFOC21ew2gBnzmZf4?=
 =?us-ascii?Q?h54wKzsLGqbKD76Na1UNoQj7dy/PxgS3q0Uf7SXlGuwl8dD6NMZNJvz7PT4Y?=
 =?us-ascii?Q?kMg+4UvN/fnBRPTi5Q4O2QDeScusgDJpJSMIqWvhLuC/B04yB3Ve3W5vij6D?=
 =?us-ascii?Q?76niGItiuiS2MS76ELqOai0fdYz1W+6fEqIgnm9JgZa6L3GLFr30c5VCfxMu?=
 =?us-ascii?Q?ibOXjdfpZXW0s7C1GbQgVMl6EntLxl+d0Q/X3t/miALAxqEKzhuhBE1PwQsa?=
 =?us-ascii?Q?fBT4HqhAUqZAbm8+DZ3tPUH9dCvHlg1zoTqbLxb0a1yHv/x/AyKCuX6Ut5Mi?=
 =?us-ascii?Q?GSD8N/rD9UgDtDSJMpabQGafQquY4MXAan19iEMIYYfKCHfCBg/xKPUBZMd9?=
 =?us-ascii?Q?LGTMV2njhXKaTZWsyXu3dUaDY18fOD1n+0xDRyj2B58b4hwGVSK8NfLGTO7f?=
 =?us-ascii?Q?G4QW21ATYZ2zetLudBn8ym1y2zcNzaxMrwYneqoeN6Z7D4gwfFZhZes6SY5c?=
 =?us-ascii?Q?SsKmPBuCoGou/JWKRZxbrpmmCGMs2/CQEiIUhu56Rgb48sqNH0j7oN1V49Gf?=
 =?us-ascii?Q?uralq6XPVxMrfLm//6Sr2aAucO5TVUoOenmr2qCCziWHlY+GN5hsaUE+aeSW?=
 =?us-ascii?Q?0TUte5BDTgtrmOoRKWLq9qikFLqf+4myA3M9YB+ymHqbR2BMAAKYZynzWoQ7?=
 =?us-ascii?Q?ZvrOPIsbRjssW8gGK03Uw+J/iEpG3TH+GEx757ohTDQ4/RFlpCZlMPI7zui1?=
 =?us-ascii?Q?kuLFJ1xwfNN0Sl57XIg3bdy4XTj8Lb4pO/SIkUxlmbXgKy7+yphrF147cGOs?=
 =?us-ascii?Q?B4munY80Olucc43aYLE8L43yZkLu3tAw1tOeRlUzgRkaaia7sFgYXdh/EIrW?=
 =?us-ascii?Q?0M7SCGvrYrpf8pBoU8K9cLUn3pVT6aSzXVXm+UtxzcV/eletjK74BOPJtfxr?=
 =?us-ascii?Q?AUNJwhlVk6Ro5D00wzJ3iTcDZG/izRkGZ6nmtXu1RDSHMGhxMNX1UhlL6+hQ?=
 =?us-ascii?Q?cjux6nK+0LHQtlzdvwtSssqprDcLnMVKC3ZIGPh5y5Zd38cy4slHIwDa37MH?=
 =?us-ascii?Q?g46iCc7PSCWLQai/zCd8tkfJZBjIkLYUjNoMOJN3OvThWE+vj5zLHzy2O1yV?=
 =?us-ascii?Q?AaIRxuImt0ee0VW8RxNIdG5LcGglFdIWdOZP+tnqM4AqnjDzgjjCdxi1oxqM?=
 =?us-ascii?Q?kjNlIcqZWXBWXxjtSkzn69Pp5aNhbsPANOfCk2mzq57qwZFqTFXJORddhsfr?=
 =?us-ascii?Q?7UjvDdjwZXlwsocUiPxOE1IuWb9eE9gp8dTQM0sL+1J3yATMCIrfz73alPLR?=
 =?us-ascii?Q?jpQnuEvevp3fSJT7LedXm3EA0NLeY1Mk2HDl7uN4OxgGApMnHA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wFh7sVuzj1/ejYUO2atAVmWLJaLaXpOCGktfHUNr6bSjMvukEW47rpcSq/z/?=
 =?us-ascii?Q?atOkmC6Xve6k6vyup8nQ3XDlnx/kWSaFVS+gmYBVGQchV5D4nQcDhJ7cHRyJ?=
 =?us-ascii?Q?/4NGulQxFEQCCADZJV9vJxVwXLtlSk6xRe73OSEplDAiIOY0YKcLXgPKzNuX?=
 =?us-ascii?Q?5U9tPEZb2nVl5qxn4pP8Kjv9xalCsVHUdOI55MBAw0Mmvwd/v0h4OCRIBTg5?=
 =?us-ascii?Q?77WGJH1qQxS/4moTt0zkekAe+lgA9hOlffmMTMmnCEAIuZ6hkz5O41ekPKru?=
 =?us-ascii?Q?+YHNuiRfgpvM/19Xcb42AX4wGCLmtN+rscXwcwmDXrEfDZdiDubZv0VYCd4j?=
 =?us-ascii?Q?95hiYoI+lCwk2XHhet8vAyqDYlEeHwSfeoZOHI5oW3R518dlVj6VAYgcIQFP?=
 =?us-ascii?Q?Z3RgHKES7cXCaQg3jdqijggrzRWvd6oKIr282eNIYQ/aqP9pM7IhCOAggTIX?=
 =?us-ascii?Q?5XXhv6Dezp+CZ68JZ2hKBQ24Zy84WB0YTyVClc1kGZlmNrhyA+TL/bs3BaOF?=
 =?us-ascii?Q?ae6zXkvidOSvpf69XZrRTX4lc4DBvqW+kxSmqbiHIxIutI1qw5RLC8jf3ckg?=
 =?us-ascii?Q?9yMZJmYWGItV13H+hscujBqDgnWbhenXfqKQSfZtuOL/1OgkmNYU31ecOaXE?=
 =?us-ascii?Q?kdDEstwukxpmzx9wFFJ9PE91XTOZJkDepab86r+73IXTKZg6vBH3Ciglh7dQ?=
 =?us-ascii?Q?g5FMpCsZtUXzvI5d9XM/VgXTi4Ux2E0NmG1Mio8p6je2qIRUgX/Rtj/DfreP?=
 =?us-ascii?Q?cMpwnFExyb3pb6x8w6nkAQ93v8u3kkc8p2K0GeIRfFe3vaw9OuSAd980lHZr?=
 =?us-ascii?Q?3taBvnDiyVMoauD41hncjCMvpsvBWunOzwq96JXMBsKCMuV+86izQ/e3pOe9?=
 =?us-ascii?Q?AVAG/PpIfSR2yUGrpB2WPHfLJNWkqiTOyj5YS5Puy2Na15TJ7q8uP4nQWpIX?=
 =?us-ascii?Q?Ie2X+dCJlVEU4KmJ+NilKss9IrIdwYfef3l2W5K/joSn7FBhW04lRmwR/OkM?=
 =?us-ascii?Q?hpCNoDVyPzulBwwiUkXXKAfbD/J3r9ha8NmcXY1BA3TNK5pIP2+5oFz6wqNG?=
 =?us-ascii?Q?QX6oQP1/9ijQEEZDn1XSmfNfLZLrBfKjamTxvikPqRWoa45+2IRqGP4oGZf1?=
 =?us-ascii?Q?qwiAqjxqLgGNVoiC+EkybUxWBBpdA38q8THf7jESUWBbog27OWxzAPzwdQia?=
 =?us-ascii?Q?EWUJ/TzCvdrCI6TT6A5qu9UW2D7Cdl8qrZ+EotvOUX937kT5BH5AQLwH2eTJ?=
 =?us-ascii?Q?/F1cUsKY2PM1ueO9cptSauCQ9QW0AskE8J47NTGbGVQmZ90vMQmJ3HRE6RM2?=
 =?us-ascii?Q?jA36SVqPy9eQufPf32OPLjmGpKM+2gzDxUxlaSK/mqz3YK3p1KppZas5WZqM?=
 =?us-ascii?Q?RUD6ulwf70L7MWGXS8N1h8ffVuKGhodElAhgMHIqZ5tUefXenz1mtnnAz/Lh?=
 =?us-ascii?Q?mGztYaVuLn63cj/tuaA4gQJvzzMCtO5TOInJlf4GxbrZOtprQQgsdEUE/S7x?=
 =?us-ascii?Q?1Z/yAd2jyOfU5YqlKzbaSaNq8IvJt2Wh91d1yTsY4kDoMxZ/5lU2AVZajsG5?=
 =?us-ascii?Q?xWw1kJBXsyl34jeMJWXRHG6qKJr5Lp3uVLe10PZwXbkT7yvhy3tu4p8HEfc9?=
 =?us-ascii?Q?88QDqvJRDehT4wgFRODVaZI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 beb5a66e-f904-467e-fd54-08dcaa1356da
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 05:58:41.9493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ppOlIpJj2s2JIInhprTB/ATw+0HLrA597eOIexRUNayIHcR5h+bLz/OcywulJXyCLgOF86JqTaX1f5+Vd8vEOGnX0rSdfReS3zKO/ZZx3ZEr95nujzg3ONUs5ExQ8C37
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12292
Message-ID-Hash: JKLR5ZHNF3D76OLD7D7P5SOCNNAUQRMO
X-Message-ID-Hash: JKLR5ZHNF3D76OLD7D7P5SOCNNAUQRMO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JKLR5ZHNF3D76OLD7D7P5SOCNNAUQRMO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Amadeusz, Takashi

> > Perhaps you could use generics here, so you could have one caller for
> > both cases?
> > 
> > Something like:
> > #define snd_pcm_is_playback(x) _Generic((x),                   \
> >         int :         (x == SNDRV_PCM_STREAM_PLAYBACK), \
> >         struct snd_pcm_substream *substream * : (x->stream ==
> > SNDRV_PCM_STREAM_PLAYBACK))(x)
> > or just call the above functions in it?

Hmm... I couldn't compile above inline style.
I need to create function, and use it on _Generic().

And then, _Generic() is very picky for variable sytle.
This means I need to create function for "int" / "const int",
"unsigned int", "const unsigned int"

static inline int snd_pcm_stream_is_playback_(const int stream)
{
	return stream == SNDRV_PCM_STREAM_PLAYBACK;
}

static inline int snd_pcm_stream_is_playback(int stream)
{
	return stream == SNDRV_PCM_STREAM_PLAYBACK;
}

static inline int snd_pcm_stream_is_playback_u(const unsigned int stream)
{
	return stream == SNDRV_PCM_STREAM_PLAYBACK;
}

static inline int snd_pcm_stream_is_playbacku(unsigned int stream)
{
	return stream == SNDRV_PCM_STREAM_PLAYBACK;
}

static inline int snd_pcm_substream_is_playback_(const struct snd_pcm_substream *substream)
{
	return snd_pcm_stream_is_playback(substream->stream);
}

static inline int snd_pcm_substream_is_playback(struct snd_pcm_substream *substream)
{
	return snd_pcm_stream_is_playback(substream->stream);
}

#define snd_pcm_is_playback(x) _Generic((x), \
	const int : snd_pcm_stream_is_playback_, \
	      int : snd_pcm_stream_is_playback, \
	const unsigned int : snd_pcm_stream_is_playback_u, \
	      unsigned int : snd_pcm_stream_is_playbacku, \
	const struct snd_pcm_substream * : snd_pcm_substream_is_playback_, \
	      struct snd_pcm_substream * : snd_pcm_substream_is_playback)(x)

And I'm not sure how to handle "bit field" by _Generic.

	${LINUX}/sound/pci/ac97/ac97_pcm.c:153:13: note: in expansion of macro 'snd_pcm_is_playback'
	  153 |         if (snd_pcm_is_playback(pcm->stream))
	      |             ^~~~~~~~~~~~~~~~~~~
	${LINUX}/sound/pci/ac97/ac97_pcm.c: In function 'snd_ac97_pcm_assign':
	${LINUX}/include/sound/pcm.h:544:41: error: '_Generic' selector of type 'unsigned char:1' is not compatible with any association
	  544 | #define snd_pcm_is_playback(x) _Generic((x), \

Not using _Generic() is easy, "const int" version can handle everything
(= "int", "const int", "unsigned int", "const unsigned int", "short",
"const short", "bit field", etc).

If there is better _Generic() grammar, I can follow it.
If there wasn't, unfortunately let's give up this conversion...

Thank you for your help !!

Best regards
---
Kuninori Morimoto
