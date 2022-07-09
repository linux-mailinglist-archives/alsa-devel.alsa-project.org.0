Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0D056C82F
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Jul 2022 10:52:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 082F21E9;
	Sat,  9 Jul 2022 10:51:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 082F21E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657356762;
	bh=WGl2GV7DqeN7d/eGMOAUMIfD2bW6aGyMkPG9oP0zbf0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BBNOdqKdkWDXAKZMWlhOfoHUvAZHkOlZx0na8+39pJ7rN8liURGDuTVmhClrtyrH/
	 d1PvnGElxkmHvRjd7FrJ9dLpHs917Cnt8vWKfNTrGWLR1HIjyVIs5ZhRTB7eHMNk18
	 mx4+3cj0nAiQMEBe/usl+rO09EjXBt72X5kGjJe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 751CAF8027B;
	Sat,  9 Jul 2022 10:51:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D06FF80245; Sat,  9 Jul 2022 10:51:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 851EBF80166
 for <alsa-devel@alsa-project.org>; Sat,  9 Jul 2022 10:51:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 851EBF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ec9AzXNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657356698; x=1688892698;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WGl2GV7DqeN7d/eGMOAUMIfD2bW6aGyMkPG9oP0zbf0=;
 b=ec9AzXNxnubYcX37pWZRIM7j0LFzCd+idy4AfVWGo6yVvDgbKNv4oUgB
 TL5Tc47nfsp2JKyF/aKKCr/gRokpmV6CXEHbYOTtNENBLstEkqiptZZW6
 CcLs3ZfCAA/PKAcLPjDU+fEq6UTitmiKHJxGndvP1hlOIb8CE4X5y/oku
 G2s1lrf2vZc9R+pbWL7PlfYktlIHdBAOETvlhI33PHNxaTsY0MkzNf/A7
 lVVZC4TeG6QEXFl4rviglwwrnxeEaDyMCii8FtH2t7dT5C1412y+Lg2fk
 cY6RbtC4PQH2V777/UdiFUZRy5hsbPyEsl6lso4SP9rC341K/7T0IT05I g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10402"; a="370729979"
X-IronPort-AV: E=Sophos;i="5.92,258,1650956400"; d="scan'208";a="370729979"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2022 01:51:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,258,1650956400"; d="scan'208";a="840527559"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga006.fm.intel.com with ESMTP; 09 Jul 2022 01:51:34 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sat, 9 Jul 2022 01:51:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Sat, 9 Jul 2022 01:51:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Sat, 9 Jul 2022 01:51:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYv8yP3Yy/H6E/lCUvdu0Zc8fZk2jyac9RLT0JDSNhQWycBBR32RSyZ/JGPyp8EbFwiwRAKtmgtZ/R+pi8AmVR5BT1JCAiGJG7OCO3aYtVffRYShUwGukdEchz1XDPBWLN2dEHi3ZgldDgoVErgtl7ZSKqrzhqnWtzulLayjWly/VR0SfX+peIvxe4pIxSKPw7W4h2KeNnJPgjv4wia8VwONkBfHGBj3ugNp+M8eIqQvK4uhPQ/4NIBsHm8911+E9yTDFxJb1KBeN37/LnMPJKXfoc/JRTP/w/jA9w+bmRhsJHZYoj5Q5Kl6fRWbZtNtqaWkqAJ6ZyqwViYSfi4r9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOlZ/nKb/H4iq5Gbbzyl7DPqJlGv7zsWKVX6WrbsL6E=;
 b=ifv5VpS6h/1UIQgJfkA/Hncm8uHFSC0Zk3Goser3bdVM+/ZoJk4v07YX9XYvP0QH28jN8Otn4vKIxmU2jEgECEcfi/ItGnbug4nirjf0syIX09aGHhq0tHDr3V8f6MFUzz0rvLVtWnEu7CSUPxGpCr7A0/PoBuc0XQ/MatWhWRsZ45/WAauw+u72pD9dIBU47A+hVBgQVVXJxPFBNbU/qKHh/W+XHrtCEn3UQoXuYVoZTADtqxDjoA1umYh7tKbdiTtRYrqxgUMsoZ5IhkqNnuXVXeeFC866F6mTFeEBosrH9lWrzGIqnnL53U2353/oiN8xfEhuwzyHTxJhYAQv6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.21; Sat, 9 Jul 2022 08:51:26 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8b5:ae20:1c12:421b%7]) with mapi id 15.20.5417.020; Sat, 9 Jul 2022
 08:51:26 +0000
