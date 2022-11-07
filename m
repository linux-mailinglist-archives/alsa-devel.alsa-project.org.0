Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F38A461EF6D
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 10:45:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7929382B;
	Mon,  7 Nov 2022 10:44:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7929382B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667814337;
	bh=FcuOwZlqoXhJ7TwUiGUi5KG1F1I9HI1UhVLYQvRfXFY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qI3nElugpuu9nI24iLS4DPjHgPXshJynw3mwvymKT8KuycSWQk3GftJCt8ur1WI9m
	 MiOG/gY+4z2t+zyytG72Wu1GREicQa66qCZylmEcdM05tgM6QSnHpT4tM6fOn0VKu6
	 P49/sECuWlL4QlSEIqPQhp1Q3+8hXsjY3vsFO9DM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0896CF804BD;
	Mon,  7 Nov 2022 10:44:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EC3DF8025A; Mon,  7 Nov 2022 10:44:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 750D1F800EC
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 10:44:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 750D1F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GzlgChR/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667814276; x=1699350276;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FcuOwZlqoXhJ7TwUiGUi5KG1F1I9HI1UhVLYQvRfXFY=;
 b=GzlgChR/DvqmnNrFjgsKNMwc1aVvSmTpCIuby+/mbBpHji6czsvDb/PT
 ptaCfUDBUE7MFxDVnw8qBPbajKBDxIotxojYPvNqf16YVftjG9px8QXj0
 WLZTYLP6GXCm5KBjxqAUFFgU/ocB9NiYSsddWIBA960WshuHnL60CrVY2
 qXQb8yQHdaePf6AKd2DoTskl/CSTeLsH+BSkEuV0fIJjlu95R/HaCWHgM
 +8UhJxYPkRCUDQ2UdQzy/b6Xl/Cg+Lzm0qYloIJhxEW9/NfKjzH7wl7bQ
 ELHfsUqkfQyz23LS/BFZjaFrVjsC7OnvLDkpUTV0Yaduy2HggJuSakzFR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="293717225"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="293717225"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 01:44:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="586911523"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="586911523"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 07 Nov 2022 01:44:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 7 Nov 2022 01:44:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 7 Nov 2022 01:44:25 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 7 Nov 2022 01:44:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKRvlS9+fyzrpmJeV1TySbK4ejhbtxkK91KPBfC24FmqvWV3oGKc76iWpMEnrzq5CSccv5Rc0F5XDz2v11m8H7j9Y3dbHuA2b68XGps5OQElZIPjuX+rGk3mU+OAsJwDG9mUPei6q2cHo30ZyQ5Q/E5Mm19RQKXR2MjfWh2lEYz4UZ3t6C/LPw1I6a1UcPTEEsv4VmvQfsw6X04IDpwyeI0riV/4qyJqoBEAFFddUXhgS2/jqePl4+VtUtH5MaVjKikGUK5Z5rhLnJ8p1b1UkYJW2yll9CKBM/2rcksKohPu/tWpBfr+4A8jYMYNexBGeiCMUUKKjvQahb6RjVUALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjvqCoZQaFG6lWuRvoo7xkblANVAN6TqZUDYHA0YJBw=;
 b=Q0pCPVvFpn27LirRaEfOI25OBXb++CrpMgcfmK2RNel7JpBUtqeANAAvA7kCeImmmAnJv6Zd9baPBfq5K/u6huQXekVBLytrM7w2aNM/V5EolFrbOw5J/WuL9PRllCoGzCJGKDY7xuBVojqJN8yDRi46l5LafgM4Ijgv9UVmBUh8nze7waIv2UE6XbaZtuYyD8L2aI2qcQ89PneWKmoWx4NVsizOM61Ppa8mS+o/lJuvJN0a0tr4q9Wi4SNyr8VSIcqkh5Hx+Z5gCWU+qQflXi9CfEZ2G3M+NFgmbRBjdEd0UIpMG1mzFK+xD7GfrmiKn9IfnsCw2l8hgy61TQFQrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Mon, 7 Nov
 2022 09:44:22 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cea8:a6dd:9b7d:49ba%6]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 09:44:21 +0000
