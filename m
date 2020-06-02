Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D38C81EBCF4
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jun 2020 15:18:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BFF1169A;
	Tue,  2 Jun 2020 15:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BFF1169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591103887;
	bh=4h8fafRuCGTyIr/VCDupUiRjNszwNbo9UU/ty3wLFYg=;
	h=Subject:From:To:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kKM41ean9KrI3Ld7qbDQij2ox+oXTzUMByxAEdkoyYbHjvJaKCaSamF3DsRuVcTIb
	 P11cZNxXiHC4isFaSAC0l6ocVrE87cvqxJ50D/1EuzC3emeflhActPghZUzRFJq0uS
	 5EiJCKnlsaGtrBAcJqpybp/AbJVg55/wI/UIodKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29F29F802F9;
	Tue,  2 Jun 2020 15:11:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F429F8013D; Tue,  2 Jun 2020 14:19:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id E9AA1F800BC
 for <alsa-devel@alsa-project.org>; Tue,  2 Jun 2020 14:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9AA1F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="BB6Bogdy"
X-UUID: 737c847b080d486a9aaa17344788bb94-20200602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID;
 bh=4h8fafRuCGTyIr/VCDupUiRjNszwNbo9UU/ty3wLFYg=; 
 b=BB6BogdypJebp2/YbfZk+8Pm2yPYmPU/qlQJKVt+/SfUJ1srvKxmfwtE7f7uXs/psdx6V5ThbEQywmEhtk9NoIPq95235ujRejWTgtmH16QQ1vvQn24vKSUNG4WTODUbipnMbSJs1aDCjQs1nxZQKylOrDpc+AMO5fXCmefny+k=;
X-UUID: 737c847b080d486a9aaa17344788bb94-20200602
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 241703546; Tue, 02 Jun 2020 20:19:10 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Jun 2020 20:19:00 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Jun 2020 20:19:00 +0800
Message-ID: <1591100342.23525.8.camel@mtkswgap22>
Subject: Re: [PATCH] sound: usb: pcm: fix incorrect power state when playing
 sound after PM_AUTO suspend
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Jaroslav Kysela <perex@perex.cz>, Alexander Tsoy <alexander@tsoy.me>,
 Johan Hovold <johan@kernel.org>, Hui Wang <hui.wang@canonical.com>, Szabolcs
 =?UTF-8?Q?Sz=C5=91ke?= <szszoke.code@gmail.com>,
 <alsa-devel@alsa-project.org>, <linux-usb@vger.kernel.org>, "Mediatek WSD
 Upstream" <wsd_upstream@mediatek.com>, Macpaul Lin <macpaul.lin@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>
Date: Tue, 2 Jun 2020 20:19:02 +0800
In-Reply-To: <1591098821-17910-1-git-send-email-macpaul.lin@mediatek.com>
References: <linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org>
 <1591098821-17910-1-git-send-email-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 12C71F8E9B7B63D4DF6727041F40092E70F89D4579A111C8EDEBB373FBDFE0332000:8
X-MTK: N
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Tue, 02 Jun 2020 15:10:44 +0200
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

