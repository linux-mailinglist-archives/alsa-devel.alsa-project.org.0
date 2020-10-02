Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EC6280E2C
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 09:39:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A4E21EF7;
	Fri,  2 Oct 2020 09:38:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A4E21EF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601624371;
	bh=wdH/WxAD3SEI7Kxp1GuPMDDUjtp/ui+ATAd8/iFUvhA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jUjZ9EqSLzablQFn9jR+l1ENoAP8OpFGBj6eex93V871NigfBzg+nN1iwvyvtOUNw
	 vPQCmfpvRfWTnkiLeQDfiUijZG0yAWOSLBVbSkU+iOeTzkzLrUOQkHMYb+KPtgJ8CY
	 4Kf/3Yov1o9DDR2F8ST2Q8T8twCBq+QEYPoVkoKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C823F802E3;
	Fri,  2 Oct 2020 09:36:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6282CF80228; Fri,  2 Oct 2020 09:36:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id F3E44F80247
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 09:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3E44F80247
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="nLe3r4B9"
X-UUID: 2d8a6073144442288f538249c9ae863d-20201002
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wdH/WxAD3SEI7Kxp1GuPMDDUjtp/ui+ATAd8/iFUvhA=; 
 b=nLe3r4B9UsNj8pcvv5yw144Ej7C70ZWZaa0jgOzZfDhIRcVhxHX3qElTIa9DsCa0zJ5hBwtc1nmEE13l7NumEytAcV3x5BXj+hvag3xMsdt4UPwQwkznltTJavMxZstX7ktPztg9iRIatCzhRQMxQuN1uJM16sviIwGLye4/In4=;
X-UUID: 2d8a6073144442288f538249c9ae863d-20201002
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 18856343; Fri, 02 Oct 2020 15:35:50 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Oct 2020 15:35:48 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Oct 2020 15:35:46 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 5/5] dt-bindings: mediatek: mt8192: add
 mt8192-mt6358-rt1015-rt5682 document
Date: Fri, 2 Oct 2020 15:35:42 +0800
Message-ID: <1601624142-18991-6-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
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

VGhpcyBwYXRjaCBhZGRzIGRvY3VtZW50IGZvciB0aGUgbWFjaGluZSBib2FyZCB3aXRoIG10NjM1
OCwgcnQxMDE1IGFuZCBydDU2ODIuDQoNClNpZ25lZC1vZmYtYnk6IEppYXhpbiBZdSA8amlheGlu
Lnl1QG1lZGlhdGVrLmNvbT4NCi0tLQ0KIC4uLi9zb3VuZC9tdDgxOTItbXQ2MzU5LXJ0MTAxNS1y
dDU2ODIueWFtbCAgICB8IDQ0ICsrKysrKysrKysrKysrKysrKysNCiAxIGZpbGUgY2hhbmdlZCwg
NDQgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4MTkyLW10NjM1OS1ydDEwMTUtcnQ1NjgyLnlhbWwNCg0K
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgx
OTItbXQ2MzU5LXJ0MTAxNS1ydDU2ODIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zb3VuZC9tdDgxOTItbXQ2MzU5LXJ0MTAxNS1ydDU2ODIueWFtbA0KbmV3IGZpbGUg
bW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAwMDAwMDAuLmRmZjUwMDRjZDAzNjgNCi0tLSAvZGV2
L251bGwNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgx
OTItbXQ2MzU5LXJ0MTAxNS1ydDU2ODIueWFtbA0KQEAgLTAsMCArMSw0NCBAQA0KKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCislWUFNTCAxLjINCistLS0NCiskaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NvdW5kL210ODE5Mi1tdDYzNTktcnQxMDE1LXJ0NTY4
Mi55YW1sIw0KKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29y
ZS55YW1sIw0KKw0KK3RpdGxlOiBNZWRpYXRlayBNVDgxOTIgd2l0aCBNVDYzNTksIFJUMTAxNSBh
bmQgUlQ1NjgyIEFTb0Mgc291bmQgY2FyZCBkcml2ZXINCisNCittYWludGFpbmVyczoNCisgICAt
IEppYXhpbiBZdSA8amlheGluLnl1QG1lZGlhdGVrLmNvbT4NCisgICAtIFNoYW5lIENoaWVuIDxz
aGFuZS5jaGllbkBtZWRpYXRlay5jb20+DQorDQorZGVzY3JpcHRpb246DQorICBUaGlzIGJpbmRp
bmcgZGVzY3JpYmVzIHRoZSBNVDgxOTIgc291bmQgY2FyZC4NCisNCitwcm9wZXJ0aWVzOg0KKyAg
Y29tcGF0aWJsZToNCisgICAgY29udGFpbnM6DQorICAgICAgY29uc3Q6IG1lZGlhdGVrLG10ODE5
Ml9tdDYzNTlfcnQxMDE1X3J0NTY4Mg0KKw0KKyAgbWVkaWF0ZWsscGxhdGZvcm06DQorICAgICRy
ZWY6ICIvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlIg0KKyAgICBkZXNj
cmlwdGlvbjogfA0KKyAgICAgVGhlIERUL09GIG5vZGUgd2hpY2ggaXMgdXNlZCB0byBzcGVjaWZ5
IHRoZSBsaW5rJ3MgcGxhdGZvcm0gZHJpdmVyLg0KKw0KK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBm
YWxzZQ0KKw0KK3JlcXVpcmVkOg0KKyAgLSBjb21wYXRpYmxlDQorICAtIG1lZGlhdGVrLHBsYXRm
b3JtDQorDQorZXhhbXBsZXM6DQorICAtIHwNCisNCisgICAgc291bmQ6IG10ODE5Mi1zb3VuZCB7
DQorICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Mi1tdDYzNTktcnQxMDE1LXJ0
NTY4MiI7DQorICAgICAgICBtZWRpYXRlayxwbGF0Zm9ybSA9IDwmYWZlPjsNCisgICAgICAgIHBp
bmN0cmwtbmFtZXMgPSAiYXVkX2Nsa19tb3NpX29mZiIsDQorICAgICAgICAgICAgICAgICAgICAg
ICAgImF1ZF9jbGtfbW9zaV9vbiI7DQorICAgICAgICBwaW5jdHJsLTAgPSA8JmF1ZF9jbGtfbW9z
aV9vZmY+Ow0KKyAgICAgICAgcGluY3RybC0xID0gPCZhdWRfY2xrX21vc2lfb24+Ow0KKyAgICB9
Ow0KKw0KKy4uLg0KLS0gDQoyLjE4LjANCg==

