Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A635EB478BC
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Sep 2025 05:12:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BC2560204;
	Sun,  7 Sep 2025 05:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BC2560204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757214743;
	bh=aVtYjwlXvc25QceDbruUTnXsHgbr6cBj7xPff+gR/C0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iQrF752SzZYkxCwAL5HWYCNEmCkcC17wo52cRYZdXl7fpDxz7e22ixsuGaZUrx39X
	 NTZ3j4u/QFiVQK40hPLLW4HsRaLPVPrgYyVhVdGz7yIRWKzyDCZpe6flbpfQ7YrQoM
	 irR6evy+2b5O0soQhLL/8V4Tk3acmDi6aEitfMmw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92D25F805C1; Sun,  7 Sep 2025 05:11:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5351F805CA;
	Sun,  7 Sep 2025 05:11:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 728B1F80548; Sun,  7 Sep 2025 05:10:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8041DF8016E
	for <alsa-devel@alsa-project.org>; Sun,  7 Sep 2025 05:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8041DF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ZLo/O4jd
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58739e2S3536759;
	Sat, 6 Sep 2025 22:09:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757214580;
	bh=aVtYjwlXvc25QceDbruUTnXsHgbr6cBj7xPff+gR/C0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=ZLo/O4jdg+6uk4LaF6HOTINarRJDGJCg1fz+reViivDeXLtE10RkhidAayykZLcmG
	 sh+rYtNB9OOJCbt99XpD4urseB9Wydbw4ulFhFeZIhzCdUb7qHSIhzTV56VjYoNvAo
	 26LXDNLMYdKNqLrNY7z5+MUpM4eiczbXqqaZkGWQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58739etg1438367
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 6 Sep 2025 22:09:40 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 6
 Sep 2025 22:09:39 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.055; Sat, 6 Sep 2025 22:09:39 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Gergo Koteles <soyer@irl.hu>
CC: "broonie@kernel.org" <broonie@kernel.org>,
        "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>,
        "13564923607@139.com" <13564923607@139.com>,
        "13916275206@139.com"
	<13916275206@139.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Xu, Baojun" <baojun.xu@ti.com>,
        "Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
        "tiwai@suse.de" <tiwai@suse.de>
Subject: RE: [EXTERNAL] Re: [PATCH v3] ALSA: hda/tas2781: Fix the order of
 TAS2781 calibrated-data
Thread-Topic: [EXTERNAL] Re: [PATCH v3] ALSA: hda/tas2781: Fix the order of
 TAS2781 calibrated-data
Thread-Index: AQHcHw9aTTgqeSqX90ukPkthKDtKZLSGZN8AgACle7A=
Date: Sun, 7 Sep 2025 03:09:39 +0000
Message-ID: <226517ecc65844c2ae5aab0b20614ebb@ti.com>
References: <20250906091923.1760-1-shenghao-ding@ti.com>
 <a102c7b1db0aaab8457032dde493a37b39a100db.camel@irl.hu>
