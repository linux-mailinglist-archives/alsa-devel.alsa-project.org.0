Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1436C7FFA0
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Nov 2025 11:47:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62615601B2;
	Mon, 24 Nov 2025 11:47:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62615601B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763981231;
	bh=ULd2pDMKwNo2zcIfgnuhMJ8jOFAgK7ZMIruju/D6S9c=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L6Q+ruS24qOeAFL39cIv1VzB09OCfRIcEcboGb7xA5oGE9eHfR2uKPWKHABYU0QoM
	 rqgLRSJq9UWXSMAIzxdRrcVnuy58eT8Vrd4CVnKDYFGfoxVRxZLE8wgPnHd27cqUgh
	 m7dpAeIwqHXfFLLbXu8q561DzYPsmiyZZX8vD51Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F6F6F80563; Mon, 24 Nov 2025 11:46:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17C0BF805C5;
	Mon, 24 Nov 2025 11:46:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18ECAF8026A; Mon, 24 Nov 2025 11:45:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29B71F800BF
	for <alsa-devel@alsa-project.org>; Mon, 24 Nov 2025 11:45:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29B71F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VnzGz5Iv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763981139; x=1795517139;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ULd2pDMKwNo2zcIfgnuhMJ8jOFAgK7ZMIruju/D6S9c=;
  b=VnzGz5IvFSgmIF5SEEhOy3G9yRYM7eO4yiE0rxD4fwe9jiqNBTGJ7P7K
   EvedI8kDE7bypw0GVoTAj+UuXbIIIdvbw+bE18mFUnQiP8MaDk7whOs1W
   tA4CEU91Bf9sn3Z4ZAlXQNRpSQeuBREMqnjLlLgwbaNOxTEpqe21X5dVB
   2EyxUjsvbJTBOf0c6gwQxUGPc7B7/lRUm4+QuiRkCGJDS2UO60kc+xT8T
   WwsStGxGbzw3PIy9112dw7oaJ1a7LYs3n7dgWGkTaVDemyNzkeKhsEk53
   8T8ZewONIrTlrCuP8g9+9wW1GlqTI2Dp0QkrBiR9Cc/7Fszk64ggQrFSu
   w==;
X-CSE-ConnectionGUID: J1q74moTTNSLttVfpKOxgQ==
X-CSE-MsgGUID: M3gkQvYjRjeq3jN2kxwDDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="77450214"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800";
   d="scan'208";a="77450214"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 02:45:34 -0800
X-CSE-ConnectionGUID: bhvbSgaYTnGOM+MqiWOekQ==
X-CSE-MsgGUID: 1otJGAatQcWkKz5jzI9icw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800";
   d="scan'208";a="192769243"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 02:45:33 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 02:45:32 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 02:45:32 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 02:45:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pKT5+s/Ghbxudi4P/nHAhcE7iDbSbNwCL69Oe1U2ReyNwV/Uszw0XJ+iEdgm7boa36qtHfAKUy+AezEsh6LI1Z4rxOwR7GvtLEEGz66s5cAPZ0wUqCNQdia8ww1Uj0qKFn0ieoPu+F0jtkoCrfu7ZRO7sBHORl81Ye+39yov+LhJp0IayNVG3Q52wbnKZx0D6U/YZIX5v2S/dijBSAQSbXdljYLR0Kw+dSoOAeWzvlFbFwlXsEns/vQH5VrLyISFFry8Lrpvc/vjlxZekPeWjgZRQ5wlc8evPKYMJZmpnkglyt4Riz/zD93947HmJpuik+pQPZxMfYPJ12dJig1sdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZvHJtNrSq2TBrjsNwVhn4NmIQBgiTX6rfjBHrl6PtQ=;
 b=EabXK0koLSE9+KtmshOGSLcn9qcTL2KrZMTre71ET5xF4nRpNi4tBsz14Dh0Git7cOwPexZzeE8iMYTkT56JfIHf8zmI5mrQDmqQlB7QTc2I+kGrxKif8WSNcZs8+/yDKx3jzoErPivVVp4DrtTy9mgODE9oJ5uXq69I8B0G8i4yR4TMN7xHklwlLGyhdzBJVyKFDAi5Sc9/RXA5bkGe0RYVcrnVSU348Y+DLMI/W5zuyIuMob7RAJB54V5+bM1aoPo+fZ2ch8oRjUlgAdogHtYgIhqtGgfJcQvt91ZYU18hbYMZQ1CDcWf3B4KkIbcfZdojkYKEKtSTNZ3z0vn0/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by CH3PR11MB8383.namprd11.prod.outlook.com (2603:10b6:610:171::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Mon, 24 Nov
 2025 10:45:31 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.9343.011; Mon, 24 Nov 2025
 10:45:31 +0000
Message-ID: <69df5119-e293-4277-a6a1-7426b97b6c8f@intel.com>
Date: Mon, 24 Nov 2025 11:45:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] ASoC: rt5575: Add the codec driver for the ALC5575
To: Oder Chiou <oder_chiou@realtek.com>
CC: <perex@perex.cz>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<flove@realtek.com>, <shumingf@realtek.com>, <jack.yu@realtek.com>,
	<derek.fang@realtek.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
