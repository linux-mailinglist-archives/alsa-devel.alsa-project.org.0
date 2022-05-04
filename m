Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A1C519FA1
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 14:34:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 978C5839;
	Wed,  4 May 2022 14:33:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 978C5839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651667675;
	bh=t9TX6H3ZqxU6fyXpuRP38mA1Elhgj/sWN5Q4AJQgAkM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZDLJZ7Xna03XNctws9XIURH8n2MKlgq9CqQ3csa7JpuVj26xA7RFnEhRf2+x9e0Li
	 YZ0ojp/SNOxo30D5ZlxS00zlbB9AHOaaGGHLiTxjqPIAhVLxbPwg0WkZHkYlCtX455
	 4yVzgLiwFQO3rWi91yIMeqWwVQ9yZl4+Dj80AFMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0826DF80166;
	Wed,  4 May 2022 14:33:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53B1BF80163; Wed,  4 May 2022 14:33:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17B79F80129
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 14:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17B79F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BwelruPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651667613; x=1683203613;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=t9TX6H3ZqxU6fyXpuRP38mA1Elhgj/sWN5Q4AJQgAkM=;
 b=BwelruPwZut9vbkdO67LkT57R54tPS3yzuOIbShV1DGDkWByZnpuuvHN
 7VnUaT1VPgRIDAxCTxcL5LcSkeZdncO5O8VDw1cd1enU3vuRJEcmk+IX2
 nl6Ce8wVsb9QvkT7jA1FtQfyBghGrTP2fO6etfUnamX/2KEjK4hAK/UbZ
 BSGgOkxs5hjP4ZPfiupf8nlTkp4d0LTqvg8K9uYhgeALqkLBAKuY8+hOW
 nGSP66UGaV9XLCF1NgCV/gTSastuliVssTbuloH/5ME1lLL0qxU9T6XEx
 bMp/Tm0fC2ExgQgpS/B2b5m/q9jKia/y2yOo9em0PuWJSvZqBMsVyUZMJ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="266596071"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="266596071"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 05:33:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; d="scan'208";a="620787602"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP; 04 May 2022 05:33:27 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 4 May 2022 05:33:27 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 4 May 2022 05:33:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 4 May 2022 05:33:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 4 May 2022 05:33:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJr3ALwDf9ubU8RnpEAo7TvGzRe9qpgy50yGeoSXC68wP1WKiUL1uBXrQUJMotlIKXyp5dMisEDNQ1I2cL5zEZb++EbobEAjeScwF88wZIOzPTj2Psjch+M2niS0nxO8OW/sG2qGAnJAqJWdlS9F3d++t5jnm6UwUNpMYBAjEF2Anvk/G2NIuD3IrDIx2zrFYUDolJo818gVo5J+hMAWZWaY8b2d4hBOqXEB5Ya/eFaNAWQfmgWiSJa5FqRnDZ8XwL/J5WDrd4qSlQwbcy1LJKp4c70nGu61Hu11Zl1PJAgMUu9zUiLETN8l+FHPIsntYMdbmwyGJ04xX9saEJf2MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZlgCCysdriCtcXPYaHR3af9BlFLj76VvJu2WX/5C+Y=;
 b=oWY0t2YTRjBcnAjiCljtBp5OdEMd2YwxiY8/nr5fIWQVM7Gjs7c7Qq5TZEkKhhz48YfnRQGnnfGSJl+8joXtQ2JXa/QMOH277OeGpEYn3xus9Wu5aEQpmhXsgi8Oxuh8SuKJnr+GVA49cNxLEiBqO5uj9RnkxIxqAywRtPafsPro46PmQrgyP01OGYKVMlJOko+2mVJzHR4vi9zm9Gp3o6+dwJGRV3Uz1FlZykfNQVYfJ+oEHPEzwdPqdxvGR79gfS//rs7AiBcenXaeAyQZVESpJCGUfiETgx+3ty1GgFx4pVuHl4IlRcW/SU9emGlS67bmIggVRbYIBxxcvbRelw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by MWHPR11MB1918.namprd11.prod.outlook.com
 (2603:10b6:300:110::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.18; Wed, 4 May
 2022 12:33:20 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::b1bc:45f3:e805:6942%10]) with mapi id 15.20.5186.028; Wed, 4 May 2022
 12:33:19 +0000
