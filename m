Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE098FC6AD
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2024 10:38:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C027950;
	Wed,  5 Jun 2024 10:37:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C027950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717576686;
	bh=ODoK20LE2tDxy3cgXLqZ9Y47PiHB//xebafiA0+PEhc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FpVrtG0ZARb7TZsWORlEIgJQzJwsYDHB4fxXPiu+UdoCFUpnOGKCy6fafT4ouUdqv
	 hKneP3G/gQLpS/N/96qEy09106YDjEjESxp7Gak8ZL2OD1TGVLRWrRCG+jI9Q9D2Nf
	 9el7w+TURXOZ7UsfcXQxpPxJKTLOLJGTs4ffiKBg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AAECF805AA; Wed,  5 Jun 2024 10:37:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 912CEF804E5;
	Wed,  5 Jun 2024 10:37:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D666F802DB; Wed,  5 Jun 2024 10:35:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7426EF8003A
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 10:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7426EF8003A
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4558ZYlB41294963,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 4558ZYlB41294963
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 16:35:34 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 16:35:35 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 5 Jun 2024 16:35:34 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975]) by
 RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975%5]) with mapi id
 15.01.2507.035; Wed, 5 Jun 2024 16:35:34 +0800
From: Jack Yu <jack.yu@realtek.com>
To: Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>,
        =?big5?B?RGVyZWsgW6TovHe4cV0=?= <derek.fang@realtek.com>
Subject: RE: [PATCH] ASoC: rt1318: Add RT1318 audio amplifier driver
Thread-Topic: [PATCH] ASoC: rt1318: Add RT1318 audio amplifier driver
Thread-Index: Adq2Rs/8n9D0p31EQZaWG09Bfd/1V///5GUAgAFOiKA=
Date: Wed, 5 Jun 2024 08:35:34 +0000
Message-ID: <ec0216e7174f46a19b23c1b256486514@realtek.com>
References: <c6d0e09de01c4804bfff6efe92fff04c@realtek.com>
 <0c681db6-6a5c-416e-9c60-4b72e2eb172d@sirena.org.uk>
