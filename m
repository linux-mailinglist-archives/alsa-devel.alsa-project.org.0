Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BE5367E2C
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Apr 2021 11:55:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D9D71678;
	Thu, 22 Apr 2021 11:54:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D9D71678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619085301;
	bh=UmV8uCnLbmuFbl6UFGE1VqdkvCJVzQdGzSicvGyfyqg=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fRgsJYN/C3f5kRGXoqIfnBN/s7mP8HqF1McvsTpfiX+hmxtwp41Gv6yo7UlAwM/If
	 BTlfi7W8sHSMA4yBn+WMRoXXTHp3YWEIZZgbrmbMrOJvyO28xOJuDo1Wf3boUrQcT6
	 kjErL28KZ7LTFVC6oyyRZpvXWR3LYCjfzxcsiVqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0356F80275;
	Thu, 22 Apr 2021 11:53:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C88A3F80273; Thu, 22 Apr 2021 11:53:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72673F800AE
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 11:53:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72673F800AE
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 13M9rBE81003551,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36502.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 13M9rBE81003551
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 22 Apr 2021 17:53:11 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 22 Apr 2021 17:53:11 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 22 Apr 2021 17:53:10 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::e1bc:d5c7:d79c:2ab7]) by
 RTEXMBS01.realtek.com.tw ([fe80::e1bc:d5c7:d79c:2ab7%13]) with mapi id
 15.01.2106.013; Thu, 22 Apr 2021 17:53:10 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: Jaroslav Kysela <perex@perex.cz>, "broonie@kernel.org"
 <broonie@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Subject: RE: [PATCH v3] ASoC: rt711-sdca: change capture switch controls
Thread-Topic: [PATCH v3] ASoC: rt711-sdca: change capture switch controls
Thread-Index: AQHXN1cblL7lUPYB80+co6JSGos5D6q/wg0AgACHHHA=
Date: Thu, 22 Apr 2021 09:53:10 +0000
Message-ID: <7c128678f3944154a134adfabf637a3b@realtek.com>
References: <20210422090825.2912-1-shumingf@realtek.com>
 <90f856b8-2446-679e-3cfa-196787094153@perex.cz>
In-Reply-To: <90f856b8-2446-679e-3cfa-196787094153@perex.cz>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.209]
x-kse-serverinfo: RTEXDAG02.realtek.com.tw, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzQvMjIg5LiK5Y2IIDA2OjAwOjAw?=
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 04/22/2021 09:38:29
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 163279 [Apr 22 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: shumingf@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 442 442 b985cb57763b61d2a20abb585d5d4cc10c315b09
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: realtek.com:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, from}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/22/2021 09:40:00
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 04/22/2021 09:38:29
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 163279 [Apr 22 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: shumingf@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 442 442 b985cb57763b61d2a20abb585d5d4cc10c315b09
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; realtek.com:7.1.1
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, from}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/22/2021 09:40:00
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "libin.yang@intel.com" <libin.yang@intel.com>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
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

