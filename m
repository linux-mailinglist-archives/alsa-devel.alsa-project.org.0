Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 923FE186623
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 09:12:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A2BD189F;
	Mon, 16 Mar 2020 09:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A2BD189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584346364;
	bh=eNLWYQxvmRpA9HY8POM4Qds+GzStWtUaNO+kiCbdMHQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A7Z7GhFUZ5lKLH/Ws8Ha8qBMtcXuU0YcKlgyJKYHAE9W0BPp3cFVQDCkmsYTTlVcw
	 gG3dc5D7R49KqtdykEEYgyZj+Dqc/JW8bO5u31HXNzpqEdLgYvA/o/UA80ro6YQ4Mz
	 3x+5dKbncMcqtEwqHhjJtwzkOow8CU2dje3cs75g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D95A8F800D2;
	Mon, 16 Mar 2020 09:11:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4E87F8015B; Mon, 16 Mar 2020 09:10:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A799F800D2
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 09:10:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A799F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="eHhj+UbN"
IronPort-SDR: dnepKx70hajPHvumQkXjRWCUdLw9mzhLQDgyuIxhCCL+Q0DqsnLBWr07fK7Cef0hA3hBIVia2s
 zJmsA+MJvP7A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2020 01:10:43 -0700
IronPort-SDR: umjsl/qVlUa/0FRGUF+JDZsWog4MZb8N+221RYDlPOoEru4W6f+u7fDGNoW5Q7Uqbpn1kL5PRq
 nkQhq4eaOtPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,559,1574150400"; d="scan'208";a="417060111"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga005.jf.intel.com with ESMTP; 16 Mar 2020 01:10:42 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 16 Mar 2020 01:10:42 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 16 Mar 2020 01:10:42 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 16 Mar 2020 01:10:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 16 Mar 2020 01:10:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K2sVFkYTocQsa4/skw+2XaWlg9cAI5UZ8Xr6nE5lVq2ZyWZ23atdfcLKe/UDLAQ4O50eTWjvi8hWcUgPI5yQtnkW/G1lrfiNh6BYVXawVcrzmF9mB0xbjl+MurMtmKsyM/muF0gzspEph7YrTJv47s4GiJN1wgc6J0bsVyA47W2QQmg9RacQrwU5OldUmRzuBjkKVZrlws4R/LJAIWo3dpqlnkZ2JNO1iHy8mBvOKRqI7Xj/LOZZQYfJ9HPKr90muO/HpQkfPYQX4jBkLQjs+W2mQCRH7+KeKYu3MotK/gWirFYw5S3dyGjRRx6nX2uSlg3WAD7aUK2Nx7vCvZ+l9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNLWYQxvmRpA9HY8POM4Qds+GzStWtUaNO+kiCbdMHQ=;
 b=TAH5vBmP2Glp2+13ztT9fL/EzhtoTGyMK+AqjgHwKki/kZroI3MrZ4Ny1FR/qGl0DAzgjSa1wJvG/1PAPY/+ef6hlWCuY/4WzhrfOlgM1/p1U0fkWMyO3SIxrPVnsAmhKYhxDC9LFo9kyT05JxCxSTr548LAIBVyFtAZAMWgXkWP/S421Ok3e+7X32yO63mdzpVtX82KEuKOXv5LiAkE4z6NlZigN4XW88ZH+JXQspliaMQOYWpG4y98393OJMEsCZQ2GbVM+kBMnMVH0Ol82MiRWmuxvaqnpSr8UYtXDeBWG4pGct+goVhd+LtiAoShaOx4vF1GgH/G80vKCX6hcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNLWYQxvmRpA9HY8POM4Qds+GzStWtUaNO+kiCbdMHQ=;
 b=eHhj+UbN4CVi2ar8w8xYsyZLTFhylFO7JFL4vX6jjHWKoSQycWYvdILMHEhBdCqVfgSyL2SBBk2L+12oy1EkcFfIhiwOpkCCalgXHXqLhdRn+NOvWNJm60OcfmP6OZenMq5sWHDqpI2zG+hvNjH4cyXVwgCzTTuahbeNB8g9u7Y=
