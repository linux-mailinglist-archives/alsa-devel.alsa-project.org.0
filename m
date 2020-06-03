Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 762F11ECFF9
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 14:41:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03AAE828;
	Wed,  3 Jun 2020 14:40:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03AAE828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591188083;
	bh=yGhEBSj32ppLHggwGolq9ctveMSRJ1bICjDVz+fhRnY=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AWj4xztnb8/w4c75hVw4rm5MpCEIOv4n+Gr3rm/WZp2e5qGmO5l5hugjFtz6GJMqq
	 2+M54dByBlAxzvdkT+JT9PVopOkKG7Y3GgvqrLD+DM8+0ooOyKFcSwjrNyrLmtTwkR
	 wT/VnOvgP7HblBLTYP0xaesIsYxhKgu9lliNIAKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B38BF800D0;
	Wed,  3 Jun 2020 14:39:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 031ADF801ED; Wed,  3 Jun 2020 14:39:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 0CD1BF800D0
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 14:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CD1BF800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="hegUAZBR"
X-UUID: 1993c3ddeb4148aa96669f9c1f46b448-20200603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yGhEBSj32ppLHggwGolq9ctveMSRJ1bICjDVz+fhRnY=; 
 b=hegUAZBRX2s60lSecAyLBURD/bAzfG67+p2avShJo+0B4ctRdAv243tcJNqGCY4nACX96hujB458lAOTelcceeGRE0seBkA3ed2eTPmVy8khTI38enrjDpJv5jQmLZzn3WfZDEdyWcbZGipcbKOfTqwEq8KCEvl2CoNHafIfEdU=;
X-UUID: 1993c3ddeb4148aa96669f9c1f46b448-20200603
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1683903012; Wed, 03 Jun 2020 20:39:26 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 20:39:21 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Jun 2020 20:39:23 +0800
Message-ID: <1591187964.23525.61.camel@mtkswgap22>
Subject: Re: [PATCH] sound: usb: pcm: fix incorrect power state when playing
 sound after PM_AUTO suspend
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Wed, 3 Jun 2020 20:39:24 +0800
In-Reply-To: <s5h367cfsga.wl-tiwai@suse.de>
References: <s5hpnahhbz8.wl-tiwai@suse.de>
 <1591153515.23525.50.camel@mtkswgap22> <s5heeqwfyti.wl-tiwai@suse.de>
 <s5hblm0fxl0.wl-tiwai@suse.de> <s5h367cfsga.wl-tiwai@suse.de>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
Cc: alsa-devel@alsa-project.org,
 Szabolcs =?UTF-8?Q?Sz=C5=91ke?= <szszoke.code@gmail.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 Alexander Tsoy <alexander@tsoy.me>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Johan Hovold <johan@kernel.org>,
 Macpaul Lin <macpaul.lin@gmail.com>, linux-arm-kernel@lists.infradead.org
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

