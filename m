Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED17E96593A
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 09:57:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83149DF6;
	Fri, 30 Aug 2024 09:57:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83149DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725004631;
	bh=FvkXHsukwlFynXVbK+sObDO3Zw8d1LxghZK7022LnqA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rGKwQWoWKyzCs1ckoCuj0TWVlipuiYvCqvx94mm7yY22DlUwj2ZPoujJDsd4AOjN+
	 U2/ve5nBQnNDlK8VJiuyqKaQQ17TKZ1WDXZqMSF+LxD8+me5rftUC7vVPT8UNFR/wb
	 XvoN/hvbgqe5ertj+6Ui1PF6KIEXBNUWEeHqtPC8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 567B3F80616; Fri, 30 Aug 2024 09:56:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D59F2F80618;
	Fri, 30 Aug 2024 09:56:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5729F80518; Thu, 29 Aug 2024 09:29:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20631.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2011::631])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6603FF80107
	for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2024 09:29:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6603FF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256
 header.s=selector2 header.b=eN27bMHO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6kyepVX4pAheirEnixN7r3dTUUJWHcyHGb6pIrGHzj2xMMTH7UYGs+MkONDhGqPXyOc5gzlnMRvZyYld+jr77BVyTlalOpYtxLxgJ841Oy8i/v7ydqNGO5YKr6HnaStCB13HB7Mtn3rrm9megIMI7TTEfrfRBmskFO/QEBiQ8HLrYsSImMMq4vVL6zPY+Lgzj87rifcpAASQZKROZ8LlxG5WIAuEfa9z33jD3w/gjwimquL8pXueC0XC8dSgW9orIcJn0JvO9sS6fwxdVw/nvODj4hupv0Gx2X4Rkzumn6QqjliNXy8cG2YKJhkbbexUlN+U3APlZgedXlp0J9p4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wjj/xWkZ2caiR7pPQxvuAKmo7Yl4KuvHvaENvvoAGgk=;
 b=AlyYojGEBA0uonegP3jeBnynlHPaSTiHKOTnOiDboYBcrAgXQJlNJWHJYgk9IPq5C8tP9IX7abo1gXm8ctAJZm0+RWGji9+RrcyCG8IbiuxeT460TBoM526pxK99rbjxyNYP+2N3awuCE2ts1dAoiYWiZvi+dWbZXXQSu1F+IIMMIzyLy4hgIupUDXCl04rdVIyyMo0ZijLdnVb4dAmiT6VZzgRjsfaq+nnqJbWsjmXq3TxmO2imxHJflp4SKnJ5iQyUNAPw35Sutx5Im4xq1lGgwvVNDtQwbKzjbcRI12eNYRrEvWjxC4k73Yfhi6bMdsaVUeju6S7ySrIKuoMnbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wjj/xWkZ2caiR7pPQxvuAKmo7Yl4KuvHvaENvvoAGgk=;
 b=eN27bMHO1tjsoGYjMHGCxql/LAuWzZ4YRiZWbtgH8ZOxkoThDZStBf0Pxa5b6WStMk5MLEv6vb7NIEt8e2k/U4jvbu4hjdxhN/uRDrZpOGox/1EkyMqqY5d7NVC6vLoMKdkZHmbCwvPrMwErJiUmAgdSF6onwi3hKvo9roYZ9jWLXEFw0dXcBmg+CvNEeF+aa2s8tZrZFdjFjycG2XxJr3Qm8V+Ot4rre5trOJ/1JNT+tEnweliDngClQhzsLRfLGZ2T+XHZXhfcht2AXv/x0T+46BzMjnE0i1jS/lYZp7MVFHXEEvp7Jb6tPs3qE/jWUHAistXFODfwqL7mANIvfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6263.apcprd06.prod.outlook.com (2603:1096:400:33d::14)
 by TYZPR06MB6073.apcprd06.prod.outlook.com (2603:1096:400:333::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 29 Aug
 2024 07:29:22 +0000
Received: from TYZPR06MB6263.apcprd06.prod.outlook.com
 ([fe80::bd8:d8ed:8dd5:3268]) by TYZPR06MB6263.apcprd06.prod.outlook.com
 ([fe80::bd8:d8ed:8dd5:3268%6]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 07:29:22 +0000
Message-ID: <576c699b-1e2f-48d9-8dff-b3a795011b20@vivo.com>
Date: Thu, 29 Aug 2024 15:29:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: codecs: Simplify with dev_err_probe()
To: Lars-Peter Clausen <lars@metafoo.de>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240829072016.2329466-1-11162571@vivo.com>
From: Yang Ruibin <11162571@vivo.com>
In-Reply-To: <20240829072016.2329466-1-11162571@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0310.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::7) To TYZPR06MB6263.apcprd06.prod.outlook.com
 (2603:1096:400:33d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6263:EE_|TYZPR06MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b8af83-e5a9-4227-635b-08dcc7fc4d77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|81742002;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a1doTVEwZlErTVZrT2VsTXByV3Z1SUhib1pYSi9SZXJ2cU4wVUtBaGEwMlov?=
 =?utf-8?B?bmJMcG8vSlVCbkZqN1I3SW03eWRyMVZGdVkwWWR3dnpZUk01VmZOemZqemxD?=
 =?utf-8?B?QWdxSHJXS3BxZG1ncDZzSmU4Zzduc0NiTzJVbVhTUVpNVG5HYWIxdXdqOGtt?=
 =?utf-8?B?dDNFSUljWlh2dzZjOXZ1V3VRQXN1d05BZkZtU2Myd2s1bWU3TmJCOHFqNlF0?=
 =?utf-8?B?cFNFZk1NU1R0OElQWEdMNEd6YnB1NngzMGtKR0lNdExucTBMSS9aNXZkSTJR?=
 =?utf-8?B?SVJvQmNkblNrbDBOeG5XVUhESXIwaEhuSVZDSjczUkdId2d1S2gvWStzRlIr?=
 =?utf-8?B?MXQ4d1pZaEUwdXdsSG5jNDdCbHhoaHZ5Y1F5cU5SbFlqTGZmMlU2L2dwTXBa?=
 =?utf-8?B?cDVYdmJFdTVZRkZ2RHJIUXVValJCMXEvOElINmhUVlNlMTNSblY3VlVRcWhp?=
 =?utf-8?B?R2dnYzBUV2h2OXloQjkycVhRQ3RWMUNQUU5kOEVoTG5uRDE4UkZOc25zeFBq?=
 =?utf-8?B?dW5TeFdsZnEyWkl5SUdzZUFENEk3a0thKzRwdjB5M2RvVnh5R1NzSHVlT1Zw?=
 =?utf-8?B?OEN0a29pTG5iSWJ3Z3A1ZHlteVFBRVl3S2Rsb2lqZlMxWEF5SWIyUG14T2lD?=
 =?utf-8?B?ODgveDNWRXorclNNU0NndGRPaG9NeTdJblF4d290dncwMUFybVU0S21la2li?=
 =?utf-8?B?YzhaWEhEcStFV1ZRdUsxOEtGVEQ5cnQwWUw3d0JWVVFneU5aY2pmWE1PQnVG?=
 =?utf-8?B?Q2ZLVmN3SW1RMDNuMm5MeElCTWsyN0wvaEVyOE0vbThCWUk3bXVlK3FqV0Za?=
 =?utf-8?B?dkowNXZUQVg2KzUyVmY3dDhLeTg4ZWtkb3BnYXNLWFo5eE5sOEYrd0FHYkhF?=
 =?utf-8?B?d0dFSWZUbU9DUzgzUG9GVm5ERWRuUGlTUFFjemVndHhTVDJndHJpcmFTWnhK?=
 =?utf-8?B?Y0ZiakJxaThwK25SQThwMHF6NWdvcjczU1VwTStJVVo0d3JjOVFpS0VBallJ?=
 =?utf-8?B?dUJrNXZWRjhOWmdvQTZ5OUtUZUxrSkNYbzlyc1dOMVBBRE92MTAwM1pkS3Vx?=
 =?utf-8?B?WDRXa1FEK1o4TE5xeWFZQit5Z2ZQK3lVaDNtbElmU1lKLzNtWHV0SGRyeHNM?=
 =?utf-8?B?SGtOVVZpY3RwRnlUTkplSCt4M3Qwa3RmT1ZrTk5uQ3lDWS9uc2lYWDNxcG9O?=
 =?utf-8?B?QnlJOUowbTZFMHY1WUgrZVJnWHFUQTFPazQvWXl2K1ZCUEJkKzI1ZnlZaVZR?=
 =?utf-8?B?TGc5bVNNWCs0UXdUeHRpNmxOT1hoV0hhNzZyWUw1clc0c0U1dFhrdHFGdzh1?=
 =?utf-8?B?bjdYYkFFZ1Bld1g0cHFkSE83WXI2eXhrUTdsTWNaS1REZk5wVG5ZaUVEVEM0?=
 =?utf-8?B?OUc2VVhGOWo2dEc2K3d5UVhvYm1UMGRQUmI5QStqZC9KQWFnSFhKVlBhLzhV?=
 =?utf-8?B?VVNIaHQ1MEhiVFk4MU14dmdPRE84cjhyVDhRWWMvM1k1bHpQaUovTFZ3TW5t?=
 =?utf-8?B?a0Y3QzZ1NUdJMThPVVB5MDBxZVladmZaYzlRSjRwbldSVkFETEtnQVJaR1Ez?=
 =?utf-8?B?dlVoTE9Mak1VWUMyL3VxQzJlQ2g3NUxXcDk0Zm9LeDIwUnFuanloUHFqNURt?=
 =?utf-8?B?S1JrRFQrQnBnZ3VrRTlONm5POXV4K3lQeTRERURVSG4yd2RNYVhYZ3Z4VzhM?=
 =?utf-8?B?MEhvekZjbFV6SHdDeExISzVCYU81YVpJaUtVZDBKTjBmYmprVWg3VXFNbnBB?=
 =?utf-8?B?cVVhRnBYeHBnR1JqaFJjU0Z3WXRDdG1aL29LTFZsR3ZFNjJUajByUDg0b2Nm?=
 =?utf-8?B?RnJxK2VIQ3U3dVlaRFgwZzFRT0lIbXN3bXhrUWN1LzBnSlBZTy9wVWlIUkFl?=
 =?utf-8?Q?V1ec1IUyh0oqx?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6263.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(81742002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NmZqNm1SK3Z5eEV3QmpuZTRicytTYmRZSituMFlKRXBjalNHYk1DcjhZZ1Ur?=
 =?utf-8?B?QXRQbndnQ3pPRXlGekE1YTl0MmNEVHpLcHNaNmkwZUd2SC9rTkQzeDBXVDcv?=
 =?utf-8?B?VHMrVSszSFRhWXRvUUZ5VUJWVzI2eExsTGVOQjc1akZxNWpIYXExY2pKWE40?=
 =?utf-8?B?MURERFAyNTI3bElRUkpUMldIVnY4MWVOeWQ0NWNyenlVamszOWdTS2ZJaVM0?=
 =?utf-8?B?OTZFcGNUY2U5ajF1Wk5lYUpjSnZxSytYc1JTRG4rWnZmWG1OUXllZGN2bnBN?=
 =?utf-8?B?VGNJWXZEZzhTVzRUdENxMXBoS3pKbzhrL0dxNVVRQkhtcExpdEJxV2YrVXlU?=
 =?utf-8?B?Z3VzRkdiMlJBUElFcjBsZ1BxbmRTRUVpaExRRkVNR1JjQ3A5UFV2VW1wdWhE?=
 =?utf-8?B?K2prZ0QwUmVqL01CQmcrQk1rcG9OMmZrRzRwV01ZY2x2YVlOc1dybzJZZXZw?=
 =?utf-8?B?M1ZHRDZleExhR3FjcllpL3JrTHI1djBSVzVMaEd6eEt6M3pxTGhuNi9vRzRB?=
 =?utf-8?B?T1BsL1MyUklicjlYbzVyYjZZZVVpZnRKenRpQXdCVmtjbHhUYW4zRmtLZGVa?=
 =?utf-8?B?UEpHZVdEcXR5VW53c25HSGNnaGswUmhaR2pKUkdlVmNodzUzUHlDOFlyOFBD?=
 =?utf-8?B?ZVNqK3pVM3Jnay9WbU5VcHFHaTJyMHNEbG5YdHM2MlZ6S0QrOFJtc2VvRHBn?=
 =?utf-8?B?Z2pxWnNNTkU2eE1iQnRlRS9SK1diU0xxaUl5VkZqaTc2WG8yZ1VHYTBjanF2?=
 =?utf-8?B?OGpUVlZWQXl2STUzWUhDRWFnMndxMkFxdzJIYWszM2lub2R0T2E3YXNvSFRL?=
 =?utf-8?B?UWpJdVU1T3NrRUFZTlZMT1h0eWpGdEIyaFYzZUdKbm1sT0gyTjYrZzV1Y2Fi?=
 =?utf-8?B?bWhmTm94RjlLbkFleGIzejk3Z2t5RlF0ZG5SQVplN2IyeUhUdHBCWFFkK05N?=
 =?utf-8?B?dVRXS3pwVUY0c1IyZXNLKzNlK0FCK2FBRWpmVFJvYlRyWFJKTEQ4MW5HNThM?=
 =?utf-8?B?cVdEN2k4MC9qNmxVNjFxUFAzVDZwUG9lb0FSUDhYcGFob01Qd2RhbE5GcTR5?=
 =?utf-8?B?NC9hYTVaUUhMTGpqTW9VZEZUMjlvMTdLZ1d4WDQvNVhSK0pyV2prMHNvZHZo?=
 =?utf-8?B?MVVxVm9Sd0FjdTNuZUJ3bEZZdk8zTXNlV3NjZzh6dnhiVVVaS0FUb3VFTU1k?=
 =?utf-8?B?WWlHa05VSGkzYm1xejMwdm5OZkNXSlhGbDlGWDRBaUZVZVZKSWlydU5WRUFq?=
 =?utf-8?B?SS80Zmg2TlJsdnpqaXZPNWo4ZlcyKzNOK3ZtRmkxMjE0NHJITGNGL01STUdV?=
 =?utf-8?B?T1p3dk1BNlVmM0lRMHRqWisxSHZuSVFDL3piaDdWRmkwWVFxNVBPNktwSTJt?=
 =?utf-8?B?dGRDY0NRV285RkRjRmJSV2F6NE5JT05ENWNvdS8rZTB5M1Y2S2FkVUdXZkk5?=
 =?utf-8?B?SktRZmhiKzA0aW9VRWV2UVVkbFJDTGNWd1ZBSUQrV3MzQUlLenJOZ3pFYmZw?=
 =?utf-8?B?WWhkZkdUVWVIQzVxTlc1Sk9wY0J0SDMvcEFTcCtKUGVhREs3UUxGamQ3T0Vu?=
 =?utf-8?B?OFkzd3Nlclc4QXBSdERhTVdMRWUrRDNiMW82eXVqZjdkdGNYV3dUbmZQZFNP?=
 =?utf-8?B?d2NWMzhoeGN3ZnlSdW1Da3EyL0pNc1dMcGp5RmJaaU9xOWxQbTdrTGduQ1dL?=
 =?utf-8?B?ZzdjWHFUWXJDU1NiSVRBUjRtMFJFVS93NkZkaHlVNEpnMGl6amZJR3JXVzNB?=
 =?utf-8?B?cWxYZWxlTmVnWGFSa0pTR2FwbUs5M205Y0l2aysxVnB6Tko2WHRVZXVsVHpP?=
 =?utf-8?B?b2R1amVGVW9Ha2x4U3ZuaXlTRVRVN0pkMmVMSXR0T0VBV0xHb0NtSkkxaGdk?=
 =?utf-8?B?NHRIbHJEYW9SR2RKMGpUTGdBV0dBTDlJVWczUmdIdXBHSHQ1cEZuMkgvT2F1?=
 =?utf-8?B?VGZDR2pmakEzSDFjYlpQblJRVFcyTWRIbmJhcEZObXNpVFZCbnV2Rm5NckFN?=
 =?utf-8?B?S29ySmNHZkV2Mm5Da01ucDhoQXpKT1dyM1p3eU1CVEkvQjdXSEVGSjhLNjl5?=
 =?utf-8?B?YkcrS3ZKajV2RTJnOEczcStiRXh0MHErZjlBbCtiL3BPekFhcUxXQlFNdXVL?=
 =?utf-8?Q?oTZHeysov2zVuJe3WSVWbtwdU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f1b8af83-e5a9-4227-635b-08dcc7fc4d77
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6263.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 07:29:22.6220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZwcHMF5USmiscfykQS2kzWdO0bOdTxnhqWLwphSzQtai3yOcaHJakMXgOJq3GZgHRS8onJIS+oPoxbAXWmadIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6073
X-MailFrom: yang.ruibin@vivo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 23KWD7FDWBTMEZNM4OT4XIF2QBXTHYEC
X-Message-ID-Hash: 23KWD7FDWBTMEZNM4OT4XIF2QBXTHYEC
X-Mailman-Approved-At: Fri, 30 Aug 2024 07:55:47 +0000
X-Mailman-Version: 3.3.9
Precedence: list
Reply-To: 11162571@vivo.com
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/23KWD7FDWBTMEZNM4OT4XIF2QBXTHYEC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Sorry, please ignore this patch for now.
The wrong title were used. This patch will be updated later.

在 2024/8/29 15:20, Yang Ruibin 写道:
> Using dev_err_probe() instead of dev_err() in probe() simplifies
> the error path and standardizes the format of the error code.
>
> Signed-off-by: Yang Ruibin <11162571@vivo.com>
> ---
>   sound/soc/codecs/ad1980.c   |  4 ++--
>   sound/soc/codecs/adau1701.c | 12 ++++++------
>   sound/soc/codecs/ssm2602.c  |  4 ++--
>   3 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/sound/soc/codecs/ad1980.c b/sound/soc/codecs/ad1980.c
> index 3c1ae13c1..25fd8bc4f 100644
> --- a/sound/soc/codecs/ad1980.c
> +++ b/sound/soc/codecs/ad1980.c
> @@ -239,8 +239,8 @@ static int ad1980_soc_probe(struct snd_soc_component *component)
>   	ac97 = snd_soc_new_ac97_component(component, 0, 0);
>   	if (IS_ERR(ac97)) {
>   		ret = PTR_ERR(ac97);
> -		dev_err(component->dev, "Failed to register AC97 component: %d\n", ret);
> -		return ret;
> +		return dev_err_probe(component->dev, ret,
> +			"Failed to register AC97 component: %d\n", ret);
>   	}
>   
>   	regmap = regmap_init_ac97(ac97, &ad1980_regmap_config);
> diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
> index 8bd6067df..9fe18b22b 100644
> --- a/sound/soc/codecs/adau1701.c
> +++ b/sound/soc/codecs/adau1701.c
> @@ -678,8 +678,8 @@ static int adau1701_probe(struct snd_soc_component *component)
>   	ret = regulator_bulk_enable(ARRAY_SIZE(adau1701->supplies),
>   				    adau1701->supplies);
>   	if (ret < 0) {
> -		dev_err(component->dev, "Failed to enable regulators: %d\n", ret);
> -		return ret;
> +		return dev_err_probe(component->dev, ret,
> +			"Failed to enable regulators: %d\n", ret);
>   	}
>   
>   	/*
> @@ -799,15 +799,15 @@ static int adau1701_i2c_probe(struct i2c_client *client)
>   	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(adau1701->supplies),
>   			adau1701->supplies);
>   	if (ret < 0) {
> -		dev_err(dev, "Failed to get regulators: %d\n", ret);
> -		return ret;
> +		return dev_err_probe(dev, ret,
> +			"Failed to get regulators: %d\n", ret);
>   	}
>   
>   	ret = regulator_bulk_enable(ARRAY_SIZE(adau1701->supplies),
>   			adau1701->supplies);
>   	if (ret < 0) {
> -		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> -		return ret;
> +		return dev_err_probe(dev, ret,
> +			"Failed to enable regulators: %d\n", ret);
>   	}
>   
>   	adau1701->client = client;
> diff --git a/sound/soc/codecs/ssm2602.c b/sound/soc/codecs/ssm2602.c
> index c29324403..727bcccad 100644
> --- a/sound/soc/codecs/ssm2602.c
> +++ b/sound/soc/codecs/ssm2602.c
> @@ -606,8 +606,8 @@ static int ssm260x_component_probe(struct snd_soc_component *component)
>   
>   	ret = regmap_write(ssm2602->regmap, SSM2602_RESET, 0);
>   	if (ret < 0) {
> -		dev_err(component->dev, "Failed to issue reset: %d\n", ret);
> -		return ret;
> +		return dev_err_probe(component->dev, ret,
> +			"Failed to issue reset: %d\n", ret);
>   	}
>   
>   	regmap_register_patch(ssm2602->regmap, ssm2602_patch,
