Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DA74C707D
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 16:20:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E13D0173E;
	Mon, 28 Feb 2022 16:19:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E13D0173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646061650;
	bh=KFjqE6Ge6QzpcOYWJXmdxMy2zD/sQ0OJQbMUxzl4R3w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hO0ciygD5PSZ63DqxoaTgx2qS0pl2aAx4ZXWZpALikoe3PoMOX3wor14VAH6Y/vdX
	 MmgDeoGgHfyd/EPM9hEpZVEMjw1cd1tReMNX1ho9u6pngri0TuCY5yOk5b58UBM5Lx
	 rGjJ9MGrhI0adZjxPPi+wQl7YSrAE2qzIUB+laAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D899F80154;
	Mon, 28 Feb 2022 16:19:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E613CF8013C; Mon, 28 Feb 2022 16:19:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A7CDF80054
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 16:19:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A7CDF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PJ7/vbCW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646061580; x=1677597580;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KFjqE6Ge6QzpcOYWJXmdxMy2zD/sQ0OJQbMUxzl4R3w=;
 b=PJ7/vbCWhmP2SR8FkYNWyyJ/xV8J/HEnpDnstDX33Zgqq26gVrupOsOn
 YLaKe6vyfKosS3jri8Xkk14D3nT7CS4w6aUQi8lYQ1sVKVRiChb7KHoeF
 j+MWk/fOBo9nYKJRyuO/dJHZ2MuEMlgRjs0Lkvlw1zZmkKqxkHHYFnbUR
 0ICILklsmMAfcdEMtLoyNRz7pLH5EuWXNZaEdGbA/kjes6dTZsHc+nGoa
 Tu2oIqSJvSo7cfKaE7AE0tjAiEroll+zG6FueTrpgt2NQOIWqx0up1dem
 7lvNSVLuAsteJFz5vYtBD7ZKwEXhQKdVy+/bKITMQ34dr2cELYgOWrGJG g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="339340031"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="339340031"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 07:19:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="492746647"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 28 Feb 2022 07:19:34 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 07:19:34 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 07:19:33 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 28 Feb 2022 07:19:33 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 28 Feb 2022 07:19:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDh+cFuvQN7KegTKU6LVRqt6azjSyb3AQO3WWh/xXS1VKE/o4JBvl4BWKHWG+ojGUXehk+V4mDIOF6Pz6FvfXmD9OJdSol83KnqNPH3lAbs6X4PLlAgBIM8Y85Qtar89VTk1ojDCnvlqujEMi7pb23KLJWrAE20L0nh5AfJsyCX5mzjdk44rfHR2XLf8oeyjJ+176GYA83XgkLXHM124hzkyS7qwrslpXsnHmQF5uX5GkA5H4Ekv60FVypMRZQfSmjFEl3HYognxB9E2yXSUajJWdkalJnNiS8nBNyhTMWE/t977+sYNrcPk5p2UnzqLOTAReJXB9SOxuPnDz8AXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mOy0iWsYqp+MzIXithj3TsRuuRkfLfYCXsN/C2334o=;
 b=WfBLz8mX/Xu6KgH1yrEJzAwTXbSpg1Rlr7vewASSYG7fSrL+pErpfCWfThI9JD0g1R5xBsR1hqZnKGRqplH5p+h7vn1puXuBxhRKHi9hfDCC9v+aCjoGP/La/dXyZDO5w9JwphKB31oRH7WvKz54QMYN2Kh7DnOBUvFtsMtGW/Nzwlw6cHiGdAgDRCytqdbC3rFYXDrs+Yn2ExG+5U10IKjEXdooV1ox0+KX4uPRF7KJJEoAXEA2nGJYYF4dA1ONe70ZSKs0F7qgnw38GdJCKTkpwN7gQm1DGFvLKEIYkDnZARje6++dCKTIgl5BQ80ByRvANdQnkMx0e3QiLulIoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BN9PR11MB5275.namprd11.prod.outlook.com
 (2603:10b6:408:134::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Mon, 28 Feb
 2022 15:19:31 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 15:19:30 +0000
Message-ID: <211f1273-6f40-6e9c-452b-788fdc526f41@intel.com>
Date: Mon, 28 Feb 2022 16:19:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 04/17] ASoC: Intel: avs: Inter process communication
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-5-cezary.rojewski@intel.com>
 <c2f249df-0b3e-1032-6514-81fabb544b6f@linux.intel.com>
 <1a8c9196-0ae2-c25b-32de-15821c948185@intel.com>
 <d41c3acf-09e4-3822-7b13-211d4f71d22e@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <d41c3acf-09e4-3822-7b13-211d4f71d22e@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0311.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::16) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d11e133-b430-4238-556a-08d9facdb79d
