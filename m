Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C066A480FE
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 13:38:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B333C1730;
	Mon, 17 Jun 2019 13:37:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B333C1730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560771510;
	bh=JVGNOiSBTuPQf73wQliKmE31kbxiOXef2QNzEBBRh3w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L2GKI9UGa0F2BiS8/B2yJOSQbbpP4GtqVSptwaUfMKOyNhvuIsmR3dWI+2zvbZnpB
	 +9uaYCLToTaA1ovRBmOsXYTtHeCsbUMmPR1B+YzoqYXfF/32dVIxdmndyEyaeHB3NZ
	 bRQYIr0y+mdNhtMawCDE07Sj+LSKapDZWZjuM1mo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD406F89736;
	Mon, 17 Jun 2019 13:35:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1884F89729; Mon, 17 Jun 2019 13:35:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F2C4F896F9
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 13:35:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F2C4F896F9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 04:34:59 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by fmsmga006.fm.intel.com with ESMTP; 17 Jun 2019 04:34:56 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 17 Jun 2019 13:36:36 +0200
Message-Id: <20190617113644.25621-4-amadeuszx.slawinski@linux.intel.com>
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
Subject: [alsa-devel] [PATCH v2 03/11] ASoC: compress: Fix memory leak from
	snd_soc_new_compress
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

Q2hhbmdlIGt6YWxsb2MgdG8gZGV2bV9remFsbG9jLCBzbyBjb21wciBnZXRzIGF1dG9tYXRpY2Fs
bHkgZnJlZWQgd2hlbgppdCdzIG5vIGxvbmdlciBuZWVkZWQuCgpTaWduZWQtb2ZmLWJ5OiBBbWFk
ZXVzeiBTxYJhd2nFhHNraSA8YW1hZGV1c3p4LnNsYXdpbnNraUBsaW51eC5pbnRlbC5jb20+Ci0t
LQogc291bmQvc29jL3NvYy1jb21wcmVzcy5jIHwgMTcgKysrKysrLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3NvdW5kL3NvYy9zb2MtY29tcHJlc3MuYyBiL3NvdW5kL3NvYy9zb2MtY29tcHJlc3MuYwppbmRl
eCAwM2Q1YjljY2QzZmMuLmRkZWY0ZmY2NzdjZSAxMDA2NDQKLS0tIGEvc291bmQvc29jL3NvYy1j
b21wcmVzcy5jCisrKyBiL3NvdW5kL3NvYy9zb2MtY29tcHJlc3MuYwpAQCAtODk2LDE2ICs4OTYs
MTQgQEAgaW50IHNuZF9zb2NfbmV3X2NvbXByZXNzKHN0cnVjdCBzbmRfc29jX3BjbV9ydW50aW1l
ICpydGQsIGludCBudW0pCiAJZWxzZQogCQlkaXJlY3Rpb24gPSBTTkRfQ09NUFJFU1NfQ0FQVFVS
RTsKIAotCWNvbXByID0ga3phbGxvYyhzaXplb2YoKmNvbXByKSwgR0ZQX0tFUk5FTCk7CisJY29t
cHIgPSBkZXZtX2t6YWxsb2MocnRkLT5jYXJkLT5kZXYsIHNpemVvZigqY29tcHIpLCBHRlBfS0VS
TkVMKTsKIAlpZiAoIWNvbXByKQogCQlyZXR1cm4gLUVOT01FTTsKIAogCWNvbXByLT5vcHMgPSBk
ZXZtX2t6YWxsb2MocnRkLT5jYXJkLT5kZXYsIHNpemVvZihzb2NfY29tcHJfb3BzKSwKIAkJCQkg
IEdGUF9LRVJORUwpOwotCWlmICghY29tcHItPm9wcykgewotCQlyZXQgPSAtRU5PTUVNOwotCQln
b3RvIGNvbXByX2VycjsKLQl9CisJaWYgKCFjb21wci0+b3BzKQorCQlyZXR1cm4gLUVOT01FTTsK
IAogCWlmIChydGQtPmRhaV9saW5rLT5keW5hbWljKSB7CiAJCXNucHJpbnRmKG5ld19uYW1lLCBz
aXplb2YobmV3X25hbWUpLCAiKCVzKSIsCkBAIC05MTgsNyArOTE2LDcgQEAgaW50IHNuZF9zb2Nf
bmV3X2NvbXByZXNzKHN0cnVjdCBzbmRfc29jX3BjbV9ydW50aW1lICpydGQsIGludCBudW0pCiAJ
CQlkZXZfZXJyKHJ0ZC0+Y2FyZC0+ZGV2LAogCQkJCSJDb21wcmVzcyBBU29DOiBjYW4ndCBjcmVh
dGUgY29tcHJlc3NlZCBmb3IgJXM6ICVkXG4iLAogCQkJCXJ0ZC0+ZGFpX2xpbmstPm5hbWUsIHJl
dCk7Ci0JCQlnb3RvIGNvbXByX2VycjsKKwkJCXJldHVybiByZXQ7CiAJCX0KIAogCQlydGQtPnBj
bSA9IGJlX3BjbTsKQEAgLTk1NCw3ICs5NTIsNyBAQCBpbnQgc25kX3NvY19uZXdfY29tcHJlc3Mo
c3RydWN0IHNuZF9zb2NfcGNtX3J1bnRpbWUgKnJ0ZCwgaW50IG51bSkKIAkJZGV2X2Vycihjb21w
b25lbnQtPmRldiwKIAkJCSJDb21wcmVzcyBBU29DOiBjYW4ndCBjcmVhdGUgY29tcHJlc3MgZm9y
IGNvZGVjICVzOiAlZFxuIiwKIAkJCWNvbXBvbmVudC0+bmFtZSwgcmV0KTsKLQkJZ290byBjb21w
cl9lcnI7CisJCXJldHVybiByZXQ7CiAJfQogCiAJLyogREFQTSBkYWkgbGluayBzdHJlYW0gd29y
ayAqLwpAQCAtOTY1LDEwICs5NjMsNyBAQCBpbnQgc25kX3NvY19uZXdfY29tcHJlc3Moc3RydWN0
IHNuZF9zb2NfcGNtX3J1bnRpbWUgKnJ0ZCwgaW50IG51bSkKIAogCWRldl9pbmZvKHJ0ZC0+Y2Fy
ZC0+ZGV2LCAiQ29tcHJlc3MgQVNvQzogJXMgPC0+ICVzIG1hcHBpbmcgb2tcbiIsCiAJCSBjb2Rl
Y19kYWktPm5hbWUsIGNwdV9kYWktPm5hbWUpOwotCXJldHVybiByZXQ7CiAKLWNvbXByX2VycjoK
LQlrZnJlZShjb21wcik7Ci0JcmV0dXJuIHJldDsKKwlyZXR1cm4gMDsKIH0KIEVYUE9SVF9TWU1C
T0xfR1BMKHNuZF9zb2NfbmV3X2NvbXByZXNzKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QK
QWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
