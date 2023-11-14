Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E80807EB781
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 21:10:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B01ED74C;
	Tue, 14 Nov 2023 21:09:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B01ED74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699992646;
	bh=r3vurwFuaZ4M58+vzKVzSzpyzS403sgOWrdWSJwrhuE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DP8R5AHDvqegokMAWsnqA7ENDsZcC3Ln4Fxj3AIE6zInpbI+kIliNFz/OgUV77EUn
	 C5Ro8Wt5o+HYZL2BZH9FbN8ArHd8Bc2s9oZ3+DsVqkK2R5RtQIwDyxwW2gW4IbW7zG
	 0bu9NVbmeNcIBLOYTCGtEhHYL+yLG9XJ/8c4XJDc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33027F801D5; Tue, 14 Nov 2023 21:09:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE481F8016E;
	Tue, 14 Nov 2023 21:09:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82582F801D5; Tue, 14 Nov 2023 21:09:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8F8FF80166
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 21:09:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8F8FF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RarCTV/d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699992583; x=1731528583;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=r3vurwFuaZ4M58+vzKVzSzpyzS403sgOWrdWSJwrhuE=;
  b=RarCTV/doF49HLR34DBpbZMBS3dKP0mIXFdjIU+m1dG7IlC0vQawMl5s
   6oECHcrA2Koh3gqR8G21o2zCBjv89eKbFrDLSVYiavuJI+EgpFpvGHSp0
   0S41kH4FfjNLJcxQ1b3k+d+nMDB2R42s7rj2J54ntgdw5TKHksAVSn4LY
   cAuQ/5jxYzwxR4AcFFXMct+1zXvnV4eIJ2isZxYqQMN48sK2j+jOlJMW0
   mvoJ2PcTtUeXFW10VER3aj7AgaSTq9IfHPg75smGFfWPM1rFz1my/RQch
   XC84c5OpmnBY6DX564yzhgCFmcasmNjxIFZD952XfxMJoa8/7ozUNha5K
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="476958888"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="476958888"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 12:09:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="938236268"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="938236268"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 12:09:37 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 12:09:36 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 12:09:36 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 12:09:36 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 12:09:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQ7M259RZw2Oo+lblgSoW26qO/Dszak3KRkX9s/WumSQrtRW5qKpAf5ZfHbYqrMZZO2dWx7R3O8vGBoMBCkpH9auU7IvR2AFHfs0xwSePuYCalKoLaqOxm+ERGCSGsCWatkn3XWfprrQkcthm3a7xAUPJ8GKS7O4/m18FtCvcRhuRAoH/PJaUba5tq+WJBig2W7PaWcFZbi5d9LplFFx5+Lc4mNN0nicFssHZx9PvvVP7lqxNRtP/9ryysughcwRi+Jmb9tSpWGbDoeFJeiYngAnV+UmFwtp84F4yw0DjPvGQxyjZuEcMJ8DvIuRtp3KdOhWu9Qz+sKvLmkCIH9PfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCEck+oFv3OZsxm2ELX1ZzIUaOgJyVLu1WdgLKi+8/w=;
 b=XGlcqmNxyH2T33ithVTAt5pbqFgzFk/mcNRGScorIipBIv5pMqrloOpCQVvVQay6SAHX0cXq3fUomtR/Tie9IOfL3R/uDhKiEgdonNcax8LCDMpDBD69a9eGtp2Fb+p78cZiLyQr7BRLz3P55ToRK0mDboYtp0SlDTRiFAbR+ZeWobZl0u18jBtBYPOsfGnGR0triaAQnjY3YIXTt4wFQZrQnJbc+0tVo75spQqL2sqehVrkqp9cxKwayMpz+fc2nKxGSFxIZjYzEgmc/otc/I1NY0M1SnHg3oA9qSECP+YFze+PGWqSxFgEfHYJcDvxrPijJ3pK0LAf2n7zqzeSDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MW4PR11MB6713.namprd11.prod.outlook.com (2603:10b6:303:1e8::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Tue, 14 Nov 2023 20:09:33 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::ecc0:2a4e:16c3:2019]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::ecc0:2a4e:16c3:2019%3]) with mapi id 15.20.6933.026; Tue, 14 Nov 2023
 20:09:33 +0000
