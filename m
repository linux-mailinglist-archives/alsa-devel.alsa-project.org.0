Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED4967BCB
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Jul 2019 21:39:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFD491666;
	Sat, 13 Jul 2019 21:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFD491666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563046762;
	bh=GGxJsd4EU+Mp+EfA5rM2v/w61jmQX20n3WSX8iBdzAY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C07RmyABuOd79M4Au1RoOO2KhwXcO1tH1A70KQ8o9RY5VwX9kiLW2OBEllGoS7uhX
	 0ixX7Y+PhC/6HcWbRG6iiB48qZ9ylHuSlaZNGFasPDsTvmz2cp33PeI5RL1PKXqCDv
	 zidMnFpNGNXQAeI3AxzgJrJZLCSZU1PtcavBbCMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB838F802E0;
	Sat, 13 Jul 2019 21:37:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E44BF802FB; Thu, 11 Jul 2019 12:15:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_NO_HELO_DNS,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130121.outbound.protection.outlook.com [40.107.13.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59ED2F801A4
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 12:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59ED2F801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="nx8vlJB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+8xtqSsxWxJ2ih66qi++cmRC4H3sRRs7oHudOFHWRo=;
 b=nx8vlJB1bU2jstrl7QoYxynb2956eycpBVxICr9rvsNumTqRYYFOAtvTQmZWu15W2d17wXjHZXcf4FSP1owspBiTTYjQgJGD7JP1XJb3uiCE/pglTRkxv3fsxOoqiGFPUdi695i0kr5g2hdFQLaziKv+fQ7CTVrJ6bE4X0XqkH8=
Received: from AM7PR05MB6741.eurprd05.prod.outlook.com (10.186.171.86) by
 AM7PR05MB6696.eurprd05.prod.outlook.com (10.186.170.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Thu, 11 Jul 2019 10:15:52 +0000
Received: from AM7PR05MB6741.eurprd05.prod.outlook.com
 ([fe80::55f7:56d8:e219:79f5]) by AM7PR05MB6741.eurprd05.prod.outlook.com
 ([fe80::55f7:56d8:e219:79f5%3]) with mapi id 15.20.2073.008; Thu, 11 Jul 2019
 10:15:52 +0000
From: Igor Opaniuk <igor.opaniuk@toradex.com>
To: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Thread-Topic: [PATCH v2 4/6] ASoC: sgtl5000: Fix charge pump source assignment
Thread-Index: AQHVKyqTSzg5w7HHF0OmUYP9Fd4wVabFTNkA
Date: Thu, 11 Jul 2019 10:15:52 +0000
Message-ID: <CAByghJYJDTiq=3Y8njfvmnnE6rqnEjjDukrJY=pbH8gcDEoxQA@mail.gmail.com>
References: <20190625074937.2621-1-oleksandr.suvorov@toradex.com>
 <20190625074937.2621-5-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190625074937.2621-5-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0902CA0009.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::19) To AM7PR05MB6741.eurprd05.prod.outlook.com
 (2603:10a6:20b:13e::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=igor.opaniuk@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAVpm1eBGtTngpFUNZSKhbUByyNtYHCExdZn4karyjKNb8S6VMOE
 Z+mj1DTiyD1B6MNlEDNOTMF5uhKeSZ3Nc8/l+MM=
x-google-smtp-source: APXvYqy8o7niB89ApJwsX+a410i3mugrhpoFOAXDncjIinkI0BgQYPtDzN+gSWIvD6oE9EacRlsDPOiL+5Z5BPaAq/Q=
x-received: by 2002:a17:906:5f92:: with SMTP id
 a18mr2392296eju.153.1562840151766; Thu, 11 Jul 2019 03:15:51 -0700 (PDT)
x-gmail-original-message-id: <CAByghJYJDTiq=3Y8njfvmnnE6rqnEjjDukrJY=pbH8gcDEoxQA@mail.gmail.com>
x-originating-ip: [209.85.208.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d659877-3596-4fb4-f91c-08d705e8c0e2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM7PR05MB6696; 
x-ms-traffictypediagnostic: AM7PR05MB6696:
x-microsoft-antispam-prvs: <AM7PR05MB669609F58422DF8D6A7402A59EF30@AM7PR05MB6696.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(346002)(376002)(366004)(136003)(396003)(189003)(199004)(7736002)(107886003)(316002)(5660300002)(305945005)(25786009)(53936002)(6246003)(66066001)(71200400001)(44832011)(71190400001)(61266001)(446003)(14454004)(11346002)(486006)(476003)(6436002)(66446008)(52116002)(99286004)(386003)(6506007)(102836004)(53546011)(26005)(76176011)(64756008)(6116002)(3846002)(55446002)(66556008)(66476007)(66946007)(81156014)(81166006)(6486002)(8676002)(8936002)(498394004)(9686003)(6512007)(4326008)(186003)(6862004)(2906002)(68736007)(229853002)(61726006)(95326003)(478600001)(6636002)(256004)(54906003)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM7PR05MB6696;
 H:AM7PR05MB6741.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QrxR7m/lsgF50zM5PhDarj+D6UbATuVeZgAEuJ+42CSHqZ2+D8ElE4MS2JiapGOoVDJhH1AZHudF4PANY50fqBwkjGNpzgqL6O/3mGCCCmE5ARoiST/GplrIwXHPu+O5gao3+KlcjTRJqUJr+7z2Oi5reDxj/CjYrTdUNlcJL54zrwyK8glEUZ7fvvpsmq90SrY4BegJvni8zcz5RuvzDYmv7JQqeTkfuHCox21oAgzSGbrcDYUHgIk136R3QgJjU3GcgIItbfrNMdOIvYsFM116jqjoKcLopmKhbVLKHALB4zvG/DlOeP25SicnE4geQn0wiXC1IwvtM79rkgl0jiG6MKeEtW4u5fnOexbSsmj34aE0++OKPwBzR1vaxujH5PUECKTmeYqVGlVC2oB4CMJHM9KsSmLVEliwl5I6EIs=
Content-ID: <E0E31CDF6B6AD64E9D14128FE3E3191C@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d659877-3596-4fb4-f91c-08d705e8c0e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 10:15:52.4767 (UTC)
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
Subject: Re: [alsa-devel] [PATCH v2 4/6] ASoC: sgtl5000: Fix charge pump
	source assignment
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

SGkgT2xla3NhbmRyLA0KDQpPbiBUdWUsIEp1biAyNSwgMjAxOSBhdCAxMDo1NiBBTSBPbGVrc2Fu
ZHIgU3V2b3Jvdg0KPG9sZWtzYW5kci5zdXZvcm92QHRvcmFkZXguY29tPiB3cm90ZToNCj4NCj4g
SWYgVkREQSAhPSBWRERJTyBhbmQgYW55IG9mIHRoZW0gaXMgZ3JlYXRlciB0aGFuIDMuMVYsIGNo
YXJnZSBwdW1wDQo+IHNvdXJjZSBjYW4gYmUgYXNzaWduZWQgYXV0b21hdGljYWxseS4NCm1pbm9y
OiBDb3VsZCBhbHNvIHlvdSBwbGVhc2UgYWRkIGEgcmVmZXJlbmNlIGxpbmsgdG8gdGhlIGNvbW1p
dCBtZXNzYWdlLA0Kd2hlcmUgdGhpcyBiZWhhdmlvciBpcyBkZWZpbmVkPw0KDQo+DQo+IFNpZ25l
ZC1vZmYtYnk6IE9sZWtzYW5kciBTdXZvcm92IDxvbGVrc2FuZHIuc3V2b3JvdkB0b3JhZGV4LmNv
bT4NCj4gLS0tDQo+DQo+ICBzb3VuZC9zb2MvY29kZWNzL3NndGw1MDAwLmMgfCAxNCArKysrKysr
KystLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkNCj4NCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3Mvc2d0bDUwMDAuYyBiL3NvdW5k
L3NvYy9jb2RlY3Mvc2d0bDUwMDAuYw0KPiBpbmRleCBlODEzYTM3OTEwYWY0Li5lZTFlNGJmNjEz
MjI3IDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvY29kZWNzL3NndGw1MDAwLmMNCj4gKysrIGIv
c291bmQvc29jL2NvZGVjcy9zZ3RsNTAwMC5jDQo+IEBAIC0xMTc0LDEyICsxMTc0LDE2IEBAIHN0
YXRpYyBpbnQgc2d0bDUwMDBfc2V0X3Bvd2VyX3JlZ3Moc3RydWN0IHNuZF9zb2NfY29tcG9uZW50
ICpjb21wb25lbnQpDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBT
R1RMNTAwMF9JTlRfT1NDX0VOKTsNCj4gICAgICAgICAgICAgICAgIC8qIEVuYWJsZSBWRERDIGNo
YXJnZSBwdW1wICovDQo+ICAgICAgICAgICAgICAgICBhbmFfcHdyIHw9IFNHVEw1MDAwX1ZERENf
Q0hSR1BNUF9QT1dFUlVQOw0KPiAtICAgICAgIH0gZWxzZSBpZiAodmRkaW8gPj0gMzEwMCAmJiB2
ZGRhID49IDMxMDApIHsNCj4gKyAgICAgICB9IGVsc2Ugew0KPiAgICAgICAgICAgICAgICAgYW5h
X3B3ciAmPSB+U0dUTDUwMDBfVkREQ19DSFJHUE1QX1BPV0VSVVA7DQo+IC0gICAgICAgICAgICAg
ICAvKiBWRERDIHVzZSBWRERJTyByYWlsICovDQo+IC0gICAgICAgICAgICAgICBscmVnX2N0cmwg
fD0gU0dUTDUwMDBfVkREQ19BU1NOX09WUkQ7DQo+IC0gICAgICAgICAgICAgICBscmVnX2N0cmwg
fD0gU0dUTDUwMDBfVkREQ19NQU5fQVNTTl9WRERJTyA8PA0KPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgU0dUTDUwMDBfVkREQ19NQU5fQVNTTl9TSElGVDsNCj4gKyAgICAgICAgICAgICAg
IC8qIGlmIHZkZGlvID09IHZkZGEgdGhlIHNvdXJjZSBvZiBjaGFyZ2UgcHVtcCBzaG91bGQgYmUN
Cj4gKyAgICAgICAgICAgICAgICAqIGFzc2lnbmVkIG1hbnVhbGx5IHRvIFZERElPDQo+ICsgICAg
ICAgICAgICAgICAgKi8NCm1pbm9yOiBwbGVhc2UgY2hlY2sgdGhlIHByZWZlcnJlZCBzdHlsZSBm
b3IgbG9uZyAobXVsdGktbGluZSkgY29tbWVudHMNCmluIGNvZGluZy1zdHlsZS5yc3QsDQpmaXJz
dCBsaW5lIHNob3VsZCBiZSBlbXB0eS4NCg0KPiArICAgICAgICAgICAgICAgaWYgKHZkZGlvID09
IHZkZGEpIHsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgbHJlZ19jdHJsIHw9IFNHVEw1MDAw
X1ZERENfQVNTTl9PVlJEOw0KPiArICAgICAgICAgICAgICAgICAgICAgICBscmVnX2N0cmwgfD0g
U0dUTDUwMDBfVkREQ19NQU5fQVNTTl9WRERJTyA8PA0KPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBTR1RMNTAwMF9WRERDX01BTl9BU1NOX1NISUZUOw0KPiArICAgICAgICAg
ICAgICAgfQ0KPiAgICAgICAgIH0NCj4NCj4gICAgICAgICBzbmRfc29jX2NvbXBvbmVudF93cml0
ZShjb21wb25lbnQsIFNHVEw1MDAwX0NISVBfTElOUkVHX0NUUkwsIGxyZWdfY3RybCk7DQo+IC0t
DQo+IDIuMjAuMQ0KPg0KDQpXaXRoIG15IGNvbW1lbnRzIGFkZHJlc3NlZDoNClJldmlld2VkLWJ5
OiBJZ29yIE9wYW5pdWsgPGlnb3Iub3Bhbml1a0B0b3JhZGV4LmNvbT4NCg0KLS0gDQpCZXN0IHJl
Z2FyZHMgLSBGcmV1bmRsaWNoZSBHcsO8c3NlIC0gTWVpbGxldXJlcyBzYWx1dGF0aW9ucw0KDQpT
ZW5pb3IgRGV2ZWxvcG1lbnQgRW5naW5lZXIsDQpJZ29yIE9wYW5pdWsNCg0KVG9yYWRleCBBRw0K
QWx0c2FnZW5zdHJhc3NlIDUgfCA2MDQ4IEhvcncvTHV6ZXJuIHwgU3dpdHplcmxhbmQgfCBUOiAr
NDEgNDEgNTAwIDQ4DQowMCAobWFpbiBsaW5lKQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYWxzYS1kZXZlbAo=
