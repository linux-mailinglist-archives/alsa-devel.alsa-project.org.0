Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB9B1E7B40
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 13:08:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E067417C4;
	Fri, 29 May 2020 13:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E067417C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590750508;
	bh=jZUffhDsS3iywjAJ/yJ5JfUnRTxh9XWi8vUqBMSK1xw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dA5BrH/0xztCzftepdqWp0DImvWC3ASi9UrFvEdhH8/IjvijWZTBjxddRxKWw6W68
	 wqmznBOHKyvdWBCsbgMmluGy0gJ1kfLkMvzzW0w2dqzPrvlPcB8lGbfVKRXU6iHnLi
	 8E8bHsAdAuC91ALZvcYv7HQSXaS3Xwlyvv7JBBf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A4F2F8016F;
	Fri, 29 May 2020 13:07:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3A8EF8021E; Fri, 29 May 2020 13:07:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_BASE64_TEXT,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by alsa1.perex.cz (Postfix) with ESMTP id E2BF8F80107
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 13:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2BF8F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="MAeKSDfG"
X-UUID: cf913136332d4bb09b331d247ef7b198-20200529
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=jZUffhDsS3iywjAJ/yJ5JfUnRTxh9XWi8vUqBMSK1xw=; 
 b=MAeKSDfGibfhzNGpPlWlhJ/kWsZ4/N80ioIeOhEGfnRn/faegoj3xhPuJufnwFq45IodCqZ+aF5bUNUbzM8rYaIWU0OjCsYFaNOpfs8fsCBPRhKtCJe/9TaHin9DIIrmv4bbFFCv/8ljt+sDmssUASCaQQOUMOXjv6XuBF8n3JU=;
X-UUID: cf913136332d4bb09b331d247ef7b198-20200529
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 844972419; Fri, 29 May 2020 19:06:46 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 May 2020 19:06:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 May 2020 19:06:43 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <matthias.bgg@gmail.com>, <hariprasad.kelam@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt6358: support DMIC one-wire mode
Date: Fri, 29 May 2020 19:04:53 +0800
Message-ID: <1590750293-12769-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 56AF50F10CD9D0433DF18F5F850C09F0DF00BA6224F5C412DE4A190D0C76F8BF2000:8
X-MTK: N
Content-Transfer-Encoding: base64
Cc: alsa-devel@alsa-project.org, howie.huang@mediatek.com,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 tzungbi@google.com, linux-mediatek@lists.infradead.org,
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

