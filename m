Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 886FA8B1A5A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 07:35:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 930FFB71;
	Thu, 25 Apr 2024 07:34:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 930FFB71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714023299;
	bh=Ggwep8nMiwo+Aglr5IHs10LnuxmS/+iA9rpz1tsfgEE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e7+xzX2JHK+Dx3b56YrFbfl1kMAX4KBpXKYBuP3U7dMQrveHSn2bR0Uvt0cFhU+nw
	 UlXWZekF3zRYyLL0GwRtRZ9gQvki4MNH47k0nqslHvwUCOw6MCFdGMa5Jk4zHmwvHs
	 C05hfbs/qK9LBDgw8MJNXZuq+3/WwTYUlD2OhLT4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80C42F805AA; Thu, 25 Apr 2024 07:34:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D02E3F80568;
	Thu, 25 Apr 2024 07:34:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06E30F80423; Thu, 25 Apr 2024 07:33:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBEBCF800B5
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 07:32:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBEBCF800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Z4xswkO6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fe+1gZjnWDPaVaaxqslIxn0EWp6H+tMQ3xOS/6HQWoCXpsnqlA84HGQD08TKBRC0yZX/2eYPya93Qk6dtEaos1c6Gnh3JAEIblc5WZSPGtg9uLENDOXedFZZBKJymTZrJoazxBLd/v+pdRfRMKLpn+dRHwjd7LbiwOaQ4Dt5i67dtcnFyzSGI2Cn6IN4+EsDvq9ErK8jl+zDtYR/oKlSgF2O1lQPZT/kw7Cy3YyfHtSr77IXUhhvCERy+ll9WDcKYBdFl1/7TWvbvxMU/B56htZ6IehMWklam4LUr7VyGUmIVQhcgIl2UMb3I/4tV4Q14jeb6bfbCAJdXiJa1xed3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOpXbb1cyYk77DpU2X8neU1jMem0/+GMcVgwFq52pQI=;
 b=X+3zaNT4HnSMzJ2Xx7HZoN9azZkS7VTPu1JINqvZSYFx1uhby+KWGcrjKMw+aREyd1Y6zgxS/UunkjBj7hXwfcBmXpGZ/3UF+o9fm23UPmP9dpH84tOkrgJ7xxy6eBvgGSZbk2qiKCIUYceqEN4aTaWMCUE0/jTOO3tkBFcyVgCSQ1K+ytXQ+h1mzN4rAPSfikmkbYPjuVj2YVS++zDhivjOeokCmLAOgcYGDtqL3qltssBW8k/RxCJsJrjxJqTlcttVENkjtTcBUbtSqAiriqpvr+do1fZF2SThDmvIJjqC9suCZAXpYQA7qt4gsV72BWbf1/XdGa+E4hhJXFQ2aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOpXbb1cyYk77DpU2X8neU1jMem0/+GMcVgwFq52pQI=;
 b=Z4xswkO6/SRBaWJLFTc/p5b/nVLgf8L7ZhSfTxg2q4TyXRxdwcfIjG9ZDmIJn39Qjt5EZcMZ3agOneqRRdkO19ljXRPP28bBVJWEDatqpcsZwQ4C4Mg9Bm+VjuIwLy7Mbm6t0FYIWNDUUg8GXNS8Lv1SZCyV2Vun9/AE7aaevSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5508.jpnprd01.prod.outlook.com
 (2603:1096:604:95::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Thu, 25 Apr
 2024 05:32:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 05:32:38 +0000
Date: Thu, 25 Apr 2024 14:32:38 +0900
Message-ID: <87plueovm1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 01/23] ASoC: soc-pcm: cleanup
 soc_get_playback_capture()
In-Reply-To: <87h6fsisn8.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
	<87frvj8g2v.wl-kuninori.morimoto.gx@renesas.com>
	<a1f63065-6d8a-404f-b4be-331d829f802f@linux.intel.com>
	<87ttjytayy.wl-kuninori.morimoto.gx@renesas.com>
	<92054f87-dded-4b66-8108-8b2a10909883@linux.intel.com>
	<87edaym2cg.wl-kuninori.morimoto.gx@renesas.com>
	<93294e52-97e5-4441-a849-867429da6573@linux.intel.com>
	<87h6fsisn8.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYCPR01CA0183.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5508:EE_
