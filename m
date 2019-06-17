Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D468248105
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 13:40:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E4821736;
	Mon, 17 Jun 2019 13:39:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E4821736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560771606;
	bh=HdZaZKn/c5kS07fDcmq0aoL6StFqjCQV4nwTk5dcMpk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SF63TDeBt7ThAaxN3XdAU5ZZe8RG4bSRk2Om/I1Z2QEuUB55zz7YQ/4OOENfHRtFs
	 O/X4HWoKe4oSBUSIdkhit3odkJsIVxdyKf5DH0hXlZcj9aaW/1Yp+auGEje6rusbaS
	 8l58AeQKU0WgrEYQpFNq1Uroqxpi6E3ZlJUG8mFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB85CF8973B;
	Mon, 17 Jun 2019 13:35:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86D68F89734; Mon, 17 Jun 2019 13:35:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 708F9F8972F
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 13:35:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 708F9F8972F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 04:35:04 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by fmsmga006.fm.intel.com with ESMTP; 17 Jun 2019 04:35:01 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 17 Jun 2019 13:36:38 +0200
Message-Id: <20190617113644.25621-6-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617113644.25621-1-amadeuszx.slawinski@linux.intel.com>
References: <20190617113644.25621-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 05/11] ASoC: Intel: Skylake: Remove static
	table index when parsing topology
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

