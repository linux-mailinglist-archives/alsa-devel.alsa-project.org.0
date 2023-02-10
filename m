Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E08692A97
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 23:53:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C957B839;
	Fri, 10 Feb 2023 23:52:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C957B839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676069626;
	bh=ayJBEioHFUluc/usiOZrVRNY5GhRfOIHPhXyho/CY9A=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jVRI4jUBmozXf4nIWoc+Ad1eMFMPoplTVuxGR2xxp0P5uhvpUxAdor6lZISFVIfL/
	 4a9OpDQsB6ZzLrrF31ZkFcu7XJg56D+cJrFTp5XULD2qt36eFtUXT2+/NNI2ECVe6G
	 wajGaDxda7wC8pV8YZNzcVDsY+FDTEbyuZIxfj3E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B94BF800B8;
	Fri, 10 Feb 2023 23:52:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29F18F800E4; Fri, 10 Feb 2023 23:52:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA77AF8001E
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 23:52:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA77AF8001E
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-322-_dDriQfgMmGpxT3zQV6kYQ-1; Fri, 10 Feb 2023 22:52:43 +0000
X-MC-Unique: _dDriQfgMmGpxT3zQV6kYQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.45; Fri, 10 Feb
 2023 22:52:41 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.045; Fri, 10 Feb 2023 22:52:41 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Hans de Goede' <hdegoede@redhat.com>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "amd-gfx@lists.freedesktop.org"
	<amd-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
Subject: RE: [RFC PATCH 1/9] apple-gmux: use cpu_to_be32 instead of manual
 reorder
Thread-Topic: [RFC PATCH 1/9] apple-gmux: use cpu_to_be32 instead of manual
 reorder
Thread-Index: AQHZPYayA1ivfjGBOEq1WtvynnRGNq7IyMig
Date: Fri, 10 Feb 2023 22:52:41 +0000
Message-ID: <6d733fa367e24462bf679b59e790ba4b@AcuMS.aculab.com>
References: <20230210044826.9834-1-orlandoch.dev@gmail.com>
 <20230210044826.9834-2-orlandoch.dev@gmail.com>
 <3af65b5e-1f52-79f6-4130-03901ce76d2f@redhat.com>
 <990b254c-b55f-539d-d6b5-fa4499078527@redhat.com>
In-Reply-To: <990b254c-b55f-539d-d6b5-fa4499078527@redhat.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Message-ID-Hash: N643PO2SET4WASPK2FE7U3UHDRYQACUF
X-Message-ID-Hash: N643PO2SET4WASPK2FE7U3UHDRYQACUF
X-MailFrom: david.laight@aculab.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Mark Gross <markgross@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, Jack Xiao <Jack.Xiao@amd.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?utf-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Kerem Karabay <kekrby@gmail.com>,
 Aditya Garg <gargaditya08@live.com>, Aun-Ali Zaidi <admin@kodeit.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N643PO2SET4WASPK2FE7U3UHDRYQACUF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

