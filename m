Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B493895B7C5
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2024 15:58:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED479829;
	Thu, 22 Aug 2024 15:58:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED479829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724335120;
	bh=9AOuMgCVSouGhUzGGE0W7FUb/JLAhW0DjorJaEcNBOo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JEP8qNY5U4q35sSx2OyQpsZ1dUhimymdCrG8P7qnDtk8ugpgjrNYDfzQByYwsnUJO
	 lktRZVfBDT/Z3xdCpTbEuk7dAVhQqroEUUGqUqfvSDQs6XAXu1RTLfDUsyE487vmua
	 2GId0+RKv3j5ju5gJyCZptEh3hW4v3triV5TmmEo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1510CF80496; Thu, 22 Aug 2024 15:58:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43776F80496;
	Thu, 22 Aug 2024 15:58:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2E5CF80496; Thu, 22 Aug 2024 15:57:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D961FF80107
	for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2024 15:57:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D961FF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BVDyfwVi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724335058; x=1755871058;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9AOuMgCVSouGhUzGGE0W7FUb/JLAhW0DjorJaEcNBOo=;
  b=BVDyfwViXpihsjnyBiIeoCb35uCoQwfND7J48fxE8iyHhyN+CAB+yUZl
   rYWewPymqLeRYRUpg7bIgakhMQkrhlhAlKIiymnZKfpXP/newmtqxU9PC
   nTMH/1/QM9yOCCjWomJ1dEIifJBRXn6u08iF1JUgxZs7fP9ge25TeYHmT
   byy/KiEZWA9AuPzovOQMM0gMOrrcfM6yhR/m0ujfb3AlqZXT8K4wbBPBK
   9F0v2F++E6iTGI+AXgAhSLygvTJuD19UiZ8JxDzeCmQtCvWS7uWF632gT
   5Rv9wMkGOm2OZBwFpSp+q8ujv9wpaKZVeBDKsXdYnPCxkP+mjdeCjyjZL
   Q==;
X-CSE-ConnectionGUID: AW/M23kCQja6d0SHUZjOYQ==
X-CSE-MsgGUID: +KqVBmenTDa/JjJsgY6FvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40259306"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600";
   d="scan'208";a="40259306"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 06:57:32 -0700
X-CSE-ConnectionGUID: 4h1YVZrmTFqIFIVJ66h0FA==
X-CSE-MsgGUID: VY6YnC6rSMyAWjkk9u1yCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600";
   d="scan'208";a="84621422"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 06:57:32 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 06:57:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 06:57:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 06:57:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOP+put49G8CN1F+UQp9iZ9WXMaqRU73l1Tf+GkFetAa6V5hDGbIqpKIE5LGBCs0q9uvSeEpA5uw1ZOgcFUwijNr5AlBMzyGBwBM+smo+xxN1tpvC98izCjALWQRoVsC7xwF//R7VfHMidHCsfEVuSWWOGy8dlu1hvTULJEzfuo7bmVhPCxphi/u+LvDQ9mXrtspRH6mq2QJNkRsholCFNm/1nWqo6/Gy80HEF0A6PlEaDcYmuikFOS3iKF94p+weAge+Kpkyx6wXkex9tK32gEL9hf8omQ7G/JIpRCL8BzsQIa76c6U4hIQJ7VdUB8LDDeU85iirOHUCsgE4LIb1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDpS/bKDLRo0jNU/Kxw2+SkS0+9Xb/T8InPQrlfrQOI=;
 b=T3NlASVqS7vq2zNz0C8snR/L8koZgOrQTbXUUBSWvJ4DFkiRv0t+gkvYkLTYFWTy2qZz00c+bLB3njNuvyF7AnwjVlLqyFQyJaROymCYarPGMlLL2ay/CfM9ow7Oct3PawQJ5Kvksff0jln7RZ+5MQ7wUwgolDaurodfhk5HH3TVAL0x4y+LyxBUMnoULnjyypUG4C03j8CU933GEH7PMA1Ai7sRUbTeI+tVLYLHyXpddHenSjl0+fHDi21sTNtfibjqi7IvuxrN0V1Lntf7qM3Bmp5IW0iEyAqb9Adg3qoPYbCBJwO4aSNSZkcqtnsfDo3LFLLwghoyHBhGAIo1vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DS7PR11MB7806.namprd11.prod.outlook.com (2603:10b6:8:db::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.19; Thu, 22 Aug 2024 13:57:29 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%7]) with mapi id 15.20.7875.019; Thu, 22 Aug 2024
 13:57:29 +0000
