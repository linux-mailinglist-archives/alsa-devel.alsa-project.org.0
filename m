Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1FB94FE08
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 08:41:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B36FD22A4;
	Tue, 13 Aug 2024 08:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B36FD22A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723531276;
	bh=gYRIEASo1PG8yRMYyfdm5ENU4NqloV+uehcVUrchfjk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YsUKbgRvob+lSjyBtgfTds+9b1sA7lI4pLf6chvIVUHyG9D86sEBxKhYEIZmayg56
	 kasWVJoMGXTOUGQJXnO3HqXqj/GR0/z9mgWZetRQIcbwCwRALTlAXPs9dvk8ciEDiN
	 3jhjVohk97jtZL+aQMVvTPJrmvqFtN3qBDRaF+vw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0E23F8059F; Tue, 13 Aug 2024 08:40:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEAB6F805B0;
	Tue, 13 Aug 2024 08:40:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55377F80423; Tue, 13 Aug 2024 08:40:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from PUWP216CU001.outbound.protection.outlook.com
 (mail-koreasouthazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c410::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F369EF8016E
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 08:40:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F369EF8016E
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfOc4VXkFDQydyvomKvUkmH9CsgH+zvKkLC3vWgolT2ahIaw+9SgumTXM7tuJWQKYqvXW0L5wqrytQLGder9s+Lipa89Lpo3P3oOFHCfemHH87hBRubnlXtPmCeeLtv02N/SouZzwgZOXhIx1mCrQBKHLBD1kSh1gxLlsxan8A4DEI/0OVUCqYzFJBrSJ5gIYL/XgW1A5hvxbYEO69AwBj2GMzDOS2DDBxeoKHshI5oSybwsFMa39aIAif9o8B9mwv/hLgqTxIkhjgEnJPmnQp7zhheGVyLkQCh6JaL08A2UupfF8X7JCBgqNlQy8AfrqYxRrDPd2a+reLQv0f4XgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYRIEASo1PG8yRMYyfdm5ENU4NqloV+uehcVUrchfjk=;
 b=GjB+D+BrV74iNQhYVzfZYdBk/bDOxBSXPKiMmTjPJ2Sil9Vd/1D9JK0a4uNczx/W6tdZIl3mXhieCUbwFL3OefxWoPyLFsUKg5zbcs8uUVZAL/AnRN3QPoCGeHhBlwVabao5/WaFxqqjSt6kOvc/qFtmGVOWFA1gEhuQramyj1SPIxVrhYj6CY0ZwP6/c9yw+vbtyzIGXOQyUQy8HnC2yLEKOHuUpMxb+Z/4MqVAQhWfO4jml2g+CxJ4f8v/N7NvdcDsOdtKy8eQl8YBNcM5Ntmbqrzd+H4I26pxKRti5v97HRI7yA516QjEuqSWdJGux5wnbzA+jCgwLtqSa5YEUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by PU4P216MB1977.KORP216.PROD.OUTLOOK.COM (2603:1096:301:10a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 06:40:27 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%3]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 06:40:27 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/2] ASoC: sma1307: Add driver for Iron Device SMA1307
Thread-Topic: [PATCH 1/2] ASoC: sma1307: Add driver for Iron Device SMA1307
Thread-Index: AQHa7SwpBvKEAIyrBkSqNtvSW565RbIkr4UAgAAGAkA=
Date: Tue, 13 Aug 2024 06:40:27 +0000
Message-ID: 
 <SL2P216MB2337A011D4CFF786759E2C988C862@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
References: <20240813025436.52410-1-kiseok.jo@irondevice.com>
 <20240813025436.52410-2-kiseok.jo@irondevice.com>
 <42311e08-44b0-4c00-a540-daf172be4eb1@kernel.org>
