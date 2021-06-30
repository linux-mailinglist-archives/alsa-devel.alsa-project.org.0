Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DF93B7D25
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Jun 2021 08:03:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B97F1167C;
	Wed, 30 Jun 2021 08:02:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B97F1167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625033022;
	bh=rDJ1KJQ2NQa6urro9bkOyAYXJ/NtsMwlpd4YoJ657Rc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FZLH6scDlwmtuiBTizmX7NPBydrsvS3/kKBITJCVkjVBPGdXg3PrKgsZ6PrCDf24V
	 QSafJBwPhQlrwBb9ZkLbJwcsL0Kj9m5mricjBPw7m5CsZH8NG84E3ZHFBfbp/+AuxG
	 d2zWQbX7bKxFph1P59cxuYZbxJpt2VbB5TvNo2qQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CAC7F800BA;
	Wed, 30 Jun 2021 08:02:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A818F80229; Wed, 30 Jun 2021 08:02:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9D39F800BA
 for <alsa-devel@alsa-project.org>; Wed, 30 Jun 2021 08:02:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9D39F800BA
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 15U61rPaA028040,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36502.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 15U61rPaA028040
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 30 Jun 2021 14:01:53 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 30 Jun 2021 14:01:52 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 30 Jun 2021 14:01:52 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::3132:fefa:293c:f022]) by
 RTEXMBS01.realtek.com.tw ([fe80::3132:fefa:293c:f022%13]) with mapi id
 15.01.2106.013; Wed, 30 Jun 2021 14:01:52 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: Mark Brown <broonie@kernel.org>, Curtis Malainey <cujomalainey@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH 1/2] ASoC: rt711: remap buttons
Thread-Topic: [PATCH 1/2] ASoC: rt711: remap buttons
Thread-Index: AQHXY1hOYyHPL0wsE0GD/Wmj2CWCOasXnsIAgACJC2D//4RgAIAAD7+AgAs+jgCAAZlNgIAHi+/g
Date: Wed, 30 Jun 2021 06:01:52 +0000
Message-ID: <5c038789fe1f4903af3283bf47cfc9b5@realtek.com>
References: <20210617090809.16901-1-shumingf@realtek.com>
 <20210617123914.GD5067@sirena.org.uk>
 <d6374c5158c844d69b4f546fd741f07f@realtek.com>
 <20210617132716.GE5067@sirena.org.uk>
 <638be5ea-a310-3711-df08-798f7bee5804@linux.intel.com>
 <CAOReqxhDT8Z6jC89=m_Hka4diaxJqwhyKZmrVAw626wAAL72Fw@mail.gmail.com>
 <CAOReqxhY2zZJ4zsHvhHhDFuFawUnVtrcuuHiJ1g_n_0+7cMPcw@mail.gmail.com>
In-Reply-To: <CAOReqxhY2zZJ4zsHvhHhDFuFawUnVtrcuuHiJ1g_n_0+7cMPcw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.209]
x-kse-serverinfo: RTEXDAG01.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzYvMjkg5LiL5Y2IIDEwOjI0OjAw?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzYvMzAg5LiK5Y2IIDAyOjQzOjAw?=
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 06/30/2021 05:47:57
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 164730 [Jun 30 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: shumingf@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 448 448 71fb1b37213ce9a885768d4012c46ac449c77b17
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: realtek.com:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, from}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/30/2021 05:50:00
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "jairaj.arava@intel.com" <jairaj.arava@intel.com>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 Curtis Malainey <cujomalainey@chromium.org>, "Lu, 
 Brent" <brent.lu@intel.com>, "bard.liao@intel.com" <bard.liao@intel.com>
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

