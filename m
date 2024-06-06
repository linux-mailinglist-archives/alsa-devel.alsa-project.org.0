Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A568FDC4B
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 03:48:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51124A4A;
	Thu,  6 Jun 2024 03:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51124A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717638517;
	bh=H0cNo8FDxklslHwi/9RgivYl36ZzTLDaKiiyxrMoO74=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u0ZCfGz+cAkqOuMTyAzH7iqyoaVpv7GJWg4rCKtM/Qcr6e6HBgH/pXmewzYsXJV6I
	 HGJCEk2K/Nmo9DktqbKvTdfqokIIoMx5D7NkWAfY3Sd21CbJzVRHIqHz3MbLrDvh3n
	 uLsTJvrQfoVsvgdEYzkXepHaYE1q1DgT6hkAgqQk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C433F805AD; Thu,  6 Jun 2024 03:48:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B2C6F805A0;
	Thu,  6 Jun 2024 03:48:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18D47F802DB; Thu,  6 Jun 2024 03:47:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2407::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C7E2F80088
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 03:47:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C7E2F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=YAja5Rhq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kq0yETr/x2tk72znSp4cg08ChYgUvDi5fLYIRvn3VB5UCKyGvH85O6unlp2VlTYC/btG9Az+adwoyVOOIikcoVTV0pRQCmgrAcG6bwmiH5OK248iFQ7JTgVUI8r7t1OHE3I6Tf2E+VRH8ViSbfWcsbwnKLYEoKtsy93fX+OX5YK8JFBLD6CydZQO4nut+rfRHsM6qsp1zxOqgActaZu2FPpQ2JUlL+B4Yx9xDONZcqk/vD4DuhHKgf2m5NtWSadMEKcrfs0vm1//2nkwNAjcqofhbw/WLJ9AEtsLLsYm7AN2L5r/H0Gd+/sMTrnKEPJ3y6dcvUdtjd3s/j8GJ8VpDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvZsfunR/L95V2SpIFfbRWWw9CbbeEBlN5C7sbKAJNY=;
 b=X5x3atoYfY1cknPDjLeoolmLucqC+XA09u6FaLgKPVvlj4QhgEjbAP3wpPf8gxT6tP8QS3M9p5+JNNisEv0YeBBae/ckKPgfPykVlUaOgqvR1Y/qNdHo3dbbO9yr6g1FzOw3WcH+ZQ6VEFMT/OwyDAnWwY/T1/sdPw/LDbv4EcjjMAYEsfKNu7GDUxHSFgH+nLi9tutd17CSaRS3IQnMFhqDAr53NqWdtXEJDnlRZDmohUeIMh8UN1ZUcJGK9gJ/gRKJkZH4RVQHqkwm/TLFFCDaIoQCT2upN8JUIXorLsD1yoQtw8G6vZFULDbe/SefhXEewCt4wq49I2nuj998cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvZsfunR/L95V2SpIFfbRWWw9CbbeEBlN5C7sbKAJNY=;
 b=YAja5RhqoEac4DS8PP3pII5SCXQt88FHs4QBL40OTrdDCS7gb080IhyMTGpkeq77nqjuVF0Z2gsRRwX1CtwzJ3PF7RSB32tvDpX0Dn1TmokdxuycM42e4DOD5GXO5sqSA01VnOCJ4obzfWK1EA4004OGIYId0dZvB72Oug7So3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 MN0PR12MB6125.namprd12.prod.outlook.com (2603:10b6:208:3c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Thu, 6 Jun
 2024 01:47:46 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%4]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 01:47:46 +0000
Message-ID: <51f41d3e-7ed1-41f9-a067-f015053e608e@amd.com>
Date: Wed, 5 Jun 2024 20:47:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda/realtek: Remove Framework Laptop 16 from quirks
To: Kieran Levin <ktl@frame.work>, Dustin Howett <dustin@howett.net>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
References: 
 <20240605-alsa-hda-realtek-remove-framework-laptop-16-from-quirks-v1-1-11d47fe8ec4d@howett.net>
 <2099135f-871a-4d8e-a957-6bc374407fd8@amd.com>
 <CA+BfgNLHM66-K6i-mQoAFWdSouSqA8BO=CerMNu2v693HMks_g@mail.gmail.com>
 <CAJFf-=r2SUJh6=G8UWQqRBwSFZB7_LArB9t1tTNSDoFjJ4=XMA@mail.gmail.com>
