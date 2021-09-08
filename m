Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6301240328C
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Sep 2021 04:18:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6E4E1716;
	Wed,  8 Sep 2021 04:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6E4E1716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631067526;
	bh=KksJexa1ikWcwnsHbdgSSbxQ4JugtV/76Aj3Qfajs3k=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vumMEaNuZ0in9gvPHSNoN3vfP005I9UX0BEGhxTyc6IA1diN2sEvbz66kCLMuYLPX
	 L10anKr1u86+P2tAhJPy/5jwYiiOSA5S9syK2/hK5/RhDvHg6z8Z7uEMp9SOEV9w54
	 4NpsUdvW9v8a5ujXb54EM8cYfqYmr0poNZP4S6m4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BE02F800C7;
	Wed,  8 Sep 2021 04:17:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B161BF802E7; Wed,  8 Sep 2021 04:17:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FBCAF800C7
 for <alsa-devel@alsa-project.org>; Wed,  8 Sep 2021 04:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FBCAF800C7
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1882H9opC007702,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1882H9opC007702
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 8 Sep 2021 10:17:09 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 8 Sep 2021 10:17:08 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 8 Sep 2021 10:17:08 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::ddc7:f5b1:d3ae:8354]) by
 RTEXMBS01.realtek.com.tw ([fe80::ddc7:f5b1:d3ae:8354%5]) with mapi id
 15.01.2106.013; Wed, 8 Sep 2021 10:17:08 +0800
From: Jack Yu <jack.yu@realtek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>
Subject: RE: [PATCH] ASoC: rt1011: add i2s reference control for rt1011
Thread-Topic: [PATCH] ASoC: rt1011: add i2s reference control for rt1011
Thread-Index: AQHXowertNFJ8/ODj0GUsGW05g6DBauYJBOAgAFDX0A=
Date: Wed, 8 Sep 2021 02:17:07 +0000
Message-ID: <05e92a24b1c34daeb64e5b222a3ae337@realtek.com>
References: <20210906101208.11585-1-jack.yu@realtek.com>
 <3062f5e5-d2d7-8150-ef89-989af3b4b1d6@linux.intel.com>
In-Reply-To: <3062f5e5-d2d7-8150-ef89-989af3b4b1d6@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.167]
x-kse-serverinfo: RTEXDAG02.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzkvNyDkuIvljYggMTA6NDA6MDA=?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 09/08/2021 02:01:23
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 166001 [Sep 07 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: jack.yu@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 462 462 1a6116ea9b31dd376a9cb3bdb1669e517de75784
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 realtek.com:7.1.1; 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, text}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/08/2021 02:03:00
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?utf-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=
 <kent_chen@realtek.com>,
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBpZXJyZS1Mb3VpcyBCb3Nz
YXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIFNlcHRlbWJlciA3LCAyMDIxIDEwOjU0IFBNDQo+IFRvOiBKYWNrIFl1IDxqYWNrLnl1QHJl
YWx0ZWsuY29tPjsgYnJvb25pZUBrZXJuZWwub3JnOw0KPiBsZ2lyZHdvb2RAZ21haWwuY29tDQo+
IENjOiBPZGVyIENoaW91IDxvZGVyX2NoaW91QHJlYWx0ZWsuY29tPjsgYWxzYS1kZXZlbEBhbHNh
LXByb2plY3Qub3JnOw0KPiBsYXJzQG1ldGFmb28uZGU7IGtlbnRfY2hlbkByZWFsdGVrLmNvbSBb
6Zmz5bu65a6PXQ0KPiA8a2VudF9jaGVuQHJlYWx0ZWsuY29tPjsgRGVyZWsgW+aWueW+t+e+qV0g
PGRlcmVrLmZhbmdAcmVhbHRlay5jb20+Ow0KPiBTaHVtaW5nIFvojIPmm7jpiphdIDxzaHVtaW5n
ZkByZWFsdGVrLmNvbT47IEZsb3ZlKEhzaW5GdSkNCj4gPGZsb3ZlQHJlYWx0ZWsuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIXSBBU29DOiBydDEwMTE6IGFkZCBpMnMgcmVmZXJlbmNlIGNvbnRy
b2wgZm9yIHJ0MTAxMQ0KPiANCj4gT24gOS82LzIxIDU6MTIgQU0sIEphY2sgWXUgd3JvdGU6DQo+
ID4gQWRkIGkycyByZWZlcmVuY2UgY29udHJvbCBmb3IgcnQxMDExIGFtcC4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IEphY2sgWXUgPGphY2sueXVAcmVhbHRlay5jb20+DQo+IA0KPiA+ICtzdGF0
aWMgY29uc3QgY2hhciAqIGNvbnN0IHJ0MTAxMV9pMnNfcmVmW10gPSB7DQo+ID4gKwkiTm9uZSIs
ICJMZWZ0IENoYW5uZWwiLCAiUmlnaHQgQ2hhbm5lbCINCj4gPiArfTsNCj4gDQo+ID4gK2VudW0g
ew0KPiA+ICsJUlQxMDExX0kyU19SRUZfTk9ORSwNCj4gPiArCVJUMTAxMV9JMlNfUkVGX0xFRlRf
Q0gsDQo+ID4gKwlSVDEwMTFfSTJTX1JFRl9SSUdIVF9DSCwNCj4gPiArfTsNCj4gDQo+IGlzIGl0
IHBvc3NpYmxlIHRvIGdldCBMZWZ0LVJpZ2h0LW1peCAobWl4ZWQgb24gcnQxMDExKSBhbmQgTGVm
dC1SaWdodCAodHdvDQo+IGNoYW5uZWxzLCB3aXRoIHRoZSBhcHBsaWNhdGlvbiBzZWxlY3Rpbmcg
d2hhdCB0aGV5IHdhbnQpPw0KDQpJdCdzIGEgbW9ubyBhbXAsIHNvIHRoZXJlJ3Mgbm8gTGVmdC1S
aWdodC1taXggc2V0dGluZy4gDQpBbmQgZm9yIHRoZSBjaG9pY2Ugb2YgTGVmdC1SaWdodCBjaGFu
bmVsLCBpdCdzIGFscmVhZHkgYXZhaWxhYmxlIHdpdGggdGhpcyBwYXRjaC4NCg0KPiANCj4gLS0t
LS0tUGxlYXNlIGNvbnNpZGVyIHRoZSBlbnZpcm9ubWVudCBiZWZvcmUgcHJpbnRpbmcgdGhpcyBl
LW1haWwuDQo=
