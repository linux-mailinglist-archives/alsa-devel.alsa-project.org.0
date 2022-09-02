Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8195A5AA910
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Sep 2022 09:47:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA11C1620;
	Fri,  2 Sep 2022 09:47:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA11C1620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662104871;
	bh=zsE8wYVh8AlDjh9PisMZmKbUdzOw7dnQsMSB3A7HtDQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IreCMntsOSiF75lkgNNpOYYaP2GMv3nns6Jchv6T6kC4/L3d6vrUhmzMSDtYzRdli
	 XMpxYMvGKsOzqnYbwYPQaBjKe91KGhonsbtbKvSvjDL4LiEtYeVWUM8FGMpN+yPhYy
	 OxECxIESlQhm9cnIxwf9azn2bnr8yqQtGRkSVvjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47DF4F8030F;
	Fri,  2 Sep 2022 09:46:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43A1EF8027B; Fri,  2 Sep 2022 09:46:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1207AF80125
 for <alsa-devel@alsa-project.org>; Fri,  2 Sep 2022 09:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1207AF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SsYH7ev0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662104804; x=1693640804;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zsE8wYVh8AlDjh9PisMZmKbUdzOw7dnQsMSB3A7HtDQ=;
 b=SsYH7ev0m5d8uEoH1wYXxaxlUHNOwMcUS8E2B3xakYTtckyHu2lQPUYa
 BJDD8hcP3DgRGaTQcIx7P0JrhjwkeOaIu0c8yQzTqPrpM91JqebR4x6wT
 cJW4urS+64H2I1x8C9yMl49Pl07CP3zDQZ4qt9VeyWguNDYRZsD/M9RD8
 8HIL/rC3IIG+GHEvNfGn3jiYQtqpaeMIr2zr0pxZ077eqVrkO6eFdmp+2
 nZgfPfKZTkwAQOrqXdXHKSvt54cnf2OO22qyO3nA+t2DGUWWKI3jVpbt+
 K9YhKsr6ZbXhhguCi4Q2TLmpVcFfCJJ3/Tu8hf+NIMrnNmPmyFf8sUrFI A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="282909891"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="282909891"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 00:46:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="941195333"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 02 Sep 2022 00:46:37 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 00:46:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 2 Sep 2022 00:46:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 2 Sep 2022 00:46:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7Vz/U6LxUELuTLx8bffRIkVgIWYDDkbVxWmuOFDrZDHXVquQadJXxdnKAaXjvyYrqHqx4Z0ZBT9QzcV6Q8i0iWLP7G0zZroxMgWlQO+FutM4OFoD9v3+JhV47gpoZEpBywcjyY/FuLETOZLZi9q3JgVVc19uSmHLM79OaiK0JT4mKoWA1XMOWiDJAHXw1HjGO3MNJ3hUKbEF3LTVFs7aXD/hnKMIpLfkgdb7WWiVgbZjvV65M9Ye+pU2ZIPSMtdlznBy5SDbh7t9ZwSg8eX1f59ybiY9TCImZnTqL90hagQjrcRrIyS3bH4Zpxqs+p/uIdyxnGi8tHbZ8noHsenWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xg+gjuTfs3tM9NcciF1Omk1E1EhBFptp8B67/CcWBX0=;
 b=bWBfCjfn8SrzyrJGrl1Q1y8Q0f1Z9QXB51MnDjjDOF4Dyrh2m3RExD7JgB1oYsY0kApDcE939WRpFiwap0H4IWji6rIgUgyjJLHHfHyP0m7SZtQtkmdted7OPcCu2UGPj1PYDp8IVOHpH961UreTE3BE/AnQ3jRkAuOEQf4zshSKdbI0ryeXPTsHI0uzxGBOOYgP9PU++IhJJHKsyjHRGbnQK3z3LG5T4PCKwdnUBwTayLb3aC4xUHw3yL2qFc1AI4wCkdIVwX85Od8CmK1Czeo8TQpuMjUzDIdr0G7qiv6/FBN2MiqAhTUq6thSnTIFopaI0viUOo4rJTHeGdZXtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM6PR11MB4315.namprd11.prod.outlook.com (2603:10b6:5:201::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Fri, 2 Sep 2022 07:46:35 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::f9e1:f470:f60f:fb02]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::f9e1:f470:f60f:fb02%7]) with mapi id 15.20.5566.015; Fri, 2 Sep 2022
 07:46:35 +0000
