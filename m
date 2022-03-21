Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 283764E24B8
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 11:54:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAFA51705;
	Mon, 21 Mar 2022 11:53:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAFA51705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647860079;
	bh=E6Q9yqz3HEAMr6npOcmSmZ+nb6xJknHE1ejS0SaGafQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sXfPa4GpP14Qpcvlqo9FamdBIIjgAL1EhlD6/h+9WfNArc3bilLbu1J6vPXOjGhb8
	 R9yLKadZWjXPoEgnYmyyKUIPtpmmtVGd7Sx85oV9zhg4er6nnJX1juiNzmsEvV+onp
	 NpLibcK38UNn3NkSWvvYNgY3zgClM4y6RSuI33J8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CED9F800FD;
	Mon, 21 Mar 2022 11:53:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9E0DF80227; Mon, 21 Mar 2022 11:53:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C06B0F80116
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 11:53:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C06B0F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Y5vuaMdO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647860008; x=1679396008;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E6Q9yqz3HEAMr6npOcmSmZ+nb6xJknHE1ejS0SaGafQ=;
 b=Y5vuaMdOwrDAaGc3tc29vCWS9oSrfO/KRDviBW33c10ERCcoxiX1QI+Y
 GUeJmduubqXL2HuroznTha5dktqdip2YS0+y6hI4+k96LAdK9RJktFWBe
 Ubus5fNu+kCNabdKjhFzuccedn16xhNpINFNM+NaN6gDv9k0ArHLV19w7
 ZCtvPt0NKsX7v0J9bIC7vhRNeXfNYxzJzBK9nG5B5DGq7/LUPcKG0Qksm
 52zumgsX8/s9i5aW9cLJp0zj1WPAi20SufWijFnMopYfljMoF5k1xPrVs
 kk5S6sWquUiF93ElTxxPQSnQQsWH4umxVu5VJAkh0WN7+Ash1479Er0RK Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="256340829"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="256340829"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 03:53:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="500129717"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 21 Mar 2022 03:53:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 21 Mar 2022 03:53:21 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 03:53:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 21 Mar 2022 03:53:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 21 Mar 2022 03:53:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeVXVpFpk/Zt5J0+1GEhXZHeWSL27yRk0i1HRRdumETK2VWnq21KSynJJ+Oh5YT6KNpYqCF9oynsMy8i0ty3UGaJ7J2RrYOUfNDIDLFlsNf1ymfMnJ+KPSymZwJuEHNRg31CXHmGWsDLFwsQRJowGhZTNfKmCH7Vu3Lqfo1OyDZIdmEFlnJalQNVLneCKRJ6xwbrnV4k2TWei03zAiFnfOvQl/mL/p76gJ/N2v0htBkX/rk1lAjpKIfRGEuCCOXIgpd93Ee7WENMaxSelcFcFlHi3Snytgp662Dr12Yff7gR8GLRaPGVcUX27p90+O2uoICnZXkV2BWmoitcZmIKww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XwV3Ao5q358EongvaWJl90j8bIANVuuq6VkHYCg6Bc=;
 b=VR2AATQpzDfi47gA3+QFHlgQXAcMf1KRQO+Ms7eS4R52JcVcNMtwi5s7WeiHaA+q7k/kgytH+MNHnXiyjFEiEa1obSij3lHazGLQIVvLK5rpn/qfckfEtkpKU3hsAk6+lu3VDRw+uZP8CRf3WjSPtCMdj3vuAmh58zQFZJwKIX4U4pNWRVN/K5bUi+AuqWt2g3Am26yaGmmfdib73ONgmyJmhviv7pocPtp4fZ9tG4iHKYgn4IUAXs5b0AhGH8VJz8gxp8hIPcE3xUjlJCMjGEmj3tKvh/zQwO29eti62PLDlzRr+OWqQgB3YWLsqAG3ju+wcIjNg6vQQzM6IqJgrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by SJ0PR11MB4976.namprd11.prod.outlook.com
 (2603:10b6:a03:2d7::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Mon, 21 Mar
 2022 10:53:20 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c%11]) with mapi id 15.20.5081.022; Mon, 21 Mar
 2022 10:53:20 +0000
