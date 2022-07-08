Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F28856B3D3
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 09:51:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99CA842;
	Fri,  8 Jul 2022 09:51:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99CA842
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657266710;
	bh=0Ij7ghAfmLM/hJ/CR7uSLIQc4CcdgPjC+1cEaFN/QLA=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGKWhdYpYnjs9WVjJLka7NvOYjYfLrSGrgFh++KLdHE7hnBubAGigJAhuP6EOpuSv
	 i+c2amv1zIUHpeDLyJCbqcdd5TSwAw6yR6uC0uObMwi6oJy7dBdTyrwA6M1JXL5/Rf
	 VBxGwmuaRjyT39vdVTo1QsWLqsEsEs9Lx976HkSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0D76F8025B;
	Fri,  8 Jul 2022 09:50:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C4E4F80167; Fri,  8 Jul 2022 09:50:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4C2EF800C5
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 09:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4C2EF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YfNHKmuD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657266645; x=1688802645;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0Ij7ghAfmLM/hJ/CR7uSLIQc4CcdgPjC+1cEaFN/QLA=;
 b=YfNHKmuDPkdJkVwIeMd/9uvtNwtnY5Wx1SqUfD/Cq7OI5heCSBme/J08
 /0Z6imRhuvA6R6bAwTPd0SIM3hqiIdAy3+YP+ZFwGSHCWT16OQ1fGYOf4
 C/u40PYpvTuPwnv5lgE3+HwHINyYut4R8Wit931OYltKmikXV4MM5xI4g
 b8so94+XJKsKXwUqmgR7CZi3rIUER1QEVe8G3xw5Zef1wh3CYMUFHek/0
 IAYVonSnKGUWb+mMx5Z6Ol3F3nQRHGrZCjxdGI5b3joOKKysB4MJCxHmH
 /Y2YaZ93XIIFA9zM4S27NwkdDmIulTPHaXjOj/jr0GNixBqvRMjmGalOh g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="282973680"
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; d="scan'208";a="282973680"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 00:50:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,254,1650956400"; d="scan'208";a="651472358"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 08 Jul 2022 00:50:38 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 00:50:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Jul 2022 00:50:38 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Jul 2022 00:50:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHVuTJWPYOLJdLJfE6kQgUW1GwDzEuzk6MuLRvdAvBA8psNuZRbJ4Z67KTZ2Fm2GCDGD045Xu3CZvdKimFVxufwf4CYtzZLNg8wIn7/zxi4LOQ7HgEk+2MDTHvuouVF195Gq0TMNaDZVfnMv3RnF9oYw5ojuyGDgz7LlHHAw6Da793GB5JcpA8AghuloSU4CUACAKjX+HAlwAYa1UcRZzWkhobonOIcphSBjt3Ss23QuZ/3MFf5NwqOH003qsqjaTTHtsD6EYoxXzwiHl38pc4Dy6qnCsnnnhlFiGFNmXi/LPADIXhFs/g4ijYMsRG8O7mWmI2FyDbNk+x8hRnwBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0g52Jdh3CB46ekGDLmceSC5Tm7PpTP3e/kyIqbx/anA=;
 b=ZblizdJuRO5RYT+z/9y22oND1sV23Llk5xlGNa04pHF3k29C321MdoLnp9p4QpMxvxiHC5P6gDW8hWgM4uDL41lE++AZLxUN+Aa9vT/gwBBS8OBTef87eBWhfm/LKhg6FzkksntPv9IQZkn7OEzuxyN25WamWtYjLiQne1/wJOMH8+eXUGUT+uST8Vu5zu5PrThtndEWLSsNCDS1o3niNHyOKFcW/1JPNXnaSZUd27EnJrl13r0MAFMgJoghwHhzAqu1vzkFkTbQYCJVa9RNmI1l5AvUMze7aqz22X9FDaEhl9Hwb2trykMSPqEO56nJsdgoJYH1ac4K9jk+5/ulig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH7PR11MB5885.namprd11.prod.outlook.com (2603:10b6:510:134::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Fri, 8 Jul
 2022 07:50:36 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b%7]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 07:50:35 +0000
