Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D60A627CF81
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 15:40:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FDAA1870;
	Tue, 29 Sep 2020 15:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FDAA1870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601386834;
	bh=SjOjXhZsY6f8xWmtEPJWlTM+OYN6jxN84SqgVcU9Mio=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IDOwKv+TSNEFnlUZS6dpAv6+4BEK2gu63Zsp6RSKgNmN+OFueoQzmvXnfRHuvQ1vv
	 Gonzj5Oa42XvsmFDXGK7GiSPot8/bnll9l4YnTph4BiTtOEh2JCHgbux1PDuFJW07q
	 QwZEA/v3te1hq73EJVSBknZbMhp2FWeZmg1vatao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E3DDF800AB;
	Tue, 29 Sep 2020 15:38:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80CD6F801F5; Tue, 29 Sep 2020 15:38:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF644F800AB
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 15:38:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF644F800AB
IronPort-SDR: F4JJznvTlNLXe9gWcDZWTVLuzDZe6QP7ewaZPvwQPA4NNMrtoMwilpzPfsqaAtc6ILLEzeFfFj
 QPgA3cF6obyQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="180347537"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="180347537"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 06:38:39 -0700
IronPort-SDR: lRIbswVJP9/3fAVj78Jq/Npbo+xk76EzC3yV1WXC4D6oEgOy10gDq14wRWM/XBnRCaEim4Vt8O
 pbTKHpZ5DJ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="457279956"
Received: from irsmsx605.ger.corp.intel.com ([163.33.146.138])
 by orsmga004.jf.intel.com with ESMTP; 29 Sep 2020 06:38:37 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 IRSMSX605.ger.corp.intel.com (163.33.146.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 29 Sep 2020 14:38:36 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Tue, 29 Sep 2020 14:38:36 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: =?utf-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH v9 14/14] ASoC: Intel: Select catpt and deprecate haswell
Thread-Topic: [PATCH v9 14/14] ASoC: Intel: Select catpt and deprecate haswell
Thread-Index: AQHWk+Nyd+dRmDU8V0SVbtJbwbPJRKl/dJAAgAAm+UCAAAgdEA==
Date: Tue, 29 Sep 2020 13:38:36 +0000
Message-ID: <9c78266e31c5432eb9a087964779b260@intel.com>
References: <20200926085910.21948-1-cezary.rojewski@intel.com>
 <20200926085910.21948-15-cezary.rojewski@intel.com>
 <5a765891-c84e-4475-5b91-7fdfc265c5d5@linux.intel.com>
 <5a09acbd83764f7fa06acd6e4aa9c7f5@intel.com>
In-Reply-To: <5a09acbd83764f7fa06acd6e4aa9c7f5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [163.33.253.164]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "Hejmowski, Krzysztof" <krzysztof.hejmowski@intel.com>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "ppapierkowski@habana.ai" <ppapierkowski@habana.ai>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "Proborszcz,
 Filip" <filip.proborszcz@intel.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "Wasko, Michal" <michal.wasko@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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

