Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AD467BD0
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Jul 2019 21:40:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B00D51666;
	Sat, 13 Jul 2019 21:40:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B00D51666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563046850;
	bh=STrLLF+4WbXs0/NFusRn5cxyNYx5j4v9vLtPpy85onQ=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TP1cHRVGn+yyYfw7RwTaMuHTNo7tqzNDlG9uLhEwmTLxt9TXIXCNYhA2lk4LmEwgh
	 cHQcnSH0H5EgfoCXu+Iw2ha1oPgg/LMUSY6CZ7/0wY66eGlPQf3juCnhGQ2tlbhZT4
	 iLQyNdo4UwWqjhnX/dfJ7xiX8hEq9qdlObgMBYo4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 090A8F80369;
	Sat, 13 Jul 2019 21:37:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A05E2F802FB; Thu, 11 Jul 2019 12:19:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_NO_HELO_DNS,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40114.outbound.protection.outlook.com [40.107.4.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A9ACF801A4
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 12:19:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A9ACF801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="ifSvWe1n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCNvwvF3sJGe8UMBaQtImpsXEzplt6RvMLc38PkRS/yeyUWuwyMKEBxZJHnLOHnI6HSWpWNjwX/bVTZHxu1ofa4XPleTz9ic2oFBCvanbswiNhD5EBXnwdtuS6TfZ4zFtaHlVJ0kRlcWvgZ6s251feE+A0aJAjHfWcF3OrRaHdsrVO48alIrPK2q8X/bW82lNU/dn63BN6ErhCTg6Wj9Zpeau+QIMrwE3nTkW7H8BzLbWz77F+0tPRDjZN3yJPbHthdce+7zMlCMIAyXONfx1gZmcvvJDhNoS5YW1kP2lUxZ0gYdQdEOk4D7Fijdjo6VoRqaAagANsNmS9r3yt54gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vqegzccg5mgbuJhviu+qMN4asH3YvvBxrmBNQoevxYc=;
 b=DbuIVOFx29f8Urs1GRQJvQNFcKaB1bUe4Az1QvNwlytENlVXfChaF7he11h2GAh/UtGhYEOzhLdNlVUtZj35spJRnc7Wt5plFZsZuGkFp0uf8rpRgrn37J1UQX10BGTTcLVNdHsyvHRhdF+jc1v3rLJEVpTSbmOwUzVpkJ8htcef9hXkREn2IVepx1g8njkGJbmbQEHQY0f5D9DjhpM5nDKZZ4b9gNR1+mfvvjTQhRisnUuVl6S42nl6/YaraslsGmLWQQ7iW8q5g3i14+U4sd1IqVCiagXNRQm24c9L/F2Y2OroYYHvKro/jOcQKoaY+F11VDUGEKX/Yt+meg8hew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=toradex.com;dmarc=pass action=none
 header.from=toradex.com;dkim=pass header.d=toradex.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vqegzccg5mgbuJhviu+qMN4asH3YvvBxrmBNQoevxYc=;
 b=ifSvWe1nYIqsn8uQ6F5UQ3btzdR2kZccdolvIWER04cEADkbd+DgpU6vnx3Sk4UUV6SuJRj+WLTq9Ub+Um5eMAKhuLkM+qFP3DHSLVdaT56Funs3F+HqcWx9o07jWNVLVjARlDhvLqRjg3R4VPktGBAf2lKzu/GqdzGNbmq3xvg=
Received: from AM7PR05MB6741.eurprd05.prod.outlook.com (10.186.171.86) by
 AM7PR05MB6728.eurprd05.prod.outlook.com (10.186.169.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.11; Thu, 11 Jul 2019 10:19:35 +0000
Received: from AM7PR05MB6741.eurprd05.prod.outlook.com
 ([fe80::55f7:56d8:e219:79f5]) by AM7PR05MB6741.eurprd05.prod.outlook.com
 ([fe80::55f7:56d8:e219:79f5%3]) with mapi id 15.20.2073.008; Thu, 11 Jul 2019
 10:19:35 +0000
From: Igor Opaniuk <igor.opaniuk@toradex.com>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Thread-Topic: [PATCH v2 3/6] ASoC: sgtl5000: Fix of unmute outputs on probe
Thread-Index: AQHVKyqTM6H+ZqUkgEmGrNSyaGiEVabFTeEA
Date: Thu, 11 Jul 2019 10:19:34 +0000
Message-ID: <CAByghJYYVNCWB8kdmWvdeL_s2P8nnn7zegh6HwNW0pRC3gAXiw@mail.gmail.com>
References: <20190625074937.2621-1-oleksandr.suvorov@toradex.com>
 <20190625074937.2621-4-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190625074937.2621-4-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0066.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:e6::43) To AM7PR05MB6741.eurprd05.prod.outlook.com
 (2603:10a6:20b:13e::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=igor.opaniuk@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAX4R31NyQVIJV/AFOcfMUMKHtF2/Ji9w3DC3xn2oEPo1OZWLZZY
 YLFRLcZBXRxfFs4aq47q1wNoL6dFYGV2NbAxjBs=
x-google-smtp-source: APXvYqwh/1judZAE/L+wM0ZSzXPgB0nK6J9Ws7VbIEsYIvwpfSHvJbPfA+zVw9u0hdPt5B3+G90YuHD5dFH9n7sgi7A=
x-received: by 2002:a17:906:31c9:: with SMTP id
 f9mr2485556ejf.168.1562840373867; Thu, 11 Jul 2019 03:19:33 -0700 (PDT)
x-gmail-original-message-id: <CAByghJYYVNCWB8kdmWvdeL_s2P8nnn7zegh6HwNW0pRC3gAXiw@mail.gmail.com>
x-originating-ip: [209.85.208.53]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af690bdd-8b26-4054-ef83-08d705e9452b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR05MB6728; 
x-ms-traffictypediagnostic: AM7PR05MB6728:
x-microsoft-antispam-prvs: <AM7PR05MB6728A58BD416F8DFE5A2EE579EF30@AM7PR05MB6728.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1360;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(366004)(346002)(396003)(39850400004)(189003)(199004)(186003)(26005)(66946007)(66476007)(66556008)(53936002)(64756008)(61266001)(66446008)(61726006)(229853002)(6512007)(68736007)(9686003)(6436002)(52116002)(71200400001)(71190400001)(14454004)(6486002)(14444005)(66574012)(256004)(76176011)(66066001)(6246003)(107886003)(53546011)(102836004)(386003)(6506007)(11346002)(4326008)(81166006)(7736002)(486006)(6116002)(44832011)(2906002)(99286004)(3846002)(8936002)(86362001)(55446002)(446003)(478600001)(476003)(6862004)(81156014)(5660300002)(498394004)(8676002)(305945005)(25786009)(6636002)(95326003)(54906003)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR05MB6728;
 H:AM7PR05MB6741.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: maMV2exqK7rr1Ljnbj7PkWZn7GRU0RxUSRZmzR+RDyF1zuLTQsOHJoAK7gnhd8o8msvJIQIStvzwMJQqp3LvEbej5nywZfDzH5x/0B0XigYnNFDd5/XsA2Y/xkbiVGxvl2mOBGQzzpIMyp3I4yZ5ubwufo1+0bpnRwWbDWlNzmhNM+KhB/uC3irNHGj/iSg5o+M3jg0C9Z76QQXyfINx4O4xJ8cWATyNM0Yh7LxrYEAJhbWT7XleP2WXrK3DZ1FPFESUhBcsEEX6HX3FwBky6iseSH5mUEcMYc6izQBLNaB4QEFESSfOSzGCXF3HJZARxkuqzjhX8bLcmjgLXC7V6eNYXiURWUh0usSjSpDf0AZgYGP72OovS2JDoy5ZYpeCplp3Kva4dzy+pjBHwaVTANoPL9C92kmhtk87KuKPvJY=
Content-ID: <6553C68D2B9C774291BC6A2C7C96979B@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af690bdd-8b26-4054-ef83-08d705e9452b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 10:19:34.3261 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: igor.opaniuk@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR05MB6728
X-Mailman-Approved-At: Sat, 13 Jul 2019 21:37:34 +0200
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH v2 3/6] ASoC: sgtl5000: Fix of unmute
	outputs on probe
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

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTA6NTQgQU0gT2xla3NhbmRyIFN1dm9yb3YNCjxvbGVr
c2FuZHIuc3V2b3JvdkB0b3JhZGV4LmNvbT4gd3JvdGU6DQo+DQo+IFRvIGVuYWJsZSAiemVybyBj
cm9zcyBkZXRlY3QiIGZvciBBREMvSFAsIGNoYW5nZQ0KPiBIUF9aQ0RfRU4vQURDX1pDRF9FTiBi
aXRzIG9ubHkgaW5zdGVhZCBvZiB3cml0aW5nIHRoZSB3aG9sZQ0KPiBDSElQX0FOQV9DVFJMIHJl
Z2lzdGVyLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgU3V2b3JvdiA8b2xla3NhbmRy
LnN1dm9yb3ZAdG9yYWRleC5jb20+DQo+IC0tLQ0KPg0KPiAgc291bmQvc29jL2NvZGVjcy9zZ3Rs
NTAwMC5jIHwgNiArKystLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL3NndGw1MDAw
LmMgYi9zb3VuZC9zb2MvY29kZWNzL3NndGw1MDAwLmMNCj4gaW5kZXggYmI1OGM5OTdjNjkxNC4u
ZTgxM2EzNzkxMGFmNCAxMDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2NvZGVjcy9zZ3RsNTAwMC5j
DQo+ICsrKyBiL3NvdW5kL3NvYy9jb2RlY3Mvc2d0bDUwMDAuYw0KPiBAQCAtMTI4OSw2ICsxMjg5
LDcgQEAgc3RhdGljIGludCBzZ3RsNTAwMF9wcm9iZShzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQg
KmNvbXBvbmVudCkNCj4gICAgICAgICBpbnQgcmV0Ow0KPiAgICAgICAgIHUxNiByZWc7DQo+ICAg
ICAgICAgc3RydWN0IHNndGw1MDAwX3ByaXYgKnNndGw1MDAwID0gc25kX3NvY19jb21wb25lbnRf
Z2V0X2RydmRhdGEoY29tcG9uZW50KTsNCj4gKyAgICAgICB1bnNpZ25lZCBpbnQgemNkX21hc2sg
PSBTR1RMNTAwMF9IUF9aQ0RfRU4gfCBTR1RMNTAwMF9BRENfWkNEX0VOOw0KPg0KPiAgICAgICAg
IC8qIHBvd2VyIHVwIHNndGw1MDAwICovDQo+ICAgICAgICAgcmV0ID0gc2d0bDUwMDBfc2V0X3Bv
d2VyX3JlZ3MoY29tcG9uZW50KTsNCj4gQEAgLTEzMTYsOSArMTMxNyw4IEBAIHN0YXRpYyBpbnQg
c2d0bDUwMDBfcHJvYmUoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQpDQo+ICAg
ICAgICAgICAgICAgIDB4MWYpOw0KPiAgICAgICAgIHNuZF9zb2NfY29tcG9uZW50X3dyaXRlKGNv
bXBvbmVudCwgU0dUTDUwMDBfQ0hJUF9QQURfU1RSRU5HVEgsIHJlZyk7DQo+DQo+IC0gICAgICAg
c25kX3NvY19jb21wb25lbnRfd3JpdGUoY29tcG9uZW50LCBTR1RMNTAwMF9DSElQX0FOQV9DVFJM
LA0KPiAtICAgICAgICAgICAgICAgICAgICAgICBTR1RMNTAwMF9IUF9aQ0RfRU4gfA0KPiAtICAg
ICAgICAgICAgICAgICAgICAgICBTR1RMNTAwMF9BRENfWkNEX0VOKTsNCj4gKyAgICAgICBzbmRf
c29jX2NvbXBvbmVudF91cGRhdGVfYml0cyhjb21wb25lbnQsIFNHVEw1MDAwX0NISVBfQU5BX0NU
UkwsDQo+ICsgICAgICAgICAgICAgICB6Y2RfbWFzaywgemNkX21hc2spOw0KPg0KPiAgICAgICAg
IHNuZF9zb2NfY29tcG9uZW50X3VwZGF0ZV9iaXRzKGNvbXBvbmVudCwgU0dUTDUwMDBfQ0hJUF9N
SUNfQ1RSTCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgU0dUTDUwMDBfQklBU19SX01BU0ss
DQo+IC0tDQo+IDIuMjAuMQ0KPg0KDQpSZXZpZXdlZC1ieTogSWdvciBPcGFuaXVrIDxpZ29yLm9w
YW5pdWtAdG9yYWRleC5jb20+DQoNCi0tIA0KQmVzdCByZWdhcmRzIC0gRnJldW5kbGljaGUgR3LD
vHNzZSAtIE1laWxsZXVyZXMgc2FsdXRhdGlvbnMNCg0KU2VuaW9yIERldmVsb3BtZW50IEVuZ2lu
ZWVyLA0KSWdvciBPcGFuaXVrDQoNClRvcmFkZXggQUcNCkFsdHNhZ2Vuc3RyYXNzZSA1IHwgNjA0
OCBIb3J3L0x1emVybiB8IFN3aXR6ZXJsYW5kIHwgVDogKzQxIDQxIDUwMCA0OA0KMDAgKG1haW4g
bGluZSkNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFs
c2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczov
L21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
