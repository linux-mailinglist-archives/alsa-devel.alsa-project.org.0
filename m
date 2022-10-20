Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D987605A14
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 10:41:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D73BCB772;
	Thu, 20 Oct 2022 10:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D73BCB772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666255266;
	bh=HpDeEcW21esOsXAAZhO3g+zwWpDkO3ihc4MfdX1UPqc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WWcHms+GZILo3hfmeiABBlxko+83UQIaKdQflMDiWoV5pIzJrjKYrEbcy0doKUUcB
	 62bEhQDvLxbd0Ir5hYSZbyREbS8VBLnTV5AaWcc1nfAdTGUB2QxQGZhWFKKjESSBO2
	 t8gBPnmSOJwvLwt8bbHwb2CmfFKChUZihB8q9uQk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CF03F80137;
	Thu, 20 Oct 2022 10:40:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 649A2F8032B; Thu, 20 Oct 2022 10:40:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4B14F8032B
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 10:40:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4B14F8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bpS4Jgfp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666255205; x=1697791205;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HpDeEcW21esOsXAAZhO3g+zwWpDkO3ihc4MfdX1UPqc=;
 b=bpS4JgfpiDdBDRbNBG2RqL7Z5CJ2Ki5HU39BszC2J8d3GJF8uybcDod9
 XXi2VJXZdAJTkk/WfdI//vTcrbeuxFbWD9gbNYx6FxTtQwCVpexEBo0ot
 Ex2aGDLZDoGEhQ3vHns8OEIe7bvJuKX4Eiw3M0AaGHxnJCFJg+7swRYQL
 sm2PAEq+ig3CoqivRbu2xKmQx3egJBQ7nXIKyXDsv01CpNa5U48WndouE
 nMOihcAIhxHW2wUf3WlERqctOHvkHu84vl8KuCDtBa+1XbmrKgUu/lXoh
 +KMFIqhyM1PuD/rMmS92PgPAmMTY7fglRRI8PPa1F9nqht8o+32v+UMAh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="307750097"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="307750097"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 01:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="692850475"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="692850475"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 20 Oct 2022 01:39:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 01:39:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 01:39:44 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 01:39:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ck/ayRxfQxQS/q3Jw1yAWs2IyMTMFDAY5p9RH4t9GhWn50QKjoBPvHx7JxC/C3Xx/auwhVU8qEruc1JUZa7lD/h9nIp9EbRC7A7c59ykQy4DecAdI+8Ydg2Ix2Is+pC7U78owmcCgE6Iey/Jp3w/rOe3hpLa+3YI7Z2ass/lAw1VbGrcNX9fJKAzmtcEo7m2xTR0RTwReQgWLnKAVBzKOlIcy2XBTOWRq++Eqey9BeHfiOSDE5SP579aQds5680iqsVUyvyLDun7ZszmoDzETTWlq/DQ44pHDc9pGfmv1xXG9/6S9r78hBKtJ3Q1p+ah+/MlPGgcQNVnr/2eBG83lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRE4J0of24U03JG/IPjcGu2QfkaR7SICqV1TpX9dvcs=;
 b=O5JP1G0H5Qm4ErTfYv3rNXY5mq5fiPd3QWzCf/rBgiwodpYahMVWoE+ZjOqO67Lm8or4xMTSnMRRdwawajzzRTO1HRY6RLw7Fje/y3zUl865osNFScm+25uvx5kn7uUYl3U6mVl5Do9ZNjD/UD7Q+SrZ643lLyum9V3Hi3XXjZqiwEidHxFRuNvAMPlK5SIobhsXozo+WaII7Sp/9m0yP7pBVlYwroEI3rIxkydP9bLRew4It9kKksEwnaRfKVTwNF2Zp84g+f71548Uc3/X/+tIiZ36xibe+0TM9AuiBUPodDmycNO8dUW0N5GBXshKmwDUmfjN3Tmh2WU0k3Lqyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BL1PR11MB5980.namprd11.prod.outlook.com (2603:10b6:208:387::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Thu, 20 Oct
 2022 08:39:41 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087%7]) with mapi id 15.20.5723.032; Thu, 20 Oct 2022
 08:39:41 +0000
