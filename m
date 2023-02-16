Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8853699BCC
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 19:05:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97DFFF01;
	Thu, 16 Feb 2023 19:04:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97DFFF01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676570725;
	bh=di2uAPZLdUKaD+pIfPN/kNzG2xiYTFj52U8d1PV/mG0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=axoL2Xk781Y+6ZXpOHg0CFNjvcKJuMPN36r8E8d14jb/gAeuKFeB74bpdRGHGrt5a
	 jZSXjv4iLK+R/rTexqC2dFQgPUM0rMSraL3iacCfRIDLbcF0TGi2Pi7eksNFwyiJtG
	 yaliZ7dEcGVF3H1vtJizlVYki1t160B5zMXDfp2w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD159F800E4;
	Thu, 16 Feb 2023 19:04:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 159E0F80171; Thu, 16 Feb 2023 19:04:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0615DF80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 19:04:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0615DF80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fCoRxn/a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676570661; x=1708106661;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=di2uAPZLdUKaD+pIfPN/kNzG2xiYTFj52U8d1PV/mG0=;
  b=fCoRxn/a4EQNsIp5Q1rHc5TB+2iLMEo/heU3uKupr3ctpNavqaD8DRbS
   INFJarn2ociaE51F4LpvmjErm5PX0qG/0+gFXQ7tZNHLsplajOs+Do3z9
   M67If6dEl4qLLR9SHkd5A+iw2BnRxESXT9UIO2GD4pekLP4R6CSKH5RVE
   I/fsTZrVhccwpJxrdCo18kMx5A6IMujdfxtOv54FsGEd5tL8WvA1XS8AM
   IbYQBIJBVbcg9wIT/sFQxwwIYp9UzlzkvfIC071Vqrfv8atg4KTvnWMzo
   hapexvkyRO3k9INrR8ZeDJdF3y9POtGaYT2aG5aCq7CXGQicQ6MpAd0Rh
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="329512503"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000";
   d="scan'208";a="329512503"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 10:04:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="733982295"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000";
   d="scan'208";a="733982295"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga008.fm.intel.com with ESMTP; 16 Feb 2023 10:04:15 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 10:04:14 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 10:04:13 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 16 Feb 2023 10:04:13 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 16 Feb 2023 10:04:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxQJLAwVqscapO9vDELHws1OrgwqTTJR0L1VWWiSF7D6jA6Sso3UMHjynQhOp9JkMwuOAVajNtE6lBHyeCh0/yOyG+bhQ5A/Xk6TnB97I6Bks6i0LyQjLhU0OjxTXVEh2Hc5rsblnMO8FHlnFigeHMl7OAHfpZICkF+HkCZ8j06gNwLzNO5wsEaely+/u4DZi/TMrja8RnwwvDJSDZpoDtNxWAeBDrphqgL6bmtH8niG1OrKPQgIk6JXOHa6+M0/jB2mcW0TiYlU7V1bmzoi8dfz3pxMEvo1lf+HON51EshKVzpanKLUjh2CCI47ZEkU4NNQdBgOPs1yr+Oxh/jQvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eT+RSUjbaU6DEOEajZhdy4WjJACsOGMFxiDI1EzwcBI=;
 b=ki83o8G4qfwh99T3dTv3GpeAivBtuI4ZyJg1EWSaoYjDY6nkEuEK3kCKHCmcBCiDzGvBBSbBZCDF/3OoguGsSCIVbDezwAGbrmWcDCM+gkfIpsgURucpe3HoRZOm5DS/twZ+0jFaAvSOpbrAuImUsQ6oUdErO0lsN6SfvlJCBO0VEckaL0rDeqbEHhpuntH9Lt1iIgYup4GoPDm6yNUSfaxKDDGE9Q9YaBqg9eiwi3OOr74qHPn6qMdPs7T1TOekvzFGKq7Q11wfKglHZwOydk1RR52tTj2ARq6s4/DgGh1+fDG49m9wQkXSdKLJkuJwXObI3fiBPQyE9WTRoj/8Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 SN7PR11MB8027.namprd11.prod.outlook.com (2603:10b6:806:2de::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.26; Thu, 16 Feb 2023 18:04:06 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8117:219e:33d2:4dd8%9]) with mapi id 15.20.6086.023; Thu, 16 Feb 2023
 18:04:06 +0000
