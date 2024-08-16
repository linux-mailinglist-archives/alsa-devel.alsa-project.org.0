Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4866B954B6C
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2024 15:56:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D52E2C21;
	Fri, 16 Aug 2024 15:55:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D52E2C21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723816562;
	bh=VUjevNzfCOhuSgfHK7hVllwqbQuOBOWFpozfCwYFreY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vqZEIKvp0JJxKi7uEUU8MRrYJX2QvoXoJazoZoq8VjWs4GE07tKfr45U6SY1Nlca/
	 tGjHqDsvIybsEJqoR5xiJeUiHANA4wZ/+O238UUdvXP3GvznCGoVdJY60f779viOqK
	 aWGPF+H48N4eKh8Fg9pWdunKyntnFSq5u44u1/Vc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CEC9F80602; Fri, 16 Aug 2024 15:55:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56C86F80601;
	Fri, 16 Aug 2024 15:55:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACEB5F80423; Fri, 16 Aug 2024 15:42:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78633F800B0
	for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2024 15:41:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78633F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=IgxlnkaO
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47GDfl3K039424;
	Fri, 16 Aug 2024 08:41:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723815707;
	bh=VUjevNzfCOhuSgfHK7hVllwqbQuOBOWFpozfCwYFreY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=IgxlnkaOoeE6Xb1ZIgzGKVoiv3/WJh3oau5jgBDKUH+ctlMRfZOlZISI0Wht/0sjF
	 +jCrCU+5vx2lLDcoR7635YGfC66Eb2kuwb16UZ8R97WVpwCuHVq+b0GGMWLq44Cues
	 RBvnOT/GUxwtMSGmv/RQO8GMwOCCbi3cVQIgbe1I=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47GDfldZ040821
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Aug 2024 08:41:47 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 16
 Aug 2024 08:41:46 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Fri, 16 Aug 2024 08:41:46 -0500
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
        "Jerry2.Huang@lcfuturecenter.com" <Jerry2.Huang@lcfuturecenter.com>
Subject: RE: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: Rename dai_driver name
 to unify the name between TAS2563 and TAS2781
Thread-Topic: [EXTERNAL] Re: [PATCH v1] ASoc: tas2781: Rename dai_driver name
 to unify the name between TAS2563 and TAS2781
Thread-Index: AQHa5VUVVJh0PH35uk6MrsBIXoZO8rIkKEGAgAOLIdCAAOxGgIABVSlQ
Date: Fri, 16 Aug 2024 13:41:46 +0000
Message-ID: <2a4f9f583b5e4495b9fb50a446c2c949@ti.com>
References: <20240803032717.175-1-shenghao-ding@ti.com>
 <ZrovmRCPN7pc0n40@smile.fi.intel.com>
 <9ec30bafdec441078828cb0d7be93342@ti.com>
 <Zr3uwfNLtTdJWrz4@smile.fi.intel.com>
