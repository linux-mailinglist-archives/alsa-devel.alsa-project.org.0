Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AC46ED046
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 16:26:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7243CF48;
	Mon, 24 Apr 2023 16:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7243CF48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682346372;
	bh=XLMWVrIJOZP6Evmyhsr8TlNw/hIPAGjZlvm8N2UnyQg=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oZLzJw/0cKN/8eKcDgne8eObK3MtlT59W0KSeGbawAk2AP7yYqbc/AbrOpbnTaMlD
	 1xvNI6RIyj3/lFs29QaVpKn74EJpWyQBYK3n02JDLuW8e6HytK7BtS23itx1pAfSog
	 +E/BuPMJ4LHLvGpcL73XW67uZ9Tz5Z8TQUjobMBc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1088F80162;
	Mon, 24 Apr 2023 16:25:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DC4EF80236; Sun, 23 Apr 2023 11:15:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-3.7 required=5.0 tests=HTML_MESSAGE,RCVD_IN_DNSWL_HI,
	RDNS_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from gfmail2.glenfly.com (unknown [113.31.180.36])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ADB8F800AC
	for <alsa-devel@alsa-project.org>; Sun, 23 Apr 2023 11:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ADB8F800AC
X-ASG-Debug-ID: 1682241334-196b961946128910001-UKjUFf
Received: from GFSHEXCH02.glenfly.com (GFSHEXCH02.glenfly.com [10.5.250.52])
 by gfmail2.glenfly.com with ESMTP id a6QeZDmcc0tmSHsG;
 Sun, 23 Apr 2023 17:15:34 +0800 (CST)
X-Barracuda-Envelope-From: ReaperLiOC@glenfly.com
X-Barracuda-RBL-Trusted-Forwarder: 10.5.250.52
Received: from GFSHEXCH03.glenfly.com (10.5.250.53) by GFSHEXCH02.glenfly.com
 (10.5.250.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Sun, 23 Apr
 2023 17:15:34 +0800
Received: from GFSHEXCH03.glenfly.com ([fe80::1cb2:fbd4:8e34:2eb5]) by
 GFSHEXCH03.glenfly.com ([fe80::1cb2:fbd4:8e34:2eb5%4]) with mapi id
 15.01.2507.023; Sun, 23 Apr 2023 17:15:57 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.5.250.52
From: Reaper Li_OC <ReaperLiOC@glenfly.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: 
 =?gb2312?B?tPC4tDogW7/JxNzKx8Csu/jTyrz+XSAgUmU6IFtQQVRDSF0gQUxTQTogaGRh?=
 =?gb2312?B?OiBHbGVuZmx5OiBhZGQgSEQgQXVkaW8gUENJIElEcyBhbmQgSERNSSBDb2Rl?=
 =?gb2312?Q?c_Vendor_IDs.?=
Thread-Topic: 
 =?gb2312?B?W7/JxNzKx8Csu/jTyrz+XSAgUmU6IFtQQVRDSF0gQUxTQTogaGRhOiBHbGVu?=
 =?gb2312?B?Zmx5OiBhZGQgSEQgQXVkaW8gUENJIElEcyBhbmQgSERNSSBDb2RlYyBWZW5k?=
 =?gb2312?Q?or_IDs.?=
X-ASG-Orig-Subj: 
 =?gb2312?B?tPC4tDogW7/JxNzKx8Csu/jTyrz+XSAgUmU6IFtQQVRDSF0gQUxTQTogaGRh?=
 =?gb2312?B?OiBHbGVuZmx5OiBhZGQgSEQgQXVkaW8gUENJIElEcyBhbmQgSERNSSBDb2Rl?=
 =?gb2312?Q?c_Vendor_IDs.?=
Thread-Index: AQHZcc/EOyC6wNUtXUCwz+S5QTu9D68wSx6AgAH4F58=
Date: Sun, 23 Apr 2023 09:15:57 +0000
Message-ID: <c805ef8c3a384df8b7b8a189da8318dc@glenfly.com>
References: 
 <20230418083312.5208-1-reaperlioc@glenfly.com>,<87leip4j8q.wl-tiwai@suse.de>
In-Reply-To: <87leip4j8q.wl-tiwai@suse.de>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.30.24.33]
MIME-Version: 1.0
X-Barracuda-Connect: GFSHEXCH02.glenfly.com[10.5.250.52]
X-Barracuda-Start-Time: 1682241334
X-Barracuda-URL: https://10.5.252.52:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at glenfly.com
X-Barracuda-Scan-Msg-Size: 24023
X-Barracuda-Bayes: INNOCENT GLOBAL 0.5719 1.0000 0.7500
X-Barracuda-Spam-Score: 0.75
X-Barracuda-Spam-Status: No,
 SCORE=0.75 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0
 KILL_LEVEL=9.0 tests=HTML_MESSAGE
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.107810
	Rule breakdown below
	 pts rule name              description
	---- ----------------------
 --------------------------------------------------
	0.00 HTML_MESSAGE           BODY: HTML included in message