Message-ID: <104986da-6e3a-fb77-e488-7b8b782f2235@intel.com>
Date: Mon, 21 Mar 2022 11:53:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [RFC 04/13] ASoC: Intel: avs: Parse pplcfg and binding tuples
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <20220207132532.3782412-5-cezary.rojewski@intel.com>
 <a32be4cf-3d33-4ffe-71ce-84cd500d520f@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <a32be4cf-3d33-4ffe-71ce-84cd500d520f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0069.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::33) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57bc7c76-6c59-4681-bcea-08da0b2902f2
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4976:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR11MB4976965F71C7571058D677D3E3169@SJ0PR11MB4976.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vx++EFRPi8gUVGM8mTLVGxtuvN9KeFH/+UR2u4snVx5JZBYSchMjInW2i6hhrxWUaJtPnLnv0Yk2+bsovTyuEOT+FKmJC8CowZGPs7Mos06s9/hqDuRTBJQUYuUaU/mspiNzTCyJ3JnHQW6wg+u8RmA9k+Zt9WL3stkIAUi8YKC9hIGQpPBbDE5Mrud0RlW1gk3LFPy9+6uqzs6B4g82FpfmTaEEUPpTh32QbGOcJQii5PlXEohgvX51266U9m/izqqobK10BOWPXsKHOLIQUj1BaPXeIQCbNyik7+hLYK0yKUohKSxLwn1QQ4DmYB2Rf5su8+nkhonXs3PRGC+0A2aSw/MSNmTAyyK0lPrK9JwBGaiKDMZE4z2bth+Jf6f0ONzmmXTq8UX71wgNRNTVI9BxxLYdxPc/XyqdkN40erbcE5aZ/zbZBvTcAPaDgUPh1ybCL0YwCaVp9HYhZFtryJxFSvaW+dS7EQVk5VwNauwLS7Wq1yI6jFArsLB7oRt5o405DJ4CEg3KiSDnUVZ356jk+kd6d1uCBYld4RbKWp/0A4w6T5+0CdWSwRjYYhoaBkYiuTDN8gQMCG66TEAwhT67OW88/1g+oM5zRqEi09F0qcATATNjkGaEgmCgH7alQ/72hu1HotJZYLsFrvy2+ZPAGAdl1bJpvgDpF5/+QgTMXKUjbKxtvD+Y0eyuz+WWOeYVwjg81n/Na1K8+uyHxbuOl5R/CUq42v/O7/jB18DfWEHX/Vf2k8W+seeBvPA4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(82960400001)(26005)(2616005)(186003)(53546011)(6512007)(38100700002)(7416002)(5660300002)(31686004)(36756003)(44832011)(8936002)(31696002)(86362001)(2906002)(508600001)(6486002)(6666004)(6506007)(66476007)(66556008)(66946007)(4326008)(8676002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk80emtYdlprYldYSnJZTVRMVVZUaFFMbzVTUlN3WDFBb2RxS1I4ZTJWeTdy?=
 =?utf-8?B?ekdpM2lBZDd3TFI0ZlNoT1dxbG1WeTU5cG5Rdkdla0xTaWhnTitJMURjUytL?=
 =?utf-8?B?aDdkRlVDWkNGMWZpSWJzZjhYNVVIeFVjam5NUk9wcDlNekpEK250VWhTdnIw?=
 =?utf-8?B?OFNYMXhkdVBmaHNpNTNYUkU5NW9RL2tLcG52TzNWMFNlT0FxUTVxMUxoUDdX?=
 =?utf-8?B?amhqUUw0akhwYzExa0RMTUFzdm1DbDFUVzh3bVBhR05GdUQyclhMa2M0UHRD?=
 =?utf-8?B?cFNzTGRXUG96Z1VYcCtSQWZGODBCeDRuL2lodjVmZFZMMnNDdEZvSzhjekww?=
 =?utf-8?B?Mk1Vcyt2My9vV3l5bmpPRWFUL0lIOU0wQXpYeWs2RVYvS1ZCdW1rUXB6Z2FT?=
 =?utf-8?B?MDRkMFFFaVZHVGJkdXFmRGxOalJveC83ZEl5MmpDTDNaaUcxMDFyYzRtdVM0?=
 =?utf-8?B?QUxLUk5ubWtJWkJXSnVVck10UUNORk1KR3NLZ056bDBRWmlBUzQwVTV1NVhq?=
 =?utf-8?B?Y05NTzRJVEsrK2N0ejVrL242SDJIS21mVDUzaDh1U2JDUHFtaDJFQVhUNExy?=
 =?utf-8?B?MnY4clM3RFVObG1uQUJVNmFFN0ZJMnloWVMwQ2NCdkQwSnRTeDdxVHBCa0xK?=
 =?utf-8?B?cTM1ZDdvK1VpTGpDMlZHZENsNjBKVzUyK0NBSmszUmlTYjRBZmZxMWNKS2cv?=
 =?utf-8?B?T2NndjdXejdkem9OWm9xa0xNZVZHNENVa0d2QVdOWFcyNyt2SXJRQnA1RjBY?=
 =?utf-8?B?V3VlaGlyaThYMkE4VlFweGEvT3BYYkhFOEE4bHhZdUMzU1BtNm03YWdTRFN1?=
 =?utf-8?B?NmJoamRpaUdaTFJlVTE3YTBBalludWtjdFdXMVVJcWoyeDlWUGU5elVPbXMv?=
 =?utf-8?B?djRJS3VaUld1WmNZaGRFZVdGdHpERTZWR3NaUXZHQnVkd3llTDRjdW9MYURl?=
 =?utf-8?B?VGt0OU5FdGxkM0ZpclJKVnpNbHVGWGc5NDcyNkxMMnZBVnpQVStqSy9vb3RS?=
 =?utf-8?B?bWMrV0dNekRDYVFLcnh4RGYxN2tRaG03QTVJcDZneTV0aUNhZ2I1R2hBei85?=
 =?utf-8?B?RVZzL2ZUZHViMDNWN1dlSGVCSHgyQjBtelVhREhKR2NITEk3Wmg3aVNPYUIv?=
 =?utf-8?B?UFV5bmJBckl3R1BWN0JoZ2tIb0djZCtuVjdCZndJOThud0NkZW5iVTVoL212?=
 =?utf-8?B?L2FTL0orelR2c2hpTmQvREV4OGI2UEg2M3JkVTg4ZVZ3bGZESEY5VHdRa1Jr?=
 =?utf-8?B?a0t4cXZXZFFZNTdmd1lRU3JWa2lKTDBGTEZmb1dEOE9MYXNJdGJtc0REcTJR?=
 =?utf-8?B?TlRsS2ZOUlhtNDlUSm9RUG5kZWYyc1F2ZDc1UmcycWg0NWZTTHJPejJPQzFo?=
 =?utf-8?B?c25NN3A4cjRoaUhMdzErdkZESW45aXBKTEZsZjZnK1hLNHJXZFdHejBHT3pT?=
 =?utf-8?B?WDllNzVmUDRZa2ZNMjFVU0ZsdGNlWk0rZ3U1Ymo4RWQ3eWhOdHZBelVpRzJZ?=
 =?utf-8?B?TVdlbHF5WWJCa1hEanNYRXNCcGQ5dGxaZGtwTjd6blRuRVJYWFFkbS9PcUR2?=
 =?utf-8?B?aTR6bGFUQ1puSk5IaEJxNWg2akNlUnF6akVxSllFWGVmb2dNMDhwOGh6RXRM?=
 =?utf-8?B?NTRYOHJrTVpBSnZibFFwL2EwQTNGQjZadTJXaFBZNjNFVXQvbUdvTWwxL2lx?=
 =?utf-8?B?QUh4Z2xmbkpVZWhlM0tNc1RwY2ttWU9kSjV3UW9hdE9SRW9ia1pVbUFHL0Nz?=
 =?utf-8?B?T25jNk0yRVF0UVorOE5qT0dzdFlzVG1aMnpiOHViNFVtaTRQMTNDbk5uOStI?=
 =?utf-8?B?SDZEMEZIK1lTUWQ0cFVWcDUzcEs1L0h6SUNaZVpNTGd2MEk0cGJXMWRnU1Rz?=
 =?utf-8?B?a3R5ckUyai9RbFZ3RStsZkhWWGdPS3ZxMzlBM1h5N2xiQnRML0Q0SzcxS0d2?=
 =?utf-8?B?RklzQi9PUlZWa1V6SEl5NUJXSkh2dHVWdk1nUUJtb0g3VGhTVUx0L0lQdThk?=
 =?utf-8?B?WHVONHhMKy9nPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57bc7c76-6c59-4681-bcea-08da0b2902f2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 10:53:19.9561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54py87QC86Zv/YwGMwQLs4YHX0ll4OCLvoIMdqgSMn8twUwbcMeg9hp3aWAKy/bB26+ggiGv9t44m5cTrcbqk+RQfeNzx3kFE08PD/3lRZo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4976
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

On 2022-02-25 6:40 PM, Pierre-Louis Bossart wrote:
> On 2/7/22 07:25, Cezary Rojewski wrote:
>> Stream on ADSP firmware is represented by one or more pipelines. Just
> 
> I have a lot of questions on this one line...
> 
> what is a 'stream'?
> 
> 'stream' historically means 'direction' in ALSA.


That ambiguity should be fixed long ago, it's probably the most 
frequently asked question/error done by ALSA newcomers.

Many drivers use 'stream' without implying direction e.g.: hda. It's 
also part of framework language anyway e.g.: substream (is that supposed 
to imply: subdirection?)

> Then we have sdw_stream, which describes how source and sink ports are
> connected on a platform.
> 
> We also have DPCM front-ends, visible mostly through the PCM device they
> expose to users.
> 
> In windows we have stream effects that are really meant to be on a
> single dedicated pipeline.
> 
> other questions: can a stream represent data moving in different
> directions, e.g. in full-duplex mode.
> 
> How would a loopback be described?
> 
> What happens when a data path is split (demux) or merged (mixer)?
> 
> How is a 'stream' different from a 'path template' that you referred to
> in Patch RFC 02/13
> 
> You would need at least 10 lines of plain English to make sure no one
> will misunderstand what 'stream' means.


If that's the case, then we should re-think how and when 'stream' is 
used within the kernel.

Now, everyone from Windows team is perfectly fine with using 'stream' as 
is, it's common there.
There are many types of effects, and the 'effect' subject has an 
ambiguity of its own but let's not have that subject here on the ALSA 
mailing list :)

