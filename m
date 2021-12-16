Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2462B4779B6
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Dec 2021 17:52:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD75727F7;
	Thu, 16 Dec 2021 17:51:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD75727F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639673521;
	bh=5ysy3o0yorPesh6VIChyDQO0Navh7ygBpkVVm2nBA5Y=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JrfKzoK/M+VzOHi/cw0++BHUy92I/YmRD/R5IhLDLDYf+/NtrM942pwup7t1CDyMN
	 aNIFXxZjzDVCpr91UbQLK662Yn+jdurj+ggUIFaGS4oz9I9GcXTXvctUb5qzdmw7MF
	 oS7eGOiMCPQPxWmaNi6XRzHhk7b0+bW1CKzKSh/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25C42F800F4;
	Thu, 16 Dec 2021 17:50:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08E79F800F4; Thu, 16 Dec 2021 17:50:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB094F800F4
 for <alsa-devel@alsa-project.org>; Thu, 16 Dec 2021 17:50:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB094F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LnAD2aA6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639673450; x=1671209450;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5ysy3o0yorPesh6VIChyDQO0Navh7ygBpkVVm2nBA5Y=;
 b=LnAD2aA65yXb75r+kEDWSe/iTzo6cnhKHlRipqgb/kYJVqX+JFR+vyqG
 odp/HsmNCzPXQwWcuLZbA7ytWaJZRkMNkBov0ADMevUR9FBl1u10/mhDd
 mQsZHxanT+u5z5amMOoIoe/WvroBkLjGkq5EQy6N5FIRJkl2oLhYh8gy/
 T0pOMaoEaORRSe/GQtbx8uUTz1tDPtbOtb66g/s+Q9k2pJ96v4JcXgycf
 mUYoizBjl+ZwHzYBCKg3qDvyYDIiOWxOzx6pdAxBOnLbUp7EYLkBpOTZl
 SQSPrC/iVBdkTF6Tk1vaiBPzjRrDab9yuH5vJE9hLXTXi2opnrqB3T+3T Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="300314852"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="300314852"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 08:50:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="506359286"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP; 16 Dec 2021 08:50:43 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 08:50:43 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 08:50:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 16 Dec 2021 08:50:43 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 16 Dec 2021 08:50:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bwyAzLaMt8OI+dNHo/NF5wOg688Fm6z81eJ2CFZLO3TL8+7gwLJk32pzrXvlqSRKCCjY9uo2Z6hPkHhkdRhVP6Go7WXHwWgO4hYYkLTcFXpQPmmIFSMewNo/gTXKlT85MXgv5U69oODr0Bq6dEhKSXGqGH3bcV4An0bbOs4NVajTb6lo0M0NrlbjnnGyHmvFrX2KKcJAUqYVLGQ42ufiTNOxV0VSQTvwDL5MoJ4oLbHjOlyofNUf0azShHlK+qNVFHu0FhtixNsYemIsaEiM3EcxZVTKoa/moQJMOGtjW+q+lu9nfv8EjZz/EYfJrSF17/K1ljYQIydTs9W9GncMpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6YXrAFDkDxHqMWbphcF6c36qK9n9alB+iOMJwR/DeA=;
 b=CYM7we1ITmaKzqvR7N798ZY8LEpZDd62oWhRVgTrvMi87YKywxqRQ4ARnAgzTnK8RkElcznp2dHzLGfWavOpsIGAYOsDH76P+UfBQzJkGzWFI2hPoCIywMZJ1oOQwn5W5env/kQRrSrXqlFYCJNZSMVLKHmghrv6Eb3OFEQ6vAf+S2dERmEW1PEjLT0d0OtFGVvt/UCloiT+Sm2INdPJwjwZpUZD9p3j04Odncjlkh3vTpEiv2OkPOb4fG2bVJSLCevR8SCJ2G75BDe48QtqmBpUtBv8o0ESVgr/r1jKUkx+HKRr7BlrKOr0KNLXwv5mQIL7z9xDz7KcI+jBtHj+Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 16:50:38 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%4]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 16:50:38 +0000
