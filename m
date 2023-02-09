Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 416CF690231
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 09:33:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 538C882B;
	Thu,  9 Feb 2023 09:32:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 538C882B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675931626;
	bh=74gUjR/nuLjyjIznz5bcsx21sEv33xKTkJ5/xR2kYZA=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KY2V/S4gAhgOhVWotupbJLPqh/oWA2NqPCE/AOnoHsnbPI8g+ILcDREeFBA6FaI6C
	 en7T5HKyZ7p19HSy03Mlkdg9S4NIAtGtKQ2xhRYRSoNh5sNXLcfNpBeoPR+bJFICpp
	 iLJKBa9drknLUWa+L8BrQAc8ngDHK582kpbegVRI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47067F800B8;
	Thu,  9 Feb 2023 09:32:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC9C9F800E4; Thu,  9 Feb 2023 09:32:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20629.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF0E8F80086
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 09:32:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF0E8F80086
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxtGZTIGnxuKiwbTafq+/LjNmvxDo4TDVUocXupEE6yIwjPPEvxOhiJWzFFCuSqk9IMGBowf8UyqxeSxLfHcnIgAuekOAjzMPVBxlEs4Wv+hTuhXa3OIun+kChYXutfz36CmWsV2z1woy5WNaIBoLJMZ/vS0wNblAx9w3zyWs7JG1cu8RNcL2fpmmZM/j979NKa///2SxGC7weB7HFPyqiw6Qbig9Fpcis3jEXa+zYK+vBXfmHPBQrL87JCnEZH2EJB+Qfm6omQ5f8cbMHuoGdIjx7Nylhs8UQMR/XhsaInZz33BroxKyLAdnMRmtpKjRzoEll2feUL+WsEQmoGzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74gUjR/nuLjyjIznz5bcsx21sEv33xKTkJ5/xR2kYZA=;
 b=VKHGUajnUZz8edLkQYqCKtatSy6P+qEH4yWF7KdYa6S2ICotM02Yl3ZXTwoVhd2aKz8fOlOWz6kxxqP73w00C2zYC9hIZwy5Cbw5UBcCdokDSweEIrxKVuSk2GR1rUhNt+MVnGPRGkm49pgQi0PosrEcdeWsoejKX8+DJyfyawitXvYKFL8GW5ncY2xp/N/8okOh/qucq1Flj8ldmJKK09hONb1SbbzvFLdYu4oYXuCmeY5e+I3baOpb8eY3ToAALpdF1v7UuFP3Xcco29BSZCvHYXj4EhQYXIDnM7Jdi/pWH0C6Uo5vMAClHEn0JBmoTv46KLaEvDQElO3Fi2Rc3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PU4P216MB1256.KORP216.PROD.OUTLOOK.COM (2603:1096:301:a8::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17; Thu, 9 Feb 2023 08:32:29 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::2007:efb4:28b0:758a]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::2007:efb4:28b0:758a%9]) with mapi id 15.20.6086.018; Thu, 9 Feb 2023
 08:32:29 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Mark Brown <broonie@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v2 3/4] ASoC: SMA1303: Modify the sysclk setting
Thread-Topic: [PATCH v2 3/4] ASoC: SMA1303: Modify the sysclk setting
Thread-Index: AQHZO583df/KcDwP50OFMCFQq06/y67Eyj4AgAGAm5A=
Date: Thu, 9 Feb 2023 08:32:29 +0000
Message-ID: 
 <SLXP216MB007773BB7D81F9818D5EECE78CD99@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20230208092420.5037-5-kiseok.jo@irondevice.com>
 <20230208092420.5037-7-kiseok.jo@irondevice.com>
 <c24f9a02-a9b6-2cca-cc50-fff2364d8e52@linaro.org>
