Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8316867514
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 13:34:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CFF5850;
	Mon, 26 Feb 2024 13:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CFF5850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708950849;
	bh=b/KNwuTmx4adU7776EOETKKX7lcICc+SYF9S5cL0LEY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NrBmy4f6+dC4z+rcIoGTWY+/A+2aEen4UAdOMyxVm8EbAjj5xPwmnJTjMTCK+V5D7
	 oGZUhh9QI0MjgypSzAB4dKd3jVFwfnObRryiQR9+T5TV/5vMnbArLlsGQJEIkCNujW
	 0uVPXreUZqlRfBfnmP8z/tMlYb39TNcEVLHSxQpI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A94AF805AD; Mon, 26 Feb 2024 13:33:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D503F805A0;
	Mon, 26 Feb 2024 13:33:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06F1DF80246; Mon, 26 Feb 2024 13:33:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46777F800EE
	for <alsa-devel@alsa-project.org>; Mon, 26 Feb 2024 13:33:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46777F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GZo2KDml
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708950800; x=1740486800;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=b/KNwuTmx4adU7776EOETKKX7lcICc+SYF9S5cL0LEY=;
  b=GZo2KDmlkc6iDFMHyhNwAu1oAgNcBpX3oijZL4CakyjcCzJD/KI+6Bra
   Ztce5lxGBiDHheQsDeuMeISkWyJXvtWfnsJLJBJBD/ldCZi/eX7h4TzXt
   fBWO7Hr3QFXX9GrA5GPGh782k7k3qZ0NC+fRLJpsOFCqlVioDVVcKG3Yd
   CadnMEVJevjYMTyDnsD0ZZzXH19fUKtpFnztBsGH+wyuUXZEAEXOTqnRR
   9ZLLy1JGFGN5onKjxIZgxp7Uh8GYdDcESedlftNQELO21q5L6oh/gOonA
   IZkST4W1f70+tLVZ7tKafVuFoGNG7oTPNU0bTzneJ4oAfTZxzjtoDEJNL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="14647988"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000";
   d="scan'208";a="14647988"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 04:33:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000";
   d="scan'208";a="29832575"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 04:33:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 04:33:16 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 04:33:16 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 04:33:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1bMCi8hsZhTLT+5xX23knRCmINkAKqgxaMwhCV5yck72b0tm7N5pGVV2u20XVWfCvg9/p8QxUSyzdp3op9YxiKuKCXhmQ4UZ5ZbWun4blB5eSOmNaMhv8TAFfuSagfrMaBGFIlKtSsP6IojIHot+5/tAgK+XS8FNsxq4i2MSHEJ6t6hoNqyAEz/VefZJnUp5XwGrz+b2+NpBCZNZM1qtSvhNKaBWZLKlQMaX+/kJSPeCWzS+Xviv3KR8CQqsBUFYpziyMoc92SpCXra2RBtkICoWAU5OVSQoNQs6oiNm2z60PiqO5YeMJxrJk5VxZ5MIacChe1mtIweMkPvkBnFBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tWcjj1oWQ52TkTe2D0sIHGRJo0txQsBfaaRVeqg2pls=;
 b=NYoWPY76rG4b2Z2ynuqLiAUH5iHAsppKul5WoqHXbRBqkWUu9W07vKjWu1l6vk6uJxNsCCKiOckAyYAEUjBAb/Ot7b4s+mLRZ3Fgt0ceiP8lERelVu2+PTdWWVwkRtpJ+aeisuMCorfKlBID0hMxSWijgzNlFeL/xFe3iIszYbKf4rxg8sW8kAiPPgzzKrKjwvftTtblySoVBWAeai88z1fgGK4VIoYCtDyowubKwyj9qxxF9SGBgXtvTQkynoa3gUReE5sVYHRFwxB6vu2wnYTkR8FdK/zdvwPntQaf27wulQ0FvI28bNeefzxon91+UMNGVqylejP3aJgvNrNBEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CO1PR11MB4868.namprd11.prod.outlook.com (2603:10b6:303:90::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7339.23; Mon, 26 Feb 2024 12:33:11 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::804f:f362:1acb:f0f5]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::804f:f362:1acb:f0f5%5]) with mapi id 15.20.7339.022; Mon, 26 Feb 2024
 12:33:10 +0000
