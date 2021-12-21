Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBB747C400
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 17:41:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E14F815E2;
	Tue, 21 Dec 2021 17:40:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E14F815E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640104897;
	bh=sdY94QhUOSzGfUZkPUtIGrkx/fvV1KG5DGCOEimX+lY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sN9lp7Ey84bKpR5glgcfH0IhVIFNhb3aV76Tq12peraF8zLXi7q33zyozoCXfsUG+
	 LyJKguxmC1aSf2EwO5pNn8APDJ68oQc3KVj/uqdm+0oPekQVCPkrThjtBJoaqZvVlW
	 LbLWAFusUxYCYmychyynJRcD3EArIGNFGiZs6dP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3372F80125;
	Tue, 21 Dec 2021 17:40:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E757EF80118; Tue, 21 Dec 2021 17:40:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21F79F800B5
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 17:40:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21F79F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mDJymE6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640104827; x=1671640827;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sdY94QhUOSzGfUZkPUtIGrkx/fvV1KG5DGCOEimX+lY=;
 b=mDJymE6PlnVhnOAJT3tR0YST9ww1+qf38bf7mh1sRo8g7Hk5A1kYnH1R
 ePN8yD2p6JGv6+DaGSBcuX+OUmSFMP+e01VF8vXlCCv2ijuIVlNGbtBw1
 kVD1VX2usZCOonhp82v1NVxIruAhAjLz7NZhqfafyZNk/RdnZqeReJM+M
 U1dZfMY4w5lIeCJkQ5Gl0RpXeryMoZWbevQGLAylcJeNM3jVGNEpI25QE
 FDtY0b3AJuzKIeACN/I1SZn9YxIwz2YlE4ClvhXvVAQsE7zSKez9r7T/J
 b6YfnPIrkxEELHMfmGVnNdIYEiBpwlh3GVbZgaS+6TXVmWChhErW2o97F Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="303798868"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="303798868"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 08:40:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="508135065"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga007.jf.intel.com with ESMTP; 21 Dec 2021 08:40:19 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 21 Dec 2021 08:40:19 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 21 Dec 2021 08:40:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 21 Dec 2021 08:40:19 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 21 Dec 2021 08:40:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fi3c3gvgLGFFEAdyfOtOXuN9cwM7Ei46k8kaWH1lVujvVAbfFJOyHChdX4vrlzm4l+ruXg+7h30HyQkBMYRKmUEwO4wP7hKDmO2JeWEzTTLuYJqqJL22Bem3q87jEduoCBG8LTW6t9mYeF+QvZ7ZH0gUPJgrltlGgxZSZjETqbI/0KhdZ89YvWNU75iRjX5OqenQZQ6nf3yWC19CzmPBMIHkIPxKl0fOa3+gWXx1faki1F6CSLqjBwOzLXM7oUByl//8UcpEF7k5ZSyanU+d/nRlYV7OLrMgDJsnvKmBhvVfar3yXZqOwiH8G1DtZfxCjHfVrWShLUnqZtQ5R7CENg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41mdKqprZSO62VvSb1DHp2mrdWj8OC/TkWTSVkAVXZA=;
 b=AphKM+xwXnQhp43Y87xKtGqsHQiK32ED31rlz7C/2XU7MwZdlcjmkE95kCmHlsTt6xoWo/nztlM1eJyLqd0Ay/obU4atCo4HCX4H+l98dnIUQGNUesd/g9rq93KhOtyf5iSlmtu2mOL3Ea1+S4FBT2BqbHxVCaFcQF2vyDEp5tfEisAYbxF1U3orBJbURm85pzzoIG7UtzXyueVSk9BxQFDWWGKnk2Qadsa/5bZRUSD+Rb06H1oCMFh7nVX4a4FkO3UOxgsWMZcH9OMxiXpcroTfzv6M3hzMmxweUD/WlGLmadHtLu7nH19JwOfNfmO9NNp0WADBjJN5bBOly3UzHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN9PR11MB5467.namprd11.prod.outlook.com (2603:10b6:408:100::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 16:40:17 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%4]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 16:40:17 +0000
Message-ID: <d390882f-fc85-e292-8cdc-8067a796da4c@intel.com>
Date: Tue, 21 Dec 2021 17:40:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [RFC 06/37] ASoC: Export DAI register and widget ctor and dctor
 functions
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
 <20211208111301.1817725-7-cezary.rojewski@intel.com>
 <YcHZkEGk4bWR3DED@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <YcHZkEGk4bWR3DED@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0005.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::28) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2df7c967-3ca0-4c72-c3a3-08d9c4a091fb
