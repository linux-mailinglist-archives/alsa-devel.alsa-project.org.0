Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3196902C1
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 10:02:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDE77851;
	Thu,  9 Feb 2023 10:02:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDE77851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675933376;
	bh=r0y4nWQp64X5F0CraHo7KwimDlSGorpc5y0SIV4HKUw=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HjAr9Y8+uKBqM8zD0kFTQmTfLYcXZz42X/11m3ommjzMNU3QLwyznVoxU6c8N4Wmu
	 vY+vzv05+Qh7uZcM+AGR0sUsSL3vblN7rmJuum0DdgGNhMYkowmgT181oLy45TS7b1
	 mm+ZPQeAXHynmVDJz+Lj6gNDTWQ79pCimM1iiUEc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C9D8F800B8;
	Thu,  9 Feb 2023 10:02:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F675F800E4; Thu,  9 Feb 2023 10:02:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88584F80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 10:01:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88584F80094
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaPnRVN6C3HFhlKGv8HuC6bWkqEGZlyPKZuGLQbid8B3/g4QxxN2K8DaqqPov5yUF+UM2FyZ2JnnlrtT5qWBuP2o+/Pf2MAvSy6GSpeqJ0opMuj8Q5FA5Yp5k4pTkXw3xkd7JNRwmIw7t2ypD7c/kGcLDK96kMLlI81j2e+2qj1bwOdZscn4GYEdaN/N+RqZcX6ugie/OkVFuDObsOgu4T0ZPll/nNix67m+vi9PpMYR7hvkhZAUZGduhKUiObTo7cr52Vb7Q6a8fy2JbsFrXHdXGKLKbt7aBmvx/mrWOahuoG0bf8Ql7rgW0Jvb1dWuILqI0GBEVUaWWNIFT0aeGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0y4nWQp64X5F0CraHo7KwimDlSGorpc5y0SIV4HKUw=;
 b=iT9l4O9+bjFM1oKRezF14TdNZnXznC6SWAvqe+7m2OTTDq/ZEHv1QEws6RhGvSuuTwLnbu6On9dvCWwZALogGTifDJNONGUzGCppP77UCaEyyJi+BvsPfPD75m1oe/L/M9lUObZDWpHK7TMXEYQEk99hiTMQVKTLjmE0GQ0C8Bmt2XAMddcQtnyiYzYYAeW5MpuuZaYPVUTE0kNK75Ulc2Rdyi+XICnLXb1JwUmkkcVwvxfJXjAGOa8xWtkkF3M7eqeBHT+Jz2tNFyIHiFYaSCIGHQ8ICKPW3LyI4cIi94Yb4O8gVCFUJIQFGSSoTdA4LQDQ3dHBHJ0/xyCClmFjiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 SL2P216MB0284.KORP216.PROD.OUTLOOK.COM (2603:1096:100:24::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.18; Thu, 9 Feb 2023 09:01:46 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::2007:efb4:28b0:758a]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::2007:efb4:28b0:758a%9]) with mapi id 15.20.6086.018; Thu, 9 Feb 2023
 09:01:46 +0000
From: Ki-Seok Jo <kiseok.jo@irondevice.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v3] ASoC: SMA1303: Remove the sysclk setting in devicetree
Thread-Topic: [PATCH v3] ASoC: SMA1303: Remove the sysclk setting in
 devicetree
Thread-Index: AQHZPGNzHE3k8owPakG50LXf9xOb+67GT4GAgAAB/jA=
Date: Thu, 9 Feb 2023 09:01:46 +0000
Message-ID: 
 <SLXP216MB00777BF2377ECE2366F694228CD99@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
References: <20230209084903.13000-2-kiseok.jo@irondevice.com>
 <da3e7391-ee89-3089-8501-91e9411161a7@linaro.org>