Message-ID: <e55f1170-b6d8-7bc2-9048-b8e44dea3352@intel.com>
Date: Fri, 8 Jul 2022 09:50:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: core: Exit all links before removing their
 components
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220621115758.3154933-1-cezary.rojewski@intel.com>
 <24925485-9d0b-74c3-1e7f-b4906a3314ac@linux.intel.com>
 <1cff4ac0-6d45-95e1-ed9f-6abaded3f8b7@intel.com>
In-Reply-To: <1cff4ac0-6d45-95e1-ed9f-6abaded3f8b7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40c2db9c-7660-4b73-2ec8-08da60b68ae3
X-MS-TrafficTypeDiagnostic: PH7PR11MB5885:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vz2DhlptVH2bnGWya30qzMgu6BOLZV7xh+qVzzgEiKsx9+dhlZtF/CBHX+WxhwUK4TbzXmRfg+Tvyfq4f1oVa95pR7gfRFnzhm8cSHN4JYaIsNhy/IM0kopfQ0RnwsVO+f3IZG44aErBBsJ/zqWkgYF0wkGRwFv/V+D4bWr8L1AnMeepywuwoQe60Hpy8W77EbSUj0//I15djVPUKMuOP6vpNM+CVYvqWzct/S3LBQMYH1BtizTWOYivbhj2SPuVTPlcoVzbIhtSdlo/NM6MZdA78DrDj3DcgOzYdesYkqakT3dXcEc2rOaaKAtaA9V3CgmWDEAaoKzS83LE0YqPR3mNRBHUS5XNht3t/NUCbaVJA/5tq9aOg5usjcgqxgAUTP7mUaIIhvVvWij3Q6VVj0pfuKJQjoxwbr6GOmAICYJ/Z+1/R1ENZ3yGfp5duG/+6Mnx6Hw9qqgLvRjMM6FPGHAeXa7ZPS4avY9W1bVKJgzmJ0n7tFUHszi1+dShPwLvEdkbP4FPgYXGZziFno8TA9SYego3vElb/nbFTUfm3miRBYScWV30clqaiHTNmripFgX6nSDBqECMxNJMgM7Ib618hIZIAtJpU/NIKS2csbGp+K63JAPrxvEQ0RGccyEZPijsFs8vSFVQiM9KRPl7QHj48WG8o9B1N3vphrkJ7n8m8RwvKUBZlPbe01+9mg5lhQr/zKw54fa3RkolWFywt4IcP9LIT+sKCqa0KSBBIFj04UGtA3m9nBe6HxcfF6PaHfVfKtgMPp/dBkciVxgiHtKYsfm9utArNHfjA90/q0NebmgIwJKIhrCeYkWf3e7cQku1O3ud48t9+8TAzPDXIoIlRmiaog+GJe6BWyRgB68=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(136003)(366004)(396003)(39860400002)(346002)(6486002)(186003)(6666004)(2616005)(6506007)(44832011)(478600001)(316002)(6512007)(66556008)(26005)(8936002)(31696002)(8676002)(31686004)(36756003)(66476007)(38100700002)(66946007)(2906002)(41300700001)(86362001)(82960400001)(53546011)(5660300002)(83380400001)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWFZTFJrZHVnZkE3NXNTZkZvVjJFSm0wemJNcEZ2UWFoQzJrWjErOGdnVTgw?=
 =?utf-8?B?T2dabVN5eTNJaytoeUNrZENBajFOcFNCTlFLWlZscUk4NkxHbGFIR2JlcW1L?=
 =?utf-8?B?dzkveUN5dVVCdXVLc2RqVGRraFlaSE5ac3cydjVuVVo1V2RzbjUxZWhBSG5M?=
 =?utf-8?B?SkZmd2xrRjFRVTJSa01Xb09rdHBjKzdPMWlVVVR6Ym5DRlhxOVd4OENXS0xX?=
 =?utf-8?B?eVpXWUFRbXA0Y1RMc0x2YUNWNi9HRnBJRnhrNzBZL3BFMFdpQUVJSThvV0V1?=
 =?utf-8?B?TDVnczFsZlJsMHNkRkNtSng2UmpISHBMN0hVN0RDUEFzbzhHZXJJN2lKdmRx?=
 =?utf-8?B?VTlCalNxd0E4SlY0RzNHaitvL2p4T0hoK2RaWHl4V21nRkFHYmxLdFcyQk1n?=
 =?utf-8?B?VXl6RUE5MFF0dzB1S2VNeU1UYklaWDJoWHA2NkcwZkVmSDdLRm9LNFpzWXhv?=
 =?utf-8?B?T0E1cnQ0WXNZaVdvS2dSTFZSeGNiZzZLUEthNmR5Ni9EckczZzdiOHAvWTNV?=
 =?utf-8?B?QXU3WGhpU3c4bmRzRjVZTFl0dUZqckZFRFJHMzFYanhWb25uY28zU2R0WXZz?=
 =?utf-8?B?M2FUV0lKLzVEanJ2Undyd0JHVzI0ZlQ3Z1BjTk1DYWRtd3lERGtnaHhDaXM3?=
 =?utf-8?B?YTF5WEsvNEVTUFd0Z3ZxTHNxZlZzVndXeUNveXpIai9POHdRQkR4UEUwamE0?=
 =?utf-8?B?VVJ3R01uckZpOS91R2dKdmdvRHVFaTZQeFl3Und0TmlMQWFtZ3o5RkM1djFS?=
 =?utf-8?B?aWVIb2wrV09sTFV1SFRYV01YcFRBV1I3T1FGTTh5OUlTMlErbVNlK3dVY01N?=
 =?utf-8?B?STdaTlZvanFRMVY1ZXgvd056SGNTL2MzR1RabDZOay9RVW1Bc2h0ei82dWpJ?=
 =?utf-8?B?TWIxZ2ZPaGJmLzU4WTVKNmowL0hPdlMrMkpXY3p6L2pzVFk3Rkt4bjNvTFhp?=
 =?utf-8?B?TjZHY3lOKzJ0elFMYmNlS3hzZGpVSlNKWGc5K2J5amJhS3FJRU5RV2RNWnRW?=
 =?utf-8?B?cXN4RG5OUjF1UUxRK0lwQVFpdEdkMG5EWW96UHRsb1dHSmhKSHdOb2V4dVo1?=
 =?utf-8?B?b3Y4YU5kR3graE9oVXp2SmFFRFR4SG81SVNER2VnR3Y3YUIwT1NBcHV1VG1U?=
 =?utf-8?B?d1dOV2NhSnl2YnV0bUhhWkIzQ3NVVXlLMUt2ZmR4cGxDMHUva1liVFhOUjMr?=
 =?utf-8?B?R2FBVFBDVXg2bHhwUG9COEhUNW1ia1lvK3VoeEk4UDg1a3d6aWdSMlFOWE1y?=
 =?utf-8?B?OEZkTEhPcE5wTkJOUUsrbEY4MEh4TVBheVlMK0lRZzlrZzZiVmdlb2JUdXRz?=
 =?utf-8?B?ZU4xSnZOQUV0bXZpY1BuUCt2aEFyZHpTeWs2MXJOTnQ1Z3R2bmpHNzFRYi93?=
 =?utf-8?B?QWxucnpOcTZLQWQrTEF2Y1MyUkxIQkVsaFBmZUpOK3JSd2E5bHZQcHk1U1g1?=
 =?utf-8?B?UXN0UHhQNzNrQ0k5ZjF5TjdTbnJXdG95ZzZDNEJZS3RSaFVFTUZxY0J1aXFv?=
 =?utf-8?B?c1dGOER0dGZ1WUptQlFGTFJHSkdGcWdjS2tzRjYzdHU1VjJwcEliSFBtQzNp?=
 =?utf-8?B?V3hJY2NBOE0wS0h5Q0tsVXVrUWlBYWpkSTg1WEFQQWdvT2ZuNXp6Sk5ndys2?=
 =?utf-8?B?QjRpTGxUUjNHWEhIU1lwTVhxalpZWC9wMlU3QWpDN3ZuRXU1WFR2c2pvdXQ3?=
 =?utf-8?B?MlNXNEZPRlFYUkxhRmFEWVZpYXdNVDQ0V3NCb3RWOFJlZXc2MEZSQk1kWTBw?=
 =?utf-8?B?cjRsbGdCT2tsQ2ZJUG1tRGxmL1FjM1RwVDk1LzFTUVN0SWpuYjJQaldnZEpK?=
 =?utf-8?B?NU96dVoydmRxZzdqTlo5MUp1aS9mNTVCb2xhSTk0MUd2QkIyWlVxQlZoNWJ0?=
 =?utf-8?B?Z1g0M2FSVEVtcVloRHVCSFVrQW1sVlVXYzZEN0pFb3F1M2sxZktudFZzelFT?=
 =?utf-8?B?NTdoUFlYMDFhMXpXalFtRGNXR25qOVJYWUovU0R1dVlJM0Q5QWlyUGRCTW1a?=
 =?utf-8?B?dlhvTnIrMkpib0tITlkxaytuT3BMU1krTHZLOXdLQSt0TUNuazhZQUtOeHdq?=
 =?utf-8?B?RUQ3d0w2Z2RUeWhaTEZuelRBU2pVNG1DWE1QTlhKVitLRFpncG02cUNsVXJ1?=
 =?utf-8?B?TElRTE42eEVCMGxwRkI0eGJUTHR3ZmQwazg2MmVhR0hmLzVCZStnYXhuZ2d5?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c2db9c-7660-4b73-2ec8-08da60b68ae3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 07:50:35.7898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0O6OvBQw9dOHr22KmGPXy+71qskYf9hF59b8/+eAMHNzy5ccGKc4GxZvfASCxobHdmPAfrFNAxLYQPugKaKVedBFbGwTEjAynZzAON97dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5885
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, tiwai@suse.com, amadeuszx.slawinski@linux.intel.com
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

