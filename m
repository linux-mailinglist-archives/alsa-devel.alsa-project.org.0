Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5B74C4D4F
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 19:07:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7436E1B63;
	Fri, 25 Feb 2022 19:06:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7436E1B63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645812451;
	bh=Amv9lIYcRRl3mQbbA20Y57QCemc2DVLJ0ka21rW5W1s=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ifpyyA+JeXHTS3LH+BmicNoxOzBy7EIjUC6qPpZ5tS951esElj19RqZnHXRpLARn0
	 Aupb1VFFzaE0yO55BoS9A0EG7T6G08EuL+pnG1O7YBW+Q9X164nLD1+gHBlPJOBa63
	 sECyURLlr3XEEuHCdyPcKk83/3frlSiAfY9G/t+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2C20F80159;
	Fri, 25 Feb 2022 19:06:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 052C4F80118; Fri, 25 Feb 2022 19:06:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DF03F800E1
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 19:06:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DF03F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aOVfHjnY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645812380; x=1677348380;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Amv9lIYcRRl3mQbbA20Y57QCemc2DVLJ0ka21rW5W1s=;
 b=aOVfHjnY4cif/P7L5dny2xrHY4tSf5QvUHpjgBJZJcMdB7ParvjPlu/u
 9TNM4Da/LQocH0sv7IcEeFfUSlmZOgHDaC3al2Tp4va61ny9psfnbyCdC
 8Pd1YzDAq/SWtIgIMC2GLemyQLMOwaRfwzwV2Es6pjcO6++l9oK4SrNPM
 Ru9tffBvaUppZs2asJP6bIRxp5MoTts+/PR1BKmTNb6ng3SAOTk65QLsL
 OWjzxmOgDX7njmKhITcthd78VCuAa7JYMsB0X/YcQIt03kRmH1PFDEeSq
 mcPuA+jLWnDQ/rshXfA69s43swCHvhCr5jMhWp0XBJ9kvZXgI21Fjh1+s w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="250128992"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="250128992"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 10:06:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="607835032"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga004.fm.intel.com with ESMTP; 25 Feb 2022 10:06:14 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 25 Feb 2022 10:06:14 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 25 Feb 2022 10:06:14 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Fri, 25 Feb 2022 10:06:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwHoCe5yakrYhSPNn/5vf6t946AMh8PfEBfFa1QEkuno+YCW+POQMx4AdTq4S8u033LJph4vhhM7qHxFmcf16DIHfVMMymQrEdJpL0BUkQcNXNCu2iOdnktGrU3wa4IAX8exom5erjWERRa6OwxGN5iPd87DOiKfAtB2qcIwivOEGPZqVdVoaxMvbZW0ZX+LzhFJfabGZGuf48XN+Uq9167VP3kFGPEtr0B9sESvDE6FpUi01a5PqS5Dc9cK9Jrg73yFlE5jMY2nPyIDODE9Rj/YIganmzIIyZ+aGnV7YHtSVHTfaa7HUj+klA36CljFd7K6PzzrBEJa5g0kKwhfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NyTJV7b7Rn2SxS6fSVi35kJxhM8TMmidWEQRvNoD6fE=;
 b=iK5uwZXuP4UoFIBvilukI0a5RE1/bSXa9YK/TtYZ3mYlEABQgnXxEaYQFoO7iQ/Kwg2qtjofLvIKfGlJIG/9gmclyhMLz9/dmD7dpVxT27gwTGVAI0RBR8K4NzaitxURa5A27kl7G47/CjEr2KBaNBPjge0AmI007Mk38o5s1nFmL3lYc1PdxYRqcAigc0i3T7SQgZC/TD/fLnE/GNThkM2w1yT11cvrh+K6y9Ox5EX/w8LO/qf9riN4n2T4BWUc5+Mktq5zVChqhngi5SQiBPUG6zffRukEH3PxlLjOuU4ePJ4CD6j6dmZJaf72dz9uWElIzyDgP2Yk2tBF/pvIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by PH0PR11MB5048.namprd11.prod.outlook.com
 (2603:10b6:510:3d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Fri, 25 Feb
 2022 18:06:11 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4995.027; Fri, 25 Feb 2022
 18:06:11 +0000
Message-ID: <1a8c9196-0ae2-c25b-32de-15821c948185@intel.com>
Date: Fri, 25 Feb 2022 19:06:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 04/17] ASoC: Intel: avs: Inter process communication
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-5-cezary.rojewski@intel.com>
 <c2f249df-0b3e-1032-6514-81fabb544b6f@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <c2f249df-0b3e-1032-6514-81fabb544b6f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0121.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::6) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2718de3a-4b0f-403f-cbc0-08d9f8898125
