Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE98AA6BE56
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Mar 2025 16:30:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18DAF602AD;
	Fri, 21 Mar 2025 16:30:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18DAF602AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742571015;
	bh=hZl/H9V3SBbwf01u2ilOIhye2SRYRDeI/u1xrSvI/68=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=de2HSF9wgo//ndn0yd6p1UVntkeDBAmO9Fjb39J78T5q6JR/kZW2eDzmQqU5cPMnj
	 7dmSzJKliDkUI0Ysdd9u9jRxWLd+4QblbHlza60lt/g+beh7o9ivtElReEKq3Bfvk5
	 XzRMfd/E03+rSHFNSbyKSV3LmpT9YTiVGB3AEWJU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D85C6F805C3; Fri, 21 Mar 2025 16:29:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0DBFF805BB;
	Fri, 21 Mar 2025 16:29:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD47BF8013D; Fri, 21 Mar 2025 16:29:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F308DF800BD
	for <alsa-devel@alsa-project.org>; Fri, 21 Mar 2025 16:29:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F308DF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=oE0kRbRe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyNtbsf5u6p4GYsAME77rCeCbPOp1C8BaAOW1JVDo86FtblnAZ7hE2JmBywvDn9p0feO8SpTEE7gdQP6t8ChH69T1+R0jn2WDfz+RAX+PdOKeUpqn0G1U7OPoSCEaeemln0Tc8kGkQHYbfopycTP7Vh5/IHt6xc6fghZhIJPcNTuLygPihHatOGUXORE+PN/Ibc6lC3elTNk/pHMvx/N3rJqIh1PG2LMRcmaNywC2HIZvqyCuGtGW5CsIza3ewzEL7qw72RGDLjRnj2IRmoKukfSAyy0nLAl5chqAS0Dn2is3D/+CNEpog6q1e31Ls3+ZNQXmt0B/cNqFm8B9Tozfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSNbESCbvXWObXTWFqukCxhuYgDb/6Avlac6mvNhXzM=;
 b=IjAmvrMh8SqESG5tF6Ej6aiKFPg9hkRRaxXvbzpeEyAAwVWV9favCd+58QMfKHa6Knd4ckDMipKRkBvrSQTCfn6lYBZa3oMTUpA0xqJ7KmCR0R9KKnVpXFlpeEyKWTEAXCUAJH6yVEl2i3zJYl7QTPxHTcPRksKGTy1Lbg4M3sSuNBWFHc9yvsR/Wk7dyK+/llV89l7iJFBfpM88ny9FwsnnPUDOm9vDx3bubXtZLx80H0Z6yvjMvwKMuJqXbvC7OOKlb8X/Z9RF2FvkRPsc42ho8+1HXp0pVKm9ZdrMnnpa8j3HYOXCB73su6FEnZQJJdNayJ9ydHB215PoJIg6bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSNbESCbvXWObXTWFqukCxhuYgDb/6Avlac6mvNhXzM=;
 b=oE0kRbReu5QFVZ52hv3BachiW5iK0DXOz+z2/UDyYumoZb4kGMUNWjWguZr/NkHqP9reBFUKJOsTw1a5D7mzobA/4dLbGPxFDgruaRMe+EQjav5WWdHf7cTPzYYmWM/WShPnb7wtnIDxBqKRv8TL+g0MMqDiqEmibTxJkYbIlIk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM3PR12MB9352.namprd12.prod.outlook.com (2603:10b6:0:4a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.37; Fri, 21 Mar
 2025 15:29:30 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 15:29:30 +0000
Message-ID: <459fa375-3c7e-4371-88ca-dd617972cb62@amd.com>
Date: Fri, 21 Mar 2025 10:29:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: update quirk data for new Lenovo model
To: Syed Saba Kareem <syed.sabakareem@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, "end.to.start" <end.to.start@mail.ru>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Reiner.Proels@gmail.com
References: <20250321122507.190193-1-syed.sabakareem@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250321122507.190193-1-syed.sabakareem@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0001.prod.exchangelabs.com (2603:10b6:805:b6::14)
 To MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM3PR12MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: 39cd029d-584b-49e0-4ff6-08dd688d2c6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TkdhZkxVWWJSZloxTS9HTFVkYitTMTcvR3AwQ2dOSzNxd2FFUWlpQWZMVThX?=
 =?utf-8?B?cWNMcWZvQ25zajB3cEJFblFURlI1ZHJPdGdtR1haMXFNa0k0cjBpRG1NTlBw?=
 =?utf-8?B?Um5FUDNjTitoZWd1S3lHZW1sdnliYnJ5cUhIdzZoeVViNmFqNGJwYms2VzZ6?=
 =?utf-8?B?T0dlSktBL1VpS1FwZG0xdlJDalh4UWZFb3J6MDZ1S3dTcy9PSHhvTHMxYThB?=
 =?utf-8?B?QnRGS3ZHRUZGN2F1Y2pkdU5aMnlISWhrUWpNQ0Nwcm1Ha1JKRnIwZVVLbHFO?=
 =?utf-8?B?OTN2QTlTdzVRTzVWWTMyVDRDVzUwRjFDb1NxYmtwZmcweDd0bGtudDAvL2xw?=
 =?utf-8?B?WDM1QUJxbmxYeDIzemNOLzRlSllzbEx3TVJXYzZXWnVFbktFQ3Z0QXAvUlFy?=
 =?utf-8?B?RzM3UDZlRG5BQ3JnVjM5NFdFL0ZPcllsK1RhMTVHanplcUY0TnIvRlNTUitq?=
 =?utf-8?B?QldKbFlxRmxaNUIrZlVXTEY0Umc4YldHbmdKaGVOekVGVEVRSzZ3dGZtYWVW?=
 =?utf-8?B?TldjTEY1NnR3bG51MFlYZEdGNHhYL08xclFLa0NXbmR1Wm9uSHFLMkErSlho?=
 =?utf-8?B?UVNQMWZGMDk3SnlkMk9OZG16QTQ0RGJXdGUydnNkNzZnVEdvbzRKd3hNNTc0?=
 =?utf-8?B?emwraERzdURZN0MvZ0hJdHRraFhZbkhNbDNoTWRaTFdVcHZzd3JFaGJ2ZTBu?=
 =?utf-8?B?RysyMzhvSEJqT2VsZVREOVRyMVRad3RLamJWOENsVEorSGpFVGdNdEFsUSt4?=
 =?utf-8?B?WDRYS2Y2aWRqSTUyMlcwamhCVmEyM1FtNVlndUVDTGtnTU5DeFFma2Q3c1ds?=
 =?utf-8?B?ejN5ZjA4SW5BOUtrL00xTlhkSHpVNUphQXNnSkZ1MEhxc2llRkRwMlczSUlk?=
 =?utf-8?B?dTVyb2Q3SGwrK0htZThXdm5WSzhKYUpJU0x5bFpxc2FTeEZXWEhTcUtrUCt6?=
 =?utf-8?B?V3FqOVY3MEZnY2JLRWczUHg4blE0d2tUaGZqdGV0RlZPV1pVTGpLelVTZWpT?=
 =?utf-8?B?MnBNMmFDUTZiMjhqOTNpU1hMM2x6S2hqeDVLRTNLQ05IVFdyQlBSNy9wNFg4?=
 =?utf-8?B?UHpqVXREdFRzQjVEYWFPdnovU0Y0SHNRRThxUVd1d3A4aGZXSEtRYUQ2aEF6?=
 =?utf-8?B?a3Jsb2ZVcTZ0RXpXYjQvaGJXSHQ2b0RtSkFxMHVkT3laRUVhdDV5NFhKTW8v?=
 =?utf-8?B?S2Q3dkN4T3hwOHJkWGdOYzRqdDRkbTZOUVlRUHNES2pzdjN3S0h0anEyUnFv?=
 =?utf-8?B?WDVTUFliNVFFRmc5aVhyenB6NW5qTDB2UEFaakp1K1B4OHNFZTg2TzM3MUlW?=
 =?utf-8?B?aDR6enhNR1JlTnRQbmoydnBTMS91bjF5WTdoVTRDL1hCVlhaM2JBb0NSeVU3?=
 =?utf-8?B?b2I0NUNPVjJSZGd2QURUZkhhZXBMYWsyK3g5UktYQXBES3VhY0JjSnJvUTFR?=
 =?utf-8?B?Q25rZGt0SXVwbzJnby9UbVZLbGJhcXpRMytCN2p6UWtNQlJuOC9zNWdlZU03?=
 =?utf-8?B?dE1NOE1LTWNsSUNNMmZoc0tEWk16MURxTVowOC81OVRaeWlvNC9rWGptc3hx?=
 =?utf-8?B?amdaYXI4eEptUzJoMjNTUE8rN1BITzEzSnc5QTJpMU81NlFPdXhnNXBZY3la?=
 =?utf-8?B?cWMyUkFJQThLc2YvOURQSVhYaU5EZWZxcFVrZmlMUnMxQ3R6Ty9FNW5VNTJY?=
 =?utf-8?B?ai96bEo3QzBNTW5veGR1NWQxT3l3ZVJWUkVJRUhyNEpnWHphdUY4aWNycjNN?=
 =?utf-8?B?NWpKaGtVNjkwR1lmVWIvVzgrZm45RGkycHVmQ2VBRXVrOFdiNE9iWEM3aklD?=
 =?utf-8?B?SGxqSWFWLzY5QlAzdndBK0xKNUVVMld2YlF4S3hiVDd2V0QyUE55b2wwQmhT?=
 =?utf-8?Q?TOXqcibfslFCw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TEZhdU9mMnpKbGM2SVFRVFBRLzJmQ0xwd0pkRnJrdmVJNWFrZlR6QnVvWko1?=
 =?utf-8?B?eU5mVWZ5TjYrQkRxaEtDVk5qUWFvWTBHUFpUUHZhU0htdUFlWmZiTkdzdks5?=
 =?utf-8?B?aCtRVi9NMW1yclJmd0VXZk1nTU0yMERETTNLVzdzdXZaeVpTaUdncTR6ampa?=
 =?utf-8?B?cUFxRDJNTy8raDJPZFZUUi9ZTnpWMTZpTVdoTkRhd295a1o4SC9oSk5iRnFl?=
 =?utf-8?B?UFBGYkJzajBKcTBibC8ySjJNTHJaQnFUNFpZWjduZysvclJYSmZFeHdOUEQz?=
 =?utf-8?B?YlZ2SnRhaWk1R0N3ZE5QaUZsZXhsY3JERFZ0Qk5JY2JYVzlEeEFaNGxpT21F?=
 =?utf-8?B?eFNZZTI3cHk3alQ5VENwRExnSGdUR3NtRnd6cXdSNkN2VEY0RFlyTXZWZitJ?=
 =?utf-8?B?endyNlVaNnRBQXF0aUxMUWdWR1pZKzd0WWdBdmVLekRNMmJIT242OGUzMTR5?=
 =?utf-8?B?VjRIaWU0QmExOS8wYk9GQTgyenFEUk84eWlTZmdUZ0RLMlpBc0V2NzFncFNm?=
 =?utf-8?B?QlFBcDAvQ2ViV2pDVG5RcGFJMU5KT3E5Q3VBNjJyODJETGdOQWJCMG5jWG1I?=
 =?utf-8?B?SEFuKzE5REtjblkrdFZKeEtvUVhITHNiUHQyUkJ4MDVCa01MVkxSNHloL2VJ?=
 =?utf-8?B?eTdManhNS1hJdld2NVVtRWNPNSs2dG1nVldrcE5Mb2xrZmw4dS9KaEliYWdI?=
 =?utf-8?B?ZzFtKzFhZnlrSUNwWXNXQVhaSWQrdmNCUG9SQmJsdk85RmdmTzB5RFRCUUI1?=
 =?utf-8?B?WVp2K3g3TUlOVW80Mm42TXBuWjYrZWFVbHpQdXRmaHZPc3krcXd5MDJDMzZu?=
 =?utf-8?B?S1dCODZsRTZZSkVxa2VERFVKekRZU0dNS2tncC9aY1JKQmJ2dTkzQ2hEd0Ju?=
 =?utf-8?B?c3cvejNvZkxPbEZtdGtDak9NV0g0dnYrVXUyNGRzc2tkYnZJMlRoMUNIWnMz?=
 =?utf-8?B?Zjk1Q1NqUWdkUG9wQXVCUGZCRUhRSHN1L2tNTGJLU20rRVp2bVlBWC8zdytz?=
 =?utf-8?B?d0hITmdDUkVRTnc3NWNTdTZXM3R1ZFlHaWdMMGU3Qk1RWjB6TUhhNzVNMUVq?=
 =?utf-8?B?VmtzTzRiak5xc0I3VFo2OXl3WGx1NVhBU3dHeUZIbmpEMEVaMVprc1ZrS0JK?=
 =?utf-8?B?enFhbXJGVkk4dDZZL3ZENFpMbnVadlhFUGNMY1NMV1htamVZR1M3d0FNNEhJ?=
 =?utf-8?B?WVZBT1VydzdlQ2d3UlUzYktpMFRNcGI3WWYwWUwvRnBUV1FHU1B5aVNJaXd0?=
 =?utf-8?B?aURpdkhqQkpOeW5nSEZYUkZJTlAzMml0RGJoUGtLSHc0dXZEVXM0Y1JBN2Nj?=
 =?utf-8?B?MUhFeDlqSU9NMm5zdHNUTHFzYlRvWjlacTVxY0c2ZUYySlhXZVNlQWl5T2Zo?=
 =?utf-8?B?Ym10VEs1cnZDM3puK1hLRDFROUtSUitpcmFrZHBMNzJhMm5uY01WOGpVbldj?=
 =?utf-8?B?WjNrbmZMMUhtZ3ByNUxDb3p6SFlQRlRFSnprZk1tQ3duRWhGRGpWWVg3V3VJ?=
 =?utf-8?B?eG5tQmc0UEFqVXRwK2dZb0ZZa0Y2cFk3YlJxZHh5NGo0ZXVCZkQvb3FjbjdY?=
 =?utf-8?B?NC9jTnpwYURKQ1FQRW5Yb0hNRXAxRjdxWTFjVDdKVGxROVNKSmEvR3pMY3Fu?=
 =?utf-8?B?alVScndFeTRvVFQ1SVdjQUx1QUNMYlpBVDRIdTRUbjJZNm5xeGs2MlNCcUZT?=
 =?utf-8?B?OFlDMGUvMk9uazdMTVlZdDNYZldwMWdqeDZaN1JBeUNCdjVJeFlCbU91bXBo?=
 =?utf-8?B?SEZJYTVkMEJZMmMzbC9IcXFXZ0U3SWRFMzhMR0hHSWRteFZmSzBNdjM5TS9w?=
 =?utf-8?B?WjJQSGNTZWVNN1llOXhIV0dJaExjcnVucXpsMC9rSnRtYmpvUXluL2RHaWxQ?=
 =?utf-8?B?ZU1xdjlVd2V4WDR2eWhQZE50Rkg3RXZ1SG00SkNNeGFyOVgvbHNpWEV3d3Fs?=
 =?utf-8?B?dFRqeE9zWjJteEtxN2pOTzlOVGxlUHNzQXJPTlgzMXB5UmpUUGlxZnEvRzFp?=
 =?utf-8?B?aml0dHEzMWFKbkdqTDdwSFJidjZWeUFqaGlrckIwa2xETkNCRlZTRE1aU0dR?=
 =?utf-8?B?WTZoRGVkZ3NrbkxVQUp0cWJ0WEhVNVFqd2hhSWxaSDlSS1B4anRFT3A4NE9G?=
 =?utf-8?Q?8RebrfDCDP/hU/hfUOGyU3Xdp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 39cd029d-584b-49e0-4ff6-08dd688d2c6c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 15:29:30.3445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6wgQveHTsDQWmVSCYkekzOXNigmY7gSe+LmsMnS/1YgLQMPI0xFkZXv7vWGxbb4Pq7LSwvcnU0ZGgsOsLr3Bwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9352
Message-ID-Hash: 46DMYCVB3B4VF7BNSK4XBDKPUPBVBQJL
X-Message-ID-Hash: 46DMYCVB3B4VF7BNSK4XBDKPUPBVBQJL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/46DMYCVB3B4VF7BNSK4XBDKPUPBVBQJL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 3/21/2025 07:25, Syed Saba Kareem wrote:
> From: Syed Saba kareem <syed.sabakareem@amd.com>
> 
> Update Quirk data for new Lenovo model 83J2 for YC platform.
> 
> Signed-off-by: Syed Saba kareem <syed.sabakareem@amd.com>

Here's a few tags for this.

Cc: stable@vger.kernel.org
Reported-by: Reiner <Reiner.Proels@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219887
Tested-by: Reiner <Reiner.Proels@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index bd3808f98ec9..e632f16c9102 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -339,6 +339,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
>   			DMI_MATCH(DMI_PRODUCT_NAME, "83Q3"),
>   		}
>   	},
> +	{
> +		.driver_data = &acp6x_card,
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83J2"),
> +		}
> +	},
>   	{
>   		.driver_data = &acp6x_card,
>   		.matches = {

