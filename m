Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA6FA3A3CE
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2025 18:13:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12338603C0;
	Tue, 18 Feb 2025 18:13:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12338603C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1739898812;
	bh=/KcQmKeVEeijOk2bYuJ7KNpC6WQBRUGinNLHYJSgFpo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DRlSHMPQlXIbyHWNFGYHfhMKRd3WliZp5QOzge8Z2qIiK4JY+se70sDHW5m0pB5eQ
	 5gpC8c05fJeIG4R6o4GZOORHc04cM6lkrKMIPDwXKjbAGWYALauZ/iSYpRpwPoIUo5
	 4Ton2Rm4NPydMea5Gg0uJLTO1EZwKCOeBJEzEBeA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0BF3F805D7; Tue, 18 Feb 2025 18:12:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B7DFF805CB;
	Tue, 18 Feb 2025 18:12:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C386F805AD; Tue, 18 Feb 2025 18:12:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20627.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::627])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 194E5F8025A
	for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2025 18:12:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 194E5F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=K/gw1cxx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQaozMPMxZMvo68njQ4e7QzLlSP9r3LdQxlO6AAINbeMF5PKTJciw1v7etT2705i/bqNWFvYVa5OC+K2aIZ4ewPy/4q4mlcjgZniaGD3QfyizmvrT4LecDPj5+qsb/T4xiZDtTNrSwdW3NlWzTqaFTp8uMD89iW2lGMGPDYqwA5VYR2gPWolLLKzx/5xULpDedCS7+U6OOWhCjSWKAxt0byMUBtUWC+m3oxGbbok92NGt1urkiH1h25hOTCvm1B/ix9grNx44gnOYy1b8+MoIBbmWgFCXCwpBDUNLCa/pVIBLFA7yreDifJmX/O3I4g4D4L4z1laNbtW/GZH4Fgs4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6bJaFARX06hNbmeOYuneYSk0yjSmOLKh3uwDI+NuUE=;
 b=p0CzFn54M0nUHzICKgTG/VMtfbOrPbrcgmNXZ86JwHC3BagwuFtVJqsNlioNRnCE2d306nbNTSpqHmfC+/tHhrqv9pqlvlyBxkfNJyaTq6gs/eczXYrt99752cA8llfKlKFRjvf1FkadlP5sRXhwBNax5BJ3QU7WjqeoacsnXZmXz2lXPRr+VSVNtMEDwHYQ6u5vyIJ1/y2mNVy6gABzKkLynyTe24qSu6xr/6iXqsc9F7jq5aLIRQLkNrcFHD3mNJUsZPEwXec3zf+HrQo+BFUiq7ssaBv9iYkotUikDPAjcI41yjpKgTgDjK9zUWDFlz4ODkS8vFm5DoPx8zfeWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r6bJaFARX06hNbmeOYuneYSk0yjSmOLKh3uwDI+NuUE=;
 b=K/gw1cxxWJqIfNMOZf3j52P0mwtdNPWCZvGEy6cFMUURPVV/JwHph3q/qDyu0Si/wPuJ8Ut7qaKHvzjRnzEWYOV6Pli2RzCrsEIyN+cptlBZqOyn5gm6PE7UBcPtIm5o4hcaQxUBxyqGTHNKaD8ePp4qbKdHbq/fLQp5F4KYqhY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CY5PR12MB6622.namprd12.prod.outlook.com (2603:10b6:930:42::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 17:12:37 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 17:12:37 +0000
Message-ID: <dbe31e75-15d0-4001-be0c-2babbd503a40@amd.com>
Date: Tue, 18 Feb 2025 11:12:34 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: amd: change the log level for command response
 log
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.dev, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250218065924.917915-1-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250218065924.917915-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0121.namprd11.prod.outlook.com
 (2603:10b6:806:131::6) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CY5PR12MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: c8dc337d-1f9a-4858-1faa-08dd503f714c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UGE3VnRMYklrZWtmMXNCUzhLdERudlJRd3Q3UU44VEFDNmg1K2pPSnphRkls?=
 =?utf-8?B?QVIwbVY1dFFrVjlUakxsZmJTZ2VOUTVObm9CbFdhQm5jYkJFNE5NVDFxeVRr?=
 =?utf-8?B?SVpVTDNzMHl1Qy9mWmQ5TnBEYTlFeE1NSFo2aEQ5RlpZL2FBTDU1Rk1IenU4?=
 =?utf-8?B?WGNEaVN0c3VrT0I2cXpBait0YVEzN0hpVllMSVJIUndLVXgvUUdyZnRTVm9t?=
 =?utf-8?B?UXlzRm85V3RES3lsamxrbTNyK2xyRWJEN1kvQWFNVVNFbXV2SVF5Z0htaWdo?=
 =?utf-8?B?dVVjckhNdDRTbDNqTHlvdi9qQU5rKzRSZVl4d1JMQjJVSitlVzFhSWgzK1hE?=
 =?utf-8?B?ZTZUTis3M0xFa2JFaGc4UnZVY29JSy9hMWlENndIT29LSFpPSlFNcSt5T1My?=
 =?utf-8?B?R0N2SnlTTjBReklwY0RNNTJOdy9FTFlsdDdaSkErQ0wvWUhNVUkxYVVMSHFW?=
 =?utf-8?B?alZqKzZJRXM2czd1bTZUdm1CREk4d1lNQzNSTUNQR0UyeTAvbEx4OHpOL3A5?=
 =?utf-8?B?bWE1Mk1RZzFzRUF6TEJ1b1RMOVg1OEM3RWVoNVZKNHFiVUJnYjBWMW9sMHpH?=
 =?utf-8?B?WXF4K2p4Q3FFb0V3cU9vRCtvRk9lVTJ4WEJYTVc3MWh4VExyVnRmVFVFM24v?=
 =?utf-8?B?RlViL0cxbXBZbmZEeUNzeTQvaFVEdmg3UTJQN0swbm9lRVhjVFh6UXQ3NE1G?=
 =?utf-8?B?QW13RnpaYlF2UXRUVFJZbkNKOFYzeWpXZCttY3lUZzhVak5ibSs4RUNqVjEv?=
 =?utf-8?B?VXpBSkJpSnVpOWYwdXFVbFZkY3FmNUlLUTM1YW0xRUJUNzZXZWVSVmxEaFhQ?=
 =?utf-8?B?VE9ZZ093UGNyOGxEWDFJczE1Lys4TkdTZTJJaEJkWXAwMitHZzJ0d1ZFeWdU?=
 =?utf-8?B?ZVVNbWh0NE56NjNhN2JtME04b0J6N3JSbGhkMytTdkh4MG8zdThrSktmN2Jx?=
 =?utf-8?B?NVRXZzFQbm9uRHhOa0w5Ym80K2o4UzhUQzAvd1Fta2RqMVVLSVRSSmFod1B4?=
 =?utf-8?B?aWNXRDhoVkJHNGNBQXNJWGRXVTl4T1p3aDVWQ0tKNTJlckNWU2RvdUMvN1F4?=
 =?utf-8?B?ZTY0b2l3V0tZNEZTVHNLUVBUR0lGdjN6QmNUdUNibEhzYTFueGp3dFplTlRI?=
 =?utf-8?B?Y3RUVHVtVXc2RTI3dGJSZzgvQkdocGhXQ3YyN0JjeHFqcmJBaFZtdGlDSnZX?=
 =?utf-8?B?OGtUNlFJbVlIKzZJTmVPNHZ4d2w3aWptTmlJNTNQZCtPSURaV1BiNE1iZU0v?=
 =?utf-8?B?ZlNnaEVNRVZFOThtc0VkbXlETWxJalRkMmVTSi8yTzd4OEUwaHBzS01EcVNK?=
 =?utf-8?B?MVhyamZJWnRJWHVDYTVBUXB4QXp4NE16K05kaUZ2R0hWY05Mb0VpVVg4N3dv?=
 =?utf-8?B?YjIrMGMvRXNWMWRPYjJjeVpETi8wMGZnSjNSemMwWHlGSmxIWFMybE9pbXlG?=
 =?utf-8?B?ejZlVDh4RTFtRGlJNTltcVpySEpYZWFyS0tTTi9rM3RIWGI4d2NaaHFCVDVs?=
 =?utf-8?B?TTNYazRVbE1vN0FXTllGSzJMR2lWa04zU3FQRWFGclczQ1lFd2hlY05qNmo4?=
 =?utf-8?B?ZG9uenY0QjgwRnZaekxZSXlGTjFtbU9jZEJmWkc2b1ZwVDhGNEo4NERGTy9x?=
 =?utf-8?B?amVOaEI1WERZWjNWVk1RRmRUSys0QTN0VEFKRmdWUloydGNWSUxUMTNmdVZT?=
 =?utf-8?B?dDA2NzRKRnhxQ2ZMa2FzQ25qTnM3cjBiUmZreTZuSkVjcDRRUFJyUktwN3hC?=
 =?utf-8?B?cm5tME81VnRxSkxJbGFnVkFmLzBIWThqbTZLdjFmNFFqVVM5ZnZNM0pYcVJm?=
 =?utf-8?B?dW9qbmRVcnFpTnNhQy85cEE5MkNSV2preWdQZE9QcFBHaUFjQTlMZUtxQ3VY?=
 =?utf-8?Q?DDy2tDhqOKjvJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MFZRczlPVEpSVjVkMWFQWkdUeldTek9MaVNLdFM1UVpSMm5DdExFY1UvUXJ4?=
 =?utf-8?B?SitmY2VyZkdoenMxT3M0TW1uTVBwamhwWTJNcG9lN3pkUTN4K084S2xXUjlr?=
 =?utf-8?B?ZDg4Q2ZhekVlTUQ0bUJBNHNyblBEZDZLbm9SMVJGMVY2U25TV25jNGJqQytQ?=
 =?utf-8?B?VTdQQ1ZNRnFGTCtJRlpDb21FZGpmdUxBSnl3cW1GZE10cWk3VUsvTnNXTU1K?=
 =?utf-8?B?R0hTc3ZlMGMvVzVUVm8rd3IvZGRJYkd5K2tieEFVMnAyM1NKRXJNa01wRlVF?=
 =?utf-8?B?Z1FERVlGUmVJaGc0RDdRRjBibmhIbC9ScFNYYm9jN0xFSHJqMERWYnVLeW9o?=
 =?utf-8?B?NEtsbGQzZ2xxd0JnVHFETm5HbWlmODd0cFdNOElVdFNoYVZLVjBkckRUd2lJ?=
 =?utf-8?B?RnlUdHk4N25USFkwVUhucjRmWVFuYm45aERWZzJGMXZyK0l1TTFGanVkRU8w?=
 =?utf-8?B?T3VLRUhoTXc1aTNYVTFzKzJEdStDQU43MHlmQmx5aURRTUNhbThJOElBMktt?=
 =?utf-8?B?THlyU1pKNGpIVlgxK2ZUUk1TaTl1ckpQTW0rZ2FRa25UcDg5cmo3bmJMSzFE?=
 =?utf-8?B?NkhuUWFvblBKT1MrZVlHYnhCdU4wUnFtS1Zpd0V5QnFyU3hnNE4yS0FvVkg4?=
 =?utf-8?B?eGwvZzhWQkpZck8vTm9CcFBNMkl4U3RyU2dobXdMY2R6ZnVqZ3VxOUlCOVFj?=
 =?utf-8?B?RGh5YTNtU2MxTHlrZGMvWnpxbjJjbTRtdlJxVk0wM3NwY2xxMmFSZU5nOWs5?=
 =?utf-8?B?dk1BajJZT1JjL2FDV1R6bjZYLzF6SkxBUThWTEd5a0hicDFsMnJ3bmIwTkFm?=
 =?utf-8?B?bWF2ekVlYnU4NUw5UksyeUg1VWZwYmxKeUQ5UUNEQ25TTCsxdERlOEpLUTli?=
 =?utf-8?B?czRNTG9IcGNUdXdsdzNEbHcxVnZJbitmRmg1Qm1PMkNWRE12RnpMRDVzNjdR?=
 =?utf-8?B?MUR5b1QrWW5tdkxVQmU2Vm9iczJweDZUVWQ0WDgzdzVaRy9iak1oNjVQYkla?=
 =?utf-8?B?b0tZOG9KeGhWWGpRdW83WHpHYXc4Sk5qSVY4S3psM3B4M2R6OWl4aWxzTkdB?=
 =?utf-8?B?TjRNSnpNdGIvM3lBNEpxbU5NOFp3Sy9tWVIvWnZlMURHMU12M0dsVi9XMHpR?=
 =?utf-8?B?UFBIVE43djFqOTkxN0xYRFpqVVlqdGFFMVpweHdtbUd4MVJXV0tDdG5mN0J4?=
 =?utf-8?B?ZWJqakIzSzE0R1pEbDhiRXFjVVFyZzZ5eEsvTXA5MXl0cTEwYUZQOXIzZGpa?=
 =?utf-8?B?cnJNZ0l5eW8zS1NiN0dhbWl3UFhtbmVmOHpySmNPVVdrbXF2STluVlNDOXhO?=
 =?utf-8?B?bnExUG11SVRBZjdVaG8ybzB0TXpmS3dpQmk0T0ZHUEVuZ1lTd2ZvY2luSEZv?=
 =?utf-8?B?L0plM09DeHEvOHhESjZjUmV1bkhocm9NbVdhbndhYTM5OTQ1bDA1bW5XRk1s?=
 =?utf-8?B?WWlhZkFwbkc0d1F3MCtETmRsNXZkaVo1dHM1VEx1Z3FVY2R5eTV5K2hXQjFt?=
 =?utf-8?B?RGx6VnZieVFjc2dVYXdra1pyQTUya3MvYlF3Zlc4dzFwNlR2amlVWXM5RUhL?=
 =?utf-8?B?Q0l0OUZ3UEdqUGxPZVdtVGp5TzBEc3IyYlROeEtST3prc1dNTjBac3gxY0hU?=
 =?utf-8?B?T01ZYmVYMFNYclF3NzA3b2VHTzN6ZmEwMGh2OG42WUZ6akYrbVNuUUhqQ0ls?=
 =?utf-8?B?QUI4Z0QvdFdpOUhsbEI4VlcvaVMxVFFKMUE0d2lhNTJ0MlNTQkdHV0RFdGE3?=
 =?utf-8?B?OWRIWW5sbTBJY3VZVjBvZE5aRUdZdGp2SWJlR080eUJvVzE4eGVZUCt5YTJo?=
 =?utf-8?B?WFF0dXNSUERUTTdUZ2dNZ1JmbG1CTDNpQzRhS05JUG1STW5JdFBlZldUcndl?=
 =?utf-8?B?OUh2R1JETHJHNEs0WkdUZVExbFhtVGZkODc4dW9DbUlDbTMrYXk1eUNTYW0w?=
 =?utf-8?B?emhUaTJUblhuQ0M4eHcwc0NJWDRsdmJyZWkza3pTcHRkc2FrUnhibEo2WStw?=
 =?utf-8?B?RUNhOWl3SUhFcjZySzB0NzQ3UER2OFBERnRoQkJGcmd0Y2dhQ0dmMURzYVZW?=
 =?utf-8?B?UHFBbkNMaXlGanpCVXJuWUQ5T3lBY2FlM0xJUFVOOEFEK2VGUEtLRkZMWWNU?=
 =?utf-8?Q?ZDjgzqgVJ+i6w1xJAFWXZCCrs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c8dc337d-1f9a-4858-1faa-08dd503f714c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 17:12:37.2844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qg03b0HlnaC4FsyYxxeVh3HipNNwCHM/2Mm5l6cXro+FaTzwAq82u+kO+KPbrOUZywG4VWi5n/K9FBwEOBZmmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6622
Message-ID-Hash: T6PNZTRWHKB2RNYCQNWK4RUJXTUWEBSO
X-Message-ID-Hash: T6PNZTRWHKB2RNYCQNWK4RUJXTUWEBSO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T6PNZTRWHKB2RNYCQNWK4RUJXTUWEBSO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2/18/2025 00:59, Vijendar Mukunda wrote:
> Change log level for command response log to dev_dbg_ratelimited when
> command is ignored.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/soundwire/amd_manager.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index dcf85f94950a..a12c68b93b1c 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -346,7 +346,7 @@ static enum sdw_command_response amd_sdw_fill_msg_resp(struct amd_sdw_manager *a
>   					    msg->dev_num);
>   			return SDW_CMD_FAIL;
>   		}
> -		dev_err_ratelimited(amd_manager->dev, "command is ignored for Slave %d\n",
> +		dev_dbg_ratelimited(amd_manager->dev, "command is ignored for Slave %d\n",
>   				    msg->dev_num);
>   		return SDW_CMD_IGNORED;
>   	}

