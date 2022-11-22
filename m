Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFEF63435F
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 19:12:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8568615CC;
	Tue, 22 Nov 2022 19:11:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8568615CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669140728;
	bh=Y/UbJflb6M+6aQiEpYtdaxyxpFQ/cIjzEnXFUkQ4XLQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GiGYyjfLbjXUQafTCH4GFF5alCqfpelgm8anBZA9CXPHni50KdsjMyXT0K1LfWGDp
	 GDDmyohQ91Hqj6QEbwpICUxueBN/eueP+D+JftI5Vj+wzNKY4WQAxbCCW/ObtHNdJm
	 1B3XmoWWgG92jmzhvsPtCeCPwZPOwbP0YMS8DB4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 237D3F8026A;
	Tue, 22 Nov 2022 19:11:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F616F8026A; Tue, 22 Nov 2022 19:11:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E2A5F80149
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 19:11:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E2A5F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nXhN5H+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669140667; x=1700676667;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y/UbJflb6M+6aQiEpYtdaxyxpFQ/cIjzEnXFUkQ4XLQ=;
 b=nXhN5H+x1Uu1/6HIoek0gdL0/D1uXAKEIs1XWip0cXX/m8jFzXgiINcQ
 SbWa5Ah9JIZD25O1yIXecJ3gQTtt6+4HIGMHYK5oAX1IN74rZs3uoABQ0
 tQKuEdg7EK1I+MElwevnWyXbYEWR3qkLCY80QhNlcSE0n6Hnv7lKWtYdP
 I4if6XLwzoLoY+OfvanY1kNcerTEML/GS+88rNQnusu+UluFDTOOEgJd5
 qnpB0Bo1Fx7dEj/JVvjSjw0lsQdBoDAi1YBkphgPYiJBjsrZyMV8/qz90
 yCmB2G9jQYK4Jyrx9Dy3/KiG+x9+b8GitgFQb+PtcnYtIi/CmO0ND2rt3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="315702467"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="315702467"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 10:11:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="705056643"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="705056643"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 22 Nov 2022 10:11:03 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 10:11:03 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 10:11:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 22 Nov 2022 10:11:02 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 22 Nov 2022 10:11:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCKZnV9qdXz2/RBjxeloBBg2Iph38Dr0XC4YkJSSkSC43I0p/HY91IgNdhenVNxVU21417uUaW7wAKLPNuc8MOzoiZ0sVsJSoDBKvShKN73NLIydpB3mfUxYU5IqrUemigKc8E1bUOo0ukSz7kYVEaM7c8ok9IxSr1dsHclEKYZjGw3sdk3XWRM0512SOyHHeIdYMMZgVR9/JnMqfWrO3b2IR4L8vfiZzHYVfDqzG4aLA2XZ0tZZTw4i55BLWxFUEcjHk6Hwdu3OxrTpT3qfqV7RlKCkDHw29OCSyq9hQsLezyJMo3IAmrrkEFGQTYIsUcYRDBjY1XFM1dlEEf2BLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfepXWTo50jVWySMsjH2F2HrlKIZXkSRX+IM+U725BA=;
 b=R+7sV/eWBBNI3MVjx/i/k3AsVZaTMVkcdUSSXe1Sgwzo/SDAE/D0zBCQhAYlC5aMs8Hoiw627jCMm/NYaBoDnlwOn8XmQQrMtodUND56r1PizZ4jTZX3zOLZ/Z/StDYDgOrJAwtziYVQpqJjbU7gMrmolR09ELMhOxnWRvkLTGXjjRoohy8v6JHaEygGPQp35rGjFIXjPXkXN1HcfESy4QMv8Sng4bg5KaFHlLnWiXsTK7k6vqEaBKvHEi+jvcI1TDG0XwTRuCcsyBfdsRCs7KpCnCvhZ1yZ3Es0Zq8EbsNl+zIFZJOqb9KJHJ31yRVFh6SLGgopH9Rrp4FBLSHhrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CY5PR11MB6137.namprd11.prod.outlook.com (2603:10b6:930:2b::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.15; Tue, 22 Nov 2022 18:11:00 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1821:24fc:fe2f:16d7]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::1821:24fc:fe2f:16d7%5]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 18:11:00 +0000
