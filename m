Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 565F94CDCE2
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 19:46:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF2811F64;
	Fri,  4 Mar 2022 19:45:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF2811F64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646419562;
	bh=NFz4g5GsigDrOr+qDd/wQ8UuheEegL9GrDrcKkzuP/0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GRkvJYVwSNxQOB1NPRcn6fLE6/mDTobZSTuR6c6ax9DqQ4i/UXXnBf8V7unOPjXeB
	 GpsP57hcN4AuqlirtCnEKFDHN1v0BU6WUHdd8f1+unVowfzbSvFcx4+DeYheLMkHoY
	 EQ0a4Ho7/OfSJEAIJoZdntb8hcE4y+F/AvH8h1hc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4505EF801F5;
	Fri,  4 Mar 2022 19:44:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3983F801EC; Fri,  4 Mar 2022 19:44:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62936F800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 19:44:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62936F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Wj5bQg7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646419489; x=1677955489;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NFz4g5GsigDrOr+qDd/wQ8UuheEegL9GrDrcKkzuP/0=;
 b=Wj5bQg7NRvYAgvo+c13QgXYp08dk0zPLvLQekWuA1KEcaTb1x4w+LYZ5
 YBq9K+FK+emUa5qnNKAx0EGlwV1nphcxiQZYB129zCVFJ+oG/9Fha3aBi
 lD8/vN03wh20xY0vyuM6VfLwe1Qf2fRd4NdSemxLWXgpBKK+yHm5/TwKs
 uAr2a6HmL3LwMazWj/a1MkI73wickddEvGsPzjccemaaAD8/1sIhURMC6
 /IOIUUikqJ5HcmqGhBH8V11rLzBRfA9Ka21+cy3FMayLykEj0gnCzK8SN
 Q4A/YHG2an3K34m7V/6RcOzdcXFWs9jU6eA94mWYkKDe3Zhp57yIBmcrO w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="251613860"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="251613860"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 10:44:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="509064154"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 04 Mar 2022 10:44:39 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 10:44:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 4 Mar 2022 10:44:39 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 4 Mar 2022 10:44:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGbtkM9k9OJZ7t5+jEjl3m0LISmDR5KjBqdpol8P78hw6hUY7XkvZkoUXfAtBfvKGd9d3v2TsDz+/TVOxBaFEYUUs1M0e9X884FNr4/gXYZxw9cmwW7of2jAe7oUC0Zm6DlxN7x0qcJw4ZCdBeM0BkOoinsWy73m4bFdjYYJmWLeBVRYBg5PmBHe0UUrB/SwfcJv6AFZC5DKKNuyjji+jfdz3MEx8VTSJrU51KSR9/PAgUAkpSCR+8EFsP3QtV8cRbw/F0Ote1/Ew/5/VCRwx8vbcS00VG67cIWwv4FbyUo6gcCuHJoC3T3NFC3BGmnrcEktSjsSa+r4XTbz0vGdHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtJYWIBf2PgKe+3UhtNMpRaxJdrU9BnR/LYMEU+uzzg=;
 b=JwAy6dYklAKnpW6Hv5Vvhr/jgoQRhglvLTxmKqzp/3PWZidevApUgAy/+K+5B+vquW5Fa4dmjwBI7Mf5JIU2u+6BO8Z1bCzfqqoJ5yRv4n1c/fu8pj7myRZ6pboserEyTZ9jzKmpovWBenjoJ+lZQ97l7OaSFTGg1+ikcrhF1hN98yyyoI4VtJxqe0/uydmZ5Kr5/IhtOhZPLKJPNu3Zu4LAyvt2WiwfXzSDtebqh+624DyDukSiaDmx0VrF63grt5JA5NgCButlL1Z6hcZfGWDseg99ZhksEK4xcUPSHseNpr0fQoFu4d+Ng7Ap3fATxlKKQ6KnF806fcUxptikWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM5PR11MB1929.namprd11.prod.outlook.com
 (2603:10b6:3:10a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 18:44:37 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.028; Fri, 4 Mar 2022
 18:44:37 +0000
Message-ID: <9d8381af-aa03-743f-7ed6-93dfc18e5a54@intel.com>
Date: Fri, 4 Mar 2022 19:44:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH v3 17/17] ASoC: Intel: avs: Code loading over HDA
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-18-cezary.rojewski@intel.com>
 <2b75e00683d7f7c33ecdf78a9889748aeb50555a.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <2b75e00683d7f7c33ecdf78a9889748aeb50555a.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR02CA0028.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::41) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84ae71f2-95a3-432d-6f4f-08d9fe0f08a3
