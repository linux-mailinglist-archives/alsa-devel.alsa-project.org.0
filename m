Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9FB478327
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 03:26:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C2BC1B21;
	Fri, 17 Dec 2021 03:25:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C2BC1B21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639707999;
	bh=Z93qbrF2fvCf7Zu8yjQn5DlCMdibadJyB2nxoMZrtvo=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NEEfwlSHxXJnlfHArdf5IuO30mUb87l3FX1/BwcJrRX9T9OCTqWzc5lnD5x5ZI7uP
	 K/LOtzSk/PeDA5Ki7SnK4Rv+p7xDw+PO723SIFquQdVh+FIUL83Jp+H2VvI1QsgRyH
	 uiV9bhVjrcH1pfJ6tl801IUdeWIODjdI4aSPnHT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAA8AF800F4;
	Fri, 17 Dec 2021 03:25:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1944F8014C; Fri, 17 Dec 2021 03:25:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E762F800F4
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 03:25:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E762F800F4
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1BH2P8DH0015207,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1BH2P8DH0015207
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 17 Dec 2021 10:25:08 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 10:25:08 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 17 Dec 2021 10:25:07 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::1939:37f0:5383:397d]) by
 RTEXMBS01.realtek.com.tw ([fe80::1939:37f0:5383:397d%5]) with mapi id
 15.01.2308.015; Fri, 17 Dec 2021 10:25:07 +0800
From: =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH v2 1/1] ASoC: rt5682s: Add dapm switch to mute/unmute HP
 playback output
Thread-Topic: [PATCH v2 1/1] ASoC: rt5682s: Add dapm switch to mute/unmute HP
 playback output
Thread-Index: AQHX7GWRI6k5NgtuD0uEox0/duGRXKwo6UkAgAucCICAAXxS8A==
Date: Fri, 17 Dec 2021 02:25:07 +0000
Message-ID: <372f49bfa3cf45838ffa994a14e844c0@realtek.com>
References: <20211208185517.1555884-1-AjitKumar.Pandey@amd.com>
 <20211208185517.1555884-2-AjitKumar.Pandey@amd.com>
 <126eab881bb540bc84ecc5cb9c6865a8@realtek.com>
 <a08db422-7f51-4156-5e9e-62b7938dad29@amd.com>
