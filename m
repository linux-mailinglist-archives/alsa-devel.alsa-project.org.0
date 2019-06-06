Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF6536FAE
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 11:19:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DB8986F;
	Thu,  6 Jun 2019 11:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DB8986F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559812775;
	bh=nur/yEaWefNxYo/KBxCy/r0vRqABS6JobbzS4TjRVe4=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BQJQDTB99ga4IUwf0f2onpByoD/3bcc+8U95w3IxYaRfITWehprHuNznhMCtLMpaD
	 Zbvfr2yHgyNXqHRyIL8YTECG7tL3WfrD/vK6TBXWngOKHeJKyrHyA3Uo8+UgIHp6g8
	 ilPxO+qFro3iQ1/9lagLvL5H9gp8+djdZVvtCvlc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45A18F896F7;
	Thu,  6 Jun 2019 11:17:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AC84F896F7; Thu,  6 Jun 2019 11:17:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B997F8072A
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 11:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B997F8072A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2019 02:17:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,558,1557212400"; d="scan'208";a="182240173"
Received: from irsmsx109.ger.corp.intel.com ([163.33.3.23])
 by fmsmga002.fm.intel.com with ESMTP; 06 Jun 2019 02:17:41 -0700
Received: from irsmsx156.ger.corp.intel.com (10.108.20.68) by
 IRSMSX109.ger.corp.intel.com (163.33.3.23) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 6 Jun 2019 10:17:39 +0100
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.227]) by
 IRSMSX156.ger.corp.intel.com ([169.254.3.125]) with mapi id 14.03.0415.000;
 Thu, 6 Jun 2019 10:17:39 +0100
From: "Ser, Simon" <simon.ser@intel.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "christian.koenig@amd.com"
 <christian.koenig@amd.com>
Thread-Topic: Linking ALSA playback devices and DRM connectors
Thread-Index: AQHVGub3qPpDIp0ZmkGUsrmQWEy2vqaLifwAgAACrYCAAr4ngA==
Date: Thu, 6 Jun 2019 09:17:38 +0000
Message-ID: <6bafad8875cf21abdd3c0f2a093c8bd2625b33df.camel@intel.com>
References: <f69f48bd4b9b2dc6f8228cd47406882c71758cdf.camel@intel.com>
 <157c9015-32c8-2c1d-236f-48da16f43399@gmail.com>
 <CAKMK7uHQ-hS7s_OZuyGjn19tqmz3f-DtcRiD=bjujK1oYHO9tA@mail.gmail.com>
In-Reply-To: <CAKMK7uHQ-hS7s_OZuyGjn19tqmz3f-DtcRiD=bjujK1oYHO9tA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.181]
Content-ID: <FAF02397638D2A4E94B5760158380DC9@intel.com>
MIME-Version: 1.0
Cc: "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "Harry.Wentland@amd.com" <Harry.Wentland@amd.com>,
 "Nicholas.Kazlauskas@amd.com" <Nicholas.Kazlauskas@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [alsa-devel] Linking ALSA playback devices and DRM connectors
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

