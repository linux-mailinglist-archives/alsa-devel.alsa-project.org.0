Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D14DCACA24
	for <lists+alsa-devel@lfdr.de>; Mon, 08 Dec 2025 10:19:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C81D0601C6;
	Mon,  8 Dec 2025 10:19:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C81D0601C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765185572;
	bh=hClDxgXt6rQ9Xhqod5jLTOsprAZnni9dXFA+HB4ic5U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fPxyyHv34isWA3vx34rH1dcqqSsOYLAy7X04iwaH2KaacZLgDgVbol2IgFjWu6p2i
	 Ndab5biEKAm9GPhqRrtH5sKJcMUtFzB0MQA1Wr7Wd4UPKcbl5/tTsL+PjdRbKV6h/V
	 soCTqRxIIune8iyB7uNnDSna9k0rqxnCF2Xs5qQ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4127BF804B3; Mon,  8 Dec 2025 10:18:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 625D7F804B2;
	Mon,  8 Dec 2025 10:18:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73471F80525; Mon,  8 Dec 2025 10:16:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A76E3F800ED
	for <alsa-devel@alsa-project.org>; Mon,  8 Dec 2025 10:16:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A76E3F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=HXZe2iC4
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5B89GI2u83754773,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1765185378; bh=hClDxgXt6rQ9Xhqod5jLTOsprAZnni9dXFA+HB4ic5U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=HXZe2iC4lpoalpXAs7b5AMsO5gwDAx/WgWjPNr/4+3DtN36UXc/bna1ic2wzI8mvw
	 rdZ7tBOO+K/dgtFzjqa9IfBaDODN4327eB7i9Fjf7WJd6dFEaX9Pnq3NxeAXI/fLAu
	 JASXHWwMqXElDSnIKYd+VdlDoxICJo3zTwkL5WEw/24vNTQE9er1BIDBG405Mf155P
	 wimsW0zEDT6KG4LtDrC3goXhMnhiuRNmMBJTm7NNRlH2FgVCZWhVt+M7o7TtrfRetb
	 UInvYu/NNLNXLsUWedxqmjmV+AHttKL6s5JgDQSk2D38+ajd33P3ASS3Mi5kPPn5MS
	 pDkB13rEVhpNw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5B89GI2u83754773
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Dec 2025 17:16:18 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 8 Dec 2025 17:16:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 8 Dec 2025 17:16:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::2fa5:eccb:34ee:7bb%10]) with mapi id
 15.02.1544.027; Mon, 8 Dec 2025 17:16:18 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>,
        "cezary.rojewski@intel.com"
	<cezary.rojewski@intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh@kernel.org"
	<robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "perex@perex.cz" <perex@perex.cz>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "Flove(HsinFu)" <flove@realtek.com>,
        =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
        Jack Yu
	<jack.yu@realtek.com>,
        =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
	<derek.fang@realtek.com>
Subject: RE: [PATCH v8 1/2] ASoC: rt5575: Add the codec driver for the ALC5575
Thread-Topic: [PATCH v8 1/2] ASoC: rt5575: Add the codec driver for the
 ALC5575
Thread-Index: AQHcYrFaS/5FqQdtw0yFH8gKhtK+rLUWxcwAgACdTlD//4MyAIAAkQMQ
Date: Mon, 8 Dec 2025 09:16:18 +0000
Message-ID: <4859e7819e264382be4b3b58cd348aa0@realtek.com>
References: <20251201105926.1714341-1-oder_chiou@realtek.com>
 <20251201105926.1714341-2-oder_chiou@realtek.com>
 <6c0639e2-dc59-4e0f-be42-224a98b37f75@kernel.org>
 <2202b463075f4219bffc636fbafb0684@realtek.com>
 <20065270-0d88-4463-9641-f92b4c9e4674@kernel.org>
