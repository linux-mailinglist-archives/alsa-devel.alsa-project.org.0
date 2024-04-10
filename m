Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A5A8A043D
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Apr 2024 01:52:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A1B227A8;
	Thu, 11 Apr 2024 01:52:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A1B227A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712793168;
	bh=by4TQzauUN09zFWygnzMMPMgNb/isgc05VWfgmr5J0U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UPm3cq4cQlousyBSudTi3MxSmdECyc6NM/umhvfD3r+94Jh5dM7EiPXFlUZzMdT6e
	 vVC1TKXrGb/WwkE4N1vZukXF61hVQgn7HMCqOZ92YIGINqsmfgiUnWPTnGEkbyQejT
	 3Z4e9Arg0wyvKUoLSDtPaIrSNo1o5Sppd7/dfZfM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 494ECF80588; Thu, 11 Apr 2024 01:52:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE346F8028B;
	Thu, 11 Apr 2024 01:52:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD348F8026D; Thu, 11 Apr 2024 01:52:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9DAEF80236
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 01:52:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9DAEF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QK9mMQCN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YdT8o3/2EjWo/HcenCpGEUxgzU+YQyTMCtCN0pMownqcXmwHHW6DzinGbQjBvzb3BwQPaG3vc5l+ir8+y9gPe9gQdn1TyhfbN+4uaBnheYX/3yaRNg6NID2FGe6IKK0MEvQvvYK1qo0ExJFd6kUxV6aJHuond2tSCEG1WW+LUkRTFNeVWJRxIbng8n2p8fqCmhOdb+o7ZNXeuMBE+LF4a2EARPQnW8I+amcdh+cGt72AKzXqHdSkoZ2YfySh6PEn8w/AGJxP8+Cj1clJ0lAmJg3BATbRfVj6zxG2YIaaJso26xKwc6XsABxdh4x+QtsJj3zCn5l192CpvjMB/mhfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQBoMKIxIzFYgXcCkit15SVhcJQpjAl/7AOxb1YHEnI=;
 b=U3WMcIBnVeWdfYMUTKmv1s2gOkeM1WFggGhOuN0HsiMCkRwCJxffRPccdAiBUNWCiAqkiu8gGIZMAhKu62KCR7ayx9Q1caMXD/2WSjS7iIqgeNP/BlySZoVQEkRdutD+mchKFMP1+TRjy30bJNYm9aNAHoxmPJ2BjS2XMHvHh7mq6PN0X4fEa0H3mdtXHt6LyNEwKkYyJq2hG8EZkgVUK8rDh1UaBTJIJeKDHizkkR6M4Xr1YRorr8SRoKTIJ4tYVlvGaEzutr2aVbxFg+6imAV5q9UHyoy5ehD6pUPHpMfEEab+AdqJ9hLNb8ZssjrtWXxlh1JD17bZ/BeusN+shw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQBoMKIxIzFYgXcCkit15SVhcJQpjAl/7AOxb1YHEnI=;
 b=QK9mMQCNvxBkwT9fJN8JoffS31DmwstiQGlaYg654oxOv585CNKHkFtZltQYc9S/rr/ReXDQ9K4fa0yvQ7wAlS9VLUITSGJfR943gUyjo7Nij2QWDtmf8ncXMDTuy+/ljeqxTi3VqVQTHyGW8erNucPdWhZHqDlY1euThe1pZgU=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9447.jpnprd01.prod.outlook.com
 (2603:1096:604:1c7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 23:51:57 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Wed, 10 Apr 2024
 23:51:57 +0000
Message-ID: <87frvsepyb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2.5] ASoC: Replace dpcm_playback/capture to
 playback/capture_assertion
In-Reply-To: <f86cbe94-3a31-40f2-a637-576b15fb75ac@linux.intel.com>
References: <87msq2kjvo.wl-kuninori.morimoto.gx@renesas.com>
	<f86cbe94-3a31-40f2-a637-576b15fb75ac@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Apr 2024 23:51:57 +0000
