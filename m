Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E356EA176FB
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2025 06:27:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8538660357;
	Tue, 21 Jan 2025 06:27:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8538660357
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737437244;
	bh=A5SmihSgbg4DiBNi8QpYPo+xTus2YqYH2SLsr/YxMSg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lY6yevB/9KCJKI36w40nD7G6h3dxOLUxfN9k1XUxTA2v6xoOfVhza/4QdauXw5+0+
	 mQdpJ9sqx7pDg2uwCkFaGwyZDwHAlQyUff5O1SqEPVFkI5qwcJa2WqwzWe5IE4Ehzh
	 j5h3deJI3uAMJ41NZUcb9bKQrtyLpIwywABSpXpA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C952F805B0; Tue, 21 Jan 2025 06:26:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 245E6F805BA;
	Tue, 21 Jan 2025 06:26:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 146D1F8032D; Tue, 21 Jan 2025 06:26:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F3FEF800F3
	for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2025 06:26:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F3FEF800F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=BuBAKqDf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYNf5roX04CmM2uEBZGyXqCUZzIzuifau9yWEQyCxWF9v0Y1Bn60TdV4t3173HlA7j/9dxeHbThZ0H+P7lFZxLzniDIk6cvLrbNDEnLMO2ewkFyHRPtCy7f639ddab1JK1GV9lp3yrYNb/dr5Q9zyV/sPxo0RNW3syFs3M2UcIdwtDe24e+pEa0vtP3M9zHQto84nN5cXtwobZyjOw/ALkJOzDDjxpRJgM/bWYpDMhAUWrkGsDHaujbGB8AGs4qMchG/t8Fh+bLdVxCjBIQySWjP+pxduAOtUZ+d4wk2O8TiMGKJwd5Kx0S7tk5N10IghiaBLdQoCoODRaxnCIrwHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lY26GqTrkMIjInEmhoNRbPkC6yG/Evqs4Gv5LcRFqSs=;
 b=f0CMxi57kR1YOkpJ6gmKUsV7pn5kaNUDLpFcgpC/HGGvJDfVMfD2QQqJfeMJRu7r8P4+5tVx3JRhq4WhfzdEjOITmBvMv1wi5CR4o4mYUIvu+BMIVRWVnwdWFT04uT/zW7v5mN967vQmDCubyEb7EI2zb9kv5gl49+x2debjtzYcB7OzRfHq28wfJPP09APMdZ/4DLkXihSyVUME3KeLsr1HR0OlauVIOEd2yuYyHL34t9n8832mya77rEeujwZB+4lBSOiMXk3/d9S1wr0OIf7iSBqqt3LeqB38YKMDyUlsB3bhwft/rESv0siwQUNqLGQyZY0o9l7lkLHuDnSqLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lY26GqTrkMIjInEmhoNRbPkC6yG/Evqs4Gv5LcRFqSs=;
 b=BuBAKqDfjQarb7pQJBccc2Jss3gXOqTlgY6GlHKm9rm8i3Ok7Ngl9wEhBn+z8jwhpQore7p7rXrHbl9tuhVIcy9W9+F8G8NlHTXam4ZLNnU0dTdkSFrY+0G2X4dEpkIVD6MBlDMY/d/ppQwzYPmHvmf19KYZ+8cZWgAnhIq9WF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4120.namprd12.prod.outlook.com (2603:10b6:610:7b::13)
 by SJ2PR12MB8978.namprd12.prod.outlook.com (2603:10b6:a03:545::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 05:26:31 +0000
Received: from CH2PR12MB4120.namprd12.prod.outlook.com
 ([fe80::6922:38fe:2b1c:7055]) by CH2PR12MB4120.namprd12.prod.outlook.com
 ([fe80::6922:38fe:2b1c:7055%5]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 05:26:31 +0000
Message-ID: <2ab354e0-339e-448a-957d-4226781a7621@amd.com>
Date: Tue, 21 Jan 2025 10:56:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/7] soundwire: amd: add conditional for check for
 device resume
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, vkoul@kernel.org
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Mario.Limonciello@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250120101329.3713017-1-Vijendar.Mukunda@amd.com>
 <20250120101329.3713017-4-Vijendar.Mukunda@amd.com>
 <7e363634-b80f-4ae7-8d09-1bb07225eecd@linux.dev>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <7e363634-b80f-4ae7-8d09-1bb07225eecd@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::15) To CH2PR12MB4120.namprd12.prod.outlook.com
 (2603:10b6:610:7b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4120:EE_|SJ2PR12MB8978:EE_
X-MS-Office365-Filtering-Correlation-Id: 855c8af5-b177-4ac3-6cb5-08dd39dc29f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dEk1Y2EyVHBFcDBiUTlvamRiNE1mUlAvYVRxRXJYTDJ5SlA0b3prRUgwVzZV?=
 =?utf-8?B?SzcyUFZNaXdRZlhqNlFZUkRRbVJZcG9VMHI0MlpEb2l3T29ZbVhxSDREN1Y4?=
 =?utf-8?B?UVAxL001UXNsVTEwc2s4alk3cUd6dHpTeHNDQkVpaFNFWVVOeFNUeWZIcnVG?=
 =?utf-8?B?d1NDMG9UblZHczIzVzFPUDUxQjFRWkViQ1JFd0puSnk4Wnd6UWJJdTVhUnFP?=
 =?utf-8?B?cUg2VU01U25CTFl5VUgwcFFJRmREWWZGUW1uUlBFZVY1ZE1DSkdLdU1xVnlu?=
 =?utf-8?B?MUoyc1p2WTlHUkp1NHp4ZHB3SjBXdkJmT2VxbWR5OS9GczNzaFF5RnJVb1ZP?=
 =?utf-8?B?Z1VqaTNJbi9JanFpd1pCTEczWWlnU29DNjVWWXdURUY0cGdKTitzaXUxTFhP?=
 =?utf-8?B?U0ptVThjTGhsbVA1c3h3dk1NRHAzU2NFMmRVZEZ3KzB4Qis3bFdnK0pDVkM1?=
 =?utf-8?B?Z0QzUDhCS2pkZ3ErYXRxUFJYcGtmU285cGFIN2NqaXhkS1hUci9sdFhGZUx0?=
 =?utf-8?B?c1dCVE5tNUM5UGFCelFDZjR3VTlFcjlzdFRmN2I2NmxGVmYrcC9LVG9YTnF0?=
 =?utf-8?B?bjVtSUVzZ3dFNjJFR3dBOC9WYkZ5bHgyTmtsUzhYQTJZWDN6dTEwcExMUDg4?=
 =?utf-8?B?bXZNR2d5VzU5aUlTUzFIZmxKM2JCdlFMTTkyY29PcE92YnBhSWZGZk1aNS9M?=
 =?utf-8?B?RWNXQXN0K3lwN2NnNUxjV0x3amxJOWR3TW1GMnhOa2xuQzFJT1JkM3B3aGNT?=
 =?utf-8?B?QTVPUUJIT3VzSEpENnZNQ3pzaklNVVFOSFZpZzlrUWJWSHZUSGV4b0oyd1Jw?=
 =?utf-8?B?ajQ3YVo5QytYWFI0ZFVBTS91ckJIWkVpZWhpb2tBUFZYdm14Z0JoWFZ2R011?=
 =?utf-8?B?N0FrbzJjV29jNHExUC9KY3JjT09PWG95ZWY3K2FlMjVFU1lYYXRuWks2Y09I?=
 =?utf-8?B?S244MTBJdjRKNGRDM1l1SEE5RnN5dXRGZDBsWndOdlJjcHU5OHlyQnJJRFhB?=
 =?utf-8?B?UGFsMGFTU2VxTjZYQXU2ZjNma2hWRmM5Qk5sVVhBeVV3ZFFya0wwUlpqSTVO?=
 =?utf-8?B?Wjc5KzROUEtwVE9IWG9ZR3hHd2ZZa2ZjMnhET3Qyd3JsV2RRT1lya1A1V1pD?=
 =?utf-8?B?eC9GTSs4NEo5b21WbXQvOW1GNmNhZGhsWGNDV2JpaEdvNkVtWC8wRGE3UERG?=
 =?utf-8?B?dzYrbWpaRHpaTno2TkljODFSL3FIOWhGZEk1Z2d5SC9RbWplRkNNREJ6NGVS?=
 =?utf-8?B?VnZZTmJ3Ymo4UmhqMzNwK0UwU1ZTY0ZKM0xiOFVPVlZGVWtwU2RiYXJzV1Jh?=
 =?utf-8?B?cHZ1eVRIaWd4SzIxNGlPYzNabTB3UnZPLzlZMFJUNVVocS9rbVlSMHlkYmJl?=
 =?utf-8?B?Q1BBc0c5cFdNaW9oUkVMTUFuQW05STBlZXJFbENlQmZra1cwT2J0L04ydjNN?=
 =?utf-8?B?eHUvVHE3UG1CMHZLYzdEWEx5L0U3WEp6Q2RtTGk0SHZkM1M0dmNWMzBKRWtz?=
 =?utf-8?B?a3ByNktPUEo2Nk56RC9KaXoyZjNPUTA4MmhFS1R2ZEF6V0duMjUwNmFwZVJB?=
 =?utf-8?B?d09kdWxva2Nrc0c1VlYrVXlpd2pXMXYyL2Q1bHAzSys2ZkJFSmJ4elNQZG1Z?=
 =?utf-8?B?M2tQQUtHSStManNLd09LMHlQVDZDdTRFSmFWVXF4RW04WUxLN3dtZFJQNlIx?=
 =?utf-8?B?cnhQNlhOdW02cUl1Y3AxeExYdVNwck9QV0pCRjBYQTNhRTNTY0JHa0poWUYr?=
 =?utf-8?B?Z3FiYTNGaDNWU0lrNmFTRGJhbTFNcGhEd2ZQQS9xYmEzNkQydTNSWmFxNDQ1?=
 =?utf-8?B?Uko5aUdOU3h1NjJKV3R6MUtJMlJrK2tBWjdxVk5Ud1FYZENkcWJmRVhtcHlF?=
 =?utf-8?Q?ZD78917gzSt2E?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4120.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OHhFN09vT3FCaDlHa3NQcmtodGVQclA5cGM3N1JmOVVOQjBVcUZMNmpmVjFl?=
 =?utf-8?B?TDlFWGNrb1RTcVliVnZMZnJZMU1XelAwOXE1cHhNTnRMRDJSbzdNOXlwcnpM?=
 =?utf-8?B?WmJDTDZ5eWYzUE5wTCtFalNYRDhvbEl4YUY3SkdvMnQrdHFSeWpYWUZDTlh6?=
 =?utf-8?B?T3kyb0I1RGlBdTV0d1BmUlBUOGFZRHVJV05CVjF0TkhlVjFUcXJQYXZTOVNr?=
 =?utf-8?B?cStLK1JUanBWWUF2dERxSFdjZ0lKd0lqNVdKaWdTRWx2eXBzbFFBek1XTFpt?=
 =?utf-8?B?VTA3dDNROGhxZGxwTVhYZGFMejNEeDFTRTFFV2VQaHNoVUpCUFBERVgvQ255?=
 =?utf-8?B?WGw4VWw4cnVmM0NtTGhnMVFyZ29BeXFUSG5rN1Yyb0lNTFA5WGNJejRTTi9Y?=
 =?utf-8?B?bjNqdXVSaThydnpZaE5ySHdxT011OHFKU0VRWXRRSTR2ZmI0M1BtUXMrdEdu?=
 =?utf-8?B?dWxJQXhuZG0xaUtOdGZlTHlJTkc2TS82dHpLUXdZbzI4bFhJZVo5SklUekFB?=
 =?utf-8?B?Zy9zTVN4OWlFUmNqWTNVeDNLaWFtbTZTQlJEUllvUVdZaXNWaTBXZEJSUEpR?=
 =?utf-8?B?Z2taaUl6WVlMREs5Ti9DbVNjb3ZIa3hnWHhuUlA3V1UxREdlZngzUjVyTGtI?=
 =?utf-8?B?RmFRcHF1aUdFckdmencvQnZTM0dZbXZmVE5yK3RWNUxkU25mblJYUGYxc3JO?=
 =?utf-8?B?YlRJSzJtQkZTeU1XU3V6V0NJTndaQ3labDlpMWZkMk83V3cxNTdwYzRINUhP?=
 =?utf-8?B?TmMvMUFXeFBVdnkvaHl5WGg5MXVYMWN2ZnR3VnlvdUUycGtxUThUL3BUSUk4?=
 =?utf-8?B?ak15ZVpVK1NnaDB2ZEN2UG5oVUE4R2xHVEczeE5RZ3J2ckV6YWxicTM1clBK?=
 =?utf-8?B?Tkk1MS9CcVJRbVd0MkF1Q3pjR1VkZW45dmYyZ1RUSlJHZGxkS2Z3U1RXejI1?=
 =?utf-8?B?SmhIYmJOVUFEejBKK1k1UnkxNzh6U3BXek1kNmxza2I5aWpsNm5DMDBKcSt3?=
 =?utf-8?B?WnJpYm9lU3YrYUk1VW9IOHBuUWlZelhSd2czYUswd3NNczg5NnpSeTV3NkIr?=
 =?utf-8?B?bVdTNkszUUR4Q0RnZTNicGc3MjBKdjFyZjZ6amtWRlg5S0lPRHhucWYycEFF?=
 =?utf-8?B?REdKTWoxMjFiUVFWTU0zSjFwT0hDSnh1VVk4RTdFYlZBcThhbFpJNmZrWFZE?=
 =?utf-8?B?TmVpWDJpNkNQcVd3Ull4SmpiRlMwMG8yWDVOMzF1TGdKV05CeDFwQVREMVN1?=
 =?utf-8?B?SFRvSXpVQkI5bmdmc29zTGJuUmV2VGdKQUVJdTIrUEFqV0R3eTlmQVhZNk9l?=
 =?utf-8?B?VUJGRkJXQUo1dWZYTU9JUklqZFZQc0xFWG5sZTFLTVZYc1ZlRnRQNkMrNjdn?=
 =?utf-8?B?Y3I1MzVrSHJwaXY2SUk2SGhkZHdBaTNRVi9UOXp1Q3lZcmpKcndIMzNYS1Qv?=
 =?utf-8?B?R0MzZHFxbWRURldaQ3F6cmRUOUhCeVgrWnMwWlF1bXVsR2dGcjFkNGwzdVNm?=
 =?utf-8?B?OHpNSUY0bnlqN0ZaaU5OTjBDQ3JlWjAvL1BhWlljVHJwd2tGWG5RclZkenhF?=
 =?utf-8?B?RGl6dlJjNXdaS3ROVUVUSExsRVlBUFFjTnlzRU9WUlBoUHRTWm5sbG5PNDg5?=
 =?utf-8?B?djJ0QWtkUUR0d250MDJ5cU5CQ2oyalNFZ2hSZ1JYS0ZZQWc0UVlSUEFBRUhl?=
 =?utf-8?B?WXgrL2hJNFcyckptdlgzdTdtVTJsL29uWWVITW1aZ3hvaDg1bndDaEdmWlJh?=
 =?utf-8?B?QlUwL1E2RjBPUEN1emlmeWlpVXhTUTdIUXFwNjM5UlYzcWp2S3VhcTlLY29I?=
 =?utf-8?B?YkgyekIrTHErSnZOcW9ITDJ6dXRUVmxCUUN6S0MrM29LUUQxSzMwcUl6a1dM?=
 =?utf-8?B?S2xRUTRxQXVZS0JmNXNLZENodFJLdUhnUmlVNXZ4MzZEWmJjTVZ3MDY2ZUkv?=
 =?utf-8?B?K0ZFUzVPRXR6RlM3RTlUeTkyM2xpTXY0YXd4dCtPNnV5cDByYzRodUFjcGgz?=
 =?utf-8?B?OXgzR2tLUE96SnRPSXVXZHJvMjB1MnRpY3dtYjNhZGJNUVA0di9xTDd2clNJ?=
 =?utf-8?B?c1NVYjhwRG1CU0d0cjVScVFxdGdMa01QR2N4SFJBbGNFNHNWVkN2M05pdWVa?=
 =?utf-8?Q?8KHftDTmaDhVfCI/Wj++BhdMP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 855c8af5-b177-4ac3-6cb5-08dd39dc29f9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4120.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 05:26:31.7882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 knbmjHJsOUe4UNZjEJ72zwYL3RnMNgnZ48nA2lWW8glvOt1U4EUxTWXp1zrCKIfl86DN9oLxSt9cQJEB0zKAQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8978
Message-ID-Hash: TD22V5WPW3VSS2MKH6A7VJYJ6DE2WMWF
X-Message-ID-Hash: TD22V5WPW3VSS2MKH6A7VJYJ6DE2WMWF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TD22V5WPW3VSS2MKH6A7VJYJ6DE2WMWF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/01/25 21:00, Pierre-Louis Bossart wrote:
> On 1/20/25 4:13 AM, Vijendar Mukunda wrote:
>> Add a conditional check to resume SoundWire manager device, when the
>> SoundWire manager instance is in the suspended state.
>>
>> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
>> ---
>>  drivers/soundwire/amd_manager.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
>> index 60be5805715e..6831b3729db5 100644
>> --- a/drivers/soundwire/amd_manager.c
>> +++ b/drivers/soundwire/amd_manager.c
>> @@ -850,7 +850,10 @@ static void amd_sdw_update_slave_status(u32 status_change_0to7, u32 status_chang
>>  static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
>>  {
>>  	dev_dbg(amd_manager->dev, "SoundWire Wake event reported\n");
>> -	pm_request_resume(amd_manager->dev);
>> +	if (pm_runtime_suspended(amd_manager->dev)) {
>> +		dev_dbg(amd_manager->dev, "Device is in suspend state\n");
>> +		pm_request_resume(amd_manager->dev);
>> +	}
> Is this test actually doing something useful?
>
> If the device is already active, presumably doing a pm_request_resume() is a no-op. If it's already suspended it does something.
> Testing the device state is risky with all the asynchronous behavior in SoundWire, best to leave the state checks to be handled inside the pm_runtime core, no?
>
> IIRC the only time when such a test in needed is in the system suspend callbacks where specific action needs to be taken if the device is in pm_runtime suspended mode with the clock_stop mode engaged.
Soundwire device resume sequence can be invoked from multiple places
same time due to different interrupt sources. We have added this extra condition
check to safeguard the resume invoking sequence.
Will drop this code and retest our test scenarios.
