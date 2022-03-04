Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B454CDC7F
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 19:30:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 934901F6B;
	Fri,  4 Mar 2022 19:29:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 934901F6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646418632;
	bh=a8tssKVNILZGlzbvxuWr4WvjzPzou3F1dMozORqktUM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lzK8aprA0RZSw+MwNfKXlqxmNypOQkJf8zmmWdD6kjWNQkbwdi1ZJNL7OTRn3ZPqo
	 SHes89Ye6ZGng4POCqerWgXPCaiPyiBbbU27nwtQF9GtBCFcN95b54RJDwYFgBabso
	 zfWEMF3/+9GifCUEFJe7DI/l4ycCj1SxSg/wXpdI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02E05F801F5;
	Fri,  4 Mar 2022 19:29:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE641F801EC; Fri,  4 Mar 2022 19:29:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44926F800FA
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 19:29:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44926F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RwCdoyJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646418559; x=1677954559;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a8tssKVNILZGlzbvxuWr4WvjzPzou3F1dMozORqktUM=;
 b=RwCdoyJ7b2xaAMRlNrGDHprqKKFGgCCpYN/cyXoY40WB0L7Opei+WYG9
 XEPRDqzmIwzoJfystCHGRSOVqdCAqolzxT1t83HkxWsOHUSDeb1YKZErr
 Lioo66zH0VQ+FuIDl6GkZv0GJJJEHAHnaYAGu3En33da94d2Ec9vjI/zu
 X5AyhCNTQyL/akukaiW/ugRmM05io84PP1BbF7Fagl8mAKbnggJgXF1fO
 YlYoMlJFKh+Y87ozPfXER4XWhWDi2JJ6pMvwR2tLhHQBdp6foo+5mOs16
 C+m85CLed//Ghw5+rGfhY06mcnL+7vdtglEWtIwu6V3AyZUm7IIogzURy w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="254228489"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="254228489"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 10:29:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="710419117"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga005.jf.intel.com with ESMTP; 04 Mar 2022 10:29:15 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 10:29:14 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 10:29:14 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 4 Mar 2022 10:29:14 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 4 Mar 2022 10:29:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JELGrJHFE8Ft88aXZvsd9xEvJKSS8QVe6z+ZlUYhaqzWAwBxAsJeFDce+/deCacPfOfOib4WBQvCkvs4yNje5+Uozbt1svQyPHPeEzTXQJEsZbkW2JC66DfMumheM0oVevqWyHIcnr+nufaqLytmZid9IVc6nC0IniMZosVuVrzNOt5UEE/IhDl5kY5p440RHn/uc9iVyki6ErenkBTz9Y1pOPClnQD5dlpFiE6NCrhfYwY9q5i7KH9DIgulgVJQYtJedPn4faw1pfU0mjaDQhCuh1fTtikubZYbCO4AlmYFmBfpHacsP43yp/dNzQi+uldjxF2IwWTb03RkdhYJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAj8dI/YXQeGy7KpvhMFOA0pq9pXY8Uoa0oup4bUdGc=;
 b=DOd4lFXLYM6sGZgP5TPdRPdU4dRMewPIgQBiDYEgSraxufiqUchAfBcKUrX4ZJN9klirNW1BVJjvc4xpa/Emhtf202lSLDRG9Rn8mXGy7UgvYjcYd/nSxLN575eqiXQ6IqyfpX1q0ratgvhEQLjeBIgxLUsA3e8+eQG+Ql7uDfEc5wus/VOfUq/u0f1bdBhIFPs5KDQwFfjADG8y4oIDjUSMC6z5OPMyYEuxz42ITMPL8815390i9ho0HfyHDSyigwYj6KSVx+RUm6SeBCyG9ux2czZMlQGCycDDwVCRAqpM330z5AohmrqGjguNXPnhjFUU3gdLWa4B82fmv5CY8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by DM6PR11MB4348.namprd11.prod.outlook.com
 (2603:10b6:5:1db::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 4 Mar
 2022 18:29:10 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.028; Fri, 4 Mar 2022
 18:29:10 +0000
Message-ID: <6e8a0a82-295c-4b0b-cc2b-d7942b6cff79@intel.com>
Date: Fri, 4 Mar 2022 19:29:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH v3 14/17] ASoC: Intel: avs: General code loading flow
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-15-cezary.rojewski@intel.com>
 <0c3e200bd14536534115e2a44fa744a102faa107.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <0c3e200bd14536534115e2a44fa744a102faa107.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0055.eurprd07.prod.outlook.com
 (2603:10a6:203:2::17) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aac041b4-7b4c-4bcc-2257-08d9fe0ce00b
