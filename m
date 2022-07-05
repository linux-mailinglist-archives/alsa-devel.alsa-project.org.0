Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 308B5567405
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 18:16:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACDF29F6;
	Tue,  5 Jul 2022 18:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACDF29F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657037773;
	bh=AF/cUU4mgZaA0avFlvFAbtZqyAkDuSQ0tfSO5a9cadU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FojCdK6k47O9lEtrro4hdXhAl9wiq2idvlP43xM04ZxiXMVd2r6aItLkpHT+kU94E
	 +D8Qe9eEScKIkuFGJ3/jmUDkwmpTpxGm0dSqgyDu+D+JbI9TnJ+fnnUmSYEJ3pBx2r
	 yQW0kVMgW4bUBN7hHEuKUznvcRT/DPAj6tCaiYQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C029F80212;
	Tue,  5 Jul 2022 18:15:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C3F1F8015B; Tue,  5 Jul 2022 18:15:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC3C9F80104
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 18:15:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC3C9F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bxwdwMVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657037709; x=1688573709;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AF/cUU4mgZaA0avFlvFAbtZqyAkDuSQ0tfSO5a9cadU=;
 b=bxwdwMVfS+/A3nWj4mVJ1L/DZXt2RmIIbkPE6pnkC7fn3b2g6l7+8kA+
 yI5jgzgSySYSeT5WC3++hX0p/1Dmc98kWQUezzJbyHkoc4/3BCTarR/bn
 auA9EJ96ak+HJEWfpj5ErnNfNLSVyL1uKK9WHf5d+O35qt8FTy4TyfvzB
 0mSEwI9/dOMjGIbOfNbJx+DVQjL3sL5mbcHCnybtqtV3jRcOZM0a36mmp
 QcsMT8+RylzjBsAy44TNGGhVlUYiE1b2D8gbenW2XwSPbUB31GygbhLca
 KGFBI7B5mexvEFOd6UtfNC9czmiVH0KagHsZ52tzA4Y/j+uA1cZGbfuqr g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="280947408"
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="280947408"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 09:15:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; d="scan'208";a="650226987"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga008.fm.intel.com with ESMTP; 05 Jul 2022 09:15:03 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 5 Jul 2022 09:15:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 5 Jul 2022 09:15:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 5 Jul 2022 09:15:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LR/ZsoJLSQhUMSmC7pgi2eRUGQAQfAiZ+ggA3ufOCBFNtUdrxL4blVDHpEr3aJ03BuUcvUBoB/IfuVzR+gd4AnelfHRBTjnwziuhvA1HdmljE5+ttr97q6Mw0FuTVLTuPa24Ojt378gGslaYezOsQ8ndOETDGSZ5uBpRCGIOAFFg3VDHiz+AVZBl5NHEQYpXYtSE3T7HTx0lh7zRkYfUG6L7gQmKZhCbukL5VbdxpRTedyyLo8ffp2pcIlH2L3RKSvBTV6VUsn5+mo3+DRTJ59/tYFMlGaVJ2QGPQ0ovzLW9NFbypwHGQcdZqiGI5tD7GVJCv1MQoRlIsJd5bbo/Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0AeYRN6shnApO/Fp0PahG1eY/Mvg3s6tQoxsaCpqtAw=;
 b=iAeRYYlwdeyNBnb96PE5hHCiNIVSb0aAD+MUCddFg2SXUYat5nLVBjG0afWUfL2RKZWQlOqBZ5QFagTBPicRCaz7Xp+HJVABFydP+Zyqor7FvM+IROoqAXZN6DRVthrok5F6b5x+VjoOhJ5gKipGnDLal2OV63ffIu3BiNB8g0hk9vXPLO2drMDD1kXrWUcDpzP3vXHeOld5Xe/gvgEzx3R4q4RV7E1+7+tPVh3WmnpM0mOF/Xdml92xherL0vFUUFXySr3kYGTpet488zzRf3RUm6qp8xa6CZd/14JMGV6MORPUCmFcWtGT7yz+g2nZN0o/3D+nbXAQIjz9Y2z+KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SN6PR11MB3469.namprd11.prod.outlook.com (2603:10b6:805:bf::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.17; Tue, 5 Jul 2022 16:15:01 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 16:15:01 +0000
Message-ID: <d6b52455-87d6-2125-55ce-bdc7aa522085@intel.com>
Date: Tue, 5 Jul 2022 18:14:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/1] ASoC: Intel: catpt: remove duplicating driver data
 retrieval
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
References: <20220705155813.75917-1-andriy.shevchenko@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220705155813.75917-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 784e72e7-3cb7-4943-f98c-08da5ea1834e
X-MS-TrafficTypeDiagnostic: SN6PR11MB3469:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PzeRa3DwtCDMNCXmd9Q/vgEYoPEV8Zg9BF18VWULpv1Tv6G58pPCtYtUUkSHWDjwNKWk7MgsDHiB6l4QTCPTYGFIlYRlsn9f8rJphwGeAQ/bcUduc9a5wM4zE1VWcQhzA5aJJzV2aypXbwKWlHpiUjMMlU8HnEcn/AA1qv6SFwc4La7abTJTZuUGOYw+CD9eo/ucbKR6RLyYeRPemRL57SyJwvDjgKdUtWOW62+fdOqaxHeLh8OZOf7R2xBPO/A6zKQCWwkV/KxzGixjL8m1y4Lq8cx9/4Goe+Z34s9arlmTOrzWpRvo1aEDQ6pO1gJdNs3m8vzqJIVmoaPUIh3tMkCzc5maKE/yCUgjXaHnjrbzdsaVlT1gRgJhEV83B5EG00Cod1H5p6TWxWezb5vQozu9WyCT/ASRvH6o4HNsxpqKNkohQiqjmut1U/6J2W0o3TNT5oxw+EeaMDKLVwEvt3sNE/IfQX9yY76alPBkH+Gm0WuFTkYvrJ3X8co5Op1nySjVc5ptG6o2Uswt/7fhRUXU2q6BJt/CUQ8Sz+WMVkCc7BW4+FjqzaHVpkBVogDEdVdG9Gd3kVoqH/9AwvHw2EtbMY73YA2a6qJhmnw4GU/pvP850K4BJElbk4z+kdsERxHR/1xY1QrQKVnoQBuQM7wCuecGzFaV/5/DZ5TL/vIC3lcNNumG6Nh9O9uK+kXMqcOILzHSOJopVDh0Lu0TCTsCcUqMVNAF8xHXVCWaOS7B/RumO8zRknZaWuX0jfoYNAcPlYqHaRDXQqHNWj9VrNRtlsb69FyJG1WDjXoxykpVxhapbfjHk1kPQhRMiiGHJ/KxSHADfc7X66EIbrQ5KkO4fBBplOVhgOmiU6ebi74=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(366004)(136003)(396003)(346002)(376002)(66556008)(66476007)(66946007)(8936002)(316002)(8676002)(38100700002)(186003)(82960400001)(6486002)(2616005)(4326008)(53546011)(6666004)(6506007)(41300700001)(26005)(478600001)(6512007)(54906003)(83380400001)(31696002)(5660300002)(31686004)(2906002)(86362001)(7416002)(44832011)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkxEWE9Fb2loM0VNR3FKUGxYUXY4WVp2d05QK1cwdzRGNjlsdkRwV09XcjRE?=
 =?utf-8?B?aGJ3cWNKN0RCZHFhb3oveDI5emF1VTljVWJIZy8vOGpjOWw2Q0dRQVg1eWxY?=
 =?utf-8?B?Q3Z2OXdYajlKTWwwbCt3NGtYN2ZCRGJFMG1tYVlWb3ZpT2ZlN05JUUF4amVB?=
 =?utf-8?B?d2NhTG9aZ2N5RkdwWUJoOUlxU0M3OFJSOGR0Z1haYzI2dnY4cVZ0Wlp3dk0y?=
 =?utf-8?B?ekdZc3haeHJnVytLaUZwcjFZenVuMldWaDRMamFQcGJmRUwwUDFsWkoxajlM?=
 =?utf-8?B?aVpaTHVqcHhsQlJVTDlWb1ZISm9TYlFMWmtJSThXYXA1RThkTkxINFUwejgr?=
 =?utf-8?B?NlczK1ZNYkhLK0xBL2hQVzBpcWxxNVRReldHaURWWG9NUmxiVVpFeVNqcWIr?=
 =?utf-8?B?Z2owZWM5WXU5ZXlFME1ON3RaME5zTHZhN0lwSUpweUZoVUw0dVZobHl3b0ls?=
 =?utf-8?B?bTIwbVAzT1k4SzVlakFCQ05xenhCem5PVHNpYkJjOXNwZ0RHQzVmREplOXdB?=
 =?utf-8?B?aUlERzJLU09WWVYzOGYwaVI0VXgrN1IxZWkvZ3JBU05RdWFoV01WQWx4MFI3?=
 =?utf-8?B?cHFPWE9CNmVocE5FYUdXd253ekdSMVRGUXNlSVhONk5qZXI5R1FXNTlCeFdu?=
 =?utf-8?B?NUZKRkdYSnlWRVNCd0ZySGk1cTZmbVNYQTJtZWJrNlBFOEpTRlREQStjT1Bs?=
 =?utf-8?B?YnVvaDBmZkNSZDYyTElIQ0VHTkJ3QmV0M0VPcU5nQkFKZHF6Yk45amxobEt2?=
 =?utf-8?B?UlM0dG9LUEczMWtjTTBnbTQ2cVF0b3FSUEc5d24vT20yLzh4U25mMnJBcDZ2?=
 =?utf-8?B?dDBkRWVlVDZEVHU1aDk5dkU0aXRzTER1d3JoejBtbkwvRE5xZDhZS3ZKZ01L?=
 =?utf-8?B?N3FHN0gzcy9WbWMyaSsrUUhubGlsbDhzYW1tQVVsK1ZkMklMU2dWNUdTellH?=
 =?utf-8?B?MDg0YTVaVTRudTY5TlZtVGwxUnVLcitjS0lQNWZsbEZmOW1RSG4xSjROa0Vj?=
 =?utf-8?B?aElLeVVKcUJpOGdSeFBLSUQwSnlwV0VZWENZVG52NXM5U2FDcnN4UDE4WGZT?=
 =?utf-8?B?eHJqckxHT3FmZlRGSStBUTJFOWkvZ1lKais4UlFiajFaN0dldDl6TWdseVc4?=
 =?utf-8?B?S0VkNzBVYmhWa1EwdEdKQ2NBWHlTNUFILytJdkxwRmpTdlE5aGlLaDRQUG1n?=
 =?utf-8?B?RmI3OHZYc2QrckR5Ti9NMWZScUlTNEk3VzVvREZiQk5lb0VNZzA0VHF3aEhB?=
 =?utf-8?B?VTIvbHVISG1JamhVc2RwaDAzaWM2aGRvVjljNHJ4b1R1djdNcGdZK0JzbHBP?=
 =?utf-8?B?WXdmOUNiY0FlZU1ueEVUZTFJajZ0eGtKeXk0V3gxWkJ6ZnM5VkRVSmtxRUpq?=
 =?utf-8?B?YVY3UGlLa21Jbm93aDU5MkNQZmhiVU15Zjh0eHllSldOMTdjbHZJQ21VNDhP?=
 =?utf-8?B?a2JpVHJtNEMxS0V3b1NYM2hUUEtJWTBNbTV1aVdwbmNzbHR2Wm1KTEswWisy?=
 =?utf-8?B?eEkwUVhxRmlkd0dXZUordXZaOTZmQTZUaHgvcmZ5dklXcWFEa2dROFRUczQ3?=
 =?utf-8?B?VHRmcXRuQXpCN2hoSjQ0Q2tMbzErU3I5YitqQjR2ZVNTVmw4S0V1amZqM09k?=
 =?utf-8?B?TUt6RVo1bk9yQWVxQmZsNTE5MHhXbFlpUUFXdEhscmgvZkU1ZW5GVWxPSjBX?=
 =?utf-8?B?dExnNDJyVXVlemtCOEhlUjdMdGROanFWRHNWVkpQeE9iZEo5eU5yS1BGeVUr?=
 =?utf-8?B?anZKbFdOdUxRTDhMSG9vaHZ6QjBYYVo3Tktrc3FyVFQ4TnNpNm1hVi92Uno5?=
 =?utf-8?B?RnFSUFg4OEpqVjJmZDZtQ0ovN1FBUzQ5TENyQ2dIRWZKOHhYZTBILzBib2s5?=
 =?utf-8?B?eWRXVVBHdmlPS1BQa2d5VGIwUWU3bVBFdWlHMk9vL1ZoQzdLWmFsMVNvOHYv?=
 =?utf-8?B?bEFqeE5UNXpnSWhhb3hTRk15WjlSMFBBVEZ5L2tFOVF5Y3h5aEo2NGhnMnpy?=
 =?utf-8?B?blJUVU5Wc0pUWW9IaHV2U1N6c1Fpd2pxSnRqUzNwVFg0U3pUQVlXcUtFci9F?=
 =?utf-8?B?U203cVdyN2hxVDJXWndyWWRiMUFRWFE5YVd1cWp1QzIwZmlKeDVpeDZMUjd6?=
 =?utf-8?B?T0dTc1krYTRwK1l1SUdGNjJzMlptWnJ4UE9KZjBCRVdjdDNsK29DL3A5NTdP?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 784e72e7-3cb7-4943-f98c-08da5ea1834e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 16:15:01.4113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ObuhvZ9BmqYmQRyasM7xcW8K30TaHWfocRTbBlx87dSZt63QBMsRwH/UwsPn4kTYejN4nDVo+sOK9y2RMp5BGZ7gtGl6NxnQixxRSzm8lww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3469
X-OriginatorOrg: intel.com
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 2022-07-05 5:58 PM, Andy Shevchenko wrote:
> device_get_match_data() in ACPI case calls similar to acpi_match_device().
> Hence there is no need to duplicate the call. Just assign what is in
> the id->driver_data.


Thanks for the patch! Change looks good:

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v3: moved spec assignment closer to its user (Péter, Czarek)
>   sound/soc/intel/catpt/device.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
> index 85a34e37316d..d48a71d2cf1e 100644
> --- a/sound/soc/intel/catpt/device.c
> +++ b/sound/soc/intel/catpt/device.c
> @@ -254,14 +254,11 @@ static int catpt_acpi_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>   
> -	spec = device_get_match_data(dev);
> -	if (!spec)
> -		return -ENODEV;
> -
>   	cdev = devm_kzalloc(dev, sizeof(*cdev), GFP_KERNEL);
>   	if (!cdev)
>   		return -ENOMEM;
>   
> +	spec = (const struct catpt_spec *)id->driver_data;
>   	catpt_dev_init(cdev, dev, spec);
>   
>   	/* map DSP bar address */
