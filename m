Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E550224011C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 05:09:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9501A166B;
	Mon, 10 Aug 2020 05:08:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9501A166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597028976;
	bh=n5K4ha85DkZyz2NR99rNXSJw2MdSeUvrAikKRNypFvs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F84MlCVkZPZCbSKVxj7OLRycDJyt3l7OeICefivWR17vsxL6wMJLNDc3ESXVMjUrj
	 fXD5hwqpepBrnMcC8eh2g9cBBUFEIifIq9llyeHvp+dnQlDl1xbjLpVku58xz76P2r
	 Qma5L7o3jL53EHmemtFRVapEinG0Oj4Xn0sz0A6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38C44F80252;
	Mon, 10 Aug 2020 05:07:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17A42F80252; Mon, 10 Aug 2020 05:07:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 17AEBF800BC
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 05:07:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17AEBF800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="D5ndVrMO"
X-UUID: 96ffc5b94c4b4961b0c8d46cd09dd008-20200810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=n5K4ha85DkZyz2NR99rNXSJw2MdSeUvrAikKRNypFvs=; 
 b=D5ndVrMOxpEPRJwKxgh5O7/NBrLyZ8to7+BMcfLCOfceNKo/TovZ7lH7GX0m5aM6RGdmZqiWjur5W/d6lyDiwvK2R2VcjixtQnf5zawsQRT4wAn6/sx5AeaMCyJsmOv0+jRpbKJcuR4W6pP8mRtDXjkQ2Fk3p22JnX7XSAcSO6M=;
X-UUID: 96ffc5b94c4b4961b0c8d46cd09dd008-20200810
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1856708292; Mon, 10 Aug 2020 11:06:53 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 11:06:51 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Aug 2020 11:06:49 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <tiwai@suse.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] dt-bindings: mediatek: mt6359: add codec document
Date: Mon, 10 Aug 2020 11:05:54 +0800
Message-ID: <1597028754-7732-3-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597028754-7732-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1597028754-7732-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Content-Transfer-Encoding: base64
Cc: alsa-devel@alsa-project.org, shane.chien@mediatek.com,
 howie.huang@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 tzungbi@google.com, linux-mediatek@lists.infradead.org, eason.yen@mediatek.com,
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

