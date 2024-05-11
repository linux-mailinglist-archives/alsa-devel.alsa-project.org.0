Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A729F8C2F63
	for <lists+alsa-devel@lfdr.de>; Sat, 11 May 2024 05:37:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E40AFE65;
	Sat, 11 May 2024 05:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E40AFE65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715398648;
	bh=AA1unVw2ciTmVVxsDufx+gzlvLjzZ65wMzQFo4Qrwwo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e5fuVNVYpeOYeTIUuZ3gwlUAdHP+2VYY1fmKphtlaB4Abj8PhWe4aJwbyGsuFMe7M
	 dIvIxKTH/nMUZG7pP9uafSt20mWekjxeW6hrtWBycB2fGl+/TIgTTq77AaoStHCPiD
	 ffsFHfSgXqV8w2Tdn1KsTTaFMoNou04IMSslsdys=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 329E7F8059F; Sat, 11 May 2024 05:36:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF20DF805A0;
	Sat, 11 May 2024 05:36:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB7D7F8049C; Sat, 11 May 2024 05:35:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 213CAF800E2
	for <alsa-devel@alsa-project.org>; Sat, 11 May 2024 05:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 213CAF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=PFFEzATc
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44B3Z6SR006522;
	Fri, 10 May 2024 22:35:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715398506;
	bh=AA1unVw2ciTmVVxsDufx+gzlvLjzZ65wMzQFo4Qrwwo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=PFFEzATclSBdFoPu06hM0QzuvvWVhKI6QbV8FTEQ8RaSNUYGgMku8ytbhTSPhU6Co
	 OOcbbhqZZi4Ugb1hDTnuSINkLfCHFwfahj7sTDvJP6uWxaTLgvGkVJ245gHoJ6N93X
	 wuTLP4k1GZ9inW8PPHRqyMwm2gzEaYMPDAXPRnFE=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44B3Z68u120359
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 May 2024 22:35:06 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 May 2024 22:35:05 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Fri, 10 May 2024 22:35:05 -0500
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
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "liam.r.girdwood@intel.com"
	<liam.r.girdwood@intel.com>,
        "bard.liao@intel.com" <bard.liao@intel.com>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "Lu,
 Kevin" <kevin-lu@ti.com>,
        "cameron.berkenpas@gmail.com"
	<cameron.berkenpas@gmail.com>,
        "tiwai@suse.de" <tiwai@suse.de>, "Xu, Baojun"
	<baojun.xu@ti.com>,
        "soyer@irl.hu" <soyer@irl.hu>,
        "Baojun.Xu@fpt.com"
	<Baojun.Xu@fpt.com>
Subject: RE: [EXTERNAL] Re: [PATCH v4 1/3] ALSA: ASoc/tas2781: Fix wrong
 loading calibrated data sequence
Thread-Topic: [EXTERNAL] Re: [PATCH v4 1/3] ALSA: ASoc/tas2781: Fix wrong
 loading calibrated data sequence
Thread-Index: AQHaoov156yUMPIK20SW0JBHF04Q6LGQ57+AgAB57pA=
Date: Sat, 11 May 2024 03:35:05 +0000
Message-ID: <efb9d840f44c477d88f06e3f03d06f7b@ti.com>
References: <20240510034123.1181-1-shenghao-ding@ti.com>
 <Zj45bfx4twerXKwc@smile.fi.intel.com>
