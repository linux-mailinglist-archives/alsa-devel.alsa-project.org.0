Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0C180B346
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Dec 2023 09:31:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99DDF83E;
	Sat,  9 Dec 2023 09:31:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99DDF83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702110677;
	bh=AK/m0l/XwbcANi9JnHnK/JJmhGqgtHRgsOwqS6W/z4g=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I9yBVtHOWCjtMpPmEK/U6OQOyOeyg0HwwuYWWKjPEP2+ZONqGHlcjQ8xCCbT5YSqE
	 VUpO3KEyhmp09ySKp3BcLsg+q/5t3T6asju3T0PKOOEEDYKZp16aOviFIp8xzaDey/
	 Nf3/OQX3fmZ9QALiyreiJZYtPIfNn7v2aXCXHNg4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D209CF8055C; Sat,  9 Dec 2023 09:30:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 110D7F80567;
	Sat,  9 Dec 2023 09:30:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80FD2F8024E; Sat,  9 Dec 2023 09:30:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA9CFF800AC
	for <alsa-devel@alsa-project.org>; Sat,  9 Dec 2023 09:30:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA9CFF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=dghd+PLv
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3B98UPHe035396;
	Sat, 9 Dec 2023 02:30:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1702110625;
	bh=AK/m0l/XwbcANi9JnHnK/JJmhGqgtHRgsOwqS6W/z4g=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=dghd+PLvWnOCEGZXymEwaDkVUNNyhl5qJDHUL18AjVR9hLrOxxmKF9DZkG3wZ4Qhs
	 iwh6O0uI5mJ0Y7RxjU5apxJHglBBThoggPDq23klABA21Kxz0d1HS/tL92Nfe43v6G
	 Rk1GcLbvGNlA4QEDfiMypzEtn9t7YragTWg3oPT4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3B98UP6e090543
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 9 Dec 2023 02:30:25 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 9
 Dec 2023 02:30:25 -0600
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.023; Sat, 9 Dec 2023 02:30:24 -0600
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "broonie@kernel.org"
	<broonie@kernel.org>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "perex@perex.cz"
	<perex@perex.cz>,
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
        "soyer@irl.hu" <soyer@irl.hu>, "tiwai@suse.de"
	<tiwai@suse.de>
Subject: RE: [EXTERNAL] Re: [PATCH v1 3/3] ASoC: dt-bindings: Add tas2563 into
 yaml
Thread-Topic: [EXTERNAL] Re: [PATCH v1 3/3] ASoC: dt-bindings: Add tas2563
 into yaml
Thread-Index: AQHaKnbUUMfgQZAzjkyE8w/j8//IPLCg/ryA//+f6dA=
Date: Sat, 9 Dec 2023 08:30:24 +0000
Message-ID: <5cbb8824b4d443e898b23c3d08b8a4ea@ti.com>
References: <20231209080742.1290-1-shenghao-ding@ti.com>
 <20231209080742.1290-3-shenghao-ding@ti.com>
 <9dc6ff91-d28c-4e94-9ec7-f39aa1555bda@linaro.org>
