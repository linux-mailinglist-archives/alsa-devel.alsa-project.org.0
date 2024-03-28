Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B64C87DA30
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Mar 2024 13:45:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9808C238F;
	Sat, 16 Mar 2024 13:45:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9808C238F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710593140;
	bh=i195H24fG+78UvSYeAPFY5EsjUrvxJ1ellunMAQjzNE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r4N1JbFLJkrRm+5c4xotMadFevxQCiKANA3qG8dRQ+9XTuE8fuW6Povo+f8pRuVUs
	 hFr0N48d3FaQZBIrMNUY3R4+P4cI1SyWnOpSUQtOjzVYwMnLztD3GNWKPvArrPRN61
	 4if1ZhjrKBuIST9rcemw8DxlQJjBnH/qhiQFVGew=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AD2FF80589; Sat, 16 Mar 2024 13:45:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E8C4F805A0;
	Sat, 16 Mar 2024 13:45:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30787F8028D; Sat, 16 Mar 2024 13:45:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7126DF8014B
	for <alsa-devel@alsa-project.org>; Sat, 16 Mar 2024 13:44:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7126DF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Ft05WTNh
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42GCifxS025491;
	Sat, 16 Mar 2024 07:44:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710593081;
	bh=i195H24fG+78UvSYeAPFY5EsjUrvxJ1ellunMAQjzNE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Ft05WTNhl601z0q9NMlAdUu6cDXLS8lyFLKzpFa1nx/r0BPVRJlGZ/qXb/UlFhFEg
	 WO8zMF0ObHYvSH1X9mfs0erp5y+0LTsnHV/0EXgA361r0cPdnB/uu4inLNJ7wqOa1k
	 MV6chWlb0gExAPnnOS4NEYzde34eoxpNHd/PYiiU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42GCifst108336
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 16 Mar 2024 07:44:41 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 16
 Mar 2024 07:44:41 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Sat, 16 Mar 2024 07:44:40 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Amadeusz Slawinski <amadeuszx.slawinski@linux.intel.com>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz"
	<perex@perex.cz>,
        "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "13916275206@139.com"
	<13916275206@139.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "liam.r.girdwood@intel.com"
	<liam.r.girdwood@intel.com>,
        "bard.liao@intel.com" <bard.liao@intel.com>,
        "mengdong.lin@intel.com" <mengdong.lin@intel.com>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "Lu,
 Kevin" <kevin-lu@ti.com>, "tiwai@suse.de" <tiwai@suse.de>,
        "soyer@irl.hu"
	<soyer@irl.hu>,
        "Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
        "Navada Kanyana,
 Mukund" <navada@ti.com>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: RE: [EXTERNAL] Re: [PATCH v11] ASoc: tas2783: Add tas2783 codec
 driver
Thread-Topic: [EXTERNAL] Re: [PATCH v11] ASoc: tas2783: Add tas2783 codec
 driver
Thread-Index: AQHabwDKl9LUvPfYxEefCqERSA/bELEptFCAgBCsLuA=
Date: Sat, 16 Mar 2024 12:44:40 +0000
Message-ID: <4e2006ff96a446978dd1996eeaa42099@ti.com>
References: <20240305132646.638-1-shenghao-ding@ti.com>
 <2efb5250-25f3-465e-81fc-cb885027b481@linux.intel.com>
In-Reply-To: <2efb5250-25f3-465e-81fc-cb885027b481@linux.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.160.249]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: CYQFHA27S6S3US5H6ROYJZJQONZDY5WQ
X-Message-ID-Hash: CYQFHA27S6S3US5H6ROYJZJQONZDY5WQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYQFHA27S6S3US5H6ROYJZJQONZDY5WQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

VGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLiBLaW5kbHkgc2VlIHRoZSBmZWVkYmFjaw0KDQo+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFtYWRldXN6IFPFgmF3acWEc2tpIDxh
bWFkZXVzenguc2xhd2luc2tpQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBN
YXJjaCA2LCAyMDI0IDEyOjA1IEFNDQo+IFRvOiBEaW5nLCBTaGVuZ2hhbyA8c2hlbmdoYW8tZGlu
Z0B0aS5jb20+OyBicm9vbmllQGtlcm5lbC5vcmcNCj4gQ2M6IGFuZHJpeS5zaGV2Y2hlbmtvQGxp
bnV4LmludGVsLmNvbTsgbGdpcmR3b29kQGdtYWlsLmNvbTsNCj4gcGVyZXhAcGVyZXguY3o7IHBp
ZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbTsNCj4gMTM5MTYyNzUyMDZAMTM5LmNv
bTsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2Vy
bmVsLm9yZzsgbGlhbS5yLmdpcmR3b29kQGludGVsLmNvbTsgYmFyZC5saWFvQGludGVsLmNvbTsN
Cj4gbWVuZ2RvbmcubGluQGludGVsLmNvbTsgeXVuZy1jaHVhbi5saWFvQGxpbnV4LmludGVsLmNv
bTsgTHUsIEtldmluDQo+IDxrZXZpbi1sdUB0aS5jb20+OyB0aXdhaUBzdXNlLmRlOyBzb3llckBp
cmwuaHU7IEJhb2p1bi5YdUBmcHQuY29tOw0KPiBOYXZhZGEgS2FueWFuYSwgTXVrdW5kIDxuYXZh
ZGFAdGkuY29tPg0KPiBTdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBbUEFUQ0ggdjExXSBBU29jOiB0
YXMyNzgzOiBBZGQgdGFzMjc4MyBjb2RlYw0KPiBkcml2ZXINCj4gDQo+IE9uIDMvNS8yMDI0IDI6
MjYgUE0sIFNoZW5naGFvIERpbmcgd3JvdGU6DQo+ID4gVGhlIHRhczI3ODMgaXMgYSBzbWFydCBh
dWRpbyBhbXBsaWZpZXIgd2l0aCBpbnRlZ3JhdGVkIE1JUEkgU291bmRXaXJlDQo+ID4gaW50ZXJm
YWNlIChWZXJzaW9uIDEuMi4xIGNvbXBsaWFudCksIEkyQywgYW5kIEkyUy9URE0gaW50ZXJmYWNl
cw0KPiA+IGRlc2lnbmVkIGZvciBwb3J0YWJsZSBhcHBsaWNhdGlvbnMuIEFuIG9uLWNoaXAgRFNQ
IHN1cHBvcnRzIFRleGFzDQo+ID4gSW5zdHJ1bWVudHMgU21hcnRBbXAgc3BlYWtlciBwcm90ZWN0
aW9uIGFsZ29yaXRobS4gVGhlIGludGVncmF0ZWQNCj4gPiBzcGVha2VyIHZvbHRhZ2UgYW5kIGN1
cnJlbnQgc2Vuc2UgcHJvdmlkZXMgZm9yIHJlYWwtdGltZSBtb25pdG9yaW5nIG9mDQo+IGxvdWRz
cGVha2Vycy4NCj4gPg0KPiA+IFRoZSBBU29DIGNvbXBvbmVudCBwcm92aWRlcyB0aGUgbWFqb3Jp
dHkgb2YgdGhlIGZ1bmN0aW9uYWxpdHkgb2YgdGhlDQo+ID4gZGV2aWNlLCBhbGwgdGhlIGF1ZGlv
IGZ1bmN0aW9ucy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNoZW5naGFvIERpbmcgPHNoZW5n
aGFvLWRpbmdAdGkuY29tPg0KPiA+DQo+ID4gLS0tDQo+IA0KPiAuLi4NCi4uLg0KPiA+ICtzdHJ1
Y3QgdGFzZGV2aWNlX3ByaXYgew0KPiA+ICsJc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21w
b25lbnQ7DQo+IA0KPiBBcGFydCBmcm9tIGJlaW5nIGFzc2lnbmVkIHRoaXMgZmllbGQgc2VlbXMg
dG8gYmUgdW51c2VkLg0KVGhpcyBmaWVsZCBjYW4gaGVscCB0byBnZXQgdGhlIHBvaW50IHRvICJz
dHJ1Y3QgdGFzZGV2aWNlX3ByaXYiIGluIHRhc2RldmljZV9zZHdfcGNtX2h3X2ZyZWUsIA0KdGFz
ZGV2aWNlX3Nkd19od19wYXJhbXMsIHRhc2RldmljZV9tdXRlDQoNCj4gDQo+ID4gKwlzdHJ1Y3Qg
c2R3X3NsYXZlICpzZHdfcGVyaXBoZXJhbDsNCj4gPiArCWVudW0gc2R3X3NsYXZlX3N0YXR1cyBz
dGF0dXM7DQo+IA0KPiBUaGlzIG9uZSBzZWVtcyB0byBiZSBvbmx5IHVzZWQgaW4gdGFzZGV2aWNl
X3VwZGF0ZV9zdGF0dXMoKT8gRG9lcyBpdCByZWFsbHkNCj4gbmVlZCB0byBiZSBrZXB0IGluIHN0
cnVjdD8NCj4gDQo+ID4gKwlzdHJ1Y3Qgc2R3X2J1c19wYXJhbXMgcGFyYW1zOw0KPiANCj4gVW51
c2VkPw0KPiANCj4gPiArCXN0cnVjdCByZWdtYXAgKnJlZ21hcDsNCj4gPiArCXN0cnVjdCBkZXZp
Y2UgKmRldjsNCj4gPiArCXVuc2lnbmVkIGNoYXIgZHNwZndfYmluYXJ5bmFtZVtUQVMyNzgzX0RT
UEZXX0ZJTEVOQU1FX0xFTl07DQo+IA0KPiBUaGlzIG9uZSBhbHNvIHNlZW1zIHdlaXJkLCBpdCBp
cyBtYWlubHkgbmVlZGVkIHdoZW4gbG9hZGluZyBGVyBhbmQgY291bGQgYmUNCj4gbG9jYWwgdG8g
dGFzZGV2aWNlX2NvbXBfcHJvYmUoKSwgYWx0aG91Z2ggdGhlcmUgaXMgb25lIGRldl93YXJuIHdo
aWNoIHVzZXMNCj4gaXQgb3V0c2lkZSBvZiBpdCwgYnV0IHByZXR0eSBzdXJlIGl0IGNvdWxkIGJl
IGRyb3BwZWQuDQo+IA0KPiA+ICsJdW5zaWduZWQgY2hhciBkZXZfbmFtZVszMl07DQo+IA0KPiBB
bm90aGVyIHVudXNlZCBmaWVsZC4NCj4gDQo+ID4gKwl1bnNpZ25lZCBpbnQgY2hpcF9pZDsNCj4g
DQo+IEFub3RoZXIgb25lIHRoYXQgb25seSBzZWVtcyB0byBiZSBhc3NpZ25lZC4NCj4gDQo+ID4g
Kwlib29sIHBzdHJlYW07DQo+ID4gKwlib29sIGh3X2luaXQ7DQo+ID4gKwlib29sIGZpcnN0X2h3
X2luaXQ7DQo+ID4gK307DQo+ID4gKw0KPiA+ICsjZW5kaWYgLypfX1RBUzI3ODNfSF9fICovDQoN
Cg==
