Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 035BB546313
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 12:03:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9531F1937;
	Fri, 10 Jun 2022 12:02:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9531F1937
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654855426;
	bh=6MffibroFwMqNdnLBGNCXDKXcfxhQ82DNB1MroWRHy8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gq8qCkCM4wEquoabO6v7agNh0P6Ra01Ed8wNg5H83UxBOnz/2JCg1qJoQezxzYxNu
	 0zt9QtbbuqnNZZp9Vjnhzu/Rf1CZ+W/IXRBGREjNZ0CMGvFi3ekc6kTMXLETo9hZNG
	 yfvYuUrt7d7mAkahzem716BwSe8cDxmafPvZlvQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73021F80526;
	Fri, 10 Jun 2022 12:02:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 672AEF80528; Fri, 10 Jun 2022 12:02:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1958F80526
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 12:02:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1958F80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NoIuPiYa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654855329; x=1686391329;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6MffibroFwMqNdnLBGNCXDKXcfxhQ82DNB1MroWRHy8=;
 b=NoIuPiYatMHN54KBzWubduEoF0DPMFuhKGu9LzeD1rvqzlwMYUgoYbvc
 KDb5SrSsKOYauGSj6IK1jqDtoEspiosANfHUUEPyFUg5OC1tNjq5c+1Cv
 L3Ojpm2CbJ8cybFgYeHKi/l5jbj4pSr9a2JuVRSdRbrNouZxhNNN/r6i/
 Dkj/79N8FlBQCnQty6OmZ9wTT7TPBeFHa1U1rcbix6E8f9ah8nIUd7R10
 QjTg1VXiDr2fi9LodwTPN1hAni4gyjNbxBoOwxGW/gQr3mXJwQe1+mXo4
 c6G4Jdvh6G+ypM2wI4R1Wc1FYlFcWpbOQER/5iJAZ9uONoqxuK4sFn5iT A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="258016524"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="258016524"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 03:02:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="556311839"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga006.jf.intel.com with ESMTP; 10 Jun 2022 03:02:03 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 10 Jun 2022 03:02:03 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 10 Jun 2022 03:02:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 10 Jun 2022 03:01:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIPmSn1L7URuj8htsGT4RXtwEVTTq9mqwrpViS8mXBtY2rqoDF6Lj9x05Lh0bIuO7kRSGwk/YpnL0wbYvwPRZKJG8PpXXCypueBrdl5PLWhZMtKqv0DV3EIbsSm1kKJ5reetxl8WaEngY8Cg3Xh16efXFwH5jgf235SCMNsbVU5qI02wP5/CIy6xOyS6dB0MpFhUhAWbNNyTJ8pk98zZ9vWmY66bWAJV/JKJj8owofTqCpI/fju6yEB+qfUyTxswbxDs7oHNcrdVa2GChE4ATcg2qfdHx/LclzGQeYuu4PSQ9f8utQ1QYUja0xeAX0dI4gD9dyDrT5ABZasOgazrZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJ2TSCMUrAhM1J18mY5un7kGBhzbNFUf/sUKpJAFFSQ=;
 b=Y7aI2TmIJ+vOjVUySYSsGfd/B0lSUrrQpux5RCaOf+N7S4WpxeiMFVyeWIRaXbEHDanx5a5GzLhzB0pEfzzo4TzBB3QScJqGnkjs5oOJN110bEC4sZ/1A0Z/tJTvwrqugHnLk8wnCKEqWDhacjO4k4W5UMC/VGC8kSF3GHKGKrWjo6U+kKSLeeCklFHdALc5s3yyhoOFdOXLZdxwh7wjLB00s2oYBeZ6zaEh9a86nHZ70eqD2vZpHFXP+2j8F1te3S5p2iSLwwt0h020yd82vZ9t0ySuB0d1gQPk1jnv2BeLRSCcS5IlWtcYoR12nzP/2yOT803CIR+uXweTyV2/hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6365.namprd11.prod.outlook.com (2603:10b6:930:3b::5)
 by BN9PR11MB5388.namprd11.prod.outlook.com (2603:10b6:408:11d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Fri, 10 Jun
 2022 10:01:54 +0000
Received: from CY5PR11MB6365.namprd11.prod.outlook.com
 ([fe80::7592:b83b:92ac:6c61]) by CY5PR11MB6365.namprd11.prod.outlook.com
 ([fe80::7592:b83b:92ac:6c61%5]) with mapi id 15.20.5332.012; Fri, 10 Jun 2022
 10:01:54 +0000
Message-ID: <6d588b56-6ba0-c171-3d3a-980304f0c2f2@intel.com>
Date: Fri, 10 Jun 2022 12:01:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v2 02/14] ASoC: Intel: avs: Add topology parsing
 infrastructure
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220331135246.993089-1-cezary.rojewski@intel.com>
 <20220331135246.993089-3-cezary.rojewski@intel.com>
 <af6d9ad3-eca9-9721-4fc0-055752e3b6da@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <af6d9ad3-eca9-9721-4fc0-055752e3b6da@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0069.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::33) To CY5PR11MB6365.namprd11.prod.outlook.com
 (2603:10b6:930:3b::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0eac9d36-3400-4739-354d-08da4ac83f49
X-MS-TrafficTypeDiagnostic: BN9PR11MB5388:EE_
X-Microsoft-Antispam-PRVS: <BN9PR11MB5388DB51D10B09EE1E714212E3A69@BN9PR11MB5388.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vlvmkzbdiCDoInToEvE2qvKsr3wS3DE7Nf/Mu+TJOStWMKEvRWWDkwefnGm5mmEWeK8br4Y1GsV+QNSJ5D3g/BOJBlLKvh50KsCVCKkFe1ZjpqRCseFaXkBGOjJjHbi1B1N2Iw7NTusk+L6YCRSipj/uQ2pDw8sz+1xrUaQ62cGDICuIGzvMBaKWFG9vCZff/Q8awZYuWKKOlnbCpx2xFjKSNYmGGQ1QJRYIry6Jcbk17Nu5BS+nutAdYU8qUN8dAPEjjnCHlMEIJekJGTQyXtrOtnL1M9g/aexq/vsqiNqtHbYws2tVS8YEWFqYr8oBpPO4EC6bB+9CSiJNg/mSvUWLl27ED801laXmr8aGPx2zygswnfavBqmWYJaKlMmFSxI2OY9NjXiYX6xF2Ag6KJvz894CQ1O7U6mrI/L7+9xpCnHZ2oHgizuxciXiS9l03Z67Qx87+1NGVj0NZCB2hW/RPosGzU3DvQsEF8cP+VjKbtynvOQVu2D3eO0vtxf4wIM/6Jlw8uEir6/k1S+RzoDRKYa6r8bLq6lwE16k3Rpbqtz2KvUOkdThSwVicdo9FFkfJpsRX9swO++qIhTlwf3w+8c4ogGVRpPSxNW6IPDXl6/wPKl8/hf59C6r50NZOFG2asP2GWwuLvAD+SMy6kJT19AOxVubtdVuvHhCbPI+ys9DAaJf3ZGO4GSZM5bl3sGo7qoG6XLRv6HVRHxwUisVWhRg0x6rIZEE8P9P+3k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6365.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(31696002)(66476007)(66556008)(66946007)(5660300002)(8676002)(7416002)(4326008)(83380400001)(6506007)(8936002)(38100700002)(86362001)(186003)(44832011)(31686004)(53546011)(2906002)(6486002)(508600001)(6512007)(82960400001)(36756003)(6666004)(316002)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEdJU09MRkpTb0svckpWMjh0Mmp2cURxTnVJRHI4SlRTZVhwWGRqRWJGTEVF?=
 =?utf-8?B?QzJGQmp6bTBhSHNLRk5KUzJVRUV4SE5BL0txMnBGbFN2d2xFd3VReTJyc2Ir?=
 =?utf-8?B?Q3FpMUxBKzNSUHNJT2gwVTBXTElOcWFMbmR6USthWTdrM2cyYkg3SkdQSkEx?=
 =?utf-8?B?UlRLOFBSRUVHNFlKd291VEpvQjJ6N0ZmQWp1UTNTK0U0UGt6RGxVYW1GRUNE?=
 =?utf-8?B?ZUE5OVB4ZkJRaVcrbFArdm10RjNvWVVoY3JURFloK2lzdHdyZXZTZTVSeWVn?=
 =?utf-8?B?VjZOUlVxQU0zczlxbUNBc1ZGMFJxbnVsMTNVQWtuSURHVmsxQ1RjYmpHYmo0?=
 =?utf-8?B?c3RiNkN3UnJGNnlQcFcwaFIrc2I2UG5Ib2lyQmU1aEpBVk5xVGxTbUFjOXBF?=
 =?utf-8?B?STU5TW16L1liMkllaFBTc3lVc0x2NUo3UmlGYlB5eS81bW5oQjIxQ0phRVlT?=
 =?utf-8?B?d1ZiVFJxOGYxZnR6amN3NmRMY2h0RkE0cTZvRDhuS1BvQm12aHFJeDhYT3hN?=
 =?utf-8?B?VkpzVStUeFVITS8yK1FRdHBIKzRsY2hQcVdEbkplQjB2SUU4bmU1RkhlaFBQ?=
 =?utf-8?B?TGFhY0hpLzRQci85ang5WmJGOEgxV3d3V2FXQVdHbVdUQTlpallBRGFvQnlk?=
 =?utf-8?B?cTF6ZmVnM1U0L3ljaE0wT1BQSm5NMHltYTNBNFJYNlRpTE4rSVRXbVl6K0xY?=
 =?utf-8?B?eHF6T2s2amRtOCsxcmZHbGJvNEtOdmdkbmR0MzF1N0VLbXZTampVbS9Ncms2?=
 =?utf-8?B?Mk54dmdxaHpSVGtOSFlUMFp3TmRPT2hXSGx6azIxYlIvZzU5WGcxVVB1dGFa?=
 =?utf-8?B?VFBSMEdyYzMvZGdrYUxFTzM2Sk1lcWdIejVIY3ZYSVpBZ3NocXdBUWoyZitj?=
 =?utf-8?B?ZW5aa0NORjRDYkVvZUtRZm0xWkFrRXFrZTNGdCtoZWZpQXVoTEMySGFtV25j?=
 =?utf-8?B?SGlRQk5lcThqaGdaYzh1SklrbWhlbDdwQWZCb3FYeEtpVWwySzdYVkw1aEwx?=
 =?utf-8?B?M1ozYWx2OFpxRU5oRXhOUGdpREJpYWxlaEd5TUdxc2xSdHJoSTNJQXc4Z2F5?=
 =?utf-8?B?SGE2NUxiRVhHazZGMkcrd0Jkci9YeFgzSUFJVDlTcTVzQStrUmUwZk1DZmdP?=
 =?utf-8?B?YUZyZllZMW9IMmtPQlhCcldZSXRSVHNod0ZRakNleklUZGJEZ1pkZGx0VWFt?=
 =?utf-8?B?NUFySXNqTmVlaGNYZlY2MjN4SlVJenRNQ21VUHlLbHo0UTJpWUlUTmJlY3Vr?=
 =?utf-8?B?WWoxVUFHWDcycW1CRE4ybTR3MlZ1VkdkanczQ0tCdWkzY3B0Nkd3MHJXRFNn?=
 =?utf-8?B?MzRFVDloUzlaNHhWUmttd3JYY2VJUXJBZ1pLKzBBTHFGWEg0NFNnZnZ5Zmsw?=
 =?utf-8?B?M2RmUjU0TElYME55WnhGdlNlYnB1VzN2ZlpVeUdINUc0bjROcDZIc3ZrVE9V?=
 =?utf-8?B?VE1ON0xDUWNBSkdEbWxMbG5zR3ZpZGdibkpTNklsNzZtcFVPWWhrVDRBWXVs?=
 =?utf-8?B?Q1lUTUJpYVhPL0luNnpCVDRaWEQxeXc5WE1TL1Q2UEhHdEpoY1pDMGZGNFYy?=
 =?utf-8?B?UzVSQjRJQmczOSt3MzZ0UFlvbTN6bENPcGNTU3pXelNqSFNrakh1ZmRlL1ho?=
 =?utf-8?B?YmE2elNPZXFyR1RCTWZyVEl1TUUrQTlEVitNT1l2M2JZdHVzUThjN3Rxc3V4?=
 =?utf-8?B?MHNCVWZnVWdBWWpnU29BMzQvRHd3Z3JRb1pDYncxSlp2bUV6VkFXVGNLZldj?=
 =?utf-8?B?MlZFRngvSjc1bndDTXBVVk5qMmFUNUNXUmJSbEpqRlFSWEtkUVJ2a1RSaStJ?=
 =?utf-8?B?TFJBVkljMkwwbXJQV3lETUw0M0JlNlhaZGxSY2xRY0dNekplVXZsMGoyaHl1?=
 =?utf-8?B?QzVBOHkreXlWVjNwYThIOHNtaUt2TkN1UlViWnAyTE1yRkIrZjIwaC9kbDcr?=
 =?utf-8?B?TGRrNkZ0c0h3SUJ5RTFYUDF5WG9RaHl2Mk94MTZSOXVoWVVBUStGSjJPWXc1?=
 =?utf-8?B?TkdmZ3p3bmdnS3lLUUl2eVY2STF4MzVqUXhZYTJ2bjJPOWtxOXVCSEFRdHJS?=
 =?utf-8?B?Y29wb0VyRSthUXd2WG1zN1RiSUwvNko5eW9jZkZzL1h2bjZ4NVhxTlFOdDFk?=
 =?utf-8?B?YS9ZWENJTml3Z0Q4dENNVkRORHlhRmlnWGIyUDJ1ZWlNd2xCK1g4WFR3REhG?=
 =?utf-8?B?cXltNm5OQ2NiTGkxdjZDeEVaakhycXRYeEh0WjZxdk03R25VOWh2djgzeU9S?=
 =?utf-8?B?eXp6ZHpGY0k4TnQ3emppbEg3WHVQWmdEa0NNZ09HcENKODg4RGJSRVhGQVVw?=
 =?utf-8?B?T2dPSWNjYkp4T1FkY29wenNBd1pjRmZrbWtDZkVZV3IxVEQySkM5RzVKZS8w?=
 =?utf-8?Q?//7qsiwZ9MXzIhZI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eac9d36-3400-4739-354d-08da4ac83f49
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6365.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 10:01:54.4211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScTSCAXSZ3ZvqqSAtC4SJpvg1qm4Ynom8Cru7c9qPZAKoSIwdCgbesKxRiIim1NJELTzkAoTn6wh24KGlF+5GHxiB1YR8MMWHlWJzFctFkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5388
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

On 2022-06-09 9:57 PM, Pierre-Louis Bossart wrote:
> 
>> +static int
>> +avs_parse_uuid_token(struct snd_soc_component *comp, void *elem, void *object, u32 offset)
>> +{
>> +	struct snd_soc_tplg_vendor_value_elem *tuple = elem;
>> +	guid_t *val = (guid_t *)((u8 *)object + offset);
>> +
>> +	guid_copy((guid_t *)val, (const guid_t *)&tuple->value);
>> +
>> +	return 0;
>> +}
> 
> Cezary and Amadeusz, could you please look into this 'make W=1' error?

...

> /data/pbossart/ktest/work/sound/soc/intel/avs/topology.c:9:
> 
> In function ‘fortify_memcpy_chk’,
> 
>      inlined from ‘guid_copy’ at
> /data/pbossart/ktest/work/include/linux/uuid.h:43:2,
> 
>      inlined from ‘avs_parse_uuid_token’ at
> /data/pbossart/ktest/work/sound/soc/intel/avs/topology.c:134:2:
> 
> /data/pbossart/ktest/work/include/linux/fortify-string.h:352:25: error:
> call to ‘__read_overflow2_field’ declared with attribute warning:
> detected read beyond size of field (2nd parameter); maybe use
> struct_group()? [-Werror=attribute-warning]
> 
>    352 |                         __read_overflow2_field(q_size_field, size);
> 
>        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> cc1: all warnings being treated as errors


Hello,

Thanks for the report! Already investigating, if all goes well patch 
will be provided today.


Regards,
Czarek