Message-ID: <e64673dd-5a2c-4e85-b819-367288f470b9@intel.com>
Date: Mon, 26 Feb 2024 13:33:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ASoC: codecs: hda: Skip HDMI/DP registration if
 i915 is missing
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
CC: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-sound@vger.kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
	<rodrigo.vivi@intel.com>, <tvrtko.ursulin@linux.intel.com>,
	<intel-gfx@lists.freedesktop.org>, <amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>
References: <20240223114626.1052784-1-cezary.rojewski@intel.com>
 <20240223114626.1052784-3-cezary.rojewski@intel.com>
 <87plwn2qbs.wl-tiwai@suse.de>
 <19f57fc4-ae64-4054-a85c-38ff37c1bded@intel.com>
 <87o7c3zdlz.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87o7c3zdlz.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CO1PR11MB4868:EE_
X-MS-Office365-Filtering-Correlation-Id: ec7331c6-021a-44f2-72c6-08dc36c717da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 KXgctjooFReG6xAidDPJOETubKmkRi3dbnagflZtbQACkAt7/LOOK4BmligtG2U3JbUemQapnizs7Q7EXs082q5uiYEKWLSjZWsaGn9VBv0D3cZU7Oi9NuWUxZXlai6XNS7zTgxNRPD1LugwK5cHAK96fVG/5uU0omYCmrHA33N/vb94tq9RwGE+kcoBGa2QWa6dOjyU9Rwge510AKjR6KGEvKUC99ud1x5pjfCZYNaPsUyHr1RQfK8erY0aFU7zWT7zlWgYmesmL/4WLXbYcs+HTI/A/uPrzNpZ4KnbGqgZIsZbCVMRRoC/xdc6RpeJZn45s2HeDjN1p7ErNC6mLJCWu+t0PCsU9zpntBYGXAhjCu8sI1+4hRlmcti19gEScrwKqSzBnG/XEg9ooU7kp+teoh+jgJDCgF4azjAbEoDbV4BmS5uo928YxqNx8jZWP6ja8pzOoWR3Rx0xhtlGj/6CSnraxVY6V331ALJ0unIiJylYjsqws8lpfCw8+JdaGeEw5p1SoTtAifZSP7NDXKDJEAu709scwGcgCPPwkMIEeZWp+MK1cZIyXM0H2Dwf8ejrjQHTEy+Nfw2NSrmfzdBZagj9CuWrvi7bJ9Jy1AglJ96lTJ/BsxtLgZ6sjK2m
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?dnFuTy9WSW96bDJmSG8xN3J3azFlZHFtMkw1NmNtS3BBVU5XQzA0c250SU9G?=
 =?utf-8?B?bVQvcE1kaGxqRU5xNVp5OFN5NVdYY3IzSTdUdGwrMUxSdnAybjhoM1Y1NnlL?=
 =?utf-8?B?Z0FlSzBvcTlKd3l0a05lTEVWNkxZc3BuY0M3OVFvbzZ2WURaWkdscDJUaGR1?=
 =?utf-8?B?SG9FcnVLbnJTb1BpczYyQjhGZk1NUnZlNHFCSTcyYWtVT3djTXl3L0lJS1BG?=
 =?utf-8?B?QWNvN2d3VXNOTVA0UnJoeTYva2Z1TGlBdzkvWHl2WnJkbnhya1ovK01PMFdn?=
 =?utf-8?B?RDl3S0hVY1FwcEE3T2tqcXpsNWJqQVpwUisrRGcxeFZZQzluZkJjcjhodDZm?=
 =?utf-8?B?R21va1VoanR2eExmQjRTbE5HZ21qaU10SDNHbEpoZkV0WG56SWRaekwrZ2dm?=
 =?utf-8?B?Z05JcnZOSUtFL2JqOCt1ampKWjNBUk1sbk1UTnBmVTJZa0lkL1FWUHNIaHFP?=
 =?utf-8?B?eklydk5lUjFoK1V0a3cxYzA5eDY5Qkk2RFNTQTVLbUdtancrTGxxMndvYTMw?=
 =?utf-8?B?YVZ4L1lZZ0xHTmg3TzRickVQUDFZTUMzN2IyMGQwWXEyZ2xHNkFIc2xzTkRB?=
 =?utf-8?B?UDhOUDNaa2c5djRPWEtscUJNakdXR1FCdUZHNUI2SGJKK2VvQWtLYUYrSDJO?=
 =?utf-8?B?NnY5VndkU3JKNG1wdS9mNFovVStkYTMzZW9DV281Tnd1bUt2c0hhU1QwbG1W?=
 =?utf-8?B?UVlzSnZDbG9Gb0M1eVdIcmRFcDJGWE5hL2M5NndZZ3JZWE9HMURuWTNoaytz?=
 =?utf-8?B?Mkdjd1RZTDUxaXJiQUxJN1ZSdFRUdmMya3JHWmJGcjJUSlZuZmxWN1U2NXRy?=
 =?utf-8?B?YTlpTGJOZm03ajIrUFBCTUdDMVlyVVBLWWdxNXhDZ01ZM2JlbW5URUM1RDZr?=
 =?utf-8?B?ZmU3a2pMT2RRNlNDeUE2M0NIOEpJQUJkNHltNlV6UW8vK0E0TlVYV244eXhZ?=
 =?utf-8?B?TWNObU9YcmZrNVY0UkN0ZVp3d043OVBTK1I3SGIySy95MTNPY20vTzBVclQ0?=
 =?utf-8?B?RXpwYTd2UHFWait4SFovWlV3RVR2UzdDZlVGenlZUUZVeDBTWjFlWmRyaHYv?=
 =?utf-8?B?cW1Jd3RiRzVKMDVrdk5xWUNReXAxclh4c1J2QW53emJsSzA1bWxzZjlvWEdr?=
 =?utf-8?B?eGVxc0hHYjlvRzZGWHU2T3JuSmhmZnV2VUlkMWJ0TjBJM3BmQ3B2Y2lNWTZM?=
 =?utf-8?B?NlF5V1A0OW5RNjRCNVdQeWhPdEhtRlZHcy81THRJbGorTWVNVDA4SnpjbDd2?=
 =?utf-8?B?YVVRN3FlNHVMUFVRUmk4M25rN0E3VExvNUF5QUIrak56Q2IzOW5FZW83M3h1?=
 =?utf-8?B?dmd2MytVZmRYNGZnUjNPcVNwTXFIaTJKSnZTc216bURObnNraEkwRlhRV1dt?=
 =?utf-8?B?M1ovQzNCWjVxVlphVlA4WTc2OXFCb0kxZ0cyVE9UV0kxalR2bmkyd0JDYUVW?=
 =?utf-8?B?TmJyVU54d3BLeUQrd0dFcVlYMzZDTnY4VWRZVzBZVXZFVkYxb0tkdE0rUnZj?=
 =?utf-8?B?M3JzWSswU2ZkYzhjTGNsT00vS0ZKeTQwakVvMGRwYVUycWdWemdlVlBxb3Rn?=
 =?utf-8?B?ZkdyVEJaK1BEdVhqZFZldzg4Y2RhOGIwZXZ2djBrWmFmMUMwWmdHMFRCNXp5?=
 =?utf-8?B?MlhHY2pTRXZVY2ZWL2xXdkxuUjRYK2JXdkFiN1oweFFlNHlHSU93clI5VE1G?=
 =?utf-8?B?bnFaMm9oMmRZdk9xUlVqWDlNdDhZRlFaZUpEcFpsb29zdlorT0tGR2c5eHRK?=
 =?utf-8?B?WGRnc2grcDd5SDlYTlJ0NXQwOGwrM3F0eVNPU0VRc2llTXdRSmxvTk1PSUFi?=
 =?utf-8?B?ZlJjMER6SjUzSXZwa1dTTlc2NDIyck16SVlCSzVNWk1MSlpvb3BXRVVxZk9l?=
 =?utf-8?B?c0dCcTJLYjFyWTc5QjdSSkVmOUh3cEU5Zmw0SmxJSkJ4dHNqb0Y3TWljMm5o?=
 =?utf-8?B?K0dGWXRmWk1HVUZsbWZjdllKRWZvN1dxYkdQcXMvc2xwU2VpL2pxaDN4amsr?=
 =?utf-8?B?eDZON2VnS0RjR1lMZlZxUHEzN0ErRk03U2N3MWxQYUlPTVIxVDhhUVc5d01S?=
 =?utf-8?B?WjYvckZSUDEyalQ5dmNaTXFmU0ZHcC9IRzNJdnpIcWFzNUNna3EwNi9TZGNM?=
 =?utf-8?B?WThiSmRDUklyMDFmTUovL2c0ZEZmY1ZzOU5NYTUwcEVBMnV1bTdOR2FSMjFQ?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ec7331c6-021a-44f2-72c6-08dc36c717da
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 12:33:10.8526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GQreqmkS7uYRN9gZ5+LUBc0p4cDE8LjXwQZKKo/VZO5DeWE1+BeTq4iml6Kz6Od5qWdCLu2AI++TiLZ7WHIvaYx3rIAbCwJbXsCBHjopIus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4868
X-OriginatorOrg: intel.com
Message-ID-Hash: 74CKBEWJTTXRN5C7P5OFN2E4HUC7SZY4
X-Message-ID-Hash: 74CKBEWJTTXRN5C7P5OFN2E4HUC7SZY4
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/74CKBEWJTTXRN5C7P5OFN2E4HUC7SZY4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-02-26 12:09 PM, Takashi Iwai wrote:
> On Fri, 23 Feb 2024 18:09:59 +0100,
> Cezary Rojewski wrote:
>>
>> On 2024-02-23 3:44 PM, Takashi Iwai wrote:
>>> On Fri, 23 Feb 2024 12:46:24 +0100,
>>> Cezary Rojewski wrote:
>>>>
>>>> If i915 does not support given platform but the hardware i.e.: HDAudio
>>>> codec is still there, the codec-probing procedure will succeed for such
>>>> device but the follow up initialization will always end up with -ENODEV.
>>>>
>>>> While bus could filter out address '2' which Intel's HDMI/DP codecs
>>>> always enumerate on, more robust approach is to check for i915 presence
>>>> before registering display codecs.
>>>>
>>>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>>>> ---
>>>>    sound/soc/codecs/hda.c | 5 +++++
>>>>    1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
>>>> index d2117e36ddd1..d9e7cd8aada2 100644
>>>> --- a/sound/soc/codecs/hda.c
>>>> +++ b/sound/soc/codecs/hda.c
>>>> @@ -350,6 +350,11 @@ static int hda_hdev_attach(struct hdac_device *hdev)
>>>>    	struct hda_codec *codec = dev_to_hda_codec(&hdev->dev);
>>>>    	struct snd_soc_component_driver *comp_drv;
>>>>    +	if (hda_codec_is_display(codec) &&
>>>> !hdev->bus->audio_component) {
>>>> +		dev_dbg(&hdev->dev, "no i915, skip registration for 0x%08x\n", hdev->vendor_id);
>>>> +		return 0;
>>>
>>> Should we return success here, or would it better with -ENODEV?
>>> IIUC, the code path is from the early hda_codec_driver_probe() hook,
>>> so returning an error can work.
>>
>> Good suggestion. Indeed attach() is called by probe() which treats
>> -ENODEV just fine.
>>
>> There is a consequence to that though. Logs from LKF show:
>>
>> snd_soc_hda_codec:hda_hdev_attach: snd_hda_codec_hdmi hdaudioB0D2: no
>> i915, skip registration for 0x80862811
>> snd_soc_hda_codec:hda_hdev_attach: snd_hda_codec_generic hdaudioB0D2:
>> no i915, skip registration for 0x80862811
>> snd_soc_hda_codec:hda_hdev_attach: snd_hda_codec_generic hdaudioB0D2:
>> no i915, skip registration for 0x80862811
>> snd_hda_codec:snd_hda_codec_configure: hdaudio hdaudioB0D2: Unable to
>> bind the codec
>> snd_soc_avs 0000:00:1f.3: failed to config codec -19
>> snd_soc_avs 0000:00:1f.3: Codec #2 probe error; disabling it...
> 
> Yeah the latter two are basically fallbacks, and I guess we can
> disable them for ASoC case?  An additional patch like below.

Thanks for feedback, Takashi. One of the design philosophies for the 
avs-driver is to avoid any 'if (bus->ext_ops)' statements if possible. 
This is to keep runtime flow of snd_hda_intel and its DSP equivalent as 
close as possible.

What I propose is: address the problem directly in the avs-driver by 
ignoring codecs for which probe_codec() returns -ENODEV. The TLDR of my 
previous message is: we do not want to do any kind of recovery e.g.: 
HDAudio controller reset if there is no supporting driver for given 
codec. Will sent a separate patch as part of v3.

> --- a/sound/pci/hda/hda_bind.c
> +++ b/sound/pci/hda/hda_bind.c
> @@ -279,6 +279,10 @@ static int codec_bind_generic(struct hda_codec *codec)
>   	if (codec->probe_id)
>   		return -ENODEV;
>   
> +	/* no generic fallback for ASoC binding */
> +	if (codec->bus->core.ext_ops)
> +		return -ENODEV;
> +
>   	if (is_likely_hdmi_codec(codec)) {
>   		codec->probe_id = HDA_CODEC_ID_GENERIC_HDMI;
>   		request_codec_module(codec);
