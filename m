Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F40E8FDE2D
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 07:41:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 356071DC;
	Thu,  6 Jun 2024 07:40:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 356071DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717652464;
	bh=UIEH/DD7DhbfRcFqusFUd2gYIuUUzLvSwJU33ex8DKg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m+UHYXxtNvuTIkrPA35Z0mDfhlJANfP+RXgevhnzYruk4k/BTMsEVp4mPS1u44sRS
	 x83HAireLo/omevF/9UxQWxXYmtLFM2eGOkjovCPXZcfJR4oNBj/Hh10FIr1wNuBzd
	 mbmdjnHvrCP8BhIGZXK8SSaajoB89LN95/qoa6VY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE9E6F804B0; Thu,  6 Jun 2024 07:40:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54397F80589;
	Thu,  6 Jun 2024 07:40:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8B41F8025A; Thu,  6 Jun 2024 07:36:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 351C4F8001D
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 07:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 351C4F8001D
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4565aHRA12431500,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 4565aHRA12431500
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jun 2024 13:36:17 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 13:36:18 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 6 Jun 2024 13:36:17 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975]) by
 RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975%5]) with mapi id
 15.01.2507.035; Thu, 6 Jun 2024 13:36:17 +0800
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
Subject: RE: [PATCH v2] ASoC: rt1318: Add RT1318 audio amplifier driver
Thread-Topic: [PATCH v2] ASoC: rt1318: Add RT1318 audio amplifier driver
Thread-Index: Adq3MgPPaXwXWALDRgGDWFIu2GO5hv//27IA//6ZcEA=
Date: Thu, 6 Jun 2024 05:36:17 +0000
Message-ID: <4b432ac70eb5487ea4be8d701803079d@realtek.com>
References: <11f7e2c1a77f418a9965b96b81f6e660@realtek.com>
 <bc781eb4-ac0b-4750-83fa-44bf371cea5b@linux.intel.com>
In-Reply-To: <bc781eb4-ac0b-4750-83fa-44bf371cea5b@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.22.102.102]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: 6AD47N56MHADVNWXDI5MHIJEDNTSDAKU
X-Message-ID-Hash: 6AD47N56MHADVNWXDI5MHIJEDNTSDAKU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6AD47N56MHADVNWXDI5MHIJEDNTSDAKU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiBFeHRlcm5hbCBtYWlsLg0KPiANCj4gDQo+IA0KPiA+ICtzdGF0aWMgc3RydWN0IHJlZ19zZXF1
ZW5jZSBpbml0X2xpc3RbXSA9IHsNCj4gPiArICAgICB7IDB4NDEwMDE4ODgsIDB4MDB9LA0KPiA+
ICsgICAgIHsgMHgwMDAwQzEyMSwgMHgwQn0sDQo+IA0KPiArICAgICAgIHsgMHgwMDAwQzEyMSwg
MHgwQiwgMTAwfSwNCj4gDQo+IGluIHRoZSB2MSwgdGhpcyByZWdpc3RlciBuZWVkZWQgYSAxMDB1
cyBkZWxheSwgaXMgdGhpcyBubyBsb25nZXIgcmVxdWlyZWQ/DQo+IA0KWWVzLCBJIGRpZCB0ZXN0
IHllc3RlcmRheSBhbmQgdGhpcyBkZWxheSBjb3VsZCBiZSBpZ25vcmVkLg0K