Q3VycmVudGx5IHdoZW4gd2UgcmVtb3ZlIGFuZCByZWxvYWQgZHJpdmVyIHdlIHVzZSBwcmV2aW91
cyByZWZfY291bnQKdmFsdWUgdG8gc3RhcnQgaXRlcmF0aW5nIG92ZXIgc2tsLT5tb2R1bGVzIHdo
aWNoIGxlYWRzIHRvIG91dCBvZiB0YWJsZQphY2Nlc3MuIFRvIGZpeCB0aGlzIGp1c3QgaW5saW5l
IHRoZSBmdW5jdGlvbiBhbmQgY2FsY3VsYXRlIGluZGV4ZXMKZXZlcnl0aW1lIHdlIHBhcnNlIFVV
SUQgdG9rZW4uCgpTaWduZWQtb2ZmLWJ5OiBBbWFkZXVzeiBTxYJhd2nFhHNraSA8YW1hZGV1c3p4
LnNsYXdpbnNraUBsaW51eC5pbnRlbC5jb20+Ci0tLQogc291bmQvc29jL2ludGVsL3NreWxha2Uv
c2tsLXRvcG9sb2d5LmMgfCAzNSArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Nv
dW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9neS5jIGIvc291bmQvc29jL2ludGVsL3Nr
eWxha2Uvc2tsLXRvcG9sb2d5LmMKaW5kZXggYzY5ZDk5OWQ3YmYxLi40NGYzYjI5YTcyMTAgMTAw
NjQ0Ci0tLSBhL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9neS5jCisrKyBiL3Nv
dW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9neS5jCkBAIC0zNDc3LDI1ICszNDc3LDYg
QEAgc3RhdGljIGludCBza2xfdHBsZ19nZXRfaW50X3RrbihzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJ
cmV0dXJuIHRrbl9jb3VudDsKIH0KIAotc3RhdGljIGludCBza2xfdHBsZ19nZXRfbWFuaWZlc3Rf
dXVpZChzdHJ1Y3QgZGV2aWNlICpkZXYsCi0JCQkJc3RydWN0IHNrbCAqc2tsLAotCQkJCXN0cnVj
dCBzbmRfc29jX3RwbGdfdmVuZG9yX3V1aWRfZWxlbSAqdXVpZF90a24pCi17Ci0Jc3RhdGljIGlu
dCByZWZfY291bnQ7Ci0Jc3RydWN0IHNrbF9tb2R1bGUgKm1vZDsKLQotCWlmICh1dWlkX3Rrbi0+
dG9rZW4gPT0gU0tMX1RLTl9VVUlEKSB7Ci0JCW1vZCA9IHNrbC0+bW9kdWxlc1tyZWZfY291bnRd
OwotCQltZW1jcHkoJm1vZC0+dXVpZCwgJnV1aWRfdGtuLT51dWlkLCBzaXplb2YodXVpZF90a24t
PnV1aWQpKTsKLQkJcmVmX2NvdW50Kys7Ci0JfSBlbHNlIHsKLQkJZGV2X2VycihkZXYsICJOb3Qg
YW4gVVVJRCB0b2tlbiB0a24gJWRcbiIsIHV1aWRfdGtuLT50b2tlbik7Ci0JCXJldHVybiAtRUlO
VkFMOwotCX0KLQotCXJldHVybiAwOwotfQotCiAvKgogICogRmlsbCB0aGUgbWFuaWZlc3Qgc3Ry
dWN0dXJlIGJ5IHBhcnNpbmcgdGhlIHRva2VucyBiYXNlZCBvbiB0aGUKICAqIHR5cGUuCkBAIC0z
NTA2LDYgKzM0ODcsNyBAQCBzdGF0aWMgaW50IHNrbF90cGxnX2dldF9tYW5pZmVzdF90a24oc3Ry
dWN0IGRldmljZSAqZGV2LAogewogCWludCB0a25fY291bnQgPSAwLCByZXQ7CiAJaW50IG9mZiA9
IDAsIHR1cGxlX3NpemUgPSAwOworCXU4IHV1aWRfaW5kZXggPSAwOwogCXN0cnVjdCBzbmRfc29j
X3RwbGdfdmVuZG9yX2FycmF5ICphcnJheTsKIAlzdHJ1Y3Qgc25kX3NvY190cGxnX3ZlbmRvcl92
YWx1ZV9lbGVtICp0a25fZWxlbTsKIApAQCAtMzUyOCw5ICszNTEwLDE4IEBAIHN0YXRpYyBpbnQg
c2tsX3RwbGdfZ2V0X21hbmlmZXN0X3RrbihzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJCQljb250aW51
ZTsKIAogCQljYXNlIFNORF9TT0NfVFBMR19UVVBMRV9UWVBFX1VVSUQ6Ci0JCQlyZXQgPSBza2xf
dHBsZ19nZXRfbWFuaWZlc3RfdXVpZChkZXYsIHNrbCwgYXJyYXktPnV1aWQpOwotCQkJaWYgKHJl
dCA8IDApCi0JCQkJcmV0dXJuIHJldDsKKwkJCWlmIChhcnJheS0+dXVpZC0+dG9rZW4gIT0gU0tM
X1RLTl9VVUlEKSB7CisJCQkJZGV2X2VycihkZXYsICJOb3QgYW4gVVVJRCB0b2tlbjogJWRcbiIs
CisJCQkJCWFycmF5LT51dWlkLT50b2tlbik7CisJCQkJcmV0dXJuIC1FSU5WQUw7CisJCQl9CisJ
CQlpZiAodXVpZF9pbmRleCA+PSBza2wtPm5yX21vZHVsZXMpIHsKKwkJCQlkZXZfZXJyKGRldiwg
IlRvbyBtYW55IFVVSUQgdG9rZW5zXG4iKTsKKwkJCQlyZXR1cm4gLUVJTlZBTDsKKwkJCX0KKwkJ
CW1lbWNweSgmc2tsLT5tb2R1bGVzW3V1aWRfaW5kZXgrK10tPnV1aWQsCisJCQkgICAgICAgJmFy
cmF5LT51dWlkLT51dWlkLAorCQkJICAgICAgIHNpemVvZihhcnJheS0+dXVpZC0+dXVpZCkpOwog
CiAJCQl0dXBsZV9zaXplICs9IHNpemVvZigqYXJyYXktPnV1aWQpOwogCQkJY29udGludWU7Ci0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRw
czovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
