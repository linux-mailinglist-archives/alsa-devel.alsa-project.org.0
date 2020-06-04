Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 746B11EDB42
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jun 2020 04:36:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD31C166D;
	Thu,  4 Jun 2020 04:35:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD31C166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591238192;
	bh=I8HleS8LmN1VIR30EkeWOZOoHqtNBMVIsrBClJdUg4c=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ssMtazKRJhwOcqv3ChlZBa5Xw7o2WRlS7MyTgozt9B/TX+Zz3wY0uYPjy2H/yO8PE
	 ipxS/HlNlPPOkvAhyySzUAXUbxi6r+UBGOeNNTE0Cqs7zZ78HxXwlmpxtYvYcuFXiC
	 hstx/qMRYYT+NmXVOvJjH8a5hdwb81tL5pdMpA1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4701F800BC;
	Thu,  4 Jun 2020 04:34:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 029BEF80254; Thu,  4 Jun 2020 04:34:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id 363BBF8013C
 for <alsa-devel@alsa-project.org>; Thu,  4 Jun 2020 04:34:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 363BBF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="b8JMyyam"
X-UUID: 5dda19317f7449ce9f7a880e9323e957-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=I8HleS8LmN1VIR30EkeWOZOoHqtNBMVIsrBClJdUg4c=; 
 b=b8JMyyam9dLOxufLfjmHv2MUCLmqqgKbg60kZHwSxWcs+cHStFI65J5ekw6W04mv0d60XKpaSFtgQWwBjd4wLrNzoiJp8/oFsN5RJvBBAwM/ZFxzQuBXUd6kUT5VFObtQHKgfMMKZP5yX4LADBM8tQ7YHOwAOedrFThOmI6l4MU=;
