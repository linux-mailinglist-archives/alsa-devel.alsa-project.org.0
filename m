Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B639C12D4
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2024 00:58:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F35F14F2;
	Fri,  8 Nov 2024 00:58:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F35F14F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731023899;
	bh=V4NlsYD4PWlh2JN98L72QeSnM6IxiHnrhXJt9oHbJNI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dTILXp9+2RNBiRSq+PZriP/T6WlyziooYVmQgVG6315EO+dbjxnU5Kz5aiR7EanNI
	 IaT5snI809XKTKoUxexf9zjNSMnzO2iR8Uk2WMoRHPQuZ0/ZoViN99tD7ZFiET1EUl
	 TteC7iWMrRkeq6taMfFaa9unFXCe/ckr7NYbGgac=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15A52F805B1; Fri,  8 Nov 2024 00:57:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA493F805B0;
	Fri,  8 Nov 2024 00:57:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4E45F8013D; Fri,  8 Nov 2024 00:57:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from SEVP216CU002.outbound.protection.outlook.com
 (mail-koreacentralazlp170120005.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c40f::5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31570F800AA
	for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2024 00:57:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31570F800AA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLt8tT+fqOpmCSK3CN2HeXcH3wM67OCopaa0pEUOEB+7dBJqU8nGq93wPvATFMij3C8wicNXY7ehlRY+KfbJ1jhSQoEHbdEaggLE4Ku2PxX5c+09CZkvIgqLhqrth69OtsIvM+RORavraC32LI5wbTUrsuGeMec1kJjSG7MAVirSzDmXShteknJQBuXuazo4KF7XW5AIk5hbs/pziiNdbLchuORq36fn3K5guehduwM40Lnjrf0x4a/d2wPdqUbTFzF3s/k1NTt4oqELUgaR4hEnkRKV63W89gMKMs0nMXczQXrahwEGihDkNwe/i54hLyoOzsxf6lUCbwNq3HC1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4NlsYD4PWlh2JN98L72QeSnM6IxiHnrhXJt9oHbJNI=;
 b=wZf8Csg3qaf2923T31BQOfPMux3g/XztkdN6z7LNA53xEchZ9ijF+Cvd5eTvCfWZHzg9AzkCibJ0XEALYZaU1axfIjHbUXyvOJGpWoLsIb0V31QslMz9A3ZS5DaKaCX5FJtkuxyNEUefgrrSDMyTFRl8DRXhvq2C8SyvNvwc1wPSsMt6P/2v+O4NaFmxoledsnLhuagZO9yfMLnvgNBbXxVMI/c159Io/4i32id0YRLUpubKQl/bcpaWeiJxooFeW/H9fWJRBrUU9hHmWnWhJg9MTNC/YHFI3vLpu0trK528Kz1DTmXM7lMgNkOQRMq3h0CGAon/UmgGeGHW8lq32g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SEWP216MB3096.KORP216.PROD.OUTLOOK.COM (2603:1096:101:29b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Thu, 7 Nov
 2024 23:57:30 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%4]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 23:57:30 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH RESEND v4 1/2] ASoC: dt-bindings: irondevice,sma1307: Add
 initial DT
Thread-Topic: [PATCH RESEND v4 1/2] ASoC: dt-bindings: irondevice,sma1307: Add
 initial DT
Thread-Index: AQHbMKQW8owaOy10sUGvAvZU2LVo6rKrlvOAgADpMTA=
Date: Thu, 7 Nov 2024 23:57:30 +0000
Message-ID: 
 <SL2P216MB233740828B79AF06B24FC4F98C5C2@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
References: <20241106233144.9283-1-kiseok.jo@irondevice.com>
 <20241106233144.9283-2-kiseok.jo@irondevice.com>
 <butx33avx7zainw6im72kwdxj6jfvfbdlzugxadu6rfn3uszdx@oxgvrnfl5t5h>