Message-ID: <d5db8a15-64c9-45be-8f8c-977fd5ed282b@intel.com>
Date: Thu, 22 Aug 2024 15:57:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] ASoC: Conditional PCM support
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	<broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<tiwai@suse.com>, <perex@perex.cz>, <amadeuszx.slawinski@linux.intel.com>,
	<hdegoede@redhat.com>
References: <20240821101816.1494541-1-cezary.rojewski@intel.com>
 <83f81553-6dfa-46a3-9ca2-d42f54295eb1@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <83f81553-6dfa-46a3-9ca2-d42f54295eb1@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI0P293CA0012.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::20) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DS7PR11MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 06e555f2-5503-4b35-b506-08dcc2b25c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
 =?utf-8?B?MnVkdkJla1VZNzBYL1h1VTZIbVNGbGJGUHdEa1h1VlQzZ0dwY1lzRDRIc2tU?=
 =?utf-8?B?L28wL1NEMkJiK3g5eWNNTWtkYXpMemI2eHVkVW1LRjUyVld6QVZLVmdUdjlO?=
 =?utf-8?B?d2hPOFh4cFV5QWRaYW9CSlk2aDR0NUMxYUM2MFdQU2F0UjZzaXpCK1pMZ1V3?=
 =?utf-8?B?d0dtOXM0cG1IeW95SHp3c0MxYjMwNUdWM1c1RUVpdzJFUVl3ZUFCR1orally?=
 =?utf-8?B?RzFIcXpHUDYwZ21mRjJRUEhISHovM3pwUGdoZVN4UWFpZ1ozY0JQQ1F2VUZO?=
 =?utf-8?B?R3JzYTNFYTViTHkrQzM0QSthYTc2QitMdE9PaCtNcE1icXlNUVMyVU42bUh6?=
 =?utf-8?B?VUV1cjJUVkJNWm13NFRYQytBVmkyTUIzSVRtMzJ5STUvaXRRUTJ1enNIS3M1?=
 =?utf-8?B?OGkraEgrNEIyOHA4cDVlTkJYcWhESlZqZ1lyaXZTL2w1V0VHSG1Vc3hZcG5h?=
 =?utf-8?B?aHhEamtBdTdBcmU5aVU3THBlSkp2YXhvWUx1SWlYZ1hGbjRtZDV4Z1Vodisz?=
 =?utf-8?B?eGxLcGtOcy9CbHFZUllOcFRUeENUWDV0UytTYzVaUzNiMityOXp3cy9ISUR4?=
 =?utf-8?B?S1VLN1NTdzA2VCt1NFF0NkxoM3RuWHZHcEUrNWV1a01UUzVuTC9VNmdsMlJt?=
 =?utf-8?B?OFlwZFNoemlRZE9yS0tqaG5iQnRoNzJwbitQaUZmMUtyYkFZRDQvOUdSbStX?=
 =?utf-8?B?dDkwK3NmY0JLVXVyalVOcXlwcDlDTnVOUWRyVXdsb3RDbkI1eVRhTUpkTmdF?=
 =?utf-8?B?MXVDU0pyWmFHSUQyN1NER041ajFMWTk5ZmN5MngxTzN0R1RyVWxzN3dBb3Jp?=
 =?utf-8?B?UzlRWVBUYUxqbGcySEIxMFFkdkdSbUtyUFR6bDJZNnc2M0VXcWN5OWs0VW1T?=
 =?utf-8?B?cUE4WFB0cFZrQnJycm1pelF3RUdLaFJuTU9rTUNHWWlJRDNxZUgrU212ZFFH?=
 =?utf-8?B?WUJOanYrU1FwMHRDUk1oSlp3Sk5ncTFVUWhoeXZnQjR2RWZhWWp1ckpUZU1o?=
 =?utf-8?B?UVJxMmNqbll3cXRja3VZcWE0dGdOTHJkYmp5K0plRUFwQncwY2hEMktTQXR0?=
 =?utf-8?B?NE5KUGExS3BSSlMweDJEcDVhaXhpSmNxMk8wTmVPaWl3STFLVmZqR1VkZkM0?=
 =?utf-8?B?dDNGODFIelBPRkFXNWZvTEt0eFlwTHI2YjIrWHpOdnRjNm51a3E1VlZIenVP?=
 =?utf-8?B?ZEVTR2dKNWM4NDB3S0phbzJVdXVZTm1sd1J5eWM4dGliazBBS1lmQ0p1cHJE?=
 =?utf-8?B?L2tNNmxBZE9XLzZiVVB6ZFpQYXdhVEdFK1BrV0t6VERsRGJoalQxSGhTOWJG?=
 =?utf-8?B?cStORy95b2xQV3hqTkxGRnVDRnNpQnk0SktIQWZRMlJWNE1haUlmeXl4SDZW?=
 =?utf-8?B?eElTYS93cE1rMVhYNzZhaEtnTm1kODZ6ZlRDUDNISytyMjYzSmNsYlp4S2Fa?=
 =?utf-8?B?ZzBTUHhINmRSak9KcGNNQkt5cXduQ091VGlKeHY1UlNVbzlpR1pONUlmOXVz?=
 =?utf-8?B?UC8zcmExRWhRVjY1cHBsRXdBR3c2ZG9ZelNMUERFeTBGNDY4Z1N5bWdaZmcz?=
 =?utf-8?B?NDNuZkdrMDZhVVFqTWVScWxxZVFiN3FOU1Njd2FSTis3RTIwaTNKNmV0amRh?=
 =?utf-8?B?MUpiZk1kS0ZNSzZQL2ZEKzRHWHFRZWp6WG91OUYvMURkMmJydHQrcEJtTGwz?=
 =?utf-8?B?eXFrbGxkR2dVMlVuQ1krT2NaZ21xSEwyY1VrVFhHZDF0SkJPQjhIcWhqUzdm?=
 =?utf-8?Q?gAeem4iT++R4+V31eQ=3D?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?SFZYbWQ4TERwSjl1VEYrcG5qcDZ5d2x5ZnoyQWNETVRkcVpwYmxzWnY2ZkNK?=
 =?utf-8?B?ZU9iakVaT3VJVk9yZEtLc2ZDcjZZOGhLVUhaVDdnNWludW8zdjhqS2ZvQ2hv?=
 =?utf-8?B?UlhMc2hBUFN6TUpEYi9OeklTSUpCbU4zUXBaYkp5cFVjaHg5NkwraEVyZ2sy?=
 =?utf-8?B?aU5xS2ZEMTJtYllhYWpFZUJSRFRQQ0ozK091Q2VKcEQrdjQ1U0VoUU5GaHZS?=
 =?utf-8?B?S3RZK3VXN3JTRDF6VWxGRTlsSHhiSEsyajN3dWZhL2dwRFNheU5SRzUveUV6?=
 =?utf-8?B?V3IybVpneHpGbDdpNGRwNXhpMlBCa3ZneTBnSVNNZWFid2k4L3c0RFcrcUVS?=
 =?utf-8?B?bUVxdWYvbU1FTXhRRDRyemJRb1QrSkFpd3htT20zSWFnQlBraXVaWVJjMkEy?=
 =?utf-8?B?RXVXaGVKWVArS1JGd0Y4L2EwQjVURWJrcWZwVG9ZZXc5dUNLRmdLNEJuRHdl?=
 =?utf-8?B?OENyeWdVcjh6MW14eGZtOUhvekdwbGpBekZiMkQvclhFdEpSbnFVdFMrM3p0?=
 =?utf-8?B?bnJMRm5aVUFrMWRlUXR2QVRyYlFiNFpQelBhZ29yZ280VGlaNHRsQ0xnbHAr?=
 =?utf-8?B?cC9ST0c1c290YjNvYm1sVnVheFo2MTJxb0lsYkhaVnIzSUlZS0t4RVJwcUZQ?=
 =?utf-8?B?MWQrc3lrdTJYYkxRNHp6NHdLT0VzOEYvT1MrZUdWa0QxN3c4TDBJTDRZWm9y?=
 =?utf-8?B?V00yRjMwbTN2MHlWZmdrQ0hHMjRMRE9Ja29HcFJCRXNuQ2tkY1pxbzNua29r?=
 =?utf-8?B?eEpaMnpITGN5ak5PclVDWXhBK3ZXMk8vOUtVczlYYWE4N1dWY2VxZlV0MG03?=
 =?utf-8?B?L2p6c1d4VkVYYXZiRmxzOVVoNzMvYzNoMXJkUGhPb3VWMkVCQUhWVTVObktz?=
 =?utf-8?B?RFNUK3JOdE5zUkZ5NlQ3OG5vYVdjN21mOWNHS3l5OHVhdEU2Nnc4YkZKY3BQ?=
 =?utf-8?B?R3NXbzBrYU9yclpIWGRJWTFVclA2TjJUeHV5OVNOSFRBeVpkYWxKNC9CSkZp?=
 =?utf-8?B?L2oxUHErQ29tdGlCN0ZQdUM2SmlzeVBURmZsWEpLeG9MMElMc092cThWczF1?=
 =?utf-8?B?c0NGWHpFWEpQY3I0SnlSYlltSlZQYXFsU3djdCtXblNTMnQxTUhVMDEvYmZl?=
 =?utf-8?B?Zm00aHFLTGN5Y0dhVEtOT2RmakYrancralM1UWZnM0pEdWx6b3VEOE1LaWpC?=
 =?utf-8?B?Rlk5YmttMDBvb24rQWhsK0VzWE1QWG8yOU1tWWhrd0xkTU5TRkdUaWZ4R08v?=
 =?utf-8?B?K0hQeDZVaElnSCtwZVlkaGhMdktrSDBxNjkrRzlTZXVRaUdITkExL1ZzNk5a?=
 =?utf-8?B?QmczN00xcGdZV0xrTjh6YkY1VHJpM1E4UVFZQUkvUi8xV0IyYTVrRmVjWG9h?=
 =?utf-8?B?amRIb1B0Y0FJYTFYSUppcG5DU2JDV2c5dktoUmVsM1pUUEhILzdXc0x6OE1w?=
 =?utf-8?B?NG5nUWZPcGhLeGg0ZkQrV082cFJRQm9UL1BpSU5SaUEwVnlXQUFub0FpNjdW?=
 =?utf-8?B?R0JSMHJUMFlveWFHVEp6QXYyT1BxRFk0a0RTeitXa3JkSDZuWjZLY3hzbS9v?=
 =?utf-8?B?RWt6L1lleE5tck1wRnRVekRoaFpqQVlKclRlc3FFU3BQQysrWEtYWGpNRUwx?=
 =?utf-8?B?WVRVWlFBQ0JEUmFUNW02eFdjUzdQRElSNS9OVHlDMmM5OTdzK3dEWWlhV0xZ?=
 =?utf-8?B?dklCeVVZY2pwU0cybmlITzQ3V1BqNjU2cG9zY24yWWJFZjFOWjQzMTRaL1Zq?=
 =?utf-8?B?K0podElqY3N2aGdhOGYwUHRWQ2RtYXlqaktJTzhvSHd3Qko2WGVUWFlaZGZW?=
 =?utf-8?B?NG9JakRSMzdYZVdGTDFRb1F1L3MrVUw1V2RGWTllTUhFMy9wNGgyVS9CZFNt?=
 =?utf-8?B?MFg0UU1FZ1RtSzRBT2t0MWxJb3FlYmNiMlZ3VU5mcmdaSTB1OXpwVEV6WXl0?=
 =?utf-8?B?UkJCZlAweVFxRXFqUFpIRXFyVTNXVjM2MTByRzFCcGhQNk9TMVJkQnQwK3BM?=
 =?utf-8?B?eE5GWHhIbnNmSE9GOE9iQ25XVjNiNlZQaE5hdU9yRmN1VXZlbjV3Njc2YWRr?=
 =?utf-8?B?bzB4M0txU0lmdisvVkhlQk03VEUxTHpZQmVtRGRpTkk1MkJGOHRGWnNrVDJu?=
 =?utf-8?B?c1lsVVpIczdyRHBVR2liUWhlTzZDZE52NFdUajRNVDlRNnpKcWcyV1ZrOVJX?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 06e555f2-5503-4b35-b506-08dcc2b25c97
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 13:57:29.4743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mmwUsGQ3rpngK3lVO/aUBVwHj5GmyV6NdaFzjABW8eBbmY7nVhdNZE2v/Vm7ng5itMbL0/DjLlO/X/nehu/9YlkB8XmRdHynjYw7p1YUkSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7806
X-OriginatorOrg: intel.com
Message-ID-Hash: QFYV34PVOXNQOPRY57NDN5QRWT2PH7GX
X-Message-ID-Hash: QFYV34PVOXNQOPRY57NDN5QRWT2PH7GX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QFYV34PVOXNQOPRY57NDN5QRWT2PH7GX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-08-21 2:43 PM, Pierre-Louis Bossart wrote:
> On 8/21/24 12:18, Cezary Rojewski wrote:
>> Conditional PCM (condpcm) helps facilitate modern audio usecases such as
>> Echo Cancellations and Noise Reduction. These are not invoked by the
>> means of userspace application opening an endpoint (FrontEnd) but are a
>> "side effect" of selected PCMs running simultaneously e.g.: if both
>> Speaker (source) and Microphone Array (sink) are running, reference
>> data from the Speaker and take it into account when processing capture
>> for better voice command detection ratio.

