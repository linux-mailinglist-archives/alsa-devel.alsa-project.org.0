Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A40375213
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 17:04:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E7E81B67;
	Thu, 25 Jul 2019 17:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E7E81B67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564067071;
	bh=JOieN/8JtAEqTtuc/8d0GL7rnNzUBVIZsI/cbGfCXlE=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HLeLpFI6vQWitL+7pz6cxVnHr9opKXgcLANcIAsY+BtsTqKgSXCgzxClj6SgXL7hD
	 tgPJpolmyBJXV5rdnmQm6bb77uey2qQ4VPysI/smRofQq9Sa1nPsJbSSMJkas7ZuHU
	 0Qk/4tFUvz6rfw6r5TSWBI0lM5RpWlPbNg+WbEsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B015F8015A;
	Thu, 25 Jul 2019 17:02:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE5DFF803D0; Thu, 25 Jul 2019 17:02:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from esa6.microchip.iphmx.com (esa6.microchip.iphmx.com
 [216.71.154.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36112F8015A
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 17:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36112F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="PujsLIr+"
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="Codrin.Ciubotariu@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: TIaWrgQVIpUHlOcSpoIcW1SbkyeVrBNpvZGrkg6MHtdYZe5fkp3tKiEaajx960U2D4raclZjoq
 cqEj4StvnwT53T72RwSk4wWn7TfWvR2M5840FyDWRfXeWugMZI6iMaWHRIKaPvTEeVOE/QaB/0
 W1p+cZuwStvPqOyNReffzR3gbcdpsfXUEc+PBGBShMtD4Jq/j8GSQAfYZBMMd2ojX/FbDeE+rY
 ybGXj43/QO5B1sU2DMq37WX2Z0Kn061FwL8SCQ092+IFQ8xw/nBT+ngRJD0OEpe6uQ8zA+/Xm+
 mOc=
X-IronPort-AV: E=Sophos;i="5.64,307,1559545200"; d="scan'208";a="39701269"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Jul 2019 08:02:36 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 25 Jul 2019 08:02:36 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 25 Jul 2019 08:02:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M33QI9AOC0h6EyKW2l9HRlxalZwNuMYSx23IOHax9TrlN1pX5vCY0QjL8TYY0zwF+h+axQuZRITp3c6T20zGSGTg05Kfs8ZBkMbx2ZZQ9YyNDS85Fk48BRzetzuo9fo9SbFPR8iEhn0j0Ms7cB3COO2BAOltb7c9oDAlOltx1u3RULRpisWLkOGhrvOP0uA92xXHQxej7Hv5EtNClLF1BiWMSaWyl3SCifJdzty90M/Z4ZCmo+yMxzOQTYTKWKHi9HmLTHBPVSaS3thIkcTIXLB/YFs2xqBgy5MjD3WtPr8BS9/ux2aoXNxLOpvEsIiiguNFVG1eM/BJ6HLuwFJlDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhHTjwrjw0yskm0m8cRzm1lKigXuJ/SaVrWsOVSHOYM=;
 b=ocF7hpAvS4OkG9f0Mh1JdQAD9FFjCE76rOGubZUTr5uuX8RkN2n6iEI6y5fVNRx9hUPfLkpwrc3uAXN8ioFttd1HXAYTZjeHULoCn9cSXYWT7YQ18rYUQad+Zig3OCua33ibyczbEPNq8AoQy4fGSN21iAe194A1PwJKsN3uDb/DdVFRq8H8+rysM4PLtIsMxKwyH8mJgza1Hh8afxtvjtvPTiRo95UB7GlVXYhbhlaVsrUBdK+4EQlnZDNZ4b9ypDAybox4wAM9b1ctD/AI9AfOmzlkGsLO3aBO2o2z3XUmnREqmS037tIU5yPG0jY+/NMdsG8bTk7sS2Vqg/yf6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DhHTjwrjw0yskm0m8cRzm1lKigXuJ/SaVrWsOVSHOYM=;
 b=PujsLIr+0qJp3zcOe6VNewPEMYcdaf+av6IzewS3sXdlrZdv4oJa1MtdE7XoT4QAgwXTKAh0+rM5XsOsLXN/9U/Q7TNp7VddwTpOzFBhTZ5GEVI/VxsAcC+8EZkZEN8aHGwHHKNJiYqb0t1DID3Ebr6dZLN2kc+LamE5iJSTrHE=
Received: from BN6PR11MB0051.namprd11.prod.outlook.com (10.161.153.153) by
 BN6PR11MB1844.namprd11.prod.outlook.com (10.175.99.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 15:02:34 +0000
Received: from BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::7972:d14b:4c60:adb2]) by BN6PR11MB0051.namprd11.prod.outlook.com
 ([fe80::7972:d14b:4c60:adb2%3]) with mapi id 15.20.2094.013; Thu, 25 Jul 2019
 15:02:34 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <mirq-linux@rere.qmqm.pl>, <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH 5/5] ASoC: atmel_ssc_dai: Enable shared FSYNC source in
 frame-slave mode
