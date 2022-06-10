Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5406D546BB1
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 19:34:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F308418AE;
	Fri, 10 Jun 2022 19:33:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F308418AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654882466;
	bh=p1/RFTJZdi7duS3clzf5DC+0bDJhtlPEoMo6nr7qA74=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TSxE4CsEwh2qooMTYHTmQ8CsoMIUGd4P/4QQcjIygQ46g6KCWrzNZAEemwcj3qiPt
	 XC3z6JfN7seFMQRtrD8zvB2XzTJsGvkq8pmD74Ckh2CXWJZHqD12JCULYB5EFd4iT8
	 V5ZQrXn+49vbXKi05OBkh0Ga6FfoIYAUJta1gnv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 600C6F804D8;
	Fri, 10 Jun 2022 19:33:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF6FDF804D2; Fri, 10 Jun 2022 19:33:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37BA2F800C7
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 19:33:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37BA2F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RcH4KH4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654882402; x=1686418402;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p1/RFTJZdi7duS3clzf5DC+0bDJhtlPEoMo6nr7qA74=;
 b=RcH4KH4ulEyokx52CDLTNwmOSvZZk4msGuT/Mrr95owIFVM7ZpXENWV9
 6xAI10/MnfL6ZiejmwQBsnW0KzMQoc7y9BJ2e9Y5zcIdT6Mj55UR7Kz1Y
 6vT8F4NkdZlNWbP0esh//xWJFu0znQUZXUlsMOlR1STatazT54uKqyNQt
 ZWopHURjFXrV3+ubxxFeMGY055V0NhF4raOtlEP9poSbtg3272Uda1rTa
 J37ZG8WPvoC46zbEs++ECapHYJJrr6WnEgFFsM1a9Kp3tf013I6syj2cX
 jhZClSdxZLFoCTtiTWFjDhTtnCyeqcyw4UcZP6Y/aMhgSRspuqQXKYq5+ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="260810958"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="260810958"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 10:33:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="725055792"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2022 10:33:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 10 Jun 2022 10:33:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 10 Jun 2022 10:33:17 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 10 Jun 2022 10:33:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RECoWI5hcm3vlDBVPKMr4nP6RAL/dozAji9x4iN+upZ6FRWND9IKNR6tlD6pgAlWc+uqaN2AIvroVAsbZpHdh6Soqhd5n6BR3Sr7HvdiP4CwOJTvfLk735de+XGdxb5b5finfyh686j1ZDWt15Vv5rGbV6OMvskWFqnyTWICnK3NSGuAWvNDC+h83c3WrzBgDQ4V3YZDPP/mKyvxN94l17q05SXUR2M4bD4GwCErC/eSdzWk3QsyL59AUnD+PcFa5MsOc6vXN4J/k2c7tVBNqlyl9+OkRRCua37WkxRLeQIYxmlJNsiKII9TJDA2mtcSzMz/GppVhHauMHM6T/vERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PO38QGuUd/5SIJesQSzGHaWovhTra6xFXLYc5TUdpZY=;
 b=NFo7kgR+NxA2isiT/HLAfRpRf7cx7E5O31wMp+FLw6g/QsHptNI3wrnRsBni8tB5NIE111QmVqUkBbwCbvR1IY0blPlU9vFzSFGf904qC8SHg03la5B9Oa6pY9qSnluA28Y7vrMQ0qtoOaKUrjXN6S+SQw+pk2jwOnX1yH1ZO7dnVEzh839kAf8aa8xAjQRU6MtE28tIe9HnOvbXBLCSS8yim+OJwjYLaO7nJ46zQBHvBpt+AsfCOnPPusALpQPyKdhqCdPGBj0rqa0t+rMFeirz5bbqyXgjsidsYWfTbCiOdFA85S88URJ2PtZh/cazS7wmXv2GhnA+JPwL8a4kKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 LV2PR11MB6047.namprd11.prod.outlook.com (2603:10b6:408:179::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Fri, 10 Jun
 2022 17:33:15 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1530:7c7a:bfbf:6b9c]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1530:7c7a:bfbf:6b9c%7]) with mapi id 15.20.5332.014; Fri, 10 Jun 2022
 17:33:15 +0000
