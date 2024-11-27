Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BFB9DAC36
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2024 18:05:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99E3A2BDC;
	Wed, 27 Nov 2024 18:05:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99E3A2BDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732727148;
	bh=/NAZ+jveTV+2gxoK2OokdOIg+h7+HazbnkkSNAfvLqw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DV9W33jR/hKeb33Vogpt0LVPkVbZFGtqPozzNRfIRjOTl4aCEa7d1e8xHJgbC3WmK
	 rgv24NuGqLZenhIR5NBsmLKDmYdYGC2eXORrRZo4UpHngFpI7SjsWmaCsZCpRtxeXt
	 mMRQTqug0OR58QhCTkCX16kUgBELyNHqAb+2ekBI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A4A2F80588; Wed, 27 Nov 2024 18:05:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68CBCF805BD;
	Wed, 27 Nov 2024 18:05:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56C4BF80236; Wed, 27 Nov 2024 18:05:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 163ABF800F0
	for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2024 18:05:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 163ABF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=S8a+8PYt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7FMzE1I8/mO9uGcKFOw5yYC+sSV4NqDgAPxy7DRN9WRHDn3gPZuerTKStn82naI6+dA+sjL96CryDwOIs9YOEgLAohLuVtaSiqvwSuVps4thaU9om+ZaYb6a1InD4nUJtxskR6yRyrvGMN9J6k4EWEueMRDFodRQ6YmBia7oVuDo5UrjhlbSjD7Izu7dGhsn/y6qbbpCEBn8lnaXE3fuQ9RscEsZUa+Qo6ls24Oi/pL1c1bKOY9YEvZc9eEoJTvDVMPHY3Jf1e7iaaC5S51w9K+ZNB/dM3L8zvOw0Dnk/exFjD5j0sN4m3mg098wtd25o971PtL4r3xBvtQL+9Fag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHApLMez9ZUPR3gPiPP+A2T977wQJKhXlm/qjwgyRms=;
 b=vA8fhqHvfZctcy2Y8oxccqwBNh1YYpd/JTXnVTw2zLEBbDZ4R11nnPHXaz1M/MPvyWVzLsDoYaQX/G5+s4p4VepO5IKXdBKFzwpLqSx/ipP6MssHCMExeqd+5b1RKylCggk8YjIpepK8QGvnEu3sLlE3lpx7MqLVVzYCwkTgNIA14m9f+FVPvlYVV//oPRS4WckB1LEnTHzaB8Jy4DNcKXnW+QB+Wy707ZEEWFcKEe18E3/tmZqGTduWli2k2rN2Qf+Pto+Wmi/UgoEF29Lka3MNQhzhPE03E+zpeEpILGkzay3iEXyO4Ga9ARb26BI7/x9WlZiRZQypfxN+uAzatg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHApLMez9ZUPR3gPiPP+A2T977wQJKhXlm/qjwgyRms=;
 b=S8a+8PYturalj0iww/85tkUFnLWm5Sb0llb8Jzc6nXN74jtTUFWki9JOcnWYDzPnCtUePN5L50PbxqLRbkX6bmIdHlpr5KVnT+94l9ctT2BxDZlgc10RanjiRbWgCELN9h6uGgZ9leX4LNI1V9IzjqY6FuqkdjHCmIQpUcxIpLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by DS0PR12MB7970.namprd12.prod.outlook.com (2603:10b6:8:149::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.12; Wed, 27 Nov
 2024 17:04:49 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0%4]) with mapi id 15.20.8182.018; Wed, 27 Nov 2024
 17:04:49 +0000
Message-ID: <021436ab-8035-4c56-99d5-c478075e6add@amd.com>
Date: Wed, 27 Nov 2024 22:34:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Fix for enabling DMIC on acp6x via _DSD
 entry
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
 mario.limonciello@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Tim Crawford <tcrawford@system76.com>,
 =?UTF-8?B?QXR0aWxhIFTFkWvDqXM=?= <attitokes@gmail.com>,
 Techno Mooney <techno.mooney@gmail.com>, Jeremy Soller
 <jeremy@system76.com>, Malcolm Hart <malcolm@5harts.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20241127112227.227106-1-venkataprasad.potturu@amd.com>
 <a6036171-2dfd-4296-9fe4-242c306e5449@perex.cz>
