Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1707344BB9
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 21:08:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B16321848;
	Thu, 13 Jun 2019 21:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B16321848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560452888;
	bh=hgXKCnHLriopDM/O9WQxEPmfbRKM5O+yWaxI4+KgspU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I715gGCMXK2uyAxHR/QUd6i0DSlKyzdk+88fG7YlqKX0pt+Uw9fhOzGZtTfFgSXNE
	 IcfNBC3Uh5KKpOO5LHV84CPrmrNIBvHrNAYjUjYSFBcXIQW/DsYB0Dm8iMneIHyRCv
	 j4hJMUtEEzLCYtdm3Rbs7bTmAaDk1i3WR15k3Mv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A3DFF89736;
	Thu, 13 Jun 2019 21:05:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C8D1F8972F; Thu, 13 Jun 2019 21:05:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E681EF89703
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 21:05:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E681EF89703
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 12:05:27 -0700
X-ExtLoop1: 1
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 13 Jun 2019 12:05:25 -0700
From: cezary.rojewski@intel.com
To: alsa-devel@alsa-project.org
Date: Thu, 13 Jun 2019 21:04:31 +0200
Message-Id: <20190613190436.20156-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190613190436.20156-1-cezary.rojewski@intel.com>
References: <20190613190436.20156-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, broonie@kernel.org,
 =?UTF-8?q?Pawe=C5=82=20Har=C5=82ozi=C5=84ski?= <pawel.harlozinski@intel.com>
Subject: [alsa-devel] [PATCH 2/7] ASoC: Intel: Skylake: Use recommended
	SDxFMT programming sequence
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

