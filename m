Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 184BE297B59
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Oct 2020 10:01:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 997DE17DC;
	Sat, 24 Oct 2020 10:00:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 997DE17DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603526505;
	bh=1KN7hszEVP8/uxqUi6+D3V0c7StohRofr7IFpn3sG2c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C1OkQudsg7UzRKqNR5Ub/ApQIh5D96RF+LrP6bc8Prd6GofqXVQ6cSSOLg/AEIeQH
	 TTdeg/AB/2EX9JmZkU/W4mA/da9xEbQeuwIwcKa+lJhAU13c/R5JOnbwO86MLvkt8H
	 R7aJTBi5ajXbgy7EFdzoKlX6ruuY5jWKXlqG4vlw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C3BDF804C1;
	Sat, 24 Oct 2020 09:59:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBC22F804B4; Sat, 24 Oct 2020 09:59:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 592EBF80104
 for <alsa-devel@alsa-project.org>; Sat, 24 Oct 2020 09:59:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 592EBF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="GhZhxCzy"
X-UUID: 89723c1ebcfe4fce82b133fbdef9940c-20201024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1KN7hszEVP8/uxqUi6+D3V0c7StohRofr7IFpn3sG2c=; 
 b=GhZhxCzynm5wZkGdrbiDIfTXkG8pQ5ZclT8zPW4zlu1dAabOuoH7PE+xQQ4sV2V20U/veXybwHi1DYV0gJg9YG7dFB2f1T7HwMvfPJv92jkUIxFLCoQ0rzIMcvJSMAznmWhx9GgCMQoroxts+TNdBGQ8YrYauRlatuoBKGRL6Gc=;
