Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D664D9FF695
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jan 2025 08:15:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00796603EB;
	Thu,  2 Jan 2025 08:15:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00796603EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735802128;
	bh=bg1egLsz6i2lPu+RAIjnszUme0ADd0NEXlfbQsHJdaY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q5gaSIxP+Wv2s1kWoD/W7uX66GEdem9L/QB+oH5BzS+g2OAK4YI3/sRWYYYlr31KL
	 XQb2attJWF8fWkiccx/yChitSc1e1TymfSp2FZqppFECuJFGkawynxaxaCHfMXbMgU
	 e4a/StVEHeK0cxRRbdUCcEuExOY3kastXFuE6mUY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77F0BF805B3; Thu,  2 Jan 2025 08:14:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2554F805BD;
	Thu,  2 Jan 2025 08:14:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45DE8F80154; Thu,  2 Jan 2025 08:14:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2405::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2E1FF8001E
	for <alsa-devel@alsa-project.org>; Thu,  2 Jan 2025 08:14:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2E1FF8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=hJvwjLpY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0b1jKY5ZCuW6i0EinS/mcHXmnmgJwxn6rUNuyP52TEOgqHbiq2O+Pe9qhQ0yDn8YAP76wht/Lb/f0kZEEDLjwx20/GnDXljO1XrQnrRb7eEuzEtl2kNhMfDSw3dwY9dGCPPo8646gpJ/Edm5P8jpBk4ar2a/NPMtN6BUpFfA0inYg00xrcFBwQkhLS7Y53Yx25rSsez15FNB4D5jMIdHfAirh8JmBAzvvgMl4bk1hOezEW57vU2jP9RLlHJudpUDLg9h4IRrW133EzYaPybwu5ta0JRVcLVvWlC4BqYEFZiudcxqt2pp5GQJD6cKt8RcAf3bjX55PHVx8KI5Mc2dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QB+J+nTdidTeJ7SHqVKMpwhOuFoOgtu1+ZpY0bI17w=;
 b=MxatUSg55kccK/yaJLsoXwioq+UMCoqYFythO5UvpZHcmdnqEOt7SrU/BiPH25CZK7/QU/844eZUW+QNZBHVAQFDfSxXpA4oEcbBsycYU5siEFVVfuzH9e65jMdAsT+ZxA1eCDQR632ylOGDQ5rizDCXWvVkEyuxgcvdbuItaguHWfD4My5MFhvQOjf6g3TQKnkjYEO4nFSQ8HBvXOn2EI963ElW5AcREusGlXYqT2LXap/5pZQrSov6ACFpV3T1wt85XdT2SQyUT2bMO/vkDi2NOSrQsQbOcSDsjJHumXZKFSAORQrvZTH458ZjywPfpiNG0PV78GIJgRHshdRYYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QB+J+nTdidTeJ7SHqVKMpwhOuFoOgtu1+ZpY0bI17w=;
 b=hJvwjLpYAfE2YnbJWK7ZlRGDv4w25uEuJraZtiB2CJx4htF1IxAuw3qp/uZXBXfY9QWLP6q0mxRUQmGtvZmB6pM5HMgboWZ9aCfH9eNMmkopkBhplozETBZHZXlQvwO/3s8z8KtNgYv0i2ENz1vEdFeUE7cu6w8l1bDa55MsR00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23)
 by DM4PR12MB7765.namprd12.prod.outlook.com (2603:10b6:8:113::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 07:14:23 +0000
Received: from DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf]) by DM6PR12MB4123.namprd12.prod.outlook.com
 ([fe80::512d:6caa:552a:7ebf%6]) with mapi id 15.20.8314.013; Thu, 2 Jan 2025
 07:14:22 +0000
