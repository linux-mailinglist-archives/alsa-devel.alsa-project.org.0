Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3914CDA94
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 18:32:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 141181F14;
	Fri,  4 Mar 2022 18:31:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 141181F14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646415133;
	bh=7x1xN1CTLmT8J44Q7Sv4SR7M2mdraGUwkHyaOZPSP/k=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XNj8qZplfKe5K1nnhicn7zkxvwqk5n9dauVL9VePRoay5UCMFBHm+7kDnDDY4PL2X
	 AbgYtiejtByEQdLd6sY8MWIOiJQQtnQig46GHS69HCJJHeCj/Z2wBmlFGc6TwVai4i
	 ZGSnmreMWVEP9uJqNPTQ5n2JmOi2Hbdb3pUjqr90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 753B0F801F5;
	Fri,  4 Mar 2022 18:31:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69FEAF801EC; Fri,  4 Mar 2022 18:31:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01D39F800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 18:30:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01D39F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dzwaLCcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646415056; x=1677951056;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7x1xN1CTLmT8J44Q7Sv4SR7M2mdraGUwkHyaOZPSP/k=;
 b=dzwaLCcCSm3XW5D7B+7O/UoSfz9AwYz/maQ424psndoIeFVlVrfwb/Sv
 MmJy8l9Cnhl7Jf+hpWkd5jimz/vpMVS6C28kmHHcqPlWgVqoAFYGqdaQw
 SM8NdDcs8E5pIR7daRcsk/1yGiVNm1KN7KrALyZANOUvVDNN+yUT2iQEm
 4PRogJboLXPMFrX8/cAA1sRir6HkJ6Vd1/oieaxslLQViSlTtMA+cYRR8
 ArjpFqHHdgMgEpKAHkbd9U/hxrrkoR4wP+LcqUtsCoEtnbjd98ZC8e7lO
 8O30y9mnNlu8hShKSDMhaYeocrkhVm3cX92scrrHw4Ap+aJTA3aXm/ubm Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="254215106"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="254215106"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 09:30:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="610008920"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga004.fm.intel.com with ESMTP; 04 Mar 2022 09:30:43 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 09:30:43 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 09:30:42 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 4 Mar 2022 09:30:42 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 4 Mar 2022 09:30:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cft6UGH7QiRTAfQFro8hCrP84ZYAXSwnVLMx5cP6R8B4AiKtYIzzT9RaGtXzIAi7xu7v4aZ5jAuWKaIvBPH3wCNn4V1I0AnVfTcYA/caPm+Il0xskhmmBp3dGPKh0GFLaj2eNH9NcD0y9nAfjeUVr/NZekF5S5zZW+gjSSLQhBIfxxg9qNazTzPz3LrwS0PP6fvTulhKWQ9hVODe3T/x3B0mTjzqswinxooTtAcEpTF4uDtqnfx8yOtb5BiYepMoPCGpaLDXM7ovR4C6t6mEfViSKgNNA93ocmt91JQlcc0TOLN2p3pUaHRG8W6j+TJICWYN/hqvxKcRjQdZ3POuIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6myVQtdgQYQoN4YXQdV5tyhBupMv5vasZiQvy36WSU=;
 b=XNT+mKID0LlJku47wk842sbgDb44tp8BgQ2TmoIuuXEMzJpBijFj8X1Q+8TzmK/8Dk+BQu6D+D4H08wqQGvU74sgiSiOIN23HVn/EF9DW58D2v2k3MU1Yh3XxOZNiU+g6N5xOy6/3TwWRCAD1yfeu0jCwmMhmA0t7tG1qsQsF5cdL/Nhn2UegHzNCEmgTLZUUwCeW7ufW6EvInv1xPZwGChBGFxxo/NyW0VdBqauHhiVRFQiT2V0zwb/eHQE2EYxT3ygt8b2RB/lyVGqLzxWm0FHRMkh3QV8mizHqoQ6TolLAX0s+3IDnH+TM+8+GsJMyfxsCm2BDgQdPepsbtkjUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by BN0PR11MB5759.namprd11.prod.outlook.com
 (2603:10b6:408:168::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 4 Mar
 2022 17:30:39 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.028; Fri, 4 Mar 2022
 17:30:39 +0000
Message-ID: <5abcad8d-a893-bf83-4ae5-75bf58c09f84@intel.com>
Date: Fri, 4 Mar 2022 18:30:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH v3 08/17] ASoC: Intel: avs: Add power management requests
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-9-cezary.rojewski@intel.com>
 <9133f43515f17e3467594d344db73ea6f6f5ec9f.camel@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <9133f43515f17e3467594d344db73ea6f6f5ec9f.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::18) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f4d7a26-aff7-48c4-43d4-08d9fe04b33e
