Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7756CBDB0
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 13:30:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 764C91F4;
	Tue, 28 Mar 2023 13:29:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 764C91F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680003037;
	bh=qhuDlKRFYj0VtZ8i91U6AisXk0cK5cVQ8XhThbFq1jI=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cpkKMhWhO6vynt1sB6+lJWgw7oR6rMBwyhJioRmjbNnm4sLfbI8M8wnpncRRcvutA
	 ajVyfdVFLuLhrnXd//0b019R9GwMvpxC8mfib2rOTSKM9aL9Vu2oQDCsumODMVoRn6
	 b+MztE7Y6J1VyotXWfh/KskNmH/XQIoNFrp1WdXk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B5F7F80423;
	Tue, 28 Mar 2023 13:29:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0B8EF80482; Tue, 28 Mar 2023 13:29:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0502F8032D
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 13:29:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0502F8032D
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 32SBSlhzE023318,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 32SBSlhzE023318
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Tue, 28 Mar 2023 19:28:47 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 28 Mar 2023 19:29:04 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 28 Mar 2023 19:29:03 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::98d2:65f8:dcdf:fa31]) by
 RTEXMBS01.realtek.com.tw ([fe80::98d2:65f8:dcdf:fa31%5]) with mapi id
 15.01.2375.007; Tue, 28 Mar 2023 19:29:03 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: =?utf-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
	<amadeuszx.slawinski@linux.intel.com>,
        "broonie@kernel.org"
	<broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Subject: RE: [PATCH v2] ASoC: rt712-sdca: Add RT712 SDCA driver for Mic
 topology
Thread-Topic: [PATCH v2] ASoC: rt712-sdca: Add RT712 SDCA driver for Mic
 topology
Thread-Index: AQHZYVe7lRoSX27J4UKvqnQlxTfYcq8PdeaAgACXJeA=
Date: Tue, 28 Mar 2023 11:29:03 +0000
Message-ID: <6180a9f1b079463c8dbf4382b54e9df0@realtek.com>
References: <20230328092854.156478-1-shumingf@realtek.com>
 <2c15c579-c62d-b972-0b56-a3632e767132@linux.intel.com>
In-Reply-To: <2c15c579-c62d-b972-0b56-a3632e767132@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.209]
x-kse-serverinfo: RTEXDAG01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: NBAYFCSN43WOZO6EXUZQF7ILCCCC2HSQ
X-Message-ID-Hash: NBAYFCSN43WOZO6EXUZQF7ILCCCC2HSQ
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
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "pierre-louis.bossart@intel.com" <pierre-louis.bossart@intel.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 "Yijun.Shen@dell.com" <Yijun.Shen@dell.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NBAYFCSN43WOZO6EXUZQF7ILCCCC2HSQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiA+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL3J0NzEyLXNkY2EtZG1pYy5jDQo+ID4g
Yi9zb3VuZC9zb2MvY29kZWNzL3J0NzEyLXNkY2EtZG1pYy5jDQo+ID4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmU1ZDc2NWQ4NDM2OQ0KPiA+IC0tLSAvZGV2
L251bGwNCj4gPiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3J0NzEyLXNkY2EtZG1pYy5jDQo+ID4g
QEAgLTAsMCArMSw5OTEgQEANCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAtb25seSAvLyAvLyBydDcxMi1zZGNhLWRtaWMuYyAtLQ0KPiA+ICtydDcxMiBTRENBIERNSUMg
QUxTQSBTb0MgYXVkaW8gZHJpdmVyIC8vIC8vIENvcHlyaWdodChjKSAyMDIzIFJlYWx0ZWsNCj4g
PiArU2VtaWNvbmR1Y3RvciBDb3JwLg0KPiA+ICsvLw0KPiA+ICsvLw0KPiA+ICsNCj4gPiArI2lu
Y2x1ZGUgPGxpbnV4L2JpdG9wcy5oPg0KPiA+ICsjaW5jbHVkZSA8c291bmQvY29yZS5oPg0KPiA+
ICsjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9kZWxheS5o
Pg0KPiA+ICsjaW5jbHVkZSA8bGludXgvaW5pdC5oPg0KPiA+ICsjaW5jbHVkZSA8c291bmQvaW5p
dHZhbC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQo+ID4gKyNpbmNsdWRlIDxs
aW51eC9tb2R1bGUuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZXBhcmFtLmg+DQo+ID4g
KyNpbmNsdWRlIDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4
L3BtX3J1bnRpbWUuaD4NCj4gPiArI2luY2x1ZGUgPHNvdW5kL3BjbS5oPg0KPiA+ICsjaW5jbHVk
ZSA8c291bmQvcGNtX3BhcmFtcy5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvc291bmR3aXJlL3Nk
d19yZWdpc3RlcnMuaD4gI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4gPiArI2luY2x1ZGUgPHNv
dW5kL3NvYy1kYXBtLmg+ICNpbmNsdWRlIDxzb3VuZC90bHYuaD4NCj4gDQo+IE9yZGVyaW5nIG9m
IHRob3NlIGluY2x1ZGVzIHNlZW1zIGJpdCB3ZWlyZCB0byBtZSwgY2FuJ3QgeW91IGluY2x1ZGUg
c291bmQvDQo+IG9uZXMgYWZ0ZXIgbGludXgvIG9uZXM/DQo+IA0KPiBBbmQgYSBiaXQgb2Ygbml0
cGlja2luZyBsaW51eC9tb2R1bGVwYXJhbS5oIHNlZW1zIHJlZHVuZGFudCBpZiB5b3UgaW5jbHVk
ZQ0KPiBsaW51eC9tb2R1bGUuaA0KPiANCj4gQW5kIEknbSBub3Qgc3VyZSB3aHkgZG8geW91IG5l
ZWQgbGludXgvZGVsYXkuaCwgSSBkb24ndCBzZWUgYW55ICpzbGVlcCBvcg0KPiAqZGVsYXkgZnVu
Y3Rpb25zIGluIHRoZSBwYXRjaD8NCg0KVGhhbmtzIGZvciByZXZpZXdpbmcuIEkgd2lsbCByZS1v
cmRlciB0aGUgaW5jbHVkZXMgYW5kIHJlbW92ZSByZWR1bmRhbnQgb25lcy4NCg0KPiA+ICsjaW5j
bHVkZSAicnQ3MTItc2RjYS5oIg0KPiA+ICsjaW5jbHVkZSAicnQ3MTItc2RjYS1kbWljLmgiDQo+
ID4gKw0KPiANCj4gLi4uDQo+IA0KPiAtLS0tLS1QbGVhc2UgY29uc2lkZXIgdGhlIGVudmlyb25t
ZW50IGJlZm9yZSBwcmludGluZyB0aGlzIGUtbWFpbC4NCg==
