Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 071CD4BD983
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 12:53:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AC27168C;
	Mon, 21 Feb 2022 12:52:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AC27168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645444394;
	bh=/odUzzGEiGpoSirdHza4l9sFreff0pJKChd+cCbdWbU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rptGaDd9fR6yPVLuRIi/QB5mt5Q/tWr+M5/azNVhjUV50sxghkLWdnZSbRuZehL7M
	 p1nsSdmuUaTcruA3CQGinfVBI6+EVCYYyyOLlCwemzrWoTi1zuVVHRQaKJJOQroCqE
	 uodFvSbsyo3jgdEt1lltEcp4sqvW8w7E43A0cPO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCA91F80149;
	Mon, 21 Feb 2022 12:52:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26C08F8013D; Mon, 21 Feb 2022 12:52:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 675A5F800D1
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 12:51:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 675A5F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CT1Ovtmn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645444319; x=1676980319;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/odUzzGEiGpoSirdHza4l9sFreff0pJKChd+cCbdWbU=;
 b=CT1OvtmnlApNTE7KCHnjPvpmwF31NAXevINF7j8hY+ZATGZ7PPtmupp5
 t4emIsPFWu9+raQNESgvY4CzcUEQhNMCLEQHjj72Efu4RJZ87rGpME4H9
 RJekFf6ZlpjVZgUvv63Ilk+276EYegmvBUf3HPdeGQ5Gx8o4ZNyE/WSu5
 3u+/fChlOwdMn1rzFMT9KGVVag+T7Xx9wxIdbk+zFCA42LY75Fcl9Pk1f
 LHdCuu+6opwel5hhCjOYQGBZ/6i5SWdwRK6vPYJg4AhasByN2Umr64Q8I
 jzEVaT4aI8kAupzS75lFdutHK5c1r1vd5jHSKlnj7KtlavMPC9QfmAwwG A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="238909271"