Message-ID: <ee8fb5be-e31b-2000-84de-85db5989ee92@intel.com>
Date: Tue, 22 Nov 2022 19:10:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] ASoC: Intel: avs: Add missing audio amplifier for KBL
Content-Language: en-US
To: Alicja Michalska <ahplka19@gmail.com>
References: <Y3wHyJ/EcsLRHGr3@tora>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <Y3wHyJ/EcsLRHGr3@tora>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::18) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CY5PR11MB6137:EE_
X-MS-Office365-Filtering-Correlation-Id: 74859c55-01b9-4798-f36d-08daccb4e86d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YJuCxrv9ftt1S4FiJ9M5A8FgwSKe0cd00X9Fht07kQNwDU7gRSKt38es9eErmTJ0ulDJ6hbhgCQjCxLLesTEXLgQFNeTibmcbIoSatYB4FIxCok6VXfGXlJQwlmHMJjGAdgFARecI/SzZ5zdQXmmc8g2AyX6jsEWIXRg2oM4NI2BuSufbu3CBfnLwrJZx+5qDXQk07/Q/GxxddU79nzXVMMc2P10ILfn9m8ribsSUIsyRbsC3W3A/vbllMG+KWjMyrmjoTwY/DTTZEe338bVgYYZkdGv4OSqGr91OkGj8Z3eRvHnAKUp6+SQdn783i17VnqZqtRRf8+ERB5nBJr58ufVFyFdhXks/R2pmkOm222uwPPL9FMk9qL0k/p7eC1cdck1g21ruuPlIz3O/44RR+vy3wt3XGlO/VO1HBmo8A4lRjqd7MJ7h9qAKxp6NYBOwfT8PuOfE0ax6iYgrRnrboFA67izl2KVJzIxVP3yXzUsXzLAPaQGlJRCirXc+pGFfkHC6C25BmaXbZGANAOU8btOdQwF56BsET+N+GDalXQ5y4v+yuCUs2XlLl490qNT20qESzs2LyKOpdtq1LiADaZ9JG+6KpGgdGBusvXwzqzYHRWI7A0svPJOFnp72ILjs17ww7IaI007zJUPMpgTO5GFELWQjLAgM4FfhrmLJMbP404nUCP+RQZVpL0+cXbcWEJFTkvqv7WWUSuG909cIgL0HDbtdxlTt1eaI0hj8dI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199015)(6916009)(4326008)(8936002)(36756003)(41300700001)(316002)(66556008)(6486002)(8676002)(66946007)(66476007)(83380400001)(82960400001)(38100700002)(86362001)(6666004)(478600001)(2616005)(186003)(6512007)(31696002)(53546011)(6506007)(26005)(31686004)(2906002)(4001150100001)(44832011)(5660300002)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vmk5UjVrS3ArTnI5V1BFbW52cDEwbGpYbHg3VGlsdmtJbEpvRFQxd2tsaUZi?=
 =?utf-8?B?ODVvaGdSTUJxVXBnZWllOFN4QWttd2V6QzFla1hzK09WY2pRQXZEUUhRRml0?=
 =?utf-8?B?cFB3QnF4QUNQM2c0dmpVYjNqTW14KzVKUlJzazJqSlVwZWVNV3ZyK3lrQ294?=
 =?utf-8?B?RFdidUJqb05UbEhhMmlMb2VhaXh0U2pudWhkMitTRjJDOXBYRnJYT0dmaXp6?=
 =?utf-8?B?c0w5MW5sODhqSGFjN1VQS21qQUt6RzZFVXpENWtmZ0dMcGR4Y0QyalFRNjVy?=
 =?utf-8?B?VkZSNlNLWFk2VzdkSE4wQVl0RTdWM0NCQUZ4VTVxbDlpTjd3Q3VDWU1sTUhm?=
 =?utf-8?B?UFZmTjdRUVZ0MW9ReEhFVzdQVU5SOUZMTjJ5cm5WU0pEMU9iU1JaMjJkWjhh?=
 =?utf-8?B?TVNmWE0xRVVPcS9UY0FEb1JmSmJnR21hWkZ4Y2JFKyt2cEUyaW5rT2I0bEFC?=
 =?utf-8?B?ZEwxb3N5RUVyamQ1VTl6WG1QZ2kvVHEwejUrVHpEYm40dXhZVlI4UzZwdUZi?=
 =?utf-8?B?cmdOZFB1YWpXZ2I2Wjg2ZFQ5czhzcEN5TGRCdlBxZVMxOEtwWWUzNjNSVnI2?=
 =?utf-8?B?R1E4cVRhUjVlN3psR1FwSW10ZlBlUzE2VUNlb0UwZVFaYjlIMXVvc3lPbDda?=
 =?utf-8?B?NnJFSmFGUzNHZFA3RFZ3RW5NSnZEV1ZKZEw0NXFpWkJXMXRMMjBBVHZmc0h4?=
 =?utf-8?B?NVdFdjY1WlJ5STRabWEwQUNUT3ByQ05mM25EWmNYV2kyeVlSOHFKa09hR0NL?=
 =?utf-8?B?a2pQd0RKSG9CdU55QWd3VUxuNVhrUGo1YkpTZEppUEQ3cVM2NHhiaW1SVGNq?=
 =?utf-8?B?cnFSZ3kyVFp0T3IvN1FVblNoRHFYYk9EblNmK0ZUbUhDMXdCeXpsN01uUjRa?=
 =?utf-8?B?WmtBQk8rRURwVGtZYWl0TGJnMnZNVjZmZEFMQ2ZZUTdMZVN0dm9Sc2UvdTNF?=
 =?utf-8?B?bmdzd1hRTmdqVXljRGNwMnMwd21FWHRTbWhkejliN1FNcnJOdHV0U0hlVy9i?=
 =?utf-8?B?bmx4SlVQQkxkM044a0dVcE5wajU4Y0NtYi9ndjdKNlU2dmI5MVdMeXpUeHpR?=
 =?utf-8?B?RzdWSm9CSmRZOXhtekpvWnVTVlFtOFJaQzMydS80RTlveXNHMWdUR2hmcjV4?=
 =?utf-8?B?b0VTTC9PUWxOUzBsS0VBc3NBQTltUVJ2c2p5dHNWcmh5dHRQSTM1Q21RZm1K?=
 =?utf-8?B?Y0QrTEVMY2JxcHFRVkRVV3RpYkMxSkdhSVFOdWxYZ1lUS2k0VHpDNlJnVWl2?=
 =?utf-8?B?aThmZjMxMXFYSkRHMVRPMHRnamlUMDF5bGdQSXRHUHZEeG9JN0hpOTJWRExm?=
 =?utf-8?B?ZHdhZVRlMnRlenIybll4czFMa0Y5cFdUWDROUm5PUzc1UWtBUzZSdm54aXo5?=
 =?utf-8?B?UmpmL3RPSGJ3aVZZQ0sxenFzLzhaQmJkVW9nSDZCUEdnNWxLR0Zrc2Z0QXh1?=
 =?utf-8?B?Tlh0akxqamxVeHVGc08zb3V1Y2oxUTl4V3J1M1p0VjhzMnRkWDhUSFA4L0I2?=
 =?utf-8?B?VFdoNEZkamI0NnpSNlVTNnVndlEya0ZWMVl6UStGRzZjZTFzdFk5bUJ6VW1G?=
 =?utf-8?B?VWV3djJoTXVmYmI3cjNxeUFOd3J0dlBWcUZBK0V0L1d6T2k3R1RrYUVQcnFl?=
 =?utf-8?B?SGlxVXVRZkNGWE5vcVNZa0hRSXdBSFNPZ2U5ZExucUJ4ZkpJcitYaytrU0ZI?=
 =?utf-8?B?SFdrYmgxSTJpSTRuRUZyeFgwQ2JCSElCUmpyVHJRTExSckkwM0FPcUx0d2ta?=
 =?utf-8?B?NVdIU0JhRlBJVTV4N01QbC9ZZm82akIwcERHeThVVDUrUEpKUzlONVVNQTU4?=
 =?utf-8?B?QXI3TUMxMVNkN1Biclc1MnpqSXBlMW5ZT09qdzhPdGRpRHNQalI1VHVXRG8v?=
 =?utf-8?B?cXU5Wjh3ekFFUDdBalRta2dYZnBxZ2dnWEVSTlZKbXp5aVZ2WkJ3SGdTQ2FB?=
 =?utf-8?B?RmttWi9ncEM4UjBKUVRQVUhGWGNWMlo5QWJOY3I0Y1Ftc20wUnpTcGVqeU50?=
 =?utf-8?B?cW5iaUxrd2IwYjg3T3hGbGd5SHpoem5nZFQrSVczQmNIYllETWgrQm9iYS9E?=
 =?utf-8?B?alNEWTVNN1hLU0J6VmtydHlRdnJ5TXk2ZHU0VS9TbXlmZTRHU3o2VmZra2I2?=
 =?utf-8?B?NXRuRXJDWWVIYk1vR3FFYnloRjUyTEFOVlZiMnpaSHd3OHU4QUMwM0tZR0F3?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74859c55-01b9-4798-f36d-08daccb4e86d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 18:11:00.8151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/4SYBrLYO06p5vghW3GrI2XK9en9AsM9/qIIUOlv0Klnw+sAuIvp6WNGz26dxmz1+IL8mfnkbM7nYjCoqDou/pAx+PgjF/kUhGM1sZA7cw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6137
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
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

