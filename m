Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 592ED745ACB
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 13:12:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B41491DD;
	Mon,  3 Jul 2023 13:11:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B41491DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688382762;
	bh=53oZ6rIc4ef11afkKNqrV2HbqLMAgyY5T7u8npRZzVg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KE9S9pDpxztOpA/zBQ/6pKdahDy5b0ZpoKIyaJb9T00sMvBhtR2EvCqmNLOEnBd2R
	 DAANSMPPAbXnr/aAW05O1jG5aeaRr/am6Uozi5ziur5qIW3MRUAQBQMAXvgUZEvzPs
	 I8wXqOH1S1WbU3CUkzy02sE32Zg7RlQpH7xBZZyM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31B32F80153; Mon,  3 Jul 2023 13:11:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0CFFF80124;
	Mon,  3 Jul 2023 13:11:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FBE5F80125; Mon,  3 Jul 2023 13:11:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id 4603DF80100
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 13:11:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4603DF80100
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 363BBQ3K0019465,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 363BBQ3K0019465
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Mon, 3 Jul 2023 19:11:26 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Mon, 3 Jul 2023 19:11:28 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Mon, 3 Jul 2023 19:11:28 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b]) by
 RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b%5]) with mapi id
 15.01.2375.007; Mon, 3 Jul 2023 19:11:28 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
        "Vijendar.Mukunda@amd.com" <Vijendar.Mukunda@amd.com>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>
Subject: RE: [PATCH 1/5] ASoC: rt5682-sdw: fix for JD event handling in
 ClockStop Mode0
Thread-Topic: [PATCH 1/5] ASoC: rt5682-sdw: fix for JD event handling in
 ClockStop Mode0
Thread-Index: AQHZrY0mkMFxejyTy0SnKAzp66jWka+nTd4AgACKNRA=
Date: Mon, 3 Jul 2023 11:11:28 +0000
Message-ID: <81bf0fcc0b824c928e2e4e5a77ca37d8@realtek.com>
References: <20230703090247.25261-1-shumingf@realtek.com>
 <f9e83b61-6e69-2467-d5a5-3c3a6a40e018@linux.intel.com>
