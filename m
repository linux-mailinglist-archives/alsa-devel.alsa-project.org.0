Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4DD5EA858
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 16:25:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDBA9820;
	Mon, 26 Sep 2022 16:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDBA9820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664202322;
	bh=0oBeWnxXgAQPb1V6hbQPoL5Y1Er9p4f/gMtQYmTFh58=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G4zd3aj91LGtEV1OrivVonCdKJY7/xb1z2lnJFZW4+tQAhCYpA3WC9X5n3CIlSl7K
	 5UmocbvR+Jp4BBgY6mLJIUX0hAaP18iHsMU3Z0ipyY/YSmWFy+F9jZLJCYYP9hGJo7
	 NC+y/1/joX/f867ZzUlAzRtDz0uT0C8tbIaCkktA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 493A1F80134;
	Mon, 26 Sep 2022 16:24:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 042D3F8027D; Mon, 26 Sep 2022 16:24:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD0D8F80134
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 16:24:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD0D8F80134
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MblJc6yfrz1P74b;
 Mon, 26 Sep 2022 22:20:00 +0800 (CST)
Received: from kwepemm000015.china.huawei.com (7.193.23.180) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 22:24:14 +0800
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemm000015.china.huawei.com (7.193.23.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 22:24:14 +0800
Received: from kwepemm600014.china.huawei.com ([7.193.23.54]) by
 kwepemm600014.china.huawei.com ([7.193.23.54]) with mapi id 15.01.2375.031;
 Mon, 26 Sep 2022 22:24:14 +0800
From: zhangqilong <zhangqilong3@huawei.com>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
 "olivier.moysan@foss.st.com" <olivier.moysan@foss.st.com>, "perex@perex.cz"
 <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0ggLW5leHRdIEFTb0M6IHN0bTogRml4IFBNIGRpc2Fi?=
 =?utf-8?B?bGUgZGVwdGggaW1iYWxhbmNlIGluIHN0bTMyX2kyc19wcm9iZQ==?=
Thread-Topic: [PATCH -next] ASoC: stm: Fix PM disable depth imbalance in
 stm32_i2s_probe
Thread-Index: AQHY0abuFjw3CB3nU0SvLlv0/xwKZa3xwfcg
Date: Mon, 26 Sep 2022 14:24:14 +0000
Message-ID: <baa8d7791be0479d9bfd9e2f0df779d2@huawei.com>
References: <20220926091439.103839-1-zhangqilong3@huawei.com>
 <b1cd2763-8914-7bce-8f91-666bae219bf4@foss.st.com>
In-Reply-To: <b1cd2763-8914-7bce-8f91-666bae219bf4@foss.st.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.177.246]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
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

