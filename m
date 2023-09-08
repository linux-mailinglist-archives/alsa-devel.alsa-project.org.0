Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D17A97988F2
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 16:38:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 169EF84B;
	Fri,  8 Sep 2023 16:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 169EF84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694183918;
	bh=JdH0EgfAx5z4m6/gPPPs0SA00sGje4WCX2nCPBIM77M=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L5lL/8VtX+xKYphiSkhcObwQbOjhjiY+J/jZJaQJGR7n+xvuF4j5Ymd/zuMSV6EM8
	 LmI2py/w4o/feUQS4L4vE8/uNHm+PzE+I5btgCEWe/wLwp13LvckryVDlz7bPA7iIh
	 ufRDiffmxLrnm0lf7COMDZmznkf3q60dPLKT0b9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2475F804F3; Fri,  8 Sep 2023 16:37:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 224B5F8047D;
	Fri,  8 Sep 2023 16:37:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D177F80494; Fri,  8 Sep 2023 16:37:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 686B6F800F5
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 16:36:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 686B6F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VSpW5BFs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694183826; x=1725719826;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JdH0EgfAx5z4m6/gPPPs0SA00sGje4WCX2nCPBIM77M=;
  b=VSpW5BFsO90gXblj8HuqBIUsYOm+lBo6IJoafUKj19ZpR4lASCruV9h8
   sYbvT5Sp/FV1dwvQuPZHrsZnFVfWjYDak7mmfb0Yiy4QP/m0xwDM0+TBz
   lQZi7RMrgBT9I9ViPvlUQ4Zc6BWxjJvbTpSnmb7s/oTZMg8JRKOgYIkJD
   tsBmnGdWf9Ufcd/Ebha0XRDEYIt1Rg1T0Who53ehdP1ZGBuq6mDD0YOYE
   q1pOXQB7QZywEocNZXfq64uF3e6WH7g4ardOlTYHOiexCDZvzgeT75SWB
   +M1SERlNJI4WteEumQUpp5/Id2dfUq3+VyKli5jX2/UxlJ1nPcmireZsO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="441672430"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000";
   d="scan'208";a="441672430"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 07:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="745627147"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000";
   d="scan'208";a="745627147"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Sep 2023 07:36:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 07:36:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 8 Sep 2023 07:36:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 8 Sep 2023 07:36:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IObIOwx+1Qifq8zdaDFx0e5zt4rhuLzf9iLOgb/hbgYnw+lkRqyUHZIvev6JAdFLcvjbisBRO97F9r8/W/AIAltgnwskY2h8a0K8DwkPG34/B9sTlxEvbSQxMv8PgJQ/VlPsYZYrQ+glxoqQ40HMQOCBgOg6OArWLviFvtB12DbEHf/aPgTRkALANpo/3vohi2SeOh6mjejwGd8VjurdouxxufeXx/Fcu2MiP47Vlo59XrVmixIHewuGJsYxgvgBPhC4RqEAEpFTDBTpqoODoY1MKEhv1hNseFsborX/JOC14EyemP1btNCoHOHezbQkmTHvAYBdMfvMxC1/Tr/gSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+nu9R/9PZ3qwPhsQhBDcWHH5IUUpvcevkiuAlzrZo0=;
 b=SKColJdmynOUXhmZM5KNiY9fVffJpTQNR0dFhrk+Qdp5enP7YagXmRBs2d/NuSl5E7Q3toh3YIaNCCWCPwgLxHrqMQWx2MGx5jpzXYRSgiuZOQdpd+T6McflWA0aR5Z0FGF6v4lO68dgnp64Ns/B3PboktoQ2Kh1qcXcJIm1zNdEDgSKtFPX5AxIMC9kFuKPDaR2EzJ05qVTueHgG9hNEXm11SBCPf4VeUFJDCb/d8sbmiTLNFndOX8LFsc/v1IHH6bENS1RUhRt720Z0YBPQR39428yRjcFO7ciPKinXc7MH0bCB7ADboCkj+OScLx8AOw9gazeMklIOHtH13YmOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 BN9PR11MB5450.namprd11.prod.outlook.com (2603:10b6:408:11f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.30; Fri, 8 Sep 2023 14:36:52 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::71cd:9328:e4d3:d104%3]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 14:36:52 +0000
