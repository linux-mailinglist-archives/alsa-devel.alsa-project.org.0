Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 164777A4AEF
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 15:57:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02FA4886;
	Mon, 18 Sep 2023 15:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02FA4886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695045433;
	bh=CsdgAPpSGEh4dLv5qMItCF8+R3qcv3+jFO4dnRhWVHU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H1eV369hTORKBB8K3iW7mqbsg1XzX7cCTPlTFWTF4eF8q+xmoFnmQXSjZeJbOzEEJ
	 1ZjHcHL49/MuQC7C1tbRHmDQ7LMoS2FFwoy2UO8fS7KQ2g+whhVny/MuwFzP9Q5r8X
	 B/pNGnXv+X5vMtqAWuPjcH3tRGvf8VAJGitFLfnI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89DE1F80125; Mon, 18 Sep 2023 15:56:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 393E0F801D5;
	Mon, 18 Sep 2023 15:56:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9C0EF801F5; Mon, 18 Sep 2023 15:56:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E6F5F80125
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 15:56:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E6F5F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Q/X80zy/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695045375; x=1726581375;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CsdgAPpSGEh4dLv5qMItCF8+R3qcv3+jFO4dnRhWVHU=;
  b=Q/X80zy/EVPEX3c7NYEKMcVqSIQK+rTHYlUQ7OoBK4+gBzOwcAJUtjlo
   jAeCoMUwNQwHJrMqWjSaH5Jnb7kcd/T08vOQ6hgDL7fIJbxDi+FS5rB/8
   uNpYthkRWL5UvDNwtTqqocHsk1ysTcJG7nIsgRGci2zXCXfqYozjYpdFF
   WT8p/mgmp4bA9xIlw5lYh4ou+6RrxGmc7KsszvblRxxE+l9t3wKv7GMTX
   TIDxg/5f27lajDHo8jDbaJVlzZrDFtY5eyEZOMBrzvgC4z2P1SxbNWVVg
   umvRdAnyGxUldqTU7+iTOU/pcBhT1EY5GR5Pia0oXYV1nMOzvQTR9bZT5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="382401874"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000";
   d="scan'208";a="382401874"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 06:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="722472001"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000";
   d="scan'208";a="722472001"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 06:56:10 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 06:56:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 06:56:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 06:56:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 06:56:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQ2baoV0U4kkXgA2Z4gnviFgxro6OBy71zY2DbBXI1RQhOtUhUD4N8hlHXUU3RhRB17nIkomaFq12mz+Sfwyq8QeyCe6oLLSWa6jrCauCFN8f9GmqWd7jkx4IoZsvWW6YKdoDQTXJjyo/MlOF91cxudJO4pekK3OEyosmI/XvZ8mC2V7w8Q7kDLa3zPiEA/VCbe7uCDx9/MLSAwHzz/tzbDlCO84WzYOlH2/guJjPjfOSPxAID3/SDnRRRdLruZ/UNIMzNzd12/LktdjvtmWPKUD/TjSacBAXc+Nl5BWm9nlEI8XRDnm4Lvxm83LFjjSdYkWx6FDGqGaHoJTB2akkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkpfKKPg0r6ZvjE8h11yeQUEVKa8IZG9olmy8kac95U=;
 b=gliAuV2ybsoYV15yleHBpMbuNougzXWw7pTL6pUnNwAbwVqjXMOl4rMe5coKqGE/XQ2zGX8ePfXs4wN1iXo23aX5WShFz4sDb/sp2GeSPfkuu94KuYtH/6nKbVmNRT6ctZi5F1Kd13/LhZz86xS1Y7oe+60bCYvrHpqIZLekFKKSeR5qJX8N6RiXsm0m1UCsrIt0M5AwgQZOEoTmZptMwR7mlswRR+hJ6MwfryRKvKorUOF8YU31qIApC+1OYICynM/PoCf1GXr+4ce6m9dBdUbq817alN8Cg0iza6TUbq8+EnFPv7nSSrXjIv1E2ut4jnOVJT0WEt29W3rgqJvtyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SA1PR11MB6760.namprd11.prod.outlook.com (2603:10b6:806:25f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Mon, 18 Sep
 2023 13:56:06 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104%3]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 13:56:06 +0000
