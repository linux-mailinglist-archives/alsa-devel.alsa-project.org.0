Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 379227DDB36
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Nov 2023 03:56:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 068E3823;
	Wed,  1 Nov 2023 03:55:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 068E3823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698807365;
	bh=+0QQZX4ufmhKKyNTf+FqSEe/lCskBDaNtYRGTteebDM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iMtTtuH+zgs5EwHJyDPx/b7FzgFfbXHmuqVoDO2eni5ocy6skHZzuXElAXBx4MGLu
	 o75n0sPGZuRjppVFf90cekZFZ/uTNa7b7nKKYAt/w9lGg8SyRT2rrxNMDlEWVafv5z
	 AId67eeOqk2UvTarX3SPxW4BxTC3l4Nu13+w0LKs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75A86F80431; Wed,  1 Nov 2023 03:55:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2790F8016D;
	Wed,  1 Nov 2023 03:55:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C89BF8020D; Wed,  1 Nov 2023 03:52:53 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BF4EF80166
	for <alsa-devel@alsa-project.org>; Wed,  1 Nov 2023 03:52:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BF4EF80166
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 3A12qKWI1933200,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.93/5.92) with ESMTPS id 3A12qKWI1933200
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Nov 2023 10:52:20 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Wed, 1 Nov 2023 10:52:20 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 1 Nov 2023 10:52:20 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b]) by
 RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b%5]) with mapi id
 15.01.2375.007; Wed, 1 Nov 2023 10:52:20 +0800
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
Thread-Index: AdoLnxfzq2sgR5TmTQSKtWXvf3qdiQAHDIaAABwFcPA=
Date: Wed, 1 Nov 2023 02:52:20 +0000
Message-ID: <28cf2cfcd7b047519811e201da2c2f9f@realtek.com>
References: <496805f7ca084e9dbcf7140cbe83ed4b@realtek.com>
 <ad79bd27-5c1f-48b9-b0b5-bb5c48cbd56c@sirena.org.uk>
In-Reply-To: <ad79bd27-5c1f-48b9-b0b5-bb5c48cbd56c@sirena.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.22.102.102]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-antivirus-attachment-filter-interceptor-info: license violation
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: ZLDFTEBSJEXYGHT4KIQNAUGO7VWCYDDW
X-Message-ID-Hash: ZLDFTEBSJEXYGHT4KIQNAUGO7VWCYDDW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZLDFTEBSJEXYGHT4KIQNAUGO7VWCYDDW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJrIEJyb3duIDxicm9vbmll
QGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMzEsIDIwMjMgOTozMCBQTQ0K
PiBUbzogSmFjayBZdSA8amFjay55dUByZWFsdGVrLmNvbT4NCj4gQ2M6IGxnaXJkd29vZEBnbWFp
bC5jb207IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgbGFyc0BtZXRhZm9vLmRlOw0KPiBG
bG92ZShIc2luRnUpIDxmbG92ZUByZWFsdGVrLmNvbT47IE9kZXIgQ2hpb3UgPG9kZXJfY2hpb3VA
cmVhbHRlay5jb20+Ow0KPiBTaHVtaW5nIFutU67Ru8pdIDxzaHVtaW5nZkByZWFsdGVrLmNvbT47
IERlcmVrIFuk6Lx3uHFdDQo+IDxkZXJlay5mYW5nQHJlYWx0ZWsuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIXSBBU29DOiBydDU2ODJzOiBBZGQgTERPIGNvbnRyb2wgZm9yIGRhY3JlZg0KPiAN
Cj4gT24gVHVlLCBPY3QgMzEsIDIwMjMgYXQgMDI6MDg6MTBBTSArMDAwMCwgSmFjayBZdSB3cm90
ZToNCj4gDQo+ID4gKy8qIExETyBvdXRwdXQgc2VsZWN0ICovDQo+ID4gK3N0YXRpYyBjb25zdCBj
aGFyICogY29uc3QgcnQ1Njgyc19sZG9fb3V0cHV0X3NlbGVjdFtdID0gew0KPiA+ICsJIjEuNjA3
ViIsICIxLjVWIiwgIjEuNDA2ViIsICIxLjczMVYiDQo+ID4gK307DQo+IA0KPiBUaGlzIGZlZWxz
IGxpa2Ugc29tZXRoaW5nIHRoYXQgbWlnaHQgYmUgYSBiZXR0ZXIgZml0IGZvciBmaXJtd2FyZSBi
YXNlZA0KPiBzZWxlY3Rpb24gLSBob3cgd291bGQgc29tZW9uZSBzZXQgYSB2YWx1ZSBmb3IgdGhp
cywgYW5kIHdoeSBtaWdodCBpdCB2YXJ5IGF0DQo+IHJ1bnRpbWU/ICBJJ20gYSBiaXQgdW5jbGVh
ciBhcyB0byB3aGF0IHRoZSBjb250cm9sIGRvZXMgc28gdGhpcyBtaWdodCBiZSB0aGUNCj4gYmVz
dCB0aGluZyBidXQgcGVyaGFwcyBub3QuDQoNClRoaXMgY29udHJvbCBpcyBhZGRlZCBmb3Igc3Bl
Y2lmaWMgY3VzdG9tZXJzLCBpdCB3b24ndCBiZSBjaGFuZ2VkIGR1cmluZyBydW50aW1lLCANCmJ1
dCB3aWxsIGJlIHNldCBpbiB0aGUgaW5pdGlhbGl6YXRpb24gcmVnYXJkaW5nIHRvIGRpZmZlcmVu
dCBjdXN0b21lcnMsIA0KdGhleSdsbCBzZXQgaXQgaW4gdGhlaXIgb3duIHVjbSBhbmQgaGF2ZSBh
bHJlYWR5IGJlZW4gdmVyaWZpZWQgYnkgY3VzdG9tZXJzLg0K
