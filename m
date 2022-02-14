Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 779E04B484C
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 10:56:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 008AD16FE;
	Mon, 14 Feb 2022 10:55:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 008AD16FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644832599;
	bh=+PkcaMqBj6lIjRTyUfxIKZJ6+u5l3LJ9Id5glkVgEgY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WHwRA0xUfJoojChFaGpDIX21YiZ88KsGcn/8cfUmc7PAdET/rEfSsVKcEnYDmc665
	 ChHeRoYO65HwQ8RwlLTbRP8gl8zxpnDA2wJA5p/H5DiY43XuNAg0wEotJmUHErA6Nx
	 PQDVk6C8Zv03hQzTocK2MpIrc+MbO2HJ2zknpCrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23365F804CF;
	Mon, 14 Feb 2022 10:55:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E39F4F8012F; Mon, 14 Feb 2022 10:55:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C314F8012F
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 10:55:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C314F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="B1vyGSVV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644832516; x=1676368516;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+PkcaMqBj6lIjRTyUfxIKZJ6+u5l3LJ9Id5glkVgEgY=;
 b=B1vyGSVVzN4Z8WjZ58S3Yqid6R2LCrO8d8Tv7wOVVN624+MkmZ9ib46M
 StoeMRl82fLAgjuR/i9EgTDiUjATVecA4SAljmTdtiaPy8u+pzXcds0fJ
 t7/KKc1kWWKnwC5X34tl9faQWu2f8+5z/YR0GqOE1bsisDmqlaiS5FvfU
 rFdiV5LGtzBFppBxDdnUc6Ur7bqc/DcqwxBH4pZ685yLDEgt2wYW7Y+Hp
 lrhofOJVmzzO4e6bda4u/CpkJQGpcE3Q51qE6urXxQLioeXyyr1vCVE3a
 ArcltcFFXCgeaI9S7VM1CLccL9O7iPzwJdOfVjGMPEB+/TCRPz7MxRxC9 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="230019762"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="230019762"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 01:55:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="528042973"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 14 Feb 2022 01:55:03 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 14 Feb 2022 01:55:03 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 14 Feb 2022 01:55:03 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 14 Feb 2022 01:55:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7bND+UL+yQ5+d+NrUTE9kWS6NgVFULPIENt7gtUjbk+0sdTgASPCRoMi0JcE8UYB4liZJNLvvLm/EUOVNuCsfC/dbqjVARPMAjsYqhw9NYc+Cu5Nta7uFIKNoIJu7N3it7LTdGcqzVhXBtKz1Pah+hVoj2nXq9ioA3gM7LwH+Hk9xz3IPh5t+uVau42q0zSNfM0q2yEJI+taO5VEHM3twWOdwUHdTh7AuPevetQr7Wn1bMjzdxVo2krtyfPup2McwkvUumUH1wUloIahzHDVIe0DqQrN6jYN1iNn015FUwSj01CbOd4l5AHhuquFqEAai/FLre8wsyfdrLkUF6Tiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEjStQd3JJgsI7obfC1s2N3aoaftpgoaAe9pCRYfPto=;
 b=IQxh5EXSspbkcS+s9hWqOzZeLnNvoOTJgv2aMAXofj5nMOkdHzQzIejOSymbb+FsjRA59cKdz7LyEx0UZl97m/1n6DW91U7PeMDiIHiCHqiPBzpuD19BHUhsUt+q00642Upw/CspM3/8aQPE8yl8Qrp05peYzSAsaZX1M2A1VbJFYmhndIYYt7Ha2at1/h2GxoSwGYmyTTtSxaWi6zhk5goCjKGVP6HHmCUzl+e9X8F0jVKGIiCNx01R4/GCT7QkOCC2hS7YE+ISmKJeKbQu02GXdCbYdfczW/pCuFAu1uJbsAw+Hu537KXmdmIhyjlT8iuaXMWdXLxQB04WEFt2Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by CY4PR11MB1880.namprd11.prod.outlook.com
 (2603:10b6:903:120::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 09:54:53 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4975.017; Mon, 14 Feb 2022
 09:54:53 +0000
Message-ID: <4a2dcca4-0909-4937-4f3b-5444fd8d15ae@intel.com>
Date: Mon, 14 Feb 2022 10:54:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.4.1
Subject: Re: [PATCH 3/4] ALSA: hda: Update and expose codec register procedures
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>
References: <20220207114906.3759800-1-cezary.rojewski@intel.com>
 <20220207114906.3759800-4-cezary.rojewski@intel.com>
 <alpine.DEB.2.22.394.2202081753430.3088432@eliteleevi.tm.intel.com>
 <c144c67d-e6a8-1baa-82e8-37065c053919@intel.com>
 <41671a26-bd27-78ab-3440-eb9cb22c1ad1@linux.intel.com>
 <23f36ba1-277c-6998-f569-2861887720dd@intel.com>
 <4d90d851-753e-3e6d-b51a-eefb2159a48c@linux.intel.com>
 <1dab33cb-c20e-1134-cdf2-e03209018318@intel.com>
 <9d90f640-041c-b29b-6161-c35c78d9250a@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <9d90f640-041c-b29b-6161-c35c78d9250a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0519.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::6) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fed465b7-e9a0-4f57-2a9e-08d9efa00c0b
