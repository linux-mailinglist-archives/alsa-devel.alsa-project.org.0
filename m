Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F2C163FAD
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 09:50:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AD9D16F7;
	Wed, 19 Feb 2020 09:49:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AD9D16F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582102234;
	bh=JgbhD2QR15HouIc0xFGwg/335T4aU1C52AzIGBy0YBw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mk+yeEPFNa5GGMUG/NQ35fP4fDj70/XDViqKBAoOBCQotBqwD2GKrCXpz/um6NSRq
	 3Kd+WcAyvxVaUYRbr2cZGN5+YDQW/dkTxeRnlKf+fmPv2eRWrK2DxkJdn9osWVgZX7
	 ySJX5DsBG8/M8jozpe6qoGGCDf6cZXImkynym9S8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6927AF80142;
	Wed, 19 Feb 2020 09:48:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A662F80172; Wed, 19 Feb 2020 09:48:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DA11F800C4
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 09:48:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DA11F800C4
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 01J8maRu004582,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 01J8maRu004582
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2020 16:48:36 +0800
Received: from RTEXMB04.realtek.com.tw (172.21.6.97) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 19 Feb 2020 16:48:36 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 19 Feb 2020 16:48:36 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f]) by
 RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f%6]) with mapi id
 15.01.1779.005; Wed, 19 Feb 2020 16:48:36 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>, =?utf-8?B?QXVyw6lsaWVuIENyb2M=?=
 <aurelien@ap2c.com>
Subject: RE: [alsa-devel] No sound with Realtek ALC298 on a Samsung Galaxy book
Thread-Topic: [alsa-devel] No sound with Realtek ALC298 on a Samsung Galaxy
 book
Thread-Index: AQHV5d5TCeR2iQwby0KYUy8ypm/1pKgiNgCg
Date: Wed, 19 Feb 2020 08:48:36 +0000
Message-ID: <bd2f299ee9784fe2898cc303ff3516d0@realtek.com>
References: <1610933.XPBrhYXKCp@antimony.ap2c.org>
 <2757884.e1HrdM282F@antimony.ap2c.org>	<s5hd0adfapa.wl-tiwai@suse.de>
 <5023991.OkN0jAucn1@antimony.ap2c.org> <s5h1rqsc1kd.wl-tiwai@suse.de>
