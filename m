Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 076E4520EC3
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 09:38:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E9BC17AD;
	Tue, 10 May 2022 09:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E9BC17AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652168301;
	bh=/Tbbu31GhjBAvPp1qPZ95HomgSECApj5qUOXWAvGMFo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lmwJ31gEX7KSfeJghr0UzWWS029xUHvv0XFc3q0eQ9wnXUaQYivL5HQIZDMuvlyN6
	 7yDYNb6IrYs1nXxSPMwRPGCq+jZSe8MlCkAdtDUp55GXyW0oDyo/U0jKC4CLDHNJkh
	 RArJ4YqaJkWRfqNrpKPUOqwD3RUJETCH3+VcZld0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB9C2F80240;
	Tue, 10 May 2022 09:37:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA036F801F5; Tue, 10 May 2022 09:37:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8A41F8014C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 09:37:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8A41F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Y5D+uIXT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652168245; x=1683704245;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/Tbbu31GhjBAvPp1qPZ95HomgSECApj5qUOXWAvGMFo=;
 b=Y5D+uIXTu7l+giiyCBICVNsKx5pUjwZZMay2mPVj28WpJFQlOISmMvC3
 w415LBDi/hxGejfvIZ+iSNOE4qGpzeMMPMITpATECQ9Z68xsFZnb6oHDO
 5+Tq1ZadccEjbx1SZWKxguT2ToUIFoVCNaw6XTlclzTPFJux+huS6N8Yd
 ateRkvj0xhfDSN3JM/AJsGlPlewyYani4k4rzS0c5eiUEvbsMzMrJHsqb
 rl/ULLdoYD3MoLvlyHvQDPe1IkstmiTpChShA8Z0580BPLmTE7r8GfNdF
 Pm2qlYyi9nGLxP/E6do+4WQbwzGtR+n5Q5zjCReq2tySj8vYRC3f+GkaG g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="251340466"
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="251340466"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 00:37:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,213,1647327600"; d="scan'208";a="541650791"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 10 May 2022 00:37:06 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 00:37:05 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 00:37:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 00:37:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 00:37:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwnLks/ezDLwpcV46MSIt5o0w5chPKoC+KiG94H/tlr+dkejFRMs/2xuFkWv38OGr4FzgBGXBd1l/6S/39CsyqOtCBbSjrqIgScz0OEI19Ft62/Sx0+NkCc7HSwBunzyqcPxNzlxCMcqQRym21V1F90mtVmoF9VhyBd21yg0P3BqfBxSU9gzqJyLqjsT+jLDBOXI63VKC7f6fYKO1kJJKsaSfwodbg0fXKeRk25Gq9FrELvv8XxG4hqICEHFnMqGXEkO1I77a9pz+XFbNpS53mQLdg8rFb+2qTuS7CZRRJZbHkZ2ObZiih+teTu+8UvQ4az45ULY75DhT/mMoclOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sejgp59d1FJeEC280TrNZ5L4nvzJatFZ+GxanOJmgZ4=;
 b=Re7mtNSK+7ZlqWpQpWSiNlqhBZLtFK2otKgnqlfyrx5DjZIivM+OMiz+o+KR557wbwMileE3VEBnB7M5s8emx/LUtO3is6PhILviCgamkiCY7pPhYZruahBxXQ678IbdcYJwE298PGxXsCcf87Fc6I11GiGI1M24SCjVbuiQdElRzgKTQS5KfY/oIyg57fe0y+bWqXidXksnphM+xK+3mdLyFD2udm7IKulKV4vlFv005KD1GkDrC88cH549jLxPe2244bf/zH27FYjgvo9sCOxhN9BtdpAz41jzLktr3OM56r4uMmbeWtU7TMjXQaK0WVRS51PZ/gFSXRcH41+kOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Tue, 10 May
 2022 07:37:04 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41%6]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 07:37:03 +0000
