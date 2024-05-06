Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 571C28BFD8F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:46:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B396E7F8;
	Wed,  8 May 2024 14:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B396E7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715172407;
	bh=6TAT1+n58JucEKjWCrV75WkhFXklBUPwfthOxea0vBc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fFsn7VCOg3JnexI/zW09yKDYt/Mezg+Hr61fFildN8e6rydEqIdvR4tb0eaicJV6i
	 2i4ElxSWSpouaMKcs/t+s1xsY/kLCYO3+khU5TVTZRD6QEEUcZp0H+AFUiPYbeS9hz
	 5XjoTL5XwPeZJG3sucdmgU3SFtxk0ojCDorPkB9Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C093CF8067F; Wed,  8 May 2024 14:45:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5702CF80682;
	Wed,  8 May 2024 14:45:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3D42F804E7; Mon,  6 May 2024 09:44:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23FC2F8003A
	for <alsa-devel@alsa-project.org>; Mon,  6 May 2024 09:44:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23FC2F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ZCDzeUQt
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4467ig53095759;
	Mon, 6 May 2024 02:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714981482;
	bh=6TAT1+n58JucEKjWCrV75WkhFXklBUPwfthOxea0vBc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=ZCDzeUQtx/oOXKTf2ZrmL//ClDQ6l0OICmso0wKPdSSCtXB6M478K3ltrlpYOvZSC
	 ZFfDtmoPUiCRrIGYBlTZyBSkxxOL8OXq0Xc1XEOAWUGy2LKYl7md41Vjq/xUdNgjKh
	 jMLNplDArbtwMNoDihtZ2tNm+Xgy+lTDEFC/zZho=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4467igug118570
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 May 2024 02:44:42 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 May 2024 02:44:41 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
 DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
 15.01.2507.023; Mon, 6 May 2024 02:44:41 -0500
From: "Xu, Baojun" <baojun.xu@ti.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Takashi Iwai
	<tiwai@suse.de>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "Lu, Kevin" <kevin-lu@ti.com>,
        "Ding,
 Shenghao" <shenghao-ding@ti.com>,
        "Navada Kanyana, Mukund" <navada@ti.com>,
        "13916275206@139.com" <13916275206@139.com>,
        "P O, Vijeth" <v-po@ti.com>,
        "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "soyer@irl.hu" <soyer@irl.hu>
Subject: Re: [EXTERNAL] Re: [PATCH v4 1/3] ALSA: hda/tas2781: Add tas2781 hda
 driver based on SPI
Thread-Topic: [EXTERNAL] Re: [PATCH v4 1/3] ALSA: hda/tas2781: Add tas2781 hda
 driver based on SPI
Thread-Index: AQHams/AyRoBFLmXZEetT//IO/HlOrGBGk0AgAANNwCACLNAfA==
Date: Mon, 6 May 2024 07:44:41 +0000
Message-ID: <5832318882b14f5cb171ce2ecde1fc93@ti.com>
References: <20240430072544.1877-1-baojun.xu@ti.com>
 <20240430072544.1877-2-baojun.xu@ti.com>
 <87jzkfm2hp.wl-tiwai@suse.de>,<ZjD1-NSC3X_7JcQg@smile.fi.intel.com>
