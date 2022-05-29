Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6D953711A
	for <lists+alsa-devel@lfdr.de>; Sun, 29 May 2022 15:26:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCD301909;
	Sun, 29 May 2022 15:25:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCD301909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653830771;
	bh=yW83oXGlIptZ0fYR8SuMdoekZ+sgY77Qw7BGu6BdVmQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jij41D59bdr3z3c6XZMMepw1AOkYCi/ukR4JZRvK9mZfBGbD/L9qPI1CZ0d2FbamG
	 0b0TJQ0XkTCYKEoKjPOcyOShedaiTZWgl5Atrvq28HmhEx9UKje4Pkka4BisYXTI0q
	 8dMSvm98//Cva0SVw1pmtUAuzU9P2ZealPuJkye4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BCA8F8026A;
	Sun, 29 May 2022 15:25:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F3A3F8024C; Sun, 29 May 2022 15:25:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0123CF8010B
 for <alsa-devel@alsa-project.org>; Sun, 29 May 2022 15:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0123CF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Y2r1JhNe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653830710; x=1685366710;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yW83oXGlIptZ0fYR8SuMdoekZ+sgY77Qw7BGu6BdVmQ=;
 b=Y2r1JhNeOcmZZgVIEHyMHLXt2L46CJ0z5w9bfCst2IU0DoMj1DkkUW6m
 8BQYBLc6Qq7XP4v4n3rxwNBbeYkVS/kQ67/IjUHoczO2eeHoyo5sK1v8f
 eV2+tJxc4gXm5E0fXMUie8UUKyUgCm4n49pH0feeW+12AFp3PvgqolZGF
 nNQ8KfXftL76ga3rOiR1WL74m9/OEu1YdmZBFQTi31iaQxPEH316OGzrL
 PU3vc9x2ObWZe38mjw4pRUtM8qo5nPcLDiDFPaxzvk+s/A0qv8MgNR/hL
 72/BI1OQpXHnydYHLrse2wkQ5hJgj/+8SXgBN+4WVN49V5Y/sAHvmWhUF Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10361"; a="255287886"
X-IronPort-AV: E=Sophos;i="5.91,260,1647327600"; d="scan'208";a="255287886"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 06:25:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,260,1647327600"; d="scan'208";a="528834442"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga003.jf.intel.com with ESMTP; 29 May 2022 06:25:00 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 29 May 2022 06:25:00 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 29 May 2022 06:24:59 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sun, 29 May 2022 06:24:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sun, 29 May 2022 06:24:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mU7ZdMF26QhVO1mO53nbzc4e/r7Lnb9BXqqbwUfZU5cTHapZfcx/xMgXmwdhPVStQEZACcTyWdmStDnly7CVyRBQod+/KeaQN0x1Gz7dHofgDtb5+Vx8OeQ5KnBjosYRfszGV4kXrttBReTy3ToE1OQTp+QwNhBfDefR5qZOuasZ+NuyVaotcmP471VAtLwYrVm05d+1zlXqitsrR92xH9sn2tKLI7Fr2FuKVdr75VY4YX9qDZoQJD8cny6Q6fN4pjnKtoE7YuDdU3FYd3s7Su0Sgjh4wixera9OBA7DxZ2d4WQjGE4NQdFb2n8sKh97kzR1MFgOgjGbBzId0axqNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Z6JUUmdTcaT9kzGBUrgYJVx3QAMJ7WsIWLLfVFGnJ4=;
 b=JloiCyEAaCbUhjRvfSWC57WmK7U3Bxa4Ps8vE+tSSFVcW1wMB7+ceWcGWvtZruIoN96WxqhqiXxxC0V/UtZlWlnlXo2RRvvOwzzckWvbi/1k0b7hxET4U9rQj9zLA8m7hAwhMGuPsAtqPP3rp8EjnMuAdurUBIXyATDNjzCzvCdYrw3e5jveRIxykXWTglRmSgN/mkRPbL2ZEPjle21VJprKcOaeJr3GwHtDO67i+kFmjY4qTUuoOgGW6PWWXAiTC+bZkE2mSGJULXvqKVMgax3kpYQ7tHXVCTlA9LLFHKchFXGphrHAsXl5zfq6PXHPkwHG4n0mpYGuNrP31ldwKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM5PR11MB1995.namprd11.prod.outlook.com (2603:10b6:3:10::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.18; Sun, 29 May 2022 13:24:58 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41%5]) with mapi id 15.20.5293.018; Sun, 29 May 2022
 13:24:57 +0000
Message-ID: <550c53c2-b638-d087-58af-4a1f30131237@intel.com>
Date: Sun, 29 May 2022 15:24:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v3 11/15] ASoC: Intel: avs: Machine board registration
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>, "Mark
 Brown" <broonie@kernel.org>
