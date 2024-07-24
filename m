Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6304B93B976
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 01:35:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68A0AE9D;
	Thu, 25 Jul 2024 01:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68A0AE9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721864102;
	bh=Y+5giS2+lvVfwTATLntUIEnt2vRa59oKK04uWXndF7U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JfXfP5zNXpPPLnfuJ3rM8PkEYIiXqP9/gq2NKg7piDLRzWUVSTYmTYE2Ht7Ax66/9
	 1cAxc+QcCix/vW8qc2L9X7N1UirCRY5CxNV4LjHAJKhH4CvKcUg0IM/XKk5am5vuiG
	 5D7nUpD/lkOB9SIcR16aJroA990n+79F3uMK8n/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C386F805AE; Thu, 25 Jul 2024 01:34:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 383CCF805B0;
	Thu, 25 Jul 2024 01:34:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3FE0F8026D; Thu, 25 Jul 2024 01:34:23 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 029D8F800AE
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 01:34:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 029D8F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=nh8gaKxO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dffq6LgZG1MJZZV5NZcCkSZk3PCkjTDCIKpDpbUlfnCrR36taUvCzBkklKwoPawAen6pASu6TOKE1IhR1Kv7b8qfmrmr4Z1YOVPNkOn3zGBrfgbDM1OnX2hKizGeIA6iPXvpk1FrujgAAnBE1jHYHJ3WHDvWmI+A6qrHAKGVWARIAipjtBicN5EQorkb0AdxXJsRldjVovhCT1bcp4ZB0HixoYfBsyRB2yxU0t9R135T7i2U6qcoLpxcQGHXVO1Ndh4s5gU2D0PACJHsNeQ7I3wgmoKvs0VXC+Ff+Nvf07i8dSwOmev4SBLgBgnetLMN/j/vOyCnnMRxrO+yOOFldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MB55m4on0Wuk6okP01GC2Q047xbZcsDbOiPfrgj1MXo=;
 b=gGyIHkz6TceNVIK0wINGrz1ryQrTSvasQewzMBPNUEjbLxCDvGL9GDmt2d3oe8O9gxMGpvPpEa8nIRlllxzc3QLZ9LzvfDwr7m4Vtmc6X7HuJtSiKUVAZNfHJ5a6na1nZIS7WK05cmIP9yXpB+vfDeElRuc/X2T6SsYYbwUV2gAkSU/DcFy+fvOiKDvINpv+Xnh7shPnKo/e0JG1UGHXbeOxTTwYc6FoCUGroTLr4tO/YPLWEemoDNd6+KVxNe/kCaGq1CCFyPLAXEB2Wy5ED7egJGCOLSb0n1aaSvTmamCSSC+5dFCKYXYjaI/XFP8zJqXP7DsqdOpyuHiPLZcsOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MB55m4on0Wuk6okP01GC2Q047xbZcsDbOiPfrgj1MXo=;
 b=nh8gaKxObWzs8pUhFvaUM8iYFvNJNSj1OLwgeFvCDFbn4WgVcL+4vzrmr41IGZxtyKH0Es6TIR2xd8tY1IdXMBNicZfYcXjpGJYUi6ObTkq8lgc4TM9lPUC4eSdKbN9pbPe9f9Qxb6gwClm6wcfzBN68wigaZ9cd4i2xsxSzoBA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6711.jpnprd01.prod.outlook.com
 (2603:1096:604:111::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Wed, 24 Jul
 2024 23:34:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 23:34:06 +0000
Message-ID: <87frryl5zl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: Takashi Iwai <tiwai@suse.com>,	Mark Brown <broonie@kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>,	Amadeusz =?ISO-8859-2?Q?S=B3awi?=
 =?ISO-8859-2?Q?=F1ski?= <amadeuszx.slawinski@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 001/112] ALSA: add snd_pcm_is_playback/capture() macro
