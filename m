Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEB272908D
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 09:05:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 355F76C1;
	Fri,  9 Jun 2023 09:04:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 355F76C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686294346;
	bh=/bgJPeLPKjZRNg202rG18o9ZqIWh65MA38fGqLyir9A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y2vLL2R/ENBUQLD3Omu9Cnc97gd9FCoQxk62Us/6laZC3prKwAN4re+GVZKFRi9Eb
	 Qn4UJtkMNiCcBmkZUxZwfcrXbdGf+np7T1gRq7ZTbgxnHrZl2qmacEVhH1H7KpTZrk
	 vT8pl/9Tp2+M6oSE20H8X867N3YgOJ31gaEeWlAQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAA67F804DA; Fri,  9 Jun 2023 09:04:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 556A2F8016C;
	Fri,  9 Jun 2023 09:04:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CB92F80199; Fri,  9 Jun 2023 09:04:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E614F800C8
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 09:04:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E614F800C8
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 35973xB32007612,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 35973xB32007612
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 9 Jun 2023 15:03:59 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 9 Jun 2023 15:04:15 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 9 Jun 2023 15:04:15 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::4d7:e49a:674a:598]) by
 RTEXMBS01.realtek.com.tw ([fe80::4d7:e49a:674a:598%5]) with mapi id
 15.01.2375.007; Fri, 9 Jun 2023 15:04:15 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "Joseph C. Sible" <josephcsible@gmail.com>,
        Bagas Sanjaya
	<bagasdotme@gmail.com>,
        "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>,
        "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
Subject: RE: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
Thread-Topic: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
Thread-Index: 
 AQHZhdSOD7kY6mXBDkGA3ryhp811r69Yu5SAgAASNACAAA22gIAA7n+AgAEJrYCABLe/YIAJNIWAgAIHAcD//4tyAIAB8UZw///vxgCADzWhgIABfgWAgACUPoCAAPnsAIAAmlKwgAA8s4CAAQ8boP//kIuAABWnYVAAAIR9gAAqhW/A//+7roD//3k98A==
Date: Fri, 9 Jun 2023 07:04:15 +0000
Message-ID: <0990300d759846d890de9c92fcad9a9d@realtek.com>
References: <bug-217440-225600@https.bugzilla.kernel.org/>
	<CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
	<ZGB0cVVI7OgaJU6t@debian.me>
	<CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
	<87cz338ix4.wl-tiwai@suse.de>
	<CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
	<874jodlnmi.wl-tiwai@suse.de>	<415d4bc84aa74c74af913048f28b42a9@realtek.com>
	<87fs7mdofi.wl-tiwai@suse.de>	<7da2fdfdae614b1c98deda6e11ca34eb@realtek.com>
	<87353kd8b9.wl-tiwai@suse.de>	<1170325957764b4cbd7cd3639575f285@realtek.com>
	<CABpewhGBakDSBLKZ1cr2=OMspuu3qyYwZrsXUggQ3vt8gsD88A@mail.gmail.com>
	<873536js7q.wl-tiwai@suse.de>
	<CABpewhE0NAC-Q=iqG2Ba=XhT7SXsWy18wQGYUaopzmKDfFxyPw@mail.gmail.com>
	<2c1fcbc00bb44d66a29ac1c1e4bec5ad@realtek.com>
	<CABpewhFthKG97dPiQC4JhGx9sapX9Yu5rWABQjpY95TSA+eawA@mail.gmail.com>
	<485f99149508488080d563144454040e@realtek.com>
	<CABpewhGkvWtM+9J=mx3vw0QY=OBB5OYCxzX3nzVffvFS4QazPA@mail.gmail.com>
	<2831c55638a5431ca9e37d9caf365ed2@realtek.com>
	<CABpewhGiMJUpyBA6=D9_-YA6=5rjR2R0RHUZeg+cWcjtzuCoZQ@mail.gmail.com>
	<3c27f0455d6e4bd1a68115bd25bf1a12@realtek.com>
	<CABpewhEptq0+W_71U__8iQ4+LNtYSUB9C+0bcS2Hw-5mnj9viQ@mail.gmail.com>
	<009474f04d0b45c69a0e42e8622b7a86@realtek.com> <87h6rhcef2.wl-tiwai@suse.de>
