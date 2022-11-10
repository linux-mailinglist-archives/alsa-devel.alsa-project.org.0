Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0465562475F
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 17:45:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85B1E1670;
	Thu, 10 Nov 2022 17:44:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85B1E1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668098740;
	bh=eEJMHIA08DtHwn3wm1MpaKn7QJEwd5v75CiajfHKRyA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MMPPbdGN+omIvLrQVb/jEfDP/y8d+S2oDKb833OtnjTe4Gzm7omQL2fuEVLtH4Gcn
	 HfgeSuaCUIH7yKhbdcgaWuJlwdxLLsdnGI04ZfR0bcdUweYH7jRXq69GXp5tpAyo6h
	 GwNyHtG8PGishis3oGm1X1jKOngy9k++QznlCs1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DB9BF802E8;
	Thu, 10 Nov 2022 17:44:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FA92F8021D; Thu, 10 Nov 2022 17:44:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81B9CF80162
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 17:44:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81B9CF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cGJk5hm2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668098680; x=1699634680;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eEJMHIA08DtHwn3wm1MpaKn7QJEwd5v75CiajfHKRyA=;
 b=cGJk5hm2c66epbcpakI3GbT24fLeCGy4FHR+l1I8zXv+Ft8MJCrEYpLN
 yyCxwCqKd+6i1Bsx8mRTz9yuHD7Ii+Yqm1/XDjePB3Ew9HXVL9EFHxbE9
 cLKe1B8QO7yJIDsA9buqxEdbSnVZ6DUxJMNDcaE4PX44//OwxMr5ScBUa
 VwbgJ1182z2a0joRQmdKKXSQUvKQ3x4yt44/yVHsKX283Cv7udQFcDJ5T
 zFuSoOUL9xAikXYiUT6/6y4NrCLa478mOVV6NtmU7WZBbeJ5+tDaMCAmr
 S60vdFJmGwEMwobGY7+12f0CHOfc/pFdBu6/eumT8mg87WOKw5Cn1bBFk A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="338119224"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="338119224"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 08:44:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="637234527"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="637234527"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 10 Nov 2022 08:44:36 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 08:44:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 08:44:35 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 10 Nov 2022 08:44:35 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 10 Nov 2022 08:44:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoypUp0+ivQjtol+bWQ5VR91RlEVKe9+/tDhN4rqL4TtBf37gWOVXzCERbqKcwrQVZGCEUkEEd2U+gjAIipDXjs8fLOlb1lCOdGmx7N8ZWzHMYgsx8Npgq1JpA8/O+ve/DD6YFCA2Fho4qtNbLglQWzLdzoy/b0DrsDIdp7d7b7AkU8O0hvxBZ3E+3awJpH2Ts8mbwvthmT9RlEKzx4uhnggVM9fTGVnVKjDb1BG5qbiRmuiH+p2byddWqRJamXtPQqqGAL/lziXS8jYd5HwjU45S7dKQLNIhJ7QH4DXc1PPXAQuQftVpeB7qKqWx0gRItQwsV8tBn5jXpY4Zi47Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiAI4F7nm8G8fRG09d0CCbGOowbWaJ9ynp+0jr7xbLY=;
 b=f8WeJ6IYGtwlSlNrAaAuEeSxqv5KR0SH931dA7HmROApW6+H59NbwtcAKxrLNIkNNgPqYLy+o55ETEwvGmbBmY3U2bxJwOVYXGJ/nxyRBClzhow/1YIno0QANe9vV4kImiopUm4Z7JeenpSweQBkriD+7Dxez/HS6FRSvsMmKcG+EiN5g2VlPbgWmE0RPTKDgCI7Rv1mH+JrNN4WsB0RTCbncxbz7Dgx+daGnT77FvhvZsphEkmxZTcd5280Mm+V8vTFe+o1Xj8WP7GQVQkR5EMiAwwD23qJdRdavumyW0qOMrba/qPfI2fBtqUFCyOw+XzG+EEYzjPt4FSWdu9qIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BL3PR11MB6458.namprd11.prod.outlook.com (2603:10b6:208:3bd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.27; Thu, 10 Nov 2022 16:44:29 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba%6]) with mapi id 15.20.5791.026; Thu, 10 Nov 2022
 16:44:29 +0000
