Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43142CB2850
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Dec 2025 10:17:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C8D2601FD;
	Wed, 10 Dec 2025 10:16:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C8D2601FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765358225;
	bh=o7jD3D7RHOiwvzR5ga2aSwtI/yWdRSwQBvm2/8kJGF8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Fy71W+JMOvMYwHlDkSv4P+vYQJU+J+ZfEX/XoMeqiVWwfozBfxGSc9Kmr5DI99gle
	 cLDqis8m0f2ehI1BbGAKycTIi2iqO7WQnYmpLsBiSDleJFMPJ2gHTOmJ08l134UNSj
	 folH+9hXwzDk716W8nGrzjn2nhaPqYTKBcmxkww4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4599EF805CA; Wed, 10 Dec 2025 10:16:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4568BF805D8;
	Wed, 10 Dec 2025 10:16:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E35BF804CF; Wed, 10 Dec 2025 10:15:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 066EEF80095
	for <alsa-devel@alsa-project.org>; Wed, 10 Dec 2025 10:14:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 066EEF80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EAPasviL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765358096; x=1796894096;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=o7jD3D7RHOiwvzR5ga2aSwtI/yWdRSwQBvm2/8kJGF8=;
  b=EAPasviLkt9RPRGX+5sp6N3qHLct8zpTSTRq7q4QLx1epS7fjbyvRD+6
   2gjqHuhFZDlCOr0oguk+yEHW250qdmeo/YJ3MCCB6Tf1owmlcbhigNflE
   OVx6qW0pr/Z9mHgsQRxeqU6DKnH7rqG7cVy2zGNrk2Xgm0t8AzErKU+aW
   cPz0M9Cj5hI7nhKR0knEyvFZF3CU7SSCJ+WgkhYa7dfbCkpUzLAwG4E9n
   Eqq7n4ANh88yFnahBLyNPPrI5M2+THh+XdZRZ5I79kJsq0TAfG1NqlCxp
   ruQ0wxVTSKywDhLAe4tRdF0vHjff7n7U2sx/ZsGrkkQ+Pgl5461G996Vt
   w==;
X-CSE-ConnectionGUID: 1DsCX63hTEeaTPGMtFU+mA==
X-CSE-MsgGUID: q9xkNxfuSEa7HhTSrCVxfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71173340"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800";
   d="scan'208";a="71173340"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 01:14:51 -0800
