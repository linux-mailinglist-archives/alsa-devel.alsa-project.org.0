Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 899635775A5
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jul 2022 12:07:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5B2B17A9;
	Sun, 17 Jul 2022 12:06:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5B2B17A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658052420;
	bh=2Ypki+o/a0+ParGKWUP1n2pDgGhwj7AXUapRnohngYE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HDsOjzRvaEsh1BpAbbvDByn7hiQzIliiOIHdwQA9u8OSO2CsbLsLlP8B3/xkfJD6R
	 yONtE0GNF2FudTqu0YcnmufzAI+RcbljSzz7tTtfDPKVxlbU0RonTQAptJGg4N1Uq4
	 VnEo4p1/FBijbFLq64foEWb6BA67SoJGdAKmw4mE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E0CAF800CB;
	Sun, 17 Jul 2022 12:06:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DD97F800CB; Sun, 17 Jul 2022 12:05:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9160F800CB
 for <alsa-devel@alsa-project.org>; Sun, 17 Jul 2022 12:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9160F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="B+0mf2n9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658052353; x=1689588353;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2Ypki+o/a0+ParGKWUP1n2pDgGhwj7AXUapRnohngYE=;
 b=B+0mf2n9raQt8XGsQ5FSJSEKCqHUwYZAaH3Z43QMa+xzFcpg/VauYg25
 yg34e1GtmZjlX/gXM1w435A1xoGR2+XeY/tQdIdj9LuFHWXRcgQxctDnS
 I/w5lcbIdw/V5/FBrKaQYmukh+5C6Ns7nZgC1hYGw3mCcCbnEcHbZobkS
 n5X2qpzJhErKDwqgZRmblo1HIiNLbZf76kzDEEd/NioqX+sSSzwZssa/2
 zEPHTw+euAV8vKaDrCK5P5OiqZIFLdsAytYeGoCqnEaOQi14scYnx1fi6
 mcBPBSovQ/WKSCULuoGFbAP/PBO5v5pYPdL/9QFBK1z0kWG+VGWwoctLv w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="286783120"
X-IronPort-AV: E=Sophos;i="5.92,278,1650956400"; d="scan'208";a="286783120"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2022 03:05:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,278,1650956400"; d="scan'208";a="572057504"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 17 Jul 2022 03:05:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 17 Jul 2022 03:05:48 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 17 Jul 2022 03:05:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 17 Jul 2022 03:05:48 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 17 Jul 2022 03:05:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9P9Ob4DWpSRchhakor5zYQR5pqYmeEabvbBwKuFLDxwWfwc0Qmgy8uMIu66bXldftO6Chu7aPQKK8WIN8LPQybShDn2idv4qC+CDfscUk5dK9/n20PU0G3ZOk6YzrnJwicce1VOMrwlVI/rzeF5DjQ0R/PX2kXMm6drgpkqwf0+qHb81s8ZHnlleYQvXSCACFZgW1XXHpT+vjWQjwgBvokUxaV18biExM25zYqsCFn1SeEs4Z+Ekhkxa9VMaIRm1mg59So58N9eiA9gTvjVMjC9ZPruZkR/U/aqOCqnRR5lTr43QbRU4sYDQAVCi7P7eL2mIhfL9S9yeY6nlHIJtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+P+rCP0xEfy87VG8izsW03l5QeUO8K7VIEOd9/VyJg=;
 b=C9AyvMg1KPa15btbJ69nGyXs1sLhkil/DtYTKK36McPc3mGRpkTlGhP8sBOHWINnSHbdMM4hHGg7z84S5I8Z/X4eUpIDTmfKj7yk3gozPJCFF34Zs/ZPpgnL7KDLSswLnoqlOm15M/jyYUohKkv+x6GdOHyif7CNa4xyQJzZ+3DYwnMINNFL1KPTjbVfwKWoDbtfYuV6JhpXSmEdrR4aigg+ccfI4JtO94Qp3Rxend5rEqGAX+y6QGf8F26wEaRVBeXSdEcrkliRS+yoyNac7STcS42AwNVXaipTqKBcglusjuh+3oLnXsDwSfrwk4Lck1/s03p9533vkCoofbppLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BN6PR11MB1873.namprd11.prod.outlook.com (2603:10b6:404:106::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Sun, 17 Jul
 2022 10:05:46 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::852b:5f7:46eb:fca6]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::852b:5f7:46eb:fca6%5]) with mapi id 15.20.5438.014; Sun, 17 Jul 2022
 10:05:46 +0000
