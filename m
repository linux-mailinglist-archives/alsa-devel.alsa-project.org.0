Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF5798412E
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 10:56:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D49CE851;
	Tue, 24 Sep 2024 10:56:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D49CE851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727168190;
	bh=/8ACCuo5gIHHbMYBQsMzd9cLv8J5j+sXLSNhhUPe1qM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rhDAq2YiqCQwzXJeNR1SILOk62jyqcEU8rfDUUc1X2NNq33cdrqyihe9y85n0xtMQ
	 Av2TTgyPjVkfstYwp/Tp4FI7EEDBD+buUSi9SvReG++VnCftEkRzyQLuZYffY7ROox
	 hVayOrrQiUpsbROWoSwlLx+lkdOBgMEZSNkRu7KA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E174F8059F; Tue, 24 Sep 2024 10:55:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5246AF80527;
	Tue, 24 Sep 2024 10:55:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9ED3DF802DB; Tue, 24 Sep 2024 10:55:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03EAAF8010B
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 10:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03EAAF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=mUIw6YIW
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48O8thIW32725038,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1727168143; bh=/8ACCuo5gIHHbMYBQsMzd9cLv8J5j+sXLSNhhUPe1qM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=mUIw6YIW9i8Nf8V89FyaBWMsBAjAtGGDGChgOQkgS/ZNbGgYT7k7BJMPPv4uNPnXj
	 WoR8Dqnhia6gAnQe9aHKsTioQPDmMgvoalA5nsveiyceJbiivc3qcKawcY1Z0u//mk
	 /XcNseZkr9x3iOYebAY2gzyz1Mrl1VeW64g5Kz7IRYMYZxKlpv+dnWP7XFu4haIeLP
	 18JNvDsNh5nLihvJhRg9kejy/mUTBjy0BEU4yZ/qSJrHeR20rl2Vh73+P71DsKjNYX
	 UzOUyWrOjv6CfN/F7Ta8F9XklTsNvX6/KDkZAoDNdYp4uXjJidbpkd6LZyVKCv2KkA
	 7GtODEW7GluIQ==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48O8thIW32725038
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Sep 2024 16:55:43 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Sep 2024 16:55:43 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 24 Sep 2024 16:55:42 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2]) by
 RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2%7]) with mapi id
 15.01.2507.035; Tue, 24 Sep 2024 16:55:42 +0800
From: Jack Yu <jack.yu@realtek.com>
To: Mark Brown <broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>,
        =?big5?B?RGVyZWsgW6TovHe4cV0=?= <derek.fang@realtek.com>,
        Jack Yu
	<jack.yu@realtek.com>
Subject: RE: [PATCH] ASoC: rt721-sdca: Add RT721 SDCA driver
Thread-Topic: [PATCH] ASoC: rt721-sdca: Add RT721 SDCA driver
Thread-Index: AdsOJ1Tm0LW1yEywRX2SurxVmcCmkf//5zQAgAADF9A=
Date: Tue, 24 Sep 2024 08:55:42 +0000
Message-ID: <0258d3194bf04aa6a87ca9b24bc4b13b@realtek.com>
References: <dd39b851e5a24aaf9a6866af32fca7eb@realtek.com>
 <ZvJ79gL6V3uQopO4@finisterre.sirena.org.uk>
