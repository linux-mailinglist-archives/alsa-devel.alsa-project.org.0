Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DC0745CC0
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 15:01:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 650547F4;
	Mon,  3 Jul 2023 15:01:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 650547F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688389312;
	bh=vgROC3abPrL7rEKuFW3SD7nzAQDWgGeZ5Tc10//UokM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l48cQgOgQE2H3CjtFWHUB+TaUROFC3h7o1LCJnVvPaPOSb583Du8JJQJxMGPgYu+0
	 rq0Mk8Uhm7E18tmm/WXUtR5RWGM3UcB97yAureJecxOPb/W0h3D0VJ7r9aT+boOSDa
	 219VTpoQ0C4HCINKu1ZAqR0eE5y/cVXQ0Ta4y+PY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A212F80272; Mon,  3 Jul 2023 15:01:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2A7CF80124;
	Mon,  3 Jul 2023 15:01:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9078F80125; Mon,  3 Jul 2023 15:00:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id 91B09F80093
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 15:00:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91B09F80093
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 363D0dC62030772,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 363D0dC62030772
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Mon, 3 Jul 2023 21:00:39 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 3 Jul 2023 21:00:42 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 3 Jul 2023 21:00:38 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b]) by
 RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b%5]) with mapi id
 15.01.2375.007; Mon, 3 Jul 2023 21:00:38 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
        "Vijendar.Mukunda@amd.com" <Vijendar.Mukunda@amd.com>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>
Subject: RE: [PATCH 1/5] ASoC: rt5682-sdw: fix for JD event handling in
 ClockStop Mode0
Thread-Topic: [PATCH 1/5] ASoC: rt5682-sdw: fix for JD event handling in
 ClockStop Mode0
Thread-Index: AQHZrY0mkMFxejyTy0SnKAzp66jWka+nTd4AgACKNRD//5mEgIAAjADA
Date: Mon, 3 Jul 2023 13:00:38 +0000
Message-ID: <1fb4d8ea138140d291a395dc82e710ae@realtek.com>
References: <20230703090247.25261-1-shumingf@realtek.com>
 <f9e83b61-6e69-2467-d5a5-3c3a6a40e018@linux.intel.com>
 <81bf0fcc0b824c928e2e4e5a77ca37d8@realtek.com>
 <a10894a2-a6af-8c5f-b675-79cc7cfeb899@linux.intel.com>