VGhpcyBwYXRjaCBhZGRzIE1lZGlhVGVrIE1UNjM1OSBjb2RlYyBkb2N1bWVudC4NCg0KU2lnbmVk
LW9mZi1ieTogSmlheGluIFl1IDxqaWF4aW4ueXVAbWVkaWF0ZWsuY29tPg0KLS0tDQogLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ2MzU5LnlhbWwgICAgICAgICAgfCA2OCArKysrKysr
KysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKykNCiBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210
NjM1OS55YW1sDQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc291bmQvbXQ2MzU5LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c291bmQvbXQ2MzU5LnlhbWwNCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwLi5j
ZDU5ZGJlDQotLS0gL2Rldi9udWxsDQorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvc291bmQvbXQ2MzU5LnlhbWwNCkBAIC0wLDAgKzEsNjggQEANCisjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCislWUFNTCAxLjIN
CistLS0NCiskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3NvdW5kL210NjM1OS55
YW1sIw0KKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55
YW1sIw0KKw0KK3RpdGxlOiBNZWRpYXRlayBNVDYzNTkgQ29kZWMgRGV2aWNlIFRyZWUgQmluZGlu
Z3MNCisNCittYWludGFpbmVyczoNCisgIC0gRWFzb24gWWVuIDxlYXNvbi55ZW5AbWVkaWF0ZWsu
Y29tPg0KKyAgLSBKaWF4aW4gWXUgPGppYXhpbi55dUBtZWRpYXRlay5jb20+DQorICAtIFNoYW5l
IENoaWVuIDxzaGFuZS5jaGllbkBtZWRpYXRlay5jb20+DQorDQorZGVzY3JpcHRpb246IHwNCisg
IFRoZSBjb21tdW5pY2F0aW9uIGJldHdlZW4gTVQ2MzU5IGFuZCBTb0MgaXMgdGhyb3VnaCBNZWRp
YXRlayBQTUlDIHdyYXBwZXIuDQorICBGb3IgbW9yZSBkZXRhaWwsIHBsZWFzZSB2aXNpdCBNZWRp
YXRlayBQTUlDIHdyYXBwZXIgZG9jdW1lbnRhdGlvbi4NCisgIE11c3QgYmUgYSBjaGlsZCBub2Rl
IG9mIFBNSUMgd3JhcHBlci4NCisNCitwcm9wZXJ0aWVzOg0KKyAgY29tcGF0aWJsZToNCisgICAg
Y29uc3Q6IG1lZGlhdGVrLG10NjM1OS1zb3VuZA0KKw0KKyAgbWVkaWF0ZWssZG1pYy1tb2RlOg0K
KyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCisgICAg
ZGVzY3JpcHRpb246IHwNCisgICAgICBJbmRpY2F0ZXMgaG93IG1hbnkgZGF0YSBwaW5zIGFyZSB1
c2VkIHRvIHRyYW5zbWl0IHR3byBjaGFubmVscyBvZiBQRE0NCisgICAgICBzaWduYWwuIDAgbWVh
bnMgdHdvIHdpcmVzLCAxIG1lYW5zIG9uZSB3aXJlLiBEZWZhdWx0IHZhbHVlIGlzIDAuDQorICAg
IGVudW06DQorICAgICAgLSAwICMgb25lIHdpcmUNCisgICAgICAtIDEgIyB0d28gd2lyZXMNCisN
CisgIG1lZGlhdGVrLG1pYy10eXBlLTA6DQorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3VpbnQzMg0KKyAgICBkZXNjcmlwdGlvbjogfA0KKyAgICAgIFNwZWNpZmll
cyB0aGUgdHlwZSBvZiBtaWMgdHlwZSBjb25uZWN0ZWQgdG8gYWRjMA0KKw0KKyAgICBlbnVtOg0K
KyAgICAgIC0gMCAjIElETEUgLSBtaWMgaW4gdHVybi1vZmYgc3RhdHVzDQorICAgICAgLSAxICMg
QUNDIC0gYW5hbG9nIG1pYyB3aXRoIGFsdGVybmF0aW5nIGNvdXBsaW5nDQorICAgICAgLSAyICMg
RE1JQyAtIGRpZ2l0YWwgbWljDQorICAgICAgLSAzICMgRENDIC0gYW5hbG9nIG1pYyB3aXRoIGRp
cmVjdCBjb3VwaW5nDQorICAgICAgLSA0ICMgRENDX0VDTV9ESUZGIC0gYW5hbG9nIGVsZWN0cmV0
IGNvbmRlbnNlciBtaWMgd2l0aCBkaWZmZXJlbnRpYWwgbW9kZQ0KKyAgICAgIC0gNSAjIERDQ19F
Q01fU0lOR0xFIC0gYW5hbG9nIGVsZWN0cmV0IGNvbmRlbnNlciBtaWMgd2l0aCBzaW5nbGUgbW9k
ZQ0KKw0KKyAgbWVkaWF0ZWssbWljLXR5cGUtMToNCisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMu
eWFtbCMvZGVmaW5pdGlvbnMvdWludDMyDQorICAgIGRlc2NyaXB0aW9uOiB8DQorICAgICAgU3Bl
Y2lmaWVzIHRoZSB0eXBlIG9mIG1pYyB0eXBlIGNvbm5lY3RlZCB0byBhZGMxDQorDQorICBtZWRp
YXRlayxtaWMtdHlwZS0yOg0KKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0
aW9ucy91aW50MzINCisgICAgZGVzY3JpcHRpb246IHwNCisgICAgICBTcGVjaWZpZXMgdGhlIHR5
cGUgb2YgbWljIHR5cGUgY29ubmVjdGVkIHRvIGFkYzINCisNCityZXF1aXJlZDoNCisgIC0gY29t
cGF0aWJsZQ0KKw0KK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KKw0KK2V4YW1wbGVzOg0K
KyAgLSB8DQorICAgIG10NjM1OWNvZGVjOiBtdDYzNTljb2RlYyB7DQorICAgICAgY29tcGF0aWJs
ZSA9ICJtZWRpYXRlayxtdDYzNTktc291bmQiOw0KKyAgICAgIG1lZGlhdGVrLGRtaWMtbW9kZSA9
IDwwPjsNCisgICAgICBtZWRpYXRlayxtaWMtdHlwZS0wID0gPDI+Ow0KKyAgICB9Ow0KKw0KKy4u
Lg0KLS0gDQoxLjguMS4xLmRpcnR5DQo=