Message-ID: <2634f801-446e-04e0-89d6-5bee25dab109@intel.com>
Date: Fri, 10 Jun 2022 19:33:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 00/17] ASoC: Intel: haswell and broadwell boards update
Content-Language: en-US
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220610123627.1339985-1-cezary.rojewski@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220610123627.1339985-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P251CA0022.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::27) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b1cd52a-6462-444d-9e77-08da4b074cb0
X-MS-TrafficTypeDiagnostic: LV2PR11MB6047:EE_
X-Microsoft-Antispam-PRVS: <LV2PR11MB6047F4EA28CA1CD7002353F9E3A69@LV2PR11MB6047.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GE9SWUf488IJxTxLP8U7WWvluW1929+GnZ0w1hpQPDVKIAsKuB3pkncuYVuwZhvxNN5U7tjhtldvnn1gdWoVJVj6dfrARacMwMJBYFl0rD4lYvw89FmYjqwEDkalM4MpapMSKFRxbMUiwpwkYdGPw2uMAmJVdL4Yn2uBWhbLEBdNWe0jZ1aA/2OCmU7vz3kYgqC2KDRCDWG1QmMikr/GEoD2KvGuA5YQ62jvD3YUYCPB4Hns7yiLKiZFx/3umZyEKf4/Dj9j3F9Xe0wHg17SvRlep0zpqVxV6ZhCf3KUUpRpu9Y49C2XKun+6T+u+l87NBeswyKaZDsTUZv2HhHTsP29UsgmTpnExH840rXlIYkHTusone0qTUaRwX3kVnxqo0Iph8YuI3JCiYTVMf28yhbLUGVUpzsmyIn6sOEzgEqSWGRUppbTMFR646W3HDvAaI6b1mflWSGj5QklTe7936TXz5nKiuDyue496cd3pI2bgoud2CNSXu8jJ7Z5EthXMFDxfmFIhnftAu+5IJhVnlbrfCfxLmBg8KNBZmODYDQEOSZeYiuJAyzrLdhb7HmTzYMKoQ+fYE+qi2DFLnKN29pwu9HmikyhSAuEg/BZYCxR+JjbzB0B+bjbIV+dNh5ZImaX6O191ZrwpHM73dxDGtk2XYH5yDo1hIXL8mWi112RDUmDQJiXz9ibx2WEq2lO4nNd2vVTJBkG2IXWpft7YlY7VwXjjz8N8ZX4nU+HELo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(53546011)(44832011)(6506007)(38100700002)(316002)(66946007)(4326008)(31696002)(8676002)(86362001)(66556008)(66476007)(6486002)(5660300002)(508600001)(82960400001)(8936002)(186003)(2616005)(31686004)(36756003)(83380400001)(15650500001)(6512007)(26005)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3BpQ0cwWXZhVERDelU3NWljNW5LVFFFME45THRYRjVKSlBqcEY3WU0rK245?=
 =?utf-8?B?ZUxOQVIxTUdYUVF4d3lDVzlGeE1hNVAzOUNaOHU1Q3hTSy9TdFJsOUN0NVNS?=
 =?utf-8?B?UXU4VTJPeHBNbFdidWIzOFk2U2RjMkhIRkM3QU4xU01MTTN6Q3ZIYmovVkdC?=
 =?utf-8?B?WW5OMjFPZGdTcHBwZzhYTC9uWG9vLzZZUWwvRjBwbWRFS09nYUgyUTFLZTBW?=
 =?utf-8?B?cEFQYmQvaUVnQUtsZ2YvL2UzN0QwZnRlcDBzY1V0emNHWGhBUU04TFlCVkx6?=
 =?utf-8?B?T0JFNHZoWWt1UE5YMUYySXdUSW1MQnhTOThhM1AvNVFSTHN4T3V0QWxFL0NY?=
 =?utf-8?B?VnV5TkZpS1BRV3N6bUtLdzFJMDVCa1BVdzNyN2JCUzJxOW8za2tXNHkwU0E1?=
 =?utf-8?B?V0x6KzdOWWQ5WXlybXZhTGgrTkRWYUxDTTN6VjgrTlZHUGRHUXUyUEJMaWhL?=
 =?utf-8?B?bXhrcmZ1UEpMR1FqeHNhV0taQzJQdVVPbStNVVFHNWJaS0o2MjcvbGtBbXp2?=
 =?utf-8?B?dDhCSThQMEFYdmlaVlpNZzZlUTZ0dS90eHVMOWxGTklEeklhSTFNTG9TOWpz?=
 =?utf-8?B?L0wyYmFWaTFXa2dvS1VLdG9QUWZMTUVsSGR2RkFpRnVsaTYzUU1td1JmbWZ1?=
 =?utf-8?B?ZFdaK3V0Q2NOcHhMNTVZZldCQ3IvMzRSYjFsNnlXcmgzekhlNXpzQXpkcU9T?=
 =?utf-8?B?Y1R4eFVwZ0FUNmlxRUNtMzVjbzJzQm1sZklpVVdmYXhzTllnc1BxMW1pN0p3?=
 =?utf-8?B?VUxmVlhIeGtFcU1EdWE3blRlanRLNjM0dWxvNzRlL0htdlM4SjNBNFlyZ3JW?=
 =?utf-8?B?c2o2Qy9jUDJXZGlnNjNZTGhSK1FiblJRRXBWWHFkTENkVTlGTVVXUXJvdXVv?=
 =?utf-8?B?bHF3b2JGb2hpV0IwVDdGM1FSQTRKUzZKRWNwQmx6NlZ5RHRvNHNNaytqS1k1?=
 =?utf-8?B?T2dneGxGTUlUMWJoLyt6c0ZpUjFZc0xybE9xMU8zT202aUxwTDIySXJ5V2I4?=
 =?utf-8?B?UTk3L3RkK014UlRtVEFyYUtGc2laVTdNYm9JV203NGJJNkNNbVZkTXRkY2xQ?=
 =?utf-8?B?aFFobWJhWG1yZ25BZzdUTWFaUGdkdFBMU0I0ZVBaV1c4ODlvSjF5QU9JTURi?=
 =?utf-8?B?S295M3pZZldwZDlsK3hsOXhIRnpERWFlS0tKRHgybGU1NUZIR2k5cS9GWCsx?=
 =?utf-8?B?QXZaVGNLanUvZ1A2TWNJZ3QxeWp3ZnBDaUZ2elMyY3BFc1ppVzh0TjNXdEd4?=
 =?utf-8?B?VS9zUUhIZm9PTnlRd2E3K2xhckQ4WXNTOHoyWDdQUlFEQ20zNjhaaGNpb2Y4?=
 =?utf-8?B?RDQ1TzViOUlRbUlGakhIYTA4cnZxVXVydGFvSktuYTV0dFM5aW1CR0hUbHRs?=
 =?utf-8?B?ZzdkN1lXeVk3d2I1RGNJZzE5YlRMNFgveGVQOEVRYldQSU9YN01WSThPRHI1?=
 =?utf-8?B?WFhSeEdpeXo0WmdwQkZrMjZLY056eFFsYmt0MzJzVEJCd2lWUGV6enMwTll1?=
 =?utf-8?B?elRwTitUNHV6Wis2dHU0TDRRRElkclBiblBWNXc5VUNnU3BjVEV3djZaTWRE?=
 =?utf-8?B?a3RPb29wZk1uNmZDL2RIRXNPa0dRYXR5aGtQM2VFRmdxaFVvczUwRkowUEpo?=
 =?utf-8?B?ekxaaHNzYzVIclcrWGZkVFNwWmVuWnB2eEcrbkpZdkp3SENXcWJ1RHRTaFVO?=
 =?utf-8?B?RnAycjBxR3RjK2ZqYzVGWUZOWTBMZDF3RWQxVUNEbEhQMWhaSlhmYktrWVNh?=
 =?utf-8?B?OUtOYXN1dGhWczcrTFZRNFBNUEpNUG5UVUs3RitjMUpONzU1NXY5U2s1TzJK?=
 =?utf-8?B?L3VRRUlQVlVZUWJPM2tsWlRtQlZ4c3lqcm13VnlZSGhYTnFQTmdwSmhxTldU?=
 =?utf-8?B?NmJYTmlwUnNoN1lWcEtVV290anBwTm1VbzlGaGRxY3J1MGwvYUQ5TlJXZ3A2?=
 =?utf-8?B?V1MzbjRFTVg0bHZBSjZDbks3eVNob01vS3U0VDZsd3dTZWtoM1hiazJBK3l6?=
 =?utf-8?B?YVV1alNMTTFYY2NydDQ1Y3luWEQ4UHp1MElxS1RhREo0d0tYN2VtUUlsdkxr?=
 =?utf-8?B?ZTcyc0ZsVWxYMFVlVDMvckVtbGZhV3B5SUh1ZXpmOW1nZWZEN0dCTEFOaHVN?=
 =?utf-8?B?VEV0ZVh3UGtoYi9pNkNLQmZtYXFRZitPRy9hL1REcmlMR25hTElCUmg1Zjhx?=
 =?utf-8?B?eDNDVDRVS3cwTXVjdTVNM2l2RXdhUlJUV2tPczBQTjVwVEQ5RXp6TmpOMWl3?=
 =?utf-8?B?cXVUaFFPcDIzQ0pwSm1kbXNGdzdmbnlpK0lhOHFMMW9CdU4xcXpiUEQ4ZFJ3?=
 =?utf-8?B?V29aU2RXU2FmMHZQdGd2YitlaVp1WDlycDdDYUFoam5VUW5KVHNBOG5aZkpF?=
 =?utf-8?Q?+DafL2jZx5o1HbQ8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1cd52a-6462-444d-9e77-08da4b074cb0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2022 17:33:15.2031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdKtBh2pS13NtzcEzshyrf+mkd0z8QpRqi3Lq/pDVGz5mgAs+QQ7ani54ErcWPpWK8RvlURU8Cg41a7/B6Tc+y/VbxvjlkPUw13ZeB/LWj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6047
X-OriginatorOrg: intel.com
Cc: pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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

On 2022-06-10 2:36 PM, Cezary Rojewski wrote:
> A number of patches improving overall quality and readability of
> haswell.c and broadwell.c source files found in sound/soc/intel/boards.
> Both files are first renamed and only then actual changes are being
> incrementally added. The respective names are: hsw_rt5640 and bdw_rt286
> to match the pattern found in more recent boards.
> 
> Most patches bring no functional change - the more impactful patches at
> are placed the end:
> 
> Refactor of suspend/resume flow for the bdw_rt286 board by dropping
> dev->remove() in favour of card->remove() and adjust jack handling to
> reduce code size slightly by implementing card_set_jack().
> 
> The last patch is removing of FE DAI ops. Given the existence of
> platform FE DAI capabilities (either static declaration or through
> topology file), this code is redundant.


Hello,

While this patchset reorganizes and rewords code of two boards in 
question, module (kernel module) names are unchanged. Currently those 
two are:

- snd_soc_sst_haswell.ko
- snd_soc_sst_broadwell.ko

My question is: Is it viable to reword these two?

Both modules accept no custom parameters, perhaps *dyndbg* is the only 
possibility so the impact is reduced.


Regards,
Czarek
