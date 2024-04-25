Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 757A88B39D1
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 16:24:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 099BD10BE;
	Fri, 26 Apr 2024 16:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 099BD10BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714141446;
	bh=f4v6nriRsTGab93XHaryXtN37sBdVf9QHMiqI5braNY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DOzyrSnSQPKQBgwOIhCVoyWWpNWQ6yQdS1qtiwwRDX3QsCIN1yi3WY/PAm6Ti6aCD
	 ONXU3MMHDVJuvrs6x3DivgWaJXvw7frIlJwaFm2MmKBMjXX03Jwx17Phzokh+x8T63
	 UEoGmllHooi03IWXt5G3BkNO/dgQtaZIylWYjkhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BC5DF805B4; Fri, 26 Apr 2024 16:23:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96C37F805D2;
	Fri, 26 Apr 2024 16:23:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DF44F8057B; Thu, 25 Apr 2024 09:54:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B00F0F80423
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 09:54:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B00F0F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=IbEQ/MkV
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43P7sg6t080566;
	Thu, 25 Apr 2024 02:54:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714031682;
	bh=f4v6nriRsTGab93XHaryXtN37sBdVf9QHMiqI5braNY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=IbEQ/MkVMnUGNcEONW5OYhb69SIRfxMra3SEa7Vd2VhjC5lABPSgZv5JZLpjtybdK
	 TAXXcbpNArLye4iaSaIJtlfjARTF5TS1cutpGSlWRdXpubf4ruB7JDpz+r50j1rVgf
	 jtPHhXTDLyF1pyA9+e6Oq7pXkC0EFS9HQz+xWnPg=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43P7sgHX093892
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Apr 2024 02:54:42 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 Apr 2024 02:54:41 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
 DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
 15.01.2507.023; Thu, 25 Apr 2024 02:54:41 -0500
From: "Xu, Baojun" <baojun.xu@ti.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "tiwai@suse.de" <tiwai@suse.de>,
        "robh+dt@kernel.org"
	<robh+dt@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
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
Subject: Re: [EXTERNAL] Re: [PATCH v3 1/3] ALSA: hda/tas2781: Modification for
 add tas2781 driver for SPI
Thread-Topic: [EXTERNAL] Re: [PATCH v3 1/3] ALSA: hda/tas2781: Modification
 for add tas2781 driver for SPI
Thread-Index: AQHakUValxtzw4HJGk6cPNX38MLKCLFuQDOAgApofQE=
Date: Thu, 25 Apr 2024 07:54:41 +0000
Message-ID: <0c7b29075dc347299602668660adb4b6@ti.com>
References: <20240418040240.2337-1-baojun.xu@ti.com>
 <20240418040240.2337-2-baojun.xu@ti.com>,<ZiEKc4OTVlOt8llU@smile.fi.intel.com>
