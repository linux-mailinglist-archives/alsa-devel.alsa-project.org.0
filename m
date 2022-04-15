Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 384AB506B8D
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:56:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC24E1838;
	Tue, 19 Apr 2022 13:55:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC24E1838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369404;
	bh=a6Vkg7FEH6dsHMK69JH6mX4NDITt0axxS2FfEqNjLIY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PIPk9rBZCARvyKtmdKCCVlV3d1+SE7U+w5FABanzQ88uRLS68u6SY84OZjbbY9Wm9
	 CDjwCjzF0O3l2NLYYpdagl0JtABortfvHtuSzuFmqAb/Rub4WqqOPPor+txXzndG5q
	 2AZuF5wf27nz4o1f8kaAQXjcph2P5QLorubJ9GB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A4C8F80559;
	Tue, 19 Apr 2022 13:52:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0BEBF8016A; Fri, 15 Apr 2022 10:25:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72F1AF80095
 for <alsa-devel@alsa-project.org>; Fri, 15 Apr 2022 10:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72F1AF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jYS5+/kC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650011151; x=1681547151;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a6Vkg7FEH6dsHMK69JH6mX4NDITt0axxS2FfEqNjLIY=;
 b=jYS5+/kC0uXyW1sL+Vjv8r93Zqo6l1/jAM/eljLsFbO78ceO8QdWfpBx
 jpqcu8vRiYf32R6JLHEEBT9EBoDSjZuSyjApmuTn7x4kYzupaHHYcGIUD
 qvE/W4NQOF6g94Yi1ZSwrifm88eBkrzDAqKSfi8Rklcwa0GvUYb9t8Y5N
 IY7oQeSiSgJIQT9Y2s3edSovxUZwlp1alIBltgPzmBQSiM3omepG8SaP+
 bMt8MsvNAVyyqOeu9YvYHCqzmysYbB4JTbAaivjVBGIp9g+o8BzsMulWR
 M94v0hfBXrfmo29XLqon7LlyglxpKOMl8TtjpPjt4+hsksopwS5PWQnAy g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="323562627"
X-IronPort-AV: E=Sophos;i="5.90,262,1643702400"; d="scan'208";a="323562627"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2022 01:25:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,262,1643702400"; d="scan'208";a="700987469"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2022 01:25:46 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 15 Apr 2022 01:25:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 15 Apr 2022 01:25:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 15 Apr 2022 01:25:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtNulRk60W6zfeG7ZrYlVWflkvOiJy1fmsUfA1I4u6prlgy9Ha91jQtAQn3eCjLCdezoYk/0cFtS0ftt0tUezbnWsVDUpSyfOGBphsHcBRT3P+mIGROOHJrrL/aaQrtCl6A5vUQIjVtLYmPfRV6VnZAKDY5jD8ALZVWgFhiJSK8L/tILx8w+UbS0Y8/H2qmIv7waKcHshJuTiutj5MHNcEKjyyUkAVbY7wzadA0fCkYJS5oUj/5wjWBA8R8HxtvvLDaeZ9Ky+pVrHQwnJbrHp8IZWN8T1Qoa9tTuQxEnmTrQQ8P/IK0sd2VOrJJrhQSDCHbN3gbUoaSOPCHi8QLfcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRGXvTJbDtr4O3mPXICGmbCuPU+bp4O9sVRJ1E1aao8=;
 b=mpJNvlb4Iim7R8APuc2FQFJYHnI+QV9FK/1Uw/xdX/PuAUgdSxqN5BFFCX5Nx7+7926fTVTYvxBTylcw+2ITEpbUCmeWYFXYAr8aGFTjEjhTwD4DTQSbnSf1x1TaMCt5jv9nL7oxHUDyX+DCCDvkytTyDkOkLGi0UDLj4UoGxPmXW/sxu/4+tI1jefblnYOWaH8gSbOgTlSDJ+zB+yuKWv/dP0wojard2ICJZTe7tNbOz9r2Os/xxynzLBqcCR5t/uuf0J4pdN5DTg/VV65cA5pqyaW/I7dC/0zP2BceZelLCTV8uZwpWS/RlSGcHoBNPvqkEsxiqmhMYesRPAgZUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2961.namprd11.prod.outlook.com (2603:10b6:208:76::23)
 by CY4PR1101MB2344.namprd11.prod.outlook.com (2603:10b6:903:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 08:24:59 +0000
Received: from BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::109e:c1bf:57a6:c1fc]) by BL0PR11MB2961.namprd11.prod.outlook.com
 ([fe80::109e:c1bf:57a6:c1fc%6]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 08:24:59 +0000
Message-ID: <e365082a-672d-8cdc-2117-1af9e4a6fc89@intel.com>
Date: Fri, 15 Apr 2022 10:24:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] ALSA: hda: handle UAF at probe error
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20220414182437.14944-1-nirmoy.das@intel.com>
 <20220415042356.arajaxgmzbkzltc4@ldmartin-desk2>
