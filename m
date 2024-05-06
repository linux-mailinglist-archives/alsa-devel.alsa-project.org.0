Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 588498BFD8E
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:46:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE16BE66;
	Wed,  8 May 2024 14:46:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE16BE66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715172390;
	bh=wFO1Q3+eNIHJz3HRsu33RvMMo9hn2HylVuWXmz288kw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VOwvvTlgzHeCybFY16H8izudRkJ/HWgxzUvewk83rWYSMew39+u25wED/VptLvIOF
	 TgODeEPt555YTwiIyUZG+IrCrAnQu0/NRkPhJjS/ylzyVqN/gEgXmkwSz/LBo9LAs2
	 cjqItX+iwR14bB36yBMaCbIGSdECZvOIVY6KSKLc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23620F80654; Wed,  8 May 2024 14:45:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9EADF8063E;
	Wed,  8 May 2024 14:45:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 491A1F8049C; Mon,  6 May 2024 09:44:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28445F8003A
	for <alsa-devel@alsa-project.org>; Mon,  6 May 2024 09:44:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28445F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=i5pcXv27
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4467i5kr095658;
	Mon, 6 May 2024 02:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714981445;
	bh=wFO1Q3+eNIHJz3HRsu33RvMMo9hn2HylVuWXmz288kw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=i5pcXv27umM2ROuLLndeYZGMKBYxaXQ9XEoEXcUEuIYqR4VsWF9JLiMqzb/s3EHdy
	 MRJObDbMjPAIJYRyXE/8hB+qEqtxVr9O7d0c5X0mQAqt+7/I2F1xjPkmaHe7W+WVK/
	 2b1TeWTJAopoL04/yPXOcr2nHQZpNI6peCSSgbqI=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4467i5LR118272
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 May 2024 02:44:05 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 May 2024 02:44:05 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
 DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
 15.01.2507.023; Mon, 6 May 2024 02:44:05 -0500
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
Thread-Index: AQHakUValxtzw4HJGk6cPNX38MLKCLFuQDOAgApofQGAC33VgIAFxDWQ
Date: Mon, 6 May 2024 07:44:05 +0000
Message-ID: <d96bea0bacc842e0b30a100f43ff264f@ti.com>
References: <20240418040240.2337-1-baojun.xu@ti.com>
 <20240418040240.2337-2-baojun.xu@ti.com>
 <ZiEKc4OTVlOt8llU@smile.fi.intel.com>
 <0c7b29075dc347299602668660adb4b6@ti.com>,<ZjNpX6TvB4Vv1akq@smile.fi.intel.com>
