Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A78B04043B2
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 04:42:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36A331685;
	Thu,  9 Sep 2021 04:41:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36A331685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631155335;
	bh=rtEalqRqknkqrxlSCEnSFhQ/SvApjoDj+yV3VKvKWMM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OUtzKZAhEo8TzSm4MNU/tggg6nvO4I/YtKJN8VIqofyaxboLRChWj5lqqAK7vxHL6
	 qexj6wexCnoMjzCmMC3gJ5h5luJgG3seqn06y4vdaB5OLC89XpTcylmkpxlU2E1Cz6
	 glJtV0/6sIUUmGQzsmHzExPaTQAePGqQWQYskTno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9074FF80253;
	Thu,  9 Sep 2021 04:40:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B23F9F80224; Thu,  9 Sep 2021 04:40:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1CC4F80166
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 04:40:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1CC4F80166
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1892edfxF009612,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (mapi.realtek.com[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1892edfxF009612
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 9 Sep 2021 10:40:39 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 9 Sep 2021 10:40:39 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 9 Sep 2021 10:40:38 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::ddc7:f5b1:d3ae:8354]) by
 RTEXMBS01.realtek.com.tw ([fe80::ddc7:f5b1:d3ae:8354%5]) with mapi id
 15.01.2106.013; Thu, 9 Sep 2021 10:40:38 +0800
From: Jack Yu <jack.yu@realtek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>
Subject: RE: [PATCH] ASoC: rt1011: add i2s reference control for rt1011
Thread-Topic: [PATCH] ASoC: rt1011: add i2s reference control for rt1011
Thread-Index: AQHXowertNFJ8/ODj0GUsGW05g6DBauYJBOAgAFDX0CAAFcdAIABQysg
Date: Thu, 9 Sep 2021 02:40:38 +0000
Message-ID: <a9d9074e52c941e8bddc34f4d364a1ae@realtek.com>
References: <20210906101208.11585-1-jack.yu@realtek.com>
 <3062f5e5-d2d7-8150-ef89-989af3b4b1d6@linux.intel.com>
 <05e92a24b1c34daeb64e5b222a3ae337@realtek.com>
 <9f76a420-44c6-ad6d-4442-275ba4459b40@linux.intel.com>