In-Reply-To: <20240724032310.GA35513@workstation.local>
References: <87plr3ft3q.wl-kuninori.morimoto.gx@renesas.com>
	<87o76nft2o.wl-kuninori.morimoto.gx@renesas.com>
	<20240724032310.GA35513@workstation.local>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Jul 2024 23:34:06 +0000
X-ClientProxiedBy: TYCP301CA0057.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: 679f8456-1176-480d-d6ba-08dcac391c33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FnTS2JVYaE2wVWw1KhZ1JFNdkJri2GeqXmqxXSS2TW9d1gZxtmzC2EMiHcxi?=
 =?us-ascii?Q?EaKaGsclGhT6fWgRSPVKa5Dv5UGAuKM4MIjPLEW5qjHCOxcjR/q3iwfZRIMt?=
 =?us-ascii?Q?YNKSXSTLU9K7mUnF0lVlvBX9ZPXVQVOtjaE4GLdDNJc7Vh10U7LdB32aZLCW?=
 =?us-ascii?Q?W/tOlXR7r8+hFNMvXZgESSJafUsK7EvUddhuYd8GPPvY0nhX88unfoRgXO85?=
 =?us-ascii?Q?WSaNqH+oispt+XVbONDp4iPjumeiJUHZHR5AhSr9vIdEDxU5A9cey0xqiZQL?=
 =?us-ascii?Q?R11MQt7oIPBrnO7aWCE0b/13OHNjQIQlt6O+CN2eYh9NfrCnBEeuYJ7kiNl6?=
 =?us-ascii?Q?4BE2Q0xjDGeWSPMh9UYC/LN8pYVy49RgqhXZ8TGjApaeFssZkbvZLUQQzyMn?=
 =?us-ascii?Q?dda+DBKYCHDcsgInL1UcQvcOrn/K+P5qmNx5UQYgAyeH7uf1QtVuG/w7AXQ8?=
 =?us-ascii?Q?qgiMvjf8eemwQykAjpEWaUzf0SGnQVgmy5Whc2uTyGht9ZpbTRhgqmGkfH65?=
 =?us-ascii?Q?dHPA9rwMDCxJcA4xmgHH9ssu6PITjr2R269L/Rgi2lQNQsUOPJbwDPafcQ30?=
 =?us-ascii?Q?2q4X+W3HHmvoIVEN97Ibzz7FVCkgBOonv88OmKyZ24uysHIrPmM+BIlUhOdk?=
 =?us-ascii?Q?NECm3OwBuxTcRQTU6UqZYATG9RXguFinMujOvNiJJuD0Kxsl0bZwYngkuSIL?=
 =?us-ascii?Q?194ck441g/guBo/1OpXmPgFDEKMd8dT1WeAK3fmw7k60LfCF8GynIzTXqAIv?=
 =?us-ascii?Q?WHk+JSsL3kqj0ffvs/tHj4Tm/yJ8pCgFwamXmcc5a1Z8oTNS6nLPO73ecV/6?=
 =?us-ascii?Q?ZDtdspZqi3WBd/dDuhDxgno0MHk6y+ZZf4jmKpSur/MwZyo66ojkIhhkCBim?=
 =?us-ascii?Q?/57KX41dDV3E7N7dJg5Nkv2b/qgPfBMH91Xx0vhyQ+Icvi3biHVoVpeUrlV6?=
 =?us-ascii?Q?euxEWvdWTe8xlHZV430t+zp6lbLI37HrI0Zk79TMvGXjjMfxKj/EEveuRzGi?=
 =?us-ascii?Q?PVfmUUZ0WPAQxUHcNtoqvV9iDbmQ0BcG8jnbx7GhyJ++GT2ZoG2/rolAggEa?=
 =?us-ascii?Q?jG1W9bv9PZDOJJObV6t1HhlehH1PrjWIyfqj7n1y/z4FjInmm1m71PoyJYBM?=
 =?us-ascii?Q?huHSayO+3jbpAJ+5Hb1B2oysNEifZZgMNcMVeyg2wn5PEMwy4kqX8n1HZPOV?=
 =?us-ascii?Q?0pTqDDL8bwBYZzjH/7rUdtlohoWsLKy35QGd4H4dmpCRL38XVR+/SbemLkBe?=
 =?us-ascii?Q?v/Ampbn6RJyzYSumJPkhU3DoN1xBk9Hc5jPy4H8bllY8f/Syj37NS8uzh5Ii?=
 =?us-ascii?Q?MMrDwiYVvLISDHK8HOCYeDuCF3aFPJfSFHyhY38ZCxslK7QY1JlOVufUVWoA?=
 =?us-ascii?Q?buVs/J1lehxAR9cyFKwKRIQFti9zRzBQy+aoFvMv4kFmh0nBcQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?S1xhxA1HRhPkyMplH4h9vYbGLcG/JlcVaGklItvYgRxmFZe5ITY3NGXDvgoL?=
 =?us-ascii?Q?01FNG035jhX3qAgr5FBoOg6eV1/i9hio7ZO8aL4JVcc4tDKvVzBin0WUEMVb?=
 =?us-ascii?Q?6qkok5QqZEuHJ8Y7aU8B+m+KXSzyJkYsqQh4dOglt4gEwgM/WKgjwHmubuEQ?=
 =?us-ascii?Q?iCkNIHlOpbSOFHXTGzq/i5lN30Xb4qhmv231eSeLJ/jNh6F0tpRTt4lw5L6w?=
 =?us-ascii?Q?mU5QKgcpvblhwfx6ATrfsnCsEji+ku2DHF3JpkzMQnGsUjjYACFL3cPCLNg1?=
 =?us-ascii?Q?5HGNDEiPQv3WuFiSgGBF39Ng5758SEyCcoO2gv0XnIKnCsvfhINu8VAiryoI?=
 =?us-ascii?Q?dCkIcrYHaDM7qQqRZuE/3nNS7fwg8Tl5wj64CPzOIGrxkjOP7cYluo3CQyu8?=
 =?us-ascii?Q?X4bFPdmu+dmqgcslxrN1RL0AXIBL3Fj85vTVIOPnj57jLpPGwmBh+bk4z0dN?=
 =?us-ascii?Q?g4PGS3aYfPPCFnd6YQ0uzeSO1YkNH40KPpCfdCQmtHW9rRJmHgeqoTZ/8OgY?=
 =?us-ascii?Q?6lju71iwmYrNjC39MTJfd4zVR2zoosda0Tt4Sq4lYVBEZ+7cVrv/Pgq2Ijd5?=
 =?us-ascii?Q?A7mPafhp/3vxOuui6sz0M7IG/EayaT5GFnQAkvXsy8oMpymNWJdBV0O78KeV?=
 =?us-ascii?Q?wH0/kCnD7XrPNdmihelE0UVeXuNdbvoL93sShvNF/HybWJsd0jIS8uSbxO1v?=
 =?us-ascii?Q?YAvsF/pmggQdUzvJqJjZSqx2YKfLHia9gBHBL20amxgjBGjaS1Y6RugEeq0m?=
 =?us-ascii?Q?Va6UE2i/f8WQ1+afaXO28ibuupIljTxgefQaLsRvTmWNPVnjDwimypBjuTad?=
 =?us-ascii?Q?fovQ/llt7/TRnI62kSKvkBPqEYL1dJAdlScvaeysbCEUnRvA/aNoJcMU08kE?=
 =?us-ascii?Q?a0k1TN3XIr52MFYsM21jTwPoJdHIDCpexsoPacPF6hr5XxhquhihLflXmhwU?=
 =?us-ascii?Q?+dhnnuusITsLs2IwEqxKgsc3/bSu6wfFnPvop8UfLnJGPBNl06wosrImYGiE?=
 =?us-ascii?Q?7VaONYbs3erhLXlsSUc5hl0kANvt62Xu78n9MhuRxJC32rpVDVcYnsBtJlIK?=
 =?us-ascii?Q?kKXsKoGa9XLFRWVTyZ4OPmKSJKhWizG548Aw30dW5TrhNfQMUNCXMzTkxxuQ?=
 =?us-ascii?Q?aBU77EsDlEiysbLf19o5EWw3gJRC71MVlogMzApVAppoBEY9D0/ljJoazZyn?=
 =?us-ascii?Q?5xJ68nHMFpA6QdgltDFPW9Npo0xHVzrKaYjl/DkDoAQ2AB2XmdxC0r+M2Z7N?=
 =?us-ascii?Q?KNyD5Zx648w1vLP18DhZL8I8nJ8nxJ8dPcSqjpop6jVG1ruWZMwOyAt4haiz?=
 =?us-ascii?Q?uvtv8a5Mjr3EQGHBxMKmVRdXGK6oVUL5DFYeCVyzjD0GnSme04gSLrU8RiaK?=
 =?us-ascii?Q?SDQBAU9ir8z8itum63efudY4fi3gG9PtoBpIppCCSyBP7jyvXE/6oUOSEk2f?=
 =?us-ascii?Q?NuvT9/22boDQEUXg8qgcZ2WlhKS8UpTU03nlGIwTarmGUUCDWDcUzwunSf3p?=
 =?us-ascii?Q?a1ltKuDZvH+yG7l9kgYsEXlkm6At3Qv98b80fwJ2TRCBlUr3o0hP5z1RE+dU?=
 =?us-ascii?Q?CxVnuZ8jjVrvVDlRHFNWhKFUTT2J+6XAU5cV0vwqfYJq+fqjWUK1luwtg6Rw?=
 =?us-ascii?Q?uKGw+9D/bN1mb7Pv/UijX4g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 679f8456-1176-480d-d6ba-08dcac391c33
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 23:34:06.6716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WTxaQuMWLfX9w8ToEvbIG1EKAp5ahiR8sKoenqbTvomIwY3aZFuRJY3lhOqDAhwlqn+yMzmfbnk8oMh5q+nwRYwhi9r6V6dCRVi9UTnTTqI9nuu1rRyyaGzqyqV1N38K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6711
Message-ID-Hash: SM4BB7NA2OR5RCKCMQHGBTOUGY7YWE3B
X-Message-ID-Hash: SM4BB7NA2OR5RCKCMQHGBTOUGY7YWE3B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SM4BB7NA2OR5RCKCMQHGBTOUGY7YWE3B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Sakamoto-san

> > +#define snd_pcm_is_playback(x) _Generic((x), \
> > +		 int			: snd_pcm_direction_is_playback, \
> > +	unsigned int			: snd_pcm_direction_is_playback, \
> > +	unsigned char			: snd_pcm_direction_is_playback, \
> > +	unsigned short			: snd_pcm_direction_is_playback, \
> > +	      struct snd_pcm_substream *: snd_pcm_substream_is_playback, \
> > +	const struct snd_pcm_substream *: snd_pcm_substream_is_playback)(x)
(snip)
> In my opinion, it is not so important to distinguish some types which can
> be converted to integer implicitly/explicitly in the above case. The
> 'default' association is available in such case, like:
> 
> +#define snd_pcm_is_playback(x) _Generic((x), \
> +	      struct snd_pcm_substream *: snd_pcm_substream_is_playback, \
> +	const struct snd_pcm_substream *: snd_pcm_substream_is_playback, \
> +	                         default: snd_pcm_direction_is_playback)(x)
> 
> The association would match [u|i][8|16|32|64] and f[32|64] types, and would
> not match to any type of pointers. However, it depends on your preference.

Wow ! I didn't know _Generic() can use default, and more good things is that
it could handle bit-field, too!! It is perfect.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
