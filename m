Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E94728E4A
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 05:05:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A69EA208;
	Fri,  9 Jun 2023 05:05:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A69EA208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686279955;
	bh=o04FvuXzd4SpzWiu6D5/oVJOEdn/IXQ73xn0PpezAZE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n8lSqAl0kA6mU8ZQZwZ2hu6Th3Rv4gIimNujBeJFYbIFmiLTRDF4+5AzyzCu5ZwXo
	 JJmIxVjTu+0NLi1+8t0HQawiD7Xkqlkp9xkansJiVsOSYPUKm65AjMvrrOOFso8Vh8
	 N794SSN0U+LRgx1kA1popUY3JYyFQ4PZc4Y/uGEQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A74A6F80494; Fri,  9 Jun 2023 05:05:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF1AFF8016C;
	Fri,  9 Jun 2023 05:05:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1E84F80199; Fri,  9 Jun 2023 05:04:57 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 02BE5F800ED
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 05:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02BE5F800ED
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 35934DhhC027865,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 35934DhhC027865
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 9 Jun 2023 11:04:13 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 9 Jun 2023 11:04:29 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 9 Jun 2023 11:04:29 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::4d7:e49a:674a:598]) by
 RTEXMBS01.realtek.com.tw ([fe80::4d7:e49a:674a:598%5]) with mapi id
 15.01.2375.007; Fri, 9 Jun 2023 11:04:29 +0800
From: Kailang <kailang@realtek.com>
To: "Joseph C. Sible" <josephcsible@gmail.com>
CC: Takashi Iwai <tiwai@suse.de>, Bagas Sanjaya <bagasdotme@gmail.com>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        "perex@perex.cz"
	<perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
Thread-Topic: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
Thread-Index: 
 AQHZhdSOD7kY6mXBDkGA3ryhp811r69Yu5SAgAASNACAAA22gIAA7n+AgAEJrYCABLe/YIAJNIWAgAIHAcD//4tyAIAB8UZw///vxgCADzWhgIABfgWAgACUPoCAAPnsAIAAmlKwgAA8s4CAAQ8boP//kIuAABWnYVAAAIR9gAAqhW/A
Date: Fri, 9 Jun 2023 03:04:29 +0000
Message-ID: <009474f04d0b45c69a0e42e8622b7a86@realtek.com>
References: <bug-217440-225600@https.bugzilla.kernel.org/>
 <CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
 <ZGB0cVVI7OgaJU6t@debian.me>
 <CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
 <87cz338ix4.wl-tiwai@suse.de>
 <CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
 <874jodlnmi.wl-tiwai@suse.de> <415d4bc84aa74c74af913048f28b42a9@realtek.com>
 <87fs7mdofi.wl-tiwai@suse.de> <7da2fdfdae614b1c98deda6e11ca34eb@realtek.com>
 <87353kd8b9.wl-tiwai@suse.de> <1170325957764b4cbd7cd3639575f285@realtek.com>
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
In-Reply-To: 
 <CABpewhEptq0+W_71U__8iQ4+LNtYSUB9C+0bcS2Hw-5mnj9viQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXDAG02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: OOSC5JGFI65AJ3XUSRNPD4KXFNYZHYT3
X-Message-ID-Hash: OOSC5JGFI65AJ3XUSRNPD4KXFNYZHYT3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OOSC5JGFI65AJ3XUSRNPD4KXFNYZHYT3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgVGFrYXNoaSwNCg0KQUxDMjM2IHdvcmtzIG5vcm1hbGx5Lg0KQnV0IGNvZGVjIHJlZ2lzdGVy
IGNhbid0IHNob3cgaXQuIChpdCBzaG93cyAiSW52YWxpZCBBRkcgc3VidHJlZSIpDQpDb3VsZCB5
b3Uga25vdyB3aHk/DQoNCkJSLA0KS2FpbGFuZw0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiBGcm9tOiBKb3NlcGggQy4gU2libGUgPGpvc2VwaGNzaWJsZUBnbWFpbC5jb20+DQo+IFNl
bnQ6IFRodXJzZGF5LCBKdW5lIDgsIDIwMjMgMTA6NDMgUE0NCj4gVG86IEthaWxhbmcgPGthaWxh
bmdAcmVhbHRlay5jb20+DQo+IENjOiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+OyBCYWdh
cyBTYW5qYXlhIDxiYWdhc2RvdG1lQGdtYWlsLmNvbT47DQo+IHJlZ3Jlc3Npb25zQGxpc3RzLmxp
bnV4LmRldjsgcGVyZXhAcGVyZXguY3o7IHRpd2FpQHN1c2UuY29tOw0KPiBhbHNhLWRldmVsQGFs
c2EtcHJvamVjdC5vcmcNCj4gU3ViamVjdDogUmU6IEZ3ZDogW0J1ZyAyMTc0NDBdIE5ldzogQUxD
MjM2IGF1ZGlvIGRpc2FwcGVhcnMgZnJvbSBIUA0KPiAxNXotZmMwMDAgb24gd2FybSBib290DQo+
IA0KPiANCj4gRXh0ZXJuYWwgbWFpbC4NCj4gDQo+IA0KPiANCj4gT24gVGh1LCBKdW4gOCwgMjAy
MyBhdCAyOjMy4oCvQU0gS2FpbGFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4gd3JvdGU6DQo+ID4N
Cj4gPiBDb3VsZCB5b3UgdXNlIHlvdXIgcGF0Y2ggdG8gZHVtcCBjb2RlYyBpbmZvIGFnYWluPw0K
PiA+IEkgd2FudCB0byBjaGVjayBpdCB3aWxsIGFsc28gc2hvdyAiaW52YWxpZCBBRkcgc3VidHJl
ZSIuDQo+IA0KPiBPa2F5LCBoZXJlJ3MgdGhlIHNhbWUgY29tbWFuZCdzIG91dHB1dCBhZ2Fpbiwg
dGhpcyB0aW1lIGZyb20gdW5kZXIgdGhlDQo+IGtlcm5lbCB3aXRoIG15IHBhdGNoIHRoYXQgZG9l
cyBmaXggdGhlIHByb2JsZW0uIEl0IGRvZXMgYWxzbyBzaG93ICJpbnZhbGlkIEFGRw0KPiBzdWJ0
cmVlIi4NCj4gDQo+IFRoYW5rcywNCj4gDQo+IEpvc2VwaCBDLiBTaWJsZQ0KPiANCj4gLS0tLS0t
UGxlYXNlIGNvbnNpZGVyIHRoZSBlbnZpcm9ubWVudCBiZWZvcmUgcHJpbnRpbmcgdGhpcyBlLW1h
aWwuDQo=