T24gMjAyMC0wOS0yOSAzOjA5IFBNLCBSb2pld3NraSwgQ2V6YXJ5IHdyb3RlOg0KPiBPbiAyMDIw
LTA5LTI5IDE6NDkgUE0sIEFtYWRldXN6IFPFgmF3acWEc2tpIHdyb3RlOg0KPj4gT24gOS8yNi8y
MDIwIDEwOjU5IEFNLCBDZXphcnkgUm9qZXdza2kgd3JvdGU6DQo+Pj4gUHJldmVudCBzb3VuZC9z
b2MvaW50ZWwvaGFzd2VsbCBjb2RlIGNvbXBpbGUgYW5kIHNlbGVjdCBjYXRwdCBpbnN0ZWFkIGFz
DQo+Pj4gYSByZWNvbW1lbmRlZCBzb2x1dGlvbi4gVXNlcnNwYWNlLWV4cG9zZWQgbWVtYmVycyBh
cmUgY29tcGF0aWJsZSB3aXRoDQo+Pj4gd2hhdCBpcyBleHBvc2VkIGJ5IGRlcHJlY2F0ZWQgc29s
dXRpb24gdGh1cyBubyBoYXJtIGlzIGRvbmUuIFRoZSBvbmx5DQo+Pj4gdmlzaWJsZSBkaWZmZXJl
bmNlIGlzIHRoZSBuZXdseSBhZGRlZCAnTG9vcGJhY2sgTXV0ZScga2NvbnRyb2wuDQo+Pj4NCj4+
PiBTaWduZWQtb2ZmLWJ5OiBDZXphcnkgUm9qZXdza2kgPGNlemFyeS5yb2pld3NraUBpbnRlbC5j
b20+DQo+Pj4gLS0tDQo+Pj4NCj4+PiBDaGFuZ2VzIGluIHY3Og0KPj4+IC0gcGF0Y2g6IDEwLzE0
ICdBU29DOiBJbnRlbDogU2VsZWN0IGNhdHB0IGFuZCBkZXByZWNhdGUgaGFzd2VsbCcgaGFzDQo+
Pj4gICAgIGJlZW4gbW92ZWQgdG8gdGhlIGJhY2sgb2YgdGhlIGxpc3Q6IGVuYWJsZSBjYXRwdCBh
ZnRlciBtYWNoaW5lIGJvYXJkcw0KPj4+ICAgICBoYXZlIGJlZW4gcHJlcGFyZWQgZm9yIGl0IGZp
cnN0DQo+Pj4NCj4+PiBDaGFuZ2VzIGluIHY1Og0KPj4+IC0gcmVtb3ZlIERNQURFVklDRVMgZGVw
ZW5kcyBvbjogRFdfRE1BQ19DT1JFIGFscmVhZHkgY292ZXJzIHRoYXQNCj4+PiAtIGFkZCBvcHRp
b25hbCBDT01QSUxFX1RFU1QgZGVwZW5kcyBvbg0KPj4+DQo+Pj4gICAgc291bmQvc29jL2ludGVs
L0tjb25maWcgICAgICAgIHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+Pj4gICAgc291
bmQvc29jL2ludGVsL01ha2VmaWxlICAgICAgIHwgIDIgKy0NCj4+PiAgICBzb3VuZC9zb2MvaW50
ZWwvYm9hcmRzL0tjb25maWcgfCAgOCArKysrLS0tLQ0KPj4+ICAgIHNvdW5kL3NvYy9pbnRlbC9j
YXRwdC9NYWtlZmlsZSB8ICA2ICsrKysrKw0KPj4+ICAgIDQgZmlsZXMgY2hhbmdlZCwgMjMgaW5z
ZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pDQo+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNv
dW5kL3NvYy9pbnRlbC9jYXRwdC9NYWtlZmlsZQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL3NvdW5k
L3NvYy9pbnRlbC9LY29uZmlnIGIvc291bmQvc29jL2ludGVsL0tjb25maWcNCj4+PiBpbmRleCAw
ZTQ4YzRmNTMyY2UuLmRmYzIwZjJiYjg1OSAxMDA2NDQNCj4+PiAtLS0gYS9zb3VuZC9zb2MvaW50
ZWwvS2NvbmZpZw0KPj4+ICsrKyBiL3NvdW5kL3NvYy9pbnRlbC9LY29uZmlnDQo+Pj4gQEAgLTQ3
LDIxICs0NywyMSBAQCBjb25maWcgU05EX1NPQ19JTlRFTF9TU1RfRklSTVdBUkUNCj4+PiAgICAg
ICAgIyBIYXN3ZWxsL0Jyb2Fkd2VsbC9CYXl0cmFpbCBsZWdhY3kgYW5kIHdpbGwgYmUgc2V0DQo+
Pj4gICAgICAgICMgd2hlbiB0aGVzZSBwbGF0Zm9ybXMgYXJlIGVuYWJsZWQNCj4+PiAtY29uZmln
IFNORF9TT0NfSU5URUxfSEFTV0VMTA0KPj4+IC0gICAgdHJpc3RhdGUgIkhhc3dlbGwvQnJvYWR3
ZWxsIFBsYXRmb3JtcyINCj4+PiArY29uZmlnIFNORF9TT0NfSU5URUxfQ0FUUFQNCj4+PiArICAg
IHRyaXN0YXRlICJIYXN3ZWxsIGFuZCBCcm9hZHdlbGwiDQo+Pj4gKyAgICBkZXBlbmRzIG9uIEFD
UEkgfHwgQ09NUElMRV9URVNUDQo+Pg0KPj4gV2UgbWF5IHdhbnQgdG8gbGltaXQgYnVpbGRpbmcg
b25seSB0byB4ODYgcGxhdGZvcm1zIGhlcmUuDQo+Pg0KPiANCj4gQWdyZWVkLg0KPiANCj4gZGVw
ZW5kcyBvbiAoWDg2ICYmIEFDUEkpIHx8IENPTVBJTEVfVEVTVA0KPiBpdCBpcyB0aGVuLg0KPiAN
Cg0KQWZ0ZXIgcmUtY2hlY2tpbmcsIF9DQVRQVCBpcyBkZXBlbmRlbnQgKGZvdW5kIHdpdGhpbiBh
biAnaWYnKSB1cG9uDQpfU1NUX1RPUExFVkVMIGNvbmZpZyB3aGljaCBhbHJlYWR5IGNvbnNpc3Rz
IG9mOg0KCWRlcGVuZHMgb24gWDg2IHx8IENPTVBJTEVfVEVTVA0KDQpzbyBubyBjaGFuZ2VzIGFy
ZSBuZWNlc3NhcnkuDQoNClRoYW5rcywNCkN6YXJlaw0KDQo=