X-MS-TrafficTypeDiagnostic: PH0PR11MB5048:EE_
X-Microsoft-Antispam-PRVS: <PH0PR11MB5048C557A2E1D984E6A5DA17E33E9@PH0PR11MB5048.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xHth9jWkjxqDBGI5II0/qq1Obi4LQtL1IckWSk7/j5P90jQJk04cBrr73kEeFNPbQPBRl/rpHQEAsyNNu4rMP3T1anf85s3Jjf4zKqDyYQ6N/SInHLtqI9jSAQcQDl4IKdk+fgKUteFu6gDQ5DZ4EyYuQ1NIiQTkc1IbAutm32Ev9yEjc10bX23ljaKSbpEKydn25LMVrShSC0Y+6L/6Ht4bTEfbySaTU9cGfa67I4dWj90hxQFOlb34tBwFJ2CrBIgjwh5BLSm6jpHciQS7PDWfGLUXXUV2V31rYQhZ4ctz7aMfDkVbKasQXLZbWIAm/c18FG2EkQbyg7UubeAgEwAO/3xblwl2Q1U0/xwbQZEiMeySMUXGxysG/7UKUuFx2lmbw6zCAXJgaoCGtIlP1TjT8aNLzwFnkMvaDr6j71De1sPtrUiOPUqb49LECvamyAYah5g1tDGTqBexh2HVvY8abGWob73GB+2psENd24VXevub9m7f5wOIxSWyWg5iaxYbP9kHH3F6KOSBiDAt4UTWn90JcBudlrM1Bbnz7m32UnlfDFJLAFUQq002QMr6/adLmGuenyuQlV/752rfHJGUbZm1Jd65MKMMfRm44aTFcK2smpZlMrVaoBLsUMfy77WI2u8uldLRYE5XlZwjjUtmQyJoEZpTNlbJeDbjpOrYO44a/aR7MzaIbXNZP03cpfedo2QGH6uINOcjFlQ6QEVGZIeiUEibg3t+fbUtzyvMNOBwK5rWGL7nGgPOUUwg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(44832011)(30864003)(26005)(186003)(2616005)(31686004)(6512007)(2906002)(82960400001)(53546011)(8936002)(31696002)(66946007)(66476007)(316002)(6666004)(6506007)(8676002)(4326008)(38100700002)(508600001)(6486002)(5660300002)(83380400001)(66556008)(86362001)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVArWWxkRlBQZEpOSm9CaXZzUjcydisrZWRSWEZiaEJmeFJUaUJKMDkyVzJq?=
 =?utf-8?B?YTM3dk5GTTdadXJpb3d3NE9jU3NTcVlvZUdJQk5mTkp4Qk85YnA2ZDBMTlVa?=
 =?utf-8?B?c2MvV0JFOEptWDBzS2FXcVkvTU40NE8xaTRTTXprby9QSExZZFpUcFlEbmJN?=
 =?utf-8?B?MFlvR1AxQXpxK0JwWThxWDg2Y3JXVGJIcjFmU2dQVGxaOFVJSmMrb2tnU0RB?=
 =?utf-8?B?RHIyRjhoTFVSNVp1QUYyaVpXSkdpeUJMNS94aGQxWGgxMU1wVWVLRXhSdklQ?=
 =?utf-8?B?bXdDVExnSWswc0Z6aW1NQ2lmS3I5OWtmKytqVTJYeHZnd2ZkQnBZaGZXdzJv?=
 =?utf-8?B?UUZGbEFLSktEbEFZeGpUY2VOSkVkTGt1NTJPTXJwOWxHSkxuZXZ5QkY4TnBo?=
 =?utf-8?B?WmtaaXhobFE3cEs1NnorOHUzQ05GMVdSdll5WXJvamZiUzFXQlhKMmR1TmlK?=
 =?utf-8?B?OUYzckUyaCtsNGEvVkh2b0hRT29ZWlFBU2ZkcC92VElvbWd5KzZwUDR2bWlh?=
 =?utf-8?B?MzdtbmRHNDRldVNmUUpGT2xCd1RJY25naFZzYWNQdk10MlpOTFFzV2tyNG1X?=
 =?utf-8?B?Zk8wTHJ3N1JFejlFT0dXWDZZY0FCOFZkZUtWeUVHb1ZsWVpJakRBZGhXQy9p?=
 =?utf-8?B?TCs4YkRGNjZUT3BFbExwWnpHb3BLa0ZMYWM2aEZ1Ri83Y0tsdEZ5dlM1dWxS?=
 =?utf-8?B?VWpqVXJ4V3JJNU01WVpCallMUW5NWjQ3WHFJeUJSSzU4K2NmbjQvYmRsN0hi?=
 =?utf-8?B?T1J2RndmbzNKSU9MTU5ONnlRaDRVbThqQmtiWDhsV3ZhRXhxeDJMSDFEbURY?=
 =?utf-8?B?YjZmRVN1RWpQbEQrZGFLbFU4WUhUZUQ0TVpWemJTVXp2VStoMzNGSDJjSEJq?=
 =?utf-8?B?bHRtajlna3ZUMmwra1hnOFZMYXdQZFdUWWdRT2xQeFB4YTMxbElCZnZjSE9w?=
 =?utf-8?B?VU5sdE82d0QzQWpNK3ZaSzF0YXZDTGVkckVUNkdnTm5XRnE1eFUrVkRtOTcv?=
 =?utf-8?B?Y05zdSs3ejY2S1dHbkEycjJmaTFVVEk5QnFZNWorK2RQeVltcVkxaHJiMkI2?=
 =?utf-8?B?bVJreTR1ck9wWjl1RjF0dlAzdDN3L3RoaFZKY253d1JuRkxZdEF1SEsxNGVy?=
 =?utf-8?B?Y1BZU2FkSVhIQTBGdE5ScnU5ZmNHaEFYZVFRb3R5b2FTUEVBWHE2NDFqdjJW?=
 =?utf-8?B?RmgrKy9YeWlLVFdFVzJnV0tMQWZZQVVKMWdjOVp0dWJ2YVN3RWJNWDU1Y0wy?=
 =?utf-8?B?ZFFIdllDcGN4MlJRZDZQOE1WMmlWd0w0aDRBR0tlb042eW1ma1ljZENsMU0x?=
 =?utf-8?B?aE0ybGpENlBYWGFXdVFmZjJpRy80OW9ueVM5VWFKUlhkdmlVV2tBeXdSaTJM?=
 =?utf-8?B?ZkdpNHVoOVoydFRTTk52WFY2c0kvNmZBNmlKVTJ5cFRWVm9KRFhLSWk3a3JH?=
 =?utf-8?B?dms1UWQrSTYxeDgvTWV4OWp6a2RXamhpWjZ6NTUwbkt2emhhQ1h0NGREVUpx?=
 =?utf-8?B?M1dLNkpZdzVVRzV3RHFxbHNsM083ZXRjYTl3TGowekRTUE5XREc3M0Y3VWxx?=
 =?utf-8?B?SkRYWFFuWXJvNXgxR3lMV2oxK3NoZHpFSGJlT2NHZDNCVHR4YkpFMFhyU0RX?=
 =?utf-8?B?angwVmhhMDFXWUo3NHVsTjNzeGh5a1ZMbTEySHE0UDJQSWpLNm5kVEZ3RXFV?=
 =?utf-8?B?S0tkRWx5NC9HbHhwelRGeU9Fd1B3aWt6M3pWYWNVTmwydmVEZEhhNWhTV0dt?=
 =?utf-8?B?L1Btc2hwSUtyRWlVQnZmUGNCaEhPeHdzYS9EYUZlREhMR3VxT3NPSlE3dTJB?=
 =?utf-8?B?M3BSSTR4aUR4QTZsbWtwR0RyWTZ0dEw1WTZVOWFDb0lPWVZ0N09jbTJSQ1JQ?=
 =?utf-8?B?OXk0cGRDUnY2QmxBTTh0ZnVKUFREZEllamZ2WG5zTHNXQ3lyRlhIa001T2pS?=
 =?utf-8?B?SUxHaUdPU2JNamx1Zk91bG8yMDBmY3hsb05nK0k2Q3dCOG84UW11RUdmM2xC?=
 =?utf-8?B?cXgxbGpwYm9tQUJzbERhTGkrcVQ4QmJxYXJSMFVZd0EyUlZ6UFh1ZlVRaktI?=
 =?utf-8?B?elY1OVlJWFNLNUY0STh2VDNBV0J3em54SzNyYW1QWXdPd1hBRDRvMUhXYWpN?=
 =?utf-8?B?emFnaEtQMnFTM0ZuN0tSWDhncVpjUS9BVmtnUndyTkltZEpOOHhkR1gzU1pn?=
 =?utf-8?B?STNXbitJeDMzakpZODFSQjFuNlVONnZWNGYxM2dpdHhTWEkzbEZGOWU4MWtx?=
 =?utf-8?Q?3lh+zF1jtQ7RXHtwGTSKTpusu2kNKYqn2nICP4Xudg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2718de3a-4b0f-403f-cbc0-08d9f8898125
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 18:06:11.2612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VToHRUcT0bwebAolpY4mF8IH/N2/uLIFwYODsbiQq7fXkZo4tDdZHsgCYSdwiJcWT/4VylYnvqsmA0mCxPzOIaltzdSalMSJRiLpCPfWfQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5048
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

