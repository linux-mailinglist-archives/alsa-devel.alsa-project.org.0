Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E0196975C
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2024 10:39:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2354A4A;
	Tue,  3 Sep 2024 10:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2354A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725352796;
	bh=FuCICBh8tF9D0cul77gcMeOJGS0KFdmVMoBvfMA+m18=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vGVykhJpLVyfY2++s6aWTNGge1Fm3aa3e2a6aGGMPov4ATHcakKQzZT2YD76rGnE7
	 2VNYw7KJ+Taok041Rg30oPkZNjt8d6ZRbcE2/jJeykQOEdFyh1R+T5ZUp/rLjxzmn/
	 TE9CAr+SvGo36TdLSm5bSbObU1KpT+xzzz3qfBGc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67D7AF805B4; Tue,  3 Sep 2024 10:39:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DA67F800E9;
	Tue,  3 Sep 2024 10:39:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04693F80116; Tue,  3 Sep 2024 10:39:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D0A25F80116
	for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2024 10:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0A25F80116
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfGXxHGCyTBpaZ/e00eapeaS10MWovgX0lByzV/p54vkPw55vSYrvCZ2yHhSl6UncfV777JrF2CNPWZZwpln5dUeLhiMKxFclNjiFL2K2/vRFuSVyhYQYLb9F5a2J5PhtWVJGSpjWDqr+yt2O44YIKUl1kUxq0ZlnUdRaz6bNXAlX7R429tcGfBJQemH998Kdi4TfFophFf0GL52+R0YCftO+xEJkRGZXC9Rs80t5iMCnqr+wkMsFuKL3x6LbSIUchun3MmFaSV1EC7BDI74M63K18ThDf4u6aRTzUWbSX1CL+zMaIbKeWRV7yvBZPcNb66KIQEsac4iNgUS18eR4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuCICBh8tF9D0cul77gcMeOJGS0KFdmVMoBvfMA+m18=;
 b=OBtEmzxymi5WDdHCaWvxAGE3EFSNA7PqLuSDEJiDL0q6XZVyrnBAoGc/hw7lOXlkcEn7RE62N4zB+N+VlI33T4KlRYihWpTh76FxnWl8b2dRTatArbDAjAf3d6u9dFAZ8qspzfQ+JICI6aoweOy2Cvo2INRYKPP8qDuaCRX+eJtCvXdpijjWhZkHfJjKB4PnWFkd5tf6YVkuqpNrlP5hPLvjsYPe1jCRc1ijjujrCHy90QBfdPu4RNsz7MJdOD/Z9F9WNZsiAVddhwPY71PoxVMcqRmmLthgC9QZNMSK4eQLdM1SsOOwmkSfxVS3Z/MN24crCTCz/uRL9cg/Qf0shw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SL2P216MB2887.KORP216.PROD.OUTLOOK.COM (2603:1096:101:282::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 08:39:13 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%3]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:39:13 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Application <application@irondevice.com>
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: irondevice,sma1307: Add initial
 DT binding
Thread-Topic: [PATCH v2 2/3] ASoC: dt-bindings: irondevice,sma1307: Add
 initial DT binding
Thread-Index: AQHa/cRmlR7aKhMVCUyKAPBkIGiSDLJFn0aAgAAeskA=
Date: Tue, 3 Sep 2024 08:39:13 +0000
Message-ID: 
 <SL2P216MB2337D3255ABE335E9AE8CB378C932@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
References: <20240903054435.2659-1-kiseok.jo@irondevice.com>
 <20240903054435.2659-3-kiseok.jo@irondevice.com>
 <afb4bwvowfjjrkdh63wx7afz3gyydz7tpuhz2i6g6ahubat3vy@7t5vciiv2yp7>
