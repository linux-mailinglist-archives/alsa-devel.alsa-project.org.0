Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2B689AF2A
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:24:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1676627A9;
	Sun,  7 Apr 2024 09:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1676627A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474672;
	bh=o5S+UxNF125Pskjpt2W7ta/rRV8iC3M1CgrPZAEMvxs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rVpDU1GcZtz5zzK9avl+0wjNLSoprlKScoGbB0ifF0RZtnBmtvfzCLN97nX9nCGN0
	 1CbV4GxlxGgQTjinYowWxH7QcZc3Q4uo6V/s4virHIEiE0407tCi9I669os7zIVe1r
	 4YMzGm9+Cxl5RLjxHg9YXLv1OHjPPPhLHX3oIiL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76F4DF89769; Sun,  7 Apr 2024 09:18:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04A82F89782;
	Sun,  7 Apr 2024 09:18:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E01AFF8020D; Fri,  5 Apr 2024 18:17:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 662DFF80130
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 18:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 662DFF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=M6viPBL4
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 435GHaNe067055;
	Fri, 5 Apr 2024 11:17:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712333856;
	bh=o5S+UxNF125Pskjpt2W7ta/rRV8iC3M1CgrPZAEMvxs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=M6viPBL4DtZaa423jgHOvPtqVC8zKMBCeMerAd7is56fdA8nmN8kuJqHfQMFvl2b3
	 1/SSsEHeVt+iKZ7F65ZNb9gPD2MuIm9NtK3cWX3aJbpU3/K0jLLRjbaHxKuHzwdyaR
	 GaKeSe2E9ea7Y0A/FFM7z/b7HwHtZnWAWugzCcmc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 435GHaHe100643
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Apr 2024 11:17:36 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Apr 2024 11:17:36 -0500
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
 DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
 15.01.2507.023; Fri, 5 Apr 2024 11:17:36 -0500
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
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
        "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "soyer@irl.hu" <soyer@irl.hu>, "Ding, Shenghao" <shenghao-ding@ti.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1 1/8] ALSA: hda/tas2781: Add tas2781
 SPI-based driver
Thread-Topic: [EXTERNAL] Re: [PATCH v1 1/8] ALSA: hda/tas2781: Add tas2781
 SPI-based driver
Thread-Index: AQHafxo5IW5tOheUY0SppY7DLoQbSrFKcdKAgA918f0=
Date: Fri, 5 Apr 2024 16:17:35 +0000
Message-ID: <cffbbb592b68472184687ca6d48bb699@ti.com>
References: 
 <20240326010905.2147-1-baojun.xu@ti.com>,<ZgLipy9f67JfZhx4@smile.fi.intel.com>
