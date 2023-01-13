Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67856669569
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 12:20:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90DA0A7B1;
	Fri, 13 Jan 2023 12:19:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90DA0A7B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673608840;
	bh=4+1E7pxPBPC8tQ0plFPQLJuByghFl5q8XJvk60G0lBY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=g3mcPjTY9RdGcUo1LKMYZNYKJ/SUMvK4AjCy3geVQCFayOAi89/CUUfQf0Ax96kGJ
	 kw4OJkaRaOLQZHs2SbYtgUpQD6URyBdp6FYrqBSX1eSRWTEe6jHQeKtBdqNuhWRSaJ
	 JsFX5Ldp1Iy8qmtNnsse3kpGv3MuVi9l/J3w3fSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 016D9F8019B;
	Fri, 13 Jan 2023 12:19:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B601F8030F; Fri, 13 Jan 2023 12:19:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D72C6F8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 12:19:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D72C6F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VEtfS+Yw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673608779; x=1705144779;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4+1E7pxPBPC8tQ0plFPQLJuByghFl5q8XJvk60G0lBY=;
 b=VEtfS+Yw3VyC0r2n0aMzf18+3Y/SK8Tp98Lh8WI6X3wnaeLDLU3VZ1VP
 0jo9E/neCFTg4CaeS5WNoGokqU2Msa5yPfihUci2ow7XVWMUxrZlDtyG6
 c0ET2w2Mzph4LaGMhprRELbtWdjf4FHHWLRQ7hJSLcFreWXjr/zk3TFbN
 1yC+kypP1Krjpj4H8DDE82O9Ic9Pcfx/XQXmBo+JQ5traP+mqUQ38+YKz
 PW8nNQqlQ6HNHuLOFE99vHGqX9yna1UcVkYeSVg6DXL035WyGTovGzCgJ
 Njpqo5FTi5u9qoY1i/NRIh6srQVf8YvH+DNgwmHeE7cM2cGCFzRYstIPA A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="324031741"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="324031741"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 03:19:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="800571003"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="800571003"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2023 03:19:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 13 Jan 2023 03:19:35 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 13 Jan 2023 03:19:35 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 13 Jan 2023 03:19:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Msn28erkJBk3/BlKD1V2Pj++y7Yo4NME97AuIBWJOuScNZPYONzyjA2nnN2a2Syqb3oG6fHIdGAgG6tNS1nqIczl4FvcavmNQOh1LpF9pYHLkfR4f8mXNXAvB6koZzRILxSOgc+nsI6aeEJZx71stQtF5lJ8JKbXbg8DRW1TNhaqHIuV6zB0HBPCNzcSovnhUlzM+y9K3w7FROX5PwMT7zqM5pZDGGyvNqyDNvOvjuHMvG3hsX5rrpi8Z1XiGmSTmDl08ZvUUY6M9xUBmoJugInGjzkq2kOY4ywx7nk18hN4S1FD65xT+LZqnX7G2uLqXwBrcy8F/bK3bjtG7LdHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7TlDd6MEGpDcb3KsZT9CXJNr9xp9/XEx3qocHb/6d8=;
 b=XaREOtBHzJu4r/htP+J3Tig1tTQWVxNkYKqRFIt5lvv29mErzPXCxuGYL7/ZSk1WxEsgCCDvgfSAsZZrXxFjjwsw7bEKx6iJ6AuCwu8e2uaHQBx4ySBFjRORSdvvdeqyS/Wv7AxPnxjPpS6M+UKvKEpvZeIaGFlnB9JzzGcjMk7YIo0FAFl1b6S8llCyv1mC2ePvJqgTlJR7+bRoigDgLnUjwTPGUohkROHRrL3vCQZQvep0QOX8HdhsHYK5337C1Y4kETM2rHPmNmrx42AArjsri2jH+6LxxE4o6W61cV5wEBZsJf5uiyyToMoisT3VujmTtjab0nf+yqL/z+Ew2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SJ0PR11MB5038.namprd11.prod.outlook.com (2603:10b6:a03:2d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 11:19:27 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8%3]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 11:19:27 +0000
