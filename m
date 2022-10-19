Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B97604DE2
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 18:55:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D98C7AF22;
	Wed, 19 Oct 2022 18:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D98C7AF22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666198550;
	bh=kcQuoT92NanYjbR2DiNvxMHaw1Fn6DLaIo3VrjBL7b0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oqR1YHzJF0v5Pc13qrQc5IeFEFhx4Ka8nUDZw3Bfuwq7xAQoFAqDKXlroS0rG20UI
	 KiU/JMj4GqR/84aL6oSISzqV9qOl4oc0si56JkShPm+OyV+znoVOeWWoiWVhc5Cbhv
	 0FKkCtBg7Qg167cNQhzm/7BUzABYZxW26/g/cBuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C7E3F80528;
	Wed, 19 Oct 2022 18:55:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A46E7F80517; Wed, 19 Oct 2022 18:54:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F7FBF80087
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 18:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F7FBF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WT9wTAIn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666198493; x=1697734493;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kcQuoT92NanYjbR2DiNvxMHaw1Fn6DLaIo3VrjBL7b0=;
 b=WT9wTAInV52qCKs97wlLB9fyLo9w51UUh31O6gFBEWwyJb9hESBNiSDs
 IFys0bZ9vGN7qU77tmjVBVuw6M3Njy4CUJpR9Ea+bO77Ic/iIWCeF5efp
 Oyj6ygjc5UoU0hAw/lQD4hC17cjNAbQ7KMYovq/uj+ERvPDnAYU2jXyWO
 gFkFICF4qzMLc3+rMlMxTlqsEkWU511dqgeVbax7h8G9ISu4zvIfoND7z
 BTXszrK1Q537h4beYT22PEqkEvaTFpUmRssYoJ++xZ+k8EdIRQOPAKlhh
 wEqwDeIAkLwG96WLbqOr+esN9UdSvpzKebe1ZukJglzzJ0aeGScrg0HXu Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="289786478"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="289786478"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:54:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="734313458"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="734313458"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 19 Oct 2022 09:54:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 09:54:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 09:54:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 19 Oct 2022 09:54:47 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 19 Oct 2022 09:54:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4sKEXfyDg5a6r8Bu2rZlD2AWdkPdny+R7Egv9YNxSjt82SnxcV0en8KUh2nTvvv1WViqPTYNiMkQnUdwAZK5OM9KNLo/8kC1mq5Jff/DxayXOtzKnjhbWQ7N/OkwfF0RaMffG8jnwVc36mi5Hg30MBQWKz+VeyliNkCqGxyVWBDjQ9I3V1b691k5IRiYqNMn8YQisuZZiBykrU2iYozCm8ZuyLYvIULG++hnyEgD3JO4IrANF33+kNH5vYbt671wo0cZkf76MO0bEAPz2dgushny2oYDZ7iqW9NJWiQuE7DLXy5MZlBwfUr5tcQa3ThY8Ieh12N6+V2Gh7WNApBQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsMFPPtPwJA+9MZBUYIYICAzyR41mQKe6uFzinOKGSY=;
 b=de5nvzzUkDIbwoJj0N0ZwWpDR8LQLnbSS32c8yqvf48C/ol2f52v602aMhZltbpIFQdWKE/WaD7Tk/jvk+T6AVeflu/mpZQgwGQJQmwXHWl+jK7+jxAK0ZDx3hZLawxYTxz3fTbCtsalb9EfW4ckDQtoSuPZa/9LKOM6HRp3bvMrYN/rRGui+aDDhKvbWP4nlfq8VsCdYj55QEGFW39+R5GCWxjM4ccY3lRw7KYf9U/UOYz040BLSsPPt78k0C/1qDiQlfV2wpG6K6E/PbY7C6FIgwE0gewWCqYScMPV6inBP9iVceTTByp2uYzgVPkYg+vdCsD+1yZ2yPI+ut2JWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SN7PR11MB7020.namprd11.prod.outlook.com (2603:10b6:806:2af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 16:54:42 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087%7]) with mapi id 15.20.5723.032; Wed, 19 Oct 2022
 16:54:42 +0000
