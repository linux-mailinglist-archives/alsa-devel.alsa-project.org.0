Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ED34786B6
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 10:07:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E6E41AF6;
	Fri, 17 Dec 2021 10:06:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E6E41AF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639732065;
	bh=hn4DfE+JuNS97QeyX28SreXfy8Q/2K4lob4acvmdOMM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mv817SWsPvrP7q6+5o7oPYG7mOhVEFNRgWdeRX3piPk19YM0MbBzukUmWSfl0qFSs
	 MnMBKndSaFYfA+xjauxmTquFMqDSWn21Nj7K8kI32U9bgH4uVvuCTJyNPb8qAp4Vbl
	 acMXdgau1gTsE8RS9Gt5Yo5nlaAp3PQYdbq57GEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8F61F80161;
	Fri, 17 Dec 2021 10:06:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E996F8014D; Fri, 17 Dec 2021 10:06:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F170F80143
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 10:06:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F170F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mtS8ARfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639731993; x=1671267993;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hn4DfE+JuNS97QeyX28SreXfy8Q/2K4lob4acvmdOMM=;
 b=mtS8ARfI3FSFrZiYqaU+EU0cE6l88cBzej4PLdG/b1f7BVMkY00VeSO9
 US0MiufQDT/ExuD6yiwwXZFsN8SB4Gh6nuGsv2dNYIOSoy23i0+9SKOXW
 oLYA4sIw1TZpbjV/RgQZxKRvSji1F5T2elHdE9t5iSuUuS9BzX+MpzOnX
 QmTJ2I/T4iQY6BK/7vF5E5xHG32R08Q8t4N1dh/8KTHNStsTL6wCu6NTA
 nUsWEHGoh2utx1nuYKG7tBUa//nghIg2BLLEn8yt2HkId1Og65+swVE+G
 BYglPQneagQKkB7maiuoKBhtWgIU47B1WiiftUBNKrLAEvcAzOICnnL4g A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="220397427"
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="220397427"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2021 01:06:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,213,1635231600"; d="scan'208";a="585526131"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga004.fm.intel.com with ESMTP; 17 Dec 2021 01:06:26 -0800
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 17 Dec 2021 01:06:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Fri, 17 Dec 2021 01:06:26 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 17 Dec 2021 01:06:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUejxiCOmlidHTa6rnKGa/kYim+gMTSXIanllydueay4nONTNBgBNDIiCeSApwd3z8MD3nBwErYYf2hx+DrOKFUuao9OGzXazDEjb+KXkYu/abHJAER1TNR+khMAbjJxrZWwwqf9UR6/zTPX7bDAdnyvwFVhUDfJtP7ch+6XTvpQzCgx8PNkEHsfX6EV0QhYLL0MAwqrJyIihmplny/4/Pq14+2CWVIVdfzANJW/9arUVgm/rhqVuA01EEFE1c+lcRY/hechSl2lVN1xbg8OyoiVXmyyiTu5RvoaxyaJ++KUyCnECggoLsUWxLGT16q3UgSVE77kB6mvDG2GTdljnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zDRQVwEL1mlDOc3bq7S2kUdvpbmHv+QwjDK+WvaaQOM=;
 b=CXyaNpJuIkql/4zRS2D6Im7p9tPdTNH2Mt+tGtqa8xJskRbBpVe8Bin2rpdNLZEf+FOu1DvJWPUsYWbjnQo5hPnBhhZv/mpvxBjH4t4pNZAJBLkpgE0F17xq7Xdd/wTw6Fj9/hjygLC4WBI50VJu+H6Bj3hCwpN56adBCQjRDkrjbuZb9KP4AVxIMui/XUTL3qSqvgiVjXql6ADfpwBkGLA1Z/QcFngZnGk44p4RZvCL75nfBdsc15txckwoRbRGK96F61ekiNiOvqbvtwBx3KdDtS7ZREPyopDVIemdHOp9iShRHAbJ2rBDCIXI4zyZbnt33U63IJxFsHxA0vCodw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN6PR11MB2036.namprd11.prod.outlook.com (2603:10b6:404:4a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Fri, 17 Dec
 2021 09:06:25 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%4]) with mapi id 15.20.4778.018; Fri, 17 Dec 2021
 09:06:25 +0000
