Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4EE67BCE
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Jul 2019 21:40:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44CAC1658;
	Sat, 13 Jul 2019 21:39:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44CAC1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563046804;
	bh=V/F1e1F615CMnO9oQ/GMTd9N19HLWJtuJ7i8lq1v4AE=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VAE0bS4WFIixTK0VPVN0hPblYPxGyGvWsHL25zlQ6HxhnQhUcHW48nEzcYvpo4L/Z
	 tmooBhRmw8jwo1UMAEgD62C2FpEmN7ZQO7i9xdlNT60nNVZhi/PCTfd58JPSC3tqNC
	 drXHNhh0wzG5uMvIlGocsRfz+xEjri2cwlkeywUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09ADDF80361;
	Sat, 13 Jul 2019 21:37:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42ECFF802FB; Thu, 11 Jul 2019 12:17:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_NO_HELO_DNS,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130120.outbound.protection.outlook.com [40.107.13.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A476EF800D8
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 12:17:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A476EF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="Y7M04uv0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hNr3QoKwMeUnyCP5hB6vdZTSXriXXS1eoMuJIcQRfA=;
 b=Y7M04uv0ZHLZT+i3S9wdflvPbwYSrtCNf/UgcZqwaudsSyb+wGtlLzC2L1TOBmG0kocyHajR+Dfmmx94WsXNgT7/MYs8B0nYv9tSrFIsP4ke8bmfxTvCeP2Drvj8DKUNd3WWmYX/XuLr+hE5fmJWgFf5du3kKVWb404qdw941Yk=
Received: from AM7PR05MB6741.eurprd05.prod.outlook.com (10.186.171.86) by
 AM7PR05MB6696.eurprd05.prod.outlook.com (10.186.170.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Thu, 11 Jul 2019 10:16:59 +0000
Received: from AM7PR05MB6741.eurprd05.prod.outlook.com
 ([fe80::55f7:56d8:e219:79f5]) by AM7PR05MB6741.eurprd05.prod.outlook.com
 ([fe80::55f7:56d8:e219:79f5%3]) with mapi id 15.20.2073.008; Thu, 11 Jul 2019
 10:16:59 +0000
From: Igor Opaniuk <igor.opaniuk@toradex.com>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Thread-Topic: [PATCH v2 1/6] ASoC: sgtl5000: Fix definition of VAG Ramp Control
Thread-Index: AQHVKyqQziN8PVlEs02TceIA9905xabFTSiA
Date: Thu, 11 Jul 2019 10:16:59 +0000
Message-ID: <CAByghJazsgcSCi_ucgRBN2a4yfVT2_9Gk_DfOPEz-YtNw1u+yg@mail.gmail.com>
References: <20190625074937.2621-1-oleksandr.suvorov@toradex.com>
 <20190625074937.2621-2-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190625074937.2621-2-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0202CA0012.eurprd02.prod.outlook.com
 (2603:10a6:208:1::25) To AM7PR05MB6741.eurprd05.prod.outlook.com
 (2603:10a6:20b:13e::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=igor.opaniuk@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAXMeX+wVkhRhLAa9ORfHbboiZJnY85/tjiFMWUzgZhwYdbjKUEp
 rUxOEqONO35Hiq3zF1FzJc/WoSk+leauYohP9dI=
x-google-smtp-source: APXvYqwDCEcdaMpWQqgjTQsxiXnzWiNUesfVHId1yXV52kNeDzpItG4FwRvarJ9aiMn9t0mzMo37iUSSVPbiXcE0b+o=
x-received: by 2002:a50:ba09:: with SMTP id g9mr2641173edc.172.1562840218832; 
 Thu, 11 Jul 2019 03:16:58 -0700 (PDT)
x-gmail-original-message-id: <CAByghJazsgcSCi_ucgRBN2a4yfVT2_9Gk_DfOPEz-YtNw1u+yg@mail.gmail.com>
x-originating-ip: [209.85.208.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d531c109-9749-4b64-1683-08d705e8e8b6
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR05MB6696; 
x-ms-traffictypediagnostic: AM7PR05MB6696:
x-microsoft-antispam-prvs: <AM7PR05MB6696B62E0D85B3AEF9EC4E469EF30@AM7PR05MB6696.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(346002)(376002)(366004)(136003)(396003)(189003)(199004)(7736002)(107886003)(316002)(5660300002)(305945005)(25786009)(53936002)(6246003)(66066001)(71200400001)(44832011)(71190400001)(61266001)(446003)(14454004)(11346002)(486006)(476003)(6436002)(66446008)(52116002)(99286004)(386003)(6506007)(102836004)(53546011)(26005)(76176011)(64756008)(6116002)(3846002)(55446002)(66556008)(66476007)(66946007)(81156014)(81166006)(6486002)(8676002)(8936002)(498394004)(9686003)(6512007)(4326008)(66574012)(186003)(6862004)(2906002)(68736007)(229853002)(61726006)(95326003)(478600001)(6636002)(14444005)(256004)(54906003)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR05MB6696;
 H:AM7PR05MB6741.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jFGr8a2kBFLBR5MBEYNX3YHY6WKAMZwDNHnhQr9PQneXGcYQLgr4L2qjMkwpvfhk7yP3P/mMrbtVWqkTAgraUQ0SL20gOhkfHGorTLRSIIL1dO/LN8VgrF6cUvEFsflaHs2Ei+TrwLvZPLwMJ5TX7lc0HCDx0QBAoDw2lb2pdmJsqm5dpRTTtsX5mTsvH9g6fd+U0EvOtdihDouAA93C3NEwTou7RnAVOmtZBMqNugbZYtwBZgrVL7zd5syfbe3uv5XqL0heRpDblt+pFkmZthR2OnYOUSchC1XU+ePLUwemmmgXUs2CeJ7KF0CoZy7pXoTyM8dXLn0xjzz0XNx5n1RhTQ0wJXT/7J2pAyDw8/uWeL1/pg5xmMzEX3qMLixYfxsArRnn3ozs5M6fJ/uULoNjYabqxe2RVf72knsVnUc=
Content-ID: <A5CD3AC81707D3479BE8E4A65B824747@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d531c109-9749-4b64-1683-08d705e8e8b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 10:16:59.2164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: igor.opaniuk@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR05MB6696
X-Mailman-Approved-At: Sat, 13 Jul 2019 21:37:34 +0200
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH v2 1/6] ASoC: sgtl5000: Fix definition of
	VAG Ramp Control
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTA6NTUgQU0gT2xla3NhbmRyIFN1dm9yb3YNCjxvbGVr
c2FuZHIuc3V2b3JvdkB0b3JhZGV4LmNvbT4gd3JvdGU6DQo+DQo+IFNHVEw1MDAwX1NNQUxMX1BP
UCBpcyBhIGJpdCBtYXNrLCBub3QgYSB2YWx1ZS4gVXNhZ2Ugb2YNCj4gY29ycmVjdCBkZWZpbml0
aW9uIG1ha2VzIGRldmljZSBwcm9iaW5nIGNvZGUgbW9yZSBjbGVhci4NCj4NCj4gU2lnbmVkLW9m
Zi1ieTogT2xla3NhbmRyIFN1dm9yb3YgPG9sZWtzYW5kci5zdXZvcm92QHRvcmFkZXguY29tPg0K
PiAtLS0NCj4NCj4gIHNvdW5kL3NvYy9jb2RlY3Mvc2d0bDUwMDAuYyB8IDIgKy0NCj4gIHNvdW5k
L3NvYy9jb2RlY3Mvc2d0bDUwMDAuaCB8IDIgKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2Nv
ZGVjcy9zZ3RsNTAwMC5jIGIvc291bmQvc29jL2NvZGVjcy9zZ3RsNTAwMC5jDQo+IGluZGV4IGE2
YTQ3NDhjOTdmOWQuLjVlNDk1MjNlZTBiNjcgMTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3NvYy9jb2Rl
Y3Mvc2d0bDUwMDAuYw0KPiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3NndGw1MDAwLmMNCj4gQEAg
LTEyOTYsNyArMTI5Niw3IEBAIHN0YXRpYyBpbnQgc2d0bDUwMDBfcHJvYmUoc3RydWN0IHNuZF9z
b2NfY29tcG9uZW50ICpjb21wb25lbnQpDQo+DQo+ICAgICAgICAgLyogZW5hYmxlIHNtYWxsIHBv
cCwgaW50cm9kdWNlIDQwMG1zIGRlbGF5IGluIHR1cm5pbmcgb2ZmICovDQo+ICAgICAgICAgc25k
X3NvY19jb21wb25lbnRfdXBkYXRlX2JpdHMoY29tcG9uZW50LCBTR1RMNTAwMF9DSElQX1JFRl9D
VFJMLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNHVEw1MDAwX1NNQUxMX1BP
UCwgMSk7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0dUTDUwMDBfU01BTExf
UE9QLCBTR1RMNTAwMF9TTUFMTF9QT1ApOw0KPg0KPiAgICAgICAgIC8qIGRpc2FibGUgc2hvcnQg
Y3V0IGRldGVjdG9yICovDQo+ICAgICAgICAgc25kX3NvY19jb21wb25lbnRfd3JpdGUoY29tcG9u
ZW50LCBTR1RMNTAwMF9DSElQX1NIT1JUX0NUUkwsIDApOw0KPiBkaWZmIC0tZ2l0IGEvc291bmQv
c29jL2NvZGVjcy9zZ3RsNTAwMC5oIGIvc291bmQvc29jL2NvZGVjcy9zZ3RsNTAwMC5oDQo+IGlu
ZGV4IDE4Y2FlMDhiYmQzYTYuLmE0YmY0YmNhOTViZjcgMTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3Nv
Yy9jb2RlY3Mvc2d0bDUwMDAuaA0KPiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3NndGw1MDAwLmgN
Cj4gQEAgLTI3Myw3ICsyNzMsNyBAQA0KPiAgI2RlZmluZSBTR1RMNTAwMF9CSUFTX0NUUkxfTUFT
SyAgICAgICAgICAgICAgICAgICAgICAgIDB4MDAwZQ0KPiAgI2RlZmluZSBTR1RMNTAwMF9CSUFT
X0NUUkxfU0hJRlQgICAgICAgICAgICAgICAxDQo+ICAjZGVmaW5lIFNHVEw1MDAwX0JJQVNfQ1RS
TF9XSURUSCAgICAgICAgICAgICAgIDMNCj4gLSNkZWZpbmUgU0dUTDUwMDBfU01BTExfUE9QICAg
ICAgICAgICAgICAgICAgICAgMQ0KPiArI2RlZmluZSBTR1RMNTAwMF9TTUFMTF9QT1AgICAgICAg
ICAgICAgICAgICAgICAweDAwMDENCj4NCj4gIC8qDQo+ICAgKiBTR1RMNTAwMF9DSElQX01JQ19D
VFJMDQo+IC0tDQo+IDIuMjAuMQ0KPg0KDQpSZXZpZXdlZC1ieTogSWdvciBPcGFuaXVrIDxpZ29y
Lm9wYW5pdWtAdG9yYWRleC5jb20+DQoNCi0tIA0KQmVzdCByZWdhcmRzIC0gRnJldW5kbGljaGUg
R3LDvHNzZSAtIE1laWxsZXVyZXMgc2FsdXRhdGlvbnMNCg0KU2VuaW9yIERldmVsb3BtZW50IEVu
Z2luZWVyLA0KSWdvciBPcGFuaXVrDQoNClRvcmFkZXggQUcNCkFsdHNhZ2Vuc3RyYXNzZSA1IHwg
NjA0OCBIb3J3L0x1emVybiB8IFN3aXR6ZXJsYW5kIHwgVDogKzQxIDQxIDUwMCA0OA0KMDAgKG1h
aW4gbGluZSkNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
