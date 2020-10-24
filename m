Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F68297B19
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Oct 2020 08:43:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8270217F4;
	Sat, 24 Oct 2020 08:42:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8270217F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603521797;
	bh=eMseszq2LMKp8DF0+brP69RgUkalkJoCAr4vCF2JXvY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d35YSwb07g750GAb2tsi2KTN1qMvkmxCsZmGsQZo1xzyJtQttiZgZHqrCV4bTsCTa
	 cTHgq749jLnyyARhxWNfzKnRNaj4290ni1rpWLyReWyXbESansIT2nzfIT1tKZPdEk
	 2ckwrJEKnjiRfOOwMvMoa7P3DmUWkhYV0Q3Do5SQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC510F8049C;
	Sat, 24 Oct 2020 08:41:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4078F804AA; Sat, 24 Oct 2020 08:41:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id A011FF8049C
 for <alsa-devel@alsa-project.org>; Sat, 24 Oct 2020 08:41:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A011FF8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="DtJH2YXm"
X-UUID: 53eb1f177ffd4cdfb4dfbe9477512f33-20201024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=eMseszq2LMKp8DF0+brP69RgUkalkJoCAr4vCF2JXvY=; 
 b=DtJH2YXmsPm2gzH5NGJKRUoBbObKreRrOpkOTQ0oy21f94j1LEbyKEGLOFIQ7F58Ec2qF1/i5E0QZikU1EwOVOGWfWV3T6A271I1cd0gZNAdlFsytysbyCVN8IZQY3wAtapwG/8mxZZXMp4gVS7PhzjO9Vi+u/5/E9PXIYsvG1k=;
X-UUID: 53eb1f177ffd4cdfb4dfbe9477512f33-20201024
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 62636198; Sat, 24 Oct 2020 14:41:32 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 24 Oct 2020 14:41:29 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 24 Oct 2020 14:41:29 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <tiwai@suse.com>, <tzungbi@google.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: mt6359: skip first time data at the beginning of
 DMIC recording
Date: Sat, 24 Oct 2020 14:41:25 +0800
Message-ID: <1603521686-13036-2-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Content-Transfer-Encoding: base64
Cc: shane.chien@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>
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

