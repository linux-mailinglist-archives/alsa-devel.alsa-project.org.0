Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2451462813E
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 14:26:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3CFE1678;
	Mon, 14 Nov 2022 14:25:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3CFE1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668432406;
	bh=WGsfmfv0qPx+rq7XSLJa/y3F6hc8pvCAS8r4roKrjQQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vEx9xXZrxZ7tu7LAvLooXycMm0N3v6WUD9DeTFC2FOrmP3VnIhRe+UrrrRs59Ii0m
	 //yFPMuR+CPAvmzZAQKm/kYMk88lf/S4XNJ2NB9B3IdsbDNOzesD3WiLfIaKpKEoU1
	 IFpynqAiD6lMmkJgjmV0w6eabffZtRvE3dU3ldxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2300BF80448;
	Mon, 14 Nov 2022 14:25:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F0FCF80431; Mon, 14 Nov 2022 14:25:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A91EFF800B6
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 14:25:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A91EFF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KLbRrtMw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668432343; x=1699968343;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WGsfmfv0qPx+rq7XSLJa/y3F6hc8pvCAS8r4roKrjQQ=;
 b=KLbRrtMwCYX9jfF1YZuF6Bt25zXnGUe700dSds5B5q5DxmzOk7ZqyGSF
 GyuLjHxtFfUQYoE3ecUZqKQLezplhgGAefHzEutY9qcERcQj8L+BR2mZ0
 q//9p0rFDN6DXhyT8kez7x2UCzDX9qzGKfdUrNP2IfwtRNvFcPn3RCl+C
 sYsIUo5UwI1gVJw0h0/8NVe4Z0gHcOtl8Thf2VqRDsRc5FVClPGb+NeMY
 gINFdRw4QF/S9HsYgG4ICr2qu0/oJSNSBLXdePlTVTqohJUUG0EEbe+xy
 LHmzHvi/3jLsWp2Txv6ZNkny9owbfdZd00V0YT0W5M8J42goCMHY6kVMr w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="398256813"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="398256813"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2022 05:25:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10531"; a="616309204"
X-IronPort-AV: E=Sophos;i="5.96,161,1665471600"; d="scan'208";a="616309204"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 14 Nov 2022 05:25:40 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 05:25:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 14 Nov 2022 05:25:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 14 Nov 2022 05:25:39 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 14 Nov 2022 05:25:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ia2o8NDv8Vc2Mb/lCDnW7oeOehoVxoUa1AZu3GZM5cNScJrQ7kJrDRGwersiziFDvcVfeuMG/3BZyvR6tFuKgKyxd/Tkf5vOOJ2vfKdU6ZXnDjOgyP0IRAXCxFdmv6FvGpQWT+MZ3TE3+DL8gFNXUD8gIhGRM8+Yg6t028Y5iOkN8rm3sdDalQuheZVFKr2lL4Wzg9PEGYpmtm2sdpfvD7Ny4gEQguY+akPkZnAJWcg/WXidgFVh96C+p66mMCulgMc/+5fNimhyJmATvMVPm5ai8maUCS1eFX9ofpj8SzjZeknQ6qFR236b8SbZlYUKHeXu2kTuE0dWOhZlfpUyEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhsvKtVrtHoNfJOBO7jduWiLP4R05fzlNem0CmoA4Dc=;
 b=CHc9WDv+A2OLRJyi1ef4Ema3RE9f4tdzAtedQzMzPKOkD158+2wgfCVDuZ9ry+/3eL6c/axOTE0fzg+xQzlao9sYS7NY4QW71HmnIxEP0+3iFvGXW5RByFI+CZnYfXjX0/ZIoAJlQtHXE7ZhxBUHm/JLZm55JABDx7zAG6uvdLlHwSf6wlFTUlgyZoUYQpm7FQEIK/RGgMDfzL1EGFIB0g0/Ct36zbK7zUE2MPPH8QB8WXZMAuqX2voJEiJ8iQ667k9E295VBneUWfEjzQINIfoPXhhjeZUTQnk4kS9Y3tC55uo5w/VhYSjhfOr3XdLq/q5YNqBNStz4EvGP8UrqAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MW4PR11MB5775.namprd11.prod.outlook.com (2603:10b6:303:181::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.17; Mon, 14 Nov 2022 13:25:37 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba%5]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 13:25:37 +0000
Message-ID: <5b79c60d-0db1-b9e3-fdd4-f320c8f075aa@intel.com>
Date: Mon, 14 Nov 2022 14:25:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] ASoC: Intel: avs: Lock substream before
 snd_pcm_stop()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20221114113729.1022905-1-cezary.rojewski@intel.com>
 <20221114113729.1022905-2-cezary.rojewski@intel.com>
 <878rkd4roj.wl-tiwai@suse.de> <874jv14qwx.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <874jv14qwx.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::15) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|MW4PR11MB5775:EE_