In-Reply-To: <a102c7b1db0aaab8457032dde493a37b39a100db.camel@irl.hu>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.161.79]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: OIMK57X5L6AQWP5YNL5VK7OA7XQWRUNK
X-Message-ID-Hash: OIMK57X5L6AQWP5YNL5VK7OA7XQWRUNK
X-MailFrom: shenghao-ding@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OIMK57X5L6AQWP5YNL5VK7OA7XQWRUNK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VGhhbmtzIGZvciB5b3VyIGNvbW1lbnQsIEkgd2lsbCBwcmVwYXJlIGEgbmV3IHBhdGNoIHNvb24u
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VyZ28gS290ZWxlcyA8
c295ZXJAaXJsLmh1Pg0KPiBTZW50OiBTYXR1cmRheSwgU2VwdGVtYmVyIDYsIDIwMjUgODoxMyBQ
TQ0KPiBUbzogRGluZywgU2hlbmdoYW8gPHNoZW5naGFvLWRpbmdAdGkuY29tPjsgdGl3YWlAc3Vz
ZS5kZQ0KPiBDYzogYnJvb25pZUBrZXJuZWwub3JnOyBhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5p
bnRlbC5jb207DQo+IDEzNTY0OTIzNjA3QDEzOS5jb207IDEzOTE2Mjc1MjA2QDEzOS5jb207IGFs
c2EtZGV2ZWxAYWxzYS0NCj4gcHJvamVjdC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IFh1LCBCYW9qdW4gPGJhb2p1bi54dUB0aS5jb20+Ow0KPiBCYW9qdW4uWHVAZnB0LmNvbQ0K
PiBTdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBbUEFUQ0ggdjNdIEFMU0E6IGhkYS90YXMyNzgxOiBG
aXggdGhlIG9yZGVyIG9mDQo+IFRBUzI3ODEgY2FsaWJyYXRlZC1kYXRhDQo+IA0KPiBIaSBTaGVu
Z2hhbywgT24gU2F0LCAyMDI1LTA5LTA2IGF0IDE3OuKAijE5ICswODAwLCBTaGVuZ2hhbyBEaW5n
IHdyb3RlOiA+IEEgYnVnDQo+IHJlcG9ydGVkIGJ5IG9uZSBvZiBteSBjdXN0b21lcnMgdGhhdCB0
aGUgb3JkZXIgb2YgVEFTMjc4MSA+IGNhbGlicmF0ZWQtZGF0YSBpcw0KPiBpbmNvcnJlY3QsIHRo
ZSBjb3JyZWN0IHdheSBpcyB0byBtb3ZlIFIwX0xvdyA+IGFuZCBpbnNlcnQgaXQgYmV0d2VlbiBS
MCBhbmQNCj4gWmpRY21RUllGcGZwdEJhbm5lclN0YXJ0IFRoaXMgbWVzc2FnZSB3YXMgc2VudCBm
cm9tIG91dHNpZGUgb2YgVGV4YXMNCj4gSW5zdHJ1bWVudHMuDQo+IERvIG5vdCBjbGljayBsaW5r
cyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzb3VyY2Ugb2Yg
dGhpcw0KPiBlbWFpbCBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiA8aHR0cHM6Ly91
cy1waGlzaGFsYXJtLQ0KPiBld3QucHJvb2Zwb2ludC5jb20vRVdUL3YxL0czdkshdWxkZ1BUZVBQ
QTN4YWl6dWZObXA5a1N0ZEVRUzM2bGNBYzlRDQo+IHdyNDFqNk80aWVpZElWLTRiYTVPM2UyemRj
ZWVXXzg2SWtxVnVPREtNSjExWllxanQtDQo+IFk0UG5UVHRYNnVOUkozOGRMdVRWSSQ+DQo+IFJl
cG9ydCBTdXNwaWNpb3VzDQo+IA0KPiBaalFjbVFSWUZwZnB0QmFubmVyRW5kDQo+IEhpIFNoZW5n
aGFvLA0KPiANCj4gT24gU2F0LCAyMDI1LTA5LTA2IGF0IDE3OjE5ICswODAwLCBTaGVuZ2hhbyBE
aW5nIHdyb3RlOg0KPiA+IEEgYnVnIHJlcG9ydGVkIGJ5IG9uZSBvZiBteSBjdXN0b21lcnMgdGhh
dCB0aGUgb3JkZXIgb2YgVEFTMjc4MQ0KPiA+IGNhbGlicmF0ZWQtZGF0YSBpcyBpbmNvcnJlY3Qs
IHRoZSBjb3JyZWN0IHdheSBpcyB0byBtb3ZlIFIwX0xvdyBhbmQNCj4gPiBpbnNlcnQgaXQgYmV0
d2VlbiBSMCBhbmQgSW52UjAuDQo+ID4NCj4gPiBGaXhlczogNGZlMjM4NTEzNDA3ICgiQUxTQTog
aGRhL3RhczI3ODE6IE1vdmUgYW5kIHVuaWZpZWQgdGhlDQo+ID4gY2FsaWJyYXRlZC1kYXRhIGdl
dHRpbmcgZnVuY3Rpb24gZm9yIFNQSSBhbmQgSTJDIGludG8gdGhlIHRhczI3ODFfaGRhDQo+ID4g
bGliIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaGVuZ2hhbyBEaW5nIDxzaGVuZ2hhby1kaW5nQHRp
LmNvbT4NCj4gPg0KPiA+IC0tLQ0KPiA+IHYzOg0KPiA+ICAtIFRha2UgVGl3YWkncyBhZHZpY2Ug
b24gY2FsaV9jbnYoKSB0byBtYWtlIGl0IG1vcmUgc2ltcGxlci4NCj4gPiB2MjoNCj4gPiAgLSBT
dWJtaXQgdG8gdGhlwqBzb3VuZCBicmFuY2ggbWFpbnRhaW5lZCBieSBUaXdhaSBpbnN0ZWFkIG9m
IGxpbnV4LW5leHQNCj4gPiBicmFuY2gNCj4gPiAgLSBEcm9wIG90aGVyIGZpeA0KPiA+IC0tLQ0K
PiA+ICBzb3VuZC9oZGEvY29kZWNzL3NpZGUtY29kZWNzL3RhczI3ODFfaGRhLmMgfCAyNQ0KPiA+
ICsrKysrKysrKysrKysrKysrLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvc291bmQvaGRhL2Nv
ZGVjcy9zaWRlLWNvZGVjcy90YXMyNzgxX2hkYS5jDQo+ID4gYi9zb3VuZC9oZGEvY29kZWNzL3Np
ZGUtY29kZWNzL3RhczI3ODFfaGRhLmMNCj4gPiBpbmRleCBmNDZkMmUwNmM2NGYuLmY0YTQ0YzZi
MDIzNCAxMDA2NDQNCj4gPiAtLS0gYS9zb3VuZC9oZGEvY29kZWNzL3NpZGUtY29kZWNzL3RhczI3
ODFfaGRhLmMNCj4gPiArKysgYi9zb3VuZC9oZGEvY29kZWNzL3NpZGUtY29kZWNzL3RhczI3ODFf
aGRhLmMNCj4gPiBAQCAtMzMsNiArMzMsMjMgQEAgY29uc3QgZWZpX2d1aWRfdCB0YXNkZXZfZmN0
X2VmaV9ndWlkW10gPSB7ICB9Ow0KPiA+IEVYUE9SVF9TWU1CT0xfTlNfR1BMKHRhc2Rldl9mY3Rf
ZWZpX2d1aWQsDQo+ICJTTkRfSERBX1NDT0RFQ19UQVMyNzgxIik7DQo+ID4NCj4gPiArLyoNCj4g
PiArICogVGhlIG9yZGVyIG9mIGNhbGlicmF0ZWQtZGF0YSB3cml0aW5nIGZ1bmN0aW9uIGlzIGEg
Yml0IGRpZmZlcmVudA0KPiA+ICtmcm9tIHRoZQ0KPiA+ICsgKiBvcmRlciBpbiBVRUZJLiBIZXJl
IGlzIHRoZSBjb252ZXJzaW9uIHRvIG1hdGNoIHRoZSBvcmRlciBvZg0KPiA+ICtjYWxpYnJhdGVk
LWRhdGENCj4gPiArICogd3JpdGluZyBmdW5jdGlvbi4NCj4gPiArICovDQo+ID4gK3N0YXRpYyB2
b2lkIGNhbGlfY252KHVuc2lnbmVkIGNoYXIgKmRhdGEsIHVuc2lnbmVkIGludCBiYXNlLCBpbnQN
Cj4gPiArb2Zmc2V0KQ0KPiANCj4gdW51c2VkIGJhc2U/DQo+IA0KPiA+ICt7DQo+ID4gKwlzdHJ1
Y3QgY2FsaV9yZWcgcmVnX2RhdGE7DQo+ID4gKw0KPiA+ICsJbWVtY3B5KCZyZWdfZGF0YSwgZGF0
YSwgc2l6ZW9mKHJlZ19kYXRhKSk7DQo+IA0KPiBkYXRhIHBvaW50cyB0byBjYWxpX2RhdGE/DQpp
dCBzaG91bGQgYWRkIGJhc2UNCm1lbWNweSgmcmVnX2RhdGEsICZkYXRhW2Jhc2VdLCBzaXplb2Yo
cmVnX2RhdGEpKTsNCj4gDQo+ID4gKwkvKiB0aGUgZGF0YSBvcmRlciBoYXMgdG8gYmUgc3dhcHBl
ZCBiZXR3ZWVuIHIwX2xvd19yZWcgYW5kIGludjBfcmVnDQo+ICovDQo+ID4gKwlzd2FwKHJlZ19k
YXRhLnIwX2xvd19yZWcsIHJlZ19kYXRhLmludnIwX3JlZyk7DQo+ID4gKw0KPiA+ICsJY3B1X3Rv
X2JlMzJfYXJyYXkoKF9fZm9yY2UgX19iZTMyICopKGRhdGEgKyBvZmZzZXQgKyAxKSwNCj4gPiAr
CQkodTMyICopJnJlZ19kYXRhLCBUQVNERVZfQ0FMSUJfTik7DQo+ID4gK30NCj4gPiArDQo+ID4g
IHN0YXRpYyB2b2lkIHRhczI3ODFfYXBwbHlfY2FsaWIoc3RydWN0IHRhc2RldmljZV9wcml2ICpw
KSAgew0KPiA+ICAJc3RydWN0IGNhbGlkYXRhICpjYWxpX2RhdGEgPSAmcC0+Y2FsaV9kYXRhOyBA
QCAtMTAzLDggKzEyMCw3IEBADQo+ID4gc3RhdGljIHZvaWQgdGFzMjc4MV9hcHBseV9jYWxpYihz
dHJ1Y3QgdGFzZGV2aWNlX3ByaXYgKnApDQo+ID4NCj4gPiAgCQkJCWRhdGFbbF0gPSBrOw0KPiA+
ICAJCQkJb2Z0Kys7DQo+ID4gLQkJCQlmb3IgKGkgPSAwOyBpIDwgVEFTREVWX0NBTElCX04gKiA0
OyBpKyspDQo+ID4gLQkJCQkJZGF0YVtsICsgaSArIDFdID0gZGF0YVs0ICogb2Z0ICsgaV07DQo+
ID4gKwkJCQljYWxpX2NudihkYXRhLCA0ICogb2Z0LCBsKTsNCj4gPiAgCQkJCWsrKzsNCj4gPiAg
CQkJfQ0KPiA+ICAJCX0NCj4gPiBAQCAtMTMwLDkgKzE0Niw4IEBAIHN0YXRpYyB2b2lkIHRhczI3
ODFfYXBwbHlfY2FsaWIoc3RydWN0DQo+ID4gdGFzZGV2aWNlX3ByaXYgKnApDQo+ID4NCj4gPiAg
CQlmb3IgKGogPSBwLT5uZGV2IC0gMTsgaiA+PSAwOyBqLS0pIHsNCj4gPiAgCQkJbCA9IGogKiAo
Y2FsaV9kYXRhLT5jYWxpX2RhdF9zel9wZXJfZGV2ICsgMSk7DQo+ID4gLQkJCWZvciAoaSA9IFRB
U0RFVl9DQUxJQl9OICogNDsgaSA+IDAgOyBpLS0pDQo+ID4gLQkJCQlkYXRhW2wgKyBpXSA9IGRh
dGFbcC0+aW5kZXggKiA1ICsgaV07DQo+ID4gLQkJCWRhdGFbbCtpXSA9IGo7DQo+ID4gKwkJCWNh
bGlfY252KGRhdGEsIGNhbGlfZGF0YS0+Y2FsaV9kYXRfc3pfcGVyX2RldiAqIGosIGwpOw0KPiA+
ICsJCQlkYXRhW2xdID0gajsNCj4gPiAgCQl9DQo+ID4gIAl9DQo+ID4NCj4gDQo+IEdlcmdvDQo=
