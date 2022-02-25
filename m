Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C384C4E0F
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 19:51:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC63B1EEC;
	Fri, 25 Feb 2022 19:51:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC63B1EEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645815111;
	bh=3fD0KvfDasSvLmArDvSUm4UT2LMGC7/j6WM9v7uMk1w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iMgitSPvGAUun68JDaFFY95ft8+0DMSurvWv/oM9ewpHCu1G/PWeTlt7ugIz0eNjC
	 xXOwBgmPSKsNuANVpWizy+eOQI3IKmPk9GaVRfqisW8QHaxQBbnyNg8M5xNu4VUSRz
	 olguZ8tdziUzPEk3IdY0AdG8u4DfFD5LZosYmpaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D872F800E1;
	Fri, 25 Feb 2022 19:50:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE81FF800E1; Fri, 25 Feb 2022 19:50:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0089F800E1
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 19:50:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0089F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hzjLRFry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645815041; x=1677351041;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3fD0KvfDasSvLmArDvSUm4UT2LMGC7/j6WM9v7uMk1w=;
 b=hzjLRFry6eUV/z4/x77YL9HxMuDrSQD1vRR3uN57cLABI1nqUDoN7k48
 43OOx+HoG3yVjVC9g21PWrgmYlqwuI/DZn/kgjiSBiEr30u7a/V+EgdSi
 l6+h2iL4Dc+YRo0cV6pPJWZ/oqGRzzAGfb8CpWrJL2755VisZYVNY92/L
 UyRsDVTupTbiBGEuK1CTxvw8HJ2pmVmguKs7sbenDhk44cEG1iTodixvl
 jOu72sUFsNSJV/+rvm+QUt8giGDFt15X2Wpqr4bYhUlPnLVjLODh7w2Zy
 egw9NUfwDPZ0l4Pnrq2yHnpYCsPzZkY1l9vfJgyj2tZVwRLqXgV29cqFD A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="338994934"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="338994934"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 10:50:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="638326403"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2022 10:50:33 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 10:50:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 10:50:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 10:50:32 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 10:50:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5SJYuy5H5it9qmztuPphtjvjnhVXGnPBYvz7QwU0dOaRt27is0nQhLY6Og6jhIphkdnt7OQm/hp/g+tp6cmC5YWO58NV9fO0dVDNkRyaHxpFa3LmP8DXTO+QOXSffSdwL1pQ1LGKCfu8wU17gcjH3j9bYg9+wlWmOTiHX89/jx1lbwBPy6X93mhycootqTmODelUV/Rmo37By5j+btRbciNM/BBrXIyO/aNP3irhPZ2PeRXNzOlrWrC2eYgiNjqO0lhfbjkmax2fkJLZblaLASjwyRiYHYswrCEZII4NpwnH+CvK74kLbomoKmXuq7WlzjL/4oAHBIDryTBOR+bhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeIf/t8MeYUyxwWsuFQXGnl0u+yDsJmcIplt4DBWHp8=;
 b=T4MUCW2aZLObFVLmP35y0Uu9N6JijP7MII8kvsp6cjm/BAEN7enT3MQeJCew8Ju9y19bf5stu+5UOJOJO+Heci1+h08Asqr19/EyCpVYxj/RDand1q06NfZNje/mj8V0CBhRBsES/BjyoJd9PowV2qUZhSgQvCLuoycl70EpYrZz8BdUYttHo3kLNwaI5sC70ui3SuMNhFAZbpin8LLAPSU7NXo0lMhlTU/g/Lqp57JAmydhFFUjCt66aMPZ73PrfeWsrm5SL8NY4sSJRkEGsmhqKPnyPu77S3DeuRf8hMInB2atozssLlptO1aBUXqAkLyHK0FrJ/4ulUXdhLlBSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by MWHPR11MB1406.namprd11.prod.outlook.com
 (2603:10b6:300:23::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Fri, 25 Feb
 2022 18:50:30 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 18:50:30 +0000
Message-ID: <d44240ee-822e-51ed-6aed-957ac9e6bf91@intel.com>
Date: Fri, 25 Feb 2022 19:50:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 07/17] ASoC: Intel: avs: Add module management requests
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-8-cezary.rojewski@intel.com>
 <e63ad06a-a583-b9f0-de00-644cbe389888@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <e63ad06a-a583-b9f0-de00-644cbe389888@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0088.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::28) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 938b2f5e-1092-4fe1-502a-08d9f88fb1cf
