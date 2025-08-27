Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B148B384B8
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Aug 2025 16:17:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EC946029B;
	Wed, 27 Aug 2025 16:16:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EC946029B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756304219;
	bh=C9EcVdbRtohDPBUdmtofgnEaVriqBKDSdG6iuU5Uz6c=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b2HcXf9VBhtGNN9k0oZufg5eOGYPcFb6sLRIUc9HCjoe7SgnfdFXG+f65uFWEbSKx
	 ZpEYsNhqPZGroRndWt6DK3m5TbmcF0XV5KcwZbRMNlMzCHHX+kUPo7KuC1XPii7Xw1
	 UwrFm4XoEiEPIpi8PtB5nmBlIdYn97km7C8UomGw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8F0EF805C0; Wed, 27 Aug 2025 16:16:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1175DF80495;
	Wed, 27 Aug 2025 16:16:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA1E7F80495; Wed, 27 Aug 2025 16:16:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B1BBF80153
	for <alsa-devel@alsa-project.org>; Wed, 27 Aug 2025 16:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B1BBF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=abY+ko7+
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57REFqJq1296261;
	Wed, 27 Aug 2025 09:15:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756304152;
	bh=C9EcVdbRtohDPBUdmtofgnEaVriqBKDSdG6iuU5Uz6c=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=abY+ko7+fCgauFDy+RDVkT2U2UnENSYjRY74kuxcoVmxyRVG0xl7ao7x3h3Cj+iet
	 tbcu0KXCshJVdqJFAc8wb9+USc9CGwQLp7An6v3O7GXS28VeHq1zxP9QVckho4DTjS
	 LGfQvm5XowjHrs3lAzNR23d74ieBvz75EmJ4nbT4=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57REFq4j2758029
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 27 Aug 2025 09:15:52 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 27
 Aug 2025 09:15:51 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.055; Wed, 27 Aug 2025 09:15:51 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Gergo Koteles <soyer@irl.hu>, "tiwai@suse.de" <tiwai@suse.de>
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
        "Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>, "Ji, Jesse" <jesse-ji@ti.com>
Subject: RE: [EXTERNAL] Re: [PATCH v2] ALSA: hda/tas2781: Fix EFI name for
 calibration beginning with 1 instead of 0
Thread-Topic: [EXTERNAL] Re: [PATCH v2] ALSA: hda/tas2781: Fix EFI name for
 calibration beginning with 1 instead of 0
Thread-Index: AQHcFm2Qg1IXiOB8z0+fE/8Y+/X2AbR2DGCAgABxWjA=
Date: Wed, 27 Aug 2025 14:15:51 +0000
Message-ID: <3917a54f72134949a4baadd706463fa7@ti.com>
References: <20250826094105.1325-1-shenghao-ding@ti.com>
 <8187d109eb70f6d459df63f3507a0be79efd9aa9.camel@irl.hu>
