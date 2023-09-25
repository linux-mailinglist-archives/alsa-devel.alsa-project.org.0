Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E07A7AD829
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 14:37:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4E1FDF1;
	Mon, 25 Sep 2023 14:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4E1FDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695645457;
	bh=VytRYyjivDjwANdOWc2+xXZZlVS7mTssJ/UB+4VW6AQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tDqn59V0s0cV5W24n95u1jMV87UaKhrl8DEpuocduyMBSLLOQb3V9P8NLbasRr2xs
	 ryTVVpPLO0DZ6GWdXd688cV8pdebmbt+tnleM/70f4X5xkzatVB5avx9t+N6HSnz15
	 xf7Os92b9UCzeJBnZ/yoCs1xck4V+HZTyDXoLtls=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F812F80552; Mon, 25 Sep 2023 14:36:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD6CDF80166;
	Mon, 25 Sep 2023 14:36:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71ECCF8016A; Mon, 25 Sep 2023 14:36:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 374ABF800AA
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 14:36:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 374ABF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VBXlfuCO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695645399; x=1727181399;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VytRYyjivDjwANdOWc2+xXZZlVS7mTssJ/UB+4VW6AQ=;
  b=VBXlfuCOImOkU7/9yYBlPc4YWUNr7rq6PNafqiR/VminH5wUFFNdTemy
   2xYRMOhuB9MkeZOobzUPliee5v+qpJ4uQApSN3u8YeyYaqfyktssSmDHk
   2Ieesis23d3kz/PR+xq+RcE2SuWwyfxKPCxfaomVYAa8hbbu6FznHZmFU
   83Lx13DbzN8N2Rp6dHZPJwFgqoAmFKD4iLyKxONaAvFrAG9BEIRrYvRc1
   Euyt2dXBrX2gkG0zGVhk+QUtVQGVCcDM9zlPNf9g3nsMploW185orTac3
   3RajC++TrqHLi4jsjzLx4glEMNYDWgnggxDJz/++NfHjDFUyhAo3Q0i4N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="383999122"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200";
   d="scan'208";a="383999122"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 05:36:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="777636952"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200";
   d="scan'208";a="777636952"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 05:36:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 05:36:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 05:36:34 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 05:36:34 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 05:36:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=am77uIXNukfj9FLty7NGqLzk23FYMX8P5njn91gNJAqeaWv5YD7qJ/jVz+WYddax3P0naVTUMk5vDTAKR4jiO2JpnYyv4Bt++fIEaPuJnilaEz14nD4XrdsURBKREainOWTBHqX6hShyYQ0zkOLvnrlA/5sm3Nll7wRCdhCu7zIF91mO8P6FETAh8tajBAiIqh8xlsOWLPNJhM3253WBidwKUZtjKOiiwkvgWVbpUCBq2W0+pwJmarrf3AWGokkfL18qqObvPOx8FU+0RgG2Fo4bTVObzM6nk+4NoHPn3s+rYYhEHDBMdDGw40JPKSuI0uDbbp5foDE2e5216mDXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7nc1THPXr3JA3vNbgxmGpzx4p2iPzuYsxfhM0c4bK0=;
 b=YAhJ44pr2+5sjvJrYZf9fMCOF+ud9pLfSYi5yfjULu4RX4B1Y3StbNR5eTynjiuuIX555qyP/qhKUzpsn66tDuLjZwxK1OLcbeD2GJosIwuJ7vuYvmEWbFd5uEC+dV5Ok+dRnKC5ECLg5ICekqk8TVSi/kBfIrrmr2b1vaHBbNhHoY3DJBEBoux43y+qNq0rP1NhlwB7ASAuHKRWY7fSZ+7EsLjDbgXuyXswylO0ZaH4UJ7iii/K1MCuz6qIRblXLykPAmSvbLq/oDN34byg8WCBePzYIC4FatqoaleuA7X0rxADdKodXLXNl8EPnnVGcrs240Xx7+67Im+R+cjssw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DS7PR11MB7906.namprd11.prod.outlook.com (2603:10b6:8:ec::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.23; Mon, 25 Sep 2023 12:36:32 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104%3]) with mapi id 15.20.6813.017; Mon, 25 Sep 2023
 12:36:32 +0000
