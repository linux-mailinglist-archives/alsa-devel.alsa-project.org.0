Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 265B052829C
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 12:51:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95E361677;
	Mon, 16 May 2022 12:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95E361677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652698295;
	bh=3oGYDor2G9OQCI0XvUKNRLan5/XquOKWO9i+gZ+V6XI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WNn1ogXvmmePWODBDRgNtyM6GB+g8Z/zxByxTBoDdhaSDAWQgZG5nakZkg99iTn4w
	 Bx8NQ1V1+v6/UrborDf/BiRIRu94jylQGkyYW2Ja3ucQog0UQRd36H1cNo2zRlehks
	 o4y7H79U7ZVUP5vWqFk68PKYOf4W4CKWFBRO80u4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93A8FF8051A;
	Mon, 16 May 2022 12:49:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B14BDF802DF; Mon, 16 May 2022 12:49:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, PRX_BODYSUB_18, PRX_BODY_30, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 583DFF8012C
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 12:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 583DFF8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bRLycUBI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652698144; x=1684234144;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3oGYDor2G9OQCI0XvUKNRLan5/XquOKWO9i+gZ+V6XI=;
 b=bRLycUBIRdoCHjh6YjQIQFeF8DahtdgRnamW3jCzxJe6TTF1XecyyQyw
 je5B5yb6mpR17Brj7twiNzoUunOJPdYomSZSZ7FhIZB+TKb7NN5ojX1FV
 tIPI9zV9UsHdJ73rIsrr9Q/D9tqwBQrqQBLmwRgRhT1ZRLiMgyYiQWoXR
 4D/HhKyilNCqGhwzXejHd5gSuA4V1zWvotVJgAMlAk8aTRRaTV5FPUw+I
 S9Fw/b7KnMEFuOo6UIScemhvxiLxHd6aeOGe6Q4FhTxvzVqmzcNtctCpo
 n987I/QWI48Yo2NkCB0qv/7Sex7m+2oNM6y0MNAHtaAo8AE3yQiUWO/XY A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="258364845"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="258364845"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:48:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="741187504"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 16 May 2022 03:48:44 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 16 May 2022 03:48:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 16 May 2022 03:48:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 16 May 2022 03:48:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWcQLBM64QKHT7wUbLHTf8FtsunjwNc3a4Dci1eDug8kV6LNBxXSniK7AEqVNuyBmxnEtg8fbiZTQ0hu6GkAsdb4+jiJDRI93THOJ5RMiSFGp8x2JSoi5Zl70Tda8F4L97m3lAsrYCBFvfBxM5Dy+/YzIhFlbpMlZAQB9REsuiQHv//LyaC1zhOBa9z5oaSHDa3MTLk3BwrK/OwKIxGXldG++2WgmGi9iPK+ug9cNcD/Ypg/P0WQS9NQ8GhwHxAFLmfo7JGBNt0qOz02yPqtwjZnDtpMkJMO6NeFk0BZ2jSt4obGXT5wmgi05aiYgcYaHfg2RBwUl59VPtbzCTDLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdnlrfeJAeGI3WOA5KsX3uAea8FKRSLrg5l8C7iActE=;
 b=JyAgOZ4tW8LGdbCngrBRs/4+ZjNBKocjA7Jr7Ipbbe/w1NelKJLxYGPjWNRQOCbx8/QS1R+B9lBpdZJT0Ygh0kuJqFUE8/tXoZ7M9bavdzaIIAwPie9Lqmr7nDtkd33d6LGOQFF62YDrbR9Z1RuMbZeUbH5hcGmQuVd7HVDu7bOzl06pghQLu5ou7r2jT3tnk7vSJxno/KfMBuKGIffA9QUR85/NOwulBVvvUtVRzifj3FtkKRSZ5PKZofaXf38JvXWHpFd1xTvF2KxtTLai5kf55nvc6DJFl4gcKcJQfa/z6ASTV02IaXbW5SWR9UZxgTNUqj9d6g3wGqHej8rAWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BY5PR11MB4007.namprd11.prod.outlook.com (2603:10b6:a03:189::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Mon, 16 May
 2022 10:48:40 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41%5]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 10:48:40 +0000