Message-ID: <b4eebba5-a510-a5e5-7939-e8211ee2bc8c@intel.com>
Date: Thu, 16 Dec 2021 17:50:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [PATCH 4/5] ASoC: Intel: catpt: Drop SND_SOC_ACPI_INTEL_MATCH
 dependency
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20211216115743.2130622-1-cezary.rojewski@intel.com>
 <20211216115743.2130622-5-cezary.rojewski@intel.com>
 <4a8afa77-217a-9d1a-7704-909ee895c4c7@linux.intel.com>
 <2377ff39-2ee2-c1fe-844b-aa9749f4e026@intel.com>
 <261b8815-6c8e-7e0a-4b34-e7948efb6884@linux.intel.com>
 <9da26018-aad9-76a6-ad93-8941a68c645f@intel.com>
 <124db869-d829-006a-e1dc-0e41d21d5361@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <124db869-d829-006a-e1dc-0e41d21d5361@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0067.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::44) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 689c7915-9b9e-468d-4fee-08d9c0b43042
X-MS-TrafficTypeDiagnostic: BN6PR11MB4049:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB4049E7AA7700E58D0415BB01E3779@BN6PR11MB4049.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UugUax4k58y4+FQv5oIY7QL3P6YHvbCmunouSz5bajvKox4r15xA5d/xboH7oj4EOkZt6G39UGTi/Vm7yTKzhLPvmnW+574OPKyiUpYZYhudrrxyYDcKzF/g4w3W93o5MzhKU5Zr0SdMKn44pNbufNgHqDPOdwqwlJKYtu9tvmi04OADf9z8t6L3oT7FsQqrs5LE3kQaosSylTT7IFZ5vTXUivTuI7AkREUKr8TlA/umXdGlQu8OplLZ/ojyMKnVWCFY60Ixj8lwRD1wvu9UiSNP6AorUD+L7FaHFL6RbYlzXg7B++8tgBHYKR5BOZunmynfrtsHFMDJkr65Gdq/WyON+PtOquCIn10OdGIh4xtV8R+N1AO5tbYDvM9WfpoLcBoGoS+gCovX3muX1wXgjcK6gCFd5q8c6X4WwMZ3nINOwlr+AXafZm4INo01Xv5kCvFpM/JhLoDqMTVneYf+TVEgh2DYvsRpksRgit5mQqoQXt/V6cWzcjWXxm5F6pdnzSimBRg/VY7wgYgnUxywIDlqg0twnUqqn59y5FOYH/E9hl6yihXEV4DY4GYeXn1TcvHOuvkBBjAqDJkf8WAs5HBy7Hkegeb/PZKrFi68PFDLTFGTMM69bmKBe03TlfJN04C67uBABVWKQUutFrzDz2vIT7fD48hlIkkAS+OWUzWyaO3Jl/r77QNl8Bu+Ex2GuTkd6zvh7OziXTIhqmck+TXrUx2uuON+ZAeU+boB3rE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(6506007)(6486002)(86362001)(8936002)(82960400001)(5660300002)(186003)(26005)(4326008)(8676002)(2906002)(44832011)(6666004)(31686004)(38100700002)(508600001)(316002)(66476007)(66946007)(6512007)(36756003)(66556008)(4001150100001)(31696002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Skp4UE10NUlFczJlZDFBL05meGR5V0FlUzd1U3B6K2IrdzlqNDJibzEzWDNa?=
 =?utf-8?B?SVdrT1dBOS91YnJWMVBReWdzL1NDajc1bHkzNTNqVkxINUNPS2pvc282WFpC?=
 =?utf-8?B?MHBiTVovSFFucEFOVVZidDg0Q0NPRThHdnpiczJ5aFF0TEVSQXZBRnMxZU50?=
 =?utf-8?B?dEhEL1pkWUpQR0tJKzhwTDBmcW9LUUszYnhJMC9pNEVTZUhnaVlFWkhCVUR5?=
 =?utf-8?B?VmFGY0g4VEtKekxiY21GT2x0aFRvZUVLd3ZPOGJudmlVSDVlUTZVRWlLR3FJ?=
 =?utf-8?B?Y3R3SWp2YzVTWXZVMkpJQUhzamNTa2pyT3p3VHVWVE9mV2pva1RPRkpmWU1Q?=
 =?utf-8?B?emxiTThkbkdJcnVQNFpNYUdjcTBOV2g1aVdBTVlEd2VrYkVnK1hBQ0FuazdT?=
 =?utf-8?B?VjF6T3pkWU1hbThVMkRTQ251a0RiSUJDMDhUZU1OYmJCWmtwamFtWFExWmtM?=
 =?utf-8?B?cXZwT253RHRGQnROZFlYRmJGUFJoc1czQUZ4Z1ZqR28zek5rckVqUWRRUkhv?=
 =?utf-8?B?OVVZQkJNMXJzWHhNcVhpUXduMEQwSm5LaktFcER4WlY2TUpIREY2enZJa2ZO?=
 =?utf-8?B?Tlh3eHVhSVc3T0NTMWRzTnkzclVuTllUWEltb1pyWGtPaDlDdktVTE9pL2Zk?=
 =?utf-8?B?c0xCKzFXWnpkSTYvZkZ1WnRGVEFFTUxYeWFzK1ZSSHpDTUtEam50anNRL1Zm?=
 =?utf-8?B?dVBXTG9uUUwzRGw4aXc2c0hLd2FYSUtyMHlyM3BRUEpLZDZCK2lJdVQ3RmFk?=
 =?utf-8?B?OWNtb2drZzJ2MjVWMGdrdXJtdnEzNno5STFPa25Rb2tpa3dVREFXWlJIWVd1?=
 =?utf-8?B?THB1emh6SVRIanpQTUhZMmIvM3FKcjhIenJkWFdEWjB3UVFyZ0ZlR0tJY0Ew?=
 =?utf-8?B?ZVBIb1c1bWhxUHdJQ2Q1dm10ck1xd2NTVXFLdkl1MHFyYkhzVmdaVEJ0WHlP?=
 =?utf-8?B?UkFUcXVVVXJub3Z6T0p5VzhWV01hYU5jT0NZWFVQTGR4c2tqNE8zMGVLYmV0?=
 =?utf-8?B?dVZqaDU3a1hZcEdlNmdPTGc5R2lJTE9CbDBDYit4SjZCUSszQnpoS0pOR2VS?=
 =?utf-8?B?SzBFV3pCalFnRm5CSGd1SHpneHI2RmVydnRhRzI2RXpSWnJVNmpBdVFLWlFT?=
 =?utf-8?B?NjNJNDRIUG5jRnl1WXZGNnFBTXJWN3BPbncvK0tLWCtmSjVCclQ4U3ZKb3RK?=
 =?utf-8?B?TVhzMi9PdFB1TFQ3Y1FHQlZ2d1dDWDBpNUQ4SDdyRUlFcERyK0lkUC9nZ0ZR?=
 =?utf-8?B?M0JWeTg5ci9BZmljTDhuMlNUWU80U0h6aVg2azJaWWMwNmxkWVdFZnFlUkVj?=
 =?utf-8?B?SFVUK1VFdjYxNlo5Qld6SVMyelJiaFFnMlZPVXQ1MktxakFSZjd4UVUwZC9i?=
 =?utf-8?B?L1p2ZFF4K3VFOE1RWXM5bXZtdnRCRXdRMU9wTjJIdVJKa08xNkZaWVZnLzls?=
 =?utf-8?B?bmhmQ1AzaG1YY3Z0ek1oNEg2ZnhMM3RZMWRZemlDdW9rOEJ0QzVQbnlLR2J4?=
 =?utf-8?B?N3JUeFJBdUZLaHhvRjA0eDFsRUoyRzdVSEZEL3cyZ05pbi8vcDZveDZTQUdU?=
 =?utf-8?B?bjc5QkpZM2FiVFYvOUE2R0UwNHVZKzMxRU9rWlJSMUFzT1piM3c1WHlSUUlq?=
 =?utf-8?B?WS82TlBBcVJnNS9SQ21ndVVTakRjZzFxNmNSd3BIT3NJTHU3RmxCcXg5cUxI?=
 =?utf-8?B?akRVN0xGVklZU2xiQ20rMkVXTTRKU0pQZ2Y3QVZxN2d4RkQ5NVgyVzlaZStm?=
 =?utf-8?B?U2NzbmpWRjNxTWtkS3lmVDh5aElyM1JiVjUyNkdBT1JDb3gwaCtCZ1Fzak85?=
 =?utf-8?B?Y2tySHhjRDhKMkF0blBhSTc4MlBpeFplRmV5bWE3UzdRNENlQ0E2RkdvQlcw?=
 =?utf-8?B?dEx0RTlUeUhsalkvYmFaNmRwRlZGeW90VStKY2p2bDNsVUNETHJvemhBNVJl?=
 =?utf-8?B?TTBpRjdjN3BxcG1qNzBPYi9xZlllem9iYWVsc1Z1TzJHb1VUUnc3eU5udzA5?=
 =?utf-8?B?NzFmZ2tGQnVtdVp1SUttZGd0YVRDMzhjMkRnUzgwWTd5RWJIbTAwQ2VvZ1hs?=
 =?utf-8?B?a0Naci8xN29SS3Q4WnpPQ1B2bHJBZm5FdGgyRHF2dGR4dlB1UzlmMzJCSGl3?=
 =?utf-8?B?ZWRZK29EMG1EN1VlbFNnb2l3VHNraFN0TXN1TEJveXJUdWlmaGl1ZngyZHdU?=
 =?utf-8?B?ZEg5a1dmTWo1bGYzUFBEYmk4MzU0NVBZY20rTi8zUnNEUUFjQ3ZSVkNUYktB?=
 =?utf-8?Q?lrRnKDW2LwqRBdnJ14MOJu1yQoVs87p2p3HhVP8ZDE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 689c7915-9b9e-468d-4fee-08d9c0b43042
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 16:50:38.7963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVU2ylzdTcYXmAmmLXDaI0DKFF6wkdN4M44Vfa0Fwfeo6P/MV6TlxvCIb6NdvLSaigeC4k3aDUa49Fw28ADgdDzKnik8C5wqg5A31lMbj1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4049
X-OriginatorOrg: intel.com
Cc: broonie@kernel.org, tiwai@suse.com
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

On 2021-12-16 5:29 PM, Pierre-Louis Bossart wrote:
>>> I don't really see the point about the number of fields, this is a
>>> generic descriptor used for I2S/SoundWire devices so mechanically there
>>> are things are are not used in all platforms.
>>>
>>> Another example is the quirks field, it's only meant to be used when
>>> there's actually a quirk.
>>>
>>> Note that I am planning to remove the sof_fw_filename field since it's
>>> redundant with what is part of the PCI descriptor, but the topology will
>>> remain there: it has to match with the machine driver.
>>
>> That's why no new struct is declared. Simply the tables are moved
>> locally, and there is nothing wrong with that. Cohesiveness and
>> readability outweighs the duplication of ACPI _HID.
> 
> If I follow your logic, I could move all the tables for glk, cnl, cfl,
> cml, icl, jsl, tgl, ehl, adl into the SOF driver. That really doesn't
> seem sensible.

Hmm.. doesn't it really? Are the glk/cnl/cfl/cml/icl/jsl/tgl/ehl/adl 
tables "common" for the Intel audio drivers? There are not used by 
anything except for SOF. It seems reasonable to have them present 
locally too. SOF solution becomes more cohesively organized in such 
case, just like catpt is after this patch.


Regards,
Czarek
