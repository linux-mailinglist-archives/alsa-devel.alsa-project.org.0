Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCD61B2C56
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 18:18:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34A3616CA;
	Tue, 21 Apr 2020 18:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34A3616CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587485887;
	bh=Eioy51aCIV+RYTt3+Oy1D2ZF0zsuZf2bTexI3tvBqrA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X/sd9IsVqktyG/QDJ/83NLxXc5ToDL+5fpAPqWTCnRCXXkaK9vcyPPiSis1VJWwqA
	 Yvr5OQqC8kHHikSCxJCOIfLFpdRCESwqJlAXQaHp1CmG1RbAz6Q0Nbmx1FztAukT5f
	 GFxMwmtArfE7Fs78bj/cPVBICVxvBv+byByHR+RA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 481EEF8012F;
	Tue, 21 Apr 2020 18:16:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 761B7F80143; Tue, 21 Apr 2020 18:16:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DF7AF800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 18:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DF7AF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="WpriRTR4"
IronPort-SDR: WLkIPF64/cl7GMpu0uOwD5wcAZ0Mb9NKF/FXZuGfnmvCasNpRkBgoLwuI11oZfrlExltbLv2sf
 kVcNJV3tGaWQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 09:16:06 -0700
IronPort-SDR: +PKa34z4cA3nNWCvVcCKTH7tWlBTCKRHZSU8h6ehlyQP4/JT5gWnS3QPjNftMHzEh99aFVm6Cw
 BaDlmAcFAXeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,410,1580803200"; d="scan'208";a="456158373"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga005.fm.intel.com with ESMTP; 21 Apr 2020 09:16:05 -0700
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 21 Apr 2020 09:16:05 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX114.amr.corp.intel.com (10.18.116.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 21 Apr 2020 09:16:05 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Tue, 21 Apr 2020 09:16:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLDaDILkBWnwybTEkBDxo1/3h4XX6vmujJ/9YnFQpDN9hl3o4cl05SQ99Mai1UK01j6gvtbhlVnUKiHAaLaAPBtt+Gi+8LX8ULmw/shsl+Xy0p00nx/enwP0TSDMNmW5kpsd37R0p26IigxqRRCuU4o1i2VvUK8T6B/bneUI1357JWBlcrC/HRIn/2qbu3jeeJ+SqiSGMfVdq8QbYJtdo6gFVfOmFwMfLCba5OE/BbmIORjUItT4FPiidG99KGfRQB/k2o7kLXxckjpeSydevWIRXhKdJxHh+I8Y94e1+TE6xq1McFjPKUv5nTXCDt8NGSc25kH4qV7gJuRkqzIvBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eioy51aCIV+RYTt3+Oy1D2ZF0zsuZf2bTexI3tvBqrA=;
 b=ZTZXEEzmSaccaKfAyeT03fNHk63WPvOxifgxswhHuRuVcnJnLFuzEmC5ttMaE82WsDl476/tn34wrx6TTeAioHRIrRDbJFkdhI8FWL5nb/28YQj4cXu2APvs8sx3kRfx7d2GAESvp+Ec8+AfKV5ZCsZoEB7IDWSug8Amw8VTgQyqssbcTqoghhGn9zHeEm97TeQW9/bYC5C2jxyW5dcgu4m8fwSKrPhHNdHoTO1VKnEetNnRbgRmuvEGTgtWqp5K7n3ShbmmJKDWum6/v6zj1HTpkA4EZfbzVR2XdN4PTmYSR6YjppnHoQFgOwc8qgJ/K0yp0gFcltI7x+34X0I8EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eioy51aCIV+RYTt3+Oy1D2ZF0zsuZf2bTexI3tvBqrA=;
 b=WpriRTR4SCJexGtt+SwI7DTAN+DubxFQWnKl/+W2HRQjXyF5ijfhr57tWmWcWcfDuIQGmWb6VgttGUfptQISId3GzZ5H6Ytonz8kr6NAdHGKWD2LUQhv3fgo4fpjr2uYdJVQwhhi9wtSbWpsj0py7aKROyaQR9L9gyIXkg7jwLA=
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 (2603:10b6:405:5b::22) by BN6PR1101MB2324.namprd11.prod.outlook.com
 (2603:10b6:404:9d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 16:16:02 +0000
Received: from BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::344b:59bc:1455:37a6]) by BN6PR1101MB2132.namprd11.prod.outlook.com
 ([fe80::344b:59bc:1455:37a6%11]) with mapi id 15.20.2921.030; Tue, 21 Apr
 2020 16:16:02 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: sst: ipc command timeout
