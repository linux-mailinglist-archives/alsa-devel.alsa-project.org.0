Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B3369178A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 05:19:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37EBB846;
	Fri, 10 Feb 2023 05:18:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37EBB846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676002768;
	bh=RdrUc4xEWZWu/HfeoZa2MuBzYB0znn5K4t2i1AWXRFU=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QOdi92QjRelIjlu7e7PBQP1+Qk6kqr1Eh2uyEnnRzNzpOE74b7L3V3Lki1XFRAIPA
	 /wB88XPNgf70mO3vjGuvczmz7UYgStNUtJ/HtpKTGUWiAwE3isx6SCZutlnStbzA+S
	 5H49l350ea9pMq5JV+WmB/6Dzk7zoRMWySCpmRUM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AFAAF800B8;
	Fri, 10 Feb 2023 05:18:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1302BF800E4; Fri, 10 Feb 2023 05:18:22 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C9E19F8001E
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 05:18:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9E19F8001E
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 31A4I2wuC030077,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 31A4I2wuC030077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 10 Feb 2023 12:18:02 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.9; Fri, 10 Feb 2023 12:18:02 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Fri, 10 Feb 2023 12:18:02 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::98d2:65f8:dcdf:fa31]) by
 RTEXMBS01.realtek.com.tw ([fe80::98d2:65f8:dcdf:fa31%5]) with mapi id
 15.01.2375.007; Fri, 10 Feb 2023 12:18:02 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH] ASoC: rt712-sdca: Add RT712 SDCA driver for Jack and Amp
 topology
Thread-Topic: [PATCH] ASoC: rt712-sdca: Add RT712 SDCA driver for Jack and Amp
 topology
Thread-Index: AQHZOtPwW/rkhLECmUWrzmB7N0Gtf67GNZmAgAE7xxA=
Date: Fri, 10 Feb 2023 04:18:02 +0000
Message-ID: <193bcc2679d741f6ac4a391d047597c3@realtek.com>
References: <20230207090946.20659-1-shumingf@realtek.com>
 <Y+UM9druIQDacdgX@sirena.org.uk>
In-Reply-To: <Y+UM9druIQDacdgX@sirena.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.209]
x-kse-serverinfo: RTEXMBS06.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: 
 =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIzLzIvMTAgpFekyCAwMjoxNzowMA==?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: LGKMZIXIS3ERCZHO7ABXGGYPU53GQPPY
X-Message-ID-Hash: LGKMZIXIS3ERCZHO7ABXGGYPU53GQPPY
X-MailFrom: shumingf@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 =?big5?B?RGVyZWsgW6TovHe4cV0=?= <derek.fang@realtek.com>,
 "pierre-louis.bossart@intel.com" <pierre-louis.bossart@intel.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGKMZIXIS3ERCZHO7ABXGGYPU53GQPPY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiA+ICsJLyogcGluIGF0dGFjaGVkICovDQo+ID4gKwlpZiAoZGV0X21vZGUpIHsNCj4gPiArCQkv
KiByZWFkIFVNUCBtZXNzYWdlIG9mZnNldCAqLw0KPiA+ICsJCXJldCA9IHJlZ21hcF9yZWFkKHJ0
NzEyLT5yZWdtYXAsDQo+IA0KPiA+ICsJCQl9DQo+ID4gKwkJfQ0KPiA+ICsJfSBlbHNlDQo+ID4g
KwkJcnQ3MTItPmphY2tfdHlwZSA9IDA7DQo+IA0KPiBJZiBvbmUgc2lkZSBvZiBhbiBpZiBoYXMg
eyB9IHRoZSBvdGhlciBzaWRlIHNob3VsZCB0b28gZm9yIGNsYXJpdHkuDQoNClN1cmUsIHdpbGwg
c2VuZCBwYXRjaCB0byBmaXguDQoNCj4gLS0tLS0tUGxlYXNlIGNvbnNpZGVyIHRoZSBlbnZpcm9u
bWVudCBiZWZvcmUgcHJpbnRpbmcgdGhpcyBlLW1haWwuDQo=
