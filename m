Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 527D9606273
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 16:06:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3FECB872;
	Thu, 20 Oct 2022 16:06:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3FECB872
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666274818;
	bh=N+p5zyz5vQrS/HIAT5MI87bE9HToGeuo7DSTU9BrOwU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fcnwbULlQn8rnX4S+79Ev7k3SKKP6MthrxLMWLebhr8fd+FS8V5kh10+4BWa9JSD1
	 j7/fCbj74ZCcp6GiklZ+H9dEosUV6O7nOaS1fwfskKgjOdGFP5w0Vaxc1xp6thN6yH
	 QTXMkp7Gb1yJgBbq4CYv6BC3fsaekadOaKy2IThM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A557F804E5;
	Thu, 20 Oct 2022 16:06:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCEB4F804D8; Thu, 20 Oct 2022 16:06:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1A72F800B5
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 16:05:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1A72F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IIHjSFt3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666274761; x=1697810761;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N+p5zyz5vQrS/HIAT5MI87bE9HToGeuo7DSTU9BrOwU=;
 b=IIHjSFt3WQzRootorplOUgT6jvRmvh1LZT1AfW3AdLmqAV+JWYu+f2gO
 Lx+lUd2dWBXPWd6bjT83Q0R+vPJAr2zoQaP80LnxKvm/JqYaT2hoDK077
 ZStpPuStlTiH7qXYHjcH1utDzJucqtlAPkIAdqhhkFulwfV7eIkAPeNLz
 jdeOonCe+Jj7Nz62eUBxURa85z8ZKTguDaFw7RiR7MIqQHDSi1e/zKYuQ
 Jvb1SubThQxvnA4A/kyywlxnkyNmg14tMGbQNW+MRKV3XktmcLLm4ed0T
 EZc8Fqlf5Be7z1VLakLWW9vUtWRITvU6PFzEAoYmH00TmFR1tqVFN8Jqt w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="294109980"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="294109980"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 07:05:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="772377298"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="772377298"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 20 Oct 2022 07:05:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 07:05:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 20 Oct 2022 07:05:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 20 Oct 2022 07:05:44 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 20 Oct 2022 07:05:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4PeJro9Aj+GksioyQhAo2ecvmn+lHvtDpeE/6gma4s6BHgPiYdbDMbMjOPzE094NfGgwLmuNwgit8aKEhCTLj/4DQ/vKFo/RQyPHe5bs4dDbd1jPw5NYKYrW1b5Ef5pDzU1yIVJSrZFLhz2xSxLGpmesuYxXGlBvXOGM05JjEcJqt721oNKpKZj6T0dnHdkOyb7erZJARO3KEq8OWVcobQ4sTuhJ1Y3K08H8W6wzhdqhpjksoKBtM0gbbPohVctvHtM4yN6R+XpuIgNcLDWHUxNN9O3TBEBH0RCacvDxsVe1dMnDyfNIL1Ei5aV72jVe1NOls++pjkkPMnmHDE+cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhsQFtn+Mi/4dJRfSNgBb+4ZU0mSYtvCO/4M4gWmMQ4=;
 b=jbkrkKy/JggYi3xBLPLTi9MX/LHNgd8fonRcRa9Shon9S5cBtvLfDqGF5o9PnUma8M4rKpfYoX4GXtG21yqYMixF8fTFRZzfXFQsCevvCrdlT39II4Tx28UUXGgQRlL9lcR3LTcmQG3rrMWYROgBvOm49ikDTi29akcGdMpE+uLT/NEkC51uz7VFlFYu6MMXQXXuV+xcKs718RBXbV0tmSX9SU4NGLQus+nwgYUy70eH7mFpzKa1orvyWRs1zaV00dfZU6hNOSuZwk0MYvLUwvz9TkeGBkfq0MOBTvKz5I7ItLAWvk8jNZAd/dF2Esgg5lZvdi2pqfFfYD5z8WgxsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CO1PR11MB5074.namprd11.prod.outlook.com (2603:10b6:303:97::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.29; Thu, 20 Oct 2022 14:05:39 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::8ec8:c973:6423:2087%7]) with mapi id 15.20.5723.032; Thu, 20 Oct 2022
 14:05:39 +0000