Content-Language: en-US
From: "Limonciello, Mario" <mario.limonciello@amd.com>
In-Reply-To: 
 <CAJFf-=r2SUJh6=G8UWQqRBwSFZB7_LArB9t1tTNSDoFjJ4=XMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:40::29) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|MN0PR12MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: cf988769-0b85-49bb-5103-08dc85caa9e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UDNOU1dVelhodkhNVjRmNit6OVdvRmtUckVtVGVlSm1zdytsdU1rVEVqSjcv?=
 =?utf-8?B?UzlKVVdWaDZ2MDlFMndUK0NSeExjbERpSmtwazVJbTMwS1RiM2xpQm9jRGR3?=
 =?utf-8?B?RVJpdTFNUGFkR2pTV09ocnpxL0tKZk90WkMyRjRpOW5Hak5QZGJVMlhya3pk?=
 =?utf-8?B?bHc0YmY1TnEyMTVWSnBXR2w1d1NROFpadGw0RDl1V1B2Tzlrczk0RXdjaXdT?=
 =?utf-8?B?VUtsZG1IcC9uR1JSTU43dGNHVTdGRngvdkNyemFYTTZjVWJCWDMrWUNBU0c2?=
 =?utf-8?B?VWplUEI5Mm1XSTlFMEdMUU9yODl5S09WakQraVJ6bGt6eTk0OXVVbDlDc1Zt?=
 =?utf-8?B?NThSN2c0OHNvQ3hCWnREQTI5cUQvVnlLSTgrSy84Y1Y1R2FxQ0NjbllzQkxW?=
 =?utf-8?B?T1VzR3RTQUZjTmF6T2gwVXJtU29mVXdwZjZESFVpV3hzQW1xVFZyMkszb2JO?=
 =?utf-8?B?UnNmOHRCR0YwSnJFQnFtaVdrNUl4UUhXSEhWREpDRUNZMnNEbTFMQmhkUi9J?=
 =?utf-8?B?R21hNDhWNldzQ3FYV2NpbTdOdzQvVVdkQ2VtVGwwZEprQlpqb0pNbC9rRXpy?=
 =?utf-8?B?L2tGOW5KaWRoYVAvY3ViNXc0cTVpNTFQL3FSUWFMREpONE0ybEY0TURXOUgz?=
 =?utf-8?B?YUp1QkM2Qm1yYldmbitGMEM1ZS9iUEdwMng0ZW9OY0o3a1UzQzNseEFzVXBh?=
 =?utf-8?B?RXdUK3pUaUFiZnd1SE9TTkY4WGtLcVU3Z2lNYk15S0Q4OE4xbUdXS1lVNXBl?=
 =?utf-8?B?c2tXc0I3VVFXZHNBWFRYY0RzZFB3cDZldGp3ZTNYTFVhVjVpcjRjeFJuNFVF?=
 =?utf-8?B?NERwQSsrWFl1dnBLK3paZUJLR2xSTE5kRWZyVWNRNzc4OFUrS3JCaEdkK0tv?=
 =?utf-8?B?dHJrY3NNTGJZUzIyTmZRRllMc2FKcXpEN2dDYThxTVR3c28rdThQRjgvY2dp?=
 =?utf-8?B?NDNkRFp1VmVUK3ljMW1RRlpsdjFidmlZdHh5ZWwzc0JtYVhDU211N09Kc2tL?=
 =?utf-8?B?MVZ2QlRaS2tZMzFWUGJGMlBrb1dmMlFwVUx6aGtKdWMxTnpIdjZWdGsrek5w?=
 =?utf-8?B?Nk9lWnNKWnVuNWtJMm5XMjMzNDQzQ1JkQlRaNkN0dTAveXRrL3lselFVNHZp?=
 =?utf-8?B?L1dVRCtKV1ZaV3BwZUlycFRHTTRhL1hjK3R2WDBzMWNWS3pITTQwT2FLamtC?=
 =?utf-8?B?cHZicGdwbGJmbWpLbk5LeDU3ZXhTd0gvQ1BuamYyOWRvOXU1T2k0MkhkQ3dq?=
 =?utf-8?B?aU80MUgyc1doVHMxd1B0Y0Z4cGUyT3BET3dSOFZDeEMyVXVWWEZIMWVTMVEz?=
 =?utf-8?B?TGMyRkQ0R292eitxODNPSXlZSnpwb0ZXK1J0SEFuR3hoYUFwQWVkT0E4b0R6?=
 =?utf-8?B?V0d6RDJTY0RUQTNTUE8zdXV2ZVlkQTVkVFlBbzlPYUY3MXN4aXVlck9QTk1M?=
 =?utf-8?B?OENSRVpRdDVpNkVOQU56dGNwSUNja0JIODJMSCtIbzdQZ3lXVmc1dHVaQVlu?=
 =?utf-8?B?R0ZMa3JmNkczVFAwbzkvVGVQaHJkQ01pcEhSQkZabVhsVHlzajF0TUxvRmpT?=
 =?utf-8?B?ayt4eG9xeTFDN1U1VkRiUXFwaE5RdmJaalU5UWd3K2pxdHJ4QiswYk5zY2VI?=
 =?utf-8?B?bjBQbU5kbmYzZ1B0RFBKYkhGSk1SbEdJc2laK1ROUVFSenpWNEs0MU4xc1hD?=
 =?utf-8?B?alRLSlRRdXVIdlNVUGxHR1NFVkRhUDlXc2VhaURrRkpMSHRGbzBrSjBnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6095.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bzhHTlQxYldtSjNXR3ZzWXhzTzM4SkVXSHlCandFL3BIQjdrUGlKdGpRb01X?=
 =?utf-8?B?T3RzSXFlTytPRFhidE95VUxhTUhyc1N4aGhSaHZpNWVMMWdQQi8wNGNjVjBR?=
 =?utf-8?B?ZmgwWEF3VzZNdzRVeS9qeXQ1VDg3SmRmdHA3Nkl3Mi80NmdkWE1DRW45bG44?=
 =?utf-8?B?TmVpbUxCUnJBcktMMTh4UXo5Nk9ZS292WGRwTmJ2dCtlNWhGWUdSeDI0MU1w?=
 =?utf-8?B?enk5eU5aUGJ1V1VHdngzeWZsWmNoQllTZ3FVQ1A1VnlvRnE5ZnUvaGg3UmRU?=
 =?utf-8?B?ZlpsTWRROWI4NHdnQ09jMFppQyszeHpvdCtLaTRyLzNBcnAvQmdYSy9xeFhD?=
 =?utf-8?B?VUZWM3FKRzVaMm8wZHJSekg2RVJwUm0xMFNES0Q3RTRzdlBtRWYwTnQvL3RE?=
 =?utf-8?B?M0p0Q1dBa3pVbUhXNHoyNlByU2pqSG5kQTNwVStjWkNPY2JLc1lxNXQyWjkw?=
 =?utf-8?B?UFNqaVVVNHl4Mm5BelltVVNmTFZCUDhqV1psK1QrYmhwRnBUSUtBWVlaT2x4?=
 =?utf-8?B?ekJ1RlVHdDlFeDBqQm1MemdROW5pQVAxaXFNeDE1ekRuZUJobXpPM04za3Yw?=
 =?utf-8?B?ZXEzaFdXMXM0blF2U0E3Tk93MXViakZyZ0RYYks0S1VjdDlEeFBYbVplWlVG?=
 =?utf-8?B?M1B2VS80TFlpRFFCRERMSUc3WWEzUFNiS085cUFwWmJVTE1pUC9QRUF0RnFI?=
 =?utf-8?B?dUs2WUNvMThrZlhDM1U2SlE2UkFjMGlUR0UvNWVoSFk0T3hCenJwNGg5RjdF?=
 =?utf-8?B?QTNxNHBBNCtGTFc3VEpWYjM5aEV6WE5iZ2cxRVR3N3RnODByRGVyRkxZOTd1?=
 =?utf-8?B?SVE5YWVTaldjWCtWMlNtK1V5ZVZvYlBXbG1NUTJmK1k1bmUwa1NHM1hBRExx?=
 =?utf-8?B?TDE1M2daZ3JxR1haZzhkQUVJdURJVkxscElMQWIvenNuWXE5bzl6QnhaUEZC?=
 =?utf-8?B?OHFIeUpnS1I0OFlQaGFrbDRFdWYzZXRoOGNCNDl2WFFZUnJ0TXpTVkdFS0R0?=
 =?utf-8?B?b1lhRXJLdVQ4NVJsNTFaK1FhZGJlbXNTY2QxOElqeUY4M1JwYm8yeTlzVk1p?=
 =?utf-8?B?bGZjdGg1QmFQZUp5QTNBSUhaUmlaamkzaFFZaThKWWpjcUViTThqUkJyVGtH?=
 =?utf-8?B?T1ZKTDFVZmVrRlgwMngzeW5CNTRBcDZaWTlWYVExWnE2ZEV5OENZWnVBYjdj?=
 =?utf-8?B?WlllaDIwQ3ZHcVJ2b1dLZ3k2V1ozYmxzcE90dlVYRDA2ZWJ6eDNPR0poeHlS?=
 =?utf-8?B?T3BaaVh4YlloZU5DS1NnYWdlamM4VzFYQ1JKYzlMNjVTTkRQK2hLcy9mdkda?=
 =?utf-8?B?T3FSZXZzUXdTYy96S1BhV1hQTVVOazJaZ0ZZU0lGQ3JNSkcrbGdDczQvVjhG?=
 =?utf-8?B?eWNWVE9jMnNaQmFRdWFVN09VMFd5NytlamxhK3pvV3RCSGdKdkdsWTd1QldB?=
 =?utf-8?B?bGZ2bjhiekpOR255bGpkci9xTXIvN0lQOGJReW9TNE9ab0lSUGg4Z2VzU0d3?=
 =?utf-8?B?OU9idHdPMmVDSjUxQXFVRHdFV0RMcVVPU2JsVFpLalFlRGp3dHpma1ZzeEZD?=
 =?utf-8?B?WUxyaHJybzRhNWZFZS9TR1VkUExrcDJtNHc1N1hORjNXQ1RrMUJOK1hYQ2k1?=
 =?utf-8?B?T1dmaGJhODZZZjIvRFpGSXlqYTgrOU1zMW1nSkpXNjdGckdhZ3NnZjg3dzAr?=
 =?utf-8?B?ZzFWbGF4MGJINjExTlBNbVZEcTFneDQ3RFZMTXlBWHFnWThSYldFMFI3UHJi?=
 =?utf-8?B?NGQ4MlFLSUNDTTJOSHZOcW5PaEhzd0hpZjQvb05qOGFiV0hSZmVocjVRc0lD?=
 =?utf-8?B?Mm9iWFZuMjk3TjEzeUFGOUVPdVJQUDhWVFZVZm9MbEpISnJqSG9rSHdObjNV?=
 =?utf-8?B?NVpMT2RvZjhLdEt0YjEzb3NsNzNKd0EvVWxBZmNKNmRPdi9WbnJYcGZHZGpD?=
 =?utf-8?B?ckVlVm9qRmhkUG5OQ2lmRVVqeGdPR3p6WEhmKzNYV2ZtVnBTZU5GUHE5R1FK?=
 =?utf-8?B?cjZUSmlVYmFQRlREMGZyQms0UGtRWk11Ym1KSXZJbm1iRm9kK3psN1ZYVjJ1?=
 =?utf-8?B?UldWaysvUzBvVXFhenltSlJieG8vY2pQYXMyK3VHR3VlTEJDTzBsK09yUklU?=
 =?utf-8?Q?Wk3WlBx3LdhFoALJKRcfZ8+gF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cf988769-0b85-49bb-5103-08dc85caa9e0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 01:47:46.1901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iFSotpPBGr3uO4lCmEdTYgGoYD4uQzIjf09338vmSeTodnhCppZRNwt1g3iJ7ml+MWzhllqaA1pwJUQDFheAHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6125
