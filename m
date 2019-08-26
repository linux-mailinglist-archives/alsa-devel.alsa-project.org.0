Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E56E9D1D4
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 16:40:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C3151690;
	Mon, 26 Aug 2019 16:39:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C3151690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566830416;
	bh=rHpf8Wgmw6+jx6sXnTHI2d/Nbs0ggKMxQHZCOPy9DHM=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZgXnoS5oGKaqVSkmyO1zz2T2WmELgbYnoPAPZzfE08DgpVPde1j8pJQRYISkWnGC1
	 HW2zBL864yOecuR101uOFhr/QVBUwOAwpAVJU3MMHEkcDB+JG0rZQzzk/enw9FePbD
	 4E1R4BdkDAT3PBKlwzAILg17f/6Y5z9UKPUd6vYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EEA51F80377;
	Mon, 26 Aug 2019 16:38:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FE0AF80362; Mon, 26 Aug 2019 16:38:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa1.microchip.iphmx.com (esa1.microchip.iphmx.com
 [68.232.147.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6EDBF801ED
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 16:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6EDBF801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="rcCYr7ef"
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Codrin.Ciubotariu@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="Codrin.Ciubotariu@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Codrin.Ciubotariu@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Codrin.Ciubotariu@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: PMfF54VrtH3fiz8e/6h/l2eKoNyOXmHbW3wz0TwkNe7mREq8agcrKFY1eTgVgVkDimSSfMfTCY
 Y9UVRNifvjDVGXdDPVRYfjE3WvLfDvn1+8pAUHmj/XQtjUqP4AXxff7c+TuDpvJE/cjrPod8KI
 chTLQeYUrrNphE6lQ0IEudrLBQtXGj48zJ7qlFZnFf562y0Uw1n/i7GWLginCo/Y4PMxwwXIUL
 k95Bho32M90sUFEVLKc99Fg/17DHKRA0HlXEyH995uv2ntktOPtn3Yw3LpHRu2kFNsceJm71Ez
 oZ8=
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="47989836"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Aug 2019 07:38:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 26 Aug 2019 07:38:20 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 26 Aug 2019 07:38:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQsQxEB5lol7Yvfzty1PkLdIvCnwWs9zHJ3PllY3tJa4pmmaaLsLaLzucfw2MTmqybntB/quMd3ODMUfiVtmVuD0EyabG4x/Si5Z56I4iJaKr8QFd6cJjDeKueSBxYushWWML8zs4lEkrAJe1VWSZ9W+jj5EkFePif+VMsdv2GfXM12/MRvIu3wH7DHhMJ7kVrCubEVZgrz7H5GyRxbw4sizv6Osp3B0yga9ucfqgULHlVAxzVvVZN8jKzEmCc6CDa6LYioVS/Fm0GEml945JZmLgQS8nbRfH2S6yc2XsnKiY5PTqYAfWAHagNY646g0H3y37sYA7I/mBGDLWrhxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZzyNSuA50hOak86zUXS80g6SEbAn8U1kiUn4ZaqSqA=;
 b=LSnrGkA4fASthg3iV211qekEvnOPufPa23lt0cysSK8IZr4vDycRSaUOkfGQ10edXwkMf/z31hPij15dzW0QvxdaAdvOMZb5AenlMSAH0nIH6RCzCVoFq9q6Has4BKJ3FIbT57bt6+No8Ow1m1Rv0Px2wj02OpTZvU2K/3QyUH8cQoWxCdlKf2Y/FRvRYyYnaZzVCUx78/KHCgnaZeftt3Ux1HzMZldO9nEK41grvRhYvfnwz0yQaRYH0OtenladsOUiNjoZ5oLTjo3I5NgyzTdk3rYzEox+tRWl+BIH6C3iC+WjKC3Zig53cvq1zRrl8G+ZWkRpWLHDySUKOs712g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZzyNSuA50hOak86zUXS80g6SEbAn8U1kiUn4ZaqSqA=;
 b=rcCYr7ef6ZzTqs6lipTe0zIrELoSV63uBpkv8P+5VHqFKmie33+Hc/A/au0ImsGD3oCI5w+CEhTNBPESfPgME8QMcC7zZj/9ltDsjycla+6ubYkxME31f8JdWWQdDYYekzYwJxf8d07yzb+piONG/HoziifaspcGxUCorgZ7zwA=
Received: from BY5PR11MB4497.namprd11.prod.outlook.com (52.132.255.220) by
 BY5PR11MB4258.namprd11.prod.outlook.com (52.132.254.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Mon, 26 Aug 2019 14:38:17 +0000
Received: from BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::14:24b8:9029:c69]) by BY5PR11MB4497.namprd11.prod.outlook.com
 ([fe80::14:24b8:9029:c69%7]) with mapi id 15.20.2199.021; Mon, 26 Aug 2019
 14:38:17 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <mirq-linux@rere.qmqm.pl>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>
Thread-Topic: [PATCH v2 5/6] misc: atmel-ssc: get LRCLK pin selection from DT
Thread-Index: AQHVWrpLsarueKwUH0+T0VGyCb2x16cNgkmA
Date: Mon, 26 Aug 2019 14:38:17 +0000
Message-ID: <5174bac2-294d-177a-b30c-6a7326820bfb@microchip.com>
References: <cover.1566677788.git.mirq-linux@rere.qmqm.pl>
 <5f1fd1b8f646c5ced1d838c381b6973e5abccd53.1566677788.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <5f1fd1b8f646c5ced1d838c381b6973e5abccd53.1566677788.git.mirq-linux@rere.qmqm.pl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0149.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::27) To BY5PR11MB4497.namprd11.prod.outlook.com
 (2603:10b6:a03:1cc::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9218897d-3dd6-482b-bf8b-08d72a33089f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR11MB4258; 
x-ms-traffictypediagnostic: BY5PR11MB4258:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB42583996DAB09E7F7DC66BCCE7A10@BY5PR11MB4258.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(136003)(39860400002)(366004)(396003)(189003)(199004)(4326008)(86362001)(6436002)(2906002)(76176011)(31696002)(486006)(305945005)(71190400001)(71200400001)(2201001)(52116002)(53936002)(110136005)(54906003)(81166006)(25786009)(31686004)(81156014)(446003)(7416002)(478600001)(8676002)(316002)(14454004)(386003)(7736002)(6506007)(66946007)(53546011)(229853002)(66446008)(64756008)(66556008)(6246003)(11346002)(476003)(2501003)(36756003)(102836004)(2616005)(8936002)(186003)(6116002)(3846002)(6512007)(6486002)(5660300002)(99286004)(66066001)(26005)(256004)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4258;
 H:BY5PR11MB4497.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TwcWAC4ZSJIbIgC0LXxPebmZ17u7p4cFmWeiGJrYo0sYHkKkTf8+Co6FeUgpxKmGfIbYk4gizktLksdjbXT44pHfHgMeFrR5wfWNAKNgi912sdl+ghCRoWW/kqFTeaT8FUrKAzr9M07pW4knAc6oeVjkZgwaBQzi7pR4S6wTvEZnHC5b/wNdeeEHPAHOr6DOKRvHV52RqfhXWugmEUYDBuyn2Q9Y/Xlnjnp2xQvPLj60nNfJyoRPBv3s7yp4o2I+5sliyK1KJRNmy8iYofhqeSbi7QEBs0lpCBrYYiKgXKysFc0/SjdrMkTd85/49hJfYnu8+4d9udmMOGEk0HWEBbEVZMrxaDIFBh3n3wxclhmBu3mCjmbtHycja0SOGXVmv7OUHLejy+Iayv1iqZHaIGB+4niLsIg3X7g44vd/9eo=
Content-ID: <22A5BB8587FCE34A9D008F56EDF2B7A0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9218897d-3dd6-482b-bf8b-08d72a33089f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 14:38:17.4968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZC1Msbx6I5t6X8B1NhNPV4EWBo7rvVqLmy+Db4/YL7x68lrzkoUP5k4+rYWICiYZQ1kYSpEzLf5KuUH5QkykPR5HhUvdnBfmF6FJH8UhuQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4258
Cc: mark.rutland@arm.com, alexandre.belloni@bootlin.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com, lgirdwood@gmail.com,
 Ludovic.Desroches@microchip.com, broonie@kernel.org, 3chas3@gmail.com,
 robh-dt@kernel.org, tiwai@suse.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 5/6] misc: atmel-ssc: get LRCLK pin
	selection from DT
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

