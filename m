Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3374E587A93
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Aug 2022 12:19:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8C3B1F7;
	Tue,  2 Aug 2022 12:18:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8C3B1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659435543;
	bh=4bNHhxA2/cN3KzXTYrDwJnI3ABLxGfcbWHvMTUDzqoY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OxqJhCokk9wOU8SNXpZf/AGyQ9oPg5iTMz2YRHUykUxBd212DCZsZytlxY9BR/zTh
	 iFVQ1zlIK5kRUX4YTb1Wlm1+Sf5Etx0SPTeFXyCrwglZy3I3BShZ/yQcC50Zb3R/yK
	 82DFzZLkyJV339Mk+dlDZPeYTq/kysgAH9QdT7B8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14F60F8013D;
	Tue,  2 Aug 2022 12:18:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE1F7F800B8; Tue,  2 Aug 2022 12:18:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, NO_DNS_FOR_FROM, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C445F8013D
 for <alsa-devel@alsa-project.org>; Tue,  2 Aug 2022 12:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C445F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="P3Rvr5A1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659435478; x=1690971478;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4bNHhxA2/cN3KzXTYrDwJnI3ABLxGfcbWHvMTUDzqoY=;
 b=P3Rvr5A1jCibP8GLmE2GREmKFsIyfcspvbr3m6VA1r3lo2aTQ5D+Np6S
 J8V+9Jvi9o/S/y5DyrVdjs3AS9Y/qfz+NJL4j1TWk9LBHJLG6h/ZDrTrX
 vQWu76jt+H2FhKA55Nu4K0lrbLQqQDofRXjfNjWcsvL9pcIHudFJSKb+K
 LU0hKRa7H5PSG109Awcf9lsQoE4iq/Zpb6Eq/Nj5mPtEJEu5V9DotrPHk
 sIk/jrK82ntkIPFwwb5Z45xME9Ylku3msB3OwNJ+MAAT6GnyJ2NXtj1LU
 zCtZZoTJw9sQn18aJQcfxGemHUQxqXJPbcxWJd2lrZKEpLK21rzZhxzE0 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="272418631"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="272418631"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 03:17:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="929917241"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga005.fm.intel.com with ESMTP; 02 Aug 2022 03:17:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 03:17:33 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 03:17:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 2 Aug 2022 03:17:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 2 Aug 2022 03:17:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grZ7rMh3loL8YICmoeFJnFBqhej2n7ZlqJtsxOQ7oU7dU0KGW2CgZrny/UOey8USEvsbD0kaLW1WQRBGu0FR1VLo35Y4pj1Avf4jFPiUeaPRAb5UpkM87ZyiolZKt2ek9fxOrybZqf+ms2bt8oQ4qzITqoPRu34T1Id4JhXipETR/hGb/Dcj3+Sr62GzwgimCsf2lcU4TakrtFbonQKKUILtwEu4jP1EMTWqZtXM6QuJvqCb4VIzrzaZZAiT0oHMsfWzJ5GLNdIM36alSU2A/HO0tf0Y9A6LnnvYFf0ES8jWRqVcjt36TDNf+U7o3GMczdFClT0Tuv9rP/EbjOBIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4RTBhcnvvQQ8slx5axlsRMI4C5DKRFX7MDGUwCpSc4=;
 b=FMOV8uox5RJ98Mhv7WyCblDo64TfICRdfPtZWbZnWUT89Ub6n2KCRoc31Ut3eU6bu/V5m42EuPmritdHZ7IbHoWhT/Rcqscj/QNAcBfRtQnxO3ylDvpUUkndtRodZwz4ls0g9Tu/x/fHymKzUfPW6ozx2gw/NRg+PBWHxVLbk946sGDzE5C2uHKPKLARvSLzMSlJoGrN8511EaMfwzzVLX4zLsxvWzdwf8pwPhJhkGv1Y6+AEX+r15A9sNkXNVPjonqIF+nrtehsVeG4WcAeqjrcdNrPws449w7r7crY9i0x7jjY7UyQJLL0NVIJVfhn7HLitdJbyjF3+DdAj3Gqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SN6PR11MB3024.namprd11.prod.outlook.com (2603:10b6:805:d9::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.11; Tue, 2 Aug 2022 10:17:31 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::852b:5f7:46eb:fca6]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::852b:5f7:46eb:fca6%6]) with mapi id 15.20.5458.025; Tue, 2 Aug 2022
 10:17:31 +0000
Message-ID: <cce4e99a-88c7-a35f-1551-5cefacdc4665@intel.com>
Date: Tue, 2 Aug 2022 12:17:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 4/8] ASoC: Intel: catpt: Replace sprintf() with
 sysfs_emit()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20220801170108.26340-1-tiwai@suse.de>
 <20220801170108.26340-5-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220801170108.26340-5-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81462f7f-d73d-4307-5ae9-08da747035be