U3VwcG9ydHMgRE1JQyBvbmUtd2lyZSBtb2RlLiBBZGRzIGEgbWl4ZXIgY29udHJvbCB0byBlbmFi
bGUgYW5kIGRpc2FibGUuDQoNClNpZ25lZC1vZmYtYnk6IEppYXhpbiBZdSA8amlheGluLnl1QG1l
ZGlhdGVrLmNvbT4NClJldmlld2VkLWJ5OiBUenVuZy1CaSBTaGloIDx0enVuZ2JpQGdvb2dsZS5j
b20+DQotLS0NCiBzb3VuZC9zb2MvY29kZWNzL210NjM1OC5jIHwgMzMgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystDQogMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvbXQ2MzU4LmMgYi9z
b3VuZC9zb2MvY29kZWNzL210NjM1OC5jDQppbmRleCAxYjgzMGVhLi5jYTc2MjhkIDEwMDY0NA0K
LS0tIGEvc291bmQvc29jL2NvZGVjcy9tdDYzNTguYw0KKysrIGIvc291bmQvc29jL2NvZGVjcy9t
dDYzNTguYw0KQEAgLTk1LDYgKzk1LDggQEAgc3RydWN0IG10NjM1OF9wcml2IHsNCiAJc3RydWN0
IHJlZ3VsYXRvciAqYXZkZF9yZWc7DQogDQogCWludCB3b3ZfZW5hYmxlZDsNCisNCisJaW50IGRt
aWNfb25lX3dpcmVfbW9kZTsNCiB9Ow0KIA0KIGludCBtdDYzNThfc2V0X210a2FpZl9wcm90b2Nv
bChzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNtcG50LA0KQEAgLTU2Niw2ICs1NjgsMjggQEAg
c3RhdGljIGludCBtdDYzNThfcHV0X3dvdihzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwN
CiAJcmV0dXJuIDA7DQogfQ0KIA0KK3N0YXRpYyBpbnQgbXQ2MzU4X2RtaWNfb25lX3dpcmVfbW9k
ZV9nZXQoc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsDQorCQkJCQkgc3RydWN0IHNuZF9j
dGxfZWxlbV92YWx1ZSAqdWNvbnRyb2wpDQorew0KKwlzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQg
KmNtcG50ID0gc25kX3NvY19rY29udHJvbF9jb21wb25lbnQoa2NvbnRyb2wpOw0KKwlzdHJ1Y3Qg
bXQ2MzU4X3ByaXYgKnByaXYgPSBzbmRfc29jX2NvbXBvbmVudF9nZXRfZHJ2ZGF0YShjbXBudCk7
DQorDQorCXVjb250cm9sLT52YWx1ZS5pbnRlZ2VyLnZhbHVlWzBdID0gcHJpdi0+ZG1pY19vbmVf
d2lyZV9tb2RlOw0KKw0KKwlyZXR1cm4gMDsNCit9DQorDQorc3RhdGljIGludCBtdDYzNThfZG1p
Y19vbmVfd2lyZV9tb2RlX3NldChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwNCisJCQkJ
CSBzdHJ1Y3Qgc25kX2N0bF9lbGVtX3ZhbHVlICp1Y29udHJvbCkNCit7DQorCXN0cnVjdCBzbmRf
c29jX2NvbXBvbmVudCAqY21wbnQgPSBzbmRfc29jX2tjb250cm9sX2NvbXBvbmVudChrY29udHJv
bCk7DQorCXN0cnVjdCBtdDYzNThfcHJpdiAqcHJpdiA9IHNuZF9zb2NfY29tcG9uZW50X2dldF9k
cnZkYXRhKGNtcG50KTsNCisNCisJcHJpdi0+ZG1pY19vbmVfd2lyZV9tb2RlID0gdWNvbnRyb2wt
PnZhbHVlLmludGVnZXIudmFsdWVbMF07DQorDQorCXJldHVybiAwOw0KK30NCisNCiBzdGF0aWMg
Y29uc3QgREVDTEFSRV9UTFZfREJfU0NBTEUocGxheWJhY2tfdGx2LCAtMTAwMCwgMTAwLCAwKTsN
CiBzdGF0aWMgY29uc3QgREVDTEFSRV9UTFZfREJfU0NBTEUocGdhX3RsdiwgMCwgNjAwLCAwKTsN
CiANCkBAIC01ODgsNiArNjEyLDEwIEBAIHN0YXRpYyBpbnQgbXQ2MzU4X3B1dF93b3Yoc3RydWN0
IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsDQogDQogCVNPQ19TSU5HTEVfQk9PTF9FWFQoIldha2Ut
b24tVm9pY2UgUGhhc2UyIFN3aXRjaCIsIDAsDQogCQkJICAgIG10NjM1OF9nZXRfd292LCBtdDYz
NThfcHV0X3dvdiksDQorDQorCVNPQ19TSU5HTEVfQk9PTF9FWFQoIkRtaWMgT25lIFdpcmUgTW9k
ZSIsIDAsDQorCQkJICAgIG10NjM1OF9kbWljX29uZV93aXJlX21vZGVfZ2V0LA0KKwkJCSAgICBt
dDYzNThfZG1pY19vbmVfd2lyZV9tb2RlX3NldCksDQogfTsNCiANCiAvKiBNVVggKi8NCkBAIC0x
NzQwLDcgKzE3NjgsMTAgQEAgc3RhdGljIGludCBtdDYzNThfYW1pY19lbmFibGUoc3RydWN0IG10
NjM1OF9wcml2ICpwcml2KQ0KIAltdDYzNThfbXRrYWlmX3R4X2VuYWJsZShwcml2KTsNCiANCiAJ
LyogVUwgZG1pYyBzZXR0aW5nIG9mZiAqLw0KLQlyZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFwLCBN
VDYzNThfQUZFX1VMX1NSQ19DT04wX0gsIDB4MDAwMCk7DQorCWlmIChwcml2LT5kbWljX29uZV93
aXJlX21vZGUpDQorCQlyZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFwLCBNVDYzNThfQUZFX1VMX1NS
Q19DT04wX0gsIDB4MDQwMCk7DQorCWVsc2UNCisJCXJlZ21hcF93cml0ZShwcml2LT5yZWdtYXAs
IE1UNjM1OF9BRkVfVUxfU1JDX0NPTjBfSCwgMHgwMDgwKTsNCiANCiAJLyogVUwgdHVybiBvbiAq
Lw0KIAlyZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFwLCBNVDYzNThfQUZFX1VMX1NSQ19DT04wX0ws
IDB4MDAwMSk7DQotLSANCjEuOC4xLjEuZGlydHkNCg==