Message-ID: <876886cd-56f8-1ca7-aaa1-632a0b5ecfb6@intel.com>
Date: Thu, 20 Oct 2022 10:39:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
Subject: Re: [PATCH] ASoC: Intel: Skylake: fix possible memory leak in
 skl_codec_device_init()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, <alsa-devel@alsa-project.org>
References: <20221020034548.2391293-1-yangyingliang@huawei.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20221020034548.2391293-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0537.eurprd06.prod.outlook.com
 (2603:10a6:20b:49d::34) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|BL1PR11MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c637c0-ff10-4b0a-e390-08dab276a165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qk7VJQXpZa1+rXGKMF1FtlxnAWm7vAZHNM+NmHiBWcQONT1USYmy42oSTy1t5qtjwgfuFKzofkA2MVIFaYWDjsdd70Wvqjlu40KnF5KS2wfjpXUa+tdTjbC+o/92kbQ7CVycCvE+sc3oajGKtFd/Ej7lm3UO2KAW3qF9Okyt3njvOdzad7tSXDuBqMnT/xEksr6e87GMmPFrCtA8Uk3dg43d+A5Jk5wdONPUcpMU5Mzy2ZhdfCtL0o+AccVFfRHgicpk6aeW32A26a5zj2uh7UX0t0zEG8DQiopGxoaGvyM4e/JZ1J+2QyPwyfSh5pxhIYZ8qAMblpF/EOqkhdlPPptrzHBnvEH+tywe1Eg7Ktb/ycdzqJVcFzFYyNeq2k/w5A3BFvH/qVfZYdFlBDrE5hbWkHZUm+O68q0NJouialhHDTqe8xJGzBjx/oRJkcttO4Tf7MK+B2EAjC6lfWicrROiWtW4GleOjLGwhMvUeHgmQ6U2AhflXex5BF7kiTfJX1wW7RpAYVqJ3c8QxHkYc7HPR4AwaQAcQPJNTS8NxkFnbmioA51CCM2wCZ0yJjLHsfKPJ3H/Mh43RLGMntFlz7AZIDo4cqpRSdrGMiiCHLBmyfvyBBxV1hTJPGjht6+MHOdyQn5Sm6EnNeUk349ZjA+8Z7gw8P/doNRz/XmrSZnhSRcEEiELuHxWtF2NnAmEaSfTWvYIuV+vP2K4uKzO5Z/tV99Yhy7oFCpR18fZ2HXdlJf/Rteq7ysyHp4ZXJcMJHyW9KcbioJzaxxT+ZEGZ8/6P/9goABKXhDlaJClBFPA4jaP/jXik3EY7hjkKJsVe7ZO7JQmViFiYuUzQt8XmOolSFbiFl8B9Ma5loFtImJkIeW/PePJ6+9p38mk4IOp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199015)(66556008)(31686004)(41300700001)(6486002)(66946007)(83380400001)(38100700002)(5660300002)(31696002)(4326008)(8676002)(66476007)(53546011)(82960400001)(86362001)(44832011)(8936002)(2906002)(478600001)(966005)(6666004)(186003)(2616005)(36756003)(26005)(316002)(4001150100001)(6512007)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDhEZ0l1bXRaZjZ0Z2pDc3kzWVNiay92UUNHMmZsOUpQNGxWUWIxeWM0SEJv?=
 =?utf-8?B?clJHdHAzT042L1VOSGprK2VSdXRxTnZKMTJtKzRwUDVQSFpqdVFKM0Q5Z0hJ?=
 =?utf-8?B?US9XRnI0L2NsRkZ1VDlsR3NaaXYvQSsvVXNrNmJCU0pRSjFxU2xRN0FrTGZ2?=
 =?utf-8?B?cXRQTGZaS1BraTdlK3RPUFRQSUJ1OVlxc2EwZndLWktCa2laaVRkdlJCQ0Rm?=
 =?utf-8?B?STZuQmVTS2Z5dmRSdlNrdUJjVlo5MUNqS1RlaHU4N3NQbXBEcUFhV3M4b0hN?=
 =?utf-8?B?ZitLZC80VVVqamY3S2diNGhZZVEweUhUNG1DczArRXZYTllJMHY1cHB5ZTJs?=
 =?utf-8?B?WThEMTVUUUFjWTkvYmhrOWo0SXRoNTkrTENQTGg5U0xQQ2ZRdllJZ3B5bTl3?=
 =?utf-8?B?UEZTZ1NveUpBTWE2bHY5a0k4cVo1UXFFUXhUaEtneDFnYzlmNzltN09IM2FD?=
 =?utf-8?B?amdJeG5Yajh4dGVDNFB6MVljcE10M0FVVUVCQ0RRZnA1K3N0UkZNMUs4QzNo?=
 =?utf-8?B?aU81MjBzZVF5dGYvcUhLR2NBcnM3RzRDNTFvZVpUQTVjVDdzKytHcHUySkti?=
 =?utf-8?B?ZTZrclBncWMzMEFKSFhhVkdBQkI2UnQ4emlEd2FTNlkxRHdhUmU3aXZjc0Fr?=
 =?utf-8?B?dVNhTlBWMEQ0VnRyS0JxLzRHa2VSdVhxWUVUMTdmUFV3TmVmdDh1K3VVSDBG?=
 =?utf-8?B?eDh5M09abjhjUkY5azZjejF5ejcxWXByTnVWYW1hUHBES1ZUVFZsUlVCcWUw?=
 =?utf-8?B?endmS1pubmlFTERwVnJpR2pRLzJhWHNENmFKWHVCcktPZjlzUi85UlVoYXhK?=
 =?utf-8?B?WUdyeXFxWnJOSHdMT3BVdzcwSndmeDhhNW1TZjR4cHN1U0IxNXB6MzFuMlVl?=
 =?utf-8?B?SzFxRDNwUzRHL0Q2MWxlU1QzYUVZWURNUFFYeHErM3BFMksxcUx2aThFZFAz?=
 =?utf-8?B?KzF3RkxsTUJaZElOWlNKNkU4R1MvS3NYMjB5QVliY1BEcXJsZ0lJNEJ1Zm9C?=
 =?utf-8?B?cThZNXVxZHZlcWFmc3lCeUY4ZTVBSEgvZk1mOFFQR3EwUzN2MWpXK0tFemJR?=
 =?utf-8?B?QVQ3Qkl5TklNU0lyaUVJemw2NlNkUEtad3NyZlBZcVZQSGR1SmFPV21wTUNo?=
 =?utf-8?B?TW1IckdWQ3lUcVFEalNRUXhBdGRWeDZrZEV5Zzd5VTdNbVBjZnpMbmRqQmN6?=
 =?utf-8?B?QUg5MWt6WjRpSHgyVWlicjU5VUdGUWlhcDcwRTZ0cGZiZUE1TnpyZUlJS2Q2?=
 =?utf-8?B?TEwwUG5iSkRITGVmMXV2bS9lc0F4NHRaMWJCUmNSb0g3ZWZwMnBkL2xib3Vz?=
 =?utf-8?B?ZVNzaTdLZk56VGdFZlN5SENxaFNWZkxTaWJOQWpXN01mMUpKRmhndXY4RHU5?=
 =?utf-8?B?MnlwY2ZRM2pnb3NCSVVIS3ltdktWdHR5bDIybFJBUFVPRmtZUWpOUWRyL2Rk?=
 =?utf-8?B?N0xUd01HaDRCSS9Wc2NsRDBWUm42M3NGcGlwRTE0elM2NHRDL1lTT09vNytn?=
 =?utf-8?B?TGc1Qk52a082RGdmbU12R3dxSWsxdzRLZlBDZFRLNFBRTE5xWXJBdXovUzlS?=
 =?utf-8?B?TWNJVnhBbnZGVVEzS291NnhZclR4RlhpTHl2QklkMUg3VnVzZlQyQi9iSUtD?=
 =?utf-8?B?N0hJdnEwVmxVODIwY1NuZUN5dXRxM21sRTdKR2dhdGFSczF2SkpVN04zaXEw?=
 =?utf-8?B?MzZMWXYzbWUrc0R1M1Y0WERiT2EwYjNCeUk3elVrV0FJMm91T05CajBBVEFC?=
 =?utf-8?B?dkl6SWVRMVJvNDFlTUtsV2lCaUdyRkgvbi9xMnRlc3A4dlJDYjBwQUJZOVRG?=
 =?utf-8?B?YkM3LzRseWs0Z1MrUTVWUW5qU3lzWmhVOTVCTWVaWEVzMWIxbEcyYk5pb2Z0?=
 =?utf-8?B?azlZbWJEMlpyN2FHMHhhMTY4Ny80QlRod1ZIQXVta0dkR3BYK1ZSVDNocGxJ?=
 =?utf-8?B?TC9HNkYyTW9QbVZCTEJNRVgwN0xvSUc0V1d0Q1BaYW5mSUpmakgxSVF0QWtV?=
 =?utf-8?B?azg1OUJYMWJJc21TSThTZ1hpaC94a1BYZ04yaHBxWkRpaWlMN3NrMHhDY3Vl?=
 =?utf-8?B?VStVaGIvdTZ6amFUMHRTaTRla1Q0S1lVbVBsSHZqSXBNcjMwR2tLQXBkNW1m?=
 =?utf-8?B?SmpPa3huWjRiMzdwTFZ3RG56aU12ZUp5M0hRd2xIdDJHUFpJc3BCTHp3Ni9R?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c637c0-ff10-4b0a-e390-08dab276a165
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 08:39:41.2227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbyL0oIk8vmFuZoVNRZ/bRdqV4kHe6nUnQ/gq6lfj4R2vJCrZA8fNKcJYYdNPVD3DfJFMWH6Tc3q+U4A1QpBKWqf+nCZ+QwzQDNf9DmITbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5980
X-OriginatorOrg: intel.com
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