Message-ID: <b872cdd1-14b9-39fa-7d46-f6a3f20131f7@intel.com>
Date: Tue, 10 May 2022 09:36:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH 02/14] ASoC: codecs: Add HD-Audio codec driver
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>
References: <20220427081902.3525183-1-cezary.rojewski@intel.com>
 <20220427081902.3525183-3-cezary.rojewski@intel.com>
 <7bc3a92e-8bd1-c1d0-5610-af40dbb8fb7a@linux.intel.com>
 <YnUev8Rs42xLLE6Z@sirena.org.uk>
 <4a808f4c-83fc-747d-1536-d276138e57b8@intel.com>
 <2849fc32-83b8-4727-0aea-aa20b4d3557a@linux.intel.com>
 <28e7b768-dfa4-eca4-9d7a-5e8c6f54bc27@intel.com>
 <53557182-a2c5-a280-8887-bdb8a71dfd94@linux.intel.com>
 <alpine.DEB.2.22.394.2205091543170.1532214@eliteleevi.tm.intel.com>
 <914e993e-a440-74a6-e5d8-3589b0f4083b@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <914e993e-a440-74a6-e5d8-3589b0f4083b@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::7) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3b367c8-947c-488c-dda6-08da3257e056
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_
X-Microsoft-Antispam-PRVS: <PH0PR11MB5880432AE7AC89899F32201BE3C99@PH0PR11MB5880.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M5pVu2q39VNP60+uU8Fvcy3ZutEiw6QhxuuFOC7a5OI92ZCZQDtxRTX/4TiE5gQVkP+dxRqR4J4sZNFxIAo3sUahJG8vlWkgwgMOesHT8W1W/g73N+/y1evx4wTEtEVuUtE2xRRNS+RkX2jO9YZfAizMLSh+S4DrXXFzvHo0nZQVUJILz7Lw+R9hQk33n7PxC3QBYpGm5YyFHGYFwQcb6XrSSUED61ulkbLMqHuw7DPyqp17YIUDiyCrhmyHVy/dieV5dSVzKSf5ob7SQzY0EOJOKSCq0bL9nWQw3dfPTBeIyrRORc66rUzIqRzax09GxA/oC4ISBdGpIlPBIEhQT5KPvwkBx3MTOZq2RbI2ilSSNoGEC4nCRdVQOQQPdrvTLRxtmNV6BSvtVqmgy1VVG5YZuUWhHH0NxYveHK4J/2N1lHZs6/P1iHAHkDj76L0ABY9HDD1apZyuj/0nAt2fXfwEqs3T9SDBrRkhskLbC1C/Ib9aVqNt9W77RcyRiVIcwkOuYL5IfWeE8OySVFXCuWDqoQRh5wNlr2mulF4oPAxtB4UW139OItI0ZXK5BUlJ8CXjytlQMwa6P9u+r85DP4PBhAukV1RSq5Jyo1P1BIw0NaHUjorCtevC1Ve+y4azbY0veTigiNcF9JWP+vkDLhwd+2Qm34eB18V7zCqplD8V8KSE/rqyvODo4JCr+MpmJIM7DhpaJgQ0a3L1/WfiUmQi5gjgXLst8NwCw+eoGtA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(186003)(8936002)(2616005)(6486002)(31696002)(66556008)(82960400001)(66946007)(4326008)(2906002)(8676002)(66476007)(31686004)(6506007)(53546011)(316002)(5660300002)(44832011)(83380400001)(38100700002)(36756003)(86362001)(26005)(7416002)(6666004)(110136005)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME9QNWhyUWYvOXFpOWZvN1FySGJlOGkrVUtFeFY0RmxyUFJkWlRYai9JRWZN?=
 =?utf-8?B?eDB4Nm9jZWlKWTNKalhjNXRCWWY2QjBhUUJ3eVBiN1QrTW16NlNFTVd1aXZo?=
 =?utf-8?B?SnJham5FSUt5N242YVBUR2hRMHlsVmlYOEl1MlNub1dCVWRtem8zVjlLVjRV?=
 =?utf-8?B?YkEwK2FwYmxCWVdnVVo3UEtmampYQndzenNydDV1WVpwMDgxM05RSG1mbExl?=
 =?utf-8?B?d09aRFhVditidXBDbjJZZFliVTZTcDdnU1RwUDJQNEl0RDJTamlORThUKzJI?=
 =?utf-8?B?Y05TTkMwbEptMnpCY2xtQUY0dk9TTnBkc3lKUksvNkJ5UWR2aXk5dExpc3Zv?=
 =?utf-8?B?ZjRmWkpnNDBIeUJRYXZOMGlZQmpPNW1zR29Ud2lwbXFBeVFrejgzVmYycjFq?=
 =?utf-8?B?MForaXRhWWNBZXZZbldPR2VVa1NYWWNwZ1hWbjZNS1JjSjNONG4xT041ZUtP?=
 =?utf-8?B?eStoWUZiakZIVC81OTBEeVREeVlRbUVWdWlXc2x6dkorNGxtL0tmL0prRjJK?=
 =?utf-8?B?SGIwMWZzRXZSS1Z2Zi91NDJVWjB6MXhlM3FTdHpVbVhuUFV5UzRqMkJsVFlE?=
 =?utf-8?B?VnBxUmt2dXBaNjBvV3lOMCtBcFEraHljWDhocFVYR3B6ZFMxMVQvRElZcEpS?=
 =?utf-8?B?bWQwQnlrZ1BVYTZERTJQenRoNzlsa2o1dXdwRElldENNd3U4S2Zna1ltQ05v?=
 =?utf-8?B?dENkaFJsNzloOTBCNm0rQXNqWU92MTRwT0NEQmcyRVRkaGpLQVVqOVc1Q1hw?=
 =?utf-8?B?S3J2a1NCSlVSQ09RQ3FTd2VjUlE3ZDdoM0JmZHZHQ0dDeTZmbGlQTndVdWQx?=
 =?utf-8?B?OWdBNXBHRVJIMmNFKzRQbEJ1ZTdQWDN0T2RvcnVCWUNGcHBFSWJ0K3FvTU5w?=
 =?utf-8?B?WDVBd0cxKzYySnY1NVhDNzRma05VTHFhZjJOMFRCaGhkSkU0b0RraHFLV3Rx?=
 =?utf-8?B?R3U5bUdZdStpcG9RaC8xOG5QcGQ4MTFUYWl1K25TYy9SYUpaOW42eFQ3cUtR?=
 =?utf-8?B?QXh5QWFJdHRFYU5zcWUyNXNqTlgyWUN6MGlGeDh6dWFkWitiMW45MU5xeEM0?=
 =?utf-8?B?UzFqQjZSZisrcExkck10bzlqSWZDOWpPeTEzYjF5Mjcya2tHN2tMeTJ4d1lK?=
 =?utf-8?B?bzlKeVNNamRhMlovZTZ3Z1JBOTduU1VSbDlWclBKN2Z0N0lMRjZjRWxLcko2?=
 =?utf-8?B?K292a0gyblZpcVB4WkxhdVp1Y0piN3ZNNkNnREF1bi94UXhCZnd2cWduRFVs?=
 =?utf-8?B?cVlJaVlRbHJXL2RGbnU4WWtldzBzOWFXdmd1UjZFQXFxbWJtUDhyd2ttVi9r?=
 =?utf-8?B?azZlZTFpT0pQUDkybitrenJPS2J5U1ZpN2JUQkw2ZU1rQitLMjhWaXJFR0tp?=
 =?utf-8?B?Q1VySVF1RGFVVDVMa0lMT1RxUURBODdMODBKTE5tNnBaeS95N3RnTGFjcVdL?=
 =?utf-8?B?cVdXaHBSS2RLZzhlQXRXY2s5c2FrdS91bVdleW05dTh1dzdpR0FMbkpTUWNX?=
 =?utf-8?B?MTNUVktGRW1Lb25iVFUwZDYwQk8wNkFWMDBqZ3BKYXBubnVOdnlBZ1lWU0FD?=
 =?utf-8?B?dXBkWm5xZ0dCZWJGUzBuSWNSSjZHUmYrak9KR2FYd0IxYU54TFNvamszeUhT?=
 =?utf-8?B?aC9hMk5qelh5bDJqbW1Va1REVjBTY1d2M2xRVDVPQzM4WnBZQnJUUncwZWZq?=
 =?utf-8?B?d200WndDK2J1enU4Sko0dGhSVGZwSlk2MDMvdjJWaHF2dmpKY1RxRm9ITDRY?=
 =?utf-8?B?d0tMQS9EaHQ3Z0U0UlA0VktFeHRhWWhTYisydVNZaDFOM3VJNThpK1dyWHdI?=
 =?utf-8?B?ZUtLSVpKOHlvOEJ3L2Rkci8xQmd4ZG1EbGYvUnFRUXlIelhNMXdCWVVnWFVK?=
 =?utf-8?B?QUM1bHRqZVV2YUZtR0JBQVBjTGowdnoyK2V3WVVGSVU3RG41M0FCNUhLRjlv?=
 =?utf-8?B?S3hxSlpDWWxSd2FTL2VwZUUzQlQvQzN5bENpbkhkTDRpS254NHcrZXpITjlW?=
 =?utf-8?B?S2xGbGM4MTBmb0ZBYlB2WHJSZ3cvK1haMnZXZFRJcitabnlNWm5ZRGcyYjJh?=
 =?utf-8?B?NkRpVFRFN3FsU3BIU1k1bTFpb0hyMTVGV0xnSExxQy9nWk5mRlM0bitDV3BW?=
 =?utf-8?B?emJCcTR6bXVvNEMxTWxQcUFGamhtZlZsNEQvbEZNQWlHUkVoWWhEMFN3MFd3?=
 =?utf-8?B?NVdMMzhoTEIwSnkyNS9tTC92UnJmYm9kdDdrWko4eXhxWTY0TzVEQThBeGZH?=
 =?utf-8?B?TUFXMVNuK1NtNUUxWWdDc2k1RzZNVVRoOGtpK28yVmNPcEJlQ3IzTUJSU1gx?=
 =?utf-8?B?R3dXdkVzbkg2Z1NRbHNMRGEyellMMVpyT0dZSHp6L04vTS9FdGIxQmU4blZ1?=
 =?utf-8?Q?jfOS5pFNtt2JmIXI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b367c8-947c-488c-dda6-08da3257e056
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 07:37:03.6178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSuYDaRjMyDrY8dVTK0lv7x2bqyqpxF4YEHi8A40tCq6vShJeBTBz/hCt4UKRnSTV954Npig6Xjb5BTnL/Y8EY3cTyaMXQGUYc42ko5xupE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5880
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com,
 Mark Brown <broonie@kernel.org>, amadeuszx.slawinski@linux.intel.com,
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

