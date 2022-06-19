Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FF2550ABE
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jun 2022 15:05:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17B101AD1;
	Sun, 19 Jun 2022 15:04:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17B101AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655643943;
	bh=z4irq0TJcZJ0f/LCBnI3nHVLrZ5+ByJ4wnQ62CsZyMI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E+NbYRlu3orRhcQSZ+ivq2r6qlxoGtV5yaLHBuOj5qGfGnvKwHCSxNTirAhOIljEf
	 STEjutdQFOA0Bu9AO1w/33Vh6vQ0izYPQU/2Zsmx+sXUnT45CvYqxy3Gcxq7yiuNoJ
	 MF/YzCyR0KwtHwEvoaC3XLlrsGHuf5RF1sMPoSO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79265F8014E;
	Sun, 19 Jun 2022 15:04:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 569BBF8020D; Sun, 19 Jun 2022 15:04:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFC10F800E4
 for <alsa-devel@alsa-project.org>; Sun, 19 Jun 2022 15:04:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFC10F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GOoozsJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655643880; x=1687179880;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z4irq0TJcZJ0f/LCBnI3nHVLrZ5+ByJ4wnQ62CsZyMI=;
 b=GOoozsJPo3M18PEqa8mluFlVTnbM4tIQpfom+/20cOTVzqIT123b0/iP
 57OrkXMR1QhEchrqFzwhgUEVjYB+oENNRleGaIYP37t97lOebdR1wLWes
 cBGUfLDW9XscOCkasg/mwSnjBwj3sVmOqg6rzhugup51kKOXRhfvZKUeD
 s0qIcY1gsydzv4pXHn5zlgBM5I7nAj0kK9jtzwo+iKdpOojSqOiFirHqU
 xdbB99+rqjYOtcetAPf1E564EFJgbdrodvth6+BIiAla8IolWA5VjxHnu
 Yu0JrL1HcRuUQCd6VMg7IJ21pdEQLQ7Cs1/J+0m26r4nVSPnB/c4nkbCW w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="277277826"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="277277826"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2022 06:04:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="689048825"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga002.fm.intel.com with ESMTP; 19 Jun 2022 06:04:22 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 19 Jun 2022 06:04:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 19 Jun 2022 06:04:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 19 Jun 2022 06:04:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhT4B/K+MySzWb1kIlEgW1rFjPEMmAQ6jTgZ1DwNnli5QzH6JPmei7JCuSDL9W5BtcWZU4KoQ3yjjlymNxJimR/xEsr15EOFUndgNsOjBGpFwTIAUdWMh339w/5GXeDvoCTrzx8OUyOWC0uGc0K3QLnaJPs55CKMcgGfMB3gJoPE4v7Fre34UlGU5FS8TKAWm8JfKI1Eh82q/x4CGOJPfmhFPQeyndWmWUmd9NOItJDYXQg7GmY9t6EwTLCzSrqJfQZRz9YaGfR0ztoZaZvNXfSDOqYFJARms02PIu0SIQvZHN072o9PhaS0ibc/R340XFKVJ6V5u4SSyQKTJxNXww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBEwZSU8uBegJ9YRU4BLUH4B3TY4JBCuxw0mL/7s9tE=;
 b=ibF9mwVOmJmLTXn9Yc9sj6W4PL/kogD66jcF3rIoszfx2eROA2jQFqBPhCBx1gNhuTepDg/KohiCEhVwind3XY7ldiW8Dnw/PLoGBM7Hi8KOHj2f+CFIyOty01K9Ap2nDO+cnvTStktvXbi2fxIz6/0ln/QTSQGITJ1kNYktvLMeWxLB9XB2Ip31pD01zqU2/ah5f9M+9TlOrHmbc/HnPiK3Gj9oa2rt/mk9jDcIMlhq0QaizwkgX9asxj+nfj07pTxw1IeTpzcFsxVy2WZXIYSGUa3EpO90ethydyjV7Xsc8Ou5Mo5ctvCohatE8xE98+n5sEcVHG5Mfig3fPSZJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BYAPR11MB2903.namprd11.prod.outlook.com (2603:10b6:a03:89::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5353.18; Sun, 19 Jun 2022 13:04:19 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691%6]) with mapi id 15.20.5353.016; Sun, 19 Jun 2022
 13:04:19 +0000
