Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5989F55BB07
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 18:14:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0CC5167E;
	Mon, 27 Jun 2022 18:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0CC5167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656346458;
	bh=WlaxgfCIjuU8LyJd0FVBb+I7HYju8Sbyp56Srj+hRYk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GjQiK3XMqJfC8+HT8Jae0hebJoIbvAn9HFKAqsklCzAHd6sBimDn86a8Ty+Q/KYo8
	 v9f19wt1tY4EN+yN+Y7VBDGFrg4DeycKeJBvm2avN5fJ7ef5PnvMaPk9RmqBKow7I1
	 y4X55F9JLuGRZhGERa97Li4xv9vcLnhUDOuMKl1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D3AAF8028D;
	Mon, 27 Jun 2022 18:13:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6B88F80107; Mon, 27 Jun 2022 18:13:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_17,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A319EF80107
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 18:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A319EF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SGRRlfrA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656346394; x=1687882394;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WlaxgfCIjuU8LyJd0FVBb+I7HYju8Sbyp56Srj+hRYk=;
 b=SGRRlfrASWl9fOMdbicaPcBrNnbn1tDsByX73nR75p8HhH8DfLR6JEZ1
 doDoq10tuquywJkb+OR0XWvLX3TW5RCooNG/d8JrAYNDRQYw5zAViMm34
 uqkJvS1fTE6oeTH6lMdBYQrnEc4B+z8kUUGgslOzLMLJg0MsdL3I4z+P1
 IGAtKcM3TT0l0H2xD3dm8ZRDyg5Qh+0LrDXB6H/txV5TuXtQBmg20/bmr
 ASMWEVVlt1v+nLX8fJqNpfexRU5Sn4S/MMW2f3+IeFXdLjrFfgVFsBY63
 39POZFw+SvMeT+T1RWCrCapCiHH9XHW+VUDFMNhimoUCbPIshj9rcunpN w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="282574679"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="282574679"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 09:13:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; d="scan'208";a="589962007"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 27 Jun 2022 09:13:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 27 Jun 2022 09:13:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 27 Jun 2022 09:13:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 27 Jun 2022 09:13:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzt9BJCK6epJKz+oPrIvte8j4jHqisYY8EeMg91Kp0MZsC6lq/mFDkGBtMDcuvny5JZA/SQa5/ud2i1WmvoKOHk7Pz1xsR73mdZHgdUVxtsnBrbOd6t96T7ESKpBcz1ofkLm8nyGRymx8vP38ZII5/O2SOi4PE/HtPfJoPvx478z2r25kMYRgvb1tf7muSSyEKLgPzrKfA6A7l6fpyln7Y0gPNzd48Ji43R2mt4l3ECyq0h33NcXN/3uhhGScaVOIE32YbFaaSmF/SWOTh686BzY2C4SmTerPrMA/hM5omcGvdigLYrLg2L1o4micP1YSGh/UAYnVspeZY/UEIXh7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBo2WPZ7rraB7vkmWoDMb09rT5qTPoAipIBm/dS2JtA=;
 b=Zou6R4E+iiHK7BWZ9HojLWgczUBPrFeoeOKKe0eoIjC5J/hGJK5albdEaDWnv7QykiMHSNj950klg229r/fpC+z2Ucz0cxPByUADdKw/OdjFrW6GVNQ5O17ruLXDhDQaTxdCR9h2ZR3KFS4Tej73WV4vVB2k3iRCDUAHZGLIxewQLDKQPoINGyxofIargOtnvB+jZhRd7t4JCbyeOE+aFccsm8++zhF7BBZbvgjdAcSLSdeJhkGrzug9mjY6TqEhH8KWJNJ8EeCGplkfXRsKd8je8ZS6vldn7avo5vbOvoKFYiMm4BQdYd1KXjmsFy9G/XvE3GmlnocHWVeyw8OCIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.18; Mon, 27 Jun 2022 16:13:07 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691%8]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 16:13:07 +0000
Message-ID: <df278ec8-656c-3b3c-9746-33fa53878af5@intel.com>
Date: Mon, 27 Jun 2022 18:13:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH 0/4] ASoC: Intel: Mark BE DAIs as nonatomic for hsw and
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220624134317.3656128-1-cezary.rojewski@intel.com>
 <ac2b7d8b-a5be-4fac-169c-eaca185c9746@linux.intel.com>
 <3d9b45c0-b415-21d9-6af5-68fa1001ed17@intel.com>
 <34b54e4e-8997-c2b7-fdf0-24a1b95121ab@linux.intel.com>
 <c668f83e-d9fb-35dc-a06d-6563d20ddc8c@intel.com>
 <650468f2-4a68-d1fa-157c-827fda5f1ed5@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <650468f2-4a68-d1fa-157c-827fda5f1ed5@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0202CA0038.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::15) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e528cb1-1fd3-474b-f41c-08da5857ebfb
