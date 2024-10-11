Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C615999EA9
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2024 10:01:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACF05868;
	Fri, 11 Oct 2024 10:01:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACF05868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728633681;
	bh=6RGojeqQe2VRlH0qgWViVH3YpqWM+D/puigWbnutVds=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=UoB9QC4Q/y4vC2gt+t22yAniVH7g4kQfnZyJkN/t73xcWu0+E30uYHo/F1tMbbeHX
	 O0wX8du9ic9R5UWLal+wx74EVxhD3M7RPf+d5X4GdTWEDF1w4u2SJ2KrrmH7HWT1Nb
	 Y1B8KYDfRmPPreiiyc8XvrO5x5xpu75eIlp5A0vo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A299F805B2; Fri, 11 Oct 2024 10:00:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57102F805AA;
	Fri, 11 Oct 2024 10:00:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0884F80528; Fri, 11 Oct 2024 10:00:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2613::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3716F8001E
	for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2024 10:00:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3716F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=mPKBLWe/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJkNxa5TGSAV1Lk8ZwR3n8uMFGrZhyKYia0uY78uI3PbOcErpR2oP3dzxpFSBSorKbBxSLpDi6vbUI+RVgcpWSaViCL7dWRlvqGoX5a5TjkrIDk4U6aWWdRKzMwrY9nl/ja5GeFTR+A7vA9ECbidUZIFq9Fp5xpIJIY32uBliO1awxBp269ZfJysYxAUM8vdOTmQNxB1iN4RKILxySDaf4rcmZDQKbM2JV5XzO5K3MqefA0VfxrHPvigeAaYIm+nhyUtheBx5TmVk8mQwygdlRV+jVfHHX9NwBtm/M1RAiEoA04Hw7B7yag7nKR2Q6ujUq+U+Wf5wy8pDbrQifa1ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGdGZXhiw8hHKRFGjER0MxAs7u/WmLTZtqTLAtllPRg=;
 b=Z+tCltKJW++tmD+GwXecMyPbYRQkmVpb9T7ZiOV7z2ytk2VmjrTU87dL1feHPv9euR34dFUIreztH4CR82jtee3qjEoVeZoUc/qNZeMqYNBEwd4pmLv14SJBdSk3ayJWf27goNqnLxD1B0J2vSithij1+z1FTATzDypMBBhylSRqBLHIIHl8cFbH+jF1iwdWf+qxPZoUskmgV0Zc5ttRdCS2WHiZm5iHDb2rM5EEvyOsYVOFrqL2eHE48BYlyUXMQrvtHaqegGHuSiW46Mi184uUgbWYfpo+0LGlIqFDzVnnD31DGuHzUVFJFJ0KOiRl+pu5sX/pfDIhaekIdJN30Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGdGZXhiw8hHKRFGjER0MxAs7u/WmLTZtqTLAtllPRg=;
 b=mPKBLWe/RZ0GT7D0xmGf/CR7QBFxVEGZ5n19dSzfD+ajmCoWUmY/yCHa/RnoTp+vKR6jQCdsaY+NxVUHJLsTIHtQ7A2mhxhjp96lcsVA+yT89fGawyrzHe+DrvmyxpdnXPJZXiv5T6JGYV8biipdt++ryoCW9d4q4fQve9vzaSy0vm23Ui0uqYVzNTkocKaZ6TsOKITbzynRKJ+Dw3sWi39sBu81yw5JmZC3SAuWPFVOq1WSl6OIcopUhnUuiGxcb1hSTTVYBPnzKkZpiOwBAiAK16OSSaio7BWnpzBi5cFxf6hqzQOsrSG2InHfyvT1YJisMoVAjlZFSIZbnRTG7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DB9PR04MB8252.eurprd04.prod.outlook.com (2603:10a6:10:24d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 08:00:38 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%5]) with mapi id 15.20.8026.020; Fri, 11 Oct 2024
 08:00:37 +0000