RnJvbTogSGFucyBkZSBHb2VkZQ0KPiBTZW50OiAxMCBGZWJydWFyeSAyMDIzIDE5OjMzDQo+IA0K
PiBIaSwNCj4gDQo+IE9uIDIvMTAvMjMgMjA6MDksIEhhbnMgZGUgR29lZGUgd3JvdGU6DQo+ID4g
SGksDQo+ID4NCj4gPiBPbiAyLzEwLzIzIDA1OjQ4LCBPcmxhbmRvIENoYW1iZXJsYWluIHdyb3Rl
Og0KPiA+PiBDdXJyZW50bHkgaXQgbWFudWFsbHkgZmxpcHMgdGhlIGJ5dGUgb3JkZXIsIGJ1dCB3
ZSBjYW4gaW5zdGVhZCB1c2UNCj4gPj4gY3B1X3RvX2JlMzIodmFsKSBmb3IgdGhpcy4NCj4gPj4N
Cj4gPj4gU2lnbmVkLW9mZi1ieTogT3JsYW5kbyBDaGFtYmVybGFpbiA8b3JsYW5kb2NoLmRldkBn
bWFpbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgZHJpdmVycy9wbGF0Zm9ybS94ODYvYXBwbGUtZ211
eC5jIHwgMTggKystLS0tLS0tLS0tLS0tLS0tDQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcGxhdGZvcm0veDg2L2FwcGxlLWdtdXguYyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2FwcGxl
LWdtdXguYw0KPiA+PiBpbmRleCA5MzMzZjgyY2ZhOGEuLmU4Y2IwODRjYjgxZiAxMDA2NDQNCj4g
Pj4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvYXBwbGUtZ211eC5jDQo+ID4+ICsrKyBiL2Ry
aXZlcnMvcGxhdGZvcm0veDg2L2FwcGxlLWdtdXguYw0KPiA+PiBAQCAtOTQsMTMgKzk0LDcgQEAg
c3RhdGljIHUzMiBnbXV4X3Bpb19yZWFkMzIoc3RydWN0IGFwcGxlX2dtdXhfZGF0YSAqZ211eF9k
YXRhLCBpbnQgcG9ydCkNCj4gPj4gIHN0YXRpYyB2b2lkIGdtdXhfcGlvX3dyaXRlMzIoc3RydWN0
IGFwcGxlX2dtdXhfZGF0YSAqZ211eF9kYXRhLCBpbnQgcG9ydCwNCj4gPj4gIAkJCSAgICAgdTMy
IHZhbCkNCj4gPj4gIHsNCj4gPj4gLQlpbnQgaTsNCj4gPj4gLQl1OCB0bXB2YWw7DQo+ID4+IC0N
Cj4gPj4gLQlmb3IgKGkgPSAwOyBpIDwgNDsgaSsrKSB7DQo+ID4+IC0JCXRtcHZhbCA9ICh2YWwg
Pj4gKGkgKiA4KSkgJiAweGZmOw0KPiA+PiAtCQlvdXRiKHRtcHZhbCwgZ211eF9kYXRhLT5pb3N0
YXJ0ICsgcG9ydCArIGkpOw0KPiA+PiAtCX0NCj4gPj4gKwlvdXRsKGNwdV90b19iZTMyKHZhbCks
IGdtdXhfZGF0YS0+aW9zdGFydCArIHBvcnQpOw0KPiA+PiAgfQ0KPiA+Pg0KPiA+PiAgc3RhdGlj
IGludCBnbXV4X2luZGV4X3dhaXRfcmVhZHkoc3RydWN0IGFwcGxlX2dtdXhfZGF0YSAqZ211eF9k
YXRhKQ0KPiA+DQo+ID4gVGhlIGlvcG9ydCAvIGluZGV4ZWQtaW9wb3J0IGFjY2Vzc2VkIGFwcGxl
X2dtdXgtZXMgbGlrZWx5IGFyZSAocGFydCBvZj8pDQo+ID4gTFBDIGJ1cyBkZXZpY2VzIC4gTG9v
a2luZyBhdCB0aGUgYnVzIGxldmVsIHlvdSBhcmUgbm93IGNoYW5naW5nIDQgaW8NCj4gPiBhY2Nl
c3NlcyB3aXRoIGEgc2l6ZSBvZiAxIGJ5dGUsIHRvIDEgMzIgYml0IGlvLWFjY2Vzcy4NCj4gDQo+
IENvcnJlY3Rpb24gdG8gbXlzZWxmLCByZS1yZWFkaW5nIHRoZSBMUEMgc3BlY2lmaWNhdGlvbiwg
dGhlbg0KPiBpZiBJJ20gcmlnaHQgYW5kIHRoaXMgaXMgYSBMUEMgZGV2aWNlIHRoZW4gYWxsIElP
IGluL291dCBhY2Nlc3Nlcw0KPiBhcmUgYWx3YXlzIDEgYnl0ZSBhY2Nlc3Nlcy4gU2luY2UgdGhl
IExQQyBidXMgb25seSBzdXBwb3J0cyAxNiAvIDMyDQo+IGJpdCBhY2Nlc3NlcyBmb3IgRE1BIGN5
Y2xlcy4NCj4gDQo+IFNvIHByZXN1bWFibHkgdGhlIG91dGwoKSB3b3VsZCBnZXQgc3BsaXQgaW50
byA0IHNlcGFyYXRlIDggYml0DQo+IChwb3J0KSBJTyBhY2Nlc3Nlcy4NCg0KSSB3b25kZXIgaWYg
dGhlcmUgaXMgc29tZXRoaW5nIG9ic2N1cmUgYW5kIHRoZSBvcmRlciBvZiB0aGUNCjQgYnl0ZXMg
d3JpdGVzIG1hdHRlcnM/DQoNCkluIGFueSBjYXNlIHdyaXRpbmcgYXM6DQoJeHh4eCBpb3N0YXJ0
ID0gZ211eF9kYXRhLT5pb3N0YXJ0ICsgcG9ydDsNCg0KCW91dGIodmFsLCBpb3N0YXJ0KTsNCglv
dXRiKHZhbCA+PiA4LCBpb3N0YXJ0ICsgMSk7DQoJb3V0Yih2YWwgPj4gMTYsIGlvc3RhcnQgKyAy
KTsNCglvdXRiKHZhbCA+PiAyNCwgaW9jdGFydCArIDMpOw0KYWxtb3N0IGNlcnRhaW5seSBnZW5l
cmF0ZXMgYmV0dGVyIGNvZGUuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFr
ZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwg
VUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

