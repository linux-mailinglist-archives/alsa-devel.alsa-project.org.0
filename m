Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA6893EF6A
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 10:07:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C87AAE8;
	Mon, 29 Jul 2024 10:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C87AAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722240467;
	bh=+xIO1STgO8UeCpWHaMoYV8fRUjDpdfyDezyapChiZ7I=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jjg2V9Alxsy5CIph7oO75h7hHoZDx8OLzwGgzpnnFoLYCX8/P5kXXrpFJu4AI1wyb
	 E7lJImaBSvCVTr/9YgtkW7xHcGrGCfQU2ETctbGwkTq3o3ckWfhW6/UxYqvS7MQmsT
	 OFHGZFkOyDw+orwW0ED1rixjQipAE+4oocI32OXs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72F2BF805A1; Mon, 29 Jul 2024 10:07:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D09E8F805AC;
	Mon, 29 Jul 2024 10:07:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43ED0F802DB; Mon, 29 Jul 2024 10:02:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
	T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7FD5F8007E
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 10:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7FD5F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=aRqftNqa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pibjsYGz5j/ox0XDrd3muwKMbmZl5OT7uJyDFEO03S4KCz0fM3P3HkZxc7Fx+ulmk4qC1MdU9QNq3UpSDDRYJIt4NYKKfxDFTCY92hsnw1Oz8xCZ9dgwVGUpEVjguaNAVDnSNWGylLiXmYbdVeb55eKvTcU2bR5fCkwZEbtr9n1kzzkwD9Z1vmWwwQ0MG4y2dezbSRXCV8FBCSp1OeJlFLFXwmYs78kO2cTb4St66FlrU7PWMXDGFiJr1kNjirhZj3XVjtlIH1QANrezCLHEnS68A+UuJYjWAPDLk37qvR6IqWg12FKvO9+Z0DsxoA5ii+5OgO5ynXMrqfe8PVGYzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9EgHBcpcFqXEuY9dzz2aBw2CV1Il8GXCbDP6TmCKLM=;
 b=RhAw2Oe/UX7EJLEOWNwI0lKN2bqki2IClEQT4mk1F5z/PNpHPVl1+Dyy2Kz/5kdHnj+d3rbfsz5rZRmpCXJYENB9aMlnkXblL700YcvtVvjhlgsHUOrZbBP2mKrCyL4V2I70h04YB4Q0+D6ejd+4gleE4fahsTXxH3xaoQzCukZskkIWXE2zpKV2gL1DAVRusgb2vdAC2xxmWWcFlHtM0P7MvEtWLiFeTZl0eLnAy68TLTLka1ymdUyKAV0WfV8SXr5KZg4Pg8rHOqi/tRXQRiMId0s6055iNBv+Osfo2gs7XvG2V90M1cCDp8i9XCS/pfrpkxXiyx7h7tUjhpt3BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9EgHBcpcFqXEuY9dzz2aBw2CV1Il8GXCbDP6TmCKLM=;
 b=aRqftNqaC/3nUfG2xes+CtDhaJvjjyShHraNH8CDcUtigmEmLqTYX/ofm9izn2S6cnGE5YvYwOkQWtZyMU2rXNtThwglabGS63xtHCbkeyR4i/GdgSF8AqVBG++ZEcbiEgvdYYFHIPv6WewgTwo+srhSRnz6P87wz3Fad/04MiqW2FL8dvz387RCEHNr5TY/zfkF9BmeCaMETD6hMLk80vS7JSFr0lD3vIy/0uVzmhrzbOJXtYZ+kpPDvIlQ9H59fztAn/loIZiPyy+ijqInDpT/+xRVr521RFm5OqNdAZbxU5OE66dl+V/0jUlFWhzDIUu7EB6uashDUvgZGlDgEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by VI0PR04MB10758.eurprd04.prod.outlook.com (2603:10a6:800:25c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Mon, 29 Jul
 2024 08:02:07 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%3]) with mapi id 15.20.7784.020; Mon, 29 Jul 2024
 08:02:07 +0000
Message-ID: <d3a4654c-7d20-4a21-8fff-fb5dc0076547@nxp.com>
Date: Mon, 29 Jul 2024 11:02:04 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: fsl_micfil: Check the difference for i.MX8 and
 i.MX9
