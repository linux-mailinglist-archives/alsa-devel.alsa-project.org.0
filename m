Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DA7295CBD
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 12:33:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AA4E17DB;
	Thu, 22 Oct 2020 12:33:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AA4E17DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603362838;
	bh=mKI//o1Lk40Yi815nVYXanqjQKt/9UrGV5fgSoCAeH4=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KmoCwP9/qhsEOKiCq/0PnvAmBEl68ceA+ZEj0tLT00mN68puRzhasl2Q/aUc6OGln
	 2Qk8iaMBSoNQl8unanAfqE0YYJLb0cd9ik3ZofPPfc/76bbXLuCmDP1OvG+N5oCG7y
	 t4NJe4ZlnlekFST84pafF8TaohPmNkxPFHxC4Myo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 054FDF804AA;
	Thu, 22 Oct 2020 12:32:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57A9FF804A9; Thu, 22 Oct 2020 12:32:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id CA2A4F800CE
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 12:32:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA2A4F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="ha60ki7w"
X-UUID: 868ba0ebf25f43d0950ad40bb4dcde45-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=mKI//o1Lk40Yi815nVYXanqjQKt/9UrGV5fgSoCAeH4=; 
 b=ha60ki7wcIGTs1bJnKkZE/nT8iqEUCUQvZPSayyFFNSw+Sit8wZIHvGXQ6MKVUHaO81aVxrQAHNWcFk5S0uCd9z29rRxt6k9nrAqeej6t12hv0+gge05ANLiQPvB4Y1X5OcE+4YHd/UEmcbFf+6YwWEF7BAwmDvypg6GEGBkDzA=;
