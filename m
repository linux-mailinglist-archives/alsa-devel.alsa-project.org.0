Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E60BA115A1
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2025 00:50:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C5CB602AB;
	Wed, 15 Jan 2025 00:50:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C5CB602AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736898612;
	bh=H+Co57W6n4XgKzLjrYPRiYyfrT8QMHmjJHWasAnAl68=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WRmrZ5ro+54tBnYHma9abvPyMEyjjUhwbIjPfE1IZjCuh+EBWgeYRDzseXIW3DS0c
	 uRXnrs2vCFoajKyOHjbKs8YzqMPis0iZfZ0gcRl6Dfrcsw2mHzo7HihI/k0ND8v2/U
	 bazYmPQt8DyFElBzJbHu8sD069cuQRIKHo67/Suc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE804F805B5; Wed, 15 Jan 2025 00:49:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1D4CF805AE;
	Wed, 15 Jan 2025 00:49:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C300F804E5; Wed, 15 Jan 2025 00:49:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D47A8F801F5
	for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2025 00:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D47A8F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=B0rQ8VQP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UrzUbqqyA1ZuGNpBDLc6arUwuqzG/JodrCrRgfnJbfC72LgDvHbJmcBIEsneiX4yigwDSgBegILL75Nsm4EaJwymwZaem9bt/UatVyXDN0R05dY7pG+SHUNAQBKs99j9uzeJF4J46yji9NIXphGdJs6UeyVueEZjoOz/Uag36czVMHv7wl0w6Ld8VP6E/XE2f5es+tGHc1ntm3GWkjNg1moNCEpzNxFv1Su7AkVJznBtm0bcrBcE1d5w3FN4cmDMc+CTcy/BqxsFLfg6mKsES0Q0cBhB8vxjif5aI0xS4BCFNWRCPJH0OI2bKQhhvpf3N74WWlNGmnK93ImNtHIJ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97BINtTCIDH8aBT3eGWCVp5rmaNQWUwGlv/AE2MidVQ=;
 b=Kx7AzGOz3i1TThvg8x/R6Eq9NwkyRqKQgzJcesOP4jgRGLqmVcEL9YRmQ4CUi2FSooVlGmzesfqdcT3tIlXv4c5KjU2f93ga+CL7ryN5gz6qHtmW/7cFE+FVpBzGcl9h6tH/lxyrW/jzpMYkuf+knCUS7wULZ1snWvLeYzdqPUaSf9YVD5Iq5gu8/Sv7k7LAyuuyK47CAmT8TKpeyoBDFUjzDCUe8ZdRdyNr+luYHD+yufa/Bq2R4pU+aXdGOornLs8o4S4SpnE1DZ2ssNqTv3ASf4qj/GY2j+LffOPviQqcGxP/IqL5FDdQRnCJON8AGPVLAExYfJHoOCgYdXjzCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97BINtTCIDH8aBT3eGWCVp5rmaNQWUwGlv/AE2MidVQ=;
 b=B0rQ8VQPjAwbGpI68IgKTu63y2LTT6KYfqZ00rSuRfEl6YMSLgpnzrwF+cMFl0Kx9Txg6Z8sV/m0V2orMhoSXG89ODTgm/y6ikcHNw021dBvRTBZATvCr5Z0o8CA7XHCaZeYeFMpqMMtbuulz+lJLzMUCxOBXKEA5TgVWp8hhG8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12556.jpnprd01.prod.outlook.com
 (2603:1096:405:1af::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 23:49:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8356.010; Tue, 14 Jan 2025
 23:49:04 +0000
Message-ID: <875xmhj6s0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 tony@atomide.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] soc: audio-graph-card2: use correct endpoint when
 getting link parameters
In-Reply-To: <98a19395-7056-48d1-ad89-fb057025f46c@gmail.com>
References: <20241220071126.1066691-1-ivo.g.dimitrov.75@gmail.com>
	<87y0zdsxme.wl-kuninori.morimoto.gx@renesas.com>
	<98a19395-7056-48d1-ad89-fb057025f46c@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Jan 2025 23:49:04 +0000