Message-ID: <d9fd60e0-a157-bda7-a918-5548918d1552@intel.com>
Date: Fri, 17 Dec 2021 10:06:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: [PATCH 4/5] ASoC: Intel: catpt: Drop SND_SOC_ACPI_INTEL_MATCH
 dependency
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20211216115743.2130622-1-cezary.rojewski@intel.com>
 <20211216115743.2130622-5-cezary.rojewski@intel.com>
 <4a8afa77-217a-9d1a-7704-909ee895c4c7@linux.intel.com>
 <2377ff39-2ee2-c1fe-844b-aa9749f4e026@intel.com>
 <261b8815-6c8e-7e0a-4b34-e7948efb6884@linux.intel.com>
 <9da26018-aad9-76a6-ad93-8941a68c645f@intel.com>
 <124db869-d829-006a-e1dc-0e41d21d5361@linux.intel.com>
 <b4eebba5-a510-a5e5-7939-e8211ee2bc8c@intel.com>
 <687da06e-67e0-c648-7d92-88fc2ed7078f@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <687da06e-67e0-c648-7d92-88fc2ed7078f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0406.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::15) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cf74221-2022-4fbc-6302-08d9c13c8097
X-MS-TrafficTypeDiagnostic: BN6PR11MB2036:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB203662B13525AE392462F171E3789@BN6PR11MB2036.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 97S3RhXSE5tUMkA/p+HZZpZM/JrxOX8NAB+I8nFNUOMXTMVGHIKz5xDdnh0zepwS8xKG5G4DfnF0K0sI4C0umK8QyNAliiYUyIbmdZF1B4ZWWxqKCdoO4xMfMA625riPo4Kc32KGaqhr3CcIq1G51vnbKvWsSgw3QH3ardHu3Gx6TzTm08d7V+PfzFbeN+Cq5wn+sLx4TjobQHRY7yUyUqj98MYXZ7T8o5CgIPHUePswDD7inW1Usnoe+2YpKSEfhe+cACUN/j5PKFxGAnqDzVmCiqPILESaUb3scMQe2yx5fCu2C/fucajVRDE11wRoZrj/NJ4paWkospF0bI8SKV+Ls7+3MGMsvtCgwZ4Q+y/uE75Xz/KyjHv66Hquz8I0dMgR9PCJHoKS/H9nfCWfMHnY0dI28LoG7ER1YM4QiK5QD3aPD8J9hQE+YKPWqczcpnvT6nc+cYOwIDoYKP4LVTSVg/OSbeYtmg097DSnKtAqu0g6aq7X0XEyA4Y86WqKQMGhKd8Pxq0HolNqdXvt7ygVW5y5ED7C+cZLPwMBO+2ESWilHWbnBCuTVFzfYEPR9NDFYA3tSetCK0qRbG0icGGN/vrtlcIgQ2tFc33e2ziu/pVxbvn+KPHqv4+WE9Jh3Zsin/CFRsoOxoAdOvKp4L6/+81QQHiPTiPTm3x6qGE78D24RWaa7z9mA+j/TS41ReVbFQ45+uACesqPrQSMzf7ImUvhtvltGC1wRdMxw88=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(186003)(6506007)(82960400001)(6512007)(44832011)(66556008)(86362001)(66476007)(5660300002)(36756003)(4326008)(31696002)(4001150100001)(2616005)(508600001)(66946007)(8936002)(26005)(6486002)(8676002)(6666004)(31686004)(2906002)(38100700002)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTJnaG5PSGRseHArWXEybjQvZWl4c0VKQjgwMmpoSHRJOVRWZlJZNXQ2cmhy?=
 =?utf-8?B?ZC9vZExpTisxOU1tSnArd2VxeE9FTU0vczlaQm5wZXpsQjc5MHlEQWlRNWdN?=
 =?utf-8?B?aVFZTkp3d3ZlWFJiYmM1eVRHd3VZVFVyU2JnNHRyb05BS3VuNmt1WGRCTmtZ?=
 =?utf-8?B?OXg4UXExaFlUeUg1OEg3d0t4STcxU2xQRmZycjFJRzl1V0F3NGo3U1dSK3FC?=
 =?utf-8?B?dlhpZWNTRUZGVjBMVWhHNllhNjY3WmIwN1FmaWVydU8wV3VXcCtEcFAybmZU?=
 =?utf-8?B?UTRRYitybjcrWWJwSnZMUGxmVUxiaVpuT2JpM0s4bXlHSFNYK3l1QkxiaU5I?=
 =?utf-8?B?MEFpS3puNzlhRUJFTXlEbW5PK3BoZlRBVHdJNDgwU3dCZUZOMnVRUUgwYlJV?=
 =?utf-8?B?MU1UMW5QZnBXUDlJY3RtQ0lpOGJZeXA5aElLTjZBZnFVKzk4dG9yMkVrcC9B?=
 =?utf-8?B?dlhqSFZqT0VYQVZKQUI0STlPd1pJdStORUhQQ3JtSnhLdWhmK0pkZldJRVZZ?=
 =?utf-8?B?eWhIQ3o1YzNwUVJISXhLUmM4UkZyYnQwaThPaWNEOGkxUEUyMnAvOCtwaEVZ?=
 =?utf-8?B?T05kTW1USVVOaWswTmJHK0QzcTV1QitnRnZ3bnM1L0w0ZnUyWmx2T2xKTEli?=
 =?utf-8?B?SFI1UU9hSld1cENBNkJnVDR6WXpXMUtWSUIxMFF1aHFSVTZWMXlPSDBWck5m?=
 =?utf-8?B?dDlHUUVHTVNKV3dEQXdpak56YzQvOExLT1F5WG9JNE9id0tOWFIwWXlNN1dy?=
 =?utf-8?B?bHRFcTBZWk94eEw4aUlZSHFHWVlxTGRkeXIxWk5KN0JqRThRSHBuSmtXUGpX?=
 =?utf-8?B?TkZaWjhaSTNFc0JsT1Q1QWlhSk1BM1JHbHlWQXg0WFMrZjVXZUhKbE9vdXJX?=
 =?utf-8?B?MXlHNHI1dUUzei9CQjUzMlNMdUwyeEJSUjJNRFVUNUpBODZKeXMyckJHNUFp?=
 =?utf-8?B?OVdVdTVPZXNNdUsxcG5BS1c2VE1qWHdtZ3BTU0cxV2tlSVhtQkt1SjJyQmFi?=
 =?utf-8?B?MjlyeXFkTnRSbzhMdkVXYkpLeEhoTWVIWjFZTWs5cGQ5ZFFZdHJaN3JRRlVl?=
 =?utf-8?B?Q0JqTFgzc1N5SVpvUWZsQ25yRVI2UEFvd2I3MEtTM3IzYVllZE1Cb2EwMTNP?=
 =?utf-8?B?ZTJFb1hHQTBJSTErNE05RFppbjhNUlFDYVNsK29IUmJGdTlSaElFQXVVeGg0?=
 =?utf-8?B?UHpPVnFjakVYTGhYR0d3dWlkamNmaEI2a0Vwa3NKQURuSWpDVXpwOUw2UWUz?=
 =?utf-8?B?YlpWZmZxVG9DTldWQVYwNEVlYzE5b3A2L09VZ0x5YzFUa2hIYUFQeGhqeHdz?=
 =?utf-8?B?SUpJZ0laVGhiZjZza0d3RjdMLzFhS0szQzBBb1RiektUY0FWUC96eVJVY3Rm?=
 =?utf-8?B?UzNyRDFOU3pwNGVaYk50NS90S1BGbDAxQUNhcGU3ZU84VFR2elVlb2x4RzZZ?=
 =?utf-8?B?Y3VDbG9JbldlSHp3NVRVQ2YvRG1jaUN6dE4xZGxqVS9nY0RPcTM5R094M1Mw?=
 =?utf-8?B?QlpTS1pabEFsWDVRQUZsaks5M2s3THpZbmtSakI3NFJyVXU1dGc2L01EaUtJ?=
 =?utf-8?B?WHpJR0dQdWxsR25FWTZXaTRrOTlZNjAwYjltR0ZUWndId016bTFmaW1CZEhw?=
 =?utf-8?B?STY1b1Z0aTA5aWdvUXh1bkh6M0MxeklvRVM4cFBjeDRQdDh1VjI1Ui9VcDBV?=
 =?utf-8?B?ZTNPalpwaTBoY05BbDlSYjRSQjlRaXRUZEdrYWRqMDdCYmNJWTJxb1BRc3VH?=
 =?utf-8?B?cnRLN3cxWks5M0ZzYnNLcDV5ekdEQyt0VUkzR3pxU01jVDhIZjNmMkF0SHdY?=
 =?utf-8?B?c24xUUVmZEt2aThDK0RSRHJ5OFVhSjlqc0gvdVkwSm0xRFpyS3ZGajRVbXVV?=
 =?utf-8?B?c2g5L2xDNzlwODdWOGFRb0FUSE9EeFZvV2hDcDNlN3hFT29zQnVKSFJ1LzJu?=
 =?utf-8?B?U3h3Y2x3ZjBQcUt0MXAwdDkzYjNIalREaW1mS094Q29Scmdua3JVQ0I5UkdE?=
 =?utf-8?B?cnpOQjRPMVRIK2ppd1NYTFJmdmFCZ3d2MWdkb2NQYkQ1WDMzME93MWMrVUlz?=
 =?utf-8?B?UFRJNnpiVmVHNjFIU1p3bWRWKzVxcWk4QWlYek4zczZoV1pnZzQrek9zTE9k?=
 =?utf-8?B?ZGlpaWFOQmFsYzh4YVRoSnIwYWI3bGx1OXNSYUNVSGtvMWFiZzZ6UGZDT2JL?=
 =?utf-8?B?NGowekVzbW81UTBLMFF3cnZPK3dVbE1CMFJqNjN0alZ0Rmh1elJwbTlXYXY1?=
 =?utf-8?Q?ABkXvrSto+xtvexIUACTfN2HHcW5p9k4Xihe40+P7s=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf74221-2022-4fbc-6302-08d9c13c8097
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 09:06:25.0928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x/echkOvQN/a21KfLAm9pBCqOmgAC+6Hv6S/v+bdtjJNlg8P7303AqKq2alk3b7NsVNQ/VFv33CwMvb6Hz6xwBA4MrEv/YLFnwjEEE4rAto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2036
X-OriginatorOrg: intel.com
Cc: broonie@kernel.org, tiwai@suse.com
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

On 2021-12-16 7:04 PM, Pierre-Louis Bossart wrote:

...

>> Hmm.. doesn't it really? Are the glk/cnl/cfl/cml/icl/jsl/tgl/ehl/adl
>> tables "common" for the Intel audio drivers? There are not used by
>> anything except for SOF. It seems reasonable to have them present
>> locally too. SOF solution becomes more cohesively organized in such
>> case, just like catpt is after this patch.
> 
> We could also move the boards/ while we're at it, on the grounds they
> are not all used by all drivers.
> 
> My take is that unless a new feature is added that warrants moving the
> tables around, let's keep the existing code as is.
> 

I agree with the relocation of the boards! In general, improving the 
maintainability is worth it, even if it takes a larger number of patches.

Hmm.. avs-driver related boards are kind of an argument in this 
discussion. I can delay patches 4/5 and 5/5 until they're on the list, 
no problem.


Mark,

Should I re-send the series as 3, or is it fine as is and simply last 
two patches could be omitted?


Regards,
Czarek