RnJvbTogUGF3ZcWCIEhhcsWCb3ppxYRza2kgPHBhd2VsLmhhcmxvemluc2tpQGludGVsLmNvbT4K
CkZvciBCWFQgcGxhdGZvcm1zLCB0aGUgcmVjb21tZW5kZWQgc2VxdWVuY2UgdG8gcHJvZ3JhbSB0
aGUgU0R4Rk1UIGlzIHRvCmZpcnN0IGNvdXBsZSB0aGUgc3RyZWFtLCB3cml0ZSB0aGUgZm9ybWF0
IGFuZCBkZWNvdXBsZSBhZ2Fpbi4KRm9yIGFsbCBvdGhlciBwbGF0Zm9ybXMgc2FpZCBzZXF1ZW5j
ZSByZW1haW5zIHVuY2hhbmdlZC4KClRvIHByZXZlbnQgY29kZSBkdXBsaWNhdGlvbiwgSVNfQlhU
IChhbmQgY29uc2VxdWVudGx5IElTX0NGTCkgbWFjcm8gaXMKcmVsb2NhdGVkIHRvIGhkYV9jb2Rl
Yy5oIGZpbGUgc28gaXQgY2FuIGJlIGFjY2Vzc2VkIGJ5IFNLTCBkcml2ZXIuCgpTaWduZWQtb2Zm
LWJ5OiBQYXdlxYIgSGFyxYJvemnFhHNraSA8cGF3ZWwuaGFybG96aW5za2lAaW50ZWwuY29tPgpT
aWduZWQtb2ZmLWJ5OiBDZXphcnkgUm9qZXdza2kgPGNlemFyeS5yb2pld3NraUBpbnRlbC5jb20+
Ci0tLQogaW5jbHVkZS9zb3VuZC9oZGFfY29kZWMuaCAgICAgICAgIHwgIDMgKysrCiBzb3VuZC9w
Y2kvaGRhL2hkYV9pbnRlbC5jICAgICAgICAgfCAgMyAtLS0KIHNvdW5kL3NvYy9pbnRlbC9za3ls
YWtlL3NrbC1wY20uYyB8IDE0ICsrKysrKysrKysrKystCiAzIGZpbGVzIGNoYW5nZWQsIDE2IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zb3VuZC9o
ZGFfY29kZWMuaCBiL2luY2x1ZGUvc291bmQvaGRhX2NvZGVjLmgKaW5kZXggY2M3YzhkNDJkNGZk
Li5hZDQ2YTA4MmIwMGYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvc291bmQvaGRhX2NvZGVjLmgKKysr
IGIvaW5jbHVkZS9zb3VuZC9oZGFfY29kZWMuaApAQCAtMzEsNiArMzEsOSBAQAogI2luY2x1ZGUg
PHNvdW5kL2hkYV92ZXJicy5oPgogI2luY2x1ZGUgPHNvdW5kL2hkYV9yZWdtYXAuaD4KIAorI2Rl
ZmluZSBJU19CWFQocGNpKSAoKHBjaSktPnZlbmRvciA9PSAweDgwODYgJiYgKHBjaSktPmRldmlj
ZSA9PSAweDVhOTgpCisjZGVmaW5lIElTX0NGTChwY2kpICgocGNpKS0+dmVuZG9yID09IDB4ODA4
NiAmJiAocGNpKS0+ZGV2aWNlID09IDB4YTM0OCkKKwogLyoKICAqIFN0cnVjdHVyZXMKICAqLwpk
aWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYyBiL3NvdW5kL3BjaS9oZGEvaGRh
X2ludGVsLmMKaW5kZXggMDc0MWVhZTIzZjEwLi4wNzE0NGJjYzcwNTkgMTAwNjQ0Ci0tLSBhL3Nv
dW5kL3BjaS9oZGEvaGRhX2ludGVsLmMKKysrIGIvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwuYwpA
QCAtMzczLDkgKzM3Myw2IEBAIGVudW0gewogCQkJCQkoKHBjaSktPmRldmljZSA9PSAweDBkMGMp
IHx8IFwKIAkJCQkJKChwY2kpLT5kZXZpY2UgPT0gMHgxNjBjKSkKIAotI2RlZmluZSBJU19CWFQo
cGNpKSAoKHBjaSktPnZlbmRvciA9PSAweDgwODYgJiYgKHBjaSktPmRldmljZSA9PSAweDVhOTgp
Ci0jZGVmaW5lIElTX0NGTChwY2kpICgocGNpKS0+dmVuZG9yID09IDB4ODA4NiAmJiAocGNpKS0+
ZGV2aWNlID09IDB4YTM0OCkKLQogc3RhdGljIGNoYXIgKmRyaXZlcl9zaG9ydF9uYW1lc1tdID0g
ewogCVtBWlhfRFJJVkVSX0lDSF0gPSAiSERBIEludGVsIiwKIAlbQVpYX0RSSVZFUl9QQ0hdID0g
IkhEQSBJbnRlbCBQQ0giLApkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2ts
LXBjbS5jIGIvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXBjbS5jCmluZGV4IGVkYzVlY2Zj
MGI1NS4uY2QyNTQ4MjM4MTNhIDEwMDY0NAotLS0gYS9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9z
a2wtcGNtLmMKKysrIGIvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXBjbS5jCkBAIC0xNDEs
NiArMTQxLDcgQEAgc3RhdGljIHZvaWQgc2tsX3NldF9zdXNwZW5kX2FjdGl2ZShzdHJ1Y3Qgc25k
X3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKIGludCBza2xfcGNtX2hvc3RfZG1hX3ByZXBhcmUo
c3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qgc2tsX3BpcGVfcGFyYW1zICpwYXJhbXMpCiB7CiAJ
c3RydWN0IGhkYWNfYnVzICpidXMgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKKwlzdHJ1Y3Qgc2ts
ICpza2wgPSBidXNfdG9fc2tsKGJ1cyk7CiAJdW5zaWduZWQgaW50IGZvcm1hdF92YWw7CiAJc3Ry
dWN0IGhkYWNfc3RyZWFtICpoc3RyZWFtOwogCXN0cnVjdCBoZGFjX2V4dF9zdHJlYW0gKnN0cmVh
bTsKQEAgLTE2NSw3ICsxNjYsMTggQEAgaW50IHNrbF9wY21faG9zdF9kbWFfcHJlcGFyZShzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBza2xfcGlwZV9wYXJhbXMgKnBhcmFtcykKIAlpZiAoZXJy
IDwgMCkKIAkJcmV0dXJuIGVycjsKIAotCWVyciA9IHNuZF9oZGFjX3N0cmVhbV9zZXR1cChoZGFj
X3N0cmVhbShzdHJlYW0pKTsKKwkvKgorCSAqIFRoZSByZWNvbW1lbmRlZCBTRHhGTVQgcHJvZ3Jh
bW1pbmcgc2VxdWVuY2UgZm9yIEJYVAorCSAqIHBsYXRmb3JtcyBpcyB0byBjb3VwbGUgdGhlIHN0
cmVhbSBiZWZvcmUgd3JpdGluZyB0aGUgZm9ybWF0CisJICovCisJaWYgKElTX0JYVChza2wtPnBj
aSkpIHsKKwkJc25kX2hkYWNfZXh0X3N0cmVhbV9kZWNvdXBsZShidXMsIHN0cmVhbSwgZmFsc2Up
OworCQllcnIgPSBzbmRfaGRhY19zdHJlYW1fc2V0dXAoaGRhY19zdHJlYW0oc3RyZWFtKSk7CisJ
CXNuZF9oZGFjX2V4dF9zdHJlYW1fZGVjb3VwbGUoYnVzLCBzdHJlYW0sIHRydWUpOworCX0gZWxz
ZSB7CisJCWVyciA9IHNuZF9oZGFjX3N0cmVhbV9zZXR1cChoZGFjX3N0cmVhbShzdHJlYW0pKTsK
Kwl9CisKIAlpZiAoZXJyIDwgMCkKIAkJcmV0dXJuIGVycjsKIAotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxp
bmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2Et
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
