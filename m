Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D214B42C85
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Sep 2025 00:08:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAAEF601F8;
	Thu,  4 Sep 2025 00:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAAEF601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756937302;
	bh=col8Y7Eem9lM+HE0Ipmc8MDoWyA6faG97Wn640ziFi4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vgHZM7NJnliBwAFtg/xKjBbqFcXbi3kboXY8GUaf8vSkdJws4S1ojiCgdhmY6CCtS
	 IV/QILv0XVbPfzi9kGy/UPPh7BZQbZXYzw16LUEbSDGt8ic14la61HHlK88Y9MsPt2
	 Dez4PQZ7PMbPRvTWDig6FdBmBk2JdtlNU2ojy5Ho=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6151BF805D3; Thu,  4 Sep 2025 00:07:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A301AF805C1;
	Thu,  4 Sep 2025 00:07:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DB32F804B0; Thu,  4 Sep 2025 00:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36A40F800B0
	for <alsa-devel@alsa-project.org>; Thu,  4 Sep 2025 00:06:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36A40F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=dfioB0GM
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 583M6pVE2930104;
	Wed, 3 Sep 2025 17:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756937211;
	bh=col8Y7Eem9lM+HE0Ipmc8MDoWyA6faG97Wn640ziFi4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=dfioB0GMQESOdByUWXjjzQqJmKpACXoBwvQHYek/MFGuDZQu9JZelDV3Xcn1iSQfz
	 vVDciG9yFaPyn5ejGOQGjsIKlxLDCGQtIBYw+X+/CdnEI8WdezD72DQSXeG3x/+Cnv
	 /b78jKLXZDSWSBozNz/rTa4bWleLHmoXxmilOiPw=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 583M6oaj3837597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 17:06:50 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 17:06:50 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.055; Wed, 3 Sep 2025 17:06:50 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Takashi Iwai <tiwai@suse.de>
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
        "Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>
Subject: RE: [EXTERNAL] Re: [PATCH v2] ALSA: hda/tas2781: Fix the order of
 TAS2781 calibrated-data
Thread-Topic: [EXTERNAL] Re: [PATCH v2] ALSA: hda/tas2781: Fix the order of
 TAS2781 calibrated-data
Thread-Index: AQHcHIktAJvNMNT5vE+BhvDY5ZGSArSBgAoAgACC1lA=
Date: Wed, 3 Sep 2025 22:06:50 +0000
Message-ID: <d032c064b5324641b19b3c0b31dcd2e2@ti.com>
References: <20250903041351.143-1-shenghao-ding@ti.com>
 <875xdzx5nn.wl-tiwai@suse.de>
