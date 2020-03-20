Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D96218C81D
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 08:27:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E384C17D1;
	Fri, 20 Mar 2020 08:27:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E384C17D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584689272;
	bh=VJCJf6hGOf5Xw8yUxEeqEhjtLrfkDZKMqr9MkjFaDY8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=STywpyh0cNwY9K2cttsx7WEFpRuvheYWv2o758x7+dIsMW0tTbCjF8aTU9wgaz42a
	 kXXKhoUOBa5XH3mUGkBciaSQCUonqL9grqWhQREROLoB+nK/GV2YvnTzngmu3CzMO8
	 6Qiy/v/eCjtPohRC6YGB8Fhm86kWZdaddrINBTmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F4048F80162;
	Fri, 20 Mar 2020 08:26:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DC32F8015B; Fri, 20 Mar 2020 08:26:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150132.outbound.protection.outlook.com [40.107.15.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B916F80126
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 08:26:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B916F80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="Oo6Cg13Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dx8ycL/itStokkGyASj50iPolyYDNbvilv4V7tZsNuo79jCijEPco2oPAQiVxTbHGa2qoUmm4B2s4G06qiNVmaQSltDq2qEpE8N0LvTRzUOQaQv0UPhfW8nRk5ftYIZ/ZCFaMIBcPKWlOG/PXCbbXIPmsFh3VmfakBELcG88UJRfJJ8aXUcS6L86Ucqhi/IFc8y6WzCpz70/kV/ixLzpxfaS0x912uc66ISD1TkpwqOUTzikzp49oXJ5Yi9y1loWvi8LaCfV1EY/Do0PWT0iSVOiR83ve6DHXtCpNhuNJXvhTY/kIH4LmXLxcZjlP+sg6mYG8fHyeVKOUUoIs2uDuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJCJf6hGOf5Xw8yUxEeqEhjtLrfkDZKMqr9MkjFaDY8=;
 b=HEWczF7pAhNhKb57cKXB5B/pEJ7m2hu7jHhpnZbSeTYGVH/2sYWCfAssf5762h+eP1ytgI1qcHbUMIWhUpOWlmJPbeF9OQvzFRmmIjmyi9z9EL0S0S5Afob5o0BLkC6jqk6Mkhf9dRlFYU5h2QiNnun7Kg5W1UyeedL2ub1yutveEKg7yx2hez9EWsoZezW1yGeBitzZTVedNLSdZ3SSrgcV8EdcjlknCHTB4iFQyo05g48357IghHEpTakbIDtfFxp2ACmO4sg4SPOuKAn0TwR520f1tXa7wEY3kEoi/Z/IehDc1xaokETtr0oO2oXEthXnjFZwxrLT2onavDJytA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJCJf6hGOf5Xw8yUxEeqEhjtLrfkDZKMqr9MkjFaDY8=;
 b=Oo6Cg13QF3RONIZJ3xREekbuOpcM9BqYonEvWCsfWJ8DDuFumugi9CyteyWG0XaaC8uiJ90p0Q3Q9ZrFQoJwIani80B2Z/pfaaW6gq2cF7KR8sBu8y2CTE7/jEDTx/LWsp4OAayL4BAwX5gW2w57gi0A9dE7j2kHggjoe5owxBk=
Received: from VI1PR05MB6845.eurprd05.prod.outlook.com (10.186.163.80) by
 VI1PR05MB7039.eurprd05.prod.outlook.com (20.181.33.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.14; Fri, 20 Mar 2020 07:26:00 +0000
Received: from VI1PR05MB6845.eurprd05.prod.outlook.com
 ([fe80::c13:1d07:fa02:6eeb]) by VI1PR05MB6845.eurprd05.prod.outlook.com
 ([fe80::c13:1d07:fa02:6eeb%7]) with mapi id 15.20.2835.017; Fri, 20 Mar 2020
 07:26:00 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "broonie@kernel.org" <broonie@kernel.org>, "tharvey@gateworks.com"
 <tharvey@gateworks.com>, Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: Re: [alsa-devel] [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC:
 sgtl5000: Fix of unmute outputs on probe"
Thread-Topic: [alsa-devel] [EXT] Re: [PATCH] ASoC: sgtl5000: Revert "ASoC:
 sgtl5000: Fix of unmute outputs on probe"
Thread-Index: AQHVsLyIRDFbzLs7vEuxsFkXl6DgTKe2NokAgAAA1bCAAAyIYIAABwsAgAAETYiAAB0nAICake+AgACxzgA=
Date: Fri, 20 Mar 2020 07:26:00 +0000
Message-ID: <af99c9abd9c2aec6a074fb05310c56b780725ebd.camel@toradex.com>
References: <20191212071847.45561-1-alison.wang@nxp.com>
 <CAGgjyvHHzPWjRTqxYmGCmk3qa6=kOezHywVDFomgD6UNj-zwpQ@mail.gmail.com>
 <VI1PR04MB40627CDD5F0C17D8DCDCFFE2F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <VI1PR04MB4062C67906888DA8142C17E1F4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <CAGgjyvGAjx1SV=K66AM24DxMTA_sAF2uhhDw5gXCFTGNZi8E7Q@mail.gmail.com>
 <VI1PR04MB40620DD55D5ED0FDC3E94C2BF4550@VI1PR04MB4062.eurprd04.prod.outlook.com>
 <20191212122318.GB4310@sirena.org.uk>
 <CAJ+vNU0xZOb0R2VNkq6k3efdkgQUtO_-cEdNgZ643nt_G=vevQ@mail.gmail.com>
In-Reply-To: <CAJ+vNU0xZOb0R2VNkq6k3efdkgQUtO_-cEdNgZ643nt_G=vevQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=marcel.ziswiler@toradex.com; 
x-originating-ip: [2a01:2a8:8501:4d00:ca5b:76ff:fedf:3c49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf5555a0-f05a-423f-21b2-08d7cc9ff0db
x-ms-traffictypediagnostic: VI1PR05MB7039:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR05MB7039D274F30E082628FEBE62FBF50@VI1PR05MB7039.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 03484C0ABF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(376002)(366004)(136003)(39850400004)(199004)(6506007)(6512007)(53546011)(81156014)(478600001)(2616005)(316002)(2906002)(81166006)(186003)(6486002)(110136005)(71200400001)(4326008)(8676002)(66556008)(76116006)(91956017)(66446008)(86362001)(54906003)(64756008)(6636002)(44832011)(66946007)(8936002)(66476007)(5660300002)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR05MB7039;
 H:VI1PR05MB6845.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 724z4VoXXVWEE3GFsn+gCu0PUdLn1mjqU1ShTDZVMHQtqiLmNvMIg3VU2K9RhKujPO6W0IGzZ4ovVMIh/g22CXbxyieBh8YhffDVdPLLr0AYdTaoJez4chwgMe9ygx7KuxR4sbW4Asv6iIzMm98waJO2tyXqgJDtXPGa6OitJIPAZZjhRAzaio5EbtvVVdUTcxb1Y5K77hvFkjsd4bExr79zfRK4YAUpfhpmJGJot6n640OiMoBv+eD123fZ9BZoqKOk2E6qEYMh0ETdtpCdHGSDpIM2WxMSpKcee/BWWZEHHe0Npbdwq5RvMp8a/+9zXGRFL0uSEuDSYJLmDIzOxDIdkYCDfIOltHr4ssY7RX4kDIZCCUu87Lc3pqv67ZHMDarywhS/5dBuzQTWSZSk/K6iZU04hThWIGwRHMUjBCl1Ef8bJ16ClpfcyY4YsXI1
x-ms-exchange-antispam-messagedata: rLNWmOdow88jAvwQxQ/0UmcYRImoCP1KDp5lnhfN2ksrLMz79h79BkpzyFAeT+JlExPk1vcPmGsHPCbl8GvY9OPtlJozfVQhNw43e+feR/BNaZVUGUldkktXFaFahya29oHmrA5yuErMyrOMyM+//V1le5epsxpr63YGq+dTrK7EBSLy9j9n+4oIU1MIUxTJHexSwVqRSZX0p8/3E+zmuA==
Content-Type: text/plain; charset="utf-8"
Content-ID: <877CE7CFF0A2854B8E2A79F30AA4C85F@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5555a0-f05a-423f-21b2-08d7cc9ff0db
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2020 07:26:00.7510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pUJON9UEUUthewPUPf6HI4j/hwyWJhoqKGIh2ZGE/YSa5vS0Besq6Sr+t6A72VJcsnTVtY8x6kRgmrb8t/7NVcfU5xT41Se7ZwIrAuZYjP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB7039
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "alison.wang@nxp.com" <alison.wang@nxp.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Igor Opanyuk <igor.opanyuk@toradex.com>,
 "festevam@gmail.com" <festevam@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

SGkgVGltDQoNCk9uIFRodSwgMjAyMC0wMy0xOSBhdCAxMzo0OSAtMDcwMCwgVGltIEhhcnZleSB3
cm90ZToNCj4gT24gVGh1LCBEZWMgMTIsIDIwMTkgYXQgNDoyNCBBTSBNYXJrIEJyb3duIDxicm9v
bmllQGtlcm5lbC5vcmc+DQo+IHdyb3RlOg0KPiA+IE9uIFRodSwgRGVjIDEyLCAyMDE5IGF0IDEw
OjQ2OjMxQU0gKzAwMDAsIEFsaXNvbiBXYW5nIHdyb3RlOg0KPiA+IA0KPiA+ID4gV2UgdGVzdGVk
IHRoaXMgc3RhbmRhcmQgc29sdXRpb24gdXNpbmcgZ3N0cmVhbWVyIGFuZCBzdGFuZGFyZA0KPiA+
ID4gQUxTQQ0KPiA+ID4gdG9vbHMgbGlrZSBhcGxheSwgYXJlY29yZCBhbmQgYWxsIHRoZXNlIHRv
b2xzIHVubXV0ZSBuZWVkZWQNCj4gPiA+IGJsb2Nrcw0KPiA+ID4gc3VjY2Vzc2Z1bGx5Lg0KPiA+
ID4gW0FsaXNvbiBXYW5nXSBJIGFtIHVzaW5nIGFwbGF5LiBEbyB5b3UgbWVhbiBJIG5lZWQgdG8g
YWRkIHNvbWUNCj4gPiA+IHBhcmFtZXRlcnMgZm9yIGFwbGF5IG9yIG90aGVycyB0byB1bm11dGUg
dGhlIG91dHB1dHM/DQo+ID4gDQo+ID4gVXNlIGFtaXhlci4NCj4gDQo+IE1hcmMgLyBPbGVrc2Fu
ZHIsDQo+IA0KPiBJIGNhbid0IHNlZW0gdG8gZmluZCB0aGUgb3JpZ2luYWwgcGF0Y2ggaW4gbXkg
bWFpbGJveCBmb3IgNjMxYmM4ZjoNCj4gKCdBU29DOiBzZ3RsNTAwMDogRml4IG9mIHVubXV0ZSBv
dXRwdXRzIG9uIHByb2JlJykNCg0KSSBmb3J3YXJkZWQgeW91IHRoYXQgb25lIGFnYWluLiBPSz8N
Cg0KPiBob3dldmVyIEkgZmluZCBpdA0KPiBicmVha3Mgc2d0bDUwMDAgYXVkaW8gb3V0cHV0IG9u
IHRoZSBHYXRld29ya3MgYm9hcmRzIHdoaWNoIGlzIHN0aWxsDQo+IGJyb2tlbiBvbiA1LjYtcmM2
Lg0KDQpXaGF0IGV4YWN0bHkgZG8geW91IG1lYW4gYnkgImJyZWFrcyI/IElzbid0IGl0IHRoYXQg
eW91IGp1c3QgbmVlZCB0bw0KdW5tdXRlIHN0dWZmIGUuZy4gdXNpbmcgYW1peGVyIG9yIHVzaW5n
IGEgcHJvcGVyIHVwZGF0ZWQgYXNvdW5kLnN0YXRlDQpmaWxlIHdpdGggZGVmYXVsdCBzdGF0ZXMg
Zm9yIHlvdXIgY29udHJvbHM/DQoNCj4gV2FzIHRoZXJlIHNvbWUgZm9sbG93LXVwIHBhdGNoZXMg
dGhhdCBoYXZlbid0IG1hZGUNCj4gaXQgaW50byBtYWlubGluZSB5ZXQgcmVnYXJkaW5nIHRoaXM/
DQoNCkkgZG9uJ3QgdGhpbmsgc28uIEl0IGFsbCB3b3JrcyBwZXJmZWN0bHksIG5vdD8NCg0KPiBU
aGUgcmVzcG9uc2UgYWJvdmUgaW5kaWNhdGVzIG1heWJlIHRoZXJlIHdhcyBhbiBhZGRpdGlvbmFs
IEFMU0ENCj4gY29udHJvbCBwZXJoYXBzIGFkZGVkIGFzIGEgcmVzb2x1dGlvbiBidXQgSSBkb24n
dCBzZWUgYW55IGRpZmZlcmVuY2VzDQo+IHRoZXJlLg0KDQpOb3QgdGhhdCBJIGFtIGF3YXJlIG9m
LCBuby4NCg0KPiBCZXN0IFJlZ2FyZHMsDQo+IA0KPiBUaW0NCg0KQ2hlZXJzDQoNCk1hcmNlbA0K