In-Reply-To: <butx33avx7zainw6im72kwdxj6jfvfbdlzugxadu6rfn3uszdx@oxgvrnfl5t5h>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2337:EE_|SEWP216MB3096:EE_
x-ms-office365-filtering-correlation-id: d24ae3da-2e83-45ec-4466-08dcff87f0e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Y2tiUHZqU3hUQm1NSVVHaUlFS0N3TSt4N3pvNkVVdTRUTXRLbGh1dEFSYi9S?=
 =?utf-8?B?S3V4SHVaUkJnMjZXYzZjZ2xmSm96WTNEKzVUMlBDNEZURTRjbEErUmQ0UjUy?=
 =?utf-8?B?ZU9ZSnpxajVWVXRGRWVWNUhIcUV2aU9pdkFaTk1ZUmVVYmJ4cEl2L1NGdW5M?=
 =?utf-8?B?YVBpWnVuSEM4dDlueUhtVEVNb0JST2g3bEdxTWxhQmtINmVrSEtqc1ArN0g5?=
 =?utf-8?B?QmdaMUxya3dYdFdXMzUzeUtERHpOaXc1Qm42eUh5OWh0TTJqUnFrZnVkbkNw?=
 =?utf-8?B?Sy9BYU9xSHZZZzZoSHZZVmU2ZlV2bE0wMmwyZEI2ZWFOM2VrNzFlRU5JekpX?=
 =?utf-8?B?SUd0U2ZyZTBmVGZpdjI4dTRNeHRXcjhiZlRJQTlGdnhXczZJOHZUTzRmNHhl?=
 =?utf-8?B?UTE3QkdEUHB0TTc2VWUxQ0c0TlhCWlp1M05ZMDRramFhSTh6SWZmbS9hVklt?=
 =?utf-8?B?NmJaaGZYcnNjZFlVOVpwWjRkZGFhZXV3enlJdHNaNGZaTkxNdWM0NFltZGd4?=
 =?utf-8?B?T0VsYWZYWGVaRFhTYldlS3FRc3B0ZFEwYzhzb1pTQnl6enZBNU9BQ3Z1Qysy?=
 =?utf-8?B?M2tGRXR3ZXVvU2lzMW1Xc3RzVmtCZE1sNk1hSm9HZElFN3VwdGpRbEl2eWc2?=
 =?utf-8?B?ZjlKM0pLVGhveWhIajArUlA2dVdVMzJGSy96OTFMWUZvM2Y2TGxqMXF4TzFO?=
 =?utf-8?B?alg0QmFLMmtFY0d3NnUxeG1aZHZvWFVHd2RNa1lLd0VzZHREaW4zVWVuQ29V?=
 =?utf-8?B?VXBqdU8weSttM3k5Z1FIVVcwMjZJeEYvdW1COU1RTXp6akZBL0gzbG1QWFR3?=
 =?utf-8?B?cUJHd295czBEVUxHaXUwWUt4MHhySC84d1U3eWJjdlBYWmY5OUNxaUY3Ymtu?=
 =?utf-8?B?cGs3ZzFTWHBBczlsQ1Z4YUV2UDMwNzdvOVlJZEh0L0w3eDNkZStLOEJIQWM0?=
 =?utf-8?B?Q2VMT1p2eHJWUlZ5R1FqaFRnbE9KR2VmbE9ZVFFsa1R6Sm5FK00yNTNYVWlX?=
 =?utf-8?B?cWppL0ZGK1FxbTJQRUdoaWZjR3ZEVmxYRlNoWnF5eDdpNUVkQ3d2ZVVwdFRL?=
 =?utf-8?B?M3NjWWFJb2Q1YTBoa0FrK2FoMzhXNmwxQzgwbGYwOFdhanNqbHc1elZuZXNK?=
 =?utf-8?B?ZVExUGN1MmYzamQyd3U5WTdPM2ZabERjanRGanhFRTh2K3AxcThPVW0xYjY1?=
 =?utf-8?B?UUs5dmc0U0FjNzZWeElPdUlTS2Q2Tk9BLzY2Y2IxRkZFSDNZWmhvV2x3NzdO?=
 =?utf-8?B?d2NFQUZjcDJQRFp4WGIxMzFmWk9hMU1Nck85RzZEMlhXL1dad2ExRWNFMUUy?=
 =?utf-8?B?QVRqdERqZDhuRytwbmIyRWZKbkJrWlZ3Y3BMUnNJU3hlUHhwREVseUozUGN0?=
 =?utf-8?B?Q0twMDNHNWV0ZU1ObE9QVFo0YU0wdTFjYTFVZDM2TGJGM2tkc1hTWktzSWJj?=
 =?utf-8?B?c1pZVUVhY1E3OXJSbnhOSUhwZUw5NXRTZzJlZkNMUjBUS0g2NDlmZ0EzTy9m?=
 =?utf-8?B?SzN3UEpvazNKb3h5M3RwQlV1c1ZJSk9aQmtaRDZpNTVCM2NjT1pZZllLUG0v?=
 =?utf-8?B?ZUxkVitXVDVqdm1YRS9IZVRXN3c4ekhjYUw0LzMwbFBFSGwwb2NmeGtkNk9D?=
 =?utf-8?B?c0pWclI2Q2Nkd1Y0K1RKLzBmazY1V0pVcUlNT1ZrNTB0R2czdFNIbWQwcHNH?=
 =?utf-8?B?KzBhcjd0L01qRS9PL2ZSTGZ6MHNIR3lGc1JkdmdmZE5QT2FPaUZpSjB3bC9r?=
 =?utf-8?Q?6VhUcDyBc3aNaZrpdTFwC+oBt6cPiDAnD6i9hXM?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bDh2alJhY3dvVlBEeEJ3N201bWtqQ2VJR3FNMUVWcGZtYTl6Y0p3RGI4dHYy?=
 =?utf-8?B?RWlNQ1VDTUU3ZG4wTjI3RUVGZUd1RlNCSUtYSmI3OGJueU1vTjk1VnVNVjdh?=
 =?utf-8?B?bU1LaFhkeUZPVDZBbGN3V1hwNi9EYzhoWkRjeDRRK0hGNmcvaGVMSS8yQUox?=
 =?utf-8?B?bWhEd2dMZzYzaWdFRmIreFFXWFNXdnVyekdHTG1rcXpETXhrTTZUVVNHRDJs?=
 =?utf-8?B?MWFJSzI0YStyb01ldXZWTXcxTnUrTVc1cmRyeCtJelBDSlB2TnllWnJJQ1pP?=
 =?utf-8?B?R284TXFnVDZjU0FPcWxqWFpHQXdzS3Njak9PMU1DWWtFeW4xUHl4Q1dhOVF0?=
 =?utf-8?B?Z0dDNnFIUERGcDB6YlZhTWdXcWx2U0ZrV2dsKzZkd3pTRW5GUEplbXg5MnFO?=
 =?utf-8?B?UlF3Tzg4enFLdkhwWFo5ejhiTW5ZczVnYmEzckQ4WWtNdFlMd1RhY3FvTStJ?=
 =?utf-8?B?b2FDc1o1OU5KeCtFOWlmSjdlUkgrM2ZZTTBLaElpUVJSYk1uTzhXT1BMc0kw?=
 =?utf-8?B?K1ppemFsdXpKcU5WcWVlWUd2LzFpOGV5N1dtSXNpZHZYaGpTdHk3MmJXY0Ri?=
 =?utf-8?B?VEk5VFRvanFLN3VtQ0hlSURiR0FTYi9BSWxzdnJpb1B0MllzTy9lSDhHZDg3?=
 =?utf-8?B?VGM4S1cxeGxWYjdmZ1U3Rmc1R0JnMVQ3dVVWeGE4ZW03RS8vSHF2akNReHFl?=
 =?utf-8?B?NnJyUUJzakdaaWpwWGY0b3F2Y2c2K3hrcWxrTFVTTk1JcWpCU3BLaXdRLzFL?=
 =?utf-8?B?Tk1iN21MTFA5TDhHejEvaFJ0R0dBVGxSYTRwTmtnUFdvd3l4QTZDZWMwMmV1?=
 =?utf-8?B?aWVyZzNRYkJDWHBWTklCTXM4UVdwd0tZeXlJSEJxUFdaUURWR055NGlFUFlZ?=
 =?utf-8?B?dGpjb3Y1NzFiZFhKeFpobkNiSE54c2tsZWViNkJRVEtpdkVRMUl0YlE2Mm84?=
 =?utf-8?B?eDBYRE92SmNyMjlZSUpCb2F6Nk80YUhWdVM4RnRTTDA1aTBHSnY1UzVoYW9o?=
 =?utf-8?B?SE9FbkZOMEVucU1wSlY2SGxQcEhxQUFib1pPcVNqSy9lRjNjY0lCM2tKUm1I?=
 =?utf-8?B?Z0VLUzRhRXdLQVk5NW5FWlNRcUtmYks5dEttTnNhekd4MU80ME95bHFaR2lM?=
 =?utf-8?B?N25DWmhKd1lrY1YyNzBOQXBid2Q2MXEyb2tuTHYzN09nTEYzWTEvT09zOHZF?=
 =?utf-8?B?ZkNrZ3V3c1lTT2duK1BWS01WZGZoNUdKeTRpNWJhajlYU2o1eFFBc1IzTnBt?=
 =?utf-8?B?M3B0ajYyTE02Y2owUk13UFcvbkYwQ0x3SG1OKzVaMjJGZHEva3JsVFEzZ3hJ?=
 =?utf-8?B?NVN4SFBkZVE4QWNuMkJSK1p4b2ZKOXZBTTNHaTBleC90dEQyUUdBNUppRkMz?=
 =?utf-8?B?alpNRHFzcHdUaTI4dFBnYjNSWXhjTVY5N1JsTmV5OUJENjF4cnYzbW81N0dD?=
 =?utf-8?B?MmJBNmc5dXlZYTVIcmVKdE05WWp1QUdjemtrdHVXcHBxOE55WHhmeWFKVzFF?=
 =?utf-8?B?RHM5REtBSjlkMzlGb05xL3NnTW9EV0d2bUM3Sm1wOGJwOHVwOVR1N3BEaUph?=
 =?utf-8?B?c3VWUmY0bStKRkQwRy9oU2VKYnh5Q3gvWnk5Ym1YbldOMHlmMXBaYTZKUk9i?=
 =?utf-8?B?dlJrWjQwdTZZMlU4cUdOekRNNzJHcnRDZm03cldpNFMram91YzVoTFBLQzBn?=
 =?utf-8?B?Tmk1VXA0elFKSW9ZcVVvUFBuT25QL0ZVc2FIVUdBSlBWazlybW50bkNrZFBp?=
 =?utf-8?B?RW5zL3pKSGZZVDJRWUdiVUlNYUczSGRpYVNjbGhPQm1naE1saDN2YUR2MnVH?=
 =?utf-8?B?NDhES2lESjBRNDRXbExiNlBwSjFOV1YzVC81SW9PeXl4VzE4Z0k5dEJ3SHNH?=
 =?utf-8?B?WWFaV2pNOURDOFF4MU5vdHZ3MTRPODllYVVYZWMzQVZoNjVZUGNGeVRDV0lo?=
 =?utf-8?B?V0NLMGNnWFdhcEdLOEUzUlk4QzNlTEdnem1HR3BEZFhhQ0pkOEU0ZGExb1dn?=
 =?utf-8?B?Ti9DYlFzMW5mWkZBWFpCODQ1cTRtSDlySXQyYi9FWHpjaVBkVW5mdjFhOGRu?=
 =?utf-8?B?SVdCQWlKSG5ub0pxMkgyK0pQaXRjV01aMDdaMEN5MnNjSkxEU1dRM1ZmNnhR?=
 =?utf-8?Q?2CU3Y8VLXxbE873zv5G7oeH2t?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d24ae3da-2e83-45ec-4466-08dcff87f0e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2024 23:57:30.6579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 VR69JXOumRzBFMRPcQva98WqXEyVDeBimPwi4mqGEIOO7/gjl2zQ3EfBMDStBIyIi4PdzulV9HWgIykxLVaP71D9V/MxYSwumKisGYGKtFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB3096
