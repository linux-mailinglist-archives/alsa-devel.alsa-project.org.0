Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 274FA4D352F
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 18:18:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 931751718;
	Wed,  9 Mar 2022 18:17:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 931751718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646846318;
	bh=xjT3ArfWW0ARKYt/d9h76iX35r+0TKwu3go9+BN+SHQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dfui7ggkxN3P23HMpZKFj1OUr2Z//SGunGq/JSF+eFwLsBAhRU8TA83Lbvz5NTVQ0
	 VARUN+L6msBPL/CxrdiR+YhLBzi1u5LAVQaT0AspMydc0waEdwnEQdHqTWHD42nyfF
	 nodrssDa3eAyLDMW6rJGxIIvqMtS5rHegfb+lYEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11F9CF80236;
	Wed,  9 Mar 2022 18:17:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63AF9F80155; Wed,  9 Mar 2022 18:17:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 500DDF80155
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 18:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 500DDF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XdKQW721"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646846248; x=1678382248;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xjT3ArfWW0ARKYt/d9h76iX35r+0TKwu3go9+BN+SHQ=;
 b=XdKQW721u/O2yWuRKFAjW/3SpEdlSI8xJsK6WmrWzbFhLEDwXuzdbSYZ
 EcHswTPnTGks+erHsuXv8XUqYmb+ZgpaBchu1gyhXq7hY3E1pHo6R6I8N
 dcd1NPt98i5JkRWpIYHJQ7sBksKymgPdFfJ/wQTemVR8kOoWS8ZLKSJZL
 5Q6aum/k5G21bqv2alhkZs19cfAp11VKP37Mwd6FlWTSckPcytOFvmht2
 CMDj6Rbjvc7dHTFxNDK7qd85RpJHq1/N3NUGp5xeupegO770keEvU6GzR
 uU/YxQQR9XECbSio9JbSg2WCseucJUEAqmYdoxzCAM7gKUdzaV/qltPsj w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="254767691"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="254767691"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 09:09:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="495911467"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga003.jf.intel.com with ESMTP; 09 Mar 2022 09:09:18 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 09:09:18 -0800
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 09:09:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 9 Mar 2022 09:09:17 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 9 Mar 2022 09:09:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxK8Q9hb87V5mVzFAxYmbOEKJ/MJOamOU9D3l8vRdXhDBy01Wc6QVxDQJWm3ZQjQTA/GDYZtFMwGCFwSYhHSBubdyhq3AUxlgGo8xxFNsnUTF8wY64D4pveTY0X5FJaYqIgjwBUckj0JLS46qCIQmN6khM3EGUj5K5Mg3v/HXdnwII6wHNvaOwDKX2ixU1xDlfyHZ884RAjoW2dO9Jfv/q9fUrTPkI68/pg5YyfHizoFYjB/e4SDOkmcIIlu+HvvZc0zi+S/xLHVgbzirBtuG7rxryw3eCBOrtyKo3IutVSpU63cyG5cb2JPfLXrkDj2CXHzf7bKS1krlRbr923P0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+aHoIVUGSWb5VtAV5SqSjx+pDFUdajJY/lZFq+rbD/c=;
 b=XVBePTwOzOWk2lp68e1CRVVXL2u1yLw6R0N/mi0hdWAuhMdDiNtHmuD+nGsTMTMzXE+6UQ3UPhwmnb/+D0gzZvi1YfPbBdleQIVNSc3lixvEal7zAv4FrD/G/tyUWMKVHRl/zG1/01lPPbl3BP/YyWNp3+WbsjvN2vJiJfQiwP0Qvxg3utSxGFrhN+EEtMY1hZgQbtR97VrmvDyX4jt4JpexovvujW61MeFma7lsZCvD0pzTkW/E7Hg+1zCsy67iHtA0bBVJ0Ki2/jYB3Gi2ReKiF11TvbeAWOfZ+4yW76QFxtULGr8Luio7k4KuBoWVXl33P5Yqxu8kuV5rrNozvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SN6PR11MB2653.namprd11.prod.outlook.com
 (2603:10b6:805:63::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Wed, 9 Mar
 2022 17:09:08 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 17:09:08 +0000
Message-ID: <f65b4231-0335-b14f-730b-c3d99fa10dd0@intel.com>
Date: Wed, 9 Mar 2022 18:09:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH 0/3] ASoC: Intel: boards: cleanups for 5.18
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304204532.54675-1-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220304204532.54675-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB6PR0402CA0017.eurprd04.prod.outlook.com
 (2603:10a6:4:91::27) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1abd375-5eb6-4fe7-8cae-08da01ef8609
