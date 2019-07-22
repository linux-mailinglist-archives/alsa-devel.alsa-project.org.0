Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5ED6FEFB
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 13:51:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4672A1767;
	Mon, 22 Jul 2019 13:50:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4672A1767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563796272;
	bh=aeYvsjxza0a9XpjxuqegPgfoIRrSzsABP7S5HRIiHV4=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YKUJXy072I225OD9XIXxcsIaYcob1+qPo7YaVgFCcKGnF+dfQIJwEX1s0r+jeei4e
	 0v25+IRyo1WP/SqTGBxMdO7D7dpFG5v+8QTKnR5iFUnajeyjGgjsU7+5UHwsZPYp1h
	 yt494+FXeoTTS7sozjqz9GhNNnYtSOhUMpjTommQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79AC6F803D7;
	Mon, 22 Jul 2019 13:49:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4198DF803D5; Mon, 22 Jul 2019 13:49:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FROM_EXCESS_BASE64,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB09DF8015B
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 13:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB09DF8015B
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x6MBmrIf011203,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x6MBmrIf011203
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 22 Jul 2019 19:48:53 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCASV01.realtek.com.tw ([::1]) with mapi id 14.03.0439.000; Mon, 22 Jul
 2019 19:48:53 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: "'Mark Brown'" <broonie@kernel.org>
Thread-Topic: [PATCH 3/3] ASoC: rt1308: Convert headers to SPDX
Thread-Index: AQHVPfvTFzliGBhOyku2Rlx4GhdVx6bRoOuAgAQ8STCAABl4gIAAkvsw
Date: Mon, 22 Jul 2019 11:48:52 +0000
Message-ID: <10317AB43303BA4884D7AF9C2EBCFF4002BBEA77@RTITMBSVM07.realtek.com.tw>
References: <20190719063302.18858-1-shumingf@realtek.com>
 <20190719164623.GA14800@sirena.org.uk>
 <10317AB43303BA4884D7AF9C2EBCFF4002BBE03D@RTITMBSVM07.realtek.com.tw>
 <20190722105821.GA4756@sirena.org.uk>
In-Reply-To: <20190722105821.GA4756@sirena.org.uk>
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

PiBPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCAwMjowNzo0N0FNICswMDAwLCBTaHVtaW5nIFvojIPm
m7jpiphdIHdyb3RlOg0KPiA+ID4gT24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDI6MzM6MDJQTSAr
MDgwMCwgc2h1bWluZ2ZAcmVhbHRlay5jb20gd3JvdGU6DQo+IA0KPiA+ID4gPiBAQCAtMSwxMiAr
MSwxMCBAQA0KPiA+ID4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4g
PiA+ID4gIC8qDQo+ID4gPiA+ICAgKiBydDEzMDguYyAgLS0gIFJUMTMwOCBBTFNBIFNvQyBhbXBs
aWZpZXIgY29tcG9uZW50IGRyaXZlcg0KPiA+ID4gPiAgICoNCj4gDQo+ID4gPiBQbGVhc2UgY29u
dmVydCB0aGUgZW50aXJlIGNvbW1lbnQgYmxvY2sgdG8gYSBDKysgb25lIHNvIHRoaXMgbG9va3MN
Cj4gPiA+IG1vcmUgaW50ZW50aW9uYWwuDQo+IA0KPiA+IEkgY29udmVydCB0aGUgY29tbWVudCBs
aWtlIGJlbG93Lg0KPiA+IC0vLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+
ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLw0KPiANCj4gVGhhdCdzIGEg
QyBjb21tZW50LCBub3QgYSBDKysgY29tbWVudC4gIEknbSBzYXlpbmcgY29udmVydCB0aGUgd2hv
bGUgYmxvY2sNCj4gdGhlcmUgdG8gQysrIHJhdGhlciB0aGFuIGFkZCBvbmUgcmFuZG9tIGxpbmUg
dGhhdCdzIEMrKyBuZXh0IHRvIHNvbWUgQw0KPiBjb21tZW50cy4NCj4gDQoNCk1heSBJIGNvbmZp
cm0gd2hhdCB5b3VyIHBvaW50Pw0KSSBjb252ZXJ0IHRoZSBlbnRpcmUgY29tbWVudCBibG9jayB0
byBhIEMrKyBvbmUgbGlrZSBiZWxvdy4NCi8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wDQotLyoNCi0gKiBydDEzMDguYyAgLS0gIFJUMTMwOCBBTFNBIFNvQyBhbXBsaWZpZXIgY29t
cG9uZW50IGRyaXZlcg0KLSAqDQotICogQ29weXJpZ2h0IDIwMTkgUmVhbHRlayBTZW1pY29uZHVj
dG9yIENvcnAuDQotICogQXV0aG9yOiBEZXJlayBGYW5nIDxkZXJlay5mYW5nQHJlYWx0ZWsuY29t
Pg0KLSAqDQotICovDQorLy8NCisvLyBydDEzMDguYyAgLS0gIFJUMTMwOCBBTFNBIFNvQyBhbXBs
aWZpZXIgY29tcG9uZW50IGRyaXZlcg0KKy8vDQorLy8gQ29weXJpZ2h0IDIwMTkgUmVhbHRlayBT
ZW1pY29uZHVjdG9yIENvcnAuDQorLy8gQXV0aG9yOiBEZXJlayBGYW5nIDxkZXJlay5mYW5nQHJl
YWx0ZWsuY29tPg0KKy8vDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
