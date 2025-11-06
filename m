Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 531F5C39F5D
	for <lists+alsa-devel@lfdr.de>; Thu, 06 Nov 2025 10:58:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1532601F6;
	Thu,  6 Nov 2025 10:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1532601F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1762423127;
	bh=oQB0EvOJLApMAnDZHSWIKyemwMDGSpC8ShJZD9QyisU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H6uZ3swYJ7nW0U/wEN8expsPX7+CxobAhrsVN2mp8ycvq9FDgXhv3No6/gR2H2FaS
	 GP2wDLmjc06IFQm+fobZgr1CdUOlGvRw4lftcSBaLELKgsCcmDbCXVMVC4R2kYfrd6
	 wHMl2C42W6z9UEUYzJ3+V1WCx0RLtZ4UBAQBFcHg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1C35F80552; Thu,  6 Nov 2025 10:58:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB92FF80552;
	Thu,  6 Nov 2025 10:58:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F630F80272; Thu,  6 Nov 2025 10:58:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E2EEF800D2
	for <alsa-devel@alsa-project.org>; Thu,  6 Nov 2025 10:57:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E2EEF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=i8T25oVA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762423080; x=1793959080;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oQB0EvOJLApMAnDZHSWIKyemwMDGSpC8ShJZD9QyisU=;
  b=i8T25oVA8vN39OhjcEUOmJUN9pVnfA1WK3adRsR8hXcfxcHkbeRNpr4L
   EQxg7EgveQeGoG8vtHI+1PV57GR4uLDDvPaJwn5UB3Sq0D38F6qEUKdsG
   Cz7u6+Rh+CweNg+FUiby8MtIn4YQis2B4XKNHGakZetrzKGbvAYPAXy79
   qVEHRud4xWMHdCzli0MaHGCRzicMpw8uBMI1noDpyu+U5hDP4DT0YUMvu
   TxARquPkB6MVej651BhiHT0jdwYVq9tkvd00/Opp12CAgGJ3iSjkxRHM/
   7Kk7dPLfWKmZFSOkY5k0JQBV/K2Yfw3H0uUTKX9BU/RSDJbEvQjDvN8tV
   w==;
X-CSE-ConnectionGUID: aiKCNTAzSZa/AwdHCDfo9g==
X-CSE-MsgGUID: 4edUIZqgQyy9krXInhDisA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="76005495"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000";
   d="scan'208";a="76005495"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:57:54 -0800
X-CSE-ConnectionGUID: Fh11BVjzQuqrYAdPnLMQIw==
X-CSE-MsgGUID: xJJYRd9BQKCtovuDdkYcrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000";
   d="scan'208";a="187876696"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 01:57:54 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 01:57:53 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 01:57:53 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.26) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 01:57:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKJqEv4SC2XWIrG2g6EzlFXtTjs1rmjtiTyZe9kwS52aSD+QSDXbDX3pWbU5OtwEKhTui8hMqll88WU7vzWwKPxxxMCrfPvTGUUgbAZ6ei9YGd/QTPEgrsHT0h5n69DUAeLCqxafKmhNpBi1Tofx4rE7npivAmLglkgI0hSIsU/XYMcMu7HMDVJpZUGKAI19T/nCw7weOg2F8965SCLGJ2X5Irf5TjBqGfFvCLoP1cCB5NgLSFZhV6DDqIAJRcjMAaNen16COr8yx7FC/PZBkQa6TmkjeM+YFZv5fZmwXOFf7WiDImTFAIpoe8BtCEg6EKwVdtS1rfoDmktXAzK6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQHp2Y7glCE1SOkKtxuWAG0YZyrDJlKmPM8rax/QU0o=;
 b=m5cbWw5PsWY6bLE3mBZsNFRrPovrK5s+W6u1ZpMvJirQZUdjUlt20JOHGQW5FmO14gaXf8EI0J+dEart0XaFF2W3bgVD6ChG6AGjNVKg60Nc5uA1iwewR9IoQaKfMEA22UGh+r+1/vu7tJV55vqMC0YDr8HT1wbrK/mVx0/NmMMVqusaNIK3HUVV0NNQeoTVi1dEaBjALNiDf8vS+Zz94hfnVHXCs3B+06RWGyRywdMr+NzFG9wZvtwvuTQblsutAMQyr3jSCvWMtJ3v/Vab/fZpW5/7DWZ20HbqDJV7IDNvuqrAQk89wm3DOiUbVow6QIXGP50PNv9euJNvo7jCmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by SA3PR11MB7582.namprd11.prod.outlook.com (2603:10b6:806:31e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 09:57:50 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::3:e0a:87af:d4b6%6]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 09:57:50 +0000
