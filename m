Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E0D4CD95C
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 17:45:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A73D91F0D;
	Fri,  4 Mar 2022 17:44:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A73D91F0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646412301;
	bh=cMoVTEwFjcBTuDlaN7NJJ25G8So8SK3Y77SOEyzsLMY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IvyWp9hVBoSAkFfGKpYbhQiyNbGnn+kSwYeV6FKRuN6ybGFsaZns47bUFuJNDmZlA
	 Wg97WUH354pNETSYIeE6d41ue49QfbnAQJIygyPQyBQP0+chekY7QO0gRUqgY5XcQX
	 XjLR1H2T+wzgbNZ50YFT5C+LKQ6+3UNGuUGwJWak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE278F804E4;
	Fri,  4 Mar 2022 17:44:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E956BF80311; Fri,  4 Mar 2022 17:44:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D094F800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 17:43:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D094F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Mjx6hSqN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646412240; x=1677948240;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cMoVTEwFjcBTuDlaN7NJJ25G8So8SK3Y77SOEyzsLMY=;
 b=Mjx6hSqN8j9gVqpKNMCKNtgXtOahjUhkjPqpkQhfhA8AyRwYCdeUmch1
 EdpLUO+mCc/snWD8zIxhZAvaSiipm5O2zUgFdw/x6yfvNhSQZGFim46Ul
 1yJbxNmXOsqx7AAKQmCaXNffZ6qe7NH4o8nrvxjQNMXtXxOU4nCAE3zzV
 k4+LBX7AqtmgNeRd7HoUtoVIVfAxgE8bqzS5lLaMSAAiG2QEyXSyTTXOd
 JM5YFFtnk8V+nvhs6vXFynxINh4zDisrxonOVQtFglpiIO1muWnYWREtc
 UCZgIh2UNfzl8k1iYG4I6f4qMdOS0Og40FN5iaqNAOOB+ovs2HfiVQa68 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="234618612"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="234618612"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 08:43:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="710386914"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga005.jf.intel.com with ESMTP; 04 Mar 2022 08:43:42 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 08:43:42 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 4 Mar 2022 08:43:42 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 4 Mar 2022 08:43:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qfb993Em7rjk+vThae9RA7gzyBvL7SgQWi2Z0PasWZbD7XJrf6VC6s2VABkrG0QFppikgXtm1qHkZiUWTHdMkMVhQK8YSDASFjK4Ss1miJPcsyKmSXjBV9vZjsX62eQNLKZ38T3RecZlBI8V7FYpZcuetcXpDBsgI/WWFBxg26j3brCcEA16kXGpCqmQbw7hmKHfW/n9GRbDXuMSqouOvfOPMqlLX0GmbFaOA9y4t2GVCI2gLJbgxzTmGSLrWpgUV+xD/Y4Pk7R68NvFTgTZudRvUHOWeKLovAaMnwTEHSXzm881C0Yr9Tk5WOvp41zB72EOVc5jTspS2tJp1VGEjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8Wt++0V17V33h8q0QEWc1p5QYymQjvJHWaqDiHCnzc=;
 b=JvSeoKryAlD6o8Vq/SveJ/S8a47BSuKRGvYbMKjzp43BlP0qOwRTcWs0EzpOfFO9rd6f4wltEsEpVmyOZ0EHZQBZiJwChHpUfjhz7jxEbJgQQ42D2bpscXXghYNToBKI4n9DY496Jz6hna4fY4oe38DbCzVB5EkCm8mKIBQk/o2iDJwWh93KHVh2OpzmuA0fp0nWeqLK+aktb/ZHeUXAd4SSfI4T59MbLB4CKzj5frYSxbmQ4Y9e5uYTfnoofPD8e2zTpuLpERu52nWIJ1+QkkXOziX+C2Ul5ZFInOOaLnGZ08tzHU+XHQXNP8pnhMehyzqyvLLdOEbNkMsqWr0CKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SN6PR11MB3039.namprd11.prod.outlook.com
 (2603:10b6:805:d3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Fri, 4 Mar
 2022 16:43:38 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.028; Fri, 4 Mar 2022
 16:43:38 +0000
Message-ID: <2c848991-f595-9f38-abcf-201bae9a9548@intel.com>
Date: Fri, 4 Mar 2022 17:43:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH v3 03/17] ASoC: Intel: Introduce AVS driver
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-4-cezary.rojewski@intel.com>
 <10962335d20c89c965ad7a686250d807a103f777.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <10962335d20c89c965ad7a686250d807a103f777.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0020.eurprd06.prod.outlook.com
 (2603:10a6:20b:462::24) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 225a3777-a445-46ae-657b-08d9fdfe2202
