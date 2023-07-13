Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0AA751B80
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 10:26:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1461206;
	Thu, 13 Jul 2023 10:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1461206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689236799;
	bh=lEKc9IToBHPwkd4EjTO4mCbUDiCc880Uq/Mj+YaaHRk=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NEcPu/dTf3xyubpzpcq7DUWSXjpWS1ceq62Z03XFHd/eg7tRYUqtiJMs9yKGqL0BF
	 tvnavuUsLar3AQfjzzcU3qpqh8tRsErKdF3hfuwPzOGzLJrwgJyuYcpQLA+YMxiuHk
	 6RGn+2yvaoqsrsaZ7RU8m7dk3ccLzPwafn95W5wc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43F4BF8027B; Thu, 13 Jul 2023 10:25:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C639F80236;
	Thu, 13 Jul 2023 10:25:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44F00F80249; Thu, 13 Jul 2023 10:25:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id B1723F800E4
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 10:25:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1723F800E4
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 36D8PGoN4001443,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 36D8PGoN4001443
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Thu, 13 Jul 2023 16:25:16 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 13 Jul 2023 16:25:23 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 13 Jul 2023 16:25:23 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b]) by
 RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b%5]) with mapi id
 15.01.2375.007; Thu, 13 Jul 2023 16:25:23 +0800
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
 AQHZhdSOD7kY6mXBDkGA3ryhp811r69Yu5SAgAASNACAAA22gIAA7n+AgAEJrYCABLe/YIAJNIWAgAIHAcD//4tyAIAB8UZw///vxgCADzWhgIABfgWAgACUPoCAAPnsAIAAmlKwgAA8s4CAAQ8boP//kIuAABWnYVAAAIR9gAAqhW/A//+7roD//3k98IAAkYyAgAAKhQCAAAZZgIAAiY6AgADw04CAALC0AIAA6TqAgBQJp4CAAhpFAP/xaKKggBysdYD/8VrnoA==
Date: Thu, 13 Jul 2023 08:25:22 +0000
Message-ID: <4678992299664babac4403d9978e7ba7@realtek.com>
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
	<009474f04d0b45c69a0e42e8622b7a86@realtek.com>	<87h6rhcef2.wl-tiwai@suse.de>
	<0990300d759846d890de9c92fcad9a9d@realtek.com>
	<CABpewhERnOH1qkkJ5_JJUZkz1_8oxD9aR5VBs1vsURAG7Eu_Ew@mail.gmail.com>
	<878rctcavz.wl-tiwai@suse.de>	<874jnhc9u4.wl-tiwai@suse.de>
	<CABpewhHG2+s8_6r6vChm2g5tD8ALW_SWJWubPRXWzTJB2aFR9g@mail.gmail.com>
	<875y7vbxpg.wl-tiwai@suse.de>
	<CABpewhHDnvn4v+uCpsaLHB+biw-f59tdTiCyFkicHnewXHYDNg@mail.gmail.com>
	<87wn0aa1s4.wl-tiwai@suse.de>
	<CABpewhFg=7+JR6v=zhi0_Hm9+S64DLOHKeG2pS-W7z-vNpu_5Q@mail.gmail.com>
	<87leg7x4h7.wl-tiwai@suse.de>	<f4969213b5a14cc5a11befb4df861481@realtek.com>
 <87cz182hfk.wl-tiwai@suse.de>