In-Reply-To: <afb4bwvowfjjrkdh63wx7afz3gyydz7tpuhz2i6g6ahubat3vy@7t5vciiv2yp7>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2337:EE_|SL2P216MB2887:EE_
x-ms-office365-filtering-correlation-id: b5e055f9-3d0b-4bb6-4cd1-08dccbf3e34f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NzdrcFZXUENVaGVFRS9aSXlYaGlWc3ZsNkdTSHBzYWRLU2JldDA4SEtWczRy?=
 =?utf-8?B?K0pUQ2xUeG1GQm1yOCtlSHpDWGV5clB6Tzk5RWU5UkpFN0pYVmFsZjJaVXVv?=
 =?utf-8?B?LzNwWER2dFc5ZHJMR09jWFJwd3NCS1hlSWtXOUQ3TE4zWWovYzlWOVJaRkZ6?=
 =?utf-8?B?QkNZVm15ZjBqcnNWMG5Gd0UyMHJrN1hwNFM4Y0IyWVhMY3VrU3F3Y3E3K0Vr?=
 =?utf-8?B?dVpmL1c4Mmg1MVdVZGVLeDlLNG5oZlBvRFU4b0ozYThKdjV6QitqTHZDUDAw?=
 =?utf-8?B?NGlSMkF0Wm5IeW96d1BROVBUNkN1L1ZLK3lRMDM5WXJlc3NQRDE1RGJPL1lu?=
 =?utf-8?B?TE9HZ2hKSjc3aG5qYVRUcDNQeUJua0JrNXgrbmdVcW0zQ3kxTjZMNWxsdy9G?=
 =?utf-8?B?OTFKTXFwcXpheXBRNTZkY1J4QTBRV1h4Mk1LTzllVU5rbXlLZ2lwdGNmZDIx?=
 =?utf-8?B?RVl3akh2ZXFJNUh0RDNWQXU5TW5xN3ptTC9PVFE5R2lBemVreEJ2N1lXRWd6?=
 =?utf-8?B?b1BlRnpENk1LSTNKVVRxUGZXU3JtRkM4N0k0YlE3anBxZ2dsb1l3MU5hNzRZ?=
 =?utf-8?B?bHlTY21yTVUvRFM0M2tTYjJXb2JSSStwQ2dLWTkvYnE0NWdRL1hEWWpYeFp2?=
 =?utf-8?B?R21JYUZWSXVxa08wMzdXbkc0aStzNHJPV045eHFFQVI0VjBZK0ZRbWJhdExm?=
 =?utf-8?B?c2Y1eStrNk9ZcjlNMitQQ3IwMFlES1ZOSkltclFrbHk3UHR5R1JBY2N3b0xm?=
 =?utf-8?B?eFplZHZLWHdKaFIyQkFHMzU1RytEd0o5MW05ZEJyelF1OFJUNlNkMThINlBZ?=
 =?utf-8?B?YjdLRDlDV3pjM050dHVTeXBBNk9Rek43WUt1MzV0Rm1FcWp0YUQ3R3ZBL1Ni?=
 =?utf-8?B?Q0dLYzk5OVZnUVVYenEwL2RiR2M3VzRDUWVFcW5mQU1aRUEyZSt3WnA0R0xy?=
 =?utf-8?B?Sm1wdUlGM01iV1RWT0VUVjVKUFAvYUVMdVJ2dWJ4c3lYdTMvSmk2K1dtOFdt?=
 =?utf-8?B?OVhDR3hFTEhENnpvTWhlVHMxYnJkQWFuQmRPbzNZTjZDL0VoZVA0UWFLTCs1?=
 =?utf-8?B?eVpqUnBYQ0tJWk5ObEtvT3hyVjMrRVNBc0xPNXVsQjlsL3B6U0tob1Z6UHRK?=
 =?utf-8?B?dW9iRXhGSmwvNS8xanNaamdvekN4Q0I2SjBzTzcyWnhrRUZJNnRFVWh6MXV3?=
 =?utf-8?B?b2d4Y2VXazVlRkk0WVBhTHhOcTB4NWY1eVJKY0p5eENxT3VUTlptYjlGY2pN?=
 =?utf-8?B?bEJhNzhLcHdYTFU1Nm5OSncyaEZ2YjArejBhYWZodkxNdStuMzI4ZzZzcERp?=
 =?utf-8?B?WVpyYWtMYWRJcy9vK3M2SG5hclc1ZlBQTktPMzExdjArcUE1V2ZjY0d1L2Rz?=
 =?utf-8?B?QkFmUFFvYW5TelQ3U2lIRHgrV2t6dTBMelVnZ0dUOGRqSTRzNmJaOVZyUS9D?=
 =?utf-8?B?emcrdTM0VVY1bDlrdHlDamZPUG1JdzkzeUZCTGxzVnBqMFlZOGY5M01NZzNY?=
 =?utf-8?B?K2xMdE1kY2Y3T2pIcmxHWkppZjFLbVl6T1JOTTgyK3JyZG9EWXRpYkg5NzJI?=
 =?utf-8?B?eDhYYVU5RnNqZWdJRC9zbjBYRU5oWGJCeGtxOUtML1dBNnJQVEZXRVdXb2VP?=
 =?utf-8?B?a2svaWVVNWVVb3duZVlGeTQydldnWDNYTlUzTXhlWEkzcVVENmlUUUZvYTZu?=
 =?utf-8?B?TUNGcDhkalVLb2l4bFNEYUZ0cTVZdkJ3S3JLdExDNGJDV1M0b0hyOVJrcHIy?=
 =?utf-8?B?YWF5MVZNM2dzdmgrVGw3MEpNY0o1NEVoZGQyTU9JRlY2MFB3U2Fjdm8zZG5W?=
 =?utf-8?Q?eQsvwiuSv/pwJy0EwPXIfzAvmEQPYN25D+mZU=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K3A0cmRzZlVCNHVqOTNLcFgrY2lWQVd6czMrcUNCZE9nSHVjR0hYbUY0TXQy?=
 =?utf-8?B?bUtURWY3QXRIS2xyRmhYcm9QOFAvTHJQTDBGVEFBNVJWNFRrWXpKSWx2TnN3?=
 =?utf-8?B?SjlJcExZdlE4U1J2eHAvOUlXakQzOU1reUNETE1zVHg4ejJKTDErWktma1dk?=
 =?utf-8?B?OWtWUmcxT3NnNTByaC8xUXZwOGpCSGtvSVBrOE1kMnBmc0RYOGtJZ092b3Rm?=
 =?utf-8?B?bjBzenByUDY5MFU4d29Ib1FtV1cyWEp0NzlzaTQrSzE2VWM3OHBtdWhyb21k?=
 =?utf-8?B?dzF0M0F5aGFsNTRHVDBmRGQ5THc1Uk5xTlBZS1lYMVl3TU1KZEVQZWp3bmI5?=
 =?utf-8?B?cHUwaFRVdCtTQ1MxMW5zeDFLSjI5OXZ6NFVwYysvZmlaOUVCMEhENmdKQ29Y?=
 =?utf-8?B?M1pnVEdicUhjOTVyczE1TnZ1OXpHSWgyRXl0S2xiVm43NndueFlMc01sdWZa?=
 =?utf-8?B?bFlaL3hRc1NvQitoK0pNTmZFYmYvZG1kMUUvL1cwOFQweHhGT1BtWm9halZ6?=
 =?utf-8?B?dCtjZFNNNzNNMk85ckl0NnZJeHc2dEZoeFpueXg1U2hYaEkrVTZTcUlKYnhz?=
 =?utf-8?B?OWg0SWkwa21vQnV6VHZEazlmQlhqdm8wQkdjT0taNDVsYU1EeTdxSEV3SmUv?=
 =?utf-8?B?RW05eElRbEg5NVlubHFFWWNNUXdUenVsalI4d2JaM2djQVRPdEZGa2dKbHJW?=
 =?utf-8?B?SVNzUm9MeG5pcHVpQlozVmdta3FWUHoxRmJzVjlIVkJnOEdvT3pUMjJpQlRq?=
 =?utf-8?B?Z1YzK2FsNG5SaDJDYzU5NXlCWTg1OGQwUWJXclFwcHpnV2w5Wm5DVU1ZNXA3?=
 =?utf-8?B?L1ZiZWNiaVdTRHdOcmZWTzJiQktVMysvSEp4Z0NGWE9lZkE4d3ExM1JzUHBB?=
 =?utf-8?B?ZTJ6bFVwT3ZsRnlJdkd5ejJvNmZ5a0lyRTJYUnRaUDkrMUx6TWVId041Vzg3?=
 =?utf-8?B?VWxFMSsvQXJ6M2ZIUGhBUGU2eEJUaXJ1UzJEMTVlanRzR1NaUmR2NWNkalgv?=
 =?utf-8?B?LzkzeXgzeGZFS3hNVWRmeDk4QlVKL01LL1EvQ2Z2KzBVQzZZc2xOZGttOGx6?=
 =?utf-8?B?SHFwT29lL1Z6RTAza1JvK09GeVNlbjczcGFFMTZMTWdHSWhDSGFSVDdRdEZD?=
 =?utf-8?B?UUVTKzIxUmZSaGV3Y1ovS3NZWWozYWR4VXQ4REZ0TmQ2eTZydXJaSmhzU3o4?=
 =?utf-8?B?S3grS0REWTFwOG4wQmswQXE2SkhIQVV4c29xelA4NEZ0bHdkVjZmc3F5T043?=
 =?utf-8?B?S2psVHpxeVBIbDdLRitFVHhGbEN5YktCYU5tQlJBUnRCNVlyK2U0MmZ1N1I3?=
 =?utf-8?B?aTBkQ2tybjEzSzJNWDhrZDJsNUpNd3NTK2w1MS9rK01ieERkbzdRbGZ6T2d4?=
 =?utf-8?B?WnRJYTNudVd3UVJVaWVIbUo2VGJJTTBuemIxK0NhV1dtaC9nT3RjL2FkU2p3?=
 =?utf-8?B?ZS85anhKYk0rN1Zsd0gzQldMeWRHMVhjTGNFOFdpQngraGVocStkS1BITzJW?=
 =?utf-8?B?Q2dmNG5UZGNYUCt5L2tlM2pKUUxXRjExemJvVzdIU0s2VXpwQXRFblZmWTFk?=
 =?utf-8?B?Qlg5YmFNSUdnVFZRcWM5VzM0cDltbFE2Y1pDaThTeGJVK2EzNnVXbVRMVHpM?=
 =?utf-8?B?aWtvNUdOSUtMOFMxankzbkVTSnpPL2NCYXU3NXpUQkN1Z3ZiSlBDSzBxWStX?=
 =?utf-8?B?Wmg5a2V2T3ZtVjIzREZMaFN0VGJBdko1Zk0yK2hUTERRNnQ4NlhMcmp0NW9O?=
 =?utf-8?B?bVpHYlFrNVVOUk56MTM0SW53bVI4WnhpcmZQbHhiRjlhWFFqV3hLRS9Jd3VR?=
 =?utf-8?B?YnZNYVRNTG9mck4wTGxudnhFYS8xakZYWWVJem5ZQytzamRFanNmT1lKN1Qw?=
 =?utf-8?B?L3JpbW9YVDFPZzkxc1FzRklHTDFJTWVUT0d4QTQwVmVpMFJrcGt0NWxObzls?=
 =?utf-8?B?a1dyMXB3SndaSEpkRUp0NzRVVFV1VGVsc0UyYWpPZDFCa1ZlSngyeGhGeG1u?=
 =?utf-8?B?eHh6RG5Nd0grM0JmWkVkMVBjRzJyY3o0Mk9VUTNpeDVGMUd2N0dEYzV1ZlhL?=
 =?utf-8?B?KzBxWjVaQitQazFxaHY0UVIxQmNIbzF5enliNWpkaEhWL3NYUm4yOTc3Yzd2?=
 =?utf-8?Q?mvQZ+4OoxQqgIoAk0XyLe+bfV?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b5e055f9-3d0b-4bb6-4cd1-08dccbf3e34f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2024 08:39:13.0507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 rdFOl6ME+r5ald5KZAkKC+gRmRazQLMwnsxTmo7LA2ixT3iTXaearfELNaU9iDB77KV+YEnCXojkcy66zx5t7vWtcbmfDJNw+JPh1MTkAhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2887
