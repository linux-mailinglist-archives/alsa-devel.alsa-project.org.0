Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 263957B66B8
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 12:48:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F61784A;
	Tue,  3 Oct 2023 12:47:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F61784A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696330099;
	bh=kBRAUO6favdD8VoxbEZGoFsIKRMDsC3ue1rjqIaMYcY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nt8L/iqv1RVDjsfmBtkeip/rQ9Mr/QEkq8KmD9BTOeJhBqwJfoFsg0k+oewGhxCZ0
	 mIj7AQM5lNSWXvOtH8Z703TkinIom6DNRKQgzRIGiOGua0mpLCbQtUPEyxkJdn2OrQ
	 BOc05OcfTrlFtT4s+zUA8dyDsJCKXwP3k+SuanHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFF7DF80310; Tue,  3 Oct 2023 12:47:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68568F80310;
	Tue,  3 Oct 2023 12:47:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FDDAF8047D; Tue,  3 Oct 2023 12:47:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCECDF80130
	for <alsa-devel@alsa-project.org>; Tue,  3 Oct 2023 12:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCECDF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=ugMv2U2Z
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 393Akc7U045116;
	Tue, 3 Oct 2023 05:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696329998;
	bh=kBRAUO6favdD8VoxbEZGoFsIKRMDsC3ue1rjqIaMYcY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=ugMv2U2ZQdsIH+1d3iVShIzHhw1MZ9+uKCcm14OVOorSYCH3fTebt9dNiSYghNCKP
	 kmv50YTFcvYsTJUHnVK3+YRjDwLNZfFFtlfIwbBnHaQ6Y+ff3J46vz0c4YqgqnvVWd
	 riu2oLLhUEGnEX/MuvPpqbg0bI1075Gs9L7MPRVE=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 393AkcWH123050
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Oct 2023 05:46:38 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Oct 2023 05:46:37 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Tue, 3 Oct 2023 05:46:37 -0500
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "broonie@kernel.org" <broonie@kernel.org>,
        "robh+dt@kernel.org"
	<robh+dt@kernel.org>,
        "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>,
        "lgirdwood@gmail.com"
	<lgirdwood@gmail.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "Lu, Kevin" <kevin-lu@ti.com>,
        "13916275206@139.com" <13916275206@139.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "liam.r.girdwood@intel.com"
	<liam.r.girdwood@intel.com>,
        "mengdong.lin@intel.com"
	<mengdong.lin@intel.com>,
        "Xu, Baojun" <baojun.xu@ti.com>,
        "thomas.gfeller@q-drop.com" <thomas.gfeller@q-drop.com>,
        "Gupta, Peeyush"
	<peeyush@ti.com>,
        "Navada Kanyana, Mukund" <navada@ti.com>,
        "tiwai@suse.de"
	<tiwai@suse.de>
Subject: RE: [EXTERNAL] Re: [PATCH v1] ASoC: tas2781: fixed compiling issue in
 m68k
Thread-Topic: [EXTERNAL] Re: [PATCH v1] ASoC: tas2781: fixed compiling issue
 in m68k
Thread-Index: AQHZ9Q98WH2DuXFcNE+9p+JTDyUKy7A3NcmAgACtiIA=
Date: Tue, 3 Oct 2023 10:46:37 +0000
Message-ID: <79c4d534ad20452c992d8ace138e4384@ti.com>
References: <20231002090434.1896-1-shenghao-ding@ti.com>
 <CAMuHMdXr5oRgkFqYZnPe3Xdyq_QjtzhfL8Wa_e9JA0S1XhEhWw@mail.gmail.com>
In-Reply-To: 
 <CAMuHMdXr5oRgkFqYZnPe3Xdyq_QjtzhfL8Wa_e9JA0S1XhEhWw@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.162.101]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: 2KCWPUD3HEE4Q4T7PHJZUNH3S3HC6GDH