X-MS-TrafficTypeDiagnostic: MWHPR11MB1406:EE_
X-Microsoft-Antispam-PRVS: <MWHPR11MB140643C88A72A8234B7524ABE33E9@MWHPR11MB1406.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zz4q3r5GL+wAZkHA7BXzDBGl8Jz/FtJn68WmOtg5JwnJXhoDRR6qk8tBenjSTEzfoPxZOE59eQf7Cyw3SpLQOlaQ0biTMhB+uvkGI1bxv5DjbcwW5pj6QnSFwrnkhCvpcxmqLLKu9ZkBAfmDQjhciXbQPKNCttGI9ws4l2XIiK4HD6dfA3H8k+yhawRyMAvFmGt6z7WMhtDhUUG/HcLoL0hmicD6mk7ayDEHX5Lds2xz8IexIcfQLHrifSAw8Oj9Lht7sdFuahRh68b710Uj4N4XQxQrCRrauX+9PnIx5CAR8bht108PVmKQ7VzfCuI45H4ImgEHQf9/mlvRrwJ4T/EYmZcuY3+dnsmU1GBPyRFmtNf8bd0vodmGKWt6M5tCdWWHZkkcZEgbp2GmpWPzncZuBcI0BUfX1fC8cSir2TUV1yfv5E2aMxJ/C8ikb8lm2uzer121bGDUHaNPbAP4/M4LppXEYtOQuujDH+7Ed61ixTHSfflqjNXmaBGpG/7xjjVP79DBOaYZEqaPAMVkp7pKITh69kfaN5lBCwF6uNsJM3uXwCOmWgqQ1ymCLUSeD1SJkUh1cFCvWqnIAS6R3Cab6w2leUBGb8SQjyinabck4j7RtE4bCO+GFL7QG5TC/n6jnftd5mSjVl95tJ6qyovBABV4g6WfM13MjgsZ19c1lg6GHiYNAa+MQcTeM4bBdHRafnByC/TbuN7J9S0LyPfroKkSVDbFVE2FTML4OXZUBGswHc4PwPRgVwrJalDd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(36756003)(83380400001)(6506007)(38100700002)(66946007)(66476007)(66556008)(82960400001)(508600001)(2906002)(6486002)(2616005)(186003)(26005)(31686004)(31696002)(86362001)(4326008)(316002)(6512007)(5660300002)(6666004)(8936002)(7416002)(53546011)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEpvWGlSVFhRWkVvY1NsTEplZkpIb2VjcHRTYWlzdTFvTUNUMGpqb3ZZbllC?=
 =?utf-8?B?SHJ5d2RwWVZxbkpjeXRESllJdzNoaFlTOEw2Tm9UbXk1b3pVNHMwcjg5d1oy?=
 =?utf-8?B?WXBXTkJSZkd6TDArTkd6MTRrcC9kZTIwcjVjeGlQOWhlRzYyYW15Y0toTWFP?=
 =?utf-8?B?NVVWQzU1M2Uzam9KNWF4eDlnTWxuWmkxYTFlczdEQ01xV1F5ZnZyaFdua3RY?=
 =?utf-8?B?dEZ5ejlncExuTktRclZWUE5uWUVJd0IwZ0VmT3ZWQW9sa2hGbGh4elNaQlR4?=
 =?utf-8?B?WUIvSVlFMWx1S3VMN20wWG9HSmNtUU9CdUtJV3VLc3AzV2twaXNreTFTV29a?=
 =?utf-8?B?T3lmR0xTZ2l3c1BNaU9xRzRSZFQ5UTNmOEZKamFKR1BLV1JZWmFZR2ZZTXRz?=
 =?utf-8?B?VFJzSWlDN3I1QzZHRzdPT1pQZ2x4RXdxaHp4MEtrMnZNMngwdWg3TmtuYWRk?=
 =?utf-8?B?NEFGR25LSFQrN3Qwdjk1VWRxbDk5R0dDak5uL0lNWTR3SVg4Q1RUbEp0R2Zx?=
 =?utf-8?B?aTB1MFN0U3VZbUdiQVBXSWNlamZwa3dxdmE1Nlo5R29GY1dIZ3BXaTR3Wmp5?=
 =?utf-8?B?bVlpTUxQOVRtZkpBOW1WWFRJNmx3cFp6MUtWQWd0ZHFuaWgrTVBFd3JMQUZ3?=
 =?utf-8?B?S0Exd0l0aExmTGF4Y3VxeGZCMmVhay9KL2xtV2xRYkhVYm1KSGdHcFFtdnkw?=
 =?utf-8?B?VzlEc09ZdTRqYU54L3JHRVpZd3VGK25zNU9kSy9FcGxlQTBwbHBjam5ya2Zu?=
 =?utf-8?B?Z1dtUzY4SHRjUW9JZFAvNTJqbGF3VlhYRWJxL0dhbzhUMnVHM2prQlJCd28r?=
 =?utf-8?B?UE5sSTNzb091d04yaW1IRFdWRytUdktVSDdxN0pPNVpZSDJPOU5ZalVrTU9C?=
 =?utf-8?B?dnV5RkRTMWpzRE5ubGR1VlFrVThwNWdBNEFPVXI0M2tqbFVkcm9IMkpDUjI0?=
 =?utf-8?B?dHU4M09EZy95OHBuMnhYOTl0dmdMOENHQmgzSmZnRTk5RlhjUFN6S2FnSmxL?=
 =?utf-8?B?ejFySTJwZDNQNkRWc1lVTnRiMHB2WUhSU3EvTElxOTc3TU5RVzEwM1dQRkpz?=
 =?utf-8?B?TG1EUlplZkE4eGs4UFhzRVRjby9GaStsUUdzSkh2Z1JDamcwb3RFZHNwbVRq?=
 =?utf-8?B?eG9PL2l4NVh6RmE2QnBJZ05SSUczc01QaHpFUHZCMGkyc0NkUjJVSnltWG9E?=
 =?utf-8?B?bDB1dkVVazh4dTJwV0ZTMDBwSEhlQzV4MVppb1JXWGRZZDRudCtSVlVxek1E?=
 =?utf-8?B?blpwaFA4UkFlWnpFMDVpYmsybjlHcnhKWkYycmVkWU1lSm1yZDkzblhlTTl6?=
 =?utf-8?B?MzNwOTJaM0c0aTA1SGtHZ2l5R3VROTZlU3NIa2U5MGppOXFSUjZ4dno2M1ds?=
 =?utf-8?B?YTBLbWJnaWlHM0R5em42U0VOTE43OUdBTFhUREM2Z2kvMkxWWlFMSi9yeVRq?=
 =?utf-8?B?c2hQdTNzWmtKa0paa1lFYkZYTDA2WlFqcms4Yk1MYWt3ZkhaTThNTUorZDVM?=
 =?utf-8?B?Y09pS29rN2lJQ2dCbGI3dkhKUjR6c1pzai82OExmcHFoL2J0ZzVGTmJoZk5E?=
 =?utf-8?B?S2grRi82bHpHM0FnRWNaVlBKcWpINnNnR1ZFbG14Z3NwWFBuZ0N5ZTdXQnJy?=
 =?utf-8?B?OElWd1BOelpVS2x1WXJHOTM4RGVhbVRHM2RuT0JQSGpydmxySUpGZkcvZ3Nj?=
 =?utf-8?B?TmpZUCtTRDdYUmxiUzJvdUNXYm5zNE5BaUJwQTF3bCtKUllOT2RiS3BqRDV1?=
 =?utf-8?B?ZFlGb2puNDcraVcvc0VYNkJlMzZFNGtSTThVTEY5RzdUWGc1SUFuWk1KOEhx?=
 =?utf-8?B?WGIyc0pWSHNuQ2d6NFVKN3ltSzB3cVNUOWsrK21zOWFXN3JmdjZVVFZHSlZK?=
 =?utf-8?B?R3ZGU3BOejlGVndjMWxjVTJESzk5MHlwT1lJeUVjZ1JIRk5JNWR6aVcvd1BN?=
 =?utf-8?B?NXVwaDh4LzNhT25ZYTdiRnVzdjVOc2ZiWm5KU3hrZDhnU0M0dEdCc0lIU0Z4?=
 =?utf-8?B?TnR5SUcxVnVkWHlNQmhudXVseFIzUUNUSW14MUp2Q2M4WWlxaDh2YkpqdzhD?=
 =?utf-8?B?c0xLeENCTjZEdzQrOVR4MEtYdnVCNWpmME1LNW1QL3VyMXhyMTB4aGszUlF4?=
 =?utf-8?B?dGd2RmtFcG1zV3Btb09vdjFPbUo2dEVUeHV5M1ArWUFqUTFtRjRDYVNPM21G?=
 =?utf-8?B?RE43b2E3VUVIanVubW5kRnFxR2t1T0p6b0JsN1dOQ01NZ05vTU1NbmFwU0V5?=
 =?utf-8?Q?m7ZQZRcJH0uFw3cB8jU7+T9CYRxhMSprpJpa2ZO9jo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 938b2f5e-1092-4fe1-502a-08d9f88fb1cf
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 18:50:29.9457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FfUL5bxoiCgEeGDUBN4WWuBUNK2D6rY2bSuDPMCuUN9RE0PuebiWovLVwGsLiTAZOYN2KWyTvi5WkVeFQfMSSdKSEIsYeiUsM1xo3WKwqO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1406
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