V2UgY2FuIGNob29zZSB0byBkcm9wIGF3YXkgYW55IGxlbmd0aCBvZiBkYXRhIGZyb20gdGhlIGJl
Z2lubmluZyBhY2NvcmRpbmcNCnRvIHByb2plY3QgbmVlZHMuIFNvbWUgcHJvamVjdHMgZG9uJ3Qg
d2FudCB0byB0aHJvdyBhd2F5IGFueSBkYXRhLCBiZWNhdXNlDQp0aGV5IHdhbnQgdG8gdXNlIHJl
Y29yZGVkIGRhdGEgdG8gZG8gZWNobyBjYW5jZWxsYXRpb24sIHNvIHRoZXkgaGF2ZSB0bw0KbWFr
ZSBzdXJlIHRoYXQgdGhleSBhcmUgYWxpZ25lZCB3aXRoIHRoZSByZWZlcmVuY2UgZGF0YSBhcyBt
dWNoIGFzDQpwb3NzaWJsZS4gT3IgdGhlcmUgYXJlIG90aGVyIGFsZ29yaXRobXMgaW4gdGhlIHVw
cGVyIGxheWVyIHRvIGVsaW1pbmF0ZQ0KdGhpcyBub2lzZS4gT3Igc29tZSBwcm9qZWN0cyB3YW50
IHRvIGVsaW1pbmF0ZSB0aGlzIG5vaXNlIGZvcm0gdGhlIGtlcm5lbA0KbGF5ZXIuIEhvd2V2ZXIs
IHRoZSBtaW5pbXVtIHJlY29tbWVuZGVkIHZhbHVlIGlzIDUwbXMgdG8gc2tpcCBwb3Agbm9pc2Uu
DQoNClNpZ25lZC1vZmYtYnk6IEppYXhpbiBZdSA8amlheGluLnl1QG1lZGlhdGVrLmNvbT4NCi0t
LQ0KIHNvdW5kL3NvYy9jb2RlY3MvbXQ2MzU5LmMgfCAzOCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLQ0KIHNvdW5kL3NvYy9jb2RlY3MvbXQ2MzU5LmggfCAgMSArDQogMiBm
aWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0t
Z2l0IGEvc291bmQvc29jL2NvZGVjcy9tdDYzNTkuYyBiL3NvdW5kL3NvYy9jb2RlY3MvbXQ2MzU5
LmMNCmluZGV4IDgxYWFmYjU1M2JkZDkuLjlhNjg2NTZhOWY3MzEgMTAwNjQ0DQotLS0gYS9zb3Vu
ZC9zb2MvY29kZWNzL210NjM1OS5jDQorKysgYi9zb3VuZC9zb2MvY29kZWNzL210NjM1OS5jDQpA
QCAtMTI3Niw2ICsxMjc2LDI5IEBAIHN0YXRpYyBpbnQgbXRfbXRrYWlmX3R4X2V2ZW50KHN0cnVj
dCBzbmRfc29jX2RhcG1fd2lkZ2V0ICp3LA0KIAlyZXR1cm4gMDsNCiB9DQogDQorc3RhdGljIGlu
dCBtdF91bF9zcmNfZXZlbnQoc3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQgKncsDQorCQkJICAg
c3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsDQorCQkJICAgaW50IGV2ZW50KQ0KK3sNCisJ
c3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjbXBudCA9IHNuZF9zb2NfZGFwbV90b19jb21wb25l
bnQody0+ZGFwbSk7DQorCXN0cnVjdCBtdDYzNTlfcHJpdiAqcHJpdiA9IHNuZF9zb2NfY29tcG9u
ZW50X2dldF9kcnZkYXRhKGNtcG50KTsNCisJdW5zaWduZWQgaW50IHRpbWUgPSBwcml2LT51bF9k
ZWxheV9tczsNCisNCisJZGV2X2RiZyhwcml2LT5kZXYsICIlcygpLCBldmVudCA9IDB4JXhcbiIs
IF9fZnVuY19fLCBldmVudCk7DQorDQorCXN3aXRjaCAoZXZlbnQpIHsNCisJY2FzZSBTTkRfU09D
X0RBUE1fUE9TVF9QTVU6DQorCQkvKiBza2lwIGZpcnN0IHRpbWUgZGF0YSB0byBhdm9pZCByZWNv
cmRpbmcgcG9wIG5vaXNlICovDQorCQlpZiAodGltZSkNCisJCQl1c2xlZXBfcmFuZ2UoMTAwMCAq
IHRpbWUsIDEwMDAgKiAodGltZSArIDEpKTsNCisJCWJyZWFrOw0KKwlkZWZhdWx0Og0KKwkJYnJl
YWs7DQorCX0NCisNCisJcmV0dXJuIDA7DQorfQ0KKw0KIHN0YXRpYyBpbnQgbXRfdWxfc3JjX2Rt
aWNfZXZlbnQoc3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQgKncsDQogCQkJCXN0cnVjdCBzbmRf
a2NvbnRyb2wgKmtjb250cm9sLA0KIAkJCQlpbnQgZXZlbnQpDQpAQCAtMjA1MCw5ICsyMDczLDgg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0IG10NjM1OV9kYXBtX3dp
ZGdldHNbXSA9IHsNCiAJCQkgICAgICBTTkRfU09DX0RBUE1fUFJFX1BNVSB8IFNORF9TT0NfREFQ
TV9QT1NUX1BNRCksDQogDQogCVNORF9TT0NfREFQTV9TVVBQTFlfUygiVUxfU1JDIiwgU1VQUExZ
X1NFUV9VTF9TUkMsDQotCQkJICAgICAgTVQ2MzU5X0FGRV9VTF9TUkNfQ09OMF9MLA0KLQkJCSAg
ICAgIFVMX1NSQ19PTl9UTVBfQ1RMX1NGVCwgMCwNCi0JCQkgICAgICBOVUxMLCAwKSwNCisJCQkg
ICAgICBNVDYzNTlfQUZFX1VMX1NSQ19DT04wX0wsIFVMX1NSQ19PTl9UTVBfQ1RMX1NGVCwNCisJ
CQkgICAgICAwLCBtdF91bF9zcmNfZXZlbnQsIFNORF9TT0NfREFQTV9QT1NUX1BNVSksDQogDQog
CVNORF9TT0NfREFQTV9TVVBQTFlfUygiVUxfU1JDX0RNSUMiLCBTVVBQTFlfU0VRX1VMX1NSQ19E
TUlDLA0KIAkJCSAgICAgIFNORF9TT0NfTk9QTSwgMCwgMCwNCkBAIC0yMDYyLDcgKzIwODQsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQgbXQ2MzU5X2RhcG1fd2lk
Z2V0c1tdID0gew0KIAlTTkRfU09DX0RBUE1fU1VQUExZX1MoIlVMX1NSQ18zNCIsIFNVUFBMWV9T
RVFfVUxfU1JDLA0KIAkJCSAgICAgIE1UNjM1OV9BRkVfQUREQTZfVUxfU1JDX0NPTjBfTCwNCiAJ
CQkgICAgICBBRERBNl9VTF9TUkNfT05fVE1QX0NUTF9TRlQsIDAsDQotCQkJICAgICAgTlVMTCwg
MCksDQorCQkJICAgICAgbXRfdWxfc3JjX2V2ZW50LCBTTkRfU09DX0RBUE1fUE9TVF9QTVUpLA0K
IA0KIAlTTkRfU09DX0RBUE1fU1VQUExZX1MoIlVMX1NSQ18zNF9ETUlDIiwgU1VQUExZX1NFUV9V
TF9TUkNfRE1JQywNCiAJCQkgICAgICBTTkRfU09DX05PUE0sIDAsIDAsDQpAQCAtMjY3NCw2ICsy
Njk2LDE0IEBAIHN0YXRpYyBpbnQgbXQ2MzU5X3BhcnNlX2R0KHN0cnVjdCBtdDYzNTlfcHJpdiAq
cHJpdikNCiAJCXByaXYtPm11eF9zZWxlY3RbTVVYX01JQ19UWVBFXzJdID0gTUlDX1RZUEVfTVVY
X0lETEU7DQogCX0NCiANCisJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJtZWRpYXRl
ayx1bC1kZWxheS1tcyIsDQorCQkJCSAgICZwcml2LT51bF9kZWxheV9tcyk7DQorCWlmIChyZXQp
IHsNCisJCWRldl93YXJuKHByaXYtPmRldiwgIiVzKCkgZmFpbGVkIHRvIHJlYWQgdWwtZGVsYXkt
bXNcbiIsDQorCQkJIF9fZnVuY19fKTsNCisJCXByaXYtPnVsX2RlbGF5X21zID0gMDsNCisJfQ0K
Kw0KIAlyZXR1cm4gMDsNCiB9DQogDQpkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy9tdDYz
NTkuaCBiL3NvdW5kL3NvYy9jb2RlY3MvbXQ2MzU5LmgNCmluZGV4IDM3OTJlNTM0YTkxYjYuLmRl
NjZlNDliMTcwMTEgMTAwNjQ0DQotLS0gYS9zb3VuZC9zb2MvY29kZWNzL210NjM1OS5oDQorKysg
Yi9zb3VuZC9zb2MvY29kZWNzL210NjM1OS5oDQpAQCAtMjYyNSw2ICsyNjI1LDcgQEAgc3RydWN0
IG10NjM1OV9wcml2IHsNCiAJaW50IGFuYV9nYWluW0FVRElPX0FOQUxPR19WT0xVTUVfVFlQRV9N
QVhdOw0KIAl1bnNpZ25lZCBpbnQgbXV4X3NlbGVjdFtNVVhfTlVNXTsNCiAJdW5zaWduZWQgaW50
IGRtaWNfb25lX3dpcmVfbW9kZTsNCisJdW5zaWduZWQgaW50IHVsX2RlbGF5X21zOw0KIAlpbnQg
ZGV2X2NvdW50ZXJbREVWSUNFX05VTV07DQogCWludCBocF9nYWluX2N0bDsNCiAJaW50IGhwX2hp
ZmlfbW9kZTsNCi0tIA0KMi4xOC4wDQo=

