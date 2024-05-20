Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E938C9E94
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 16:06:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DC7B829;
	Mon, 20 May 2024 16:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DC7B829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716213997;
	bh=O2fPoQdesqwbjleNsg+Y+25oUi0CoQz+Z33oQKBT8SI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XhMdG5CGNdkn+ztUcMV+WYuZbsq+PTuRiSJj+FPx77S7MhmsDBld9kYQeygInX4Hb
	 OnCxTbbU2yyP3pSAxPdFunTlvq2q7ZVdIY3gLXcwfk4NTNiqfza9cHRJzJM1GnBnUx
	 MTsNTfM7gDplsCsLPxyOu6vmHiRDV8ojZ9ezXDLs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CFA7F805A0; Mon, 20 May 2024 16:06:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28099F8058C;
	Mon, 20 May 2024 16:06:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FC9AF8026A; Mon, 20 May 2024 16:05:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B340F800BA
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 16:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B340F800BA
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 44KE5BEa81440045,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 44KE5BEa81440045
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 May 2024 22:05:11 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 22:05:11 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 20 May 2024 22:05:10 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975]) by
 RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975%5]) with mapi id
 15.01.2507.035; Mon, 20 May 2024 22:05:10 +0800
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
        "pierre-louis.bossart@intel.com" <pierre-louis.bossart@intel.com>
Subject: RE: [PATCH v3] ASoC: rt1320: Add RT1320 SDCA vendor-specific driver
Thread-Topic: [PATCH v3] ASoC: rt1320: Add RT1320 SDCA vendor-specific driver
Thread-Index: AQHaqpagVGXofaeDr0uvFWrigAEwcbGflYkAgACR9wA=
Date: Mon, 20 May 2024 14:05:10 +0000
Message-ID: <b5e030a953eb4401862781bd88395ed6@realtek.com>
References: <20240520091801.399154-1-shumingf@realtek.com>
 <9853cf34-105f-4430-a232-af04c25a834b@linux.intel.com>
In-Reply-To: <9853cf34-105f-4430-a232-af04c25a834b@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.22.102.209]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: 2CNPDT7QCI4XRTGH3EZZ3FPI64ZFU2OR
X-Message-ID-Hash: 2CNPDT7QCI4XRTGH3EZZ3FPI64ZFU2OR
X-MailFrom: shumingf@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2CNPDT7QCI4XRTGH3EZZ3FPI64ZFU2OR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHNkd19kZXZpY2VfaWQgcnQxMzIwX2lkW10gPSB7DQo+
ID4gKyAgICAgU0RXX1NMQVZFX0VOVFJZX0VYVCgweDAyNWQsIDB4MTMyMCwgMHgzLCAweDAsIDAp
LA0KPiA+ICsgICAgIFNEV19TTEFWRV9FTlRSWV9FWFQoMHgwMjVkLCAweDEzMjAsIDB4MywgMHgx
LCAwKSwNCj4gPiArICAgICB7fSwNCj4gDQo+IFNvcnJ5LCBub3QgZm9sbG93aW5nIHdoeSBvbmUg
b2YgdGhlIHR3byBlbnRyaWVzIGluIHRoZSB0YWJsZSBpcyBhbiBTRENBIGNsYXNzDQo+IGRldmlj
ZSBhbmQgdGhlIG90aGVyIG5vdCAtIGJvdGggcmVseSBvbiBTRENBIGNvbnRyb2xzL2VudGl0aWVz
L2Z1bmN0aW9ucy9ldGMuDQo+IFRoYXQgZG9lc24ndCByZWFsbHkgYWxpZ24gd2l0aCB0aGUgbm90
aW9uIHRoYXQgVkEgYW5kIFZCIG9ubHkgZGlmZmVyIGJ5IHRoZWlyIERTUA0KPiBjYXBhYmlsaXRp
ZXMsIHNvIG5vdCBzdXJlIHdoYXQgdGhlIDAvMSBkaWZmZXJlbmNlIG1lYW5zLg0KDQpWQS9WQiB3
aWxsIHVzZSBjbGFzcyBpZCAwIGJlY2F1c2Ugb2YgdGhlIGhhcmR3YXJlIGlzc3VlLg0KVkMgd2ls
bCBmaXggdGhpcyBhbmQgdXNlIHRoZSBjbGFzcyBpZCAxLg0KDQo=
