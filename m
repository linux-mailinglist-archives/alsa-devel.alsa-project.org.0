Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A209F56B893
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 13:34:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 363EC1661;
	Fri,  8 Jul 2022 13:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 363EC1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657280088;
	bh=xDT0r+0/pa+5D8aRtJ+tx4UJ47KzykzdL7qcJ/Fqd98=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T+81tIDbrS8cHoKvUrrq8LHnwDC1cXcspzut09q+qJibYaiYCv0tTRGdES626nxEL
	 f6rkwOU0X8LMnVUcVrgQtrt5XlER3S1Iep+01nIoIMvLe0kLChGDpygHU7ZZYVueLd
	 3DVaBQawBYjDGWXILExJQV4wrYxYOGpHrrnZL7/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E2B0F80538;
	Fri,  8 Jul 2022 13:33:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6669BF8028B; Fri,  8 Jul 2022 13:33:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56DDAF804E7
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 13:33:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56DDAF804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="K4fSK10H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657280031; x=1688816031;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xDT0r+0/pa+5D8aRtJ+tx4UJ47KzykzdL7qcJ/Fqd98=;
 b=K4fSK10Hq4D3JnW2xxZg8hom8CenxZwydDt01g7WqDh/Y+EUlWFsdsA8
 k7JdYNmDxeeptqfFoXU32txeGTjQUNfmkxm4BTlYVnHqSV9311J1oaH9p
 n9mfnO8gfg2S8pD6WJy+N0ShBrwY4A5PPlHa6dvS0KeLZXUmCTxH7ou2t
 LSXWf4e4dVehnFGi5ilLn7Y8Ltt8L18OnTU/BaRNgrhPoJylkjBl1gIJB
 O+rVdHUmUGHL7wYPu/hVwE2+bD4yHDptASQsTqobb1HJiD4PD2biI6CdL
 B9109bUtj4t0ZthsqVSirfRPJ6JHNS2xsd0jDUDKtkFdv2j6Z/yiqR0+T Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="370574240"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="370574240"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 04:33:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="920967560"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 08 Jul 2022 04:33:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 04:33:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Jul 2022 04:33:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Jul 2022 04:33:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ce1u+kdA2weMk1XGyJUHqIC629wzKhVRqKJfx1aejcJAGN/cbUIOQFySuAiSFLc/YACd4sTdT0b75uT09WSfqe+N14lU+9WrPWm3fVoxbVGsf4w+F4NUFf0KTz8SLVjbypMv8Tzl69NyXkfblnTCDG2pwiRhE0Y0il8BelI0s6hhJzI2FnE8oZQ0NYyq8KwO41ct7w4SncLg9MaC9UGxC5HwN5+Vxh2YrfhoWM8n0jVqqD5/OYcQOg2u+Z9H9qxXmGVIHuYoNU0l/iE8UWxZ3V9sNb5L3pYhtMD6mmb2/H6R80pb2/htdMrXy2sTNUxWhnzCmMX6RK32N+AktUerpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ethphZFGgMixvYNEuEJXD+p2Td/av/ItTNDhGzzoaCs=;
 b=QooIJuteHP8LgentLguH6kJ8NjkSnENM+rZUAmCy8J7Ty2R2WYnd/zviFfsFrdPQvYg47j/w+Fxa2OSXsEqUSlx51XfDD2XRDAmlzkm6wVLHuqwjNGUl5OGfKtkr1L4cBfXM5RLD3FXDzC0t0FZpQKfWY9ywaB4y2pbKKoIl2F4QDyfESn4usUlhVdc20/TWBAHgJHiQqGkDl/BasSNlnJbdyS9XFCvmF7rJGHfDW+GsKNp/1q+zqWC3r2OzZHP7krvefk4eNRwSz/UHPrg96TfaOL4vrIvb7Hh9nwK6ROZj6gThfoNMrrwsbPeaTJcInlDhAPvm7nr/OudIHHDYLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BN6PR11MB3923.namprd11.prod.outlook.com (2603:10b6:405:78::34) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5395.20; Fri, 8 Jul 2022 11:33:44 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b%7]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 11:33:44 +0000
