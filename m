Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E668FC60B
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2024 10:23:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5385186F;
	Wed,  5 Jun 2024 10:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5385186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717575810;
	bh=1VWkI20Y3UKeNUj40Pmduc97qSqybrJnaaEI3dhgrCM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kAujzlkqBODLNiACYgec94F58IhHLaeusgsINOYkh1xsPG4Eywox7HetESFj7ftl8
	 fZGoo/YSsodofp3J2m9dbcsnzsve36GbHZ0HJ2UEnl0tAVnJvM1LKJUXTBMzt7CBxG
	 zD0aRHsEP+lXqh8CgQjGfyOEvYYOiKqn3ggRvCRo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 398C1F8057A; Wed,  5 Jun 2024 10:23:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 670F4F8059F;
	Wed,  5 Jun 2024 10:23:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 208E0F802DB; Wed,  5 Jun 2024 10:23:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0
	tests=RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 780CEF800AC
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 10:22:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 780CEF800AC
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4558MkghE1288411,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 4558MkghE1288411
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 16:22:46 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 16:22:46 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 5 Jun 2024 16:22:46 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975]) by
 RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975%5]) with mapi id
 15.01.2507.035; Wed, 5 Jun 2024 16:22:46 +0800
From: Jack Yu <jack.yu@realtek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?=
	<shumingf@realtek.com>,
        =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?=
	<derek.fang@realtek.com>
Subject: RE: [PATCH] ASoC: rt1318: Add RT1318 audio amplifier driver
Thread-Topic: [PATCH] ASoC: rt1318: Add RT1318 audio amplifier driver
Thread-Index: Adq2Rs/8n9D0p31EQZaWG09Bfd/1VwAksJYAABH0cFA=
Date: Wed, 5 Jun 2024 08:22:45 +0000
Message-ID: <951b8afa48374fcf9da09f1f4a19dff1@realtek.com>
References: <c6d0e09de01c4804bfff6efe92fff04c@realtek.com>
 <e20101f0-8a86-435c-b8c8-25f82ff2a775@linux.intel.com>
In-Reply-To: <e20101f0-8a86-435c-b8c8-25f82ff2a775@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.22.102.102]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: AVU3QL3MFSAFFCY2HVZKGBP3BHRVF7F3
X-Message-ID-Hash: AVU3QL3MFSAFFCY2HVZKGBP3BHRVF7F3
X-MailFrom: jack.yu@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVU3QL3MFSAFFCY2HVZKGBP3BHRVF7F3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiA+ICtzdHJ1Y3QgcnQxMzE4X2luaXRfcmVnIHsNCj4gPiArICAgICB1MzIgcmVnOw0KPiA+ICsg
ICAgIHU4IHZhbDsNCj4gPiArICAgICB1OCBkZWxheTsNCj4gPiArfTsNCj4gDQo+IFRoYXQgbG9v
a3MgbGlrZSBhICdzdHJ1Y3QgcmVnX3NlcXVlbmNlJyA/DQo+IA0KPiA+ICtzdGF0aWMgc3RydWN0
IHJ0MTMxOF9pbml0X3JlZyBpbml0X2xpc3RbXSA9IHsNCj4gPiArICAgICB7IDB4MDAwMEMwMDAs
IDB4MDEsIDB9LA0KPiA+ICsgICAgIHsgMHgwMDAwRjIwRCwgMHgwMCwgMH0sDQo+ID4gKyAgICAg
eyAweDAwMDBGMjEyLCAweDNFLCAwfSwNCj4gDQo+IC4uLg0KPiANCj4gPiArDQo+ID4gK3N0YXRp
YyBpbnQgcnQxMzE4X3JlZ19pbml0KHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50
KSB7DQo+ID4gKyAgICAgc3RydWN0IHJ0MTMxOF9wcml2ICpydDEzMTggPQ0KPiBzbmRfc29jX2Nv
bXBvbmVudF9nZXRfZHJ2ZGF0YShjb21wb25lbnQpOw0KPiA+ICsgICAgIGludCBpOw0KPiA+ICsN
Cj4gPiArICAgICBmb3IgKGkgPSAwOyBpIDwgcnQxMzE4X0lOSVRfUkVHX0xFTjsgaSsrKSB7DQo+
ID4gKyAgICAgICAgICAgICByZWdtYXBfd3JpdGUocnQxMzE4LT5yZWdtYXAsIGluaXRfbGlzdFtp
XS5yZWcsDQo+IGluaXRfbGlzdFtpXS52YWwpOw0KPiA+ICsgICAgICAgICAgICAgbWRlbGF5KGlu
aXRfbGlzdFtpXS5kZWxheSk7DQo+ID4gKyAgICAgfQ0KPiA+ICsNCj4gPiArICAgICByZXR1cm4g
MDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCByZWdfZGVmYXVsdCBy
dDEzMThfcmVnW10gPSB7DQo+ID4gKyAgICAgeyAweGMwMDAsIDB4MDAgfSwNCj4gPiArICAgICB7
IDB4YzAwMSwgMHg0MyB9LA0KPiA+ICsgICAgIHsgMHhjMDAzLCAweDIyIH0sDQo+ID4gKyAgICAg
eyAweGMwMDQsIDB4NDQgfSwNCj4gDQo+IC4uLg0KPiANCj4gPiArICAgICB7IDB4ZjIwZCwgMHgw
MCB9LA0KPiA+ICsgICAgIHsgMHhmMjEyLCAweDAwIH0sDQo+ID4gKyAgICAgeyAweGYyMWEsIDB4
MDAgfSwNCj4gPiArICAgICB7IDB4ZjIyMywgMHg0MCB9LA0KPiANCj4gQW5kIHRoaXMgbG9va3Mg
dG8gbWUgYXMgYXMgYSBzZXQgb2YgZGVmYXVsdHMgcGF0Y2hlcyBieSBhIHJlZ19zZXF1ZW5jZSAt
IHNpbWlsYXINCj4gdG8gd2hhdCBpcyBkb25lIGZvciBydDEzMDggYW5kIHJ0MTMxNi4NCj4gDQo+
IElzIHRoZXJlIGFueSBvcHBvcnR1bml0eSB0byB1c2UgcmVnbWFwX3JlZ2lzdGVyX3BhdGNoKCkg
aW5zdGVhZCBvZg0KPiBvcGVuLWNvZGluZyB0aGUgbG9vcD8NCg0KT0ssIEknbGwgaW5jbHVkZSB0
aGlzIG1vZGlmaWNhdGlvbiBpbiB0aGUgdjIgcGF0Y2gsIHRoYW5rcy4NCg==