X-MS-TrafficTypeDiagnostic: CY4PR11MB1880:EE_
X-Microsoft-Antispam-PRVS: <CY4PR11MB188064514D7DC8C12D5A9E73E3339@CY4PR11MB1880.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wZ5532M4JMOfdhZXClKWt39RxrqWf4JmdWKaCij2dOD4tSXsNW2/9DdQOhV/s8QDjUcO3UZwXI3ZmG1gAzaq/JClXjlMCZzu3idUMbzdLuiLm6ree2rqLhZyLd0JOsBYWItqrFLydFJ0x3uXsQP9OgeX27W8JJ9SN3+sQdkLymVCz5F7Z4Fmcja3Ba1vB2b0Z07l1gmQ/I+xL9ewp0PPrRYLKJB05x4rnnNnTYRNYaZiRtx2yCdzIPUDKjeVRJA9nnbXr5rw2Vfb7QbiIXdvjzwzk+gghS9sHessvA3bwG5sjSZONDghq3zT7WYPG1WEVlNrJ4sozOFGjQ7ATH//I+3KtLaZVGC2rf239Q9jUPGt+wBaY22PUHSOktNcTcACA6JADBQl5yvi9kwUswNI7Fw5scosJ6bXF8nboLx/kIbw0+vkOBQYyBVjBKSL3a3IDHRmYlts6UWPhSxfc3dgzNJvhui+7TEMonpsdT1fvkKDOSggeAFivk2tAURJ6arQDsRNTkjU/zVImM5+HoPalXHA5ouufdyqlnH16FMQ3H0nbO64zytifBA8rwepYn6waemhFTVpNuzfYGSaXVSiQJjf7KhrY+lzlYegcQ9VAMwhG2C+J1ef68LUFh6aHvHtKwGoNHDGu4J8S9U2TGo5nusXrCO671Yn+E4ASXS1Pp8O+TRdY9opTHr/f6rsi338T6Q2/L0kDj6wSs9L+bYQGn8ehg9bO7NOJP6deanOjsQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(4326008)(31696002)(110136005)(6486002)(8676002)(8936002)(316002)(66946007)(66556008)(66476007)(31686004)(36756003)(5660300002)(38100700002)(7416002)(82960400001)(6666004)(2616005)(83380400001)(6506007)(2906002)(53546011)(6512007)(44832011)(508600001)(26005)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUhCa09keWtGL0psQnFqL3RzaTZNd1NpbE5jR2tibDZKbE5vME5ZdlB4V2JG?=
 =?utf-8?B?REg0Qkhnd0RwRFU3Ylp4SitQVlBlYXdjRHd2U0JmN3p1MldPOU9taVpYU3h5?=
 =?utf-8?B?Wk9JUVNrcng1UndDOHR5Q0hNdUZETTNiOSt5RVlTenpsZ0dmdkZCRDZBTXJ0?=
 =?utf-8?B?SXROT1Q1TWZlSjk3dWtOV095dGpkMk1iNjgya1N5OC9zQkhRZ2V3V0NaUXRX?=
 =?utf-8?B?L1hMM2hPSzROREFtOTc4WTVLWGpKQTBjNm9NYml2dkJ5YWo4c25ycDNDcE9t?=
 =?utf-8?B?SDcrRWJ6SVNrdm1tSFErbXlNRjVrbUlTNFovYUNkbVhaeDd1MFFESU04T2V3?=
 =?utf-8?B?cVVGdFEvY3ArT2lUajBORTlOMi9hSm1tUC9hWjBVd0crOXFZampianVRbWV3?=
 =?utf-8?B?S0NDMFFJN0hkSms5L1B5eEhva2xvY0lyNG9IdTlzQ1FEaXV1Z0F0ZnFRK1Mv?=
 =?utf-8?B?c2plSy91M21mZ0lCblh2NzEzckpnbzZxUTFxbEU5bFYxa25HUnRLRGpHay81?=
 =?utf-8?B?OGdRZ0w5aVZlUnRUUlUyVnhTRmxGUHEyclAzc05JS1MyRGVQZ2srUjVvQys2?=
 =?utf-8?B?TWhjcEMzY2g2UTczbmk5ZWVzN1E1SGhoWUUwZCtFVWJDZ1MzWlF5b2pTSmJI?=
 =?utf-8?B?WkFLUnNCcjdLS1l2ZGtRODR1OHljekxLVUduaUVpYUs2cUVObkEySjVOUm5x?=
 =?utf-8?B?ekkxQVVtcmM3dzN1aER5dThhbDN4Nk90ZjE0VnM0alcwOXlENnlhQkJWa1dr?=
 =?utf-8?B?dnpMUzhPYW00M0xtckZzODlOY3hFd1J3dlFPRXFkSmFnaW9KeTdGL1ZXa3VH?=
 =?utf-8?B?L3k3T0U5enhxd2taWFUzUE1UOGFWdnE2Mk5LVFFJQ3kvVDd4TmVib0RUd3FC?=
 =?utf-8?B?cUkzTjZzTFplRTVZVXZrN0lrb0RDeUFZNExsemVtNXZqNVRMc2ltdERVaXM3?=
 =?utf-8?B?SXo3cENMSnFmdFFIVUNWZ29wbzlEc3BlMjhlV1RwbFJEQmhLRCtJb0ZFbjNl?=
 =?utf-8?B?THJpYnhHc2N3OGxPYjNBdDJ6QWppbTlQK1V6SzdCbEczZGRvblFxN1pWbjFB?=
 =?utf-8?B?eDRJa2FOcnV4T2RhVC84QkJrWkdGSGxGWEQ4a2ZVSStwSDRpcUpMNEhEZHYw?=
 =?utf-8?B?UlhDSDNjL2duRy9pRXVkY2ZNRUtxc1E3NXJ0L2h4UE91d1N6dmtSSVg2ZXYr?=
 =?utf-8?B?UW5JWE1wQzYvVnhWRDMzbjhUSXUyT3hlZWQvcW9IVnJoMDBXSXR4ZXNQbGYw?=
 =?utf-8?B?VDhFVkYzalk2NjlwaTMwNlBYUHFVU2tQRi9qeVBUT1R4YU5CRHhBSUJZR2Z0?=
 =?utf-8?B?bjZXZnlPcDFteTJnYmhheXZJQ2xpQUVTZXAwRTVSdVFNSUxJbDhYaEdWbVVY?=
 =?utf-8?B?OTZuNmhQaWhhSnBTOXZYaFpOdlRTZERUbzgxV1ROdE9DQWV4bFhidnFQWVJV?=
 =?utf-8?B?YWlvUnpvVk9XeHNBSHEvaWN3emg0VkMyc0JlOURBQUUwS3d3TXRWVFQ0OUpB?=
 =?utf-8?B?MFVvdy9ENEMxT1k3T2I1MkllNURzU1FpYUtmeVdURnl1Skl1djl1bEVBOHVs?=
 =?utf-8?B?R05KaGRmamx3UUt1UmVYM1lIdTlCQ01iMjFYQ3ZyOHhoUE1CdTF3R1ZMTnNJ?=
 =?utf-8?B?Ty9sUiszR2E2ZHVZUFN4MmM0ZVlFUnJPNm0yNWpiS3U5TEQwenA3aWpTTmRO?=
 =?utf-8?B?SGtvdVFadXpTSWQ1a2E3SDlVN0RtczVzdnBiM0FGVkY3bXpzY0ZZdnFSaU9M?=
 =?utf-8?B?eGIwR3pyZVZDajFyRWgzb3JkZWNkb3l4dnNNR1VXUUZaemMzREpiNUlDR01t?=
 =?utf-8?B?WWtDNHRmTTU2OVVndVNPVTRoQk56a0o3R2M0Zkx6R08rOUQ5cXJPb3FWUmUz?=
 =?utf-8?B?Z2dPUXArckZzTEZNbndpSDBxZXQzNW95MFBwRVBud2lzWU5TYkp2NC94RVhC?=
 =?utf-8?B?blE0NUNwU0dzRjJwenlSQmpSTjlleENROVVZSlhnZUdlNEY5WEFqdDRmUXZT?=
 =?utf-8?B?aXVNckhCc2E0cDNIVXVKYm15Ulg1a09EWlNYOWErR1NOdkM4b2pvUlY4MlZV?=
 =?utf-8?B?Vm1JT2E3VzBTcU9oNWtjemdpYVZ0M0Q4bTdmU2dVVWtrRzVnSm5uSk5xUlJN?=
 =?utf-8?B?OUFabHNTN2lJNm04c0VlWkRZZmtWSUh6NTdOcThidFdYR2VmaitpTEpBL1ZT?=
 =?utf-8?B?TGFSb0JINnRYV2FDNnMxaVRWMmp3cU0xNEI3YkpsdnEvT1dNWlBRMXYycUhK?=
 =?utf-8?B?SkF6VTJzQzd5VFR2TGxaNk5BaGNnPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fed465b7-e9a0-4f57-2a9e-08d9efa00c0b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 09:54:52.9718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xr2V2ggqkgy9dL8PUdXoyy/lpkK1oVLB+BMNVXTMF0nv9Gix9RwsDgOnMMV/5DbS5zrdbtAali8iW0I+OOPSO1MaxSXDY4UNY855kbmw8tI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1880
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
 rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
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

