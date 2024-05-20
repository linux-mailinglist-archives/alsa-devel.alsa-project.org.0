Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 466CC8C9E60
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:49:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B730F839;
	Mon, 20 May 2024 15:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B730F839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716212949;
	bh=rGStb7POa/eACNmghIRVWWan7CtCKDW9z7QVFvd9kFg=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AnEdo3pZ2/26DEDfEBBkUXmoU2T16M7A8A9/QDLyMWRnLOAMG0D5nRj+M+zHe359J
	 bAbKXQQd6oJ3cM+VzTAPguBsKNpQDRmsSP/z+t2k5zI02+QowoFUmCm1R7kFW/UCZK
	 /2Asy0vT+XzqJ+sz/6Mh9Mp1HAKAdJqm30wyToiw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C224F806FA; Mon, 20 May 2024 15:46:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1C5DF806FC;
	Mon, 20 May 2024 15:46:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFE2EF8057A; Mon, 20 May 2024 14:32:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9267F8026A
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 14:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9267F8026A
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 44K3GhZE2885027,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.95/5.92) with ESMTPS id 44K3GhZE2885027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 May 2024 11:16:43 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 20 May 2024 11:16:43 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 20 May 2024 11:16:43 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975]) by
 RTEXMBS01.realtek.com.tw ([fe80::d5b2:56ba:6b47:9975%5]) with mapi id
 15.01.2507.035; Mon, 20 May 2024 11:16:43 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>
Subject: RE: [PATCH v2] ASoC: rt1320: Add RT1320 SDCA vendor-specific driver
Thread-Topic: [PATCH v2] ASoC: rt1320: Add RT1320 SDCA vendor-specific driver
Thread-Index: AQHaqCvMMBeBUyBRWUWY0jcyYA1OxbGa+W+AgAR6mJA=
Date: Mon, 20 May 2024 03:16:43 +0000
Message-ID: <38808c5a15c34e92959a109328612a5d@realtek.com>
References: <20240517072814.330597-1-shumingf@realtek.com>
 <e7ff0998-696c-4551-923d-7f04c7e89ba0@linux.intel.com>
