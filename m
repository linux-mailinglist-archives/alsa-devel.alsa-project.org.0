Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 727AC624697
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 17:07:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1030F166A;
	Thu, 10 Nov 2022 17:07:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1030F166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668096479;
	bh=Zsr8sIl2I0V1CpLo+4l1kBTbK48LE05CT5qZX3urgWw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J2EvH9vAR/e3HqwgAa0ofI5ZbejlKU3E5MSJFAUS9yOHlEdLeTrQG40ac93cadEtW
	 q+ybqkb5xwemh4FdEelNm5QTohmBPtwEI2AWcwKqIrDIvjIaEPhx6AKMo3ubniDRNz
	 j0nIR+65pWNsjAtCj2sVSS8zTz8z/2/4xPObIjlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85DB6F80104;
	Thu, 10 Nov 2022 17:07:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1260CF8021D; Thu, 10 Nov 2022 17:07:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 054C0F80162
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 17:06:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 054C0F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kXPq7FS6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668096420; x=1699632420;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zsr8sIl2I0V1CpLo+4l1kBTbK48LE05CT5qZX3urgWw=;
 b=kXPq7FS6yYw1ZfXRyN7VOG2kcpxxUWBwijaifHgVxcMIVmCd5IYadGkb
 fGf/fCdXoNIpMevcJT9SmQ6O/wWxI/jt72Zlor6pPUxV+/5SZyBxOSGwh
 xFb0Hn7+hCbR8OjLidNANyceQpEjf7vEdoDiDvCmOxQp6shHipYZ3Owzi
 hq70IEX9JW5MU4sSZBBwhYFvWu9/tS2H9eE2TYtrkBACSTvHC9wJnHRsw
 X/ceXOUdtdiD47fQg7dsiEgAp7IkOtN/QRIWWQaYw5azfrXiR/mqQXMoX
 zcHq0BA5sY0nQM1oPVMr7cdBzDus0y2JGj//iRBr2rBEpoqNN84xZGz5d A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="308971374"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="308971374"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 08:06:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="637221705"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="637221705"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 10 Nov 2022 08:06:54 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 08:06:53 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 08:06:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 10 Nov 2022 08:06:53 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 10 Nov 2022 08:06:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWcDPLiKK1N9d8jHh1QZHSd/sF4tCkR8h8jdpEoOzvXN0ac3/e8+YODrfoPm0qXZ8Om3rgyMQ6dFQaMtdJmVA6jvpbNng9C2mXKGVbAqkTzVrBXhZDiHMZY5TLC1R9R7q/G0T1EWg9EP7Xsj6/dZscQEKiDOauemoA8E7/kA4Yp76JCLHTx+UwedEAk2Y7aHLdkLH0myMHHqYELPYBQhhVjoJccPrhycX+QGK7KwEyGmeeQaoRK56E164pEdyrDPezfTY9x7jMS1Xn43HPXF7OFMiw9XmQK4UcHyX9C92VCvYVcHteCn2gDEtDK6dgRTeX/J0u+4rrXL0DdKjRVtlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gT3EdMRO6IckbEPBKcJtMdJFagM5UURprJLtCo3vZeY=;
 b=iENJcd1fRQE4F5dyslIUf/GUjnQCz53JsQlU3/2xBTr9IIJ1J1N1YJvzHXdBDzrdE8kPKwj/noOemlYC0Jdy6SR2NyvFxTtZeqyTgWrwXKwtWXN8Ho/kKwRpeGSeM1bGcriR9/UikMIeLP8UM4WGjh57R8FpbT/CDqm2roBR2an7PxsTALIsLRx7LoFEa0qRdiTRunQHtli0QjPOk9kUD5H5aZFhNAfscoRn3BWVv/Wy4NS7Fsh3qtWuLCvXFOk6v0Pjj7xkbh3/oKI3RF0YwFjBk1XDLvPphb/1JBGiIMow20JGyBZHv1BVql6aKZNXzb5zd3jQTHXgGHw26aTAkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MN2PR11MB4679.namprd11.prod.outlook.com (2603:10b6:208:26b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 10 Nov
 2022 16:06:51 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba%6]) with mapi id 15.20.5791.026; Thu, 10 Nov 2022
 16:06:51 +0000
