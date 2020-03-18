Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1426D189445
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 04:08:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75E4D1765;
	Wed, 18 Mar 2020 04:07:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75E4D1765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584500896;
	bh=QtpPNZjIXkfiTGkk4AaCxn0+8NqM9CQJjf9GGjkmcRE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C4+eyUp8pdRBf4jMsDZSN1oKCuvvD8df5Iv+NdwcTzKYl+utMwNc1W9/lIaGpLvq3
	 KWs76RGmP++/ZRd6J+H8Jg/dP/J8Z8uhDg78zotZwO/HkinT+SreO3djgDeSYNp3S5
	 uUeI2AXiy0lbbXiGIarWnVjR+f2NYxYhVw0bQEYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36637F80132;
	Wed, 18 Mar 2020 04:06:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 587D3F80139; Wed, 18 Mar 2020 04:06:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DEAR_SOMETHING, SPF_HELO_NONE, 
 SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97693F800B7
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 04:06:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97693F800B7
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 02I36JoQ032400,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 02I36JoQ032400
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 11:06:19 +0800
Received: from RTEXMB05.realtek.com.tw (172.21.6.98) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 18 Mar 2020 11:06:19 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 18 Mar 2020 11:06:19 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f]) by
 RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f%6]) with mapi id
 15.01.1779.005; Wed, 18 Mar 2020 11:06:19 +0800
From: Albert Chen <albertchen@realtek.com>
To: Keyon Jie <yang.jie@linux.intel.com>,
 =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>
Subject: RE: [PATCH 1/2] ASoC: rt5682: fix the random recording noise of
 headset
Thread-Topic: [PATCH 1/2] ASoC: rt5682: fix the random recording noise of
 headset
Thread-Index: AQHV/C5RNGl1MJ15xEW03F4DUXcyd6hNHECAgACPbxA=
Date: Wed, 18 Mar 2020 03:06:18 +0000
Message-ID: <ca4f69fee72243c9a1b0ac55247cbdb7@realtek.com>
References: <20200317073308.11572-1-shumingf@realtek.com>
 <ac2e133b-b68c-025e-cb42-8e061abf9744@linux.intel.com>
In-Reply-To: <ac2e133b-b68c-025e-cb42-8e061abf9744@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.237.102]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
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

