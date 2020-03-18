Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F5E189591
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 07:09:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76B821766;
	Wed, 18 Mar 2020 07:08:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76B821766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584511765;
	bh=SknmBrlbcfaf7zEpHysf7DlnoRWYeDeen7iFgkOt8qw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cDSkwytn6+14xSRcYejzscSG8gIXs3Cu4LoaWfD1DA86WD5q1a6zlMPHRv8MaQDSQ
	 MjAEz2+B7IHa5LG9S1LD754famW0dvR3E1tUj/dv3IN4AMK78Dk6gtA+LpZicsGcbB
	 jnrtd8S8Xv8ec5p7KA16k4jq3LdSYM2NHF/Vg50g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58B40F8015B;
	Wed, 18 Mar 2020 07:07:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAB7DF80139; Wed, 18 Mar 2020 07:07:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DEAR_SOMETHING, SPF_HELO_NONE, 
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41310F80058
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 07:07:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41310F80058
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID 02I67N89010466,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTEXMB06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id 02I67N89010466
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 14:07:23 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 18 Mar 2020 14:07:23 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 18 Mar 2020 14:07:22 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f]) by
 RTEXMB01.realtek.com.tw ([fe80::1832:8abc:ec2d:974f%6]) with mapi id
 15.01.1779.005; Wed, 18 Mar 2020 14:07:22 +0800
From: Albert Chen <albertchen@realtek.com>
To: Keyon Jie <yang.jie@linux.intel.com>,
 =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>
Subject: RE: [PATCH 1/2] ASoC: rt5682: fix the random recording noise of
 headset
Thread-Topic: [PATCH 1/2] ASoC: rt5682: fix the random recording noise of
 headset
Thread-Index: AQHV/C5RNGl1MJ15xEW03F4DUXcyd6hNHECAgACPbxD//4EoAIAAsNJQ
Date: Wed, 18 Mar 2020 06:07:22 +0000
Message-ID: <8ffd32c6b52b4684bdcdd45f095f38b2@realtek.com>
References: <20200317073308.11572-1-shumingf@realtek.com>
 <ac2e133b-b68c-025e-cb42-8e061abf9744@linux.intel.com>
 <ca4f69fee72243c9a1b0ac55247cbdb7@realtek.com>
 <2dc0887c-b86f-0f76-2107-bd7978e7a204@linux.intel.com>