In-Reply-To: <a08db422-7f51-4156-5e9e-62b7938dad29@amd.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.142]
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzEyLzE2IOS4i+WNiCAxMToyODowMA==?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "Sunil-kumar.Dommati@amd.com" <Sunil-kumar.Dommati@amd.com>,
 "Basavaraj.Hiregoudar@amd.com" <Basavaraj.Hiregoudar@amd.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Albert Chen <albertchen@realtek.com>,
 "Vijendar.Mukunda@amd.com" <Vijendar.Mukunda@amd.com>,
 "Alexander.Deucher@amd.com" <Alexander.Deucher@amd.com>,
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvMV0gQVNvQzogcnQ1NjgyczogQWRkIGRhcG0gc3dp
dGNoIHRvIG11dGUvdW5tdXRlDQo+IEhQIHBsYXliYWNrIG91dHB1dA0KPiANCj4gT24gMTIvOS8y
MDIxIDc6NTUgQU0sIFNodW1pbmcgW+iMg+abuOmKmF0gd3JvdGU6DQo+ID4gW0NBVVRJT046IEV4
dGVybmFsIEVtYWlsXQ0KPiA+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCB2MiAxLzFdIEFTb0M6IHJ0
NTY4MnM6IEFkZCBkYXBtIHN3aXRjaCB0byBtdXRlL3VubXV0ZSBIUA0KPiA+PiBwbGF5YmFjayBv
dXRwdXQNCj4gPj4NCj4gPj4gQWRkIGRhcG0gc3dpdGNoIGluIHBsYXliYWNrIHBhdGggdG8gbXV0
ZSBvciB1bm11dGUgSFAgb3V0cHV0IGRhdGEuDQo+ID4+IFdlIHdpbGwgc2V0IGFuZCByZXNldCBN
VVRFX1NGVCBiaXQgaW4gUlQ1NjgyU19IUF9DVFJMXzEgcmVnaXN0ZXIgYmFzZWQgb24NCj4gPj4g
c3dpdGNoIHZhbHVlIHRvIG11dGUgb3IgdW5tdXRlIHJlc3BlY3RpdmUgY2hhbm5lbC4NCj4gPj4N
Cj4gPj4gU2lnbmVkLW9mZi1ieTogQWppdCBLdW1hciBQYW5kZXkgPEFqaXRLdW1hci5QYW5kZXlA
YW1kLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAgc291bmQvc29jL2NvZGVjcy9ydDU2ODJzLmMgfCAx
OSArKysrKysrKysrKysrKysrKy0tDQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mv
Y29kZWNzL3J0NTY4MnMuYyBiL3NvdW5kL3NvYy9jb2RlY3MvcnQ1Njgycy5jIGluZGV4DQo+ID4+
IGQ0OWE0ZjY4NTY2ZC4uMjFhYjVmN2RmNDIyIDEwMDY0NA0KPiA+PiAtLS0gYS9zb3VuZC9zb2Mv
Y29kZWNzL3J0NTY4MnMuYw0KPiA+PiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3J0NTY4MnMuYw0K
PiA+PiBAQCAtMTU3Myw2ICsxNTczLDE0IEBAIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QNCj4g
Pj4gcnQ1Njgyc19hZGNkYXRfcGluX3NlbGVjdFtdID0gew0KPiA+PiAgICAgICAgIkFEQ0RBVDEi
LCAiQURDREFUMiIsDQo+ID4+ICAgfTsNCj4gPj4NCj4gPj4gKy8qIE91dCBTd2l0Y2ggKi8NCj4g
Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX2tjb250cm9sX25ldyBocG9sX3N3aXRjaCA9DQo+
ID4+ICsgICAgIFNPQ19EQVBNX1NJTkdMRV9BVVRPRElTQUJMRSgiU3dpdGNoIiwgUlQ1NjgyU19I
UF9DVFJMXzEsDQo+ID4+ICsgICAgICAgICAgICAgUlQ1NjgyU19MX01VVEVfU0ZULCAxLCAxKTsN
Cj4gPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX2tjb250cm9sX25ldyBocG9yX3N3aXRjaCA9
DQo+ID4+ICsgICAgIFNPQ19EQVBNX1NJTkdMRV9BVVRPRElTQUJMRSgiU3dpdGNoIiwgUlQ1Njgy
U19IUF9DVFJMXzEsDQo+ID4+ICsgICAgICAgICAgICAgUlQ1NjgyU19SX01VVEVfU0ZULCAxLCAx
KTsNCj4gPj4gKw0KPiA+PiAgIHN0YXRpYyBTT0NfVkFMVUVfRU5VTV9TSU5HTEVfREVDTChydDU2
ODJzX2FkY2RhdF9waW5fZW51bSwNCj4gPj4gICAgICAgIFJUNTY4MlNfR1BJT19DVFJMXzEsIFJU
NTY4MlNfR1A0X1BJTl9TRlQsDQo+ID4+IFJUNTY4MlNfR1A0X1BJTl9NQVNLLA0KPiA+PiAgICAg
ICAgcnQ1Njgyc19hZGNkYXRfcGluX3NlbGVjdCwgcnQ1Njgyc19hZGNkYXRfcGluX3ZhbHVlcyk7
IEBADQo+IC0xNzQ2LDYNCj4gPj4gKzE3NTQsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRf
c29jX2RhcG1fd2lkZ2V0DQo+ID4+IHJ0NTY4MnNfZGFwbV93aWRnZXRzW10gPSB7DQo+ID4+ICAg
ICAgICBTTkRfU09DX0RBUE1fUEdBX1MoIkhQIEFtcCIsIDEsIFNORF9TT0NfTk9QTSwgMCwgMCwN
Cj4gPj4gcnQ1Njgyc19ocF9hbXBfZXZlbnQsDQo+ID4+ICAgICAgICAgICAgICAgIFNORF9TT0Nf
REFQTV9QT1NUX1BNRCB8DQo+IFNORF9TT0NfREFQTV9QT1NUX1BNVSksDQo+ID4+DQo+ID4+ICsg
ICAgIFNORF9TT0NfREFQTV9TV0lUQ0goIkhQT0wgUGxheWJhY2siLCBTTkRfU09DX05PUE0sIDAs
IDAsDQo+ID4+ICsgICAgICAgICAgICAgJmhwb2xfc3dpdGNoKSwNCj4gPj4gKyAgICAgU05EX1NP
Q19EQVBNX1NXSVRDSCgiSFBPUiBQbGF5YmFjayIsIFNORF9TT0NfTk9QTSwgMCwgMCwNCj4gPj4g
KyAgICAgICAgICAgICAmaHBvcl9zd2l0Y2gpLA0KPiA+PiArDQo+ID4+ICAgICAgICAvKiBDTEsg
REVUICovDQo+ID4+ICAgICAgICBTTkRfU09DX0RBUE1fU1VQUExZKCJDTEtERVQgU1lTIiwgUlQ1
NjgyU19DTEtfREVULA0KPiA+PiAgICAgICAgICAgICAgICBSVDU2ODJTX1NZU19DTEtfREVUX1NG
VCwgMCwgTlVMTCwgMCksIEBAIC0xODk1LDgNCj4gKzE5MDgsMTAgQEANCj4gPj4gc3RhdGljIGNv
bnN0IHN0cnVjdCBzbmRfc29jX2RhcG1fcm91dGUgcnQ1Njgyc19kYXBtX3JvdXRlc1tdID0gew0K
PiA+PiAgICAgICAgeyJIUCBBbXAiLCBOVUxMLCAiQ0xLREVUIFNZUyJ9LA0KPiA+PiAgICAgICAg
eyJIUCBBbXAiLCBOVUxMLCAiU0FSIn0sDQo+ID4+DQo+ID4+IC0gICAgIHsiSFBPTCIsIE5VTEws
ICJIUCBBbXAifSwNCj4gPj4gLSAgICAgeyJIUE9SIiwgTlVMTCwgIkhQIEFtcCJ9LA0KPiA+PiAr
ICAgICB7IkhQT0wgUGxheWJhY2siLCAiU3dpdGNoIiwgIkhQIEFtcCJ9LA0KPiA+PiArICAgICB7
IkhQT1IgUGxheWJhY2siLCAiU3dpdGNoIiwgIkhQIEFtcCJ9LA0KPiA+PiArICAgICB7IkhQT0wi
LCBOVUxMLCAiSFBPTCBQbGF5YmFjayJ9LA0KPiA+PiArICAgICB7IkhQT1IiLCBOVUxMLCAiSFBP
UiBQbGF5YmFjayJ9LA0KPiA+PiAgIH07DQo+ID4NCj4gPiBSVDU2ODJTIGVuYWJsZXMgdGhlIDEg
Yml0IGNvbnRyb2wgZm9yIEhQIG91dHB1dC4NCj4gPiBUaGVyZWZvcmUsIHRoZSBzZXR0aW5nIG9m
IFJUNTY4MlNfSFBfQ1RSTF8xWzE1XVs3XSB3aWxsIGJlIG5vdCBlZmZlY3RpdmUuDQo+ID4NCj4g
Pg0KPiBPaywgaXQgd2FzIGFjdHVhbGx5IGVmZmVjdGl2ZSBhbmQgbXV0ZWQgYXVkaW8gd2hlbiB3
ZSB0ZXN0IGluIG91cg0KPiBwbGF0Zm9ybSwgcG9zc2libGUgYmVjYXVzZSBpJ20gdGVhcmluZyBk
b3duIGRhcG0gcGF0aCBiYXNlZCBvbiBzd2l0Y2gNCj4gdmFsdWUuIElmIHdlIGRvbid0IGhhdmUg
cmVnaXN0ZXIgYml0cyBhdmFpbGFibGUgdG8gbXV0ZSBpJ2xsIHJlc3VibWl0DQo+IHRoZSBjaGFu
Z2Ugd2l0aCB2aXJ0dWFsIHN3aXRjaCB3aWRnZXQgdG8gZGlzYWJsZSBEQVBNIGFuZCBzdG9wIGF1
ZGlvLg0KPiANCldoYXQgcHVycG9zZSBkbyB5b3Ugd2FudCB0byBhZGQgYW4gYWRkaXRpb25hbCBz
d2l0Y2ggdG8gcG93ZXIgdXAvZG93biANCnRoZSBkYXBtIGluIHRoZSBjb2RlYyBkcml2ZXIgaW5z
dGVhZCBvZiB1c2luZyBleGlzdGluZyBjb250cm9scz8NCkFuZCB3ZSB0aG91Z2h0IHRoZSB2aXJ0
dWFsIHN3aXRjaCB5b3UgdGFsa2VkIGFib3V0IGNvdWxkIGJlIGltcGxlbWVudGVkIA0KaW4gdGhl
IG1hY2hpbmUgZHJpdmVyLg0K
