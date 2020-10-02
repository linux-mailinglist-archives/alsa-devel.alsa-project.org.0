Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A3F280E28
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 09:38:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 873CF1ED7;
	Fri,  2 Oct 2020 09:37:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 873CF1ED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601624313;
	bh=tSTbcz+8NPRTtUx2y3/q+diK0LB8S9KMXCc3KL3u6wY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WFtyXxk+Is8jdFEHhXJuJijZ4P4CpA+gQIJ2t1ql/fJjaz6Qhk8JxIMWnEc5MADno
	 REBhu4P0fAaV5V3pbxosgDvztjjN3IhR/JloChtk4qMobCwRGhjV+Z3cb3G+P6cZB3
	 z0mbgMDEFAZ2njnrmMjF438PwL/YjVGC2FAk6r2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADFBAF802D2;
	Fri,  2 Oct 2020 09:36:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F294BF8028E; Fri,  2 Oct 2020 09:36:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 4538AF801A3
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 09:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4538AF801A3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="V/6XVGwO"
X-UUID: a4ed71c409b14cb1821b7baa45e785b2-20201002
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=tSTbcz+8NPRTtUx2y3/q+diK0LB8S9KMXCc3KL3u6wY=; 
 b=V/6XVGwOMOMiDDui3y45u4kxO3Wfpomx1AWP+1Lq+7WuZnIidswLUEUd9u5+NXAeaOxO6qSiJrF+iBQrBA0HMeUrFd8XJasDwfZuXel3zMNCemexcFqPj9Ayoe5gLDoKrDN+44qE/+iFLLPuCLe754yd+zyIJI2PoFVWRNNrJUI=;