Message-ID: <36fb8f83-9b39-966b-c105-7ef1bcc17afa@intel.com>
Date: Fri, 8 Sep 2023 16:36:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
	<amadeuszx.slawinski@linux.intel.com>, Takashi Iwai <tiwai@suse.de>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
	<pierre-louis.bossart@linux.intel.com>, <hdegoede@redhat.com>
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
 <20230811164853.1797547-2-cezary.rojewski@intel.com>
 <43b25b8b-3e28-bd91-a29a-846a5aa7579e@perex.cz> <87bkezdsjh.wl-tiwai@suse.de>
 <67fc99db-baf8-17b0-e7c4-f420676e5c8a@perex.cz> <874jkrdr49.wl-tiwai@suse.de>
 <5d77217b-1083-a4d0-1b69-7511d24b6aec@perex.cz>
 <acfcc8a3-8ceb-1671-1dad-35a083354170@intel.com>
 <9d0f0555-411a-96aa-c8a5-382f595a2bbd@perex.cz> <871qfuhyog.wl-tiwai@suse.de>
 <85eec185-b024-573e-3fc0-31d179c832a3@perex.cz>
 <dfac60f7-e043-ca57-8005-3a744b0f920e@linux.intel.com>
 <52b50220-aab0-6df4-6bab-e43d39006c45@perex.cz> <87zg2iggn5.wl-tiwai@suse.de>
 <f97bbbd5-1397-f5d3-5ccf-420ec813deac@perex.cz>
 <6ee5dad3-c46a-4598-3b5a-cac59979ff6f@linux.intel.com>
 <7d2d56a5-698e-7ee3-e6ab-95757012537c@perex.cz>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <7d2d56a5-698e-7ee3-e6ab-95757012537c@perex.cz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::20) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|BN9PR11MB5450:EE_
