Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9D5206928
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 02:52:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B121217EF;
	Wed, 24 Jun 2020 02:52:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B121217EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592959978;
	bh=8xPEmeMnOXxoW+Hfu7dYX53ElPLUoqIL5ZVyvM3Aqgs=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XaW2niSDCLtRSwKlQuv1FTpjk8xrpVpT0+vxyOyPZ9wmRwoBOxTzgmQZUhTzqzrxO
	 v5uqvNKJLD43bEVy5Eab/qbP+ZA7DkenwrtKMzgH68buW0Q83oJ+PWe4iH7Dd7xfII
	 wuWSAgGP9LFqfS9Ge/rMfoQd/EXksxdr2/V2Cf1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6A57F8023E;
	Wed, 24 Jun 2020 02:51:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E292F800B2; Wed, 24 Jun 2020 02:51:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D37CF800B2
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 02:51:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D37CF800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="h0AcrVDO"
IronPort-SDR: 8VIjR2AGGf4gja7kgF2IEWCbJkLXzhVH7NI3298faMkYqr882fWoH7FFzUnniFfHkVaV7V3NAz
 MDEW3PbgYHtw==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="162357861"
X-IronPort-AV: E=Sophos;i="5.75,273,1589266800"; d="scan'208";a="162357861"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 17:51:07 -0700
IronPort-SDR: f6c1prkNNeXi+AbbpWQaCHscfXy5sbWfwm8d9wc5HEs8zYe0Wev8sFC2ic8I3hvzem5OsgFF+B
 wz/84WVTG2Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,273,1589266800"; d="scan'208";a="353977582"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga001.jf.intel.com with ESMTP; 23 Jun 2020 17:51:07 -0700
Received: from fmsmsx122.amr.corp.intel.com (10.18.125.37) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 23 Jun 2020 17:51:07 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 fmsmsx122.amr.corp.intel.com (10.18.125.37) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 23 Jun 2020 17:51:07 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.50) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Tue, 23 Jun 2020 17:51:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eVPRKemWyBUUnbYnMVWTi91dkHN8QmYnX34D5UJVMdux6+vAs+dgGBTJPlPdfJHv0SjgwcO3UKwPgFOpdJLhbZ30PRhkowwwAONd3moU6QwjbKW8ny7y5dh/OgiUiNXPJsf803Z12jBYK+3QFj6sXg2XzXJY/8UpAfVzNaZ5qY6rsgjV1HHbkAx2zWV9oB5t7Xz2LDJZpEev2C2Rv6PH1YO6qFwP4EMP7rOACqG23sGi0NhEMj8BnRA56x72Ct7D2ZE003E6Kz36iLBaYr07wUpJIx4KK/1hSMy2caJqqqfpGsmTUprf1nCgE5WYEKbjoyiFK0ZA16I4hZXX1Mf6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xPEmeMnOXxoW+Hfu7dYX53ElPLUoqIL5ZVyvM3Aqgs=;
 b=PGwmGz1oNfDfS3RBqF8kr5Yk+4atVCFrBMK3pqlZme69aLgJEVj1r5Alf/ymfk4kIy+xlt7s2VbW4t8k1VSndEU7TwiRznPu/opklLHlTyPtiSQ0w8vyX1Wd+VfL8SWhh2qVTKRLexzS8zYwwC5MfgVOKxugbbQsy/LeQy7eGTXLHZogZcnD6GG+RdcYfPWIxw8IWEhkP4sAGOOm8fACaEh7f6JuikGSWE/PDtYuPF3oLnBVq98Lp4TWGMbbY6fs9+Tjx9sqiJ80EjQO7ctNhW63kG9OIsF4mdOvAXc0hF2h4LjEoEpsfP8WpaUMjw0gxHSp2e2wprSB0OK4fknHoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xPEmeMnOXxoW+Hfu7dYX53ElPLUoqIL5ZVyvM3Aqgs=;
 b=h0AcrVDOY7V7VJLUBRuiFKFQ8XMZC+x/CmFC5jVXtxOy97f/kVm2zHbI4UaMkvjflCPeBk1jomBnr+4A0fGFAbwhuKBg69NS+jGKXdT4DDErZjiWdWG7UP3Em6cFSCxds/gCZF9diruBUBN60OZwwoEpefsM3vKEtZeZNMjtOFs=
