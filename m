Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F40751EDB45
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jun 2020 04:37:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E6AA836;
	Thu,  4 Jun 2020 04:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E6AA836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591238239;
	bh=w//qV/KNYmdN/xLk0ticpLMT8No9ORcrglLMZIbZGIk=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fx5LmLyZaYLWMpe80cZn0Hu1ucJ63KPNOS4LWshkcQnUy5v7h3v/L9NujmE3UliP2
	 zawuNGZrBTmUVOtrVMrFSsZMJpXRq+dWjXFWC0mSIcAIvU870cVoX0QqSHCaZgd4SJ
	 FWj2Klv4ucuvhLcFlDq7a42GNCH6YvEwiLg9XyTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82DA3F8026F;
	Thu,  4 Jun 2020 04:35:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E82CF80272; Thu,  4 Jun 2020 04:35:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 11E1AF80260
 for <alsa-devel@alsa-project.org>; Thu,  4 Jun 2020 04:35:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11E1AF80260
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="BGJa7e7A"
X-UUID: f40ba59175624aa5b51d4a07b37a5b24-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=w//qV/KNYmdN/xLk0ticpLMT8No9ORcrglLMZIbZGIk=; 
 b=BGJa7e7AI6i5BBsaaw+0bl1WVZLNOMI9ou3zdUIizjAsOfaKNdCO3gwv63GJdxMIIdnJJAo18lJvRQiwdn+hZcKMK7LJP295dqbua9ExM+mNXzTsxbyc9V258Jw4YE2vUj4ExXVLaKrt9xwHKPniZRBDmDhKaLN/Lk8afY95ymI=;