X-MS-TrafficTypeDiagnostic: SN6PR11MB2653:EE_
X-Microsoft-Antispam-PRVS: <SN6PR11MB265302594850399D2BAF3B72E30A9@SN6PR11MB2653.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wxjlDTLQOwrVluK/FfVkKe8N2+wvTGyWHegd9lUgC5R4eZGdkcJsShhETJoqr+ABQmy0LM0KNdi7A5CgkUgap5loqpIYIkA0YpcmbdVy1COFVNwU6CWbJoA7TGWy3sbXBQKnghZ/QuZ6aFSBgUbKFNZBdItVDwNbGbcBh0Wn/qCsnH+SCLO1T3xWrE94QQJecMyC6S2inBleelThAOiq6fQNEi5GysWIv5GcAV9247tYV5dfeaHrlTed1kl+hjKr9SG2X/YpMuAm1nEMDhCbiatkl9zVFXKH16eKEdrEchas4cNenH0xjuDzBedRlFCLQcX9WwMVbKTcF2/KR7qwuszhzJikeaFh1W5aX8MjplZmxaJByd/LnOQsSmcbv2kJjK4DgxCm+47O+TkWQNLBYdr77UMWTjwPtkYopu8AvoSPOpzrSjazo2i62OZYG2qD5YYbZfjeONfEBvZdoTUPsKw8e0OzM/VsdYFhPXq6wj3A+DRIaO/pj4CH0PVHyjO9WVm4Pfz7OBifbCcviqOPE4NnGEAuJ0tm26e1/Upd5G+GHMyg+dCDiFr8k08xxM35sjP4ZXE7BlS5xx3mzexRYCW+T2A3wVkw0nYJE+tqPVGU4GJcqdZzdMREe+u5sHIUEGqmI0vV8iAuJRX8fUjVZdZYoMUAIkQfp8YQI2HZoq0cFKOA+31N4kMpwuRWMbcUixPgqYisQRCMJQXv1tMk/qToqxGxsXeFN7SY3ivdQ2g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(6506007)(6486002)(31696002)(4744005)(44832011)(53546011)(6512007)(86362001)(8936002)(2906002)(508600001)(83380400001)(66476007)(66556008)(8676002)(66946007)(5660300002)(4326008)(38100700002)(31686004)(6666004)(186003)(2616005)(316002)(26005)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UklFZTJ4NlFwSU1XamE4SFpBTzVmaWcvamt6UnFEUUZZczlVQVFKSnhhUy80?=
 =?utf-8?B?MDIyZG1pSmppYVNxSTFkRjVrdnVuaHY0Y1VZZksyZUZkMmI2VUdWdXdEVnVM?=
 =?utf-8?B?bXpSc0dXc3BQSnZnS0RlMmNaT3VnbnRYYkJ4R0c1UHZCQUxZbDRMSnh2dWxM?=
 =?utf-8?B?Ym9pTUNRTkZkUmVmdko5S1Rud0xETm0vcVYrQXg2TDcyR01PNEV2N0ozQ1RH?=
 =?utf-8?B?VVNCRzZzN1dwSy9FU0tuRHVjT1BwdDF2WUJlbHk0RWE1bURZL3NHanZjeXpD?=
 =?utf-8?B?emxXU0diVWVjc0hyTy9udk9pc2t2aFVLSjNjcXZSc1dINk51d0s4QzBOWnV2?=
 =?utf-8?B?eUJVOWtlVGVjRVNIcTJLVXdkYkEwb0ZqYTRzeS9RZkxqNGpNeTJRTlY4eUZL?=
 =?utf-8?B?ZnMrbWt1WTJQa0Y4NitsQVhxL1gvbFJoMytGWTBCa1grc0QxZCtkaTRjVnhF?=
 =?utf-8?B?MEQxQU8zN2IwT29xSTBSTEw0cTdTNHBBalVJMGRQNFU0S2p2SGxpNng2bGRh?=
 =?utf-8?B?UE9DK1N2N0dCbm5qZkdxaHROQVg3dHdteGd5aU9wMnJGcm4xK1ZaYnFaVm9M?=
 =?utf-8?B?bThDMHhkQktoRjJET0VXN2tkaVZLNGJWck1GNk0xTXA5K2VxeTl3cWM4aFUy?=
 =?utf-8?B?UWVJNEZXRmJPR3hJRzk4MFRlM3lwVnE4Z0NsYWZobjlMREpiOXBMRTZLN1ZT?=
 =?utf-8?B?SzBmTFFrQXZZZXo3cE00RU5HUlZwb0JURXRSaEtQcVpHMy9aWHVDeEU2MTN5?=
 =?utf-8?B?dFNiVGtaSGVRekxYUEt5NHJySHN3UnlRN2UwaHNmV244ckovOTJIWXcwZXZG?=
 =?utf-8?B?QytITkxRR3IrUWp4RldsbFdvQU9LMWxSZUxwektLWXV1MTZLMGFwVnBrdDR5?=
 =?utf-8?B?aWk4TlBVWFpTdkxkTi9oU3NUc3Baa0VVdjVuUWVkSTJwOW00aWdPc0tLVll3?=
 =?utf-8?B?RVB3blVNYkNXTVA4TkRDY00vVytIS0c5MWZKM0RhbmRCV2lMOTNWbXprMGM5?=
 =?utf-8?B?N1F2ZHUzZy9BVEIrT0VvSHNZcTJOTUdhUjV6TTBDTFRVcnBTWGtJWm0vd0tZ?=
 =?utf-8?B?UERkcG5vM1pHczcwUnRsT0ltTkx3N2RxckhCNDhaZEJXbEZNMFNoQUhPZlpG?=
 =?utf-8?B?RFROZEdtMWdvcmxtMUNCVU5pL2poTHpMdzR1bXY5MjJyblEyZ3V4VVdJOHJQ?=
 =?utf-8?B?QXRTNFl5SklJai9WVTJrb1lRVENXNG1IeHU0Q3FQcUJEL0s2SGh5cktBY0VT?=
 =?utf-8?B?ZGJOSWc4anVnMWErYTZDdmtpcndGMFlScU55RUlURjI3K1MwSWNqcVIvZ1VU?=
 =?utf-8?B?cUFsbW81NkI5YkRrazYxRUxDSHpJRnRvbmxoWmJ6WGlHeFltOURqaVlGeEZY?=
 =?utf-8?B?ZlFLYllmbVprVThtVTJUK2RldENtWFNQZzlFcG03SUFlaVNiYXdlVDVEOXM4?=
 =?utf-8?B?dlNZN3RoTWZ6ZGltWW0yNkRQSHlVdWtpR3J4L0NIU3JVMlR5NWpYWmdDeUVZ?=
 =?utf-8?B?cmNQajRWMGNxcFhhR29DSXJNY1dFTy9PSURqU05WSmxFbkE2VmhWVmlYU0dl?=
 =?utf-8?B?MW41MUMrVjF1YkI5RC93N0U3c0pwZzZZcHpla0xzUDNMN3A5T2czY2UycnR6?=
 =?utf-8?B?ZG9XUjAvT1F4MjNuUGxXOWpiZkFkWWR2cno1RXo4VlpRNXNhQ3VUMmpFQjNl?=
 =?utf-8?B?VWNFL1N3bmR4VjJoSUFGdmRvUE1ZTDFRREhOSVE4OVlYWEVjb2JScHpmWVl0?=
 =?utf-8?B?QThWUmNmNHV1TE9ZeHN3aVhORXRMUk1oeWFmL1JZNEhkVnM0bzNCS0lTS1Vk?=
 =?utf-8?B?WlprWENuSldGVkFMdm44dHR0NkJVUHZxME5Zd0d6SGUwQUpsY0FWSFo1OFJj?=
 =?utf-8?B?UjRBTEhxck9SUXpKN2JHSHFUcDdyckhyTlhxZ2hyTEkweXFoK291aWVrYk9k?=
 =?utf-8?B?QkIyNTFGUWtQelhGQlE0SjZhNEkyWGZzamlGMzV0THEzRVVHbzhTaTRhaHdV?=
 =?utf-8?B?dVdodFFBSXBIZWYxK29oY2MyWTIwaWI1bDBKY2NhODd6TjRGa0ZEcktXbm15?=
 =?utf-8?B?bW1VR0hLanR5c3NGS29Fem5ldUJmTnE1Z1F5OFRPdDVwZ1NzOUExVitnSW1k?=
 =?utf-8?B?T2dpK2xqN3hGQ0hRU1ZHL0g2R2MyeWd6ams3ZFhoYnRBdzFZaEVZL3pXYWJ1?=
 =?utf-8?B?KzVuL2o3bU5mZ0NWRmFnWkNEY1hENW5qYU1ZTDZyaTR2ZEVPS0ZDTytWTit2?=
 =?utf-8?Q?0qW9DlqhgA3ldLg9SrW3fsutWEdNbXdKajk6HUjHOg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1abd375-5eb6-4fe7-8cae-08da01ef8609
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 17:09:08.6743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: swVqshDedCurjvAB2lvACmuM19tdeyjwWTOq7al4XxksQ77ZBdhNT7OflV+JmIZBsp23555i7keF7Y1SsBU95/GX9ZToDn1zyeWXdp0RldY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2653
X-OriginatorOrg: intel.com
Cc: tiwai@suse.de, broonie@kernel.org
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

On 2022-03-04 9:45 PM, Pierre-Louis Bossart wrote:
> Updates to clean-up the GPIOLIB dependency and a quirk for HP
> SoundWire devices.
> 
> Anthony I Gilea (1):
>    ASoC: Intel: sof_sdw: fix quirks for 2022 HP Spectre x360 13"
> 
> Pierre-Louis Bossart (2):
>    ASoC: Intel: boards: remove explicit dependency on GPIOLIB when DMIC
>      is used"
>    ASoC: Intel: boards: add GPIOLIB dependency where missed
> 
>   drivers/soundwire/dmi-quirks.c   |  2 +-
>   sound/soc/intel/boards/Kconfig   | 49 +++++++++++++++++++-------------
>   sound/soc/intel/boards/sof_sdw.c |  2 +-
>   3 files changed, 31 insertions(+), 22 deletions(-)
> 

P.S. The s/Convertible/Conv/ solution is neat, simple and straight to 
the point.

For the series:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>


Regards,
Czarek