In-Reply-To: <a10894a2-a6af-8c5f-b675-79cc7cfeb899@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.209]
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: T3ZOBFCZO6J3EBAKSKMWG27EU7EWS2Y5
X-Message-ID-Hash: T3ZOBFCZO6J3EBAKSKMWG27EU7EWS2Y5
X-MailFrom: shumingf@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T3ZOBFCZO6J3EBAKSKMWG27EU7EWS2Y5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiA+Pj4gRHVyaW5nIENsb2NrU3RvcCBNb2RlMCwgcGVyaXBoZXJhbCBpbnRlcnJ1cHRzIGFyZSBk
aXNhYmxlZC4NCj4gPj4NCj4gPj4gSSBjYW4gc2VlIHRoYXQgdGhlIGludGVycnVwdHMgYXJlIGRp
c2FibGVkIGluDQo+ID4+IHJ0NTY4Ml9kZXZfc3lzdGVtX3N1c3BlbmQoKSwgd2hpY2ggaXMgTk9U
IGEgbW9kZSB3aGVyZSB0aGUgY2xvY2sgc3RvcA0KPiA+PiBpcyB1c2VkLi4uIEkgZG9uJ3QgdGhp
bmsgdGhpcyBjb21taXQgbWVzc2FnZSBpcyBjb3JyZWN0Lg0KPiA+Pg0KPiA+PiBUaGUgSU1QTF9E
RUYgaW50ZXJydXB0IHdoaWNoIGlzIHVzZWQgZm9yIGphY2sgZGV0ZWN0aW9uIGlzIG5vdA0KPiA+
PiBkaXNhYmxlZCBhdCBhbGwgZHVyaW5nIGFueSBjbG9jayBzdG9wIG1vZGUsIGFuZCBpdCBzaG91
bGRuJ3QNCj4gPj4gb3RoZXJ3aXNlIHRoYXQgd291bGQgYnJlYWsgdGhlIGphY2sgZGV0ZWN0aW9u
Lg0KPiA+DQo+ID4gWW91IGFyZSByaWdodC4gVGhlIGNvbW1pdCBtZXNzYWdlIGlzIHdyb25nIGFu
ZCBub3QgY2xlYXIuDQo+ID4gVGhlIHNpdHVhdGlvbiBpcyB0aGF0IHRoZSBtYW5hZ2VyIGRyaXZl
ciB1c2VzIHRoZSBjbG9jayBzdG9wIG1vZGUwIHRvIGRvDQo+IHN5c3RlbSBzdXNwZW5zaW9uLg0K
PiANCj4gTm8gaXQgZG9lcyBub3QuIFRoZSBjbG9jayBzdG9wIGlzIE9OTFkgdXNlZCBmb3IgcG1f
cnVudGltZSwgbmV2ZXIgZm9yIHN5c3RlbQ0KPiBzdXNwZW5kLiBXZSBjYW5ub3QgZ28gdG8gc3lz
dGVtIHN1c3BlbmQgd2l0aCB0aGUgbGluayBpbiBjbG9jay1zdG9wIG1vZGUsDQo+IHRoYXQgd2ls
bCBjcmVhdGUgbG90cyBvZiBpc3N1ZXMsIHRoYXQncyB3aHkgd2UgcGVyZm9ybSBhIGZ1bGwgcG1f
cnVudGltZSByZXN1bWUNCj4gaW4gdGhlIC5wcmVwYXJlIHN0YWdlLg0KDQpPSywgSSBnb3QgeW91
ciBwb2ludC4gVGhhbmtzLiBIb3dldmVyLCB0aGlzIGlzc3VlIHJlcG9ydGVkIGJ5IEFNRC4gDQpU
aGUgQU1EIHBsYXRmb3JtIHZhbGlkYXRlZCBzeXN0ZW0gbGV2ZWwgcG0gYW5kIHJ1bnRpbWUgcG0g
b3BzIHdpdGggdGhlIGRpZmZlcmVudCBtb2Rlcy4NCg0KSGkgVmlqZW5kYXIsDQpEbyB5b3UgaGF2
ZSBhbnkgY29tbWVudHM/DQoNCj4gPiBUaGUgU2RXIGRldmljZSB3aWxsIG5vdCBiZSByZS1hdHRh
Y2hlZCB3aGVuIHRoZSBzeXN0ZW0gcmVzdW1lLg0KPiANCj4gaXQgd2lsbCByZS1hdHRhY2gsIGFu
ZCBpbiBhZGRpdGlvbiBpdCB3aWxsIGxvc2UgY29udGV4dCBiZWNhdXNlIHRoZSBtYW5hZ2VyDQo+
IHBlcmZvcm1zIGEgY29tcGxldGUgcmVzZXQgb2YgdGhlIGJ1cy4NCj4gDQo+IFNvIHdoYXQncyBu
ZWVkZWQgaXMgdG8gZW5hYmxlIHRoZSBpbnRlcnJ1cHQsIG5vIG1hdHRlciB3aGF0IGhhcHBlbmVk
IGluIHRoZQ0KPiBzdXNwZW5kIHRyYW5zaXRpb24uDQo+IA0KPiANCj4gLS0tLS0tUGxlYXNlIGNv
bnNpZGVyIHRoZSBlbnZpcm9ubWVudCBiZWZvcmUgcHJpbnRpbmcgdGhpcyBlLW1haWwuDQo=