Thread-Index: AQHVQLst19iR+YHt2kqsWucS2TVH/qbbcnMA
Date: Thu, 25 Jul 2019 15:02:34 +0000
Message-ID: <eabb96e7-1567-3ee1-a00e-f241c5f23c1c@microchip.com>
References: <cover.1563819483.git.mirq-linux@rere.qmqm.pl>
 <107e0cfd11a31ce1558e941612e183100022930d.1563819483.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <107e0cfd11a31ce1558e941612e183100022930d.1563819483.git.mirq-linux@rere.qmqm.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0070.namprd07.prod.outlook.com
 (2603:10b6:a03:60::47) To BN6PR11MB0051.namprd11.prod.outlook.com
 (2603:10b6:405:65::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5943b88-f3a4-4a91-7399-08d711111fd5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB1844; 
x-ms-traffictypediagnostic: BN6PR11MB1844:
x-microsoft-antispam-prvs: <BN6PR11MB1844E75FBF004CC3F50B616BE7C10@BN6PR11MB1844.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(39860400002)(366004)(136003)(346002)(189003)(199004)(2906002)(6436002)(229853002)(8676002)(36756003)(6512007)(31696002)(71200400001)(6486002)(71190400001)(66556008)(2501003)(31686004)(476003)(66476007)(66446008)(7736002)(86362001)(11346002)(64756008)(99286004)(68736007)(2616005)(8936002)(66946007)(446003)(316002)(54906003)(186003)(305945005)(26005)(6506007)(81156014)(52116002)(4326008)(6246003)(256004)(81166006)(76176011)(386003)(25786009)(53936002)(14454004)(102836004)(3846002)(53546011)(5660300002)(478600001)(110136005)(6116002)(66066001)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1844;
 H:BN6PR11MB0051.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QcyTWJwsZkNGHNGQ0b02b4352WmlRP8t+hyCQzHAxpIgh5I0zypwLg4KIrVvAzm98CSxkkZDQtuIdQv75HKylPN5dx/qsjjm6Bxhxj35CI7W4rp/WXnObVdKks7WfYnM5tb/H1jdtCXBqhwasaVM9RkcytenlXNTUZd7z69qod0yRA+IxHLwCcMTjU99ZTeRxtB0c0RCU4srS5nZerZ2qfC8xdXl94dv/5UwDZTwy78HoXqqnRS1ucCAtz7H1bP18D2urv8H4Dk6zMP5WAm1Tu1ZXoIcKNymNPB+PGx3DAD7mcx5Wb7Cl4KirHsY/jKkqjA85By3XNbLIbBf2sE/ulYgNR567rbtiq7BpYWSW69GY+UlUwJz+4ykaIy1m1aMGUPnzhiz50HjlpE3bMlTKLc2xX84ESzFbDBwdbIga3A=
Content-ID: <395E8AB10E444C4797C229A7CE45F668@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b5943b88-f3a4-4a91-7399-08d711111fd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 15:02:34.6340 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Codrin.Ciubotariu@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1844
Cc: alexandre.belloni@bootlin.com, lgirdwood@gmail.com, tiwai@suse.com,
 Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 5/5] ASoC: atmel_ssc_dai: Enable shared
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

