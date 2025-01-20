Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C9CA17201
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 18:35:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E6C16020A;
	Mon, 20 Jan 2025 18:35:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E6C16020A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737394516;
	bh=FSYaF5gG2kQr+XjRPN/sDJGCPBgzPKMVi1V+7Sll14M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lfGFvc0iXmU138kiDIyY0vuKzcCgbEUp3CtDkApZKTq4eTrLQ9k0PE1RhbGJF66kX
	 w0fAKV2XQ5VOAA3LYOBUTtrOVazMZZpUX0UHgJUQ5zvHfFZDBRA3+AotvOGWtwS9dF
	 3tDUJlecf9AvocDnSTVyao31noHgMXlTLHC6sdH0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFE04F805BE; Mon, 20 Jan 2025 18:34:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D339F805B5;
	Mon, 20 Jan 2025 18:34:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E91BF80482; Mon, 20 Jan 2025 18:34:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:240a::628])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93BF1F800E4
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 18:34:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93BF1F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=F6rPU09W
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqBV//MvG7BryweaJQtOwr7vf5nQRuGrVylf/jvuy4MWKml2OKkSFOVcV5CkZwo2X+1JdSUfLHRs2TDE39usIwifWmG08r1F6j9383IgCUZ8EboPCUw3U2iK61fyg/npMg6eRgokFAFUkTocQdVDElYDYo/eL1LB5fWqQTey7j4AVMbq2JnFcc7kU9VMIeos5VON06sfck6n/JcvN8yVHShXu5uK7HJbwUqrS7vvdLBT48G/WxPi0ZiJVrqtd5O+nMrz5soNhHdaiBBy8patOymO8yDg2nd9g1SZkg1Gv+7gnzVaA2qoxpovpaA5s5zqobLODYmWqLOUxbW59aHpgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMbMd2KNwRA2/7boKXP1/l5fSxRAsnTVKZx1rTVJI3k=;
 b=A+f6ImroDlcWR1N3483YVz+88fRO00vREYt3hgomfeeHFWS6LTr5ptC06kEDbN7gdCblknTDMIQl4r4B6PYfMP2uKu8w6VRx4JfdopiIXSXUKK4Lu0h32nijj93nqycql+Lnnu3EvBM+vsdFaiMM0si+nb97m8RGWv7nfCNkcbMvNvC6NzbnEYzf0IHp42hf9zGZq7q383vahivHNYLFfi8gGzqxNYuYnceVgH4sEpwIlE36zzVGGdgCZx54EaWBcxK8IU1N4svU+z2bcYbq4q7Qf9xK3JA4DvAfVtCbYpf5mUqCR7+NLV62faQzfqmHTynZ64Kf+eWY6NqZjM9Rmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMbMd2KNwRA2/7boKXP1/l5fSxRAsnTVKZx1rTVJI3k=;
 b=F6rPU09WSimKQRgTrTtDMpLriX1wU9IpqvPIbEsB8lrVfSzwYiyuZ6YT1WmuytcwsfVoPe09SFQ6pRYNuq4JBY1CALDJB63lCR34g4gw3iGLgXZVl2W8x1p/WlaHgFnLqi2CohUI32O1Ze8kBW5wDjT90SBwJ2F0u+19diCC+Ts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by SA1PR12MB6821.namprd12.prod.outlook.com (2603:10b6:806:25c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Mon, 20 Jan
 2025 17:34:08 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%6]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 17:34:08 +0000
Message-ID: <bde9986f-9519-4e2d-b435-dc15a96f299c@amd.com>
Date: Mon, 20 Jan 2025 23:03:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 02/23] ASoC: amd: acp70: add acp pci driver for ACP7.0
 and ACP7.1 platforms
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, Mario.Limonciello@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
 <20250120100130.3710412-3-Vijendar.Mukunda@amd.com>
 <e5d8c2a5-98cf-46f1-b942-8792289ec363@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <e5d8c2a5-98cf-46f1-b942-8792289ec363@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::20) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|SA1PR12MB6821:EE_
