Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F4C7D804F
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 12:11:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2608C84A;
	Thu, 26 Oct 2023 12:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2608C84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698315072;
	bh=sOsF6AeLOMJtHyk62PJsvGRdCmC487Kxsdzqn73tTPc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gWmjuxsxrYS4pNwr1kQunMYCh57ams3mgy4wfpRM1jwySxRc5DN/lchMn7oFB27Ov
	 ModpWyYjDckLnAPc3+0usVweSJq541RpMsJrbLK3pk5lINezCemIWBfFahm7tYL9XT
	 wTIZ/GQ1hoG9UeFY0GVVyqD4wFyeEkREwm0tXTkQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F1FEF80152; Thu, 26 Oct 2023 12:10:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF709F80165;
	Thu, 26 Oct 2023 12:10:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C10C7F8019B; Thu, 26 Oct 2023 12:09:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60BE7F8010B
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 12:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60BE7F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mvOGszOM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tzp8iZHlYCtfQ1fR1o8eX5p6cbWM3BOAJgFDvcmrhMWYla8VCP0ZUvMyGlU8i9AN+C79hHjsr5/LxUpMzenqyMpFcxOCQ6drdLJkLFCbxn0bHmSsuBXPA85VsWQk0ylbY2ruhdFl+SebfKtvkz/UFCrqs/imht+tc1t88pLjZCwFbjUnCjyg4TjLX/APDkHJOtpszPlAe9E4LyNK0Y+cNt5llGrjYWsQLZK/shg8isiYR8r1iY9aRKJMaD76XLggJfA86u+6edsPkZy3WI+XZaMipmNfA4dTu5GgTMn43V4ym72YInToXBRq2/oLcKqm2hLQ7Q1CxN5jVFVF+i7xfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5R3z14XxiR/vrYuUI9kZlRYXJWilgnWz19uNhheYZ3Q=;
 b=HcyT6v5Afaao08gfivAtY895tdJpoaWBnWFr/lPwQdQpZSklPznQoiN6Kd5DDR/KWAO+xejo8g7I6+UYUvjH4XLV9sigeBzk5D0jVm4xYvkjKZ8h2bKMjMM29lZ7Axk7ZmIbBeYTFBzIe7584p73oqfwzxig50/guypQAQdFXKhDMO8subTuvL5u9hdZxWvM5WW37rCvCu2KOuliulxL2cYuP/U71+ASfwwcBeus5i7oiFbpUsCFah0JD5+/GqgkxqdyirXprm+53h4ONru6PwO/a2LtPw3gdPzZu+7cD03B/DUPd2Sz8Q//I0UYXcP+isab8oJsHCME+wyYWYYqvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5R3z14XxiR/vrYuUI9kZlRYXJWilgnWz19uNhheYZ3Q=;
 b=mvOGszOM2JHk89jJsZApm9+P0fx3lv8rQgTpb4MH16NR1WuQxFyS9IYOids20RELzbctcbKJ2hNRpCVHLcxAXJjDG/sG6jlWstQsM4Snw0hu3LpUWfjFMePPE+OC1INcB2B4Z+Kb7bsNFHn6/+B4fK5nzs9StkD+0zyCPP4p6ww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3661.namprd12.prod.outlook.com (2603:10b6:208:169::31)
 by DS0PR12MB6656.namprd12.prod.outlook.com (2603:10b6:8:d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Thu, 26 Oct
 2023 10:09:46 +0000
Received: from MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::7354:d327:ee4:dd79]) by MN2PR12MB3661.namprd12.prod.outlook.com
 ([fe80::7354:d327:ee4:dd79%4]) with mapi id 15.20.6907.032; Thu, 26 Oct 2023
 10:09:46 +0000
Message-ID: <12c8c0f3-8364-4f25-976e-8cca29b5e17f@amd.com>
Date: Thu, 26 Oct 2023 15:39:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] ASoC: amd: acp: Add acp6.3 pci legacy driver
 support
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com,
 venkataprasad.potturu@amd.com, arungopal.kondaveeti@amd.com,
 mastan.katragadda@amd.com, juan.martinez@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 V Sujith Kumar Reddy <vsujithkumar.reddy@amd.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Yang Li <yang.lee@linux.alibaba.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
 <edeebfab-e26c-4c18-8126-190c3e834521@kernel.org>
