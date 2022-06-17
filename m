Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EB754FBCB
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 18:59:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C0F61B3A;
	Fri, 17 Jun 2022 18:59:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C0F61B3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655485190;
	bh=XeWPi9KnIkm1SxmD/QKfkzP8dcyKBUiYD34rDMXyUPk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eEDP3f1boz+y7w5KucdUc8Dyd1FXuLKmMxeufxLyoUeCZIrZJWL1LFacRts8cMb9T
	 OEVsgNly2SAfoH4JBH09kbGNM7dapwqLuCatvFeZhx1m2S8TRfC4cgkRB2gIiCqZ8I
	 Dp7I04xFNvS+WdD8fqVp3GcjeFE/MeJbQR+ztc9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52968F8052E;
	Fri, 17 Jun 2022 18:58:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4BD0F8052F; Fri, 17 Jun 2022 18:58:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24EEBF8051F
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 18:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24EEBF8051F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VWOAgW7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655485095; x=1687021095;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XeWPi9KnIkm1SxmD/QKfkzP8dcyKBUiYD34rDMXyUPk=;
 b=VWOAgW7pvSzvNAQdv31NnLyHJxwvPp+PD6FNslctDLtfzQCy054MeKb5
 XzEh9w0vuL5sVyr0ggrWQJbM3RYN9B+JjDUWUVLniTgSRSptftkSDk7p9
 dcBvvMhFF+77BMwYQvPdFKea1KR8eNX5u/u/Q0S/8QG+RUQ0HHKCms1yF
 hgOuY/NI4vKzDlLmpTAUOjbmAHXnP4ElNIw6uMvGXyBH1Z2Tpo8/qBYzO
 SxjR9o7FIo9lDsgnc3k04UoYi4iHTVCL7sa+POd0dfvJGfVfpgOpgaaA4
 9VV9ktV3eIzbER39T8ZNKPNzlboaYUvZgzufOfnUzDe5Ih0en4RLvvHxn Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="259937688"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="259937688"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2022 05:21:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="713756934"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga004.jf.intel.com with ESMTP; 17 Jun 2022 05:21:34 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 17 Jun 2022 05:21:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 17 Jun 2022 05:21:33 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 17 Jun 2022 05:21:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 17 Jun 2022 05:21:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OjGpfJ8eoJac2h1wiTutHhoW0571EVN2RFW6yFeWEkQJ9dCvQKb2Wufw//oKKeHXSmPqxsUHbSNAlGo2bKe6a0XRK05s4ocN1SVGbgeDRaP0tzIgU9eYhQsqB8s/Hz0fHnnrfyGYmoa7bWykSN0ZH/ebMKy4f3a5c0EcViOcRLGr3JoOy/VgTqxLwBlDuoVpAc4v7XumxU5dp3iBw4ft2ynZCVqWnhARqYq3Ecx5aVhK8R8sByPKYcNM8jj2kXP4JNgnxWdobBBROHBSZWMaa2uaMBuHw/mam2C74/kRSn6cA8CWB4wG9JxWd4u//bXw5obr9rUIUcdPHHpu7crQxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V88ptSv3gDkDa3csqh4jGeKQWtChKPAxc8QXDCEPKaY=;
 b=mJjcFkD5NFM97WRPHUccTAFU0k9Ed3FzLZDJhrhL4kVlVap22kBsDW7XAIFYXvPy7ZELODcRUc7+smGfJAKVdX3oknLRpB066uCP4Jk4ERoNknr9UeV2qB4agC1Ius3D+C0gASLBYlxIop/mEn/wTGvSZPn/h3MnMpIKayntcdZRDh86MMd7bq8nwC9cdBYY2eAf1k2gTUE7mH95ME9qBloTAer005R6rxipBtqSXfsTeYDtS1962R6taJIyPHObtETFKidAA/QWOaG1GfYG8QRqaNEV9Ld5KAanEWdYzCA9+SIcR5iDMMkjAmxVwi5JD73TjhEhBN8C+27j6TxFkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM5PR11MB1561.namprd11.prod.outlook.com (2603:10b6:4:a::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.13; Fri, 17 Jun 2022 12:21:32 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::a879:23a2:1836:2691%6]) with mapi id 15.20.5353.016; Fri, 17 Jun 2022
 12:21:32 +0000