On 2022-02-11 4:23 PM, Pierre-Louis Bossart wrote:
> 
>> Again, we are not trying to force-expose stuff which does not work. In
>> majority of the cases, non-HDMI codecs we're dealing with notify about
>> just single analog endpoint. For now, it's 100% of the cases, but I'm
>> aware of fact that RVPs and a dozen of Dell/Lenovo/Acer laptops do not
>> equal to entire market.
> 
> We are in agreement, but since we don't have any ability to test those
> alt/digital parts my take is 'don't even bother about them'.
> 
>> Remember that you can always use topology to "gate" userspace from
>> streaming through endpoints which we do not work. And right now, we are
>> working with topologies supporting single endpoint for non-HDMI devices.
> 
> May I ask how you 'gate' parts of a topology? Or did you mean that you
> use different topologies?
> 
>>
>> So, this is a clear upgrade when compared to Analog/Alt
>> Analog/Digitalh-hardcoded configuration used currently. That's on top of
>> aligning with hda legacy behavior.
> 
> Agree, but it still leaves the door open to exposing those paths which
> may or may not work - no one has ever tested them. It's better IMHO to
> only allow for the analog path. If we can detect the presence of this
> path, great.

You may define topology with lower number of FE, thus limiting number of 
options available to user, possibly shielding them from untested 
scenarios. E.g.: Have a 3-DAI HDMI codec yet provide 2-FE topology file 
for it because you know 3rd endpoint is faulty. Only two devices will 
show up in userspace effectively making users unable to play on the 3rd one.

Again, that's a default - expose fewer endpoints (here, just single 
analog one) for non-HDMI codecs.

Of course, there is small number of users who may want to stream on 
their  Alt Analog/Digital endpoints. We do not want 'Conexant story' to 
repeat all over again. So, for them, non-default (topology) could be 
provided to enable streaming on whatever they want.

The chosen approach does not hinder either of the sides.


Regards,
Czarek
