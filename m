Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC3424011B
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 05:08:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D6A974C;
	Mon, 10 Aug 2020 05:07:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D6A974C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597028929;
	bh=Z4K8Bg/d3lhf7ivZYNBcutHvTqaH5vB2AWGS7QPOWDs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nBwDMmcVoGwSBGV3EAHGhKZM2Rk7CdfwcOOQVKRfia+c8h00ZXci27rVq8ZoViXXz
	 f9bz/Q/Nrp1B9LNG/yyMe62r4BstOyJ2t8ODqk4Z31F5DmEN9EMxhDsPfOm26sZyK6
	 6kZHJc5E5imNt3SIQALONWOhCJv1ss91mc0Qirq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B4B3F80247;
	Mon, 10 Aug 2020 05:07:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C07AF8022D; Mon, 10 Aug 2020 05:07:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id 95950F800CE
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 05:06:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95950F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="Oo4P5+db"
X-UUID: 37a15448a78a4f3f8b24bba867dd4d8e-20200810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Z4K8Bg/d3lhf7ivZYNBcutHvTqaH5vB2AWGS7QPOWDs=; 
 b=Oo4P5+db221PlU9fSRJrW4XhdqVoOi6Nu9wGFkP1l3aHHo0WxWIKGfiAvP+O/5MUa0a3R4/GpJYBZDdSwQJBMoyd2Ubc0h/n5RokrjF7S9/psipx7Ov97rxXX7B4vDyE77w3XacVdbF32s538STmI8zI6jWMQH/oy7+EKQ1N4S4=;
X-UUID: 37a15448a78a4f3f8b24bba867dd4d8e-20200810
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1057242102; Mon, 10 Aug 2020 11:06:50 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Aug 2020 11:06:48 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 10 Aug 2020 11:06:47 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <tiwai@suse.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] Add mediatek codec mt6359 driver
Date: Mon, 10 Aug 2020 11:05:52 +0800
Message-ID: <1597028754-7732-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
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

QWRkIG1lZGlhdGVrIGNvZGVjIChNVDYzNTkpIGRyaXZlcg0KDQpNVDYzNTkgc3VwcG9ydCBwbGF5
YmFjayBhbmQgY2FwdHVyZSBmZWF0dXJlLg0KDQpPbiBkb3dubGluayBwYXRoLCBpdCBpbmNsdWRl
cyB0aHJlZSBEQUNzIGZvciBoYW5kc2V0LCBoZWFkc2V0LA0KYW5kIGxpbmVvdXQgcGF0aC4gT24g
dW5saW5rIHBhdGgsIGl0IGluY2x1ZGVkcyB0aHJlZSBBRENzIGZvcg0KbWFpbiBtaWMsIHNlY29u
ZCBtaWMsIDNyZCBtaWMsIGFuZCBoZWFkc2V0IG1pYy4NCg0KQnkgc2NlbmFyaW8sIHNlbGVjdCAq
X01VWCB3aWRnZXQgdG8gY3JlYXRlIGRhbXAgcGF0aC4NCkFuZCBieSBzZWxlY3QgbWljX3R5cGVf
bXV4IHRvIGNob29zZSBETUlDL0FNSUMvLi4uLg0KDQpGb3IgZXhhbXBsZSwgc2VsZWN0IHRoZXNl
IE1VWCB3aWRnZXQgdG8gY3JlYXRlIGhlYWRzZXQgcGF0aA0KKDEpIERBQyBJbiBNdXggLS0+ICJO
b3JtYWwgUGF0aCINCigyKSBIUEwgTXV4IC0tPiAiQXVkaW8gUGxheWJhY2siDQooMykgSFBSIE11
eCAtLT4gIkF1ZGlvIFBsYXliYWNrIg0KDQp2MiBjaGFuZ2VzOg0KCTEuIE1vdmUgcGxheWJhY2tf
Z3Bpby9jYXB0dXJlX2dwaW8gdG8gdGhlIG1hY2hpbmUgZHJpdmVyLg0KCTIuIEZpeCBtaWNfdHlw
ZShBQ0MvRE1JQy9EQ0MvRENDXyopIGF0IGluaXQgc3RhZ2UuDQoJMy4gTW92ZSBkZXZtX3JlZ3Vs
b3JfZ2V0IHRvIG10NjM1OV9wbGF0Zm9ybV9kcml2ZXJfcHJvYmUuDQoJNC4gQWRkIHJlbHVsYXRv
cl9kaXNhYmxlIGluIHJlbW92ZSBmdW5jdGlvbi4NCgk1LiBVc2Ugc3RlcmVvIGNvbnRyb2xzIHRv
IHRoZSB2b2x1bWUgY29udHJvbC4NCgk2LiBVc2UgU09DX0VOVU1fU0lOR0xFX0RFQ0wgaW5zdGVh
ZCBvZiBTT0NfVkFMVUVfRU5VTV9TSU5HTEVfREVDTC4NCgk3LiBDbGVhbnVwIHVudXNlZCBjb2Rl
Lg0KDQp2MSBjaGFuZ2VzOg0KCTEubGttbCBsaW5rOg0KCQlodHRwczovL2xrbWwub3JnL2xrbWwv
MjAyMC8zLzUvMTI1Nw0KDQpKaWF4aW4gWXUgKDIpOg0KICBBU29DOiBtZWRpYXRlazogbXQ2MzU5
OiBhZGQgY29kZWMgZHJpdmVyDQogIGR0LWJpbmRpbmdzOiBtZWRpYXRlazogbXQ2MzU5OiBhZGQg
Y29kZWMgZG9jdW1lbnQNCg0KIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210NjM1OS55
YW1sICAgICAgICAgIHwgICA2OCArDQogc291bmQvc29jL2NvZGVjcy9LY29uZmlnICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgICA4ICsNCiBzb3VuZC9zb2MvY29kZWNzL01ha2VmaWxlICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDIgKw0KIHNvdW5kL3NvYy9jb2RlY3MvbXQ2MzU5
LmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjk2NiArKysrKysrKysrKysrKysrKysrKw0K
IHNvdW5kL3NvYy9jb2RlY3MvbXQ2MzU5LmggICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjY1
MyArKysrKysrKysrKysrKysrKw0KIDUgZmlsZXMgY2hhbmdlZCwgNTY5NyBpbnNlcnRpb25zKCsp
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
b3VuZC9tdDYzNTkueWFtbA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBzb3VuZC9zb2MvY29kZWNzL210
NjM1OS5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9jb2RlY3MvbXQ2MzU5LmgNCg0K
LS0gDQoxLjguMS4xLmRpcnR5DQo=