SGkgSmFyb3NsYXYsIA0KDQo+ID4gK3N0YXRpYyBpbnQgcnQ3MTFfc2RjYV9zZXRfZnUwZl9jYXB0
dXJlX2N0bChzdHJ1Y3QgcnQ3MTFfc2RjYV9wcml2DQo+ID4gKypydDcxMSkgew0KPiA+ICsJaW50
IGVycjsNCj4gPiArDQo+ID4gKwlpZiAocnQ3MTEtPmZ1MGZfZGFwbV9tdXRlKSB7DQo+ID4gKwkJ
ZXJyID0gcmVnbWFwX3dyaXRlKHJ0NzExLT5yZWdtYXAsDQo+ID4gKwkJCVNEV19TRENBX0NUTChG
VU5DX05VTV9KQUNLX0NPREVDLA0KPiBSVDcxMV9TRENBX0VOVF9VU0VSX0ZVMEYsDQo+ID4gKwkJ
CVJUNzExX1NEQ0FfQ1RMX0ZVX01VVEUsIENIX0wpLCAweDAxKTsNCj4gPiArCQlpZiAoZXJyIDwg
MCkNCj4gPiArCQkJcmV0dXJuIGVycjsNCj4gPiArCQllcnIgPSByZWdtYXBfd3JpdGUocnQ3MTEt
PnJlZ21hcCwNCj4gPiArCQkJU0RXX1NEQ0FfQ1RMKEZVTkNfTlVNX0pBQ0tfQ09ERUMsDQo+IFJU
NzExX1NEQ0FfRU5UX1VTRVJfRlUwRiwNCj4gPiArCQkJUlQ3MTFfU0RDQV9DVExfRlVfTVVURSwg
Q0hfUiksIDB4MDEpOw0KPiA+ICsJCWlmIChlcnIgPCAwKQ0KPiA+ICsJCQlyZXR1cm4gZXJyOw0K
PiANCj4gSXMgcG9zc2libGUgdG8gc2V0IGJvdGggY2hhbm5lbHMgUlQ3MTFfU0RDQV9DVExfRlVf
TVVURSBpbiBvbmUgd3JpdGUgPw0KPiANCj4gU29tZXRoaW5nIGxpa2U6DQo+IA0KPiAgIHJlZ21h
cF93cml0ZShydDcxMS0+cmVnbWFwLA0KPiAJCVNEV19TRENBX0NUTChGVU5DX05VTV9KQUNLX0NP
REVDLA0KPiBSVDcxMV9TRENBX0VOVF9VU0VSX0ZVMEYsDQo+IAkJCVJUNzExX1NEQ0FfQ1RMX0ZV
X01VVEUsIENIX1J8Q0hfTCksIDB4MDEpOw0KDQpObywgdGhlIGxlZnQvcmlnaHQgY2hhbm5lbCBz
ZXR0aW5nIG9mIFNEQ0EgY29udHJvbCBhcmUgdGhlIGRpZmZlcmVudCByZWdpc3RlciBhZGRyZXNz
ZXMuDQoNCj4gQW55d2F5LCB0aGlzIGZ1bmN0aW9uIGNhbiBiZSByZWNvZGVkIGxpa2UgKGZhciBt
b3JlIHJlYWRhYmxlKToNCj4gDQo+ICAgY2hfbCA9IChydDcxMS0+ZnUwZl9kYXBtX211dGUgfHwg
cnQ3MTEtPmZ1MGZfbWl4ZXJfbF9tdXRlKSA/IDB4MDEgOg0KPiAweDAwOw0KPiAgIGNoX3IgPSAo
cnQ3MTEtPmZ1MGZfZGFwbV9tdXRlIHx8IHJ0NzExLT5mdTBmX21peGVyX3JfbXV0ZSkgPyAweDAx
IDoNCj4gMHgwMDoNCj4gICByZWdtYXBfd3JpdGUocnQ3MTEtPnJlZ21hcCwNCj4gCQlTRFdfU0RD
QV9DVEwoRlVOQ19OVU1fSkFDS19DT0RFQywNCj4gUlQ3MTFfU0RDQV9FTlRfVVNFUl9GVTBGLA0K
PiAJCQlSVDcxMV9TRENBX0NUTF9GVV9NVVRFLCBDSF9MKSwgY2hfbCk7DQo+ICAgcmVnbWFwX3dy
aXRlKHJ0NzExLT5yZWdtYXAsDQo+IAkJU0RXX1NEQ0FfQ1RMKEZVTkNfTlVNX0pBQ0tfQ09ERUMs
DQo+IFJUNzExX1NEQ0FfRU5UX1VTRVJfRlUwRiwNCj4gCQkJUlQ3MTFfU0RDQV9DVExfRlVfTVVU
RSwgQ0hfUiksIGNoX3IpOw0KPiANCj4gLi4uIGp1c3QgYWRkIGVycm9yIGNoZWNraW5nIC4uLg0K
DQpPSywgd2lsbCBmaXguIFRoYW5rcy4NCg0KPiBPciBpZGVhbGx5LCBpZiBib3RoIG11dGUgYml0
cyBjYW4gYmUgc2V0IHRvZ2V0aGVyIChvbmUgcmVnbWFwX3dyaXRlKToNCj4gDQo+ICAgY2hfbCA9
IChydDcxMS0+ZnUwZl9kYXBtX211dGUgfHwgcnQ3MTEtPmZ1MGZfbWl4ZXJfbF9tdXRlKSA/IDB4
MDEgOg0KPiAweDAwOw0KPiAgIGNoX3IgPSAocnQ3MTEtPmZ1MGZfZGFwbV9tdXRlIHx8IHJ0NzEx
LT5mdTBmX21peGVyX3JfbXV0ZSkgPyAweDAxIDoNCj4gMHgwMDoNCj4gICByZWdtYXBfd3JpdGUo
cnQ3MTEtPnJlZ21hcCwNCj4gCQlTRFdfU0RDQV9DVEwoRlVOQ19OVU1fSkFDS19DT0RFQywNCj4g
UlQ3MTFfU0RDQV9FTlRfVVNFUl9GVTBGLA0KPiAJCSAgUlQ3MTFfU0RDQV9DVExfRlVfTVVURSwg
Q0hfTHxDSF9SKSwgY2hfbCB8IChjaF9yIDw8IDEpKTsNCj4gDQo+ID4gKw0KPiA+ICtzdGF0aWMg
aW50IHJ0NzExX3NkY2Ffc2V0X2Z1MWVfY2FwdHVyZV9jdGwoc3RydWN0IHJ0NzExX3NkY2FfcHJp
dg0KPiA+ICsqcnQ3MTEpDQo+IA0KPiBTYW1lIGNvbW1lbnRzIGFzIGZvciBydDcxMV9zZGNhX3Nl
dF9mdTBmX2NhcHR1cmVfY3RsKCkuDQo+IA0KPiAJCQkJCQlKYXJvc2xhdg0KPiANCj4gLS0NCj4g
SmFyb3NsYXYgS3lzZWxhIDxwZXJleEBwZXJleC5jej4NCj4gTGludXggU291bmQgTWFpbnRhaW5l
cjsgQUxTQSBQcm9qZWN0OyBSZWQgSGF0LCBJbmMuDQo+IC0tLS0tLVBsZWFzZSBjb25zaWRlciB0
aGUgZW52aXJvbm1lbnQgYmVmb3JlIHByaW50aW5nIHRoaXMgZS1tYWlsLg0K