In-Reply-To: <f9e83b61-6e69-2467-d5a5-3c3a6a40e018@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.209]
x-kse-serverinfo: RTEXMBS05.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: 6JSMWWFCTENXRHIYARGIKJIREPH66SYI
X-Message-ID-Hash: 6JSMWWFCTENXRHIYARGIKJIREPH66SYI
X-MailFrom: shumingf@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6JSMWWFCTENXRHIYARGIKJIREPH66SYI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiA+IER1cmluZyBDbG9ja1N0b3AgTW9kZTAsIHBlcmlwaGVyYWwgaW50ZXJydXB0cyBhcmUgZGlz
YWJsZWQuDQo+IA0KPiBJIGNhbiBzZWUgdGhhdCB0aGUgaW50ZXJydXB0cyBhcmUgZGlzYWJsZWQg
aW4gcnQ1NjgyX2Rldl9zeXN0ZW1fc3VzcGVuZCgpLA0KPiB3aGljaCBpcyBOT1QgYSBtb2RlIHdo
ZXJlIHRoZSBjbG9jayBzdG9wIGlzIHVzZWQuLi4gSSBkb24ndCB0aGluayB0aGlzIGNvbW1pdA0K
PiBtZXNzYWdlIGlzIGNvcnJlY3QuDQo+IA0KPiBUaGUgSU1QTF9ERUYgaW50ZXJydXB0IHdoaWNo
IGlzIHVzZWQgZm9yIGphY2sgZGV0ZWN0aW9uIGlzIG5vdCBkaXNhYmxlZCBhdCBhbGwNCj4gZHVy
aW5nIGFueSBjbG9jayBzdG9wIG1vZGUsIGFuZCBpdCBzaG91bGRuJ3Qgb3RoZXJ3aXNlIHRoYXQg
d291bGQgYnJlYWsgdGhlDQo+IGphY2sgZGV0ZWN0aW9uLg0KDQpZb3UgYXJlIHJpZ2h0LiBUaGUg
Y29tbWl0IG1lc3NhZ2UgaXMgd3JvbmcgYW5kIG5vdCBjbGVhci4NClRoZSBzaXR1YXRpb24gaXMg
dGhhdCB0aGUgbWFuYWdlciBkcml2ZXIgdXNlcyB0aGUgY2xvY2sgc3RvcCBtb2RlMCB0byBkbyBz
eXN0ZW0gc3VzcGVuc2lvbi4NClRoZSBTZFcgZGV2aWNlIHdpbGwgbm90IGJlIHJlLWF0dGFjaGVk
IHdoZW4gdGhlIHN5c3RlbSByZXN1bWUuDQpUaGVyZWZvcmUsIHRoZSBJTlQxX0lNUExfREVGL1NE
Q0FfSU5UTUFTSyBpbnRlcnJ1cHQgd2lsbCBuZWVkIHRvIGJlIGVuYWJsZWQgd2hlbiB0aGUgc3lz
dGVtIHJlc3VtZXMuDQoNCj4gPiBXaGVuIHN5c3RlbSBsZXZlbCByZXN1bWUgaXMgaW52b2tlZCwg
UGVyaXBoZXJhbCBTRENBIGludGVycnVwdHMgc2hvdWxkDQo+ID4gYmUgZW5hYmxlZCB0byBoYW5k
bGUgSkQgZXZlbnRzLg0KPiANCj4gVGhlIGluaXRpYWwgJ3doZW4gc3lzdGVtIGxldmVsIHJlc3Vt
ZSBpcyBpbnZva2VkJyBpcyBhbGlnbmVkIHdpdGggbXkgY29tbWVudA0KPiBhYm92ZSwgdGhpcyBp
bnRlcnJ1cHQgZGlzYWJsaW5nIGlzIG9ubHkgZm9yIHN5c3RlbSBzdXNwZW5kLg0KPiANCj4gSW4g
YWRkaXRpb24sIEkgdGhpbmsgaXQncyBhIGNvcHkgcGFzdGUgaGVyZSwgdGhlcmUgaXMgbm8gU0RD
QSBzdXBwb3J0IGluDQo+IFJUNTY4MiBvciB0aGUgaW5pdGlhbCBSVDcxMS4NCg0KV2lsbCBmaXgg
Y29weSBwYXN0ZSBpc3N1ZS4NCg0KPiA+IEVuYWJsZSBTRENBIGludGVycnVwdHMgaW4gcmVzdW1l
IHNlcXVlbmNlIHdoZW4gQ2xvY2tTdG9wIE1vZGUwIGlzDQo+IGFwcGxpZWQuDQo+IA0KPiBzYW1l
IGNvbW1lbnRzIGZvciBydDcxMS1zZHcuYyBhbmQgb3RoZXIgY29kZWNzIHdoaWNoIHVzZSB0aGUg
c2FtZSBwYXR0ZXJuDQo+IHdpdGggdGhlIHNhbWUgY29tbWVudA0KPiANCj4gICAgICAgICAvKg0K
PiAgICAgICAgICAqIHByZXZlbnQgbmV3IGludGVycnVwdHMgZnJvbSBiZWluZyBoYW5kbGVkIGFm
dGVyIHRoZQ0KPiAgICAgICAgICAqIGRlZmVycmVkIHdvcmsgY29tcGxldGVzIGFuZCBiZWZvcmUg
dGhlIHBhcmVudCBkaXNhYmxlcw0KPiAgICAgICAgICAqIGludGVycnVwdHMgb24gdGhlIGxpbmsN
Cj4gICAgICAgICAgKi8NCj4gDQo+IEJUVyBpZiB0aGlzIGlzIGFuIGlzc3VlIGZvciBzeXN0ZW0g
c3VzcGVuZCwgbWF5YmUgd2Ugc2hvdWxkIGRpc2FibGUgdGhlDQo+IGludGVycnVwdHMgb24gdGhl
IGxpbmsgaW4gdGhlIC5wcmVwYXJlIHN0YWdlLCB0aGF0IHdvdWxkIHJlbW92ZSB0aGlzIHN0ZXAg
aW4gYWxsDQo+IGNvZGVjIGRyaXZlcnM/IFRoZSAucHJlcGFyZSBkZWFscyB3aXRoIHRoZSBwYXJl
bnQgZmlyc3QsIHdoaWxlIC5zdXNwZW5kIGRlYWwNCj4gd2l0aCBjaGlsZCBkZXZpY2VzIGZpcnN0
LiBUaGUgZHJhd2JhY2sgd291bGQgYmUgdGhhdCB0aGUgY29kZWMgZHJpdmVyIHdvdWxkDQo+IGRl
cGVuZCBvbiB0aGUgbWFuYWdlciBkcml2ZXIgZG9pbmcgdGhlIHJpZ2h0IHRoaW5nLCB3aGljaCBp
c24ndCBncmVhdC4NCg0KSSB0aGluayB0aGUgY29kZWMgZHJpdmVyIGNvdWxkIGhhbmRsZSB0aGF0
LiBUaGUgU0RDQSBjb2RlYyBkcml2ZXIgYWxyZWFkeSByZS1lbmFibGVkIHRoZSBTRENBIElOVCBt
YXNrIHdoZW4gdGhlIGRldmljZSBpcyByZS1hdHRhY2hlZC4NCg0KPiA+IFNpZ25lZC1vZmYtYnk6
IFNodW1pbmcgRmFuIDxzaHVtaW5nZkByZWFsdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgc291bmQv
c29jL2NvZGVjcy9ydDU2ODItc2R3LmMgfCA5ICsrKysrKysrLQ0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
c291bmQvc29jL2NvZGVjcy9ydDU2ODItc2R3LmMNCj4gPiBiL3NvdW5kL3NvYy9jb2RlY3MvcnQ1
NjgyLXNkdy5jIGluZGV4IDY3NDA0ZjQ1Mzg5Zi4uNDk2OGE4YzAwNjRkDQo+ID4gMTAwNjQ0DQo+
ID4gLS0tIGEvc291bmQvc29jL2NvZGVjcy9ydDU2ODItc2R3LmMNCj4gPiArKysgYi9zb3VuZC9z
b2MvY29kZWNzL3J0NTY4Mi1zZHcuYw0KPiA+IEBAIC03NTAsOCArNzUwLDE1IEBAIHN0YXRpYyBp
bnQgX19tYXliZV91bnVzZWQNCj4gcnQ1NjgyX2Rldl9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2
KQ0KPiA+ICAgICAgIGlmICghcnQ1NjgyLT5maXJzdF9od19pbml0KQ0KPiA+ICAgICAgICAgICAg
ICAgcmV0dXJuIDA7DQo+ID4NCj4gPiAtICAgICBpZiAoIXNsYXZlLT51bmF0dGFjaF9yZXF1ZXN0
KQ0KPiA+ICsgICAgIGlmICghc2xhdmUtPnVuYXR0YWNoX3JlcXVlc3QpIHsNCj4gPiArICAgICAg
ICAgICAgIGlmIChydDU2ODItPmRpc2FibGVfaXJxID09IHRydWUpIHsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgbXV0ZXhfbG9jaygmcnQ1NjgyLT5kaXNhYmxlX2lycV9sb2NrKTsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgc2R3X3dyaXRlX25vX3BtKHNsYXZlLCBTRFdfU0NQX0lOVE1B
U0sxLA0KPiBTRFdfU0NQX0lOVDFfSU1QTF9ERUYpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICBydDU2ODItPmRpc2FibGVfaXJxID0gZmFsc2U7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
IG11dGV4X3VubG9jaygmcnQ1NjgyLT5kaXNhYmxlX2lycV9sb2NrKTsNCj4gPiArICAgICAgICAg
ICAgIH0NCj4gPiAgICAgICAgICAgICAgIGdvdG8gcmVnbWFwX3N5bmM7DQo+ID4gKyAgICAgfQ0K
PiA+DQo+ID4gICAgICAgdGltZSA9DQo+IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgmc2xh
dmUtPmluaXRpYWxpemF0aW9uX2NvbXBsZXRlLA0KPiA+DQo+IG1zZWNzX3RvX2ppZmZpZXMoUlQ1
NjgyX1BST0JFX1RJTUVPVVQpKTsNCj4gDQo+IC0tLS0tLVBsZWFzZSBjb25zaWRlciB0aGUgZW52
aXJvbm1lbnQgYmVmb3JlIHByaW50aW5nIHRoaXMgZS1tYWlsLg0K
