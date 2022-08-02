Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D523587A94
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Aug 2022 12:19:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30836844;
	Tue,  2 Aug 2022 12:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30836844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659435573;
	bh=4bNHhxA2/cN3KzXTYrDwJnI3ABLxGfcbWHvMTUDzqoY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rfMQ7ORVjUd2GdoBa7OLrgXVMRinYLrbn5iGlzjExIKdALpufaPdPygGAyD+WPeqh
	 vrxZPcnfNZNek9sG6TCCdBvERT53y0DkrmH4ZE3QxArZvZ1t5UgJigu3Hniv1a502C
	 aLfdKkDBmpLxeSL/z2geyYWnTKGUi037DGvYOxWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4A99F804AE;
	Tue,  2 Aug 2022 12:18:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E535F800B8; Tue,  2 Aug 2022 12:18:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, NO_DNS_FOR_FROM, T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F542F800B8
 for <alsa-devel@alsa-project.org>; Tue,  2 Aug 2022 12:18:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F542F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HoQq7zso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659435484; x=1690971484;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4bNHhxA2/cN3KzXTYrDwJnI3ABLxGfcbWHvMTUDzqoY=;
 b=HoQq7zsodbC64p3ogLJRW4bIKXtXJT9G4OaXsZsL3GKUYGaqNWqLIUG0
 DCT8Vf2ok0z8c0uT88Inh78QRioxPOBMPKIaO4HzTvuDKc028LWAEuu5t
 YFMe65+sX50YzbmM/7/gEcvT/+w8D/spmT8zvwuNGWlzQZJPVpCJZ+4LS
 LnQ/56+OB24aNBE7UGt8ijSfTch9cO8G+k35Q1BhlvYbOmuatYmzsWcia
 ppDgq9XNfDO4/lKUm4D+pil0KnnGOGHtoFi/vmsPREQ+dlv+DQJtqVNbq
 d7sXMc11/JsnMG6W4xzc2gmWVbcjjfWBWAnyq4Xv0VsMiX5rm9TDk29zS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="351083385"
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="351083385"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 03:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,210,1654585200"; d="scan'208";a="705325057"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga002.fm.intel.com with ESMTP; 02 Aug 2022 03:18:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 03:18:00 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 2 Aug 2022 03:17:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 2 Aug 2022 03:17:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 2 Aug 2022 03:17:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPtFVk8Tj2lxLvHDuPphMx3Qn5BlxevrT9uzzBZSQlTvZUrWOs0gTcPfIY8taC1Je2vQsmoBuPiW17Rbl4ujLvOC4T3J7mgyqQ+bA/JE/gAJcI9oX8y8M6mlUDA3hZtjSJCFfWC20Li21zIUtXV5UMK24XyBBSWrH1vest0hl2f7ZHdSwe0ZToGeymI0lHb9AOfl+17Tmw0EusxDbkj4i/poIHOjVVcdtvfHNRO+9ZvFY9tlicDDNwmgKGyYTD32NnU5lES4vxWi+uxqF3jeiPd52+kLyedL4eDGq+attV1zI3MfDlqGkdVIheipdben7wBxlYcEExow4/AEGakPxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4RTBhcnvvQQ8slx5axlsRMI4C5DKRFX7MDGUwCpSc4=;
 b=TEFLBQ+CmTgNxzZ5ljJTBNlINGbUpOldLk0RVIti/BnWRg5/2CwAqbbfnsVOApoKQ1mp//hCszeyfT79leXbuR7xDcxALh1BKUqHycNdcJuZXBuTcNZx+q5TLXpqDG+CLXUxz3Ivjgcctj9naebpzVaz9rzbIOj4GhEWsuELi2hkHkRU+XtW7DGni8snLyD9gDnpGYwrsSvOp8j7woLCjOs3CXVQp/vWUaCJJzmfBx4ZxwRCPMIdv6BbhHD2v+WjSrJD/thuARc1RxwUyCfGa3S9gd+pMQihD1FRorYsJFHGvdjBOFigFvjYNCo/GHCIJP6FEnSPXusOn3agsQHJfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SN6PR11MB3024.namprd11.prod.outlook.com (2603:10b6:805:d9::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.11; Tue, 2 Aug 2022 10:17:58 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::852b:5f7:46eb:fca6]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::852b:5f7:46eb:fca6%6]) with mapi id 15.20.5458.025; Tue, 2 Aug 2022
 10:17:58 +0000
Message-ID: <92be8ba1-281d-9b5d-ce26-dbb3ce8e2a61@intel.com>
Date: Tue, 2 Aug 2022 12:17:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 5/8] ASoC: Intel: skylake: Replace sprintf() with
 sysfs_emit()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20220801170108.26340-1-tiwai@suse.de>
 <20220801170108.26340-6-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220801170108.26340-6-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::6) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92c87914-0ad2-4c1c-e074-08da74704598