X-IronPort-AV: E=Sophos;i="5.88,385,1635231600"; d="scan'208";a="238909271"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 03:51:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,385,1635231600"; d="scan'208";a="531829830"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga007.jf.intel.com with ESMTP; 21 Feb 2022 03:51:54 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 21 Feb 2022 03:51:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 21 Feb 2022 03:51:53 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 21 Feb 2022 03:51:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvVl70LvyemwlHnvMSpuArkEphdDt73V/d76Rg6RMkWKKavP5aKtl0uVsB7bHoQKftYI2u0C+p3/oe3L2PsCBEN0VbZNTSGVaLG1eY6cL71RvzbaFrQn3IOE0bRtqBrD8ADXFLOtaqE00jj5U942MDuSoSSVZ7VRWwxNhEJMk73+9q9EJm0TBZAywhqZd9n3cRScWYkq7cReABL22nhOUIN65Sn3sw3TdkbWJIhAsGE+JWB/WAXItAGsQUHJOKWs+tPU5u8Uwaa+zYkcL7HN9Mp/0iRXlxsecyKP+zhK3iF7mJMQz4WloDq2zvQJlk+4GcaWDfsUEepF5xpYBfnNRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGfeVuddSRWzZprKww7xCTDy7Q9XSUJw18nygA3yZI4=;
 b=cZMqNiBgSF5gNR3EmbZNWAN65dZwKvHJdpie0+iZHaQXVym/jh8Rodrb5gqVZz8DCPFxVkdJburcSkhQehkAz7SaEmYDVgSaV1iOY2RuqYTejiExT+Mq35rrrue+397s0GDHa4MjLVPVtp2HULuat91yZF9bPSMr8hGu/VMuDcUI4ZgCLX4AcBSMKxid4NqA58fJ47DL7VpUJrw5ptLnA6NRVvMWC92HUYLkluG7KocnhHVfnXtotWZrHqWzRZQrALYKgOUsanF9tCqTZSSe0EkfVUHBK+k6v7mHRkCVgmJn6kYYbeljBnYQFnrUDSxUFxy/j9p2tI48iXup8yjgyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by CY4PR11MB0069.namprd11.prod.outlook.com
 (2603:10b6:910:79::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24; Mon, 21 Feb
 2022 11:51:52 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 11:51:51 +0000
Message-ID: <e423cf1f-9f56-3929-fd05-6a82ef8b5f8f@intel.com>
Date: Mon, 21 Feb 2022 12:51:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 00/17] ASoC: Intel: AVS - Audio DSP for cAVS
Content-Language: en-US
To: <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220207122108.3780926-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0516.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::9) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21174eb1-7ea2-434c-337e-08d9f5308c54
X-MS-TrafficTypeDiagnostic: CY4PR11MB0069:EE_
X-Microsoft-Antispam-PRVS: <CY4PR11MB00698F0388D37CCA4CC42296E33A9@CY4PR11MB0069.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6rVVTpVKPwK3lv4E2OcNO7FrA/iwj1au/LWlpQc4B2unIEqVUha9k9qFtfvTUAxgID3skZoukbe/gTw9q1ihb/COZZHocCOQ6aPBCEleLQn9i4Z+hCZgGivic6NYNmwHx3fd8SFoFy2OP5bqyESRomSd/aCIrytheBcEqHJ4GB9TjctNiRWe0gkuv1lCNjaeEuXQF9ZLDofCRJ79DRTsPpZ0idFJzKjaE/STvxyygKOvaSrRaGYE1XMmIqMDvqbtcuDN/eUnDRrv3cc6U4my/vWa7B4//wvjhCD4Bzg6JcGW16MCVbmjlau1fQPbyzB5x558hDUrLqENoK2oMknIdeiuOWGVo9EranJ+2/jpSdlGrOLdk8v42uOKDjmjbWXHEWidQWr418l1BGUs17boOVApmHD043LWJCksX6wwBFhY5vHp+c3tS+nfKlEqsYBMN+ic8AbE3Mb0vgzWGnn8ZMEp8CJBTLhmXb17KpbIGS5eOvCfFF0EnBu2xTdKeyx4XsTtydn33Mlw18cAmR/TD7alrwF11SSdAcuu1sHsIdKtu1MJl1QS6YsP29/Zhh0K3jDwgMvzX/trPAlsOsn48/WZ6aq7w0oHP9rSqRJkXgFcTZ3YbP0x60tP8YpgWScPkqd5VsKW6MhdI6FGRJjkpa3RcARR4SuMQiqe30YdhwB/YLY5QQUqIA4yb3x3z43RUr/rkU1W8VRM0UZkT3LXKXPS7MM2+A8qz/cpedoY1p0D5rbZs7ho/2UrsFwm+CP9zSnYD7RCOwpULiD5z817UZHYan3Fn3K1Q32wjpAKlKmN9FvfxFTC74d4eP8v4L2dYjmWIjciQheT75cB+dDhc4uUeaDYFYOdQDe91ECRTuA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6506007)(53546011)(26005)(38100700002)(31686004)(6916009)(31696002)(36756003)(316002)(82960400001)(186003)(966005)(86362001)(7416002)(66556008)(66946007)(6512007)(6666004)(508600001)(8936002)(44832011)(2616005)(83380400001)(66476007)(5660300002)(2906002)(6486002)(8676002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3EwbkcrUmk0ajZuczl1cFY4a1h3aGRaOVloYUVGWlVrS1YwNk45S25uaVRG?=
 =?utf-8?B?NnkvejlYeHNyUStyNUZkT3RWOTk4TTVCZ3pRTWsyR3dibG5va2s0d2cra1g1?=
 =?utf-8?B?SHVEWDUrbzQ4cTMva0xMWk1Pdk01aTgrRGEwRXV6Q083WURzYjlJbmFRcmtr?=
 =?utf-8?B?YmFJM1g4emRZd0JSakN3ajNLTnI1MFVvempadzkwaXhKWDFkSUJVcHVCSUp2?=
 =?utf-8?B?clYzTHg4QmJRSzltaUdSZFBTQyt4a0hzTWVjclY5YXV2dE8zVVQ2UkhxRlhn?=
 =?utf-8?B?V01RTm5pSXl2elgxSWdKa3RjbVVzbWFOdEVLVjMwTCtnNFRJdFZFZDNHQUU5?=
 =?utf-8?B?eHh1aDRRYlI3Z09Ebitrc0ZSaXMxVVJKcGtFVC9iL3BXcmRZODhxcTJvbXZT?=
 =?utf-8?B?eG9wWFZIVS92QjBUTDZ2OGJpN0I3cEJMNzUzbGgybVNSYzFBZElXVjd2ZmJD?=
 =?utf-8?B?WEVDYURJRVpISEdNQ2ZpdzZjV01zbTFodUZONlBQZWF2bWd6SkZTVVZHVnhD?=
 =?utf-8?B?VW55dTNvcTE2bWtTYXZ1NmJidWl1UWpHZ0ZqT2ZiVUlaN0lJWkppM05qRGVV?=
 =?utf-8?B?NzM4a1FlcldqajFJRTdiUFhBTGFINDh2WDFjNVEwOVBySWZPa1Y3K1NmWlAx?=
 =?utf-8?B?QlVDQVRQcFB4ODZrbEFCektDRTB4aXdYNzVjcmJTQXN2cVcxcitzMm9PQmNK?=
 =?utf-8?B?d2l4Y3FUN1k1ZzR6T2pQV0xOY1BUZzg0VVpkQWlYdiszMzg0Q3Y0UkZNakdn?=
 =?utf-8?B?b3ZXc0pyQXJuS09MR0xxWnQ5eU9aYlJ4Z3RIbDYzUjU0SmU5STdlKzBTeFBz?=
 =?utf-8?B?NkJUWExtZHVSYmZGZ0RUOFVhT1JYNEdTeE9ySGJjMzh1MlduYW4vRytGTXdu?=
 =?utf-8?B?YWZtTnhUbjU4dTF5emoxNDE2bSt1NkVlT2g5SDM3Mm1ON3Z3aGpjanIzRkFJ?=
 =?utf-8?B?VzFqdGkrMk9pS0VNVFlleWtvSXJCTmxNSVN1Y3hzK3VzajY4Mkc1VXllTDdN?=
 =?utf-8?B?eGtOK2s4M2VoTFY2a1ZvUUJyY3BWbE1ydFpXK3NKY24zNVIrWEQ3SkExZytS?=
 =?utf-8?B?MW9jODl6MXB0WGRvd1pZcVdTejNKV2Jobm8zVDExOFZqQnlWQ0g0MGc1dVRm?=
 =?utf-8?B?NEdHUGJQSXV4Y1Bmd3ZqanBTYnQ2d2VqT2pwMGVDeDJKMTlNQzNBbENhcFUx?=
 =?utf-8?B?bU1MMFRCdmNlbVpncFROMmx6eHMyNlZDVWQxcXI0VzQ4MUFHOGorcytUejRm?=
 =?utf-8?B?NEpWYkJWQXhObXdPNm91d2tFMWNsa3BiSmZBRDQ0ZU40TGxSVDliTi9hL0to?=
 =?utf-8?B?Y1RTSG9GM2k0ekVyWnFoRHpvWVFPeDJ5N2lKWTA4NWJjOEhnNmtaelE3ZW4v?=
 =?utf-8?B?WVdNRVBpODB2ekx5eHJwMEl1alpMOFRoVnJiSzVBMnhVS1JpNmVhaDJLdERK?=
 =?utf-8?B?S3l0TFMyVjNnSjhqV256bDBnc3NDVFFhYUt3UDNLeW1VVTZQdmthT0FLM3Ju?=
 =?utf-8?B?aWxac28xaWdhdW1oTVJ1b0l3NTRGTW0zenNlTEFRajFDU3VKWnN3U3FCdHln?=
 =?utf-8?B?eUxZeUd1SEI4RnVWdnVSZDRlK3hCRTFsSE5MZUw3bjdIelFhS1g0eHpyRjZS?=
 =?utf-8?B?b3h6S2RLWDJFVUxhZEppSVZBa1MzU1I5Ym5CNHZTOGEvMDBKZ0NyVWhWZVZ2?=
 =?utf-8?B?bVBBMy9jREMzQStReHc1SDN5dkFhQmpUTWxWWXFub3NGWUxOdGFKWm11OTFC?=
 =?utf-8?B?c1p6eU9rKzBEdjVMVUtQRldJL09jOEtzT25ueGwwWHA4UDhhZEwrZ25YVWUy?=
 =?utf-8?B?bGpLYVpieDAyS056NEZFZ1MvNlRCdjNXY2JMUUNPQVRrRlNaNTdPK0Z0bjU4?=
 =?utf-8?B?anVrOVRQc2xrSGw0a1FXRVZtTTZTQnlEUUEwZGdkSDdKWlk1dnZoME1SR0JT?=
 =?utf-8?B?ZkJWc0lKYnlYZkNFV3EycU5heWQwWDFybUU5V3c0eVRUaXJzL1oyZlhNNnRz?=
 =?utf-8?B?NGl6bWY4bmc2dzlDSWo1VzdNYnErODlnSjlaaGFhQUU4aHY4RXVhNzFVU2Jr?=
 =?utf-8?B?Ym5YNDloMVpDWGxXVXducmV1RmxmZy9rQnJKdmxzdFAvc29zL0NBNi83MTdV?=
 =?utf-8?B?RDhLLys3Q3pxK3YxT3JVbThiYWFzR2R0cWFydnFKdE5pcmUyN1QrVExOODVs?=
 =?utf-8?B?RGdwVXkzYkpTbk5NT3Q2Q2hEVVhxOE9DYUZsUFB5Z21uN1RWRktIc3daWkdS?=
 =?utf-8?B?dFhRSG1mRFdFUXZqcWljMm1qeXBRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21174eb1-7ea2-434c-337e-08d9f5308c54
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 11:51:51.4793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7YVCH/NzHq7zfPziWmNTikbSo6bm17USXNNfFOoXcJAYAQPFFa6R5D6xe1qLWfhud/onSe70rAYichnkeIK0RiniWGlNo4oggATjIuNfQS4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0069
X-OriginatorOrg: intel.com
Cc: rad@semihalf.com, upstream@semihalf.com, harshapriya.n@intel.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

