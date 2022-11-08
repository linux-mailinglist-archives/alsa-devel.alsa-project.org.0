Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2FB621CF8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 20:24:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 448BB41;
	Tue,  8 Nov 2022 20:23:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 448BB41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667935454;
	bh=kYX7W+kW6I2J+GUTUT6Kbdusu7l8PSEI7kEhUEmLonE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J8GJ79i08tpeESKGNiXdJ9RhB4P7075T51BCHEsZbuh6flGZ7sxxbg233ZY3C7Efj
	 pD09uZpZoSXzTC8cC5FTuKXpP9EhbwJSpdjBycSd+9AQm+FHOv9wdccKGRUYhr/ff2
	 qL/HhDOjlLm/mT7Lf7NVeg89Kl16eq+F81jCGD8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9428F800F4;
	Tue,  8 Nov 2022 20:23:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B28F6F801D8; Tue,  8 Nov 2022 20:23:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2B67F800F4
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 20:23:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2B67F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SzEfEfTx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667935394; x=1699471394;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kYX7W+kW6I2J+GUTUT6Kbdusu7l8PSEI7kEhUEmLonE=;
 b=SzEfEfTxiRUrDtxe+CMZSo0Q+Eptmka4a6eMjLW8XjO7sRrjHpHoqyHr
 Sy5YTj+yi5A2jkG1ZXV27sb/J/VllpGSZyqEFn0SzPk0EdjC56ptmnqGf
 wwflhtMhy4cZWRvBWIZS5QOnOB8dCGloF1l7oBafZSo1CEFfdRjojO09x
 WvVGyii3cH8mRajxBvIgdHWw4tuxSrV5Acf3UB/mHX+y0tSR3ZQZHFvGn
 110xgb5kUOqbMbRV4TYSiPG0qwUQV7ijzttV6T09epuxCrOpcqHWwj7ta
 bKGVA00IfqdY0byN7p+oxmcHjfTfO+hT4kXUjNmXhip2HDjYcCMzxqNrb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="397080828"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; d="scan'208";a="397080828"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2022 11:23:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10525"; a="636452668"
X-IronPort-AV: E=Sophos;i="5.96,148,1665471600"; d="scan'208";a="636452668"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 08 Nov 2022 11:23:09 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 11:23:08 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 11:23:08 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 8 Nov 2022 11:23:08 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 8 Nov 2022 11:23:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+OVUzEi5TQNKwXQf+aRbjA9WVa4G8s115IeMQq/ljYhdtmdYM9dgqDUeOvi/wupkZPgpG3UX5/TRIrWnCsYkJMaHgat7PC3mmV5WOOD3hlRHktLMKIASPwgkr5caJa9xGyHROlS4rKuLFSpulEEuuq4RhtySsT2iy6z34tG/apwsEaQSqSznucbhy4sJdzG3SjKzoSjkd0TzbTQobnx8xAUdFGzs+Uo+4zQZW7QD77HGbwcfCp/JrwhkbPnQiJkkxLksghQIPc2f3Jr5CTdU+fL2nlNN2eLj/CZSQVnovawfCBF+CiF1WXdDpCwsGlrGEIrb+v0zje8tqOikZAfiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuKoTq4DuVAurZgLqSwqRnXFU5kJ2GuvG1enfhQNnyU=;
 b=JBwEh3U8aUctbu5i1dKqWd4XgJqB3LrUhPdUoZZGUTufhEV45Qy604d1hgcEXlWgaYdbrB+xZi/c5oMenfn+Lgss7CRy++7JPIu3vc3q6vaOQRn8sA/l8ZdlYF07Uv68szSILw7BczQBJrPvT9Wk/1kuiFUDTRZao0MnEJ0feu/2AOIw9oI5DABXJke7xbGm/ByKmI6QDu3EV8tg8xEWQXY7XyTFGzwzkwqMuodEPZiDnmo327hDt4ly7Td8rrAucEt6SpfuPILfomBljXqzo1+P61aOtKnzXMy7KwuZ9A3BGBXU7VojWe/aNEqmflHwUOYpu0icsKQyR/+zAPNq3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SA1PR11MB6686.namprd11.prod.outlook.com (2603:10b6:806:259::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Tue, 8 Nov
 2022 19:23:05 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba%6]) with mapi id 15.20.5791.026; Tue, 8 Nov 2022
 19:23:05 +0000