After reading the review, it's important for me to highlight that the 
quality of the response is high and required that much effort to write 
it. Thank you.

> The point about dependencies between capture/playback usages is
> certainly valid, and we've faced it multiple times for SOF - and even
> before in the mobile phone days. I am not convinced however that the
> graph management suggested here solves the well-known DPCM routing
> problems? See notes in no specific order below.

While at it, do we (Mark perhaps?) have some kind of a list with major 
problems troubling ASoC? I keep seeing "DPCM is problematic" on the 
mailing-list. If DPCM is indeed in such bad state, perhaps we should 
address this sooner rather than later.

> I am not following what the 'source' and 'sink' concepts refer to in
> this context. It looks like you are referring to regular PCM devices,
> i.e. Front Ends in soc-pcm parlance but examples and code make
> references to Back Ends.
> 
> There are also complicated cases where the amplifiers can provide an
> echo reference for AEC and I/V sensing for speaker protection. You would
> want to capture both even if there's no capture happening at the
> userspace level. This is a well-know DPCM routing issue where we have to
> rely on a Front-End being opened and some tags in UCM to deal with loose
> coupling.
> 
> It would help if you added precisions on your assumptions of where the
> processing takes place. In some cases Echo cancellation is handled in
> userspace, others in SOC firmware and others externally in a codec.
> 
> The notion of source/sink is also problematic when the same BE provides
> two sources of information that will be split, again same problem with
> amplifier feedback being used for two separate functions. What happens
> if you have multiple sinks for one source?
> 
> Same for the cases where the mic input is split multiple ways with
> different processing added on different PCM capture devices, e.g. for
> WebRTC there's an ask for a raw input, an AEC-processed input and
> AEC+NS-processed input. That's typically implemented with two splitters,
>   the echo reference would be used by an intermediate node inside a
> firmware graph, not at the DAI/BE or host/FE levels, and such
> intermediate nodes are usually not handled by soc-pcm. We really need
> more than the notion of FE and BE, a two-layer solution is no longer
> sufficient.
> 
> The other thing that looks weird is the dependency on both sink and
> source sharing a common state. For a noise reduction there are cases
> where you'd want the mic input to be stored in a history buffer so that
> the noise parameters can be estimated as soon as the actual capture starts.

