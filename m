Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 661EB2AEEA2
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 11:17:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9137174B;
	Wed, 11 Nov 2020 11:16:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9137174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605089839;
	bh=yWY4ZteANWKckyyyPOo8iftaYXzxnHVgMEKkncS81gY=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HxiN9TsCoLBF1YRKw9ufZ7v8Z0BQMuvBUPZuL1q5D6PXCMzPxMBGyctQ0uLGY6Zyx
	 LZ3PHMnqbk2kWv41KMKFpLm2lG/mURi08jDc6Ax5Y81l0EWAdKP1DgVJMYDx4SrwAp
	 NXo6AbsxlMDlG9n6DHnyvqpJwIo0da+bAtDf7egg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0803EF8007E;
	Wed, 11 Nov 2020 11:15:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95318F8020C; Wed, 11 Nov 2020 11:15:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE150F800AE
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 11:15:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE150F800AE
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4CWLFx05Rbz52yW;
 Wed, 11 Nov 2020 18:15:17 +0800 (CST)
Received: from dggema706-chm.china.huawei.com (10.3.20.70) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Wed, 11 Nov 2020 18:15:28 +0800
Received: from dggema755-chm.china.huawei.com (10.1.198.197) by
 dggema706-chm.china.huawei.com (10.3.20.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Wed, 11 Nov 2020 18:15:28 +0800
Received: from dggema755-chm.china.huawei.com ([10.1.198.197]) by
 dggema755-chm.china.huawei.com ([10.1.198.197]) with mapi id 15.01.1913.007;
 Wed, 11 Nov 2020 18:15:28 +0800
From: zhangqilong <zhangqilong3@huawei.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggMi8zXSBBU29DOiB3bTg5OTc6IEZpeCBQTSBkaXNh?=
 =?utf-8?Q?ble_depth_imbalance_on_error?=
Thread-Topic: [PATCH 2/3] ASoC: wm8997: Fix PM disable depth imbalance on error
Thread-Index: AQHWuBDoDLy/mtHbuUGyeA2OaWJy6KnCtZ5w
Date: Wed, 11 Nov 2020 10:15:28 +0000
Message-ID: <e4ff6c04c34e4c49b1e3dfd71395fc85@huawei.com>
References: <20201111041326.1257558-1-zhangqilong3@huawei.com>
 <20201111041326.1257558-3-zhangqilong3@huawei.com>
 <5f0e1888-417b-88fc-aaba-8eb40a73d85b@opensource.cirrus.com>
In-Reply-To: <5f0e1888-417b-88fc-aaba-8eb40a73d85b@opensource.cirrus.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.179.28]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

