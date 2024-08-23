Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F8095C333
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2024 04:25:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9F0F822;
	Fri, 23 Aug 2024 04:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9F0F822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724379916;
	bh=UGlh9yspHplpkWToU5aW5eTq9Cbf5UKj3fuJEEKJyYY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MOIyI3jh5KERS9WyfBpPXEJIlEmpz6ZyHLkeqnGouRwM+pnxx5cv7TY+aW2czEwDT
	 N0/7+yCiZx8OONRkaQILdX7Qvv1GOwVPILIL1Ab61QX6S6YqMhF0d/6Mp7m+9utGY9
	 mphSrixv8COiWyH3x00xN6XyeFbHNr/G4LJowQ5I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0D72F8058C; Fri, 23 Aug 2024 04:24:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9E4DF805AF;
	Fri, 23 Aug 2024 04:24:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DA5AF80496; Fri, 23 Aug 2024 04:24:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1DB9F8025E
	for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2024 04:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1DB9F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=bgtTRCFK
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47N2OIfn106723;
	Thu, 22 Aug 2024 21:24:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724379858;
	bh=UGlh9yspHplpkWToU5aW5eTq9Cbf5UKj3fuJEEKJyYY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=bgtTRCFKu66l1N4+nYpW4giyoyrwXKSrj0x54wVfQffyco6B3r2U72mQdD5fv9Wlk
	 Nvn5n/bhxDxMaBg19oMsXnWzD9lQQJBhomwP92BOE2yIP63CmoaO5/68iirPhKz2BQ
	 +XxFJkQsQ6wqAf9E58QKkLsllFuxVRB8szIQ45Nc=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47N2OI8a126326
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Aug 2024 21:24:18 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Aug 2024 21:24:17 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Thu, 22 Aug 2024 21:24:17 -0500
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
Subject: RE: [EXTERNAL] Re: [PATCH v1] ASoC: tas2781: mark const variables
 tas2563_dvc_table as __maybe_unused
Thread-Topic: [EXTERNAL] Re: [PATCH v1] ASoC: tas2781: mark const variables
 tas2563_dvc_table as __maybe_unused
Thread-Index: AQHa9F0LRvAaxiQWWUmZ7ulmxGBD+7Izm8gAgACB0jA=
Date: Fri, 23 Aug 2024 02:24:17 +0000
Message-ID: <0ec3e8f6fb404fee94fa9195cf67b044@ti.com>
References: <20240822063205.662-1-shenghao-ding@ti.com>
 <Zsc-9PVnh8GpPrrP@smile.fi.intel.com>
