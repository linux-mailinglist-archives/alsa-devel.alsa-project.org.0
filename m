Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB87B7096FC
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 14:01:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54D44204;
	Fri, 19 May 2023 14:00:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54D44204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684497684;
	bh=xDxC46RfEXroDarS1z1orYFrQybvVSLDhflSyJ1RG9Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fIkFgGobDb+5DbBlHDIxaDxQXOGdds2dyUlNtqwLlv+SjhJJdaGIXq1RXSK3OgQQR
	 CYleD2MPHuPxK8hjf//KmH5D8/OWbuOHZnfRERFxjDaK+Iz83xNMdobfPC/hHKhuNW
	 9huF1E9XgYk+qzNx5OP9RMhcHh2w6WqM1Zux3+fw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7ED5F80272; Fri, 19 May 2023 14:00:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46AFAF8025A;
	Fri, 19 May 2023 14:00:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AAD4F80272; Fri, 19 May 2023 14:00:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB909F80087
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 14:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB909F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UJSQyf+9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684497627; x=1716033627;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xDxC46RfEXroDarS1z1orYFrQybvVSLDhflSyJ1RG9Q=;
  b=UJSQyf+9lwIvOU87S3NYzzQXxQ4wRrTqNdJWT12XoyAtuJ5wsJse0x2X
   Vcg29CjNRnsjHoWuoUeCylVh4tvD9gkrJO3BrYdtNaOmoTpAva91HihP8
   l0TxYKb84+PARGLjtXJK5ZLaMpQXnEsiz/qfNYOTbTGp+2whGPgWdRwXc
   j0nc/z2WkmXNQMhEQu6waaEJDlod9aKc2LjBb4P9YEgj/gLG5g/P1b6cE
   WdaNXekEjSkIDXhJeiiOKbIBVPOa5KSBtadF6iJUOT7QrGFJtmbfiYPcV
   sWnd5XRldBEJ+0HvUY0ieHAlQFQO4Ix4tB5LAltKVEQqIWPd/vcMjmljh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354707541"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="354707541"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 05:00:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="702525090"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="702525090"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga002.jf.intel.com with ESMTP; 19 May 2023 05:00:22 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 05:00:22 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 05:00:22 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 05:00:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lf+VJaqAhEm6JUzEbyXI4s44HA2JncNH/uisxUlfxCv9caVXujKUmDHIbmxteXCTrzFD9z4sbkM/qzade5bNzlVKjnwx6d7L/WRZemZd+E++ooJogDufnBOWhmBo0jQp8r8iQ9xemELV692XiPJIofh8vQQsw1hgxGc7QdBaK7lfx6k1Urp5lwVeELbKdIbft7hrtqfz/1Gw1ahTLrKEL7o/b3PmNdwiEvC1xzRDaWilAI7QiEdwTVgpn79vGfsksoMBdP5BzaA2Z6RCKxcldZzV+D16bDAZxl5fppdR7dUWdnkg3V5xgke8S1SHuxn4adXuUq+WLUnJ3r+mqBNJAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yFCLdHcjtMFzz/uaas25DTVkxzBHs+qaK3GAtVDubI=;
 b=jc+SNPweglqLVbXcss+zkQmpTIdClwP61hFZiEFb1UwY6e8M+nJywBUoDh5NcnBmV+nW+JZSuctbF0/56COY+xfbBggT54y2+PpD8PDeZ0S7XcwyZ4bKGrxfBhR9ryQ4PiszFkmjHiY28Adyxs/KhMOm6FrSOLZxKwKDMxSf/D6tU1/JTTjXr6RX/vd3s0fejNeOXuPoQt+w4h1XSfFRwTmBJg/U2DfHbAXX+FQ/2tCryzpE+/VBoLJtD24WDZg06G8jhZwCF7RzudFNBjjpjlIAx+4cFlm61Jdz/uqjyxb+fnk9GoypYhu+Kcw7TGr+Gu8t9Zwm6YFFpLfQNtVKuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH8PR11MB7990.namprd11.prod.outlook.com (2603:10b6:510:259::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.17; Fri, 19 May 2023 12:00:15 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::b1f0:4762:2bee:138]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::b1f0:4762:2bee:138%6]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 12:00:15 +0000
Message-ID: <134be2cf-f190-df96-83f8-a27a4b4eafdd@intel.com>
Date: Fri, 19 May 2023 14:00:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 0/5] ASoC: topology: Clean up error messages handling
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Takashi Iwai
	<tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, <alsa-devel@alsa-project.org>
