Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9C39339FC
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2024 11:35:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22966DF9;
	Wed, 17 Jul 2024 11:35:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22966DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721208920;
	bh=clYmUUuAhN2wNLGXaTFFUk3J+PcRGxA81IYyrDlzf04=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vqfu6KLJUXh5U5ioDc4Jl7goH0yG0cnD7dnZib0aD+AdO6rcp60ohe3P033S7Oo5X
	 iHT/m7zoWjAEz+5evmwNEUYsvC9LVG2QCNfxiXrMjbJLasJy3ze4+lM5qD6HKFnDHl
	 2iFXBG0Eedx+oA3F3RFQeRSHc1tgTyPU8D0dC8DM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C057F8067E; Wed, 17 Jul 2024 11:33:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9536F80641;
	Wed, 17 Jul 2024 11:33:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7E79F801F5; Thu, 11 Jul 2024 11:42:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E516F800FA
	for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2024 11:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E516F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=WGUTuNvU
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46B9g8Nc067340;
	Thu, 11 Jul 2024 04:42:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720690928;
	bh=clYmUUuAhN2wNLGXaTFFUk3J+PcRGxA81IYyrDlzf04=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=WGUTuNvUYX7YunCIu3Rj0WfvQWCRYdWHFWysA0JOU1xb3X+/Zsld+wB2LiwsUvRyE
	 w7r5WDQGNnLAmv422bgoeQGmp8oLK7Cxkw/OzieHw70sfz0EPQXXkn3+CBdWFkGG9M
	 jWRw6VmkMcUcdXI369OOHxAku727UxQP4J/t8yMg=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46B9g8sI027625
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Jul 2024 04:42:08 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 Jul 2024 04:42:08 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
 DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
 15.01.2507.023; Thu, 11 Jul 2024 04:42:08 -0500
From: "Xu, Baojun" <baojun.xu@ti.com>
To: Takashi Iwai <tiwai@suse.de>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz"
	<perex@perex.cz>,
        "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "Lu, Kevin" <kevin-lu@ti.com>,
        "Ding,
 Shenghao" <shenghao-ding@ti.com>,
        "Navada Kanyana, Mukund" <navada@ti.com>,
        "13916275206@139.com" <13916275206@139.com>,
        "Hampiholi, Vallabha"
	<v-hampiholi@ti.com>,
        "P O, Vijeth" <v-po@ti.com>,
        "Holalu Yogendra,
 Niranjan" <niranjan.hy@ti.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "liam.r.girdwood@intel.com"
	<liam.r.girdwood@intel.com>,
        "yung-chuan.liao@linux.intel.com"
	<yung-chuan.liao@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "soyer@irl.hu" <soyer@irl.hu>
Subject: Re: [EXTERNAL] Re: [PATCH v8] ALSA: hda/tas2781: Add tas2781 hda SPI
 driver
Thread-Topic: [EXTERNAL] Re: [PATCH v8] ALSA: hda/tas2781: Add tas2781 hda SPI
 driver
Thread-Index: AQHavhA+LICoIavOaEyXrK6TRE4VxrHHkvGAgCncvSA=
Date: Thu, 11 Jul 2024 09:42:08 +0000
Message-ID: <cedb99db542a41178a5f1b09c9ef5cf3@ti.com>
References: 
 <20240614040554.610-1-baojun.xu@ti.com>,<874j9v8xuq.wl-tiwai@suse.de>
