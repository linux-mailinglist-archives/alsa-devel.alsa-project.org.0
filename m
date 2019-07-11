Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC1367BD3
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Jul 2019 21:41:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AA1E1675;
	Sat, 13 Jul 2019 21:41:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AA1E1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563046914;
	bh=iCo0iasae1BHp4lcSewvjhj18jkRsbNYht72eR/OmbA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TQJMr84HgladPzRECiSjzE4iy2lLznxBpGNpg3yqBY0Nwxr/G/P6ye5kupbFWZUcZ
	 7YjMEblZ9IZXrg6nEcLtXSH5PO2OrO6QVO22Cm+mof0Yl8M0lhHtQnI2pXba7VFbU7
	 0UYUIzHh43dR8FwFxxzpjuNZ58zNICzN97MQt0a8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F20BF8038F;
	Sat, 13 Jul 2019 21:37:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EA98F802FB; Thu, 11 Jul 2019 12:24:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_NO_HELO_DNS,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130114.outbound.protection.outlook.com [40.107.13.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 424E4F800D8
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 12:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 424E4F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="b7bLPQ/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6N4wouQPy1ZMvlDig4i4f8qddSubLi7/KWNJ98n28qc=;
 b=b7bLPQ/NGKewt3u2ucu4KzSGTbS3ZeRwf7O7Aqz0s5/z09DIl2EtV9VpRo7JPNGsKia4GQCTI9XlsA2p+mbWP/lygENs9A8uetPxL/CB/s+5yFgygUGV5F6R8EJzSV+4/K1AKrUYnrzC8HbEzyFhce4WwZXebUTzSzuY7QFZjRU=
Received: from AM7PR05MB6741.eurprd05.prod.outlook.com (10.186.171.86) by
 AM7PR05MB6696.eurprd05.prod.outlook.com (10.186.170.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Thu, 11 Jul 2019 10:24:01 +0000
Received: from AM7PR05MB6741.eurprd05.prod.outlook.com
 ([fe80::55f7:56d8:e219:79f5]) by AM7PR05MB6741.eurprd05.prod.outlook.com
 ([fe80::55f7:56d8:e219:79f5%3]) with mapi id 15.20.2073.008; Thu, 11 Jul 2019
 10:24:01 +0000
From: Igor Opaniuk <igor.opaniuk@toradex.com>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Thread-Topic: [PATCH v2 5/6] ASoC: Define a set of DAPM pre/post-up events
Thread-Index: AQHVKyqU2fHSSCNLBEK3y0FoLy1SDabFTYGA
Date: Thu, 11 Jul 2019 10:24:01 +0000
Message-ID: <CAByghJY-338xh8srU-PetjqER-kt6TwuULffqVeZ8cLLGyaubA@mail.gmail.com>
References: <20190625074937.2621-1-oleksandr.suvorov@toradex.com>
 <20190625074937.2621-6-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190625074937.2621-6-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0020.eurprd05.prod.outlook.com
 (2603:10a6:208:55::33) To AM7PR05MB6741.eurprd05.prod.outlook.com
 (2603:10a6:20b:13e::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=igor.opaniuk@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAVjXtGOTEtFYWlpn5zy2iiKy6m8slU2h6UaAgxoAGuhGW4GpvAc
 wTgc+KaZzYtW7B1orhwUYJV8e54+SK56qsUQLxw=
x-google-smtp-source: APXvYqzMh4W//NXLEr8XKUVvwDtElo6qYR2v9KBzntX0Cqyc4+ESP64jCEVciGf/gvaVmKve2b0KbZ70VL5eZeIH1aM=
x-received: by 2002:a17:906:2191:: with SMTP id
 17mr2407276eju.157.1562840292839; Thu, 11 Jul 2019 03:18:12 -0700 (PDT)
x-gmail-original-message-id: <CAByghJY-338xh8srU-PetjqER-kt6TwuULffqVeZ8cLLGyaubA@mail.gmail.com>
x-originating-ip: [209.85.208.43]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a6d643c-9c53-4a70-20f4-08d705e9e43f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR05MB6696; 
x-ms-traffictypediagnostic: AM7PR05MB6696:
x-microsoft-antispam-prvs: <AM7PR05MB669621E2C71FB9384394924D9EF30@AM7PR05MB6696.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:428;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(39850400004)(346002)(376002)(366004)(136003)(396003)(189003)(199004)(7736002)(107886003)(316002)(5660300002)(305945005)(25786009)(53936002)(6246003)(66066001)(71200400001)(44832011)(71190400001)(61266001)(446003)(14454004)(11346002)(486006)(476003)(6436002)(66446008)(52116002)(99286004)(386003)(6506007)(102836004)(53546011)(26005)(76176011)(64756008)(6116002)(3846002)(55446002)(66556008)(66476007)(66946007)(81156014)(81166006)(6486002)(8676002)(8936002)(498394004)(9686003)(6512007)(4326008)(186003)(6862004)(2906002)(68736007)(229853002)(61726006)(95326003)(478600001)(6636002)(256004)(54906003)(86362001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR05MB6696;
 H:AM7PR05MB6741.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kPRqajVtBRPKDnNIgDuWmd/truZHMXT8/J8l9Pf+DNAeR3DKquL1faLkt6vBgUMU7RXDcLWBPy00SZfL3v4HXN/R3A9y/UR8RAoEKs94NWkgmpCqeUxT4dArqQ1sSXbBlrLc1wJQYJd/OaDZXa9eYXdKn5lcJE+JgW38CxLzKKWIaFLrQviXTU6GgqueyvyOdUv+RKBjt/K63+p7JpKapA61Q4da6eUXcIEDHhEv9xLvAaAPvidD8IutTWIovB6CoFQjRaucjbTbyxYreyeya86YFw6ZgH4yHqyc17lqeAK+Mo5wNC7wmvvqZNHiKmlPQCtfZJ/ir5NjnRK/e3l+M6WuZ2L+b/KLhxzuSRjRAPmQ+7/U/7+BtVM9uAbGi/taAFkwy45+MOQaR4IvOdzv6jG8HOffssz0eedtYve4K5g=
Content-ID: <95473DF1162D5643A63143C5232BAB7A@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6d643c-9c53-4a70-20f4-08d705e9e43f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 10:24:01.1926 (UTC)
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
Subject: Re: [alsa-devel] [PATCH v2 5/6] ASoC: Define a set of DAPM
	pre/post-up events
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
c2FuZHIuc3V2b3JvdkB0b3JhZGV4LmNvbT4gd3JvdGU6DQo+DQo+IFByZXBhcmUgdG8gdXNlIFNO
RF9TT0NfREFQTV9QUkVfUE9TVF9QTVUgZGVmaW5pdGlvbiB0bw0KPiByZWR1Y2UgY29taW5nIGNv
ZGUgc2l6ZSBhbmQgbWFrZSBpdCBtb3JlIHJlYWRhYmxlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBP
bGVrc2FuZHIgU3V2b3JvdiA8b2xla3NhbmRyLnN1dm9yb3ZAdG9yYWRleC5jb20+DQo+IC0tLQ0K
Pg0KPiAgaW5jbHVkZS9zb3VuZC9zb2MtZGFwbS5oIHwgMiArKw0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zb3VuZC9zb2MtZGFw
bS5oIGIvaW5jbHVkZS9zb3VuZC9zb2MtZGFwbS5oDQo+IGluZGV4IGMwMGEwYjhhZGUwODYuLjZj
NjY5NDE2MDEzMDcgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvc291bmQvc29jLWRhcG0uaA0KPiAr
KysgYi9pbmNsdWRlL3NvdW5kL3NvYy1kYXBtLmgNCj4gQEAgLTM1Myw2ICszNTMsOCBAQCBzdHJ1
Y3QgZGV2aWNlOw0KPiAgI2RlZmluZSBTTkRfU09DX0RBUE1fV0lMTF9QTUQgICAweDgwICAgIC8q
IGNhbGxlZCBhdCBzdGFydCBvZiBzZXF1ZW5jZSAqLw0KPiAgI2RlZmluZSBTTkRfU09DX0RBUE1f
UFJFX1BPU1RfUE1EIFwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoU05EX1NP
Q19EQVBNX1BSRV9QTUQgfCBTTkRfU09DX0RBUE1fUE9TVF9QTUQpDQo+ICsjZGVmaW5lIFNORF9T
T0NfREFQTV9QUkVfUE9TVF9QTVUgXA0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IChTTkRfU09DX0RBUE1fUFJFX1BNVSB8IFNORF9TT0NfREFQTV9QT1NUX1BNVSkNCj4NCj4gIC8q
IGNvbnZlbmllbmNlIGV2ZW50IHR5cGUgZGV0ZWN0aW9uICovDQo+ICAjZGVmaW5lIFNORF9TT0Nf
REFQTV9FVkVOVF9PTihlKSAgICAgICBcDQo+IC0tDQo+IDIuMjAuMQ0KPg0KDQpSZXZpZXdlZC1i
eTogSWdvciBPcGFuaXVrIDxpZ29yLm9wYW5pdWtAdG9yYWRleC5jb20+DQoNCi0tIA0KQmVzdCBy
ZWdhcmRzIC0gRnJldW5kbGljaGUgR3LDvHNzZSAtIE1laWxsZXVyZXMgc2FsdXRhdGlvbnMNCg0K
U2VuaW9yIERldmVsb3BtZW50IEVuZ2luZWVyLA0KSWdvciBPcGFuaXVrDQoNClRvcmFkZXggQUcN
CkFsdHNhZ2Vuc3RyYXNzZSA1IHwgNjA0OCBIb3J3L0x1emVybiB8IFN3aXR6ZXJsYW5kIHwgVDog
KzQxIDQxIDUwMCA0OA0KMDAgKG1haW4gbGluZSkNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