References: <20220516101116.190192-1-cezary.rojewski@intel.com>
 <20220516101116.190192-12-cezary.rojewski@intel.com>
 <20220526162443.GA60418@roeck-us.net> <Yo+8hvwhvdx7tNGI@sirena.org.uk>
 <20220529054807.uuqpsnt3w6dwlzuj@pengutronix.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220529054807.uuqpsnt3w6dwlzuj@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5P194CA0019.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::29) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b3c7ebf-92c2-48e9-e69d-08da4176a03d
X-MS-TrafficTypeDiagnostic: DM5PR11MB1995:EE_
X-Microsoft-Antispam-PRVS: <DM5PR11MB1995726E59F320F49ED3CECFE3DA9@DM5PR11MB1995.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GrtXQPV9hdms2QQaNSWXjofXEN0YVYMrT4MQoxo07YUIUMtYRFuAhfHnfwhEK1znf5mIpGI80xaihKBvHgJTuATXYs5rzf7K8MlSYjFFFvzjgXDZlmIaiQ2nfZysqQKCzdwEkWy9ltoUId8WZxmREHIUMLIXNW4Dv2x1p7p2BwFR+nmx5C1GCTdbCxxJa5Yxh05bQOBEH4Qtwp+4BzZp6TbR63PmJPWnFXXHoD2nowvCGVsVRkblXFWihGXOfc2EkY7lfxaSCbNiuJmaD3lCa1wJHcXRkYNKAIu+tfPFkCPWHBF/tTODkhfneLNtV5ow0iY2iShi4VFUYE8rHYM1p8sUdGFSxNACH5JnQxmrFOu5lA9PF8HB1/N7IokQ20RKi3ani5ny/19tkhc7/l+wflz410xoRcnGtxnTROolL9aMOhdYApCInqrFsenv2DwCe45sk1JZ5ignvHdDNHMcBKaDk08i0Dji9oSChH25m9IRET4FctSKJyqblf5MnOIuQUTVl7qziZNyXMl0kyuIQNYSfvHyWIyVSEqML3oo5IsUgDDG1WJbw0CpKH3cVuTGq4f/7jzW3lb1eixHQH1pz9Si3R9dtDX2r0IcxmUgpWGpadgpuOetJwzqSyGqUH+bxz7I2MnHs8YIUQWDWgtes7W6hmAp35G2WlX7uS1+GW017+eOQEmhmX04qZeennq31fmoL6lYaC2cRTx6W5AUc1udkVnUioVQIN8aH4jwBsM5xV4Dr9/q5z8UDHVsZfGIxwI25bYfIfVAbG3H4xp1hpFEBL0z3P+q6pEBa3JaSKVrpdQ2zGuE0HgCLdJOa6X4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(44832011)(7416002)(6486002)(508600001)(82960400001)(5660300002)(8936002)(186003)(6512007)(966005)(2906002)(6666004)(2616005)(66574015)(26005)(53546011)(86362001)(31696002)(6506007)(8676002)(66946007)(66476007)(66556008)(31686004)(110136005)(38100700002)(4326008)(316002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eE50TzFqbnUvU2JyOUVtd0crcjNiZjhvd2N5WGxkNFhkL3FQOEZaalpOV3Zr?=
 =?utf-8?B?TkpaRzBSVTVYQzVPOWRjejJoZzR1UGZTR1pzeHQ1WjBqQitEY1RQMTlTeEw2?=
 =?utf-8?B?My8wd2hoRlpVMS9IR1ZXNDB3Y1JTaGtNZUMyclZsc2Vza3JxVlJtcTBaM2Z3?=
 =?utf-8?B?L1FhZndGbVVXU0Z6WFFNYUpidDJTYVJKVlVYWTJIVjNSNHJFUCtWa3NGenp5?=
 =?utf-8?B?MHBibjdDckREY0R0eXM5cHo5V1JjcnlyZGFWemY2MkpUYmpBRmVpbWI5ZEZF?=
 =?utf-8?B?ek9CZ1J1cU1ZMDZTQWFpUHVuZHRoMDdMdnhQR2VoU2FnVmdWblJPc0pGTG9u?=
 =?utf-8?B?ejk4WUtQK2k2WXBuZGVFT3E1NVEybjlFSy85aU9RSFhmNUNXVk85OXlZVU9L?=
 =?utf-8?B?cGJXcjQxdTBtdTFKdHNMNWJBUnBYUXkxdmpLTmhlSDl0Wm80NjFDS0QxMHAx?=
 =?utf-8?B?eFR6dUY4b1FyeTVmcExBeDd1TkNsNGF4ek42RkZaMW5oekh4QnZIS0tIZjJP?=
 =?utf-8?B?SThaVVpJQWp6UWNFbE9LODhWdXhmWGpLQkZONkpsaStqNXZ0QVYwb28wVHpZ?=
 =?utf-8?B?MzFlMDl6ckZ3VDVkNXpWMkxsckVocFhtUzN1dWdndU5EeCtBNVRMTmJiRDFT?=
 =?utf-8?B?Rkl1S1RFM3VrWlY3L09wV2UyOERCekFITDd2ZkMxN01ON1hqVGtTMEs2S200?=
 =?utf-8?B?Z1lUQTNORjljM0ZaODNpaWRndm5XV0gwKzdWdXZHMDRhYXVFbUhyVkN2aDJT?=
 =?utf-8?B?NHgxaVhzaFN4ZVdFYk9MSFhWbXg3eWZkbzVtd0I5Nm5wdGRSUXdGdWhvRVFy?=
 =?utf-8?B?ZHFxTkRLUjArbFZKbGp2cVBodjZwcTZWek1rcjlseVRHUWRsbUxiMlc1VVBm?=
 =?utf-8?B?UTZySCsyVnozUmJ2ZHU1ZExxSXAvSHZrYXh6UzZDVzlSeTJUcy9IUlJnT29R?=
 =?utf-8?B?eTNQMytiejZiWk1mdk40Ry9nZWtscU4wRE0xSDl3YWM5TlVxdTZzTThmMXZD?=
 =?utf-8?B?WHRqY2s5ZVRadlpDYmpLQUFucEZ2cEMyVFNkVVpmTnJYSFJObVNJd2dJTjg5?=
 =?utf-8?B?Sjk1cHQzZjFUa1BIU2ovdFpPSjF6MDM0Q1lseWZ0d1FaNjh2bGt3T1ZtNjJ4?=
 =?utf-8?B?Q0ZRcFBTWmtmWWl5MTdHSEN4azVkRVFqMjRKQ3dla3V1c3duQWVqZlNvMENq?=
 =?utf-8?B?ejdrNUtPZkFEMlNzN0NtWUg5eVNVQ1czS1daenRidzJyd1E3R3dPNExGZGp0?=
 =?utf-8?B?R2ZQZ0wvVXRWUXBSYzJYK2tnOGhCb0MrZlFMV0dvb2xzVzZLcDRERU1kRytj?=
 =?utf-8?B?a2ZLTEh5d1kyc0hiRWdoRTB6M3cyMDl3Q1k3cUtXT3gveTFxQ0NDTDJVS0FU?=
 =?utf-8?B?QnlwZGVITTRCa0ZCZ2pBT1pqazVnM1NtS3ozdEgySkRxb0tEZHdEU21va1JM?=
 =?utf-8?B?YkJTazdIWUd5VDBhV2lSTVQyOEJDUVpaRjVGNXN3NmlYN1BBRFBmR3BhT2RH?=
 =?utf-8?B?a1JuYitaMkc2THphTDlEaVZNSk1TMS81MG5jeDVVRjRtdE1yeTdJYmxHUXhk?=
 =?utf-8?B?ZG5DOTFXb2NqOXY2RDRodzZURGw4QVFwYlJyMmpXd0U3akhjd0JnczJQYjZn?=
 =?utf-8?B?QnlkRkJMd2lnNFlDOGFOZCtISG8xM1JnTGRMcnhxVllDQVVmVnZLMnZGV2Fi?=
 =?utf-8?B?RGZNWDhHeG56MG9BZGpKb0RyOU9iSitSUHp2S0J0NUUyVkdSK04xRFY2bVBV?=
 =?utf-8?B?MEdLd1d3UmxBeEF3OFVUWXNOQ05OampTQk1GSkZjVmRDN2lSL1F0aHM0VHd0?=
 =?utf-8?B?OXc3NFdJOEpsNVRJdll3c0hON1E4M2JWU1M3SjZMK21Edm1nTTBZeFVERXhE?=
 =?utf-8?B?cXVwTWpmL0QvRGFZYVJ5eXNCU2tuMllSZitHQVgrRnFVT29sNWEwcGdYOVQz?=
 =?utf-8?B?UU9PY3Q4VkYwNzZuUDBQMGNkYUpDK1BJWUU0NkMvUDNxTUpwaFlZenlLVjFw?=
 =?utf-8?B?azN3NDdCQUtXV3B0WkI5SS81MVN4QmZqekYrQU9xNDJHZjZ5dDVReld3WEFq?=
 =?utf-8?B?L3B2bUUvWVV4VDZWQlhxVVRzNEZveHNpT09LK0E5ZXUxWEdSN2hOZ3JWemhK?=
 =?utf-8?B?S1VNcjZZWTY5RmUyVm5zWk1mQzNyWVJxTFZMc2EzaGFpZCtHdWk3YThyMVpW?=
 =?utf-8?B?TzUzY08xOXFOUW1KMjMwWk41T0ZlTG9EazFYZVFZMzhrU0VDb2ErbEdXQzZ0?=
 =?utf-8?B?UXp2bkhQSWVjNWcwOFpZeUpyK21sMjNjNm9maEtka1BVS2VYYUtjdlJFelk3?=
 =?utf-8?B?T3ZtTTlMVzc3N3FQdXVLYnVZdml6Qkc5OCs0Wkl0MWRRM0s0eUlBVnNBQ05v?=
 =?utf-8?Q?18jBzF42v+8XxupM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3c7ebf-92c2-48e9-e69d-08da4176a03d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2022 13:24:57.8265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tjxc2Nqijx+ZZQB9rN8IRHqEq6xYaUmGH7SSmwLr4o8YIkb402DinoBAM8E4xxbpPzJRxsuvR4/xRjmESinXPACU1XYKE/Em6urRYKprQaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1995
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 lma@semihalf.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, Guenter Roeck <linux@roeck-us.net>
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

On 2022-05-29 7:48 AM, Uwe Kleine-König wrote:
> Hello Mark,
> 
> On Thu, May 26, 2022 at 06:44:38PM +0100, Mark Brown wrote:

>> FWIW given how hard the 0-day reports have become to read I'd not rely
>> on people paying attention to things that are clearly pure build
>> coverage based off a 0-day report alone.
> 
> I'm unsure if I understand your sentiment correctly. Are you saying it
> doesn't matter if a patch breaks the build on some arch using a
> randconfig?
> 
> My position is: The commit under discussion (i.e. beed983621fb ("ASoC:
> Intel: avs: Machine board registration")) breaks an allmodconfig build
> on all platforms where __fls doesn't return a long int (i.e. arc, m68k,
> and sparc). This actively hurts people who do build tests using
> allmodconfig (or allyesconfig) for their patch series (e.g. me).
> 
> I agree that some reports by the 0-day bot are hard to parse. But still,
> if there is a build problem someone should look into that. If you (with
> your maintainer hat on) don't have the resource to do that, that's IMHO
> fine. But I'd wish you'd push back on the patch submitter in that case
> and don't apply the patch until the problem is resolved. If this is a
> corner case randconfig issue, applying might be fine despite the build
> error but breaking allmodconfig on 3 archs is bad.
> 
> The fix would be


Hello Uwe,

I don't believe anyone here wanted to break the build-configurations you 
did mention above. I also believe it's important to mention that below 
is not a fix but a W/A. Developer should be able to use __fls() if 
required. Value returned by fls() differs from one returned by __fls(), 
and using fls() in below context is misleading (hurts the debug-ability).

Yes, the faulty print should be devoid of __fls() until the function is 
fixed for all the archs. It's too late for that and I'm sorry for any 
inconvenience caused by the change.
To my knowledge the real fix has been provided on LKML by Amadeo [1] and 
is under review since Friday. I'd kindly appreciate helping fix the root 
cause of the problem. If there's anything missing in the series let us know.


[1]: 
https://lore.kernel.org/lkml/20220527115345.2588775-3-amadeuszx.slawinski@linux.intel.com/T/


Regards,
Czarek


> diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
> index 80cb0164678a..f189f71b8e1e 100644
> --- a/sound/soc/intel/avs/board_selection.c
> +++ b/sound/soc/intel/avs/board_selection.c
> @@ -325,8 +325,8 @@ static int avs_register_i2s_board(struct avs_dev *adev, struct snd_soc_acpi_mach
>   
>   	num_ssps = adev->hw_cfg.i2s_caps.ctrl_count;
>   	if (fls(mach->mach_params.i2s_link_mask) > num_ssps) {
> -		dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%ld\n",
> -			num_ssps, mach->drv_name, __fls(mach->mach_params.i2s_link_mask));
> +		dev_err(adev->dev, "Platform supports %d SSPs but board %s requires SSP%d\n",
> +			num_ssps, mach->drv_name, fls(mach->mach_params.i2s_link_mask));
>   		return -ENODEV;
>   	}
>   
> which uses fls instead of __fls (as is done in the test triggering the
> error). The former returns an int on all platforms.
> 
> Tell me if you don't want to squash this into beed983621fb and prefer a
> formal patch.
> 
> Best regards
> Uwe
> 
