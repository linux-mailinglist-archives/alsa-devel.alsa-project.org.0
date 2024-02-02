Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C3E846D57
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Feb 2024 11:07:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C95D846;
	Fri,  2 Feb 2024 11:07:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C95D846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706868440;
	bh=Q030bTPv0B+lIHI3YD/SAkxJDvI2UaXveZN+pP+DHUo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b8t6BHvT6mpAzJYOOzKvqN7gz8QX4YbV7uIcBCFWEX7itilGUmShC2K6ayklHRi+q
	 JauAPNKJLM+PwzYUNruptABVf+dH/9y1k9dz8R8BW/+psDOIORSzNQ1usentH2ZaOc
	 eNKI1MajAbsQ/4CtojW3DrJj0gpsuKHlIg5JhMJk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C108F8057F; Fri,  2 Feb 2024 11:06:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 229CCF805A1;
	Fri,  2 Feb 2024 11:06:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B14AFF8055C; Fri,  2 Feb 2024 11:04:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from HK3PR03CU002.outbound.protection.outlook.com
 (mail-eastasiaazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c400::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03C55F800E3
	for <alsa-devel@alsa-project.org>; Fri,  2 Feb 2024 11:04:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03C55F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=KdZAt743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXp8fcyycOLghKlmFA8RHCKPlXtfR3PMmXk1BAmc1L6dSMSYjU8CIAhTp5PW6Wgs0ImuX8TRt/04U1LUrXZifD/cW7n/iOJCKooJRtuGmyt8KUa55T143He9jseyzGjQrULYnd9MdYpJ0zvGTbamxmV0DWTBKa7Jj3F0ixJsMamdXxzvfP5/OnLXfgRcq+vRz4Un/SDcLdGwqd0Q20ZaTqVLrgTh2LCNzeFnZBAEN6VC04EjQe3ELBLhJTTluIQoE0sO6ZXgwuVVKF6Of9XV367VX/8BAuePhcQAMk0ziV6DF08OYTjEhLH2MxCNz1lOWR1yoSjBrtNIL4IUTDEtWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHNnWRHgl1DhAUieofG+D+9PLEHoRlzGRykNxlX5Rrc=;
 b=MnrPAxNh9vHPEU4qt1J0cr0VUcQiv/qkY9yuTnNaGV8iOmjSHVagYv4FKQ8kySxl8MuYSXX1tqhvoQowBlX7DuLgEwZEqLgq7Tbs6//EKLkWJbGBH6PRmJ+X+3gBXG/eZOT1o1nd1SFG8adS5Jb+Rx2Hu1gUWYJFMK7TMlNBc2GhcQrgbaKjKmsQW8kbyzr+ivmxlphMtSue77HRYDOcZQUmbzPwKHLX6zICYOlS2S8j0Jeq/1xvt5l2W0QBEsZAuLGB82g7pVr5OZTSQ/6oNQl7SJxroJMNQTP4RQ08jqOvm+UHngLdo09Jp7G8PFtVUHLP2vkhRuuYEhLYFjyeeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHNnWRHgl1DhAUieofG+D+9PLEHoRlzGRykNxlX5Rrc=;
 b=KdZAt743Xt43uZH0dxJxyIV3vrZZlNBZwOFZr8xIY5O3UXz20DYu28jOtETce7nfilvgobnitChcaoMzthMDotefQw7fBntUZAYcsLRQhT1xEL6nx9rsgGweoZXJnrCpWxNPvcljkkLxwB86HTjW/0QEZJoxGInTTmOcb2VSz/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nuvoton.com;
Received: from SL2PR03MB4348.apcprd03.prod.outlook.com (2603:1096:100:5c::17)
 by SG2PR03MB6280.apcprd03.prod.outlook.com (2603:1096:4:168::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30; Fri, 2 Feb
 2024 10:04:16 +0000
Received: from SL2PR03MB4348.apcprd03.prod.outlook.com
 ([fe80::b6dd:f297:1b48:e1ea]) by SL2PR03MB4348.apcprd03.prod.outlook.com
 ([fe80::b6dd:f297:1b48:e1ea%7]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 10:04:15 +0000
Message-ID: <591e12e6-117d-28b5-986c-83414ebc6b4e@nuvoton.com>
Date: Fri, 2 Feb 2024 18:04:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Added schema for "nuvoton,nau8325"
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, conor+dt@kernel.org, YHCHuang@nuvoton.com,
 KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, SJLIN0@nuvoton.com,
 scott6986@gmail.com, supercraig0719@gmail.com, dardar923@gmail.com
References: <20240122095650.60523-1-wtli@nuvoton.com>
 <20240122-daunting-woof-19fac5689bb2@spud>
 <04945799-eded-42f9-b8fa-8907be44c400@sirena.org.uk>
 <20240123-bottle-elevating-9fbba5424014@spud>
 <185f3912-5a92-4ef2-aac4-0df8363d8727@sirena.org.uk>
 <20240123-brewery-roving-b9ebc70468f4@spud>
From: AS50 WTLi <WTLI@nuvoton.com>
In-Reply-To: <20240123-brewery-roving-b9ebc70468f4@spud>
X-ClientProxiedBy: TYCP286CA0215.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::6) To SL2PR03MB4348.apcprd03.prod.outlook.com
 (2603:1096:100:5c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR03MB4348:EE_|SG2PR03MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: 441fbc43-70db-4222-367e-08dc23d6503b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4c2czTmVr3XJUoOucOK2zakk68qDlugH91VPeRG9839u5Fp49bt4Ij2Hk4wcQeErl80ZHToyyM0zA+8wGOZEeKxFCCRLsNgvZ+O8X2cIGzIdeQ8zvrH61ljIzKpt31MvWz3YNxz98PrDgvh+xmoLP5vVVmhy/yCxzx5Jmy901+VV9oOET+3rJKxox98Wn0wU15JbMcuYQOSqvdIc5+UvvJLDPPeSHpujN+bLBFoSokR2iGVmu1u10S1732D71acz/idZH2LjWmx9KGULjePP/9+jvMnjSG98QvvxYHzfluE2ztiA3SO+0BDlQ91/bZHIqfxFSqha/fsPSKvFORr6LYhadffMKjI5vZTy0Z9is0Qbtd0D7vVtjfKgv7SqsLCVbxVs8FKY/UDhUjJLmJdh3aM3XQkTBW/UTxC5YCmyTmiX8m5d4EoSLOdYQ4K2Q28fOyeYfI7lkLu/tGK7HC2sVoQz5wLygN8ZNqdNQ2ZogExkBC9lVwrPm4IKsEze5ZIxQFr6sNYyiYpaMKasqpL+GHjlbeZq3Dt7g6V4lk57YjGVVROMJOYtAxzWp6FRwbaunIDW42d6iq801hELALag/vUYgDX447WrlDZL4lILK3M+u3g1HBIPLJaveE4JeJ3B3RngZMbtwKH73WF5t20F9g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR03MB4348.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(31686004)(83380400001)(36756003)(86362001)(31696002)(41300700001)(53546011)(38100700002)(26005)(2616005)(6512007)(8676002)(6666004)(33964004)(6506007)(478600001)(6486002)(66946007)(66556008)(110136005)(66476007)(316002)(2906002)(8936002)(5660300002)(4326008)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UmcyUEVCS2drSENjMys3RlBySU0yeG1tWFlRLzZUZjhnNHdLeUU3YlgyNDRm?=
 =?utf-8?B?aGNBTmFKSEgrZUdrQzRQTngwU0FRN0FzOUVuSjNpaFBIUGI4R2JyOXJuejkw?=
 =?utf-8?B?SytTZXpSMllpMWh6UWVleGRsUlVDaTlKOEpRaFdoVC9EUEQvT2liUld6RmdM?=
 =?utf-8?B?bDNsaE10YjVZeXdzZVFPdlJMY2tIZmJtYVJkWU44b1dkdThEQnRTeWJqRlI2?=
 =?utf-8?B?TUxZQ0NPN1pvd1NVMGUwVVJIcVhucEtDenpnUnBralF2WWdBZi9XbWlmUXJJ?=
 =?utf-8?B?cE9xckxrV2dlU2MwV3Q4RllPQzRZcExkVWlJMTlzRFBXQjdoRlp4ZXBzdWNR?=
 =?utf-8?B?am1Zb1REYjY5c3Z0QisyY3ZHTkxaTGRsaHEzcTNTOUNtRTVFa3M4ZlBwM2JB?=
 =?utf-8?B?eDdaM3JFWVZSdkVhWnRxNy81THJQd0RBam1QUnFleTN5Q0F6M0YrMHRZaURa?=
 =?utf-8?B?UnBkVE8xSlVvOWY4VmFHNk45KzZUQTkxMTBUQStPZjJ2bVd4UmIxY0lRRkNh?=
 =?utf-8?B?TDZrOE94cmVLYlluWUthRUM5ZmtKMjBiVjJOOEpvL3ltelFiY0ZsTkFFcEFs?=
 =?utf-8?B?Wmxvc3Y4UVVoU2hPd3Bhbk41eEdpUWhwUU51UktZdjNSSjZUY3BITS93RFg2?=
 =?utf-8?B?ZjJxMEtrNFNlNTRad2JuZlFGTndNcmpSbWlBU2FTaUxuL2FVTTR6ZGF3ZFpx?=
 =?utf-8?B?N1EzeTNmRmc2K2lrcklWNTdjZWVhYm1IQW55U3U4QjlXNVR0ZThRQVpuOTI3?=
 =?utf-8?B?QldMZ2lPU3RldFluVmpOMnJWKzRxS3dvMDVlWTg2bDA1V2VPdEZqRE5zQklv?=
 =?utf-8?B?RjJocDJQd1JKOFNYeW9kNmZxNjR3UUdNWGduekgrWEhRNGw3M1V2MFVLYzly?=
 =?utf-8?B?MXZmWFdjQlFXQVFJOFpVcXhPQlpXazBrTm0zenl3U3hZbGVSRTFEbDdXclVm?=
 =?utf-8?B?alRDbnVQYitqUjhObGJjS0VVVDlDcjBLVTRCM1ZiYlRSRVhaWWExNDZjS2hX?=
 =?utf-8?B?dE9tSFZaZnRhQUpSeXlCaWRXUzVwY2YwU2xOVDkzWWUwMTFmMDdMVWhqY1lG?=
 =?utf-8?B?UHkxQjZXNE42L0F1cHhJZi9VNXMvclVWS3RlTjNOTEpsQkhZZW1OUTNIVSsv?=
 =?utf-8?B?L1E3RlNDKzlGT1EwU1dhYzlIeHZqZ1dUZ2IwNjNueXN3clhTQkdMTEtkSUhL?=
 =?utf-8?B?SkNQc2pyakNUZnV5eEhoMUZTMTVSdE5yMGkxY2pvNHBLaTZDOUpwUE1zWWpR?=
 =?utf-8?B?SGNaUzZ3ZXhFOXhCb3A5eGVKTjFzUm1kZ0xwRnR4clVDeXdadk1JOWJsc0M4?=
 =?utf-8?B?Um0zb1B1UzIwK1B0Z0lodmJZbjk3N0pVUzByQUM3bmtHdFlIeFh2N0xNNnp0?=
 =?utf-8?B?WG9ORGlZZjBiZTJRNDFFRWVTMTFRMnNWcEtiMzFwTXZaWUJEamRtV2REa3o3?=
 =?utf-8?B?TW9ra0ppQ3JGYmdjL1BpazJ1dnc4Tm5hTS94Z0FQNWhsamFzUURRcEIwMVFE?=
 =?utf-8?B?ZkxHbkxCaU05K0VNOFJ5SW01OE1yWGxjU3pLbUNzUWNqQmp5UjQ1N25tVDVn?=
 =?utf-8?B?WTRmZlZMMUkvYjcvNmVlZEM3R0J6Y1ZHVG1FQTV6bW5JZ1Bxeno1TmFRaVZJ?=
 =?utf-8?B?ZmN3TUtwdkVQKzF0YUFuT0RYVWN1MEtWK1FrZjhmL0tBdmUwV2gvWU1CWWw3?=
 =?utf-8?B?Uklnc2RjU1EzZnYwdUdFZkc2Sy9UMXpLMFhoMGVCZnQ5dXJZRExKVjNkMGs5?=
 =?utf-8?B?YXAwODFuem8rU3RTYnY5TDV5MFg4L0FrSFduZkJzUFVUMk1acFJCZmNROGJu?=
 =?utf-8?B?ZUVwVlY2Z2lwQ2ZJWnhSNFdubXNIMGQ0cldiSWUwRG1qREM5SWlnblBKT3Bi?=
 =?utf-8?B?YndpcnIzR3N6YnAwODZjMURSZElIZ0tqWXllcFVzWmxmbVNRNGxic3BkamlE?=
 =?utf-8?B?KzdGdm9rT3BDMmZVV0JEU2dsdXBmS2pWbzNVOGltbVEyVVA5bWZoOVo4bGpy?=
 =?utf-8?B?dWNmZjBIZTUvN2lRb21mclFGNUJFMmZJVEttenJxN3d3dkxBS3JJVlR2THZC?=
 =?utf-8?B?U1ZRQWk1ZjhwTmxDaWkwSkI2WTFhQzNiQTdpREp2b2Zib1kzNGxzbnNUTXhm?=
 =?utf-8?Q?DLa2iVBXyCTMsRtl+amUwLQdZ?=
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 441fbc43-70db-4222-367e-08dc23d6503b
X-MS-Exchange-CrossTenant-AuthSource: SL2PR03MB4348.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 10:04:15.7718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 WhYImwFgD4Mi6Jn2V6qo85v7/l4yXXKFvr/ah115M2mMn5tfTSV7oapE5+NKTNB2xythhFDWTOqW67UcVzbHKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6280
Message-ID-Hash: WU3ZG4FIIFWLKQ26KJITWVIAAJGI3R6U
X-Message-ID-Hash: WU3ZG4FIIFWLKQ26KJITWVIAAJGI3R6U
X-MailFrom: WTLI@nuvoton.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.9
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WU3ZG4FIIFWLKQ26KJITWVIAAJGI3R6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpPbiAxLzI0LzIwMjQgMTI6MDIgQU0sIENvbm9yIERvb2xleSB3cm90ZToNCg0KT24gVHVlLCBK
YW4gMjMsIDIwMjQgYXQgMDE6MDY6NDVQTSArMDAwMCwgTWFyayBCcm93biB3cm90ZToNCg0KDQpP
biBUdWUsIEphbiAyMywgMjAyNCBhdCAwODozNDowM0FNICswMDAwLCBDb25vciBEb29sZXkgd3Jv
dGU6DQoNCg0KT24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgMDc6NDA6NTFQTSArMDAwMCwgTWFyayBC
cm93biB3cm90ZToNCg0KDQpPbiBNb24sIEphbiAyMiwgMjAyNCBhdCAwNjowMDoxNFBNICswMDAw
LCBDb25vciBEb29sZXkgd3JvdGU6DQoNCg0KT24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgMDU6NTY6
NDlQTSArMDgwMCwgU2V2ZW4gTGVlIHdyb3RlOg0KDQoNCg0KDQoNCisgICAgZW51bToNCisgICAg
ICAtIDAgIyBWRERBDQorICAgICAgLSAxICMgVkREQSoxLjUvMS44Vg0KKyAgICAgIC0gMiAjIFZE
REEqMS42LzEuOFYNCisgICAgICAtIDMgIyBWRERBKjEuNy8xLjhWDQoNCg0KDQoNCg0KSSB3b3Vs
ZCBhbHNvIHJhdGhlciB0aGFuIHRoaXMgZW51bSB3YXMgdXNlZCB0byBoYXZlIHNlbnNpYmxlIHZh
bHVlcyBmb3INCnRoZSBlbnVtIGl0c2VsZiAod2hpY2ggSSBzdXBwb3NlIG1lYW5zIHN0cmluZ3Mg
aGVyZSksIHJhdGhlciB0aGFuIHRoZQ0KcmVnaXN0ZXIgdmFsdWVzLiBTZWVpbmcgIm51dm90b24s
ZGFjLXZyZWYgPSA8Mj4iIGluIGEgZGV2aWNldHJlZSBpcyBub3QNCnZlcnkgbWVhbmluZ2Z1bCBJ
TU8uDQoNCg0KDQoNCg0KRG8geW91IGhhdmUgYSBjb25jcmV0ZSBzdWdnZXN0aW9uIGZvciBob3cg
dG8gbW9yZSBjbGVhcmx5IHdyaXRlIHRoZXNlDQpkaXJlY3RseT8NCg0KDQoNCg0KDQpJIHdvdWxk
IHVzZSB3aGF0J3MgYmVlbiBnaXZlbiBhcyB0aGUgZXhwbGFuYXRpb24gY29tbWVudHMgZm9yIGVh
Y2ggb2YNCnRoZSBjdXJyZW50IGVudW0gdmFsdWVzIGluIHRoZSBwYXRjaC4NCg0KDQoNCkdpdmVu
IHRoYXQgbm9uZSBvZiAqLCAvIG5vciAuIGFyZSB1c2FibGUgaW4gZGVmaW5lcyB0aGF0J3MgZ29p
bmcgdG8gbmVlZA0KYSBiaXQgb2YgbWFzc2FnaW5nLi4uDQoNCg0KDQpBdCB0aGUgZW5kIG9mIHRo
ZSBkYXksIGlmIGl0IGlzIHRvbyBwYWluZnVsIG9uIHRoZSBkcml2ZXIsIHRoZW4gSSdsbA0KbGl2
ZSB3aXRoIGFub3RoZXIgZW51bS4gVGhpcyBpcyBvbmUgb2YgdGhlIHdvcnNlIGNhc2VzIG9mIHRo
aXMgc29ydCBvZg0KZW51bSB0aGF0IGlzIGNsZWFybHkgYSBidW5jaCBvZiByZWdpc3RlciB2YWx1
ZXMsIGdpdmVuIHRoZXJlJ3Mgbm90IGENCiJuaWNlIiBleHBsYW5hdGlvbiBmb3IgdGhlbS4NCg0K
DQoNCg0KSSB3aWxsIG1vZGlmeSBhcyBmb2xsb3dzLA0KDQorICAgIGVudW06DQorICAgICAgLSBW
RERBDQorICAgICAgLSBWRERBKjEuNQ0KKyAgICAgIC0gVkREQSoxLjYNCisgICAgICAtIFZEREEq
MS43DQoNCg0KDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NClRoZSBwcml2
aWxlZ2VkIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBlbWFpbCBp
cyBpbnRlbmRlZCBmb3IgdXNlIG9ubHkgYnkgdGhlIGFkZHJlc3NlZXMgYXMgaW5kaWNhdGVkIGJ5
IHRoZSBvcmlnaW5hbCBzZW5kZXIgb2YgdGhpcyBlbWFpbC4gSWYgeW91IGFyZSBub3QgdGhlIGFk
ZHJlc3NlZSBpbmRpY2F0ZWQgaW4gdGhpcyBlbWFpbCBvciBhcmUgbm90IHJlc3BvbnNpYmxlIGZv
ciBkZWxpdmVyeSBvZiB0aGUgZW1haWwgdG8gc3VjaCBhIHBlcnNvbiwgcGxlYXNlIGtpbmRseSBy
ZXBseSB0byB0aGUgc2VuZGVyIGluZGljYXRpbmcgdGhpcyBmYWN0IGFuZCBkZWxldGUgYWxsIGNv
cGllcyBvZiBpdCBmcm9tIHlvdXIgY29tcHV0ZXIgYW5kIG5ldHdvcmsgc2VydmVyIGltbWVkaWF0
ZWx5LiBZb3VyIGNvb3BlcmF0aW9uIGlzIGhpZ2hseSBhcHByZWNpYXRlZC4gSXQgaXMgYWR2aXNl
ZCB0aGF0IGFueSB1bmF1dGhvcml6ZWQgdXNlIG9mIGNvbmZpZGVudGlhbCBpbmZvcm1hdGlvbiBv
ZiBOdXZvdG9uIGlzIHN0cmljdGx5IHByb2hpYml0ZWQ7IGFuZCBhbnkgaW5mb3JtYXRpb24gaW4g
dGhpcyBlbWFpbCBpcnJlbGV2YW50IHRvIHRoZSBvZmZpY2lhbCBidXNpbmVzcyBvZiBOdXZvdG9u
IHNoYWxsIGJlIGRlZW1lZCBhcyBuZWl0aGVyIGdpdmVuIG5vciBlbmRvcnNlZCBieSBOdXZvdG9u
Lg0K