PiA+ID4NCj4gPiA+IHN3YXAgd3J0LiBzcGVjOg0KPiA+ID4gc29mX3Nkd19ydDcxMS5jOiAgICAg
ICAgc25kX2phY2tfc2V0X2tleShqYWNrLT5qYWNrLCBTTkRfSkFDS19CVE5fMCwNCj4gS0VZX1BM
QVlQQVVTRSk7DQo+ID4gPiBzb2Zfc2R3X3J0NzExLmMtICAgICAgICBzbmRfamFja19zZXRfa2V5
KGphY2stPmphY2ssIFNORF9KQUNLX0JUTl8xLA0KPiBLRVlfVk9JQ0VDT01NQU5EKTsNCj4gPiA+
IHNvZl9zZHdfcnQ3MTEuYy0gICAgICAgIHNuZF9qYWNrX3NldF9rZXkoamFjay0+amFjaywgU05E
X0pBQ0tfQlROXzIsDQo+IEtFWV9WT0xVTUVVUCk7DQo+ID4gPiBzb2Zfc2R3X3J0NzExLmMtICAg
ICAgICBzbmRfamFja19zZXRfa2V5KGphY2stPmphY2ssIFNORF9KQUNLX0JUTl8zLA0KPiBLRVlf
Vk9MVU1FRE9XTik7DQo+ID4gPg0KPiA+ID4ga2JsX3J0NTY2M19tYXg5ODkyNy5jOiAgc25kX2ph
Y2tfc2V0X2tleShqYWNrLT5qYWNrLCBTTkRfSkFDS19CVE5fMCwNCj4gPiA+IEtFWV9QTEFZUEFV
U0UpOw0KPiA+ID4ga2JsX3J0NTY2M19tYXg5ODkyNy5jLSAgc25kX2phY2tfc2V0X2tleShqYWNr
LT5qYWNrLCBTTkRfSkFDS19CVE5fMSwNCj4gPiA+IEtFWV9WT0lDRUNPTU1BTkQpOw0KPiA+ID4g
a2JsX3J0NTY2M19tYXg5ODkyNy5jLSAgc25kX2phY2tfc2V0X2tleShqYWNrLT5qYWNrLCBTTkRf
SkFDS19CVE5fMiwNCj4gPiA+IEtFWV9WT0xVTUVVUCk7DQo+ID4gPiBrYmxfcnQ1NjYzX21heDk4
OTI3LmMtICBzbmRfamFja19zZXRfa2V5KGphY2stPmphY2ssIFNORF9KQUNLX0JUTl8zLA0KPiA+
ID4gS0VZX1ZPTFVNRURPV04pOw0KPiA+ID4NCj4gPiA+IEJyZW50LCBDdXJ0aXMsIEppbW15LCBj
YW4geW91IGNvbW1lbnQgb24gdGhlIG9yZGVyPw0KPiA+DQo+ID4gU29ycnkgZm9yIHRoZSBsYXRl
IHJlcGx5LCBJIGNvdWxkbid0IGZpZ3VyZSBvdXQgd2h5IHRoaXMgc2xpcHBlZCBieSBteQ0KPiA+
IGVtYWlsIGZpbHRlciwgSSBndWVzcyBJIHNob3VsZCBsb29rIGNsb3NlciBuZXh0IHRpbWUuIFNv
cmFrYSBoYXMgYmVlbg0KPiA+IGNoZWNrZWQgKGtibF9ydDU2NjNfbWF4OTg5MjcpIGFuZCB5ZXMg
dGhlIG1hcHBpbmcgZG9lcyBhcHBlYXIgdG8gYmUNCj4gPiBpbmNvcnJlY3QsIHZvbHVtZSB1cCBr
ZXkgcmV0dXJucyB2b2ljZSBjb21tYW5kIGluIGV2dGVzdC4gU2F0aHlhIHdpbGwNCj4gPiBoYXZl
IHRvIGNoZWNrIHRoZSBoZWFkc2V0IGJ1dHRvbiBtYXBwaW5nLCBvbiBydDcxMSBidXQgbXkgZ3Vl
c3MgaXMgaXQNCj4gPiBpcyBhbHNvIGluY29ycmVjdC4NCj4gDQo+IEkgc3RhbmQgY29ycmVjdGVk
LCBtaXNyZWFkIHRoZSBkYXRhc2hlZXQuIFNvIHJ0NzExIGFuZCBydDU2NjMgYXJlIGNvcnJlY3QN
Cj4gYmFzZWQgb24gZGF0YXNoZWV0IHNwZWNzIGJ1dCB3aGVuIGdyYWJiaW5nIGFuIG9mZiB0aGUg
c2hlbGYgaGVhZHBob25lIHRoZXkNCj4gZGlkIG5vdCB3b3JrIHdpdGggdGhlIHZvbHVtZSB1cC4g
SG1tLCBJIHdvbmRlciBpZiB0aGlzIHNwbGl0IGlzICJ3aGF0IHVzdWFsbHkNCj4gd29ya3MiIGFu
ZCAid2hhdCBpcyBjb3JyZWN0LiINCg0KVGhhbmtzIGZvciB5b3VyIHJlcGx5LCBDdXJ0aXMuDQpU
aGlzIHBhdGNoIGp1c3QgY2hhbmdlcyB0aGUgbWFwcGluZyB0byBsZXQgdGhlIGJ1dHRvbiBmdW5j
dGlvbiB3b3JrIHByb3Blcmx5Lg0KDQpIaSBNYXJrLA0KRG8gSSBuZWVkIHRvIHJlc2VuZCB0aGUg
cGF0Y2g/IE9yIGFueSBjb21tZW50cz8NCg0KPiAtLS0tLS1QbGVhc2UgY29uc2lkZXIgdGhlIGVu
dmlyb25tZW50IGJlZm9yZSBwcmludGluZyB0aGlzIGUtbWFpbC4NCg==
