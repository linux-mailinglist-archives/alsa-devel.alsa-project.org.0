Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D502D56B95D
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 14:14:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 638FB847;
	Fri,  8 Jul 2022 14:13:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 638FB847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657282484;
	bh=uzsuye5WjIF0DXpzMmKCvMOfem0ICzDg0+PJUSI1xuE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gfixstxE7m59i8Z6HF9UsCoIVvOxM+MX8NS08PCNeui8ErJAVcW+311wcR3x2//nE
	 MC/THgfqHHr6B1jMUuuwtZ6fwziMDthAuXxQ3x3vFySyMUg/v0oV65OeerElVY2i3F
	 pc2eM7jE9vAlY4bT62GGRFrt0o1wUe58AVzckRXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C885DF80084;
	Fri,  8 Jul 2022 14:13:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0969F80167; Fri,  8 Jul 2022 14:13:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B591F800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 14:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B591F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WUPMha6L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657282416; x=1688818416;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uzsuye5WjIF0DXpzMmKCvMOfem0ICzDg0+PJUSI1xuE=;
 b=WUPMha6L96Fcl4T/whLrVCMTB4RgIH9MPR471FPsmL8dLFwiosRpjXY2
 299GSfDtusfUWhc9XweidhYrCt35dm22RsB7OVrUMAk4dJvzTTvcv30Ri
 5u349Zrp40TRhzZwY7YlryDrBN7ySoGx9JJOTKi4jvzg3Q0YAcpw5uOeK
 uV3kmqnnyDZk5QgTCCJotLVdE1Vy7bE8t8J5PV9whl6D9WxAV02LCQ+7d
 YpLjaOxjqjnu+yXFDfek5ItcbdbVJRLSOHYlpAmoWy/nPeqF2Eb8OWI6x
 nC/E/r40auQLAikyiDuvoPdydyLw1wwPEDK3vykB7gh99p6SynE+DVPLz w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="345955644"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="345955644"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 05:13:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="920976907"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga005.fm.intel.com with ESMTP; 08 Jul 2022 05:13:30 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 05:13:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Jul 2022 05:13:29 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Jul 2022 05:13:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwpV5OmdVYoLyBDVBC35gyMDXxGJkx+t2GCHXGX3CZBF8QYDq42LuGpjAwmbs08tT4A6e5c/fsTfI6+nKNg3hqqHEtlgLdo2J1VMcx7APkQNgghJ1qTNw8iIZ08KHnwxxMItZoQtuTNNzeTuAFMH15h+sqoaMwIuCPXtdj2vpAANXDSl687Hicgznxg3CaLeD4q4R8+92iYCzg0OzGgdh4m1wxvfnOBB8wqzbnm6YurNH5LOo8QbkF0C01nJIIurE2Itg3qh2MmS8e9KM+7ObtFv+8kckqe/uggM/awadF9f2lHwPSuEuwStMmj2ADzhS2zxE9kwAmvMo3GnFMasWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYr0xJKbmDRi4cBhkKdqko7HVAS5KXABIW5CjYh7H3k=;
 b=jTRQWNRSgxnpFebmidVWqBSTFxiH0/R52u3ikIaiqfQoxCFis/tIiPq3YIABsUb3JUedDMPiVYYX4FSl8iowPsKuAbfstNUy1+qL80Q3atVP4wXNABS+ZyfioQaIWXp7ehbwBrnknHIY0E+xtVIf6oYaXeZm9/EuIbRi8fKSKG9gIJPMddY7qKnXrs0e8EkJMQx4mkGXnxVahTf2kS5GFsKyxBAh6IDnF2UayQddYBlcjSOcC+Y7bq/wg2vlFzlqa4hn7VsIKmjT59zNnY5rc7ov4CpGhrmE9bPSHiZPhUJu80kD0zASwkKkPL/lEc9Vl7gWeMmmRAAiCXZfOyIm3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM6PR11MB2539.namprd11.prod.outlook.com (2603:10b6:5:bf::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.20; Fri, 8 Jul 2022 12:13:22 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b%7]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 12:13:22 +0000
