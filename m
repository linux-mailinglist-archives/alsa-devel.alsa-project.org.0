Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EA49851C2
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2024 06:04:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95A2D1E8;
	Wed, 25 Sep 2024 06:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95A2D1E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727237068;
	bh=fawwK7zfaCm1KJ+R3xI8q/VAgHa3aYPaaHiWAjv05U4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Eew2wD75ueY98PBbsZ00omgY7/Ixpo8Dn51jnxwPT5JKAVKymIOi58ANLINKuwfQt
	 oGARcerKnYX1FYfYu50v1vIm3oyh7kxwk2QI/DKlrpt2TGwX2K+0IN7XjAoKHi63jY
	 CJCBa/VnTsv2HkWqejKA2PNSGx8kAQ56D8cusX9E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DDEEF805BB; Wed, 25 Sep 2024 06:03:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39A33F8049C;
	Wed, 25 Sep 2024 06:03:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E674F802DB; Wed, 25 Sep 2024 06:03:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6A9AF8010B
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 06:03:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6A9AF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=H3JdcNSa
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 48P43Z6F04000124,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1727237015; bh=fawwK7zfaCm1KJ+R3xI8q/VAgHa3aYPaaHiWAjv05U4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=H3JdcNSal3aQ38dPrDHbJBElg1ZL3LXiatnqCKwd1P/ibZugWwW/zeVhYBBfsuaFq
	 v4FZP48yQKp8kaYdH5mq6UuWpP2HctALI0fUpbM3B/48u35rz8oHZl6W72hypvuv9f
	 CTe/JxdyLQe5KSefpqYaZetO7thzMo8RraNPvNUW3GuNrx4luWAcuG1AOr0kdA6yo6
	 HFPcEElA3p8fE+pyiZYiehdx2ks24wE1rD66Wl3UZYxfIXhYrABFW6GYtzt0voBnip
	 su+332wYG90HoY4kloupnDCwps8Kar2CHP3Ezo8yZd2w+2AXwpWyI62jTn4MJdgmUH
	 gQdcJyA8fB4FA==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.05/5.92) with ESMTPS id 48P43Z6F04000124
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Sep 2024 12:03:35 +0800
Received: from RTEXDAG02.realtek.com.tw (172.21.6.101) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Sep 2024 12:03:36 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG02.realtek.com.tw (172.21.6.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 25 Sep 2024 12:03:35 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2]) by
 RTEXMBS01.realtek.com.tw ([fe80::147b:e1e8:e867:41c2%7]) with mapi id
 15.01.2507.035; Wed, 25 Sep 2024 12:03:35 +0800
From: Jack Yu <jack.yu@realtek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Mark Brown
	<broonie@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        "lars@metafoo.de" <lars@metafoo.de>,
        "Flove(HsinFu)" <flove@realtek.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
        =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>
Subject: RE: [PATCH v2] ASoC: rt721-sdca: Add RT721 SDCA driver
Thread-Topic: [PATCH v2] ASoC: rt721-sdca: Add RT721 SDCA driver
Thread-Index: AdsOYJgS4lsvgVNrTTKQijbK34dyeP//gwcA//9Y1QCAANKJgIAANpoA//6zkiA=
Date: Wed, 25 Sep 2024 04:03:35 +0000
Message-ID: <20ba8146539441f7a2d1011b49fc5a37@realtek.com>
References: <1538ca2e1df042a7b771cc387b438710@realtek.com>
 <65339ec1-ee9d-40cb-acd2-b6cfa0445c7e@linux.intel.com>
 <1297b09d51654ecfbec2d000175a2c78@realtek.com>
 <ZvKsYUXJ42UZ_bhm@finisterre.sirena.org.uk>
 <12d2ef42-694e-47fc-af85-ab2b27dd8afa@linux.intel.com>
