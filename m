Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B080C8C9D2D
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 14:26:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97685E7D;
	Mon, 20 May 2024 14:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97685E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716207994;
	bh=Xd2Jzc9mwIY3fDGQjwI6mwax0vuaZXPt9DXSNN8oSBI=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A4XQepHebDVyymXuQ0x/N+tOPgrjZMXcxNo7K8iItghkDRRpLb7pFx2P1YiFRI0Wo
	 nP6b0KyAkc/55z68a5LA2XyuRuALTxXQoqY0D/AkbPYsADkIc3MupiMVuYtf4JZOBY
	 cOBHZlCgGUkaAI+FAcIxYBjAAug+Fwd4ALnFs2jA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE322F805D9; Mon, 20 May 2024 14:25:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B98CF805C8;
	Mon, 20 May 2024 14:25:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED5AFF80525; Fri, 17 May 2024 07:49:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6E2FF8016B
	for <alsa-devel@alsa-project.org>; Fri, 17 May 2024 07:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6E2FF8016B
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 44H5nU1y92027900,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 44H5nU1y92027900
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 May 2024 13:49:30 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 17 May 2024 13:49:30 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 13:49:30 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975]) by
 RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975%5]) with mapi id
 15.01.2507.035; Fri, 17 May 2024 13:49:30 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>
Subject: RE: [PATCH] ASoC: rt1320: Add RT1320 SDCA vendor-specific driver
Thread-Topic: [PATCH] ASoC: rt1320: Add RT1320 SDCA vendor-specific driver
Thread-Index: AQHapqY7Gzl3mXLKlECvsNyZ4sOznbGXws6AgAFoXKCAAEBygIABPrig
Date: Fri, 17 May 2024 05:49:29 +0000
Message-ID: <5a9d28c6e66d495c82546074350ae4ca@realtek.com>
References: <20240515085939.201081-1-shumingf@realtek.com>
 <790667c8-2893-47d6-b47a-340ac12af28c@linux.intel.com>
 <489b4beca9d94cb7ba24a30279a01fa3@realtek.com>
 <a062accf-f3f3-46b8-a110-588c4a319909@linux.intel.com>
In-Reply-To: <a062accf-f3f3-46b8-a110-588c4a319909@linux.intel.com>
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
Message-ID-Hash: FZYVET67E4TL3Y6GWRRC5BGWO7U5VEGW
X-Message-ID-Hash: FZYVET67E4TL3Y6GWRRC5BGWO7U5VEGW
X-MailFrom: shumingf@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FZYVET67E4TL3Y6GWRRC5BGWO7U5VEGW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiA+PiBPbiBHaXRIdWIgd2UgdGFsa2VkIGFib3V0IHVzaW5nIHRoZSBTRENBIEluaXRpYWxpemF0
aW9uIHRhYmxlIGNvbWluZw0KPiA+PiBmcm9tIEFDUEksIGlzIHRoaXMgc3RpbGwgc29tZXRoaW5n
IHlvdSdyZSBpbnRlcmVzdGVkIGluPw0KPiA+DQo+ID4gSWYgdGhlIFNEQ0EgZnVuY3Rpb24gaXMg
cmVhZHksIHRoZSBjb2RlYyBkcml2ZXIgY291bGQgY2FsbCB0aGUgQVBJIHRvIGRvIHRoZQ0KPiBi
bGluZCB3cml0ZXMuDQo+IA0KPiBUaGUgY29kZSBJIGhhdmUgaXMgYWJvdXQgcmVhZHksIGl0IGp1
c3QgbmVlZHMgdG8gYmUgY2xlYW5lZC11cCBhbmQgc3VibWl0dGVkLg0KPiANCj4gQnV0IGp1c3Qg
dG8gYmUgY2xlYXIsIHRoZSBjb2RlYyBkcml2ZXIgd291bGQgdXNlIHRoZSBBUEkgdG8gcmV0cmll
dmUgYW4gYXJyYXkgb2YNCj4gKGFkZHJlc3MsIHZhbHVlKSBwYWlyLiBJdCB3b3VsZCBiZSB1cCB0
byB0aGUgY29kZWMgZHJpdmVyIHRvIGRvIHRoZSB3cml0ZXMgYW5kL29yDQo+IHBhdGNoIHRoZWly
IHJlZ21hcC4NCg0KVW5kZXJzdG9vZC4gDQpIb3dldmVyLCB0aGUgY3VzdG9tZXIgcmVxdWVzdGVk
IFJlYWx0ZWsgdG8gc2VuZCB0aGUgcHJpbWFyeSB2ZXJzaW9uIHRvIHVwc3RyZWFtIGZpcnN0Lg0K
V2UgY291bGQgbW9kaWZ5IHRoZSBjb2RlYyBkcml2ZXIgYWZ0ZXIgdGhlIHBhdGNoZXMgb2YgdGhl
IFNEQ0EgZnVuY3Rpb24gYXJlIHN1Ym1pdHRlZC4NCg0KPiA+IE9LLCB3aWxsIGFkZCBhIGNvbW1l
bnQgZm9yIHRoZSB2ZXJzaW9uX2lkLg0KPiA+IEN1cnJlbnRseSwgdGhlIGJsaW5kIHdyaXRlcyBl
bmFibGVzIHRoZSBiYXNpYyBmdW5jdGlvbiwgbm90IHRoZSBhZHZhbmNlZA0KPiBtb2RlIChzcGVh
a2VyIHByb3RlY3Rpb24pLg0KPiA+IEhvd2V2ZXIsIFZFUl9CIGhhcyB0aGUgY2FwYWJpbGl0eSB0
byBlbmFibGUgdGhlIHNwZWFrZXIgcHJvdGVjdGlvbi4NCj4gPiBUaGUgY29kZWMgZHJpdmVyIGNv
dWxkIHVzZSB0aGUgdmVyc2lvbl9pZCBpZiB0aGUgY3VzdG9tZXIgd2FudHMgdG8gZW5hYmxlDQo+
IHRoZSBzcGVha2VyIHByb3RlY3Rpb24uDQo+ID4gUmVnYXJkaW5nIERTUCBmaXJtd2FyZSwgdGhl
IFJPTSBjb2RlIHN0b3JlcyB0aGUgRFNQIEZXIGluc2lkZSB0aGUgY2hpcC4NCj4gPiBUaGUgc3Bl
YWtlciBwcm90ZWN0aW9uIG5lZWRzIG90aGVyIHBhcmFtZXRlcnMgdG8gc2V0Lg0KPiANCj4gSWYg
dGhlcmUgaXMgYSBzcGVha2VyIHByb3RlY3Rpb24gcnVubmluZyBvbiB0aGUgY29kZWMgRFNQLCBz
aG91bGRuJ3QgdGhlcmUgYmUgYQ0KPiBzb3VyY2UgcG9ydCB0byBwYXNzIGFuIGVjaG8gcmVmZXJl
bmNlIGJhY2sgdG8gdGhlIGhvc3Q/DQoNCkkgY291bGQgY3JlYXRlIHRoZSBjYXB0dXJlIERBSSBm
b3IgQUVDIGZlZWRiYWNrLg0KDQo=
