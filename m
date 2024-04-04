Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B555898A2E
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 16:33:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19DAE2BCC;
	Thu,  4 Apr 2024 16:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19DAE2BCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712241220;
	bh=R6eK0lhL0S0ZnmCq0W1IcalUMPEqIc0e9ND853gHqhA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=llmK0gDpFKhnrb9cQgdikqjLKCbzN5BKpXxFEgeEtUFNVyPhHIWBiyshP6ZFFYnnN
	 8G2Gjvj5YyHAfMzIsE6fX9OUqCfc7rE2X3zAkYeiN/dW7dsq1C2FIxD+C5NQe1Em3J
	 fpxpme4o6CAD+787xpSge4z3FHTve+P6cJriBV3M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57A6EF80236; Thu,  4 Apr 2024 16:33:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6EB0F805A8;
	Thu,  4 Apr 2024 16:33:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 967D0F8020D; Thu,  4 Apr 2024 16:33:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 316BFF80130
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 16:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 316BFF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LBfFWy/A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712241170; x=1743777170;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R6eK0lhL0S0ZnmCq0W1IcalUMPEqIc0e9ND853gHqhA=;
  b=LBfFWy/AUEfdi/Aggh6IhwuJ5rbftfb0DThGuOLk7dJTCWbnmrPsy3KQ
   LNSpVyenosevuROfrqJi+NAkmn0nlVftYq/d42GQwVbfcmCls4RILuxHa
   K12v+PoSIG2foJZcxW4X8jOwuWdEgWIEE/86nI/EbR1CK1LnQJ//hEXpJ
   TDObMLBWxCsrEgM2KWSTXHenck2FVB1DiKoJjrCXLam6N1unuOLWyDzv4
   Xiu3x8Rgy3xRPhJGwjSV4/tSyVCSbbJigzvv6N1nlw8z5Q8zX9FTJHSYI
   zeoZAy1b2CCP9e2UsBrtaSPzeoNKCWVAX2OYM4w881oNewnAk2aNwXSZY
   g==;
X-CSE-ConnectionGUID: dTt1vbmQQkqs4DwjVKdo5Q==
X-CSE-MsgGUID: VtReaJL1T522SKvoiUM82Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7420847"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="7420847"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 07:32:16 -0700
X-CSE-ConnectionGUID: c1NtdAefSyC0Tfv9yWybvw==
X-CSE-MsgGUID: UBXgkRyuT1elc2o+0WenEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000";
   d="scan'208";a="19244736"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 07:32:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 07:32:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 07:32:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 07:32:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 07:32:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kpAfK1k62a7SCrZnZtdxBvUDkGPvbJPJZJ/ndfrP9rwdhMJNR/CfxqFtkdKOmlYztylgTih3U2ise1jvqrrv48A8WfzVv1h/qTVFVpl4nDSmAa8oxLLSGCXgcf8xW10LUdpbITcE0QbuOzCskOGPNDVdZHDfEb+1G3gvqkwYWZhOnY7fOZKc4DkZfPOmyOI9cV1/RZvyeFnQcn8/9UlMLHSJ0Xi61K4qtu4+not3JEkJ5bglzzlAyMAItN3E8GSZEQ/Ej7szoL4zhUQZP+Ed1fk6U6tAYGQuvoWGXbs87ap/UsbX0OZkiHlc8GIpFvaanLhWcbb7v7DRZD2bQgz6dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrUP+g88nZLPsjY38Xa+wcecNZRqZPWOQkzmi2w/PHk=;
 b=jAUBliHtRNHKOEl4f1F1cjIjWAM26zVqouhv3DZllDMiVXDrWYK5qz3uEjSC3DIr9GG0TgSwg8ZknMT0h2zk/3Fze+5KPUEHUh2gSxD8i17FMx/Y8rnP2TCXNwRVsR1ayKg4NNDRMpyTr04G24Jpel3vzuGlikKbw8ZQpzVhOxpX3IrP5jIBsDZ54ketxrfZd2R4uq8zgHaLAJ7KcJAZpsjxVTbtrKGQtOXgbLIxgZDH9dy7qrTCrtpQnI0sogO96zrt7r6ZfKF2qwUiDPMQYaUWdE+NV4oRpwZUe6ecGh2njx3axvrYgS5+Y7KBwyoradAIoYnsXQxGqf5JjJClcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MW6PR11MB8311.namprd11.prod.outlook.com (2603:10b6:303:241::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.10; Thu, 4 Apr
 2024 14:32:05 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cb11:e68c:53db:aba5]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cb11:e68c:53db:aba5%7]) with mapi id 15.20.7452.019; Thu, 4 Apr 2024
 14:32:05 +0000