Message-ID: <6c8e4104-2239-a188-649d-585f059cabdd@intel.com>
Date: Fri, 8 Jul 2022 14:13:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] lib/string_helpers: Introduce strsplit_u32()
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220707091301.1282291-1-cezary.rojewski@intel.com>
 <CAHp75VceKBoxXVPP4dRYb8LQqHMMDHFp6-E2iuZ-h2RTK8PWQQ@mail.gmail.com>
 <e0c7d254-ace3-625c-cc83-52ca0b45e9fc@intel.com>
 <CAHp75VckU2ZraLJ-frjWXjUu9pFW+-XmWgTbYqUXOUNAD-1HGA@mail.gmail.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <CAHp75VckU2ZraLJ-frjWXjUu9pFW+-XmWgTbYqUXOUNAD-1HGA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::9) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd1c0666-e3a9-4ea8-174c-08da60db40cd
X-MS-TrafficTypeDiagnostic: DM6PR11MB2539:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7gJTPv+VvWovWbnoaab2tWmZuknlsWxkJ/Q8mg0pop+aKUqFCSiApoKQGkUQll5WGaz+0IXG3xQd4wXgY1KLkPCglCe0GNMawjnbkBfdjuSuDEyBD1BmbbTCtlnHe4FJ5Ob07Yxz7O3icXvycr2Yi8oaCvWK+32tiRX2rWYiczH2TrS9siI45cC8bEZuIiIrknbfN3upMgctPDaKcroZ3wtGIwTeUo0I7BM8OUmB1sMj1f1GVfObc0K53s6S6pS47INUPwe42MoQd11VaiQ56GZqxV4uXC2RIK8tfXI8obN6wY6gG5OA4mm3c3QsQQjeZEP5PWwWP7Kt90IaQq/kdK7Uk2SoY2JbpR9yboZcJIrhmmT3SBPoiSFKp2KjKFVJ9J2TWyrBOfpZJsFmZ1cyB+YnIcqw2tEXSxYqP5BVI7SJmJ+dQx7jUgg/mfr0XQafVKCNDQU/aAHMTT6+mECdc7dL/HLlEUTfbvU30vQQaknRX7p7FFr1yRtZgFk+igNViqvc8+GSIbrOADO+BZoLYVP5PHNlAiKhX3w3t9V9EKUy/aFdPz2fnC0Y2EDzGfckLnUso58KjQyWUXKrtVNEyfzFsZWTjMa3mTKqjBrLMy3VKa0sCyMeC2pbCAYHqnfgTs77ZAJ5Ui8BM6EFlz3hEG6Jh/7wRjoYQW/RQnu++datg/PJpbht11WXydaKGtd+5Xx1mIP8AV+XMJWrIYpQcQzcpxQLUVhA/R8m96z+qrLC6+GvA2586RhwchJdzZDGBLDJAMzLrSAwST5x2s1kEXgyrgGiJ//XFtKvpak4DfVFxHnVl3XMUCfL+G1qIxMswMD+AglGxdPJelBh6Ux5fywBFpIx3+FKV5B5JvKGKY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(346002)(136003)(39860400002)(376002)(366004)(4326008)(2616005)(6506007)(86362001)(53546011)(41300700001)(6666004)(31696002)(44832011)(82960400001)(2906002)(186003)(38100700002)(316002)(66476007)(66556008)(66946007)(83380400001)(6512007)(478600001)(31686004)(26005)(6486002)(8936002)(36756003)(8676002)(5660300002)(6916009)(7416002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXp1RHdmRndkVW5LSnFlTWVsUDdtNksyclBJK05lLzNhMGlCa3ZJZTRwRUc2?=
 =?utf-8?B?SDU2bXZjdVhhbGpiY1pDYWpMQlk2bFdBcGZvdmd5NkQ2cTVnTXdReWlXWVYw?=
 =?utf-8?B?SHA5WHVuR1hjMkd6MTdQdTVBdHRMWjFQby9BVU1BUG05MitwRjM0Y1BsUmJj?=
 =?utf-8?B?TXlDQzV3dmRUeTNkVDRsd0Z5TDl1SGlVT3pEbFloNi9DNVMxN1ExQnRJSVhT?=
 =?utf-8?B?Z3I1Z0VpY2RsRWRQSUk0cXAvU3k5Z0ZjcDhUQmVqQzZjbmNRVUtnZVA2MlB3?=
 =?utf-8?B?MXJPdmdQRVMzb3FXMnVXdVpJTGFIcVZWM09McTlCVVk4VU41aUcyQjVSZSth?=
 =?utf-8?B?L25RN3h3UHpTMjFBNmY3TkJwSEZFd3hSWExoREJiRUt3L2t3NWZEUXNrQWEy?=
 =?utf-8?B?enVEcHc3WUJ3T2ZWb090cVI0cmFhT3dpdWV1SSt6a3pCaDdXQ1ZiVmZSSkVY?=
 =?utf-8?B?L1FheWhaSXBaVEJuT3FYdk1OL2pNUVAwU2hCVm1HbHRMYU5SZ2pJTDBWNnJW?=
 =?utf-8?B?YVI0cStzaTZvSUIvUEZwdk9ZTUIzTHYvNUhSY0NYQ0RXME8vbXJFcURXUERx?=
 =?utf-8?B?b1ZsK3ZTWmNNSEhoODloR1c3c0lUYUtKL3RtbXkxcUhRcVNtMHBsMFc3NnN2?=
 =?utf-8?B?S09WeTZNak5nZk1vc0FYWW94ajh4cElRQlA5amhvL05NL084cTRvQk5jMFM5?=
 =?utf-8?B?a2NHVGxnS2plWWZEMnd4RVNWbFRTZHpQdDV2WEM5SXk0aVA0eE5zSzg1Vy9a?=
 =?utf-8?B?WGdYbFFUaGZ2MCtDaWc2bnIyOXliYWlvSTRndVR5SE5pcDd4UzNFV01MYU8w?=
 =?utf-8?B?bElyMGh5WjR2by92Mm1uZ0pBeVpwV3ptT1JEVkgzTWFHRzVTWXRRNzVHcUJy?=
 =?utf-8?B?UFdTSCt0WW4za25zWGlzKzkwc0VWOFozVnIxZlJpTDJtdFcwNzAxdWtnRnVw?=
 =?utf-8?B?SXVqaE5yYTVLT3ZwK3B2M2tWeUFvM0Q5ckVqeG5xZGZhRHdyT3hKS1E0WU1G?=
 =?utf-8?B?UURzMERMOHZGMGZOZlJCMktxN3hyUjFnNEwzT3NPYy9KRjl1aWhZK2RDYkt6?=
 =?utf-8?B?dFh3bFIvZEZwbzBwbHlOZUZCQkhVQjVrZHpQQzMzQVBKQXdFYTg4YzRPQ2p3?=
 =?utf-8?B?MVlGbURyZFFFdlZJZWFwLzNPSklRYXJWb3R1TTFLRXV5eGNBMU1BTXFmMDQz?=
 =?utf-8?B?dnRaZE5aUXBPZllFUHlmTXVZdHlZMk9kcnJ1MmRBWDVNMkI4d1ZEQU5NT2sw?=
 =?utf-8?B?UEtIbTRFU3VkaDAxdllydVFKTmE5dzVVTTI3K254d25hT1R5aXVXWnVVVWth?=
 =?utf-8?B?VFpGdHRjTHFCMVFBZ1Fpa09jQnBPZEdZVVhPdjdyaldVNzdlaEFQSFdDKzkx?=
 =?utf-8?B?bWZPSjh1VHVLY3FqeGZoc3BtK1VobUZZQ2ZGQmxCR2VmdFFOQUJaUEt0MDAy?=
 =?utf-8?B?a3lDbEsrMFY1YkVCU1g3ZEZWME1UeHhHNHNFY0VGNnhIVzFwaGJPRWtYclZa?=
 =?utf-8?B?VkxpU2FUZFlHQ1U1cTBZY1AyUDNqQ3d1cXVZMjZYVk1XazMzYzdRRXFCTURp?=
 =?utf-8?B?SkdlMWJWZjVKWlRqc3grMG5RbjBkaDU2QzVWWmU4dDUxTFpwYUhIQ2MwOEx4?=
 =?utf-8?B?aHBJR0drZnBzL0loSmNFVEo5QjNZR1ZMM2FwNG9RQ1VDMGR4eUVLMUJaS1B0?=
 =?utf-8?B?T0lxRStLOCswR1VUa0k5dkJRUCtHa0VzL203ZzZ2NEt1N0tncExtQS96MW9l?=
 =?utf-8?B?OVRvTU1BOTRBa3dTanlKZ1ArU1RtV0dCQUJxajBzTmZSSi9tNVJsOXFvNHBE?=
 =?utf-8?B?ZGhReGhMeXhNS1ZzYUdBaUNkQUQyNU4rb1kzeFo2bkJZTG82RVV0VElwekd3?=
 =?utf-8?B?SjByWFBwUGI2UzVHOUZrUHRNK3JKS2svVnNCSGducFZGaEJ1WmgwNWNTUnRD?=
 =?utf-8?B?allDVkhXRHZ5S3F0bWFzeTIwN21mUlZQb2tEZTJETHhkTjZlTXlpWDAzMkVy?=
 =?utf-8?B?Ulpzai83N2pZTk9xMjJDRU96NW5PMlUyMFk1NU9GYnhkMU1xblJFOHNEbVU5?=
 =?utf-8?B?WjZGRk1hL1RtL1RDRmdreGZJUnM4d0RPNzRtTk9ocEhTWG5XL2xVVlFkejdw?=
 =?utf-8?B?R2xoK0tOSDFPdmFxaFZkNW1HTUE3SWk1UUxRTU4vLzBzK21qQ0VSVmcydW1G?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1c0666-e3a9-4ea8-174c-08da60db40cd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 12:13:22.8883 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mK3vg4NmWDQeZ96eWQcsqMCuOmGkb94S62u5DPt9M6Pd98SVw0duN4+pqUhqG1fOofH+aPY+USm4IQTjdr68IV2hixrtF3sEhs5ndWG0j8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2539
