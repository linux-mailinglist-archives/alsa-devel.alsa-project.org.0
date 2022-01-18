Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA734922FF
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 10:43:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BB201883;
	Tue, 18 Jan 2022 10:42:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BB201883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642499013;
	bh=AGuq+ffRRehFWpm9aORmXz1gUmPp+CaXfE0oiwyslcc=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K2iNXMVbBnzfFEVZmx1HRls+/Nlv+f+zEpjgkVHTf9TxmlODJj4qTIDT8Zr25I/0u
	 KofGFF7UX/msjinHnw+aL/L/Hfv49Cs2G6GBsuhIuESx6552YqFzl10LxiUabkmtur
	 cqp4A35c5WK6owW8tsY6312SsihcIXnSKAv8F0WM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 927E2F80240;
	Tue, 18 Jan 2022 10:42:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D606F8023B; Tue, 18 Jan 2022 10:42:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D329F800CE
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 10:42:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D329F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Vc8sj2Ck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642498943; x=1674034943;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AGuq+ffRRehFWpm9aORmXz1gUmPp+CaXfE0oiwyslcc=;
 b=Vc8sj2CkL55RMcToWxw4F5biTSmEJS2ob7KYApFz1QSMhqbanXzmqy6d
 L9dl2X5ne0Whv7jFpAh1N3M9fNXvzJ2XTpgLT7i7seZL7QdF3EbFgNMV1
 0GUpLr7DANoMPAcvdtvi62L+6nk7Xs4IUiBABKfalX4SOhJorflYX9luV
 ytSMusPNp+PCaMFstT248PbfdqJn3nhsMxmgnF2yWGHF2BH7P5Vr7BhnX
 tvDGZVy1nqysX5Juf7kGoG4wJ4lk53KK5YSiMrsvHWV/QOnsz8rca+5rF
 HgUp5aBgVfNJqUmI1de7t8/B4NDmFRUUcLcK8k7DIxOW+QnLVBBj1IL9o A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="244573487"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="244573487"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2022 01:42:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; d="scan'208";a="560616858"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 18 Jan 2022 01:42:18 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 18 Jan 2022 01:42:17 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 18 Jan 2022 01:42:17 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 18 Jan 2022 01:42:17 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 18 Jan 2022 01:42:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpPCekF8Iz79tv/AzcN2g6U2Ku+GFOPR7Mv2rnJLquQq+DwZdxxSaNB/cReC0wAFQfUZHeGVur6yIXe7cZ9ysBcakJS0ygB/oSPeSrZ9fKbuEyIvx//bt+42CpN01dLzVrN4yPXDbpPU63JddZ4OrWwfNfMtMDtR37iYfR2nvM+L1s+yNf5j7gWmS2tCvQtZUdAdhABMUpkk/LcFjWS5bXS5OiayUogH90ybak8sRIsdAG6aliswRmHpqXcZvXZnWvtLMrezIKYvWIHPkCnSFs/SL7rRxwUTuFyJcH/1gesV/JYOmzQ3myS7WcLjDN5ouIGRImaFyDeCY97ZaiQSZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlsWhpkO+iODnufTUPWRBfEYdRh9bEW6g/bgn8h32ak=;
 b=W+77G/tqnEtzqCuYgM6/TTeU1O4XSmtU/gyi3VV1ZBTbQOqTZghzuo+xzFzDti+wIKa6s6fXhh3Kv5wjSzT+MaoLioFVWqBqNjRzL86zMbXsfJa8OoUnXY+tTRuIjKLSb0qcnLV8GVQU7gUVgfaivvMbQ5w+VdNU1knFQPYu3Cle2tvuHxWF0mXCazODekggnspZRREkAq11bzHwzLBCazQbk9WY/TWS++WC43tAsV4+zD/jzsxjYFo0l1eh1g7gZkrq7h8G3c0feVmG53zhuKJQfpw3DtdNtfQi/AOogKEB31wbQYi2lAHaxbxUjiyDF15m7HvKDB96Yn7n5ZIsGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by DM6PR11MB4425.namprd11.prod.outlook.com (2603:10b6:5:1d9::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Tue, 18 Jan
 2022 09:42:15 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::cce3:53d5:6124:be26%4]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 09:42:14 +0000