Message-ID: <d008e954-4d98-ee8d-a7f3-daa8ab59634e@intel.com>
Date: Wed, 4 May 2022 14:33:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 10/14] ASoC: Intel: avs: Machine board registration
Content-Language: en-US
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-11-cezary.rojewski@intel.com>
 <2cda9e60-483b-6866-7ad5-787e43c25824@linux.intel.com>
 <f1607df1-a8de-f26c-fbdb-be4bfba899eb@intel.com>
 <26235767-cc5a-8f9b-b0f9-f48fc4a082b8@linux.intel.com>
 <59d4c344-1013-f3ce-f8c8-097520ca1f5a@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <59d4c344-1013-f3ce-f8c8-097520ca1f5a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0143.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::19) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a040c650-dcbb-496f-2d0f-08da2dca451d
X-MS-TrafficTypeDiagnostic: MWHPR11MB1918:EE_
X-Microsoft-Antispam-PRVS: <MWHPR11MB1918850A527ECD8874F16880E3C39@MWHPR11MB1918.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dyi5oesMA6k0wua63ecaiZJOhuqldrOkQ7yLAr+cPuHEbJE0yTechdngqIB/nXlkYY9co0lOkx+bBQCDEsyE4bw+nCNf+0EvmvR5D3SiqJaO7CvKSKRcnaSKrhphTmSbXY/Ftxa1TQk0EaE4fsPgr2yWIXKMeIBAe0PlsZfXX2YzsUQP8s39LOCy8R/2WtdR3ZPX29OJg6h4XhZanIRt58dav6t4CNPU2G+cmWN3PaQ2ub1qu+MsfwkGhPAOZr1g78LvpUmxM5UEPkFGHjglEfqN3zIaRAAFt/YGyFTC565T5Q+c+b1x5YUfVVsKbxDhgtH9FMc9slb7/f+XSaZrcQzu0Ys+kKxQcXOHM0Ab2u7Rc/ringsDOFSN+CFWj1/M4d3x/m1oVrfMFtFl+iffwct9xOjCS6XAWj/h9awiM1fnrJTHbmKCAMOB6xzteWRv03a6l1lIZP1mq9HHU/qclpWeV3HRVOY3twWlth8FEJLUCL3FAkYHIP5vlFVazgGN9ZKAT3FZOqnDFnBB0ytLW0bpr2BGE09vVJpUduNmPy1gn2t3vj8DWzb+loSIx+K09H6H40R/BagRlPVRrif3TLjV11NlLWChI8wpZPOh/UU23ev9qZ/AqAcazwOeaIazqwlV+oW5a0kBq7RI1a6YSXuYom3J//2AAXyZrjmYa3l0waEMsaFTfEk+3akg+9X6MSSkJp9fOwekntVA+oTguv72+aDl7ryQS7gw/Ji1OjQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(8676002)(86362001)(508600001)(66556008)(66946007)(66476007)(6486002)(316002)(38100700002)(2906002)(36756003)(83380400001)(31686004)(186003)(2616005)(8936002)(6512007)(6666004)(5660300002)(6506007)(26005)(82960400001)(53546011)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUErZEdSQSs0MkdzVTVkdXRsbEpYb1lqME1HdFc2RzJBNFl0Y2VjRm5jRGtC?=
 =?utf-8?B?RUJwa0JPMkdXL01iYlNpYXIyT05zWW93Ri9iK3kwVlBhU094dXhXRVRtaEZF?=
 =?utf-8?B?QUtuN0swUm4zTG9TZU45a1h5S2lYcnZrL29SblVLZlMzbkphQXNtbTBhZFhH?=
 =?utf-8?B?MjFqWHlBTnQ1WDNSaWwvV2twY1B0MFQ5eFF6OHVTZ1NkVFBJSVFsb0doQU5I?=
 =?utf-8?B?UTA0bWNEN05ucEV5bUVFWCtLYUNiaVhoN1phYWF5aGpsUFkvcURHZmFZblhX?=
 =?utf-8?B?SkoyazBLRnBZSm9lclcxOVViSHphNjlQVVZOeW03U3d5Vit2bVVTdUg1TWsz?=
 =?utf-8?B?ZE1nY0pwalU0RDZpWjZLMjk3VFN1bmlPcHU0bFhjMmNTNk5CR1pxMlY3VCto?=
 =?utf-8?B?QVRqS05HelY2azU5R3B5NVY5clpHOEtzdFdPaDhBN0lBWW5Eci8rWCtwOG5h?=
 =?utf-8?B?bWdqU3pUZ2sxYmxRem16Z3c1RUhxZzdueHJiakRsZ3gzVjlqWHc2Sm5tSE9x?=
 =?utf-8?B?Zm8zSTl6UWlFRzVTaVNpU0s5RmltQktuUmRDZDVuL2lMcUdmc0R6QnVTejNl?=
 =?utf-8?B?OEVaNlU3K2NnLzBZNTZaQlJuRlZobWhLNFZRZDlSTk54TW9sNmZINlU2TG9K?=
 =?utf-8?B?d1pkS2NHa2w2UzZyNldaazJRRnRjYlE4S29kR1hIV0pNdXdRZDBrMTJGRUJU?=
 =?utf-8?B?MVg2V0Ywd0trbXBiaTVhY1lYaDNqTUsxcHc3VDdSaXJ5aUhqR3RVeHAwcjNO?=
 =?utf-8?B?T1ozb2xmNGNwOUx4MUcyZ0l1Nld3U0QzczB2RS8wcTRwajlEbXN6RWFxdzdC?=
 =?utf-8?B?c0plYVFDSkJmbEY3Q1ZiL0hEQk9scVNqVkNrWmNCb1RvWkpiRXRVV25qcmhz?=
 =?utf-8?B?Y0NvSFIrZjc1TXhOOVlhVTZnbk13VVQ0V0Q3UGFpcjlWVm82UmZib2p4K3N5?=
 =?utf-8?B?VGJmTkFVWUtqWkhocTY3NnRxb3ZBQjR5Rjk0V0VFK1pPNlB1WUdvM2sxaW5u?=
 =?utf-8?B?VHI4MlVpTzA0eTBtQ2JoTTJYL0M5eFVaVjBkSnpJVGZiRktDZGZFNE5EQiti?=
 =?utf-8?B?YUhJbWVJM3MvQUtZWXBXMVk3NVNoK1lsR3RDZlRUd0NXWHRlY3NxSFhWZDJF?=
 =?utf-8?B?ck82R1Rjb3FMcHNOSmJEZ2ZsaGFJK3NpQVRjSENMWGdYc3NJeThQcWhIdzZn?=
 =?utf-8?B?aVB6aVZ0ZkplUlltN3dUZlg2QS9qTytwOVJHZEN1a0ZZWFZzQ0FBQlhtOGhy?=
 =?utf-8?B?SG1RbmZsVzBtK0lMUXpWcG5UM25iOFplckJqMWVoVHErdVEwcEUvWGQzN0lR?=
 =?utf-8?B?Mk9mcDN4YW9Yb2hYOVliZlhUZnV2QUl3TlE0Sk9MRlhwNHpETk1vSXBoRUl2?=
 =?utf-8?B?ckVlN0N1MlFJRVdpYk9weDN3bjU5Mys4UU1VMVJtazNYdEhpVVJ2SDZVOFAv?=
 =?utf-8?B?YldRNi9ML3dPOG0yTzBUYjl1Y0EvR2dKOHVpb0Rma2ZPc1hhc1NrbzZyS0RB?=
 =?utf-8?B?dm03MmNPaklVS0lRWmgwSWhZcFNESFFVUFdtVHFFVUFLa3p4elFmNjR0MlBu?=
 =?utf-8?B?bW1nczQ2TTBlUXZrZUZSd2xsRHNScWUzVktELzBXQURtU1A4QWt3d1k4Tm1N?=
 =?utf-8?B?SUM0SzJKNmtsZEU2czJwK0RoWHNVNURrb2xTU1JtZTA2SWMxMmRRWmsyRmZj?=
 =?utf-8?B?MG9aVkJiZXVlNmtmZ2hhOVNIemVOdmN5Q1RhWHJWcFlicHRmczhwWDZKMkFl?=
 =?utf-8?B?b3BNTUhGK0pWZ0h5bHlOdWRneVVYa3pGOTB2RXZ1OG5lR3dpbkdmdEpza3Vh?=
 =?utf-8?B?R0FVNVZlZjRHTkp4ZmpDeVJscGhOT01Oc1FBK2tHUjN1V0E1SjZseVZCKzVn?=
 =?utf-8?B?dzVLTmZJUUwzR0xhb3d5WUxmODJqTnZHNktrZzN5cG1tdmdTbnJ2bVJmVGxY?=
 =?utf-8?B?dnVtd1ZkRmVvdjl6MGtyS0E3UnNTZk16enprNFJoTm04clpPaFFKQlNTR0V2?=
 =?utf-8?B?bHMwZ3VDUU4xUkJnazBkTVE1K3BwRFNvajBUR1hZZ0FQMnVwUHFJbTJGK1ZN?=
 =?utf-8?B?dnB4TnIwdDFCTzFDN3FFdGkvRVRTSGRkU3ZkMjdBZ3RvWDFwYmxTREpvNy9n?=
 =?utf-8?B?eU1GT2NleHBMdlV5K3o4SWpaQ0Z5K2hhdVk3di8wOXZEK1ltUFpqRERuS2ZL?=
 =?utf-8?B?S1dtWlZnbjZPcktLL25BaExTblJHaGQydW0vcHQ5RFB3dElodHVFSEcvbFRw?=
 =?utf-8?B?L3d1cjA4ampZRFJUZHBOVnd4VWNhL1R4U1p5ZUFNNDZuems1a2RoeHBocTF3?=
 =?utf-8?B?UFQzRmhwbEhoSE9Ibkc5OXA5WU4vOGpUY1pERjBuVkZpM2k1emJDYlk3dXBr?=
 =?utf-8?Q?tJYvc3VpuLkVVrCc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a040c650-dcbb-496f-2d0f-08da2dca451d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 12:33:19.5342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JIYPLTg9zt0CuyWN2Ip0iQl24NI3kxSriD2csOMArfEC37hdgx0ERpUJJL2xELz2Nh/jOTGPbe7cO8Mu7ptY/cnRyfmfwrrytdt6DqNWKNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1918
