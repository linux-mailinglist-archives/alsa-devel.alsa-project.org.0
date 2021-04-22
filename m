Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BDD367E2D
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Apr 2021 11:55:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2854168A;
	Thu, 22 Apr 2021 11:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2854168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619085315;
	bh=mUnAXehkGOF6z3eZMg+l6Ce67tzg6ioe9jlCxZCPoRE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XtensfedQr3RpTp4uw/FPD7OecQX1fTeK5RjItJNJmYhCJcD8Fad6niYdqIeog357
	 mTIqOmD4R+2VGrX4nQwsd2ZP5DjihIBvW89kxSz4EVfqiWz8TzHif9mrrfth/Vt3zh
	 GXhTsOliwMwyCPc0Tr8iTR25II9shounCluCYox4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14610F80278;
	Thu, 22 Apr 2021 11:53:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C095F80134; Thu, 22 Apr 2021 11:53:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6AB1F80134
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 11:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6AB1F80134
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 13M9rMkU5003615,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36502.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 13M9rMkU5003615
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 22 Apr 2021 17:53:22 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 22 Apr 2021 17:53:22 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 22 Apr 2021 17:53:21 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::e1bc:d5c7:d79c:2ab7]) by
 RTEXMBS01.realtek.com.tw ([fe80::e1bc:d5c7:d79c:2ab7%13]) with mapi id
 15.01.2106.013; Thu, 22 Apr 2021 17:53:21 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: Jaroslav Kysela <perex@perex.cz>, "broonie@kernel.org"
 <broonie@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Subject: RE: [PATCH] ASoC: rt711-sdca: add the notification when volume changed
Thread-Topic: [PATCH] ASoC: rt711-sdca: add the notification when volume
 changed
Thread-Index: AQHXN1cgNbYV/2X2002yusd+mIEbSqq/w8mAgACHeTA=
Date: Thu, 22 Apr 2021 09:53:21 +0000
Message-ID: <9c3c2f3c981649e99e305e024206c7e2@realtek.com>
References: <20210422090855.2971-1-shumingf@realtek.com>
 <fd140a1d-d1cf-1894-5925-ff63da347d09@perex.cz>
In-Reply-To: <fd140a1d-d1cf-1894-5925-ff63da347d09@perex.cz>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.209]
x-kse-serverinfo: RTEXMBS06.realtek.com.tw, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?utf-8?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzQvMjIg5LiK5Y2IIDA3OjA1OjAw?=
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 04/22/2021 09:38:29
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 163279 [Apr 22 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: shumingf@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 442 442 b985cb57763b61d2a20abb585d5d4cc10c315b09
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; realtek.com:7.1.1
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, from}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/22/2021 09:40:00
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 04/22/2021 09:38:29
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 163279 [Apr 22 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: shumingf@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 442 442 b985cb57763b61d2a20abb585d5d4cc10c315b09
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; realtek.com:7.1.1
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, from}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 04/22/2021 09:40:00
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "libin.yang@intel.com" <libin.yang@intel.com>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
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

SGkgSmFyb3NsYXYsDQoNCj4gPiBAQCAtNTA5LDEyICs1MDksMTYgQEAgc3RhdGljIGludCBydDcx
MV9zZGNhX3NldF9nYWluX3B1dChzdHJ1Y3QNCj4gc25kX2tjb250cm9sICprY29udHJvbCwNCj4g
PiAgCQkoc3RydWN0IHNvY19taXhlcl9jb250cm9sICopa2NvbnRyb2wtPnByaXZhdGVfdmFsdWU7
DQo+ID4gIAlzdHJ1Y3QgcnQ3MTFfc2RjYV9wcml2ICpydDcxMSA9DQo+IHNuZF9zb2NfY29tcG9u
ZW50X2dldF9kcnZkYXRhKGNvbXBvbmVudCk7DQo+ID4gIAl1bnNpZ25lZCBpbnQgcmVhZF9sLCBy
ZWFkX3IsIGdhaW5fbF92YWwsIGdhaW5fcl92YWw7DQo+ID4gLQl1bnNpZ25lZCBpbnQgaSwgYWRj
X3ZvbF9mbGFnID0gMDsNCj4gPiArCXVuc2lnbmVkIGludCBpLCBhZGNfdm9sX2ZsYWcgPSAwLCBj
aGFuZ2VkID0gMDsNCj4gPiArCXVuc2lnbmVkIGludCBsdmFsdWUsIHJ2YWx1ZTsNCj4gPg0KPiA+
ICAJaWYgKHN0cnN0cih1Y29udHJvbC0+aWQubmFtZSwgIkZVMUUgQ2FwdHVyZSBWb2x1bWUiKSB8
fA0KPiA+ICAJCXN0cnN0cih1Y29udHJvbC0+aWQubmFtZSwgIkZVMEYgQ2FwdHVyZSBWb2x1bWUi
KSkNCj4gPiAgCQlhZGNfdm9sX2ZsYWcgPSAxOw0KPiA+DQo+ID4gKwlyZWdtYXBfcmVhZChydDcx
MS0+bWJxX3JlZ21hcCwgbWMtPnJlZywgJmx2YWx1ZSk7DQo+ID4gKwlyZWdtYXBfcmVhZChydDcx
MS0+bWJxX3JlZ21hcCwgbWMtPnJyZWcsICZydmFsdWUpOw0KPiA+ICsNCj4gPiAgCS8qIGNvbnRy
b2wgdmFsdWUgdG8gMidzIGNvbXBsZW1lbnQgdmFsdWUgKi8NCj4gPiAgCS8qIEwgQ2hhbm5lbCAq
Lw0KPiA+ICAJZ2Fpbl9sX3ZhbCA9IHVjb250cm9sLT52YWx1ZS5pbnRlZ2VyLnZhbHVlWzBdOyBA
QCAtNTYwLDYgKzU2NCw5IEBADQo+ID4gc3RhdGljIGludCBydDcxMV9zZGNhX3NldF9nYWluX3B1
dChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwNCj4gPiAgCQlnYWluX3JfdmFsICY9IDB4
ZmZmZjsNCj4gPiAgCX0NCj4gPg0KPiA+ICsJaWYgKGx2YWx1ZSAhPSBnYWluX2xfdmFsIHx8IHJ2
YWx1ZSAhPSBnYWluX3JfdmFsKQ0KPiA+ICsJCWNoYW5nZWQgPSAxOw0KPiANCj4gSSB0aGluayB0
aGF0IGl0J3Mgc2FmZSB0byByZXR1cm4gZWFybHkgd2l0aCB0aGUgemVybyByZXR1cm4gdmFsdWUg
aGVyZT8gV2h5IHRvDQo+IHJld3JpdGUgdGhlIGlkZW50aWNhbCB2YWx1ZSBpbiB0aGUgaHcgcmVn
aXN0ZXJzPw0KDQpPSywgd2lsbCBmaXguIFRoYW5rcy4NCg0KPiANCj4gCQkJCQlKYXJvc2xhdg0K
PiANCj4gLS0NCj4gSmFyb3NsYXYgS3lzZWxhIDxwZXJleEBwZXJleC5jej4NCj4gTGludXggU291
bmQgTWFpbnRhaW5lcjsgQUxTQSBQcm9qZWN0OyBSZWQgSGF0LCBJbmMuDQo+IC0tLS0tLVBsZWFz
ZSBjb25zaWRlciB0aGUgZW52aXJvbm1lbnQgYmVmb3JlIHByaW50aW5nIHRoaXMgZS1tYWlsLg0K