On 2022-05-09 5:55 PM, Pierre-Louis Bossart wrote:> On 5/9/22 09:33, Kai 
Vehmanen wrote:

>> The fixed DAI capabilities of hdac_hda.c are indeed not ideal (although in
>> practise hasn't really been an issue so far) and the approach in the new
>> hda.c seems indeed more robust. We do have a lot of existing machine
>> drivers (and shipping DSP topologies that we need to keep working), so
>> transitioning e.g. SOF machine drivers is not going to be straightforward.
>> For new mach drivers, this could be considered.
> 
> We've just simplified the HDAudio topologies to support the Analog
> playback and capture only, for both IPC3 and IPC4 cases, so there's
> really no plan to support such dynamic capabilities. I am not even aware
> of a single device available in our team where the digital inputs and
> outputs are exposed on a connector, so even if we wanted we couldn't
> test this dynamic part.


As I've explained in one of the previous posts, you can always use 
topology to limit the number of FE(s) available while still adhering to 
behavior found in sound/pci/hda. hda.c is a prime example of how ASoC 
HD-Audio can align with ALSA HD-Audio in 1:1 fashion. hdac_hda.c does 
not do that a) because of hardcodes b) following HDA_DEV_ASOC.

Having no behavioral differences is a major gain here, fix one place, 
enjoy both solutions. By 'one place' I mean sound/pci/hda of course as 
there should be no logic outside of that directory.

>> So while not ideal, maybe it makes sense to have two wrappers, hdac_hda.c
>> for mach drivers with fixed DAI configuration, and the new hda.c that
>> supports dynamic configuration (but requires mach drivers that match
>> this). If the old SST driver is deprecated, we can then proceed to remove
>> hdac_hdmi.c from the tree, so there's some savings.
> 
> Such removal isn't going to happen for at least 3+ years, the time it
> takes for the slowest distros and users to switch kernels.
> 
> that means we're going to have to maintain for the foreseeable future:
> 
> hdac_hdmi.c: used only by SST
> hdac_hda.c: used by both SST and SOF
> hda.c: used only by AVS.


I and the team maintained almost all the solutions found in 
sound/soc/intel for couple of years already, doing couple more with the 
old stuff is not a problem. Don't believe 'sit and do nothing' is the 
answer here, not sure if this is even an option - but I'm sure that the 
final effect is going to be worth the initial cost.


Regards,
Czarek
