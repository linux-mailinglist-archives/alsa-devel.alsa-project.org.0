Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BE133495
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 18:08:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0015166C;
	Mon,  3 Jun 2019 18:07:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0015166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559578083;
	bh=WmPc/ad2/Kvp9aVzYxs9Kp8u4G+DoSXW0O8dDhyt4Cg=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cb2/aWG4Tm8yXBAGe3psIVPvR+mZ3MFwWxcE6o0+GlHyjeGAWMntMexb1xYP5Vyhu
	 A1qvCtqoP5c6X/kZtyOTZZHro0Yh5iYTdCdnS4DwuZYU22PPUpQl3/VDPTlibRvxnb
	 rvKpVkZ1uWow8eaFk8AOhNMNJu26H29dJrnFRyyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10F97F896ED;
	Mon,  3 Jun 2019 18:06:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93D61F896DD; Mon,  3 Jun 2019 18:06:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from esa1.microchip.iphmx.com (esa1.microchip.iphmx.com
 [68.232.147.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EB83F896CE
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 18:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EB83F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="alSpkfAO"
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
X-IronPort-AV: E=Sophos;i="5.60,547,1549954800"; d="scan'208";a="37383520"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Jun 2019 09:05:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 3 Jun 2019 09:05:51 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 3 Jun 2019 09:05:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvegjYcP+ab1y7LZs2THJpE2sMEOkGlCYRpuDOQ/gQY=;
 b=alSpkfAODQK0sQj+J5k65fb3//dZllmyDHvaIOR7wS1pZZLJgiyUWni+y+yZUxqw7fKaDHRQc+HnOMmuCv+GUjQ6x2nXnizQsyNYHXh//J8dLgjlfrKgNfoJbngm0pyqDWaG4vuF9y1VhvkDQ+AFlpRtiXird/VFOne84s0S8VM=
Received: from CY4PR11MB1256.namprd11.prod.outlook.com (10.169.252.10) by
 CY4PR11MB1351.namprd11.prod.outlook.com (10.169.252.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.17; Mon, 3 Jun 2019 16:05:50 +0000
Received: from CY4PR11MB1256.namprd11.prod.outlook.com
 ([fe80::e595:70a9:abee:aeb8]) by CY4PR11MB1256.namprd11.prod.outlook.com
 ([fe80::e595:70a9:abee:aeb8%4]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 16:05:50 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <willemromkes@rose-es.nl>, <nicolas.ferre@atmel.com>
Thread-Topic: atmel SSC DSP A mode
Thread-Index: AQHVGfXMwFuWMU4YUEqKNuRRtHJJgqaKGKAA
Date: Mon, 3 Jun 2019 16:05:49 +0000
Message-ID: <155857e2-1fbd-f154-5316-a4426a74b7b4@microchip.com>
References: <8d2cb6d3212c82c5b1430dc5e13c79c1@rose-es.nl>
In-Reply-To: <8d2cb6d3212c82c5b1430dc5e13c79c1@rose-es.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0196.eurprd07.prod.outlook.com
 (2603:10a6:802:3f::20) To CY4PR11MB1256.namprd11.prod.outlook.com
 (2603:10b6:903:25::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1a9eb3a-7a46-4998-f8b9-08d6e83d5898
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:CY4PR11MB1351; 
x-ms-traffictypediagnostic: CY4PR11MB1351:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <CY4PR11MB1351A9856D6BB1A83B387F84E7140@CY4PR11MB1351.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(136003)(376002)(346002)(396003)(199004)(189003)(31696002)(81156014)(8676002)(110136005)(68736007)(486006)(81166006)(476003)(11346002)(446003)(2616005)(31686004)(966005)(14454004)(6306002)(8936002)(478600001)(72206003)(86362001)(53936002)(6486002)(66476007)(186003)(6116002)(66946007)(3846002)(6436002)(73956011)(99286004)(2501003)(229853002)(26005)(66556008)(64756008)(66446008)(6512007)(102836004)(76176011)(52116002)(53546011)(305945005)(6506007)(386003)(4326008)(71190400001)(71200400001)(2906002)(7736002)(5660300002)(256004)(36756003)(6246003)(316002)(25786009)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR11MB1351;
 H:CY4PR11MB1256.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UtlyeuLQy7y0C53+BvdaC5CUxUm7u0+9wU7Mz7hSk2GICCHoaFmGXYX97dwuCIgupONmGhv8EvwuZ8VcJ6vMrSpTkYCae6DDUViZ4OnVgJ4eURp0kjEvfLlovqjqD7VL1hdoq9hWFe4HSxMmcLKRK4VTVaSU9O2etjxJol5dWKLdC4+k3yzBfyyLPO6svwqO5KyDvNgnlOIlb2z/2k06smY4/aINuOKl9MVpiyNPrJ594MgGEWxhpF3UQ+bixNDMm/WOM3ZqQf3v0++qGEGQokzwaRYoRUPNwu2MLU9pRsLkQUI3pVhaiB95nftSjj681NZwIIjo9+lWYr7/gUBhytH1/rL0vZdNVrGMd24bQKySj8MmzNCmAVgA3YPg8jWcYg8nwKeTkcN9+3ZZed8MGR+Fkn4L5MEHaTKPwYGqyaE=
Content-ID: <D4D368BBE8D9814C84B9AC8934F8A60E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a9eb3a-7a46-4998-f8b9-08d6e83d5898
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 16:05:49.9915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Codrin.Ciubotariu@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1351
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] atmel SSC DSP A mode
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

T24gMDMuMDYuMjAxOSAxMzoxOSwgV2lsbGVtIFJvbWtlcyB3cm90ZToNCj4gDQo+ICoNCj4gKg0K
PiANCj4gSGksDQo+IA0KPiBXZSBhcmUgdXNpbmcgbGludXgtYXQ5MSBhbmQgbGF0ZWx5IEkgaGF2
ZSBiZWVuIHdvcmtpbmcgb24gYWRkaW5nIHN1cHBvcnQgDQo+IGZvciBhIGN1c3RvbSBzb3VuZGNh
cmQsIGEgZHVhbCB0bHYzMjBhaWMzeCBjb2RlYyBvbiBTQU1BNUQzIHBsYXRmb3JtLiANCj4gVGhp
cyBzb3VuZGNhcmQgdXNlcyBEU1AgQSBtb2RlLg0KPiANCj4gV2UgYXJlIGZhY2luZyBhdWRpbyBp
c3N1ZXM6IFdoZW4gd2UgcGxheWJhY2sgYSBXQVYgZmlsZSB3aXRoIGEgc2luZSANCj4gd2F2ZSwg
dGhlIGNvZGVjIG91dHB1dHMgZmFyIGZyb20gYSBjbGVhbiBzaW5lIHdhdmUuIFRoZSBwcm9ibGVt
IEkgdGhpbmsgDQo+IGlzIHRoYXQgdGhlIENLSSBzZXR0aW5ncyBmb3IgdGhlIFRNQ1IgcmVnaXN0
ZXIgaXNuJ3Qgc2V0IGNvcnJlY3RseS4gDQo+IHNlZcKgY29tbWl0IDIwY2YyNjAzYjEyMmJmNzFm
YjU0ZGVmMWRlNmEyYWQ3M2Q1ZGRiMGINCj4gQXV0aG9yOiBCbyBTaGVuIDx2b2ljZS5zaGVuQGF0
bWVsLmNvbT4NCj4gRGF0ZTrCoMKgIEZyaSBKYW4gMzAgMTc6Mzg6NDIgMjAxNSArMDgwMA0KPiAN
Cj4gIMKgwqDCoCBBU29DOiBhdG1lbF9zc2NfZGFpOiBmaXggdGhlIHNldHRpbmcgZm9yIERTUCBt
b2RlDQo+IA0KPiAgwqDCoMKgIFdoZW4gU0NDIHdvcmsgaW4gRFNQIEEgbW9kZSwgdGhlIGRhdGEg
b3V0cHV0cy9pbnB1dHMgYXJlIHNoaWZ0IG91dCBvbg0KPiAgwqDCoMKgIGZhbGxpbmcgZWRnZSwg
dGhlIGZyYW1lIHN5bmMgYXJlIHNhbXBsZSBvbiB0aGUgcmlzaW5nIGVkZ2UuDQo+IA0KPiAgwqDC
oMKgIFJlcG9ydGVkLWJ5OiBTb25nanVuIFd1IDxzb25nanVuLnd1QGF0bWVsLmNvbT4NCj4gIMKg
wqDCoCBTaWduZWQtb2ZmLWJ5OiBCbyBTaGVuIDx2b2ljZS5zaGVuQGF0bWVsLmNvbT4NCj4gIMKg
wqDCoCBTaWduZWQtb2ZmLWJ5OiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+DQo+IA0K
PiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVsL2F0bWVsX3NzY19kYWkuYyANCj4gYi9zb3Vu
ZC9zb2MvYXRtZWwvYXRtZWxfc3NjX2RhaS5jDQo+IGluZGV4IGU2OTFhYWIuLjM1ZTQ0ZTQgMTAw
NjQ0DQo+IC0tLSBhL3NvdW5kL3NvYy9hdG1lbC9hdG1lbF9zc2NfZGFpLmMNCj4gKysrIGIvc291
bmQvc29jL2F0bWVsL2F0bWVsX3NzY19kYWkuYw0KPiBAQCAtNTAyLDcgKzUwMiw3IEBAIHN0YXRp
YyBpbnQgYXRtZWxfc3NjX2h3X3BhcmFtcyhzdHJ1Y3QgDQo+IHNuZF9wY21fc3Vic3RyZWFtICpz
dWJzdHJlYW0sDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmNtciA9wqDCoMKg
IFNTQ19CRihSQ01SX1BFUklPRCwgc3NjX3AtPnJjbXJfcGVyaW9kKQ0KPiAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IFNTQ19CRihSQ01SX1NUVERMWSwg
MSkNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBT
U0NfQkYoUkNNUl9TVEFSVCwgU1NDX1NUQVJUX1JJU0lOR19SRikNCj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgU1NDX0JGKFJDTVJfQ0tJLCBTU0NfQ0tJ
X1JJU0lORykNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwgU1NDX0JGKFJDTVJfQ0tJLCBTU0NfQ0tJX0ZBTExJTkcpDQo+ICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgU1NDX0JGKFJDTVJfQ0tPLCBTU0NfQ0tP
X05PTkUpDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHwgU1NDX0JGKFJDTVJfQ0tTLCBTU0NfQ0tTX0RJVik7DQo+IA0KPiBAQCAtNTE3LDcgKzUxNyw3
IEBAIHN0YXRpYyBpbnQgYXRtZWxfc3NjX2h3X3BhcmFtcyhzdHJ1Y3QgDQo+IHNuZF9wY21fc3Vi
c3RyZWFtICpzdWJzdHJlYW0sDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGNt
ciA9wqDCoMKgIFNTQ19CRihUQ01SX1BFUklPRCwgc3NjX3AtPnRjbXJfcGVyaW9kKQ0KPiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IFNTQ19CRihUQ01S
X1NUVERMWSwgMSkNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCBTU0NfQkYoVENNUl9TVEFSVCwgU1NDX1NUQVJUX1JJU0lOR19SRikNCj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgU1NDX0JGKFRDTVJfQ0tJ
LCBTU0NfQ0tJX1JJU0lORykNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgU1NDX0JGKFRDTVJfQ0tJLCBTU0NfQ0tJX0ZBTExJTkcpDQo+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgU1NDX0JGKFRDTVJfQ0tP
LCBTU0NfQ0tPX0NPTlRJTlVPVVMpDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHwgU1NDX0JGKFRDTVJfQ0tTLCBTU0NfQ0tTX0RJVik7DQo+IA0KPiBA
QCAtNTQ2LDcgKzU0Niw3IEBAIHN0YXRpYyBpbnQgYXRtZWxfc3NjX2h3X3BhcmFtcyhzdHJ1Y3Qg
DQo+IHNuZF9wY21fc3Vic3RyZWFtICpzdWJzdHJlYW0sDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmNtciA9wqDCoMKgIFNTQ19CRihSQ01SX1BFUklPRCwgMCkNCj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBTU0NfQkYoUkNNUl9T
VFRETFksIFNUQVJUX0RFTEFZKQ0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IFNTQ19CRihSQ01SX1NUQVJULCBTU0NfU1RBUlRfUklTSU5HX1JGKQ0K
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBTU0NfQkYo
UkNNUl9DS0ksIFNTQ19DS0lfUklTSU5HKQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCBTU0NfQkYoUkNNUl9DS0ksIFNTQ19DS0lfRkFMTElORykNCj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBTU0NfQkYo
UkNNUl9DS08sIFNTQ19DS09fTk9ORSkNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCBTU0NfQkYoUkNNUl9DS1MsIHNzYy0+Y2xrX2Zyb21fcmtfcGlu
ID8NCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTU0NfQ0tTX1BJTiA6IFNTQ19DS1Nf
Q0xPQ0spOw0KPiANCj4gRm9yIGJvdGggdGhlIFRDTVIgYW5kIFJDTVIgdGhlIENLSSBpcyBzZXQg
dG8gU1NDX0NLSV9GQUxMSU5HLCBidXQgSSANCj4gdGhpbmsgZm9yIHRoZSBUQ01SIHRoZSBDS0kg
c2hvdWxkIGJlIHNldCB0byBTU0NfQ0tJX1JJU0lORy4gU2VlIGRhdGFzaGVldDoNCj4gDQo+IFRD
TVIgQ0tJOiAiMTogVGhlIGRhdGEgb3V0cHV0cyAoRGF0YSBhbmQgRnJhbWUgU3luYyBzaWduYWxz
KSBhcmUgc2hpZnRlZCANCj4gb3V0IG9uIFRyYW5zbWl0IENsb2NrIHJpc2luZyBlZGdlLiBUaGUg
RnJhbWUgc3luYyBzaWduYWwNCj4gaW5wdXQgaXMgc2FtcGxlZCBvbiBUcmFuc21pdCBjbG9jayBm
YWxsaW5nIGVkZ2UuIg0KPiANCj4gUkNNUiBDS0k6ICIwOiBUaGUgZGF0YSBpbnB1dHMgKERhdGEg
YW5kIEZyYW1lIFN5bmMgc2lnbmFscykgYXJlIHNhbXBsZWQgDQo+IG9uIFJlY2VpdmUgQ2xvY2sg
ZmFsbGluZyBlZGdlLiBUaGUgRnJhbWUgU3luYyBzaWduYWwgb3V0LQ0KPiBwdXQgaXMgc2hpZnRl
ZCBvdXQgb24gUmVjZWl2ZSBDbG9jayByaXNpbmcgZWRnZS4iDQo+IA0KPiBTZXR0aW5nIHRoZSBD
S0kgaW4gVENNUiB0byBTU0NfQ0tJX1JJU0lORyB0byBmaXhlcyBvdXIgaXNzdWVzLg0KDQpIaSBX
aWxsZW0sDQoNCkl0IHRoaXMgRFMgb2YgdGhlIGNvZGVjIHlvdSBhcmUgdXNpbmc/DQpodHRwOi8v
d3d3LnRpLmNvbS9saXQvZHMvc3ltbGluay90bHYzMjBhaWMzMy5wZGYNCg0KQXJlIHlvdSB1c2lu
ZyB0aGUgRFNQIG1vZGUgZGVzY3JpYmVkIGluIGZpZ3VyZSAyNSBEU1AgU2VyaWFsIEJ1cyBNb2Rl
IA0KT3BlcmF0aW9uPyBJZiB5ZXMsIHRoZW4geW91IHNob3VsZCB1c2UgdGhlIERTUF9CIG1vZGUu
Li4NCg0KVGhhbmtzIGFuZCBiZXN0IHJlZ2FyZHMsDQpDb2RyaW4NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