X-UUID: f40ba59175624aa5b51d4a07b37a5b24-20200604
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 557539911; Thu, 04 Jun 2020 10:35:27 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 10:35:27 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 10:35:26 +0800
Message-ID: <1591238126.23525.75.camel@mtkswgap22>
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Manage auto-pm of all bundled
 interfaces
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Thu, 4 Jun 2020 10:35:26 +0800
In-Reply-To: <20200603153709.6293-2-tiwai@suse.de>
References: <20200603153709.6293-1-tiwai@suse.de>
 <20200603153709.6293-2-tiwai@suse.de>
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
IEN1cnJlbnRseSBVU0ItYXVkaW8gZHJpdmVyIG1hbmFnZXMgdGhlIGF1dG8tcG0gb2YgdGhlIHBy
aW1hcnkNCj4gaW50ZXJmYWNlIGFsdGhvdWdoIGEgY2FyZCBtYXkgY29uc2lzdCBvZiBtdWx0aXBs
ZSBpbnRlcmZhY2VzLg0KPiBUaGlzIG1heSBsZWF2ZSB0aGUgc2Vjb25kYXJ5IGFuZCBvdGhlciBp
bnRlcmZhY2VzIGxlZnQgcnVubmluZw0KPiB1bm5lY2Vzc2FyaWx5IGFmdGVyIHRoZSBhdXRvLXN1
c3BlbmQuDQo+IA0KPiBUaGlzIHBhdGNoIGFsbG93cyB0aGUgZHJpdmVyIG1hbmFnaW5nIHRoZSBh
dXRvLXBtIG9mIGFsbCBidW5kbGVkDQo+IGludGVyZmFjZXMgcGVyIGNhcmQuICBUaGUgY2hpcC0+
cG1faW50ZiBmaWVsZCBpcyBleHRlbmRlZCBhcw0KPiBjaGlwLT5pbnRmW10gdG8gY29udGFpbiB0
aGUgYXJyYXkgb2YgYXNzaWduZWQgaW50ZXJmYWNlcywgYW5kIHRoZQ0KPiBydW50aW1lLVBNIGlz
IHBlcmZvcm1lZCB0byBhbGwgdGhvc2UgaW50ZXJmYWNlcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4NCj4gLS0tDQo+ICBzb3VuZC91c2IvY2FyZC5j
ICAgICB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tDQo+ICBzb3VuZC91
c2IvdXNiYXVkaW8uaCB8ICA0ICsrKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9zb3VuZC91c2IvY2FyZC5j
IGIvc291bmQvdXNiL2NhcmQuYw0KPiBpbmRleCAzNTlmN2EwNGJlMWMuLmY2NDg1ODdkMjM0MiAx
MDA2NDQNCj4gLS0tIGEvc291bmQvdXNiL2NhcmQuYw0KPiArKysgYi9zb3VuZC91c2IvY2FyZC5j
DQo+IEBAIC02MzQsNyArNjM0LDYgQEAgc3RhdGljIGludCB1c2JfYXVkaW9fcHJvYmUoc3RydWN0
IHVzYl9pbnRlcmZhY2UgKmludGYsDQo+ICAJCQkJCQkJCSAgIGlkLCAmY2hpcCk7DQo+ICAJCQkJ
CWlmIChlcnIgPCAwKQ0KPiAgCQkJCQkJZ290byBfX2Vycm9yOw0KPiAtCQkJCQljaGlwLT5wbV9p
bnRmID0gaW50ZjsNCj4gIAkJCQkJYnJlYWs7DQo+ICAJCQkJfSBlbHNlIGlmICh2aWRbaV0gIT0g
LTEgfHwgcGlkW2ldICE9IC0xKSB7DQo+ICAJCQkJCWRldl9pbmZvKCZkZXYtPmRldiwNCj4gQEAg
LTY1MSw2ICs2NTAsMTMgQEAgc3RhdGljIGludCB1c2JfYXVkaW9fcHJvYmUoc3RydWN0IHVzYl9p
bnRlcmZhY2UgKmludGYsDQo+ICAJCQlnb3RvIF9fZXJyb3I7DQo+ICAJCX0NCj4gIAl9DQo+ICsN
Cj4gKwlpZiAoY2hpcC0+bnVtX2ludGVyZmFjZXMgPj0gTUFYX0NBUkRfSU5URVJGQUNFUykgew0K
PiArCQlkZXZfaW5mbygmZGV2LT5kZXYsICJUb28gbWFueSBpbnRlcmZhY2VzIGFzc2lnbmVkIHRv
IHRoZSBzaW5nbGUgVVNCLWF1ZGlvIGNhcmRcbiIpOw0KPiArCQllcnIgPSAtRUlOVkFMOw0KPiAr
CQlnb3RvIF9fZXJyb3I7DQo+ICsJfQ0KPiArDQo+ICAJZGV2X3NldF9kcnZkYXRhKCZkZXYtPmRl
diwgY2hpcCk7DQo+ICANCj4gIAkvKg0KPiBAQCAtNzAzLDYgKzcwOSw3IEBAIHN0YXRpYyBpbnQg
dXNiX2F1ZGlvX3Byb2JlKHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRmLA0KPiAgCX0NCj4gIA0K
PiAgCXVzYl9jaGlwW2NoaXAtPmluZGV4XSA9IGNoaXA7DQo+ICsJY2hpcC0+aW50ZltjaGlwLT5u
dW1faW50ZXJmYWNlc10gPSBpbnRmOw0KPiAgCWNoaXAtPm51bV9pbnRlcmZhY2VzKys7DQo+ICAJ
dXNiX3NldF9pbnRmZGF0YShpbnRmLCBjaGlwKTsNCj4gIAlhdG9taWNfZGVjKCZjaGlwLT5hY3Rp
dmUpOw0KPiBAQCAtODE4LDE5ICs4MjUsMzcgQEAgdm9pZCBzbmRfdXNiX3VubG9ja19zaHV0ZG93
bihzdHJ1Y3Qgc25kX3VzYl9hdWRpbyAqY2hpcCkNCj4gIA0KPiAgaW50IHNuZF91c2JfYXV0b3Jl
c3VtZShzdHJ1Y3Qgc25kX3VzYl9hdWRpbyAqY2hpcCkNCj4gIHsNCj4gKwlpbnQgaSwgZXJyOw0K
PiArDQo+ICAJaWYgKGF0b21pY19yZWFkKCZjaGlwLT5zaHV0ZG93bikpDQo+ICAJCXJldHVybiAt
RUlPOw0KPiAtCWlmIChhdG9taWNfaW5jX3JldHVybigmY2hpcC0+YWN0aXZlKSA9PSAxKQ0KPiAt
CQlyZXR1cm4gdXNiX2F1dG9wbV9nZXRfaW50ZXJmYWNlKGNoaXAtPnBtX2ludGYpOw0KPiArCWlm
IChhdG9taWNfaW5jX3JldHVybigmY2hpcC0+YWN0aXZlKSAhPSAxKQ0KPiArCQlyZXR1cm4gMDsN
Cj4gKw0KPiArCWZvciAoaSA9IDA7IGkgPCBjaGlwLT5udW1faW50ZXJmYWNlczsgaSsrKSB7DQo+
ICsJCWVyciA9IHVzYl9hdXRvcG1fZ2V0X2ludGVyZmFjZShjaGlwLT5pbnRmW2ldKTsNCj4gKwkJ
aWYgKGVyciA8IDApIHsNCj4gKwkJCS8qIHJvbGxiYWNrICovDQo+ICsJCQl3aGlsZSAoLS1pID49
IDApDQo+ICsJCQkJdXNiX2F1dG9wbV9wdXRfaW50ZXJmYWNlKGNoaXAtPmludGZbaV0pOw0KPiAr
CQkJYXRvbWljX2RlYygmY2hpcC0+YWN0aXZlKSkNCj4gKwkJCXJldHVybiBlcnI7DQo+ICsJCX0N
Cj4gKwl9DQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+ICANCj4gIHZvaWQgc25kX3VzYl9hdXRvc3Vz
cGVuZChzdHJ1Y3Qgc25kX3VzYl9hdWRpbyAqY2hpcCkNCj4gIHsNCj4gKwlpbnQgaTsNCj4gKw0K
PiAgCWlmIChhdG9taWNfcmVhZCgmY2hpcC0+c2h1dGRvd24pKQ0KPiAgCQlyZXR1cm47DQo+IC0J
aWYgKGF0b21pY19kZWNfYW5kX3Rlc3QoJmNoaXAtPmFjdGl2ZSkpDQo+IC0JCXVzYl9hdXRvcG1f
cHV0X2ludGVyZmFjZShjaGlwLT5wbV9pbnRmKTsNCj4gKwlpZiAoIWF0b21pY19kZWNfYW5kX3Rl
c3QoJmNoaXAtPmFjdGl2ZSkpDQo+ICsJCXJldHVybjsNCj4gKw0KPiArCWZvciAoaSA9IDA7IGkg
PCBjaGlwLT5udW1faW50ZXJmYWNlczsgaSsrKQ0KPiArCQl1c2JfYXV0b3BtX3B1dF9pbnRlcmZh
Y2UoY2hpcC0+aW50ZltpXSk7DQo+ICB9DQo+ICANCj4gIHN0YXRpYyBpbnQgdXNiX2F1ZGlvX3N1
c3BlbmQoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYsIHBtX21lc3NhZ2VfdCBtZXNzYWdlKQ0K
PiBkaWZmIC0tZ2l0IGEvc291bmQvdXNiL3VzYmF1ZGlvLmggYi9zb3VuZC91c2IvdXNiYXVkaW8u
aA0KPiBpbmRleCBlMGViZmIyNWZiZDUuLmI5MWM0YzA4MDdlYyAxMDA2NDQNCj4gLS0tIGEvc291
bmQvdXNiL3VzYmF1ZGlvLmgNCj4gKysrIGIvc291bmQvdXNiL3VzYmF1ZGlvLmgNCj4gQEAgLTE5
LDExICsxOSwxMyBAQA0KPiAgc3RydWN0IG1lZGlhX2RldmljZTsNCj4gIHN0cnVjdCBtZWRpYV9p
bnRmX2Rldm5vZGU7DQo+ICANCj4gKyNkZWZpbmUgTUFYX0NBUkRfSU5URVJGQUNFUwkxNg0KPiAr
DQo+ICBzdHJ1Y3Qgc25kX3VzYl9hdWRpbyB7DQo+ICAJaW50IGluZGV4Ow0KPiAgCXN0cnVjdCB1
c2JfZGV2aWNlICpkZXY7DQo+ICAJc3RydWN0IHNuZF9jYXJkICpjYXJkOw0KPiAtCXN0cnVjdCB1
c2JfaW50ZXJmYWNlICpwbV9pbnRmOw0KPiArCXN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRmW01B
WF9DQVJEX0lOVEVSRkFDRVNdOw0KPiAgCXUzMiB1c2JfaWQ7DQo+ICAJc3RydWN0IG11dGV4IG11
dGV4Ow0KPiAgCXVuc2lnbmVkIGludCBzeXN0ZW1fc3VzcGVuZDsNCg0KVGVzdGVkLWJ5OiBNYWNw
YXVsIExpbiA8bWFjcGF1bC5saW5AbWVkaWF0ZWsuY29tPg0KDQotLQ0KVGhhbmtzIQ0KTWFjcGF1
bCBMaW4NCg==

