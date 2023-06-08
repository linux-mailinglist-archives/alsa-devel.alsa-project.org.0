Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E90F1727742
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 08:29:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA4E51D9;
	Thu,  8 Jun 2023 08:28:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA4E51D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686205765;
	bh=DMcewaqRBXLrPsOlOFgt5IZJq0ftk6Bp6vxNYM6Sig8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HRv1wsljBkdHaG92B5Wya5doaAVW4ddaB6+cJmDYzfFDVAysrQW3rDvh+N9Z0/kAc
	 x/gk6ZQtmLZlkWvNlGPxgzs3gkiWMdFr1Z4v+ZK7GXg3oxWEycX6/c8tkN7xeeds3A
	 UIVZqRPC1A5uXWeBjhijFxhM7jt7R82gOE6BFQL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47624F804DA; Thu,  8 Jun 2023 08:28:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B0CDF8016C;
	Thu,  8 Jun 2023 08:28:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFDCFF80199; Thu,  8 Jun 2023 08:28:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 70704F80130
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 08:28:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70704F80130
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 3586RpNH2030814,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 3586RpNH2030814
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Thu, 8 Jun 2023 14:27:51 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Thu, 8 Jun 2023 14:28:07 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 8 Jun 2023 14:28:07 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::4d7:e49a:674a:598]) by
 RTEXMBS01.realtek.com.tw ([fe80::4d7:e49a:674a:598%5]) with mapi id
 15.01.2375.007; Thu, 8 Jun 2023 14:28:07 +0800
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
 AQHZhdSOD7kY6mXBDkGA3ryhp811r69Yu5SAgAASNACAAA22gIAA7n+AgAEJrYCABLe/YIAJNIWAgAIHAcD//4tyAIAB8UZw///vxgCADzWhgIABfgWAgACUPoCAAPnsAIAAmlKwgAA8s4CAAQ8boP//kIuAABWRMLA=
Date: Thu, 8 Jun 2023 06:28:07 +0000
Message-ID: <5a4cbd6c668940c2904f74e4c366dc3f@realtek.com>
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
x-kse-serverinfo: RTEXMBS06.realtek.com.tw, 9
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
Message-ID-Hash: 4A64Y2IXRMIK3LCIQJ5KRCRF4AKREXXC
X-Message-ID-Hash: 4A64Y2IXRMIK3LCIQJ5KRCRF4AKREXXC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4A64Y2IXRMIK3LCIQJ5KRCRF4AKREXXC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgVGFrYXNoaSwNCg0KRG8geW91IGtub3cgd2h5IHRoaXMgbWFjaGluZSBzaG93ICJpbnZhbGlk
IEFGRyB0cmVlIiBhcyBiZWxvdz8NCg0KQ29kZWM6IFJlYWx0ZWsgQUxDMjM2DQpBZGRyZXNzOiAw
DQpBRkcgRnVuY3Rpb24gSWQ6IDB4MSAodW5zb2wgMSkNClZlbmRvciBJZDogMHgxMGVjMDIzNg0K
U3Vic3lzdGVtIElkOiAweDEwM2M4YjJmDQpSZXZpc2lvbiBJZDogMHgxMDAwMDINCk5vIE1vZGVt
IEZ1bmN0aW9uIEdyb3VwIGZvdW5kDQpEZWZhdWx0IFBDTToNCiAgICByYXRlcyBbMHhlMDVdOiA4
MDAwIDE2MDAwIDE3NjQwMCAxOTIwMDAgMzg0MDAwDQogICAgYml0cyBbMHgwXToNCiAgICBmb3Jt
YXRzIFsweDVdOiBQQ00gQUMzDQpEZWZhdWx0IEFtcC1JbiBjYXBzOiBvZnM9MHgwNSwgbnN0ZXBz
PTB4N2UsIHN0ZXBzaXplPTB4MDAsIG11dGU9MA0KRGVmYXVsdCBBbXAtT3V0IGNhcHM6IG9mcz0w
eDA1LCBuc3RlcHM9MHg3ZSwgc3RlcHNpemU9MHgwMCwgbXV0ZT0wDQpTdGF0ZSBvZiBBRkcgbm9k
ZSAweDAxOg0KICBQb3dlciBzdGF0ZXM6ICBEMCBEMiAobnVsbCkgKG51bGwpIChudWxsKSAobnVs
bCkgKG51bGwpIChudWxsKSAobnVsbCkNCiAgUG93ZXI6IHNldHRpbmc9VU5LTk9XTiwgYWN0dWFs
PUQwLCBDbG9jay1zdG9wLU9LLCBTZXR0aW5nLXJlc2V0DQpJbnZhbGlkIEFGRyBzdWJ0cmVlDQot
LWVuZGNvbGxhcHNlLS0NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBK
b3NlcGggQy4gU2libGUgPGpvc2VwaGNzaWJsZUBnbWFpbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5
LCBKdW5lIDgsIDIwMjMgMTI6MDggUE0NCj4gVG86IEthaWxhbmcgPGthaWxhbmdAcmVhbHRlay5j
b20+DQo+IENjOiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+OyBCYWdhcyBTYW5qYXlhIDxi
YWdhc2RvdG1lQGdtYWlsLmNvbT47DQo+IHJlZ3Jlc3Npb25zQGxpc3RzLmxpbnV4LmRldjsgcGVy
ZXhAcGVyZXguY3o7IHRpd2FpQHN1c2UuY29tOw0KPiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5v
cmcNCj4gU3ViamVjdDogUmU6IEZ3ZDogW0J1ZyAyMTc0NDBdIE5ldzogQUxDMjM2IGF1ZGlvIGRp
c2FwcGVhcnMgZnJvbSBIUA0KPiAxNXotZmMwMDAgb24gd2FybSBib290DQo+IA0KPiANCj4gRXh0
ZXJuYWwgbWFpbC4NCj4gDQo+IA0KPiANCj4gT24gV2VkLCBKdW4gNywgMjAyMyBhdCAxMDo0OOKA
r1BNIEthaWxhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+IHdyb3RlOg0KPiA+DQo+ID4gQ291bGQg
eW91IGFsc28gdXNlIGFsc2EtaW5mby5zaCB0byBkdW1wIGNvZGVjIGluZm8/DQo+IA0KPiBEbyB5
b3UgbWVhbiBydW5uaW5nIGl0IHRoZSBzYW1lIHdheSBhcyBiZWZvcmUsIGJ1dCB1bmRlciB0aGUg
a2VybmVsIHdpdGgNCj4geW91ciB0d28gcGF0Y2hlcz8gQXNzdW1pbmcgc28sIHRoZSByZXN1bHQg
aXMgYXR0YWNoZWQuDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBKb3NlcGggQy4gU2libGUNCj4gDQo+
IC0tLS0tLVBsZWFzZSBjb25zaWRlciB0aGUgZW52aXJvbm1lbnQgYmVmb3JlIHByaW50aW5nIHRo
aXMgZS1tYWlsLg0K