In-Reply-To: <c24f9a02-a9b6-2cca-cc50-fff2364d8e52@linaro.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|PU4P216MB1256:EE_
x-ms-office365-filtering-correlation-id: 48f11398-6ea3-4567-f4b9-08db0a782e75
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SZ1wAa7G+r2rcocEemr2tyv7eCeERdTTgRlozuraRhtT8iWge4KsHi3gGAzmq8+R/pI2x3CGt7bG2TPBgKx67pN34jHdNMW2vLZh6cswqnoDx1DvuZ740aEz6//shwTJsqK6qFhRv5C1ePasGKD/6RlJIn/B3eDkWgEdx4G95WX5u8wmp65eiJCVR45DMF2jdFnOkHgrmcqFvZTvF+v4x+IN8I0mSsxObjhqsVhslrM4JRbBrGQxtjw55ngsLYnK5OIQx1GFNHa9to/CQFPdPTJc1wpKu1veu4xQi/KJZizw4uv/a2xGBZ3TWSDWJqF2XOu2bDSjTnpJCvkUFrj3Yopx8vG3Vt2mhHG4a/mkctHtftUDXbebFerka1VHbz7P3jDqGbbEdWqynPXyUxlD/TKwzTaTIISFSK2Rv6PIiMH9nLr/bAtU5lNz0M6K6mwFRqDReFNqwMvf5jOmaMWmESzwfCpH5kADnRs60ZrStguRgH8S17oioUyYdq4EnMqmcRKuo06VetN1LoPLmG3O7T7esXzA/07Ho/+Hg0uxsPBCsl3m3ShEwY6KJdsuhob++CyOyCATCkLWN6TiIDg2UURfWo3QO+Biy6COPtXirP49rImmE0rS7MpHhiCyDgOE2N6aWhIgTYTOHOCsy7AAf9fqj8RsDNgcwr+IQpYek5dHx88TM+XCRwOl9VfdZsJtuDQeGEJ4EXaV6FlJ/zT8Cg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(366004)(39840400004)(376002)(396003)(136003)(346002)(451199018)(52536014)(55016003)(7696005)(5660300002)(8936002)(66476007)(66446008)(66556008)(64756008)(66946007)(76116006)(8676002)(4326008)(38100700002)(478600001)(41300700001)(86362001)(54906003)(110136005)(2906002)(122000001)(316002)(83380400001)(4744005)(38070700005)(9686003)(26005)(33656002)(186003)(6506007)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aWpqdmJITE5nNFl2MkcvOWk0WWtQWmJaSzFacjZJYUczNGhVMjBHd29rZXVn?=
 =?utf-8?B?WTJEbmVQQkh6SlZnUGo3WWIvalZMYlQ0QXhpL2JnMWQrVTZKbnJobmpnMGdL?=
 =?utf-8?B?eGJ0akRDV0NhdEltRUFaQ1pZNFp2QjQrTzg5Mis4Ly93T2pGdFNZMXkxcVpD?=
 =?utf-8?B?T3dSdjAxU29Bby9FVkVnNDg0RnY3em9vRE9HYjhleTRIRE9DSUZJVTRDM01U?=
 =?utf-8?B?ekI4R1lWWmZlSWR5SDROcnRjZUJBcDBLSjhKU3Y1MU9tTEw5Tm03cG82QXlF?=
 =?utf-8?B?alNJVWNGWHV2Z2szd0dheGkxMUIxMi9BM3Q2L0NZaTY3bzc5MHNzaW9CcHU4?=
 =?utf-8?B?dldJellVZjVDTnI5bjFxQWdMaXpZcnA1d3NLZEpta2JGSmhURlJZdnVEamZN?=
 =?utf-8?B?MHBvZDdLT3dOYkRWK3FJQmN2Y011MzdpR3kydDZIc29oVWNjOTU4eGdobHgx?=
 =?utf-8?B?Z0M1VVFtNk9OeExrcG9ES0pvMGlvNERpKzhwRkJ2UjZ0MVhMRnI4S2l0dEZM?=
 =?utf-8?B?L3BtZnNEZndRU1VkcUpuQ2pTd0lxT0pWL0IwdDdCRmJVQjhlZElvSUlORWlU?=
 =?utf-8?B?bVlPT2sxbk9Ianc2UjByaFFlM3dvcEtEUkVteXhETmhtcE8rYmhRSUp3U0xT?=
 =?utf-8?B?azhOb1c0TzkrVFNPeld2aEV6aXd0OHdrbXJFb0IxdjA3V2RkTFVZbXBiSm9u?=
 =?utf-8?B?WkRFR2RTUjl4aUlDL0libkZ6SlRuaWQ4anRHdjB2d1p3OTc2bEUzTUJtaTVr?=
 =?utf-8?B?aEY5aFIvOCttejIzaEdYRFpybHNHYlZqTE8vbGVQVGRqRGxIY1p6UnIwN3pL?=
 =?utf-8?B?eDhHc1MzTUxnUno3TmFiN3FaRS9PMEo0WmtOUHg0K3RROVBjQzZyOE4yUWw3?=
 =?utf-8?B?SjkwR1I4L1U5MmdjY2k1dHpNZmJuTWxycDNsRThZVGNGQ0t3VFhPSHlBTkVZ?=
 =?utf-8?B?WXBUN0FNVk9zeDlkRU1QTzBWOUYvVUc1dE9jbVN5SmFxNFBIMVd1WVhNZXNm?=
 =?utf-8?B?anhDcElNSVpqazdvYU0rOThrSFBWN1pFbnRFdnczVW1kZDZXS1pqWm9VWDVa?=
 =?utf-8?B?ZWxScDM3bThaeGdtOHVhMFhOSGVnZXlpRFN3SUNuYy8wVmdtZytKSStMVTRM?=
 =?utf-8?B?OXo1MExGNk5wbXhFV2FrWDJzS1FyRE50YStVWEk3UC9TelI2TnhhMVYxd2Q2?=
 =?utf-8?B?dkpxUWlEK0ZCbWgyczBYWHEwSjRwbVVFY2JFODc5d21FVlk1T252UzM4eHhM?=
 =?utf-8?B?aXM2TlFZeFNLUldURkVxQnpCL01iYkJES3I5TjNxcWd6cytjb2U5Y0FnNVpM?=
 =?utf-8?B?RjBnMnIyekxTRTJEVHJwTUYydDAxYzgrV0pOL1RPSmswZnBRalBCMW0wME9r?=
 =?utf-8?B?c1pRazc3MGxkYnJSUGluc2hnVGEyV2YrU0R3aTJyL2g3Zmx0UzliU1NDRkFB?=
 =?utf-8?B?YVF4MkNWZlMxS2Z2WXk3bmg4dkUvRC9paEptUXEvYmRyWjZIK1BhNFdPZUlT?=
 =?utf-8?B?dUN3TTFEWHRySnpLeFgxbU5YSC9zZDdPR2hnZFVBcldiaHB4bWhyL0U5T0hK?=
 =?utf-8?B?SG9WOXhUZXVCSVlFUlhKRWhUN0NicjVxQUlwK0hEMjJTWjdxVVlQT2k1U05I?=
 =?utf-8?B?ZEJzYnlIYTVwNkMwdjMwRENXSmVhcThhY3U0YkYxYXAwWnFmbklJOTF5Rkt2?=
 =?utf-8?B?MHhDYmJWaUJDVjdsNllwcFhBK3daSFYvQ1Y4Sm1ja3BXVlh0WWQ0ZkJ0N08w?=
 =?utf-8?B?VG14OXFLNE5PMnp1S0tFVzd1UFFEd2E2WXpXclk2TlNiT1IrN3JFMFB1MFZP?=
 =?utf-8?B?OFZaMTRjRXJITkxIc0lZdkV2TVVXRWk4ejJyS2JHQ0dodGVIRjQ2NVlEVW9O?=
 =?utf-8?B?VkpTNXM3Mm9NMHFjRWlqWERQOWVpV01HMFY3YU83bTU2VHBZeWkyZWE3QlVt?=
 =?utf-8?B?MS9DRXd1V1doMW41cUlTNEZSbVJqVEFtSmI2Q3pFMDVaaHVjZlRzTVBEOE1I?=
 =?utf-8?B?Uy9tSEljQWNrWDJRMjFocmNKK09HZ0VvaWswd3hKTTl2VFAxRlg0bWV6YU85?=
 =?utf-8?B?ellORVFRSUF4UVdPSzllamYrNXNhM3dpUU05UTVvdE1nWEJWemdjano5cUxa?=
 =?utf-8?Q?iH8MDYPA0YdM6KM7GnK7KX4l8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 48f11398-6ea3-4567-f4b9-08db0a782e75
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2023 08:32:29.4424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 eY2igZENo9QJaToXWMRU91gA5G0kTyT9KRyd1K6O2wsmnIxYoDr7yJQ8XJrBs8Jv/XU6H3pi/ncdJypP4Iw0R7uKCPPq+0AV8wGnx5yVUjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1256
Message-ID-Hash: HAJPVQAFGEVTJPJARUUBXRDBB3MM4QM4
X-Message-ID-Hash: HAJPVQAFGEVTJPJARUUBXRDBB3MM4QM4
X-MailFrom: kiseok.jo@irondevice.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BATCYDGU5L3CCSRXBPWAZ2WED5JVWJ45/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiA+ICsJc21hMTMwMy0+bWNsayA9IGRldm1fY2xrX2dldChzbWExMzAzLT5kZXYsICJtY2xrIik7
DQo+IA0KPiBPbmUgdW5kb2N1bWVudGVkIHByb3BlcnR5IGlzIHJlcGxhY2VkIHdpdGggYW5vdGhl
ciB1bmRvY3VtZW50ZWQgcHJvcGVydHkuDQo+IENhbid0IHlvdSB0ZXN0IHlvdXIgRFRTPw0KPiAN
Cj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KSSBtaXN1bmRlcnN0b29kIHRoZSBjbGtf
Z2V0IGZ1bmN0aW9uLiBJdCdzIG15IGZhdWx0LiBTb3JyeSA6KA0KSSBkaWRuJ3Qga25vdyB0aGF0
IGNsayBpZCBpcyB3aGF0IEkgbmVlZCB0byBzcGVjaWZ5IGluIGRldmljZXRyZWUuDQoNCkZvciBT
TUExMzAzIGRldmljZSwgb25seSBiY2xrIGlzIHBvc3NpYmxlLCBub3QgdXNpbmcgTUNMSy4NClNv
LCBpZiB0aGVyZSBpcyBhbiBpZCBjYWxsZWQgbWNsaywgb25seSB0aGUgbG9nIHRoYXQgc2F5cyB0
aGF0IGl0IGlzIG5vdA0Kc3VwcG9ydGVkIGlzIGxlZnQuDQoNClNpbmNlIE1DTEsgaXMgdW51c2Fi
bGUsIGl0IHNlZW1zIGFwcHJvcHJpYXRlIHRvIGRlbGV0ZSB0aGUgY29udGVudHMuDQpJIHJld3Jp
dGUgdGhhdCBwYXRjaC4NCg0KQW5kIHRoZW4sIEknbGwgY2hlY2sgdGhlIGNsa19nZXQgZnVuY3Rp
b24gZnVydGhlciBhbmQgYWRkIGl0IGlmIG5lY2Vzc2FyeS4NCg0KVGhhbmtzIQ0KDQpCZXN0IHJl
Z2FyZHMsDQpLaXNlb2sgSm8NCg==
