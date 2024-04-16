Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A375F8A9F39
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:56:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4FE12345;
	Thu, 18 Apr 2024 17:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4FE12345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455770;
	bh=IyzfxVrDw1VKb/tX0dKeY4SEiZVyXJAc1EWfC+D6z9w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TQuzCJg7d7HjUTwHQeerQhyOxJiDBTqwYQnSBuHG7Ly4QC+XaPBetNBkCsEZvVRLB
	 hucd+AKUpu2zd5FzDR4orCLkjtq/jeYzprg/WuDBUArqK+0EowRGg1TLXaR8mEJ36u
	 tDTym09Odj2yD1lxAfWUfaiPid5CfLQDwHJyxEj0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BA43F80878; Thu, 18 Apr 2024 17:49:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48DBDF80845;
	Thu, 18 Apr 2024 17:49:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25E90F8025A; Tue, 16 Apr 2024 09:45:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CCE2AF8003A
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 09:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCE2AF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=PhtmUUqV
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43G7jMA2038911;
	Tue, 16 Apr 2024 02:45:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713253522;
	bh=IyzfxVrDw1VKb/tX0dKeY4SEiZVyXJAc1EWfC+D6z9w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=PhtmUUqVEa9jaLawwCx3GcGXr4r7QsKgcLAVyazhL7710VNVw48PFUGYpjF8/8idi
	 +Eo9XAdtWu9iDLFeae3m2Bqjd0hY2ESjfHwTmW+/eYlYR6Gi95Q2/qdy3jgQ7Bp8gy
	 FhfVF/GMwmKYVkGQ1UOJI75xy1ydmtM5X6cE6x8Q=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43G7jMSp063899
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Apr 2024 02:45:22 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Apr 2024 02:45:22 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
 DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
 15.01.2507.023; Tue, 16 Apr 2024 02:45:22 -0500
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
        "soyer@irl.hu" <soyer@irl.hu>,
        "13916275206@139.com" <13916275206@139.com>
Subject: Re: [EXTERNAL] Re: [PATCH v2 1/3] ALSA: hda/tas2781: Modification for
 add tas2781 driver for SPI
Thread-Topic: [EXTERNAL] Re: [PATCH v2 1/3] ALSA: hda/tas2781: Modification
 for add tas2781 driver for SPI
Thread-Index: AQHaiih39yNiM6f7+Uenyc3gmo9onLFgO/YAgApTDWA=
Date: Tue, 16 Apr 2024 07:45:21 +0000
Message-ID: <9287a3c1a2384cacad92652fdd1cac2e@ti.com>
References: <20240409024816.1180-1-baojun.xu@ti.com>
 <20240409024816.1180-2-baojun.xu@ti.com>,<ZhU8fCOLOlu4azGL@smile.fi.intel.com>