Message-ID: <c600f448-9cbc-c67b-96ee-e78490f0495b@intel.com>
Date: Tue, 8 Nov 2022 20:22:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: [PATCH 2/3] ASoC: core: Inline resume work back to resume function
To: Mark Brown <broonie@kernel.org>
References: <20221104131244.3920179-1-cezary.rojewski@intel.com>
 <20221104131244.3920179-3-cezary.rojewski@intel.com>
 <925c6405-f651-f68d-73f3-46cf85cb2fa5@linux.intel.com>
 <Y2WmRUBJ+7K5zBm7@sirena.org.uk>
 <3ebce110-1a76-e59b-2172-616a3c0f1984@intel.com>
 <Y2kWKRLp2WARpPqZ@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <Y2kWKRLp2WARpPqZ@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0250.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::12) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SA1PR11MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: a63ecd75-260b-4253-5f77-08dac1bea950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ewv+hg63BX3p74BBt3k8k3sarb3rIfYNvVYZGhCe5q68GP5V+ObJvRwooYlMILIjx2wPV8dYvtbG9T0ArPQc822NCT5HLkRKC8qi8sHQjJFjz5sLDpov99LIUrJigcz1lTUqMsVBQFHBVto9zv9mOCRRO1Y12IZ6nbgKxdi9iQjioTomiRIdIX906asZB/d9HSfSv19RdhzCzhTrldDtbz9kmowwuXBPNt/aFR6hmruirn6MoxSuwe25FqAO0TZgNvfocHFxLW0hfGpPS1r3xMtAsD1DHnQBTtLAxkOdPpA6zttXlkkYnABbWoPP5y+krgA8SRTHwnqW1vrneURY9PWHFETuPExaVCRAiE1rhtswOFIc7BjM8GBIRmsfdg7/eScL/z4aFt4sXSr9vDjWjUClUAzawIGmShh2NvQ2S+yTF6WthZy+gSv3UFekHZJnKupRpFF4UZbpRo8MwAOTjQcQ94sMrEwitN8HBPO/AzjHlp/iFjbD+3VbdDL2JOsLaB3xopH7Lh6JjxyFN2VbE0nulDN0Mm6fuVqsluoziQcczq3anhcm4b80wQ4WUo4a5NPDFpuSVLOF5j9AJFZELvs6sPUPoB6K1s/Ni97a+NW/DRoCNjfrhsBLNagYgG61qKgT3Z1cBKz+qVwDhNaW2r/kqMVjrhDEGUDtRbzXL8S9fJSQIZ5hcukyYt2SGyNIiN9AdQcBglKubF/WY4aZaz58+VLeD6U8hfey5G+jmWn4EsD8M3q9Z4x04a+ZWFyz9ISQaIIElPXy8XbWseSeIZcu8thJqbfJhm9VJLi1BQQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(366004)(39860400002)(396003)(376002)(451199015)(2616005)(186003)(6666004)(26005)(53546011)(6506007)(83380400001)(44832011)(2906002)(6916009)(478600001)(6512007)(38100700002)(66476007)(6486002)(8936002)(41300700001)(5660300002)(4326008)(66556008)(66946007)(8676002)(316002)(66899015)(36756003)(86362001)(31696002)(82960400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STR4OU5Td1BFNUc4eWhhV2ZIZ2xBWW9ra3VkRDRkMi9NOUVzNzNnUzc2bzZw?=
 =?utf-8?B?dVh5OUppbGxtRnBSOVkzRkt1aHRSUzc4Z2dHRjY3YllNVlpHQjRwSUR3U2ZP?=
 =?utf-8?B?TXRJUWpHOGZzamhIWXlrZGxDeG9oVHVEM0QwRGIrL01QQzZKanVVVXAxamgv?=
 =?utf-8?B?dFQ1NURmM0RJM3hxMDFCcnZnTjNwWUxYRWx0UTN3Q28yZWMrNmw1cFNLaEM3?=
 =?utf-8?B?dXY3ZDNOR250bmtGNnRJb3N4MHNFQkh0OXR1cFpZd3c0MjR2Mks3dTR1V2hI?=
 =?utf-8?B?QUdLMHFYS3pnd2Rra24vS0YrMkkxRVozczlud0p3R2wxQjVBZCtvTWtLc1ky?=
 =?utf-8?B?TkFqTW5USDE0UzlhUzhwK0crWitKZmx1S3BWTTEvbzhMcGVpYnBRdTFFRTJK?=
 =?utf-8?B?K3NpUGRGd0FuRmIxQkRVcUZnakYrOE1VZU82dXRrWlAxRHk0a2d0cHRpN0dZ?=
 =?utf-8?B?TEcycDVBdnhPOTlUZUVJcDNPcUVzL1Vid0VCVklwd3pFaGJzNGZGTkw0OEMz?=
 =?utf-8?B?TlhxTWtTbDQ4bExsZE5TN3lWdnlQQjd6b0doRjI4UXhFYW1uSFIvTGNlS0Zl?=
 =?utf-8?B?alJEMG5sWldBRDd4ZUdKUFBBRzVJakMxNnE3VjFFV2dsOXpDRm9VU2tuemRF?=
 =?utf-8?B?ejYvbzVtVGgrWWRRazJPbWU2VkRUeHRlanFqSmowcWN2MjJRa2Y2eUNGN1lt?=
 =?utf-8?B?OVJmVEo2ZkI1V3J2eVFyd0JMUmVxR2tZU1UvUExDMzFDZVpUbkRDTXRDdWJE?=
 =?utf-8?B?Y2lXSDZhT2RxczdlVWpiV2FYTkltSlB0M0dIR20yeWUwNk9sdTJtaTdRT2Er?=
 =?utf-8?B?YmptV0puaUlrYTRhdEN5YUlPdjg3ZTIrT3R0eEEvQnNDNkNXUDEyRnhKWGVU?=
 =?utf-8?B?bVNYQTl5TVZhVnBQMXN2aHZjMGNKNzh3SEozNEJlL3ZBSm9jeWFPNkhpUEdt?=
 =?utf-8?B?SFFIUVNpTldlekphSldXbHYweTl5UGQrRFNWSFU3eUpTMGxES1A3L2U3bXRP?=
 =?utf-8?B?R2wydW5DZWJ5T1R3Q0E4SGE5MXUrN3ZHekVTSk9IR2dua2xBeUpOVkp2dytm?=
 =?utf-8?B?VWJTOFB1ME14SnU2SFFDRUxDWnNGOUdzalU3Y2Z2MnU0azNKc2EyM3RVTXpO?=
 =?utf-8?B?UERacnhhaDV3RFJYK0ZIYlpWMXdvNEFKTW5lQjRhRTBGak9qaGppTVR2TmNk?=
 =?utf-8?B?L09kanFaOUlQQk13MVNpZmhTOGIzbjUrcGdxOVp1M2JsOUlXTlJPNzFPZzRX?=
 =?utf-8?B?UEJwcVJZZHVlL1RGS2NlS2hIdEw2RXlnQW1GT3ByQzcyYjN5ZHNwdkpaYkZ4?=
 =?utf-8?B?aThwV05sWFR6MHZvZW1xVVZ0Z0FsRjZjK0toVlRzNGlZaThHMGJBUUpBYWJz?=
 =?utf-8?B?ZjI1NW9PN2g3VmlsTDNEdnozR3gwZTN6cXBTR0FQVUtNc2hWdzFTK1JucVA0?=
 =?utf-8?B?dVJWUFIzbk9YalllS3NpcVNMUDZVOFlnbis5MEJIRUdPeGV3cWh1T3ZySCtx?=
 =?utf-8?B?dEl2aXdjWEZ4djNIS1piVFNzV1c1M0tkdS9heWN4WWR5Ym1FODB5V0xSVFdX?=
 =?utf-8?B?bE1PT2N0VUY1TFNWT21GVjhVc3pFUFRZbmszRCtTaFJSZXRBRFJhdmVsT2wz?=
 =?utf-8?B?MUNEcTFjKzZBNGlKQTIzTFB6ZE1ad3EzdDBxNGNxd2d4MVhwZ29GMkgyaURk?=
 =?utf-8?B?K09ua05pVnBLZjV3RFNVbjlUcVlPcFlma3UzMEMwNjhNWDJoL2dqUVVJWkpP?=
 =?utf-8?B?dzFTVGZyRWZ2cWovYmNLSEpmK1FKZFRhSFNud3NTU0ZPMW1HUlR1YlNHckJw?=
 =?utf-8?B?Y2M3VnQvWE1JYjRmNGFLdFBzcDFzTWFXTkV6V1VWM2lzZklvR24xL01veXA5?=
 =?utf-8?B?VnBVbFBNQXg0TEpJdENWUlFsZk12M2hQcTBLTVU1Yk5XTkVkRzNUeVFQdFMy?=
 =?utf-8?B?dW1LUVM4YWRtWlFNZVp4allBU1NDSzBjMi9iaGF6MjZhL2haUU4xaGN4Qm5o?=
 =?utf-8?B?KzlvNVFsRWhTSGs2TXhLR0UrTXF1V1c2YURrQTdTUWhuWlNQZWRmbVU4OUh3?=
 =?utf-8?B?M0NiTllybjhhbzFGSEFMWXVoMlZ6dXpWcjVqMmJSN1QrWjBPaWVnUlR3ZGho?=
 =?utf-8?B?ck5JWUZzdjhSUkwxNTZHbVJZSHUxa1E0aVd1dFdzeFVpVWZEZFkzMGNnSm1C?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a63ecd75-260b-4253-5f77-08dac1bea950
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 19:23:05.7722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9aWSKSjnBelBwgoBNCUb8JLr+EUdJp6u/zl2Q+UsvJlXpWHH2oGxIFDVHzBe+PHBdgIj4Uz1tZf7H9fgkifx9+K/FPDqo+rRj4NTW/0hG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6686
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com
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

On 2022-11-07 3:28 PM, Mark Brown wrote:

> It'd be good to at least have some idea of practical usage as well, the
> functions return void because nothing was making any use of the return
> values.

The problem is mainly connected to a resume operation as even if 
something fails at suspend, there is a chance for the driver to recover 
things up during resume.

Now, if something fails during the resume operation, blindly returning 0 
makes userspace think everything is fine and we can keep going, whereas 
the stream may no longer be operational and requires complete recovery 
(close, reopen).

alsa-utils/aplay/aplay.c does snd_pcm_resume() as long as -EAGAIN is 
returned, then falls back to snd_pcm_prepare() before finally giving up. 
As snd_pcm_prepare() checks pcm's state before invoking ->prepare(), one 
option is to set substream->runtime->status->state to 
SNDRV_PCM_STATE_DISCONNECTED to ensure dai->hw_free() gets called right 
after.

TLDR: it all comes down to some granularity missing. Suspend/resume for 
the AudioDSP drivers do basically entire pcm-lifecycle within what is 
supposed to be a simple TRIGGER_SUSPEND/RESUME operation.

> There's also an expectation that suspend and resume be fast...

You're right. Sound devices should not disturb the PM for the entire system.

Looking at this after thinking the performance/stability argument 
through, indeed deferring work is a good way of dealing with the situation.


Regards,
Czarek