Message-ID: <9c590d45-ba6e-48dc-aa32-e70029885867@nxp.com>
Date: Fri, 11 Oct 2024 11:00:34 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: fsl_esai: change dev_warn to dev_dbg in irq handler
To: Shengjiu Wang <shengjiu.wang@nxp.com>, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1728622433-2873-1-git-send-email-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <1728622433-2873-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::17) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|DB9PR04MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: aa81792f-cf7f-452b-8db9-08dce9cacaa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ak1Zc1JxWER2ekJRVFJNaDJ1bEltOEM2TzArYUttbjlTVjdiLysvTkFrVGlw?=
 =?utf-8?B?SCtZeE96R05ZVTh0b1JYZ0F4OGE0T0xreXJQY2pPbHZYUk02VU1aQ0VtZEt1?=
 =?utf-8?B?WGlOMldsMVZjVFhhdXBsWm1rMkFyMTJJZmdJOHdKNXpwTmtOSzA4WDRHeG5x?=
 =?utf-8?B?TUJWbTBUSmZGVm1OdnZodlI5ZEIzNzZ0WXpoczRIaFVTaDdiS3ozODJqS1Qy?=
 =?utf-8?B?SFJRblRQMkJZRW8wRlB6amZBTmdQbzcvU1F0bGN6SGVnZ3B6d1YrR3p5YTcz?=
 =?utf-8?B?UkkrNUNDUUlzTEI0RnZZSDZUdzVHVU03cTU0eUI0bzFYYkc3ZW9lMFI5cFVi?=
 =?utf-8?B?RkxQbldMTjdzckozaDdRUVN4M1l4VUV6Y2xPNjAvNGFONWxwMGY2dUU4Q3Rr?=
 =?utf-8?B?aVBHTlJzTHd6aXZxMnRCNzRiMytnakRPOEc3SjhoKzcrdWxkSkU1WWszdXBz?=
 =?utf-8?B?K2NHOXBrTDd4L0xwWGE5YWdHODd3S0dUYURZS3BFQUJyeTUva1ZLdTc3VVR2?=
 =?utf-8?B?WWRpQXMvdk9pR1NCeFF1TTJOcjU2OU8wTXkrc0p5b1FwZDVTNUozOVNXTlpQ?=
 =?utf-8?B?dEs4WEIzUjZEU21YM0J0dE1RaTIvSkJNQTU4Nk4xcFlsUGV6ekNUb1NUQ2lJ?=
 =?utf-8?B?RUhvbWFOTWtqMk13TnRLQkdxUFRzQUF5YWxObkltVUtyd0t0WVZBd2NYNytx?=
 =?utf-8?B?d29nRXhTeGtHaGd5dm9xWFRDNWNnOCsyakJoL1dVUHJsSVplajVENVc1aUVo?=
 =?utf-8?B?bGtwZWdtTW1JcnBJNit2c1RkR3FpcmI5eGtlMWU1MHhxL0o0ZE8vdklxNU5R?=
 =?utf-8?B?c2g0TEpvN29PK0pEaGZGSHhUZU9IVGU0UldWaVRpR2NlTjR3UFZkdnFOdVVV?=
 =?utf-8?B?RXpMdHpRb3RpUzIycVZueC9lM3NURFV2ZVhGcUdrR2NXS3RNdU80V3dQZXJi?=
 =?utf-8?B?QTJxaE41Qy82bC9EakRVNURuVENLcVdIN2RERFprdGVTZTh5Y0txZmNsWUxa?=
 =?utf-8?B?U2tYcWU1YldxZFZJTTJYNlRiMk9zMlVtQ3NRU2lxS0R4Yys1emlJZDh2WVF4?=
 =?utf-8?B?L2ViUGlsMTBkT1R4bkU2cG1ySHJOYlo5SXRQYm9BUVFLRDBYWThrbzVEZkFx?=
 =?utf-8?B?N1BnV1M5eDFCcG5WWU15cDRSeE9UQW4vWjV6Y3V4N3RaQ3NLWmNXQ1pBcy9t?=
 =?utf-8?B?OFdxcnA2aFlWSkNMNGczK0NCbFI5SEhLUTBYUlQzL1RpdUlRNkp4Q2FnUTh5?=
 =?utf-8?B?SHpXMS9yNmdEYkIrRFNTdlBmNDFEVXYvczZvM2dOQk1ZNWs0RG44eWlNOFh6?=
 =?utf-8?B?K0ZzQUEwYXNaZGZzdzFYQy9LT2Z4TFl0S0RVZEpvMzU0WHEzRVN5bUQzNnB0?=
 =?utf-8?B?blI1OWxOUmVrVVhyeVp1T3VSMldnVHVZdU1pUElEV1V2cDlYQ1laVnV1ejAx?=
 =?utf-8?B?cWZDNnBWQUZpYWYrUFpJY3pDek9zWFZ4eWN6VGM1WVV2MEd5aWVQMUVZSitE?=
 =?utf-8?B?eWJOcllUMmwyalAyMU1mQktWU1BaU1FiaEF3RlNxOWJMMTVwMjR4a24wMk9D?=
 =?utf-8?B?anE1b0JvM0F4cjJnMlI4SE52bFowS1VrVGkrVUxnSnJvUXZscFNIUlBFUVVs?=
 =?utf-8?B?NkplT0k2Z2FnaldYZE5KS0ZhYUljQU1uMmYrN21DNnlTWGF3S1JWYmRIZkR2?=
 =?utf-8?B?TnFjbWQ0MDJXL2oyb2FwYS9hVENFTEdKT1kxSnJMZG5LUE0rOWtwdTV4SFI1?=
 =?utf-8?Q?s015l95n6zVQvQRD7xWJkU2rVFopP4C/BJPobA5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RUZNbjF2WWM5ZElpOEw4Qm10L1VISFlUVnVQa1RlOUhuMUVUM3ptZjlDTlA0?=
 =?utf-8?B?clpZSC9LMXNKZEJGeVJXN2pDbk01emRrQVJYR1g5YlA3b3Q5dE5YQWw4SGxv?=
 =?utf-8?B?L1ZLQzFrNlNJa2pSTUNKQUp4bFBzK0pjYjhRK0FJTmVFc2kwb3BIb01rMXUx?=
 =?utf-8?B?RndYVWttK2cvQUozczRETVZwRmJNSVdyMkdRMzhLeG0zdXpoTjF5c0x2UjlT?=
 =?utf-8?B?L3kxbnFkNVNXQkhYUzRYOWZ6MVpJSVYwUnVLYy95dmRScStJUys0Vk54bWZz?=
 =?utf-8?B?cHRlRE10N252VzMzTXkrcXRFWk50SXZhdERmZk1tRWtYeXBSNFhhb0VPQ2g5?=
 =?utf-8?B?L1Vicm05MUNOTjhDb3YycVhJLzlEZklyVDhJWk5KL2ExK055OERvNzhpM2xi?=
 =?utf-8?B?MDFwYnYrK2thSEVhcEMrSVVzY3dYN2NaOWhKQWhsMTdIbmxPU3ZKZlNrWStP?=
 =?utf-8?B?TndXVDNjMEdqODFyU0JPbUlGeGw4V2lVS1RleE9WQjNwTHlVV1B0VGlrVlhn?=
 =?utf-8?B?dUduM1E1Uzl6MnZWSnd6dEZxbURvLzZmdVF4RzZyUjRIODBpNm4zc1lraG5o?=
 =?utf-8?B?SFB5U2dwTzdNYjZSc3hUMnRyQ3dVVGdIOVl6UHUwZkE2MHlha1dNZTQybDU1?=
 =?utf-8?B?K2pXTE5kMlE5NnB0UEcyb09ZQWtyK2kwUVNRVnJ0eVVLNnYrTW9GblN6VmFs?=
 =?utf-8?B?Nm5kb1QyWFZBTE9TWkNXQkFoQ1JwSmNGYmsvcldRb1Nlb1JSM1RLVWgrMWJ6?=
 =?utf-8?B?VnJXWXVvTHhDQWV5dXRIcyt5b1Z2a0RBWU5udkN5WFRBV20zQlFpeW5NNnlP?=
 =?utf-8?B?K01wN0NEajBlenpPZWIxeXV0NG1pckN0YjNucStHd2pYdm1LUFVTU2p5UXhW?=
 =?utf-8?B?R2ZqYjBBOWNYWnRPT1JEWVdzMk9xWTFUMlRIUk9HMUtHdnMwMFJuNnlLMzUx?=
 =?utf-8?B?a2NRRUwzZExmRFBuVy9icjhPRlNmRldnV3ZkME5lbElqVEJCWGFVSExCQTRq?=
 =?utf-8?B?QXVlZEsvTkdnOUNrbnNGYzdzZjFuRVB4cmlka2I3QlUzUWplamswQ3ZVU0tm?=
 =?utf-8?B?MjBBUVFuTk5lMUdTRmZoUW9IdWtyTVZRNzF4TkRHbGRsTzZ0TzNWZ1loNHla?=
 =?utf-8?B?SDIwNnRmU3ZNV3dHaGtFb1JnY0grUmJKTHV1d2dRV09FRTF2RlEwVDU5cFcx?=
 =?utf-8?B?ZFZOZk4wL25ZY1FBMXlFOFdOd2RqZUJYMnFxVHh4NkFicGJLTnp0Q3BMYVFL?=
 =?utf-8?B?aUkwa2ZiYkNnSHBxNERmS0RzMXFXelpYUGpJb2xFVHFKbWtLR0NoMTBGM1Vn?=
 =?utf-8?B?TjVPczVIWmozNlZKb1lYRE5wSnZFR1FUcHVmV3pJS1VtbEsyT2RQY2JzRnAy?=
 =?utf-8?B?dG90NHh4b0ZzR3ppRHR4ejNrZmpVYjBGNUFxNkYrSDdhWVZPWDB3N3RDanhG?=
 =?utf-8?B?cUJhekNqbXpmdXdjUFRoUHdnT0dLdzBpNkFMb25MSHFmRmxaWFJLdlpmUkoz?=
 =?utf-8?B?RHFSSDd2SnFCMDZTb3ZsdW1ZaXRFamZlNjVaNTlHUUZQVDgrOTQyZ3lXRit0?=
 =?utf-8?B?N3Z3Uk8wVm50MUl4RGxMZTRsMGFxQmt5MkxvZXE0ditqbys4THhLL0d5Z2VW?=
 =?utf-8?B?bFo3eHRyYjlFcWNFTWd5aysxUkF0RzlObWlrQWNtQy9na1pZV2w3VW1ubEpN?=
 =?utf-8?B?MFo4bGltQ3FBRVo3dUlkZHpMcUNRRTQ1Vmp2a0V3RzJWVEp3Y2hHUFFscGZw?=
 =?utf-8?B?ZHFJbFVzYmxVMWp1TkR4c2plRGluQnVLUWxhVENYQnQvdzJ0SG9jOEw1dFVZ?=
 =?utf-8?B?cXpYcnloc213OW15dFlUMEwzdVRFMWJVVisvNGxFUXpRTWF6NW1pb1k1bXlE?=
 =?utf-8?B?SjJQbk92c3k2Y2hWSkQ2KzdYNEJkQUVxRGRmZmFDYW1NRWI4V0QvQTJXTWRo?=
 =?utf-8?B?VndIWDdKeTZsQ1hDeTVRRjJjcWk3eGdWdmlOOTRDNDQyZDVsVzNpZzkxZDNo?=
 =?utf-8?B?ZVdHUEcwUlBDOW9VNThVYXlNRGgzUjN5NnluZkgrYzNWVmRlZVN4d2V2NDNK?=
 =?utf-8?B?Rm0ySlZWRmRBNXdyWDJ2QXFMNUJlRHE3K1UvL3B6aTdTQTIveDJPazM0TUxw?=
 =?utf-8?Q?8ViunmMU4O/GUakEXpeJJok38?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aa81792f-cf7f-452b-8db9-08dce9cacaa2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 08:00:37.7957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 I7tQaywfsLVS9Z5yx541OpRbt9Qj2vpX+/K7Vwd0SdPAxwVeipE1xht6GJgdRBDGKafUMSBFHIENPMVhA9B7hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8252