X-MS-Office365-Filtering-Correlation-Id: 4882d7d6-8e9e-488b-a415-08dc64e91e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|52116005|1800799015|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aOiuQEhYCVDlZMMxf791q9TPVPmD94GL/djpXUFHo6TQuft31YAIv5++vYBI?=
 =?us-ascii?Q?xyp2tBEUHYQ6EVDPF3fqsqaVkw5ZXbyTV1Pyf37Hj2jCdA9PWZO6EwgHH423?=
 =?us-ascii?Q?yP3gk+ztw8Qxk49g6EaW3zRqnvgtQN7h6C5dUzpKhGK0SBmIrGUFEJR91B8A?=
 =?us-ascii?Q?eLPUEFgLrjouY18/VvsA88tc3N5Pg8jLah2qENqxtbOC5OhQwUU5ZiiKE4pF?=
 =?us-ascii?Q?8pZfTAO2LTbqV7eeB/uf/CZdx7jzCO6l0slKCahVKBuGl6/OFgi/m6eYflSN?=
 =?us-ascii?Q?+vcCCK+X8d+uuVM+CzzCWofnicfr0DFxiFI4G+ynuYHUxneJG5RQhYx5iUGi?=
 =?us-ascii?Q?voWgy+yku7fOMq1gEUBI5m16fVG0ZFvicRDD+63TYbmA7dzSXzUEROML7J5u?=
 =?us-ascii?Q?O8Cp2UjYKaTs0nxxYxvNXAgp2soOIbMTooaNYRZ7bYFPCIRf+JO5C9qlSsxr?=
 =?us-ascii?Q?F/8SXN4SY7zySUAIHfJe5lnvRfDyaMO+FIjOAAJaFbRsHIejQG+VCl9UPkQN?=
 =?us-ascii?Q?/2hMZ/1n+KGyT0IXjKcevNwo9NApA3R3p35s8jGmj2XWKvVZed+B8bFjfVyT?=
 =?us-ascii?Q?6TeWwS04YYLZZPDOG0tuaNkMqtOlaACBGAx79lLkkg8Y43gkuLX9lgxqFQtS?=
 =?us-ascii?Q?3VlCcwLZbER7315z8lnKkf2f/unRqs1GmPji7eGoSMTadIBQL/H8WutODE7p?=
 =?us-ascii?Q?iWeRs/gLg7QSgBPlNJzEMCjs0Xl/u6t6LZgDi34sb39j0NIIwayo4xey/Baj?=
 =?us-ascii?Q?htmQg3dhwh4sk61NxUncl39laWIh7/4GB5/uHy0OBaDvXI90JdKaMWQrz3a3?=
 =?us-ascii?Q?8pbgOTlPJk2YByOlqVrZFR+Ygix/ONMirgJe/numDHwK3tIQPDS9QoCK09+K?=
 =?us-ascii?Q?lg1bjEPFDxHhIdgXeo5yoncYTtwYkiZb5x6WSYYa6IDJPnzcphck0hXqbeiN?=
 =?us-ascii?Q?8QhlZeD32X8pnRhPWIeu+4qZR7ES93Hkl6Mlxqe+2Sywq0EuH+i8/zRQ2uTi?=
 =?us-ascii?Q?em9zZQ9Fv9neDjdCZ4T4Kgn5CQCaptEfx1U4BmEZLw0dKoqmbjyARxWJmQ+E?=
 =?us-ascii?Q?NdF18olhywejqcMmUA5Dyr10amXm3uxQ53SyLoaJJbwcllVSAgXqcFnD2udz?=
 =?us-ascii?Q?1i2DF2ewSz9sWjiue2scK6vNqjA6/7TMdqMZD41/1lCYf5vtkZVjXXaWzLM8?=
 =?us-ascii?Q?NINkjor96Q1IAmjQz1M9lE4SdX49Sle9cAVg9O8f/yGneid6Rs4hya6e/liB?=
 =?us-ascii?Q?BFn9diC6HQNlsZ6FxJcpJjfhxpkrUIpb/sZaoyR7wQz9HubNrQIk8oWs5RvA?=
 =?us-ascii?Q?ossJ0WzVrhqhF2MEuTPpacZBakBs+3u4CGMJe2WjidjXRg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(366007)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BS/SSje9yyWzvgupKlKxBg4Dj2PZ64GNZT/1CpnPf+Dc/b3hYUE8e18PeKKA?=
 =?us-ascii?Q?LKbA4bVcMb4IsHU5W0oB1StKpQPlInGRXgb0uCiA+JvNXOzWuEtbCOFg8cxx?=
 =?us-ascii?Q?ZtHxIy4qe4UFVjY1mWLK+sd5moQSUaGm3Of0FU4GTa3h/N63CIfdRZIUlvBQ?=
 =?us-ascii?Q?XCS3mXkBMHepEH4UEe/i3xRWrl6MPJ/QomAoq1RwOdmS/jJoHIMHWnmWdJCR?=
 =?us-ascii?Q?5rp8wSP9f30PrXZKsyDu2NLGsr+gASz/Z6MeCFYb9swiJllQ3qkT9xb4z4+z?=
 =?us-ascii?Q?2vK6gTkpMfV9Os+YNY3jMN/QKbXtrH2G6hcmojOwdXV0XTxxHUQWDqTpV4m7?=
 =?us-ascii?Q?1YVOUwno1mvIOA9iN3GTGwR6jv/WQn1cbMVNzxGtUuz5PwwMXhrgats0olSZ?=
 =?us-ascii?Q?rvd5iICqd39CiFS+MjaLTfwyWSN8tG70WaplaRI1ZGHLE/doSCM0EPQRv8jg?=
 =?us-ascii?Q?jehWt2y0Su5RmckQmPmVspZqgSFfo23sQcugtgLl7E/Ia7IWZ29irRDZuEcR?=
 =?us-ascii?Q?G+XjXVsBPUpDk7JmCm3txqO7hfxFlE1lEYvG92Zc+TwjQt8mDaffGQ76G4kW?=
 =?us-ascii?Q?k8CFpAO1rRdzTpgf8viYXH5ZzJe++Ez7bvWeiBNoSbQudYPRCrdtglk+UCeP?=
 =?us-ascii?Q?v4FISKcaugNoWs8Ys1dpaTgc4czo+dAGi4r13hS0vzmT6oTmYK3cR6QHF1dx?=
 =?us-ascii?Q?FDxU9oehCFYGbxplRBjxBbR5UkE3xczxCVzQ7K9G6FTzxt0BsLs0YEPt/Wy3?=
 =?us-ascii?Q?ZXsTRhnMRW/Ig8F/kyT3kGBGM1FEE4QGWQNTedw3yPbHYCag7MHtFuafwEgn?=
 =?us-ascii?Q?oHs1dAAky6tQBlpV2cl+5VPHCLvjpmy1USVoA2XpmLWS58T8FayDaStO0ph0?=
 =?us-ascii?Q?3TxhI9MWHPlGtNl5Zht6d5U7alOxRpu0EUZjqfE3GrhZO1FHUGeY15vCdYkV?=
 =?us-ascii?Q?okq7HK3bJWi+UhKqbAQk2gKIgIkX9djFGSjprsRtIHfWu302wQMLC+vnjOU/?=
 =?us-ascii?Q?oxL7zTcvODsGlSRzQVX3iezK4+8OUkBJlHXhO8s1VEktnu6AvZu0io7t2Vjk?=
 =?us-ascii?Q?IXYqw8YYzhFdKvWs9TwxZKaVDMBXLaRXKa3x4uhEKnX3R+BDSEisA9KDutHt?=
 =?us-ascii?Q?A6cAKdkBBtG5vsA1Ytc++d3MBbg+FLtBbmWm29ecIEAkQEOzc1nagCBcOplN?=
 =?us-ascii?Q?5+VX2/PabwrCqSjhE67DiOgfvOxZLC1Cm3+1hZhpLYK9gdI9YfXNf6tuYbB+?=
 =?us-ascii?Q?XFHWb+tsJpurGdrr1kr8Wy6pEmQzLF3NQ6ozQ974aJdW3iR4MpXaPXk/DtnX?=
 =?us-ascii?Q?mj63pUa93vXSZ+OZYhAhjLpX6GsQ6tPxjU7CJXgt33gCpg+FSyH6Lie3WK0F?=
 =?us-ascii?Q?4Tw9+7x5fEywPCSRxTFPLxKcnATKu9AgYItUN+6TyAW4FO1Zd5hL8gwgOPtU?=
 =?us-ascii?Q?BBKcc+w9J2EgaoMnS+57SR84u5W9LhmyeyAsVaH27G7Swx5niGJCzB5r/yCe?=
 =?us-ascii?Q?S06FcrWJxaptVp3N1UGFLEznuPSTGrEfVf55tbeN4aM9kAB61jq56jYaZKfE?=
 =?us-ascii?Q?5Bo2i+yW0iclwwhAvS6/qBivJczmmgmapv4HidPznNo3mBxkvqLzoRHUDdHl?=
 =?us-ascii?Q?7Vsl64LbyWKA7B4G4MNkoKk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4882d7d6-8e9e-488b-a415-08dc64e91e8d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 05:32:38.3957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +57Wl0/uZM22hG1CsQ4FUO0hOVNmjMsLBzZAezgrvE/twO0V2/XeX0VwHQNxOG3oF9Dc9C+4HzVZ/3n4/R3AmSNAf7DyGUbICdxRlEcn0YWe8X6/S+oOFDcxJneaLQUh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5508