X-MS-TrafficTypeDiagnostic: BN9PR11MB5275:EE_
X-Microsoft-Antispam-PRVS: <BN9PR11MB5275A6390FC9A42241F9537CE3019@BN9PR11MB5275.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KuxKHp064OqFIcpHg1j0CIjqGwVshtLXYnQjyjhusVgCb6tqS1PJT1cGjecz8V1Wzzq/JqBCYF57BDR3okldHMmnn8rehLqxxmaym27KXVT5j6GfTV4FzmQFGRwBCqASkNmJxRLfki5/geRVGpHv/VnvG3S4M0YDtmm+jtOweon/xtgS5n1cjzXwVsNM6tWMY/DD3gG9aC7V5cSkPaxNXBcZ0kqUdf8DvgN3mMtMfc/Qkk7opFMI36G6OQsgfj5cDZj81B2rq87OCwEsFzlzEFIh/oXzG+s8tXnAL8uUVNtsQ92MxNGP6Z1/gxQSZHp/UqIBOpwzeBNgV/r3eCx4D5Y/0AaBNvtdp/rHewltiEhIzKjxpmZ2HFHqzX0r4UGzCZbSV68X14a+aiSVLlxmuLEWGhhr1b3EjsX1S9uAT1t4TN9WGlFpzehezDVPh0yRX9J/H+Je3XORra3AOW6k+Np9I8Vuo9QaqoOsunwb9FP+zghS5DHi29JMIEUZJqnoTXK7vjAoJ/ZOzXr26/1Mr90tMPSg/XIv4PF5yENPgZEsfBtW7Hpxyw+Q7zGrUUxABENrAQjzt9AKvi3gTiY4jAUrqb+JZYzA1c9/m8Ml0Na2yqmSTUjeeFYGixP7uJNwCRcr8EQuMLWAEmc4uxw9RX6KsEpC1RRfnLFNdSL4PQaUnKfK705ZFeAjkJwYWngpGIKpamqjNKl0Zlx91XsBwN74XnXueXIoJmmVqQwPhpRMbjxc6lcMS6pQVR1F0DDychUlYKDALp/OxyhHdiXo1GkzVyTJj7cI5mND+GEIIGVDCcnd38TpS5F1IIqtxvEb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(6486002)(53546011)(31686004)(83380400001)(6506007)(6512007)(6666004)(8936002)(7416002)(5660300002)(44832011)(30864003)(36756003)(31696002)(66946007)(82960400001)(186003)(26005)(66476007)(66556008)(86362001)(2616005)(508600001)(8676002)(4326008)(316002)(38100700002)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Smt6cVFudTVUOXpVUHpJbUxjMkRobFkxcVcraFhzcFZmSnQ0eW8wVmtUV1BO?=
 =?utf-8?B?bGt5MGxpY3JtbUp6S1BqRmhiYzM4NXZDWmZGdzRQYnI0MFd5ckFtT09HTUla?=
 =?utf-8?B?blJYZE12NVdhVjg5VzFMeG12SVVvbll5ZjJIQUxYMXR1SGlJMjMwS3FtcGNS?=
 =?utf-8?B?NE5hYlVicFpmSm1nU2NKQ1pMSjVQVWpvMHYrbndnSFI0TFJVNDhLM05kV1lM?=
 =?utf-8?B?dFBQbWQvcDlqdnBMQWhGb1JISkpHK0Y1YUttcDBOTm9YQ0VJRTYyK2JSVTdR?=
 =?utf-8?B?LzRWZitoUWRjcEh0MWh4UGxBMlB0WUJNazZIbmpwcHp1T01WSzBTOXdLV2pj?=
 =?utf-8?B?eXVtNHpRc25ZcDJVM3RoQkdCend1aUVqaGg4M2ZwMkUyVUJsV2w5VG1RbzdU?=
 =?utf-8?B?NG54aUM4d1F1OFQ5MVRvam5RWHE5SHFkc2hGZXRYUCs4ZDBEVVgzRHMrZW13?=
 =?utf-8?B?Um5FY0xTc2taaHRPd1pnSFhDYUthWHF0Um1pbnQydVpOUENFWW5mczVaaW04?=
 =?utf-8?B?YXZEalBLS2VhL3NGZVFOTEZoZkFxUStLaVFTYWZzU0ExSzBpNmk0eWMzV0VW?=
 =?utf-8?B?TGpLQVcya3p0K3RvVGFGcEp1a013QW9BN0w1aVJnbFdNeVZ1eEZBR3JocDI3?=
 =?utf-8?B?U3N2bWQ4UVUwbEhvQ3lOaVFSbEU0M1ViZkVWN2pkUFREMXVBOEFBdktYK1A5?=
 =?utf-8?B?WEIvNlFhZ1A4SDJ4YXg4QTdNUFZ5WHJBUnRpbmV3d0Fxb2VSY1RIVHlvQUJW?=
 =?utf-8?B?VStrRURlWXZkTXZWQktyVHFqdmVjZTFabTd2VzZKYUVSNjV5Z2U1bWhtek94?=
 =?utf-8?B?NWluaWFnOGc4a1M2aFdoazY5WFNabU1lcWt0a2czaTl5b3NOdk50bVFJeFRr?=
 =?utf-8?B?dWtBWmZ4eEs4YkJJT1FJRTF0K0JzZFMvUTV5R3N2NnJNVkhwZGZLcnRGMVho?=
 =?utf-8?B?TzFXU1dLQ21MT2o5K3ZlbDdGa3RidGtlYTZGNFAzdWViUjF4N2NQVjBlbFRW?=
 =?utf-8?B?dnhZRW42ODJ5V1dBb0UrY28vVWNOQVJZOUplN0RFMWpyelRNWWloM0ZsbUFZ?=
 =?utf-8?B?bE11OEEyQk5MNU5UZDJPemp0Ky9YOXY1YjFDczZZaUc0RGRLZUJaeDhFdkRR?=
 =?utf-8?B?MFZwaERMWkJuSEYwUWRrb0V3Mmw5MWIzcnFBamNMdzlnZHpmMlBkNGZyMnU5?=
 =?utf-8?B?UTJ1UlVPTTBTaDl0M2I0RUREb053WDFZS3BVMzQ3SDV3cGxOd3pHVWxRWmw5?=
 =?utf-8?B?c1VacVVNc2RhRkk4aVo2alNaT1d3dFhnSVpWTmNTbDJFTUtmODA1LzdYT0E3?=
 =?utf-8?B?MFhKNGdLUGNmOVdDYVgvMjM5M3RYRGxHdkVIS2ZKZlFaZW1ydVFxMFQxUnpO?=
 =?utf-8?B?VTM2TzhOdVBZRVcyQzVuemhLb0pPbmkxK212NGVkL2lTWVNNellWTE5VMXpv?=
 =?utf-8?B?N3NZKzMyYUUxMFVGUTlEby9UZWlJSGxmaHhBS3J1UjRjZzBOZmwvTUFlU1Ur?=
 =?utf-8?B?SytrTzVUR295ZGJRRkVwalN0YzFjS0JYR0RZckF4cW16K2RyZis2NW1SRUVY?=
 =?utf-8?B?bjZFVGltS3V5enhDZTh6QXM4TFFDT2RzSkxNb3ZNbEpJcU5WNzVzalN5NUEx?=
 =?utf-8?B?bDZxMlZVbWx4L3VicW9Xa1BjZUo4anZGZU1iQ204STVYWWJodjRUSTMwaFJu?=
 =?utf-8?B?d2huekg0MTVrSG1tOVZpeW1FTmdqTzRZdW8yYUZpS2cxZGlSNlZPM1lScXl6?=
 =?utf-8?B?RklHNmk5NDgxUHZtMlhsSlJoa0pxVE9yUDBUK0cxeDdyNHkxYUYwakV6NmpI?=
 =?utf-8?B?TVVZUktBUDhyc29tMzZuazFlcEUrL1RiNVgwcUhVSUV1dW03b0RTbFJ3WWJr?=
 =?utf-8?B?ejZYbnFHakE0dHhHaVc2dmdwWVVRZmV2SDFkRURLSDZFUC9IOVU2N2NqSGEr?=
 =?utf-8?B?cXdmdEpTanhsdlFkeVNONHJRVjFWRURuOWN1d0NjY0p6ckNkemdtN2MzNnJE?=
 =?utf-8?B?ODI4ZUduL0prL0tlME84VmEyVldtd2t3WnFVR1Q5aFl1aUJSN2dSNzQ5UVg0?=
 =?utf-8?B?VGJPMHNKM1J0TzI2WFUyeXg1eWNJMkRYQjZYRGw4eFgyMDd6S01sdGJ1MEF2?=
 =?utf-8?B?a00wb1RaN1VKWlp2eWRoVEIwamNIb1o1N3pDaGJJRXlSN0xkSTduYUFVUHVZ?=
 =?utf-8?B?bm5BYTZQVnllcDZLL3UyM3hlTkRLSXlBQUp5M3Y5Y2dwZVNwWVN5MkhLN3NF?=
 =?utf-8?B?cE5xNGtwdTVhVzBRSFIyeCtDSkVRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d11e133-b430-4238-556a-08d9facdb79d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 15:19:30.8385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IuA6Z+Mwpn4+XBJ3Yo60Wa45OfR4OrokQwhsNHpka8dVjdZUEQzGq2KrVYSJRHEbY/ja6YsggI/EUjcu7Bmkey4ujJsdpV+yR4skOlS7Ft0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5275
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