To: Shengjiu Wang <shengjiu.wang@nxp.com>, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1721897694-6088-1-git-send-email-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <1721897694-6088-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR03CA0030.eurprd03.prod.outlook.com
 (2603:10a6:208:14::43) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|VI0PR04MB10758:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c828c9-6a0b-4068-c546-08dcafa4bdc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OHZCRU5yNjhHNExuZmJOVFJiR2N6OTh5cklESFRkRXVkYkpMbzhoa0hORDRP?=
 =?utf-8?B?MGhQemQyUGtIZTJ2NFNGNjg1aUZ0dkhHbFlNUkRLQ3RKUG8zVW81RUY3Y293?=
 =?utf-8?B?U0FmV1UzUHR1OFlJaDcwaGJoYWhCTk83aGREdmdaVFZvVG1Sb2tmckY4WXd1?=
 =?utf-8?B?OFN0eVJpYmQybHBSTk81dGZtZ0dIdnh0TzFXRXd6SVY2VlRsdjZuWFFDK1BF?=
 =?utf-8?B?VlRzY3JVdlZQaEFzZldFdlF2Z21IVjFKQkh3a1NoVjJhc0ZHYWRsaXdBcnRX?=
 =?utf-8?B?MzdJcUlBQjVlYS9tSkV0MTZ4Y25LM3dNTGViTVlJeUtqazhXYTRhM1FqUzAv?=
 =?utf-8?B?Q2xodk90R0p1aGlBa21KRWJUZld5RHF6QlZLREEvendsSlFuenFhUW9WbytM?=
 =?utf-8?B?V1FlSFBUM1FVR1JoTVVtYVJTVHZNVnRiUDB4b01jTXdpSTJpdSt4WDJKOGJw?=
 =?utf-8?B?cG5aZ3IzTDg5UkptUFV2TThOSmNHRTA4aGpwYWtqZjlKczdEUXRLZExsTUdW?=
 =?utf-8?B?cWdjdExsMysrOWtPYm9kQjZBbXpZWWw4Y29tSEIvVytSRWhCOFJJS1FBdFFz?=
 =?utf-8?B?YUQwVEhGMFRVUHdxVnBFSlpqeEhsT1JsOURjTnFveFdoSW9YOVZUMjhySmhw?=
 =?utf-8?B?YUZ6L0lqVkk5eXdPbkM4MFA1YURHQzVTaU05OGRCZjIycFM1MUxvaWlBMytq?=
 =?utf-8?B?SHl6R2srWWxleEpnNVIrcTZaRVpxNjRjL01tL1ltRVp6cW9oajFqWUgxRXE4?=
 =?utf-8?B?WGVVNVZzT3UzcGJzUTVZZlNaWVkwa3VMVGxaVlZaL2ZpcDUyMnI5WFdPZ0dR?=
 =?utf-8?B?dmxNOFc1WUNCSzFKMVFSbDZYNk5lcnJRbUVJbyt0dkpmU3N3SGZEN0JORGpn?=
 =?utf-8?B?ck1OV1B4TWJVNWU3RGpJc0Vvanhld2VVTkRQNVc4Q0NCbVdzcVViYW91SFhu?=
 =?utf-8?B?NFkwNnQwaXRreFJQUzZNbHZrREJNOGtkVnY1czl2UGRFQ3ZOczV2ajIyc2hm?=
 =?utf-8?B?NUt2b2NYWHFEbUlDSUlSN3VaeWI3TGp2ek5JYnByOVhuUG5qY0VIWHg5NTNS?=
 =?utf-8?B?aVRTV2xwLzVFOEtYa1FJckdFdUlCODYrVGxBQ0xDNkdMOFR5NGpZaDNUVHRK?=
 =?utf-8?B?THhYUkpMZjlZQ2d6dHJWckxuV2Jsb0lnQS9XY1ZWMTNWY0J2enhqZ1hOT29n?=
 =?utf-8?B?bllhNDdOYzJZcWdWZGpFWDJVZWl1RmVRdFloaFMzR083RnBvQ2VMYlgxOEd3?=
 =?utf-8?B?SkhkcG9sbXNXUzY4eHFZTUNMMWxpSmdjdjhpL1QrdHdScUMzS3VvMWo0b1BJ?=
 =?utf-8?B?TG5DdVhUUzVHaW9CcHJ0TEl0eTkrR3FvTlRsN0dySHlOWndZTEN4SENOazZy?=
 =?utf-8?B?a0lUTmEwMXEvcnYvZlRlblBjVnFtZURNOUc2Vk0ybTVXOWdqRndsenBtMS92?=
 =?utf-8?B?TVkwRlRFNHIvUmlQWGQvSnpUekdib3ZjdjNHeDhsM1QwcFhhSVZzTkoxSEV2?=
 =?utf-8?B?WCtZTndNY3FyV3U0VWtWSHdFblZtZjVJZXdZQS9maWZ3SklvcjNlNFh0aUlY?=
 =?utf-8?B?TEljOHNYL09SZDdyZjFPUEExckIyL0lKVVg4UldzUjEvTE5RZHFPV2VyeW5L?=
 =?utf-8?B?OFRTa0E5cTlUS1prR0hTTVhoZW5TZkZhak9GQmF1SGxJZWxuMVFnSGhsMmRN?=
 =?utf-8?B?SXhmejREU2lVVERMWEJ4c0d3Nm9CMklxTkVMWDdRSy9jT3RJU2o5bWJSMlNQ?=
 =?utf-8?B?enVDRElMTUdPWUFJSkMzVWlMM0VUckdTR1hzeEdZRjZCQ2toOUl6dVZndkpN?=
 =?utf-8?B?VjdJbDBSeHRFc29RTVM3cGVxUHdYd2x2cEVSaU9MaEFqK0xhOGdhWG1YQ2di?=
 =?utf-8?Q?vNb6W767F0asT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YTlvZ0JXMzlBQXBaZ3BTYWJaUnJ4OG8rL2pOZVVxYnJGdEkxMlFwd0E2eDUz?=
 =?utf-8?B?aHdCQ2V2eC9vT2R1czBiRVhRTDVPUnBqRlRFazZ0cGU5ME94Zit1c0I3TjZn?=
 =?utf-8?B?aitRd3lIeUdlSHVJelNrN1RKa2RKallCWm95T3FObXV2LzJmWFJKeTJ6WjlJ?=
 =?utf-8?B?aUljaXVtQUxRcUpuS05TTFgzVGxSV091cW1MQmVOVTdud3hQZ2VFWk00MUY4?=
 =?utf-8?B?Q1prYjZXZUU4OWtFU2RFR1picTNZRkM5YU1Gc2dkSXZYUU1xRXE2UFJleXNo?=
 =?utf-8?B?VFZnZ2thMEJyQlAzUURGV25rYmUyaTVSS2NmcS9BL1FhLzNNVjF1ck8wTzBS?=
 =?utf-8?B?YnRUWWhyN1BKT0tvZGhlUm1YS1RVaCtncGtUOWpNWnlxQ3JvakZXZVMrckJn?=
 =?utf-8?B?SlY0TUJtaEY4eUVLQXZ0ZXFaU1N2cEprV3M0V3R0MnRJdmVBT2ZtUkhmWlZ5?=
 =?utf-8?B?cW8yL3F4YUhEcUVrWGM3cjhwTnBGSzRWaDlIeFIzaHNoaE1yMExpYkFxMnda?=
 =?utf-8?B?T0hvWFV5cWpBOUtaZCtWbE95NzVQem8wOGpacWRncGdTL3NURyt0a1Zadkl5?=
 =?utf-8?B?NDJGcFduNjZWYkY3S1cxSFloN2JIN2VoYXp6ZmM1bTYwNytQKzdrdndCZ2Zr?=
 =?utf-8?B?OUtpTkhXUkhYbVIzMjNjMUIzRjJ4Mjg3SHFhQnJFWmx4MG1jdXh1bkF4N3A3?=
 =?utf-8?B?L2Q5SUJTNDBlVG5aNEZtbVFOSjNUY0Q3SmxXTjI4UEpEQmhuOGxRQVVLKzdj?=
 =?utf-8?B?VGViaXREMm9GV25FM0pEZWIrdzJBWXArV0pZZ0R0WTRDeXhHVFNNVmhJb0VF?=
 =?utf-8?B?Y3VIREtOWUpKalZHaWZxMDh6bzU0SWVyK3h4M29rajZGdkZMd1FZMVVseGlI?=
 =?utf-8?B?WjZOVldnYmVaNDJ2eUR4U0xLb2NockVuOGtYelRkSDR1U3NEU09KMjlqbFBY?=
 =?utf-8?B?eEpVYi9FZHdqeVBLSU1vZFZZRHRMRHlXTmtUNDRSQWtTWHpSRDNuckZrS1FP?=
 =?utf-8?B?M1dQUGRteHE5TzBUWS9Ud0tBa3RCNzR3dkE1SmR2akJyaFVzS2cyZHlZS3Q3?=
 =?utf-8?B?YmlUaTBvQmlKOFBGNm5WM2FPazE4Q1NnS0haVTVYVGtvQ0NrOHhOK3lBQVVq?=
 =?utf-8?B?elRrdjNiVFpQN1F4M2hQeTJTekNIY1VQQXhpWml0OWtOYWowa1V1Z05DSlZw?=
 =?utf-8?B?cFBxU0MzWXhwWXArSExOd0dnNytJWlFXUkhoL0J0SE5WdVRObnhlTXJMUHRh?=
 =?utf-8?B?emlHM3JnU2ZteXdZMjVRaG9aNHVPNmhieUV5eHQ2a3g5c0tQWHlpM0Njbmdm?=
 =?utf-8?B?L29YTGJBNE5oVk5KU0ZXTmk4UHRLRXJRZ0hJYUZvZEJmdHR5UzdtSFFsYmNo?=
 =?utf-8?B?S2ZON1hqL1BwSjY1a1J0T3c1SDJ0MzQ4RkdzSlo3enBDVmVtN1NDc0lXdDlJ?=
 =?utf-8?B?djZFeGRtc0NqZEFmS0pVUWhiMVRGK2FUS0k2dlI2eEtwMnoxL2tFYnFLT05l?=
 =?utf-8?B?eWY2elE5RHdqZmlOYkpERjZTWVJOWUN0U0tLaVFmU1ptSVU4N1ZsQ2c5aVVa?=
 =?utf-8?B?WXk3TzlOZGVFTHlCdXo0VU1Rc084VHJyYUlKUUYxeXhqSmxGNVZNZVJGb3FB?=
 =?utf-8?B?Uk00NVFEUFhEWWRXQmtVWEFlTC9qYUxBRjYyUHVxTG84Wklxei9jMFNUZTRC?=
 =?utf-8?B?OE51eUNIZVB2N0hZM2ZickxKWUtXVTFnQk16QXlrVGJKR3dWdzlXazd3S0dq?=
 =?utf-8?B?NENsaGhwOGd0TDlneWlJRHg4WXBYSUUvSnloT0pUd041dGMvK1NiUHJYMWsv?=
 =?utf-8?B?SVZVYmhxMjZIZTFCNXNOVGRIZTVIUXBjbURBVmM4Z0kzTGhFRTBqbEk4VXAz?=
 =?utf-8?B?SERPSExBL2E2NTg0NC9BVE1ieHdEOHEzN3NhbFdCTUc1UU9pM2pFZE9MSGJs?=
 =?utf-8?B?RUMrV2Fid1lJb3VCUGlVUFJoTy9jNjlTM1lpM3k4ZUVKNC9EcVg5UTRCUUpl?=
 =?utf-8?B?ZWdza2JuRXVudUpnZUpZdVdRSUcxMlRMWG1RWlE3SVVxZUxuMlo4ZndiWlBh?=
 =?utf-8?B?VU4rcDYrNEkxZ2ZYV0xpY2x4dkR2UDBqSHVXenNRU1hVK2VCNkF4WXpvaGxX?=
 =?utf-8?Q?BHBfpGGiMYipq2z2X2Vw3Rfm5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 40c828c9-6a0b-4068-c546-08dcafa4bdc2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 08:02:07.4716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fxjEnJqMhK2Hj4gySkxRy2dHTD1mhbG2vTKyHb/dAXw0mazwZERO8kGINWcB0+mGBH2780KAelTHhik7bk/IPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10758
Message-ID-Hash: 2ZAYLGKT4RSJZDUGE3CU6BG5IMUKDLLX
X-Message-ID-Hash: 2ZAYLGKT4RSJZDUGE3CU6BG5IMUKDLLX
X-MailFrom: iuliana.prodan@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ZAYLGKT4RSJZDUGE3CU6BG5IMUKDLLX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/25/2024 11:54 AM, Shengjiu Wang wrote:
> There are some register difference for i.MX8 and i.MX9
> REG_MICFIL_FIFO_CTRL definition is updated.
> REG_MICFIL_FSYNC_CTRL, REG_MICFIL_VERID, REG_MICFIL_PARAM are added from
> i.MX9
>
> Shengjiu Wang (2):
>    ASoC: fsl_micfil: Expand the range of FIFO watermark mask
>    ASoC: fsl_micfil: Differentiate register access permission for
>      platforms
>
>   sound/soc/fsl/fsl_micfil.c | 20 +++++++++++++++-----
>   sound/soc/fsl/fsl_micfil.h |  2 +-
>   2 files changed, 16 insertions(+), 6 deletions(-)

For the series: Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Thanks, Iulia