X-UUID: a4ed71c409b14cb1821b7baa45e785b2-20201002
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1692999918; Fri, 02 Oct 2020 15:35:45 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Oct 2020 15:35:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Oct 2020 15:35:42 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 0/5] ASoC: Mediatek: Add support for MT8192 SoC
Date: Fri, 2 Oct 2020 15:35:37 +0800
Message-ID: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Content-Transfer-Encoding: base64
Cc: shane.chien@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 maowenan@huawei.com, kuninori.morimoto.gx@renesas.com
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
aCBpcyBiYXNlZCBvbiBicm9vbmllIHRyZWUgImZvci1uZXh0IiBicmFuY2guDQoNCkppYXhpbiBZ
dSAoNSk6DQogIEFTb0M6IG1lZGlhdGVrOiBtdDYzNTk6IGFkZCB0aGUgY2FsaWJyYXRpb24gZnVu
Y3Rpb25zDQogIEFTb0M6IG1lZGlhdGVrOiBtdDgxOTI6IGFkZCBwbGF0Zm9ybSBkcml2ZXINCiAg
ZHQtYmluZGluZ3M6IG1lZGlhdGVrOiBtdDgxOTI6IGFkZCBhdWRpbyBhZmUgZG9jdW1lbnQNCiAg
QVNvQzogbWVkaWF0ZWs6IG10ODE5MjogYWRkIG1hY2hpbmUgZHJpdmVyIHdpdGggbXQ2MzU5LCBy
dDEwMTUgYW5kDQogICAgcnQ1NjgyDQogIGR0LWJpbmRpbmdzOiBtZWRpYXRlazogbXQ4MTkyOiBh
ZGQgbXQ4MTkyLW10NjM1OC1ydDEwMTUtcnQ1NjgyDQogICAgZG9jdW1lbnQNCg0KIC4uLi9iaW5k
aW5ncy9zb3VuZC9tdDgxOTItYWZlLXBjbS55YW1sICAgICAgICB8ICAgOTggKw0KIC4uLi9zb3Vu
ZC9tdDgxOTItbXQ2MzU5LXJ0MTAxNS1ydDU2ODIueWFtbCAgICB8ICAgNDQgKw0KIHNvdW5kL3Nv
Yy9jb2RlY3MvbXQ2MzU5LmMgICAgICAgICAgICAgICAgICAgICB8ICAxMTAgKw0KIHNvdW5kL3Nv
Yy9jb2RlY3MvbXQ2MzU5LmggICAgICAgICAgICAgICAgICAgICB8ICAgIDcgKw0KIHNvdW5kL3Nv
Yy9tZWRpYXRlay9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8ICAgMjMgKw0KIHNvdW5kL3Nv
Yy9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICB8ICAgIDEgKw0KIHNvdW5kL3Nv
Yy9tZWRpYXRlay9jb21tb24vbXRrLWFmZS1mZS1kYWkuYyAgICB8ICAgMTMgKy0NCiBzb3VuZC9z
b2MvbWVkaWF0ZWsvY29tbW9uL210ay1iYXNlLWFmZS5oICAgICAgfCAgICAxICsNCiBzb3VuZC9z
b2MvbWVkaWF0ZWsvbXQ4MTkyL01ha2VmaWxlICAgICAgICAgICAgfCAgIDE2ICsNCiBzb3VuZC9z
b2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1hZmUtY2xrLmMgICAgfCAgNjY5ICsrKysNCiBzb3Vu
ZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1hZmUtY2xrLmggICAgfCAgMjQ0ICsrDQogc291
bmQvc29jL21lZGlhdGVrL210ODE5Mi9tdDgxOTItYWZlLWNvbW1vbi5oIHwgIDE3MCArDQogLi4u
L3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWFmZS1jb250cm9sLmMgIHwgIDE2MyArDQogc291
bmQvc29jL21lZGlhdGVrL210ODE5Mi9tdDgxOTItYWZlLWdwaW8uYyAgIHwgIDMwNiArKw0KIHNv
dW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWFmZS1ncGlvLmggICB8ICAgMTkgKw0KIHNv
dW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWFmZS1wY20uYyAgICB8IDIzODkgKysrKysr
KysrKysrKw0KIHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWRhaS1hZGRhLmMgICB8
IDE0ODkgKysrKysrKysNCiBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1kYWktaTJz
LmMgICAgfCAyMTM5ICsrKysrKysrKysrDQogc291bmQvc29jL21lZGlhdGVrL210ODE5Mi9tdDgx
OTItZGFpLXBjbS5jICAgIHwgIDQwOSArKysNCiBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210
ODE5Mi1kYWktdGRtLmMgICAgfCAgNzc4ICsrKysNCiAuLi4vbWVkaWF0ZWsvbXQ4MTkyL210ODE5
Mi1pbnRlcmNvbm5lY3Rpb24uaCAgfCAgIDY1ICsNCiAuLi4vbXQ4MTkyL210ODE5Mi1tdDYzNTkt
cnQxMDE1LXJ0NTY4Mi5jICAgICAgfCAxMDU4ICsrKysrKw0KIHNvdW5kL3NvYy9tZWRpYXRlay9t
dDgxOTIvbXQ4MTkyLXJlZy5oICAgICAgICB8IDMxMzEgKysrKysrKysrKysrKysrKysNCiAyMyBm
aWxlcyBjaGFuZ2VkLCAxMzMzOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4
MTkyLWFmZS1wY20ueWFtbA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLW10NjM1OS1ydDEwMTUtcnQ1NjgyLnlhbWwNCiBj
cmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL21lZGlhdGVrL210ODE5Mi9NYWtlZmlsZQ0KIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1hZmUtY2xr
LmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL21lZGlhdGVrL210ODE5Mi9tdDgxOTIt
YWZlLWNsay5oDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIv
bXQ4MTkyLWFmZS1jb21tb24uaA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2MvbWVkaWF0
ZWsvbXQ4MTkyL210ODE5Mi1hZmUtY29udHJvbC5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5k
L3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTkyLWFmZS1ncGlvLmMNCiBjcmVhdGUgbW9kZSAxMDA2
NDQgc291bmQvc29jL21lZGlhdGVrL210ODE5Mi9tdDgxOTItYWZlLWdwaW8uaA0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1hZmUtcGNtLmMNCiBj
cmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL21lZGlhdGVrL210ODE5Mi9tdDgxOTItZGFpLWFk
ZGEuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5
Mi1kYWktaTJzLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgc291bmQvc29jL21lZGlhdGVrL210ODE5
Mi9tdDgxOTItZGFpLXBjbS5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9tZWRpYXRl
ay9tdDgxOTIvbXQ4MTkyLWRhaS10ZG0uYw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2Mv
bWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1pbnRlcmNvbm5lY3Rpb24uaA0KIGNyZWF0ZSBtb2RlIDEw
MDY0NCBzb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1tdDYzNTktcnQxMDE1LXJ0NTY4
Mi5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9tZWRpYXRlay9tdDgxOTIvbXQ4MTky
LXJlZy5oDQoNCi0tIA0KMi4xOC4wDQo=

