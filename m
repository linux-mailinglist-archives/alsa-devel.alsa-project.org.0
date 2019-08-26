Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBFA9D24D
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 17:07:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09C3816AD;
	Mon, 26 Aug 2019 17:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09C3816AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566832038;
	bh=M1BAUiNk9Q0o+T/VaNFF7GFEpWBYfZQD8+Rkgvq0eYA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TPsf9ppiJpqUoqaaRT5dmFWnLoRc3eOY/9XL8MEtmFjU/BWp392NVpMkbUe7UAm9L
	 EWcSlY+uiwBMC1eSKkwZiiJv8729N+wT1liOGOX9Kcwy3uuvTjF6wiLcONyHVyJGg3
	 THoj1FcZNnyWiTrItCtZVCoHqJauY5YkIQA2ZXQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34890F80377;
	Mon, 26 Aug 2019 17:05:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 574C5F80362; Mon, 26 Aug 2019 17:05:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa4.microchip.iphmx.com (esa4.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF7B0F80143
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 17:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF7B0F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="JuY1tFJc"
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="Codrin.Ciubotariu@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: i1sKcEeUhIAn4nMp/9tOKpVnkfTIzCL4FsLV7t31ycmlSDd+REnLCoBMmQBKw22kFl2uyGfefT
 v8n85Lzwwv/DkNxVywLee76o+A3QEh4QRKZ43oorSc0ZNUjbCcWgvGdtQWaslbWFH+Wo8XO5dc
 Uqi4hWbMCheSd1uOVSazhVurJT198RmPQ5xlPNUc3DfS4t3CIKcucrkxdylj/qQLnUkK8829oZ
 JPyunYHC2XaMGENmDJ2yhamDz4bjWq9aN79xwLbcofQGe9kywDjaiFrk2ea79eqmUN1UL0VQnC
 IPs=
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="45624507"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Aug 2019 08:05:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Aug 2019 08:05:09 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Aug 2019 08:05:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UMHq+Vg9ut5Fj5k3mOftu37fLbh83Hi9hSyHEpw6bHjTxZaKDFAbxSuzWEEN8Ilx++I02aSbv5tMeQRlB4s/WwfCg1ituG1n0JsICqyhwbkiu1e6l1TK9T0yqCpzc/9qNJkHn68thhLmUtYmYd8solPxi+fUlo25XiHYQfXMC+byiaQiA1LesDQQ55RfahFynCTwO3rlFdSSLHNn/UkMZAALyWRG1GHTwIhhgs4/UJsBPR5Dgf5504NuAE+dTEKR/ECdR3LDx7qW96U3ir8X5ybYng1bMjXB2l5h8HxLHvhU7ZbwjlJ3fhlHIrKQJExgwnjrxTNMuoZNJdGbv8jCAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/OlDYAqsVLFMTdY3Dg0koVIYtCgB1buVFmEATtd668=;
 b=JVMARLfHQEi6ZolFJeFrW8w00da1tDVEoF039YM0G0tI5Z4cm1ZL5Fvg0G2PKhD3MXZO4BPanmFfO010oiF4PVsjx1tsSaJB31L1r0N2S9HWRgFoEE3nCjKrWz5JGBpR/vTwgi7yMXC/jjiRv632M6RipZ16bkVbCWCqDkUe+t0VRryuYafUnyYcHAzgrScKg1A88TEYg+lKY8FlHzfU3Upi+85DJvNMVfh6ysbpwHabpmR+tBmww3bicNQA0J2WBeLbuayZIQ3fboNOyCJUbTtqcV7RdGrGgoswt8CyiMoWCtcw/OrWV9zQ6Xdb23VlBTq4u4KECaek9C5/9Fr+PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/OlDYAqsVLFMTdY3Dg0koVIYtCgB1buVFmEATtd668=;
 b=JuY1tFJc9s209NRgX/yrgcmf7PHNC1HuYHx/tG8Rir9AC6310liYbUF751nMnokoU9hVBbeu8YuHXuDEAj6/3DIUT0MmyHNijetjPlI6bMxPFf4i4S2MXWh18RGfV4jLtzd5l6VbMw1HGx90GoyFiCJbgyxJ+hbmlhAQtHuqG2I=
Received: from BY5PR11MB4497.namprd11.prod.outlook.com (52.132.255.220) by
 BY5PR11MB4419.namprd11.prod.outlook.com (52.132.254.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Mon, 26 Aug 2019 15:05:06 +0000
Received: from BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::14:24b8:9029:c69]) by BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::14:24b8:9029:c69%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 15:05:06 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <mirq-linux@rere.qmqm.pl>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>
Thread-Topic: [PATCH v2 6/6] ASoC: atmel_ssc_dai: Enable shared FSYNC source
 in frame-slave mode
