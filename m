Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCBE73D5A6
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 03:54:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90B2E74C;
	Mon, 26 Jun 2023 03:54:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90B2E74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687744496;
	bh=vbdTS3OjgzCtFJv+eHDbhpqeyenKDz/BamV+RppIDlc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eMF+Mz0BDjIO5CXtXW0LkO135bkvq5gadjKj5ywWGklxR6yJThJoVc/eyZNmYA2hj
	 uWeri2iKpE1w0r+eqqD+NYk1R1Emr6mvC74CcC80YFRJaQ4Prh5bp6/vxJjfUT5h+i
	 0F6GIcw/QBIugB0hzcuDdF7q5XS/RCs2saAkycVs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9603F8051E; Mon, 26 Jun 2023 03:54:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63C0BF80212;
	Mon, 26 Jun 2023 03:54:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C6D5F80246; Mon, 26 Jun 2023 03:53:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id 259DBF80169
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 03:53:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 259DBF80169
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 35Q1rE5W1011283,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 35Q1rE5W1011283
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Mon, 26 Jun 2023 09:53:14 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Mon, 26 Jun 2023 09:53:09 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 26 Jun 2023 09:53:09 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b]) by
 RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b%5]) with mapi id
 15.01.2375.007; Mon, 26 Jun 2023 09:53:09 +0800
From: Jack Yu <jack.yu@realtek.com>
To: Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>,
        =?big5?B?RGVyZWsgW6TovHe4cV0=?= <derek.fang@realtek.com>
Subject: RE: [PATCH] ASoC: rt722-sdca: Remove redundant sdca mask
Thread-Topic: [PATCH] ASoC: rt722-sdca: Remove redundant sdca mask
Thread-Index: AQHZpBd9/Fyhfq34yky+08tp97/jea+UrOGAgAcmvAA=
Date: Mon, 26 Jun 2023 01:53:08 +0000
Message-ID: <f8ca919ab2bf482aa1b55cc7101b5009@realtek.com>
References: <20230621080750.13511-1-jack.yu@realtek.com>
 <7e84b2e3-16ad-41c9-a4c5-9938f4ae8289@sirena.org.uk>
In-Reply-To: <7e84b2e3-16ad-41c9-a4c5-9938f4ae8289@sirena.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.102]
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
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
Message-ID-Hash: KK5QAAQQA2YUPYBD5LDSJLKXVKMYEP5F
X-Message-ID-Hash: KK5QAAQQA2YUPYBD5LDSJLKXVKMYEP5F
X-MailFrom: jack.yu@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KK5QAAQQA2YUPYBD5LDSJLKXVKMYEP5F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hcmsgQnJvd24gPGJyb29u
aWVAa2VybmVsLm9yZz4NCj4gU2VudDogV2VkbmVzZGF5LCBKdW5lIDIxLCAyMDIzIDg6NDEgUE0N
Cj4gVG86IEphY2sgWXUgPGphY2sueXVAcmVhbHRlay5jb20+DQo+IENjOiBsZ2lyZHdvb2RAZ21h
aWwuY29tOyBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7IGxhcnNAbWV0YWZvby5kZTsNCj4g
RmxvdmUoSHNpbkZ1KSA8ZmxvdmVAcmVhbHRlay5jb20+OyBPZGVyIENoaW91IDxvZGVyX2NoaW91
QHJlYWx0ZWsuY29tPjsNCj4gU2h1bWluZyBbrVOu0bvKXSA8c2h1bWluZ2ZAcmVhbHRlay5jb20+
OyBEZXJlayBbpOi8d7hxXQ0KPiA8ZGVyZWsuZmFuZ0ByZWFsdGVrLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSF0gQVNvQzogcnQ3MjItc2RjYTogUmVtb3ZlIHJlZHVuZGFudCBzZGNhIG1hc2sN
Cj4gDQo+IE9uIFdlZCwgSnVuIDIxLCAyMDIzIGF0IDA0OjA3OjUwUE0gKzA4MDAsIEphY2sgWXUg
d3JvdGU6DQo+IA0KPiA+IFJlbW92ZSByZWR1bmRhbnQgc2RjYSBtYXNrIGZvciBjbGVhciBjb2Rl
Lg0KPiANCj4gPiAgCQkJc2R3X3dyaXRlX25vX3BtKHJ0NzIyLT5zbGF2ZSwgU0RXX1NDUF9TRENB
X0lOVE1BU0sxLA0KPiA+IC0JCQkJU0RXX1NDUF9TRENBX0lOVE1BU0tfU0RDQV8wIHwNCj4gU0RX
X1NDUF9TRENBX0lOVE1BU0tfU0RDQV82KTsNCj4gPiArCQkJCVNEV19TQ1BfU0RDQV9JTlRNQVNL
X1NEQ0FfNik7DQo+ID4gIAkJCXNkd193cml0ZV9ub19wbShydDcyMi0+c2xhdmUsIFNEV19TQ1Bf
U0RDQV9JTlRNQVNLMiwNCj4gPiAgCQkJCVNEV19TQ1BfU0RDQV9JTlRNQVNLX1NEQ0FfOCk7DQo+
ID4gIAkJfQ0KPiANCj4gV2h5IGlzIHRoaXMgcmVkdW5kYW50Pw0KDQpCYXNlZCBvbiBpbnRlcm5h
bCByZWdpc3RlciBzZXR0aW5ncywgdGhpcyBiaXQgd29uJ3QgYmUgdXNlZCBpbiBhbnkgdXNlIGNh
c2UsIHNvIEkgcmVtb3ZlIGl0IGZvciBjbGVhciBjb2RlLg0KDQo+IA0KPiAtLS0tLS1QbGVhc2Ug
Y29uc2lkZXIgdGhlIGVudmlyb25tZW50IGJlZm9yZSBwcmludGluZyB0aGlzIGUtbWFpbC4NCg==