In-Reply-To: <ZjD1-NSC3X_7JcQg@smile.fi.intel.com>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.64.41.94]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MailFrom: baojun.xu@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: D7V6NW4FR7VCGJQZKNLMZVTYB3QKBQ7S
X-Message-ID-Hash: D7V6NW4FR7VCGJQZKNLMZVTYB3QKBQ7S
X-Mailman-Approved-At: Wed, 08 May 2024 12:44:51 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D7V6NW4FR7VCGJQZKNLMZVTYB3QKBQ7S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgQW5keQ0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMsIGFuc3dlciBpbiBsaW5lOg0KDQo+
IEZyb206IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29t
Pg0KPiBTZW50OiAzMCBBcHJpbCAyMDI0IDIxOjQ1DQo+IFRvOiBUYWthc2hpIEl3YWkNCj4gQ2M6
IFh1LCBCYW9qdW47IHJvYmgrZHRAa2VybmVsLm9yZzsgbGdpcmR3b29kQGdtYWlsLmNvbTsgcGVy
ZXhAcGVyZXguY3o7IHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbTsgTHUsIEtl
dmluOyBEaW5nLCBTaGVuZ2hhbzsgTmF2YWRhIEthbnlhbmEsIE11a3VuZDsgMTM5MTYyNzUyMDZA
MTM5LmNvbTsgUCBPLCBWaWpldGg7IEhvbGFsdSBZb2dlbmRyYSwgTmlyYW5qYW47IGFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGlhbS5y
LmdpcmR3b29kQGludGVsLmNvbTsgeXVuZy1jaHVhbi5saWFvQGxpbnV4LmludGVsLmNvbTsgYnJv
b25pZUBrZXJuZWwub3JnOyBzb3llckBpcmwuaHUNCj4gU3ViamVjdDogW0VYVEVSTkFMXSBSZTog
W1BBVENIIHY0IDEvM10gQUxTQTogaGRhL3RhczI3ODE6IEFkZCB0YXMyNzgxIGhkYSBkcml2ZXIg
YmFzZWQgb24gU1BJDQo+IA0KPiBPbiBUdWUsIEFwciAzMCwgMjAyNCBhdCAwMjrigIo1ODrigIox
MFBNICswMjAwLCBUYWthc2hpIEl3YWkgd3JvdGU6ID4gT24gVHVlLCAzMCBBcHIgMjAyNCAwOTri
gIoyNTrigIo0MiArMDIwMCwgQmFvanVuIFh1IHdyb3RlOiAuLuKAii4gPiA+IHNuZC1oZGEtY3Mt
ZHNwLWN0bHMtb2JqcyA6PSBoZGFfY3NfZHNwX2N0bC7igIpvID4gPiBzbmQtaGRhLXNjb2RlYy1j
b21wb25lbnQtb2JqcyA6PSBoZGFfY29tcG9uZW50LuKAim8gPg0KPiBaalFjbVFSWUZwZnB0QmFu
bmVyU3RhcnQNCj4gVGhpcyBtZXNzYWdlIHdhcyBzZW50IGZyb20gb3V0c2lkZSBvZiBUZXhhcyBJ
bnN0cnVtZW50cy4NCj4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5s
ZXNzIHlvdSByZWNvZ25pemUgdGhlIHNvdXJjZSBvZiB0aGlzIGVtYWlsIGFuZCBrbm93IHRoZSBj
b250ZW50IGlzIHNhZmUuIElmIHlvdSB3aXNoIHRvIHJlcG9ydCB0aGlzIG1lc3NhZ2UgdG8gSVQg
U2VjdXJpdHksIHBsZWFzZSBmb3J3YXJkIHRoZSBtZXNzYWdlIGFzIGFuIGF0dGFjaG1lbnQgdG8g
cGhpc2hpbmdAbGlzdC50aS5jb20NCj4gDQo+IFpqUWNtUVJZRnBmcHRCYW5uZXJFbmQNCj4gDQo+
IE9uIFR1ZSwgQXByIDMwLCAyMDI0IGF0IDAyOjU4OjEwUE0gKzAyMDAsIFRha2FzaGkgSXdhaSB3
cm90ZToNCj4gPiBPbiBUdWUsIDMwIEFwciAyMDI0IDA5OjI1OjQyICswMjAwLCBCYW9qdW4gWHUg
d3JvdGU6DQo+IA0KPiAuLi4NCj4gDQo+ID4gPiAgc25kLWhkYS1jcy1kc3AtY3Rscy1vYmpzIDo9
ICAgICAgICAgICAgICAgIGhkYV9jc19kc3BfY3RsLm8NCj4gPiA+ICBzbmQtaGRhLXNjb2RlYy1j
b21wb25lbnQtb2JqcyA6PSAgIGhkYV9jb21wb25lbnQubw0KPiA+ID4gIHNuZC1oZGEtc2NvZGVj
LXRhczI3ODEtaTJjLW9ianMgOj0gdGFzMjc4MV9oZGFfaTJjLm8NCj4gPiA+ICtzbmQtaGRhLXNj
b2RlYy10YXMyNzgxLXNwaS15IDo9ICAgIHRhczI3ODFfaGRhX3NwaS5vIHRhczI3ODFfc3BpX2Z3
bGliLm8NCj4gPg0KPiA+IEEgbml0cGlja2luZzogYmV0dGVyIHRvIGFsaWduIHdpdGggb3RoZXIg
bGluZXMgKGkuZS4gd2l0aCAqLW9ianMNCj4gPiBpbnN0ZWFkIG9mICoteSkuDQo+IA0KPiBJIG9i
amVjdCB0aGlzLiBUaGUgYmV0dGVyIGFwcHJvYWNoIGlzIHRvIGhhdmUgYSBwcmVjdXJzb3IgcGF0
Y2ggdGhhdCBzd2l0Y2hlcw0KPiB0byB5IG92ZXIgb2JqcyAodGhlIGxhdHRlciBpcyBmb3IgdXNl
ciBzcGFjZSBjb2RlIC8gdG9vbHMpLg0KDQpJIGFsc28gZG8gbm90IGZ1bGx5IHVuZGVyc3RhbmQg
d2h5IHNldCBpdCBhcyAieSIsIGFzIHlvdSBrbm93LCBJIGZvbGxvdw0KQ09ORklHX1NORF9IREFf
U0NPREVDX1RBUzI3ODFfSTJDLCBhcyBpdCBkbyBub3Qgc2V0IHRvICJ5Ii4NCg0KPiANCj4gLS0N
Cj4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KPiANCj4gDQo+IA==