I'm used to environment where most of the processing is done by the SOC 
firmware so that would be one of the design philosophies.

The reason I've opted out from using "FE/BE" is to avoid naming 
confusion. FE/BEs are paired with dai_links and explicitly state the 
value of ->no_pcm flag. Condpcm does not care about that flag at all and 
given snd_soc_pcm_runtime (rtd) instance can be utilized simultaneously 
as data provider _and_ data consumer. The existing approach allows for 
source -> sink models: BE -> BE and FE -> FE both, I believe this helps 
in amplifier case.

You've shared many scenarios, I do not think we can cover all of them 
here and while I could agree that current FE/BE (DPCM?) design did not 
age well, we're entering "rewrite how-to-pcm-in-linux" area.
If general opinion is:
	it's too much, we have to rewrite for the framework to scale
	into the next 20 years of audio in Linux

then my thoughts regarding current review are:
	if the avs-driver needs sideband interface, so be it, but do it
	locally rather than polluting entire framework. Switch to the
	framework-solution once its rewritten.

>> Which PCMs are needed for given conditional PCM to be spawned is
>> determinated by the driver when registering the condpcm.
> 
> Presumably such links should be described by a topology file? It would
> be odd for a driver to have to guess when to connect processing elements.

Indeed, topology can help here. Of course if a driver is utilizing 
static connections, one could register condpcm using pre-defined values.

