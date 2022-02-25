Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5DF4C4DC6
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 19:33:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB4101ACF;
	Fri, 25 Feb 2022 19:32:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB4101ACF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645813990;
	bh=eAteoHkiODbRyirQodnp86z34CKcsKObDA3sgHnzXXM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vdWKxtC73k9S8WkhG9i4esEIuJAFGIOxrIsMjsD1nue4hJ2A2BCobRysKlgkYRaJY
	 a+kPtlWn3JkOQU8fiBJEq2mFhk1ybgf/ihCRNLdMOWUqjmvc4XGOVs6f3yVapUqa67
	 HCW5Oco7mVSPyK9ecP+KvJOWk5r3Ku7AlDyPcy1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18EF6F80159;
	Fri, 25 Feb 2022 19:32:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E76F9F80132; Fri, 25 Feb 2022 19:32:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52A4CF800E1
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 19:31:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52A4CF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kXa6E8AV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645813920; x=1677349920;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eAteoHkiODbRyirQodnp86z34CKcsKObDA3sgHnzXXM=;
 b=kXa6E8AV9B34RL/qZxvWkswZ4DfbjUEgApMhwj0p7IA14FQC0EawLKAs
 zX5udrzp5DGX30MWMIfvVTrH0hqOaH2L14Z5MIma2I4+uwL7aohu5/0UF
 4T8fqXL+6Rpdu8ws3oBpgXqT8eUgEpIxAjZNKzOcYKWZ9xGI07Oq488cm
 lXw71Xhp9xOnQ2q7QOdnU8R+0xcfPpz2FMJDNeSz++/RQuuWYrUJJSxw7
 B0wwzlDEuYUGRbHo0v2JQD5KrYfswDGt3QWjBvhBQDTlVEz6vw0BjfMde
 KXjHJ9e5MBNqw7pfUg/460N4ZSS7Ss8DNIl12/XG52h9QGDoHV9RCq0b6 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="232527305"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="232527305"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 10:31:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="492055720"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 25 Feb 2022 10:31:42 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 10:31:42 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 10:31:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 10:31:41 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 10:31:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hd0Nu75dhxFrxIQTbpX2gzES0+PSX0/WXD8vrTTXDr0qq5URSpWke1dkd2UbnyW9yDNbO+PZlJg5qR5rzf/aFE9BRblXSjXacOTpI9k46ykyeeK0poRJQaBEUy19RcBqmN9VrIbRUArZ0/vFwCJsk3MaaUjqMVIY8bstWnzbAQyYElIIFYPk2hH0qOo/3knMF+dxt0zx6RINjw51TBb8q3HsLLp00NhFbIQ/WHKEW6hEMwdAZh5OczxX4xgQe8PlcIFLBPeYfyKIva/XpxcH/0Yncsoax3bG0QTdc3tffAuyQJ1j4PAfKviPQWhX3cpqQFWicHddkvE395Ol5VWQXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJx4MWcHXwNWdmv6kISWgblVAFpD6O98Dhp5JFpjJzE=;
 b=K2/GSRSmt408eBZ83aV3gptYe+AgH5mJvbsikw/ma7CGXDapJXAOUTiKn5Ku56eWGemEjKR9Yu0ho3IAB+PmKC5qnnqpLzNiyVAMKdUBM+zmeT4rtbsh60QgTzAnQv37h6FzBWnpWcQ9XKs40DGeBSbw+PVW6J592WfcCldWueqALCErYG3H50zj2zXRq60eSJB9E5ZDrBmF7vSJQhoMmYJ9B21q7VjxdjA3uuSOQjCQiHz0Lh7bhQ6nDTZbRknRO0Z8XiTm+Sm6iflGw5zFgd+B7LPVZuDXwWsBs2byhw1NBiTuKJrDN3srFbrvQXU4d7mgBlSBkaFolMMx3gjAgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BL0PR11MB3267.namprd11.prod.outlook.com
 (2603:10b6:208:6b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 18:31:39 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 18:31:39 +0000
Message-ID: <f519d485-e1ef-d245-6b75-a24d1ed69a60@intel.com>
Date: Fri, 25 Feb 2022 19:31:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 06/17] ASoC: Intel: avs: Add pipeline management requests
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-7-cezary.rojewski@intel.com>
 <d2a94d30-cfee-7821-fcb8-7b7ba129e5e9@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <d2a94d30-cfee-7821-fcb8-7b7ba129e5e9@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0294.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::11) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c97dbc7f-4908-4cc5-85ca-08d9f88d0fc0