X-Message-ID-Hash: 2KCWPUD3HEE4Q4T7PHJZUNH3S3HC6GDH
X-MailFrom: shenghao-ding@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2KCWPUD3HEE4Q4T7PHJZUNH3S3HC6GDH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogVHVlc2RheSwgT2N0b2JlciAzLCAy
MDIzIDM6MjQgQU0NCj4gVG86IERpbmcsIFNoZW5naGFvIDxzaGVuZ2hhby1kaW5nQHRpLmNvbT4N
Cj4gQ2M6IGJyb29uaWVAa2VybmVsLm9yZzsgcm9iaCtkdEBrZXJuZWwub3JnOw0KPiBhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb207IGxnaXJkd29vZEBnbWFpbC5jb207IHBlcmV4QHBl
cmV4LmN6Ow0KPiBwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb207IEx1LCBLZXZp
biA8a2V2aW4tbHVAdGkuY29tPjsNCj4gMTM5MTYyNzUyMDZAMTM5LmNvbTsgYWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGlhbS5y
LmdpcmR3b29kQGludGVsLmNvbTsgbWVuZ2RvbmcubGluQGludGVsLmNvbTsNCj4gWHUsIEJhb2p1
biA8YmFvanVuLnh1QHRpLmNvbT47IHRob21hcy5nZmVsbGVyQHEtZHJvcC5jb207IEd1cHRhLCBQ
ZWV5dXNoDQo+IDxwZWV5dXNoQHRpLmNvbT47IE5hdmFkYSBLYW55YW5hLCBNdWt1bmQgPG5hdmFk
YUB0aS5jb20+Ow0KPiB0aXdhaUBzdXNlLmRlDQo+IFN1YmplY3Q6IFtFWFRFUk5BTF0gUmU6IFtQ
QVRDSCB2MV0gQVNvQzogdGFzMjc4MTogZml4ZWQgY29tcGlsaW5nIGlzc3VlIGluDQo+IG02OGsN
Cj4gDQo+IEhpIFNoZW5naGFvLA0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4g
T24gTW9uLCBPY3QgMiwgMjAyMyBhdCA0OjM44oCvUE0gU2hlbmdoYW8gRGluZyA8c2hlbmdoYW8t
ZGluZ0B0aS5jb20+DQo+IHdyb3RlOg0KPiA+IGZpeGVkIG02OGsgY29tcGlsaW5nIGlzc3VlOiBt
YXBwaW5nIHRhYmxlIGNhbiBzYXZlIGNvZGUgZmllbGQ7IHN0b3JpbmcNCj4gPiB0aGUNCj4gDQo+
IFBsZWFzZSByZXBsaWNhdGUgdGhlIGFjdHVhbCBlcnJvciBtZXNzYWdlIGZyb20gdGhlIGNvbXBp
bGVyLCBzbyBpdCBpcyByZWNvcmRlZCBpbg0KPiB0aGUgY29tbWl0IGRlc2NyaXB0aW9uLCBhbmQg
ZWFzeSB0byBmaW5kIHdoZW4gc29tZW9uZSBzZWFyY2hlcyBmb3IgdGhlIGFjdHVhbA0KPiBlcnJv
ciBtZXNzYWdlDQo+IA0KPiBGcm9tIHRoZSBSZXBvcnRlZC1ieSAod2hpY2ggaXMgbm90IGluY2x1
ZGVkIGluIHRoZSBhY3R1YWwgZGVzY3JpcHRpb24sIGFzIGl0IGlzDQo+IGJlbG93IHRoZSAiLS0t
Iik6DQo+IA0KPiAgICAgICAge3N0YW5kYXJkIGlucHV0fTogQXNzZW1ibGVyIG1lc3NhZ2VzOg0K
PiAgICAgPj4ge3N0YW5kYXJkIGlucHV0fTo5OTI6IEVycm9yOiB2YWx1ZSAtMTQ4IG91dCBvZiBy
YW5nZQ0KPiAgICAgICAge3N0YW5kYXJkIGlucHV0fTo5OTI6IEVycm9yOiB2YWx1ZSBvZiBmZmZm
ZmY2YyB0b28gbGFyZ2UgZm9yIGZpZWxkIG9mIDEgYnl0ZSBhdA0KPiAwMDAwMDQ1Zg0KPiANCj4g
PiBkZXZfaWR4IGFzIGEgbWVtYmVyIG9mIGJsb2NrIGNhbiByZWR1Y2UgdW5uZWNlc3NhcnkgIHRp
bWUgYW5kIHN5c3RlbQ0KPiA+IHJlc291cmNlIGNvbXN1bXB0aW9uIG9mIGRldl9pZHggbWFwcGlu
ZyBldmVyeSB0aW1lIHRoZSBibG9jayBkYXRhDQo+ID4gd3JpdGluZyB0byB0aGUgZHNwLg0KPiAN
Cj4gSSBhbSBzb3JyeSwgYnV0IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHRoaXMgbWVhbnMuDQo+
IENhbiB5b3UgcGxlYXNlIGVsYWJvcmF0ZT8NCj4gDQo+IEFsc28sIGNhbiB5b3UgcGxlYXNlIGV4
cGxhaW4gd2hhdCB0aGUgcmVhbCBpc3N1ZSBpcz8NCj4gKE15IGZpcnN0IGd1ZXNzIHdoZW4gc2Vl
aW5nIHRoZSBlcnJvciBtZXNzYWdlIGJlZm9yZSB3YXMgdGhhdCBhICBzaWduZWQNCj4gaW50ZWdl
ciBpcyB0cnVuY2F0ZWQgdG8gYW4gdW5zaWduZWQgY2hhciBvciBzbywgYnV0IEkgY291bGRuJ3Qg
c2VlICBpbW1lZGlhdGVseQ0KPiB3aGVyZSB0aGF0IGlzIGhhcHBlbmluZykNClNvcnJ5IHRvIGxh
dGUgZmVlZGJhY2suIEkgaGFkIGJlZW4gdHJvdWJsZWQgYnkgdGhpcyBpc3N1ZSBmb3Igc2V2ZXJh
bCB3ZWVrcy4gQXQgZmlyc3QsIEkgYWxzbyB0aGluayBpdCB3b3VsZCBvbmUgb2YgdmFyaWFibGVz
IG92ZXJmbG93LCBhY2NvcmRpbmcgdG8gdGhlIGNvbXBpbGluZyBlcnJvciBtZXNzYWdlLiBIb3dl
dmVyLCBhZnRlciBpbnZlc3RpZ2F0aW9uLCBubyByZXN1bHQgY2FtZSBvdXQuIEluIGZhY3QsIGNv
bXBpbGVyIHdpbGwgcmVwb3J0IHRoZSBsaW5lIG51bWJlciB3aGVyZSB0aGUgdmFyaWFibGUgb3Zl
cmZsb3cgaXMsIGlmIHRoZXJlIHdhcyByaXNrIG9uIHRoZSB2YXJpYWJsZSBvdmVyZmxvdy4gWWV0
LCB0aGlzIGNvbXBpbGluZyBlcnJvciBkaWQgbm90IHJlcG9ydCBhbnkgbGluZSBudW1iZXIuIEZp
bmFsbHksIEkgZGlkbuKAmXQgcmVhbGl6ZSB0aGF0IGl0IHdvdWxkIGJlIHRoZSBjb2RlIHNlY3Rp
b24gb3ZlcmZsb3cgdW50aWwgdGhhdCBjb21waWxpbmcgZXJyb3IgbWVzc2FnZSBtYWdpY2FsbHkg
ZGlzYXBwZWFyZWQsIG9uZSBkYXkgSSByZW1vdmVkIHNvbWUgZnVuY3Rpb25zIGluIHRoZSB0YXMy
NzgxLWZ3bGliLmMuIFNvLCBJIGJlZ2FuIHRvIHNpbXBsaWZ5IHNvbWUgZnVuY3Rpb25zIGluIHRo
ZSBjb2RlLg0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaGVuZ2hhbyBEaW5nIDxzaGVuZ2hhby1k
aW5nQHRpLmNvbT4NCj4gPg0KPiA+IC0tLQ0KPiA+IENoYW5nZXMgaW4gdjE6DQo+ID4gIC0gfCBS
ZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+ID4gICAgfCBD
bG9zZXM6DQo+ID4gICAgfCBodHRwczovL2xvcmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIw
MjMwOTIyMjA0OC5SblNxRUlLNS1sa3BAaW50ZWwuDQo+ID4gICAgfCBjb20vDQo+IA0KPiA+IC0t
LSBhL2luY2x1ZGUvc291bmQvdGFzMjc4MS1kc3AuaA0KPiA+ICsrKyBiL2luY2x1ZGUvc291bmQv
dGFzMjc4MS1kc3AuaA0KPiA+IEBAIC03Nyw2ICs3NywxMSBAQCBzdHJ1Y3QgdGFzZGV2X2JsayB7
DQo+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgbnJfY21kczsNCj4gPiAgICAgICAgIHVuc2lnbmVk
IGludCBibGtfc2l6ZTsNCj4gPiAgICAgICAgIHVuc2lnbmVkIGludCBucl9zdWJibG9ja3M7DQo+
ID4gKyAgICAgICAvKiBmaXhlZCBtNjhrIGNvbXBpbGluZyBpc3N1ZSwgc3RvcmluZyB0aGUgZGV2
X2lkeCBhcyBhIG1lbWJlciBvZiBibG9jaw0KPiA+ICsgICAgICAgICogY2FuIHJlZHVjZSB1bm5l
Y2Vzc2FyeSB0aW1lYW5kIHN5c3RlbSByZXNvdXJjZSBjb21zdW1wdGlvbiBvZg0KPiA+ICsgICAg
ICAgICogZGV2X2lkeCBtYXBwaW5nIGV2ZXJ5IHRpbWUgdGhlIGJsb2NrIGRhdGEgd3JpdGluZyB0
byB0aGUgZHNwLg0KPiA+ICsgICAgICAgICovDQo+IA0KPiBXaGF0IGlzIHNvIHNwZWNpYWwgYWJv
dXQgIm02OGsiIHRoYXQgaXQgKDEpIGZhaWxzIHRoZXJlIChhbmQgb25seSB0aGVyZT8NCj4gYW5k
IG9ubHkgZm9yIHNvbWUgY29uZmlnL2NvbXBpbGVyIGNvbWJvcywgYXMgaXQgYnVpbGRzIGZpbmUg
Zm9yIG1lPyksIGFuZCAoMikgaXMNCj4gbmVlZGVkIHRvIG1lbnRpb24gdGhpcyBpbiBjb21tZW50
cyBhbGwgb3ZlciB0aGUgcGxhY2U/DQo+IA0KPiA+ICsgICAgICAgdW5zaWduZWQgY2hhciBkZXZf
aWR4Ow0KPiA+ICAgICAgICAgdW5zaWduZWQgY2hhciAqZGF0YTsNCj4gPiAgfTsNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvY29kZWNzL3RhczI3ODEtZm13bGliLmMNCj4gPiBiL3Nv
dW5kL3NvYy9jb2RlY3MvdGFzMjc4MS1mbXdsaWIuYw0KPiA+IGluZGV4IGViNTVhYmFlMGQ3Yi4u
ZTI3Nzc1ZDgzNGU5IDEwMDY0NA0KPiA+IC0tLSBhL3NvdW5kL3NvYy9jb2RlY3MvdGFzMjc4MS1m
bXdsaWIuYw0KPiA+ICsrKyBiL3NvdW5kL3NvYy9jb2RlY3MvdGFzMjc4MS1mbXdsaWIuYw0KPiA+
IEBAIC04MCwxMCArODAsNzIgQEAgc3RydWN0IHRhc19jcmMgew0KPiA+ICAgICAgICAgdW5zaWdu
ZWQgY2hhciBsZW47DQo+ID4gIH07DQo+ID4NCj4gPiArc3RydWN0IGJsa3R5cF9kZXZpZHhfbWFw
IHsNCj4gPiArICAgICAgIHVuc2lnbmVkIGNoYXIgYmxrdHlwOw0KPiA+ICsgICAgICAgdW5zaWdu
ZWQgY2hhciBkZXZfaWR4Ow0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAgc3RhdGljIGNvbnN0IGNoYXIg
ZGV2aWNlTnVtYmVyW1RBU0RFVklDRV9EU1BfVEFTX01BWF9ERVZJQ0VdID0gew0KPiA+ICAgICAg
ICAgMSwgMiwgMSwgMiwgMSwgMSwgMCwgMiwgNCwgMywgMSwgMiwgMywgNCAgfTsNCj4gPg0KPiA+
ICsvKiBmaXhlZCBtNjhrIGNvbXBpbGluZyBpc3N1ZTogbWFwcGluZyB0YWJsZSBjYW4gc2F2ZSBj
b2RlIGZpZWxkICovDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYmxrdHlwX2RldmlkeF9tYXAg
cHBjM190YXMyNzgxX21hcHBpbmdfdGFibGVbXSA9IHsNCj4gPiArICAgICAgIHsgTUFJTl9BTExf
REVWSUNFU18xWCwgMHg4MCB9LA0KPiA+ICsgICAgICAgeyBNQUlOX0RFVklDRV9BXzFYLCAweDgx
IH0sDQo+ID4gKyAgICAgICB7IENPRUZGX0RFVklDRV9BXzFYLCAweEMxIH0sDQo+ID4gKyAgICAg
ICB7IFBSRV9ERVZJQ0VfQV8xWCwgMHhDMSB9LA0KPiA+ICsgICAgICAgeyBQUkVfU09GVFdBUkVf
UkVTRVRfREVWSUNFX0EsIDB4QzEgfSwNCj4gPiArICAgICAgIHsgUE9TVF9TT0ZUV0FSRV9SRVNF
VF9ERVZJQ0VfQSwgMHhDMSB9LA0KPiA+ICsgICAgICAgeyBNQUlOX0RFVklDRV9CXzFYLCAweDgy
IH0sDQo+ID4gKyAgICAgICB7IENPRUZGX0RFVklDRV9CXzFYLCAweEMyIH0sDQo+ID4gKyAgICAg
ICB7IFBSRV9ERVZJQ0VfQl8xWCwgMHhDMiB9LA0KPiA+ICsgICAgICAgeyBQUkVfU09GVFdBUkVf
UkVTRVRfREVWSUNFX0IsIDB4QzIgfSwNCj4gPiArICAgICAgIHsgUE9TVF9TT0ZUV0FSRV9SRVNF
VF9ERVZJQ0VfQiwgMHhDMiB9LA0KPiA+ICsgICAgICAgeyBNQUlOX0RFVklDRV9DXzFYLCAweDgz
IH0sDQo+ID4gKyAgICAgICB7IENPRUZGX0RFVklDRV9DXzFYLCAweEMzIH0sDQo+ID4gKyAgICAg
ICB7IFBSRV9ERVZJQ0VfQ18xWCwgMHhDMyB9LA0KPiA+ICsgICAgICAgeyBQUkVfU09GVFdBUkVf
UkVTRVRfREVWSUNFX0MsIDB4QzMgfSwNCj4gPiArICAgICAgIHsgUE9TVF9TT0ZUV0FSRV9SRVNF
VF9ERVZJQ0VfQywgMHhDMyB9LA0KPiA+ICsgICAgICAgeyBNQUlOX0RFVklDRV9EXzFYLCAweDg0
IH0sDQo+ID4gKyAgICAgICB7IENPRUZGX0RFVklDRV9EXzFYLCAweEM0IH0sDQo+ID4gKyAgICAg
ICB7IFBSRV9ERVZJQ0VfRF8xWCwgMHhDNCB9LA0KPiA+ICsgICAgICAgeyBQUkVfU09GVFdBUkVf
UkVTRVRfREVWSUNFX0QsIDB4QzQgfSwNCj4gPiArICAgICAgIHsgUE9TVF9TT0ZUV0FSRV9SRVNF
VF9ERVZJQ0VfRCwgMHhDNCB9LCB9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBi
bGt0eXBfZGV2aWR4X21hcCBwcGMzX21hcHBpbmdfdGFibGVbXSA9IHsNCj4gPiArICAgICAgIHsg
TUFJTl9BTExfREVWSUNFU18xWCwgMHg4MCB9LA0KPiA+ICsgICAgICAgeyBNQUlOX0RFVklDRV9B
XzFYLCAweDgxIH0sDQo+ID4gKyAgICAgICB7IENPRUZGX0RFVklDRV9BXzFYLCAweEMxIH0sDQo+
ID4gKyAgICAgICB7IFBSRV9ERVZJQ0VfQV8xWCwgMHhDMSB9LA0KPiA+ICsgICAgICAgeyBNQUlO
X0RFVklDRV9CXzFYLCAweDgyIH0sDQo+ID4gKyAgICAgICB7IENPRUZGX0RFVklDRV9CXzFYLCAw
eEMyIH0sDQo+ID4gKyAgICAgICB7IFBSRV9ERVZJQ0VfQl8xWCwgMHhDMiB9LA0KPiA+ICsgICAg
ICAgeyBNQUlOX0RFVklDRV9DXzFYLCAweDgzIH0sDQo+ID4gKyAgICAgICB7IENPRUZGX0RFVklD
RV9DXzFYLCAweEMzIH0sDQo+ID4gKyAgICAgICB7IFBSRV9ERVZJQ0VfQ18xWCwgMHhDMyB9LA0K
PiA+ICsgICAgICAgeyBNQUlOX0RFVklDRV9EXzFYLCAweDg0IH0sDQo+ID4gKyAgICAgICB7IENP
RUZGX0RFVklDRV9EXzFYLCAweEM0IH0sDQo+ID4gKyAgICAgICB7IFBSRV9ERVZJQ0VfRF8xWCwg
MHhDNCB9LA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBibGt0eXBf
ZGV2aWR4X21hcCBub25fcHBjM19tYXBwaW5nX3RhYmxlW10gPSB7DQo+ID4gKyAgICAgICB7IE1B
SU5fQUxMX0RFVklDRVMsIDB4ODAgfSwNCj4gPiArICAgICAgIHsgTUFJTl9ERVZJQ0VfQSwgMHg4
MSB9LA0KPiA+ICsgICAgICAgeyBDT0VGRl9ERVZJQ0VfQSwgMHhDMSB9LA0KPiA+ICsgICAgICAg
eyBQUkVfREVWSUNFX0EsIDB4QzEgfSwNCj4gPiArICAgICAgIHsgTUFJTl9ERVZJQ0VfQiwgMHg4
MiB9LA0KPiA+ICsgICAgICAgeyBDT0VGRl9ERVZJQ0VfQiwgMHhDMiB9LA0KPiA+ICsgICAgICAg
eyBQUkVfREVWSUNFX0IsIDB4QzIgfSwNCj4gPiArICAgICAgIHsgTUFJTl9ERVZJQ0VfQywgMHg4
MyB9LA0KPiA+ICsgICAgICAgeyBDT0VGRl9ERVZJQ0VfQywgMHhDMyB9LA0KPiA+ICsgICAgICAg
eyBQUkVfREVWSUNFX0MsIDB4QzMgfSwNCj4gPiArICAgICAgIHsgTUFJTl9ERVZJQ0VfRCwgMHg4
NCB9LA0KPiA+ICsgICAgICAgeyBDT0VGRl9ERVZJQ0VfRCwgMHhDNCB9LA0KPiA+ICsgICAgICAg
eyBQUkVfREVWSUNFX0QsIDB4QzQgfSwNCj4gPiArfTsNCj4gPiArDQo+ID4gIHN0YXRpYyBzdHJ1
Y3QgdGFzZGV2aWNlX2NvbmZpZ19pbmZvICp0YXNkZXZpY2VfYWRkX2NvbmZpZygNCj4gPiAgICAg
ICAgIHN0cnVjdCB0YXNkZXZpY2VfcHJpdiAqdGFzX3ByaXYsIHVuc2lnbmVkIGNoYXIgKmNvbmZp
Z19kYXRhLA0KPiA+ICAgICAgICAgdW5zaWduZWQgaW50IGNvbmZpZ19zaXplLCBpbnQgKnN0YXR1
cykgQEAgLTMxNiw2ICszNzgsMzcgQEANCj4gPiBpbnQgdGFzZGV2aWNlX3JjYV9wYXJzZXIodm9p
ZCAqY29udGV4dCwgY29uc3Qgc3RydWN0IGZpcm13YXJlICpmbXcpICB9DQo+ID4gRVhQT1JUX1NZ
TUJPTF9OU19HUEwodGFzZGV2aWNlX3JjYV9wYXJzZXIsDQo+IFNORF9TT0NfVEFTMjc4MV9GTVdM
SUIpOw0KPiA+DQo+ID4gKy8qIGZpeGVkIG02OGsgY29tcGlsaW5nIGlzc3VlOiBtYXBwaW5nIHRh
YmxlIGNhbiBzYXZlIGNvZGUgZmllbGQgKi8NCj4gPiArc3RhdGljIHVuc2lnbmVkIGNoYXIgbWFw
X2Rldl9pZHgoc3RydWN0IHRhc2RldmljZV9mdyAqdGFzX2ZtdywNCj4gPiArICAgICAgIHN0cnVj
dCB0YXNkZXZfYmxrICpibG9jaykNCj4gPiArew0KPiA+ICsNCj4gPiArICAgICAgIHN0cnVjdCBi
bGt0eXBfZGV2aWR4X21hcCAqcCA9DQo+ID4gKyAgICAgICAgICAgICAgIChzdHJ1Y3QgYmxrdHlw
X2RldmlkeF9tYXAgKilub25fcHBjM19tYXBwaW5nX3RhYmxlOw0KPiANCj4gUGxlYXNlIGRvIG5v
dCBjYXN0IGF3YXkgY29uc3RuZXNzIHdoZW4gbm90IG5lZWRlZCAoYWxzbyBiZWxvdykuDQo+IA0K
PiA+ICsgICAgICAgc3RydWN0IHRhc2RldmljZV9kc3Bmd19oZHIgKmZ3X2hkciA9ICYodGFzX2Zt
dy0+ZndfaGRyKTsNCj4gPiArICAgICAgIHN0cnVjdCB0YXNkZXZpY2VfZndfZml4ZWRfaGRyICpm
d19maXhlZF9oZHIgPQ0KPiA+ICsgJihmd19oZHItPmZpeGVkX2hkcik7DQo+ID4gKw0KPiA+ICsg
ICAgICAgaW50IGksIG4gPSBBUlJBWV9TSVpFKG5vbl9wcGMzX21hcHBpbmdfdGFibGUpOw0KPiAN
Cj4gc2l6ZV90DQo+IA0KPiA+ICsgICAgICAgdW5zaWduZWQgY2hhciBkZXZfaWR4ID0gMDsNCj4g
PiArDQo+ID4gKyAgICAgICBpZiAoZndfZml4ZWRfaGRyLT5wcGN2ZXIgPj0gUFBDM19WRVJTSU9O
X1RBUzI3ODEpIHsNCj4gPiArICAgICAgICAgICAgICAgcCA9IChzdHJ1Y3QgYmxrdHlwX2Rldmlk
eF9tYXAgKilwcGMzX3RhczI3ODFfbWFwcGluZ190YWJsZTsNCj4gPiArICAgICAgICAgICAgICAg
biA9IEFSUkFZX1NJWkUocHBjM190YXMyNzgxX21hcHBpbmdfdGFibGUpOw0KPiA+ICsgICAgICAg
fSBlbHNlIGlmIChmd19maXhlZF9oZHItPnBwY3ZlciA+PSBQUEMzX1ZFUlNJT04pIHsNCj4gPiAr
ICAgICAgICAgICAgICAgcCA9IChzdHJ1Y3QgYmxrdHlwX2RldmlkeF9tYXAgKilwcGMzX21hcHBp
bmdfdGFibGU7DQo+ID4gKyAgICAgICAgICAgICAgIG4gPSBBUlJBWV9TSVpFKHBwYzNfbWFwcGlu
Z190YWJsZSk7DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgZm9yIChpID0gMDsg
aSA8IG47IGkrKykgew0KPiA+ICsgICAgICAgICAgICAgICBpZiAoYmxvY2stPnR5cGUgPT0gcFtp
XS5ibGt0eXApIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBkZXZfaWR4ID0gcFtpXS5k
ZXZfaWR4Ow0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgICAg
ICAgICAgICB9DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgcmV0dXJuIGRldl9p
ZHg7DQo+ID4gK30NCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVy
ZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3Jn
DQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwg
SSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5h
bGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