In-Reply-To: <20065270-0d88-4463-9641-f92b4c9e4674@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: 363T5ZQWDYCPAQMNZGY7GXXFI33EKYEG
X-Message-ID-Hash: 363T5ZQWDYCPAQMNZGY7GXXFI33EKYEG
X-MailFrom: oder_chiou@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/363T5ZQWDYCPAQMNZGY7GXXFI33EKYEG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgOCwgMjAyNSA0OjAy
IFBNDQo+IFRvOiBPZGVyIENoaW91IDxvZGVyX2NoaW91QHJlYWx0ZWsuY29tPjsgY2V6YXJ5LnJv
amV3c2tpQGludGVsLmNvbTsNCj4gYnJvb25pZUBrZXJuZWwub3JnOyBsZ2lyZHdvb2RAZ21haWwu
Y29tOyByb2JoQGtlcm5lbC5vcmc7DQo+IGtyemsrZHRAa2VybmVsLm9yZzsgY29ub3IrZHRAa2Vy
bmVsLm9yZw0KPiBDYzogcGVyZXhAcGVyZXguY3o7IGxpbnV4LXNvdW5kQHZnZXIua2VybmVsLm9y
ZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0
Lm9yZzsgRmxvdmUoSHNpbkZ1KSA8ZmxvdmVAcmVhbHRlay5jb20+OyBTaHVtaW5nIFvojIMNCj4g
5pu46YqYXSA8c2h1bWluZ2ZAcmVhbHRlay5jb20+OyBKYWNrIFl1IDxqYWNrLnl1QHJlYWx0ZWsu
Y29tPjsgRGVyZWsgW+aWueW+tw0KPiDnvqldIDxkZXJlay5mYW5nQHJlYWx0ZWsuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIHY4IDEvMl0gQVNvQzogcnQ1NTc1OiBBZGQgdGhlIGNvZGVjIGRy
aXZlciBmb3IgdGhlDQo+IEFMQzU1NzUNCj4gDQo+IA0KPiBFeHRlcm5hbCBtYWlsIDogVGhpcyBl
bWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QNCj4g
cmVwbHksIGNsaWNrIGxpbmtzLCBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2du
aXplIHRoZSBzZW5kZXIgYW5kDQo+IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0K
PiANCj4gT24gMDgvMTIvMjAyNSAwODoyOSwgT2RlciBDaGlvdSB3cm90ZToNCj4gPj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPg0KPiA+PiBTZW50OiBNb25kYXksIERlY2VtYmVyIDgsIDIwMjUgMjowNSBQ
TQ0KPiA+PiBUbzogT2RlciBDaGlvdSA8b2Rlcl9jaGlvdUByZWFsdGVrLmNvbT47IGNlemFyeS5y
b2pld3NraUBpbnRlbC5jb207DQo+ID4+IGJyb29uaWVAa2VybmVsLm9yZzsgbGdpcmR3b29kQGdt
YWlsLmNvbTsgcm9iaEBrZXJuZWwub3JnOw0KPiA+PiBrcnprK2R0QGtlcm5lbC5vcmc7IGNvbm9y
K2R0QGtlcm5lbC5vcmcNCj4gPj4gQ2M6IHBlcmV4QHBlcmV4LmN6OyBsaW51eC1zb3VuZEB2Z2Vy
Lmtlcm5lbC5vcmc7DQo+ID4+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBhbHNhLWRldmVs
QGFsc2EtcHJvamVjdC5vcmc7DQo+ID4+IEZsb3ZlKEhzaW5GdSkgPGZsb3ZlQHJlYWx0ZWsuY29t
PjsgU2h1bWluZyBb6IyDDQo+ID4+IOabuOmKmF0gPHNodW1pbmdmQHJlYWx0ZWsuY29tPjsgSmFj
ayBZdSA8amFjay55dUByZWFsdGVrLmNvbT47IERlcmVrIFvmlrkNCj4g5b63DQo+ID4+IOe+qV0g
PGRlcmVrLmZhbmdAcmVhbHRlay5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjggMS8y
XSBBU29DOiBydDU1NzU6IEFkZCB0aGUgY29kZWMgZHJpdmVyIGZvcg0KPiA+PiB0aGUNCj4gPj4g
QUxDNTU3NQ0KPiA+Pg0KPiA+Pg0KPiA+PiBFeHRlcm5hbCBtYWlsIDogVGhpcyBlbWFpbCBvcmln
aW5hdGVkIGZyb20gb3V0c2lkZSB0aGUgb3JnYW5pemF0aW9uLg0KPiA+PiBEbyBub3QgcmVwbHks
IGNsaWNrIGxpbmtzLCBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplDQo+
ID4+IHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gPj4NCj4gPj4N
Cj4gPj4NCj4gPj4gT24gMDEvMTIvMjAyNSAxMTo1OSwgT2RlciBDaGlvdSB3cm90ZToNCj4gPj4+
ICsNCj4gPj4+ICtzdGF0aWMgaW50IHJ0NTU3NV9pMmNfcmVhZCh2b2lkICpjb250ZXh0LCB1bnNp
Z25lZCBpbnQgcmVnLA0KPiA+Pj4gK3Vuc2lnbmVkIGludA0KPiA+PiAqdmFsKQ0KPiA+Pj4gK3sN
Cj4gPj4+ICsgICAgIHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSBjb250ZXh0Ow0KPiA+Pj4g
KyAgICAgc3RydWN0IHJ0NTU3NV9wcml2ICpydDU1NzUgPSBpMmNfZ2V0X2NsaWVudGRhdGEoY2xp
ZW50KTsNCj4gPj4+ICsNCj4gPj4+ICsgICAgIHJlZ21hcF9yZWFkKHJ0NTU3NS0+ZHNwX3JlZ21h
cCwgcmVnIHwgUlQ1NTc1X0RTUF9NQVBQSU5HLA0KPiA+PiB2YWwpOw0KPiA+Pj4gKw0KPiA+Pj4g
KyAgICAgcmV0dXJuIDA7DQo+ID4+PiArfQ0KPiA+Pj4gKw0KPiA+Pj4gK3N0YXRpYyBpbnQgcnQ1
NTc1X2kyY193cml0ZSh2b2lkICpjb250ZXh0LCB1bnNpZ25lZCBpbnQgcmVnLA0KPiA+Pj4gK3Vu
c2lnbmVkIGludCB2YWwpIHsNCj4gPj4+ICsgICAgIHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQg
PSBjb250ZXh0Ow0KPiA+Pj4gKyAgICAgc3RydWN0IHJ0NTU3NV9wcml2ICpydDU1NzUgPSBpMmNf
Z2V0X2NsaWVudGRhdGEoY2xpZW50KTsNCj4gPj4+ICsNCj4gPj4+ICsgICAgIHJlZ21hcF93cml0
ZShydDU1NzUtPmRzcF9yZWdtYXAsIHJlZyB8IFJUNTU3NV9EU1BfTUFQUElORywNCj4gPj4gdmFs
KTsNCj4gPj4+ICsNCj4gPj4+ICsgICAgIHJldHVybiAwOw0KPiA+Pj4gK30NCj4gPj4+ICsNCj4g
Pj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ21hcF9jb25maWcgcnQ1NTc1X3JlZ21hcCA9IHsN
Cj4gPj4+ICsgICAgIC5yZWdfYml0cyA9IDE2LA0KPiA+Pj4gKyAgICAgLnZhbF9iaXRzID0gMzIs
DQo+ID4+PiArICAgICAucmVnX3N0cmlkZSA9IDQsDQo+ID4+PiArICAgICAubWF4X3JlZ2lzdGVy
ID0gMHhmZmZjLA0KPiA+Pj4gKyAgICAgLnJlYWRhYmxlX3JlZyA9IHJ0NTU3NV9yZWFkYWJsZV9y
ZWdpc3RlciwNCj4gPj4+ICsgICAgIC5yZWdfcmVhZCA9IHJ0NTU3NV9pMmNfcmVhZCwNCj4gPj4+
ICsgICAgIC5yZWdfd3JpdGUgPSBydDU1NzVfaTJjX3dyaXRlLA0KPiA+Pj4gKyAgICAgLnVzZV9z
aW5nbGVfcmVhZCA9IHRydWUsDQo+ID4+PiArICAgICAudXNlX3NpbmdsZV93cml0ZSA9IHRydWUs
DQo+ID4+PiArfTsNCj4gPj4NCj4gPj4gT0YgZGV2aWNlIElEIHRhYmxlIGdvZXMgYXJvdW5kIGhl
cmUgLSB0b2dldGhlciB3aXRoIEkyQy4NCj4gPiBJIHdpbGwgY29ycmVjdCBpdC4NCj4gPg0KPiA+
Pj4gKw0KPiA+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCBydDU1NzVfaTJj
X2lkW10gPSB7DQo+ID4+PiArICAgICB7ICJydDU1NzUiIH0sDQo+ID4+PiArICAgICB7IH0NCj4g
Pj4+ICt9Ow0KPiA+Pj4gK01PRFVMRV9ERVZJQ0VfVEFCTEUoaTJjLCBydDU1NzVfaTJjX2lkKTsN
Cj4gPj4+ICsNCj4gPj4+ICtzdGF0aWMgaW50IHJ0NTU3NV9pMmNfcHJvYmUoc3RydWN0IGkyY19j
bGllbnQgKmkyYykgew0KPiA+Pj4gKyAgICAgc3RydWN0IHJ0NTU3NV9wcml2ICpydDU1NzU7DQo+
ID4+PiArICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmaTJjLT5kZXY7DQo+ID4+PiArICAgICBp
bnQgcmV0LCB2YWw7DQo+ID4+PiArDQo+ID4+PiArI2lmIElTX0VOQUJMRUQoQ09ORklHX1NORF9T
T0NfUlQ1NTc1X1NQSSkNCj4gPj4NCj4gPj4gTm8gaWZkZWZzIGluIGRyaXZlciBjb2RlLg0KPiA+
DQo+ID4gSSBhbSBub3QgdW5kZXJzdGFuZGluZyBleGFjdGx5Lg0KPiA+IElmIHRoZSBtYWNoaW5l
IGlzIHdpdGhvdXQgU1BJIGludGVyZmFjZSBhbmQgdGhlIGNvZGVjIHdpdGggZmxhc2gsIHRoZQ0K
PiA+IENPTkZJR19TTkRfU09DX1JUNTU3NV9TUEkgY2FuIGJlIGRpc2FibGVkLg0KPiANCj4gQnV0
IHlvdSBzdGlsbCBzaG91bGQgbm90IHVzZSAjaWZkZWYuIENvZGluZyBzdHlsZSBnaXZlcyB5b3Ug
YWx0ZXJuYXRpdmUsIHBsZWFzZQ0KPiBsb29rIGF0IHRoZSBkb2MuDQo+IA0KPiA+DQo+ID4+PiAr
ICAgICBpZiAoIXJ0NTU3NV9zcGkgJiYgb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUoZGV2LT5vZl9u
b2RlLA0KPiA+PiBydDU1NzVfb2ZfbWF0Y2hbMV0uY29tcGF0aWJsZSkpDQo+ID4+DQo+ID4+IE5v
LCB1c2UgZHJpdmVyIG1hdGNoIGRhdGEgaWYgZXZlciwgYnV0IHRoaXMgaXMganVzdCB3cm9uZy4g
WW91IHNhaWQNCj4gPj4gaXQgZGVwZW5kcyBvbiBTUEkgZmxhc2gsIG5vdCBTUEkgaW50ZXJmYWNl
Lg0KPiA+DQo+ID4gSSB3aWxsIG1vZGlmeSBpdCB0byB1c2UgdGhlIG1hdGNoIGRhdGEgYXMgZm9s
bG93aW5nLg0KPiA+IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHJ0NTU3NV9vZl9t
YXRjaFtdID0gew0KPiA+ICAgICAgIHsgLmNvbXBhdGlibGUgPSAicmVhbHRlayxydDU1NzUiLCAu
ZGF0YSA9ICh2b2lkDQo+ICopUlQ1NTc1X1dJVEhfRkxBU0ggfSwNCj4gPiAgICAgICB7IC5jb21w
YXRpYmxlID0gInJlYWx0ZWsscnQ1NTc1LXVzZS1zcGkiLCAuZGF0YSA9ICh2b2lkDQo+ID4gKilS
VDU1NzVfV0lUSE9VVF9GTEFTSCB9LA0KPiANCj4gV2hhdCBpcyBzdGlsbCB3cm9uZyBpcyB0aGF0
IHdoeSB5b3UgZGVmZXIgcHJvYmUgaWYgdGhlcmUgaXMgbm8gZmxhc2guIEkgcmVhbGx5IGRvDQo+
IG5vdCBnZXQgaXQuLi4NCg0KSWYgdGhlIGNvZGVjIGhhcyBmbGFzaCwgdGhlIGZsYXNoIGlzIGNv
bm5lY3RlZCB0byB0aGUgY29kZWMncyBTUEkgaG9zdA0KaW50ZXJmYWNlLg0KDQpJZiB0aGUgY29k
ZWMgaGFzIG5vIGZsYXNoLCB0aGUgY29kZWMgU1BJIGRyaXZlciBzaG91bGQgbG9hZCB0aGUgZmly
bXdhcmUNCmZyb20gdGhlIGNvZGVjJ3MgU1BJIHNsYXZlIGludGVyZmFjZS4gVGhlIEkyQyBkcml2
ZXIgbXVzdCB3YWl0IHVudGlsIHRoZQ0KU1BJIGRyaXZlciBpcyByZWFkeSB0byBlbnN1cmUgdGhl
IGZpcm13YXJlIGlzIGxvYWRlZCBjb3JyZWN0bHkuDQoNCg==
