Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D36D969851
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 11:09:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2BD784A;
	Tue,  3 Sep 2024 11:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2BD784A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725354541;
	bh=7PuThB6f4wX1gkg+ktztKDz35wyK4ECfpUcUIhBM2p0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ccipMNgJlo2D9DQ16KY240HRk0OamK2uTrXvFXGSlLsxQliz3too3YHxWeuVmAUa+
	 kFvyrSw8Z1nTl6s+sLuRyJ59ysA+DyalFMig9Bq/IAbbeCFVXzfd5b5Xv6nf9pnrU1
	 Agzb675qOgfhiKEzUelUDHkZ7pd8DXT1Kvz6a29o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 465E0F805AF; Tue,  3 Sep 2024 11:08:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 987B9F805AE;
	Tue,  3 Sep 2024 11:08:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2755F80199; Tue,  3 Sep 2024 11:08:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from SLXP216CU001.outbound.protection.outlook.com
 (mail-koreacentralazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c40f::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F2B1F80116
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 11:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F2B1F80116
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJem5rkTa0I3iNph1oUMCW2E65w847DMj7t64o3BF9nYEbJ/cYsonHvQn3L9ar7ybU5VtfD6l1BpUqMCpWY2BO1FBcV/gPJ8qlHmxHiYQCbU5z2hdyEpFCRHMW7011RkfiIkm0QzT92UmF58BOYNxEJPYWKd9h2U/E20FBxY7uQFJH209xketgJCVWLjmn30WuPL+dRUWXog1jDzl5nRKxgLVZ9cOMl03gU+80iDgmnZlkLEmcgchX7X+KZaMP1NxLGlI7f5jzLEMP0TNE1Li5IWwNpWe2b8JPSHkZYxL1+5hVbc6FULXnoFVmnOyu70WrRGkqqQVYLPQQau8q+NwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7PuThB6f4wX1gkg+ktztKDz35wyK4ECfpUcUIhBM2p0=;
 b=aoeuEz6kNcxQ62WLA0cJ9nm4EEFuNcTSc3Zs4xg+JgnF1UkR50MCD14Fm+S/8S+Lcgh2wBAK8iH4sKvlA6Rh6Xb/55D5pY4w1GXpUU8uoFNobIMfC08+vm4SLUE3YuMZ/eOmrm2hk44knkIAoW74sfbapsuaeKGESrdCnQegj7rN7bYTgYEqIZk5q+bWdo8Gq7jMLVosLDQ6+lBG+y6z/PAyp/WGjag37yuCMIly4ZigVHJwpCn5n5I5S2b3Ru0kro+L507veBMsnm0X/8FwaEKo4dFt4Zxy3swRHi3SZ905OiAcfzOOMpzl3/uugJW25FIEaCxmja3/WkY7lrXBXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SE1P216MB1912.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 09:08:13 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%3]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 09:08:13 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: irondevice,sma1307: Add initial
 DT binding
Thread-Topic: [PATCH v2 2/3] ASoC: dt-bindings: irondevice,sma1307: Add
 initial DT binding
Thread-Index: AQHa/cRmlR7aKhMVCUyKAPBkIGiSDLJFn0aAgAAeskCAAAR6AIAAA6GQ
Date: Tue, 3 Sep 2024 09:08:13 +0000
Message-ID: 
 <SL2P216MB23374DF15DDE8A31486427068C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-3-kiseok.jo@irondevice.com>
 <afb4bwvowfjjrkdh63wx7afz3gyydz7tpuhz2i6g6ahubat3vy@7t5vciiv2yp7>
 <SL2P216MB2337D3255ABE335E9AE8CB378C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
 <db829bd7-e26b-44ed-b813-c1ccfd30c687@kernel.org>