Message-ID-Hash: 4ISPAHROOSIIYMTBQYFDM5RVJJ5X2R5G
X-Message-ID-Hash: 4ISPAHROOSIIYMTBQYFDM5RVJJ5X2R5G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ISPAHROOSIIYMTBQYFDM5RVJJ5X2R5G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/11/2024 7:53 AM, Shengjiu Wang wrote:
> Irq handler need to be executed as fast as possible, so
> the log in irq handler is better to use dev_dbg which needs
> to be enabled when debugging.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Thanks,
Iulia
> ---
>   sound/soc/fsl/fsl_esai.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
> index a65f5b9935a2..0b247f16a163 100644
> --- a/sound/soc/fsl/fsl_esai.c
> +++ b/sound/soc/fsl/fsl_esai.c
> @@ -119,10 +119,10 @@ static irqreturn_t esai_isr(int irq, void *devid)
>   		dev_dbg(&pdev->dev, "isr: Transmission Initialized\n");
>   
>   	if (esr & ESAI_ESR_RFF_MASK)
> -		dev_warn(&pdev->dev, "isr: Receiving overrun\n");
> +		dev_dbg(&pdev->dev, "isr: Receiving overrun\n");
>   
>   	if (esr & ESAI_ESR_TFE_MASK)
> -		dev_warn(&pdev->dev, "isr: Transmission underrun\n");
> +		dev_dbg(&pdev->dev, "isr: Transmission underrun\n");
>   
>   	if (esr & ESAI_ESR_TLS_MASK)
>   		dev_dbg(&pdev->dev, "isr: Just transmitted the last slot\n");
