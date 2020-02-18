Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C0D1620F3
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Feb 2020 07:35:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51F171616;
	Tue, 18 Feb 2020 07:34:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51F171616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582007722;
	bh=iqmGDFaZ2/FOKoLFgPJMgUDOoXvyg8uJd5+fHIVRfmo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JXHvX4dn52UwJo7F1dPzg2RIXLqI7XAKjX25QrdkKjblZwvNfcF6S7hqzFecKXVLO
	 IK+5OGu47dMMSk69UOuuCeOYuXMM8lcA6S1asSH4JpDFROFrTf3DJCs0bHOCnCVm1f
	 uCeB0dT+8AnkpKmjxU4DrGbgYXUs9lFKT4SIriIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A635F80137;
	Tue, 18 Feb 2020 07:33:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93132F80137; Tue, 18 Feb 2020 07:33:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 131C0F80137
 for <alsa-devel@alsa-project.org>; Tue, 18 Feb 2020 07:33:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 131C0F80137
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 01I6XKk4028510,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 01I6XKk4028510
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Feb 2020 14:33:20 +0800
Received: from RTEXMB03.realtek.com.tw (172.21.6.96) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 18 Feb 2020 14:33:20 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 18 Feb 2020 14:33:19 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f]) by
 RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f%6]) with mapi id
 15.01.1779.005; Tue, 18 Feb 2020 14:33:19 +0800
From: =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 1/2] ASoC: rt5682: Add CCF usage for providing I2S clks
Thread-Topic: [PATCH 1/2] ASoC: rt5682: Add CCF usage for providing I2S clks
Thread-Index: AQHV4wvtH7yiUMiVn0yLTwoY4Ri/YagaGv6AgAUZexD//50sAIABreBQ
Date: Tue, 18 Feb 2020 06:33:19 +0000
Message-ID: <6f7994b39e9444eaaf269cca76104585@realtek.com>
References: <1581666814-6380-1-git-send-email-derek.fang@realtek.com>
 <20200214123803.GG4827@sirena.org.uk>
 <b9cfe003aeb34216b59c9a22c4601bf1@realtek.com>
 <20200217123650.GD9304@sirena.org.uk>
In-Reply-To: <20200217123650.GD9304@sirena.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.141]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Albert Chen <albertchen@realtek.com>,
 =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gQVNvQzogcnQ1NjgyOiBBZGQgQ0NGIHVzYWdlIGZv
ciBwcm92aWRpbmcgSTJTIGNsa3MNCj4gDQo+IE9uIE1vbiwgRmViIDE3LCAyMDIwIGF0IDEwOjU5
OjU1QU0gKzAwMDAsIERlcmVrIFvmlrnlvrfnvqldIHdyb3RlOg0KPiA+ID4gU3ViamVjdDogUmU6
IFtQQVRDSCAxLzJdIEFTb0M6IHJ0NTY4MjogQWRkIENDRiB1c2FnZSBmb3IgcHJvdmlkaW5nIEky
UyBjbGtzDQo+IA0KPiA+ID4gPiArCWlmIChwYXJlbnRfcmF0ZSAhPSBDTEtfUExMMl9GSU4pDQo+
ID4gPiA+ICsJCWRldl93YXJuKGNvbXBvbmVudC0+ZGV2LCAiY2xrICVzIG9ubHkgc3VwcG9ydCAl
ZCBIeg0KPiBpbnB1dFxuIiwNCj4gPiA+ID4gKwkJCWNsa19uYW1lLCBDTEtfUExMMl9GSU4pOw0K
PiANCj4gPiA+ID4gKwlpZiAocmF0ZSAhPSBDTEtfNDgpIHsNCj4gPiA+ID4gKwkJZGV2X3dhcm4o
Y29tcG9uZW50LT5kZXYsICJjbGsgJXMgb25seSBzdXBwb3J0ICVkIEh6DQo+IG91dHB1dFxuIiwN
Cj4gPiA+ID4gKwkJCWNsa19uYW1lLCBDTEtfNDgpOw0KPiA+ID4gPiArCQlyYXRlID0gQ0xLXzQ4
Ow0KPiA+ID4gPiArCX0NCj4gDQo+ID4gPiBBcmUgdGhlc2UgZ2VudWluZSByZXN0cmljdGlvbnMg
b2YgdGhlIGhhcmR3YXJlIG9yIGlzIHRoaXMganVzdCBiZWluZw0KPiA+ID4gaGFyZCBjb2RlZCBp
biB0aGUgZHJpdmVyPw0KPiANCj4gPiBJdCdzIGhhcmQgY29kZWQgZm9yIGFuIGFwcGxpY2F0aW9u
IGNhc2UuDQo+ID4gR2VuZXJhdGUgYSA0OGtIeiBjbGsgd2l0aCBhIHBhcmVudCA0OCBNSHogY2xr
Lg0KPiANCj4gSSBzZWUuLi4gIG9idmlvdXNseSB0aGlzIGlzIHJlYWxseSBub3QgZ29vZCBxdWFs
aXR5IG9mIGltcGxlbWVudGF0aW9uDQo+IGFsdGhvdWdoIGl0IGRvZXNuJ3QgYWN0dWFsbHkgYnJl
YWsgYW55IGV4dGVybmFsIGludGVyZmFjZXMgc28gSSBndWVzcyB3ZQ0KPiBjb3VsZCB0YWtlIGl0
LiAgSSB3b3VsZCBhdCBsZWFzdCB3YW50IHRvIHNlZSBzb21lIGNsZWFyIGNvbW1lbnRzIGluIGJv
dGgNCj4gdGhlIGNvZGUgYW5kIHRoZSBjaGFuZ2Vsb2cgZXhwbGFpbmluZyB0aGF0IHRoaXMgbGlt
aXRhdGlvbiBpcyBqdXN0IGENCj4gdGVtcG9yYXJ5IGhhY2sgdW50aWwgYSBiZXR0ZXIgaW1wbGVt
ZW50YXRpb24gaXMgZG9uZSB0aG91Z2guDQoNCk9rLiBUaGFua3MgZm9yIHRoZSBhZHZpY2UuDQpJ
IHdpbGwgYWRkIG1vcmUgY29tbWVudHMgYm90aCBpbiB0aGUgc291cmNlIGFuZCBjb21taXQgdG8g
Y2xlYXJseSBkZXNjcmliZQ0KdGhlIGRyaXZlciBzdXBwb3J0IGFuZCBsaW1pdGF0aW9uLCBhbmQg
dGhlbiBzZW5kIHRoZSBQQVRDSCB2Mi4NCg0KLS0tLS0tUGxlYXNlIGNvbnNpZGVyIHRoZSBlbnZp
cm9ubWVudCBiZWZvcmUgcHJpbnRpbmcgdGhpcyBlLW1haWwuDQo=