Message-ID: <fdc0f448-77f0-819e-43e5-250b74e29101@intel.com>
Date: Mon, 7 Nov 2022 10:44:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.1
Subject: Re: Question regarding delayed trigger in dpcm_set_fe_update_state()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <73e6425f-8e51-e26f-ad83-ccc5df517a43@intel.com>
 <874jvom5jp.wl-tiwai@suse.de>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <874jvom5jp.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::18) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH8PR11MB6879:EE_
X-MS-Office365-Filtering-Correlation-Id: 90a88c98-e700-4a4a-ff68-08dac0a4a5c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FYzEHozk+TsAz+qkNzpXJDJeTwGE1Qb5U7laqknfxKgLxs/j2gQo7ozydsyhW3dt9OIW2ASjTXaQQ1oTpnAbZD/PdE0SwYXWkex6+OVVQyU+NAiJ+wioyfysx11CcLI0VclXi1P5PiGlw6XtklLlVFcQpKHKDlHH8GQAuMzmlS4XjQthHlPb8toFLzBMKYD7By5DT+OAwnYUWqKV13O6nI9mQDFlA3i0bxYHLhM7/KCO9y//UU5tMX81gFj14JyE83JECcoU9kSJE1+c5x1io6uArUeOO9fRZNHsIRvX37D0Jmmx87A1+8laLPxWVdb1DY5rHKGxbn0NdyLD1KKaX3h5FdACgzse+MNxxL5Xe6x0OCz6RYBe1uKYa5ho+aD29CCgn70644yzBAX8TkyMANDYH0szdIeWQtBp69AYxfkWFVkV/Myw/jGnky/zRzaQCCTAGXyjyJZAeS3M7t+VPcM+BN8eycKX8T2DV/rfrEw4PZrKhHqKWytoCNbg+zx88BJxuZwMXzbR9jykkaBRaZmSbHUo7uIXqvccHfzv6QtuYbfXBiUKfJL2iI4W2ofgPeFp4UI2TdqeEOePEXo84fn78y+CaVuiGK9kAmhIFRhe+d0oLWbCOoVnuWAtriOhk3rYDaORe5BrKivIg0Z7RgyAIGm0FtvUqkLt7OxaGAWDbNbnDnXoDmBfF47rQEAr+wfr8xr8kOFlpyNxJgJX0dUB4/f746bx9dJ5Cp3qxxlwisrwpT3I/6Op9Fvs6PWKciJdIliY0J+tWMorHYNZis9On7U9fJ1zuYE3UKZJ2kQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199015)(83380400001)(31696002)(86362001)(38100700002)(82960400001)(478600001)(6486002)(41300700001)(53546011)(5660300002)(8936002)(7416002)(4326008)(8676002)(66476007)(66946007)(316002)(66556008)(6916009)(54906003)(2616005)(26005)(6512007)(186003)(2906002)(6666004)(6506007)(44832011)(4001150100001)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGgzYWljdjlxWTJ2TVRMakF4VHNQU1ZGc25JYjl4SzlaSzFFZEFFdmp4czRk?=
 =?utf-8?B?V0lMUkJ3NjdRbGZQNGtHa3VGTTdBOVFaRHpzSVUvbnBvV25weFY0K2kzbmR5?=
 =?utf-8?B?ZUZTZ1M4UmRIUGZUcGNGcThKaUdqWmZOd1hqaGFKSXdyQUVDVXFzd0V3T2Vo?=
 =?utf-8?B?UU80MUZNSnl4M0s1YmVMY3VJWFkyaHh4WU5qQXNqUmxja212bENiaS8zeFkr?=
 =?utf-8?B?aXBFdERTOUN1bDhVSUM5NERCWXZPcDBHVjlVTkRiRVZFbE9ENDFJVU83bllz?=
 =?utf-8?B?VWFJUUNITDBDYUdJQVBveEtudDVvc3p4OTQvbkttTW56aHYrSHNmd2s0Wnhr?=
 =?utf-8?B?d3IzNkhlWE9pVUd3VjRUaS9lNWtSU0JZd2x2MW90TkN3NDQ0ZFZ2Uzc1bTQw?=
 =?utf-8?B?SmthUGZWVnVPZkc4U2JNZXlxcVF2Yk9qZVFmZHprS3drQnNHeDBULzBpUXBw?=
 =?utf-8?B?VVFYY29UWkdaYUZaRHFGM2lzQ3V3eTh2aUt3UWszZ01rR1UvdmxXcWRaZ2xB?=
 =?utf-8?B?WXhGMVFQUzl3dmNZR1Q2Mm1OU2pieC9FUVRFMVlJQlo5RFdyekkzWjhuMjVU?=
 =?utf-8?B?cU05T3RtSWE3ckFBb0NJTU1ZNllma0t3TC80SXV5VW00UEthZVhNS05LV1l3?=
 =?utf-8?B?VlFOWjZRZGplUnorUTBUY05HemllV3pUV0xCTEg0KytNY3JQbm8zbENqODVp?=
 =?utf-8?B?dGtmRHpKNG1SaWhsejJ3cFZkalNNN2d1Um0xaFhHTW9KRzBnb2lock5hYzNr?=
 =?utf-8?B?Z00yQjdGZGhvZXRpSDFCQnFKSmlxMHRXSi9PK0xEVmNjUjU0emR3VXVDbW5R?=
 =?utf-8?B?dkJIQ3BlMldscGViSW4vNW9iWUFWdDJMQ3Z4ZWhvN0xlY2Vuc3orZFhvWFBV?=
 =?utf-8?B?RmNmbnNFU0dabHdRMVBYNjg0RGtIY004R01QZVhubGJjUnJWTm9ac1VQSnhU?=
 =?utf-8?B?WnFEYklCYUZSM2NiN2FHV1BwSVdsdVBTb0NuWXp5Slo3L05RckJUOHRselBh?=
 =?utf-8?B?dERGSlM1WWxPelhsNGpnN2ZaTXNBbVZXdU5qdnZOMDBnKzRzZW9xWXNpOGtl?=
 =?utf-8?B?bWFaMzlBUGllekJSQUk4SU4vNnNkWFltY2FyZi9hYUZNY3AxWGNYN2hXdzA4?=
 =?utf-8?B?WGNvLzcyOHJSVXJ1cmxKMHRZdWNkK2tCYjBrSlBubnpNSXNEQ2JrNWFCWXN0?=
 =?utf-8?B?ekhRbkFYUUNqK1dHVW10Y3BMempyOWkrR1lxSTBEWFN6aUl5UG0yK2loT1M4?=
 =?utf-8?B?ZThmREx1SzFmeGdSUXVtNHFWbW5ZandQdDN5UzMrVStzRVZvYnltWkVZMmRi?=
 =?utf-8?B?TlNqVTVrMGhSVXNOS0tYR2k0SFdpdTJQUE1ZeXNjZHo4VTZ0NVZ1WFl1Q2F1?=
 =?utf-8?B?WklzcW1PbVMvN0NCT09FZ2J5UFF3ZHVQc1lWbDNvbSt1Q0swQmptOEdGcjZp?=
 =?utf-8?B?ejBXUTRHR0xyR3dORVRmdmZ5ZUhEZE1lMUt6OFhEQlNxeVFSKzZubThwcExn?=
 =?utf-8?B?MFArbUk3MEJFSE4vY0VkZmR5RW40WjczRzIvM0Z2RWwrMHc3NUREQjhEMUE3?=
 =?utf-8?B?ODlwUmdTcFMwZjlmTFQ0WFRndVptaXBDbWxuUjJQUDA5SWNieHlSUTlFSDVl?=
 =?utf-8?B?QlhuRkRmaGVycTF3OXRYV2FtWTJIQkdnV0VFTlE3dlMzMVB5TVp4TlZySlY0?=
 =?utf-8?B?eXU0UkNheEg4bUhDN3BNbmlkYzdwVXZ6akZzbnZHR0VCaVJ2dHNNUXNudElM?=
 =?utf-8?B?WmlYOUt1VmRONUxMZGNmUUFIdHhNQml1N1k0Qy93cFJtcndwVFdtLzZjWU9P?=
 =?utf-8?B?aXpNN0IyMVRBL3M2WklEN2tBZmVjY2lQY25LRzJPNEwzbk9WWUg4TU9yeUVV?=
 =?utf-8?B?dFE2Q3ltMStqQjhvdnBwN0NJS1g5R2NzeFpWZnptT1F0cXpxUWJKK1FCQTlL?=
 =?utf-8?B?NGNpVXRqYW8zd2ZqVUgwcG9sYW9hdDE1Q1NQejcvNEpBV1k0VUFyYXVhbzcy?=
 =?utf-8?B?aUwvb1FxeU9FZm9Za3V6UHZIK2d0TXlRL1M3V0N4Nnl3ZHRzcEtqNEROR2l5?=
 =?utf-8?B?bFBOQ0FwQXFzYis2OHhsR1B2RVBkNHF0aUF6WC84TGFiQWcwdmQxRjl6ajVO?=
 =?utf-8?B?ZDVBcC9uNkFSbThVNGIxV0pPWWRzMzJVTWIyYi9LSUJwMzlqRXJqN2ZsVFlK?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a88c98-e700-4a4a-ff68-08dac0a4a5c3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 09:44:21.6788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUapimNdejRTMdqi6l1XK7bfyOFy5X2dtxd8ovsuQcFCLiklpab+IyYCYs2pfmyEmUQUfaRyxthPz9UhPEcra7Y8tTQq+Zf5t5SMLkyqks0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6879