X-UUID: 868ba0ebf25f43d0950ad40bb4dcde45-20201022
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 13254462; Thu, 22 Oct 2020 18:32:06 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs07n1.mediatek.inc
 (172.21.101.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 22 Oct 2020 18:32:04 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Oct 2020 18:32:03 +0800
Message-ID: <1603362723.8921.37.camel@mhfsdcap03>
Subject: Re: [PATCH v2 5/5] dt-bindings: mediatek: mt8192: add
 mt8192-mt6358-rt1015-rt5682 document
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Thu, 22 Oct 2020 18:32:03 +0800
In-Reply-To: <20201021145605.GA2775711@bogus>
References: <1603270435-3548-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603270435-3548-6-git-send-email-jiaxin.yu@mediatek.com>
 <20201021145605.GA2775711@bogus>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, shane.chien@mediatek.com, tiwai@suse.com,
 tzungbi@google.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
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

T24gV2VkLCAyMDIwLTEwLTIxIGF0IDA5OjU2IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gV2VkLCBPY3QgMjEsIDIwMjAgYXQgMDQ6NTM6NTVQTSArMDgwMCwgSmlheGluIFl1IHdyb3Rl
Og0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBkb2N1bWVudCBmb3IgdGhlIG1hY2hpbmUgYm9hcmQgd2l0
aCBtdDYzNTgsIHJ0MTAxNQ0KPiA+IGFuZCBydDU2ODIuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1i
eTogSmlheGluIFl1IDxqaWF4aW4ueXVAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4v
c291bmQvbXQ4MTkyLW10NjM1OS1ydDEwMTUtcnQ1NjgyLnlhbWwgICAgfCA0MiArKysrKysrKysr
KysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspDQo+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQv
bXQ4MTkyLW10NjM1OS1ydDEwMTUtcnQ1NjgyLnlhbWwNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1tdDYzNTktcnQx
MDE1LXJ0NTY4Mi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5k
L210ODE5Mi1tdDYzNTktcnQxMDE1LXJ0NTY4Mi55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAwLi40YzM5ZTg4OTA2ZmMxDQo+ID4gLS0tIC9kZXYv
bnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9t
dDgxOTItbXQ2MzU5LXJ0MTAxNS1ydDU2ODIueWFtbA0KPiA+IEBAIC0wLDAgKzEsNDIgQEANCj4g
PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjArIE9SIEJTRC0yLUNsYXVzZSkN
Cj4gDQo+IEdQTC0yLjAtb25seQ0KPiANCj4gPiArJVlBTUwgMS4yDQo+ID4gKy0tLQ0KPiA+ICsk
aWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NvdW5kL210ODE5Mi1tdDYzNTktcnQx
MDE1LXJ0NTY4Mi55YW1sIw0KPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiArDQo+ID4gK3RpdGxlOiBNZWRpYXRlayBNVDgxOTIg
d2l0aCBNVDYzNTksIFJUMTAxNSBhbmQgUlQ1NjgyIEFTb0Mgc291bmQgY2FyZCBkcml2ZXINCj4g
PiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICsgICAtIEppYXhpbiBZdSA8amlheGluLnl1QG1l
ZGlhdGVrLmNvbT4NCj4gPiArICAgLSBTaGFuZSBDaGllbiA8c2hhbmUuY2hpZW5AbWVkaWF0ZWsu
Y29tPg0KPiA+ICsNCj4gPiArZGVzY3JpcHRpb246DQo+ID4gKyAgVGhpcyBiaW5kaW5nIGRlc2Ny
aWJlcyB0aGUgTVQ4MTkyIHNvdW5kIGNhcmQuDQo+ID4gKw0KPiA+ICtwcm9wZXJ0aWVzOg0KPiA+
ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICAgIGNvbnN0OiBtZWRpYXRlayxtdDgxOTJfbXQ2MzU5
X3J0MTAxNV9ydDU2ODINCj4gDQo+IEkgc3RpbGwgZG9uJ3QgdGhpbmsgdGhpcyBpcyB0aGUgcmln
aHQgd2F5IHRvIGRvIHRoaXMuDQo+IA0KRGVhciBSb2IsDQpUaGlzIG5vbWVuY2FsdHVyZSBpcyBl
eHRlbmRlZCB0byB0aGUgTVRLIG10ODE4My9tdDgxNzMuDQpBbmQgd2UgdGhpbmsgaXQncyBiZXR0
ZXIgdG8gbWFpbnRhaW4gbXVsdGlwbGUgYm9hcmRzLCBidXQNCnRoZSBkaXNhZHZhbnRhZ2UgaXMg
bmVlZCB0byB3cml0ZSBvbmUgbW9yZSBtYWNoaW5lIGRyaXZlcnMuDQoNCj4gPiArDQo+ID4gKyAg
bWVkaWF0ZWsscGxhdGZvcm06DQo+ID4gKyAgICAkcmVmOiAiL3NjaGVtYXMvdHlwZXMueWFtbCMv
ZGVmaW5pdGlvbnMvcGhhbmRsZSINCj4gPiArICAgIGRlc2NyaXB0aW9uOiBUaGUgcGhhbmRsZSBv
ZiBNVDgxOTIgQVNvQyBwbGF0Zm9ybS4NCj4gDQo+IEkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCB3
aGF0IHRoaXMgaXMuDQo+IA0KDQpUaGlzIHByb3BlcnR5IHdpbGwgYXNzaWduIHRvICdzbmRfc29j
X2RhaV9saW5rLT5wbGF0Zm9ybXMtPm9mX25vZGUnLg0KVGhlIHZhbHVlIG9mICdtZWRpYXRlayxw
bGF0Zm9ybScgaGVyZSBpcyAmYWZlIHRoYXQgaXMgbXQ4MTkyIHBsYXRmb3JtDQpkcml2ZXIuDQpJ
dCB3aWxsIGJlIHJlc29sdmVkIGZyb20gYSBwaGFuZGxlIHByb3BlcnR5IHRvIGEgZGV2aWNlX25v
ZGUgcG9pbnRlci4NCg0KPiA+ICsNCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+
ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIG1lZGlh
dGVrLHBsYXRmb3JtDQo+ID4gKw0KPiA+ICtleGFtcGxlczoNCj4gPiArICAtIHwNCj4gPiArDQo+
ID4gKyAgICBzb3VuZDogbXQ4MTkyLXNvdW5kIHsNCj4gPiArICAgICAgICBjb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10ODE5Mi1tdDYzNTktcnQxMDE1LXJ0NTY4MiI7DQo+ID4gKyAgICAgICAgbWVk
aWF0ZWsscGxhdGZvcm0gPSA8JmFmZT47DQo+ID4gKyAgICAgICAgcGluY3RybC1uYW1lcyA9ICJh
dWRfY2xrX21vc2lfb2ZmIiwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgImF1ZF9jbGtf
bW9zaV9vbiI7DQo+ID4gKyAgICAgICAgcGluY3RybC0wID0gPCZhdWRfY2xrX21vc2lfb2ZmPjsN
Cj4gPiArICAgICAgICBwaW5jdHJsLTEgPSA8JmF1ZF9jbGtfbW9zaV9vbj47DQo+ID4gKyAgICB9
Ow0KPiA+ICsNCj4gPiArLi4uDQo+ID4gLS0gDQo+ID4gMi4xOC4wDQoNCg==

