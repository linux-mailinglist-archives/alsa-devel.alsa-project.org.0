Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E688C4C59
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2024 08:33:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E83096C1;
	Tue, 14 May 2024 08:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E83096C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715668436;
	bh=kBAcps8nyWv/1jmLqIvu/lxyDrTrvBsKKoN14C+MCRU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RrZunor7BNggOlg7J37Vpo+cEak7hwM97OnOA/RRSd1CcosJzvi/g6TG9kB51iwAd
	 IcVhoP2ogWnqq+4RCOy6ZHE70oVlwjgr/zUa9LXt3I+uZc3d23PA/dz5zi2ZsUkXMl
	 OMojfehbR/N4cZbOV+Xq2MUnaAgJchD9VDHmrjWc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BA7EF80570; Tue, 14 May 2024 08:33:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E3A7F8059F;
	Tue, 14 May 2024 08:33:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6ED1F80224; Tue, 14 May 2024 08:31:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B12CF8003A
	for <alsa-devel@alsa-project.org>; Tue, 14 May 2024 08:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B12CF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=euQya6Xp
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44E6VMF9027337;
	Tue, 14 May 2024 01:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715668282;
	bh=kBAcps8nyWv/1jmLqIvu/lxyDrTrvBsKKoN14C+MCRU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=euQya6XpMYTG5ptwemU6BB43YtzDjBM2NtHxsHyFiCADBQhytzV+bgaVkEfSy8SL1
	 cyqzDt4uuoLViXhu4zTUq3pc11/UTV2WXYRlhp9YiVT/Izge+DRPNXOaaJtWxBl0NC
	 TKc4eSwj+e6Qj8aaFVgVg3aGsHzgvHlUsOT5R3CI=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44E6VMpD011074
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 May 2024 01:31:22 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 14
 May 2024 01:31:22 -0500
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Tue, 14 May 2024 01:31:22 -0500
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
Subject: RE: [EXTERNAL] Re: [PATCH v5 2/3] ASoC: tas2781: Fix wrong loading
 calibrated data sequence
Thread-Topic: [EXTERNAL] Re: [PATCH v5 2/3] ASoC: tas2781: Fix wrong loading
 calibrated data sequence
Thread-Index: AQHapBc5leN0axZoFUGYCdnWILUBZLGVRDAAgAEC+0A=
Date: Tue, 14 May 2024 06:31:22 +0000
Message-ID: <d9dd889f18ec4265a50a2490d80999c2@ti.com>
References: <20240512025040.1276-1-shenghao-ding@ti.com>
 <20240512025040.1276-2-shenghao-ding@ti.com>
 <ZkHkjhxIZ8I0s3-D@smile.fi.intel.com>
In-Reply-To: <ZkHkjhxIZ8I0s3-D@smile.fi.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.85.14.106]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: 4RINTS74PK7LOTNTKJEJ3ECU7WDM6SZG
X-Message-ID-Hash: 4RINTS74PK7LOTNTKJEJ3ECU7WDM6SZG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RINTS74PK7LOTNTKJEJ3ECU7WDM6SZG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgQW5keQ0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnQuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51
eC5pbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTWF5IDEzLCAyMDI0IDY6MDAgUE0NCj4gVG86
IERpbmcsIFNoZW5naGFvIDxzaGVuZ2hhby1kaW5nQHRpLmNvbT4NCj4gQ2M6IGJyb29uaWVAa2Vy
bmVsLm9yZzsgbGdpcmR3b29kQGdtYWlsLmNvbTsgcGVyZXhAcGVyZXguY3o7IHBpZXJyZS0NCj4g
bG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb207IDEzOTE2Mjc1MjA2QDEzOS5jb207IGFsc2Et
ZGV2ZWxAYWxzYS0NCj4gcHJvamVjdC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IGxpYW0uci5naXJkd29vZEBpbnRlbC5jb207DQo+IGJhcmQubGlhb0BpbnRlbC5jb207IHl1bmct
Y2h1YW4ubGlhb0BsaW51eC5pbnRlbC5jb207IEx1LCBLZXZpbiA8a2V2aW4tDQo+IGx1QHRpLmNv
bT47IGNhbWVyb24uYmVya2VucGFzQGdtYWlsLmNvbTsgdGl3YWlAc3VzZS5kZTsgWHUsIEJhb2p1
bg0KPiA8YmFvanVuLnh1QHRpLmNvbT47IHNveWVyQGlybC5odTsgQmFvanVuLlh1QGZwdC5jb20N
Cj4gU3ViamVjdDogW0VYVEVSTkFMXSBSZTogW1BBVENIIHY1IDIvM10gQVNvQzogdGFzMjc4MTog
Rml4IHdyb25nIGxvYWRpbmcNCj4gY2FsaWJyYXRlZCBkYXRhIHNlcXVlbmNlDQo+IA0KPiBPbiBT
dW4sIE1heSAxMiwgMjAyNCBhdCAxMDo1MDozOEFNICswODAwLCBTaGVuZ2hhbyBEaW5nIHdyb3Rl
Og0KPiA+IENhbGlicmF0ZWQgZGF0YSB3aWxsIGJlIHNldCB0byBkZWZhdWx0IGFmdGVyIGxvYWRp
bmcgRFNQIGNvbmZpZw0KPiA+IHBhcmFtcywgd2hpY2ggd2lsbCBjYXVzZSBzcGVha2VyIHByb3Rl
Y3Rpb24gd29yayBhYm5vcm1hbGx5LiBSZWxvYWQNCj4gPiBjYWxpYnJhdGVkIGRhdGEgYWZ0ZXIg
bG9hZGluZyBEU1AgY29uZmlnIHBhcmFtcy4NCj4gDQo+IC4uLg0KPiANCj4gPiAtaW50IHRhc2Rl
dmljZV9wcm1nX2NhbGliZGF0YV9sb2FkKHZvaWQgKmNvbnRleHQsIGludCBwcm1fbm8pDQo+IA0K
PiA+IC1FWFBPUlRfU1lNQk9MX05TX0dQTCh0YXNkZXZpY2VfcHJtZ19jYWxpYmRhdGFfbG9hZCwN
Cj4gPiAtCVNORF9TT0NfVEFTMjc4MV9GTVdMSUIpOw0KPiANCj4gQUZBSUNTIHRoZSBpMmMgZ2x1
ZSBkcml2ZXIgc3RpbGwgdXNlcyB0aGlzLCBob3cgY2FuJ3QgdGhpcyBicmVhayB0aGUgYnVpbGQ/
DQpbUEFUQ0ggdjUgMy8zXSBoYXMgcmVtb3ZlZCB0YXNkZXZpY2VfcHJtZ19jYWxpYmRhdGFfbG9h
ZCwgYW5kIA0KdGFzZGV2aWNlX3BybWdfbG9hZCh0YXNfcHJpdiwgMCkgaGFzIGJlZW4gY2FsbGVk
IGluc3RlYWQgb2YgDQp0YXNkZXZpY2VfcHJtZ19jYWxpYmRhdGFfbG9hZA0KPiANCj4gLS0NCj4g
V2l0aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KPiANCg0K