I believe you would like a reword, as it seems my usage of 'stream' 
brought a ton of questions. 'Path' perhaps?

>> like modules, these are described by a config structure. Add parsing
>> helpers to support loading such information from the topology file.
>>
>> +/* Specifies path behaviour during PCM ->trigger(START) commnand. */
> 
> typo: command.


Ack, thanks!

>> +enum avs_tplg_trigger {
>> +	AVS_TPLG_TRIGGER_AUTO = 0,
>> +	AVS_TPLG_TRIGGER_USERSPACE = 1, /* via sysfs */
> 
> The feedback in previous versions was that we should not expose any
> sysfs interface that would interfere with decisions made by the driver.
> 
> This is very controversial and a major hurdle to upstream any of this.
> 
> Debugfs is fine, as suggested by Mark as well
> 
> "
> If it's mainly used for debugging then it could be exposed through
> debugfs with less worry.
> "


I'll remove 'USERSPACE' entry for now. I'll come back to that later on, 
in a different series.

>> +};
>> +
>> +struct avs_tplg_pplcfg {
>> +	u16 req_size;
> 
> what does this describe?


Pipeline configuration i.e. all the information required when sending 
CREATE_PIPELINE IPC.

>> +	u8 priority;
>> +	bool lp;
>> +	u16 attributes;
>> +	enum avs_tplg_trigger trigger;
>> +};
>> +
>> +struct avs_tplg_binding {
>> +	char target_tplg_name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
>> +	u32 target_path_tmpl_id;
>> +	u32 target_ppl_id;
>> +	u32 target_mod_id;
>> +	u8 target_mod_pin;
> 
> you really need to elaborate on what a template is, and how you use a
> template and a ppl id concurrently.


As stated, such thing exists already, e.g.: in the skylake-driver. 
"Binding" here is called "Link" there. It's a different representation 
of the same thing.

Here we have all the information to without a question identify modules 
to bind during runtime.

>> +	u32 mod_id;
>> +	u8 mod_pin;
>> +	u8 is_sink;
>> +};
>> +
>>   #endif
