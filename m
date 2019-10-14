Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 284A8D5959
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 03:48:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 767DF1615;
	Mon, 14 Oct 2019 03:47:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 767DF1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571017688;
	bh=ge6RfIlX6HaNswaEsIAy/M7Q642V161Gg/pPysvaAqc=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W+stDi21XzaNvf9waKPAzfXCUfpsO8uiM3xxVcASoruLqDUmiSEh4KPelxOaB3LQk
	 tRqlKxMxXrpYuueIfGrC9XP4K+70wzQCRQOBzpzWwoqhZUh44tieNXQXl1Mc7bc1Hl
	 /DwezfZS+hUBPz1P11LyjB1TRE359nIfZptDPWHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90AB8F80377;
	Mon, 14 Oct 2019 03:46:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20B92F80376; Mon, 14 Oct 2019 03:46:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 929C6F80369
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 03:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 929C6F80369
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x9E1k2v6026805,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV02.realtek.com.tw[172.21.6.19])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x9E1k2v6026805
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 14 Oct 2019 09:46:02 +0800
Received: from RTEXMB02.realtek.com.tw (172.21.6.95) by
 RTITCASV02.realtek.com.tw (172.21.6.19) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Mon, 14 Oct 2019 09:46:02 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB02.realtek.com.tw (172.21.6.95) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 14 Oct 2019 09:46:02 +0800
Received: from RTEXMB01.realtek.com.tw ([fe80::6d88:58e2:6d4b:ff7c]) by
 RTEXMB01.realtek.com.tw ([fe80::6d88:58e2:6d4b:ff7c%13]) with mapi id
 15.01.1779.005; Mon, 14 Oct 2019 09:46:02 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [PATCH RESEND] ASoC: rt1011: set tx/rx slots from tx/rx_mask in
 TDM case
Thread-Index: AdV9uz8s7BA1DaFhQlqXDSiYXV8bpwAra9MAAPFmWSA=
Date: Mon, 14 Oct 2019 01:46:01 +0000
Message-ID: <e7795e6625b145ecb7f8baf446e61dae@realtek.com>
References: <c0b01f37cdc241a596b12942c8c5172f@realtek.com>
 <20191009141522.GD3929@sirena.co.uk>
In-Reply-To: <20191009141522.GD3929@sirena.co.uk>
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
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH RESEND] ASoC: rt1011: set tx/rx slots from
	tx/rx_mask in TDM case
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

PiBPbiBUdWUsIE9jdCAwOCwgMjAxOSBhdCAwOTozMjowNUFNICswMDAwLCBTaHVtaW5nIFvojIPm
m7jpiphdIHdyb3RlOg0KPiANCj4gPiArCQlpZiAoZmlyc3RfYml0ID09IDAgfHwgZmlyc3RfYml0
ID09IDIgfHwNCj4gPiArCQkJZmlyc3RfYml0ID09IDQgfHwgZmlyc3RfYml0ID09IDYpIHsNCj4g
DQo+IA0KPiA+ICsJCX0gZWxzZSB7DQo+ID4gKwkJfQ0KPiANCj4gVGhpcyB3b3VsZCBiZSBtb3Jl
IGlkaW9tYXRpY2FsbHkgd3JpdHRlbiBhcyBhIHN3aXRjaCBzdGF0ZW1lbnQsIGFzIHdvdWxkIHRo
ZQ0KPiBlcXVpdmFsZW50IHN0dWZmIG9uIHRoZSBUWCBzaWRlLg0KDQpPSywgSSB3aWxsIG1vZGlm
eSBpdCBhcyBhIHN3aXRjaCBzdGF0ZW1lbnQgYW5kIHNlbmQgdjIgcGF0Y2guDQoNCj4gLS0tLS0t
UGxlYXNlIGNvbnNpZGVyIHRoZSBlbnZpcm9ubWVudCBiZWZvcmUgcHJpbnRpbmcgdGhpcyBlLW1h
aWwuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNh
LWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9t
YWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