Message-ID: <3211f533-80d0-2278-e866-eb0695e95212@intel.com>
Date: Thu, 16 Feb 2023 19:03:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] ASoC: Intel: Skylake: Fix struct definition
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
	=?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>
References: <20230213205223.2679357-1-amadeuszx.slawinski@linux.intel.com>
 <63ec169d.a70a0220.ed5ca.3d7d@mx.google.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <63ec169d.a70a0220.ed5ca.3d7d@mx.google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::13) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|SN7PR11MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: ac85f6e0-8e68-4509-8b0b-08db104831fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 mdGBDqCNaWQ0s049J4jz1B3HfBQIbTYA/MvpoRkxmYvMJgKNR1xNBsRT80+dWFRUrI2A9qigUKWB+DK0cp0Ny2qvM9zrnkjc6R9nFfpPWsaAt+1U3JQBGUEC6PiLb22lIy2dnLyGs/I5he2Ksrck48gmxpn5l43ZQ3P4ahvJgx0xA5LV8wC1b33oEXdRX18OGvpTmDQbPLvc98nbRBD/f1D0bV7w9mKhGpnDlyq23GetsR/JVFFOkE4LhlJcZNi7BlrCNopQVyo8JDnlE4VV/jN9calEZRTVHioAvyx25PSRml0O6TSdDPB+Kfc0nNoi6m2YHM4g6jAe2VRWqns/SSauJXKr0B8qF87wAIbLmE27Q3ITfxZvwFcoA2R4grT+7iiTpkVLjEyQN84PzPXh+Hi4Kp2HMXv5c8RC5W9q92fNcU9AKnUyS6ZSGhbRuBylT+F2pTYjUiKUERcflJDVYfNly+LkeK9MzPdO7PRNmWv6DVFBmxtLtQfd+tiFeEvNlrL2DgjhrkFxd/HugbcoqTvBJirfFKjP97YjISi6QpR0PzIdtWn84VsxWr4+VcwRnmSG0in6mD/ywOZKy+Z1/V2kSw9+6QKq+BQJc8b0iYJ8xlBigu2vrIEpJuRVengPqiAykE7HR2AXBOOpHUycPF7JX39PBauemwO0GriHEnvScoUae3mbMM7NPOCEIZ7EdSYNa9oFAPlyyXy62cNFYN34+8ChbylkUGZoA+X5OOs=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199018)(83380400001)(66899018)(6506007)(6512007)(36756003)(2906002)(7416002)(5660300002)(44832011)(8936002)(41300700001)(66946007)(8676002)(6486002)(66556008)(4326008)(54906003)(316002)(478600001)(66476007)(110136005)(186003)(53546011)(66574015)(2616005)(31696002)(6666004)(86362001)(38100700002)(82960400001)(31686004)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?YWwzOHorN1R2Q3p0QUl0SVlBcDR0S29wWXhUM2ppQkE4bm9yWmdRdkVRTE5a?=
 =?utf-8?B?WkxSTWV5aHh5dmlWRjFKYzdIdVlxTHptdEJYZUo2TmNtMkhMSU8vWm91aEc2?=
 =?utf-8?B?VWRpdmFFRlN1eUZGTytCWWZueGZVN24xcng3YzhNQW9UVzVYUncwL3E1NE5W?=
 =?utf-8?B?Q0RmU0NNamdGMkY5ZVpuUDNsbjJWMXp5QWlaOHIxdytOWWZSUXgrejRtdzBZ?=
 =?utf-8?B?UU50VFhBbHYvWkw5QmtDUHA1RXpOb2lqbFRneUtDQ0tpNURlYUg0WkQyYmtj?=
 =?utf-8?B?Y0J3ZEtOSThuTzBGNE1YY0xOaTQ3UDdMTU5YbmUzSlBSMmZGUTZnZU1mbm5C?=
 =?utf-8?B?RU9SUmhES0tySDkxd09iMUNlL283V1pGOUg3Qk1XU1BMNGNIUlU4dkdjV1FZ?=
 =?utf-8?B?Wk9VNklzRGFxZ2tjRVNraWdSZkpjMkZQMEFaT3B6dTNoK2dMOHpHN01ISTJV?=
 =?utf-8?B?elB3QzNLT2U1czNxR2RMMTJNc3dRUnpKdzE0VTQ5S1IxRnByMXN0TlgzcG51?=
 =?utf-8?B?NW1kOUlvTWxES2s5d2dZUjFtV2M0OFpwOGgvakRvaWluSjhOMkVzZkFzcUg2?=
 =?utf-8?B?SW9NVWp2M05RZnNRc3h2M0phbWMrNVprYWZOT212MXo1eTAxRnFEaFFIWXlK?=
 =?utf-8?B?cldmMVliNE00RDBNdDZXeVFDdlJsZStoWGQwM3kvRUF2ZGJHNHB6NjlDSU9T?=
 =?utf-8?B?dm5pRjQ5MkJnc3VLWjBUWkIvYnpRL1o3dEEzcVZLclAzUjBQZEp5ZGpmTnVK?=
 =?utf-8?B?cHJsdURDSlR0UmpCd2RnekJaeURCdllIbm9oQjV6RG5oVDlJYXFQTnlkSHZm?=
 =?utf-8?B?SkQrRmxWNTBiSno5eTFBZlB4Y1l0TENzY1dPOGhJU3FqNUYyR1dodnFDTU16?=
 =?utf-8?B?ZU5YUGFlL0ZGZDJ6RlMxUXhzU3RtZzJtK3RtSFJ2Nm9qdjhINHozN2ZGR21s?=
 =?utf-8?B?aHNqYitrTkF3Y2F2VXZYZkJlY2tBMVpIWjZWT0NYSWNUR094dEFBc0JiNVJr?=
 =?utf-8?B?N2FSLzI0SnUrV1V3RXgrK0dMb1gxVjdZeExySlZZZzk3azFjcDVEUmpVNG1u?=
 =?utf-8?B?eHh4aTRqVnQ1dklTNitWeFVSdWZ5SWQ2MzVzUnNJbEo5OGJpUW9YT3p5aGJm?=
 =?utf-8?B?U01EclVRdy9XbWc5TWxKaVYxWmg5eE1pbTRiell4MS9jc2VKemZoT2lGWnNB?=
 =?utf-8?B?YzVBY2x1dUxJYnFaOENzNlMrdlB2SHh0YllQeGJrcFREYXpWN0JLWU5LRmlF?=
 =?utf-8?B?Q0VlQjdUbS9DY3FOOFhEdnF3bG9vbkpISWJxeFVsV1J3cVNsZ3cwcFVpS3Qz?=
 =?utf-8?B?VkRFRGZvUUxobWh6azdpZnlTSzIzK2hSc0xhNzVOL1JiUGpRb1crZlBtMHEr?=
 =?utf-8?B?ZndibEJLZUdvRnNvaktIMjRtSGJXTzM5bVNTajJpY2VqVUpJdzhHNG1aWHBL?=
 =?utf-8?B?ZVBWSTFTcjFTTkJpdzlZM0tXdmpPbUh4MUdKbjRwRUR3dkJzaUw3ZmhUbUth?=
 =?utf-8?B?WC9GcjJSZU5PUDZ1ekZJdkI5Y1hkS2R2TUpsdTVlRGxFV3l0b3JwcFI3RmRG?=
 =?utf-8?B?UGRWb2syeXBXUHphdzNwRlBEZWNGMlhRUmhHUy80dEhySnBEb2c0c2NMUXFN?=
 =?utf-8?B?YzhnZks0K3JtUzNWR2JYM1NHa0wwenFmdHdoZnBZTm5RZk5VTXNHNnZWVnRY?=
 =?utf-8?B?c1ZwbmJiNURYVTlHa2I2YUZ5QXB1SVBxdEg3TGs4VnpnQWU2eFBhOGNTT3ZP?=
 =?utf-8?B?VVVGMGhBQWpUalJsMTRqQ1VZM1lvUXhpKzJFM0RUVFkzNkJ4eFBaaUxVS3Ro?=
 =?utf-8?B?WENmcndPcGQvQjhDdEtnVVJFYzBtNnhvdWN1U3U0emJZdVlnem1mVlRIa2t2?=
 =?utf-8?B?eEpROU5reGxtUUpmTXRnM1IzeXNnaFJXMGdNWFZnUEMyb3VlSDl0TTNMdkcw?=
 =?utf-8?B?Z3lKaWFjdzFGNzhQN0N0RTFtcjl5a3lOUVI4eXIzMERsdVN4bUR0eGEyQWJo?=
 =?utf-8?B?NDU1ZENKNWZWR2hsdEx1NG9kc0hHQUNBaWNpVlVVQlRSK1JPSnJqM1hKZG1U?=
 =?utf-8?B?VUlVTWZOREU1YzAzekFNOUEycDNDNk4vbVZxejIrNThNdHI4RC9JY2pjdjNT?=
 =?utf-8?B?L0JwQk5HZnNTNGlIKy95aUU0ZVpScUYySGY1RmdUdHlWYnE1ZEd1a1pLOHlK?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ac85f6e0-8e68-4509-8b0b-08db104831fd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 18:04:06.7335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 j7GpV0Z+NzKWyizbaDaCfYKXgRZnvtbe1pSH9UYMheYrMJ0ml/yzsMtExTfIH876Dwxen+8wLntkBIHpPbFV6Z5/wl5EyFkUOQ76BeyRiDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8027
