Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFAE8C70AC
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2024 05:27:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06EB6B65;
	Thu, 16 May 2024 05:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06EB6B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715830035;
	bh=0/47l81yEVcGUTtWmdr2YP3UXbBfzf7jtqwTmPp3GxI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QFI8wigcE6KcayCJdnvOlJpSaB1rf1yjh8GgA0/uICwORHOSr6Di3jJM/Z5guoMTZ
	 9Z4JGx7zz3zo2TBG+GP0SeDpjjO/rdqnuoWGb5e40svYUomrvnt6ZcbCa5wQG76aZn
	 6XfLU3FZhBosmkhR5NH9HufojOWjm+np6Ok+h4As=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBD14F805A9; Thu, 16 May 2024 05:26:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27114F801F5;
	Thu, 16 May 2024 05:26:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59B4CF8024C; Thu, 16 May 2024 05:23:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77947F800E2
	for <alsa-devel@alsa-project.org>; Thu, 16 May 2024 05:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77947F800E2
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 44G3MbQL2729006,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 44G3MbQL2729006
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 11:22:37 +0800
Received: from RTEXMBS02.realtek.com.tw (172.21.6.95) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 16 May 2024 11:22:38 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 11:22:37 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975]) by
 RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975%5]) with mapi id
 15.01.2507.035; Thu, 16 May 2024 11:22:37 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
        =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Subject: RE: [PATCH] ASoC: rt1320: Add RT1320 SDCA vendor-specific driver
Thread-Topic: [PATCH] ASoC: rt1320: Add RT1320 SDCA vendor-specific driver
Thread-Index: AQHapqY7Gzl3mXLKlECvsNyZ4sOznbGXws6AgAFoXKA=
Date: Thu, 16 May 2024 03:22:37 +0000
Message-ID: <489b4beca9d94cb7ba24a30279a01fa3@realtek.com>
References: <20240515085939.201081-1-shumingf@realtek.com>
 <790667c8-2893-47d6-b47a-340ac12af28c@linux.intel.com>
In-Reply-To: <790667c8-2893-47d6-b47a-340ac12af28c@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.22.102.209]
x-kse-serverinfo: RTEXMBS02.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: YZN5NZQQSUXL7C24HDDZ3DRE326HZUBP
X-Message-ID-Hash: YZN5NZQQSUXL7C24HDDZ3DRE326HZUBP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YZN5NZQQSUXL7C24HDDZ3DRE326HZUBP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ19zZXF1ZW5jZSBydDEzMjBfYmxpbmRfd3JpdGVb
XSA9IHsNCj4gLi4uDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJl
Z19zZXF1ZW5jZSBydDEzMjBfcGF0Y2hfY29kZV93cml0ZVtdID0gew0KPiAuLi4NCj4gPiArfTsN
Cj4gDQo+IE9uIEdpdEh1YiB3ZSB0YWxrZWQgYWJvdXQgdXNpbmcgdGhlIFNEQ0EgSW5pdGlhbGl6
YXRpb24gdGFibGUgY29taW5nIGZyb20NCj4gQUNQSSwgaXMgdGhpcyBzdGlsbCBzb21ldGhpbmcg
eW91J3JlIGludGVyZXN0ZWQgaW4/DQoNCklmIHRoZSBTRENBIGZ1bmN0aW9uIGlzIHJlYWR5LCB0
aGUgY29kZWMgZHJpdmVyIGNvdWxkIGNhbGwgdGhlIEFQSSB0byBkbyB0aGUgYmxpbmQgd3JpdGVz
Lg0KDQo+IA0KPiBNYXliZSBJIG1pc3NlZCBpdCBidXQgSSBkaWRuJ3Qgc2VlIGFueXRoaW5nIHRo
YXQgdGVzdHMgdGhlIHZlcnNpb25faWQgYW5kIGRvZXMNCj4gc29tZXRoaW5nIGRpZmZlcmVudCBi
ZXR3ZWVuIFZFUl9BIGFuZCBWRVJfQi4gQ2FuIHlvdSBhZGQgYSBjb21tZW50IG9uDQo+IHdoeSBp
dCdzIGltcG9ydGFudCB0byB0cmFjayB0aGUgdmVyc2lvbj8NCj4gDQo+IEFsc28gaWYgdGhlcmUn
cyBhIERTUCwgaXMgdGhlcmUgYSBuZWVkIGZvciB0aGUgRkRMIGNhcGFiaWxpdHkgdG8gZG93bmxv
YWQNCj4gZmlybXdhcmUsIG9yIGlzIHRoZSBzcGVha2VyIHByb3RlY3Rpb24gY29uZmlndXJlZCBv
bmx5IHZpYSB0YWJsZXM/DQoNCk9LLCB3aWxsIGFkZCBhIGNvbW1lbnQgZm9yIHRoZSB2ZXJzaW9u
X2lkLg0KQ3VycmVudGx5LCB0aGUgYmxpbmQgd3JpdGVzIGVuYWJsZXMgdGhlIGJhc2ljIGZ1bmN0
aW9uLCBub3QgdGhlIGFkdmFuY2VkIG1vZGUgKHNwZWFrZXIgcHJvdGVjdGlvbikuDQpIb3dldmVy
LCBWRVJfQiBoYXMgdGhlIGNhcGFiaWxpdHkgdG8gZW5hYmxlIHRoZSBzcGVha2VyIHByb3RlY3Rp
b24uDQpUaGUgY29kZWMgZHJpdmVyIGNvdWxkIHVzZSB0aGUgdmVyc2lvbl9pZCBpZiB0aGUgY3Vz
dG9tZXIgd2FudHMgdG8gZW5hYmxlIHRoZSBzcGVha2VyIHByb3RlY3Rpb24uDQpSZWdhcmRpbmcg
RFNQIGZpcm13YXJlLCB0aGUgUk9NIGNvZGUgc3RvcmVzIHRoZSBEU1AgRlcgaW5zaWRlIHRoZSBj
aGlwLg0KVGhlIHNwZWFrZXIgcHJvdGVjdGlvbiBuZWVkcyBvdGhlciBwYXJhbWV0ZXJzIHRvIHNl
dC4NCg0K