On 2022-02-25 1:56 AM, Pierre-Louis Bossart wrote:
>> The boot process involving ROM-code requires specific handling with
>> 'unstall' operations which are not required post-boot with normal IPC so
>> separate set of send-message handlers is added for each of the usecases.
> 
> consider splitting this long sentence and use simpler logic. It's quite
> unclear how you went from boot to use cases.


Agree, ack.

>> +#include "messages.h"
> 
> avs_messages.h?


Same as previously, this header is for internal use only and is found 
within directory  already named 'avs'. "avs.h" header covers a wider 
range of types and that's why its name is generic. All others are 
specific and thus are not prefixed with "avs_".

>>   
>>   struct avs_dev;
>>   
>> @@ -18,6 +19,9 @@ struct avs_dsp_ops {
>>   	int (* const power)(struct avs_dev *, u32, bool);
>>   	int (* const reset)(struct avs_dev *, u32, bool);
>>   	int (* const stall)(struct avs_dev *, u32, bool);
>> +	irqreturn_t (* const irq_handler)(int, void *);
>> +	irqreturn_t (* const irq_thread)(int, void *);
>> +	void (* const int_control)(struct avs_dev *, bool);
> 
> kernel-doc or comments on what the last op might mean?


Sure, will add a comment.

>>   };
>>   
>>   #define avs_dsp_op(adev, op, ...) \
>> @@ -34,6 +38,18 @@ struct avs_spec {
>>   
>>   	const u32 core_init_mask;	/* used during DSP boot */
>>   	const u64 attributes;		/* bitmask of AVS_PLATATTR_* */
>> +	const u32 sram_base_offset;
>> +	const u32 sram_window_size;
>> +
>> +	const u32 rom_status;
>> +	const u32 hipc_req_offset;
>> +	const u32 hipc_req_ext_offset;
>> +	const u32 hipc_req_busy_mask;
>> +	const u32 hipc_ack_offset;
>> +	const u32 hipc_ack_done_mask;
>> +	const u32 hipc_rsp_offset;
>> +	const u32 hipc_rsp_busy_mask;
>> +	const u32 hipc_ctl_offset;
> 
> is this really desirable to describe the IPC registers, when we know
> there were 3 generations of Intel IPC registers. this is ipc-1.5 only.


Indeed, this abstraction could be removed, ack.

>>   };
>>   
>>   struct avs_dev {
>> @@ -42,6 +58,9 @@ struct avs_dev {
>>   
>>   	void __iomem *adsp_ba;
>>   	const struct avs_spec *spec;
>> +	struct avs_ipc *ipc;
>> +
>> +	struct completion fw_ready;
>>   };
>>   
>>   /* from hda_bus to avs_dev */
>> @@ -61,4 +80,78 @@ int avs_dsp_core_stall(struct avs_dev *adev, u32 core_mask, bool stall);
>>   int avs_dsp_core_enable(struct avs_dev *adev, u32 core_mask);
>>   int avs_dsp_core_disable(struct avs_dev *adev, u32 core_mask);
>>   
>> +/* Inter Process Communication */
>> +
>> +struct avs_ipc_msg {
>> +	union {
>> +		u64 header;
>> +		union avs_global_msg glb;
>> +		union avs_reply_msg rsp;
>> +	};
>> +	void *data;
>> +	size_t size;
>> +};
>> +
>> +struct avs_ipc {
>> +	struct device *dev;
>> +
>> +	struct avs_ipc_msg rx;
>> +	u32 default_timeout_ms;
>> +	bool ready;
> 
> ready for what? This should be described or documented.


In the past this field was called "fw_ready" until we have decided to 
split struct avs_ipc from struct avs_dev. In my opinion "ipc->ready" 
looks very intuitive in the code, given that it translates to: inter 
process communication ready!

No problem with adding a comment though.

>> +
>> +	bool rx_completed;
>> +	spinlock_t rx_lock;
>> +	struct mutex msg_mutex;
> 
> checkpatch would tell you to add a comment for spinlock and mutex. it's
> quite unclear what they might describe and if they are related.


I'll add a kernel-doc for just like for the ->ready field.

>> +	struct completion done_completion;
>> +	struct completion busy_completion;
>> +};
>> +
>> +#define AVS_EIPC	EREMOTEIO
>> +/*
>> + * IPC handlers may return positive value (firmware error code) what denotes
>> + * successful HOST <-> DSP communication yet failure to process specific request.
>> + *
>> + * Below macro converts returned value to linux kernel error code.
>> + * All IPC callers MUST use it as soon as firmware error code is consumed.
>> + */
>> +#define AVS_IPC_RET(ret) \
>> +	(((ret) <= 0) ? (ret) : -AVS_EIPC)
> 
> why not use -EREMOTEIO directly? -AVS_EIPC is not very useful for the
> reader.
> 
> And why -EREMOTEIO? I see that you used it in catpt but that's a very
> surprising code that no one else uses in sound/


Well, the question: "Which kernel error should represent an error coming 
from remote process AKA audio firmware" needed an answer. EREMOTEIO fits 
the description and so it was chosen.

>> +
>> +static inline void avs_ipc_err(struct avs_dev *adev, struct avs_ipc_msg *tx,
>> +			       const char *name, int error)
>> +{
>> +	/*
>> +	 * If IPC channel is blocked e.g.: due to ongoing recovery,
>> +	 * -EPERM error code is expected and thus it's not an actual error.
>> +	 */
>> +	if (error == -EPERM)
>> +		dev_dbg(adev->dev, "%s 0x%08x 0x%08x failed: %d\n", name,
>> +			tx->glb.primary, tx->glb.ext.val, error);
>> +	else
>> +		dev_err(adev->dev, "%s 0x%08x 0x%08x failed: %d\n", name,
>> +			tx->glb.primary, tx->glb.ext.val, error);
>> +}
> 
> we've used such functions before and the feedback, e.g. from GregKH and
> Mark Brown, has consistenly been that this is pushing the use of dev_dbg
> too far.


In basically all cases the outcome is going to be dev_err(). dev_dbg() 
is here to help keep DSP-recovery scenario viewer-friendly when checking 
dmesg. Ideally, there should be no DSP-recoveries to begin with : )

