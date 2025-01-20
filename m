Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0545A172C3
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 19:48:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCD2D6021A;
	Mon, 20 Jan 2025 19:48:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCD2D6021A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737398892;
	bh=2R2367ZXB/DhpJNrAZVOA2eJBbV6NEwZudFfXSA7NG0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dnQ64gffq38EcTUueWsaE2QmL+fZcC6BHjDsxSDgFjDNOYTNVgDDqphBsA1WGrYQN
	 DRhKPkxSNcr0Fq0HPTWvlE43H8Bu16GmHpvcJn7/VoDn3XGNiZGRdkwhcnqve42BBh
	 1oW9JhDppCQB+hdX+a769M8V96gvH6C4Vih92r48=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5374F805B6; Mon, 20 Jan 2025 19:47:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FCFCF805B5;
	Mon, 20 Jan 2025 19:47:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2197FF80482; Mon, 20 Jan 2025 19:47:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18DB4F800E4
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 19:47:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18DB4F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=MWwBodwt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZTbYDhoR0Vc9YYee0uKgFMm052hBRZzM2lcjzWxytoIrcHhUFm5Ym8id4ZXwGDcXlyDiw7WdfF/+q0aB/rXAgu6kb22/azWWShvGcHO4Oken3LWpHFgihXns4IiBUMEu1Sg4wQii3e/h8E/wfXXmaTIfCiWN0STUstu9UWAoYri6Ro0vH/j/InoxI5D81ioVHZKD+KgJ1pnHwYyRAbY+ht6NIgXkWgOTPjHbGWhcPIQzhjnyqySbS3OethKNaNRbZ13YMbMnhdfJOwlWuzYqV2dYaTGSYF88QAmPa9PNtL2zLfLNLSG7HzvOfOIW/OTLS0JU0eHDDOrTGn/kVPSCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BI0uuyWXWlDtg6WiIRJZ5DPogW6ywsuGzz+Qn36EHQk=;
 b=oKR9U7AIDdN/Uz4Y45nUJY0k3gR02PQrbNDoBSJ5eflj2fIObxBjTEWNc9PzYISkSVQv26tJ/Y0hMh8aJ9yePgfs+PxYOARxE2e4G3j/JSUp//koEfwIphZQwYEa6uTN34xAB0T5VxmAAVF0PLpBUs+03vdtUpfKluT46ZfRLSP4WzyHdOEdQdZ+24FtZLDCvYqHxpwROmI3Hiuq3RwsFUmabIZivyDGz9hvbNmertilZEsauUsM74/ZqQBTd1hHPW+NjbMhefsqP9oMQUE+mfE7mGFOin2Y8Ld/B4lZaA8LF/YhBkvZq0ry+pWw/7GinYahwb7P5IjGbUwCu/duKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BI0uuyWXWlDtg6WiIRJZ5DPogW6ywsuGzz+Qn36EHQk=;
 b=MWwBodwtPzGWYBofrUGtEb9Cdxu45zwvtLy8MN7fxfWvvG5PbrGXCUESVeAz/KH6/eGNCQX8HGhJSqocn0p24krjNT61pGBHArTH0cCWKM4suwVquPIHzSCj5lnNxfqAOnUsIVbTNcYSdklMVZ+/YTUDk3Izeukyd0kL7aPzzdo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB7748.namprd12.prod.outlook.com (2603:10b6:8:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 18:47:20 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 18:47:20 +0000
Message-ID: <1e10c851-f4fc-4e76-806d-5f1214f29bdf@amd.com>
Date: Mon, 20 Jan 2025 12:47:18 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 12/23] ASoC: amd: acp70: add acp ip interrupt handler
To: Mark Brown <broonie@kernel.org>,
 "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
 <20250120100130.3710412-13-Vijendar.Mukunda@amd.com>
 <4d6cf5b7-8f47-4cb8-b302-c02f3b037d6d@sirena.org.uk>
 <08942c1b-3933-4ddd-b730-44d436a81e94@amd.com>
 <208098f6-1022-437e-9ae2-964e9bc89942@sirena.org.uk>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <208098f6-1022-437e-9ae2-964e9bc89942@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::34) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: 41dc52bd-04a0-42ce-cdf4-08dd3982dec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?by9nU280WS8yUmRxUlcwR2YzWHlEOTVmUE5JM1lTenAyT3lvbitoNklXK3BU?=
 =?utf-8?B?U2pUMlFKVE8zOThFTldXa0hkTEdyQjRFNlNEYTJnaFM2SzNiQ25KcFhBcUY3?=
 =?utf-8?B?dUlQUkNoT2crd2Q3UHI5QWUxay80SCtoS01LNVlsd3ljMmZMc1lnbXV1ZENV?=
 =?utf-8?B?eE5DU29XTkNxVWs2RVMwZGROekF5N0FMMDFINDQ0M0hVeDdPWktzWVBnN0dL?=
 =?utf-8?B?TzdEQzJ2NEp3K29VbEh4ZjdPRUZrRjFyS09WZm1KYkZ1TlhqTE5QTndiT2hx?=
 =?utf-8?B?QW9tbU1zYXR0ZTc5dTJDOFV1QUcrcnFCcXErWTVIY2lQZlQ4WXBROVVHbC8w?=
 =?utf-8?B?RnJCeVNtSjV6clBTdnJXck1oZDlRRS9yanUyWTEwSW9XalNYQklsWHIwS001?=
 =?utf-8?B?azVOSEp1d2hLZmQvQXhERTY0OWZWNUhYd0VSdXZNejFtV3pCcmR3VlIzc0xk?=
 =?utf-8?B?UmRCbVBKYkJRTWNBeW1BcERFaExNN1J0NGdLd1B0MjhoUWNVNUVwM1lRS0RV?=
 =?utf-8?B?WkhSRkhmbU1oVitTWHJJWDdlaTRyTGVqeW82elVmdWtpeDNybXIyekJNelh5?=
 =?utf-8?B?NzJxVXhSci9zS3l0bFd3MDdLYnNJZDRLaDl6NmRzdGo3MlBZdWh3eWJtQysv?=
 =?utf-8?B?RzVTMnJQaFdFVmJnQ1NENVpuamlQbjZVUlFXVVJCWGhaWVNQbzArUUpZR29P?=
 =?utf-8?B?QXVsaGpYU05OQ3BXS3BaakgyaUUreHlKbDZYb2lxN1RETE9qNnJhZmxlWUt5?=
 =?utf-8?B?YXFFOEc1ZnFtVUhkdDZOUlpOS1kwdUJHUWtRU0FVeE92MjZ6bzJiRHBDQnp5?=
 =?utf-8?B?eS83MlJqVnRpUGdTbGV4NmJoZmVpLzgrQmkycUlQRzl0Vi9YOXJVVTkxYVZL?=
 =?utf-8?B?enkxdnZPQjR6dlJGVWpMU3NoOHNWdk1vRVZpUEJpeE1xZDZHSUliZUxiV1VQ?=
 =?utf-8?B?QngzQjZoMjJOTzkxamk3SDVuMlB5UVNQNmZtcmgvN1FOUXNZVnBReitjQ2Vq?=
 =?utf-8?B?MmlzZVlHUW1LcHNGUktLVWJycmtoVVlpejhzOGlNcmJxUDJCVnhUcXRhaENS?=
 =?utf-8?B?NHFxNmVSVGJUbG5RYmRUbmc2NThtMVIyMi9VWk5SQVNoNkljcWRqUUdCQjlF?=
 =?utf-8?B?Vm5LVG8vMzRic0dzUklDNlduYnNaSDNXaVBmVHB5MFhNYlNXSDlnbzRXZ0RX?=
 =?utf-8?B?bFBGZEZNS0tQb3VSRnZseHBxUHNxTzhXZXgxVTRlYlBWT1Q1SGVkTDF3dXFp?=
 =?utf-8?B?MDB5NWhIT0NHRVJkOU1ycWdTQWNRWHpmYS9xdzBoRDJZMlRqTVFOT2tHVVRD?=
 =?utf-8?B?cFVJdEUxdXJBTWI5ZnJVY1c0R2JoNFNXa3IwYWFzQmtud1ZaRzRkd2dTODA3?=
 =?utf-8?B?cW50UmN6UDNlU0ZDaHRnSElYYnA0NEFES0hUa1hCS05rNDRrU2F2RnpuK3du?=
 =?utf-8?B?QVdBMUI2RUx6TENYQWFReFdnTGxhbEttRHRnMFJLMldKMnlNN3dTclp5ZzdT?=
 =?utf-8?B?dW1JMkQ3VFJMWVd2dUF5NGNrbUdacElhd01lTFdjVDUwSVlBZFVXd2FOTllY?=
 =?utf-8?B?YWdVdnZHZ1hOVFlZaTRhOUQ5bEkyYWc1NHdva2NRQ0k4SGlUSkVTcE9IekdP?=
 =?utf-8?B?eXdEbUFXLzl2QkFvakprdjg3NWNPblpFTFNDYm40ektlbFd5Y3JNMGxsVUNR?=
 =?utf-8?B?aEgzTkxTdmxnUWZsa0xoaUtmU1M1TE1Fc3p4Mm1LNE9KTEZWN0p5UnJXaXVQ?=
 =?utf-8?B?Q3ZhcitTMzJFVHhtRHRjK2NxbHdoS0xQK3ZsOGpXN005ZGxXUXpNbFFHNU5G?=
 =?utf-8?B?eWM1eHdmeExvWHZNTmlEZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a1ZTN3AxMEk5QTFZamVQSnYxaWI0dzZaVnM3aFZpNkxJME9yVmlhYjNEalRu?=
 =?utf-8?B?RTE2d1NsYk1DeWtpNzhQZTFmUk1sdXl4cW1Cbm5PMGhyZEhJUTJHRUNDa3Fh?=
 =?utf-8?B?VGYvdXVzTk83SmxpOFhtL0dpYlFyaFZYN0dQY09VQm5iZEhFVy9Sazd3N055?=
 =?utf-8?B?S3ZuZzVoL0ZnSmFTSThPQ3ptYjk0ckxrUWJvNWxEVGdQcG5rQ3NoQ1J4eENs?=
 =?utf-8?B?ZzhhdVVjU1V0YmlZdmhKSFdJWERpNHZrZmtMSTZNaEpFeFZ2YTM2WGVSWUdK?=
 =?utf-8?B?aU9qbHpzUTlpZnl2ekttZVhHR05LRlZ5K0djK3FNZTY1UGI3L3dJQ2psSldX?=
 =?utf-8?B?a21hUXFYczR0aUlIS1l5ZEdwdWhzYW5lUXp2aXZMOHpQTHBvNVM2U3Y3WEg2?=
 =?utf-8?B?d0hjT3BYYzBNVld1c1prUC8xZVhzSmhqb2puQUJEVytuL2lZM1BvaTBLZHZv?=
 =?utf-8?B?ZTB3OHJqeWpreUtxcW4zM2tDTVYrbTlrTTZ6SkNUb1FpYzZVcHFsY2lVWm1F?=
 =?utf-8?B?azI1QkJrdk02Wk9idXhOVjV2SzJ3SHRnaXRhb1BQdU1qWkFXNC9PNUxpN0lR?=
 =?utf-8?B?dHRwaHJreEdrQ1lsbk1kb01pVmxNMDBkMFcvK2lpeTA3YlMxMThGcHhTY0pw?=
 =?utf-8?B?azQ5OXhNMnNlWlVmdWtUaFNpV1NhcU1HRXVwL1U4MWs5WGk4UFhrUitBR3NN?=
 =?utf-8?B?c1VoMDJSWnd4MVI3SVQ1c0RmK0krYmZ0N3pmNnpzOWhKQjU2NUhhMVJWRTBP?=
 =?utf-8?B?dC9BT1VRSkhtcDh5L3pRZzB6OTB4NHV1aVkwaGpLOHFzZXcyWDFBYUFPVE55?=
 =?utf-8?B?MXVNQXBCRklscjNwUnVQSmNkNzB5c0tuM01zNXI4eVpFUHlNNDZKUkYwVGY4?=
 =?utf-8?B?VmtDVFkrQWtxSEdNVVJtMGJmc1RzeHN4RUJ6ZURybEk1N1FEcTdlR2c2VVVk?=
 =?utf-8?B?bzR2Sms0VVZpU2loS2tMR2p5TXF2aVFnQjRQcFIzS21la3dLTDlmTlVBbGhD?=
 =?utf-8?B?UFJ3TysrYkZqT09xVzAxQkdvcWdpNzlvVVYrNStiYUs5dm4rWE1ndHhTU1RO?=
 =?utf-8?B?L3FncUhCL3ZVdll5RzcrRWJ1OHBudjNrSFJsR3BiTmVLb01WOXFTV3R1TURh?=
 =?utf-8?B?UUJwZjZ1QndpNFh5SGdjakhmVCtOQ05IUko4ZVFwODd3YjNOM2hRTkcwNUl2?=
 =?utf-8?B?OXU0MVVYT3MwTnVFbjUxVUpYZThmYlE5eGFsZEo5V2NGdHJsbnViUEdtNWxt?=
 =?utf-8?B?MlhqdFVyQ1JBVDNwWDdsczJtMC9nSjMzeG1GaXpHWXR0VldpSDZIYXExUHFP?=
 =?utf-8?B?SkZqUDMzQWpLSFlYSlhxb3RBeXR1Q05XdzRNNU1yRVZ0YWg3NWNUQ0ZyeDE0?=
 =?utf-8?B?bDQ0N210a01mT1JQK0lKZTZvSklvQzdwWENBekVUNllqUFdwZHp1SHRHWlE0?=
 =?utf-8?B?MzlMc3NHN3l6R1R4c3RFUEVkQkZuUW4wZkFZODgwOXY1RFNUd2hVYnRWeENo?=
 =?utf-8?B?V0Rqb0xmT0RGdDI1K0Fid1JKNlVqNlc2d3p6YkZmdUJXaTZ3NjI0NlczOEo2?=
 =?utf-8?B?VThpdXUyOHdzN0lGZlM3VGhmb3NrTmpXbzExWlRMTHNGZU9jcU5lR3pUajlG?=
 =?utf-8?B?cE10SDJCWHN5ZUJMVlQyemdsMyttL2RyYUV0MkFSR1RMNFYyN3NkZWJrRU85?=
 =?utf-8?B?S1VvalQrU1pRMFNFbnBzVE92d1Q4TkU1UlBJdmd6WHo3WFl5VVVzTnBtblB5?=
 =?utf-8?B?TTMzbjArUmY0YW1aQnhGUlFENEw0OUtTQURlbFpxTGdvdGM3M2xqRHJoR25M?=
 =?utf-8?B?aGRDSmVaUll2UHkwMFhJUFFmVFdJYUo5cWJoTHhlbHBiZnAvT01GUnY2dmNW?=
 =?utf-8?B?blhtMVcvcUhDU3JlNHJmKzNQRkRkUlpBclRiaFpBbXpXSndBVnNSY0dXaGNF?=
 =?utf-8?B?eWhNN29pdWx3dUpSUlNleVo5Ri9Pdm82WXR2WU1tK3lhSENLTXRIUVhzZDZD?=
 =?utf-8?B?aFRvRkdQTmRob3EzRzhlN3J5RlFRZmdOY21PMmdXN21SY2xCVGJBTDN2eThh?=
 =?utf-8?B?QWpWYk9mQ3UvcGZnQzNLSEFsNHhsUFpXekdoeXlMSjZyd3NqalhKSjBrYStB?=
 =?utf-8?Q?IdjkRYNVzjo+hG/nL5b5m5rMt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 41dc52bd-04a0-42ce-cdf4-08dd3982dec0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 18:47:20.4185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 plppvlLIq3pClq4Xt5LjOXuXAA0yX2ahP6wvAUxs4bYfJ/JOBcyShFyez+GKMf9oHzmlqIhoABaAS661gNfVfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7748
