Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52457265AFD
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 10:00:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEB4C1671;
	Fri, 11 Sep 2020 10:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEB4C1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599811253;
	bh=gnzFfN2dUhiNvASfTahDkBgrQaM9A654KJlUCOP79vU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IrrSWLNk+CX0ltk6Q4IcyCUp8ffi1CcZOhg/netzdVpgu0WviH9zFqRXDdI0Qifyx
	 Y66xh9ZZZAhTbSQdPWEU3889BeNn8hwC/q1lYzI7zrpj9K6wNtt/cf57oNQELbhUrb
	 IK9GpzVfmNQnXrXcImugpSmOpZ7wHE8u0lESJ5jk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96190F80240;
	Fri, 11 Sep 2020 09:59:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90F92F80227; Fri, 11 Sep 2020 09:59:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A952F80100
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 09:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A952F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=infinera.com header.i=@infinera.com
 header.b="BpZDE7HX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OTriLkgbgcTv7HzYQFmAP+3Kgjp8HaPideVlFBGAU4Ytx99xgfVGkBkXuDNdX1XaPsLZ/7xD1SuGvy8TfFVw3Vany9YIe92i5xsX9THmCDk5+YtHmYbkkqxcaW39IsA9z2E+/p53Yk82mJ4lJVadqWNeLFj4EL+uDd3y5/dxaivcoQ5pyyPcqNUso1FJFsgoqolvh+qR1S5TklvaevbX7HcJoSSyfySwcUTf/HhoaqqZo5cBQg+YmsI4aGA6ZDuAGBQ/7tzXx/yGACIq5+TeMcy0E2VLIp6a0tQYTkkjOPncYxfk98c0OKgqYlo+4P+zXL3OsuxMkzVVOJFMgYjuTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnzFfN2dUhiNvASfTahDkBgrQaM9A654KJlUCOP79vU=;
 b=Kh1FWygTwHyflxJWV8lFB71VC+/BnybiqxOWaUN366cFZinsMImF/9hI5Cmc9q6IMZuhhDPNJP5gOJdprEcVe7KlEhI5TsY2DHMztzrIuIs4kvWqXeLUlfkOGDzM6ahyGToHVJk8Ji8gdKkjrtJV9hvB5mP9tWwq0OGcv5QnXmOyn9m95JfoPPj3qggkiMenqi0dmJSVute7eeI2zVil9K05eVaI7w1DN9bu4TisDi9YCkeycRmuHAYnMLPLqI7ovV/aFbOBQTL1VF7uSc5rfP72Kde49FUW1ImC0fj3MugMOSgx9ARPYfwKriIEcV48mbdF1/PTgmNn/zC9+xmdHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gnzFfN2dUhiNvASfTahDkBgrQaM9A654KJlUCOP79vU=;
 b=BpZDE7HX/SZ/WHwSM1U5F7ifW6Ti0Cax0euxg5G6UTZoW5SFlfncYA612b0c7f5RlcecU0s6nsWeLsOh7yk4/iW9uo/oTLgviVDhAPa5oZkMqSuJrxAZJEy29gWv9Kp6WrKXurTVgEeEXg68r51tBYThzhowCit2oVmajFsXXNA=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR10MB2022.namprd10.prod.outlook.com
 (2603:10b6:903:123::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 07:59:03 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::7c3b:e8e3:3d1b:284d]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::7c3b:e8e3:3d1b:284d%7]) with mapi id 15.20.3326.026; Fri, 11 Sep 2020
 07:59:03 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "sashal@kernel.org" <sashal@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] ALSA: usb-audio: Add delay quirk for H570e USB headsets
Thread-Topic: [PATCH] ALSA: usb-audio: Add delay quirk for H570e USB headsets
Thread-Index: AQHWh0/fePjx1NowkkyEsKM5VQOxhqliEdiAgAECWwA=
Date: Fri, 11 Sep 2020 07:59:03 +0000
Message-ID: <776286f5c8102c7eb19687da0441bff0fe6abbf5.camel@infinera.com>
References: <20200910085328.19188-1-joakim.tjernlund@infinera.com>
 <20200910163421.C2E45221E7@mail.kernel.org>
