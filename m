Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A048BB15FD2
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Jul 2025 13:51:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1EAC6024F;
	Wed, 30 Jul 2025 13:51:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1EAC6024F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753876279;
	bh=gorbOLRxJT0JdIMGPDRSTq3Ywcr3uu/Euag8Tbd4C2k=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=nZOX92mS6DQEPiiKbsGgoti5/edgVcjLvNwWebwoC7UmA4ba68i//DGHHwDnzmZWm
	 O027Iw05dj82/yjQm7UIY7LYRcX/n21OOqE3qn8CE5ucNP75XKmwehEK/FG1hamzv/
	 f4Cw26mv1IpunXSEwSssy4TKk7TTT0xs5Wg1fK00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 459BAF80254; Wed, 30 Jul 2025 13:51:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FBF9F805D6;
	Wed, 30 Jul 2025 13:51:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06F0AF8026A; Mon, 28 Jul 2025 12:22:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AFE7EF8011B
	for <alsa-devel@alsa-project.org>; Mon, 28 Jul 2025 12:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFE7EF8011B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=G/Yk4QfI
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56SAML7s2707653;
	Mon, 28 Jul 2025 05:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753698141;
	bh=gorbOLRxJT0JdIMGPDRSTq3Ywcr3uu/Euag8Tbd4C2k=;
	h=From:To:CC:Subject:Date;
	b=G/Yk4QfIpbL6qJO59zWLztuoM2PbManCyPA85XlE0u4XGWnGRDDPNc9krvZDUu9NI
	 1e7RsW2XMfthLuiFVE1T0XDCj3Tn6oZSeVSaoieG9tb2b+0w6+HAQU+RhvFpFhwC1O
	 tRK7mAsGpXpg1/z62BYChW+mDdu1+pDRdgkMNs7E=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56SAMKvq1621296
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 28 Jul 2025 05:22:20 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 28
 Jul 2025 05:22:19 -0500
Received: from DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6]) by
 DLEE107.ent.ti.com ([fe80::1c91:43d:d71:d7b6%17]) with mapi id
 15.01.2507.055; Mon, 28 Jul 2025 05:22:19 -0500
From: "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "broonie@kernel.org" <broonie@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>,
        "tiwai@suse.de" <tiwai@suse.de>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "Xu, Baojun" <baojun.xu@ti.com>,
        "Ding,
 Shenghao" <shenghao-ding@ti.com>,
        "liam.r.girdwood@intel.com"
	<liam.r.girdwood@intel.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "Navada Kanyana, Mukund" <navada@ti.com>,
        "Hampiholi, Vallabha" <v-hampiholi@ti.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: sound: bindings for tac5x1x family of
 codecs
Thread-Topic: [PATCH v3 2/4] dt-bindings: sound: bindings for tac5x1x family
 of codecs