>> The functionality was initially proposed for the avs-driver [1] and,
>> depending on feedback and review may either go back into avs -or- become
>> a ASoC-core feature. Implementation present here is an example of how
>> such functionality could look and work on the ASoC side. Compared to
>> what was provided initially, the patch carries simplified version of the
>> feature: no priority/overriding for already running conditional PCMs.
>> Whatever is spawned is treated as a non-conflicting entity.
>>
>> Assumptions and design decisions:
>>
>> - existence and outcome of condpcm operations is entirely optional and
>>    shall not impact the runtime flow of PCMs that spawned given condpcm,
>>    e.g.: fail in cpcm->hw_params() shall not impact fe->hw_params() or
>>    be->hw_params() negatively. Think of it as of debugfs. Useful? Yes.
>>    Required for system to operate? No.
> 
> that's debatable, if the AEC setup isn't successful then is the
> functionality implemented correctly? My take is no, don't fail silently
> if the AEC doesn't work.
> 
> If this functionality is listed as a product requirement then it cannot
> be treated as a debugfs optional thing.
> 
> Exhibit A for this is the countless cases where validation reported a
> problem with a path remaining active or conversely not being setup, or a
> voice quality issue. Those are not optional...

Well, as you mentioned, that's debatable. Perhaps an opt-in flag is 
needed here - I'd like not to put all the users into same basket. Some 
users may not be happy with AEC failing but would like their 
speakers/mics to keep working nonetheless. Basic functionality better 
than no functionality.
Either flag or 'return 0' if you do not care methodology.