In-Reply-To: <20200910163421.C2E45221E7@mail.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.37.92 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb2a35b2-95fb-42d8-8a17-08d856288d04
x-ms-traffictypediagnostic: CY4PR10MB2022:
x-microsoft-antispam-prvs: <CY4PR10MB20223E95C86D47A645AD44FAF4240@CY4PR10MB2022.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 66MWRITj7OQbJ+fkTUpB4CReFufsr2wJdG36/d/HwzWImPU3DysbpMFCM4jPWWAW8kTkLusSNrTxa+DMM1NODK7E9I82HJRdtdSu6TUHAx61Y5kHwEFb0oU480Mt95/BnkIMXMrtOH4IhpRYUkHtb5A76Gq37tAsPXI8rTFEn3M3EFsoepJSjIzCfZzGt1srvBa3MuC3Gwj67IWsk7A6KfIqPOeME5tfAOAIglWEqoqfrxEgxqSgvsdkFo4O+vEm5g1hzVCZUCCPWKj7ZS1KjEO+PLIJMAifwMVQ1pC9tGdZDAcTa+8yGRUC0mx63Bd5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2389.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(6506007)(8676002)(478600001)(6486002)(186003)(110136005)(4326008)(26005)(2906002)(71200400001)(86362001)(6512007)(36756003)(76116006)(91956017)(66446008)(64756008)(66556008)(66476007)(66946007)(5660300002)(2616005)(8936002)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: kysBHXHyvW9Dx+F4DQ/VGsYdYdYpXiC6Ds2o903x6wrmo8bYMVEy/KYlkyC5SAHiiJ46YL4vGs07IY39PSonbemvUxOjBmVl9zKHm166W/eiFcdqUeUH0HXlUlJazmE+P2rtlugaowf01Ei7fX7LpgO8wA96vc2oqlx7FFK1e2ZbQdmwhdNpzlP0xic4LEBIjCXGfoZIcbJ/wDZrc0gVmKCbQ4eHd5RaZC5osDrcITH06II/m38KpZjrdiPnEQpRt+7Y5LwKXEAGVw9RSgrXgljXDZp9VaShfZJQbmH/4SsPARvDAlziJGTAnXQm+8VCTxuIGD1kT+XcIA7gO+ZgHYLySUzFXgGh13DomeldHOdsio1Szjeg1QaOUn6HEVtirrEQ0APxQVfZIFEnBjRLnLhLIgLlxKPC6nxOwzQ1Yu8sHj/sRtPVcs2w1fCp3CcZcO9Dh9GB3WSY3d1uGvIzatWrMozTFr42MsVqvA4AzmbRKbgOhCPz22eJb7pxGB08xxg1+N5mzI37B7u2tiMvLSESthTrjO5ACRak9rW3VOE4SBz1jd7NbHunt+RwKGc9Gyhy+2ZbdMD+aKRCaBYip26IR3rF4VGCspzuQptuiLyI3RCB4WfktzzOzOR7JtcpCCWwldkj01oGT9tCZrsYzw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE1ECC3F68A0ED4B8F3AD9B290EBEB8B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb2a35b2-95fb-42d8-8a17-08d856288d04
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2020 07:59:03.5701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fOMKHI2UIXq9vLLX4AlXNLbnNrFnB8K1M1gsS1IueUh+gDgGAPMKCiTKVi9zcGKrDOk/azd0hVZqVX3u+Tqt0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB2022
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gVGh1LCAyMDIwLTA5LTEwIGF0IDE2OjM0ICswMDAwLCBTYXNoYSBMZXZpbiB3cm90ZToNCj4g
Q0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5p
emF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0K
PiANCj4gSGkNCj4gDQo+IFtUaGlzIGlzIGFuIGF1dG9tYXRlZCBlbWFpbF0NCj4gDQo+IFRoaXMg
Y29tbWl0IGhhcyBiZWVuIHByb2Nlc3NlZCBiZWNhdXNlIGl0IGNvbnRhaW5zIGEgLXN0YWJsZSB0
YWcuDQo+IFRoZSBzdGFibGUgdGFnIGluZGljYXRlcyB0aGF0IGl0J3MgcmVsZXZhbnQgZm9yIHRo
ZSBmb2xsb3dpbmcgdHJlZXM6IGFsbA0KPiANCj4gVGhlIGJvdCBoYXMgdGVzdGVkIHRoZSBmb2xs
b3dpbmcgdHJlZXM6IHY1LjguNywgdjUuNC42MywgdjQuMTkuMTQzLCB2NC4xNC4xOTYsIHY0Ljku
MjM1LCB2NC40LjIzNS4NCj4gDQo+IHY1LjguNzogQnVpbGQgT0shDQo+IHY1LjQuNjM6IEJ1aWxk
IE9LIQ0KPiB2NC4xOS4xNDM6IEJ1aWxkIE9LIQ0KPiB2NC4xNC4xOTY6IEJ1aWxkIE9LIQ0KPiB2
NC45LjIzNTogQnVpbGQgT0shDQo+IHY0LjQuMjM1OiBGYWlsZWQgdG8gYXBwbHkhIFBvc3NpYmxl
IGRlcGVuZGVuY2llczoNCj4gwqDCoMKgwqA3MTQyNjUzNWY0OWYgKCJBTFNBOiB1c2ItYXVkaW86
IEFkZCBuYXRpdmUgRFNEIHN1cHBvcnQgZm9yIEx1eG1hbiBEQS0wNiIpDQo+IMKgwqDCoMKgNzRk
YzcxZjgzZTUwICgiQUxTQTogdXNiLWF1ZGlvOiBGSVggbmF0aXZlIERTRCBzdXBwb3J0IGZvciBU
RUFDIFVELTUwMSBEQUMiKQ0KPiDCoMKgwqDCoDc5Mjg5ZTI0MTk0YSAoIkFMU0E6IHVzYi1hdWRp
bzogUmVmZXIgdG8gY2hpcC0+dXNiX2lkIGZvciBxdWlya3MgYW5kIE1JREkgY3JlYXRpb24iKQ0K
PiDCoMKgwqDCoDdmMzhjYTA0N2IwYyAoIkFMU0E6IHVzYi1hdWRpbzogQWRkIG5hdGl2ZSBEU0Qg
c3VwcG9ydCBmb3IgVEVBQyA1MDEvNTAzIERBQyIpDQo+IMKgwqDCoMKgODY2ZjdlZDdkNjc5ICgi
QUxTQTogdXNiLWF1ZGlvOiBBZGQgbmF0aXZlIERTRCBzdXBwb3J0IGZvciBFc290ZXJpYyBELTA1
WCIpDQo+IMKgwqDCoMKgYjAwMjE0ODY1ZDY1ICgiQUxTQTogdXNiLWF1ZGlvOiBBZGQgbmF0aXZl
IERTRCBzdXBwb3J0IGZvciBURUFDIFVELTMwMSIpDQo+IMKgwqDCoMKgZGYzZjAzNDdmZDg1ICgi
QUxTQTogdXNiLWF1ZGlvOiBxdWlya3M6IFJlcGxhY2UgbWRlbGF5KCkgd2l0aCBtc2xlZXAoKSBh
bmQgdXNsZWVwX3JhbmdlKCkiKQ0KPiDCoMKgwqDCoGYzYjkwNmQ3MjBlNCAoIkFMU0E6IHVzYi1h
dWRpbzogSW50ZWdyYXRlIG5hdGl2ZSBEU0Qgc3VwcG9ydCBmb3IgSVRGLVVTQiBiYXNlZCBEQUNz
LiIpDQo+IA0KPiANCj4gTk9URTogVGhlIHBhdGNoIHdpbGwgbm90IGJlIHF1ZXVlZCB0byBzdGFi
bGUgdHJlZXMgdW50aWwgaXQgaXMgdXBzdHJlYW0uDQo+IA0KPiBIb3cgc2hvdWxkIHdlIHByb2Nl
ZWQgd2l0aCB0aGlzIHBhdGNoPw0KDQpCYWNrcG9ydGluZyB0byA0LjkgYW4gbm8gbW9yZSBpcyBm
aW5lIHdpdGggbWUsIHBhdGNoIGp1c3QgZml4ZXMgYSBzbWFsbCBlcnJvciBmb3IgYSBuZXdlciBV
U0IgaGVhZHNldA0KDQogSm9ja2UNCg==
