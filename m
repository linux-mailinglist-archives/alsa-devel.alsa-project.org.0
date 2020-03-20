Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D4218C6CF
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 06:23:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AABBA17D0;
	Fri, 20 Mar 2020 06:23:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AABBA17D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584681835;
	bh=A2viQDpZWYMzaEbpVxw5XwpF9H2dWDQTCboMPBZ+Kuo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K/XLHMI9SfKXr3NStXWXNhk3aSLYqMHRpTY/gCMv6gL1aU/1L6OxIHZLddTxa2xcN
	 SKBvsnbcN8jqFXph+LcoN2GLPZxywWy9QJOc2YLoB2lJX9f2lxo33R+fgDkPh7SLGl
	 VS74meFOGahRxsNRNlIOP2Li5XE8xMzz3L+mos14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D2C9F80162;
	Fri, 20 Mar 2020 06:22:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4785F80126; Fri, 20 Mar 2020 06:22:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B03CF80126
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 06:21:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B03CF80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="HVsPbr0G"
IronPort-SDR: xyiXEvjYuNeYtVakiwx38RAtyfOzHk6yD24bzSnKsz8+Q6RBS0OUqvlAyfvnmyDKHj1H2lVFl9
 rR+4hFRr7+dA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 22:21:53 -0700
IronPort-SDR: BhTyob7yuUmi2zS3pbAGAuRW07F+wClNC36x5vEaLV2hwR+ugRkQ8IhD1fHg/dopzBMr3R0/Rf
 yp3NfSLh/9uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,283,1580803200"; d="scan'208";a="324754451"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga001.jf.intel.com with ESMTP; 19 Mar 2020 22:21:53 -0700
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 19 Mar 2020 22:21:52 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 19 Mar 2020 22:21:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Thu, 19 Mar 2020 22:21:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+WE/Y//4prsi5lwJ/r9VM8y/OIkgyKk1pIN/u1b/eV0CG4Ka3LaWAbPNVzRbz3bGsjHfs+IHvGoxS1eZQYmS9Tp6XFDCJ+W7FOPaIlG61NwLWxczNqsEljNgCLnh8MsHSgqjvAw7HXQ27w3/O4+3Y7D5mq/75gCuaBFHeYhdxNNk0++vbBWZ8U8+4RjFQIOQe0sF5nKsfUKlBmCEmuoXtnAOizKNb8Rp5hT0CMyLHQxnQnLCiT3PioVdiEbGdgGT5tE1QNILj6z3j+eVI5dbKkyV3hssaLC22VmUpdNP5wChVvsFFSdsVS9PC4erFzwFY81+i4rBIxBuvCFFnUFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2viQDpZWYMzaEbpVxw5XwpF9H2dWDQTCboMPBZ+Kuo=;
 b=DjDCaWS53GMqPH1M1+GESW4iAbdrtpZrzwzamVKKbh5LAZyvl1RQHFQZNY2tiuRgucBvQyGva9AQnfzBdqw5hGKhXZ22HMkIqLFapD17xcxy7NWqDGoUCQnGmFxo+WPfcIVt15PFb4kOJbpW1QntQpbo9rbMsAAADiQPdjO16pGRHeLLIGFifeM02z5lTQ+jBGzduKO/LvJyhabLbLq6vXTQy7YJt/tu6wAglR6mwg2GSlYmiRRhKeW4vf9VHGNSKgA6uq6Qj9xFYTv4rEoUdhaPVssDW+RFtO7JeWUbP2OF2oLtVekYQBsMIqBxudT/jU/tx6PtqRLHiTJvUg8KHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A2viQDpZWYMzaEbpVxw5XwpF9H2dWDQTCboMPBZ+Kuo=;
 b=HVsPbr0GXzMHx6jd2zcgensc8Zh59uk3VuUADFZnzsz9rARBy2AChii8OvNAa4Q4rXN531XkQ1gbjBwpE/xy7fp7nTtaNGl7qPsCLj7qzhdpR3M68B3iCvunsLPTVmq11qk57qjYLDXWNqWz/4UYUYvSjRFZvnamvtuiKF/BMog=
