Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A46D33668F3
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Apr 2021 12:13:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CB1C166B;
	Wed, 21 Apr 2021 12:12:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CB1C166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619000009;
	bh=6D6KkHPZ037rHNevHGh5YDD2NoVKf3aHzjJ+SUCOSxI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lNKFQqx4gRwmOT7R1mwpFqP8/+l/pMHHJlSen7Z2ocySJ9fHXkujZvCagSR/CJ1eK
	 YM5SDrVUX8j+z0RMhML/ZKJnsKPvi20D8tRB0X/APIOIb7jgTmRqJHTKiKGLv6MfDh
	 Xxq7+zjZynYtTbEpH5C9zfTx540G1LnCOTTRwAl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0052F8019B;
	Wed, 21 Apr 2021 12:12:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0351F80227; Wed, 21 Apr 2021 12:11:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D221F800E8
 for <alsa-devel@alsa-project.org>; Wed, 21 Apr 2021 12:11:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D221F800E8
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 13LABQON0026343,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36502.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 13LABQON0026343
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 21 Apr 2021 18:11:26 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 21 Apr 2021 18:11:25 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 21 Apr 2021 18:11:24 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::e1bc:d5c7:d79c:2ab7]) by
 RTEXMBS01.realtek.com.tw ([fe80::e1bc:d5c7:d79c:2ab7%13]) with mapi id
 15.01.2106.013; Wed, 21 Apr 2021 18:11:24 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: Jaroslav Kysela <perex@perex.cz>, "broonie@kernel.org"
 <broonie@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Subject: RE: [PATCH v2] ASoC: rt711-sdca: change capture switch controls
Thread-Topic: [PATCH v2] ASoC: rt711-sdca: change capture switch controls
Thread-Index: AQHXNo6zKE51AG0AXE6hua/Q7C5It6q+LuWAgACLF6A=
Date: Wed, 21 Apr 2021 10:11:24 +0000
Message-ID: <c83d1ca9375846b495c02c2e43ecabd5@realtek.com>
References: <20210421091410.2300-1-shumingf@realtek.com>
 <6fdd78c7-8fda-0793-f5a5-eabdaf9c8469@perex.cz>
In-Reply-To: <6fdd78c7-8fda-0793-f5a5-eabdaf9c8469@perex.cz>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.209]
x-kse-serverinfo: RTEXDAG02.realtek.com.tw, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzQvMjEg5LiK5Y2IIDA3OjM4OjAw?=
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 04/21/2021 09:45:22
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 163260 [Apr 21 2021]
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
X-KSE-Antiphishing-Bases: 04/21/2021 09:47:00
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzQvMjEg5LiK5Y2IIDA4OjU0OjAw?=
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 04/21/2021 09:49:24
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 163260 [Apr 21 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: shumingf@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 442 442 b985cb57763b61d2a20abb585d5d4cc10c315b09
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: realtek.com:7.1.1; 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, from}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/21/2021 09:52:00
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