X-UUID: 5dda19317f7449ce9f7a880e9323e957-20200604
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1947057063; Thu, 04 Jun 2020 10:34:32 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 10:34:31 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 10:34:31 +0800
Message-ID: <1591238070.23525.74.camel@mtkswgap22>
Subject: Re: [PATCH 1/2] ALSA: usb-audio: Fix inconsistent card PM state
 after resume
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Thu, 4 Jun 2020 10:34:30 +0800
In-Reply-To: <20200603153709.6293-1-tiwai@suse.de>
References: <20200603153709.6293-1-tiwai@suse.de>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
Cc: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gV2VkLCAyMDIwLTA2LTAzIGF0IDE3OjM3ICswMjAwLCBUYWthc2hpIEl3YWkgd3JvdGU6DQo+
IFdoZW4gYSBVU0ItYXVkaW8gaW50ZXJmYWNlIGdldHMgcnVudGltZS1zdXNwZW5kZWQgdmlhIGF1
dG8tcG0gZmVhdHVyZSwNCj4gdGhlIGRyaXZlciBzdXNwZW5kcyBhbGwgZnVuY3Rpb25hbGl0eSBh
bmQgaW5jcmVtZW50DQo+IGNoaXAtPm51bV9zdXNwZW5kZWRfaW50Zi4gIExhdGVyIG9uLCB3aGVu
IHRoZSBzeXN0ZW0gZ2V0cyBzdXNwZW5kZWQgdG8NCj4gUzMsIHRoZSBkcml2ZXIgaW5jcmVtZW50
cyBjaGlwLT5udW1fc3VzcGVuZGVkX2ludGYgYWdhaW4sIHNraXBzIHRoZQ0KPiBkZXZpY2UgY2hh
bmdlcywgYW5kIHNldHMgdGhlIGNhcmQgcG93ZXIgc3RhdGUgdG8NCj4gU05EUlZfQ1RMX1BPV0VS
X0QzaG90LiAgSW4gcmV0dXJuLCB3aGVuIHRoZSBzeXN0ZW0gZ2V0cyByZXN1bWVkIGZyb20NCj4g
UzMsIHRoZSByZXN1bWUgY2FsbGJhY2sgZGVjcmVtZW50cyBjaGlwLT5udW1fc3VzcGVuZGVkX2lu
dGYuICBTaW5jZQ0KPiB0aGlzIHJlZmNvdW50IGlzIHN0aWxsIG5vdCB6ZXJvIChpdCdzIGJlZW4g
cnVudGltZS1zdXNwZW5kZWQpLCB0aGUNCj4gd2hvbGUgcmVzdW1lIGlzIHNraXBwZWQuICBCdXQg
dGhlcmUgaXMgYSBzbWFsbCBwaXRmYWxsIGhlcmUuDQo+IA0KPiBUaGUgcHJvYmxlbSBpcyB0aGF0
IHRoZSBkcml2ZXIgZG9lc24ndCByZXN0b3JlIHRoZSBjYXJkIHBvd2VyIHN0YXRlDQo+IGFmdGVy
IHRoaXMgcmVzdW1lIGNhbGwsIGxlYXZpbmcgaXQgYXMgU05EUlZfQ1RMX1BPV0VSX0QzaG90LiAg
U28sDQo+IGV2ZW4gYWZ0ZXIgdGhlIHN5c3RlbSByZXN1bWUgZmluaXNoZXMsIHRoZSBjYXJkIGlu
c3RhbmNlIHN0aWxsIGFwcGVhcnMNCj4gYXMgaWYgaXQgd2VyZSBzeXN0ZW0tc3VzcGVuZGVkLCBh
bmQgdGhpcyBjb25mdXNlcyBtYW55IGlvY3RsIGFjY2Vzc2VzDQo+IHRoYXQgYXJlIGJsb2NrZWQg
dW5leHBlY3RlZGx5Lg0KPiANCj4gSW4gZGV0YWlscywgd2UgaGF2ZSB0d28gaXNzdWVzIGJlaGlu
ZCB0aGUgc2NlbmU6IG9uZSBpcyB0aGF0IHRoZSBjYXJkDQo+IHBvd2VyIHN0YXRlIGlzIGNoYW5n
ZWQgb25seSB3aGVuIHRoZSByZWZjb3VudCBiZWNvbWVzIHplcm8sIGFuZA0KPiBhbm90aGVyIGlz
IHRoYXQgdGhlIHByaW9yIGF1dG8tc3VzcGVuZCBjaGVjayBpcyBrZXB0IGluIGEgYm9vbGVhbg0K
PiBmbGFnLiAgQWx0aG91Z2ggdGhlIGxhdHRlciBwcm9ibGVtIGlzIGFsbW9zdCBuZWdsaWdpYmxl
IHNpbmNlIHRoZQ0KPiBhdXRvLXBtIGZlYXR1cmUgaXMgaW1wb3NlZCBvbmx5IG9uIHRoZSBwcmlt
YXJ5IGludGVyZmFjZSwgYnV0IHRoaXMgY2FuDQo+IGJlIGEgcG90ZW50aWFsIHByb2JsZW0gb24g
dGhlIGRldmljZXMgd2l0aCBtdWx0aXBsZSBpbnRlcmZhY2VzLg0KPiANCj4gVGhpcyBwYXRjaCBh
ZGRyZXNzZXMgdGhvc2UgaXNzdWVzIGJ5IHRoZSBmb2xsb3dpbmc6DQo+IA0KPiAtIFJlcGxhY2Ug
Y2hpcC0+YXV0b3N1c3BlbmRlZCBib29sZWFuIGZsYWcgd2l0aCBjaGlwLT5zeXN0ZW1fc3VzcGVu
ZA0KPiAgIGNvdW50ZXINCj4gDQo+IC0gQXQgdGhlIGZpcnN0IHN5c3RlbS1zdXNwZW5kLCBjaGlw
LT5udW1fc3VzcGVuZGVkX2ludGYgaXMgcmVjb3JkZWQgdG8NCj4gICBjaGlwLT5zeXN0ZW1fc3Vz
cGVuZA0KPiANCj4gLSBBdCBzeXN0ZW0tcmVzdW1lLCB0aGUgY2FyZCBwb3dlciBzdGF0ZSBpcyBy
ZXN0b3JlZCB3aGVuIHRoZQ0KPiAgIGNoaXAtPm51bV9zdXNwZW5kZWRfaW50ZiByZWZjb3VudCBy
ZWFjaGVzIHRvIGNoaXAtPnN5c3RlbV9zdXNwZW5kLA0KPiAgIGkuZS4gdGhlIHN0YXRlIHJldHVy
bnMgdG8gdGhlIGF1dG8tc3VzcGVuZGVkDQo+IA0KPiBBbHNvLCB0aGUgcGF0Y2ggZml4ZXMgeWV0
IGFub3RoZXIgaGlkZGVuIHByb2JsZW0gYnkgdGhlIGNvZGUNCj4gcmVmYWN0b3JpbmcgYWxvbmcg
d2l0aCB0aGUgZml4ZXMgYWJvdmU6IG5hbWVseSwgd2hlbiBzb21lIHJlc3VtZQ0KPiBwcm9jZWR1
cmUgZmFpbGVkLCB0aGUgZHJpdmVyIGxlZnQgY2hpcC0+bnVtX3N1c3BlbmRlZF9pbnRmIHRoYXQg
d2FzDQo+IGFscmVhZHkgZGVjcmVhc2VkLCBhbmQgaXQgbWlnaHQgbGVhZCB0byB0aGUgcmVmY291
bnQgdW5iYWxhbmNlLg0KPiBJbiB0aGUgbmV3IGNvZGUsIHRoZSByZWZjb3VudCBkZWNyZW1lbnQg
aXMgZG9uZSBhZnRlciB0aGUgd2hvbGUgcmVzdW1lDQo+IHByb2NlZHVyZSwgYW5kIHRoZSBwcm9i
bGVtIGlzIGF2b2lkZWQgYXMgd2VsbC4NCj4gDQo+IEZpeGVzOiAwNjYyMjkyYWVjMDUgKCJBTFNB
OiB1c2ItYXVkaW86IEhhbmRsZSBub3JtYWwgYW5kIGF1dG8tc3VzcGVuZCBlcXVhbGx5IikNCj4g
UmVwb3J0ZWQtYW5kLXRlc3RlZC1ieTogTWFjcGF1bCBMaW4gPG1hY3BhdWwubGluQG1lZGlhdGVr
LmNvbT4NCj4gQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBU
YWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+DQo+IC0tLQ0KPiAgc291bmQvdXNiL2NhcmQuYyAg
ICAgfCAxOSArKysrKysrKysrKystLS0tLS0tDQo+ICBzb3VuZC91c2IvdXNiYXVkaW8uaCB8ICAy
ICstDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvdXNiL2NhcmQuYyBiL3NvdW5kL3VzYi9jYXJkLmMN
Cj4gaW5kZXggZmQ2ZmQxNzI2ZWEwLi4zNTlmN2EwNGJlMWMgMTAwNjQ0DQo+IC0tLSBhL3NvdW5k
L3VzYi9jYXJkLmMNCj4gKysrIGIvc291bmQvdXNiL2NhcmQuYw0KPiBAQCAtODQzLDkgKzg0Myw2
IEBAIHN0YXRpYyBpbnQgdXNiX2F1ZGlvX3N1c3BlbmQoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmlu
dGYsIHBtX21lc3NhZ2VfdCBtZXNzYWdlKQ0KPiAgCWlmIChjaGlwID09ICh2b2lkICopLTFMKQ0K
PiAgCQlyZXR1cm4gMDsNCj4gIA0KPiAtCWNoaXAtPmF1dG9zdXNwZW5kZWQgPSAhIVBNU0dfSVNf
QVVUTyhtZXNzYWdlKTsNCj4gLQlpZiAoIWNoaXAtPmF1dG9zdXNwZW5kZWQpDQo+IC0JCXNuZF9w
b3dlcl9jaGFuZ2Vfc3RhdGUoY2hpcC0+Y2FyZCwgU05EUlZfQ1RMX1BPV0VSX0QzaG90KTsNCj4g
IAlpZiAoIWNoaXAtPm51bV9zdXNwZW5kZWRfaW50ZisrKSB7DQo+ICAJCWxpc3RfZm9yX2VhY2hf
ZW50cnkoYXMsICZjaGlwLT5wY21fbGlzdCwgbGlzdCkgew0KPiAgCQkJc25kX3VzYl9wY21fc3Vz
cGVuZChhcyk7DQo+IEBAIC04NTgsNiArODU1LDExIEBAIHN0YXRpYyBpbnQgdXNiX2F1ZGlvX3N1
c3BlbmQoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYsIHBtX21lc3NhZ2VfdCBtZXNzYWdlKQ0K
PiAgCQkJc25kX3VzYl9taXhlcl9zdXNwZW5kKG1peGVyKTsNCj4gIAl9DQo+ICANCj4gKwlpZiAo
IVBNU0dfSVNfQVVUTyhtZXNzYWdlKSAmJiAhY2hpcC0+c3lzdGVtX3N1c3BlbmQpIHsNCj4gKwkJ
c25kX3Bvd2VyX2NoYW5nZV9zdGF0ZShjaGlwLT5jYXJkLCBTTkRSVl9DVExfUE9XRVJfRDNob3Qp
Ow0KPiArCQljaGlwLT5zeXN0ZW1fc3VzcGVuZCA9IGNoaXAtPm51bV9zdXNwZW5kZWRfaW50ZjsN
Cj4gKwl9DQo+ICsNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gIA0KPiBAQCAtODcxLDEwICs4NzMs
MTAgQEAgc3RhdGljIGludCBfX3VzYl9hdWRpb19yZXN1bWUoc3RydWN0IHVzYl9pbnRlcmZhY2Ug
KmludGYsIGJvb2wgcmVzZXRfcmVzdW1lKQ0KPiAgDQo+ICAJaWYgKGNoaXAgPT0gKHZvaWQgKikt
MUwpDQo+ICAJCXJldHVybiAwOw0KPiAtCWlmICgtLWNoaXAtPm51bV9zdXNwZW5kZWRfaW50ZikN
Cj4gLQkJcmV0dXJuIDA7DQo+ICANCj4gIAlhdG9taWNfaW5jKCZjaGlwLT5hY3RpdmUpOyAvKiBh
dm9pZCBhdXRvcG0gKi8NCj4gKwlpZiAoY2hpcC0+bnVtX3N1c3BlbmRlZF9pbnRmID4gMSkNCj4g
KwkJZ290byBvdXQ7DQo+ICANCj4gIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KGFzLCAmY2hpcC0+cGNt
X2xpc3QsIGxpc3QpIHsNCj4gIAkJZXJyID0gc25kX3VzYl9wY21fcmVzdW1lKGFzKTsNCj4gQEAg
LTg5Niw5ICs4OTgsMTIgQEAgc3RhdGljIGludCBfX3VzYl9hdWRpb19yZXN1bWUoc3RydWN0IHVz
Yl9pbnRlcmZhY2UgKmludGYsIGJvb2wgcmVzZXRfcmVzdW1lKQ0KPiAgCQlzbmRfdXNibWlkaV9y
ZXN1bWUocCk7DQo+ICAJfQ0KPiAgDQo+IC0JaWYgKCFjaGlwLT5hdXRvc3VzcGVuZGVkKQ0KPiAr
IG91dDoNCj4gKwlpZiAoY2hpcC0+bnVtX3N1c3BlbmRlZF9pbnRmID09IGNoaXAtPnN5c3RlbV9z
dXNwZW5kKSB7DQo+ICAJCXNuZF9wb3dlcl9jaGFuZ2Vfc3RhdGUoY2hpcC0+Y2FyZCwgU05EUlZf
Q1RMX1BPV0VSX0QwKTsNCj4gLQljaGlwLT5hdXRvc3VzcGVuZGVkID0gMDsNCj4gKwkJY2hpcC0+
c3lzdGVtX3N1c3BlbmQgPSAwOw0KPiArCX0NCj4gKwljaGlwLT5udW1fc3VzcGVuZGVkX2ludGYt
LTsNCj4gIA0KPiAgZXJyX291dDoNCj4gIAlhdG9taWNfZGVjKCZjaGlwLT5hY3RpdmUpOyAvKiBh
bGxvdyBhdXRvcG0gYWZ0ZXIgdGhpcyBwb2ludCAqLw0KPiBkaWZmIC0tZ2l0IGEvc291bmQvdXNi
L3VzYmF1ZGlvLmggYi9zb3VuZC91c2IvdXNiYXVkaW8uaA0KPiBpbmRleCAxYzg5MmM3ZjE0ZDcu
LmUwZWJmYjI1ZmJkNSAxMDA2NDQNCj4gLS0tIGEvc291bmQvdXNiL3VzYmF1ZGlvLmgNCj4gKysr
IGIvc291bmQvdXNiL3VzYmF1ZGlvLmgNCj4gQEAgLTI2LDcgKzI2LDcgQEAgc3RydWN0IHNuZF91
c2JfYXVkaW8gew0KPiAgCXN0cnVjdCB1c2JfaW50ZXJmYWNlICpwbV9pbnRmOw0KPiAgCXUzMiB1
c2JfaWQ7DQo+ICAJc3RydWN0IG11dGV4IG11dGV4Ow0KPiAtCXVuc2lnbmVkIGludCBhdXRvc3Vz
cGVuZGVkOjE7CQ0KPiArCXVuc2lnbmVkIGludCBzeXN0ZW1fc3VzcGVuZDsNCj4gIAlhdG9taWNf
dCBhY3RpdmU7DQo+ICAJYXRvbWljX3Qgc2h1dGRvd247DQo+ICAJYXRvbWljX3QgdXNhZ2VfY291
bnQ7DQoNClRlc3RlZC1ieTogTWFjcGF1bCBMaW4gPG1hY3BhdWwubGluQG1lZGlhdGVrLmNvbT4N
Cg==

