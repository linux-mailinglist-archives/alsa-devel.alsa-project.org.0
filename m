Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 235D4FEA26
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Nov 2019 02:45:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DCC81685;
	Sat, 16 Nov 2019 02:44:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DCC81685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573868705;
	bh=b3BZB4Qh192AYHw033Q+is45MRmao3kSlPn/iIOOIrA=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j7GAZa/Jp9l2157ipN9tlzfIWWCgXRgbcG9J2IIwFtED/JbdPa7yN76R7sAtpGiZ5
	 jtLvXb0QZ84zYrIV7Ena0jPM/n4npcXY8IlblONqYH2XQb2v6WpEzAFU7t90bO2Wab
	 TEIx1cVOvfnrlktrHNGzN5kNRq7APigUsyPXRM5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D8CDF80104;
	Sat, 16 Nov 2019 02:43:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDEA8F80104; Sat, 16 Nov 2019 02:43:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,PRX_BODY_78,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310075.outbound.protection.outlook.com [40.107.131.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29942F800CC
 for <alsa-devel@alsa-project.org>; Sat, 16 Nov 2019 02:43:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29942F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="jKIbZw7O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IjvQiqjUTgZvMUmC1hAlCmFqakHUkDqgy7NaNXTbudpSYCAQ6FlfES033d5o2EyfY/0VTJqLdaQ/pYgWMA9Sh2v7U+BrePZYkc2IRlMIHH9d+U58s3YZeVVhdSwS7ZEXU1CHyb350O1g3ztZS31jynz7oc8t+z+gxiTXFLeQ/fjl5QWh/hwkUeCswTgNmthKo9P++6vl/DrjaxH8g9/Q1o9viwZOm8bsuTTvC4CjuPd1YzDO1Nw3NB5xqMmolKW0VYzRS9E/E1+mTEOHFExbuL9ndprjTZkL7JKi0oEtZI2/pQvR2Dw5amiJiNgTfCGDmil0/OIR4kBK5n3D0dsdtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJLYbIRNCFM+HbD56IXmGnZQP/81gFQiRQjdf2iXkFk=;
 b=hu4/DAK4z9U68OXnQ/jz26hPBt+hjM/fC9SRJRz7AFmWph+SiMCDQZaFfeo//snymN1AycBXJgrUARr3nve9c5ZSeWHWUfw28BxeWPUpY83Plmn48MmFjMZI3Qlj/A59R2Pqja9ydlbmBgJPfeY5mPNqjFOWvKwO/t1WNFVO6FvOJxincD4fgD1GYbsmDNf1MbRwiCf9n829ZB/V4DGWHh16yx8q40lPw2Rniv85qqWv2a/R06Zpe9KuY/C+oLJVkoQpkHAeupo+yzhDKJQkm91CW6jjPtuHp58QY21scG4UXroyUfoxXXyMAHmCTHcVtwH30JoBfR3mB0iHNyhLOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJLYbIRNCFM+HbD56IXmGnZQP/81gFQiRQjdf2iXkFk=;
 b=jKIbZw7OZstl/Qag5TqH6wp30ByveB+IX7vXzgZ5Km5eqRKGa7XS9nbfI9FJ0oMetQPM8YfyGYBsQyr6a4kcpgMaQGpq4adhMCnT/r9lFdEClNgkFRv1t4E6RX5s1sMq2fvhCWlBZ2grUPx3miY6yB+2rU/r/iaD9yHiNSx/Cqo=
Received: from SG2PR03MB5134.apcprd03.prod.outlook.com (52.132.234.202) by
 SG2PR03MB2749.apcprd03.prod.outlook.com (52.133.138.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.9; Sat, 16 Nov 2019 01:43:09 +0000
Received: from SG2PR03MB5134.apcprd03.prod.outlook.com
 ([fe80::21ca:39a4:25e9:c398]) by SG2PR03MB5134.apcprd03.prod.outlook.com
 ([fe80::21ca:39a4:25e9:c398%5]) with mapi id 15.20.2474.012; Sat, 16 Nov 2019
 01:43:08 +0000
From: AS50 KCHsu0 <KCHSU0@nuvoton.com>
To: Marco Felsch <m.felsch@pengutronix.de>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "broonie@kernel.org" <broonie@kernel.org>,
 "thomas.fehrenbacher@siedle.de" <thomas.fehrenbacher@siedle.de>
Thread-Topic: [PATCH 3/3] ASoC: nau8810: add aux input control, available on
 NAU8812
Thread-Index: AQHVm88ulvBeSF4QAU2lHN0X+78biqeNBrAA
Date: Sat, 16 Nov 2019 01:43:08 +0000
Message-ID: <55560429-3504-d2f3-2ce5-c8644fbeb333@nuvoton.com>
References: <20191115160819.15557-1-m.felsch@pengutronix.de>
 <20191115160819.15557-4-m.felsch@pengutronix.de>
In-Reply-To: <20191115160819.15557-4-m.felsch@pengutronix.de>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [114.43.73.81]
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: HK2PR02CA0151.apcprd02.prod.outlook.com
 (2603:1096:201:1f::11) To SG2PR03MB5134.apcprd03.prod.outlook.com
 (2603:1096:4:da::10)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=KCHSU0@nuvoton.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b707a5c1-d842-459a-0efc-08d76a36552b
x-ms-traffictypediagnostic: SG2PR03MB2749:|SG2PR03MB2749:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR03MB27492CAFD12EDF5E72A046C694730@SG2PR03MB2749.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:248;
x-forefront-prvs: 02234DBFF6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(366004)(39850400004)(396003)(136003)(199004)(189003)(58126008)(316002)(6246003)(6306002)(66066001)(65956001)(54906003)(65806001)(76176011)(110136005)(107886003)(71200400001)(86362001)(256004)(66556008)(8936002)(66446008)(64756008)(66476007)(81156014)(81166006)(71190400001)(229853002)(14444005)(5660300002)(6512007)(4326008)(99286004)(6486002)(6436002)(8676002)(2906002)(26005)(6116002)(2501003)(3846002)(186003)(478600001)(476003)(2616005)(486006)(446003)(14454004)(31696002)(11346002)(7736002)(102836004)(66946007)(52116002)(36756003)(31686004)(305945005)(6506007)(386003)(25786009)(966005)(11716003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SG2PR03MB2749;
 H:SG2PR03MB5134.apcprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nuvoton.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1PlufYNxUiK3ua6HP9VR9oiCrcaZm4rTyGU+2+7muSgDEQnHmzNr6LN+l9SeEC+2ZeIwu7H9hb4Nh3dfOj/GNOcVP56l08OPjSW/8ATTxCqLtWMyn4z13UTJ/IwDqnJpSwrbRj7FT0j9Qu9/gpBar6p9BAOCSRC86AAuJpBi0A/AxF4eq1mN2xWRyidKh4J5Blt70XmEbQqeuiNEumxyx1vPCsmtWSVacBP7FLG/yLSpWC3AGDg8EK6A8ijQSh4Ao/pcsQzNc0i/1XBJXCiHP5/dRSgGiqNNyw24Kju21hhPmWADEPddnoAKwDLrp7ZR1hZyl5z+Zp9R5ArsRoPts3bO6jl0Mq+2iMDuK6k8kpdh2Bmuvqi7qOmPyZU6DLn/REBdzYjyZRQQZvZwYgV63wZJB6roqa3/pSRqRixSyueh4U37RXOEH3PHw8vNXCwG
Content-ID: <1D9B030CF1EE864CABD06A5CFD97CCEE@apcprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b707a5c1-d842-459a-0efc-08d76a36552b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2019 01:43:08.7796 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I1XuhpGaVermpEVNjjaucz98MTqXb2RIKjiYw0zEubTb0i1ia8XNCtUf/LdlNZqF+mDGYZBS6H5+/QpybiAQsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB2749
Cc: AS50 WTLi <WTLI@nuvoton.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 AS50 CTLin0 <CTLIN0@nuvoton.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: nau8810: add aux input control,
 available on NAU8812
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

DQpNYXJjbyBGZWxzY2gg5pa8IDIwMTkvMTEvMTYg5LiK5Y2IIDEyOjA4IOWvq+mBkzoNCj4gRnJv
bTogVGhvbWFzIEZlaHJlbmJhY2hlciA8dGhvbWFzLmZlaHJlbmJhY2hlckBzaWVkbGUuZGU+DQo+
DQo+IFRoaXMgY29tbWl0IGFkZHMgdGhlIHN1cHBvcnQgdG8gY29udHJvbCB0aGUgYXV4LXBvcnQg
b24gdGhlIG5hdTg4MTINCj4gZGV2aWNlcy4gV2UgZG9uJ3QgbmVlZCB0byBkaWZmZXJlbnRpYXRl
IHRoZSBhdXgtcG9ydCByZWdpc3RlcnMgc2luY2UNCj4gdGhvc2UgYml0ZmllbGRzIGFyZSBzZXQg
dG8gJzAnIG9uIHRoZSBuYXU4ODEwIGRldmljZXMgWzEsMl0uDQo+DQo+IFsxXSBodHRwOi8vd3d3
Lm51dm90b24uY29tL3Jlc291cmNlLWZpbGVzL05BVTg4MTBfRGF0YXNoZWV0X1Jldl8yLjgucGRm
DQo+IFsyXSBodHRwOi8vd3d3Lm51dm90b24uY29tL3Jlc291cmNlLWZpbGVzL05BVTg4MTJEYXRh
c2hlZXRSZXYyLjcucGRmDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBGZWhyZW5iYWNoZXIg
PHRob21hcy5mZWhyZW5iYWNoZXJAc2llZGxlLmRlPg0KPiBbbS5mZWxzY2hAcGVuZ3V0cm9uaXgu
ZGU6IGFkZCBjb21taXQgbWVzc2FnZV0NCj4gU2lnbmVkLW9mZi1ieTogTWFyY28gRmVsc2NoIDxt
LmZlbHNjaEBwZW5ndXRyb25peC5kZT4NCj4gLS0tDQo+ICAgc291bmQvc29jL2NvZGVjcy9uYXU4
ODEwLmMgfCA3ICsrKysrKysNCj4gICBzb3VuZC9zb2MvY29kZWNzL25hdTg4MTAuaCB8IDIgKysN
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEv
c291bmQvc29jL2NvZGVjcy9uYXU4ODEwLmMgYi9zb3VuZC9zb2MvY29kZWNzL25hdTg4MTAuYw0K
PiBpbmRleCBhMzJhNGE4ZDVmNTAuLmIxMDI0ZDI0ZDQxMyAxMDA2NDQNCj4gLS0tIGEvc291bmQv
c29jL2NvZGVjcy9uYXU4ODEwLmMNCj4gKysrIGIvc291bmQvc29jL2NvZGVjcy9uYXU4ODEwLmMN
Cj4gQEAgLTM1MSw2ICszNTEsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9rY29udHJvbF9u
ZXcgbmF1ODgxMF9zbmRfY29udHJvbHNbXSA9IHsNCj4gICBOQVU4ODEwX0RBQ09TX1NGVCwgMSwg
MCksDQo+ICAgU09DX1NJTkdMRSgiQURDIE92ZXJzYW1wbGluZyBSYXRlKDEyOHgpIFN3aXRjaCIs
IE5BVTg4MTBfUkVHX0FEQywNCj4gICBOQVU4ODEwX0FEQ09TX1NGVCwgMSwgMCksDQo+ICsNCj4g
K1NPQ19TSU5HTEUoIkFVWCBJbnB1dCBFbmFibGUgU3dpdGNoIiwgTkFVODgxMF9SRUdfUE9XRVIx
LA0KPiArTkFVODgxMF9BVVhfRU5fU0ZULCAxLCAwKSwNCj4gICB9Ow0KPg0KDQoNClRoZSBwb3dl
ciBjb250cm9sIGhhcyB0byBtb3ZlIHRvIHRoZSBuYXU4ODEwX2RhcG1fd2lkZ2V0cy4NCg0KVGhl
IERBUE0gY2FuIGp1c3QgY29udHJvbCB0aGUgcG93ZXIgc3dpdGNoIG9mIEFVWEkgZHluYW1pY2Fs
bHkuDQoNCg0KPiAgIC8qIFNwZWFrZXIgT3V0cHV0IE1peGVyICovDQo+IEBAIC0zODMsNiArMzg2
LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfa2NvbnRyb2xfbmV3IG5hdTg4MTBfaW5wZ2Fb
XSA9IHsNCj4gICBOQVU4ODEwX05NSUNQR0FfU0ZULCAxLCAwKSwNCj4gICBTT0NfREFQTV9TSU5H
TEUoIk1pY1AgU3dpdGNoIiwgTkFVODgxMF9SRUdfSU5QVVRfU0lHTkFMLA0KPiAgIE5BVTg4MTBf
UE1JQ1BHQV9TRlQsIDEsIDApLA0KPiArU09DX0RBUE1fU0lOR0xFKCJBVVggU3dpdGNoIiwgTkFV
ODgxMF9SRUdfSU5QVVRfU0lHTkFMLA0KPiArTkFVODgxMF9BVVhQR0FfU0ZULCAxLCAwKSwNCj4g
ICB9Ow0KPg0KPiAgIC8qIExvb3BiYWNrIFN3aXRjaCAqLw0KPiBAQCAtNDM2LDYgKzQ0MSw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCBuYXU4ODEwX2RhcG1fd2lk
Z2V0c1tdID0gew0KPg0KPiAgIFNORF9TT0NfREFQTV9JTlBVVCgiTUlDTiIpLA0KPiAgIFNORF9T
T0NfREFQTV9JTlBVVCgiTUlDUCIpLA0KPiArU05EX1NPQ19EQVBNX0lOUFVUKCJBVVgiKSwNCj4g
ICBTTkRfU09DX0RBUE1fT1VUUFVUKCJNT05PT1VUIiksDQo+ICAgU05EX1NPQ19EQVBNX09VVFBV
VCgiU1BLT1VUUCIpLA0KPiAgIFNORF9TT0NfREFQTV9PVVRQVVQoIlNQS09VVE4iKSwNCj4gQEAg
LTQ3MCw2ICs0NzYsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFwbV9yb3V0ZSBu
YXU4ODEwX2RhcG1fcm91dGVzW10gPSB7DQo+ICAgeyJJbnB1dCBQR0EiLCBOVUxMLCAiTWljIEJp
YXMifSwNCj4gICB7IklucHV0IFBHQSIsICJNaWNOIFN3aXRjaCIsICJNSUNOIn0sDQo+ICAgeyJJ
bnB1dCBQR0EiLCAiTWljUCBTd2l0Y2giLCAiTUlDUCJ9LA0KPiAreyJJbnB1dCBQR0EiLCAiQVVY
IFN3aXRjaCIsICJBVVgifSwNCj4NCj4gICAvKiBEaWdpdGFsIExvb3B0YWNrICovDQo+ICAgeyJE
aWdpdGFsIExvb3BiYWNrIiwgIlN3aXRjaCIsICJBREMifSwNCj4gZGlmZiAtLWdpdCBhL3NvdW5k
L3NvYy9jb2RlY3MvbmF1ODgxMC5oIGIvc291bmQvc29jL2NvZGVjcy9uYXU4ODEwLmgNCj4gaW5k
ZXggMWFkYTMxODgzZGM2Li43YjVlY2FkMTczZDMgMTAwNjQ0DQo+IC0tLSBhL3NvdW5kL3NvYy9j
b2RlY3MvbmF1ODgxMC5oDQo+ICsrKyBiL3NvdW5kL3NvYy9jb2RlY3MvbmF1ODgxMC5oDQo+IEBA
IC02OSw2ICs2OSw3IEBADQo+DQo+ICAgLyogTkFVODgxMF9SRUdfUE9XRVIxICgweDEpICovDQo+
ICAgI2RlZmluZSBOQVU4ODEwX0RDQlVGX0VOKDB4MSA8PCA4KQ0KPiArI2RlZmluZSBOQVU4ODEw
X0FVWF9FTl9TRlQ2DQo+ICAgI2RlZmluZSBOQVU4ODEwX1BMTF9FTl9TRlQ1DQo+ICAgI2RlZmlu
ZSBOQVU4ODEwX01JQ0JJQVNfRU5fU0ZUNA0KPiAgICNkZWZpbmUgTkFVODgxMF9BQklBU19FTigw
eDEgPDwgMykNCj4gQEAgLTIyOSw2ICsyMzAsNyBAQA0KPiAgIC8qIE5BVTg4MTBfUkVHX0lOUFVU
X1NJR05BTCAoMHgyQykgKi8NCj4gICAjZGVmaW5lIE5BVTg4MTBfUE1JQ1BHQV9TRlQwDQo+ICAg
I2RlZmluZSBOQVU4ODEwX05NSUNQR0FfU0ZUMQ0KPiArI2RlZmluZSBOQVU4ODEwX0FVWFBHQV9T
RlQyDQo+DQo+ICAgLyogTkFVODgxMF9SRUdfUEdBR0FJTiAoMHgyRCkgKi8NCj4gICAjZGVmaW5l
IE5BVTg4MTBfUEdBR0FJTl9TRlQwDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCiBUaGUgcHJpdmlsZWdlZCBjb25maWRl
bnRpYWwgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMgZW1haWwgaXMgaW50ZW5kZWQgZm9y
IHVzZSBvbmx5IGJ5IHRoZSBhZGRyZXNzZWVzIGFzIGluZGljYXRlZCBieSB0aGUgb3JpZ2luYWwg
c2VuZGVyIG9mIHRoaXMgZW1haWwuIElmIHlvdSBhcmUgbm90IHRoZSBhZGRyZXNzZWUgaW5kaWNh
dGVkIGluIHRoaXMgZW1haWwgb3IgYXJlIG5vdCByZXNwb25zaWJsZSBmb3IgZGVsaXZlcnkgb2Yg
dGhlIGVtYWlsIHRvIHN1Y2ggYSBwZXJzb24sIHBsZWFzZSBraW5kbHkgcmVwbHkgdG8gdGhlIHNl
bmRlciBpbmRpY2F0aW5nIHRoaXMgZmFjdCBhbmQgZGVsZXRlIGFsbCBjb3BpZXMgb2YgaXQgZnJv
bSB5b3VyIGNvbXB1dGVyIGFuZCBuZXR3b3JrIHNlcnZlciBpbW1lZGlhdGVseS4gWW91ciBjb29w
ZXJhdGlvbiBpcyBoaWdobHkgYXBwcmVjaWF0ZWQuIEl0IGlzIGFkdmlzZWQgdGhhdCBhbnkgdW5h
dXRob3JpemVkIHVzZSBvZiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gb2YgTnV2b3RvbiBpcyBz
dHJpY3RseSBwcm9oaWJpdGVkOyBhbmQgYW55IGluZm9ybWF0aW9uIGluIHRoaXMgZW1haWwgaXJy
ZWxldmFudCB0byB0aGUgb2ZmaWNpYWwgYnVzaW5lc3Mgb2YgTnV2b3RvbiBzaGFsbCBiZSBkZWVt
ZWQgYXMgbmVpdGhlciBnaXZlbiBub3IgZW5kb3JzZWQgYnkgTnV2b3Rvbi4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