X-MS-TrafficTypeDiagnostic: SN6PR11MB3024:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O4RvvHBMqpn0g0oiA68eWycg+pxxFi0X7Yp1NtuCYcjlC0hjbIf5u1bcqPBGaFq2pSH2+83sbMrnG4wj6tIaH2UTDP7CB8aM3rk+VZcN5fR4R2NL71NSYZqPFNN/DhhdyzyUoXEgSdY0IRcV76oRDeQozWLKyHuQi+jqldPgRTBMHdoVMRSGNJg5i1Ul952IwP9SJKppkJnX2bPGpQHUpeso3mQ6fnNKTt/0Iyz3UOEYFbHbfyejvfKvnv3yMyCQ7NIBRmDe18GtWGtC838C32wi7bCLyaLlJIsBdk/8AVxoNrCVlFUgvjjhQ5hYgJf/LObCumHm3uNbq2RrB5DpyyeC9ssLEP2D1HG3SPqblNMPqATgMq14WbydKKYvwAUz4quZb/4s2dg51W8eaYrH9dDfwSgJZvIL6IsXuLdRGmbgUTkMSUez7HISv//HF6pf4hAl7pe2pFL6ZEVSDiItwj6QJ3XcixLK+81441cNpEB20tp1QVwisKb8riPJ7gQYMOX0IG9LZBMSoqWJj76ul14YOgsxSPH4GpPP7T7gU9ePi3FE7FcNQwH3VlBWbkX4BvCHC4sW1yS0UY3juT1dsQQeBBIXesCYRH99Oq9WMzziC7n56tIsBFtCK8uyhWvOrs3bpKoikH+HQmCoOzwOGdAdVtAr4hUCP3P8bK2lwPZGc+cWSZYX+alARX9Qb8D+C2BXULGg7/dXiLQzemVK1F3+cffX/qgmqTt8YpNFycDoqtVvaGNaDaZfZ7dMRJAP+pr9GxZrQ/gv6GZ5VCWa4K9QLP7zcaKKdjMnnvaSb9HF17S0LJiFfNQkgRroPfpJXODps+7CTwKeJwTmec1EYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(366004)(376002)(346002)(396003)(44832011)(2616005)(186003)(4326008)(8936002)(36756003)(2906002)(8676002)(5660300002)(66476007)(31686004)(66946007)(66556008)(316002)(558084003)(86362001)(54906003)(110136005)(478600001)(41300700001)(6506007)(31696002)(53546011)(6512007)(6666004)(26005)(38100700002)(6486002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFpsVU1hN20xellqQUNtQU5zOUh6S1FmT0ZKSDNLVEkrQXNpR0NZNEwwS2py?=
 =?utf-8?B?S012amNUeTROdUt3N1kvOWZTUkVYYVpoYzlxQUUrZldvSUtmTC84NlBXRG5S?=
 =?utf-8?B?WjJOK080bEE5OEFYbzMwTXN6VGtRR0crdURqb2hVRjRGRjNEdk5peE5WeEhn?=
 =?utf-8?B?Qkh1SUtXb0hTWEJheWRobDd1OGZabHdwZUlkeG94U3Vpa2hGeHVqQ1E1dzBU?=
 =?utf-8?B?ZFpLemg0dFllejJ5aE9RQlo0WWZhbUZndDl3YU1UbklNUUhVbjlTWjk5eUhO?=
 =?utf-8?B?U3UwOW1wditPQ1J6SEZrQ0w5bFJTM3NJK080c1lTNWp5REwwRFEyT0xqOEtw?=
 =?utf-8?B?R0xkVmp5YzFOZDh3RVY2YjcreHl3b2hmZ3VOM3pCZThCUnNjMW9sRDEvM1RH?=
 =?utf-8?B?dVUxcyttcm10Kzludk9ESURKOXQvYTdGeFdtRXBsdlJjR1FqWmxvenlKWnBa?=
 =?utf-8?B?aFJ6NHNhQkg3dkYrT2k4OEpVbGFKc2tCeTJMQSs1UGVEMiszeWJ5YklkUzAv?=
 =?utf-8?B?UE5laFd3YUUzbDZrOVN6QTBsaDkwL01nOFpJZkZJdnREWkNoWnozbUVnOTlu?=
 =?utf-8?B?R3RMaVlUYkNQNnBRZzZOdHgva1Rhd3JuVG8yMHE4WlROa1FnYzRidi9rZkVT?=
 =?utf-8?B?eFFkV3ZpYk5qeXZrWGltOVp2NTBGT3FnWnpuY0RsU09EbnpLUUI4TkNnVEZG?=
 =?utf-8?B?Nnp1aGJ3dld5WFRHZFVPRUdaVWRKcm9reWpSTjViN1ZmaTFndnJ4SklDaGdE?=
 =?utf-8?B?MTcyV25nSHpDNTl4Ykp5bXYwYk9vQXhuV0tCSEdaQ0hqMHMvZlFkRHRkNDR4?=
 =?utf-8?B?cWNjaGZPeUwwNU9BNk40SDAzU3JhZ001dGxEQ01QWDlpVFlTUnFqaW8rT1l0?=
 =?utf-8?B?em5qSnhFOC9TanUvdTBoUWNQdzZ0d0JncnlBeWV2ZzVtTXR3bVJxWStjVlhv?=
 =?utf-8?B?MlJPRlArVzlGRXRQWDBMWVZCS3lNbjhhQ1JvSms0YmNBTFowN1BoZUNSRDBZ?=
 =?utf-8?B?ZUR2RDRuakZIWEI3NmFENjhaTmE1ZW0zdVM0S1A5WTVJM0NyRUgzangwRHlJ?=
 =?utf-8?B?bm1ZNWNsbGdjcmFJbnQ0cy9hdEdhb2V5TFY1bm9SY0Q5L005aUNxeHR0UjJz?=
 =?utf-8?B?dVFKQUdOU084d3ZGTjE2SVBFTTNzVzdzS0ZpOGREK010ZVB3Q0VUU044MGxC?=
 =?utf-8?B?cWZIL1NPSmE0OHFDeEkwZkFZV2JmTm51UXZqVXJaV0NWOGY1QTVuZkUwbHZw?=
 =?utf-8?B?bjNEVDZacldsaDB2VFVyaDkwVHEvZm1UK0Y2UGI1M2ZuQzdBcWtYQ0VWcFl1?=
 =?utf-8?B?VVhxcDRaa09YMzV0R3JrMUNYUEdRM0VaYW5jY1dWaFovUlk2ZlJDd1laeGR5?=
 =?utf-8?B?d1dpWFNKZnNKWHdmekxqd29tOThvbUZrVXEzWTJvU1R0RHNHU3pEZDQ3K2d3?=
 =?utf-8?B?dXkvaThiZXlhUjJRNyt4T202S0wzMkg0UWw0K1VGcWJkT3VtSHpXTmQzbHVP?=
 =?utf-8?B?cDRMcHp0SGJERE5UdGdaczlyOFdLdkFNUVR0K2pUZzVZeERLUTJxRHZ5anRV?=
 =?utf-8?B?S0h3UmZldDhPTDRBYXg4SGFTRGdOd1NUY0ZVYUlPMWVIRlZjWUJyc2pxSzhH?=
 =?utf-8?B?N1ZidG45eUoyTFZoSzlweGdiVzlUa0dXektmV3g3Q0lZalpYYW8ycmd4ajJZ?=
 =?utf-8?B?cDFoRzJBTTlndERlam0xbGxYcytXYmNNWm54aXViKy8wWEFIOWlDSDJWQlFz?=
 =?utf-8?B?RHoxWURPMzhkUkhEelprSHUzUkZyM2dEWHN0MVREcE9QMThZZTlvYmJ2ZzVG?=
 =?utf-8?B?TkRqczJ4V0NVU3FVRTh1TzFPazNmNW5naExCNmNuQTRPOTAveWtjNG5XVU12?=
 =?utf-8?B?MGlVNlk1YXl5NkNQaHFkNnlsWVlYK0h2N2dVUnNCNHhDbzVNUEpueEYyOENv?=
 =?utf-8?B?WGdsWU14a21UTnZOT2RQUm9odkh4UXVFdzIrSGNkdDV1VUNwWHdoWTBWbzVh?=
 =?utf-8?B?MHFFN3JpVGViYWRDNXhFSzVVNVZUbjh0aUorNmNibG5lbHhnaU9kYWNOd3ZU?=
 =?utf-8?B?ODYzOTVGNTliMDdhNWUxMVZ2NFFQL2laMWJsMW5zNnFQcWZYTFhTRlZkcGlN?=
 =?utf-8?B?ajE2QmRSK1drSER5MEE3cXV5VWVjUUNSODFBUld5eTB6Z2Fia2RDdlBjM0du?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c87914-0ad2-4c1c-e074-08da74704598
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2022 10:17:58.1195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ROGMKcNyZEYSfd+1866CAS0OQqf34uAkgBG65bGSN06OSHQKW3K1N25rh3vqr6GWLRqLbCnb3cFtSuwBHaVLJrcjR6gSHE2iFt5RdWjcPOo=
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