In-Reply-To: <8187d109eb70f6d459df63f3507a0be79efd9aa9.camel@irl.hu>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.161.79]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: XDZUCBASQUBKALRWYY5OAQDMYSZNHE6M
X-Message-ID-Hash: XDZUCBASQUBKALRWYY5OAQDMYSZNHE6M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XDZUCBASQUBKALRWYY5OAQDMYSZNHE6M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgR0sNCkxvbmcgdGltZSBubyBzZWUuIFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhhdMKgb3V0Lg0K
SSdtIHByZXBhcmluZyBhIG5ldyBwYXRjaCB0byBjb3JyZWN0IGl0Lg0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEdlcmdvIEtvdGVsZXMgPHNveWVyQGlybC5odT4NCj4g
U2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMjcsIDIwMjUgOTozNCBBTQ0KPiBUbzogRGluZywgU2hl
bmdoYW8gPHNoZW5naGFvLWRpbmdAdGkuY29tPjsgdGl3YWlAc3VzZS5kZQ0KPiBDYzogYnJvb25p
ZUBrZXJuZWwub3JnOyBhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb207DQo+IDEzNTY0
OTIzNjA3QDEzOS5jb207IDEzOTE2Mjc1MjA2QDEzOS5jb207IGFsc2EtZGV2ZWxAYWxzYS0NCj4g
cHJvamVjdC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IFh1LCBCYW9qdW4gPGJh
b2p1bi54dUB0aS5jb20+Ow0KPiBCYW9qdW4uWHVAZnB0LmNvbTsgSmksIEplc3NlIDxqZXNzZS1q
aUB0aS5jb20+DQo+IFN1YmplY3Q6IFtFWFRFUk5BTF0gUmU6IFtQQVRDSCB2Ml0gQUxTQTogaGRh
L3RhczI3ODE6IEZpeCBFRkkgbmFtZSBmb3INCj4gY2FsaWJyYXRpb24gYmVnaW5uaW5nIHdpdGgg
MSBpbnN0ZWFkIG9mIDANCj4gDQo+IEhpIFNoZW5naGFvLCBPbiBUdWUsIDIwMjUtMDgtMjYgYXQg
MTc64oCKNDEgKzA4MDAsIFNoZW5naGFvIERpbmcgd3JvdGU6ID4gQQ0KPiBidWcgcmVwb3J0ZWQg
Ynkgb25lIG9mIG15IGN1c3RvbWVycyB0aGF0IEVGSSBuYW1lIGJlZ2lubmluZyB3aXRoIDAgPiBp
bnN0ZWFkDQo+IG9mIDEuID4gPiBGaXhlczogNGZlMjM4NTEzNDA3ICgiQUxTQTogaGRhL3RhczI3
ODE6IE1vdmUgYW5kIHVuaWZpZWQgdGhlDQo+IGNhbGlicmF0ZWQtZGF0YSBaalFjbVFSWUZwZnB0
QmFubmVyU3RhcnQgVGhpcyBtZXNzYWdlIHdhcyBzZW50IGZyb20NCj4gb3V0c2lkZSBvZiBUZXhh
cyBJbnN0cnVtZW50cy4NCj4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMg
dW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNvdXJjZSBvZiB0aGlzDQo+IGVtYWlsIGFuZCBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IDxodHRwczovL3VzLXBoaXNoYWxhcm0tDQo+IGV3dC5w
cm9vZnBvaW50LmNvbS9FV1QvdjEvRzN2SyF1bGRySFRhUG5PMDdLeXpPZkRPSkhNSEdpcGNqWTJS
RU1RDQo+IHRnMnNxNkVzck5xbzNCdnh3SzdISzFQYTZJb0VxcDBBc1h5X2FtT3FHSUY3eEl1ZkN4
YVpmUDViNFc1TVlJd1YNCj4geG9ueWRPS0pBJD4NCj4gUmVwb3J0IFN1c3BpY2lvdXMNCj4gDQo+
IFpqUWNtUVJZRnBmcHRCYW5uZXJFbmQNCj4gSGkgU2hlbmdoYW8sDQo+IA0KPiBPbiBUdWUsIDIw
MjUtMDgtMjYgYXQgMTc6NDEgKzA4MDAsIFNoZW5naGFvIERpbmcgd3JvdGU6DQo+ID4gQSBidWcg
cmVwb3J0ZWQgYnkgb25lIG9mIG15IGN1c3RvbWVycyB0aGF0IEVGSSBuYW1lIGJlZ2lubmluZyB3
aXRoIDANCj4gPiBpbnN0ZWFkIG9mIDEuDQo+ID4NCj4gPiBGaXhlczogNGZlMjM4NTEzNDA3ICgi
QUxTQTogaGRhL3RhczI3ODE6IE1vdmUgYW5kIHVuaWZpZWQgdGhlDQo+ID4gY2FsaWJyYXRlZC1k
YXRhIGdldHRpbmcgZnVuY3Rpb24gZm9yIFNQSSBhbmQgSTJDIGludG8gdGhlIHRhczI3ODFfaGRh
DQo+ID4gbGliIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaGVuZ2hhbyBEaW5nIDxzaGVuZ2hhby1k
aW5nQHRpLmNvbT4NCj4gPg0KPiA+IC0tLQ0KPiA+IHYyOg0KPiA+ICAtIHJlbW92ZSB1bnJlbGF0
ZWQgY2hhbmdlDQo+ID4gdjE6DQo+ID4gIC0gRml4IEVGSSBuYW1lIGJlZ2lubmluZyB3aXRoIDEg
aW5zdGVhZCBvZiAwDQo+ID4gIC0gQWRkIGV4dHJhIGNvbW1lbnRzIG9uIEVGSSBuYW1lIGZvciBj
YWxpYnJhdGlvbg0KPiA+ICAtIFJlbW92ZSBhbiBleHRyYSBzcGFjZQ0KPiA+IC0tLQ0KPiA+ICBz
b3VuZC9oZGEvY29kZWNzL3NpZGUtY29kZWNzL3RhczI3ODFfaGRhX2kyYy5jIHwgNSArKystLQ0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL3NvdW5kL2hkYS9jb2RlY3Mvc2lkZS1jb2RlY3MvdGFzMjc4MV9o
ZGFfaTJjLmMNCj4gPiBiL3NvdW5kL2hkYS9jb2RlY3Mvc2lkZS1jb2RlY3MvdGFzMjc4MV9oZGFf
aTJjLmMNCj4gPiBpbmRleCBlZDc3NzFhYjk0NzUuLjYzNWNiZDg4MjBhYyAxMDA2NDQNCj4gPiAt
LS0gYS9zb3VuZC9oZGEvY29kZWNzL3NpZGUtY29kZWNzL3RhczI3ODFfaGRhX2kyYy5jDQo+ID4g
KysrIGIvc291bmQvaGRhL2NvZGVjcy9zaWRlLWNvZGVjcy90YXMyNzgxX2hkYV9pMmMuYw0KPiA+
IEBAIC0zNDAsNyArMzQwLDggQEAgc3RhdGljIGludCB0YXMyNTYzX3NhdmVfY2FsaWJyYXRpb24o
c3RydWN0DQo+IHRhczI3ODFfaGRhICpoKQ0KPiA+ICAJCWRhdGFbb2Zmc2V0XSA9IGk7DQo+ID4g
IAkJb2Zmc2V0Kys7DQo+ID4gIAkJZm9yIChqID0gMDsgaiA8IFRBU0RFVl9DQUxJQl9OOyArK2op
IHsNCj4gPiAtCQkJcmV0ID0gc25wcmludGYodmFyOCwgc2l6ZW9mKHZhcjgpLCB2YXJzW2pdLCBp
KTsNCj4gPiArCQkJLyogRUZJIG5hbWUgZm9yIGNhbGlicmF0aW9uIHN0YXJ0ZWQgd2l0aCAxLCBu
b3QgMCAqLw0KPiA+ICsJCQlyZXQgPSBzbnByaW50Zih2YXI4LCBzaXplb2YodmFyOCksIHZhcnNb
al0sIGkgKyAxKTsNCj4gPg0KPiA+ICAJCQlpZiAocmV0IDwgMCB8fCByZXQgPj0gc2l6ZW9mKHZh
cjgpIC0gMSkgew0KPiA+ICAJCQkJZGV2X2VycihwLT5kZXYsICIlczogUmVhZCAlcyBmYWlsZWRc
biIsIEBAIC0NCj4gMzQ5LDcgKzM1MCw3IEBADQo+ID4gc3RhdGljIGludCB0YXMyNTYzX3NhdmVf
Y2FsaWJyYXRpb24oc3RydWN0IHRhczI3ODFfaGRhICpoKQ0KPiA+ICAJCQl9DQo+ID4gIAkJCS8q
DQo+ID4gIAkJCSAqIE91ciB2YXJpYWJsZSBuYW1lcyBhcmUgQVNDSUkgYnkgY29uc3RydWN0aW9u
LCBidXQNCj4gPiAtCQkJICogRUZJIG5hbWVzIGFyZSB3aWRlIGNoYXJzLiAgQ29udmVydCBhbmQg
emVyby1wYWQuDQo+ID4gKwkJCSAqIEVGSSBuYW1lcyBhcmUgd2lkZSBjaGFycy4gQ29udmVydCBh
bmQgemVyby1wYWQuDQo+ID4gIAkJCSAqLw0KPiA+ICAJCQltZW1zZXQoZWZpX25hbWUsIDAsIHNp
emVvZihlZmlfbmFtZSkpOw0KPiA+ICAJCQlmb3IgKGsgPSAwOyBrIDwgc2l6ZW9mKHZhcjgpICYm
IHZhcjhba107IGsrKykNCj4gDQo+IEluIHRoZSB0YXMyNTYzX3NhdmVfY2FsaWJyYXRpb24oKSBm
dW5jdGlvbiB0aGUgdmFyaWFibGVzIGFyZSByZWFkIGluIHRoZQ0KPiBmb2xsb3dpbmcgb3JkZXI6
IFIwLCBJbnZSMCwgUjBfTG93LCBQb3dlciwgVExpbS4NCj4gVGhleSBhcmUgYWxzbyBpbmNsdWRl
ZCBpbiBjYWxpX2RhdGEgaW4gdGhpcyBvcmRlci4NCj4gDQo+IEJ1dCB0aGUgdGFzZGV2X2xvYWRf
Y2FsaWJyYXRlZF9kYXRhKCkgZnVuY3Rpb24gcmVhZHMgdGhlbSBmcm9tIGNhbGlfZGF0YSBhcw0K
PiBSMCwgUjBfTG93LCBJbnZSMCwgUG93ZXIsIFRMaW0uDQo+IA0KPiBBbmQgdGhpcyBtYXkgYmUg
dHJ1ZSBmb3IgdGFzMjc4MSBhcyB3ZWxsLg0KDQoNCj4gDQo+IENvdWxkIHlvdSBjaGVjayB0aGlz
IGFsc28/DQo+IA0KPiBUaGFua3MsDQo+IEdlcmdvDQo=
