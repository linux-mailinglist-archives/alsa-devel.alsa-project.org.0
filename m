Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE088CE526
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2024 14:19:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 450D4852;
	Fri, 24 May 2024 14:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 450D4852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716553194;
	bh=u8Y2t/fzExmFNvlrgdeNTl7P8rqsddM67SxLbPGephA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FFD5na7OT6w2xgaZEetxvxrYKuZvOdYEtUQd2LKdUa62f2CpfE0Ic1uipubAyGhDG
	 zvX527KEQLBKZ1me7T8fcA1nzQnRET9GAhOcKsv/HANX9zz/uubtLgqCCZsZoc5rJY
	 J7LvCoXFHomqPHuJGH1LZQh+DSCDTeSmRKNMK7uw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED60FF8067E; Fri, 24 May 2024 14:18:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35698F80677;
	Fri, 24 May 2024 14:18:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41DDEF8026A; Wed, 22 May 2024 10:35:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on20701.outbound.protection.partner.outlook.cn
 [IPv6:2406:e500:4440:2::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58C78F8016B
	for <alsa-devel@alsa-project.org>; Wed, 22 May 2024 10:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58C78F8016B
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noA7rxB4Xkr/hiKYhtbyOYE8VXMRyz7j2hnrPKlRfC+ZFza5QUkI2f/NgnwJVfu36DV7cTS1zAipSB56ExafNP/zenw9r/IVbuJUKgjC+fLcPcFl6RCOIi4GkZyccEuWRtRzeDeDcU7xz9cTRCAZcOOjltTw28UOs3oMFjrDnkN/FraMu4n8fFALKQa/rzPFN9ORf1Kifg7/a7YB1naZNOgRhIaSgOWYn6WRcu5gDqHaH9byLsdvkG0uhH6wZjTv5hn6YXHhwtJUhfE/+BAedFQpqnRJeSpAwNwuUSKWNTUFykwZ6CtQCH4iXvmFiasc6dAMoBXpDJjdKEAzwIm2Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8Y2t/fzExmFNvlrgdeNTl7P8rqsddM67SxLbPGephA=;
 b=WARZXu2nUYCpr+Mc5oAGgEGCemj7a3xLcx1DIGNfImXPDNyBgnT9Th1EBh/HmgrQhHWgUd7QP9fD4KEIDMaRKcSbTvejjMds6VqAL8jaDsnTtUUJCz/5BOE4Ar+dXglRg8uLBzulBpipc+0rPe3nRuZRAo5bAPggZTF3cHFKX92yWgCmM4I2iSFV/A/ZYlxABCZDMihPQB3UVBjfG0CVjl8+Bs2Tox9UbMH7advDnzS8tfl+sHTVQXaeqtWpwW1Bg8MbL/9KJskoWdLj8WPNpyIeKbJpG5wv3OxJ2HOkSYIY0BzeR4w5mGgjPXbs5rZHdnK1BhO5fMpgwHLUDmULcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB1049.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.37; Wed, 22 May
 2024 08:35:25 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::e903:99a6:10b7:304d]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::e903:99a6:10b7:304d%6])
 with mapi id 15.20.7472.044; Wed, 22 May 2024 08:35:25 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai
	<tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>
CC: Walker Chen <walker.chen@starfivetech.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] ASoC: dt-bindings: Add PDM controller for the
 StarFive JH8100 SoC
Thread-Topic: [PATCH v2 1/2] ASoC: dt-bindings: Add PDM controller for the
 StarFive JH8100 SoC
Thread-Index: AQHalVkH07xuCGa5y0qrTe+ETpKiv7F1nF4AgC17FaCAAAGkAA==
Date: Wed, 22 May 2024 08:35:25 +0000
Message-ID: 
 <NTZPR01MB0956170B9324DBA549B6BF679FEB2@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
References: <20240423083405.263912-1-xingyu.wu@starfivetech.com>
 <20240423083405.263912-2-xingyu.wu@starfivetech.com>
 <a5f8746f-14f8-4e56-9ac7-30c7ba6fad30@linaro.org>
 <NTZPR01MB09568BEFB1ACE78D2F5347099FEB2@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: 
 <NTZPR01MB09568BEFB1ACE78D2F5347099FEB2@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NTZPR01MB0956:EE_|NTZPR01MB1049:EE_
x-ms-office365-filtering-correlation-id: 184fc621-ffe0-41f8-adef-08dc7a3a208b
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: 
 BCL:0;ARA:13230031|7416005|1800799015|366007|41320700004|38070700009;
