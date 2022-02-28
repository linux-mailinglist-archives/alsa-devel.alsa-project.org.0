Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 243154C7081
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 16:26:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD8B41740;
	Mon, 28 Feb 2022 16:25:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD8B41740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646061992;
	bh=ffPS3oyveMPK14V35jRIGNQP3l6HgN+L+WvdMPrEHS8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A/G5Tc0lwFiUY2QMUEjsNZXSxB2Lw0j30D9MuqhSBhaDLZbnNuXHNTJYQlEmmmgGP
	 xqvJkoaJSv5Rc6hLlEopyzySC0tLiAwM+IFOYkkQOH+duxobOdxvlnsu4KyvKnVrYK
	 3QGLPXXAWKFsHMBNzHMlN4WeZNA7gZTYAASnea6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 361C2F80154;
	Mon, 28 Feb 2022 16:25:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E7FAF8013C; Mon, 28 Feb 2022 16:25:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EAF8F800F8
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 16:25:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EAF8F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NO9+lrQF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646061923; x=1677597923;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ffPS3oyveMPK14V35jRIGNQP3l6HgN+L+WvdMPrEHS8=;
 b=NO9+lrQFsF4BlRFJCeanDJyaInTa3fiZb9CmLVVwaUw1PWRlgvtiRpLE
 bC4oK40DWIhKZNhGkgF7anxdcYj3JfRwHYqTWGnqhyRNn8UgS3MxcuefI
 6WjDBtca9Dv6W9C1mplM3Jihe9kUbSwo2nxyORbn6ACNMqMBynVHu3com
 VgW10iAenryX5Wq5MKxs+p1s9D9lsJ4JQ3awCmV5UejOxw7VDpELZFnYI
 jphd9WpzDJznafQn9nI8h0iGUhq0kd95gJuuGtoOFoCmHE9XukZLwbyya
 DqdyXoS3vnuPECc/JQIH+GITicU5P9J24hxTkQZ5uFCTO9/05yJLjn+Rw w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232877982"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="232877982"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 07:25:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="708675206"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga005.jf.intel.com with ESMTP; 28 Feb 2022 07:25:12 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 07:25:11 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 28 Feb 2022 07:25:11 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 28 Feb 2022 07:25:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQNpuF3r5TTUUrDI2DvYYA5VlN2ZjFARxlnrrU/Ei5E0DUS13CDXg2pSVtChP0S0J+UdfyPUEluGBiA2rgWlWtl5t4Sxs+wbVZuA3gs3LdIFNUZPfWzWTqX5If7I7LeGwqTsWtC/2W8RwIOcgYh+esBONLY9Ckx6kVdd6s0Gctn4Gd6VvKgzZhdhhDlp84Yylu07xlCluAcDtovjgVE7OAIKUtwfa5bENwofZNxR2pnOwjiyeagzML1Fs4hOr78vQqgXR5WLLo+YdDlEK+pkHKXLnxajiAC5NKlX+5ohoMkmAjnMiVSQpxk4xSGvgYyoaiJ+OeIilfeRwwLr6irDjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hs6ZiCRLdPeh5ADcinbJ5LwbTqzgdLZyGauI/44LehE=;
 b=ab/xIDNxXuv4TxZW8t/KrCcA5ABYPtQnOqeAwOju1vfjzQVX71Jl4QJpLXRdUApei50t9NGZLNFOvO9ngiAE9xDdqsVGs30HO4UsOBRK/op4MEI11FQlBEuAzunOsQJEV/qgHIwLasQwfL3Tu/WCL32K4ka/TU28cuGWDShNUOGfkTkhNZehGXTO7qXVVf8eD19tjWT8S2mBwwhbngd/IDKJ17tSQpxuhxEakgbJElxkCEaokux7WFSx2M6/PCO7vjWle/JpTqOGY7vKv5k9f9iNkPnAkykyeSzE15WslxfKCW+KPvTdAFSuA9UYiuAU4hb36ispOQmqtrYbB/+bCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by PH0PR11MB5609.namprd11.prod.outlook.com
 (2603:10b6:510:e0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Mon, 28 Feb
 2022 15:25:10 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 15:25:10 +0000
Message-ID: <7e0b8222-b78a-81ff-25da-a4913df07012@intel.com>
Date: Mon, 28 Feb 2022 16:25:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 06/17] ASoC: Intel: avs: Add pipeline management requests
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-7-cezary.rojewski@intel.com>
 <d2a94d30-cfee-7821-fcb8-7b7ba129e5e9@linux.intel.com>
 <f519d485-e1ef-d245-6b75-a24d1ed69a60@intel.com>
 <73c1884c-ee21-9453-c02b-3c3b77131c88@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <73c1884c-ee21-9453-c02b-3c3b77131c88@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0023.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::35) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 771bfec3-afac-466b-8ff1-08d9face81b4
