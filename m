Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E52C64644F9
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 03:37:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8801322DF;
	Wed,  1 Dec 2021 03:37:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8801322DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638326279;
	bh=eKpADFNI9r0wosrDhGeGe21CBCvWOY24FRk45QpAwAw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fT3PhnW4MUZTlYLUgCtcvOFh4I8vK2hwGAWbbTQB9gfowg4+CTpqvwa+dPcoF01LK
	 /vzjhlqPDlcfRbNBBiMChzmSqKKdE2xCPmf4ikuSNvymo2jeLt8+ep/N0QeyB5lRV4
	 2uMYxvYvP1k1FwJk/BDjKMSaBK6SFpIKWrfO6YIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A8F7F802E0;
	Wed,  1 Dec 2021 03:36:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59722F802A0; Wed,  1 Dec 2021 03:36:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97A25F8028D
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 03:36:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97A25F8028D
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1B12aImvD010321,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1B12aImvD010321
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 1 Dec 2021 10:36:19 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 1 Dec 2021 10:36:18 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 1 Dec 2021 10:36:18 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::107e:9fac:eaf0:4da2]) by
 RTEXMBS01.realtek.com.tw ([fe80::107e:9fac:eaf0:4da2%5]) with mapi id
 15.01.2308.015; Wed, 1 Dec 2021 10:36:18 +0800
From: Jack Yu <jack.yu@realtek.com>
To: =?utf-8?B?UMOpdGVyIFVqZmFsdXNp?= <peter.ujfalusi@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>
Subject: RE: [PATCH] ASoC: rt1011: revert 'I2S Reference' to SOC_ENUM_EXT
Thread-Topic: [PATCH] ASoC: rt1011: revert 'I2S Reference' to SOC_ENUM_EXT
Thread-Index: AQHX1tzpRRhfu9oUlky/cwl9pXXLAKwbhdYAgAF+YpA=
Date: Wed, 1 Dec 2021 02:36:18 +0000
Message-ID: <58fb5f01ad11482f8777e7d4d1ced173@realtek.com>
References: <20211111091705.20879-1-jack.yu@realtek.com>
 <2c3eb3db-d32c-edbf-75b3-29ab478cea13@linux.intel.com>
In-Reply-To: <2c3eb3db-d32c-edbf-75b3-29ab478cea13@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.167]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzExLzMwIOS4i+WNiCAxMToxNjowMA==?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?utf-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=
 <kent_chen@realtek.com>,
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