X-MS-TrafficTypeDiagnostic: SN6PR11MB3039:EE_
X-Microsoft-Antispam-PRVS: <SN6PR11MB30396C98A78CF9A2789D3B51E3059@SN6PR11MB3039.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PA5daejrc27sVW5u65Kk0cVZOeDIaQH+9ZW3psM3HoBxuIGASalP2Fma3R+4X1gq6YDwfeq+STR/psHUPiNtVN23NM4E2m4A3CJ8kZwua87Owlel32ZzqHvam3B9otRZj1bPyMTKx1lE6FcnQMuygYqJr19m7n3ghhXLNmDKeNacD7zJrF5XuGvhaSxqIISsTiHxmNnZ2eVlYFzjWs7IZPvk03nijfWMogLnVUAa/2AUnyLJyQ2xSdlO12DkcvGtV3NTpU0rvH1CqbRTxdpllkllidIt64AaMo+RM4L6k2Rx55yjsv8hrCxKjm79Pp3aAlvqtyeDoUZ+0vcMtlU/vThe2hL+aebsgnX4fmK6xOGxAZ0JuFNox+cNL8J7CpUBm477FMcMDx9IfsE8o+0yHJ61HqzIPszeJd7hNWyiJ60Y4Y9OQDlQwuJsGCdDBiLKAm3k2OCnnw7xvKusVMjV8yhe8PdpyWJSvsLRkDYx1MSlX7ohowR2EWtUdpf9ncv6jVx/GHBR35+EJcaomdp8gNmf3JCDk4fbwulQPIpZyKSbCvpd7drwvcwKi6qAUogm/8KnjiRYmEQMEuWKvut76kroXngDGnnrJ4nHTDKIADg2pDOAxt+jjIICP/FJfMLmLmpK+HKYLHWtHew14rqFtQtqgcJ9ctQJJ28DUn9Nfp0S63NiIUdoBy7s4ioA/u8V0Do1NyQO05q9wahxI1HnGohOIBJzZqEae6oC2M52eOI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(508600001)(38100700002)(8936002)(26005)(2616005)(186003)(53546011)(6512007)(6506007)(6666004)(31686004)(6486002)(8676002)(2906002)(86362001)(66946007)(36756003)(44832011)(316002)(4744005)(7416002)(4326008)(66556008)(66476007)(31696002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3VScnFNc2NHd2VMVWoyaEhmc1VCV29mdEd2TjlybDI1TEJadEFKV2Zka0tC?=
 =?utf-8?B?NWNPZCt5dFplTDE4T1F5VTd6MU12QXhZOC9sdkx6T25JWjg4NzhwMjFIOGxC?=
 =?utf-8?B?dXl6N296T3VsSXhQQ2tKNGl4WTd3TzBwSFJnM3doaHdKcXh5aVFPL3VMclNV?=
 =?utf-8?B?anJkNEdrb1pHZGRlSzhyc0MyR3dJUzNWelFqbHl4YkN3YXRSZkxyb3NMNCt0?=
 =?utf-8?B?dy9ZRGJobUtEZnByMk1tZzhNUFFUTTl5aTJRbDNZaU5XMXVwSHdRNUFaVWR4?=
 =?utf-8?B?eVFNRW94TVltMXVXb1hqb0I2THJQR0k3V1MrVUZCNTRmck0wb2QxejhFS3By?=
 =?utf-8?B?QTg3cWVSRXVRcmNEdXVwcGtXL2crZ0lvTE0zaytBZmhITnZ1VUNROEREMEFX?=
 =?utf-8?B?SXZTbHV3NGFVQUxqbkxqQmJQb3lUK1MxSUViYWlBUEJGS29YWWs4TlRmYlZ5?=
 =?utf-8?B?c01WYStkRmlaZngvL1Z6ejVub2dqcldNdXpCb0NyYVREdTBjSkIrcXl3d2hq?=
 =?utf-8?B?ODY1SEc0N0ptdWlpbEd3VDV1Q28vMyt3dTV3OUZUVWZidnRNb2NEQUY1VnU4?=
 =?utf-8?B?Q0xnQTQrV1FGYVZRUmFEbWdibDdHUGVYL1NCc05iTTh6UWpEdDhwV1hSSVZs?=
 =?utf-8?B?NkhJRDN5c0IwWmhiVHpkNGtCeHV3cGJITDdoSUhyVjlkU3U5Vkp3b0tOQzRP?=
 =?utf-8?B?MGZ4WHB2QlNlbUY4ejRiV0E2VC84dHl4bE1wclJJSVRZUng0VVZTU2RHd1lh?=
 =?utf-8?B?b1VnckpwYTVXMzkrbmVMRnRLbHUxNk9iVytWTkVvV3NCcDEyaCtENDAvbzA1?=
 =?utf-8?B?RmMvbmRXNkxHdUxuS0dhdzJvTXpVeTkzQmgvY2tmUVo1NHVkT3VOb3hQSGRn?=
 =?utf-8?B?YzMvUDlrNjB4aGxSNU1nWFB3YjVtb0E0L3hDMGVmYVdjUTg1dUFPZFQwOXVp?=
 =?utf-8?B?cWVrQzB3ZVNPSmk1ZDNMYU9SaWRMMzA0eG5LRFZGK0ZHdFo0ZnRYSnFYbnJ1?=
 =?utf-8?B?eFg0b1Fua3ByajlDR3lOaGNNS3VYT1hkM3U0cmxNQUtDK1o5clNBb3p3ODNH?=
 =?utf-8?B?MDNsdmY2dURqMlBWc2dQNHptSWlqRlJscEhQUXhNNUxSbjlaS1lEVDVVcno5?=
 =?utf-8?B?UGpQayt1SnhZQmxYRm11SU5rSzBxNk5SdlZCUmN1c3ZRVmtkekszTjQxUW5E?=
 =?utf-8?B?NCtyd245SlhTK0ZxdDN5di9hOTFkb1ZDenczTFJsMXdCN2dxVWNoUWlyOGo4?=
 =?utf-8?B?Rm0xMnBuZFNNejNNd0xIakhZb1dOQ3V5dzNtd25xUmx5RHp3d3JrZXI1NWFx?=
 =?utf-8?B?dExGdmdObTB3bXVFU1NUVDJUOHVnSVBsV3VzVkdZVmJRNTlWbHArOFJlR2lS?=
 =?utf-8?B?WTB3NDk3cG84amdEZStFa0t5WXd3Z09TeTkyNzBsa285NjNMR0t3WFFKZGJK?=
 =?utf-8?B?YlQ2Vm92ZG9pcUFXZ2ZaRDBEajZhOGdEbG54V21aZlVIWFZkMDF3N1hXVWhT?=
 =?utf-8?B?bWR2VlJaQUNsK0VHeXhiSW1mcHRwZE5LR2tUaTF6UFVUUlo4L0xLUlU4QS9q?=
 =?utf-8?B?R3FVUjk5aVdxQ1pLNXYrT25ST2hkK3ExYnZFUGpCQllwTk0rK3NhR3FRUlpK?=
 =?utf-8?B?RGswcjI3cGhnQWpHMGNNQTVPZVByL0p1OU1PRkE5SnhjWGEvNlQzUVR4QTV6?=
 =?utf-8?B?WnZIdGFpbWJ4OXBoZi91bWhadThQaVdqaTlDTXRsaEN2YnlUdlRaRXd2VFJ1?=
 =?utf-8?B?MFl6S0JCTWI5dkJpNS90SGpFMGs3WW1TeFBwSVM4N0U4LzdIQU5rR0cwT25U?=
 =?utf-8?B?ZFZZZTZkSFRFMFlwR1h3c2tJN3ZkekhIYXljU0t5bU1PMzk1cEUvYUp6UUl6?=
 =?utf-8?B?MzRUKzZrQW1sc3hMK2J1bElPenNJQzdqR1pwNUVTZyt2NGlhZDlzVnJVNGtx?=
 =?utf-8?B?bnc0a25wYWFWVGcvM0NEekgzbEUwb3RKQm1WQWpiZkNWSHo0SjZJN2VZUzFP?=
 =?utf-8?B?M1BYL2V6WGhlWEtaVGw4WVJrZFhNWkZrUUtCZHlPbnpYSDFXOUZUdUp1REpF?=
 =?utf-8?B?Tjc4RUhyM3N4RzY5R21pSXEvV1JKZUxHenBvU0FmcUgzZkx3OS93eklTTzJW?=
 =?utf-8?B?a2kvSjcwQk9GNXZTc09yUDhmNXpiVk5XVkJRbWpQZHBrYzhtbThJTjR2cktT?=
 =?utf-8?B?L3NobnJYcnJCUVpKc0FxODdIWWpPL2pURWltelRMUmVpUTBDcjdkUm5sVFFr?=
 =?utf-8?B?M2F1clk3UlVhSnFzUkIwK0p3ei9RPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 225a3777-a445-46ae-657b-08d9fdfe2202
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 16:43:38.6863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gep7tg+jymyEP3pRcojS2pO5nO559QO2lk/W6TyWseGDh/huURjQK9e6KwUw0rVrmaLkB0GuMywc+iWLsdsXbrj8sQTGY1N9+FPKSj/tRfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3039
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
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

On 2022-03-04 4:51 PM, Ranjani Sridharan wrote:

...

>> +#ifndef __SOUND_SOC_INTEL_AVS_H
>> +#define __SOUND_SOC_INTEL_AVS_H
>> +
>> +#include <linux/device.h>
>> +#include <sound/hda_codec.h>
>> +
>> +struct avs_dev;
>> +
>> +struct avs_dsp_ops {
>> +	int (* const power)(struct avs_dev *, u32, bool);
>> +	int (* const reset)(struct avs_dev *, u32, bool);
>> +	int (* const stall)(struct avs_dev *, u32, bool);
>> +};
>> +
>> +#define avs_dsp_op(adev, op, ...) \
>> +	((adev)->spec->dsp_ops->op(adev, ## __VA_ARGS__))
>> +
>> +#define avs_platattr_test(adev, attr) \
>> +	((adev)->spec->attributes & AVS_PLATATTR_##attr)
> AVS_PLATATTR_* don't seem to be defined in this patch?
> 
> Thanks,
> Ranjani
> 

Thanks for feedback! Consider dropping the unnecessary bits so it is 
easier to navigate through your responses.

Yes, AVS_PLATATTR_ constants were split from this patch. This patch 
defines just base API instead.


Regards,
Czarek