Message-ID: <adee3ba1-000a-41c4-80be-6c3107128936@intel.com>
Date: Wed, 19 Oct 2022 18:54:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
Subject: Re: [PATCH 02/10] ALSA: hda: ext: hda_ext_controller: use hlink
 variable/parameter
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
 <20221019162115.185917-3-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20221019162115.185917-3-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0161.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::8) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SN7PR11MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: 38db614e-5ce4-4483-82db-08dab1f29e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ahPDwxN+GdMwQtukwjwaw9ufbbntH3zI3dgDhZpxVPFQACUBTbL/kH00ssFH2Yc4D/B+bKEoh/1Wf7LRiz47srRPwhZ36AL0cYNP7SWISF/8Xz7xeWaSGqC9biDP+Bh+OjU9A6QWCQsT7ntBLnwY0ATLBrHbaJdArYXWHPl8ml5KOaWW+GeiDp2RQ7fEUgIwfCjvc1ZufpgN/jRcIOrN+QVLfaw8YU37b1lSZ8kmJwyVLCegpITR1/JNrOi2BENNACRim17CrMUTM7RA6KzIOfLOBc21d4/kXDn2u/Hl9+gqQ48PlAFwQcvFZ3K86VgponN6JjDnD4GhbGqf5b+s+y2y1Mkn6FEL/wakIbhVawj4bB2yNJ8PaqJoiy95lAkuUFktB8Lo3V9kkZlPNBokIzXT9mxDOlMnRgDPwaskTIA5tVg5TZoH7Y1NN9j6oJQCvRCDdtKVkVFSl//yD2jwfXLPSIw9NtQvjBS9ofUSeAZDvR9ehDRpMOWCK8hoUz/pDN0Nls1tvHEWJ+c796dXsIZtOLnjBrYGvmWfrLwGEkeII2CdTXP7+9dgJxXBjyPygcWC3cZdW6HD6XuH8sPNSBpTWRMxNfFV8t2mBt9v4aucauJJSvf+YdHyPMskn7ObsxqAXyFOTPcPBZyw1IBoKnklgWlO0aGfbhP8a/s25rcviUwcWLEMuHot/AKCpcedVUflvOy8CSn/CPFYMHL2vp+JpC5anFiLXcncWRkF9DeEXPwA5kdlugI59C9yNFwnFdd1DI3PnxrVYYUNs0mPDmZZfTeGAEx/4ZiYjmz7O4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199015)(36756003)(82960400001)(86362001)(31696002)(38100700002)(6666004)(66946007)(316002)(31686004)(6486002)(54906003)(5660300002)(44832011)(4744005)(66556008)(8936002)(66476007)(186003)(2906002)(4001150100001)(6506007)(2616005)(53546011)(478600001)(6512007)(26005)(41300700001)(8676002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjQ4ZmNoSW5vb0hJalVmQkpxQ3Q3OHpUMC9WcGNNMzZiNEEzOTF0dGlNcWRS?=
 =?utf-8?B?T0NLSlpFRlFGc2hDM3pjTmpMc1NDUGZsY3FCNjg0MU4rRCtmKzduazVRVk1J?=
 =?utf-8?B?NEdWemdGSVNqbFQ3amJENFZVY3MzL01yK2xFVzhya1hvVGVnQkl3SnArbVBY?=
 =?utf-8?B?NlYvMitwLzkvdDVFeDhTVnZlMUxLZVdPNGlJVmVGVmRXRkRJZjNEVW8wUFlC?=
 =?utf-8?B?VDhERVY2aGNBRWZpTlRrL1BaTzhiaHlwaVh1b2FiQnZhb20vN1BDWnlTZjJC?=
 =?utf-8?B?VnhiZ0FFYTRJRU1hemF1ZlQzZmZ4QldrYU5PZDhxUyt0K1dVaFZOVXkrbVBz?=
 =?utf-8?B?eHIzRDhDNTdqUWxHU3MvcVNaY1pFTUROdlFrQXdJOWowWmtJZjI5Qm5oN0ht?=
 =?utf-8?B?ajkrV1VYY0ZiKzk3bjd6ZkE4eFA4Mk5FR2M4THFpa2VVaDV0a1dWSHZJQnl2?=
 =?utf-8?B?YTNIL1loQTBEZm5wRXVYMUh6NXh5Sngycng0Nm5RUEd5TEVUM3gyR21PeXMz?=
 =?utf-8?B?UjFiTjlpejdhNEViMFdjUUFETzdBRmVIdVprZHVibkFGbEw5QzBiRHdCbFVw?=
 =?utf-8?B?QUg4QzM1S2d1WnBKaFFvWk81bjRNc0NPNEZDYWxBZ3kvajdVeTRmQjJCZUQ5?=
 =?utf-8?B?elh1T0dtK3E0dFN3YmtmZ0ZaZUFKNTNVbEQ5T1ovS1Z4WTlPb3Y1L2RNZlIx?=
 =?utf-8?B?V2trY001UWlUbGNIZFBxRTZHZnBqNE13SzlvL2szK2RMemhpN3pobkdaNFY5?=
 =?utf-8?B?QjR0Q09rN1g3TXlxTjdxckpleHBBayt5RjBBMG9NM3Z3VlVKLzE3R3FKZ3Rn?=
 =?utf-8?B?V2tyamE2QzVVL2NoVXFkaVFlYWkrdWZsdUErM1hpK3NrNzd0WUpBUWd1bkVr?=
 =?utf-8?B?aTRvaFZSa0tDQWQ1WHZxQUhXeWRPQjluMWtWV3lMREIyU0diNTRzalhqQ01O?=
 =?utf-8?B?WGNUbTRvMm95VzU5M2FwSVBOK2sxd0x0ODdFdjk2WjR0aHhHNmphZ1p3STBa?=
 =?utf-8?B?aHRCOW9mS0doWXVadTlod01VTFpUQ2hROC8xMVlob0Q1aStkcnA2ZVQ3WWVP?=
 =?utf-8?B?dWYrYTBxQmVub1RwbkJhT0J6eEZjQ0JCZXlVVHE5VnFESktpZURWcFNnWjNy?=
 =?utf-8?B?Ym5MMGFNU1lYeWN0MHU5ZUo1Q0RrUHdIeTJlRWpWY3NIUVI0bWQxYlNlQXg1?=
 =?utf-8?B?L1p6bTVYQTEyWURMc2Era1IxMzZRY1VlQWJvK2FMTXhRN0dPR0tubUZFT1Uv?=
 =?utf-8?B?NVhSUVlrNm9nZ1g2dmtCclJ5ZjVMU2c0NHhkQ1poR2IwWlNEM2h1UUJSWkp3?=
 =?utf-8?B?ZEtQRnlEZ01vakZVaDhMVitJQitCbVQySnBCQUFHaVpXaUpMbGRLTkZJS1Rw?=
 =?utf-8?B?ZEFmdDJ5SFpxNmdrZVBPYkVnbHBnb0Y3QlV2N2JBS0ZNQUJkc3Nvc3BTZlMr?=
 =?utf-8?B?dXVWT1ZHZWRsejBXakR0NUNtb1RpWWhBREY2UjdJNTMvQ0oyTE9UQmVmWHFl?=
 =?utf-8?B?dWFObWpwVTh1UzBrVmsrYno0VXlIcnBMZU04TmZ6eUtWYndvdVAxU2tweity?=
 =?utf-8?B?UlVFUEVMTnBqZXV6bFRqbVRGcWMrV0NyOXVoNHlLN3NJaGNCVzJOMEpqUjBL?=
 =?utf-8?B?YjdtbTZ4ejJOSm1MOGlNQWp0UmRZK2Q0dkxCWlB6TEhtSWk5V2pQc0NMSjF5?=
 =?utf-8?B?cTJCRkN1NFZHSkFVa2V6cExyNlU1QWJwejgycFBrTkt1Q2c1bWVSWGcrL2RD?=
 =?utf-8?B?RWtOM0crdGp3NitNNlpiSURPdkFSTTdmRktsQ1pUcU5pNmVQVVRtWW44K2ZO?=
 =?utf-8?B?dGVvNXZiaitVSGNobXp4aURnZE1yQmtwaEI5SndkbzhKU1V2aUxMQ1VTMWp6?=
 =?utf-8?B?cXRnU09ZWnRDenVTQjN4SFRqb3d5OU0wSVRiN2V0a2NUcmRyZUl0UHZrcEpS?=
 =?utf-8?B?RmNLTnFIdUhHc04wNEdFY1ZsS0NEeDFXQUp0ZmwyQ1NkR29rbGp2c1Q3WWk3?=
 =?utf-8?B?ZEdnOXA5MklkWXFCaCtCY2VudTEyK1Voazk4bCtkcnJhK2pqcFptRkxZR0NS?=
 =?utf-8?B?NkdkSGkvTnA1Q0tYbTNWdEU4VEV0a2kvL3NFYVh2OFRJamxySzloeWVkTXBJ?=
 =?utf-8?B?Zm5GWVpmTjFaUDFoSkFpSmpESnFFeWZDRzAvNVN4Sll6SzdFTzh2QVpsZlFT?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38db614e-5ce4-4483-82db-08dab1f29e1f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 16:54:42.2082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khCPXXUyJdaKPfg/hXWLFSc6LI9HtHRYxHrANdIxDRksrGAqAZ/FtDhXZdhB2CYWMutqsaJJGms/7nA+yx0v45LxwCpafk+TZkzFSlZWJG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7020
X-OriginatorOrg: intel.com
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
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

On 2022-10-19 6:21 PM, Pierre-Louis Bossart wrote:
> Follow the convention and use hlink for consistency.
> No functionality change.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>

LGTM

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