Message-ID: <57c6dc7e-b2f0-4c7a-ad6b-9dc4f915dcc8@intel.com>
Date: Thu, 4 Apr 2024 16:31:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] ASoC: Drop soc-topology ABI v4 support
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<tiwai@suse.com>, <perex@perex.cz>, <amadeuszx.slawinski@linux.intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>,
	<cujomalainey@chromium.org>, <lmajczak@google.com>, <biernacki@google.com>
References: <20240403091629.647267-1-cezary.rojewski@intel.com>
 <70c48f28-36c5-4fb0-9f07-5d8e4eeb1694@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <70c48f28-36c5-4fb0-9f07-5d8e4eeb1694@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI0P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::11) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|MW6PR11MB8311:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 qGUBPqE/JQ4YdonfrsXEMGKF5G38lDxsXT9+OdxHgODQIYRYaA8wlqh7lGIGmSTYtZHKgrD8y/++rnuR2YTBKIbTmLcelJsj0TUIwkEwwDnuzvmExZocNo4F+xvmQMO+llCEBe+4ZDyGka/S63GEYX5q4hvO7+pQfXQ3+yTbfuWVeyVRGD7tRrlsGStkNjYRtJrV5PZjRLY4KC0Dx/RNQWtniVjBU8/azUlFhB761AsIeYsBjPmlW7QiijpNumAmFEy6RmJzyyXHyGkEfdAHHCUMPjtBCpj7im9G63497YvBC6LagfCim3JK6fJe0L+StTI7C+y7A2DF6j389gzAgDTQTwyduYaG44R18UNiFQCPEL1xJG2mSDsquq5QBQSZYjqYJNdg9T3u8g2e5RMP58HeSdutalwXsKLMoltEvtTEbg8JAT3l3IxXJnKKY/z4rMJ2isnv5D2WL/FfYCe4VynKurwxux6ACGcdn+W1j9hZiOvYqHmiJ2wu0s+3Yw+B2aCN227jmbmrQhZhaiDr6Hu3t6hwZOXopfYYiyG0aVjS2wWaDitZCBgfyH5Z6g3r8UFdrkYhXpyVBtMbDpUGmBVDCwjI+35h4tMZ+oowbxIcqy6dIleVVCssDnKUkobp
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?WE1hQzZOKzBicklmUFg3bHJZYjEwM1prL0EwN0VZZUNLOWE1NTB0b2JxWDFY?=
 =?utf-8?B?SGdDdUNEck9XMWVpTHlUMk5pQkphQit4MkVuSUhNY3FXazJGbkVlM0MxZkUz?=
 =?utf-8?B?SGxERWd4amdDOC9xOGpKR25yc1lmSmw0K3VLbEt6NGs5WlQ1d3ZYdlJUS0Rq?=
 =?utf-8?B?aEoxMjRUMU8vQnpOcnRnUVVzVmRscUNUS3ZlaFp2TFNxM1JCVTZFaStUZHM4?=
 =?utf-8?B?SzlLanI5TGtTSHQrOFJnaGNQKzdYWGhGdm00bjVpZVNaY2VQTnIwS0VtUlF4?=
 =?utf-8?B?VEI0cEZoZ3MyKytsM0FHSDVuYVVZTXA0ZERPME1MYUdrczVKK0xlZ1RXTzVR?=
 =?utf-8?B?U25wR25HN3k0bS9sSnlESUdOU0labDRRaUw1TzFCc0FIQmNRNWhJTlV6QjJ4?=
 =?utf-8?B?OHBrRCt4dWJua0ZrSVJuZlhDRGNUOGVKQVJ3SDhwdUIwdHdwR2srMFVLQWFa?=
 =?utf-8?B?eG5MV2tHZXF5cjIwK0N2TGVUS2NCVEZmYXFTSFpRU1FmRnA0TWZkTitwcFVq?=
 =?utf-8?B?SUdCQ2IxV1d1TGVIYURqajJiNU0zOXoxVlhvK0szZ3JkYXl0M2Y3WVBINnJQ?=
 =?utf-8?B?Q2YrV011NDRxdEVrUWgvNXMyU3ROK2JoRWtESzBJN1ZQd3gyeWhYemd6T1Bp?=
 =?utf-8?B?cDNhejRlTFFZL3pMWVFyWENtbytZSGpkekg1ZHlHTEc1RFZqWUZUUkVEdS9x?=
 =?utf-8?B?YzBwamRaTFd0NEtnUFM2emlIaW8yZGEyeWl4Ulhwbk8xZ2dkSlVlSkxHbTBL?=
 =?utf-8?B?TE1VK3RIa1V2UUxYYlpva21lWjQ1VmRUU2UwY3lHNzJjL1RHRzNGaTJzK2d6?=
 =?utf-8?B?OGhtTk1SbXV5bEY0eG92dlhFeWlMSFA2S29Obyt2MVl0aWZKTGxucUVURnRL?=
 =?utf-8?B?eGxCUERWSGNULzRqSUlJVnlPa0xTT0Y5QkEvbW82dC9zaXh6MnBDZkVYc1c3?=
 =?utf-8?B?L0ZUbzFFcEEwaUVPVVpZc2ZGTWNyc2RzZUhYMEVwdnlJMkxqRTRtZGl4cWsy?=
 =?utf-8?B?T2Zpd09PdmorcGV3VFRqUjZlUU52U21TYVdLcjkzc05uRU1tcUh4cXVoTHVj?=
 =?utf-8?B?WmdFeEhYcmhIaVJmNEhEN2swS3JKcFZZb29ZYXR3U3p6bHpNQzFuZXNRcG9x?=
 =?utf-8?B?TEIvK3pOeHlheHYwRFo4dTIrZG9hUmFUeXpjNFRCRFh1NlVFdzVpQWFrOUlQ?=
 =?utf-8?B?MStPSWZETHpWSEpIeHJ4QnhaQTQ4NkJhbWprNW1GZllNR2xPV21nWngyOGJB?=
 =?utf-8?B?cDRTVE1kb3NpMEplek5zSHpUQ2srY0kwNFp1ZS9FQzA1SUpOb0NCajY2QXRC?=
 =?utf-8?B?VDZtaXFrSFJtcmNCMGdSRkVoelE1TTNEUVMwUGlyejhreFNuZ3YwZ1VvcVQy?=
 =?utf-8?B?aitSOTNIMWx0THg5SklMbUprOFhKWTl0YXdnYWdCZURNNkxVTEpvdXo4K1FZ?=
 =?utf-8?B?K2QrUG5NbURqamhzV2hlODcvQTlpU0YzT0svOTZkUmNXRDNITzVmcndPMGF1?=
 =?utf-8?B?WlY3WTJnTkVQdmxOUENLODZ2ejZ3eUVvSnF3YUQ1S3RSSk0wdk9xSjJZcFp0?=
 =?utf-8?B?Y2o4cGI0VUhlak41ZHdwTGQ3MitBUkhXaXkzSnBUaTVkZCtyS3h2elRzTmJX?=
 =?utf-8?B?cHBVL1R5SG5LcGtaUDlsZjQ4UWFvdlI0N0xlMzg4M3pVNHBjZE9QZFBDekw5?=
 =?utf-8?B?V0RpcVc5VEtqdktOQjRobU5jODRiVzd2bXV0VlVRWmZnRmdEWDM5UGF3UlJF?=
 =?utf-8?B?UXk3UGtQQUhzVVFlaWI5RW1jR2k3V2RSbHVLNXB2SXY1QXU1NzA4ZTZyZWtl?=
 =?utf-8?B?NU16eHFvSlRYZlErMzNXRk1IK1NkdVhJd3psaGNyTnBZUEYwaU5KcjJjaVZF?=
 =?utf-8?B?VDliTm9Hc3pEa2dGdzlMVHVyR0ZpK0VCMTVGL3NHWFlHekxwZWZOTGlRYUhp?=
 =?utf-8?B?RlA5ekhFQXljalE5MFYzWnZFZXpsWi93Mkwxc3NLZHRpMjBxNkVWbFdpZ1Zh?=
 =?utf-8?B?bDV6S1JrblhEazh4K0o5MjVTb0JhbHdwMnFkS2ZwcnhDdUo4YjRBRzg1VlQ4?=
 =?utf-8?B?VzI3YlpTdTRNMXk4QXdVejY5ejNtSHhocXhjU0kwWXJVOWxlWnpYTmZTWHVY?=
 =?utf-8?B?RkYwdzJwdVZlNVd4K09pM3F0ZWtTdjZteTdLR2ZGWk9lekxXOW1XSThJdXpS?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a1cfa24a-df03-4411-f37c-08dc54b40014
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 14:32:05.4643
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 581g8h2MxZBzvzzEdqS2u3lIz3HeEcfUNxjhyH23F4m3D9LiegjVh+m+NidAiuqeubA9P6eHIEpZ3xRmUCw3Y8tan9o1/Q4GfxXlpXZHN0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8311
X-OriginatorOrg: intel.com
Message-ID-Hash: ZLCJNP4WDV3BSHUGZWDDUVVPOST7EYJD
X-Message-ID-Hash: ZLCJNP4WDV3BSHUGZWDDUVVPOST7EYJD
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZLCJNP4WDV3BSHUGZWDDUVVPOST7EYJD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2024-04-03 5:53 PM, Mark Brown wrote:
> On Wed, Apr 03, 2024 at 11:16:25AM +0200, Cezary Rojewski wrote:
>> This patchset impacts UAPI.
> 
>> The only known users of the soc-topology ABI v4 are Chromebook
>> configurations. Starting from kernel v5.4, all of them are making use of
>> soc-topology ABI v5. The patchset first removes obsolete code from the
>> Intel's skylake-driver - the driver of choice for the mentioned
>> Chromebooks - and then proceeds with removal of relevant soc-topology.c
>> and uapi bits.
> 
> Do we have to worry about old Chromebooks that fell out of ChromeOS
> support but people are still using with a general purpose distro?  I'm
> not sure what the user community is like there but v5.4 is from 2019
> (and products would I guess have still been coming out for earlier
> things in 2020) which feels kind of recent.