Received: from MWHPR1101MB2128.namprd11.prod.outlook.com
 (2603:10b6:301:55::23) by MWHPR1101MB2142.namprd11.prod.outlook.com
 (2603:10b6:301:56::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.19; Mon, 16 Mar
 2020 08:10:39 +0000
Received: from MWHPR1101MB2128.namprd11.prod.outlook.com
 ([fe80::b8c1:27cf:26ee:936b]) by MWHPR1101MB2128.namprd11.prod.outlook.com
 ([fe80::b8c1:27cf:26ee:936b%9]) with mapi id 15.20.2814.019; Mon, 16 Mar 2020
 08:10:38 +0000
From: "Chiang, Mac" <mac.chiang@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: boards: add stereo playback by woofer speaker
Thread-Topic: [PATCH] ASoC: Intel: boards: add stereo playback by woofer
 speaker
Thread-Index: AQHV9r/Le1TKlGAffU+f47xex+ZzH6hCDsoAgAjJgOA=
Date: Mon, 16 Mar 2020 08:10:38 +0000
Message-ID: <MWHPR1101MB2128D63AAB43BDDE136C763A84F90@MWHPR1101MB2128.namprd11.prod.outlook.com>
References: <1583833125-7017-1-git-send-email-mac.chiang@intel.com>
 <daf627d0-ffe3-5e18-324d-4d115ec34952@linux.intel.com>
In-Reply-To: <daf627d0-ffe3-5e18-324d-4d115ec34952@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mac.chiang@intel.com; 
x-originating-ip: [192.55.52.203]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bd2fea4-b2ec-4790-eabc-08d7c9818375
x-ms-traffictypediagnostic: MWHPR1101MB2142:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB2142A86C5CCF1DAE4F62167284F90@MWHPR1101MB2142.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03449D5DD1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(396003)(366004)(39860400002)(376002)(199004)(4326008)(86362001)(6506007)(7696005)(2906002)(26005)(186003)(52536014)(76116006)(66946007)(8676002)(66556008)(66476007)(66446008)(64756008)(33656002)(478600001)(5660300002)(81166006)(81156014)(9686003)(55016002)(316002)(54906003)(110136005)(8936002)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR1101MB2142;
 H:MWHPR1101MB2128.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SYnnKguXDz7+NEvbMbxtetNVX0JKnmJdytyrHaaILaiOFwo4TlmFLlO5uuKnFzeEGXojlq9uRaNbaYRIsJw/1KPOJ7I6S/1kZNtNEZZdlcg5hfDnYRCWMFVScmalZ+ZpHy9T9j8S/QQ5EWeqiWUIsTpsL2Je9VfR63RAF17AJ7cA5srWfhQwesxNLIJ5Dc65CYN0rNW9vq8TGJBKj8M7D6u7y2x670YrL+kGXgIhlOBO/u03wkHGBOjTSttSZk1dCoESS3bdFU8kTAWYxzOZ1SkCTJaZiKmIok25okSCCJKJw4zCYrcBCZTmgaYIKrwXhYj+WItQ1358BoOVpmD7SJq+8y8KOMc/0Br+j0NNSyZUZemBLAhcowLJDxFxUdEB7DSENbfwyJhWXWB0ZUJ2JFHk3o8R/bpHwxM3Idud64KdOxqMpAkXkM3XKtlv7tFB
x-ms-exchange-antispam-messagedata: MHPnDX1XYM30SgomhTKTmX87vvb6hakY6KTdRT6zhYr0YXVdriq39mngvY4jSl23e3+VCZzKmC5XxB9iAT2CyMeMMuQE/4rkXAM/bxh+EGBbq7cG6rib5nJueZ7v1yBvBPTW2BP0pNC5Y+d+ZCAYCA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd2fea4-b2ec-4790-eabc-08d7c9818375
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2020 08:10:38.8652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TDh0bS1W8yDNFv+5YBlbyhndIAEfHVd30T9LBfBxNRpXlK/FOBLYzrXvRCP5O1VOHDZzLwFysZzAih2HXv8YYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2142
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

PiBIaSBNYWMsDQo+IA0KPiA+ICsjZGVmaW5lIFNPRl9SVDEwMTFfU1BFQUtFUl9XTAkJQklUKDAp
DQo+ID4gKyNkZWZpbmUgU09GX1JUMTAxMV9TUEVBS0VSX1dSCQlCSVQoMSkNCj4gPiArI2RlZmlu
ZSBTT0ZfUlQxMDExX1NQRUFLRVJfVEwJCUJJVCgyKQ0KPiA+ICsjZGVmaW5lIFNPRl9SVDEwMTFf
U1BFQUtFUl9UUgkJQklUKDMpDQo+ID4gKyNkZWZpbmUgU1BLX0NIIDQNCj4gDQo+IHVzZSBhIHBy
ZWZpeCBtYXliZSBmb3IgY29uc2lzdGVuY3k/DQpZZXMuIENvbnNpZGVyaW5nIHRoYXQgd2UgaGF2
ZSBXb29mZXJzIGFuZCBUd2VldGVycyBzcGVha2VycyBjb25zaXN0ZW5jaWVzLg0KPiBJdCdzIGFs
c28gdW5jbGVhciB3aHkgdGhpcyBpcyBuZWVkZWQgd2hlbiB5b3UgY2FuIGhhdmUgMiBvciBtb3Jl
IGNoYW5uZWxzLA0KPiBhbmQgbG9va2luZyBiZWxvdw0KPiANCj4gPiArDQo+ID4gKy8qIERlZmF1
bHQ6IFdvb2ZlcitUd2VldGVyIHNwZWFrZXJzICAqLw0KLyogRGVmYXVsdDogV29vZmVyIHNwZWFr
ZXJzICAqLw0KPiANCj4gSXQncyBtb3JlIGxpa2UgQUxMIGRldmljZXMgaGF2ZSBXb29mZXJzLg0K
PiBTb21lIGRldmljZXMgZG9uJ3QgaGF2ZSB0d2VldGVycy4NCj4gDQo+IHRoZSBXTCBhbmQgV1Ig
cXVpcmtzIGFyZSBhbHdheXMgb24gYXBwYXJlbnRseS4NClllcywgeW91IGFyZSByaWdodC4gVGhl
IHB1cnBvc2UgdG8gZG8gaXMgV29vZmVycyBhcyBkZWZhdWx0IGFuZCBUd2VldGVycytXb29mZXJz
IGFzIHNwZWNpZmljIHByb2plY3QuIEkgcmV2aXNlZCB0aGVtIGJlbG93LiBPciBhbnkgYWR2aWNl
cz8NCj4gDQo+ID4gK3N0YXRpYyB1bnNpZ25lZCBsb25nIHNvZl9ydDEwMTFfcXVpcmsgPSBTT0Zf
UlQxMDExX1NQRUFLRVJfV0wgfA0KPiBTT0ZfUlQxMDExX1NQRUFLRVJfV1IgfA0KPiA+ICsJCQkJ
CVNPRl9SVDEwMTFfU1BFQUtFUl9UTCB8DQo+IFNPRl9SVDEwMTFfU1BFQUtFUl9UUjsNCnN0YXRp
YyB1bnNpZ25lZCBsb25nIHNvZl9ydDEwMTFfcXVpcmsgPSBTT0ZfUlQxMDExX1NQRUFLRVJfV0wg
fCBTT0ZfUlQxMDExX1NQRUFLRVJfV1I7DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHNvZl9ydDEw
MTFfcXVpcmtfY2IoY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgKmlkKSB7DQo+ID4gKwlzb2Zf
cnQxMDExX3F1aXJrID0gKHVuc2lnbmVkIGxvbmcpaWQtPmRyaXZlcl9kYXRhOw0KPiA+ICsJcmV0
dXJuIDE7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3Rl
bV9pZCBzb2ZfcnQxMDExX3F1aXJrX3RhYmxlW10gPSB7DQo+ID4gKwl7DQo+ID4gKwkJLmNhbGxi
YWNrID0gc29mX3J0MTAxMV9xdWlya19jYiwNCj4gPiArCQkubWF0Y2hlcyA9IHsNCj4gPiArCQkJ
RE1JX01BVENIKERNSV9TWVNfVkVORE9SLCAiR29vZ2xlIiksDQo+ID4gKwkJCURNSV9NQVRDSChE
TUlfUFJPRFVDVF9OQU1FLCAiUGFsa2lhIiksDQoJCQlETUlfTUFUQ0goRE1JX1BST0RVQ1RfTkFN
RSwgIkhlbGlvcyIpLA0KPiA+ICsJfSwNCj4gPiArCQkuZHJpdmVyX2RhdGEgPSAodm9pZCAqKShT
T0ZfUlQxMDExX1NQRUFLRVJfV0wgfA0KPiA+ICsJCQkJCVNPRl9SVDEwMTFfU1BFQUtFUl9XUiks
DQoJCS5kcml2ZXJfZGF0YSA9ICh2b2lkICopKFNPRl9SVDEwMTFfU1BFQUtFUl9XTCB8IFNPRl9S
VDEwMTFfU1BFQUtFUl9XUiB8DQoJCQkJCVNPRl9SVDEwMTFfU1BFQUtFUl9UTCB8IFNPRl9SVDEw
MTFfU1BFQUtFUl9UUiksDQo+ID4gKwl9LA0KPiA+ICsJew0KPiA+ICsJfQ0KPiA+ICt9Ow0KPiAN
Cj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0IGNtbF9ydDEwMTFf
dHRfd2lkZ2V0c1tdID0gew0KPiA+ICsJU05EX1NPQ19EQVBNX1NQSygiVEwgRXh0IFNwayIsIE5V
TEwpLA0KPiA+ICsJU05EX1NPQ19EQVBNX1NQSygiVFIgRXh0IFNwayIsIE5VTEwpLCB9Ow0KPiA+
ICsNCj4gPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYXBtX3JvdXRlIGNtbF9ydDEw
MTFfcnQ1NjgyX21hcFtdID0gew0KPiA+ICAgCS8qc3BlYWtlciovDQo+ID4gICAJeyJUTCBFeHQg
U3BrIiwgTlVMTCwgIlRMIFNQTyJ9LA0KPiANCj4gU29tZXRoaW5nJ3Mgbm90IHJpZ2h0LCBpZiBJ
IGxvb2sgYXQgdGhlIGNvZGUgYWZ0ZXIgYXBwbHlpbmcgdGhpcyBwYXRjaCBJDQo+IGdldDoNCj4g
DQo+IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYXBtX3JvdXRlIGNtbF9ydDEwMTFfcnQ1
NjgyX21hcFtdID0gew0KPiAJLypzcGVha2VyKi8NCj4gCXsiVEwgRXh0IFNwayIsIE5VTEwsICJU
TCBTUE8ifSwNCj4gCXsiVFIgRXh0IFNwayIsIE5VTEwsICJUUiBTUE8ifSwNCj4gDQo+IFRoYXQn
cyBkdXBsaWNhZ2VkIGZyb20gWzFdDQpUcnVlLiBNeSBtaXN0YWtlLCBqdXN0IHJlbWFpbiBvbmUo
YXBhcnQgZnJvbSBydDEwMTFfcnQ1NjgyX21hcCkuDQo+IA0KPiA+IEBAIC04Miw2ICsxMTgsMTIg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhcG1fcm91dGUNCj4gY21sX3J0MTAxMV9y
dDU2ODJfbWFwW10gPSB7DQo+ID4gICAJeyJETWljIiwgTlVMTCwgIlNvQyBETUlDIn0sDQo+ID4g
ICB9Ow0KPiA+DQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYXBtX3JvdXRlIGNt
bF9ydDEwMTFfdHRfbWFwW10gPSB7DQo+ID4gKwkvKlRML1RSIHNwZWFrZXIqLw0KPiA+ICsJeyJU
TCBFeHQgU3BrIiwgTlVMTCwgIlRMIFNQTyIgfSwNCj4gPiArCXsiVFIgRXh0IFNwayIsIE5VTEws
ICJUUiBTUE8iIH0sDQo+ID4gK307DQo+IA0KPiBbMV0gd2Ugc2hvdWxkIHJlbW92ZSB0aGUgdHdl
ZWV0ZXIgbWFwcyBpbiBjbWxfcnQxMDExX3J0NTY4Ml9tYXAsIG5vPw0KWWVzLiBSZW1vdmUgdHdl
ZXRlcnMgZnJvbSBydDEwMTFfcnQ1NjgyX21hcC4NCj4gDQo+ID4gICBzdGF0aWMgaW50IGNtbF9y
dDU2ODJfaHdfcGFyYW1zKHN0cnVjdCBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLA0KPiA+
ICAgCQkJCXN0cnVjdCBzbmRfcGNtX2h3X3BhcmFtcyAqcGFyYW1zKQ0KPiA+ICAgew0KPiA+IEBA
IC0xOTIsMzEgKzI2Myw1MiBAQCBzdGF0aWMgaW50IGNtbF9ydDEwMTFfaHdfcGFyYW1zKHN0cnVj
dA0KPiBzbmRfcGNtX3N1YnN0cmVhbSAqc3Vic3RyZWFtLA0KPiA+ICAgCQkgKiBUaGUgZmVlZGJh
Y2sgaXMgY2FwdHVyZWQgZm9yIGVhY2ggY29kZWMgaW5kaXZpZHVhbGx5Lg0KPiA+ICAgCQkgKiBI
ZW5jZSBhbGwgNCBjb2RlY3MgdXNlIDEgVHggc2xvdCBlYWNoIGZvciBmZWVkYmFjay4NCj4gPiAg
IAkJICovDQo+ID4gLQkJaWYgKCFzdHJjbXAoY29kZWNfZGFpLT5jb21wb25lbnQtPm5hbWUsICJp
MmMtDQo+IDEwRUMxMDExOjAwIikpIHsNCj4gPiAtCQkJcmV0ID0gc25kX3NvY19kYWlfc2V0X3Rk
bV9zbG90KGNvZGVjX2RhaSwNCj4gPiAtCQkJCQkJICAgICAgIDB4NCwgMHgxLCA0LCAyNCk7DQo+
ID4gLQkJCWlmIChyZXQgPCAwKQ0KPiA+IC0JCQkJYnJlYWs7DQo+ID4gLQkJfQ0KPiA+IC0JCWlm
ICghc3RyY21wKGNvZGVjX2RhaS0+Y29tcG9uZW50LT5uYW1lLCAiaTJjLQ0KPiAxMEVDMTAxMTow
MiIpKSB7DQo+ID4gLQkJCXJldCA9IHNuZF9zb2NfZGFpX3NldF90ZG1fc2xvdChjb2RlY19kYWks
DQo+ID4gLQkJCQkJCSAgICAgICAweDEsIDB4MSwgNCwgMjQpOw0KPiA+IC0JCQlpZiAocmV0IDwg
MCkNCj4gPiAtCQkJCWJyZWFrOw0KPiA+IC0JCX0NCj4gPiAtCQkvKiBURE0gUnggc2xvdCAyIGlz
IHVzZWQgZm9yIFJpZ2h0IFdvb2ZlciAmIFR3ZWV0ZXJzIHBhaXIgKi8NCj4gPiAtCQlpZiAoIXN0
cmNtcChjb2RlY19kYWktPmNvbXBvbmVudC0+bmFtZSwgImkyYy0NCj4gMTBFQzEwMTE6MDEiKSkg
ew0KPiA+IC0JCQlyZXQgPSBzbmRfc29jX2RhaV9zZXRfdGRtX3Nsb3QoY29kZWNfZGFpLA0KPiA+
IC0JCQkJCQkgICAgICAgMHg4LCAweDIsIDQsIDI0KTsNCj4gPiAtCQkJaWYgKHJldCA8IDApDQo+
ID4gLQkJCQlicmVhazsNCj4gPiAtCQl9DQo+ID4gLQkJaWYgKCFzdHJjbXAoY29kZWNfZGFpLT5j
b21wb25lbnQtPm5hbWUsICJpMmMtDQo+IDEwRUMxMDExOjAzIikpIHsNCj4gPiAtCQkJcmV0ID0g
c25kX3NvY19kYWlfc2V0X3RkbV9zbG90KGNvZGVjX2RhaSwNCj4gPiAtCQkJCQkJICAgICAgIDB4
MiwgMHgyLCA0LCAyNCk7DQo+ID4gLQkJCWlmIChyZXQgPCAwKQ0KPiA+IC0JCQkJYnJlYWs7DQo+
ID4gKwkJaWYgKHNvZl9ydDEwMTFfcXVpcmsgJiAoU09GX1JUMTAxMV9TUEVBS0VSX1RMIHwNCj4g
PiArCQkJCQlTT0ZfUlQxMDExX1NQRUFLRVJfVFIpKSB7DQo+ID4gKwkJCWlmICghc3RyY21wKGNv
ZGVjX2RhaS0+Y29tcG9uZW50LT5uYW1lLCAiaTJjLQ0KPiAxMEVDMTAxMTowMCIpKSB7DQo+ID4g
KwkJCQlyZXQgPSBzbmRfc29jX2RhaV9zZXRfdGRtX3Nsb3QoY29kZWNfZGFpLA0KPiA+ICsJCQkJ
CQkJICAgICAgIDB4NCwgMHgxLCA0LCAyNCk7DQo+ID4gKwkJCQlpZiAocmV0IDwgMCkNCj4gPiAr
CQkJCQlicmVhazsNCj4gPiArCQkJfQ0KPiA+ICsNCj4gPiArCQkJaWYgKCFzdHJjbXAoY29kZWNf
ZGFpLT5jb21wb25lbnQtPm5hbWUsICJpMmMtDQo+IDEwRUMxMDExOjAyIikpIHsNCj4gPiArCQkJ
CXJldCA9IHNuZF9zb2NfZGFpX3NldF90ZG1fc2xvdChjb2RlY19kYWksDQo+ID4gKwkJCQkJCQkg
ICAgICAgMHgxLCAweDEsIDQsIDI0KTsNCj4gPiArCQkJCWlmIChyZXQgPCAwKQ0KPiA+ICsJCQkJ
CWJyZWFrOw0KPiA+ICsJCQl9DQo+ID4gKw0KPiA+ICsJCQkvKiBURE0gUnggc2xvdCAyIGlzIHVz
ZWQgZm9yIFJpZ2h0IFdvb2ZlciAmIFR3ZWV0ZXJzDQo+IHBhaXIgKi8NCj4gPiArCQkJaWYgKCFz
dHJjbXAoY29kZWNfZGFpLT5jb21wb25lbnQtPm5hbWUsICJpMmMtDQo+IDEwRUMxMDExOjAxIikp
IHsNCj4gPiArCQkJCXJldCA9IHNuZF9zb2NfZGFpX3NldF90ZG1fc2xvdChjb2RlY19kYWksDQo+
ID4gKwkJCQkJCQkgICAgICAgMHg4LCAweDIsIDQsIDI0KTsNCj4gPiArCQkJCWlmIChyZXQgPCAw
KQ0KPiA+ICsJCQkJCWJyZWFrOw0KPiA+ICsJCQl9DQo+ID4gKw0KPiA+ICsJCQlpZiAoIXN0cmNt
cChjb2RlY19kYWktPmNvbXBvbmVudC0+bmFtZSwgImkyYy0NCj4gMTBFQzEwMTE6MDMiKSkgew0K
PiA+ICsJCQkJcmV0ID0gc25kX3NvY19kYWlfc2V0X3RkbV9zbG90KGNvZGVjX2RhaSwNCj4gPiAr
CQkJCQkJCSAgICAgICAweDIsIDB4MiwgNCwgMjQpOw0KPiA+ICsJCQkJaWYgKHJldCA8IDApDQo+
ID4gKwkJCQkJYnJlYWs7DQo+ID4gKwkJCX0NCj4gPiArCQl9IGVsc2Ugew0KPiA+ICsJCQlpZiAo
IXN0cmNtcChjb2RlY19kYWktPmNvbXBvbmVudC0+bmFtZSwgImkyYy0NCj4gMTBFQzEwMTE6MDAi
KSkgew0KPiA+ICsJCQkJcmV0ID0gc25kX3NvY19kYWlfc2V0X3RkbV9zbG90KGNvZGVjX2RhaSwN
Cj4gPiArCQkJCQkJCSAgICAgICAweDQsIDB4MSwgNCwgMjQpOw0KPiA+ICsJCQkJaWYgKHJldCA8
IDApDQo+ID4gKwkJCQkJYnJlYWs7DQo+ID4gKwkJCX0NCj4gPiArDQo+ID4gKwkJCWlmICghc3Ry
Y21wKGNvZGVjX2RhaS0+Y29tcG9uZW50LT5uYW1lLCAiaTJjLQ0KPiAxMEVDMTAxMTowMSIpKSB7
DQo+ID4gKwkJCQlyZXQgPSBzbmRfc29jX2RhaV9zZXRfdGRtX3Nsb3QoY29kZWNfZGFpLA0KPiA+
ICsJCQkJCQkJICAgICAgIDB4OCwgMHgyLCA0LCAyNCk7DQo+ID4gKwkJCQlpZiAocmV0IDwgMCkN
Cj4gPiArCQkJCQlicmVhazsNCj4gPiArCQkJfQ0KPiA+ICAgCQl9DQo+IA0KPiB0aGUgaWYvZWxz
ZSBjYXNlIGNhbiBiZSBzaW1wbGlmaWVkLiBUaGUgYmFzZWxpbmUgaXMgdHdvIHdvb2ZlcnMsIHNv
IHRoZXkgY2FuIGJlDQo+IGFkZGVkIHVuY29uZGl0aW9uYWxseSwgYW5kIHRoZW4geW91IGNhbiBh
ZGQgd2hhdCdzIG1pc3NpbmcgZm9yIHRoZSB0d2VldGVycy4NCj4gVGhhdCB3YXkgeW91IGhhdmUg
YSBjb25zaXN0ZW50IHdheSBvZiBoYW5kbGluZyB0aGUgVEwvVFIgcXVpcmsuDQpUaGFua3MgZm9y
IGFkZHJlc3NpbmcuIEkgcmV2aXNlZCB0aGUgaWYvZWxzZSBsb2dpYyBiZWxvdw0KCQlpZiAoc29m
X3J0MTAxMV9xdWlyayAmIChTT0ZfUlQxMDExX1NQRUFLRVJfV0wgfA0KCQkJCQlTT0ZfUlQxMDEx
X1NQRUFLRVJfV1IpKSB7DQoJCQkvKiBURE0gc2xvdHMgZm9yIFdML1dSICovDQoJCQkuLi4uDQoJ
CX0NCgkJaWYgKHNvZl9ydDEwMTFfcXVpcmsgJiAoU09GX1JUMTAxMV9TUEVBS0VSX1RMIHwNCgkJ
CQkJU09GX1JUMTAxMV9TUEVBS0VSX1RSKSkgew0KCQkJLyogVERNIHNsb3RzIGZvciBUTC9UUiAq
Lw0KCQkJLi4uDQoJCX0NCg0KPiA+ICAgc3RhdGljIGludCBzbmRfY21sX3J0MTAxMV9wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgew0KPiA+ICsJc3RydWN0IHNuZF9z
b2NfZGFpX2xpbmtfY29tcG9uZW50ICpydDEwMTFfZGFpc19jb21wb25lbnRzOw0KPiA+ICsJc3Ry
dWN0IHNuZF9zb2NfY29kZWNfY29uZiAqcnQxMDExX2RhaXNfY29uZnM7DQo+ID4gICAJc3RydWN0
IGNhcmRfcHJpdmF0ZSAqY3R4Ow0KPiA+ICAgCXN0cnVjdCBzbmRfc29jX2FjcGlfbWFjaCAqbWFj
aDsNCj4gPiAgIAljb25zdCBjaGFyICpwbGF0Zm9ybV9uYW1lOw0KPiA+IC0JaW50IHJldDsNCj4g
PiArCWludCByZXQsIGk7DQo+ID4NCj4gPiAgIAljdHggPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRl
diwgc2l6ZW9mKCpjdHgpLCBHRlBfQVRPTUlDKTsNCj4gDQo+IEQnb2ghIERpZCB3ZSBhZ2FpbiBs
ZXQgdGhpcyBzbGlwIGluPw0KPiANCj4gY21sX3J0MTAxMV9ydDU2ODIuYzogICAgY3R4ID0gZGV2
bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqY3R4KSwNCj4gR0ZQX0FUT01JQyk7DQo+IHNv
Zl9kYTcyMTlfbWF4OTgzNzMuYzogIGN0eCA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXpl
b2YoKmN0eCksDQo+IEdGUF9BVE9NSUMpOw0KPiANCj4gVGhpcyBzaG91bGQgYmUgZml4ZWQgaW4g
YSBzZXBhcmF0ZSBwYXRjaCwgd2UgZG9uJ3QgbmVlZCB0aCBBVE9NSUMgYXR0cmlidXRlIGluDQo+
IGFueSBtYWNoaW5lIGRyaXZlcnMgLSBjb3B5LXBhc3RlIQ0KQ29weSB0aGF0Lg0KPiANCj4gPiAg
IAlpZiAoIWN0eCkNCj4gPiBAQCAtNDU2LDYgKzU0MSw1OSBAQCBzdGF0aWMgaW50IHNuZF9jbWxf
cnQxMDExX3Byb2JlKHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gICAJc25k
X3NvY19jYXJkX2NtbC5kZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ICAgCXBsYXRmb3JtX25hbWUgPSBt
YWNoLT5tYWNoX3BhcmFtcy5wbGF0Zm9ybTsNCj4gPg0KPiA+ICsJZG1pX2NoZWNrX3N5c3RlbShz
b2ZfcnQxMDExX3F1aXJrX3RhYmxlKTsNCj4gPiArDQo+ID4gKwlkZXZfaW5mbygmcGRldi0+ZGV2
LCAic29mX3J0MTAxMV9xdWlyayA9ICVseFxuIiwgc29mX3J0MTAxMV9xdWlyayk7DQo+ID4gKw0K
PiA+ICsJaWYgKHNvZl9ydDEwMTFfcXVpcmsgJiAoU09GX1JUMTAxMV9TUEVBS0VSX1RMIHwNCj4g
PiArCQkJCVNPRl9SVDEwMTFfU1BFQUtFUl9UUikpIHsNCj4gPiArCQlydDEwMTFfZGFpc19jb25m
cyA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LA0KPiA+ICsJCQkJCXNpemVvZihzdHJ1Y3Qgc25k
X3NvY19jb2RlY19jb25mKSAqDQo+ID4gKwkJCQkJU1BLX0NILCBHRlBfS0VSTkVMKTsNCj4gPiAr
DQo+ID4gKwkJcnQxMDExX2RhaXNfY29tcG9uZW50cyA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2
LA0KPiA+ICsJCQkJCXNpemVvZihzdHJ1Y3QNCj4gc25kX3NvY19kYWlfbGlua19jb21wb25lbnQp
ICoNCj4gPiArCQkJCQlTUEtfQ0gsIEdGUF9LRVJORUwpOw0KPiA+ICsNCj4gPiArCQlmb3IgKGkg
PSAwOyBpIDwgU1BLX0NIOyBpKyspIHsNCj4gPiArCQkJcnQxMDExX2RhaXNfY29uZnNbaV0uZGxj
Lm5hbWUgPQ0KPiBkZXZtX2thc3ByaW50ZigmcGRldi0+ZGV2LA0KPiA+ICsJCQkJCQkJCUdGUF9L
RVJORUwsDQo+ID4gKwkJCQkJCQkJImkyYy0NCj4gMTBFQzEwMTE6MCVkIiwNCj4gPiArCQkJCQkJ
CQlpKTsNCj4gDQo+IENoZWNrIGZvciBOVUxMIGFuZCByZXR1cm4gLUVOT01FTSBmb3IgYWxsIDMg
ZGV2bV8gY2FsbHMgYWJvdmU/DQpZZXMsIEkgd2lsbCBhZGQgdGhlIGNoZWNrIGNvbmRpdGlvbnMg
c2VwYXJhdGVseS4gQWZ0ZXJ3YXJkcyBJIHdpbGwgcmV2aXNlIGFuZCBzdWJtaXQgdGhlIGVudGly
ZWx5IG5ldyBvbmUuDQo=
