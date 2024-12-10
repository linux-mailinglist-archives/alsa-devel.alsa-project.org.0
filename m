Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAA49EAAD1
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2024 09:38:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB17793A;
	Tue, 10 Dec 2024 09:38:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB17793A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733819916;
	bh=oK8hK0NGqPPLFMkoGyhdZBqF8bd3C1xM3JArruzZdmk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qSMRK4ZviQDDgLnwQfoXqD9RRqUg79SyKix59qOLT2gR6yYtKtWh3CQfUXSCD5jB2
	 75vaJIf0H1pq99lX9UpjblrFsLpb2AiksG920PMRtZT1geFT1PTaBa7q6Ma7I+AY1R
	 SmYmQlQUQdRK3jfOJO4APNOV5XoW5zAzeyx4UyhI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A074AF805BE; Tue, 10 Dec 2024 09:38:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13887F805C0;
	Tue, 10 Dec 2024 09:38:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 151E3F80482; Tue, 10 Dec 2024 09:38:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2088.outbound.protection.outlook.com [40.107.96.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AA21F8032D
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 09:37:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AA21F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Lm+ZujMe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0pI7Ac0QkGsuURL02qh1+GlLS0X/YGGzcM4Gk89iYnKUQEq4L03qmOsnRcgHeDEp9EJDTY04KVVpdCUMmz9OGyDKxSCs3u/UVpOfRV6Q6sztr3Y4GKq3ybuB73haaOD5PfKKZQsnuPLtlRX7pUHl2rOG8yaZl5UzthRtMAxz6geZuB8uIHjPT2ML+E8G4roG5HpmW6kRIhvwnngzRGhjCpleq7r404F5FvNFdfVZQdCxQTKo7No4gXcIHbprsUtp/vTwr9Hl0zQ8AtuARf0Xunni+4iEsgjKsVsiV2qNT+Y452Yi5/Ffeh8fpUt5vpeos0nUcti4PQijmwcmyqc7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5FTZpgC4QxDOIJidEP+Z3jjEu0DD/oQMY89V4QuqBQ=;
 b=aVemUqh6nawC85nwHFI8+v0AgkBlp8+uz7YV+EUK4vBkgd1TO4rl20OxqJoOGwyT49ftINzHBtg+RkrzWAZT5Kwvb+Vm5SWUJ8N8k08RDSyaZmw0kMWgbMkrxxo0XqKvIDqMfPSwJz7aqSD6ynhoaL+3eKi5O8bYOJaoLatI2F2DZqcU1run1O3OGrhZKSe7nt9BHDPwSMkdRQgrDU2Ua99F52MlWBEcQXJe15VW3tPiixnvybSmcnZY5jvau9LgBUH5XTjmCbvHNRoqdSMVpC1PayulFHiBqQg7Z1658acrHuS1ciZV2JveSVqLi4UqO6zx4y+NzBu3RwMdhTUrUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5FTZpgC4QxDOIJidEP+Z3jjEu0DD/oQMY89V4QuqBQ=;
 b=Lm+ZujMe7kxy2X6X/zb08mc3wa9JsWSNvFa6iCmBQu6qKMmfpdTzXZK7+u0RF8ndJ/ll0jZ4+gSU4griRRbWWJE8rpPgEfUxriVECh4nw0sBU3Amhwpxm+h8O+PIgeVs11E3IMNn7WXhYEQFy71EReoAtMZFmKqoL3utVt5t21g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by SA1PR12MB6945.namprd12.prod.outlook.com (2603:10b6:806:24c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Tue, 10 Dec
 2024 08:37:40 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0%4]) with mapi id 15.20.8230.010; Tue, 10 Dec 2024
 08:37:39 +0000
Message-ID: <4345fd42-ae78-49cc-863d-3ba5fa0b3673@amd.com>
Date: Tue, 10 Dec 2024 14:07:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Fix the wrong return value
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Basavaraj Hiregoudar <Basavaraj.Hiregoudar@amd.com>,
 Jaroslav Kysela <perex@perex.cz>, Jiawei Wang <me@jwang.link>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, end.to.start@mail.ru
References: <20241209101320.970571-1-venkataprasad.potturu@amd.com>
 <cabca893-74f3-441a-ad27-9589819cb1f4@web.de>
 <21c58803-a8ed-44de-9211-7c8742cf5eb3@amd.com>
 <f5442b45-7dc7-4463-b87a-91381bf28bc3@web.de>
