Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE20B2A3E4C
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 09:04:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72917180D;
	Tue,  3 Nov 2020 09:03:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72917180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604390654;
	bh=dQHGZ/X9kqMRlDO20+nTSs8HUl433ZbvQ99yB97Y2tY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=epVU5nLxaQYO4rvjJLb0jxyHbuCXtHBTpWLFkhKBv2c1Uh7nfCIVdEfAbmpk+keyl
	 NSGYF9/5HWlbKWqY4AeEZtEOcJq7n+ycqnPf6lglBbDGvcP5J0AGvVeoy5VkjytVNc
	 +YCL4UaqfXIkXEmsKYfWvwEq+lcQmJd6FnyAHTys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88D37F805C8;
	Tue,  3 Nov 2020 09:00:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 954A3F805A1; Tue,  3 Nov 2020 09:00:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id C9CC9F80108
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 08:59:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9CC9F80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="IrQ5tCiS"
X-UUID: 2f32ac8ac8e04e13b55f22ae83e46b37-20201103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dQHGZ/X9kqMRlDO20+nTSs8HUl433ZbvQ99yB97Y2tY=; 
 b=IrQ5tCiSZbIZRTqKMEOdQHeUD1nW1qzNCQs4cVF2+MI7pNoxfv3Ja5FCcuYW2za+UmRz84xHhBE+VnIiYUtAmurYMC8Eh0DvewKg181jfpzB2Fdf4aiWedJnp7+CQgrDRx1a+HDS+DyJcxLqYisjU7f2wIOGqzYUr2lvtW2ikig=;
X-UUID: 2f32ac8ac8e04e13b55f22ae83e46b37-20201103
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 599570648; Tue, 03 Nov 2020 15:59:52 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Nov 2020 15:59:51 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 3 Nov 2020 15:59:50 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 9/9] dt-bindings: mediatek: mt8192: add
 mt8192-mt6358-rt1015-rt5682 document
Date: Tue, 3 Nov 2020 15:59:38 +0800
Message-ID: <1604390378-23993-10-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1604390378-23993-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1604390378-23993-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
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

VGhpcyBwYXRjaCBhZGRzIGRvY3VtZW50IGZvciB0aGUgbWFjaGluZSBib2FyZCB3aXRoIG10NjM1
OCwgcnQxMDE1DQphbmQgcnQ1NjgyLg0KDQpTaWduZWQtb2ZmLWJ5OiBKaWF4aW4gWXUgPGppYXhp
bi55dUBtZWRpYXRlay5jb20+DQotLS0NCiAuLi4vc291bmQvbXQ4MTkyLW10NjM1OS1ydDEwMTUt
cnQ1NjgyLnlhbWwgICAgfCA0MiArKysrKysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQs
IDQyIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1tdDYzNTktcnQxMDE1LXJ0NTY4Mi55YW1sDQoN
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4
MTkyLW10NjM1OS1ydDEwMTUtcnQ1NjgyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvc291bmQvbXQ4MTkyLW10NjM1OS1ydDEwMTUtcnQ1NjgyLnlhbWwNCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAwLi4zNDIyMzJhNjFjZmI1DQotLS0gL2Rl
di9udWxsDQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4
MTkyLW10NjM1OS1ydDEwMTUtcnQ1NjgyLnlhbWwNCkBAIC0wLDAgKzEsNDIgQEANCisjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCislWUFN
TCAxLjINCistLS0NCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NvdW5kL210
ODE5Mi1tdDYzNTktcnQxMDE1LXJ0NTY4Mi55YW1sIw0KKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KKw0KK3RpdGxlOiBNZWRpYXRlayBNVDgx
OTIgd2l0aCBNVDYzNTksIFJUMTAxNSBhbmQgUlQ1NjgyIEFTb0Mgc291bmQgY2FyZCBkcml2ZXIN
CisNCittYWludGFpbmVyczoNCisgICAtIEppYXhpbiBZdSA8amlheGluLnl1QG1lZGlhdGVrLmNv
bT4NCisgICAtIFNoYW5lIENoaWVuIDxzaGFuZS5jaGllbkBtZWRpYXRlay5jb20+DQorDQorZGVz
Y3JpcHRpb246DQorICBUaGlzIGJpbmRpbmcgZGVzY3JpYmVzIHRoZSBNVDgxOTIgc291bmQgY2Fy
ZC4NCisNCitwcm9wZXJ0aWVzOg0KKyAgY29tcGF0aWJsZToNCisgICAgICBjb25zdDogbWVkaWF0
ZWssbXQ4MTkyX210NjM1OV9ydDEwMTVfcnQ1NjgyDQorDQorICBtZWRpYXRlayxwbGF0Zm9ybToN
CisgICAgJHJlZjogIi9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUiDQor
ICAgIGRlc2NyaXB0aW9uOiBUaGUgcGhhbmRsZSBvZiBNVDgxOTIgQVNvQyBwbGF0Zm9ybS4NCisN
CithZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCisNCityZXF1aXJlZDoNCisgIC0gY29tcGF0
aWJsZQ0KKyAgLSBtZWRpYXRlayxwbGF0Zm9ybQ0KKw0KK2V4YW1wbGVzOg0KKyAgLSB8DQorDQor
ICAgIHNvdW5kOiBtdDgxOTItc291bmQgew0KKyAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDgxOTItbXQ2MzU5LXJ0MTAxNS1ydDU2ODIiOw0KKyAgICAgICAgbWVkaWF0ZWsscGxhdGZv
cm0gPSA8JmFmZT47DQorICAgICAgICBwaW5jdHJsLW5hbWVzID0gImF1ZF9jbGtfbW9zaV9vZmYi
LA0KKyAgICAgICAgICAgICAgICAgICAgICAgICJhdWRfY2xrX21vc2lfb24iOw0KKyAgICAgICAg
cGluY3RybC0wID0gPCZhdWRfY2xrX21vc2lfb2ZmPjsNCisgICAgICAgIHBpbmN0cmwtMSA9IDwm
YXVkX2Nsa19tb3NpX29uPjsNCisgICAgfTsNCisNCisuLi4NCi0tIA0KMi4xOC4wDQo=

