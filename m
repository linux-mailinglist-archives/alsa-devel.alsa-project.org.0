Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3582244847
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Aug 2020 12:49:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 779ED1665;
	Fri, 14 Aug 2020 12:48:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 779ED1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597402183;
	bh=oOpRhM5PzYwgYcVgRxy4CLIfl7M/RAvNtdo4Alg3gMU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ci7SkiEScPLhwEur5Vv3khznbOtlIhXfJ+uNgaN37NIwD+zp1AcD2fHRhXKsx1Gex
	 uaYgEsBR7ZUNGx8QuIE9JYJaQKzCnAP7WcolHgj1HLwnZLci5RyDbDOpviQNbER4fA
	 8oI5u7R6dyR1HTJb6edLRuLLLh2Y67dPCZ07+xNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C971BF80252;
	Fri, 14 Aug 2020 12:47:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D641DF8022D; Fri, 14 Aug 2020 12:47:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 8D36DF80146
 for <alsa-devel@alsa-project.org>; Fri, 14 Aug 2020 12:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D36DF80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="M2EKLi9K"
X-UUID: 3917e57dd0194300bdfa1100d0f24e80-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oOpRhM5PzYwgYcVgRxy4CLIfl7M/RAvNtdo4Alg3gMU=; 
 b=M2EKLi9KxqyEJeyANc58glRv/kB59SWAZ6ewpXaK091+jXg87lfL+HLTLZP1ZORS+ai6eavQMuKu39Dn6ghy/jI9iBO57JdVKg6k6Qz4ZvU6J/GcRm75p1y4kk+eQStEBNjTduRX4FxN5/CNRV4qruD4/jDI27XhNmmo07libhY=;
X-UUID: 3917e57dd0194300bdfa1100d0f24e80-20200814
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 595928243; Fri, 14 Aug 2020 18:46:58 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 18:46:55 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 18:46:54 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <tiwai@suse.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/2] WIP: dt-bindings: mediatek: mt6359: add codec document
Date: Fri, 14 Aug 2020 18:45:54 +0800
Message-ID: <1597401954-28388-3-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597401954-28388-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1597401954-28388-1-git-send-email-jiaxin.yu@mediatek.com>
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

