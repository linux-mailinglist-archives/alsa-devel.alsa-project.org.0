Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F091835FFFB
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 04:28:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 754B51675;
	Thu, 15 Apr 2021 04:27:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 754B51675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618453686;
	bh=SwELyqG0T5S+aA3TZVu7M9eAFBvZ1AY6DPJUGbp3x7I=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G0FpWw0KTt/5voXbCWgeVuXCFhWsNJOIWKqGuNhtsWCYGmOhsDrUU7rUm+Dsv/1yh
	 D6iJgCkwfQd3v0zt4LtdYOUu3Bvap5XwRGjNpYyCK0bIknFdIiSUGZJYarnEfWBKqZ
	 orpU2N6QVQkWcXfMgNL7Nh8WzJJfF/tWiAnXvjIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CABEDF8022D;
	Thu, 15 Apr 2021 04:26:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8009BF8022B; Thu, 15 Apr 2021 04:26:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from ZXSHCAS2.zhaoxin.com (ZXSHCAS2.zhaoxin.com [203.148.12.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 673E9F80128
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 04:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 673E9F80128
Received: from ZXSHMBX1.zhaoxin.com (10.28.252.163) by ZXSHCAS2.zhaoxin.com
 (10.28.252.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 15 Apr
 2021 10:26:18 +0800
Received: from ZXSHMBX2.zhaoxin.com (10.28.252.164) by ZXSHMBX1.zhaoxin.com
 (10.28.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 15 Apr
 2021 10:26:18 +0800
Received: from ZXSHMBX2.zhaoxin.com ([fe80::bc45:846e:e99:79fa]) by
 ZXSHMBX2.zhaoxin.com ([fe80::bc45:846e:e99:79fa%4]) with mapi id
 15.01.2176.009; Thu, 15 Apr 2021 10:26:18 +0800
From: "Hans Hu(SH-RD)" <HansHu@zhaoxin.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: =?utf-8?B?562U5aSNOiBbMi8yXUFMU0E6IGhkYTogYWRkIFpoYW94aW4gSERBQyBub24t?=
 =?utf-8?Q?snoop_support:_patch_a_design_limitation?=
Thread-Topic: [2/2]ALSA: hda: add Zhaoxin HDAC non-snoop support: patch a
 design limitation
Thread-Index: AdcxJIpucuReiKtdTMeHbsAd1r6a7v//goKA//6PJmA=
Date: Thu, 15 Apr 2021 02:26:18 +0000
Message-ID: <1bbe710807f9426a83aeba5be0d85c4a@zhaoxin.com>
References: <0f1c89c9728f4310b4e84e4c74df02c6@zhaoxin.com>
 <s5hpmyxukc4.wl-tiwai@suse.de>
In-Reply-To: <s5hpmyxukc4.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.28.252.132]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Cc: "'alsa-devel@alsa-project.org'" <alsa-devel@alsa-project.org>,
 "Zhuangzhuang He\(SH-RD\)" <ZhuangzhuangHe@zhaoxin.com>, "Leo
 Liu\(XA-RD\)" <LeoLiu@zhaoxin.com>, "Cobe Chen\(BJ-RD\)" <CobeChen@zhaoxin.com>,
 "Tim Guo\(BJ-RD\)" <TimGuo@zhaoxin.com>,
 "Tony W. Wang\(XA-RD\)" <TonyWWang@zhaoxin.com>
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

Pk9uIFdlZCwgMTQgQXByIDIwMjEgMTQ6MDA6MjMgKzAyMDAsDQo+SGFucyBIdShTSC1SRCkgd3Jv
dGU6DQo+Pg0KPj4gSGkgVGFrYXNoaSwNCj4+DQo+PiBaSEFPWElOIEhEQUMgY29udHJvbGxlciBo
YXMgb25lIGRlc2lnbiBsaW1pdGF0aW9uIHdoZW4gaXQgd29ya3MgaW4gbm9uLXNub29wIG1vZGUu
IFRoaXMgZGVzaWduIGxpbWl0YXRpb24gaXM6IGhhcmR3YXJlIGNhbid0IGd1YXJhbnRlZSB0aGF0
IHRoZSB3cml0ZSBDT1JCIGN5Y2xlIGFsd2F5cyBjb21wbGV0ZXMgZmlyc3QgYmVmb3JlIHRoZSB3
cml0ZSBDT1JCV1AgY3ljbGUuIEhlcmUgaXMgdGhlIGVycm9yIHNjZW5lOg0KPj4gaW50IHNuZF9o
ZGFjX2J1c19zZW5kX2NtZChzdHJ1Y3QgaGRhY19idXMgKmJ1cywgdW5zaWduZWQgaW50IHZhbCkg
ew0KPj4gLi4uDQo+PiAgICAgICAgIGJ1cy0+Y29yYi5idWZbd3BdID0gY3B1X3RvX2xlMzIodmFs
KTsgICAgICAgICAvLyBjeWNsZV8xOiAgd3JpdGUgdmFsdWUgdG8gQ09SQg0KPj4gICAgICAgICBz
bmRfaGRhY19jaGlwX3dyaXRldyhidXMsIENPUkJXUCwgd3ApOyAgICAgLy8gY3ljbGVfMjogIHdy
aXRlIHdwIHRvIENPUkJXUA0KPj4gLi4uDQo+PiB9DQo+PiBOb3JtYWxseSwgYWZ0ZXIgY3ljbGVf
MiwgRE1BIGVuZ2luZSB3aWxsIHN0YXJ0IHdvcmtpbmcgYW5kIGdldCBkYXRhIGZyb20gQ09SQiBh
bmQgc2VudCBpdCBvdXQuIEJ1dCBpZiBjeWNsZV8xIGhhdmVu4oCZdCBmaW5pc2hlZCB5ZXQgYXQg
dGhpcyB0aW1lKGxpbWl0YXRpb24gb2NjdXJzKSwgd2hpY2ggbWVhbnMgdGhlIHZhbHVlIGhhdmVu
4oCZdCBiZWVuIHdyaXR0ZW4gaW50byBDT1JCLCB0aGVuIERNQSBlbmdpbmUgd2lsbCBnZXQgdW5l
eHBlY3RlZCB2YWx1ZSwgdGhlbiBlcnJvciBvY2N1cnJlZC4gKGZlZWxzIGxpa2Ugb25lIGtpbmQg
b2YgQ09SQiB1bmRlcnJ1bikuDQo+Pg0KPj4gSWYgd2UgYWRkIG9uZSByZWFkIENPUkIgY3ljbGUg
YmV0d2VlbiBjeWNsZV8xIGFuZCBjeWNsZV8yLCBjeWNsZV8xIGFuZCBjeWNsZV8yIG9wZXJhdGlv
bnMgd2lsbCBiZSBzeW5jaHJvbml6ZWQsIHRoaXMgbGltaXRhdGlvbiB3aWxsIGJlIGZpeGVkLiBX
ZSBoYXZlIHdyaXR0ZW4gYSBkcmFmdCBwYXRjaCBiYXNlZCBvbiB0aGlzIHNpdHVhdGlvbiBhbmQg
aG9wZSB0byBiZSBhY2NlcHRlZCwgdGhlIHBhdGNoIGV4YW1wbGUgaXMgYXMgZm9sbG93czoNCj4+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NvdW5kL2hkYXVkaW8uaCBiL2luY2x1ZGUvc291bmQvaGRh
dWRpby5oIGluZGV4DQo+PiAyMmFmNjhiLi5jMzM4ZGIwMCAxMDA2NDQNCj4+IC0tLSBhL2luY2x1
ZGUvc291bmQvaGRhdWRpby5oDQo+PiArKysgYi9pbmNsdWRlL3NvdW5kL2hkYXVkaW8uaA0KPj4g
QEAgLTMzOSw2ICszMzksNyBAQCBzdHJ1Y3QgaGRhY19idXMgew0KPj4gICAgICAgICBib29sIHN5
bmNfd3JpdGU6MTsgICAgICAgICAgICAgIC8qIHN5bmMgYWZ0ZXIgdmVyYiB3cml0ZSAqLw0KPj4g
ICAgICAgICBib29sIHVzZV9wb3NidWY6MTsgICAgICAgICAgICAgIC8qIHVzZSBwb3NpdGlvbiBi
dWZmZXIgKi8NCj4+ICAgICAgICAgYm9vbCBzbm9vcDoxOyAgICAgICAgICAgICAgICAgICAvKiBl
bmFibGUgc25vb3BpbmcgKi8NCj4+ICsgICAgICAgYm9vbCBub19zbm9vcF9jb3JiX3N5bmM6MTsN
Cj4+ICAgICAgICAgYm9vbCBhbGlnbl9iZGxlXzRrOjE7ICAgICAgICAgICAvKiBCRExFIGFsaWdu
IDRLIGJvdW5kYXJ5ICovDQo+PiAgICAgICAgIGJvb2wgcmV2ZXJzZV9hc3NpZ246MTsgICAgICAg
ICAgLyogYXNzaWduIGRldmljZXMgaW4gcmV2ZXJzZSBvcmRlciAqLw0KPj4gICAgICAgICBib29s
IGNvcmJycF9zZWxmX2NsZWFyOjE7ICAgICAgIC8qIENPUkJSUCBjbGVhcnMgaXRzZWxmIGFmdGVy
IHJlc2V0ICovDQo+PiBkaWZmIC0tZ2l0IGEvc291bmQvaGRhL2hkYWNfY29udHJvbGxlci5jIGIv
c291bmQvaGRhL2hkYWNfY29udHJvbGxlci5jDQo+PiBpbmRleCAwNjJkYTdhLi42YzkwY2RkIDEw
MDY0NA0KPj4gLS0tIGEvc291bmQvaGRhL2hkYWNfY29udHJvbGxlci5jDQo+PiArKysgYi9zb3Vu
ZC9oZGEvaGRhY19jb250cm9sbGVyLmMNCj4+IEBAIC0xNjcsNiArMTY3LDggQEAgaW50IHNuZF9o
ZGFjX2J1c19zZW5kX2NtZChzdHJ1Y3QgaGRhY19idXMgKmJ1cywNCj4+IHVuc2lnbmVkIGludCB2
YWwpDQo+Pg0KPj4gICAgICAgICBidXMtPnJpcmIuY21kc1thZGRyXSsrOw0KPj4gICAgICAgICBi
dXMtPmNvcmIuYnVmW3dwXSA9IGNwdV90b19sZTMyKHZhbCk7DQo+PiArICAgICAgIGlmIChidXMt
Pm5vX3Nub29wX2NvcmJfc3luYykNCj4+ICsgICAgICAgICAgICAgICB2YWwgPSBidXMtPmNvcmIu
YnVmW3dwXTsNCj4+ICAgICAgICAgc25kX2hkYWNfY2hpcF93cml0ZXcoYnVzLCBDT1JCV1AsIHdw
KTsNCj4NCj5KdXN0IHdvbmRlcmluZyB3aGV0aGVyIHVzaW5nIFdSSVRFX09OQ0UoKSBtYWNybyB3
b3VsZCBiZSBlbm91Z2g/DQo+ZS5nLg0KPldSSVRFX09OQ0UoYnVzLT5jb3JiLmJ1Zlt3cF0sIGNw
dV90b19sZTMyKHZhbCkpOw0KPkFsc28sIG5vX3Nub29wX2NvcmJfc3luYyBpcyBhIGJpdCBjb25m
dXNpbmcuICBXaGF0IHlvdSBkbyBpcyByYXRoZXIgc3luYyBvZiB0aGUgd3JpdHRlbiB2YWx1ZSwg
c28gaXQgY2FuIGJlIHRha2VuIGFzIGlmIG90aGVyIHdheSByb3VuZC4NCj5NYXliZSBub19jb2hl
cmVudF9jb3JiX3dyaXRlIG9yIHN1Y2ggd291bGQgYmUgYmV0dGVyIHVuZGVyc3RhbmRhYmxlLg0K
Pg0KPg0KPnRoYW5rcywNCj4NCj5UYWthc2hpDQoNClRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9u
LCBpdCdzIG15IGZhdWx0IG5vdCBjbGVhcmx5IGV4cGxhaW4gdGhlIHJvb3QgY2FzZSBhYm91dCB0
aGlzIGxpbWl0YXRpb24sIHdoaWNoIGlzLCB0aGVzZSB0d28ga2luZCBvZiBpbnN0cnVjdGlvbnMg
aGF2ZSBpbmRlcGVuZGVudCBwaHlzaWNhbCBwYXRocywgZXZlbiBDMk0gaW5zdHJ1Y3Rpb24oY3lj
bGVfMSkgYWxyZWFkeSByZXRpcmVkIGJlZm9yZSBDMlAgaW5zdHJ1Y3Rpb24oY3ljbGVfMiB3aXRo
IG5vbi1zbm9vcCkgc3RhcnQsIGhhcmR3YXJlIHN0aWxsIGNhbid0IGd1YXJhbnRlZSB0aGUgY29o
ZXJlbmNlLg0KQnV0IHdlIGNhbiB1c2UgV1JJVEVfT05DRSgpIHRvIGVuaGFuY2UgdGhlIHBhdGNo
IGFuZCB0byBwcmV2ZW50IGl0IGZyb20gYmVpbmcgb3B0aW1pemVkIGJ5IHRoZSBjb21waWxlci4N
CiArICAgICAgIGlmIChidXMtPm5vX2NvaGVyZW50X2NvcmJfd3JpdGUpDQogKyAgICAgICAgICAg
ICAgIFdSSVRFX09OQ0UoY3B1X3RvX2xlMzIodmFsKSwgYnVzLT5jb3JiLmJ1Zlt3cF0pOw0KVGhp
cyBsaW1pdGF0aW9uIG9ubHkgYXBwZWFycyBpbiB0aGUgbm9uLXNub29wIG1vZGUsIGRvZXMgdGhp
cyBuZWVkIHRvIGJlIHJlZmxlY3RlZCBpbiB0aGUgdmFyaWFibGUgbmFtZT8NCg0KDQpUaGFua3Ms
DQogIEhhbnMgOikNCg0KDQrkv53lr4blo7DmmI7vvJoNCuacrOmCruS7tuWQq+acieS/neWvhuaI
luS4k+acieS/oeaBr++8jOS7heS+m+aMh+WumuaUtuS7tuS6uuS9v+eUqOOAguS4peemgeWvueac
rOmCruS7tuaIluWFtuWGheWuueWBmuS7u+S9leacque7j+aOiOadg+eahOafpemYheOAgeS9v+eU
qOOAgeWkjeWItuaIlui9rOWPkeOAgg0KQ09ORklERU5USUFMIE5PVEU6DQpUaGlzIGVtYWlsIGNv
bnRhaW5zIGNvbmZpZGVudGlhbCBvciBsZWdhbGx5IHByaXZpbGVnZWQgaW5mb3JtYXRpb24gYW5k
IGlzIGZvciB0aGUgc29sZSB1c2Ugb2YgaXRzIGludGVuZGVkIHJlY2lwaWVudC4gQW55IHVuYXV0
aG9yaXplZCByZXZpZXcsIHVzZSwgY29weWluZyBvciBmb3J3YXJkaW5nIG9mIHRoaXMgZW1haWwg
b3IgdGhlIGNvbnRlbnQgb2YgdGhpcyBlbWFpbCBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLg0K