>> - a condpcm is a runtime entity that's audio format independent - since
>>    certain FE/BEs are its dependencies already, that's no need to do
>>    format ruling twice. Driver may still do custom checks thanks to
>>    ->match() operation.
>>
>> - a condpcm allows for additional processing of data that flows from
>>    data-source - a substream instance acting as data provider -
>>    to sink - a substream acting as data consumer. At the same time,
>>    regardless of substream->stream, given substream may act as data
>>    source for one condpcm and data sink for another, simultaneously.
>>
>> - while condpcm's behaviour mimics standard PCM one, there is no
>>    ->open() and ->close() - FE/BEs are treated as operational starting
>>    with successful ->hw_params(), when hw_ruling is done and hardware is
>>    configured.
>>
>> - cpcm->prepare() gets called only when both data source and sink are
>>    prepared
>> - cpcm->trigger(START) gets called only when both data source and sink
>>    are running
>> - cpcm->trigger(STOP) gets called when either data source or sink is
>>    stopped
>>
>> Simplified state machine:
>>
>> 			     |
>> 	register_condpcm()   |
>> 			     v
>> 			  +--+-------------+
>> 			  |  DISCONNECTED  |<-+
>> 			  +--+-------------+  |
>> 			     |		      |
>> 	condpcm_hw_params()  |		      |
>> 			     v		      |
>> 			  +--+-------------+  |
>> 			  |     SETUP      |  |	condpcm_hw_free()
>> 			  +--+-------------+  |
>> 			     |		      |
>> 	condpcm_prepare()    |		      |
>> 			     v		      |
>> 			  +--+----+--------+  |
>> 			  |    PREPARED    |--+
>> 			  +--+----------+--+
>> 			     |          ^
>> 	condpcm_start()	     |		|	condpcm_stop()
>> 			     v		|
>> 			  +--+----------+--+
>> 			  |    RUNNING     |
>> 			  +----------------+
>>
>> What's missing?
>> I've not covered the locking part yet. While some operations are covered
>> by default thanks to snd_soc_dpcm_mutex(), it is insufficient.
>> If feature goes back to the avs-driver, then I'm set due to path->mutex.
>>
>> The locking is one of the reasons I'm leaning towards leaving the
>> condpcm within the avs-driver. For soc_condpcm_find_match() to be
>> precise and do no harm, a lock must prepend the list_for_each_entry().
>> Entries (substreams) of that list may be part of number of different
>> components and the search may negatively impact runtime flow of
>> substreams that do not care about condpcms at all.
>>
>> Has this been tested?
>>
>> Unit-like only. Typical case below with avs_condpcm_ops representing
>> bunch of stubs with printfs.
>>
>> static struct snd_soc_condpcm_pred pred1 = {
>> 	.card_name = "ssp0-loopback",
>> 	.link_name = "SSP0-Codec",	/* BE */
>> 	.direction = SNDRV_PCM_STREAM_PLAYBACK,
>> };
>>
>> static struct snd_soc_condpcm_pred pred2 = {
>> 	.card_name = "hdaudioB0D2",
>> 	.link_name = "HDMI1",		/* FE */
>> 	.direction = SNDRV_PCM_STREAM_PLAYBACK,
>> };
> 
> It's not intuitive to follow what HDMI and SSP might have to do with
> each other, nor why one is a BE and one is an FE?
> 
> If I follow the code below, the SSP loopback is a source feeds into an
> HDMI sink, and SSP is a BE and HDMI an FE? Confusing example...

The intention is to show that condpcm does not care what exactly 
source/sink represent. It just connects rtds which may lie on completely 
different sound cards. This very example will treat BE dai_link named 
"SSP0-Codec" as data source for FE dai_link named "HDMI1" which consumes 
the data (sink).

