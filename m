Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B1E860EFD
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 11:15:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E06A822;
	Fri, 23 Feb 2024 11:15:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E06A822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708683320;
	bh=37HKWk+1l9rQI4X1WHzhC3iAJrv2QzIQ6fDYvLtvSVc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=opFeMG29uKN++h9NnxHEmbyxqZ48G3CHO/RpTDsxGeSCp/OnAo2zxiqyp+9fXYF+j
	 GxDaxczSwrYdrspN9wzIyYO9VhqhkMhAJaf0jDsnn2Fq5oQIrMXbgYWD01veMwXZz1
	 H9+bl6Yg7Fv8CY/yKHMvSBvoN3x6B+jx3E0CtTl8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80775F8057E; Fri, 23 Feb 2024 11:14:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2C23F805A0;
	Fri, 23 Feb 2024 11:14:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A34DFF80496; Fri, 23 Feb 2024 11:13:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DA23F800EE
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 11:12:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DA23F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=cEn1wXOx
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41NACnXs106918;
	Fri, 23 Feb 2024 04:12:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708683169;
	bh=37HKWk+1l9rQI4X1WHzhC3iAJrv2QzIQ6fDYvLtvSVc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=cEn1wXOx3SoP06w+5eemHx1WZVf/fXDdIe8uw4MsdbfYG7aD32No1tb7N65OHsxcS
	 TNrn5RD4IyN+JLq7AgZ/fpM0JF9YsDbl/sI4Do11LhWZhG1gfzHRMBoApepvpArkRX
	 B62dxt8Jux54tgrzfAAVOKGWPBGhQgFEfIHPC7cU=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41NACn2i026319
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Feb 2024 04:12:49 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 Feb 2024 04:12:49 -0600
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Fri, 23 Feb 2024 04:12:49 -0600
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz"
	<perex@perex.cz>,
        "13916275206@139.com" <13916275206@139.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
        "bard.liao@intel.com" <bard.liao@intel.com>,
        "mengdong.lin@intel.com"
	<mengdong.lin@intel.com>,
        "yung-chuan.liao@linux.intel.com"
	<yung-chuan.liao@linux.intel.com>,
        "Xu, Baojun" <baojun.xu@ti.com>, "Lu,
 Kevin" <kevin-lu@ti.com>,
        "tiwai@suse.de" <tiwai@suse.de>, "soyer@irl.hu"
	<soyer@irl.hu>
Subject: RE: [EXTERNAL] Re: [PATCH v9] ASoc: tas2783: Add tas2783 codec driver
Thread-Topic: [EXTERNAL] Re: [PATCH v9] ASoc: tas2783: Add tas2783 codec
 driver
Thread-Index: AQHaZWJdzl/3F/uZLk2mYU9psTSIi7EXdCuAgABAqsA=
Date: Fri, 23 Feb 2024 10:12:49 +0000
Message-ID: <5c7127256bf54fcd921fc1ec83f3e527@ti.com>
References: <20240222074000.659-1-shenghao-ding@ti.com>
 <10f53a13-a0ff-40f9-b089-f5baacdb76b6@linux.intel.com>
