Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACF5521362
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 13:15:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06A4D17D6;
	Tue, 10 May 2022 13:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06A4D17D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652181326;
	bh=Gx4haH9zw2HfPhgdjr92r9/kobWFMqn0SxjdEgExGeA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EuJO7DbP64s4T9aKGK3oxjLpYE1Lt2JA2ovtQFWIexGMBSJCIvw22oBcpCwOPxHvo
	 TTUZUrK6Pnho31SRjZv5y+chKgtMzDHRL67c//cf5mZS1nAD32SrcD1VgmRUg0+QJB
	 ni9KwGdmnjqon1ag24DTleNzBZQP7lCJiQznL14g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4388EF804BD;
	Tue, 10 May 2022 13:14:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E244F804BD; Tue, 10 May 2022 13:13:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69880F80116
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 13:13:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69880F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MxxCSxmj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652181233; x=1683717233;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Gx4haH9zw2HfPhgdjr92r9/kobWFMqn0SxjdEgExGeA=;
 b=MxxCSxmjXQ5n5ShHn9q9Ignty2myRh1aoK5wN3q6bKnPO3IeIKXCN06/
 bAffqS+Au5y1N68UhOcPJGRZz0OQsyXz3tKza1tXc50mFZtT6zC9e3bgC
 aL8jIeljhR0c6TcZhCMlStjlg7LuVGg/b6Ki6OQotDMqsw9oXdJHR5LTi
 Mr8bJDTqONcvHSS0Y4ZyP0RFL+nBEjs9mE2KzXele0OcYjbS7w/13eGch
 PS10Ow1xuV9Gl+j4yCIXEMFPuCe/oeGb+aBSmcJRb6iOTzvMgQfA32lpO
 fKyZyQAWwBBklxbH6VsCfDvSMxT8/yExTCuDKAI7wFNMyyQKJDWldaGsJ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="268181153"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="268181153"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 04:13:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="565598672"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 10 May 2022 04:13:33 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 04:13:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 04:13:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 04:12:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y45LipYA4N61kjSxVh6T6mV4LpBldQMYQnLnXYV6EAqibSx7EGSJjI+YWEST+IF5Ye8F5kFQ00XbvcJWo6Lr1oShBPGpPorTknGCpE+lnQQ/XzMDgq0jVlDyI2b5WODp/dYHzgTP4cLKLU3ghWzBrYjuiAyYR8Umsv22c73vR2ke9zuskfFS6Oqgc09xXuEOT0TBuX2d3AWFhT54tLIJvB9HVPChwv2v0xybpwd6LgroYZuRp6ImDUQQeGgY6of+G3BxTNlmv7zLKIGOqWEAEkRhJ7cdesAxiSOVXSGxJTiaL3W6xgewbw5542CInPqGgGR2icELRFIM91YzEBTGiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EU10gbaLvZJFZ08p9HTGmeHPzfvaix0UEBiKW3r4VmQ=;
 b=aAnnIc0EMiGkOkGZM5Un2iUaV8IFEg+S2O5PDPXlsLGwriQTYwpAh7v+JttZ/zquo2L4kRMbWpviMKzChCnSudCdRtWZQ55kV++epuZpE+vDRoAY79Ug85yNI6AG2zpOqk4kt1ltJSfJA6riIULSNCIX9I4LVlIrMcoAlKZGkjV1QMm4GG1u1LZD5TWc6LUW78EE48DUQJQoFR5narzYCBUEFOkre4hbYwWc7t8M9i43KXRtfGa1aACl05G3X3GLzB4Om2CDD6e3zxBApGNVLLWtX6V3q+77fiLvPIPVuT9i+KZn+rBq3rRLzrg+VGdzhPUSk7Go+A2gkmZW0NosxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM6PR11MB4297.namprd11.prod.outlook.com (2603:10b6:5:14e::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.22; Tue, 10 May 2022 11:12:56 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::7910:3e1e:c6db:8b41%6]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 11:12:55 +0000
Message-ID: <d5966845-f2b7-f949-a992-f05ef59fa628@intel.com>
Date: Tue, 10 May 2022 13:12:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.0
Subject: Re: [PATCH 05/14] ASoC: Intel: avs: Add ssp-test machine board
Content-Language: en-US
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>
References: <20220427081902.3525183-1-cezary.rojewski@intel.com>
 <20220427081902.3525183-6-cezary.rojewski@intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20220427081902.3525183-6-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::30) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f606dd07-4d04-4ca1-526b-08da32760872
