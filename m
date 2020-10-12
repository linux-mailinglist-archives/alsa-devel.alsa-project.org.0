Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D169328AE3A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 08:22:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AF8C1671;
	Mon, 12 Oct 2020 08:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AF8C1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602483770;
	bh=tye3EoEyjrtmqh7ssQVONlLnuV9c6l4iS/PzBi5TB1c=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NF57e6c00cdhuLYpptfm/0kswer3Bm1MD6sYq6M7vMYh2vBaMJNXjtzLDRuyPGDEM
	 fUJn6I9d7IMKG3aVEjGjHR8QLvSjueOC0GADn6OaFTEYKYhAVbI8p1AI5JCkRMLRYx
	 NP//7+Gs6I8FS9UFwO7ek87culYUKrE661NTME8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E529F800F6;
	Mon, 12 Oct 2020 08:21:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3AD6F80217; Mon, 12 Oct 2020 08:21:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id 5C0E4F80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 08:20:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C0E4F80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="AT1cduE9"
X-UUID: feb515c6ba334bb69166de9c1c5e9109-20201012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=tye3EoEyjrtmqh7ssQVONlLnuV9c6l4iS/PzBi5TB1c=; 
 b=AT1cduE9lTQGrYcfJVwgNmRloFcK+HPOVfILbeakhYB2oh+uAcTbUrCHisgogz542/WXOnz0zu7rw1fNiImNOfnFaNWBT8KUZ6RikewboIp7nkZ10h6cm4C3uX6vG/XHmZLGbDeVkoLVp+I0Na72ix5exw2vNnQbebJApxJ4/3Y=;
X-UUID: feb515c6ba334bb69166de9c1c5e9109-20201012
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 5546264; Mon, 12 Oct 2020 14:20:56 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 12 Oct 2020 14:20:53 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Oct 2020 14:20:52 +0800
Message-ID: <1602483653.8921.20.camel@mhfsdcap03>
Subject: Re: [PATCH 5/5] dt-bindings: mediatek: mt8192: add
 mt8192-mt6358-rt1015-rt5682 document
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Mon, 12 Oct 2020 14:20:53 +0800
In-Reply-To: <20201006204344.GA2791644@bogus>
References: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
 <1601624142-18991-6-git-send-email-jiaxin.yu@mediatek.com>
 <20201006204344.GA2791644@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, shane.chien@mediatek.com, tiwai@suse.com,
 maowenan@huawei.com, tzungbi@google.com, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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