X-OriginatorOrg: intel.com
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

On 2022-05-04 1:26 PM, Péter Ujfalusi wrote:
> On 04/05/2022 12:41, Amadeusz Sławiński wrote:
>> On 4/29/2022 4:01 PM, Cezary Rojewski wrote:
>>>>> +#define AVS_SSP(x)        (BIT(x))
>>>>> +#define AVS_SSP_RANGE(a, b)    (GENMASK(b, a))
>>>>> +
>>>>> +/* supported I2S board codec configurations */
>>>>> +static struct snd_soc_acpi_mach avs_skl_i2s_machines[] = {
>>>>> +    {
>>>>> +        .id = "INT343A",
>>>>> +        .drv_name = "avs_rt286",
>>>>> +        .link_mask = AVS_SSP(0),
>>>>
>>>> I've told this before, 'link_mask' was introduced for *SoundWire*.
>>>> Please do not overload existing concepts and use this instead:
>>>>
>>>> @i2s_link_mask: I2S/TDM links enabled on the board
>>>
>>>
>>> Noooo :( Sad panda is sad.
>>>
>>> 'link_mask' is such a wonderful name as it matches naming used in our
>>> specs - which call BE side 'LINK'.
>>>
>>> If it's a must then yes, we will resign from using 'link_mask'.
>>>
>>
>> I'll just note that header kernel doc for link_mask says:
>> " * @link_mask: describes required board layout, e.g. for SoundWire."
>> I would say there is no assumption that it is SDW only, so we could also
>> argue that if it is it should be named sdw_link_mask and comment be
>> fixed to remove "e.g." ;)
> 
> In mainline kernel it is (as of 5.18.0-rc5):
> /**
>   * snd_soc_acpi_mach_params: interface for machine driver configuration
>   *
>   * @acpi_ipc_irq_index: used for BYT-CR detection
>   * @platform: string used for HDAudio codec support
>   * @codec_mask: used for HDAudio support
>   * @dmic_num: number of SoC- or chipset-attached PDM digital microphones
>   * @common_hdmi_codec_drv: use commom HDAudio HDMI codec driver
>   * @link_mask: SoundWire links enabled on the board
>   * @links: array of SoundWire link _ADR descriptors, null terminated
>   * @i2s_link_mask: I2S/TDM links enabled on the board
>   * @num_dai_drivers: number of elements in @dai_drivers
>   * @dai_drivers: pointer to dai_drivers, used e.g. in nocodec mode
>   */
> 
> link_mask is for SDW
> i2s_link_mask is for I2S
> 
> It might be nicer to prefix the bare link_mask with sdw, it might
> happen, but the comment is pretty explicit. I would not dare to use
> link_mask for DMIC for example...
> 


Ok, only now I realized that the 'i2s_link_mask' is already part of 
upstream kernel - commit:

ASoC: soc-acpi: add information on I2S/TDM link mask

from Mar 8th 2022. I agree on the "sdw_" prefix part. Right now, the 
name gives plenty of room for interpretation.


Regards,
Czarek
