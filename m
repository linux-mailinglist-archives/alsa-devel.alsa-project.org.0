Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A310CA64332
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Mar 2025 08:18:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AC2D60329;
	Mon, 17 Mar 2025 08:18:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AC2D60329
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742195898;
	bh=WPy+o/ZBZzL4z9Gs+gbRbC1P15ZMy0uChAIIaRxGGsI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I8PwgxqeAbrYFWKCrV3eShaBZSKKBIDKwXPXWoS216rsHWHi+kPYGHXZWhdf2Pq7T
	 TE7iR/A1jf0hFMWvZNp5bXloak7HrpSZzbLrWhAW8/Dtxnt+xAb0lUm7yJLhC3x1VI
	 wDjYJsHR/mTGfasRhuyLuuGl4AM6/5M8DHx6CrjQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A27F5F805B4; Mon, 17 Mar 2025 08:17:43 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D4E8F805B5;
	Mon, 17 Mar 2025 08:17:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 399CDF8055B; Mon, 17 Mar 2025 08:17:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70B49F80212
	for <alsa-devel@alsa-project.org>; Mon, 17 Mar 2025 08:17:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70B49F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=HddYq0MH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E/eanyiUewUw0EylU09/ofwj6qQ3ID1C/VuiD0593mY9WRuwA073FXIrYiMKaGpz4J6NYba6pjnE6ly7OtpaRYdFJtaW6ZZ2CiJfN6HAHEsz3zmTNlBmn0K3X2pkxEHHtYhlx0or7tV6mZwy1ndNYrgbXh+dwgaB+qNOFGrHYnCDUnPh6jycaTjWhAnZ/VzuexXTCua+eku3181TZv92vus3qkKh8Ky7ybtH31g81D522Pr8N3jFCHo/OPafP+3yPNfiFMoLzbd43+sSe7RVROfrJBV6IFxrm5iOecg6tSqAz0phmq/TQGoMwZoUGmYErUx97h6Q3Q6nwUC2hGRYCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e61ObnbpjoISsk/90AFWAp/YV+rT3WjvCK4Osbw172k=;
 b=xEe76Y4XF68qpmJ/19JKo8j3Kz9eRzVVv/Fzo8IqN7jFw4f1b5oLT7yJ8DM07yVe2mU6yAMe4ib4zugbGknJ8GpvO39Ga7/SwtUDGIgxnVUTC3bFBl8fErRCzKotOl5CDdgVdZS7sMtEXR5nf/bxNWLjbmjblrGFmM7FPZU3vibgCwMuOQREhk5AzBifpE6mk1tco/GfcOo00rrAxkrDEBRBUNkzJxjypkchoJlYI1Lw5Lwd/CFzDy1zWnEuMuqmGC1ECe7xlAMf9xRNQw/4dl/N6z5Wwy9/2jFSDbR77nBvKcyyF2oyYhLO7cZ/Cbb3tX1xnrYT1wJJs5yrXPjEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e61ObnbpjoISsk/90AFWAp/YV+rT3WjvCK4Osbw172k=;
 b=HddYq0MHCjrWZSxBR70nnRRWlqyny/e3+Ob0s6BPqZLo0x0XE6SnBPhRaEk8KeMOf7sf6kWiY0MW7+5f9MV/rUxN8wIpY3iBV6CKLD8BZX4LgaVBhpF9xuLKL34ADvJCPstEgavhoOzIwL3ZYmc7q/PqsyLlGuco/N/0u3/W2Dw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by DM4PR12MB5916.namprd12.prod.outlook.com (2603:10b6:8:69::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 07:17:30 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0%4]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 07:17:29 +0000