>> static void avs_condpcms_register(struct avs_dev *adev)
>> {
>> 	(...)
>> 	snd_soc_register_condpcm(&pred1, &pred2, &avs_condpcm_ops, adev);
>> }
>>
>> [1]: https://lore.kernel.org/alsa-devel/20211208111301.1817725-21-cezary.rojewski@intel.com/
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>   include/sound/pcm.h     |   1 +
>>   include/sound/soc.h     |  65 ++++++++
>>   sound/core/pcm.c        |   1 +
>>   sound/soc/Makefile      |   2 +-
>>   sound/soc/soc-condpcm.c | 348 ++++++++++++++++++++++++++++++++++++++++
>>   sound/soc/soc-condpcm.h |  17 ++
>>   sound/soc/soc-core.c    |   2 +
>>   sound/soc/soc-pcm.c     |  11 ++
>>   8 files changed, 446 insertions(+), 1 deletion(-)
>>   create mode 100644 sound/soc/soc-condpcm.c
>>   create mode 100644 sound/soc/soc-condpcm.h
>>
>> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
>> index ac8f3aef9205..7e635b3103a2 100644
>> --- a/include/sound/pcm.h
>> +++ b/include/sound/pcm.h
>> @@ -482,6 +482,7 @@ struct snd_pcm_substream {
>>   	struct list_head link_list;	/* linked list member */
>>   	struct snd_pcm_group self_group;	/* fake group for non linked substream (with substream lock inside) */
>>   	struct snd_pcm_group *group;		/* pointer to current group */
>> +	struct list_head cpcm_candidate_node;
> 
> It wouldn't hurt to describe what 'candidate' might mean here?

Ack.

...

>> +/* Conditional PCM operations called by soc-pcm.c. */
>> +struct snd_soc_condpcm_ops {
>> +	int (*match)(struct snd_soc_condpcm *, struct snd_pcm_substream *,
>> +		     struct snd_pcm_substream *);
>> +	int (*hw_params)(struct snd_soc_condpcm *, struct snd_pcm_hw_params *);
>> +	int (*hw_free)(struct snd_soc_condpcm *);
>> +	int (*prepare)(struct snd_soc_condpcm *, struct snd_pcm_substream *);
>> +	int (*trigger)(struct snd_soc_condpcm *, struct snd_pcm_substream *, int);
>> +};
>> +
>> +/**
>> + * struct snd_soc_condpcm_pred - Predicate, describes source or sink (substream)
>> + *                               dependency for given conditional PCM.
>> + *
>> + * @card_name: Name of card owning substream to find.
>> + * @link_name: Name of DAI LINK owning substream to find.
>> + * @direction: Whether its SNDRV_PCM_STREAM_PLAYBACK or CAPTURE.
>> + */
>> +struct snd_soc_condpcm_pred {
>> +	const char *card_name;
> 
> Please tell me the runtimes and links are in the same card...
> If not, there's all kinds of power management and probe/remove issues...

Well, this have been kind of mentioned by me in "What's missing?". I've 
focused more on the locking part though. However, register() and 
unregister() functions are explicit, the condpcm-owning driver should be 
responsible for handling the problematic pieces highlighted above.

>> +	const char *link_name;
> 
> dai link name?

Meh, .card_name and .link_name have the exact same length.

>> +	int direction;
>> +};
>> +
>> +/**
>> + * struct snd_soc_condpcm - Conditional PCM descriptor.
>> + *
>> + * @ops: custom PCM operations.
>> + * @preds: predicates for identifying source and sink for given conditional PCM.
> 
> predicate is a verb and a noun, not clear what you are trying to document.

In this context 'predicate' is a descriptor, selected set of features to 
test in order to answer the question: Does this substream match given 
condpcm?

>> + *
>> + * @source: substreaming acting as a data source, assigned at runtime.
>> + * @sink: substreaming acting as a data sink, assigned at runtime.
>> + * @state: current runtime state.
> 
> presumably this state is already defined that the state of sink/source?

The state keeps things sane - avoid duplicate calls etc. It does not 
represent state of sink/source directly, one has to acccess dpcm do 
obtain that information.

...

>> +static int soc_condpcm_hw_params(struct snd_soc_condpcm *cpcm,
>> +				 struct snd_pcm_hw_params *params)
>> +{
>> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(cpcm->source);
>> +	struct snd_soc_pcm_runtime *rtd2 = snd_soc_substream_to_rtd(cpcm->sink);
> 
> how are the 'params' defined?
> 
> I read above
> 
> "
> a condpcm is a runtime entity that's audio format independent - since
> certain FE/BEs are its dependencies already, that's no need to do
> format ruling twice.
> "
> 
> That doesn't tell us how this 'params' is determined. This is important
> for cases where the speaker output is e.g. 2ch 48kHz and the mic input
> is 4ch 96kHz. If this condpcm is not managed by any usersapce action,
> then what is the logic for selecting the settings in 'params'?

soc-condpcm.c tries to be cohesive with the rest of soc-pcm.c code. I do 
not see a reason to create _new_ naming scheme, so here I just mimic 
->hw_params() behaviour. The callee may choose to ignore 'params' or may 
take it into account. In regard to your question, the callee may check 
rtd->dpcm[stream].hw_params when servicing ->match(cpcm, source, sink) 
to do necessary examination.

>> +	int ret;
>> +
>> +	ret = cpcm->ops->hw_params(cpcm, params);
>> +	if (ret)
>> +		return ret;
>> +
>> +	list_add_tail(&cpcm->source_node, &rtd->cpcm_source_list);
>> +	list_add_tail(&cpcm->sink_node, &rtd2->cpcm_sink_list);
>> +	cpcm->state = SNDRV_PCM_STATE_SETUP;
>> +	return 0;
>> +}
> 
> There's also the well-known problem that hw_params can be called
> multiple times. Here  this wouldn't work with the same source/sink added
> multiple times in a list.

soc_condpcm_walk() invokes soc_condpcm_hw_params() only if cpcm->state 
equals DISCONNECTED. If I misunderstood, please elaborate.

>> +
>> +static void soc_condpcm_hw_free(struct snd_soc_condpcm *cpcm)
>> +{
>> +	cpcm->ops->hw_free(cpcm);
>> +	list_del(&cpcm->source_node);
>> +	list_del(&cpcm->sink_node);
>> +	cpcm->state = SNDRV_PCM_STATE_DISCONNECTED;
>> +}
>> +
>> +static void soc_condpcm_prepare(struct snd_soc_condpcm *cpcm,
>> +				struct snd_pcm_substream *substream)
>> +{
>> +	int ret;
>> +
>> +	ret = cpcm->ops->prepare(cpcm, substream);
>> +	if (!ret)
>> +		cpcm->state = SNDRV_PCM_STATE_PREPARED;
>> +}
> 
> you probably need to look at the xruns and resume cases, where prepare()
> is used for vastly different purposes.

My initial idea was to cut prepare() step entirely. Perhaps that's the 
way to go.

...

>> +static int soc_condpcm_walk(struct snd_soc_pcm_runtime *rtd,
>> +			    struct snd_pcm_substream *substream,
>> +			    struct snd_pcm_hw_params *params, int dir)
>> +{
>> +	/* Temporary source/sink cache. */
>> +	struct snd_pcm_substream *substreams[2];
>> +	struct snd_soc_condpcm *cpcm;
>> +	int ret;
>> +
>> +	substreams[dir] = substream;
>> +
>> +	list_for_each_entry(cpcm, &condpcm_list, node) {
>> +		if (cpcm->state != SNDRV_PCM_STATE_DISCONNECTED)
>> +			continue;
>> +
>> +		/* Does this cpcm match @substream? */
>> +		if (!soc_condpcm_test(cpcm, substream, dir))
>> +			continue;
>> +
>> +		/* Find pair for the @substream. */
>> +		substreams[!dir] = soc_condpcm_find_match(cpcm, substream, !dir);
>> +		if (!substreams[!dir])
>> +			continue;
>> +
>> +		/* Allow driver to have the final word. */
>> +		ret = cpcm->ops->match(cpcm, substreams[0], substreams[1]);
>> +		if (ret)
>> +			continue;
>> +		cpcm->source = substreams[0];
>> +		cpcm->sink = substreams[1];
>> +
>> +		ret = soc_condpcm_hw_params(cpcm, params);
>> +		if (ret) {
>> +			cpcm->source = NULL;
>> +			cpcm->sink = NULL;
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/* Called by soc-pcm.c after each successful hw_params(). */
>> +int snd_soc_condpcms_walk_all(struct snd_soc_pcm_runtime *rtd,
>> +			      struct snd_pcm_substream *substream,
>> +			      struct snd_pcm_hw_params *params)
>> +{
>> +	int ret;
>> +
>> +	list_add_tail(&substream->cpcm_candidate_node, &condpcm_candidate_list);
>> +
>> +	/* Spawn all condpcms this substream is the missing source of. */
>> +	ret = soc_condpcm_walk(rtd, substream, params, SNDRV_PCM_STREAM_CAPTURE);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Spawn all condpcms this substream is the missing sink of. */
>> +	return soc_condpcm_walk(rtd, substream, params, SNDRV_PCM_STREAM_PLAYBACK);
>> +}
> 
> Are loops supported?
> Is the order between capture and playback intentional?
> Is the notion of playback/capture even relevant when trying to add
> loopbacks?
> 
> Lots of questions...

The order selected here is more of a habbit of mine, not a must-be.
Loopback scenario implies a real capture endpoint which is sourced from 
certain playback stream. If that's the ask, yes, it's one of the usecases.