In-Reply-To: <875xdzx5nn.wl-tiwai@suse.de>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.161.79]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: SRJV2AFMWKQZGOYUVHBLZHRV77MPWUGR
X-Message-ID-Hash: SRJV2AFMWKQZGOYUVHBLZHRV77MPWUGR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SRJV2AFMWKQZGOYUVHBLZHRV77MPWUGR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQpUaGFua3MgZm9ywqB5b3VyIHJlZiBjb2RlDQo+ID4gKy8qDQo+ID4gKyAqIFRoZSBvcmRlciBv
ZiBjYWxpYnJhdGVkLWRhdGEgd3JpdGluZyBpcyBhIGJpdCBkaWZmZXJlbnQgZnJvbSB0aGUNCj4g
PiArb3JkZXINCj4gPiArICogaW4gVUVGSS4gSGVyZSBpcyB0aGUgY29udmVyc2lvbiB0byBtYXRj
aCB0aGUgb3JkZXIgb2YNCj4gPiArY2FsaWJyYXRlZC1kYXRhDQo+ID4gKyAqIHdyaXRpbmcuDQo+
ID4gKyAqLw0KPiA+ICtzdGF0aWMgdm9pZCBjYWxpX2Nudih1bnNpZ25lZCBjaGFyICpkYXRhLCB1
bnNpZ25lZCBpbnQgYmFzZSwgaW50DQo+ID4gK29mZnNldCkgew0KPiA+ICsJX19iZTMyIGJlZGF0
YVtUQVNERVZfQ0FMSUJfTl07DQo+ID4gKwlpbnQgaTsNCj4gPiArDQo+ID4gKwkvKiByMF9yZWcg
Ki8NCj4gPiArCWJlZGF0YVswXSA9IGNwdV90b19iZTMyKCoodWludDMyX3QgKikmZGF0YVtiYXNl
XSk7DQo+ID4gKwkvKiByMF9sb3dfcmVnICovDQo+ID4gKwliZWRhdGFbMV0gPSBjcHVfdG9fYmUz
MigqKHVpbnQzMl90ICopJmRhdGFbYmFzZSArIDhdKTsNCj4gPiArCS8qIGludnIwX3JlZyAqLw0K
PiA+ICsJYmVkYXRhWzJdID0gY3B1X3RvX2JlMzIoKih1aW50MzJfdCAqKSZkYXRhW2Jhc2UgKyA0
XSk7DQo+ID4gKwkvKiBwb3dfcmVnICovDQo+ID4gKwliZWRhdGFbM10gPSBjcHVfdG9fYmUzMigq
KHVpbnQzMl90ICopJmRhdGFbYmFzZSArIDEyXSk7DQo+ID4gKwkvKiB0bGltaXRfcmVnICovDQo+
ID4gKwliZWRhdGFbNF0gPSBjcHVfdG9fYmUzMigqKHVpbnQzMl90ICopJmRhdGFbYmFzZSArIDE2
XSk7DQo+ID4gKw0KPiA+ICsJZm9yIChpID0gMDsgaSA8IFRBU0RFVl9DQUxJQl9OOyBpKyspDQo+
ID4gKwkJbWVtY3B5KCZkYXRhW29mZnNldCArIGkgKiA0ICsgMV0sICZiZWRhdGFbaV0sDQo+ID4g
KwkJCXNpemVvZihiZWRhdGFbaV0pKTsNCj4gPiArfQ0KPiANCj4gSU1PLCB0aGlzIGNhbiBiZSBt
b3JlIHJlYWRhYmxlIHdoZW4geW91IHVzZSBzdHJ1Y3QgY2FsaWRhdGEsIGUuZy4NCj4gDQo+IHN0
YXRpYyB2b2lkIGNhbGlfY252KHVuc2lnbmVkIGNoYXIgKmRhdGEsIHVuc2lnbmVkIGludCBiYXNl
LCBpbnQgb2Zmc2V0KSB7DQo+IAlzdHJ1Y3QgY2FsaWRhdGEgcmVnOw0KPiANCj4gCXJlZy5yMF9y
ZWcgPSAqKHUzMiAqKSZkYXRhW2Jhc2VdDQo+IAlyZWcucjBfbG93X3JlZyA9ICoodTMyICopJmRh
dGFbYmFzZSArIDhdDQo+IAlyZWcuaW52cjBfcmVnID0gKih1MzIgKikmZGF0YVtiYXNlICsgNF0N
Cj4gCXJlZy5wb3dfcmVnID0gKih1MzIgKikmZGF0YVtiYXNlICsgMTJdOw0KPiAJcmVnLnRsaW1p
dF9yZWcgPSAqKHUzMiAqKSZkYXRhW2Jhc2UgKyAxNl0pOw0KPiANCj4gCWNwdV90b19iZTMyX2Fy
cmF5KChfX2ZvcmNlIF9fYmUzMiAqKShkYXRhICsgb2Zmc2V0ICsgMSksICZyZWcsDQo+IAkJCSAg
VEFTREVWX0NBTElCX04pOw0KPiB9DQo+IA0KPiAuLi4gb3IgZXZlbiBzaW1wbGVyIGxpa2U6DQo+
IA0KPiBzdGF0aWMgdm9pZCBjYWxpX2Nudih1bnNpZ25lZCBjaGFyICpkYXRhLCB1bnNpZ25lZCBp
bnQgYmFzZSwgaW50IG9mZnNldCkgew0KPiAJc3RydWN0IGNhbGlkYXRhIHJlZzsNCj4gDQo+IAlt
ZW1jcHkoJnJlZywgZGF0YSwgc2l6ZW9mKHJlZykpOw0KPiAJLyogdGhlIGRhdGEgb3JkZXIgaGFz
IHRvIGJlIHN3YXBwZWQgYmV0d2VlbiByMF9sb3dfcmVnIGFuZCBpbnYwX3JlZw0KPiAqLw0KPiAJ
c3dhcChyZWcucjBfbG93X3JlZywgcmVnLmludnIwX3JlZyk7DQo+IA0KPiAJY3B1X3RvX2JlMzJf
YXJyYXkoKF9fZm9yY2UgX19iZTMyICopKGRhdGEgKyBvZmZzZXQgKyAxKSwgJnJlZywNCj4gCQkJ
ICBUQVNERVZfQ0FMSUJfTik7DQo+IH0NCkkgbGlrZSB0aGlzIGNvZGUgc28gbXVjaC4gSXQncyBl
bGVnYW50IHNpbXBsaWNpdHkuDQoNClRoYW5rcywNClNoZW5naGFvIERpbmcNCg==