PiA+DQo+ID4gK3N0YXRpYyB2b2lkIHJ0NzExX3NkY2Ffc2V0X2Z1MGZfY2FwdHVyZV9jdGwoc3Ry
dWN0IHJ0NzExX3NkY2FfcHJpdg0KPiA+ICsqcnQ3MTEpIHsNCj4gPiArCWlmIChydDcxMS0+ZnUw
Zl9kYXBtX211dGUgfHwgcnQ3MTEtPmZ1MGZfbWl4ZXJfbXV0ZSkgew0KPiA+ICsJCXJlZ21hcF93
cml0ZShydDcxMS0+cmVnbWFwLA0KPiA+ICsJCQlTRFdfU0RDQV9DVEwoRlVOQ19OVU1fSkFDS19D
T0RFQywNCj4gUlQ3MTFfU0RDQV9FTlRfVVNFUl9GVTBGLA0KPiA+ICsJCQkJUlQ3MTFfU0RDQV9D
VExfRlVfTVVURSwgQ0hfTCksIDB4MDEpOw0KPiA+ICsJCXJlZ21hcF93cml0ZShydDcxMS0+cmVn
bWFwLA0KPiA+ICsJCQlTRFdfU0RDQV9DVEwoRlVOQ19OVU1fSkFDS19DT0RFQywNCj4gUlQ3MTFf
U0RDQV9FTlRfVVNFUl9GVTBGLA0KPiA+ICsJCQkJUlQ3MTFfU0RDQV9DVExfRlVfTVVURSwgQ0hf
UiksIDB4MDEpOw0KPiA+ICsJfSBlbHNlIHsNCj4gPiArCQlyZWdtYXBfd3JpdGUocnQ3MTEtPnJl
Z21hcCwNCj4gPiArCQkJU0RXX1NEQ0FfQ1RMKEZVTkNfTlVNX0pBQ0tfQ09ERUMsDQo+IFJUNzEx
X1NEQ0FfRU5UX1VTRVJfRlUwRiwNCj4gPiArCQkJCVJUNzExX1NEQ0FfQ1RMX0ZVX01VVEUsIENI
X0wpLCAweDAwKTsNCj4gPiArCQlyZWdtYXBfd3JpdGUocnQ3MTEtPnJlZ21hcCwNCj4gPiArCQkJ
U0RXX1NEQ0FfQ1RMKEZVTkNfTlVNX0pBQ0tfQ09ERUMsDQo+IFJUNzExX1NEQ0FfRU5UX1VTRVJf
RlUwRiwNCj4gPiArCQkJCVJUNzExX1NEQ0FfQ1RMX0ZVX01VVEUsIENIX1IpLCAweDAwKTsNCj4g
PiArCX0NCj4gPiArfQ0KPiA+ICsNCj4gDQo+IFBsZWFzZSwga2VlcCB0aGUgaWRlcGVuZGVudCBt
dXRlIGZ1bmN0aW9uYWxpdHkgZm9yIGxlZnQgYW5kIHJpZ2h0IGNoYW5uZWwuIFVzZQ0KPiBiaXRt
YXAgaW5zdGVhZCBib29sIGZvciBrY29udHJvbCBwdXQvZ2V0IC4gSSBhcHBvbG9naXplLCBpZiBt
eSBleGFtcGxlIGNvZGUNCj4gY29uZnVzZWQgeW91LiBJIGp1c3Qgd2FudGVkIHRvIGRlc2NyaWJl
IHRoZSBsb2dpYy4NCj4gDQo+IEFsc28sIHBlcmhhcHMsIHlvdSBtYXkgY2hhbmdlIHRoZSByZWdp
c3RlciB3aXRoIG9uZSByZWdtYXBfd3JpdGUoKSA/DQoNCkkgc2VlLiBJIHRoaW5rIHRoZSBrY29u
dHJvbCBjb3VsZCB1c2UgJ1NPQ19ET1VCTEVfRVhUJyBtYWNybyB0byBjcmVhdGUgaXQuDQpUaGUg
cHV0IGNhbGxiYWNrIGZ1bmN0aW9uIGNoZWNrcyB0aGUgYml0bWFwIHRvIG11dGUvdW5tdXRlIHRo
ZSBsZWZ0L3JpZ2h0IGNoYW5uZWwuDQoNCj4gPiArc3RhdGljIHZvaWQgcnQ3MTFfc2RjYV9zZXRf
ZnUxZV9jYXB0dXJlX2N0bChzdHJ1Y3QgcnQ3MTFfc2RjYV9wcml2DQo+ID4gKypydDcxMSkgew0K
PiA+ICsJaWYgKHJ0NzExLT5mdTFlX2RhcG1fbXV0ZSB8fCBydDcxMS0+ZnUxZV9taXhlcl9tdXRl
KSB7DQo+ID4gKwkJcmVnbWFwX3dyaXRlKHJ0NzExLT5yZWdtYXAsDQo+ID4gKwkJCVNEV19TRENB
X0NUTChGVU5DX05VTV9KQUNLX0NPREVDLA0KPiBSVDcxMV9TRENBX0VOVF9VU0VSX0ZVMUUsDQo+
ID4gKwkJCQlSVDcxMV9TRENBX0NUTF9GVV9NVVRFLCBDSF9MKSwgMHgwMSk7DQo+ID4gKwkJcmVn
bWFwX3dyaXRlKHJ0NzExLT5yZWdtYXAsDQo+ID4gKwkJCVNEV19TRENBX0NUTChGVU5DX05VTV9K
QUNLX0NPREVDLA0KPiBSVDcxMV9TRENBX0VOVF9VU0VSX0ZVMUUsDQo+ID4gKwkJCQlSVDcxMV9T
RENBX0NUTF9GVV9NVVRFLCBDSF9SKSwgMHgwMSk7DQo+ID4gKwl9IGVsc2Ugew0KPiA+ICsJCXJl
Z21hcF93cml0ZShydDcxMS0+cmVnbWFwLA0KPiA+ICsJCQlTRFdfU0RDQV9DVEwoRlVOQ19OVU1f
SkFDS19DT0RFQywNCj4gUlQ3MTFfU0RDQV9FTlRfVVNFUl9GVTFFLA0KPiA+ICsJCQkJUlQ3MTFf
U0RDQV9DVExfRlVfTVVURSwgQ0hfTCksIDB4MDApOw0KPiA+ICsJCXJlZ21hcF93cml0ZShydDcx
MS0+cmVnbWFwLA0KPiA+ICsJCQlTRFdfU0RDQV9DVEwoRlVOQ19OVU1fSkFDS19DT0RFQywNCj4g
UlQ3MTFfU0RDQV9FTlRfVVNFUl9GVTFFLA0KPiA+ICsJCQkJUlQ3MTFfU0RDQV9DVExfRlVfTVVU
RSwgQ0hfUiksIDB4MDApOw0KPiA+ICsJfQ0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50
IHJ0NzExX3NkY2FfY2FwdHVyZV9zd2l0Y2hfZ2V0KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250
cm9sLA0KPiA+ICsJCQlzdHJ1Y3Qgc25kX2N0bF9lbGVtX3ZhbHVlICp1Y29udHJvbCkgew0KPiA+
ICsJc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQgPSBzbmRfa2NvbnRyb2xfY2hp
cChrY29udHJvbCk7DQo+ID4gKwlzdHJ1Y3QgcnQ3MTFfc2RjYV9wcml2ICpydDcxMSA9DQo+ID4g
K3NuZF9zb2NfY29tcG9uZW50X2dldF9kcnZkYXRhKGNvbXBvbmVudCk7DQo+ID4gKw0KPiA+ICsJ
aWYgKHN0cnN0cih1Y29udHJvbC0+aWQubmFtZSwgIkZVMUUgQ2FwdHVyZSBTd2l0Y2giKSkNCj4g
PiArCQl1Y29udHJvbC0+dmFsdWUuaW50ZWdlci52YWx1ZVswXSA9ICFydDcxMS0+ZnUxZV9taXhl
cl9tdXRlOw0KPiA+ICsJZWxzZSBpZiAoc3Ryc3RyKHVjb250cm9sLT5pZC5uYW1lLCAiRlUwRiBD
YXB0dXJlIFN3aXRjaCIpKQ0KPiA+ICsJCXVjb250cm9sLT52YWx1ZS5pbnRlZ2VyLnZhbHVlWzBd
ID0gIXJ0NzExLT5mdTBmX21peGVyX211dGU7DQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiAN
Cj4gSXQncyBub3Qgc28gbmljZSAoc3Ryc3RyKS4gUGxlYXNlLCB1c2UgZGlmZXJlbnQgZnVuY3Rp
b25zIHRvIHNldC9nZXQgRlUxRSBhbmQgRlUwRg0KPiBjb250cm9scy4NCg0KT0ssIEkgd2lsbCBj
cmVhdGUgdGhlIGRpZmZlcmVudCBmdW5jdGlvbnMgZm9yIEZVMUUgYW5kIEZVMEYuDQoNCj4gPiAr
DQo+ID4gK3N0YXRpYyBpbnQgcnQ3MTFfc2RjYV9jYXB0dXJlX3N3aXRjaF9wdXQoc3RydWN0IHNu
ZF9rY29udHJvbCAqa2NvbnRyb2wsDQo+ID4gKwkJCXN0cnVjdCBzbmRfY3RsX2VsZW1fdmFsdWUg
KnVjb250cm9sKSB7DQo+ID4gKwlzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCA9
IHNuZF9rY29udHJvbF9jaGlwKGtjb250cm9sKTsNCj4gPiArCXN0cnVjdCBydDcxMV9zZGNhX3By
aXYgKnJ0NzExID0NCj4gPiArc25kX3NvY19jb21wb25lbnRfZ2V0X2RydmRhdGEoY29tcG9uZW50
KTsNCj4gPiArDQo+ID4gKwlpZiAoc3Ryc3RyKHVjb250cm9sLT5pZC5uYW1lLCAiRlUxRSBDYXB0
dXJlIFN3aXRjaCIpKSB7DQo+ID4gKwkJcnQ3MTEtPmZ1MWVfbWl4ZXJfbXV0ZSA9ICF1Y29udHJv
bC0+dmFsdWUuaW50ZWdlci52YWx1ZVswXTsNCj4gPiArCQlydDcxMV9zZGNhX3NldF9mdTFlX2Nh
cHR1cmVfY3RsKHJ0NzExKTsNCj4gPiArCX0gZWxzZSBpZiAoc3Ryc3RyKHVjb250cm9sLT5pZC5u
YW1lLCAiRlUwRiBDYXB0dXJlIFN3aXRjaCIpKSB7DQo+ID4gKwkJcnQ3MTEtPmZ1MGZfbWl4ZXJf
bXV0ZSA9ICF1Y29udHJvbC0+dmFsdWUuaW50ZWdlci52YWx1ZVswXTsNCj4gPiArCQlydDcxMV9z
ZGNhX3NldF9mdTBmX2NhcHR1cmVfY3RsKHJ0NzExKTsNCj4gPiArCX0NCj4gPiArCXJldHVybiAw
Ow0KPiA+ICt9DQo+IA0KPiBUaGUgcmV0dXJuIHZhbHVlIGZvciB0aGUga2NvbnRyb2wgcHV0IGNh
bGxiYWNrIHNob3VsZCBiZToNCj4gDQo+IGEpIGEgbmVnYXRpdmUgZXJyb3IgY29kZQ0KPiBiKSAw
IC0gbm8gY2hhbmdlDQo+IGMpIDEgLSB0aGUgdmFsdWUgd2FzIGNoYW5nZWQNCj4gDQo+IElmIHlv
dSBkb24ndCByZXR1cm4gMSBvbiBjaGFuZ2UsIHRoZSBvdGhlciB1c2VyIHNwYWNlIGFwcGxpY2F0
aW9ucyB3aGljaCBhcmUNCj4gbW9uaXRvcmluZyB0aGUgZ2l2ZW4ga2NvbnRyb2wgd29uJ3QgYmUg
bm90aWZpZWQgYWJvdXQgY2hhbmdlcy4NCj4gDQo+IFBlcmhhcHMsIG90aGVyIHB1dCBjYWxsYmFj
a3MgKGZ1bmN0aW9ucykgaW4gdGhpcyBkcml2ZXIgcmVxdWlyZSB0aGlzIGNsZWFudXAsIHRvby4N
Cg0KT2ssIEkgd2lsbCBhZGQgdGhlIHJldHVybiB2YWx1ZSBhbmQgdGVzdCB0aGF0LiBUaGFua3Mu
DQoNCj4gCQkJCUphcm9zbGF2DQo+IA0KPiAtLQ0KPiBKYXJvc2xhdiBLeXNlbGEgPHBlcmV4QHBl
cmV4LmN6Pg0KPiBMaW51eCBTb3VuZCBNYWludGFpbmVyOyBBTFNBIFByb2plY3Q7IFJlZCBIYXQs
IEluYy4NCj4gLS0tLS0tUGxlYXNlIGNvbnNpZGVyIHRoZSBlbnZpcm9ubWVudCBiZWZvcmUgcHJp
bnRpbmcgdGhpcyBlLW1haWwuDQo=
