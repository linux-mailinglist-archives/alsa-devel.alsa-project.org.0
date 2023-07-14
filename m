Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7520752F83
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 04:48:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6567AE8;
	Fri, 14 Jul 2023 04:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6567AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689302892;
	bh=4KQo5oyHvxtO1rUp/Uub6hp3Bza7px2ErGvRSaIP+g8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PsvTtaHfgJQ9l8xri1QR1zsDILb2rCKA/3NxLm4tescWl6mbEsULys3o3lJaSfy2m
	 HrFJmw/AuIDAhf1gzXqVUDXbWv8Aes6b6E6E4ssii2j/TRCNpGLxGNs7Nu5li2RrPa
	 jR4aZ/D5qaT4daNEeyagBwIQnvjNWyDT/9iDoemc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 801F8F80544; Fri, 14 Jul 2023 04:46:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70610F80236;
	Fri, 14 Jul 2023 04:46:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8B31F80249; Fri, 14 Jul 2023 04:46:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id 42F26F80153
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 04:46:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42F26F80153
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 36E2kJvC5023866,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 36E2kJvC5023866
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Fri, 14 Jul 2023 10:46:19 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 14 Jul 2023 10:46:25 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 14 Jul 2023 10:46:25 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b]) by
 RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b%5]) with mapi id
 15.01.2375.007; Fri, 14 Jul 2023 10:46:25 +0800
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
 AQHZhdSOD7kY6mXBDkGA3ryhp811r69Yu5SAgAASNACAAA22gIAA7n+AgAEJrYCABLe/YIAJNIWAgAIHAcD//4tyAIAB8UZw///vxgCADzWhgIABfgWAgACUPoCAAPnsAIAAmlKwgAA8s4CAAQ8boP//kIuAABWnYVAAAIR9gAAqhW/A//+7roD//3k98IAAkYyAgAAKhQCAAAZZgIAAiY6AgADw04CAALC0AIAA6TqAgBQJp4CAAhpFAP/xaKKggBysdYD/8VrnoAO7qooA//9fxNA=
Date: Fri, 14 Jul 2023 02:46:25 +0000
Message-ID: <1f83caa215ad4374aec8859c70044b00@realtek.com>
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
 <009474f04d0b45c69a0e42e8622b7a86@realtek.com> <87h6rhcef2.wl-tiwai@suse.de>
 <0990300d759846d890de9c92fcad9a9d@realtek.com>
 <CABpewhERnOH1qkkJ5_JJUZkz1_8oxD9aR5VBs1vsURAG7Eu_Ew@mail.gmail.com>
 <878rctcavz.wl-tiwai@suse.de> <874jnhc9u4.wl-tiwai@suse.de>
 <CABpewhHG2+s8_6r6vChm2g5tD8ALW_SWJWubPRXWzTJB2aFR9g@mail.gmail.com>
 <875y7vbxpg.wl-tiwai@suse.de>
 <CABpewhHDnvn4v+uCpsaLHB+biw-f59tdTiCyFkicHnewXHYDNg@mail.gmail.com>
 <87wn0aa1s4.wl-tiwai@suse.de>
 <CABpewhFg=7+JR6v=zhi0_Hm9+S64DLOHKeG2pS-W7z-vNpu_5Q@mail.gmail.com>
 <87leg7x4h7.wl-tiwai@suse.de> <f4969213b5a14cc5a11befb4df861481@realtek.com>
 <87cz182hfk.wl-tiwai@suse.de> <4678992299664babac4403d9978e7ba7@realtek.com>
 <CABpewhGkw2rg_NN7Rd8E_p+AN9MC0A1CjgnrhBvMnSKq0gz31w@mail.gmail.com>
In-Reply-To: 
 <CABpewhGkw2rg_NN7Rd8E_p+AN9MC0A1CjgnrhBvMnSKq0gz31w@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
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
Message-ID-Hash: 6VKEJYVRO2OKMCVVF2563HV6EQSU7TFX
X-Message-ID-Hash: 6VKEJYVRO2OKMCVVF2563HV6EQSU7TFX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6VKEJYVRO2OKMCVVF2563HV6EQSU7TFX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgVGFrYXNoaSwNCg0KQ291bGQgeW91IGFncmVlIHRoaXMgd29ya2Fyb3VuZD8NCg0KQlIsDQpL
YWlsYW5nDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9zZXBoIEMu
IFNpYmxlIDxqb3NlcGhjc2libGVAZ21haWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEp1bHkgMTQs
IDIwMjMgOToxMSBBTQ0KPiBUbzogS2FpbGFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4NCj4gQ2M6
IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT47IEJhZ2FzIFNhbmpheWEgPGJhZ2FzZG90bWVA
Z21haWwuY29tPjsNCj4gcmVncmVzc2lvbnNAbGlzdHMubGludXguZGV2OyBwZXJleEBwZXJleC5j
ejsgdGl3YWlAc3VzZS5jb207DQo+IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZw0KPiBTdWJq
ZWN0OiBSZTogRndkOiBbQnVnIDIxNzQ0MF0gTmV3OiBBTEMyMzYgYXVkaW8gZGlzYXBwZWFycyBm
cm9tIEhQDQo+IDE1ei1mYzAwMCBvbiB3YXJtIGJvb3QNCj4gDQo+IA0KPiBFeHRlcm5hbCBtYWls
Lg0KPiANCj4gDQo+IA0KPiBPbiBUaHUsIEp1bCAxMywgMjAyMyBhdCA0OjI14oCvQU0gS2FpbGFu
ZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBKb3NlcGgsDQo+ID4N
Cj4gPiBDb3VsZCB5b3UgdGVzdCBhdHRhY2ggcGF0Y2g/DQo+ID4NCj4gPiBCUiwNCj4gPiBLYWls
YW5nDQo+IA0KPiBJIGFwcGxpZWQgdGhhdCBwYXRjaCBvbiB0b3Agb2Yga2VybmVsIDYuNC4zIGFu
ZCB0ZXN0ZWQgaXQsIGFuZCB5ZXMsIGl0IGRvZXMgZml4IHRoZQ0KPiBwcm9ibGVtLg0KPiANCj4g
VGhhbmtzLA0KPiANCj4gSm9zZXBoIEMuIFNpYmxlDQo+IA0KPiAtLS0tLS1QbGVhc2UgY29uc2lk
ZXIgdGhlIGVudmlyb25tZW50IGJlZm9yZSBwcmludGluZyB0aGlzIGUtbWFpbC4NCg0K
