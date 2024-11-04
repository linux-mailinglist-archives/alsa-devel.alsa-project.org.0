Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 864F19BB793
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2024 15:23:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC2BCAE8;
	Mon,  4 Nov 2024 15:23:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC2BCAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730730197;
	bh=ZeSoW3eZ0X98VzGzRHvjCEFIl+piNjbcaEW8MZ9Jhu4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tyx5G82F8bvP7byWywD7VqtYGw6BfA29dkqru6LtH1pHDw128udbwze3ux2/sjlj8
	 NtxTMs+V1/1hHOUVESnmvtiu4ph9DEiyhPHUYzECJ37ed/RG6+tu5XgZOCk8S99iwj
	 W6NVc0DM9wZ7UmoqMN00xgQAP2G1av8G2dScyMi0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDBE6F805BB; Mon,  4 Nov 2024 15:22:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D61BDF80104;
	Mon,  4 Nov 2024 15:22:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E91EF8026A; Mon,  4 Nov 2024 15:22:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::60b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF55FF80104
	for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2024 15:22:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF55FF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=R+zw+RK7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAd6DimT1zBEkrhzdJKiwM+sMl2kntnmXMjN+lssd0hoCHSYSsBxl2Vc8AOm3jPFUbaFU7CjydJo2VbTMxSJuQTQuFzzor3lMKjUdRE30HWpzUEzeWocEK6fBE4YSCnDhxSus/xwReHkCBht/de8WcpgYTtusbtf3qU+FmPw7LDa9fyhS+TJBXVP3nxWkvrjm2451uTyQvZBII04zoaTeu1+owWn5VVsp04b1+ULfUvBUsPpvlKhLrfi5yGl92pMeaXq2lfob0+ARuiuFB6UJZB+/zbhZNJ+veE2EaHEH+9WPYPxer7Jw4PKGR5Or5jkj2GX8TkuHAA0BwfSLoKFQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kBZ/g1FWJm7IpzzwhzUYr4OSVAxSMYdcH/RPgLHT3s=;
 b=DRqXpz/LQcUAzg+OjQxhht1mOHflaHIAZet3HhFe2B4ffGOFX4y1vQ3Xa5RLUMQpreVJ8jw4LdTMo1EUZ2tw961yiw+H9lC3cP9XoOffqY6xqsmvrFjDLEEDdglmpIIB2AtpooekxthJiJhv6Cz2eV8+syUEWXr6a1BdvygQuUxiLX9yIoRUG3iZftp3iYS8renZDgty958nNLlsHE7yQP6Ywde/E++jaj4Xifg6/BPrEZCIuohs2ru8WAnRXKJMAoGEqx1HW6pEuEGwv3M5iNv2UJ9erbiLF1OON0eSoufy77yCyMRkg906xd07wWEP+6fptO+rF0can9TJv/8+ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kBZ/g1FWJm7IpzzwhzUYr4OSVAxSMYdcH/RPgLHT3s=;
 b=R+zw+RK7YgGPxJaH4/roKEc88gfg1ySFX0boe69oC/hJMunxhgHSnXFpGRA05PMcHWbIwB3W5koNJOZLA7AzFpC57+TpHUFYdU5fmsN0xWkKqaUzXO5UanXhSrTJgo/z8ArU3hrszVJQpOZcD5Qd67r8T4ksohRoAvRLmE90jUs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB6483.namprd12.prod.outlook.com (2603:10b6:208:3a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 14:22:31 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 14:22:31 +0000
Message-ID: <36b9646b-8c70-4c7e-8398-ba22331e0004@amd.com>
Date: Mon, 4 Nov 2024 08:22:28 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: acp: Fix for ACP SOF dmic tplg component load
 failure
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20241104091312.1108299-1-venkataprasad.potturu@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241104091312.1108299-1-venkataprasad.potturu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR12CA0019.namprd12.prod.outlook.com
 (2603:10b6:806:6f::24) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: 90d15357-5022-49dc-bed8-08dcfcdc1e6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TGxFNU9CM1k2a2VFYVRjdm9acnRDK0N5Wkl3eDZsYjJPZzBNM3VrV2lZZzl4?=
 =?utf-8?B?dmpxOENVdTZsUzJEcE41QysvN2N3SFBaQ2xsNmpUVHQ4YmVoZTV6QlhwbHRE?=
 =?utf-8?B?ckxMZ3ZXZFg5VzBPL1kzVGRQSENOZFRGdjJtdkhpbWJUS3lQTlRkWkZ6cFNy?=
 =?utf-8?B?NHJrNGgra25DVXZnVk1TSHdjRmhvajYzY3NhRFJyajF3V0d1dDh5ODNSdUxv?=
 =?utf-8?B?QzA2MitCTXdCbjhUUC9tSEhRNDJuZHFoMUY2VUgybnZFa3FGbkhIUHJleURB?=
 =?utf-8?B?S2M1eSs5bFVld3kxb2l0WUZYVzRteGN5R2htRDdnVk1nRzJYYy94cWlCZkxB?=
 =?utf-8?B?RVJSU2Y5Z1VqczQrS2ZUOS9DS2pqaVBPdDg5d3ZVN2x0SlJlT2xHZTV5WnpE?=
 =?utf-8?B?SlZ3WWY4c3liNjkzTksxdktZbk1QMUtpUllranNYalFmeGF1Q3ZXRE5lUklM?=
 =?utf-8?B?eEUxaHVyOWRJa3BvblIyUitpZ29WU25HYW5aSHpiT3paRzJhWmxPckhpelBw?=
 =?utf-8?B?azRORFc1WjJvWXNTeFRFTUd3M0VkQm9tOGw2Q0R6MzQycDVRZTREaXNBWUw1?=
 =?utf-8?B?Q1l6dTN3L0I1Q01Sc08yemNjeFdod29UZ1dXMTc1N21sRE90VE1iNWRRWXR3?=
 =?utf-8?B?WmdHR1hLNXozYTZqVjFaZmYzeWNTZFV2OFppeUVzczRPcXlSdlRqUDJmUzkw?=
 =?utf-8?B?VDZNRGNMZzl5cmNaa3Zic0RZNFhqMmVscFQ0dnRVTmlXNStLVGlYYnd4SHdy?=
 =?utf-8?B?NDFHdkhlemU5bU01bHZrdEhpWHcwT3F3RSsybitkbG9qUVJYL1VnNjBVejdz?=
 =?utf-8?B?VkVESGg3eUxJYjN2OTNjY2xyUWtjcUNDNjFwcjlHTFBwdFhkSW9hcUpVUXlU?=
 =?utf-8?B?d2l5aHlsSDhwOG9JOFpCSU9VZENrL21JUUZDQ3UrZTRRV0labVBnZklVd2dQ?=
 =?utf-8?B?TmVzVXFJRjkyLzRYVGtpc0VBVHdocmc2dm9TSzRxdll0NU10K3hMd0FqZG91?=
 =?utf-8?B?OENQYTVzVTh2d2ZsK095eFpQc0JhUlhtWHhQZHVLNnpmL2sveCtXZ3QzWUxo?=
 =?utf-8?B?TUJhTStlVTZFTW9saVlRU3lHSTg3a1R6RzNIS2dHY20wL2VmSU9KT2J6c2N4?=
 =?utf-8?B?ak5qOGpEWlVNL05QanhFK1E1WDZvVFh5RFN1SkdYLzdQcWhWQjZLRWwvekUy?=
 =?utf-8?B?OGtOOXFSS1U1cllxbkRMSGxhUElRaDNnTWRxUjUyckZ3cFhiZG1VOTJoN0ND?=
 =?utf-8?B?QkV5NEthYVpIUTJDRnc3WTgzNmtsL1VNdW9lNUlNZy9UWWtNZWhoSUR6bnBz?=
 =?utf-8?B?WU4waXQ2dUd1Ny84N2dPNnJVTVh2ZG05a1ZCejdnWGZTcEJLd1R6YWJ3K29i?=
 =?utf-8?B?RkJnRGFQT21sZU4yVG9haW1QU01wNjVpVEZrZUlZWU14amZCdG1rUmtYR0Ju?=
 =?utf-8?B?eXh3OUNibHJES0NJckNMcWllYU9BaWVEQm95UWkzRDRsbTBmOWZpSkcrbTBF?=
 =?utf-8?B?aHlqYjFFQ3oyNDZ2MmFHWU4vRXFrOG43ZFRvYktYbXkwcVJvQVBxNkR1eTl6?=
 =?utf-8?B?QTl2anZ5RlkrMHNRVWlvcEc1Y1grc2VoaU85RzFtdFFhSEh5R3B0YjlBWkFL?=
 =?utf-8?B?U2N3WHB3MVR4TEF0ZS92N0x4Ni9NcTVnbDE0cDEzM0xoZGFjcXduajMvVlhy?=
 =?utf-8?B?SGx2ZEhod0prY0ZDS1BCV0lYYktCMUFRTmJiYThLM3dEeEgvdzI5UHhpWlhz?=
 =?utf-8?Q?ySDGGm8SVzeYTMQxJy+cO8NY0ZlOVHi8p46d+DW?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bzI1eWlMRC83Z0w1NThyME1ScGdqd0FQRDIwNW5BN2ZidGZPb2ovOUhMcklW?=
 =?utf-8?B?aU9iT2JRMVNLaGRlNzNubFVwQkdWc3ZOYmZtQTR5R0RaRGR1NzhsZG91Q01n?=
 =?utf-8?B?QzQ1NTFNT3g4LytsZm1aZmtTS0F5em9XYmY5SHROcnJuTHo0SEJNdXgyWFVO?=
 =?utf-8?B?MHJQZHVyQmJyMUNPR29SSkwvTVRBTUFXRkM1MlhJREpQL3JVMGorSnRBWCt2?=
 =?utf-8?B?N3dhZllEMmw1SXZuOTFtdmVKRy84YStIa213OVVXRlBlL3Q5R2M3QWVudENu?=
 =?utf-8?B?UHhGQzE3VVkrT1MwWnpNckRYOGswc2JDTDB3RGJKdm42QUQ5UUszZUtDdmRZ?=
 =?utf-8?B?R3BydDNzVnRvUUowRVJIczZLVlhuV1UzWktaS3ExTDYxYUJlLzM5ciswL1pW?=
 =?utf-8?B?Zjh4TENVZXFvVWZUNmhuenFIa2x5N1JRVC9sbVJ0TXVLNk5XS1NwNkUxTFhm?=
 =?utf-8?B?akpzcy9LN29yaENxR01YMisyVDlxWGFoQkd0ZGlrMGNtd0NhQ0o0Z2c2MXVD?=
 =?utf-8?B?RERlOU9uakNaVHpjM29SVitSRWhoam1ERWJEc2MxSkROL3UvblNuOVBDSDE4?=
 =?utf-8?B?a2ZhdHpmR1dUdzNCS3NuRENkcDFhc0h0NGR5bzl4WVh3VmllMWxWaGRsbkFT?=
 =?utf-8?B?YlNJeVJ2d3dGcnU2UDVJUEhDTFRHdmY0b0h2V1JWK2txcjB6K28zcVJKN0tV?=
 =?utf-8?B?dEIwYnVJc1dFYXJ5WitWYnZYdzZWTnI5MDlWSS80bmJZL21BZVZQWXowV2I0?=
 =?utf-8?B?NzcrNy9aYjVPeHBTWEhmcnBTQUs3Z1UyVlpkdjNGY1MxS1NWTUVhVG1OUHZ4?=
 =?utf-8?B?alZxRFhxM0xWVVZieDVpUjkxd25Oc0x3V1I3bGdCbHFkU3hPVkN1WnNFN2Vi?=
 =?utf-8?B?QWhiWVFYUDBEL2wzYWZYM2pTNndwdEpBckdweHJlNjJCYUEzRlVjMGp3TWdv?=
 =?utf-8?B?MjJTVDRyRlBycUp4dDFhK1E2a3RGKzVBL3ozSWdYZDhvSzlWaS9CbXdFUEEv?=
 =?utf-8?B?SVYrVy91VG1mMDc4aGJlWXYwYS83eUJneWxMa2VJMm90QitmeVhTbEFlTHpG?=
 =?utf-8?B?R1U1QXhTVkQ0OFovOFphKzJPZklrQ1ZtOXlJTEtCcFQvRnFTSm9Fbkt4UUhw?=
 =?utf-8?B?UC9vQ2djZDE3Mk04Nkt2L09kaFk1bjMveWJKQ1pGTzcvbmZsZFZRKy9ERXZE?=
 =?utf-8?B?NzZ4c3dYVXJoUWo2T3RteVNnK3NqQzZtdmdhWi9XU0RWZGVpRmJTRHllNGtH?=
 =?utf-8?B?eThWRW1DVFIxMkVCdjJDckNjbFVIbmVpSVlWajlKcmZEbFJmVXdqL1poaHRQ?=
 =?utf-8?B?OU9reFhVc3BiTG9vMUZkSGNsRm9hZDZkVms0cGdMYk9BN0Uwb2x4MlVzQ3ho?=
 =?utf-8?B?V0JxY25jakI3YzdMejZGR1dWa2FTZTJua3Z0MVRyaEYyVDE2dENYZkttTjAx?=
 =?utf-8?B?cksvZGZZUTlJdnE0REhwaFZMd2U5cDZzRTh2WkVOMGxPc3JxTEZRQ09rWkVr?=
 =?utf-8?B?Q2QvdFp4M3JqZXg1RTl0TzRqYnRGS1g3bWFDYjJHVkI1NDJmM2FmRVZWdjdG?=
 =?utf-8?B?L1lNekhwdXl5ZVZhdzRHbjdBbmI1Z1c0Sm9aR2orYm5Obi9WY1Y2Sm1NZ3Nh?=
 =?utf-8?B?TEJESEZUQTkrcXB2aUhtM2lhOEU5SmYrR1h0NFVhSmFvcVlMUXZHdXdPR0w2?=
 =?utf-8?B?UEIvRmhRajFUNkZHSFdIY3RkODNUZ01YdC9NbElOTXZBQ09XSml1bGVWZlp3?=
 =?utf-8?B?YTJMNEJ0NFNzUDU5ZmhsbGI2V0hlM2d6bGZINkd3OHpyUVA4MzBIaFJMUEdF?=
 =?utf-8?B?VDM5aVFoUEs3aXZvbEt3K2tmR3NiVlJVTFZWU0tibm5HTC85ZytjZ0p4dDZn?=
 =?utf-8?B?Z1ROSE1KV1NNdUIrWkJ0QTZNUjR3bjhxais0QUJNcGhwWjlteHJKMERKSGdn?=
 =?utf-8?B?TVpDT2pYVjdNVzlQeUlPMFdsejI0Y2xCUUpTNDZNRGVHZGNMVVVCRlRVcElF?=
 =?utf-8?B?ak95QVJhbXpPWkgrb0UzcGRublBnekplTjhjNTk2MjR1bjRpY0N0cWZOVVJM?=
 =?utf-8?B?UWM1RmVkUlVLVDk0Skx4Y0xMa3BDb2RKc2NQSmdyT3R1TVVSZ3lobUN5NVhl?=
 =?utf-8?Q?UjXqeAuyjzXT5ts49LJXXFdJ/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 90d15357-5022-49dc-bed8-08dcfcdc1e6a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 14:22:31.4943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pn80iAMjFfWx6sUN7VlVt3xLfP918C5GE92Oebr0oJ+sW+M9r9OQj0N/sdTBrgSlpw3aXVEFFtXIu5j58qYtTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6483
Message-ID-Hash: BZWJ7CZPUXNEKWLXXUR7KSY2BXG64WPC
X-Message-ID-Hash: BZWJ7CZPUXNEKWLXXUR7KSY2BXG64WPC
X-MailFrom: Mario.Limonciello@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BZWJ7CZPUXNEKWLXXUR7KSY2BXG64WPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/4/2024 03:13, Venkata Prasad Potturu wrote:
> Stream name mismatch with topology file causes tplg load failure.
> 
> As SOF framework assigns dailink->stream name, overriding stream name
> other than link name causes SOF dmic component load failure.
> 
> [   35.474995] snd_sof_amd_acp70 0000:c4:00.5: error: can't connect DAI ACPDMIC0.IN stream acp-dmic-codec
> [   35.475001] snd_sof_amd_acp70 0000:c4:00.5: failed to add widget type 28 name : ACPDMIC0.IN stream acp-dmic-codec
> [   35.475013] sof_mach acp70-dsp: ASoC: failed to load widget ACPDMIC0.IN
> [   35.475018] sof_mach acp70-dsp: ASoC: topology: could not load header: -22
> [   35.475072] snd_sof_amd_acp70 0000:c4:00.5: error: tplg component load failed -22
> [   35.475083] snd_sof_amd_acp70 0000:c4:00.5: error: failed to load DSP topology -22
> [   35.475090] snd_sof_amd_acp70 0000:c4:00.5: ASoC: error at snd_soc_component_probe on 0000:c4:00.5: -22
> [   35.475117] sof_mach acp70-dsp: ASoC: failed to instantiate card -22
> [   35.475254] sof_mach acp70-dsp: error -EINVAL: Failed to register card(sof-acp70-dsp)
> [   35.475261] sof_mach acp70-dsp: probe with driver sof_mach failed with error -22
> 
> Fixes: b2385de2ae11 ("ASoC: amd: acp: Add stream name to ACP PDM DMIC devices")
> 
> Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>

Thanks. I was aiming to sort out (null) from `arecord -l` but 
functionality is more important.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Mark,

Up to you but alternatively, you can also drop my existing patch and 
force push your for-next branch.

> ---
>   sound/soc/amd/acp/acp-mach-common.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
> index 67aa0ad83486..d314253207d5 100644
> --- a/sound/soc/amd/acp/acp-mach-common.c
> +++ b/sound/soc/amd/acp/acp-mach-common.c
> @@ -1561,7 +1561,6 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
>   
>   	if (drv_data->dmic_cpu_id == DMIC) {
>   		links[i].name = "acp-dmic-codec";
> -		links[i].stream_name = "DMIC capture";
>   		links[i].id = DMIC_BE_ID;
>   		links[i].codecs = dmic_codec;
>   		links[i].num_codecs = ARRAY_SIZE(dmic_codec);