T24gVHVlLCAyMDIwLTEwLTA2IGF0IDE1OjQzIC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gRnJpLCBPY3QgMDIsIDIwMjAgYXQgMDM6MzU6NDJQTSArMDgwMCwgSmlheGluIFl1IHdyb3Rl
Og0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBkb2N1bWVudCBmb3IgdGhlIG1hY2hpbmUgYm9hcmQgd2l0
aCBtdDYzNTgsIHJ0MTAxNSBhbmQgcnQ1NjgyLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEpp
YXhpbiBZdSA8amlheGluLnl1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL3NvdW5k
L210ODE5Mi1tdDYzNTktcnQxMDE1LXJ0NTY4Mi55YW1sICAgIHwgNDQgKysrKysrKysrKysrKysr
KysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5
Mi1tdDYzNTktcnQxMDE1LXJ0NTY4Mi55YW1sDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItbXQ2MzU5LXJ0MTAxNS1y
dDU2ODIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgx
OTItbXQ2MzU5LXJ0MTAxNS1ydDU2ODIueWFtbA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
ID4gaW5kZXggMDAwMDAwMDAwMDAwMC4uZGZmNTAwNGNkMDM2OA0KPiA+IC0tLSAvZGV2L251bGwN
Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTky
LW10NjM1OS1ydDEwMTUtcnQ1NjgyLnlhbWwNCj4gPiBAQCAtMCwwICsxLDQ0IEBADQo+ID4gKyMg
U1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gDQo+IER1YWwgbGljZW5zZSBuZXcg
YmluZGluZ3M6DQo+IA0KPiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4gDQpPaywg
Z290IGl0Lg0KDQo+ID4gKyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9zb3VuZC9tdDgxOTItbXQ2MzU5LXJ0MTAxNS1ydDU2ODIueWFt
bCMNCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3Jl
LnlhbWwjDQo+ID4gKw0KPiA+ICt0aXRsZTogTWVkaWF0ZWsgTVQ4MTkyIHdpdGggTVQ2MzU5LCBS
VDEwMTUgYW5kIFJUNTY4MiBBU29DIHNvdW5kIGNhcmQgZHJpdmVyDQo+ID4gKw0KPiA+ICttYWlu
dGFpbmVyczoNCj4gPiArICAgLSBKaWF4aW4gWXUgPGppYXhpbi55dUBtZWRpYXRlay5jb20+DQo+
ID4gKyAgIC0gU2hhbmUgQ2hpZW4gPHNoYW5lLmNoaWVuQG1lZGlhdGVrLmNvbT4NCj4gPiArDQo+
ID4gK2Rlc2NyaXB0aW9uOg0KPiA+ICsgIFRoaXMgYmluZGluZyBkZXNjcmliZXMgdGhlIE1UODE5
MiBzb3VuZCBjYXJkLg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiArICBjb21wYXRpYmxl
Og0KPiA+ICsgICAgY29udGFpbnM6DQo+IA0KPiBEcm9wIHRoaXMuIE90aGVyIHN0cmluZ3Mgc2hv
dWxkbid0IGJlIGFsbG93ZWQuDQo+IA0KDQpTaG91bGQgSSBuZWVkIHRvIHJlbW92ZSAiY29udGFp
bnMiPw0KDQo+ID4gKyAgICAgIGNvbnN0OiBtZWRpYXRlayxtdDgxOTJfbXQ2MzU5X3J0MTAxNV9y
dDU2ODINCj4gDQo+IEp1c3QgYSBsaXN0IG9mIHBhcnQgbnVtYmVycz8gQSBkaWZmZXJlbnQgY29k
ZWMgd291bGQgYmUgYSBkaWZmZXJlbnQgDQo+IGNvbXBhdGlibGUgYW5kIGRyaXZlcj8gWW91IHNo
b3VsZCBoYXZlIGEgbGluayB0byB0aGUgY29kZWMgYW5kIHlvdSBjYW4gDQo+IHJlYWQgaXQncyBj
b21wYXRpYmxlIHRvIGdldCB3aGF0IGNvZGVjIHlvdSBoYXZlLg0KPiANClRIaXMgYmluZGluZ3Mg
aXMgZGVkaWNhdGVkIHRvIHRoZSBtdDgxOTIgd2l0aCBtdDYzNTksIHJ0MTAxNSBhbmQgcnQ1Njgy
Lg0KV2UgYXJlIG5vdCByZWFkeSB0byBjb25maWd1cmUgZGFpLWxpbmsgaW4gRFRTLiBJcyB0aGlz
IG1hbmRhdG9yeSBub3c/DQoNCj4gPiArDQo+ID4gKyAgbWVkaWF0ZWsscGxhdGZvcm06DQo+ID4g
KyAgICAkcmVmOiAiL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZSINCj4g
PiArICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4gKyAgICAgVGhlIERUL09GIG5vZGUgd2hpY2ggaXMg
dXNlZCB0byBzcGVjaWZ5IHRoZSBsaW5rJ3MgcGxhdGZvcm0gZHJpdmVyLg0KPiANCj4gV2hhdCdz
ICJsaW5rJ3MgcGxhdGZvcm0gZHJpdmVyIj8gQSBEVCBkb2Vzbid0IGhhdmUgZHJpdmVycy4NCj4g
DQpUaGVyZSdzIHNvbWV0aGluZyB3cm9uZyB3aXRoIG15IGRlc2NyaXB0aW9uLiAibWVkaWF0ZWss
cGxhdGZvcm0iIGlzIHRoZQ0KcGhhbmRsZSBvZiBNVDgxOTIgQVNvQyBwbGF0Zm9ybS4NCg0KPiA+
ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtyZXF1aXJl
ZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIG1lZGlhdGVrLHBsYXRmb3JtDQo+ID4g
Kw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArDQo+ID4gKyAgICBzb3VuZDogbXQ4
MTkyLXNvdW5kIHsNCj4gPiArICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1t
dDYzNTktcnQxMDE1LXJ0NTY4MiI7DQo+ID4gKyAgICAgICAgbWVkaWF0ZWsscGxhdGZvcm0gPSA8
JmFmZT47DQo+ID4gKyAgICAgICAgcGluY3RybC1uYW1lcyA9ICJhdWRfY2xrX21vc2lfb2ZmIiwN
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgImF1ZF9jbGtfbW9zaV9vbiI7DQo+ID4gKyAg
ICAgICAgcGluY3RybC0wID0gPCZhdWRfY2xrX21vc2lfb2ZmPjsNCj4gPiArICAgICAgICBwaW5j
dHJsLTEgPSA8JmF1ZF9jbGtfbW9zaV9vbj47DQo+ID4gKyAgICB9Ow0KPiA+ICsNCj4gPiArLi4u
DQo+ID4gLS0gDQo+ID4gMi4xOC4wDQoNCg==