In-Reply-To: <9f76a420-44c6-ad6d-4442-275ba4459b40@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.167]
x-kse-serverinfo: RTEXMBS05.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzkvOSDkuIrljYggMTI6MDI6MDA=?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
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
YXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgU2VwdGVtYmVyIDgsIDIwMjEgMTE6MjMgUE0NCj4gVG86IEphY2sgWXUgPGphY2sueXVA
cmVhbHRlay5jb20+OyBicm9vbmllQGtlcm5lbC5vcmc7DQo+IGxnaXJkd29vZEBnbWFpbC5jb20N
Cj4gQ2M6IE9kZXIgQ2hpb3UgPG9kZXJfY2hpb3VAcmVhbHRlay5jb20+OyBhbHNhLWRldmVsQGFs
c2EtcHJvamVjdC5vcmc7DQo+IGxhcnNAbWV0YWZvby5kZTsga2VudF9jaGVuQHJlYWx0ZWsuY29t
IFvpmbPlu7rlro9dDQo+IDxrZW50X2NoZW5AcmVhbHRlay5jb20+OyBEZXJlayBb5pa55b63576p
XSA8ZGVyZWsuZmFuZ0ByZWFsdGVrLmNvbT47DQo+IFNodW1pbmcgW+iMg+abuOmKmF0gPHNodW1p
bmdmQHJlYWx0ZWsuY29tPjsgRmxvdmUoSHNpbkZ1KQ0KPiA8ZmxvdmVAcmVhbHRlay5jb20+DQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIEFTb0M6IHJ0MTAxMTogYWRkIGkycyByZWZlcmVuY2UgY29u
dHJvbCBmb3IgcnQxMDExDQo+IA0KPiBPbiA5LzcvMjEgOToxNyBQTSwgSmFjayBZdSB3cm90ZToN
Cj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBQaWVycmUt
TG91aXMgQm9zc2FydCA8cGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tPg0KPiA+
PiBTZW50OiBUdWVzZGF5LCBTZXB0ZW1iZXIgNywgMjAyMSAxMDo1NCBQTQ0KPiA+PiBUbzogSmFj
ayBZdSA8amFjay55dUByZWFsdGVrLmNvbT47IGJyb29uaWVAa2VybmVsLm9yZzsNCj4gPj4gbGdp
cmR3b29kQGdtYWlsLmNvbQ0KPiA+PiBDYzogT2RlciBDaGlvdSA8b2Rlcl9jaGlvdUByZWFsdGVr
LmNvbT47IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsNCj4gPj4gbGFyc0BtZXRhZm9vLmRl
OyBrZW50X2NoZW5AcmVhbHRlay5jb20gW+mZs+W7uuWuj10NCj4gPj4gPGtlbnRfY2hlbkByZWFs
dGVrLmNvbT47IERlcmVrIFvmlrnlvrfnvqldIDxkZXJlay5mYW5nQHJlYWx0ZWsuY29tPjsNCj4g
Pj4gU2h1bWluZyBb6IyD5pu46YqYXSA8c2h1bWluZ2ZAcmVhbHRlay5jb20+OyBGbG92ZShIc2lu
RnUpDQo+ID4+IDxmbG92ZUByZWFsdGVrLmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSF0g
QVNvQzogcnQxMDExOiBhZGQgaTJzIHJlZmVyZW5jZSBjb250cm9sIGZvcg0KPiA+PiBydDEwMTEN
Cj4gPj4NCj4gPj4gT24gOS82LzIxIDU6MTIgQU0sIEphY2sgWXUgd3JvdGU6DQo+ID4+PiBBZGQg
aTJzIHJlZmVyZW5jZSBjb250cm9sIGZvciBydDEwMTEgYW1wLg0KPiA+Pj4NCj4gPj4+IFNpZ25l
ZC1vZmYtYnk6IEphY2sgWXUgPGphY2sueXVAcmVhbHRlay5jb20+DQo+ID4+DQo+ID4+PiArc3Rh
dGljIGNvbnN0IGNoYXIgKiBjb25zdCBydDEwMTFfaTJzX3JlZltdID0gew0KPiA+Pj4gKwkiTm9u
ZSIsICJMZWZ0IENoYW5uZWwiLCAiUmlnaHQgQ2hhbm5lbCINCj4gPj4+ICt9Ow0KPiA+Pg0KPiA+
Pj4gK2VudW0gew0KPiA+Pj4gKwlSVDEwMTFfSTJTX1JFRl9OT05FLA0KPiA+Pj4gKwlSVDEwMTFf
STJTX1JFRl9MRUZUX0NILA0KPiA+Pj4gKwlSVDEwMTFfSTJTX1JFRl9SSUdIVF9DSCwNCj4gPj4+
ICt9Ow0KPiA+Pg0KPiA+PiBpcyBpdCBwb3NzaWJsZSB0byBnZXQgTGVmdC1SaWdodC1taXggKG1p
eGVkIG9uIHJ0MTAxMSkgYW5kIExlZnQtUmlnaHQNCj4gPj4gKHR3byBjaGFubmVscywgd2l0aCB0
aGUgYXBwbGljYXRpb24gc2VsZWN0aW5nIHdoYXQgdGhleSB3YW50KT8NCj4gPg0KPiA+IEl0J3Mg
YSBtb25vIGFtcCwgc28gdGhlcmUncyBubyBMZWZ0LVJpZ2h0LW1peCBzZXR0aW5nLg0KPiA+IEFu
ZCBmb3IgdGhlIGNob2ljZSBvZiBMZWZ0LVJpZ2h0IGNoYW5uZWwsIGl0J3MgYWxyZWFkeSBhdmFp
bGFibGUgd2l0aCB0aGlzDQo+IHBhdGNoLg0KPiANCj4gU28gaXQncyBqdXN0IHRvIHBsYWNlIGEg
bW9ubyByZWZlcmVuY2UgaW4gZWl0aGVyIGxlZnQgb3IgcmlnaHQgY2hhbm5lbCBvZiB0aGUgSTJT
DQo+IGxpbms/IFdoeSBub3QgZHVhbC1tb25vIGFzIHdlbGwgdGhlbj8NCg0KVGhlIHBhdGNoIGlz
IGEgc3BlY2lmaWMgY29udHJvbCBmb3IgdHdvIGFtcHMgdG8gc2VuZCBBRUMgZGF0YSBvbiBzaW5n
bGUgSTJTIGRhdGEgaW5wdXQgcGluIGJ5IHN0YW5kYXJkIEkyUyBwcm90b2NvbC4gDQpJZiB0aGVy
ZSBhcmUgdHdvIEkyUyBpbnB1dCBmcm9tIFNvQywgd2UgY2FuIGFkZCBkdWFsLW1vbm8gbW9kZSBm
b3IgaXQsIGJ1dCBzbyBmYXIgdGhlcmUgaXMgbm8gcmVxdWlyZW1lbnQgcmVnYXJkaW5nIHRvIHRo
aXMgbW9kZS4NCg0KPiAtLS0tLS1QbGVhc2UgY29uc2lkZXIgdGhlIGVudmlyb25tZW50IGJlZm9y
ZSBwcmludGluZyB0aGlzIGUtbWFpbC4NCg==