X-MS-TrafficTypeDiagnostic: PH0PR11MB5609:EE_
X-Microsoft-Antispam-PRVS: <PH0PR11MB56098B6DD28C85EF04501A4BE3019@PH0PR11MB5609.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EDXzXpY4a7ZWCTdSwKXLrjA+PUYh5si20xMF6cKc66cEU6fNfvvsp/rcXgMnUd464oiNYTTqQVvKuRr1HaqJdb+oAsSDT0ZxiT84j+HZvsmU8Ng+3LTnWlMbHAU537UU2OA0INSt+V2RVA+M3pcpobSPlzUSEoJhnGmeQQcZzEHQzrWF2gXPw44c7JAUhGJFe3374raXcIy26rhhq2kryVgiyHIesAbHp07CoOBy5NsbbSBjocU5j4+1aSBxW4YlMfxLt1O1OcN1/tlXWv7KwoLXL1F6L9OCWoKoHLcMRjeMeItBnSKn+kYg7+PNuDkuQfHhwKAf9ix4GJQggVAdNOAPgdq+cNAzZ/BJtY8njRpOpdICCOAJhnYbjPCiyz1ztJ0nV4GZt92Sj6Bd6rqKieRhTPGd2PVoYBFjLlNmTAZs6DLoWeGqAtmEJhe20szwBoS3PlHNz7j2v/yunOGLNLMKYrrrNqD+UHPd13mNcCaQRIY7/IrOY+5SRY8YNlGp0v+ZFr4StMsDPT+lFDlONxF1PSidQnXptr2csPnev3TmzNQij/iznwoJo286P6XZhVGqIz4isGCyX2/IjmFZCKtqS3nhRmm7ipYkSK0/U/1cSA6FJZz/kffvaZHyDIBQg4rQcjLDs1Juht5gHn3CPVEkIxn710zARbbcktZrB4I8GTFhqR2WPky4ak5a//JJg9rHeagPPY6t8x48CcXOYBpUE6+p4i+3EKOStB2sQvT+F0A7IplotviYLOFhMwY9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(66556008)(8936002)(66476007)(4326008)(8676002)(5660300002)(66946007)(7416002)(6486002)(316002)(2906002)(36756003)(44832011)(508600001)(186003)(26005)(6666004)(6506007)(53546011)(2616005)(83380400001)(31696002)(86362001)(6512007)(38100700002)(82960400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEIxV25CbVY2enc0b0t4RmVPYUZMNUNkeFJSdEVNa1d1S2dvZUtrdTA1K1hj?=
 =?utf-8?B?dlZCOE1GbVJpMitDOVFTS2FTUUVYczZ1U3ZRQytsd0pXNS9HaGFhOWRTWktV?=
 =?utf-8?B?c0ZhWHV1TmNhZDV3aG16a0hCM2hIUWVGWUhWa0tOdngrKzRIaXlzVW5nSmNp?=
 =?utf-8?B?b2dqVTNKMGV4a2pyWk15L2NoZnhJbktZdFFXczY0Sjhqdm56b0tnN2tHZFgx?=
 =?utf-8?B?RTR6NTRyT2F0cW5lSDMzNVVWc3F3MXBqeCtDRDFjRlhEd1BNdy9FUEJLK2pU?=
 =?utf-8?B?aDZuVWxhTExWWFdLYTZEaXVWZERwdGFsZWF4ZEw0b2JEWmFnMGkwYWZrMmFT?=
 =?utf-8?B?a2dhazRRdnNlUU0yMFhJcGhTa1dWVytwSGErdmNFN1VJTUtuSkRKKzZjalJ4?=
 =?utf-8?B?MkNmSTQ2TEo2MVVFVjZqVXE2RWw3MktQeFdySlVpUm54eGlWT1c4aks2STJH?=
 =?utf-8?B?VjdvcTl3d25wbDQ1YnZ3ZEoxZGNZVnRFb016TE5sRXFHaks5SEtrNDl4bGlx?=
 =?utf-8?B?d1lzelpDb1RWZnVWSUFIVFJ5VkxQdVRaTnp6a2ZLbFoxeXREaUhRTkxBWHpV?=
 =?utf-8?B?cEJGL0N5M3pDMEVTbHBYaHZYenNjQXFFVnUzT2tMM3Zwa2dVd1ZxTnNSYjFL?=
 =?utf-8?B?TkdSdVJiUTFsaWNZdEJ6NFBtNlZHQ0lycUZRajVOS1pkK1JIczJ5MTNERkp1?=
 =?utf-8?B?RUtUV1A5VmxqN2RXSmExbDYzVFdDTGJNV1plQVJyL2U4NDZOb3N1Ris2eUl5?=
 =?utf-8?B?ZjBNL0ZabVJwZWh0Q1lyaEM2Y3NhZ2hBQ1dpc3JINUtEM0FiZHVuK1dtOHg1?=
 =?utf-8?B?TmJNc3BNVFhaREdMdFErZXRGcDVLSGtUaUE1YzB1NTRDTzc4MENibVBPWk01?=
 =?utf-8?B?dVcrNERpRm9oYVFPaElYdllNOGxFS28wU2FheDI2ZFJ5eGRuR0F2aUhESU5q?=
 =?utf-8?B?NTArYjZvSmkyRXRaUDJGby8rdVVneDhtVG9yeUY4OUdTY3VnQXVuMEw1eWhC?=
 =?utf-8?B?TWp2cklIeVR1WjRSK1hoYVZjT09OQ1BjTCtWZWxqZU5ORFYzQTdqUnFwcDVE?=
 =?utf-8?B?NW5wbEtsN1NManRtcE5WZlE4WU9VdHpMNnkzeitGTnQvZjF1NVJrcU9rOU04?=
 =?utf-8?B?SWRHelNKODlxU1pLRzMzQUJLbVVBeHJzdjZnOFVJOWwrM3YwTjJXMnJKWkFU?=
 =?utf-8?B?MUdPOXNtY29rTitodVVzUGhSZjZzYjNod2dBcDRFWEM5QktHWHFQaDJ6SmdZ?=
 =?utf-8?B?Q1EvaVltY1pEUlk0YmZORWY0djdUM1cyTnV4ajRTb1VaOEpuYWE2d0hvQVlq?=
 =?utf-8?B?R2Yzdmk5a01vVTAvb2p2Q1NkU1FnRE45MmV6dW14b3hKcDliY1dTQVY5S0FC?=
 =?utf-8?B?clRwc2VXb3RsanNyajN5UjczWWtCa1diem1kaG5uNlhuY0tjOHBzWGdlNUJr?=
 =?utf-8?B?ekVkYWZaaEg1bEhlbVkxTDJoeXY0dDlOWHB1aTRPbTF3aHM5MW5rTDlzN3g1?=
 =?utf-8?B?S1Bna211Rm4wRFdhbEdWcjFSYm9tQ3M2L0lCL3lobW9UQkV5c0p6RVFpeDZn?=
 =?utf-8?B?T282aXFnc09UUDV0eWtXcEJKdWdrN09hb2ZiL01KalhuSk5iUnc4Z2NCWCtm?=
 =?utf-8?B?VC9jOHYrMXNhS1dDTUJZSmxSMVhLSVlyZ0lzdGViK1lBMnJWR1Nnek9JQVRs?=
 =?utf-8?B?YTNXWnhHN25sWUFDcWhhU0grNmRLdmVJZWNYWmRkSVJGaXhNS2pjZy9yemNo?=
 =?utf-8?B?RmRSVldRYXhFaTFvcXFkeStGQWtSOC9kYTQwb3hwSm90dkxsRHg0Z0w4cGpF?=
 =?utf-8?B?c0JJOEFxcG5CUHBWblA5VVFoNDFIQmpaeDZzU3FnakhNRE9zeHIzRHZzNVl0?=
 =?utf-8?B?b3k3U0dHNkNINXRmNG9oL1ZRVWZPeVBudjFia0E1VGF5dklEaUlzRVJjOGhS?=
 =?utf-8?B?cS9WUU1Zb2diNXpWdjVjUFRmcUNZMjhzVkZIUitXdE8zNGEwWnVVbmQ4Yklv?=
 =?utf-8?B?Uys2ZGU4YjlleGZFdHh5UVpxMGZXVmNOcjE3Zi9iRFFFVXFVN2t6Y2RjcXBx?=
 =?utf-8?B?UzUyZDlyZ1lEQ21EMWpSUHNNa1d6Njd3T2dxa3B3SFRuYjFKU3VLU0YyRGNC?=
 =?utf-8?B?eFAyTGUzZ1YrYUVvelVWZldXM29VV2VLY1BmKzVGc2JnQ2tsWVpoOXNMUmlH?=
 =?utf-8?B?ZjZSWkRwQm0yTmJDVURBWkFWRGxySXZFc1J6Y3d2OHBGZTBIU3BnaGgvMVVo?=
 =?utf-8?Q?OE+bU43V2DPy4lbZzdQDAh8dgJ+2RUgBGKOHuqBr9o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 771bfec3-afac-466b-8ff1-08d9face81b4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 15:25:09.9218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTflNQ5bAGJ3o/S6mJA/C/KFOR90JMMXyF1rC5AHbFcOgNlSB6rxAj9wXd5Xh6btrd1hmjfyDCIJt3Iu5VxIbqXXwi447zH4f02Z01rJ1/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5609
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