In-Reply-To: <Zsc-9PVnh8GpPrrP@smile.fi.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.160.152]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: 5JGNDIXOR5AUQLHKLRE2MLR2KZI3VOZE
X-Message-ID-Hash: 5JGNDIXOR5AUQLHKLRE2MLR2KZI3VOZE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JGNDIXOR5AUQLHKLRE2MLR2KZI3VOZE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgQW5keQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHkgU2hl
dmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVy
c2RheSwgQXVndXN0IDIyLCAyMDI0IDk6MzcgUE0NCj4gVG86IERpbmcsIFNoZW5naGFvIDxzaGVu
Z2hhby1kaW5nQHRpLmNvbT4NCj4gQ2M6IGJyb29uaWVAa2VybmVsLm9yZzsgbGdpcmR3b29kQGdt
YWlsLmNvbTsgcGVyZXhAcGVyZXguY3o7IHBpZXJyZS0NCj4gbG91aXMuYm9zc2FydEBsaW51eC5p
bnRlbC5jb207IDEzOTE2Mjc1MjA2QDEzOS5jb207IHpob3VydWlAaHVhcWluLmNvbTsNCj4gYWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOyBTYWxhemFyLCBJdmFuIDxpLXNhbGF6YXJAdGkuY29t
PjsNCj4gbGlhbS5yLmdpcmR3b29kQGludGVsLmNvbTsgWXVlLCBKYWRlbiA8amFkZW4teXVlQHRp
LmNvbT47IHl1bmctDQo+IGNodWFuLmxpYW9AbGludXguaW50ZWwuY29tOyBSYW8sIERpcGEgPGRp
cGFAdGkuY29tPjsgeXVoc3VhbkBnb29nbGUuY29tOw0KPiBMbywgSGVucnkgPGhlbnJ5LmxvQHRp
LmNvbT47IHRpd2FpQHN1c2UuZGU7IFh1LCBCYW9qdW4gPGJhb2p1bi54dUB0aS5jb20+Ow0KPiBC
YW9qdW4uWHVAZnB0LmNvbTsganVkeWhzaWFvQGdvb2dsZS5jb207IE5hdmFkYSBLYW55YW5hLCBN
dWt1bmQNCj4gPG5hdmFkYUB0aS5jb20+OyBjdWpvbWFsYWluZXlAZ29vZ2xlLmNvbTsgS3V0dHks
IEFhbnlhIDxhYW55YUB0aS5jb20+Ow0KPiBNYWhtdWQsIE5heWVlbSA8bmF5ZWVtLm1haG11ZEB0
aS5jb20+Ow0KPiBzYXZ5YXNhbmNoaS5zaHVrbGFAbmV0cmFkeW5lLmNvbTsgZmxhdmlvcHJAbWlj
cm9zb2Z0LmNvbTsgSmksIEplc3NlIDxqZXNzZS0NCj4gamlAdGkuY29tPjsgZGFycmVuLnllQG1l
ZGlhdGVrLmNvbTsgYW50aGVhcy5ka0BnbWFpbC5jb207DQo+IEplcnJ5Mi5IdWFuZ0BsY2Z1dHVy
ZWNlbnRlci5jb207IGppbS5zaGlsQGdvZXJ0ZWsuY29tDQo+IFN1YmplY3Q6IFtFWFRFUk5BTF0g
UmU6IFtQQVRDSCB2MV0gQVNvQzogdGFzMjc4MTogbWFyayBjb25zdCB2YXJpYWJsZXMNCj4gdGFz
MjU2M19kdmNfdGFibGUgYXMgX19tYXliZV91bnVzZWQNCj4gDQo+IE9uIFRodSwgQXVnIDIyLCAy
MDI0IGF0IDAyOuKAijMyOuKAijAyUE0gKzA4MDAsIFNoZW5naGFvIERpbmcgd3JvdGU6ID4gSW4g
Y2FzZQ0KPiBvZiB0YXMyNzgxLCB0YXMyNTYzX2R2Y190YWJsZSB3aWxsIGJlIHVudXNlZCwgPiBz
byBtYXJrIGl0IGFzDQo+IF9fbWF5YmVfdW51c2VkLiAuLuKAii4gPiAvKiBwb3coMTAsIGRiLzIw
KSAqIHBvdygyLDMwKSAqLyA+IC1zdGF0aWMgY29uc3QNCj4gdW5zaWduZWQgY2hhciB0YXMyNTYz
X2R2Y190YWJsZVtdWzRdIFpqUWNtUVJZRnBmcHRCYW5uZXJTdGFydCBUaGlzDQo+IG1lc3NhZ2Ug
d2FzIHNlbnQgZnJvbSBvdXRzaWRlIG9mIFRleGFzIEluc3RydW1lbnRzLg0KPiBEbyBub3QgY2xp
Y2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc291
cmNlIG9mIHRoaXMNCj4gZW1haWwgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gPGh0
dHBzOi8vdXMtcGhpc2hhbGFybS0NCj4gZXd0LnByb29mcG9pbnQuY29tL0VXVC92MS9HM3ZLIXVC
ZG5WWDNzMTBFWDRjMWxNanVQMUtBWmQxRnRadThJRTN3DQo+IGUyNmxhLWxfcUUxcU9RWVNZU1lK
UDVLd1BGYVA4REEyUTd0ZHdGcVctWVhxekE1WSQ+DQo+IFJlcG9ydCBTdXNwaWNpb3VzDQo+IA0K
PiBaalFjbVFSWUZwZnB0QmFubmVyRW5kDQo+IE9uIFRodSwgQXVnIDIyLCAyMDI0IGF0IDAyOjMy
OjAyUE0gKzA4MDAsIFNoZW5naGFvIERpbmcgd3JvdGU6DQo+ID4gSW4gY2FzZSBvZiB0YXMyNzgx
LCB0YXMyNTYzX2R2Y190YWJsZSB3aWxsIGJlIHVudXNlZCwgc28gbWFyayBpdCBhcw0KPiA+IF9f
bWF5YmVfdW51c2VkLg0KPiANCj4gLi4uDQo+IA0KPiA+ICAvKiBwb3coMTAsIGRiLzIwKSAqIHBv
dygyLDMwKSAqLw0KPiA+IC1zdGF0aWMgY29uc3QgdW5zaWduZWQgY2hhciB0YXMyNTYzX2R2Y190
YWJsZVtdWzRdID0gew0KPiA+ICtzdGF0aWMgY29uc3QgX19tYXliZV91bnVzZWQgdW5zaWduZWQg
Y2hhciB0YXMyNTYzX2R2Y190YWJsZVtdWzRdID0gew0KPiA+ICAJeyAwWDAwLCAwWDAwLCAwWDAw
LCAwWDAwIH0sIC8qIC0xMjEuNWRiICovDQo+ID4gIAl7IDBYMDAsIDBYMDAsIDBYMDMsIDBYQkMg
fSwgLyogLTEyMS4wZGIgKi8NCj4gPiAgCXsgMFgwMCwgMFgwMCwgMFgwMywgMFhGNSB9LCAvKiAt
MTIwLjVkYiAqLw0KPiANCj4gQXMgZmFyIGFzIEkgY2FuIHNlZSBpbiB0aGUgbGF0ZXN0IExpbnV4
IE5leHQgdGhlIGFib3ZlIG1lbnRpb25lZCB0YWJsZSBpcyB1c2VkDQo+IHNvbGVseSBpbiBzb3Vu
ZC9zb2MvY29kZWNzL3RhczI3ODEtaTJjLmMuIFdoeSBub3QgbW92aW5nIGl0IHRvIHRoZSBDIGZp
bGUNCj4gaW5zdGVhZD8NCldlIGhhdmUgYSBiaWcgcGxhbiB0byBpbXBsZW1lbnQgdGhlIGRpZ2l0
YWwgZ2FpbiBmb3IgdGFzMjU2MyBpbiB0aGUgc2lkZSBjb2RlYyBkcml2ZXIgdG9vLCANCnNvIGFi
c3RyYWN0ZWQgdGhpcyB0YWJsZSBpbnRvIGEgc2VwYXJhdGVkIGhlYWRlciBmaWxlLg0KPiANCj4g
LS0NCj4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KPiANCg0K
