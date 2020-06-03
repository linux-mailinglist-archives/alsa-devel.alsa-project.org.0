Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B2E1EC7B0
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 05:07:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C9D51665;
	Wed,  3 Jun 2020 05:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C9D51665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591153638;
	bh=W7tF7Mgc/fvciJgJ7QAqTgTQjhCvBLQ6CPGKAAjG2D8=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I6rTEeuTp0PoD6ijoYV0rEiAjFVAwBFy7qfOKQTkTJpJnbhAgYiVXH8jOce5AQYNU
	 Jt3OxS8gYFr7nElDM0w6Ub4BKhXFJ80OMuZgVbt1iG1gg+BDW9w0S1jCtAtZBWM278
	 r9RWIzwnHj/EVO0GqPPW64D/e+vYXkgVw6UJ6u0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31F1CF801F5;
	Wed,  3 Jun 2020 05:05:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8075BF800BC; Wed,  3 Jun 2020 05:05:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id 55C09F800BC
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 05:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55C09F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="u7PlTMKU"
X-UUID: 013f03ca456545518d26a021da9022c8-20200603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=W7tF7Mgc/fvciJgJ7QAqTgTQjhCvBLQ6CPGKAAjG2D8=; 
 b=u7PlTMKUuiWIMlZ0yaBgoWCf4OpcgaFcNVfiVgNmlk2zLhiNPd3kUQlg7W6aIdqImhJbJprM8BCe3Cc/QNGHDs88+/FgsVcq8lVR6UyPHj5BPxHB6dIeK9exI0XwZxTTCekXvT/bOmbq28HrNagnnEmWfNr2V9pGwnMU32OhBq4=;
X-UUID: 013f03ca456545518d26a021da9022c8-20200603
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <macpaul.lin@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 62782876; Wed, 03 Jun 2020 11:05:17 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 11:05:10 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Jun 2020 11:05:10 +0800
Message-ID: <1591153515.23525.50.camel@mtkswgap22>
Subject: Re: [PATCH] sound: usb: pcm: fix incorrect power state when playing
 sound after PM_AUTO suspend
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Wed, 3 Jun 2020 11:05:15 +0800
In-Reply-To: <s5hpnahhbz8.wl-tiwai@suse.de>
References: <s5hpnahhbz8.wl-tiwai@suse.de>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 586FA4C026DBFAB221D5480D4E6A63BFED753ABF860C0F7D852D822E2AAFD11B2000:8
X-MTK: N
Content-Transfer-Encoding: base64
Cc: alsa-devel@alsa-project.org,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 Johan Hovold <johan@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Hui Wang <hui.wang@canonical.com>, Alexander Tsoy <alexander@tsoy.me>,
 linux-mediatek@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Macpaul Lin <macpaul.lin@gmail.com>,
 Szabolcs =?UTF-8?Q?Sz=C5=91ke?= <szszoke.code@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