On 2022-02-25 9:42 PM, Pierre-Louis Bossart wrote:
> On 2/25/22 12:31, Cezary Rojewski wrote:
>> On 2022-02-25 2:11 AM, Pierre-Louis Bossart wrote:
>>> On 2/7/22 06:20, Cezary Rojewski wrote:
>>>> A 'Pipeline' represents both a container of module instances, and a
>>>> scheduling entity. Multiple pipelines can be bound together to create an
>>>> audio graph. The Pipeline state machine is entirely controlled by IPCs
>>>> (creation, deletion and state changes).
>>>
>>> How are the module instances connected within a pipeline? You've said
>>> too much or too little here.
>>
>>
>> Hmm.. I doubt commit messages is the place to bring up entire FW
>> specification. A high level description is provided to give a
>> maintainer/reviewer idea of what the pipeline is. Perhaps s/module
>> instances/modules/ would suffice.
> 
> No one is asking you to to provide the entire specification, just enough
> for reviewers with no access to that spec to understand what your intent is.


Removed the confusing part of the message in v2.

>>
>>>> +int avs_ipc_create_pipeline(struct avs_dev *adev, u16 req_size, u8
>>>> priority,
>>>> +                u8 instance_id, bool lp, u16 attributes)
>>>> +{
>>>> +    union avs_global_msg msg = AVS_GLOBAL_REQUEST(CREATE_PIPELINE);
>>>> +    struct avs_ipc_msg request = {0};
>>>> +    int ret;
>>>> +
>>>> +    msg.create_ppl.ppl_mem_size = req_size;
>>>> +    msg.create_ppl.ppl_priority = priority;
>>>> +    msg.create_ppl.instance_id = instance_id;
>>>> +    msg.ext.create_ppl.lp = lp;
>>>
>>> you may want to describe what the concepts of 'priority', 'lp' and
>>> 'attributes' are and which entity defines the values (topology?)
>>
>>
>> These fields match firmware equivalents 1:1 and are part of pipeline
>> descriptor excepted by firmware when initializing a pipeline. Handlers
>> found in messages.c are responsible for one and only one task only:
>> sending a concrete message. Part of the driver that implements PCM
>> operations (not part of this series) cares about the topology (where
>> these values actually come from) and invokes the necessary IPCs.
> 
> add a comment then that the driver is just relaying information found in
> the topology to the firmware.


Ack.

>>>> +/* Pipeline management messages */
>>>> +enum avs_pipeline_state {
>>>> +    AVS_PPL_STATE_INVALID,
>>>> +    AVS_PPL_STATE_UNINITIALIZED,
>>>> +    AVS_PPL_STATE_RESET,
>>>> +    AVS_PPL_STATE_PAUSED,
>>>> +    AVS_PPL_STATE_RUNNING,
>>>> +    AVS_PPL_STATE_EOS,
>>>> +    AVS_PPL_STATE_ERROR_STOP,
>>>> +    AVS_PPL_STATE_SAVED,
>>>> +    AVS_PPL_STATE_RESTORED,
>>>
>>> can you describe that the last two enums might entail and what the
>>> purpose might be?
>>>
>>> I can see how the firmware state could be saved in IMR for faster
>>> suspend/resume, but save/restore at the pipeline level doesn't seem to
>>> have an obvious match for an ASoC driver?
>>
>>
>> The enum lists all available pipeline states. We're planning to move
>> these to uapi later on to allow apps to monitor running pipelines states
>> real-time.
> 
> That doesn't answer to my question. You are not using the last two in
> the rest of this patchset, so why create doubt in the confused brain on
> the reviewer?


Removed both in v2, thanks.
