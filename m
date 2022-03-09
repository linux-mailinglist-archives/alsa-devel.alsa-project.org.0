Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A204D351E
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 18:08:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85EC61712;
	Wed,  9 Mar 2022 18:07:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85EC61712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646845726;
	bh=7RCkWe6WfjiP/QlyIKnAUd2CzGEOjG16/MhDyzzdMJQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RoRX9p1FmliyIFsDinLmJQhCQUiMnUY4GPN3quq77E8ekBk68Hmx9llR5TdOfMaJf
	 3NcHiiQghP/6XPJoVWlKQrDBPqlnK6RXDygYuYI5sqdoap9dXBKNvOw7l5z2+DMawn
	 ZCgC0Hj9iISudcv/1oTGE5b1TgoL0YRV9hF8BOjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 913BFF804AB;
	Wed,  9 Mar 2022 18:07:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABA31F80236; Wed,  9 Mar 2022 18:07:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 763D6F80236
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 18:07:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 763D6F80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Durpk/4z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646845639; x=1678381639;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7RCkWe6WfjiP/QlyIKnAUd2CzGEOjG16/MhDyzzdMJQ=;
 b=Durpk/4zWtj3iajmlCeDrO6ezaLntO06hxwed6j86GyBU1+DfKc08uyV
 t/lPULnujqUyU328fUCA6CuY+iAuBYPuz1n0dafvT3yeKQ/zQa9YpcVa2
 zXJGXMMhV0/wcpbgL9PTfmdpzp66aWiRxpEjAgFG3Bx86stMYoARoGkRU
 Hw7OSs7xBT0q9C6GjFXL1exWCb8VPjhrN4nz5llBkxQPAAhF721ntUEMu
 GJZfRzQ5qA0GlCHrbUqITFwaiyFD7TFZsrwo3CO4HImFa/GDVOGMAO9GT
 nJuER/9zDBCtLd9VdU2Vq32NBV214I+QWjCLX48pucxj0c9z2IR93CkVa w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="318257407"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="318257407"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 09:01:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="712014082"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga005.jf.intel.com with ESMTP; 09 Mar 2022 09:01:34 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 09:01:34 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 9 Mar 2022 09:01:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Wed, 9 Mar 2022 09:01:33 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Wed, 9 Mar 2022 09:01:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZmY0vc8LzWpiAB03p12zGm7bHvx7X4m0/F9eHcvNkOYPMGvp1+j4s148ihDfcrzUb142QxGjwfZbMyWVCfnqdEVef2IwkpLJW7Xgi+Qxx0nK5lfGIDfdjs+Os0Ihuv1+o3q8PrBxQ8M6CqDDqi1GpmzIB1AyzIQfuieCvF7ybhxmA8iwqZfCT8EgrlkWmgMIXEuYf/mYmh1CGh3GN56AI2myBGW5JQyob1va5/eeXVssjKUsHAAYqsHs1mrZCYV/xMamONb19vK7rGB8xsSXXpL9FuLTo+ddIsRZbpGw+okDNZvy32V3tXBrebLsQwuRpN86MXWUCsbFOlAIKtrCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K97yCV7R7JBwXkrJEmSu2aCIISyxnxcsKdVj86FwTeg=;
 b=fScRuEjMV8uuPbQ2+nYzUOOB/9WWFKZsLNmxlZVrcybxScbu6QEWLqiPQLVhvNM5HJwrRA2t6/dlRFn3PpSdRdBqDojxhoHU7Qx33JElEvAd5/Duzgq6YQyG0voqbUwssJ+WLyDwX6EIdTQnTnmrkVMo8NnHudnQfj74hzw+0u6nLar5lQ5/obIjXNV2jqcb+YQeYeUQ9+L3JOZo/njLs3YgM1PNkDtvWOJMM89oeuwWobvui4ja8xpXRiJDEBMgnLT/BIJX+jS1vudkW3Anx7EVzSAru/nfLVhTSnDCP/vhmpndlDP9pxi+aIVDQwU8TkMG73hPR/uEWqxpjIVixA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SA0PR11MB4544.namprd11.prod.outlook.com
 (2603:10b6:806:92::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Wed, 9 Mar
 2022 17:01:32 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 17:01:32 +0000
Message-ID: <e12a2a8d-7f96-5055-1168-2ced05d00751@intel.com>
Date: Wed, 9 Mar 2022 18:01:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.2
Subject: Re: [PATCH 04/20] ALSA: intel-nhlt: add helper to detect SSP link mask
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
 <20220308192610.392950-5-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220308192610.392950-5-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB6P18901CA0014.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:4:16::24) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8be5290d-de03-4890-cb64-08da01ee75d2
