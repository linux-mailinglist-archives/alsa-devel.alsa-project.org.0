Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0973307FD
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 07:12:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFDE718E6;
	Mon,  8 Mar 2021 07:11:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFDE718E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615183940;
	bh=TeSoO7q5oZIJfYr6h4Jcu9/BitjzXCDk3n8ZuXeiii8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oZn3qnaDIgftqhxRymXHoZpzjbKO1ryuPLp3YqzZeyYyHHTgzkslYoPNukCNUxirw
	 5gGf2S5LcriJEbsIAfnoU2IfsDZx3FjcDrSbbVWdMJk8zwO/SXhNJ94Tq+6xpO9V4P
	 cutJnXJJxJMgVqr3fQw7C1CL4g3udBpJfrpY8V6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 571E8F8016C;
	Mon,  8 Mar 2021 07:10:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEF2EF801D8; Mon,  8 Mar 2021 07:10:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7609F80139
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 07:10:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7609F80139
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1286ATtxC023779,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs02.realtek.com.tw[172.21.6.95])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 1286ATtxC023779
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 8 Mar 2021 14:10:29 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 8 Mar 2021 14:10:29 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 8 Mar 2021 14:10:29 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::11a3:66f1:391c:a66]) by
 RTEXMBS01.realtek.com.tw ([fe80::11a3:66f1:391c:a66%7]) with mapi id
 15.01.2106.006; Mon, 8 Mar 2021 14:10:29 +0800
From: Jack Yu <jack.yu@realtek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>
Subject: RE: [PATCH] ASoC: rt1015p: add acpi device id for rt1015p
Thread-Topic: [PATCH] ASoC: rt1015p: add acpi device id for rt1015p
Thread-Index: AQHXC+PZieNKkxQzvkm2O9jKbm5rKqpqdDYAgA824kA=
Date: Mon, 8 Mar 2021 06:10:28 +0000
Message-ID: <2e2eaa61cdcd44529f379085c615a4c9@realtek.com>
References: <20210226020517.17124-1-jack.yu@realtek.com>
 <b4af8c40-d1c6-35f2-0f70-3032fd04697f@linux.intel.com>
In-Reply-To: <b4af8c40-d1c6-35f2-0f70-3032fd04697f@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.167]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?utf-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=
 <kent_chen@realtek.com>, =?utf-8?B?6Zmz5pi25b+X?= <kenny_chen@realtek.com>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaWVycmUtTG91aXMgQm9zc2Fy
dCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBTYXR1cmRh
eSwgRmVicnVhcnkgMjcsIDIwMjEgNTo0OCBBTQ0KPiBUbzogSmFjayBZdSA8amFjay55dUByZWFs
dGVrLmNvbT47IGJyb29uaWVAa2VybmVsLm9yZzsNCj4gbGdpcmR3b29kQGdtYWlsLmNvbQ0KPiBD
YzogT2RlciBDaGlvdSA8b2Rlcl9jaGlvdUByZWFsdGVrLmNvbT47IGFsc2EtZGV2ZWxAYWxzYS1w
cm9qZWN0Lm9yZzsNCj4gbGFyc0BtZXRhZm9vLmRlOyBrZW50X2NoZW5AcmVhbHRlay5jb20gW+mZ
s+W7uuWuj10NCj4gPGtlbnRfY2hlbkByZWFsdGVrLmNvbT47IOmZs+aYtuW/lyA8a2VubnlfY2hl
bkByZWFsdGVrLmNvbT47IERlcmVrIFvmlrnlvrcNCj4g576pXSA8ZGVyZWsuZmFuZ0ByZWFsdGVr
LmNvbT47IFNodW1pbmcgW+iMg+abuOmKmF0gPHNodW1pbmdmQHJlYWx0ZWsuY29tPjsNCj4gRmxv
dmUoSHNpbkZ1KSA8ZmxvdmVAcmVhbHRlay5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIEFT
b0M6IHJ0MTAxNXA6IGFkZCBhY3BpIGRldmljZSBpZCBmb3IgcnQxMDE1cA0KPiANCj4gT24gMi8y
NS8yMSA4OjA1IFBNLCBqYWNrLnl1QHJlYWx0ZWsuY29tIHdyb3RlOg0KPiA+IEZyb206IEphY2sg
WXUgPGphY2sueXVAcmVhbHRlay5jb20+DQo+ID4NCj4gPiBBZGQgYWNwaSBkZXZpY2UgaWQgZm9y
IHJ0MTAxNXAuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWNrIFl1IDxqYWNrLnl1QHJlYWx0
ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAgc291bmQvc29jL2NvZGVjcy9ydDEwMTVwLmMgfCAxMCAr
KysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvcnQxMDE1cC5jIGIvc291bmQvc29jL2Nv
ZGVjcy9ydDEwMTVwLmMNCj4gPiBpbmRleCA2NzFmMmEyMTMwZmUuLjYxNjk0ZGUwODBlNiAxMDA2
NDQNCj4gPiAtLS0gYS9zb3VuZC9zb2MvY29kZWNzL3J0MTAxNXAuYw0KPiA+ICsrKyBiL3NvdW5k
L3NvYy9jb2RlY3MvcnQxMDE1cC5jDQo+ID4gQEAgLTQsNiArNCw3IEBADQo+ID4gICAvLw0KPiA+
ICAgLy8gQ29weXJpZ2h0IDIwMjAgVGhlIExpbnV4IEZvdW5kYXRpb24uIEFsbCByaWdodHMgcmVz
ZXJ2ZWQuDQo+ID4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4NCj4gPiAgICNpbmNsdWRl
IDxsaW51eC9kZWxheS5oPg0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPg0KPiA+ICAg
I2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KPiA+IEBAIC0xMzAsMTAgKzEzMSwxOSBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZA0KPiBydDEwMTVwX2RldmljZV9pZFtdID0gew0KPiA+
ICAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgcnQxMDE1cF9kZXZpY2VfaWQpOw0KPiA+ICAgI2Vu
ZGlmDQo+ID4NCj4gPiArI2lmZGVmIENPTkZJR19BQ1BJDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgYWNwaV9kZXZpY2VfaWQgcnQxMDE1cF9hY3BpX21hdGNoW10gPSB7DQo+ID4gKwl7ICJBTENQ
MTAxNSIsIDB9LA0KPiANCj4gVGhpcyBpc24ndCBtdWNoIGJldHRlciwgQUxDIGlzIG5vdCBhIHZl
bmRvciBJRCBhcyBkZWZpbmVkIGJ5DQo+IGh0dHBzOi8vdWVmaS5vcmcvUE5QX0FDUElfUmVnaXN0
cnkNCj4gDQo+IEkndmUgYXNrIGZvciBndWlkYW5jZSBmcm9tIEludGVsIEFDUEkgZm9sa3Mgb24g
dGhpcywgcGxlYXNlIHN0YXkgdHVuZWQuDQo+IA0KDQpIaSBQaWVycmUsDQoNCklzIHRoZXJlIGFu
eSB1cGRhdGUgZnJvbSBJbnRlbCBBQ1BJIHRlYW0gcmVnYXJkaW5nIHRvIHRoaXMgSUQgZm9ybWF0
IGlzc3VlPw0KDQoNCkJSLA0KSmFjaw0KDQo+ID4gKwl7IH0sDQo+ID4gK307DQo+ID4gK01PRFVM
RV9ERVZJQ0VfVEFCTEUoYWNwaSwgcnQxMDE1cF9hY3BpX21hdGNoKTsgI2VuZGlmDQo+ID4gKw0K
PiA+ICAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgcnQxMDE1cF9wbGF0Zm9ybV9kcml2
ZXIgPSB7DQo+ID4gICAJLmRyaXZlciA9IHsNCj4gPiAgIAkJLm5hbWUgPSAicnQxMDE1cCIsDQo+
ID4gICAJCS5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihydDEwMTVwX2RldmljZV9pZCks
DQo+ID4gKwkJLmFjcGlfbWF0Y2hfdGFibGUgPSBBQ1BJX1BUUihydDEwMTVwX2FjcGlfbWF0Y2gp
LA0KPiA+ICAgCX0sDQo+ID4gICAJLnByb2JlID0gcnQxMDE1cF9wbGF0Zm9ybV9wcm9iZSwNCj4g
PiAgIH07DQo+ID4NCj4gDQo+IC0tLS0tLVBsZWFzZSBjb25zaWRlciB0aGUgZW52aXJvbm1lbnQg
YmVmb3JlIHByaW50aW5nIHRoaXMgZS1tYWlsLg0K