Message-ID: <25b99462-7a48-1f8a-21b2-0e8a97e81208@intel.com>
Date: Fri, 17 Jun 2022 14:21:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH 00/11] ASoC: use pm_runtime_resume_and_get() when possible
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220616220427.136036-1-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220616220427.136036-1-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0477.eurprd06.prod.outlook.com
 (2603:10a6:20b:49a::32) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad2519cb-3a1b-4fd6-d3c2-08da505be9e8
X-MS-TrafficTypeDiagnostic: DM5PR11MB1561:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB1561E87F992374253BED0FABE3AF9@DM5PR11MB1561.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uxBHomAyb+SnFH6xrvQxducycUEGLSHxRwjSo6FBi8MrT7miEMI06wQeXg3VuAox5bQ4m28l9tieVmbay/RkMHIOR9+nZLzJw7Oa5toCWF/G/xRIlDDJ6Dr+zoeaJPKAe54+SX6tob+MdXGaoWepjAJC96ePfwe67aqpm1ttZwcZu5s4BdA55YvcthhZY1XaeuvK1knOCvgXHsKo54n3ZEr//MYJitLirsRoskGgnaR/7kSANMQ7fiNu995TollSMxZ1bqyFVTnKtCGqgbAuHIlpW6nYjF5b0uz6zHTKX5uP3m1w5bEAimS+2k1U8GlGW8IIilLAhBblUBTYRRSANqiZtP2eGpGotFVpy42oSVjn/EswV4VZl/hKOAI/LcYsPO4ivgwCFn9xpjhncEctQHHuNuvqjjFVfxeFsQ8vspyVxBj0H+Zl3rKmxoFEkR9mCH5kgPpaB1CJ9KaEDyX3Ww+wPc84qmRREO3oSAqd1ap1CqejrSSe/Z/I6O12pGpUg2XhS8laN32CaDFOBECyt/HnMJlNEk5iNQprXwpVNhl6qxZgQWPuOt+tj4wHXVoRGZr8/5b1ClYo1UZ++TjaKUiID4sSGHzx+BrXzfzUq0UEIgge959I9LZ3+9mI+2fIJd6N2j9qfKKZtN7m/8JMtpnaJkpgx6pqOM3IuweMzIoXngoNBwOa+ESziVlVqDtEHdnueUVVhHwkqBmVZ9/7neyXfu5SY/I09kkebD2bwFs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(31686004)(4326008)(186003)(38100700002)(66476007)(6486002)(36756003)(66556008)(44832011)(86362001)(2616005)(2906002)(8676002)(66946007)(316002)(31696002)(82960400001)(53546011)(8936002)(6512007)(5660300002)(6506007)(26005)(6666004)(498600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUFJWXFTTVhRa2l2c3JBdk8rdXZQYXo3S0pLRzQ1MUFoOWQ5T21kT0JWdFRq?=
 =?utf-8?B?REVwb29RWXovYysrQ1V3ZXdtQitMRWY3Y0ZtTWhTMUtJYnViWUtwYUc3b1Nt?=
 =?utf-8?B?OGVkbVhiaitmNnFlZlVJUlkvM0JrV0pNUzNmdUFxNGxiZG92L0tuaWJvK1Rr?=
 =?utf-8?B?N1RTZys5UmZaNE93by9YVzBETHpKS1pzOENVLzBVNWJqdDQyMThWVDBxZ0da?=
 =?utf-8?B?NWxlUjlGYWpHTi90ZDZDNkR4SzFWbWdNRy93bFd6OHNraEtlNy93RUhJTkVE?=
 =?utf-8?B?TXlkdGtKd0RCSjBZaC9uS0JhM1lnaEZNSnBUc2NIeVd1L1ZScjQramNMZ1pL?=
 =?utf-8?B?Y2xKLzdSK1ZOUklFcEYyTjRPMXB6L2VoYTZLZitNNy90Qko2MmZKc3JwRmZF?=
 =?utf-8?B?WnJvaFNyZ2V4d1d6a0tMOHRiRlRGQUlyUFR2RlNPeXZNTkt1cmg5SXhFTXdl?=
 =?utf-8?B?Qjc0WUJPUWVPUkhEbmY0aUNUdXJFNWZjSTZjWXRPMERQQ3YzSTBJSkpkV1lG?=
 =?utf-8?B?WE5wQ2RSRzQ4UTN5aElzM2JCQ3BKOU56QWp1alJtbmlWWTcveW56Yk9tSC9i?=
 =?utf-8?B?ZEh2cUhjbDBIbUpibFk5V1FXMFlPMkw0bkNld3dZaDhkYThrbTluMklKMFN4?=
 =?utf-8?B?YTZETEZUdFVxMXZQdHBBTXNPbHYyL1E5ak5ETE9FR2NxWk5QcWZaQTgyRmMv?=
 =?utf-8?B?NmJEZXFwSnRSSjk2cXY3dTkxVEErM2dVTDBFZGJuZ205NklWN0hJTm9MZlpC?=
 =?utf-8?B?ZUFBeGZ2OVBpRFNzOEs1OTZKMHV0eE1EQStGYU1zRk1uTXhvdEh4aStPWHB5?=
 =?utf-8?B?MXVHUGJXdUZSeUx2SG5FcWdpQVBIZlVoSVNoeEVFT3FPUEdsdkFqRjVwSXc3?=
 =?utf-8?B?d1o2MXBmZWVTcEtCWTY3NmkwV2ttODdmdUh3RDdnSlo5R0QxdERaVjFMOENX?=
 =?utf-8?B?WVcwYlY5RUJlcVpJRG9zV0YrdjBha1NsckY1U3RiRWVrcFRXYXJZWkdyVDJj?=
 =?utf-8?B?aFNYaXJ0ZVY4clJkNkRCbmdlcGFWS0hwaXhEVFNHY3VTVVdLdFo5bXVMUDZz?=
 =?utf-8?B?M25naTB4dmZIVmRDSThuVkcydGFNY1gyb2N1TVNvWURRdmhHMkM0c0psVGdF?=
 =?utf-8?B?endmdjI2UGl2cXFYeU1EWnZkUkR6SDQ4eDMyUzJsZW9pYUpQUDdST1hadkdr?=
 =?utf-8?B?NlE3WTdMcEFzMTY2NlZCdnlkM0JZUGZQK0hjckJUTm5YekMwdFRIbDE4emdG?=
 =?utf-8?B?ai9OQ2RIU0hvb1ZLendhT1ZlakFPdDdmS3IwZzJROW5BVHZ5U1JkSVJTQzNs?=
 =?utf-8?B?L0xGVkhnaTVWSVhvUlljSUlVLzg1NS92WXRZdHpXUmtBeGo3b29OdWN3Tlph?=
 =?utf-8?B?MHlYWnhiSUljL2o0aVd2b0VlN1dVeTQ3Ti9EWEtvQ2ZVL0EyTDNZa1JOUXA3?=
 =?utf-8?B?RTdMZE9nWnFIcXJSdTMvMXVFVWpyVkZCREtXeHdlV2dpd2ltYVNQaWlBclRz?=
 =?utf-8?B?YU8wTXRSMk5LL2lacElFaWNVbzBFb3puaUVySUhpQXg1QVF3aTU0dWNSbWNz?=
 =?utf-8?B?YW4xQUFaYm9jc2Myd3ZPbnZjaFpNaHJPNFgxUG00ZXVYSXg2VEtJd2NjWnZ5?=
 =?utf-8?B?OFM0UDU2WktaUWlNaDIvL3BTVm1pVElKTXZWVDFzeTgyVW5FUkhsRmtNYzhN?=
 =?utf-8?B?WUxtUDZvd2tuck95OGhCT0JCcEVrR1R3L0I0ZHZ0VVFFUnY2Q21vZEVIQm1Y?=
 =?utf-8?B?bzJiZ0xnWm9oMldNUXg3RW16dmtvZGs1TXNtZWxlTGIyVmJxQ2c0U1BNS1N0?=
 =?utf-8?B?eTFZRm1GNEtKUnBXaVFtRUJYTHdmVGljZExuMDh6NGlGdGRsYjBIVlBHYXY5?=
 =?utf-8?B?MUxsTXNyTDRMelpaMDZIcFZOMHBodDFHclpPMU5SYk92U2FyRmcxWHN2WGp5?=
 =?utf-8?B?TzNjcTMzdkk0SlE5WmZnZTdZbnJkR1pvRWx0SURVV05qWXZ3MWowZGV3NG5s?=
 =?utf-8?B?SDAxRzNJVVhsSUdvMFdSdG12SDArODlHMnliQ3dCSGlKRmlMMkhyenhvRjFT?=
 =?utf-8?B?M3FMTXRod1JMcnlIdUk2U1ZGNmlIU3Bzb21vTWVnNDM2bFFCUnpnM0RyZXpW?=
 =?utf-8?B?aXhCQzc2U2xpTmphMytxTktkOGRHYk5XaFNkMHg1ZnlwbEtWM2JUNmVGR0Vv?=
 =?utf-8?B?cWlheExadElJdTcrYTNUWTRZNmU1SGRzOXZwMmR3UDd1eXVIZmVlNFN0ZkZ0?=
 =?utf-8?B?KzhZb1dXd1FRRGNNVXpibmZtNEowR2RubkIveXRYR1Fqbmp5Vk8wVS9UbHV0?=
 =?utf-8?B?QmJkVFVOSTNFOCs5bU0zSlhzZXVJalNReURZN1hyNGFERUpSMXp6UVY4Qkkv?=
 =?utf-8?Q?iO9DOIhx9/DQ8M7g=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad2519cb-3a1b-4fd6-d3c2-08da505be9e8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 12:21:32.3879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRma770WArHYsqr5eW/GhNx2xLgPVULKp4xrMKbLdaLbdna7dVjlQFBD/S7lq0hNX8d743gvKhZ+LxmT/i7CyOxoz1SWjmxC/LrWox7PEBM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1561