Thread-Topic: [PATCH] ASoC: Intel: sst: ipc command timeout
Thread-Index: AQHWDxGPcERmvVi2FUaZ0GDzXVeqv6h4uesAgAAAnRCAAFQWgIAEY1sg
Date: Tue, 21 Apr 2020 16:16:02 +0000
Message-ID: <BN6PR1101MB21328C54E66082227B9F497A97D50@BN6PR1101MB2132.namprd11.prod.outlook.com>
References: <1586506705-3194-1-git-send-email-brent.lu@intel.com>
 <4f495cf1-4740-cf3b-196f-cc850c503b43@linux.intel.com>
 <BN6PR1101MB21328B6F4147640D07F9E40A97DA0@BN6PR1101MB2132.namprd11.prod.outlook.com>
 <c8309abf-cbfb-a3db-5aa7-2e2f748a6d34@intel.com>
In-Reply-To: <c8309abf-cbfb-a3db-5aa7-2e2f748a6d34@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=brent.lu@intel.com; 
x-originating-ip: [36.230.114.95]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d36f221-71ee-4a82-0184-08d7e60f4963
x-ms-traffictypediagnostic: BN6PR1101MB2324:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR1101MB23244CB8B56612B64705AC3797D50@BN6PR1101MB2324.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1101MB2132.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(376002)(396003)(39860400002)(366004)(136003)(346002)(66446008)(66556008)(64756008)(66476007)(55016002)(110136005)(4326008)(9686003)(76116006)(86362001)(316002)(6506007)(7416002)(478600001)(52536014)(966005)(54906003)(66946007)(71200400001)(26005)(8936002)(186003)(8676002)(2906002)(7696005)(5660300002)(33656002)(81156014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QBzASi31nU9fvwaeNtYzn98b1yFZ8ZGJahqLZkiISb9uvQzk2b77eA4Ji44jrY0FU5EfjVVe9Tvn9t7WLgp6mOB1GJKTKvMbRxqKL8oNN7QfWb9ful+Na+URQL2sGoelW4Q8TaRRdvqh2azMdkjCiKAmlSkVRAzLQXHjZ/cXZnQn3zlnlfQOT5HZGj6lUjb4IWaf1kZgjb8wGrwH8Wgh9UGWN0UIOi2Bg8DrCT4+lgA/mJkzcbg8+RcptsAm/G4a1yPddxibk2LH2LXMJUVEZkehfxYF3puNotYxy85DjBZC094XXU0qEBm5yWNkPxNXNTs5X5qD/vskhW/Fyqo8kqv338V/PtP6Nhw1xjPE8kTxQsw6ZwqBnBpOuyvTyQUs8QigS5Z/kzt16ZFXZvrsiDL5LCj0iEQz+LYQF9WhYfU6+z96GdcEaCxWyjGZtIQtGNVMI5AZuz/weFldvlfcPP9BP+EGxl7g/IVrYlEVFm494b3SMDqU3kZ7a2Qlz52eUBtd7CqgMkAiB6QeeFiXeQ==
x-ms-exchange-antispam-messagedata: u0BZEGpa1xOP6lw0EvApb1ZsFoNU1TAorBjwu+F1a9bQl+IktxxXnk6kitABipBMXT+gENc8geh+0PUnlnw2ivHowJJuGdI4l4lVgTGHOVXBfYVZxivkTXtDpq+t98PKdrTCa9TZD/+9z0iWROqFHA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d36f221-71ee-4a82-0184-08d7e60f4963
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 16:16:02.5078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RhviamJvQCit1FO7iuleP8fa+frZ34Df0ftOTIaqdQtSR5Xhu7wCR6AdWx39kKqnTH05jDpRUtWOdVMNdZ5SRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2324
X-OriginatorOrg: intel.com
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Richard Fontana <rfontana@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "clang-built-linux@googlegroups.com" <clang-built-linux@googlegroups.com>,
 Mark Brown <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
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

PiANCj4gUmVncyB3aWR0aCBkaWZmZXJlbmNlIGJldHdlZW4gQkRXIGFuZCBCWVQgY29tZXMgZnJv
bSBzcGVjaWZpY2F0aW9uLiBCRFcNCj4gaGFzIElQQyByZWdpc3RlcnMgd2hpY2ggYXJlIDMyIHdp
ZGUuIFRoaXMgZmFjdCBhaW4ndCBleGFjdGx5IHRoZSByZWFzb24gdG8gbW9kaWZ5DQo+IHNzdF9z
aGltMzJfcmVhZDY0Lg0KPiANCj4gSSdtIHNoYXJpbmcgQW1hZGVvJ3MgcG9pbnQgb2Ygdmlldy4g
WW91ciBjaGFuZ2Ugc2hvdWxkIHNsb3cgZG93biBleGVjdXRpb24gYQ0KPiBiaXQgLSBidXQgdGhh
dCBtaWdodCBiZSBqdXN0IHdoYXQgaGFuZGxlcnMgbmVlZGVkIHRvIG1ha2UgZXZlcnl0aGluZyB3
b3JrIGFnYWluLg0KPiBEZWJ1ZyBwcmludHMgYWxzbyBzbG93IGRvd24gdGhlIGV4ZWN1dGlvbiB3
aGF0IGNvdWxkIGhhdmUgcHJldmVudGVkIHlvdSBmcm9tDQo+IHNwb3R0aW5nIHRoZSByZWFsIHBy
b2JsZW0uDQo+IExldCdzIGlnbm9yZSB0aGUgbWVtY3B5IHN0dWZmIGZvciBhIG1vbWVudCAtIGNv
dWxkIHlvdSBmb2N1cyBvbiBlbGFib3JhdGluZw0KPiB0aGUgc2NlbmFyaW8gd2hlcmUgc3VjaCBp
c3N1ZSBvY2N1cnM/IFlvdXIgaW5pdGlhbCBjb21taXQgbWVzc2FnZSBhbHNvIHNraXBzDQo+IGlt
cG9ydGFudCBiaXRzIHN1Y2ggYXMgcGxhdGZvcm0gdXNlZCB3aGVuIHJlcHJvZHVjaW5nIGFuZCBz
byBvbiwgcGxlYXNlIGFkZA0KPiB0aGVtLg0KPiANCj4gVGhhbmtzLA0KPiBDemFyZWsNCg0KVGhp
cyBpc3N1ZSBpcyByZXBvcnRlZCB0byBoYXBwZW4gb24gQllUIENocm9tZSBib29rIChyYW1iaSkg
b24gQ2hyb21lLXY0LjQNCmJyYW5jaCBhZnRlciBjaGFuZ2luZyB0b29sY2hhaW4gZnJvbSBjbGFu
ZzEwIHRvIGNsYW5nMTEuDQoNClRoZSByZXByb2R1Y2Ugc3RlcCBpcyBzaW1wbGUuIEp1c3QgcnVu
IGFyZWNvcmQgbXVsdGlwbGUgdGltZXMgKDwxMCkgdGhlbiB5b3Ugd2lsbA0Kc2VlIGVycm9yIG1l
c3NhZ2UgZm9yIGh3X3BhcmFtcyBpb2N0bCBmYWlsdXJlLg0KDQokIGFyZWNvcmQgLUQgaHc6MSww
IC1mIFMxNl9MRSAtYyAyIC9kZXYvbnVsbA0KJCBjdHJsK2MNCg0KVGhlIGVycm9yIG1lc3NhZ2Ug
c3VnZ2VzdHMgdGhlIHN0cmVhbSBjb21taXQgKElQQ19JQV9BTExPQ19TVFJFQU0sIDB4MjApIElQ
Qw0KY29tbWFuZCBmYWlsZWQgZHVlIHRvIHRpbWVvdXQgYnV0IHRoZSBtc2cgaWQgZmllbGQgb2Yg
aXBjZCByZWFkIGFmdGVyIHRoZSB0aW1lb3V0IGlzDQphbHNvIDB4MjAuIEl0IHNlZW1zIHRvIG1l
IHRoYXQgdGhlIGNvbW1hbmQgaXMgc3VjY2VzcyBidXQgdGhlIGhvc3QgZHJpdmVyIGRvZXMgbm90
DQprbm93IGl0IGZvciBzb21lIHJlYXNvbi4NCg0KMjAyMC0wMy0xNVQyMzowMjowNi42MTQxNTEr
MDA6MDAgRVJSIGtlcm5lbDogWyAgODUyLjAyMzc2Nl0gYmF5dHJhaWwtcGNtLWF1ZGlvIGJheXRy
YWlsLXBjbS1hdWRpbzogaXBjOiAtLW1lc3NhZ2UgdGltZW91dC0tIGlwY3ggMHgyMjIwIGlzciAw
eGYwMDIwIGlwY2QgMHgyMjIwIGltcnggMHgwDQoyMDIwLTAzLTE1VDIzOjAyOjA2LjYxNDIwOSsw
MDowMCBFUlIga2VybmVsOiBbICA4NTIuMDIzNzk2XSBiYXl0cmFpbC1wY20tYXVkaW8gYmF5dHJh
aWwtcGNtLWF1ZGlvOiBpcGM6IGVycm9yIHN0cmVhbSBjb21taXQgZmFpbGVkDQoyMDIwLTAzLTE1
VDIzOjAyOjA2LjYxNDIxOCswMDowMCBFUlIga2VybmVsOiBbICA4NTIuMDIzODEzXSAgQmF5dHJh
aWwgQXVkaW86IFBDTTogZmFpbGVkIHN0cmVhbSBjb21taXQgLTExMA0KMjAyMC0wMy0xNVQyMzow
MjowNi42MTQyMjUrMDA6MDAgRVJSIGtlcm5lbDogWyAgODUyLjAyMzgzMl0gYmF5dHJhaWwtcGNt
LWF1ZGlvIGJheXRyYWlsLXBjbS1hdWRpbzogQVNvQzogYmF5dHJhaWwtcGNtLWF1ZGlvIGh3IHBh
cmFtcyBmYWlsZWQ6IC0xMTANCg0KSSBhZGQgc29tZSBtZXNzYWdlcyB0byBtYWtlIHRoZSBsb2cg
ZWFzaWVyIHRvIHJlYWQuIFlvdSBjYW4gY2hlY2sgdGhlIGdlcnJpdCBsaW5rIGlmIHlvdQ0KYXJl
IGludGVyZXN0ZWQ6DQpodHRwczovL2Nocm9taXVtLXJldmlldy5nb29nbGVzb3VyY2UuY29tL2Mv
Y2hyb21pdW1vcy90aGlyZF9wYXJ0eS9rZXJuZWwvKy8yMTMxNTA3DQoNCkluIHRoZSB0ZXN0IHBh
dGNoIEkgcmVhZCB0aGUgU1NUX0lQQ0QgcmVnaXN0ZXIgaW4gc3N0X2J5dF9pcnFfdGhyZWFkKCkg
dHdpY2UgYW5kIGZvdW5kDQp0aGUgdmFsdWUgY291bGQgYmUgZGlmZmVyZW50LiBUaGUgSVBDX0lB
X0ZSRUVfU1RSRUFNKDB4MjEpIHNlZW1zIHRvIGJlIHRoZSBsYXN0IElQQw0KY29tbWFuZCBzZW50
IGluIHRoZSBwY21fcmVsZWFzZSBvZiBwcmV2aW91cyBhcmVjb3JkIGNvbW1hbmQuDQoNClsgIDEy
NS4wMDk3MjRdIHNvdW5kIHBjbUMxRDBjOiBzbmRfcGNtX3JlbGVhc2U6DQpbICAxMjUuMDA5NzMy
XSBiYXl0cmFpbC1wY20tYXVkaW8gYmF5dHJhaWwtcGNtLWF1ZGlvOiBpcGNfdHhfbWVzc2FnZTog
aGVhZGVyIDB4ODAwMDAwMDAwMDAwMDIyMSB3YWl0IDENClsgIDEyNS4wMDk3NjBdIGJheXRyYWls
LXBjbS1hdWRpbyBiYXl0cmFpbC1wY20tYXVkaW86IGJ5dF90eF9tc2c6IGhlYWRlciAweDgwMDAw
MDAwMDAwMDAyMjYNClsgIDEyNS4wMDk4MDNdIGJheXRyYWlsLXBjbS1hdWRpbyBiYXl0cmFpbC1w
Y20tYXVkaW86IHNzdF9ieXRfaXJxX3RocmVhZDogaGVhZGVyIDB4Mjk3DQpbICAxMjUuMDA5ODIz
XSBiYXl0cmFpbC1wY20tYXVkaW8gYmF5dHJhaWwtcGNtLWF1ZGlvOiBieXRfdHhfbXNnOiBoZWFk
ZXIgMHg4MDAwMDAwMDAwMDAwMjIxDQpbICAxMjUuMDA5ODcyXSBiYXl0cmFpbC1wY20tYXVkaW8g
YmF5dHJhaWwtcGNtLWF1ZGlvOiBzc3RfYnl0X2lycV90aHJlYWQ6IGhlYWRlciAweDI5Nw0KWyAg
MTI1LjAxMDQ0Ml0gYmF5dHJhaWwtcGNtLWF1ZGlvIGJheXRyYWlsLXBjbS1hdWRpbzogc3N0X2J5
dF9pcnFfdGhyZWFkOiBoZWFkZXIgMHg4MDAwMDAwMDAwMGMyMjI2DQpbICAxMjUuMDEwNDU2XSBi
YXl0cmFpbC1wY20tYXVkaW8gYmF5dHJhaWwtcGNtLWF1ZGlvOiBzc3RfaXBjX3JlcGx5X2ZpbmRf
bXNnOiBub3QgbWF0Y2gsIG1zZyBoZWFkZXIgMHg4MDAwMDAwMDAwMDAwMjIxDQpbICAxMjUuMDEw
NTExXSBiYXl0cmFpbC1wY20tYXVkaW8gYmF5dHJhaWwtcGNtLWF1ZGlvOiBzc3RfYnl0X2lycV90
aHJlYWQ6IGhlYWRlciAweDgwMDAwMDAwMDAwMDAyMjENClsgIDEyNS4wMTEzNTVdIGJheXRyYWls
LXBjbS1hdWRpbyBiYXl0cmFpbC1wY20tYXVkaW86IHR4X3dhaXRfZG9uZTogaXBjIHN1Y2Nlc3Ms
IGhlYWRlciAweDgwMDAwMDAwMDAwMDAyMjENClsgIDEyNS4zODA1MDZdIHNvdW5kIHBjbUMxRDBj
OiBzbmRfcGNtX2NhcHR1cmVfb3BlbjoNClsgIDEyNS4zODA1NDRdIHNvdW5kIHBjbUMxRDBjOiBz
bmRfcGNtX2NhcHR1cmVfaW9jdGwxOiBJTkZPDQpbICAxMjUuMzgwNTU0XSBzb3VuZCBwY21DMUQw
Yzogc25kX3BjbV9jYXB0dXJlX2lvY3RsMTogUFZFUlNJT04NClsgIDEyNS4zODA1NjFdIHNvdW5k
IHBjbUMxRDBjOiBzbmRfcGNtX2NhcHR1cmVfaW9jdGwxOiBUVFNUQU1QDQpbICAxMjUuMzgwNTgx
XSBzb3VuZCBwY21DMUQwYzogc25kX3BjbV9tbWFwOg0KWyAgMTI1LjM4MDYyMl0gc291bmQgcGNt
QzFEMGM6IHNuZF9wY21fbW1hcDoNClsgIDEyNS4zODA2NDhdIHNvdW5kIHBjbUMxRDBjOiBzbmRf
cGNtX2NhcHR1cmVfaW9jdGwxOiBJTkZPDQpbICAxMjUuMzgwNzE3XSBzb3VuZCBwY21DMUQwYzog
c25kX3BjbV9jYXB0dXJlX2lvY3RsMTogSFdfUkVGSU5FDQpbICAxMjUuMzgwNzM3XSBzb3VuZCBw
Y21DMUQwYzogc25kX3BjbV9jYXB0dXJlX2lvY3RsMTogSFdfUkVGSU5FDQpbICAxMjUuMzgwNzY2
XSBzb3VuZCBwY21DMUQwYzogc25kX3BjbV9jYXB0dXJlX2lvY3RsMTogSFdfUkVGSU5FDQpbICAx
MjUuMzgwNzc5XSBzb3VuZCBwY21DMUQwYzogc25kX3BjbV9jYXB0dXJlX2lvY3RsMTogSFdfUkVG
SU5FDQpbICAxMjUuMzgwNzg5XSBzb3VuZCBwY21DMUQwYzogc25kX3BjbV9jYXB0dXJlX2lvY3Rs
MTogSFdfUkVGSU5FDQpbICAxMjUuMzgwNzk5XSBzb3VuZCBwY21DMUQwYzogc25kX3BjbV9jYXB0
dXJlX2lvY3RsMTogSFdfUkVGSU5FDQpbICAxMjUuMzgwODA4XSBzb3VuZCBwY21DMUQwYzogc25k
X3BjbV9jYXB0dXJlX2lvY3RsMTogSFdfUkVGSU5FDQpbICAxMjUuMzgwODE1XSBzb3VuZCBwY21D
MUQwYzogc25kX3BjbV9jYXB0dXJlX2lvY3RsMTogSFdfUEFSQU1TDQpbICAxMjUuMzgwODM5XSBi
YXl0cmFpbC1wY20tYXVkaW8gYmF5dHJhaWwtcGNtLWF1ZGlvOiBpcGNfdHhfbWVzc2FnZTogaGVh
ZGVyIDB4ODAwMDAwMDAwMDY0MjIyMCB3YWl0IDENClsgIDEyNS4zODA4NTRdIGJheXRyYWlsLXBj
bS1hdWRpbyBiYXl0cmFpbC1wY20tYXVkaW86IGJ5dF90eF9tc2c6IGhlYWRlciAweDgwMDAwMDAw
MDA2NDIyMjANCj0+IHdyaXRlIElQQ19JQV9BTExPQ19TVFJFQU0gbWVzc2FnZSAoMHgyMCkgdG8g
U1NUX0lQQ1gNClsgIDEyNS4zODA5MzFdIGJheXRyYWlsLXBjbS1hdWRpbyBiYXl0cmFpbC1wY20t
YXVkaW86IHNzdF9ieXRfaXJxX3RocmVhZDogaGVhZGVyIDB4ODAwMDAwMDAwMDAwMDIyMQ0KPT4g
cmVhZCBtZXNzYWdlIHJlcGx5IGZyb20gU1NUX0lQQ0QgYW5kIGFuIElQQ19JQV9GUkVFX1NUUkVB
TSgweDIxKSBpcyByZXR1cm5lZA0KWyAgMTI1LjM4MDk0Ml0gYmF5dHJhaWwtcGNtLWF1ZGlvIGJh
eXRyYWlsLXBjbS1hdWRpbzogc3N0X2J5dF9pcnFfdGhyZWFkOiBpcGNkIDB4ODAwMDAwMDAwMDYw
MjIyMA0KPT4gcmVhZCBTU1RfSVBDRCBhZ2FpbiwgdGhpcyB0aW1lIHRoZSBtZXNzYWdlIGlkIGlz
IHdoYXQgd2UgYXJlIGV4cGVjdGVkICgweDIwKQ0KWyAgMTI1LjM4MDk0OF0gYmF5dHJhaWwtcGNt
LWF1ZGlvIGJheXRyYWlsLXBjbS1hdWRpbzogc3N0X2lwY19yZXBseV9maW5kX21zZzogbm90IG1h
dGNoLCBtc2cgaGVhZGVyIDB4ODAwMDAwMDAwMDY0MjIyMA0KWyAgMTI1LjY4MTE3MV0gYmF5dHJh
aWwtcGNtLWF1ZGlvIGJheXRyYWlsLXBjbS1hdWRpbzogdHhfd2FpdF9kb25lOiBpcGMgdGltZW91
dCwgaGVhZGVyIDB4ODAwMDAwMDAwMDY0MjIyMA0KWyAgMTI1LjY4MTIwNF0gYmF5dHJhaWwtcGNt
LWF1ZGlvIGJheXRyYWlsLXBjbS1hdWRpbzogaXBjOiAtLW1lc3NhZ2UgdGltZW91dC0tIGlwY3gg
MHgyMjIwIGlzciAweDUwMDIwIGlwY2QgMHgyMjIwIGltcnggMHgwDQpbICAxMjUuNjgxMjEyXSBi
YXl0cmFpbC1wY20tYXVkaW8gYmF5dHJhaWwtcGNtLWF1ZGlvOiBpcGM6IGVycm9yIHN0cmVhbSBj
b21taXQgZmFpbGVkDQpbICAxMjUuNjgxMjE3XSAgQmF5dHJhaWwgQXVkaW86IFBDTTogZmFpbGVk
IHN0cmVhbSBjb21taXQgLTExMA0KWyAgMTI1LjY4MTIyM10gYmF5dHJhaWwtcGNtLWF1ZGlvIGJh
eXRyYWlsLXBjbS1hdWRpbzogQVNvQzogYmF5dHJhaWwtcGNtLWF1ZGlvIGh3IHBhcmFtcyBmYWls
ZWQ6IC0xMTANCg0KUmVnYXJkcywNCkJyZW50DQo=