X-OriginatorOrg: intel.com
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

On 2022-10-28 3:38 PM, Takashi Iwai wrote:
> On Wed, 12 Oct 2022 16:07:49 +0200,
> Cezary Rojewski wrote:
>>
>> Hello,
>>
>> Writing with question regarding dpcm_set_fe_update_state() function
>> which is part of sound/soc/soc-pcm.c file and has been introduced with
>> commit "ASoC: dpcm: Fix race between FE/BE updates and trigger" [1].
>>
>> The part that concerns me is the invocation of
>> dpcm_fe_dai_do_trigger() regardless of the actual state given DPCM is
>> in (actual state, not the DPCM_UPDATE_XX). The conditional invocation
>> of said _trigger() and addition of .trigger_pending field are here to
>> address a race where PCM state is being modified from multiple
>> locations simultaneously, at least judging by the commit's
>> description.
>>
>> Note that the dpcm_set_fe_update_state() is called from all the
>> dai-ops i.e.: startup, shutdown, hw_params, prepare and hw_free.
>> Now, given that knowledge, we could end up in scenario where
>> dpcm_fe_dai_do_trigger() is invoked as a part of
>> dpcm_fe_dai_hw_free(). dpcm_set_fe_update_state() is called there
>> twice, once with DPCM_UPDATE_FE and once with DPCM_UPDATE_NO. The
>> second case is the more interesting one since it's called **after**
>> ->hw_free() callback is invoked for all the DAIs.
>>
>> dpcm_fe_dai_hw_free()
>> 	dpcm_set_fe_update_state(DPCM_UPDATE_FE) // fine
>> 	(...)
>> 	dpcm_be_dai_hw_free()	// data allocated in hw_params
>> 				// is freed here
>> 	(...)
>> 	dpcm_set_fe_update_state(DPCM_UPDATE_NO) // not fine
>>
>>
>> The last is *not fine* if the .trigger_pending is not a zero, and can
>> lead to panic as code used during ->trigger() is often manipulating
>> data allocated during ->hw_params() but that data has just been freed
>> with ->hw_free().
>>
>> Is what I'm looking at a bug? Or, perhaps there's something I'm
>> missing in the picture. From my study, it seems that only
>> dpcm_fe_dai_prepare() is a safe place for calling
>> dpcm_fe_dai_do_trigger() - once .trigger_pending is taken into
>> account. Any input is much appreciated.
> 
> First off, each prepare, hw_params, hw_free, etc call is protected by
> a mutex, so they can't be run simultaneously.  And the commit was only
> about the (atomic) trigger call during those operations (which may be
> delayed if happening during other operations).  So, the case you
> suggested in the above can't happen in reality; PCM core won't fire
> such trigger.
> 
> Of course, if you observe a race by fuzzing or such, then it'd be
> worth for investigating further, though.


Hello,

First things first - thank you so much for the answer. One bug less on 
Intel's side :D

Did not manage to connect the dots myself, logic around 
dpcm_set_fe_upadte_state() is not straightforward one. And yes, I've 
managed to get race going, but perhaps only because of an unguarded 
snd_pcm_stop() in the avs-driver i.e. called without stream-lock held. 
The scenario is quite complicated, requires several ongoing streams, 
AudioDSP exception and then firmware-recovery attempt.

Will see if something still pops up.


Until we meet again!
Czarek
