Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA4E77BBEF
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 16:48:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 332157F1;
	Mon, 14 Aug 2023 16:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 332157F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692024522;
	bh=ue1dDP1+CI9hhddTETvFs6vuTpnEv0aoz1cqT2MMnoI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kDniXvdDCOrIVVMflNLHLCSfhjCZYR7FvAyiyX+yLhUsxyGfqMpK5bY04QFrd3+Ls
	 mz6H/nAXK14CjWjATM8HSd5w2huhVI6poEHfjjIvFe9tnRlm+tCOV7PyjGR7BBqVFV
	 WH9Z6Vd+ZosP3JER/4oiJCWBIosECcLpvLdkPYWo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8753BF800EE; Mon, 14 Aug 2023 16:47:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20127F80254;
	Mon, 14 Aug 2023 16:47:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F786F8025F; Mon, 14 Aug 2023 16:47:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 529B9F800EE
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 16:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 529B9F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EbStIelB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692024444; x=1723560444;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ue1dDP1+CI9hhddTETvFs6vuTpnEv0aoz1cqT2MMnoI=;
  b=EbStIelBhIZ9Owg7OImFjN83x7ldQPv3IhaeIam14mrTxRJtr7EMupta
   muka9pSqu4+rYBCm1V+nA70ESPUpoK2ajKe79TzzIq9MidJw1XUfkSvmq
   HnwaIY0pxJylwxh781rQ0sB8vDKx4qZYH1bdvlq1bYFNLk7xxidSZJl9u
   J/nVsjXLpN2pjcusRH7BMrsEeQSnQP0Icx00WfN8bUKE+xssQ6dMQKLKu
   Rzm0byoQ+LUIC4LXXImV0JdbYLCK2V/fY+bwNvZDrG+DzldqiDrvVJQri
   B6kUKwPIi3Y1IMFhkcjwXmnUkJhmHCPCehKZsMO97DUXH73N17Bw5cNTq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="458414840"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200";
   d="scan'208";a="458414840"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 07:47:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="733472989"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200";
   d="scan'208";a="733472989"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga002.jf.intel.com with ESMTP; 14 Aug 2023 07:47:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 07:47:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 14 Aug 2023 07:47:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 14 Aug 2023 07:47:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/aw23hSL+liIRqTOaVMNLJzBpeKLq8+7YCrpWP1vJFvXAGDAK5xYjkr4leT+K0AT8s0r3xUHA1OTi9sbBPg5JNq3vNNVGjZ8K2YThEkc6x7we9AKzjJym5PXcuwvpcW422T/OqSiYbFvyrtacqNpGe9RNlOHE537FlCXufo7SqDFzfh1o4E3XnBOkNAyaD9A7P1wcVjJXyH34pOrqNWSwMNewCneucIVbKz386z3kfE7aNt0QFIL7TIVPZq+k8M1wwQHaXqyXCKVG9fHX/FDEVa3AC0PIRu0X7AQv64mPrmbXPhg3KUEeJ/aFJTSxDgzAzfjmC2Qv3dclItfwu1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3TESE03GRdu3zqqYlRLObdsVE9zcaJBtZhJUY+wKME=;
 b=lTOrEzl4ARKm6LecWXmL6PTtJFEIaecC0gBYyQXiFn9iG/6dPcE3KZ2CalMdcgLCIm8ZkjtdNeX+nFpD+gViCmYD0lnjHJlemA+dE+Ed8wKHmqBAJIQuxwzszQmcl/VbGznyte2VQoDpTt/i0CON6Gzv596dBOkJ/5mwpHq7XrztjK7RAWv/ZDWincwRMmm8WUst/hEnmyXyU+z7KFF3QihdIMzag9VOIQzQvHOXZD0fPz2HlWp4S05WB5+yOuvi4TM1GILXuwNMEvmVreD7AIztbIkJ8VA4gMaGhYL1jaVjRQRI03RhTsJFrBGgvk0L7hRpJwa7EwSgjyOb/TB7Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CYYPR11MB8386.namprd11.prod.outlook.com (2603:10b6:930:bf::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.24; Mon, 14 Aug 2023 14:47:12 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104%3]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 14:47:12 +0000
Message-ID: <32a12f63-43f5-4f73-6140-91261f10b42e@intel.com>
Date: Mon, 14 Aug 2023 16:47:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 05/17] ALSA: hda: Upgrade stream-format infrastructure
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<alsa-devel@alsa-project.org>, <amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
 <20230811164853.1797547-6-cezary.rojewski@intel.com>
 <87edk51ya4.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87edk51ya4.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::10) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CYYPR11MB8386:EE_