In-Reply-To: <9dc6ff91-d28c-4e94-9ec7-f39aa1555bda@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.163.83]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Message-ID-Hash: IPWFZ7R6QAIASEUCRTUK6VYQ6MNDJ75R
X-Message-ID-Hash: IPWFZ7R6QAIASEUCRTUK6VYQ6MNDJ75R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IPWFZ7R6QAIASEUCRTUK6VYQ6MNDJ75R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiBTZW50OiBTYXR1cmRheSwg
RGVjZW1iZXIgOSwgMjAyMyA0OjEzIFBNDQo+IFRvOiBEaW5nLCBTaGVuZ2hhbyA8c2hlbmdoYW8t
ZGluZ0B0aS5jb20+OyBicm9vbmllQGtlcm5lbC5vcmcNCj4gQ2M6IHJvYmgrZHRAa2VybmVsLm9y
ZzsgYW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tOw0KPiBsZ2lyZHdvb2RAZ21haWwu
Y29tOyBwZXJleEBwZXJleC5jejsgcGllcnJlLWxvdWlzLmJvc3NhcnRAbGludXguaW50ZWwuY29t
Ow0KPiAxMzkxNjI3NTIwNkAxMzkuY29tOyBhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmc7IGxp
bnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaWFtLnIuZ2lyZHdvb2RAaW50ZWwuY29t
OyBzb3llckBpcmwuaHU7DQo+IHRpd2FpQHN1c2UuZGUNCj4gU3ViamVjdDogW0VYVEVSTkFMXSBS
ZTogW1BBVENIIHYxIDMvM10gQVNvQzogZHQtYmluZGluZ3M6IEFkZCB0YXMyNTYzIGludG8NCj4g
eWFtbA0KPiANCj4gT24gMDkvMTIvMjAyMyAwOTowNywgU2hlbmdoYW8gRGluZyB3cm90ZToNCj4g
PiBTdXBwb3J0IHRhczI1NjMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaGVuZ2hhbyBEaW5n
IDxzaGVuZ2hhby1kaW5nQHRpLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvc291bmQvdGksdGFzMjc4MS55YW1sICAgfCAxNyArKysrKysrKysrLS0tLS0tLQ0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQv
dGksdGFzMjc4MS55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c291bmQvdGksdGFzMjc4MS55YW1sDQo+ID4gaW5kZXggYTY5ZTZjMjIzMzA4Li44NGUxOTdlMTVk
ZjQgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nv
dW5kL3RpLHRhczI3ODEueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zb3VuZC90aSx0YXMyNzgxLnlhbWwNCj4gPiBAQCAtMTEsMTEgKzExLDExIEBAIG1h
aW50YWluZXJzOg0KPiA+ICAgIC0gU2hlbmdoYW8gRGluZyA8c2hlbmdoYW8tZGluZ0B0aS5jb20+
DQo+ID4NCj4gPiAgZGVzY3JpcHRpb246DQo+ID4gLSAgVGhlIFRBUzI3ODEgaXMgYSBtb25vLCBk
aWdpdGFsIGlucHV0IENsYXNzLUQgYXVkaW8gYW1wbGlmaWVyDQo+ID4gLSAgb3B0aW1pemVkIGZv
ciBlZmZpY2llbnRseSBkcml2aW5nIGhpZ2ggcGVhayBwb3dlciBpbnRvIHNtYWxsDQo+ID4gLSAg
bG91ZHNwZWFrZXJzLiBBbiBpbnRlZ3JhdGVkIG9uLWNoaXAgRFNQIHN1cHBvcnRzIFRleGFzIElu
c3RydW1lbnRzDQo+ID4gLSAgU21hcnQgQW1wIHNwZWFrZXIgcHJvdGVjdGlvbiBhbGdvcml0aG0u
IFRoZSBpbnRlZ3JhdGVkIHNwZWFrZXINCj4gPiAtICB2b2x0YWdlIGFuZCBjdXJyZW50IHNlbnNl
IHByb3ZpZGVzIGZvciByZWFsIHRpbWUNCj4gPiArICBUaGUgVEFTMjc4MS9UQVMyNTYzIGlzIGEg
bW9ubywgZGlnaXRhbCBpbnB1dCBDbGFzcy1EIGF1ZGlvDQo+ID4gKyBhbXBsaWZpZXIgb3B0aW1p
emVkIGZvciBlZmZpY2llbnRseSBkcml2aW5nIGhpZ2ggcGVhayBwb3dlciBpbnRvDQo+ID4gKyBz
bWFsbCBsb3Vkc3BlYWtlcnMuIEFuIGludGVncmF0ZWQgb24tY2hpcCBEU1Agc3VwcG9ydHMgVGV4
YXMNCj4gPiArIEluc3RydW1lbnRzIFNtYXJ0IEFtcCBzcGVha2VyIHByb3RlY3Rpb24gYWxnb3Jp
dGhtLiBUaGUgIGludGVncmF0ZWQNCj4gPiArIHNwZWFrZXIgdm9sdGFnZSBhbmQgY3VycmVudCBz
ZW5zZSBwcm92aWRlcyBmb3IgcmVhbCB0aW1lDQo+ID4gICAgbW9uaXRvcmluZyBvZiBsb3Vkc3Bl
YWtlciBiZWhhdmlvci4NCj4gPg0KPiA+ICBhbGxPZjoNCj4gPiBAQCAtMjUsMTYgKzI1LDE5IEBA
IHByb3BlcnRpZXM6DQo+ID4gICAgY29tcGF0aWJsZToNCj4gPiAgICAgIGVudW06DQo+ID4gICAg
ICAgIC0gdGksdGFzMjc4MQ0KPiA+ICsgICAgICAtIHRpLHRhczI1NjMNCj4gDQo+IExvb2tzIGxp
a2UgZGV2aWNlcyBhcmUgY29tcGF0aWJsZSwgc28gZXhwcmVzcyBpdCBpbiB0aGUgYmluZGluZ3Mg
d2l0aCBhIGZhbGxiYWNrDQo+IGFuZCBkcm9wIGRyaXZlciBwYXRjaGVzLg0KRXhhY3RseS4gRG8g
eW91IG1lYW4gY29tYmluZSB0aGUgdGhyZWUgcGF0Y2hlcyBpbnRvIG9uZSBwYXRjaD8NCj4gDQo+
IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg==