Received: from CY4PR1101MB2119.namprd11.prod.outlook.com
 (2603:10b6:910:20::19) by CY4PR1101MB2295.namprd11.prod.outlook.com
 (2603:10b6:910:19::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.14; Fri, 20 Mar
 2020 05:21:51 +0000
Received: from CY4PR1101MB2119.namprd11.prod.outlook.com
 ([fe80::1dbf:efb3:d3d4:2a5c]) by CY4PR1101MB2119.namprd11.prod.outlook.com
 ([fe80::1dbf:efb3:d3d4:2a5c%8]) with mapi id 15.20.2835.017; Fri, 20 Mar 2020
 05:21:50 +0000
From: "Chiang, Mac" <mac.chiang@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH v2] ASoC: Intel: boards: add stereo playback by woofer
 speaker
Thread-Topic: [PATCH v2] ASoC: Intel: boards: add stereo playback by woofer
 speaker
Thread-Index: AQHV/Ns24HhtvHD5qkm9O+6fren9OahQKlAAgAC7c3A=
Date: Fri, 20 Mar 2020 05:21:50 +0000
Message-ID: <CY4PR1101MB2119CDA78D62681DC59B652684F50@CY4PR1101MB2119.namprd11.prod.outlook.com>
References: <1584504614-15191-1-git-send-email-mac.chiang@intel.com>
 <e12440ca-f1e9-cc84-da68-5a1b53c38ce9@linux.intel.com>