X-MS-TrafficTypeDiagnostic: DM5PR11MB1929:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB19293809F947ADE00AEA80CAE3059@DM5PR11MB1929.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GxvmPTk9FcVuQrAGjidmdQa5aBZCKo3U21lq3gEVKMPI7UmZOvwMTjLXoWttYge1hy0arjdewR+3dJ63c9Vd7jCX5xRNS2ycL5RlmisLSqVufgyIe4zNdY8wkF20yOcY9wJY5+/Ge3/gZxvIk5dNG/jGaUyRu+pzEe+GgOUM1ipsa8LJhZt6Wgb9pLkLqC/lZ0RgMnQPZLkVXKjvTBCDV1wOTvkJEhttpTWZl9Xn6I6tDUThZ3Q6Ct/Jyg/aKP62GO2Iuv8yDvxbLr6Wjp5FhsDLimW8cYypcE5uciU6xLeoLp8kAOE4UTQlceVDVGw1uVgYmSd7jVao/+0olUqfTjQnRA4N4tWE/NLsRaagV2c5KH4yHuf7fSQIxIqoR0RiKQNPcjf++o1aOsQPpdti2xtpL4Tyimfplalkm+lneJqvElDKvwCvRZUSoaGoMOhMAOHf0eBzfV6ksxIzwU9ti41uAA/4IVnXzAsLABXzj1Q1iju6KNZTtho/mUw00CKPS1Wd6kg81UF8u5afsRli6Gic/1SZNPMBoSnWHDOUZGuvsGb6ixYWRO/xQ7LeSSyhTZEqKX/yKf5rjYZBTyLRtqW5Y5kPAu3iajDqtjZRMCyrVsRvinhpt/02PLHYk4Tmw0blHH/fRjNeXBrCkSJebzD4CtiNNnCY6BL8kSi/h5EF1zos+YspP49o04u050dNEzW9qiGZmWAFml2qnFfogBuj0zWGl2PS5HKYBe+hbRUsVIQWj8Dr6NublMVVRY1S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2616005)(8676002)(186003)(26005)(508600001)(316002)(36756003)(4326008)(2906002)(44832011)(5660300002)(31696002)(8936002)(7416002)(38100700002)(6506007)(66476007)(66946007)(53546011)(66556008)(6666004)(6512007)(86362001)(6486002)(82960400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qnd1eXl0REFUWEJBUDFNaGdFUVluQVJ0VjZKcGQ5TWVubFJrYVFQaWhDMXdu?=
 =?utf-8?B?Z1FkRWFXVGREQkdOLy93UEJzak8wdC93T1dUQmJWaEhRd0taaTBRdVdZSEZu?=
 =?utf-8?B?Y3RzNFg0YlVGVXhzL1ZQd2M5UVBLVVh1WWNXNnFVanJBdlk3TXpnbDZReDdC?=
 =?utf-8?B?MTdjQ3E3RTY0Y2Jueit3VmhUWHZmbjRWMVg4RFNPUmRiNjlFa0Q0dS9KV2pt?=
 =?utf-8?B?UHRDZHA4SGM2S1BSMmgxZHAwdXFtNFpwZm9peHBaWTNaanhqS0JXSm9rcElH?=
 =?utf-8?B?eEYvdGs2bXNSUnlZbkNaVTZOSnAzR3hoQnczMmpxMlB3S1BKUHBlZnJpYnVC?=
 =?utf-8?B?blhScE1hcU0wQ2V0L05EM3lNejg5b0xDZE5nQjJpOEt0OFZpZ2dQU0lIdHY1?=
 =?utf-8?B?UWJieG9rTXpTVk5nRHBZZHV2YVpyUHp0YzNBQitCKzlnM0tqS1I3THlVR0VN?=
 =?utf-8?B?U0FRR1R3TzZOMUxDNko3UElJMjljdWhZUHhnazg3MkljZC90VExLT05WZExq?=
 =?utf-8?B?QUlWbCtQTldtTWJHU3JnNWhJK1ZlNC9PYVZFZ2swYmg1VDVDWS8rZk5zTldy?=
 =?utf-8?B?N0grVFpRaDVCOFBWSEpYZHZZRW5USmQwbXRKUEJDRnNram1aK21KZ0hFUCs4?=
 =?utf-8?B?UHZFU3VkTmZPc2tUV1JEOUtMQXgrRzV1dVg1YW4rMm9uL3FWd3h3ckt4cGVw?=
 =?utf-8?B?STY5M2xFeHZWM3htZk5hbXR0aVExdlUycVlFSGwrTmVhV1BOWWRDc3BTSkVU?=
 =?utf-8?B?ZzdOdEVYMlZIbHJadndNdFJYeVRKYXE3dnExT09ldkE4V21WRDR0Zk10eG5s?=
 =?utf-8?B?c1EvMmlMYVZLZ29NNTdBcndidGFkQ09LK3hMSjlGUnNGZ1lBUlVpYnNsb3ov?=
 =?utf-8?B?d3hLRmV5Q0ZwTllOZUFzOENiall4cEJGczN2LzcxejdRNk4zNFNvOWk2a2Vq?=
 =?utf-8?B?UUR3SytQVTdaRzQxQlNiVEwwenZvb0ZVKzBadU45cWl3U1dnb2cvNTl5WnFs?=
 =?utf-8?B?N0JvdndUMkMxalVKV1kyYWtwM0hIbkdad3BUVlowaHIyc1hFdzI5UlBUcjgr?=
 =?utf-8?B?UkdyQkYrV2Z4NVZnRWt5NHZaSUZ2ZVAyR0ZoTlRwa0NvZEdYMGEwbmo2VUV2?=
 =?utf-8?B?VjhrYWQrQ0k4WXMwT1grRTFMYWZmNmtlWWJJejVBYkR5U3YyR01vSHFrVmVu?=
 =?utf-8?B?bjBOMWdGczdwNkRqa3lhakkxMTByUTY4VVB4OVJ2cktBVytUS2NrdXBZVTk2?=
 =?utf-8?B?cm1EZ0JzNEdRNTVoNXVGbVppSHpWMzJpUmRBc1dCK3hOcEJDV0ZEM0xIMkxq?=
 =?utf-8?B?Q3ladHlZeDhiLzBabGFqWDlLZjRWeGFuZzlVYzRCcjRpT0VDU1lkaE53NG1z?=
 =?utf-8?B?MG1BSTVxSVJNOEdoNDcwYk9kVUVnSDJYSkZNS1FXSGNVVWk0Nk42ekpDc1Ir?=
 =?utf-8?B?b0Q1MkFDUE4xMG12M3g5SlRpbStueTByUll3Z3lCOG1kLzdHMFRMSXg3OWFv?=
 =?utf-8?B?aVNhYzQ1SWlRSDY5WS90a0UwMEVOZFZENmdzM3BGQ1hxVDRjdGxNQW1LVDA0?=
 =?utf-8?B?VU5rWDhTV2tmZ1FXblJpSXc3MTB5U011VHVHUUV3RmNjMXA0ZkJqWG1HbWlV?=
 =?utf-8?B?WUZjUVp0eEhqYW5Wbk5uY0R5TEMrQlR6aHk4OERtS3lCSDgvV3hRQUpHU1lD?=
 =?utf-8?B?Mmw0WjFLbkJIblpzaHRNRjFyWDhzaThXb25jWlNwMDAwNnhKQ1YrWEVscUpo?=
 =?utf-8?B?RUI5ZG1OdFU4d2FwcDdLOEVHOVVRYWtzRTN1L0ZDcnA1ZS9pVTdFWTR6Vyt1?=
 =?utf-8?B?OFZaMFJTeVVSM2YyRzIxY3hrdkZJYllucFNXWE9mTHl5L2grYXM3cFk0WGli?=
 =?utf-8?B?cU9Rdk1jTGswWkg5SnVZbHlTQStRYkpmb25qY0hSdlpZdm1iZFFidmtURVdw?=
 =?utf-8?B?ZnRtTjNPZmhsWUZzOUs5Vy8vUTBKQnVJaitwUFdHVE41UlhvTlBGOFlBVERQ?=
 =?utf-8?B?bDI1eUtRYVZjT1FHRkVVK2M3eEhLdmhhR3N0b2VLbTdTRFAzZTF6c2dUY1Zo?=
 =?utf-8?B?RTRENUh1eWpNTXRoTEhhamJzVHZhTkNjMUZBRENaYXEvb24zWU9aMGdqZmlo?=
 =?utf-8?B?cXI2OE1hNmxaK0NOeDFUc3JldUU1U0h6WFFMcmpjaW13cHZTTnc5ekJjV3Jl?=
 =?utf-8?B?aHhONnRIK0llai9NMzhZRWdiYVlxZHlsRFV1WkZXTUNoR1VHMURKMmsrbS9K?=
 =?utf-8?Q?1Y2tw8L2hd2L2/6Pa8IK8Ied1Jh56IJcVz8utNww/4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ae71f2-95a3-432d-6f4f-08d9fe0f08a3
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 18:44:37.5341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chMXU9ygSUdSIhIgoHSVbEiEp8+VkaeVtbKoCzqMggnwQNOTm7NbGEDwaB9HSdY680jOMeEbIkYnpgLxbkWGJ7GMZmp8NMNVxATfInuUv34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1929
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

On 2022-03-04 5:59 PM, Ranjani Sridharan wrote:
> On Fri, 2022-03-04 at 15:57 +0100, Cezary Rojewski wrote:
>> Compared to SKL and KBL, younger cAVS platforms are meant to re-use
>> one
> Younger? you mean newer?


Isn't the meaning of the two quite similar in this context?

>> of HDAudio streams during boot procedure causing CLDMA to become
>> obsolete. Once transferred, given stream is returned to pool
>> available
>> for audio streaming.
>>
>> Module loading handler is dummy as library and module code became
>> inseparable in later firmware generations.
> replace dummy with "stub" maybe? lets use inclusive terms


Is 'dummy' categorized as non-inclusive? We have several usages of 
'dummy' even within /sound (e.g. soc-utils.c).

>> +static int
>> +avs_hda_init_rom(struct avs_dev *adev, unsigned int dma_id, bool
>> purge)
>> +{
>> +	const struct avs_spec *const spec = adev->spec;
>> +	unsigned int corex_mask, reg;
>> +	int ret;
>> +
>> +	corex_mask = spec->core_init_mask & ~AVS_MAIN_CORE_MASK;
>> +
>> +	ret = avs_dsp_op(adev, power, spec->core_init_mask, true);
>> +	if (ret < 0)
>> +		goto err;
>> +
>> +	ret = avs_dsp_op(adev, reset, AVS_MAIN_CORE_MASK, false);
>> +	if (ret < 0)
>> +		goto err;
>> +
>> +	reinit_completion(&adev->fw_ready);
>> +	avs_dsp_op(adev, int_control, true);
>> +
>> +	/* set boot config */
>> +	ret = avs_ipc_set_boot_config(adev, dma_id, purge);
>> +	if (ret) {
>> +		ret = AVS_IPC_RET(ret);
>> +		goto err;
>> +	}
>> +
>> +	/* await ROM init */
>> +	ret = snd_hdac_adsp_readq_poll(adev, spec->rom_status, reg,
>> +				       (reg & 0xF) == AVS_ROM_INIT_DONE
>> ||
>> +				       (reg & 0xF) ==
>> APL_ROM_FW_ENTERED,
>> +				       AVS_ROM_INIT_POLLING_US,
>> APL_ROM_INIT_TIMEOUT_US);
>> +	if (ret < 0) {
>> +		dev_err(adev->dev, "rom init timeout: %d\n", ret);
>> +		goto err;
>> +	}
>> +
>> +	/* power down non-main cores */
>> +	if (corex_mask)
>> +		avs_dsp_op(adev, power, corex_mask, false);
> What if this fails?


We are still in happy path, worst thing could happen here is increased 
power consumption.

>> +
>> +	return 0;
>> +
>> +err:
>> +	avs_dsp_core_disable(adev, spec->core_init_mask);
>> +	return ret;
>> +}
>> +

...

>> +int avs_hda_load_library(struct avs_dev *adev, struct firmware *lib,
>> u32 id)
>> +{
>> +	struct snd_pcm_substream substream;
>> +	struct snd_dma_buffer dmab;
>> +	struct hdac_ext_stream *estream;
>> +	struct hdac_stream *stream;
>> +	struct hdac_bus *bus = &adev->base.core;
>> +	unsigned int sdfmt;
>> +	int ret;
>> +
>> +	/* configure hda dma */
>> +	memset(&substream, 0, sizeof(substream));
>> +	substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
>> +	estream = snd_hdac_ext_stream_assign(bus, &substream,
>> +					     HDAC_EXT_STREAM_TYPE_HOST)
>> ;
>> +	if (!estream)
>> +		return -ENODEV;
>> +	stream = hdac_stream(estream);
>> +
>> +	/* code loading performed with default format */
>> +	sdfmt = snd_hdac_calc_stream_format(48000, 1,
>> SNDRV_PCM_FORMAT_S32_LE, 32, 0);
>> +	ret = snd_hdac_dsp_prepare(stream, sdfmt, lib->size, &dmab);
>> +	if (ret < 0)
>> +		goto release_stream;
>> +
>> +	/* enable SPIB for hda stream */
>> +	snd_hdac_ext_stream_spbcap_enable(bus, true, stream->index);
>> +	snd_hdac_ext_stream_set_spib(bus, estream, lib->size);
>> +
>> +	memcpy(dmab.area, lib->data, lib->size);
>> +
>> +	/* transfer firmware */
>> +	snd_hdac_dsp_trigger(stream, true);
>> +	ret = avs_ipc_load_library(adev, stream->stream_tag - 1, id);
>> +	snd_hdac_dsp_trigger(stream, false);
>> +	if (ret) {
>> +		dev_err(adev->dev, "transfer lib %d failed: %d\n", id,
>> ret);
>> +		ret = AVS_IPC_RET(ret);
>> +	}
>> +
>> +	/* disable SPIB for hda stream */
>> +	snd_hdac_ext_stream_spbcap_enable(bus, false, stream->index);
>> +	snd_hdac_ext_stream_set_spib(bus, estream, 0);
>> +
>> +	snd_hdac_dsp_cleanup(stream, &dmab);
>> +release_stream:
>> +	snd_hdac_ext_stream_release(estream,
>> HDAC_EXT_STREAM_TYPE_HOST);
>> +
>> +	return ret;
>> +}
>> +
>> +int avs_hda_transfer_modules(struct avs_dev *adev, bool load,
>> +			     struct avs_module_entry *mods, u32
>> num_mods)
> What is the difference between transfer_modules and load_library?


Libraries targeting SKL/KBL/AML platforms *are just manifests* - the 
actual module code is found in the separate file(s) and thus the need 
for separate handlers. The driver has to load both the manifest and the 
module code to have a working streaming scenario requiring module type 
exposed by said library.


Regards,
Czarek
