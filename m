Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6E12A3DFC
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:48:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9393177C;
	Tue,  3 Nov 2020 08:48:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9393177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604389733;
	bh=d7paEbKWqcBcrGGoA34oLQZcgfcceTlJkK2Jgo6CHeQ=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gHP+LXohFgFkdAwvZ75v1RYYVkWKHkMjhCiL5IZl90AiPBGH6VxUyKZI1h78mnjz5
	 B0HazHBTSrxYdN7SwhLsVStorJXWLZtqycfYgGrtfO4JrdkcFnKUFOF0KHUkqkY3JU
	 /fq+rrZ4/Iz4zhfcqv1BMHNsiyx+QuwNMYAPGS8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5558F804E0;
	Tue,  3 Nov 2020 08:45:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEA64F80232; Mon,  2 Nov 2020 10:25:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_78, RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93FE2F8015A
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 10:25:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93FE2F8015A
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4CPnZN00Frz51Hk;
 Mon,  2 Nov 2020 17:25:15 +0800 (CST)
Received: from dggema708-chm.china.huawei.com (10.3.20.72) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Mon, 2 Nov 2020 17:25:16 +0800
Received: from dggema755-chm.china.huawei.com (10.1.198.197) by
 dggema708-chm.china.huawei.com (10.3.20.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Mon, 2 Nov 2020 17:25:16 +0800
Received: from dggema755-chm.china.huawei.com ([10.1.198.197]) by
 dggema755-chm.china.huawei.com ([10.1.198.197]) with mapi id 15.01.1913.007;
 Mon, 2 Nov 2020 17:25:16 +0800
From: zhangqilong <zhangqilong3@huawei.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, "perex@perex.cz" <perex@perex.cz>, 
 "tiwai@suse.com" <tiwai@suse.com>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggdjJdIEFTb0M6IHRpOiBkYXZpbmNpLW1jYXNwOiBm?=
 =?utf-8?B?aXggZXJyb3IgaGFuZGxpbmcgaW4gZGF2aW5jaV9tY2FzcF9wcm9iZQ==?=
Thread-Topic: [PATCH v2] ASoC: ti: davinci-mcasp: fix error handling in
 davinci_mcasp_probe
Thread-Index: AQHWsPecsuyWeHJMwkGemEswgt2xLam0B/GAgACH64A=
Date: Mon, 2 Nov 2020 09:25:16 +0000
Message-ID: <7c5bced4ad3f4e348241fbbe28cf7ef5@huawei.com>
References: <20201102085436.14450-1-zhangqilong3@huawei.com>
 <182d48d4-2866-8e7c-dc28-7f84967260e2@ti.com>
 <e8e537db-cda7-fe9e-5d34-77da8d992a6c@ti.com>
In-Reply-To: <e8e537db-cda7-fe9e-5d34-77da8d992a6c@ti.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.179.28]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:45:21 +0100
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
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