X-MS-TrafficTypeDiagnostic: DM6PR11MB4348:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB43481D9E623849B6927A5EC2E3059@DM6PR11MB4348.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9+le0slgrr7Azqfp2DatpsiI9O7fJYwtQzO6nwqmNAU9Ldlr+XE+vFyrSBOXitxtMskqjqaPnkbDk5yoqyru1qUylCjD1ddoCKJifvVlSv2M2LdE9/ikAT9BhbiKVzgEP2KKBRU6t5s9UgPb47w9A5lovQFe2F9yJhFXuk6yniW1M6VtsfRNs1i0/oDDzsrc1hVLsQ2uiMevsN/0YnvfZpAD2zw0U1VeIv6Ih0InkHROuOW+wlnOSxT1z3VkufEsAv+HOy2EButYMfR0/Svq1Z1QWyb0Yw8aQHE6f1SPWzrLD/gFstSeYknDdEedeTs4flv1P15Il5RsCRzWvXTFe0XKVQlZwBYWq5+8w+Ht5EEeDPIRn0Z3IGwN1K0c0c/Kw7FNYoQ1s7ckrTu2rs2TlpERjJWzuDZWmNFKMXM6PekXiAgMh62kIbxqzyR/QHmxwqkg4KI6sqblvMKbjqLRQbfxckidDp379Xi7qB6Zg4GBmPYjwO90uIvnZ/yYHJqgGmIKxCcXtxU7kNK0luHr9DOfZm313oawhqmx4NVLXonwEddVQA/mZkYc8cnilV61D/eOGXgkuJKncKXOwAUB6YWHoSpcKnU+oZ2Rjmpj3AzCOWVKPHxMfEgf3d8iGRUynqRbsry8y+5pjAOqKLCGlAUOg8p300iFZEs+1zpJ0avbhstQwZZ+46Ry7O4H4e2Ex0NhUfg4ESlZDMCmhySknQf026HJ3mtHAhLjH4Htwcbhz0Nx2t5nxCKvcUcKVENX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(66476007)(66556008)(8676002)(4326008)(83380400001)(82960400001)(6486002)(53546011)(36756003)(6506007)(508600001)(31686004)(6666004)(316002)(86362001)(6512007)(2906002)(7416002)(8936002)(5660300002)(186003)(26005)(38100700002)(44832011)(31696002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnpDY282cVg3bkNTMnBIcTdGdXA0Ky9yRVhmaVQ2NkFOOWFHNXc3OEpXckpJ?=
 =?utf-8?B?My9PL0xCd3kzenBHWXc2N0hzZW55S096dzczQWdVS1RHSXdYVFRlV3k3dlNL?=
 =?utf-8?B?VnpKUHBTVlZhUmFERGdEVEdNR1ZvQWFZSXFyTVFScmJwZkNuNjVJR0FSeGN6?=
 =?utf-8?B?eit6aDJSNDhMY0pnd3lQYWpLRWhSVnozcG51NTEvc1hxdVFnbFlJRTk4ODAw?=
 =?utf-8?B?dnZOeG96VEtsWWFOWlIvS2MzTVNLQ1dEZENBbHZGUmV2RmZEVi9NSmVlOTRG?=
 =?utf-8?B?WWdNNDV1Z2xIRDhxL0NCNFdyMUhIRHY3dys0V3VZYTdlRXd6aDJpMTFjNjhX?=
 =?utf-8?B?SlI4RU1sWHQ1SmRFZmlydFV2T1ZseXZ3c29KUXZvT1dMeUEvZXFPZGJDL1lj?=
 =?utf-8?B?RHlHbFVtbVNXTlJDODZsVGFhV1VKMmlOWHBkNnRwL1U5aU1mb292aFEzUUtG?=
 =?utf-8?B?aXNIcHNwdzFvbkswMjgvWkMybm5FcmxXcXE3QzRTQm5QSU5mdzdkQVdwRXlB?=
 =?utf-8?B?OS9nZTI4RFRuTytlOW0xSUVON1FJSDZZZWhmK3l4UVI0T1dobUZUaDgxT0tE?=
 =?utf-8?B?SVdRSFFhd1owMUFOUWF4TGNNc3RCR3FVMS9ucGg0MGcrdktXOS9hUmt1ZFZU?=
 =?utf-8?B?cVlIMC95eDREcXNFMEF4ZUozeHE5WmtyK3FPNzBXNkdOODVWZE9PanNBT0Mr?=
 =?utf-8?B?dUtNMk1zSlF2TjE5WkRwVFVaOHBrZ1JxR2JjaWV1Sm0zcEJBYXAxZXZpUnNH?=
 =?utf-8?B?N2k4aFJqL3dQUGtnd3N5Zk1jM2FMOS9XR1NWV3UrdnM2cnRGZzF5TTFpWmp1?=
 =?utf-8?B?MFRBaDVjbS9PZ3phK2tjSHdhNkdDUWk1SGlkRkM3TXlNUUJxeG1ScmFHelJs?=
 =?utf-8?B?OFVkY1hrWE5wU3ZPVXVmTG1hV2dHemhiRXpzUU8yUDI0M2xyM3NGZStWcFdL?=
 =?utf-8?B?UVZhRUxEN1NzKzc0Slp4aVFJc0Yya2tuM3Y4RFdTVk0veGhuRW1VRjErVXBu?=
 =?utf-8?B?Ynp2c1RycUE4Q25aamhxR1lqOERDcTR4a2dKWVV5TjNYU3I0YXZlVWN6bG9G?=
 =?utf-8?B?b1pUMHl6TitLZGxaMHo1Wk5UWEtJRlBWQ0VWVFcrZ2pzQk1DRzM3ZGRCWThE?=
 =?utf-8?B?Yjgrc0U3L0hoZUNLOWIxTGN0R25kbkdyelg3WVp1VFNIQm92RWpkR2UrMmNh?=
 =?utf-8?B?dXRST1B3VXhVOHh1WDV1VHVoWjE5SVd0c202Tkw0UjZpSUQxOFRBRjByUUxG?=
 =?utf-8?B?SXBkOVdDOHlGVHRpNGVRSWFURE1jNkhxV0ExcFVPMVkxR2k5MG80N3hTaGV2?=
 =?utf-8?B?eHkycTEyMkcrWHA1eUxPRUVQZFpFWDdKK0RMUWtYL3FWMy9jazU4V09WNnNP?=
 =?utf-8?B?MW1zbnl2Y1k0bUhmNkNjM3BReVEvdTZDMW9qcFdFSzhiNHc3TUtudW5IWXY4?=
 =?utf-8?B?c2o2SjFlOWJXc0hYTlQ1aXJ5TThTYm94QVpuN3hTa2EyaUdMUVpGaWRxdnlJ?=
 =?utf-8?B?bUs0UWdxVW9KZDdneWlNMzRENXdMQU5MS0ZIRUJCNUpFVzV6b2xpaWtXUnha?=
 =?utf-8?B?Skh1VXY1VC9YUWdCREl6MGFnN2U4Rjlhai9mb3NRaGtvUEVUQmhNcHg2UGNx?=
 =?utf-8?B?Y0s4ejBJZFFRZW1CUWNmUVdhNkYyUWlGTnRvaFRYMHkxb0U0TDVPVkZoSUZE?=
 =?utf-8?B?UXlXV0pPdXRHTHRFRUFWNWNuc1FycFJKaWhtZFYxYy8wNy9lYUFzUFZIblNP?=
 =?utf-8?B?azhsOEhtNFZBUHZZd1E0Rm9rci9WeDNnU1MzUnpaTEVBd3JSbkpZb3IrN3BB?=
 =?utf-8?B?YWpBZFdPYUxFUzJTWVdXNFc4MFdiSGVLWStRajRETnpTVXVOVkxtMytrdnpz?=
 =?utf-8?B?REEzVGhlMHhUMElDelNKZnMvb25OUmFKdE1HWHJrdmo4NXpIaHRFMko1MnNG?=
 =?utf-8?B?RGQ4SlR3MDRRc3RIMW5UOE14TkJJMVhBMlJDcW4ybWhQL0M3Zzh0TU5VR1FX?=
 =?utf-8?B?TmhadEVyeFJ4VFdmY3crVGIyNXRFenVhUHF6Kzhvd2J0eXM4TFdMU2ptcWMy?=
 =?utf-8?B?WDRWVUxHT3JNS0xrR3JsQnVwU3NmcmQ0RWlsQSt6VWVMaURFclBDN2JhakZF?=
 =?utf-8?B?SjA0WVU5WXBOQWJvbXNFaGtSOW1DN080VWJPNmprM1g4ckl6QzBhR2ZGaTNP?=
 =?utf-8?B?cG82elpId2RSZkVLM05nMHVXd3hYd1JsRUhVeU9iakpZZjFQdkxlVituVTQr?=
 =?utf-8?Q?YIlbCED8X15jm3CMMdqV5UgHb175U+lZ46n9kouWuE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aac041b4-7b4c-4bcc-2257-08d9fe0ce00b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 18:29:10.4180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIcmsl0sxDkz9k1XbcagDuReei8UAsgBeLAApIMY6Q64lpMNhtegvy39K6aN7qMZOzia+ZXXUUv/EePr+qvLaoK3GtT7A/QJkKK2+lGNZh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4348
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

On 2022-03-04 5:54 PM, Ranjani Sridharan wrote:
> On Fri, 2022-03-04 at 15:57 +0100, Cezary Rojewski wrote:

...

>> +static int avs_fw_manifest_strip_verify(struct avs_dev *adev, struct
>> firmware *fw,
>> +					const struct avs_fw_version
>> *min)
>> +{
>> +	struct avs_fw_manifest *man;
>> +	int offset, ret;
>> +
>> +	ret = avs_fw_ext_manifest_strip(fw);
>> +	if (ret)
>> +		return ret;
>> +
>> +	offset = avs_fw_manifest_offset(fw);
>> +	if (offset < 0)
>> +		return offset;
>> +
>> +	if (fw->size < offset + sizeof(*man))
>> +		return -EINVAL;
>> +	if (!min)
>> +		return 0;
>> +
>> +	man = (struct avs_fw_manifest *)(fw->data + offset);
>> +	if (man->version.major != min->major ||
>> +	    man->version.minor != min->minor ||
>> +	    man->version.hotfix != min->hotfix ||
>> +	    man->version.build < min->build) {
> Isnt this check a bit too strict? Isnt a check major enough?


Unfortunately not. I share the similar thinking but the build system has 
its history and several things which should not happen, had happened. 
There could be _large_ API changes without any meaningful version 
updates at all. To prevent any unwanted behavior, this check is as 
strict as it can get.

>> +		dev_warn(adev->dev, "bad FW version %d.%d.%d.%d,
>> expected %d.%d.%d.%d or newer\n",
>> +			 man->version.major, man->version.minor,
>> +			 man->version.hotfix, man->version.build,
>> +			 min->major, min->minor, min->hotfix, min-
>>> build);
>> +
>> +		if (!debug_ignore_fw_version)
>> +			return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}

...

>> +int avs_dsp_boot_firmware(struct avs_dev *adev, bool purge)
>> +{
>> +	int ret, i;
>> +
>> +	/* Full boot, clear cached data except for basefw (slot 0). */
> Does this mean IMR restore is only available for base FW and not for
> module libraries? Do I understand this correctly?


Loop below just clears the data. The new snapshot will be received once 
the basefw and libraries get loaded. The execution of library loading is 
not part of this patch anymore as it is dependent on the 
avs-soc-component stuff. To make things easier to review, request was to 
split main series into chucks. I do believe it is easier to read and 
review indeed.

>> +	for (i = 1; i < adev->fw_cfg.max_libs_count; i++)
>> +		memset(adev->lib_names[i], 0, AVS_LIB_NAME_SIZE);
>> +
>> +	avs_hda_clock_gating_enable(adev, false);
>> +	avs_hda_l1sen_enable(adev, false);
>> +
>> +	ret = avs_dsp_load_basefw(adev);
>> +
>> +	avs_hda_l1sen_enable(adev, true);
>> +	avs_hda_clock_gating_enable(adev, true);
>> +
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	/* With all code loaded, refresh module information. */
>> +	ret = avs_module_info_init(adev, true);
> It is not clear if this required only after first boot or after a
> suspend/resume as well.


avs_dsp_boot_firmware() and avs_dsp_first_boot_firmware() (found just 
below this one) are two separate functions. Only the latter has things 
done once. Anything else can happen several times throughout the 
lifetime of the avs-driver.


Regards,
Czarek