Message-ID: <c5315ea0-2f44-069f-fb17-abda87766157@intel.com>
Date: Tue, 18 Jan 2022 10:42:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [RFC 00/37] ASoC: Intel: AVS - Audio DSP for cAVS
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: Mark Brown <broonie@kernel.org>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
 <YcXFwTmP6k1Zfbw9@sirena.org.uk>
 <fecf5a0a-c2b6-f4a0-b4b1-d8243ea324a0@intel.com>
In-Reply-To: <fecf5a0a-c2b6-f4a0-b4b1-d8243ea324a0@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM7PR04CA0022.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::32) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc644c91-c67c-4860-3f3c-08d9da66cf0e
X-MS-TrafficTypeDiagnostic: DM6PR11MB4425:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB4425153A2C41C2123922DE6CE3589@DM6PR11MB4425.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hml4jsM1neG/uFYNyY17wy5hAK21haGeLy6t2A3qsj/vKD5vmdEvTOve9bhJNoMP7FvhvAl7eGScZPTrVOdWzs82PtR0QIW262hBhK0Sm5MGHDUKAalzBTZ0onVfIp24adhQo5VooDacrn5ZHuDDzWSF768sVhMuylkwLTYc9RYUDW9jG0kMP6CWGml4OssBl2xIeV56ws8yVCWRlJd1BUcDSAaXzBrPSFuEvdV+7qryPUaf6NLvPcJTPtnF07q/9gbnu1C9dpvAAHTDSe7W1O9fl7zbPcLJGtcUgzvemlRSKOLvn93VQrALDe39o166Jk/yFJTLCu4OVP6YML+cz1phkqeuScysUUvuDrZJ/jAxQb8c6CmW4RaBncxrXOqE7su+/ML1ct4nnQ74BSlULBsbTyFQ2kB9hlwbSSOboEi0AnMXubblMZVPzvv2980CLZZPEb4yyec8uinBW4y6dVXmRfyVmuNZgk0mVv7YLvNkiKtZg8GYMkTnPTTmHUdE35RZHL4PWssD6x5jJXUpvbKkNdkfHU1qKSwcb4/3vuzkjme0oZzSjEao0ti1c2Qwhd6zWwEmlDo6Ycc9Q6gbOPZfDeVB4Y2iUrvNQ6i9vaSU53sJDvFGtTml0sFerYgDljH/X182wX114JWjdoXDYBe8xIzMPjMZfcKaaon5wQi8M6+T9ACd4jtr8TK/lwlZzGr/+HpPPoa3BtP01ctSHxXhjxZe1bgiVqTMtL5l++LXnDwHDiOjARHJ8Ggh9onEVtmj1FdmK8rybAkQahynDJt59JWlnpU/WvB90aH3Z3Qj+XU6v1DbvjdFXYihrL5M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(6916009)(2616005)(31686004)(38100700002)(6512007)(86362001)(44832011)(2906002)(66556008)(8676002)(6666004)(66946007)(8936002)(66476007)(83380400001)(316002)(4326008)(6506007)(31696002)(82960400001)(7416002)(53546011)(186003)(36756003)(26005)(508600001)(6486002)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnA3eFRKRDM0MjNOVDdnMGJVampCaU9WK29xRXFZOFJKZ1RGT0JXOVFuK2dx?=
 =?utf-8?B?bDV4SThxbzJxUjNpVUszY2FvQTg0ZWNJYVNlZW10VVpzZDVIRWoyUS9QZG1U?=
 =?utf-8?B?ZUhjN3RoZTNoVFMraGR4Q1lTR0FjbWdoKzF2Vk9Hcnp3T0lmQjY4aHk2SzNy?=
 =?utf-8?B?MXFVbXVHZUcrdWs2bEZqcWNtZkJaazhEWDViRk9EcG1rV0pLOTBlTEU3UU5U?=
 =?utf-8?B?eFdjUzI4Wm1VSXB5RVY2MVZCL241M1V3VmlIdFA2clMyTDl1S3RiQjJwaXJB?=
 =?utf-8?B?MHZoc1BQV0JFdHljTnEvVkVaSkhDT2hadGFwSlJzR215ZTEyRzVZNjEvTml0?=
 =?utf-8?B?VWY4djUrRldzRzMzVlJwb0tuVk4yOGNTV1dDMm0xaExDTEZJWkplM0dxeTBq?=
 =?utf-8?B?RTBzTnpkUCsrdWdHdk15elc0QnI0dWFuQ0VrODRWaE1YNlpidDcxS1M3VDFh?=
 =?utf-8?B?OFRQUnJnUkZiRlNBTnZhRXNyd0JaRUc4ZWYzSk1rcHkxZmZSQVRIREJEK3Ar?=
 =?utf-8?B?eEVmNnpoR0M2eGRFd0o3czI5WkE1V2hDTmJ6RUpmR2R0TFYxUTd2aXZjdGRX?=
 =?utf-8?B?eUVJcDRQQXdLMStyUHhSbHdjYlZUQXA0Zk1LYWROVytrd1BEQXVPdncwSDdp?=
 =?utf-8?B?T1dONkZ3dFlhdWtvbWk0eS9lUERxd2kxMGpPMzc0VmtiK1d6QkNEU3RKdE1s?=
 =?utf-8?B?enQxY1BqV3k3bHhKcW1NNEhXU1preFVJUzc4YmRTYXNTc1VCMlBOSUJjOGVu?=
 =?utf-8?B?b2VTWExudWR4UmZOUEdMYnhOalllTnNWU0V3VjhyZHY3YVM0YXUxWE9vMGNu?=
 =?utf-8?B?bWN5RnF3bG1PRXBEMjVWYjZOZTZyczRPckN3bkovTC9raS90eXVoQjVWUFBW?=
 =?utf-8?B?UHd4ZXdDWm5vdU1GcmUyZHZvZk9PU3krYXV4Qmtha3FFZzdMV1VlZ1ZnU05w?=
 =?utf-8?B?OU5MbHVORlh5RnQ4NUFxQXhpSFhlZE9SWTlKWGhDUklBTkIwSUhsOThZcm92?=
 =?utf-8?B?SWhpeDFSc2thRzBScjVuV1dES1MzclF1aFVMTkl3YXZ3eURXaG9XQjlLcWJU?=
 =?utf-8?B?clNJTWFPODBaNnZ6Um5JUTF3bUlzRzhwdGhUdDgrVk5OZTF4UW5NRjhUZllo?=
 =?utf-8?B?bDk3N1h1cTMvbkpxbHYxV3FJd2prdmloT09HL09ZditUTFY0NHluK3hIVmNj?=
 =?utf-8?B?aXYzMjF6UXRBem92K2dGdmNJZE83MmorWnFmNlU1ZVFWRVNUNWZzVWU2aVhZ?=
 =?utf-8?B?Y0hSQzhrV0dKSWxJVDdxcmRhb3N1RTZXRm9RY2IvcWNYejZjSEpCbGpwSjh1?=
 =?utf-8?B?VGlYNW1mZEFTVEhiVVRXOW9hUFVNTHdkdjExckxLanNxYU96Si96V2J1cFY2?=
 =?utf-8?B?TzdWQzl0OWNTdFpMUVBUR0hTYkRkdkdBcXhzMytDVVVkTHc2ZVRmQVdwZlEy?=
 =?utf-8?B?MHpoU3YvK3dnYWhzbVQwaUhoNnduZE9vbzRsM1dqeng5THVmSUF2UE9NMGVH?=
 =?utf-8?B?enFXdWprL3p1RHpqS2YxRXhZV0oyL0RHRlBMd1pmNlVPeGJ3Y1FYcTdqSmVC?=
 =?utf-8?B?VWVJZGlCL00xeHkvM2UzdW5IMTNjZzRWQzI1bTlVNVRHK1pBU2pOWWttOTlD?=
 =?utf-8?B?UU5rSFhpcnFQaVlwQTZGcHE1MGhFNVlkNktWSmd2RzZoRTdUVmMwOGtSL2F4?=
 =?utf-8?B?ZmFSQ0FCSFMvRmk1ekVXZ2E1SlRNRmNCVDhiSGptbm9jN05sZGpiNVhpa0lF?=
 =?utf-8?B?Zm52Q2x4cUNIWnQrQTZySVo2ZTA3N1UyMlNZNjdDM25QSU9Eakp6dVlvakFH?=
 =?utf-8?B?Y1dGYmRnL2tHaWFrdkZGY2RTY09GTUpMQmZITDYvNUhZVkJtSzlBd2pGZWNz?=
 =?utf-8?B?M0pQNFZSclpvRDU4UExJQmVkZGlsTHZaMzBCQWR6Uys5S3JIVm1LdWdpM1I3?=
 =?utf-8?B?WXNhOGxORjFvV0pkUWxIWVhLMVJMR3FQN2JiUUZGUFJMTnkvWlRlV3NQa21Q?=
 =?utf-8?B?V1UvU3plaHFva0xhV3FpTzFJTDY5U202QURRUTMzSzVaZ1V1TDRjemc0WU5h?=
 =?utf-8?B?bzVxQ3V4dzhMNmd1bzU2SUovR0h0emdvc2pLSTVtZElCY0dRQ1FpQlh5SkhI?=
 =?utf-8?B?bTkxSXJUaG4vL1dzVThKa3hPSnAyRTVyTVBETzRoSGxSa0RXT2RaK3p4VXhI?=
 =?utf-8?B?NkJvV0U0RnY4YzBUMUZDazZVVnRPanpQVkNBRTM3S3VSZDBja3RvZ3lSTlVa?=
 =?utf-8?B?NWtRZVlJZ2IzUjVEUjNpM094RlVBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc644c91-c67c-4860-3f3c-08d9da66cf0e
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 09:42:14.8020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMEEiVliAAMXpdiDMPVwOUiDz/Kzcjze4bKscuXRjgYiR0vzeXnc+NNj3dxEYcrdVEKoPS2V4OIWDK1+8ihRHqoglAf17pC55J5v9ad1YUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4425
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 peter.ujfalusi@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, yung-chuan.liao@linux.intel.com, lma@semihalf.com
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

