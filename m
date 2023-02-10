Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D3D69178D
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 05:20:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06F5A851;
	Fri, 10 Feb 2023 05:19:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06F5A851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676002819;
	bh=WK7HnZO9QkjIOf4psu/8BcaSP+VtLkhKLWQ6i+xVxqo=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lFRR95/T9Bk5q08fQ42jtnP+pTGczxjEf3EGMJw73DAld5Nrc3siyk5oL1tDet40j
	 LHmmsvdZVkvlF6gCdzvG9X0akqbXYIMLFB2nffoFrRgR2VRQdiM1Gl2g0S2gh9wVlX
	 Y4Mx0j/sTuFrSR/0j4CMybX0CLWMCD9yQ8e8bb1U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31130F80269;
	Fri, 10 Feb 2023 05:18:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EF89AF800E4; Fri, 10 Feb 2023 05:18:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7E70F80086
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 05:18:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7E70F80086
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 31A4IJZ50030170,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 31A4IJZ50030170
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 10 Feb 2023 12:18:19 +0800
Received: from RTEXMBS03.realtek.com.tw (172.21.6.96) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 10 Feb 2023 12:18:19 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS03.realtek.com.tw (172.21.6.96) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 10 Feb 2023 12:18:18 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::98d2:65f8:dcdf:fa31]) by
 RTEXMBS01.realtek.com.tw ([fe80::98d2:65f8:dcdf:fa31%5]) with mapi id
 15.01.2375.007; Fri, 10 Feb 2023 12:18:18 +0800
From: =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH] ASoC: rt712-sdca: Add RT712 SDCA driver for Jack and Amp
 topology
Thread-Topic: [PATCH] ASoC: rt712-sdca: Add RT712 SDCA driver for Jack and Amp
 topology
Thread-Index: AQHZOtPwW/rkhLECmUWrzmB7N0Gtf67GOEGAgAFL6aA=
Date: Fri, 10 Feb 2023 04:18:18 +0000
Message-ID: <094358791c36467c8bd57210ba6733dc@realtek.com>
References: <20230207090946.20659-1-shumingf@realtek.com>
 <Y+UPL4nK7yZ2pWgP@sirena.org.uk>
In-Reply-To: <Y+UPL4nK7yZ2pWgP@sirena.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.209]
x-kse-serverinfo: RTEXMBS03.realtek.com.tw, 9
x-kse-attachmentfiltering-interceptor-info: no applicable attachment filtering
 rules found
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: 
 =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIzLzIvMTAgpFekyCAwMjoxNzowMA==?=
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
Message-ID-Hash: 2AUKEJQFPPF5IESFIDODRKTNS6UFBZRZ
X-Message-ID-Hash: 2AUKEJQFPPF5IESFIDODRKTNS6UFBZRZ
X-MailFrom: shumingf@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>, "Flove(HsinFu)" <flove@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 =?big5?B?RGVyZWsgW6TovHe4cV0=?= <derek.fang@realtek.com>,
 "pierre-louis.bossart@intel.com" <pierre-louis.bossart@intel.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2AUKEJQFPPF5IESFIDODRKTNS6UFBZRZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiBPbiBUdWUsIEZlYiAwNywgMjAyMyBhdCAwNTowOTo0NlBNICswODAwLCBzaHVtaW5nZkByZWFs
