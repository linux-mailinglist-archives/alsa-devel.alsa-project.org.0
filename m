Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E208829498C
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 10:56:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AD6B1741;
	Wed, 21 Oct 2020 10:55:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AD6B1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603270560;
	bh=FaSmmvd6vXti28k5Wg/iteLZ/fDKFZEVFrR628/Jxxw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VR75HZpHXKUVzQjiuZXp0wQeIImubfn8hyJSB3zJaunyixCYXb6QsVRwcEFxUg3wY
	 txVV+gznkk8KRPI2qS4CirTZRV4nwqcB2SF9iKEMGvIBzoxkasZQ9UIYm3ck72g8XH
	 /v4qC6VISvr8V43a5k+uXwgpdFdKIYhB+TimYC0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A02E8F8026F;
	Wed, 21 Oct 2020 10:54:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19148F80279; Wed, 21 Oct 2020 10:54:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id D2565F80253
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 10:54:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2565F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="TnzwL4dR"
X-UUID: 6a91c32a11ac49b99f9cc05386d0339a-20201021
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FaSmmvd6vXti28k5Wg/iteLZ/fDKFZEVFrR628/Jxxw=; 
 b=TnzwL4dRxKZ0JRWMbUxf5Dujxd2QhTfNcSu0W3ydLa5lFMthT7DI0Sew61Itf3mFfd00rx6dlomu7TAksTjWkMnG0BuhMIkx+scwocQ0DyeOF64oDMpgZO6bZSLzYODCBm5wFY/mSuI/wtsg881C4vBO/p0D9wS+IFnA9xnhQuM=;
X-UUID: 6a91c32a11ac49b99f9cc05386d0339a-20201021
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 343895785; Wed, 21 Oct 2020 16:54:04 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Oct 2020 16:54:02 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 21 Oct 2020 16:54:01 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>, <tzungbi@google.com>,
 <alsa-devel@alsa-project.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 5/5] dt-bindings: mediatek: mt8192: add
 mt8192-mt6358-rt1015-rt5682 document
Date: Wed, 21 Oct 2020 16:53:55 +0800
Message-ID: <1603270435-3548-6-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603270435-3548-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1603270435-3548-1-git-send-email-jiaxin.yu@mediatek.com>
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

VGhpcyBwYXRjaCBhZGRzIGRvY3VtZW50IGZvciB0aGUgbWFjaGluZSBib2FyZCB3aXRoIG10NjM1
OCwgcnQxMDE1DQphbmQgcnQ1NjgyLg0KDQpTaWduZWQtb2ZmLWJ5OiBKaWF4aW4gWXUgPGppYXhp
bi55dUBtZWRpYXRlay5jb20+DQotLS0NCiAuLi4vc291bmQvbXQ4MTkyLW10NjM1OS1ydDEwMTUt
cnQ1NjgyLnlhbWwgICAgfCA0MiArKysrKysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQs
IDQyIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1tdDYzNTktcnQxMDE1LXJ0NTY4Mi55YW1sDQoN
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4
MTkyLW10NjM1OS1ydDEwMTUtcnQ1NjgyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvc291bmQvbXQ4MTkyLW10NjM1OS1ydDEwMTUtcnQ1NjgyLnlhbWwNCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwMDAwLi40YzM5ZTg4OTA2ZmMxDQotLS0gL2Rl
di9udWxsDQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ4
MTkyLW10NjM1OS1ydDEwMTUtcnQ1NjgyLnlhbWwNCkBAIC0wLDAgKzEsNDIgQEANCisjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCsgT1IgQlNELTItQ2xhdXNlKQ0KKyVZQU1MIDEu
Mg0KKy0tLQ0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc291bmQvbXQ4MTky
LW10NjM1OS1ydDEwMTUtcnQ1NjgyLnlhbWwjDQorJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUu
b3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQorDQordGl0bGU6IE1lZGlhdGVrIE1UODE5MiB3
aXRoIE1UNjM1OSwgUlQxMDE1IGFuZCBSVDU2ODIgQVNvQyBzb3VuZCBjYXJkIGRyaXZlcg0KKw0K
K21haW50YWluZXJzOg0KKyAgIC0gSmlheGluIFl1IDxqaWF4aW4ueXVAbWVkaWF0ZWsuY29tPg0K
KyAgIC0gU2hhbmUgQ2hpZW4gPHNoYW5lLmNoaWVuQG1lZGlhdGVrLmNvbT4NCisNCitkZXNjcmlw
dGlvbjoNCisgIFRoaXMgYmluZGluZyBkZXNjcmliZXMgdGhlIE1UODE5MiBzb3VuZCBjYXJkLg0K
Kw0KK3Byb3BlcnRpZXM6DQorICBjb21wYXRpYmxlOg0KKyAgICAgIGNvbnN0OiBtZWRpYXRlayxt
dDgxOTJfbXQ2MzU5X3J0MTAxNV9ydDU2ODINCisNCisgIG1lZGlhdGVrLHBsYXRmb3JtOg0KKyAg
ICAkcmVmOiAiL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZSINCisgICAg
ZGVzY3JpcHRpb246IFRoZSBwaGFuZGxlIG9mIE1UODE5MiBBU29DIHBsYXRmb3JtLg0KKw0KK2Fk
ZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KKw0KK3JlcXVpcmVkOg0KKyAgLSBjb21wYXRpYmxl
DQorICAtIG1lZGlhdGVrLHBsYXRmb3JtDQorDQorZXhhbXBsZXM6DQorICAtIHwNCisNCisgICAg
c291bmQ6IG10ODE5Mi1zb3VuZCB7DQorICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10
ODE5Mi1tdDYzNTktcnQxMDE1LXJ0NTY4MiI7DQorICAgICAgICBtZWRpYXRlayxwbGF0Zm9ybSA9
IDwmYWZlPjsNCisgICAgICAgIHBpbmN0cmwtbmFtZXMgPSAiYXVkX2Nsa19tb3NpX29mZiIsDQor
ICAgICAgICAgICAgICAgICAgICAgICAgImF1ZF9jbGtfbW9zaV9vbiI7DQorICAgICAgICBwaW5j
dHJsLTAgPSA8JmF1ZF9jbGtfbW9zaV9vZmY+Ow0KKyAgICAgICAgcGluY3RybC0xID0gPCZhdWRf
Y2xrX21vc2lfb24+Ow0KKyAgICB9Ow0KKw0KKy4uLg0KLS0gDQoyLjE4LjANCg==