From: potturu venkata prasad <venkataprasad.potturu@amd.com>
In-Reply-To: <f5442b45-7dc7-4463-b87a-91381bf28bc3@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::26) To PH7PR12MB5951.namprd12.prod.outlook.com
 (2603:10b6:510:1da::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5951:EE_|SA1PR12MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: 97fd1cfa-12cf-4aa5-dd1b-08dd18f5e7ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NndDNUFHYUlHblM5WnliRnREUkdndjdhYjhGcm1QN1NJZ3dKb2tiQm1OeDJs?=
 =?utf-8?B?enJSd0NVRUNBNHdoTDltanJ1cFZiMVNURzNaRUw4dkw0eUtTTFhEVkwzNmts?=
 =?utf-8?B?N1RQSEtnVVhmYmlsQmE5R3R4ZmgzTytpb2NXL0g5OGU5SEJwZUZETXBXbFJo?=
 =?utf-8?B?ckFTcGE4SHg4ckRJbk9qMTZmTThiaURTSVRkV2c2eFJ3QzV2cTdpUVQ0TExz?=
 =?utf-8?B?Q1ZtUy9oRCtxcTdpdUF3Y29OTkhEeEJibzFrK3pveXhTZGt4UnRndUsyWTlX?=
 =?utf-8?B?UmNqMEc0NUZrUjBvczFkb1ovbThtNlZRenpkdG8xRURZbHBSTzB5a3FqR0di?=
 =?utf-8?B?UmNGTXYwRU9yNExvanl1b3RLVTRSTzRObVhPaCtWWXpEcDFBWHVDK2xWZmdt?=
 =?utf-8?B?dTRkWFgyTkllNXVTNldNVlQvM24xNWxFS1hlOFQ0OUNRKy9IaDA1TlNGRi9o?=
 =?utf-8?B?MW1Qb0grK1pxdWV6c3psK2VxWlh3dzRQY21SOUsyenUvRzkzTktkMHhzbEp1?=
 =?utf-8?B?UHdNSDRIVFZGb2I0SlJTMTlFS3hUYkhQQnRmWEV6MWl4K25YSHRrZ00vbWJa?=
 =?utf-8?B?cmZvOEhKcUNjaTFNL3VmMmZWSFk4TVRVdTI4THkrc1lLY2RQSTYwa0JIRlFQ?=
 =?utf-8?B?NE5uRjhtUVdxSHFKWTlQbzhJQ1NBRnBtbzdKeFRwQU1mWG1yTExqNTlHZkRu?=
 =?utf-8?B?dG1sQlZ6bE0rZ1FDZzhBalVxTWlaZFFXaHFjekUrNHJvZEhQckYreXdYNk1p?=
 =?utf-8?B?V3czK2hRcWVpZ1hWRFlRYkp4NXFnT3ByS3RWTHVLaUxGUE9MSmpTdWF1MnlM?=
 =?utf-8?B?Zlo3VWlxSi9OYXVYTlRnZE9KbVhLcU1hWERKbExnSVlIVVVYeFdBbFBJZEJh?=
 =?utf-8?B?b0dMMlBFYWtieURobHZCVmkvQVVJQVFFUzdlSUhyZmlLOURyZmdRMXRHcG1o?=
 =?utf-8?B?ZG9KRTZlQk5hdTZxQnMzcjBJYkl5Q1BEL3VqTmJ4SjRteC9tcWJJSTVVZjBq?=
 =?utf-8?B?a1lTbkY2cVdhTE14VHNhTHlrODVYYzNtdGJ5eng5d3hUUFc2YUUrVGtMbENP?=
 =?utf-8?B?WmFxZXJ4TWdpTUwwcGkyVDVlVDVFNGZJSXJxeEFPbWVaK082S05ENWdxMm5E?=
 =?utf-8?B?aUZPcGJRQmhtd2daN01wekViRnQ2ZGZZMUNTUFJKa1FjOUdybVJUQm9VWWRz?=
 =?utf-8?B?NXI4YVhyWS9sSkNXNU1NSjFLRlN6WDR4UVhnSmhmQlZiOVRKeW5UUjlhSHpU?=
 =?utf-8?B?cTltMC94VDlJV3lzMDI0QlN1QnNOcVMySHp6M09jcDhKbHR2NERqVHl5eVJS?=
 =?utf-8?B?bllxdlB0WEU1NWJnVm9jYVZEaDgwZlJuZ2lnNkREMUdXcGh0YS8yOVBJM1VJ?=
 =?utf-8?B?M0Vqcnh1RWR0QlpsR2liZWg5aWIwbzk1MHVSMDd4Z3BrVFVkbHFoQVMrMW82?=
 =?utf-8?B?U0d6RW5IMytJQS9yelhkQVdsVzR0WlM4L0RNN1RRTXJZS293RnZyN1VrbGht?=
 =?utf-8?B?TVlCK0l0MG4wUGRqbXlsVk0ySDFwN2FUS3Voc3Q0VUNKS3VONVMzbEwyeVgv?=
 =?utf-8?B?NnJ4T0VSSnNhbFFOTm95MW1rOU93SWg5ZW5RSXR0SFgvV0JlRG0wMWJEQUJT?=
 =?utf-8?B?Mk1DN01vcndCOVhTK2MyN3lXcng1Y2JhRHBSL2ZNK0xPRnlWUktLQStId1hD?=
 =?utf-8?B?anFaQ1F2dDFhNHlkeUFuZDJTLzRiSXNpbXdqMGJ4WSt2TnhLcTJYcWlQWGRl?=
 =?utf-8?B?RjVZQ1l6Yk5JNnJUZlh1ZFhzRmtyRWpEdkVrM3ZpLzYzVGFKL0tpanJHUElB?=
 =?utf-8?B?dzI1cnlMcHNYck9FaDVLZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5951.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K0VkeFhxUFVnQitHcFM1WTB1bnRvTitDVngrVHhSd293NW9hUXlXdGt5M1pI?=
 =?utf-8?B?NjZHN2tSdEJHdzJXVmUvUjJsSytWMllkOVZPYktPcWpZRUg2R3hjUW1oTmtX?=
 =?utf-8?B?Uyt1TGV6TjdKMkJpbHFmMmhzNDFPVWtrYTNlVGZua2ZVVmhmdDZzZk5mM1Bx?=
 =?utf-8?B?OVAwSXkwMVh4eEs2aHhIZWw2Z3Z2dEltYWt4UDJmWEpnTlljQmxwVGtmVFhi?=
 =?utf-8?B?UXkyYXRCSUx3ZER5MEh2NjFnQ3RaOSt6b2ZyVkxtZm1wS0V5TisrejBjUklO?=
 =?utf-8?B?WDZXOGxrMXJHSkFVS3ZOUUpyUEhjRnlZVXk4dmltd1QrRkZVODNFOWlPN1JO?=
 =?utf-8?B?TjcwRGo1VWk4VzVBQnZrUE4yd1NIZ2FwOUdHWHpDNndmQ2UzdVpVU3F2WUhH?=
 =?utf-8?B?d3J2WkNCWlVsMkthZVg0Vk9Qc3JFaHBpaGVSWCtFWWZ5c3B4UHB1OFJnVGtK?=
 =?utf-8?B?RThSazZMaXpPYTBYNjBwYlhVdU9Rb1RvWks5Y0VNbG9ZVHZ1ZXUrM1NFU2Fm?=
 =?utf-8?B?WjAyUGxNMHJtQ3YrdXA3UmNrbVhTRHIrb1BpOXZrQkhjVUs0MUdKamZMb2kx?=
 =?utf-8?B?U2NRdDhiWlhERWtPTlhHUnFGR1ZJem1KbW9kSTlkZUZHaFgzKzRwdEtJbVo5?=
 =?utf-8?B?S2R1NjFldWJYa3ZzeTFnTUpuZUgxbUY1MnRjODFyWTBRMU5jK2Fwek9FVU8w?=
 =?utf-8?B?YVZJMzFtRjA2QTA4QnBaVGxZWTJhYmZGZFdZS3U2bTNNb2F3S3cwSEh4c2dX?=
 =?utf-8?B?dHZ2VGdVUnpJUlRLOGxhREliRUUvcTFCMEdPV1NNekNrSXd5TUhxa3BEaklL?=
 =?utf-8?B?NkRpNEdxdTE0TFZCRUF3QUtzbERETVEyS3ltNFRFTXNYK1BCOUNZQnNVWWZN?=
 =?utf-8?B?T1c4ZFhrWURIWDlVVFlEZDBZcC9OZEM1SWQ3c0RlVUJHN2l1ZlNLRGtvWXdt?=
 =?utf-8?B?aUVRY3JiS0JTTklkb2xTcG5Dd0VtQ3hoYnJDcjBWaDV3OHhiTEhrUjVhNDlo?=
 =?utf-8?B?L0t2MjRKTEthbHRpSWtuWi9RbUpCQUNISTg2bXY0MHE5TGI0K3ZUU05ZcjRy?=
 =?utf-8?B?cE9FZWNMd3pMenV6THNzc1NqdGJOeUZkYXY1VUwzby9ZdkxkaC8zOWF1TmFO?=
 =?utf-8?B?WXVMMjlZeENWdjdvQXZBeXdtZkhZYnVkUTVZNEc1WE5IaCtSdnY5M3RHM1M1?=
 =?utf-8?B?eDVaTFZ6OUpJRXUrNkkyOEI3cklCdFM0cGdoNFp6Tmlqenp4SlBxbVpJcU1B?=
 =?utf-8?B?NFQ1S1gwM1JiYzVFMzBCRFh1THRQVWRITkNBZ3NuemtkcnJUZGYvdGs4NFk3?=
 =?utf-8?B?RmZ0OW5qZU9ITkJxN1pXSFA4T002aWZ0M3lYRnZFQitLWUFVY0NOc2Q4ZHk0?=
 =?utf-8?B?MXk5RjgzOTZqUndJQTA2R25URHRrWHlTMXNpNmNRTExQWFhxVWdZaVdMUkJW?=
 =?utf-8?B?Y2xOeXl5ZGNHbFhJSE94dGJyNEtTTHRKYWxLdS9HeTNMUktla1kxYnRZQmVR?=
 =?utf-8?B?dFQwOG9DTTMrYTk1bm4waTNjYlk3Z2xNendQdnBhZjlrNnk0TEpYZmlZRFNZ?=
 =?utf-8?B?WTZBazlKSmtoYlJpTCs0RFV1b2VhSVlxdVNVNzUvQjUzbVBvM1RsVlRTd1g1?=
 =?utf-8?B?eEpRMlJKTEF3dERVblVqNnBIdGxrcEhOWU95MnRaS3JHZnNHNnhsdTZLVDhC?=
 =?utf-8?B?RjRZZytSTDZYdkJjQVAzRWdHaUY2ZjBBWWhSanhGSEJGdElYeWZkTlVJM0ty?=
 =?utf-8?B?SlA0UDFScGRkbjZGc25yR0g3Y1pNcEtyWlNzV1VHbGFyOEtSTVZCOEd1L3p3?=
 =?utf-8?B?QTRuM0VmeTdjWVRpY1pDYnVmVHJ1L2M1N2s2cCtFZnlqZGYyaUQrWnoxMVVu?=
 =?utf-8?B?b0g2VncxN0kyUGJ6SXBxSWFIUFZaVWloMVBQdHJOU0dsRmM5L2c2aXNrcTZ6?=
 =?utf-8?B?ZnFLNTdVSnJ2NzBCZm9INDVDR0FzallYZ3YyeXhZalVmRjhkR3VicnE5OWtm?=
 =?utf-8?B?aWliSlUvd0Z2VXFHckNsNEYxQk13VW43QUFmckx2T3ZTcVFxMEJwQ2RuNFll?=
 =?utf-8?B?MEdIVmQ2cDhCRFZQaEVFdmJuUEJVODRrZ2JUdm9lMkdTWFF5SklkcmRiSm5w?=
 =?utf-8?Q?LPwfnCWTDOKAzUC6PbBnTOgN2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 97fd1cfa-12cf-4aa5-dd1b-08dd18f5e7ec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 08:37:39.8169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 z9mKCUs4A3d1gjwVhneuoKofy4J556lIsloN1w4t68YqjXpdZHKqyB34FflnjrRbzXMC+GRn9C7ITe013nKNgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6945
Message-ID-Hash: ZGBCGTDIZ77CVJYT56AGKOYUXTBDRKMC
X-Message-ID-Hash: ZGBCGTDIZ77CVJYT56AGKOYUXTBDRKMC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZGBCGTDIZ77CVJYT56AGKOYUXTBDRKMC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 12/10/24 12:58, Markus Elfring wrote:
>>> …
>>>> +++ b/sound/soc/amd/yc/acp6x-mach.c
>>>> @@ -578,14 +578,19 @@ static int acp6x_probe(struct platform_device *pdev)
>>>>
>>>>        handle = ACPI_HANDLE(pdev->dev.parent);
>>>>        ret = acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
>>>> -    if (!ACPI_FAILURE(ret))
>>>> +    if (!ACPI_FAILURE(ret)) {
>>>>            wov_en = dmic_status;
>>>> +        if (!wov_en)
>>>> +            return -ENODEV;
>>>> +    } else {
>>>> +        /* Incase of ACPI method read failure then jump to check_dmi_entry */
>>>> +        goto check_dmi_entry;
>>>> +    }
>>>>
>>>>        if (is_dmic_enable && wov_en)
>>>>            platform_set_drvdata(pdev, &acp6x_card);
>>> …
>>>
>>> Is there a need to adjust another condition check accordingly?
>> No Markus, not required.
> Can it be that the expression part “&& wov_en” became redundant with the proposed
> source code adjustment?
Agreed, will remove && wov_en  and then send v2 patch.
>
> Regards,
> Markus
