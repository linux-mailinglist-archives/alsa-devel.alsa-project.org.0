Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6088F2B3B2E
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 02:33:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAFA816A4;
	Mon, 16 Nov 2020 02:32:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAFA816A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605490390;
	bh=X2WxKLsBReh+3FGvzxhwnj/i/kMVONIyLV/XZ0U6NBY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ko76J+vLk7swoamXsD85ABjmr6yJ32QKYznkQMWXjuFuASt15sBq3yeOa13bwM5yJ
	 AL5ItmTBcUhRyrIYffTqkSYhC3IvR7ii0sbBnrFC24Yms/hmHL7eie2NQfaAXZTdqO
	 MAY7jtkouY0V2KPkr68WH2NqdGqlnYQinlJCEsy4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C880F800D8;
	Mon, 16 Nov 2020 02:31:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D0C1F801F5; Mon, 16 Nov 2020 02:31:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90307F8010A
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 02:31:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90307F8010A
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0AG1VBt94021296,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb04.realtek.com.tw[172.21.6.97])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0AG1VBt94021296
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 16 Nov 2020 09:31:11 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXMB04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Mon, 16 Nov 2020 09:31:11 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2]) by
 RTEXMBS01.realtek.com.tw ([fe80::513b:ca8:6e55:15a2%8]) with mapi id
 15.01.2106.003; Mon, 16 Nov 2020 09:31:11 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: "'Pierre-Louis Bossart'" <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>
Subject: RE: [PATCH 2/2] ASoC: rt5682: Add a new property to the device tree.
Thread-Topic: [PATCH 2/2] ASoC: rt5682: Add a new property to the device tree.
Thread-Index: AQHWuYFmsQVMWzi0W0yA1eRm34n046nFoI4AgARaS4A=
Date: Mon, 16 Nov 2020 01:31:11 +0000
Message-ID: <23b6a2cc25cc43cda7a6a8cf51a2f5aa@realtek.com>
References: <20201113055400.11242-1-oder_chiou@realtek.com>
 <20201113055400.11242-2-oder_chiou@realtek.com>
 <744fbc6c-f2e9-15e2-fef4-9532c87f5d7c@linux.intel.com>
In-Reply-To: <744fbc6c-f2e9-15e2-fef4-9532c87f5d7c@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.193]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "cychiang@google.com" <cychiang@google.com>,
 Albert Chen <albertchen@realtek.com>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQv
cnQ1NjgyLnR4dA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5k
L3J0NTY4Mi50eHQNCj4gPiBpbmRleCA3MDdmYTk4ZDEzMTAuLjljNWZhZGI2YWM4MiAxMDA2NDQN
Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvcnQ1Njgy
LnR4dA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9y
dDU2ODIudHh0DQo+ID4gQEAgLTQ0LDYgKzQ0LDggQEAgT3B0aW9uYWwgcHJvcGVydGllczoNCj4g
PiAgIC0gcmVhbHRlayxkbWljLWRlbGF5LW1zIDogU2V0IHRoZSBkZWxheSB0aW1lIChtcykgZm9y
IHRoZSByZXF1aXJlbWVudCBvZg0KPiA+ICAgICB0aGUgcGFydGljdWxhciBETUlDLg0KPiA+DQo+
ID4gKy0gcmVhbHRlayxkbWljLWNsay1kcml2aW5nLWhpZ2ggOiBTZXQgdGhlIGhpZ2ggZHJ2aW5n
IG9mIHRoZSBETUlDIGNsb2NrIG91dC4NCj4gDQo+IGRyaXZpbmc/DQo+IA0KPiBJIG11c3QgYWRt
aXQgSSBhY3R1YWxseSBkb24ndCB1bmRlcnN0YW5kIHdoYXQgJ2RtaWMtY2xrLWRyaXZpbmctaGln
aCcNCj4gbWVhbnMsIGEgY2xvY2sgaXMgYnkgZGVmaW5pdGlvbiBkdWFsLXBoYXNlIGFuZCB3ZSB1
c2UgYm90aCByaXNpbmcgYW5kIGZhbGxpbmcNCj4gZWRnZXMgZm9yIHRoZSBtaWNzLg0KPiANCj4g
T3IgZHJpdmluZyBoaWdoIHdoZW4gaWRsZT8NClRoYXQgcmVkdWNlcyB0aGUgcmlzaW5nIHRpbWUg
YW5kIGZhbGxpbmcgdGltZSB3aGlsZSB0aGUgY2xvY2sgaXMgb3V0cHV0LA0KYW5kIG5vdCBkcml2
aW5nIGhpZ2ggYWx3YXlzIHdoZW4gaWRsZSwgdGhhbmtzLg0K