X-MS-Office365-Filtering-Correlation-Id: c039a74c-639f-4cd2-8e39-08dbb078ff92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 bMz8+w5sz1quzbWs6Sdc+bzn5XEGO6dFspizHH6aFU13A5nsh/tKC3xPwWmd3GifaJxej6i2G8/ij95ZoiIfz7fFF9fj8eSvptBq79kF8TcVkj62gO1E9nQfXmTMl0YTCcaiCyxK4jKdGDDskX2B9XR84b6gQj4Gkv66jQ3cpBl6FZFptpq5GxD7exBvc0IEP/nlgHtqwkJyzFK90qKoySqFhYoHP5yy87wbcL5sNLqbZU/+vDYeYlE1c5f+yK6cTYvnTmQdyKyBTOIKGHRjT2vy2VvN8XP1jkS26RzyJtBh28LbCMzFf4ZUKADBnJUEvDaoZIDXSpc0YOIj/duidbEBLeGzZEYrsINA1+x59W4QjU0kId6SDDmb11WiUQKFHaulgK1UUdakit1x0Yc/k0mcHvdvsperXKnacAOX7PPCw7qqjXv6qxJnIux+F8bnvyNwYfLU6o/2SObj9H+g317tQRGMVGX8hP3cRTb2pNYxDRI00C98/GiyrMmJ6El4ijeklMGQ7ZB1J0/X7uPOgq93nhHWXZYGk2VOOoytoPmau//AQcW33ixGsCq8CRsudapaGyDM7ZgUv4ABScJcYw28j51y+HNSMW5VX44wecedQCeB4dnPZWs5Q/rrLaWLNj7VGwaai8xxO53WHJpasA==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(39860400002)(396003)(366004)(186009)(451199024)(1800799009)(110136005)(53546011)(6666004)(66946007)(66556008)(66476007)(6506007)(6486002)(6512007)(316002)(41300700001)(478600001)(31686004)(4326008)(2616005)(8936002)(8676002)(26005)(5660300002)(36756003)(82960400001)(38100700002)(44832011)(2906002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?NmYvVDQxVzU2VjgyK0UrRXRyckhLakVDY3V6VzNIbVBNWWZCenNmdVBkZ1ZQ?=
 =?utf-8?B?aCtxbmNLQnlVUEEvWGthbmxTTkpyZmYrUmZpeEdVV1BHM0hWdlljL3U4VXBl?=
 =?utf-8?B?QlFiU1JCYXRKcHI4YzA4OFIyNDU5V050UDd0amZOZVY3YUNhNjVNWjRRNVNB?=
 =?utf-8?B?RlJMYWhucVNrcXRRd0MvamhEYlpVZHNlcmxwbHZWSUpseVBvNURVb2g3RTZz?=
 =?utf-8?B?TmsvOC9CZWRrMkJXMmRYenVGRUpSVXd0NzNwNjNqeUh1S28vS3puSVoxams0?=
 =?utf-8?B?WTdNaFE1THd1a1EvTUU3R2xMeWozdmRnc2JMd1p5ek9jSllTWmxMcEhEQ0ti?=
 =?utf-8?B?UUY1RExJL256U3VXTlZ6U0s5STFNOUhYMnoxZC9YZmlWKzE1eDlOanVmTE0r?=
 =?utf-8?B?TmFqUXlMNDlLb3FHRU95U3dpejBhWGNsL0grVFQzNy84b1JRM1FqSi9xQmwx?=
 =?utf-8?B?d2xocWRvS2Iyb0RBQUIzV1h1WExndWZzVG5yVmVycjd5V0JqVGJhVzhMSGpQ?=
 =?utf-8?B?eXBjTDM0U1B3VUNxRjFTd3J2Zlo5ZnhZcWkzTE4wZjhtS3FlWUtiVkN0dTNw?=
 =?utf-8?B?QTgzQm11d1NLMHNiSUJkcjhwRXQrRW9KSWZjOFZYL05oeUNoOUo0U3UvZ0Ex?=
 =?utf-8?B?TUI5c01McHFsRjJnWmZPcWJWcEo1RXo4cVVyaE1FWGU3cUNtbUtFMllxeVBZ?=
 =?utf-8?B?cDc3dCs2UGx6YW5IM092aTBCQ3NBZThxaEJxSWNIZnVXSHlROW1pUnJyYzNI?=
 =?utf-8?B?VHEwbWlYSXYwZ2w3NjZqQ1NUdUlobVd3ampUR2RMeEwzUHJRNVhlMXlZM3lB?=
 =?utf-8?B?N1VaM2REeSt5TW5VV1VBVDdmOW5nTUZvelZ5MHhBWnNOZ1NTMytnSkdkcUhp?=
 =?utf-8?B?Y0NVNjlYMkt2aS9HWkdpcC9Bai9FUU9mSjNjRFFGVUdvYWl4UGFEUG5ZWEls?=
 =?utf-8?B?eVBBWTdFQ1hPbFdrSHN5K1RNRFBZNlZJVlhheUhTQnpaRjhoQ3VwWlBPbWs5?=
 =?utf-8?B?cHRZZFh3UER4TEQ5NDA5M05mcmhaZDFKY3hPZVpvWEs3MFovcXUzcm42dDl5?=
 =?utf-8?B?OGdUNXVWWG1QMThkelF4OHpLMm44OU5CZmNOaWhTZkRRNGkrWFlUb2pIUDNv?=
 =?utf-8?B?aG9WNElTVzAraWhDN1lQcEw1cmUxbFpKV1JobTRmTTByUzBpemt6MldneFRt?=
 =?utf-8?B?Z2FMVzRoaUxZZm8rTSs4dXNOZmZwWVREMnZJOVFiblViUUg3dVJ2L3ZOa1ly?=
 =?utf-8?B?VmdUTVo2bUxXUkJOd2ZQczdZdjA4OVlJUXpObUVBZW52SkR0UE5IRzR1MkVB?=
 =?utf-8?B?RGZGTUdhV1J2cmRIMzd6YVJqVEdGUXQwY3pJeEVVUXdTcTAwbUExL2w0em9Q?=
 =?utf-8?B?Nk91R283R2xZKzJLVDFkTTJJZUpHZHl5OTdKK2VPRkQvcHNjbXM3VmZLNkdl?=
 =?utf-8?B?eDJuWWgwZzkraFlHMUNDdTRqZkx2Zlc3czhRWStCeHg4Z3l2SzFoeXVUa0RW?=
 =?utf-8?B?RXlrNitiUHhiL0R2NHBuUXowaW1SRTJsN1V3eHExWWFUdmtEbTd6RzQwUllO?=
 =?utf-8?B?OFNqWWM4UmtUNGVTTkUxdlVrRksvdHZNcVdPc1Zoa2tkNFZQZG1uWGpyRHFH?=
 =?utf-8?B?K3Q3bHBWc3EvNUtpTWsyYm03dWhvTk5WU1BFUVBWUFRKQVdUR2RIOG5MUmRL?=
 =?utf-8?B?aGdOZ240VjNMc3ZmR3pCaTNBU0VBUDZLVG1rN2VhbHlZdnlJQXA2RExOSE4y?=
 =?utf-8?B?RU5kY1pSVExWQlloWkwya3FmcnVZZFRjbGNaSE55U1JlTlJjQTdHZEFEaUtW?=
 =?utf-8?B?U1d4UVlxRkVGSTQ2d1JmOUE2Zm5mempPQ1BYVmpuVE9Ib2hTS1Z2dk50YkNr?=
 =?utf-8?B?enZrMWJJb0N5WVhkaEZzYlMxSm5tTXV3cy9JV3JydXZVSUNlWUVkRGpmeFlM?=
 =?utf-8?B?VU5ieTd6d0FEZlIyNzFncGswVlhObWp6SUdjVGczc0RkVWZST2d4UkhMbWZO?=
 =?utf-8?B?eVZLbjg4MEg0d0lzY0NjOVpFcFZrZjFMeDRwdWNoUDE2ZllOcXlvdTZCU29m?=
 =?utf-8?B?cDFOSnJZckM1L1YzSWt1ZkdGWlVCOUdmdC9GbU9JZ3NWcUY0cmNub0xkYUp5?=
 =?utf-8?B?S2VsaTEzRzNpVnhMUWNrN1prbjdQUzVnTmRKb2FpSXNLQktkOTJyclU0alli?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c039a74c-639f-4cd2-8e39-08dbb078ff92
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 14:36:33.6017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zp9v2AGnKh+RKwuPPqohV6j493SZVQtfMnviFLfQmlqvDKGlpv+DQkftJPgUdjm4URc2cRAV+uVvf10GsDGfMdPuEBA/6POHd7Ee7k4DrMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5450
X-OriginatorOrg: intel.com
Message-ID-Hash: IXS7GVJMQRTNMOVVFOY6IXULJF2QZFCF
X-Message-ID-Hash: IXS7GVJMQRTNMOVVFOY6IXULJF2QZFCF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IXS7GVJMQRTNMOVVFOY6IXULJF2QZFCF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023-08-24 9:31 AM, Jaroslav Kysela wrote:
> On 23. 08. 23 18:29, Amadeusz Sławiński wrote:

