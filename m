Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B82B795DC48
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Aug 2024 08:34:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C31D76C0;
	Sat, 24 Aug 2024 08:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C31D76C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724481277;
	bh=Wozygr5S/3Id/jp/revXbMXIJMm1UMcKeVrfWnU9yfg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kRUY8I624pLreVOTtLlQ+qGSwNYjAm0YMHdLiP92GbwTJsOwCne7vqHIXhZtCw06i
	 TpiTe3UP+me32s/43bhM04AGrLNBhGZKooHfvp+1vZ2bJREcZ/Hcgnz/zOBtCBDpGh
	 cS6I0OoXX0rOzkYmUM3LeRl+HtnKZsv+8pG26pXk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E1B1F805B5; Sat, 24 Aug 2024 08:34:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A564F805A1;
	Sat, 24 Aug 2024 08:34:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59AD7F80496; Sat, 24 Aug 2024 08:33:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 993F4F800F0
	for <alsa-devel@alsa-project.org>; Sat, 24 Aug 2024 08:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 993F4F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=lRUyvP6L
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47O6Xgjs087260;
	Sat, 24 Aug 2024 01:33:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724481222;
	bh=Wozygr5S/3Id/jp/revXbMXIJMm1UMcKeVrfWnU9yfg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=lRUyvP6LVJ46GoMKEbsoRQaN8iSpZ8R5p3Fzg4WcIQEaHptI1PUZ5J8FFiwVPBUXM
	 z0ZGyKdftdbbWwyvVWbmPRbYpgRt6VdE4gNZBGvNvDPmGRhoEdxOx2eycSMRjnRDQV
	 yMGzEn79n1DNqsQhL1ROdwOPhEnlvy7WhQT5afeU=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47O6Xg97011353
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 24 Aug 2024 01:33:42 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 24
 Aug 2024 01:33:42 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Sat, 24 Aug 2024 01:33:41 -0500
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
Thread-Index: AQHa9F0LRvAaxiQWWUmZ7ulmxGBD+7Izm8gAgACB0jCAAQ+7AIAAyBAQ
Date: Sat, 24 Aug 2024 06:33:41 +0000
Message-ID: <b9293d922c194d62b845c4ec6b1bf2b6@ti.com>
References: <20240822063205.662-1-shenghao-ding@ti.com>
 <Zsc-9PVnh8GpPrrP@smile.fi.intel.com>
 <0ec3e8f6fb404fee94fa9195cf67b044@ti.com>
 <ZsiPzPevJ0ucM-_5@smile.fi.intel.com>