X-MS-TrafficTypeDiagnostic: SN6PR11MB3024:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I/5e7qjCd4touRd3e5so5KgMxZo70a3qsEwP0bxwUpuKexMO5vvZFcr2vE8k6GVNzWWPlAOfqJ7r+aSsOiJjPVRYtq+DRqhhu+anD6mFTXsXK+En9PJaNBvZ2vFjXs4NflXBbpMeZcc9M3jF/ZC//RgiiB7KMbLhrc/DOA0LfZlIc6mfTfrjkA6WiCTFbZAqVbKkz5+aE6eJzpcM+92a/tgLJ76UVESX97uoTPERdquoxG2+78SFQqrpGC6UZbFMCUKM9WYbnf2wEV9++h0Y9jzMWXTusBJ0lQ6NWgsmOaeo+QC+3ocppUdKYHInI7Ow4gnGZYDBv02jnmusvBPt8d/u2qdhRSqH2cB+b85iidZm9qI9HyPX8ocRYda+sIL3xuqXF4QTll8X+2nQPHarfbT88ErYwxlpJeuW210RAwztyHTNH2KmlgBAxiwZ+Yhxj7M3VHtXRYNbE95grwgZ6cmrEGutUpa6alOB0XKFWaBrtLlmgYVW2XMQxiqdJpjoYi6wpG3F2I6sd17g8H2OxScYN/mohxvdDz9zMCLgH1uDbqXxS+lFKtO0QAotdoJl8pNRd9nXg4Y5x75HqZlhmLn82UWRzz/bOs7qdAuKqxkVwdbhWZJ31vNW0/defdNDbzLd3NQBM75mjqW2vlp5hbXLz8rvqB/qx0DkhfGT75A2fRiI2j24x/0oehDD3ob3EddwGbAmBwm0s4DKWphVa169bVatcLiwsNRHyaXf7V4XdF6L5gFP8Wz3WcBwWDEDiC9Fwsxek4MlmwIgt9JPtKufuIOZ3AS39jcJzHbEhAb5KOtAJpFGmHyqeBkBXyNgsAeWHYiYlPvyjrkUjk2T1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(366004)(376002)(346002)(396003)(44832011)(2616005)(186003)(4326008)(8936002)(36756003)(2906002)(8676002)(5660300002)(66476007)(31686004)(66946007)(66556008)(316002)(558084003)(86362001)(54906003)(110136005)(478600001)(41300700001)(6506007)(31696002)(53546011)(6512007)(6666004)(26005)(38100700002)(6486002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akRlY3NnblZMZTI0SlRaSGtIakQ2UE1KUTZ4aHdCSU1aM1NUTkFCQjhLQTV2?=
 =?utf-8?B?enhRZk9BM21vOVZjeFBtNEhXUmZ0Q2daRTlyMzEvSmNzbW13ZUVEU2Y4eEtV?=
 =?utf-8?B?WTM3VXBnemhEdTR3eTJZc1pkRVNiY0QzMGJ4MzRULzMwVUNWcW1OZmxOWEph?=
 =?utf-8?B?eWczekQ0aDJrbWFwOEdqajhPcjZ4b1ZtSWFkYzZTU1F6ektSWkpLQVpyeW5y?=
 =?utf-8?B?MVB5bE1aM0V1M3p3RzFKSTN4WlRjSWI5UVlCekY1bU90S0hSTW9DTTZ1UE9C?=
 =?utf-8?B?UmduNzhuczJNbjZZa2dsLzNOSFcwR2JYZFAyckM2STR6MUdiOUxnNkxQQS9U?=
 =?utf-8?B?MW9DUUxUc1ZhTGVEb25BSmxLRWdOaklZZG8yS0xSTzQwcTNVSXB0MXU0Wjg5?=
 =?utf-8?B?THkzVEM5UU1YWVpYWXBNcnpaVDViWGNIOU5zSm4zdCtNNXE4cTJTV2tFbUc3?=
 =?utf-8?B?NlhTU3dDeUJFTHlZRVhaNEVsb1RvNW1kSXJsRGpUZ0paSWcvUXMwbk50SG5s?=
 =?utf-8?B?aiszRWRHVkpONTRMRFkvem5iYWhqa2ZMTUQ0L2dCbTNqOEU0ZG5zVmgyR05Q?=
 =?utf-8?B?THhlVXk4Q0NHTjI4R05ucHdHRDBaV0g4V2FSdVl0Q29jNGxVMzJuOU13VFBq?=
 =?utf-8?B?S0FCL09QTjlEUzk0ZWtOMWowN1VjUVoweGVkQ2FxLzlZaTJlbitFMWFkRXNY?=
 =?utf-8?B?Y1VxWXlQYlFFaGFjMldicFdGK1liL3FJMWJTZU1td3JoWDJCdzRkbDNybDND?=
 =?utf-8?B?NmJudldGRDlHbDZDeSt6R0lUTmlxNUNEMFEvbmw0UGFSZTNxN3NNeUM4ME0r?=
 =?utf-8?B?U2lMNzZlQnRGSmExaFRhRjFLYW1wc1VnQlBtQW56S3FRdHY1cjBCV1Z5UCtP?=
 =?utf-8?B?RFFaN3Jqbk4zOEl6cWRabkJzbVppeFBoVjY1Q0t0cEhrSUJSOGo4dTBUcFNx?=
 =?utf-8?B?Q2J0UXBuNm41N3FzRnEyTXNBOVlodE9oSUd5eWFhczZhUHVrbzc0Yllsd0xv?=
 =?utf-8?B?VW1aZE9QUHJmaG9WU2tzeW5HVlVsODB3UHVzSmJPQnhab2FtbUJDSzNwVDMz?=
 =?utf-8?B?c0lrU0QyUDljWEVQcGY5MjF4TVNYRXRFa1hNcUI5UUIzbWw2Z1ROUzRobWMv?=
 =?utf-8?B?RjlDOVBuQzRqSWd2aUF3bVlwMHJlTm9YS2xvd01uSFZHOEk2c0JteDBtb1hu?=
 =?utf-8?B?QlZhMUNXem5sYk5CK2NKaGtvalo3Y2R1YVVTMWduS0FEeXZUVmFpVWxhSVJB?=
 =?utf-8?B?Ny9WQ1FlaTlhVi9GUjhEQmFacHEwVmtBV0FHOGF0NXduQXVEWGVIeVVGbHhG?=
 =?utf-8?B?cDRucENlRDE3QnBvRUdJYm1mZWZkb0pVQ2MyLzlFVW5FM2xMNjJYVFNTY3p3?=
 =?utf-8?B?dllTVDdNNmxRM2lRQXFQeDZ2QW9BNkJOeU5TamRBMlNTT0tlVmMrRnV6b2F0?=
 =?utf-8?B?UTJ5T3VPbWU1VWo3d0JaTkhBa0ZRajlFTVNMbjBTQTdndGVRc1NobjlSY1JY?=
 =?utf-8?B?NWxjTklzZzFuSXJYVFF0S1NZdGhtUGFGZHpnNC9TOUFlUnY0NnNiZVZmNUFs?=
 =?utf-8?B?UUd3c2NsK0hRTWRvYnVyYUdtOUZHZTdiZmowY2VCVFF3S0hyQWFrdzdtTU11?=
 =?utf-8?B?SVJSWS9BRmM3djluQ3F1ODEwMG5wL0dGeHhXbzJaaExEbDVCNVMzZDR6a0Qr?=
 =?utf-8?B?dlgzNkRzZi9WL0c4WC9OWVVoakN4SmhtdWFkL0g5aGFpS1RVMkNucnI1bkJr?=
 =?utf-8?B?RUdFM1RNSmVKZVE5NUg4SjFlZys5UVdNRDUvMldrT291L0JyUHB2cWdyZEJj?=
 =?utf-8?B?ZGNEejNOMXNhQm92QkdqSGZmTGtVRzhvQ0N1N0hmVEtBU3h0c291V0NCZUQ2?=
 =?utf-8?B?OGowaGhuMktteEJhbTA5RHpPaUFBMm5aZHRta3FKVDF1cUNHNW8xeVROWjNN?=
 =?utf-8?B?RjdKZHZOSERsemp3S2VzNXVVZEthY3ZFWTVsTXNFNDVPbkZpNkVVd1pYVmJx?=
 =?utf-8?B?S0RtNmJhZzd4L2RKcHhKY3NZZmlrRE1ySmtWUjlPNUZOTCtXNGpiZDJCRkxC?=
 =?utf-8?B?a05pMTREUDZjWmJIZkFZMTJyT1E4OXB3MFFDUGdZK3RUUDJ3NCt3cnNPeDVi?=
 =?utf-8?B?YzI4WXhvQ2p2VUYxbUpLT0g2U3VHdzV6V1YzNFNaTzZ6cHRNVnpzSitIdXFI?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81462f7f-d73d-4307-5ae9-08da747035be
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 10:17:31.5829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwQ2AK0KBdpZYjbQCn/kgxrZVilarpA1F9ZhruiTJgKCeMzmxy3hWbnTLilhQcUJNh0R8W7yGP/UJzBbVx2Ig+aKr2/tqEUtHcXMbqnkB7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3024
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

On 2022-08-01 7:01 PM, Takashi Iwai wrote:
> For sysfs outputs, it's safer to use a new helper, sysfs_emit(),
> instead of the raw sprintf() & co.  This patch replaces those usages
> straightforwardly with a new helper, sysfs_emit().

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