Message-ID: <cd4dd449-1fc5-8b2c-e453-1e137f370a53@intel.com>
Date: Tue, 14 Nov 2023 21:09:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 01/17] ALSA: pcm: Introduce MSBITS subformat interface
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>,
	<linux-sound@vger.kernel.org>
References: <20230918133940.3676091-1-cezary.rojewski@intel.com>
 <20230918133940.3676091-2-cezary.rojewski@intel.com>
 <be2ec481-fb35-52be-0847-199d446b6431@perex.cz>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <be2ec481-fb35-52be-0847-199d446b6431@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0361.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::17) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|MW4PR11MB6713:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ca7d5e-957b-4fa5-9796-08dbe54d9e60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 6VziBHO+UMxkWC7qi1jahCnE6BrzZ7HdTWKxEEofOijBVbT77MzEbpOfd+PZiCUMS0BhFbos1jXzrTPiZjTkelzh/1qdZMgcIzmde3lG+smHdciYfuwnSrtqxi2hJyXLYEtqEyt+9KYw8CgNi1PwKK4PS7BjbV45o9+szf9UW135cCd290V1AmST/ilPEYsxmNAfpZX4ZcBC7u0CwTnhSkGbqHXWLmvW2ruU66hM1ckBb/5sqa8RDNp3Ybf3bmDLEn9ocmRcJh9+i5v9O7+NNNAtEeiMHUbtOFtJPrDY/DmwWQL+hFZ1TUOIkOp0cs2eqJQTWb1gmnLQGHYqXKH+chVvwUudA4cWL7J9iFXmak1cToujxRLXlG1jMWJIJEp9luOY/Xcvc+9p1pKKL5/wNAgJl0DzEsnSN2Fhh/oYReNlVMYfZPQlh0woJgL7PceJ2TpXh1pQhTl5f3gBa6n9mm+LDu8knoBKyXgy7qb8sv/r04KusMXim8HfDH1Y1+2PLqwbLaWPw+VqUNfsBxV5fjXeMuYBqEIM96CPKrstrjyU+WBpC0BNpM1W+B9XQeszyNK4mDG3MPf4kXWpU4TscLSZ6RZTTGBdHirupxOiUvUA6oA00hzEuDMiDgbMxvHdUIHZasfVl6+s+mQdeW1Xow==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(366004)(136003)(376002)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(26005)(82960400001)(38100700002)(41300700001)(2906002)(5660300002)(6486002)(478600001)(6512007)(2616005)(6666004)(6506007)(53546011)(8936002)(4326008)(44832011)(8676002)(66946007)(66556008)(316002)(66476007)(31686004)(36756003)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?Ymx0bmhRMExWdUNSRXdNZ0ZUZ3EvNnNZcHF6RU1OTlN5a2xWMXNTbVdMYmc5?=
 =?utf-8?B?TVgzdFMzbk9GNkhrczJkbnVhZjlMWTJvZFdieUtLRTI1dDZZYzFaelBZV295?=
 =?utf-8?B?Z2hUV1N4UHZpU3Z6RmhPSVAzRHcvK056YVBwbGRsMm9RaGxoZlI0RldDSmMz?=
 =?utf-8?B?WDVUTHJDN1FyVTdRTS9uL2lYMXpQZUZqU1N5WTJscEdPUmxsV0ZLR0o4aVZy?=
 =?utf-8?B?ZmZRcjdmclBSTkxvVTdDY3VqVi9VUEZFSmpYdmFpNERKOHhjY3g2Q0h5QnhM?=
 =?utf-8?B?aUF6cURnV2EwMG96dGxMeWcyU1NHa1RPdm5tM3hGclNSZE9TODNJSWY2NGp1?=
 =?utf-8?B?NFEvci9HNVk5bGpLT3RCajluUmNmMnRvTDdzekFaQWRhQ015Y3g0VWdrRVJk?=
 =?utf-8?B?aGpuQmpSbUlBVllQaGdGRm5obEVIdjU3RURlMU9vNklYeXZSTUI4TWhIODlo?=
 =?utf-8?B?MHZlSFRwVWJCMjBqTDRYS2FmU2RUbXNNQ0hzWmZKMGJGZzYrRXZ4Q3U3Ny9H?=
 =?utf-8?B?TUlnQ1puWWlrdlFrZC9Rb1hDVHc1Znk5eXFzNWNERTJNM3JkdUtYVnJud2Y3?=
 =?utf-8?B?RGdlRTZxOE5kYlhkSHNuYWdNVWkvOGxQN0Y5WGozQ3R1b1BGSE5sWnFIUFJa?=
 =?utf-8?B?VHU4NWFxcnlpNzJDOWdXOXlaQk9tZGs3cGIrS3VXaUQ1ak1jeExIUGo0MHFw?=
 =?utf-8?B?a09XNDdoUDhoMTZUbWZ0YnBoa2xGOHQxYURvQUhJZzBYS1RxM0xWVHhUQTZK?=
 =?utf-8?B?Z2RnMXFrWENGK2Z5aElkZGRLVFFiYTNRUXd5bGgwY1NUUzB3b1FQVHd2emlK?=
 =?utf-8?B?dGFRY0dYdmlWckw5ckF4dkN5SlVCZzlocGJDTXNkd2pqTE1lSHkzYUpEZUs0?=
 =?utf-8?B?cCtWVGp0bDJKYTlvMGtuZ2pKSVhaeVU5WkNQSkNVcG9ITVBYcllUYURlUlI5?=
 =?utf-8?B?UklQd3lkZkE4M3FZVDQ4bFlYbHJvK3EzbVE0dTBxNURhV0lTUFd3ZGE1cWp1?=
 =?utf-8?B?Tm44dWdzdFM2cXJJaXd0Q0tvSVEvWE5yVlpsTW1QdjBsQXhkekZNYzJzbWtl?=
 =?utf-8?B?U25PcDNTZW5FYVBIR0ZGUnBKNHFFaGdEdUdnLzlWelBZS3V0WjlZK1ZNSXNR?=
 =?utf-8?B?d05Zc21GL0ZSa0VnamZQT1lBOW5qVFFlUXJqNlhxcXlocEhYaEkwbEhPM1Zt?=
 =?utf-8?B?d2Z4am5Gd0xna1h5cXN3SkJ1U01WTDlmSXdnUjB2UDNpVkRmVEZUWmt3SDNj?=
 =?utf-8?B?MXI3aHNZZ3NGa3d1TDNtZzBSZktkR2xnUENhV0JzS0V3NFlWZkZDL3hnTTk2?=
 =?utf-8?B?TURPNmVLTG90amk0Y2h1clpuTUVPQld0akFWSFl0OHZWZmpoVEloeHJrWVNu?=
 =?utf-8?B?eTd1UDRxWVUxZktlU2p3cXNMMzZQQ3g4azNZaGxENkFIeTF2aFZLZitDeW51?=
 =?utf-8?B?OWVjVmZxaU56RzQwSEdERDdHWWVja1FuSzI5dG5QTXFRTjlsVVQ4SjlwL0Uz?=
 =?utf-8?B?eEMrN0V0UDhKTTN6Smw3ZUxkNmo4VWJORjhKVHBCRmF6N2xNS21vMWhTUDhT?=
 =?utf-8?B?NlVYQkhWN3lyYzJqUXdUaFBaR2VweDAvaGQ1d1lvK3AyTHpvNnBLRGhJbGk2?=
 =?utf-8?B?NktqMzQ3dEdIbWUxWVRxRUJCRWY3NU43MmFtaUhvNU93a1FnMUkxN3EyUTVj?=
 =?utf-8?B?YVRobXNRbnVHeER4Vk5lMnFVRklmOHQ1NGpPYjhkTW9mM1ZkQlF5UGlnTHpa?=
 =?utf-8?B?ZlF1UHVJaXFVNmE3MDlJUTJtZzJwUDFLdGtMdnRYNlB3VS9nS0ZiMFRETTN4?=
 =?utf-8?B?b1BsTGJiczY5QVlveWdjS3AzeEZiSzljQ3ZzaVBmMlpiSXFKckovRk5NWE0v?=
 =?utf-8?B?cmtjNCtvVUs5MEFTN0gzam9rU2QwYWlHYnNqQW1BSVVNaG9lN0RXV1dPNlJh?=
 =?utf-8?B?Q1g0SjhlYVo5UnVEMytCeTE4S29ZeDJteUdnQzhvSGJWVmYyUmorblNkTXVS?=
 =?utf-8?B?REs5KzJqRDlWcjcyVnJJZEFFMnJ0enZ5RUhSNlJtU01jdXQ4T28wWm80c2Vr?=
 =?utf-8?B?TVRkS2Rab2Irc0l2WEZ2ZGFoeHMrYS8rSEtGd1ZSQnlCbTN2cWVMSDdJTTZP?=
 =?utf-8?B?TE5KakZreUVwUkVBaUVNd1VOZWtqRE1Sc1daNDdqK3hoNmc2RklobDFPdEdN?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d2ca7d5e-957b-4fa5-9796-08dbe54d9e60
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 20:09:33.8222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 JPdCROAv1KPoiZG1IcG8BcakjxAKtqAfc8Asjx9ArupRap7fQoz+olEpKZPWQNDfKAt6tR1jvmFg8igKqKj4xU/D7HPjRkUw3/4XoDEPmww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6713
X-OriginatorOrg: intel.com
Message-ID-Hash: 3FPQPHYRPWJLASHNCWES5KOG2EEA7GWX
X-Message-ID-Hash: 3FPQPHYRPWJLASHNCWES5KOG2EEA7GWX
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3FPQPHYRPWJLASHNCWES5KOG2EEA7GWX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-09-21 8:25 AM, Jaroslav Kysela wrote:
> On 18. 09. 23 15:39, Cezary Rojewski wrote:
>> Improve granularity of format selection for S32/U32 formats by adding
>> constants representing 20, 24 and MAX most significant bits.
>>
>> To make it easy for drivers to utilize those constants, introduce
>> snd_pcm_subformat_width() and snd_pcm_hw_params_bps(). While the former
>> is self-explanatory, the latter returns the bit-per-sample value based
>> on format and subformat characteristics of the provided hw_params.
>> snd_pcm_hw_copy() helps with copying a hardware parameters space as with
>> introduction of subformats the operations becomes non-trivial.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> 
> ...
> 
>>   struct snd_pcm_hardware {
>>       unsigned int info;        /* SNDRV_PCM_INFO_* */
>>       u64 formats;            /* SNDRV_PCM_FMTBIT_* */
>> +    struct snd_pcm_subformat *subformats;
> 
> I don't think that it's required to add subformats to the hardware 
> template. The new constraint can handle subformat refining without the 
> template modifications (pointer to map table is stored privately to this 
> constraint).

After iterating over the feedback, modified the field to u32 and all the 
handlers to acknowledge that it is S32_LE-specific. I agree with 
statement that we can expand on the API in the future if there's demand 
for it.

> Also, I miss the constraint handling here. Without the constraint, the 
> new API is not functional and it does not make sense to split the 
> constraint code to other patch.

Ack, merging the two.

>> +int snd_pcm_hw_params_bps(const struct snd_pcm_hw_params *p);
> 
> This may be probably inline function. See bellow.
> 
>> +    kfree(runtime->hw.subformats);
> 
> Do we really need to do an assumption about allocations for this field? 
> The driver may use a static structure. No problem, when this is not 
> added to runtime->hw.

This code is gone in v3 since there is no need to kfree() a u32.

>> +int snd_pcm_hw_params_bps(const struct snd_pcm_hw_params *p)
>> +{
>> +    snd_pcm_subformat_t subformat = params_subformat(p);
>> +    snd_pcm_format_t format = params_format(p);
>> +    int width;
>> +
>> +    switch (format) {
>> +    case SNDRV_PCM_FORMAT_S32_LE:
>> +    case SNDRV_PCM_FORMAT_U32_LE:
>> +    case SNDRV_PCM_FORMAT_S32_BE:
>> +    case SNDRV_PCM_FORMAT_U32_BE:
>> +        width = snd_pcm_subformat_width(subformat);
> 
> This is not a correct implementation. The width should be returned for 
> MAX subformat (== snd_pcm_format_width value). See bellow.

snd_pcm_subformat_width() returns 0 if subformat==MAX and fallthrough 
ensures snd_pcm_format_width() is returned in such case.

>> +int snd_pcm_subformat_width(snd_pcm_subformat_t subformat)
> 
> This function should probably have two arguments - format + subformat to 
> return the correct information. The MAX subformat should return 
> snd_pcm_format_width value.

My intention is to have two granular functions. One for obtaining 
subformat-width explicitly and the other for calculating bits-per-sample.

>> +int snd_pcm_hw_copy(struct snd_pcm_hardware *hw, const struct 
>> snd_pcm_hardware *from)
> 
> This function is not required, if only the constraint function handles 
> the subformat refining.

Ack, removing in v3.
