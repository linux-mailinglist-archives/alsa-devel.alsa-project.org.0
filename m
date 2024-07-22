Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2199386C7
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2024 02:05:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30006851;
	Mon, 22 Jul 2024 02:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30006851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721606758;
	bh=FtaAgQE2HyRUfzFjNCALUngAo1bRwSfL77PLDBKlQbc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pD8hdaQ8YZeD6gHuyEqjW4a2lhi52o4DJ/FwJLH5kQCy9x8iznLGPCI1f/V93gJM8
	 s+JSRISRwtaFcAPJTQVha0KjpQ8xAv/+3pjEcPbbbW7sCysMtuZjZeeZkHvGeDGuQM
	 0xkz4zNZzkZUWuY57KOjM0p2pI6K1xrzYSCv6gYE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37864F805C4; Mon, 22 Jul 2024 02:05:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB5C7F805AE;
	Mon, 22 Jul 2024 02:05:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2EFEF801F5; Mon, 22 Jul 2024 02:02:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DAEC8F8007E
	for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2024 02:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAEC8F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FYMGZXfe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xucECXz789BS0E8rbbqNeo01P34F7LdBzYfb69IXtTZWRU05TX6Z7zfYB5NFSoZ4OzsAd1bZeDaaF0Xl0CmVYLJ5ZTRgMUpV9Hie9hMi+N7stBqXFkaEjDnT4f1qeP05QPMq4yel5M0vL0YPkUQ/T8Pk6xK90cLN30v3n7Hbu5zjyhXl8Pl4IkAOaL89GAIay/Tvgcw4jQxjwKjzCNaQwmFNduFzxeotzFkTirY402zceS22pgRE83EKVA4XzE2PD8LhRK4P6FHRI7nDgZcidZoneplKwB7z1ghVkTUVd6xl6aIbstJbjpHbvThZxNJLo0GagnE2um+HjKPRWJNUYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HA5by1VKPTP7PdJWyAYY7Nfd2Csq4g68HYeuntpV9MI=;
 b=CdE1YOyr29DSsDh+fl8hTMT7nkKAt971UI1cSAqTOtrXw4uhu5xp59HxrrjK/mjCUvJ4D9j1M9Q5xoGYM4785fdN0RCW67c9ktf4YwN4s0tOqeAKCNkXhFqNSeZpakgwX4+CBlMGSc76+dBF26M2Rxa01ghcQDRjZHh1HZ3P51wC0mgaMrcLSAhpltVYwyHxbL/5QXOMqWeBIBbu6Wg1LFtnv9e88Cu+Eb8MPO8+2pBRLu/yE57UZfkqlAlCJt1WdSSYNhFqsZS3B6t2V8tIZIoDck8PP0mWUcstIf5MG76Yrm6rvqFZTMVo+Gg91CiLRvqwRFVgB7LaIG7xpoo1jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HA5by1VKPTP7PdJWyAYY7Nfd2Csq4g68HYeuntpV9MI=;
 b=FYMGZXfeU3j92qJQPX01vQ2ol/b6VQ1T1n47U3xrkpjZ4zwn2qE89O4mQkxizXUd8bwIUXmGMIfmOalv1cZgedTcj+xhtS4GI41pLcO2IW7Nc4LBfTRL82WVHe9EuZLfdeIBk9YTLrwywja8AOYgvU53HEuCFKLd82X73SRONM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10230.jpnprd01.prod.outlook.com
 (2603:1096:400:1ef::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Mon, 22 Jul
 2024 00:02:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Mon, 22 Jul 2024
 00:02:02 +0000
Message-ID: <87a5iab8gc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [RFC 01/xx] ALSA: add snd_stream_is_playback/capture() macro
In-Reply-To: <9d0a16c8-5539-4977-9ac0-9bbf3df56676@linux.intel.com>
References: <87zfqel1g7.wl-kuninori.morimoto.gx@renesas.com>
	<87y15yl1fa.wl-kuninori.morimoto.gx@renesas.com>
	<9d0a16c8-5539-4977-9ac0-9bbf3df56676@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 22 Jul 2024 00:02:02 +0000
X-ClientProxiedBy: TY2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:404:42::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10230:EE_
X-MS-Office365-Filtering-Correlation-Id: 768e7da2-5574-4d33-e48c-08dca9e18409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7u2Z/zZHQLbYLxOG8Fq6pIPnQO+RueWvS4+nDmxGwGJWHMVt9w1WKZqDRiCK?=
 =?us-ascii?Q?sY9sX/oUJX2KQBTUGNOMVdzWQuxJB8yWLZsJ8dSWS/PKOIKe1mBuQjPjNQxi?=
 =?us-ascii?Q?G47B/bFSkzC7BXD/seNfMczXaoskcohm/speUUu06/C9kY9gpcLQYuu52e/j?=
 =?us-ascii?Q?Zq/tyxYscptRqJTPF8RzpbJY7Xe3vGPUxuPuLuvM/wprm0uigMx87WmwCarY?=
 =?us-ascii?Q?8h5kyCoVN1zFx38n88V2F0AB8SzSGIdyjhQG1kd6o+YCFkF3yVwOpazyM27V?=
 =?us-ascii?Q?/j/TZSjJYZrno3aZ9FP0/vjktvvhdJO5JFR4E1dI58YSXr+zH6L7j706Q3D9?=
 =?us-ascii?Q?NcCIeWKAZzCMu8meebmx3nvzFEwOZ1AdZofyy3I+YWEdpglb/211pkWVXR9m?=
 =?us-ascii?Q?zQVlYmacouGBepPWkvKbxZFdpYo5XSlPk86zRjyJcojYCOsNoiRGjVox5bth?=
 =?us-ascii?Q?N0Qgv9zlDqO39LDCws5PUj/cYbiFlEQtkfALgAi9s4SFf1phhHyI3T0UJKpu?=
 =?us-ascii?Q?uHl/ACZPCCbvFVJn5Fm6DHj0YUMCCMPZ6VqNBalHRxru/hNxN1ay+DEcMwzT?=
 =?us-ascii?Q?+17LNncxmwbo4AkSwjLjlcccCptajp/bKMFfLI5pw3eL8UZHC34L461Mw/w1?=
 =?us-ascii?Q?wjfvmTaucLiYWzF72HKUapxsCPgKryjivPhpRStN2XjZaWKJYY3GGa0PDShA?=
 =?us-ascii?Q?Q0uIxpzs750iw64s6HYZnfMvqxoK8TdspK2p1kfBHGzEe/q7IMs+FzE5mbbi?=
 =?us-ascii?Q?wrquzBwC9SycVLeGz3mVDmt6M6KYVko7D/AzvTQSzHVpX/z2r1eT2NpkNeuJ?=
 =?us-ascii?Q?Oxd2Sj9HoGDmFXW9dzxw323t3mJBa9eBHzOE2XAvGpgrAiGEvRSD3c4Ad60w?=
 =?us-ascii?Q?eAkhya+p/0gN/5ZT7/AogBcL8UT5gJnJBuwqRB6fHE8DyUZ3fnlaxB1tpMEN?=
 =?us-ascii?Q?fLsex9GCe+qh3kCQNizykU9Q+jqY7YQ3RB+hD6sIFWYMrY+fE+UIOYZZoSE0?=
 =?us-ascii?Q?fcvtlkI9fPiNsZ+6NRd5GfPaeCx+r3kqvGqmAlHtaUOIhCBuzXjSuTascPQL?=
 =?us-ascii?Q?P/cAbABJb5haGt2evLjA3oYUN8EZzWxh24sManHggfyPBFIMCvtQ4L+kbJlH?=
 =?us-ascii?Q?Wx2gClalExoiqpDEMQl+YGoSirlPFSdQCJnTSBpl7C6Py7i1zgvNsL8ndUx7?=
 =?us-ascii?Q?gMkRN3yJZg/qwXZacZ8qH+E3L4tAwjf5btsByY5tdg9kaTEGbM1yKM4vONgN?=
 =?us-ascii?Q?26VGJHQ5rBUUjGjJExUo67ugENd6wKjWBl/Y2yIGcDsnPujMn9OxVdMRZfxe?=
 =?us-ascii?Q?1XTWa+ixrXhIT02IKI1A2/C2LNlu6iKUO5woJ/Q5v4M6vuCsLuzhvp9+8ch9?=
 =?us-ascii?Q?TNOP0SOOzilkZr1M6ax5zXuPI1k8Q3KZCg6jkIsfu3HH8bI87w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Tw4xCectsbjjkTZOV3aHhsuEq7sC9Mo96OhoCRJ0FPuVZDh0mSq8zxGvc34N?=
 =?us-ascii?Q?ZSYVcsKRKDiGrN21CLmdEwBX+QTLnEXw0KPrBwBRDDXjz1DKkMy7grOTNDt2?=
 =?us-ascii?Q?FvKORfXfHLiz0sqS75Z7aayJRKIVdZJc53omir/nZt3BvEYjD/cnYYzgDMdU?=
 =?us-ascii?Q?mpr06xl69how7eXypUFDoZjzLHrE6jpetgBbSDdDGO3mzfxiIS01Mwn9usMI?=
 =?us-ascii?Q?THGq5T6KCYt1+gttX9+3FrrKe3IaNsTiMSnA+fgtXL4eV4uDt42MIT7fxEOF?=
 =?us-ascii?Q?1UMQ83V1Fb4yyVFjAV8AyMTsGxPEEpMYWz8qjKSD7C1GbumnDEL+O0W8PfE0?=
 =?us-ascii?Q?nFdAfjUis3Zq8BldPHP2+MM7S6csef7EnwcJ1CKmSzPYYTf0AVnpjecVPybk?=
 =?us-ascii?Q?pU68yEQOCGqXk1zPuiMJg3epH0DcuDRyhOL/4w3eeIJW4SgkgzF608aD6dwy?=
 =?us-ascii?Q?4Jlx5YJbQMtlEPDhyLLZfJkzRKo1nOl2UVmebdtyaUAHb2D0NHtY1s6i+P0C?=
 =?us-ascii?Q?QYLLt4hE4bk2z+k6VTUTMLLLbRNQu4IXvVsZVOnHDFZPz2UhRkc4UOXi88WJ?=
 =?us-ascii?Q?pcGpLo++7uLsYD/ZSn8AUqDMsGBtskb9IZb+xV+V0g96dI4/7XXyUAbv5/VE?=
 =?us-ascii?Q?NREYcyFe/RVkgGJsLZwG5rFCJAUVnS4Xa9n5vwER7SHaW568oSXE4kuBRViB?=
 =?us-ascii?Q?8EdKgOYazyrBpOHDk122eSKFC8Lke5hc85Sf9t/Km/Edk/wZvNcKTI9g3ViZ?=
 =?us-ascii?Q?f0gISnsEGcWw2fqDo81JsGoKLRsk8f/twinEF4wz4p0eHOHlfcHoXC1X/MxG?=
 =?us-ascii?Q?cENb1xondzpGhYp8AU/cJNRWa4iu3MoAifb97vQbDupXI/xhKDTVmWfHnRF7?=
 =?us-ascii?Q?DzTq23bKXP2Q+NraYv2baLyhve+WtTMt7OgZE99Xp4TxMaex+b1wH3BhECn0?=
 =?us-ascii?Q?2yv33bUH4QHHkOs6o8elNh5L4gewlE/0+N0nYWT5Z5t5C+T9sDCc3/rY5487?=
 =?us-ascii?Q?jUsluBnlqxFtJRwntFWAg5/LiL5Gah2+XOEtiWP14iDOmKIOuZhNYZMChglv?=
 =?us-ascii?Q?h95s/zilJ51AdCKft4T13zkCoxYmxSUjFGUZ5ILrOJYwJkjtzky9k99uJgox?=
 =?us-ascii?Q?jYSopLwKrlpQCdolpgm55fuNwOe2+YkHc5LgJgCmtCZ5Sl+Y2OwQyXxh4pOG?=
 =?us-ascii?Q?uhGKJmr7AbGAvOssa7yfXuYNxKNYd6PyZReWppTuyH04KJi4EoHn8uiF7+Nv?=
 =?us-ascii?Q?YapX37e0z8+kQnuRJT/a7sT+t4VQDp5ZStiUhg02i14MQnClCdneWkjrOb2R?=
 =?us-ascii?Q?q8gcygMSK/wui8FScOgZnkLZA9Gb5ucvEKwkLbzyrhrhWm7WCEx4nZz5bynF?=
 =?us-ascii?Q?WY8lNSn5CmwNx2iO9hIG/D4hR14VC5lKkIq25a4uJGTiCcf16xB7204qp76A?=
 =?us-ascii?Q?IHvm0aScC2mLS+VqvstkW8WLQ6GEAIS7SNVKS7Skq0rLFo/Xyn4QFlqxNigp?=
 =?us-ascii?Q?O4HGw+6jaOPNvzeFo9lPLY2wkS497eiaPDxV5WnaaEYP8fOPcsZZKHHzztyo?=
 =?us-ascii?Q?3Av1loCZ/PNPbS14o2yzmaCZwSmqhDU6nFbNcn2X1SzS96QtBP+lpwRvz/8O?=
 =?us-ascii?Q?9PmVRms1rgZo0WCFGwtH+yc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 768e7da2-5574-4d33-e48c-08dca9e18409
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 00:02:02.9021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VH9czx4tcGj7sObXaOdz2Z5Cs1W2UZXUXxhpSbr0jwR1ZJZt9r9+1QMTcK86XxAIhWl2YBUoh8o1S+/PihOnk5pClKlf2EtTGL/GNvIveTuFIR+vgb7ymbCrexIrDtmX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10230
Message-ID-Hash: WUJFCT6WFLS44QH536OZTLPFIFXR23RT
X-Message-ID-Hash: WUJFCT6WFLS44QH536OZTLPFIFXR23RT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WUJFCT6WFLS44QH536OZTLPFIFXR23RT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Amadeusz

Thank you for comment

> > Many drivers are using below code to know the direction.
> > 
> > 	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
> > 
> > Add snd_stream_is_playback/capture() macro to handle it.
> > It also adds snd_substream_is_playback/capture() to handle
> > snd_pcm_substream.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
(snip)
> Perhaps you could use generics here, so you could have one caller for
> both cases?
> 
> Something like:
> #define snd_pcm_is_playback(x) _Generic((x),                   \
>         int :         (x == SNDRV_PCM_STREAM_PLAYBACK), \
>         struct snd_pcm_substream *substream * : (x->stream ==
> SNDRV_PCM_STREAM_PLAYBACK))(x)
> or just call the above functions in it?

Actually, I have tried _Generic() first, but changed to current style,
because many drivers are using own direction variable, and they are using
own variable types. But I think more again.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