VGhpcyBwYXRjaCBhZGRzIE1lZGlhVGVrIE1UNjM1OSBjb2RlYyBkb2N1bWVudC4NCg0KU2lnbmVk
LW9mZi1ieTogSmlheGluIFl1IDxqaWF4aW4ueXVAbWVkaWF0ZWsuY29tPg0KLS0tDQogLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc291bmQvbXQ2MzU5LnlhbWwgICAgIHwgNjggKysrKysrKysrKysr
KysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCA2OCBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDYzNTkueWFt
bA0KDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5k
L210NjM1OS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210
NjM1OS55YW1sDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAwMC4uYTY2
OWI0OTk2NTg3NA0KLS0tIC9kZXYvbnVsbA0KKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NvdW5kL210NjM1OS55YW1sDQpAQCAtMCwwICsxLDY4IEBADQorIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KKyVZQU1MIDEuMg0KKy0tLQ0KKyRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvc291bmQvbXQ2MzU5LnlhbWwjDQorJHNjaGVtYTogaHR0
cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQorDQordGl0bGU6IE1l
ZGlhdGVrIE1UNjM1OSBDb2RlYyBEZXZpY2UgVHJlZSBCaW5kaW5ncw0KKw0KK21haW50YWluZXJz
Og0KKyAgLSBFYXNvbiBZZW4gPGVhc29uLnllbkBtZWRpYXRlay5jb20+DQorICAtIEppYXhpbiBZ
dSA8amlheGluLnl1QG1lZGlhdGVrLmNvbT4NCisgIC0gU2hhbmUgQ2hpZW4gPHNoYW5lLmNoaWVu
QG1lZGlhdGVrLmNvbT4NCisNCitkZXNjcmlwdGlvbjogfA0KKyAgVGhlIGNvbW11bmljYXRpb24g
YmV0d2VlbiBNVDYzNTkgYW5kIFNvQyBpcyB0aHJvdWdoIE1lZGlhdGVrIFBNSUMgd3JhcHBlci4N
CisgIEZvciBtb3JlIGRldGFpbCwgcGxlYXNlIHZpc2l0IE1lZGlhdGVrIFBNSUMgd3JhcHBlciBk
b2N1bWVudGF0aW9uLg0KKyAgTXVzdCBiZSBhIGNoaWxkIG5vZGUgb2YgUE1JQyB3cmFwcGVyLg0K
Kw0KK3Byb3BlcnRpZXM6DQorICBjb21wYXRpYmxlOg0KKyAgICBjb25zdDogbWVkaWF0ZWssbXQ2
MzU5LXNvdW5kDQorDQorICBtZWRpYXRlayxkbWljLW1vZGU6DQorICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KKyAgICBkZXNjcmlwdGlvbjogfA0KKyAg
ICAgIEluZGljYXRlcyBob3cgbWFueSBkYXRhIHBpbnMgYXJlIHVzZWQgdG8gdHJhbnNtaXQgdHdv
IGNoYW5uZWxzIG9mIFBETQ0KKyAgICAgIHNpZ25hbC4gMCBtZWFucyB0d28gd2lyZXMsIDEgbWVh
bnMgb25lIHdpcmUuIERlZmF1bHQgdmFsdWUgaXMgMC4NCisgICAgZW51bToNCisgICAgICAtIDAg
IyBvbmUgd2lyZQ0KKyAgICAgIC0gMSAjIHR3byB3aXJlcw0KKw0KKyAgbWVkaWF0ZWssbWljLXR5
cGUtMDoNCisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMy
DQorICAgIGRlc2NyaXB0aW9uOiB8DQorICAgICAgU3BlY2lmaWVzIHRoZSB0eXBlIG9mIG1pYyB0
eXBlIGNvbm5lY3RlZCB0byBhZGMwDQorDQorICAgIGVudW06DQorICAgICAgLSAwICMgSURMRSAt
IG1pYyBpbiB0dXJuLW9mZiBzdGF0dXMNCisgICAgICAtIDEgIyBBQ0MgLSBhbmFsb2cgbWljIHdp
dGggYWx0ZXJuYXRpbmcgY291cGxpbmcNCisgICAgICAtIDIgIyBETUlDIC0gZGlnaXRhbCBtaWMN
CisgICAgICAtIDMgIyBEQ0MgLSBhbmFsb2cgbWljIHdpdGggZGlyZWN0IGNvdXBpbmcNCisgICAg
ICAtIDQgIyBEQ0NfRUNNX0RJRkYgLSBhbmFsb2cgZWxlY3RyZXQgY29uZGVuc2VyIG1pYyB3aXRo
IGRpZmZlcmVudGlhbCBtb2RlDQorICAgICAgLSA1ICMgRENDX0VDTV9TSU5HTEUgLSBhbmFsb2cg
ZWxlY3RyZXQgY29uZGVuc2VyIG1pYyB3aXRoIHNpbmdsZSBtb2RlDQorDQorICBtZWRpYXRlayxt
aWMtdHlwZS0xOg0KKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91
aW50MzINCisgICAgZGVzY3JpcHRpb246IHwNCisgICAgICBTcGVjaWZpZXMgdGhlIHR5cGUgb2Yg
bWljIHR5cGUgY29ubmVjdGVkIHRvIGFkYzENCisNCisgIG1lZGlhdGVrLG1pYy10eXBlLTI6DQor
ICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMg0KKyAgICBk
ZXNjcmlwdGlvbjogfA0KKyAgICAgIFNwZWNpZmllcyB0aGUgdHlwZSBvZiBtaWMgdHlwZSBjb25u
ZWN0ZWQgdG8gYWRjMg0KKw0KK3JlcXVpcmVkOg0KKyAgLSBjb21wYXRpYmxlDQorDQorYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlDQorDQorZXhhbXBsZXM6DQorICAtIHwNCisgICAgbXQ2MzU5
Y29kZWM6IG10NjM1OWNvZGVjIHsNCisgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10NjM1
OS1zb3VuZCI7DQorICAgICAgbWVkaWF0ZWssZG1pYy1tb2RlID0gPDA+Ow0KKyAgICAgIG1lZGlh
dGVrLG1pYy10eXBlLTAgPSA8Mj47DQorICAgIH07DQorDQorLi4uDQotLSANCjIuMTguMA0K