Message-ID: <63b3eb26-3a76-5993-bd65-c3461a264b95@intel.com>
Date: Mon, 18 Sep 2023 15:55:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH] ALSA: pcm: Introduce MSBITS subformat API extension
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, ALSA development
	<alsa-devel@alsa-project.org>
CC: Takashi Iwai <tiwai@suse.de>
References: <20230912162526.7138-1-perex@perex.cz>
 <fd153436-d128-c1b9-dee0-ba03224fa013@intel.com>
 <f7dfdbd9-b8c0-fd65-1280-256e9a82fca2@perex.cz>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <f7dfdbd9-b8c0-fd65-1280-256e9a82fca2@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0397.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::18) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SA1PR11MB6760:EE_
X-MS-Office365-Filtering-Correlation-Id: 693ccfbd-7abd-4760-0aa3-08dbb84f00db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 wqfyjPuFElQCdL/mYiPqd5mY9QSGVxPOJFUvDAzgOpruCXueIZnulpmhj5zWsiT8ktsWIy6BK2HjIDpweWyeKFmYlM9vyo6j4NhOEAi2nV8zeHLYrl+N93ZCYOfAcPQtNW4HTfxmqhgoS0/kbb7fVK6CzLdqyBD8Kx/Va5FlwnoZc7p4w7Zv+kMAeYUdF0MA9w4SjnhewZaF+W7QFqGPalWEhHfoTAysrmkOfP6Jb8w99SQna9Eenwz8dc6D9RSfQe/DweNaPdOT4qxOerCK+/6bTSau8VRMyn5pThSA96JVKxVxB2cSknNdZUslKEyWHOJ9JBzrOC0VNSdtIlWFzsDMqW7V0OCSFItJXDhnO9dKKdZiEWp1/915zfkVtKtjU3ILKqqGllQQ/uJ+8bUb9ZW+UQtX4jrTfgQccxWs9EW9mSoh+dG0A9iOHuAw9A/hJ35gJe1RchlHXgUZ/o6ffCHdUTdmGKMOIH2cuxNcI6Qxoze/d/hy6DfRHPnoGiDbg1ohUBfq30+asReSv04m87ZuwyYV5PEKTdct3E9ofL3UeGiguevtJwo9146RpFGIrscfm4WOQyNYhcbddSuRZ7orqKqEtKd+vmbDuQInTmV4qLZwx6P05lGpUBK6LfNkbAVZ+rUXied1UM1AmKUxVw==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199024)(1800799009)(186009)(6486002)(5660300002)(44832011)(6506007)(53546011)(86362001)(316002)(6512007)(66946007)(41300700001)(38100700002)(66556008)(66476007)(110136005)(6666004)(31686004)(478600001)(82960400001)(8936002)(2616005)(8676002)(26005)(2906002)(31696002)(36756003)(66899024)(4326008)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?VUx0UVFROUxQYkx6eWt4V2dTenlLRFVkRytJT1NkaEtNbXg1T2x6NERjQk1T?=
 =?utf-8?B?am54VHR0SzhxdWFEYi9KSUo3N0VtbExVTUxOOEwzZ3pGUEtlR0dxUFN1a3Av?=
 =?utf-8?B?bjFQcmFwek1LQ2w5WXY4ZWNwR0twZzhRZURqLzhqMjBybC9FTCsyRDhmUDJi?=
 =?utf-8?B?V3puU0JhemxJT0J2VVdyWE9YMHAxQ3l6eDRDeEFpamlsZG1YQWhlTE5Bc3JE?=
 =?utf-8?B?cjl5V1pEVmF3aitzQm5iYXUrbDBOa2Z4bkN2WURZMklUcG50dUtiNksrRHA0?=
 =?utf-8?B?cW5ldWpXYU5CcHpQR0REQVRuN3l0Wk8wMVVvZ3g5RkN3a3hPVVUrMXFTcTEv?=
 =?utf-8?B?SWR2QVNWVXdheDNjcCtUV202eFRBeEh5YUdrM1V0MldkQ2g2djdIaDF0dFZy?=
 =?utf-8?B?b2xLamZLZTFGSmtRL0JFa1k4azNZTGxzQzdmOHdSMlZNNlFmbGRHdG9DNDZH?=
 =?utf-8?B?MEV5RTdhTHAxUGE2dHpyRThlR29NcTl4OGJPZnJKMXpiaUVHTWdVSVNpRFZX?=
 =?utf-8?B?b2ZadzRGc1RIUVBIVlRlaVgzaU1rVWl2RjFFZnhFQ3c2VDdnRUZ3NUlsOU9C?=
 =?utf-8?B?c2R3SWp3S2JLVVhkenN4SHV5ZHp1c3FhbmoxbnBBV2hqMFBqdXNwYTgxdUVq?=
 =?utf-8?B?a1BrTXkvaFhYTWYyQWxTWmt2NXl2aDNhQ3htMDZiSWZJazhVTnYwWW0zZGdw?=
 =?utf-8?B?OUw0QVJ3ZWduR1ZzUmZuYm1zNzBGYnhwZlgrVTFvbDJ3OEQ1emJuOTFTay9Q?=
 =?utf-8?B?d2lSaXpGRnQyREs4cWIzMGw2U1RLaDJrUm9Rakw3MFVMYmRVVjNJU2xZbnVT?=
 =?utf-8?B?MUpzL2crTzN4Z3MvRGVaSzZXSGplTHdiQjAyeEE0TFlkdzJQU0JhOFJTQ25Z?=
 =?utf-8?B?NEUzQk5XZXFXc1MzSmdRZVBkNUFmTm1TYTBmUzlCVldPRHNMYitvSUZSMko2?=
 =?utf-8?B?ZWZvNkFkSUQySFNZa2NyUTg4S2U1QlFQbFRmNVhYUnhRZmNuN28xbmREUjlF?=
 =?utf-8?B?U00yQm5hcXFvUGEyN2h6MjVkMnF3ZUR4ckdURGNsNnVsY2MzU25JOFRHdWtV?=
 =?utf-8?B?TnFNNm9IU0FqdkNwSUMwN0g0QmdlU3dVVXlGKzBJT2cvZVJGOUt4TEpGQUJw?=
 =?utf-8?B?Ym80WHBhWG1nMjZFbmF3OWoyZ2Vob2ZKS05md1RodzlKUkplZnU3dWVEWlk3?=
 =?utf-8?B?ZW9Eakx6WWhNem05L0J0RnA5UUlkWkIraHBDVkFqTjRpb2IrZmFBeFpnUFp2?=
 =?utf-8?B?SjBpN0JRZllHYXJEOG9KYWtLSDh4bXZXTTVPWENHZWZjMEd0QkZ4cUU4b0dr?=
 =?utf-8?B?b1BaS2tZN2dWTjlFU0xuWUVGdkg4eHlwMXpZRE5KS2JsemRpdmhvaVJieUhy?=
 =?utf-8?B?c2FWYnZBcSt6MGNiMEJlb01HOVpSTGhodGwrRnczU1hoeVBEeHlCMHhQOFZ0?=
 =?utf-8?B?THdUbHIwK2VQbVdPeXM2czBGcGdPb3QzcFJWSWtaSXBTS042ZFM3WFB1RklV?=
 =?utf-8?B?d2RlQW5LdDY4YkVGWEd0TmlhNlZmcW5MeEZWR2RMSzlnWFlRbjZ5TkRORG5k?=
 =?utf-8?B?R2xmZVNDc1RTV1cyQis5VjF3aERtWlUrb3E4aGVlY3ZHL1BISEdKc25RQVRN?=
 =?utf-8?B?QnRHNkhaOTQ5SHlLK3ZKclk0aUYyNS9BdkQwVlJIZWp6Y2RwOVR5cE51TjV1?=
 =?utf-8?B?L3RZeW1iMmhORkhhckN2bURyMnlwejdDelhoL1RNeWp4WTNScEdVL0JSSXQ4?=
 =?utf-8?B?NU1tYVZGZEVKZVc5bEdaeldTdFh4RXVUblcza3Rlb1ZyMjdLTVhRNy9uSkR1?=
 =?utf-8?B?L1pXN25ZZ1hIMkwvQy9pYlo3RExVd2ZraVBJdXR0cnlIZlFZUnNHMVQ3dTNy?=
 =?utf-8?B?KzZRcms5d2VBWGk4Q2VKVUZZR3NoTkcxSXVZb0p1Z0Y1YWpCQlREdzBvQmsr?=
 =?utf-8?B?VFVnVlhFL0Y1QzkySmVmOTBkYzFNSk5DZ3V3aTN3VDVvRXBIV0huTGhaTGRH?=
 =?utf-8?B?SDJMKzNGRGtNQzV2OW5tRGJEclNTckRHalExcjhoT25IUGlUSjduOTlkUnI4?=
 =?utf-8?B?amt1SHZtdlJ3N0NIZ2hmU2h3N1d4Q21yV2NEMjE2OXBqYjdlWHpGaDJGeUNS?=
 =?utf-8?B?cmhFK3dnNHd4MGxEQ2pDWGQ2bHp5OFNxMWtXdldHWFUyOUJHdXZxK0E1UDJ4?=
 =?utf-8?B?WUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 693ccfbd-7abd-4760-0aa3-08dbb84f00db
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 13:56:06.0619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 553h8FW8L2wZrA69nEYZmueK7ZMZTv6QjzQcqPP1hotZ3d8ni1UkJvmBdCMUMGtSg9hLaiiZLFgKQ1cvK8PnWFEnrZgrPpBuSAUZPJkAa0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6760
X-OriginatorOrg: intel.com
Message-ID-Hash: NN6INQ4OKPJJJEBOVYWFQ7GYLACBAZKT
X-Message-ID-Hash: NN6INQ4OKPJJJEBOVYWFQ7GYLACBAZKT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NN6INQ4OKPJJJEBOVYWFQ7GYLACBAZKT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-09-13 10:57 AM, Jaroslav Kysela wrote:
> On 13. 09. 23 10:22, Cezary Rojewski wrote:
> 
>>> +struct snd_pcm_hw_constraint_subformat {
>>> +    snd_pcm_format_t format;    /* SNDRV_PCM_FORMAT_* */
>>> +    u32 subformats;            /* SNDRV_PCM_SUBFMTBIT_* */
>>
>>   From what I know, we are dealing with u64 masks here. Why u32 here?
> 
> It's not true. See the removed code which calls 
> snd_pcm_hw_constraint_mask() for SNDRV_PCM_HW_PARAM_SUBFORMAT. Only the 
> format is handled for 64 bits and the handling of other bits is purely 
> optional, because masks can handle up to 256 bits:
> 
> #define SNDRV_MASK_MAX  256
> 
> struct snd_mask {
>          __u32 bits[(SNDRV_MASK_MAX+31)/32];
> };
> 
> Because we used only few bits for SUBFORMAT, the 32 bit code is enough. 
> We can expand this latter without any impact to the user space interface.

Thanks for explaining. I must admit that this "balance" is confusing 
though - up to 256 bits are supported, yet depending on the use-case, 
size is lowered for optimization reasons.

>>> +static int snd_pcm_hw_rule_subformats(struct snd_pcm_hw_params *params,
>>> +                      struct snd_pcm_hw_rule *rule)
>>> +{
>>> +    const struct snd_pcm_hw_constraint_subformat *sf;
>>
>> What's 'sf'? I'd suggest to be more descriptive here.
> 
> SubFormat. The larger name will not make the for loop more readable. The 
> function is small, so reader is not lost.

Decided to do a "mix" of shortcuts and explicitness - fmask for 
format-mask, sfmask for subformat-mask and sf for cursor variable.

>>> +    snd_pcm_format_t k;
>>
>> Internally I was utilizing 'f' as that's what macro expects in its
>> declaration. s/k/f/
> 
> Copied from pcm_native.c - snd_pcm_hw_rule_format().

I understand but this is not a technical argument. It's clearly more 
informative and cohesive to utilize 'f' in place of 'k'.
The aforementioned function should be updated in the future too.

>>> +    struct snd_mask m;
>>> +    struct snd_mask *fmask = hw_param_mask(params, 
>>> SNDRV_PCM_HW_PARAM_FORMAT);
>>> +    struct snd_mask *mask = hw_param_mask(params, 
>>> SNDRV_PCM_HW_PARAM_SUBFORMAT);
>>
>> So, the reason I opted for 'subformat_mask' and 'format_mask' is that
>> otherwise reader is crowded with ambiguous 'mask' and its relatives. I'd
>>    avoid shortcuts when multiple variables touch the same subject.
>>
>> s/fmask/format_mask/
>> s/mask/subformat_mask/
> 
> Too long, the function is small.

As mentioned above, decided to do a mix instead of ignoring completely. 
I value readability much, and I believe many on the list value it too. 
The combination of m+mask+fmask is confusing at best.

>>> +    snd_mask_none(&m);
>>> +    snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_STD);
>>> +    bool found;
>>
>> Suggestion is to add newline before declaration and execution blocks.
>> Also, why not reserve-christmass-tree model? There quite a few variables
>> here.
> 
> Yes it should be shuffled.

Ack and addressed in the v2 series.

>>> +    pcm_for_each_format(k) {
>>> +        if (!snd_mask_test(fmask, k))
>>> +            continue;
>>
>> Similarly here. A newline would effectively separate conditional
>> for-loop from the actual execution block.
> 
> It's questionable.

A so-called blob of text should be avoided. This is not a trivial part 
of the code. Least we can do is flesh it out a bit plus provide a more 
self-explanatory variable names.

>>> +        found = false;
>>> +        for (sf = rule->private; sf && sf->format != 
>>> SNDRV_PCM_FORMAT_CONSTRAINT_END; sf++) {
>>> +            if (sf->format != k)
>>> +                continue;
>>> +            found = true;
>>> +            m.bits[0] |= sf->subformats;
>>> +            break;
>>> +        }
>>> +        if (!found && snd_pcm_format_linear(k))
>>
>> For my own education, why checking if format is linear is essential
>> here? Perhaps a comment?
> 
> Subformat MSBITS are valid only for linear formats, aren't? It does not 
> make sense to set MAX for other formats.

I cannot deduce any comment-to-add from this, so opted-out of adding any 
comment.

>>> +            snd_mask_set(&m, (__force 
>>> unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
>>> +    }
>>> +    return snd_mask_refine(mask, &m);
>>> +}
>>> +
>>> +/**
>>> + * snd_pcm_hw_constraint_subformats - add a hw constraint subformats 
>>> rule
>>> + * @runtime: PCM runtime instance
>>> + * @cond: condition bits
>>> + * @subformats: array with struct snd_pcm_subformat elements
>>> + * @nmemd: size of array with struct snd_pcm_subformat elements
>>> + *
>>> + * This constraint will set relation between format and subformats.
>>
>> I do not believe 'This constaint' brings any value. Reader is already
>> aware of it. Starting from the 'Set' part brings the same value with
>> fewer words.
> 
> Copied from snd_pcm_hw_constraint_msbits function.

Again, I do understand the origin of this, but this is not a technical 
argument - if something can be improved even when copying, we should do so.

>>> + * The STD and MAX subformats are handled automatically. If the driver
>>> + * does not set this constraint, only STD and MAX subformats are 
>>> handled.
>>> + *
>>> + * Return: Zero if successful, or a negative error code on failure.
>>> + */
>>> +int snd_pcm_hw_constraint_subformats(struct snd_pcm_runtime *runtime,
>>> +                     unsigned int cond,
>>> +                     struct snd_pcm_hw_constraint_subformat 
>>> *subformats)
>>> +{
> 
> ...
> 
>>> -    err = snd_pcm_hw_constraint_mask(runtime, 
>>> SNDRV_PCM_HW_PARAM_SUBFORMAT,
>>> -                     PARAM_MASK_BIT(SNDRV_PCM_SUBFORMAT_STD));
>>> -    if (err < 0)
>>> -        return err;
>>> +    if (!runtime->subformat_constraint) {
>>
>> I'd try to avoid another special-bit in the runtime space. But I might
>> be wrong here and it's unavoidable. Let me ask though, why cannot we do
>> the constraint unconditionally?
> 
> This is for a special case when the drivers do not set 
> snd_pcm_hw_constraint_subformats (all current drivers). In this case, 
> the default is to handle STD and MAX subformat bits.
> 
> This constraint should be applied only one time. So this prevents to 
> install it twice.

I believe we could avoid special-case approach. Have a copy/intersection 
helpers in place and utilize iterations-with-sentinel-entry. Provided 
such in v2 of my series.

> I'll send v2 to address some things from this discussion and kernel test 
> robot.