...

>> Problem with MSBITS_MAX is that if kernel reports something like this:
>>
>> FORMAT: S16_LE S32_LE
>> SUBFORMAT: STD MSBITS_20 MSBITS_MAX
>>
>> to userspace, is that userspace can't really tell if you should only
>> apply it to S16_LE or to S32_LE, or both. On the other hand if at some
>> point someone adds S64_LE format, something like:
> 
> Unfortunately, you've not got the point that the subformat contents 
> depends on the selected format. So the subformat mask is for ALL formats 
> selected in the configuration space. The only valid contents for one 
> format is when application or kernel reduces the format to single one. 
> And applications can do:
> 
> 1) set format to S32_LE
> 2) call refine
> 3) get subformat bits for single S32_LE format from the refined cfg space
> 
> In this case, queries and specific msbits selection will work. It's the 
> standard refine mechanism which works also for all other fields from the 
> parameter configuration space etc. If you look to all other fields from 
> the parameter configuration space, you cannot predict the exact 
> parameters (buffer size, period size, channels) until you do more 
> refining to set all parameters to exact values (single value).
> 
> In other words, the above example:
> 
> FORMAT: S16_LE S32_LE
> SUBFORMAT: STD MSBITS_20 MSBITS_MAX
> 
> .. means - at least one format supports maximal msbits for the given 
> format.

After reading all of this again, I'm fine with rewording MSBITS_32 to 
MSBITS_MAX.

As I do not see any other points to address here and review of v1 has no 
points to address either, I'll send v2 with this single change. If I'd 
missed anything, let me know.


Kind regards,
Czarek