From: "Das, Nirmoy" <nirmoy.das@intel.com>
In-Reply-To: <20220415042356.arajaxgmzbkzltc4@ldmartin-desk2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0031.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::44) To BL0PR11MB2961.namprd11.prod.outlook.com
 (2603:10b6:208:76::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce8d078b-f61a-403a-90bb-08da1eb96e06
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2344:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CY4PR1101MB2344496B03B032EAEC5E2E0899EE9@CY4PR1101MB2344.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uxm+0Zdwl08MtyDK1L8+uvQLI1086c4aggmYxkuYT8Fx1ubc1cHrkn1r1LH12l1fvZKEcikdmCOkGhjT04wdamT1KVi4Ygmf+MXbMlHSyhsi1ubV4aSF59vlfIEupTSA/gNJJAWEa053htJ49+V0ZrtB+Vzd9e8xSHA9Nusylzi7653UkTPen3JeWZM1n6o11x1PrFDi50KbP9aoyeypRpES/wk5TaRyu0O01MKePFbIabr++ofP3rd8ed5r7FZPdUWfFGRERLkn+j2W6VRHmupsSxpSqwUwvYQGwHqoJ0P/WShbWYCEIBCKjONToBfZsrLu4+hspBq5tz7ExWtxazCZDzD6dfJMJOFrP1cMQLubh1RWWSiZw2tzyGCeqmvlU8ioGZnRByVDas4FfSAYf6L4cGcxKap/m1UH9Jty5bp/zTSYeY8I8Op7eLBJObdc4een4ATfl7XSIgM9H3y0LtLEtvPBuefe447S8A3ZXASEACoP+9YREfWpX0U10B+BLlw//SUQTKqfGxmtgTvhaoZnPTIHGXpcg3ybM+6QX1/zq0HwSPvh7TXOCeGmruArVGoOYeeWau+s+8FrXNDfmYOnKzA0fo8vSbG5CtEEpscP/cZGheMQ70Q6+MF+c2yiPKdOChcUFFq44bv9NLKj2ETkQT+xLVbcJBZAT5XIVpgz2WQ3TgiR36n2zoNfPD8MqsGiXwY7v0A2N6kVv8Xp8IUYOzuDI9fRKszD+eDJEqWHP1Vw9SVSdksCChdzHxuXKup2S6lEMRuvpC1MCBVQ/8E94M6hZc6Y0AXkiJKf4rMap29d9psQiSY/el4rTNK4bqn3luBfipJSi1Ji9WF2+9wNHC75XZCps79LmhISuK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR11MB2961.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(186003)(37006003)(6636002)(53546011)(966005)(36756003)(31686004)(6486002)(508600001)(6862004)(66946007)(66476007)(8676002)(4326008)(66556008)(8936002)(6666004)(82960400001)(86362001)(26005)(5660300002)(83380400001)(316002)(31696002)(6506007)(2906002)(38100700002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1g3NnF4THFDYXVLaFpPYytLSGRNU2ZxRnpaZytnanFCdGZaMEFxNkh1ZHBG?=
 =?utf-8?B?VUJqQ2pwY1pjYldhUUZBMEwyNW9GcHBJMzJTSnZ5eU9SZU0xUTZzdjMxWFU2?=
 =?utf-8?B?aDhjZlN5bUwxN3JadHRyakNKdUtobk8zNjRnTkc5bm53aW1JdVRSUnJhNldo?=
 =?utf-8?B?VzVyVit5eWF4eWZ6U3NrOVdkSzM1aXMxSXVKZkwzQUhNNUY0S1UvaVVrQU9r?=
 =?utf-8?B?NjZyVkptVkROTkpHaHJia003S2xUUi9BWEhsMkRqbzJ1Si91Tng3aWxQTS9P?=
 =?utf-8?B?UGg3Q0lFamRtYWI0bXVIVER1V2I2MWxiNjdESU16SzVodHBidlYvR01ZVzlj?=
 =?utf-8?B?a0p4Wm92RGE5WFNRcGVpZFl4R2R2a1NydGs5VmxnMjZBakxHbXc2ZElVSUUy?=
 =?utf-8?B?QVNqNVJOOTBqaG9sem4wNHIxVjEzVGM2eTBhODJtaGdScVkwTE5wbFpROEZi?=
 =?utf-8?B?K082MkpPKzdxNmlQWHdDMkN1VWZ2eVZIdlBNRVh4czZ1aUpHcGRSYmlGTmRq?=
 =?utf-8?B?eFh0RTAreEh6S0IrSGlKdEtIMzc3SXcrdE5FS21hRnhmUVFiUDM4b0N6ejhr?=
 =?utf-8?B?cDJYUytHd3lvYUtoR0JsL3VhRWphdHpPbE4vUEgxV2xLcFlpdXJjVDV3ZDdE?=
 =?utf-8?B?cGpYYnRGd2JRUGVOejY2c3kybDF5NEViQ05GVzk4MlFSODY1NHZwVTlLRUZZ?=
 =?utf-8?B?S0RQRXdEblVkV1VFdEV3Z0tOUmg3Q242L0ovUFVOR3hzRDl0U1FlWGpEaExo?=
 =?utf-8?B?UXlFOUZsUmJTU3k1ejV2b3d5ZkZuZU83M3hvSzRzaEFmODM3SUQwa0piT2tB?=
 =?utf-8?B?S2h0aHRWUmxlNWI2YmZNOHIzQUhXaW0xSDNwWDJjclRVaHA3UytEYkRZaEhV?=
 =?utf-8?B?dWJvN3RuNWhaTTBRUThVQkp4WHNZaVNQd3c2S2xDYmJRSTRhN2JORHUvUWUx?=
 =?utf-8?B?c2krM3RBeUgrZjc4a0FsWEovUnFWTVVvcHBwcGV2dkZOMWZTbWhCSWdkRjBO?=
 =?utf-8?B?ZG1CcVYvUVprUTVuMTc4UG1Gc2xUM1pnbWJsSjRDcCtOcUlUQmF1Yms5MHNF?=
 =?utf-8?B?MHFKVktPZU5XNWVjdVZzL0wvcUdZZ2lKVFFOQ25QSkpCbldGM3R3MGFBQTJY?=
 =?utf-8?B?NTJVWjJuZUdLVVFjRjFMdW9FKzhMaU5GaXBBUTRvdnl2V0dFZE95c1hmWi9y?=
 =?utf-8?B?Wmc2QWVzK1hlUHRLUjM3SGs2aERld1E4OFdZdFpsYlZ5VURHUEVTbnFIY3l5?=
 =?utf-8?B?WnJvbGMydEZ4aDBHazBJeWpuUlY4WEd6SXdsNnQxb29FTGZwQVlRVHJEWFp5?=
 =?utf-8?B?NkNLcnhYRlN3RU1qRURzS3lJT2JmRE5qSHhVcGJ0WUd1MElMbkpGM1NsNWYv?=
 =?utf-8?B?S1hLRTBqaGJYOE1MaWttV3VieDBGVS9iTkFGall4dVdsakdGR1lacWR5aXht?=
 =?utf-8?B?cTRySHQxc0t5MGZuM012dXRyRTNRMDlyRlYzQXdxc1JwRURiNGwrd2o5Wjkz?=
 =?utf-8?B?bUIralpHcVdmSy9pU3ZPYzU4VHRJWmpDSGswd01wY3lQdFJzZktoeFlyVjFj?=
 =?utf-8?B?NGhDZkJYeDRDV1ltY3BsK3BxcGdRMFdhdG1qY1BjUThsU01QblNKYXdHbjYx?=
 =?utf-8?B?dVZPNmRRNXBFaDMxSGtxTHJIdWxVQjV4Nkd0SForQXRhbXA5cit2Yk1uVk5S?=
 =?utf-8?B?ZWtUdEVwVnRtTnhXaUdiZFltK2Mxa3ZxUHVwYTBHbzlRb1pucDFuVGk5UCs4?=
 =?utf-8?B?VnhibTN0ejMxWmo5YjBvYXNJa1g3WCt2RkhZYmt2OFRla0VFejd3MG5ZaFR3?=
 =?utf-8?B?aVNtTklFelZXeWdaTGg3M1NvNXB4TVhMTlNaZWp2L1lHUndvUWhVWit5NjZ4?=
 =?utf-8?B?NXdxT21BM2RuQnB3eWluTUd5Tm94eDdvTENES0N1cDhHWE1ZY0pIV1UzYnhD?=
 =?utf-8?B?UGRTMTg3VmtvV1hEazhmS1loZTRBemhLTW5sL2ZDN0RvOC96KzAxaU9tN1NV?=
 =?utf-8?B?anUxcnBGakJiQ1hxNjEyVGV1eGtlU1o3TnF0Q0JneUdrOXYrZEJkRnpTWUJJ?=
 =?utf-8?B?ejMvZS9SMzdRczRZNVA0RlRUbUpoQXNDNTdjNnBscGZTRFdyYTlENlJtVFFx?=
 =?utf-8?B?a0V2anY4R1VHNWN3Nk9nWnJYYVVvWklxOVcrTTBRTHdIaUx4YTZUY0Rvc1Jw?=
 =?utf-8?B?dUpVWnJhaHRXVUoyWXNERENBTmVwS3NVdXh1SmFxNUZHZGFHNHYvenFZc2dO?=
 =?utf-8?B?VEY2anJoTU85RGVSSHF0Ukl3NzFISVlpalJlYlczSVVodVAvWEZYa2paT3o4?=
 =?utf-8?B?cklkdkJpeWRqVWp1ditXSnY3NDQ3OHhvdFpFVi9JMmNRVTROcXg0dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8d078b-f61a-403a-90bb-08da1eb96e06
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2961.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2022 08:24:59.1928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ng6gGZmEBHdjbeptlvWYDyCZO2KEUhbg7HnrYUIWR2i2wxRKTMg1z6ZqbGBdDnwB6ffr0JBei0B9jU2TW+Z81w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2344
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:52:23 +0200
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, kai.vehmanen@linux.intel.com,
 matthew.auld@intel.com
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


On 4/15/2022 6:23 AM, Lucas De Marchi wrote:
> On Thu, Apr 14, 2022 at 08:24:37PM +0200, Nirmoy Das wrote:
>> Call snd_card_free_on_error() on probe error instead of
>> calling snd_card_free() which should handle devres call orders.
>>
>> Issues: https://gitlab.freedesktop.org/drm/intel/-/issues/5701
>> Fixes: e8ad415b7a55 ("ALSA: core: Add managed card creation")
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>
> This failure in i915 CI seems suspicious since is around module removal.
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_102714v1/fi-tgl-1115g4/igt@i915_suspend@system-suspend-without-i915.html 
>


Yes, the issue is related to module reload  because I can reproduce a 
UAF by running the module reload test twice.


> And it seems it didn't fix the issue in dg2:
>
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_102714v1/bat-dg2-8/igt@gem_lmem_swapping@random-engines.html 
>


I guess this is some timing bug around device hotplug  as this patch 
seems to help even though this driver doesn't use devres. I need to 
check more.


Thanks,

Nirmoy


>
> Lucas De Marchi
>
>> ---
>> sound/pci/hda/hda_intel.c | 7 ++++---
>> 1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>> index 82a45f2b31c4..eb4228c9e37f 100644
>> --- a/sound/pci/hda/hda_intel.c
>> +++ b/sound/pci/hda/hda_intel.c
>> @@ -1730,7 +1730,9 @@ static void azx_check_snoop_available(struct 
>> azx *chip)
>> static void azx_probe_work(struct work_struct *work)
>> {
>>     struct hda_intel *hda = container_of(work, struct hda_intel, 
>> probe_work.work);
>> -    azx_probe_continue(&hda->chip);
>> +    struct azx *chip = &hda->chip;
>> +
>> +    snd_card_free_on_error(&chip->pci->dev, azx_probe_continue(chip));
>> }
>>
>> static int default_bdl_pos_adj(struct azx *chip)
>> @@ -2028,7 +2030,7 @@ static void azx_firmware_cb(const struct 
>> firmware *fw, void *context)
>>         dev_err(card->dev, "Cannot load firmware, continue without 
>> patching\n");
>>     if (!chip->disabled) {
>>         /* continue probing */
>> -        azx_probe_continue(chip);
>> +        snd_card_free_on_error(&chip->pci->dev, 
>> azx_probe_continue(chip));
>>     }
>> }
>> #endif
>> @@ -2338,7 +2340,6 @@ static int azx_probe_continue(struct azx *chip)
>> out_free:
>>     if (err < 0) {
>>         pci_set_drvdata(pci, NULL);
>> -        snd_card_free(chip->card);
>>         return err;
>>     }
>>
>> -- 
>> 2.35.1
>>
