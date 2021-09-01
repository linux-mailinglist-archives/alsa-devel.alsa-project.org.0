Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1937F3FE122
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 19:31:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D458178B;
	Wed,  1 Sep 2021 19:30:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D458178B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630517476;
	bh=k4izvIsDo9GB8QKY3NDT9J8SnobwZBV+7apTXmu0AGY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kRlXmIUGPU6wg7+mtjBTrUsfAl7gQBunGEKawtuPs7SHOOzHQWyqOBVLyd7vjQcCE
	 mkAMtm5dgskKthyY3lcidrg5LH7MZrAcT6zppQLpbutftmK+XVIhRvTd/OJ7GosaSS
	 KyRtw4xsE573jYqlnUh1qvnlBFAYOFm+tTECeFw0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E099F80256;
	Wed,  1 Sep 2021 19:30:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15A99F80254; Wed,  1 Sep 2021 19:29:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42EF4F8020D
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 19:29:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42EF4F8020D
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 181HTN1M0000781,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 181HTN1M0000781
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 2 Sep 2021 01:29:23 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 2 Sep 2021 01:29:21 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 2 Sep 2021 01:29:21 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::ddc7:f5b1:d3ae:8354]) by
 RTEXMBS01.realtek.com.tw ([fe80::ddc7:f5b1:d3ae:8354%5]) with mapi id
 15.01.2106.013; Thu, 2 Sep 2021 01:29:21 +0800
From: Albert Wang <albertwang@realtek.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/2] ASoC: rt5682s: Add driver for ALC5682I-VS codec
Thread-Topic: [PATCH v2 1/2] ASoC: rt5682s: Add driver for ALC5682I-VS codec
Thread-Index: AQHXnmiJB5nBDm4vLU2hBmpqr2/dnauOdaxw//+CXwCAAAF6gIAAPB2AgACm3oCAAJR7DQ==
Date: Wed, 1 Sep 2021 17:29:20 +0000
Message-ID: <E33A207A-7141-4D72-82D3-A59EA5C8CE5C@realtek.com>
References: <20210831130258.19286-1-derek.fang@realtek.com>
 <ee3ba91ee5c24dda9db9d05622d1dfaf@realtek.com>
 <CAOCJVXxPFM4CZ88LPTRp10ExiB1YTvkGYU37aYPBUXcxD2=uyw@mail.gmail.com>
 <CAEy1m_CatKECNf=3-7qZD9OCECfAjaynZ4aoWrfzV518szTL=g@mail.gmail.com>
 <18b688bf0eda4a24ae9897a9b7420530@realtek.com>,
 <20210901163755.GI5976@sirena.org.uk>
In-Reply-To: <20210901163755.GI5976@sirena.org.uk>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-kse-serverinfo: RTEXMBS01.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzkvMSDkuIvljYggMDI6NDQ6MDA=?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 09/01/2021 16:56:03
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 165917 [Sep 01 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: albertwang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 461 461 c95454ca24f64484bdf56c7842a96dd24416624e
X-KSE-AntiSpam-Info: {Tracking_arrow_text}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: chromium-review.googlesource.com:7.1.1; realtek.com:7.1.1;
 127.0.0.199:7.1.2; d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, text}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/01/2021 16:58:00
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, Yu-hsuan
 Hsu <yuhsuan@google.com>, Albert Chen <albertchen@realtek.com>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 Mingjane Hsieh <mingjanehsieh@google.com>,
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

SGkgTWFyaywNCldlIHdvdWxkIGxpa2UgdG8gY29tcGxldGUgdGhlIHVwbG9hZCBpbiBMaW51eCBt
YWludGFpbmVyLCB0aGVuIGZpbmlzaCB0aGUgdXBzdHJlYW0gcHJvY2VzcyBpbiBnb29nbGUgc2lk
ZS4gTWF5IEkgbGVhcm4gZnJvbSB5b3Ugd2hlbiB0aGUgdmVyaWZpY2F0aW9uIGNvdWxkIGJlIGRv
bmU/DQoNClRoYW5rIHlvdS4NCg0KPiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+IOaW
vCAyMDIx5bm0OeaciDLml6Ug5LiK5Y2IMTI6Mzgg5a+r6YGT77yaDQo+IA0KPiDvu79PbiBXZWQs
IFNlcCAwMSwgMjAyMSBhdCAwNjo0MDo0MUFNICswMDAwLCBEZXJlayBb5pa55b63576pXSB3cm90
ZToNCj4gDQo+PiBIYXMgdXBsb2FkZWQgdGhlIENMLiBQbGVhc2UgaGVscCB0byBjaGVjay4NCj4+
IGh0dHBzOi8vY2hyb21pdW0tcmV2aWV3Lmdvb2dsZXNvdXJjZS5jb20vYy9jaHJvbWl1bW9zL3Ro
aXJkX3BhcnR5L2tlcm5lbC8rLzMxMzUwNTMNCj4gDQo+IEknbSBub3Qgc3VyZSB3aGF0IHRoaXMg
ZGlzY3Vzc2lvbiBpcyBidXQgSSdtIG5vdCBzdXJlIHlvdSB3YW50ZWQgdG8gY29weQ0KPiBpbiB1
cHN0cmVhbSBoZXJlPw0KPiAtLS0tLS1QbGVhc2UgY29uc2lkZXIgdGhlIGVudmlyb25tZW50IGJl
Zm9yZSBwcmludGluZyB0aGlzIGUtbWFpbC4NCg==
