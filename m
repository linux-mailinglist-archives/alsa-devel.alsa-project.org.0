Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 453409EFF66
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2024 23:31:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CE61329;
	Thu, 12 Dec 2024 23:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CE61329
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734042713;
	bh=Xz4iR4W8LrDne8p/govhOt0XYNGwYFRJxOuBBSKpaE4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UgrYHiR/QATvVTGitjKx5R1N10wp6w4e+M3yx9UiNnOQ5J857wpt8fexzd6y9bLj3
	 gInBvQCv/PjdG/KV1XtE3mDywWVQ2vU7LqZg52n6IfgHKx50xoBYKSdeZUlotrzcJr
	 Gmcd2u+xeEyEPjINKkZtg9zOEyzIGLqHNmYFJfPY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3348F805C1; Thu, 12 Dec 2024 23:31:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2A87F805BE;
	Thu, 12 Dec 2024 23:31:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB700F802BE; Thu, 12 Dec 2024 23:31:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::608])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2F17CF8012B
	for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2024 23:31:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F17CF8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=wNVC1mFU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdLzQlkiCUgNqm+yMIRU4IxOa99ncn+aOyogOeF02STNd1vFIU/fLSStIW5zRaZp9x6gLX2Wu8bhkLGlxq6Vxizf/Gnzll5rxbLeZWAvrNfA1N/yY2XkZtYIrzAhIebguqQCJt+7HgFkVRxPDtmjRSJhDDIf1XBGRE5Lx3n+emRH6VqCj/cvesW0NDUqP2cEZQJiqH4dEl/uXC5uGBx5/fhm61yICv6NvqwfJxNF1RxQ5oeG5wOnlHZUWQjakCln8QpKHpF2tlGlhCg239iolz0Si16WCVOcVvF7+HWo6xb9y1tsie4ux8eS0ekT11x8brtLXaP5GIq80x82Cva18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiN+01x8eQWxKs9PaEiH916ewfyRGLyV+JdMiiIwstg=;
 b=rAiMHx3SqRLqf1VRUIKcZbxzYIQXaMHoZc93K935U2Wubboo+Ov0+oYAPi0M2jtobKo7GUMKmrb+U8hscT8FXRRREH/trEHt1RQfoiswwDfjFwDoCT8XB8FUXWN5vG4F0JAvG2Ib8ef8Owjw8MkLirEgSC7Y3/VZfkHF/Y9AEPxYhIWyhC2XU+PnTB9xST8LrXcduWT3Gx+dSS5BQvaP9eRWOlJA0cGGqBfPokpwfGWW0n4/0GjFiJ9dDVepN3Ej3vXPc4hj4gCPCX2EGWwtQeq2yRURWQj56fMk9+oWk2hS56bs69oAgb7LzWJl3Cj1r5RhzzR5qMHVOVLD98PQsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiN+01x8eQWxKs9PaEiH916ewfyRGLyV+JdMiiIwstg=;
 b=wNVC1mFUsjspgs7bZRDvZ+zq2cv2/zJkFTKtu2muc2m+rRtzJdmgmROdb1vCupsQpFSiCqynVnI/D7VfLcIR3ZJ446DE9FeNCoDgBxonvwh6ZRGzRbnXrb3Em0VGpZegUKmtQ0NF8ZsXKhbSy/yGRwON/whH7T5rgbS1dPxN7yQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB8063.namprd12.prod.outlook.com (2603:10b6:a03:4d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 22:31:02 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 22:31:02 +0000
Message-ID: <47f9ccce-1946-4586-b918-3de203b5c712@amd.com>
Date: Thu, 12 Dec 2024 16:30:59 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] soundwire: amd: clear wake enable register for
 power off mode
