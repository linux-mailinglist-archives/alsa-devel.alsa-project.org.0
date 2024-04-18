Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF898A9F6F
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 18:01:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EB882354;
	Thu, 18 Apr 2024 18:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EB882354
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713456092;
	bh=RycA2dhv8leiIV05+4bctiYGqAP3v0rn3ejjwxVzK4A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XVgWjMQW64Zc9b/fjWHq84WCa8oepRm9YQQNtTOLSqSHNEhn+a/dIOjgkyvTr26Ej
	 TizWFLOEsnLLzVcZPd3BxuvQoh6zPJFfjomz+st7H7fivkuMagrkiTXIOgt5d0fi98
	 I0tq+1Yfnx+BzbEPROb2BfBQWeo+Om26w0Id1/Uc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DCA3F8984F; Thu, 18 Apr 2024 17:53:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDDEBF89848;
	Thu, 18 Apr 2024 17:53:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0462F8025A; Thu, 18 Apr 2024 07:12:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 180ECF8013D
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 07:12:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 180ECF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=n+M8Uhg4
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43I5C4Zm107474;
	Thu, 18 Apr 2024 00:12:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713417124;
	bh=RycA2dhv8leiIV05+4bctiYGqAP3v0rn3ejjwxVzK4A=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=n+M8Uhg4W83EUcvghbQA6HEwAxG6OGpCIYsMDsI599nUqu8S6ILzrM+gp7W3TfYB3
	 A3gYNc6LXr6zvSjNGH8EqfSf74cj7HjuA2gEim5e5F6OD6Lz0OJejQNvsMufDG/tBS
	 ZNA2LBgaACGaDNLRuEE4SKwFkEf6/x1awmm+4Ink=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43I5C4iN032209
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Apr 2024 00:12:04 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 Apr 2024 00:12:04 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
 DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
 15.01.2507.023; Thu, 18 Apr 2024 00:12:03 -0500
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
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "soyer@irl.hu" <soyer@irl.hu>
Subject: Re: [EXTERNAL] Re: [PATCH v2 2/3] ALSA: hda/tas2781: Main code of
 tas2781 driver for SPI
Thread-Topic: [EXTERNAL] Re: [PATCH v2 2/3] ALSA: hda/tas2781: Main code of
 tas2781 driver for SPI
Thread-Index: AQHaiih6NEMFDg9umESdtKqueorOxbFgQSeAgA1Ah1A=
Date: Thu, 18 Apr 2024 05:12:03 +0000
Message-ID: <e3f73d92d1fa466cb70e3d738a7926c9@ti.com>
References: <20240409024816.1180-1-baojun.xu@ti.com>
 <20240409024816.1180-3-baojun.xu@ti.com>,<ZhVA1_HTET4Q4T9d@smile.fi.intel.com>