On 2022-02-07 1:20 PM, Cezary Rojewski wrote:
> A continuation of cleanup work of Intel SST solutions found in
> sound/soc/intel/. With two major chapters released last year catpt [1]
> and removal of haswell solution [2], time has come for Skylake-driver.
> 
> Througout 2019, 2020 and 2021 Skylake-driver has had many fixes applied
> and even attempts of refactors as seen in fundamental overhaul [3], IPC
> flow adjustments [4] and LARGE_CONFIG overhaul [5] series.
> Unfortunately, story repeats itself - problems are found within the core
> of a driver. Painting it with different colors does not change the fact
> that is it still a house of cards. As changes needed to address those
> issues would make Skylake solution incompatible with its previous
> revisions, a decision has been made to provide a new solution instead.
> In time it would deprecate and replace Skylake-driver.
> 
> That solution has been called AVS - from AudioDSP architecture name:
> Audio-Voice-Speech. It is meant to provide support for the exact same
> range of platforms as its predecessor: SKL, KBL, AML and APL.
> 
> Note: this series is dependent upon HDA-series [6] which exposes several
> codec-organization functions allowing for reduced code size on
> avs-driver side.


Hello,

Despite HDA-series being updated to v2 [1], no changes are required on 
the side of this series.


Mark,

Should I resend this one regardless of the above?
Also, is there anything else I can help with or explain further 
regarding code-loading and IPC protocol which this series implements?


Regards,
Czarek


[1]: 
https://lore.kernel.org/alsa-devel/20220214101404.4074026-1-cezary.rojewski@intel.com/T/#t

> Note: this series does not add fully functional driver as its size would
> get out of control. Here, focus is put on adding IPC protocol and code
> loading code.

...

> [1]: https://www.spinics.net/lists/alsa-devel/msg116440.html
> [2]: https://www.spinics.net/lists/alsa-devel/msg116901.html
> [3]: https://www.spinics.net/lists/alsa-devel/msg94199.html
> [4]: https://www.spinics.net/lists/alsa-devel/msg92588.html
> [5]: https://lore.kernel.org/all/20190808181549.12521-1-cezary.rojewski@intel.com/
> [6]: https://lore.kernel.org/alsa-devel/20220207114906.3759800-1-cezary.rojewski@intel.com/T/#t
> [7]: https://lore.kernel.org/all/20211208111301.1817725-1-cezary.rojewski@intel.com/