Message-ID: <8cc5ecbe-8112-2359-aa90-1d5d1b50d89c@intel.com>
Date: Thu, 10 Nov 2022 17:06:45 +0100
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
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <6f86718b-5d96-3e73-bfc0-321288e2232c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::7) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|MN2PR11MB4679:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b4b5f70-152a-4bf6-eb22-08dac335945e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ALNPTa1Zu4H025UGtJJQ5gbYPM5ahRe4B7A8vWkFHrqjfpH5N+OrkGzG/Zib9PRtjZ9bznN98DT8zVyLpzlumJywFmgvdPZ/fWZxKkVngliHBN1niIqRFkPubqtcYMIctevKwLaAuQV8sD2euWQ6wkD2/axBjoeOm/uu/rEQEtF4bcCRKg8K1weNoamdOcEFrD02XV/o0awpMw4rhQicKmd9LqZIkXOZmfMgQnOYwjwOygWFBQ2NKWSH3ObCUGarknGI/il6oMkTfMPULhMi/ErpTwYYw0odGQ4ceB9Up/uQm33usjZWX+coDrWy3gHs5EMMJkOPAvSVaqHly8doyXGXa/TPXATFgSBdnSxG8fXXBjZSHWv+nd4WmNitmVBrU6g1DSJKLQolgeKZ3QPYPu9oNxMk4NfkL8JbZBVdOMuTyRNMgcqcYe8SSVDVfzt0IVFCOXZ1s6khYpi5i6CfKY+lMyW9gAAIURIDMHlsWy2+nYeHUj+L5Iawj+kqmw9NyggVE1exz/tBrGAClJ7CvEUzu7L/H88OVq0lnfpWu0Sd6LF6UMIwWO+GCMSLCu13l8cajxhf+nifR1DSOr+b4VOWkCeJ+9hq0yVSAh8dt50zCT/5SHj4a5JDWjY8jfc2bL4T85t0RtCpqCR9iOaDuvQH9SWNyRfy/Msh9fFADaLdv+K27eiT92CGQTStu518ujZCp+hjkfJwMZ/K81SJCODyYxECnIrffZF6KJayQs+/X3Ke+F7Znl9bvDqQzWbE8PNCAhQBDoxiEV/WX3d5eYHLUNwRrRWCb0zipg4T984=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199015)(31686004)(316002)(41300700001)(36756003)(53546011)(26005)(6506007)(6666004)(4326008)(8676002)(66946007)(66556008)(66476007)(8936002)(478600001)(6486002)(15650500001)(2906002)(5660300002)(6512007)(44832011)(4001150100001)(31696002)(186003)(83380400001)(2616005)(86362001)(38100700002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU85dEFROGpaeGhwTTBhck9mS1NXMm8wQ0tiaUVsY09FZXpuK09CNVEwSDZs?=
 =?utf-8?B?N2NFU1k1RkZFQmwyUEJ1UTNxS0p4NGhhZ3pJYkI5ZVpUR1F2Vy91K3FVbHZV?=
 =?utf-8?B?WTJ3b1ZCSmR4cWoyS0k4eFpXeUl0NldZUFlRQis3SEpXeXlNZ0tDUklrZThw?=
 =?utf-8?B?bm54QVE4NXU3bG9tUU9jSng2YXFNdzE5TThTcEZweG1zdGV4dnM5eDg3Y1JY?=
 =?utf-8?B?ZTNWVG9MQlFIOE1lSWNXSnFvZHlOZ000UWtxRGRwVnlrNDVsenFveE0ycUk1?=
 =?utf-8?B?QTR3bXlXYjA0cDgvRFVSd1haTGQyTGVZMFUwWXB5ZUtmQVNwYlRjTVo5QjJT?=
 =?utf-8?B?bm9YbDB5NkcxSmVsa00vWCswUWg0V1RRTGFFUG4xUU9VaGgvREpyNk9HMmVZ?=
 =?utf-8?B?Sm94SFZrOVgzRkRMWjV1RGtBYUsyM29KT0VQbEg5bVhrU1pNRXlFWlZ0a0xr?=
 =?utf-8?B?eXlzdVF2TlM3NDFCV2tlYkxTVGMwT1ZsV2tXSkV4QUhLc0ZLTlE4dUZTcS9o?=
 =?utf-8?B?ODkvRXpaYjJJc3c2MVdFVk9jQjNiZGl1YjhZOVJ5aWlWcGVwZkw2azBwMVZm?=
 =?utf-8?B?RFRkMVRhWFFWQlR0SWZKUElBOUpXVi9ZQ3I5dzRJMU9yaDlrMzViRGNPM1NO?=
 =?utf-8?B?clFNMVQxTVUzUjlnZm9JU0RaZWQ3Y1RmNWM2blNHcmhWY2ozRS9JdWM2VHQr?=
 =?utf-8?B?YmQ4YXgzUkttbjY2N1Q4eXM5citNYS9zdHIvWU5PTkZWbGEwQkZqRUZOOTND?=
 =?utf-8?B?ZjNsNFhXOEJaZHhoRHh4UXMxeHpFdGQyZ2hYNEZFdTBKaFdlZzhIVFhLMnRm?=
 =?utf-8?B?WTE2b01zdGgxZ3RGNERqd05HNE54N0hmYUREYzNGOXhTakxGUmdTVTNqa1RM?=
 =?utf-8?B?cnJZQXB5dmFMWXp3UkJzUlJHWkRydlZ6K2hVT045b3lUZDNvdkM2ZHVhSGgr?=
 =?utf-8?B?NVJ3SHg3ZzVKSk5EV3lwamdqSDY3VXFrNG1PcXREZnFTQVk3SzR2bFYwK2Ni?=
 =?utf-8?B?S2x2MzV1V2dLbVJTUE9pdmRMbEgvOFhtdUYxUENFYnI1ZFZybTlBS3NtRmVU?=
 =?utf-8?B?c2t5UlFHaGR4ZUlROHArS3ArWFNxUWp5QkxSNCs1S1RGc3ZHUXoyZFJlenlC?=
 =?utf-8?B?ajBjYU91b3BpS3VXV3Q4L0dXY1BPT3Ruc1JpYWFGUDVrSkF4RG90UjJpL2Vk?=
 =?utf-8?B?YlVRNWZWd2RUWXNwc3hlQTVTeWV0NGZ1c3F2cjBPc2RLTUR3cXFybGpCOU83?=
 =?utf-8?B?YWVGWlNEekxXOHdhSE9GL1Q4SENLa0hmdEVWT00yUjBGTzdJY3QxNUZIb1Ja?=
 =?utf-8?B?VUIzTGNSWDFLRDNRWHVqWE54MXRUUzN5ZnZmRlJWQk1hZGFFLzUzYVJlRjZQ?=
 =?utf-8?B?SXRhRjJkNmJuUFZveG1Ka0Eyd2kxWHZlekZMZ0JETlpMSmt1aEtEdWRUTTR4?=
 =?utf-8?B?TVVVUXd3SlVaaHM2QmgySXRBcFNSMWpRTWtJUHJsLzJmVUFiLytmU2UxYXhN?=
 =?utf-8?B?dEY5UlkyYThFZ0hpbUgzakxZNGo1cUlvVDNOczlVYmxZZ1p1OTREVUk5WVZz?=
 =?utf-8?B?YlNqTkJHTlBuZFlhZVZWZnVqWTFPT1cwNldPa2I2QSs4c2ZBMndMT2kvWXEv?=
 =?utf-8?B?VVEyckFxMmhNaE9sTlNSdkVKUUMrM1FxVi9LdWhnZFYxZUtjWi93MkJFdzFr?=
 =?utf-8?B?cFU0b0dQZDdESVBRNmpUNmF5dHlReDNzellXTWQwSEZNeTQwdGJCY0FMNkpV?=
 =?utf-8?B?NXN1R3djV0RPWXloOVlYU0F5eGU5NXB0WE9xYnBDRm1pRVl0MGIxZ3dEci8z?=
 =?utf-8?B?d0JFQ0dXUEN6ODYydk8zQytyemZQMndqV25GQVVJaUx5Z3Zhakl4S1RvMUdo?=
 =?utf-8?B?QVY0cEdjMjZCRytjSUNaRDJnc01JMHU5eVZ3Y2FjcEhLNkZxZS9NUGdKZkZr?=
 =?utf-8?B?MlZEa1VXalFwWnFuZzRxZXZreXRoQmxBZzNIcnBOanlRcThMNHk1d3MzMEgr?=
 =?utf-8?B?Z1JLNjF5UThaWmlualpTYkdSWC9qbVREVUp2SDl4dHpEcWFWd0FyS2NqNjFW?=
 =?utf-8?B?TkE5ZWs0dWZObCtzRTkyTUl4Tnl6dW5LMjNVeDNYdHdJekFvRTVVYmxZVUpR?=
 =?utf-8?B?a08xTlpDQjlxcE9sWlV1eitEd2tLbkFjVXlkbTdaZDVFYVdnTHpmZW51L3Rl?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b4b5f70-152a-4bf6-eb22-08dac335945e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 16:06:51.7225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dFLzwkblYt7GNWbVVJ/QKv2nJOrAyWR+P7EpR1g1hBe+T15mLgyElbFmqEcx13FVBWJT3BQit4h8Me0VE7ZCMhZFIEJM4ceICRsIy7cz9mM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4679
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

On 2022-11-10 4:39 PM, Pierre-Louis Bossart wrote:
> On 11/10/22 08:13, Cezary Rojewski wrote:

>> --- a/sound/soc/intel/avs/pcm.c
>> +++ b/sound/soc/intel/avs/pcm.c
>> @@ -934,8 +934,11 @@ static int avs_component_pm_op(struct snd_soc_component *component, bool be,
>>   			rtd = snd_pcm_substream_chip(data->substream);
>>   			if (rtd->dai_link->no_pcm == be && !rtd->dai_link->ignore_suspend) {
>>   				ret = op(dai, data);
>> -				if (ret < 0)
>> +				if (ret < 0) {
>> +					data->substream->runtime->status->state =
>> +						SNDRV_PCM_STATE_DISCONNECTED;
> 
> should runtime->state be used instead of runtime->status->state?
> 
> A quick grep shows the former seems more popular in drivers,
> status->seems to be only used in pcm_native.c?
> 
> Another plumbing question is whether it's actually ok to change the
> state of the runtime in a driver, are you not going to have locking
> issues? Very few drivers change the internal state and I wonder how
> legit/safe this is.


Unless something new has been added/updated, there is no runtime->state 
field available. All the PCM code works with runtime->status->state.

component->resume() gets fired before any PCMs have a chance to be 
resumed. Userspace cannot access us _yet_. Similarly for suspend, 
component->suspend() is called once all the streams receive 
TRIGGER_SUSPEND and from then on, we're on device-pm level already.

Well, in regard to grep, very few drivers enter the recovery jungle. All 
of this is to help improve user experience when things go south. 
Unfortunately for us, restoring regmap is insufficient to get AudioDSP 
happy. Right now if things do go south, userspace still performs all of 
the PCM commands on the stream as nothing has happened - 
snd_soc_suspend/resume() return 0 in all cases.


Regards,
Czarek