From: syed saba kareem <ssabakar@amd.com>
In-Reply-To: <edeebfab-e26c-4c18-8126-190c3e834521@kernel.org>
X-ClientProxiedBy: PN2PR01CA0210.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::19) To MN2PR12MB3661.namprd12.prod.outlook.com
 (2603:10b6:208:169::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3661:EE_|DS0PR12MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c6f798d-e5b9-4518-f4b0-08dbd60bae77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZVbuPHS/Xkn9Q3JsJRCfyec6lMHZHeJ/0qt3j4pmLOZzBFTMLRk4n4u+KL+FAuUhwReTvneRoZTUzFIw4qh/3pzCm9ViceBCVQuUYdDStMEBYum1MFVWL+ujcGKzVsi9bK6vsU4WqDgqgqiKTjvc/43ujyvIWP+Rhl6z6vwrZObS5Z9PMRQgRklTnHbo/It8YuJteH3QjztVyipsXtOgdwK6QVpdwqvjQeUls1LEUjaKlEutN+snpMBdFZJNG8cBEQH5+bcTpgd7cWmZzvkStzIB3/8vLgbDOzV+s8aPrKU5g5ReozxmOsw0j3ysGCazwCgXXTjqPeMam9MM6+j6mTPGzYA4YP/O6EyiMgggdRXJodh5mml6OKBMKHBUdh7EG2/O0BBSdzkmQm6j5bTzXHciEH9RP2jfIMJS0V9wc6KKZVTqkUMlu9XnZCd6S7BRlCGdjVq3PPE6Qnc7iIOILGdlp9ZpYxklkMw8lICtlh9KjEBTLSnD93ssXRx1j5XXCHEWcIMw053nnVDsWVWc4HFcHFz2LsN3RyVrHZdXuA0CBsXMIHDBf+ZscBl61Xd7t42IncG4DqpNYNbQZDSyqpuwH1J/UPD4eXjbGpTfCNM5wl3W77EikAI+JVH7a6M5ivID44xPUSGe+0L/xJ/jng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3661.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(366004)(346002)(376002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(7416002)(54906003)(5660300002)(33964004)(6666004)(66476007)(41300700001)(66946007)(110136005)(66556008)(478600001)(31696002)(6506007)(6512007)(316002)(6486002)(2906002)(4326008)(8676002)(38100700002)(53546011)(2616005)(36756003)(26005)(8936002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VzB0U2p5YmZCMXR0KzVWYVB1L3g2ak1MT2hJK2ExMWJYZTRKUS9yR1FVR2th?=
 =?utf-8?B?U3VsSkpBYVpuOFJRaGdteDRzZ2preHBIV1JKQnFVVkY2U0lpMmpVRHBMU0Jy?=
 =?utf-8?B?TlNDVVFsazlQSDdJS0s2c2tZTjVnZXNOaE8zQ3QrQ25qYmREQzVIYkM1VGwy?=
 =?utf-8?B?d0FxREowZC9ZWjlKRHNHZjZSZENvTDhKTUlUNldxemZNZVRVMEl2MnF0Y09E?=
 =?utf-8?B?RzFGZ0MwaENTaHRhSXcrcjNPLzBCcFV3eG1ZYTFGZU9LS250c0JZL0VjQ2Fa?=
 =?utf-8?B?Zk92Tk9taDhBSU1lTkJLUDNmd1dKUGVWd01UMEQ4Q0ovbkRQUVVoZ2g0ZzZV?=
 =?utf-8?B?OVJBNWZKNjNrOHhZMXBoTHhvaW5LTVpVZ0pPT050Q1RNOTdpd0V2WGZhMVI5?=
 =?utf-8?B?NjJrYnhjR3EwSmFpdENOKzhUL0RDNldtOUkwamRyRnJ5K0cvQ3kvQ0I1Yytl?=
 =?utf-8?B?OUVaZlpueDBZbUhZRUZPa1RuTEJEUWJRejE5aGNCcVVpNmU5eVpVaVhNbFV6?=
 =?utf-8?B?MStOZS8wTUtvQVEraGdBWDZBM1c1amhlQVgxUG13STBKOE9kMnhCL0x3cHF6?=
 =?utf-8?B?K3lVNWRUb2d3eGd3U2FBQjFxanBaRVVGcVE1Y3pkd3I5TlIydmtjV2E3OXFz?=
 =?utf-8?B?S1ZCZmp2cGNlQTAwRUl5a1lOYi9RMFJyVFI3Y0FHR3VhbkdYS1RURFY5eEZm?=
 =?utf-8?B?TGx6aXZJaGFOU28rTi8yUGlGWm5HU0krZmlJYnhPMGpVV1dWTTZEcnovSE5y?=
 =?utf-8?B?RWlsanNPWXFTTmNYSEdyalpTS1hhQU5pWVpPc3RvSHdGbWp2aGJ4QVB1bldU?=
 =?utf-8?B?QWthM2FleHNYaEc4NjhQWlRnUE94cGxGSEF0T05NM1lQUC9WVmtsRkZ6UVlS?=
 =?utf-8?B?RStlMlBGb0Q0TzF2dXdUdWFTYkJVQ3R4RTFwaWlxeUFpdTVPRUxlRVJpdnlv?=
 =?utf-8?B?a05zYUc3Sm9yNTFVWng2ZWlieCtRU1pmVnVhUzZLWWRURURJL1BGWDhtOXRF?=
 =?utf-8?B?a0hadXNPRXhNUlVBZHlHeUdlRmh3dU5DU3JHTTV6N2RDNnlBWEljbGRTN2lv?=
 =?utf-8?B?Y1haUDQrcVFMMFpjeHpDYTJNSForUFAxbWR5bFpabWZtTmJWRklFTmtKa2Yw?=
 =?utf-8?B?c3pRNzdEKzdLOW9FenhpNDFzeTA0YUtmZk5EcFE1ZHBnUUV5L3ZNY294aWpD?=
 =?utf-8?B?dVh2QVJoRWMrK2gyL0ZsYTVwWi9wZ1JkSm53TlNmcmZKRVBaaFptaXpEdGhT?=
 =?utf-8?B?R0M0MXBtQ2FwcnBrSGFCbWNQQitHNHlZbXNlcGdkZWg1aEtrdERkRkN3cU5j?=
 =?utf-8?B?cTFVSmVpVEhrYlpPQ0lqNGZKL215YVlPTExtSm8vRmNoT3dVV1l4UlhXQUFp?=
 =?utf-8?B?NGJPQ2FsYk04MzN0TERNZWpvTDZXMmNkbmdHYjNla0xLUGZvK2traDVWVHpU?=
 =?utf-8?B?eEJteVZFZzJJSnB5QWZmazVKWEwwbkMyUDZxUldtQ2ZNVUU1S1BWWjYxRzNu?=
 =?utf-8?B?bTA2SlFqdmFGZ0RsYmdSRHNKYmxzdHVnbU03cTlHeHVHeUs0MHhVd0trZ2tJ?=
 =?utf-8?B?dko3OXErblhTdFAwYm1PaGtPTHBQa2lzOTdQMDlzaTZHbHRvZll2LzRaMUFl?=
 =?utf-8?B?SU14RXZyKzRtV1hXT0VHMWRDRjU2QlJFV094YjQ1RzdQR0RUTXJEeUxQaGxM?=
 =?utf-8?B?UlNJYjYyWERxdE9WN2QwbHN4cUZVd3UvWmREVGJlUEJLWHhsOTlPbXZtcXJD?=
 =?utf-8?B?QUtpWDJSY2RrbDJBR0ZtN3VVcUErOUJSSlgvZ0x5MFR1MEtSNXZQeHpEQzBw?=
 =?utf-8?B?Yjk0Uy9GbjBYSXZUZGZ4dmFjaVMxTEFBU3FUTk9BSHU2dk5pYUdVQ3JQVUYr?=
 =?utf-8?B?MlVsY0xOeWNsSk5wejVJQy9tRXJDTG5GUHdubUJCay9qV0FhSjF5dHl3bUZR?=
 =?utf-8?B?aXFMeDhJckk4OW9mN2hKTm1nTm9VVG5paFdPUCtjbHhuRGorWEZscU1wdnor?=
 =?utf-8?B?OFBPaW9RREJwUFFQcXp3YkpkLzFjb05iTVJ2UDI5ZmFFY1M0MzhnNkhUcXBq?=
 =?utf-8?B?YzhBUE8wWk5XUUdteVRqY29HVnFCaUl4WVhQQnd4QlZtZWlhZmNKMW5aenNv?=
 =?utf-8?Q?N1n61g3Ut9d/rF7tH/1hauNFI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9c6f798d-e5b9-4518-f4b0-08dbd60bae77
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3661.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 10:09:46.7047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VDVsXU6Tb0g5BP9ANBvOjmisGFGVPk2Az+WIj0hH8m+6TAZ11jhqenD63z6+wcRx7sPsd4gWodmchcgXnfl6CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6656
Message-ID-Hash: NKPYPIALOU22NEWAQ7ECWNFBUVLW2LRM
X-Message-ID-Hash: NKPYPIALOU22NEWAQ7ECWNFBUVLW2LRM
X-MailFrom: Syed.SabaKareem@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NKPYPIALOU22NEWAQ7ECWNFBUVLW2LRM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpPbiAxMC8yMy8yMyAxMzozMSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gMjEv
MTAvMjAyMyAxNjo1MCwgU3llZCBTYWJhIEthcmVlbSB3cm90ZToNCj4+IEFkZCBwY2kgbGVnYWN5
IGRyaXZlciBzdXBwb3J0IGFuZCBjcmVhdGUgcGxhdGZvcm0gZHJpdmVyIGZvcg0KPj4gYWNwNi4z
IGJhc2VkIHBsYXRmb3Jtcy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTeWVkIFNhYmEgS2FyZWVt
PFN5ZWQuU2FiYUthcmVlbUBhbWQuY29tPg0KPj4gLS0tDQo+PiAgIHNvdW5kL3NvYy9hbWQvYWNw
L2FjcC1sZWdhY3ktY29tbW9uLmMgfCAgIDQgKw0KPj4gICBzb3VuZC9zb2MvYW1kL2FjcC9hY3At
cGNpLmMgICAgICAgICAgIHwgICA0ICsNCj4+ICAgc291bmQvc29jL2FtZC9hY3AvYWNwNjMuYyAg
ICAgICAgICAgICB8IDMxNCArKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gICBzb3VuZC9z
b2MvYW1kL2FjcC9hbWQuaCAgICAgICAgICAgICAgIHwgICA0ICsNCj4+ICAgNCBmaWxlcyBjaGFu
Z2VkLCAzMjYgaW5zZXJ0aW9ucygrKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29j
L2FtZC9hY3AvYWNwNjMuYw0KPj4NCj4NCj4+ICsNCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRl
dl9wbV9vcHMgYWNwNjNfZG1hX3BtX29wcyA9IHsNCj4+ICsJU0VUX1NZU1RFTV9TTEVFUF9QTV9P
UFMoTlVMTCwgYWNwNjNfcGNtX3Jlc3VtZSkNCj4+ICt9Ow0KPj4gKw0KPj4gK3N0YXRpYyBzdHJ1
Y3QgcGxhdGZvcm1fZHJpdmVyIGFjcDYzX2RyaXZlciA9IHsNCj4+ICsJLnByb2JlID0gYWNwNjNf
YXVkaW9fcHJvYmUsDQo+PiArCS5yZW1vdmVfbmV3ID0gYWNwNjNfYXVkaW9fcmVtb3ZlLA0KPj4g
KwkuZHJpdmVyID0gew0KPj4gKwkJLm5hbWUgPSAiYWNwX2Fzb2NfYWNwNjMiLA0KPj4gKwkJLnBt
ID0gJmFjcDYzX2RtYV9wbV9vcHMsDQo+PiArCX0sDQo+PiArfTsNCj4+ICsNCj4+ICttb2R1bGVf
cGxhdGZvcm1fZHJpdmVyKGFjcDYzX2RyaXZlcik7DQo+PiArDQo+PiArTU9EVUxFX0RFU0NSSVBU
SU9OKCJBTUQgQUNQIGFjcDYzIERyaXZlciIpOw0KPj4gK01PRFVMRV9JTVBPUlRfTlMoU05EX1NP
Q19BQ1BfQ09NTU9OKTsNCj4+ICtNT0RVTEVfTElDRU5TRSgiRHVhbCBCU0QvR1BMIik7DQo+PiAr
TU9EVUxFX0FMSUFTKCJwbGF0Zm9ybToiIERSVl9OQU1FKTsNCj4gWW91IHNob3VsZCBub3QgbmVl
ZCBNT0RVTEVfQUxJQVMoKSBpbiBub3JtYWwgY2FzZXMuIElmIHlvdSBuZWVkIGl0LA0KPiB1c3Vh
bGx5IGl0IG1lYW5zIHlvdXIgZGV2aWNlIElEIHRhYmxlIGlzIHdyb25nLg0KSXQgaXMgcGxhdGZv
cm0gZHJpdmVyICxmb3IgYXV0byBsb2FkaW5nIE1PRFVMRV9BTElBUygpIGlzIHJlcXVpcmVkLg0K
Pg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPg==
