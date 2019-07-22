Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F346FF15
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 13:57:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C9631778;
	Mon, 22 Jul 2019 13:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C9631778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563796636;
	bh=hOtnrO5/wl7FwYa8tpuPAzGIachndJbJE3t0MjEU8J8=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZmXs/4yyasVyyyrfEeoUXn+QKU2UCY287XwOuZahaO4HXesjzzKmxWgY6eEXBBrzA
	 HCvIU+kkLpOmepihB66icb2ED3k4Ayh1VPQ7vVoBH/vn4WNxg4/YeXbS1h3UvsQglj
	 c/JoFOfVlpNLsy+lvM3notONBvi2PLl8xlq74DSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54B4EF803D7;
	Mon, 22 Jul 2019 13:55:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 506BFF803D5; Mon, 22 Jul 2019 13:55:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FROM_EXCESS_BASE64,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AB5BF800E8
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 13:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AB5BF800E8
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x6MBtKvF012034,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCAS11.realtek.com.tw[172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x6MBtKvF012034
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 19:55:21 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCAS11.realtek.com.tw ([fe80::7c6d:ced5:c4ff:8297%15]) with mapi id
 14.03.0439.000; Mon, 22 Jul 2019 19:55:20 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: "'Mark Brown'" <broonie@kernel.org>
Thread-Topic: [PATCH 3/3] ASoC: rt1308: Convert headers to SPDX
Thread-Index: AQHVPfvTFzliGBhOyku2Rlx4GhdVx6bRoOuAgAQ8STCAABl4gIAAkvsw//97qYCAAIaMgA==
Date: Mon, 22 Jul 2019 11:55:19 +0000
Message-ID: <10317AB43303BA4884D7AF9C2EBCFF4002BBEAAF@RTITMBSVM07.realtek.com.tw>
References: <20190719063302.18858-1-shumingf@realtek.com>
 <20190719164623.GA14800@sirena.org.uk>
 <10317AB43303BA4884D7AF9C2EBCFF4002BBE03D@RTITMBSVM07.realtek.com.tw>
 <20190722105821.GA4756@sirena.org.uk>
 <10317AB43303BA4884D7AF9C2EBCFF4002BBEA77@RTITMBSVM07.realtek.com.tw>
 <20190722115045.GB4756@sirena.org.uk>
In-Reply-To: <20190722115045.GB4756@sirena.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.105]
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: rt1308: Convert headers to SPDX
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

PiBPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCAxMTo0ODo1MkFNICswMDAwLCBTaHVtaW5nIFvojIPm
m7jpiphdIHdyb3RlOg0KPiANCj4gDQo+ID4gTWF5IEkgY29uZmlybSB3aGF0IHlvdXIgcG9pbnQ/
DQo+ID4gSSBjb252ZXJ0IHRoZSBlbnRpcmUgY29tbWVudCBibG9jayB0byBhIEMrKyBvbmUgbGlr
ZSBiZWxvdy4NCj4gPiAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+IC0v
Kg0KPiA+IC0gKiBydDEzMDguYyAgLS0gIFJUMTMwOCBBTFNBIFNvQyBhbXBsaWZpZXIgY29tcG9u
ZW50IGRyaXZlcg0KPiA+IC0gKg0KPiA+IC0gKiBDb3B5cmlnaHQgMjAxOSBSZWFsdGVrIFNlbWlj
b25kdWN0b3IgQ29ycC4NCj4gPiAtICogQXV0aG9yOiBEZXJlayBGYW5nIDxkZXJlay5mYW5nQHJl
YWx0ZWsuY29tPg0KPiA+IC0gKg0KPiA+IC0gKi8NCj4gPiArLy8NCj4gPiArLy8gcnQxMzA4LmMg
IC0tICBSVDEzMDggQUxTQSBTb0MgYW1wbGlmaWVyIGNvbXBvbmVudCBkcml2ZXIgLy8gLy8NCj4g
PiArQ29weXJpZ2h0IDIwMTkgUmVhbHRlayBTZW1pY29uZHVjdG9yIENvcnAuDQo+ID4gKy8vIEF1
dGhvcjogRGVyZWsgRmFuZyA8ZGVyZWsuZmFuZ0ByZWFsdGVrLmNvbT4gLy8NCj4gDQo+IFllcy4N
Cj4gDQoNCk9rLCBJIHdpbGwgc2VuZCB0aGUgc2Vjb25kIHZlcnNpb24gZm9yIHRoZXNlIHBhdGNo
ZXMuDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
QWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBz
Oi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
