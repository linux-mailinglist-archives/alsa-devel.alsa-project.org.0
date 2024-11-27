Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 172989DAC9B
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2024 18:38:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96B2F2BE2;
	Wed, 27 Nov 2024 18:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96B2F2BE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1732729096;
	bh=XWqAR7/JdE77PQHkAlIjw9ZcAzGPjG3z+pFrWA4jbDA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XyCFx/eKFgJLf2pboihFM+QeDKtg3IzJk6/iP7qH+GbHjzAnqj81mrBx9mOzVIkiZ
	 p8Hhy17i16ArCYKqMU0Pp5T2BRofCLyqP8fvgP3hsAAQnhLX8ouVb1L+NBfNoJAmWX
	 vvQ/LKwBOeWg8yBX8kE5YPvMFSkBVStIeU58jiKE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBB84F805B1; Wed, 27 Nov 2024 18:37:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63F23F805AD;
	Wed, 27 Nov 2024 18:37:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2560F80236; Wed, 27 Nov 2024 18:37:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B7EBBF80116
	for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2024 18:37:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7EBBF80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=Vqngsxjo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9jRSfpGjX6obSCFiZ/veAe04l9VjH8xBTXFP0HTWDcICBb2qLhDu1DI9PrN6fc8voj80WfmbrhszPE9mayaxsmJH7Hnt/47SDB7tTYQrycikWeZK5mtoqwYQeip+2rKfSn2OUFofhAJlN2amRCM3cdqKQFTg55LmPhdKwKZVoZXbtsiXdSLIQLx+mCLObZCtJ6i/BkSwcS7V4lh8qwtTIyM173GqIqOzDtUOjYStbrz6VBYYN6PUVcKysDE1mPvRB9NP4+HW1AOMEhPQlAL0bPmu1EY968ux5qMf1q/o3MVmG66pwzvnSVkRG/JItEDnVhCq9l0b6jP3yK0MebTYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XWqAR7/JdE77PQHkAlIjw9ZcAzGPjG3z+pFrWA4jbDA=;
 b=gTHUqxZ+eoO5hRjoqwsos1mm0c5FgAj9+/nZ5AnJdnp6u7s7CdOZmQ/xjPWiZGoRwFma5tzLzqmyaSbcId6fK3MVFx/4Z9Il2UDu5i8WED4cnc0ui7wVSzjyLrW+UNQkc7th6DBB33jqpvQEw1tKmhhYHfBHAXJfLFi2evpg33/9nMTgnVo1YKqbwzIocNB2sGpjtSf3gep3twgj51rnAJ+oh1bPC//PW9JCigIYpLcdoFWKz7qLBG/zWwa00FM3c9Kq0US2LqAGv9NFp1foY05mMcNZ8RPpoJbULWNAFVZFTmmsipjpQ4xytI1MWM5nTMOdCEQ9SVlIQN2D8iKIfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XWqAR7/JdE77PQHkAlIjw9ZcAzGPjG3z+pFrWA4jbDA=;
 b=VqngsxjoQxFyDG0zIoac+leImjKdpOgdssYdp9eIdkRGb6ApThs9M7cN0Yuly5qK9rGx+GvqP6VmB8yNwRyOxVr89geJkyRmvWjMSblObZOtoQvAZpNXjmgHa6vczfCbO/BH0Qv6tyo/TBclk5kVSKQHejjUzULTn7tW4mIxWRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5951.namprd12.prod.outlook.com (2603:10b6:510:1da::16)
 by IA0PR12MB7529.namprd12.prod.outlook.com (2603:10b6:208:431::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Wed, 27 Nov
 2024 17:37:16 +0000
Received: from PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0]) by PH7PR12MB5951.namprd12.prod.outlook.com
 ([fe80::df88:d99:3cf3:dec0%4]) with mapi id 15.20.8182.018; Wed, 27 Nov 2024
 17:37:16 +0000
Message-ID: <3c38dc28-8de4-4b77-aaef-628711f328de@amd.com>
Date: Wed, 27 Nov 2024 23:07:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Fix for enabling DMIC on acp6x via _DSD
 entry
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
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
 <021436ab-8035-4c56-99d5-c478075e6add@amd.com>
 <7291d216-59a9-4a99-af74-8789b9426916@sirena.org.uk>