In-Reply-To: <e7ff0998-696c-4551-923d-7f04c7e89ba0@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.22.102.209]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: WKFZBGZ4WLCFXZWKCS5B2LDSYKZP23SO
X-Message-ID-Hash: WKFZBGZ4WLCFXZWKCS5B2LDSYKZP23SO
X-MailFrom: shumingf@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlZ19zZXF1ZW5jZSBydDEzMjBfYmxpbmRfd3JpdGVb
XSA9IHsNCj4gPiArICAgICB7IDB4YzAwMywgMHhlMCB9LA0KPiAuLi4NCj4gPiArICAgICB7IDB4
ZDQ4NiwgMHhjMyB9LA0KPiA+ICt9Ow0KPiANCj4gSSB3b3VsZCBhZGQgYSBjb21tZW50IHRoYXQg
dGhlICdibGluZCB3cml0ZXMnIGlzIGFuIFNEQ0EgdGVybSB0byBkZWFsIHdpdGgNCj4gcGxhdGZv
cm0tc3BlY2lmaWMgaW5pdGlhbGl6YXRpb24sIGJ1dCBpbiB0aGlzIGNhc2UgaXQgc2VlbXMgdGhh
dCBhbGwgdGhlIGFkZHJlc3Nlcw0KPiB0YXJnZXRlZCBhcmUgaW4gdGhlIHZlbmRvci1zcGVjaWZp
YyBzcGFjZQ0KDQpTdXJlLCB3aWxsIGFkZCBhIGNvbW1lbnQgdG8gZGVzY3JpYmUgd2hhdCBibGlu
ZCB3cml0ZXMgbWVhbnMuDQoNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCByZWdfc2VxdWVuY2Ug
cnQxMzIwX3BhdGNoX2NvZGVfd3JpdGVbXSA9IHsNCj4gPiArICAgICB7IDB4MTAwMDcwMDAsIDB4
MzcgfSwNCj4gLi4uDQo+ID4gKyAgICAgeyAweDAwMDBkNTQwLCAweDAxIH0sDQo+ID4gK307DQo+
IA0KPiBJIHdvdWxkIGFkZCBhIGNvbW1lbnQgb24gdGhlIHRhcmdldGVkIHJlZ2lzdGVyIHNwYWNl
LiBJdCBzZWVtcyB0byBiZSB0aGUNCj4gU0RDQSBmdW5jdGlvbiAxLCBleGNlcHQgZm9yIHRoZSBs
YXN0IG9uZT8NCj4gDQo+IEFsc28gcG9zc2libHkgbW92ZSB0aGUgdGFibGVzIHRvIGEgZGlmZmVy
ZW50IGZpbGUgdG8gbWFrZSB0aGUgZHJpdmVyIGNvZGUgZWFzaWVyDQo+IHRvIGdldCB0byAobGVz
cyBzY3JvbGxpbmcgcmVxdWlyZWQpLg0KDQpUaGUgZHJpdmVyIHdpbGwgYWRkIGEgY29tbWVudCBm
b3IgdGhlIHBhdGNoX2NvZGVfd3JpdGUuDQpUaGUgc2V0dGluZyBvZiB0aGUgbGFzdCBvbmUgbm90
aWZpZXMgdGhlIHBhdGNoIGNvZGUgYW5kIGJsaW5kIHdyaXRlcyBhcmUgZG9uZS4NClRoYXQgaXMg
dGhlIGhhbmRzaGFrZSBtZWNoYW5pc20gd2Ugc2hhbGwgc2V0Lg0KDQo+ID4gK3N0YXRpYyBpbnQg
cnQxMzIwX3JlYWRfcHJvcChzdHJ1Y3Qgc2R3X3NsYXZlICpzbGF2ZSkgew0KPiA+ICsgICAgIHN0
cnVjdCBzZHdfc2xhdmVfcHJvcCAqcHJvcCA9ICZzbGF2ZS0+cHJvcDsNCj4gPiArICAgICBpbnQg
bnZhbDsNCj4gPiArICAgICBpbnQgaSwgajsNCj4gPiArICAgICB1MzIgYml0Ow0KPiA+ICsgICAg
IHVuc2lnbmVkIGxvbmcgYWRkcjsNCj4gPiArICAgICBzdHJ1Y3Qgc2R3X2Rwbl9wcm9wICpkcG47
DQo+ID4gKw0KPiA+ICsgICAgIHNkd19zbGF2ZV9yZWFkX3Byb3Aoc2xhdmUpOw0KPiANCj4gYWRk
IGEgY29tbWVudCB0aGF0IHRoaXMgaXMgbmVlZGVkIHRvIGZldGNoIHRoZSBsYW5lIGluZm9ybWF0
aW9uIGZyb20gcGxhdGZvcm0NCj4gZmlybXdhcmUuDQoNCk9LLCB3aWxsIGRvLg0KDQo+ID4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3Qgc2R3X2RldmljZV9pZCBydDEzMjBfaWRbXSA9IHsNCj4gPiArICAg
ICBTRFdfU0xBVkVfRU5UUllfRVhUKDB4MDI1ZCwgMHgxMzIwLCAweDMsIDB4MCwgMCksXA0KPiAN
Cj4gbWlzc2luZyBjbGFzcyBJRCAxPw0KDQpXaWxsIGFkZCBjbGFzcyBJRCAxLg0KDQo+ID4gKw0K
PiA+ICsvKiBGdW5jdGlvbl9TdGF0dXMgKi8NCj4gPiArI2RlZmluZSBGVU5DVElPTl9ORUVEU19J
TklUSUFMSVpBVElPTiAgICAgICAgICAgICAgICBCSVQoNSkNCj4gPiArI2RlZmluZSBGVU5DVElP
Tl9IQVNfQkVFTl9SRVNFVCAgICAgICAgICAgICAgICAgICAgICBCSVQoNikNCj4gDQo+IFlvdSBz
ZWVtIHRvIHVzZSBvbmx5IE5FRURTX0lOSVRJQUxJWkFUSU9OLCB3aGF0IGhhcHBlbnMgb24gYSBS
RVNFVD8NCg0KVGhlIFJFU0VUIHNob3VsZCBpbmZsdWVuY2UgdGhlIFNEQ0EgY29udHJvbC4NClRo
ZSBibGluZCB3cml0ZXMgZG9lc24ndCBzZXQgdGhlIFNEQ0EgY29udHJvbC4gVGhlcmVmb3JlLCB0
aGUgZHJpdmVyIGRvZXNuJ3QgY2hlY2sgUkVTRVQgZmxhZy4NCg0KPiA+ICsjZGVmaW5lIEZVTkNU
SU9OX0JVU1kgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVCg3KQ0KPiBub3QgdXNl
ZCwgY2FuIGl0IGJlIGFzc2VydGVkPw0KDQpXaWxsIHJlbW92ZSBpdC4gDQoNCj4gTG9va3MgbW9z
dGx5IGdvb2Qgb3RoZXJ3aXNlLCB0aGFua3MgZm9yIHRoZSBwYXRjaC4NCg==