RGVhciBTaXIsDQoNCklubGluZS4NCg0KVGhhbmtzLA0KQWxiZXJ0DQoNCi0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQpGcm9tOiBLZXlvbiBKaWUgPHlhbmcuamllQGxpbnV4LmludGVsLmNvbT4g
DQpTZW50OiBXZWRuZXNkYXksIE1hcmNoIDE4LCAyMDIwIDEwOjMyIEFNDQpUbzogU2h1bWluZyBb
6IyD5pu46YqYXSA8c2h1bWluZ2ZAcmVhbHRlay5jb20+OyBicm9vbmllQGtlcm5lbC5vcmc7IGxn
aXJkd29vZEBnbWFpbC5jb20NCkNjOiBPZGVyIENoaW91IDxvZGVyX2NoaW91QHJlYWx0ZWsuY29t
PjsgSmFjayBZdSA8amFjay55dUByZWFsdGVrLmNvbT47IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZzsgbGFyc0BtZXRhZm9vLmRlOyBBbGJlcnQgQ2hlbiA8YWxiZXJ0Y2hlbkByZWFsdGVrLmNv
bT47IERlcmVrIFvmlrnlvrfnvqldIDxkZXJlay5mYW5nQHJlYWx0ZWsuY29tPjsgc2F0aHlhLnBy
YWthc2gubS5yQGludGVsLmNvbTsgRmxvdmUoSHNpbkZ1KSA8ZmxvdmVAcmVhbHRlay5jb20+DQpT
dWJqZWN0OiBSZTogW1BBVENIIDEvMl0gQVNvQzogcnQ1NjgyOiBmaXggdGhlIHJhbmRvbSByZWNv
cmRpbmcgbm9pc2Ugb2YgaGVhZHNldA0KDQpPbiAzLzE3LzIwIDM6MzMgUE0sIHNodW1pbmdmQHJl
YWx0ZWsuY29tIHdyb3RlOg0KPiBGcm9tOiBTaHVtaW5nIEZhbiA8c2h1bWluZ2ZAcmVhbHRlay5j
b20+DQo+IA0KPiBUaGUgY3ljbGUgdGltZSBvZiBGSUZPIGNsb2NrIHNob3VsZCBpbmNyZWFzZSAy
IHRpbWVzIHRvIGF2b2lkIHRoZSANCj4gcmFuZG9tIHJlY29yZGluZyBub2lzZSBpc3N1ZS4NCj4g
VGhpcyBzZXR0aW5nIGNvdWxkIGFwcGx5IHRvIGFsbCBrbm93biBzaXR1YXRpb25zIGluIGkycyBt
b2RlLg0KDQpUaGFua3MgZm9yIGZpeGluZyB0aGlzIFNodW1pbmcuDQoNCkp1c3QgdHJ5IHRvIHVu
ZGVyc3RhbmQgd2hhdCBoYXMgaGFwcGVuZWQuDQoNCkNhbiB5b3UgaGVscCBzaGFyZSBtb3JlIGRl
dGFpbHMgYWJvdXQgaXQsIGUuZy4NCjEuIHRoZSByZWNvcmRpbmcgbm9pc2UgaGFwcGVuZWQgb24g
aGVhZHNldCBtaWMgb3IgZG1pYz8NCjxBbGJlcnQ+IEhlYWRzZXQgTWljDQoyLiB3aWxsIHRoaXMg
Y2hhbmdlIGltcGFjdCB0aGUgbWljcm9waG9uZSBzYW1wbGluZyBjbG9jaywgb3IgdGhlIEJDTEsg
dGhhdCBvZiB0aGUgSTJTIGJjbGsgcGluPw0KPEFsYmVydD4gTm8uDQozLiB3aXRob3V0IHRoaXMg
Y2hhbmdlLCB3aHkgdGhlIGNsayBpcyB3cm9uZywgc29tZSBleGFtcGxlPw0KPEFsYmVydD4gT25s
eSBhZGp1c3QgRklGTyBidWZmZXIgc2V0dGluZy4gDQoNClRoYW5rcywNCn5LZXlvbg0KDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBTaHVtaW5nIEZhbiA8c2h1bWluZ2ZAcmVhbHRlay5jb20+DQo+IC0t
LQ0KPiAgIHNvdW5kL3NvYy9jb2RlY3MvcnQ1NjgyLmMgfCAyICsrDQo+ICAgc291bmQvc29jL2Nv
ZGVjcy9ydDU2ODIuaCB8IDIgKysNCj4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvcnQ1NjgyLmMgYi9zb3VuZC9z
b2MvY29kZWNzL3J0NTY4Mi5jIA0KPiBpbmRleCA3Y2EwMmE1ZTUyZTkuLjAyM2JjNjcyMjc0YiAx
MDA2NDQNCj4gLS0tIGEvc291bmQvc29jL2NvZGVjcy9ydDU2ODIuYw0KPiArKysgYi9zb3VuZC9z
b2MvY29kZWNzL3J0NTY4Mi5jDQo+IEBAIC0zNjQzLDYgKzM2NDMsOCBAQCBzdGF0aWMgaW50IHJ0
NTY4Ml9pMmNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmkyYywNCj4gICAJCQlSVDU2ODJfQ1Bf
Q0xLX0hQX01BU0ssIFJUNTY4Ml9DUF9DTEtfSFBfMzAwS0haKTsNCj4gICAJcmVnbWFwX3VwZGF0
ZV9iaXRzKHJ0NTY4Mi0+cmVnbWFwLCBSVDU2ODJfSFBfQ0hBUkdFX1BVTVBfMSwNCj4gICAJCQlS
VDU2ODJfUE1fSFBfTUFTSywgUlQ1NjgyX1BNX0hQX0hWKTsNCj4gKwlyZWdtYXBfdXBkYXRlX2Jp
dHMocnQ1NjgyLT5yZWdtYXAsIFJUNTY4Ml9ETUlDX0NUUkxfMSwNCj4gKwkJCVJUNTY4Ml9GSUZP
X0NMS19ESVZfTUFTSywgUlQ1NjgyX0ZJRk9fQ0xLX0RJVl8yKTsNCj4gICANCj4gICAJSU5JVF9E
RUxBWUVEX1dPUksoJnJ0NTY4Mi0+amFja19kZXRlY3Rfd29yaywNCj4gICAJCQkJcnQ1NjgyX2ph
Y2tfZGV0ZWN0X2hhbmRsZXIpOw0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy9ydDU2
ODIuaCBiL3NvdW5kL3NvYy9jb2RlY3MvcnQ1NjgyLmggDQo+IGluZGV4IDQzZGU2ZTgwMjMwOS4u
MGJhZWVjZTg0ZWM0IDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvY29kZWNzL3J0NTY4Mi5oDQo+
ICsrKyBiL3NvdW5kL3NvYy9jb2RlY3MvcnQ1NjgyLmgNCj4gQEAgLTY1Nyw2ICs2NTcsOCBAQA0K
PiAgICNkZWZpbmUgUlQ1NjgyX0RNSUNfMV9FTl9TRlQJCQkxNQ0KPiAgICNkZWZpbmUgUlQ1Njgy
X0RNSUNfMV9ESVMJCQkoMHgwIDw8IDE1KQ0KPiAgICNkZWZpbmUgUlQ1NjgyX0RNSUNfMV9FTgkJ
CSgweDEgPDwgMTUpDQo+ICsjZGVmaW5lIFJUNTY4Ml9GSUZPX0NMS19ESVZfTUFTSwkJKDB4NyA8
PCAxMikNCj4gKyNkZWZpbmUgUlQ1NjgyX0ZJRk9fQ0xLX0RJVl8yCQkJKDB4MSA8PCAxMikNCj4g
ICAjZGVmaW5lIFJUNTY4Ml9ETUlDXzFfRFBfTUFTSwkJCSgweDMgPDwgNCkNCj4gICAjZGVmaW5l
IFJUNTY4Ml9ETUlDXzFfRFBfU0ZUCQkJNA0KPiAgICNkZWZpbmUgUlQ1NjgyX0RNSUNfMV9EUF9H
UElPMgkJCSgweDAgPDwgNCkNCj4gDQoNCi0tLS0tLVBsZWFzZSBjb25zaWRlciB0aGUgZW52aXJv
bm1lbnQgYmVmb3JlIHByaW50aW5nIHRoaXMgZS1tYWlsLg0K