In-Reply-To: <ZgLipy9f67JfZhx4@smile.fi.intel.com>
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
Message-ID-Hash: P7H76ZXFTM7FUXFVIMTOFEIUFMLTSRAB
X-Message-ID-Hash: P7H76ZXFTM7FUXFVIMTOFEIUFMLTSRAB
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:15:59 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7H76ZXFTM7FUXFVIMTOFEIUFMLTSRAB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGkgQW5keSwNCg0KQW5zd2VyIGlubGluZToNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0Bs
aW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IDI2IE1hcmNoIDIwMjQgMjI6NTgNCj4gVG86IFh1LCBC
YW9qdW4NCj4gQ2M6IHRpd2FpQHN1c2UuZGU7IHJvYmgrZHRAa2VybmVsLm9yZzsgbGdpcmR3b29k
QGdtYWlsLmNvbTsgcGVyZXhAcGVyZXguY3o7IHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4Lmlu
dGVsLmNvbTsgTHUsIEtldmluOyAxMzkxNjI3NTIwNkAxMzkuY29tOyBhbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpYW0uci5naXJkd29v
ZEBpbnRlbC5jb207IHl1bmctY2h1YW4ubGlhb0BsaW51eC5pbnRlbC5jb207IGJyb29uaWVAa2Vy
bmVsLm9yZzsgc295ZXJAaXJsLmh1DQo+IFN1YmplY3Q6IFtFWFRFUk5BTF0gUmU6IFtQQVRDSCB2
MSAxLzhdIEFMU0E6IGhkYS90YXMyNzgxOiBBZGQgdGFzMjc4MSBTUEktYmFzZWQgZHJpdmVyDQo+
IA0KPiBPbiBUdWUsIE1hciAyNiwgMjAyNCBhdCAwOTrigIowODrigIo1OEFNICswODAwLCBCYW9q
dW4gWHUgd3JvdGU6ID4gQWRkIFRYTlcyNzgxIHN1cHBvcnQgaW4gc21pLiBXaGF0IGlzICdzbWkn
PyBDYW4geW91IG1ha2UgbWVzc2FnZSBsZXNzIGNyeXB0aWMsIHBsZWFzZT8gQWxzbyBleHBsYWlu
IHdoeSBpdCBzaG91bGQgYmUgaW4gdGhhdCBsaXN0IGluIHNjYW4u4oCKYy4gQ29kZSB3aXNlIExH
VE0sIHNvIHdpdGggY29tbWl0IG1lc3NhZ2UNCj4gWmpRY21RUllGcGZwdEJhbm5lclN0YXJ0DQo+
IFRoaXMgbWVzc2FnZSB3YXMgc2VudCBmcm9tIG91dHNpZGUgb2YgVGV4YXMgSW5zdHJ1bWVudHMu
DQo+IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVj
b2duaXplIHRoZSBzb3VyY2Ugb2YgdGhpcyBlbWFpbCBhbmQga25vdyB0aGUgY29udGVudCBpcyBz
YWZlLg0KPiANCj4gWmpRY21RUllGcGZwdEJhbm5lckVuZA0KPiANCj4gT24gVHVlLCBNYXIgMjYs
IDIwMjQgYXQgMDk6MDg6NThBTSArMDgwMCwgQmFvanVuIFh1IHdyb3RlOg0KPiA+IEFkZCBUWE5X
Mjc4MSBzdXBwb3J0IGluIHNtaS4NCj4gDQo+IFdoYXQgaXMgJ3NtaSc/IENhbiB5b3UgbWFrZSBt
ZXNzYWdlIGxlc3MgY3J5cHRpYywgcGxlYXNlPw0KPiBBbHNvIGV4cGxhaW4gd2h5IGl0IHNob3Vs
ZCBiZSBpbiB0aGF0IGxpc3QgaW4gc2Nhbi5jLg0KU01JIG1lYW4gZHJpdmVycy9wbGF0Zm9ybS94
ODYvc2VyaWFsLW11bHRpLWluc3RhbnRpYXRlLmMsIGl0IGFkZCBtdWx0aS1zcGkNCmRldmljZXMg
d2l0aGluIG9uZSBBQ1BJIG5vZGUsIGFuZCBpdCBtZW50aW9uZWQgbmV3IGRldmljZS1pZHMgbXVz
dCBhbHNvIGJlDQphZGRlZCB0byBpZ25vcmVfc2VyaWFsX2J1c19pZHMgaW4gZHJpdmVycy9hY3Bp
L3NjYW4uYy4NCg0KQW4gQUNQSSBub2RlIGV4YW1wbGUgbGlrZSBiZWxvdzoNCg0KICAgIFNjb3Bl
IChfU0IuUEMwMC5TUEkwKQ0KICAgIHsNCiAgICAgICAgRGV2aWNlIChHU1BLKQ0KICAgICAgICB7
DQogICAgICAgICAgICBOYW1lIChfSElELCAiVFhOVzI3ODEiKSAgLy8gX0hJRDogSGFyZHdhcmUg
SUQNCiAgICAgICAgICAgIE1ldGhvZCAoX0NSUywgMCwgTm90U2VyaWFsaXplZCkgIC8vIF9DUlM6
IEN1cnJlbnQgUmVzb3VyY2UgU2V0dGluZ3MNCiAgICAgICAgICAgIHsNCiAgICAgICAgICAgICAg
ICBOYW1lIChSQlVGLCBSZXNvdXJjZVRlbXBsYXRlICgpDQogICAgICAgICAgICAgICAgew0KICAg
ICAgICAgICAgICAgICAgICBTcGlTZXJpYWxCdXNWMiAoLi4uKQ0KICAgICAgICAgICAgICAgICAg
ICBTcGlTZXJpYWxCdXNWMiAoLi4uKQ0KCQl9DQoJICAgIH0NCgl9DQogICAgfQ0KDQo+IA0KPiBD
b2RlIHdpc2UgTEdUTSwgc28gd2l0aCBjb21taXQgbWVzc2FnZSBmaXhlZCwNCj4gUmV2aWV3ZWQt
Ynk6IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0K
PiANCj4gLS0NCj4gV2l0aCBCZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0KPiANCg0K