In-Reply-To: <12d2ef42-694e-47fc-af85-ab2b27dd8afa@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: 5A3RCGYM7IPMW36LEI6EH36OZ53ODL35
X-Message-ID-Hash: 5A3RCGYM7IPMW36LEI6EH36OZ53ODL35
X-MailFrom: jack.yu@realtek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5A3RCGYM7IPMW36LEI6EH36OZ53ODL35/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBpZXJyZS1Mb3VpcyBCb3Nz
YXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6IFR1ZXNk
YXksIFNlcHRlbWJlciAyNCwgMjAyNCAxMToyNyBQTQ0KPiBUbzogTWFyayBCcm93biA8YnJvb25p
ZUBrZXJuZWwub3JnPjsgSmFjayBZdSA8amFjay55dUByZWFsdGVrLmNvbT4NCj4gQ2M6IGxnaXJk
d29vZEBnbWFpbC5jb207IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgbGFyc0BtZXRhZm9v
LmRlOw0KPiBGbG92ZShIc2luRnUpIDxmbG92ZUByZWFsdGVrLmNvbT47IE9kZXIgQ2hpb3UgPG9k
ZXJfY2hpb3VAcmVhbHRlay5jb20+Ow0KPiBTaHVtaW5nIFvojIPmm7jpiphdIDxzaHVtaW5nZkBy
ZWFsdGVrLmNvbT47IERlcmVrIFvmlrnlvrfnvqldDQo+IDxkZXJlay5mYW5nQHJlYWx0ZWsuY29t
PjsgQmFyZCBMaWFvIDx5dW5nLWNodWFuLmxpYW9AbGludXguaW50ZWwuY29tPjsNCj4gQ2hhcmxl
cyBLZWVwYXggPGNrZWVwYXhAb3BlbnNvdXJjZS5jaXJydXMuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHYyXSBBU29DOiBydDcyMS1zZGNhOiBBZGQgUlQ3MjEgU0RDQSBkcml2ZXINCj4gDQo+
IA0KPiBFeHRlcm5hbCBtYWlsLg0KPiANCj4gDQo+IA0KPiA+Pj4gVGhhdCB0ZWxscyB1cyBpdCBo
YXMgMyBmdW5jdGlvbnMgKGphY2ssIG1pYywgYW1wKSwgc28gd2hhdCdzIGRpZmZlcmVudCB0bw0K
PiBSVDcyMj8NCj4gPj4+IGNvdWxkIHdlIGhhdmUgYSBzaW5nbGUgZHJpdmVyIGZvciBib3RoIHBh
cnRzPyBBIGxvdCBvZiB0aGlzIGRyaXZlcg0KPiA+Pj4gc2VlbXMgY29weS1wYXN0ZWQtcmVuYW1l
ZC4NCj4gPg0KPiA+PiBSVDcyMSBoYXMgMyBmdW5jdGlvbnMganVzdCBsaWtlIFJUNzIyLCBidXQg
aXQncyBzdGlsbCBhIGRpZmZlcmVudA0KPiA+PiBjb2RlYyBhbmQgZnJvbSBpbnRlcm5hbCBkaXNj
dXNzaW9uLCB3ZSB0aGluayBpdCdzIGJldHRlciB0byBzZXBhcmF0ZSB0aGUNCj4gZHJpdmVyIGZv
ciBmdXR1cmUgY29kZSBtYW5hZ2VtZW50Lg0KPiA+DQo+ID4gQXMgSSBtZW50aW9uZWQgd2l0aCB0
aGUgZXZlbnRzIGl0J3MgcG9zc2libGUgdGhlcmUncyBzb21lIHJvb20gZm9yDQo+ID4gZmFjdG9y
aW5nIG91dCBzb21lIG9mIHRoZSBjb2RlIGZvciB0aGUgY29tbW9uIGJpdHMgdGhhdCBhcmUgc2hh
cmVkDQo+ID4gYmV0d2VlbiBtdWx0aXBsZSBkZXZpY2VzLiAgTG9vayBhdCBob3cgQ2lycnVzJyBB
cml6b25hIGRyaXZlcnMgZm9yDQo+ID4gZXhhbXBsZSwgZWFjaCBjaGlwIGhhcyBzcGVjaWZpYyBz
dXBwb3J0IGluIGEgc2VwYXJhdGUgZHJpdmVyIGJ1dA0KPiA+IHRoZXJlJ3MgYSBsb3Qgb2Ygc2hh
cmVkIGNvZGUuDQo+ID4NCj4gPj4+PiArICAgICAvKiBTZXQgUkMgY2FsaWJyYXRpb24gICovDQo+
ID4+Pj4gKyAgICAgcnQ3MjFfc2RjYV9pbmRleF93cml0ZShydDcyMSwgUlQ3MjFfUkNfQ0FMSUJf
Q1RSTCwNCj4gPj4+PiArICAgICAgICAgICAgIFJUNzIxX1JDX0NBTElCX0NUUkwwLCAweDBiMDAp
Ow0KPiA+Pj4+ICsgICAgIHJ0NzIxX3NkY2FfaW5kZXhfd3JpdGUocnQ3MjEsIFJUNzIxX1JDX0NB
TElCX0NUUkwsDQo+ID4+Pj4gKyAgICAgICAgICAgICBSVDcyMV9SQ19DQUxJQl9DVFJMMCwgMHgw
YjQwKTsNCj4gPj4+PiArICAgICAvKiBGaW5lIHR1bmUgUERFMkEgbGF0ZW5jeSAqLw0KPiA+Pj4+
ICsgICAgIHJlZ21hcF93cml0ZShydDcyMS0+cmVnbWFwLCAweDJmNWMsIDB4MjUpOyB9DQo+ID4N
Cj4gPj4+IEh1bW0sIGlzbid0IGFsbCB0aGlzIHN1cHBvc2VkIHRvIGJlIGhhbmRsZWQgd2l0aCBi
bGluZCB3cml0ZXM/IEl0DQo+ID4+PiBzZWVtcyBvZGQgdG8gaGFyZC1jb2RlIGFsbCB0aGlzLCBu
bz8NCj4gPg0KPiA+PiBJdCBzZWVtcyB0aGVyZSBpcyBubyBhcGkgb3IgZnVuY3Rpb24gdG8gc3Vw
cG9ydCBibGluZCB3cml0ZSBmcm9tIEFDUEkNCj4gPj4gZnJvbSBsYXRlc3QgdXBzdHJlYW0gY29k
ZSwgYW5kIHdlIHRoaW5rIGl0J3MgZWFzaWVyIGZvciB1cyB0byBtYW5hZ2UgdGhlDQo+IGRpZmZl
cmVudCBmdW5jdGlvbidzIGJsaW5kIHdyaXRlLg0KPiANCj4gVGhlIHByb2JsZW0gaXMgdGhhdCB0
aG9zZSBibGluZCB3cml0ZXMgYXJlIHN1cHBvc2VkIHRvIGJlIHNrdS1zcGVjaWZpYywgc28gaXQn
cw0KPiBub3QgZ3JlYXQgdG8gZW5jb2RlIGEgYmVoYXZpb3IgaW4gYSBnZW5lcmljIGNvZGVjIGRy
aXZlci4NCj4gDQo+IEl0J3MgbXkgdW5kZXJzdGFuZGluZyB0aGF0IHRoZSBXaW5kb3dzIGRyaXZl
ciB3aWxsIHJlbHkgb24gYmxpbmQgd3JpdGVzLCBpdCdkDQo+IHNlZW0gbmF0dXJhbCB0byB1c2Ug
dGhlIHNhbWUgaW5pdGlhbGl6YXRpb24gcGFyYW1ldGVycywgbm8/DQo+IA0KPiA+IEl0J3MgYWx3
YXlzIHBvc3NpYmxlIGZvciB5b3UgdG8gYWRkIHNoYXJlZCBjb2RlIGZvciB0aGluZ3MgbGlrZQ0K
PiA+IHBhcnNpbmcgQUNQSSB0YWJsZXMgKGFueSByZWZlcmVuY2VzIHRvIHRoZSBzcGVjIGZvciBi
bGluZCB3cml0ZXMgaGVyZT8pLg0KPiANCj4gWWVzLCB0aGUgY29kZSBpcyBhbHJlYWR5IGF2YWls
YWJsZSBpbiBhIHByb3RvdHlwZSwgc2VlIHRoZSBpbml0aWFsIGNvZGUNCj4gaGVyZToNCj4gaHR0
cHM6Ly9naXRodWIuY29tL3RoZXNvZnByb2plY3QvbGludXgvcHVsbC81MDEwL2NvbW1pdHMvM2U0
ZmY4NDI0MmRiYjc3Nw0KPiA0YmJlZDc4NTM3MWQyN2MzYWZjMTBhOTYNCj4gDQoNClllcywgSSB1
bmRlcnN0YW5kIHRoZXJlIGlzIGFscmVhZHkgYSBwcm90b3R5cGUgaW4gZ2l0aHViLCBidXQgaXQg
aGFzbid0IGJlZW4gbWVyZ2VkIGludG8gdXBzdHJlYW0gDQphbmQgdGhlIGN1c3RvbWVyIHJlcXVl
c3RlZCBSZWFsdGVrIHRvIHVwc3RyZWFtIHRoZSBmaXJzdCB2ZXJzaW9uIHdoaWNoIGFscmVhZHkg
YmVlbiB2ZXJpZmllZC4gDQpXZSdsbCBzdXJlIGZvbGxvdyB0aGlzIHRvIGRvIHRoZSBibGluZCB3
cml0ZSBvbiBsYXRlciBjb2RlYyBkcml2ZXIgb25jZSB0aGlzIFBSIG1lcmdlZCBpbnRvIHVwc3Ry
ZWFtLg0KDQoNCj4gVGhlIGdvYWwgd2FzIHRvIGFkZCBhIHNvdW5kL3NvYy9zZGNhIGxpYnJhcnkg
dG8gcGFyc2UgQUNQSSBmdW5jdGlvbg0KPiBpbmZvcm1hdGlvbiwgZXh0cmFjdCBpbml0aWFsaXph
dGlvbiB0YWJsZXMsIGRlYWwgd2l0aCBpbnRlcnJ1cHRzLCBjcmVhdGUgY29udHJvbHMsDQo+IGV0
Yy4NCj4gDQo+IFRoYXQgc2FpZCwgaXQncyBwcm9iYWJseSBiZXN0IGlmIEJhcmQgYW5kL29yIENo
YXJsZXMgdGFrZSBvdmVyIHNpbmNlIEkgd29uJ3QgYmUNCj4gYWJsZSB0byB3b3JrIG9uIHRoaXMg
c2hvcnQtdGVybS4NCj4gDQo+IE9uZSBvZiB0aGUgYmlnIG9wZW5zIGlzIGhvdyB3ZSBkZWFsIHdp
dGggcmVnbWFwLiBJbiB0aGVvcnkgZWFjaCBTRENBDQo+IGZ1bmN0aW9uIGlzIGluZGVwZW5kZW50
IGZyb20gb3RoZXJzLCBidXQgaW4gcHJhY3RpY2UgdGhleSBhbGwgc2hhcmUgYSBjb21tb24NCj4g
Y29udHJvbCBjaGFubmVsIGFuZCBpbnRlcnJ1cHQgbWVjaGFuaXNtLg0KPiANCj4gSSBpbml0aWFs
bHkgdGhvdWdodCB3ZSBjb3VsZCBoYXZlIG9uZSByZWdtYXAgZm9yIGVhY2ggZnVuY3Rpb24sIGJ1
dCBDaGFybGVzIGhhZA0KPiBhIGRpZmZlcmVudCBpZGVhIHRoYXQgd2Ugc2hvdWxkIGhhbmRsZSBy
ZWdtYXAgYXQgdGhlIGRldmljZSBsZXZlbC4gQm90aCBvcHRpb25zDQo+IGhhdmUgbWVyaXRzIGFu
ZCBpc3N1ZXMsIHdlIGRpZG4ndCByZWFsbHkgcmVhY2ggYSBjb25jbHVzaW9uIG9uIHRoaXMuDQo+
IA0KPiBPbmUgb2YgdGhlIG90aGVyIG9wZW5zIGlzIGFsc28gcmVsYXRlZCB0byByZWdtYXAsIHdl
IG5vdyBoYXZlIHR3byB0eXBlcyBvZg0KPiByZWdtYXAgZm9yIFNvdW5kV2lyZSAoc2R3LSBhbmQg
c2R3LW1icSksIGJ1dCB0aGVyZSBhcmUgcGFydHMgb2YgQVNvQyB3aGVyZQ0KPiBjb21wb25lbnRz
IGFyZSBhc3N1bWVkIHRvIGhhdmUgYSBzaW5nbGUgcmVnbWFwLg0KDQo=
