Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D20707C71
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 11:02:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CA98200;
	Thu, 18 May 2023 11:01:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CA98200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684400562;
	bh=7F5nORY/H+4BhjrzjynjnS3jAMq94zrOrWTESMDbh8o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mHOut9y+1XbipCWVAq36ja1D3u2UDuoCApI0kMxrgKLm/3OuwWvkxVjvFFKPOVM7p
	 2Ez89j7zrK4DShNw6niCSBISu+MvSSUMqQSFw+EdobgeNkKiedYZ0thN2qmfd2zZMt
	 IvNFqDPJrKgiqRNM3f0wDZTb7CmuNkct4pcIsvuc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05DC4F80542; Thu, 18 May 2023 11:01:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45296F8025A;
	Thu, 18 May 2023 11:01:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F7AEF80272; Thu, 18 May 2023 11:01:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCD37F8016A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 11:01:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCD37F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KOGLTPDu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684400475; x=1715936475;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7F5nORY/H+4BhjrzjynjnS3jAMq94zrOrWTESMDbh8o=;
  b=KOGLTPDuQ/rUH8bKHV7oFO2MEqEXeCcYj2IPLQGOBz/4z2z0Tdqib1vG
   2E1WIx93d+eEqUNPhWV62jQuM1TmDKVOOAm7q4aqNKzSJvDygub0XHm0h
   negUvc4Cfr5A0e9ahndUPYzyYPQ4b5W6iKPLhm2IwTtViVPkq8gccFd6L
   dJbVeFyaF+cyVKN5dE5Ne3TXikL4obBipkSvb/7+UwhzUKd2fD9ttNB77
   RzqrclpT+vNVYUufgYvkUtdgifhNhTqpFny7Q9zMXKkPVfbOnNXo+ym1P
   61taog2g4oWNHgBhIcVhupsWr2PM3zhrR6ajrdSvjF5K+ZHionGJX9Ata
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="415439643"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200";
   d="scan'208";a="415439643"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 02:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="696232271"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200";
   d="scan'208";a="696232271"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga007.jf.intel.com with ESMTP; 18 May 2023 02:01:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 18 May 2023 02:01:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 18 May 2023 02:01:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 18 May 2023 02:01:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8Om7rrRw1eczovEXGMDd+Y4vWxrT7GZcEKy6+HKz5ZEnm+Kg0KncN8cm93Xhq61/dLRMhzsyKCR9/mTF2mzlH1u3tvHbt3emoCFK4W/dxgRALeEJaQ9b6WIbOmfh76JVgFXX+ihosqznz5HSu9d2L5rxMxFMPb9VO4S+4IxxRsk4Clo3XsiO7A3K5dL2o16HHzpkf4EVe3KrEs5856KiRdvUm3aYX9YKjuzyeSN12AzzZ0OsfjK0REQCRq5C/aduf2pFeDaaTl+3sSBFuKuKWJaR2yxEJ4IJgOoNXwQtXbsz+94FAEW3rqoLbsBJG3j3sPpnGauFmIIwMZh8R0AYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVzZ+G4XVse3oo3DBjG3HJNWUWyiu1nfy6nBEC462/s=;
 b=V70eEe/qart64XvaapyNZ6iPMcrvkDPeiLVtYfCQw4ONwp6CCVlLzLdEe5MZxZCyUstZwobk0B7B7+IClWOBzZv+H8XmIrob85eEj8QtML9BleNcUKyvxINr0LViB58riGKaVB940BIFq4xQH83JjMeZQJtHsghSTGhA4OS11JceSvd/nXys5BRMzbjboIKwYVsW2eoglKA46S5V2dDGeOiHqx+aU2oLthevjqzq1Tt28GKsV4s7fYeBYipwqCc17kDTTgAzs2oaimCnE5IUXlk/ye3WSbDQxekjRlNRttRhNcMaaLdk+5qhUuBeMi+hbq4yEM0vNuvGt3rLbflS5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SJ0PR11MB5149.namprd11.prod.outlook.com (2603:10b6:a03:2d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Thu, 18 May
 2023 09:01:00 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::b1f0:4762:2bee:138]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::b1f0:4762:2bee:138%6]) with mapi id 15.20.6411.019; Thu, 18 May 2023
 09:01:00 +0000
