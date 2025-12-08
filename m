Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B62D0CAC1AF
	for <lists+alsa-devel@lfdr.de>; Mon, 08 Dec 2025 06:57:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D681D60201;
	Mon,  8 Dec 2025 06:57:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D681D60201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765173453;
	bh=Nfkl/XQNybTu0KooJcsgkhhzvXw2KcaEflF+eWSc5oE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OjO8AmSRrTQe0KIeB+hrTf43xZyBgnTzxVtx1+8xYEr5LWYI/FPENCB6Eg1FBYUzO
	 uSmsljKjaIENH6IDInDUAVI58wl7RRI9BDk80YOUOOTcdftlfeOCMI39+ow+INzvtP
	 8xEpQdXHnzaT0yYioZ96xs0GdDEVqYD8Cgdrl9MY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90F31F805D4; Mon,  8 Dec 2025 06:56:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1871BF805D8;
	Mon,  8 Dec 2025 06:56:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7535AF80525; Mon,  8 Dec 2025 06:55:41 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BEDA5F800ED
	for <alsa-devel@alsa-project.org>; Mon,  8 Dec 2025 06:55:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEDA5F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=nzYJXGp0
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5B85tP2w93468333,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1765173325; bh=Nfkl/XQNybTu0KooJcsgkhhzvXw2KcaEflF+eWSc5oE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=nzYJXGp0mUSDYSM2XdHnwpwubkc4RLQeoBLRuJ/gl5d4FGMQ8qBJukaOjasZI54KC
	 vvBuX4TaUJmDPnuRDwUHGVRi7IZUxE1iqjDPjhyaVujg6ESQzciWxxN/icrduEnV0l
	 E/vOevOuRFh/RaV8Q02Zjtxo1+eobzQGMgYtcxJItqCzXXDR1jEWJtEgcyIn8LEsbj
	 sNXidvXBAGBUTaS9iVRxCBegDX/MXVA9nBKwhIPyJTq+DD3pflNo7t58Rb3RsmQrwG
	 QKFciRVIJcYEhN00/F6D7O3nrfVWkhd1Y8MdYUWXjVdyYZHY+STC/V2OboG3gQSWlb
	 5NZrMIVlsNb5w==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5B85tP2w93468333
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Dec 2025 13:55:25 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 8 Dec 2025 13:55:25 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 8 Dec 2025 13:55:24 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::2fa5:eccb:34ee:7bb%10]) with mapi id
 15.02.1544.027; Mon, 8 Dec 2025 13:55:24 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>
CC: "cezary.rojewski@intel.com" <cezary.rojewski@intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "perex@perex.cz" <perex@perex.cz>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "Flove(HsinFu)"
	<flove@realtek.com>,
        =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?=
	<shumingf@realtek.com>,
        Jack Yu <jack.yu@realtek.com>,
        =?big5?B?RGVyZWsgW6TovHe4cV0=?= <derek.fang@realtek.com>
Subject: RE: [PATCH v8 2/2] ASoC: dt-bindings: realtek,rt5575: add bindings
 for ALC5575
Thread-Topic: [PATCH v8 2/2] ASoC: dt-bindings: realtek,rt5575: add bindings
 for ALC5575
Thread-Index: AQHcYrFaKydGtVTIOUeezPiWPUvKu7USN3yAgAUNqlA=
Date: Mon, 8 Dec 2025 05:55:24 +0000
Message-ID: <333205912a0b4a44b95b858ef83fa52e@realtek.com>
References: <20251201105926.1714341-1-oder_chiou@realtek.com>
 <20251201105926.1714341-3-oder_chiou@realtek.com>
 <20251205-stylish-numbat-of-awe-10edcd@quoll>
