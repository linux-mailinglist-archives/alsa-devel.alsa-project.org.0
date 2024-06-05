Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C608FD38A
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2024 19:04:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51B85D8;
	Wed,  5 Jun 2024 19:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51B85D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717607092;
	bh=XBdIGQfNrDEy2MrV17VfjcZjxiIGQRcjY/iQ9CGU06Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kam0c1Zb8YphyqBclBOtDyyUsacI5JRPaHctcNN0/HF7BUjrfBIc6Z/0U7pf9KB5X
	 nfxfWAJxW25lPDGBV+fFUwNHNc2ufmB1FBZ6XTmsWV7oTm4/LYUhK1ovOZY+lqvPmh
	 1icor6/vUCnQ58TxkYhLSsBUnPFGY8U9vBagXKfY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8705F804E5; Wed,  5 Jun 2024 19:04:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C692F8051F;
	Wed,  5 Jun 2024 19:04:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 941BCF802DB; Wed,  5 Jun 2024 19:03:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5370F800FA
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 19:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5370F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=utcfqfWC
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHANt1tIIRnMvgOngjv8F3FovzowwdnYMB5pI5VkD/sG5oYWCMrHtfOiAU4xgWYS3P94cD/hlUM5/p/sbfQWovvFTWnRdkm1zWyfydxcLYcJXi5yP3kUIeAZOnIeStODmQPLG+sdfOercYxDBZFD8M+IAJbcdgNDTzrsuQJWMWtDWOgjX/3PT0XKl2s5dSF1HOe4mRytUU8RiNrQHIw79L4OYoESmw5tTsZJggLwyNqOH3AGdrufJ7oMYJ7PoTEfT0KiQ6FISo0cojJjHehk3uGQnU/mpROieoZwJ/9ed7s8q58fn54n/dYvgbfS019gkBBnGEHzssVfwnBTcSK6NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHTmfkS5PeD1VUTuW6AqHgF+m4U34Gz7S1QwdwMQgs4=;
 b=itT5HEvaU77aAG3UmmPpG4dePxxnF3jpsHyp9HhOGIamSPhv4lZZ+3i/oV5EquN11/81t+LB/XJahqABEFn2JD4CjxPycblN0WhD7VlLKiPbaSnF2mBOCkAnRodUgjAdePUnrAAVXhaV2DctzkyS3dhMghuhvry90MJLYptnAC7AbKr4lmLJWt3719SeU9Xn0kBA+EpHkBvXzhkf5rZBgFQ6gv7mVtFV82a8AnMxMagzIjaz20f/5WuK75YFnHpizvI8CO4JzI+UWWFf8FkngkLF9Gv4LsxGIRDZ8GgZW2sN4fI0IC8AcZb+R+qfT8FG4bgIueaXiq06ZraJ597RTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHTmfkS5PeD1VUTuW6AqHgF+m4U34Gz7S1QwdwMQgs4=;
 b=utcfqfWCflt59TUBJMQH/Vq4+NWBKZ+V0RgJvehx1zijD92r7nS+0WYsgNbj8juXFyPTDn6IADVct+3HRiyy/xQYFVWAxETghc/4uDgcoE/Wm8qOM2ehKzddbdyqOWeSxu0VXCt8DX0+lLkOpF9+GwpgbApAhyvnwwatBr2pnRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB8341.namprd12.prod.outlook.com (2603:10b6:8:f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 17:03:17 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7633.018; Wed, 5 Jun 2024
 17:03:17 +0000
Message-ID: <2099135f-871a-4d8e-a957-6bc374407fd8@amd.com>
Date: Wed, 5 Jun 2024 12:03:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/realtek: Remove Framework Laptop 16 from quirks
To: "Dustin L. Howett" <dustin@howett.net>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>
Cc: Kieran Levin <ktl@frame.work>
References: 
 <20240605-alsa-hda-realtek-remove-framework-laptop-16-from-quirks-v1-1-11d47fe8ec4d@howett.net>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: 
 <20240605-alsa-hda-realtek-remove-framework-laptop-16-from-quirks-v1-1-11d47fe8ec4d@howett.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::19) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 69de45e9-a325-40da-f1d6-08dc8581652e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cXhySjNsV2pXdlM1dVVrKzBWZThpT2MxZjVQTDNUbkpCc2hpU0dXWmxUMEpL?=
 =?utf-8?B?WjNWSGZnejlYa05XSjJGZ0htMEhyRDJUQUFjNm5qcGZEc3lpMVhJSkpORHNF?=
 =?utf-8?B?b2laZkJBTEFFRHBaT0lBRmR0MHdqZ3cxNEtwVTIxK1c1R3JMZGtrdlNSeFhR?=
 =?utf-8?B?TkswZklMdUM0dGlJcy9rbVl6V2g3RTN2NVRxNmZqY0ZvVTdPVDYvekdxY3Bo?=
 =?utf-8?B?SnRRVDJkSGJBYjdIV2R1bGxYbjFVblIzZzdoTytSWEx3RWdaOVd3M2pLTUMx?=
 =?utf-8?B?MWRRdDJGU1lzaGh4YkpMRUdIVmtDMFU3V3M3WEhEd3lEV2E1VWszZHg4cnFk?=
 =?utf-8?B?a0NGRkVVbzN2SnBGRVNZTm5YWHhvTk9za2NOWTkzSDA3WVk2bDlPSGcxbElq?=
 =?utf-8?B?R09qNUVsUTA4NlJlYUdJQWZsc3JRdTJsSXFZd1JwWmQ0dDJlWHE4d28vUjdX?=
 =?utf-8?B?Z1UwTnRVU2kxRkt1TWdSR0V3TmxNTGpvOEtMeE1ZSE53ZEUzYUNYdmloVDFQ?=
 =?utf-8?B?eEMwOTNzZmk3MXZOZFF5TDM1dnkzVmRPMUNXVy8wQWhSNE1jQnVaL2x1TU9i?=
 =?utf-8?B?NGFGMUwxNk1xNUNnY3ZmNHgrNTFmZG1CN2Rhdno3RkZiZW03bW5FVnhFaGVS?=
 =?utf-8?B?eVd3RExTRFlnbW5YR01uOHZpeEFCL1FRRHUrRmxIaUhFMTNtVENlRXJPRWpi?=
 =?utf-8?B?SzhveWNNbmlpY3M1MGxmUVI2RTNNYlovbUN2NGZaRHFBMUF0Mlk4VFYyT1Fm?=
 =?utf-8?B?VDNVL3ZsckU5U0svTE9ZcGwyZmg0cTNUT053YklHcjIyb2ZMZnVhVUdtQWNB?=
 =?utf-8?B?NXVDbGMwdTMxUEdaZW81V2JkK0FudTBJWVlHS0RsMTlGa1JpcnhCTXZpN211?=
 =?utf-8?B?UVNWUXpvTmlWMnZBYzFXU3c3RG9ldGJCbFQrV1p5a1N1VGUyejVQUEN1V05j?=
 =?utf-8?B?aXVxN1BnY0RVeEZRVmhvWFpseTlQck80VURJSERKbnpJWXJ3a2NyNUprTVR0?=
 =?utf-8?B?Lzlxd1BwUDY0SjlvN1pqWlFqSGc2ZVlXSGtNRkZWaTdtcWYvZjNYbCtqeWk4?=
 =?utf-8?B?ZmtNOXQ4N3J5SnlVZUwwNUZSZWg0d0xpVGtUMVBkaTFzVTJFZHRQdzNURFNQ?=
 =?utf-8?B?MWJEdEtzRlUyUmdmVnlXTGNnNXFrb2hXcXVnSW9wdUFHNUdRVU1Ld0w1VUxt?=
 =?utf-8?B?eWVsalkxUXcyMll3dnZOOU5WY2cyOEw0WUNvOG9HRnNIRGJOdGRuK25xRWZT?=
 =?utf-8?B?bFFPUkRVZTN4S0taQitzdk9oSGFsbVBpbkxxRExZaklLdkE3RkpQNCt3VEF4?=
 =?utf-8?B?V1NzVXoxQlhNOGsvWVhzREFSS1pVNWI5cVhHVE9ObllUQ2h2MUJGeCt1Wms4?=
 =?utf-8?B?NmlSWk5zZ1NHZFVNSHhtcXF3aVpJWHcvQTlwWUc2OXRyV1dSYWZHNkQvVVEx?=
 =?utf-8?B?cnB4dXgwZFg3eWNsZXJlNVRpN3NGV1EwNVdLVk5LNUxBNDlZYitrTndBbkRH?=
 =?utf-8?B?Q2h0a2E1aTRQZ2VIaytFb1BmMmlUNVVSRjNqRjRaZ00yU1JtUUE0SjBhTFBO?=
 =?utf-8?B?YTN1NHVZaGFYS2J2UlhSM2c5NzNyd3UwZG81UDhqcUlDdTNXV0xQdjUxUGZt?=
 =?utf-8?B?M2wxYTREcjVkSk9LYkFCNzdEVithanQ2dUY1OWNEdWpHZng3bnRUQW50Q1Q2?=
 =?utf-8?B?NXJ1MGsycG5XcVFWRlBqMzU5cFU1TjNJb083VHdFL0tNdlRaNmNsK3pBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NE5GY3Z0a0MvRjNvUTlFUXF2Zm00cUhieHBwUFUxRnU3L0svMVlkOUN6N3pY?=
 =?utf-8?B?eVNzMEZTa1dXMGIvT3FYMGUrTVM5aGMvbFM2RjNlVFU5aG96MU1ucTZqbDJX?=
 =?utf-8?B?TllvQmhaSWYyVnRML3ZIWUZCWHJKRzNLbVNvazd1Z3Y0TkJVa1FZYnFQbE5P?=
 =?utf-8?B?aXdUbTBIYkUxME9ZcklJZnZPcjJJbm93QWpvejNhRmJVdFBreFZUb3M4c1B2?=
 =?utf-8?B?NzlQOXZHYitsT3dYUVpRQkNtN0c1QklsREdXQXU1RjMxcVRUT3ZtYUkrcy83?=
 =?utf-8?B?RkhPaEZlZ1V3cW1VTm11d2dwVGRqUnNnTDhyYkFnODJWYWUzcGhueEdLMUZj?=
 =?utf-8?B?Ni9JTG12dlFWejBMN2hiNkxCQmtTb3FiWTgzMGNUYk56K1Mzb3AyNlJKekZS?=
 =?utf-8?B?NWxEamt6aS91SkIyYzhyZ3hEbVZRZ3QzNm5VWmtVQzhHMTFWVnAvYlF1R1oy?=
 =?utf-8?B?cmZhZm5WRkhVSVBSU3IvRWlSNTFrZ1laQ3k2cnFSK1lzaEpyVWpHN2sxMUlQ?=
 =?utf-8?B?QWZWdjNNcThiWitqZjJlckJ6ako1b21rYTJkTDB4U1ZFeFFsdUtKN202MFhT?=
 =?utf-8?B?TUVzVy9pOWUzL0ZUY2dQQWwyaWZ5QVZIOUxqRGFXZjhtNXVxdmMwUGc3K2lC?=
 =?utf-8?B?MzAvYVVhMW1qbkZFNHh2ODVyMHRRb3BIMDBVVkdrNUtQSEYvcWQybUZMRjhm?=
 =?utf-8?B?R2lWc1dXSzBNMlgzQ21mTVdBbW9vL1h1N292bFJsRXIxVGVyOWhZeUZZWHdh?=
 =?utf-8?B?Rk51bFNRWWVLMnFiajMwcTNtR29vMERZN3pkZ2swYXhMWGJ2UEVYNHZ6MnFE?=
 =?utf-8?B?N0FrOG9HUldaTmlYbnM5RGFralhSU1ltRGU4dmFEc0VENlpyN2czc1pVSlJM?=
 =?utf-8?B?Tmh0ODJ1M3RxZzF4VHplemxmS2tpd2R3TDhIeC9mN1QrbWR3aUorTG1oSFFp?=
 =?utf-8?B?aExSYm1wNEpiTFQ4QWUyeEJIR1Z3OW9ubndmQjZySlVZVVE1Wk9pT1RQQWE3?=
 =?utf-8?B?VS8vMlgxT0dVaHRYT0xGOXVVTHA4UGdJMW9sTnBCQmtmTGNtUXNtYU9ILzJu?=
 =?utf-8?B?ZVpFVjBSNXQwZ0dBQzdHakxlbFUwQkE3QTdPL1ZQQXpMaUNKWnFVMVc3M1A4?=
 =?utf-8?B?SWdWdDhBZUZZVTZSQ3ZDcDk4T3RzT1IwMXdGNXpKMDZ2SGQweGZLYU1OWEZT?=
 =?utf-8?B?dU9hTmlqOGkyRENHY0oyYU5BS3RrUzczK29KRU9rblpVSlU2RllaRjVtZk4x?=
 =?utf-8?B?eHc3MmttYnhhekM3aEdJa2d1RXhWWEpZU0hOZHRSdGorcktQYUtWc2MwTXB0?=
 =?utf-8?B?QU5PWjRiYWtKbG5EOXVOVTVMcmJhbXJ0bnBBbnFiT28yNjkyUHhMV2k5dDU1?=
 =?utf-8?B?TG5leEMrQU04S2ZsbVNoeHQ2QnlVQVFzREs3VklvRk1FSmI1T3ZpcHNvNGxE?=
 =?utf-8?B?Ymd3WVVoRVM5Mm5PNW5nVUl1RWp6YWdGMlo2cTdBZElpeWI0TUF0Sm5qL1kw?=
 =?utf-8?B?WlBTNUFBb3Q4bHQ4TjJUT0FPdVQ1ZmFlbk5heXQ0RDMrc01uMXF4d05sOVR6?=
 =?utf-8?B?amlsdzhRTmlwdTR2NG5Ua3NEWWsyRzdnc0dxYlJXQ0xpYzJhYWZERkZGdGNR?=
 =?utf-8?B?a1Y4WWFrZGFKT1RyQ0FTNEFEeVA1TFRNWmo3QkdKTE1YNm5yaldQVXFVdGpV?=
 =?utf-8?B?RjA0eFFmcGlTNnlaTGNvTlRmbUprSHdXc0pHY2ZMYzZrdStCQzdQNjk0clNk?=
 =?utf-8?B?ckhNcUZEMWx6SnJra1ZETkRmTFNyRzRJenlzdGFLR05GaE5lcFp3SmhOYlZN?=
 =?utf-8?B?NEJTa2FLcG5selpxWG1VT2FMVFlXOWZRcm1taktkRlhZcS9ZZitlNGluZlRF?=
 =?utf-8?B?a1Myd2VVMGZqMXhUTUV2K2RGMmJxV2E3dmhqNkhLODFXdzFHVTc3SE92ZGhn?=
 =?utf-8?B?djU4WE1NT2JtL09teWFPTk9JZVc1dnNmT1B1ZWNSS01LeG5yQmg1V3hrNThR?=
 =?utf-8?B?YjllUFZWbVFCMEVmcXdrcmZpN2k5Q3ExVUNobEVwWFRGTVNQd0c0S3U3cmE5?=
 =?utf-8?B?VDJBcFE5R3o3T0JMTGhtTFgxbnVqQk1YSEl2ZGVPdEJMYmhUelgzV1h2RmRN?=
 =?utf-8?Q?qRLwyFeWHyUDMei0nrXVD+vdU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 69de45e9-a325-40da-f1d6-08dc8581652e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 17:03:17.6007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vDVMIaylsDCeVkYkSVzYur+FsxSYxtQ1V7RaU8ilPxWC3GSCuA/zSXWPRKyWB4h22vbEvaR+Ss3Tja6gcQ/urw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8341