Message-ID: <91ec6843-5191-e424-1056-2aaf111d98bc@intel.com>
Date: Thu, 18 May 2023 11:00:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: HDA, power saving and recording
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
CC: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
References: <a7478636-af11-92ab-731c-9b13c582a70d@linux.intel.com>
 <878rdwjs1s.wl-tiwai@suse.de>
 <cceaeb53-06df-ced0-1f54-f5c0eb65f824@linux.intel.com>
 <87jzxe5084.wl-tiwai@suse.de>
 <41417b90-1881-0cbb-52e1-d63923dd8cd6@linux.intel.com>
 <87ilcxaj3u.wl-tiwai@suse.de> <87fs81ainl.wl-tiwai@suse.de>
 <7915b40e-a65a-479d-5a2b-062ee3cb432b@linux.intel.com>
 <87bkipag9z.wl-tiwai@suse.de>
 <98943bc1-c56c-45aa-06d2-80c618d0585c@linux.intel.com>
 <878rdplpci.wl-tiwai@suse.de>
 <63790c96-215b-bc8c-3ad6-7acbe487d85a@linux.intel.com>
 <87cz31pq2d.wl-tiwai@suse.de>
 <4cc5cd11-e1c4-1ff2-ec66-328a00b5703f@intel.com>
 <87jzx7103o.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87jzx7103o.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::15) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SJ0PR11MB5149:EE_