In-Reply-To: <20251205-stylish-numbat-of-awe-10edcd@quoll>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: ZNTL3KHCM2W45BBNALHL336JO2I64AWD
X-Message-ID-Hash: ZNTL3KHCM2W45BBNALHL336JO2I64AWD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZNTL3KHCM2W45BBNALHL336JO2I64AWD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgRGVjZW1iZXIgNSwgMjAyNSA0OjMx
IFBNDQo+IFRvOiBPZGVyIENoaW91IDxvZGVyX2NoaW91QHJlYWx0ZWsuY29tPg0KPiBDYzogY2V6
YXJ5LnJvamV3c2tpQGludGVsLmNvbTsgYnJvb25pZUBrZXJuZWwub3JnOyBsZ2lyZHdvb2RAZ21h
aWwuY29tOw0KPiByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRA
a2VybmVsLm9yZzsgcGVyZXhAcGVyZXguY3o7DQo+IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9y
ZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZzsgRmxvdmUoSHNpbkZ1KSA8ZmxvdmVAcmVhbHRlay5jb20+OyBTaHVtaW5nIFutUw0KPiCu
0bvKXSA8c2h1bWluZ2ZAcmVhbHRlay5jb20+OyBKYWNrIFl1IDxqYWNrLnl1QHJlYWx0ZWsuY29t
PjsgRGVyZWsgW6TovHcNCj4guHFdIDxkZXJlay5mYW5nQHJlYWx0ZWsuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHY4IDIvMl0gQVNvQzogZHQtYmluZGluZ3M6IHJlYWx0ZWsscnQ1NTc1OiBh
ZGQgYmluZGluZ3MgZm9yDQo+IEFMQzU1NzUNCj4gDQo+IA0KPiBFeHRlcm5hbCBtYWlsIDogVGhp
cyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QN
Cj4gcmVwbHksIGNsaWNrIGxpbmtzLCBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVj
b2duaXplIHRoZSBzZW5kZXIgYW5kDQo+IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+
IA0KPiANCj4gT24gTW9uLCBEZWMgMDEsIDIwMjUgYXQgMDY6NTk6MjZQTSArMDgwMCwgT2RlciBD
aGlvdSB3cm90ZToNCj4gPiBSZWFsdGVrIEFMQzU1NzUgaXMgYSBoaWdobHkgYWR2YW5jZWQgRFNQ
IGFuZCBtaWNyb3Bob25lIENPREVDIHRoYXQgaGFzDQo+ID4gYmVlbiBkZXNpZ25lZCBmb3IgQUkg
YXVkaW8gdGVjaG5vbG9neS4gSXRzIGltcHJlc3NpdmUgZmVhdHVyZXMgaW5jbHVkZQ0KPiA+IGFu
IGFkdmFuY2VkIEhpRmktNSBEU1AgY29yZSwgYSBOZXVyYWwgTmV0d29yayBQcm9jZXNzaW5nIFVu
aXQgKE5QVSkNCj4gPiBvd25lZCBieSBSZWFsdGVrLCBhbmQgZW1iZWRkZWQgNE1CIG1lbW9yeSwg
d2hpY2ggZW5hYmxlcyBpdCB0byBvcGVyYXRlDQo+ID4gaGlnaGx5IGFkdmFuY2VkIEFJIGF1ZGlv
IGFsZ29yaXRobXMuIFRoZSBBTEM1NTc1IHN1cHBvcnRzIDR4QS1taWMgaW5wdXQNCj4gPiBhbmQg
OHhELW1pYyBpbnB1dCwgYXMgd2VsbCBhcyBhIHJpY2ggc2V0IG9mIGludGVyZmFjZXMgc3VjaCBh
cyBJMlMsIEkyQywNCj4gPiBTUEksIGFuZCBVQVJULg0KPiANCj4gV2hlbiBJIGFza2VkIHRvIGRl
c2NyaWJlIGhhcmR3YXJlLCBJIGRpZCBub3QgbWVhbnQgbWFya2V0aW5nIGp1bmshIERyb3ANCj4g
YWxsIGltcHJlc3NpdmUgZmVhdHVyZXMgYW5kIHNpbXBseSBkZXNjcmliZSBoYXJkd2FyZSBpbiBi
YXNpYyB0ZXJtcy4NCj4gVGhpcyBpcyBub3QgYWR2YW5jZWQgRFNQLCBub3QgZGVzaWduZWQgZm9y
IEFJIGF1ZGlvIChBSSBpcyB0aGUgZWFzaWVzdCB3YXkgdG8NCj4gZ2V0IGEgZ3J1bXB5IHJldmll
dyksIG5vdCAiaGlnaGx5IGFkdmFuY2VkIEFJIGF1ZGlvIGFsZ29yaXRobXMiIGFuZCBkb2VzDQo+
IG5vdCBoYXZlICJhcyBhIHJpY2ggc2V0IG9mIGludGVyZmFjZXMiLg0KPiANCj4gVXNlIHNpbXBs
ZSB0ZXJtcyB3aGF0IGlzIHRoaXMuIEF1ZGlvIGNvZGVjIHdpdGggSTJTLi4uLiBpbnRlcmZhY2Vz
Lg0KDQpUaGUgZGVzY3JpcHRpb24gd2lsbCBiZSBjaGFuZ2UgdG8NCkF1ZGlvIGNvZGVjIHdpdGgg
STJTLCBJMkMgYW5kIFNQSS4NCg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogT2RlciBDaGlvdSA8
b2Rlcl9jaGlvdUByZWFsdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL3NvdW5k
L3JlYWx0ZWsscnQ1NTc1LnlhbWwgICAgICAgIHwgNDQNCj4gKysrKysrKysrKysrKysrKysrKw0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAx
MDA2NDQNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3JlYWx0ZWss
cnQ1NTc1LnlhbWwNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc291bmQvcmVhbHRlayxydDU1NzUueWFtbA0KPiBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9yZWFsdGVrLHJ0NTU3NS55YW1sDQo+ID4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjgzY2NjNzllNjc2OQ0KPiA+
IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc291bmQvcmVhbHRlayxydDU1NzUueWFtbA0KPiA+IEBAIC0wLDAgKzEsNDQgQEANCj4gPiAr
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQ0K
PiA+ICslWUFNTCAxLjINCj4gPiArLS0tDQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3Jn
L3NjaGVtYXMvc291bmQvcmVhbHRlayxydDU1NzUueWFtbCMNCj4gPiArJHNjaGVtYTogaHR0cDov
L2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRs
ZTogQUxDNTU3NSBhdWRpbyBDT0RFQw0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAg
LSBPZGVyIENoaW91IDxvZGVyX2NoaW91QHJlYWx0ZWsuY29tPg0KPiA+ICsNCj4gPiArZGVzY3Jp
cHRpb246DQo+ID4gKyAgVGhlIGRldmljZSBzdXBwb3J0cyBib3RoIEkyQyBhbmQgU1BJLiBJMkMg
aXMgbWFuZGF0b3J5LCB3aGlsZSBTUEkgaXMNCj4gPiArICBvcHRpb25hbCBkZXBlbmRpbmcgb24g
dGhlIGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24uDQo+ID4gKw0KPiA+ICthbGxPZjoNCj4gPiArICAt
ICRyZWY6IC9zY2hlbWFzL3NwaS9zcGktcGVyaXBoZXJhbC1wcm9wcy55YW1sIw0KPiA+ICsgIC0g
JHJlZjogZGFpLWNvbW1vbi55YW1sIw0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBj
b21wYXRpYmxlOg0KPiA+ICsgICAgZW51bToNCj4gPiArICAgICAgLSByZWFsdGVrLHJ0NTU3NQ0K
PiA+ICsgICAgICAtIHJlYWx0ZWsscnQ1NTc1LXdpdGgtc3BpDQo+IA0KPiBEcm9wIHRoZSBzZWNv
bmQgY29tcGF0aWJsZS4gSXQncyB0aGUgc2FtZSBkZXZpY2UuIFdoZXRoZXIgaXQgc3VwcG9ydHMN
Cj4gU1BJIGl0IGlzIGFscmVhZHkga25vd24gYW5kIG9idmlvdXMgLSB5b3UgY2Fubm90IHBsYWNl
IG5vbi1TUEkgY2hpcCBvbg0KPiBTUEkgYnVzIGFuZCBleHBlY3QgaXQgdG8gd29yay4NCg0KVGhl
cmUgYXJlIHR3byBoYXJkd2FyZSBjb25maWd1cmF0aW9uczogd2l0aCBTUEkgZmxhc2ggYW5kIHdp
dGhvdXQgU1BJIGZsYXNoLg0KSWYgdGhlIGNvZGVjIGlzIHNoaXBwZWQgd2l0aG91dCBhbiBTUEkg
Zmxhc2gsIHRoZSBTUEkgZHJpdmVyIGNhbiBzdGlsbCBsb2FkDQp0aGUgZmlybXdhcmUgdGhyb3Vn
aCB0aGUgU1BJIGludGVyZmFjZS4gVGhlIHNlY29uZCBjb21wYXRpYmxlIGlzIGludGVuZGVkIHRv
DQpkaXN0aW5ndWlzaCBiZXR3ZWVuIHRoZSB2ZXJzaW9ucyB3aXRoIGFuZCB3aXRob3V0IHRoZSBT
UEkgZmxhc2guDQoNCg==