PiANCj4gT24gMTEvMTEvMjAyMCAwNDoxMywgWmhhbmcgUWlsb25nIHdyb3RlOg0KPiA+IFRoZSBw
bV9ydW50aW1lX2VuYWJsZSB3aWxsIGluY3JlYXNlIHBvd2VyIGRpc2FibGUgZGVwdGguIFRodXMg
YQ0KPiA+IHBhaXJpbmcgZGVjcmVtZW50IGlzIG5lZWRlZCBvbiB0aGUgZXJyb3IgaGFuZGxpbmcg
cGF0aCB0byBrZWVwIGl0DQo+ID4gYmFsYW5jZWQgYWNjb3JkaW5nIHRvIGNvbnRleHQuDQo+ID4N
Cj4gPiBGaXhlczogMzE4MzNlYWQ5NWMyYyAoIkFTb0M6IGFyaXpvbmE6IE1vdmUgcmVxdWVzdCBv
ZiBzcGVha2VyIElSUXMNCj4gPiBpbnRvIGJ1cyBwcm9iZSIpDQo+ID4gU2lnbmVkLW9mZi1ieTog
WmhhbmcgUWlsb25nIDx6aGFuZ3FpbG9uZzNAaHVhd2VpLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHNv
dW5kL3NvYy9jb2RlY3Mvd204OTk3LmMgfCA5ICsrKysrKystLQ0KPiA+ICAgMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9zb3VuZC9zb2MvY29kZWNzL3dtODk5Ny5jIGIvc291bmQvc29jL2NvZGVjcy93bTg5OTcuYw0K
PiA+IGluZGV4IDM3ZTRiYjNkYmQ4YS4uNzQ0MTA0ZWRiMmViIDEwMDY0NA0KPiA+IC0tLSBhL3Nv
dW5kL3NvYy9jb2RlY3Mvd204OTk3LmMNCj4gPiArKysgYi9zb3VuZC9zb2MvY29kZWNzL3dtODk5
Ny5jDQo+ID4gQEAgLTExNjMsMTAgKzExNjMsMTAgQEAgc3RhdGljIGludCB3bTg5OTdfcHJvYmUo
c3RydWN0DQo+IHBsYXRmb3JtX2RldmljZQ0KPiA+ICpwZGV2KQ0KPiA+DQo+ID4gICAJcmV0ID0g
YXJpem9uYV9pbml0X3ZvbF9saW1pdChhcml6b25hKTsNCj4gPiAgIAlpZiAocmV0IDwgMCkNCj4g
PiAtCQlyZXR1cm4gcmV0Ow0KPiA+ICsJCWdvdG8gZXJyX3BtX2Rpc2FibGU7DQo+ID4gICAJcmV0
ID0gYXJpem9uYV9pbml0X3Nwa19pcnFzKGFyaXpvbmEpOw0KPiA+ICAgCWlmIChyZXQgPCAwKQ0K
PiA+IC0JCXJldHVybiByZXQ7DQo+ID4gKwkJZ290byBlcnJfcG1fZGlzYWJsZTsNCj4gPg0KPiA+
ICAgCXJldCA9IGRldm1fc25kX3NvY19yZWdpc3Rlcl9jb21wb25lbnQoJnBkZXYtPmRldiwNCj4g
PiAgIAkJCQkJICAgICAgJnNvY19jb21wb25lbnRfZGV2X3dtODk5NywgQEANCj4gLTExNzYsOSAr
MTE3NiwxNCBAQCBzdGF0aWMNCj4gPiBpbnQgd204OTk3X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+ID4gICAJCWRldl9lcnIoJnBkZXYtPmRldiwgIkZhaWxlZCB0byByZWdp
c3RlciBjb21wb25lbnQ6ICVkXG4iLCByZXQpOw0KPiA+ICAgCQlnb3RvIGVycl9zcGtfaXJxczsN
Cj4gPiAgIAl9DQo+ID4gKwlhcml6b25hX2ZyZWVfc3BrX2lycXMoYXJpem9uYSk7DQo+IA0KPiBT
aG91bGQgbm90IGJlIGZyZWVpbmcgc3BlYWtlciBpcnFzIG9uIHN1Y2Nlc3NmdWwgcHJvYmUuDQo+
IFRoaXMgbG9va3MgbGlrZSBhbiBleGlzdGluZyBidWcgaW4gdGhlIGRyaXZlciB3aGVyZSB0aGUg
cmV0dXJuIDAgd2FzIG1pc3Npbmcgc28gaXQNCj4gd291bGQgYWx3YXlzIGV4aXQgdGhyb3VnaCB0
aGUgZXJyb3IgcGF0aC4NCg0KWWVzLCBZb3UgYXJlIHJpZ2h0LCBJIGhhZCBhIGxpdHRsZSBkb3Vi
dHMgaGVyZSBiZWZvcmUsIGl0IHNob3VsZCBiZSBmcmVlZCB3aGVuIGl0IGlzIGJlIHJlbW92ZWQu
IEkgd2lsbCBmaXggaXQgbmV4dCB2ZXJzaW9uLg0KDQpUaGFucywNClpoYW5nDQoNCg0KPiANCj4g
PiArDQo+ID4gKwlyZXR1cm4gcmV0Ow0KPiA+DQo+ID4gICBlcnJfc3BrX2lycXM6DQo+ID4gICAJ
YXJpem9uYV9mcmVlX3Nwa19pcnFzKGFyaXpvbmEpOw0KPiA+ICtlcnJfcG1fZGlzYWJsZToNCj4g
PiArCXBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsNCj4gPg0KPiA+ICAgCXJldHVybiBy
ZXQ7DQo+ID4gICB9DQo+ID4NCg==