Message-ID: <9e083dc8-64c3-4991-911d-56ebb54b38e8@amd.com>
Date: Thu, 2 Jan 2025 12:44:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] soundwire: amd: add support for ACP7.0 & ACP7.1
 platforms
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 sanyog.r.kale@intel.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 Mario.Limonciello@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <20241225072400.912445-1-Vijendar.Mukunda@amd.com>
 <20241225072400.912445-4-Vijendar.Mukunda@amd.com>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <20241225072400.912445-4-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::15) To DM6PR12MB4123.namprd12.prod.outlook.com
 (2603:10b6:5:21f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4123:EE_|DM4PR12MB7765:EE_
X-MS-Office365-Filtering-Correlation-Id: 26736f4b-1200-48cc-bd0b-08dd2afd14fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RmZ1Q0NqUDJHMlYrMXJaUzFqdjdPQmVtNng1NlZDN3JWM09TMEUyNjhPckoy?=
 =?utf-8?B?STlKWEtkZmNHUTU0NVROOVo0dFk4TE9LazFINDFyRGZsa29jclA3S2YvQlI0?=
 =?utf-8?B?dExaK2RRUjZoS2d0YkdmSzkrL2ZiOURzVGZDekN3em1WTGFCelNEQlVSNzB3?=
 =?utf-8?B?akxIdVZ0dmJQVEMxOXZJekRkV0ZOMUZRcFVUcUtiSW5iMm5MUTBkNlRScEdJ?=
 =?utf-8?B?OUlPcG1hQnZBbGUzS1NZNTROQVFSZHgwOWxLTjVUMlZZdHkrYnBKUUtjU21D?=
 =?utf-8?B?bkV4aEpKdEJReG1UU1ZCVU1KN2xWVGxzOFc4Nmc1RmJWb2R6b3FPRWYwclhx?=
 =?utf-8?B?Zkxla3BRenhQOEJuOEVRenkzcFBTKzhpbVhHa29FTGJGK24xWGJiSngrUGY0?=
 =?utf-8?B?ZFlQdlNZdXZwRTBwWlA3eStWem1LRjdaZXpVUmZ6TUhVZVZiSGduOHNMc0oy?=
 =?utf-8?B?b0NkV3lFTStXTmVWeW0rNlRPcWFQOEIrWTdCaDBWekJLSTl0dkxmeEt0d01R?=
 =?utf-8?B?SHBERXNRTTlLYmdrSi9IZ3NqU2hwbUJWSDhvNFpTUEFTdmFzNUxpYk1SUzJm?=
 =?utf-8?B?cm9PY2E4aWkxUU5oRzUzWFdYZldwZTFRNWlWejkrYnlRQjFUYnlqMXlVcFAy?=
 =?utf-8?B?MGVKczl3WkdsaU5FYkUrdXl3ZW9kMGNNSlhmRjFyMmRyemp3RXJLVVk5VUt3?=
 =?utf-8?B?LzRKdDZxajczOHlDcDR0Qk1Deis4Q3V5MjVTY1hLUzJMTWtiWHhxVFpYZ1gv?=
 =?utf-8?B?TndHZHhCM09Uazc3a25rTE0wSFNsRjg5eEN0SFRKU1MwOEF3ak1ENldpTlRO?=
 =?utf-8?B?WXZOd21YbDU4c0J3SHBidW9pT1hFRHBGeXYvVUF2bldpRlRqaDVsRWVsc0xm?=
 =?utf-8?B?SFA2TFlmUDBjTDdPa2p1U2xVa1MrNThUS0ZUZlVKWnN6WFN4V2lWaEdveE92?=
 =?utf-8?B?dkhPbHVyakF3VUlBdEhEMGYxSmIwUzZOZ0hoSFViakFjcUN6TXZqVitHUU5h?=
 =?utf-8?B?alRybE5rZUpheUYybzZodExaTEZ2VWZOQWY5eDFIRU82cFNuSWJKVXgzMEJj?=
 =?utf-8?B?Wm42NG5iSU5DcGpSZUNkY2Y0NzBCS3dnb1hIQ1d2SUpJQnFUTmljNEZkdzlI?=
 =?utf-8?B?SmFnRTFVQ2VtN0hmc0ExdDRVaFNsSDY1SDFrMGpMbEdhdk1TRHM3TmZWZi9N?=
 =?utf-8?B?eDB0UkhMV29ZTmhDMlF4eGNGVllSTWJGNHA1TjkzSVZoYjFjTnNKeDhyVEJL?=
 =?utf-8?B?dTd2dklUaUs3dnFEMVBCZkFySEtuYWxlU3NuMUF3OEtyd05TSXFEdGJUVktv?=
 =?utf-8?B?WHFQU1pvTXlxenY5VjZZU3VvVEZuUVlkQW5nck92MkdUcjhvQWh4VUtUTWlw?=
 =?utf-8?B?SjhxSlpmanVWMVJXeVpJeG5QMUJSM0t1Ulc1dzBoUUFVT2I0c1VPanBzR1Zi?=
 =?utf-8?B?MjNPUFhJV3V1OFpBK3UyZm93T1lVNVVKL1RTUVNNRVpmRHducUtENjE3R01S?=
 =?utf-8?B?ejFCQVBXYmtycEM3cG9FMFB6Nm9ZL2R3cXlSanNYNERReVRFbC9WNVFuNTRG?=
 =?utf-8?B?anNONVUvZmMvZHBsbUhSb3RJYU1QZmpxb255MVd0Q1FrdGZYbnhmbEFuZGlo?=
 =?utf-8?B?QnMvMmhlL05nL0ZoQkkzZGJOMVNPa0VHVkdZZ1JsUENlVU1BbEZ2SStUaVVC?=
 =?utf-8?B?SER6OGV2ZzdjbWpxNVFoUWQ4aUVtMGRKRmcrWTlrcms1R3R4OVpxOW1NcWlB?=
 =?utf-8?B?Qmd2c0dWTE1abktoNFVpaGNKT3kxWFNBOW5ab1lOTjhFQ0s5YkVzQ1JoMmJu?=
 =?utf-8?B?alhRcStwWlB2cEtOOFV4V2NJYm5yTzNpMFhSYUtXZm1yelVUTzNVVmRJNGt3?=
 =?utf-8?Q?arNm+YJARe1IG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4123.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SEVaQ05uNE02UDJGSm9NeExzc250aUdXaXdHb204QVp2ZTg4VFBlZmtKdW5o?=
 =?utf-8?B?ZDBQZDNObUZpSm92bFNDS1QyNG1nYzlJTnRkb01uYzFhQVJkeVVTSUV5TDZl?=
 =?utf-8?B?R0Zkb1VpRjBweDJUVXNxT1VUNmNvWHRhRFRCUmZhYWM3NUM4eFBXTTJsV0l3?=
 =?utf-8?B?WDhRY1p4V3U2NWFqenB2N1NHMktBSGkwWXQzUXR1SGpNSWo2cHh2bmc5b201?=
 =?utf-8?B?T2YwbW1FSTJpMnJNSFd1YmgyM1djK0s1SElEb3Robi9RMzJzWWRwSCtXUG55?=
 =?utf-8?B?SWNiUGZ5Y0VBeFFCZWdUV3RPTE5ncTVGQ1ZaSjl5M3lMS3h6aUhpY21kRXFm?=
 =?utf-8?B?SWlSSThIM1lOR3UvNEp2L2ZvWm4yZUFHR1B6N1gzWjhpa3YxMlB0UW03L0ZC?=
 =?utf-8?B?eVB2RFVKUXdPMEwvR090MWltVEhYM1lNQ1RlUDErbGdOSmNyZTVZWklxckVz?=
 =?utf-8?B?RStKTjYvMW1lVUFOVmQ4YnNSbnVUcXFGVWZFa3RsQ2IyT0JHSUtXT1dNQnRq?=
 =?utf-8?B?RXlwRWdsN3NJRWlKenJDSWc3ajFQUG44dWZXUzR1NnNObmZIU1RZTytEY1BI?=
 =?utf-8?B?SHo2R1k2S0l4cno5T0FjOGU1WDhlLzkvUWdpanBsaytnSXBxMVNkTjRUZGgy?=
 =?utf-8?B?UUx3REEvU3Ria0RXWGl1emo3NVp3QVljcnRod0lpbHZtT1F3UDBNeHJpYVlk?=
 =?utf-8?B?d0IrVzA4WGtISmlSR2xmVFVjOFJ1dFU5N29hSmExQ0ozNkljZHdCQWJKQTNw?=
 =?utf-8?B?MG9qc3h1ZmpHclcyUHFwTGxwTC9kbjJjeFRBZkJIRlo5WU80ZEQ0S1doKzVB?=
 =?utf-8?B?dXVRYnlHWnlJTG9ZUGY5NWlDa1J0MnBDd294Q0lWeWpBRGtQMTZBblVldkcv?=
 =?utf-8?B?cHFFV29Hc05FWTJqdHFaWURhRDVKS2ZxYldmOEh2TVV1UVY5dEYxTm0zVjFo?=
 =?utf-8?B?OGJIQ0pHRjZtYkhxa3lORnF6dUo5anQ0M0QrYzRnUjhYdkNBbWFrcjMvUTNH?=
 =?utf-8?B?SEl3KzdIZG5BUDhsT0tpSTZSWDJDS0NpaVJkQUxXNDNvN3NMNzd5OUxMRDBx?=
 =?utf-8?B?ZS9DVGlyY2RuS0JhbEEzejFuS0RsNmJ4L1ZnZDF5dDNLNHJVa2hoVzJYRjhQ?=
 =?utf-8?B?UEFzN0xhVFYyWXl2aTU2MlZvTHc2b1h6SXIrcVo5RkhDWXc5Y0VIbEdSSlBU?=
 =?utf-8?B?azVaTGUzTmNWdndCajRlb2xwM2tTQzNETm8rSVhmajBTU21CajRac1FEbS9G?=
 =?utf-8?B?Z0NHbzRjcjN5S2swSis4Y05SV1NaTTJ3QVdQOHZwa1YvaEpnSDd2cUoyZ3hv?=
 =?utf-8?B?Y0wyK2ZuazE0VUE2dlJQTERKZGMyTytkL2R4NTkydTlZMll3ZGJicFBBUTF1?=
 =?utf-8?B?MXFlN1cvU3JIeDBQS0plRWY2MmljcU51aUZiZWlKUUx4OTM5VGJaY3c0RERj?=
 =?utf-8?B?Q3gxa2pKdUFUN1crNzY5RUVrK2p0RnVIUGRQcmpQWitqcG9nc1lVeDdER04z?=
 =?utf-8?B?SU92dllabHIwMWhrS2Y0WjBRb2NPYjBvSUk2RTN6dWM0N0lRY3VZSVFycmdZ?=
 =?utf-8?B?Sld3bG5aNlNRdzYwTm5lOE8vbng5MCsvU3NYbURjT3ZHdkJFODQ2YWs3U1I2?=
 =?utf-8?B?ZC9RbFY5TStvT0dEL2VOYWExcDBtWmNqWHJlS0tSbzdFMi9hZnM5Z1d2RXFO?=
 =?utf-8?B?Yi9vL3k2bkxlY1RITDFIU2M5blJNQW9kVmRvQWlrVEtFMWZ0eHhQcTdpVGdT?=
 =?utf-8?B?dHF1UFlQT3B4a2tXL1RiTlJSckpzdGRHVU03ZHlLZnFpdVBYazY5eVRIckNR?=
 =?utf-8?B?THdobk0xMy84YWtOU2tBdnd2UUsrODUxUDFFbkpUUmhreUFxYWpQbHBrcWtr?=
 =?utf-8?B?NXFDVDRMdERnUXRlTkFHVmdTQVV3YWVSRGFlVkVPL3RKWXRDOUNSNXJVRTdl?=
 =?utf-8?B?cGVsbjBIdm9XR2tyWDYzU2FqNUY3dnRITm85TlBHRktsNjBCNkZwcmF4TFR2?=
 =?utf-8?B?SWoyeGhEU3E4OFVqSWxRNEZjYlN6VmlmYXVzbUtFOTZVVXRpUExOQ2RBMFpK?=
 =?utf-8?B?VkdCVmhSOGJ4a05laTVhZnk4aUVsckI3UXhYRVhsWlNBaXFDckJZSlluUk1I?=
 =?utf-8?Q?jR+UhZk2gWk4qHEJQO0S1MrCK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 26736f4b-1200-48cc-bd0b-08dd2afd14fe
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4123.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 07:14:22.6713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 38kEHryddSKb2x1E0SIPVZ1fQWCR8uQrjEVCl8KUSDmlAlYTSXn9jxGUGQUp8jPVH5Kxjck0f44u33ITK7nfYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7765
Message-ID-Hash: WZXXSAHHYEGDQJG34J6Z2UB6NN6RB4KY
X-Message-ID-Hash: WZXXSAHHYEGDQJG34J6Z2UB6NN6RB4KY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WZXXSAHHYEGDQJG34J6Z2UB6NN6RB4KY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25/12/24 12:53, Vijendar Mukunda wrote:
> Add SoundWire support for ACP7.0 and ACP7.1 platforms.
>
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  drivers/soundwire/amd_manager.c   | 23 +++++++++++++++++++++++
>  drivers/soundwire/amd_manager.h   | 18 ++++++++++++++++++
>  include/linux/soundwire/sdw_amd.h |  2 ++
>  3 files changed, 43 insertions(+)
>
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 60be5805715e..9eb8d345b527 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -446,6 +446,10 @@ static int amd_sdw_port_params(struct sdw_bus *bus, struct sdw_port_params *p_pa
>  			return -EINVAL;
>  		}
>  		break;
> +	case ACP70_PCI_REV_ID:
> +	case ACP71_PCI_REV_ID:
> +		frame_fmt_reg = acp70_sdw_dp_reg[p_params->num].frame_fmt_reg;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -494,6 +498,14 @@ static int amd_sdw_transport_params(struct sdw_bus *bus,
>  			return -EINVAL;
>  		}
>  		break;
> +	case ACP70_PCI_REV_ID:
> +	case ACP71_PCI_REV_ID:
> +		frame_fmt_reg = acp70_sdw_dp_reg[params->port_num].frame_fmt_reg;
> +		sample_int_reg = acp70_sdw_dp_reg[params->port_num].sample_int_reg;
> +		hctrl_dp0_reg = acp70_sdw_dp_reg[params->port_num].hctrl_dp0_reg;
> +		offset_reg = acp70_sdw_dp_reg[params->port_num].offset_reg;
> +		lane_ctrl_ch_en_reg = acp70_sdw_dp_reg[params->port_num].lane_ctrl_ch_en_reg;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -549,6 +561,10 @@ static int amd_sdw_port_enable(struct sdw_bus *bus,
>  			return -EINVAL;
>  		}
>  		break;
> +	case ACP70_PCI_REV_ID:
> +	case ACP71_PCI_REV_ID:
> +		lane_ctrl_ch_en_reg = acp70_sdw_dp_reg[enable_ch->port_num].lane_ctrl_ch_en_reg;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -895,6 +911,7 @@ int amd_sdw_manager_start(struct amd_sdw_manager *amd_manager)
>  		ret = amd_enable_sdw_manager(amd_manager);
>  		if (ret)
>  			return ret;
> +
>  		amd_sdw_set_frameshape(amd_manager);
>  	}
>  	/* Enable runtime PM */
> @@ -966,6 +983,11 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>  			return -EINVAL;
>  		}
>  		break;
> +	case ACP70_PCI_REV_ID:
> +	case ACP71_PCI_REV_ID:
> +		amd_manager->num_dout_ports = AMD_ACP70_SDW_MAX_TX_PORTS;
> +		amd_manager->num_din_ports = AMD_ACP70_SDW_MAX_RX_PORTS;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -1172,6 +1194,7 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
>  		ret = amd_sdw_clock_stop(amd_manager);
>  		if (ret)
>  			return ret;
> +
Extra white line is added. Will fix it in V2 version.
>  		return amd_deinit_sdw_manager(amd_manager);
>  	}
>  	return 0;
> diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
> index cc2170e4521e..30244a31c21c 100644
> --- a/drivers/soundwire/amd_manager.h
> +++ b/drivers/soundwire/amd_manager.h
> @@ -159,8 +159,11 @@
>  #define AMD_ACP63_SDW0_MAX_RX_PORTS		3
>  #define AMD_ACP63_SDW1_MAX_TX_PORTS		1
>  #define AMD_ACP63_SDW1_MAX_RX_PORTS		1
> +#define AMD_ACP70_SDW_MAX_TX_PORTS		3
> +#define AMD_ACP70_SDW_MAX_RX_PORTS		3
>  #define AMD_ACP63_SDW0_MAX_DAI		6
>  #define AMD_ACP63_SDW1_MAX_DAI		2
> +#define AMD_ACP70_SDW_MAX_DAI		6
>  #define AMD_SDW_SLAVE_0_ATTACHED	5
>  #define AMD_SDW_SSP_COUNTER_VAL		3
>  
> @@ -244,6 +247,21 @@ static struct sdw_manager_dp_reg acp63_sdw1_dp_reg[AMD_ACP63_SDW1_MAX_DAI] =  {
>  	 ACP_SW_AUDIO1_RX_OFFSET, ACP_SW_AUDIO1_RX_CHANNEL_ENABLE_DP0}
>  };
>  
> +static struct sdw_manager_dp_reg acp70_sdw_dp_reg[AMD_ACP70_SDW_MAX_DAI] =  {
> +	{ACP_SW_AUDIO0_TX_FRAME_FORMAT, ACP_SW_AUDIO0_TX_SAMPLEINTERVAL, ACP_SW_AUDIO0_TX_HCTRL_DP0,
> +	 ACP_SW_AUDIO0_TX_OFFSET_DP0, ACP_SW_AUDIO0_TX_CHANNEL_ENABLE_DP0},
> +	{ACP_SW_AUDIO1_TX_FRAME_FORMAT, ACP_SW_AUDIO1_TX_SAMPLEINTERVAL, ACP_SW_AUDIO1_TX_HCTRL,
> +	 ACP_SW_AUDIO1_TX_OFFSET, ACP_SW_AUDIO1_TX_CHANNEL_ENABLE_DP0},
> +	{ACP_SW_AUDIO2_TX_FRAME_FORMAT, ACP_SW_AUDIO2_TX_SAMPLEINTERVAL, ACP_SW_AUDIO2_TX_HCTRL,
> +	 ACP_SW_AUDIO2_TX_OFFSET, ACP_SW_AUDIO2_TX_CHANNEL_ENABLE_DP0},
> +	{ACP_SW_AUDIO0_RX_FRAME_FORMAT, ACP_SW_AUDIO0_RX_SAMPLEINTERVAL, ACP_SW_AUDIO0_RX_HCTRL_DP0,
> +	 ACP_SW_AUDIO0_RX_OFFSET_DP0, ACP_SW_AUDIO0_RX_CHANNEL_ENABLE_DP0},
> +	{ACP_SW_AUDIO1_RX_FRAME_FORMAT, ACP_SW_AUDIO1_RX_SAMPLEINTERVAL, ACP_SW_AUDIO1_RX_HCTRL,
> +	 ACP_SW_AUDIO1_RX_OFFSET, ACP_SW_AUDIO1_RX_CHANNEL_ENABLE_DP0},
> +	{ACP_SW_AUDIO2_RX_FRAME_FORMAT, ACP_SW_AUDIO2_RX_SAMPLEINTERVAL, ACP_SW_AUDIO2_RX_HCTRL,
> +	 ACP_SW_AUDIO2_RX_OFFSET, ACP_SW_AUDIO2_RX_CHANNEL_ENABLE_DP0},
> +};
> +
>  static u32 sdw_manager_reg_mask_array[AMD_SDW_MAX_MANAGER_COUNT] =  {
>  		AMD_SDW0_EXT_INTR_MASK,
>  		AMD_SDW1_EXT_INTR_MASK
> diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
> index 799f8578137b..6b839987f14c 100644
> --- a/include/linux/soundwire/sdw_amd.h
> +++ b/include/linux/soundwire/sdw_amd.h
> @@ -28,6 +28,8 @@
>  #define ACP_SDW1	1
>  #define AMD_SDW_MAX_MANAGER_COUNT	2
>  #define ACP63_PCI_REV_ID		0x63
> +#define ACP70_PCI_REV_ID		0x70
> +#define ACP71_PCI_REV_ID		0x71
>  
>  struct acp_sdw_pdata {
>  	u16 instance;