In-Reply-To: <ZsiPzPevJ0ucM-_5@smile.fi.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.160.152]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: 2V6MBVRVRCIWMFUL5AG6TBL2HFND6APK
X-Message-ID-Hash: 2V6MBVRVRCIWMFUL5AG6TBL2HFND6APK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2V6MBVRVRCIWMFUL5AG6TBL2HFND6APK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgQW5keQ0KR2xhZCB0byBhbnN3ZXIgeW91ciBxdWVzdGlvbi4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtv
QGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBBdWd1c3QgMjMsIDIwMjQgOTozNCBQ
TQ0KPiBUbzogRGluZywgU2hlbmdoYW8gPHNoZW5naGFvLWRpbmdAdGkuY29tPg0KPiBDYzogYnJv
b25pZUBrZXJuZWwub3JnOyBsZ2lyZHdvb2RAZ21haWwuY29tOyBwZXJleEBwZXJleC5jejsgcGll
cnJlLQ0KPiBsb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbTsgMTM5MTYyNzUyMDZAMTM5LmNv
bTsgemhvdXJ1aUBodWFxaW4uY29tOw0KPiBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7IFNh
bGF6YXIsIEl2YW4gPGktc2FsYXphckB0aS5jb20+Ow0KPiBsaWFtLnIuZ2lyZHdvb2RAaW50ZWwu
Y29tOyBZdWUsIEphZGVuIDxqYWRlbi15dWVAdGkuY29tPjsgeXVuZy0NCj4gY2h1YW4ubGlhb0Bs
aW51eC5pbnRlbC5jb207IFJhbywgRGlwYSA8ZGlwYUB0aS5jb20+OyB5dWhzdWFuQGdvb2dsZS5j
b207DQo+IExvLCBIZW5yeSA8aGVucnkubG9AdGkuY29tPjsgdGl3YWlAc3VzZS5kZTsgWHUsIEJh
b2p1biA8YmFvanVuLnh1QHRpLmNvbT47DQo+IEJhb2p1bi5YdUBmcHQuY29tOyBqdWR5aHNpYW9A
Z29vZ2xlLmNvbTsgTmF2YWRhIEthbnlhbmEsIE11a3VuZA0KPiA8bmF2YWRhQHRpLmNvbT47IGN1
am9tYWxhaW5leUBnb29nbGUuY29tOyBLdXR0eSwgQWFueWEgPGFhbnlhQHRpLmNvbT47DQo+IE1h
aG11ZCwgTmF5ZWVtIDxuYXllZW0ubWFobXVkQHRpLmNvbT47DQo+IHNhdnlhc2FuY2hpLnNodWts
YUBuZXRyYWR5bmUuY29tOyBmbGF2aW9wckBtaWNyb3NvZnQuY29tOyBKaSwgSmVzc2UgPGplc3Nl
LQ0KPiBqaUB0aS5jb20+OyBkYXJyZW4ueWVAbWVkaWF0ZWsuY29tOyBhbnRoZWFzLmRrQGdtYWls
LmNvbTsNCj4gSmVycnkyLkh1YW5nQGxjZnV0dXJlY2VudGVyLmNvbTsgamltLnNoaWxAZ29lcnRl
ay5jb20NCj4gU3ViamVjdDogUmU6IFtFWFRFUk5BTF0gUmU6IFtQQVRDSCB2MV0gQVNvQzogdGFz
Mjc4MTogbWFyayBjb25zdCB2YXJpYWJsZXMNCj4gdGFzMjU2M19kdmNfdGFibGUgYXMgX19tYXli
ZV91bnVzZWQNCj4gDQo+IE9uIEZyaSwgQXVnIDIzLCAyMDI0IGF0IDAyOuKAijI0OuKAijE3QU0g
KzAwMDAsIERpbmcsIFNoZW5naGFvIHdyb3RlOiA+ID4gRnJvbToNCj4gQW5keSBTaGV2Y2hlbmtv
IDxhbmRyaXku4oCKc2hldmNoZW5rb0DigIpsaW51eC7igIppbnRlbC7igIpjb20+ID4gPiBTZW50
OiBUaHVyc2RheSwNCj4gQXVndXN0IDIyLCAyMDI0IDk64oCKMzcgUE0gPiA+IFRvOiBEaW5nLCBT
aGVuZ2hhbyA8c2hlbmdoYW8tZGluZ0DigIp0aS7igIpjb20+DQo+IFpqUWNtUVJZRnBmcHRCYW5u
ZXJTdGFydCBUaGlzIG1lc3NhZ2Ugd2FzIHNlbnQgZnJvbSBvdXRzaWRlIG9mIFRleGFzDQo+IElu
c3RydW1lbnRzLg0KPiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxl
c3MgeW91IHJlY29nbml6ZSB0aGUgc291cmNlIG9mIHRoaXMNCj4gZW1haWwgYW5kIGtub3cgdGhl
IGNvbnRlbnQgaXMgc2FmZS4NCj4gPGh0dHBzOi8vdXMtcGhpc2hhbGFybS0NCj4gZXd0LnByb29m
cG9pbnQuY29tL0VXVC92MS9HM3ZLIXVCZG5WWHlqZnlFUmdza2tOSG5zZjVEYzRCc3o1TkhZT3VT
DQo+IENBbE0tRUNtUHZFXy1KSkRkeVVadkRLbW5DN0U0UkFBYkViSUhNRkNGRHBtZjYtbyQ+DQo+
IFJlcG9ydCBTdXNwaWNpb3VzDQo+IA0KPiBaalFjbVFSWUZwZnB0QmFubmVyRW5kDQo+IE9uIEZy
aSwgQXVnIDIzLCAyMDI0IGF0IDAyOjI0OjE3QU0gKzAwMDAsIERpbmcsIFNoZW5naGFvIHdyb3Rl
Og0KPiA+ID4gRnJvbTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5p
bnRlbC5jb20+DQo+ID4gPiBTZW50OiBUaHVyc2RheSwgQXVndXN0IDIyLCAyMDI0IDk6MzcgUE0N
Cj4gPiA+IFRvOiBEaW5nLCBTaGVuZ2hhbyA8c2hlbmdoYW8tZGluZ0B0aS5jb20+IE9uIFRodSwg
QXVnIDIyLCAyMDI0IGF0DQo+ID4gPiAwMjozMjowMlBNICswODAwLCBTaGVuZ2hhbyBEaW5nIHdy
b3RlOg0KPiANCj4gLi4uDQo+IA0KPiA+ID4gPiAgLyogcG93KDEwLCBkYi8yMCkgKiBwb3coMiwz
MCkgKi8NCj4gPiA+ID4gLXN0YXRpYyBjb25zdCB1bnNpZ25lZCBjaGFyIHRhczI1NjNfZHZjX3Rh
YmxlW11bNF0gPSB7DQo+ID4gPiA+ICtzdGF0aWMgY29uc3QgX19tYXliZV91bnVzZWQgdW5zaWdu
ZWQgY2hhciB0YXMyNTYzX2R2Y190YWJsZVtdWzRdDQo+ID4gPiA+ICs9IHsNCj4gPiA+ID4gIAl7
IDBYMDAsIDBYMDAsIDBYMDAsIDBYMDAgfSwgLyogLTEyMS41ZGIgKi8NCj4gPiA+ID4gIAl7IDBY
MDAsIDBYMDAsIDBYMDMsIDBYQkMgfSwgLyogLTEyMS4wZGIgKi8NCj4gPiA+ID4gIAl7IDBYMDAs
IDBYMDAsIDBYMDMsIDBYRjUgfSwgLyogLTEyMC41ZGIgKi8NCj4gPiA+DQo+ID4gPiBBcyBmYXIg
YXMgSSBjYW4gc2VlIGluIHRoZSBsYXRlc3QgTGludXggTmV4dCB0aGUgYWJvdmUgbWVudGlvbmVk
DQo+ID4gPiB0YWJsZSBpcyB1c2VkIHNvbGVseSBpbiBzb3VuZC9zb2MvY29kZWNzL3RhczI3ODEt
aTJjLmMuIFdoeSBub3QNCj4gPiA+IG1vdmluZyBpdCB0byB0aGUgQyBmaWxlIGluc3RlYWQ/DQo+
ID4gV2UgaGF2ZSBhIGJpZyBwbGFuIHRvIGltcGxlbWVudCB0aGUgZGlnaXRhbCBnYWluIGZvciB0
YXMyNTYzIGluIHRoZQ0KPiA+IHNpZGUgY29kZWMgZHJpdmVyIHRvbywgc28gYWJzdHJhY3RlZCB0
aGlzIHRhYmxlIGludG8gYSBzZXBhcmF0ZWQgaGVhZGVyIGZpbGUuDQo+IA0KPiBTbywgdGhpcyBf
X21heWJlX3VudXNlZCBpcyBhIHRlbXBvcmFyeSBzdHViLCBjb3JyZWN0PyBKdXN0IGRvbid0IGZv
cmdldCB0bw0KPiByZW1vdmUgaXQgd2hlbiB0aGUgbWVudGlvbmVkIGZ1bmN0aW9uYWxpdHkgd2ls
bCBiZSByZWFkeS4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLg0KVG8gYWRkIF9f
bWF5YmVfdW51c2VkIGlzIG5vdCB0ZW1wb3JhcnksIGJlY2F1c2UgdGhpcyBkcml2ZXIgc3VwcG9y
dCBib3RoIA0KdGFzMjU2MyBhbmQgdGFzMjc4MSwgaWYgdGhlIGhhcmR3YXJlIG9ubHkgY29udGFp
bnMgdGFzMjc4MSBjaGlwcywgDQp0YXMyNTYzX2R2Y190YWJsZSBpcyBvYnZpb3VzbHkgdXNlbGVz
cywgc28gbWFya2VkIGl0IGFzIF9fbWF5YmVfdW51c2VkLg0KPiANCj4gLS0NCj4gV2l0aCBCZXN0
IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KPiANCg0K
