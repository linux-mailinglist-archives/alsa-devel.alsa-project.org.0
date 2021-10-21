Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B479436AAF
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Oct 2021 20:40:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFB9F1688;
	Thu, 21 Oct 2021 20:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFB9F1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634841611;
	bh=ctVfsrWORf43OMfCuiliZQNj/ncDyESnOyF55qTKZPA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MqJzhUjJN28/NnKDrG/Z7JJq2w/fly/5960iHCwFtqrzege5e+KKyLGC2O0Tey1ew
	 q5EoXXETA7bmVScqGau/NK+DRLNU4AgmjPrlADQRcHo9mqQyY2bWYGDCrZXDFVX/P7
	 agGEEtun8qUbSEuwzLyRPAwbblhXfFdS1ctxts4g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B131F80256;
	Thu, 21 Oct 2021 20:38:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5935AF80254; Thu, 21 Oct 2021 20:38:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B754EF80246
 for <alsa-devel@alsa-project.org>; Thu, 21 Oct 2021 20:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B754EF80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="n5rrRg3m"
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="292572126"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="292572126"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 11:38:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="534407606"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga008.fm.intel.com with ESMTP; 21 Oct 2021 11:38:49 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 21 Oct 2021 11:38:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 21 Oct 2021 11:38:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 21 Oct 2021 11:38:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 21 Oct 2021 11:38:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzFTA1rirK4zIFIzV4XSnfVdAKYYJwBudIRb6Kyo2+YiszXc7V9vrPVJgVlI5FgksPMgWlm7xKjIdBZTy03U+IY44BQtamAz66hr8BJKVVZE3sw094uSxTi85otwKM/+rVlWJQ/HMYgr7xpNLph/v1Wiq4EukZKVG7j57rYDRyi9OyEIvpXDnJG+0leVyXp4CPfh7i7P/HhobLWu2AWhrBKkUWT5aiaYjXLIop9sw3jgcI4mXriSPsIpYewxbToNj8EzAgRXDsNKw3p+X4F7WAgZvaEXmCvihxXX4O0G9o3dV0nzHA9v2LhvmWJ7NSJfGF0hkIKj+Yhrz3wukK7eEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=we6wHwTBaPsVGKhhogtmH/AcjedE5f6Y+eMcrXzVyRQ=;
 b=TKkEJTebho8R5eOf5ewKkTpiqMf7Nf+CIZT4mRKdlYyuRvyH7GJEp7eufnTFr16b0DEQzANg0lsGmfwm0ldvyPC82EI2foO0leJCAyBCB7b+BbmKX2wmttE8Da1wn4WAtMimx/OErQvYMNCxmWQ+O8JBixGVIRydve7NhT2NGifHtSr5pht8bhlL4eUltH8EFwsJC2hLwxG751tuV7usvQrSLTW0vFQCmj/R4PLQIE7w8aGwMrmEWKf5z1N+xEfHrP6EieZJU/h1tV2FE5Zmzv+PO5b7hjr7U84A2mw9MTLWz/Z3BeQEtR50+0vZQLjo4cNvBr9FVQVSSk/pd7d5Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=we6wHwTBaPsVGKhhogtmH/AcjedE5f6Y+eMcrXzVyRQ=;
 b=n5rrRg3m5+PD4HTtAYSY/K75nfBAWEz+eADqxhbEvN8PYMgsyYcHQ02D2Hx1STPMe1Qs8BFhuWbIvpyTYQp+jF7grWiXYMGdhWC+oOZ2sUrMiYalixkxeRyZlavH63HaWo3ECFs7YUKs1uvlpiniyRMhefjXNqcMfFzskpDvsy8=
Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB4049.namprd11.prod.outlook.com (2603:10b6:405:7f::12)
 by BN8PR11MB3665.namprd11.prod.outlook.com (2603:10b6:408:91::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Thu, 21 Oct
 2021 18:38:40 +0000
Received: from BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542]) by BN6PR11MB4049.namprd11.prod.outlook.com
 ([fe80::2091:65f4:8530:1542%6]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 18:38:40 +0000
Subject: Re: [PATCH] ASoC: Intel: Unify HDAudio-ext bus initialization
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>
References: <20211018192134.353931-1-cezary.rojewski@intel.com>
 <alpine.DEB.2.22.394.2110191203390.3554566@eliteleevi.tm.intel.com>
 <4bf04607-0779-fe47-61b1-1780ab1a3d20@intel.com>
 <25811f8f-c7bc-89c2-f616-4102293a2deb@linux.intel.com>
 <d8b90004-6c64-8cef-266a-17b2a4a480d7@intel.com>
 <569f6bf6-c346-3059-fc7e-e8c46c7dc4b6@linux.intel.com>
 <994c6339-6f67-58e9-77a1-a2faa20ade72@intel.com>
 <857438fc-1d63-84a8-f42a-79b082297035@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <f9320fb8-4609-8399-9b57-440f6cfd48e3@intel.com>
Date: Thu, 21 Oct 2021 20:38:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <857438fc-1d63-84a8-f42a-79b082297035@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB6PR0202CA0019.eurprd02.prod.outlook.com
 (2603:10a6:4:29::29) To BN6PR11MB4049.namprd11.prod.outlook.com
 (2603:10b6:405:7f::12)
MIME-Version: 1.0
Received: from [192.168.0.164] (89.64.111.235) by
 DB6PR0202CA0019.eurprd02.prod.outlook.com (2603:10a6:4:29::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Thu, 21 Oct 2021 18:38:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e064bbb-d395-4f71-b36d-08d994c1fda3
X-MS-TrafficTypeDiagnostic: BN8PR11MB3665:
X-Microsoft-Antispam-PRVS: <BN8PR11MB3665B99BFAB1779BE051B40AE3BF9@BN8PR11MB3665.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BbqGJy6NZaydMhF4zr+jlXlO1i1hUyEh1nrLGqq5EY5UwGYGOcS3yQstHMJ7GYpxREjSX6QQnQLhPHd5UFG5mKfI2NLJQiXV8Lfkc+ipfg0SUkBMEwIiqdED/Eb5umRZAPLl60ACly1P72Bfswq7IhgzZ5qL/B4zfUV6+s0dCmicOYf4tunrPH94y5F56bst9tctlx4oLX+k++Kz8xFK5wWr8uH6GLfG01s0tJqOqEjxpUM28meLwT83o9O6/97iHkNKrK8gw1pAATPtSDwV63+y0mx7B/rjh2NzsicoUupJwockesP0ITB7KrvJGxEYG+GUjNaq5iiJ/UAqzFzXm7jKFskHNICmBMSMItDQREuVYNLl6bIbMgyySkaUxstAHO0N2pzqbQVavE3KarodeiA3nKsAbuWXlVUfCiH08th4iNpbtQUXNpPPe6dibaiDe4woFqI9TeuNWXDXWpjm7udAwPQ6YHzt9zwiwJYVYQ9A4aujw2s9PwxnrUiiRFz7+CwkWwQnYpApinlTv+AEUrvywjZHvJXZta1B1z0HtnJ17zelHlrYKrJOjX2GK5tGaju76diYFUKkFUf+jSlKwCZCPFi7BdqIaR7CIk84J5xjuEmcWDH5C20rmJVtDADuhgH7P2o8M7kBj2NaOkXv7f+XZNJCkPmcawVZDzi9z8O8yWNO1GfRa2d96CVVBg0tp9sfwA731S6AMp9CbLBaLL434ODelA7gu4YtyMKdxXHkz5UmjRCtpHvyamMMKm9T
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB4049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(5660300002)(44832011)(4326008)(66556008)(8936002)(66476007)(186003)(82960400001)(6486002)(53546011)(110136005)(31696002)(508600001)(2906002)(66946007)(31686004)(8676002)(83380400001)(4001150100001)(36756003)(38100700002)(16576012)(956004)(2616005)(26005)(316002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDNuZzFobXcwT0JzL1FOeEN2TkxLRHQ1NXU0UEdhTFkzbWxEbFNlckJtamdi?=
 =?utf-8?B?aVFJdSthTkFZemRNS2pZYUMvcDhEUFo1b2lqZ2l4MllxTGgvbEtJaFBQMTlq?=
 =?utf-8?B?b0UvQ09RVHcrZ3dXMkt2bmc2a001bXZEOFdMZVplVEF5NE5yTDVBNG9HZ0do?=
 =?utf-8?B?TUptVlNaQVBlSy81K09WanNMcmkwalVpVnBPcG5Xcld2ci9INFZObWtCTHAv?=
 =?utf-8?B?VmFRV3FEMWF0bWNvSEkzZXFaMTR5L21VRlpzanBxSUZLbWQyQ3ovY1lSUzJV?=
 =?utf-8?B?NXJ1eGdKZFNVSFp1bFVZTTNwNmhoSWZpTkhjWHJPNmRCQ251ZURpMDZCNkRL?=
 =?utf-8?B?UFQybExXRWo3MnhadG0yOTZhT0NUc1dtdXZ6bFNEM1VMNk1UcUhLNXdWTlVY?=
 =?utf-8?B?WW9QK2lQT0tRRExIZUE1Vk5GanhXRTIrY1dHQm5wSWJNNWFMSGg4UE9sRndX?=
 =?utf-8?B?VlIwaGZKcUw2VEVwRk52QTdyRUVoS2VQRVgzSTR2V09UZ3M4VkhCdkQ4ejEw?=
 =?utf-8?B?Vy9nanc3Qmw1S2tya1lVV0xpbmQrQnpCRVExbFpQSmd6cUhueFV0Z3JqUHBs?=
 =?utf-8?B?U3c5bDVHWFNoUlBIaURRTURBOWxlN0s0TWNScmJaOE9RelNOVEJDeFNsdTRz?=
 =?utf-8?B?elNyemJ6WWZqeHN0dW0wZnV1Y1UrUVJqRVA5N1NwbDBDVXhkWEV3blFGem9h?=
 =?utf-8?B?dUsyblUxVWVtcHFWK1JRU1JLRGpiZkNkbk9jOC84WW0rN3JnakpTem9HTTN0?=
 =?utf-8?B?aVFPUjN0UDFLWS80VWQzVS9jYU16WlA2OXFDSlZrbjI4d2E4OUxOdi95ZEdu?=
 =?utf-8?B?QTZnUHNEZWpzZGt5bW5aQ3dwMEhLa093TmNQYW1TRHJwUG9ZTTlFamZOMW84?=
 =?utf-8?B?alNPaWpoY3ZBVEY4VkNtems0NFhBYVgzbUFPbU5LMkN6eTRrc3FveHc4RnFp?=
 =?utf-8?B?R2Uxbk9RU2x6Ymt3b2R6dWU2NGxaNmxSSnhYUWFUNEV4RFhuN3ZlelpZaFlB?=
 =?utf-8?B?QTRKcmZJSmJkOEZrZ2p2Z3lCYi9PejFYLzdwM01BMlZRS3V1c3VjS1h4ZFBn?=
 =?utf-8?B?eWQyRUh6YW16Zy9ZQktpUFI0SGNwd1pNWkNjdXZDd3NOR3hERlFhbVd5b2RP?=
 =?utf-8?B?NXQyN25lbjFuNk9wQzZUTXNkc3k1Z1dpTG05aUJGZVpiajFPaTd6MnpHK0Yv?=
 =?utf-8?B?ejBxWlJtM1VLR0JWelZuOXg1VE1NeGZtVno3RlBJYVVlMDJ0NzVNZUgwNzV4?=
 =?utf-8?B?djRXYnNDSnd3cGNDUjZpNmVjRzBCNDBUclUzQWUremFzQmFoRTZGc2xqbEZ2?=
 =?utf-8?B?d0s4Y0h3cWg4QzJyOU5NeVJIRGdiSnFoeTQ1QkZpR3dQWEllYUxYYTEyeUpH?=
 =?utf-8?B?ZHNDaDBXNzUwdURIV0ljZUhDaFZTT2N4TEF3ZHhTaFBBYkVvdm13cWJ3UWoy?=
 =?utf-8?B?ZU9QeWdDZEFJRWgxVEd3M2lERnRTbk40bi9DMzF6TEk2eGhxbHBNUjBDNW15?=
 =?utf-8?B?MHFZRDVKNjBscW5kOEkrTHhJNi9EWHp3djZPVmRadWVGRjhmeVh6bmhBUTRF?=
 =?utf-8?B?WlVPaFJjaGsyQkNhazdwZ09WWFBYRi9HVGVsWXV4Unl4VkN5RlJkZmdHZkZU?=
 =?utf-8?B?akRIeTdJbXBlYnRPb2Q4OE9qTS9vYmdoMVlhQSs3RmRvZ1pwaUZkbXRXRlpI?=
 =?utf-8?B?ZnRMeTg4QzdjSWVTNnV3d0xXVy9xSWtBR095L3VSaU9NOFU4TnJEOFUxTE92?=
 =?utf-8?Q?jP9N/WgVPn8TXBNHgfACGTa2ZwMeq+Zmqmrl3ia?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e064bbb-d395-4f71-b36d-08d994c1fda3
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 18:38:39.7594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cezary.rojewski@intel.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3665
X-OriginatorOrg: intel.com
Cc: hdegoede@redhat.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 tiwai@suse.com
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

On 2021-10-21 7:19 PM, Pierre-Louis Bossart wrote:
> 
>>> If it was just moving common parts, I would have no issue. My main
>>> objection is that you went one step further and started renaming stuff
>>> in rather confusing ways, e.g.
>>>
>>> -void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev)
>>> +void sof_hda_bus_init(struct hda_bus *bus, struct pci_dev *pdev,
>>>
>>> - * snd_hdac_ext_bus_init - initialize a HD-audio extended bus
>>> + * snd_hda_ext_bus_init - initialize a HD-audio extended bus
>>
>> Reason for renaming snd_hdac_ext_bus_init() to snd_hda_ext_bus_init() is
>> argument type change: 'struct hdac_bus *' to struct hda_bus *'. Don't
>> believe that's confusing to anybody.
> 
> it is confusing to me, myself and I. The main point is that it blurs
> layers.
> 
> The hdaudio_ext library deals with Intel controller extensions for DMA
> management and does not need to know about a larger container.

Ok. Will leave the naming part for future patches while leaving argument 
list as is.

...

>>> Even if there was, I also don't really see why/when we should start
>>> using hda_ext v. hdac_ext, the naming convention completely escapes me.
>>> It would seem logical to me to only use hdac_ext as an extension of
>>> hdac_, no?
>>>
>>> I also don't get what this means:
>>> +    snd_hda_ext_bus_init(hbus, pci, NULL, ext_ops, "sklbus");
>>>
>>> what is 'sklbus' and what purpose are you trying to accomplish with this
>>> change?
>>>
>>
>> Well, please see the updated declaration of snd_hda_ext_bus_init() in
>> this very patch and then the existing code of
>> sound/soc/intel/skylake/skl.c - skl_create().
>> Last argument in updated declaration reads 'modelname'. Skylake-driver
>> has its own, SOF initializes it differently.
> 
> Not sure why you have your own?
> 

Not sure I understand the question. If you are talking about changing 
string 'sklbus' to something else, then I don't believe mixing changes: 
update to actual values assigned and assignment relocation in one patch 
is good. I used 'sklbus' as that's what is being currently assigned to 
->modelname within skl_create(). Such approach makes the change more 
transparent.


Regards,
Czarek