Message-ID-Hash: QYCGFO4353AFJHTXHQAGVFGZU24XBDQG
X-Message-ID-Hash: QYCGFO4353AFJHTXHQAGVFGZU24XBDQG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QYCGFO4353AFJHTXHQAGVFGZU24XBDQG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/5/2024 12:01, Dustin L. Howett wrote:
> The Framework Laptop 16 does not have a combination headphone/headset
> 3.5mm jack; however, applying the pincfg from the Laptop 13 (nid=0x19)
> erroneously informs hda that the node is present.

But doesn't the audio card work this way?

> 
> Fixes: 8804fa04a492 ("ALSA: hda/realtek: Add Framework laptop 16 to quirks")
> Signed-off-by: Dustin L. Howett <dustin@howett.net>
> ---
>   sound/pci/hda/patch_realtek.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index e3c0b9d5552d..127f5933abd7 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -10605,7 +10605,6 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>   	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
>   	SND_PCI_QUIRK(0x8086, 0x3038, "Intel NUC 13", ALC295_FIXUP_CHROME_BOOK),
>   	SND_PCI_QUIRK(0xf111, 0x0001, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
> -	SND_PCI_QUIRK(0xf111, 0x0005, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
>   	SND_PCI_QUIRK(0xf111, 0x0006, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
>   
>   #if 0
> 
> ---
> base-commit: 7b44d5381e541de3da3cee2e948456b250f41f25
> change-id: 20240605-alsa-hda-realtek-remove-framework-laptop-16-from-quirks-dc60267cb5e7
> 
> Best regards,