In-Reply-To: <Zr3uwfNLtTdJWrz4@smile.fi.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.160.152]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: UWS47Z7CAOYLTBO32XQ2O5YJH7I74LDA
X-Message-ID-Hash: UWS47Z7CAOYLTBO32XQ2O5YJH7I74LDA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UWS47Z7CAOYLTBO32XQ2O5YJH7I74LDA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgQW5keQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHkgU2hl
dmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVy
c2RheSwgQXVndXN0IDE1LCAyMDI0IDg6MDQgUE0NCj4gVG86IERpbmcsIFNoZW5naGFvIDxzaGVu
Z2hhby1kaW5nQHRpLmNvbT4NCj4gQ2M6IGJyb29uaWVAa2VybmVsLm9yZzsgbGdpcmR3b29kQGdt
YWlsLmNvbTsgcGVyZXhAcGVyZXguY3o7IHBpZXJyZS0NCj4gbG91aXMuYm9zc2FydEBsaW51eC5p
bnRlbC5jb207IDEzOTE2Mjc1MjA2QDEzOS5jb207IHpob3VydWlAaHVhcWluLmNvbTsNCj4gYWxz
YS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOyBTYWxhemFyLCBJdmFuIDxpLXNhbGF6YXJAdGkuY29t
PjsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IENoYWRoYSwgSmFzam90IFNpbmdo
IDxqLWNoYWRoYUB0aS5jb20+Ow0KPiBsaWFtLnIuZ2lyZHdvb2RAaW50ZWwuY29tOyBZdWUsIEph
ZGVuIDxqYWRlbi15dWVAdGkuY29tPjsgeXVuZy0NCj4gY2h1YW4ubGlhb0BsaW51eC5pbnRlbC5j
b207IFJhbywgRGlwYSA8ZGlwYUB0aS5jb20+OyB5dWhzdWFuQGdvb2dsZS5jb207DQo+IExvLCBI
ZW5yeSA8aGVucnkubG9AdGkuY29tPjsgdGl3YWlAc3VzZS5kZTsgWHUsIEJhb2p1biA8YmFvanVu
Lnh1QHRpLmNvbT47DQo+IHNveWVyQGlybC5odTsgQmFvanVuLlh1QGZwdC5jb207IGp1ZHloc2lh
b0Bnb29nbGUuY29tOyBOYXZhZGEgS2FueWFuYSwNCj4gTXVrdW5kIDxuYXZhZGFAdGkuY29tPjsg
Y3Vqb21hbGFpbmV5QGdvb2dsZS5jb207IEt1dHR5LCBBYW55YQ0KPiA8YWFueWFAdGkuY29tPjsg
TWFobXVkLCBOYXllZW0gPG5heWVlbS5tYWhtdWRAdGkuY29tPjsNCj4gc2F2eWFzYW5jaGkuc2h1
a2xhQG5ldHJhZHluZS5jb207IGZsYXZpb3ByQG1pY3Jvc29mdC5jb207IEppLCBKZXNzZSA8amVz
c2UtDQo+IGppQHRpLmNvbT47IGRhcnJlbi55ZUBtZWRpYXRlay5jb207IGFudGhlYXMuZGtAZ21h
aWwuY29tOw0KPiBKZXJyeTIuSHVhbmdAbGNmdXR1cmVjZW50ZXIuY29tDQo+IFN1YmplY3Q6IFJl
OiBbRVhURVJOQUxdIFJlOiBbUEFUQ0ggdjFdIEFTb2M6IHRhczI3ODE6IFJlbmFtZSBkYWlfZHJp
dmVyDQo+IG5hbWUgdG8gdW5pZnkgdGhlIG5hbWUgYmV0d2VlbiBUQVMyNTYzIGFuZCBUQVMyNzgx
DQo+IA0KPiBPbiBUaHUsIEF1ZyAxNSwgMjAyNCBhdCAwMzrigIowMjrigIowMUFNICswMDAwLCBE
aW5nLCBTaGVuZ2hhbyB3cm90ZTogPiA+IEZyb206DQo+IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5
LuKAinNoZXZjaGVua29A4oCKbGludXgu4oCKaW50ZWwu4oCKY29tPiA+ID4gU2VudDogTW9uZGF5
LA0KPiBBdWd1c3QgMTIsIDIwMjQgMTE64oCKNTIgUE0gPiA+IE9uIFNhdCwgQXVnIDAzLCAyMDI0
IGF0IDExOuKAijI3OuKAijE0QU0gKzA4MDAsDQo+IFNoZW5naGFvIFpqUWNtUVJZRnBmcHRCYW5u
ZXJTdGFydCBUaGlzIG1lc3NhZ2Ugd2FzIHNlbnQgZnJvbSBvdXRzaWRlIG9mDQo+IFRleGFzIElu
c3RydW1lbnRzLg0KPiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxl
c3MgeW91IHJlY29nbml6ZSB0aGUgc291cmNlIG9mIHRoaXMNCj4gZW1haWwgYW5kIGtub3cgdGhl
IGNvbnRlbnQgaXMgc2FmZS4NCj4gPGh0dHBzOi8vdXMtcGhpc2hhbGFybS0NCj4gZXd0LnByb29m
cG9pbnQuY29tL0VXVC92MS9HM3ZLIXVCZG5WVmZuM29mVTVZN290bHpQTkh6OHFLLQ0KPiAySUp5
ZmtwYzcyMmQzTHhMZFQzVEdLOGU2RVc5QjEtajF5MVB0QXdFS0poci11ZTM5ekRRLVFaQSQ+DQo+
IFJlcG9ydCBTdXNwaWNpb3VzDQo+IA0KPiBaalFjbVFSWUZwZnB0QmFubmVyRW5kDQo+IE9uIFRo
dSwgQXVnIDE1LCAyMDI0IGF0IDAzOjAyOjAxQU0gKzAwMDAsIERpbmcsIFNoZW5naGFvIHdyb3Rl
Og0KPiA+ID4gRnJvbTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5p
bnRlbC5jb20+DQo+ID4gPiBTZW50OiBNb25kYXksIEF1Z3VzdCAxMiwgMjAyNCAxMTo1MiBQTSBP
biBTYXQsIEF1ZyAwMywgMjAyNCBhdA0KPiA+ID4gMTE6Mjc6MTRBTSArMDgwMCwgU2hlbmdoYW8g
RGluZyB3cm90ZToNCj4gDQo+IC4uLg0KPiANCj4gPiA+ID4gKwlzdHJzY3B5KG5hbWUsICJTcGVh
a2VyIFByb2ZpbGUgSWQiLA0KPiA+ID4gU05EUlZfQ1RMX0VMRU1fSURfTkFNRV9NQVhMRU4pOw0K
PiA+ID4NCj4gPiA+ID4gKwlzdHJzY3B5KHByb2dfbmFtZSwgIlNwZWFrZXIgUHJvZ3JhbSBJZCIs
DQo+ID4gPiA+ICsJCVNORFJWX0NUTF9FTEVNX0lEX05BTUVfTUFYTEVOKTsNCj4gPiA+DQo+ID4g
PiA+ICsJc3Ryc2NweShjb25mX25hbWUsICJTcGVha2VyIENvbmZpZyBJZCIsDQo+ID4gPiA+ICtT
TkRSVl9DVExfRUxFTV9JRF9OQU1FX01BWExFTik7DQo+ID4gPg0KPiA+ID4gV2h5IG5vdCAyLXBh
cmFtZXRlciBzdHJzY3B5KCk/DQo+ID4gc3Ryc2NweSBzZWVtZWQgbm90IHN1cHBvcnQgMiBwYXJh
bXMuIERvIHlvdSBtZWFuIHN0cmNweT8NCj4gDQo+IDEuIEl0IGRvZXMuDQo+IDIuIE5vLCBJIG1l
YW50IHN0cnNjcHkoKS4NCkkgaGF2ZSB0cmllZCAyLXBhcmFtZXRlciBzdHJzY3B5KCksIGFuZCBv
Y2N1cnJlZCBjb21waWxpbmcgaXNzdWUuDQpUaGUgZmlyc3QgcGFyYW1ldGVyIG9mIHN0cnNjcHks
ICpkc3QsIG11c3QgYmUgYXJyYXksIGJ1dCBpbiB0aGlzIGNvZGUNCnByb2dfbmFtZSBhbmQgY29u
Zl9uYW1lIGFyZSBwb2ludHMgdG8gdGhlIG1lbW9yaWVzIGFwcGxpZWQgYnkNCmRldm1fa2NhbGxv
Yy4NCj4gDQo+IC0tDQo+IFdpdGggQmVzdCBSZWdhcmRzLA0KPiBBbmR5IFNoZXZjaGVua28NCj4g
DQoNCg==