Message-ID: <69e4263a-e036-cb21-2360-55b06600911e@intel.com>
Date: Sun, 19 Jun 2022 15:04:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v2 16/17] ASoC: Intel: bdw_rt286: Refactor suspend/resume
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20220613091546.1565167-1-cezary.rojewski@intel.com>
 <20220613091546.1565167-17-cezary.rojewski@intel.com>
 <dd6633cb-9db5-ee61-fde1-32b4e8d0e086@linux.intel.com>
 <1391e54d-7b6f-7b43-d979-ce08febd2378@intel.com>
 <a32db639-89e7-de35-6943-b29a7fb52200@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <a32db639-89e7-de35-6943-b29a7fb52200@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0161.eurprd04.prod.outlook.com
 (2603:10a6:20b:530::7) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86625a94-1ab1-4bbe-4347-08da51f438ae
X-MS-TrafficTypeDiagnostic: BYAPR11MB2903:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB2903F2114D42EBAF3BA302C3E3B19@BYAPR11MB2903.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mhq3u31dps4i9wcbvCOXTKzrLE/wDbcOOyBPfvybklkO6AWFf9FKAHF1FQJqC+e3rcVfcQ3caQuEX5D94bYMVXgQm83EP5SqZNqxVJMKR1FyWt9fmezX+r73+kK1/aBgyWtwfLe2kYsloYpIGjPS3KW7p0c6bQASuUMR9+pDZMonSW09WqxqmHnZj6RGqSgONc0/FRHcBdWt/0ClBZnxLi6uBDhyg26U3yFw8X3pQP2/9PKNxMPvxwXN4YEUIxCylSjrogxZYb7m0tSTj7qkBkEUM8tksAlj5E3lPImAKsXR0SVCB54Bb0cmIepxk8EJ816WRHDwrhQSl9qkouD1qcel7zWLcnQ0YK7EQZnZ53NMULO14bGfgRJDSygIth14mVEmrOi6bGhzMS0qZ18jY4ON+eProJuiOpR59aIr9AqUzchi+1tNawHc30FSmRHm3sl9cE9EbqgbYS3x/FJOI19zD0QBEkfPpvmYD7T5INkgtEwW5l+ut+aC1pnshROls15b1B3K2adPy0VmM44zZt6i5lUsyTfhol38eAv9o52jmxnkBjmfHO4Iwp8bKb51ieW+v5exbRI0W5ID/fWzyZnO8joBvGmFGcr/7uxBIyVco62VIz37gQn7tmJHWYWDsevj641hsIMxW7QX4h3olnbHY4zEgApdCRUrK4Zaqi8wGKCXNRKOhyX3Unn5s0iQoV2RnSaUQ8GzJj/rqDY4knMqMkDvPeqKirpki7DbiQw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(6486002)(82960400001)(6916009)(66946007)(498600001)(83380400001)(66476007)(66556008)(31696002)(8676002)(86362001)(4326008)(316002)(54906003)(2616005)(186003)(6666004)(53546011)(6506007)(6512007)(38100700002)(26005)(44832011)(36756003)(8936002)(15650500001)(5660300002)(31686004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2xJbjJHWVBDdk12Nlg3aS9PVmpqTUk1anVEQ0JUaWFtbFkzRFpLbVcvc1Rl?=
 =?utf-8?B?UlFJc00zYjBNeUpaVzJUNlZZdkVHRjFlRlRFdkc5M1I0WkNvV2lPbm9MWmxu?=
 =?utf-8?B?ZGQzUnl3b21CZjl5K3ZibmlmNnY1VTRMTzEybXJIbWFvN2szOWFTenJoY0dD?=
 =?utf-8?B?N3o0TXhxb0IzMGIwRjZ4bnJvVHpaNlF1Y3dlQTduZjE5RDVGMHJRUE1SeEdk?=
 =?utf-8?B?UkJjQTdQUmROVUJnaktTY2lOeFdrcEFTOTcyQ3lVSVU1Y0s5Z0JVSWJOTzcr?=
 =?utf-8?B?djdKMGZDV0hXWFJEVlNGK0pWZHNWRE9wdkU1eXE2S3VKNFFDVm9ObWxKRXNW?=
 =?utf-8?B?Y3RmOTlzdWlYMk5qRFVmbkRwNWtrUkhGZElhZGdsMzdJREtQMnFOOENZemlx?=
 =?utf-8?B?YUx2Zkt6U1NhZ2lGV2FicW1JdTZkeC9IMGF2VXlYdzVzUnBHcXhQL2MwMFV3?=
 =?utf-8?B?dDhJS0ZwZXJZZEVLbEtPRG10V2I2aDVuNnpGVlZoY0hobXpjVnhQQWEvRFRY?=
 =?utf-8?B?UXFySlM0NyswSzlTMTZ3bVY2TENTTUkxM091ajBMemR6V0g3UjRLQWN2bVhq?=
 =?utf-8?B?NUo1aEJUYnZYNkxKT0F3WjgyQjVWaGxsRnJsSklYV1dFeDR4UGpKYSs0Nngx?=
 =?utf-8?B?TzFVLzVTWC9ka3lYVHhScWlRTEMxTUs2UVZIUVphNi9RaFUxcnV6dG1VYnpG?=
 =?utf-8?B?OUdxMGJweGhtY2hjcHAvS2dQSDVpc2oxVmx2bkN6RVZlSm8yRjdRZHJSTUhs?=
 =?utf-8?B?SmlHaE9jZWRhR0FJbm1JMGNhdHNlT21BKzhKVysvNUxiL0F5SVY1ZkxZYytF?=
 =?utf-8?B?amtJazRwWGplUmR0Z2J4OHBMb3dMaUVwa0c4ZERJb3VNciszbzBua2RvREFR?=
 =?utf-8?B?c1NoTVkybERJK2huUitqeWxpYkZOVUNzam1RRGg3REFpT1hYczhScUROWE5s?=
 =?utf-8?B?VmRFVEZoVFliWVkrNjF4OHVuaFZVcUkxbURrMi93NFFONEZRY2FkWjk5Sm90?=
 =?utf-8?B?S0U2eVRIU0ZkcWpFdUg1ZldsUVUzQ0krWDczM2VXa01WaHdQb20wdFdNYmEv?=
 =?utf-8?B?dmVZaTh2clZCNjFFc0ptSDZac2ZRUWRjVTJsNldHMjFMSnE5NDEwSDh2Y1du?=
 =?utf-8?B?OTk0MzlkQzdudVlic09GblJYNTh1Slhoem84b3Z1RFNMMWVnTTlpSFEzY0pj?=
 =?utf-8?B?RGJjb2lyN0hmZmJnNWxheW0zcGNqSjAwT20reEd6THRnbDJtd3Rnb2lqNDhk?=
 =?utf-8?B?a2JhT2ZQWlVvTER1VDhReit1UE9NQ0krd2s1dkt4UWhyM2FKV21zZkgwYjZw?=
 =?utf-8?B?UjdpSVpTaUlpTGt5dXVnVDNKelBZSk5qbmxORjlxVHIreFBrVWZsUk1FeURN?=
 =?utf-8?B?MVVseE1KRzgvS05yWEQ1ZnBMbzhqR0xwQy9saVQxdUliT0lLM3U4eXhaWHBQ?=
 =?utf-8?B?YUFLRG45bm5uRnViZWxqVFY1c0hBdWtOckpQcUpIdnZ1aVlhOVpRdVVtUW5L?=
 =?utf-8?B?UDU2cFFUdlZhWERESVJiRExaem1mS24wOTYwNVlwWXdtcVk1UzNXTHB5aTha?=
 =?utf-8?B?MHVWNTljYmJVM2JKNm1GcXYrZWZZR3Q3cW5ZK3dQNzQ2REIvdnoyMjFaTlNL?=
 =?utf-8?B?NzE0NXdCY2VGcWZ4c0FpNFpkVzhQWmVzSHhlSlNXcit0RHZoUGg5NTRTbUVy?=
 =?utf-8?B?aUpEejMxZy9uajBUdzlsMFNtb2lTdlNxWnJRQTJpbHFPNTZOVkxqb3JCRkFN?=
 =?utf-8?B?L0l6NTB3ZmJweERSL0hCSmhYVzI0UC9sWlBtb2Vma1dvRzROWGZsUk9BMWJj?=
 =?utf-8?B?bFQ4QzJMU2tLQ1VxTDJYZ0JyU00rK29Nb3JzeWxXZGJlVHRuVXd1L1M1Q25N?=
 =?utf-8?B?UDNydlFEOXJmQXZtT2llSzFBaE1VSkZIUG10VmJWcjhnNUNsLzU3SVdsR09Q?=
 =?utf-8?B?c3BUdEo3TDgwWm80RG04SGt5MmdGdWVuT0RiMDNnK0FLaUVnemhZSnhMQ1Zl?=
 =?utf-8?B?cmxidHRkNXI4QW5BYVVoajJDZVZkRWpTUkp0T1R3OTlCamg5WlIra1RXdjNO?=
 =?utf-8?B?Y2lQcVFjZHhIUHNyYVhGZjlua1hydnJiZWg2Q0ZUbmhlWS80WnM5aTl4eDdX?=
 =?utf-8?B?RkNadEFNcXVmYXY2K1dmbFhWbGlCMDBsSG1RUGxEaDZ6M1E4UEtrcEZwcDJX?=
 =?utf-8?B?ZldKVDNQSWR0TmtmUDkzKzFxQnJHQ0YydEdHUE5TOWFvVTdnbU5FN0xiRGE1?=
 =?utf-8?B?T0dROHBzZUN1Wm1CQU1naUtmL3lNbVY5dHkxcFJUbnhMUUI0czVuZDYzRG5u?=
 =?utf-8?B?Y1pHOXM5Rnd0czA4dVpOT2ZZS0ovNGd1YmI2UG9nVnlvWGY5dHFOVjFYNlNk?=
 =?utf-8?Q?OmO9OC9H0ToKR5Uw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86625a94-1ab1-4bbe-4347-08da51f438ae
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2022 13:04:19.2723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /4o9feWOyA1eAC8/QAFYstE+GQvQC8KGj5acLUp+IgVZF8Ml1MSzHog8KKD0uxqxq7rzJZwkwZh4nHjJZEc+DFiLlVfBg5hvmPe9oBQ2fNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2903
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, tiwai@suse.com,
 amadeuszx.slawinski@linux.intel.com
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

On 2022-06-15 6:25 PM, Pierre-Louis Bossart wrote:
> 
>> Jacks are often initialized during dai_link initialization which is
>> completely out of platform_device area. This report made me think
>> further - if we assign jack in dai_link->init(), we should be able to
>> drop it in dai_link->exit().
>>
>> Not exactly! ->init() is done once card components are already accounted
>> for (available for use) but snd_soc_link_exit() is called during
>> snd_soc_remove_pcm_runtime() when card components are available no
>> longer - soc_remove_link_components().
>>
>> TLDR: teardown path is not symmetric with its counterpart, perhaps a
>> problem yet to be addressed. I'll see if moving the jack-NULLing to
>> codec's DAI ->remove() won't be a better temporary (?) solution than
>> reverting to platform_device->remove() usage.
> 
> It's a problem that impacted other platforms, see e.g.
> 
> static void kabylake_rt5660_codec_exit(struct snd_soc_pcm_runtime *rtd)
> {
> 	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(rtd->card);
> 
> 	/*
> 	 * The .exit() can be reached without going through the .init()
> 	 * so explicitly test if the gpiod is valid
> 	 */
> 	if (!IS_ERR_OR_NULL(ctx->gpio_lo_mute))
> 		gpiod_put(ctx->gpio_lo_mute);
> }
> 
> I vaguely recall hitting this myself when working with codec properties.
> It's worthy of a comment in the ASoC header to make sure this is better
> known/shared.
> 
> I see in other drivers that the use of component_set_jack() is
> symmetrical between .init and .exit, so far we haven't seen any issues
> with sof_rt5682.c and others.


I'll send a separate mail where we can discuss the teardown path. Don't 
believe the problem can be ignored. Even for the bdw_rt286.c usage of 
link->exit() generates:

   rt286 i2c-INT343A:00: ASoC: DAPM unknown pin LDO1

the following is the cause:

soc_remove_component() calls both component->remove() and 
snd_soc_dapm_free() for the component (in that order) so when 
link->exit() finally gets executes DAPM widgets are no longer there.


Regards,
Czarek