Thread-Index: AQHVWrpMlk4SnjCoTEe8JwCEXpRy8qcNiciA
Date: Mon, 26 Aug 2019 15:05:06 +0000
Message-ID: <a42ede6e-4cc9-6dbf-4c58-71d2298fd3d5@microchip.com>
References: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
 <b56ebac96ad232e2d9871067b13654eb9223f28f.1566677788.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <b56ebac96ad232e2d9871067b13654eb9223f28f.1566677788.git.mirq-linux@rere.qmqm.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0234.eurprd07.prod.outlook.com
 (2603:10a6:802:58::37) To BY5PR11MB4497.namprd11.prod.outlook.com
 (2603:10b6:a03:1cc::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02398ae9-24ba-4dee-f410-08d72a36c78c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR11MB4419; 
x-ms-traffictypediagnostic: BY5PR11MB4419:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB44199BF24647D97FC3617D7AE7A10@BY5PR11MB4419.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(366004)(396003)(39860400002)(346002)(199004)(189003)(229853002)(7736002)(66946007)(66476007)(66556008)(66066001)(256004)(64756008)(66446008)(7416002)(446003)(6486002)(11346002)(186003)(76176011)(52116002)(26005)(305945005)(386003)(6506007)(53546011)(476003)(8936002)(4326008)(81166006)(81156014)(86362001)(2201001)(5660300002)(31696002)(6436002)(25786009)(53936002)(99286004)(6512007)(2906002)(6116002)(3846002)(36756003)(71190400001)(71200400001)(316002)(110136005)(14454004)(54906003)(2501003)(478600001)(8676002)(6246003)(31686004)(2616005)(486006)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4419;
 H:BY5PR11MB4497.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 16TQVWmLnbYw7WyIpqSCt1BP29p8Vx/4ldya0Vy30Gc7c6CWrB16LGzZ05jwoM9zL+0Moa5/7RlsBJeAmrwfed+OcrzLF8zYdqmO53Resly/mz4l+g6PB+ibS8yZTTPs83f2tUivaurRNLA7YUizmFIPW8vxkecfG9L4BhDSPnLK0RMR5+S3xBpo8c15w4PdjvA2SDgIe5wGGiXn6T40G9XJ7VdD4iHt31WkVdphWksf0kI/d+zl/wuv9WFDbwv/FZPIShjd6/GRcmHbBJsWDkdOXR4nfeqox8PHQUoIkKeSwuzpmNsbWtMeSDL8NpPKxJjBkq941mIX/6dxprVuFkJzeG7iqmRmdVKzlTxZXnCnP+mcfFbiDu3uOIz/0pwhHYN346Az8HI/IpCnTAgrbWzbDjJ+vcOdqjnQfjY+Xt0=
Content-ID: <51A4D2C1067F1A4EB790CFCDD9CDF311@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 02398ae9-24ba-4dee-f410-08d72a36c78c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 15:05:06.4736 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XW/gH/1yp8ZtK1n+/ITrurSSU+2TSMVIaad91Asp1mhdx1SBN+rywz4XMDzA1BYWmUE0oH47tudl61+nTJAW1dRZ8I06Lz0nTcosRuZwegY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4419
Cc: mark.rutland@arm.com, alexandre.belloni@bootlin.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com, lgirdwood@gmail.com,
 Ludovic.Desroches@microchip.com, broonie@kernel.org, 3chas3@gmail.com,
 robh-dt@kernel.org, tiwai@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 6/6] ASoC: atmel_ssc_dai: Enable shared
 FSYNC source in frame-slave mode
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