X-MS-TrafficTypeDiagnostic: SA0PR11MB4544:EE_
X-Microsoft-Antispam-PRVS: <SA0PR11MB454479B9CE6372B3E6F75485E30A9@SA0PR11MB4544.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w2O1UFayI21Mqh7wkCGXVnVuX84cIbsFc9sn4YVghHPBIp04X/pMfN+Pbf6TeRK5xQGkJ8ncfS86yRYSWaMmE1ye9iQZGHbX3+Exs6kD9lhTsO5t6IQ3PuEdm0aAsU7u0+hKp2dGj+DM3wlj0v9Btf1owYNZhrzaS+jH8ceq8AgUc6u3W/A9L2r8KpwUnAWi9gMplU1NG35vsX4vVPc6KOwmht/dIWN5zyJb37gsx3ymzzU9yoOMoBpXSCwXEChoolk2QOIyOlj5fYAYJ1E4UwRHOwt9Hmlh8RN8coR04TTs5SJdEFOj78TH/Nvw68mcQS51/8xYA9MORI9c3cft42LA22iFcjQwh3/ikd31w/pgTNX/R97JQ62oKac/u2EznLGgGh+JCwaH9iZ42adIHkfMuTccz1CADxb5Eb7gafOcQyqdeNJIkJxd0sFey1oSsbbdmahF1TCjTyqZ8feHgJMPOs5sWXztkGovy8cWXxEdPv5egQ8fPNjA3MamafVE4Llqh5oPG6VwunRpnQme5HIi3FMYIdlaeIY2WC4/cRB1iGpkY9cXidHm3aWoCB688KQFOPXZrCmaqdmFtgfVG2zsTsiqwGsPzHJy84PzhNLMBDcpBuykrC1/Bpi+LrGCqXeTmCPKn++/hU0LBxrs/9dc4ajUr+ZIdRyx3Lcsa+qt+8VsuxUuM0oq9TE6qDHB6FgTPeGxALNaGViH1xq9QeNf6oRouqdTUMfhO29J+FG5s+dkfh25HxjOULlDexep
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(6486002)(31696002)(508600001)(53546011)(66556008)(66476007)(8676002)(66946007)(54906003)(4326008)(5660300002)(316002)(36756003)(44832011)(8936002)(2616005)(186003)(82960400001)(86362001)(6512007)(26005)(31686004)(6506007)(6666004)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjlJU3lrem92cnFIUW9yc1ZDbmNSN09ULzFyZFpPd0VYaGNCcFJyTXBEdU1n?=
 =?utf-8?B?ZTJ5dUh1Q21UQWVMbkxjY21QWklJMEpNT1BidzdqTmtGZnFSclp2cmRVb1Fx?=
 =?utf-8?B?djVuVkVHLy9Oc0UyRHFDMVdkemoyaWU0SmZ6bkxJUzljaVFnZm4rM1lZZ2k5?=
 =?utf-8?B?elJVMTR5MnJUa1Q1R1BPc3dJdFVGSGdhT3RNVHFGQ2pCd1ovcGJyNWJBVVIy?=
 =?utf-8?B?ZCtBZm52T3ZqQ0ZWbW1CdHdtR2Z5d1g0MGtDaDlzWk9WMkVPQWZ6Vzh4bWlm?=
 =?utf-8?B?WEQ5WFYvZXB0NmJaREU1cmpUM3RQdUY4U0I3VmJPc2Q1RXhzNm5LY0VyejB0?=
 =?utf-8?B?dXJNMDE2SEw2UFNiaHlkZGVqb2ZOaHJiVHpVZkVsdFhnSW1xbjc4Uy95VTlK?=
 =?utf-8?B?VHJISGdsOWZ0OXg3TWN3SVJzRnBaV0l4NHI5ZFhWNmRDRk9MdzAzZGZXM1hh?=
 =?utf-8?B?ektiMjBnV0pESEFpY2s0MHkrQ0R5Q0M5cHVmcjlGTXVFMGlCTythZWt1SjBv?=
 =?utf-8?B?d2NEcTRtTnFCZEp4TWR6UDZEZWxsTDk2d1Y4QUtWNkQyK3U1NEN4Y1ljaHhD?=
 =?utf-8?B?NlQzaFU0UGZXNTZXcFk2NWZCdEJxUzRmeDVSU1l1R0FkYUlCZnBHWFIzT3py?=
 =?utf-8?B?Ui96RGM5TlNZSjVIZVdIb2JCaVZnOGNxL0xmZ3hIV3U4MUVLVVNBRUo5VkhG?=
 =?utf-8?B?Z3BrVlRDM0pMR2IxanhWa3Z5UC9jcG1zUUJwWnlSd2t5eVYvWDErR0EvT29a?=
 =?utf-8?B?UVFGcUFiMU5vY0ZHMjJhdStZbFNxWWR6QVU2MXB6MUJwT0FHSklZY3k2R29z?=
 =?utf-8?B?NmFBSzg4NCtXaTRqWlZacWVsKzBZRmd6ZmY5WUxkS29OYXd0MDMrM3FwRzlt?=
 =?utf-8?B?a3FreVo4UEhXTHJmZmFhdFN1UkVUVjVLdkdtdERzdWl0NE4vSWJtREg1VTJx?=
 =?utf-8?B?NkpzVkJacFdMSGNBTjY2MzN4STI4eVpRTWdmOXlCRVc3cVhTelRZSm5nZGkx?=
 =?utf-8?B?SXc5NTZGOHk2U2YxczErSytvT3pxWTNxcTFHdWpLZTNWY3JBUVlpR0M1VXlI?=
 =?utf-8?B?b0UvTGpaRWtnWURVNndwOERFMG4zMWl5dmJXNk9hSy9ZUzNkbC93a1ZZSG1n?=
 =?utf-8?B?MHpMb3QybllOZzYyNXVXaDFqZlJnM3AyTVZ2QllaN1ZoWHlsZW10anhLSnBl?=
 =?utf-8?B?L2Mvck1ITU1COXhMUk0vbEhFK2FGU3NxaUtEZ1FxRHBCa3lhRG1uNThIVklr?=
 =?utf-8?B?SC9oS3dUUjd5UE5NaGsvWlBaaGpjM3ROS2VTOEgwSm5VNFlLbWVwQit5dEZp?=
 =?utf-8?B?NGsyc2IxUXhXeDRROTRxTXBwc3RvTUMrZ3NGVFFjMmFVM0xKTFFsNnRndzV3?=
 =?utf-8?B?T3M2dWRaRU1uTVlhOXU3V09RRStDRUF6QnU3Z2lNV3JYbTRDYkNUWXp3Y2Q4?=
 =?utf-8?B?NlFBWTNueUVQLzlCSlUwZG1ZM2dKQlhXa0piWG9jZ3V4N3gvSEtGMXhBU3Bl?=
 =?utf-8?B?NHF4eS82amhOQlFVY3VQeGpZRHV3VTdJenVHWkNtT2JKV1E0VkoyUjhIeHB4?=
 =?utf-8?B?ZDF3dElrTFpiVzgzUGdrSU4yZnljUGZlUDlyM3ZIME9tYlY5ZGFNaHdOOHlS?=
 =?utf-8?B?TEdXdDFreE40V0E5bllMTXQ0MGlNTjNmK0tyV3h1YnIzK29ZTUltUjExNmF5?=
 =?utf-8?B?MkRFbmVaRVhoemZ2RmlmRUtCKzI5WlVHZENONm1kdXR0V3FJd0xuYkNPSDNO?=
 =?utf-8?B?cTJXYjZhY1kvWjRZbWlPYzlXOUhiZTRJSjFJZlR2bFUycUkwRlk4VGlUTmtI?=
 =?utf-8?B?QnNDei9sN2VXVkphcmU2QnZjQ0cvd0djaGdtU2lDOTdpenNDWEk3ek5lTHFU?=
 =?utf-8?B?dUF6Nm9QczNnQk1WK092WkpWK3dkYWcreE5PcGF2OFRrdGxqenpyWStzYzVx?=
 =?utf-8?B?bEt2WUNteWdtSjZ2bVAwWEo4N01JbjJVMC90eXB4VnhWbkdVbkdMSTFzRHZE?=
 =?utf-8?B?NnBPcUU1aFNZL0p4dDE5ZllkUkFlbXVNT25zRWU3elJUem9aWmhBNy8yYkFV?=
 =?utf-8?B?VTNIbVdCMS9oYlRxRUFIaVowUlhCaGlKWk1BL2E4MWU1eGUyWWN1ZWx1dkFx?=
 =?utf-8?B?Mk1RcVlYVHFBQzBEVzF0ZXAycFN2QzE5NGplZVRGb1NlcVdEZyszeWpJV1ov?=
 =?utf-8?B?WTRGazZGZnJCNVkwRkZOUU1vZGJaZ2dQNTJsUFNrQ0VoTmt6ZlVmdlNjSDVG?=
 =?utf-8?Q?r3C+xyu9/tsOBC96tQm9nJx8MVc2YhQ72YimFyas4s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be5290d-de03-4890-cb64-08da01ee75d2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 17:01:31.9439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +mx9X9ysVDGUbwNTz1NQackWGd4RWJHJd0i1jLpNLoNLbmgCpuO0kO24ZXDF03QrXAnC9lHwzm3a6glDxLL+u4yaoFR0kIOHSE4snKTYLeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4544