X-OriginatorOrg: intel.com
Cc: tiwai@suse.de, broonie@kernel.org, =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

On 2022-06-17 12:04 AM, Pierre-Louis Bossart wrote:
> After a set of SOF-specific changes, this patchset correct problematic
> uses of pm_runtime_get_sync() in ASoC, or simplifies the flow with no
> functional changes. Two patches for Intel platforms also add a test on
> resume success.
> 
> Additional changes were initially suggested to completely remove the
> use of pm_runtime_get_sync(). These changes were dropped since they
> are way too invasive, specifically in cases where the return values
> were not tested, which would lead to duplicate pm_runtime_put(). The
> remaining uses of pm_runtime_get_sync() cannot really be blindly
> modified without context and knowledge of each driver.
> 
> Pierre-Louis Bossart (11):
>    ASoC: Intel: catpt: use pm_runtime_resume_and_get()
>    ASoC: Intel: skylake: skl-pcm: use pm_runtime_resume_and_get()
>    ASoC: soc-component: use pm_runtime_resume_and_get()
>    ASoC: wcd-mbhc-v2: use pm_runtime_resume_and_get()
>    ASoC: wsa881x: use pm_runtime_resume_and_get()
>    ASoC: rockchip: i2s_tdm: use pm_runtime_resume_and_get()
>    ASoC: fsl: fsl_sai: use pm_runtime_resume_and_get()
>    ASoC: img: img-i2s-out: use pm_runtime_resume_and_get()
>    ASoC: rockchip: pdm: use pm_runtime_resume_and_get()
>    ASoC: tas2552: use pm_runtime_resume_and_get()
>    ASoC: ti: davinci-mcasp: use pm_runtime_resume_and_get()


For the non-acked patches:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