X-MS-TrafficTypeDiagnostic: BN0PR11MB5759:EE_
X-Microsoft-Antispam-PRVS: <BN0PR11MB5759D70F3900CBE7007CFF35E3059@BN0PR11MB5759.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ggip5Dch5ulHQB8eVzlWysNbZOEWN/4OkvjveRMS/ePAAhitJ9wEKSKWZwu7kMolGsNVlX3desHjkAd4bRn6OdxY2thlUyACPkgiggtR3YYKyHtNxFxA401xKm4l902YQMYR9Iz3BIeb/I3HZuw4XzAZM19pMlkhrROqS56YA+eR6hwWSR/4YldgpD9Nd3CaTXRwcKHoLNMEWUknQxXa9CHc21bPW7VEI3F6mBcrQgCCbINI67xGltTg0AduoPTUphNhiAkHK8cHMDVEpD0OkKqzi1VO0kMdouR6nHVjXmX7Y80ZmDbhELG/JpJBy6ktDsR5ZNQ3ZUKVjHRpHFMhwWn/ce0bjh+ckjstFyzm2H8diDWovQEVYbxdDdSJAbFDIerOac2I8zr6qb/Y4Q2n7i7ebZrOosplSXS06sM9aQO01ExP3wV8L+XBNJrvi0oa3vdBVss//fPiJ5uA9YQEYROWGinIoOr450EXiHfe+LPZ2M7/yspLLwAFUj4cG4w9MtIvL8D7042Euqgd7swdVoo3tqi5Mw3E3sv8rJCdiwEfBUOS/OUDdQhXr71eWREmBC+svXqrez1V5vC+Kwi+d8goTJc6XO8IRgnBToXmUeLUBEZao+1NKs72kHUpBNahyLe2B3SrP/qLiK0TzFgzLgCB9tQ8nBElUUu0jk/DWPli2m7g22zlLGvOga1TDkD7ioSFdm+iW6DCa/h3Sn/7FTIXmQuFb1goty8VcRRVr8636WutRBo2GKs4Re+CVM93
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(66476007)(66556008)(66946007)(31696002)(508600001)(26005)(186003)(2616005)(31686004)(36756003)(316002)(2906002)(6512007)(83380400001)(44832011)(5660300002)(8676002)(86362001)(82960400001)(6666004)(4326008)(53546011)(7416002)(8936002)(38100700002)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmdmeTdoUlNLZHllc2tZK3pERWQrYVl4Qm0zNTA0UktMTzZTUkNjRTFhUmpF?=
 =?utf-8?B?cXNoM1Q4aGlPTDFzMTFMa2M1WnMvTWNFcjVhdXZtb1JXTWprQS9aZmtrTUYx?=
 =?utf-8?B?RVZmZnR2VDM1OG12ODdyWjhraUNETFIxNi8ycEZBSVIyVWNxWW5XdG83U256?=
 =?utf-8?B?SmlzYjhuczJLbEluYkRubmc2eUtyWU1zVUI1d04wZ0VJd0thSWl3dzIrc3NJ?=
 =?utf-8?B?MmNJRGh4UmpsSXVFSVFsd1RYd2psNXVyNXNVSllNNkhBUFZoL0Vqcmp6Nnl4?=
 =?utf-8?B?dzN1SmVPR09rZktsbkpJSGptUnJHRE9TM1lyYVdpaGJ6Vm9CVkRZcm1VU3d5?=
 =?utf-8?B?MExySWJ3ZWJ1MmNMM1JHZUdMMGsyN1haUHhqRVNPY3paWlJ5VjdsZHZvNFZx?=
 =?utf-8?B?MEJxM0NIZk1Wekh4TnRQNEpmZ0pWR1NSbUVaS2hFZTNmeTM1eDFSNEprbFhU?=
 =?utf-8?B?OXQxbkZ6U0tqeG1pM2xiS1lVaG1CVVhycjFnMjB4QnZITC9kbGQ3clFtR1VU?=
 =?utf-8?B?VXVjcWNtL2hEOVZpNFFwZThRWGtqcUpYREpBTUIvaGhtRGpLV1FIOEhEaURy?=
 =?utf-8?B?QjdIbjkxeE1VRWFWYkdGdVpVWFdEOW5Nb21IczhjOTZKeGZ1a0U1dXo5QTFN?=
 =?utf-8?B?aEN5dUUzZkNRMWpodzVxdkc4am5sTW1zZlNCRVdpRGUxYU5icU1CMm1vZWVG?=
 =?utf-8?B?dGhuQ2ovMU1qbWdocEM4K0N2eXRqUUdFaDQ2Y01yUEJmSXFIc25xZXAyUkVK?=
 =?utf-8?B?UjdLU1RNMlF0d2JPOHk3dnNOUjJwNHFRTXBQS3FPVUQ5SEx3T3Y5VTN4eWpY?=
 =?utf-8?B?OWNyVW1CNE1EWDEzNXlENUx1YXFFdENlbGFPdE1rVDd6c3gxZTFTTDR2ck40?=
 =?utf-8?B?d0VHQlJObFgrSUhxODRXV0JuTEtTYlQ1ei9wZVBJMnIxVjBxNmIxRGFaRGNP?=
 =?utf-8?B?NEUwSVovY21YZ3ZMamFHdGRSalNjUnRoZHRXaU9jWFNmWjJvNzhCamxFdWk3?=
 =?utf-8?B?SFY4RzE0d2xHNzV2bEVnSmZpU2d0R1hkVDhKYTdNdm14eENuMXVJcngzVHJ3?=
 =?utf-8?B?YUJBZE1GUTBkNW1RUzFma1MzVStnd3pzUlptbW85SXRtbDk5VDRtTUI2bmJn?=
 =?utf-8?B?c1BuMUJlYVd0cjdGalhiNEx5blh1clZZdzlDcGUxZWtMTFVtRDVsVTRRTHFM?=
 =?utf-8?B?OEwxM0p1bmdubXBrNnNJRFFSZ1pCbkdxUWV2bktGb2QzeTk0NU5BRHFiT3F4?=
 =?utf-8?B?dkpLek5kdmZpUmRsYWhSU2k1VVc0dFRKWjFKdDl0eUwrZUozWHdZTzNUYndt?=
 =?utf-8?B?MUVvTmFDMlJEVGtZYkdvRC94QjRQQlA1ZmRQcDRyZiswYnNDQkdBSHhrUW0x?=
 =?utf-8?B?TktSd0ZaTTN4YVdJOUhkVkx1QXpzVk1odnpUakdoTUVuUmJ1OGtBVmlEdDIx?=
 =?utf-8?B?NHNwWTlXc2hOTUp0aUxNeUhkNUZMVmY0ZUxtQTlZb2N4S2lYalVBd3dTZXQx?=
 =?utf-8?B?VXJuYmFMa0VWblZuZHpGbmZwSkZVTXNaRGkvSVJ5a1ZYSVRNc2g0QmlpVUxt?=
 =?utf-8?B?S2FWMmtmL0haZHdjejhHSHg2ekN5SThUVm0zMElDZkYxZ2t0Y2JGa01wYk1X?=
 =?utf-8?B?WUVJRTZLZVpmMTd3RFVHYVI5dmw0c1dPZ1U1VU43Mi9uc2UyK3R6dHZqaGxF?=
 =?utf-8?B?em5URHg3M0xLRUNkWGtoSTFnVW1nV0lROFFSS2JxNGJhWUY5UGRMMHRzTDlY?=
 =?utf-8?B?Q0lMeEZQalpwU0hzdUFRbEU3WENyNzlwR082V21Nd2huQTE5NnkxYmUwWU8x?=
 =?utf-8?B?eHgxOUxBdGRTT1JkelJBMXRxV3JySmNnbjF4d0czOC9MWUZLUGRCYWwxWjZa?=
 =?utf-8?B?UnA1aTVKaVRKdTdaV2YwVW93Yi9TbFJlaXVWdkRLYzR0YmV4NEQ3VWFldW9U?=
 =?utf-8?B?TjJNTld3OFJoNmpLZDRxUzFRSFdhcEo1RTBBdkRETThTcTl3MCtzQ25ta0Vt?=
 =?utf-8?B?dzBZSVB2WkVnRHozdFh5NUpMbXhqYnMyZnE3V2ZmYTVFT2tHQ0VjWGtGWnNO?=
 =?utf-8?B?S0lZMUVKbWgzTFptY3JLUXU0ajVQMDY2VGFVS05CVXgyUlA0WU53d2YwVDZv?=
 =?utf-8?B?OVQyOTc2Q2lCeDhSQ0hGZy9WaTBnTEJxZTRoU2lRbjBEV1hqRzdCb1FHQ2R2?=
 =?utf-8?B?ZytpMklDQjUwOUxLc0MrY0ZjWE51Yms0eXBwSWVqMUFxeER6OG1LSlpWOHV2?=
 =?utf-8?Q?0wSGF1z1OrIDwRWJz9x62KsDeg/hvdbOPUKYAOfcV0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4d7a26-aff7-48c4-43d4-08d9fe04b33e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 17:30:39.2818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8W72NfjB+KSW08XeWkD0HEyRRZPEUC+dGPq1sjszuDNHgGq5t+6yiIxUt8omTg7MYQ91Wbj8+b1Cd4RSUVFTZF4IDvPmse+Aj7eOIY5vSUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5759
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
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