X-OriginatorOrg: intel.com
Message-ID-Hash: QLZT5FRSAPDEPOP2YZ3UL3TPC6J5OHUA
X-Message-ID-Hash: QLZT5FRSAPDEPOP2YZ3UL3TPC6J5OHUA
X-MailFrom: cezary.rojewski@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 Sasa Ostrouska <casaxa@gmail.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QLZT5FRSAPDEPOP2YZ3UL3TPC6J5OHUA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-02-15 12:17 AM, Kees Cook wrote:
> On Mon, Feb 13, 2023 at 09:52:23PM +0100, Amadeusz Sławiński wrote:

...

>> diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
>> index 6db0fd7bad49..30a0977af943 100644
>> --- a/sound/soc/intel/skylake/skl-topology.h
>> +++ b/sound/soc/intel/skylake/skl-topology.h
>> @@ -115,7 +115,10 @@ struct skl_cpr_gtw_cfg {
>>   	u32 dma_buffer_size;
>>   	u32 config_length;
>>   	/* not mandatory; required only for DMIC/I2S */
>> -	u32 config_data[1];
>> +	struct {
>> +		u32 gtw_attrs;
>> +		u32 data[];
>> +	} config_data;
>>   } __packed;
> 
> I recommend leaving the original memcpy() as it was, and instead
> creating an anonymous union in place of "config_data":
> 
> 	union {
> 		u32 gtw_attrs;
> 		DECLARE_FLEX_ARRAY(u32, data);
> 	};


I appreciate the input. The reason we're sticking to struct is purely 
for readability/maintenance reasons. In the past AudioDSP drivers were 
declaring structs that take part in the IPC communication differently 
than the base AudioDSP firmware did (i.e.: the other participant of the 
IPC). Over the years this resulted in communication issues between the 
software and the firmware teams. Thus, for quite some time now we're 
sticking to same naming/layout convention wherever possible so there is 
no confusion. Works out pretty well if you ask me.

Now, in regard to this very case. 'config_data' consists of field: 
'gateway attributes' and an optional BLOB (hardware configuration) that 
follows it. Often this config is taken directly from one of the ACPI 
tables - NHLT. The NHLT stores hardware configuration bits for I2S/DMIC 
audio endpoints. Unfortunately, each entry within NLHT _is_ the entire 
config, not just the BLOB part.

To make situation clear within the code, config is described with a 
struct, not an union. Given handler may access the entire config through 
&config_data when memcpying, attributes alone through 
config_data.gtw_attrs or the BLOB with config_data.blob. Again, readability.


Kind regards,
Czarek
