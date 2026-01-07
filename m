Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 994E9CFCB8E
	for <lists+alsa-devel@lfdr.de>; Wed, 07 Jan 2026 10:05:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80CA060184;
	Wed,  7 Jan 2026 10:05:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80CA060184
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1767776756;
	bh=Q+XG0VExhjZWeyGKV3WSLQcrWD5wUzvRNtTEkITYgjE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vWbePxJ0hcBxdyYS7bi4zDkmfFUL/pH80aiFzL/i7wxJSz6nATpRH8t7n33ZdLRv8
	 kXtPpb9UAt5nlUvfaCUS/t07Mf5yECY57WsC7GmhYA0bA9Iw2hr72SniACuKY6sQqz
	 MwWuxUtjTEB8mL7A+UESPs+VvT4N7itf9uFZuRZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 936B3F805E4; Wed,  7 Jan 2026 10:05:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B90B4F805D9;
	Wed,  7 Jan 2026 10:05:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24B80F80448; Wed,  7 Jan 2026 10:04:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D097DF80254
	for <alsa-devel@alsa-project.org>; Wed,  7 Jan 2026 10:04:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D097DF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fM9YOYBO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767776664; x=1799312664;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Q+XG0VExhjZWeyGKV3WSLQcrWD5wUzvRNtTEkITYgjE=;
  b=fM9YOYBOnxo5YAdR/qFk5O3G6h4vrBdX6uaLJl9OKPVl9wj5YGdNqDyz
   4KsH+uWyUlkJeC86w6MYq52lgATfOfZ2QLYylBw32LYqcVS2tyGRTOCen
   R5vTZpEwJZpcv2JGXO6TzoZXsO1XRAgmsyxEbKtoCQ4kIHX03eMIWEbZi
   6IGFiEiq1gmjp5bzgqqJYi/u1wiN/lS0F1bCs0dzzjtwupiTQX+vmwE2K
   T6LiofweygyCJzb2eE0xtqUz5CaIeYXJI9WZ7jIzDKAcJyYn79olWiF9E
   KXAfDqxnEe4StKPeSikNS1x4QVacw4uETykrExFVlLkpTv0EulunAisgB
   Q==;
X-CSE-ConnectionGUID: Q1uyHRiJTZ+SlvLCmSBGvw==
X-CSE-MsgGUID: lUeiaFckRk+GCEXV9xGSvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="79775932"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800";
   d="scan'208";a="79775932"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 01:04:19 -0800
X-CSE-ConnectionGUID: 6mqqnsIWSj6xp3Psc4XIxA==
X-CSE-MsgGUID: uB/Xvz19Qsy+OrScvQ4Zfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800";
   d="scan'208";a="203319351"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 01:04:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 01:04:18 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 01:04:18 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 01:04:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kD+CREp4UHgwBgpALc/V/Qp7L9VHXQfR6vgrf3rt2/k7wXuOFLE0xrM9mehuc9F20jP39yu8eUDU2rgmN5/oJ1bza+SzcXZcqXnRKoBCbwRYxxMmSexcVfRKq2iW4NbKUAEe3TxBDH+m+ZoectW/8QlpX4Q774+TNJQ32s32f/9ojEyUpjxUNZlhWhfmY92fHPciXIEd1MmpvGKXkbYw31eGWzkYG7PhLiK28rOaVcAnyG3vf+vXXnhP9OW/Rd9+AE3YemVNlK5FFh/EYAdLlLJL1xeBjb9U0MFiydkX2g5IXXoGZTevrctyI5waI2q8xrjfCATbqfxlK4Z218+Vzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXDUXJA1dB85aOpKykxml3ys9kDlDEvyhAkCct2bdnQ=;
 b=UO443iLie7LTmUXAluurmSfeli4acPs5R8nELkStyCUf9gpSb/28AEa5TjoSeqh9wlVc4I77EOOOwW9kKkUiXhavz8PZqGtFEElEj5MYN66jLfN97tXarzRzUj4n6mm0617dHGygSOZgQBuxF84+wD8KEtrjNLYkapT3LST3VC5uCP1uWReYXORVgY+XT+6twllUjmHB8VHfftqzaYyyzIMSGXGZGWYGu51pwij5Izz9xFoN9Lo9gzBO4wfmv9Symvqia+Ogge0IBkja4rL9nQsh5csVc5acjXUckDVKkWQfdTWJCJ8pjMsXWDb5vOq5HKqtz6g/NcIVSRke04OElg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8283.namprd11.prod.outlook.com (2603:10b6:806:26c::16)
 by SJ2PR11MB8586.namprd11.prod.outlook.com (2603:10b6:a03:56e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:04:16 +0000
Received: from SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214]) by SN7PR11MB8283.namprd11.prod.outlook.com
 ([fe80::d18f:6b38:584a:214%4]) with mapi id 15.20.9478.004; Wed, 7 Jan 2026
 09:04:15 +0000