X-MS-Office365-Filtering-Correlation-Id: cd07e544-e399-4fb6-cdda-08db9cd5580f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 tA+Y+V36GSC6kP/kUk3cmVz5xQjAcNOipIQEKMacWYWe2lCZpHKhhhzT/VwujwI7em82zUK8IK4G/nC7e3ZeOzB0hMveFKGYspeFvljh5cR0H1T3jQm3SHrtMupRnHkskDaKjory1zkCYRiFm03+QxKEIciNyXxZFRmbf/enFsq+YPCmjJ9JJIWnIbG7VE/il+XArUfxqYZSRz6kJUBny+K9S2wIAcdF9XmoryhKfWK4Y1g2mPtufNXA5Gfa3sPAExt/5ro1ltRoXqpuCebKT4NG4lCGBOVQaWjryx85cQoSqmGV9IjNhA8sxE3JD7VqCv7wR9lfFJty11Nb1/lnO5R/g/PHq6gYx2t8JZz+43JiUTHfBWnBLTdk74rJj37oUh67QLdCYAijpBrwu53dwir5d0mNYEC/VPPeYbk1ckXsqN2Q8MkDa1ZYNaiJVYh/ABDGaWMLeRKVSPdVFcbB9gq0g9Q/a4YyTeTQHd01rfHYR4fyeY5K6+P3EuBAYOCOGadGkh1tiPXXTuc5X8UwbsewQIZB/l3jS3+zGPfUGXq4rOed9lFfNfM0jgvPBgP2VYd+smBjpQvQTCDxsbkPHUw/G3+DR8L5f6204d42SU38dT1j6SP/YehbuVmvo1jy0kaMLxPWWM0mtrlCWdXzAA==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(39860400002)(366004)(346002)(186006)(1800799006)(451199021)(36756003)(31686004)(38100700002)(82960400001)(41300700001)(478600001)(66946007)(6512007)(66476007)(66556008)(316002)(6916009)(8676002)(8936002)(5660300002)(4326008)(44832011)(2616005)(31696002)(26005)(86362001)(6486002)(6506007)(2906002)(6666004)(4744005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?N1lvbXJNZHVDdDhyK0IvUEJaVTRMT25VYTdQQy9yb1pFSHZNZDNlRmRtbkh6?=
 =?utf-8?B?eGpSdGxvMXdtT29UMXkxTmVHVy82aUpZcFRrTHFZQXVzSG1uMVBZa0I1YVBp?=
 =?utf-8?B?ZlYxRzc4M3VvZ1JGQ1Bvazh6c1o1d2VIRWxkT1JpL2thY2JLaktpTGwxR1dw?=
 =?utf-8?B?dDVNSCtoSlovNzVWY2pXN09JTzFiNHBGR3Q3VlZDRHJ5SzFuR01nT3RmSGtC?=
 =?utf-8?B?K2lxUjB2MUt0QjhGQ011NWcrNXpFNkdYc00xS3RMd04zbUZiUnAwTlJaWGFR?=
 =?utf-8?B?eHUzdFBEUkZnTnFDM0dJVGg2c3RubmlMcFBlM255Tm1EWHFtTjFSaUZXeDdQ?=
 =?utf-8?B?ZE04WFVXRitaODkzVEp0cThKeVd3eUFWb3N5Wk9zSnlUSUFDcERDNnBWdkcz?=
 =?utf-8?B?dEMxdWlETTJxYmVTNUxoL3Y4NytGa2pyQXlkcHozZGJ2SCtyN0hMQnc0RzZk?=
 =?utf-8?B?U0MzTEhTMTVtWFhSaEZ1Q05yZkN5TDNTbDhUUlBhQy9sNERBK3JFd25ZMEVR?=
 =?utf-8?B?RnZvMnNLNnR3M0h4VWJENi81RlNNOFJCNVRIc1Bwd05GY0xUTDRVSEtoa1BU?=
 =?utf-8?B?Q1RsU2NFRmxMUDhhSXR3djlMWFY4WGRwMHN4RE5tQTBFWW1vWWJvT1J1REIx?=
 =?utf-8?B?alJDek1nNE4rVGdHOEhrS21LQWZsRFBzWWJBM2F3b3dZbXpYQnczU2VCRlkz?=
 =?utf-8?B?bFRwcjFQUnY3UWw4QVBmRnF0bWkrdVZFeHhEZlBneHlkMzZEd29UU1p6cjZu?=
 =?utf-8?B?ZGRWMkd5WCtuT2NKaUJUYnl3Q0pFTklWUTdBTW16QTc4RzhPNXFqS0hRcjVQ?=
 =?utf-8?B?YWFYclU3QlluTE50eUpmSFdQT1lGY09lbFZuWTFjdS9JTmpmS0ZUaDlkTThJ?=
 =?utf-8?B?STlGSEhFK3pZZzJ4S01VRWFINEY5dlNnSkZYZlZubTNWaHlqZVZIK2ZJVWRV?=
 =?utf-8?B?ZFdDTkkyNVNBRmtFN3kvbXliSk03c1lHay9qNGFXR25uaXJRUnljR1JXUVpC?=
 =?utf-8?B?eFR3ZkppYndhUHd4REo1cnlmcE9GSmdhcWUvWHlwK3UvN0M2Q1hKa0FtQzNw?=
 =?utf-8?B?czBScUwvVGNCcFRPTUxRZWhsK3UxbWQzTityZW1hQlUzc3hnNTRoNjFBZS9i?=
 =?utf-8?B?UG1KVDlWcUxhMmtVOVU4YXE5blJ4SlhyQ3dqYWsvYmtQYnU4QTl4a1RMaWlN?=
 =?utf-8?B?dkQ1czFzWlNybEF0Z3psY3lvUTZoU0tzTG5tZWJrTXFLMTViUEtNZ3p5Y3hm?=
 =?utf-8?B?VUlFRFBSeVQvUWFXQ0RuVElEbzUzTGtDNkQwS1M5L3hjQjI0T0U4cENNZHMw?=
 =?utf-8?B?WGpxall1Nk4zN08vTEhadVdQLzkxUUR3R05oUFRWYXBNOXBwaXZlamZMcEVy?=
 =?utf-8?B?ZXBRazBIUGFaZ1dpWVBWNFlPU0plZlpPeUNtdlhkekptYVg3blk3MitFRGpM?=
 =?utf-8?B?QmJWUU43dFZaamdVc2ZDM09TdCsvMFAwaG9rcmY0Y2pqV1JsYWpyYkVJZDFn?=
 =?utf-8?B?VENUaDV4eUNsQzlmeXBvc3h5ZVdLT3daT2lkZWxWWXNDbTV3ckJCS3FMKyt2?=
 =?utf-8?B?TmdNcWttVGpLV2crUXpJdkV5RXlqd1RSNml4L1hKQjl4K2xGdVhNcGYwQlpU?=
 =?utf-8?B?bEMybW9xR1FvaDRzb1JWQ3FMV21PNjdEdXFnNzNmL1F1TmwrNXpLczRDcEcw?=
 =?utf-8?B?b04ybEhXVzAvZDdpWGNWZkUrRm9wWUVuYmpHdkwvNjRteWkrMDBzWTkzUFdz?=
 =?utf-8?B?ZUpaVFRXYngrRCtIU0FhTTVUOExmcFlqdEU2UWNCTHd4WTFIYnFDZFFwTmNX?=
 =?utf-8?B?ZkU3LzZuZStHSkI2VnFIMTdqQzhhbTNLbmlibTk4WE8xaEVPUmI4aEZIeGY4?=
 =?utf-8?B?TTBBVVJzRnM4eFkyTFlseFUzNC9tb1AxYXRqZDZ6Nmo1N2ViTGhydzR0T3c1?=
 =?utf-8?B?SkZwak9FalNpSGxrM3NEQ2tpSmsvWkJFbHZhckgvbVh4TjlsdkdjZzFTMEdU?=
 =?utf-8?B?UVYvMnVXL1dUN3c4SkVnNUZzbmNYb2dIL1N5K2ptZDk4L1J3Z2hZVkpYNlkw?=
 =?utf-8?B?bnlYRnh2Y1NucDJJN2c3cjVRcDVPQWNHOXB2TmtMQ29uZXprc2V3UERBNTRM?=
 =?utf-8?B?a0JQMmdsdEIxN2NuSEo5M1ZESk9wakpEY3REenJTTGdDU3dlV1ZpMzlOQ0Rq?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cd07e544-e399-4fb6-cdda-08db9cd5580f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 14:47:12.3745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2DE1NZG6a6b/5AKB7oocZJINeAs7f1WNKTO/hd0u1/E3LR6zhX2QXB1MNY56aOGqeShrcEhufT3fX/8FTJcSoPEyfONrIhiwVZJDHnHP12I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8386
X-OriginatorOrg: intel.com
Message-ID-Hash: V6TVYSLJJKWKVCZQN6YXQG7ZWLOIR2CW
X-Message-ID-Hash: V6TVYSLJJKWKVCZQN6YXQG7ZWLOIR2CW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V6TVYSLJJKWKVCZQN6YXQG7ZWLOIR2CW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-08-14 4:41 PM, Takashi Iwai wrote:
> On Fri, 11 Aug 2023 18:48:41 +0200,
> Cezary Rojewski wrote:
>>
>> Introduce a set of functions that facilite SDxFMT-related calculations
>> in atomic manner:
>>
>> snd_hdac_format_normalize() - format converter. S20_LE, S24_LE and their
>> unsigned and BE friends are invalid from HDAudio perspective but still
>> can be specified as function argument due to compatibility reasons.
> 
> Which compatibility reason?  Those formats should have been never used
> for HD-audio codecs at the first place, so shouldn't it rather return
> an error?

In regard to avs-driver we can "force" the S24_LE out, no problem. 
However, I do not believe the same is true for the skylake-driver. I 
agree, S24_LE and its friends should not have been used, but they were.


Czarek