From: potturu venkata prasad <venkataprasad.potturu@amd.com>
In-Reply-To: <a6036171-2dfd-4296-9fe4-242c306e5449@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::15) To PH7PR12MB5951.namprd12.prod.outlook.com
 (2603:10b6:510:1da::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5951:EE_|DS0PR12MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e5ecb4f-0898-413e-1393-08dd0f059a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d0JGc2JvemF1S1hCajFEQklMY1EvVUFhdE9tMDF2MnBVaUdRM0tCYWhOYXZy?=
 =?utf-8?B?ZGRoczBla0NGOWFXQ05QR28rTDYwMUFmNmx6U0VjTm9UU2NxbjBxQzFLQ2FH?=
 =?utf-8?B?cmxLS2ZtOVBYNURYY3pnNW5obzZDQS95OVA0eXhVV0crZEc0K21rSmJCNmt5?=
 =?utf-8?B?bUJOYnNGNG5rdE10cVhLSTNvM01lVENBSGhvR3R2MllXMTNHLzdOSzdCSEtW?=
 =?utf-8?B?UUFVWFlIRWRGdmx1aTdpUHJVOHNZb3dSdEk0YS8vS3FkNXhXL3hFRHFwOERG?=
 =?utf-8?B?dUQwOHN4K0hWUFdKbXJwUjhNQVAvd0ptdjBIak5iZWJHcjZxMU9nNHAwVUFL?=
 =?utf-8?B?L2UzUVJZckp6QkpvdnJBWmY3VmFPMDFIWXJIQmdORXpGRm1MTXhPNEV3aEpz?=
 =?utf-8?B?L0w1WXNJdFd6UnpMdFFSY3ZXR1A5ZjdIYzlvR0NxVEp2MmlrZHBuUEc4U014?=
 =?utf-8?B?ejFYV3Y1ZjQyMUxTblYyVWduODBnUFU1dEhkR2o4YmxFdURtNnY5MS85QTlC?=
 =?utf-8?B?a1U4ZTA1dEM4S0tkdGdSdmxRQi8yb0NFbzJPMDNUL3l1MStIcnpPYmVnRGsx?=
 =?utf-8?B?OGlhd0Y5U0liellIVGVab2pkR0hmNHJKenUxUUZBanBRQ1FWeTBRU0Rxdk9p?=
 =?utf-8?B?ZUJidUJ5ZjdVcDA0dnJhSTFQc1B1Q2xoWkMzMmNsNnFTZmFHQW5Qb3FWNlo0?=
 =?utf-8?B?MHh2NVN1RVVEbGlTcUxYcFAvaStNalhmM28xYnRGN0lWdWlTWjBlcjZsUno5?=
 =?utf-8?B?T2F0QXhmQnNHaUdZMndmNXJVMXliU2FXRSt1NnlybDJuM21OemFEZ01CYWhB?=
 =?utf-8?B?ZFpuSHovemNsMUJvMTM0SmVYTHFSSDlYYk9QRk5HVVc5VGh2UzMzZVdYbXpp?=
 =?utf-8?B?TTA5TXJ5NXh1TGN1dGljenJyYUthNEVuL1NubFpFVzhINndWeFBVcG9mMkk2?=
 =?utf-8?B?K0VXenlKa2dBMjN3TGs2bVNjTHlTZ3I3V3VScEFIeXpSOFM2cm1mOW4zWGlX?=
 =?utf-8?B?YnRRSGJaZXluMHhtL05nMXlrczlHT1piZ05zQ2VwMEhqVlZsTUVlaldldE9O?=
 =?utf-8?B?MzQyOUljODVsWEZ0Q21Xd2JKeFlDT1QrenBUcWNPSGhFVXh5MGM5eGxxdWNL?=
 =?utf-8?B?OEZYTDhPUFhwOEJCT2ZHanRMS0JNQkhieTFVaDhMazNzc1ovL2o4VWFqcmdW?=
 =?utf-8?B?QVhFR1k3UlZhZ2haKzV1YVl0bzN2MlRaSGFVT1FKTmxYdllYYjNJV0Y1Wml5?=
 =?utf-8?B?VTVXSXBBaVZvMXphRU5US2hvYVZKRTVrMzYrNXFzd2dreTRPV3NmeVVjMWlS?=
 =?utf-8?B?ZzBxZmxKMjd0Y2o0YUdMNHhhQWo4NnVWbjRnS1VVOFlKaHVDaVNZdlZldEta?=
 =?utf-8?B?ZS8vOGdHV3dhM3FCcjJOdjBMTzhBV3ZvV2s4YXJ4elZONEJDODlCOUd2RFBN?=
 =?utf-8?B?TDZNcU8vS3pzTlhwbTl3NVZueXVteUxSRDJxNXRGYno5UXA3TmFYMnBCcXBQ?=
 =?utf-8?B?d3duaGp6TFFxMzBvWFZUbjJHYVM5SUx3RGhabkw4cVZFK0IzZVRscWlWY1ZQ?=
 =?utf-8?B?d2hUcUQ4cEVnaVVka1dQbGcrcDk5NnA3V0o1Z2VOWkVOd1lsYTQ1MWsrTDNC?=
 =?utf-8?B?QWoyQ1lMUGxVb2RnVUJKbE9uekM1b1dOVGl0NEhSWHRLYWpEVWQrSGhBZjI3?=
 =?utf-8?B?NFN5NjRWNXQ4VHpYcnB3Mms5bmRmSDlMNFF5SEdQTlI4QXpvV2pPbGc0WUEv?=
 =?utf-8?B?N0xlMmJVNmxPR21nZHI0ZWxEd3IyR1FqNG5lb0lxTlV1VklxTDUxZWd3S3hZ?=
 =?utf-8?B?V1p0aSs3VG0yV0xBZ0FOUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5951.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bTlHUXB2QXpCenB5Z2d1ckhoMjVEclJITWZIeWMzU1VZbzhUUHNCYVpHSHh2?=
 =?utf-8?B?eXRZUkF1L0Nab0g2alFtWXFWdXg0a1JmU2gwYTlOdWticThrZzVESy90dkNr?=
 =?utf-8?B?ZUlVbVlxaGVoeTRuOGg5WjZ0bmFWekRvcml3UGZkUGZhcHl2THRrUlJkUEVJ?=
 =?utf-8?B?cUhRU0Y2Vi9ERmFWbFFYbUgvWHBMSWJpeGUzWmJEM1ZNY09xV2x5YUdKTFBm?=
 =?utf-8?B?SDBKRm5kZzhqMG9NSm9MeG1VV3FPQU9XekEyeVhsSTBjQ0NsTVFmSmRxUDMr?=
 =?utf-8?B?ZmhYTDYySER1MnhyMm1Cbm5TT1RqZFhoYjFIeFNML1B2c2xiRDJIeTFhWDNa?=
 =?utf-8?B?ejF3Unlha0xEV0tpSmFKaXI5R1BsaDhtS0Nacm4reE1hRm53cmF3SG40Sks1?=
 =?utf-8?B?SHpyTVc0TzJpNEdnYS81MjM1LzZHMG1SY3VjSFR1UGJVL2JIdk91ektvdk9Y?=
 =?utf-8?B?Q1IzN3o3UDBpdUJQMVZQTWFlTFVsSjdOT2lkWFpPck5qRjhVdy9RWUVSbml6?=
 =?utf-8?B?c1NVbjVVNDd6dVVGTlI5Y3FtcTdmdXp6VlhiNDFrUk5jMVYycm53dGZGSnFB?=
 =?utf-8?B?NG9uWVVDL0c4Qm9hRkFvcStjS2ttZ0JzbW1mb1BJc0MzYWdRTkRWcEJhMzBO?=
 =?utf-8?B?NHlxbHJ3WjFaY3BTdU1RZGthUTZsK1NsZ25WcXZnWGZCclF1SDBWZGVUTEZl?=
 =?utf-8?B?K25RQzN6THNxSW1yT2VWbENSK0MrT3kyUW1ES1k5VjliTkplVTZZejNudTZz?=
 =?utf-8?B?cmo1Y0Q4QjVFWmFVR3UzNmtZS0doNktrcG83RmNQQWVka0pmZWhuSUpOcEF5?=
 =?utf-8?B?UWg4L0lWdUNvSFZXSTNZK3UrNWxNenRrdUJSWkliaENScVh5Y0FxTWpCS2ti?=
 =?utf-8?B?eTNsZDVlMVFZenBlbmRXRm5RcUNrTzZjdFVEUGI3UXYrQnk4TTU5SCtsSnZy?=
 =?utf-8?B?U2xPWTB1L2h4cHpJNGJMcHBoVG1jRk1uSmhVM3k3T2VQNVdwQnNKcWRvZWh4?=
 =?utf-8?B?aVBYdmdoMndkVUcyWlZySUtkT3htNzBvM3krMFpRQ0xGZFJlR0dZemFtbUFB?=
 =?utf-8?B?SzA3OTVMeWNESUlpdzA1WlV6SmYveUcxYmFiSlBzRlZTQ2lPdWd5eWtnWXlJ?=
 =?utf-8?B?U3VPM0hQS2pDb1pKVitRdnM4MThIV2xycitlL25uUWNYUVZVQXdCWnZ2WFU3?=
 =?utf-8?B?WlpiQkNPd09hWWhGcW1GUC9kR3FrcS9kZXV3dUZNWDJBSlVCMHNob0pFVC9y?=
 =?utf-8?B?ckYySmdGU1dWUU13YUVUaHF2VmxTNHh3SlFNT3Jvd2pGcjkvQWtzRDBjTEZI?=
 =?utf-8?B?aDRoN2dGREpEcEhoZkg2WnFXZFJ5anpXNzl6eWdZa2pKVlhxSEtYdmlxMDZo?=
 =?utf-8?B?QXBoVWVOaGpyYmpOMXd3TXU2bzByYm8xMDcrOHR4YTF5WVBIUjVSUmM4SXBm?=
 =?utf-8?B?aWZObCtWaURyTlFiTkZvMWNrY1lVV28wakY3S09MenJLTTFGM1g2VjZ5b0dp?=
 =?utf-8?B?OG5XMnhVWTBiUnNuanR4RVhqZ0ZqdXhINlIwRnB1M1hmQTdDYlV5Sk9uOHNJ?=
 =?utf-8?B?YjhQZlhZRzhoWkJnRk1vaUNGdk82Mml0OEV0SFpMYzRVODdtQzBjM3M4NzZN?=
 =?utf-8?B?VjBUeFhHa0Vua2w2ZzJRRzZTYmhpSzBpMkFyaE0xeEloU1hVU0c4a1RXWHNO?=
 =?utf-8?B?VlJiVDlxWDBoamUvdVlVeHhBT2xOZ1RubjJPYys5aU51Ui84NkZnc3B6dEZw?=
 =?utf-8?B?R2Fwc0s3WFdVbkp6MmR1bDJxNytSbmhsNkxpektjbHRpUDZkanNkWERQTGFp?=
 =?utf-8?B?bTFJY24za1pkM3pkVzAyRGNFd29mV2dwc28yZzBaa2Y3Vmk1dVVYbjEvZnVX?=
 =?utf-8?B?RFZ6Y3AxQVVxVHByS2JuTGtqRVFWcWlSTlBTVE4zMUU2bUhZbnVMQ05Qc2Ju?=
 =?utf-8?B?SXQyNHAvWTFpTVllTmFyQ0JxOWlsNzV2VnV2UkEyTnYwa29ia3VDWlJ5dGov?=
 =?utf-8?B?TzVoRnRBcmVNdGtPbFpINU8xektuaDFJbUJhRFR6NWNiRS9XZlUvZmpNRFJp?=
 =?utf-8?B?QTkvMm15V3V2bWJHUVRMLzFXb3BaZWk2MkNuc1lVd1dpYjhZeTdYY2FMSEx5?=
 =?utf-8?Q?FWf9XY6v3+bqoFm0o5sRSgYyX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6e5ecb4f-0898-413e-1393-08dd0f059a1f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 17:04:49.6427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Bob9upgh5rXhlwAsVSo490TjMAiqNH4pna7dhgVpE/BHtAy+zzk/3DgzHSzLPmJlLQJtE/7Ptu4hKQa3eade/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7970
Message-ID-Hash: XKZEA6DJ2XE6TUTCDU43VZAHHEKGWC33
X-Message-ID-Hash: XKZEA6DJ2XE6TUTCDU43VZAHHEKGWC33
X-MailFrom: venkataprasad.potturu@amd.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XKZEA6DJ2XE6TUTCDU43VZAHHEKGWC33/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 11/27/24 18:06, Jaroslav Kysela wrote:
> On 27. 11. 24 12:22, Venkata Prasad Potturu wrote:
>> Add condition check to register ACP PDM sound card by reading
>> _WOV acpi entry.
>>
>> Fixes: 5426f506b584 ("ASoC: amd: Add support for enabling DMIC on 
>> acp6x via _DSD")
>>
>> Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
>> ---
>>   sound/soc/amd/yc/acp6x-mach.c | 18 +++++++++++++++++-
>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/amd/yc/acp6x-mach.c 
>> b/sound/soc/amd/yc/acp6x-mach.c
>> index 438865d5e376..c301dac8b979 100644
>> --- a/sound/soc/amd/yc/acp6x-mach.c
>> +++ b/sound/soc/amd/yc/acp6x-mach.c
>> @@ -523,8 +523,14 @@ static int acp6x_probe(struct platform_device 
>> *pdev)
>>       struct acp6x_pdm *machine = NULL;
>>       struct snd_soc_card *card;
>>       struct acpi_device *adev;
>> +    acpi_handle handle;
>> +    acpi_integer dmic_status;
>>       int ret;
>> +    bool is_dmic_enable, wov_en;
>>   +    /* IF WOV entry not found, enable dmic based on 
>> AcpDmicConnected entry*/
>> +    is_dmic_enable = false;
>> +    wov_en = true;
>>       /* check the parent device's firmware node has _DSD or not */
>>       adev = ACPI_COMPANION(pdev->dev.parent);
>>       if (adev) {
>> @@ -532,9 +538,19 @@ static int acp6x_probe(struct platform_device 
>> *pdev)
>>             if (!acpi_dev_get_property(adev, "AcpDmicConnected", 
>> ACPI_TYPE_INTEGER, &obj) &&
>>               obj->integer.value == 1)
>> -            platform_set_drvdata(pdev, &acp6x_card);
>> +            is_dmic_enable = true;
>>       }
>>   +    handle = ACPI_HANDLE(pdev->dev.parent);
>> +    ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
>> +    if (!ACPI_FAILURE(ret))
>> +        wov_en = dmic_status;
>> +
>> +    if (is_dmic_enable && wov_en)
>> +        platform_set_drvdata(pdev, &acp6x_card);
>> +    else
>> +        return 0;
>
> The logic seems wrong. The overrides code bellow won't be executed 
> when ACPI _WOV data are not set. I think that it may cause regressions 
> for some BIOS versions.
>
> Also, the return code should be probably -ENODEV.
>
>                     Jaroslav
Okay Jaroslav,

We will correct it and resend v2 patch.
Thanks.