SGkgUGV0ZXIsDQoNCj4gT24gMTEvMTEvMjAyMSAxMToxNywgSmFjayBZdSB3cm90ZToNCj4gPiBS
ZXZlcnQgJ0kyUyBSZWZlcmVuY2UnIHRvIFNPQ19FTlVNX0VYVCBiZWNhdXNlIHRoZSBzZXR0aW5n
cyBhcmUNCj4gPiBzcGVjaWZpYyBmb3Igc29tZSBwbGF0Zm9ybXMsIHRoZSBkZWZhdWx0IHNldHRp
bmcgZm9yICdJMlMgUmVmZXJlbmNlJw0KPiA+IGRvZXMgbm90aGluZywgb25seSBzb21lIFNvQyBw
bGF0Zm9ybSBuZWVkIHRvIGNvbmZpZ3VyZSBpdC4NCj4gPiBQcmV2aW91cyAnSTJTIFJlZmVyZW5j
ZScgaW4gU09DX0VOVU0gZm9ybWF0IG9ubHkgdG9nZ2xlcyBvbmUgYml0IG9mDQo+ID4gUlQxMDEx
X1RETTFfU0VUXzEgcmVnaXN0ZXIsIHdoaWNoIGlzbid0IGVub3VnaCBmb3Igc3BlY2lmaWMgcGxh
dGZvcm0uDQo+IA0KPiBUaGlzIHBhdGNoIGFnYWluIGJyZWFrcyBhdWRpbyBidXQgaW4gYSBsZXNz
IG9idmlvdXMgd2F5Lg0KPiBJZiBhIHVzZXIgX2V2ZXJfIHRvdWNoZXMgdGhlICJJMlMgUmVmZXJl
bmNlIiB0aGVuIGF1ZGlvIHBsYXliYWNrIHdpbGwgbmV2ZXINCj4gZ29pbmcgdG8gd29yayBhZ2Fp
biBhcyBpbnN0ZWFkIG9mIGNoYW5naW5nIHRoZSBpMnMgcmVmZXJlbmNlIHRoZSBjb2RlIGNsZWFy
cyBhbGwNCj4gc2V0dGluZ3MgZG9uZSBieSBzZXRfdGRtX3Nsb3QsIGRhaV9mbXQgdG8gc29tZXRo
aW5nIHdoaWNoIGlzIHNvbWUgcHJvZHVjdA0KPiBzcGVjaWZpYyBzZXR0aW5nLg0KPiBPbmUgd291
bGQgdGhpbmsgdGhhdCBhIHJlYm9vdCBoZWxwcywgYnV0IG9uIGJvb3Qgd2UgdGVuZCB0byByZXN0
b3JlIHRoZSBzYXZlZA0KPiBhbWl4ZXIgc2V0dGluZ3MgLT4gYXVkaW8gcGxheWJhY2sgaXMgYnJv
a2VuLg0KPiBTbywgYmVmb3JlIHJlYm9vdCBvbmUgaGFzIHRvIHNldCB0aGUgcmVmZXJlbmNlIHRv
IE5vbmUgYW5kIHJlYm9vdCBhbmQgaG9wZQ0KPiB0aGF0IG9uIGJvb3QgdGhlIE5PUCAoTm9uZSkg
aXMgZ29pbmcgdG8gYmUgc2V0IHdoaWNoIG1lYW5zIHRoYXQgdGhlIGN1c3RvbQ0KPiBlbnVtIGNv
ZGUgd291bGQgbm90IG92ZXJ3cml0ZSB0aGUgY29uZmlndXJhdGlvbiBvZiB0aGUgY29kZWMuDQo+
IA0KPiBUaGVyZSBpcyBhIHNpbmdsZSBiaXQgaW4gUlQxMDExX1RETTFfU0VUXzEgKGJpdCA3KSB3
aGljaCBzZWxlY3RzIHRoZSBJMlMNCj4gcmVmZXJlbmNlIGFuZCB0aGUgcmVzZXQgdmFsdWUgaXMg
TGVmdCAoMCkuDQo+IA0KPiBXaXRoIHRoaXMgY3VzdG9tIGVudW0gcHV0IGNvZGUgeW91IGVmZmVj
dGl2ZWx5IHJlY29uZmlndXJlIHRoZSBjb2RlIHRvIGJlDQo+IHVudXNhYmxlIG9uIG1vc3QgbGlr
ZWx5IGluIGFsbCBzeXN0ZW1zIGV4Y2VwdCB0aGUgb25lIHdoaWNoIG5lZWRzIHRoZXNlDQo+IHNl
dHRpbmdzLi4uDQo+IA0KVGhpcyBwYXRjaCBpcyBzcGVjaWZpYyBmb3IgZGV2aWNlIHdoaWNoIHVz
ZXMgSTJTIGZvcm1hdCBhbmQgbmVlZCB0aGUgcmVmZXJlbmNlIGRhdGEsIA0KaWYgdGhlIGRldmlj
ZSB1c2VzIFRETSBmb3JtYXQsIGl0IGRvZXNuJ3QgbmVlZCB0byBjYWxsICJJMlMgUmVmZXJlbmNl
ICIuDQoNCklmIGRldmljZSBydW5zIFRETSBtb2RlLCBtYWNoaW5lIGRyaXZlciBzZXRzIFRETSBz
bG90IGFuZCBEQUkgZm9ybWF0LCBidXQgbm8gbmVlZCB0byBjYWxsICIgSTJTIHJlZmVyZW5jZSAi
Lg0KSWYgZGV2aWNlIHJ1bnMgSTJTIG1vZGUsIG1hY2hpbmUgZHJpdmVyIHNldHMgSTJTIERBSSBm
b3JtYXQsIGFuZCB1Y20gc2V0cyAiSTJTIHJlZmVyZW5jZSIgKGl0J3Mgb3B0aW9uYWwsIG9ubHkg
aWYgZGV2aWNlIG5lZWRzIHJlZmVyZW5jZSBzaWduYWwgKQ0KDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBKYWNrIFl1IDxqYWNrLnl1QHJlYWx0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICBzb3VuZC9z
b2MvY29kZWNzL3J0MTAxMS5jIHwgNTUNCj4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0NCj4gPiAgc291bmQvc29jL2NvZGVjcy9ydDEwMTEuaCB8ICA3ICsrKysrDQo+
ID4gIDIgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4g
Pg0KPiA+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL3J0MTAxMS5jIGIvc291bmQvc29j
L2NvZGVjcy9ydDEwMTEuYw0KPiA+IGluZGV4IDI5N2FmN2ZmODI0Yy4uYjYyMzAxYTYyODFmIDEw
MDY0NA0KPiA+IC0tLSBhL3NvdW5kL3NvYy9jb2RlY3MvcnQxMDExLmMNCj4gPiArKysgYi9zb3Vu
ZC9zb2MvY29kZWNzL3J0MTAxMS5jDQo+ID4gQEAgLTEzMTEsMTMgKzEzMTEsNTQgQEAgc3RhdGlj
IGludCBydDEwMTFfcjBfbG9hZF9pbmZvKHN0cnVjdA0KPiBzbmRfa2NvbnRyb2wgKmtjb250cm9s
LA0KPiA+ICAJLnB1dCA9IHJ0MTAxMV9yMF9sb2FkX21vZGVfcHV0IFwNCj4gPiAgfQ0KPiA+DQo+
ID4gLXN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgcnQxMDExX2kyc19yZWZfdGV4dHNbXSA9IHsN
Cj4gPiAtCSJMZWZ0IENoYW5uZWwiLCAiUmlnaHQgQ2hhbm5lbCINCj4gPiArc3RhdGljIGNvbnN0
IGNoYXIgKiBjb25zdCBydDEwMTFfaTJzX3JlZltdID0gew0KPiA+ICsJIk5vbmUiLCAiTGVmdCBD
aGFubmVsIiwgIlJpZ2h0IENoYW5uZWwiDQo+ID4gIH07DQo+ID4NCj4gPiAtc3RhdGljIFNPQ19F
TlVNX1NJTkdMRV9ERUNMKHJ0MTAxMV9pMnNfcmVmX2VudW0sDQo+ID4gLQkJCSAgICBSVDEwMTFf
VERNMV9TRVRfMSwgNywNCj4gPiAtCQkJICAgIHJ0MTAxMV9pMnNfcmVmX3RleHRzKTsNCj4gPiAr
c3RhdGljIFNPQ19FTlVNX1NJTkdMRV9ERUNMKHJ0MTAxMV9pMnNfcmVmX2VudW0sIDAsIDAsDQo+
ID4gKwlydDEwMTFfaTJzX3JlZik7DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IHJ0MTAxMV9pMnNf
cmVmX3B1dChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwNCj4gPiArCQlzdHJ1Y3Qgc25k
X2N0bF9lbGVtX3ZhbHVlICp1Y29udHJvbCkgew0KPiA+ICsJc3RydWN0IHNuZF9zb2NfY29tcG9u
ZW50ICpjb21wb25lbnQgPQ0KPiA+ICsJCXNuZF9zb2Nfa2NvbnRyb2xfY29tcG9uZW50KGtjb250
cm9sKTsNCj4gPiArCXN0cnVjdCBydDEwMTFfcHJpdiAqcnQxMDExID0NCj4gPiArCQlzbmRfc29j
X2NvbXBvbmVudF9nZXRfZHJ2ZGF0YShjb21wb25lbnQpOw0KPiA+ICsNCj4gPiArCXJ0MTAxMS0+
aTJzX3JlZiA9IHVjb250cm9sLT52YWx1ZS5lbnVtZXJhdGVkLml0ZW1bMF07DQo+ID4gKwlzd2l0
Y2ggKHJ0MTAxMS0+aTJzX3JlZikgew0KPiA+ICsJY2FzZSBSVDEwMTFfSTJTX1JFRl9MRUZUX0NI
Og0KPiA+ICsJCXJlZ21hcF93cml0ZShydDEwMTEtPnJlZ21hcCwgUlQxMDExX1RETV9UT1RBTF9T
RVQsIDB4MDI0MCk7DQo+ID4gKwkJcmVnbWFwX3dyaXRlKHJ0MTAxMS0+cmVnbWFwLCBSVDEwMTFf
VERNMV9TRVRfMiwgMHg4KTsNCj4gPiArCQlyZWdtYXBfd3JpdGUocnQxMDExLT5yZWdtYXAsIFJU
MTAxMV9URE0xX1NFVF8xLCAweDEwMjIpOw0KPiA+ICsJCXJlZ21hcF93cml0ZShydDEwMTEtPnJl
Z21hcCwgUlQxMDExX0FEQ0RBVF9PVVRfU09VUkNFLA0KPiAweDQpOw0KPiA+ICsJCWJyZWFrOw0K
PiA+ICsJY2FzZSBSVDEwMTFfSTJTX1JFRl9SSUdIVF9DSDoNCj4gPiArCQlyZWdtYXBfd3JpdGUo
cnQxMDExLT5yZWdtYXAsIFJUMTAxMV9URE1fVE9UQUxfU0VULCAweDAyNDApOw0KPiA+ICsJCXJl
Z21hcF93cml0ZShydDEwMTEtPnJlZ21hcCwgUlQxMDExX1RETTFfU0VUXzIsIDB4OCk7DQo+ID4g
KwkJcmVnbWFwX3dyaXRlKHJ0MTAxMS0+cmVnbWFwLCBSVDEwMTFfVERNMV9TRVRfMSwgMHgxMGEy
KTsNCj4gPiArCQlyZWdtYXBfd3JpdGUocnQxMDExLT5yZWdtYXAsIFJUMTAxMV9BRENEQVRfT1VU
X1NPVVJDRSwNCj4gMHg0KTsNCj4gPiArCQlicmVhazsNCj4gPiArCWRlZmF1bHQ6DQo+ID4gKwkJ
ZGV2X2luZm8oY29tcG9uZW50LT5kZXYsICJJMlMgUmVmZXJlbmNlOiBEbyBub3RoaW5nXG4iKTsN
Cj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3Rh
dGljIGludCBydDEwMTFfaTJzX3JlZl9nZXQoc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2ws
DQo+ID4gKwkJc3RydWN0IHNuZF9jdGxfZWxlbV92YWx1ZSAqdWNvbnRyb2wpIHsNCj4gPiArCXN0
cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50ID0NCj4gPiArCQlzbmRfc29jX2tjb250
cm9sX2NvbXBvbmVudChrY29udHJvbCk7DQo+ID4gKwlzdHJ1Y3QgcnQxMDExX3ByaXYgKnJ0MTAx
MSA9DQo+ID4gKwkJc25kX3NvY19jb21wb25lbnRfZ2V0X2RydmRhdGEoY29tcG9uZW50KTsNCj4g
PiArDQo+ID4gKwl1Y29udHJvbC0+dmFsdWUuZW51bWVyYXRlZC5pdGVtWzBdID0gcnQxMDExLT5p
MnNfcmVmOw0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4NCj4gPiAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBzbmRfa2NvbnRyb2xfbmV3IHJ0MTAxMV9zbmRfY29udHJvbHNbXSA9IHsN
Cj4gPiAgCS8qIEkyUyBEYXRhIEluIFNlbGVjdGlvbiAqLw0KPiA+IEBAIC0xMzU4LDcgKzEzOTks
OCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9rY29udHJvbF9uZXcNCj4gcnQxMDExX3NuZF9j
b250cm9sc1tdID0gew0KPiA+ICAJU09DX1NJTkdMRSgiUjAgVGVtcGVyYXR1cmUiLCBSVDEwMTFf
U1RQX0lOSVRJQUxfUkVTSVNUQU5DRV9URU1QLA0KPiA+ICAJCTIsIDI1NSwgMCksDQo+ID4gIAkv
KiBJMlMgUmVmZXJlbmNlICovDQo+ID4gLQlTT0NfRU5VTSgiSTJTIFJlZmVyZW5jZSIsIHJ0MTAx
MV9pMnNfcmVmX2VudW0pLA0KPiA+ICsJU09DX0VOVU1fRVhUKCJJMlMgUmVmZXJlbmNlIiwgcnQx
MDExX2kyc19yZWZfZW51bSwNCj4gPiArCQlydDEwMTFfaTJzX3JlZl9nZXQsIHJ0MTAxMV9pMnNf
cmVmX3B1dCksDQo+ID4gIH07DQo+ID4NCj4gPiAgc3RhdGljIGludCBydDEwMTFfaXNfc3lzX2Ns
a19mcm9tX3BsbChzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldA0KPiA+ICpzb3VyY2UsIEBAIC0y
MDE3LDYgKzIwNTksNyBAQCBzdGF0aWMgaW50IHJ0MTAxMV9wcm9iZShzdHJ1Y3QNCj4gPiBzbmRf
c29jX2NvbXBvbmVudCAqY29tcG9uZW50KQ0KPiA+DQo+ID4gIAlzY2hlZHVsZV93b3JrKCZydDEw
MTEtPmNhbGlfd29yayk7DQo+ID4NCj4gPiArCXJ0MTAxMS0+aTJzX3JlZiA9IDA7DQo+ID4gIAly
dDEwMTEtPmJxX2RyY19wYXJhbXMgPSBkZXZtX2tjYWxsb2MoY29tcG9uZW50LT5kZXYsDQo+ID4g
IAkJUlQxMDExX0FEVk1PREVfTlVNLCBzaXplb2Yoc3RydWN0IHJ0MTAxMV9icV9kcmNfcGFyYW1z
ICopLA0KPiA+ICAJCUdGUF9LRVJORUwpOw0KPiA+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29k
ZWNzL3J0MTAxMS5oIGIvc291bmQvc29jL2NvZGVjcy9ydDEwMTEuaA0KPiA+IGluZGV4IDY4ZmFk
YzE1ZmE4Yy4uNGQ2ZTc0OTJkOTljIDEwMDY0NA0KPiA+IC0tLSBhL3NvdW5kL3NvYy9jb2RlY3Mv
cnQxMDExLmgNCj4gPiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3J0MTAxMS5oDQo+ID4gQEAgLTY1
NCw2ICs2NTQsMTIgQEAgZW51bSB7DQo+ID4gIAlSVDEwMTFfQUlGUw0KPiA+ICB9Ow0KPiA+DQo+
ID4gK2VudW0gew0KPiA+ICsJUlQxMDExX0kyU19SRUZfTk9ORSwNCj4gPiArCVJUMTAxMV9JMlNf
UkVGX0xFRlRfQ0gsDQo+ID4gKwlSVDEwMTFfSTJTX1JFRl9SSUdIVF9DSCwNCj4gPiArfTsNCj4g
PiArDQo+ID4gIC8qIEJpUXVhbCAmIERSQyByZWxhdGVkIHNldHRpbmdzICovDQo+ID4gICNkZWZp
bmUgUlQxMDExX0JRX0RSQ19OVU0gMTI4DQo+ID4gIHN0cnVjdCBydDEwMTFfYnFfZHJjX3BhcmFt
cyB7DQo+ID4gQEAgLTY5Miw2ICs2OTgsNyBAQCBzdHJ1Y3QgcnQxMDExX3ByaXYgew0KPiA+ICAJ
dW5zaWduZWQgaW50IHIwX3JlZywgY2FsaV9kb25lOw0KPiA+ICAJdW5zaWduZWQgaW50IHIwX2Nh
bGliLCB0ZW1wZXJhdHVyZV9jYWxpYjsNCj4gPiAgCWludCByZWN2X3Nwa19tb2RlOw0KPiA+ICsJ
aW50IGkyc19yZWY7DQo+ID4gIH07DQo+ID4NCj4gPiAgI2VuZGlmCQkvKiBlbmQgb2YgX1JUMTAx
MV9IXyAqLw0KPiA+DQo+IA0KPiAtLQ0KPiBQw6l0ZXINCj4gLS0tLS0tUGxlYXNlIGNvbnNpZGVy
IHRoZSBlbnZpcm9ubWVudCBiZWZvcmUgcHJpbnRpbmcgdGhpcyBlLW1haWwuDQo=