>> +#define AVS_IPC_TIMEOUT_MS	300
> 
> skl-sst-ipc.c:#define IPC_TIMEOUT_MSECS         3000
> 
> that's one order of magniture lower. please add a comment or align.
> 
>> +static void avs_dsp_receive_rx(struct avs_dev *adev, u64 header)
>> +{
>> +	struct avs_ipc *ipc = adev->ipc;
>> +	union avs_reply_msg msg = AVS_MSG(header);
>> +
>> +	ipc->rx.header = header;
>> +	if (!msg.status)
>> +		memcpy_fromio(ipc->rx.data, avs_uplink_addr(adev),
>> +			      ipc->rx.size);
> 
> it wouldn't hurt to describe that the status determines whether
> additional information can be read from a mailbox.


Isn't that consisted with the behaviour of typical API function? Do not 
copy memory and return it to the caller if something went wrong along 
the way?

>> +}
>> +
>> +static void avs_dsp_process_notification(struct avs_dev *adev, u64 header)
>> +{
>> +	struct avs_notify_mod_data mod_data;
>> +	union avs_notify_msg msg = AVS_MSG(header);
>> +	size_t data_size = 0;
>> +	void *data = NULL;
>> +
>> +	if (!adev->ipc->ready && msg.notify_msg_type != AVS_NOTIFY_FW_READY) {
>> +		dev_dbg(adev->dev, "FW not ready, skip notification: 0x%08x\n",
>> +			msg.primary);
> 
> can this happen?
> 
> you should add a comment on what could be sent before the first 'real'
> sign of life from the DSP.
> 
> it's also unclear why this dev_dbg() when 'unknown notifications' below
> are handled as dev_warn()


I would like to say: "no, this situation cannot happen" very much, but 
that's simply not true. Any notification could be sent prior to FW_READY 
as the internal queue may not always get flushed between the firmware 
restoring.

Ack on the s/warn/info/ part.

>> +		return;
>> +	}
>> +
>> +	/* Calculate notification payload size. */
>> +	switch (msg.notify_msg_type) {
>> +	case AVS_NOTIFY_FW_READY:
>> +		break;
>> +
>> +	case AVS_NOTIFY_PHRASE_DETECTED:
>> +		data_size = sizeof(struct avs_notify_voice_data);
>> +		break;
>> +
>> +	case AVS_NOTIFY_RESOURCE_EVENT:
>> +		data_size = sizeof(struct avs_notify_res_data);
>> +		break;
>> +
>> +	case AVS_NOTIFY_MODULE_EVENT:
>> +		memcpy_fromio(&mod_data, avs_uplink_addr(adev), sizeof(mod_data));
>> +		data_size = sizeof(mod_data) + mod_data.data_size;
> 
> it wouldn't hurt to describe the layout behing this formula.


The layout is kind of implied by the structure itself but a comment 
wouldn't hurt, agree.

>> +		break;
>> +
>> +	default:
>> +		dev_warn(adev->dev, "unknown notification: 0x%08x\n",
>> +			 msg.primary);
>> +		break;
>> +	}
>> +
>> +	if (data_size) {
>> +		data = kmalloc(data_size, GFP_KERNEL);
>> +		if (!data)
>> +			return;
>> +
>> +		memcpy_fromio(data, avs_uplink_addr(adev), data_size);
>> +	}
>> +
>> +	/* Perform notification-specific operations. */
>> +	switch (msg.notify_msg_type) {
>> +	case AVS_NOTIFY_FW_READY:
>> +		dev_dbg(adev->dev, "FW READY 0x%08x\n", msg.primary);
>> +		adev->ipc->ready = true;
> 
> avs->ipc->fw_ready?


As I have explained earlier, this was the case until we have separated 
struct avs_ipc from struct avs_dev. I'll provide a kernel-doc instead.

>> +		complete(&adev->fw_ready);> +		break;
>> +
>> +	default:
>> +		break;
>> +	}
>> +
>> +	kfree(data);
>> +}
>> +
>> +void avs_dsp_process_response(struct avs_dev *adev, u64 header)
>> +{
>> +	struct avs_ipc *ipc = adev->ipc;
>> +
>> +	if (avs_msg_is_reply(header)) {
> 
> the naming is confusing, it's difficult for me to understand that a
> 'response' could not be a 'reply'. The two terms are synonyms, aren't they?


Those two are not the same from the firmware's point of view and thus 
they are not the same here. Response is either a reply or a 
notification. Replies are solicited, a request has been sent beforehand. 
Notifications are unsolicited, you are not sure when exactly and if at 
all they arrive.

Just so I'm not called a heretic later: yes, from English dictionary 
point of view these two words are synonyms. In general, wording found in 
this drivers matches firmware equivalents wherever possible to allow 
developers to switch between these two worlds with minimal adaptation 
period possible.

>> +	/* DSP acked host's request */
>> +	if (hipc_ack & spec->hipc_ack_done_mask) {
>> +		/* mask done interrupt */
>> +		snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
>> +				      AVS_ADSP_HIPCCTL_DONE, 0);
>> +
>> +		complete(&ipc->done_completion);
>> +
>> +		/* tell DSP it has our attention */
>> +		snd_hdac_adsp_updatel(adev, spec->hipc_ack_offset,
>> +				      spec->hipc_ack_done_mask,
>> +				      spec->hipc_ack_done_mask);
>> +		/* unmask done interrupt */
>> +		snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
>> +				      AVS_ADSP_HIPCCTL_DONE,
>> +				      AVS_ADSP_HIPCCTL_DONE);
> 
> does the order between the complete() and the next two register updates
> matter?
> 
> I would have updated the registers immediately and signal the completion
> later.
> 
> I am also not sure why it's necessary to mask the done interrupt then
> unmask it. There is nothing that seems to require this masking?
> 
> Or are you expecting the code blocked on wait_for_completion to be
> handled with interrupts masked, which could be quite racy?


Given how the things turned out in cAVS, some steps are not always 
required. Here, we have very strict implementation and so interrupt are 
masked.

I'm unsure if relocating complete() to the bottom would bring any 
consequences. And no, the code waiting_for_completion is not expecting 
interrupts to be masked as there is no reply for ROM messages.

>> +		ret = IRQ_HANDLED;
>> +	}
>> +
>> +	/* DSP sent new response to process */
>> +	if (hipc_rsp & spec->hipc_rsp_busy_mask) {
>> +		/* mask busy interrupt */
>> +		snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
>> +				      AVS_ADSP_HIPCCTL_BUSY, 0);
>> +
>> +		ret = IRQ_WAKE_THREAD;
>> +	}
>> +
>> +	return ret;
>> +}
> 
>> +static int avs_ipc_wait_busy_completion(struct avs_ipc *ipc, int timeout)
>> +{
>> +	int ret;
>> +
>> +again:
>> +	ret = wait_for_completion_timeout(&ipc->busy_completion,
>> +					  msecs_to_jiffies(timeout));
>> +	/*
>> +	 * DSP could be unresponsive at this point e.g. manifested by
>> +	 * EXCEPTION_CAUGHT notification. If so, no point in continuing.
> 
> EXCEPTION_CAUGHT doesn't seem to be described in this patchset, so not
> sure what this comment might mean.


Comment describes the circumstances for the communication failures and 
arrival of EXCEPTION_CAUGHT notification is one of them.

>> +	 */
>> +	if (!ipc->ready)
>> +		return -EPERM;
>> +
>> +	if (!ret) {
>> +		if (!avs_ipc_is_busy(ipc))
>> +			return -ETIMEDOUT;
>> +		/*
>> +		 * Firmware did its job, either notification or reply
>> +		 * has been received - now wait until it's processed.
>> +		 */
>> +		wait_for_completion_killable(&ipc->busy_completion);
> 
> can you elaborate on why wait_for_completion() is not enough? I haven't
> seen the 'killable' attribute been used by anyone in sound/


This is connected to how firmware handles messaging i.e. via queue. you 
may get BUSY interrupt caused by a notification while waiting for the 
reply for your request. Being 'disturbed' by a notification does not 
mean firmware is dead, it's just busy and so we wait until previous 
response is processed entirely.

>> +	}
>> +
>> +	/* Ongoing notification's bottom-half may cause early wakeup */
>> +	spin_lock(&ipc->rx_lock);
>> +	if (!ipc->rx_completed) {
>> +		/* Reply delayed due to notification. */
>> +		reinit_completion(&ipc->busy_completion);
>> +		spin_unlock(&ipc->rx_lock);
>> +		goto again;
> 
> shouldn't there be some counter to avoid potential infinite loops here?


This is not a bad idea although the counter is going to be high e.g.: 
128. With DEBUG-level logs enabled you can get ton of messages before 
your reply gets finally sent.

>> +	}
>> +
>> +	spin_unlock(&ipc->rx_lock);
>> +	return 0;
>> +}
> 
>> +static int avs_dsp_do_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
>> +			       struct avs_ipc_msg *reply, int timeout)
>> +{
>> +	struct avs_ipc *ipc = adev->ipc;
>> +	int ret;
>> +
>> +	if (!ipc->ready)
>> +		return -EPERM;
>> +
>> +	mutex_lock(&ipc->msg_mutex);
>> +
>> +	spin_lock(&ipc->rx_lock);
>> +	avs_ipc_msg_init(ipc, reply);
>> +	avs_dsp_send_tx(adev, request);
>> +	spin_unlock(&ipc->rx_lock);
>> +
>> +	ret = avs_ipc_wait_busy_completion(ipc, timeout);
>> +	if (ret) {
>> +		if (ret == -ETIMEDOUT) {
>> +			dev_crit(adev->dev, "communication severed: %d, rebooting dsp..\n",
>> +				 ret);
> 
> dev_crit() seems over the top if there is a recovery mechanism


There is just one dev_crit() within entire driver and it's there for a 
reason - communication failure is critical and in practice, should never 
occur in any scenario on the production hardware.

>> +
>> +			avs_ipc_block(ipc);
>> +		}
>> +		goto exit;
>> +	}
>> +
>> +	ret = ipc->rx.rsp.status;
>> +	if (reply) {
>> +		reply->header = ipc->rx.header;
>> +		if (reply->data && ipc->rx.size)
>> +			memcpy(reply->data, ipc->rx.data, reply->size);
>> +	}
>> +
>> +exit:
>> +	mutex_unlock(&ipc->msg_mutex);
>> +	return ret;
>> +}
>> +
>> +static int avs_dsp_send_msg_sequence(struct avs_dev *adev,
>> +				     struct avs_ipc_msg *request,
>> +				     struct avs_ipc_msg *reply, int timeout,
>> +				     bool wake_d0i0, bool schedule_d0ix)
> 
> the last two arguments are not used. is this intentional?