Message-ID: <7fccb1b6-df56-8fd5-bbac-6c92024fd4cf@intel.com>
Date: Mon, 16 May 2022 12:48:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH] ASoC: rt5640: Do not manipulate pin "Platform Clock" if
 the "Platform Clock" is not in the DAPM
Content-Language: en-US
To: Oder Chiou <oder_chiou@realtek.com>
References: <20220516103055.20003-1-oder_chiou@realtek.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220516103055.20003-1-oder_chiou@realtek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR07CA0028.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::30) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c7e4060-1bfb-46f3-d5c5-08da3729a3aa
X-MS-TrafficTypeDiagnostic: BY5PR11MB4007:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BY5PR11MB400732BF9F2C3399D0CC7E83E3CF9@BY5PR11MB4007.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kqPhuiK1lnTL5kut3Jbae1zd8Em4msg/ZBHBR9i/EVKqArdbdelgQuX7ApsKz74wLjs3SpL+tqQT88cVf4xP1jzFMWVxNdm+YB2LF4XKkPGFt/lT7ZogCYWCiLozLInQjmZSbiLDlUKrCuxs/LqTcUHohVH1LQBmESYXr3AWzlugUI6QmsmVgI1PR+t3QMAHmBxUUdkjvK/uMIhXYH+7cgV7JIqQpwer3C8ICvj0EUReqbMlr30J7JRZpgaw0Nr24Qi2NHAN/Q6WaWa8rgb92SanTZHfIIwkf0ajab45FgcOhqvnefu+8RW/yMfRq0u2pVPw2qTUZH9X2IDYt7h6JNQCBENq3mesywkfUHVp7l+0jM2esAOtKjjgQxHOkzg0mtdaWguA75KhxebTbjM5CjZb57nIDECYGQvBUNmD4Uu1i6BHAeaS06A0oJonhjtYQVnQKZY7T1qu5k4nMHUTU0PBSUBi58q6lLxhKvu/H8mzt3uIM60gnZzwdbCvtNBYiaenTD/jASmRULKVR3HhLuLfdm638PxQ3iP1oU6NgTfYGgXe3cnPvYBxbI/GGff+/iCWdWMsqUWXpr9mP26okscoV5iuLgiZf78zPOb5gHxbxbrmGZqR0cDD7KmDPtvZ7B7XiB73m/0wTaatCcgNbekl9Gvo3VIn5n76JyffeOab4RbDHirre9DQiuyp0sLhoifr1OgZG/u2txW6SmbwI+AR2lbek9A9OgCVm8eaaOE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(6486002)(44832011)(8936002)(83380400001)(38100700002)(31686004)(5660300002)(86362001)(6512007)(26005)(31696002)(2616005)(82960400001)(54906003)(6916009)(2906002)(53546011)(6506007)(6666004)(66556008)(66476007)(66946007)(8676002)(4326008)(36756003)(316002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzNScEUyTmVodTY1SExYZDZtNTZUYVR4OWE5Ung1OEJrdDYvK0N1WHgwQXdq?=
 =?utf-8?B?bjVkWlNmdGNxOXJrUnNCbDIySU5GbExYV2s4ZUl4VGJJZXpyeW9Db2JtZE1k?=
 =?utf-8?B?UWpCQk1uRHFTd2t6aWtPWm9qSXRaYVFvRXp5VjV0TU1FODQxR1gyNGFjNDVv?=
 =?utf-8?B?STdmYmRscmNpSVM0SHVKTHpCZ3JPU1VGUGJ5MitCRDl6MS9hMUpwUC8xRVUy?=
 =?utf-8?B?WDZTanRJKzFsSHlxaW1DeVZvQ2ZtY1FwVzlNbG1ZYUhzZWtkblFJQWg4R0Qr?=
 =?utf-8?B?b0VqY2psWUVuR3lrczB1T2lBRzJmd0pXalpON21HVkN3L2t2ZGdyU3kzTGxR?=
 =?utf-8?B?MUpjZEVLUEVhRlJaemtWZG9pTE40L0xPMmxTUXdIeWM2cXQvOXRoOHhXQ0JF?=
 =?utf-8?B?SjhwMGVGTFk4Ym1uRG9jaVJzdmxmVUdPZVNYRG42d3pNbi90NGpUS0cwWFZt?=
 =?utf-8?B?NFI4TnNkWTVkNVdQbk9vQzRlMDd3MFYvbjVVSEF6UHowK1lVaU50cWVTOEpJ?=
 =?utf-8?B?YUxML3I1Q1ZZaURITVNwa2o1Zjk2VUFuQ3M1SFR6d2ZoYTRrUUpOcGczKzU3?=
 =?utf-8?B?b0krQzNTMzhmcDZLRW41RENHdnNQSlVEdGMvSE9FMDJ1TWdEN0VSN21yYm85?=
 =?utf-8?B?QW9uMmNGZUpFOTZUc2RBaUdXQVlLcDRqcVdtU1hQaFJidUNoeXhmZXFqakZM?=
 =?utf-8?B?SE50cnpjYnZCYUcyeXlHdDA5RU1kTkJZOFVLMFR2RkpqOTl1RHNOclBxeTh5?=
 =?utf-8?B?eE5CbEl6dkhVaDRHbk5Gb0k1Z3Bnb0JKa0F4bzVwSkt6dFpqWmlNMUI5dm1v?=
 =?utf-8?B?bEVOOVNDTTg0Ukt6OVluQzAvSUwxeHh2RnQ2aTBMSldPcGtZc0NjcEJHQjRw?=
 =?utf-8?B?ZzhqRUdONldUWjg5dmphSmZnWXJ5Qnl2WVlmL0VtdGk1YUNHNzFVYmEwQ2xm?=
 =?utf-8?B?c2pKZFBDY2N3RWRReDV0NnJSek1BaEU1R2Q1ZjN6SGFaNmNxTXo3WWlpTitx?=
 =?utf-8?B?V2NqSGFnbmlJd2E5ME0xSURha2ZSZUNvL2lIL2d5NytNTVBmV0sxU245QllG?=
 =?utf-8?B?U0U3c2FqcHlFNGljVVV5M1VtZnFmTWt1a3VRZjZUN0p2VHpGS0FIOU93L01o?=
 =?utf-8?B?eE5HeEM2YnZieDU1VE93VHRLNU1GM0dOMGZsK2FWUWFIdkJiMGtqOEs0dTAx?=
 =?utf-8?B?VWNjMzA1emM4Zk5HWjNOOGdXWDBIaG5iNnpGRjQzUGF3UWVIUmVYT282ck9s?=
 =?utf-8?B?aHFaRzZoU3hUOUJxeW96QWRMVTF4cDRDdFoyMW0vb1lXS2loMmF5d0hrTjRk?=
 =?utf-8?B?Q3NGRjVYcUVUQWtOcGJpU2xJZjhOMHNYZkNtOTdWVjhoaEtmWFQ2aHF6cmh2?=
 =?utf-8?B?SFdRNk81cjNhQTUva3h5M2lKWUxiQ2M4ZDlOa3dmWUhnV0ZxWnNvb0VpbnhZ?=
 =?utf-8?B?QlYvVmUzY2VpcFFRSEt5SnNCWThiS0tWL09HMnlEb0IxWndsbUFJTHdwYkE0?=
 =?utf-8?B?UkdlNlVRK092MCtqdkZPaEMyRnh1bUszZitPSllEOFg1Q1lCMDNDZ05ma24x?=
 =?utf-8?B?VmhTak1sazY3dS93aTlQWkNNTWpzY3pyU1JaMTc5VVltbFZkcEoxTkdSZmwz?=
 =?utf-8?B?M1JhMndLbVFmRk9wRGpDNTRQVEJJdFlhTExUVkhhRGlpWUZTRjBSNUdUdVZ3?=
 =?utf-8?B?UTNiUVFhZ1hhbGlXU2s2N2ZTaEhFQ2NoVzRjZjlneFZmaUNack9sRklseWxN?=
 =?utf-8?B?ejc5S3ZZWFhMRnVoRHhDMWxITVJZdzk3ajl6eWw2MVYwRjJncldwbnBMN3lI?=
 =?utf-8?B?Y0RKVkhxaGQxK05aRElRMUVzNVNuZDlFc3ZoVkdUanViSW1HU0VhV2JyOTVO?=
 =?utf-8?B?NTlXSFRpL210Zy9RWmtWYjg1TWo5NDhlcy82SUN4S1IxMExrdlVhd1ZJRkVI?=
 =?utf-8?B?RVVXdjZvd0p4TlhQZ3Rkd29xUjhhZ2h1OXMwZ3ZRM3VyZThnTzdKUTcrRVJ3?=
 =?utf-8?B?T2lHckhHNHg0bk80QlpqOWU1OTVRbk1qbnlQa0E1NzZVSXdOVkxrOGllOTBK?=
 =?utf-8?B?UHVjYXlyRUliRUVHanA0L0orZEM4a1ozTXZhdGR0cTE4M2hJdnozVGx3eW5j?=
 =?utf-8?B?TkJOVlEvUTQzRjhPK1hkVzl1UjlSNHZSUlhLODBYQUdqSlpwWXNuNkpXNnNY?=
 =?utf-8?B?TGs3aG1qQ0dBbjVtaDd2NGFpNnpqd2xKVDQ3SWNsU1N5SkJFTmdQVHJqQ2xh?=
 =?utf-8?B?cWRwL3dsdlFiVFFYdDAxck40MUJwQ2tOQXV0WTgwTG45SFcwNC9oQmNBL0Zm?=
 =?utf-8?B?YjZWbkhDdDc3M09EZEFXOXJVT1VQUEx0aXZaWVhnMlRXQTdPVEsxWjFUM1Va?=
 =?utf-8?Q?MSyjtzOoRp+3LIK8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c7e4060-1bfb-46f3-d5c5-08da3729a3aa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 10:48:40.7770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93pQJZV5IRYt+mg1FkqjE6OYLALQzNnMLpb++RErArAh/9EzNgv3RGkAZOIo18B2Hq/WAVDqVfHQzHQpjaQWSMkbrUi5EI6RltiPK53nm3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4007
X-OriginatorOrg: intel.com
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

On 2022-05-16 12:30 PM, Oder Chiou wrote:
> The pin "Platform Clock" was only used by the Intel Byt CR platform. In the
> others, the error log will be informed. The patch will set the flag to
> avoid the pin "Platform Clock" manipulated by the other platforms.
> 
> Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
> Reported-by: Sameer Pujar <spujar@nvidia.com>

Hello,

Please shorten your commit title a bit. It exceeds the recommendations 
of cannonical format.

Hope I find some spare time within the next two days to test this change 
on HSW/BDW machines as you mention only BYT here whereas there are other 
users of rt5640 codec. My testing is not a blocker - if I'll be late, 
will send appropriate fix - hopefully won't come to that.


Below some nitpicks.

> ---
>   sound/soc/codecs/rt5640.c             | 11 +++++++++--
>   sound/soc/codecs/rt5640.h             |  2 ++
>   sound/soc/intel/boards/bytcr_rt5640.c |  2 ++
>   3 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
> index 12da2bea1a7b..69c80d80ed9d 100644
> --- a/sound/soc/codecs/rt5640.c
> +++ b/sound/soc/codecs/rt5640.c
> @@ -2094,12 +2094,14 @@ EXPORT_SYMBOL_GPL(rt5640_sel_asrc_clk_src);
>   void rt5640_enable_micbias1_for_ovcd(struct snd_soc_component *component)
>   {
>   	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
> +	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);


Naming a local variable 'rt5640' is not a good idea. Conflicts with all 
the filtering. Use of 'priv' or 'data' (alone or as a suffix) is 
recommended.

>   
>   	snd_soc_dapm_mutex_lock(dapm);
>   	snd_soc_dapm_force_enable_pin_unlocked(dapm, "LDO2");
>   	snd_soc_dapm_force_enable_pin_unlocked(dapm, "MICBIAS1");
>   	/* OVCD is unreliable when used with RCCLK as sysclk-source */
> -	snd_soc_dapm_force_enable_pin_unlocked(dapm, "Platform Clock");
> +	if (rt5640->use_platform_clock)
> +		snd_soc_dapm_force_enable_pin_unlocked(dapm, "Platform Clock");
>   	snd_soc_dapm_sync_unlocked(dapm);
>   	snd_soc_dapm_mutex_unlock(dapm);
>   }
> @@ -2108,9 +2110,11 @@ EXPORT_SYMBOL_GPL(rt5640_enable_micbias1_for_ovcd);
>   void rt5640_disable_micbias1_for_ovcd(struct snd_soc_component *component)
>   {
>   	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
> +	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
>   
>   	snd_soc_dapm_mutex_lock(dapm);
> -	snd_soc_dapm_disable_pin_unlocked(dapm, "Platform Clock");
> +	if (rt5640->use_platform_clock)
> +		snd_soc_dapm_disable_pin_unlocked(dapm, "Platform Clock");
>   	snd_soc_dapm_disable_pin_unlocked(dapm, "MICBIAS1");
>   	snd_soc_dapm_disable_pin_unlocked(dapm, "LDO2");
>   	snd_soc_dapm_sync_unlocked(dapm);
> @@ -2535,6 +2539,9 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
>   		rt5640->jd_gpio_irq_requested = true;
>   	}
>   
> +	if (jack_data && jack_data->use_platform_clock)
> +		rt5640->use_platform_clock = jack_data->use_platform_clock;
> +
>   	ret = request_irq(rt5640->irq, rt5640_irq,
>   			  IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
>   			  "rt5640", rt5640);
> diff --git a/sound/soc/codecs/rt5640.h b/sound/soc/codecs/rt5640.h
> index 9e49b9a0ccaa..505c93514051 100644
> --- a/sound/soc/codecs/rt5640.h
> +++ b/sound/soc/codecs/rt5640.h
> @@ -2155,11 +2155,13 @@ struct rt5640_priv {
>   	bool jd_inverted;
>   	unsigned int ovcd_th;
>   	unsigned int ovcd_sf;
> +	bool use_platform_clock;
>   };
>   
>   struct rt5640_set_jack_data {
>   	int codec_irq_override;
>   	struct gpio_desc *jd_gpio;
> +	bool use_platform_clock;
>   };


Why do we need 'use_platform_clock' twice?

>   
>   int rt5640_dmic_enable(struct snd_soc_component *component,
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index 7b948a219177..ed9fa1728722 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -1191,12 +1191,14 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
>   {
>   	struct snd_soc_card *card = runtime->card;
>   	struct byt_rt5640_private *priv = snd_soc_card_get_drvdata(card);
> +	struct rt5640_set_jack_data *jack_data = &priv->jack_data;
>   	struct snd_soc_component *component = asoc_rtd_to_codec(runtime, 0)->component;
>   	const struct snd_soc_dapm_route *custom_map = NULL;
>   	int num_routes = 0;
>   	int ret;
>   
>   	card->dapm.idle_bias_off = true;
> +	jack_data->use_platform_clock = true;
>   
>   	/* Start with RC clk for jack-detect (we disable MCLK below) */
>   	if (byt_rt5640_quirk & BYT_RT5640_MCLK_EN)
