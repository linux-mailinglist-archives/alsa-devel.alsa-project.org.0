Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C4167BD1
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Jul 2019 21:41:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 927D71677;
	Sat, 13 Jul 2019 21:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 927D71677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563046867;
	bh=D1h+BJil1KjBtW9IEscPa8NkaE7P7H273A88jftyUZ0=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CgocEqzvwPFGMIqUCHcAiE9xji4WOa5zqCdF9xVXEfWosaY2d+3NeL5RQAmrYibCg
	 Yb3cR1nEX0Bzfe3rqxmk877Wt2mzCjaPu/ykKsqkCvrL08R5eIQc/TtlRRGVyIUjnp
	 fZ1psCtgcxN6a4y+R39L4qVoKl/cB8b6uaUOiriQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01336F8036E;
	Sat, 13 Jul 2019 21:37:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C2B2F802FB; Thu, 11 Jul 2019 12:21:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_NO_HELO_DNS,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130127.outbound.protection.outlook.com [40.107.13.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0FF1F800D8
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 12:20:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0FF1F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="CR7Jdbdr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HsSR8DX8hCulohWUxa/i+HlQMvpugLkP/Bem6olghKE=;
 b=CR7JdbdrPxG5Dg2OqjI5srdXLuGiyuxznWflpvNMebk6RHAjS81vOiap27KNP+RhkP0FUMpggwA6Qogit6LCfTVTS7PsziJTHluRDG0yFS8+zbDMOVXtmUjYe/lrcgJ4TMUc3gxBwqPbfYkdk2F91h89iO9xzgvBMCrziVjSLsI=
Received: from AM7PR05MB6741.eurprd05.prod.outlook.com (10.186.171.86) by
 AM7PR05MB6696.eurprd05.prod.outlook.com (10.186.170.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Thu, 11 Jul 2019 10:20:55 +0000
Received: from AM7PR05MB6741.eurprd05.prod.outlook.com
 ([fe80::55f7:56d8:e219:79f5]) by AM7PR05MB6741.eurprd05.prod.outlook.com
 ([fe80::55f7:56d8:e219:79f5%3]) with mapi id 15.20.2073.008; Thu, 11 Jul 2019
 10:20:55 +0000
From: Igor Opaniuk <igor.opaniuk@toradex.com>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Thread-Topic: [PATCH v2 2/6] ASoC: sgtl5000: add ADC mute control
Thread-Index: AQHVKyqRRD0zb81hRk+Jt1ntvt3D5qbFTkKA
Date: Thu, 11 Jul 2019 10:20:54 +0000
Message-ID: <CAByghJbOVX9RNA+TLz45cFUPHm=6_QHnvK7RFvGTGjPy-Mp67w@mail.gmail.com>
References: <20190625074937.2621-1-oleksandr.suvorov@toradex.com>
 <20190625074937.2621-3-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190625074937.2621-3-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR10CA0033.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::13) To AM7PR05MB6741.eurprd05.prod.outlook.com
 (2603:10a6:20b:13e::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=igor.opaniuk@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAV7nH21oIYrdJRgRDcps4QX4bVt9vOgJ5QoWKt1auRO6HJCzEvj
 ZVwkJdKSoPUbpxaGjnG9Kjtuy363RU/bQjSy/ds=
x-google-smtp-source: APXvYqw5+fVxrxycXy0PTxStgsoPaTYCbZT9VhKi+rjPtT95tgr/6+qWfbPDAN32oX44HhyZNTRtV3EzABSRvIYLi7k=
x-received: by 2002:a17:907:2130:: with SMTP id
 qo16mr2396664ejb.235.1562840454251; Thu, 11 Jul 2019 03:20:54 -0700 (PDT)
x-gmail-original-message-id: <CAByghJbOVX9RNA+TLz45cFUPHm=6_QHnvK7RFvGTGjPy-Mp67w@mail.gmail.com>
x-originating-ip: [209.85.208.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ad0b410-9027-40be-ba4d-08d705e97513
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR05MB6696; 
x-ms-traffictypediagnostic: AM7PR05MB6696:
x-microsoft-antispam-prvs: <AM7PR05MB6696CDBA84EA4BFD5389E2A59EF30@AM7PR05MB6696.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:421;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(346002)(376002)(366004)(136003)(396003)(189003)(199004)(7736002)(107886003)(316002)(5660300002)(305945005)(25786009)(53936002)(6246003)(66066001)(71200400001)(44832011)(71190400001)(61266001)(446003)(14454004)(11346002)(486006)(476003)(6436002)(66446008)(52116002)(99286004)(386003)(6506007)(102836004)(53546011)(26005)(76176011)(64756008)(6116002)(3846002)(55446002)(66556008)(66476007)(66946007)(81156014)(81166006)(6486002)(8676002)(8936002)(498394004)(9686003)(6512007)(4326008)(186003)(6862004)(2906002)(68736007)(229853002)(61726006)(95326003)(478600001)(6636002)(256004)(54906003)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR05MB6696;
 H:AM7PR05MB6741.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Hmb3fFoXqmBNzJ47Qa5/AXWxjWBCuUVDAr42R31A12E2xDxY+mH4nGOC4BNfJRIslLEeTX/EOy408yLJE+qtYZYTRMfbt39Nz5a0kCHGcbPGqvn3r3PFllMFOin2vx8MRaiN+RV8KmEY5iz4MfR/x4zHhRwVkycS7cRffYNMbFv4I9t/VcC3SVbfycmYFVOMyD8S/cySXZn15/8c2aLdYVuaEa6iG/Vvazk4ouJuo4ubVBDPc17UUylvkFy6At7N6grK/NWWskTeDrVdQWmKu5/HzmgruZ57rsscmHHwRnJKlGxf9M2+hJLtYpPrKdw1zWyqHrJ8UHVPOckVadV6kqXLbYD4INmeOqqNRB521H87SNftPxTWOGqwD4aG3/RjFB64XfVEmXOoCzufpA0KZHIP+vIAcpFwqHcwHXNWqTg=
Content-ID: <C03FE226A1F31A4390D4663DC46DBBA6@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad0b410-9027-40be-ba4d-08d705e97513
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 10:20:54.7051 (UTC)
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
Subject: Re: [alsa-devel] [PATCH v2 2/6] ASoC: sgtl5000: add ADC mute control
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

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTA6NDkgQU0gT2xla3NhbmRyIFN1dm9yb3YNCjxvbGVr
c2FuZHIuc3V2b3JvdkB0b3JhZGV4LmNvbT4gd3JvdGU6DQo+DQo+IFRoaXMgY29udHJvbCBtdXRl
L3VubXV0ZSB0aGUgQURDIGlucHV0IG9mIFNHVEw1MDAwDQo+IHVzaW5nIGl0cyBDSElQX0FOQV9D
VFJMIHJlZ2lzdGVyLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgU3V2b3JvdiA8b2xl
a3NhbmRyLnN1dm9yb3ZAdG9yYWRleC5jb20+DQo+IC0tLQ0KPg0KPiAgc291bmQvc29jL2NvZGVj
cy9zZ3RsNTAwMC5jIHwgMSArDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4N
Cj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3Mvc2d0bDUwMDAuYyBiL3NvdW5kL3NvYy9j
b2RlY3Mvc2d0bDUwMDAuYw0KPiBpbmRleCA1ZTQ5NTIzZWUwYjY3Li5iYjU4Yzk5N2M2OTE0IDEw
MDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvY29kZWNzL3NndGw1MDAwLmMNCj4gKysrIGIvc291bmQv
c29jL2NvZGVjcy9zZ3RsNTAwMC5jDQo+IEBAIC01NTYsNiArNTU2LDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBzbmRfa2NvbnRyb2xfbmV3IHNndGw1MDAwX3NuZF9jb250cm9sc1tdID0gew0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICBTR1RMNTAwMF9DSElQX0FOQV9BRENfQ1RSTCwNCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgOCwgMSwgMCwgY2FwdHVyZV82ZGJfYXR0ZW51YXRlKSwNCj4g
ICAgICAgICBTT0NfU0lOR0xFKCJDYXB0dXJlIFpDIFN3aXRjaCIsIFNHVEw1MDAwX0NISVBfQU5B
X0NUUkwsIDEsIDEsIDApLA0KPiArICAgICAgIFNPQ19TSU5HTEUoIkNhcHR1cmUgU3dpdGNoIiwg
U0dUTDUwMDBfQ0hJUF9BTkFfQ1RSTCwgMCwgMSwgMSksDQo+DQo+ICAgICAgICAgU09DX0RPVUJM
RV9UTFYoIkhlYWRwaG9uZSBQbGF5YmFjayBWb2x1bWUiLA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICBTR1RMNTAwMF9DSElQX0FOQV9IUF9DVFJMLA0KPiAtLQ0KPiAyLjIwLjENCj4NCg0KUmV2
aWV3ZWQtYnk6IElnb3IgT3Bhbml1ayA8aWdvci5vcGFuaXVrQHRvcmFkZXguY29tPg0KDQotLSAN
CkJlc3QgcmVnYXJkcyAtIEZyZXVuZGxpY2hlIEdyw7xzc2UgLSBNZWlsbGV1cmVzIHNhbHV0YXRp
b25zDQoNClNlbmlvciBEZXZlbG9wbWVudCBFbmdpbmVlciwNCklnb3IgT3Bhbml1aw0KDQpUb3Jh
ZGV4IEFHDQpBbHRzYWdlbnN0cmFzc2UgNSB8IDYwNDggSG9ydy9MdXplcm4gfCBTd2l0emVybGFu
ZCB8IFQ6ICs0MSA0MSA1MDAgNDgNCjAwIChtYWluIGxpbmUpDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNh
LWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
