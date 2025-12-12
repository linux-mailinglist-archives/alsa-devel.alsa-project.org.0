Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C963CB8598
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Dec 2025 10:00:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EE4160220;
	Fri, 12 Dec 2025 10:00:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EE4160220
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765530021;
	bh=J7+MHP9JHv0O6N4thchA53z0h4Lo6YTW9NlwTADzJ9c=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qAB0FqxiBh9gNHP3+VgDm1346p/4o7jnTQFKcSXQ5TYyRp4xHNttcvlYq2wRcKLEq
	 R0jIxAdaYc0asgJvi3JIWt+R1aV/tpqSn1ciy50pslXxxxdECETWnlSCsGHDTDwhAU
	 29WdLKIb3jCZkguegeTC6Fp8BhzuBcJUf/kd1BmA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B867F805CA; Fri, 12 Dec 2025 09:59:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E7F6F8032D;
	Fri, 12 Dec 2025 09:59:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D342F8014B; Fri, 12 Dec 2025 09:59:33 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 55F61F80095
	for <alsa-devel@alsa-project.org>; Fri, 12 Dec 2025 09:59:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55F61F80095
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=kyaO2tZO
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BC8xAunD3978353,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1765529950; bh=J7+MHP9JHv0O6N4thchA53z0h4Lo6YTW9NlwTADzJ9c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=kyaO2tZOhlb26XWKzWjyl2tvLqtJ6Qe+Z7cBgs6a27SGEVj00ag6GTmERPmaDkmS/
	 I4+HZHjyBdWOma6uiN93aPccdQEe/XecjXxCk73dj96SKOqhd4BAJx5gvK8K1v/i+F
	 CD+zfMZWUBqL5cUBftgRlU7/WHAJdtnS7Y8qB1STzphuNYYUBwHNQiIWG9qLCHa/XI
	 VeUCdr84y9Os6k+LCkNEhMOGjt7SkXo1v3X+/kfZ67qO8/E++QRHKt9ifVXwG3ppAk
	 XIZ7SqcA/2FS7GwjHLYln/XIpLB74g1mFa7MXRGFXMFkP339e/lI77pCfvy7lQ4QL1
	 i5eSu2zSnwfBg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BC8xAunD3978353
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Dec 2025 16:59:10 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 12 Dec 2025 16:59:10 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::2fa5:eccb:34ee:7bb%10]) with mapi id
 15.02.1544.027; Fri, 12 Dec 2025 16:59:10 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: "'Rob Herring'" <robh@kernel.org>
CC: "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "perex@perex.cz"
	<perex@perex.cz>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "Flove(HsinFu)" <flove@realtek.com>,
        =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>,
        Jack Yu
	<jack.yu@realtek.com>,
        =?big5?B?RGVyZWsgW6TovHe4cV0=?=
	<derek.fang@realtek.com>
Subject: RE: [PATCH v9 1/2] ASoC: dt-bindings: realtek,rt5575: add support for
 ALC5575
Thread-Topic: [PATCH v9 1/2] ASoC: dt-bindings: realtek,rt5575: add support
 for ALC5575
Thread-Index: AQHcao1RKCDC/uF5H0eyR5PDy/RBT7UcDTWAgAGESCA=
Date: Fri, 12 Dec 2025 08:59:10 +0000
Message-ID: <6c85fd92dc244789a5259ff4b11ec2e0@realtek.com>
References: <20251211110130.2925541-1-oder_chiou@realtek.com>
 <20251211110130.2925541-2-oder_chiou@realtek.com>
 <20251211153835.GA1251928-robh@kernel.org>