In-Reply-To: <87cz182hfk.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_4678992299664babac4403d9978e7ba7realtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: IILXALGTF3IREQNDDJD6HRVRQJ764GZT
X-Message-ID-Hash: IILXALGTF3IREQNDDJD6HRVRQJ764GZT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IILXALGTF3IREQNDDJD6HRVRQJ764GZT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_4678992299664babac4403d9978e7ba7realtekcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSm9zZXBoLA0KDQpDb3VsZCB5b3UgdGVzdCBhdHRhY2ggcGF0Y2g/DQoNCkJSLA0KS2FpbGFu
Zw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFRha2FzaGkgSXdhaSA8
dGl3YWlAc3VzZS5kZT4NCj4gU2VudDogVHVlc2RheSwgSnVseSA0LCAyMDIzIDQ6NDYgUE0NCj4g
VG86IEthaWxhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+DQo+IENjOiBKb3NlcGggQy4gU2libGUg
PGpvc2VwaGNzaWJsZUBnbWFpbC5jb20+OyBCYWdhcyBTYW5qYXlhDQo+IDxiYWdhc2RvdG1lQGdt
YWlsLmNvbT47IHJlZ3Jlc3Npb25zQGxpc3RzLmxpbnV4LmRldjsgcGVyZXhAcGVyZXguY3o7DQo+
IHRpd2FpQHN1c2UuY29tOyBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcNCj4gU3ViamVjdDog
UmU6IEZ3ZDogW0J1ZyAyMTc0NDBdIE5ldzogQUxDMjM2IGF1ZGlvIGRpc2FwcGVhcnMgZnJvbSBI
UA0KPiAxNXotZmMwMDAgb24gd2FybSBib290DQo+IA0KPiANCj4gRXh0ZXJuYWwgbWFpbC4NCj4g
DQo+IA0KPiANCj4gT24gVHVlLCAwNCBKdWwgMjAyMyAxMDozODo0MyArMDIwMCwNCj4gS2FpbGFu
ZyB3cm90ZToNCj4gPg0KPiA+DQo+ID4gQmVsb3cgd2FzIHRoZSByZWxhdGlvbiBwYXRjaGVzLg0K
PiA+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rpd2Fp
L3NvdW5kLmdpdC9jb21taXQNCj4gPiAvP2lkPTVhZWM5ODkxMzA5NWVkM2I0NDI0ZWQ2YzVmZGVi
Njk2NGU5NzM0ZGENCj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC90aXdhaS9zb3VuZC5naXQvY29tbWl0DQo+ID4gLz9pZD1mMzA3NDFjZGVkNjJmODdi
YjRiMWNjNThiYzYyN2YwNzZhYmNhYmE4DQo+ID4NCj4gPiBJdCBzaG93cyBBTEMyMzYgY29kZWMg
bm90IG5lZWQgdG8gcnVuIHB1bGwgbG93IDNrIHNldHRpbmcuDQo+ID4NCj4gPiBJIHRyYWNlIHdp
bmRvd3MgY29kZSwgZmluZCBpdCBhZGQgZGVsYXkgZm9yIHJlYWQgTUlDIGphY2sgZGV0ZWN0ZWQg
YXQgYm9vdGluZw0KPiB0aW1lLg0KPiANCj4gSSBleHBlY3RlZCBzb21ldGhpbmcgbGlrZSB0aGF0
IDspDQo+IElmIHlvdSBoYXZlIGEgdGVzdCBwYXRjaCwgbGV0IHVzIGtub3cuDQo+IA0KPiANCj4g
dGhhbmtzLA0KPiANCj4gVGFrYXNoaQ0KPiANCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPg0K
PiA+ID4gU2VudDogU3VuZGF5LCBKdW5lIDI1LCAyMDIzIDU6NDMgUE0NCj4gPiA+IFRvOiBKb3Nl
cGggQy4gU2libGUgPGpvc2VwaGNzaWJsZUBnbWFpbC5jb20+DQo+ID4gPiBDYzogS2FpbGFuZyA8
a2FpbGFuZ0ByZWFsdGVrLmNvbT47IEJhZ2FzIFNhbmpheWENCj4gPiA+IDxiYWdhc2RvdG1lQGdt
YWlsLmNvbT47IHJlZ3Jlc3Npb25zQGxpc3RzLmxpbnV4LmRldjsgcGVyZXhAcGVyZXguY3o7DQo+
ID4gPiB0aXdhaUBzdXNlLmNvbTsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnDQo+ID4gPiBT
dWJqZWN0OiBSZTogRndkOiBbQnVnIDIxNzQ0MF0gTmV3OiBBTEMyMzYgYXVkaW8gZGlzYXBwZWFy
cyBmcm9tIEhQDQo+ID4gPiAxNXotZmMwMDAgb24gd2FybSBib290DQo+ID4gPg0KPiA+ID4NCj4g
PiA+IEV4dGVybmFsIG1haWwuDQo+ID4gPg0KPiA+ID4NCj4gPiA+DQo+ID4gPiBPbiBTYXQsIDI0
IEp1biAyMDIzIDAzOjM2OjExICswMjAwLA0KPiA+ID4gSm9zZXBoIEMuIFNpYmxlIHdyb3RlOg0K
PiA+ID4gPg0KPiA+ID4gPiBPbiBTdW4sIEp1biAxMSwgMjAyMyBhdCAzOjM24oCvQU0gVGFrYXNo
aSBJd2FpIDx0aXdhaUBzdXNlLmRlPiB3cm90ZToNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoYW5r
cyBmb3IgY2hlY2tpbmcuICBTbyB0aGUgYWRkaXRpb25hbCBkZWxheSBkaWRuJ3QgaGVscCBhdA0K
PiA+ID4gPiA+IGFsbCwgaS5lLiBpdCdzIG5vIHRpbWluZyBpc3N1ZS4gIFdlIG5lZWQgdG8gZmln
dXJlIG91dCB3aGljaA0KPiA+ID4gPiA+IHZlcmIgYWN0dWFsbHkgYnJlYWtzIHRoaW5ncy4gIE9o
IHdlbGwuDQo+ID4gPiA+DQo+ID4gPiA+IFdhcyB0aGVyZSBzb21ldGhpbmcgZWxzZSBzcGVjaWZp
YyB5b3Ugd2FudGVkIG1lIHRvIHRyeSBmb3IgdGhpcz8NCj4gPiA+ID4gSWYgbm90LCB3aGF0IGRv
IHlvdSB0aGluayB0aGUgbmV4dCBzdGVwcyB0byBnZXQgdGhpcyBmaXhlZCBhcmU/IERvDQo+ID4g
PiA+IHlvdSB0aGluayBpdCBtaWdodCBiZSBnb29kIHRvIGp1c3QgY29vayB0aGUgcGFydGlhbCBy
ZXZlcnQgSQ0KPiA+ID4gPiBwb3N0ZWQgYSB3aGlsZSBiYWNrIGFmdGVyIGFsbD8NCj4gPiA+DQo+
ID4gPiBJdCdzIHJhdGhlciBhIGNhbGwgdG8gS2FpbGFuZywgYWZ0ZXIgYWxsLg0KPiA+ID4gSSdt
IGZpbmUgd2l0aCBhbnkgd2F5IGFzIGxvbmcgYXMgaXQgYXZvaWRzIGZ1cnRoZXIgcmVncmVzc2lv
bnMuDQo+ID4gPg0KPiA+ID4NCj4gPiA+IFRha2FzaGkNCj4gPiA+DQo+ID4gPiAtLS0tLS1QbGVh
c2UgY29uc2lkZXIgdGhlIGVudmlyb25tZW50IGJlZm9yZSBwcmludGluZyB0aGlzIGUtbWFpbC4N
Cg==