On 2022-10-20 5:45 AM, Yang Yingliang wrote:
> If snd_hdac_device_register() fails, 'codec' is leaked, free it
> in snd_hdac_device_exit(). And device_initialize() is called in
> snd_hdac_device_init(), it should call put_device() to give up
> reference or the name allocated in dev_set_name() is leaked.
> The snd_hdac_device_exit() will be called in dev->release().
> 
> Fixes: e4746d94d00c ("ASoC: Intel: Skylake: Introduce HDA codec init and exit routines")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   sound/soc/intel/skylake/skl.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
> index bbba2df33aaf..f0048e3fa619 100644
> --- a/sound/soc/intel/skylake/skl.c
> +++ b/sound/soc/intel/skylake/skl.c
> @@ -691,7 +691,11 @@ static void load_codec_module(struct hda_codec *codec)
>   
>   static void skl_codec_device_exit(struct device *dev)
>   {
> -	snd_hdac_device_exit(dev_to_hdac_dev(dev));
> +	struct hdac_device *hdac_dev = dev_to_hdac_dev(dev);
> +	struct hda_codec *codec = container_of(hdac_dev, struct hda_codec, core);
> +
> +	snd_hdac_device_exit(hdac_dev);
> +	kfree(codec);
>   }
>   
>   static struct hda_codec *skl_codec_device_init(struct hdac_bus *bus, int addr)
> @@ -711,7 +715,7 @@ static struct hda_codec *skl_codec_device_init(struct hdac_bus *bus, int addr)
>   	ret = snd_hdac_device_register(&codec->core);
>   	if (ret) {
>   		dev_err(bus->dev, "failed to register hdac device\n");
> -		snd_hdac_device_exit(&codec->core);
> +		put_device(&codec->core.dev);
>   		return ERR_PTR(ret);
>   	}
>   

Hello,

That's a tricky one. And that's because the code added in commit [1] 
which you're fixing here, basically mimics the original code that has 
been removed later on in the series of mine [2].

The key part is: function snd_hda_codec_device_init() replaced 
snd_hdac_device_init(). I believe the former may generate codec-leak in 
situations you speak of.

Now, on to the fix. My suggestion is to start with removing the 
following line:
	codec->core.dev.release = skl_codec_device_exit;

and skl_codec_device_exit() function itself. Let's leave the default as 
is and see if the leak still occurs.


[1]: 
https://lore.kernel.org/alsa-devel/20220816111727.3218543-2-cezary.rojewski@intel.com/
[2]: 
https://lore.kernel.org/alsa-devel/20220816111727.3218543-6-cezary.rojewski@intel.com/


Regards,
Czarek
