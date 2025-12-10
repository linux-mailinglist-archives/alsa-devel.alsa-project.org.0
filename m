Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32762CB1FA7
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Dec 2025 06:28:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC115601F8;
	Wed, 10 Dec 2025 06:28:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC115601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765344494;
	bh=zYqgSV12Hn0bU481XUPQZlWMo+nubHknUzpDuaZ3Ysc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cZVZ0gsRSa1Sc6EBPTmlXEnCa0dBREjA7mkg8ucx5uw8R0g/nUk9zvPcsCgtY3z4J
	 d4PxoW/NXdK3mS0YxvmoLp1h+9B/SyFk2zl3S5FiTDcEtONdaKuFZqjAUzxyzl5Yv5
	 pMLnnNLP6WZvIlbHQ/ll8YyOGCkkTpRJU6yY2Q88=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BD00F804F2; Wed, 10 Dec 2025 06:27:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC33BF805C7;
	Wed, 10 Dec 2025 06:27:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE517F804CF; Wed, 10 Dec 2025 06:27:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E61CF80088
	for <alsa-devel@alsa-project.org>; Wed, 10 Dec 2025 06:26:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E61CF80088
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=dOVygiq8
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BA5QjoX63608185,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1765344405; bh=zYqgSV12Hn0bU481XUPQZlWMo+nubHknUzpDuaZ3Ysc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=dOVygiq8ALJvrUsDzvRE6GlAkV9rGrc4GL9H5kh3AJAE+/9xDWc9fGmkZfASl22Ww
	 ePAAqkK2QQcY9us/nsP4mOKpWvkHwrSUaUQhCZBE2WKY9vOqJKTfQAv95U2pppriZV
	 T9LUAnQj6JKyk8A48fr09SNw8lcxouChyjqoEMRifldPveXK7BRVpDN7Q4dwDm1IR1
	 /toqrUvXRmVlw9+TLC/tscA4wluG/OKZ1I2D3Yb3LW1hw0eWh5dDM8UmKf6qI/AmNL
	 YMukbyKcT6hkTiw600+cWfHxIynKieISGghshWGjFs8WdaaThNSBP6sQnEZgD/aUYj
	 3KdAospPVPwHQ==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BA5QjoX63608185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Dec 2025 13:26:45 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 10 Dec 2025 13:26:45 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Wed, 10 Dec 2025 13:26:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::2fa5:eccb:34ee:7bb%10]) with mapi id
 15.02.1544.027; Wed, 10 Dec 2025 13:26:44 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>,
        "cezary.rojewski@intel.com"
	<cezary.rojewski@intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "perex@perex.cz" <perex@perex.cz>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "Flove(HsinFu)" <flove@realtek.com>,
        =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
        Jack Yu
	<jack.yu@realtek.com>,
        =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
	<derek.fang@realtek.com>
Subject: RE: [PATCH v8 1/2] ASoC: rt5575: Add the codec driver for the ALC5575
Thread-Topic: [PATCH v8 1/2] ASoC: rt5575: Add the codec driver for the
 ALC5575
Thread-Index: 
 AQHcYrFaS/5FqQdtw0yFH8gKhtK+rLUWxcwAgACdTlD//4MyAIAAkQMQgADhbwCAAgf0kA==
Date: Wed, 10 Dec 2025 05:26:44 +0000
Message-ID: <2630b1f8751b4aa3adc995f7d24144ea@realtek.com>
References: <20251201105926.1714341-1-oder_chiou@realtek.com>
 <20251201105926.1714341-2-oder_chiou@realtek.com>
 <6c0639e2-dc59-4e0f-be42-224a98b37f75@kernel.org>
 <2202b463075f4219bffc636fbafb0684@realtek.com>
 <20065270-0d88-4463-9641-f92b4c9e4674@kernel.org>
 <4859e7819e264382be4b3b58cd348aa0@realtek.com>
 <545e2353-c8f3-4e3b-82a6-92970a17b8d7@kernel.org>