Thread-Index: Adv/pqCHhQ7Z5pboSlmxx2N4LsHPtw==
Date: Mon, 28 Jul 2025 10:22:18 +0000
Message-ID: <a5c23c7928da403fafe24c1de0fc6412@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.82.30.14]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: C3RCTMXBZHUFXSQBSTHSB4RVBUJFGA37
X-Message-ID-Hash: C3RCTMXBZHUFXSQBSTHSB4RVBUJFGA37
X-Mailman-Approved-At: Wed, 30 Jul 2025 11:50:25 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C3RCTMXBZHUFXSQBSTHSB4RVBUJFGA37/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSBkZXRhaWxlZCByZXZpZXcgY29tbWVudHMu
IA0KUmVxdWVzdCB5b3UgdG8gdGFrZSBhIGxvb2sgYXQgY29tbWVudHMgYmVsb3cuIA0KDQpPbiBG
cmksIEp1biAyNywgMjAyNSBhdCAxOjE4IFBNICswNTMwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiBUaHUsIEp1biAyNiwgMjAyNSBhdCAxMTo0MzozMVBNICswNTMwLCBOaXJhbmph
biBIIFkgd3JvdGU6DQo+ID4gKyAgdGksdnJlZjoNCj4gPiArICAgIGRlc2NyaXB0aW9uOiBWUkVG
IHJlcXVpcmVkIHZvbHRhZ2UuIElmIG5vZGUgaXMgb21pdHRlZCB0aGVuIFZSRUYgaXMNCj4gVm9s
dGFnZSBpcyBpbiBtaWNyb3ZvbHQuIFVzZSBwcm9wZXIgc3VmZml4L3ZhbHVlcy4NCklzIHRoaXMg
Y29udmVudGlvbiA/IElzIHRoZXJlIGFueSBkb2N1bWVudCBvbiB0aGVzZSBJIGNhbiByZWZlciA/
DQo+IA0KPiA+ICsgICAgb25lT2Y6DQo+ID4gKyAgICAgIC0gY29uc3Q6IDANCj4gPiArICAgICAg
ICBkZXNjcmlwdGlvbjogVlJFRiBvdXRwdXQgaXMgcG93ZXJlZCB0byAyLjc1Vi4NCj4gPiArICAg
ICAgLSBjb25zdDogMQ0KPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBWUkVGIG91dHB1dCBpcyBw
b3dlcmVkIHRvIDIuNVYuDQo+ID4gKyAgICAgIC0gY29uc3Q6IDINCj4gPiArICAgICAgICBkZXNj
cmlwdGlvbjogVlJFRiBvdXRwdXQgaXMgcG93ZXJlZCB0byAxLjM3NVYuDQoNCj4gPiArICB0aSxn
cGlvcy1mdW5jOg0KPiA+ICsgICAgZGVzY3JpcHRpb246IHwNCj4gPiArICAgICAgQXJyYXkgaW5k
aWNhdGluZyB0aGUgR1BJTzEsIEdQSU8yLCBHUE8xIEZ1bmN0aW9uYWxpdHkgaW4gdGhlIHNhbWUg
b3JkZXIuDQo+ID4gKyAgICAgIEVhY2ggaW50ZWdlciBlbGVtbmVudCBpbiB0aGUgYXJyYXkgcmVw
cmVzZW50IHRoZSBmb2xsb3dpbmcNCj4gPiArICAgICAgLSAwICBUQUM1WDFYX0dQSU9fRElTQUJM
RSAgICAgICAgLSBHUElPIGlzIERpc2FibGVkDQo+ID4gKyAgICAgIC0gMSAgVEFDNVgxWF9HUElP
X0dQSSAgICAgICAgICAgIC0gR2VuZXJhbCBQdXJwb3NlIElucHV0DQo+ID4gKyAgICAgIC0gMiAg
QURDM1hYWF9HUElPX0dQTyAgICAgICAgICAgIC0gR2VuZXJhbCBQdXJwb3NlIE91dHB1dA0KPiA+
ICsgICAgICAtIDMgIFRBQzVYMVhfR1BJT19JUlEgICAgICAgICAgICAtIENoaXAgSW50ZXJydXB0
DQo+ID4gKyAgICAgIC0gNCAgVEFDNVgxWF9HUElPX1BETUNMSyAgICAgICAgIC0gUERNIENMSyBP
dXRwdXQNCj4gPiArICAgICAgLSA1ICBUQUM1WDFYX0dQSU9fUF9ET1VUICAgICAgICAgLSBQcmlt
YXJ5IEFTSSBET1VUDQo+ID4gKyAgICAgIC0gNiAgVEFDNVgxWF9HUElPX1BfRE9VVDIgICAgICAg
IC0gUHJpbWFyeSBBU0kgRE9VVDINCj4gPiArICAgICAgLSA3ICBUQUM1WDFYX0dQSU9fU19ET1VU
ICAgICAgICAgLSBTZWNvbmRhcnkgQVNJIERPVVQNCj4gPiArICAgICAgLSA4ICBUQUM1WDFYX0dQ
SU9fU19ET1VUMiAgICAgICAgLSBTZWNvbmRhcnkgQVNJIERPVVQyDQo+ID4gKyAgICAgIC0gOSAg
VEFDNVgxWF9HUElPX1NfQkNMSyAgICAgICAgIC0gU2Vjb25kYXJ5IEJDTEsgT3V0cHV0DQo+ID4g
KyAgICAgIC0gMTAgVEFDNVgxWF9HUElPX1NfRlNZTkMgICAgICAgLSBTZWNvbmRhcnkgRlNZTkMg
T3V0cHV0DQo+ID4gKyAgICAgIC0gMTEgVEFDNVgxWF9HUElPX0NMS09VVCAgICAgICAgLSBHZW5l
cmFsIFB1cnBvc2UgT3V0cHV0DQo+ID4gKyAgICAgIC0gMTIgVEFDNVgxWF9HUElPX0RPVVRfTVVY
DQo+ID4gKyAgICAgIC0gMTMgVEFDNVgxWF9HUElPX0RBSVNZX09VVA0KPiA+ICsgICAgJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLWFycmF5DQo+ID4gKyAgICBt
aW5JdGVtczogMw0KPiA+ICsgICAgbWF4SXRlbXM6IDMNCj4gDQo+IERvbid0IGVuY29kZSBncGlv
cyBhbmQgcGlucyBhcyBzb21lIGN1c3RvbSBwcm9wZXJ0aWVzLg0KQ291bGQgeW91IHBsZWFzZSBz
dWdnZXN0IHdoYXQgaXMgdGhlIGFsdGVybmF0aXZlLg0KUGxlYXNlIHN1Z2dlc3Qgc29tZSBleGFt
cGxlIHdoaWNoIEkgY2FuIHJlZmVyID8gDQoNClJlZ2FyZHMNCk5pcmFuamFuDQoNCg==