In-Reply-To: <ZhVA1_HTET4Q4T9d@smile.fi.intel.com>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.64.41.93]
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
Message-ID-Hash: WD7VHB47MJBWFW4UMTO7C5ZVTDPXLSCL
X-Message-ID-Hash: WD7VHB47MJBWFW4UMTO7C5ZVTDPXLSCL
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:53:08 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WD7VHB47MJBWFW4UMTO7C5ZVTDPXLSCL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgQW5keSwNCg0KVGhhbmtzIGZvciB5b3VyIHZhbHVhYmxlIHN1Z2dlc3Rpb25zLg0KDQo+IEZy
b206IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0K
PiBTZW50OiAwOSBBcHJpbCAyMDI0IDIxOjIxDQo+IFRvOiBYdSwgQmFvanVuDQo+IENjOiB0aXdh
aUBzdXNlLmRlOyByb2JoK2R0QGtlcm5lbC5vcmc7IGxnaXJkd29vZEBnbWFpbC5jb207IHBlcmV4
QHBlcmV4LmN6OyBwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb207IEx1LCBLZXZp
bjsgRGluZywgU2hlbmdoYW87IE5hdmFkYSBLYW55YW5hLCBNdWt1bmQ7IGFsc2EtZGV2ZWxAYWxz
YS1wcm9qZWN0Lm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGlhbS5yLmdpcmR3
b29kQGludGVsLmNvbTsgeXVuZy1jaHVhbi5saWFvQGxpbnV4LmludGVsLmNvbTsgYnJvb25pZUBr
ZXJuZWwub3JnOyBzb3llckBpcmwuaHUNCj4gU3ViamVjdDogW0VYVEVSTkFMXSBSZTogW1BBVENI
IHYyIDIvM10gQUxTQTogaGRhL3RhczI3ODE6IE1haW4gY29kZSBvZiB0YXMyNzgxIGRyaXZlciBm
b3IgU1BJDQo+IA0KPiBPbiBUdWUsIEFwciAwOSwgMjAyNCBhdCAxMDrigIo0ODrigIoxNEFNICsw
ODAwLCBCYW9qdW4gWHUgd3JvdGU6ID4gTWFpbiBzb3VyY2UgY29kZSBmb3IgdGFzMjc4MSBkcml2
ZXIgZm9yIFNQSS4gLi7igIouID4gKyNpZm5kZWYgX19UQVMyNzgxX1NQSV9IX18gPiArI2RlZmlu
ZSBfX1RBUzI3ODFfU1BJX0hfXyArIGJpdHMu4oCKaCArIG11dGV4LuKAimggKyB0aW1lLuKAimg/
IChmb3Igc3RydWN0IHRtKSArIHR5cGVzLuKAimggc3RydWN0IGNhbGlkYXRhDQo+IFpqUWNtUVJZ
RnBmcHRCYW5uZXJTdGFydA0KPiBUaGlzIG1lc3NhZ2Ugd2FzIHNlbnQgZnJvbSBvdXRzaWRlIG9m
IFRleGFzIEluc3RydW1lbnRzLg0KPiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc291cmNlIG9mIHRoaXMgZW1haWwgYW5kIGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4gSWYgeW91IHdpc2ggdG8gcmVwb3J0IHRoaXMgbWVzc2Fn
ZSB0byBJVCBTZWN1cml0eSwgcGxlYXNlIGZvcndhcmQgdGhlIG1lc3NhZ2UgYXMgYW4gYXR0YWNo
bWVudCB0byBwaGlzaGluZ0BsaXN0LnRpLmNvbQ0KPiANCj4gWmpRY21RUllGcGZwdEJhbm5lckVu
ZA0KPiANCj4gT24gVHVlLCBBcHIgMDksIDIwMjQgYXQgMTA6NDg6MTRBTSArMDgwMCwgQmFvanVu
IFh1IHdyb3RlOg0KPiA+IE1haW4gc291cmNlIGNvZGUgZm9yIHRhczI3ODEgZHJpdmVyIGZvciBT
UEkuDQo+IA0KPiAuLi4NCj4gDQo+ID4gKyNpZm5kZWYgX19UQVMyNzgxX1NQSV9IX18NCj4gPiAr
I2RlZmluZSBfX1RBUzI3ODFfU1BJX0hfXw0KPiANCj4gKyBiaXRzLmgNCj4gKyBtdXRleC5oDQo+
ICsgdGltZS5oPyAoZm9yIHN0cnVjdCB0bSkNCj4gKyB0eXBlcy5oDQo+IA0KPiBzdHJ1Y3QgY2Fs
aWRhdGEgaXMgZnJvbT8uLg0KPiANCj4gPiArI2luY2x1ZGUgPHNvdW5kL3RhczI3ODEtZHNwLmg+
DQo+IA0KPiBOb3Qgc3VyZSBob3cgdGhpcyBpcyBiZWluZyB1c2VkLg0KDQpXYXMgdXNlZCBmb3Ig
ZmlybXdhcmUgYmluYXJ5IGZpbGUgcGFyc2VyLCBhbGwgb2YgZmlsZSBmb3JtYXQgaW5mb3JtYXRp
b24NCndhcyBkZWZpbmVkIGluIHRoaXMgaGVhZGVyIGZpbGUuIEl0IGNhbiBiZSBzaGFyZWQgYmV0
d2VlbiBTUEkgJiBJMkMuIA0KPiANCj4gQWxzbyBzb21lIGZvcndhcmQgZGVjbGFyYXRpb25zOg0K
PiANCj4gKyBzdHJ1Y3QgZGV2aWNlOw0KPiArIHN0cnVjdCBmaXJtd2FyZTsNCj4gKyBzdHJ1Y3Qg
Z3Bpb19kZXNjOw0KPiArIHN0cnVjdCByZWdtYXA7DQo+IA0KPiAuLi4NCj4gDQo+ID4gKyNkZWZp
bmUgVEFTMjc4MV9TUElfTUFYX0ZSRVEgICAgICAgICA0MDAwMDAwDQo+IA0KPiA0ICogSFpaX1BF
Ul9NSFogPw0KPiANCk5vdCBmb3VuZCBpdCwgd2lsbCB1c2UgSFpfUEVSX01IWiBpbiBuZXh0IHBh
dGNoLg0KPiAuLi4NCj4gDQo+IC0tDQo+IFdpdGggQmVzdCBSZWdhcmRzLA0KPiBBbmR5IFNoZXZj
aGVua28NCj4gDQo+IA0KPiANCj4g