On 2022-02-25 9:37 PM, Pierre-Louis Bossart wrote:
> 
>>>> +static inline void avs_ipc_err(struct avs_dev *adev, struct
>>>> avs_ipc_msg *tx,
>>>> +                   const char *name, int error)
>>>> +{
>>>> +    /*
>>>> +     * If IPC channel is blocked e.g.: due to ongoing recovery,
>>>> +     * -EPERM error code is expected and thus it's not an actual error.
>>>> +     */
>>>> +    if (error == -EPERM)
>>>> +        dev_dbg(adev->dev, "%s 0x%08x 0x%08x failed: %d\n", name,
>>>> +            tx->glb.primary, tx->glb.ext.val, error);
>>>> +    else
>>>> +        dev_err(adev->dev, "%s 0x%08x 0x%08x failed: %d\n", name,
>>>> +            tx->glb.primary, tx->glb.ext.val, error);
>>>> +}
>>>
>>> we've used such functions before and the feedback, e.g. from GregKH and
>>> Mark Brown, has consistenly been that this is pushing the use of dev_dbg
>>> too far.
>>
>>
>> In basically all cases the outcome is going to be dev_err(). dev_dbg()
>> is here to help keep DSP-recovery scenario viewer-friendly when checking
>> dmesg. Ideally, there should be no DSP-recoveries to begin with : )
> 
> I will refer you to this thread:
> 
> https://lore.kernel.org/alsa-devel/YGX5AUQi41z52xk8@kroah.com/


