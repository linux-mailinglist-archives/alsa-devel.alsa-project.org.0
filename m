Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E6129498B
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 10:55:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF8E016EB;
	Wed, 21 Oct 2020 10:55:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF8E016EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603270555;
	bh=zaM/JuZ3fzlu2O0iBgAyjKGNvAslXjaq46Pi4xFcyfI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gBfMNsULavrAFXXWbfHfdF7OjCe9nnZQ8wUtp+nXA5/7+2Sl37hqs25YdabeG6PLI
	 ry10YNOC0v+pQbZzVe/Qh3NSM4Kc5jrD+73eiNOlnCRBbw4DEkMPTEq5dThoHx88Qp
	 HYtz/nYIxrQaiX2bP1wWOhpWqiZ3T6flAC+2suGY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19207F80277;
	Wed, 21 Oct 2020 10:54:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1559F80475; Wed, 21 Oct 2020 10:54:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id 7223DF8011C
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 10:54:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7223DF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="RbXkanGP"
X-UUID: c3e5ca207bb84ec5ab4730a7655bdcb0-20201021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=zaM/JuZ3fzlu2O0iBgAyjKGNvAslXjaq46Pi4xFcyfI=; 
 b=RbXkanGPWlK4tySdvwQ5xxXLUazu7+iXU92Ncrf3hjP6bLDg5DeYQCn+/NRpmXpFFu/UZb+cMkfN0QoquS4hd67Oka8StUdny0/iZuuYUACYu90p3y/zuj29dAQg75+5bTERs0SwBx0xcBLWuDc7IA3sobeuPUki9n9xBguwQB8=;
X-UUID: c3e5ca207bb84ec5ab4730a7655bdcb0-20201021
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2009036345; Wed, 21 Oct 2020 16:53:59 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Oct 2020 16:53:57 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Oct 2020 16:53:57 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 0/5] ASoC: Mediatek: Add support for MT8192 SoC
Date: Wed, 21 Oct 2020 16:53:50 +0800
Message-ID: <1603270435-3548-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Content-Transfer-Encoding: base64
Cc: shane.chien@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 kuninori.morimoto.gx@renesas.com
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