In-Reply-To: <db829bd7-e26b-44ed-b813-c1ccfd30c687@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2337:EE_|SE1P216MB1912:EE_
x-ms-office365-filtering-correlation-id: 67f6fc53-77e6-4667-ad53-08dccbf7f0bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VHhkWE4zUXIybmhJVzhwekk2QVpUV3ZsUjJwV2xLQ21ydTN5L1hrditGSTZa?=
 =?utf-8?B?NFRmMlNmbWxJRXcwSjFyWlZTUVVUSS9Pc2FXQkI3TXI4cXFYT0NTZzRZTEI0?=
 =?utf-8?B?YjRnd3FpRG14eTdnQUdJSGM3WDlYNE5raEQ1RVNkc1hoaFZUQTNxTHlMdkN4?=
 =?utf-8?B?YW0xS1JRbW1VQzdtbXErNzhMdjlBTmJZcTdWcTk1VlZkRXRDampGekIweUdG?=
 =?utf-8?B?UDYrbEFPSjlEejJoZ2k3WVhoMkdHUnh0aWJQS2hEdFBXdWRISlRQMDRUY2sv?=
 =?utf-8?B?bzAzS1NiQjRMSlp0RWdrcG4xWUMzeWFBakpVSzY0a2d0ZGZZVHdwMHgxU1ZS?=
 =?utf-8?B?T0FlSStvQ1pRU2dNTVduLzNQbWpWVDBLRkhVL0tTNkhSVFhEQTg2U3pNbERC?=
 =?utf-8?B?RWZ0WHExMXVPYjc2ZjhMT3QrZU9JZkd1UlB5WE9HenM3SGd5YkN3MFVPNFBy?=
 =?utf-8?B?TTlRbnRhUVlhcEJWYVMwTUJyNWZoMmFmWEs0UFAvcUxDeGx6MkVLWDV2U0Z0?=
 =?utf-8?B?UTZQWTFVSWozY25pZ1c2cEN2eElyeHd6UDZRbitvZ2J4b2tibUV2T09UbW1H?=
 =?utf-8?B?R3JUcHNDSElNZDROczBjWFJsUjM4Z2JqWXNaRi8zZytLS0ZQT3d2dmhHNThx?=
 =?utf-8?B?YmNzTTJzcTJ0d2NlSExYOFVVcFEyaGdqOVA1WDQ4T29GeURMcDFjSmZpNklR?=
 =?utf-8?B?Z3lKWE9aR0JNWlFmNytRUmlacy9SbFVvZ05NeHBiQ3pJQ1hYaGN6OFhFODVl?=
 =?utf-8?B?SkFDbzNDTGlkQlVDYjBKaXNIVjkzMnVydmlaRDFRYU1zZXhKU0QvYkowdWM4?=
 =?utf-8?B?WkRLOFk1Q0FVbWZXaHZ4eDk5Yjh2dEVNZnI1RkpuM0ZGTm1XajcxNXRTTUhL?=
 =?utf-8?B?Skc5ZWRpNzQvNU9jY1lHZEFFcHRKVWxHdExqdm9xTGpiZUUyMjBKS21LWXBV?=
 =?utf-8?B?clBnRS82WmZRYm5WQW1YMmhVSWs4RUIyV1VBQkhyMjB3OFhUMmNac2U1ZnE4?=
 =?utf-8?B?cS83Qy9TeGVBQ3UxWmZUUXd2SzFYd2c4MmhOUlZSYTkraEZzUURnQUFHZCsz?=
 =?utf-8?B?WHpUWFQvWXh4T2NGWFhTSVFnbzlBWDFWUi9weFdaMjZvZE9mL1cvUmNrSzd5?=
 =?utf-8?B?ajVnVkZnSnU0eXZIRit1TmplblM4VUVNaVVjdnc2Wlo1UnlTckJOL1FXdVFv?=
 =?utf-8?B?UVRIcHFNM0kzZHUxTzFTRzVqYzFjV1NzQ09OMHo3WUhqMW5JcVN3WmJVb245?=
 =?utf-8?B?N2hSRVltc0xKNHYyaktCTXVkbnVSOTF4QlpoR1duL054Z0hNZnJ0eVZTYUFI?=
 =?utf-8?B?OVQxclcxRjBvbkJIaFpPS1JaK0dnYWdSL0tOcUtYYWZxZUxSZG9LMGIwKyt2?=
 =?utf-8?B?a2VtSThBL1RzU3VXZ1NSUFlGeSt3dzJPa2d0ZTNVUzFlcFRSS0hyQ2lERFor?=
 =?utf-8?B?WUhpekxnQk8zbldhekJac045ZFdESE9FVHdKVWdDclhuQi9uWW5zVDNwblpp?=
 =?utf-8?B?SSs3ajVudHUwMXNvVzFZT2dNOTVNMThvd1RWR3lyV2o0RmVHZGllRmowMmxG?=
 =?utf-8?B?SUZldXR0ZWFNdzRHM2J2anE1eEUya2Z4TzJpK0ZuZGx4TDBnWWN1RkVXRWlm?=
 =?utf-8?B?eGtJVkRUelhLWXY4RkRaakRmK3YwclR0dklsQ2NYMGpMV3VqUG1GcTFEeUUw?=
 =?utf-8?B?TGExY2NzVHIwaHB0VXVDVUhRbjJHOHczckd6WEM1cWp5VmZNSlNzMUpHRmpa?=
 =?utf-8?B?ekMzZW1JT2xTTFFUTmozb2NJdzhDRC9oNnR6dG92TDZkNkhJUUdPaUIzMnRO?=
 =?utf-8?B?MUwzdkE1VkJXTnprSGlsTVFJeVVuSW56aVVDMnJOUUg0Z04wNVBpNlRaYWxt?=
 =?utf-8?B?aGoxQU16bmo1ZmptSm14aG5FbkpaRkdmSEZaNDVlZmRZb3c9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S0ZvOWo5VXAyZHViSk44azljK1h0ek44SXZUK2h6QmZtWGgyRzZUZ1QxWE5I?=
 =?utf-8?B?MHJkOFl2V0ZTbVg4ZW1MV2QxcjUwQm9OcG4xazRzU3dtNDVZVGg0WGlDa3ZF?=
 =?utf-8?B?RUszU09HamV1aFRhN3YydElkWmplc2RRMng5cGNycHZLUHBFN0J5TXpjUlVz?=
 =?utf-8?B?YlVtdzlvaXZzbEE1R1JzQjh6TjNLUEdBN0J5eVd4N2IvL1drYXJTU0xmVTlI?=
 =?utf-8?B?aUhHLzVDaGY0Q21WSXQ3L2JiTlFMcUJ6TFY5Q0dQY2wzZGd2V3dtS1JrRUNj?=
 =?utf-8?B?UkNuclEvUEJ1R2YxT0E1eHh0MEVPaC9VNEdHZE01UEc1U21aQTdJaTBtWXRt?=
 =?utf-8?B?T05UVUpTNG8veC9remc5MjVudzFIaGl2Y0xlVll5dTI5dk9qOWdaV2kyNDRn?=
 =?utf-8?B?cEkzT01Zb01KcWpob29wTTFIM0hObStIdTdIY1JNa1RIRWNKa2FzZzhJOXd1?=
 =?utf-8?B?ZGJpU0hXRUtiZE1oQVRLY2ZGUFpiRnR3dlZQWXZYakhMSndueVQrRUFrUE1Q?=
 =?utf-8?B?RUoxY2lFbGpRV21ZQklqSFhmMHYreDlGVWNuVWRnZWI3UTk5dXY2RjBmbHVs?=
 =?utf-8?B?T2thUlV3WnhxOXFCZGxCNnhVM3NUbmFGNDBUbHh4TVBWUnhMRnhZMGYrZlJq?=
 =?utf-8?B?c09LVGFHMVl5SjcxZ0JjSXV6TUhJdlhUb2F6Q2FxVGYraHV5VERMVU94N1lw?=
 =?utf-8?B?TFc2TFF5TnZZbTJXK2pwRHBNU0IrWnpSNG5OeHY0TmtOcFMzMmNsRkU4Smpy?=
 =?utf-8?B?eTVTNGVTK01jb1l2T3I1ejBtQmViem4zWmx6a1hsMGN0UTBlOHI2Qzk0K3JI?=
 =?utf-8?B?c2RpZk1sY2U2cGNwZFQwMEhraFhQbzVNTVdqdFRsSnR5RjdOa3RGd0N3TTBp?=
 =?utf-8?B?UDBWbno2a1VWcW5TV0F1WGlMeEpxT1poYTJsVmpXN3Zoak5wTUdFMkc3clNY?=
 =?utf-8?B?U1RHZ2hCUzVGenl1RnlDWUpoTVZxYnZDcG9XbFlyMUE2cE8vU0V1NEdKZmxp?=
 =?utf-8?B?VW1DR2N0Rm8wQ0V2M0pKYjF6cDZWRERvSUFlSkhEdUF0blptYnZqNUovbjhs?=
 =?utf-8?B?NGcwamRWcTczNExFMmtLZE9CMmFsZWlBNWNjUGNjN1UxaFNacVgrdks0U2tE?=
 =?utf-8?B?QlhDalZCNitCdWZCcFY2YTU4dy93eTFJUmZFVkJDUUE2cHRyQTN3bk0vamhm?=
 =?utf-8?B?VHVDSUt1V0IxMjFsMDZ2K1owTGVIMnF3SGVycVY3NFVidXpVOXZlZjVKMURj?=
 =?utf-8?B?K0grL3NmZFFRT05LUkttbllIOHk3bmJ4SGNwOXErU2RXL09NSEUwdFo2ZmNh?=
 =?utf-8?B?K3dtVGRXN2UwWDJHMXE5c284dERwbHRJMUpOQ3pXcmpnVTQ3SEp6REY2S2tl?=
 =?utf-8?B?anFhZzBoT05DZFQ1dUVKSGZmTWZhQXpONHExOGJUQXd1UUdIajRkd2RtMmdE?=
 =?utf-8?B?emdvMmIrOStOWmkyNTVIKzA3L3ZHT1dvL2wzY1V6bEtUY1M1RzdYdnVZekhY?=
 =?utf-8?B?c2M5Qk85SVBmWktDZlBSU1Q5WEVJYk52Ti9vbEpzTmw0WjEwRVlmM0NrUitD?=
 =?utf-8?B?TnNiUTIzTW84Mk5LVlJMTDRlT0x6c2NWRXJVL1F0S0ZGMXEyOG05L1ZpVzJH?=
 =?utf-8?B?UURUMDZ1NTVsa0dZc1VWeWhqeHRMQ0FSc0Rpbkp3RnFWRUlVVERYUU4zVEZP?=
 =?utf-8?B?THdncHVTeitxOWhZR3FtM0toc2xtajM1NFIyU2xSeE5hckRNaXVURi9mZVBp?=
 =?utf-8?B?NlVrbWhxV1p0di9hNWR4UHU0YnVlZm05cG5IYzJRQ2hla1lacVorVXFOeW5Z?=
 =?utf-8?B?WXJKWnZueDZpT3B2Sy90bzd6K0hpQXVOS2s3aHg4NkowNkRjRTAwVE02T05a?=
 =?utf-8?B?RTFOOERsR0ZtTWRzVk41TEUzb3dOeWFvZTZoRE1aWTRsaTJiNzMwVWFNblNB?=
 =?utf-8?B?QTNoQUZSQ1c4ektGdFE1OTNsVEZ2c0JjNmFUajRCTkdrcEZ3cS9xRTlvckF3?=
 =?utf-8?B?bk1ENHlBbE9TODgzcVI1U2ZhdzZUZ0ZhMGdkYll1YitBSkhCMXU0NFN0NlRz?=
 =?utf-8?B?cVF5TXVCZlhqa1kzdnBvR20wK0Z4djZWaUJTY3FaRTNCbnhrTjZMMXJsZzRQ?=
 =?utf-8?Q?ky36uOD2XCAFkoingHimEqmAk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 67f6fc53-77e6-4667-ad53-08dccbf7f0bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 09:08:13.5593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 ELcW6NZZIWDq20rejqb3h++euiQ35dsiorJieY/RYGQNbhxemKm4wDXDRaVk+A2rD2cDk5uheMw50ruFG+2omdXI5EOEIpFstS1X6QSksUY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1912