In-Reply-To: <da3e7391-ee89-3089-8501-91e9411161a7@linaro.org>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB0077:EE_|SL2P216MB0284:EE_
x-ms-office365-filtering-correlation-id: 77825724-c8e1-4776-e5ef-08db0a7c45c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ExucChc9R53N4LdvkdYHpM6keci9qRWpHi+0hpsQnhazm2fvcrY96i9aJvFOkgMe6pdw7/JE4JkaaxvofWCsJLb73Mwp1/fDeJZUFvGch6/LKUiWkrvD74xmghcWo91Gu2HKtp58Q8yEnVsw46LbfuxRQp5mQon/cYvUZ0liSzghUYc0MLwvM3SKUKBj17XsC/SuQtRznMHdASr7fYoBg6IofI7VJKFf/poheyYDm/pUoGHddhTsnANnGr7yAuP867Ll1U5xpaVhA3BErgw2sS8Z54h7NFvQc7ixzk2bmcNKyto3pe2HTwsBBPKK8drkRsuAZtJSda8MIEo8BI/5jNqUEhau41BaE7NkNFfws1ytNG4ekj8xw4fi0QyZlJ5ZJLVo01wU/WEZPhhIsr0dXJS88ns/fZRPuSEl1ZE2ERPcEO124y+GX+Iaa74HsEbbIBdrtTuL8Jqt2nOLi9YdKOhqQ56WQUPWkRqTcxEtd08cE1M80RbshzG265wCtLUIECam+eDGyuMUl0uhK7ZXUekMHMxsek+s6dpGk6Py82LDmrlycD5Q3KrlgtHkG6rXIQIePhnlo59qMK3HY4arAIkc/xn4HObEBhmsaQCY4nuy84FcKdKzpc6pvypJp48tVtdFYhA9J74Tl2RoaPX3G4Y1wawNYdrZFykz0XpO/AvPV9t79lt691jxrb0lhJDnLRlA6s/2DPj+YRmo4+kq6w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(136003)(39840400004)(396003)(366004)(346002)(376002)(451199018)(66556008)(8676002)(64756008)(66446008)(66476007)(76116006)(54906003)(316002)(52536014)(5660300002)(8936002)(4326008)(110136005)(41300700001)(478600001)(186003)(66946007)(26005)(9686003)(6506007)(7696005)(33656002)(71200400001)(38070700005)(55016003)(86362001)(2906002)(4744005)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OFZTSG0rVUIyMGNCd0NjZVB4TGZ3S1RTWnpDWFB0Y0dEcGpWSzVZZ01tUjlJ?=
 =?utf-8?B?NHYyQmRNOU1xTU9BemU1M0tYMWpaTTdQNHpaakZDVHk0UG9vWWFWVE5vQW5L?=
 =?utf-8?B?ZERkV3h3WnptelljaWxPcFpGVDRDOGRmdnZucXVxcW03T0VON1k1b2hxZGQz?=
 =?utf-8?B?L0MwZ2F2dlVGRkFnUmgzZHV4amMxRVQ0Q1JsbTJZWTBRUmxPaUo1VFpLa1lF?=
 =?utf-8?B?MytJRCtJQ1N3ckRCTFVHWE9ReTROOU5vdVpPVW5ua1E4bWoxTWFEcVhURCtr?=
 =?utf-8?B?NEFOUGM2UmJ2aDl3dEQ4SUJJb09zWEdUK3ZFb2lXQXB3VWFBanpvRm9IMHFo?=
 =?utf-8?B?WTdsYVJ2d3M0bVJtM1hRWnFNS2RVNEYrMGhNMVVhek5WNXFBOFZBMTBpbWwr?=
 =?utf-8?B?LzZHczNtRkN3QnhGWlhWRnllVlMxeU01L0ZFT1NacGpKb2hLcGgyNEhHdjJx?=
 =?utf-8?B?OXpFTU5ud2NOZ0twRWxjZ2FnaVBwa244UWFjeTNvZTRCTEFpMEJwNGNrS3k3?=
 =?utf-8?B?R1crc3F3LzVqZk9BdXQyZWFMQjFEMnpSaFNhQlYwNEdyUjRSMzNXRmNkOFFx?=
 =?utf-8?B?VVppdzhKU3ZSbFpsRGpadjF5TmdzSEE3Y1BncmZNSXZKWEVENVl4VkxzSm9s?=
 =?utf-8?B?YVlheTFLSlFONmkrbDZEalozTmJ2cFlEWEYvTkFoUzR3UDFaRXBTR3IxTXZM?=
 =?utf-8?B?UlpzMm40d09tMUZjajUyc0ZnMng4akExMXh4bDV2MjRKYUYvRGhTVDJDOVM3?=
 =?utf-8?B?NnZmNnZ6UnJhV21acmVYUVVNMmVBNEJ5aGJvVHdTekgzYnhRbzZzckNhMnU1?=
 =?utf-8?B?Qm9EN25ybmtMdno2eWE1T0VOV0pZMU5RN0w2QzJndVVsTkdwdFRoZnJ2cHoz?=
 =?utf-8?B?VFd6Tmx2d0huRGVpeWk2MjhVTEowK1YxV1hGbFc5NTg0UC9HdWlSeGpaUllw?=
 =?utf-8?B?OGNxa1F5S3N5SXd2ZzRrOUV1ajFjeHBxbzdzU1BzZnlLTlAvY2sybWJkbU5r?=
 =?utf-8?B?YU81dGdlWGg0V1FKa0RSTjd4SytnMm9nZDhsTlFZZWw3bzM5TmVCRm9SZTJs?=
 =?utf-8?B?Y09NeEdPMStKNDdPam90YS9sWTJMNDJQd3hGZ2VjM1hpRVlSRzl0c1NyUzB1?=
 =?utf-8?B?NGZ3WEMxUDdqSnY2ai9qRjVRM3BMS3NvUmd5S2F6VGNvVnNrVExFQnRQVjR3?=
 =?utf-8?B?OElVaWVGODArSWR4NGkzb0ZJTUQxVXAvQUhlVXhxZmNwbytxaFNLYTJCVFZB?=
 =?utf-8?B?YzQwZFcyV1hEUmpwKzJ1UTV2bHh3UW0vb29zTmRvRzZhWE04Njg4Q0NPbEk5?=
 =?utf-8?B?VzZXVjB0bWVQdjcxakVyekZOWEVkeUs1dnp6Q1JrdkVhNXJ5YU1pMTZKVmE1?=
 =?utf-8?B?TWgzK3Q0TU5XaXZ6NUplK0o2b1FiKzNobGZYaHRsZWdJaldzZGpCTjl4YXdI?=
 =?utf-8?B?elNGZElnbUllSEI5YmViL1hFNzdyQi80bDdmRDR6QXJXczJya2s0YWJlZWpD?=
 =?utf-8?B?Q3R4QitoczNOQXg0Y1l5TE9zSVJlWkJGZUFYTU1XNGZad3pXVExxNXBuNFpG?=
 =?utf-8?B?VFM2RmtVWFJDVldVSzdlb2V5ajlleXlGSUlXVGZRYyt5bjlxTWlqM3ZSY0hD?=
 =?utf-8?B?YVp4WkdMMVV6ZjN3bXpHUE8vN1BSeGtxNzhBQ0tja2NyTW14V2ZGVEpGeDdu?=
 =?utf-8?B?UU5nZzFHWWhqNGFISFc4cUNzb3Fpekl6U2JaL1ZPMG5VL2RqT1FSOC93Rktw?=
 =?utf-8?B?RnBxekRRZC8wcVdyNlhFQ2l5ZXZtcVRtRzZvMThlQmpGTVg1S0x1NERGemJU?=
 =?utf-8?B?QVFzZHh1V2NYUDAyeDdXSHgrUmM0eklZRExscjM3MlN1OWJvM253MldlSVFE?=
 =?utf-8?B?MGFnTWdndTZTczIyWVBJWVJjam44dUF4aVp6Sm5EcXk5OTBucUhUZEFVWUtS?=
 =?utf-8?B?bjdYR2JJQndkcjJidW15QkpXTUdldXJqRENZVGVPSUk2cWhRYTJXbjQ5ejRB?=
 =?utf-8?B?N0FkdUwvRHJSSUV6cGJvQXRwNERQUnpOa1ZqMkxOVVltZXUvYUFYempPcFdW?=
 =?utf-8?B?WURXSFg4TjJCZ1FWN0NVTUNxSDE2SzZWbnBOaFpNZWpyMkNQKzQ1ektPakty?=
 =?utf-8?Q?sdFdHPe6DFwF2eCij7yrsmoEC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 77825724-c8e1-4776-e5ef-08db0a7c45c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2023 09:01:46.5408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 EYF/W7PSiwI05d9MbwxZ1eD+CqW66bdHH+MJ6H/uwgWb0dLAePDvoae64sF2s77VJyL/dIdFP17/BP+GoZ6OyW5zUH94+oSJxlIt4C3Hyz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB0284