References: <20251121084112.743518-1-oder_chiou@realtek.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20251121084112.743518-1-oder_chiou@realtek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0033.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::13) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|CH3PR11MB8383:EE_
X-MS-Office365-Filtering-Correlation-Id: aaa19d03-368e-41f1-2f2f-08de2b46969b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
 =?utf-8?B?Ym1xZzJIbTM3TWNZb1dqRnJYdzN3c1NPNDFqVUFvSVhJUThMVkRERjl6Q1gr?=
 =?utf-8?B?VzNKT2NTVnJxTTJBNytrWUFGbndYWGhTVCtkWE84UlBzMHJrWVZ5eUx0K1Q4?=
 =?utf-8?B?OWQwOHhzQ0JpNjEvbTJyTTZoVG1RbHpRbk11VWJKeWdmZzlaeGpZemFuZ1Y2?=
 =?utf-8?B?NWNub0k0a3RPZ2V2V1UxZFNKd0FxU25HRmZyQjh2NTZzTWthVVNCSlVuWFNx?=
 =?utf-8?B?b1BZOXMzNlhqekRNTVd2bFBqMjlVVDFpSVVFVGxNOWR4YXptdmROc1ZZT01h?=
 =?utf-8?B?ZmNpMmYzb0VWajhSZ2ZpWnIzWm9NdVFtdGdseGozRGlOa3dtNFVsU2k0aWRR?=
 =?utf-8?B?UHNzYW1FVVVQYVIzOWNlcUx1cXlvTU9DMVZXT3o5U2J5dDJOckVOTlcrZTQx?=
 =?utf-8?B?bk5RWXZLL29BamlxaTlmaWkwNlFhRU9qZDNzSTBvQlFGc09WOXNPNisxeCtU?=
 =?utf-8?B?RUQwdlBKOGEwejFqdkpYU3B2YXJaMlJKbWUyQjEvcmh0VFN4R2hYUXlLalY0?=
 =?utf-8?B?UTFGWGx3RktGbkh6SVgrNk1MQ09QSUVGbVhkRHoyOHBjSVBpMmZPUEkzcjMw?=
 =?utf-8?B?NXpPdGRKMWZuVXc2enBCTU9sZ2t0WnRmZUVnb3NRZTV1ekdNNDFRZWRzTGFV?=
 =?utf-8?B?NExXb1dUMjgyK2dzNEpIeHdVRUk5dUZMMHU3bTdxaW4vWVcxZVdXUDBXZHl1?=
 =?utf-8?B?U0ZocFRlV0lINy9iWVNWbVlqNnhKekRDVXYyVnFrOXVNa1ZJRFpNZU1wWDJJ?=
 =?utf-8?B?L3ErcmE3d2VWdDExSnpEZ1A0WTVMbnRIYUNzaFM2NzA5ZCtEbGZNWHBVTC9w?=
 =?utf-8?B?UUhraEVGc0FGclFLUE15NEpUM0RPN2p5c2FLSlpGTXJjb0dyd2tnR0ljZjVY?=
 =?utf-8?B?R295SlZ4TGFNS0tvMWpsQlU0VU05Y0toQVlyVWU0cVVUcFE5TkczRTNTcFVm?=
 =?utf-8?B?TFpHZm9uTnppOTBPK3EvbC9VaUZlUmN5QXg0K3MybEhuYnh5VmVqdURURkNq?=
 =?utf-8?B?L3lCNVp1UGpXM2FOaVdiTGxaamUzUUU3dno4VEE3Z3lPeFc0YU9PT3I2Q0dB?=
 =?utf-8?B?WjRGa0NtQXBzM3F1ZGV2QzBRUzQzZ0dMK3ByNmxuU0tsNG1XUTUwbUZJVHJL?=
 =?utf-8?B?SzkzdElPQW9sZHFxMDlEYTJDWUNFRGsvb2pROXpOUkc1RVZ6RFRRUW1YY0lq?=
 =?utf-8?B?cUlnTHF0SW5sUEF1cHhoTFowaGV0UjI0ZCtENzBnd1M4YkVjQTJRT1Q0Lytp?=
 =?utf-8?B?RXQ2cjdjM2U1VDg1MXdtOEdzTW0vL2NpYjdsOTloLzBiUVpsMnQzTEdqUVpi?=
 =?utf-8?B?Lzh6dkM1djcvRjV3eitKd3FOb3lKSmZ2aFhYUis0aU92RUY1Z3UyS04rdW9I?=
 =?utf-8?B?ZzRrQjhNZXlYR3JiWFNuUG1XdUhzMXJUNVN0S1JQNFA0YUhPTFZuVGNya1pI?=
 =?utf-8?B?V3NweGZDeFZTK0VDcnBXZEMxeTdGbFYrcVppNnF2OEpvZTVPSUwyaXZhWFZF?=
 =?utf-8?B?eFMrT0tXaDlabkNYRzByRGNCVTJNT25xMFNhelRLN0t6OVBuYmNENzdtNENx?=
 =?utf-8?B?UmhodzU3NGN2a3hIUkVnK3NoRllHYlNaZDJBMUtneUlkdW05aUlMOGdVbWht?=
 =?utf-8?B?TEkzZTFYeWN6NENnL0d4dWNwTU1oUUN4bGRVQ0p3MUZKM0I4bERtSzNOeEM4?=
 =?utf-8?B?a1duNC9TV1phTGpHRWMzdzlOVUw3YU8yUU91Zk9sZmJoanJaNmFsOTdOZ0Fk?=
 =?utf-8?B?dkxiNklTM05lTllWN0Z0bGl4NXNhWTI2cFJsUnJQRzI1MllmVXB2YmY1YWda?=
 =?utf-8?B?OStvdlI1c3NXb3I4dzJDTTJoYW5iNllFMHdaZVRtdmxJMVlNOGhBbm16SXZt?=
 =?utf-8?B?TFpIV09Lb1RyMmpDOCs3Y0YwcklxZGxCcWp6enIzZkgvNFBGMWhOSFBrbGxl?=
 =?utf-8?Q?dO7DVcXu7R+4WWPFk1vPrBQx69ur0Hl0?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?Smh0OFh0RmNDVCtRYy9HSDhJSEk5U1lmSTJGYTJhOXZ0emt4SkgvVWFTR01Q?=
 =?utf-8?B?UENPL0FuK1hyZXY0YjVlMkY5QXE0NTUvWTZWT1htdldsM1d2TGVZcER2WnFX?=
 =?utf-8?B?U29jdldaUnNxQW1ZQnJFZnlpZk5PSkhFczllb0Y1dkE1YiszR3pSUnhmc0xx?=
 =?utf-8?B?MXdNbWxmNzZwSW90K3dBMUYrNGxLTTA4VWFHdkJuNEJpeFNvWG95VExjSVB1?=
 =?utf-8?B?WDJaUDBuVU80TEJsNUdQM2tXWjlNaElFdXJKTGtGbHZ6RmxwVDFlT1p2OThn?=
 =?utf-8?B?cHI2d2JRY2FQT2VVUDMwemxLaDRrVnZkaTJuTXdMV1pyZUUrTGlPTDc5bzQ5?=
 =?utf-8?B?RGhML2JoUkU3UktoVnR2c2JNRkpFRzFMTGE2UzdMZ0lSdEtnZ2FkS2RaV1dw?=
 =?utf-8?B?bWk2ZnBsY3AzdWt6SndDWFZWUStDUFZGY0xZR1BXVDdvNkVFSmxldUpTUm0y?=
 =?utf-8?B?MytnQ2lGbUJ2bTBhTjk2ZjBOUFk4SDNsaEx4K2RsSWYzenJPaWwvN2luRnNF?=
 =?utf-8?B?RXVoaDlEVUh4OUlqcDdWblE5TlBkSHFIblVOdkozY05ZV1lIKys2a0pBcG1T?=
 =?utf-8?B?d00zdWVjOFRXaXJMVEd2NTEvNVhwV241UHE3UVlRQVIwb2hKaTZTdEdyeEtm?=
 =?utf-8?B?WlJJS0dYai9CajNsN1Qzanp0QTF4cVlFa1Rya1haRml0c00rTDRBNnNyaFZv?=
 =?utf-8?B?TmErbDF2ZkFZVkJEY2FSVTgwRjhQVzhDK3o2dTdUclpuMldXeDllMnRMbVdF?=
 =?utf-8?B?WFNoZitoR01aZ0RRQ0YzbnpVZWIrVlRUSCtUVUZNNjVxQ3hxNE40OHdGRi9O?=
 =?utf-8?B?NWFtVVpBRWU5TXNjNkdXV1BTeWtTNFVzUGNCZDljSXZxanJwc2kxMFg3MjJX?=
 =?utf-8?B?b2E1N0ZLNWRMVXJrakk5WDhyb1NENW85bUlyRlY0c3dreHo4eXNibXllMkdT?=
 =?utf-8?B?S3RRUXhpcndoYlFzU1JiRjV5dm8wOHVQeVg3TXZ2KzJ4VGhDakt1cVAybk9E?=
 =?utf-8?B?NmYraldpem5NZU1pODRza0VaclRiTnVZaURZZC8vQStZTVFzbUpzOWNFSnZP?=
 =?utf-8?B?RTdvaEF1MEhGU21wOWJ1bytLUmMrRDZCbThROG9nOW1IMnVjYWlCL1B4K1F0?=
 =?utf-8?B?TktWTTF1UDFSMVlmRE5UL3ZhVE1tVHJsTzdSVGVVQnN5a1RzRTVWbHlhTHBZ?=
 =?utf-8?B?ZGlkNjdHeUpjSVdMaFhUTlhnbzdyNDRaYjB2NHkwZjQyNy9GdzBWYXJBTjY0?=
 =?utf-8?B?ZjBodHh1WXl0Q3pMVVZDUy9jdnhHRDFTQlYrZkp0bmx1TWZRSUFKSVc0eEhj?=
 =?utf-8?B?dXYwbWR5Z0YyUHBjSHIzdGszTWwwUk1sakphZGgxN0FsK1Rld01JZmRoSnhp?=
 =?utf-8?B?QXJsa2EwRmtlWUo4YUFsclNJaVUxZWxBaEtpeHlRMzIwektmVU1Va1kxSnBk?=
 =?utf-8?B?K1lyb0h4dmd3K285bUxINVNlNkRVRGx1MG00anRlanE5VzVVYUFwMml0dzRk?=
 =?utf-8?B?QTRmNUduUTZUYStYaDJibTJXY3laNXNIczdlYUxpRExEQU96cFRxamEzRTZt?=
 =?utf-8?B?N0VudFJoWnk1R21zTUNCYXZQS0EwNTBQaTZEVmVXNGU0dXhLVW5IV1hKWXRZ?=
 =?utf-8?B?dHQ1REVmUUx0cnQwbFVWVC9SZUp4VmpQMjRTTHd4TTUyZEdnZ1J6WFQrRDI0?=
 =?utf-8?B?NTRCMmJHOHlXUUlCMnI3ZmVkV3BCZUdvWG9WWWtXYkw4clJqZ3RPQ2RFa2pU?=
 =?utf-8?B?cU9OVGdVbTNFdEwrZU1DaitZcmNnRFBIMEVHL1Rpakt1dEMyY1AxM2tLc0dz?=
 =?utf-8?B?Uk03YU1xMlFzVnYvMVNrT0RadVNjS2lEYnhkdEpCUDF1SEszOHVmanlMdzBW?=
 =?utf-8?B?YUxhZ3MzdkhNS0Y3MlM2K2s2KzJ1M0pnVzdIYnJpUGgvczJxVnNHVnpxT1JR?=
 =?utf-8?B?Y3hiRGsrYUY5b2NCTGJkTHFrdDJ5b1hIYWZvUWNkQ0tra1dXNjg5bmVlejA1?=
 =?utf-8?B?USt3N2t5Q3pLQVVEOUl1emdrWnNCeitZZkNlbXN3STRGeXZRbVZXMHJZV1lj?=
 =?utf-8?B?WEV1Q2JUWloyL1RjbGRHRzhOR0NwM1p5TGd0SjkyQzhWRmJrUm9OSGQyR2Nr?=
 =?utf-8?B?RjRDMlB6TVczVnF4Y052amVxV25GclMxMzk3UWVWVEFKRUkzTjB6VDlQUHc5?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aaa19d03-368e-41f1-2f2f-08de2b46969b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 10:45:31.0361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5Subkzef4Zagf0ihny+REdaktaBNQVXO3BJGlmxIoZDjj2vLFcndvPvwHOL2bVPHrPxcDyUlq+tiBYS3RUEjAz9Nw03w9mQ4ITP7pVjbR7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8383
