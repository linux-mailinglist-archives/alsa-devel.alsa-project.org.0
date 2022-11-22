Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D88963433B
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 19:05:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E264E163B;
	Tue, 22 Nov 2022 19:04:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E264E163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669140312;
	bh=7g0sExWEr6kRZ/wkZa5ZAag3/IzNokrb5E/U6dx0uXM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TkdgSKtLmmkTCr9FZK04bKXxXOC048cOwWTApdGi8Xax+wKi9uOldgjB3cIoK5s06
	 TOcIV4VcXx+i2Z8NF7eE34CYvT8Ef0Octhy/Bsi45/nbd+R0JrIuf2jhcemTsRzns6
	 2369qFwyVmH/LfuzXEkKJRkwm14UUmvKCwLrVrCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C0AFF80310;
	Tue, 22 Nov 2022 19:04:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C2EBF80272; Tue, 22 Nov 2022 19:04:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 558F1F80149
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 19:04:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 558F1F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XmwsphtF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669140249; x=1700676249;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7g0sExWEr6kRZ/wkZa5ZAag3/IzNokrb5E/U6dx0uXM=;
 b=XmwsphtFm1oepoHS3iDZGoUOTKme/IjlYao4neFQVuDoiNfP+QB31xi1
 tFzywO79+03FYb3YJhJxHjP3vbOfSwXVGnpNpEMF2kHG1Z505YLfs8Vwq
 k5Ju6iTv3cjT0GlSSiSqApi3JYO52RUqD8Wr6ZcNAUqPKuuGfPyKl5JzA
 vWzZocUwNY7TG8m0jo2bh2pmwy2gFWBFYSkSDAzVTaqIyT/klxE5MAeiE
 EAX3yoA8Ym4Pl+bnYF42ytM7qiz9bw7h8eMR4XoYtutIG+WqWtt/YWcNi
 qZES0S90Fp7lVivd91rpBeuZsNAbYoB2qjudbkcBKFiAU4kpL8Q+Ivd3E w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="312579045"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="312579045"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 10:04:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="592225328"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="592225328"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 22 Nov 2022 10:04:01 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 10:04:00 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 10:04:00 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 10:04:00 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 10:03:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ao3NKcesWu0M7S4x57eZaS/6CGkUm7HNOw1L0tGJBiWhWkAIeuz3PgHVRxrXtKe/xl20z9inVjIrLq9uvMt0+HHBobHvTmrieGfpc1TBKAoVkcmbxgu9JOdlcuP/IcgEx0WCDwvlchGzKH2CVXF+ZB1LyJvLXVqJyuCFa/PuHY8LqRpK5m1knbDgLxlrbsKKnrhJxlO+VVrk7o/Vt854XMPSfYt5nZSWcEGRKrxbh85mTo/fOinEAcq+tcoFe/sYToOKGbmoipGQHiYx/CqkXBzuTdykanCMyyRR529ETFZMnYbuhRwl+tYGZFvgJEzGca8UunaQlvJvQQiPtsm7IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCYMXN/vlr5KtnNiNv/pQNPqdZcFvjpGtgoRkddGXqI=;
 b=m5HalMmaulV/pseHFhOowXxbmmp5ZiJaxsS1IOK1TOkTjAvTYP9GmNlh5sENFtf6w1I2cU+ZMK7Tj8vnFupq98GqrlGeol2dKZYNnIGggHkQOD4nr0tkiKvKqUj95yeMHiAh7DFoi5a9wQoCGxmTJ1wy7Pxk0KcODQk8S7TiJ7sBBgsSUGZL1jifZO3gmuTOZRAyRB3DDh2ypLIeOJJzGRYB0lQXy+YvtXbmXNNj54iTepOvtaWxE5g0TicLznO3byiOT9x3hfFBzvitkuJOEbWtEJ451TfNDOisveV0dmAcXz4rW4LKJhOk0+stR/4XNV2nMykCP8PH6aJDfb29XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BN9PR11MB5258.namprd11.prod.outlook.com (2603:10b6:408:133::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 18:03:56 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1821:24fc:fe2f:16d7]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1821:24fc:fe2f:16d7%5]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 18:03:56 +0000
Message-ID: <43051b52-7a59-8fce-b4ba-83362f182d2d@intel.com>
Date: Tue, 22 Nov 2022 19:03:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] ASoC: Intel: avs: Add missing audio amplifier for KBL
Content-Language: en-US
To: Curtis Malainey <cujomalainey@google.com>, Alicja Michalska
 <ahplka19@gmail.com>
References: <Y3wHyJ/EcsLRHGr3@tora>
 <CAOReqxj+PLCxDpMByfL2A3j-exhHjd5_pKPApnBGo_WKg7o-KA@mail.gmail.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <CAOReqxj+PLCxDpMByfL2A3j-exhHjd5_pKPApnBGo_WKg7o-KA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0221.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::10) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|BN9PR11MB5258:EE_