In-Reply-To: <ZjNpX6TvB4Vv1akq@smile.fi.intel.com>
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
Message-ID-Hash: JWZXOGL6RCXGH6KBCSLOMEUPBR3FDHHY
X-Message-ID-Hash: JWZXOGL6RCXGH6KBCSLOMEUPBR3FDHHY
X-Mailman-Approved-At: Wed, 08 May 2024 12:44:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JWZXOGL6RCXGH6KBCSLOMEUPBR3FDHHY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgQW5keQ0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMsIGFuc3dlciBpbiBsaW5lOg0KDQo+
IEZyb206IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29t
Pg0KPiBTZW50OiAwMiBNYXkgMjAyNCAxODoyMg0KPiBUbzogWHUsIEJhb2p1bg0KPiBDYzogdGl3
YWlAc3VzZS5kZTsgcm9iaCtkdEBrZXJuZWwub3JnOyBsZ2lyZHdvb2RAZ21haWwuY29tOyBwZXJl
eEBwZXJleC5jejsgcGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tOyBMdSwgS2V2
aW47IERpbmcsIFNoZW5naGFvOyBOYXZhZGEgS2FueWFuYSwgTXVrdW5kOyAxMzkxNjI3NTIwNkAx
MzkuY29tOyBQIE8sIFZpamV0aDsgSG9sYWx1IFlvZ2VuZHJhLCBOaXJhbmphbjsgYWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaWFtLnIu
Z2lyZHdvb2RAaW50ZWwuY29tOyB5dW5nLWNodWFuLmxpYW9AbGludXguaW50ZWwuY29tOyBicm9v
bmllQGtlcm5lbC5vcmc7IHNveWVyQGlybC5odQ0KPiBTdWJqZWN0OiBSZTogW0VYVEVSTkFMXSBS
ZTogW1BBVENIIHYzIDEvM10gQUxTQTogaGRhL3RhczI3ODE6IE1vZGlmaWNhdGlvbiBmb3IgYWRk
IHRhczI3ODEgZHJpdmVyIGZvciBTUEkNCj4gDQo+IE9uIFRodSwgQXByIDI1LCAyMDI0IGF0IDA3
OuKAijU0OuKAijQxQU0gKzAwMDAsIFh1LCBCYW9qdW4gd3JvdGU6ID4gPiBGcm9tOiBBbmR5IFNo
ZXZjaGVua28gPGFuZHJpeS7igIpzaGV2Y2hlbmtvQOKAimxpbnV4LuKAimludGVsLuKAimNvbT4g
PiA+IFNlbnQ6IDE4IEFwcmlsIDIwMjQgMTk64oCKNTYgPiA+IE9uIFRodSwgQXByIDE4LCAyMDI0
IGF0IDEyOiAwMjogMzdQTSArMDgwMCwgQmFvanVuIFh1IHdyb3RlOuKAig0KPiBaalFjbVFSWUZw
ZnB0QmFubmVyU3RhcnQNCj4gVGhpcyBtZXNzYWdlIHdhcyBzZW50IGZyb20gb3V0c2lkZSBvZiBU
ZXhhcyBJbnN0cnVtZW50cy4NCj4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNvdXJjZSBvZiB0aGlzIGVtYWlsIGFuZCBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUuIElmIHlvdSB3aXNoIHRvIHJlcG9ydCB0aGlzIG1lc3NhZ2Ug
dG8gSVQgU2VjdXJpdHksIHBsZWFzZSBmb3J3YXJkIHRoZSBtZXNzYWdlIGFzIGFuIGF0dGFjaG1l
bnQgdG8gcGhpc2hpbmdAbGlzdC50aS5jb20NCj4gDQo+IFpqUWNtUVJZRnBmcHRCYW5uZXJFbmQN
Cj4gDQo+IE9uIFRodSwgQXByIDI1LCAyMDI0IGF0IDA3OjU0OjQxQU0gKzAwMDAsIFh1LCBCYW9q
dW4gd3JvdGU6DQo+ID4gPiBGcm9tOiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtv
QGxpbnV4LmludGVsLmNvbT4NCj4gPiA+IFNlbnQ6IDE4IEFwcmlsIDIwMjQgMTk6NTYNCj4gPiA+
IE9uIFRodSwgQXByIDE4LCAyMDI0IGF0IDEyOuKAijAyOuKAijM3UE0gKzA4MDAsIEJhb2p1biBY
dSB3cm90ZToNCj4gPiA+IE9uIFRodSwgQXByIDE4LCAyMDI0IGF0IDEyOjAyOjM3UE0gKzA4MDAs
IEJhb2p1biBYdSB3cm90ZToNCj4gDQo+IC4uLg0KPiANCj4gPiA+ID4gIHNvdW5kL3BjaS9oZGEv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTUgKysrKysrKysrKysrKysrDQo+
ID4gPiA+ICBzb3VuZC9wY2kvaGRhL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAyICsrDQo+ID4gPg0KPiA+IElzIHRoaXMgY29ycmVjdD8gWW91IGFyZSBhZGRpbmcgYSBkZWFk
ICJjb2RlIiwgaXNuJ3QgaXQ/DQo+ID4NCj4gPiBXaGF0J3MgbWVhbiAiZGVhZCBjb2RlIj8gQWZ0
ZXIgYWRkIENPTkZJR19TTkRfSERBX1NDT0RFQ19UQVMyNzgxX1NQST1tDQo+ID4gaW4gbXkgY29u
ZmlnIGZpbGUsIHRoZSB3aG9sZSBwYXRjaCBjb2RlIGhhcyB3b3JrZWQuDQo+IA0KPiBJcyB0aGF0
IGZpbGUgYWxyZWFkeSBpbiB0aGUgcmVwb3NpdG9yeT8NCj4gSWYgbm90LCBJIGRvbid0IHNlZSBp
dCBpbiB0aGlzIHBhdGNoIGVpdGhlciAtLT4gZGVhZCBjb2RlLg0KDQpXaGVuIEkgaW50ZWdyYXRl
ZCBDT05GSUdfU05EX0hEQV9TQ09ERUNfVEFTMjc4MV9TUEkgYW5kIGNvbXBpbGVkIHRoZSB3aG9s
ZSBrZXJuZWwsDQppdCB1c2VkIHRvIHBvcHVwIHRoZSBmb2xsb3dpbmcgbWVzc2FnZSBmb3IgVEFT
Mjc4MSBTUEkgbW9kdWxlIGluIGZpcnN0IGNvbXBpbGU6DQogDQogQnVpbGQgVEFTMjc4MSBIRC1h
dWRpbyBzaWRlIGNvZGVjIHN1cHBvcnQgZm9yIFNQSSBCdXMgKFNORF9IREFfU0NPREVDX1RBUzI3
ODFfU1BJKSBbTi9tLz9dIChORVcpIA0KDQpOb3JtYWxseSwgc2VsZWN0ZWQgbS4gQW5kIFRBUzI3
ODEgU1BJIG1vZHVsZSB3b3VsZCBiZSBjb21waWxlZC4NCg0KPiANCj4gLS0NCj4gV2l0aCBCZXN0
IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KPiANCj4gDQo=
