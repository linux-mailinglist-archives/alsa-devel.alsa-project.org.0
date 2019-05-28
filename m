Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1DF2C991
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 17:07:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C23D1806;
	Tue, 28 May 2019 17:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C23D1806
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559056050;
	bh=Gq4Es/WhctvfsebwmDarE2Shf0b/84tdOUmi5/igebE=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TuUJsV3YB/MnIazqkFplGimK1phtfyiD61sfOCFZBlbvG9aRurw+wwuOml3svGdKq
	 ANBYluTdIXgC6VKguqN7w7ZaqzSx0kRcUYmcSaNQmRB3TQUmfQm4BMX7cd4U4MgJSY
	 zRcVzidmw1V27X6ZtQtpFN08rtk7A142Bgotnlqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5B1BF89734;
	Tue, 28 May 2019 17:04:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 715B6F89706; Tue, 28 May 2019 16:40:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40069.outbound.protection.outlook.com [40.107.4.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2C68F8072E
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 16:40:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2C68F8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=Mellanox.com header.i=@Mellanox.com
 header.b="YQGVulZ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGDwWypZZ4eJ/C1s8L1Asfv3QGVTeLnW226BrN1Qhsc=;
 b=YQGVulZ5z7NJ6Y+7Ncw81kQTJTMvi/yaAkx9J6Lfh3Cln1v8qpTAA7t6WmcKRuWBsr9Xhd8Ve0zHECa6KNfSRl+nNrnKw/YH+LeyjG+lv4ts/dGuNSbQ9MYT54CdkgCWeoVne2I9il9y6KlEJcaZgUtI7sgSK8WbCPXEhY+rBEA=
Received: from AM0PR0502MB4068.eurprd05.prod.outlook.com (52.133.38.142) by
 AM0PR0502MB3892.eurprd05.prod.outlook.com (52.133.50.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.16; Tue, 28 May 2019 14:40:08 +0000
Received: from AM0PR0502MB4068.eurprd05.prod.outlook.com
 ([fe80::6073:86f:d8a5:e427]) by AM0PR0502MB4068.eurprd05.prod.outlook.com
 ([fe80::6073:86f:d8a5:e427%6]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 14:40:08 +0000
From: Eran Ben Elisha <eranbe@mellanox.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Igor Konopko
 <igor.j.konopko@intel.com>, David Howells <dhowells@redhat.com>, "Mohit P .
 Tahiliani" <tahiliani@nitk.edu.in>, Takashi Sakamoto
 <o-takashi@sakamocchi.jp>, Matias Bjorling <mb@lightnvm.io>, Jiri Pirko
 <jiri@mellanox.com>, "David S . Miller" <davem@davemloft.net>, Jamal Hadi
 Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Clemens
 Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Joe Perches <joe@perches.com>, Arnd Bergmann
 <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>
Thread-Topic: [PATCH 5/5] [RFC] devlink: Fix uninitialized error code in
 devlink_fmsg_prepare_skb()
Thread-Index: AQHVFWEYr6PWoO5LskiotnwgE/6kraaAm7cA
Date: Tue, 28 May 2019 14:40:08 +0000
Message-ID: <0f92eb11-20b5-c50b-1577-d3896f28c73b@mellanox.com>
References: <20190528142424.19626-1-geert@linux-m68k.org>
 <20190528142424.19626-6-geert@linux-m68k.org>
In-Reply-To: <20190528142424.19626-6-geert@linux-m68k.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6P192CA0056.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:82::33) To AM0PR0502MB4068.eurprd05.prod.outlook.com
 (2603:10a6:208:d::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=eranbe@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a896751-60d3-4369-5f3e-08d6e37a616d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR0502MB3892; 
x-ms-traffictypediagnostic: AM0PR0502MB3892:
x-microsoft-antispam-prvs: <AM0PR0502MB38928ECA25430C114C430CC3BA1E0@AM0PR0502MB3892.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(366004)(39860400002)(346002)(376002)(189003)(199004)(305945005)(4326008)(6512007)(66946007)(66446008)(64756008)(66556008)(66476007)(7736002)(73956011)(7416002)(6436002)(6246003)(229853002)(2171002)(6486002)(25786009)(14454004)(53936002)(31686004)(316002)(54906003)(110136005)(6116002)(3846002)(6506007)(386003)(52116002)(99286004)(66066001)(2906002)(8936002)(5660300002)(8676002)(53546011)(81166006)(2616005)(81156014)(476003)(71200400001)(71190400001)(186003)(102836004)(256004)(446003)(478600001)(14444005)(68736007)(36756003)(86362001)(26005)(11346002)(486006)(76176011)(31696002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR0502MB3892;
 H:AM0PR0502MB4068.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lE27RtcEefp9ltSt6Kv+xlAnNQ3LF7Dytl0hgc7GSB/ClPcCgdkne7kqy1z3lQ59g1O0T7jLwbt47LXR0y4P2uvx7jIyFnHNXeibMbMxVtrBJ6cJus8d/fb11Po7iHU8DDSOQMTK0iWyvQcDkjvMwkrGwY1aFe+sD/K6npafjBu/fovDJVP0GroIG83LBn1tXbshl19+i69yntq9bMc6D9pWH/YRNdwVLi4bwXt1JFLvarMwqImNAQx9QyJP9/IPiAEkm7pk4kzscHEuml1xqZMKamVoUv9zE52z8ZwdBmZgf9Yc/Bar7MLYat3KUJpcMy2lEplcyBQZvPG4BkT+kz6B/JpjoD8kZMj9nTnPx/DzewsjApugXV3tjMEiyppOXeF18i4fKDjQAHjf+kvluhiZMiTTO9yjKdKjEFjg6xE=
Content-ID: <CEDEDE15ABD92A47A1D0AAA6F6441A4F@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a896751-60d3-4369-5f3e-08d6e37a616d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 14:40:08.5523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eranbe@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0502MB3892
X-Mailman-Approved-At: Tue, 28 May 2019 17:03:57 +0200
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH 5/5] [RFC] devlink: Fix uninitialized error
 code in devlink_fmsg_prepare_skb()
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

DQoNCk9uIDUvMjgvMjAxOSA1OjI0IFBNLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+IFdp
dGggZ2NjIDQuMToNCj4gDQo+ICAgICAgbmV0L2NvcmUvZGV2bGluay5jOiBJbiBmdW5jdGlvbiDi
gJhkZXZsaW5rX2Ztc2dfcHJlcGFyZV9za2LigJk6DQo+ICAgICAgbmV0L2NvcmUvZGV2bGluay5j
OjQzMjU6IHdhcm5pbmc6IOKAmGVycuKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRo
aXMgZnVuY3Rpb24NCj4gDQo+IEluZGVlZCwgaWYgdGhlIGxpc3QgaGFzIGxlc3MgdGhhbiAqc3Rh
cnQgZW50cmllcywgYW4gdW5pbml0aWFsaXplZCBlcnJvcg0KPiBjb2RlIHdpbGwgYmUgcmV0dXJu
ZWQuDQoNClRoZSBsb2dpYyBndWFyYW50ZWVzIHRoYXQgc3RhcnQgaXMgc21hbGxlciB0aGFuIHRo
ZSBsZW5ndGggb2YgdGhlIGxpc3QuDQpidXQgSSBndWVzcyB0aGF0IHRoZSBjb21waWxlciBjYW4n
dCBkZXRlY3QgdGhhdC4NCg0KUmV2aWV3ZWQtYnk6IEVyYW4gQmVuIEVsaXNoYSA8ZXJhbmJlQG1l
bGxhbm94LmNvbT4NCg0KPiANCj4gRml4IHRoaXMgYnkgcHJlaW5pdGlhbGl6aW5nIGVyciB0byB6
ZXJvLg0KPiANCj4gRml4ZXM6IDFkYjY0ZTg3MzNmNjUzODEgKCJkZXZsaW5rOiBBZGQgZGV2bGlu
ayBmb3JtYXR0ZWQgbWVzc2FnZSAoZm1zZykgQVBJIikNCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gLS0tDQo+IEkgZG9uJ3Qga25v
dyBpZiB0aGlzIGNhbiByZWFsbHkgaGFwcGVuLCBhbmQgaWYgdGhpcyBpcyB0aGUgcmlnaHQgZml4
Lg0KPiBQZXJoYXBzIGVyciBzaG91bGQgYmUgaW5pdGlhbGl6ZWQgdG8gc29tZSB2YWxpZCBlcnJv
ciBjb2RlIGluc3RlYWQ/DQo+IC0tLQ0KPiAgIG5ldC9jb3JlL2RldmxpbmsuYyB8IDIgKy0NCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9uZXQvY29yZS9kZXZsaW5rLmMgYi9uZXQvY29yZS9kZXZsaW5rLmMNCj4gaW5k
ZXggZDQzYmM1MmI4ODQwZDc2Yi4uOTEzNzdlNGVhZTlhNDNjMSAxMDA2NDQNCj4gLS0tIGEvbmV0
L2NvcmUvZGV2bGluay5jDQo+ICsrKyBiL25ldC9jb3JlL2RldmxpbmsuYw0KPiBAQCAtNDMyMSw4
ICs0MzIxLDggQEAgZGV2bGlua19mbXNnX3ByZXBhcmVfc2tiKHN0cnVjdCBkZXZsaW5rX2Ztc2cg
KmZtc2csIHN0cnVjdCBza19idWZmICpza2IsDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZGV2bGlua19m
bXNnX2l0ZW0gKml0ZW07DQo+ICAgCXN0cnVjdCBubGF0dHIgKmZtc2dfbmxhdHRyOw0KPiArCWlu
dCBlcnIgPSAwOw0KPiAgIAlpbnQgaSA9IDA7DQo+IC0JaW50IGVycjsNCj4gICANCj4gICAJZm1z
Z19ubGF0dHIgPSBubGFfbmVzdF9zdGFydF9ub2ZsYWcoc2tiLCBERVZMSU5LX0FUVFJfRk1TRyk7
DQo+ICAgCWlmICghZm1zZ19ubGF0dHIpDQo+IA0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYWxzYS1kZXZlbAo=
