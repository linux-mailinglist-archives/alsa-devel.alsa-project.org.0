Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A0C8FC227
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2024 05:24:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C259AE8;
	Wed,  5 Jun 2024 05:24:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C259AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717557866;
	bh=f07oPSQbXwBOh9z0OYBF8bbCRrwcQSRDOEy4E8EYOY4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j7ob6qM1NX+bMMdXt5vyUHwyOeDlR3sBSQ6sDvcEdMUGqevqZd4IRCFthGG6k42zt
	 qXjn0PLKGIoGygztQ8TuTKdhi2fKYzDeq7K49KgwO1aQRP1s0n/2hfGbT+IvIRO0JH
	 faO2St1vD8kapvQGedL8MHY40IHueFBJIn9lji8Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 337B8F80580; Wed,  5 Jun 2024 05:23:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D852F8058C;
	Wed,  5 Jun 2024 05:23:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 849ABF802DB; Wed,  5 Jun 2024 05:21:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DD1CF800FA
	for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2024 05:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DD1CF800FA
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4553KeUlA997243,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 4553KeUlA997243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jun 2024 11:20:40 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 11:20:41 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 5 Jun 2024 11:20:40 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975]) by
 RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975%5]) with mapi id
 15.01.2507.035; Wed, 5 Jun 2024 11:20:40 +0800
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
Thread-Index: Adq2Rs/8n9D0p31EQZaWG09Bfd/1VwACfwwAACmSgwA=
Date: Wed, 5 Jun 2024 03:20:40 +0000
Message-ID: <f7acc483773047c0932e50be43650292@realtek.com>
References: <c6d0e09de01c4804bfff6efe92fff04c@realtek.com>
 <b5ee74bc-5dfd-4355-b9a4-3b5603ca5a1c@linux.intel.com>
In-Reply-To: <b5ee74bc-5dfd-4355-b9a4-3b5603ca5a1c@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.22.102.102]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: 326JVR6EO4PQ2RJFZD2ENCQHMWHEQLCT
X-Message-ID-Hash: 326JVR6EO4PQ2RJFZD2ENCQHMWHEQLCT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/326JVR6EO4PQ2RJFZD2ENCQHMWHEQLCT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQaWVycmUtTG91aXMgQm9zc2Fy
dCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5
LCBKdW5lIDQsIDIwMjQgMTE6MjkgUE0NCj4gVG86IEphY2sgWXUgPGphY2sueXVAcmVhbHRlay5j
b20+OyBicm9vbmllQGtlcm5lbC5vcmc7DQo+IGxnaXJkd29vZEBnbWFpbC5jb20NCj4gQ2M6IGFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgbGFyc0BtZXRhZm9vLmRlOyBGbG92ZShIc2luRnUp
DQo+IDxmbG92ZUByZWFsdGVrLmNvbT47IE9kZXIgQ2hpb3UgPG9kZXJfY2hpb3VAcmVhbHRlay5j
b20+OyBTaHVtaW5nIFvojIPmm7gNCj4g6YqYXSA8c2h1bWluZ2ZAcmVhbHRlay5jb20+OyBEZXJl
ayBb5pa55b63576pXSA8ZGVyZWsuZmFuZ0ByZWFsdGVrLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSF0gQVNvQzogcnQxMzE4OiBBZGQgUlQxMzE4IGF1ZGlvIGFtcGxpZmllciBkcml2ZXINCj4g
DQo+IA0KPiBFeHRlcm5hbCBtYWlsLg0KPiANCj4gDQo+IA0KPiBPbiA2LzQvMjQgMDg6MTcsIEph
Y2sgWXUgd3JvdGU6DQo+ID4gVGhpcyBpcyB0aGUgaW5pdGlhbCBhbXBsaWZpZXIgZHJpdmVyIGZv
ciBydDEzMTguDQo+IA0KPiBUaGVyZSBpcyBhbHJlYWR5IGEgZHJpdmVyIGZvciB0aGUgcnQxMzE4
IGluIFNvdW5kV2lyZSBtb2RlLCBjb250cmlidXRlZCBiYWNrDQo+IGluIE5vdmVtYmVyIDIwMjIs
IHRoaXMgc2VlbXMgdG8gYmUgYW4gSTJTLWJhc2VkIHZlcnNpb24uDQo+IA0KPiBBcmUgYWxsIHBh
cnRzIGluZGVwZW5kZW50IGFuZCBpbnRlcmZhY2Utc3BlY2lmaWMsIG9yIHdvdWxkIHRoZXJlIGJl
DQo+IG9wcG9ydHVuaXRpZXMgdG8gc2hhcmUgY29tbW9uIHBhcnRzLCBpZiBhbnk/DQoNClRoZSBz
ZXR0aW5ncyBmb3IgaTJzLWJhc2VkIGRyaXZlciBhcmUgcXVpdGUgZGlmZmVyZW50LCBzbyB3ZSBw
cmVmZXIgdG8gdXNlIHNlcGFyYXRlIGZpbGVzIGZvciBiZXR0ZXIgbWFuYWdlbWVudC4gDQoNCg==