On 2022-03-04 5:24 PM, Ranjani Sridharan wrote:
> On Fri, 2022-03-04 at 15:57 +0100, Cezary Rojewski wrote:

...

>> +int avs_ipc_set_dx(struct avs_dev *adev, u32 core_mask, bool
>> powerup)
> a description for this function would be helpful.


Both relevant fields have comments as requested by Pierre.

We put quite an effort - which was triggered thanks to the feedback 
received - to have plain, simple delegates in form of: set necessary 
bits and let firmware to its job. I believe SET_DX is a good example of 
such.

>> +{
>> +	union avs_module_msg msg = AVS_MODULE_REQUEST(SET_DX);
>> +	struct avs_ipc_msg request;
>> +	struct avs_dxstate_info dx;
>> +	int ret;
>> +
>> +	dx.core_mask = core_mask;
>> +	dx.dx_mask = powerup ? core_mask : 0;
>> +	request.header = msg.val;
>> +	request.data = &dx;
>> +	request.size = sizeof(dx);
>> +
>> +	ret = avs_dsp_send_msg(adev, &request, NULL);
>> +	if (ret)
>> +		avs_ipc_err(adev, &request, "set dx", ret);
>> +
>> +	return ret;
>> +}
>> +
>> +/*
>> + * avs_ipc_set_d0ix - Set power gating policy (entering D0IX
>> substates)
>> + *
>> + * @enable_pg: Whether to enable or disable power gating
>> + * @streaming: Whether a stream is running when transitioning
>> + */
> What do you mean why "whether a stream is running" does it mean any
> stream? What is the difference between a D0ix transition with a stream
> running compared to not running?


Precisely, any stream. The transition details are found within the 
firmware. Host (the driver) is responsible for scheduling and requesting 
the transition. Nothing more, nothing less.


Regards,
Czarek