Message-ID: <e8a06f76-9414-6391-0582-667cf817dbcc@intel.com>
Date: Fri, 2 Sep 2022 09:46:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.0
Subject: Re: [PATCH v3 1/2] lib/string_helpers: Introduce tokenize_user_input()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20220901175022.334824-1-cezary.rojewski@intel.com>
 <20220901175022.334824-2-cezary.rojewski@intel.com>
 <CAHp75VfO7_ASHGdpkcb1dwvhyHPT31eYuAkCm2q7B+2WmtZC4g@mail.gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <CAHp75VfO7_ASHGdpkcb1dwvhyHPT31eYuAkCm2q7B+2WmtZC4g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::11) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: accdfada-df98-48db-792c-08da8cb7429f
X-MS-TrafficTypeDiagnostic: DM6PR11MB4315:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9/5iEsn1cOS0rAHVBE2aZi/9vU2b9qEJnWl4E/Qr3dc9otM4XSoFjLjlbQRaoDCCksQoxd9BC3Z8GlQ0npPaGGwnDFon6xYBbyI5vhgsHeWLPS17O/gk8Yo9iPWlKUyn8QuF1SIP+6Ht9vHSTq37/Z5QGf0lFCw/jNcXjnpq+AEJfUxoM1mNR1xIzShlOSVftWaHBegMC1+FMiubuE6Eb6Uy55K01BfB4qDI8Ef5drgbAqTGawzENe8RZ+RAomPI8jYzid6xx7n7fDccP7YNDbDxzzw/RMu7wMzJBg112RlIBIKdetAvjcWWQhpqmn0Xe2f3x6jLbROf3MwLTFSZUxjaIfA2Ff7Y2wOxOOL8lYHElzYvYKusOsaT7JCxxUKuvg/a3i1c2jwcidaSbIykW/PK9B/4APfybOmyq/UbG4nWBGX7x4TZhRi73K2WDqah5troJdJOHxaWwoNMSmWzxGUHapgH/cc7Wn+Swm2a8ktl8ZUU8nO4v7pE0PXVGa0P5cdh8/qILMVj14xMIAxajWV/MSuUKvz07XQTUK+b5PafRsC8ZhZ+NKifRDyIkqos0SKrvGBrwBqbbLujbywVbek+eJ+BkO+rtKCV9R+1qWXZWT394XS6H7jM1nTGKO04GkoPTD4SopNynbBncgUlhY7GyIcZ+NEwbGVB0HTPJwixCvoOfY7PILhqpPXVQghIWCGYUU5rF48ubUkhinQJ2O3mSO1nOX7oyKrTl0IaeQ5rOjz8Vg6ClVafgmMZ+71sSfm5E7/AJdFsoBPifaJEO4zG4nAtXkkao3aw+CctUNE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(136003)(366004)(376002)(396003)(53546011)(83380400001)(86362001)(36756003)(6506007)(38100700002)(31686004)(31696002)(186003)(41300700001)(2616005)(26005)(6512007)(6666004)(478600001)(54906003)(4326008)(66556008)(6486002)(316002)(66476007)(66946007)(44832011)(82960400001)(4744005)(8676002)(7416002)(6916009)(5660300002)(2906002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZU9rdEJJTGllQjM0NzFLWnFXcEhZeFQwUTM2ZStja0F0WUJWWFVNYzdYMFdK?=
 =?utf-8?B?N0VXNnNpTlo4QmhOeUZyQXZyNnZVdmxXSUVhd0dvWDBBMlIweFNhSVFxWWFK?=
 =?utf-8?B?dHBBUVAxMVNPQW01UWFlT2IwS2QxSTBsWWFQMzlWYnRsVzA0dk5ZUkxBQmJG?=
 =?utf-8?B?ZGM5RGY2QkRSV3kzZko3eHlPMUNDZ0RabUVuVkM4RDV2NVllUExGajl1WDZq?=
 =?utf-8?B?bHZvZnRuYysvdVJBVXFCMStSanFCdDBtdzB6R1JqTmZ3VG9wZnVWNjZMR3NU?=
 =?utf-8?B?ZGgxaXUyL3I4VGZXRVJlamk1UmdqWWFRUVJFRXBadUIxNWdnczhqZnJGYlB1?=
 =?utf-8?B?SXFINkVoRzd6endKM00xNXBSL0FlbWN1c2hHTk5YTDRTblFEdzZ3WC9seVV5?=
 =?utf-8?B?bUIwa1pTODNkZTJjWWFFZEgyQmV2RmlQOCsyOCs2UGdrNDlURmRDNHdkQ21B?=
 =?utf-8?B?QU1WR0dvTUc1WitkZTNTU0RZZllsOEUvNzlmUjMxU2NZZ29CWGtFYUFJYVlG?=
 =?utf-8?B?OXhwYnBCOXpZTnJXdGtBVWc4MWJJWTBmV1pXeGtsUkI2T2NKcXQ2bnphaWxn?=
 =?utf-8?B?c2RqYTRuQ0cxNzNZQUhsVWd5YVptL1ZjMTUvOElsTHNMVy8yN3grTytjb1ho?=
 =?utf-8?B?Uy91L0lFcUhDNHVueXFsWFhPQXp0ZmhEYWNGMGZadVpyNzBoVVlqQlZOUEYv?=
 =?utf-8?B?SWpDS2E5Y3dtaGw1eFZlQ0k2aEE2WEtmWG9xY3l4dXJQNFpjLzREMUh5ZHNz?=
 =?utf-8?B?MXluZFVpOGVMOEVKYnY0eHVGQTR5MFJIbVJRQXZ4M0FvWDhlanhYRUxoS0RC?=
 =?utf-8?B?SGxWbDlmQ2o2dTl1WnBoaExod2lSeUk5WVZLZmk1eFhiNkxCaHdNUDlKVnRp?=
 =?utf-8?B?blgvNm1jcER6U2FsSW90Zk9XaUtFaml1ekVJaDFZbnJJUDJkTnZWVDY4dlQ4?=
 =?utf-8?B?Zkc3ZzVNU3BSV1FjSG45REZsREF0SzArVkRXODBnVEVYeUZmZlVZaTBQOWJz?=
 =?utf-8?B?RVR4U3hhLzhVK1ZtSHArbUdNMmdNVTlMaVFCUm9VcUg2UE9oak9WQUlIckxS?=
 =?utf-8?B?aWtHUTNKbG9SVkVqSGNGUkJRZSttTU5HbjdjVnkyQWhxSkc0S096NUM4VjZ6?=
 =?utf-8?B?MGRGNkJBeDZJeldRYURNVG56T056RE9lcjU1YndoajVRSk1iZTYwT2ltZm52?=
 =?utf-8?B?K09DdWZjVkd2S0lQU2xZcnloUTRmSUFTZzJZM1JuVFBhcUJodDRJYmpaU1hz?=
 =?utf-8?B?QzZiajhENFN6ZVJlOXpzaHZ0a0t0RHZYK1ZSNWhWQm1DTm5Hck9kbDVualEy?=
 =?utf-8?B?UU1ZRTRZd2x1Ykx5WUZPclhXdzlnY0UyNlhzbXVXeEc2cGxLSHUralRnY0c0?=
 =?utf-8?B?QnlwMnViaUl4VDRqRlN5ajl2SGQ2MEpNTm9MYW5aZWZic1E4WVBDZFh2cG9K?=
 =?utf-8?B?NS9tZUo4VzNSdDdNTmZqc1NSbkdBd3FoWE5OcllsRWk4Z2pYMnVKVnNBRlhB?=
 =?utf-8?B?TThzY0xWVEszcUZnRFBUTkh2K3pCQVFIdUVyd3BLbVlaNEVsQTFTSldoS3gz?=
 =?utf-8?B?eHZocTIxdUhBeGVEUHpCeU5HTmZ0bGVzVE5zZ0JVRDlLNC81RzBydmlWejVM?=
 =?utf-8?B?dUhRT1dBczMrZS9HNHplYjJhSHltRGNxRDhPWDQ1NnlMNVZac0lRQWkrKzMv?=
 =?utf-8?B?d3RyTUl4cnB0YlZPdUNoUlVaNE9zQWVGUFRoT1BNdk9kTHpocnplR1BmRmhE?=
 =?utf-8?B?UVBPZXlqMnB3bWZodzlIWUt5djFPVHU2ZmNZakhTNDh6b0NCNzQ4TStFcVhh?=
 =?utf-8?B?SGhZVkJ6elFucUlRRVYwaHp1eXcwMytBL2dOTHY1WDVLSlQyTWpFUGJLNngr?=
 =?utf-8?B?VUtUSnZxUmVTQlhOdEFaL3UwZzJzdDYxRFdLU0J3OEM3SVRLZ05pV0tkK0xy?=
 =?utf-8?B?NnluVlZSN25QNnVQKzBXdmNqQ0dZN24weFZNR3owQUZ1cVdDQ1phc1hTeGpj?=
 =?utf-8?B?TklYWHB1c2U3SUpmK1ZSeW9XK1htSjlNbjVnY0J5ejZIR3Z4c2ltWCtHQVVM?=
 =?utf-8?B?czdYb1FUcjhVa1g4MXNkZDYyeXFxUXZYcnNQYW9NTEtFbko0dkVkWWZQMGJu?=
 =?utf-8?B?SHo3RXFNTEsxcHpUb0dFclRKcFdXazhjeE9YM1FMWmUwUlRyL3BFWUZPSzV4?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: accdfada-df98-48db-792c-08da8cb7429f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 07:46:35.3352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MV9LSzCb2zk/99kJEQszRqFlAFPSPeDb3vB5aTvb8kEaZoTUz8yRRf9xXxEuOdccb4Twh8WGGw2LhLVKEUklQiQxOqsVjH5UozxNK6CHTM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4315
X-OriginatorOrg: intel.com
Cc: Andy Shevchenko <andy@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Matthew Wilcox <willy@infradead.org>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 amadeuszx.slawinski@linux.intel.com,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On 2022-09-01 9:34 PM, Andy Shevchenko wrote:
> On Thu, Sep 1, 2022 at 8:40 PM Cezary Rojewski
> <cezary.rojewski@intel.com> wrote:

...

>> +int tokenize_user_input(const char __user *from, size_t count, int **tkns);
> 
> Not sure how I can deduct from the name what function is actually
> doing. Suggested new name: int_array_parse_user().
> 
> int int_array_parse_user(const char __user *from, size_t count, int **array);
> 
> (Note that we have _user suffix for many APIs in the kernel that does
> interact with user space memory)


That's why I've added '_user_' in the middle! Anyway, I guess the 
expectation is that it's a suffix - precisely at the end of the name.

Could we reorder it a bit: "parse_int_array_user"?

>> + * @tkns:      Returned pointer to sequence of integers
> 
> array

Ack.

> If you are okay with this, you may add my
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> 