T24gMjIuMDcuMjAxOSAyMToyNywgTWljaGHFgiBNaXJvc8WCYXcgd3JvdGU6DQo+IFNTQyBkcml2
ZXIgYWxsb3dzIG9ubHkgc3luY2hyb25vdXMgVFggYW5kIFJYLiBJbiBzbGF2ZSBtb2RlIGZvciBC
Q0xLDQo+IGl0IHVzZXMgb25seSBvbmUgb2YgVEsgb3IgUksgcGluLCBidXQgZm9yIExSQ0xLIGl0
IGNvbmZpZ3VyZWQgc2VwYXJhdGUNCj4gaW5wdXRzIGZyb20gVEYgYW5kIFJGIHBpbnMuIEFsbG93
IGNvbmZpZ3VyYXRpb24gd2l0aCBjb21tb24gRlMgc2lnbmFsLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTWljaGHFgiBNaXJvc8WCYXcgPG1pcnEtbGludXhAcmVyZS5xbXFtLnBsPg0KPiAtLS0NCj4g
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9taXNjL2F0bWVsLXNzYy50eHQgICAgfCAgNCArKw0K
PiAgIGRyaXZlcnMvbWlzYy9hdG1lbC1zc2MuYyAgICAgICAgICAgICAgICAgICAgICB8ICAyICsN
Cj4gICBpbmNsdWRlL2xpbnV4L2F0bWVsLXNzYy5oICAgICAgICAgICAgICAgICAgICAgfCAgMSAr
DQo+ICAgc291bmQvc29jL2F0bWVsL2F0bWVsX3NzY19kYWkuYyAgICAgICAgICAgICAgIHwgNDgg
KysrKysrKysrKysrLS0tLS0tLQ0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygr
KSwgMTcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21pc2MvYXRtZWwtc3NjLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9taXNjL2F0bWVsLXNzYy50eHQNCj4gaW5kZXggZjlmYjQxMjY0MmZlLi44
OTEzM2M1YjgyY2IgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9taXNjL2F0bWVsLXNzYy50eHQNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21pc2MvYXRtZWwtc3NjLnR4dA0KPiBAQCAtMjQsNiArMjQsMTAgQEAgT3B0aW9u
YWwgcHJvcGVydGllczoNCj4gICAgICAgICAgdGhpcyBwYXJhbWV0ZXIgdG8gY2hvb3NlIHdoZXJl
IHRoZSBjbG9jayBmcm9tLg0KPiAgICAgICAgLSBCeSBkZWZhdWx0IHRoZSBjbG9jayBpcyBmcm9t
IFRLIHBpbiwgaWYgdGhlIGNsb2NrIGZyb20gUksgcGluLCB0aGlzDQo+ICAgICAgICAgIHByb3Bl
cnR5IGlzIG5lZWRlZC4NCj4gKyAgLSBhdG1lbCxzaGFyZWQtZnMtcGluOiBib29sIHByb3BlcnR5
Lg0KPiArICAgICAtIFdoZW4gU1NDIHdvcmtzIGluIHNsYXZlIG1vZGUsIGJ5IGRlZmF1bHQgaXQg
Z2V0cyBzZXBhcmF0ZSBMUkNMSyBzaWduYWxzDQo+ICsgICAgICAgZnJvbSBSRiBhbmQgVEYuIFRo
aXMgcHJvcGVydHkgbWFrZXMgU1NDIHVzZSBhIHNpbmdsZSBwaW4gZm9yIGJvdGgNCj4gKyAgICAg
ICBSWCBhbmQgVFguIFRGIGlzIHVzZWQgdW5sZXNzIGF0bWVsLGNsay1mcm9tLXJrLXBpbiBpcyBh
bHNvIHByZXNlbnQuDQo+ICAgICAtICNzb3VuZC1kYWktY2VsbHM6IFNob3VsZCBjb250YWluIDww
Pi4NCj4gICAgICAgIC0gVGhpcyBwcm9wZXJ0eSBtYWtlcyB0aGUgU1NDIGludG8gYW4gYXV0b21h
dGljYWxseSByZWdpc3RlcmVkIERBSS4NCg0KdGhlIGJpbmRpbmcgY2hhbmdlcyBzaG91bGQgYmUg
c2VudCBpbiBhIHNlcGFyYXRlIHBhdGNoLCBwbGVhc2Ugc2VlIA0KRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmctcGF0Y2hlcy50eHQgZm9yIGRldGFpbHMuDQoNCj4g
ICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9hdG1lbC1zc2MuYyBiL2RyaXZlcnMvbWlz
Yy9hdG1lbC1zc2MuYw0KPiBpbmRleCBhYjQxNDRlYTFmMTEuLmRhNjNlZWUxY2RmNSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9taXNjL2F0bWVsLXNzYy5jDQo+ICsrKyBiL2RyaXZlcnMvbWlzYy9h
dG1lbC1zc2MuYw0KPiBAQCAtMjEwLDYgKzIxMCw4IEBAIHN0YXRpYyBpbnQgc3NjX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgCQlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
ID0gcGRldi0+ZGV2Lm9mX25vZGU7DQo+ICAgCQlzc2MtPmNsa19mcm9tX3JrX3BpbiA9DQo+ICAg
CQkJb2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiYXRtZWwsY2xrLWZyb20tcmstcGluIik7DQo+
ICsJCXNzYy0+c2hhcmVkX2ZzX3BpbiA9DQo+ICsJCQlvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobnAs
ICJhdG1lbCxzaGFyZWQtZnMtcGluIik7DQo+ICAgCX0NCj4gICANCj4gICAJcmVncyA9IHBsYXRm
b3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L2F0bWVsLXNzYy5oIGIvaW5jbHVkZS9saW51eC9hdG1lbC1zc2MuaA0K
PiBpbmRleCA2MDkxZDJhYmMxZWIuLjQ2ZmRmZjJkZmJiMCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVk
ZS9saW51eC9hdG1lbC1zc2MuaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L2F0bWVsLXNzYy5oDQo+
IEBAIC0yMSw2ICsyMSw3IEBAIHN0cnVjdCBzc2NfZGV2aWNlIHsNCj4gICAJaW50CQkJdXNlcjsN
Cj4gICAJaW50CQkJaXJxOw0KPiAgIAlib29sCQkJY2xrX2Zyb21fcmtfcGluOw0KPiArCWJvb2wJ
CQlzaGFyZWRfZnNfcGluOw0KPiAgIAlib29sCQkJc291bmRfZGFpOw0KPiAgIH07DQoNClRoZXNl
IGNoYW5nZXMgc2hvdWxkIGFsc28gYmUgaW4gYSBzZXBhcmF0ZSBwYXRjaCwgc2luY2UgZHJpdmVy
cy9taXNjLyogDQpmaWxlcyBhcmUgaW4gYSBkaWZmZXJlbnQgc3Vic3lzdGVtLCB3aXRoIGRpZmZl
cmVudCBtYWludGFpbmVycy4NCg0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVs
L2F0bWVsX3NzY19kYWkuYyBiL3NvdW5kL3NvYy9hdG1lbC9hdG1lbF9zc2NfZGFpLmMNCj4gaW5k
ZXggY2YyY2ZjMzQ1Njc2Li42ZjU5NWE3NDg2MTggMTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3NvYy9h
dG1lbC9hdG1lbF9zc2NfZGFpLmMNCj4gKysrIGIvc291bmQvc29jL2F0bWVsL2F0bWVsX3NzY19k
YWkuYw0KPiBAQCAtNDcxLDcgKzQ3MSw3IEBAIHN0YXRpYyBpbnQgYXRtZWxfc3NjX2h3X3BhcmFt
cyhzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwNCj4gICAJaW50IGRpciwgY2hh
bm5lbHMsIGJpdHM7DQo+ICAgCXUzMiB0Zm1yLCByZm1yLCB0Y21yLCByY21yOw0KPiAgIAlpbnQg
cmV0Ow0KPiAtCWludCBmc2xlbiwgZnNsZW5fZXh0LCBmc19vc3luYzsNCj4gKwlpbnQgZnNsZW4s
IGZzbGVuX2V4dCwgZnNfb3N5bmMsIGZzX2VkZ2U7DQo+ICAgCXUzMiBjbXJfZGl2Ow0KPiAgIAl1
MzIgdGNtcl9wZXJpb2Q7DQo+ICAgCXUzMiByY21yX3BlcmlvZDsNCj4gQEAgLTU2NywyNCArNTY3
LDIwIEBAIHN0YXRpYyBpbnQgYXRtZWxfc3NjX2h3X3BhcmFtcyhzdHJ1Y3Qgc25kX3BjbV9zdWJz
dHJlYW0gKnN1YnN0cmVhbSwNCj4gICAJY2FzZSBTTkRfU09DX0RBSUZNVF9MRUZUX0o6DQo+ICAg
CQkvKiBsZWZ0LWp1c3RpZmllZCBmb3JtYXQgKi8NCj4gICAJCWZzX29zeW5jID0gU1NDX0ZTT1Nf
UE9TSVRJVkU7DQo+ICsJCWZzX2VkZ2UgPSBTU0NfU1RBUlRfUklTSU5HX1RGOw0KPiAgIA0KPiAt
CQlyY21yID0JICBTU0NfQkYoUkNNUl9TVFRETFksIDApDQo+IC0JCQl8IFNTQ19CRihSQ01SX1NU
QVJULCBTU0NfU1RBUlRfUklTSU5HX1JGKTsNCj4gLQ0KPiAtCQl0Y21yID0JICBTU0NfQkYoVENN
Ul9TVFRETFksIDApDQo+IC0JCQl8IFNTQ19CRihUQ01SX1NUQVJULCBTU0NfU1RBUlRfUklTSU5H
X1RGKTsNCj4gKwkJcmNtciA9CSAgU1NDX0JGKFJDTVJfU1RURExZLCAwKTsNCj4gKwkJdGNtciA9
CSAgU1NDX0JGKFRDTVJfU1RURExZLCAwKTsNCj4gICANCj4gICAJCWJyZWFrOw0KPiAgIA0KPiAg
IAljYXNlIFNORF9TT0NfREFJRk1UX0kyUzoNCj4gICAJCS8qIEkyUyBmb3JtYXQgPSBsZWZ0LWp1
c3RpZmllZCB3aXRoIHN0YXJ0IGJpdCBhbmQgaW52ZXJ0ZWQgTFJDTEsgKi8NCj4gICAJCWZzX29z
eW5jID0gU1NDX0ZTT1NfTkVHQVRJVkU7DQo+ICsJCWZzX2VkZ2UgPSBTU0NfU1RBUlRfRkFMTElO
R19URjsNCj4gICANCj4gLQkJcmNtciA9CSAgU1NDX0JGKFJDTVJfU1RURExZLCAxKQ0KPiAtCQkJ
fCBTU0NfQkYoUkNNUl9TVEFSVCwgU1NDX1NUQVJUX0ZBTExJTkdfUkYpOw0KPiAtDQo+IC0JCXRj
bXIgPQkgIFNTQ19CRihUQ01SX1NUVERMWSwgMSkNCj4gLQkJCXwgU1NDX0JGKFRDTVJfU1RBUlQs
IFNTQ19TVEFSVF9GQUxMSU5HX1RGKTsNCj4gKwkJcmNtciA9CSAgU1NDX0JGKFJDTVJfU1RURExZ
LCAxKTsNCj4gKwkJdGNtciA9CSAgU1NDX0JGKFRDTVJfU1RURExZLCAxKTsNCj4gICANCj4gICAJ
CWJyZWFrOw0KPiAgIA0KPiBAQCAtNTk3LDEzICs1OTMsMTEgQEAgc3RhdGljIGludCBhdG1lbF9z
c2NfaHdfcGFyYW1zKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLA0KPiAgIAkJ
ICogdGhlIGxlZnQgY2hhbm5lbCBkYXRhLg0KPiAgIAkJICovDQo+ICAgCQlmc19vc3luYyA9IFNT
Q19GU09TX1BPU0lUSVZFOw0KPiArCQlmc19lZGdlID0gU1NDX1NUQVJUX1JJU0lOR19URjsNCj4g
ICAJCWZzbGVuID0gZnNsZW5fZXh0ID0gMDsNCj4gICANCj4gLQkJcmNtciA9CSAgU1NDX0JGKFJD
TVJfU1RURExZLCAxKQ0KPiAtCQkJfCBTU0NfQkYoUkNNUl9TVEFSVCwgU1NDX1NUQVJUX1JJU0lO
R19SRik7DQo+IC0NCj4gLQkJdGNtciA9CSAgU1NDX0JGKFRDTVJfU1RURExZLCAxKQ0KPiAtCQkJ
fCBTU0NfQkYoVENNUl9TVEFSVCwgU1NDX1NUQVJUX1JJU0lOR19URik7DQo+ICsJCXJjbXIgPQkg
IFNTQ19CRihSQ01SX1NUVERMWSwgMSk7DQo+ICsJCXRjbXIgPQkgIFNTQ19CRihUQ01SX1NUVERM
WSwgMSk7DQo+ICAgDQo+ICAgCQlicmVhazsNCj4gICANCj4gQEAgLTYxMywxMCArNjA3LDMwIEBA
IHN0YXRpYyBpbnQgYXRtZWxfc3NjX2h3X3BhcmFtcyhzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0g
KnN1YnN0cmVhbSwNCj4gICAJCXJldHVybiAtRUlOVkFMOw0KPiAgIAl9DQo+ICAgDQo+IC0JaWYg
KCFhdG1lbF9zc2NfY2ZzKHNzY19wKSkgew0KPiArCWlmIChhdG1lbF9zc2NfY2ZzKHNzY19wKSkg
ew0KPiArCQkvKg0KPiArCQkgKiBTU0MgcHJvdmlkZXMgTFJDTEsNCj4gKwkJICoNCj4gKwkJICog
Qm90aCBURiBhbmQgUkYgYXJlIGdlbmVyYXRlZCwgc28gdXNlIHRoZW0gZGlyZWN0bHkuDQo+ICsJ
CSAqLw0KPiArCQlyY21yIHw9CSAgU1NDX0JGKFJDTVJfU1RBUlQsIGZzX2VkZ2UpOw0KPiArCQl0
Y21yIHw9CSAgU1NDX0JGKFRDTVJfU1RBUlQsIGZzX2VkZ2UpOw0KPiArCX0gZWxzZSB7DQo+ICAg
CQlmc2xlbiA9IGZzbGVuX2V4dCA9IDA7DQo+ICAgCQlyY21yX3BlcmlvZCA9IHRjbXJfcGVyaW9k
ID0gMDsNCj4gICAJCWZzX29zeW5jID0gU1NDX0ZTT1NfTk9ORTsNCj4gKwkJaWYgKCFzc2MtPnNo
YXJlZF9mc19waW4pIHsNCj4gKwkJCXJjbXIgfD0JICBTU0NfQkYoUkNNUl9TVEFSVCwgZnNfZWRn
ZSk7DQo+ICsJCQl0Y21yIHw9CSAgU1NDX0JGKFRDTVJfU1RBUlQsIGZzX2VkZ2UpOw0KPiArCQl9
IGVsc2UgaWYgKHNzYy0+Y2xrX2Zyb21fcmtfcGluKSB7DQo+ICsJCQkvKiBhc3N1bWUgUkYgaXMg
dG8gYmUgdXNlZCB3aGVuIFJLIGlzIHVzZWQgYXMgQkNMSyBpbnB1dCAqLw0KPiArCQkJLyogTm90
ZTogd29uJ3Qgd29yayBjb3JyZWN0bHkgb24gU0FNQTVEMiBkdWUgdG8gZXJyYXRhICovDQo+ICsJ
CQlyY21yIHw9CSAgU1NDX0JGKFJDTVJfU1RBUlQsIGZzX2VkZ2UpOw0KPiArCQkJdGNtciB8PQkg
IFNTQ19CRihUQ01SX1NUQVJULCBTU0NfU1RBUlRfUkVDRUlWRSk7DQoNCkRpZCB5b3UgZmluZCBh
IHBsYXRmb3JtIGluIHdoaWNoIHRoaXMgbW9kZSB3b3Jrcz8NCg0KPiArCQl9IGVsc2Ugew0KPiAr
CQkJcmNtciB8PQkgIFNTQ19CRihSQ01SX1NUQVJULCBTU0NfU1RBUlRfVFJBTlNNSVQpOw0KPiAr
CQkJdGNtciB8PQkgIFNTQ19CRihUQ01SX1NUQVJULCBmc19lZGdlKTsNCj4gKwkJfQ0KPiAgIAl9
DQo+ICAgDQo+ICAgCWlmIChhdG1lbF9zc2NfY2JzKHNzY19wKSkgew0KPiANCg0KSSBsaWtlIHRo
aXMgZmVhdHVyZSwganVzdCBzZXBhcmF0ZSB0aGUgY2hhbmdlcyBpbiBkaWZmZXJlbnQgcGF0Y2hl
cy4NCg0KVGhhbmtzIGFuZCBiZXN0IHJlZ2FyZHMsDQpDb2RyaW4NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