In-Reply-To: <ZhU8fCOLOlu4azGL@smile.fi.intel.com>
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
Message-ID-Hash: PYURAKBQZ44FAPQ3BEQSWEAAR243FE6U
X-Message-ID-Hash: PYURAKBQZ44FAPQ3BEQSWEAAR243FE6U
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:47:36 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgQW5keSwNCg0KVGhhbnNrIGZvciB5b3VyIHN1Z2dlc3Rpb25zLCBhbnN3ZXIgaW4gbGluZS4N
Cj4gRnJvbTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5j
b20+DQo+IFNlbnQ6IDA5IEFwcmlsIDIwMjQgMjE6MDINCj4gVG86IFh1LCBCYW9qdW4NCj4gQ2M6
IHRpd2FpQHN1c2UuZGU7IHJvYmgrZHRAa2VybmVsLm9yZzsgbGdpcmR3b29kQGdtYWlsLmNvbTsg
cGVyZXhAcGVyZXguY3o7IHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbTsgTHUs
IEtldmluOyBEaW5nLCBTaGVuZ2hhbzsgTmF2YWRhIEthbnlhbmEsIE11a3VuZDsgYWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaWFtLnIu
Z2lyZHdvb2RAaW50ZWwuY29tOyB5dW5nLWNodWFuLmxpYW9AbGludXguaW50ZWwuY29tOyBicm9v
bmllQGtlcm5lbC5vcmc7IHNveWVyQGlybC5odQ0KPiBTdWJqZWN0OiBbRVhURVJOQUxdIFJlOiBb
UEFUQ0ggdjIgMS8zXSBBTFNBOiBoZGEvdGFzMjc4MTogTW9kaWZpY2F0aW9uIGZvciBhZGQgdGFz
Mjc4MSBkcml2ZXIgZm9yIFNQSQ0KPiANCj4gT24gVHVlLCBBcHIgMDksIDIwMjQgYXQgMTA64oCK
NDg64oCKMTNBTSArMDgwMCwgQmFvanVuIFh1IHdyb3RlOiA+IEludGVncmF0ZSB0YXMyNzgxIGNv
bmZpZ3MgZm9yIEhQIExhcHRvcHMuIEV2ZXJ5IHRhczI3ODEgaW4gdGhlIGxhcHRvcCA+IHdpbGwg
d29yayBhcyBhIHNpbmdsZSBzcGVha2VyIG9uIFNQSSBidXMuIFRoZSBjb2RlIHN1cHBvcnQgcmVh
bHRlayBhcyBSZWFsdGVrID4gdGhlIHByaW1hcnkgY29kZWMu4oCKDQo+IFpqUWNtUVJZRnBmcHRC
YW5uZXJTdGFydA0KPiBUaGlzIG1lc3NhZ2Ugd2FzIHNlbnQgZnJvbSBvdXRzaWRlIG9mIFRleGFz
IEluc3RydW1lbnRzLg0KPiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc291cmNlIG9mIHRoaXMgZW1haWwgYW5kIGtub3cgdGhl
IGNvbnRlbnQgaXMgc2FmZS4gSWYgeW91IHdpc2ggdG8gcmVwb3J0IHRoaXMgbWVzc2FnZSB0byBJ
VCBTZWN1cml0eSwgcGxlYXNlIGZvcndhcmQgdGhlIG1lc3NhZ2UgYXMgYW4gYXR0YWNobWVudCB0
byBwaGlzaGluZ0BsaXN0LnRpLmNvbQ0KPiANCj4gWmpRY21RUllGcGZwdEJhbm5lckVuZA0KPiAN
Cj4gT24gVHVlLCBBcHIgMDksIDIwMjQgYXQgMTA6NDg6MTNBTSArMDgwMCwgQmFvanVuIFh1IHdy
b3RlOg0KPiA+IEludGVncmF0ZSB0YXMyNzgxIGNvbmZpZ3MgZm9yIEhQIExhcHRvcHMuIEV2ZXJ5
IHRhczI3ODEgaW4gdGhlIGxhcHRvcA0KPiA+IHdpbGwgd29yayBhcyBhIHNpbmdsZSBzcGVha2Vy
IG9uIFNQSSBidXMuIFRoZSBjb2RlIHN1cHBvcnQgcmVhbHRlayBhcw0KPiANCj4gUmVhbHRlaw0K
PiANCj4gPiB0aGUgcHJpbWFyeSBjb2RlYy4NCj4gDQo+IC4uLg0KPiANCj4gPiAgICAgICAgICAg
ICAgIHsiSU5UMzNGRSIsIH0sDQo+ID4gICAgICAgICAgICAgICB7IklOVDM1MTUiLCB9LA0KPiA+
ICAgICAgICAgICAgICAgLyogTm9uLWNvbmZvcm1pbmcgX0hJRCBmb3IgQ2lycnVzIExvZ2ljIGFs
cmVhZHkgcmVsZWFzZWQgKi8NCj4gPiArICAgICAgICAgICAgIHsiVFhOVzI3ODEiLCB9LA0KPiAN
Cj4gVGhpcyBzZWVtcyB3cm9uZy4gVGhlIElEIGhlcmUgaXMgY29ycmVjdCBmcm9tIEFDUEkgc3Bl
Y2lmaWNhdGlvbiBwZXJzcGVjdGl2ZS4NCj4gQ2FuIHlvdSBlbGFib3JhdGUgd2h5IHlvdSB0aGlu
ayBpdCdzICJub24tY29uZm9ybWluZyBfSElEIj8NCg0KSnVzdCBwdXQgaW50byBtaWRkbGUgb2Yg
YXJyYXksIHNob3VsZCBubyBlZmZlY3RpdmUgdG8gZnVuY3Rpb25zLg0KT2ssIEkgd2lsbCBjaGFu
Z2UgaXQncyBwb3NpdGlvbiBpbiBuZXh0IHBhdGNoLg0KPiANCj4gPiAgICAgICAgICAgICAgIHsi
Q0xTQTAxMDAiLCB9LA0KPiA+ICAgICAgICAgICAgICAgeyJDTFNBMDEwMSIsIH0sDQo+ID4gDQo+
ID4gLi4uDQo+IA0KPiA+ICAgICAgIC8qIE5vbi1jb25mb3JtaW5nIF9ISUQgZm9yIENpcnJ1cyBM
b2dpYyBhbHJlYWR5IHJlbGVhc2VkICovDQo+ID4gICAgICAgeyAiQ0xTQTAxMDAiLCAodW5zaWdu
ZWQgbG9uZykmY3MzNWw0MV9oZGEgfSwNCj4gPiAgICAgICB7ICJDTFNBMDEwMSIsICh1bnNpZ25l
ZCBsb25nKSZjczM1bDQxX2hkYSB9LA0KPiA+ICsgICAgIHsgIlRYTlcyNzgxIiwgKHVuc2lnbmVk
IGxvbmcpJnRhczI3ODFfaGRhIH0sDQo+IA0KPiBEaXR0by4NCj4gDQo+ID4gICAgICAgeyB9DQo+
IA0KPiAuLi4NCj4gDQo+ID4gQEAgLTM5LDYgKzM5LDcgQEAgc25kLWhkYS1zY29kZWMtY3MzNWw1
Ni1zcGktb2JqcyA6PSAgY3MzNWw1Nl9oZGFfc3BpLm8NCj4gPiAgc25kLWhkYS1jcy1kc3AtY3Rs
cy1vYmpzIDo9ICAgICAgICAgIGhkYV9jc19kc3BfY3RsLm8NCj4gPiAgc25kLWhkYS1zY29kZWMt
Y29tcG9uZW50LW9ianMgOj0gICAgIGhkYV9jb21wb25lbnQubw0KPiA+ICBzbmQtaGRhLXNjb2Rl
Yy10YXMyNzgxLWkyYy1vYmpzIDo9ICAgdGFzMjc4MV9oZGFfaTJjLm8NCj4gPiArc25kLWhkYS1z
Y29kZWMtdGFzMjc4MS1zcGktb2JqcyA6PSAgIHRhczI3ODFfaGRhX3NwaS5vIHRhczI3ODFfc3Bp
X2Z3bGliLm8NCj4gDQo+IEFjdHVhbGx5IHRoZXNlICdvYmpzJyBoYXMgdG8gYmUgJ3knLCBjYW4g
eW91IGZpeCBpdCBpbiB0aGUgcHJlcmVxdWlzaXRlIHBhdGNoPw0KPiANCg0KRG8geW91IG1lYW4g
c2V0IENPTkZJR19TTkRfSERBX1NDT0RFQ19UQVMyNzgxX1NQST15IGluIC5jb25maWc/DQpJdCdz
IG0gbm93Lg0KDQo+IEFsc28gd29uZGVyaW5nIHdoeSBmd2xpYiBpcyBvbmx5IGEgcmVxdWlyZW1l
bnQgZm9yIFNQSS4gSG93IGRvZXMgScKyQyB3b3JrPw0KDQpCZWNhdXNlIGluIEkyQyBtb2RlLCBv
bmUgcHJvYmVkIGRldmljZSBkcml2ZXIgd2lsbCBzdXBwb3J0IGFsbCBkZXZpY2VzLA0KZmlybXdh
cmUgYmluYXJ5IGlzIG9ubHkgb25lIGZpbGUsIGluY2x1ZGUgYWxsIG9mIGRldmljZXMuDQpCdXQg
aW4gU1BJIG1vZGUsIG11bHRpIGRyaXZlciBwcm9iZWQsIHNvIHdlIHVzZSBzaW5nbGUgZmlybXdh
cmUgYmluYXJ5IGZvcg0KZXZlcnkgc3BpIGRldmljZS4NCg0KPiANCj4gLS0NCj4gV2l0aCBCZXN0
IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KPiANCj4gDQo+IA0KDQpCZXN0IFJlZ2FyZHMN
CkppbQ0KDQoNCg0KDQo=