Received: from BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27)
 by BYAPR11MB3064.namprd11.prod.outlook.com (2603:10b6:a03:8c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Wed, 24 Jun
 2020 00:51:05 +0000
Received: from BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a]) by BY5PR11MB4307.namprd11.prod.outlook.com
 ([fe80::81b2:faf6:4cc3:261a%4]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 00:51:05 +0000
From: "N, Harshapriya" <harshapriya.n@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "tiwai@suse.de"
 <tiwai@suse.de>
Subject: RE: [PATCH] ALSA: hda/hdmi: Add Intel silent stream support
Thread-Topic: [PATCH] ALSA: hda/hdmi: Add Intel silent stream support
Thread-Index: AQHWSbYGKNZWQ4UFnkOTeQC1rScKPajm6WiAgAAFxQA=
Date: Wed, 24 Jun 2020 00:51:05 +0000
Message-ID: <BY5PR11MB43072BC337BA2E673D85B3B2FD950@BY5PR11MB4307.namprd11.prod.outlook.com>
References: <1592954796-12449-1-git-send-email-harshapriya.n@intel.com>
 <d9608b01-a111-d5ac-dcf7-c2dfdae79d08@linux.intel.com>
In-Reply-To: <d9608b01-a111-d5ac-dcf7-c2dfdae79d08@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d8b3ed79-9390-40b1-edf6-08d817d8acf4
x-ms-traffictypediagnostic: BYAPR11MB3064:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB3064439DC28D436D804FF955FD950@BYAPR11MB3064.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FO9zrJ+0DK4ifwVqcO5EJyluSpFkomU9xLXaR68S56LEdQ/s81sHeS4WgNoeZhAM4CrazXP8u5Np9vGjTL9hPNhfPj8948pmTckldo8lnhBqtzvsx5H2dDlTevUI/qM3Jp547kU067yG97IPyV1HtzlUElqx+bF5s2X5HEC5geMtEbEVcWGpR1Ht3irL4sJQy7i4QaExuNBa2/E9pmY9Aso3GglCD6v2i/EJtpHHNhzukLdDgHdslCX7bbKgNRCYHDUgEZhVkHYzLbJhoEB0bHK0AXvFsydRitxumoR4qk74e6Cs7GqkyNRTKt3RbFSQRfbdG1iMUQfLFLsKWxpSZw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(76116006)(9686003)(55016002)(478600001)(4326008)(8676002)(2906002)(8936002)(6506007)(26005)(186003)(316002)(110136005)(33656002)(52536014)(64756008)(66446008)(7696005)(66556008)(5660300002)(66476007)(66946007)(54906003)(86362001)(83380400001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Je2kZmEh7lr2ZfwVvb1viise5jb5d/cW8thi2vyhiFzJaEbD56WR8oeKPKU8NQKLk1jEwW1AgfCfE4fmefNAXhaUGbKNr/ANjcbxA45QaUVlQ9VlWRf4h5zXVn3CvhD6lFtdh3M9JODn5Cu0+nIgO+nBQ/TcF675GDMuUW0q81e+GLgZE66cqH3jQmoVOXEVAhLYQGY3sRXzpHBf397wKwGT1MZ6mRqh9PqG8KyqjkdQ/5Rwh0AfeThW7np9BJRix9+Gu0ND3bzmDzrp82lDJ4+XGBlVDKYDzGQx8pzH82cG64sqPD3r5vnN9Q8lX1T/7391X0ABkHzHpFCsnjZ3MUD+bn6GVTfDRSAB+Pg/PJIJPIvr5eHEPwkTvAdgERrlutGwnqEIzAqFuZz+lu1DGEa8WHs2qd08wZ13XH4MlWVuuz8i8AXHHkJw43pvmKz9I5FCmosNKy/YV2JivDY6j5CorrW/8xi04usZzgeEmYhJlvQ1Bz0cL4Dc1sZYW2go
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b3ed79-9390-40b1-edf6-08d817d8acf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 00:51:05.3333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ULy8+3RkCYMenIHzHmJWx5IqUHrDZ0fR11RcAIpM5NbVha2M4ECZe0SLtUSw1pW7BsPkmIO07NSaXBqa7dqarg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3064
X-OriginatorOrg: intel.com
Cc: "Vehmanen, Kai" <kai.vehmanen@intel.com>, "Jillela,
 Emmanuel" <emmanuel.jillela@intel.com>
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

PiANCj4gMiBuaXQtcGlja3MgdGhhdCBJIG1pc3NlZCBpbiBwcmV2aW91cyB2ZXJzaW9ucyBvZiB0
aGlzIHBhdGNoLCBzb3JyeToNCj4gDQo+ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvS2Nv
bmZpZyBiL3NvdW5kL3BjaS9oZGEvS2NvbmZpZyBpbmRleA0KPiA+IDdiYTU0MmU0NWEzZC4uODgw
NDgwODQxMGIzIDEwMDY0NA0KPiA+IC0tLSBhL3NvdW5kL3BjaS9oZGEvS2NvbmZpZw0KPiA+ICsr
KyBiL3NvdW5kL3BjaS9oZGEvS2NvbmZpZw0KPiA+IEBAIC0yMzIsNCArMjMyLDIwIEBAIGNvbmZp
ZyBTTkRfSERBX1BPV0VSX1NBVkVfREVGQVVMVA0KPiA+DQo+ID4gICBlbmRpZg0KPiA+DQo+ID4g
K2NvbmZpZyBTTkRfSERBX0lOVEVMX0hETUlfU0lMRU5UX1NUUkVBTQ0KPiA+ICsJYm9vbCAiRW5h
YmxlIFNpbGVudCBTdHJlYW0gYWx3YXlzIGZvciBIRE1JIg0KPiA+ICsJZGVwZW5kcyBvbiBTTkRf
SERBDQo+IA0KPiBuaXQtcGljazogc2hvdWxkIHRoaXMgYmUgJ2RlcGVuZHMgb24gU05EX0hEQV9J
TlRFTCc/DQo+IGlmIG5vdCwgdGhpcyAnZGVwZW5kcyBvbiBTTkRfSERBJyBpcyByZWR1bmRhbnQs
IGFscmVhZHkgd2l0aGluIGFuICdpZiBTTkRfSERBJw0KPiBibG9jaw0KYWNrLg0KPiANCj4gPiAr
CWhlbHANCj4gPiArCSAgSW50ZWwgaGFyZHdhcmUgaGFzIGEgZmVhdHVyZSBjYWxsZWQgJ3NpbGVu
dCBzdHJlYW0nLCB0aGF0DQo+ID4gKwkgIGtlZXBzIGV4dGVybmFsIEhETUkgcmVjZWl2ZXIncyBh
bmFsb2cgY2lyY3VpdHJ5IHBvd2VyZWQgb24NCj4gPiArCSAgYXZvaWRpbmcgMi0zIHNlYyBzaWxl
bmNlIGR1cmluZyBwbGF5YmFjayBzdGFydC4gVGhpcyBtZWNoYW5pc20NCj4gPiArCSAgcmVsaWVz
IG9uIGFuIGluZm8gcGFja2V0IGFuZCBwcmV2ZW50aW5nIHRoZSBjb2RlYyBmcm9tIGdvaW5nIHRv
DQo+ID4gKwkgIEQzLiAoaW5jcmVhc2luZyB0aGUgcGxhdGZvcm0gc3RhdGljIHBvd2VyIGNvbnN1
bXB0aW9uIHdoZW4gYQ0KPiA+ICsJICBIRE1JIHJlY2VpdmVyIGlzIHBsdWdnZWQtaW4pLiAyLTMg
c2VjIHNpbGVuY2UgYXQgdGhlIHBsYXliYWNrDQo+ID4gKwkgIHN0YXJ0IGlzIGV4cGVjdGVkIHdo
ZW5ldmVyIHRoZXJlIGlzIGZvcm1hdCBjaGFuZ2UuIChkZWZhdWx0IGlzDQo+ID4gKwkgIDIgY2hh
bm5lbCBmb3JtYXQpLg0KPiA+ICsJICBTYXkgWSB0byBlbmFibGUgU2lsZW50IFN0cmVhbSBmZWF0
dXJlLg0KPiA+ICsNCj4gPiArZW5kaWYNCj4gPiArDQo+IA0KPiBbLi4uXQ0KPiANCj4gPiAgIC8q
IHVwZGF0ZSBFTEQgYW5kIGphY2sgc3RhdGUgdmlhIGF1ZGlvIGNvbXBvbmVudCAqLw0KPiA+ICAg
c3RhdGljIHZvaWQgc3luY19lbGRfdmlhX2Fjb21wKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLA0K
PiA+ICAgCQkJICAgICAgIHN0cnVjdCBoZG1pX3NwZWNfcGVyX3BpbiAqcGVyX3BpbikNCj4gPiAg
IHsNCj4gPiAgIAlzdHJ1Y3QgaGRtaV9zcGVjICpzcGVjID0gY29kZWMtPnNwZWM7DQo+ID4gICAJ
c3RydWN0IGhkbWlfZWxkICplbGQgPSAmc3BlYy0+dGVtcF9lbGQ7DQo+ID4gKwlib29sIG1vbml0
b3JfcHJldiwgbW9uaXRvcl9uZXh0Ow0KPiA+DQo+ID4gICAJbXV0ZXhfbG9jaygmcGVyX3Bpbi0+
bG9jayk7DQo+ID4gICAJZWxkLT5tb25pdG9yX3ByZXNlbnQgPSBmYWxzZTsNCj4gPiArCW1vbml0
b3JfcHJldiA9IHBlcl9waW4tPnNpbmtfZWxkLm1vbml0b3JfcHJlc2VudDsNCj4gPiAgIAllbGQt
PmVsZF9zaXplID0gc25kX2hkYWNfYWNvbXBfZ2V0X2VsZCgmY29kZWMtPmNvcmUsIHBlcl9waW4t
DQo+ID5waW5fbmlkLA0KPiA+ICAgCQkJCSAgICAgIHBlcl9waW4tPmRldl9pZCwgJmVsZC0+bW9u
aXRvcl9wcmVzZW50LA0KPiA+ICAgCQkJCSAgICAgIGVsZC0+ZWxkX2J1ZmZlciwgRUxEX01BWF9T
SVpFKTsNCj4gPiAgIAllbGQtPmVsZF92YWxpZCA9IChlbGQtPmVsZF9zaXplID4gMCk7DQo+ID4g
ICAJdXBkYXRlX2VsZChjb2RlYywgcGVyX3BpbiwgZWxkLCAwKTsNCj4gPiArCW1vbml0b3JfbmV4
dCA9IHBlcl9waW4tPnNpbmtfZWxkLm1vbml0b3JfcHJlc2VudDsNCj4gPiAgIAltdXRleF91bmxv
Y2soJnBlcl9waW4tPmxvY2spOw0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBQb3dlci11cCB3
aWxsIGNhbGwgaGRtaV9wcmVzZW50X3NlbnNlLCBzbyB0aGUgUE0gY2FsbHMNCj4gPiArCSAqIGhh
dmUgdG8gYmUgZG9uZSB3aXRob3V0IG11dGV4IGhlbGQuDQo+ID4gKwkgKi8NCj4gPiArDQo+ID4g
KwlpZiAoZW5hYmxlX3NpbGVudF9zdHJlYW0pIHsNCj4gPiArCQlpZiAoIW1vbml0b3JfcHJldiAm
JiBtb25pdG9yX25leHQpIHsNCj4gPiArCQkJc25kX2hkYV9wb3dlcl91cF9wbShjb2RlYyk7DQo+
IA0KPiBuaXQtcGljazogaXMgdGhlcmUgYSBuZWVkIHRvIHRlc3QgdGhlIHJldHVybiB2YWx1ZT8g
SSBzZWUgdGhpcyBpbiBwYXRjaF9oZG1pLmMNClNpbmNlIHRoaXMgcGFyZW50IGZ1bmN0aW9uIHJl
dHVybnMgdm9pZCwgSSBjb3VsZCBwcm9iYWJseSBhZGQgYSBwcmludCBzdGF0aW5nIHRoZSBmYWls
dXJlLg0KPiANCj4gCXJldCA9IHNuZF9oZGFfcG93ZXJfdXBfcG0oY29kZWMpOw0KPiAJaWYgKHJl
dCA8IDAgJiYgcG1fcnVudGltZV9zdXNwZW5kZWQoaGRhX2NvZGVjX2Rldihjb2RlYykpKQ0KPiAJ
CWdvdG8gb3V0Ow0KPiANCj4gPiArCQkJc2lsZW50X3N0cmVhbV9lbmFibGUoY29kZWMsIHBlcl9w
aW4pOw0KPiA+ICsJCX0gZWxzZSBpZiAobW9uaXRvcl9wcmV2ICYmICFtb25pdG9yX25leHQpDQo+
ID4gKwkJCXNuZF9oZGFfcG93ZXJfZG93bl9wbShjb2RlYyk7DQo+ID4gKwl9DQo+ID4gICB9DQo+
ID4NCj4gPiAgIHN0YXRpYyB2b2lkIGhkbWlfcHJlc2VudF9zZW5zZShzdHJ1Y3QgaGRtaV9zcGVj
X3Blcl9waW4gKnBlcl9waW4sDQo+ID4gaW50IHJlcG9sbCkNCj4gPg0K