X-OriginatorOrg: intel.com
Message-ID-Hash: CYCXLRKZCZB3CPUTRB2HNBVSDZVLTTYH
X-Message-ID-Hash: CYCXLRKZCZB3CPUTRB2HNBVSDZVLTTYH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYCXLRKZCZB3CPUTRB2HNBVSDZVLTTYH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2025-11-21 9:41 AM, Oder Chiou wrote:
> The ALC5575 integrates an audio DSP that typically loads its firmware
> from an external flash via its own SPI host interface. In certain
> hardware configurations, the firmware can alternatively be loaded
> through the SPI client interface. The driver provides basic mute and
> volume control functions. When the SPI client interface is enabled,
> firmware loading is handled by the SPI driver.
> 
> Signed-off-by: Oder Chiou <oder_chiou@realtek.com>

Please CC the reviewers who actively review your patches, makes it 
easier not miss the follow ups.

Not talking about the tag-area, just the email Cc :)

> ---
>   sound/soc/codecs/Kconfig      |  10 +
>   sound/soc/codecs/Makefile     |   4 +
>   sound/soc/codecs/rt5575-spi.c |  86 ++++++++
>   sound/soc/codecs/rt5575-spi.h |  16 ++
>   sound/soc/codecs/rt5575.c     | 370 ++++++++++++++++++++++++++++++++++
>   sound/soc/codecs/rt5575.h     |  54 +++++
>   6 files changed, 540 insertions(+)
>   create mode 100644 sound/soc/codecs/rt5575-spi.c
>   create mode 100644 sound/soc/codecs/rt5575-spi.h
>   create mode 100644 sound/soc/codecs/rt5575.c
>   create mode 100644 sound/soc/codecs/rt5575.h
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index a0dfef57200c..a3ea5febd1e0 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -211,6 +211,7 @@ config SND_SOC_ALL_CODECS
>   	imply SND_SOC_RT1305
>   	imply SND_SOC_RT1308
>   	imply SND_SOC_RT5514
> +	imply SND_SOC_RT5575
>   	imply SND_SOC_RT5616
>   	imply SND_SOC_RT5631
>   	imply SND_SOC_RT5640
> @@ -1767,6 +1768,15 @@ config SND_SOC_RT5514_SPI_BUILTIN
>   	bool # force RT5514_SPI to be built-in to avoid link errors
>   	default SND_SOC_RT5514=y && SND_SOC_RT5514_SPI=m
>   
> +config SND_SOC_RT5575
> +	tristate "Realtek ALC5575 Codec - I2C"
> +	depends on I2C
> +
> +config SND_SOC_RT5575_SPI
> +	tristate "Realtek ALC5575 Codec - SPI"
> +	depends on SPI_MASTER
> +	select SND_SOC_RT5575
> +
>   config SND_SOC_RT5616
>   	tristate "Realtek RT5616 CODEC"
>   	depends on I2C
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index 39138d96a720..82f660cbe8ec 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -252,6 +252,8 @@ snd-soc-rt286-y := rt286.o
>   snd-soc-rt298-y := rt298.o
>   snd-soc-rt5514-y := rt5514.o
>   snd-soc-rt5514-spi-y := rt5514-spi.o
> +snd-soc-rt5575-y := rt5575.o
> +snd-soc-rt5575-spi-y := rt5575-spi.o
>   snd-soc-rt5616-y := rt5616.o
>   snd-soc-rt5631-y := rt5631.o
>   snd-soc-rt5640-y := rt5640.o
> @@ -684,6 +686,8 @@ obj-$(CONFIG_SND_SOC_RT298)	+= snd-soc-rt298.o
>   obj-$(CONFIG_SND_SOC_RT5514)	+= snd-soc-rt5514.o
>   obj-$(CONFIG_SND_SOC_RT5514_SPI)	+= snd-soc-rt5514-spi.o
>   obj-$(CONFIG_SND_SOC_RT5514_SPI_BUILTIN)	+= snd-soc-rt5514-spi.o
> +obj-$(CONFIG_SND_SOC_RT5575)	+= snd-soc-rt5575.o
> +obj-$(CONFIG_SND_SOC_RT5575_SPI)	+= snd-soc-rt5575-spi.o
>   obj-$(CONFIG_SND_SOC_RT5616)	+= snd-soc-rt5616.o
>   obj-$(CONFIG_SND_SOC_RT5631)	+= snd-soc-rt5631.o
>   obj-$(CONFIG_SND_SOC_RT5640)	+= snd-soc-rt5640.o
> diff --git a/sound/soc/codecs/rt5575-spi.c b/sound/soc/codecs/rt5575-spi.c
> new file mode 100644
> index 000000000000..9dbc8170fb76
> --- /dev/null
> +++ b/sound/soc/codecs/rt5575-spi.c
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * rt5575-spi.c  --  ALC5575 SPI driver
> + *
> + * Copyright(c) 2025 Realtek Semiconductor Corp.
> + *
> + */
> +
> +#include <linux/of.h>
> +#include <linux/spi/spi.h>
> +
> +#include "rt5575-spi.h"
> +
> +#define RT5575_SPI_CMD_BURST_WRITE	5
> +#define RT5575_SPI_BUF_LEN		240
> +
> +struct rt5575_spi_burst_write {
> +	u8 cmd;
> +	u32 addr;
> +	u8 data[RT5575_SPI_BUF_LEN];
> +	u8 dummy;
> +} __packed;
> +
> +bool rt5575_spi_ready;