Message-ID-Hash: DJTKHDX5YA3FWF3COSH7BMD6CHI6BA44
X-Message-ID-Hash: DJTKHDX5YA3FWF3COSH7BMD6CHI6BA44
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DJTKHDX5YA3FWF3COSH7BMD6CHI6BA44/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis, Mark

Because Japanese will dive into long vacation since next week,
I want to post mail before that. I will back at 7th May.

> > > (B) commit 1e9de42f4324b91ce2e9da0939cab8fc6ae93893
> > > ("Explicitly set BE DAI link supported stream directions") force use to
> > > dpcm_xxx flag
> > > 
> > > 	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
> > > 		playback = rtd->dai_link->dpcm_playback;
> > > 		capture = rtd->dai_link->dpcm_capture;
> > 
> > The reason for this (B) addition is very clear from the commit message
> > 
> > "
> > Some BE DAIs can be "dummy" (when the DSP is controlling the DAI) and as
> > such wont have set a minimum number of playback or capture channels
> > required for BE DAI registration (to establish supported stream directions).
> > "
> 
> I'm still not yet 100% understand around this "dummy" DAI, but is it
> *not* soc-utils.c :: dummy_dai, but some original dummy DAI is used
> somewhere ?
> 
> I know ${LINUX}/sound/soc/codecs/hda.c :: card_binder_dai is one of
> the DAI which is used but doesn't have channels_min.
> I think it is used as BE "Codec", but code is checking "CPU" side.
> 
> Do you know what does this "BE dummy DAI" specifically means here?

	(A) : checked CPU capabilities
	(B) : uses dpcm_xxx flag
	(C) : checks both dpcm_xxx and capabilities
	...

