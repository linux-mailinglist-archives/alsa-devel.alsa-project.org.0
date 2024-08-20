Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B319585A0
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 13:21:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8786B826;
	Tue, 20 Aug 2024 13:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8786B826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724152894;
	bh=uJxD9NJTKgfeFl9nLnAnjK1L7EHB2AV5MXUHqs31MDg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H1efl+69MfBAPWz24Jelhoa1pJX4aXCLhTR3uyDEw2b3ip0KeNnVJEiL0/JJPPUnI
	 jGjmlj5jm86fOUXFYsPIzj4Rgq3Z+oShD2A8we+LAu8KkvlNO3LkigrZJylbcU/eLJ
	 PbrI+NcPzhHiqSUS7kCJacqJDMR+hpqnNq3ubsZw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6861AF805B5; Tue, 20 Aug 2024 13:21:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D1A4F805AE;
	Tue, 20 Aug 2024 13:21:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F855F80494; Tue, 20 Aug 2024 13:20:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E749F80107
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 13:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E749F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=apK8CB1K
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47KBKZKf030549;
	Tue, 20 Aug 2024 06:20:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724152835;
	bh=uJxD9NJTKgfeFl9nLnAnjK1L7EHB2AV5MXUHqs31MDg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=apK8CB1K2dH3elGCkWOGTmWIUuGuNwO6zNaIDc3Qsyp1j2d+e5xxRwceekBG+m35U
	 GngW0JCp0oGAtxdgOLIPRpDtK/MFPdQHcJK1u2PEnGHO81l0OkANYo0as63QrD4O4e
	 Y6n/PFwTmn7mJk91kgeUiXkDYUEq6wprk0gbM3wU=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47KBKZvc040556
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Aug 2024 06:20:35 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Aug 2024 06:20:34 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Tue, 20 Aug 2024 06:20:34 -0500
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
        "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
        "Yue, Jaden" <jaden-yue@ti.com>,
        "yung-chuan.liao@linux.intel.com"
	<yung-chuan.liao@linux.intel.com>,
        "Rao, Dipa" <dipa@ti.com>, "yuhsuan@google.com" <yuhsuan@google.com>,
        "Lo, Henry" <henry.lo@ti.com>, "tiwai@suse.de" <tiwai@suse.de>,
        "Xu, Baojun" <baojun.xu@ti.com>,
        "Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
        "judyhsiao@google.com"
	<judyhsiao@google.com>,
        "Navada Kanyana, Mukund" <navada@ti.com>,
        "cujomalainey@google.com" <cujomalainey@google.com>,
        "Kutty, Aanya"
	<aanya@ti.com>,
        "Mahmud, Nayeem" <nayeem.mahmud@ti.com>,
        "savyasanchi.shukla@netradyne.com" <savyasanchi.shukla@netradyne.com>,
        "flaviopr@microsoft.com" <flaviopr@microsoft.com>,
        "Ji, Jesse"
	<jesse-ji@ti.com>,
        "darren.ye@mediatek.com" <darren.ye@mediatek.com>,
        "antheas.dk@gmail.com" <antheas.dk@gmail.com>,
        "Jerry2.Huang@lcfuturecenter.com" <Jerry2.Huang@lcfuturecenter.com>,
        "jim.shil@goertek.com" <jim.shil@goertek.com>
Subject: RE: [EXTERNAL] Re: [PATCH] ASoc: tas2781: replace devm_kzalloc and
 scnprintf with devm_kasprintf
Thread-Topic: [EXTERNAL] Re: [PATCH] ASoc: tas2781: replace devm_kzalloc and
 scnprintf with devm_kasprintf
Thread-Index: AQHa8r8qSJTi5oVeVEee2qU4MuN9dbIwSqOA//+1FXA=
Date: Tue, 20 Aug 2024 11:20:34 +0000
Message-ID: <8455a324c1a742e5a5dd1735acc121b2@ti.com>
References: <20240820050926.101-1-shenghao-ding@ti.com>
 <ZsRz7VOczPa8vQCW@smile.fi.intel.com>
