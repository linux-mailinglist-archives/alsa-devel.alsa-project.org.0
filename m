Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C03757618A
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 11:10:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9FD51FE9;
	Fri, 26 Jul 2019 11:09:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9FD51FE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564132200;
	bh=Q08g2br9Do1VYJU/0pOnXJUgx07TpSSfwEsdX8+31ZE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TqmoSFNX/ojvLepfUZuMVLOCodfAmc82FUoYyI8UH1pWPxXx9qx9OU01utAEcAmtr
	 ajEGsCtbV4/RX37zJ8o15TNGA2vGoEJ+4BVriPF7w/oUJY3C7G8gSLeVl0P/VXQxX3
	 Hr1FNTwRDISyI9P0Jr43dDCGUMozDKpGwFzPeQlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1A72F803F3;
	Fri, 26 Jul 2019 11:07:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F438F803F3; Fri, 26 Jul 2019 11:07:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8A77F800E8
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 11:07:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8A77F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 02:07:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,310,1559545200"; d="scan'208";a="345772348"
Received: from xxx.igk.intel.com ([10.237.93.170])
 by orsmga005.jf.intel.com with ESMTP; 26 Jul 2019 02:07:22 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 26 Jul 2019 11:09:29 +0200
Message-Id: <20190726090929.27946-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726090929.27946-1-amadeuszx.slawinski@linux.intel.com>
References: <20190726090929.27946-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [alsa-devel] [PATCH v4 1/1] ASoC: Intel: Skylake: Remove static
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
c2tsLXRvcG9sb2d5LmMgfCAzNCArKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Nv
dW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9neS5jIGIvc291bmQvc29jL2ludGVsL3Nr
eWxha2Uvc2tsLXRvcG9sb2d5LmMKaW5kZXggMTE4ODY2Y2Q1MDc1Li5jMWMzN2NlNzU5YmQgMTAw
NjQ0Ci0tLSBhL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9neS5jCisrKyBiL3Nv
dW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9neS5jCkBAIC0zMzMzLDI1ICszMzMzLDYg
QEAgc3RhdGljIGludCBza2xfdHBsZ19nZXRfaW50X3RrbihzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJ
cmV0dXJuIHRrbl9jb3VudDsKIH0KIAotc3RhdGljIGludCBza2xfdHBsZ19nZXRfbWFuaWZlc3Rf
dXVpZChzdHJ1Y3QgZGV2aWNlICpkZXYsCi0JCQkJc3RydWN0IHNrbF9kZXYgKnNrbCwKLQkJCQlz
dHJ1Y3Qgc25kX3NvY190cGxnX3ZlbmRvcl91dWlkX2VsZW0gKnV1aWRfdGtuKQotewotCXN0YXRp
YyBpbnQgcmVmX2NvdW50OwotCXN0cnVjdCBza2xfbW9kdWxlICptb2Q7Ci0KLQlpZiAodXVpZF90
a24tPnRva2VuID09IFNLTF9US05fVVVJRCkgewotCQltb2QgPSBza2wtPm1vZHVsZXNbcmVmX2Nv
dW50XTsKLQkJZ3VpZF9jb3B5KCZtb2QtPnV1aWQsIChndWlkX3QgKikmdXVpZF90a24tPnV1aWQp
OwotCQlyZWZfY291bnQrKzsKLQl9IGVsc2UgewotCQlkZXZfZXJyKGRldiwgIk5vdCBhbiBVVUlE
IHRva2VuIHRrbiAlZFxuIiwgdXVpZF90a24tPnRva2VuKTsKLQkJcmV0dXJuIC1FSU5WQUw7Ci0J
fQotCi0JcmV0dXJuIDA7Ci19Ci0KIC8qCiAgKiBGaWxsIHRoZSBtYW5pZmVzdCBzdHJ1Y3R1cmUg
YnkgcGFyc2luZyB0aGUgdG9rZW5zIGJhc2VkIG9uIHRoZQogICogdHlwZS4KQEAgLTMzNjIsNiAr
MzM0Myw3IEBAIHN0YXRpYyBpbnQgc2tsX3RwbGdfZ2V0X21hbmlmZXN0X3RrbihzdHJ1Y3QgZGV2
aWNlICpkZXYsCiB7CiAJaW50IHRrbl9jb3VudCA9IDAsIHJldDsKIAlpbnQgb2ZmID0gMCwgdHVw
bGVfc2l6ZSA9IDA7CisJdTggdXVpZF9pbmRleCA9IDA7CiAJc3RydWN0IHNuZF9zb2NfdHBsZ192
ZW5kb3JfYXJyYXkgKmFycmF5OwogCXN0cnVjdCBzbmRfc29jX3RwbGdfdmVuZG9yX3ZhbHVlX2Vs
ZW0gKnRrbl9lbGVtOwogCkBAIC0zMzg0LDkgKzMzNjYsMTcgQEAgc3RhdGljIGludCBza2xfdHBs
Z19nZXRfbWFuaWZlc3RfdGtuKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJCWNvbnRpbnVlOwogCiAJ
CWNhc2UgU05EX1NPQ19UUExHX1RVUExFX1RZUEVfVVVJRDoKLQkJCXJldCA9IHNrbF90cGxnX2dl
dF9tYW5pZmVzdF91dWlkKGRldiwgc2tsLCBhcnJheS0+dXVpZCk7Ci0JCQlpZiAocmV0IDwgMCkK
LQkJCQlyZXR1cm4gcmV0OworCQkJaWYgKGFycmF5LT51dWlkLT50b2tlbiAhPSBTS0xfVEtOX1VV
SUQpIHsKKwkJCQlkZXZfZXJyKGRldiwgIk5vdCBhbiBVVUlEIHRva2VuOiAlZFxuIiwKKwkJCQkJ
YXJyYXktPnV1aWQtPnRva2VuKTsKKwkJCQlyZXR1cm4gLUVJTlZBTDsKKwkJCX0KKwkJCWlmICh1
dWlkX2luZGV4ID49IHNrbC0+bnJfbW9kdWxlcykgeworCQkJCWRldl9lcnIoZGV2LCAiVG9vIG1h
bnkgVVVJRCB0b2tlbnNcbiIpOworCQkJCXJldHVybiAtRUlOVkFMOworCQkJfQorCQkJZ3VpZF9j
b3B5KCZza2wtPm1vZHVsZXNbdXVpZF9pbmRleCsrXS0+dXVpZCwKKwkJCQkgIChndWlkX3QgKikm
YXJyYXktPnV1aWQtPnV1aWQpOwogCiAJCQl0dXBsZV9zaXplICs9IHNpemVvZigqYXJyYXktPnV1
aWQpOwogCQkJY29udGludWU7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxA
YWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