+Radoslaw


Short answer: I believe we do not have to worry about these.

Longer answer. Intel topology utilized with the skylake-driver has been 
versioned as:
- 0065, paired with topology ABI v4, status: obsolete, never upstreamed
- 0071, paired with topology ABI v4, status: obsolete, never upstreamed
- 0072, paired with topology ABI v5, status: maintenance

To my knowledge, following are Chromebook systems currently outside of 
the support window:

Broadwell-based:	N/A - no topology, catpt-driver
Braswell-based:		N/A - no topology, atom-driver
Skylake-Y-based:	v4.19, skylake-driver
<anything younger has been transitioned to ABI v5>

By younger I mean: any platform supported by upstream skylake-driver 
kernel v5.4 and onward -or- the avs-driver. So, the Skylake-Y platforms 
are the only subject to be discussed if at all.

To my knowledge #2 the upstream version of skylake-driver on v4.19 
kernel breaks when utilizing old topology, the so-called 0065 -or- 0071 
which are based on soc-topology ABI v4. When it does work, it's because 
of internal patches for the kernel. Switching away from the native 
system into general purpose distro on such Chromebooks may translate to 
necessary patches missing, breaking audio in the process. Only the 
topology files for 0072 have ever been shared to the public [1].

User may also utilize the avs-driver on such machines provided they 
upgrade their kernel as we did share working files [2] for machine board 
drivers for ssm4567 and max98357a cases - onboard codecs present on 
Skylake-Y platforms.


[1]: 
https://github.com/thesofproject/avs-topology-xml/tree/for-skylake-driver?tab=readme-ov-file#supported-configurations
[2]: https://github.com/thesofproject/avs-topology-xml/releases/tag/v2024.02


Kind regards,
Czarek
