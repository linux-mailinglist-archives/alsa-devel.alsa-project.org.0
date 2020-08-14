Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7467244844
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Aug 2020 12:48:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BCF4166F;
	Fri, 14 Aug 2020 12:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BCF4166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597402134;
	bh=Vg2nMxZsYjEcovPtsX9BS/W+I/gd/3mpy5v2d1HpBk8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fX51VHWWIl+QuM7T5ZYW7+ZJY3lUiiZW2DRNl2FHpxUVeAUm+lSOd8+vC3vabywbG
	 dFr3/9Eip+IjTmOFrK+zWo+eKTJ9GRR0wWXAHREpY3zdPIdauyvEn1BTM0TKcwfxtO
	 AP/q9XVwP52pXW2meTin8I4mYlZL37AejKOq7bQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5D2BF8022B;
	Fri, 14 Aug 2020 12:47:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 421CEF8022D; Fri, 14 Aug 2020 12:47:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id C8113F800D3
 for <alsa-devel@alsa-project.org>; Fri, 14 Aug 2020 12:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8113F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="IH6vlJtA"
X-UUID: 265164d8aad943f0ba1dae3513a646c9-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Vg2nMxZsYjEcovPtsX9BS/W+I/gd/3mpy5v2d1HpBk8=; 
 b=IH6vlJtANCNfHanVLG1x/WJLGXR1205kDGmxerhPno8Nb9PvNjGojqtyTRTGS9ACtg+xQ37HMJ+VjoWzAQSj6Ykxork4z+wHSzI+izXsC4ptm0mYvl2dhDO7ujf4PhyvbENV2Poz9jHjjyset5Uo3CGsNjR4GP2YGsREm91Pc4g=;
X-UUID: 265164d8aad943f0ba1dae3513a646c9-20200814
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 971439689; Fri, 14 Aug 2020 18:46:55 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 18:46:52 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 18:46:51 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <tiwai@suse.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/2] Add mediatek codec mt6359 driver
Date: Fri, 14 Aug 2020 18:45:52 +0800
Message-ID: <1597401954-28388-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Content-Transfer-Encoding: base64
Cc: alsa-devel@alsa-project.org, shane.chien@mediatek.com,
 howie.huang@mediatek.com, bicycle.tasi@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 eason.yen@mediatek.com, linux-arm-kernel@lists.infradead.org
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

QWRkIG1lZGlhdGVrIGNvZGVjIChNVDYzNTkpIGRyaXZlcg0KDQpNVDYzNTkgc3VwcG9ydCBwbGF5
YmFjayBhbmQgY2FwdHVyZSBmZWF0dXJlLg0KDQpPbiBkb3dubGluayBwYXRoLCBpdCBpbmNsdWRl
cyB0aHJlZSBEQUNzIGZvciBoYW5kc2V0LCBoZWFkc2V0LA0KYW5kIGxpbmVvdXQgcGF0aC4gT24g
dW5saW5rIHBhdGgsIGl0IGluY2x1ZGVkcyB0aHJlZSBBRENzIGZvcg0KbWFpbiBtaWMsIHNlY29u
ZCBtaWMsIDNyZCBtaWMsIGFuZCBoZWFkc2V0IG1pYy4NCg0KQnkgc2NlbmFyaW8sIHNlbGVjdCAq
X01VWCB3aWRnZXQgdG8gY3JlYXRlIGRhbXAgcGF0aC4NCkFuZCBieSBzZWxlY3QgbWljX3R5cGVf
bXV4IHRvIGNob29zZSBETUlDL0FNSUMvLi4uLg0KDQpGb3IgZXhhbXBsZSwgc2VsZWN0IHRoZXNl
IE1VWCB3aWRnZXQgdG8gY3JlYXRlIGhlYWRzZXQgcGF0aA0KKDEpIERBQyBJbiBNdXggLS0+ICJO
b3JtYWwgUGF0aCINCigyKSBIUEwgTXV4IC0tPiAiQXVkaW8gUGxheWJhY2siDQooMykgSFBSIE11
eCAtLT4gIkF1ZGlvIFBsYXliYWNrIg0KDQp2MyBjaGFuZ2VzOg0KCTEuIFJlbW92ZSBjYWxpYnJh
dGlvbiByZWxhdGVkIGZ1bmN0aW9ucy4NCgkyLiBDb25iaW5lZCAnSFBMIE11eCcgYW5kICdIUFIg
TXV4JyB0byAnSFAgTXV4Jy4NCgkzLiBNb3ZlIHRoZSByZWd1bGF0b3JfZW5hYmxlIG9mICd2YXVk
MTgnIHRvIHRoZSBjb21wb25lbnQgcHJvYmUuDQoJNC4gRml4IHNvbWUgaW5jb3JyZWN0IGNvZGlu
ZyBzdHlsZS4NCg0KdjIgY2hhbmdlczoNCgkxLiBwYXRjaHdvcmsgbGluazoNCgkJaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMTcwNjkzNS8NCgkJaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wYXRjaC8xMTcwODg2NS8NCgkJaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wYXRjaC8xMTcwNjkzNy8NCg0KdjEgY2hhbmdlczoNCgkxLmxrbWwgbGluazoNCgkJaHR0cHM6
Ly9sa21sLm9yZy9sa21sLzIwMjAvMy81LzEyNTcNCg0KSmlheGluIFl1ICgyKToNCiAgV0lQOiBB
U29DOiBtZWRpYXRlazogbXQ2MzU5OiBhZGQgY29kZWMgZHJpdmVyDQogIFdJUDogZHQtYmluZGlu
Z3M6IG1lZGlhdGVrOiBtdDYzNTk6IGFkZCBjb2RlYyBkb2N1bWVudA0KDQogLi4uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc291bmQvbXQ2MzU5LnlhbWwgICAgIHwgICA2OCArDQogc291bmQvc29jL2Nv
ZGVjcy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgICAgOCArDQogc291bmQvc29jL2Nv
ZGVjcy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgIHwgICAgMiArDQogc291bmQvc29jL2Nv
ZGVjcy9tdDYzNTkuYyAgICAgICAgICAgICAgICAgICAgIHwgMjczNyArKysrKysrKysrKysrKysr
Kw0KIHNvdW5kL3NvYy9jb2RlY3MvbXQ2MzU5LmggICAgICAgICAgICAgICAgICAgICB8IDI2NDAg
KysrKysrKysrKysrKysrKw0KIDUgZmlsZXMgY2hhbmdlZCwgNTQ1NSBpbnNlcnRpb25zKCspDQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3Vu
ZC9tdDYzNTkueWFtbA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2MvY29kZWNzL210NjM1
OS5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9jb2RlY3MvbXQ2MzU5LmgNCg0KLS0g
DQoyLjE4LjANCg==

