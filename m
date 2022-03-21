Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 258104E244A
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Mar 2022 11:26:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9678E1705;
	Mon, 21 Mar 2022 11:25:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9678E1705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647858409;
	bh=csUHFVkoSQId0pgBN6pYE+IJkNZSJ+W/ariSiwnf9CM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ML6g+O/PoQVpuJA0x1auw0X1qcrjSbIIzcU3nxX9ap3Bi9514n7zTVD+83j6z2vmX
	 YuCbZxux8XCoU/IbnjVF+qjEJXHyko+DVBGmxv9SHvxur9vGCfYGx0kG9kqrXm0ubo
	 1kz/zURDirw+oH/VJAXHxG4+imrYkFxzXCwMSLe0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 051B3F80238;
	Mon, 21 Mar 2022 11:25:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DD8DF80227; Mon, 21 Mar 2022 11:25:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC982F80116
 for <alsa-devel@alsa-project.org>; Mon, 21 Mar 2022 11:25:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC982F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HEu8RnK6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647858338; x=1679394338;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=csUHFVkoSQId0pgBN6pYE+IJkNZSJ+W/ariSiwnf9CM=;
 b=HEu8RnK6bgt3aWHIEjv8iZj1o8LN3JC0xRg1Dx9AsMJaISfYHdxUUiiL
 tfCHUzthii/Xz0BjyJkY1pmKu+qfw4A8/kj/jRoWG/UVA9a1BIpbUC1ZW
 PjDvqykfeUCvzlDc/DTi45k6qepO9hpvq1X/Uin7633WGNPStfNUVcv1c
 jmknGFFuVDlB6Wn5cuTTrTaxQkSaeKzmkC4/68zene3QORw4MgVFSZFOv
 o578AEBCoXtGQDULd/LYySeeOARVqE4Jfrw70Xx9qi5Daq+0WsYgm7BUK
 oYo4u7mSsXuuJ6VMG09kW9+S9p9LBD7xcBaPQBPxYAul9abuX2sf7dxIR g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="239674560"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="239674560"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 03:25:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400"; d="scan'208";a="615589202"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga004.fm.intel.com with ESMTP; 21 Mar 2022 03:25:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 03:25:31 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 21 Mar 2022 03:25:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Mon, 21 Mar 2022 03:25:31 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Mon, 21 Mar 2022 03:25:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U17D5bFO81TQG0AZIbqzvG5DKRaim31oxSaOW4dN2XasVABZaUS1KiIir5hw2MOCbdvD6lEiqaev2TVIZDZPcuakflf71EhF/B7K4ZuxITTzzZK/lYM1cxKJIzFBs/58whuZOs98+VewMIkk8wTgQFQd0vHrLG4vg/jgISoJ0m7VK7hlHxDXpDH8hBOH2AGXW2Ct/cn37NhMc8zjK6VRr3u23dV2mS0vAsIf1jQ6SrFbFgE2pceKJsnUpp89QzxqAlLRYHBuw2gCkSryqoXnnx0rqOMFoZbX6wm9oTvKiTGxM09aKsB0Whn8AGUv8hfX5zF7M6N6x0OR3d2OE3fXfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwG8mNJisaHbmDf3V2IGbLjl/gf1bb+9A78JR1prMdE=;
 b=NvsNjgE31PJNvsVzL8PiMH2slS55u3ttELY/rv7A31TnPTYixqUPO7yNBWlHpQiQozMurdRb5hTRD9srayVk2Xs88F5s417TuosEo36HR5eEWIM8fXZ+N7Nrm2oVHTwKQAPpdGArwWMsVLoG99Hl3lMRTGyazs/++aab3XPVEgjr08zSbeXmiVT3WEw7hxhqK7Vf08+qEQwvywTs+Pae/VCZk6OM9bLBwpkjgAdG95EOqGpUAXIarPee8U2PFf0kDN+rskTUwWBDqOu3c/h9GoIFpnB3agwgToErs2Gw2DAfG3IHRNXZEkULBDs9eQClTch2cs2CRCpZWEGdyj1tMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by LV2PR11MB6071.namprd11.prod.outlook.com
 (2603:10b6:408:178::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Mon, 21 Mar
 2022 10:25:28 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::ccac:dd6b:b12e:477c%11]) with mapi id 15.20.5081.022; Mon, 21 Mar
 2022 10:25:28 +0000
