Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7918F519DB3
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 13:13:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08D581E2;
	Wed,  4 May 2022 13:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08D581E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651662838;
	bh=vNZzhBIWBhUwgs96m9C23SOXbw47tlfNqJnl68J/hSM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AXrxEQbq6U1LRFrUG09Co+2CnC4aohNwz2tGBRwZLtobwxtmz/Xi/ROGAviWc5U3L
	 kvbJOI5PiQZT2Foe62qS/BYMCeWAF38be0xFbrr1lszhjktRanvMyY85zAanUtqOfe
	 5sia6aqOwj9ulXDEFco4a5VKTvJvuJaRAG9R5+n4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BC02F80166;
	Wed,  4 May 2022 13:12:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD6E5F80163; Wed,  4 May 2022 13:12:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AE5EF800D3
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 13:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AE5EF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aLOv+I/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651662774; x=1683198774;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vNZzhBIWBhUwgs96m9C23SOXbw47tlfNqJnl68J/hSM=;
 b=aLOv+I/BsCE1/6FERMgpTCeZq4BbJIuCmm29MK3UIx5iL9hrq0TS7ssh
 Iky9gWVj8mUWUK3oxasLMXZlXLaYMaFrOs83iL/d9RyHlexESP5UhCZbv
 MLFjw4IZ1RmDADEobLo2XMHHfLEuuYZS3YuEf5tfqjcdwGnVT2ABdP6V7
 DEvn5SlHvPGl5BrSK8GITketbQIoJPVvmsOD1Sd4tTsxWw88hsz14M/N9
 IGJGClZAOzETs03H0SEnDl4Rw0NzH3EwBmKpYBFHbOPz2dClSNbPxg28O
 oYe3zwv29bxKvNhahf6Fb44xNOL5bql2iGfLvKfl78izdeovIsN2WQbUP A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267332617"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="267332617"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 04:12:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="620760966"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 04 May 2022 04:12:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 4 May 2022 04:12:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 4 May 2022 04:12:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 4 May 2022 04:12:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2xakGGaXoFUpYkpNn6ZAD4jQyuGqeucdXD6XCr8eTq34hB71px8r2Kh4H9EFfIuiWq2Ht0AJQ9EKjfdYlt/LC3gZ/P3vc9G5iCpiCWlzZeADz2AdjkZfFZDC2g+Aq3pEN59zWHXEH6ON36caeWfyK1jI4j9bOVZbNGr71Y1Jhh7GT+U37ClVYvs4CzZ2e71ZnprO4s6WpuLbVvneGAxoTY/49fpO7AbHrpklbVW3Y2ALf+QTQzAdxmFzDGIdNxBATYewOAZRy/vgl1uB6DZTf1H0CVo0bZ6t5Z1MZeGfjPFXxo61Gpx2Z4eLair3h2iRSxMp/XhD1QRZHh9dcZejw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VU6o7U0wl169bcxSO+X2k5lGYKMvcnO7974aEiMxVIY=;
 b=TZg7yyNwiske7+gXATwI6Gx04vhndHKjLsEB3xioTDO722W6aHwRiR9zh16TyT8KDMj0dszpnuAm/O4K8WQ1lGGC6Kij9KyPfhVhRYZ567kNwGhe8T9YJNggljxf5af1BkqLt33X0cv/7DEhByJFnDmRgbT8yvrFvUhZEldVwuI3ssmxJP/G8Z6MVpfkXPRilv4a8fWMCtNPieyIWm/R1jd1JKI+NN3OTcSKIlR+lbFVTiPOthGwrAYa73aJ3nr88ZTnpkkN1yxlxWMCzlp8OI8ASi6MHu7PzABEDomOt0IXkUQo8g2iVijyELqRdieyK9erzjvwRdZtLkKl19Ky4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR1101MB2146.namprd11.prod.outlook.com
 (2603:10b6:405:50::19) by BL1PR11MB6025.namprd11.prod.outlook.com
 (2603:10b6:208:390::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Wed, 4 May
 2022 11:12:46 +0000
Received: from BN6PR1101MB2146.namprd11.prod.outlook.com
 ([fe80::f9d3:1634:22b3:8845]) by BN6PR1101MB2146.namprd11.prod.outlook.com
 ([fe80::f9d3:1634:22b3:8845%10]) with mapi id 15.20.5186.028; Wed, 4 May 2022
 11:12:46 +0000
Message-ID: <968ba38a-6325-60ca-59e3-f863c5542cfb@intel.com>
Date: Wed, 4 May 2022 13:12:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 10/14] ASoC: Intel: avs: Machine board registration
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
 <broonie@kernel.org>
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-11-cezary.rojewski@intel.com>
 <2cda9e60-483b-6866-7ad5-787e43c25824@linux.intel.com>
 <f1607df1-a8de-f26c-fbdb-be4bfba899eb@intel.com>
 <26235767-cc5a-8f9b-b0f9-f48fc4a082b8@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <26235767-cc5a-8f9b-b0f9-f48fc4a082b8@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0029.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::17) To BN6PR1101MB2146.namprd11.prod.outlook.com
 (2603:10b6:405:50::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7087b588-0fa9-421b-9749-08da2dbf0448
X-MS-TrafficTypeDiagnostic: BL1PR11MB6025:EE_
X-Microsoft-Antispam-PRVS: <BL1PR11MB602512C9705ED8213FCD332DE3C39@BL1PR11MB6025.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wA4TvGlFG1VXvMqjdyG5SrXY+N7sIpTCOKgdUV7IsHXrT42hKEK1TBfesr1ijMn9yPQTfXrJY1pEtqS2uBjB/cnprCCGd3eFdfa8F4jzzXB177NxqYwXIfs40DdNWvVq+7ddYJhlC7ppTh7JkBZTzKj4UILjqvoA5lxAyg3/ZD5woHGfKSKYSTMQkYEn4tinpqZH+qYe2S5CROgHqJ26/X02ZDj/t59TeQ8VsboLVhDM/DHEfiunPmWp9EeI/W060wI5zUhxWba9x9+78q1L+j++eaPpw3vivjNzHaGBSaunBBWtMAd3zkcMuNR4JJDPplAic6baWsAQ4ETy6bbxqGipSzY5+VuJMoTz3ux5uaTCSxY0vlcvOC3DdsXRiVO3GWM7L08V7CvS8lvWu2B8qWkCGP7KkCs7QNPAF8/hS8nepOONobyZKqVrCgr2JUzyZT2FtMpRqcbDd8OR27EXt1WgiVe/w2w5LC+FBpURB6R17/rjXVoGmO9kpdxrlGnr6EOffLv+j7VjxdRWVP8mBelRrDJ3RMMLIl21VFb6yQJoE6BL/iFJXTVvI0jI6EEH3YAXKN2UNbhY1busQPPTyygKyEJj3YpFkBCxJpakbbetejXlZDUrnULwt4zC1TmE4CkfJmZyfXJ10aFwdbVRfRDibq8uNrFeNvsVvWCd0wrglKSywz9puVSZk4Pnq4MWQEm/J7rCzH7sdXD0xd8Q/khWj55uD5fnn7iRT3vmddI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1101MB2146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(53546011)(26005)(2616005)(7416002)(8936002)(2906002)(44832011)(6666004)(6512007)(6506007)(31686004)(36756003)(508600001)(66574015)(6486002)(110136005)(86362001)(31696002)(82960400001)(38100700002)(5660300002)(66946007)(66556008)(66476007)(4326008)(316002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGJjaUZGOUMrR3c3YkYrc1NvOU9lTlZVRE9aYXBaeWQySTJNNHIxTi9kdXFp?=
 =?utf-8?B?cGZ3a0tFU0c2S3R1VE9SNFo5cG9oZlNlbDRxb0JlWTFlQ1o4THpUdEpJRHoz?=
 =?utf-8?B?R2J3K1c0NUhxNndHSkhvSnhKSWxBSUtGN25xRzlHazNqdGpqaS9WbG5lUW8w?=
 =?utf-8?B?aGhmSGVqWUFFNDcyK0IrTVlkQTFvRFFoSTYySmVjeUtHbGdtR2FVN3NGelRQ?=
 =?utf-8?B?RUpHRHA3cG8wZWZRVFdlekpma3RHZDRhUEpUZUdLbWtOQ1hVVEduN0JHcVlD?=
 =?utf-8?B?SDY3V2Q0WlVJOXpGQkNCdC9HekVNNkhMRk5jQkJPeEV1UjFwc3BhQTNSOGdv?=
 =?utf-8?B?bndHdmpZc1BYTE85amw3SzVNaWRHVWVHU0JkcFU5aHRTcUljbGtyQU5OM1RI?=
 =?utf-8?B?Q05nWnlqakVTS3RMSE5DRVZaRXZIa25qcDNmL3pxb1JFcFFpeHhVV1Y0UW94?=
 =?utf-8?B?Y2UreGcweUpOQmJYdFB1dzZFdzIzSTdTQlBZb29lOEZaa2l5SnRWNVYybjc5?=
 =?utf-8?B?T29wUmdRNnBQRzBJY0NzT3REU3REdXFPVEpoUlFVMGN6dmJWbm5Na29UVTVG?=
 =?utf-8?B?NmRlTmhwSXpoT1lsdE4xOXl0aG1PaTBmeFpDbjVrcFJ1SFFTeVVGOFZIZktm?=
 =?utf-8?B?UVl3OWpPRmFJbDVYNHZEQkFjM3l1Ry82cDkvelFLYXRkSzFmd1RwQm16dW5I?=
 =?utf-8?B?emIwNmdzQnVPQzBOTUNvQytMdU5lajd3T1lZbWcxY2M1NjBuUWdQREUvVlda?=
 =?utf-8?B?OG0zaDdiNHU5NXN6aTRMTStOSnFldUtTQUdUVlh4M3JyMXZ2UEdSVkF4VFQ4?=
 =?utf-8?B?S2srbUF0U3ZpNGpEN0t0eStGamVDN0E0U0tscFcyd3J5K3ErR2tzakFhSEpZ?=
 =?utf-8?B?dUtGQ2ovRU1vb0xzeHJNbFJCWDh5WTRUWFBtYWdZMU9BNVp6b1BFYytCUjRV?=
 =?utf-8?B?VDhEWjFNWXJ4K095T2w1U0JtSVZHU0JuajlDNWJHdXYveVJDRitaZVJwWmYx?=
 =?utf-8?B?bGp4OG1qTHNOVXArNzJhSUdVUmtnRkxqWGFNcnRBSTUxSWcyRjJ1UWt5U0Qz?=
 =?utf-8?B?cmlUYU1kWnlGNDFYVFBwbDMraUpXYUNLNW0vMU9aR0dicjhMY2JxRVc2THo4?=
 =?utf-8?B?MmFwNjlvLzNVWkhtMkd2Uk9neEovMFZLbkh6blVtbVRLcnRCMCtyMURpN3pF?=
 =?utf-8?B?U09RR251MkRtZ0lGZGtjRWtkSkJLVXhDbDFMU1NKdGtGdlRTQWpYVnpCR3Ar?=
 =?utf-8?B?Zyt5bm1MZWk4T1ptRGRlbmlZejltRVRuTFlhenBuUEt2NWp2UDg4ZzRyV0I1?=
 =?utf-8?B?a2tMTUQ0Yjhvbk9LdG5HN0JDN0s1TFJsRWhmVTcweDNFbWlRTTF5bVlIQUFQ?=
 =?utf-8?B?aERoK0dQMnFjQVV2TXpJNkNHS2RuazBYODhyNUxwQUpEakRrOTdGbkc3Q2Jh?=
 =?utf-8?B?RSsvS2FnOW94MTNwYkZGVEtKNC8vV25nWTBBbmVOMkpBOXBkWWlKVzRIQkxI?=
 =?utf-8?B?NmI4OW1naWtMM0wvaDhVYjY1SGd6NVhqNkh0bzhqamFtWlAzZ1VZSHpheTk0?=
 =?utf-8?B?RHBleGZqbGt6UExXbGFyTEtOZjN5bW9uSnJkUWo2N1RBV09FU0FLaXBRamZK?=
 =?utf-8?B?ZnlsenV1cllYRUR0dmZYU0NkQU1uRCtZa0RIajJJaFpkZ0YzemNKMnZIMElP?=
 =?utf-8?B?ZzBkS1pwenZ0VTVLNDBnM1ErK0M3M1doYWFneDRPL1haV2ErSVpxZlhzWE5K?=
 =?utf-8?B?SUU5WHdTcXpUUVU1YWVjMGk3VWdiTFRqMmpBYUZuUzNVWldjYy9NUmk0cWFL?=
 =?utf-8?B?TmdnWEUwY1pISjNacHVaMVBIQkludUVvNFJEZ1NMVC9NWWVzc3ByOFhjVnNM?=
 =?utf-8?B?SDFCME12L1V2Z1R2cGxWTlp4TDRBeDhEQm9LMmkrdkNvOWVpdEZOV0g5b2VE?=
 =?utf-8?B?RUUvNStmaGVWUnQ5VEY5cmc1TVVOQ2FzQ0dXRTNDditaVDhrVzZES1dUMjR1?=
 =?utf-8?B?K3krWXExSXMwSTA4ZTBlUXkySjJYaXpTVzY4WmVrbjdBUGlZSzlXK2srOHRJ?=
 =?utf-8?B?K0l6R243N0JYTkhLQlhqdFNsUzZxQS9nNVFzSldwcVdSem03b3Q1SXhFbDhD?=
 =?utf-8?B?Q3h4V085UWRHWko4QmlQSWFqR3NtVUwzNUZ3ajNiM3l1dTZTTEhLOFhWVjBX?=
 =?utf-8?B?b2hiZ1dEYTRnNmxhTHUrRjZqSEhSZDVWT0hudWFHMWRzUkJDSm91NEJIQnFX?=
 =?utf-8?B?dTEvajQ0emhHMXgyV3hkNDNySWxWazlRaEhhcnhNZTNha2Ntd0R2NmQ2NWlk?=
 =?utf-8?B?TFdsUXpFN2ROT2NpSnhmZ3F0ZlVQakpUWk5YRTZtWlY1WElQOHM5MTN1dEkz?=
 =?utf-8?Q?3kdxQS9PBiC0079U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7087b588-0fa9-421b-9749-08da2dbf0448
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1101MB2146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 11:12:46.2247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otJbeJWJwG24Qv2omddW4IrPgHKckCmvwnVTVJfqUbWQ9Re/tK4vsDg6lu3BMHJmBzbfDjhHctFfPg5JNQplWLCIOlNfom17N9+MnONU1cI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6025
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, cujomalainey@chromium.org,
 lma@semihalf.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2022-05-04 11:41 AM, Amadeusz Sławiński wrote:
> On 4/29/2022 4:01 PM, Cezary Rojewski wrote:
> 
>>>> +static struct snd_soc_acpi_mach *dmi_match_quirk(void *arg)
>>>> +{
>>>> +    struct snd_soc_acpi_mach *mach = arg;
>>>> +    const struct dmi_system_id *dmi_id;
>>>> +    struct dmi_system_id *dmi_table;
>>>> +
>>>> +    if (mach->quirk_data == NULL)
>>>> +        return mach;
>>>> +
>>>> +    dmi_table = (struct dmi_system_id *)mach->quirk_data;
>>>> +
>>>> +    dmi_id = dmi_first_match(dmi_table);
>>>> +    if (!dmi_id)
>>>> +        return NULL;
>>>> +
>>>> +    return mach;
>>>> +}
>>>> +
>>>> +#define AVS_SSP(x)        (BIT(x))
>>>> +#define AVS_SSP_RANGE(a, b)    (GENMASK(b, a))
>>>> +
>>>> +/* supported I2S board codec configurations */
>>>> +static struct snd_soc_acpi_mach avs_skl_i2s_machines[] = {
>>>> +    {
>>>> +        .id = "INT343A",
>>>> +        .drv_name = "avs_rt286",
>>>> +        .link_mask = AVS_SSP(0),
>>>
>>> I've told this before, 'link_mask' was introduced for *SoundWire*. 
>>> Please do not overload existing concepts and use this instead:
>>>
>>> @i2s_link_mask: I2S/TDM links enabled on the board
>>
>>
>> Noooo :( Sad panda is sad.
>>
>> 'link_mask' is such a wonderful name as it matches naming used in our 
>> specs - which call BE side 'LINK'.
>>
>> If it's a must then yes, we will resign from using 'link_mask'.
>>
> 
> I'll just note that header kernel doc for link_mask says:
> " * @link_mask: describes required board layout, e.g. for SoundWire."
> I would say there is no assumption that it is SDW only, so we could also 
> argue that if it is it should be named sdw_link_mask and comment be 
> fixed to remove "e.g." ;)


This is a marvelous suggestion! Adheres to fw spec, adheres to kernel 
doc. What more would one want!


Regards,
Czarek