X-ClientProxiedBy: TYAPR01CA0152.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9447:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QGKEfU1Kk2wvLDbv3UJsV1/j5z9a2WeMZpPEXE4khmGtx/YtNjwoPge/BPLVtI47xKmKmjKElO6IJ+SbA6nXpPsra0a5aTF5RiBWG31+M/HFKQWtRlqTwb+1ywcbgaPUxbkvVDsN/A9qdirIAl5vFp3xrQy30y3/aDRgT/cOJ84QyupHoted8bnUeIvukQ0TqRzyf5EKKWnsPtp0nV1hWKOSCA8amd70d9o01Jojp0cSmcLG8THIWO4RUZcMK9PWrY3ZZHANRllpx9SkD5Hu0zQizHh3f68mb0ELxsapbxCnJUn8ijV74iDEIAy9fnNXxikqb6j+Yn2JlfL0PVxRPQxlHoEGovkAgtE1SChIar0pPZNqE77ClXjBCCrlUokfjatUmi5i15Bha6qLoMPGp4t+UBvgSqld1IcKsew3DaY76pHkz7q83nbyb9R1gFtmrFTAMFnWwYpiaBIkV3JYWo3N63QY6NkdOKsPRTxtpHTg593PSOCYHjnMXqxR1d+yOaiKny6dl9vbWXCR5iM47gbvj9bqMKsNLbfsptfNzb50g0yLdeVkqoKXAJ7zdEoGAqigaGbcPkgweBlaZpDg0HbWRIT3BD4DU2Rdpo4Qd0a1/Ojn9B3ObReMknwYsC0hOqP+uPOhC7A+IqhOomshTMSzx3egkqlMEZfHirbIfQmIueS6pJBRUSSWAijmpjj3yVW7E1GHcQehhbCH81L9qijerNCZq/ieCTiQz5pL9j4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rAKH0oIWq8f7YPnvqVa3hR6Mlj+P+VEvlbF+Mx/uUvMVesB0c9La+QM0lwE/?=
 =?us-ascii?Q?uIpsXGBWlicAEzkszOoDM6CDV/h0xVsvlyV6gElH4LWW6be+ZhUeKdCvKmK4?=
 =?us-ascii?Q?nA4iEsf4iQoxnrbZ0OtR2GKeqxtFQ2987FzAuXPsSCpIrHv/DqVgd6AMJJfQ?=
 =?us-ascii?Q?bpQ7luTNHfqsvLJv5WVvmKUdQQPTc9+hNV/7dSLFPCuvuVVcLsnAF+j1w6O4?=
 =?us-ascii?Q?muxOMRD8tUgakb9fZcLbUY+5KzpkNzQlTlZAj1o/CdWSbTLZCc6Chxig2XZZ?=
 =?us-ascii?Q?NMLWNKbLO8kx9qEzOCOTsIuZjhd8wAVQKMSj59dW+XiKDGRGd25aiuBevYuY?=
 =?us-ascii?Q?UvooMJx2o99h74lSCop6bePazR5jz1kq0jrUJkZNqb0dBn9rQ52Wg/IB9SnC?=
 =?us-ascii?Q?0L1m+m4/W5U09KXidA5ciLp1N1B+ffPz3ITliV9cAUjlPOoqy/g9mW6FXOJZ?=
 =?us-ascii?Q?H3k/1yvpA86yuHN6cGfMNLmmMdBNl7nyeK78nfOO3AnKFzhD/5XLsrxJKrXY?=
 =?us-ascii?Q?dco6OFDqCKr+iNEXXfwK3EWJkYoDNL/Bggo3TjsW+k37Ra9bYCoEkGm67jWr?=
 =?us-ascii?Q?AI/SLb7J/rIxb5hTOwuc7RFunX8HjOXb3PCNnIukcBZJpbkughOaHmRWc569?=
 =?us-ascii?Q?oQ5TIFH3Z0MbLimvAtTtAkxcIktHl8PdI1IQDjt7iLyvqU7d08WGv2FweGIl?=
 =?us-ascii?Q?ZX061AgwCVBBXvutC2I1S6v82WtUkyS89DabcsQc/X+enauTv1rNbLrifWRz?=
 =?us-ascii?Q?+UOIgOq0lSm6cZG9UXpwqPIHkK/tvVg1NHn3bC+B1Igo/glWaueo0NRJPZwY?=
 =?us-ascii?Q?3lKPnim2yoRzLOsyi+dD9cCBtlMzHZNQJENNrcdpzMOXAkDkXH0GrUJmuytU?=
 =?us-ascii?Q?Evpas5jHbekxwXne4Bw4bkvHhIDOwN3PYQPm15Fjlx0uX7U57O0I307Uq9ko?=
 =?us-ascii?Q?Orqs2MKN4KrQ0u5V+6oaJ1EKFDMLeCiI0iFQ0z9AfBOOTKrj5wARUJbolSkv?=
 =?us-ascii?Q?92E3yUrDYv9w43uVjT0mH8mfa2TBBo7tQ3mgu+xb+JSXM5QG4FTJiHgOz4Np?=
 =?us-ascii?Q?6XQfvExxAzV2NSk9gWpYrwcu+6VPvagiIOvql4EIxa9Hy5e9Y2cGcvvC70Am?=
 =?us-ascii?Q?OsNjGGx53RYg0rEk/B4sAPqYINYlT3JdgzEbybsLZWG2pDyo/0zpo2XeIXNC?=
 =?us-ascii?Q?6UeyALZ/ObzQZu0qu06iOrWd+LQVxrSOTVzwy/l9BvDolbDh196gZ+vlQf0c?=
 =?us-ascii?Q?ha/YPCAT6I1A9ijgSM1q5oxHKQnq7m1/kqrJoLcCGOHSofAism7EYFgaY3Vi?=
 =?us-ascii?Q?uvLn9qMrH3kja1QdeqHrpfMXV/D4RLP7hXtu+C1J2yjsNrL56sp2kDwKaBgN?=
 =?us-ascii?Q?w2JhDGEw3PViItrIjKBG6lfpJFrEl4zcGbGKSOW5CRN/7PnHelK9w54YvOaL?=
 =?us-ascii?Q?uIqMrsnX9xzFuTMEJVj/0bIpxN46tFTuJQTJgm/6ReJyWlylhhgn9M5brTKe?=
 =?us-ascii?Q?f1K4MmxU5DFROjUI728s8V6iPsH+51u8YLLZrH7kDMT7r/RluJsk+Vt48yAk?=
 =?us-ascii?Q?vA7+jq54JdjPXLIH9D51BIayOEAq9udBZzidgktT2CEvLWqyIp15pcCDgSbL?=
 =?us-ascii?Q?0J+y4m9dpCX5ihraR991PNQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2a08e9a5-77a6-4189-b94b-08dc59b93505
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 23:51:57.4633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 f0gWRa6x6muAUq/u7YASdHOMQcH/DM0qeamsuZavS4E4Aq9ZbFxoy7oKeiaglf0hOFQlSc/w8haXu6ywkPZrpR+ZNNBosf6kZSPUXRmMLsMX2bOfvTCGv5lZN2qYxCde
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9447
Message-ID-Hash: 6WBWJICQ7I5E67RB2WGG2SLNZHVU3T6B
X-Message-ID-Hash: 6WBWJICQ7I5E67RB2WGG2SLNZHVU3T6B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WBWJICQ7I5E67RB2WGG2SLNZHVU3T6B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Amadeusz

Thank you for your research

> it feels like it works around the fact that some DAIs didn't had set 
> channels_min properly, which will of course not work with 
> snd_soc_dai_stream_valid(). Perhaps if we want to remove this flag we 
> should just set channels_min everywhere where we want to have playback 
> or capture and just remove flag?

Interesting.
It seems detail usage was updated from original to emphasize checking.

For me, I have no objection about this.

> Similar story with playback_only and capture_only, which was introduced 
> in two patch series to remove unsupported FEs from list of available ones:
(snip)
> I feel like if driver author knows that one of directions should be 
> unused they should just set min_channels to 0 to disable it on either BE 
> or FE DAI (personally I would prefer FE DAI in most cases).

Unfortunately, this is not good idea, IMO.
Because min_channels is set at snd_soc_dai_driver driver, and almost
all drivers are using same settings for all device.

For example if you use same 4 x Codecs, but want to use playback_only on
1 Codec, min_channels = 0 will be used on all Codecs.
Same things can be happen on CPU side, too. So we want to have xxx_only
option, IMO.


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
