Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A96417DE1D7
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Nov 2023 15:03:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2008A3E8;
	Wed,  1 Nov 2023 15:02:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2008A3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698847416;
	bh=rpwQZ3ob19zzxsXUTQsBVu/wecma/qjKyIOqNmRS7mA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K9704pbWK7hmJJIoGWj7uCOjVGFglaqQkMEiz5M8ssorCrLwLFtd8Sy3C9c9m6Bxf
	 gob7nx7icr75FInBLNbHwgcGwg7Ut3HXpHQ7ZtSadFtEZ3Lrzx/bw8Ll3m0GLtYMct
	 lY/TctbOaC7zuysYUuNhosuhIrZPjOTgq/c/c87s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACBFCF8014B; Wed,  1 Nov 2023 15:02:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 324F5F8016D;
	Wed,  1 Nov 2023 15:02:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D6FBF8020D; Wed,  1 Nov 2023 15:02:41 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FC88F8014B
	for <alsa-devel@alsa-project.org>; Wed,  1 Nov 2023 15:02:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FC88F8014B
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3A1E29tB41626631,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.93/5.92) with ESMTPS id 3A1E29tB41626631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Nov 2023 22:02:09 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Wed, 1 Nov 2023 22:02:09 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 1 Nov 2023 22:02:07 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b]) by
 RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b%5]) with mapi id
 15.01.2375.007; Wed, 1 Nov 2023 22:02:07 +0800
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
Subject: RE: [PATCH] ASoC: rt5682s: Add LDO control for dacref
Thread-Topic: [PATCH] ASoC: rt5682s: Add LDO control for dacref
Thread-Index: AdoLnxfzq2sgR5TmTQSKtWXvf3qdiQAHDIaAABwFcPAAFUMUgAACITvg
Date: Wed, 1 Nov 2023 14:02:07 +0000
Message-ID: <2bc63f6d27454522bff3dd8c70d695a8@realtek.com>
References: <496805f7ca084e9dbcf7140cbe83ed4b@realtek.com>
 <ad79bd27-5c1f-48b9-b0b5-bb5c48cbd56c@sirena.org.uk>
 <28cf2cfcd7b047519811e201da2c2f9f@realtek.com>
 <c498a822-cde9-4803-bae5-309b858b2c87@sirena.org.uk>
In-Reply-To: <c498a822-cde9-4803-bae5-309b858b2c87@sirena.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [36.226.194.210]
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-antivirus-attachment-filter-interceptor-info: license violation
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: FWM45SEA7FKHMQ7DC5RR5W7OLBCQYJGE
X-Message-ID-Hash: FWM45SEA7FKHMQ7DC5RR5W7OLBCQYJGE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FWM45SEA7FKHMQ7DC5RR5W7OLBCQYJGE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTWFyayBCcm93biA8YnJvb25pZUBr
ZXJuZWwub3JnPiANClNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgMSwgMjAyMyA5OjAxIFBNDQpU
bzogSmFjayBZdSA8amFjay55dUByZWFsdGVrLmNvbT4NCkNjOiBsZ2lyZHdvb2RAZ21haWwuY29t
OyBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7IGxhcnNAbWV0YWZvby5kZTsgRmxvdmUoSHNp
bkZ1KSA8ZmxvdmVAcmVhbHRlay5jb20+OyBPZGVyIENoaW91IDxvZGVyX2NoaW91QHJlYWx0ZWsu
Y29tPjsgU2h1bWluZyBbrVOu0bvKXSA8c2h1bWluZ2ZAcmVhbHRlay5jb20+OyBEZXJlayBbpOi8
d7hxXSA8ZGVyZWsuZmFuZ0ByZWFsdGVrLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0hdIEFTb0M6
IHJ0NTY4MnM6IEFkZCBMRE8gY29udHJvbCBmb3IgZGFjcmVmDQoNCk9uIFdlZCwgTm92IDAxLCAy
MDIzIGF0IDAyOjUyOjIwQU0gKzAwMDAsIEphY2sgWXUgd3JvdGU6DQoNCj4gPiA+ICsvKiBMRE8g
b3V0cHV0IHNlbGVjdCAqLw0KPiA+ID4gK3N0YXRpYyBjb25zdCBjaGFyICogY29uc3QgcnQ1Njgy
c19sZG9fb3V0cHV0X3NlbGVjdFtdID0gew0KPiA+ID4gKwkiMS42MDdWIiwgIjEuNVYiLCAiMS40
MDZWIiwgIjEuNzMxViINCj4gPiA+ICt9Ow0KDQo+ID4gVGhpcyBmZWVscyBsaWtlIHNvbWV0aGlu
ZyB0aGF0IG1pZ2h0IGJlIGEgYmV0dGVyIGZpdCBmb3IgZmlybXdhcmUgDQo+ID4gYmFzZWQgc2Vs
ZWN0aW9uIC0gaG93IHdvdWxkIHNvbWVvbmUgc2V0IGEgdmFsdWUgZm9yIHRoaXMsIGFuZCB3aHkg
DQo+ID4gbWlnaHQgaXQgdmFyeSBhdCBydW50aW1lPyAgSSdtIGEgYml0IHVuY2xlYXIgYXMgdG8g
d2hhdCB0aGUgY29udHJvbCANCj4gPiBkb2VzIHNvIHRoaXMgbWlnaHQgYmUgdGhlIGJlc3QgdGhp
bmcgYnV0IHBlcmhhcHMgbm90Lg0KDQo+IFRoaXMgY29udHJvbCBpcyBhZGRlZCBmb3Igc3BlY2lm
aWMgY3VzdG9tZXJzLCBpdCB3b24ndCBiZSBjaGFuZ2VkIA0KPiBkdXJpbmcgcnVudGltZSwgYnV0
IHdpbGwgYmUgc2V0IGluIHRoZSBpbml0aWFsaXphdGlvbiByZWdhcmRpbmcgdG8gDQo+IGRpZmZl
cmVudCBjdXN0b21lcnMsIHRoZXknbGwgc2V0IGl0IGluIHRoZWlyIG93biB1Y20gYW5kIGhhdmUg
YWxyZWFkeSBiZWVuIHZlcmlmaWVkIGJ5IGN1c3RvbWVycy4NCg0KVGhhdCBzb3VuZHMgbGlrZSBp
dCBzaG91bGQgY29tZSBmcm9tIHRoZSBmaXJtd2FyZSB0aGVuIGlmIGl0J3Mgc3VwcG9zZWQgdG8g
YmUgZml4ZWQgZm9yIGEgZ2l2ZW4gc3lzdGVtICh3aGljaCBpcyB3aGF0IHRoZSBhYm92ZSBzb3Vu
ZHMgbGlrZSkuDQoNClllcywgbWF5YmUgaXQncyBiZXR0ZXIgdG8gYmUgY29uZmlndXJlZCBieSBm
aXJtd2FyZSwgYnV0IHRoZXJlIGlzIG5vIGZpcm13YXJlIHRvIHNldCB0aGlzIExETyBzZXR0aW5n
IGluIHRoaXMgY2FzZSwgDQpzbyB3ZSBwcm92aWRlIHRoaXMgY29udHJvbCBmb3IgY3VzdG9tZXIg
dG8gZG8gdGhlaXIgb3duIHNldHRpbmcgaW4gVUNNLiANCg==