In-Reply-To: <ZiEKc4OTVlOt8llU@smile.fi.intel.com>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.180.69.5]
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
Message-ID-Hash: FNNGO736XWWNCRMA63PHSZ5GSFOQQQPM
X-Message-ID-Hash: FNNGO736XWWNCRMA63PHSZ5GSFOQQQPM
X-Mailman-Approved-At: Fri, 26 Apr 2024 14:23:11 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FNNGO736XWWNCRMA63PHSZ5GSFOQQQPM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgQW5keSwNCg0KVGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLg0KDQo+IEZyb206IEFuZHkgU2hl
dmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiAxOCBB
cHJpbCAyMDI0IDE5OjU2DQo+IFRvOiBYdSwgQmFvanVuDQo+IENjOiB0aXdhaUBzdXNlLmRlOyBy
b2JoK2R0QGtlcm5lbC5vcmc7IGxnaXJkd29vZEBnbWFpbC5jb207IHBlcmV4QHBlcmV4LmN6OyBw
aWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb207IEx1LCBLZXZpbjsgRGluZywgU2hl
bmdoYW87IE5hdmFkYSBLYW55YW5hLCBNdWt1bmQ7IDEzOTE2Mjc1MjA2QDEzOS5jb207IFAgTywg
VmlqZXRoOyBIb2xhbHUgWW9nZW5kcmEsIE5pcmFuamFuOyBhbHNhLWRldmVsQGFsc2EtcHJvamVj
dC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpYW0uci5naXJkd29vZEBpbnRl
bC5jb207IHl1bmctY2h1YW4ubGlhb0BsaW51eC5pbnRlbC5jb207IGJyb29uaWVAa2VybmVsLm9y
Zzsgc295ZXJAaXJsLmh1DQo+IFN1YmplY3Q6IFtFWFRFUk5BTF0gUmU6IFtQQVRDSCB2MyAxLzNd
IEFMU0E6IGhkYS90YXMyNzgxOiBNb2RpZmljYXRpb24gZm9yIGFkZCB0YXMyNzgxIGRyaXZlciBm
b3IgU1BJDQo+IA0KPiBPbiBUaHUsIEFwciAxOCwgMjAyNCBhdCAxMjrigIowMjrigIozN1BNICsw
ODAwLCBCYW9qdW4gWHUgd3JvdGU6ID4gSW50ZWdyYXRlIHRhczI3ODEgY29uZmlncyBmb3IgSFAg
TGFwdG9wcy4gRXZlcnkgdGFzMjc4MSBpbiB0aGUgbGFwdG9wID4gd2lsbCB3b3JrIGFzIGEgc2lu
Z2xlIHNwZWFrZXIgb24gU1BJIGJ1cy4gVGhlIGNvZGUgc3VwcG9ydCByZWFsdGVrIGFzIFJlYWx0
ZWsgPiB0aGUgcHJpbWFyeSBjb2RlYy7igIoNCj4gWmpRY21RUllGcGZwdEJhbm5lclN0YXJ0DQo+
IFRoaXMgbWVzc2FnZSB3YXMgc2VudCBmcm9tIG91dHNpZGUgb2YgVGV4YXMgSW5zdHJ1bWVudHMu
DQo+IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVj
b2duaXplIHRoZSBzb3VyY2Ugb2YgdGhpcyBlbWFpbCBhbmQga25vdyB0aGUgY29udGVudCBpcyBz
YWZlLiBJZiB5b3Ugd2lzaCB0byByZXBvcnQgdGhpcyBtZXNzYWdlIHRvIElUIFNlY3VyaXR5LCBw
bGVhc2UgZm9yd2FyZCB0aGUgbWVzc2FnZSBhcyBhbiBhdHRhY2htZW50IHRvIHBoaXNoaW5nQGxp
c3QudGkuY29tDQo+IA0KPiBaalFjbVFSWUZwZnB0QmFubmVyRW5kDQo+IA0KPiBPbiBUaHUsIEFw
ciAxOCwgMjAyNCBhdCAxMjowMjozN1BNICswODAwLCBCYW9qdW4gWHUgd3JvdGU6DQo+ID4gSW50
ZWdyYXRlIHRhczI3ODEgY29uZmlncyBmb3IgSFAgTGFwdG9wcy4gRXZlcnkgdGFzMjc4MSBpbiB0
aGUgbGFwdG9wDQo+ID4gd2lsbCB3b3JrIGFzIGEgc2luZ2xlIHNwZWFrZXIgb24gU1BJIGJ1cy4g
VGhlIGNvZGUgc3VwcG9ydCByZWFsdGVrIGFzDQo+IA0KPiBSZWFsdGVrDQo+IA0KPiA+IHRoZSBw
cmltYXJ5IGNvZGVjLg0KPiANCj4gLi4uDQo+IA0KPiA+ICBzb3VuZC9wY2kvaGRhL0tjb25maWcg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKysrKysrKysrKw0KPiA+ICBzb3Vu
ZC9wY2kvaGRhL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrDQo+IA0K
PiBJcyB0aGlzIGNvcnJlY3Q/IFlvdSBhcmUgYWRkaW5nIGEgZGVhZCAiY29kZSIsIGlzbid0IGl0
Pw0KPiANCg0KV2hhdCdzIG1lYW4gImRlYWQgY29kZSI/IEFmdGVyIGFkZCBDT05GSUdfU05EX0hE
QV9TQ09ERUNfVEFTMjc4MV9TUEk9bQ0KaW4gbXkgY29uZmlnIGZpbGUsIHRoZSB3aG9sZSBwYXRj
aCBjb2RlIGhhcyB3b3JrZWQuDQoNCj4gLi4uDQo+IA0KPiBUaGUgcmVzdCBMR1RNLg0KPiANCj4g
LS0NCj4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KPiANCg0KDQpCZXN0
IFJlZ2FyZHMNCkppbQ0KDQo=