--_002_4678992299664babac4403d9978e7ba7realtekcom_
Content-Type: application/octet-stream; name="0000-HP-reboot-issue.patch"
Content-Description: 0000-HP-reboot-issue.patch
Content-Disposition: attachment; filename="0000-HP-reboot-issue.patch";
	size=2077; creation-date="Thu, 13 Jul 2023 07:59:21 GMT";
	modification-date="Thu, 13 Jul 2023 08:22:48 GMT"
Content-Transfer-Encoding: base64

RnJvbSBjOGViMjIzMGUxYTllMTk3YjIyZGU2OTMxOGViMTY3OGRhNmU3YjA0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMTMgSnVsIDIwMjMgMTU6NTc6MTMgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIHJlbW92ZSAzayBwdWxsIGxvdyBwcm9jZWR1cmUKClRoaXMgd2FzIHRo
ZSBBTEMyODMgZGVwb3AgcHJvY2VkdXJlLgpNYXliZSB0aGlzIHByb2NlZHVyZSB3YXNuJ3Qgc3Vp
dGFibGUgd2l0aCBuZXcgY29kZWMuClNvLCBsZXQgdXMgcmVtb3ZlIGl0LiBCdXQgSFAgMTV6LWZj
MDAwIG11c3QgZG8gM2sgcHVsbCBsb3cuIElmIGl0IHJlYm9vdCB3aXRoIHBsdWdnZWQgaGVhZHNl
dCwKaXQgd2lsbCBoYXZlIGVycm9ycyBzaG93IGRvbid0IGZpbmQgY29kZWMgZXJyb3IgbWVzc2Fn
ZXMuIFJ1biAzayBwdWxsIGxvdyB3aWxsIHNvbHZlIGlzc3Vlcy4KU28sIGxldCBBTUQgY2hpcHNl
dCB3aWxsIHJ1biB0aGlzIGZvciB3b3JrYXJyb3VuZC4KClNpZ25lZC1vZmYtYnk6IEthaWxhbmcg
WWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KCmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3Bh
dGNoX3JlYWx0ZWsuYyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCmluZGV4IGUyZjhi
NjA4ZGU4Mi4uYWZiNGQ4MjQ3NWI0IDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX3Jl
YWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtMTIyLDYgKzEy
Miw3IEBAIHN0cnVjdCBhbGNfc3BlYyB7CiAJdW5zaWduZWQgaW50IHVsdHJhX2xvd19wb3dlcjox
OwogCXVuc2lnbmVkIGludCBoYXNfaHNfa2V5OjE7CiAJdW5zaWduZWQgaW50IG5vX2ludGVybmFs
X21pY19waW46MTsKKwl1bnNpZ25lZCBpbnQgZW5fM2twdWxsX2xvdzoxOwogCiAJLyogZm9yIFBM
TCBmaXggKi8KIAloZGFfbmlkX3QgcGxsX25pZDsKQEAgLTM2MjIsNiArMzYyMyw3IEBAIHN0YXRp
YyB2b2lkIGFsYzI1Nl9zaHV0dXAoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpCiAJaWYgKCFocF9w
aW4pCiAJCWhwX3BpbiA9IDB4MjE7CiAKKwlhbGNfdXBkYXRlX2NvZWZleF9pZHgoY29kZWMsIDB4
NTcsIDB4MDQsIDB4MDAwNywgMHgxKTsgLyogTG93IHBvd2VyICovCiAJaHBfcGluX3NlbnNlID0g
c25kX2hkYV9qYWNrX2RldGVjdChjb2RlYywgaHBfcGluKTsKIAogCWlmIChocF9waW5fc2Vuc2Up
CkBAIC0zNjM4LDggKzM2NDAsNyBAQCBzdGF0aWMgdm9pZCBhbGMyNTZfc2h1dHVwKHN0cnVjdCBo
ZGFfY29kZWMgKmNvZGVjKQogCS8qIElmIGRpc2FibGUgM2sgcHVsbGRvd24gY29udHJvbCBmb3Ig
YWxjMjU3LCB0aGUgTWljIGRldGVjdGlvbiB3aWxsIG5vdCB3b3JrIGNvcnJlY3RseQogCSAqIHdo
ZW4gYm9vdGluZyB3aXRoIGhlYWRzZXQgcGx1Z2dlZC4gU28gc2tpcCBzZXR0aW5nIGl0IGZvciB0
aGUgY29kZWMgYWxjMjU3CiAJICovCi0JaWYgKGNvZGVjLT5jb3JlLnZlbmRvcl9pZCAhPSAweDEw
ZWMwMjM2ICYmCi0JICAgIGNvZGVjLT5jb3JlLnZlbmRvcl9pZCAhPSAweDEwZWMwMjU3KQorCWlm
IChzcGVjLT5lbl8za3B1bGxfbG93KQogCQlhbGNfdXBkYXRlX2NvZWZfaWR4KGNvZGVjLCAweDQ2
LCAwLCAzIDw8IDEyKTsKIAogCWlmICghc3BlYy0+bm9fc2h1dHVwX3BpbnMpCkBAIC0xMDY4Miw2
ICsxMDY4Myw4IEBAIHN0YXRpYyBpbnQgcGF0Y2hfYWxjMjY5KHN0cnVjdCBoZGFfY29kZWMgKmNv
ZGVjKQogCQlzcGVjLT5zaHV0dXAgPSBhbGMyNTZfc2h1dHVwOwogCQlzcGVjLT5pbml0X2hvb2sg
PSBhbGMyNTZfaW5pdDsKIAkJc3BlYy0+Z2VuLm1peGVyX25pZCA9IDA7IC8qIEFMQzI1NiBkb2Vz
IG5vdCBoYXZlIGFueSBsb29wYmFjayBtaXhlciBwYXRoICovCisJCWlmIChjb2RlYy0+YnVzLT5w
Y2ktPnZlbmRvciA9PSBQQ0lfVkVORE9SX0lEX0FNRCkKKwkJCXNwZWMtPmVuXzNrcHVsbF9sb3cg
PSB0cnVlOwogCQlicmVhazsKIAljYXNlIDB4MTBlYzAyNTc6CiAJCXNwZWMtPmNvZGVjX3Zhcmlh
bnQgPSBBTEMyNjlfVFlQRV9BTEMyNTc7Cg==

--_002_4678992299664babac4403d9978e7ba7realtekcom_--
