Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6BA275FEC
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 20:33:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90219179E;
	Wed, 23 Sep 2020 20:32:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90219179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600885989;
	bh=MFc9c2b/ArcPKHjdgrOSsxGQKJSTvzpCD8ZDkhBBKtA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nhAnG6twWC5V55fU0QhA8rSmikkvRDKjC6G2nMKFDYxl5O3bVLyh+ZD7DSk7AqsGO
	 P8tEs5qJJBMxbYlM9+UOhBURG65kapDP+gCy5rqxqT6DeWgxKChQFNbm4luP6JrBWv
	 bLPJ+G3muI/Q/KOBskqHtbXoapqUwokt1J0FYlfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A93D7F80171;
	Wed, 23 Sep 2020 20:31:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80985F80171; Wed, 23 Sep 2020 20:31:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7837FF800B4
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 20:31:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7837FF800B4
IronPort-SDR: g76qON5yAHVGIOGJ2wBaKDNDeCWvG7IUihq0bl2Nwv1xqdD2/RozCtJZ+24iu9kkaQnRdMpibi
 efwhsJyPrfQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="140455215"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="140455215"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 11:31:11 -0700
IronPort-SDR: Xxhecg6XWUINdIZUqTWmlCBrMJEJsblDIqSq9uvAa8EXVAfAFUo/IHBqhs0YThBU+nn4Cb+VAJ
 d++1nZvAlnJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="347454706"
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Sep 2020 11:31:09 -0700
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx603.ger.corp.intel.com (163.33.146.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 23 Sep 2020 19:31:08 +0100
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Wed, 23 Sep 2020 19:31:08 +0100
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v8 09/14] ASoC: Intel: catpt: Simple sysfs attributes
Thread-Topic: [PATCH v8 09/14] ASoC: Intel: catpt: Simple sysfs attributes
Thread-Index: AQHWkaTF8FtHOnXp5EyniIeRoD2hOql2KHaAgABilbA=
Date: Wed, 23 Sep 2020 18:31:08 +0000
Message-ID: <4e590f061dec474195a10482b1a9bc22@intel.com>
References: <20200923122508.3360-1-cezary.rojewski@intel.com>
 <20200923122508.3360-10-cezary.rojewski@intel.com>
 <20200923133427.GL3956970@smile.fi.intel.com>
In-Reply-To: <20200923133427.GL3956970@smile.fi.intel.com>
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
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "Proborszcz, Filip" <filip.proborszcz@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Hejmowski,
 Krzysztof" <krzysztof.hejmowski@intel.com>,
 "ppapierkowski@habana.ai" <ppapierkowski@habana.ai>, "Gopal, 
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