Message-ID: <cfc57f7a-2810-5324-3de4-d4de1ba1df26@intel.com>
Date: Mon, 21 Mar 2022 11:25:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [RFC 02/13] ASoC: Intel: avs: Add topology parsing infrastructure
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 <alsa-devel@alsa-project.org>
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <20220207132532.3782412-3-cezary.rojewski@intel.com>
 <6cdb5477-38d6-8308-2ff8-3bed61fdfb3e@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <6cdb5477-38d6-8308-2ff8-3bed61fdfb3e@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0064.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::28) To MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f96ed11d-86eb-4ebf-6188-08da0b251eb9
X-MS-TrafficTypeDiagnostic: LV2PR11MB6071:EE_
X-Microsoft-Antispam-PRVS: <LV2PR11MB6071B356A68093B4A551A5C1E3169@LV2PR11MB6071.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AekyAaEI770xYrtEkUfO66BjsfzvVX84PyU5AVwFAeTDuXSlOeJJ3o3j25h7HDa6DDuUFohlQ8tWHMkohOqgIW2EE4y8mhpO+36mVYiGfjZfkotQ669MpegotqJB+brTLuVyGZwuqwpjONoSfLCZ76BsE2XJ0xDoR8xqie9qua3c5qo9tVe7Vt/eXGAjDtO+F3WTE6bezXtmAwkfxO/HzF21Q9lu5CMNY40RxLzK+GKlz0KReb3WKjMEXFQEN0vAjOEGZN44s52Wvs6bhKfGHYPrybwyhl0lZn3vpZF8g5lktHXPQYVYNiVWNDqQOxX2FRMZpmplQL5YItyjt+CNweTtaRoUysvkNv09iZ4pb0mwpX0d+HrUhDrBDqmhzled0tD95RcjeEyIC1X7wX91rbMomu1So3qK+/sC4xOeoxD4s4XIprwiw7rBhy/roESWdxAuzzdNmT3o5HoU6bcOLxlzCeS/cvu8UVQkFukV1jRQgYRE+C2ykG3TQLVNhmZlYD5+G3VScIxJTdRkIPkgiB6/6W7XHjocz2w9dCqTYuW3AYJFJb1xMCH1VW4afoR3P2nfxkf+kqM4/tkw21HRRYIF9ql9ieXnJKAiMR5hqBq8LYUPhbHSC+noIhph2L9t2QCOWtwyi1mtvPJJuZ5hOFeYq3rUk6Vb14TcplClMw8WYO2+ds+fqCk/yG1gQ0u2D1CAlzNS/KNn/OxEcbO4MbGgCyw4kvDwWEiPOnIijqVmN9Ky0+lP4nzYssR0zNqGA8b4QW7b1fUFRN1+aLmRFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66946007)(7416002)(6486002)(66556008)(2906002)(66476007)(82960400001)(508600001)(36756003)(44832011)(8676002)(38100700002)(4326008)(8936002)(5660300002)(30864003)(31686004)(6506007)(53546011)(316002)(31696002)(86362001)(2616005)(6512007)(83380400001)(6666004)(26005)(186003)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVZ2QTQ4cW5jTkk0Uk9qU29NNmIwbFBROXRzelhEMnFRcm1hakRZQ09oVW9E?=
 =?utf-8?B?NHZ6VFJPVi9VZmRHWVluQWEzWVN1dnY5Qm8ycHNnYXAzdkNPbmVtN0wvMy80?=
 =?utf-8?B?N0lXZjR6RTFGcmM3dHpiUzVUMkcwYkErZkV2UTU1YThyVnpxZjIxWVZoK1FK?=
 =?utf-8?B?NXJMdWNQYnEwa01oeTlBM2RndDNLN255N2RvbWw3bXZLLzduU09ndjhSbndB?=
 =?utf-8?B?bEVsWjF2bW01Q0J5MzA4Q3h3NDhWVzlaV3BnbldvcGRGaWRhUkFPY01nN0Jh?=
 =?utf-8?B?U3pNOVQ4RmdVZUIzdUMrV0V2UHlGMzh6NkVqM04vQ2UyL3BadThWYWJ1KzIw?=
 =?utf-8?B?d1lIU3k3RmJXT0hGZlh6a0dadW5qd2FkZjdhT1hzRmh0b29CTzdwL01NUzh0?=
 =?utf-8?B?QWczcmJRN0tlTWFkdWF1TWMwbWdzWGJJNnFYdEg2YUNsZzJ3cU83czRJcWd6?=
 =?utf-8?B?VllwU09xNThETm9aTTZDakY2UU9MRnl4NTEzNEo2TGpEb3RLd2tpTkJvYlNN?=
 =?utf-8?B?Vit1ZDF0T1doaSsyVWNqeXdCZnphMnVWdnpvMEw2QzJXWXZRSkgydDNIOUNl?=
 =?utf-8?B?UG43SlFQSHdudzVLSWRpY25kVE9GcmQ5a1dHR3NiQzU2VDVEWFNHdDJ2ZzhR?=
 =?utf-8?B?eXoxRDlqNkNWbW9Qdk9lbzRHc3lKVEs5Umd0a3NKN3ZwYXV2QktSdUM5eCtl?=
 =?utf-8?B?NWR6d0lhbEVUQjJSVTFpdEdJbEZKazFadlJLYTMxR3dkY09maVNxQjJIeFdr?=
 =?utf-8?B?UElHaThFWnY3OUN5L3QxbFFJMitaNTA4TG9TSnFZdDZ1b2hOc1A0c21Wd2t3?=
 =?utf-8?B?L1NwbGo3di9uaGtjeTZsdWJvVW5iRVFJa3c4Um1CMzl2STU0Z01LRHBWQzkx?=
 =?utf-8?B?NnlrbXpKVDVia0ErWm04SEFOK0NuTzhDS3g1Y1ZUM1F4TFhBcXlSWFI2NVVh?=
 =?utf-8?B?OVdadW9SNDFNR3V5VDBXUitlWEY0QWpmOGZ0S3JZanlkN0JsUGJVS29rREZ0?=
 =?utf-8?B?UHVEcXRaaEk1MGd1V21VQ29ZV280M0J3dXgraGwxYjI3UEUvRG5CTnNNVnZp?=
 =?utf-8?B?YXlkRVViNEJhbi9OeGFVM0ZzeG9pWEw1RktZRklhVVRVeWFTeFJ4SFVuYmk4?=
 =?utf-8?B?bnpNNjR4NWJRTVdURTg5N1hWeUZXYS9STEdoY1FKeFd5bE82ZnRQNXNSZWlU?=
 =?utf-8?B?emNBbTIvUkZMZHlqUUUyODg1eVY0UDJjcmM2WGVEeXRoT3ByZHdHYmNnNjll?=
 =?utf-8?B?OG0rblkySUduUktra3VVRGc5QW8rSnk1eUMrZUxjNmo3SlZMbm54MkJtZFAr?=
 =?utf-8?B?MmJPVG85azA2ZUduNHcwZVJ5aVVxVG84cUxha0R4N1NqVWFTakFpd0RTZUFU?=
 =?utf-8?B?by9VZEdEcjlJTmM1cUlKZmdTMFVGNUxweG9mOUxUUXRKZFFpajZkUWQzaEY2?=
 =?utf-8?B?UGlOc0Z1UWczUys0QUdla1YxSFR5dG95RVZ5RXpZZUFLaGFuUmtDUGNIS0VE?=
 =?utf-8?B?S1kwUnVRVW55ZHRSaTVnTURhQ1BBQUtHTURKd0VnSi9mblNSQWkyUFhTaFl6?=
 =?utf-8?B?RjN3TkhRZGdnT2ZNSGJweFExVmR4cUllaWE1ZXdOMzB5bzlLWG1CR0RETHVx?=
 =?utf-8?B?R1VURXM0cDFxcmFNbExzSWdNcXFacERXOGFac25PM1ZwSG14NVFRV2xjRExH?=
 =?utf-8?B?ZS9HUXdkci9ReHpGUEJmWU1DeFJINjkzdlZSYk5JM2NwenQ4YU1XeWdIR2lG?=
 =?utf-8?B?L2JEVCsza01CY1ZYelRtVk1IckZLMTJWdTBISVBPM3o4Uko2eDk3aVlqcFZZ?=
 =?utf-8?B?YUNuSG1lb0U1eVZsZTdubUhFS3h2NENaajM0ZUlYM3ArSW9mRTZYRktqQ2I5?=
 =?utf-8?B?UlJTenpnUjN5d3l3VzBqU1NEWGZaSXJKWngydVZYWGZCNGhuNTZMNjU2eTJI?=
 =?utf-8?B?VEVxNC9OUGw5WmIxQ0sxVlJTV1lFWDlEOWxoUk8yYjAwWi9YckZrdWNJeG83?=
 =?utf-8?B?RVlyaFZRaGJBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f96ed11d-86eb-4ebf-6188-08da0b251eb9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 10:25:28.4445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hkLevrvSU6XaWVBONhwfuGYT7oT2r7tQ5l91J2nODrhE9LugIl8pCeEKvsdoOhAu0Vv/4t8LAI1xLu3aLvkthqdqiLYVGtDBVuoms3lRx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6071
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