On 2022-02-25 2:27 AM, Pierre-Louis Bossart wrote:
>> +int avs_ipc_init_instance(struct avs_dev *adev, u16 module_id, u8 instance_id,
>> +			  u8 ppl_id, u8 core_id, u8 domain,
> 
> you should explain the relationship between ppl_id and core_id. It seems
> that in the same pipeline different modules instances can be pegged to
> different cores, which isn't very intuitive given the previous
> explanation that a pipeline is a scheduling unit.
> 
> The domain as a u8 is not very clear either, I was under the impression
> there were only two domains (LL and EDF)?


Hmm.. such explanations are supposed to be part of HW or FW 
specifications. I don't believe kernel is a place for that. Fields found 
here are needed to provide all the necessary information firmware 
expects when requesting INIT_INSTANCE. What's possible and how's 
everything handled internally is for firmware to decide and explain. 
There are no if-statements in the driver's code that force 
ppl_id/core_id relation so I don't see why reader would get an 
impression there is some dependency. What's in the topology gets routed 
to firmware with help of above function.

Just to confirm: yes, you can have multiple cores engaged in servicing 
modules found in single pipelines.

In regard to field name/sizes: again, these match firmware equivalents 
1:1 so it's easy to switch back and forth.

>> +			  void *param, u32 param_size)
>> +{
>> +	union avs_module_msg msg = AVS_MODULE_REQUEST(INIT_INSTANCE);
>> +	struct avs_ipc_msg request;
>> +	int ret;
>> +
>> +	msg.module_id = module_id;
>> +	msg.instance_id = instance_id;
>> +	/* firmware expects size provided in dwords */
>> +	msg.ext.init_instance.param_block_size =
>> +			DIV_ROUND_UP(param_size, sizeof(u32));
>> +	msg.ext.init_instance.ppl_instance_id = ppl_id;
>> +	msg.ext.init_instance.core_id = core_id;
>> +	msg.ext.init_instance.proc_domain = domain;
>> +
>> +	request.header = msg.val;
>> +	request.data = param;
>> +	request.size = param_size;
> 
> isn't there a need to check if the module can be initialized? there's
> got to be some dependency on pipeline state?


IPC handlers found in message.c have one and only one purpose only: send 
a message. Firmware will return an error if arguments passed are invalid.

Also, note that ALSA/ASoC already have a working state machine for 
streaming. There is no reason to re-implement it here.

>> +
>> +	ret = avs_dsp_send_msg(adev, &request, NULL);
>> +	if (ret)
>> +		avs_ipc_err(adev, &request, "init instance", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +int avs_ipc_delete_instance(struct avs_dev *adev, u16 module_id, u8 instance_id)
>> +{
>> +	union avs_module_msg msg = AVS_MODULE_REQUEST(DELETE_INSTANCE);
>> +	struct avs_ipc_msg request = {0};
>> +	int ret;
>> +
>> +	msg.module_id = module_id;
>> +	msg.instance_id = instance_id;
>> +	request.header = msg.val;
>> +
>> +	ret = avs_dsp_send_msg(adev, &request, NULL);
>> +	if (ret)
>> +		avs_ipc_err(adev, &request, "delete instance", ret);
>> +
>> +	return ret;
> 
> same here, can this be used in any pipeline state?


Ditto.

>> +}
>> +
>> +int avs_ipc_bind(struct avs_dev *adev, u16 module_id, u8 instance_id,
>> +		 u16 dst_module_id, u8 dst_instance_id,
>> +		 u8 dst_queue, u8 src_queue)
> 
> what does a queue represent?


In firmware's nomenclature pin/index/queue are synonyms when speaking 
about module instances.

>> +{
>> +	union avs_module_msg msg = AVS_MODULE_REQUEST(BIND);
>> +	struct avs_ipc_msg request = {0};
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
>> +		avs_ipc_err(adev, &request, "bind modules", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +int avs_ipc_unbind(struct avs_dev *adev, u16 module_id, u8 instance_id,
>> +		   u16 dst_module_id, u8 dst_instance_id,
>> +		   u8 dst_queue, u8 src_queue)
>> +{
>> +	union avs_module_msg msg = AVS_MODULE_REQUEST(UNBIND);
>> +	struct avs_ipc_msg request = {0};
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
> 
> can this be merged with the bind in a helper, the code looks
> quasi-identical with just two lines different.


We had these two coupled together in the past just like you mention. 
Lately we'd decided that having two if-statements (one for message type 
and the other for error message) just two reduce file by just few lines 
is not worth it. So we chose the readability over small file-size gain.