That's an interesting lecture, thanks for sharing the link.

Most of the time, we do want to dump an dev_err() if function fails for 
non-trivial reason. During recovery scenario though, we force-disconnect 
all the streams before attempting DSP reboot. That results in "wall of 
red" i.e. error messages. Since we know that all these errors are caused 
by the disconnection of the streams, there is no real value for flagging 
them as errors. It's debug-friendly (for a developer addressing the 
possible problem) to have only important marked as errors in dmesg.

Also, avs_ipc_err() has a very specific purpose and is used only by IPC 
handlers and nowhere else.

>>
>>>> +#define AVS_IPC_TIMEOUT_MS    300
>>>
>>> skl-sst-ipc.c:#define IPC_TIMEOUT_MSECS         3000
>>>
>>> that's one order of magniture lower. please add a comment or align.
>>>
>>>> +static void avs_dsp_receive_rx(struct avs_dev *adev, u64 header)
>>>> +{
>>>> +    struct avs_ipc *ipc = adev->ipc;
>>>> +    union avs_reply_msg msg = AVS_MSG(header);
>>>> +
>>>> +    ipc->rx.header = header;
>>>> +    if (!msg.status)
>>>> +        memcpy_fromio(ipc->rx.data, avs_uplink_addr(adev),
>>>> +                  ipc->rx.size);
>>>
>>> it wouldn't hurt to describe that the status determines whether
>>> additional information can be read from a mailbox.
>>
>>
>> Isn't that consisted with the behaviour of typical API function? Do not
>> copy memory and return it to the caller if something went wrong along
>> the way?
> 
> oh, I thought this was a case where the header contains all the
> information, and only in specific cases you need to read stuff from the
> mailbox.
> 
> You definitively need to add a comment on whether this is an error
> handling or a feature.


Ack.

>>>> +void avs_dsp_process_response(struct avs_dev *adev, u64 header)
>>>> +{
>>>> +    struct avs_ipc *ipc = adev->ipc;
>>>> +
>>>> +    if (avs_msg_is_reply(header)) {
>>>
>>> the naming is confusing, it's difficult for me to understand that a
>>> 'response' could not be a 'reply'. The two terms are synonyms, aren't
>>> they?
>>
>>
>> Those two are not the same from the firmware's point of view and thus
>> they are not the same here. Response is either a reply or a
>> notification. Replies are solicited, a request has been sent beforehand.
>> Notifications are unsolicited, you are not sure when exactly and if at
>> all they arrive.
> 
> add a comment then.


Ack.

>> Just so I'm not called a heretic later: yes, from English dictionary
>> point of view these two words are synonyms. In general, wording found in
>> this drivers matches firmware equivalents wherever possible to allow
>> developers to switch between these two worlds with minimal adaptation
>> period possible.
> 
>>
>>>> +    /* DSP acked host's request */
>>>> +    if (hipc_ack & spec->hipc_ack_done_mask) {
>>>> +        /* mask done interrupt */
>>>> +        snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
>>>> +                      AVS_ADSP_HIPCCTL_DONE, 0);
>>>> +
>>>> +        complete(&ipc->done_completion);
>>>> +
>>>> +        /* tell DSP it has our attention */
>>>> +        snd_hdac_adsp_updatel(adev, spec->hipc_ack_offset,
>>>> +                      spec->hipc_ack_done_mask,
>>>> +                      spec->hipc_ack_done_mask);
>>>> +        /* unmask done interrupt */
>>>> +        snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
>>>> +                      AVS_ADSP_HIPCCTL_DONE,
>>>> +                      AVS_ADSP_HIPCCTL_DONE);
>>>
>>> does the order between the complete() and the next two register updates
>>> matter?
>>>
>>> I would have updated the registers immediately and signal the completion
>>> later.
>>>
>>> I am also not sure why it's necessary to mask the done interrupt then
>>> unmask it. There is nothing that seems to require this masking?
>>>
>>> Or are you expecting the code blocked on wait_for_completion to be
>>> handled with interrupts masked, which could be quite racy?
>>
>>
>> Given how the things turned out in cAVS, some steps are not always
>> required. Here, we have very strict implementation and so interrupt are
>> masked.
>>
>> I'm unsure if relocating complete() to the bottom would bring any
>> consequences. And no, the code waiting_for_completion is not expecting
>> interrupts to be masked as there is no reply for ROM messages.
> 
> it would be just fine to add that the masking is added as an extra
> precaution, the order does not matter and the code executed after the
> complete() does not assume any masking.


Ack.

>>
>>>> +        ret = IRQ_HANDLED;
>>>> +    }
>>>> +
>>>> +    /* DSP sent new response to process */
>>>> +    if (hipc_rsp & spec->hipc_rsp_busy_mask) {
>>>> +        /* mask busy interrupt */
>>>> +        snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
>>>> +                      AVS_ADSP_HIPCCTL_BUSY, 0);
>>>> +
>>>> +        ret = IRQ_WAKE_THREAD;
>>>> +    }
>>>> +
>>>> +    return ret;
>>>> +}
>>>
>>>> +static int avs_ipc_wait_busy_completion(struct avs_ipc *ipc, int
>>>> timeout)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +again:
>>>> +    ret = wait_for_completion_timeout(&ipc->busy_completion,
>>>> +                      msecs_to_jiffies(timeout));
>>>> +    /*
>>>> +     * DSP could be unresponsive at this point e.g. manifested by
>>>> +     * EXCEPTION_CAUGHT notification. If so, no point in continuing.
>>>
>>> EXCEPTION_CAUGHT doesn't seem to be described in this patchset, so not
>>> sure what this comment might mean.
>>
>>
>> Comment describes the circumstances for the communication failures and
>> arrival of EXCEPTION_CAUGHT notification is one of them.
> 
> that detail is unnecessary for reviewers.


Ack.

>>
>>>> +     */
>>>> +    if (!ipc->ready)
>>>> +        return -EPERM;
>>>> +
>>>> +    if (!ret) {
>>>> +        if (!avs_ipc_is_busy(ipc))
>>>> +            return -ETIMEDOUT;
>>>> +        /*
>>>> +         * Firmware did its job, either notification or reply
>>>> +         * has been received - now wait until it's processed.
>>>> +         */
>>>> +        wait_for_completion_killable(&ipc->busy_completion);
>>>
>>> can you elaborate on why wait_for_completion() is not enough? I haven't
>>> seen the 'killable' attribute been used by anyone in sound/
>>
>>
>> This is connected to how firmware handles messaging i.e. via queue. you
>> may get BUSY interrupt caused by a notification while waiting for the
>> reply for your request. Being 'disturbed' by a notification does not
>> mean firmware is dead, it's just busy and so we wait until previous
>> response is processed entirely.
> 
> this does not clarify why 'killable' is necessary?


Usage of 'killable' variant adheres to its documentation. Sys calls can 
terminate the waiter. More user friendly.

>>
>>>> +    }
>>>> +
>>>> +    /* Ongoing notification's bottom-half may cause early wakeup */
>>>> +    spin_lock(&ipc->rx_lock);
>>>> +    if (!ipc->rx_completed) {
>>>> +        /* Reply delayed due to notification. */
>>>> +        reinit_completion(&ipc->busy_completion);
>>>> +        spin_unlock(&ipc->rx_lock);
>>>> +        goto again;
>>>
>>> shouldn't there be some counter to avoid potential infinite loops here?
>>
>>
>> This is not a bad idea although the counter is going to be high e.g.:
>> 128. With DEBUG-level logs enabled you can get ton of messages before
>> your reply gets finally sent.
> 
> dev_dbg() in interrupts is usually not very helpful. we're trying to
> move to traces instead.


Wasn't precise enough, I appologize for that. By "DEBUG-level logs" I 
meant firmware logging, not dev_dbg() on kernel side. When enabled with 
log level DEBUG, you will get at least 1 message per sys tick, resulting 
in gigabyte logs in no time.

>>
>>>> +    }
>>>> +
>>>> +    spin_unlock(&ipc->rx_lock);
>>>> +    return 0;
>>>> +}
>>>
>>>> +static int avs_dsp_do_send_msg(struct avs_dev *adev, struct
>>>> avs_ipc_msg *request,
>>>> +                   struct avs_ipc_msg *reply, int timeout)
>>>> +{
>>>> +    struct avs_ipc *ipc = adev->ipc;
>>>> +    int ret;
>>>> +
>>>> +    if (!ipc->ready)
>>>> +        return -EPERM;
>>>> +
>>>> +    mutex_lock(&ipc->msg_mutex);
>>>> +
>>>> +    spin_lock(&ipc->rx_lock);
>>>> +    avs_ipc_msg_init(ipc, reply);
>>>> +    avs_dsp_send_tx(adev, request);
>>>> +    spin_unlock(&ipc->rx_lock);
>>>> +
>>>> +    ret = avs_ipc_wait_busy_completion(ipc, timeout);
>>>> +    if (ret) {
>>>> +        if (ret == -ETIMEDOUT) {
>>>> +            dev_crit(adev->dev, "communication severed: %d,
>>>> rebooting dsp..\n",
>>>> +                 ret);
>>>
>>> dev_crit() seems over the top if there is a recovery mechanism
>>
>>
>> There is just one dev_crit() within entire driver and it's there for a
>> reason - communication failure is critical and in practice, should never
>> occur in any scenario on the production hardware.
> 
> git grep dev_crit shows mostly this being used for temperature and
> shorts in codec drivers. that seems more 'critical' than a communication
> failure that likely does not result in spontaneous combustion.


Few dev_crit()s can also be found in other components as well.

Without audio and graphics there is no real 'user experience'. Abrupt 
closure of communication between DSP firmware and kernel driver can, and 
usually is a consequence of either an undefined behaviour (in process 
running on DSP) or hardware issue. While I can't spare the details here 
for obvious reasons, not all situations can even be recovered with 
reboot. That usually depends in which power wells registers reside. The 
100% confirmed solution for laptops is removing battery for a second or 
day to force G3.

Considering this, I believe having a single dev_crit() here is justified.


Regards,
Czarek