On 2022-02-25 6:20 PM, Pierre-Louis Bossart wrote:
> On 2/7/22 07:25, Cezary Rojewski wrote:
>> AVS topology is split into two major parts: dictionaries - found within
>> ASoC topology manifest - and path templates - found within DAPM widget
> 
> what is a "path template"? this is the third time I review your patches
> and I have yet to find a description of all this.
> 
> If you introduce a new concept you really need to explain what problem
> you are trying to solve, why it's important and what other alternatives
> could be considered. Consider adding a Documentation file to explain
> what you are trying to accomplish.
> 
> Jumping to optimizations of memory footprint through dictionaries is too
> early.


Hello,

I don't believe it's early for optimization and such. ASoC topology 
feature has not been invented yesterday and most of the topology files 
we see used are far from perfect.

I've been trying to explaining "path template" on several occasions, 
also during our meeting last year. Now, there's no separate 
Documentation for "path template" as is not a new concept really, it's a 
different name for already existing thing. Every driver which makes use 
of ASoC topology needs to have a "path template". skylake-driver has a 
"path template", sof-driver has one too. Topology information does not 
match 1:1 to runtime, it never did. You use topology to describe how the 
stream shall look like in runtime, kernel takes that information and 
instantiates the runtime.

If you do not believe, please see the skylake-driver topology which is 
made of:
- ModuleType, ModuleResource, ModuleInterface (...) dictionaries
- Path and PathDescription

