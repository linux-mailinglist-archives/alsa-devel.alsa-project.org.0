Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 260EB4C708C
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 16:27:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF873174B;
	Mon, 28 Feb 2022 16:26:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF873174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646062053;
	bh=5PyqjboHXvoXYntxsO5CCpODZ3fUKr4gCXBWAVlO78g=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Us9vYUt18LA3LjimeyTdWCjp8zKYR3TGwwixsWL793JQNs1aR8BKMXW2a+AMpNGL/
	 j4yrVRX0TLIyppDc9ESfpqFobOXvA0pNZ7R5LTEYedlO5XE4PBiFo5pOnHPkA3g0yC
	 VWpTEj5qGl2ooEvNrayGy2B3VUHCvjoYoxDtFcaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92046F80054;
	Mon, 28 Feb 2022 16:26:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D319F80128; Mon, 28 Feb 2022 16:26:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 417C5F80128
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 16:26:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 417C5F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="noZsfCkg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646061998; x=1677597998;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5PyqjboHXvoXYntxsO5CCpODZ3fUKr4gCXBWAVlO78g=;
 b=noZsfCkg3e/D6+46V4oysFeClwK+0e3KeYVEuDHKZjca+s0s/AyEUEXP
 NTQcPR9TXnEF+q/HOZqObdQ/1GCgVLeE+0uWJotZZZcFmB4wn/4utLSwJ
 266Smq+AY0MbIZyLiw0JWpYFHrKZ9qPiPkgJcyP1UjgTvXJ2BJoD4qiP0
 V932Sa2s2q1bEYM+vY7QRaymz/NR/k5SUZWhYKheFzxPAeQ7UjAgn2Xrz
 K7Kl8eEnZ/PANYoXe/OajTptpGHwA4SlUXAjjYCO91eoJF99/6mxjqYuf
 ON+BHyOtqq9L7DnrjSQNGw6Gimv/f/+tmDfOCa2A5RLyAX1chjHD1FHrO g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="339341250"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="339341250"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 07:26:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="640915039"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga004.jf.intel.com with ESMTP; 28 Feb 2022 07:26:33 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 07:26:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 28 Feb 2022 07:26:33 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 28 Feb 2022 07:26:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTBLdU8l8KYQREXTVcGfd+qG7fDDZ0j5hJmPklLpqSpNdWYdQb3S85M9GED9qcGZF/pg9cdgqKRB6lsTNwQ4EkTDOeFpb8+t6i4JGRgn7+N41QJ8MVL4Ijl5MIELZToDiTRBJ/lVxNFspqfNfCgWZdG6jj/QWP0Qgx1DfSpEP/7MA2wU4MGqOaFa2aYYTPS+O3Brt9PpuYCF4Ya5Zcq+JPhu73ys8Uv8XJlNYq6kvjvaJt0fwyumVVo9DdT+SZgk2ZtjvMeej//gcNwlWerkYyctAqfY9K1WUIXJd73qJjwwskBhwYiaiaZH+h4K0PZPOwaza+qAHXc8ZGRt2C0pDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJmTt9gyQjtu07/oqVygC7GQ4C0AXY2EiCbgbztwfgU=;
 b=kP14pKsGWJkfqXNFA0Fb42sIdX2CqoMpUGWCtZUZ4bqWXC00P1AgcrOixORwiRfgIpPiRDdI5Zdkxn9d0MpNs83ArCgNyfnRyYxWLxXrR4DNxfQmrtcMIk27xgqYRM5ZJUQK4jHmQMdfiCvRJU9QAPNn0E3yWFDrSSmq8K2kclQdHgKIlHwVi7uNjwMb8w02Pm8Jwk8S2aQmVoO2RkkByc/3CFUgDHIstqX+LPp0C9rj0pXLAuly7YUyv3EGbS56Rbi8XXjdhzymiP1wt7ds2JZt6A+VrxD+gad8Izj6SavBf/1SIovU1UYU8inZo+CN81SQq9pLpCm/7mCzUwNC/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BL0PR11MB3124.namprd11.prod.outlook.com
 (2603:10b6:208:30::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 15:26:31 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 15:26:31 +0000
Message-ID: <0ead6b4e-6589-d966-71a5-8216e988a3ba@intel.com>
Date: Mon, 28 Feb 2022 16:26:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 07/17] ASoC: Intel: avs: Add module management requests
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-8-cezary.rojewski@intel.com>
 <e63ad06a-a583-b9f0-de00-644cbe389888@linux.intel.com>
 <d44240ee-822e-51ed-6aed-957ac9e6bf91@intel.com>
 <e33d7adf-3a99-c82c-c380-f65344e7cdbb@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <e33d7adf-3a99-c82c-c380-f65344e7cdbb@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::19) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56cd20a6-c84f-4911-840a-08d9faceb247