Message-ID: <b64cce63-bf3d-06e5-ce82-78ae36d3f0dc@intel.com>
Date: Mon, 25 Sep 2023 14:36:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/4] ALSA: hda: Introduce HOST stream setup mechanism
Content-Language: en-US
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <perex@perex.cz>,
	<amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>
References: <20230925115844.18795-1-cezary.rojewski@intel.com>
 <20230925115844.18795-3-cezary.rojewski@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20230925115844.18795-3-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::15) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DS7PR11MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c1341f6-5556-48f9-8a6b-08dbbdc40b8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 BDsFk2hODDMSJPJ5hLrPEO4E+aJCBL4xm6EdSmCjOtAvnwDpVBpSrYls7bb7zAVQHfctsUg2kiP47g07vs2kTd8/P7bo2m0kSnlFDrzeCJPA/BUSxyEj71wNRuDcQoh/f6gybYHKQJkS1D+hOZwUip/IwMgdgBQYrnxLiDxTF4KI5jasjT3ukJRuyOhe/LKC3HSL+rYVqBdC/eZzC43sZFkvWygZpHrriGtT3CSpYuXwKjhxyAtz/3uRj+iyIT3pKHzjOct3TZVo4F/wxWCow8H2EgD4J8PebGZi/wmiOlpTo6vMmF2cVJirzVcKVvYQJjLfto1h0qo9bgDfl1loSpU65WkCFFvDoJKCoHrN24XuV9qvSgW8toucw0tQZDVWoi/wbZ6Za6yMGtUV3lAEmjS1uhJsRuNZ5HY2KY0cW9GxUNfIEvvi/DrLwUc159TWQaIuRNW0g8eBfgJEGUD/LXYbgBEgGb12xuLoihUSQehivrhMt3J2wn3iuKuFmT6VA+OFF2dk1iCWR6Ds2FTyVTDk/84WArnMHt8tKHq2HIKs0+RonhPuoY7GpIvAMqK0rhQ+0oeVcKZ5dEUYy07iuvNEQ1A+Aiwpljk9el6VXD1OwM8MGeY0Oo7W46aL5HCdkHboEl2mTijFba4DAX/K6g==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(451199024)(38100700002)(82960400001)(86362001)(31696002)(36756003)(478600001)(2906002)(66476007)(6666004)(66556008)(6512007)(2616005)(6486002)(66946007)(4326008)(53546011)(8676002)(8936002)(6506007)(44832011)(5660300002)(31686004)(316002)(41300700001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?Q3BiYW9sM3phb04yNkd3b01zeDc3RXJOMWx0aHZFc0NYUWpSRis3cytJYTNp?=
 =?utf-8?B?a3VvTWg4ODIvN1g2cDVWTm1UQlc5UjduNlo5ZnRTSzlHY3pZV1grVTI4R2ZK?=
 =?utf-8?B?QmcwTW5zeGF6L0ZxLytTcmlPcVlwcC9LdGIvRVByUmRXT21XQjJlYzh5RHRk?=
 =?utf-8?B?OXV6Zy94OG1ZR3p6Y1lHaEFSc3ZaZ3pUei8wMStmVXBXY0FkOHNxaitQZVZE?=
 =?utf-8?B?c2ZZWXhZY0dqTndmejkyTjFBTXFaZ3dOYThkK0ZrbTVhaSt1bkI4UlVOQlJq?=
 =?utf-8?B?cEY2Mk5iM2UybWxvUktNeEc2WWpPL1RIc0dNQTJWenhLSEtmc2FPQVNIR2pU?=
 =?utf-8?B?RUVpSXV6TVdjOFZBQnllTjgva1o1YTlhTzk3NWRtQkRxYjAwYmZ1czFKdTAr?=
 =?utf-8?B?dkNqU0Q0dzFnRlNSTm1GZ3lldlE0bVBPWlk5NEJ5SVQzT1QvblBwZ1czQ3c3?=
 =?utf-8?B?bDZVSjJ5NmxxeEhDR0NmUDMyeEpGU3RlSHlmYkpGb3J0akpxcy9vUWRQUnlR?=
 =?utf-8?B?a3UyVzMyZUZlSXp2L0VVbnJqUHF6c0RwNzNqY1Y0MmdkL1FSYjJnMWJpeW1E?=
 =?utf-8?B?eU1kUk1vQTViOUpld3BSd2hDVkQvOG0wRnk1dHRRMmEwbmdyZS9XTXExdjdT?=
 =?utf-8?B?TWJTUzR6YklDMzllOGd4M2s5NitmV2wvb3JRYmVCOWNKUUdpQjNyMHdZOExG?=
 =?utf-8?B?azNEaGJEM3pmdDhFc2lHWHFhblRWcmhnZ20xaHlEaEVMM3Y5NmhDbFNiWU93?=
 =?utf-8?B?dHhwWUs1cHdLeWF3ZWEwT0tlMm9EL0tBcmJ5VmxZbUEvL3BxT2lKdUN1TjRV?=
 =?utf-8?B?ZTZZSnVHTVpCVWY3QXVrZjZVRm5OSDM5a1FjeHVpTlYzb3p3dFh4dDZRNHJm?=
 =?utf-8?B?bmJQa1NjdFhVTUhTcTA3WEZ4ZkR3T0poNEk5TmVCRFBOWE1EaUdSdWNVeWhE?=
 =?utf-8?B?bWZCWnpFRlFYdzBsTXovSmRuZVJPRzd6ekZLU0tNN0VhUHBSS0ZKdHhyaFZw?=
 =?utf-8?B?endlYVNOc3M3YVJFeHNiN3F0Tmt6TnUrUWFsMEYvZ1Q4Ylp5K2tHZDFsMFZj?=
 =?utf-8?B?Nk9SRExhVENXdzdwWlIwK3JUd1JReEQ4MzAybGVBZUNVcWZmak1DUHdUcG5l?=
 =?utf-8?B?MnhUdkplbXgvZ0UvMHp1RlVOeExobExDMW11bThiNyt2UDhTbkQ1bFY1S2Rn?=
 =?utf-8?B?T0U1aTV0clBLNFlncnppOHlQWVNBdVl4cGRxSFNPM1pkWXZVdVBmNDluUlFn?=
 =?utf-8?B?OWRKdlVIeDdkVHR6NlI0dmFNUUoxRWI0K2MySnU3NWI4bm03a3ZHcitzN0hM?=
 =?utf-8?B?bGFvTis3SFNkbTluZUdzZmU2T2FZSzUyN3QzZDFKYW04R2NaeXRDTG9kU1NO?=
 =?utf-8?B?SDlvQ2lyMlFYbllldDZCbEI3UlduY3lscGtuMWFCVE5XMEt6OWVINjE5NVA2?=
 =?utf-8?B?K3FPcjNDK1dxV2Q5L3NYZFhRODlxTFNqUE5rRThXM05zY2tveDFvdnd2dEJM?=
 =?utf-8?B?RXp6djl0QytBZy9WZ2tyM1VscU4xYnNwQ2dnQzBGMGY4bmxPNlRwVmIxREJx?=
 =?utf-8?B?dWZuMUMvNzVnN1FlN0dVZk5TZ3RNNjhwTnZINW5HTktIQktSREJyOXRMYS9q?=
 =?utf-8?B?SnY1SDFZN3I2Y2ZhMkZsS3k0a0s5Wjkwb0lNcWJrWUdvK3JTMHRLVVYxSWNn?=
 =?utf-8?B?cTI3WUNTa25NY05DSFR0SHIrczlaNVJTOXgzRDU2TkNUUzU1d1kwRjFIZFhw?=
 =?utf-8?B?T2kzYmRQVlMyTGVaVU1Lb1RNM0dBTytYZGx1VHM2ZkFFb0ZWYmlMeFArL1lR?=
 =?utf-8?B?ZURXb2VzR3g4TjRRdm5oV0JLbEcwZGYzYW50NmZVY3lhbVdOeGlsTWJyT01B?=
 =?utf-8?B?L094S3ErTThVTk44RURHRjhOeGZOTlZJMExpbVhydWFJR2RGeTlNTEVScTJH?=
 =?utf-8?B?YUhiMlpmZWVBVk01OHVFN3Z6ZytVNmYrenU1VmhWdEszZENpN0YvaUVGam5u?=
 =?utf-8?B?ZE41eFJWckNNbTEwcTRaeTl1dG1nSENqMm56L3Rhejc1WEhJdTdwalZoUFg4?=
 =?utf-8?B?Y0x0eDdNeXQxb2MzWlhxVGtWSXg2bENtUjkzdytialZpdklibUNqWUZPemd6?=
 =?utf-8?B?MUdzdEpwYzVRRzIxbEJqSklJcnAxR3A5bS80TmNMcWdDb2pDazk1Yjh4cnRO?=
 =?utf-8?B?SFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0c1341f6-5556-48f9-8a6b-08dbbdc40b8a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 12:36:32.0240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ug9bxRkKrvd5MYipl0zx8aT3uruj33qWh2tmtWED6GpOt9BzTmpNrATdz4mShApXyv9O/KoOhNmW5G8QX8ZYHMF7sT2eWjTCG4vXspTvJXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7906
X-OriginatorOrg: intel.com
Message-ID-Hash: 2KI3NGSZVWOMBQSWBATRJGKBCGALF4JA
X-Message-ID-Hash: 2KI3NGSZVWOMBQSWBATRJGKBCGALF4JA
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2KI3NGSZVWOMBQSWBATRJGKBCGALF4JA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-09-25 1:58 PM, Cezary Rojewski wrote:
> HDAudio stream setup procedure differs between revisions of the
> controller device. Currently the differences are handled directly within
> AudioDSP platform drivers with if-statements. Implement a more generic
> approach and expose a function that a platform driver may use to ensure
> the correct procedure is followed each time.

...

> @@ -55,9 +88,16 @@ static void snd_hdac_ext_stream_init(struct hdac_bus *bus,
>   int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
>   				 int num_stream, int dir)
>   {
> +	struct pci_dev *pci = to_pci_dev(bus->dev);
> +	int (*setup_op)(struct hdac_stream *);
>   	int stream_tag = 0;
>   	int i, tag, idx = start_idx;
>   
> +	if (pci->device == PCI_DEVICE_ID_INTEL_HDA_APL)
> +		setup_op = snd_hdac_stream_setup;
> +	else
> +		setup_op = snd_hdac_apl_host_stream_setup;

Sorry for this, due to renaming I did send incorrect revision of 
patchset. The if-statement was "negative" previously. Will send v2.

>   	for (i = 0; i < num_stream; i++) {
>   		struct hdac_ext_stream *hext_stream =
>   				kzalloc(sizeof(*hext_stream), GFP_KERNEL);
> @@ -66,6 +106,7 @@ int snd_hdac_ext_stream_init_all(struct hdac_bus *bus, int start_idx,
>   		tag = ++stream_tag;
>   		snd_hdac_ext_stream_init(bus, hext_stream, idx, dir, tag);
>   		idx++;
> +		hext_stream->host_setup = setup_op;
>   	}
>   
>   	return 0;
