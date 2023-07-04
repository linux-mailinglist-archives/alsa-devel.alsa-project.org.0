Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA707746C25
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 10:40:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 118F23E7;
	Tue,  4 Jul 2023 10:39:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 118F23E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688460004;
	bh=syPq1pT8zILzlIfEq5rqMGzXAt0AjA6cJFmcIWJM48U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iUvWqaM13LJRx5eYwHXSNVpCnWt0ThLj85TwHfuxyL57FFzrVGVjRZ7nYzKyb6Y9r
	 aJEbcxB/kWeeyj4yUHgqtUte/58Np81x31lk96TNfuxpgRLjP6/nK7LJDaMjnwmMEO
	 zJsoLBU7aWWUjUHcdrqR2tD+Y4U7kL8/hosnO79k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A144CF80124; Tue,  4 Jul 2023 10:39:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA144F80124;
	Tue,  4 Jul 2023 10:39:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97997F80125; Tue,  4 Jul 2023 10:39:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id AF2D2F800E4
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 10:38:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF2D2F800E4
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 3648ce0vB023412,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 3648ce0vB023412
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Tue, 4 Jul 2023 16:38:40 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Tue, 4 Jul 2023 16:38:43 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 4 Jul 2023 16:38:43 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b]) by
 RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b%5]) with mapi id
 15.01.2375.007; Tue, 4 Jul 2023 16:38:43 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>, "Joseph C. Sible" <josephcsible@gmail.com>
CC: Bagas Sanjaya <bagasdotme@gmail.com>,
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
 AQHZhdSOD7kY6mXBDkGA3ryhp811r69Yu5SAgAASNACAAA22gIAA7n+AgAEJrYCABLe/YIAJNIWAgAIHAcD//4tyAIAB8UZw///vxgCADzWhgIABfgWAgACUPoCAAPnsAIAAmlKwgAA8s4CAAQ8boP//kIuAABWnYVAAAIR9gAAqhW/A//+7roD//3k98IAAkYyAgAAKhQCAAAZZgIAAiY6AgADw04CAALC0AIAA6TqAgBQJp4CAAhpFAP/xaKKg
Date: Tue, 4 Jul 2023 08:38:43 +0000
Message-ID: <f4969213b5a14cc5a11befb4df861481@realtek.com>
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
 <87leg7x4h7.wl-tiwai@suse.de>
In-Reply-To: <87leg7x4h7.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
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
Message-ID-Hash: 6LNAPK7ODK3GRPZ7KPNPCRPYNG32SWLJ
X-Message-ID-Hash: 6LNAPK7ODK3GRPZ7KPNPCRPYNG32SWLJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LNAPK7ODK3GRPZ7KPNPCRPYNG32SWLJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpCZWxvdyB3YXMgdGhlIHJlbGF0aW9uIHBhdGNoZXMuDQpodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aXdhaS9zb3VuZC5naXQvY29tbWl0Lz9pZD01YWVj
OTg5MTMwOTVlZDNiNDQyNGVkNmM1ZmRlYjY5NjRlOTczNGRhDQpodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aXdhaS9zb3VuZC5naXQvY29tbWl0Lz9pZD1m
MzA3NDFjZGVkNjJmODdiYjRiMWNjNThiYzYyN2YwNzZhYmNhYmE4DQoNCkl0IHNob3dzIEFMQzIz
NiBjb2RlYyBub3QgbmVlZCB0byBydW4gcHVsbCBsb3cgM2sgc2V0dGluZy4NCg0KSSB0cmFjZSB3
aW5kb3dzIGNvZGUsIGZpbmQgaXQgYWRkIGRlbGF5IGZvciByZWFkIE1JQyBqYWNrIGRldGVjdGVk
IGF0IGJvb3RpbmcgdGltZS4NCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4NCj4gU2VudDogU3VuZGF5LCBKdW5lIDI1
LCAyMDIzIDU6NDMgUE0NCj4gVG86IEpvc2VwaCBDLiBTaWJsZSA8am9zZXBoY3NpYmxlQGdtYWls
LmNvbT4NCj4gQ2M6IEthaWxhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+OyBCYWdhcyBTYW5qYXlh
IDxiYWdhc2RvdG1lQGdtYWlsLmNvbT47DQo+IHJlZ3Jlc3Npb25zQGxpc3RzLmxpbnV4LmRldjsg
cGVyZXhAcGVyZXguY3o7IHRpd2FpQHN1c2UuY29tOw0KPiBhbHNhLWRldmVsQGFsc2EtcHJvamVj
dC5vcmcNCj4gU3ViamVjdDogUmU6IEZ3ZDogW0J1ZyAyMTc0NDBdIE5ldzogQUxDMjM2IGF1ZGlv
IGRpc2FwcGVhcnMgZnJvbSBIUA0KPiAxNXotZmMwMDAgb24gd2FybSBib290DQo+IA0KPiANCj4g
RXh0ZXJuYWwgbWFpbC4NCj4gDQo+IA0KPiANCj4gT24gU2F0LCAyNCBKdW4gMjAyMyAwMzozNjox
MSArMDIwMCwNCj4gSm9zZXBoIEMuIFNpYmxlIHdyb3RlOg0KPiA+DQo+ID4gT24gU3VuLCBKdW4g
MTEsIDIwMjMgYXQgMzozNuKAr0FNIFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4gd3JvdGU6
DQo+ID4gPg0KPiA+ID4gVGhhbmtzIGZvciBjaGVja2luZy4gIFNvIHRoZSBhZGRpdGlvbmFsIGRl
bGF5IGRpZG4ndCBoZWxwIGF0IGFsbCwNCj4gPiA+IGkuZS4gaXQncyBubyB0aW1pbmcgaXNzdWUu
ICBXZSBuZWVkIHRvIGZpZ3VyZSBvdXQgd2hpY2ggdmVyYg0KPiA+ID4gYWN0dWFsbHkgYnJlYWtz
IHRoaW5ncy4gIE9oIHdlbGwuDQo+ID4NCj4gPiBXYXMgdGhlcmUgc29tZXRoaW5nIGVsc2Ugc3Bl
Y2lmaWMgeW91IHdhbnRlZCBtZSB0byB0cnkgZm9yIHRoaXM/IElmDQo+ID4gbm90LCB3aGF0IGRv
IHlvdSB0aGluayB0aGUgbmV4dCBzdGVwcyB0byBnZXQgdGhpcyBmaXhlZCBhcmU/IERvIHlvdQ0K
PiA+IHRoaW5rIGl0IG1pZ2h0IGJlIGdvb2QgdG8ganVzdCBjb29rIHRoZSBwYXJ0aWFsIHJldmVy
dCBJIHBvc3RlZCBhDQo+ID4gd2hpbGUgYmFjayBhZnRlciBhbGw/DQo+IA0KPiBJdCdzIHJhdGhl
ciBhIGNhbGwgdG8gS2FpbGFuZywgYWZ0ZXIgYWxsLg0KPiBJJ20gZmluZSB3aXRoIGFueSB3YXkg
YXMgbG9uZyBhcyBpdCBhdm9pZHMgZnVydGhlciByZWdyZXNzaW9ucy4NCj4gDQo+IA0KPiBUYWth
c2hpDQo+IA0KPiAtLS0tLS1QbGVhc2UgY29uc2lkZXIgdGhlIGVudmlyb25tZW50IGJlZm9yZSBw
cmludGluZyB0aGlzIGUtbWFpbC4NCg==