In-Reply-To: <0c681db6-6a5c-416e-9c60-4b72e2eb172d@sirena.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.22.102.102]
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: WAFGD4OO35MT2C2MRXZ7JFE4DRVEXQ4M
X-Message-ID-Hash: WAFGD4OO35MT2C2MRXZ7JFE4DRVEXQ4M
X-MailFrom: jack.yu@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WAFGD4OO35MT2C2MRXZ7JFE4DRVEXQ4M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJrIEJyb3duIDxicm9vbmll
QGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgNCwgMjAyNCA4OjM4IFBNDQo+IFRv
OiBKYWNrIFl1IDxqYWNrLnl1QHJlYWx0ZWsuY29tPg0KPiBDYzogbGdpcmR3b29kQGdtYWlsLmNv
bTsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOyBsYXJzQG1ldGFmb28uZGU7DQo+IEZsb3Zl
KEhzaW5GdSkgPGZsb3ZlQHJlYWx0ZWsuY29tPjsgT2RlciBDaGlvdSA8b2Rlcl9jaGlvdUByZWFs
dGVrLmNvbT47DQo+IFNodW1pbmcgW61TrtG7yl0gPHNodW1pbmdmQHJlYWx0ZWsuY29tPjsgRGVy
ZWsgW6TovHe4cV0NCj4gPGRlcmVrLmZhbmdAcmVhbHRlay5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0hdIEFTb0M6IHJ0MTMxODogQWRkIFJUMTMxOCBhdWRpbyBhbXBsaWZpZXIgZHJpdmVyDQo+
IA0KPiBPbiBUdWUsIEp1biAwNCwgMjAyNCBhdCAwNjoxNzowMkFNICswMDAwLCBKYWNrIFl1IHdy
b3RlOg0KPiANCj4gPiArc3RhdGljIGludCBydDEzMThfaW5pdF9wdXQoc3RydWN0IHNuZF9rY29u
dHJvbCAqa2NvbnRyb2wsDQo+ID4gKwkJc3RydWN0IHNuZF9jdGxfZWxlbV92YWx1ZSAqdWNvbnRy
b2wpIHsNCj4gPiArCXN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50ID0NCj4gc25k
X3NvY19rY29udHJvbF9jb21wb25lbnQoa2NvbnRyb2wpOw0KPiA+ICsJc3RydWN0IHJ0MTMxOF9w
cml2ICpydDEzMTggPQ0KPiA+ICtzbmRfc29jX2NvbXBvbmVudF9nZXRfZHJ2ZGF0YShjb21wb25l
bnQpOw0KPiA+ICsNCj4gPiArCXJ0MTMxOC0+cnQxMzE4X2luaXQgPSB1Y29udHJvbC0+dmFsdWUu
aW50ZWdlci52YWx1ZVswXTsNCj4gPiArDQo+ID4gKwlpZiAocnQxMzE4LT5ydDEzMThfaW5pdCkN
Cj4gPiArCQlydDEzMThfcmVnX2luaXQoY29tcG9uZW50KTsNCj4gPiArDQo+ID4gKwlyZXR1cm4g
MDsNCj4gPiArfQ0KPiANCj4gU28gdGhpcyBjb250cm9sIHJlc2V0cyB0aGUgQ09ERUMgLSB3aGF0
J3MgdGhlIHN0b3J5IGhlcmU/ICBSZWFsbHkgaXQgc2hvdWxkIGJlIGENCj4gYm9vbGVhbiwgYW5k
IGlmIHlvdSBydW4gbWl4ZXItdGVzdCBpdCdsbCB0ZWxsIHlvdSB5b3UncmUgbm90IHJldHVybmlu
ZyAxIGZvciB2YWx1ZQ0KPiBjaGFuZ2VzIC0gcGxlYXNlIHJ1biBtaXhlci10ZXN0LCB0aGVyZSBh
cmUgYSBudW1iZXIgb2Ygb3RoZXIgZXJyb3JzIHRoYXQgaXQgd2lsbA0KPiBkZXRlY3QgaGVyZS4N
Cj4gDQpJIHdpbGwgcmVtb3ZlIHRoaXMgY29udHJvbCBzaW5jZSBpdCdzIG9ubHkgZm9yIGludGVy
bmFsIHRlc3RpbmcgcHVycG9zZS4NCg0KPiA+ICtzdGF0aWMgaW50IHJ0MTMxOF9kdm9sX3B1dChz
dHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwNCj4gPiArCQlzdHJ1Y3Qgc25kX2N0bF9lbGVt
X3ZhbHVlICp1Y29udHJvbCkgew0KPiA+ICsJc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21w
b25lbnQgPQ0KPiBzbmRfc29jX2tjb250cm9sX2NvbXBvbmVudChrY29udHJvbCk7DQo+ID4gKwlz
dHJ1Y3QgcnQxMzE4X3ByaXYgKnJ0MTMxOCA9DQo+ID4gK3NuZF9zb2NfY29tcG9uZW50X2dldF9k
cnZkYXRhKGNvbXBvbmVudCk7DQo+ID4gKw0KPiA+ICsJcnQxMzE4LT5ydDEzMThfZHZvbCA9IHVj
b250cm9sLT52YWx1ZS5pbnRlZ2VyLnZhbHVlWzBdOw0KPiA+ICsNCj4gPiArCWlmIChydDEzMTgt
PnJ0MTMxOF9kdm9sIDw9IFJUMTMxOF9EVk9MX1NURVApIHsNCj4gPiArCQlyZWdtYXBfd3JpdGUo
cnQxMzE4LT5yZWdtYXAsIFJUMTMxOF9EQV9WT0xfTF84LA0KPiBydDEzMTgtPnJ0MTMxOF9kdm9s
ID4+IDgpOw0KPiA+ICsJCXJlZ21hcF93cml0ZShydDEzMTgtPnJlZ21hcCwgUlQxMzE4X0RBX1ZP
TF9MXzFfNywNCj4gcnQxMzE4LT5ydDEzMThfZHZvbCAmIDB4ZmYpOw0KPiA+ICsJCXJlZ21hcF93
cml0ZShydDEzMTgtPnJlZ21hcCwgUlQxMzE4X0RBX1ZPTF9SXzgsDQo+IHJ0MTMxOC0+cnQxMzE4
X2R2b2wgPj4gOCk7DQo+ID4gKwkJcmVnbWFwX3dyaXRlKHJ0MTMxOC0+cmVnbWFwLCBSVDEzMThf
REFfVk9MX1JfMV83LA0KPiA+ICtydDEzMTgtPnJ0MTMxOF9kdm9sICYgMHhmZik7DQo+IA0KPiBU
aGlzIHdpbGwgaGFwcGlseSBhY2NlcHQgbmVnYXRpdmUgdmFsdWVzIHdoaWNoIHlvdSBwcm9iYWJs
eSBkb24ndCB3YW50Lg0KDQpJJ2xsIGRvIG1vZGlmaWNhdGlvbiByZWdhcmRpbmcgdG8gaXQuDQoN
Cj4gDQo+ID4gKwl9IGVsc2Ugew0KPiA+ICsJCXJ0MTMxOC0+cnQxMzE4X2R2b2wgPSBSVDEzMThf
RFZPTF9TVEVQOw0KPiA+ICsJCWRldl9lcnIoY29tcG9uZW50LT5kZXYsICJVbnN1cHBvcnRlZCB2
b2x1bWUgZ2FpblxuIik7DQo+IA0KPiBUaGUgZHJpdmVyIHNob3VsZG4ndCBhbGxvdyB1c2Vyc3Bh
Y2UgdG8gc3BhbSB0aGUga2VybmVsIGxvZyBsaWtlIHRoaXMsIGl0IGNhbiBiZQ0KPiB1c2VkIHRv
IG1hc2sgaXNzdWVzLg0KPiANCkknbGwgcmVtb3ZlIHRoaXMgImVsc2UiIGNvbmRpdGlvbi4NCg0K
PiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9rY29udHJvbF9uZXcgcnQxMzE4X3NuZF9jb250
cm9sc1tdID0gew0KPiA+ICsJU09DX1NJTkdMRV9FWFQoInJ0MTMxOCBkaWdpdGFsIHZvbHVtZSIs
IFNORF9TT0NfTk9QTSwgMCwgMzgzLCAwLA0KPiA+ICsJCXJ0MTMxOF9kdm9sX2dldCwgcnQxMzE4
X2R2b2xfcHV0KSwNCj4gDQo+IE5vIG5lZWQgdG8gaW5jbHVkZSB0aGUgcGFydCBudW1iZXIgaW4g
Y29udHJvbHMsIHVzZXJzIGFyZW4ndCBnb2luZyB0byBjYXJlLg0KPiBUaGUgZ2VuZXJhbCBzdHls
ZSBmb3IgQUxTQSBjb250cm9scyBpcyBjYXBpdGFsaXNlZCB0b28uDQpXaWxsIHJlbW92ZSBwYXJ0
IG51bWJlci4NCg0K