T24gMjQuMDguMjAxOSAyMzoyNiwgTWljaGHFgiBNaXJvc8WCYXcgd3JvdGU6DQo+IFNTQyBkcml2
ZXIgYWxsb3dzIG9ubHkgc3luY2hyb25vdXMgVFggYW5kIFJYLiBJbiBzbGF2ZSBtb2RlIGZvciBC
Q0xLDQo+IGl0IHVzZXMgb25seSBvbmUgb2YgVEsgb3IgUksgcGluLCBidXQgZm9yIExSQ0xLIGl0
IGNvbmZpZ3VyZWQgc2VwYXJhdGUNCj4gaW5wdXRzIGZyb20gVEYgYW5kIFJGIHBpbnMuIEFsbG93
IGNvbmZpZ3VyYXRpb24gd2l0aCBjb21tb24gRlMgc2lnbmFsLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTWljaGHFgiBNaXJvc8WCYXcgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBsPg0KPiANCj4gLS0t
DQo+ICAgdjI6IHVzZSBhbHRlcm5hdGUgRFQgYmluZGluZw0KPiAgICAgICBzcGxpdCBEVCBhbmQg
ZHJpdmVycy9taXNjIGNoYW5nZXMNCj4gDQo+IC0tLQ0KPiAgIHNvdW5kL3NvYy9hdG1lbC9hdG1l
bF9zc2NfZGFpLmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL3NvdW5kL3NvYy9hdG1lbC9hdG1lbF9zc2NfZGFpLmMgYi9zb3VuZC9zb2MvYXRtZWwvYXRt
ZWxfc3NjX2RhaS5jDQo+IGluZGV4IDQ4ZTllZWYzNGMwZi4uMDM1ZDRkYTU4ZjJiIDEwMDY0NA0K
PiAtLS0gYS9zb3VuZC9zb2MvYXRtZWwvYXRtZWxfc3NjX2RhaS5jDQo+ICsrKyBiL3NvdW5kL3Nv
Yy9hdG1lbC9hdG1lbF9zc2NfZGFpLmMNCj4gQEAgLTYwNSwxNCArNjA1LDMyIEBAIHN0YXRpYyBp
bnQgYXRtZWxfc3NjX2h3X3BhcmFtcyhzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVh
bSwNCj4gICAJCXJldHVybiAtRUlOVkFMOw0KPiAgIAl9DQo+ICAgDQo+IC0JaWYgKCFhdG1lbF9z
c2NfY2ZzKHNzY19wKSkgew0KPiArCWlmIChhdG1lbF9zc2NfY2ZzKHNzY19wKSkgew0KPiArCQkv
Kg0KPiArCQkgKiBTU0MgcHJvdmlkZXMgTFJDTEsNCj4gKwkJICoNCj4gKwkJICogQm90aCBURiBh
bmQgUkYgYXJlIGdlbmVyYXRlZCwgc28gdXNlIHRoZW0gZGlyZWN0bHkuDQo+ICsJCSAqLw0KPiAr
CQlyY21yIHw9CSAgU1NDX0JGKFJDTVJfU1RBUlQsIGZzX2VkZ2UpOw0KPiArCQl0Y21yIHw9CSAg
U1NDX0JGKFRDTVJfU1RBUlQsIGZzX2VkZ2UpOw0KDQpIbW0sIGhvdyB3b3VsZCB0aGlzIHdvcmsg
aWYgY2FwdHVyZSBhbmQgcGxheWJhY2sgc3RhcnQvcnVuIGF0IHRoZSBzYW1lIHRpbWU/DQoNCj4g
Kwl9IGVsc2Ugew0KPiAgIAkJZnNsZW4gPSBmc2xlbl9leHQgPSAwOw0KPiAgIAkJcmNtcl9wZXJp
b2QgPSB0Y21yX3BlcmlvZCA9IDA7DQo+ICAgCQlmc19vc3luYyA9IFNTQ19GU09TX05PTkU7DQo+
IC0JfQ0KPiAgIA0KPiAtCXJjbXIgfD0JICBTU0NfQkYoUkNNUl9TVEFSVCwgZnNfZWRnZSk7DQo+
IC0JdGNtciB8PQkgIFNTQ19CRihUQ01SX1NUQVJULCBmc19lZGdlKTsNCj4gKwkJaWYgKHNzYy0+
bHJjbGtfZnJvbV90Zl9waW4pIHsNCj4gKwkJCXJjbXIgfD0JICBTU0NfQkYoUkNNUl9TVEFSVCwg
U1NDX1NUQVJUX1RYX1JYKTsNCj4gKwkJCXRjbXIgfD0JICBTU0NfQkYoVENNUl9TVEFSVCwgZnNf
ZWRnZSk7DQo+ICsJCX0gZWxzZSBpZiAoc3NjLT5scmNsa19mcm9tX3JmX3Bpbikgew0KPiArCQkJ
LyogYXNzdW1lIFJGIGlzIHRvIGJlIHVzZWQgd2hlbiBSSyBpcyB1c2VkIGFzIEJDTEsgaW5wdXQg
Ki8NCg0KVGhpcyBjb21tZW50IGlzIG5vdCBsb25nZXIgdHJ1ZS4uLg0KDQo+ICsJCQkvKiBOb3Rl
OiB3b24ndCB3b3JrIGNvcnJlY3RseSBvbiBTQU1BNUQyIGR1ZSB0byBlcnJhdGEgKi8NCj4gKwkJ
CXJjbXIgfD0JICBTU0NfQkYoUkNNUl9TVEFSVCwgZnNfZWRnZSk7DQo+ICsJCQl0Y21yIHw9CSAg
U1NDX0JGKFRDTVJfU1RBUlQsIFNTQ19TVEFSVF9UWF9SWCk7DQo+ICsJCX0gZWxzZSB7DQo+ICsJ
CQlyY21yIHw9CSAgU1NDX0JGKFJDTVJfU1RBUlQsIGZzX2VkZ2UpOw0KPiArCQkJdGNtciB8PQkg
IFNTQ19CRihUQ01SX1NUQVJULCBmc19lZGdlKTsNCj4gKwkJfQ0KPiArCX0NCj4gICANCj4gICAJ
aWYgKGF0bWVsX3NzY19jYnMoc3NjX3ApKSB7DQo+ICAgCQkvKg0KPiANCg0KVGhhbmtzIGFuZCBi
ZXN0IHJlZ2FyZHMsDQpDb2RyaW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
