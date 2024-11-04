Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3659BAD33
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2024 08:34:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40B1F852;
	Mon,  4 Nov 2024 08:34:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40B1F852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730705684;
	bh=+3QMyzQWjA707dU3TjcqdJo/POGKeX79S/4RstBLGVg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Smy4iksncXZoHQ/g/IyvmVvm4uUr15a65SGR8T9DxcdM+FXsV8YxeuZphwJZ2CCGM
	 RxTPUPfUl5bmgA8aUytP3uQhPTRvFc+CE0ITWTuU1hYHB/WBQbOJ1FoDeeyEhFxGY8
	 WN06+bOMP547h+/i9DJ81CLIlF21Am/lORpwKUlM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A19FF805A9; Mon,  4 Nov 2024 08:34:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86732F8049C;
	Mon,  4 Nov 2024 08:34:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CF7DF8013D; Mon,  4 Nov 2024 08:33:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from SE2P216CU007.outbound.protection.outlook.com
 (mail-koreacentralazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c40f::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E662F8013D
	for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2024 08:33:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E662F8013D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3uIlUqhB/x+LI9pMHcg7g9fv5v4a9oZEQ1wbvV4h/X2Wf2GscAG3tAwhsr+QVGrOMMXCcKiElkdphaOuGalNSMmMqRhnaDpU/GTU/3+gRXj6IyYajj3O48MyAaHNLJHEWr72fZ44xHSYaZgK7q4BCxA6YSthv8iwRgeQGfcMfq/MwfGFF1WaryMrFMcT+2S1Ch1/Ralkt0GzEZkV0fgNj0K++pxJDQwbhMeSDzMI7I5BCJuSm5RwgDXJtO46nMQayujuUWx3sDWtBw0KIBkMROoqNobVG7Zav4aOlnpsXItjBfxop6gJ82/ZE3TGXYc/dP/hch8UiOHUrcSCuT7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3QMyzQWjA707dU3TjcqdJo/POGKeX79S/4RstBLGVg=;
 b=OfOIR89iYKh5qZevUa26QJwDU3R2y00P3uMNeQAwQ7xz9M+qxiR+iufctEXQk0Qcwq95pVDZOGJr/7zeJwfFlB9S36V4WQSe13bdzG+nlMXCCs7GZxrEXcGkklFByy30czZfV6Tjvsojy67NkVv8Of0HkxTWtdYGcLSLv1P8eWuhEndP8PGOTUNg8t3moTTmWxhBUp0Rws1wHC3IHPYdMPMwkWF2j3EB8asliVZippxaPms2Y6CMB56HhKUtcDPoosqHyjsdY6TnbNdds8C5mKUZu43EGxSnTf/9f7CMyz9hgIXmmIktmTIq30xb14mvZ3LJychDs1XAmk+lJemdow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM (2603:1096:101:14c::11)
 by SE2P216MB3133.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 07:33:43 +0000
Received: from SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756]) by SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
 ([fe80::7e8d:9550:c46b:2756%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 07:33:43 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/2] Add a driver for the Iron Device SMA1307 Amp
Thread-Topic: [PATCH v3 0/2] Add a driver for the Iron Device SMA1307 Amp
Thread-Index: AQHbLouKE7bHuJjS1E6pV9KZhYSsqbKmuhGA
Date: Mon, 4 Nov 2024 07:33:43 +0000
Message-ID: 
 <SL2P216MB23375AE5F115B832315E41AB8C512@SL2P216MB2337.KORP216.PROD.OUTLOOK.COM>
References: <20241104-irondevice-sma1307-v3-0-4bbe79895f54@irondevice.com>
In-Reply-To: <20241104-irondevice-sma1307-v3-0-4bbe79895f54@irondevice.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2337:EE_|SE2P216MB3133:EE_
x-ms-office365-filtering-correlation-id: 26bc01cd-1423-449c-0a0d-08dcfca3027b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MVk2ZDhEVHFHUCtQOXJuMmp4bHVlemVldzVNYVU5ZVQ0Ym9FR1BVamQ2UHVY?=
 =?utf-8?B?aGZRblFZcjY4OFZVZlJEZUhkQStldDlrZGFwcklyVlM2NkFpVEpoRnpSUVZF?=
 =?utf-8?B?OEJPdXh6L1dveHNZNnJSTlo5bUdTQUZuTmxMSVRCdVFxQUlBYnZDMnd5dWJ1?=
 =?utf-8?B?ZUJwd0ZRbEtjZnEvZFlScVo2ZWxxcHJQc1UwOE5SaEE4Z3phTlRPY1dBM0Zw?=
 =?utf-8?B?ZVNpZlQ1V0s0ZHJwRVlicFVybHJnZ0Zqb1pXOUVLWTF1UmN0N0hRUFJjWUdx?=
 =?utf-8?B?VnZTVkJ4WnNBaUErbnRwZ2tMeHBIWFhHaldUZGFSRXVEcy8xN2QyUExURVUz?=
 =?utf-8?B?TW96OEpCaFhCemZKMUFzNnh2UUhmRWlTYnBZK3U4eVN3a01ZQ3R0WnppSXN3?=
 =?utf-8?B?eTl5TFhhWjRLOWxIdDBHU3l1L3MwTWtJU09ycXZUMnVlbEMxQWZ2VTRtRXNl?=
 =?utf-8?B?MS9KN0tZRTdpdzRsR2QyZ01MZDNPN0UxNVlNTUNpNFJNUjJENmJFUmF3Qmht?=
 =?utf-8?B?MndHUjdSK1BrczhLUm1ZaGVwczZJV2RrNnVtMlVHR045MFpJSHVwOTRTVlhB?=
 =?utf-8?B?MlAvNW52UTFVR0I0UmEyKzVrakFDZkpnczFDbFhsMnoxdVpOek1qQmFENWF0?=
 =?utf-8?B?TmhKTWRGNytjZjlMRjh1MUtmUGU4ZENMdllEa2hxVW05MGNtRlZpZlZkcGVm?=
 =?utf-8?B?R0pXTDAxVy9QTTdsVnhvUWJBVUNoQm5hbmRSRVBydXJ1Mzc4eDI4TkxRMk9a?=
 =?utf-8?B?Kzd5RGZEVk1wSVFXeG52em9YMXZuYkhaZnVxSUhOeTlyTk9FcmlsRHJYMFVh?=
 =?utf-8?B?OVFaZUdzazhGbVlkQk5HUVlKblZYTnlIRU9vMyswQjZEbS9RS0IwYWJWUzNx?=
 =?utf-8?B?T1VjWGp0bTkydWNwWHA2T2luWDlzZ0ZvVVFwcjlQT0tGK21lNDErUFhCWHpM?=
 =?utf-8?B?L3Mxb2dScDFXc1NnMXB6dDN6RHhuNTJ5azcwcFNMUjZzTkVEM2gxaFYyOUpj?=
 =?utf-8?B?QW5rcTJmQjVrTTVobDZTSXgyTm1WYkRBSTNsUEk3V1BCcTZGYU80Tldlc1F0?=
 =?utf-8?B?NDM0WVd2d3ZlQ1U5RTk4WllQU3drQ3hUMDZQZ3Z3MFNZWk1UVkhsQ0Z5OW1q?=
 =?utf-8?B?Rm5iMVUrcXZWS1A0SWhQTWliMkZUbGg5V1B2clhTclZXZ200akxsQkxYOWli?=
 =?utf-8?B?U3F6ZnlQZ0NmQ2FmTEFaTEhhYkRqNS9OSDB5aVVGcFlLUnNsRXZLdVdDZUlq?=
 =?utf-8?B?UXdBd3lkRVpWUXoxNlNpeXdyenliZGxxNXp3aUwxRTMrUjZEc3EwUGlmOW8y?=
 =?utf-8?B?a1FzZHBJRG5IQ1Y4MnlJY0kvL0NaNDRyQklVSDBEd25FQnJJK0VhWmdoYUFy?=
 =?utf-8?B?SU5Ha2cwRTIwdkdMNkhXZzFmQzRGOXVBVjZvdlJUV25Lb0dXdGliY0ZmMGto?=
 =?utf-8?B?MlNYa2VoU093Q0ozZlNUL2JNYTdqVWh0QmpyUVdLbjhnaGdaY2hwb2FMbitG?=
 =?utf-8?B?aWExMXhOMmh2QmVPU0hqTkEwSm14ZGxYMXRjeDdhNHNBVkhWSTRac1V0WE5p?=
 =?utf-8?B?WHRmbnNFNVlCWm9kR2wvbXhVZHJOQlI1OXl1OUxRZGlVazlSeHpNVnFtUjBn?=
 =?utf-8?B?dGYxbUJsc2FzK2NYc29UQW9mVHA2OEhFYUsrU3d5Ny9EdXRoaEd1NUlHcWwr?=
 =?utf-8?B?aGhEK3k2ZWxGMXVCYXNJMWN2YWxSOUdVa1pnVG85aWV5UHA1L3hRK3lha0ZD?=
 =?utf-8?B?Yy9Pd0pnYTRaYWxlaVpjZ0NDbUlYYWh0Ti9QR01wWHQ5NVNrekZYcWtUTHdN?=
 =?utf-8?Q?XB7NSSpARnR05mmDFHNlm38VwxfqhVm4LAH+8=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2337.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aVNJeE9BNzFXblFHZ2hwQ1dITGREdzNESktWTFZUd3pITTZSYUZPbnp3QURl?=
 =?utf-8?B?VHpnRmdGOVhLWndHUUtZdnVqK2ZRTFMxVmpGY1lFaStZQjRNNU9uQXVpSThQ?=
 =?utf-8?B?Nk5ERjVCZXNleCtLc0QrSEVSRjJURVBiZHpML1lTNmxNNUZDS21wVHFWVU80?=
 =?utf-8?B?SmlqMDdUc1doVEhNM0ltaGR6d05rdm9DbTFLWGV1L0xYMjBKRk9GOEJ2U29l?=
 =?utf-8?B?blM0UXlQcnJoQ1J4Szc5dSs5YnpCNlViUkY5UUtIeHhYaEgwcEx0K0xyb2VS?=
 =?utf-8?B?ZXZ3TTZqUUhlVnBPYTkxbmhDczN1TnUzSDNGejM3cHJBSWw5bDNXUHJwNC9u?=
 =?utf-8?B?MVdvbHhLYi9WanhDRnkxRWpEUnE2MUtqcnFsL0k2K0h5eHNjOHIzOGkyRVA1?=
 =?utf-8?B?OGpoNEl4Y25XaDNJQ1pUWEt5RG1uTzBnekREV21TQnRxMkNHMGVLZ0ZXWjVp?=
 =?utf-8?B?RmJYczRKbUZ0eWZoNkd4VzRIMzhEZGVSSkFpeEYrVFZ0N2VYVHVrK0RndXFu?=
 =?utf-8?B?UDBLcU5TOFZZTlJxZjh2Y0UwVHFCL0ZrbkZ6cjRSZUJJOG1DMXl6RUg0SUo0?=
 =?utf-8?B?MHpGb2p1aStkQlJXZURpenNoNG8wSzlUaG5TWFVCTkkvU05wczRaeldVd2NI?=
 =?utf-8?B?UkNqTW1RcXpuQ3RBckQ4RDl3R0hGeENjRU1EejhqS1hCWnRHNDU0SERNRzBq?=
 =?utf-8?B?dnZycWZqWG85TS9WTDlyc3ZtSUtuWFRHbDdmSndjRGdsRUVoVVI5Vk9OZ2tn?=
 =?utf-8?B?TEV1cmZTNlJEMGl5QzdHQ2hsdmRUckhnOXdpOTkxZWZrT2tpb3dmeXRWNVNO?=
 =?utf-8?B?MVNzZDRPL2Q3Wk5MTjZBNEpYclJoVC90bkpXMDVLcHRmRnV0TjRoZmExZDlJ?=
 =?utf-8?B?K0pnaHYweDZVRHBkRWFxcWlSU3lmRUZnZXBxeHF6R0UzWUdoSnM0elBwblpJ?=
 =?utf-8?B?UXZEaUNtN2pLOEZ2SkFZNkw2ZjZkM0VuMnNadHd1akgwak5EK3B5YXVQdjN6?=
 =?utf-8?B?bERZUURKZVJ4Z2JmUGtIR2VXOUlwb21EOXpIS05lZFJFRjdtY2NzL3lrMTBw?=
 =?utf-8?B?alJSYVA2cWxsQ1pZSmVVaFd0eUlnK0NHeHdkQmZDTDI5T1c4dWtHNFo1VWVo?=
 =?utf-8?B?N3hjaFd0MDZCMlliWHVBN0RWYlBtN2hKbTQ2allYZ0lrOEpWMFBhbjQ5bFZY?=
 =?utf-8?B?TXAvVm92WHI2RC9uTmw1WU1HTWdLN1REQXJubzVBT1V4U0plclpMa0ZNWTI1?=
 =?utf-8?B?UVRaVHVtUFQ4NHhOb09qeXhOOFRsdkFTNDFqNk05ZXZMcHhEa01iRnZtQ0Zv?=
 =?utf-8?B?bFFCYkZoZmVrZms3emIyZVRmSlZraHJuYk1BQzA2dW5BaVNwbjFTOGsvU0ln?=
 =?utf-8?B?bDZVSVJEeXFrbkdvYUNHcVByL0dFUHBxQjRNMmZSeXlBaWVBMWh1VFpkZ0xP?=
 =?utf-8?B?NjB6M2tqNnozU3AyblJiRlp2WDFHdUpVY1dDSHdrYTNUaGZLN0tNQmJkZFhL?=
 =?utf-8?B?b2s4Uy9xMFo2RE1ra2tuMkxoUFVLc0wycWdBdkwvekNXUmZnL2FoNHZkdkQr?=
 =?utf-8?B?VGZQYmFkVmlGMWZhME5PQXNXQnlMVndZaDVTZDFhRXRwUmxyVEgxek9VYXdG?=
 =?utf-8?B?OE9TWngxTEVSL0pMSDBveWxHZDE4OU96T1l2ZWIycHpqTVNGN1FWQmtBblY3?=
 =?utf-8?B?cDMxRDFSRWN2bjBTYVNrMklJTkluUzc0VGJMLzExUXVWdnNrRU0vWjF6RTB3?=
 =?utf-8?B?Z1UrcUtBWTE1aWtwWVZmdFAvcU51Nm1iU2x2ejJnTEMweVdaZUpRZDFTTXBw?=
 =?utf-8?B?OVBvSzlsNFc0Ky9uUk5XVTdZdDBsNFZNMHhFU0NYdENpcFhaTVJmc09NeXBG?=
 =?utf-8?B?QmVGOGJnZVhvYWw4V2ZrTFRxY1RLZzUyZ3hJU2RuQ1NXdFJORjhDV1A3Vitq?=
 =?utf-8?B?cEw4WE9PZm5Mcm9XRjZhK1dab1RDZTY5b29DWFFieEJkRXB6d3BSQkJhaXBv?=
 =?utf-8?B?Q2d5RnhpcWpzYWZCdm5JRDBOM0NPNWVIVWJQb3IwS2ZuSXdTcnJCU3M1ZmEz?=
 =?utf-8?B?MjYrclF4TUpneXpsNEZEM210Tm8yQk41UGtzTHR0Q1duWndqZGUyOGVUZmxs?=
 =?utf-8?Q?nEb2PLYf9dpgzKpNVdZwMAXIf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2337.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 26bc01cd-1423-449c-0a0d-08dcfca3027b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 07:33:43.0896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 JvUjA3pImWlzXCV78DLfVTsogBzFRyhrcjIM9rk38WjdI5hTGNErgPJj3hHvXXBZ5H3h7cuvtiPpRT5vkXsq2pwvHniQViG4mefcJ0aH+ME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB3133
Message-ID-Hash: FBU7LBEJKEV7Q7TSEL5ZDC2JWV6W6CW3
X-Message-ID-Hash: FBU7LBEJKEV7Q7TSEL5ZDC2JWV6W6CW3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LEQA7OAWRIJOWJCNUK7FTXPDEZIIGA2L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpUaGlzIGFkZHMgYmFzaWMgYXVkaW8gc3VwcG9ydCBmb3IgdGhlIElyb24gRGV2aWNlIFNNQTEz
MDcgYW1wbGlmaWVyDQoNClNpZ25lZC1vZmYtYnk6IEtpc2VvayBKbyA8a2lzZW9rLmpvQGlyb25k
ZXZpY2UuY29tPg0KLS0tDQpLaXNlb2sgSm8gKDIpOg0KICAgICAgQVNvQzogZHQtYmluZGluZ3M6
IGlyb25kZXZpY2Usc21hMTMwNzogQWRkIGluaXRpYWwgRFQgYmluZGluZw0KICAgICAgQVNvQzog
c21hMTMwNzogQWRkIGRyaXZlciBmb3IgSXJvbiBEZXZpY2UgU01BMTMwNw0KDQogLi4uL2JpbmRp
bmdzL3NvdW5kL2lyb25kZXZpY2Usc21hMTMwNy55YW1sICAgICAgICAgfCAgIDU0ICsNCiBUbyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDANCiBz
b3VuZC9zb2MvY29kZWNzL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMTAg
Kw0KIHNvdW5kL3NvYy9jb2RlY3MvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAgMiArDQogc291bmQvc29jL2NvZGVjcy9zbWExMzA3LmMgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyMDUyICsrKysrKysrKysrKysrKysrKysrDQogc291bmQvc29jL2NvZGVjcy9zbWExMzA3
LmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgNDQ0ICsrKysrDQogNiBmaWxlcyBjaGFuZ2Vk
LCAyNTYyIGluc2VydGlvbnMoKykNCi0tLQ0KYmFzZS1jb21taXQ6IDA2ZGY1OTY4ZmQyZjQxOGI1
NzI5YzQzZmZmZDY1Mzg4ZWYwNDQ4ZjQNCmNoYW5nZS1pZDogMjAyNDEwMDctaXJvbmRldmljZS1z
bWExMzA3LWZmYzQyYjIxODU3NA0KDQpCZXN0IHJlZ2FyZHMsDQotLSANCktpc2VvayBKbyA8a2lz
ZW9rLmpvQGlyb25kZXZpY2UuY29tPg0KDQo=