In-Reply-To: <ZvJ79gL6V3uQopO4@finisterre.sirena.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: 5ADZCY54Y5SDZWRFDI44KSMPD4GW5DNE
X-Message-ID-Hash: 5ADZCY54Y5SDZWRFDI44KSMPD4GW5DNE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5ADZCY54Y5SDZWRFDI44KSMPD4GW5DNE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJrIEJyb3duIDxicm9vbmll
QGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIFNlcHRlbWJlciAyNCwgMjAyNCA0OjQ1IFBN
DQo+IFRvOiBKYWNrIFl1IDxqYWNrLnl1QHJlYWx0ZWsuY29tPg0KPiBDYzogbGdpcmR3b29kQGdt
YWlsLmNvbTsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOyBsYXJzQG1ldGFmb28uZGU7DQo+
IEZsb3ZlKEhzaW5GdSkgPGZsb3ZlQHJlYWx0ZWsuY29tPjsgT2RlciBDaGlvdSA8b2Rlcl9jaGlv
dUByZWFsdGVrLmNvbT47DQo+IFNodW1pbmcgW61TrtG7yl0gPHNodW1pbmdmQHJlYWx0ZWsuY29t
PjsgRGVyZWsgW6TovHe4cV0NCj4gPGRlcmVrLmZhbmdAcmVhbHRlay5jb20+DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0hdIEFTb0M6IHJ0NzIxLXNkY2E6IEFkZCBSVDcyMSBTRENBIGRyaXZlcg0KPiAN
Cj4gT24gVHVlLCBTZXAgMjQsIDIwMjQgYXQgMDI6MTM6MjRBTSArMDAwMCwgSmFjayBZdSB3cm90
ZToNCj4gDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVnX2RlZmF1bHQgcnQ3MjFfc2RjYV9t
YnFfZGVmYXVsdHNbXSA9IHsNCj4gPiArCXsgMHgwOTAwMDA3LCAweGMwMDQgfSwNCj4gPiArCXsg
MHgyMDAwMDAxLCAweDAwMDAgfSwNCj4gPiArCXsgMHgyMDAwMDAyLCAweDAwMDAgfSwNCj4gPiAr
CXsgMHgyMDAwMDAzLCAweDAwMDAgfSwNCj4gPiArCXsgMHgyMDAwMDEzLCAweDgwMDEgfSwNCj4g
PiArCXsgMHgyMDAwMDNjLCAweDAwMDAgfSwNCj4gPiArCXsgMHgyMDAwMDQ2LCAweDM0MDAgfSwN
Cj4gPiArCS8vIHsgMHg1ODEwMDAwLCAweDcwMmQgfSwNCj4gDQo+IFdoeSBpcyB0aGVyZSB0aGlz
IG9uZSBjb21tZW50ZWQgdmFsdWU/DQoNCkl0J3MgYSB0eXBvLg0KSSdsbCBzZW5kIGEgdjIgcGF0
Y2ggdG8gZml4IGl0Lg0KPiANCj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgcnQ3MjFfc2RjYV9wZGUz
NF9ldmVudChzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCAqdywNCj4gPiArCXN0cnVjdCBzbmRf
a2NvbnRyb2wgKmtjb250cm9sLCBpbnQgZXZlbnQpIHsNCj4gPiArCXN0cnVjdCBzbmRfc29jX2Nv
bXBvbmVudCAqY29tcG9uZW50ID0NCj4gPiArCQlzbmRfc29jX2RhcG1fdG9fY29tcG9uZW50KHct
PmRhcG0pOw0KPiA+ICsJc3RydWN0IHJ0NzIxX3NkY2FfcHJpdiAqcnQ3MjEgPQ0KPiBzbmRfc29j
X2NvbXBvbmVudF9nZXRfZHJ2ZGF0YShjb21wb25lbnQpOw0KPiA+ICsJdW5zaWduZWQgY2hhciBw
czAgPSAweDAsIHBzMyA9IDB4MzsNCj4gPiArDQo+ID4gKwlzd2l0Y2ggKGV2ZW50KSB7DQo+ID4g
KwljYXNlIFNORF9TT0NfREFQTV9QT1NUX1BNVToNCj4gPiArCQlyZWdtYXBfd3JpdGUocnQ3MjEt
PnJlZ21hcCwNCj4gPiArCQkJU0RXX1NEQ0FfQ1RMKEZVTkNfTlVNX0pBQ0tfQ09ERUMsDQo+IFJU
NzIxX1NEQ0FfRU5UX1BERTEyLA0KPiA+ICsJCQkJUlQ3MjFfU0RDQV9DVExfUkVRX1BPV0VSX1NU
QVRFLCAwKSwgcHMwKTsNCj4gPiArCQlicmVhazsNCj4gPiArCWNhc2UgU05EX1NPQ19EQVBNX1BS
RV9QTUQ6DQo+ID4gKwkJcmVnbWFwX3dyaXRlKHJ0NzIxLT5yZWdtYXAsDQo+ID4gKwkJCVNEV19T
RENBX0NUTChGVU5DX05VTV9KQUNLX0NPREVDLA0KPiBSVDcyMV9TRENBX0VOVF9QREUxMiwNCj4g
PiArCQkJCVJUNzIxX1NEQ0FfQ1RMX1JFUV9QT1dFUl9TVEFURSwgMCksIHBzMyk7DQo+ID4gKwkJ
YnJlYWs7DQo+ID4gKwl9DQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiANCj4gV2Ugc2hvdWxk
IHBlcmhhcHMgaW52ZW50IHNvbWUgaGVscGVycyBmb3IgdGhlc2UgU291bmR3aXJlIGV2ZW50cywg
dGhlcmUncw0KPiBjbGVhcmx5IGEgY29tbW9uIHBhdHRlcm4uDQo=