T24gMjAyMC0wOS0yMyAzOjM0IFBNLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+IE9uIFdlZCwg
U2VwIDIzLCAyMDIwIGF0IDAyOjI1OjAzUE0gKzAyMDAsIENlemFyeSBSb2pld3NraSB3cm90ZToN
Cj4+IEFkZCBzeXNmcyBlbnRyaWVzIGZvciBkaXNwbGF5aW5nIHZlcnNpb24gb2YgRlcgY3VycmVu
dGx5IGluIHVzZSBhcyB3ZWxsDQo+PiBhcyBkdW1waW5nIGZ1bGwgRlcgaW5mb3JtYXRpb24gaW5j
bHVkaW5nIGJ1aWxkIGFuZCBsb2ctcHJvdmlkZXJzIGhhc2hlcy4NCg0KLi4uDQoNCj4+ICAgI2lu
Y2x1ZGUgInJlZ2lzdGVycy5oIg0KPiANCj4+ICAgc3RydWN0IGNhdHB0X2RldjsNCj4+ICtleHRl
cm4gY29uc3Qgc3RydWN0IGF0dHJpYnV0ZV9ncm91cCAqY2F0cHRfYXR0cl9ncm91cHNbXTsNCj4g
DQo+IEdyb3VwaW5nIHRoZXNlIGFyZSBub3Qgb2theSDigJQgdGhleSBhcmUgZGlmZmVyZW50IGJ5
IG1lYW5pbmcsIGp1c3QgcHV0IGJsYW5rDQo+IGxpbmUgaW4gYmV0d2Vlbi4NCj4gDQoNClN1cmUs
IGFjay4NCg0KLi4uDQoNCj4+ICsjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KPj4gKyNp
bmNsdWRlICJjb3JlLmgiDQo+PiArDQo+PiArc3RhdGljIHNzaXplX3QgZndfdmVyc2lvbl9zaG93
KHN0cnVjdCBkZXZpY2UgKmRldiwNCj4+ICsJCQkgICAgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1
dGUgKmF0dHIsIGNoYXIgKmJ1ZikNCj4+ICt7DQo+PiArCXN0cnVjdCBjYXRwdF9kZXYgKmNkZXYg
PSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4+ICsJc3RydWN0IGNhdHB0X2Z3X3ZlcnNpb24gdmVy
c2lvbjsNCj4+ICsJaW50IHJldDsNCj4gDQo+PiArCXBtX3J1bnRpbWVfZ2V0X3N5bmMoY2Rldi0+
ZGV2KTsNCj4+ICsNCj4+ICsJcmV0ID0gY2F0cHRfaXBjX2dldF9md192ZXJzaW9uKGNkZXYsICZ2
ZXJzaW9uKTsNCj4+ICsNCj4+ICsJcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeShjZGV2LT5kZXYp
Ow0KPj4gKwlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChjZGV2LT5kZXYpOw0KPiANCj4gSXMg
aXQgc3ViamVjdCB0byBjaGFuZ2UgYXQgcnVuLXRpbWU/DQo+IA0KDQpObyBpdCBkb2VzIG5vdC4g
SG93ZXZlciwgSSBkbyBub3QgaW50ZW50IHRvIGhhdmUgdGhlIGZ3X3ZlcnNpb24gb2NjdXB5DQpt
ZW1vcnkgZm9yIGRldmljZSdzIGRydmRhdGEgKGkuZS4gc2VuZCB0aGUgSVBDIGludGVybmFsbHkg
YW5kIHN0b3JlIGl0DQppbnNpZGUgc3RydWN0IGNhdHB0X2RldikuIFNvLCBJJ2QgcmF0aGVyIHdh
a2UgdGhlIGRldmljZSwgZHVtcCB0aGUNCnZlcnNpb24gYW5kIGxlYXZlIHRoZSBieXRlcyBhbG9u
ZS4NCg0KT25lIGNvdWxkIHRoaW5rIGFib3V0IHN0YXRpY3MgYnV0IHRoZW4gYWdhaW4sIGhvdyBt
YW55IHRpbWVzIHRoaXMgc3lzZnMNCmZpbGUgaXMgZ29pbmcgdG8gZ2V0IHJlYWQgYW55d2F5Pw0K
SXQncyBtb3JlIHJlYWRhYmxlIGFuZCBzaW1wbGUgdGhpcyB3YXksIGxvc2luZyBub3RoaW5nIGlu
IHJldHVybiBUQkguDQoNCj4+ICsJaWYgKHJldCkNCj4+ICsJCXJldHVybiBDQVRQVF9JUENfRVJS
T1IocmV0KTsNCj4+ICsNCj4+ICsJcmV0dXJuIHNwcmludGYoYnVmLCAiJWQuJWQuJWQuJWRcbiIs
IHZlcnNpb24udHlwZSwgdmVyc2lvbi5tYWpvciwNCj4+ICsJCSAgICAgICB2ZXJzaW9uLm1pbm9y
LCB2ZXJzaW9uLmJ1aWxkKTsNCj4+ICt9DQo+IA0KPj4gKw0KPiANCj4gVGhpcyBibGFuayBsaW5l
IGlzIG5vdCBuZWVkZWQuDQo+IA0KDQpBY2suDQoNCj4+ICtzdGF0aWMgREVWSUNFX0FUVFJfUk8o
ZndfdmVyc2lvbik7DQo+PiArDQo+PiArc3RhdGljIHNzaXplX3QgZndfaW5mb19zaG93KHN0cnVj
dCBkZXZpY2UgKmRldiwNCj4+ICsJCQkgICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIs
IGNoYXIgKmJ1ZikNCj4+ICt7DQo+PiArCXN0cnVjdCBjYXRwdF9kZXYgKmNkZXYgPSBkZXZfZ2V0
X2RydmRhdGEoZGV2KTsNCj4+ICsNCj4+ICsJcmV0dXJuIHNwcmludGYoYnVmLCAiJXNcbiIsIGNk
ZXYtPmlwYy5jb25maWcuZndfaW5mbyk7DQo+PiArfQ0KPiANCj4+ICsNCj4gDQo+IFRoaXMgYmxh
bmsgbGluZSBpcyBub3QgbmVlZGVkLg0KPiANCg0KQWNrLg0K