In-Reply-To: <545e2353-c8f3-4e3b-82a6-92970a17b8d7@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: 7XF4RN76RTXTXRJI6Y7ZZ3HBCEWSWNQL
X-Message-ID-Hash: 7XF4RN76RTXTXRJI6Y7ZZ3HBCEWSWNQL
X-MailFrom: oder_chiou@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XF4RN76RTXTXRJI6Y7ZZ3HBCEWSWNQL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDksIDIwMjUgMjow
OCBQTQ0KPiBUbzogT2RlciBDaGlvdSA8b2Rlcl9jaGlvdUByZWFsdGVrLmNvbT47IGNlemFyeS5y
b2pld3NraUBpbnRlbC5jb207DQo+IGJyb29uaWVAa2VybmVsLm9yZzsgbGdpcmR3b29kQGdtYWls
LmNvbTsgcm9iaEBrZXJuZWwub3JnOw0KPiBrcnprK2R0QGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtl
cm5lbC5vcmcNCj4gQ2M6IHBlcmV4QHBlcmV4LmN6OyBsaW51eC1zb3VuZEB2Z2VyLmtlcm5lbC5v
cmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBhbHNhLWRldmVsQGFsc2EtcHJvamVj
dC5vcmc7IEZsb3ZlKEhzaW5GdSkgPGZsb3ZlQHJlYWx0ZWsuY29tPjsgU2h1bWluZyBb6IyDDQo+
IOabuOmKmF0gPHNodW1pbmdmQHJlYWx0ZWsuY29tPjsgSmFjayBZdSA8amFjay55dUByZWFsdGVr
LmNvbT47IERlcmVrIFvmlrnlvrcNCj4g576pXSA8ZGVyZWsuZmFuZ0ByZWFsdGVrLmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2OCAxLzJdIEFTb0M6IHJ0NTU3NTogQWRkIHRoZSBjb2RlYyBk
cml2ZXIgZm9yIHRoZQ0KPiBBTEM1NTc1DQo+IA0KPiANCj4gRXh0ZXJuYWwgbWFpbCA6IFRoaXMg
ZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90DQo+
IHJlcGx5LCBjbGljayBsaW5rcywgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29n
bml6ZSB0aGUgc2VuZGVyIGFuZA0KPiBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiAN
Cj4gDQo+IE9uIDA4LzEyLzIwMjUgMTA6MTYsIE9kZXIgQ2hpb3Ugd3JvdGU6DQo+ID4+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGty
emtAa2VybmVsLm9yZz4NCj4gPj4gU2VudDogTW9uZGF5LCBEZWNlbWJlciA4LCAyMDI1IDQ6MDIg
UE0NCj4gPj4gVG86IE9kZXIgQ2hpb3UgPG9kZXJfY2hpb3VAcmVhbHRlay5jb20+OyBjZXphcnku
cm9qZXdza2lAaW50ZWwuY29tOw0KPiA+PiBicm9vbmllQGtlcm5lbC5vcmc7IGxnaXJkd29vZEBn
bWFpbC5jb207IHJvYmhAa2VybmVsLm9yZzsNCj4gPj4ga3J6aytkdEBrZXJuZWwub3JnOyBjb25v
citkdEBrZXJuZWwub3JnDQo+ID4+IENjOiBwZXJleEBwZXJleC5jejsgbGludXgtc291bmRAdmdl
ci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gPj4gYWxzYS1k
ZXZlbEBhbHNhLXByb2plY3Qub3JnOyBGbG92ZShIc2luRnUpIDxmbG92ZUByZWFsdGVrLmNvbT47
IFNodW1pbmcNCj4gW+iMgw0KPiA+PiDmm7jpiphdIDxzaHVtaW5nZkByZWFsdGVrLmNvbT47IEph
Y2sgWXUgPGphY2sueXVAcmVhbHRlay5jb20+OyBEZXJlayBb5pa5DQo+IOW+tw0KPiA+PiDnvqld
IDxkZXJlay5mYW5nQHJlYWx0ZWsuY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDEv
Ml0gQVNvQzogcnQ1NTc1OiBBZGQgdGhlIGNvZGVjIGRyaXZlciBmb3IgdGhlDQo+ID4+IEFMQzU1
NzUNCj4gPj4NCj4gPj4NCj4gPj4gRXh0ZXJuYWwgbWFpbCA6IFRoaXMgZW1haWwgb3JpZ2luYXRl
ZCBmcm9tIG91dHNpZGUgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90DQo+ID4+IHJlcGx5LCBjbGlj
ayBsaW5rcywgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2Vu
ZGVyIGFuZA0KPiA+PiBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+ID4+DQo+ID4+DQo+ID4+
DQo+ID4+IE9uIDA4LzEyLzIwMjUgMDg6MjksIE9kZXIgQ2hpb3Ugd3JvdGU6DQo+ID4+Pj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprQGtlcm5lbC5vcmc+DQo+ID4+Pj4gU2VudDogTW9uZGF5LCBEZWNlbWJlciA4LCAyMDI1
IDI6MDUgUE0NCj4gPj4+PiBUbzogT2RlciBDaGlvdSA8b2Rlcl9jaGlvdUByZWFsdGVrLmNvbT47
IGNlemFyeS5yb2pld3NraUBpbnRlbC5jb207DQo+ID4+Pj4gYnJvb25pZUBrZXJuZWwub3JnOyBs
Z2lyZHdvb2RAZ21haWwuY29tOyByb2JoQGtlcm5lbC5vcmc7DQo+ID4+Pj4ga3J6aytkdEBrZXJu
ZWwub3JnOyBjb25vcitkdEBrZXJuZWwub3JnDQo+ID4+Pj4gQ2M6IHBlcmV4QHBlcmV4LmN6OyBs
aW51eC1zb3VuZEB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4+Pj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5l
bC5vcmc7IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsNCj4gPj4+PiBGbG92ZShIc2luRnUp
IDxmbG92ZUByZWFsdGVrLmNvbT47IFNodW1pbmcgW+iMgw0KPiA+Pj4+IOabuOmKmF0gPHNodW1p
bmdmQHJlYWx0ZWsuY29tPjsgSmFjayBZdSA8amFjay55dUByZWFsdGVrLmNvbT47IERlcmVrDQo+
IFvmlrkNCj4gPj4g5b63DQo+ID4+Pj4g576pXSA8ZGVyZWsuZmFuZ0ByZWFsdGVrLmNvbT4NCj4g
Pj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDEvMl0gQVNvQzogcnQ1NTc1OiBBZGQgdGhlIGNv
ZGVjIGRyaXZlciBmb3INCj4gPj4+PiB0aGUNCj4gPj4+PiBBTEM1NTc1DQo+ID4+Pj4NCj4gPj4+
Pg0KPiA+Pj4+IEV4dGVybmFsIG1haWwgOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRz
aWRlIHRoZSBvcmdhbml6YXRpb24uDQo+ID4+Pj4gRG8gbm90IHJlcGx5LCBjbGljayBsaW5rcywg
b3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZQ0KPiA+Pj4+IHRoZSBzZW5k
ZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gPj4+Pg0KPiA+Pj4+DQo+ID4+Pj4N
Cj4gPj4+PiBPbiAwMS8xMi8yMDI1IDExOjU5LCBPZGVyIENoaW91IHdyb3RlOg0KPiA+Pj4+PiAr
DQo+ID4+Pj4+ICtzdGF0aWMgaW50IHJ0NTU3NV9pMmNfcmVhZCh2b2lkICpjb250ZXh0LCB1bnNp
Z25lZCBpbnQgcmVnLA0KPiA+Pj4+PiArdW5zaWduZWQgaW50DQo+ID4+Pj4gKnZhbCkNCj4gPj4+
Pj4gK3sNCj4gPj4+Pj4gKyAgICAgc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCA9IGNvbnRleHQ7
DQo+ID4+Pj4+ICsgICAgIHN0cnVjdCBydDU1NzVfcHJpdiAqcnQ1NTc1ID0gaTJjX2dldF9jbGll
bnRkYXRhKGNsaWVudCk7DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKyAgICAgcmVnbWFwX3JlYWQocnQ1
NTc1LT5kc3BfcmVnbWFwLCByZWcgfA0KPiBSVDU1NzVfRFNQX01BUFBJTkcsDQo+ID4+Pj4gdmFs
KTsNCj4gPj4+Pj4gKw0KPiA+Pj4+PiArICAgICByZXR1cm4gMDsNCj4gPj4+Pj4gK30NCj4gPj4+
Pj4gKw0KPiA+Pj4+PiArc3RhdGljIGludCBydDU1NzVfaTJjX3dyaXRlKHZvaWQgKmNvbnRleHQs
IHVuc2lnbmVkIGludCByZWcsDQo+ID4+Pj4+ICt1bnNpZ25lZCBpbnQgdmFsKSB7DQo+ID4+Pj4+
ICsgICAgIHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSBjb250ZXh0Ow0KPiA+Pj4+PiArICAg
ICBzdHJ1Y3QgcnQ1NTc1X3ByaXYgKnJ0NTU3NSA9IGkyY19nZXRfY2xpZW50ZGF0YShjbGllbnQp
Ow0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsgICAgIHJlZ21hcF93cml0ZShydDU1NzUtPmRzcF9yZWdt
YXAsIHJlZyB8DQo+IFJUNTU3NV9EU1BfTUFQUElORywNCj4gPj4+PiB2YWwpOw0KPiA+Pj4+PiAr
DQo+ID4+Pj4+ICsgICAgIHJldHVybiAwOw0KPiA+Pj4+PiArfQ0KPiA+Pj4+PiArDQo+ID4+Pj4+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcgcnQ1NTc1X3JlZ21hcCA9IHsNCj4g
Pj4+Pj4gKyAgICAgLnJlZ19iaXRzID0gMTYsDQo+ID4+Pj4+ICsgICAgIC52YWxfYml0cyA9IDMy
LA0KPiA+Pj4+PiArICAgICAucmVnX3N0cmlkZSA9IDQsDQo+ID4+Pj4+ICsgICAgIC5tYXhfcmVn
aXN0ZXIgPSAweGZmZmMsDQo+ID4+Pj4+ICsgICAgIC5yZWFkYWJsZV9yZWcgPSBydDU1NzVfcmVh
ZGFibGVfcmVnaXN0ZXIsDQo+ID4+Pj4+ICsgICAgIC5yZWdfcmVhZCA9IHJ0NTU3NV9pMmNfcmVh
ZCwNCj4gPj4+Pj4gKyAgICAgLnJlZ193cml0ZSA9IHJ0NTU3NV9pMmNfd3JpdGUsDQo+ID4+Pj4+
ICsgICAgIC51c2Vfc2luZ2xlX3JlYWQgPSB0cnVlLA0KPiA+Pj4+PiArICAgICAudXNlX3Npbmds
ZV93cml0ZSA9IHRydWUsDQo+ID4+Pj4+ICt9Ow0KPiA+Pj4+DQo+ID4+Pj4gT0YgZGV2aWNlIElE
IHRhYmxlIGdvZXMgYXJvdW5kIGhlcmUgLSB0b2dldGhlciB3aXRoIEkyQy4NCj4gPj4+IEkgd2ls
bCBjb3JyZWN0IGl0Lg0KPiA+Pj4NCj4gPj4+Pj4gKw0KPiA+Pj4+PiArc3RhdGljIGNvbnN0IHN0
cnVjdCBpMmNfZGV2aWNlX2lkIHJ0NTU3NV9pMmNfaWRbXSA9IHsNCj4gPj4+Pj4gKyAgICAgeyAi
cnQ1NTc1IiB9LA0KPiA+Pj4+PiArICAgICB7IH0NCj4gPj4+Pj4gK307DQo+ID4+Pj4+ICtNT0RV
TEVfREVWSUNFX1RBQkxFKGkyYywgcnQ1NTc1X2kyY19pZCk7DQo+ID4+Pj4+ICsNCj4gPj4+Pj4g
K3N0YXRpYyBpbnQgcnQ1NTc1X2kyY19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjKSB7DQo+
ID4+Pj4+ICsgICAgIHN0cnVjdCBydDU1NzVfcHJpdiAqcnQ1NTc1Ow0KPiA+Pj4+PiArICAgICBz
dHJ1Y3QgZGV2aWNlICpkZXYgPSAmaTJjLT5kZXY7DQo+ID4+Pj4+ICsgICAgIGludCByZXQsIHZh
bDsNCj4gPj4+Pj4gKw0KPiA+Pj4+PiArI2lmIElTX0VOQUJMRUQoQ09ORklHX1NORF9TT0NfUlQ1
NTc1X1NQSSkNCj4gPj4+Pg0KPiA+Pj4+IE5vIGlmZGVmcyBpbiBkcml2ZXIgY29kZS4NCj4gPj4+
DQo+ID4+PiBJIGFtIG5vdCB1bmRlcnN0YW5kaW5nIGV4YWN0bHkuDQo+ID4+PiBJZiB0aGUgbWFj
aGluZSBpcyB3aXRob3V0IFNQSSBpbnRlcmZhY2UgYW5kIHRoZSBjb2RlYyB3aXRoIGZsYXNoLCB0
aGUNCj4gPj4+IENPTkZJR19TTkRfU09DX1JUNTU3NV9TUEkgY2FuIGJlIGRpc2FibGVkLg0KPiA+
Pg0KPiA+PiBCdXQgeW91IHN0aWxsIHNob3VsZCBub3QgdXNlICNpZmRlZi4gQ29kaW5nIHN0eWxl
IGdpdmVzIHlvdSBhbHRlcm5hdGl2ZSwgcGxlYXNlDQo+ID4+IGxvb2sgYXQgdGhlIGRvYy4NCj4g
Pj4NCj4gPj4+DQo+ID4+Pj4+ICsgICAgIGlmICghcnQ1NTc1X3NwaSAmJiBvZl9kZXZpY2VfaXNf
Y29tcGF0aWJsZShkZXYtPm9mX25vZGUsDQo+ID4+Pj4gcnQ1NTc1X29mX21hdGNoWzFdLmNvbXBh
dGlibGUpKQ0KPiA+Pj4+DQo+ID4+Pj4gTm8sIHVzZSBkcml2ZXIgbWF0Y2ggZGF0YSBpZiBldmVy
LCBidXQgdGhpcyBpcyBqdXN0IHdyb25nLiBZb3Ugc2FpZA0KPiA+Pj4+IGl0IGRlcGVuZHMgb24g
U1BJIGZsYXNoLCBub3QgU1BJIGludGVyZmFjZS4NCj4gPj4+DQo+ID4+PiBJIHdpbGwgbW9kaWZ5
IGl0IHRvIHVzZSB0aGUgbWF0Y2ggZGF0YSBhcyBmb2xsb3dpbmcuDQo+ID4+PiBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBydDU1NzVfb2ZfbWF0Y2hbXSA9IHsNCj4gPj4+ICAgICAg
IHsgLmNvbXBhdGlibGUgPSAicmVhbHRlayxydDU1NzUiLCAuZGF0YSA9ICh2b2lkDQo+ID4+ICop
UlQ1NTc1X1dJVEhfRkxBU0ggfSwNCj4gPj4+ICAgICAgIHsgLmNvbXBhdGlibGUgPSAicmVhbHRl
ayxydDU1NzUtdXNlLXNwaSIsIC5kYXRhID0gKHZvaWQNCj4gPj4+ICopUlQ1NTc1X1dJVEhPVVRf
RkxBU0ggfSwNCj4gPj4NCj4gPj4gV2hhdCBpcyBzdGlsbCB3cm9uZyBpcyB0aGF0IHdoeSB5b3Ug
ZGVmZXIgcHJvYmUgaWYgdGhlcmUgaXMgbm8gZmxhc2guIEkgcmVhbGx5IGRvDQo+ID4+IG5vdCBn
ZXQgaXQuLi4NCj4gPg0KPiA+IElmIHRoZSBjb2RlYyBoYXMgZmxhc2gsIHRoZSBmbGFzaCBpcyBj
b25uZWN0ZWQgdG8gdGhlIGNvZGVjJ3MgU1BJIGhvc3QNCj4gPiBpbnRlcmZhY2UuDQo+ID4NCj4g
PiBJZiB0aGUgY29kZWMgaGFzIG5vIGZsYXNoLCB0aGUgY29kZWMgU1BJIGRyaXZlciBzaG91bGQg
bG9hZCB0aGUgZmlybXdhcmUNCj4gPiBmcm9tIHRoZSBjb2RlYydzIFNQSSBzbGF2ZSBpbnRlcmZh
Y2UuIFRoZSBJMkMgZHJpdmVyIG11c3Qgd2FpdCB1bnRpbCB0aGUNCj4gPiBTUEkgZHJpdmVyIGlz
IHJlYWR5IHRvIGVuc3VyZSB0aGUgZmlybXdhcmUgaXMgbG9hZGVkIGNvcnJlY3RseS4NCj4gPg0K
PiANCj4gQWgsIHNvIGZvciB0aGF0IHJlYXNvbiB5b3UgY3JlYXRlZCB0aGF0IHNpbmdsZXRvbiwg
ZXhwb3J0ZWQgaXQgYW5kIHlvdQ0KPiB3YWl0IGZvciBpdD8gU2luZ2xldG9ucyBhcmUgcHJldHR5
IG5vLWdvIGFueXdheSwgaG93IGRvIHlvdSBoYW5kbGUgdG8NCj4gY29kZWNzIGluIHRoZSBzeXN0
ZW0/IEZyYWdpbGUgZGVzaWduLg0KDQpUaGUgY29kZSB3aWxsIGJlIGltcGxlbWVudGVkIGluIHRo
ZSB0b3Agb2YgdGhlIGkyY19wcm9iZSgpIGFzIGZvbGxvd2luZy4NCg0KaWYgKGRldl90eXBlID09
IFJUNTU3NV9XSVRIT1VUX0ZMQVNIKSB7DQoJaWYgKElTX0VOQUJMRUQoQ09ORklHX1NORF9TT0Nf
UlQ1NTc1X1NQSSkpIHsNCgkJaWYgKCFydDU1NzVfc3BpKSB7DQoJCQlkZXZfZXJyKGRldiwgIldh
aXQgU1BJIGRyaXZlciByZWFkeVxuIik7DQoJCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsNCgkJfQ0K
CX0gZWxzZSB7DQoJCWRldl9lcnIoZGV2LCAiVGhpcyBkZXYgdHlwZSBzaG91bGQgZW5hYmxlIENP
TkZJR19TTkRfU09DX1JUNTU3NV9TUElcbiIpOw0KCQlyZXR1cm4gLUVOT0RFVjsNCgl9DQp9DQoN
ClRoYW5rcywNCk9kZXINCg==