Message-ID-Hash: PB5CCEE7ZBGNTENC5TXW2K7WPBWTY5XV
X-Message-ID-Hash: PB5CCEE7ZBGNTENC5TXW2K7WPBWTY5XV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EEB7QBZ5PCF3UCT3O7RP6ZBRRRDIB7GJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiANCj4gT24gVGh1LCBOb3YgMDcsIDIwMjQgYXQgMDg6MzE6NDRBTSArMDkwMCwgS2lzZW9rIEpv
IHdyb3RlOg0KPiA+IFRoaXMgYWRkcyB0aGUgc2NoZW1hIGJpbmRpbmcgZm9yIHRoZSBJcm9uIERl
dmljZSBTTUExMzA3IEFtcA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogS2lzZW9rIEpvIDxraXNl
b2suam9AaXJvbmRldmljZS5jb20+DQo+ID4gLS0tDQo+ID4gdjMgLT4gdjQNCj4gPiAgLSBNb2Rp
ZnkgdG8gZml0IHRoZSBjaGFyYWN0ZXItcGVyLWxpbmUgZm9ybWF0DQo+IA0KPiA8Zm9ybSBsZXR0
ZXI+DQo+IFRoaXMgaXMgYSBmcmllbmRseSByZW1pbmRlciBkdXJpbmcgdGhlIHJldmlldyBwcm9j
ZXNzLg0KPiANCj4gSXQgbG9va3MgbGlrZSB5b3UgcmVjZWl2ZWQgYSB0YWcgYW5kIGZvcmdvdCB0
byBhZGQgaXQuDQo+IA0KPiBJZiB5b3UgZG8gbm90IGtub3cgdGhlIHByb2Nlc3MsIGhlcmUgaXMg
YSBzaG9ydCBleHBsYW5hdGlvbjogUGxlYXNlIGFkZCBBY2tlZC0NCj4gYnkvUmV2aWV3ZWQtYnkv
VGVzdGVkLWJ5IHRhZ3Mgd2hlbiBwb3N0aW5nIG5ldyB2ZXJzaW9ucywgdW5kZXIgb3IgYWJvdmUg
eW91cg0KPiBTaWduZWQtb2ZmLWJ5IHRhZy4gVGFnIGlzICJyZWNlaXZlZCIsIHdoZW4gcHJvdmlk
ZWQgaW4gYSBtZXNzYWdlIHJlcGxpZWQgdG8NCj4geW91IG9uIHRoZSBtYWlsaW5nIGxpc3QuIFRv
b2xzIGxpa2UgYjQgY2FuIGhlbHAgaGVyZS4gSG93ZXZlciwgdGhlcmUncyBubyBuZWVkDQo+IHRv
IHJlcG9zdCBwYXRjaGVzICpvbmx5KiB0byBhZGQgdGhlIHRhZ3MuDQo+IFRoZSB1cHN0cmVhbSBt
YWludGFpbmVyIHdpbGwgZG8gdGhhdCBmb3IgdGFncyByZWNlaXZlZCBvbiB0aGUgdmVyc2lvbiB0
aGV5DQo+IGFwcGx5Lg0KPiANCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYu
NS0NCj4gcmMzL3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVz
LnJzdCNMNTc3DQo+IA0KPiBJZiBhIHRhZyB3YXMgbm90IGFkZGVkIG9uIHB1cnBvc2UsIHBsZWFz
ZSBzdGF0ZSB3aHkgYW5kIHdoYXQgY2hhbmdlZC4NCj4gPC9mb3JtIGxldHRlcj4NCj4gDQo+IEJl
c3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNClRoYW5rIHlvdSBmb3IgdGhlIGtpbmQgZXhwbGFu
YXRpb24uDQpJJ2xsIG1ha2Ugc3VyZSB0byBhZGQgdGhlIHRhZyBuZXh0IHRpbWUuDQoNCkkgdHJp
ZWQgdXNpbmcgYjQsIGJ1dCBJIGVuY291bnRlcmVkIGlzc3VlcyB3aXRoIGVtYWlsIGRlbGl2ZXJ5
Lg0KU28gSSBoYXZlbid0IGJlZW4gYWJsZSB0byB1c2UgaXQgcHJvcGVybHkgeWV0Lg0KSSdsbCBt
YWtlIHN1cmUgdG8gdXNlIGl0IGluIG15IG5leHQgcGF0Y2guDQoNClRoYW5rIHlvdSENCg0KQmVz
dCByZWdhcmRzLA0KS2lzZW9rIEpvDQo=