Message-ID: <04ced85c-5a09-31ea-8e55-3d91c0a790b3@intel.com>
Date: Fri, 13 Jan 2023 12:19:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/3] Fixes for avs driver
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20230113190310.1451693-1-amadeuszx.slawinski@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20230113190310.1451693-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::18) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SJ0PR11MB5038:EE_
X-MS-Office365-Filtering-Correlation-Id: b0f8c5b0-b59f-4ecf-3165-08daf558086e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yu0evdr1rtKL7HmJm6SgxJ3tShC/hnIfUNsLx4qgUk6LYPqBahpjd5B8huxy0jBQLkDkuHTMXfSYlEm4Wx5JU/znGK8+oLvmfl80TJziQtvWMUpulP8SUNd0QZrKWHVKwKSSzC581iQ2F5OwbpiA7iVNa3oTlWLoh3o+GxiNIKa+Q3GsF0xDJMLvgT7qlImEKjs5fyn1rbTUAecZ23VjctWy6cmaC532S9TaA7K7Ub8iYuYtqUQqy3u/bIBPR5997VNV/RqeOn9FnBipt6rRCJ03vmS0Y7fOi24LlaNy4kaEAIjIHSN6+qFOQDwiSzB7gZA5YpuwQ3erSXMN8oa1nyajZQJw1ZyoVWE9mwJcn2ZBEtnypkHyOZeSv4dO+2eqcjHfcjlljCASr6UKbhBO+LSkQf99I+z4ThiYyYmv+0hbI+7NDkbEiXmP/RfFeLGKKhfIpQQLm31Qpr7GI8BhUp3eyvD/hnqoUcr9Vm6Q3ZHPHNZycdw3TUTfGpI1Dq53/57zCS9uu3XFxOemKrKUbdAZ8mO0m2RpRnkyYMCxrK7fi/u/F2BRd/jTQ929KlL/fAUXOtj3BiyAlldpEsIc6igDc6756AMhhZ7eQZWZxDLoHfAVeUpF3+gaJtrjgMkOqCegpc+I0/Bdt/Qy21pDxVLYpVi3wbnvzMKEFtrLVtTPwWSx4uwW//yGoN1t0bWYOzn11OgF6rNRDc0PYa8jpXclt26qiTT1/XebEqQYJjY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(376002)(136003)(39860400002)(346002)(396003)(451199015)(86362001)(4744005)(316002)(26005)(6512007)(186003)(44832011)(478600001)(6486002)(5660300002)(2616005)(83380400001)(66574015)(41300700001)(31696002)(54906003)(66476007)(4326008)(66556008)(110136005)(66946007)(36756003)(8936002)(8676002)(6666004)(53546011)(31686004)(6506007)(38100700002)(82960400001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0JPbS9GbnhEQXNuZWM3bW8rTXE4bFRZbjJyK1p5dGt6UDUwdU9mN0gwYmJL?=
 =?utf-8?B?akJZNXJwemdONHIvMXQxRDV5Yy9zRUFRVWZ0WE1tdzhIU2QyMjRUMnRtRkFI?=
 =?utf-8?B?UTVPYjQzcmlhNVJFQmV5Q0Ixdmc3UEYrTHRaN29ONE53UkFKa0NBQzUxUExU?=
 =?utf-8?B?RkJHS0o0RXFPam5aREg2b1IyMDIyV0FWMldzM2gwNFNJTWpOZWluVkdISmNI?=
 =?utf-8?B?elcxZFFWWGxEWDRsMDRxeWl3VVhpeFlMcWlXRnRxSzFJMy8vc092MWM1dTBs?=
 =?utf-8?B?Y1NhWVErNjZvVW5EM1BBV3pwYXJxcTJhVGR4TytoV1pOdnB0S1JEMUlNNlIw?=
 =?utf-8?B?bU5hN1NYVituQ2dyYUdkbnpPRERRWlJsL1NEYjJBa0kydWtUTWtQak9lZndK?=
 =?utf-8?B?bkora2RpRG5FYlJPbzQ3RXVBdkMzdkl5SGZVbWZFU3U2UFpndk5RbnVuTXQv?=
 =?utf-8?B?MkFwdDJPZGVqS0FqQm1iUnpOUlBQNXhTc2ViV3hLd2x6OGl0aXR3TGpnNTlL?=
 =?utf-8?B?WUxjQUJWb3Vod0s5d1JWTmJRUndsbGtudmN6eEhmdEhqcEdYaE5tMC8ycWd0?=
 =?utf-8?B?WWNZVEtuOEJPUmNZeHltRm1LblNKejY5Q040SE5LdjMxSG5kTnQ4UEFrWlQx?=
 =?utf-8?B?dHc0YlFBSHhCSFFEQVQrL3prcWUrditjcEN0OFdVdndiWUJoT2FrZXpZN0xS?=
 =?utf-8?B?ak51NnN3bURUbUxpa3FLMHg4SmU1Z3IzV0htMnlocnMvelZ2TzBxdkFTbXBN?=
 =?utf-8?B?UkZvSDNQYjVSaXhHa3ZyMHVkZGpGQWlxLzVCUTRTN2N0TGh2aloxNFh0NENR?=
 =?utf-8?B?VzlpbEEzMlN0V2xqMjc1NlA3RFFab0VxY3BEYURmVFNMNll3cURiSW8vSDZH?=
 =?utf-8?B?TzBEbmJJQ0pZRmtqUXJkYTN5ZVYrMlU5MFB4QWY3ZE9uOTRsaWRTT09YKytV?=
 =?utf-8?B?SWY1b3gzQVp0TkdJY05ic0R1MWl0Z3JNOEtOL2U3dzdqYkFpSFIyZUZ6eVV0?=
 =?utf-8?B?WCtxVGFrYTlWbVQvUS9KY0EvUTJDYURNdGptSVJEa21QMmMxZWtsMmdoQWhz?=
 =?utf-8?B?OHg1MllGa3pKN1YrditGMncwTU14ZEN6L3I2c01wS1l1ZjR5M01wWDFkUlVK?=
 =?utf-8?B?SzNCSlgvZ0M1MEloZXdacXcvU040YzYzQ0d4TTF1WG9lcmVHeGFrQjdCRi8y?=
 =?utf-8?B?YzNEVU1IbHlhMG8zcjB0UlRTUUd5VmtORjYzV2FuNHRzZjJleHpmQlU1VU9U?=
 =?utf-8?B?aFdYeXA4TmNkWGwvTWhpZ3dLNmlJTTRvSWdISzVpN0x1Si9vTUg2ZG5qTVFi?=
 =?utf-8?B?cmp4RkIvTktxUVZUMDI0MEN3ODIrUHI0Uk41L3Y1b0RaM1V2UTdjbk1hTVVT?=
 =?utf-8?B?RTQ4TW1LdzB5aWFPNWJDbGlaM1hacUdodmYreWxkL0xjdkhWNzNrWC9QYmFQ?=
 =?utf-8?B?b3dQOVAxQlBmdUJKR0lwV3oxTGhmMlhHdUV6STRCNFdhdFVESVpZcHQvR1Mz?=
 =?utf-8?B?bkxwazJIQ2liVDcwclJTMDg5Z3VBTTdwbmVUZFNmMnhrdkQ2VGpPSXU2UXQv?=
 =?utf-8?B?emdQQmZmK2VhK2VCUmZnMmhkSmVXV1U3YUkycTNzK2VPRUZEeDFYaElVR2lj?=
 =?utf-8?B?eXVMNDUyQk5pVVlva1cyZVc0b0JDWTlVNWhUdzdZNVhoNERDR1I1YitjeThB?=
 =?utf-8?B?TURXMEx0TlVVT3A3VlFNalNIZ05uMTNxcURjMTlWNU5DaHRwVmZWQ24wd1Ay?=
 =?utf-8?B?MEFuV1I4ZkQwOXlhTndOb2RzUWtaMUpJdzVOajZSQW1obVV2aWRZVmtVaTRQ?=
 =?utf-8?B?OXhGenZLejQ3UjM5VkhWUTRkendJL0JRME5mZmlvKzgxL1RmZTM1YjhmZUtI?=
 =?utf-8?B?RGtFR01CVEZjZVRNbU1HTHJVN0JjMkJYRGNTNHFFMmtiUzJoWXRUaEYrYnpJ?=
 =?utf-8?B?UElDVy9Qc3R1QWhBdVhicHd1SmczNk0xem9JOWFGblR1NTJaNVdGekdhWHFB?=
 =?utf-8?B?ME1McFR2NkhxblAwZ09odHJocnpINWc5dVByaHNtMGZOMElmcDlqZmtBeDJz?=
 =?utf-8?B?dEE3MGN1Qi9oMk42NnhGbkU2N3VsN2pGV1VSMFdtcFZwT2EvcGc3NEZsYWtu?=
 =?utf-8?B?WXRZYVNCeDk2V2Z2UUNRdk5VSmlCalN2djFaL3h2UXpIWlB4di9jd2t6bTBX?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f8c5b0-b59f-4ecf-3165-08daf558086e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 11:19:27.5900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZy5JqqvsDSq/yNAcXLMiGbetx9YYrFhzMQ5oisKb5v1ObPB2AXdqKIwjezxSxHFXxvlygw2thN2yFTmUC6j9yoYqvd+7VbdhjlcYSPkPs8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5038
X-OriginatorOrg: intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2023-01-13 8:03 PM, Amadeusz Sławiński wrote:
> First patch fixes problems reported when performing shutdown. Second one
> is for a problem reported by LKP. Last one fixes problem reported by
> checkpatch.
> 
> Amadeusz Sławiński (3):
>    ASoC: Intel: avs: Implement PCI shutdown
>    ASoC: Intel: avs: Correctly access topology fiels
>    ASoC: Intel: avs: Use min_t instead of min with cast
> 
>   sound/soc/intel/avs/core.c     | 24 ++++++++++++++++++++++++
>   sound/soc/intel/avs/topology.c |  2 +-
>   sound/soc/intel/avs/trace.c    |  2 +-
>   3 files changed, 26 insertions(+), 2 deletions(-)
> 

Series has been reviewed by me internally before sending, so:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