Message-ID-Hash: FY5F5WTNQZI6GBZOXUIFDAPD7XD7VSOB
X-Message-ID-Hash: FY5F5WTNQZI6GBZOXUIFDAPD7XD7VSOB
X-MailFrom: kiseok.jo@irondevice.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TE26F2C3ZF7E7SKAZ7MOQFXO7DR4S7JK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiANCj4gT24gMDMvMDkvMjAyNCAxMDozOSwgS2ktU2VvayBKbyB3cm90ZToNCj4gPj4NCj4gPj4g
T24gVHVlLCBTZXAgMDMsIDIwMjQgYXQgMDI6NDQ6MzRQTSArMDkwMCwgS2lzZW9rIEpvIHdyb3Rl
Og0KPiA+Pj4gU2lnbmVkLW9mZi1ieTogS2lzZW9rIEpvIDxraXNlb2suam9AaXJvbmRldmljZS5j
b20+DQo+ID4+DQo+ID4+IEVtcHR5IGNvbW1pdD8gUmVhZCBzdWJtaXR0aW5nLXBhdGNoZXMuDQo+
ID4+DQo+ID4NCj4gPiBPa2F5IEknbGwgYWRkIG5leHQgcGF0Y2guDQo+ID4NCj4gPg0KPiA+PiBQ
bGVhc2UgcnVuIHNjcmlwdHMvY2hlY2twYXRjaC5wbCBhbmQgZml4IHJlcG9ydGVkIHdhcm5pbmdz
LiBUaGVuDQo+ID4+IHBsZWFzZSBydW4gYW5kIChwcm9iYWJseSkgZml4IG1vcmUgd2FybmluZ3Mu
DQo+ID4+IFNvbWUgd2FybmluZ3MgY2FuIGJlIGlnbm9yZWQsIGVzcGVjaWFsbHkgZnJvbSAtLXN0
cmljdCBydW4sIGJ1dCB0aGUNCj4gPj4gY29kZSBoZXJlIGxvb2tzIGxpa2UgaXQgbmVlZHMgYSBm
aXguIEZlZWwgZnJlZSB0byBnZXQgaW4gdG91Y2ggaWYgdGhlDQo+ID4+IHdhcm5pbmcgaXMgbm90
IGNsZWFyLg0KPiA+Pg0KPiA+DQo+ID4gV2hlbiBJIGNoZWNrZWQsIEkgZGlkbid0IGVuY291bnRl
ciBhbnkgZXJyb3JzIG9yIHdhcm5pbmdzIHdoZW4gdXNpbmcNCj4gJ2NoZWNrcGF0Y2gucGwnLg0K
PiA+IFdoYXQgb3B0aW9ucyBtaWdodCBiZSBuZWVkZWQ/DQo+IA0KPiBUaGF0J3Mgbm90IHRydWUg
YW5kIEkgYW0gbm90IGhhcHB5IHRoYXQgSSBuZWVkIHRvIHByb3ZlIHRvIHlvdSBvYnZpb3VzIHRo
aW5nLg0KPiBZb3UgZG8gbm90IG5lZWQgYW55IG9wdGlvbnMuIExvb2s6DQo+IA0KPiBXQVJOSU5H
OiBNaXNzaW5nIGNvbW1pdCBkZXNjcmlwdGlvbiAtIEFkZCBhbiBhcHByb3ByaWF0ZSBvbmUNCj4g
DQo+IFlvdSBjb3VsZCBhdCBsZWFzdCBub3cgZG91YmxlIGNoZWNrIGlmIHJldmlld2VyIHBvaW50
ZWQgaXQgb3V0IGluc3RlYWQgb2YNCj4gaW1tZWRpYXRlbHkgZGlzYWdyZWVpbmcgd2l0aCByZXZp
ZXcuDQo+IA0KDQpJIGhhdmUgbm8gaW50ZW50aW9uIG9mIG9wcG9zaW5nIHRoZSBjb250ZW50LiBJ
IGFtIGFza2luZyBhZ2FpbiBiZWNhdXNlIEkgZGlkbid0IHJlY2VpdmUgYW55IHdhcm5pbmdzIHdo
ZW4gSSBkaWQgdGhlIGZvbGxvd2luZywgYW5kIEkgc3VzcGVjdCBJIG1pZ2h0IGhhdmUgZG9uZSBz
b21ldGhpbmcgd3JvbmcuDQoNCg0KLi9zY3JpcHRzL2NoZWNrcGF0Y2gucGwgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2lyb25kZXZpY2Usc21hMTMwNy55YW1sDQoNCnRv
dGFsOiAwIGVycm9ycywgMCB3YXJuaW5ncywgNTQgbGluZXMgY2hlY2tlZA0KDQpEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvaXJvbmRldmljZSxzbWExMzA3LnlhbWwgaGFz
IG5vIG9idmlvdXMgc3R5bGUgcHJvYmxlbXMgYW5kIGlzIHJlYWR5IGZvciBzdWJtaXNzaW9uLg0K
DQpJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IHRoaXMgb25seSBhcHBsaWVkIHRvIHBh
dGNoZWQgZmlsZXMgYXMgZGVzY3JpYmVkIGFib3ZlLiBJdCB0dXJucyBvdXQgaXQgY2FuIGFsc28g
YmUgdXNlZCB3aXRoIHBhdGNoIGZpbGVzLiBUaGFuayB5b3UgZm9yIHRoZSB1c2VmdWwgaW5mb3Jt
YXRpb24hDQoNCg0KVGhhbmtzIGZvciB5b3VyIGhlbHAhDQoNCg==