X-MS-TrafficTypeDiagnostic: BL0PR11MB3124:EE_
X-Microsoft-Antispam-PRVS: <BL0PR11MB3124E2D8980122E011395B04E3019@BL0PR11MB3124.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B3p31lohxmQW6NYrcHqFkcBxa4qad5JnT4VwRXFHatGG+zu4Q1CwHsbQKdXXuOZzfOexbr3EOcnhhs0SCxVIIfiwOOCUY+ShuCbBZjuEr1jndryM3Z7C+Z3xpewFycH9XeX8h1CwCBa497kG3n1/3HBjM6COvsxLi0cK5IknlAZerPHslWbxCWeid2VQohbxAWQN0Q1bvT3C6MMzhnuEkf4apKhUPWM65CrAnkwh5qxzADpRdpAaAtNtHnXhIALpx5bKkzOlw7sT4hKxpVcIut+0k8ExwsFsErOs9ztQ+KiilufzykPUklD/GpVUTxZC+iE5odd76KWhAtK2wiowe+ziplEMU9EfUfnPzaoxJi2krWrzqs5dOHSToEGBbgrRlvDh/Xmi7hSaT2YxOWgxcfoimNJn6F9sODMi+H8xTdy1I9gPb10FHbw8LspMWkAvNd8T5GHb/Px0zwb1OenjiHahsO83lk1b9wFzLydz9n2/qSPxny1diTibJ0D1tUUPB5cBWqQrpakOvZbjRw3nEvYTL0aA9Xavzu9HagJCFQn3lsdaxscC92a4I4YqIRSJPE+e0ybSz5NjofF6Af/mpLYJTWdXvHueQsNZvHrOrfpqjV2wIFAgrHJQocM74R+SpdQObH1Xy5d4BRLuDgvPMcT5c4N5L+Zh8egIuauSLFGytZPvY9gjoHuSjYBheyNDachab3vWS55aeQEI6gjp0c9e+3K7pjtPdxAYqzvjTqatOkvcURcZZrXdzUQ5BYjr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(6486002)(6666004)(36756003)(53546011)(38100700002)(6506007)(31686004)(508600001)(83380400001)(8936002)(2616005)(316002)(44832011)(6512007)(86362001)(31696002)(7416002)(5660300002)(26005)(186003)(66476007)(66946007)(8676002)(66556008)(2906002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTRHU01JYkdQYklnMFg1eUNGNUM3SUY3NjZyTlduSVJGcVVjRjkzWFF0TVcv?=
 =?utf-8?B?RzdZWi9QN3NuVG1PVDd0VWcvd05yVU5lM1J1OVpXTFA0QjhWMlhydXAwN05B?=
 =?utf-8?B?NEVTejBMejl1TzB4d3hlTzFBNzVvUEhlSU5hdm43SkFkVjlFQ3EzZ0Izc3JO?=
 =?utf-8?B?dytsVVZPcFYyOXpWZCsvTU9EM0hYSlRBZ3dyMHBWVDlGdk5mbk40bmRHWFdF?=
 =?utf-8?B?T09UMXB4SlNkWGNES1J6cDlvUzdvcHVmdTZhalIzRzYrQ0xheVY4Ry9Nc3ZK?=
 =?utf-8?B?Vk5Gd1RPRWl4YkN2VjE1Z0V2bHl0MVgyUVR4Mm9FYUMyMlJzdUNVYnJRU3ZN?=
 =?utf-8?B?V0s3R0laWlpvYkxGVUdtcEhNQlRtNlpzQWVDQjNQNnZ5Tlp5cUE1L2Q1SGZG?=
 =?utf-8?B?a281VFloanRjZlUrY0Q3Vm9SZktLbEhpR0ZMQ1g1NndMay9CRDZzL2pBZ1lX?=
 =?utf-8?B?TTFTVjNvT0hXZ0thRjUreVpyVXZCeXBTZHVEeDJmZWJKR1JKWTUzL2VRNm9M?=
 =?utf-8?B?MFRZZm1xb3JsVlhycStuM1A5M25Jd2FMNDdRc1RKMDRaWGkxWVJSSHB5L055?=
 =?utf-8?B?L0tCQVNMdzMwQ0QwbHkyb3gyZE84dG9YUG81eURTU1NtSDNzOWJCT2ZCbUE5?=
 =?utf-8?B?eU5uYXJxeGdLT0N0VUczUEdWVi9pejJ1dHBaU2kzWGZzNkxJN1ZseUMvYmYw?=
 =?utf-8?B?bEdnTFFGeDJMWWhlU2pnVDlVcW9hSzRHeFpld3VuSE5Ob2pENmd5U3NVeE0v?=
 =?utf-8?B?a1FxaDA3ekFVMkROMnAwdHZXeWZKcnNyOVJIRWNsMy9ZeHp4MWprWEFVTC9S?=
 =?utf-8?B?aXdlMjJZVlo5bXNLdkYrKzlOTUxoVTgwNG9ZUkJtSk1UWk01VG14RGJTeWJP?=
 =?utf-8?B?R0Y5U1ljVXMvNk9Jbi9VSVgyWFRZaC9IdWlFWEdBaUFRODdDRU9mV1NqVEN6?=
 =?utf-8?B?dDJsRTlidWVCYnFzc2hZcjYvNnFFaldJK21CV2JhWUxWOVdTKzJwcG9QeS9Q?=
 =?utf-8?B?d2hSRHVYL1ZtenhUNW9TKzJQalFxOWpXVWRXbDR5bjhHY3A5R1VNMkpYMzVq?=
 =?utf-8?B?RnNKeGR5NmZibTJySkRhQU0wV04yY1BwODFSdGxmZ0pJS2dzWGNzRE5YTEx4?=
 =?utf-8?B?NS9iZFNFU0U5Vjczd0ZuWW9DYTdjS1pnSnFHSVpqRXhsRHVCVGZ2UUlJeWx1?=
 =?utf-8?B?Y0ZYV1B5YzNBTTViZUFCem5yYnlJRFlWR2hZRmd6UWQ2cFZReHBZZXRUbm52?=
 =?utf-8?B?eTVqWjRtWUF0eml6N2FtNXd4b3pndStET0piVGE5TCtDQ05DOGEyNWd3UEQy?=
 =?utf-8?B?NnFZOXBEVDhzei9XaXFhYXlMa0RnaEtNaVZvSDNoL3pzOGN2VG1IZEsyV3lF?=
 =?utf-8?B?cFFOVTBkUllrOUZkUFlXMFNhczhSQnNXSXVJeHBLeE5KT3VWeTJyZjdLM3Vy?=
 =?utf-8?B?SDN5ZEN2TUhmcmxxbnp0d2Y2T0NCbDJoQ2Zqa0VibnlYM3lRZkN3eDhWRnRC?=
 =?utf-8?B?Z3BFN0hUVDBYWitPa2xESG9hVkVlMkFTRUh3ZVRiY25vWGErQUgvQ3p2VXpu?=
 =?utf-8?B?TGJHOHVLWkNrSm5rMm1yK2lNRW5pYk15aFZPQ0EwcDBhMk1ZQk9MdUdpcWU0?=
 =?utf-8?B?YmVLVXpCeFhMejF1Tm9hWWpYUXp4NEhhSEpwT3JzdDZnVzVTcytZL1ZKQVNB?=
 =?utf-8?B?QlI1bXlhWmJXd0h6WTNSSWFxTkhpZEFrYUFKVmFNT1J2WE96ZHViUkkycitx?=
 =?utf-8?B?SDhCL3h3OHdJZkN1ZlQ5YWdvSUN0dmlLajRJVjFoVzlMU2pvN3dPZ3lXUEZ3?=
 =?utf-8?B?N1hGRG9LVUZ1L1lXSnJYM2NnTW5JL3dWQUNUd3U4Yjc5cmRWc3hkQjk0TGJ4?=
 =?utf-8?B?OUl3QzhUeG9FOG55a2lMbWpEMkthWk44RndBV05XaFAvQm03OGhhSjNiTzJh?=
 =?utf-8?B?UXVBZ1l0T1liRXQyOHY1S1l1UDdjdVBhU3FWcTQzS1dpYVBSUERGc0VVTVRB?=
 =?utf-8?B?aHhmQ3JEckdHNjhiQ1ZCbTcwaEZzdnlqTDR3TjVGR2M5YWJJczVBcUJNM0Rx?=
 =?utf-8?B?RVp2L2N3Q3NtUWljNWpySUFvbUNiMXl0SDFGcWdEZFp2bWlsSVpmSS9YZ1lK?=
 =?utf-8?B?RFErcWZlSDNXS21HTmdNd2pEeHdnVjQwck1Uc2w5NEhGeDczdk9JWTVBWHha?=
 =?utf-8?B?eHk4Z0tacWd1YUdwaWxidjdQL2U4Vjd5cFhXOE9PTEIvZFl0TDZMeGNmWGJx?=
 =?utf-8?Q?jS48CuPsP0xPJ0mENEnEaRzG0rZkLI4MmiwW4zKSYw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56cd20a6-c84f-4911-840a-08d9faceb247
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 15:26:31.3530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tl8HJ02DtCmcDu5i9MOKebUCPPL9RS7HVw6ZacS7ZGcMaLT8DuTIf3EgMIBX2WM7DLVFG0kS2li3jL3/uOO2p1bMZG1qumvEYqc2q1fmolg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3124
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
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

On 2022-02-25 9:44 PM, Pierre-Louis Bossart wrote:
> On 2/25/22 12:50, Cezary Rojewski wrote:
>> On 2022-02-25 2:27 AM, Pierre-Louis Bossart wrote:
>>>> +int avs_ipc_init_instance(struct avs_dev *adev, u16 module_id, u8
>>>> instance_id,
>>>> +              u8 ppl_id, u8 core_id, u8 domain,
>>>
>>> you should explain the relationship between ppl_id and core_id. It seems
>>> that in the same pipeline different modules instances can be pegged to
>>> different cores, which isn't very intuitive given the previous
>>> explanation that a pipeline is a scheduling unit.
>>>
>>> The domain as a u8 is not very clear either, I was under the impression
>>> there were only two domains (LL and EDF)?
>>
>>
>> Hmm.. such explanations are supposed to be part of HW or FW
>> specifications. I don't believe kernel is a place for that. Fields found
> 
> how do you expect people with no access to those specs to understand
> this code then?
> 
> You have to describe the concepts in vague-enough terms that someone
> familiar with DSPs can understand.


Added kernel-doc for said function to address this.

>> here are needed to provide all the necessary information firmware
>> expects when requesting INIT_INSTANCE. What's possible and how's
>> everything handled internally is for firmware to decide and explain.
>> There are no if-statements in the driver's code that force
>> ppl_id/core_id relation so I don't see why reader would get an
>> impression there is some dependency. What's in the topology gets routed
>> to firmware with help of above function.
>>
>> Just to confirm: yes, you can have multiple cores engaged in servicing
>> modules found in single pipelines.
>>
>> In regard to field name/sizes: again, these match firmware equivalents
>> 1:1 so it's easy to switch back and forth.
> 
> add comments then.


Ack.

>>
>>>> +              void *param, u32 param_size)
>>>> +{
>>>> +    union avs_module_msg msg = AVS_MODULE_REQUEST(INIT_INSTANCE);
>>>> +    struct avs_ipc_msg request;
>>>> +    int ret;
>>>> +
>>>> +    msg.module_id = module_id;
>>>> +    msg.instance_id = instance_id;
>>>> +    /* firmware expects size provided in dwords */
>>>> +    msg.ext.init_instance.param_block_size =
>>>> +            DIV_ROUND_UP(param_size, sizeof(u32));
>>>> +    msg.ext.init_instance.ppl_instance_id = ppl_id;
>>>> +    msg.ext.init_instance.core_id = core_id;
>>>> +    msg.ext.init_instance.proc_domain = domain;
>>>> +
>>>> +    request.header = msg.val;
>>>> +    request.data = param;
>>>> +    request.size = param_size;
>>>
>>> isn't there a need to check if the module can be initialized? there's
>>> got to be some dependency on pipeline state?
>>
>>
>> IPC handlers found in message.c have one and only one purpose only: send
>> a message. Firmware will return an error if arguments passed are invalid.
>>
>> Also, note that ALSA/ASoC already have a working state machine for
>> streaming. There is no reason to re-implement it here.
> 
> add a comment then.


Ack.

>>>> +}
>>>> +
>>>> +int avs_ipc_bind(struct avs_dev *adev, u16 module_id, u8 instance_id,
>>>> +         u16 dst_module_id, u8 dst_instance_id,
>>>> +         u8 dst_queue, u8 src_queue)
>>>
>>> what does a queue represent?
>>
>>
>> In firmware's nomenclature pin/index/queue are synonyms when speaking
>> about module instances.
> 
> well, that's worthy of a comment...


Ack.
