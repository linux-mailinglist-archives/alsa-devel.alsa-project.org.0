Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FADB2088A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 15:48:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21D5416DC;
	Thu, 16 May 2019 15:48:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21D5416DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558014538;
	bh=QUioqOsLG9OyO96mxkYw31QHTSwQGxTMTcXwvOqripw=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ioX3M3TpJFgMhD9iaeZ4WlnysfKjDAXm24hE/2xmGln+I6B92I8FhKgBKj4JDjVWg
	 HtpxtsbeXA8ELjadmmhPhLn55tz9WjSshCwi8/Zxct80HDjPq8dC99Mtav5y1/Xo+5
	 Egz05XfGZlY8g1+1k5U68Wac4xOu13O1cvi69d8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CF27F89693;
	Thu, 16 May 2019 15:47:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFFE5F896B6; Thu, 16 May 2019 15:47:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FROM_EXCESS_BASE64,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0B68F80C18
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 15:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0B68F80C18
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x4GDktvK030413,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcasv02.realtek.com.tw[172.21.6.19])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x4GDktvK030413
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 16 May 2019 21:46:56 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCASV02.realtek.com.tw ([::1]) with mapi id 14.03.0439.000; Thu, 16 May
 2019 21:46:55 +0800
From: =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [PATCH] ASoC: rt1308: Add RT1308 amplifier driver
Thread-Index: AQHU8/tPQAgeauF2zUGmBO/aeAeg+qY+ZeAAgAGgD9D//+nuAIAJq9sAgBbJfoCAAM/mQIAFj/yAgAJ0bhD//5BlAIABxHoQgAF2E4CAAe2iwA==
Date: Thu, 16 May 2019 13:46:53 +0000
Message-ID: <BC6F7617C38F3E4E8CA887E07B35B82805B15635@RTITMBSVM07.realtek.com.tw>
References: <20190416153510.GE4834@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B8280116192E@RTITMBSVM07.realtek.com.tw>
 <20190417150518.GB5703@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B828011660AC@RTITEXDAG02.realtek.com.tw>
 <20190508064537.GN14916@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B82805B1144E@RTITMBSVM07.realtek.com.tw>
 <20190512080621.GH21483@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B82805B13EE2@RTITMBSVM07.realtek.com.tw>
 <20190513145608.GA5168@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B82805B14BFF@RTITMBSVM07.realtek.com.tw>
 <20190515161429.GH5613@sirena.org.uk>
In-Reply-To: <20190515161429.GH5613@sirena.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.141]
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Albert Chen <albertchen@realtek.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1308: Add RT1308 amplifier driver
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

PiBTdWJqZWN0OiBSZTogW1BBVENIXSBBU29DOiBydDEzMDg6IEFkZCBSVDEzMDggYW1wbGlmaWVy
IGRyaXZlcg0KPiANCj4gT24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTE6MTA6NThBTSArMDAwMCwg
RGVyZWsgW+aWueW+t+e+qV0gd3JvdGU6DQo+IA0KPiA+IEkgY291bGQgcmVtb3ZlIGNvbW1lbnQg
Zm9yIHRoZSBsaW1pdCBzZXR0aW5nIGluIHJlZ2lzdGVyIHBhdGNoL2luaXQgbGlzdA0KPiA+IHRv
IGF2b2lkIHVzZXJzIG9yIGludGVncmF0b3JzIGhhdmUgYW55IGV4cGVjdGF0aW9uLg0KPiA+IEFu
ZCBhbHNvIHRoZXJlIHdpbGwgbm90IGJlIGFueSBzdXBwb3J0IGF0IGFsbCB0aGUgZHJpdmVyIGFj
Y29yZGluZyB0byB0aGUNCj4gPiBsaW1pdCBzZXR0aW5nLg0KPiANCj4gSXQncyBiZXR0ZXIgdG8g
aGF2ZSBhIGNvbW1lbnQgdGhhbiBub3QgaGF2ZSBvbmUsIEkgdGhpbmsgSSdkIGJlIGhhcHBpZXIN
Cj4gaWYgSSB1bmRlcnN0b29kIHdoYXQgd2FzIGFjdHVhbGx5IGJlaW5nIGxpbWl0ZWQgaGVyZSAt
IHRoYXQgbWlnaHQgbWFrZQ0KPiBpdCBjbGVhciB3aHkgaXQncyBub3Qgc3lzdGVtIHNwZWNpZmlj
IHdoaWNoIGlzIHdoYXQncyBjb25jZXJuaW5nIG1lLg0KDQpJIHdpbGwgZ2l2ZSBhIGNvbW1lbnQg
dGhhdCBkZXNjcmliZXMgdGhlIGxpbWl0IHNldHRpbmcgcmVhc29uIGNsZWFybHkuDQoNCj4gLS0t
LS0tUGxlYXNlIGNvbnNpZGVyIHRoZSBlbnZpcm9ubWVudCBiZWZvcmUgcHJpbnRpbmcgdGhpcyBl
LW1haWwuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpB
bHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6
Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