Message-ID: <5afcc981-4cdc-4040-bc30-e91e8a4c5993@intel.com>
Date: Wed, 7 Jan 2026 10:04:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/4] ASoC: rt5575: Add the codec driver for the
 ALC5575
To: Mark Brown <broonie@kernel.org>
CC: <linux-spi@vger.kernel.org>, <perex@perex.cz>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <flove@realtek.com>, <shumingf@realtek.com>,
	<jack.yu@realtek.com>, <derek.fang@realtek.com>, <lgirdwood@gmail.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>, Oder Chiou
	<oder_chiou@realtek.com>
References: <cover.1767148150.git.oder_chiou@realtek.com>
 <176772855067.328192.13240221041944953554.b4-ty@kernel.org>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <176772855067.328192.13240221041944953554.b4-ty@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0136.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::34) To SN7PR11MB8283.namprd11.prod.outlook.com
 (2603:10b6:806:26c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8283:EE_|SJ2PR11MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: f7482048-7e27-427e-1bb9-08de4dcbbbb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
 =?utf-8?B?ekpzejBLUVVkbzlxUDIxNzJVOGx0ek9FeHdLZTFVdVpsRi9mMWdYMnRBS1Fj?=
 =?utf-8?B?bkdISjArbWkyWWJGNjdsMWx6SWlKRmhST1BtQ2xrVzRjKy9USTdyeHExZUlU?=
 =?utf-8?B?d1o0VCs3eWJYODRrZDVGOCtSUE1STk1ocTBPL3MwS2JFU25oN1RHRnFjRkc1?=
 =?utf-8?B?enU1OWV4RXFkazFoSURzdmxEV2dZM2FVYTJUQ2ozUXJQdVJTVnZiWnNtQ2ta?=
 =?utf-8?B?cHh1TnBpY2RiMU5SMWphamNGY0xrc2kzanJrOG91cVVGeE1OK0JlSkpUZU04?=
 =?utf-8?B?YlEwL1FZVWo2ZDY2b0txMXh2d213WlJ4WFl3ZVhia1k0cUZkOEk0bDdnZm1w?=
 =?utf-8?B?dEpoLzR2WVhZN1p6YkIzSXg1TVpFdjhJTmM0aWhKM2F6Z09DcHlySFQ2c0Jv?=
 =?utf-8?B?OEFXUXlBT2NYOWFIU2U0UTNzdW1KRXhIVDdKWjF2TnM5aHFvM2QzcDJiaXhq?=
 =?utf-8?B?TzdKRkw3ek5QZHlYaU8rbkhicUtyVC9vc3o1M1NVRjZueXpFV3NTK3o3OHJH?=
 =?utf-8?B?RHV5RkdOSXJPQTFaeTd4TkJsTktqdTBmaERRREQ3Vkk5MGNldExidlFFNXBi?=
 =?utf-8?B?SFNmeUhnMlU5NHJ2WG9Vd2VlbEc1bWFwTE16TVVaaXhkdzBIdjhrTGdEZ0lv?=
 =?utf-8?B?Q2hlZUQwYXJQaXV1V2drT0ZSRzl3Uk5SS0N5RW91NkVRdWxsNklqRHgzdm9q?=
 =?utf-8?B?WndwZTQ2Q0J0UkNsR3VyNjM5NTJnQTMybWJIMmhVTGk4ZmJmTk14V3lGR0Vs?=
 =?utf-8?B?Y0w0OERNMUtIc0l4aTFjUWo2SjcvUXlJS2hrL3cyMStVakVqOC9xVjd1Snkx?=
 =?utf-8?B?bDBsVnRNeTdGQkZ6RWYvMmRKT2xLY29FK1hDVlZKVjlCelg0NnJuVnRLQjEr?=
 =?utf-8?B?YVlFVjZmVVl3NVhDNVc0Mjc0VFdyUWFISlhUYStMWlMxUnFPZi9DSXFic2hF?=
 =?utf-8?B?ZGl3MUxLYmkrSERiZDlvK2M5N1dFdnpXZnF1NlVFa1JOd0gxcHlmbm5zTm13?=
 =?utf-8?B?TGRTYWtkRXJlbXJ0cE95SFkwR2FTZzh4MDQ4VHIwRTlUUzFPWW9UM3NFemFC?=
 =?utf-8?B?SXpuT2dMN3F6TFo5enhEMGpneFV6ak9vQ2l0TFdkVUtHMjh6eWVWYkt0Y0RX?=
 =?utf-8?B?VjVud1gwU01WeElmcFpEdElVcHdURDFPT2MwNkJkOVo1blRCR0JadTRaOXhn?=
 =?utf-8?B?OU9VM05YQWp2ZmZvTVJaaTR6T3RmRHNaUW9mVWYzVENSaTZYUmxCdUU2TW5V?=
 =?utf-8?B?NDl3cWRiUUVqM2ZkMHRNTjZhcFdUdW0yUWdnelIybVZjcXZpV3lWdS9QOU9Y?=
 =?utf-8?B?SDJ3WUg1M2lSVXFaeWpNZGVwbXBkT3lKWThzamlQNytxZjJ3ckFhTmlDaUNB?=
 =?utf-8?B?R1pSeGZxWFdTNzFlY05oaGlEYTdUNXpRaUFIbDZaUDNzZyswZ2phZWV3cFV5?=
 =?utf-8?B?YUlZL3d4MzZPZytObExhNm53S0x0YWZ4S1Q1QmdoZThnV0lJMDJsMlNUNHBK?=
 =?utf-8?B?RHRqajBTaGdSeWx1U2lJMmdmZHBTQmVsY3hqaGFsMWo2RUxoOSs0dzZ5RktP?=
 =?utf-8?B?QzNXU3Vob0o0dzAyUnNlU3hGdXpNWFFzcWZKN0k5RjdVZEZvbGl6NlBxSzcv?=
 =?utf-8?B?TkdIT21ZMHVsd2NaYy9hdmY3NkV2TThmTE5MRmxuOTVpd2RNNThUNTJFb3Bj?=
 =?utf-8?B?MkFrcDF3Z3RCTE1CdlhHMXdVWThpSHBUb29ydHgwYTNnT0VJT2NqT1lzSmF6?=
 =?utf-8?B?YUdNUTFiSzl3ZUd2Ni9sSitrcTZ6RitySWlXWis4K3pPKzg1VHpkU3Fsckdu?=
 =?utf-8?B?eU1lS2pPZmgvOEVXSkJaaGJHcXRjVVcxbEtQT3lhSUk2ZDhaTWZVWmY2UGhD?=
 =?utf-8?B?RHF4ZGttS0l2RnpJMHhYK3E1WEZrQm1lNVFUcm9HYXBONVlyOGpxVlpEbVM1?=
 =?utf-8?B?SGRsUGpQU1VIZDlPakdNb3d2MkRLU24xN09XWE1KOWp4Nmpvb1lqYzBxdEVN?=
 =?utf-8?B?dW5mcHlLb1RnPT0=?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8283.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?K3ZsMmcrNjFINk9aMkhHU2NWdTVHN1cyQUJmNWFtTC81RzhCSDd1MnZPSmRV?=
 =?utf-8?B?azdjRVZoK0RsRWhWOFNjdHE4M01taTZTcDF3dWRlaS90aGY3SVpQa1k0K09K?=
 =?utf-8?B?Zy93VmtRNWJzcVFFbGhSNFVTbmd5UjJLTjZyYnllL3N0d3p6c1JkOUhBTHl6?=
 =?utf-8?B?RnRTTHJTcHl1UlZqMzVJbkREUnJZdmdYWmcwTmdTd1dmYU9pL3RmRlowME9z?=
 =?utf-8?B?OVhzQ0VQUEd4Y3NsRzFFYlc5TlFYSW05bHZHZkFtK241SlpxVDlnaXJnK0Rp?=
 =?utf-8?B?VzRGTkVKVzBsV2gvTGovaDVhTzdFazdOUURKUSsxUHQrYWxpM3gxYTVrckRv?=
 =?utf-8?B?V3JTSHZDby9jMGRPWkdFdmFONVk2QVRPYU9lK0xXT0JreEdINnZ4eXNPM29S?=
 =?utf-8?B?VGpwQU9rTENHa1dxbklhWUs4Mmp3MnpzVWd3RGpwM2VCcGMwU2daN2Y1K1lo?=
 =?utf-8?B?OEZvVWpOSnFOY2Rqbk5aeURrSmlzRVNtTlhVbEEyMHNncnRsRitIaGd1czY3?=
 =?utf-8?B?NC9LRGZqdFo5VHJJSG5NUG52dHJOb1grallsT2toWERYdUdKQ1hiY2srWFo3?=
 =?utf-8?B?bnNxSDErYVB1anhHUUV0Sy9tSURZSlJBSXpncjZaMXl6eU9HY3dIMkRxekNp?=
 =?utf-8?B?blBWMFlUSklOK2ZqeGlhbjlIOUxXUW0vV2VtWUlBVXFFSEJHOWk5a3RjQ004?=
 =?utf-8?B?M25LdUNLN1ZjQW5mY0UrSSsrY3lybUY4QkdIR2gzUEJYVDhOV0YvZktZcm00?=
 =?utf-8?B?dlRYajRVZjB6K1htcjR6RkgvU1ZPZGJHeDRtdUFPU2ppVTE0T1lKZHFvSXh3?=
 =?utf-8?B?VDVJOUFLRmZBQWgra3AybkRBMXJBcTdoSlRGRm5PRGQ3ZElSK3pSRGdTMEp6?=
 =?utf-8?B?SmlYLzlJR1BPOWl1ZE5sZGF3TUlUL00vR2JHQjQ1QVJvSEplbG9vL3pXWHRh?=
 =?utf-8?B?SnBnVmtjb3NxTUVBL2NTOHgzVDRoU3U3WXBYR25tZzN6U0hlenZZVlFXSWVa?=
 =?utf-8?B?UmxrSXhqMS96SzhYZnlBQytkYTlxQnF0dFdOcmJCWDlNNWdjOXFxdEh4aEJj?=
 =?utf-8?B?UDhYak5pK2Z5cXZBMVpTbXV4RXpBejZnUk5jWFRPNTV1UXBncmVLZFJ0Q0dU?=
 =?utf-8?B?cXBnMVo4Uk9kVnBMN2wzWGpZUm12ZUxIVTJsY3RZZ3IyeEtYUjVNNjlkL0ZM?=
 =?utf-8?B?aFhHbzVJZGwwSVoxZlJGY1ZOMXJkNFJMOWp3aDlDYUNvTmtoMzVLUUtoWFlh?=
 =?utf-8?B?ZVkxaCtoeE5oa0dHb0NxQnVyQU9SVElOQVowNmxSYlNjUVVMNGxJbVpqeW4r?=
 =?utf-8?B?eHI3QUd6VVl0UU40ajJNcnNrK3NicXR0blpMZVZ0RklOcE0zOWtmUXhYaUsv?=
 =?utf-8?B?V2p0NFpub3NlSjl2d0FCeEE2Y1E5Z2VFSEFNM3M1WHRFQ0lZcm1yTjZHQ0E2?=
 =?utf-8?B?eTdDMXNmRWRvKzdjdEhNNkNORFVrdU5VY3RraDF1bEY0b1U5R1kwQ0FmRG1v?=
 =?utf-8?B?MENLU0tPblhsZElRTC9HZVlaeUEzRENjVmk1SzN5Q2Y3cDBEaXU1L2xLbkNl?=
 =?utf-8?B?d0d3YkFJbHdoMzlUa2k3S3FYSWZmREtyUHZxbUVTQlJKNkNaa3V2QW5aaE1a?=
 =?utf-8?B?QmhuVldKSEFUeWpCbnB1YTJHTUJjRXdoZUlIb3pCbGdOU3FqcjU1VTBoYyt4?=
 =?utf-8?B?aUlNNm54VGh1em5iQ3FvanpOcUovTlAvcVVNdUpDMUpvMVJmeFZya2pZT21F?=
 =?utf-8?B?SThPMFgvM3N0Q1JveDcxbDJQTUdVZU9yb0xuQUtzYlVrM1hqUkVBZnAwbGtO?=
 =?utf-8?B?UTFsOEg5bHJpSFVYdjd6RlZlK3U0clI1bmVkSEhyT2NpY0dBYTVsWG1Wd0Q4?=
 =?utf-8?B?ajQ1ajkvcStXdnVTdjVSaWlXODQ0bFlvMEdEbDRhZy9GWE5rNlRaSlROeFVl?=
 =?utf-8?B?MDMyUWxXbXJLY0g3b0dqa2o2L0JHdWNjT2p0SkNkQUw1SzZtSHhCY2Z1NFZJ?=
 =?utf-8?B?Q0VoZGcwTmhWK1FiSGM1Rjd1TjJPVUlITzVvd0hXVDFBOHg2KysvR250N05m?=
 =?utf-8?B?T0t2TG9nUkJkYThYRWQySUNUZ2xnNm9qU2lYV3B5NEJWWFQvNWQ5MjhmalQ2?=
 =?utf-8?B?a0dGUmhKY093eW5VeGVINnZSOFlvbnlPcnF1WDEvSjZ4bjgrMGJURzJKaExF?=
 =?utf-8?B?U2xoNE4vR2ozZ1JlQ2Vmck5ucGNVVE1BQlVGaXdRblRuck5tMmw1U015RXR5?=
 =?utf-8?B?UUxNbGlwOTRHYVFjcFBmRWVMUlN0a0UrZFFaK2ZmVW45TGdMaEkzTUl1cGJy?=
 =?utf-8?B?eVVieEZRTUt5Z1NseHhTazMvYmxKblJQMlNZaHhJQXQ2TUlHdjdORHI2Tm91?=
 =?utf-8?Q?9gd4nFNvF6Q6T07E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f7482048-7e27-427e-1bb9-08de4dcbbbb3
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8283.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:04:15.8241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CBdUhPqC5/W+pf/+lWzyUPw70fDVYq3AErRLDTGYUzGjBo3Dopbc5SkPweRYXbpXiu80MMBJ59CY+gjrWH1p6t3oXBe9m1VMW6W+L9CS/ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8586
X-OriginatorOrg: intel.com
Message-ID-Hash: I2UMTT4MOSUHZP22HY6BVAOUWSAP4NAS
X-Message-ID-Hash: I2UMTT4MOSUHZP22HY6BVAOUWSAP4NAS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I2UMTT4MOSUHZP22HY6BVAOUWSAP4NAS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2026-01-06 8:42 PM, Mark Brown wrote:
> On Wed, 31 Dec 2025 10:35:01 +0800, Oder Chiou wrote:
>> This patch series adds support for the Realtek ALC5575 audio codec.
>>
>> Changes in v11:
>> - Patch 1/4:
>>    - minor fixes
>> - Patch 2/4:
>>    - change of_find_spi_controller_by_node() gating to CONFIG_OF
>> - Patch 3/4:
>>    - nothing
>> - Patch 4/4:
>>    - achieve reverse-christmas-tree notation
>>    - remove formal version check
>>    - revise check whether the firmware boots from SPI or not
>>    - minor fixes
>>
>> [...]
> 
> Applied to
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

...

> [4/4] ASoC: rt5575: Add the codec driver for the ALC5575
>        commit: c7ac7499ac5bb50ab3e00add121822c5c904bc91
Due to Christmas break I wasn't able to continue the review during that 
time, back at work today :)  To be honest, I believe there are still 
some comments (not related to nitpicks) left uncovered.  However, the 
code in v11 (more like v12) is still a large improvement when compared 
to v1. For that reason, if it is still feasible you can add my tag:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