Message-ID: <550e7259-c371-431d-b515-c1e49b0ddd42@intel.com>
Date: Thu, 6 Nov 2025 10:57:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] ASoC: rt5575: Add the codec driver for the ALC5575
To: Oder Chiou <oder_chiou@realtek.com>
CC: <alsa-devel@alsa-project.org>, <flove@realtek.com>,
	<shumingf@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	<broonie@kernel.org>, <lgirdwood@gmail.com>
References: <20251031073245.3629060-1-oder_chiou@realtek.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20251031073245.3629060-1-oder_chiou@realtek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0351.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::24) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|SA3PR11MB7582:EE_
X-MS-Office365-Filtering-Correlation-Id: e492f22d-e20a-4ae1-141b-08de1d1af21a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
 =?utf-8?B?TS92bXhsd1ZISVF6YTJQbnBrcGExL2MwUkttc0MvOWtmM3hlRVpVcTJwSUdK?=
 =?utf-8?B?TGNUQ1MzZGRBcUxDVk9XTjR1MzRkcDZrdmd5b3JIbklGOXMyNG9Wd2pFOHpG?=
 =?utf-8?B?cmhCbTI0SThxQU1uNVAzekVEd01JUkF1dEc4akVNWlB5alJMZlMwRitEQjla?=
 =?utf-8?B?Z2JIR2JjSzc1OGlSYkFoY0U4YXpaNk93WG92V3p5a3M1ZjRwSnF4WmlHN3Zr?=
 =?utf-8?B?RzFXM0U3VHpUdVBMMm1yVXZQcGlCTlhWSWRoV0pGVzNZWGprZS9CNlNmVzN5?=
 =?utf-8?B?UCtRV3hTajIycjB1NGk3aUNhcDVBRXN4MHFYYkhuV2JJdXI0d05ieVpnQ3A3?=
 =?utf-8?B?Uk5JTExTU0NRd3dnL1pHWDNEQUJ4YkJpTHNqVDFFUDBmVytiQVRzY3NaS0E5?=
 =?utf-8?B?RnducElIZnpIZzM3VHR3a2JmRzh3Yk44diszRmtzWGVOQTFKNkxzZ0ExNDZG?=
 =?utf-8?B?aGRmU0VzYkhnTUg4SmtPcHY5SDRJTVRGengvZFVOZlJNdEFGMlRzRmJHTUo2?=
 =?utf-8?B?Q3I5a2lJTFdacjBZRFZRS1FMOVBCQ3Y1QjloM0NVdnZyRklkS2hiNTE1MUpr?=
 =?utf-8?B?NVNFNng4QU1waEp0SEN4Z2pkeG8rdVBxZC9FMWdYQm16YkFuS1h0Zm1UWHhu?=
 =?utf-8?B?bmNVLzdWVkcwNjFTK2ZGaUh6YmZlVE5CSTRxWlRXdW5ZOUZwa1lmajBuMFBJ?=
 =?utf-8?B?UDY4cGRrclZ4T3B3YldaL2VOVTIwUzhLVDQyWk1pbmYreEZIRkVSNzVueE1U?=
 =?utf-8?B?WUxjMy9Mb0JsbVdkQVIxaVMwUEcxYWdTbEhIN3JZa1hRNnZ3NXlabHErVjFQ?=
 =?utf-8?B?UnpKanZuZWdxcVNrcUZxcUpQUU91QUpHL0xsK3V0V2ltMUNNTDcwNHhJcVY0?=
 =?utf-8?B?TVpzbW1yMUhseWxlYmJlTUt1b09yTC9kSlQ5ZGROOVhueEZ6ZlRwdng5aGFh?=
 =?utf-8?B?cTh1NHZ5WlNERjFNTEZhSjlqMXM5cDg3dXE4K1VmeTY0OUtnNmg5UWFyQWNm?=
 =?utf-8?B?dXlVbVE0T01vRGQwVjI3WHVkM3ZQVGlKNDY4UDlrUm5pZnRockY4R25leW9T?=
 =?utf-8?B?TThWa2NNOFhFRnNqYnZGK1U4M2hXVGwwZkQyQi9nWnVlY3g2V1NZVzRNOEgx?=
 =?utf-8?B?VVRHSlNZNGhoUERDMjFXekN1M2M2NlpJZStyQitXVXorMzVGYnFwd1FmT2c5?=
 =?utf-8?B?L3phOUlZQnRhdU1IMEdMcXY4b1pVbllCZWw0Tm52US9uZ0txb2x3WnlCd3NB?=
 =?utf-8?B?eGhqSjB0eUV5YnlnZWVtTEpGR25xbHpiN0t4ZFBBcnlaZzlaSXBobDNSS2pJ?=
 =?utf-8?B?RHhMYm5OY3JySTN2MWR0N0w5eVVkMFlNeVVZUDlGb1FtZnhGS2FKK3gxZzN0?=
 =?utf-8?B?N3NUOHNBckNsL1JKS09VaWNCM2FJMVZaRytaVHU0c3AwaEFCUnVNVXBxclFh?=
 =?utf-8?B?b0tsNGFsMnJZbkYwMERKU2RVOEVTY2tHN1h6TDljTE5IdnNFYmdxdG5BQ201?=
 =?utf-8?B?aTNhakJQQjBsbEh1QVgyYURTVFRtODFmK1MyNUEzVERsUHNRVDdVRUwrSThn?=
 =?utf-8?B?VDBwZUtZTDQzdE8xVyt1elFTcGFpL2NPVVhzMUt2NmthVlhyaEtyOVl6OW1q?=
 =?utf-8?B?NFlLWjZrVTdxYnpvNDg2U2Q4NkJhOCtpYUc1eWhOdVJUZS9LcWluUEVFdUpN?=
 =?utf-8?B?dE1LTEF4enRtTHlNRU40SlF1YnVuREVDWDY3TEVRZ1RiYi9HRVpFSlFJQnVq?=
 =?utf-8?B?bXFlV1l1WTJrcHByemxzMGdSOGwyNWFSZUxtN3FsK0c5SG1TcWVJbXozUTdO?=
 =?utf-8?B?bkQ2dnFiaUpoL04wZllVL0tMd014ZEpBUW5EYXRKU3E5Sk16amZwYVRad0Fz?=
 =?utf-8?B?ak1lemZRSW1td1VVRklENDZPZGNqdU9HWW43OWdDM3BkN3dzNVhCVVhKRk5L?=
 =?utf-8?Q?CM6eO6VOf8hJI4CC7OLsZAhLkm073AAn?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?b1ZkMHVLWkluOXFNZnFKVkE2UWtUWTc4bFpBYlprYzVKam1ZRTBpYnoyRy9x?=
 =?utf-8?B?clRwYlA4eWlYa25Qa2V6VHNNR25JdjZQS1NQbGJ5dzZEN0FTa3RLcDNyWHVQ?=
 =?utf-8?B?R0liVG1HUVg5UUZWeU1NcWh0RldIZDFVL2tXWGYySUFJa2F3L2lscTVzcXhj?=
 =?utf-8?B?cTNOOW80d2toaGdiTGRvNzNad011bExwMXA1QVFzRzBZVTc3STcrZ05YYU8z?=
 =?utf-8?B?d1A1OVFKaDV1OUlndDNYeXA4TjRMVnVjT0h6bmFGdWFMa0EyenVqYWhJSGVP?=
 =?utf-8?B?RDA3V0MycFd5YXorZjNpL2QyMTVHM05odGVoTkNCdnZvL2laU2ZvVjlDNHRK?=
 =?utf-8?B?ZzVUb0sxNkJ2TGFHNWZ3ajJmcXVXUkwwSE1pMDV6NXRzYmcvSkJkQ2ZhZFIz?=
 =?utf-8?B?QnlQM3ZWMFhzSk4rTEJNWlowaDBMK1JiaWNKUDNjRytzblJRRzZiU3FnaEZO?=
 =?utf-8?B?dEhLRmc1Wk9rLzdJcW5EZ1FOTm1UY2VLcXp3U1lPNHpiL0JCa0V3Wnl0a2JX?=
 =?utf-8?B?bkJKdnY0L2RQNWQvZ0tET2ZINTgzb2RwL3ZPRCtrQStNTHBycWVvNEtORzNp?=
 =?utf-8?B?VUI3dG42MzJEKzFSTi9pT281dmNZeVhIV3NlWmt3bzYrM3pyM2cyQW4zcFE4?=
 =?utf-8?B?UExlODB0THFLTDlIV3E0UkxIR1NrTHFrR2NKdG1WdFRaSmQ0WTJsT3NWSGxR?=
 =?utf-8?B?OWRZVWRTdGdOM3lzbnZoRm9CczBUWFNZdTd1Sm03Ky9NeTBJbkg3OVo5eXll?=
 =?utf-8?B?NXdGeEJhSkdjcldmVVJUaEtIYzFuMkxaZGE4bHI5SFh5K3grR1h3bFlEM2k4?=
 =?utf-8?B?K28veXZGM2diY2ZkYnpZNjBmSkVqd2t0dTNubWk2OEVhUDhXSlgxczBuN3Jw?=
 =?utf-8?B?T0lUc3doYWJJZm5ITG13ZkJ0Vk5zb01NZkg1MUkxNjVtakVMY0VQZklTQUpG?=
 =?utf-8?B?aC9kMUJkR296aFRYUVUyL0tCTFFBV2J5dzlXQVFBeEVxK2djQWdNbStYeVRm?=
 =?utf-8?B?UHRCKy9iVHF5Q0hITlB5dG1LUzJ5TjJkdnBIRWN6TlpWSlpsN1F1QXVuZXNY?=
 =?utf-8?B?TDVLS3RBTVNPbWxBWlBXWVhlbFBMNjdSV0V5VXlyRGd0UFA3TW5EdkFuMjFN?=
 =?utf-8?B?bnU4aWRUaEVzTzUwZEwveldXV09kUU1YUHBxMEovUGdFbmR1a01lL2hpYlZJ?=
 =?utf-8?B?SDBXN1Y1RnRHMVZyL3NZZWQ0RUdzRUw1ditzait2Nmd5VW56UkhJZWJYZmMx?=
 =?utf-8?B?bjFmd1Y5VGdvZy92QXFHMktuTnNDUzg2RGpmMlorQ0dGN2tBRWYwV0ROOHdT?=
 =?utf-8?B?MGY5RG5vM2hFaEhvbERqY0tNUzBGaEJRdjRmcko0bHZCVURjNzJrRkcwOHor?=
 =?utf-8?B?L2lNSlY3QjhKemt3MSs1SS9xUG84VkZKU3luVGlEaWUzOGhOZHlTYnZCbE1X?=
 =?utf-8?B?YXhNcExDSFFzck4rRmFzUVhONFhvUlduMjlWNTVTcXRYdWxyK05lcjFYT2Uy?=
 =?utf-8?B?WnBGbDRjUXVTNWZvMllCa21yNjJwZjRnZ28wcTZkRmVlMjk0OG13VktSRWxs?=
 =?utf-8?B?MGVWZVBDUTJGR2RWa2E0OUxWUlc0OHpYTVRndys5NXpDR3lNd1EzWnV5RWht?=
 =?utf-8?B?RzM3UGw2YlFGdGtNUVk4amZjTGtRcjFRMkxKam5wVFp0S0QxZjl3SWFEcDFE?=
 =?utf-8?B?dkZ5OVFTR2hIT3NkdTZTMW16aUUwVU1PdEZsZ0p0dTkrMmVSZ2k1ZHh0RTNj?=
 =?utf-8?B?ejBCdEVOditsRmQrNXp5ZEk2eGthY2VZVWpxZHcwcDRENUErUC9uU1FFdjRa?=
 =?utf-8?B?TTRieVZzUnRZSVlueWpTY0gzdlZVeUxIN0lqalJXcEZmMVF0UWhpNjg0Y0kw?=
 =?utf-8?B?RDg1SGxkanFPZ3ExTFN1ZmVXNUdqWXg3clRNMk40djVwNHN2VWVneldXUXJu?=
 =?utf-8?B?ZDVId29OUXlUdnlaU3B5TmNJZWszRU5EUHBTMjFtK2RNMlVybkNuaFlsb0M2?=
 =?utf-8?B?NytaY0IyVWFzMEVrdVdWSGFCcmZ6RExyUGJja254SUx3MkNUa3FLbUdWOCs2?=
 =?utf-8?B?ZkI4UGhWZXFscmcxaE5qcmY2Ym8xTkNWdjExYmE4M0prU2YrOE1aSnRwTmhn?=
 =?utf-8?B?WFR0bWk0QzROTTg2MnJDZk5zOTZFaXljSXdsTjBrUGVtYWhULzNtbUc5QzRp?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e492f22d-e20a-4ae1-141b-08de1d1af21a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 09:57:50.6146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 78juUG19d2fTPizIHQz41EQUCkVSjP/XR8YcWQXjuSY9BZJe/W5q9lT5t0M8XeKstHMlUe9CJnBCRPVDIqypmp4/xaHhveayNJVYCQV4zPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7582