From: potturu venkata prasad <venkataprasad.potturu@amd.com>
In-Reply-To: <7291d216-59a9-4a99-af74-8789b9426916@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::16) To PH7PR12MB5951.namprd12.prod.outlook.com
 (2603:10b6:510:1da::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5951:EE_|IA0PR12MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: 805a7557-b41c-467b-2fc3-08dd0f0a22c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZjB0ODcxMHJMSXFNZUdGVlNUbmdZa2xod1o2UGg4eGNMY1dCbHhCQ1BMVEl4?=
 =?utf-8?B?ZWhCYmxMTzYzY0xiWUFraG9aMy9XTS8xbFgvbmRFVGcxRkFoL2tFeE4xYk1o?=
 =?utf-8?B?dWJMS1FxZ3JiTlJDNUkydkZIMDdORkhERHJSNTdac2xma2NVbUVCUGg1RTZh?=
 =?utf-8?B?ZElGREV0R2F2QW4zSXoySUxDQ2tRREhzdTVtTGJnTVc0WlRzMjRwcE4wNnhP?=
 =?utf-8?B?WmU4VFVLZUlrUENMSVBiWU9qa1RDb0pCV3dKNU45NzVFMW1CNGRQRUxOSXRw?=
 =?utf-8?B?akVaVjlkMldHTnd0Z0ltYmJ4ejZ3NVdRNVp1UE5mMnNwdlZmaXduQVNvTlhs?=
 =?utf-8?B?SlBQdGZUaTY3RjB0T3lGeXpTSzdPTTdnYi9mN09RNW1LQmdUY2VSeUU4RVFT?=
 =?utf-8?B?RGFRSlluV1BTR3E5UGxKWFBKdGtCV0lyUG1LeWFhbDNEcG82OXZueUtKVHp1?=
 =?utf-8?B?aEdqb2pFWnQ3ajd2dU5CdU05S0U4SW5uT2c0M2FneC9UWUhEQTFWTkRpTEJR?=
 =?utf-8?B?Nkp2WkJnMTBpN0t1OE9wYU8ybjNwWWZMMkRQV1VBSncwU0hMeE1EbVZTVTdG?=
 =?utf-8?B?ak1rOHVEa2pRUzkyOVF4bVM0ZC9HeFZxZ2xXTmdGb0J0czZzYlQ0RVNxNjFn?=
 =?utf-8?B?WVF5T0tBV3pMWHc1TkQvbHNVQnJKK28wRHAwTldUTkhybTg0WUlKZTJGemsz?=
 =?utf-8?B?N253cVlBNXBsV2N3YUZWdDh1OTZ1eWtER091cDdTb3RsVnhQeWl6RlJDREF6?=
 =?utf-8?B?OENuUDNWcUIvVlZzVEM0eVZUWklqanlqUDlYWVBEWVFUWUkxMnB5S2t2Y3kr?=
 =?utf-8?B?ZnRMdDV6NWxhejlkek1ZZWVFSmZRRk5oeldlUUJJSFR6YTZQS2FWVlFFWE5j?=
 =?utf-8?B?TU12WmNqL1VrOVpCR2pjMHVOdld6b3QwR1BqWUl2aDBHRVJWN3NKME9xKzJP?=
 =?utf-8?B?djBWZEdxVXloeDY0ZzErSjdRbFdscXc5bTdiMUF3azJ5eHBPQkd5OVY0NSsy?=
 =?utf-8?B?S0pQODBEZGNNQlFPTlZ2UjRhWXkxTjVFWTJSVnk0LzNQYmRkWThORHZrTjdz?=
 =?utf-8?B?cVBTbENIb2lyV0t1cFMya3JVYnBzOFNiTmhaNVlRYTRZZHVFR0I0SkZzMnJh?=
 =?utf-8?B?UTBUTWRMVHpUT3lnWUlvWXRBV1ZIUStLdnIvc3JLbmlQVUJaSkxUc1JXbWxl?=
 =?utf-8?B?VUtsblJNbytZUERRNmVBUW1TNzQ4aGQrWXNDRkdhMXZYc3BuOWdPc0VnZWRa?=
 =?utf-8?B?eDlDNnZxUmJtaWhxUGpHNUMxQW5LRDJGUzJvZHNlQTFKTmVQQ09pSUY5UjEx?=
 =?utf-8?B?OExGNjNxS3B5Q3k4QTJsck96eUNNc1ZQbVp4Y2JzeVBndjQwT2FxMThHTmpF?=
 =?utf-8?B?MkZGWHZITjdwNm1KNk00SFRDdnZieFc4VElPQUk5NUExNytDWG1jVEZOeFZ4?=
 =?utf-8?B?d3FRUkFWL2Y1YkZZVnRmQktnbE9BSkZyLzBjcUNoMzl4VWtpaUgxUGp6a2c4?=
 =?utf-8?B?U2gybDVtOE41eHJHcUlnUHMwY25lQlRMLzZVdmtUVmVDYjVORjBvVFA0OGxD?=
 =?utf-8?B?cmg4VXcvT0RDMk9TNEJ0ekdFWE11aWw4b1BxTHNtYlhFMXoydmZ6Vk5LdmZ1?=
 =?utf-8?B?OU1DY2U2N3U1dGxqdGpWZkVGbkRrZC8vaFpIT2NWUk9IK0dsb1pTYTBWZFdX?=
 =?utf-8?B?TUF1VWQyQ1dFdjRuTmRoUGpmMmdOTzBvSmo5Q1Uvc3NhSTRqRHMrMkE2QVQy?=
 =?utf-8?B?YTZzUVRiT0ZFL0NiLyt4OXkyajhqWmZlWFhUUDZlaDJWY3RQcSsxRGMrR0Yy?=
 =?utf-8?B?SU1GY2ZqVkpRNzZsUDVMQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5951.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RVhIM1pERVZiUzVWR2ZpRkhRT0xYTFNhMjF2a2xmVzhrL0RsSFpWdWNuODhZ?=
 =?utf-8?B?ZmhwWjdBTXVtT2ZONEpFVmRmdWpIT0FwY3M1b0kyNGpveDNkT0c3Ni9WbWlF?=
 =?utf-8?B?eDNZVE93SDdTanpCczZUdDg5RzlJOG0wNmZsbjYxbWNDTVhZSDU4Q0Rzem1l?=
 =?utf-8?B?RC9KU256dDlEYWVQSldNUkVqY3JMbG44WG51bzZpVkdkZ3E0UTE1cXIzUzlW?=
 =?utf-8?B?WENXQXBKd1NEdTN1UVh3Tm93bzFFUVNXUFFUbUZibFh0eGtwZnZrbzlERlJR?=
 =?utf-8?B?cUx0UUJsem1saU4zc1NodFJ2eFNuNjNEckxFcko0NjdQRUcrTXE0aUVVUFBv?=
 =?utf-8?B?ai9POHFHZlpFcENGUG5aMSs5QU8yTkowNFFYRDRqM1YzN3lmcDI5M2tYZVJL?=
 =?utf-8?B?eGRwWTBxbHpFc013QWxwV0ZwRUl1WVRoTzZNanhpYTMxSkRkT2pGaUk5VjhD?=
 =?utf-8?B?TVI5ZXVYdFNJanRydHBTSlZadnpTaHFnRVI4SW9Zekg5d2w3M1VmdzBucGxD?=
 =?utf-8?B?M2RzK0krSjFRK1BkV09UcDVRR0tVNjYxazZ4bGFBR0o3TktaVXR6dnVia1U2?=
 =?utf-8?B?N1VyRThoUkE1cTYxVm1Pb2RwWURycmQ2WGFkbWtGclduRnJFeSsxRGV0S0Zi?=
 =?utf-8?B?aGYzV0dybTU2THVhVWdwTDFGRGtpRFYrK2I4QTI5d010TnhpWXdqOVREbEZQ?=
 =?utf-8?B?aml3SiswOTFaUkFsRFRLNVNLU0xyY0Z5V1ExSHR6a0NrRk85eTArK1ROd3RQ?=
 =?utf-8?B?akZ5dlRmRWVDcUF1aDU3R2EzUUZVVktvRktTdTRrdmdNaXJTL3IrUjNSbTR2?=
 =?utf-8?B?YVhZU29GTHFNbXU1UjR2VFF5R3h6WDBHS3hpb0gzaTRTOHZONTFTTVBOYTRw?=
 =?utf-8?B?Ti8xM1E4VEp2aTQvbjNmMTNscy8yd2tOdjNxVUxqVjJqaGRwU2pKT04wbW8z?=
 =?utf-8?B?NTJaSzVtVWNUZmhXQWxnbDhZWGI2Rm5qdUU5NkpJQTZ4QTFnTXZhbGRuQlQv?=
 =?utf-8?B?QUJWWnlNM0NUdjN6N2xKdlFRUFFqK2Qra2VOcS96RFZEcnpsODdYMFB2bVk3?=
 =?utf-8?B?WlBpVUtESk01QnVESHNvM1k5MnRJL1NBRHM5Tm5JZ2k2SEFOWWtSdzVjd0JJ?=
 =?utf-8?B?YUdQeUdVY1RZR29ZTGw3MkJaOG1teGdjK3cwSU9VaUpmRjV2bmtYbVR2Mm1n?=
 =?utf-8?B?RmRtS0FDQXg5UGRQUm5aODhDU2RkYThjcTFSVmdwUmcvaTNBdS9YenJFWnIw?=
 =?utf-8?B?WUlZcUVKMlB2OFlBK25PVGRxQlZRTjlFNUhMWXlmREQ2WlIxT0RMS3Y2a3Vy?=
 =?utf-8?B?U0JiWkxBQU9VaUpZZklScVA0MkVvWHduNXJwYVk5RnA3cUpRczhqWmN1TFdT?=
 =?utf-8?B?YkNSQ0QrUzFPQW44ZjVzZ3ZweCt5dFFPRThrR05qY005aWJRZHlka2Evajc2?=
 =?utf-8?B?Qk9iMGtlNUtLRWdvcTVxT01JNUNyd1ZwOWlwRlRUdVhTd1h4Q3pUZ0RjUVhn?=
 =?utf-8?B?TkplbGtkdVdOUzc4cERmMXdlOVB1ZGhuai92cHVJNkU2TGJMbzAxdzZEeG1Q?=
 =?utf-8?B?USsrVm9jZlVqSnFsaTBYRlFmOHVDREFRNXBvMmRWRTBHek5WZEFQa21HSVp2?=
 =?utf-8?B?OS91S29LdHR6TG9mQ1JUaXMrTFB3UzduNk9jcTNiMnZNNjZnVjB1VU9BUG52?=
 =?utf-8?B?RSswdXY3OGJWMWxiM0lMZ2pMMEVZQnZvN3BQMFNhWTdRa1BqMFZPYW1Bcms2?=
 =?utf-8?B?dDBiUHdUbFc4c1ZzV3lyY1Z6eC8wMXA2b0lGcCt4a05DSHlETUZMYUhzMVVM?=
 =?utf-8?B?bFh0ai96cjBnd01TdUpzSVQ2Z2RsUldGM0ZTQi83OFg0a0FvcmNHMDhrN0hG?=
 =?utf-8?B?QlUrcU16M3kzeFVZRGMvRVY4Q0FTTTJTMXgxVUwvWVQrZ2JHdWxhU25NOEpI?=
 =?utf-8?B?c3JyZ0d1N0Rqc2xGbnJaL2J4UzV4M0RJMHNnSkkyczFPRDVUdTRDbENQbWdL?=
 =?utf-8?B?VmROK3d6bjQ2ZWQxMmRFdnZaNVBQVXdOcGlNVmR0V2hHVDRJQVdodmk3YjYy?=
 =?utf-8?B?YitiWEhWM1BVQ0xNTVNlVkNxSUNDSHUzVVFBclZWWVdwSFdqOHkzZk5jdnJj?=
 =?utf-8?Q?AiiIuBHjfeMuYTB6o63v4mSNJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 805a7557-b41c-467b-2fc3-08dd0f0a22c2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5951.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2024 17:37:16.7523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tkdaql0DPvL4G4uSPhsGDlsWFE4klv8dGy8OSEZ6qYUstyUGZMWpbOgIqk5Ch9SLP4emcUuu0RhbhGzW2WVwqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7529
Message-ID-Hash: YH44XKMRO742M35SV6DMAT5UFVJS4QYP
X-Message-ID-Hash: YH44XKMRO742M35SV6DMAT5UFVJS4QYP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YH44XKMRO742M35SV6DMAT5UFVJS4QYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 11/27/24 23:03, Mark Brown wrote:
> On Wed, Nov 27, 2024 at 10:34:32PM +0530, potturu venkata prasad wrote:
>> On 11/27/24 18:06, Jaroslav Kysela wrote:
>>> The logic seems wrong. The overrides code bellow won't be executed when
>>> ACPI _WOV data are not set. I think that it may cause regressions for
>>> some BIOS versions.
>>> Also, the return code should be probably -ENODEV.
>> Okay Jaroslav,
>> We will correct it and resend v2 patch.
> Given that I applied this before Jaroslav's review please send an
> incremental patch that fixes the issue.
Sorry, I missed it, will send incremental patch.

Thanks.

