Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 445ED3A0AF
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 18:41:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94D491668;
	Sat,  8 Jun 2019 18:40:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94D491668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560012098;
	bh=7cO/YWQ6qZK4molRzJj+rCdlS3MPvc/YIkoZii6B9Xc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rlGM4VyQDQY82e+rZVAwUXSRNEMZN+XujHCVKpErkUOGGAu5wt/7CWe/Bfq0xxsT9
	 5+lqqgsiIoVxsWUE/q2I7sXAgO/OD3pW+HIz2fwTyd9X27rupHNxM12nQH/5lIgdAN
	 0yRr6zDRVO+8GwYgNZGxPDUSgsQR2RunTeyRX3DE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A47CF896F7;
	Sat,  8 Jun 2019 18:39:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED1DCF896EF; Tue,  4 Jun 2019 08:37:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00112.outbound.protection.outlook.com [40.107.0.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9872EF89673
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 08:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9872EF89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=televic.com header.i=@televic.com
 header.b="H2gnnIlN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=televic.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlzQxZg6E5nQZoHV8HWkfHJktwxMtRYha1meV1YuN7s=;
 b=H2gnnIlNfnCVeUpNWYVjSqY/3adA9Ntc2LIIFlon1eVMY0VZgdf9xTBARjslIBe/wlWogQbiGsTBhMJbFAge6qszD8KOvQOoZQZC5wuy7/LWp0FZDIYzrPD13JlVj/qmGRLK5XToXNREq3kGHsY2ur0W+27izD74StvGKa1h52E=
Received: from AM6PR07MB5223.eurprd07.prod.outlook.com (20.177.198.85) by
 AM6PR07MB5480.eurprd07.prod.outlook.com (20.178.89.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.9; Tue, 4 Jun 2019 06:37:48 +0000
Received: from AM6PR07MB5223.eurprd07.prod.outlook.com
 ([fe80::1c3a:37a9:3862:a573]) by AM6PR07MB5223.eurprd07.prod.outlook.com
 ([fe80::1c3a:37a9:3862:a573%5]) with mapi id 15.20.1965.011; Tue, 4 Jun 2019
 06:37:48 +0000
From: Jurgen Lambrecht <J.Lambrecht@TELEVIC.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: why error return in
 sound/soc/codecs/pcm3168a.c::pcm3168a_set_dai_fmt ?
Thread-Index: AQHVGqAGTLy4p27FX0K5i1oj506pMQ==
Date: Tue, 4 Jun 2019 06:37:48 +0000
Message-ID: <8e4d6674-0a5b-7063-534d-cea4e55056d5@televic.com>
Accept-Language: nl-BE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [84.199.255.188]
x-clientproxiedby: AM6PR10CA0012.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::25) To AM6PR07MB5223.eurprd07.prod.outlook.com
 (2603:10a6:20b:6a::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=J.Lambrecht@TELEVIC.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d342655-5203-452e-21bf-08d6e8b728f3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR07MB5480; 
x-ms-traffictypediagnostic: AM6PR07MB5480:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <AM6PR07MB5480222A195DAB401018C62DFF150@AM6PR07MB5480.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39850400004)(396003)(346002)(376002)(366004)(136003)(199004)(189003)(58126008)(5660300002)(31696002)(110136005)(476003)(2906002)(486006)(316002)(966005)(66946007)(305945005)(52116002)(66066001)(65956001)(65806001)(53936002)(2616005)(7736002)(99286004)(66446008)(186003)(478600001)(8936002)(64756008)(26005)(66476007)(66556008)(36756003)(2501003)(6512007)(81166006)(81156014)(8676002)(6306002)(25786009)(73956011)(86362001)(64126003)(68736007)(6486002)(65826007)(386003)(6506007)(71200400001)(256004)(3846002)(6116002)(72206003)(15974865002)(71190400001)(6436002)(31686004)(102836004)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR07MB5480;
 H:AM6PR07MB5223.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: TELEVIC.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: njjl8vVEdApYCjhRneJH8x5uKUFF3X31eFxkgmTVWbiQdHNl7tk+4wWp2NHMylFck2PP3U5LJUm5Zbaz+AYxC8lxXFPnVfo5gwbUs1N+CKAFUj7bnhshwMdQ3lRaXjggKNwYrK8MfKU422TCKu3AokUtVSLOtQnAljyFdEpJKJhM7dXrkusEBpiSKWnTEDj5VhZWpYE5RYZioOcUST9oEbFAFxJa1oBGPDzaRs5FAMsasLvDQAXsS5w6hhfkIic/Ad3hGnofzUeGECk+Y4+EWQ3ChC3Fnb4utUrBzsXsH5DfnXftBqgdl4PPGAUvaH1Kz4Ol6UkytuUtJcSn+hlpqjj/TEIPcRLx4xVw6ru7XMYQu701hpUne9dsrrc2vn9s4DWBmtlzHRP7EnLBs/Pq55bAEFvsYrsa9UcMKU4zgyw=
Content-ID: <0ABC482D4FD47D43898E715D4AA122F9@eurprd07.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: televic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d342655-5203-452e-21bf-08d6e8b728f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 06:37:48.4834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 68a8593e-d1fc-4a6a-b782-1bdcb0633231
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J.Lambrecht@TELEVIC.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB5480
X-Mailman-Approved-At: Sat, 08 Jun 2019 18:39:50 +0200
Subject: [alsa-devel] why error return in
 sound/soc/codecs/pcm3168a.c::pcm3168a_set_dai_fmt ?
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

SGksDQoNCldoZW4gZm9sbG93aW5nIA0KaHR0cHM6Ly9ib290bGluLmNvbS9ibG9nL2VpZ2h0LWNo
YW5uZWxzLWF1ZGlvLW9uLWktbXg3LXdpdGgtcGNtMzE2OC8gSSANCmdldCB0aGlzIGVycm9yIChm
cm9tIHNvY19jb3JlLmMpOg0KDQouLi4ga2VybmVsOiBbwqDCoMKgIDMuMDU5NjM0XVvCoMKgIFQx
NV0gcGNtMzE2OGEgMy0wMDM5OiBBU29DOiBGYWlsZWQgdG8gc2V0IA0KREFJIGZvcm1hdDogLTIy
DQoNCkkgY291bGQgcHJvcG9zZSB0aGlzIHBhdGNoIChJIGdldCB0aGF0IHByaW50ZiB3aGVuIGFw
cGx5aW5nIHRoZSBwYXRjaCkNCihhbGwgb3RoZXIgZXJyb3JzIGluIHRoYXQgZmlsZSBoYXZlIGEg
cHJpbnRmKToNCg0KZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvcGNtMzE2OGEuYyBiL3Nv
dW5kL3NvYy9jb2RlY3MvcGNtMzE2OGEuYw0KaW5kZXggMDhkM2ZlMTkyZTY1Li43NWNjYmI5MTk5
MDIgMTAwNjQ0DQotLS0gYS9zb3VuZC9zb2MvY29kZWNzL3BjbTMxNjhhLmMNCisrKyBiL3NvdW5k
L3NvYy9jb2RlY3MvcGNtMzE2OGEuYw0KQEAgLTM1Myw2ICszNTMsNyBAQCBzdGF0aWMgaW50IHBj
bTMxNjhhX3NldF9kYWlfZm10KHN0cnVjdCBzbmRfc29jX2RhaSAqZGFpLA0KIMKgwqDCoMKgwqDC
oMKgIGNhc2UgU05EX1NPQ19EQUlGTVRfTkJfTkY6DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGJyZWFrOw0KIMKgwqDCoMKgwqDCoMKgIGRlZmF1bHQ6DQorwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkZXZfZXJyKGNvbXBvbmVudC0+ZGV2LCAid3JvbmcgSU5WX01BU0tcbiIp
Ow0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsNCiDCoMKg
wqDCoMKgwqDCoCB9DQoNCkJ1dCB3aHkgZG9lcyB0aGlzIGNvZGUgcmV0dXJucyBhbiBlcnJvciBm
b3IgY29kZSB0aGF0IGhhcyBubyBlZmZlY3Q/DQpPSywgaXQgY291bGQgYmUgYmVjYXVzZSBTTkRf
U09DX0RBSUZNVF9JTlZfTUFTSyBtdXN0IGJlIA0KU05EX1NPQ19EQUlGTVRfTkJfTkYuIEJ1dCB0
aGVuIEFsZXhhbmRyZSdzIGJsb2cgY29udGFpbnMgYW4gZXJyb3IsIA0KYmVjYXVzZSB0aGUgZGFj
IFRETSBzZXRzIGZyYW1lLWludmVyc2lvbiBpbiBpdHMgZHRzIChhbmQgaXQgc2hvdWxkIG5vdCku
DQoNCi0tIA0KDQpLaW5kIFJlZ2FyZHMsDQoNCipKw7xyZ2VuIExhbWJyZWNodCoNClImRCBBc3Nv
Y2lhdGUNCg0KVGVsOiArMzIgNTEgMzAzMDQ1DQoNCnd3dy50ZWxldmljLXJhaWwuY29tIDxodHRw
czovL3d3dy50ZWxldmljLXJhaWwuY29tPg0KDQpUZWxldmljIFJhaWwgTlYgLSBMZW8gQmVrYWVy
dGxhYW4gMSAtIDg4NzAgSXplZ2VtIC0gQmVsZ2l1bQ0KQ29tcGFueSBudW1iZXIgMDgyNSA1Mzkg
NTgxIC0gUlBSIEtvcnRyaWprDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