In-Reply-To: <10f53a13-a0ff-40f9-b089-f5baacdb76b6@linux.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.14.246]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: 2WAVQ5VYJPTTYT2G2BXE5GQ6T63O6RNJ
X-Message-ID-Hash: 2WAVQ5VYJPTTYT2G2BXE5GQ6T63O6RNJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2WAVQ5VYJPTTYT2G2BXE5GQ6T63O6RNJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgUGllcnJlLUxvdWlzDQpUaGFua3MgZm9yIHlvdXIgY2FyZWZ1bCByZXZpZXcuDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJvc3NhcnQgPHBp
ZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBGZWJy
dWFyeSAyMywgMjAyNCA4OjE0IEFNDQo+IFRvOiBEaW5nLCBTaGVuZ2hhbyA8c2hlbmdoYW8tZGlu
Z0B0aS5jb20+OyBicm9vbmllQGtlcm5lbC5vcmcNCj4gQ2M6IGFuZHJpeS5zaGV2Y2hlbmtvQGxp
bnV4LmludGVsLmNvbTsgbGdpcmR3b29kQGdtYWlsLmNvbTsNCj4gcGVyZXhAcGVyZXguY3o7IDEz
OTE2Mjc1MjA2QDEzOS5jb207IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsNCj4gbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGlhbS5yLmdpcmR3b29kQGludGVsLmNvbTsNCj4gYmFy
ZC5saWFvQGludGVsLmNvbTsgbWVuZ2RvbmcubGluQGludGVsLmNvbTsgeXVuZy0NCj4gY2h1YW4u
bGlhb0BsaW51eC5pbnRlbC5jb207IFh1LCBCYW9qdW4gPGJhb2p1bi54dUB0aS5jb20+OyBMdSwg
S2V2aW4NCj4gPGtldmluLWx1QHRpLmNvbT47IHRpd2FpQHN1c2UuZGU7IHNveWVyQGlybC5odQ0K
PiBTdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBbUEFUQ0ggdjldIEFTb2M6IHRhczI3ODM6IEFkZCB0
YXMyNzgzIGNvZGVjIGRyaXZlcg0KPiANCj4gT24gMi8yMi8yNCAyOuKAijQwIEFNLCBTaGVuZ2hh
byBEaW5nIHdyb3RlOiA+IFRoZSB0YXMyNzgzIGlzIGEgc21hcnQgYXVkaW8NCj4gYW1wbGlmaWVy
IHdpdGggaW50ZWdyYXRlZCBNSVBJIFNvdW5kV2lyZSA+IGludGVyZmFjZSAoVmVyc2lvbiAxLuKA
ijIu4oCKMQ0KPiBjb21wbGlhbnQpLCBJMkMsIGFuZCBJMlMvVERNIGludGVyZmFjZXMgZGVzaWdu
ZWQgPiBmb3IgcG9ydGFibGUNCj4gYXBwbGljYXRpb25zLiBBbiBvbi1jaGlwIERTUCBaalFjbVFS
WUZwZnB0QmFubmVyU3RhcnQgVGhpcyBtZXNzYWdlIHdhcw0KPiBzZW50IGZyb20gb3V0c2lkZSBv
ZiBUZXhhcyBJbnN0cnVtZW50cy4NCj4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNvdXJjZSBvZg0KPiB0aGlzIGVtYWlsIGFu
ZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiBaalFjbVFSWUZwZnB0QmFubmVyRW5k
DQo+IE9uIDIvMjIvMjQgMjo0MCBBTSwgU2hlbmdoYW8gRGluZyB3cm90ZToNCj4gPiBUaGUgdGFz
Mjc4MyBpcyBhIHNtYXJ0IGF1ZGlvIGFtcGxpZmllciB3aXRoIGludGVncmF0ZWQgTUlQSSBTb3Vu
ZFdpcmUNCj4gPiBpbnRlcmZhY2UgKFZlcnNpb24gMS4yLjEgY29tcGxpYW50KSwgSTJDLCBhbmQg
STJTL1RETSBpbnRlcmZhY2VzDQo+ID4gZGVzaWduZWQgZm9yIHBvcnRhYmxlIGFwcGxpY2F0aW9u
cy4gQW4gb24tY2hpcCBEU1Agc3VwcG9ydHMgVGV4YXMNCj4gPiBJbnN0cnVtZW50cyBTbWFydEFt
cCBzcGVha2VyIHByb3RlY3Rpb24gYWxnb3JpdGhtLiBUaGUgaW50ZWdyYXRlZA0KPiA+IHNwZWFr
ZXIgdm9sdGFnZSBhbmQgY3VycmVudCBzZW5zZSBwcm92aWRlcyBmb3IgcmVhbC10aW1lIG1vbml0
b3Jpbmcgb2YNCj4gbG9kc3BlYWtlcnMuDQo+IA0KPiBsb3Vkc3BlYWtlcnMuDQo+IA0KPiANCj4g
PiArc3RhdGljIHZvaWQgdGFzMjc4M19hcHBseV9jYWxpYihzdHJ1Y3QgdGFzZGV2aWNlX3ByaXYg
KnRhc19kZXYsDQo+ID4gKwl1bnNpZ25lZCBpbnQgKmNhbGlfZGF0YSkNCj4gPiArew0KPiA+ICsJ
c3RydWN0IHJlZ21hcCAqbWFwID0gdGFzX2Rldi0+cmVnbWFwOw0KPiA+ICsJdTggKmNhbGlfc3Rh
cnQ7DQo+ID4gKwl1MTYgb2Zmc2V0Ow0KPiA+ICsJaW50IHJldDsNCj4gPiArDQo+ID4gKwlpZiAo
IXRhc19kZXYtPnNkd19wZXJpcGhlcmFsKSB7DQo+ID4gKwkJZGV2X2Vycih0YXNfZGV2LT5kZXYs
ICIlczogcGVyaXBoZXJhbCBkb2Vzbid0IGV4aXN0LlxuIiwNCj4gPiArCQkJX19mdW5jX18pOw0K
PiA+ICsJCXJldHVybjsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlvZmZzZXQgPSB0YXNfZGV2LT5z
ZHdfcGVyaXBoZXJhbC0+aWQudW5pcXVlX2lkIC0NCj4gPiArCQlUQVMyNzgzX1VOSVFVRV9JRF9C
QVNFOw0KPiA+ICsJaWYgKG9mZnNldCA+PSBUQVMyNzgzX01BWF9ERVZfTlVNKSB7DQo+ID4gKwkJ
ZGV2X2Vycih0YXNfZGV2LT5kZXYsICIlczogb2Zmc2V0KCV1KSBpcyBvdXQgb2YgcmFuZ2UuXG4i
LA0KPiA+ICsJCQkgX19mdW5jX18sIG9mZnNldCk7DQo+ID4gKwkJcmV0dXJuOw0KPiA+ICsJfQ0K
PiANCj4gSSB0aGluayB3ZSBhcmUgYXQgdGhlIDR0aCBpdGVyYXRpb24gd2hlcmUgSSBoYXZlIHRv
IHJlcGVhdCBteXNlbGYuLi4NCj4gDQo+IEluIHRoZSBTb3VuZFdpcmUgc3BlYywgdGhlIHVuaXF1
ZV9pZCBpcyAqTElOSyBTUEVDSUZJQyosIGFuZCBvbmx5IHVzZWQgYXQNCj4gdGhlIGJ1cyBsZXZl
bCB3aXRoaW4gdGhlIGNvbnRleHQgb2YgYSBsaW5rIHRvIGhlbHAgYXZvaWQgZW51bWVyYXRpb24N
Cj4gY29uZmxpY3RzDQo+IA0KPiBJZiB5b3UgYXJlIHVzaW5nIHRoZSB1bmlxdWVfaWQgYXMgYSBT
WVNURU0tVU5JUVVFIHZhbHVlIHRvIGxvb2t1cCBFRkkNCj4gZGF0YSwgdGhpcyBpcyBhIFRJLXNw
ZWNpZmljIHJlcXVpcmVtZW50IHRoYXQgbmVlZHMgdG8gYmUgZG9jdW1lbnRlZC4NCj4gVGhhdCBh
bHNvIG1lYW5zIHlvdSBuZWVkIHRvIGRvdWJsZS1jaGVjayBmb3IgZXJyb3JzIHNvIG1ha2Ugc3Vy
ZSB0aGVyZQ0KPiBhcmUgbm8gYm9hcmQgY29uZmlndXJhdGlvbnMgd2hlcmUgdGhlIHNhbWUgdW5p
cXVlX2lkIGlzIHVzZWQgaW4gbXVsdGlwbGUNCj4gbGlua3MsIG9yIGJ5IGRldmljZXMgb3RoZXIg
dGhhbiB0YXMyNzgzLg0KPiANCj4gDQpUaGlzIGNvZGUgb25seSBjb3ZlcnMgdGhlIHRhczI3ODNz
IHNpdHRpbmcgaW4gdGhlIHNhbWUgYnVzIGxpbmsuIEFzIHRvIGNhc2VzIG9mIHRoZQ0KZGlmZmVy
ZW50IFNXRCBsaW5rcywgY3VzdG9tZXIgd2lsbCBiZSByZXF1aXJlZCB0byBoYXZlIHRoZSBzZWNv
bmRhcnkgZGV2ZWxvcG1lbnQNCm9uIGN1cnJlbnQgY29kZS4gSSdtIHN1cmUgbXkgY3VzdG9tZXJz
IGhhdmUgbXVjaCBrbm93bGVkZ2UgdG8gaGFuZGxlIHRoaXMuDQo=