Message-ID: <1ed3a5e2-0c09-82b1-9704-3f999794227f@intel.com>
Date: Thu, 20 Oct 2022 16:05:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
Subject: Re: [PATCH 00/10] ALSA/ASoC: hda: cleanup sound/hda/ext code
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
References: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
 <87tu3y8vj3.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87tu3y8vj3.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0522.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::8) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CO1PR11MB5074:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dc397c4-dc10-445d-6855-08dab2a42ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I/Vh/TqtQivCESjjCpf7CMMpr3JV1Bm24B9+ZHxlzUq3gOx0XJgJT8oKakYb9gLYPpQJhCBC8LrH0OP5JKo/XEM0ny4GKto9acjgojNf+OBIRGg8/ulxunt72HADv7u8YuOj8vXvjM9Arf13yEeTSBVi8cPQCrvTwabZ4IRKQQgQRbqK70G9JADf2ViEtK5SnRZfg4nojdrfH3g6VccrKaBv3kZ3908F8arWu4br0VuWTh0dilB3QcOgfldsXlrd1a+gzAwi30SkP7mV5iOn7hCi8Ej/YgrMG+Dqrs3bPvQlEeUWWaQWriulpBIkl4pj4bn/Qg2ZAvq2+4Kn70RJcaJNBn0+of+TwGfpI0QFpNHIQ9h0Oc3iiUN1hVYD0tb7uYfzw0nahgpFclNOUPLYr8GTPj7J+VX9t5udfXnxhuuvilTgXUL0c81fE3Vdmm8a0OJr6hPLSsjo9IetR2TecQGqMGaZVnWQWPtQp8IHhF5PE0SQPdNh6q0rdBgPpnCNuFG0irCEdci+2dNDVlyhhNADrv2mSsU0STh0HZnCH6baXfn3Yva/V1Km74xLkK/2t9FzcM5JoAxUY+frqPV02yhW526kuIC89JkM0sbp55450+GNcnIhhqqQ1ANIGKTyD0QuOdh3NDn5QflM/sX40BqfxkR67BLHZXzPoP080UI0iCs4s/Mxgn+SmhUeWVcznZ8MbjJYxYcN6r7pilDKE8XbzZLwdK687/I/CF6tf28ls38lnCdFX5713QllnzMaTJeeCJ2Kscwacz9kr1cD+YKFjIdUtpsn2A8LKHM9s7w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6375.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199015)(82960400001)(83380400001)(36756003)(86362001)(31696002)(38100700002)(6666004)(66556008)(316002)(110136005)(31686004)(5660300002)(4744005)(44832011)(53546011)(6506007)(186003)(2616005)(8936002)(4001150100001)(66476007)(2906002)(478600001)(6512007)(66946007)(26005)(41300700001)(4326008)(8676002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUZZZVNYMzdyQm5qdlhoVHJYSEZuZWlMeFdmZXY1dDlHbGNUSSs1ZEhnTTkr?=
 =?utf-8?B?a1ZjRTh4MUF6UTA0RWQ4UzdvRnZsWVYwYXkrR0xkR0lsV1JVUS8zVS9CZW5q?=
 =?utf-8?B?dE5FSFEwVy9nSUloMU51NzQ3VFVrMk8rdUdyOVNTMzJQT3RYUE1DS0FxeGVC?=
 =?utf-8?B?ZUptVHFSaC9rNGFwTDB5ak9iTHZUb040U1o1M2JKRXE4S25WSUxLYTJEdG5T?=
 =?utf-8?B?YVpIbUF6ZXFTRHBkcWl0RU1ZbVdHdGRNK05raG4zbTgxaERzYVhBL21OaFhR?=
 =?utf-8?B?QmJaQVRjKzhUbHFCRk1DbTBYS29VQTMycm5lWXhra3VGdlFQWlpRYmY1YjhG?=
 =?utf-8?B?bExhQzBLQVE4QWNuQm1yTDFJT3BOM1lud3h1djRsckVPSWVaQWV3SGx1N2d2?=
 =?utf-8?B?amVSRzMvNWRTRm1IMGdXdENXalpOQmxjWUJiM1lUMlVWeE5mWEpYR1B1MnJs?=
 =?utf-8?B?eWhrelBIdkVRa3cxNVIrZ0ZOTjhhYW1sUGtkSURWcnA2YnFJNHY4Szk5V3VB?=
 =?utf-8?B?SjRqM005TGJXWXJkdE0rY1hQSXJrWEFncVBtMXk4aU9TQXM5OWpxRGpsVURR?=
 =?utf-8?B?T0NjWHIwMG9iRFpzYlBSdXVKUndkUDFDcUVTQ1ovVnlCTDdLZ3plUDJUL085?=
 =?utf-8?B?Q3VNV2VsbFMrWTJnV09VR2FCanZwbHVzQmpyYUV4dHRwWFdpYlNGRmJZalBr?=
 =?utf-8?B?RTVMMFFOQUUydHoweTF6R0IwbHkrQ2RjQi8xWk1Va2ZDaUlkamUwR0YzSDI2?=
 =?utf-8?B?RUc2UTRGNXVEVFQ5L21RU29aVEt3cy95bXRJSUtJakw3S2ZuSlNsQ2U2dXFj?=
 =?utf-8?B?Y1JmSDJoUEY0ckUwR0hOWHVFeGJPOVZKWGNBTHNLOUZOcERKbDZQL0RzTmlq?=
 =?utf-8?B?VkxobHM2d3FBcGNMUEMrNXhFNFVubXh0MzltNVg1UWpra3Y0dFlwNy81VjEr?=
 =?utf-8?B?MWVKa3VMc2JhNG43azkzWXdxQ0RYUnZVT3lYMlJyOTAvNjMrUUhzQWZzcklE?=
 =?utf-8?B?NmsrcXJhem45Q2lLb0ZNZG9jOGh3MDluQU1qZzI1eEJrYm9GU2RYaEZtdjZw?=
 =?utf-8?B?ZkJXaERNYmw1T0ZRVTlvUmZVOW1VaHkxNGtDc2dCWnZ3ZCs2dGNDMExydTgw?=
 =?utf-8?B?NmtJVmpKck9ucHVXaVBiN0dlNTI5OFV4dlFpeXIwc0UyQUVNNUpHOGEzVklN?=
 =?utf-8?B?WjY5VEpNRnhMMVNCOGlxSVRxWlJqT0ZTb0hXanBxS2hXbHo1K2VoaXhUNlpm?=
 =?utf-8?B?c1dpVlVxVGVXR2hlaDRUWkFsd2NOMHFTN3orRm9uOW1nOEJWcG1SZFZiVEpV?=
 =?utf-8?B?QTVXT3JqdGFvaE10RVRSM0dxSXdicEwzZ0o0QjArV2szYUNnenBUdklZQUpR?=
 =?utf-8?B?TUdsUHprZitlMjROeGxhWEhDM2hFRitLRTR2Z2Q2UWVZMkk2RUhJN2dsK1NV?=
 =?utf-8?B?Z3hwS0JKTFdNV2IrL28xdFFUVmszNVU5M29sbjBCZ2gzZnVGYkdFRUJCQnYz?=
 =?utf-8?B?VE5aYi9XcmN4UEtBSHBtbG0wcHRmdDRjNG54aExScW9Xc3VqNmFISUdRcXFr?=
 =?utf-8?B?TVNtWGxmL1RJMzhLbUlRVkN5ZWNPNVVBdU03NjJTUVJqNFFmZ3krOUhHQVls?=
 =?utf-8?B?VkpKK1g3enFtZ1pJUndFTUVaWm9XS3pnVThpT3FRRTJvaHU1L2xVSU13K0lK?=
 =?utf-8?B?OVArU1QvMXlwTStIcndsNWtzQllpUC9FSVBlM2JmWU11cHNYdXpyS29qcjlk?=
 =?utf-8?B?TVJUTDdIdUtHR1Y3OWYreTAzamhuSmlFOTZjQ0R4QXFMNGdNVnpZclhycUpH?=
 =?utf-8?B?N3FtMFJaZmlFN1B0cjU5ckFMcFdaSDk4UzViK0lyc3d2Q3REdklaZS9yRnZI?=
 =?utf-8?B?alg2UlNpVmxSeW5YU1d1ZlkvNkdWSVNmUW5tZDFGUS9RS0E0d25ZM1NLczVF?=
 =?utf-8?B?QllKSTZDVHFYT0lPZ3dSdmhYKy9lRzY2c0JBUmJENEtyWmFFMy9BTUxkSHZV?=
 =?utf-8?B?UStYQmg5Y2xpa0hHWHNBTWxKZnBhMGhCcUlwa2tDZWRJSXdxQXNkSDg0Mnh3?=
 =?utf-8?B?SCs0RE9nMXM3bzZyVWJHbU9meXQzOHJ3N1NjRlhLbk4xOGpuMFVySEV6VVM2?=
 =?utf-8?B?dU92NFJIbWNIWUllekJKZXlzRW5vOEN3ZzRlejBaNjdBT0V2MXgxTGM3N0o2?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc397c4-dc10-445d-6855-08dab2a42ab5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 14:05:39.0383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 340bxgfhmyIv9Bh9eV9auZnup02Pg/clXSY7SNRcSG8Z2kWAJGvV6p1alFpPvKtDHx4Jn6v6CDX8lWpNVslVSJCBRt80R9gsuqDbqWEYlPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5074
X-OriginatorOrg: intel.com
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 2022-10-20 3:38 PM, Takashi Iwai wrote:

...

> Applied now to for-next branch.
> 
> Mark, if you need those changes in your tree, feel free to pull from
> topic/hda-ext-cleanup branch of my tree.  I can add the tag if
> needed, too.


I'd very much appreciate if you merged this series into your tree, Mark. 
As Pierre mentioned, recent PCM suspend/resume() series for the 
avs-driver needs to be rebased onto this one to eliminate any conflicts.


Regards,
Czarek