To: vkoul@kernel.org, Mark Brown <broonie@kernel.org>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 sanyog.r.kale@intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
References: <20241203092144.4096986-1-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241203092144.4096986-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c793021-cda1-4474-01c3-08dd1afca890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cXY5VElJbHhjRnpFb21YYUtOVmdHY3BBb01uK0htb25NME4wdU96L3BBZ3VW?=
 =?utf-8?B?c3Fic1htVEUwMDFOdlZXQWhjSVh6NWV5eFVmME5sMXNtWnB4NTM0b05uZy94?=
 =?utf-8?B?bmtORysycEZidTFIbWNHNVI5NmRnVGlHdmRFMWhzZi8yMzhSTno2VDJaOEFC?=
 =?utf-8?B?MTllWWErQUhTNlVkTTZBSkxEU2hDaEVKVitZL1FXajFzdDFkaXJocGZGd01n?=
 =?utf-8?B?NFkrY2FURUxPSVVuSFdTVm9sdWpqTFg3ekltMktOL1UrWFdjRnFaL21UZ0Vo?=
 =?utf-8?B?RTRVamtaS2VxeDhRTEh2N3gyeXZ4NDNnUUtDR2N2b2dHRW8vNzVoenlVNjdQ?=
 =?utf-8?B?d00vcitTRmphblB1czh6UHFneVhOeUxsL3E2Q0RWa2UyNjFMQk1Ra3lMdWRL?=
 =?utf-8?B?TXpiaXc3SC92V3pyakt4cTNBUHIzM0t0WUExOWtkc2VIa3JzRWJJR2hVZHJH?=
 =?utf-8?B?MnNpMlIwUkp6V0R4dm5YOWJEZkdZSzhKb2REUkV1WjF3bjFjM3hMUjNWVTc0?=
 =?utf-8?B?NHI4ZjJoc0Y1cnppQ1pxSlVLRnQvYm52c1d5Q28reDhLMnd1dmN5YkU0NG1p?=
 =?utf-8?B?VzEycUlUK0tmVUVYbjRtZFB1Y2J6bDNvWmZEQUhrSEdiTWxNUlc3RW95SzMr?=
 =?utf-8?B?bUFSSU1sNmNTQ2oyTmUyQmE2aThqMmdJeWJNWVUvSk5tNDBQN083dENJZ01F?=
 =?utf-8?B?ZGg3Zm1QbmthYXkrZFVaWFZZMUhGS1pFLzJVemVkeWVYQ2Z3OE0zNUdOenl4?=
 =?utf-8?B?ckZwcko3VnNHanhtNVlCcHBMcUNETUpPVjlSSDUwd1VRTHo2U3lHSG9IWjJl?=
 =?utf-8?B?YldVa0FQam1IZGU3azBvalMyaTR0M1ZtVjFsVzNpL1MrdGVuUWtpNXAwcTlo?=
 =?utf-8?B?eTlNQU9kUzRxekFTMmcyejJwdEVPN1pQWk1yQnU4T2lhN29Jb21JZUpqc3Nh?=
 =?utf-8?B?ZExrMTQvd3RqVUM2VnNscERuQVNJTHpRT01Sb0ZoVHliZDhpN3YwdjRUdmlp?=
 =?utf-8?B?c3lielRGY2w5dWNRQUs0ODVyc3ZORnNPQ3Q2ZTQvdGd2REx0QksyV2tiUWZu?=
 =?utf-8?B?TVFwVlNYdUxJSzlYMm02czI3RVRkS3l2Vk1IdGdYdTNCLzQzVVRoZWFRNjgw?=
 =?utf-8?B?eDVTQTdvTUxPc3UwZGZyTUs5M2ZSWVBVQ2ZCVVJUSnRUaDcrUGdxUnl0d2JK?=
 =?utf-8?B?WWYvOTUvTDRlVjZ6OVNHZWJML3g4TzFsamtLVmRNRDcxeTdjWk5veE5UMkZh?=
 =?utf-8?B?ODVybEtnSmIvbEF2eFEvdzBUSE0wdVNrbEIrNS9sTGJRdEcrWWhRTW92d1FO?=
 =?utf-8?B?K1JvM3FHZHNXNmgxM2FjK242Z0RXZVVuNm1za25LNVJvditucjM0QitlTGtv?=
 =?utf-8?B?RWE3N1BzNUN3RW1NY2d4bUUxNkZIbDdoU1FLbi9IY3FnVmJGSkxuYi9UMEZC?=
 =?utf-8?B?dm9IMk9laGJpamlPWFMrbWpEVGxKRU9YalBJcTYvRUJYNUZHVFBFNC9TbHJ4?=
 =?utf-8?B?eGxYMFIvWkZtWmxjM3ZmN1IzeW00TWlsUThMZndmZUJMQkVYdU5mbVNFU1N3?=
 =?utf-8?B?R1Uya0k3TkhQaHF0K0R5STZNWk5UenNHVUI1U3gwWC9CakhCZjRTU25FUURT?=
 =?utf-8?B?NjVQQXVNclVRanI0cmxzWTgyZVV1NzUyQ1AvNWtkbWo0Z202MGh6NmMzbEps?=
 =?utf-8?B?SktSTHB3eVhncnR2QlFYZ1JUblN3dTlyazhkUGdYNnBFV0M0ak5pbDU4Q05C?=
 =?utf-8?B?Smg5cEFMSFIrVGNFREVOZWQ5ajhXOGZhM1QyMUw2c1NmWjE5TzJpNGR2c3po?=
 =?utf-8?Q?fEt0Z2R9LElQOZUR8UqzhQEZew+0FKWLYOKBE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dVRlU0dvQ1kzbkkwN24yVi9pTERVUUFxS3EwVWM2aWo5THB4dVEwdWNudk5j?=
 =?utf-8?B?aHlvbnI5NnRKRFQ4V21USnpnUmt2bmFFYk1UQmhFYVZVYzFFd3FwS1ZMc1FW?=
 =?utf-8?B?aVJ1aTNrSGlPOVptYm00OTdjVWdPZ1lBc0RYT09jY2dHY3F5Rlc1aVRWRyth?=
 =?utf-8?B?V3kyQ3VZNElWZ0g5T3NVeHRhc0l2NEM5NElYQ3lxeTIyeE15SjcwY1FaVC90?=
 =?utf-8?B?TGkrc3gwZzNyOWVwNVQzbWloT0JqSDljcW1FTTM1a3N4T0QvcS9vVDJTTitm?=
 =?utf-8?B?MGpTZHllYVhSS0gvaUN0WVQrTCtEeGJvU0pJMGNIejhXVEp2V2VuTEVKaHdB?=
 =?utf-8?B?S0RsN1Eybm83VmVaV1I2dTRGcFFiU3lyWkV1VE1HM1FwMXB6ZUxIS3RJQjJY?=
 =?utf-8?B?SlhuMVNLQjVaYUlmMDdmdUlvajdJY2hUbFFVZS9yTlBITDdHbytjZnY0TEN3?=
 =?utf-8?B?aFZ3ME9kcmlkc2taVjFTc0ZaS21COG13QlhJa2c4eTlvSllYUDlBNjFvSXJY?=
 =?utf-8?B?VTNkdkg2bzdJRGZFL2x3Y1ZXdVFXK3N5aGpNREIwdTZCaXJKaDZVZk9jL3Zp?=
 =?utf-8?B?RFV1MERHY1pLTlg1cjhCVXF5Y1ZPOTlyVW1rZEp3enNXNVNGNGlLZzA3U25V?=
 =?utf-8?B?UWVGYWhWUlVLdXRJOXFKcnRGdTkxemRISjRmZWhpOUN5WTZHUHRjeThsRTNJ?=
 =?utf-8?B?ajFLYVdPY3dINndLdE50cWR5blpKVEtNemtTbWRDcWNNMjc1cHVYSk9JRGNB?=
 =?utf-8?B?aUxkOXFNWTBDUUJjaGl3YnBqcHltWEZ1N2orWE9PcFNBa1JJTGF2YWI0MXdG?=
 =?utf-8?B?b3A2VzlPcTJVVFY2d0JuSWtxUDIvcE00NXNwdkRlc3V2aWZtWitXME14bTV5?=
 =?utf-8?B?YjJ4dnZ5YmN6ZFhZRXROVXVBM0phbTJFcHlmSzVzakhQYlkrR0ErREdHSWJK?=
 =?utf-8?B?TlZwaElsQm4wRDBPTzE3MDhhWVZocEVGL3l5OGg1UUk1cG1ueGlKMWlHR3VK?=
 =?utf-8?B?VU84Z08zcU10bWpLS0lrVWpkKzY3ckgzVGpFWW52blB1cmxPMHhUYUNoM2l3?=
 =?utf-8?B?Mk1xS29PWUMvR3JYdklMY1FMeVRxNUlYV3ozWWxyOGJhcE5UN3ZHZFNmVGFU?=
 =?utf-8?B?TElyZ2p6ZVMvdFBwczJFWmZHbGVLaWNiYzNNRnVKTHZmZXRDNnBCTzdraHZE?=
 =?utf-8?B?UVJISENjQjZtZFJYRGIraDdYTWNaUmx4Q2doWkswWng4Unlkdmd1U3A3TUpY?=
 =?utf-8?B?cCtoWWFZM2xPTXVjbEZ1ODE1YzJvdThUNXozQ2M3bUlvdVoweXB3K2lydHM4?=
 =?utf-8?B?c0tEL3VrVUR4Mm9oaTg1Z1I4TTE1eDJ6bjFWVnpTQmw2RGY3VzF0ZVIxUDFV?=
 =?utf-8?B?ZUlXL0c1SkZQemVtRHA4STBEQ253S3prSlpUaWhUeUh2ZUpsVzF1SmlNVEx5?=
 =?utf-8?B?eTNES1U5bkwycWRGTDR0SXBDaTRyUngyblM4T1k1ZHJHUzA3QS9vMklhNldK?=
 =?utf-8?B?elluNzZWdkJsYkRUdElqY0RoNDZUN3lLWHExT21ZS3I4MTM2NnQzUTZNUytG?=
 =?utf-8?B?cGlqTWhad2pGRDYvTnE3QzhZYWR6cW5NMERCbXJuZTRJRHlHUlpIS3R0VlBN?=
 =?utf-8?B?NGtmZ3JHRWVQY2xmY2kxK0JqcjN6RmY1cmM2UWdCaVgyVW1mRDNLOXUvemwx?=
 =?utf-8?B?MTVlWE1ZWFF4a0ErdUtvNVlVZ1VaSVFHN2Jhc3dNOFUvYmJXTVdMUVZ4Mmg0?=
 =?utf-8?B?emVWNVFCS1cwOWVnZm1uTkpjMzhsWlptT3orMXdHOFpuNzZyZmxxVGpQQ05F?=
 =?utf-8?B?Tm9NQWRySzNqV0gwUmhpdFJjMzIvN094ZTJFcithWDZCM1ZPWk5HVk9CUVRW?=
 =?utf-8?B?OHNsdlRDbkN1RDN0Qm1mWjl5cDVNak1sWjY1M1FjS295Q2M0OUpZRVFPOGU4?=
 =?utf-8?B?aDRvNFBRb1ZKNHRPUVIyZ2UxWkVOQ2xZTnhVcVh0dm92NFBMYVhxN1pyZWpN?=
 =?utf-8?B?My9KdjcxOWdmYUUrRGdaVlJvMy9EY2QrSTdLS2hUS24rcUtmeE1NSnVKc1ZP?=
 =?utf-8?B?eDZsdlh5TE9EZHgrMHZlRThtNmRYNGJGNGtubGZlSFdsUkplbitwa2lpTHpq?=
 =?utf-8?Q?lUY9ltAqPkqY+Ux+i0Ca+MgmZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7c793021-cda1-4474-01c3-08dd1afca890
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 22:31:02.0363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 bS73mZ4kW3Gekb+uyFS11ao8oCcKPedt3mKRExK/7qORP1kFKzRinx4bLxjv0sp3yKpAYvgX1RA8q/sqblFMlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8063
Message-ID-Hash: UTPH6GBNOJXHZWO2BNECNQ3OID434XTM
X-Message-ID-Hash: UTPH6GBNOJXHZWO2BNECNQ3OID434XTM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UTPH6GBNOJXHZWO2BNECNQ3OID434XTM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/3/2024 03:21, Vijendar Mukunda wrote:
> As per design for power off mode, clear the wake enable register during
> resume sequence.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

Hi Vinod,

Can you please pick up this patch?  There is other work that needs to 
build on it that is currently blocked.  It's been on the list for nearly 
a month [1] along with a resend [2] with no feedback.

[1] 
https://lore.kernel.org/alsa-devel/20241112185138.3235375-1-Vijendar.Mukunda@amd.com/
[2] 
https://lore.kernel.org/alsa-devel/20241203092144.4096986-1-Vijendar.Mukunda@amd.com/

Thanks,

> ---
>   drivers/soundwire/amd_manager.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 5a4bfaef65fb..96a3aa6da711 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1190,6 +1190,7 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
>   	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
>   		return amd_sdw_clock_stop_exit(amd_manager);
>   	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
> +		writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
>   		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
>   		if (val) {
>   			val |= AMD_SDW_CLK_RESUME_REQ;