X-OriginatorOrg: intel.com
Message-ID-Hash: EZZRPN24KDJPG75I7KEBJCZJZ2E5MVOD
X-Message-ID-Hash: EZZRPN24KDJPG75I7KEBJCZJZ2E5MVOD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EZZRPN24KDJPG75I7KEBJCZJZ2E5MVOD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2025-10-31 8:32 AM, Oder Chiou wrote:
> The ALC5575 integrates an audio DSP that typically loads its firmware
> from an external flash via its own SPI host interface. In certain
> hardware configurations, the firmware can alternatively be loaded
> through the SPI client interface. The driver provides basic mute and
> volume control functions. When the SPI client interface is enabled,
> firmware loading is handled by the SPI driver.

The patch looks much nicer. Thank you for the update, Oder. Let's move 
to round 2.

> 
> Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
> ---
>   sound/soc/codecs/Kconfig      |  10 +
>   sound/soc/codecs/Makefile     |   4 +
>   sound/soc/codecs/rt5575-spi.c |  95 +++++++++
>   sound/soc/codecs/rt5575-spi.h |  16 ++
>   sound/soc/codecs/rt5575.c     | 366 ++++++++++++++++++++++++++++++++++
>   sound/soc/codecs/rt5575.h     |  54 +++++
>   6 files changed, 545 insertions(+)
>   create mode 100644 sound/soc/codecs/rt5575-spi.c
>   create mode 100644 sound/soc/codecs/rt5575-spi.h
>   create mode 100644 sound/soc/codecs/rt5575.c
>   create mode 100644 sound/soc/codecs/rt5575.h
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index a0dfef57200c..cb4e14013cc8 100644
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
> +	tristate
> +	depends on I2C
> +
> +config SND_SOC_RT5575_SPI
> +	tristate

