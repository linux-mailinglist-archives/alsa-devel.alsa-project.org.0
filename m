Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C835E514CA3
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 16:21:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59300839;
	Fri, 29 Apr 2022 16:20:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59300839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651242064;
	bh=Wac+I/+rlVfgxQW70Nq1MAOnocI5aYGVSde5h8ec7rU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XaZVfn9L6LVtENGqV8FTv40Z61Dj4xdNG98WtwrWfvvjWSsriGMv64I3OZmuNVTTQ
	 ts8unV9uOOIRke+CsL3s/i3tbvaWW+E7mD+3PdeNks/X+JKxkypQjRrRiCFp93j/Rq
	 nr+/OzJ0UR1prIF8l8KWVZKVqeYOLwRTHnrgaKdw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB384F80269;
	Fri, 29 Apr 2022 16:20:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54CF3F8012B; Fri, 29 Apr 2022 16:20:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF28CF8012B
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 16:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF28CF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SB1lviKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651242002; x=1682778002;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wac+I/+rlVfgxQW70Nq1MAOnocI5aYGVSde5h8ec7rU=;
 b=SB1lviKZXSXesk3XE+smmciH+fuZeWZcyIViesE0Umq1GrIcLAG/bmrt
 I1tfVCpRKxB32Fgd6fjfjp3Lz33M3z4drj3hh0ksPQFsZGw3ZBVSN6jvX
 Z3k0fzq4r5+FNVAL4bnxiU1+0Q9tKNxxrvfbtfT7kAUOBS89eydGDau5r
 Gd/9DpM8R8k4fwfPOfJ++OQ+jb9kvcwEzF/8y+UZjKqWxVYVvUQ5eybKQ
 eGc2aUDzUgZgn7O6Tglubz8K2Whgi6Wq7s6PT7PdsRuH/yslQoSAlFVMv
 q8cDHPzr6PGNGWTIANa38vcHwFT3s8KRQq5adkiM752/AsOq8qnGIqLSn w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="254042439"
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="254042439"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 07:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="630091942"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga004.fm.intel.com with ESMTP; 29 Apr 2022 07:19:57 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 29 Apr 2022 07:19:57 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 29 Apr 2022 07:19:57 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 29 Apr 2022 07:19:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 29 Apr 2022 07:19:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvVPrI9V09AQG+rkC/4JYeu0n4SKBV4STuzNcPwxGRauXzq0jI1x1t5l8jPqlL14Q/vjaUYYIGwI3CXBERMQESH4P2/jfM8mOEI+pVLwv5ZYqiwawjc+yvFubVM7MPEvAP4Gr+yrSapJjLM7c1N4pdo5RK01VnE/Sc1ai3drRdMAZlhPuATcMwYA7V4Xx4aGG1K944Egd1tBGKYDuCLM/BdL+bOEeah5AY7K1Lby6zVvjevRep1DD0s0LQgoxdZ6q3q8w+X/EUHtMlUyLKgsMFa2ty2aZKXnksGNaUsxLdR1uR4UfVGwZr/zdvfAuw5cKQDKU/mVJktVEpxJzXpMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4n1OvRjr9BT6e2sxBmMCmIIpOMbtIuy/8M6eAhVQoY=;
 b=iuXwFGQo/qflh+GCiFscX/wHgb611TaFWawh034wOTCWE/V/2SwqVFpmp5NzZCFyLQfV304tacXQXpbRY9K4a5N7j93SPVZj3gfhy12lT65Mqi7VDn6CJZnW3M3d/T6YlRrqKgdXwsSsN6oODeGuCjrwfPh+MTu/qchqCCIjKm32eN0CvTBHr4ThweKFshamtcxOtZrfQxFIiYMd0fVWPI5hZ9LUMXWt7/8XmX+ZiXpMrwnuVZ6r1OIXcez2vak+dl8za+sfxXAMcKZ39bTtV2fc9b7ID9YX1NU1jCaAuPwBw5mqUNelcoQ6+kegui8Jh2aRQv+ko9BvVxcMShfvRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BN6PR11MB1698.namprd11.prod.outlook.com
 (2603:10b6:404:42::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 29 Apr
 2022 14:19:55 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942%10]) with mapi id 15.20.5186.023; Fri, 29 Apr
 2022 14:19:55 +0000
Message-ID: <349d743d-682b-757b-ce92-cb7c1e9c74fd@intel.com>
Date: Fri, 29 Apr 2022 16:19:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 08/14] ASoC: Intel: avs: D0ix power state support
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-9-cezary.rojewski@intel.com>
 <c62f108e-6887-a4e2-a155-e0d18b142ee3@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <c62f108e-6887-a4e2-a155-e0d18b142ee3@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0067.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::18) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1440426a-00ae-4838-e461-08da29eb5523