X-MS-TrafficTypeDiagnostic: DM6PR11MB4297:EE_
X-Microsoft-Antispam-PRVS: <DM6PR11MB42974D0D51003B22E90054E7E3C99@DM6PR11MB4297.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tcZXkSJb1PzWumq2DLrPfTRTovabDajmSjwSWQ+VsJDD8YURYBq0OBWsogpcSYBg7fuGXsEQ/74U2tWaaVFLrJepJxgyD98oKPjFMzScdCQDgVvO5+clpCCmpysZeRW2b12uWLhMjZgImzknVBZj/UOBCs7Mq3kndynhR/uXTq7Gj/ikMhr0hoeN/kU1r2m0OsnwwWipl00p5yUZ9NIrBlBwVFejCUorMKKLXE2pJmmNAIBA7/cCRsE5JWkSRTlTjg9o8SjT33CNk2p5OeGvAgzQXHAGqOUr90WE8BlliW0KmA9A70imkVvqXzc5oBSi3OZ5k304Ka5tQEAw5k5QcTdLXUC9ohUHJev2blYlfnFB7kVAumM/gINwca8GH9CC5hfF3NxFexBVTGhxR33Q0J7eII3C59fblz1TNhSIm3atbUKzKNytR+VOm0XtVsqLXSFyFCx0SDZHX4rEF0xRk1blT94HlHRZHqB+FHgsNMRn4ATH6l2oD3bxu32W3r2TNzVB8jNPfWEHN404sCg3khlAj1DEMiBviRbBgAG1mfbqkECjFPxzmgXvcAnAmbc9qFaiZgD7sclV/KIFtOYsQvQXusm4itPiiO1Ij0gO+iV070atawF8NdBINt+dHysgCJTua8tBsoPNUd2ZcP0J3TNrJ6XpjEs4dDTI95z1SEleaiVNzYeg6OHT9dVcanpSfmGnoP8NjT8FIjGdLEjldn0O30fhczNN6QSru/lq9Bc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(66556008)(6512007)(8936002)(53546011)(26005)(38100700002)(4326008)(31696002)(66946007)(86362001)(8676002)(6486002)(7416002)(44832011)(5660300002)(4744005)(508600001)(2906002)(2616005)(6506007)(6666004)(316002)(36756003)(82960400001)(186003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2lTWGR1WS9GMDI4d0pEck5RK2ozYWo5clF5Q3lyZDJSTGRsRDRGb0x5VDRS?=
 =?utf-8?B?K3NDekF6aFl4eE04aTcyei9xdXVoeklPRHhxcUJ3eDlaaFlvUDkxK25MWXRY?=
 =?utf-8?B?RmhTQVkvOHZIUzN5eGdBWVNjNTBrbU91KzVNWmdMZ2tzd3pNandaU2ZXWCs3?=
 =?utf-8?B?MnVNWFk0cHRXdVdLRm1RWkdzbHRiYUpOOTlKZzJmRWlLWGp4eFlCOHdPNVc0?=
 =?utf-8?B?VW1SWHI4QWEvZVhPLzJ3NTErWUJNR3IvUWZNdDg1K2dYQzVhaUNDZUVUbHoy?=
 =?utf-8?B?N3duSFNwVEZlalY2TVltM3FGeUk3Zk8rREhQUStKQ3pRdnNvRG9CR1NZQmtr?=
 =?utf-8?B?dlJaY0ZySFNtbFdaTnowZWJnNjVvQnorRDRQc1ZJOXRySVNHTG1NRUdQd05S?=
 =?utf-8?B?Skp0OS9SckpDbElJN1ZHVWZZQ1JGQ3gxVWZGNmdpcXZ5ZDZmdEVSNU9kak01?=
 =?utf-8?B?TjlLeGtEQ3dkZ2hRSC83T2NsRXNWVFQ1OC9sV205d2NqcUg0T1Z3UjhpQWZC?=
 =?utf-8?B?a1ZuNHMvNVhDZGFEbXFSazFYMHJlWEtvdHUrQklLdW01MGF2SjFRYXJBU2h6?=
 =?utf-8?B?M1lJL2c3QzZPdUhvc1N4NFZNVG04ZE9wVS9rWUhpWTJYTE9hK2VLYkQ3alRM?=
 =?utf-8?B?YkMyS3ZNU2ZIYXh3RHgrZVZzakxHaFZNbzdJWFpvbDZ0czFVWU40TDVoRDM3?=
 =?utf-8?B?RDlSWVVLdFJlNGY3blRYTWZ4T3EyajFXL0h6a3JGMTQ4eDlNbWhBWHpMWnRS?=
 =?utf-8?B?a3FPQWl2Z0VTMVV1akw3RzAzUmhKWHJxTDFVdjAzMkdVbklCNDk3T2xBSWxz?=
 =?utf-8?B?MSs4czJjWWN0TFg2Q2NJMGV5YWZMTzU5cHJvbklEU1A0L1R6TGxMblhhVUhk?=
 =?utf-8?B?SS96aGJ1Z3NjM2wxQVVUMUpXaElzRG9jU2ZET2Njc0cvVjUxQk80eWVkTC93?=
 =?utf-8?B?RXpSbFBrTjlNVi9WMHBRV2d6SzhlYXhSbGk1RkdYNHBFbHpNTFJmS1JKNGpi?=
 =?utf-8?B?ckpScjdHWDhOK0JrTjc5RllLbUZ6ZkZmQjZ1UU1abkppNVVTN1MydUZ5T0xD?=
 =?utf-8?B?NFlXZ0FJMDQxUU9BUlN2VlREd3NiMUNMc0kvaGloUHpvejJja0lueDBNUXFa?=
 =?utf-8?B?R24yVGdGaHR6d3B3MkkxbzZ3aEVnUkRzNkZUaVJRa0lHZDMydG9VaENQS0ND?=
 =?utf-8?B?TnFMWFZkcUo4SitoRnZHZHVXVkZENU5tSm9CVHhkQkRBRjcyNGJBTTdhZmwy?=
 =?utf-8?B?MmF0WWZlSUlkT21ndXJIWWllREN6UEMzcmJMTDVBNXF1MFNDa25XbDBBOEFp?=
 =?utf-8?B?MG56ZmFoWFcvVmRmTHlGemxXWVYyU0lreFZITHlnVWxsMHRpQ0J3WCtsOEZv?=
 =?utf-8?B?VERKbDVtL01tUjZSeHVOcnNzSllnMnBSQUpsd1V1cWtUSWk0RUkzeDFCZFN4?=
 =?utf-8?B?ZHVST0lXN2ZJOCtOcDJCaW1mTVhJcVRFdlFNcHlPbmVOT25vL2czN1kwcjRY?=
 =?utf-8?B?bG03eEpnWG9YR2xvd0cyTzB3dTVmd3hyeGpuRnJCSjhQbDB3dzgxSFYwam9o?=
 =?utf-8?B?Q3RtU0Q1cFFWZDJtY1BUdS84Y3hwemVzcU9KcHlFRTNBV0c2aGpEeVJrMnZU?=
 =?utf-8?B?aGM3TmZoeFU1Z2Iya3JVdGhhR29jS0FMY1NoYllJTmxPNmFkdXFUYUJzdGM5?=
 =?utf-8?B?UzV2MWZkZjJkK01LZHNhZW8yVTU3MDJkcTU3Y3NxQ0pDeDRCd01KM2twekll?=
 =?utf-8?B?YXltQnBLM05XSk01WXlhWVNmdi9pakY1NzZYRHI2clE3VVp3aHVtaThJYmpO?=
 =?utf-8?B?ZitwNjcwbjhTa3BjSEFEOHQ0TjQ3MWVSUkR0dFpaSkRVTVJqSzMxekVsVE1U?=
 =?utf-8?B?QUE4N2lPV0lnZWk5c01BdmFhSm54U2JON1NWU05RcmJUUlgvUGJDMVkrUXh3?=
 =?utf-8?B?WDBtdW5GVzJkS0tySzkxcXg4blBucE1BYkN0SjdrWXY5NnhsRjJwdGhaVDJN?=
 =?utf-8?B?cDNTRVZXdm1VTWdqU0tvcGo0YllUWWRnK3NUaC9GMGtTbnlSRXFLVlNsK2NP?=
 =?utf-8?B?TGJSVUs1aXIzbkFxelNqVVpJTlhuRVdYSFNLK29RcVF0VUtJQW9TeTJVQk1X?=
 =?utf-8?B?cHNpWmtTMVc2NFVpU2JmUUNiejdjRkR2MUJvQ1FQalZjMHNkckFac1pISS8x?=
 =?utf-8?B?Q3REYmU0NGtiZDhDVHVubUxIZmRtTVZsRGM3amlJbHFBMUxnRitQYVpzQ0VQ?=
 =?utf-8?B?RW1iR01DblArcTE5L0lLTTJScERkbEQrT241d2JTUVNjNUhNWGZyUjFBdFlM?=
 =?utf-8?B?WG9xNk9HVFpYMVViTlY4RVNLRWFrUm1RcFc1cG1Sd1hMSlJhU0RYbmtUay9F?=
 =?utf-8?Q?n3TraGoJCdBKvyTo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f606dd07-4d04-4ca1-526b-08da32760872
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 11:12:55.7304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhQk5TQTe1wTUQhTGA/1yBuhiRf+0hTeZCywCCWhBQzNAaFb01P7CjgWju4FyBsPk8+2ur1U5ihmo5DehPE+Ou+Ta1tUdDZLTKe6+989cKo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4297
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
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

On 2022-04-27 10:18 AM, Cezary Rojewski wrote:
> Allow for testing audio streaming over I2S interface through SSP-test
> board. No actual codec is needed here as board is intended for SSP
> loopback scenarios only. One playback and one capture endpoint is
> exposed per SSP port.
> 
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>   sound/soc/intel/avs/boards/Kconfig    |   6 +
>   sound/soc/intel/avs/boards/Makefile   |   2 +
>   sound/soc/intel/avs/boards/ssp_test.c | 178 ++++++++++++++++++++++++++
>   3 files changed, 186 insertions(+)
>   create mode 100644 sound/soc/intel/avs/boards/ssp_test.c

I'll send v2 later today that renames this board from ssp_test to 
i2s_test - so it matches naming convention used for all other boards.


Regards,
Czarek