X-ClientProxiedBy: TYCPR01CA0034.jpnprd01.prod.outlook.com
 (2603:1096:405:1::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12556:EE_
X-MS-Office365-Filtering-Correlation-Id: b93cf1fe-ef24-4a73-de37-08dd34f60756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?evRFMz7ugxxXFBNpY9zKij1M2tlt6fFWMr7Tal6zgwdeoRpAtLUzTpbhgxxk?=
 =?us-ascii?Q?vcPiLdOe77OwPQ4SWHp67pgIATLih3HlvGGltVrf1EeQNjz1zoNtR3PMawYh?=
 =?us-ascii?Q?kAhkFHxFhHWqjgV1D+LwQOFxgnTqWBPvBPo6MwtuPOEUPqWq2vOA3nzhMsFa?=
 =?us-ascii?Q?yaTC/Lc8TJrKigBsxamSJQnPXiqb+a7fAcQuO6Mnw9qwZ5Hu4xlZxXkjcnmN?=
 =?us-ascii?Q?WLCxez7SqBKCjmyJXQX4jbyRi8XAC5SwdotqizF+vwjwjxEWTepZ9r5xBqRG?=
 =?us-ascii?Q?UiLjQpvSB70GwQt+nWiZtS7RyEIjRapUbMuVikjO93Gp0onfYD0IwIA2z7e3?=
 =?us-ascii?Q?omZrA4j5bH7soM9Opbpu45etHSbqqe07X4u4RsRkLbcTJlTM32T19qDjF+4s?=
 =?us-ascii?Q?V2UGvj/EtdpYVguaZ1gtQKagY3Ox8JxPu5appSIRG5FYQKrwOZLbEErXfAtl?=
 =?us-ascii?Q?wdAkhHwoskM8ipoK16Rav3Knz4BJ6ciNdhHRnBhYeOQdVz95saI0GvNoTo0A?=
 =?us-ascii?Q?Uoe1WNWWT3j99ygoWeHVLcwoWieiOThwri9pVj3KPjGR5EhMRkqI7KWLMx6K?=
 =?us-ascii?Q?suusNR8sj6GOCZ+D6oQJkprQFVMk0SriADqQUshNGWXpRPWQYYe/vgbvTfcO?=
 =?us-ascii?Q?lFUSAJGTmY+KlQuB6Tmughs85RCR6AP53aSYWzKu5Eee8FrTVmcnv4fgE9vS?=
 =?us-ascii?Q?W6t6u5t7MiTgMAAFUhR/RgLDmwiWSOgF2HtmUDEqWifnzjl1s0wGnN9gew1W?=
 =?us-ascii?Q?lGv0dNC/AKVjTs68B/uv7tAJuHYjIYo21KIEagpPSEbF2AU0DjntXl4I660O?=
 =?us-ascii?Q?jK93XcVVs1PvSAE8AN8VSDOPm4lxybqfBgsqVA95UnG371Pj4ATL2gnB2HIJ?=
 =?us-ascii?Q?U+yly7+SQHPtQCi85i7ea/eEEekHKARMt+YcLCJ9GdnGgww3PRQINRC7LIgw?=
 =?us-ascii?Q?OVxFMAqom+/Zo489DuwSNknNVRWxBEvlhoqTE/ZIcruY/9vs/YALrY7ZeVJx?=
 =?us-ascii?Q?kwtgSl3gPd1b4IfPPvaUdgKWBTxaNSwG4avQhtqqUNWtmphE8mkDs60S021g?=
 =?us-ascii?Q?avU7jj/YYzd08ruHi3unfP7Zi2JIZS9qAkHLgFDCPMoc7RvXQcbQe+/x/ESD?=
 =?us-ascii?Q?TGxiPJEmrFH2djjb0pz4PLqYE+bX1baP+iId2OJGbg9SJPR+2jCWZt9u68gM?=
 =?us-ascii?Q?w+o/yyZlbLSjcCNJH8oN/TFVvI69GLlYzbNwmc+ayNtR+nswMHR9DmvoDkJj?=
 =?us-ascii?Q?AZOsiQcci/fhnDMuncGIJil7yQscIIwmjF8GMyKIuruvMofxg4V7UpcGvUos?=
 =?us-ascii?Q?HG8FdFCCFOjCVjYQ1Eh4+UyOUEGxlQzH+BaPWjpm3nT+xqIT10EIsaiCbnRv?=
 =?us-ascii?Q?0ElqpCQnGcAbx5iWDl5Z3lF5vbPopP6frJkwkxPyvyjCalQ7b4DPzEcfCurT?=
 =?us-ascii?Q?SYlT+1DNjuhgFIigeeHCF3W4oB7tf7Ez?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZdA7X6i97dBlBEQ/uAUEYG21ae796RdJI6LbgWXUdTi4ZXKY1w8iSH1RMzYz?=
 =?us-ascii?Q?ONJabN5kmBMQ3hKxABOwKQ67Mzj9R0Lzn3snlJpVMd8Vp6Hw0qNXfOrxaVzH?=
 =?us-ascii?Q?+3ojhhWbHFurglnDbOMVJq0UYtWsmEPp91aN9SkiWkWRm7GvC7VgKmS16mpS?=
 =?us-ascii?Q?x/r6f5vH2ocA5bts6gYRFyuhvWiCX9S82uMHmgkRT6tvK9k+/FEPlwI6PWfG?=
 =?us-ascii?Q?GBb1xFe+sPJCNJLhMrExl4SPy3e/q5g24f0QAqEoeyBSSwyPF4GZK2r6DoW6?=
 =?us-ascii?Q?iQPM/tj/BLW8D7nau2IllW/BJ8LT2It+MVeYxhHanD5RHkIJurcbGN9+8Bco?=
 =?us-ascii?Q?yOmi6VU2I4bY8Ex+0YivrMm3WND9sX0Jm/rgQh2QQftG1Ko8Gvw6LeL0IBSI?=
 =?us-ascii?Q?YHGYvGHxMW3GVKP0ozZSZCFVeUG6vJiwUmayz5xQbehsQRy2mZ5wKc78R/EC?=
 =?us-ascii?Q?phFk6sugPQIjRMVIoIVB6TdgP7fjQ5vXdAGdoqNc0qBasgSadZ9dgumCmugC?=
 =?us-ascii?Q?i0TXox48WWO4FNY0kBN9tjec+4lIyOHUQWIYGeACABBa54IO15JWty8DvfDn?=
 =?us-ascii?Q?zljHMztagNq0Y7tEZryY7pZXjqAYAeDNhGEwKhPaRyzMCv830meXINk0+AQp?=
 =?us-ascii?Q?Io+6oY/1DbyhwKpt6pjBbcH1lJM2+0Jq5Y/P3Od7yNuyV7qlJ+j4SA3GiOp5?=
 =?us-ascii?Q?bMW+j6nV23LHmR7FdaLsfREMLMOoSB+rRp9VqVpi6clvoj/51JQw7yLNlbCw?=
 =?us-ascii?Q?/8Qe37cWa6ARGt8JLALtRA7GsIxTobc7rTPDMyNNLnHRJ73kTwKWVt902p5U?=
 =?us-ascii?Q?YRZqQOkciIwUGCtxp76W9CF3HuVBLvNVviFuACOArlghIn0z5dnZrQDkkBWN?=
 =?us-ascii?Q?SC6ZRICfwiITBXljJaQLWQgIeo6CRy4R/inIo8erYb/icqfhK9NhZ2DG+cjT?=
 =?us-ascii?Q?jTquXTahkVdyFb/FE1PmgcOogkmF/uoaLCXSe9HWZa6w/cWQWZ9vFrTdhhYN?=
 =?us-ascii?Q?zr9faAYuK7KdaYu6erbWeLMoj+JnX/m1tIJAXTM5BL/74NImY3oFuGVKR9fj?=
 =?us-ascii?Q?uirYEqbt2tLz0eyDNNBgfy7rVHEYU7UYwr+9Dr6WkdmYTCLq2czTd6mCoQAM?=
 =?us-ascii?Q?u9RVy7ralKTtT2Q/JPkJP0mbPJbkfFXF/j4OaOqptrMK4b7pq0QcNU3ASD6+?=
 =?us-ascii?Q?SbKqPFP32O7mXmHBmA8WkOY8ip2kjWDZ1jIJlC8m+yKTsuE1w15dUISXgEJX?=
 =?us-ascii?Q?HHCIpYxqxppD5V+CgPYOzYPsDdxROvyLTSUdqyDBEaFkITD5NvPwKFzGZRAg?=
 =?us-ascii?Q?eEL1dDP9MG/+AP3FUO5O3TukyKd63Tx96WfREqeJs3Yn40jBAH5fRvEufgEt?=
 =?us-ascii?Q?sLVHLcPmego28GPRMjQXGjshJviqaBAV9hIlc/chfmpqIVskiVi+5TYyY1dh?=
 =?us-ascii?Q?Sbjpr0mGUu+ulH8YqJ99LP66S4X5AI1HsilOxE9qhkVIlsOeV9AAnw8NUu6Y?=
 =?us-ascii?Q?ATPw/fzhYnGQD6I7lW1LIvZ6Azy//Nz+OSo5w7YysvrgKGzjm8PBwQLiq8b8?=
 =?us-ascii?Q?rsVOb7HEWcxWHGWINtNuQMXfb263oo3CEqkMiIBiKj4MVxKzPSXtX1nWvriL?=
 =?us-ascii?Q?0zBW/FvRdfNXVDXX2l//L1U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b93cf1fe-ef24-4a73-de37-08dd34f60756
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 23:49:04.7388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lgLHfO41GeaiVNLxMCkhFq1GJkSfWSJBKKBSUBKKwsVWIFILudA+tqg2Ko+EpGFFIcqVuaa7bB+6uuM/NOQ3Ns0CO2wq7CEpDn7iXaSdS0zWL870oR81Ft24Z5Qcj/sh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12556
Message-ID-Hash: YSRAG2TDUD4C3Z4PEQ4EOHNBSY4WR2VI
X-Message-ID-Hash: YSRAG2TDUD4C3Z4PEQ4EOHNBSY4WR2VI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YSRAG2TDUD4C3Z4PEQ4EOHNBSY4WR2VI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Ivaylo

Thank you for clarify your situation.

> > You want to parse "remote" endpoint (= rep) directly, but the function
> > requests "port" (= rport), and it will use endpoint0 ( != rep).
> > Is this the main issue you want to fix ?
> > 
> 
> Yes, it is the 'remote' side endpoint, currently it is always remote 
> endpoint0 that is used, because when you get 'port', it is endpoint0 of 
> that port that core uses.

OK, I could understand, and I can agree to your idea.
Getting "port" from "endpoint" is always stable, but getting "endpoint"
from "port" without parameter will be issue, indeed.

But I guess your original patch is based on very old kernel ?
It can't be applied to Mark's for-6.14 branch as-is.
Please based on latest branch.

And about git-comment,

	When link parameters are parsed, it is always endpoint@0 that is used and
	parameters set to other endpoints are ignored.

Please indicate that current function requests "port" as parameter,
thus, it always selects endpoint0, etc. That is easy to understand.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
