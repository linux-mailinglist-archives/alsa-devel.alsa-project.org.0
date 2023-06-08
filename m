Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E0E727746
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 08:33:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD07E822;
	Thu,  8 Jun 2023 08:32:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD07E822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686206005;
	bh=3EqB7pWsNSEmFZA/f+c60MmsnqyYvg6PMP9T77NAd+0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p6RuDrPygxxDOAJdnr/YJuAe9GffQ7aIGl37TFwHSpKJRI5aJsvhJNf+SnjfSKQAt
	 Bj0pA85ZNwAMRLy9lYykob33KkqvAivx1EzMusrE3C6ea/9/ir+nohSmMVuAFHSvzF
	 c0xh4HLs1ZZc6bQkideGPpLYBmGxFxrggibaF46E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEE06F804DA; Thu,  8 Jun 2023 08:32:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55585F80130;
	Thu,  8 Jun 2023 08:32:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7206F8016C; Thu,  8 Jun 2023 08:32:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA40EF80130
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 08:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA40EF80130
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 3586VkR62004432,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 3586VkR62004432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Thu, 8 Jun 2023 14:31:46 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Thu, 8 Jun 2023 14:32:02 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 8 Jun 2023 14:32:02 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::4d7:e49a:674a:598]) by
 RTEXMBS01.realtek.com.tw ([fe80::4d7:e49a:674a:598%5]) with mapi id
 15.01.2375.007; Thu, 8 Jun 2023 14:32:02 +0800
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
 AQHZhdSOD7kY6mXBDkGA3ryhp811r69Yu5SAgAASNACAAA22gIAA7n+AgAEJrYCABLe/YIAJNIWAgAIHAcD//4tyAIAB8UZw///vxgCADzWhgIABfgWAgACUPoCAAPnsAIAAmlKwgAA8s4CAAQ8boP//kIuAABWnYVA=
Date: Thu, 8 Jun 2023 06:32:02 +0000
Message-ID: <3c27f0455d6e4bd1a68115bd25bf1a12@realtek.com>
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
In-Reply-To: 
 <CABpewhGiMJUpyBA6=D9_-YA6=5rjR2R0RHUZeg+cWcjtzuCoZQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS05.realtek.com.tw, 9
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
Message-ID-Hash: 4JAAFE4ML5UD4VMANCW3M7LKS7SV4SNL
X-Message-ID-Hash: 4JAAFE4ML5UD4VMANCW3M7LKS7SV4SNL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4JAAFE4ML5UD4VMANCW3M7LKS7SV4SNL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgSm9zZXBoLA0KDQpDb3VsZCB5b3UgdXNlIHlvdXIgcGF0Y2ggdG8gZHVtcCBjb2RlYyBpbmZv
IGFnYWluPw0KSSB3YW50IHRvIGNoZWNrIGl0IHdpbGwgYWxzbyBzaG93ICJpbnZhbGlkIEFGRyBz
dWJ0cmVlIi4NCg0KVGhhbmtzLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IEpvc2VwaCBDLiBTaWJsZSA8am9zZXBoY3NpYmxlQGdtYWlsLmNvbT4NCj4gU2VudDogVGh1
cnNkYXksIEp1bmUgOCwgMjAyMyAxMjowOCBQTQ0KPiBUbzogS2FpbGFuZyA8a2FpbGFuZ0ByZWFs
dGVrLmNvbT4NCj4gQ2M6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT47IEJhZ2FzIFNhbmph
eWEgPGJhZ2FzZG90bWVAZ21haWwuY29tPjsNCj4gcmVncmVzc2lvbnNAbGlzdHMubGludXguZGV2
OyBwZXJleEBwZXJleC5jejsgdGl3YWlAc3VzZS5jb207DQo+IGFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogRndkOiBbQnVnIDIxNzQ0MF0gTmV3OiBBTEMyMzYgYXVk
aW8gZGlzYXBwZWFycyBmcm9tIEhQDQo+IDE1ei1mYzAwMCBvbiB3YXJtIGJvb3QNCj4gDQo+IA0K
PiBFeHRlcm5hbCBtYWlsLg0KPiANCj4gDQo+IA0KPiBPbiBXZWQsIEp1biA3LCAyMDIzIGF0IDEw
OjQ44oCvUE0gS2FpbGFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBD
b3VsZCB5b3UgYWxzbyB1c2UgYWxzYS1pbmZvLnNoIHRvIGR1bXAgY29kZWMgaW5mbz8NCj4gDQo+
IERvIHlvdSBtZWFuIHJ1bm5pbmcgaXQgdGhlIHNhbWUgd2F5IGFzIGJlZm9yZSwgYnV0IHVuZGVy
IHRoZSBrZXJuZWwgd2l0aA0KPiB5b3VyIHR3byBwYXRjaGVzPyBBc3N1bWluZyBzbywgdGhlIHJl
c3VsdCBpcyBhdHRhY2hlZC4NCj4gDQo+IFRoYW5rcywNCj4gDQo+IEpvc2VwaCBDLiBTaWJsZQ0K
PiANCj4gLS0tLS0tUGxlYXNlIGNvbnNpZGVyIHRoZSBlbnZpcm9ubWVudCBiZWZvcmUgcHJpbnRp
bmcgdGhpcyBlLW1haWwuDQo=