Message-ID-Hash: APWZDSE6JSRQMMNJXZV64FAGIOA5VU4U
X-Message-ID-Hash: APWZDSE6JSRQMMNJXZV64FAGIOA5VU4U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/APWZDSE6JSRQMMNJXZV64FAGIOA5VU4U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks Dustin and Kieran.  This approach makes sense to me then.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

On 6/5/2024 6:15 PM, Kieran Levin wrote:
> The audio expansion card has a full usb to headphone jack codec. So does 
> not interact with HDA at all.
> 
> On Thu, Jun 6, 2024, 1:11 AM Dustin Howett <dustin@howett.net 
> <mailto:dustin@howett.net>> wrote:
> 
>     On Wed, Jun 5, 2024 at 12:03 PM Mario Limonciello
>     <mario.limonciello@amd.com <mailto:mario.limonciello@amd.com>> wrote:
>      >
>      > On 6/5/2024 12:01, Dustin L. Howett wrote:
>      > > The Framework Laptop 16 does not have a combination
>     headphone/headset
>      > > 3.5mm jack; however, applying the pincfg from the Laptop 13
>     (nid=0x19)
>      > > erroneously informs hda that the node is present.
>      >
>      > But doesn't the audio card work this way?
> 
>     I don't believe so - the audio expansion card enumerates as a USB
>     device that is picked up by snd-usb-audio.
>     A headset microphone connected to the audio expansion card seems to
>     continue working properly even with this pinctrl change (synthetically
>     tested on my Framework Laptop 13, mind you -- it is not a perfect test
>     :)).
> 
>     d
> 