I believe the patch is dead on arrival, unfortunately as it won't 
compile as =m (module) when CONFIG_SND_SOC_RT5575_SPI is enabled as =m 
simultaneously. EXPORT_SYMBOL_GPL() or a friend of his is missing.

> +static struct spi_device *rt5575_spi;
> +
> +/**
> + * rt5575_spi_burst_write - Write data to SPI by rt5575 address.
> + * @addr: Start address.
> + * @txbuf: Data buffer for writing.
> + * @len: Data length.
> + *
> + */
> +int rt5575_spi_burst_write(u32 addr, const u8 *txbuf, size_t len)
> +{
> +	struct rt5575_spi_burst_write buf = {
> +		.cmd = RT5575_SPI_CMD_BURST_WRITE
> +	};
> +	unsigned int end, offset = 0;
> +
> +	while (offset < len) {
> +		if (offset + RT5575_SPI_BUF_LEN <= len)
> +			end = RT5575_SPI_BUF_LEN;
> +		else
> +			end = len % RT5575_SPI_BUF_LEN;
> +
> +		buf.addr = cpu_to_le32(addr + offset);
> +
> +		memcpy(&buf.data, &txbuf[offset], end);
> +
> +		spi_write(rt5575_spi, &buf, sizeof(buf));
> +
> +		offset += RT5575_SPI_BUF_LEN;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(rt5575_spi_burst_write);
> +
> +static int rt5575_spi_probe(struct spi_device *spi)
> +{
> +	rt5575_spi = spi;
> +
> +	rt5575_spi_ready = true;


I still do not understand the logic behind having rt5575_spi _and_ 
rt5575_spi_ready. The latter is used just one, in the I2C-device probe. 
rt5575_spi is static and will be by default initialized to NULL. 
Statement 'if (!rt5575_spi)' is enough to cover that single occurrence 
in your code.

> +
> +	return 0;
> +}

...

> diff --git a/sound/soc/codecs/rt5575.c b/sound/soc/codecs/rt5575.c
> new file mode 100644
> index 000000000000..58508d643273
> --- /dev/null
> +++ b/sound/soc/codecs/rt5575.c

...

> +static int rt5575_probe(struct snd_soc_component *component)
> +{
> +	struct rt5575_priv *rt5575 = snd_soc_component_get_drvdata(component);
> +
> +	rt5575->component = component;
> +
> +	dev_info(component->dev, "Private ID: %llx\n", rt5575_get_priv_id(rt5575));
> +
> +#if IS_ENABLED(CONFIG_SND_SOC_RT5575_SPI)
> +	request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT, "realtek/rt5575/rt5575_fw1.bin",
> +		component->dev, GFP_KERNEL, rt5575, rt5575_fw_load_by_spi);

I do not believe this is OK. If the SPI component exists, from the 
code-perspective it looks like the firmware-loading procedure is 
essential and failing to load the firmware should halt driver's operations.

See below as this touches on the driver design which looks off and I 
haven't found any valid argumentation in your previous message that 
would clarify the situation.

> +#endif
> +
> +	return 0;
> +}

...

> +static const struct i2c_device_id rt5575_i2c_id[] = {
> +	{ "rt5575" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, rt5575_i2c_id);
> +
> +static int rt5575_i2c_probe(struct i2c_client *i2c)
> +{
> +	struct rt5575_priv *rt5575;
> +	int ret, val;
> +
> +#if IS_ENABLED(CONFIG_SND_SOC_RT5575_SPI)
> +	if (!rt5575_spi_ready)
> +		return -EPROBE_DEFER;
> +#endif

I finally understood what's off in the design, and this part is crucial 
to the subject.

If CONFIG_SND_SOC_RT5575_SPI is enabled, and the SPI kept failing for 
whatever reason, the I2C device probe would get deferred continuously. 
As the kconfig looks optional, the question is: Does rt5575 codec exist 
in a "without SPI flash" version or, is it always shipped with SPI flash?

If it does exist as a standalone component - without SPI - then enabling 
CONFIG_SND_SOC_RT5575_SPI effectively renders the driver dysfunctional.

> +
> +	rt5575 = devm_kzalloc(&i2c->dev, sizeof(struct rt5575_priv),
> +				GFP_KERNEL);
> +	if (rt5575 == NULL)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(i2c, rt5575);
> +
> +	rt5575->i2c = i2c;
> +
> +	rt5575->dsp_regmap = devm_regmap_init_i2c(i2c, &rt5575_dsp_regmap);
> +	if (IS_ERR(rt5575->dsp_regmap)) {
> +		ret = PTR_ERR(rt5575->dsp_regmap);
> +		dev_err(&i2c->dev, "Failed to allocate register map: %d\n", ret);
> +		return ret;
> +	}
> +
> +	rt5575->regmap = devm_regmap_init(&i2c->dev, NULL, i2c, &rt5575_regmap);
> +	if (IS_ERR(rt5575->regmap)) {
> +		ret = PTR_ERR(rt5575->regmap);
> +		dev_err(&i2c->dev, "Failed to allocate register map: %d\n", ret);
> +		return ret;
> +	}
> +
> +	regmap_read(rt5575->regmap, RT5575_ID, &val);
> +	if (val != RT5575_DEVICE_ID) {
> +		dev_err(&i2c->dev, "Device with ID register %08x is not rt5575\n", val);
> +		return -ENODEV;
> +	}
> +
> +	regmap_read(rt5575->regmap, RT5575_ID_1, &val);
> +	if (!val) {
> +		dev_err(&i2c->dev, "This is not formal version\n");
> +		return -ENODEV;
> +	}
> +
> +	return devm_snd_soc_register_component(&i2c->dev, &rt5575_soc_component_dev, rt5575_dai,
> +		ARRAY_SIZE(rt5575_dai));
> +}
> +
> +static const struct of_device_id rt5575_of_match[] = {
> +	{ .compatible = "realtek,rt5575" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, rt5575_of_match);
> +
> +static struct i2c_driver rt5575_i2c_driver = {
> +	.driver = {
> +		.name = "rt5575",
> +		.owner = THIS_MODULE,
> +		.of_match_table = of_match_ptr(rt5575_of_match),
> +	},
> +	.probe = rt5575_i2c_probe,
> +	.id_table = rt5575_i2c_id,
> +};
> +module_i2c_driver(rt5575_i2c_driver);
> +
> +MODULE_DESCRIPTION("ASoC ALC5575 driver");
> +MODULE_AUTHOR("Oder Chiou <oder_chiou@realtek.com>");
> +MODULE_LICENSE("GPL");