X-MS-TrafficTypeDiagnostic: BN9PR11MB5467:EE_
X-Microsoft-Antispam-PRVS: <BN9PR11MB54674E9C15A6225356183BCFE37C9@BN9PR11MB5467.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sOSYD3RYIFxp7Jjv+V8btAukN8ELsqjBiZXjkd288gYbgNHk+N5xz9dtrDBssKX+v7UgBg+YWR38W+APPPu/flj9RyVs6neJJn5M9Fr/XPjvNwtRVftT8/KZ6iwxf4EVr8K2wq8a23gK4zF4ro3wllO76znCSBPmZ1mAICasPcviMIyK+M7pdFj0C1zu1evzxqiMQyBizHvuXIIvXeQLMst5TxntUJodOEyMjcxiDNmrqrpORYsSCvHQJzs5Dw09k0jXnWKTy1jcJURmeOlG48z201sEnlqWcKl837nWMyI6UmfW/DL6hSs46QEP76eTP2Zq0Rl4XWAop8zwaD5w3Cs0jMcwOwFEhE1jMrNJnkG7DmfaP6kT6AbH1oystLgXwnvUztPQ/xR8YUNwugAb7c6KcIA8ehBy937MzavsUVCOpCRNnrM6h9G4PmK+LKzybrNOAPZz+tGZBLXhjhFeV7ViAi1B+rGvSbfgZ3zhC8Ek+NvO/w11pTNS3sZHrT/9mA1QUx6o8qRQ084JLKelZ7o8MAlyXt2B78SJZ8u9Q9rjQW330+MfKHYP78dejWZPLHMpinPiW1bEBX6NOdkoozCwarM4jD2rRo5auIloakUmtmoX5p0z77zlURzim2TafrQd5cR/bf/ll98WgDydK5Vii0Sg9XnAS321iLxhvyFg5bIABPbk8xmLPvApVkQ7qj3WziOQlN3f+/G8GsvACWjEUfwlni1+orkHGyi7ADM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4001150100001)(316002)(5660300002)(6506007)(53546011)(31686004)(66946007)(6666004)(66476007)(6486002)(4326008)(31696002)(44832011)(6916009)(38100700002)(66556008)(26005)(6512007)(4744005)(7416002)(8676002)(86362001)(186003)(2616005)(508600001)(82960400001)(8936002)(2906002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1o5Z3IyTFBwbnVoazd5ZEtQMDFrSG80RXR6VDdyQmxaSmM3SVdIOXBtcCtp?=
 =?utf-8?B?UURkS25tZk8ydmxMYmFnM3BCejlKRURVcE9IWkhQMEdjMmxQK2pBRWhJZVBp?=
 =?utf-8?B?eU0za0RkVlJtbzRnZ3JNRHRJUkRNUDJSWk5aemJCZFJVbm5YMFlUQTVOQzg0?=
 =?utf-8?B?ZW14Z0kxQkkzQmdCNXJMVWR2ZU9ZM1ZFUWZOaWtCaWdFd2sxdi9QSFBwbmZD?=
 =?utf-8?B?b1VSZ3JkeGZhUWM1TTZjV1pwVWdLTG1DSDFISzVXMXVHNFlwN1pYY3NtYXVY?=
 =?utf-8?B?R0Fydm5iaU1ZWFdGQ3MrTlhxOW5pNjJUTE9lNXRyUDZxLzd1VUVmUkVKNGw0?=
 =?utf-8?B?S0g0NUVhZUhIN3pxWVBGS1UrR2FBN0NFK3lTRmFQSERnSlpFcWk3cmFzQ3dk?=
 =?utf-8?B?VDJmZk9RRjNBakFMMDErSTNIWWNUQkhXS3lPMnVMRGtJTUFkTEluVVZWNGNy?=
 =?utf-8?B?WGFvRUpocE1WT2ZNOVVIVk9CazFvdlh2Tm5UTzlvSDZIRmY1VmtFSlhmWGx0?=
 =?utf-8?B?cUZaNlZETEM2c2ZMaXdkdG5zU1BPT0VFeWRmYU5xa1lHSGZhb0lGa21mZDBs?=
 =?utf-8?B?Rmc3MXRhRW5SYjJ4VlNSdDlHSjFKeXFCNHNCY1IyTnVPcmluMXNpQUhFdnIy?=
 =?utf-8?B?RmRENnJVNDVHRlVoUkJISFFWK1ZteGRlRnFxc0pQZGc4OUhnczJ6SVZYcCsx?=
 =?utf-8?B?QlRhYTQ1WGpQRC90bVlZWjhNMHFUalYvY05oZVZ6OTM4aHBScDdJblg3RGFU?=
 =?utf-8?B?TkQ5N3VZY3J4SzhJQ25YYk1tUGJIckY5UWx1MDZTT1BjVklRU2tTeE5wUU4w?=
 =?utf-8?B?NStnM3REQlM3eldrTFFtN0lKUGNuR1hVQWVTOG9lUVF2Sno2U2dKa2tVVktt?=
 =?utf-8?B?cGhnRkp1dzZreU1oNm91YXFuTlBETlowZFhobXliSWNLYmwrOWRCYk81dkhI?=
 =?utf-8?B?REloYk1wcG1TVWNoVWRESUZoK0dTVWtMQlR5TnBUeTB5WWQ5aE95eUpVckFM?=
 =?utf-8?B?RFNhZ0NMUEhkdklwRWthc0Z4THNRTGVDVXpLNTRRSjA3UWhtNkF5UGVNWVJi?=
 =?utf-8?B?KzBkcXA2WWlXOHo0T3F0Qy9GY3h1OHdUS0ZaYWYzVkJsYUdBcno3czlHYW1p?=
 =?utf-8?B?OElFSWdUVHBNMVZOWDJjK3YrMGFFYlZNSTNhd01LU2lEQURSSVR6c2tteWIv?=
 =?utf-8?B?eUY2VjliTm9Qc0FIS2Z6WWlTQ05XOWhKem43TzNwU0xhTTFISVA1TnI0Mkhv?=
 =?utf-8?B?bFhhR084TjNDNUhUamdNakE5bVVJMTY5TnNRTTdFd0pzZUI5ZjF6QUFpMWJV?=
 =?utf-8?B?dDRZOVBDc095VzBreVk3VVpFWG1GNGNCVm9BZll3QnphbGt1UXljbUd5YTJ4?=
 =?utf-8?B?THpiSytwNk5lUVNCN2E3M3diVlRnZFhuSjF6SVRuZjFMZklpZ1A4UnRtNnVN?=
 =?utf-8?B?K3FqcGJ3enBmc3dZalhjcmpZbWZlQWJnOVhGMGNBZzZxeml6VHFVTWxpVmcv?=
 =?utf-8?B?eHVnZ0xjSlR0YkhhM240c2pqVU1PUTgvR3dGeEJaTU0zZVBzNFBWaEFxdWtJ?=
 =?utf-8?B?ajRLNEFOZ3BMTUN1bUNING5uUnovaXIrMVV2MjJlaUk3a2hSSXlDSXdhbDVj?=
 =?utf-8?B?elJzNWN2a1Y1Wm91R0R1NXRDR2RTWmhrbERydmM5dDNsa2VLNEgraGNxdFhR?=
 =?utf-8?B?VlQwSnBISlJXMERWT0hCaXdoOGF0dzlpRDVZM0dIbTdNcjlKVXNFR2dIeHYy?=
 =?utf-8?B?bkJNT1JrRUZLZFYvSFFKLzdOdEgyWktFTnpZNC9tVW4yY0xsbWI2RGRyYWg3?=
 =?utf-8?B?aUNwOFNld201dE10WGJLMVN4d3h2RjF6NlNVU0tUbmpvclJoam8yRzdjcWRu?=
 =?utf-8?B?Y1l5eEkrNW9QdGZxSGVzeWtlTnV3aEZubmxISFI2aVlDOUo5bjZ2UHpNMGNs?=
 =?utf-8?B?LzJNbDkwTmJERW1adGkzazNlUkUzVDdVc0hVMzAzNis0bXhDc2hSV1Y1R1dF?=
 =?utf-8?B?eG4vM3JieXhDZjZUS1gxUHZQd3cyMlhPbi9hVUVDNGg5OXlkc29SYXBOZTVn?=
 =?utf-8?B?NklQcVJaeGxkWmJOZk5PK3kyTlpldWpaeGlkVTBUSDNFUWw1SWFzTHk3dFY4?=
 =?utf-8?B?ZHFhY2JzMlEyZmRiS3R0b3FoRE5jOUtqZXlPZzZZN0ZCZytybUhOZEN1RlNP?=
 =?utf-8?B?T3FvYi9VbjZZdWNlbEFaRllBVjdjQmZyZ2Q0NUkxOUw4eXBVRURFdS9DUzhX?=
 =?utf-8?B?TWlqbGRWSm5kWGlSWUxiRU12c2tnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df7c967-3ca0-4c72-c3a3-08d9c4a091fb
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 16:40:17.5611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JVzRjlSrTHy3GRCAisTGcW4yxNktlrwlPBMd4dL9uySUR34Km8zGPCzL7ePBdP7QURULaZ0L3iGEGh7H8ef4nlow3pWYIuq4TghY5jJirg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5467
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

On 2021-12-21 2:41 PM, Mark Brown wrote:
> On Wed, Dec 08, 2021 at 12:12:30PM +0100, Cezary Rojewski wrote:
> 
>>   	dev_dbg(dev, "ASoC: Registered DAI '%s'\n", dai->name);
>>   	return dai;
>>   }
>> +EXPORT_SYMBOL(snd_soc_register_dai);
> 
> EXPORT_SYMBOL?

I'm going to assume you're questioning the usage of EXPORT_SYMBOL here 
i.e. why isn't EXPORT_SYMBOL_GPL used instead?

Ack, it should be EXPORT_SYMBOL_GPL as it is the case for all other 
functions exported in soc-core.c.


Regards,
Czarek