In-Reply-To: <2dc0887c-b86f-0f76-2107-bd7978e7a204@linux.intel.com>
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBLZXlvbiBKaWUgPHlhbmcuamll
QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIE1hcmNoIDE4LCAyMDIwIDExOjMx
IEFNDQpUbzogQWxiZXJ0IENoZW4gPGFsYmVydGNoZW5AcmVhbHRlay5jb20+OyBTaHVtaW5nIFvo
jIPmm7jpiphdIDxzaHVtaW5nZkByZWFsdGVrLmNvbT47IGJyb29uaWVAa2VybmVsLm9yZzsgbGdp
cmR3b29kQGdtYWlsLmNvbQ0KQ2M6IE9kZXIgQ2hpb3UgPG9kZXJfY2hpb3VAcmVhbHRlay5jb20+
OyBKYWNrIFl1IDxqYWNrLnl1QHJlYWx0ZWsuY29tPjsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnOyBsYXJzQG1ldGFmb28uZGU7IERlcmVrIFvmlrnlvrfnvqldIDxkZXJlay5mYW5nQHJlYWx0
ZWsuY29tPjsgc2F0aHlhLnByYWthc2gubS5yQGludGVsLmNvbTsgRmxvdmUoSHNpbkZ1KSA8Zmxv
dmVAcmVhbHRlay5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gQVNvQzogcnQ1NjgyOiBm
aXggdGhlIHJhbmRvbSByZWNvcmRpbmcgbm9pc2Ugb2YgaGVhZHNldA0KDQoNCk9uIDMvMTgvMjAg
MTE6MDYgQU0sIEFsYmVydCBDaGVuIHdyb3RlOg0KPiBEZWFyIFNpciwNCj4gDQo+IElubGluZS4N
Cj4gDQo+IFRoYW5rcywNCj4gQWxiZXJ0DQo+IA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOiBLZXlvbiBKaWUgPHlhbmcuamllQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDog
V2VkbmVzZGF5LCBNYXJjaCAxOCwgMjAyMCAxMDozMiBBTQ0KPiBUbzogU2h1bWluZyBb6IyD5pu4
6YqYXSA8c2h1bWluZ2ZAcmVhbHRlay5jb20+OyBicm9vbmllQGtlcm5lbC5vcmc7IA0KPiBsZ2ly
ZHdvb2RAZ21haWwuY29tDQo+IENjOiBPZGVyIENoaW91IDxvZGVyX2NoaW91QHJlYWx0ZWsuY29t
PjsgSmFjayBZdSANCj4gPGphY2sueXVAcmVhbHRlay5jb20+OyBhbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmc7IGxhcnNAbWV0YWZvby5kZTsgDQo+IEFsYmVydCBDaGVuIDxhbGJlcnRjaGVuQHJl
YWx0ZWsuY29tPjsgRGVyZWsgW+aWueW+t+e+qV0gDQo+IDxkZXJlay5mYW5nQHJlYWx0ZWsuY29t
Pjsgc2F0aHlhLnByYWthc2gubS5yQGludGVsLmNvbTsgRmxvdmUoSHNpbkZ1KSANCj4gPGZsb3Zl
QHJlYWx0ZWsuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gQVNvQzogcnQ1NjgyOiBm
aXggdGhlIHJhbmRvbSByZWNvcmRpbmcgbm9pc2UgDQo+IG9mIGhlYWRzZXQNCj4gDQo+IE9uIDMv
MTcvMjAgMzozMyBQTSwgc2h1bWluZ2ZAcmVhbHRlay5jb20gd3JvdGU6DQo+PiBGcm9tOiBTaHVt
aW5nIEZhbiA8c2h1bWluZ2ZAcmVhbHRlay5jb20+DQo+Pg0KPj4gVGhlIGN5Y2xlIHRpbWUgb2Yg
RklGTyBjbG9jayBzaG91bGQgaW5jcmVhc2UgMiB0aW1lcyB0byBhdm9pZCB0aGUgDQo+PiByYW5k
b20gcmVjb3JkaW5nIG5vaXNlIGlzc3VlLg0KPj4gVGhpcyBzZXR0aW5nIGNvdWxkIGFwcGx5IHRv
IGFsbCBrbm93biBzaXR1YXRpb25zIGluIGkycyBtb2RlLg0KPiANCj4gVGhhbmtzIGZvciBmaXhp
bmcgdGhpcyBTaHVtaW5nLg0KPiANCj4gSnVzdCB0cnkgdG8gdW5kZXJzdGFuZCB3aGF0IGhhcyBo
YXBwZW5lZC4NCj4gDQo+IENhbiB5b3UgaGVscCBzaGFyZSBtb3JlIGRldGFpbHMgYWJvdXQgaXQs
IGUuZy4NCj4gMS4gdGhlIHJlY29yZGluZyBub2lzZSBoYXBwZW5lZCBvbiBoZWFkc2V0IG1pYyBv
ciBkbWljPw0KPiA8QWxiZXJ0PiBIZWFkc2V0IE1pYw0KPiAyLiB3aWxsIHRoaXMgY2hhbmdlIGlt
cGFjdCB0aGUgbWljcm9waG9uZSBzYW1wbGluZyBjbG9jaywgb3IgdGhlIEJDTEsgdGhhdCBvZiB0
aGUgSTJTIGJjbGsgcGluPw0KPiA8QWxiZXJ0PiBOby4NCj4gMy4gd2l0aG91dCB0aGlzIGNoYW5n
ZSwgd2h5IHRoZSBjbGsgaXMgd3JvbmcsIHNvbWUgZXhhbXBsZT8NCj4gPEFsYmVydD4gT25seSBh
ZGp1c3QgRklGTyBidWZmZXIgc2V0dGluZy4NCg0KV2hlcmUgaXMgdGhlIEZJRk8gYnVmZmVyIHlv
dSBtZW50aW9uZWQgbG9jYXRlZD8gSXMgaXQgaW5jbHVkZWQgaW4gdGhlIHBhdGggImhlYWRzZXQg
bWljIEFEQy0tKGxvb3BiYWNrKS0tPkFEQyBoZWFkcGhvbmUiPw0KPEFsYmVydD4gSTJTIGludGVy
ZmFjZS4NCg0KVGhlIGlzc3VlIHdhcyByZXBvcnRlZCB0byBJbnRlbCBhbHNvLCB0aGF0J3Mgd2h5
IEkgYW0gcXVlcnlpbmcgdGhpcyBoZXJlLg0KDQpGcm9tIHByZXZpb3VzIGZlZWRiYWNrLCBTaHVt
aW5nIHNoYXJlZCB0aGF0IHRoZSBsb29wYmFjayBwYXRoIG1lbnRpb25lZCBhYm92ZSBkb24ndCBo
YXZlIHRoaXMgcmFuZG9tIG5vaXNlIGlzc3VlLg0KDQo8QWxiZXJ0PlRoZXNlIGFyZSBoYXZlIHRv
dGFsIHR3byByZWNvcmRpbmcgcmFuZG9tIG5vaXNlIGlzc3Vlcywgb25lIGlzIHRoZSBQQ0IgdHJh
Y2UgZGVzaWduIGFuZCBhbm90aGVyIGlzIENvZGVjIHNldHRpbmcsIE91ciBwcmV2aW91cyByZXBv
cnRlZCBpcyBQQ0IgdHJhY2UgY2F1c2Ugbm9pc2UuIA0KDQpUaGFua3MsDQp+S2V5b24NCg0KPiAN
Cj4gVGhhbmtzLA0KPiB+S2V5b24NCj4gDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogU2h1bWluZyBG
YW4gPHNodW1pbmdmQHJlYWx0ZWsuY29tPg0KPj4gLS0tDQo+PiAgICBzb3VuZC9zb2MvY29kZWNz
L3J0NTY4Mi5jIHwgMiArKw0KPj4gICAgc291bmQvc29jL2NvZGVjcy9ydDU2ODIuaCB8IDIgKysN
Cj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL3NvdW5kL3NvYy9jb2RlY3MvcnQ1NjgyLmMgYi9zb3VuZC9zb2MvY29kZWNzL3J0NTY4Mi5j
IA0KPj4gaW5kZXggN2NhMDJhNWU1MmU5Li4wMjNiYzY3MjI3NGIgMTAwNjQ0DQo+PiAtLS0gYS9z
b3VuZC9zb2MvY29kZWNzL3J0NTY4Mi5jDQo+PiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3J0NTY4
Mi5jDQo+PiBAQCAtMzY0Myw2ICszNjQzLDggQEAgc3RhdGljIGludCBydDU2ODJfaTJjX3Byb2Jl
KHN0cnVjdCBpMmNfY2xpZW50ICppMmMsDQo+PiAgICAJCQlSVDU2ODJfQ1BfQ0xLX0hQX01BU0ss
IFJUNTY4Ml9DUF9DTEtfSFBfMzAwS0haKTsNCj4+ICAgIAlyZWdtYXBfdXBkYXRlX2JpdHMocnQ1
NjgyLT5yZWdtYXAsIFJUNTY4Ml9IUF9DSEFSR0VfUFVNUF8xLA0KPj4gICAgCQkJUlQ1NjgyX1BN
X0hQX01BU0ssIFJUNTY4Ml9QTV9IUF9IVik7DQo+PiArCXJlZ21hcF91cGRhdGVfYml0cyhydDU2
ODItPnJlZ21hcCwgUlQ1NjgyX0RNSUNfQ1RSTF8xLA0KPj4gKwkJCVJUNTY4Ml9GSUZPX0NMS19E
SVZfTUFTSywgUlQ1NjgyX0ZJRk9fQ0xLX0RJVl8yKTsNCj4+ICAgIA0KPj4gICAgCUlOSVRfREVM
QVlFRF9XT1JLKCZydDU2ODItPmphY2tfZGV0ZWN0X3dvcmssDQo+PiAgICAJCQkJcnQ1NjgyX2ph
Y2tfZGV0ZWN0X2hhbmRsZXIpOw0KPj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvcnQ1
NjgyLmggYi9zb3VuZC9zb2MvY29kZWNzL3J0NTY4Mi5oIA0KPj4gaW5kZXggNDNkZTZlODAyMzA5
Li4wYmFlZWNlODRlYzQgMTAwNjQ0DQo+PiAtLS0gYS9zb3VuZC9zb2MvY29kZWNzL3J0NTY4Mi5o
DQo+PiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3J0NTY4Mi5oDQo+PiBAQCAtNjU3LDYgKzY1Nyw4
IEBADQo+PiAgICAjZGVmaW5lIFJUNTY4Ml9ETUlDXzFfRU5fU0ZUCQkJMTUNCj4+ICAgICNkZWZp
bmUgUlQ1NjgyX0RNSUNfMV9ESVMJCQkoMHgwIDw8IDE1KQ0KPj4gICAgI2RlZmluZSBSVDU2ODJf
RE1JQ18xX0VOCQkJKDB4MSA8PCAxNSkNCj4+ICsjZGVmaW5lIFJUNTY4Ml9GSUZPX0NMS19ESVZf
TUFTSwkJKDB4NyA8PCAxMikNCj4+ICsjZGVmaW5lIFJUNTY4Ml9GSUZPX0NMS19ESVZfMgkJCSgw
eDEgPDwgMTIpDQo+PiAgICAjZGVmaW5lIFJUNTY4Ml9ETUlDXzFfRFBfTUFTSwkJCSgweDMgPDwg
NCkNCj4+ICAgICNkZWZpbmUgUlQ1NjgyX0RNSUNfMV9EUF9TRlQJCQk0DQo+PiAgICAjZGVmaW5l
IFJUNTY4Ml9ETUlDXzFfRFBfR1BJTzIJCQkoMHgwIDw8IDQpDQo+Pg0KPiANCj4gLS0tLS0tUGxl
YXNlIGNvbnNpZGVyIHRoZSBlbnZpcm9ubWVudCBiZWZvcmUgcHJpbnRpbmcgdGhpcyBlLW1haWwu
DQo+IA0K