In-Reply-To: <42311e08-44b0-4c00-a540-daf172be4eb1@kernel.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2337:EE_|PU4P216MB1977:EE_
x-ms-office365-filtering-correlation-id: d55eda9b-0bd3-4edf-4b97-08dcbb62d175
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TzRwTGUrU0lYZWJ6MEJJYzRxN3FXeVpPR1B6cWRXdWNXKytoYXFMSFE4QkU4?=
 =?utf-8?B?SzVzZy9TRGZrQmNrQXpoTXo0K2ZPTlFLQUM3NHZzUFRNajJVYmxQNmJlOGYy?=
 =?utf-8?B?elozOGdobWx0Vm9ySHRQT3VRc1V0WktvQXlrUlVnaUkyWVVmT1NWYnBGd2sy?=
 =?utf-8?B?M1NjUmdXRWJMOFlJTkdCZnBsb1hzbk11WkFlTDVDY0VPaGRMejYxblZ3cUVv?=
 =?utf-8?B?cFlJYzVFREhsWlQ4RFJmeWVDdzlla1ZYUjk3OVUwWEIxSDZrb2tYUTFXa2Q3?=
 =?utf-8?B?TmlvdWszbEljVlVVWENhbUh6L2d5YjhQUHpPbEhVZlg2ci9pY3A1OWdOWHpw?=
 =?utf-8?B?ZFNKTVB5RTZCa01EMnpuRmMybElWZG1kWDM5NlYxWGpITExVM0swaDBBWGcz?=
 =?utf-8?B?aUlid1dnY3ZtMytPNHBLTkRINUMzVjZKdGEvUVo3Y2FWT1p3SFZqUlh5VHlK?=
 =?utf-8?B?WEZYMHg5Wkh4eTFMSkdIWnJZcitRRko4dVgxMVpycUZFcW5uQ0EvaHpGZzlw?=
 =?utf-8?B?bDVnbFlIcHJvQThPUVdxS3M5SnJERmJ2akg0WmY3UGZ3Qi9xR3cvUHdQNlpj?=
 =?utf-8?B?RjhMUlV0ajArODRXQTlYSG5YdWptMVZsc3J5dnFOdzV4MDJwMTlJbzZOYkFV?=
 =?utf-8?B?SHN4dW0way8waXZIbGZ6cGRla25QUExSNTFLeGNrVmlaWWxFTGdBSC9VWjQz?=
 =?utf-8?B?WmZMbSt3VXVUMTl1OGNyR1FBbFFSZGhZbjlaTytPQ1BueExGNXRnWkMyNlZN?=
 =?utf-8?B?TGNNaGtCa0d3ZVFWMm1jblFRaisvU3B5MDAwd2pLRW9aV2Z3d2JvTGtKM1pP?=
 =?utf-8?B?bmRqcUZZdlB2QnRFVkFUUkNSeE1Ha0l2dEhLMXlBWXFUUTlkNHFxZWx0TTFZ?=
 =?utf-8?B?WWMweDRKekZVYnQ1REl5TEgrVGhkRnJRaEF5cjlaTnByMzRhOFkvdXUycHgy?=
 =?utf-8?B?MG5mK0JNYWM1N3pERHkyR2g4bFVTT3dsMFAwZXU2YmREbVZQWTRqWno3dlk2?=
 =?utf-8?B?QnJ1Qmc5Q3hyU0NVNWVWQ0FIRVVhQXZ6MlNHVy94UXBPNENCd0l1WWM0OVdD?=
 =?utf-8?B?RUNoeFhoTXZrMk5IdjdHVFl2ZkFibTluSlFkQ05scnppZFF6NjAxcG9xc0oy?=
 =?utf-8?B?VXNVWmFMQThEaVN3cGFoN0ZUMFU3aVdhaGpvbStNZmxZaURwS0c2SDFsTENP?=
 =?utf-8?B?UlpjVVlXZVdFZjlXdFRVdHBLTkd6cnMwVzFkd2RnUVhtT1VtMktsZm12Zkxw?=
 =?utf-8?B?ZFI4V1l3S2lFNHNxWW54cU5maEJlUHdUN3VvR3RhSjg2d2F0L1Bac0Zpcm5o?=
 =?utf-8?B?UTh3aHNyWEJBbHJIRWdFQUxCb2pzR0hiT0I4TWRtdWNpNXQxd2lzUmtNLzIx?=
 =?utf-8?B?WmVvYlBqNGFUT3RYWVlheGwxd1JwcFdDZHdOSlRJSU5yKzg5VTF0Wm8zUDhn?=
 =?utf-8?B?OExqcEdIQW9HNEVpR0tremEvdXNrb0hvOUlTaDY5aWpGN2pFU3JnTWVlaEVZ?=
 =?utf-8?B?N0hDSFNRQkxOYzRveGs3Q1ovWkpWaXR0eDFWVXlrTkFPamNpZEdhUGpJZm8w?=
 =?utf-8?B?a2tsZE8zdkVYKzM0TnMyOEliYTdtbXl5Q3Z6d3BYeGcrTTRpd3MxOVhIOG12?=
 =?utf-8?B?cEJhUlpOVGVJdzdCdi8zUDFaTDhSUFNEVlFndHdqaitVNlZpRWtVeVVVdWtj?=
 =?utf-8?B?azZyaFYwU1dYK0lpb2xKZW5vTmRaMFBDbEMyaExGbmVxYlZZcTh2MVZNT3Fz?=
 =?utf-8?B?bERzTmFpOXZnMUZFcWRyQUpGUWE2WjQvTGtLaVBKV2UxZDAzV1YyUERqQTZs?=
 =?utf-8?B?WmROYTNhQXpoMmJtR2JPeW5QL2kwTnRBUWpOczR6Kys3SS9xMjNNQjBuWGRq?=
 =?utf-8?B?YjZjNDV2UUlSaVh4SGYzSVl4QTcraGtBR1ZRdlpJQ2U0TFE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MHQ1Nk8vczA2ZEFmV2xoam9tQ0tlY3V5TVNqcFpReE5oMUpxTGdQMWR1ZVBQ?=
 =?utf-8?B?UDQ2enVubEdYMjJ0VGdXVEpmWURXNWlqblBUck5WV1ZIVTZSTWJLSWxLRm03?=
 =?utf-8?B?eENhUklmQ1F6RlVYbXBNRWNQK3h3SHBtWWIzOTBZN3JwZHNrN0YwS3ZrUlBG?=
 =?utf-8?B?WEtGeE1aUVRENUZtMGZ2OTFncUJHYmxDSzR6Z0ZNMkxZQ2VlYUR4TmRyZ3cz?=
 =?utf-8?B?aS9YTDRpVnpqK09EeDMzTjh2WS9KeWtMOGxYWllCRDVsRW50bkxycUMzR2ZU?=
 =?utf-8?B?SXl5UW9GRUg5SE5NM2Q5MEtnSWtWcWNHLzJSNkNiTktaRVRUeHBnQ1VFT0VD?=
 =?utf-8?B?eFBWTDRGVnlhclI1enlCbExVNEJ6OEVMN2FXUiswQlJJMXl3enQwd1MzclNZ?=
 =?utf-8?B?K0s1ajFGdHNSTjF6OGZzazc5UEphMnltcEIxTUlyRk1UQkZwMUVOdG8vUDRl?=
 =?utf-8?B?bHgrY3FRRHFleWRjcXZlV0dhMm5ZK21WL2FKeVdvdVZPSTFSK1pMeXg5RWlZ?=
 =?utf-8?B?czdIKzNkWU51SmViTjVPR1ZHZmp4NG8rcFlGQk8zOSt4bFV5T0JHb05nUHBC?=
 =?utf-8?B?RGZoMzJZLzIweFhJUFVqUURqOGpFVWd2dmNrUzVsSEVJWTNQZVRubVlzZXQx?=
 =?utf-8?B?Q2hESG10aFBlK3FQNTh2M1VPMVh2S3JYSmR4YXNMcldZSWFPeEp0aHdTdzYz?=
 =?utf-8?B?dTdPcTJmRndOelZ1Y25FbWJtdmdJZXg2dTdLWUJyRXJ6MWNKN2xLRWw5bU5o?=
 =?utf-8?B?UmFQTDRYbHZwc0k2QUVSSGFMSWZGY1hDSitiZkNqTmFZN3F0SjZSU1V0b0RJ?=
 =?utf-8?B?a2hxd2JONWlHams3MFRjOGhUMU5panVVS1ZUZTUxYkpsZGdtS0p5b24vMHE1?=
 =?utf-8?B?YlBndVVpMExjMkhyTFFrWGtDTDdJSUYvTkxkanQzZ2tRSGgwcGJ4cUU3NEZP?=
 =?utf-8?B?ZldZLy9rMlNyWFJMU3J3b1FmcHJhWGVqRW9hZ1VSSXd4WWxrMkE0akdDZmtm?=
 =?utf-8?B?Mm5QZU5aNkFFeGF2RE5KOE50ZURVLytnUmxJR2tkU0xtamxGeUpacldEaHhJ?=
 =?utf-8?B?QlhpV0tvMy9qVzBlUENRWlIxYmFTTkhrQ29NWkU3SUdqNC9qdUxCR0pvWlly?=
 =?utf-8?B?TnZ4cHZWN2NIazJ2c3ZlWjMzTXI1ckNDRFBPTk5Qa0I4b3ZCZHpMZmRnbkNu?=
 =?utf-8?B?SEVkNk5pS1lyNTQ1dXI2ZjhSQmJGVFByWFdxSHdhZ08rek9CQUZXVHdnNnlU?=
 =?utf-8?B?WFNQbjljekJuMkt5eGdsZ2hYaXpLNWFybDRmaW9weXd0VEZ1TjJja0FHMG0y?=
 =?utf-8?B?L0xiVEZKajRERGNTdlBYMXFNWmEwb1lpOTVYNTluM2RKRFY4S1RxaTBKR25Q?=
 =?utf-8?B?U1hQa243S1lXdC9Ca2ZhN01HbGZRUXUrSERNVWp6YXZCNjE3cUhmNUhvQmty?=
 =?utf-8?B?b0duRjdoNkRHamhxekdIVk9lY0luTTVOZjlQaVMwcEFjZGpjWmxIUWJ2b1NW?=
 =?utf-8?B?SkN4aXdFeFc1TU1lMUw4RjhBd05WcisxN1dvTFoyRkd3SkI1RGpIYXdXa3JP?=
 =?utf-8?B?cjQwMFp4TXBKNlp6elhzNTFoNkkzcGRWMVZkMzdYbUhCbjU0aEdxeitjb0FJ?=
 =?utf-8?B?dWU0RGZyTTlQTExrVERFaDlIOXJGM2NCSkliR0pDL21ma3ltd1luUlJIeU5K?=
 =?utf-8?B?QVFmVXBabGxhSytrOFcwNVBGYjZXTjdwbENxMElsTDU1MEg2TjFpbkdwdFBl?=
 =?utf-8?B?SGZjSEIwSEQyR0gvWUZYMTRwWVZNdnNDelAvSWttdHJIZFJFRitjOXVCLzhq?=
 =?utf-8?B?UWJkeWExb2VLbHpXZ2M1a1RtOFQrZzlQdUJmczNudFJ2VWxqb3lPRlBDZWZG?=
 =?utf-8?B?eTNQVVI1SVBxcHdCa21IVHBwQnEvbkwrN3lFUzdNaEVyVGF1VVQvSmRjT1h0?=
 =?utf-8?B?ODNnb0c1MmdsYWtXcUlLc1JzUjllbHc0NzMreVNBdm9hNDNSMk1KUElhcUlk?=
 =?utf-8?B?bGZrbkRrbnJPK0xXTzdkdUY0SE5IandsNE5hUFFPSWxnSUFweGlTTklZbm9h?=
 =?utf-8?B?MkVwWWRTM2VVRzNsc2lXZ3dqZ0x3VVE5YkVoYWxZSlc5YnlUcHc2Q2hsZ0xO?=
 =?utf-8?Q?MhpvEU4bOztUSkyhwieq9+HaB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d55eda9b-0bd3-4edf-4b97-08dcbb62d175
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 06:40:27.4848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 ID2CkADv6atUCiKcF8eR2BXUNvAG7yNY46zmOlUEM4o7iNR5XXOKsLk4BIKtkNek7ndIlK/cgEJWg31U0ddqYmWteU45QkLEx5P4LSEvSog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1977
Message-ID-Hash: 4FXF3MMORB6NKGXDYEAXANNHAUQQRHUV
X-Message-ID-Hash: 4FXF3MMORB6NKGXDYEAXANNHAUQQRHUV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LVLBAXABQJLR2VS6FZDNYX2ESMVQEP6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQoNCj4gPiArc3RhdGljIGludCBzbWExMzA3X3Jlc2V0X2dldChzdHJ1Y3Qgc25kX2tjb250cm9s
ICprY29udHJvbCwNCj4gPiArCQkJICAgICBzdHJ1Y3Qgc25kX2N0bF9lbGVtX3ZhbHVlICp1Y29u
dHJvbCkgew0KPiA+ICsJc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQgPQ0KPiA+
ICsJICAgIHNuZF9zb2Nfa2NvbnRyb2xfY29tcG9uZW50KGtjb250cm9sKTsNCj4gPiArCXN0cnVj
dCBzbWExMzA3X3ByaXYgKnNtYTEzMDcgPSANCj4gPiArc25kX3NvY19jb21wb25lbnRfZ2V0X2Ry
dmRhdGEoY29tcG9uZW50KTsNCj4gPiArDQo+ID4gKwl1Y29udHJvbC0+dmFsdWUuaW50ZWdlci52
YWx1ZVswXSA9IChpbnQpc21hMTMwNy0+cmVzZXQ7DQo+ID4gKwlkZXZfZGJnKHNtYTEzMDctPmRl
diwgIiVzOiAgcmVhZHlcbiIsIF9fZnVuY19fKTsNCg0KPiBEcm9wIGFsbCBzdWNoIHNpbXBsZSBm
dW5jdGlvbiBzdWNjZXNzIG1lc3NhZ2VzLg0KDQpFdmVuIHRob3VnaCB0aGUgbG9ncyB3ZXJlIHNl
dCB1c2luZyBkZXZfZGJnLCBpcyB0aGVyZSBzdGlsbCBhbiBpc3N1ZT8NCg0KDQo+ID4gKw0KPiA+
ICsJcmV0dXJuIHRydWU7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgc21hMTMwN19i
aW5hcnlfbW9kZV9nZXQoc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsDQo+ID4gKwkJCQkg
ICBzdHJ1Y3Qgc25kX2N0bF9lbGVtX3ZhbHVlICp1Y29udHJvbCkgew0KPiA+ICsJc3RydWN0IHNt
YTEzMDdfcHJpdiAqc21hMTMwNyA9IHNuZF9rY29udHJvbF9jaGlwKGtjb250cm9sKTsNCj4gPiAr
DQo+ID4gKwl1Y29udHJvbC0+dmFsdWUuZW51bWVyYXRlZC5pdGVtWzBdID0gKHVuc2lnbmVkIA0K
PiA+ICtpbnQpc21hMTMwNy0+YmluYXJ5X21vZGU7DQo+ID4gKw0KPiA+ICsJZGV2X2RiZyhzbWEx
MzA3LT5kZXYsDQo+ID4gKwkJICIlczogYmluYXJ5IG1vZGUgaXMgJXNcbiIsDQo+ID4gKwkJIF9f
ZnVuY19fLCBzbWExMzA3X2JpbmFyeV9tb2RlX3RleHRbc21hMTMwNy0+YmluYXJ5X21vZGVdKTsN
Cg0KPiBXaHkgZG8geW91IGRlYnVnIGV2ZXJ5IHNvdW5kLUFQSSBjYWxsPw0KDQpJIGFkZGVkIGl0
IGZvciBkZWJ1Z2dpbmcgcHVycG9zZXMgdG8gdmVyaWZ5IHdoZW4gYW5kIGlmIGl0IGlzIGNhbGxl
ZCBkdXJpbmcgYWN0dWFsIG9wZXJhdGlvbi4gSXMgaXQgYSBwcm9ibGVtIGlmIGl0IGlzIG9ubHkg
Y2FsbGVkIGluIGRlYnVnIG1vZGU/DQoNCj4gPiArDQo+ID4gK3N0YXRpYyB2b2lkIHNtYTEzMDdf
c2V0dGluZ19sb2FkZWQoc3RydWN0IHNtYTEzMDdfcHJpdiAqc21hMTMwNywgY2hhciANCj4gPiAr
KmZpbGUpDQoNCj4gVGhpcyB3YXMgbmV2ZXIgcHJvcGVybHkgYnVpbGQgYW5kIHRlc3RlZC4gVGhh
dCdzIGEgc3RyaW5nLCBidXQgeW91IHBhc3MgaGVyZSAnc3RydWN0IHNtYTEzMDdfc2V0dGluZ19m
aWxlJy4NCg0KPiBEbyBub3Qgc2VuZCBjb2RlIHdoaWNoIGRvZXMgbm90IHBhc3MgVz0xIGJ1aWxk
cywgc21hdGNoIGFuZCBzcGFyc2UgY2hlY2tzLg0KDQo+ID4gQWxzbywgdGhhZ3QncyBhIGNvbnN0
IGNoYXIgKi4NCg0KSSBwZXJmb3JtZWQgc3RhdGljIGFuYWx5c2lzIHdpdGggdGhlIEM9MiBvcHRp
b24sIGJ1dCBJIHdpbGwgY2hlY2sgdXNpbmcgdGhlIFc9MSBvcHRpb24uDQoNClRoaXMgZnVuY3Rp
b24gaXMgY29uZmlndXJlZCB0byBub3Qgb3BlcmF0ZSBpZiB0aGUgZmlsZSBpcyBtaXNzaW5nLiBU
eXBpY2FsbHksIGl0IHdpbGwgbm90IGZ1bmN0aW9uIHdpdGhvdXQgdGhlIGZpbGUsIGJ1dCBpdCBj
YW4gYmUgdXNlZCBpZiBJIHByb3ZpZGUgdGhlIGZpbGUgYXMgbmVlZGVkLiBTaG91bGQgc3VjaCBh
IGZ1bmN0aW9uIGJlIGF2b2lkZWQ/DQoNCj4gPiArDQo+ID4gKwlzbWExMzA3LT5hdHRyX2dycCA9
ICZzbWExMzA3X2F0dHJfZ3JvdXA7DQo+ID4gKwlyZXQgPSBzeXNmc19jcmVhdGVfZ3JvdXAoc21h
MTMwNy0+a29iaiwgc21hMTMwNy0+YXR0cl9ncnApOw0KDQo+IFlvdSBuZWVkIHRvIGRvY3VtZW50
IHN5c2ZzIEFCSS4NCg0KSSB3YXMgdW5hd2FyZSB0aGF0IGRvY3VtZW50YXRpb24gZm9yIHN5c2Zz
IHdhcyByZXF1aXJlZC4gSSB3aWxsIHJlYWQgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNm
cy1ydWxlcy5yc3QgYW5kIHdvcmsgb24gY3JlYXRpbmcgdGhlIGRvY3VtZW50YXRpb24uIEFkZGl0
aW9uYWxseSwgSSB3b3VsZCBhcHByZWNpYXRlIGFueSBmdXJ0aGVyIGluZm9ybWF0aW9uIHlvdSBj
YW4gcHJvdmlkZS4NCg0KVGhhbmsgeW91IGZvciB5b3VyIGhlbHAuIEkgd2lsbCBwcm9jZWVkIHdp
dGggdGhlIGRvY3VtZW50YXRpb24gc3RlcCBieSBzdGVwLiBDb3VsZCB5b3UgcHJvdmlkZSBtb3Jl
IGluZm9ybWF0aW9uIGFib3V0IHNwYXJzZT8gSSB0cmllZCB1c2luZyBpdCBidXQgZW5jb3VudGVy
ZWQgZGlmZmljdWx0aWVzLCBzbyBJIG9ubHkgcHJvY2VlZGVkIHdpdGggdGhlIEM9MiBvcHRpb24u
DQoNCkJlc3QgcmVnYXJkcywNCktpc2VvayBKbw0KDQo=