X-MS-Office365-Filtering-Correlation-Id: 6571dae7-7e9f-42bb-9d84-08dac643b763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GUa7sDroEw+io7UJNexLRRWSF5rK3O2ofSQ5ZiyghK1BonIKbFd2Xp3r3TXnLAkoVFFd7L9EUYsMwsKWYNUKwzZ1xGjg7riW+kbs+1Uidh3Xaic1M/KdTr3f7dKNSoeIuh7K1DFQxPbYWiKdv2MpT8I4BMf5jrD0WMbvB6ZH7v1XvqIAVIk3Sl5qgxIuf3CTuR98U0dw5jXpbyOzj67EGkRkee2nv5x0to5fZo14eRtZyH4SEaIsBQ0wo06ieGUjOJhZZuJ0Qzn79tOXAz+YMqiQzesxB3rMFlHzTmFekv3x4IKMHwKRALN6eS6IHbdbLWK4CAwEnXoshwlrz7FDqjjmUyCmqTFWzyGwxU1fccJXhdO+AyCUmZbE3ssrihbPG56OsnBkI9jy5O2yb7mQfzdU3lU1PsPBkgPj7tEiNuRO/5pkeobaxj5MFECql7V8dVkBllLX7YwgAHrJywH0D2oOVlwk/h467orrbORfkGWRNcsl9dE5+EHDrOy2cD3Am93ZOGrbw7uaCtyILmitUcMuDXYDkuAqfNS0BYEXwPGI3T8kn/hLoje0Wqv8RdJr9WbOuTsk7hv2RuOGo+d9TtsKTj1E+r9SwZaNWojVbwDtP45A3VXaIpr13FDv49h/dD7EZZfwmELaVWCpL9mcSJ8qGmr3pR+jS4tapLWQBhI1xMe1cfF4yvadKZwm54jc+Lg3qCVtkf0s0oBUMPW8gVAhw5DdjtAMbbdF0DuLneXD/tb8zyj5MlIaQJzmDYWvatEm7puf8NFIBwzN5tBo+tx5EJUGB1PL5QuW9DDjLFE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(376002)(39860400002)(136003)(346002)(451199015)(6666004)(26005)(6506007)(6512007)(31696002)(53546011)(478600001)(6916009)(316002)(6486002)(36756003)(38100700002)(82960400001)(86362001)(186003)(2616005)(83380400001)(2906002)(8936002)(4001150100001)(4744005)(31686004)(41300700001)(8676002)(66476007)(44832011)(66556008)(66946007)(4326008)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUFVVDF3b3pyOENTcGl4Vnh1N3hkaUIwQlY1WXRFSFpOODJwZGREUHk1TGpr?=
 =?utf-8?B?VldWZEU1Z2R5NjhnOVlrc253OGJoRENXeUx2cjYyOUJWdlB6Unc3M01YcE5X?=
 =?utf-8?B?ckZLN01oL0tVR2JQVzZ2ZlFFSjVLY04zMjl4ZzNjSjdwb05GZVQxYm5EcnB1?=
 =?utf-8?B?Z2ExNndXb1VaSW83WGNUbXZjanJTWm5lQUhuOXNsNWh2b1hEZWdUTWxodWJn?=
 =?utf-8?B?NWt3dzFMLzBlYW9NYm1GcUVOVGp2dVJmVzVLUlJQcFZpZDlLOFhlL0pjOFJp?=
 =?utf-8?B?M3E5cnhOdEMvTm0wRnBiZlNZZkYwUndkTnpvbno4UllyenNnZFd0V09PS1NR?=
 =?utf-8?B?M2I1Mll2bUFpb1l2RGlKUlNCa2ZUUDM2UHBobk1hY0xhZmVJQlNiRXNtR001?=
 =?utf-8?B?OFpYWVFVZXNNZTZkUHZMalpMQzhJMkVITWlxb0R6d283UlViejM1K1VmaGRn?=
 =?utf-8?B?OEtlK1o3ZkM4TzM2QkpnTnBLZWlQVDd1MXduTU1wUFdSakxDSEp0S2RuVVp1?=
 =?utf-8?B?d0wxWlJ6UnFDemowL0RsNEFsS1ZqVjVSY09zOWVxK0hOSkRUa0VNa2Nsd2du?=
 =?utf-8?B?Q01DTFJsY0F3Y0QrTHl4a0lTOVhibGthVElacHhlUWtralBmQVNUbHJDZ2lv?=
 =?utf-8?B?aEF0c3dRYU1vZHpxK2VOelIzY2tlNWI3L0U4N2tOOFVXT1FqTWFHR1BGalZi?=
 =?utf-8?B?V2NNQ1ZnTmpRMFBOM0hSa2tHdUdUM0YxTHpBRUZTYTJYcDVodnR4WWN5ZnFz?=
 =?utf-8?B?aU4zcHp3M0FiSGpHY2RTOUR4eVlMa1h6WG43VlVTcytJMTFSNS9QSmQ0ZFlX?=
 =?utf-8?B?TEtWT2JiZDZIMTNMVFQxa2pPRHM4QXFqYWpYem5CcUp5cFdkZFB6TjBwZmx3?=
 =?utf-8?B?YnlaTlZlSGJxNmVpenZXVUhsZ0dCbVBnb0RvM2JEUmc2dHJLMCtsSUl6dWR4?=
 =?utf-8?B?dWZVTUVUVENMYmoxdUNkMHRVWTBDd0lvQWZnQ1hoZ0hKQzZEYkoxczI1MjBv?=
 =?utf-8?B?M2IwUWFtKzdwSFpXQVZwRkkxYU9TT2FLenpCVHB5RGJpbTJqQW1xTDdKSjBu?=
 =?utf-8?B?ZlE3UGhOdXlmbUhRaXkrckxTTVVqbXhFRWI2dWRzaHdhSVJRUzRtUS90TVBK?=
 =?utf-8?B?dG5CaWxYVjVLSTFCR2lHTzNRa01BaWI2RHRPWW9JZmpqTFBaS0s4bER0RUJ5?=
 =?utf-8?B?R2duTU02bzlEd0VvbHVBbEhMaVE0SGpwdFQzUnBwajBLZlpoM04yZjVSYkVX?=
 =?utf-8?B?d0MxNDVuSHp3UUNuUHJPdkdWOXNJM0dVRmZNakFaZ2M0MVlYUElLbmFVVlMw?=
 =?utf-8?B?bHFtUndwVEdPU3lsREtjWFdsOVFjL3NiMlJZQXoxMHJEb21ocENDellJVFpn?=
 =?utf-8?B?V2FUekVjd0c1T0x0Y0pDaHpxZE9PMjNrYXkrQWZtcUhYYlZ3c0JyNVZYVEJv?=
 =?utf-8?B?QlAya3pxell3SmxWRmFPbzVuMXBZR3VSK3VuelZzNHdSQmNzbGErN1cwdExu?=
 =?utf-8?B?akZWZTNwaXFzNTNKdVV3VUl2RTRXVkttMVEzYmFkSEgvYm00SnQrNWE1ZTRW?=
 =?utf-8?B?NFFFOXl1RHNjem9MMHBjbk50MXpaVURXSTZYaFlLd2xCQThkMzZFakFScTUy?=
 =?utf-8?B?THk4NWJUNWQwVjZUWTdSK1E5S3pqTmVERGg4SmRFVlJubmhNOU4rOEFOdVcr?=
 =?utf-8?B?Y0dENUREM0pTaWNLRTBxZitqUWpIT1JpUGl4Mk9VbEdFVVVoVnFyMFMyOTVL?=
 =?utf-8?B?clBHZlNVcURaam9mTnZJdFVvcVpTc0xWZjF2RmplV200aXpYdVpMRE13SjMx?=
 =?utf-8?B?b1FNd25TeWRXbzE2bTJWWUozR3RlK3RyVDZ2c2hJdnlROHJCUU4vRnBxSXZH?=
 =?utf-8?B?ZmNObGhOV1N4anNjVzJvZC9oSWpDYmI5TE5WYWwvSzFpbFkwQ25XWjlrZGtQ?=
 =?utf-8?B?QWNtOCtrWEsyREtaRGVBbXBKY0h4MVBYam5nNjJVOTVhYUpFWHdkb2lwT2FV?=
 =?utf-8?B?K3JvVkx6a0xVMXFNQkovVlBDQ2JpR2hIUlRZNCtYVk8vUWIvclJBTlcwVURF?=
 =?utf-8?B?ZWZNL25yakYvUEdrUkRVcDRVbFpYM0NMTGJRdjRmWUNBWmZDK0NhWkoyNkdX?=
 =?utf-8?B?ZkRmNzFBZmhNaHZwWHRmZ0hnbmVvT295VlZkVmZMcjRIS2Y5V2hQam5IdnBS?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6571dae7-7e9f-42bb-9d84-08dac643b763
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 13:25:37.0088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vvL6b229lYsnSSlM3cKFVvcoA7b2RDLqnYD4sdFvL41DtaP0Dadu91HDLBwFVyqjxpw+ikKf82dGUHVWMOh9g7Qi5oqgUv4yH2DAumMUk4A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5775
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
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

On 2022-11-14 2:16 PM, Takashi Iwai wrote:
> On Mon, 14 Nov 2022 14:00:12 +0100,
> Takashi Iwai wrote:
>> On Mon, 14 Nov 2022 12:37:28 +0100,
>> Cezary Rojewski wrote:

...

>>> @@ -123,7 +123,9 @@ static void avs_dsp_recovery(struct avs_dev *adev)
>>>   				if (!substream || !substream->runtime)
>>>   					continue;
>>>   
>>> +				snd_pcm_stream_lock(substream);
>>>   				snd_pcm_stop(substream, SNDRV_PCM_STATE_DISCONNECTED);
>>> +				snd_pcm_stream_unlock(substream);
>>
>> Isn't it in the interruptible context?  If so, you need the _irq()
>> variant.

Thanks for paying attention to detail, Takashi.

> Correction: when it's a non-atomic stream, that doesn't matter, both
> are identical.

In regard to the point found above, that's precisely why I decided to 
use variant with shorten name. Matter of taste I guess. Can switch to 
_irq() if you believe it's the correct approach.


Regards,
Czarek
