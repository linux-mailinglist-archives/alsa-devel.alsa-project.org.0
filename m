Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FBD44D48A
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Nov 2021 10:59:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78707165D;
	Thu, 11 Nov 2021 10:58:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78707165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636624772;
	bh=DYAIhb3AS5VZ0QPR5B5V3JgSttlAOpQDD9bg5Q98k8A=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HQQdFsj/JYEo/p+DmycDYdQxnUD468IwfTrLDjaVtmx0d7I9eyR0onowc9U66GpT3
	 EjBvdG3gZrEHcxSOMyqPT0qO+MDhGToXGUYQ6q+EA46pW9g7MJTY+Og/tAk/d7Dcqd
	 RYfLi2o4f8UaRKwUhpWryNIoC5S0xxmX8iopfwbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED7F4F802E3;
	Thu, 11 Nov 2021 10:58:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FD88F802D2; Thu, 11 Nov 2021 10:58:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DB68F80086
 for <alsa-devel@alsa-project.org>; Thu, 11 Nov 2021 10:58:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DB68F80086
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1AB9w2hwD024272,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36504.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1AB9w2hwD024272
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 11 Nov 2021 17:58:02 +0800
Received: from RTEXMBS04.realtek.com.tw (172.21.6.97) by
 RTEXH36504.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 11 Nov 2021 17:58:01 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 11 Nov 2021 17:58:00 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::301d:c3e3:433e:d34e]) by
 RTEXMBS01.realtek.com.tw ([fe80::301d:c3e3:433e:d34e%5]) with mapi id
 15.01.2308.015; Thu, 11 Nov 2021 04:58:00 -0500
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: Jaroslav Kysela <perex@perex.cz>, "broonie@kernel.org"
 <broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Subject: RE: [PATCH] ALSA: usb-audio: add the profile name of Dell desktop
Thread-Topic: [PATCH] ALSA: usb-audio: add the profile name of Dell desktop
Thread-Index: AQHX1t01ldBW7dWZzEeTxd7L+bgC+6v+ZNgAgAAFvwD//6xucA==
Date: Thu, 11 Nov 2021 09:58:00 +0000
Message-ID: <61aff7be800d4ffa93e740ca0b8c9d21@realtek.com>
References: <20211111091914.20917-1-shumingf@realtek.com>
 <7e82a4cd-ed51-e853-7338-eb570c88cb68@perex.cz>
 <3654e59d-52bd-5442-39d1-f017f5a14b2b@perex.cz>
In-Reply-To: <3654e59d-52bd-5442-39d1-f017f5a14b2b@perex.cz>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.209]
x-kse-serverinfo: RTEXMBS04.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzExLzExIOS4iuWNiCAwNzo0MzowMA==?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36504.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 11/11/2021 09:33:49
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 167198 [Nov 11 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: shumingf@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 465 465 eb31509370142567679dd183ac984a0cb2ee3296
X-KSE-AntiSpam-Info: {Tracking_arrow_text}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 127.0.0.199:7.1.2; realtek.com:7.1.1; github.com:7.1.1
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, from}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/11/2021 09:36:00
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Yijun.Shen@dell.com" <Yijun.Shen@dell.com>,
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

SGkgSmFyb3NsYXYsDQoNCj4gT24gMTEuIDExLiAyMSAxMDozNCwgSmFyb3NsYXYgS3lzZWxhIHdy
b3RlOg0KPiA+IE9uIDExLiAxMS4gMjEgMTA6MTksIHNodW1pbmdmQHJlYWx0ZWsuY29tIHdyb3Rl
Og0KPiA+PiBGcm9tOiBTaHVtaW5nIEZhbiA8c2h1bWluZ2ZAcmVhbHRlay5jb20+DQo+ID4+DQo+
ID4+IEFkZCB0aGUgcHJvZmlsZSBuYW1lIHRvIGxldCB1c2Vyc3BhY2UgcGljayBjb3JyZWN0IFVD
TSBwcm9maWxlDQo+ID4NCj4gPiBJdCdzIG5vIGxvbmdlciBuZWNlc3NhcnkgdG8gZm9yY2UgdGhl
IGNhcmQgbmFtZXMgaW4gdGhlIGRyaXZlcnMuIFVDTQ0KPiA+IGNhbiBtYXRjaCB0aGUgVVNCIHZl
bmRvciAvIGRldmljZSBJRHMgZnJvbSB0aGUgJ2NvbXBvbmVudHMnIHN0cmluZywgdG9vLg0KPiA+
DQo+ID4gSSB0aGluayB0aGF0IHdlIHNob3VsZCBhYmFuZG9uIHRoaXMgd2F5IG9mIHRoZSBVQ00g
Y29uZmlndXJhdGlvbg0KPiA+IHNlbGVjdGlvbiBmb3IgbmV3IGRldmljZXMgd2l0aCBkZXZpY2Ug
SURzLiBUaGUga2VybmVsIGFscmVhZHkgZXhwb3J0cw0KPiA+IG5lY2Vzc2FyeSBpbmZvcm1hdGlv
biB0byBzZWxlY3QgdGhlIHJpZ2h0IFVDTSBjb25maWd1cmF0aW9uIGluIHRoZSB1c2VyDQo+IHNw
YWNlLg0KPiANCj4gVW50ZXN0ZWQgZXhhbXBsZToNCj4gDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9w
ZXJleGcvYWxzYS11Y20tY29uZi9jb21taXQvNzRjZWQ2NTQ0MGI1MDExYmJlYzE2ODANCj4gYjI4
MDRjOGE5YzgyYjUxNTINCj4gDQo+IAkJCQkJSmFyb3NsYXYNCg0KVGhhbmtzIGEgbG90LiBJIHdp
bGwgdGFrZSB5b3VyIGV4YW1wbGUgdG8gdGVzdC4NCg0KPiAtLQ0KPiBKYXJvc2xhdiBLeXNlbGEg
PHBlcmV4QHBlcmV4LmN6Pg0KPiBMaW51eCBTb3VuZCBNYWludGFpbmVyOyBBTFNBIFByb2plY3Q7
IFJlZCBIYXQsIEluYy4NCj4gLS0tLS0tUGxlYXNlIGNvbnNpZGVyIHRoZSBlbnZpcm9ubWVudCBi
ZWZvcmUgcHJpbnRpbmcgdGhpcyBlLW1haWwuDQo=