In-Reply-To: <s5h1rqsc1kd.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.105.169]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGFrYXNoaSBJd2FpIDx0
aXdhaUBzdXNlLmRlPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAxOCwgMjAyMCA2OjA1IEFN
DQo+IFRvOiBBdXLDqWxpZW4gQ3JvYyA8YXVyZWxpZW5AYXAyYy5jb20+DQo+IENjOiBhbHNhLWRl
dmVsQGFsc2EtcHJvamVjdC5vcmc7IEthaWxhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbYWxzYS1kZXZlbF0gTm8gc291bmQgd2l0aCBSZWFsdGVrIEFMQzI5OCBvbiBh
IFNhbXN1bmcgR2FsYXh5DQo+IGJvb2sNCj4gDQo+IE9uIE1vbiwgMTcgRmViIDIwMjAgMjA6MDE6
MDUgKzAxMDAsDQo+IEF1csOpbGllbiBDcm9jIHdyb3RlOg0KPiA+DQo+ID4gPiBTb21ldGltZXMg
eW91IGhhdmUgc29tZSBkYXRhIGluICouSU5GIGZpbGUgb3Igc3VjaC4gIEF0IGxlYXN0LCBpZg0K
PiA+ID4gdGhlIHN0YW5kYXJkIFdpbmRvd3MgZHJpdmVyIChub3QgdGhlIGgvdyB2ZW5kb3IncyBv
bmUpIHdvcmtzLCB0aGUNCj4gPiA+IGV4dHJhIGNvbmZpZ3VyYXRpb24gaXMgdXN1YWxseSBwdXQg
dGhlcmUuDQo+ID4NCj4gPiBUaGUgV2luZG93cyBkcml2ZXIgaXMgdGhlIG9uZSBwcm92aWRlZCBi
eSBSZWFsdGVrLiBUaGUgbWFudWZhY3R1cmVyIElEDQo+ID4gaXMgIklOVEVMQVVESU9cRlVOQ18w
MSZWRU5fMTBFQyZERVZfMDI5OCZTVUJTWVNfMTQ0REMxNEYiLg0KPiA+IEkgbG9va2VkIGludG8g
dGhlIElORiBmaWxlIHdoaWNoIGNvcnJlc3BvbmRzIHRvIHRoaXMgZHJpdmVyIGJ1dCBJJ20NCj4g
PiBub3Qgc3VyZSB0byB1bmRlcnN0YW5kIGl0LiBUaGVyZSBpcyBhIHNwZWNpZmljIHNlY3Rpb24g
YXR0YWNoZWQgdG8NCj4gPiB0aGlzIGRldmljZSB3aGljaCBsb29rcyBsaWtlOg0KPiA+IFtDdXNF
ZmZlY3RTZXR0aW5nc01heGltLkFkZFJlZ10NCj4gPg0KPiBIS1IsU1NUUFBDZmdce0M3NTA2MUYz
LUYyQjItNERDQy04RjlGLTgyQUJCNDEzMUU2Nn1cU1BLXEVGWCwxNjc3NzIxNw0KPiAsDQo+ID4g
MSwNCj4gPiAxLDAsMCwxLDEsMCwwLDANCj4gPg0KPiBIS1IsU1NUUFBDZmdce0M3NTA2MUYzLUYy
QjItNERDQy04RjlGLTgyQUJCNDEzMUU2Nn1cU1BLXEVGWCwxNjc3NzIxOA0KPiAsDQo+ID4gMSwN
Cj4gPiAyLDAsMCwxLDAsMCw4MCwyDQo+ID4gLi4uLg0KPiA+DQo+ID4gSSBkb24ndCBrbm93IGlm
IHRoZSBzb2x1dGlvbiBpcyBpbiB0aGVzZSBsaW5lcyBvciBub3QuLg0KPiA+DQo+ID4NCj4gPiA+
IEFsc28sIHdoZW4geW91IHRlc3QgdGhlIHNvdW5kLCBkb24ndCB1c2UgUHVsc2VBdWRpbyBidXQg
dGVzdA0KPiA+ID4gZGlyZWN0bHkgd2l0aCBBTFNBIG5hdGl2ZSBhcHBzIChlLmcuIGFwbGF5IHdp
dGggLURodzowIG9yIC1EcGx1Z2h3OjAsIGV0YykuDQo+ID4gPiBZb3UgY2FuIHVzZSBzcGVha2Vy
LXRlc3QgcHJvZ3JhbSwgdG9vLg0KPiA+DQo+ID4gSSB0cmllZCBhZ2FpbiBhbGwgdGhlIGNoYW5u
ZWxzIHdpdGggaGVhZHBob25lIG9ubHkgYnkgdXNpbmcgb25seSBBTFNBDQo+ID4gYW5kIG5vdCBw
dWxzZWF1ZGlvLiBUaGVyZSBpcyBubyBzb3VuZCBhdCBhbGwuDQo+ID4gTm90ZSB0aGF0IHRoZSBp
bnRlcm5hbCBtaWNyb3Bob25lIGFuZCB0aGUgbWljcm9waG9uZSBvZiBteSBoZWFkcGhvbmUNCj4g
PiB3aGVuIGl0J3MgcGx1Z2dlZCBpbiB3b3JrcyB2ZXJ5IHdlbGwuLg0KPiANCj4gQWhhLCBzbyB0
aGUgaW5wdXQgd29ya3MgYnV0IG9ubHkgdGhlIG91dHB1dCBkb2Vzbid0Pw0KPiBUaGVuIGl0J3Mg
bm90IGFib3V0IHRoZSBiYXNpYyBzdHVmZiBsaWtlIHBpbiBjb25maWd1cmF0aW9uIGJ1dCByYXRo
ZXIgdGhlIG1pc3NpbmcNCj4gQ09FRiBzZXR1cCBvciBzdWNoIHRoYXQgaXMgc3BlY2lmaWMgdG8g
UmVhbHRlayBjb2RlYyAoYW5kL29yIHRoZSBTYW1zdW5nDQo+IHBsYXRmb3JtKS4NCj4gDQo+IEth
aWxhbmcsIGRvIHlvdSBoYXZlIGFueSBjbHVlPw0KDQpTb3JyeS4NClNhbXN1bmcgZGlkbid0IHJl
cXVlc3QgdGhpcyBwbGF0Zm9ybSBuZWVkIHRvIHN1cHBvcnQgTGludXguDQoNCj4gDQo+IA0KPiB0
aGFua3MsDQo+IA0KPiBUYWthc2hpDQo+IA0KPiANCj4gPg0KPiA+ID4gQW5kIGFsd2F5cyB0cnkg
YSBoZWFkcGhvbmUgb3V0cHV0IGF0IGZpcnN0LiAgVGhlIGhlYWRzZXQgbWljIG1pZ2h0DQo+ID4g
PiBub3Qgd29yaywgYnV0IHRoZSBoZWFkcGhvbmUgb3V0cHV0IGlzIHVzdWFsbHkgdGhlIGVhc2ll
c3Qgb25lIHRvIGdldA0KPiA+ID4gd29ya2luZy4NCj4gPg0KPiA+DQo+ID4gVGhhbmsgeW91IGZv
ciB5b3VyIGhlbHAuIEkgaG9wZSB3ZSdsbCBmaW5kIHRoZSBwcm9ibGVtLi4NCj4gPg0KPiA+DQo+
ID4NCj4gDQo+IC0tLS0tLVBsZWFzZSBjb25zaWRlciB0aGUgZW52aXJvbm1lbnQgYmVmb3JlIHBy
aW50aW5nIHRoaXMgZS1tYWlsLg0K