dGVrLmNvbSB3cm90ZToNCj4gDQo+ID4gK3N0YXRpYyBpbnQgcnQ3MTJfc2RjYV9tdXhfcHV0KHN0
cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLA0KPiA+ICsJCQlzdHJ1Y3Qgc25kX2N0bF9lbGVt
X3ZhbHVlICp1Y29udHJvbCkgew0KPiA+ICsJc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21w
b25lbnQgPQ0KPiA+ICsJCXNuZF9zb2NfZGFwbV9rY29udHJvbF9jb21wb25lbnQoa2NvbnRyb2wp
Ow0KPiA+ICsJc3RydWN0IHNuZF9zb2NfZGFwbV9jb250ZXh0ICpkYXBtID0NCj4gPiArCQlzbmRf
c29jX2RhcG1fa2NvbnRyb2xfZGFwbShrY29udHJvbCk7DQo+ID4gKwlzdHJ1Y3QgcnQ3MTJfc2Rj
YV9wcml2ICpydDcxMiA9DQo+IHNuZF9zb2NfY29tcG9uZW50X2dldF9kcnZkYXRhKGNvbXBvbmVu
dCk7DQo+ID4gKwlzdHJ1Y3Qgc29jX2VudW0gKmUgPSAoc3RydWN0IHNvY19lbnVtICopa2NvbnRy
b2wtPnByaXZhdGVfdmFsdWU7DQo+ID4gKwl1bnNpZ25lZCBpbnQgKml0ZW0gPSB1Y29udHJvbC0+
dmFsdWUuZW51bWVyYXRlZC5pdGVtOw0KPiA+ICsJdW5zaWduZWQgaW50IG1hc2tfc2Z0Ow0KPiAN
Cj4gPiArDQo+ID4gKwlzbmRfc29jX2RhcG1fbXV4X3VwZGF0ZV9wb3dlcihkYXBtLCBrY29udHJv
bCwNCj4gPiArCQlpdGVtWzBdLCBlLCBOVUxMKTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMTsNCj4g
PiArfQ0KPiANCj4gVGhpcyB1bmNvbmRpdGlvbmFsbHkgcmV0dXJucyAxIGlmIHRoZSB2YWx1ZSB3
cml0dGVuIGlzIGluIGJvdW5kcyB3aGljaCBtZWFucw0KPiB0aGF0IGFuIGV2ZW50IHdpbGwgYWx3
YXlzIGJlIHNpZ25hbGxlZC4gIFBsZWFzZSB1c2UgbWl4ZXItdGVzdCB0byBjaGVjayBmb3IgdGhp
cw0KPiBhbmQgb3RoZXIgaXNzdWVzLg0KDQpJIHdpbGwgYWRkIHRoZSBjb2RlIHRvIGNoZWNrLg0K
cmV0dXJuIDAgaWYgbm8gbmVlZCB0byBiZSBjaGFuZ2VkDQpyZXR1cm4gMSBpZiBuZWVkcyB0byBi
ZSBjaGFuZ2VkDQpUaGFua3MuDQoNCj4gPiArCS8qIHNldCBzYW1wbGluZyBmcmVxdWVuY3kgKi8N
Cj4gPiArCWlmIChkYWktPmlkID09IFJUNzEyX0FJRjEpIHsNCj4gPiArCQlyZWdtYXBfd3JpdGUo
cnQ3MTItPnJlZ21hcCwNCj4gPiArCQkJU0RXX1NEQ0FfQ1RMKEZVTkNfTlVNX0pBQ0tfQ09ERUMs
DQo+IFJUNzEyX1NEQ0FfRU5UX0NTMDEsIFJUNzEyX1NEQ0FfQ1RMX1NBTVBMRV9GUkVRX0lOREVY
LCAwKSwNCj4gPiArCQkJc2FtcGxpbmdfcmF0ZSk7DQo+ID4gKwkJcmVnbWFwX3dyaXRlKHJ0NzEy
LT5yZWdtYXAsDQo+ID4gKwkJCVNEV19TRENBX0NUTChGVU5DX05VTV9KQUNLX0NPREVDLA0KPiBS
VDcxMl9TRENBX0VOVF9DUzExLCBSVDcxMl9TRENBX0NUTF9TQU1QTEVfRlJFUV9JTkRFWCwgMCks
DQo+ID4gKwkJCXNhbXBsaW5nX3JhdGUpOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiArCWlmIChkYWkt
PmlkID09IFJUNzEyX0FJRjIpDQo+ID4gKwkJcmVnbWFwX3dyaXRlKHJ0NzEyLT5yZWdtYXAsDQo+
ID4gKwkJCVNEV19TRENBX0NUTChGVU5DX05VTV9BTVAsIFJUNzEyX1NEQ0FfRU5UX0NTMzEsDQo+
IFJUNzEyX1NEQ0FfQ1RMX1NBTVBMRV9GUkVRX0lOREVYLCAwKSwNCj4gPiArCQkJc2FtcGxpbmdf
cmF0ZSk7DQo+IA0KPiBUaGlzIHdvdWxkIGJlIGJldHRlciB3cml0dGVuIGFzIGEgc3dpdGNoIHN0
YXRlbWVudCwgdGhlcmUgd2VyZSBzb21lIG90aGVyDQo+IGNoZWNrcyBmb3IgdmFyaWFudHMgdGhh
dCBsb29rZWQgdG8gaGF2ZSBzaW1pbGFyIGlzc3Vlcy4gIEl0IG1ha2VzIGl0IGNsZWFyZXIgdGhh
dA0KPiBvbmx5IG9uZSBvcHRpb24gY2FuIGJlIHNlbGVjdGVkIGFuZCBhbGxvd3MgeW91IHRvIGhh
dmUgYSBkZWZhdWx0IGNoZWNrIHRoYXQNCj4gbWFrZXMgc3VyZSB0aGF0IGFueSBuZXcgdmFyaWFu
dCB3aXRoIGFub3RoZXIgQUlGIGdldHMgaGFuZGxlZC4NCg0KT0ssIHdpbGwgc2VuZCB0aGUgcGF0
Y2ggdG8gZml4Lg0KDQo+IC0tLS0tLVBsZWFzZSBjb25zaWRlciB0aGUgZW52aXJvbm1lbnQgYmVm
b3JlIHByaW50aW5nIHRoaXMgZS1tYWlsLg0K