References: <20230519195611.4068853-1-amadeuszx.slawinski@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20230519195611.4068853-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0066.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::9) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH8PR11MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 08c3f88d-ffa9-4238-288f-08db58609b1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 UeDRJyzx6npaYBJtRmTDMpObAUwPLdj7H7AJZXDi/8arUY/C2Qx3vKmy/hW4V9UUWhiVQh3JaOlTecQGI7CFAAIsv/4VP+jCH21iJbRPomCJ7TC96z1ljF2jlPDBivk5e/TrdqizXr/qzz+V96qHswOoCwbx6sbQSzj5rB79Iqhp5qQMGWUieb6kbGUaREMlz8cRok6IImlkUbw9MnUy5xB4p/1liKOtWnXVWYBTdV2gtXiGfOdnJwKIgpSP3Pgw5rb41ofu1e5+GyZsYi+xpzO/C+PQmIfdd4SlFaa7iIZlQvRX0QOqnZMQxQf1RTY1njRdtZTw3c6SsWjB8j82zaTVIplBRiJVmbsTOu4h1FZZDbsXQM9lpCLy6TaH1m7hvi7MvF68D/ZRgUZAgi6C8F5toRW2Ce82Ga9DZj0q0TM75rz/FKN66HUKqSDVxikJ9qgxKVj8SkPjIKGYYEkokTVw5CDObiHMR+i2RzGhAl4zkXROtMJVDFZ2xtpMrj5rUJBqmj7zjPsY29SuHelztulV9ouq3Gj8H96RpKAbRR5XL1TIlFDcDKrk/fbBrRhMlzSDD/GKZ0ME2MM2oTYPqRx00/g+MZzuSqVg0lLDpQWgfA3TWINwKu0sL1TDyA4JvaPO/+oSXWMz4Qgyiy4LsA==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199021)(2906002)(31686004)(15650500001)(8676002)(41300700001)(4744005)(8936002)(5660300002)(44832011)(66476007)(66556008)(66946007)(4326008)(54906003)(110136005)(6666004)(478600001)(6486002)(83380400001)(66574015)(2616005)(26005)(6512007)(53546011)(316002)(6506007)(36756003)(38100700002)(186003)(82960400001)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?Rlp2ZG1FQXE5VmVsQThuaFlRZjNkVzZVcE0rU0w0UENoZjQxdlJJeHRrMXNM?=
 =?utf-8?B?K3hUQjg3eFFRRk4xTHdRbDRiQmE2blQ4SCtWQTNKZnBhQTg0STRRcmdEZ0Za?=
 =?utf-8?B?aDRjaGFqbjJydnY1bVFienYrajk1NGNvUXUvcGkxRS9mTzNEc3hobVUyYTI3?=
 =?utf-8?B?OWMzY3o5alVvcnE1aWptTUdKVVhmUGFLVlBtbXBhckFpRDh2TGJBSXRPZ29Y?=
 =?utf-8?B?OFBtRUhFeFFuSERFKzQ3UkpiZC9JNkcxbm1STzNuU2FyYVQ1MDg0eW1aK2Zm?=
 =?utf-8?B?TklWRVJrc292eEFaYm1jbWhTK1ZUMlY0aEIzZlJqUUNPWlo0TWwrUnd2aW9L?=
 =?utf-8?B?SStBVmMvSUl5d2JSaUdISG5HRUpXVXk0ek9VU0VzeHpsdWU5emRiZ0JzY0JS?=
 =?utf-8?B?cnhlVHBvMnczTUdpMnpLTlkrUUNOaWFhcUN0N0dHb3pBS1ZxK29lWmRQY0Vs?=
 =?utf-8?B?S09nbTJuczdvVldrRHAzbVpEQXoweHBLMXMwd2RuUGJ5aTJKQWlyeTNTUFZh?=
 =?utf-8?B?VW5nczdlTTBNRHdzV3g1WXNDQnRtTnRGR0llckMzUzJDcG9WdzlUYXdQUURV?=
 =?utf-8?B?TEUycS9GRERFMHMzcVFpR2JVaXZzL0FpQy8zZmFXT3l1VG1iSlRUekp2Uitk?=
 =?utf-8?B?ZnpOd2JZS2hLNkRleG1UMGVxS1EvN1FEc2grZk84UDEvZmVhejk5aEIxUm91?=
 =?utf-8?B?VlMzZzVXcEhEQy96Q09hNUNXa0ZzOFhhYk9zWkZCRThPaDltRjI4bG40ejJ4?=
 =?utf-8?B?RnRRcndaa3lkWEpDdFpublAycjdwNWFHc2NrVG1SQjYvcDV0d1Axcmt6RFdN?=
 =?utf-8?B?R210RHZFZ0dIbWJVb0VVbDNiZ2c2cXAybkwvWkJyRHIyQTFVMnBDU3VTd1Zl?=
 =?utf-8?B?UGhTTGJoK2V3TXBNZWdXaXBrbllIVGJpTWJ4RWJWMzQ5Sk4rc0hxUU9kUmQ4?=
 =?utf-8?B?dXZ4bi9qUlJYZDJFYTJuK09WdGdQaElvUkgvSDN6RU9yeUJzbDhVdmdWOFdK?=
 =?utf-8?B?dkNiaEdqMk9HZWRremVjN2dCYkFleUsvWVUwR1hNbk1hM1dFaGtxSUZMVmlP?=
 =?utf-8?B?clFub0xHNm9WNjh5Sk14NCtjZyt4QWw1ajhncWh1QXRvODRTYWMrMWwyaHRv?=
 =?utf-8?B?SjhnZmRmdlNteGVIK2poSFJSTjJicXYzZVJaRng2TUZSTmNVVGxpMmdGdGl4?=
 =?utf-8?B?aGUzUjl4M3FZYTRDWDZFUWRYR0F6L0hWUVFuVWg4V24rVVNOTVhySDJ6VndE?=
 =?utf-8?B?S0VsSCtaTC9jTnNFWUZhZHVWSGM3QUFLQk1ZSFFyVjlUS0J0UDcxNVhodE5O?=
 =?utf-8?B?Qkk3bGFsQ042MFZ0Uno4dVg4OTlPYWwrQ0NKeG9XRno1aVRmQlZ2RnZTV2I2?=
 =?utf-8?B?YU9xSVJ0WTU5bkpVT3I2YzFJVjdjck5tYUV1NmNCbWVPOXJqV0l0MjdNVERv?=
 =?utf-8?B?aTVzcS8vWVNLRHJOQitWNUlzTDcrVHl2dkoxNHFzN1YwTS9lUlhrOXNEblRE?=
 =?utf-8?B?UDVWNmRJKzk4R00rd1dVemdwMEdHOGpoZjZmd3dST0hvTXBaOW93VUZqV0ts?=
 =?utf-8?B?RFVjOFY3ZXdWdWhnOVlraGZzRHhSVmFtS1ZVb1lUdmxiaVhPRW1lNk1nQ3Vw?=
 =?utf-8?B?T2dyUmVNQndTcVByTUhsWjV4c1hEci9SamtUSHNZRnhSZ2ZIT0JYZnhkQTdE?=
 =?utf-8?B?VTl0VHZxSVFXRFJkSitTblhVTytSeFlLTGIrYmlrQm9qeUlITng2OTk2MU5C?=
 =?utf-8?B?TzZhbU5NMzhlVHNKSWVOREYvMUtKY01vc0cxQUhmR3hvWG9mYXZBVG5MNUhx?=
 =?utf-8?B?bDV0M1hrWlkvWUxxZ0dSeGxacENrSjFVRFpVckpXTkUrZVdTMHhtNnM4QUts?=
 =?utf-8?B?Y1lKWE4rTWQrck5xRDkrTERsUEdTdUtQYkNGc1pLY0NaVExkTHFmVjVLSGY0?=
 =?utf-8?B?U1VZQTA0UGYxeEhuSVZDKzArR1VjdkFnd3dlMWxDK1F6QkEvMHNaMzFPaWY3?=
 =?utf-8?B?ajF1dHNUd2wwcmdMb1pVSHJjdmp4SlFUVXlqS1ZUbGtMNjJpalE0b29ad1lN?=
 =?utf-8?B?cW9rUVJxVHBZK0E0eXZ3ZmUwa0tVcDRnVG1JNnk1YjN0dWJ0dHFMOW1oWTFm?=
 =?utf-8?B?MjBVZ1FqcHR6VEpRZm5rSGMxUFdHekFQWWxwNlBHd25xTi9wUTJrclNqSjVp?=
 =?utf-8?B?MEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 08c3f88d-ffa9-4238-288f-08db58609b1c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 12:00:14.7966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 dw96gQ9uiEIxolvja9QlkfOWemStisOO3cI+9JYG9Vy07I/8nuZITailCs7pc80T9C0Zn3D1DwVtDFpyrf8v7HzT/NGQsrqR/sB0u2nR7Pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7990
X-OriginatorOrg: intel.com
Message-ID-Hash: FPWGMBDLJIMU7G244QFKNCMIMBJCLVFY
X-Message-ID-Hash: FPWGMBDLJIMU7G244QFKNCMIMBJCLVFY
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FPWGMBDLJIMU7G244QFKNCMIMBJCLVFY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-05-19 9:56 PM, Amadeusz Sławiński wrote:
> Series of patches cleaning up error messages when loading topology. In
> few places instead of logging in place of failure message is logged in
> caller. Additionally there are places where both caller and failing
> function log error, leading to unnecessary logs. Clean all of the above
> up.
> 
> Amadeusz Sławiński (5):
>    ASoC: topology: Log control load errors in soc_tplg_control_load()
>    ASoC: topology: Remove redundant logs
>    ASoC: topology: Do not split message string on multiple lines
>    ASoC: topology: Remove redundant log
>    ASoC: topology: Remove redundant log


Marvelous! And not reviewed by me earlier at all :D

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