X-MS-TrafficTypeDiagnostic: BN6PR11MB1698:EE_
X-Microsoft-Antispam-PRVS: <BN6PR11MB1698A5CAFB44830EE80ADF7DE3FC9@BN6PR11MB1698.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: etQ9a7TE7oxIRzJOdbxNoQRGw+CpPyYPmkqRzCzYoygwy1x2bIcDc4Hsh2EAHzlG4sicGQHg+obTJKzTvknTBLzwks4h3KtZ2tAtvpLk4uORn5o7xlrXWFGEzV+kKnS23UmSSjsl/u6SeXMxHDi5h0js1SGF9a43IF6GpA88RnrAu8TOuVPI6tIG4PHlEIRGqqGMpxM40GTLZeh5zBjUf3EO/VkY2HnQhQNqFQIbmp96qCt7VWinPedKu5MPvvwUZsFFRMB7ft8WjzMi+W0DKWKaSlB6SLTHYPH+R9XC3KcWtBykVHzAgxh3jT7ucDMXLu0pZnaDsIuLG4TucUqZhPmFi/LiJiIs/ow/jePVzan2GRTxJ4X6MkjyIayWyR7DoZxN4UNl7P5U9gbOdFOiAsVvFTk2JYuU51KEntlvSsqBJFnUylq0Lmkubor4JFbMzBd0krkot9sTYZF8oRW5JQF3KwVDd59E9PCNh615Oyak8VChP6+oV2u7Sds1fEgyKrHpvxM+P5oubkRplZyQ21GE4GRpMmrtedNrcdFPnz1MbkxPgcgAUu1MNRJJjHV0zDkmtqRvftwDnqz6HvMywG0YeLYafevVs5jK/Ukx2tTC5+EERnVVNQVHYxMyClynsodL2Pj9h1nBcfOQ2vb2b7VltCb6nFNayuK0DSbfU1VDWEwmkSfZCXNjsFE7XkFX3o88zEFHyqJBBUKCqH1F/iEMIUYzWs++NbS6EzQRpG0hUf0szW+4C2ZAiB0n26xVpQhXxVYsnKysnwm0O5ZLWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(508600001)(6486002)(82960400001)(6506007)(6666004)(31696002)(8936002)(5660300002)(53546011)(7416002)(26005)(44832011)(38100700002)(186003)(2616005)(36756003)(316002)(4326008)(2906002)(83380400001)(66556008)(66946007)(8676002)(86362001)(66476007)(31686004)(32563001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkNYazc3NEpWWGd6NExIb04zM2k1aDUzWlk4R1NrMHRFV1dNUmI0bW5tUWxN?=
 =?utf-8?B?YkpjNjlPV1k1V1pKQkthQmFWMURMbGs0NVpRTzRuRmRBeFJNRUM4S1F5a2Ur?=
 =?utf-8?B?ZWJ4OVNhYlVpQzJpelhYRUtyTDhWaXJLOUVpTlpFUWh1MXhya0FKM1FmTndP?=
 =?utf-8?B?Y09xZFFzSWF2ZkN6dmtseHoydW9RZm0xR0xiK2NNV0ZpWE9OMFVNVTFxa0xS?=
 =?utf-8?B?U1RjNWkyVTd4TUpLRmxYQjB2MEI1N3g4cGFCRTFRdGM3SUxkeWNGaTY2NWNY?=
 =?utf-8?B?YUVydEZjUmZSbmR2MVZ4OVVMSVRmaCtvOXVMZlFEdUNxL090MzI5WE96bTlG?=
 =?utf-8?B?REZ0VWN2N3BKeHl3YlZZZ1daK0d2SSs2bGxlZ2cxRUVHcFNrT204THRhazN0?=
 =?utf-8?B?SkFyWFpmQlVEMUJJV3RQQks1TUlzYzRPODFSYkxQNU1tUWtMMUIyMmVsdTJL?=
 =?utf-8?B?VVVDNWg4UU1ZdU8vSCtQcjh5Y1lqUFRuMnhvMEEvYmQzczFCVmdGcnhaSjNX?=
 =?utf-8?B?WFE4SzNwak1td0NsSi9RaWVIdllER3EwbEsxVTQxN1FwUnA4bS9GcGtBSUJK?=
 =?utf-8?B?SnE3a2xTMCtEMnZ3cGZhVFRMNUorUjQvMitTQjRnSFNXNTN1UTltMTFTRlJ2?=
 =?utf-8?B?aHNIMFJPY1RSWGR5MS9Cd3pXeUFYV0tIQ25VbUJUMlVHK2RzdDlGc3ZtQkpi?=
 =?utf-8?B?K0kyUmhVeC81MmRCQ2sxcGhmWTEvYVVwRHlhVXo3WDNEM1V6S0pSeDVSTXZP?=
 =?utf-8?B?cTJYOXRTYSt5V2EwL2JJT2tDU0hhamhlK3ZxMGNjVGcrTXY2emJkbDVJQ1hS?=
 =?utf-8?B?VGFiNHpRSmt3MlVwREFjd2FXWWZwdUd3bGJoaVR1aVJFdnNVeGNFVC9Obitr?=
 =?utf-8?B?QVF2eGxKNHEwSHZUaTBaemhFZlB0aldwVzBWTVpwZ1pHTm1zS0V1Zm5IR01h?=
 =?utf-8?B?K2ZSWDRXbkpyYlVkaTlCQ0Z5TGtPVkdYbmZkWGhpN1Y0NU54UWZxSXF6clBL?=
 =?utf-8?B?Z3BCeTlLSXBOY1h2MWloRDNzV2FKNnBxR0RURHVsajY5NjhNZ3F6TmpnTXQ2?=
 =?utf-8?B?NXFNUkZWQndobFoyby9kSVdpOHJCckY0cUppNzVjUEs0ZmUrenRTUjBFQTI5?=
 =?utf-8?B?ek5rWjUwdXU4ME5MWTFaeC85b1h0Y1A1SnJRQ2xpcnBMU25FZ05XUkt0Mm1P?=
 =?utf-8?B?WEFEdU5nVXNtcmwrcURpdmhRQ3Z0eit0dUxQaysrMzJPWDBTWDN3QlRHcHhM?=
 =?utf-8?B?d1Z2NERNREczOEEzL2t5VzEvMTllSWlwc1hpY1NkV252aVBhQkVaRWNhQTh1?=
 =?utf-8?B?YjZkbGowQXU3aVRRRlk2cDFVYURncEpRajdsQ1k4RVY0WE95N1VWK3ZlbzFI?=
 =?utf-8?B?dGNyOWQxYU5idjFjaTZFL0lLUHhmZm5WckRTN2FMbUx4a2VHVU1XSmEvT0tP?=
 =?utf-8?B?WWlQbnhSM25KSFhFV2RUYW1NM3U3aDZla1FTeDJiVkoxOHVkUTh0MXRMYzk5?=
 =?utf-8?B?ZlU3YzRSTlNvcUVtQjc0SmhEcnMyYzl1WVNTbWFPYVlSbzNEZHBhNXJBN2Er?=
 =?utf-8?B?SXVtVGFmV0ZTSHlpeUJMNXZmSy9BTlBiTzVtYzFVeFFGcVFOTUlodlg1VEUx?=
 =?utf-8?B?Z1JCZVlSNnpCMEF6N3paSERISnVSTDZEdSt0TWttdUtQL005cFd5bU5qdEpI?=
 =?utf-8?B?NCtLRU01TmxYSC9CZ3VLcDNHUGFDOWZwMmh4UFpoNDVBWXcxazZYSTNLeUVC?=
 =?utf-8?B?aVEwalVBYmtTSks5bEJ1N0NuTzNsNVpVWDJYVVE4RXA0S2xKdW5IOVNqekQ5?=
 =?utf-8?B?b0Z3dWw1akx5ZHJxN3NZamM0Zk9qVjgzMXdJbmVWS25la1NITS85TXNqYkx6?=
 =?utf-8?B?S2ttZnQwa0NEQS9Ua1REZmxjMUk5bzh1MDk3SUtuejlRWEpzcUtiT05ocFU3?=
 =?utf-8?B?ZDJIRWtmNSswTG5GQ0YxK3F3MVVjc2krTmtRclNtY0kyc2VZSk5EdU5jQmZ0?=
 =?utf-8?B?YktrRnAvUytMSEZaSnA2L2NvcnNaRTd3Vk1IZW8zNFFWTDYwVlpJTTN4TFdV?=
 =?utf-8?B?SlFDbGFnMUlLUGdMTFFnZmV3K01rWU5xNEdXK05yc1ZsSXlYeUtDOUJrdUhq?=
 =?utf-8?B?TXBVVDNHY21ZaE1QMVdxMWlyS3FRalVnamwrOS9Ebkp5QTdzZzY1WWs5RDlU?=
 =?utf-8?B?NWhrZFcyWlkvTmtobDl4UUt4UTBaalYvMjVyS1RxclZvczh4WUlWZEtYNDh0?=
 =?utf-8?B?VU1OdkNuOGF0RWhESFdvbks3R3RaaFVJUFhHRkVTK0NWbm9oWVpKU1FpT3Bi?=
 =?utf-8?B?dTNUbWtGTVErdXZtMU0zN3Q4OWlKaGw5emt2WU10WUMvS3E2dTFveSt6UjB4?=
 =?utf-8?Q?QLAR/V2LnAbKKmWk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1440426a-00ae-4838-e461-08da29eb5523
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 14:19:54.9909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BvoL+DAQlcVU4jSrIPk8vz6SDwPmkHTgmhI4qc1KLJXAPg6aETV1QsA+NoyX60KDHMDa82x9T9Nzi9r+RVGxSm8X3G2xft9WGt8mVHg4pCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1698
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
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

On 2022-04-26 11:58 PM, Pierre-Louis Bossart wrote:
> On 4/26/22 12:23, Cezary Rojewski wrote:
>> Audio DSP device supports D0 substates in form of D0ix, allowing for
>> preserving more power even when device is still considered active (D0).
>> When entered, certain domains which are not being currently used become
>> power gated. Entering and leaving D0ix is a complex process and differs
>> between firmware generations.
>>
>> Conditions that disallow D0i3 and require immediate D0i0 transition
>> include but may not be limited to: IPC traffic, firmware tracing and
>> SRAM I/O. To make D0ix toggling sane, delay D0i3 transition and refresh
>> the timer each time an IPC is requrested.
> 
> typo: requested.

Ack.

> I find it odd to list all kinds of criteria but only handle one in the end. Do the other matter, is this a TODO, unclear what you are trying to say.


Good question. Firmware tracing code is part of debugfs.c file which has 
not yet been shared. But all other usages, not listed here, come down to 
invoking enable_d0ix() or disable_d0ix() whenever given operation blocks 
DSP from transitioning to D0iX.

Other usages such as directly accessing SRAM (outside of IPC handling) 
is non-existant in the avs-driver. When IPCs, most firmware generations 
take care of toggling d0ix for you.

>>   int avs_get_module_entry(struct avs_dev *adev, const guid_t *uuid, struct avs_module_entry *entry);
>> diff --git a/sound/soc/intel/avs/dsp.c b/sound/soc/intel/avs/dsp.c
>> index 3ff17bd22a5a..2f18b137ff42 100644
>> --- a/sound/soc/intel/avs/dsp.c
>> +++ b/sound/soc/intel/avs/dsp.c
>> @@ -152,6 +152,15 @@ static int avs_dsp_get_core(struct avs_dev *adev, u32 core_id)
>>   
>>   	adev->core_refs[core_id]++;
>>   	if (adev->core_refs[core_id] == 1) {
>> +		/*
>> +		 * No cores other than main-core can be running for DSP
>> +		 * to achieve d0ix. Conscious SET_D0IX IPC failure is permitted,
> 
> conscious failure? what's that?


Any IPC failure which does not end in firmware throwing an exception or 
failing to deliver the response (IPC timeout). Sending response with 
status=<some error> is still a valid response.

>> +		 * simply d0ix power state will no longer be attempted.
>> +		 */
>> +		ret = avs_dsp_disable_d0ix(adev);
>> +		if (ret && ret != -AVS_EIPC)
>> +			goto err_disable_d0ix;
>> +
>>   		ret = avs_dsp_enable(adev, mask);
>>   		if (ret)
>>   			goto err_enable_dsp;
> tatic int
>> +avs_dsp_set_d0ix(struct avs_dev *adev, bool enable)
>> +{
>> +	struct avs_ipc *ipc = adev->ipc;
>> +	int ret;
>> +
>> +	/* Is transition required? */
>> +	if (ipc->in_d0ix == enable)
>> +		return 0;
>> +
>> +	ret = avs_dsp_op(adev, set_d0ix, enable);
>> +	if (ret) {
>> +		/* Prevent further d0ix attempts on conscious IPC failure. */
> 
> ??

Same as above but as I'm not sure whether '??' relates to comment above 
or the usage of 'conscious' word, I'll add to that:

To improve user-experience, we block any d0ix further d0ix attempts if 
even one SET_D0IX IPC fails. Audio can be streamed just fine without 
d0ix substate albeit it might not be as power efficient as with 
transition enabled.

>> +		if (ret == -AVS_EIPC)
>> +			atomic_inc(&ipc->d0ix_disable_depth);
>> +
>> +		ipc->in_d0ix = false;
>> +		return ret;
>> +	}
>> +
>> +	ipc->in_d0ix = enable;
>> +	return 0;
>> +}