X-UUID: 89723c1ebcfe4fce82b133fbdef9940c-20201024
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 560457733; Sat, 24 Oct 2020 15:59:03 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 24 Oct 2020 15:59:01 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 24 Oct 2020 15:58:59 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 0/9] ASoC: Mediatek: Add support for MT8192 SoC
Date: Sat, 24 Oct 2020 15:58:50 +0800
Message-ID: <1603526339-15005-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: F3D02353B6E2DBA61C4A25150A69708FA218C2A4FA07713F8F03CC2CC6454B682000:8
X-MTK: N
Content-Transfer-Encoding: base64
Cc: shane.chien@mediatek.com, Bicycle.Tsai@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Trevor.Wu@mediatek.com,
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
aW5jZSB2MjoNCiAgLSBzcGxpdCB0aGUgZGFpIGRyaXZlciBmaWxlcyBhcyBhIHNlcGVyYXRlIHBh
dGNoDQogIC0gZml4IGR0LWJpbmRpbmdzIHRvIEdQTC0yLjAtb25seSBMaWNlbnNlDQogIC0gcmVt
b3ZlIHVubmVjZXNzYXJ5IHByZXBlcnR5IGRlc2NyaXB0aW9ucyBzdWNoIGFzICdtYXhJdGVtcycN
Cg0KQ2hhbmdlIHNpbmNlIHYxOg0KICAtIGZpeGVkIHNvbWUgdHlwb3MgcmVsYXRlZCB0byBkdC1i
aW5kaW5ncyBpbiBbdjEsMy81XSBhbmQgW3YxLDUvNV0NCiAgLSBhZGQgdmVuZG9yIHByZWZpeCB0
byB0aGUgcHJvcGVydGllcywgc3VjaCBhcyAibWVkaWF0ZWssYXBtaXhlZHN5cyINCiAgLSBhZGQg
YSBkZXBlbmRlbmN5IGRlc2NyaXB0aW9uIHRvIGluZGljYXRlIHRoZSByZXF1aXJlZCBoZWFkZXIg
ZmlsZXMNCg0KSmlheGluIFl1ICg5KToNCiAgQVNvQzogbWVkaWF0ZWs6IG10NjM1OTogYWRkIHRo
ZSBjYWxpYnJhdGlvbiBmdW5jdGlvbnMNCiAgQVNvQzogbWVkaWF0ZWs6IG10ODE5MjogYWRkIHBs
YXRmb3JtIGRyaXZlcg0KICBBU29DOiBtZWRpYXRlazogbXQ4MTkyOiBzdXBwb3J0IGkycyBpbiBw
bGF0Zm9ybSBkcml2ZXINCiAgQVNvQzogbWVkaWF0ZWs6IG10ODE5Mjogc3VwcG9ydCBhZGQgaW4g
cGxhdGZvcm0gZHJpdmVyDQogIEFTb0M6IG1lZGlhdGVrOiBtdDgxOTI6IHN1cHBvcnQgcGNtIGlu
IHBsYXRmb3JtIGRyaXZlcg0KICBBU29DOiBtZWRpYXRlazogbXQ4MTkyOiBzdXBwb3J0IHRkbSBp
biBwbGF0Zm9ybSBkcml2ZXINCiAgZHQtYmluZGluZ3M6IG1lZGlhdGVrOiBtdDgxOTI6IGFkZCBh
dWRpbyBhZmUgZG9jdW1lbnQNCiAgQVNvQzogbWVkaWF0ZWs6IG10ODE5MjogYWRkIG1hY2hpbmUg
ZHJpdmVyIHdpdGggbXQ2MzU5LCBydDEwMTUgYW5kDQogICAgcnQ1NjgyDQogIGR0LWJpbmRpbmdz
OiBtZWRpYXRlazogbXQ4MTkyOiBhZGQgbXQ4MTkyLW10NjM1OC1ydDEwMTUtcnQ1NjgyDQogICAg
ZG9jdW1lbnQNCg0KIC4uLi9iaW5kaW5ncy9zb3VuZC9tdDgxOTItYWZlLXBjbS55YW1sICAgICAg
ICB8ICAxMDAgKw0KIC4uLi9zb3VuZC9tdDgxOTItbXQ2MzU5LXJ0MTAxNS1ydDU2ODIueWFtbCAg
ICB8ICAgNDIgKw0KIHNvdW5kL3NvYy9jb2RlY3MvbXQ2MzU5LmMgICAgICAgICAgICAgICAgICAg
ICB8ICAxMTAgKw0KIHNvdW5kL3NvYy9jb2RlY3MvbXQ2MzU5LmggICAgICAgICAgICAgICAgICAg
ICB8ICAgIDcgKw0KIHNvdW5kL3NvYy9tZWRpYXRlay9LY29uZmlnICAgICAgICAgICAgICAgICAg
ICB8ICAgMjMgKw0KIHNvdW5kL3NvYy9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
ICB8ICAgIDEgKw0KIHNvdW5kL3NvYy9tZWRpYXRlay9jb21tb24vbXRrLWFmZS1mZS1kYWkuYyAg
ICB8ICAgMTMgKy0NCiBzb3VuZC9zb2MvbWVkaWF0ZWsvY29tbW9uL210ay1iYXNlLWFmZS5oICAg
ICAgfCAgICAxICsNCiBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL01ha2VmaWxlICAgICAgICAg
ICAgfCAgIDE2ICsNCiBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1hZmUtY2xrLmMg
ICAgfCAgNjY5ICsrKysNCiBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1hZmUtY2xr
LmggICAgfCAgMjQ0ICsrDQogc291bmQvc29jL21lZGlhdGVrL210ODE5Mi9tdDgxOTItYWZlLWNv
bW1vbi5oIHwgIDE3MCArDQogLi4uL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWFmZS1jb250
cm9sLmMgIHwgIDE2MyArDQogc291bmQvc29jL21lZGlhdGVrL210ODE5Mi9tdDgxOTItYWZlLWdw
aW8uYyAgIHwgIDMwNiArKw0KIHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWFmZS1n
cGlvLmggICB8ICAgMTkgKw0KIHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWFmZS1w
Y20uYyAgICB8IDIzODkgKysrKysrKysrKysrKw0KIHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIv
bXQ4MTkyLWRhaS1hZGRhLmMgICB8IDE0ODkgKysrKysrKysNCiBzb3VuZC9zb2MvbWVkaWF0ZWsv
bXQ4MTkyL210ODE5Mi1kYWktaTJzLmMgICAgfCAyMTM5ICsrKysrKysrKysrDQogc291bmQvc29j
L21lZGlhdGVrL210ODE5Mi9tdDgxOTItZGFpLXBjbS5jICAgIHwgIDQwOSArKysNCiBzb3VuZC9z
b2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1kYWktdGRtLmMgICAgfCAgNzc4ICsrKysNCiAuLi4v
bWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1pbnRlcmNvbm5lY3Rpb24uaCAgfCAgIDY1ICsNCiAuLi4v
bXQ4MTkyL210ODE5Mi1tdDYzNTktcnQxMDE1LXJ0NTY4Mi5jICAgICAgfCAxMDU4ICsrKysrKw0K
IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLXJlZy5oICAgICAgICB8IDMxMzEgKysr
KysrKysrKysrKysrKysNCiAyMyBmaWxlcyBjaGFuZ2VkLCAxMzMzOCBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLWFmZS1wY20ueWFtbA0KIGNyZWF0ZSBtb2RlIDEwMDY0
NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLW10NjM1OS1y
dDEwMTUtcnQ1NjgyLnlhbWwNCiBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL21lZGlhdGVr
L210ODE5Mi9NYWtlZmlsZQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2MvbWVkaWF0ZWsv
bXQ4MTkyL210ODE5Mi1hZmUtY2xrLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL21l
ZGlhdGVrL210ODE5Mi9tdDgxOTItYWZlLWNsay5oDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5k
L3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWFmZS1jb21tb24uaA0KIGNyZWF0ZSBtb2RlIDEw
MDY0NCBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1hZmUtY29udHJvbC5jDQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWFmZS1ncGlv
LmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL21lZGlhdGVrL210ODE5Mi9tdDgxOTIt
YWZlLWdwaW8uaA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTky
L210ODE5Mi1hZmUtcGNtLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL21lZGlhdGVr
L210ODE5Mi9tdDgxOTItZGFpLWFkZGEuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2Mv
bWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1kYWktaTJzLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgc291
bmQvc29jL21lZGlhdGVrL210ODE5Mi9tdDgxOTItZGFpLXBjbS5jDQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWRhaS10ZG0uYw0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1pbnRlcmNvbm5lY3Rp
b24uaA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5
Mi1tdDYzNTktcnQxMDE1LXJ0NTY4Mi5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9t
ZWRpYXRlay9tdDgxOTIvbXQ4MTkyLXJlZy5oDQoNCi0tIA0KMi4xOC4wDQo=