Message-ID-Hash: ZLLAG4PYETXG7JROET7L36EQSNBVIOB2
X-Message-ID-Hash: ZLLAG4PYETXG7JROET7L36EQSNBVIOB2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SBUTEL3NSMYL77LSU6E6IZRHONPC55K4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiANCj4gT24gVHVlLCBTZXAgMDMsIDIwMjQgYXQgMDI6NDQ6MzRQTSArMDkwMCwgS2lzZW9rIEpv
IHdyb3RlOg0KPiA+IFNpZ25lZC1vZmYtYnk6IEtpc2VvayBKbyA8a2lzZW9rLmpvQGlyb25kZXZp
Y2UuY29tPg0KPiANCj4gRW1wdHkgY29tbWl0PyBSZWFkIHN1Ym1pdHRpbmctcGF0Y2hlcy4NCj4g
DQoNCk9rYXkgSSdsbCBhZGQgbmV4dCBwYXRjaC4NCg0KDQo+IFBsZWFzZSBydW4gc2NyaXB0cy9j
aGVja3BhdGNoLnBsIGFuZCBmaXggcmVwb3J0ZWQgd2FybmluZ3MuIFRoZW4gcGxlYXNlIHJ1bg0K
PiBhbmQgKHByb2JhYmx5KSBmaXggbW9yZSB3YXJuaW5ncy4NCj4gU29tZSB3YXJuaW5ncyBjYW4g
YmUgaWdub3JlZCwgZXNwZWNpYWxseSBmcm9tIC0tc3RyaWN0IHJ1biwgYnV0IHRoZSBjb2RlIGhl
cmUNCj4gbG9va3MgbGlrZSBpdCBuZWVkcyBhIGZpeC4gRmVlbCBmcmVlIHRvIGdldCBpbiB0b3Vj
aCBpZiB0aGUgd2FybmluZyBpcyBub3QNCj4gY2xlYXIuDQo+IA0KDQpXaGVuIEkgY2hlY2tlZCwg
SSBkaWRuJ3QgZW5jb3VudGVyIGFueSBlcnJvcnMgb3Igd2FybmluZ3Mgd2hlbiB1c2luZyAnY2hl
Y2twYXRjaC5wbCcuDQpXaGF0IG9wdGlvbnMgbWlnaHQgYmUgbmVlZGVkPw0KDQoNCj4gPiAtLS0N
Cj4gDQo+IFdoZXJlIGlzIHRoZSBjaGFuZ2Vsb2c/IFdoYXQgaGFwcGVuZWQgaW4gdjI/IFdoeSBh
cmUgeW91IHNlbmRpbmcgdGhlIHNhbWUNCj4gcGF0Y2g/DQo+IA0KDQpJIHVuZGVyc3RhbmQgdGhh
dCB0aGUgZmlsZSBoYXMgbm90IGJlZW4gYXBwbGllZCB5ZXQsIHNvIGl0IG5lZWRzIHRvIGJlIHJl
d3JpdHRlbiBhZ2FpbiB1bnRpbCBhcHBsaWVkLg0KDQoNCj4gPiAgLi4uL2JpbmRpbmdzL3NvdW5k
L2lyb25kZXZpY2Usc21hMTMwNy55YW1sICAgIHwgNTQgKysrKysrKysrKysrKysrKysrKw0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQNCj4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvaXJvbmRldmlj
ZSxzbWExMzA3LnlhbWwNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9pcm9uZGV2aWNlLHNtYTEzMDcueWFtbA0KPiA+IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2lyb25kZXZpY2Usc21hMTMw
Ny55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAuLjBi
YjRlZTY2NA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc291bmQvaXJvbmRldmljZSxzbWExMzA3LnlhbWwNCj4gPiBAQCAtMCww
ICsxLDU0IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkg
T1IgQlNELTItQ2xhdXNlKSAlWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDogaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvc291bmQvaXJvbmRldmljZSxzbWExMzA3LnlhbWwjDQo+ID4g
KyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0K
PiA+ICsNCj4gPiArdGl0bGU6IElyb24gRGV2aWNlIFNNQTEzMDcgQXVkaW8gQW1wbGlmaWVyDQo+
ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIEtpc2VvayBKbyA8a2lzZW9rLmpvQGly
b25kZXZpY2UuY29tPg0KPiA+ICsNCj4gPiArZGVzY3JpcHRpb246DQo+ID4gKyAgU01BMTMwNyBi
b29zdGVkIGRpZ2l0YWwgc3BlYWtlciBhbXBsaWZpZXINCj4gPiArICB3aXRoIGZlZWRiYWNrLWxv
b3AuDQo+ID4gKw0KPiA+ICthbGxPZjoNCj4gPiArICAtICRyZWY6IGRhaS1jb21tb24ueWFtbCMN
Cj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGVu
dW06DQo+ID4gKyAgICAgIC0gaXJvbmRldmljZSxzbWExMzA3YQ0KPiA+ICsgICAgICAtIGlyb25k
ZXZpY2Usc21hMTMwN2FxDQo+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiArICAgICAgSWYgYSAn
cScgaXMgYWRkZWQsIGl0IGluZGljYXRlZCB0aGUgcHJvZHVjdCBpcyBBRUMtUTEwMA0KPiA+ICsg
ICAgICBxdWFsaWZpZWQgZm9yIGF1dG9tb3RpdmUgYXBwbGljYXRpb25zLiBTTUExMzA3QSBzdXBw
b3J0cw0KPiA+ICsgICAgICBib3RoIFdMQ1NQIGFuZCBRRk4gcGFja2FnZXMuIEhvd2V2ZXIsIFNN
QTEzMDdBUSBvbmx5DQo+ID4gKyAgICAgIHN1cHBvcnRzIHRoZSBRRk4gcGFja2FnZS4NCj4gDQo+
IERpZmZlcmVuY2UgaXMgb25seSBpbiBwYWNrYWdlIGJpbj8gVGhhdCBkb2VzIG5vdCB3YXJyYW50
IG5ldyBjb21wYXRpYmxlLg0KPiANCg0KTm8sIHRoZXkgYXJlIGRpZmZlcmVudCBjaGlwcywgc28g
ZGlmZmVyZW50IHNldHRpbmdzLg0KVGhlIHNldHRpbmdzIGFyZSBhdXRvbWF0aWNhbGx5IGNvbmZp
Z3VyZWQgYWNjb3JkaW5nIHRvIGVhY2ggY2hpcC4NCg0KDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6
eXN6dG9mDQoNClRoYW5rIHlvdSBmb3IgeW91ciBkZXRhaWxlZCByZXZpZXcuIEl0IGhhcyBiZWVu
IHZlcnkgaGVscGZ1bCENCg0K