X-MS-Office365-Filtering-Correlation-Id: f11b622b-bac4-4d86-1b47-08daccb3ec2d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jl3cAOKGbommn3pMkT/JcekDom3eoFIyf+i9edP1fJfN7zT4V5JL8hOqLAiB68uhtPU2uwqo4FDkXT+8iG4149xkbATpmKD57LOvnojJBb3n7xlC9uHcFMF6qs616l2b1jSTAP4jR+EL7vtRMTM+FiJZnQjTwcoTRPyOdeK67ThQA5NGQtCvSiNpJwvie5HzOFlEL7jDFLoolBgATDLaKTh2Ms5FTLd5pX6QaVz8insiO1JXyZhsrylBDtqVMzcIlPfruxN7byLbMN5Vzuon4q74dU8fSnol8KflCWswhDVGtoGbPnYS75zq9Vo22I/9u+tLzThdt5+PWp9/vTbZvmCdQgExPnJXjAOt5Ky7f7/SB5sKlFbelw6gGouPQZpk7mNaBrRjparAd4af91ACCVHd3VOghZJO075sShqsR/rMGrVoVqIz5tZdo8Nxmy620zkCclYR6EHbUh4/vqbEfg1GgWit+P4oxF6PsxMXtjpaeDPfxE1eoyGA5Gz9NgPmPbUlyZ9qM7ThLuype181sF4EM19wWHCf+oBiAlOhSuI5ic0YwMCjBOsUgKsn9xZtal9YqZjD5oyzBx2QLU0DI81cyWQCyJR/14cEoi3VSr8tLpvhPHX3gyjIvjaY6/mfFijffsVmLb7hGuLen33hijdCUwrJOP29cfu215DouL4WIo4ZgtBZoSckyHEffmPIWLvkdf+MkH5GvNJTGVj8H8u7du4q3pNo0uBofHNQ2ew=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199015)(6512007)(2616005)(53546011)(82960400001)(186003)(38100700002)(26005)(2906002)(4001150100001)(7416002)(44832011)(5660300002)(6506007)(6486002)(66556008)(8676002)(6666004)(478600001)(316002)(66946007)(8936002)(41300700001)(4326008)(66476007)(110136005)(36756003)(86362001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXdaTnlJemJocWUzRjEvWGhtS1RrNjBHYldaQWxQcnVFUCtiMEFrYmFWaTFV?=
 =?utf-8?B?N3JvZS81em11YWE2ZythVXVrMm5YbGtmZjlrbGdqdFcycGNXSitvV2MvZ2xy?=
 =?utf-8?B?R0lZYThCblRSS3R2allQSGUweXhiM044NkhUSHJHS0NFSCtBaHcxUU9ad2VE?=
 =?utf-8?B?OEhBZ3NibTRVZnNvL3Y0WlpGaWRINEJKbjQ3ZlZaOXJ0eWVuZ3MxMmk5SFo2?=
 =?utf-8?B?dGN6RmNaVnhwdzNJVWprajdCL0swcGxCbVhKODRqUWZsSlRtTHkvbG5mNkdV?=
 =?utf-8?B?ZXlrYW5Va1NpaERwV25wMXlOSnFzTEFUZTQxaFhTMGFwNnpNbU81UXROc2p5?=
 =?utf-8?B?YXRoUXdEZVVsVU1RVjNOUWpLNWNuWUFycmdBN2JOQ3VXcTZtczJaLzNRN3k5?=
 =?utf-8?B?bFJOemN2anYxOE1uYjI0aHdWak1OdmFZaVNVdnUyY0x3dEEwU2srdDlvSWdn?=
 =?utf-8?B?T0xyanJRQVVGUVhzaDVlWTJoMldZaVkxN0tmdW0wd3YrNmgxaHlHWmt5UTJp?=
 =?utf-8?B?UVVkWS9CMStXdTBsS3R2cEZEUVhoZTIxK0xGOUIvRHB3SFZpaGg4RjdOTEVS?=
 =?utf-8?B?OXRvWTZpSC9LajBXNVREbWxNaEp4WlB0ZE9XcGtkYWZPcWQrLy9FaHczd0Js?=
 =?utf-8?B?UExNRGRDUm9YU2hYL3JGc3doWjBqNXROb2YxeVV6bVdmbURXc1o1VVIwa2N4?=
 =?utf-8?B?R0JHdHpzSFBpVVorMkZ4bDVxdlhaeHNUMzAzQ0dsV0I4TGxOa0NDRHB4K1Qx?=
 =?utf-8?B?U3AzeWc3ZG5lUFhSL0R5OE5iaFlOVUxUZXNKRVhXcjdyM1ByaStZRVlZZGRW?=
 =?utf-8?B?ZUpoa3h4Ykwzam9id2lrN3ZaR0Z2YUh6djk2blJGZEl3UVlaY2xISWFDZk5L?=
 =?utf-8?B?SUhrQld4WU8zZHlpUFRkaWRxUU5XanM2WUM5TjdTYWtHU2hOUDluL0IwK0R1?=
 =?utf-8?B?NWJOSW5uZTVid2VrZ0grVVQ4RFVSQURDRVd6Nk56NnZmeHNRYm5sQVppZkJh?=
 =?utf-8?B?VUNNM0tZSnJlOHNSM3EzN0RpeVBwaE9WbkxJbENlZndKZzErNDhNTnBOcUdl?=
 =?utf-8?B?VFJzNzZqaVhKVVo0QkpBSHloWGRVQkZIWFM1YTk0VSs0QjV3WTBSdi96b3Bl?=
 =?utf-8?B?OW9PZ3FMS2FPYU5zMDJhWThIUHRXTnIzaVRvdE1Va21iUlJYSEo2THFWbHRo?=
 =?utf-8?B?d3BHSHYyYmJ2V1lJYjErNEpMaHNKVUpEcHh0dnVhbUVmMDMzNmJuSGJ6bFBM?=
 =?utf-8?B?ZGIyL0Y5ZGFrWU1yTlczbnZsbThaSVQzalZ0WGxvMTZLTDgxZVBDUkdwbmdn?=
 =?utf-8?B?QmZIY1dVRkhqOFN2bjJ2V001Z3R1cnB2VWIzYndDUTRXL20vUlVNNllNS0t5?=
 =?utf-8?B?VHhkTmN0T0FkOXBxdlhnQ0Y1RDBxTFZXTGNnNW12d1NrRGc4UWZJbVRJd1ZB?=
 =?utf-8?B?dmVxRU03dk1SVTR2bDZFWjRFWWtkRmhMV20yQk1hQjFod3k1WCtkZ1dmWjBM?=
 =?utf-8?B?NjVLcDNKV1FsTDBnc2Vhd0tNNDB3dVFGSzkwSEhPTUNZSmFzajNUNTZiclB4?=
 =?utf-8?B?Uk0rTlhFdmtROVdJSktJTVlLU3J4dDVJRlhwZnlpUXA2bXlsd3FZeXc0LzJy?=
 =?utf-8?B?WnFIbGlnZmdJbzZaYlBNV1ZFNnRIUmpiMFA3czlGUFBkbHgyTHlsTlhPcGJB?=
 =?utf-8?B?azZUeU45QlhGcDVxVDlpQ0FHWjZmVVA2bDZVRVNobmxKWHNwM2YxY003MXlH?=
 =?utf-8?B?TWloVnVFQ3o0Q2pHOWhrTWFUbmNXTW5hZGNIQlFmOCt4bThHVUFVYVdmOXlS?=
 =?utf-8?B?YUR3LzBPK2dLM0RnYTVocTRFTGVvS0thYVJtUmdnUUhNaXMyN0U4UVh1UWxv?=
 =?utf-8?B?WEJtLy9CdFhnU1pBblFZVWY0UXY3Z1RwaTN3bTg0TkJwSWsvWnN3bE1ZSUR4?=
 =?utf-8?B?bGdNWGtUODRMUmY1UjMyTE1yZ2VVT2NSZEVYclhQYUVmMVc0VVpIZlBIenNM?=
 =?utf-8?B?OXNaK2pFZEpoMHRjZkx0SENiSWh4UmJ0cE1KV3JGdmZadUw3ck5qZUVJRVZJ?=
 =?utf-8?B?Tk5Cdkw2MnFCQmFBbDhWOFhYeTh6NzA5blVqN1lZdUROVXlBUzZ3a0FBeGRU?=
 =?utf-8?B?a3ZObGhmeHFCaU8zcDBHTVl0VVBJQm5wT3VNWkNzaFNpdCtWcGEyTGRQb3hN?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f11b622b-bac4-4d86-1b47-08daccb3ec2d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 18:03:56.2124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQFMjtWbONwDt8RrYOPsjCtgxp275wv7mhG3tyrbyeMXWlFlJzHhNfhR1eTuh36WjBwRdAubL365Kh/QZQFJKJEf4zKarYf7A2Bo2IdfKYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5258
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

On 2022-11-22 1:36 AM, Curtis Malainey wrote:
> On Mon, Nov 21, 2022 at 3:20 PM Alicja Michalska <ahplka19@gmail.com> wrote:
>>
>> KBL platform is missing the definition of 'max98357a' audio amplifier.
>> This amplifier is used on many KBL Chromebooks, for instance variant
>> 'nami' of 'Google/poppy' baseboard.
> 
> Nami isn't a production device, it was a design, I think you mean "Nautilus"
> 
>>          },
>> +       {
>> +               .id = "MX98357A",
>> +               .drv_name = "avs_max98357a",
>> +               .mach_params = {
>> +                       .i2s_link_mask = AVS_SSP(0),
>> +               },
>> +               .tplg_filename = "max98357a-tplg.bin",
>> +       },
> 
> Cezary/Lukasz did we check nautilus? From what I can see in coreboot
> it should need this.

A bit surprised this entry was not there to begin with.

We have checked several dozen of configurations but I admit, don't 
remember if this concrete one was. Max98357a was first launched with APL 
with the avs-driver, then we moved on to Chell and Lars. As I'm not 
aware of any differences, this should work out of the box with the entry 
appended.


Regards,
Czarek