x-microsoft-antispam-message-info: 
 ILR0TJgw+FrDj36YBRbnfZeX9PEs6wFSHniXAxD+o4Ap9DuiHZcwtrf5cg7nMcuKrvXXbBw0j6jEFafGnqLZ373gorRfydJZ9FcKloKMs1PgWPy37fSvZasbyrvOantU79xaHBt0zK6fkzzdego3K2EpwXPxQjm0lO64Q4ohbiQvTyTzrdMXwsrabym8uEKI4WwLR4jDpJa625+yNNHZFgovWMHTWD6EtzzZD4od0zbEzAcBK9KKuh3ePZ+kSqcrvmXs7wR6bPeUAdbx6ukXw/BzeTT2gFCMsnm5yBfmEcvQfkXFxTfSsslQ9fRnxvALcHwd9brjbhvKgwC/UqFuiAj4uZuKK1cDjiHICRq/ufBs6lbVK/qh9SCQOrjD9OuHysrBweNbbnrqNbbo828Vw5PAE4M6CqHlgcK/QNyPqhmlEltucyQg9Cgg+SiW3ZQURrVYLaoALCd9avuRj1Ilq4ktnN6gPr8yJNSYgGINUwaTlEVS49R3H6gk9kvoKM+JZcGih2KOmq42UkmF4effYOIzpLqucCHKV2FFfCmuzvmeaiel8k/v2bcDaXBN/Mr2mQmsUwq3ynEhkeGcfMgEt5kbuk9Z2eJC36lCPMU6ehDThyxHAV7j7CSg9nxF/0yW
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(366007)(41320700004)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SXJxWVZkU2tscVNwek9CdEFnZ0QzTDlpQ25uNWdWcE84M0c0N2t3RFllSG5Z?=
 =?utf-8?B?Y1orUWFvYzJqVXpGRWlXM1dyVmswam5hNElRTXlwbjZrNWpQc0Y4OFo0bERa?=
 =?utf-8?B?Vnh3Z0V4L2dsR0t4Q3RpeklDSWFPc0FHUU5vUmViZ09nQTY3VkFnNWVvck9s?=
 =?utf-8?B?S3d1c3BnRll3RmFiQU9RUlNFdUR2RjFQWEtUM3N0cStkWHc0dmd6cllkbHJC?=
 =?utf-8?B?S0RobDFzT3hJdkxRbVdLZGMrODNXTm5HSWovd2JTTXJOSEIxTkNhc2s2TmNV?=
 =?utf-8?B?dEk1bWJ5TlRqM0RITjZQSXM3Z1RsNFhNYzNyclBuejhydzJPdXRFTUJQdURR?=
 =?utf-8?B?d2JlckVuZU9jTTdMcFJER2VkbGdTeUxEV3I1OW5tMnVUMk1iR0t1VmMvTTQr?=
 =?utf-8?B?T2xxZzFOUXc4RzJhcTdVYS9PRGhDbGU2RjlLMHZEaUZnQnVqVTF4Mk92UTBq?=
 =?utf-8?B?V0F6d0t3WW5tMHBnMkdNQ1duMXk0WU9WQUhUdmJNYUNJQi9TVlNPbHNCL05r?=
 =?utf-8?B?R0dMa2IxNWlzZzEwUmE0ZHF0SE4xL0ZDNExEdFpWYTNSSk9YTVh6NHhUcFhC?=
 =?utf-8?B?SXErcWZ3aDAxWjE2Q0tQSDVSRU5YWGJ1ckxvRkhUb0EwdktDcG1oUGxJWkdo?=
 =?utf-8?B?K3Y3Uk5QVEhDRzA2QlByU0FpUTFFY2NKY1lCdlUveVU4Q2JsaWxxVHdwbEdZ?=
 =?utf-8?B?SnhuSDk5c1dxWjhLRkVyVVJ6UU5hUWpRZk5ad1FTY3NGWmJHTG5OcEdsWDZG?=
 =?utf-8?B?TEFJMlozMEp5dFk2UWZ3Z3N4YVZMY3hxNlJaRVlFaURGdFlSVWNwcE5HRlY1?=
 =?utf-8?B?QWp0QmkwYUU3b2QvVWdwWWpPcmgvQ0xmM2E5V3ZzaGdKL2V6bHNVcnFGTU9I?=
 =?utf-8?B?dXdXQW9DTFArZmdEYWcwdzBLVzByTDJXdk9CV0JOVTU5TlNSNWs2UnQrWUI5?=
 =?utf-8?B?aFZvL3MyWitxNmdzaXduUFk4OUliQWdCZW9WTEQ3Z1QyYjdBVmFRRkR1eGpv?=
 =?utf-8?B?MDVQRVptYU8rVmlZb0V4WHczNVlod3ExVFZoeVhwb1FYRXpxQ0RaaE5WbkNQ?=
 =?utf-8?B?QnR4MlAyTi81NWhuek82WDFFeWw4REx1Z1QxUGM1Zk9sRHkyVTAyWHdFcG1Z?=
 =?utf-8?B?MnFLUkhqczZPRWREVWNWWElWN2xKU2hvTHZnMC83T0JlK2d0Z2hJdExpS1BT?=
 =?utf-8?B?Q3pMRmE4NFRvTUJQYXRjVnJtS0VBOFdja21wK1RQT0EyRmVWcTlyaHdoU0ZJ?=
 =?utf-8?B?Z2NxQ1ZlYklXK3V2Q1M5NzVaaEV4TEZvaS9kOWtHM21tRlhBM1B1bTdLZndK?=
 =?utf-8?B?OGJGT3FUZ2dpWVVnckszUlN3b25VcFM1UmdmZ1hJZERRb0o0Z21hd3FYTHFt?=
 =?utf-8?B?SVRPZGo0Kys4WERkb3pINGhzUk9CR0hQdFd2b2sra3Z0T3hISTJUSU4yeEc1?=
 =?utf-8?B?Mzl5bUNOdXhEQ01nQjJQOTBlQThKSGRvVmczamtEZGZyL3AwR1FaVGRSLzNj?=
 =?utf-8?B?YWRUVkswTkQyOGlRdWhpaFdqbUhlYnBlTFJkMjliVGY5c2dNUUUvaEh0N3RY?=
 =?utf-8?B?azc2UGhXYVpJUHNkbGF6ME5tL3E1MWtMdktHMThFOVJscE5TNXByZktZRm1i?=
 =?utf-8?B?Y2V4U00wQS9RaW5ZdDlSalZORFE0SVBVaW45ODlpMlRBVGJjdk80eE9WdXNy?=
 =?utf-8?B?VmovSmZpZmF2NU1iZHB6UmhSUDFka2VsSEdLTjZ2K1ZKNUw2T1p5NC9VWkQy?=
 =?utf-8?B?aE5Yb1hyUzhHaENZdG5tMkQvYnRHSTZINFZuYVNnWVhEdzJ1NkZjRFRGUGtJ?=
 =?utf-8?B?QkRuVG1zeFJLMTN6b3VHU3A0eTVZdGNTTVQ5bnZBcGxJRXFlYldGMGxJRzhp?=
 =?utf-8?B?SG4wZ1hnNzVPVVlxZi8yNXRaYkgzTTMvWGxDdEZzeXJ0VEF5UmJ3MXh5NWNr?=
 =?utf-8?B?MU1wazIxZ3p5NGpkUFpXbDdBR0Z3bHc3K3JDSTNEa1BkRmFyaTNUT1RscWJ2?=
 =?utf-8?B?enhxalo5dXdmaHBIVVI4RkEwZGNHTDZIVGtjajRHMVBXSmExVW1UWC9FZ1NZ?=
 =?utf-8?B?WWtWenpZTndyT1g3c1pENXZQTU4zRlVuZmZxeUVMOTBXdjdWV2FabHZqV1Q1?=
 =?utf-8?Q?BEg84mQy06c9um8UCGI8Dkm3E?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: 
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 184fc621-ffe0-41f8-adef-08dc7a3a208b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 08:35:25.2351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 GehnmGjAgXMxSLtBbodTBoItGDets6hTFKor0GeyiAKDQzQFUkMWXvFGus1l3nzBU17KEXNs7s1s65TPofC5haYGtsQm9CAxgmBar07dRyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1049
X-MailFrom: xingyu.wu@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FO7LNZHLT5LG3KQWY7GNPP46TQXHY65S
X-Message-ID-Hash: FO7LNZHLT5LG3KQWY7GNPP46TQXHY65S
X-Mailman-Approved-At: Fri, 24 May 2024 12:17:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T6MBXSRN4RYIU7SIMRWH3PW2BHEGT3ON/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiANCj4gT24gMjMvMDQvMjAyNCAxMDozNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4g
Pg0KPiA+IE9uIDIzLzA0LzIwMjQgMTA6MzQsIFhpbmd5dSBXdSB3cm90ZToNCj4gPiA+IEFkZCBi
aW5kaW5ncyBhYm91dCB0aGUgUERNIGNvbnRyb2xsZXIgZm9yIHRoZSBTdGFyRml2ZSBKSDgxMDAg
U29DLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFhpbmd5dSBXdSA8eGluZ3l1Lnd1QHN0
YXJmaXZldGVjaC5jb20+DQo+ID4NCj4gPiBJZiB0aGVyZSBpcyBnb2luZyB0byBiZSByZXNlbmQv
bmV3IHZlcnNpb24sIHRocmVlIG5pdHMuIEFueXdheToNCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+ID4N
Cj4gDQo+IEkgd2lsbCBmaXggaXQgaW4gbmV4dCB2ZXJzaW9uLiBUaGFua3MuDQo+IA0KPiA+IC4u
Lg0KPiA+DQo+ID4gPiArDQo+ID4gPiArdGl0bGU6IFN0YXJGaXZlIEpIODEwMCBQRE0gY29udHJv
bGxlcg0KPiA+ID4gKw0KPiA+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4NCj4gPiBEbyBub3QgbmVl
ZCAnfCcgdW5sZXNzIHlvdSBuZWVkIHRvIHByZXNlcnZlIGZvcm1hdHRpbmcuDQo+IA0KPiBXaWxs
IGRyb3AuDQo+IA0KPiA+DQo+ID4gPiArICBUaGUgUHVsc2UgRGVuc2l0eSBNb2R1bGF0aW9uIChQ
RE0pIGNvbnRyb2xsZXIgaXMgYSBkaWdpdGFsIFBETQ0KPiA+ID4gKyBvdXQgbWljcm9waG9uZSBp
bnRlcmZhY2UgY29udHJvbGxlciBhbmQgZGVjb2RlciB0aGF0IHN1cHBvcnRzIGJvdGgNCj4gPiA+
ICsgdXAgdG8NCj4gPiA+ICsgNCAgY2hhbm5lbHMsIGFuZCBhbiBJbnRlci1JQyBTb3VuZCAoSTJT
KSB0cmFuc21pdHRlciB0aGF0IG91dHB1dHMNCj4gPiA+ICsgc3RhbmRhcmQgIHN0ZXJlbyBhdWRp
byBkYXRhIHRvIGFub3RoZXIgZGV2aWNlLiBUaGUgSTJTIHRyYW5zbWl0dGVyDQo+ID4gPiArIGNh
biBiZSAgY29uZmlndXJlZCB0byBvcGVyYXRlIGVpdGhlciBhIG1hc3RlciBvciBhIHNsYXZlIChk
ZWZhdWx0DQo+ID4gPiArIG1vZGUpLiBUaGUgUERNICBjb250cm9sbGVyIGluY2x1ZGVzIHR3byBQ
RE0gYmxvY2tzLCBlYWNoIFBETSBibG9jaw0KPiA+ID4gKyBjYW4gZHJpdmUgb25lICBiaXRzdHJl
YW0gc2FtcGxpbmcgY2xvY2sgYW5kIHR3byBiaXRzdHJlYW0gY29taW5nDQo+ID4gPiArIGRhdGEg
KG1vbm8vc3RlcmVvKSAgd2l0aCBzYW1wbGluZyBjbG9jayByaXNpbmcgYW5kIGZhbGxpbmcgZWRn
ZS4NCj4gPiA+ICsNCj4gPiA+ICttYWludGFpbmVyczoNCj4gPiA+ICsgIC0gWGluZ3l1IFd1IDx4
aW5neXUud3VAc3RhcmZpdmV0ZWNoLmNvbT4NCj4gPiA+ICsgIC0gV2Fsa2VyIENoZW4gPHdhbGtl
ci5jaGVuQHN0YXJmaXZldGVjaC5jb20+DQo+ID4gPiArDQo+ID4gPiArYWxsT2Y6DQo+ID4gPiAr
ICAtICRyZWY6IGRhaS1jb21tb24ueWFtbCMNCj4gPiA+ICsNCj4gPiA+ICtwcm9wZXJ0aWVzOg0K
PiA+ID4gKyAgY29tcGF0aWJsZToNCj4gPiA+ICsgICAgY29uc3Q6IHN0YXJmaXZlLGpoODEwMC1w
ZG0NCj4gPiA+ICsNCj4gPiA+ICsgIHJlZzoNCj4gPiA+ICsgICAgbWF4SXRlbXM6IDENCj4gPiA+
ICsNCj4gPiA+ICsgIGNsb2NrczoNCj4gPiA+ICsgICAgaXRlbXM6DQo+ID4gPiArICAgICAgLSBk
ZXNjcmlwdGlvbjogRE1JQyBvdXRwdXQgY2xvY2sNCj4gPiA+ICsgICAgICAtIGRlc2NyaXB0aW9u
OiBNYWluIElDRyBjbG9jaw0KPiA+ID4gKw0KPiA+ID4gKyAgY2xvY2stbmFtZXM6DQo+ID4gPiAr
ICAgIGl0ZW1zOg0KPiA+ID4gKyAgICAgIC0gY29uc3Q6IGRtaWMNCj4gPiA+ICsgICAgICAtIGNv
bnN0OiBpY2cNCj4gPiA+ICsNCj4gPiA+ICsgIHJlc2V0czoNCj4gPiA+ICsgICAgbWF4SXRlbXM6
IDENCj4gPiA+ICsNCj4gPiA+ICsgICIjc291bmQtZGFpLWNlbGxzIjoNCj4gPiA+ICsgICAgY29u
c3Q6IDANCj4gPiA+ICsNCj4gPiA+ICsgIHN0YXJmaXZlLHN5c2NvbjoNCj4gPiA+ICsgICAgJHJl
ZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheQ0KPiA+ID4g
KyAgICBpdGVtczoNCj4gPiA+ICsgICAgICAtIGl0ZW1zOg0KPiA+ID4gKyAgICAgICAgICAtIGRl
c2NyaXB0aW9uOiBwaGFuZGxlIHRvIFN5c3RlbSBSZWdpc3RlciBDb250cm9sbGVyIHN5c19zeXNj
b25fbmUNCj4gbm9kZS4NCj4gPiA+ICsgICAgICAgICAgLSBkZXNjcmlwdGlvbjogUERNIHNvdXJj
ZSBlbmFibGVkIGNvbnRyb2wgb2Zmc2V0IG9mDQo+ID4gPiArIFNZU19TWVNDT05fTkUNCj4gPiBy
ZWdpc3Rlci4NCj4gPiA+ICsgICAgICAgICAgLSBkZXNjcmlwdGlvbjogUERNIHNvdXJjZSBlbmFi
bGVkIGNvbnRyb2wgbWFzaw0KPiA+ID4gKyAgICBkZXNjcmlwdGlvbjoNCj4gPiA+ICsgICAgICBU
aGUgcGhhbmRsZSB0byBTeXN0ZW0gUmVnaXN0ZXIgQ29udHJvbGxlciBzeXNjb24gbm9kZSBhbmQg
dGhlDQo+ID4gPiArIFBETQ0KPiA+IHNvdXJjZQ0KPiA+ID4gKyAgICAgIGZyb20gSTJTIGVuYWJs
ZWQgY29udHJvbCBvZmZzZXQgYW5kIG1hc2sgb2YgU1lTX1NZU0NPTl9ORSByZWdpc3Rlci4NCj4g
Pg0KPiA+IFRoaXMgZGVzY3JpcHRpb24gZHVwbGljYXRlcyBpdGVtcy4gRHJvcCByZWR1bmRhbnQg
cGFydHMgKHRoZXJlIGlzDQo+ID4gcmVhbGx5IG5ldmVyIGEgbmVlZCB0byBzYXkgcGhhbmRsZSBp
cyBhIHBoYW5kbGUgYmVjYXVzZSBpdCBjYW5ub3QgYmUNCj4gPiBhbnl0aGluZyBlbHNlKS4gSW5z
dGVhZCBzYXkgd2hhdCBpcyBpdCB1c2VkIGZvci4NCj4gDQo+IFdpbGwgZml4Lg0KPiANCj4gPg0K
PiA+DQo+ID4gPiArDQo+ID4gPiArcmVxdWlyZWQ6DQo+ID4gPiArICAtIGNvbXBhdGlibGUNCj4g
PiA+ICsgIC0gcmVnDQo+ID4gPiArICAtIGNsb2Nrcw0KPiA+ID4gKyAgLSBjbG9jay1uYW1lcw0K
PiA+ID4gKyAgLSByZXNldHMNCj4gPiA+ICsgIC0gJyNzb3VuZC1kYWktY2VsbHMnDQo+ID4NCj4g
PiBVc2UgY29uc2lzdGVudCBxdW90ZXMsIGVpdGhlciAnIG9yICINCj4gPg0KPiANCj4gV2lsbCBm
aXguDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IFhpbmd5dSBXdQ0KDQpTb3JyeSwgaXQgd2FzIHJl
c2VudC4gRm9yZ2V0IHRoYXQuDQoNClRoYW5rcywNClhpbmd5dSBXdQ0K