Message-ID-Hash: LGHCM3MY2CIRRBSSTUEENNWINM4HRWH7
X-Message-ID-Hash: LGHCM3MY2CIRRBSSTUEENNWINM4HRWH7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGHCM3MY2CIRRBSSTUEENNWINM4HRWH7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 1/20/2025 12:39, Mark Brown wrote:
> On Mon, Jan 20, 2025 at 11:48:00PM +0530, Mukunda,Vijendar wrote:
>> On 20/01/25 23:25, Mark Brown wrote:
> 
>>>> +static irqreturn_t acp70_irq_handler(int irq, void *dev_id)
>>>> +{
> 
>>> This really does seem *very* similar to the acp63 code...
> 
>> Compared to PS, in ACP70 wake interrupt logic added.
>> New register fields got introduced inACP70 compared to PS.
>> Please refer below patch.
>> https://lore.kernel.org/lkml/20250120100130.3710412-18-Vijendar.Mukunda@amd.com/
>> Let this patch series go as initial version for ACP70 platform.
>> We will revisit the code and implement common helper functions in the next cycle.
> 
> That does feel like quirks and new features rather than a completely
> distinct IP.

I see it as different forms of tech debt.  Either you keep track of 
which features the 62 vs 70 hardware supports by different drivers or 
add logic in all the relevant functions().

The former increases LoC but reduces risk for mistake (IE avoid oops, I 
forgot this is only supported on 70+ when adding new features).

I'm sure there are opportunities for helpers to be created, but I think 
they all need to be weighed against which tech debt is better to adopt.

Changing code that affects a lot of hardware means a lot more testing 
too.  Perhaps after Vijendar's series lands he can split up some of the 
purely duplicated functions into helpers or callbacks and arrange all 
that testing?