In-Reply-To: <e12440ca-f1e9-cc84-da68-5a1b53c38ce9@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mac.chiang@intel.com; 
x-originating-ip: [192.198.147.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 240e0e50-85d9-467b-f561-08d7cc8e985c
x-ms-traffictypediagnostic: CY4PR1101MB2295:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1101MB22950A3E04617617DDB5034184F50@CY4PR1101MB2295.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03484C0ABF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(396003)(366004)(346002)(39860400002)(199004)(7696005)(316002)(110136005)(33656002)(81156014)(8936002)(81166006)(8676002)(54906003)(86362001)(186003)(26005)(9686003)(5660300002)(76116006)(66946007)(66556008)(66476007)(478600001)(64756008)(71200400001)(52536014)(66446008)(55016002)(2906002)(6506007)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR1101MB2295;
 H:CY4PR1101MB2119.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gZxgm5TtYXj5He+vdPlHMXyp99Ii99X+SrPtnwqKEtPNkCWOn9mWAlb30LhuZYUJ15fqDfn8X0NnLoJ3H8yWdyyGbx+d9rWnq3/K93Ey/DJWEAp/agt8LiFxWnPgtpBOvjfCobw0YRcwqtGw64u1xIGKeC49H5jHdQTzT3XsLtKI5S0Vc4G0UzPElwOvC1SG1KFnO2rP3OJyBUVBVA2mop2Fz7vspvVrZcrHTwlZlNgd8Hm+JW9wK31sbUOv9oATPihJF//rj2NaKjk3jj4CmSUMWzTp+5HSimpgF0XPOhcPY2p8iJ5zid8OynPgvW9u1X4txrNNDi2dK3cgtfY67woIa1xYtBm4xM2OGb4Q7TLTJx5nL/Y65WFrTMlilyaET+uUWiSOyQu2TJ+kT8ZuzuV3lgm98y1Z0b1Y5rgBzIjAvN797Yz6l1fJ0XpcmMQm
x-ms-exchange-antispam-messagedata: nant8M5PctPL7fw4CdyTD0JrFxnbUupIWb30XPpfPWzbi3dF1TbptPAiArPOA4nk39HMpSiZAja1m+Nfz2WEbD+Gf1yNhm5reaLf3Qw1zUFHfWnpuwt4uA+V+oRXznmEzHi5kczm4UDVuhAyEJFQgw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 240e0e50-85d9-467b-f561-08d7cc8e985c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2020 05:21:50.7856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YBMcit8iQ8uv83dZcDxv6nYc34QbhuTjZiL34oatKKqOp2Oi+uacUjXSE0TSaZ0F5Nit5gk+Pq6f77rA9OxvjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2295
X-OriginatorOrg: intel.com
Cc: "M R, Sathya Prakash" <sathya.prakash.m.r@intel.com>, "M,
 Naveen" <naveen.m@intel.com>, "broonie@kernel.org" <broonie@kernel.org>
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

VGhhbmtzIFBpZXJyZS4NCkkgd2lsbCBtb2RpZnkgdGhlc2UgY2hhbmdlcy4gQW5kIGFzIHByZXZp
b3VzbHkgYXMgeW91IG1lbnRpb25lZCwgSSByZXBseSBiZWxvdyB0byBiZSBjb25maXJtZWQuIElm
IHRoZXkgYXJlIGFsbCBnb29kIGFzIHdlbGwsIEkgd2lsbCBzZW5kIHRoZSB2MyBwYXRjaC4NCg0K
PiA+IEBAIC00MTMsMTQgKzQ4OCw2IEBAIHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19jb2RlY19jb25m
IHJ0MTAxMV9jb25mW10gPSB7DQo+ID4gICAJCS5kbGMgPSBDT01QX0NPREVDX0NPTkYoImkyYy0x
MEVDMTAxMTowMSIpLA0KPiA+ICAgCQkubmFtZV9wcmVmaXggPSAiV1IiLA0KPiA+ICAgCX0sDQo+
ID4gLQl7DQo+ID4gLQkJLmRsYyA9IENPTVBfQ09ERUNfQ09ORigiaTJjLTEwRUMxMDExOjAyIiks
DQo+ID4gLQkJLm5hbWVfcHJlZml4ID0gIlRMIiwNCj4gPiAtCX0sDQo+ID4gLQl7DQo+ID4gLQkJ
LmRsYyA9IENPTVBfQ09ERUNfQ09ORigiaTJjLTEwRUMxMDExOjAzIiksDQo+ID4gLQkJLm5hbWVf
cHJlZml4ID0gIlRSIiwNCj4gPiAtCX0sDQo+IA0KPiBpcyB0aGVyZSBhIHJlYXNvbiB0byByZW1v
dmUgdGhlIHByZWZpeGVzIGZvciBUd2VldGVycz8gT3IgaXMgdGhpcyBoYW5kbGVkDQo+IHNvbWV3
aGVyZSBlbHNlPw0KWWVzLCB0aGUgIlRMIiwgIlRSIiBuYW1lX3ByZWZpeCBoYW5kbGluZyBpcyBt
b3ZpbmcgdG8gc25kX2NtbF9ydDEwMTFfcHJvYmUoKSBhbGxvY2F0ZWQgYnkgcnQxMDExX2RhaXNf
Y29uZnNbXQ0KDQo+ID4gKwkJZm9yIChpID0gMDsgaSA8IFNQS19DSDsgaSsrKSB7DQo+ID4gKwkJ
CXJ0MTAxMV9kYWlzX2NvbmZzW2ldLmRsYy5uYW1lID0NCj4gZGV2bV9rYXNwcmludGYoJnBkZXYt
PmRldiwNCj4gPiArCQkJCQkJCQlHRlBfS0VSTkVMLA0KPiA+ICsJCQkJCQkJCSJpMmMtDQo+IDEw
RUMxMDExOjAlZCIsDQo+ID4gKwkJCQkJCQkJaSk7DQo+IA0KPiBpZiAoIXJ0MTAxMV9kYWlzX2Nv
bmZzW2ldLmRsYy5uYW1lKQ0KPiAgICAgIHJldHVybiAtRU5PTUVNOw0KPiANCj4gPiArCQkJc3dp
dGNoIChpKSB7DQo+ID4gKwkJCWNhc2UgMDoNCj4gPiArCQkJCXJ0MTAxMV9kYWlzX2NvbmZzW2ld
Lm5hbWVfcHJlZml4ID0gIldMIjsNCj4gPiArCQkJCWJyZWFrOw0KPiA+ICsNCj4gPiArCQkJY2Fz
ZSAxOg0KPiA+ICsJCQkJcnQxMDExX2RhaXNfY29uZnNbaV0ubmFtZV9wcmVmaXggPSAiV1IiOw0K
PiA+ICsJCQkJYnJlYWs7DQo+ID4gKwkJCWNhc2UgMjoNCj4gPiArCQkJCXJ0MTAxMV9kYWlzX2Nv
bmZzW2ldLm5hbWVfcHJlZml4ID0gIlRMIjsNCj4gPiArCQkJCWJyZWFrOw0KPiA+ICsJCQljYXNl
IDM6DQo+ID4gKwkJCQlydDEwMTFfZGFpc19jb25mc1tpXS5uYW1lX3ByZWZpeCA9ICJUUiI7DQo+
ID4gKwkJCQlicmVhazsNCgkJCWRlZmF1bHQ6DQoJCQkJcmV0dXJuIC1FSU5WQUw7DQo+ID4gKwkJ
CX0NCj4gDQo+IEhvdyBkb2VzIHRoaXMgd29yaz8gdGhlIHJ0MTAxMV9kYWlzX2NvbmZzIG9ubHkg
aGFzIDIgY29tcG9uZW50cyBub3c/DQo+IFRoaXMgd291bGQgcHJvYmFibHkgZ2VuZXJhdGUgYSBO
VUxMIGFjY2VzcyBvciBnZW5lcmF0ZSBhbiBvdXQtb2YtYm91bmRzDQo+IGFjY2VzcyBpbiB0aGUg
YXJyYXkuDQpCeSBkZWZhdWx0IHRoZXJlIHdlcmUgMiBjb21wb25lbnRzIGFsbG9jYXRlZCBieSBy
dDEwMTFfY29uZltdLiBIb3dldmVyLCBydDEwMTFfZGFpc19jb25mcyBoYXMgNCBjb21wb25lbnRz
IHdoZW4gd29vZmVycyt0d2VldGVycyBzdXBwb3J0LiBCVFcsIEkgc2hvdWxkIGFkZCB0aGUgZGVm
YXVsdCBjYXNlIHRvIGhhbmRsZSB0aGUgaW52YWxpZCB2YWx1ZXMgYXMgd2VsbC4NCg0KPj4gU3Vi
amVjdDogW1BBVENIIHYyXSBBU29DOiBJbnRlbDogYm9hcmRzOiBhZGQgc3RlcmVvIHBsYXliYWNr
IGJ5IHdvb2ZlciANCj4+IHNwZWFrZXINCj4+IHN1cHBvcnQgd29vZmVyIHN0ZXJlbyBzcGVha2Vy
cyBpbmRpdmlkdWFsbHkNCj5Cb3RoIHRoZSBjb21taXQgdGl0bGUgYW5kIG1lc3NhZ2UgYXJlIGEg
Yml0IG1pc2xlYWRpbmcuIHNob3VsZCBiZSBzb21ldGhpbmcgbGlrZQ0KPiINCj5BU29DOiBJbnRl
bDogYm9hcmRzOiBjbWxfcnQxMDExOiBzcGxpdCB3b29mZXIgYW5kIHR3ZWV0ZXIgc3VwcG9ydA0K
PlN1cHBvcnQgV29vZmVyIHN0ZXJlbyBzcGVha2VycyBieSBkZWZhdWx0IGFuZCBvcHRpb25hbGx5
IFR3ZWV0ZXIgc3RlcmVvIHNwZWFrZXJzIHdpdGggYSBETUkgcXVpcmsgIg0KTW9kaWZpZWQgdGhl
IHRpdGxlIGFuZCBtZXNzYWdlcy4NCg0KPiA+IEBAIC0zMDIsMTAgKzM3OCw4IEBAIFNORF9TT0Nf
REFJTElOS19ERUYoc3NwMV9waW4sDQo+ID4gICAJREFJTElOS19DT01QX0FSUkFZKENPTVBfQ1BV
KCJTU1AxIFBpbiIpKSk7DQo+ID4gICBTTkRfU09DX0RBSUxJTktfREVGKHNzcDFfY29kZWMsDQo+
ID4gICAJREFJTElOS19DT01QX0FSUkFZKA0KPiA+IC0JLyogV0wgKi8gQ09NUF9DT0RFQygiaTJj
LTEwRUMxMDExOjAwIiwNCj4gQ01MX1JUMTAxMV9DT0RFQ19EQUkpLA0KPiA+IC0JLyogV1IgKi8g
Q09NUF9DT0RFQygiaTJjLTEwRUMxMDExOjAxIiwNCj4gQ01MX1JUMTAxMV9DT0RFQ19EQUkpLA0K
PiA+IC0JLyogVEwgKi8gQ09NUF9DT0RFQygiaTJjLTEwRUMxMDExOjAyIiwNCj4gQ01MX1JUMTAx
MV9DT0RFQ19EQUkpLA0KPiA+IC0JLyogVFIgKi8gQ09NUF9DT0RFQygiaTJjLTEwRUMxMDExOjAz
IiwNCj4gQ01MX1JUMTAxMV9DT0RFQ19EQUkpKSk7DQo+ID4gKyAgICAgICAvKiBXTCAqLyBDT01Q
X0NPREVDKCJpMmMtMTBFQzEwMTE6MDAiLA0KPiBDTUxfUlQxMDExX0NPREVDX0RBSSksDQo+ID4g
KyAgICAgICAvKiBXUiAqLyBDT01QX0NPREVDKCJpMmMtMTBFQzEwMTE6MDEiLA0KPiA+ICsgQ01M
X1JUMTAxMV9DT0RFQ19EQUkpKSk7DQo+IA0KPiBpcyB0aGUgYWxpZ25tZW50IGNoYW5nZSBuZWVk
ZWQ/DQpOby4gRml4ZWQuDQo+IA0KPiA+IEBAIC00NTYsNiArNTI1LDY1IEBAIHN0YXRpYyBpbnQg
c25kX2NtbF9ydDEwMTFfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
PiAgIAlzbmRfc29jX2NhcmRfY21sLmRldiA9ICZwZGV2LT5kZXY7DQo+ID4gICAJcGxhdGZvcm1f
bmFtZSA9IG1hY2gtPm1hY2hfcGFyYW1zLnBsYXRmb3JtOw0KPiA+DQo+ID4gKwlkbWlfY2hlY2tf
c3lzdGVtKHNvZl9ydDEwMTFfcXVpcmtfdGFibGUpOw0KPiA+ICsNCj4gPiArCWRldl9pbmZvKCZw
ZGV2LT5kZXYsICJzb2ZfcnQxMDExX3F1aXJrID0gJWx4XG4iLCBzb2ZfcnQxMDExX3F1aXJrKTsN
Cj4gPiArDQo+ID4gKwlpZiAoc29mX3J0MTAxMV9xdWlyayAmIChTT0ZfUlQxMDExX1NQRUFLRVJf
VEwgfA0KPiA+ICsJCQkJU09GX1JUMTAxMV9TUEVBS0VSX1RSKSkgew0KPiA+ICsJCXJ0MTAxMV9k
YWlzX2NvbmZzID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsDQo+ID4gKwkJCQkJc2l6ZW9mKHN0
cnVjdCBzbmRfc29jX2NvZGVjX2NvbmYpICoNCj4gPiArCQkJCQlTUEtfQ0gsIEdGUF9LRVJORUwp
Ow0KPiA+ICsNCj4gPiArCQlpZiAoIXJ0MTAxMV9kYWlzX2NvbmZzKQ0KPiA+ICsJCQlyZXR1cm4g
LUVOT01FTTsNCj4gPiArDQo+ID4gKwkJcnQxMDExX2RhaXNfY29tcG9uZW50cyA9IGRldm1fa3ph
bGxvYygmcGRldi0+ZGV2LA0KPiA+ICsJCQkJCXNpemVvZihzdHJ1Y3QNCj4gc25kX3NvY19kYWlf
bGlua19jb21wb25lbnQpICoNCj4gPiArCQkJCQlTUEtfQ0gsIEdGUF9LRVJORUwpOw0KPiA+ICsN
Cj4gPiArCQlpZiAoIXJ0MTAxMV9kYWlzX2NvbXBvbmVudHMpDQo+ID4gKwkJCXJldHVybiAtRU5P
TUVNOw0KPiA+ICsNCj4gPiArCQlmb3IgKGkgPSAwOyBpIDwgU1BLX0NIOyBpKyspIHsNCj4gPiAr
CQkJcnQxMDExX2RhaXNfY29uZnNbaV0uZGxjLm5hbWUgPQ0KPiBkZXZtX2thc3ByaW50ZigmcGRl
di0+ZGV2LA0KPiA+ICsJCQkJCQkJCUdGUF9LRVJORUwsDQo+ID4gKwkJCQkJCQkJImkyYy0NCj4g
MTBFQzEwMTE6MCVkIiwNCj4gPiArCQkJCQkJCQlpKTsNCj4gDQo+IGlmICghcnQxMDExX2RhaXNf
Y29uZnNbaV0uZGxjLm5hbWUpDQo+ICAgICAgcmV0dXJuIC1FTk9NRU07DQphZGRlZCB0aGUgY2hl
Y2tzLg0KPiANCj4gPiArCQkJc3dpdGNoIChpKSB7DQo+ID4gKwkJCWNhc2UgMDoNCj4gPiArCQkJ
CXJ0MTAxMV9kYWlzX2NvbmZzW2ldLm5hbWVfcHJlZml4ID0gIldMIjsNCj4gPiArCQkJCWJyZWFr
Ow0KPiA+ICsNCj4gDQo+IHNwdXJpb3VzIG5ld2xpbmU/DQpSZW1vdmVkIHRoZSBuZXdsaW5lLg0K
PiANCj4gPiArCQkJY2FzZSAxOg0K