In-Reply-To: <20251211153835.GA1251928-robh@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: 2FAPKT4VNMZPXJX67ZSRY4YVTHS2JNEF
X-Message-ID-Hash: 2FAPKT4VNMZPXJX67ZSRY4YVTHS2JNEF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2FAPKT4VNMZPXJX67ZSRY4YVTHS2JNEF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgRGVjZW1iZXIgMTEsIDIwMjUgMTE6MzkgUE0N
Cj4gVG86IE9kZXIgQ2hpb3UgPG9kZXJfY2hpb3VAcmVhbHRlay5jb20+DQo+IENjOiBjZXphcnku
cm9qZXdza2lAaW50ZWwuY29tOyBicm9vbmllQGtlcm5lbC5vcmc7IGxnaXJkd29vZEBnbWFpbC5j
b207DQo+IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsgcGVyZXhAcGVy
ZXguY3o7DQo+IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmc7DQo+IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgRmxvdmUoSHNpbkZ1KSA8
ZmxvdmVAcmVhbHRlay5jb20+OyBTaHVtaW5nIFutUw0KPiCu0bvKXSA8c2h1bWluZ2ZAcmVhbHRl
ay5jb20+OyBKYWNrIFl1IDxqYWNrLnl1QHJlYWx0ZWsuY29tPjsgRGVyZWsgW6TovHcNCj4guHFd
IDxkZXJlay5mYW5nQHJlYWx0ZWsuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY5IDEvMl0g
QVNvQzogZHQtYmluZGluZ3M6IHJlYWx0ZWsscnQ1NTc1OiBhZGQgc3VwcG9ydCBmb3INCj4gQUxD
NTU3NQ0KPiANCj4gDQo+IEV4dGVybmFsIG1haWwgOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJv
bSBvdXRzaWRlIHRoZSBvcmdhbml6YXRpb24uIERvIG5vdA0KPiByZXBseSwgY2xpY2sgbGlua3Ms
IG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRlciBhbmQN
Cj4ga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4gDQo+IA0KPiBPbiBUaHUsIERlYyAx
MSwgMjAyNSBhdCAwNzowMToyOVBNICswODAwLCBPZGVyIENoaW91IHdyb3RlOg0KPiA+IEF1ZGlv
IGNvZGVjIHdpdGggSTJTLCBJMkMgYW5kIFNQSS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE9k
ZXIgQ2hpb3UgPG9kZXJfY2hpb3VAcmVhbHRlay5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5k
aW5ncy9zb3VuZC9yZWFsdGVrLHJ0NTU3NS55YW1sICAgICAgICB8IDQ0DQo+ICsrKysrKysrKysr
KysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKykNCj4gPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0DQo+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3Vu
ZC9yZWFsdGVrLHJ0NTU3NS55YW1sDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3JlYWx0ZWsscnQ1NTc1LnlhbWwNCj4gYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvcmVhbHRlayxydDU1NzUueWFtbA0K
PiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi42MGY5YWYz
OTlkZDINCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3NvdW5kL3JlYWx0ZWsscnQ1NTc1LnlhbWwNCj4gPiBAQCAtMCwwICsxLDQ0
IEBADQo+ID4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSBPUiBCU0Qt
Mi1DbGF1c2UNCj4gPiArJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL3NvdW5kL3JlYWx0ZWsscnQ1NTc1LnlhbWwjDQo+ID4gKyRzY2hl
bWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPiA+ICsN
Cj4gPiArdGl0bGU6IEFMQzU1NzUgYXVkaW8gQ09ERUMNCj4gPiArDQo+ID4gK21haW50YWluZXJz
Og0KPiA+ICsgIC0gT2RlciBDaGlvdSA8b2Rlcl9jaGlvdUByZWFsdGVrLmNvbT4NCj4gPiArDQo+
ID4gK2Rlc2NyaXB0aW9uOg0KPiA+ICsgIFRoZSBkZXZpY2Ugc3VwcG9ydHMgYm90aCBJMkMgYW5k
IFNQSS4gSTJDIGlzIG1hbmRhdG9yeSwgd2hpbGUgU1BJIGlzDQo+ID4gKyAgb3B0aW9uYWwgZGVw
ZW5kaW5nIG9uIHRoZSBoYXJkd2FyZSBjb25maWd1cmF0aW9uLg0KPiA+ICsNCj4gPiArYWxsT2Y6
DQo+ID4gKyAgLSAkcmVmOiAvc2NoZW1hcy9zcGkvc3BpLXBlcmlwaGVyYWwtcHJvcHMueWFtbCMN
Cj4gPiArICAtICRyZWY6IGRhaS1jb21tb24ueWFtbCMNCj4gPiArDQo+ID4gK3Byb3BlcnRpZXM6
DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGVudW06DQo+ID4gKyAgICAgIC0gcmVhbHRl
ayxydDU1NzUNCj4gPiArICAgICAgLSByZWFsdGVrLHJ0NTU3NS11c2Utc3BpDQo+ID4gKw0KPiA+
ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4g
PiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+ICsNCj4gPiArdW5ldmFsdWF0ZWRQ
cm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArZXhhbXBsZXM6DQo+ID4gKyAgLSB8DQo+ID4g
KyAgICBpMmMgew0KPiA+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+ICsgICAg
ICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPiA+ICsgICAgICAgIGNvZGVjQDU3IHsNCj4gPiArICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJyZWFsdGVrLHJ0NTU3NSI7DQo+ID4gKyAgICAgICAgICAg
IHJlZyA9IDwweDU3PjsNCj4gPiArICAgICAgICB9Ow0KPiA+ICsgICAgfTsNCj4gDQo+IEl0IGlz
IGNvbXBsZXRlbHkgdW5jbGVhciB3aGF0IHlvdSBhcmUgZG9pbmcgaW4gdGhlIFNQSSBjYXNlLiBJ
DQo+IGRlY2lwaGVyZWQgaXQgc3R1ZHlpbmcgdGhlIGRyaXZlci4gSSBzaG91bGRuJ3QgaGF2ZSB0
byBkbyB0aGF0LCB5b3VyDQo+IGJpbmRpbmcgc2hvdWxkIG1ha2UgdGhhdCBjbGVhci4NCj4gDQo+
IFNvIHlvdXIgRFQgbXVzdCBsb29rIGxpa2UgdGhpczoNCj4gDQo+IGkyYyB7DQo+ICAgICAgICAg
Y29kZWNANTcgew0KPiAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyZWFsdGVrLHJ0NTU3
NS11c2Utc3BpIjsNCj4gICAgICAgICAgICAgICAgIHJlZyA9IDwweDU3PjsNCj4gICAgICAgICB9
Ow0KPiB9Ow0KPiANCj4gc3BpIHsNCj4gICAgICAgICBjb2RlY0AxIHsNCj4gICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAicmVhbHRlayxydDU1NzUiOw0KPiAgICAgICAgICAgICAgICAgcmVn
ID0gPDB4MT47DQo+ICAgICAgICAgfTsNCj4gfTsNCj4gDQo+IEZpcnN0LCB0aGVyZSdzIG5vIG5l
ZWQgZm9yICItdXNlLXNwaSIgYmVjYXVzZSB5b3UgY2FuIGp1c3QgY2hlY2sgaWYNCj4gdGhlcmUg
aXMgYSBydDU1NzUgU1BJIGRldmljZSBhbmQgdXNlIGl0IGlmIHRoZXJlIGlzLiBXaHkgd291bGQg
eW91IGhhdmUNCj4gdGhlIFNQSSBkZXZpY2UgYW5kIG5vdCB1c2UgaXQ/DQoNClRoZSBjb21wYXRp
YmxlIHJlYWx0ZWsscnQ1NTc1LXVzZS1zcGkgd2lsbCBiZSByZW1vdmVkLCBhbmQgaWYgdGhlcmUg
aXMgbm8NClNQSSBkZXZpY2UgaW4gdGhlIERUUywgdGhlIHdhcm5pbmcgbWVzc2FnZSB3aWxsIGJl
IHNob3duIGFzICJUaGUgaGFyZHdhcmUNCmNvbmZpZ3VyYXRpb24gc2hvdWxkIGJlIHdpdGggYnVp
bHQtaW4gZmxhc2giLg0KDQo+IEJ1dCByZWFsbHkgaXQgaXMgbm90IGlkZWFsIGhhdmluZyAyIGRl
dmljZSBub2RlcyBmb3IgYSBzaW5nbGUgZGV2aWNlLiBJdA0KPiB3b3VsZCBiZSBtdWNoIHNpbXBs
ZXIgdG8ganVzdCBoYXZlIHNvbWV0aGluZyBsaWtlIHRoaXMgaW4gdGhlIGkyYyBub2RlOg0KPiAN
Cj4gc3BpLXBhcmVudCA9IDwmc3BpMCAxPjsNCj4gDQo+IFdoZXJlIHRoZSBjZWxsIGlzIHRoZSBj
aGlwLXNlbGVjdCAjLg0KPiANCj4gV2UgaGF2ZSBhbiAnaTJjLXBhcmVudCcgYWxyZWFkeSBmb3Ig
c2ltaWxhciByZWFzb25zIHdoZW4gdGhlcmUgYXJlIDINCj4gYnVzIGNvbm5lY3Rpb25zLg0KDQpJ
biB0aGUgY3VycmVudCBrZXJuZWwsIEkgY2Fubm90IGZpbmQgYW55IGZ1bmN0aW9uIHRvIG9idGFp
biBhDQpzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXIgd2hlbiBubyBTUEkgZGV2aWNlIGlzIGRlZmluZWQg
aW4gdGhlIERUUy4gVGhpcyB3YXMNCnBvc3NpYmxlIGluIG9sZGVyIGtlcm5lbHMgdXNpbmcgdGhl
IGxlZ2FjeSBzcGlfYnVzbnVtX3RvX21hc3RlcigpLCBidXQNCnRoYXQgZnVuY3Rpb24gaXMgbm8g
bG9uZ2VyIGF2YWlsYWJsZSBpbiB1cHN0cmVhbS4NCg0KVGhhbmtzLA0KT2Rlcg0K
