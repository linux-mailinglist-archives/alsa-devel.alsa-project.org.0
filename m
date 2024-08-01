Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9FE9446FA
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 10:49:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A97D36C8;
	Thu,  1 Aug 2024 10:49:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A97D36C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722502175;
	bh=jcVBW3ay5FAsNCZXb0UJUz6AodNM3+CqxStPmpoNXIU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kU6IrgA5PrxHzfbPXGhR4FwY7E8IV37+nUsA/v1qXQcc+n+ldmK9FgsJq6waqGNyW
	 dGdApU/s9lw+aMzV8hL/gRpQuN8scaJ8QFNlXwdisb6DYEq4Lnt9/NBcYLmC3ahGrd
	 mMjs/AKIxtiucLJD5wl+N0jdgmawfhy98V76Glow=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7F44F805E9; Thu,  1 Aug 2024 10:49:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 241C0F805E9;
	Thu,  1 Aug 2024 10:49:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8FB5F8026A; Thu,  1 Aug 2024 09:10:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CB70F8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 09:10:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CB70F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=pMFnsDgf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOnlFEsJYq+w3fgjoiYA1e4wcejpN7VmpHKQ7JN3Mz78GpeMjSH5Frl1dm6irz013WAxmNrQtlVcfVznvIbb1wFgFg0+cM0se1TyvSVl6rM8rjTwFBWcKKWMSH8y+MgdnRVpP0kLP04E6B8o74oprTKnqs5hb7vLVfkR1Uoyr8bIMkVEkXG/tdH298o7E/66KgyK/DFQGnS1Tod8NQxktupflIhfYWjMlkDbEP3Eoqf+PP/uM5tUzqdKawIQWKe8hLLNji64Eav66+KRc4Nt5bIUfXYhhcxkuXasZxLk6G5M6YgChfV71spc2L1IN7o21/e1QR6hMLDpbXPOEA4hGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIF8hAnu8/0scofCfQiVf1SlfMoxRu2KEOZAGWYm+Qo=;
 b=Vwt+KJfqOziuT+UC+Qkzc84p4aPrtyJBePv//2Qzh25DH8pZwGW2MLjBVDJiJgarP1T/HiRUN+UbPpnTgg0soeq/u8Ke4zBVSkawwHuI6jLDhAoaTRA6YTGqHr7OylAyAgLYMvDbLTCm8UziPDqGHRv4lZNGXUeg/K+RfKwTaho/Mz2hhw1mISADDow4gGTFC1qKvpGNsZ5wngJ9b+AtRXwTt0iFHZWCoBWTG/CCNpqFXqT5s60sOuw3UWWpKMOjhrveTXKfw2BPO4zDGtoBZvaIan4hL5hFTXnST6ywUyOOTzN0S7be1sbc5XK+dR+2u5MJxLTm+5yK+WWn71q09A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIF8hAnu8/0scofCfQiVf1SlfMoxRu2KEOZAGWYm+Qo=;
 b=pMFnsDgfV6mSwEuRF+6MZH6LcV9YOvExtckc9Mdez3InaROI1zL7wn7OJcxhqxnDjp9xXJo1BCTWHCq0uGrd717RzkmlIaheiJML73+OeEDFWFZ2Mggc1BxmMeyiHAOwinsqtSNnjOUTyJ+0kZfG4K8ykabVU0gZ8IirdX9uf5k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4120.namprd12.prod.outlook.com (2603:10b6:610:7b::13)
 by PH0PR12MB8152.namprd12.prod.outlook.com (2603:10b6:510:292::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 07:09:59 +0000
Received: from CH2PR12MB4120.namprd12.prod.outlook.com
 ([fe80::6922:38fe:2b1c:7055]) by CH2PR12MB4120.namprd12.prod.outlook.com
 ([fe80::6922:38fe:2b1c:7055%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 07:09:58 +0000
Message-ID: <c8c86058-42d3-4950-97ce-b1859f6e42b5@amd.com>
Date: Thu, 1 Aug 2024 12:39:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/31] AMD SOF based generic SoundWire machine driver
Content-Language: en-US
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com
References: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20240801062416.2203673-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PEPF00000182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::52) To CH2PR12MB4120.namprd12.prod.outlook.com
 (2603:10b6:610:7b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4120:EE_|PH0PR12MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7c1e2f-96b9-4d5b-b119-08dcb1f8f3ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V3FmZzFmbTBVTFRneFdSWUhXSFgzMlpHOVB1RWRTSlNQcit5S0Q4L2RSQzFW?=
 =?utf-8?B?bzByNVFYY0lOWmZRVTZOdUNsL2NwQU1wRTlRTnZoRCtXQWI1Ym85RDRWbHB5?=
 =?utf-8?B?SjhuZlBtWm1LOGx0aU1xTnp2NXQ1aGIybEZVT1dTNWdhOEZSUHk5WUFxSm1Z?=
 =?utf-8?B?cG9XQkpQVCsrU0ZicDl5ZWFBOFFnb2JXT3lCZXY1dUY3RzZ5ckJZT3M3aGYx?=
 =?utf-8?B?MnF6NFdaWmxyNFlETGh1YkR4aFdXU2lwb0lsNzVHQ3o4bGtEZFU5bzNJaEc4?=
 =?utf-8?B?cy9vMXU1SjFyZHZvZFl3UDJRdWVIeWdldVJ5eGRmY1J3alhITGZ5Z0F3SGVy?=
 =?utf-8?B?SDUwcmJJNlVvSEo3SG5kY1JiZ0pYck5jTDNTRDFhaGc2OEdKdWpOZDZpUTBP?=
 =?utf-8?B?bWYzRG5LeW9JR1F1a1NEVk1MTFNkcTU5aTFra3g3VkRiM00wa2EvTzVNNnBI?=
 =?utf-8?B?QThsSG03U2MrUm1pWHJ0ZCtSRU02dmttRitwckdEcmlLUnY5eW1aR09EdkJ4?=
 =?utf-8?B?cDNNeGRUYTZZNG1mS3Q1MUFRNzF2cE5XRUdwUGJrc0FEam82bk1jRHhpSG42?=
 =?utf-8?B?WFF3NGYybVJzdnB6MWxGZGtzbnB4akE5RmJZbUlHN3B6Mllid05HNmZrdllO?=
 =?utf-8?B?YkVVY01qWHlrOXFXVXMxSko2RlJBc0ZVTmZ4Y09oSkliYjFmU2dhQUdKWTBo?=
 =?utf-8?B?UmNGKzVYdTlybDNxVS9EZ1ZhLzdkc0syM2pUbU04WWZJRnBzZHZiL2F6NVhN?=
 =?utf-8?B?dGRib2d6VndnK2Q4UUV6S0JSWHRxKzlvbmxyT2lyQUoyK0E1UjJmd0NnMXJV?=
 =?utf-8?B?TklyYnRnMDRQMTBybmZVTkxJbG1jWlArQW5JWHFLdHRRaXBxWnZFYXJHcVRY?=
 =?utf-8?B?d2VqR2FvOHllNGlVODdidUxqTG12M1FVb0loRVM4cVNOdzBKZkQ2c2pLYjVl?=
 =?utf-8?B?cXQ3THk1R2RHVjNDRkIvc3Mvd2pseFlkU1ZMQWwzYXVMWUc2THAxT3pJN0dT?=
 =?utf-8?B?cGFRNHhzREwzZ0RaVEw3N0FYUkxBUHhiOGhZRTlscDZNSFk3cDZ3T2I5emhD?=
 =?utf-8?B?SzBPOFdnM0N4OGxqNWV3Um9hSCtXQjhNK1lDZmNtYng1d3lnLzhqZlk3SkRH?=
 =?utf-8?B?NTJPM3ZyMDdyNUxGSDhqUnE3bzNSR3hBbzdmdVVkdkRBN0dOejNwQXd5OEt0?=
 =?utf-8?B?Yk9RalF1YkdOaFN0OTY5YUJQWUN1N3RuVlFPVnd6Rk1pNWJnRUFWcW9LL0xi?=
 =?utf-8?B?RVpyUFZlNFluQ2xVVllIV05kVmRNZExZdFROcktKaVNtaDhsUWhNT085QUc3?=
 =?utf-8?B?K2dlU0xtR0dKa2dhcFdVbjNzZnFRdTRGbjdPamVDSVhkZXl5NnBmRDhJK2FT?=
 =?utf-8?B?VlpnMWEyY0V2bHhKaUZtekR6ZHpjUE9pVzlyWXZzbXRESnc2eXpRQVFSQlN2?=
 =?utf-8?B?YTRrbkxuWURNSTNoK09Ka0hNdGlvMHRMajFpOElNWHdDcEpJaUt2RmdvcnQr?=
 =?utf-8?B?TllNNFk0bGZlQ3hFSWk1QXB6YXNJd0xBSmgxbmtBanFjQzJnSXFiZDdJTFp4?=
 =?utf-8?B?WXF4dTg2ckxsdTlTRzNHdjdLN1E4SVVXVEdBTUZyd2k3NVNDdUxNS1dLc284?=
 =?utf-8?B?NWdoRW9uQkExaU9PZHE3TWM0VWhERlBrdUlISHlYU3VHRnYwNXJKTUJ1Nm5u?=
 =?utf-8?B?VFFyZkR5NGxrRmg0QmQ5eFh1NnpuLzM1UjdEVkNQcmxJQXEzU0c1OUl0VEJo?=
 =?utf-8?Q?3RmY4ku96xyW4L0658=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4120.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?STBqcm1pcGtnTDBmUnV6NGVLS3dOQ0YvNGxsVkQ1UG9lcHg5bmtoMndBNkVF?=
 =?utf-8?B?Y0JtWkdGWXdqUWJkcmFia2ZNN3ZwbTFEaFFjamZ3TTNwa0tOamYwT1B6TmYv?=
 =?utf-8?B?bS9iS3R5SFRTWEIzT09XZGNXajQ5a21Tclk0RzJQa3VvZlZaQjVneGR3QmZT?=
 =?utf-8?B?T0xBMFZILy9ROHlUdllGR0syTy95bDUveXZUQWpmK2cwM1k4WlJJR2h5WlNP?=
 =?utf-8?B?TndMZFRVYmxvYkJ5SE54eWErNU1sYXE4SmU4ZE92R1FUb3pSTE5yS25lTFEv?=
 =?utf-8?B?Zjh6SnJHakEycW1XK3Q2aDIyNnpQYlpJUEJKWk1qaXhmQmJiaklJVTZqWGdQ?=
 =?utf-8?B?eTYrVWNCdjNSOXZrTEV2Q2ZvNmR4elZ0d0MvYWRnNVBTTjhvVGU5Ry9xMG9U?=
 =?utf-8?B?eWlsY2U4L1hQNDcrZUk4eHQvSUJHTFNxcXRBN2JXek5CY3FXNjVwUGdJUXo5?=
 =?utf-8?B?RURxQTEzU3BDL3FQMDY3RWk1YmhVZWNCQVVDU3hUOGJPV0VwOU1VeUJSd2p1?=
 =?utf-8?B?WVF3czlBT3h4cWdnb1BEMzFVLzZCdTRmTFZlZ0NtKzZablZKQ29IM0Nia2Jv?=
 =?utf-8?B?bE4wRFo1ZFUwWlhPWFBzQllZd3RZb0x0WlduNDRENk5PM2Z5bkErbWJuSWtr?=
 =?utf-8?B?b0QzbHc4VlMwU1NRc2JUYWt3Rlk2MUtYZzQwenBXdEt3RGJ3U3QxUHN3WDlz?=
 =?utf-8?B?MlU5L2ltTGdJOU5URHFvQnQ2enl0SmZidGpiY0hkckc5eGZWUmlSWGg2T093?=
 =?utf-8?B?dENZS1RDRlh0dng5cGVFRndMR2dvM05nRzA3NFJtUnZpd1R4STR6N0NvV1dQ?=
 =?utf-8?B?aytKODZ5Y1RyenJiRGtnRWZRTkhTYkZodEsvMDF3ZkVuZEdvOXV3aGhiWUhl?=
 =?utf-8?B?T0FPY1BueVBiY0tpUzRwNVJLTW9VdEt6RE5aZk82TVZINm9LemhPY0xCMjhF?=
 =?utf-8?B?bU0vV3lQV3l5Ykh1dEZmWThVN21CNGNBM2JBUlBqcDdKZ01VTEFUaDZPcHFB?=
 =?utf-8?B?a2svTHlkM3hmWDRPVXVHTUF4OTd6YlN5U2s0aC9DVkVUS052Nlhnbk1LMVJa?=
 =?utf-8?B?MTVCcmNlVGlWN1ZYd3V0dzFWZXkyR1ZINXlBeHFFVko5KzlLeSt2ZHBGZXZo?=
 =?utf-8?B?RllkSlB4c2lZZmY1ZFZKMXkrbTlqdFd2T3IyWG1wUXVEcXhMUk94TUhxYXZP?=
 =?utf-8?B?SEo3bG9mY296WHhpTmxsQlkzMVhHTXRPTEVTTWlUWXhyNUwzZjR0SHlSQzhY?=
 =?utf-8?B?WWh5V2FSVW01YnhFdHlFVkZibnIrTlphQkYwVkRLN0Y2dEIxSytGMVByQ3Nm?=
 =?utf-8?B?bXJPRHBzTzBtb0FWdWJPOTlFdEM5alNQRThrQjlUaE9Wemk2Y0EwT2Uwcmpz?=
 =?utf-8?B?aHNOcXdVNDhBNWlwK1d4MmJCeWdHd051YWFLWWJrenFURG82bFBnNHUwWUZq?=
 =?utf-8?B?Qy9oMVBCWUFDT0l3TVM3SnpmSzkzcDdIR0dRb1dCSHcwOXRrclJCb0pHUEF6?=
 =?utf-8?B?MVEzRjlYQ2Q0eks4cTNqUnJsanI2NGxrcWthSTFCaVB2OUNzSmdmdzM5Y1dM?=
 =?utf-8?B?VHYyYlc1MHYrV0E0cWt6WkhCcE1BY0lJL0NKQnpSUkVxZjlzd1k3aVJhcFNV?=
 =?utf-8?B?NFBBQ29EVTZLM2JqZ0k1ZjNsSmF6RUV0VFpyM1JqVVNyWVIvZUlXdUdWdjNT?=
 =?utf-8?B?Y1pac3I0VlpqN1MzbG5GUnBuUUZneXJTREtSSjhmaG9Hbk8zajhSamxYL0Fn?=
 =?utf-8?B?L0VaK3pOMzRXSnp6U2RDZEhscGJpYUJTNnU4L0JlYjlCRzFMMUd4am95WWJI?=
 =?utf-8?B?WWk4NEFnMVVNc2oxMFBsUW1SOU85M3RITXhackpuMWMvYm9WcFBiSmF1dWcr?=
 =?utf-8?B?RUxaZXQzTzNJTTFHOEZ5SGdCaDNiZUxhQzZRUkJTUHpLWHBBYTdaakQ0cndw?=
 =?utf-8?B?bjZZYUJ6bEF2VDhFSHRTY2d2dXJZcUZCM2s5SkQyOHppSU9XNmtyNXVtMm4z?=
 =?utf-8?B?MnNzMzgwOTZTUi8xSnZDQzdoTzZaQzF1RlcwMHlyWEFiYXduZnJ5WjVGRHJy?=
 =?utf-8?B?c2hxWkp2T0pPVTFzZjNqZnd4Vit1RE1aS0pKSmk0UlAveXdkVngzN0FKNXF0?=
 =?utf-8?Q?iGPb5do9UvW1haBLg3gvLFdX7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fe7c1e2f-96b9-4d5b-b119-08dcb1f8f3ef
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4120.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 07:09:58.7771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Mr6s+SpI8fjcFa9Dw0dUzIH0wFn4UkGfeaT77dZ+EJyojXapBgEiOiFPs33J36Q2qNx/edWqTo3OnlOCFjhrrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8152
Message-ID-Hash: W7ZSUCXYN7YA7K7QIEGVQFYKNP3DV7ET
X-Message-ID-Hash: W7ZSUCXYN7YA7K7QIEGVQFYKNP3DV7ET
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W7ZSUCXYN7YA7K7QIEGVQFYKNP3DV7ET/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 01/08/24 11:53, Vijendar Mukunda wrote:
> This patch series majorly consists of below changes.
> - Rename structures, macros and codec helper names used in Intel
> SoundWire generic driver to make it generic.
> - Move Intel SoundWire driver common structures, macros and codec
> helper functions to common placeholder so that it can be used by
> other platform machine driver.
> - Refactor few SoundWire common codec helper functions.
> - AMD SOF based generic SoundWire machine driver for ACP 6.3 variant

I am able to send 21 out of 31 patches for upstream review.
Connection time out is occurred while sending patches through
git-send-email.
Could you please suggest ?
Do I need to resend the patch series again?

-
Vijendar


>
> Link: https://github.com/thesofproject/linux/pull/5068
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>
> Vijendar Mukunda (31):
>   ASoC: intel: rename codec_info and dai_info structures names
>   ASoC: intel: rename soundwire common header macros
>   ASoC: intel: rename soundwire machine driver soc ops
>   ASoC: intel: rename soundwire codec helper functions
>   ASoC: intel: rename maxim codec macros
>   ASoC: intel: rename ignore_pch_dmic variable name
>   ASoC: intel/sdw-utils: move soundwire machine driver soc ops
>   ASoC: intel: move soundwire machine driver common structures
>   ASoC: intel/sdw_utils: move soundwire machine driver helper functions
>   ASoC: intel/sdw_utils: move dmic codec helper function
>   ASoC: intel/sdw_utils: move rtk dmic helper functions
>   ASoC: intel/sdw_utils: move rt712 sdca helper functions
>   ASoC: intel/sdw_utils: move rt722 sdca helper functions
>   ASoC: intel: split soundwire machine driver private data
>   ASoC: intel/sdw_utils: move rt5682 codec helper function
>   ASoC: intel/sdw_utils: move rtk jack common helper functions
>   ASoC: intel/sdw_utils: move rt700 and rt711 codec helper functions
>   ASoC: intel/sdw_utils: move rtk amp codec helper functions
>   ASoC: intel/sdw_utils: move cirrus soundwire codec helper functions
>   ASoC: intel/sdw_utils: move maxim codec helper functions
>   ASoC: intel/sdw_utils: move dai id common macros
>   ASoC: intel/sdw_utils: move soundwire dai type macros
>   ASoC: intel/sdw_utils: move soundwire codec_info_list structure
>   ASoC: intel/sdw_utils: move machine driver dai link helper functions
>   ASoC: sdw_utils: refactor sof_sdw_card_late_probe function
>   ASoC: intel/sdw_utils: refactor init_dai_link() and
>     init_simple_dai_link()
>   ASoC: soc-acpi: add pci revision id field in mach params structure
>   ASoC: amd: acp: add soundwire machines for acp6.3 based platform
>   ASoC: SOF: amd: add alternate machines for acp6.3 based platform
>   ASoC: SOF: amd: update mach params subsystem_rev variable
>   ASoC: amd/sdw_utils: add sof based soundwire generic machine driver
>
>  include/sound/soc-acpi.h                      |    2 +
>  include/sound/soc_sdw_utils.h                 |  216 ++++
>  sound/soc/Kconfig                             |    2 +
>  sound/soc/Makefile                            |    1 +
>  sound/soc/amd/acp/Kconfig                     |   22 +
>  sound/soc/amd/acp/Makefile                    |    4 +
>  sound/soc/amd/acp/acp-sdw-sof-mach.c          |  742 +++++++++++
>  sound/soc/amd/acp/amd-acp63-acpi-match.c      |   90 ++
>  sound/soc/amd/acp/soc_amd_sdw_common.h        |   44 +
>  sound/soc/amd/mach-config.h                   |    1 +
>  sound/soc/intel/boards/Kconfig                |    1 +
>  sound/soc/intel/boards/Makefile               |    9 -
>  sound/soc/intel/boards/sof_sdw.c              | 1142 ++---------------
>  sound/soc/intel/boards/sof_sdw_common.h       |  166 +--
>  sound/soc/intel/boards/sof_sdw_hdmi.c         |   14 +-
>  sound/soc/sdw_utils/Kconfig                   |    6 +
>  sound/soc/sdw_utils/Makefile                  |   11 +
>  .../soc_sdw_bridge_cs35l56.c}                 |   56 +-
>  .../soc_sdw_cs42l42.c}                        |   13 +-
>  .../soc_sdw_cs42l43.c}                        |   38 +-
>  .../soc_sdw_cs_amp.c}                         |   18 +-
>  .../soc_sdw_dmic.c}                           |   10 +-
>  .../soc_sdw_maxim.c}                          |   56 +-
>  .../soc_sdw_rt5682.c}                         |   12 +-
>  .../soc_sdw_rt700.c}                          |   12 +-
>  .../soc_sdw_rt711.c}                          |   38 +-
>  .../soc_sdw_rt712_sdca.c}                     |   10 +-
>  .../soc_sdw_rt722_sdca.c}                     |   10 +-
>  .../soc_sdw_rt_amp.c}                         |   32 +-
>  .../soc_sdw_rt_amp_coeff_tables.h}            |    6 +-
>  .../soc_sdw_rt_dmic.c}                        |   11 +-
>  .../soc_sdw_rt_sdca_jack_common.c}            |   40 +-
>  sound/soc/sdw_utils/soc_sdw_utils.c           |  990 ++++++++++++++
>  sound/soc/sof/amd/Kconfig                     |    1 +
>  sound/soc/sof/amd/acp-common.c                |    3 +
>  sound/soc/sof/amd/acp.c                       |    1 +
>  sound/soc/sof/amd/acp.h                       |    1 +
>  sound/soc/sof/amd/pci-acp63.c                 |    1 +
>  38 files changed, 2475 insertions(+), 1357 deletions(-)
>  create mode 100644 include/sound/soc_sdw_utils.h
>  create mode 100644 sound/soc/amd/acp/acp-sdw-sof-mach.c
>  create mode 100644 sound/soc/amd/acp/amd-acp63-acpi-match.c
>  create mode 100644 sound/soc/amd/acp/soc_amd_sdw_common.h
>  create mode 100644 sound/soc/sdw_utils/Kconfig
>  create mode 100644 sound/soc/sdw_utils/Makefile
>  rename sound/soc/{intel/boards/bridge_cs35l56.c => sdw_utils/soc_sdw_bridge_cs35l56.c} (63%)
>  rename sound/soc/{intel/boards/sof_sdw_cs42l42.c => sdw_utils/soc_sdw_cs42l42.c} (82%)
>  rename sound/soc/{intel/boards/sof_sdw_cs42l43.c => sdw_utils/soc_sdw_cs42l43.c} (73%)
>  rename sound/soc/{intel/boards/sof_sdw_cs_amp.c => sdw_utils/soc_sdw_cs_amp.c} (66%)
>  rename sound/soc/{intel/boards/sof_sdw_dmic.c => sdw_utils/soc_sdw_dmic.c} (71%)
>  rename sound/soc/{intel/boards/sof_sdw_maxim.c => sdw_utils/soc_sdw_maxim.c} (63%)
>  rename sound/soc/{intel/boards/sof_sdw_rt5682.c => sdw_utils/soc_sdw_rt5682.c} (82%)
>  rename sound/soc/{intel/boards/sof_sdw_rt700.c => sdw_utils/soc_sdw_rt700.c} (81%)
>  rename sound/soc/{intel/boards/sof_sdw_rt711.c => sdw_utils/soc_sdw_rt711.c} (70%)
>  rename sound/soc/{intel/boards/sof_sdw_rt712_sdca.c => sdw_utils/soc_sdw_rt712_sdca.c} (74%)
>  rename sound/soc/{intel/boards/sof_sdw_rt722_sdca.c => sdw_utils/soc_sdw_rt722_sdca.c} (68%)
>  rename sound/soc/{intel/boards/sof_sdw_rt_amp.c => sdw_utils/soc_sdw_rt_amp.c} (87%)
>  rename sound/soc/{intel/boards/sof_sdw_amp_coeff_tables.h => sdw_utils/soc_sdw_rt_amp_coeff_tables.h} (97%)
>  rename sound/soc/{intel/boards/sof_sdw_rt_dmic.c => sdw_utils/soc_sdw_rt_dmic.c} (70%)
>  rename sound/soc/{intel/boards/sof_sdw_rt_sdca_jack_common.c => sdw_utils/soc_sdw_rt_sdca_jack_common.c} (78%)
>  create mode 100644 sound/soc/sdw_utils/soc_sdw_utils.c
>