T24gVHVlLCAyMDIwLTA2LTAyIGF0IDE0OjQ2ICswMjAwLCBUYWthc2hpIEl3YWkgd3JvdGU6DQo+
IE9uIFR1ZSwgMDIgSnVuIDIwMjAgMTM6NTM6NDEgKzAyMDAsDQo+IE1hY3BhdWwgTGluIHdyb3Rl
Og0KPiA+IA0KPiA+IFRoaXMgcGF0Y2ggZml4IGluY29ycmVjdCBwb3dlciBzdGF0ZSBjaGFuZ2Vk
IGJ5IHVzYl9hdWRpb19zdXNwZW5kKCkNCj4gPiB3aGVuIENPTkZJR19QTSBpcyBlbmFibGVkLg0K
PiA+IA0KPiA+IEFmdGVyIHJlY2VpdmluZyBzdXNwZW5kIFBNIG1lc3NhZ2Ugd2l0aCBhdXRvIGZs
YWcsIHVzYl9hdWRpb19zdXNwZW5kKCkNCj4gPiBjaGFuZ2UgY2FyZCdzIHBvd2VyIHN0YXRlIHRv
IFNORFJWX0NUTF9QT1dFUl9EM2hvdC4gT25seSB3aGVuIHRoZSBvdGhlcg0KPiA+IHJlc3VtZSBQ
TSBtZXNzYWdlIHdpdGggYXV0byBmbGFnIGNhbiBjaGFuZ2UgcG93ZXIgc3RhdGUgdG8NCj4gPiBT
TkRSVl9DVExfUE9XRVJfRDAgaW4gX191c2JfYXVkaW9fcmVzdW1lKCkuDQo+ID4gDQo+ID4gSG93
ZXZlciwgd2hlbiBzeXN0ZW0gaXMgbm90IHVuZGVyIGF1dG8gc3VzcGVuZCwgcmVzdW1lIFBNIG1l
c3NhZ2Ugd2l0aA0KPiA+IGF1dG8gZmxhZyBtaWdodCBub3QgYmUgYWJsZSB0byByZWNlaXZlIG9u
IHRpbWUgd2hpY2ggY2F1c2UgdGhlIHBvd2VyDQo+ID4gc3RhdGUgd2FzIGluY29ycmVjdC4gQXQg
dGhpcyB0aW1lLCBpZiBhIHBsYXllciBzdGFydHMgdG8gcGxheSBzb3VuZCwNCj4gPiB3aWxsIGNh
dXNlIHNuZF91c2JfcGNtX29wZW4oKSB0byBhY2Nlc3MgdGhlIGNhcmQgYW5kIHNldHVwX2h3X2lu
Zm8oKSB3aWxsDQo+ID4gcmVzdW1lIHRoZSBjYXJkLg0KPiA+IA0KPiA+IEJ1dCBldmVuIHRoZSBj
YXJkIGlzIGJhY2sgdG8gd29yayBhbmQgYWxsIGZ1bmN0aW9uIG5vcm1hbCwgdGhlIHBvd2VyDQo+
ID4gc3RhdGUgaXMgc3RpbGwgaW4gU05EUlZfQ1RMX1BPV0VSX0QzaG90Lg0KPiANCj4gSG0sIGlu
IGV4YWN0bHkgd2hpY2ggc2l0dWF0aW9uIGRvZXMgdGhpcyBoYXBwZW4/ICBJIHN0aWxsIGRvbid0
IGdldA0KPiBpdC4gIENvdWxkIHlvdSBlbGFib3JhdGUgaG93IHRvIHRyaWdnZXIgdGhpcz8NCg0K
SSdtIG5vdCBzdXJlIGlmIHRoaXMgd2lsbCBoYXBwZW4gb24gbGFwdG9wIG9yIG9uIFBDLg0KV2Un
dmUgZm91bmQgdGhpcyBpc3N1ZSBvbiBBbmRyb2lkIHBob25lIChJJ20gbm90IHN1cmUgaWYgZWFj
aCBBbmRyb2lkDQpwaG9uZSBjYW4gcmVwcm9kdWNlIHRoaXMuKS4NCg0KQWZ0ZXIgYm9vdGluZyB0
aGUgYW5kcm9pZCBwaG9uZSwgaW5zZXJ0IHR5cGUtYyBoZWFkc2V0IHdpdGhvdXQgY2hhcmdpbmcN
CmFuZCBwbGF5IG11c2ljIGF0IGFueSBkdXJhdGlvbiwgc2F5LCAxIHNlY29uZCwgdGhlbiBzdG9w
LiBQdXQgcGhvbmUgYXdheQ0KdG8gaWRsZSBhYm91dCAxN34xOCBtaW51dGVzLiBXYWl0IGF1dG8g
cG0gaGFwcGVuZWQgYW5kIHRoZSBwb3dlciBzdGF0ZQ0KY2hhbmdlIHRvIFNORFJWX0NUTF9QT1dF
Ul9EM2hvdCBpbiBzb3VuZC91c2IvY2FyZC5jLiBUaGVuIHdha2UgdXAgdGhlDQpwaG9uZSwgcGxh
eSBtdXNpYyBhZ2Fpbi4gVGhlbiB5b3UnbGwgcHJvYmFibHkgZm91bmQgdGhlIG11c2ljIHdhcyBu
b3QNCnBsYXlpbmcgYW5kIHRoZSBwcm9ncmVzcyBiYXIga2VlcCBhdCB0aGUgc2FtZSBwb3NpdGlv
bi4gSXQgb25seSBoYXBwZW4gDQp3aGVuIHBvd2VyIHN0YXRlIGlzIFNORFJWX0NUTF9QT1dFUl9E
M2hvdC4gSWYgbm90ICh0aGUgcG93ZXIgc3RhdGUgaXMNClNORFJWX0NUTF9QT1dFUl9EMCksIHJl
cGVhdCB0aGUgc3RlcHMgZm9yIHNldmVyYWwgdGltZXMsIHRoZW4gaXQgd2lsbCBiZQ0KcHJvZHVj
ZWQgYXQgc29tZSB0aW1lLg0KDQpXaGVuIGl0IGhhcHBlbmVkLCBzb3VuZF91c2JfcGNtX29wZW4o
KSB3aWxsIHdha2UgdXAgdGhlIHNvdW5kIGNhcmQgYnkgDQpzZXR1cF9od19pbmZvKCktPl9fdXNi
X2F1ZGlvX3Jlc3VtZSgpLiBIb3dldmVyLCB0aGUgY2FyZCBhbmQgdGhlDQppbnRlcmZhY2UgaXMg
ZnVuY3Rpb24gcHJvcGVybHkgcmlnaHQgbm93LCB0aGUgcG93ZXIgc3RhdGUga2VlcHMgcmVtYWlu
DQpTTkRSVl9DVExfUE9XRVJfRDNob3QuIFRoZSBzdWdnZXN0aXZlIHBhcmFtZXRlciBzZXR0aW5n
cyBmcm9tIHVwcGVyDQpzb3VuZCByZXF1ZXN0IHdpbGwgYmUgcGVuZGluZyBzaW5jZSBsYXRlciBz
bmRfcG93ZXJfd2FpdCgpIGNhbGwgd2lsbA0Kc3RpbGwgd2FpdCB0aGUgY2FyZCBhd2FrZW4uIElk
ZWFsbHksIGF1dG8gUE0gc2hvdWxkIGJlIHJlY292ZXJlZCBieQ0Kc291bmQgY2FyZCBpdHNlbGYu
IEJ1dCBvbmNlIHRoZSBjYXJkIGlzIGF3YWtlbiBhdCB0aGlzIGNpcmN1bXN0YW5jZSwgaXQNCmxv
b2tzIGxpa2UgdGhlcmUgYXJlIG5vdCBtb3JlIGF1dG8gcG0gZXZlbnQuIEFuZCB0aGUgc291bmQg
c3lzdGVtIG9mDQp0aGlzIGludGVyZmFjZSB3aWxsIHN0dWNrIGhlcmUgZm9yZXZlciB1bnRpbCB1
c2VyIHBsdWcgb3V0IHRoZSBoZWFkc2V0DQoocmVzZXQgdGhlIGhhcmR3YXJlKS4NCg0KVGhlIHJv
b3QgY2F1c2UgaXMgdGhhdCBvbmNlIHRoZSBjYXJkIGhhcyBiZWVuIHJlc3VtZWQsIGl0IHNob3Vs
ZCBpbmZvcm0NCmF1dG8gcG0gY2hhbmdlIHRoZSBzdGF0ZSBiYWNrIGludG8gU05EUlZfQ1RMX1BP
V0VSX0QwIGFuZCBtYXJrIHRoZQ0KZGV2aWNlIGlzIHVzaW5nIGJ5IHNvbWUgb25lLg0KDQo+ID4g
V2hpY2ggY2F1c2UgdGhlIGluZmluaXRlIGxvb3ANCj4gPiBoYXBwZW5lZCBpbiBzbmRfcG93ZXJf
d2FpdCgpIHRvIGNoZWNrIHRoZSBwb3dlciBzdGF0ZS4gVGh1cyB0aGUNCj4gPiBzdWNjZXNzaXZl
IHNldHRpbmcgaW9jdGwgY2Fubm90IGJlIHBhc3NlZCB0byBjYXJkLg0KPiA+IA0KPiA+IEhlbmNl
IHdlIHN1Z2dlc3QgdG8gY2hhbmdlIHBvd2VyIHN0YXRlIHRvIFNORFJWX0NUTF9QT1dFUl9EMCB3
aGVuIGNhcmQNCj4gPiBoYXMgYmVlbiByZXN1bWVkIHN1Y2Nlc3NmdWxseS4NCj4gDQo+IFRoaXMg
ZG9lc24ndCBsb29rIGxpa2UgYSByaWdodCBzb2x1dGlvbiBmb3IgdGhlIHByb2JsZW0sIHNvcnJ5
Lg0KPiBUaGUgY2FyZCBQTSBzdGF0dXMgbXVzdCBiZSByZWNvdmVyZWQgdG8gRDAgd2hlbiB0aGUg
YXV0b3Jlc3VtZQ0KPiBzdWNjZWVkcy4gIElmIG5vdCwgc29tZXRoaW5nIGlzIGJyb2tlbiB0aGVy
ZSwgYW5kIGl0IG11c3QgYmUgZml4ZWQNCj4gaW5zdGVhZCBvZiBmaWRkbGluZyB0aGUgc3RhdHVz
IGZsYWcgZXh0ZXJuYWxseS4NCg0KWWVzLCBJIGFncmVlZCwgYnV0IGFmdGVyIGNoZWNraW5nIHRo
ZSBjb2RlIGluIHNvdW5kIGRyaXZlcnMsIA0KaXQgbG9va3MgbGlrZSB0aGVyZSBpcyBvbmx5IGNo
YW5jZSB0aGF0IGF1dG8gcG0gdHJpZ2dlcmVkIGJ5IGxvdy1sZXZlbA0KY29kZSBpbiBzb3VuZC91
c2IvY2FyZC5jLiBJbiBrZXJuZWwgNC4xNCwgYXV0byBwbSBzdXNwZW5kIGlzIHRyaWdnZXJlZA0K
Ynkgc25kX3BjbV9zdXNwZW5kX2FsbCgpLiBJbiBsYXRlciBrZXJuZWwsIGl0IGlzIHRyaWdnZXJl
ZCBieQ0Kc25kX3VzYl9wY21fc3VzcGVuZCgpLiBIb3dldmVyLCBpdCBsb29rcyBsaWtlIHRoZXJl
IGFyZSBubyBhbnkgcmVzdW1lDQp0cmlnZ2VyIHRvIHJlY292ZXIgYXV0byBwbSBzdGF0ZSB3aGVu
IHRoZSBjYXJkIGhhcyBiZWVuIHdha2VuIGJ5DQpzb3VuZF91c2JfcGNtX29wZW4oKS4gVGhlIHJl
bWFpbiByZXN1bWUgdHJpZ2dlciBpbg0Kc291bmQvY29yZS9wY21fbmF0aXZlLmMgd2VyZSBhbGwg
c3RhdGljLiBJJ3ZlIHRyaWVkIHRvIHVzZSB0aGVzZSByZXN1bWUNCmZ1bmN0aW9uIGluIHNvdW5k
L3VzYi9jYXJkLmMgYnV0IGl0IHNlZW1zIGNhbm5vdCBnZXQgYmV0dGVyIHJlc3VsdCB0aGFuDQpj
aGFuZ2luZyB0aGUgcG93ZXIgc3RhdGUgd2hlbiBzb3VuZCBjYXJkIGlzIGluIHVzZS4gDQoNCkkn
dmUgcmVwbGllZCBhbm90aGVyIG1haWwgZWFybGllciBpbmNsdWRlcyBkZWJ1ZyBwYXRjaCBhbmQg
dGhlIG90aGVyDQp3b3JrIGFyb3VuZCB0byB2ZXJpZnkgdGhpcyBpc3N1ZS4gVGhlIGlzc3VlIGhh
cyBiZWVuIGZvdW5kIG9uDQprZXJuZWwtNC4xNCwgYnV0IGNoZWNrIHRoZSBjb2RlIGxvZ2ljIGhl
cmUgaW4gc291bmQvdXNiL2NhcmQuYyBhbmQNCnNvdW5kL3VzYi9wY20uYywgSSB0aGluayB0aGUg
c2FtZSBwcm9ibGVtIHN0aWxsIGV4aXN0ZWQgaW4gNC4xOSwgNS40DQoodXNlZCBieSBhbmRyb2lk
KSwgYW5kIGluIGN1cnJlbnQga2VybmVsIHRyZWUuDQoNCg0KPiB0aGFua3MsDQo+IA0KPiBUYWth
c2hpDQoNCklmIHRoZSBhYm92ZSBleHBsYW5hdGlvbiB3ZXJlIG5vdCBjbGVhciBlbm91Z2gsIEkn
bGwgdHJ5IG15IGJlc3QgdG8NCmV4cGxhaW4gaXQgaW4gbW9yZSBkZXRhaWwuIE1heWJlIHRoZSBi
ZXR0ZXIgd2F5IGlzIHRvIHNlbmQgYm90aCBhdXRvIHBtDQpyZXN1bWUgYW5kIHJ1bnRpbWUgcmVz
dW1lIHdoZW4gc291bmRfdXNiX3BjbV9vcGVuKCkgaXMgY2FsbGVkLiBCdXQNCmFjY29yZGluZyB0
byB0aGUgY3VycmVudCBjb2RlcyBpbiBjYXJkLmMsIHdlIG1pZ2h0IG5lZWQgdG8gY2FsbA0KX191
c2JfYXVkaW9fcmVzdW1lKCkgdHdpY2UgaW4gc2V0dXBfaHdfaW5mbygpLg0KDQpUaGFua3MNCk1h
Y3BhdWwgTGluDQoNCg0KDQo=

