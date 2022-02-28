Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD0E4C701C
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 15:54:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94B8B1725;
	Mon, 28 Feb 2022 15:53:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94B8B1725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646060050;
	bh=zlewDTMBs/b8s+U5wrLwQtWM3ltmqNlhTT6HY0+sms8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AFBQiiudEBgBnYaJ4TtBsWbDxOipaMTM91ItZt8dXZDcGE9ZDrcHoq0IlA7jYCMmG
	 Uw9QxkfeGXOVwhzfEMfXgHFQwFjjrnhprKOQB0G+7+vYL5g7eezMDGQS7/10xeCkh3
	 E80wzBpK17wnbhOJd908vZNQRk7DEKkmCAlmarQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19DD8F800F8;
	Mon, 28 Feb 2022 15:53:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DF2CF8013C; Mon, 28 Feb 2022 15:53:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5978BF800F8
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 15:52:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5978BF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QyOV0drn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646059979; x=1677595979;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zlewDTMBs/b8s+U5wrLwQtWM3ltmqNlhTT6HY0+sms8=;
 b=QyOV0drnoD3OFlKkmyzOVV29XCguS3BOlwFiY/O8rmeo18AsbkxCOoX7
 zj/hT6miIOHfgMJPwijsbDrRLad9TLk2ityDqtM7l4QxjQ7L+cFfOaD7U
 9rLZ5VU0ujgIqJG3j4dVfkUqP5LIrzbIZQVYAnm578hwMp/M/e8jah2jS
 T4yhTX3XXGK9MU2kIVRckkCJj0LBp70QCHBej5g2Qc6Wd13XnSJi31UPW
 Z0nM6xLL3hZTY3l3d/4al3f5b3VRcAdp59CFfW0uR4lH07HBrjtzz39fp
 ZKeuiv6UptH5qCwoHuo5pHcJyIq1OBaFzNDisPCujkmUGcRbR76FQQzx0 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="313615267"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="313615267"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:52:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="685361082"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 28 Feb 2022 06:52:53 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 28 Feb 2022 06:52:53 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 28 Feb 2022 06:52:53 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 28 Feb 2022 06:52:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/YnCZOQIgVx9a4p5XBygCrHcogbY6fBJXpaCq1aGRI+6TvsjdJCirOiSAm0qzAVbpWO82/kK7QumOMfefBi+b3Ufyc6Nd8SAUZX1rfqbVRxOIXpqwZjWl3gcDHFA7sger/Ednpi4/6SenKd1UpENi9ubrjDdVPdOrT41eIy/gPgnpMCfsLX/mLcSw+SlJ64vya+gkHA4PsV4qFKVrg95/fJwQxitYW6SRJiYmuD8z/+W+e8XN2l9ZdPVDSKfYF+lqGm7jYS4cvgfNMvxcERKj4WiJzs2Gi1NJUjqJnf+ScP790oyaqGYtHVG0OaU2Wdvu6zxR/6+1fQatWL0sbtew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ee99mBI42wpxZG7vXAmseB30TW5dcJ6qKsQ3Zy23rPg=;
 b=jW15H0v8j7SzCxvbbkUbWvpd2kEzzjT7ziladdiPdyXeK5Ro2EYLcRH1ZmYj90dtQk1PiMTpunAjfhfBZWrpnaVIEZAPydfXIU36gJhviGYIV/khvp4YYoYxo7cRDiBLu46KISbhqCkM/UpSsJOrcx6Iv1JB71obJtdIlU2FUZ6bfqpnLKTqvgv8F/jdlFWDr/xfNxRnKCf3E4Bs9sBOnChXcjL4ibVetg0asI7HTqldNQWlAM5L3J8gU5eVKPSxJDxLzK5XNgHPB1RUwjfEBRG80PYEkPv9NW0EHaaYHQTX1ebDhn1tlMbdphwGQC8DzNQ6Urnn6nlsEs0BgEqvow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SN6PR11MB2701.namprd11.prod.outlook.com
 (2603:10b6:805:54::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Mon, 28 Feb
 2022 14:52:51 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::24c3:c14:92a4:22a6%5]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 14:52:50 +0000
Message-ID: <ea14a1c3-63a7-9220-222e-12f85d1d7ca3@intel.com>
Date: Mon, 28 Feb 2022 15:52:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.6.0
Subject: Re: [PATCH 03/17] ASoC: Intel: Introduce AVS driver
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <20220207122108.3780926-4-cezary.rojewski@intel.com>
 <bde92ad1-0eda-d70a-4435-4963aa617cb4@linux.intel.com>
 <f1b0144e-94bd-deff-67e3-97bb310b0860@intel.com>
 <429b8685-1db0-1b5e-011f-9b5b355ddd85@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <429b8685-1db0-1b5e-011f-9b5b355ddd85@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0092.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::13) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 31499529-cc6f-4188-b73e-08d9fac9fdeb