X-MS-TrafficTypeDiagnostic: BYAPR11MB2856:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cVUyW/r42wTeZ+lYndd+tOkAhyj6u0s+IEN5BC/eWll45SREV2MZOmAyGWcoo9m+dvrWsjJgtZHs0VN8+Hs5kBnyllyBQcoLV+nOflOCIRW53xsKuG3ddnSlaA47SK+zlol+9142B3e1mErP4TgkTOvDxb/fyK8sL4XcklT3OvzhIbMYOwD2Q2KdHU86AYY8/WlZj7dfCclgGypJniaLAe47B6bha7cTiS4WdJ52jGF5QUtG521YBivfSqpMFK78ikDhhtAPOHVvM+qwjgFdAe/Uy+umL86Wn6T+Ec6MtjdvewjCi/IrT+99tssJN2nc7TnvPjL+8pen2enq7m7JWPtKG+Act6WnykO+4YBiB/JU93EsuDGUecn/8Uanvsh5dZqD79qRaQLveld8j0aH+h7xgwbnsxWeAi07FLjRUY5MA8d2MJmw4YI3nmThvJiSZ1D8A7SxcTryDunto/QQhwK5REWC1+RxCVfqxZDpQvYspRNXPlBP/3pVK5Jfp4jTwSSBT6pAJuFX5Zj0Z4PZSrHSmmpESxp0X1ZJFEXANHAcCbDO3drkJHW8PxU5bUW6Muc1AN0xCz+q3P1hhDatWNXm1OIRbpuENXtjOoKZ+EwCGnirYA7IeviZL4/EWMotcqHwWugbfFlKqN476rQ9TCBwDIwgRR5D8MAAAJziMpfq7DpeoTgbqhr2747vK8hZv4+Nsg3a4BG9VY53WMqHy3dLyEs8m4oMGH8TUtDUXKH2opMO/TrNc3dtddlqSDoxv50DdKUY7GcYlXd2wE9bp4SaR2Rl4+GfrEVFbdXnUUBWcxHzgoYkjExrImg4mlHv4vGLXK3TaomGuhZpk0j3DA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(376002)(346002)(136003)(39860400002)(26005)(53546011)(6506007)(82960400001)(6486002)(2616005)(83380400001)(5660300002)(8936002)(36756003)(2906002)(44832011)(41300700001)(4744005)(31686004)(478600001)(6666004)(316002)(31696002)(86362001)(186003)(6512007)(66476007)(66556008)(38100700002)(8676002)(4326008)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlplL285YkJqWVZnMjM2eFJZc1ZjZEtDelVXNGgxU3FnRldXVElINXZVTkU5?=
 =?utf-8?B?WjcxWmgrc29uL1AwV3pvM05JZVR5aExEOXVnRjB4cUl6UGw0Wk8rb0lqeFd0?=
 =?utf-8?B?T25XcW5ON1dDN3QrcmRzbHVPN0VUcU5ZT1k2M1hmaFR0UWE5R2xBZE9nbDJj?=
 =?utf-8?B?M0hVK09jb3pJSFZjQzNIaDdpUk9Eb0hVY01rVk9pY1lMOUljRENDNEhTNktz?=
 =?utf-8?B?UXp0L2YxWkI0OTZRbXBlNUJiTzFCcmd1VzdoZC9sNGdweG4rU3llMkxaS1pT?=
 =?utf-8?B?a0R3ZTJvQUUvaXBKQkJHbGF3WEYvWk1PTnZJMFRvUkJTSVN2bHNUTVhRQUlo?=
 =?utf-8?B?Z081UHdZTTRaQ0RoSlhnNHZrVU5rbG5Gb1cxQVMvSllybHc0czM5dHhVbmdF?=
 =?utf-8?B?Y2lNZEh1Y1gvTUVLTERoVWNUSVZoQ2kwMmw0ck5iUDN5aTJvMTk5ZFBxWDgx?=
 =?utf-8?B?TlZka1JYTkh2M0xZaFkvZDZqUjVLUGZzaVFrQ0JCQ0ZKUUdqUTlhWUNKL1Fp?=
 =?utf-8?B?YnRHV1g2VTQ0NWQ2QUI0U3ZwZlZmQ25WM2pPaWZmWEFjWGQrWmJjdHBaeStQ?=
 =?utf-8?B?ZDVheVA5OHJJMDVVNmpOYStMWnN1cXFjSldVd3AxMWtqbGVFU0RxTmZJRWhG?=
 =?utf-8?B?WWxROHpTRTRBWlpiWVl6NkdZNWUwdm9vSTluK2QrV0p4R1NoZHBWTm9aRFBI?=
 =?utf-8?B?Mmd1VXQyTXl2azQ4ai9KREFmS2JobHI5MjFLRWsvU2VsMEM2TVBpdW1TczVZ?=
 =?utf-8?B?ekhQUWlHVVc2OGFnV08vQ3YxRG83WHV0bFpPdzluaU15OEJFZWJwN3RWMkhl?=
 =?utf-8?B?ek5kdjRocFUxSmExNDNPcitBN3BLRlZhSEVLQlp2UE9icUl5eFRRTDExOTQ0?=
 =?utf-8?B?U3FHZlpHMUgwK2tETmVhNmVSeHgrSVoxNUlvRHFRZ1RmUHpmUGc4R0tQanlI?=
 =?utf-8?B?clAwQTBZdXdIZUJSOVlya0lIY1NENTkxZkNldUxhYVRyM1FOLzZJREpJVmgy?=
 =?utf-8?B?TUFXUkE3K2QzOHNybU5xZEdubUZvVi9lcUd0eElKNHUySEFWY0RYcnZ1bDBa?=
 =?utf-8?B?MnJYbndLQmUzT21ObXZGaUV5NWpRdGVHMEEzY20zUDc2dmovemZwSWF0M2pi?=
 =?utf-8?B?NitabGVSY214ZksvdmJKemxOODhTeWhXWXU4ZGo4SVpVbThKdWdXdjZXQllo?=
 =?utf-8?B?citvYnNEekxPNGJuaG1sTTNoZHNnR05PN0dxUG15K1ZTMXdBSElKYVk5cm01?=
 =?utf-8?B?UloxblZzVnhyZVB1TjlneC9SMC9sNm14NkJvbFdYSFo4dm9sb1o3UHdjbXVO?=
 =?utf-8?B?UDJtY3F0Mm5OTEw3R3djSDZTc2hvZDdad2tPMUVjU1FaMXRESEdaaWlxTU1C?=
 =?utf-8?B?emNwVDZxeGo2Q2dNQ2xVd0FYcjQ3aVBsNHZHYUtpU0pOSzNTdXQ3Mk5PMitr?=
 =?utf-8?B?R0VOU3JOMEZhOHpsai9NKzlSR09zVFVuSEx0c2dTRFVOckVRcmZoMUd1N0NR?=
 =?utf-8?B?OTdzNXU4cVVEaGEwT3dpVEVWZTVsTHJCd1p4SG1RbU9GaXRWSUcrSFM0ZFZh?=
 =?utf-8?B?YzU4N3RFNkdEU0Izc2FLQyttNmZpb2MwYlU2dnQwdVB6ZlZyYmlJTmJNc2U0?=
 =?utf-8?B?bGxwMm9jcUlhd3JzdVhrbVdFMVBRQ0ttWTQ3US9GM1pLMkMyaU9VWjl5Z1BI?=
 =?utf-8?B?aG9ZYmJrMThXK1dLM3B6dmpMemV5clBxS1VqNU5HYmdFNXQzUG9qTG92THEy?=
 =?utf-8?B?YlRjNUltaEc1YWc5K1NwRDdsYUYxWHYzSzI2K2o0VkNFaUFjNmwrSFNpd1Yz?=
 =?utf-8?B?QzZ0cWF0SWNORnVycEJyZ1IzZDhnaGJyMjUxQUhwZWdnUklwTU5MRGRCVk9M?=
 =?utf-8?B?MWl5ZFFBMCtFejNHUjM4ZytZbklPNkwxQXpab3RvNllGZ0IvS25WMHlsRkNY?=
 =?utf-8?B?amVhUm9sbG9vNmZBSmFVM1VaT0RCSWVscDRXcDcwVUJQbFQ2YVAwcE81YkxM?=
 =?utf-8?B?dnNaOUZSMDF4YW1zaGNZakpRcjhTaUpYb1VHQldzaEJsWW1acXFWN0RzMEN2?=
 =?utf-8?B?UytWYVVjSmtrWmNyNG8wdnBjZXp5UEx2eEo2OFA4Z056OVQvZm1uUHNvdWw2?=
 =?utf-8?B?dnArNUtqaUdydW9KZ3R5SjlqU0YwTHNCc1Vsd0RDa3hzaEgzbFFpc3hqNWR6?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e528cb1-1fd3-474b-f41c-08da5857ebfb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 16:13:07.3102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qxA+3k5HRCspEI+mDpZUOiKgXG0WCWw4tQZc8ZSuHUQS7uYSKfkVgWOgr4Fay5nwdj9U8/Njc7Hu6ZstZwV0QY2sGdcwMYUce8hH1p7PKBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2856
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

On 2022-06-27 5:59 PM, Pierre-Louis Bossart wrote:
> On 6/27/22 10:41, Cezary Rojewski wrote:

>> So the framework is still fixing the flag for the driver. Ideally we
>> would like to have all the drivers assign correct values to ->nonatomic
>> flag themselves.
>>
>> Now when I think about it, the message seems useful - at least as
>> dev_dbg(). It _guides_ driver developer to the desired approach: setting
>> the ->nonatomic flag for BE to '1' if the corresponding FE is already
>> configured as such.
> 
> that would result in unnecessary changes to all machine drivers to get
> rid of the message...

I would have rather used the word _optional_ here. dev_dbg() is a 
diplomatic solution.

As I'm responsible for catpt and avs drivers, this very series fixes the 
issue for the former. AVS driver have had the flag set appropriately 
from the get go, so no fixes needed.