In-Reply-To: <874j9v8xuq.wl-tiwai@suse.de>
Accept-Language: en-GB, zh-CN, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.180.69.6]
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
Message-ID-Hash: H5BUZ4GAU7PH2TNZ2Z2CZA4ZPZMUEUL4
X-Message-ID-Hash: H5BUZ4GAU7PH2TNZ2Z2CZA4ZPZMUEUL4
X-Mailman-Approved-At: Wed, 17 Jul 2024 09:33:39 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H5BUZ4GAU7PH2TNZ2Z2CZA4ZPZMUEUL4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgVGFrYXNoaSwNCg0KQW5zd2VyIGluIGxpbmUuDQoNCkJlc3QgUmVnYXJkcw0KSmltDQoNCj4g
RnJvbTogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPg0KPiBTZW50OiAxNCBKdW5lIDIwMjQg
MjE6MjANCj4gVG86IFh1LCBCYW9qdW4NCj4gQ2M6IHJvYmgrZHRAa2VybmVsLm9yZzsgYW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tOyBsZ2lyZHdvb2RAZ21haWwuY29tOyBwZXJleEBw
ZXJleC5jejsgcGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29tOyBMdSwgS2V2aW47
IERpbmcsIFNoZW5naGFvOyBOYXZhZGEgS2FueWFuYSwgTXVrdW5kOyAxMzkxNjI3NTIwNkAxMzku
Y29tOyBIYW1waWhvbGksIFZhbGxhYmhhOyBQIE8sIFZpamV0aDsgSG9sYWx1IFlvZ2VuZHJhLCBO
aXJhbmphbjsgYWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnOyBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnOyBsaWFtLnIuZ2lyZHdvb2RAaW50ZWwuY29tOyB5dW5nLWNodWFuLmxpYW9AbGlu
dXguaW50ZWwuY29tOyBicm9vbmllQGtlcm5lbC5vcmc7IHNveWVyQGlybC5odQ0KPiBTdWJqZWN0
OiBbRVhURVJOQUxdIFJlOiBbUEFUQ0ggdjhdIEFMU0E6IGhkYS90YXMyNzgxOiBBZGQgdGFzMjc4
MSBoZGEgU1BJIGRyaXZlcg0KPiANCj4gT24gRnJpLCAxNCBKdW4gMjAyNCAwNjrigIowNTrigIo1
NCArMDIwMCwgQmFvanVuIFh1IHdyb3RlOiA+ICtzdGF0aWMgc3RydWN0IHRhc2RldmljZV9jb25m
aWdfaW5mbyAqdGFzZGV2aWNlX2FkZF9jb25maWcoID4gKyBzdHJ1Y3QgdGFzZGV2aWNlX3ByaXYg
KnRhc19wcml2LCB1bnNpZ25lZCBjaGFyICpjb25maWdfZGF0YSwgPiArIHVuc2lnbmVkIGludCBj
b25maWdfc2l6ZSwgaW50ICpzdGF0dXMpID4gK3sNCj4gWmpRY21RUllGcGZwdEJhbm5lclN0YXJ0
DQo+IFRoaXMgbWVzc2FnZSB3YXMgc2VudCBmcm9tIG91dHNpZGUgb2YgVGV4YXMgSW5zdHJ1bWVu
dHMuDQo+IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
cmVjb2duaXplIHRoZSBzb3VyY2Ugb2YgdGhpcyBlbWFpbCBhbmQga25vdyB0aGUgY29udGVudCBp
cyBzYWZlLiBJZiB5b3Ugd2lzaCB0byByZXBvcnQgdGhpcyBtZXNzYWdlIHRvIElUIFNlY3VyaXR5
LCBwbGVhc2UgZm9yd2FyZCB0aGUgbWVzc2FnZSBhcyBhbiBhdHRhY2htZW50IHRvIHBoaXNoaW5n
QGxpc3QudGkuY29tDQo+IA0KPiBaalFjbVFSWUZwZnB0QmFubmVyRW5kDQo+IA0KPiBPbiBGcmks
IDE0IEp1biAyMDI0IDA2OjA1OjU0ICswMjAwLA0KPiBCYW9qdW4gWHUgd3JvdGU6DQo+ID4gK3N0
YXRpYyBzdHJ1Y3QgdGFzZGV2aWNlX2NvbmZpZ19pbmZvICp0YXNkZXZpY2VfYWRkX2NvbmZpZygN
Cj4gPiArICAgICBzdHJ1Y3QgdGFzZGV2aWNlX3ByaXYgKnRhc19wcml2LCB1bnNpZ25lZCBjaGFy
ICpjb25maWdfZGF0YSwNCj4gPiArICAgICB1bnNpZ25lZCBpbnQgY29uZmlnX3NpemUsIGludCAq
c3RhdHVzKQ0KPiA+ICt7DQo+IChzbmlwKQ0KPiA+ICsgICAgIC8qDQo+ID4gKyAgICAgICogY29u
dmVydCBkYXRhW29mZnNldF0sIGRhdGFbb2Zmc2V0ICsgMV0sIGRhdGFbb2Zmc2V0ICsgMl0gYW5k
DQo+ID4gKyAgICAgICogZGF0YVtvZmZzZXQgKyAzXSBpbnRvIGhvc3QNCj4gPiArICAgICAgKi8N
Cj4gPiArICAgICBjZmdfaW5mby0+bmJsb2NrcyA9IGdldF91bmFsaWduZWRfYmUzMigmY29uZmln
X2RhdGFbY29uZmlnX29mZnNldF0pOw0KPiA+ICsgICAgIGNvbmZpZ19vZmZzZXQgKz0gNDsNCj4g
PiArDQo+ID4gKyAgICAgLyoNCj4gPiArICAgICAgKiBTZXZlcmFsIGtpbmRzIG9mIGRzcC9hbGdv
cml0aG0gZmlybXdhcmVzIGNhbiBydW4gb24gdGFzMjc4MSwNCj4gPiArICAgICAgKiB0aGUgbnVt
YmVyIGFuZCBzaXplIG9mIGJsayBhcmUgbm90IGZpeGVkIGFuZCBkaWZmZXJlbnQgYW1vbmcNCj4g
PiArICAgICAgKiB0aGVzZSBmaXJtd2FyZXMuDQo+ID4gKyAgICAgICovDQo+ID4gKyAgICAgYmtf
ZGEgPSBjZmdfaW5mby0+YmxrX2RhdGEgPSBrY2FsbG9jKGNmZ19pbmZvLT5uYmxvY2tzLA0KPiA+
ICsgICAgICAgICAgICAgc2l6ZW9mKCpia19kYSksIEdGUF9LRVJORUwpOw0KPiANCj4gU28gdGhl
IGFsbG9jYXRpb24gc2l6ZSByZWxpZXMgb24gdGhlIGZpcm13YXJlIGRhdGEgY29udGVudCwgYW5k
IGl0IGNhbg0KPiBwcmFjdGljYWxseSBhbnkgdmFsdWUuICBJdCdkIGJlIHNhZmVyIHRvIGhhdmUg
c29tZSBzYW5pdHkgY2hlY2sgZm9yDQo+IGF2b2lkaW5nIHRoZSBhbGxvY2F0aW9uIG9mIHRvbyBs
YXJnZSBwYWdlcy4NCj4gRGl0dG8gZm9yIG90aGVyIGFsbG9jYXRpb25zIGluIHRoaXMgY29kZTsg
eW91IHNob3VsZCBuZXZlciB0cnVzdCB0aGUNCj4gZmlybXdhcmUgYmluYXJ5Lg0KDQpJdCdzIGp1
c3Qgc2l6ZSBvZiBzdHJ1Y3QgdGFzZGV2X2Jsa19kYXRhLCBub3QgdmFyaWFibGUgZnJvbSBmaXJt
d2FyZS4NCkluIG90aGVyIGtjYWxsb2MoKSwgaXQncyBhbHNvIGFsbG9jYXRlIG1lbW9yeSBmb3Ig
c3RydWN0dXJlLg0KDQo+IA0KPiBBbHNvLCBpbiBnZW5lcmFsLCB0aGUgY29tbWVudHMgYXJlIG1p
c3NpbmcgZm9yIGZ1bmN0aW9ucyBpbg0KPiB0YXMyNzgxX3NwaV9md2xpYi5jIGNvbXBsZXRlbHku
ICBBIGJyaWVmIGNvbW1lbnQgZm9yIGVhY2ggZnVuY3Rpb24NCj4gd291bGQgYmUgaGVscGZ1bCBm
b3IgcmVhZGVycy4NCj4gDQo+IA0KPiB0aGFua3MsDQo+IA0KPiBUYWthc2hpDQo+IA0KPiANCj4g