On 2022-01-06 2:39 PM, Cezary Rojewski wrote:

...

> Your comments and review is much appreciated. While we did separate the 
> series into chunks, I'm keen to agree we could have moved a little bit 
> further with the separation. Below you'll find the list of patches and 
> my thoughts after taking your feedback into consideration. There's also 
> a TLDR if there's not enough coffee in the pot to cover the summary.

...

> TLDR:
> Separate series #1:
>    1/37 ALSA: hda: Add snd_hdac_ext_bus_link_at() helper
>    2/37 ALSA: hda: Update and expose snd_hda_codec_device_init()
>    3/37 ALSA: hda: Update and expose codec register procedures
>    4/37 ALSA: hda: Expose codec cleanup and power-save functions
>    6/37 ASoC: Export DAI register and widget ctor and dctor functions
> 
> Separate series #2:
>    <everything else not listed here>
> 
>    Note: patches 21-24/37 get reordered to prepend topology and path 
> management (currently, patches 18/37 and 19/37 respectively). While 
> right now I don't see a reason for doing so, this also provides a 
> possibility for separation or division of these last two mentioned 
> patches if need be.
> 
> Separate series #3:
>    20/37 ASoC: Intel: avs: Conditional-path support
>    29/37 ASoC: Intel: avs: Coredump and recovery flow
>    30/37 ASoC: Intel: avs: Prepare for firmware tracing
>    31/37 ASoC: Intel: avs: D0ix power state support
>    32/37 ASoC: Intel: avs: Event tracing
>    33/37 ASoC: Intel: avs: Machine board registration
>    36/37 ASoC: Intel: avs: SKL-based platforms support
>    37/37 ASoC: Intel: avs: APL-based platforms support
> 
> The last three could be separated too as all of them touch on isolated 
> subject: recognize ID: XXX to support YYY.

Hello,

Is the proposal described in my previous message acceptable on your end 
Mark?


Regards,
Czarek
