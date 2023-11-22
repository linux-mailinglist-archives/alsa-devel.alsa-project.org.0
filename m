Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE897F468F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 13:47:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C21AAEA;
	Wed, 22 Nov 2023 13:46:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C21AAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700657222;
	bh=YeDwA7h+mJfKVOqSdP+QQ8+1BUdv0F2PYm7F5SLwlBY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tuOL+/NLd9y6qOhm+w06L8NCy9Hq9DpYOdoLVKoLBMkdhXWYkjt48uinNYXvLNy0T
	 +ueA0ar5oEn34JSDaV07VfTxm/CoCU9i6wRAn9vBdOLLS/yV/K5z4FMuwjwPnQuxcs
	 z8sQjVleoGZPK4lGZPaP1s7KYaJaBKJvMvtPeyXU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03041F80588; Wed, 22 Nov 2023 13:46:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAFB6F80254;
	Wed, 22 Nov 2023 13:46:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 987C2F802E8; Wed, 22 Nov 2023 13:46:23 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DFD5DF80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 13:46:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD5DF80093
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3AMCk1T412281166,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 3AMCk1T412281166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Nov 2023 20:46:01 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 22 Nov 2023 20:46:01 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 22 Nov 2023 20:46:00 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::540c:c8d6:1d0f:ab9f]) by
 RTEXMBS01.realtek.com.tw ([fe80::540c:c8d6:1d0f:ab9f%5]) with mapi id
 15.01.2507.034; Wed, 22 Nov 2023 20:46:00 +0800
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
        "yuhsuan@google.com" <yuhsuan@google.com>
Subject: RE: [PATCH] ASoC: rt5650: add mutex to avoid the jack detection
 failure
Thread-Topic: [PATCH] ASoC: rt5650: add mutex to avoid the jack detection
 failure
Thread-Index: AQHaHSrcwuoRVe7ZgUyrDS5zMoc+oLCFqpIAgAAYrLA=
Date: Wed, 22 Nov 2023 12:46:00 +0000
Message-ID: <2d297f62c3a94a94930e28ec4e838264@realtek.com>
References: <20231122100123.2831753-1-shumingf@realtek.com>
 <ZV3jVhAID+tWA9fI@finisterre.sirena.org.uk>
In-Reply-To: <ZV3jVhAID+tWA9fI@finisterre.sirena.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.22.102.209]
x-kse-serverinfo: RTEXMBS05.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: BUJ5TR5GAOBW6MGVM5T52HUTPORYL5XA
X-Message-ID-Hash: BUJ5TR5GAOBW6MGVM5T52HUTPORYL5XA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BUJ5TR5GAOBW6MGVM5T52HUTPORYL5XA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiA+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgamRfbXV0ZXggdG8gcHJvdGVjdCB0aGUgamFjayBkZXRl
Y3Rpb24gY29udHJvbCBmbG93Lg0KPiA+IEFuZCBvbmx5IHRoZSBoZWFkc2V0IHR5cGUgY291bGQg
Y2hlY2sgdGhlIGJ1dHRvbiBzdGF0dXMuDQo+IA0KPiBXaGF0J3MgdGhlIHByb3RlY3Rpb24gaGVy
ZSBmb3IgLSBhcyBmYXIgYXMgSSBjYW4gc2VlIHRoZSBtdXRleCBpcyBvbmx5IHRha2VuIGluDQo+
IHRoZSBqYWNrIGRldGVjdGlvbiB3b3JrIGZ1bmN0aW9uIHdoaWNoIHNob3VsZCBvbmx5IGV2ZXIg
aGF2ZSBvbmUgY29weSBydW5uaW5nDQo+IGF0IG9uY2UgYnkgdmlydHVlIG9mIGJlaW5nIGEgc2lu
Z2xlIHdvcmsgZnVuY3Rpb24/DQoNCkluIHRoZSBydDU2NDVfc3lzX3Jlc3VtZSBmdW5jdGlvbiwg
dGhlIGRyaXZlciBjYWxscyBydDU2NDVfamFja19kZXRlY3Rfd29yayBmdW5jdGlvbiBkaXJlY3Rs
eS4NCkl0IGlzIHBvc3NpYmxlIHRoYXQgdGhlIHdvcmsgYW5kIHJ0NTY0NV9zeXNfcmVzdW1lIGJv
dGggY2FsbCBydDU2NDVfamFja19kZXRlY3Rfd29yayBmdW5jdGlvbi4NClRoZXJlZm9yZSwgd2Ug
bmVlZCB0aGUgbXV0ZXggdG8gcHJvdGVjdC4NCg==