On 2022-06-21 4:53 PM, Cezary Rojewski wrote:
> On 2022-06-21 3:31 PM, Pierre-Louis Bossart wrote:
>> On 6/21/22 06:57, Cezary Rojewski wrote:
> 
>>> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
>>> index 4a3fca50a536..638e781df3b0 100644
>>> --- a/sound/soc/soc-core.c
>>> +++ b/sound/soc/soc-core.c
>>> @@ -935,9 +935,6 @@ void snd_soc_remove_pcm_runtime(struct 
>>> snd_soc_card *card,
>>>   {
>>>       lockdep_assert_held(&client_mutex);
>>> -    /* release machine specific resources */
>>> -    snd_soc_link_exit(rtd);
>>> -
>>>       /*
>>>        * Notify the machine driver for extra destruction
>>>        */
>>
>> .... what is not shown here is the
>>
>>     soc_free_pcm_runtime(rtd);
>>
>> which will call device_unregister(rtd->dev);
>>
>> ....
>>
>>> @@ -1888,6 +1885,9 @@ static void soc_cleanup_card_resources(struct 
>>> snd_soc_card *card)
>>>       snd_soc_dapm_shutdown(card);
>>> +    /* release machine specific resources */
>>> +    for_each_card_rtds(card, rtd)
>>> +        snd_soc_link_exit(rtd);
>>
>> ... so there's still a risk that the link exit refers to memory that's
>> been released already.
>>
>> We would need to make sure rtd->dev is not used in any of the existing
>> callbacks - or other functions such as e.g. snd_soc_close_delayed_work()
>> which makes use of rtd->dev
>>
> 
> The lack of soc_free_pcm_runtime() included here is done on purpose. 
> After revisiting probe and remove flows it seems that there are more 
> de-synchronization than just link->init() and link->exit(). However, I 
> believe providing incremental changes is better than providing one 
> single big patch which has much larger impact of the framework. Moving 
> just the snd_soc_link_exit() has very limited impact.
> 
> In regard to the flow, we have to remember that 'someone' has to be the 
> first one, 'someone' has to be the last one too. If the probe flow ends 
> with link->init() (for the selected range of functions), then it feels 
> natural for remove flow to begin with link->exit().
> 
> I've scanned the repo for usages of link->exit() and it seems only Intel 
> platforms do so. Given their (functions) current content, status quo is 
> achieved. AVS and CATPT drivers reload-tests show no regression too. The 
> DAPM-pin warning I'd mentioned earlier in the bdw_rt286 discussion is 
> also gone.


Hello,

Are there any questions left unanswered here? This patch is a dependency 
for jack handling changes for avs/catpt machine boards.


Regards,
Czarek