I'd suggest to add a caption for both tristates. Examples are present 
all around that very file.

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
> index 000000000000..cf30d22e8a8f
> --- /dev/null
> +++ b/sound/soc/codecs/rt5575-spi.c
> @@ -0,0 +1,95 @@
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
> +#define RT5575_SPI_BUF_LEN	240

Let's move that right before its first usage - the struct below.

> +
> +/* SPI Command */
> +enum {
> +	RT5575_SPI_CMD_16_READ = 0,
> +	RT5575_SPI_CMD_16_WRITE,
> +	RT5575_SPI_CMD_32_READ,
> +	RT5575_SPI_CMD_32_WRITE,
> +	RT5575_SPI_CMD_BURST_READ,
> +	RT5575_SPI_CMD_BURST_WRITE,

Looks like only the last one, RT5575_SPI_CMD_BURST_WRITE, is used. Any 
plans for follow up patches utilizing these? If not, perhaps it's good 
idea to just drop them.

If someone insists on having them here regardless of lack of usage i.e.: 
code-as-documentation approach, then at least flag them, e.g.:

/* Available SPI commands, 16_READ till BURST_READ reserved. */
enum {
	RT5575_SPI_CMD_16_READ = 0,
	RT5575_SPI_CMD_16_WRITE,
	RT5575_SPI_CMD_32_READ,
	RT5575_SPI_CMD_32_WRITE,
	RT5575_SPI_CMD_BURST_READ,
	RT5575_SPI_CMD_BURST_WRITE,

> +};
> +
> +struct rt5575_spi_burst_write {

Naming is weird - it's not a 'BURST_WRITE' command until the 'cmd' field 
says so. I'd rather have this named 'struct rt5575_spi_cmd' as its 
description and usage suggests.

> +	u8 cmd;
> +	u32 addr;
> +	u8 data[RT5575_SPI_BUF_LEN];
> +	u8 dummy;
> +} __packed;
> +
> +bool rt5575_spi_ready;
> +static struct spi_device *rt5575_spi;
> +
> +/**
> + * rt5575_spi_burst_write - Write data to SPI by rt5575 address.
> + * @addr: Start address.
> + * @txbuf: Data buffer for writng.

Spelling. You can use --codespell when utilizing checkpatch.pl, before 
the patches are sent. Should find most of such stuff for you.

> + * @len: Data length.
> + *
> + */
> +int rt5575_spi_burst_write(u32 addr, const u8 *txbuf, size_t len)
> +{
> +	struct rt5575_spi_burst_write buf = {
> +		.cmd = RT5575_SPI_CMD_BURST_WRITE
> +	};

Depending on whether you plan to add more commands than 'just' 
BURST_WRITE, adding a macro may save you some LOCs:

#define RT5575_SPI_CMD(cmd_type)		\
{						\
	.cmd = RT5575_SPI_CMD_##cmd_type,	\
}

// usage:
struct rt5575_spi_cmd buf = RT5575_SPI_CMD(BURST_WRITE);

Gets handy if you're planning to implement 2+ rt5575_spi_cmd_xxx() 
functions. This is just a suggestion and if you're going to stick to 
just one cmd, you can skip it.

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
> +		spi_write(rt5575_spi, &buf, sizeof(struct rt5575_spi_burst_write));

sizeof(buf), easier to maintain than sizeof(struct).

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

This looks weird. If rt5575_spi_ready is 'true' unconditionally on 
probe(), why not just replace it with '!rt5575_spi' checks or 
IS_ERR_OR_NULL(rt5575_spi)?

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id rt5575_of_match[] = {
> +	{ .compatible = "realtek,rt5575" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, rt5575_of_match);
> +
> +static struct spi_driver rt5575_spi_driver = {
> +	.driver = {
> +		.name = "rt5575",
> +		.of_match_table = of_match_ptr(rt5575_of_match),
> +	},
> +	.probe = rt5575_spi_probe,
> +};
> +module_spi_driver(rt5575_spi_driver);
> +
> +MODULE_DESCRIPTION("ALC5575 SPI driver");
> +MODULE_AUTHOR("Oder Chiou <oder_chiou@realtek.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/codecs/rt5575-spi.h b/sound/soc/codecs/rt5575-spi.h
> new file mode 100644
> index 000000000000..cafe49a7ecc2
> --- /dev/null
> +++ b/sound/soc/codecs/rt5575-spi.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * rt5575-spi.h  --  ALC5575 SPI driver
> + *
> + * Copyright(c) 2025 Realtek Semiconductor Corp.
> + *
> + */
> +
> +#ifndef __RT5575_SPI_H__
> +#define __RT5575_SPI_H__
> +
> +extern bool rt5575_spi_ready;
> +
> +int rt5575_spi_burst_write(u32 addr, const u8 *txbuf, size_t len);
> +
> +#endif /* __RT5575_SPI_H__ */
> diff --git a/sound/soc/codecs/rt5575.c b/sound/soc/codecs/rt5575.c
> new file mode 100644
> index 000000000000..58cceaac0705
> --- /dev/null
> +++ b/sound/soc/codecs/rt5575.c
> @@ -0,0 +1,366 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * rt5575.c  --  ALC5575 ALSA SoC audio component driver
> + *
> + * Copyright(c) 2025 Realtek Semiconductor Corp.
> + *
> + */
> +
> +#include <linux/firmware.h>
> +#include <linux/i2c.h>
> +#include <sound/soc.h>
> +#include <sound/tlv.h>
> +
> +#include "rt5575.h"
> +#if IS_ENABLED(CONFIG_SND_SOC_RT5575_SPI)
> +#include "rt5575-spi.h"
> +#endif
> +
> +static bool rt5575_readable_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case RT5575_ID:
> +	case RT5575_ID_1:
> +	case RT5575_MIXL_VOL:
> +	case RT5575_MIXR_VOL:
> +	case RT5575_PROMPT_VOL:
> +	case RT5575_SPK01_VOL:
> +	case RT5575_SPK23_VOL:
> +	case RT5575_MIC1_VOL:
> +	case RT5575_MIC2_VOL:
> +	case RT5575_WNC_CTRL:
> +	case RT5575_MODE_CTRL:
> +	case RT5575_I2S_RATE_CTRL:
> +	case RT5575_SLEEP_CTRL:
> +	case RT5575_ALG_BYPASS_CTRL:
> +	case RT5575_PINMUX_CTRL_2:
> +	case RT5575_GPIO_CTRL_1:
> +	case RT5575_DSP_BUS_CTRL:
> +	case RT5575_SW_INT:
> +	case RT5575_DSP_BOOT_ERR:
> +	case RT5575_DSP_READY:
> +	case RT5575_DSP_CMD_ADDR:
> +	case RT5575_EFUSE_DATA_2:
> +	case RT5575_EFUSE_DATA_3:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +static const DECLARE_TLV_DB_SCALE(ob_tlv, -9525, 75, 0);
> +
> +#if IS_ENABLED(CONFIG_SND_SOC_RT5575_SPI)
> +static void rt5575_spi_fw_loaded(const struct firmware *fw, void *context)

This has still not been addressed since my previous review. I do not 
understand the logic here. We have a 'common' file yet filled plagued by 
SPI specifics. On one hand we have rt5575_spi_burst_write() exported and 
part of SPI-specific entity, on the other we have rt5575_spi_fw_loaded() 
hidden here.

Design if off, choose one or the other. In general, prefer the common 
code to be actually _common_. Makes it easier to Realtek and non-Realtek 
to maintain the code going forward. Leave specifics within the 
specifics-files.

> +{
> +	struct rt5575_priv *rt5575 = context;
> +	struct i2c_client *i2c = rt5575->i2c;
> +	const struct firmware *firmware;
> +	static const char * const fw_path[] = {
> +		"realtek/rt5575/rt5575_fw2.bin", "realtek/rt5575/rt5575_fw3.bin",
> +		"realtek/rt5575/rt5575_fw4.bin"

Nitpick: newline between fw2 and fw3.

> +	};
> +	static const u32 fw_addr[] = { 0x5f600000, 0x5f7fe000, 0x5f7ff000 };
> +	int i, ret;
> +
> +	regmap_write(rt5575->dsp_regmap, 0xfafafafa, 0x00000004);
> +	regmap_write(rt5575->dsp_regmap, 0x18008064, 0x00000000);
> +	regmap_write(rt5575->dsp_regmap, 0x18008068, 0x0002ffff);

Looks better, thank you for addresing this. The magic numbers are still 
a headache though.

> +
> +	rt5575_spi_burst_write(0x5f400000, fw->data, fw->size);
> +	release_firmware(fw);
> +
> +	for (i = 0; i < ARRAY_SIZE(fw_addr); i++) {
> +		ret = request_firmware(&firmware, fw_path[i], &i2c->dev);
> +		if (ret == 0) {

!ret

> +			rt5575_spi_burst_write(fw_addr[i], firmware->data, firmware->size);
> +			release_firmware(firmware);

And if this fails, should the previous firmware still be there?

> +		}
> +	}
> +
> +	regmap_write(rt5575->dsp_regmap, 0x18000000, 0x00000000);
> +
> +	regmap_update_bits(rt5575->regmap, RT5575_SW_INT, 1, 1);
> +
> +	regmap_read_poll_timeout(rt5575->regmap, RT5575_SW_INT, ret, !ret, 100000, 10000000);
> +
> +	if (ret)
> +		dev_err(&i2c->dev, "Firmware failure\n");

At least dump the 'ret' code.

> +}
> +#endif
> +
> +static const struct snd_kcontrol_new rt5575_snd_controls[] = {
> +	SOC_DOUBLE("Speaker01 Playback Switch", RT5575_SPK01_VOL, 31, 15, 1, 1),
> +	SOC_DOUBLE_TLV("Speaker01 Playback Volume", RT5575_SPK01_VOL, 17, 1, 167, 0, ob_tlv),
> +	SOC_DOUBLE("Speaker23 Playback Switch", RT5575_SPK23_VOL, 31, 15, 1, 1),
> +	SOC_DOUBLE_TLV("Speaker23 Playback Volume", RT5575_SPK23_VOL, 17, 1, 167, 0, ob_tlv),

You and I may understand the Speaker01 and Speaker23 concept, Joe from 
the street may not. Either move to 4channel kcontrol for "Speaker 
Playback Switch" or be more explicit with the naming if said approach is 
not feasible e.g.:

	"Speaker CH-01 Playback Switch"
	"Speaker CH-23 Playback Switch"

> +	SOC_DOUBLE("Mic1 Capture Switch", RT5575_MIC1_VOL, 31, 15, 1, 1),
> +	SOC_DOUBLE_TLV("Mic1 Capture Volume", RT5575_MIC1_VOL, 17, 1, 167, 0, ob_tlv),
> +	SOC_DOUBLE("Mic2 Capture Switch", RT5575_MIC2_VOL, 31, 15, 1, 1),
> +	SOC_DOUBLE_TLV("Mic2 Capture Volume", RT5575_MIC2_VOL, 17, 1, 167, 0, ob_tlv),
> +	SOC_DOUBLE_R("Mix Playback Switch", RT5575_MIXL_VOL, RT5575_MIXR_VOL, 31, 1, 1),
> +	SOC_DOUBLE_R_TLV("Mix Playback Volume", RT5575_MIXL_VOL, RT5575_MIXR_VOL, 1, 127, 0,
> +		ob_tlv),
> +	SOC_DOUBLE("Prompt Playback Switch", RT5575_PROMPT_VOL, 31, 15, 1, 1),
> +	SOC_DOUBLE_TLV("Prompt Playback Volume", RT5575_PROMPT_VOL, 17, 1, 167, 0, ob_tlv),
> +};