Message-ID: <2e5f5663-62af-42f6-af29-83905485ecd0@amd.com>
Date: Mon, 17 Mar 2025 12:47:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/14] ASoC: amd: acp: Refactor acp machine select
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
 Mario.Limonciello@amd.com, Vijendar.Mukunda@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com, ssabakar@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Greg KH <gregkh@linuxfoundation.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Peter Zijlstra <peterz@infradead.org>, Murad Masimov <m.masimov@maxima.ru>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250310183201.11979-1-venkataprasad.potturu@amd.com>
 <20250310183201.11979-6-venkataprasad.potturu@amd.com>
 <20250313155255.GA2477963@ax162>
From: potturu venkata prasad <venkataprasad.potturu@amd.com>
In-Reply-To: <20250313155255.GA2477963@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0251.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::17) To PH7PR12MB5951.namprd12.prod.outlook.com
 (2603:10b6:510:1da::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5951:EE_|DM4PR12MB5916:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b901582-a6ed-49f3-8f81-08dd6523c72c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UXVlanl1Y3RTdi9hbHdDdmxFZld1eWl4UFRJVUM0MW1YVlAwTzlzbmVEYnN4?=
 =?utf-8?B?N3g3RWFkZjRKeklVcHZwbVFNTE5KRytTT0JpUUdTbVo3cC9WOVUyYkdpNkR6?=
 =?utf-8?B?Q2QwNHV0ZlZsTTNtN2JHMGc3UEhWTHcxUTB4SlNKTFkramQ4WnlIbmcxOWMy?=
 =?utf-8?B?dnBOZDh1NXkrb21NSm1iWkRJcTZnUGZHaE1lbmFOQUJmam5rRitFd09VVldU?=
 =?utf-8?B?ZHd2WWh4U1YwajNuU1ZEWkN2cUkrYW1HKzEvcDBvQmhZSlFyMVhrZlJVVWRs?=
 =?utf-8?B?QmRrT0lpK1NvYnZhUVdJUnNRK2NyN2RxSVMyMTlFaWtKU3d2YXp0NDhSbklJ?=
 =?utf-8?B?aFMzZm1helJISW45VFl5NDFGQVc5ZHR6R3VsZm51ZlhSbWZHY2Z4TkVuejBk?=
 =?utf-8?B?c3VOU3ZwekxSSHhKU1JmRlJSMjFrTjNCcjl3VjdYamFUZUpIYm5VdDdjeFc3?=
 =?utf-8?B?aWpQZUo0OG5xZkxtRDBtVCtpVUZyc0FnT2tNcDJrQWJpR3lWcDJ5Yk80ME1Y?=
 =?utf-8?B?YXpPdEpiK0tTbE9DTDVYdTg5OFo0dmR6L3ViSzZyTnV2UUhmY25TTkVuTWly?=
 =?utf-8?B?TWhDbnoyNlFKcTB4VzNwZUVUUFVMWnl2Ry9iU1V6WURjMGRpVlVUbTF6eUxN?=
 =?utf-8?B?Q0Y1aHVZNmsvTkxmKzhabjhHNmkvdlhwMnE4dmVObTNra1QxMUVqeGp5N1Rt?=
 =?utf-8?B?b3BTQ1IvQUdyMStuK3pLQlkrYldvUHdncmpBczFQeFB5L0dFT1FkRWdmcWgx?=
 =?utf-8?B?SGZaeWxLNDFaa2NRL1ptSm03VCtVKy9UM3RmS2RvcG1ST2MvKzcvSUdBY2RV?=
 =?utf-8?B?ZDZNNVhXeWhtM056dzN6SUhtRXFpZ1l6LzNuOTJIREtEd2lwZ01lZVZpbE1m?=
 =?utf-8?B?V0ZVM2k0eEV3Tng5OUFLSHY5N09zck1oaGRaekY3WmdmWG05dGdVRnArY20v?=
 =?utf-8?B?dVAzZTUzQ3pkUFQrelpuZTlBUWtuWUExdnZ3ekRQSWZndDJheGViS1hlV29o?=
 =?utf-8?B?dEFUeWJYS20rNHV6cm41cjJrd2Rram5Ld3lGOFhEaUhwK3V6dE5jQ2ZQOHcw?=
 =?utf-8?B?QWUveG1RZG5qNnlyRWNXMkpCcDl3elhzbVY0ZEFXK3JXTVZrRUNSZEM0WmZq?=
 =?utf-8?B?M2FmajBQay9aaEpyT2N6Ny85VytMaS84cFBJVGJQL2tlQVhxSGFtdUVHL3dw?=
 =?utf-8?B?Zmxpenduanc0bko1NEU4WjlEUEh1cnVoUXdhRzREMzAzbTM2eDB3b1JNcnVP?=
 =?utf-8?B?Qk1nWUxMcDF5NTRpc1NBZUVTVi9lZ2xiTVpkaG1rV2dSUTRtMUZzL1VFYnFN?=
 =?utf-8?B?OXVraXp5NFg5WkJQS2NOUExxTXkrRmJLVVk4cWxPdzViNzBHUE9aV1g1MDB6?=
 =?utf-8?B?U082K0lwZHgzUE13SU5rZThUOWZsZXJIQ1pBL0lHYWFuRDdONjBvRy9yRGpZ?=
 =?utf-8?B?Y0FyMVhKemJRY1FSZ2lvdHRWK2RhTitzcEhuMDllSWJNVXhwTVZXb283c1A3?=
 =?utf-8?B?VDZhQnBRTTIxaW45MU9acDZvbVhnRjNKQzVEZnhkRm16TlJuNmptWW1oUWxK?=
 =?utf-8?B?ZGplWGoxQk8wcFlFWER4T1NkK01lT0ZMUkRDU0JaZkdWVVFQK29MR1FiSDht?=
 =?utf-8?B?RGkzOUFraFlhanR3ckVTNjQ0QlBqUm9lTHVFbi9wbzlYVmI0QkkrT0NyRTBr?=
 =?utf-8?B?S2ZnSWxrZ0FzMVJacGVDVFlMWGk0ZVdXMEkzZ1ZBVGpQb05OeGFPcE1ZbDNF?=
 =?utf-8?B?ZUI4ZEovQ3IxSVZYYUo3ZHlWTUxKNXdOb0ZQNjN4d1grNk5yWHN3d1dtUmVH?=
 =?utf-8?B?a0ZKNTcya2ZEbko2dlRNT2lXVEpmWXlnVVVBdXJIdmdjZkJtL0VIQkJzbEVY?=
 =?utf-8?Q?6ew2C6uSrVJ3w?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5951.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VUlPek5EOEp1ZnFUeDV0dG50WnhvTDlyVWNBU2FBZElHY2V6ZEhnNVJvOEF3?=
 =?utf-8?B?WWRxV3Bldmo4WG5CK2hkSHhUUE5VMXJPOENXeTl2TUdLeGN6Z1RTbHh5NE9w?=
 =?utf-8?B?bmxuUDAyWXRHTXdSK0V4bXhwK3Uzaks4dTJGcVdsNWtUdVAwY05PNllvRFky?=
 =?utf-8?B?azM5T3RDYnNiWkE3YzRIM3NkR1BXTEtkYzdmaDZzNGFIQUdkbG1wYjB1V0F3?=
 =?utf-8?B?SGN0cmVkeEkzL00zcE5LN0NpYVZ0VTg0VzZZL2ZEOFpDRnVwQ01vNDJTYlMx?=
 =?utf-8?B?MFI1YndxM3Z0bWNWd1VMVlZnWWh0QTNOZFVKNTUvR2ZBengwSEhWdGU3bElT?=
 =?utf-8?B?S1FHYmpoelNHcm9vb1Y1WXZEdkRWVXJ1MGp6elFMdEtBVmdPWGR0U2hVb2JH?=
 =?utf-8?B?RWRCbElIbm8xclkzRmFGN21NWUhwc0ZoYU1YQW15ck9tVXBJS05EckF4UkY4?=
 =?utf-8?B?ei9KTzhxY0pwK0Q2aUhKUEJ5cTB1ZzlZNWIxWGpIVE9lWEFxTksrWldmRHJC?=
 =?utf-8?B?TUwxS29jSEFNaTJseVNBSllJa0c2SmI4dnVHaENmRHFEQ3dwWVFWTDduSXhi?=
 =?utf-8?B?MCtxNDMyd0JMZHF0M2lzMTk1S01ZV1lGbkV6VE5DQ1lyaEVlbWlsZWl5RFFK?=
 =?utf-8?B?bTM1OThXV2IzYUNxaTdtVUFNazNSTGZzc3hSMFQvQ0NYK29uKzRLTC9zQnJJ?=
 =?utf-8?B?MTdmZW1lV3RRZEZBd0RlWk1Cb1p2cUFCci92TDVHNVZvUDJWTkJtQmN0V0l6?=
 =?utf-8?B?NXFrc2R5UUpWczJSaXhva3BDQTBNS3Q0WTAzM1MrVjFvWnp6Yis3VmRpWVJR?=
 =?utf-8?B?UnNMdUlHaDZsUVUvN1lUaUltT2lCeW1VV2QyaXRFaWhpNzdKYVZSSDNUZ1Rz?=
 =?utf-8?B?aWtlZkNDMnhqSFVyWkMvZHN2WDFkRkE3L2F6M2VnM0RWei9NSUwxUWR5encw?=
 =?utf-8?B?d2lUM0dTK01tTDZ2UysyRDgzWUtSTlpWdU9vTkdac1VYM053OWhibDJ1bkMy?=
 =?utf-8?B?Z2NKUjRRcE1XNENLYjE0K1VCTCtqVXBBZ3JrSFIycTJxRSt3ZTNTQ1lvWFNa?=
 =?utf-8?B?TE9ZK1J5NHpMNkxqVnl5a29QV0RLblBJbTB5MmpiUnZQUzB6amx6WVZaWDdT?=
 =?utf-8?B?a1hQTGZSc2d2bnFGR2tHVUV2Z01DMko3d3N3V0V3UkZNK0V2LzZUTjNlWVJC?=
 =?utf-8?B?eVU5aVo5K21OVHlWcm9lSHpCSU82QzBVYlYzMTU1VTRldHYrdDZtRkZFRVE3?=
 =?utf-8?B?UzRQQ3VIRjFERy9OYXk1THhJdzlMYStTVi9zYlZTYU5nc2RZUnR1SnozYno1?=
 =?utf-8?B?ODhjVVBSdTBnOEtMQlB0VlozL0R3TURlMUJyQ2dEbTE1WXZxbTB5YXVUR0Y1?=
 =?utf-8?B?ZkZnNlhJaHVtNEcvTWREY1lpYXZpL0pkQWV3bUhEUmVySnI0MGJmdDVOY2Ra?=
 =?utf-8?B?M2N4MEVFS1lHZzBjNHlWWDNlL29XZ1pwUWRzaFlhdEJqZitnMmNhVVFkOXJv?=
 =?utf-8?B?bm41b0xFM2tzTFJTTk51clhNV0FTQzhGcTFkTkdkQ3NzbDFydTRQeS9iOGJT?=
 =?utf-8?B?b25zVXJhUFFRYUxYRCtmcHZOWlNzT0t5YXJVcVZDWjNTcldkYWJzbHlUTzR0?=
 =?utf-8?B?UnlJQWxHa1VVM3dMSkN2eVFncnFlTjRSTFl5Zm4xQlRWQmFrYW41OUQrVE1w?=
 =?utf-8?B?UWRSZEo3SmkydlhuK2VOUVEyVjNFYTFyN080d1NwNnhVcWYwZEg0dXNTNTZB?=
 =?utf-8?B?c00vN3pxSGFDbU9BRk9Rb0NOT1J6QVhyRVEwZmNFeHJUeEFCUHQyZEVseGtH?=
 =?utf-8?B?OWtkTnl1YjdzUTl0cmp6VDdGQlRESk4vYmx2WXVMWG9KSzUzOHhrdFp5aTB4?=
 =?utf-8?B?bFh1OElReFhkNVUxUWlNbXpMdjZYbTNRSVBhYWpTVHI2Rnh3QXd1VGFLazBz?=
 =?utf-8?B?UitGMU5OVUlVaVd0eWJTSzBKRUpLTExCUHNUUGdRazA1VlJleGtmM0NrZTEw?=
 =?utf-8?B?L3FOY2UzR0lWemlLdEpGQU1raVlxWEdUejhKeHdLTU8vNkhtWmVaNTBaMGgy?=
 =?utf-8?B?dFdQd1FGK21rSWF5NmFPZTdYK2s2TXp6Y1VkdjMxcDdBZCsyd3FJUnI1bzUw?=
 =?utf-8?Q?hv7uUshu1FspFZH3cyLi4KhBb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7b901582-a6ed-49f3-8f81-08dd6523c72c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 07:17:29.9139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KzSXoEbgCPfujVGFwTSmnhhaa3oEk712foKUdSMJTz+b6t+s4/BBmOBwuxbhzFpxtCNfJYhCHJny/+cm0gSpDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5916
Message-ID-Hash: 3MX2PLFW32E62SJXKU4LK4ZSAFTZRKXS
X-Message-ID-Hash: 3MX2PLFW32E62SJXKU4LK4ZSAFTZRKXS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3MX2PLFW32E62SJXKU4LK4ZSAFTZRKXS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 3/13/25 21:22, Nathan Chancellor wrote:
> Hi Venkata,
>
> On Tue, Mar 11, 2025 at 12:01:52AM +0530, Venkata Prasad Potturu wrote:
>> Refactor and move acp machine select function from acp platform
>> driver to acp pci driver and assign platform specific acpi machines
>> to chip->machines.
>>
>> Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
> ...
>> diff --git a/sound/soc/amd/acp/amd.h b/sound/soc/amd/acp/amd.h
>> index be1aa405a14a..b7a1b4aa8fef 100644
>> --- a/sound/soc/amd/acp/amd.h
>> +++ b/sound/soc/amd/acp/amd.h
>> @@ -149,6 +149,8 @@ struct acp_chip_info {
>>   	struct platform_device *chip_pdev;
>>   	struct platform_device *dmic_codec_dev;
>>   	struct platform_device *acp_plat_dev;
>> +	struct platform_device *mach_dev;
>> +	struct snd_soc_acpi_mach *machines;
>>   	u32 addr;
>>   	unsigned int flag;	/* Distinguish b/w Legacy or Only PDM */
>>   	bool is_pdm_dev;	/* flag set to true when ACP PDM controller exists */
>> @@ -195,7 +197,6 @@ struct acp_dev_data {
>>   	struct list_head stream_list;
>>   	spinlock_t acp_lock;
>>   
>> -	struct snd_soc_acpi_mach *machines;
>>   	struct platform_device *mach_dev;
>>   
>>   	u32 bclk_div;
>> @@ -245,13 +246,89 @@ enum acp_config {
>>   	ACP_CONFIG_20,
>>   };
>>   
>> +struct snd_soc_acpi_codecs amp_rt1019 = {
>> +	.num_codecs = 1,
>> +	.codecs = {"10EC1019"}
>> +};
>> +
>> +struct snd_soc_acpi_codecs amp_max = {
>> +	.num_codecs = 1,
>> +	.codecs = {"MX98360A"}
>> +};
>> +
>> +struct snd_soc_acpi_mach snd_soc_acpi_amd_acp_machines[] = {
>> +	{
>> +		.id = "10EC5682",
>> +		.drv_name = "acp3xalc56821019",
>> +		.machine_quirk = snd_soc_acpi_codec_list,
>> +		.quirk_data = &amp_rt1019,
>> +	},
>> +	{
>> +		.id = "RTL5682",
>> +		.drv_name = "acp3xalc5682sm98360",
>> +		.machine_quirk = snd_soc_acpi_codec_list,
>> +		.quirk_data = &amp_max,
>> +	},
>> +	{
>> +		.id = "RTL5682",
>> +		.drv_name = "acp3xalc5682s1019",
>> +		.machine_quirk = snd_soc_acpi_codec_list,
>> +		.quirk_data = &amp_rt1019,
>> +	},
>> +	{
>> +		.id = "AMDI1019",
>> +		.drv_name = "renoir-acp",
>> +	},
>> +	{
>> +		.id = "ESSX8336",
>> +		.drv_name = "acp3x-es83xx",
>> +	},
>> +	{},
>> +};
>> +
>> +struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_acp_machines[] = {
>> +	{
>> +		.id = "10508825",
>> +		.drv_name = "rmb-nau8825-max",
>> +		.machine_quirk = snd_soc_acpi_codec_list,
>> +		.quirk_data = &amp_max,
>> +	},
>> +	{
>> +		.id = "AMDI0007",
>> +		.drv_name = "rembrandt-acp",
>> +	},
>> +	{
>> +		.id = "RTL5682",
>> +		.drv_name = "rmb-rt5682s-rt1019",
>> +		.machine_quirk = snd_soc_acpi_codec_list,
>> +		.quirk_data = &amp_rt1019,
>> +	},
>> +	{},
>> +};
>> +
>> +struct snd_soc_acpi_mach snd_soc_acpi_amd_acp63_acp_machines[] = {
>> +	{
>> +		.id = "AMDI0052",
>> +		.drv_name = "acp63-acp",
>> +	},
>> +	{},
>> +};
>> +
>> +struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_acp_machines[] = {
>> +	{
>> +		.id = "AMDI0029",
>> +		.drv_name = "acp70-acp",
>> +	},
>> +	{},
>> +};
>> +
>>   extern const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops;
>>   extern const struct snd_soc_dai_ops acp_dmic_dai_ops;
>>   
>>   int acp_platform_register(struct device *dev);
>>   int acp_platform_unregister(struct device *dev);
>>   
>> -int acp_machine_select(struct acp_dev_data *adata);
>> +int acp_machine_select(struct acp_chip_info *chip);
>>   
>>   int acp_init(struct acp_chip_info *chip);
>>   int acp_deinit(struct acp_chip_info *chip);
>> -- 
>> 2.39.2
>>
> I have not done a formal bisect but it seems like this hunk introduces
> build errors when certain drivers are built into the same image
> together, as these structures will be externally visible.
Thanks Nathan, will send a fix patch.
>
> $ make -skj"$(nproc)" ARCH=x86_64 CROSS_COMPILE=x86_64-linux- mrproper allyesconfig vmlinux
> x86_64-linux-ld: sound/soc/amd/acp/acp-i2s.o:(.data+0x3e0): multiple definition of `snd_soc_acpi_amd_acp70_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x20): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-i2s.o:(.data+0x580): multiple definition of `snd_soc_acpi_amd_acp63_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x1c0): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-i2s.o:(.data+0x720): multiple definition of `snd_soc_acpi_amd_rmb_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x360): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-i2s.o:(.data+0xf00): multiple definition of `amp_max'; sound/soc/amd/acp/acp-platform.o:(.data+0xb40): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-i2s.o:(.data+0xf40): multiple definition of `amp_rt1019'; sound/soc/amd/acp/acp-platform.o:(.data+0xb80): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-i2s.o:(.data+0xa40): multiple definition of `snd_soc_acpi_amd_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x680): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-i2s.o:(.data+0xf80): multiple definition of `acp70_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xbc0): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-i2s.o:(.data+0xfc0): multiple definition of `acp63_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc00): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-i2s.o:(.data+0x1000): multiple definition of `rmb_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc40): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-i2s.o:(.data+0x1040): multiple definition of `rn_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc80): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pdm.o:(.data+0xa0): multiple definition of `snd_soc_acpi_amd_acp70_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x20): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pdm.o:(.data+0x240): multiple definition of `snd_soc_acpi_amd_acp63_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x1c0): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pdm.o:(.data+0x3e0): multiple definition of `snd_soc_acpi_amd_rmb_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x360): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pdm.o:(.data+0xbc0): multiple definition of `amp_max'; sound/soc/amd/acp/acp-platform.o:(.data+0xb40): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pdm.o:(.data+0xc00): multiple definition of `amp_rt1019'; sound/soc/amd/acp/acp-platform.o:(.data+0xb80): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pdm.o:(.data+0x700): multiple definition of `snd_soc_acpi_amd_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x680): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pdm.o:(.data+0xc40): multiple definition of `acp70_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xbc0): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pdm.o:(.data+0xc80): multiple definition of `acp63_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc00): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pdm.o:(.data+0xcc0): multiple definition of `rmb_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc40): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pdm.o:(.data+0xd00): multiple definition of `rn_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc80): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-legacy-common.o:(.data+0x1a0): multiple definition of `snd_soc_acpi_amd_acp70_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x20): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-legacy-common.o:(.data+0x340): multiple definition of `snd_soc_acpi_amd_acp63_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x1c0): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-legacy-common.o:(.data+0x4e0): multiple definition of `snd_soc_acpi_amd_rmb_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x360): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-legacy-common.o:(.data+0xcc0): multiple definition of `amp_max'; sound/soc/amd/acp/acp-platform.o:(.data+0xb40): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-legacy-common.o:(.data+0xd00): multiple definition of `amp_rt1019'; sound/soc/amd/acp/acp-platform.o:(.data+0xb80): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-legacy-common.o:(.data+0x800): multiple definition of `snd_soc_acpi_amd_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x680): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-legacy-common.o:(.data+0xd40): multiple definition of `acp70_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xbc0): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-legacy-common.o:(.data+0xd80): multiple definition of `acp63_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc00): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-legacy-common.o:(.data+0xdc0): multiple definition of `rmb_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc40): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-legacy-common.o:(.data+0xe00): multiple definition of `rn_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc80): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pci.o:(.data+0xe60): multiple definition of `rn_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc80): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pci.o:(.data+0x860): multiple definition of `snd_soc_acpi_amd_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x680): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pci.o:(.data+0xde0): multiple definition of `acp63_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc00): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pci.o:(.data+0x3a0): multiple definition of `snd_soc_acpi_amd_acp63_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x1c0): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pci.o:(.data+0xe20): multiple definition of `rmb_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc40): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pci.o:(.data+0x540): multiple definition of `snd_soc_acpi_amd_rmb_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x360): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pci.o:(.data+0xda0): multiple definition of `acp70_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xbc0): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pci.o:(.data+0x200): multiple definition of `snd_soc_acpi_amd_acp70_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x20): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pci.o:(.data+0xd20): multiple definition of `amp_max'; sound/soc/amd/acp/acp-platform.o:(.data+0xb40): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-pci.o:(.data+0xd60): multiple definition of `amp_rt1019'; sound/soc/amd/acp/acp-platform.o:(.data+0xb80): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-renoir.o:(.data+0x360): multiple definition of `snd_soc_acpi_amd_acp70_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x20): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-renoir.o:(.data+0x500): multiple definition of `snd_soc_acpi_amd_acp63_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x1c0): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-renoir.o:(.data+0x6a0): multiple definition of `snd_soc_acpi_amd_rmb_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x360): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-renoir.o:(.data+0xe80): multiple definition of `amp_max'; sound/soc/amd/acp/acp-platform.o:(.data+0xb40): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-renoir.o:(.data+0xec0): multiple definition of `amp_rt1019'; sound/soc/amd/acp/acp-platform.o:(.data+0xb80): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-renoir.o:(.data+0x9c0): multiple definition of `snd_soc_acpi_amd_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x680): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-renoir.o:(.data+0xf00): multiple definition of `acp70_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xbc0): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-renoir.o:(.data+0xf40): multiple definition of `acp63_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc00): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-renoir.o:(.data+0xf80): multiple definition of `rmb_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc40): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-renoir.o:(.data+0xfc0): multiple definition of `rn_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc80): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-rembrandt.o:(.data+0x4c0): multiple definition of `snd_soc_acpi_amd_acp70_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x20): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-rembrandt.o:(.data+0x660): multiple definition of `snd_soc_acpi_amd_acp63_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x1c0): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-rembrandt.o:(.data+0x800): multiple definition of `snd_soc_acpi_amd_rmb_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x360): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-rembrandt.o:(.data+0xfe0): multiple definition of `amp_max'; sound/soc/amd/acp/acp-platform.o:(.data+0xb40): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-rembrandt.o:(.data+0x1020): multiple definition of `amp_rt1019'; sound/soc/amd/acp/acp-platform.o:(.data+0xb80): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-rembrandt.o:(.data+0xb20): multiple definition of `snd_soc_acpi_amd_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x680): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-rembrandt.o:(.data+0x1060): multiple definition of `acp70_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xbc0): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-rembrandt.o:(.data+0x10a0): multiple definition of `acp63_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc00): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-rembrandt.o:(.data+0x10e0): multiple definition of `rmb_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc40): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp-rembrandt.o:(.data+0x1120): multiple definition of `rn_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc80): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp63.o:(.data+0x4c0): multiple definition of `snd_soc_acpi_amd_acp70_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x20): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp63.o:(.data+0x660): multiple definition of `snd_soc_acpi_amd_acp63_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x1c0): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp63.o:(.data+0x800): multiple definition of `snd_soc_acpi_amd_rmb_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x360): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp63.o:(.data+0xfe0): multiple definition of `amp_max'; sound/soc/amd/acp/acp-platform.o:(.data+0xb40): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp63.o:(.data+0x1020): multiple definition of `amp_rt1019'; sound/soc/amd/acp/acp-platform.o:(.data+0xb80): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp63.o:(.data+0xb20): multiple definition of `snd_soc_acpi_amd_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x680): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp63.o:(.data+0x1060): multiple definition of `acp70_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xbc0): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp63.o:(.data+0x10a0): multiple definition of `acp63_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc00): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp63.o:(.data+0x10e0): multiple definition of `rmb_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc40): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp63.o:(.data+0x1120): multiple definition of `rn_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc80): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp70.o:(.data+0x420): multiple definition of `snd_soc_acpi_amd_acp70_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x20): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp70.o:(.data+0x5c0): multiple definition of `snd_soc_acpi_amd_acp63_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x1c0): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp70.o:(.data+0x760): multiple definition of `snd_soc_acpi_amd_rmb_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x360): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp70.o:(.data+0xf40): multiple definition of `amp_max'; sound/soc/amd/acp/acp-platform.o:(.data+0xb40): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp70.o:(.data+0xf80): multiple definition of `amp_rt1019'; sound/soc/amd/acp/acp-platform.o:(.data+0xb80): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp70.o:(.data+0xa80): multiple definition of `snd_soc_acpi_amd_acp_machines'; sound/soc/amd/acp/acp-platform.o:(.data+0x680): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp70.o:(.data+0xfc0): multiple definition of `acp70_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xbc0): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp70.o:(.data+0x1000): multiple definition of `acp63_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc00): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp70.o:(.data+0x1040): multiple definition of `rmb_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc40): first defined here
> x86_64-linux-ld: sound/soc/amd/acp/acp70.o:(.data+0x1080): multiple definition of `rn_rsrc'; sound/soc/amd/acp/acp-platform.o:(.data+0xc80): first defined here
>
> Cheers,
> Nathan