In-Reply-To: <Zj45bfx4twerXKwc@smile.fi.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.160.109]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: RFDPMYKG77BA6SSRSFYURSQPHF3I7QBS
X-Message-ID-Hash: RFDPMYKG77BA6SSRSFYURSQPHF3I7QBS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RFDPMYKG77BA6SSRSFYURSQPHF3I7QBS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTWF5
IDEwLCAyMDI0IDExOjEzIFBNDQo+IFRvOiBEaW5nLCBTaGVuZ2hhbyA8c2hlbmdoYW8tZGluZ0B0
aS5jb20+DQo+IENjOiBicm9vbmllQGtlcm5lbC5vcmc7IGxnaXJkd29vZEBnbWFpbC5jb207IHBl
cmV4QHBlcmV4LmN6OyBwaWVycmUtDQo+IGxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tOyAx
MzkxNjI3NTIwNkAxMzkuY29tOyBhbHNhLWRldmVsQGFsc2EtDQo+IHByb2plY3Qub3JnOyBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaWFtLnIuZ2lyZHdvb2RAaW50ZWwuY29tOw0KPiBi
YXJkLmxpYW9AaW50ZWwuY29tOyB5dW5nLWNodWFuLmxpYW9AbGludXguaW50ZWwuY29tOyBMdSwg
S2V2aW4gPGtldmluLQ0KPiBsdUB0aS5jb20+OyBjYW1lcm9uLmJlcmtlbnBhc0BnbWFpbC5jb207
IHRpd2FpQHN1c2UuZGU7IFh1LCBCYW9qdW4NCj4gPGJhb2p1bi54dUB0aS5jb20+OyBzb3llckBp
cmwuaHU7IEJhb2p1bi5YdUBmcHQuY29tDQo+IFN1YmplY3Q6IFtFWFRFUk5BTF0gUmU6IFtQQVRD
SCB2NCAxLzNdIEFMU0E6IEFTb2MvdGFzMjc4MTogRml4IHdyb25nIGxvYWRpbmcNCj4gY2FsaWJy
YXRlZCBkYXRhIHNlcXVlbmNlDQo+IA0KPiBPbiBGcmksIE1heSAxMCwgMjAyNCBhdCAxMTrigIo0
MTrigIoxOUFNICswODAwLCBTaGVuZ2hhbyBEaW5nIHdyb3RlOiA+IENhbGlicmF0ZWQNCj4gZGF0
YSB3aWxsIGJlIHNldCB0byBkZWZhdWx0IGFmdGVyIGxvYWRpbmcgRFNQIGNvbmZpZyBwYXJhbXMs
ID4gd2hpY2ggd2lsbCBjYXVzZQ0KPiBzcGVha2VyIHByb3RlY3Rpb24gd29yayBhYm5vcm1hbGx5
LiBSZWxvYWQgY2FsaWJyYXRlZCA+IGRhdGEgYWZ0ZXIgbG9hZGluZw0KPiBaalFjbVFSWUZwZnB0
QmFubmVyU3RhcnQgVGhpcyBtZXNzYWdlIHdhcyBzZW50IGZyb20gb3V0c2lkZSBvZiBUZXhhcw0K
PiBJbnN0cnVtZW50cy4NCj4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMg
dW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNvdXJjZSBvZiB0aGlzDQo+IGVtYWlsIGFuZCBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUuIElmIHlvdSB3aXNoIHRvIHJlcG9ydCB0aGlzIG1lc3NhZ2Ug
dG8gSVQNCj4gU2VjdXJpdHksIHBsZWFzZSBmb3J3YXJkIHRoZSBtZXNzYWdlIGFzIGFuIGF0dGFj
aG1lbnQgdG8gcGhpc2hpbmdAbGlzdC50aS5jb20NCj4gDQo+IFpqUWNtUVJZRnBmcHRCYW5uZXJF
bmQNCj4gT24gRnJpLCBNYXkgMTAsIDIwMjQgYXQgMTE6NDE6MTlBTSArMDgwMCwgU2hlbmdoYW8g
RGluZyB3cm90ZToNCj4gPiBDYWxpYnJhdGVkIGRhdGEgd2lsbCBiZSBzZXQgdG8gZGVmYXVsdCBh
ZnRlciBsb2FkaW5nIERTUCBjb25maWcNCj4gPiBwYXJhbXMsIHdoaWNoIHdpbGwgY2F1c2Ugc3Bl
YWtlciBwcm90ZWN0aW9uIHdvcmsgYWJub3JtYWxseS4gUmVsb2FkDQo+ID4gY2FsaWJyYXRlZCBk
YXRhIGFmdGVyIGxvYWRpbmcgRFNQIGNvbmZpZyBwYXJhbXMuDQo+ID4NCj4gPiBGaXhlczogZWYz
YmNkZTc1ZDA2ICgiQVNvYzogdGFzMjc4MTogQWRkIHRhczI3ODEgZHJpdmVyIikNCj4gDQo+IEhv
dyBvbiBlYXJ0aCB0aGlzIGNhbiBiZSBhIGZpeD8uLg0KUmVtb3ZpbmcgdGhlIGRlY2xhcmF0aW9u
IG9mIHRhc2RldmljZV9wcm1nX2NhbGliZGF0YV9sb2FkIGlzIGEgcGFydCBvZiBmaXguDQpMb2Fk
aW5nIGNhbGlicmF0ZWQgZGF0YSBhZnRlciBsb2FkaW5nIGRzcCBwcm9ncmFtIGJlY29tZSBhIHJl
ZHVuZGFuY2UuDQo+IA0KPiA+IC0vLyBDb3B5cmlnaHQgKEMpIDIwMjIgLSAyMDIzIFRleGFzIElu
c3RydW1lbnRzIEluY29ycG9yYXRlZA0KPiA+ICsvLyBDb3B5cmlnaHQgKEMpIDIwMjIgLSAyMDI0
IFRleGFzIEluc3RydW1lbnRzIEluY29ycG9yYXRlZA0KPiANCi4uLg0KPiA+IC1pbnQgdGFzZGV2
aWNlX3BybWdfY2FsaWJkYXRhX2xvYWQodm9pZCAqY29udGV4dCwgaW50IHBybV9ubyk7DQo+IA0K
PiAtLQ0KPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQo+IA0KDQo=