T24gVHVlLCAyMDE5LTA2LTA0IGF0IDE3OjI0ICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiBPbiBUdWUsIEp1biA0LCAyMDE5IGF0IDU6MTUgUE0gQ2hyaXN0aWFuIEvDtm5pZw0KPiA8Y2tv
ZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOg0KPiA+IEFtIDA0LjA2LjE5IHVt
IDE3OjA1IHNjaHJpZWIgU2VyLCBTaW1vbjoNCj4gPiA+IEhpLA0KPiA+ID4gDQo+ID4gPiBJJ20g
dHJ5aW5nIHRvIGxpbmsgQUxTQSBwbGF5YmFjayBkZXZpY2VzIGFuZCBEUk0gY29ubmVjdG9ycy4g
SW4gb3RoZXINCj4gPiA+IHdvcmRzLCBJJ2QgbGlrZSB0byBiZSBhYmxlIHRvIGtub3cgd2hpY2gg
QUxTQSBkZXZpY2UgSSBzaG91bGQgb3BlbiB0bw0KPiA+ID4gcGxheSBhdWRpbyBvbiBhIGdpdmVu
IGNvbm5lY3Rvci4NCj4gPiA+IA0KPiA+ID4gVW5mb3J0dW5hdGVseSwgSSBoYXZlbid0IGZvdW5k
IGEgd2F5IHRvIGV4dHJhY3QgdGhpcyBpbmZvcm1hdGlvbi4gSQ0KPiA+ID4ga25vdyAvcHJvYy9h
c291bmQvY2FyZE4vZWxkKiBleHBvc2UgdGhlIEVESUQtbGlrZSBkYXRhLiBIb3dldmVyIGJ5DQo+
ID4gPiBsb29raW5nIGF0IHRoZSBBTFNBIEFQSSAoYWxzbzogYXBsYXkgLWwgYW5kIC1MKSBJIGNh
bid0IGZpbmQgYSB3YXkgdG8NCj4gPiA+IGZpZ3VyZSBvdXQgd2hpY2ggUENNIGRldmljZSBtYXBz
IHRvIHRoZSBFTEQuDQo+ID4gPiANCj4gPiA+IEFtIEkgbWlzc2luZyBzb21ldGhpbmc/DQo+ID4g
DQo+ID4gSXMgdGhhdCBhY3R1YWxseSBmaXhlZCBvbiBhbGwgaGFyZHdhcmU/IE9yIGRvIHdlIG1h
eWJlIGhhdmUgc29tZQ0KPiA+IGhhcmR3YXJlIHdpdGggb25seSBvbmUgYXVkaW8gY29kZWMgYW5k
IG11bHRpcGxlIGNvbm5lY3RvcnM/DQo+ID4gDQo+ID4gPiBJZiBub3QsIHdoYXQgd291bGQgYmUg
dGhlIGJlc3Qgd2F5IHRvIGV4cG9zZSB0aGlzPw0KPiA+ID4gDQo+ID4gPiAtIEEgc3ltbGluayB0
byB0aGUgQUxTQSBhdWRpbyBQQ00gZGV2aWNlIGluDQo+ID4gPiAgICAvc3lzL2NsYXNzL2RybS9j
YXJkTi1DT05ORUNUT1I/DQo+ID4gPiAtIEEgc3ltbGluayB0byB0aGUgRFJNIGNvbm5lY3RvciBp
biAvc3lzL2NsYXNzL3NvdW5kL3BjbSo/DQo+ID4gDQo+ID4gSWYgaXQncyBmaXhlZCB0aGFuIHRo
b3NlIHR3byBvcHRpb25zIHNvdW5kIHNhbmUgdG8gbWUuDQo+ID4gDQo+ID4gPiAtIEEgRFJNIGNv
bm5lY3RvciBwcm9wZXJ0eT8NCj4gPiANCj4gPiBJZiBpdCdzIGNvbmZpZ3VyYWJsZSB0aGFuIHRo
YXQgc291bmRzIGxpa2UgYSBnb29kIG9wdGlvbiB0byBtZS4NCj4gPiANCj4gPiBBbnl3YXkgYWRk
ZWQgb3VyIERDIHRlYW0sIHN0dWZmIGxpa2UgdGhhdCBpcyB0aGVpciBjb25zdHJ1Y3Rpb24gc2l0
ZS4NCj4gPiANCj4gPiBSZWdhcmRzLA0KPiA+IENocmlzdGlhbi4NCj4gPiANCj4gPiA+IC0gU29t
ZWhvdyBleHBvc2UgdGhlIGNvbm5lY3RvciBuYW1lIHZpYSB0aGUgQUxTQSBBUEk/DQo+ID4gPiAt
IEV4cG9zZSB0aGUgY29ubmVjdG9yIEVESUQgdmlhIEFMU0E/DQo+ID4gPiAtIE90aGVyIGlkZWFz
Pw0KPiANCj4gSSB0aGluayBvbiBvdXIgTVNUIGh3IHlvdSBnZXQgYSBjb21iaW5hdGlvbiBvZiBD
UlRDcyB4IENPTk5FQ1RPUnMgb24NCj4gdGhlIGFsc2Egc2lkZS4gSS5lLiBmb3IgZXZlcnkgcGFp
ciBvZiBjb25uZWN0b3IgYW5kIGNydGMgeW91IGdldCBhDQo+IHNlcGFyYXRlIGFsc2EgcGluLiBU
aGlzIGlzIGJlY2F1c2Ugd2l0aCBtc3QsIHlvdSBjb3VsZCBoYXZlIHVwIHRvDQo+IG51bV9jcnRj
cyBzdHJlYW1zIG9uIGEgc2luZ2xlIGNvbm5lY3Rvci4gTm90IHN1cmUgaG93IHRvIG1vZGVsIHRo
YXQuDQoNCkkgYXNzdW1lIHRoaXMgbWVhbnMgInVwIHRvIG51bV9jcnRjcyBzdHJlYW1zIGFuIGEg
cGh5c2ljYWwgY29ubmVjdG9yIi4NCldpdGggTVNUIGEgcGh5c2ljYWwgY29ubmVjdG9yIGNhbiBi
YWNrIG1vcmUgdGhhbiBvbmUgRFJNIGNvbm5lY3Rvci4NCg0KPiBCaWdnZXIgcXVlc3Rpb246IEhv
dyBkbyB5b3Ugd2FudCB0byBtYWtlIHRoZSBjb29wZXJhdGlvbiBoYXBwZW4/DQo+IFRoZXJlJ3Mg
YmVlbiBzb21lIGlkZWFzIGZsb2F0aW5nIGFib3V0IG1ha2luZyB0aGUgaGRtaSBjb25uZWN0aW9u
DQo+IGJldHdlZW4gZHJtIGFuZCBhbHNhIHNvbWVob3cgcmVwcmVzZW50ZWQgaW4gdGhlIGNvZGUs
IGJ1dCBub3RoaW5nIGV2ZXINCj4gcmVhbGx5IGhhcHBlbmVkLiB0aGVyZSdzIGRybV9hdWRpb19j
b21wb25lbnQuaCwgYnV0IHRoYXQncyBqdXN0IHRoZQ0KPiBpbnRlcmZhY2UsIGl0IGRvZXNuJ3Qg
cmVhbGx5IHNvbHZlIGhvdyB0byBtYWtlIHRoZSBjb25uZWN0aW9uLiBBbHNvDQo+IG9ubHkgdXNl
ZCBieSBpOTE1L2hkYS4NCg0KVG8gYmUgY29tcGxldGVseSBob25lc3QgSSBoYXZlIG5vIGlkZWEu
IFRoYXQncyB3aHkgSSBzZW50IHRoaXMgZS0NCm1haWwuIDpQDQoNCkluZGVlZCwgaXQgc2VlbXMg
dGhhdCB0aGUgaW50ZXJmYWNlIGlzbid0IGVub3VnaCAoZ2V0X2VsZCBhbmQgcGluMnBvcnQNCmFy
ZSBpbnRlcmVzdGluZyB0aG91Z2gpLg0KDQo+ID4gPiBUaGFua3MhDQo+ID4gPiANCj4gPiA+IFNp
bW9uIFNlcg0KPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCj4gPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gPiA+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4gPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQo+ID4gDQo+ID4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+
ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQo+IA0KPiANCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