Message-ID: <f05a9b04-b635-df6f-1c94-b44371d24041@intel.com>
Date: Fri, 8 Jul 2022 13:33:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] lib/string_helpers: Introduce strsplit_u32()
Content-Language: en-US
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 <andy@kernel.org>, <broonie@kernel.org>
References: <20220707091301.1282291-1-cezary.rojewski@intel.com>
 <aecaf6aa-12b0-05bb-8ad4-8d09ca4eff10@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <aecaf6aa-12b0-05bb-8ad4-8d09ca4eff10@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR1001CA0027.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::40) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 373391c2-b6fe-4b3c-abf3-08da60d5b733
X-MS-TrafficTypeDiagnostic: BN6PR11MB3923:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +oSKfRmPQCjs5i1aJAhglpksMp4E2VHDNxaVkMflHXksWC90JIiVzaOVTen1qJScLL+kb3lJP6Tacug/Xp7oenuVR4eDJVACAkH2WL43rVRPTekGv7Yo/ALQ8dVLosOhxBII00Jv97kv0cRfW0rfGXwtPRZCyTJ4pjekRJ0GFaqL37lWctoWhPCC1siN5AiZQGM1UNfnDAELDic6hhvqB6jaXI+Dg8yJ+hwhOV44zXSEBGyQKbfzuPfklpyoBI4IDNiF3QvX+/GbJCspE7gfE6mjABOzWe8nFfTEATLcwOT67gXd3gzo5p8VMJ/yPA4H0s4LJ1fQYxGNw1NysI3jNZNaZl4LAhuAfkpEScjCz4TaJwGKy6K3nyYLBqXDgdCXwP0Xga+5uddcz/BIc2RgX7WH8NAnHqF5SQdDDCYLCU/zOpT2Kov7Oo/jMkqYoURRXaVMQPPpzzoKv05yp/N3LDBanTlmxPST3zOlWaZYw4Fe+L+u8luwgeLyItmpuG1Jn9D5spEd3exVsMas36Vba1yyFtJS0t0v/noq4l0yc3aVKS5Fv102CwAVEHgbv4xu5aJy0R0yxH7EK7t3dhujEpuswOGyaUE9PbZddLuzBs/jBK1eSltEynGPfUqtmEpY+38RTWHTSL40r4xvXl6fcOBsRu2cMm1IM1PG3eB8DEiWEtKZZUJUGy3kC/bGr6sRiDZwLegnoO5rP1UJfVhOD3QxmzvCApX/ebmEZ+Y17fWhqeHeUaP8uIAEAcVZCZjcdWjv1NYAIELt8lAUxX98DG0lyiOHkz2xwCDMsL0uh12jZBSiP9cAwC8jwQtXIxNLeXXPSZt451EpNPIl7mtxt8ojvbFf+jeaUkQ8n5qpQpM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(396003)(346002)(39860400002)(376002)(366004)(31686004)(4326008)(8676002)(66476007)(2616005)(66946007)(66556008)(6506007)(2906002)(36756003)(38100700002)(82960400001)(186003)(44832011)(7416002)(6512007)(478600001)(6666004)(26005)(6486002)(86362001)(31696002)(53546011)(5660300002)(316002)(4744005)(41300700001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXBjTlBzMENyYmlkSDZBS2I0TWxadVh3bGtvTitOL2pVMUQwajNrWmJ0WE12?=
 =?utf-8?B?T1g2NTE5TTJWaHlxUDk4Tm9JSk9nTjkyaGZqVGd0cTBhL1hUdWF5SHV0Wkd3?=
 =?utf-8?B?TlRSNDFtMWh3NnN6S2tVdTNFQkF6elIyUGNjL1lad3BOZkt0ZCsrZWlFZDNW?=
 =?utf-8?B?NDlBVWZ1YXZZcHd3ZGF5VkFMR2g4dGNaK3hUNThvRTkyeVg1Vkc4dUYraGl2?=
 =?utf-8?B?OVRTL09GMFNrd09ZY2xLbmJOYVVXdjcyMlE4MDNhZUMzdlUvaUtScjdWNjEr?=
 =?utf-8?B?c0VUTkU0dWJHMkZRZUR5Y3p4dThlS3BQWFBtNExKQ1BteVRkOVU4Vnh4WUNa?=
 =?utf-8?B?VjN3VElaYkhIbGs4U1RWWjVtaUxMc3EzNmhKSWRHV0FpUVVCNTRDU3lFU1JU?=
 =?utf-8?B?Q0pmelBVNjI4ZldnZGF0enEyUHdNQ0RLSzkyTTNPZnRpWDNtblU0M2lUeWdP?=
 =?utf-8?B?MHEvVWgyY1RHK3kzUUZFaHBQVWFzSHFiK2dZMEhlYzFwZS81MzdTZU9vUUN4?=
 =?utf-8?B?WUYyZktLa2xzSSs2WSs5cmJOUEhxdmsvUko5QmpJK0NmTll6Y2RtR09KemdI?=
 =?utf-8?B?NTh3OGcvaEJhbzNkYTJBR2ZRM0JJSU5mRDU1MDdFT2VFQTdudzI0SGZwSVpa?=
 =?utf-8?B?V0lnZk1zQUFxc2VmZFRUNm1WYlpHK000VjNzTi94NlRMRndYS3ZzOXE5Y2pW?=
 =?utf-8?B?V21OS2NMaVFLTzdpVjNpcGE2ZWQ1RURBK2MzdUhFN0Q1UTY3NE9pNm5yWWhw?=
 =?utf-8?B?N1l4TFJyUjRUZmdTZU5uUDFxbVh6MllScXcyYTVYSWNneUp3Y1Rha3o0NmRD?=
 =?utf-8?B?N1N6SzZMa2pUTkVETjA0MW5sNWhiejhaY2pQbFZFTHNzSENMcmJ6TDdLZlk1?=
 =?utf-8?B?YlJNRlQ5Y0R2MGh2dkhEMi82ZFlVTEJlU3JRbnFoazcvdkpTcVQyTWVEMGdm?=
 =?utf-8?B?SzdVV2gyZ3YwUjF0bzFpa1Uzc3Y2YjlvZmxEaXBERyt5aUtTaXVtNnl0WUk2?=
 =?utf-8?B?RVRNYUowV0drcnl1enphYkZPMGMrSmQ1aFduejU3SDltTHlrbkEwYkxDUGhK?=
 =?utf-8?B?OTkySnQyV2RrUThiNUZkM2c4ZXkzclhQaUVsbHErYlhyTkpLRWlwb3d3aFdk?=
 =?utf-8?B?VTl4MTd3TGhOZE9ZWTNJUUdmZFQyeUVlRG92U3NqSEMySG1GMXVvVG9neHZn?=
 =?utf-8?B?VTlwYWFlV3llRnNmQXVEbnEzOGxNdFFKQS9Yc3V5dXdaZDZ1MHhpS0dzQ3JM?=
 =?utf-8?B?OFlPcGxPSVAvajFTYVh1NkYxQXlWSzlvbkxDbVd6NDdkMVRpblk5SWpLUTA1?=
 =?utf-8?B?aWxiYWE0dEw1TUNablRKYks3eEZvM2RtL3NJRUdoQk1JWmJoc1Y2U0oyWUVP?=
 =?utf-8?B?ZTJFWFQ3eGVIR0NmZUd2QXM1UkVKUHovczFZTTl3R21qbEVFWXR0UVFpRlcr?=
 =?utf-8?B?MTdRSTVlOVhERWNvMWNOc1Bmc3pYMXhNSGErYjB0bUhzcVJXWUFrYWkzWFNv?=
 =?utf-8?B?MEM1Y0Z3NkQraHJzdm9vbXA5WEhkZnh0c1VqRUhPYXgxdmc2MVdkZHJudkh6?=
 =?utf-8?B?WmxsSFNRK3hCaWpxd0prYWhGN2QrZkgwa0tkOW9aYWw0bVlrdWJoMGVRVnVQ?=
 =?utf-8?B?OVlOU0VsdXd4MEM3VVZRRjY2WGJCbXRKQ053MWJLV1BtZ2hBaENZVzh5NTVK?=
 =?utf-8?B?b1dwd2FmTkZPb0tIY1ZNWlB4bUZCNmxlQVNXS1Z0VjNZS1NzNllPcDVFTUdC?=
 =?utf-8?B?ajVXQTVoeURKaE96ZythUVBYbHcwZU5BQ25Xb2J0dkk5VVJHS3laeVFHdVBS?=
 =?utf-8?B?RVZuVFo5eEZSS2lOcHQ1T0E1TWZ6bHJjNlBoQzhwSnNrOUhFY0tidkd4ZzYv?=
 =?utf-8?B?NXQwVWtOUWRsSlZRcktOSEZVM3lJTmwrQ0ZZcEh3WHFjQ3Q2aERBeWRJUUtq?=
 =?utf-8?B?cVBaN3R1UzN6dTVmWE1SMHJvNFRqczJvOGdzYkFIUXVraTdlYlE4Uzc0b0RF?=
 =?utf-8?B?dU00V3hJSW0yek14YmRiMlg4M2p5eVRyaXJrdlFjWVlTRjRHU0J0OEpPNCtO?=
 =?utf-8?B?N2NsN0dCWE1LdHJyMzBVWTVYcGlheW8rVzdkQlQ1QlJHRExvRFFSVVA3ZEZp?=
 =?utf-8?B?anR5M3JUS1VMbXNEK0pzSDczOEN3b2wzVzNFTEFsWGxLRGRKY0RhaDVaQkx3?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 373391c2-b6fe-4b3c-abf3-08da60d5b733
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 11:33:44.5357 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtDBJTTKr+z5UYs0wL0iCUfqSywFY7iPNjUtpT9GkmUyrVyhkai70XMABLGBvcoUGl5J+prsHT1ZDxB39s2cWMS5rpbogGZpOKu+p8einOc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3923
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 yung-chuan.liao@linux.intel.com
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

On 2022-07-07 3:51 PM, Péter Ujfalusi wrote:
> On 07/07/2022 12:13, Cezary Rojewski wrote:

...

>> +int strsplit_u32(const char *str, const char *delim, u32 **tkns, size_t *num_tkns)
>> +{
>> +	size_t max_count = 32;
>> +	size_t count = 0;
>> +	char *s, **p;
>> +	u32 *buf, *tmp;
>> +	int ret = 0;
>> +
>> +	p = (char **)&str;
>> +	*tkns = NULL;
>> +	*num_tkns = 0;
>> +
>> +	buf = kcalloc(max_count, sizeof(*buf), GFP_KERNEL);
>> +	if (!buf)
>> +		return -ENOMEM;
>> +
>> +	while ((s = strsep(p, delim)) != NULL) {
>> +		ret = kstrtouint(s, 0, buf + count);
>> +		if (ret)
>> +			goto free_buf;
>> +
>> +		if (++count > max_count) {
> 
> I think this should be as it was originally:
> if (++count >= max_count) {
> 
> Otherwise when we reach the max_count we would not realloc to get more
> space and the data + max_count is pointing outside of the allocated area.

I believe you're right. Will change in v2.


Regards,
Czarek