There two blocks looks very, very similar to:
- ModuleConfigBase, ModuleConfigExt (...) dictionaries
- Path and PathTemplate

which are supposedly 'new' in avs-driver. Yes, we provided several 
optimizations, but the "path template"/"path pattern"/"path description" 
was already there.

>> private data. Dictionaries job is to reduce the total amount of memory
>> occupied by topology elements. Rather than having every pipeline and
>> module carry its own information, each refers to specific entry in
>> specific dictionary by provided (from topology file) indexes. In
>> consequence, most struct avs_tplg_xxx are made out of pointers.
>> To support the above, range of parsing helpers for all value-types known
>> to ALSA: uuid, bool, byte, short, word and string are added. Additional
>> handlers help translate pointer-types and more complex objects such as
>> audio formats and module base configs.

...

>> +/*
>> + * Scan provided block of tuples for the specified token. If found,
>> + * @offset is updated with position at which first matching token is
>> + * located.
>> + *
>> + * Returns 0 on success, -ENOENT if not found and error code otherwise.
>> + */
>> +static int
>> +avs_tplg_vendor_array_lookup(struct snd_soc_tplg_vendor_array *tuples,
>> +			     u32 block_size, u32 token, u32 *offset)
>> +{
>> +	u32 pos = 0;
>> +
>> +	while (block_size > 0) {
>> +		struct snd_soc_tplg_vendor_value_elem *tuple;
>> +		u32 tuples_size = le32_to_cpu(tuples->size);
>> +
>> +		if (tuples_size > block_size)
>> +			return -EINVAL;
>> +
>> +		tuple = tuples->value;
>> +		if (le32_to_cpu(tuple->token) == token) {
>> +			*offset = pos;
>> +			return 0;
>> +		}
>> +
>> +		block_size -= tuples_size;
>> +		pos += tuples_size;
>> +		tuples = avs_tplg_vendor_array_next(tuples);
>> +	}
>> +
>> +	return -ENOENT;
>> +}
>> +
>> +/*
>> + * See avs_tplg_vendor_array_lookup() for description.
>> + *
>> + * Behaves exactly like its precursor but starts from the next vendor
>> + * array in line. Useful when searching for the finish line of an
>> + * arbitrary entry in a list of entries where each is composed of
>> + * several vendor tuples and a specific token marks the beginning of
>> + * a new entry block.
> 
> please try and reword such comments for people who didn't take part in
> the development.
> 
> I really have no idea what this is about.


Please provide suggestion - "don't understand" does not help me in 
rewording the comment.

ASoC topology is not the easiest to digest feature in general. Comments 
found here assume the layout and organization of sections, such as 
vendor tokens and vendor tuples with ASoC topology file are known to the 
reader.

>> + */
>> +static int
>> +avs_tplg_vendor_array_lookup_next(struct snd_soc_tplg_vendor_array *tuples,
>> +				  u32 block_size, u32 token, u32 *offset)
>> +{
>> +	u32 tuples_size = le32_to_cpu(tuples->size);
>> +	int ret;
>> +
>> +	if (tuples_size > block_size)
>> +		return -EINVAL;
>> +
>> +	tuples = avs_tplg_vendor_array_next(tuples);
>> +	block_size -= tuples_size;
>> +
>> +	ret = avs_tplg_vendor_array_lookup(tuples, block_size, token, offset);
>> +	if (!ret)
>> +		*offset += tuples_size;
>> +	return ret;
>> +}
>> +
>> +/*
>> + * Scan provided block of tuples for the specified token which marks
>> + * the boarder of an entry block. Behavior is similar to
> 
> boarder looks like a typo. Did you mean border? boundary? position?
> location?


Indeed, it is supposed to be "border". Thanks!

>> + * avs_tplg_vendor_array_lookup() except 0 is also returned if no
>> + * matching token has been found. In such case, returned @size is
>> + * assigned to @block_size as the entire block belongs to the current
>> + * entry.
>> + *
>> + * Returns 0 on success, error code otherwise.
>> + */
>> +static int
>> +avs_tplg_vendor_entry_size(struct snd_soc_tplg_vendor_array *tuples,
>> +			   u32 block_size, u32 entry_id_token, u32 *size)
>> +{
>> +	int ret;
>> +
>> +	ret = avs_tplg_vendor_array_lookup_next(tuples, block_size, entry_id_token, size);
>> +	if (ret == -ENOENT) {
>> +		*size = block_size;
>> +		ret = 0;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/*
>> + * Vendor tuple parsing descriptor.
>> + *
>> + * @token: vendor specific token that identifies tuple
>> + * @type: tuple type, one of SND_SOC_TPLG_TUPLE_TYPE_XXX
>> + * @offset: offset of a struct's field to initialize
>> + * @parse: parsing function, extracts and assigns value to object's field
>> + */
>> +struct avs_tplg_token_parser {
>> +	enum avs_tplg_token token;
>> +	u32 type;
>> +	u32 offset;
>> +	int (*parse)(struct snd_soc_component *comp, void *elem, void *object, u32 offset);
>> +};


...

>> +static int avs_parse_tokens(struct snd_soc_component *comp, void *object,
>> +			    const struct avs_tplg_token_parser *parsers, size_t count,
>> +			    struct snd_soc_tplg_vendor_array *tuples, int priv_size)
>> +{
>> +	int array_size, ret;
>> +
>> +	while (priv_size > 0) {
>> +		array_size = le32_to_cpu(tuples->size);
>> +
>> +		if (array_size <= 0) {
>> +			dev_err(comp->dev, "invalid array size 0x%x\n", array_size);
>> +			return -EINVAL;
>> +		}
>> +
>> +		/* Make sure there is enough data before parsing. */
>> +		priv_size -= array_size;
>> +		if (priv_size < 0) {
>> +			dev_err(comp->dev, "invalid array size 0x%x\n", array_size);
>> +			return -EINVAL;
>> +		}
>> +
>> +		switch (le32_to_cpu(tuples->type)) {
>> +		case SND_SOC_TPLG_TUPLE_TYPE_UUID:
>> +			ret = avs_parse_uuid_tokens(comp, object, parsers, count, tuples);
>> +			break;
>> +		case SND_SOC_TPLG_TUPLE_TYPE_STRING:
>> +			ret = avs_parse_string_tokens(comp, object, parsers, count, tuples);
>> +			break;
>> +		case SND_SOC_TPLG_TUPLE_TYPE_BOOL:
>> +		case SND_SOC_TPLG_TUPLE_TYPE_BYTE:
>> +		case SND_SOC_TPLG_TUPLE_TYPE_SHORT:
>> +		case SND_SOC_TPLG_TUPLE_TYPE_WORD:
>> +			ret = avs_parse_word_tokens(comp, object, parsers, count, tuples);
> 
> avs_parse_bool_token(struct snd_soc_component *comp, void *elem, void
> *object, u32 offset)
> avs_parse_byte_token(struct snd_soc_component *comp, void *elem, void
> *object, u32 offset)
> avs_parse_short_token(struct snd_soc_component *comp, void *elem, void
> *object, u32 offset)
> 
> why did you introduce such helpers, if you only use word_tokens?


Huh? we do make use of all of these. Perhaps you missed these being used 
in the follow up patches (in this very series). This patch defines the 
parsing infrastructure so its declaration is separated from module and 
pipeline parsing details.

>> +			break;
>> +		default:
>> +			dev_err(comp->dev, "unknown token type %d\n", tuples->type);
>> +			ret = -EINVAL;
>> +		}
>> +
>> +		if (ret) {
>> +			dev_err(comp->dev, "parsing %ld tokens of %d type failed: %d\n",
>> +				count, tuples->type, ret);
>> +			return ret;
>> +		}
>> +
>> +		tuples = avs_tplg_vendor_array_next(tuples);
>> +	}
>> +
>> +	return 0;
>> +}
> 
>> +static int parse_link_formatted_string(struct snd_soc_component *comp, void *elem,
>> +				       void *object, u32 offset)
>> +{
>> +	struct snd_soc_tplg_vendor_string_elem *tuple = elem;
>> +	struct snd_soc_acpi_mach *mach = dev_get_platdata(comp->card->dev);
>> +	char *val = (char *)((u8 *)object + offset);
>> +
>> +	/*
>> +	 * Dynamic naming - string formats, e.g.: ssp%d - supported only for
>> +	 * topologies describing single device e.g.: an I2S codec on SSP0.
>> +	 */
> 
> what are you trying to optimize here? the topology will contain the name
> in all cases?


I'll probably separate the name%d part so it's not clouding the core 
part of topology parsing.

These if-statements are here to allow %d to be filled automatically by 
kernel for SSP boards with ->link_mask found in ACPI board descriptor.

Example for avs_rt298 with snd_soc_acpi_mach::link_mask=BIT(0):
1) Topology file for avs_rt298 provides widget with name: ssp%d_be
2) Runtime topology parsing formats that name to: ssp0_be

>> +	if (hweight_long(mach->link_mask) != 1)
>> +		return avs_parse_string_token(comp, elem, object, offset);
>> +
>> +	snprintf(val, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, tuple->string,
>> +		 __ffs(mach->link_mask));
>> +
>> +	return 0;
>> +}
> 
>> +struct avs_tplg {
>> +	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
>> +	u32 version;
> 
> version of what and where does it come from (manifest)?
> 
> does this contain an ABI information? if yes, how is it defined?


Yes, this one comes from topology manifest. Right now we decided to use 
single-digit versioning for simplicity, similarly to ASoC topology one.

>> +	struct snd_soc_component *comp;
>> +
>> +	struct avs_tplg_library *libs;
>> +	u32 num_libs;
>> +	struct avs_audio_format *fmts;
>> +	u32 num_fmts;
>> +	struct avs_tplg_modcfg_base *modcfgs_base;
>> +	u32 num_modcfgs_base;
>> +};