T24gMjQuMDguMjAxOSAyMzoyNiwgTWljaGHFgiBNaXJvc8WCYXcgd3JvdGU6DQo+IFN0b3JlIExS
Q0xLIHBpbiBzZWxlY3Rpb24gZm9yIHVzZSBieSBBU29DIERBSSBkcml2ZXIuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBNaWNoYcWCIE1pcm9zxYJhdyA8bWlycS1saW51eEByZXJlLnFtcW0ucGw+DQoN
ClJldmlld2VkLWJ5OiBDb2RyaW4gQ2l1Ym90YXJpdSA8Y29kcmluLmNpdWJvdGFyaXVAbWljcm9j
aGlwLmNvbT4NCg0KVGhhbmtzIGFuZCBiZXN0IHJlZ2FyZHMsDQpDb2RyaW4NCg0KPiANCj4gLS0t
DQo+ICAgIHYyOiBzcGxpdCBmcm9tIEFTb0MgaW1wbGVtZW50YXRpb24NCj4gDQo+IC0tLQ0KPiAg
IGRyaXZlcnMvbWlzYy9hdG1lbC1zc2MuYyAgfCA5ICsrKysrKysrKw0KPiAgIGluY2x1ZGUvbGlu
dXgvYXRtZWwtc3NjLmggfCAyICsrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL2F0bWVsLXNzYy5jIGIvZHJpdmVy
cy9taXNjL2F0bWVsLXNzYy5jDQo+IGluZGV4IGFiNDE0NGVhMWYxMS4uMTMyMmUyOWJjMzdhIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL21pc2MvYXRtZWwtc3NjLmMNCj4gKysrIGIvZHJpdmVycy9t
aXNjL2F0bWVsLXNzYy5jDQo+IEBAIC0yMTAsNiArMjEwLDE1IEBAIHN0YXRpYyBpbnQgc3NjX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgCQlzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm5wID0gcGRldi0+ZGV2Lm9mX25vZGU7DQo+ICAgCQlzc2MtPmNsa19mcm9tX3JrX3BpbiA9
DQo+ICAgCQkJb2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiYXRtZWwsY2xrLWZyb20tcmstcGlu
Iik7DQo+ICsJCXNzYy0+bHJjbGtfZnJvbV90Zl9waW4gPQ0KPiArCQkJb2ZfcHJvcGVydHlfcmVh
ZF9ib29sKG5wLCAiYXRtZWwsbHJjbGstZnJvbS10Zi1waW4iKTsNCj4gKwkJc3NjLT5scmNsa19m
cm9tX3JmX3BpbiA9DQo+ICsJCQlvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobnAsICJhdG1lbCxscmNs
ay1mcm9tLXJmLXBpbiIpOw0KPiArDQo+ICsJCWlmIChzc2MtPmxyY2xrX2Zyb21fdGZfcGluICYm
IHNzYy0+bHJjbGtfZnJvbV9yZl9waW4pIHsNCj4gKwkJCWRldl9lcnIoJnBkZXYtPmRldiwgImJv
dGggTFJDTEsgZnJvbSBSSy9USyBvcHRpb25zIGZvdW5kIGluIERUIG5vZGUiKTsNCj4gKwkJCXJl
dHVybiAtRUlOVkFMOw0KPiArCQl9DQo+ICAgCX0NCj4gICANCj4gICAJcmVncyA9IHBsYXRmb3Jt
X2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L2F0bWVsLXNzYy5oIGIvaW5jbHVkZS9saW51eC9hdG1lbC1zc2MuaA0KPiBp
bmRleCA2MDkxZDJhYmMxZWIuLmZiZTFjMmZmYWE4MSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9s
aW51eC9hdG1lbC1zc2MuaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L2F0bWVsLXNzYy5oDQo+IEBA
IC0yMSw2ICsyMSw4IEBAIHN0cnVjdCBzc2NfZGV2aWNlIHsNCj4gICAJaW50CQkJdXNlcjsNCj4g
ICAJaW50CQkJaXJxOw0KPiAgIAlib29sCQkJY2xrX2Zyb21fcmtfcGluOw0KPiArCWJvb2wJCQls
cmNsa19mcm9tX3RmX3BpbjsNCj4gKwlib29sCQkJbHJjbGtfZnJvbV9yZl9waW47DQo+ICAgCWJv
b2wJCQlzb3VuZF9kYWk7DQo+ICAgfTsNCj4gICANCj4gDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2Et
ZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