Used by the d0ix implementation that is not part of this part. Can relocate.

>> +{
>> +	return avs_dsp_do_send_msg(adev, request, reply, timeout);
>> +}
>> +
>> +int avs_dsp_send_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request,
>> +			     struct avs_ipc_msg *reply, int timeout)
>> +{
>> +	return avs_dsp_send_msg_sequence(adev, request, reply, timeout,
>> +					 false, false);
>> +}
>> +
>> +int avs_dsp_send_msg(struct avs_dev *adev, struct avs_ipc_msg *request,
>> +		     struct avs_ipc_msg *reply)
>> +{
>> +	return avs_dsp_send_msg_timeout(adev, request, reply,
>> +					adev->ipc->default_timeout_ms);
>> +}
> 
> is there really a 4-level nesting in your helpers?
> 
> avs_dsp_send_msg
>    avs_dsp_send_msg_timeout
>       avs_dsp_send_msg_sequence
>             avs_dsp_do_send_msg
> 
> this seems complicated, no?
> 
> At the very least you should explain what a message and message sequence
> are, and why this is split this way.


With d0ix handling added, it becomes clear why such separation exists. I 
left these parts here to reduce the delta in patches that update this 
code later on. Can simplify here and update the d0ix implementation 
accordingly.

>> +
>> +int avs_dsp_send_pm_msg_timeout(struct avs_dev *adev,
>> +				struct avs_ipc_msg *request,
>> +				struct avs_ipc_msg *reply, int timeout,
>> +				bool wake_d0i0)
>> +{
>> +	return avs_dsp_send_msg_sequence(adev, request, reply, timeout,
>> +					 wake_d0i0, false);
>> +}
> 
> so the 'pm' means 'wake-d0i0'? that's far from intuitive.
> 
> avs_dsp_send_d0i0_msg_timeout() would better describe what you are
> trying to do.
> 
> In addition you need an explanation that d0i0 is a *firmware* concept
> without direct links to the *device* Dx status.


