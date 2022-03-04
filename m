Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F6C4CDA35
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 18:23:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 893711F1B;
	Fri,  4 Mar 2022 18:22:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 893711F1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646414582;
	bh=fkJZlYXTplZ9XU1BAeWgll2mLBXpCGeWL+mUODUM4yw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O0wjXgjuacGc3DtJGKuF0+Pakq6TCUfjoKbnSf/6GoWnJedhfhMZHqqujuNkja2Le
	 Xyg3WMscx0oya8hE6OMSsS8YYzJoxmo+AsiI2Z38bBW84tc6Fj99VdiXGLUOG7FvOY
	 0LxjjF9fScvjhzjhCMRZF0JPmA6Kgb/aZ8+vWnbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00486F800F0;
	Fri,  4 Mar 2022 18:21:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABF53F801EC; Fri,  4 Mar 2022 18:21:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D598FF800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 18:21:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D598FF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hNz2RCzO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646414507; x=1677950507;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fkJZlYXTplZ9XU1BAeWgll2mLBXpCGeWL+mUODUM4yw=;
 b=hNz2RCzO7iMsnDW2rcj9OReJlrKsznIlXXVtM1B/AqXK+9ngD5LqCiut
 pu2Q3ibyI22AsyRx8z/mgQ8rTZuHO0yYf8a+Rr8jniVjrmtT1HkNGUAq4
 r/7CeZ2xfdmYt3iKyjHAjbRMoWvXmMsRbW1WnMUT5KeyjvZaCQgRSYQ1c
 mfiZ6DEjm3iDVVfcVZgBA5bcW8j/FnlQbSb5peK3Y+zBKoRs8jhX4vqNu
 Whw20Q+lzbuXbqMG998115mBlBR90UhEe5JtajA9ooKa7pGjeEXeYx7kj
 REXzooRc7KvcJi72n/PXVZdqXcgBIS6AuercneWtXU6YQF2pbg8Pw9R+X A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="278712728"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="278712728"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:21:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="610007101"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP; 04 Mar 2022 09:21:40 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 09:21:40 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 09:21:40 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 4 Mar 2022 09:21:40 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 4 Mar 2022 09:21:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFVad2CKvsPgEcZyY3vkfsdcEyxzsHv2C7Iu2Ko8xAzJ0nlcW9E8Z23bzQKn+XbRl0AoWju2EByZlrt9xHMrSgoLKa4RdpxZvVL2iCtKuVXaj2KrYZa/q0ZyFLWfU+0jtNPHVUyW4aaCKSBmF8OWt/OSCUA7NCNlu3b4MJHBH814QG69JvHwHddlNhfazTiDk35nH6nBizar7LsK+SVKDXBW9tbb+3qx0VzjEpVAiJ5fzztRMGD6GNpNhG6tD966QNKdHPib4tfWTauJ6D7d39HkJHEJOszwZkv8BBTIpXoAzbkT2C93S3DKmMfSZ1IIhi4uX7ERCnsmGiy0UvJMBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAITCJUS7GqmvH4KmZHBKT+m0E30+3NSXtA/Mbb4mmU=;
 b=UKEZoVOcwTVnEAB8EFNCfdnGEcqZO+2wJ1KYIr4QNBVUuGDYhY6X4rPCnkP7Hr07osfwJy5j4Xc65j7A5zikwNmGLELgrdzMtM8c3CQ6p/v86DBGYyQt6chKkRg3l6hj+la/L3xxfPeEP+P4fmDlO1YuI+55stRrIRlNTTdwHvb45SKxsvA3vbttnbiD4SY/ySX2xbbJbGhSRh8mimsEwNotcTOzh6upXE2Cc2gfCM7ZlfCBjUGEg7d47PQdjAJSMBPb7ike8dJE85G3Ni9JxZjv6B/h4R/U4vmsr1VClAir4cyls55taKXXSfcpb4JS1OdsNn8oBfJPx0Pa6/eYcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM6PR11MB2731.namprd11.prod.outlook.com
 (2603:10b6:5:c3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 4 Mar
 2022 17:21:37 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.028; Fri, 4 Mar 2022
 17:21:36 +0000
Message-ID: <e463df51-a0a5-b863-0cd6-80b1d60dc09b@intel.com>
Date: Fri, 4 Mar 2022 18:21:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH v3 07/17] ASoC: Intel: avs: Add module management requests
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-8-cezary.rojewski@intel.com>
 <0e7e51e94157c6ca43957b27a13fd4cf058bfc33.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <0e7e51e94157c6ca43957b27a13fd4cf058bfc33.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0201CA0002.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::12) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f88531ee-a503-4a3d-b2de-08d9fe036fca