X-CSE-ConnectionGUID: cAUj5c99QDCOSODS4MZcww==
X-CSE-MsgGUID: 01CHVrv0QQeEO1FSCmV7yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800";
   d="scan'208";a="195532647"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 01:14:50 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 01:14:49 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 01:14:49 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 01:14:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPsju3wWZ49kaT8yjvPD0IgmrtnFIYuEKJanMhv7vGPDFKKdP1Azh4/7UngqtxT9OYJXmYqJRdkhblLQkiHZ0Q2Bh449vzvRzECDHJs0WB2Bq5VgY1y9TOsPaExYX2P9UC1Fd0hvHnhP4UDYwFtw++5cs14W5n7SLbimp+BBbwmPA+XP3230hxfHdlUZDQlhO4KeQpQcjTxqJUzSlQ3p/aUhDBlWUcDC/qqrPrl437NXqm1rIoivqNhcH0Rew5ItCaqtsXZgcbyo7GqG3/c3cqlP0If3bt4gO4sxj6AwjoNzI9GLjZAi4dI1FBCYuwJP8r10f6GwSf7H4LV3rZ+upQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qj3DSRq1x6swrBNw+RCbydCcW62vrESMYPaWeMsC+qs=;
 b=wghtQU7B/88JmbNmrPeZTwiKVKwmxTk9/W2Repta6nJd1Aad4NPAuX4d+xgf4w4WfKL/nPmNvHaJql5egg1yVyO7kqclPd9iBiv3V/HBzw6F/TNmWq4oaJjJ5QrJlsruOoSwdM9TltirMs3LIy2sXcVW3pbB4IYtTjedpbRXbWUUQgFAMqSjDo/069tryz4m+AcJQZgbs5LjsUdhAf40CvrXx3UK+7FO9BX1yTJmnKXcOfBhBUvuK8IOskhLH9WkDjYMZ4GtCaVibURNU/CQ3aQIGCF87EkPQfSgFIa7N0hs4SMngOBPcwjSNcfxO6ugvbdD8YZSLCzXT1w8uiVW1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB8294.namprd11.prod.outlook.com (2603:10b6:a03:478::10)
 by MW4PR11MB7162.namprd11.prod.outlook.com (2603:10b6:303:212::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Wed, 10 Dec
 2025 09:14:46 +0000
Received: from SJ0PR11MB8294.namprd11.prod.outlook.com
 ([fe80::fa7:318:6d3f:3c4f]) by SJ0PR11MB8294.namprd11.prod.outlook.com
 ([fe80::fa7:318:6d3f:3c4f%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 09:14:46 +0000
Message-ID: <2710181f-a58e-4b0c-a7e8-6fbfbbc51ab3@intel.com>
Date: Wed, 10 Dec 2025 10:14:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] ASoC: rt5575: Add the codec driver for the ALC5575
To: Oder Chiou <oder_chiou@realtek.com>
CC: "perex@perex.cz" <perex@perex.cz>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "Flove(HsinFu)" <flove@realtek.com>,
	=?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>, Jack Yu
	<jack.yu@realtek.com>, =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
	<derek.fang@realtek.com>, 'Krzysztof Kozlowski' <krzk@kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
References: <20251201105926.1714341-1-oder_chiou@realtek.com>
 <20251201105926.1714341-2-oder_chiou@realtek.com>
 <6c0639e2-dc59-4e0f-be42-224a98b37f75@kernel.org>
 <2202b463075f4219bffc636fbafb0684@realtek.com>
 <20065270-0d88-4463-9641-f92b4c9e4674@kernel.org>
 <4859e7819e264382be4b3b58cd348aa0@realtek.com>
 <545e2353-c8f3-4e3b-82a6-92970a17b8d7@kernel.org>
 <2630b1f8751b4aa3adc995f7d24144ea@realtek.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <2630b1f8751b4aa3adc995f7d24144ea@realtek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0309.eurprd07.prod.outlook.com
 (2603:10a6:800:130::37) To SJ0PR11MB8294.namprd11.prod.outlook.com
 (2603:10b6:a03:478::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB8294:EE_|MW4PR11MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a597650-4e18-4052-f5be-08de37cc9031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
 =?utf-8?B?S1J2Y1BKR3VYSkkrRmc3NzdTUDlYYVJiNlZxa3JLek55cnB3K2JRTkxtUCsz?=
 =?utf-8?B?ZllUWkloTXJXeWhscWhUMzhYZk13R3plWVA1d1IvVVJJaUV5Q3RpektBbjA0?=
 =?utf-8?B?YjFvNGxJRGhCUXdOUURoOUh0WkpIazB3WkZ1SjQ1bEVmdzZ4SU5LS1lDVklO?=
 =?utf-8?B?TEVsYWtjdVVkVC8yYzQ1L0xPdVp4K1ZZbjRYN3doZHE2UkM2dUh5ZTRiSll5?=
 =?utf-8?B?S2JWMEJIdnh6Z3NRUXBMZ29ic0tlOGJlcGxpUTVGZ3VrM3JHT0QxOEU4dmtl?=
 =?utf-8?B?SS8yZGtSTXBNZ1FxSEJUeHVGUjFLYzRTV2dDM0h3elg4dkxPaUVQalExMWRl?=
 =?utf-8?B?VDRpRE8yWkxaTTZObXNpM0F5NjYwTC9tblpCYTdFVG4xSW9Dc2thTzhiQkhI?=
 =?utf-8?B?VlJ2TmNSeEVQNnl5b2RuL29jSGFrSGpBTUpoRmRpamhpbVBLR1BuN0hCd0tl?=
 =?utf-8?B?ZllrS3dNd3FRMWdiWFlpUUZqc2JjcVNDWTJpTS9IcklkL2dxaFJuMFlZZ1hl?=
 =?utf-8?B?d0dPTDMxTzlnUk5Pc0t3RjM4NG1sOWt0THRqL3FEMCtuZXNTZXZISjVsSmtC?=
 =?utf-8?B?S3pqdmQ2amRxckdKNVJGS3diYjBvUDVleHBON05TVUNieFVDeUVBNEFTOEgx?=
 =?utf-8?B?RnBLWEt4bUJpYXpsRC9pazc1a252elpiSFFSV25SVjlGZnNTQWVJU3FaMm5C?=
 =?utf-8?B?Y1ZqQlVaWndJbytTN1dudnY3NDNISWJJdXV3dVBlcm13dWQ5VzZSR3hmMUdB?=
 =?utf-8?B?WjZ1blJ5NVFnTEFVV2JWYThGWDAxV2RHSzViQVRENlBQazJvZWN6UGdQcC9W?=
 =?utf-8?B?RUFVWVRyaGZhSDBkdUc2dEF4bGpudUxpR1lvTmRFU1R4OGtYU2ZMYlJyRmFP?=
 =?utf-8?B?ck4wQU5TUjVNRUZiWGlvUzV0MGpzTWhBckNEaFArL1dNM1NNZWZISGtPaHBh?=
 =?utf-8?B?K3Jxdm9ubnljVUdYWWVXWURwaG1sYWJ5ZmFWOWRQNTU2NEJEZnd2U3dBUlB3?=
 =?utf-8?B?cEFwZElIU1lqT2ZQQ3Y2TURhb054OGYrYlZWN041eE1lUWhzazhncTlhbERu?=
 =?utf-8?B?TmpPZ2tramNkSGc5WFE2THk5NUJNNEk0ek94STkvZW9hMFM1WERvVGlKNVlm?=
 =?utf-8?B?MDRhNEVBczZYdkJZL0JqTUZFenJNTW9JeEFNTVdzSWdaanJBcFdJVnVBeEZL?=
 =?utf-8?B?WUZCMXVyYTU4citVOThQZ0FpNkRqMkpQdlN5UVFKM2ZmN2M4aTIyMERHMzdM?=
 =?utf-8?B?L05CbDlEUHMyTFFnOTJNN2FLWGJxRXY2YjJseVVZM05BSHBhQmlVd244TWVa?=
 =?utf-8?B?Z1ZKQjQ3alRRcFZOQjdtdnJHcmNIb3BOOE5BVE1hS1hNSzVrKzNQSFJLS2cy?=
 =?utf-8?B?STVQQkVYaTJKQVpKb1F4ZmREbzNwM2NnRlVOSnc5R3kvN2cvTzc5UTJnMmFS?=
 =?utf-8?B?TWVRdzV6NWhKMTdreHBqY0hNTWE1RnM4OGpBYlppV1ViUXMrQ1pWRlVhNG03?=
 =?utf-8?B?UWdLU0RkOTJ5SmkyL2ZFeFBEdGJoUDVjQjJwSzU1TjdDSGFFU0Rxc0krZEph?=
 =?utf-8?B?dXR1M3NBV245V1c5a1plN00wbVFOYTRQK1ZwSWdkb20xa2hGQVFZR1dZV3lu?=
 =?utf-8?B?VWxRZzFGUTQ5SFMyZURKRWd5SU1PVDYzeHhZYk4vSWRMNlMyWmNRcFVNMWNW?=
 =?utf-8?B?NlFaem8rTjM3c2ZYVTlHdTNWYnUvVFE2SW51QlNTOWVPMU1TU3d3cHAwTjZM?=
 =?utf-8?B?NFJ1V0ZOZ2s0UWFNaWtxaGJSUVExRHNMc1I5V3JvVHltSklEc0h6WmU0Y3Q1?=
 =?utf-8?B?dXJCOUUreGRDMjZ0ZUVrMmphamtlWmZ5K1dQa2p6WkJmNHVrUnVCV3NrckZs?=
 =?utf-8?B?eVNvMy93UXk3VmpLcXM4MlpwM2UyRlFaUlMvWW14WHBLTkZXbGs0c202M2RW?=
 =?utf-8?Q?TxzACN3ByIw6KtB63wPgZVNZr8MOKK7m?=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB8294.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?aUZFN09FQ3hwNWVoeWRpRWw5Nkl3Wms3YkFLM2xHSlp4OUJMc2RqZHNLL0pS?=
 =?utf-8?B?LzFpVHBudmZDL2dMU1VtMGVpTm11N0VTdDgzOEhtOXBBTjAzV3NZTUZlTVN0?=
 =?utf-8?B?emJpeUNUTStOQUYya0NqK01ONG9qaGd6OGljNDVFQ2dnUEovTkx2MGtuajZT?=
 =?utf-8?B?UDJHTWx3dm1vVHJmOUpheXpZckk3bDZJUVJkcFRseXBUMVViZTNOcUttWmFw?=
 =?utf-8?B?TEFCT1R0anZ0QUJaMi9wYjMrSit5ZXFSWVFjQ0pNVUx6UElFbkRPSUpodXgw?=
 =?utf-8?B?TXUyUW94ZmZWQnE0RkFxaUs3S0xTTFdVLzVpQ1BUQU15TE40STNhUk9qM3JN?=
 =?utf-8?B?aXV3NDFyWFgzTTBGUTQ2d2p2WTRzVzhGYW5RT2hZKzZXd2h2aExnQ3QveTEv?=
 =?utf-8?B?SisrZ2QrVnFSM0JsUGd0L1pnZ09uWXFpTDY1OTR0ZmJaSUozR0w4ZVdkV1Q4?=
 =?utf-8?B?MW9JcEhyMkRnOE1wSk82V1pFTnM1MmJ4TzFreE1EN1Z5Kzc5Wm55ekdCV0E2?=
 =?utf-8?B?cnJzeVRnWDhhd01kNzh6dEpVNFJsR0QrcTZHY2JCV3l3REZ3YkpqN3dXNEpR?=
 =?utf-8?B?c3RyZUZJelp3c1ZEOTdqTTVnVUdEMklVVUpkOFJXQU9EK040L3hBOXlEWUhi?=
 =?utf-8?B?MDEvK0ZHbE9RUWliQ3lxd1B0Q2JCWFkrZFFPeXpubHQvWU0vV2JXVElRL3FO?=
 =?utf-8?B?ZlUrcTU1T2txY3QxUEx1d3o4U0V4dUlBd1E2emp3dlI4SzVkcy93LzJuN0JC?=
 =?utf-8?B?L1NYMmtnTEtRRGgyZWdVM2wzeGJISVBNU2I3R0Z4R3hhZXVPL0ZocHppL0dP?=
 =?utf-8?B?eDVpeFR4dkhMWG9iaVJwYzFlWmo4VGJvbVg1MTFIaTVuaktlWk95cjYzN1hC?=
 =?utf-8?B?L1crY3JkSzhxckt3bmFxRTlwcmh6cFY3SkcvLzBRbXpXVlpTOHMxNXBySnlt?=
 =?utf-8?B?ZjZ0dHZ4MCtPTEt4cmtWS3dNRnNrQ3NBS0xOd2lLV1lpTjVxY255dWh3UlpH?=
 =?utf-8?B?TjdLUy9QcTE2NGFxdy9pd3hhcHIzSEVSTFMvMUZVczdoNWFiNTJBdWFKTmxO?=
 =?utf-8?B?c3ZvWHl3bkN3VE9QUU04UmZraFRSMVFuSmVZa1JncEo4RTR0aTZFZDRyS2RZ?=
 =?utf-8?B?Ry9mcDZpK29adnBMNXdpSDFrejd1QUxvUjZCeS9hWXk1TkY4OUNnVlZTdFY0?=
 =?utf-8?B?djFxRlN4VUFWTkE0ODEyaFJNcHJxVHg5cDVwZ0t1S0tWWWIrRGpXRVdQTFFz?=
 =?utf-8?B?UC9NZUpER1JFUEREM1V5WFRuYVJNNEhHSHRtRGJ1ajBWNFNqU1d2Kytybm85?=
 =?utf-8?B?QTN1NlcralJFVndyczlVOUtYNC9RZDVSVE1ib2xwMXJPRll0cWJqNVpOM2Fa?=
 =?utf-8?B?a0hWVVdidGw1WGdpYklJaUxVZS9GUTcycTl1TGozZnpMblBsdmhsQ0svUWQy?=
 =?utf-8?B?VTJGZUtzbTFNbDNhTWVUQk5HQVhudzVacWUrSmt3YnJvL2dIbkY3Z1JFYi9v?=
 =?utf-8?B?bEhpMGxheTNPa0tDWlhGWDNlQVMrWFlWenpVMkFmRlVyd200SjhuUFNyWmpz?=
 =?utf-8?B?NHQ5WEh3QS95anhNQ2U0Z0M5TDdKUXRtSUtkOWZEQXpOOXVpaDlxK203VDhE?=
 =?utf-8?B?dTFKWkN5emZTMG1wd1pFcDltM2hFdC9XallzZDg4Sng5Uzd4ZW9IU1lmWldX?=
 =?utf-8?B?YXdZVVYreTdhOFJqUngvQWdUU2N3YUxVSnN5cUJvazJqek53NlcwRVZxZnBS?=
 =?utf-8?B?MTNEbCtDM1hjQnhlSzJ3ZGZPM0xHbWljVXExMWppRVY3WEZ4UXZnK1dsWUd4?=
 =?utf-8?B?TjhhSmRDS25PZXdyTVIvbjdtN2VSOXdLWmpTdzMxdUNoUGFmM21aRnFLOVNp?=
 =?utf-8?B?QWMrK3BaR21xcVdWUmtUTm1haUpzSXVGeGxpT2YrblZOYk84VWhZTUFUdkVt?=
 =?utf-8?B?Kzkzcm9XdjRBdkRZNk51WkhPR05jQlRmS0RBNytmOXN0Y0NIT2RBS2t6enZN?=
 =?utf-8?B?dVBMd1FyRHlaU3BVaElSS2RsQm9uZXVQa0s5T2lydllXK1hROHhTWjBCRDZH?=
 =?utf-8?B?YnA1REFrZ3dLdjlzeHY4Y0thTzdDMUcvbzVoUW1nYjFPZUZFWjJFSmV1UjFD?=
 =?utf-8?B?MElhdXVrMWsrYWVibnZzdDRBZFZnaHduSWd4QUgyTzlpekp2c0FXa3o3Rzdq?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4a597650-4e18-4052-f5be-08de37cc9031
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB8294.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 09:14:46.8021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fXWbmEDiK5DNuy1rZyhUTaeXu5CAiJ58oNEWqVUguOuheI92FzkrU089DhjJB0tsjbk9z9qZs6E4AB2JZr5WDuUGrEKoI8EDsLC/tDdgks0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7162
X-OriginatorOrg: intel.com
Message-ID-Hash: H5SOHBILU3LXZHMMZAZG4XOQB43TSY4K
X-Message-ID-Hash: H5SOHBILU3LXZHMMZAZG4XOQB43TSY4K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H5SOHBILU3LXZHMMZAZG4XOQB43TSY4K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2025-12-10 6:26 AM, Oder Chiou wrote:
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Tuesday, December 9, 2025 2:08 PM
>> To: Oder Chiou <oder_chiou@realtek.com>; cezary.rojewski@intel.com;
>> broonie@kernel.org; lgirdwood@gmail.com; robh@kernel.org;
>> krzk+dt@kernel.org; conor+dt@kernel.org
>> Cc: perex@perex.cz; linux-sound@vger.kernel.org; devicetree@vger.kernel.org;
>> alsa-devel@alsa-project.org; Flove(HsinFu) <flove@realtek.com>; Shuming [范
>> 書銘] <shumingf@realtek.com>; Jack Yu <jack.yu@realtek.com>; Derek [方德
>> 義] <derek.fang@realtek.com>
>> Subject: Re: [PATCH v8 1/2] ASoC: rt5575: Add the codec driver for the
>> ALC5575

...

>> Ah, so for that reason you created that singleton, exported it and you
>> wait for it? Singletons are pretty no-go anyway, how do you handle to
>> codecs in the system? Fragile design.
> 
> The code will be implemented in the top of the i2c_probe() as following.
> 
> if (dev_type == RT5575_WITHOUT_FLASH) {
> 	if (IS_ENABLED(CONFIG_SND_SOC_RT5575_SPI)) {
> 		if (!rt5575_spi) {
> 			dev_err(dev, "Wait SPI driver ready\n");
> 			return -EPROBE_DEFER;
> 		}
> 	} else {
> 		dev_err(dev, "This dev type should enable CONFIG_SND_SOC_RT5575_SPI\n");
> 		return -ENODEV;
> 	}
> }

The idea is to get rid of 'rt5575_spi' global. Removing 
'rt5575_spi_ready' was just one of the steps to improve the flow. 
Removal of 'rt5575_spi' is the next one.