X-MailFrom: ReaperLiOC@glenfly.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HX5Y522UWBHBFVQYVKI3ZKXKK36SKXE4
X-Message-ID-Hash: HX5Y522UWBHBFVQYVKI3ZKXKK36SKXE4
X-Mailman-Approved-At: Mon, 24 Apr 2023 14:25:16 +0000
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gb2312"
X-Content-Filtered-By: Mailman/MimeDel 3.3.8
CC: "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Jason Tao(SH-RD)" <JasonTao@glenfly.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HX5Y522UWBHBFVQYVKI3ZKXKK36SKXE4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkNCg0KVGhhbmtzLCBJIHdpbGwgYWxzbyBzdWJtaXQgdG8gYWxzYS1kZXZlbCBNTCBhdCB0aGUg
bmV4dCB0aW1lLg0KDQoNCkZvciB0aGUgbGlzdGVkIHF1ZXN0aW9uczoNCg0KDQo+IEBAIC0xNzQz
LDYgKzE3NDUsOCBAQCBzdGF0aWMgaW50IGRlZmF1bHRfYmRsX3Bvc19hZGooc3RydWN0IGF6eCAq
Y2hpcCkNCj4gICAgICAgIH0NCj4NCj4gICAgICAgIHN3aXRjaCAoY2hpcC0+ZHJpdmVyX3R5cGUp
IHsNCj4gKyAgICAgY2FzZSBBWlhfRFJJVkVSX0dGSERNSToNCj4gKyAgICAgICAgICAgICByZXR1
cm4gMTI4Ow0KDQoNCiBvdXIgY2hpcCBuZWVkIGluY3JlYXNlIHRoZSBiZGwgYXMgdGhlcmUgaXMg
bGltaXRhdGlvbiBvbiBoYXJkd2FyZSwgb25jZSBoZGFjIGludGVycnVwdCBpbnRlcnZhbCBpcyB0
b28gc2hvcnQsIHRoZSBhdWRpbyBkYXRhIG1heSBnZXQgbG9zdC4NCg0KPiBAQCAtMTg1OSw2ICsx
ODYzLDkgQEAgc3RhdGljIGludCBhenhfZmlyc3RfaW5pdChzdHJ1Y3QgYXp4ICpjaGlwKQ0KPiAg
ICAgICAgfQ0KPiAgI2VuZGlmDQo+DQo+ICsgICAgIGlmIChjaGlwLT5kcml2ZXJfdHlwZSA9PSBB
WlhfRFJJVkVSX0dGSERNSSkNCj4gKyAgICAgICAgICAgICBidXMtPnBvbGxpbmdfbW9kZSA9IDE7
DQoNCg0KT3VyIGNoaXAgaGFzIGludGVycnVwdCB1cG9uIHRoZSBDT1JCL1JJUkIgcmVzcG9uc2Us
IHdoZW4gdGhlIGNvZGVjIGNvbXBsZXRlIHRoZSBjb21tYW5kLCBJdCBzZW5kcyBpbnRlcnJ1cHQg
YW5kIHdyaXRlcyByZXNwb25zZSBlbnRyaWVzIHRvIG1lbW9yeSwgSG93ZXZlciBvbiBvdXIgaGFy
ZHdhcmUsIHRoZSByZXNwb25zZSBlbnRyaWVzIHNvbWV0aW1lcyBhcmUgbm90IGFjdHVhbGx5IHN5
bmNocm9uaXplZCB0byBtZW1vcnkgd2hlbiBkcml2ZXIgaGFuZGxlIHRoZSBoZGFjIGludGVycnVw
dC4gSWYgdGhlIFJJUkIgc3RhdHVzIGlzIG5vdCB1cGRhdGVkIGluIHRoZSBoZGFjIGludGVycnVw
dCBoYW5kbGVyLCBhenhfcmlyYl9nZXRfcmVzcG9uc2Uga2VlcHMgdHJ5aW5nIHRvIHJlY2VpdmUg
YSByZXNwb25zZSAgZnJvbSByaXJiIHVudGlsIDFzIHRpbW91dCBiZWZvcmUgZW5hYmxpbmcgcG9s
bGluZ19tb2RlLCBzb21lIGFwcHMgdHJlYXQgaXQgYXMgYW4gZXJyb3IuIFNvIGZvciBvdXIgaGFy
ZHdhcmUsIG5lZWQgdG8gZW5hYmxlIHBvbGxpbmdfbW9kZSB0byBmaXggaXQuDQoNCj4gLS0tIGEv
c291bmQvcGNpL2hkYS9wYXRjaF9oZG1pLmMNCj4gKysrIGIvc291bmQvcGNpL2hkYS9wYXRjaF9o
ZG1pLmMNCj4gQEAgLTQ0ODksNiArNDQ4OSwxOCBAQCBzdGF0aWMgaW50IHBhdGNoX3ZpYV9oZG1p
KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjKQ0KPiAgICAgICAgcmV0dXJuIHBhdGNoX3NpbXBsZV9o
ZG1pKGNvZGVjLCBWSUFIRE1JX0NWVF9OSUQsIFZJQUhETUlfUElOX05JRCk7DQo+ICB9DQo+DQo+
ICtzdGF0aWMgaW50IHBhdGNoX2dmX2hkbWkoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMpDQo+ICt7
DQo+ICsgICAgIGludCBlcnI7DQo+ICsNCj4gKyAgICAgZXJyID0gcGF0Y2hfZ2VuZXJpY19oZG1p
KGNvZGVjKTsNCj4gKyAgICAgaWYgKGVycikNCj4gKyAgICAgICAgICAgICByZXR1cm4gZXJyOw0K
PiArDQo+ICsgICAgIGNvZGVjLT5ub19zdGlja3lfc3RyZWFtID0gMTsNCg0KDQpPbiBvdXIgY2hp
cCwgdGhlcmUgYXJlIHR3byBjb2RlY3MuIHdoZW4gc3RyZWFtIHN3aXRjaCBmcm9tIG9uZSBjb2Rl
YyB0byBhbm90aGVyIGNvZGVjLCBvdXIgaGFyZHdhcmUgbmVlZCBkcml2ZXIgdG8gZG8gYWN0dWFs
IGNsZWFuLXVwcyBpbiBjb2RlY19jbGVhbnVwX3N0cmVhbSBmb3IgdGhlIGxpbmtlZCBjb2RlYywg
b3RoZXJ3aXNlIGl0IGNhbid0IGNvbXBsZXRlIHN3aXRjaCBzdWNjZXNzZnVsbHkuDQoNCg0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLOiBUYWthc2hpIEl3YWkgPHRp
d2FpQHN1c2UuZGU+DQq3osvNyrG85DogMjAyM8TqNNTCMTjI1SAxNzo0NDo1Mw0KytW8/sjLOiBS
ZWFwZXIgTGlfT0MNCrOty806IHBlcmV4QHBlcmV4LmN6OyB0aXdhaUBzdXNlLmNvbTsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgSmFzb24gVGFvKFNILVJEKTsgYWxzYS1kZXZlbEBhbHNh
LXByb2plY3Qub3JnDQrW98ziOiBbv8nE3MrHwKy7+NPKvP5dIFJlOiBbUEFUQ0hdIEFMU0E6IGhk
YTogR2xlbmZseTogYWRkIEhEIEF1ZGlvIFBDSSBJRHMgYW5kIEhETUkgQ29kZWMgVmVuZG9yIElE
cy4NCg0KT24gVHVlLCAxOCBBcHIgMjAyMyAxMDozMzoxMiArMDIwMCwNCnJlYXBlcmxpIHdyb3Rl
Og0KPg0KPiBGcm9tOiBqYXNvbnRhbyA8amFzb250YW9AZ2xlbmZseS5jb20+DQo+DQo+IEFkZCBh
IHNldCBvZiBIRCBBdWRpbyBQQ0kgSURTLCBhbmQgdGhlIEhETUkgY29kZWMgdmVuZG9yIElEcyBm
b3INCj4gR2xlbmZseSBBcmlzZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogamFzb250YW8gPGphc29u
dGFvQGdsZW5mbHkuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiByZWFwZXJsaSA8cmVhcGVybGlvY0Bn
bGVuZmx5LmNvbT4NCg0KVGhlIHBhdGNoIGxvb2tzIE9LIG5vdywgYnV0IGNvdWxkIHlvdSBzdWJt
aXQgdG8gYWxzYS1kZXZlbCBNTCBhdCB0aGUNCm5leHQgdGltZT8NCg0KQWJvdXQgZGV0YWlscyBp
biB0aGUgcGF0Y2g6DQoNCj4gQEAgLTE3NDMsNiArMTc0NSw4IEBAIHN0YXRpYyBpbnQgZGVmYXVs
dF9iZGxfcG9zX2FkaihzdHJ1Y3QgYXp4ICpjaGlwKQ0KPiAgICAgICAgfQ0KPg0KPiAgICAgICAg
c3dpdGNoIChjaGlwLT5kcml2ZXJfdHlwZSkgew0KPiArICAgICBjYXNlIEFaWF9EUklWRVJfR0ZI
RE1JOg0KPiArICAgICAgICAgICAgIHJldHVybiAxMjg7DQoNClNvIHRoaXMgbG9va3MgcHJldHR5
IGhpZ2ggaW4gY29tcGFyaXNvbiB3aXRoIG90aGVyIGNoaXBzLg0KSXQgbWVhbnMgdGhhdCB0aGUg
YWN0dWFsIHBvc2l0aW9uIGlzIG11Y2ggYmVoaW5kIHRoZSByZXBvcnRlZA0KcG9zaXRpb24uICBE
dWUgdG8gYSBsYXJnZSBGSUZPPyAgT3Igd2hhdCByZWFzb24/DQoNCj4gQEAgLTE4NTksNiArMTg2
Myw5IEBAIHN0YXRpYyBpbnQgYXp4X2ZpcnN0X2luaXQoc3RydWN0IGF6eCAqY2hpcCkNCj4gICAg
ICAgIH0NCj4gICNlbmRpZg0KPg0KPiArICAgICBpZiAoY2hpcC0+ZHJpdmVyX3R5cGUgPT0gQVpY
X0RSSVZFUl9HRkhETUkpDQo+ICsgICAgICAgICAgICAgYnVzLT5wb2xsaW5nX21vZGUgPSAxOw0K
DQpUaGlzIGxvb2tzIG9kZCwgdG9vLiAgRG9lc24ndCB0aGUgaGFyZHdhcmUgZ2l2ZSBhbnkgaW50
ZXJydXB0IGJhY2sNCnVwb24gdGhlIENPUkIvUklSQiByZXNwb25zZT8NCg0KPiAtLS0gYS9zb3Vu
ZC9wY2kvaGRhL3BhdGNoX2hkbWkuYw0KPiArKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX2hkbWku
Yw0KPiBAQCAtNDQ4OSw2ICs0NDg5LDE4IEBAIHN0YXRpYyBpbnQgcGF0Y2hfdmlhX2hkbWkoc3Ry
dWN0IGhkYV9jb2RlYyAqY29kZWMpDQo+ICAgICAgICByZXR1cm4gcGF0Y2hfc2ltcGxlX2hkbWko
Y29kZWMsIFZJQUhETUlfQ1ZUX05JRCwgVklBSERNSV9QSU5fTklEKTsNCj4gIH0NCj4NCj4gK3N0
YXRpYyBpbnQgcGF0Y2hfZ2ZfaGRtaShzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYykNCj4gK3sNCj4g
KyAgICAgaW50IGVycjsNCj4gKw0KPiArICAgICBlcnIgPSBwYXRjaF9nZW5lcmljX2hkbWkoY29k
ZWMpOw0KPiArICAgICBpZiAoZXJyKQ0KPiArICAgICAgICAgICAgIHJldHVybiBlcnI7DQo+ICsN
Cj4gKyAgICAgY29kZWMtPm5vX3N0aWNreV9zdHJlYW0gPSAxOw0KDQpUaGlzIGhhY2sgaXMgbmVl
ZGVkIGZvciB3aGF0IHJlYXNvbj8NCg0KDQp0aGFua3MsDQoNClRha2FzaGkNCg==