X-MS-Office365-Filtering-Correlation-Id: ee7330f9-745b-437d-615f-08db577e6664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 L7qjHvj3jSVlcrozT+fTuYiufCkX+L7qOjpSg0Hg3+OPPBG4RrUEOmY2LeqpJX8ThlQMsRoo+pJgMVDRDjXaiO32xpgZZn1COJ+1qHQ0JJDfY7MLEo4CMzIrhnhOrdFf5z7T6Iwdrvg6IG2/M+chjy6qe+KXIJj/PC5ZlWPpAksgubin5+y9dEXE+l73Xw/sUECWkDwbyZ77hc//XN7OqnJJ4AqcAk25ufBCoW6iE2xZMNPkBNHHlA6iJNGNhraAfN3JtNN9XY5ydjBj/rJvWNBKy96K0LfnEwXvui2GuEsWtJxa/wnhfLCp1OrsRBuIiwyefPzuO/KOW89byuOFe9U4mYDsbXgmxKEukR+aSrzyoFcdLqYkqpEbgJfrOqgv46jGluXim4DgULChOOyy7XVJ5wt7x9v69/YMwcR66GWtzyEoKCfDYzW9VnMFC+QXyQdsfZMl6uWfPs5q52Ix8hrs4yVvyVR2icMSDVJ9ZMlEoE1raWvX0utzeKp565RGNkF3506RW1S8fFIwO7AP4CsAQxew+YGzYYXxyUb+yexdMplNwpfI45fRoslypAfDnlHg+mzSm6YIICisiexWfHyVG++wJ5GTqMBnf9yjW/NUftRJSrj48cwIh3RYnfVuM+Zl6IssflX4ujZ82aPlENoIVciChcD/PCLLUXwALpA=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(346002)(366004)(39860400002)(451199021)(83380400001)(26005)(2616005)(66476007)(66556008)(6486002)(478600001)(8936002)(54906003)(186003)(6666004)(2906002)(31696002)(86362001)(5660300002)(6512007)(8676002)(6916009)(41300700001)(4326008)(36756003)(316002)(6506007)(53546011)(82960400001)(38100700002)(66946007)(44832011)(31686004)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?VXVlVjlVTUNpbDNTM0hxQWJCQUtyTmltQzhzK0ZmejdaWXdWSXJpK3VnTVJE?=
 =?utf-8?B?N1NUNWpYUzc0MnFJc28vT0V2dTFabzh0M293bzhNUG5lcER2aTlIYXZqQXNL?=
 =?utf-8?B?dVgxUzFjNEZNUkw4eWxRd3BHSUVrUFlMTVFyTUxDYmpSOHNGekQ5NGZjc3ho?=
 =?utf-8?B?N0gyQ0JyMUx0eXdodWRrRFdQRTAzb2ZKL0dja1pCb3U3OVIwVWQvcHZXdkRT?=
 =?utf-8?B?aEtUWWRFSkx3ZGhPUFBRclFMcGpJOVpjSGMrY0wvYngxK20yVzRpZTF4YTlZ?=
 =?utf-8?B?bUFCMGt5Q2QweW1zeUtjcXJ2YUJJTEQrVVZBMDFiMmtKenlKcWI0dlQ4dDdE?=
 =?utf-8?B?VXExY0lrRENraHF1MFNUWEpjc2EwVUoyTUdoVVVtdmwwZU9udkxyQ3BWeHdh?=
 =?utf-8?B?M24xMTJ5bmp5d3R1cUl0alBnNWpCUGZuSXR0a1F0c1VHbXN3RXFnWFhTSERL?=
 =?utf-8?B?Q3l6Z0R0amMvL3kwYWR2dnlTNlc0cy9wS0M5aGprNEhraXdhdlI4eTlpa000?=
 =?utf-8?B?eHh4VEo5ME8zU1JSRGJyL1ZGVHl1U3d5bERoSlJVTWxzUGlwZmxlMldWLzh6?=
 =?utf-8?B?Z2JEbXZnVEVFemNSdU9uNU9oenV2VXM4aS9pL25nVW5udVFKZ1Q3aUlsSDZy?=
 =?utf-8?B?aUpzd25SL3V4dk9XQkNLRlRvdUhqb0FyWEVUZXRWK1ByVFNtWUtPTzFHdi9k?=
 =?utf-8?B?TlBabmxPUk1yR2Y3MXgyaFJ5L09FdWp1cGY4dkxaYUtNSmhkSGhGSUE1a3RC?=
 =?utf-8?B?UWIxWjVMaXFFanVCSWlDUHRXZUJlU3ppOXJ3UjRnVzVjeUpkL0FoVTR3ZnYr?=
 =?utf-8?B?WmJNdmMwV0cxV0d2d1NFKzkzbUg1MWpveTJqMm5PUytOTXVQOVVISFJKSU81?=
 =?utf-8?B?YS9XTVk1bmFxSFhpeUxISTk2akpDMGxZNy90TEwzRVRNbjJodFViNUZFY0JV?=
 =?utf-8?B?MGVoSXpUUzF5cXVDREJwYXpDME84TUExV1hac2JKZVhuK2NMY3RmOXkvMzhs?=
 =?utf-8?B?a0FGUllCNWJUcDdjY1RnU2lJdEx2RUxEbUdVbjhDVUdYZytpbXZiUHk3QnF1?=
 =?utf-8?B?SElodFVTdUR1K2lHbHFONUZDZXVnTFY1VjgrYUVKdDd4enNqSnNPNzVjY0N5?=
 =?utf-8?B?VU9YVHlUbXRsemRNZTM0Y09XdkJvUVFYdUh4WnJ5YWJMK3piVDZmbVhxUk90?=
 =?utf-8?B?S2s1ak5ZbkJqK3FWTUsvQmU4UGIzSFkxVlB3L1pxSllCZUE1ZHQ3bmdOV3d5?=
 =?utf-8?B?aTZoc0JSM29WOXRHZGJVM2FnRU1LblUwSVo0SFdHNXg5d2Jia05hZFlBZlBK?=
 =?utf-8?B?dXdEc1c3UTNBWXdVMTcwWHZLZzhtQklocU1Dd0tUYVhsTDYyZHp4V2NGUWpL?=
 =?utf-8?B?S3kwL2gwemJ1emw3TnhINzkyMzh0SUxkankvMDlYUkUvc3BvbWlERzFtMG9X?=
 =?utf-8?B?WkttNzFjbjRkVDdBMXJvQzBoZjhOUlp6a0Z2aGVkQ0lBd2RDYzJvaW9GamVo?=
 =?utf-8?B?MklmMlJ4MXBiZnAxRVdFbjBzT29SNUkxRFc1NjZadm1IZEJXQmQ5cHZzYWZr?=
 =?utf-8?B?UnRoaFdFNytYV25xTWM3SEFkVkV2bE5Ud25LUGozNVNROHhVZVh4eHVIRGFh?=
 =?utf-8?B?QmU2MTV2aTlCZkpiRTJXeUw1UlpzcmVJaGJ0MDd4NnUyak1yNTlpbEU3NExB?=
 =?utf-8?B?UW5KcGhNWmQrVmhwQXVlMFFhdFV1VlRDelg4Qmw3OXV2d3V1VVJQS2o0T2cr?=
 =?utf-8?B?Q2xJYm40SWlVOGUxb2dMNEgwOHpoWWE2alZZZ0NYNnp3U3hPcWNQZEpDTG1z?=
 =?utf-8?B?Q1VMbFpZYVp5ZXg0WEkvOUtCQjNsUE1tZHFRamNWR1JzVnB2V2dSbDBkUTNh?=
 =?utf-8?B?WGJySk95WnlBZXFRcWt0cjVUUE1jMGMvN0N4K0JLdnYwYkZWMWhJbnM0YUJU?=
 =?utf-8?B?NVpyd3RVQUxaZGQreDN3UXk4aEorNytVSXB2VWovQkdtWUNKT2NJVk5mUk9X?=
 =?utf-8?B?QnhwMkh1K21qNjQzeUdTQlpkUm5zdGxqODd4bnRqNUVmSVNJV0JseTY2RkFR?=
 =?utf-8?B?Rk0za0kzZnlyNTNyWittMW1SSUt2M01IZGZqVWdqQ2dOSTNkNTd3SmsvOElD?=
 =?utf-8?B?TXBERCtvMEQ0aURYY2ttak80bW8rS0FCRDhNcU9Dek44dDdrY3Y2Z1E2VXZR?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ee7330f9-745b-437d-615f-08db577e6664
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 09:01:00.1452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zgXXLzdiOk/JSgAeUwt+lFBB2Pf65Flollapr6a9gOwIY1/dN8n4UdDD40hwZh2hd+JoSWvQwm5MeHMWK2uygPEJj5VNZIQ0CjGHGSUP244=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5149
X-OriginatorOrg: intel.com
Message-ID-Hash: MVBAEHHOSH7YU7P3AUCHRYY2B7OWO2KP
X-Message-ID-Hash: MVBAEHHOSH7YU7P3AUCHRYY2B7OWO2KP
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MVBAEHHOSH7YU7P3AUCHRYY2B7OWO2KP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-05-17 4:52 PM, Takashi Iwai wrote:
> On Wed, 17 May 2023 15:15:13 +0200,
> Cezary Rojewski wrote:

...

>> After reading this conversation few times I came to conclusion that
>> codec device should be kept up as long as its runtime_status=0
>> (RPM_ACTIVE), regardless if usage_count is 0 or not. Basically, in
>> autosuspend case usage_count and runtime_status for the device are
>> both 0 so, if we are not ignoring the former by calling
>> pm_runtime_get_if_in_use() then we end up caching the writes during
>> the autosuspend period - period when the device is no longer used but
>> there is still some time left before it's suspended.
>>
>>
>> --- a/sound/hda/hdac_device.c
>> +++ b/sound/hda/hdac_device.c
>> @@ -611,7 +611,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_power_up_pm);
>>   int snd_hdac_keep_power_up(struct hdac_device *codec)
>>   {
>>          if (!atomic_inc_not_zero(&codec->in_pm)) {
>> -               int ret = pm_runtime_get_if_in_use(&codec->dev);
>> +               int ret = pm_runtime_get_if_active(&codec->dev, true);
>>                  if (!ret)
>>                          return -1;
>>                  if (ret < 0)
>>
>>
>> Results for the above look good.
> 
> OK, this seems to be a workaround.
> 
> I took a deeper look at the issue now, and noticed that it's a messy
> problem.


While we want to address this issue first - I've even messaged you about 
this for the very first time early 2021 :D but it's not marked as high 
prio so it remained unaddressed till now - me and Amadeo spent some time 
analyzing most of the pm-related code for sound/hda and we believe most 
of it could be replaced by native pm_runtime_xxx code and fields such as 
->in_pm could be dropped. However, this won't take a day or two and it's 
best if first we get to know the background what/why/when some of those 
specific functions/members exist in the hda code.

> The check with pm_runtime_get_if_in_use() itself isn't wrong, but it
> needs the exceptional handling.
> 
> In addition to that, however, we need to work around the case where
> the register gets updated twice with -EAGAIN handling; at the first
> update, the regcache gets updated while the actual write gives an
> error.  Then at the second update, it checks only the cache and
> believes as if it's been already written, and the write is skipped.
> This was what Amadeusz experienced with my previous patch.
> So, we need to paper over those two.
> 
> OTOH, if we replace the primary check with
> pm_runtime_get_if_active(true), this makes the things *mostly*
> working, too.  This increases the usage count forcibly when the device
> is active, and we'll continue to write the register.
> The caveat is that the auto-suspend timer is still ticking in this
> case.  But, this won't be a big problem, as the timer callback does
> check the state and cancel itself if the device is actually in use.
> 
> So, I guess we should go for pm_runtime_get_if_in_use().
> But please give it more tests.

I believe you meant pm_runtime_get_if_active(true) in the last one. If 
yes, then indeed I'm delaying the patch upload until more tests are run.

Once again, thank you for the input. Ramping up and addressing this 
problem wouldn't happen so quickly without your guidance.


Regards,
Czarek