T24gV2VkLCAyMDIwLTA2LTAzIGF0IDEwOjQ1ICswMjAwLCBUYWthc2hpIEl3YWkgd3JvdGU6DQo+
IE9uIFdlZCwgMDMgSnVuIDIwMjAgMDg6NTQ6NTEgKzAyMDAsDQo+IFRha2FzaGkgSXdhaSB3cm90
ZToNCj4gPiANCj4gPiBPbiBXZWQsIDAzIEp1biAyMDIwIDA4OjI4OjA5ICswMjAwLA0KPiA+IFRh
a2FzaGkgSXdhaSB3cm90ZToNCj4gPiA+IA0KPiA+ID4gQW5kLCB0aGUgbW9zdCBzdXNwaWNpb3Vz
IGNhc2UgaXMgdGhlIGxhc3Qgb25lLA0KPiA+ID4gY2hpcC0+bnVtX3N1c3BlbmRlZC1pbnRmLiAg
SXQgbWVhbnMgdGhhdCB0aGUgZGV2aWNlIGhhcyBtdWx0aXBsZQ0KPiA+ID4gVVNCIGludGVyZmFj
ZXMgYW5kIHRoZXkgd2VudCB0byBzdXNwZW5kLCB3aGlsZSB0aGUgcmVzdW1lIGlzbid0DQo+ID4g
PiBwZXJmb3JtZWQgZm9yIHRoZSBhbGwgc3VzcGVuZGVkIGludGVyZmFjZXMgaW4gcmV0dXJuLg0K
PiA+IA0KPiA+IElmIHRoaXMgaXMgdGhlIGNhdXNlLCBhIHBhdGNoIGxpa2UgYmVsb3cgbWlnaHQg
aGVscC4NCj4gPiBJdCBnZXRzL3B1dHMgdGhlIGFsbCBhc3NpZ25lZCBpbnRlcmZhY2VkIGluc3Rl
YWQgb2Ygb25seSB0aGUgcHJpbWFyeQ0KPiA+IG9uZS4NCj4gDQo+IC4uLiBhbmQgY29uc2lkZXJp
bmcgb2YgdGhlIHByb2JsZW0gYWdhaW4sIHJhdGhlciB0aGUgcGF0Y2ggYmVsb3cgbWlnaHQNCj4g
YmUgdGhlIHJpZ2h0IGFuc3dlci4gIE5vdyB0aGUgZHJpdmVyIHRyaWVzIHRvIHJlbWVtYmVyIGF0
IHdoaWNoIHN0YXRlDQo+IGl0IGVudGVyZWQgaW50byB0aGUgc3lzdGVtLXN1c3BlbmQuICBVcG9u
IHJlc3VtZSwgaW4gcmV0dXJuLCB3aGVuIHRoZQ0KPiBzdGF0ZSByZWFjaGVzIGJhY2sgdG8gdGhh
dCBwb2ludCwgc2V0IHRoZSBjYXJkIHN0YXRlIHRvIEQwLg0KPiANCj4gVGhlIHByZXZpb3VzIHBh
dGNoIGNhbiBiZSBhcHBsaWVkIG9uIHRoZSB0b3AsIHRvbywgYW5kIGl0IG1pZ2h0IGJlDQo+IHdv
cnRoIHRvIGFwcGx5IGJvdGguDQo+IA0KPiBMZXQgbWUga25vdyBpZiBhbnkgb2YgdGhvc2UgYWN0
dWFsbHkgaGVscHMuDQo+IA0KPiANCj4gVGFrYXNoaQ0KDQpUaGFua3MgZm9yIHlvdXIgcmVzcG9u
c2Ugc28gcXVpY2tseS4NCkkndmUganVzdCB0ZXN0IHRoaXMgcGF0Y2ggc2luY2UgaXQgbG9va3Mg
bGlrZSBlbm91Z2ggZm9yIHRoZSBpc3N1ZS4NCg0KVGhpcyBwYXRjaCB3b3JrZWQgc2luY2UgdGhl
IGZsYWcgc3lzdGVtX3N1c3BlbmQgd2lsbCBiZSBzZXQgYXQgdGhlIHNhbWUNCnRpbWUgd2hlbiBw
b3dlciBzdGF0ZSBoYXMgYmVlbiBjaGFuZ2VkLiBJIGhhdmUgMiBpbnRlcmZhY2Ugd2l0aCB0aGUg
aGVhZA0Kc2V0LiBCdXQgYWN0dWFsbHkgdGhlIHByb2JsZW0gaGFwcGVuZWQgd2hlbiBwcmltYXJ5
IG9uZSBpcyBzdXNwZW5kZWQuDQpTbyBJIGRpZG4ndCB0ZXN0IHRoZSBlYXJsaWVyIHBhdGNoICJz
dXNwZW5kIGFsbCBpbnRlcmZhY2UgaW5zdGVhZCBvZg0Kb25seSB0aGUgcHJpbWFyeSBvbmUuIg0K
DQpXaWxsIHlvdSByZXNlbmQgdGhpcyBwYXRjaCBvZmZpY2lhbGx5IGxhdGVyPyBJIHRoaW5rIHRo
aXMgc29sdXRpb24gaXMNCnJlcXVpcmVkIHRvIHNlbmQgdG8gc3RhYmxlLCB0b28uIEl0J3MgYmV0
dGVyIHRvIGhhdmUgaXQgZm9yIG90aGVyIHN0YWJsZQ0Ka2VybmVsIHZlcnNpb25zIGluY2x1ZGUg
YW5kcm9pZCdzLg0KDQo+IC0tLQ0KPiBkaWZmIC0tZ2l0IGEvc291bmQvdXNiL2NhcmQuYyBiL3Nv
dW5kL3VzYi9jYXJkLmMNCj4gLS0tIGEvc291bmQvdXNiL2NhcmQuYw0KPiArKysgYi9zb3VuZC91
c2IvY2FyZC5jDQo+IEBAIC04NDMsOSArODQzLDYgQEAgc3RhdGljIGludCB1c2JfYXVkaW9fc3Vz
cGVuZChzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZiwgcG1fbWVzc2FnZV90IG1lc3NhZ2UpDQo+
ICAJaWYgKGNoaXAgPT0gKHZvaWQgKiktMUwpDQo+ICAJCXJldHVybiAwOw0KPiAgDQo+IC0JY2hp
cC0+YXV0b3N1c3BlbmRlZCA9ICEhUE1TR19JU19BVVRPKG1lc3NhZ2UpOw0KPiAtCWlmICghY2hp
cC0+YXV0b3N1c3BlbmRlZCkNCj4gLQkJc25kX3Bvd2VyX2NoYW5nZV9zdGF0ZShjaGlwLT5jYXJk
LCBTTkRSVl9DVExfUE9XRVJfRDNob3QpOw0KPiAgCWlmICghY2hpcC0+bnVtX3N1c3BlbmRlZF9p
bnRmKyspIHsNCj4gIAkJbGlzdF9mb3JfZWFjaF9lbnRyeShhcywgJmNoaXAtPnBjbV9saXN0LCBs
aXN0KSB7DQo+ICAJCQlzbmRfdXNiX3BjbV9zdXNwZW5kKGFzKTsNCj4gQEAgLTg1OCw2ICs4NTUs
MTEgQEAgc3RhdGljIGludCB1c2JfYXVkaW9fc3VzcGVuZChzdHJ1Y3QgdXNiX2ludGVyZmFjZSAq
aW50ZiwgcG1fbWVzc2FnZV90IG1lc3NhZ2UpDQo+ICAJCQlzbmRfdXNiX21peGVyX3N1c3BlbmQo
bWl4ZXIpOw0KPiAgCX0NCj4gIA0KPiArCWlmICghUE1TR19JU19BVVRPKG1lc3NhZ2UpICYmICFj
aGlwLT5zeXN0ZW1fc3VzcGVuZCkgew0KPiArCQlzbmRfcG93ZXJfY2hhbmdlX3N0YXRlKGNoaXAt
PmNhcmQsIFNORFJWX0NUTF9QT1dFUl9EM2hvdCk7DQo+ICsJCWNoaXAtPnN5c3RlbV9zdXNwZW5k
ID0gY2hpcC0+bnVtX3N1c3BlbmRlZF9pbnRmOw0KPiArCX0NCj4gKw0KPiAgCXJldHVybiAwOw0K
PiAgfQ0KPiAgDQo+IEBAIC04NzEsMTAgKzg3MywxMCBAQCBzdGF0aWMgaW50IF9fdXNiX2F1ZGlv
X3Jlc3VtZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZiwgYm9vbCByZXNldF9yZXN1bWUpDQo+
ICANCj4gIAlpZiAoY2hpcCA9PSAodm9pZCAqKS0xTCkNCj4gIAkJcmV0dXJuIDA7DQo+IC0JaWYg
KC0tY2hpcC0+bnVtX3N1c3BlbmRlZF9pbnRmKQ0KPiAtCQlyZXR1cm4gMDsNCj4gIA0KPiAgCWF0
b21pY19pbmMoJmNoaXAtPmFjdGl2ZSk7IC8qIGF2b2lkIGF1dG9wbSAqLw0KPiArCWlmIChjaGlw
LT5udW1fc3VzcGVuZGVkX2ludGYgPiAxKQ0KPiArCQlnb3RvIG91dDsNCj4gIA0KPiAgCWxpc3Rf
Zm9yX2VhY2hfZW50cnkoYXMsICZjaGlwLT5wY21fbGlzdCwgbGlzdCkgew0KPiAgCQllcnIgPSBz
bmRfdXNiX3BjbV9yZXN1bWUoYXMpOw0KPiBAQCAtODk2LDkgKzg5OCwxMiBAQCBzdGF0aWMgaW50
IF9fdXNiX2F1ZGlvX3Jlc3VtZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZiwgYm9vbCByZXNl
dF9yZXN1bWUpDQo+ICAJCXNuZF91c2JtaWRpX3Jlc3VtZShwKTsNCj4gIAl9DQo+ICANCj4gLQlp
ZiAoIWNoaXAtPmF1dG9zdXNwZW5kZWQpDQo+ICsgb3V0Og0KPiArCWlmIChjaGlwLT5udW1fc3Vz
cGVuZGVkX2ludGYgPT0gY2hpcC0+c3lzdGVtX3N1c3BlbmQpIHsNCj4gIAkJc25kX3Bvd2VyX2No
YW5nZV9zdGF0ZShjaGlwLT5jYXJkLCBTTkRSVl9DVExfUE9XRVJfRDApOw0KPiAtCWNoaXAtPmF1
dG9zdXNwZW5kZWQgPSAwOw0KPiArCQljaGlwLT5zeXN0ZW1fc3VzcGVuZCA9IDA7DQo+ICsJfQ0K
PiArCWNoaXAtPm51bV9zdXNwZW5kZWRfaW50Zi0tOw0KPiAgDQo+ICBlcnJfb3V0Og0KPiAgCWF0
b21pY19kZWMoJmNoaXAtPmFjdGl2ZSk7IC8qIGFsbG93IGF1dG9wbSBhZnRlciB0aGlzIHBvaW50
ICovDQo+IGRpZmYgLS1naXQgYS9zb3VuZC91c2IvdXNiYXVkaW8uaCBiL3NvdW5kL3VzYi91c2Jh
dWRpby5oDQo+IGluZGV4IDFjODkyYzdmMTRkNy4uZTBlYmZiMjVmYmQ1IDEwMDY0NA0KPiAtLS0g
YS9zb3VuZC91c2IvdXNiYXVkaW8uaA0KPiArKysgYi9zb3VuZC91c2IvdXNiYXVkaW8uaA0KPiBA
QCAtMjYsNyArMjYsNyBAQCBzdHJ1Y3Qgc25kX3VzYl9hdWRpbyB7DQo+ICAJc3RydWN0IHVzYl9p
bnRlcmZhY2UgKnBtX2ludGY7DQo+ICAJdTMyIHVzYl9pZDsNCj4gIAlzdHJ1Y3QgbXV0ZXggbXV0
ZXg7DQo+IC0JdW5zaWduZWQgaW50IGF1dG9zdXNwZW5kZWQ6MTsJDQo+ICsJdW5zaWduZWQgaW50
IHN5c3RlbV9zdXNwZW5kOw0KPiAgCWF0b21pY190IGFjdGl2ZTsNCj4gIAlhdG9taWNfdCBzaHV0
ZG93bjsNCj4gIAlhdG9taWNfdCB1c2FnZV9jb3VudDsNCj4gDQo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQoNClRoYW5rIHlvdSB2ZXJ5IG11Y2ghDQoN
CkJlc3QgcmVnYXJkcywNCk1hY3BhdWwgTGluDQoNCg0K

