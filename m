Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 788FE94E0AE
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Aug 2024 11:24:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99D5614E8;
	Sun, 11 Aug 2024 11:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99D5614E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723368290;
	bh=lqbd0gEhe9HTfdCCKx6zVmuyo0Mpzurg16Zvw3nBpnM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rEDVSPLrm/138Ureq7JphB2gG5ew/lDHLN0Jt2XS0dSaV8TFPx0DzZJk5WyuXY50u
	 t1FQwy4FMcY8pZOhCLZD0LqyIziWqlKoYOdBAmcFIPWgDxtJ6c/JKJicFUe8vmAoa6
	 aZcv4QTuMDa7LqyEtVZs4SGEx/Nnpc2t4DcVNN0w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8465CF80517; Sun, 11 Aug 2024 11:24:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FB59F805AF;
	Sun, 11 Aug 2024 11:24:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAE83F80423; Sun, 11 Aug 2024 11:23:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12CE4F8016E
	for <alsa-devel@alsa-project.org>; Sun, 11 Aug 2024 11:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12CE4F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Azq4PAcy
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47B9Mi15068136;
	Sun, 11 Aug 2024 04:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723368164;
	bh=lqbd0gEhe9HTfdCCKx6zVmuyo0Mpzurg16Zvw3nBpnM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Azq4PAcyPwwhU0AGMdEtHLNvzNgyPeQ+WcqGUUPdqs56YE7kOfDpB5IUFrd7Gbzfs
	 OxxqHruus4XovDBdDfYptkrVe/X85ZggPJnXUZm7aZ2S2OSym0fokwZ+jOc18of6vy
	 YmGBKHif9nd86v4M9zq3Gygp7AbEkw+9snbZqbZI=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47B9Miq5109962
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 11 Aug 2024 04:22:44 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 11
 Aug 2024 04:22:44 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Sun, 11 Aug 2024 04:22:44 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "13916275206@139.com"
	<13916275206@139.com>,
        "zhourui@huaqin.com" <zhourui@huaqin.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "Salazar, Ivan"
	<i-salazar@ti.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Chadha, Jasjot Singh" <j-chadha@ti.com>,
        "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
        "Yue, Jaden"
	<jaden-yue@ti.com>,
        "yung-chuan.liao@linux.intel.com"
	<yung-chuan.liao@linux.intel.com>,
        "Rao, Dipa" <dipa@ti.com>, "yuhsuan@google.com" <yuhsuan@google.com>,
        "Lo, Henry" <henry.lo@ti.com>, "tiwai@suse.de" <tiwai@suse.de>,
        "Xu, Baojun" <baojun.xu@ti.com>, "soyer@irl.hu" <soyer@irl.hu>,
        "Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
        "judyhsiao@google.com" <judyhsiao@google.com>,
        "Navada Kanyana, Mukund"
	<navada@ti.com>,
        "cujomalainey@google.com" <cujomalainey@google.com>,
        "Kutty,
 Aanya" <aanya@ti.com>,
        "Mahmud, Nayeem" <nayeem.mahmud@ti.com>,
        "savyasanchi.shukla@netradyne.com" <savyasanchi.shukla@netradyne.com>,
        "flaviopr@microsoft.com" <flaviopr@microsoft.com>,
        "Ji, Jesse"
	<jesse-ji@ti.com>,
        "darren.ye@mediatek.com" <darren.ye@mediatek.com>
Subject: RE: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: Add new Kontrol to set
 tas2563 digital gain
Thread-Topic: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: Add new Kontrol to set
 tas2563 digital gain
Thread-Index: AQHayRJMnRw9oGsXb0WgSGGuAFyWU7IfoD+AgAJnaYA=
Date: Sun, 11 Aug 2024 09:22:43 +0000
Message-ID: <47d160554aa64aeb952fde980e3d4d0d@ti.com>
References: <20240628041844.1776-1-shenghao-ding@ti.com>
 <ZrYzGWQRdsTlYxQg@smile.fi.intel.com>