X-OriginatorOrg: intel.com
Cc: Andy Shevchenko <andy@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, ALSA
 Development Mailing List <alsa-devel@alsa-project.org>, Kai
 Vehmanen <kai.vehmanen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 amadeuszx.slawinski@linux.intel.com,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

On 2022-07-08 1:46 PM, Andy Shevchenko wrote:
> On Fri, Jul 8, 2022 at 1:33 PM Cezary Rojewski
> <cezary.rojewski@intel.com> wrote:

...

>> When I'd written the very first version of this function many months
>> ago, get_options() looked as it does not fulfill our needs. It seems to
>> be true even today: caller needs to know the number of elements in an
>> array upfront.
> 
> Have you read a kernel doc for it? It does return the number of
> elements at the first pass.

Yes, I've checked several parts of it. Perhaps I did miss something but 
simple_strtoull() doc reads: use kstrtox() instead. Thus the 
strsplit_u32() makes use of kstrtox().

>> Also, kstrtox() takes into account '0x' and modifies the
>> base accordingly if that's the case. simple_strtoull() looks as not
>> capable of doing the same thing.
> 
> How come?! It does parse all known prefixes: 0x, 0, +, -.

Hmm.. doc says that it stops at the first non-digit character. Will 
re-check.

>> The goal is to be able to parse input such as:
>>
>> 0x1000003,0,0,0x1000004,0,0
>>
>> into a sequence of 6 uints, filling the *tkns and *num_tkns for the caller.
> 
> Yes. Have you checked the test cases for get_options()?
> 

...

>> avs-driver, which is also part of the ASoC framework has very similar
>> debug-interface. I believe there's no need to duplicate the functions -
>> move them to common code instead.
> 
> Taking the above into account, please try to use get_options() and
> then tell me what's not working with it. If so, we will add test cases
> to get_options() and fix it.

There is a difference:

	// get_options
	int ints[5];

	s = get_options(str, ARRAY_SIZE(ints), ints);

	// strsplit_u32()
	u32 *tkns, num_tkns;

	ret = strsplit_u32(str, delim, &tkns, &num_tkns);

Nothing has been told upfront for in the second case.