T24gVHVlLCAyMDIwLTA2LTAyIGF0IDE5OjUzICswODAwLCBNYWNwYXVsIExpbiB3cm90ZToNCj4g
VGhpcyBwYXRjaCBmaXggaW5jb3JyZWN0IHBvd2VyIHN0YXRlIGNoYW5nZWQgYnkgdXNiX2F1ZGlv
X3N1c3BlbmQoKQ0KPiB3aGVuIENPTkZJR19QTSBpcyBlbmFibGVkLg0KPiANCj4gQWZ0ZXIgcmVj
ZWl2aW5nIHN1c3BlbmQgUE0gbWVzc2FnZSB3aXRoIGF1dG8gZmxhZywgdXNiX2F1ZGlvX3N1c3Bl
bmQoKQ0KPiBjaGFuZ2UgY2FyZCdzIHBvd2VyIHN0YXRlIHRvIFNORFJWX0NUTF9QT1dFUl9EM2hv
dC4gT25seSB3aGVuIHRoZSBvdGhlcg0KPiByZXN1bWUgUE0gbWVzc2FnZSB3aXRoIGF1dG8gZmxh
ZyBjYW4gY2hhbmdlIHBvd2VyIHN0YXRlIHRvDQo+IFNORFJWX0NUTF9QT1dFUl9EMCBpbiBfX3Vz
Yl9hdWRpb19yZXN1bWUoKS4NCj4gDQo+IEhvd2V2ZXIsIHdoZW4gc3lzdGVtIGlzIG5vdCB1bmRl
ciBhdXRvIHN1c3BlbmQsIHJlc3VtZSBQTSBtZXNzYWdlIHdpdGgNCj4gYXV0byBmbGFnIG1pZ2h0
IG5vdCBiZSBhYmxlIHRvIHJlY2VpdmUgb24gdGltZSB3aGljaCBjYXVzZSB0aGUgcG93ZXINCj4g
c3RhdGUgd2FzIGluY29ycmVjdC4gQXQgdGhpcyB0aW1lLCBpZiBhIHBsYXllciBzdGFydHMgdG8g
cGxheSBzb3VuZCwNCj4gd2lsbCBjYXVzZSBzbmRfdXNiX3BjbV9vcGVuKCkgdG8gYWNjZXNzIHRo
ZSBjYXJkIGFuZCBzZXR1cF9od19pbmZvKCkgd2lsbA0KPiByZXN1bWUgdGhlIGNhcmQuDQo+IA0K
PiBCdXQgZXZlbiB0aGUgY2FyZCBpcyBiYWNrIHRvIHdvcmsgYW5kIGFsbCBmdW5jdGlvbiBub3Jt
YWwsIHRoZSBwb3dlcg0KPiBzdGF0ZSBpcyBzdGlsbCBpbiBTTkRSVl9DVExfUE9XRVJfRDNob3Qu
IFdoaWNoIGNhdXNlIHRoZSBpbmZpbml0ZSBsb29wDQo+IGhhcHBlbmVkIGluIHNuZF9wb3dlcl93
YWl0KCkgdG8gY2hlY2sgdGhlIHBvd2VyIHN0YXRlLiBUaHVzIHRoZQ0KPiBzdWNjZXNzaXZlIHNl
dHRpbmcgaW9jdGwgY2Fubm90IGJlIHBhc3NlZCB0byBjYXJkLg0KPiANCj4gSGVuY2Ugd2Ugc3Vn
Z2VzdCB0byBjaGFuZ2UgcG93ZXIgc3RhdGUgdG8gU05EUlZfQ1RMX1BPV0VSX0QwIHdoZW4gY2Fy
ZA0KPiBoYXMgYmVlbiByZXN1bWVkIHN1Y2Nlc3NmdWxseS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IE1hY3BhdWwgTGluIDxtYWNwYXVsLmxpbkBtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgc291bmQv
dXNiL3BjbS5jIHwgICAxMSArKysrKysrKysrK2xpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmcsDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Nv
dW5kL3VzYi9wY20uYyBiL3NvdW5kL3VzYi9wY20uYw0KPiBpbmRleCBhNGU0MDY0Li5kNjY3ZWNi
IDEwMDY0NA0KPiAtLS0gYS9zb3VuZC91c2IvcGNtLmMNCj4gKysrIGIvc291bmQvdXNiL3BjbS5j
DQo+IEBAIC0xMzIyLDYgKzEzMjIsMTcgQEAgc3RhdGljIGludCBzZXR1cF9od19pbmZvKHN0cnVj
dCBzbmRfcGNtX3J1bnRpbWUgKnJ1bnRpbWUsIHN0cnVjdCBzbmRfdXNiX3N1YnN0cmUNCj4gIAlp
ZiAoZXJyIDwgMCkNCj4gIAkJcmV0dXJuIGVycjsNCj4gIA0KPiArCS8qIGZpeCBpbmNvcnJlY3Qg
cG93ZXIgc3RhdGUgd2hlbiByZXN1bWluZyBieSBvcGVuIGFuZCBsYXRlciBpb2N0bHMgKi8NCj4g
KwlpZiAoSVNfRU5BQkxFRChDT05GSUdfUE0pICYmDQo+ICsJCXNuZF9wb3dlcl9nZXRfc3RhdGUo
c3Vicy0+c3RyZWFtLT5jaGlwLT5jYXJkKQ0KPiArCQkJPT0gU05EUlZfQ1RMX1BPV0VSX0QzaG90
KSB7DQo+ICsJCS8qIHNldCB0aGVzZSB2YXJpYWJsZXMgZm9yIHBvd2VyIHN0YXRlIGNvcnJlY3Rp
b24gKi8NCj4gKwkJc3Vicy0+c3RyZWFtLT5jaGlwLT5hdXRvc3VzcGVuZGVkID0gMDsNCj4gKwkJ
c3Vicy0+c3RyZWFtLT5jaGlwLT5udW1fc3VzcGVuZGVkX2ludGYgPSAxOw0KPiArCQlkZXZfaW5m
bygmc3Vicy0+ZGV2LT5kZXYsDQo+ICsJCQkiY2hhbmdlIHBvd2VyIHN0YXRlIGZyb20gRDNob3Qg
dG8gRDBcbiIpOw0KPiArCX0NCj4gKw0KPiAgCXJldHVybiBzbmRfdXNiX2F1dG9yZXN1bWUoc3Vi
cy0+c3RyZWFtLT5jaGlwKTsNCj4gIH0NCj4gIA0KDQpUaGUgaXNzdWUgd2FzIGZvdW5kIG9uIGtl
cm5lbCA0LjE0IChhbmRyb2lkIHRyZWUpLiBUaGUgdGVzdCBpcyB0byBhZGQNCmRlYnVnIGxvZyBp
biBzb3VuZC9jb3JlL2luaXQuYyB0byBjaGVjayBpZiB0aGUgcG93ZXIgc3RhdGUgaXMNClNORFJW
X0NUTF9QT1dFUl9EM2hvdC4NCg0KZGlmZiAtLWdpdCBhL3NvdW5kL2NvcmUvaW5pdC5jIGIvc291
bmQvY29yZS9pbml0LmMNCmluZGV4IGIwMmE5OTcuLmEwYmVlNzYgMTAwNjQ0DQotLS0gYS9zb3Vu
ZC9jb3JlL2luaXQuYw0KKysrIGIvc291bmQvY29yZS9pbml0LmMNCkBAIC0xMDExLDYgKzEwMTEs
OCBAQCBpbnQgc25kX3Bvd2VyX3dhaXQoc3RydWN0IHNuZF9jYXJkICpjYXJkLCB1bnNpZ25lZA0K
aW50IHBvd2VyX3N0YXRlKQ0KIAkJaWYgKHNuZF9wb3dlcl9nZXRfc3RhdGUoY2FyZCkgPT0gcG93
ZXJfc3RhdGUpDQogCQkJYnJlYWs7DQogCQlzZXRfY3VycmVudF9zdGF0ZShUQVNLX1VOSU5URVJS
VVBUSUJMRSk7DQorCQlwcl9pbmZvKCIlcyBzbmRfcG93ZXJfZ2V0X3N0YXRlWyV4XVxuIiwgX19m
dW5jX18sDQorCQkJc25kX3Bvd2VyX2dldF9zdGF0ZShjYXJkKSk7DQogCQlzY2hlZHVsZV90aW1l
b3V0KDMwICogSFopOw0KIAl9DQogCXJlbW92ZV93YWl0X3F1ZXVlKCZjYXJkLT5wb3dlcl9zbGVl
cCwgJndhaXQpOw0KDQpBZnRlciBhcHBsaWVkIGEgd29yayBhcm91bmQgYnkgZm9yY2luZyB0aGUg
cG93ZXIgc3RhdGUsIHBjbSByZWxhdGVkDQppb2N0bCBhbmQgcGFyYW1ldGVyIHNldHRpbmdzIGNh
biBiZSBzZXQgdG8gdXNiIHNvdW5kIGNhcmQgY29ycmVjdGx5Lg0KT3RoZXJ3aXNlIGEgaW5maW5p
dGUgbG9vcCB3aWxsIGhhcHBlbmVkIGluIHNuZF9wb3dlcl93YWl0KCkuDQoNCkhlcmUgaXMgdGhl
IG9yaWdpbiB3b3JrIGFyb3VuZCBmb3IgdmVyaWZ5aW5nIHRoaXMgcG93ZXIgc3RhdGUgaXNzdWUg
b24NCmtlcm5lbCA0LjE0Lg0KDQpkaWZmIC0tZ2l0IGEvc291bmQvdXNiL3BjbS5jIGIvc291bmQv
dXNiL3BjbS5jDQppbmRleCA5MzNhZGNkN2FmODEuLjlhY2Q1MGRkNzE1NSAxMDA2NDQNCi0tLSBh
L3NvdW5kL3VzYi9wY20uYw0KKysrIGIvc291bmQvdXNiL3BjbS5jDQpAQCAtMTI3NCw2ICsxMjc0
LDE2IEBAIHN0YXRpYyBpbnQgc2V0dXBfaHdfaW5mbyhzdHJ1Y3Qgc25kX3BjbV9ydW50aW1lDQoq
cnVudGltZSwgc3RydWN0IHNuZF91c2Jfc3Vic3RyZQ0KIAlpZiAoZXJyIDwgMCkNCiAJCXJldHVy
biBlcnI7DQogDQorCS8qIGF2b2lkIGluY29ycmVjdCBwb3dlciBzdGF0ZSB3aGVuIGV4ZWN1dGlu
ZyBJT0NUTCAqLw0KKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfUE0pICYmDQorCQlzbmRfcG93ZXJf
Z2V0X3N0YXRlKHN1YnMtPnN0cmVhbS0+Y2hpcC0+Y2FyZCkNCisJCQk9PSBTTkRSVl9DVExfUE9X
RVJfRDNob3QpIHsNCisJCWRldl9pbmZvKCZzdWJzLT5kZXYtPmRldiwNCisJCQkiY2hhbmdlIHBv
d2VyIHN0YXRlIGZyb20gRDNob3QgdG8gRDBcbiIpOw0KKwkJc25kX3Bvd2VyX2NoYW5nZV9zdGF0
ZShzdWJzLT5zdHJlYW0tPmNoaXAtPmNhcmQsDQorCQkJCQlTTkRSVl9DVExfUE9XRVJfRDApOw0K
Kwl9DQorDQogCXBhcmFtX3BlcmlvZF90aW1lX2lmX25lZWRlZCA9IFNORFJWX1BDTV9IV19QQVJB
TV9QRVJJT0RfVElNRTsNCiAJaWYgKHN1YnMtPnNwZWVkID09IFVTQl9TUEVFRF9GVUxMKQ0KIAkJ
LyogZnVsbCBzcGVlZCBkZXZpY2VzIGhhdmUgZml4ZWQgZGF0YSBwYWNrZXQgaW50ZXJ2YWwgKi8N
Cg0KSG93ZXZlciwgdGhlIHBhdGNoIEkndmUgc2VuZCBpcyBtZWFudCB0byBtYWtlIHN1cmUgdGhl
IHBvd2VyIHN0YXRlIHdpbGwNCmJlIGNvcnJlY3RlZCBiZWZvcmUgc25kX3VzYl9hdXRvcmVzdW1l
KCksIEl0IHNob3VsZCBiZSBhZGFwdCB0byBrZXJuZWwNCjQuMTQgYW5kIGxhdGVyLg0KDQpUaGFu
a3MuDQpNYWNwYXVsIExpbg0KDQo=