In-Reply-To: <ZrYzGWQRdsTlYxQg@smile.fi.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.160.152]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: SMN6HEZYNEJWXHBEPX6U3H4BU24IFAVD
X-Message-ID-Hash: SMN6HEZYNEJWXHBEPX6U3H4BU24IFAVD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SMN6HEZYNEJWXHBEPX6U3H4BU24IFAVD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgQW5keQ0KQW5zd2VyIGlubGluZQ0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4N
Cj4gU2VudDogRnJpZGF5LCBBdWd1c3QgOSwgMjAyNCAxMToxOCBQTQ0KPiBUbzogRGluZywgU2hl
bmdoYW8gPHNoZW5naGFvLWRpbmdAdGkuY29tPg0KPiBDYzogYnJvb25pZUBrZXJuZWwub3JnOyBs
Z2lyZHdvb2RAZ21haWwuY29tOyBwZXJleEBwZXJleC5jejsgcGllcnJlLQ0KPiBsb3Vpcy5ib3Nz
YXJ0QGxpbnV4LmludGVsLmNvbTsgMTM5MTYyNzUyMDZAMTM5LmNvbTsgemhvdXJ1aUBodWFxaW4u
Y29tOw0KPiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7IFNhbGF6YXIsIEl2YW4gPGktc2Fs
YXphckB0aS5jb20+OyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgQ2hhZGhhLCBK
YXNqb3QgU2luZ2ggPGotY2hhZGhhQHRpLmNvbT47DQo+IGxpYW0uci5naXJkd29vZEBpbnRlbC5j
b207IFl1ZSwgSmFkZW4gPGphZGVuLXl1ZUB0aS5jb20+OyB5dW5nLQ0KPiBjaHVhbi5saWFvQGxp
bnV4LmludGVsLmNvbTsgUmFvLCBEaXBhIDxkaXBhQHRpLmNvbT47IHl1aHN1YW5AZ29vZ2xlLmNv
bTsNCj4gTG8sIEhlbnJ5IDxoZW5yeS5sb0B0aS5jb20+OyB0aXdhaUBzdXNlLmRlOyBYdSwgQmFv
anVuIDxiYW9qdW4ueHVAdGkuY29tPjsNCj4gc295ZXJAaXJsLmh1OyBCYW9qdW4uWHVAZnB0LmNv
bTsganVkeWhzaWFvQGdvb2dsZS5jb207IE5hdmFkYSBLYW55YW5hLA0KPiBNdWt1bmQgPG5hdmFk
YUB0aS5jb20+OyBjdWpvbWFsYWluZXlAZ29vZ2xlLmNvbTsgS3V0dHksIEFhbnlhDQo+IDxhYW55
YUB0aS5jb20+OyBNYWhtdWQsIE5heWVlbSA8bmF5ZWVtLm1haG11ZEB0aS5jb20+Ow0KPiBzYXZ5
YXNhbmNoaS5zaHVrbGFAbmV0cmFkeW5lLmNvbTsgZmxhdmlvcHJAbWljcm9zb2Z0LmNvbTsgSmks
IEplc3NlIDxqZXNzZS0NCj4gamlAdGkuY29tPjsgZGFycmVuLnllQG1lZGlhdGVrLmNvbQ0KPiBT
dWJqZWN0OiBbRVhURVJOQUxdIFJlOiBbUEFUQ0ggdjFdIEFTb2M6IHRhczI3ODE6IEFkZCBuZXcg
S29udHJvbCB0byBzZXQNCj4gdGFzMjU2MyBkaWdpdGFsIGdhaW4NCj4gDQo+IE9uIEZyaSwgSnVu
IDI4LCAyMDI0IGF0IDEyOuKAijE4OuKAijQzUE0gKzA4MDAsIFNoZW5naGFvIERpbmcgd3JvdGU6
ID4NCj4gUmVxdXJpbWVudCBmcm9tIGN1c3RvbWVyIHRvIGFkZCBuZXcga2NvbnRyb2wgdG8gc2V0
IHRhczI1NjMgZGlnaXRhbCBnYWluID4NCj4gYW5kIHNldCAiU3BlYWtlciBGb3JjZSBGaXJtd2Fy
ZSBMb2FkIiBhcyB0aGUgY29tbW9uIGtjb250cm9sIGZvciBib3RoID4NCj4gdGFzMjc4NzEgYW5k
IHRhczI1NjMuIFpqUWNtUVJZRnBmcHRCYW5uZXJTdGFydCBUaGlzIG1lc3NhZ2Ugd2FzIHNlbnQg
ZnJvbQ0KPiBvdXRzaWRlIG9mIFRleGFzIEluc3RydW1lbnRzLg0KPiBEbyBub3QgY2xpY2sgbGlu
a3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc291cmNlIG9m
IHRoaXMNCj4gZW1haWwgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gPGh0dHBzOi8v
dXMtcGhpc2hhbGFybS0NCj4gZXd0LnByb29mcG9pbnQuY29tL0VXVC92MS9HM3ZLIXVCZG5WVnFt
T0lIM0JrenNVRmdPOVFnV0otDQo+IHU5cUZFVktoaGZvMlVicDlKNmQ2cjRzcnZod0dpSFpvWWtL
aVE1b2Q4M1hBSldxOXNDeWJ1Tjd1NCQ+DQo+IFJlcG9ydCBTdXNwaWNpb3VzDQo+IA0KPiBaalFj
bVFSWUZwZnB0QmFubmVyRW5kDQo+IE9uIEZyaSwgSnVuIDI4LCAyMDI0IGF0IDEyOjE4OjQzUE0g
KzA4MDAsIFNoZW5naGFvIERpbmcgd3JvdGU6DQo+ID4gUmVxdXJpbWVudCBmcm9tIGN1c3RvbWVy
IHRvIGFkZCBuZXcga2NvbnRyb2wgdG8gc2V0IHRhczI1NjMgZGlnaXRhbA0KPiA+IGdhaW4gYW5k
IHNldCAiU3BlYWtlciBGb3JjZSBGaXJtd2FyZSBMb2FkIiBhcyB0aGUgY29tbW9uIGtjb250cm9s
IGZvcg0KPiA+IGJvdGgNCj4gPiB0YXMyNzg3MSBhbmQgdGFzMjU2My4NCj4gDQo+IC4uLg0KPiAN
Cj4gPiAgI2luY2x1ZGUgPHNvdW5kL3RhczI3ODEuaD4NCj4gPiAgI2luY2x1ZGUgPHNvdW5kL3Rs
di5oPg0KPiA+ICAjaW5jbHVkZSA8c291bmQvdGFzMjc4MS10bHYuaD4NCj4gDQo+ID4gKyNpbmNs
dWRlIDxhc20vdW5hbGlnbmVkLmg+DQo+IA0KPiBCZWZvcmUgc291bmQgd291bGQgYmUgYmV0dGVy
LCBidXQgSSdtIG5vdCBpbnNpc3RpbmcuDQpbZGluZ11BcHBseSB0byB0aGUgbmV3IHBhdGNoLg0K
PiANCj4gLi4uDQo+IA0KPiA+ICsJcmV0ID0gIHRhc2RldmljZV9kZXZfYnVsa19yZWFkKHRhc19k
ZXYsIDAsIHJlZywgZGF0YSwgNCk7DQo+IA0KPiBUb28gbWFueSBzcGFjZXMuDQo+IA0KPiAuLi4N
Cj4gDQo+ID4gKwkvKiBmaW5kIG91dCB0aGUgbWVtYmVyIHNhbWUgYXMgb3IgY2xvc2VyIHRvIHRo
ZSBjdXJyZW50IHZvbHVtZSAqLw0KPiA+ICsJdWNvbnRyb2wtPnZhbHVlLmludGVnZXIudmFsdWVb
MF0gPQ0KPiA+ICsJCWFicyh0YXJnZXQgLSBhcl9sKSA8PSBhYnModGFyZ2V0IC0gYXJfcikgPyBs
IDogcjsNCj4gIA0KPiBXaHkgZG8geW91IG5lZWQgdG8gaGF2ZSB0YXJnZXQgdG8gYmUgYXBwbGll
ZCBoZXJlPyBJSVVDIGFyaXRobWV0aWNzIGNvcnJlY3RseQ0KPiBpdCBtYWtlcyBubyB2YWx1ZSB0
byB1c2UgdGFyZ2V0IGluIHRoaXMgZXF1YXRpb24uDQpbZGluZ10gdGFyZ2V0IHNhdmUgdGhlIHZv
bCByZWdpc3RlciB2YWx1ZSwgYW5kIHRoZSBjb2RlIHdpbGwgY2FsY3VsYXRlIHRoZSBjbG9zZXN0
IHZhbHVlIGluIHRoZSANCnRhczI1NjNfZHZjX3RhYmxlLiBTb21ldGltZXMsIHRoZSB0YXJnZXQg
dmFsdWUgaXMgbm90IHNhbWUgYXMgdGhlIHZhbHVlIGluIHRoZSB0YWJsZS4gSXQgaXMNCndpc2Ug
dG8gZmluZCB0aGUgY2xvc2VzdCBvbmUuDQovKiBwb3coMTAsIGRiLzIwKSAqIHBvdygyLDMwKSAq
Lw0Kc3RhdGljIGNvbnN0IHVuc2lnbmVkIGNoYXIgdGFzMjU2M19kdmNfdGFibGVbXVs0XSA9IHsN
Cgl7IDBYMDAsIDBYMDAsIDBYMDAsIDBYMDAgfSwgLyogLTEyMS41ZGIgKi8NCgl7IDBYMDAsIDBY
MDAsIDBYMDMsIDBYQkMgfSwgLyogLTEyMS4wZGIgKi8NCgl7IDBYMDAsIDBYMDAsIDBYMDMsIDBY
RjUgfSwgLyogLTEyMC41ZGIgKi8NCi4uLg0KPiANCj4gLi4uDQo+IA0KPiA+ICtvdXQ6DQo+ID4g
KwltdXRleF91bmxvY2soJnRhc19kZXYtPmNvZGVjX2xvY2spOw0KPiANCj4gV2h5IG5vdCB1c2lu
ZyBjbGVhbnVwLmg/DQpbZGluZ10gQWNjZXB0Lg0KPiANCj4gPiArCXJldHVybiAwOw0KPiANCj4g
Li4uDQo+IA0KPiBUaGlzIGFsbCByZW1pbmRzIG1lIHRoYXQgSSBhbHJlYWR5IGdhdmUgc2FtZS9z
aW1pbGFyIGNvbW1lbnRzIGluIHRoZSBwYXN0Li4uDQo+IA0KPiANCj4gLS0NCj4gV2l0aCBCZXN0
IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KPiANCg0K