SGkNCg0KPiANCj4gSGksDQo+IA0KPiBPbiAwMi8xMS8yMDIwIDExLjA3LCBQZXRlciBVamZhbHVz
aSB3cm90ZToNCj4gPg0KPiA+DQo+ID4gT24gMDIvMTEvMjAyMCAxMC41NCwgWmhhbmcgUWlsb25n
IHdyb3RlOg0KPiA+PiBGb3JnZXR0aW5nIHRvIGNhbGwgcG1fcnVudGltZV9kaXNhYmxlIGlmIGRh
dmluY2lfbWNhc3BfZ2V0X2R0X3BhcmFtcw0KPiA+PiBmYWlsZWQgaW4gZnVuY3Rpb24gZGF2aW5j
aV9tY2FzcF9wcm9iZSwgYW5kIHdlIHNob3VsZCBnbyB0byBlcnJvcg0KPiA+PiBoYW5kbGluZyBi
cmFuY2guDQo+ID4NCj4gPiBBY2tlZC1ieTogUGV0ZXIgVWpmYWx1c2kgPHBldGVyLnVqZmFsdXNp
QHRpLmNvbT4NCj4gDQo+IEFjdHVhbGx5Li4uDQo+IA0KPiA+DQo+ID4+IFNpZ25lZC1vZmYtYnk6
IFpoYW5nIFFpbG9uZyA8emhhbmdxaWxvbmczQGh1YXdlaS5jb20+DQo+ID4+IC0tLQ0KPiA+PiBD
aGFuZ2Vsb2c6DQo+ID4+IFYyDQo+ID4+IC0gY2hhbmdlZCB0aGUgc3ViamVjdCBhbmQgZml4ZWQg
dGhlIGRlc2NyaXB0aW9uLg0KPiA+PiAtLS0NCj4gPj4gIHNvdW5kL3NvYy90aS9kYXZpbmNpLW1j
YXNwLmMgfCA2ICsrKystLQ0KPiA+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy90aS9kYXZp
bmNpLW1jYXNwLmMNCj4gPj4gYi9zb3VuZC9zb2MvdGkvZGF2aW5jaS1tY2FzcC5jIGluZGV4IDRi
NDZkZDgyN2YzZi4uZWM5MGMyM2M5ZTIwDQo+ID4+IDEwMDY0NA0KPiA+PiAtLS0gYS9zb3VuZC9z
b2MvdGkvZGF2aW5jaS1tY2FzcC5jDQo+ID4+ICsrKyBiL3NvdW5kL3NvYy90aS9kYXZpbmNpLW1j
YXNwLmMNCj4gPj4gQEAgLTIzNjIsOCArMjM2MiwxMCBAQCBzdGF0aWMgaW50IGRhdmluY2lfbWNh
c3BfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPj4gIAkJZ290byBl
cnI7DQo+ID4+DQo+ID4+ICAJcmV0ID0gZGF2aW5jaV9tY2FzcF9nZXRfZHRfcGFyYW1zKG1jYXNw
KTsNCj4gPj4gLQlpZiAocmV0KQ0KPiA+PiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4gPj4gKwlpZiAo
cmV0KSB7DQo+ID4+ICsJCXJldCA9IC1FSU5WQUw7DQo+ID4+ICsJCWdvdG8gZXJyOw0KPiANCj4g
ZG8gbm90IG92ZXJyaWRlIHRoZSBlcnJvciBjb2RlIGZyb20gZGF2aW5jaV9tY2FzcF9nZXRfZHRf
cGFyYW1zKCksIGp1dCBqdW1wDQo+IHRvIGVyci4NCj4NCg0KSSBoYXZlIGV2ZXIgdGhvdWdodCB0
aGlzIHBvaW50LiBJIGNhbid0IG1ha2Ugc3VyZSBpdCdzIG5lY2Vzc2FyeSwgZGF2aW5jaV9tY2Fz
cF9nZXRfZHRfcGFyYW1zIGFsd2F5cyByZXR1cm4gMCBub3cuDQpJZiBpdCdzIG5lY2Vzc2FyeSwg
SSBjYW4gc3VibWl0IGEgbmV3IHBhdGNoIHRvIGZpeCBpdC4gTG9vayBmb3J3YXJkIHRvIHlvdXIg
cmVwbHkgc2luY2VyZWx5Lg0KDQpUaGFua3MsIGJlc3Qgd2lzaCENClpoYW5nIFFpbG9uZw0KDQo+
ID4+ICsJfQ0KPiA+Pg0KPiA+PiAgCXJldCA9IGRldm1fc25kX3NvY19yZWdpc3Rlcl9jb21wb25l
bnQoJnBkZXYtPmRldiwNCj4gPj4gIAkJCQkJJmRhdmluY2lfbWNhc3BfY29tcG9uZW50LA0KPiA+
Pg0KPiA+DQo+ID4gLSBQw6l0ZXINCj4gPg0KPiA+IFRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQg
T3ksIFBvcmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLg0KPiA+IFktdHVubnVzL0J1c2lu
ZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpDQo+ID4NCj4g
DQo+IC0gUMOpdGVyDQo+IA0KPiBUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2Fs
YW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4NCj4gWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1
MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kNCg==