On 2022-11-22 12:20 AM, Alicja Michalska wrote:
> KBL platform is missing the definition of 'max98357a' audio amplifier.
> This amplifier is used on many KBL Chromebooks, for instance variant
> 'nami' of 'Google/poppy' baseboard.
> 
> Reported-by: CoolStar <coolstarorganization@gmail.com>
> Signed-off-by: Alicja Michalska <ahplka19@gmail.com>
> 
> diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
> index 87f9c18be238..650faebb33ef 100644
> --- a/sound/soc/intel/avs/board_selection.c
> +++ b/sound/soc/intel/avs/board_selection.c
> @@ -129,6 +129,14 @@ static struct snd_soc_acpi_mach avs_kbl_i2s_machines[] = {
>   		},
>   		.tplg_filename = "max98373-tplg.bin",
>   	},
> +	{
> +		.id = "MX98357A",
> +		.drv_name = "avs_max98357a",
> +		.mach_params = {
> +			.i2s_link_mask = AVS_SSP(0),
> +		},
> +		.tplg_filename = "max98357a-tplg.bin",
> +	},
>   	{
>   		.id = "DLGS7219",
>   		.drv_name = "avs_da7219",
> ---
>   sound/soc/intel/avs/board_selection.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
> index 87f9c18be238..650faebb33ef 100644
> --- a/sound/soc/intel/avs/board_selection.c
> +++ b/sound/soc/intel/avs/board_selection.c
> @@ -129,6 +129,14 @@ static struct snd_soc_acpi_mach avs_kbl_i2s_machines[] = {
>   		},
>   		.tplg_filename = "max98373-tplg.bin",
>   	},
> +	{
> +		.id = "MX98357A",
> +		.drv_name = "avs_max98357a",
> +		.mach_params = {
> +			.i2s_link_mask = AVS_SSP(0),
> +		},
> +		.tplg_filename = "max98357a-tplg.bin",
> +	},
>   	{
>   		.id = "DLGS7219",
>   		.drv_name = "avs_da7219",


Any reason why diff is repeated twice? It seems that the first copy of 
diff is part of the commit message.
