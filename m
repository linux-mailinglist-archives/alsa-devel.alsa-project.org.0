Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A2CC1E5D
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2019 11:46:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 527DB166C;
	Mon, 30 Sep 2019 11:45:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 527DB166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569836763;
	bh=EEbKsB5h2cyURKeADy/eWkEHohIljqpzZPw4766Lne4=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eDdQMzOBKCDWCkOk5tKo+HBwN658eV4YcvgZc0AJeG/HbVyxwO2NHtuSNeElBWhzD
	 3UrXeL/5t11t779Fam2X5PernJx0qF8KHsgTxauze0GWoSnTdVlRUB75ORsVblhUXn
	 yWGXrYMFFNhuWqtrhgoTFe1lTS/eeJyVBLx0Z1u4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 811C2F8036E;
	Mon, 30 Sep 2019 11:44:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08806F8036E; Mon, 30 Sep 2019 11:44:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EE90F801A4
 for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2019 11:44:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EE90F801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com
 header.i=@analog.onmicrosoft.com header.b="vLAVQpDQ"
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8U9i3wa027427; Mon, 30 Sep 2019 05:44:03 -0400
Received: from nam01-by2-obe.outbound.protection.outlook.com
 (mail-by2nam01lp2053.outbound.protection.outlook.com [104.47.34.53])
 by mx0b-00128a01.pphosted.com with ESMTP id 2va45684py-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Mon, 30 Sep 2019 05:44:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/G/8e1j75eRvgCSWHcfFPlR834KBoDFhVQ4LmQHYiMMdT7o0rdgJJQ/NQ/zzk6FqIE9WodlKIrfHV3tyIkNIWinJflt6J/Y7/vsYm+CRhNKWyHR1/aZOh2sw6M1zBJZ+GgjfdQIx+kFw35s7s/BM5AXZ8NXWMv4rUR325qcV1u8/3Pbs+q0TJ6xd4pMOtbAe7nToPRwnGRtEqmPb0hjIrIjMh73AJ3OJmbD793q16h49h8m0ZfIvXOw1UNNifb3KZkAuFE05LFWolNfPssFbGNHlR0vrlc2EpmG5R0+HPJIC7rOZ/7ff1xnHlQ3776cUOcFvtdecutXhcTfr1O6oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCnoe/LAIJYXFAHQti3HT1YIV1t7o+hYsF0072QcVpA=;
 b=NeDkh6v/NAKlLssXCd5u7ybiuTtS/Bk7TnE2kUwBLUieO67dxonPctDtO/ItCf7vz1y7dNabHHl4N96FwItKA1WZedkbu61qozFxV+yV6H4r17yIkbq7ZESigmLsOE44gNvIrfgLA5AvTgOH/gssYaIXsYdFJQAo4SW8t1z1m2Rt0xQb50OQWo3ob1O0GxVHqzfDiyyzMmXOPbDiF9pIBUs++bLvyAtec553o6dltlnH2NoYaM8yYIisCvKRYPRPg5sHmmnjvwBZ10r4ncLpMUXoosiRlsANJdF6R2Zcb8kTBMSW91NQEJZM7edIBLl6l+pb+lUiQIR27WRtYrds6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BCnoe/LAIJYXFAHQti3HT1YIV1t7o+hYsF0072QcVpA=;
 b=vLAVQpDQsECP4HpxecV+ySyO9COcYXu3BwwNDgvZjPWG+RIB9ibwu931vF86DakqTQqkJyaPCHM3PQOzmxqUp4Yocf/49rRO45/2HX4P6vNhFNeN/UU5MrCV1ECHkCx6FLjve2b3quIa8rAotml11/e0paVHfo+LOfLDG6TujUM=