VGhpcyBzZXJpZXMgb2YgcGF0Y2hlcyBhZGRzIHN1cHBvcnQgZm9yIE1lZGlhdGVrIEFGRSBmb3Ig
TVQ4MTkyIFNvQy4gQXQgdGhlIHNhbWUNCnRpbWUsIHRoZSBjYWxpYnJhdGlvbiBmdW5jdGlvbiBv
ZiBNVDYzNTkgaXMgY29tcGxldGVkIHdpdGggcmVhbCBtYWNoaW5lIGRyaXZlci4NClRoZSBwYXRj
aCBpcyBiYXNlZCBvbiBicm9vbmllIHRyZWUgImZvci1uZXh0IiBicmFuY2guDQoNCkNoYW5nZSBz
aW5jZSB2MToNCiAgLSBmaXhlZCBzb21lIHR5cG9zIHJlbGF0ZWQgdG8gZHQtYmluZGluZ3MgaW4g
W3YxLDMvNV0gYW5kIFt2MSw1LzVdDQogIC0gYWRkIHZlbmRvciBwcmVmaXggdG8gdGhlIHByb3Bl
cnRpZXMsIHN1Y2ggYXMgIm1lZGlhdGVrLGFwbWl4ZWRzeXMiDQogIC0gYWRkIGEgZGVwZW5kZW5j
eSBkZXNjcmlwdGlvbiB0byBpbmRpY2F0ZSB0aGUgcmVxdWlyZWQgaGVhZGVyIGZpbGVzDQoNCkpp
YXhpbiBZdSAoNSk6DQogIEFTb0M6IG1lZGlhdGVrOiBtdDYzNTk6IGFkZCB0aGUgY2FsaWJyYXRp
b24gZnVuY3Rpb25zDQogIEFTb0M6IG1lZGlhdGVrOiBtdDgxOTI6IGFkZCBwbGF0Zm9ybSBkcml2
ZXINCiAgZHQtYmluZGluZ3M6IG1lZGlhdGVrOiBtdDgxOTI6IGFkZCBhdWRpbyBhZmUgZG9jdW1l
bnQNCiAgQVNvQzogbWVkaWF0ZWs6IG10ODE5MjogYWRkIG1hY2hpbmUgZHJpdmVyIHdpdGggbXQ2
MzU5LCBydDEwMTUgYW5kDQogICAgcnQ1NjgyDQogIGR0LWJpbmRpbmdzOiBtZWRpYXRlazogbXQ4
MTkyOiBhZGQgbXQ4MTkyLW10NjM1OC1ydDEwMTUtcnQ1NjgyDQogICAgZG9jdW1lbnQNCg0KIC4u
Li9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZlLXBjbS55YW1sICAgICAgICB8ICAxMDMgKw0KIC4u
Li9zb3VuZC9tdDgxOTItbXQ2MzU5LXJ0MTAxNS1ydDU2ODIueWFtbCAgICB8ICAgNDIgKw0KIHNv
dW5kL3NvYy9jb2RlY3MvbXQ2MzU5LmMgICAgICAgICAgICAgICAgICAgICB8ICAxMTAgKw0KIHNv
dW5kL3NvYy9jb2RlY3MvbXQ2MzU5LmggICAgICAgICAgICAgICAgICAgICB8ICAgIDcgKw0KIHNv
dW5kL3NvYy9tZWRpYXRlay9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8ICAgMjMgKw0KIHNv
dW5kL3NvYy9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICB8ICAgIDEgKw0KIHNv
dW5kL3NvYy9tZWRpYXRlay9jb21tb24vbXRrLWFmZS1mZS1kYWkuYyAgICB8ICAgMTMgKy0NCiBz
b3VuZC9zb2MvbWVkaWF0ZWsvY29tbW9uL210ay1iYXNlLWFmZS5oICAgICAgfCAgICAxICsNCiBz
b3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL01ha2VmaWxlICAgICAgICAgICAgfCAgIDE2ICsNCiBz
b3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1hZmUtY2xrLmMgICAgfCAgNjY5ICsrKysN
CiBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1hZmUtY2xrLmggICAgfCAgMjQ0ICsr
DQogc291bmQvc29jL21lZGlhdGVrL210ODE5Mi9tdDgxOTItYWZlLWNvbW1vbi5oIHwgIDE3MCAr
DQogLi4uL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWFmZS1jb250cm9sLmMgIHwgIDE2MyAr
DQogc291bmQvc29jL21lZGlhdGVrL210ODE5Mi9tdDgxOTItYWZlLWdwaW8uYyAgIHwgIDMwNiAr
Kw0KIHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWFmZS1ncGlvLmggICB8ICAgMTkg
Kw0KIHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWFmZS1wY20uYyAgICB8IDIzODkg
KysrKysrKysrKysrKw0KIHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWRhaS1hZGRh
LmMgICB8IDE0ODkgKysrKysrKysNCiBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1k
YWktaTJzLmMgICAgfCAyMTM5ICsrKysrKysrKysrDQogc291bmQvc29jL21lZGlhdGVrL210ODE5
Mi9tdDgxOTItZGFpLXBjbS5jICAgIHwgIDQwOSArKysNCiBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4
MTkyL210ODE5Mi1kYWktdGRtLmMgICAgfCAgNzc4ICsrKysNCiAuLi4vbWVkaWF0ZWsvbXQ4MTky
L210ODE5Mi1pbnRlcmNvbm5lY3Rpb24uaCAgfCAgIDY1ICsNCiAuLi4vbXQ4MTkyL210ODE5Mi1t
dDYzNTktcnQxMDE1LXJ0NTY4Mi5jICAgICAgfCAxMDU4ICsrKysrKw0KIHNvdW5kL3NvYy9tZWRp
YXRlay9tdDgxOTIvbXQ4MTkyLXJlZy5oICAgICAgICB8IDMxMzEgKysrKysrKysrKysrKysrKysN
CiAyMyBmaWxlcyBjaGFuZ2VkLCAxMzM0MSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0K
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291
bmQvbXQ4MTkyLWFmZS1wY20ueWFtbA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLW10NjM1OS1ydDEwMTUtcnQ1NjgyLnlh
bWwNCiBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL21lZGlhdGVrL210ODE5Mi9NYWtlZmls
ZQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1h
ZmUtY2xrLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL21lZGlhdGVrL210ODE5Mi9t
dDgxOTItYWZlLWNsay5oDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9tZWRpYXRlay9t
dDgxOTIvbXQ4MTkyLWFmZS1jb21tb24uaA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2Mv
bWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1hZmUtY29udHJvbC5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0
IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWFmZS1ncGlvLmMNCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgc291bmQvc29jL21lZGlhdGVrL210ODE5Mi9tdDgxOTItYWZlLWdwaW8uaA0KIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1hZmUtcGNt
LmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL21lZGlhdGVrL210ODE5Mi9tdDgxOTIt
ZGFpLWFkZGEuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTky
L210ODE5Mi1kYWktaTJzLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL21lZGlhdGVr
L210ODE5Mi9tdDgxOTItZGFpLXBjbS5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9t
ZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWRhaS10ZG0uYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3Vu
ZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1pbnRlcmNvbm5lY3Rpb24uaA0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1tdDYzNTktcnQxMDE1
LXJ0NTY4Mi5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIv
bXQ4MTkyLXJlZy5oDQoNCi0tIA0KMi4xOC4wDQo=