X-MS-Office365-Filtering-Correlation-Id: 86899958-cad5-4b95-7389-08dd3978a4b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cHUxQk02MWpCcXVMSDZjYWhTbVg1NHJINW4rRXg2Rkp5ekFmSWtwUHl1UXYr?=
 =?utf-8?B?VzF6bXN6Nmc1UEs1YjZMaUFjdmt2Y09aSFBiV3dya1c5aFVlUDZWR0ZjWGNw?=
 =?utf-8?B?dW81SU9lZmFXcnVRaGxtbEJQKzhpY0NVWHdzOGt5cWIybDdZay9yRXo1bFcw?=
 =?utf-8?B?dEVJMEwrRkVjZ1Bpc0lESmR4OGlYMDJuVkJ2Q2hkVHpiOHBGTEx5WTAxam51?=
 =?utf-8?B?dlduOVJ3bE42cWdpUzFZWTVCS0xRaXdTd2Q1UnlZbHcyTDhHcE9od0g4Tm5J?=
 =?utf-8?B?YzF0ei9QL0pHNWtLNU1hTjBES0pVUjdnM284ckpaV1JucVNDbW5ZK2IvMUp3?=
 =?utf-8?B?RmhYNmhpOEdua1hmWld5ZURybks5Z3hFa1RFa3FPZkViN3dYMTAzSFlGbVV6?=
 =?utf-8?B?MzFxcGNzNk9XSUo1ZGRSS3M0OEQyRVJRTGhwRGJRZ3RxU2hMOVB6RzFuYlBK?=
 =?utf-8?B?OVJKK1Y2UmZVTE5DdWdDRURsVFlHa3U5L2I4UWxsUWNCd2VMbHN0VFgzZDEw?=
 =?utf-8?B?cFBqNmRHM2xsakxoTWE3RXFKQUI1cmNHTjZWTlZRMEJSQ0MzVWhJKzlkM0xZ?=
 =?utf-8?B?aEJRcHNwMHpCQVlNZGFPMFNPK0xEbnpDSGNSVklLaVorK2xzUlFFVzZXaWNw?=
 =?utf-8?B?N0VqemxMcGJyU1BwaXI5dFRtbHZrWUkwcUFuZXVNOHN0YnNnQkZpK204TTFO?=
 =?utf-8?B?TTBQMkVkZlUzcEpRL2hjY0hKZkQ5OEFMR1BtMmRSRmtPRWFGMjk0MjVXZW1j?=
 =?utf-8?B?dm9MaFZMTW04V2pHaXg4ejVPaXF3U3FwdGhGV3NFKytvZVNhVmo1S2UwOStQ?=
 =?utf-8?B?MHlOQVNLTDNoMHo0bW5EYUZ0NllwZytYVEM0MkYvQW10TWxzL1VjOVppMGRI?=
 =?utf-8?B?aVk4RDRpR2J3VGsweFlmcGtwOFRGY1c2OWI5bVp6MGdudHo5T3YvOWxlVml4?=
 =?utf-8?B?MmJUWS82VlBLZjJXZ2NaazNocUNkKzNQOXVnd3I4aFhpd2czNTBSS1cxVTZD?=
 =?utf-8?B?RG5WTlhqQmhzVHlnQ2dYVDdGbmcraWZDVTUzeVlZUmxrYmMrdTNxclVWWkhK?=
 =?utf-8?B?cDErOUhaT0prVThUSXVneGlJbUJmTWZnSjFoV0kzeFNCUVBhdlVXSUFLRG13?=
 =?utf-8?B?eExyS2Y1eHlSd1FPWnVZSGdERUtnenRKeUdMdEZhTmxtWTZ3RG1XR0xkMWRV?=
 =?utf-8?B?N2huQXNWSGlwWEx5WUMwell2ek9ZVTZWb3R3bldrUFRsZTgyTkltZy85ZGdn?=
 =?utf-8?B?NkluNDVLRndlQXVoc1RQY2M2VFNTdGlVeDllYlhFWHl2TGtsY0RrTkhBSzBN?=
 =?utf-8?B?cDRSWTJZTmJVNjZ6THZkMWxJUHNmRDI5bG9YdytSMXBwL05MS0YyVU1wRDMv?=
 =?utf-8?B?Z2RURmtSQTdORWNXZzhxTmZ3dDJ1ZW5aL2lrdjlUT2QyRWUyUERobHRCTHdU?=
 =?utf-8?B?QlRGMEdXV09BYkU4SzJ2TldJOHBzTXJoQ0pYaTl6M2NCalZxVTNjd3FiYTBw?=
 =?utf-8?B?V1VPNjVFNTlUYTM1MldGT3c5cHBpU1dieHlZb0IyUXl1cU1LZUxoWWdUazVs?=
 =?utf-8?B?ZWxUMFZjZXViMVBlRzVPakhuMUFBcE4rL1pEbkdGNEVoemFaUnN4V0F4Q2FP?=
 =?utf-8?B?bzRvSkw0WmlTbFJMc0o5eFRXNm14ME9tNFM1V3hqZHNYYVRPeWJEQnNDT0tD?=
 =?utf-8?B?MkFrMTRLSUJJdWxUZHpaNWJyMkFNV21CUmtyMEhSMWlLdXBIOUxLTG5ZcEVJ?=
 =?utf-8?B?Y01Hd3hJY281djlYcTFtcVZMK2sweG5TdlMxYVVMcHRRaThaZU02eUhEd2Iz?=
 =?utf-8?B?aHRDSStYUkFKMzFqdTBZQ3hHWXJHc0p4c1pWeHlMRDQ4RUFNT1FsSjBSYUpX?=
 =?utf-8?Q?ttgj+FFmWZHyG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VkNIa3d2MjgyZEhsNVQyVUhDamlJL0plWGhBVkd5Y3VhVlJ3cHB2b25nWlZu?=
 =?utf-8?B?MGUyMExNMy9iTksvRWRTczJkSUFkeUxaZERpWFVpb1pxaGZEYjl5ei93V0Ey?=
 =?utf-8?B?ZjVHTnpVQzQycnZEem1hb3pQaEpsMTIySWdkNTM3K1JBd2U1TmV4VGlob2Zi?=
 =?utf-8?B?WkVLWU1BeXdZOXNGOEtHMzJqMktwM0dPM2JQSUlSNGlaMFhLckVDMlhSMlkz?=
 =?utf-8?B?a2dLRk5raGdQSkhKTVNKeGNRZGE4Vk1jTkxVd3BJV1J1dUIyQUI5QWxuNnRQ?=
 =?utf-8?B?U251R2lKdVFwQ0U2T3RzTlJ0QmNkRFplWU51RXZYMDVLYXpwekhXQnczOFE0?=
 =?utf-8?B?ZmU0UUt6VWJmY3JrSnFiZHUvMDk1ZXRHbWVWejJiV05XWXRiVTU3djhHV2pE?=
 =?utf-8?B?c3hRMWZ2VEZCWG1tOThjRU5oUWliUkx1TTg3MFNNQXRFS0FmbW9Sdm9zenBt?=
 =?utf-8?B?UGRqRi9pMFU1a3hyVGhOcjFFQVQ0QThlUzI5K0tXMmIyN3R4RWNtRmdBcDZl?=
 =?utf-8?B?Q0JTRkNFZVFNVHV5SnA3TzU5TmM3ZjY1U00rY0NCUHhhWlE3ajJIVGRjckVL?=
 =?utf-8?B?TStiNEJFV2plWmdBVmMvV1hyY0NNV2xvWWRXdmt5bWtoSW0rQmQzOHZSU0Va?=
 =?utf-8?B?MUNZdWxMRjltMGpDTXByV2FYRm4zSnM5VjVRNU9VYzlybmdLSGZzQnNoWkNy?=
 =?utf-8?B?d3B5cGxsdHRjekd2dUptbngra25TMldNWlNsY2pvVFY5SjdEZElEemkvNWNo?=
 =?utf-8?B?ZnhHTXZ4MmExOFFGcENqbjVPSkZ5TDBJQ0lWMmRqYytVUUJsbjhvOC9yMUd2?=
 =?utf-8?B?V1Nrak1JRndQdnE0TG1BckNEUkVSRmMvdDlCb3lISC93ekNDQ2h5bjZ0ZVZq?=
 =?utf-8?B?T3lhVEluejJoUXBhNmpTUHVWOEF3TnBZOXozYkJIbm14Q2RQNTVXMjFwZ0h2?=
 =?utf-8?B?djB3Y1A3cVJ4ZlZNSXE5NitiWXFWZFZRWHBhOVpxUlM5ZlY2K2dBd3YxaFVZ?=
 =?utf-8?B?VjlnOW4vS0ZvUThCeGhFblh0bkNFY2l6MjAwZGRxdUJ2ZFdta2x6aWFxaXM4?=
 =?utf-8?B?aFFWV2ZpQ21zV2pqOHRtcFNrK1BaUlVZYUtyb01FUFNQYXBIciswYUpDODV5?=
 =?utf-8?B?R3lTL3BodEM3eGNvRFhtV2UyZzMwOHpGM3R1MXg4WGF1MUpiT3JxcFg4cWJi?=
 =?utf-8?B?ajlST0pqaGhWZDVtRTA4Z28wbThScEtScUdFbjVVaURGUEdPNTBaTkRQRDN6?=
 =?utf-8?B?OCtPcE1BbzY3anlvZVAxaXp2QkMwYy9hamtKRFJnbHJVQ3E0M1NXT0IvY0gx?=
 =?utf-8?B?SExWTS9ndHRCcjdrOGdRdElBcFNYYS8vbytxZjloWW5US3FMUmdQRlhrOEFl?=
 =?utf-8?B?Y0lKdTJVaXVNaTdBdDlHRElvUWhGUUJNRzZGZW9hb3FtdEF0VE9qb25lU3dw?=
 =?utf-8?B?QzNMdTNtY01vK2IyVG0zdXJmeGFMRzRYSmdmK3ZmbjFVNnRUSVVRUFhaNkda?=
 =?utf-8?B?d0hYQkI1Q1VyUWozdmhFeFd0RjEza2g0NzJSTVhmck80Vmwzai9CRSswaEdp?=
 =?utf-8?B?NmNlUjBSSzcrdjFpQzNWVnVqZDNWdFV6UGxoTjVkY2VKOTZCdjBpbzMyN3hP?=
 =?utf-8?B?Z0ZoSU5hL2NlRmt3OGJrY2E5TER2Wk1DS2tCME9CdGVPTjFFNk9KOVdHeUVi?=
 =?utf-8?B?cUpDTVN6M2R0bEdJdFFPVHlMVXgwcU13RWN5RDY2QmR6V0VKU1hxQUp0dU9v?=
 =?utf-8?B?b2k5VGgwbDNaMzE1L1pheDVsMlhoSE9UOTJKKys1ZWJ2b25obFlsbGNIanJs?=
 =?utf-8?B?WUNaTWpFYTIvTWxwS1ZOTkNGVDh1SjgwQWtueFFXcnRRRUF5ZEFycEUxRE01?=
 =?utf-8?B?K3QrdWRnb0RqQlFxTk5TS3pSTy9obng1cnpvM3RPaHlSZnkvUEhJQkJWVld1?=
 =?utf-8?B?clN3eVJrdTdBMnJOZ1dkNjNYam42dzVOdUNTSXF5NjRRRUE2UVpRY0FISUNh?=
 =?utf-8?B?clVKNDZicE4zUWpkbzlIcnorZ0dVYXRSN1dIRnM4ZTJGZUNPa3VCeUcxTTE2?=
 =?utf-8?B?TGNWaURyb2EvYnUzNmFZWGk2c3hFcU8xUnFGMHNZOFM4aWlWbDRrOGMveFlG?=
 =?utf-8?Q?TSHqJyVVA9rDIXIAG1CYlrBAu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 86899958-cad5-4b95-7389-08dd3978a4b4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 17:34:08.2780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yC6VbRgLo9ljIkveLCjs9bpc/UI/3bjkonVSA64Jj9nWDCxS8FOl+zTNh56YpMNXNPo1KOe30cWfwZr3wEXnbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6821
Message-ID-Hash: GRQ3LGAHJBOOTNAWH5LO34UGBKYODLPH
X-Message-ID-Hash: GRQ3LGAHJBOOTNAWH5LO34UGBKYODLPH
X-MailFrom: Vijendar.Mukunda@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GRQ3LGAHJBOOTNAWH5LO34UGBKYODLPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/01/25 22:38, Mark Brown wrote:
> On Mon, Jan 20, 2025 at 03:31:09PM +0530, Vijendar Mukunda wrote:
>
>> This patch adds common PCI driver to bind to this device and get PCI
>> resources for ACP7.0 & ACP7.1 platforms.
>> +	ret = pci_request_regions(pci, "AMD ACP6.2 audio");
>> +	if (ret < 0) {
>> +		dev_err(&pci->dev, "pci_request_regions failed\n");
>> +		goto disable_pci;
>> +	}
> Looks like there's a cut'n'paste that needed to be updated here!  I'd
> suggest there might be some chance for code sharing, but I suspect the
> amount of code is so trivial that it's not really worth it.
Will update it. As platform specific changes exists along with
standard pci driver probe sequence, I don't think we really need to
go for common code here. Same time, We will improve code by
implementing common helper functions where ever it can be applicable.