X-OriginatorOrg: intel.com
Cc: Huajun Li <huajun.li@intel.com>, tiwai@suse.de,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, broonie@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On 2022-03-08 8:25 PM, Pierre-Louis Bossart wrote:
> The NHLT information can be used to figure out which SSPs are enabled
> in a platform.
> 
> The 'SSP' link type is too broad for machine drivers, since it can
> cover the Bluetooth sideband and the analog audio codec connections,
> so this helper exposes a parameter to filter with the device
> type (DEVICE_I2S refers to analog audio codec in NHLT parlance).
> 
> The helper returns a mask, since more than one SSP may be used for
> analog audio, e.g. the NHLT spec describes the use of SSP0 for
> amplifiers and SSP1 for headset codec. Note that if more than one bit
> is set, it's impossible to determine which SSP is connected to what
> external component. Additional platform-specific information based on
> e.g. DMI quirks would still be required in the machine driver to
> configure the relevant dailinks.

...

> diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
> index 128476aa7c61..4063da378283 100644
> --- a/sound/hda/intel-nhlt.c
> +++ b/sound/hda/intel-nhlt.c
> @@ -130,6 +130,28 @@ bool intel_nhlt_has_endpoint_type(struct nhlt_acpi_table *nhlt, u8 link_type)
>   }
>   EXPORT_SYMBOL(intel_nhlt_has_endpoint_type);
>   
> +int intel_nhlt_ssp_endpoint_mask(struct nhlt_acpi_table *nhlt, u8 device_type)
> +{
> +	struct nhlt_endpoint *epnt;
> +	int ssp_mask = 0;
> +	int i;
> +
> +	if (!nhlt || (device_type != NHLT_DEVICE_BT && device_type != NHLT_DEVICE_I2S))

The '!nhlt' safety is superfluous in my opinion. Kernel core API e.g.: 
device one assumes caller is sane in basically all cases.

> +		return 0;
> +
> +	epnt = (struct nhlt_endpoint *)nhlt->desc;
> +	for (i = 0; i < nhlt->endpoint_count; i++) {
> +		if (epnt->linktype == NHLT_LINK_SSP && epnt->device_type == device_type) {
> +			/* for SSP the virtual bus id is the SSP port */
> +			ssp_mask |= BIT(epnt->virtual_bus_id);
> +		}
> +		epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
> +	}
> +
> +	return ssp_mask;
> +}
> +EXPORT_SYMBOL(intel_nhlt_ssp_endpoint_mask);

Since this is a *public* API - not direct part of any driver, really - 
providing kernel-doc is recommended.


Regards,
Czarek