Message-ID: <925a59e0-41d6-07d1-b9f5-8d8afbcedca0@intel.com>
Date: Sat, 9 Jul 2022 10:51:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 0/4] ASoC: Intel: Mark BE DAIs as nonatomic for hsw and
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
References: <20220624134317.3656128-1-cezary.rojewski@intel.com>
 <ac2b7d8b-a5be-4fac-169c-eaca185c9746@linux.intel.com>
 <3d9b45c0-b415-21d9-6af5-68fa1001ed17@intel.com>
 <34b54e4e-8997-c2b7-fdf0-24a1b95121ab@linux.intel.com>
 <YshQ8N8Rx7Hizk8B@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <YshQ8N8Rx7Hizk8B@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::18) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7281d9ac-deb0-4f0d-680a-08da6188355f
X-MS-TrafficTypeDiagnostic: CO1PR11MB4820:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cKT8MxWASi1+8CYWiw41rYyXQqyPAwM5YxrLl1HwUVL2ppIvQjCXc2LnTvyJJLojNsrl1J/EF0ZLmC2dYBiWtKTUeySrppddNPk/HL60kWus+yePBpTbsxiVsrsqF2C3YWYU1gkrottWqcx9l6op2udu/1H4diwq2RofUKeu8zIzSpIcqf4guqUgOEL8x8XqI8LkbDtqv09+u27EVWlyjzaVAE0bnm2cqrd85XLmd0t7sEU080S1oQzfpWqWL5K6m/DIkMTfKkKKdbcQve2dreQGJ9uu+cvvER9e6Er0yMD9jNj430ID83kxWIrbVhM5Ru5sx48qV+Pyr7+Jy2uRTYf5/QPbraez4F+QhfW0wPlyR25fuo/ssLoifwl4x7skPlD55mlEINu6cluJdFoau3kZ3S8zkXBOmW8Ea11qNEpiIdZZovriG4p8gt1NzsgwuSrT+4nO16TkCW4EFdUOg8trU+gGgCsIkJcp5RXDULnwy/qjU29F1ldFHYaBITcFwipPS27D7+wih3SZRus9ZUCmrx9BnzayWV6O/nPLSB9yCI3oNqHjBGwQUnZdpz+JzVCQwKj0QHmTwDlQwIAT7sLQBC6bIBeWUa1kSYXb+7tKltGfMArVs82F0R/BWe123yxSs2i6nH3YDGCTH2I0o3nfnK7mAyoMPHvAgafOW7usxC/Z3JEiOGvhw04NdRzNiElb+XV8sbtWBhqcZbqiMI0eiTOg3cQoU/easJ+Lb8Qdmmg54rVa+2eHVTvEeACDlYnz51wLlRhA6GQVa3ts6zgI6GSbE68dz1PFnNLXC6sKCY/aYz3P82P5zblIFr1FjNYJmvYCvtpECUwg20CuyRP5oWLxYqxli6nyPOTCgzqlXXPY0nKNXMXIsyX7rvHU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(346002)(366004)(136003)(376002)(6666004)(82960400001)(31686004)(41300700001)(5660300002)(8936002)(53546011)(36756003)(6506007)(26005)(2906002)(6512007)(4744005)(44832011)(38100700002)(478600001)(110136005)(966005)(6486002)(2616005)(186003)(316002)(31696002)(83380400001)(86362001)(66556008)(66476007)(8676002)(4326008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFdDMW5leHhZN3g4cnFDZUlpNHQrY293WjRlbTBia0U5enBySFluZFVqaE4w?=
 =?utf-8?B?MmJKaU13MUkyLzdsOUJQVGNUWmt1QTIwNzZjcmd4NFZqVGhRMjBxOUtjYUZK?=
 =?utf-8?B?ZzRtYlNpMHhHdnlRY1FtS0FQeWs0ZmhsQWNta25wNFlrelpEQ2NVTE1PcHd3?=
 =?utf-8?B?UVlNM0tBWUxwTjJjdDM0ZHNvWHpIYmQzazcvWWRrbEg2a2NkamRzR1Ewc0hD?=
 =?utf-8?B?ZWM3b0V1NzROZ0k5ZmIvY2NlTmkxZitmWXNldmdjd2wzb291dHdtZzJROThx?=
 =?utf-8?B?Z1Fma012dW9Pb0xMYzZ1UC9uTjMvc0lUcGI3bVBtSU04WThyRXRaTld0OVAv?=
 =?utf-8?B?RG5FMU5wamxDY0ZGSlBjdGpsK3h3YU1sWlRuYTlRZUtsNWNEcUVWY0NuMkYz?=
 =?utf-8?B?cVM2MDEycUpKMndXdXcrbkVTa2t6UXBLRWxOR1VnMjNZT0laUzE1cG52YlhX?=
 =?utf-8?B?RHhnV2VEdWVwKy9qRXRmQUp2UVB4WXFXMzhLTGVsTjRnR0RIamcySlNERkVk?=
 =?utf-8?B?Y2Y4SnBBeEJ2eGtEMzZIbmRvMjJYcDBLd2s4RkpBMW55VlBWMDNhamY1ZU54?=
 =?utf-8?B?cUZqcndiWDg3ZlZuN1RWSlNmUXhjR1pvMGJoSzNJL1grZ1JhdFVLQkttOTVK?=
 =?utf-8?B?a3F5c3VEVFIrTmV2cVdUZFF1OWloUGNCZ2NTVFRxbVM1bDlYclhWLzFnRjVG?=
 =?utf-8?B?M3FBczBsRlJJRHRmRXU0VjAzdEE0V29iR2x4T29UNldWaFJ1S2hMcHRVU0Vn?=
 =?utf-8?B?OTM2bzVvOGdid0s0NTB4VEFkdFJrSGRWZUxOcGVQNURMSGY5VzdVRXJTN3dz?=
 =?utf-8?B?QjYyekxrd0xVc01wRzFWOWNEd1B6cHovR3pSMkw4YjFkVnJVOEs2UzEwZUFw?=
 =?utf-8?B?SlZkdlZUUDhsNWJZdGhXaXRlZER5MWVlUkFZS1ZobWFVQzZSTXkxVEprdVBN?=
 =?utf-8?B?LzJtWGJqeHZPekcrODRMQTBQWlNxVmhtTzhDNHNGbC84c3gybDRpRVEvdGdL?=
 =?utf-8?B?TURmWWJwWVlQOWNlR2lYY2hDSzFaWEdwOHA4Snk3MHVpQmlGYjd4VTBpNmI5?=
 =?utf-8?B?bzNZMlQyRWt0bTNzT1JPaW9QTlNxQTUvV0ZjNllUM21rL25icEE3djFQRXdF?=
 =?utf-8?B?UkNlbDY5dEJ0MGpnZmRpcHB5bFBveTNncU9vUUFpWllRMUllQmdPUWlkQ0NE?=
 =?utf-8?B?ZTFDZklZRUFFdUR1T1Y5RjZMQXpLTVArdGtBQjM5WFIwTEt2cmRpWGZsYWl4?=
 =?utf-8?B?WmtXejMxVG5TSzNlZ3p3UUVhdkxzVU13cVN3TGR4Q00rUzBZRDNJUEcra2ZG?=
 =?utf-8?B?OHhkUGZ4MTl4ajV1MFpoZVdJb0VpVkdqdldicFJ3dmtqL0RMa1FOYlFVdXhu?=
 =?utf-8?B?M2FkZ0tvWFpHUUVxWG9pWjdZaE5KSk43aGc2bEhZZytMTWFkY1cranlXU2pu?=
 =?utf-8?B?RkZJeXJua2dGZ1FpRWkrL2JpN255Ym9wcjRrZU1qTldtU3MrMWUvcWZwMDg1?=
 =?utf-8?B?WjBrUzJHKy81SkVDd3hPamZGSW1EcGVNMXpWdGZFNkQ5a2ExalFnQ0ltem9I?=
 =?utf-8?B?ekt6S0t4TjZTdHJNSkR2TlovRHpiZHZqYjJFMGcxQkdPTHN5WHFwK2JRYm96?=
 =?utf-8?B?T2JJcDBTWVk0WkRDQnZJdmRtWmxJOUlTbHBVVjFlSkdMOHhvdWlQeGYzVnZq?=
 =?utf-8?B?VlQ0TXZiRnF2cFVWWDFzUEdGYUt4Z25HZW5acEhOYVVrUHdqUXdmSWxBNk5T?=
 =?utf-8?B?NFU4L1hmVllEN1FFdTgxYkttMmhFL2VuVFk0bHZxc2F4ZnVGelk4SFRPOURQ?=
 =?utf-8?B?TGxodTJ6RWNhTXZ5WnNUQXQrOGUzZEJuZ0laZGV0bmJBeGVERll4a3p4ZEJx?=
 =?utf-8?B?dlN6dmFsZzdJTlE1TXBvTndjcXdNM243KzgzNzQxQVQvRUU1ZWlsOFh2aTBO?=
 =?utf-8?B?UWQxV2hhZkwxczlHZjJrQXA4dEFKTnBiMDc1QlM5Yk5hdVp0VXVoT21MSzFW?=
 =?utf-8?B?dEFic3E1QTBTNkEwSFUzZDRWNEtRQklIM3BtNWlGTktvTnFFZEM0Uk0rTG1u?=
 =?utf-8?B?ZU5xd0JIZjhWNjA4SGNRRllJZjYwQ2h1dkJQVUlQWGVSQ3BJZFZYTkFRc2tt?=
 =?utf-8?B?bzhqc3lwZVZ0bm5tVzN5K2Z4QS90Vi9kZWJaTytBQmtDVC9BdWVHcFAvWE5X?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7281d9ac-deb0-4f0d-680a-08da6188355f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2022 08:51:26.6956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P+GR9abIaexU4HJnBehCwOk6qI1YAF1JCLLdmTr9LY+YZ/DEF0g10hrSVHngmaVe4S++u1Hw8qDkbALOcPuZJ81SPG0jbpBJJ1I01gAMObE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4820
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 amadeuszx.slawinski@linux.intel.com
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

On 2022-07-08 5:44 PM, Mark Brown wrote:
> On Mon, Jun 27, 2022 at 09:45:30AM -0500, Pierre-Louis Bossart wrote:
>> On 6/25/22 03:29, Cezary Rojewski wrote:
> 
>>> Warning is one thing, but will you be also getting rid of the
>>> if-statement in soc-pcm.c that actually forces nonatomic=1 on BE when FE
>>> is already declared as such? If the if-statement stays, I believe the
>>> declaring BE DAIs 'correctly' in the way to go.
> 
>> I meant just removing the dev_warn() only.
> 
>> See https://github.com/thesofproject/linux/pull/3723
> 
> Is something going to be upstreamed here?  I don't really mind which
> solution is adopted here but right now Cezary's patches are the ones
> that were posted upstream.

My 2 cents:

Both series can co-exist. We should still encourage people to configure 
their DAIs properly so the if-statements like the one forcing 
->nonatomic=1 in time are gone.