In-Reply-To: <87h6rhcef2.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: 3APCQVXHHRLIA7A6JPLMKY2MEBBTSLMR
X-Message-ID-Hash: 3APCQVXHHRLIA7A6JPLMKY2MEBBTSLMR
X-MailFrom: kailang@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3APCQVXHHRLIA7A6JPLMKY2MEBBTSLMR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgSm9zZXBoLA0KDQplY2hvIDAgPiAvc3lzL21vZHVsZS9zbmRfaGRhX2ludGVsL3BhcmFtZXRl
cnMvcG93ZXJfc2F2ZQ0KDQpDb3VsZCB5b3UgZ2l2ZSBpdCBhIHRyeT8gVGhlbiBnb3QgZHVtcCBh
bHNvLg0KDQpJZiBpdCBwYXNzZWQsIHBsZWFzZSB0ZXN0IG15IHR3byBwYXRjaGVzIGFsc28uIFRo
ZW4gZ2V0IGR1bXAgYWdhaW4uIA0KDQpUaGlzIHdhcyBBTUQgY2hpcHNldC4gSSBoYWRuJ3Qgc2Vl
biB0aGlzIGlzc3VlIG9uIElOVEVMIHBsYXRmb3JtLg0KDQpUaGFua3MuDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPg0K
PiBTZW50OiBGcmlkYXksIEp1bmUgOSwgMjAyMyAyOjU2IFBNDQo+IFRvOiBLYWlsYW5nIDxrYWls
YW5nQHJlYWx0ZWsuY29tPg0KPiBDYzogSm9zZXBoIEMuIFNpYmxlIDxqb3NlcGhjc2libGVAZ21h
aWwuY29tPjsgQmFnYXMgU2FuamF5YQ0KPiA8YmFnYXNkb3RtZUBnbWFpbC5jb20+OyByZWdyZXNz
aW9uc0BsaXN0cy5saW51eC5kZXY7IHBlcmV4QHBlcmV4LmN6Ow0KPiB0aXdhaUBzdXNlLmNvbTsg
YWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBGd2Q6IFtCdWcgMjE3
NDQwXSBOZXc6IEFMQzIzNiBhdWRpbyBkaXNhcHBlYXJzIGZyb20gSFANCj4gMTV6LWZjMDAwIG9u
IHdhcm0gYm9vdA0KPiANCj4gDQo+IEV4dGVybmFsIG1haWwuDQo+IA0KPiANCj4gDQo+IE9uIEZy
aSwgMDkgSnVuIDIwMjMgMDU6MDQ6MjkgKzAyMDAsDQo+IEthaWxhbmcgd3JvdGU6DQo+ID4NCj4g
PiBIaSBUYWthc2hpLA0KPiA+DQo+ID4gQUxDMjM2IHdvcmtzIG5vcm1hbGx5Lg0KPiA+IEJ1dCBj
b2RlYyByZWdpc3RlciBjYW4ndCBzaG93IGl0LiAoaXQgc2hvd3MgIkludmFsaWQgQUZHIHN1YnRy
ZWUiKQ0KPiA+IENvdWxkIHlvdSBrbm93IHdoeT8NCj4gDQo+IEl0J3MgdGhlIGNhbGwgb2Ygc25k
X2hkYV9nZXRfc3Vibm9kZXMoKSwgaS5lLiBzbmRfaGRhY19nZXRfc3Vibm9kZXMoKSwgd2hpY2gN
Cj4gc2ltcGx5IHJlYWRzIHRoZSByYXcgcGFyYW1ldGVyIHZhbHVlICh1bmNhY2hlZCkNCj4gQUNf
UEFSX05PREVfQ09VTlQ6DQo+IA0KPiBpbnQgc25kX2hkYWNfZ2V0X3N1Yl9ub2RlcyhzdHJ1Y3Qg
aGRhY19kZXZpY2UgKmNvZGVjLCBoZGFfbmlkX3QgbmlkLA0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBoZGFfbmlkX3QgKnN0YXJ0X2lkKSB7DQo+ICAgICAgICAgdW5zaWduZWQgaW50IHBh
cm07DQo+IA0KPiAgICAgICAgIHBhcm0gPSBzbmRfaGRhY19yZWFkX3Bhcm1fdW5jYWNoZWQoY29k
ZWMsIG5pZCwNCj4gQUNfUEFSX05PREVfQ09VTlQpOw0KPiAgICAgICAgIGlmIChwYXJtID09IC0x
KSB7DQo+ICAgICAgICAgICAgICAgICAqc3RhcnRfaWQgPSAwOw0KPiAgICAgICAgICAgICAgICAg
cmV0dXJuIDA7DQo+ICAgICAgICAgfQ0KPiAgICAgICAgICpzdGFydF9pZCA9IChwYXJtID4+IDE2
KSAmIDB4N2ZmZjsNCj4gICAgICAgICByZXR1cm4gKGludCkocGFybSAmIDB4N2ZmZik7DQo+IH0N
Cj4gDQo+IFNvIGl0IG1lYW5zIHRoZSByZWFkIG9mIHRoaXMgcGFyYW1ldGVyIGZhaWxlZC4NCj4g
DQo+IEkgc3VwcG9zZSB0aGlzIGlzIHVuZGVyIHRoZSBwb3dlci1zYXZlLCBhbmQgaXQgbWlnaHQg
YmUgc29tZSB0aW1pbmcgaXNzdWU/DQo+IFdoYXQgaWYgeW91IGRpc2FibGUgdGhlIGNvZGVjIHBv
d2VyIHNhdmluZz8gIFRoZSBlYXNpZXN0IHdheSB3b3VsZCBiZSB0bw0KPiBwYXNzDQo+ICAgZWNo
byAwID4gL3N5cy9tb2R1bGUvc25kX2hkYV9pbnRlbC9wYXJhbWV0ZXJzL3Bvd2VyX3NhdmUNCj4g
DQo+IA0KPiB0aGFua3MsDQo+IA0KPiBUYWthc2hpDQo+IA0KPiA+DQo+ID4gQlIsDQo+ID4gS2Fp
bGFuZw0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEpvc2Vw
aCBDLiBTaWJsZSA8am9zZXBoY3NpYmxlQGdtYWlsLmNvbT4NCj4gPiA+IFNlbnQ6IFRodXJzZGF5
LCBKdW5lIDgsIDIwMjMgMTA6NDMgUE0NCj4gPiA+IFRvOiBLYWlsYW5nIDxrYWlsYW5nQHJlYWx0
ZWsuY29tPg0KPiA+ID4gQ2M6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT47IEJhZ2FzIFNh
bmpheWENCj4gPiA+IDxiYWdhc2RvdG1lQGdtYWlsLmNvbT47IHJlZ3Jlc3Npb25zQGxpc3RzLmxp
bnV4LmRldjsgcGVyZXhAcGVyZXguY3o7DQo+ID4gPiB0aXdhaUBzdXNlLmNvbTsgYWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnDQo+ID4gPiBTdWJqZWN0OiBSZTogRndkOiBbQnVnIDIxNzQ0MF0g
TmV3OiBBTEMyMzYgYXVkaW8gZGlzYXBwZWFycyBmcm9tIEhQDQo+ID4gPiAxNXotZmMwMDAgb24g
d2FybSBib290DQo+ID4gPg0KPiA+ID4NCj4gPiA+IEV4dGVybmFsIG1haWwuDQo+ID4gPg0KPiA+
ID4NCj4gPiA+DQo+ID4gPiBPbiBUaHUsIEp1biA4LCAyMDIzIGF0IDI6MzLigK9BTSBLYWlsYW5n
IDxrYWlsYW5nQHJlYWx0ZWsuY29tPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gQ291bGQgeW91
IHVzZSB5b3VyIHBhdGNoIHRvIGR1bXAgY29kZWMgaW5mbyBhZ2Fpbj8NCj4gPiA+ID4gSSB3YW50
IHRvIGNoZWNrIGl0IHdpbGwgYWxzbyBzaG93ICJpbnZhbGlkIEFGRyBzdWJ0cmVlIi4NCj4gPiA+
DQo+ID4gPiBPa2F5LCBoZXJlJ3MgdGhlIHNhbWUgY29tbWFuZCdzIG91dHB1dCBhZ2FpbiwgdGhp
cyB0aW1lIGZyb20gdW5kZXINCj4gPiA+IHRoZSBrZXJuZWwgd2l0aCBteSBwYXRjaCB0aGF0IGRv
ZXMgZml4IHRoZSBwcm9ibGVtLiBJdCBkb2VzIGFsc28NCj4gPiA+IHNob3cgImludmFsaWQgQUZH
IHN1YnRyZWUiLg0KPiA+ID4NCj4gPiA+IFRoYW5rcywNCj4gPiA+DQo+ID4gPiBKb3NlcGggQy4g
U2libGUNCj4gPiA+DQo+ID4gPiAtLS0tLS1QbGVhc2UgY29uc2lkZXIgdGhlIGVudmlyb25tZW50
IGJlZm9yZSBwcmludGluZyB0aGlzIGUtbWFpbC4NCg==
