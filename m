Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B27D75CBDA
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 17:35:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D609B1FC;
	Fri, 21 Jul 2023 17:35:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D609B1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689953750;
	bh=irLPeFYdIAVMeHehinj1el/hcOVoBMIexeNX0/wGQZA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J4mGkZj1xBhGi5Jwln4w+oyqbQUsiJGQ9O8Bc+jPu6CE8+J3WyTERoEC2SzWyZuSC
	 CZ1ZvCtTiNActawDFGM2+l2gGK5yU5TSonLcNAveKNhTGx86vn0TfHBB5X7J12Tl3x
	 R0atxtcv9EZ8RGoFX1BoGmy26tSZQ2RlrXhipDS8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D704F8053B; Fri, 21 Jul 2023 17:35:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AACCDF8007E;
	Fri, 21 Jul 2023 17:34:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42432F8047D; Fri, 21 Jul 2023 17:34:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id 663D6F8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 17:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 663D6F8007E
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 36LFYSDO0000343,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 36LFYSDO0000343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Fri, 21 Jul 2023 23:34:28 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 21 Jul 2023 23:34:38 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 21 Jul 2023 23:34:37 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b]) by
 RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b%5]) with mapi id
 15.01.2375.007; Fri, 21 Jul 2023 23:34:37 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        =?big5?B?RGVyZWsgW6TovHe4cV0=?=
	<derek.fang@realtek.com>,
        "Vijendar.Mukunda@amd.com"
	<Vijendar.Mukunda@amd.com>
Subject: RE: [PATCH 2/2] ASoC: rt1316: fix key tone missing
Thread-Topic: [PATCH 2/2] ASoC: rt1316: fix key tone missing
Thread-Index: AQHZu6vl7r7DyBPZ9UCV8ccGbVFWQa/DjJkAgABHqRA=
Date: Fri, 21 Jul 2023 15:34:37 +0000
Message-ID: <423480b14c6c4a7ab4d9bfcf8b29cccb@realtek.com>
References: <20230721081807.113125-1-shumingf@realtek.com>
 <3f407d2e-fe11-4ad1-8fb3-561053d343a9@sirena.org.uk>
In-Reply-To: <3f407d2e-fe11-4ad1-8fb3-561053d343a9@sirena.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.209]
x-kse-serverinfo: RTEXMBS02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: UVTH74PGRM7DM55W2BGUXGBPKNEYL6YX
X-Message-ID-Hash: UVTH74PGRM7DM55W2BGUXGBPKNEYL6YX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UVTH74PGRM7DM55W2BGUXGBPKNEYL6YX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiA+IEZyb206IFNodW1pbmcgRmFuIDxzaHVtaW5nZkByZWFsdGVrLmNvbT4NCj4gPg0KPiA+IFRo
aXMgcGF0Y2ggZGlzYWJsZXMgdGhlIHNvZnQgcmFtcCB0byBvdXRwdXQgaW1tZWRpYXRlbHkuDQo+
IA0KPiA+ICAJeyAweGMwOWQsIDB4ODAgfSwNCj4gPiAgCXsgMHhjMGIwLCAweDc3IH0sDQo+ID4g
LQl7IDB4YzAxMCwgMHhhNSB9LA0KPiA+ICsJeyAweGMwMTAsIDB4MjUgfSwNCj4gPiAgCXsgMHhj
MDUwLCAweDgzIH0sDQo+IA0KPiBUaGlzIHNob3VsZCBwcm9iYWJseSBiZSBhbiBhY3R1YWwgY29u
dHJvbCBub3Qgc29tZXRoaW5nIHBhdGNoZWQgaW50byB0aGUNCj4gcmVnaXN0ZXJzIC0gc29tZSB1
c2VycyBtaWdodCBwcmVmZXIgdG9lIHNvZnQgcmFtcC4NCg0KR290IGl0LiBJIHdpbGwgYWRkIGEg
bWl4ZXIgY29udHJvbCBmb3IgaXQuIFRoYW5rcy4NCg0KPiAtLS0tLS1QbGVhc2UgY29uc2lkZXIg
dGhlIGVudmlyb25tZW50IGJlZm9yZSBwcmludGluZyB0aGlzIGUtbWFpbC4NCg==