In my understanding, in summary, this dpcm_xxx flag was added to rescue
dummy DAI which is used on DCPM BE as CPU at (B), because some of them
might not have channels_min (This "dummy DAI" is not same as soc-utils's
dummy DAI). Let's name it as "no_chan_DAI" here.
In this patch, it was added as "mandatory flag", not "option flag",
thus all DPCM needed to use this dpcm_xxx flag.

After that (C) was added, but it was contradiction, because
it checks both dpcm_xxx and channels_min.
If my understanding was correct, original "no_chan_DAI" was supposed to
stop working, because it doesn't have channels_min. But there is no
such report after (C), during this 4 years.
We don't know which DAI is the "no_chan_DAI" (?)

Possibilities are as follows
	- No one is using "no_chan_DAI"
	- "no_chan_DAI" is no longer exist : it was removed ?
	- "no_chan_DAI" is no longer exist : it has channels_min ?

If my expectation was correct, we don't need dpcm_xxx anymore.

But because we have been used dpcm_xxx for 10 years since (B),
I understand to feel anxious to suddenly remove dpcm_xxx.
I think it should be removed anyway, but want to have grace time ?
If so, the idea is that we can use it as "option flag" instead of
"mandatory flag" for a while, like below

	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		playback = (cpu_dai->driver->playback.channels_min > 0) ||
			   rtd->dai_link->dpcm_playback;
		capture  = (cpu_dai->driver->capture.channels_min  > 0) ||
			   rtd->dai_link->dpcm_capture;

* maybe we want to indicate message like "place re-check the flag and
  remove it" via dev_info() if dpcm_xxx flag was used ?

I think +2 kernel version or so is enough for grace time ?
After that, we can remove dpcm_xxx flag.

When we consider it very detail, above code can't 100% keep compatibility
if the user have been used this dpcm_xxx flag to limit availability,
for example in case of DAI can use both playback/capture, but it had
dpcm_playback flag only. But it can use playback_only flag, instead.
But it is very difficult to find such DAI. Each user need to check.

I personally think that remove dpcm_xxx directly is no ploblem, but what
do you think ? I'm happy to hear any opinion, and happy to create
grace time code if someone want, but if there was no comment during
Japanese long vacation, I will create patch to remove dpcm_xxx directly.


BTW, I would like to know detail things around this topic. I'm happy if
someone knows it.

* Why dummy DAI doesn't/can't have channels_min ?

* Why it checks CPU side channels_min only when DPCM ?
  I think it should check both CPU and Codec.
  I could understand if it checks FE:CPU and BE:Codec (it is assuming
  other side was dummy), but both (FE/BE) check CPU side only...

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