X-MS-TrafficTypeDiagnostic: BL0PR11MB3267:EE_
X-Microsoft-Antispam-PRVS: <BL0PR11MB3267EA14A6CC918563E75C53E33E9@BL0PR11MB3267.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f3VkLAomjtOkOzXU08DU70G58PkJGRXslWQteQBCbM07M6SqhZvh+lZhdD52e2xwjd5+Kx9pkgNbIq+/JtGz/WtutFOgJStDWop06FaZzMuGtyROx2NOR2fWP005KvdobgFtzb+St+t2cYrGNNUb+2c+O1Ow5nDlIFBJOwtNR/A6Ei5arJOUpDRH8nBJdJth/flM/XOoghGIjY8DhVbxeXmHRevSoHWJZ7as4IYT3C0aL2Uzdg6K2F0qEw6oTWJQl5XEkJwZBRSpRmDIwvKG74EAePAoAcN1foQhNECUUhNO+G1cfLKk2Pw68g9GzhyVSeVpYe+Dh6ab95n9ZrqRJNvOxWG1gHfThoimYW9KGhzGn7isod37aUjjGA7OzebnMpa2VJQUj5YUsYAt8S7lJVlC6a68udEkAkJFtAoei+ktt8vOfj8bRh+RfSNxSMeA62qpZvZzJnE/dBUXCbQzPdCaBJOxfkEXepvKUPNFQ+ai/sI1eLiB4mPt+rZRkA0j93aikbEywUvV095Hm++mvJZH3bfOn6732wsg2zIcoDe7lN0lNnnFDkTPTun2gI9dg8LHwLI8eDVRoDLONXPjbadoJxFoVivZCcsINe7UeJaF36pe6wqKVT6JSulaCgvNuovAp7tGckdoV4gLRzZY6PEv0MfjxCGDtaPEVvU83Axv6VfLbjSXGvcHlzx2Lj1Rz+7KjOhqch+lD/mc7m/i+kKqrx3Gcug3QoW5rRWYQyfABLn6wCBgy1LNPQp5+9L7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(53546011)(6512007)(2616005)(6666004)(6486002)(508600001)(38100700002)(86362001)(82960400001)(31696002)(83380400001)(186003)(26005)(8936002)(36756003)(44832011)(8676002)(66556008)(66476007)(31686004)(4326008)(66946007)(2906002)(316002)(7416002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlAzUitsOWkxRUtYZ2NMUnQ5ZFk4T1pFcmRoQWhwNU9pUmFDMHVoVnBqcWpM?=
 =?utf-8?B?NlRSeHZEZmxaUTlnR1V5N2tGSEdseXNBRURhcGk4eWhKT2doSXpwWVdka3hq?=
 =?utf-8?B?VlI3WjN4SEJhNlE5NENWcVU3U0xZREltTjFTWmhIZlFQeFdGR1pONkk1RFFC?=
 =?utf-8?B?TEZjeW5MaXlRcmgxK2RjZkgzUXJsTlM2Mm1XcmRQSUJGSnF0dUc3bXR6ejU3?=
 =?utf-8?B?a09tbUNwaUx3TW5RKzZhWUg4UmZnWm5HQWtrVklEN1EraU9BSzkyb0VlV2pt?=
 =?utf-8?B?aWJOZ0FqdGEvVWx1VnkrVnRtUVBSckY4ODcyUWpid2dtZEZLZUxNQVFid3hU?=
 =?utf-8?B?MEZLaWZqSXkrK1NHeGk5MHdvd2taY2xaa1NmS2FmV3YwQ3dmQTFIa01pY2JP?=
 =?utf-8?B?bWlMTCtPWGlzcmkvYlZNckVEVlZQZU5jR0t2eFU2dldzaER1V3lGMmVISDcv?=
 =?utf-8?B?cnpmSWhkOFEwd1NoZXFPRDN0ZmZVL2kxR0NmTmZnWWRUcExFR2Zoak1GbXhL?=
 =?utf-8?B?aUhnOE5JS1gxdG9nbjdBZHMvRDlNeU1taXk2RXcwMEY1TlZaWEx3U2tYVVl1?=
 =?utf-8?B?dms0QXFZSVdxTlMwbnVBQUtnbEFVMi9BdCsyaE5kbE9Cb3BVNGtxZis2bDRx?=
 =?utf-8?B?Ym4rZExWOWYwUUE2SlNVdExGblNuTndrNncrNzVwbXd2NjJHZ0R3VmFmR2I0?=
 =?utf-8?B?RVphdldMK092TEVBakl3bVZyQXVUS0hhbEFQLzFZUGJiY0lQM2QvNWJ3b0tw?=
 =?utf-8?B?ZWtPQ2dxYW1iT3hwL1JwUWwvNVRSUGo4QkhhOWNRRzMrekR1azlMVDZSMkwr?=
 =?utf-8?B?Z3AzaXAwUldxWDF6ZnRBaGtIZWRmR1o4R012eUxMdC9oVy9VTU01SDh0REs4?=
 =?utf-8?B?RWd5Vkpza1g3RmV0emErMGJocExnMFF2R2JGb2pwOXF2SkRjU3BTODJyUndB?=
 =?utf-8?B?YVFKOXRlY05pOEwwWVIvTHUySXludjdGeGUxSFNsV0RJYTRRKzI3d3dEdENH?=
 =?utf-8?B?dmVOd2x6ZXFGbXdUdEZYcVJ0NGJ2N0VzbEV4Mkgzb0lFUGlUTEg5aG9HZDJH?=
 =?utf-8?B?QlM2Mm1WZU1UdjczTWUwSjBmQXhxL2dxN2NNcW1qaWxPREtMNE02azh5Tjhl?=
 =?utf-8?B?eDh3Q3lHRGY4aTEzbzdMN0ZvNTM4ODRveTVWQVpmUTJyTlJlUVpkY01sU3FT?=
 =?utf-8?B?WHJTa29Fbk1iUDQ3Q2V5MGMweGZSMmdwNUV5eU05a0xoc2F1NVByWFdHc093?=
 =?utf-8?B?Szd6UTlyU1RobDExRU0vOE9UU1BiNFMyL1Z0WVp6Wk1HbG1aY1dhZExkdUd6?=
 =?utf-8?B?d01jeXYyS3pLeHB6b0srdVQzR3ovWUs4VDRvR0RXR2VlYTVmV2FITHl2M3RT?=
 =?utf-8?B?azdwNFU4dmx1d2w3QmRwZ1IxblZHNnplSHdKak9rRFdDYklReFlBM2JpVjJG?=
 =?utf-8?B?TVVzVFcyWU5sK2xOYXZud2RFMXBVK09RK3hnLzlPbUl2WWtTYWRPV3dnNmhj?=
 =?utf-8?B?WFNBaExxTkVmMEhibkVJKzhWVnJsaEN1ZXI5RE82VlJiM1IreHIvdHovbkRq?=
 =?utf-8?B?YUFOODJ0UjlZU1BBcGJEYkkzYTdGOVdiYzI3T2diNHM1MVJxNTZHbU10ak1a?=
 =?utf-8?B?SnpGUXVkUGZNdGlQVFkvU2ZYSzdIa2Q2ZVFRUkIvMkp6YWNXYmM5bGhvK21y?=
 =?utf-8?B?ZWVLTDJmQk1WMHlueGNZclorTE5jQnJhNzl2Yng2TzlNUDRncWxTemhwOWFP?=
 =?utf-8?B?UTUzOHBoS3ppSklTRHlDRm1lczE1amJweW9oR3BVcU5ONVhMM01iN0xOQnhp?=
 =?utf-8?B?QjR3L1RGbXo1dWZGakFld0oyVE5HZnR5WGRvalF0bWhtQ0tFQjlqdWRxOEpC?=
 =?utf-8?B?UHZPK1FiUVg5L29CYzhmamc1WUNPeFY2bFpEbENFUDdoL2dWOW16TVk1aVJu?=
 =?utf-8?B?R0F4L3JIOTErMDZ1QXBlekMvenBrUTZDL1Z1TGFhbk1kVUpaQzRLUVFrTzVj?=
 =?utf-8?B?STQwZlVPbXl6a0ltajlaQ3ltN3ROOEd0OExmd0lTT1B2OXo1Z05aVG5uclI5?=
 =?utf-8?B?dW5kMWVoalhXQ3Q1dEFOaC9oV2twaFdZMGxIb0Y3OTFubDNuN3RTK1RVTXoz?=
 =?utf-8?B?VTlKMGx4cjVNd3ZBRnpLaG51MUNCN29TSUtmdnZBNnZ4NENscjI1YnpkTFZs?=
 =?utf-8?B?ZUppSkFNVlJhbTdQa1BiYVZBU05uclB3Yi9lTzNIZko0cm9ybmllZmZMUDlF?=
 =?utf-8?Q?L986CzpF0kI1DL+SI+AjfSZzVrFzw+3GqjZm9Idf2Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c97dbc7f-4908-4cc5-85ca-08d9f88d0fc0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 18:31:39.0644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLTAXBM+A2MsYXXydEECo5NZNMk0PCIUa3ly0Nno48RBWsH86QjDqx8VDqpn/mLKPTR9aPmvnYBNBFd7T7wIgUPi4F3viR9xSOEs7qjuhwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3267
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

On 2022-02-25 2:11 AM, Pierre-Louis Bossart wrote:
> On 2/7/22 06:20, Cezary Rojewski wrote:
>> A 'Pipeline' represents both a container of module instances, and a
>> scheduling entity. Multiple pipelines can be bound together to create an
>> audio graph. The Pipeline state machine is entirely controlled by IPCs
>> (creation, deletion and state changes).
> 
> How are the module instances connected within a pipeline? You've said
> too much or too little here.


Hmm.. I doubt commit messages is the place to bring up entire FW 
specification. A high level description is provided to give a 
maintainer/reviewer idea of what the pipeline is. Perhaps s/module 
instances/modules/ would suffice.

>> +int avs_ipc_create_pipeline(struct avs_dev *adev, u16 req_size, u8 priority,
>> +			    u8 instance_id, bool lp, u16 attributes)
>> +{
>> +	union avs_global_msg msg = AVS_GLOBAL_REQUEST(CREATE_PIPELINE);
>> +	struct avs_ipc_msg request = {0};
>> +	int ret;
>> +
>> +	msg.create_ppl.ppl_mem_size = req_size;
>> +	msg.create_ppl.ppl_priority = priority;
>> +	msg.create_ppl.instance_id = instance_id;
>> +	msg.ext.create_ppl.lp = lp;
> 
> you may want to describe what the concepts of 'priority', 'lp' and
> 'attributes' are and which entity defines the values (topology?)


These fields match firmware equivalents 1:1 and are part of pipeline 
descriptor excepted by firmware when initializing a pipeline. Handlers 
found in messages.c are responsible for one and only one task only: 
sending a concrete message. Part of the driver that implements PCM 
operations (not part of this series) cares about the topology (where 
these values actually come from) and invokes the necessary IPCs.

>> +	msg.ext.create_ppl.attributes = attributes;
>> +	request.header = msg.val;
>> +
>> +	ret = avs_dsp_send_msg(adev, &request, NULL);
>> +	if (ret)
>> +		avs_ipc_err(adev, &request, "create pipeline", ret);
>> +
>> +	return ret;
>> +}
> 
>>   			u32 val;
>> +			/* pipeline management */
>> +			struct {
>> +				u32 lp:1;
>> +				u32 rsvd:3;
>> +				u32 attributes:16;
>> +			} create_ppl;
>> +			struct {
>> +				u32 multi_ppl:1;
>> +				u32 sync_stop_start:1;
> 
> these two are not described at all?


Ack.

>> +			} set_ppl_state;
>>   		} ext;
>>   	};
>>   } __packed;
> 
>> +/* Pipeline management messages */
>> +enum avs_pipeline_state {
>> +	AVS_PPL_STATE_INVALID,
>> +	AVS_PPL_STATE_UNINITIALIZED,
>> +	AVS_PPL_STATE_RESET,
>> +	AVS_PPL_STATE_PAUSED,
>> +	AVS_PPL_STATE_RUNNING,
>> +	AVS_PPL_STATE_EOS,
>> +	AVS_PPL_STATE_ERROR_STOP,
>> +	AVS_PPL_STATE_SAVED,
>> +	AVS_PPL_STATE_RESTORED,
> 
> can you describe that the last two enums might entail and what the
> purpose might be?
> 
> I can see how the firmware state could be saved in IMR for faster
> suspend/resume, but save/restore at the pipeline level doesn't seem to
> have an obvious match for an ASoC driver?


The enum lists all available pipeline states. We're planning to move 
these to uapi later on to allow apps to monitor running pipelines states 
real-time.