X-MS-TrafficTypeDiagnostic: DM6PR11MB2731:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB2731099B3AFAAF234E210568E3059@DM6PR11MB2731.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zw9anxLp+d+ZB1IdM35YsypzeQcIYEyxGaJmEVrPBXmlQlKkNiokKD1gl+xwoD0crcBBAsffJQsOKBYSGpk9ovdW/8SqnmeUlfPBRaGWP91ZowD98rLsb4ZcXAKTwm59Udw6WUy6stfzHvQQEEuQIpkKqKoTxUICStgL/otkkY9LPE9AW9Paz8DiezsF2aYf4LMZ/ODBz7vs7urkNHo+2Zs7TxxWzlFJDF/hBuuFEqZ7Y+THXqWtNgmLVuwu11O410Q+QXxl7Cd3IFPNOe8hiBWNWAQPGo79AB9twJJfA66Wq3xSxCwtn7KDyTKFa4UqoDcgyDoy4JGMvaY/T/SoWdZD+2FeHmbjGa9BN9+dr+7ZtOiSZCjq4SOE9Rn7/tCyRJ04lxV8owgrWjeGgbpNwfT4XcbHlJ0y7bwAdAnw8ZyjQSz9o0TAvQbs8FaQ6h7o2sLb5rvFxEf2k1QURWEeJ3pzgslNRGXdk2qCbqsGGpdTvG0VK1rk05LsD3C5Y05kMpANmZR63D9PpmuchXnI0tx07noNwPahbExhP/PlN+NUnVdRlkE/urFVPAJIKC7tZCY+POGaCH5jbuWfvmv7O0Dlt12Lq9Ea5G9ptQEhRoPAMA/cLa6LTzNipxWbr+jVXHr99S2z0HrfFyMgXqGI5cOa06Wk7RkKFkALU9FsE+nSerV/qL0Qv3Kn9rzQ+SbNSPjXvgfOg44+ov2qdYLn6ztkIzAVPihxRo1+a226Lpt5CbsqkRyDk1UOTteR27pB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(66556008)(8676002)(2906002)(4326008)(508600001)(66476007)(36756003)(26005)(186003)(83380400001)(2616005)(6486002)(31696002)(66946007)(8936002)(7416002)(53546011)(44832011)(6666004)(6512007)(6506007)(86362001)(5660300002)(316002)(82960400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sy84NnB2S1RzY3h5bkVrQXNqSDN0WnFVN2U4bStRTFBBUTJ5ak9MT1Q4TnUv?=
 =?utf-8?B?Y3BMY0o0QTNHS2xucEFqWURyeURhV29rNi9hYyt6b2ZCN2tQMG5qTFhKemxx?=
 =?utf-8?B?V0YyQ3dGSHhnOXdYMXFZN1BTbVhTWlNaUmI2SHBrclhBcFJnZUpMVzJZT0lY?=
 =?utf-8?B?bFZJSGNUaEd0WFBXVEVSTUdpa2ZmQU5qbWU0V0NWR25ZQ2dRNUUwQm1RWGZh?=
 =?utf-8?B?dFE0MkVudEVPampRem5IaVI3anRiTm9rYzN5ZnREVTkzcjE0b21YZUdZSUN2?=
 =?utf-8?B?M2hYSmY3UVZsZ1IvT3ZYZWgxYXdVRzJ6emxRajcrUEdKeXFjQm1rSVRLMHZM?=
 =?utf-8?B?bTNSN0YrUDNkM0xrYUROaERsT051V2NOUkNoQitabDl3bmU0cWl2K0FpNUph?=
 =?utf-8?B?WHkvMVd5K0ljQVE2aXZRaUNJcDZrVThCWXFzb3orUWZBQjZieDFiT3JNMjJs?=
 =?utf-8?B?WWUrejcycGtTKy9ycjRhK1hLa2s2RUdQZGR3NHpVekZncUVaQzF2MFo0Ukth?=
 =?utf-8?B?QVE4VUpQS0YxMG1OYzhQMHFnQkxuV21oWU5wT2l4eGNpRC9vbjhrWm56dFF1?=
 =?utf-8?B?RWQ2NGJsci9GS2NDZFhyQUcwbmxaeGIwMFkzeGl1Nk1hM1JNeFFNckpEWmNt?=
 =?utf-8?B?L01aaTA4NjZnazhqY3U3N2VpUytKZDJOajJtOXpoaHFFKzBKSEJEcWlmcGtz?=
 =?utf-8?B?RHdRVTlmV0k1NVNsWWhtUzF3cjhQc2NPbzM0N2hwWTFkSFhqVGg5a2g0WkpU?=
 =?utf-8?B?OS9Fd3Z6WGxuSjF1ODBtbC9aRGtCdEpkbjQrNXVMRDBJTHd2NUovbWY4SDJK?=
 =?utf-8?B?ZEJrRktmclhJQ28rZXErL2kydDVRWk5QWGxKWHl1S3BTc1BuR1M5aHh5VVRW?=
 =?utf-8?B?SXFrQUQ0UFhKSStjMHI0NTZHdUFMbTV5b0lPYWdjWlNsa1pxSHA2a2Q2Wkww?=
 =?utf-8?B?NVpIMVBxYzU2REVMb05wNzNsalg5Z1c0ckhFV2UraWdDbEkrcm1zeW8zamZH?=
 =?utf-8?B?Q21WUWZpYUptQ1YxQXk5SzhvZ1hSZ2JibmJzOStQYWxhbmlweXZSVGc3Vmxp?=
 =?utf-8?B?ano2VWJhc3htR1MweEpYQkxhOEpvRHBrWnN6Ymg0eWxNeCsvVlBXSGMyMXVp?=
 =?utf-8?B?NjNzdkswcHBDcG5sZG1iMTF6anhhVlNaWHJuYXN2QWp6cGJJU21wUzRyZzhI?=
 =?utf-8?B?TTQxaFRJSC8xcDltT2xxSXhIMVAyQUxXNys2Rzl5OC8yNlI1Q3Q0Q01ZSEJn?=
 =?utf-8?B?akhFc1lwS3pjSksrVGpkVGs5SDJKQ0lDZHdmYXU2UzVIYlphQ3k4V1JSQXdB?=
 =?utf-8?B?MWcxcTcyNXA5U2o0cGhMeUdIR1BlSzBqYWc1R0twTGcyTnZEUHliOFhOUWxy?=
 =?utf-8?B?RjR2cm1SajZrd3VudGpuVndsaFhPKzZmWUZvR2FVcXJUU3pLLzBHUjJuVGcx?=
 =?utf-8?B?N05wQTVPMkJlUUtMVW5Yci84S1FtN1c4dmN0V1h6U2pRWDNYKzNkSW94bDBp?=
 =?utf-8?B?WVdYa0VQVUV2Ump3NEpUSU9Za1lMeWFvWGJOZWZXT05oN3BqcEV1MVpDNmRq?=
 =?utf-8?B?NXRhVklZSFNJaEd4NldsVTBndmtxUytQQys0V2ZNWWhOcGMxWmZVRWpJSjFj?=
 =?utf-8?B?NWFPd1AxcVcwK0IyU1dVdFdEQi8xTTJQQ2FPV293cnpoaGlMcENyZjlsS3Fv?=
 =?utf-8?B?RnlkME9OV1huY2RUSUh4TVJRaGd2L09KWFlGSEFDb1BncG9oNDVvZ1VaY3R1?=
 =?utf-8?B?T0dpblNSSTlaRWVWMUFNcEFDVUovS0ZuREU0N2ZtL1dPR2NKMUxwbzBhMWQy?=
 =?utf-8?B?TUt2T0QzeFloTFRnL3I1ZGNPVDk0dWxoYncyMEVZQldrV0hibzdlM0toV3U0?=
 =?utf-8?B?bnd0eFI2QStWV2pEQkVzNFpCTDhibnROTHN4SkxUa1B1ZnYrcXhwdVliRzNo?=
 =?utf-8?B?TG1JYUVIVlFMSDNlNnhveVRmRGRxR21IaHpYdmg2YnIvWUE4aHA2V0p3Zlpi?=
 =?utf-8?B?azhNYnpFSFIzbitLVEIzQ052YTc0aURvTFFPemp0SWNwTzVUb2xvMVF1SVRy?=
 =?utf-8?B?aktXVURBbkJ4L0pVKzl2eDVXQ0R2WnlNak16NHh1NFZRNklrVW5kZnFCYTcr?=
 =?utf-8?B?eGJRYVV4UE9LUnpHcVVvOC93UTVIMWdEMG9hNnVXeWlBemU5Ri93eGVSU0ti?=
 =?utf-8?B?KzBuWHVkMldLN3d1UU5wbFBQY2J2d3NJVm9UYWtiR1JmOENCVEY4bSt2cTgv?=
 =?utf-8?Q?oyZYYfG+f3pmpB5sYNorihwykvwB2v0gdl9pJhhaj4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f88531ee-a503-4a3d-b2de-08d9fe036fca
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 17:21:36.6203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ud0/wWhiI8qAwhd8MuA5S9ALjskMlnZlVK0FpbUXPWXbmmpvZCISdQaUhlS5Odwepy2ShIjcjIcxPBcX4Y9dvwKscFUJ1DbPSXmrFduzFrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2731
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

On 2022-03-04 5:21 PM, Ranjani Sridharan wrote:
> On Fri, 2022-03-04 at 15:57 +0100, Cezary Rojewski wrote:

...

>> +/*
>> + * avs_ipc_delete_instance - Delete module instance
>> + *
>> + * @adev: Driver context
>> + * @module_id: Module-type id
>> + * @instance_id: Unique module instance id
>> + *
>> + * Argument verification, as well as pipeline state checks are done
>> by the
>> + * firmware.
>> + *
>> + * Note: only standalone modules i.e. without a parent pipeline
>> shall be
>> + * deleted using this IPC message. In all other cases, pipeline
>> owning the
>> + * modules peforms cleanup automatically when it is deleted.
> Can you please provide an example of such stand-alone modules? If they
> aren't part of any pipeline, how do they get scheduled?


Thanks for feedback! Consider dropping the unnecessary bits so it is 
easier to navigate through your responses.

Please note: kernel mailing list is not for explaining SW <-> FW 
communication details. Feel free to contact my colleagues from firmware 
team if in need of any FW-iface details.

That goes for most of the comments found below too.

>> +/*
>> + * avs_ipc_unbind - Unbind two module instances
>> + *
>> + * @adev: Driver context
>> + * @module_id: Source module-type id
>> + * @instance_id: Source module instance id
>> + * @dst_module_id: Sink module-type id
>> + * @dst_instance_id: Sink module instance id
>> + * @dst_queue: Sink module pin to unbind @src_queue from
>> + * @src_queue: Source module pin to unbind @dst_queue from
>> + */
> Are there any rules for unbinding? For example if you have 2 modules
> connected to a mixer? Can you unbind the module belonging to the host
> pipeline that is getting stopped while the mixer is still active?


Here we have just a delegate. All the rules are defined and enforced by 
the firmware.

>> +int avs_ipc_unbind(struct avs_dev *adev, u16 module_id, u8
>> instance_id,
>> +		   u16 dst_module_id, u8 dst_instance_id,
>> +		   u8 dst_queue, u8 src_queue)
>> +{
>> +	union avs_module_msg msg = AVS_MODULE_REQUEST(UNBIND);
>> +	struct avs_ipc_msg request = {{0}};
>> +	int ret;
>> +
>> +	msg.module_id = module_id;
>> +	msg.instance_id = instance_id;
>> +	msg.ext.bind_unbind.dst_module_id = dst_module_id;
>> +	msg.ext.bind_unbind.dst_instance_id = dst_instance_id;
>> +	msg.ext.bind_unbind.dst_queue = dst_queue;
>> +	msg.ext.bind_unbind.src_queue = src_queue;
>> +	request.header = msg.val;
>> +
>> +	ret = avs_dsp_send_msg(adev, &request, NULL);
>> +	if (ret)
>> +		avs_ipc_err(adev, &request, "unbind modules", ret);
>> +
>> +	return ret;
>> +}

...

>> +int avs_ipc_get_large_config(struct avs_dev *adev, u16 module_id, u8
>> instance_id,
>> +			     u8 param_id, u8 *request_data, size_t
>> request_size,
>> +			     u8 **reply_data, size_t *reply_size)
>> +{
>> +	union avs_module_msg msg =
>> AVS_MODULE_REQUEST(LARGE_CONFIG_GET);
>> +	struct avs_ipc_msg request;
>> +	struct avs_ipc_msg reply = {{0}};
>> +	size_t size;
>> +	void *buf;
>> +	int ret;
>> +
>> +	reply.data = kzalloc(AVS_MAILBOX_SIZE, GFP_KERNEL);
>> +	if (!reply.data)
>> +		return -ENOMEM;
>> +
>> +	msg.module_id = module_id;
>> +	msg.instance_id = instance_id;
>> +	msg.ext.large_config.data_off_size = request_size;
>> +	msg.ext.large_config.large_param_id = param_id;
>> +	/* final_block is always 0 on request. Updated by fw on reply.
>> */
>> +	msg.ext.large_config.final_block = 0;
>> +	msg.ext.large_config.init_block = 1;
>> +
>> +	request.header = msg.val;
>> +	request.data = request_data;
>> +	request.size = request_size;
>> +	reply.size = AVS_MAILBOX_SIZE;
>> +
>> +	ret = avs_dsp_send_msg(adev, &request, &reply);
>> +	if (ret) {
>> +		avs_ipc_err(adev, &request, "large config get", ret);
>> +		kfree(reply.data);
>> +		return ret;
>> +	}
> How come you dont have a loop here? What if the rec'd data size if
> larger than the max size of IP payload?


That's not how LARGE_CONFIG_GET message works. There is no looping 
involved or expected by the firmware and so we don't have it here.


Regards,
Czarek