Message-ID: <db94ce72-da4c-72ef-edc3-9936a97d0378@intel.com>
Date: Thu, 10 Nov 2022 17:44:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] ASoC: Intel: avs: Disconnect substream if suspend or
 resume fails
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20221110141330.740916-1-cezary.rojewski@intel.com>
 <20221110141330.740916-3-cezary.rojewski@intel.com>
 <6f86718b-5d96-3e73-bfc0-321288e2232c@linux.intel.com>
 <8cc5ecbe-8112-2359-aa90-1d5d1b50d89c@intel.com>
 <d471658b-1c93-ad84-55fd-7c68257bf01e@linux.intel.com>
 <e4aabd6c-ac79-5e72-9012-2abfbc7515e8@intel.com>
 <65f24445-11ed-cd36-4fd2-e326bf877f54@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <65f24445-11ed-cd36-4fd2-e326bf877f54@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR04CA0065.eurprd04.prod.outlook.com
 (2603:10a6:208:1::42) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|BL3PR11MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: e97eec4b-c437-4c6d-300e-08dac33ad5c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fA1p+M16AMzDWM669wTX51OiokJiiA73LGbO+qtkKd1TbrmQM+Zd5wK+xAc3MflcsIh5SldwX7vzBbGTgkzMe3oK51N0eMjq85SRzl5pbdVS1Kr+oxkjSLSvn42dJRM8+YofLCZH8bAFT6dpTW7bOMV68QhNLcSSlELPzvKTEE+Y5d6Q8yr+91FUqO1kmMWNALe1UMHgiYwZwlBlHWk3DZT1bzDiZq99q84p2ow9zbM4K6057gB5xOh6t2jFSv0osge+FRtV8RNRI0apOnn0PFaTbqaB5u3nTUwTk1kzscygzYo6JJ1ILvQ7PJPrTOnrKU9DBvifq4o+ntbyjLnVcncAWAfa2/8+Ad6gAHAeyIDdcC19SS2u8PfHldBL1wNFKKXdnlr/rJU+gBArDZHmNz6SlZd8eux7sJYc2DX50gCnTMcGCcFUjGeCrU6jRpCg4QbecaCCw5CTf01uywrdDuqkjqSYn/JMpHijO62A7kbGNQKG8v2TvmnKlbCL0YtzkNIevE84SkyTRAGnUFN3rDFEVolScENanNIIqN9Ud8ifi8ovZXF5nb9v7Hvug5I8q22GONFHzBhzqhkUKNVUEhNzG+SSAjU6J5cX2NvQzQfcpIiW5tlPTUSXMu56Cg3Gir/5YhoXS7sPkr0XAk5M+j4XZ5RBOefeSgaRD2bWR/RPic6duZ04WWI6YXad42SaLsscPxs1ucg4cijUKqTTKbcR1e+6n2ZQ/cbBPtxlMnuzvaXN1Zz0Gc0BecIciyuRhandxIvUcwG0ggWuFKEHlkwt9zaFHVDIpfF4aXz3IO4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199015)(31686004)(5660300002)(478600001)(66556008)(38100700002)(41300700001)(66946007)(15650500001)(4001150100001)(44832011)(2906002)(6486002)(66476007)(8936002)(8676002)(316002)(4326008)(36756003)(186003)(83380400001)(2616005)(6506007)(53546011)(26005)(82960400001)(31696002)(86362001)(6512007)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qlp2RmpqajBIRktZbkYwZHEvWU5jLzUyOTlUTlJkN3RxMkhvZDVFZlBFN3pi?=
 =?utf-8?B?WEVPakU1Q08yVlJQdERpdVpabEJlekZMTUNWbjdOMGxMS1M3WW5XcnhOSUxI?=
 =?utf-8?B?WVNYbXdrRitzdFN0TktNd003dWl3ZGRUMHp5b09MUXIxZ0RJOE96aEpyWnF4?=
 =?utf-8?B?M3FYOFZhem5FZzkzTVl4UXJlZEpMWWFHVmxlNU5PanEvVTRSOVhlV2JjdHI5?=
 =?utf-8?B?ZDZhZXZUd09DeFZ1NmQwdFpWQUY5UU1pc3cvcUNzRUN3YzIrSUx4QnRpMlN5?=
 =?utf-8?B?VHVWc2Q0ak51ek1nUzBiL3VyMjgydjl3V1NIM2pRdWZ0MjVqZ0ZmQnFlU2Vl?=
 =?utf-8?B?UHJlUGs1SGZGYUlXUlVmYzIvemRNMXIwaEorTWhoWHo3N3hqeW41TisxUkFZ?=
 =?utf-8?B?QmQ3bWxhaTlXZlk4L1dBdlBMcnVGWGQ4U1ZHU0VrRGxqSktOTC8vM1l6SFM0?=
 =?utf-8?B?c1BjUkVZZlNsOVpUdkd0Z2pHOEN6eWFSVFdEd1U2Sm9LeUdLMk1ZUkdsZUtm?=
 =?utf-8?B?eVdmcDRPU0RWd3VHenVvNDRvcG5EMG5ubUhuL25CSHhZZzZaOWp2LzAwNUxG?=
 =?utf-8?B?V3dSUDliNkVSK2l1SHBJUGRiWGhJNUR1d2VYYlZ2dThKL0hXL0YvT0dhdG1Q?=
 =?utf-8?B?TEh4cyticG9HbENPVXlBV2ZWY05hZTNROTlJd3JmVWN0V3Avcjk4Z1laRHlp?=
 =?utf-8?B?SW51Z2tLcm1TbUhDSVVjdWdHbXN6cmFKQmN3OEd2V21hQm5ZME1qaTdzSVJa?=
 =?utf-8?B?aXMzTjM1bmdFWWk3ZllIN2c2M2JhQ2l0TlkyemQ5Qjd3c1NnOXdVTnhQMURF?=
 =?utf-8?B?NU5SRmFjbXBHTlUzWDJvZWZrYzhFdURjdjR3VTJ1TXhVUXNBYVEraklLYVht?=
 =?utf-8?B?NjIyRXJJM05VL1VKVjZhL0lsRTczaVpFNkZld3NvZzNsQWEwbUc2VTBEZEsz?=
 =?utf-8?B?Ly9WalRrUTBuQjEyQkhMYzExMnhGTklsNDdDVUkxOUw0eUovN0xXVGxKNzdD?=
 =?utf-8?B?a3dlQWw3WkhnZ1pUNW9ZQXBUbVNxZDVhaytuS1F0cWhZalVrM0NleGVQazVH?=
 =?utf-8?B?VHVLaWd1Q1BzcEkzYWlMTGdtUXZ0RlJYaGU2MzZ2dGswS3ViQjJ6WXRWUU1p?=
 =?utf-8?B?VDNBUXY2eVFaM0Z6aEF0ZVJubktsWldFWHhqVkRTdHJ0ck4wSDVtWC9qa29i?=
 =?utf-8?B?RVZMVDJRbmFVOVV3di9FUVBCL3F5T1gzallHYWdVNit0d3Q5Y04yU21icXRP?=
 =?utf-8?B?S3BQSjBxZ3lIMDIvb0pLeWg0aysvRGtXNnZFNmF1dk9ZYllWNXVXUkQzaXFB?=
 =?utf-8?B?bERlQnFybDBxSzhoSVlQeTRMZUJQQ3Fob3NDMEc4UlB0ajdSMzVLUDVPMlFq?=
 =?utf-8?B?UzN0WVJ5UWYvOENPbnFKQmpHTERqN0JzM1ZuNjJ5VUZpN2dxcUJkMTlneEdh?=
 =?utf-8?B?SHplbEg5S1UwN1V3L1dEVGN4SERPNHN2czAxaEdzZ01UbmZ2TGw2YUFnQXUr?=
 =?utf-8?B?U29WcTYwcGRlWDU2WHF6Z2RTR0pHemRDbVVzZVhCbHdhWjVwVWJvbVExMitP?=
 =?utf-8?B?NnNaNDdzTzZqdnZGNkpqZXFYdTI3NDhvUmVqMjFONHFXUEh5YlZnYnVCK0dy?=
 =?utf-8?B?NDdnNUtsN3lsbzZsM2FUSHNKbU92THRneWM1TklsRTgzRHp3NUJXS1BRekF3?=
 =?utf-8?B?Yjkyd3FlbUQ1eGFhZUhEZUNBdWFKejhjR2RSRlV1cHNqNnA5Ry8xdlBlVXFC?=
 =?utf-8?B?ditJa1RaY08veElvL3hQVlRtQVg4TjFkNTNQQm9pSkpsazJ6Znptak1GWXJY?=
 =?utf-8?B?K1dNa2RTVDhQbFBCU2FkRnRxRWUrNzJWdmFqSmt3bUd0dGpoTVlJMThkOVdD?=
 =?utf-8?B?aXNETU9jd1NpaEh4MWUwdDA0UWR2Zk9vcVU2cTRzODRVT1M5cEJXa2RxeVA5?=
 =?utf-8?B?WWo2N2xDTE51dHdNeUt3bzRIejk1YVVVaUxNR2swN2lRZ1Q1YXROaGRMbEhP?=
 =?utf-8?B?WVI5WEdzSVhYalc4RWsvMXkyTUprc2RCbUtEVXJ1cExISm9HM2tuSlBWek5V?=
 =?utf-8?B?dzdvbjl0TlBwVytRaEFEOGc3Q2JQSU9QU2pQUzUxYmsyV20xNTRXUGl2Tzly?=
 =?utf-8?B?S09DOHZ1WnU4bm0rbGhBaWtyMzUydFZFeTFabXVwZjdQY2FzWFFMMnRMVUtX?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e97eec4b-c437-4c6d-300e-08dac33ad5c9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 16:44:28.9535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fS5iyFiOoZnmjz3/a35Ioq5CBDM7M/MWL4eJp/f6SVvJMKkrU8HuuScrtDOPVUk6IZ0q06mB54Of16SUc1L8QoPq8HPVZE8J/OoRrv0qyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6458
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