Message-ID-Hash: LMXBE37ZGNY2RKL2PMCF7RGDLSFQTYXO
X-Message-ID-Hash: LMXBE37ZGNY2RKL2PMCF7RGDLSFQTYXO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C5ZDDBEVU7KAMZLT5TVXJ7XETJPHP2LR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQo+ID4gSW4gU01BMTMwMywgdGhpcyBkZXZpY2UgZG9lcyBub3Qgc3VwcG9ydCBNQ0xLLg0KPiA+
IFNvIGl0IG5lZWQgdG8gcmVtb3ZlIHN5c2NsayBzZXR0aW5nIGluIGRldmljZXRyZWUuDQo+ID4g
djI6IE1vZGlmeSB0aGUgc3lzY2xrIHNldHRpbmcgLSB1c2luZyBkZXZtX2Nsa19nZXQgZm9yIG1j
bGsuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBLaXNlb2sgSm8gPGtpc2Vvay5qb0Bpcm9uZGV2
aWNlLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9m
Lmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiANCj4gV2hlcmU/IFdoZXJlIGRpZCB5b3UgZ2V0IHRo
aXMgdGFnPw0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KSSdtIHNvcnJ5LCBJ
IGRvbuKAmXQnIGtub3cgd2hhdCB5b3UncmUgdGFsa2luZyBhYm91dC4NCldoYXQgdGFnIGFyZSB5
b3UgdGFsa2luZyBhYm91dD8NClNvcnJ5LCBjb3VsZCB5b3UgcGxlYXNlIGVsYWJvcmF0ZT8NCg0K
QmVzdCByZWdhcmRzLA0KS2lzZW9rIEpvDQo=