PiBIZWxsbyBaaGFuZywNCj4gDQo+IE9uIDkvMjYvMjIgMTE6MTQsIFpoYW5nIFFpbG9uZyB3cm90
ZToNCj4gPiBUaGUgcG1fcnVudGltZV9lbmFibGUgd2lsbCBpbmNyZWFzZSBwb3dlciBkaXNhYmxl
IGRlcHRoLiBUaHVzIGENCj4gPiBwYWlyaW5nIGRlY3JlbWVudCBpcyBuZWVkZWQgb24gdGhlIGVy
cm9yIGhhbmRsaW5nIHBhdGggdG8ga2VlcCBpdA0KPiA+IGJhbGFuY2VkIGFjY29yZGluZyB0byBj
b250ZXh0Lg0KPiA+DQo+ID4gRml4ZXM6ZWZjMTYyY2JkNDgwZiAoIkFTb0M6IHN0bTogVXNlIGRl
dl9lcnJfcHJvYmUoKSBoZWxwZXIiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFpoYW5nIFFpbG9uZyA8
emhhbmdxaWxvbmczQGh1YXdlaS5jb20+DQo+ID4gLS0tDQo+ID4gIHNvdW5kL3NvYy9zdG0vc3Rt
MzJfaTJzLmMgfCA1ICsrKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2Mvc3RtL3N0bTMy
X2kycy5jIGIvc291bmQvc29jL3N0bS9zdG0zMl9pMnMuYw0KPiA+IGluZGV4IDZhYWZlNzkzZWVj
NC4uNWE3MTc0NDNiMTA1IDEwMDY0NA0KPiA+IC0tLSBhL3NvdW5kL3NvYy9zdG0vc3RtMzJfaTJz
LmMNCj4gPiArKysgYi9zb3VuZC9zb2Mvc3RtL3N0bTMyX2kycy5jDQo+ID4gQEAgLTExMzksMTIg
KzExMzksMTUgQEAgc3RhdGljIGludCBzdG0zMl9pMnNfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCj4gPiAgCXBtX3J1bnRpbWVfZW5hYmxlKCZwZGV2LT5kZXYpOw0KPiA+
DQo+ID4gIAlyZXQgPSBzbmRfZG1hZW5naW5lX3BjbV9yZWdpc3RlcigmcGRldi0+ZGV2LA0KPiAm
c3RtMzJfaTJzX3BjbV9jb25maWcsIDApOw0KPiA+IC0JaWYgKHJldCkNCj4gPiArCWlmIChyZXQp
IHsNCj4gPiArCQlwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7DQo+ID4gIAkJcmV0dXJu
IGRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwgcmV0LCAiUENNIERNQSByZWdpc3Rlcg0KPiBlcnJv
clxuIik7DQo+ID4gKwl9DQo+ID4NCj4gPiAgCXJldCA9IHNuZF9zb2NfcmVnaXN0ZXJfY29tcG9u
ZW50KCZwZGV2LT5kZXYsDQo+ICZzdG0zMl9pMnNfY29tcG9uZW50LA0KPiA+ICAJCQkJCSBpMnMt
PmRhaV9kcnYsIDEpOw0KPiA+ICAJaWYgKHJldCkgew0KPiA+ICsJCXBtX3J1bnRpbWVfZGlzYWJs
ZSgmcGRldi0+ZGV2KTsNCj4gPiAgCQlzbmRfZG1hZW5naW5lX3BjbV91bnJlZ2lzdGVyKCZwZGV2
LT5kZXYpOw0KPiA+ICAJCXJldHVybiByZXQ7DQo+ID4gIAl9DQo+IA0KPiBTZWVtcyB0aGF0IHRo
ZXJlIHRoZSBlcnJvciBoYXMgYmVlbiBpbnRyb2R1Y2VkIGluIHRoaXMgY29tbWl0Og0KPiAzMmE5
NTZhMWZhZGYgKCJBU29DOiBzdG0zMjogaTJzOiBhZGQgcG1fcnVudGltZSBzdXBwb3J0IikgVGhl
DQo+IHBtX3J1bnRpbWVfZW5hYmxlIHNob3VsZCBiZSBhdCB0aGUgZW5kIG9mIHRoZSBzdG0zMl9p
MnNfcHJvYmUgYXMNCj4gZG9uZSBoZXJlOg0KPiBodHRwczovL2dpdGh1Yi5jb20vU1RNaWNyb2Vs
ZWN0cm9uaWNzL2xpbnV4L2Jsb2IvdjUuMTUtc3RtMzJtcC9zb3VuZC8NCj4gc29jL3N0bS9zdG0z
Ml9pMnMuYyNMMTIwMA0KPiANCj4gUGxlYXNlLCBjb3VsZCB5b3UgdXBkYXRlIHlvdXIgcGF0Y2gg
aW4gdGhpcyB3YXk/DQo+IFdpdGggYWxzbyBhbiB1cGRhdGUgb2YgdGhlICJGaXhlczoiIHJlZmVy
ZW5jZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UNCg0KSGksDQoNClZlcnkgdXNlZnVsIGd1aWRlLCBh
bmQgSSBoYXZlIHNlbmQgdjIgdmVyc2lvbi4gSW4gYWRkaXRpb24sIEkgZm91bmQgc2V2ZXJhbCBz
aW1pbGFyIHByb2JsZW1zIGF0IHRoZSBzYW1lIHRpbWUgYW5kIGZpeGVkIGl0IHRocm91Z2ggYSBw
YXRjaCBzZXQuDQoNClRoYW5rcywNClpoYW5nDQo+IA0KPiBUaGFua3MsDQo+IEFybmF1ZA0K