On 2022-11-10 5:36 PM, Pierre-Louis Bossart wrote:
> On 11/10/22 10:29, Cezary Rojewski wrote:
>> On 2022-11-10 5:18 PM, Pierre-Louis Bossart wrote:
>>> On 11/10/22 10:06, Cezary Rojewski wrote:
>>
>>>> Unless something new has been added/updated, there is no runtime->state
>>>> field available. All the PCM code works with runtime->status->state.
>>>
>>> cd sound/
>>>
>>> git grep -c 'runtime->state'
>>> core/compress_offload.c:27
>>
>> ...
>>
>>> git grep -c 'status->state'
>>> core/pcm_compat.c:2
>>> core/pcm_native.c:4
>>
>> I see now, thanks. Commit from late September "ALSA: pcm: Avoid
>> reference to status->state" add a new field. Will update the code to use
>> __snd_pcm_set_state() instead.
>>
>> My base did not have it yet.
> 
> Right, it's relatively recent, and my point is that the helper does use
> stream locking when testing the same state you modify. Maybe that's a
> red herring but I thought I'd ask.
> 
> static void snd_pcm_set_state(struct snd_pcm_substream *substream,
> 			      snd_pcm_state_t state)
> {
> 	snd_pcm_stream_lock_irq(substream);
> 	if (substream->runtime->state != SNDRV_PCM_STATE_DISCONNECTED)
> 		__snd_pcm_set_state(substream->runtime, state);
> 	snd_pcm_stream_unlock_irq(substream);
> }
> 

Your question is a right one and this is the right time to talk about 
locking. Our current test results and my analysis show that locking is 
not needed (what isn't the case for the first patch in the series) but 
races such as this one are hard to reproduce. If I'm proven wrong, no 
problem updating the code on my side.