Received: from MN2PR03MB5117.namprd03.prod.outlook.com (52.132.171.137) by
 MN2PR03MB4607.namprd03.prod.outlook.com (20.179.81.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 09:44:01 +0000
Received: from MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::6006:4c13:a8c1:b359]) by MN2PR03MB5117.namprd03.prod.outlook.com
 ([fe80::6006:4c13:a8c1:b359%4]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 09:44:01 +0000
From: "Sa, Nuno" <Nuno.Sa@analog.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Thread-Topic: [PATCH 1/2] ASOC: Add ADAU7118 8 Channel PDM-to-I2S/TDM
 Converter driver
Thread-Index: AQHVdJpKDYg2bk+VvkSIGNv9o2+YhKdD/hYA
Date: Mon, 30 Sep 2019 09:44:00 +0000
Message-ID: <6245f99f37c10dcec0a52344bab4b980f08e07da.camel@analog.com>
References: <20190926071707.17557-1-nuno.sa@analog.com>
 <20190926184318.GF2036@sirena.org.uk>
In-Reply-To: <20190926184318.GF2036@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ef2804f2-6332-410b-4b6f-08d7458ab930
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR03MB4607:
x-microsoft-antispam-prvs: <MN2PR03MB4607E26639D2FD514671665D99820@MN2PR03MB4607.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(136003)(396003)(376002)(39860400002)(51914003)(189003)(199004)(476003)(8676002)(8936002)(2351001)(54906003)(6436002)(486006)(7736002)(2906002)(6486002)(5640700003)(64756008)(66556008)(81166006)(478600001)(66476007)(81156014)(5660300002)(66946007)(229853002)(14454004)(1730700003)(66446008)(6512007)(2501003)(91956017)(76116006)(316002)(118296001)(305945005)(71190400001)(71200400001)(25786009)(99286004)(2616005)(6246003)(86362001)(76176011)(186003)(6116002)(256004)(14444005)(446003)(11346002)(102836004)(26005)(6506007)(66066001)(3846002)(36756003)(4326008)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR03MB4607;
 H:MN2PR03MB5117.namprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BkbhNxNN41t4EDZQXObA8nBswNNIDJnPphtc7Ui0ZFNmLEgo3L6vZWXsEZP4NKWzLd+6m8ojKyPABCRGtOYeXPAnR3CZmOJdEn1MUJCyPtl+SjGT8Iyfkh0aylOVmy6p+egdXqYQjMKKhLCbQc56O+ZnqGngbpA52bAxmESsNFZqljcpwGcbr5ZO5on2EFvMA11thLWe6Gn63pNb2CmoQ5yjFGaDFlxFyzpIK4zMVhL/5AyNTejB5IoeOZJ1S2ZAejukrrBqpdOWkWXBBbXEF3PeXpsO0ej4eKHqGlHWh1cXBvDt1ESKbIB12d3XEtQTdGcZc8So7xA8XpoJYieH+wQO6nPeC+ToQQ1iBmWdM2lqfz2Uz7Q0uF8eoQharlLXa0+SYK7wuFc9vDlX34tpLSh5HAu5cDATSNO2vSAfMc4=
x-ms-exchange-transport-forked: True
Content-ID: <D7D58CB599F22D478039609D6A7E180B@namprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2804f2-6332-410b-4b6f-08d7458ab930
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 09:44:00.9887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7IZXq2ZovMt3Sm0VGMwvUt/PqQ1NgJ+5oivwwPT2bG2H6kVxrZC3tLjGStcH+YgmZjtEY4ItIlGm9x2/a0ZBeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4607
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-09-30_06:2019-09-25,2019-09-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1909300105
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/2] ASOC: Add ADAU7118 8 Channel
 PDM-to-I2S/TDM Converter driver
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

SGkgTWFyaywNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBTb21lIGNvbW1lbnRzL2RvdWJ0cyBp
bmxpbmUuIFRoaXMgZGV2aWNlIHdhcyBteQ0KZmlyc3QgY29udGFjdCB3aXRoIEFTT0Mvc291bmQg
ZGV2cyBzbywgSSBhcG9sb2dpemUgaWYgc29tZSBvZiB0aGUNCmNvbW1lbnRzL2RvdWJ0cyBhcmUg
Y29tcGxldGVseSB3cm9uZy90cml2aWFsLg0KDQpPbiBUaHUsIDIwMTktMDktMjYgYXQgMTE6NDMg
LTA3MDAsIE1hcmsgQnJvd24gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIFNlcCAyNiwgMjAxOSBhdCAw
OToxNzowNkFNICswMjAwLCBOdW5vIFPDoSB3cm90ZToNCj4gDQo+ID4gLS0tIC9kZXYvbnVsbA0K
PiA+ICsrKyBiL3NvdW5kL3NvYy9jb2RlY3MvYWRhdTcxMTgtaHcuYw0KPiA+IEBAIC0wLDAgKzEs
NDMgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gPiArLyoN
Cj4gPiArICogQW5hbG9nIERldmljZXMgQURBVTcxMTggOCBjaGFubmVsIFBETS10by1JMlMvVERN
IENvbnZlcnRlcg0KPiA+IFN0YW5kYWxvbmUgSHcNCj4gPiArICogZHJpdmVyDQo+ID4gKyAqDQo+
ID4gKyAqIENvcHlyaWdodCAyMDE5IEFuYWxvZyBEZXZpY2VzIEluYy4NCj4gPiArICovDQo+IA0K
PiBQbGVhc2UgbWFrZSB0aGUgZW50aXJlIGNvbW1lbnQgYSBDKysgc3R5bGUgb25lIGluIHRoZSAu
YyBmaWxlcyBzbw0KPiB0aGluZ3MgbG9vayBtb3JlIGludGVudGlvbmFsLg0KPiANCj4gPiArCXN3
aXRjaCAoZm10ICYgU05EX1NPQ19EQUlGTVRfRk9STUFUX01BU0spIHsNCj4gPiArCWNhc2UgU05E
X1NPQ19EQUlGTVRfSTJTOg0KPiA+ICsJCXJldCA9IHNuZF9zb2NfY29tcG9uZW50X3VwZGF0ZV9i
aXRzKGRhaS0+Y29tcG9uZW50LA0KPiA+ICsJCQkJCQkgICAgQURBVTcxMThfUkVHX1NQVF9DVA0K
PiA+IFJMMSwNCj4gPiArCQkJCQkJICAgIEFEQVU3MTE4X0RBVEFfRk1UX00NCj4gPiBBU0ssDQo+
ID4gKwkJCQkJCSAgICBBREFVNzExOF9EQVRBX0ZNVCgwDQo+ID4gKSk7DQo+ID4gKwkJYnJlYWs7
DQo+ID4gKwljYXNlIFNORF9TT0NfREFJRk1UX0xFRlRfSjoNCj4gPiArCQlyZXQgPSBzbmRfc29j
X2NvbXBvbmVudF91cGRhdGVfYml0cyhkYWktPmNvbXBvbmVudCwNCj4gPiArCQkJCQkJICAgIEFE
QVU3MTE4X1JFR19TUFRfQ1QNCj4gPiBSTDEsDQo+ID4gKwkJCQkJCSAgICBBREFVNzExOF9EQVRB
X0ZNVF9NDQo+ID4gQVNLLA0KPiA+ICsJCQkJCQkgICAgQURBVTcxMThfREFUQV9GTVQoMQ0KPiA+
ICkpOw0KPiA+ICsJCWJyZWFrOw0KPiA+ICsJY2FzZSBTTkRfU09DX0RBSUZNVF9SSUdIVF9KOg0K
PiA+ICsJCXN0LT5yaWdodF9qID0gdHJ1ZTsNCj4gPiArCQlicmVhazsNCj4gDQo+IERvbid0IHdl
IG5lZWQgdG8gc2V0IGFueSByZWdpc3RlciB2YWx1ZXMgaGVyZT8NCg0KVGhlIHJlZ2lzdGVyIHNl
dCBpcyBkb25lIGluIGFkYXU3MTE4X2h3X3BhcmFtcygpLiBGb3IgcmlnaHQNCmp1c3RpZmljYXRp
b24gdGhlIGRldmljZSBjYW4gZGVsYXkgYmNsY2sgYnkgOCwgMTIgb3IgMTYuIFNvLCBXZSBuZWVk
IHRvDQprbm93IHRoZSBkYXRhX3dpZHRoIHRvIGNoZWNrIGlmIHdlIGNhbiBhcHBseSB0aGUgY29u
ZmlndXJhdGlvbi4NCg0KPiA+ICsNCj4gPiArCXJldHVybiByZXQgPCAwID8gcmV0IDogMDsNCj4g
PiArfQ0KPiANCj4gUGxlYXNlIGRvbid0IHVzZSB0aGUgdGVybmVyeSBvcGVyYXRvciBsaWtlIHRo
aXMsIGl0IGp1c3QgbWFrZXMNCj4gdGhpbmdzIGhhcmRlciB0byByZWFkIC0gd3JpdGUgbm9ybWFs
IGlmIGNvbmRpdGlvbmFsIHN0YXRlbWVudHMuDQoNCmFjay4NCg0KPiA+ICsJY2FzZSBTTkRfU09D
X0JJQVNfU1RBTkRCWToNCj4gPiArCQlpZiAoc25kX3NvY19jb21wb25lbnRfZ2V0X2JpYXNfbGV2
ZWwoY29tcG9uZW50KSA9PQ0KPiA+ICsJCQkJCQkJU05EX1NPQ19CSUFTX09GDQo+ID4gRikgew0K
PiA+ICsJCQlpZiAoIXN0LT5pb3ZkZCkNCj4gPiArCQkJCXJldHVybiAwOw0KPiANCj4gVGhpcyBp
cyBicm9rZW4sIHRoZSBkZXZpY2Ugd2lsbCBhbHdheXMgcmVxdWlyZSBwb3dlciBzbyBpdCBzaG91
bGQNCj4gYWx3YXlzIGNvbnRyb2wgdGhlIHJlZ3VsYXRvcnMuDQoNClRoZSByZWFzb24gd2h5IEkg
bWFkZSB0aGlzIG9wdGlvbmFsIHdhcyB0byBsZXQgdGhlIHVzZXIgYXNzdW1lIHRoYXQsIGluDQpz
b21lIGNhc2VzLCB0aGUgc3VwcGx5IGNhbiBiZSBhbHdheXMgcHJlc2VudCAoYW5kIG5vdCBjb250
cm9sbGVkIGJ5IHRoZQ0Ka2VybmVsKSBhbmQsIGluIHRob3NlIGNhc2VzLCBoZSB3b3VsZCBub3Qg
aGF2ZSB0byBjYXJlIGFib3V0IGdpdmluZw0KcmVndWxhdG9ycyBub2RlcyBpbiBkZXZpY2V0cmVl
LiBGdXJ0aGVybW9yZSwgdGhlIGRyaXZlciB3b3VsZCBub3QgaGF2ZQ0KdG8gY2FyZSBhYm91dCBl
bmFibGluZy9kaXNhYmxpbmcgIHJlZ3VsYXRvcnMuIElzIHRoaXMgbm90IGEgdmFsaWQNCnNjZW5h
cmlvPyBPciBpcyBpdCB0aGF0LCBmb3IgdGhpcyBraW5kIG9mIGRldmljZXMgaXQgZG9lcyBub3Qg
cmVhbGx5DQptYWtlIHNlbnNlICh3aGljaCBJIHRoaW5rIGl0IGRvZXNuJ3QpIHRvIGhhdmUgdGhl
bSBhbHdheXMgcG93ZXJlZCwgc28NCndlIGp1c3QgYXNzdW1lIGEgcmVndWxhdG9yIGlzIG5lZWRl
ZCAoYW5kIGluIHRoZSB1bmxpa2VseSBzY2VuYXJpbyB3ZQ0KZG9uJ3QgaGF2ZSBvbmUsIHRoZSB1
c2VyIGp1c3QgcHJvdmlkZXMgYSBmaXhlZC1yZWd1bGF0b3IpPw0KDQo+ID4gK3N0YXRpYyBpbnQg
YWRhdTcxMThfc3VzcGVuZChzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCkNCj4g
PiArew0KPiA+ICsJcmV0dXJuIHNuZF9zb2NfY29tcG9uZW50X2ZvcmNlX2JpYXNfbGV2ZWwoY29t
cG9uZW50LA0KPiA+IFNORF9TT0NfQklBU19PRkYpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0
aWMgaW50IGFkYXU3MTE4X3Jlc3VtZShzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVu
dCkNCj4gPiArew0KPiA+ICsJcmV0dXJuIHNuZF9zb2NfY29tcG9uZW50X2ZvcmNlX2JpYXNfbGV2
ZWwoY29tcG9uZW50LA0KPiA+ICsJCQkJCQkgIFNORF9TT0NfQklBU19TVEFOREJZKQ0KPiA+IDsN
Cj4gPiArfQ0KPiANCj4gTGV0IERBUE0gZG8gdGhpcyBmb3IgeW91LCB0aGVyZSdzIG5vIHN1YnN0
YW50aWFsIGRlbGF5cyBvbiBwb3dlcg0KPiBvbiBzbyB5b3UncmUgcHJvYmFibHkgYmVzdCBqdXN0
IHNldHRpbmcgaWRsZV9iaWFzX29mZi4NCg0KU28sIHRoaXMgbWVhbnMgZHJvcHBpbmcgcmVzdW1l
L3N1c3BlbmQgYW5kIHRvIG5vdCBzZXQgaWRsZV9iaWFzX29uLA0KcmlnaHQ/DQoNCj4gPiArc3Rh
dGljIGludCBhZGF1NzExOF9yZWd1bGF0b3Jfc2V0dXAoc3RydWN0IGFkYXU3MTE4X2RhdGEgKnN0
KQ0KPiA+ICt7DQo+ID4gKwlpbnQgcmV0ID0gMDsNCj4gPiArDQo+ID4gKwlzdC0+aW92ZGQgPSBk
ZXZtX3JlZ3VsYXRvcl9nZXRfb3B0aW9uYWwoc3QtPmRldiwgIklPVkREIik7DQo+ID4gKwlpZiAo
IUlTX0VSUihzdC0+aW92ZGQpKSB7DQo+IA0KPiBVbmxlc3MgdGhlIGRldmljZSBjYW4gb3BlcmF0
ZSB3aXRoIHN1cHBsaWVzIHBoeXNpY2FsbHkgYWJzZW50IGl0DQo+IHNob3VsZCBub3QgYmUgcmVx
dWVzdGluZyByZWd1bGF0b3JzIGFzIG9wdGlvbmFsLCB0aGlzIGJyZWFrcyB5b3VyDQo+IGVycm9y
IGhhbmRsaW5nIGVzcGVjaWFsbHkgd2l0aCBwcm9iZSBkZWZlcnJhbCB3aGljaCBpcyBhIGZhaXJs
eQ0KPiBjb21tb24gY2FzZS4NCg0KSnVzdCBmb3IgbXkgdW5kZXJzdGFuZGluZyAobW9zdCBsaWtl
bHkgSSdtIG1pc3Npbmcgc29tZXRoaW5nIG9idmlvdXMpLA0Kd2h5IHdvdWxkIEkgaGF2ZSBpc3N1
ZXMgd2l0aCB0aGUgZXJyb3IgaGFuZGxpbmcgaW4gcHJvYmUgZGVmZXJyYWw/DQoNClRoYW5rcyEN
Ck51bm8gU8OhDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0
cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVs
Cg==