X-MS-TrafficTypeDiagnostic: SN6PR11MB2701:EE_
X-Microsoft-Antispam-PRVS: <SN6PR11MB2701034D22FF9138CBCB9696E3019@SN6PR11MB2701.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ISpHih6wzf3FM7nkAzATPhMw8M0aTSpSHDXgH7lIuX/Fn+8ijXbDw3EgtonF1MW44ZA6PXJbgHJ1ScHXQ2wWPWjxOClluUVbPBAMZVIXcQdR9hUSeqJfUm8HkcJM1u67Au0+L7WWj5n699G6DfreFwDmFN5JYD3T8l1ZOznAEEpTl8C5bUrOePruVGVZen8qOkUQXys4AcTBQKJAkPhQB0FSTrsdRUOEJYmnvBBJx62jpd/Hdp03DVy4EjO4EnTQsxq3lM6CPMCz3OFAjxWXb+sToFghSaVwtPnQr7gIyVS6p3+8pH1kw8XTkOjPPacWpas4OX11kg8lOun8HM4sgkl8K+U+SsZq8rmKTFFBC3jhAu7k3b8/wTXV5o+/33D7/igx7zkKyDH3B4p/VZ+zI5ls3zUF8ODxDwUDPlAu0nLjekvP9GciKpIB/mZGJ/S5rGxrGDpcGX2ctnbxyQdCFuRrlHLXOv9TyDYqSW+opUMDdd8ihKN25ZCOyZQCQGQru/onMpPaavG8jbvFR0AMLLd+pUQ+xYOtiHiq5cG7QxOMoZwJt3Gmv+Wn2A1u5avdaTDsCEQWXUuD9hwflmIAIvMSbzwa0UF61I6LgQsiQqE1KuBYOXHKBzIG33fl55KL+lpwdsFgQ9lTn5CkVCfrwxP+Z3c5CI21mbdLGcb01N60vVzNnVJbsJm0pmQhl1KxqodP9cRZSZ3Ee2beX4zSiELkbcrefixCd9b62xbklp4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(7416002)(5660300002)(6506007)(82960400001)(31686004)(36756003)(6486002)(2906002)(83380400001)(2616005)(44832011)(4744005)(508600001)(53546011)(31696002)(8936002)(86362001)(26005)(186003)(38100700002)(6666004)(316002)(66476007)(66946007)(66556008)(8676002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWFjb3dSanFIa3UrSlRKOEJjVEwzTW5OZXNvc3RnRDMzYnZCclpOVlY2TTd2?=
 =?utf-8?B?aGgzZ1RZcG94b0t1d09Fb1VCbEE1cUI2ZVJ2QlVwai9vUUNYVU5lLzNxaThE?=
 =?utf-8?B?N09OenVPNFdPUytQK1Job05zTWZqSWJ2akdRVFJLUWd6dUZ4OEJOZEc0TnRP?=
 =?utf-8?B?Z2NsblViWk9QV1MwOE9LUEE1UGs3QXV2ZTRoSWcvUW5XanNxSEFrKzRHdjZm?=
 =?utf-8?B?aGs4SjJZTnlIell6V2JpM25xOTNWeFpJSW1jMEpicGRpS2NlUEN3NXZIQ25p?=
 =?utf-8?B?ZWRhWlF3RUFlS1lJTGdJUFRyK0tvVm83MzFldC9Rbmh1dEkxVjdZcis4MW9J?=
 =?utf-8?B?Unc0dE9DazRURzllNnpVeHpnY1JIc29xQ09ydEo4cnRXMDBYKzJzVDRibXBN?=
 =?utf-8?B?dnRXemNpcDBTS2w4OWhBVVhqRDA4TXJ5aDZGeHUvK0hjeEJiT2JVcEgrTEZY?=
 =?utf-8?B?bWJGSnBJNy9hL0tZaWp0TEFxeTBGQ0VvaGoraHZXdGpwQ2l2SU5Jclg5b1hv?=
 =?utf-8?B?dytYTHBPZlVJcjJuN1lwMDM4OFJYVkNrOXBtQjM5Q290UEh1UzZHMFdQVktJ?=
 =?utf-8?B?cVpkSzFvV25UaURXemRaZzU5NmgyNVFQc3JmUlZZeGVDbS9oOGt3aXh0N2hu?=
 =?utf-8?B?QW1WM05HdUZjMFZKdlBmajkxVnI4WDY3UVlQV1czUzlsL0NXMWxqVXBocmxQ?=
 =?utf-8?B?MlZOSElIUjFBRWJxcld6Tm5zZFBZeWpjTFg4WG94NGllSEpOQXVaNlgzdlEx?=
 =?utf-8?B?UFpTTHJhS1U4U3Z4bEZwajQ4VHFOSzFidlhSM1BPUVV3bFNFMWV0RC9obkFh?=
 =?utf-8?B?amozYlR5OUF2ZWJzODVXZ3NjclYyTFlQbnMzVERlNXBXcnhzNExkRWVQNUpF?=
 =?utf-8?B?Z0ZyNmg4a1VBcEp5S043L3pwZWZVOHB0RnlPY2lWcHhmbXhFU0dEUjFuU3F6?=
 =?utf-8?B?QmJ0aTIvaVkzMnNMeEMrSHA2cmFzQklrVEdpNHM3bmU5ckFUWmtLMW5HOHMy?=
 =?utf-8?B?ZE13TE9ML2pkang2Qld4SExDdEJyamZHdWtPNWVDNFZkRVIrK1BnejZ3dkQz?=
 =?utf-8?B?d0M5TFhkR0JzVGlIbWpMQ2RRblEwbStxanA1QW13b0NpTEVsT2xUeW14d09V?=
 =?utf-8?B?azQxcFpjeDN5NUJBbTdGaEozUWx6TmY3YlB0dlpXMHdiYWhqaTZHMnYrbGxV?=
 =?utf-8?B?WGRlTHdWMHhLU1BWUUNvK1lSUEN5cVdiRUxoTS9zQ3djc2tMb25MVmR4QzUw?=
 =?utf-8?B?elR5bkdIenNBK054cWtXZzVKVXluTmt1OWhKKzNyUTYwYkg2amdPby9BSzFj?=
 =?utf-8?B?OWozNHpxOFZTNGp0WFZkV3M1OStIaUI5bWE0Q2xZRC84bjRucDhFZjZBb3Bn?=
 =?utf-8?B?bnRsazMzbkMwWmhWdzBMay9BN3lRYlk1TVR6SGNqQmdiZVY4V3lDeE9ES21p?=
 =?utf-8?B?RWJQRFhOWXorTVJRRk5NMEIxUmlaQ0NuS2d5MlNsTXV3Z0Q5NElHRWRoK09J?=
 =?utf-8?B?TmxPcFVFSG85ZUNhSk9DeUVaZTFBWjl2WCtjNDN1c3pPQ0x1eGdNQm9SMEJ2?=
 =?utf-8?B?cGVtcGg4U3pjR0wyOGtjejc5QkxzTjROTVhEaEFYaXJZUnJBa28rMWh0bldL?=
 =?utf-8?B?aldnM3dlaEhYdUtHQlhXSU4yVjRnb1l1Tm9NK0srck90N2lNdFl3RkxiaWhR?=
 =?utf-8?B?dm5wUFg5amoxYXJKaU9CTXpjbUdkM3M2MWN5SVBTMTBiYUN6QUc0ajRXODQy?=
 =?utf-8?B?cm9EU002WVlHZzM1Qk56Ni9KQThkeUpkQ3RyN0lTT1Radmx0UFZFNEFvendV?=
 =?utf-8?B?VmgvNWR1bjBDNExteUZjS3lVdGw5SW9ONDY1WFRTcWc3bVUwbUVKYUdhYVJT?=
 =?utf-8?B?bDFlZExHbVduY3JiV3VueXdkVk9TZ2FGd09ZUFRaYVZjclhsMXNDNFMvZDdr?=
 =?utf-8?B?SGJoU2NIc3dNY2NrWEZXaWw2ZDhYVE8yK0krRURLOVRYMnVtWGRWMlFOR2l4?=
 =?utf-8?B?bHlOcHYzKzNjYU95ZGZKOVA5Z1g4ditzOEVyZ1VmK2hzQVBuL3orYmZzcDlP?=
 =?utf-8?B?dkJtcTN3Smh3d0I1dEJBN0s3bE44SnJGVjdTeExFYVp2VGFGUUpyVWlhUmNX?=
 =?utf-8?B?RkNRb2gzbzB1bVVCVkZoSUZJcWlJSzFtRk9RcFRpaVF4V012ekJ0WmVFNnpW?=
 =?utf-8?B?R2dxS1d1UkhsZFpkcU9VbDk4a0o2d3d5R0gxVVM1YlZNV0dWUnNsZ0xXMzho?=
 =?utf-8?B?SE9LUjdQSlFseUNyTmV1N2Q4ZGZRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31499529-cc6f-4188-b73e-08d9fac9fdeb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 14:52:50.8058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGTzbaW/rq0AiE1hlhp8fW+07l8DSJaNrP1+v64ARkcYi4+TfY90Et+x8wxjXsgKfAIXDv7iqu+KquS+ZDjqlvR4KLK4Nssusp0UKLnG2Qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2701
X-OriginatorOrg: intel.com
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
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

On 2022-02-25 9:23 PM, Pierre-Louis Bossart wrote:
> 
>>>> +int avs_dsp_core_disable(struct avs_dev *adev, u32 core_mask)
>>>> +{
>>>> +    /* Be permissive to allow for full DSP shutdown in disable path. */
>>>
>>> that comment isn't very clear, what is permissive here?
>>
>>
>> There is no error checking below.
>>
>>>> +    avs_dsp_op(adev, stall, core_mask, true);
>>>> +    avs_dsp_op(adev, reset, core_mask, true);
>>>> +
>>>> +    return avs_dsp_op(adev, power, core_mask, false);
> 
> consider adding a comment then, along the lines of 'we don't prevent
> suspend or shutdown with error checks' or something. 'permissive' was
> rather unclear to me.

Rewording in v2 as suggested.