In-Reply-To: <ZsRz7VOczPa8vQCW@smile.fi.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.14.152]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: 2UIZUHBT3H6OTUV5MVGIR47NXNQYWWDQ
X-Message-ID-Hash: 2UIZUHBT3H6OTUV5MVGIR47NXNQYWWDQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2UIZUHBT3H6OTUV5MVGIR47NXNQYWWDQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgQW5keQ0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgMjAsIDIwMjQgNjo0NiBQTQ0K
PiBUbzogRGluZywgU2hlbmdoYW8gPHNoZW5naGFvLWRpbmdAdGkuY29tPg0KPiBDYzogYnJvb25p
ZUBrZXJuZWwub3JnOyBsZ2lyZHdvb2RAZ21haWwuY29tOyBwZXJleEBwZXJleC5jejsgcGllcnJl
LQ0KPiBsb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbTsgMTM5MTYyNzUyMDZAMTM5LmNvbTsg
emhvdXJ1aUBodWFxaW4uY29tOw0KPiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7IFNhbGF6
YXIsIEl2YW4gPGktc2FsYXphckB0aS5jb20+Ow0KPiBsaWFtLnIuZ2lyZHdvb2RAaW50ZWwuY29t
OyBZdWUsIEphZGVuIDxqYWRlbi15dWVAdGkuY29tPjsgeXVuZy0NCj4gY2h1YW4ubGlhb0BsaW51
eC5pbnRlbC5jb207IFJhbywgRGlwYSA8ZGlwYUB0aS5jb20+OyB5dWhzdWFuQGdvb2dsZS5jb207
DQo+IExvLCBIZW5yeSA8aGVucnkubG9AdGkuY29tPjsgdGl3YWlAc3VzZS5kZTsgWHUsIEJhb2p1
biA8YmFvanVuLnh1QHRpLmNvbT47DQo+IEJhb2p1bi5YdUBmcHQuY29tOyBqdWR5aHNpYW9AZ29v
Z2xlLmNvbTsgTmF2YWRhIEthbnlhbmEsIE11a3VuZA0KPiA8bmF2YWRhQHRpLmNvbT47IGN1am9t
YWxhaW5leUBnb29nbGUuY29tOyBLdXR0eSwgQWFueWEgPGFhbnlhQHRpLmNvbT47DQo+IE1haG11
ZCwgTmF5ZWVtIDxuYXllZW0ubWFobXVkQHRpLmNvbT47DQo+IHNhdnlhc2FuY2hpLnNodWtsYUBu
ZXRyYWR5bmUuY29tOyBmbGF2aW9wckBtaWNyb3NvZnQuY29tOyBKaSwgSmVzc2UgPGplc3NlLQ0K
PiBqaUB0aS5jb20+OyBkYXJyZW4ueWVAbWVkaWF0ZWsuY29tOyBhbnRoZWFzLmRrQGdtYWlsLmNv
bTsNCj4gSmVycnkyLkh1YW5nQGxjZnV0dXJlY2VudGVyLmNvbTsgamltLnNoaWxAZ29lcnRlay5j
b20NCj4gU3ViamVjdDogW0VYVEVSTkFMXSBSZTogW1BBVENIXSBBU29jOiB0YXMyNzgxOiByZXBs
YWNlIGRldm1fa3phbGxvYyBhbmQNCj4gc2NucHJpbnRmIHdpdGggZGV2bV9rYXNwcmludGYNCj4g
DQo+IE9uIFR1ZSwgQXVnIDIwLCAyMDI0IGF0IDAxOuKAijA5OuKAijI0UE0gKzA4MDAsIFNoZW5n
aGFvIERpbmcgd3JvdGU6ID4gUmVwbGFjZQ0KPiBkZXZtX2t6YWxsb2MgYW5kIHNjbnByaW50ZiB3
aXRoIGRldm1fa2FzcHJpbnRmLiBXZSByZWZlciB0byBmdW5jdGlvbnMgYXMNCj4gZnVuYygpIFtt
aW5kIHRoZSBwYXJlbnRoZXNlc10uIC4u4oCKLiA+ICsgbmFtZSA9IGRldm1fa2FzcHJpbnRmKHRh
c19wcml2LT5kZXYsDQo+IEdGUF9LRVJORUwsIFpqUWNtUVJZRnBmcHRCYW5uZXJTdGFydCBUaGlz
IG1lc3NhZ2Ugd2FzIHNlbnQgZnJvbSBvdXRzaWRlDQo+IG9mIFRleGFzIEluc3RydW1lbnRzLg0K
PiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29n
bml6ZSB0aGUgc291cmNlIG9mIHRoaXMNCj4gZW1haWwgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMg
c2FmZS4NCj4gPGh0dHBzOi8vdXMtcGhpc2hhbGFybS0NCj4gZXd0LnByb29mcG9pbnQuY29tL0VX
VC92MS9HM3ZLIXVCZG5WWHZHTm9IVXdHOG9OdktMRUt4V3ptaFlHODINCj4gR3BzaXRSaE5zYjBQ
MW1PVkwwem5rUEFCWlVoNFBKNWxFZU1sV2JlTWtUM2FIS0dTS2p6cyQ+DQo+IFJlcG9ydCBTdXNw
aWNpb3VzDQo+IA0KPiBaalFjbVFSWUZwZnB0QmFubmVyRW5kDQo+IE9uIFR1ZSwgQXVnIDIwLCAy
MDI0IGF0IDAxOjA5OjI0UE0gKzA4MDAsIFNoZW5naGFvIERpbmcgd3JvdGU6DQo+ID4gUmVwbGFj
ZSBkZXZtX2t6YWxsb2MgYW5kIHNjbnByaW50ZiB3aXRoIGRldm1fa2FzcHJpbnRmLg0KPiANCj4g
V2UgcmVmZXIgdG8gZnVuY3Rpb25zIGFzIGZ1bmMoKSBbbWluZCB0aGUgcGFyZW50aGVzZXNdLg0K
PiANCj4gLi4uDQo+IA0KPiA+ICsJbmFtZSA9IGRldm1fa2FzcHJpbnRmKHRhc19wcml2LT5kZXYs
IEdGUF9LRVJORUwsICJTcGVha2VyIFByb2ZpbGUNCj4gPiArSWQiKTsNCj4gDQo+IFRoZXNlIHRo
cmVlIGRvIG5vdCB1c2UgYW55IGZvcm1hdHRpbmcgc3RyaW5ncy4gRWZmZWN0aXZlbHkgaXQgc2lt
cGx5DQo+IGRldm1fa3N0cmR1cCgpIGluIGFsbCBjYXNlcy4gQnV0IHNlZSB0aGUgUSBiZWxvdy4N
CkFjY2VwdC4NCj4gDQo+ID4gIAlpZiAoIW5hbWUpIHsNCj4gPiAgCQlyZXQgPSAtRU5PTUVNOw0K
PiA+ICAJCWdvdG8gb3V0Ow0KPiA+ICAJfQ0KPiANCj4gPiArCS8qIENyZWF0ZSBtaXhlciBpdGVt
cyBmb3Igc2VsZWN0aW5nIHRoZSBhY3RpdmUgUHJvZ3JhbSBhbmQgQ29uZmlnICovDQo+ID4gKwlw
cm9nX25hbWUgPSBkZXZtX2thc3ByaW50Zih0YXNfcHJpdi0+ZGV2LCBHRlBfS0VSTkVMLA0KPiA+
ICsJCSJTcGVha2VyIFByb2dyYW0gSWQiKTsNCj4gPiArCWlmICghcHJvZ19uYW1lKSB7DQo+ID4g
IAkJcmV0ID0gLUVOT01FTTsNCj4gPiAgCQlnb3RvIG91dDsNCj4gPiAgCX0NCj4gDQo+ID4gKwlj
b25mX25hbWUgPSBkZXZtX2thc3ByaW50Zih0YXNfcHJpdi0+ZGV2LCBHRlBfS0VSTkVMLA0KPiA+
ICAJCSJTcGVha2VyIENvbmZpZyBJZCIpOw0KPiA+ICsJaWYgKCFjb25mX25hbWUpIHsNCj4gPiAr
CQlyZXQgPSAtRU5PTUVNOw0KPiA+ICsJCWdvdG8gb3V0Ow0KPiA+ICsJfQ0KPiANCj4gU28sIHdo
eSBhbGwgdGhlc2UgbWF5IG5vdCBiZSBjb25zdGFudCBsaXRlcmFscyBhc3NpZ25lZCBkaXJlY3Rs
eSB0byB0aGUNCj4gcmVzcGVjdGl2ZSBkYXRhIHN0cnVjdHVyZXM/DQpUaGUgdG90YWwgb2YgUHJv
ZmlsZSwgY29uZmlnIGFuZCBwcm9ncmFtIGFyZSBkaWZmZXJlbnQgd2l0aCB0aGUgYmluIGZpbGUu
DQpJdCBjYW4ndCBiZSBzZXQgdG8gdGhlIGZpeGVkIHZhbHVlLg0KPiANCj4gLS0NCj4gV2l0aCBC
ZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KPiANCg0K