This goes for both, Dx and D0ix related messages.

>> +void avs_dsp_interrupt_control(struct avs_dev *adev, bool enable)
>> +{
>> +	const struct avs_spec *const spec = adev->spec;
>> +	u32 value;
>> +
>> +	value = enable ? AVS_ADSP_ADSPIC_IPC : 0;
>> +	snd_hdac_adsp_updatel(adev, AVS_ADSP_REG_ADSPIC,
>> +			      AVS_ADSP_ADSPIC_IPC, value);
>> +
>> +	value = enable ? AVS_ADSP_HIPCCTL_DONE : 0;
>> +	snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
>> +			      AVS_ADSP_HIPCCTL_DONE, value);
>> +
>> +	value = enable ? AVS_ADSP_HIPCCTL_BUSY : 0;
>> +	snd_hdac_adsp_updatel(adev, spec->hipc_ctl_offset,
>> +			      AVS_ADSP_HIPCCTL_BUSY, value);
> 
> does the order matter? please add a comment.


interrupt_control() is only used during probing and teardown procedures 
so the order does not matter. You need all those bits up before firmware 
loading can even begin. And when you are done with firmware, you zero 
these out but and the order does not matter either as again, there's 
none to "talk" to.
Note: ADSPIC_IPC is higher in hierarchy than DONE and BUSY.