Message-ID: <2e65637d-b90d-60fc-5db8-40413a97b6de@intel.com>
Date: Sun, 17 Jul 2022 12:05:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 6/9] ALSA: hda: Fix page fault in snd_hda_codec_shutdown()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
References: <20220706120230.427296-1-cezary.rojewski@intel.com>
 <20220706120230.427296-7-cezary.rojewski@intel.com>
 <3c40df55-3aee-1e08-493b-7b30cd84dc00@linux.intel.com>
 <874jziute2.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <874jziute2.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6ddb1a9-b81c-45a3-2f90-08da67dbea99
X-MS-TrafficTypeDiagnostic: BN6PR11MB1873:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HweXxKJmcY7I0mpX0nomTfKlBWoW7uH4MuAPeQFVTvAI//RvUvCoMnYYkQJZpGaliGENJKeEZg3WSGjmIfz5uOPD4ddfCvE9yOBWyLKp9H4/GPLx2PAqpzgH1KhbA1F78ud5BIm6tKG+hNn7VuLGv6pchmbT6bnxz5ByH2nktkkZd1cJU3Wmy2jd1gTVUTCxzuuKL0I/zLVzTl9lKHgh9n9yVY/kN4eSI8Xf5RfmibnlgjosEjoZaOpDqHHFPxHL2cNsuULCg/uRqqT05fgqGDMB3VQUPfGOq+IgBzN8mTMMRm36pMt3u7cxefXwB4VURWnH36yFPYm8xTquouVGyzaUnd2bMMHP4BI1udZBIcrjHGQq8xy6ixNVEFotdNdc6wbvg+618bx7ElEC8PkdwdzwKm29Z7WMDjdyAltZzPhnjazcHf7UiawuT9a87cV2cGTwchhF6IFSWXOP2MC+dZWPmqiVMLVLltCLDOAsoMh5q9ksb3b0HmtmbK/nzzej48pJ5bxITBWu1ZK2VD6rYe8WKER4YuocPDW61LSAZPAdPYOz0aPX53Odc1qtdxMwlXfShcfUp4aPuZTgeO3SMYZ6asdoWE10uXc0tuWbUkQJfy+WQjOox99J/Invz4VUFcQCjHYGV6M2fC9fLCUDdJ1JNqAP4Sy8U+rniTo3+GImfQ21oR8FT+mpFJ9M3rr3bJkLC/rW8Yz4mkDtYgheVxb7xxHACNSUkW9LNARdzs92w8Ysy1yhSVppn6igUW8U+JVQkApZmcCB1FxstsF2PYmBBH5m0vsjyeVOtQJcpYwG1QIUZEwvY381T34nlixdjN+CTk2nF/4rQCWol0oTx0ZFv9nnCyX4OdvmQldpOiCQ6kGuRrIP02Ih7AKKZjeLrYH7CodVVwNdSUTOAEPVKA41xW4irzbcR1ZVejzOHiA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(136003)(39860400002)(346002)(396003)(966005)(83380400001)(478600001)(82960400001)(6486002)(31696002)(53546011)(6666004)(41300700001)(6506007)(38100700002)(2616005)(6512007)(31686004)(316002)(186003)(110136005)(54906003)(66476007)(66556008)(66946007)(5660300002)(8676002)(4326008)(7416002)(44832011)(8936002)(2906002)(86362001)(36756003)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V201WVR3NjhGQytpSFV2YjBaZWFJNXBLREVJUFJEVEZSaVROMlZRVExDZDFY?=
 =?utf-8?B?VEw2UHl5ZHJyN21CYktJaGRrK01Mbi9ZMWlDQ3dRMnE0VUxxUVkrdG1KWlJY?=
 =?utf-8?B?K2JybjdsT05TS1VHRHhLaldLczhYUEZ2NkpnZ0t3N2FQNFMwYlBYUE9kWU04?=
 =?utf-8?B?ZGZUWWVRQ1FnRjhnaE9qYmVqMXllUmk1NjZ3R0xCam1jTWxDVkI2dWlUOGJV?=
 =?utf-8?B?clhISHUvZ0l0RXdMTVJ5dklUZjE4MFg3Yk9ybHRBR1VGR0hYNVpNQzVQU0Q0?=
 =?utf-8?B?WFBYMkwwOElkaG16MFpVVVlsZlJIaUI5RnJtU3E0cllTaFJHTEttOXgvR1Z0?=
 =?utf-8?B?M1p4UnFkY2toS0ExYUNhL1MyVFFldHg2TThpb2gxMWk1SndLeCswU28vYlRU?=
 =?utf-8?B?S21UZVpuYW1UQkxyZ0QxLzhiMjZ1SVFGNXVJcVE4enVENWtLVDhaU0RFSGgx?=
 =?utf-8?B?dWUzcFNQbFg4RGxwTVNsc2hIRkVvaTQxQW1EakVKcHl5MW1jeE8rVkJDZU0v?=
 =?utf-8?B?THRzazBrOW9BUVhaSzRjKzVNYWRVUDhTanBmWG9tT3lybkFraVpBK0tJSGx1?=
 =?utf-8?B?RFdHK1Z1SzM0TCtaSEMxV1k2TGlqaHU5b3pybjAveDhPOGlKWDVpU3cydW1q?=
 =?utf-8?B?Y2EzTDJDS1R3Tnl6dUFSWmlUTlpGMGNkV2hZR09scE0zdGN2OXZERWVMZ3Vm?=
 =?utf-8?B?YlZvYjJvWStzY1dINjJqam1jdnlpZXAyQk9aY2ROU2k1MnVFS0FsN1FpMyto?=
 =?utf-8?B?K2lRN1ZsdUM0Smh3Yzd4ODhOM3ZPQzYwTFNBWVVZeDZra1hlbmN2akx0b2lp?=
 =?utf-8?B?QW1HY0NGbzA4VWwzQlBlaFFhUitvY0xndEN4WGlCOGZhNjRYUHc1Z2ZMMzlk?=
 =?utf-8?B?Q0JsUlpxclFDK2RyWEFueHc1QnJZMk9IZVFiRHhPV2hQSEc3dXRYbVZzTVFu?=
 =?utf-8?B?QitVUndBS0FOUHE1OG5VZE1lblRYYitYci82Vmt3bEZpSlVNMEZYN0IwOGps?=
 =?utf-8?B?VnhtYWJBcjdJZCtCVWNYZWx2cWNTZWJTR0pyYmcwTVg5SnRQWXdBZ0VPL1JI?=
 =?utf-8?B?MVBFSkFGUTNCclVVQXBNWllsV254TGlQMFk0cCtZN1NxOWFsYlVnei80MTZ2?=
 =?utf-8?B?RUg3TG1FWWhhWmZDZHZudHBwY0xJeUFpakxWSkRxVGlndjh2bXlqTFdhVXJz?=
 =?utf-8?B?bUNQV2c0VHNtaEhDenNFZC9FcDU1c0puQytXeHkwc3J4UjVtdVZUc3hmRUxv?=
 =?utf-8?B?RitsUG9KRXIwUFRqY1BDVmlFc0ducGVTZFpod0V5d3N3ZzZnbWVWajNlWkZh?=
 =?utf-8?B?WFFTeTdyWWdsSkJCN296R0lpQUNueWRldE1lK3Q5azVNdjBRbWhLaTZ4Y2Ey?=
 =?utf-8?B?aUc3K2ZpeFdQdVhDbXdtaW5RVWMrRGhyOXArTXJYdTFHQjk3enFxV0ZJU3ZR?=
 =?utf-8?B?YjZJVlFVbzlIa1pEakF2c2svaWdTVEVVNGV1MUhKWVZuOVo0UnIwT3NYbVB1?=
 =?utf-8?B?N2F1SjR5WGppWWp6andjU0F0K3lpOW9tTmRVSmRxcmVTL0dwbTNnZi8yU01D?=
 =?utf-8?B?SnFEMjdwaWRvUVlSZkRuQjhheFJUNldBdWRRMzVqTHh0M0FOeWlqZFZOT2pj?=
 =?utf-8?B?MHZmS2kxdnZrVS9reXBJWW1RY2RCamlrSHpZY1BsWlhqREFsSUZFc1RmWkU5?=
 =?utf-8?B?YmJWQU5XQ2dvOWU3MEpxTXhwdjB1Q0dIWDJ0WUtlem9sU2U1eklyY1lOZkNT?=
 =?utf-8?B?QVdkUzJON0Q0V2pMYlNyZzBia2ZIdkJJZXkxcjE1RUVFWVdwN2xkaWxpWmYw?=
 =?utf-8?B?YXpNT0cxc01nU21sRWNXTGpGQmorZkF2N0FNdmJRZE5JVFZEZUhTSGlPRVZk?=
 =?utf-8?B?Y3BlUldXQ3R6Ris3bHkzYnNhcWRSWm85R2tOTzRDZE5zcFJsMk9tVlBPVm9V?=
 =?utf-8?B?M0RGb2ludlAvUS9IWkNMYmhjL3VnY2J3OVh4TFl4TTRCMFEyWXZRbzYrTTVk?=
 =?utf-8?B?QkhHV1VmQndOZFg5c25FREt2Y2FpamdmekxpRmgweDNheU82Tml6d004a2VQ?=
 =?utf-8?B?WlE2ck5QU0N5b1FHblFmbUM5ZndKUnZMTU16eHJyU3ZpOFpkTER5S0dZYmtO?=
 =?utf-8?B?S1ZCNmg5OUNrZWJpb3lZL0FHaXU0L2NEb3lKYTllK0ZHK21yMm9sN2V1czJY?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ddb1a9-b81c-45a3-2f90-08da67dbea99
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2022 10:05:45.9939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vfy4/Dr4QHpdzXHW70jeC68cmnBBuPVcd9tHkQckZnD2/s2Nf5Y+ui8zfGSDA/M1ZGWjgeaVB4ONr8aQSFjXa3anHMZNWWQgrq9xT3g8SaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1873
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.com,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

On 2022-07-15 8:23 PM, Takashi Iwai wrote:
> On Fri, 15 Jul 2022 20:16:14 +0200,
> Pierre-Louis Bossart wrote:

...

>> This patch causes an across-the-board regression on all SOF platforms
>> using an HDaudio or iDISP codec. Only 'nocodec' platforms are
>> unaffected, see results at
>> https://sof-ci.01.org/linuxpr/PR3763/build394/devicetest/
>>
>> Reverting this commit seems to fix the issue.
>>
>> Upstream merge:
>> https://github.com/thesofproject/linux/pull/3763
>>
>> Issue and bisect results
>> https://github.com/thesofproject/linux/issues/3764
>>
>> I don't know what this was supposed to fix on the shutdown path but it's
>> clearly having side effects on the probe/init path.
> 
> Yeah, obviously the patch ignores the fact that hdac_hda does
> initialize the HD-audio codec without snd_hda_codec_device_init().
> 
> I'm going to revert the commit.


Thanks for the report and sorry the trouble.

This patch is still valid - will re-check hdac_hda.c and update it so 
that both the regression and the page fault are gone.


Regards,
Czarek
