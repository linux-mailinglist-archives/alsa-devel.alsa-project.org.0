Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9723648111
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 13:42:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2783B171A;
	Mon, 17 Jun 2019 13:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2783B171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560771760;
	bh=zDfDNH3MbeMHQ3QWpH0rGy3ACoY1PyXITHHMhNSe2G4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nu8sliqHNBoufGJ9a0nhOoTHSjGfCEEksNNCv28wuGPKTxXrwIhfbI8h6RbqJGi51
	 JNXOvXe4A3hgNZbBLTxz1qBafm+7bL/u9w+f1u5V5pxNeWD7mpK9ivmbTqUofG63XU
	 UDb12pytpxYhSXUYI5ToophUwfmqQVeVkg9R2iqw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EE04F8975D;
	Mon, 17 Jun 2019 13:35:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 500D8F8975C; Mon, 17 Jun 2019 13:35:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 285A6F89751
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 13:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 285A6F89751
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 04:35:18 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by fmsmga006.fm.intel.com with ESMTP; 17 Jun 2019 04:35:15 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 17 Jun 2019 13:36:43 +0200
Message-Id: <20190617113644.25621-11-amadeuszx.slawinski@linux.intel.com>
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
Subject: [alsa-devel] [PATCH v2 10/11] ASoC: topology: Consolidate how
	dtexts and dvalues are freed
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

UHJvdmlkZSBoZWxwZXIgZnVuY3Rpb25zIGFuZCB1c2UgdGhlbSB0byBmcmVlIGR0ZXh0cyBhbmQg
ZHZhbHVlcyBpbgp0b3BvbG9neS4gVGhpcyBpcyBmb2xsb3d1cCBjbGVhbnVwIGFmdGVyIHJlbGF0
ZWQgY2hhbmdlcyBpbiB0aGlzIGFyZWEgYXMKc3VnZ2VzdGVkIGluOgpodHRwczovL21haWxtYW4u
YWxzYS1wcm9qZWN0Lm9yZy9waXBlcm1haWwvYWxzYS1kZXZlbC8yMDE5LUphbnVhcnkvMTQ0NzYx
Lmh0bWwKClNpZ25lZC1vZmYtYnk6IEFtYWRldXN6IFPFgmF3acWEc2tpIDxhbWFkZXVzenguc2xh
d2luc2tpQGxpbnV4LmludGVsLmNvbT4KLS0tCiBzb3VuZC9zb2Mvc29jLXRvcG9sb2d5LmMgfCA0
MSArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQv
c29jL3NvYy10b3BvbG9neS5jIGIvc291bmQvc29jL3NvYy10b3BvbG9neS5jCmluZGV4IGI1Mzg0
MTJlNGJjZi4uYTkyNmMyYWZiZTA1IDEwMDY0NAotLS0gYS9zb3VuZC9zb2Mvc29jLXRvcG9sb2d5
LmMKKysrIGIvc291bmQvc29jL3NvYy10b3BvbG9neS5jCkBAIC04Niw2ICs4Niw4IEBAIHNuZF9z
b2NfZGFwbV9uZXdfY29udHJvbF91bmxvY2tlZChzdHJ1Y3Qgc25kX3NvY19kYXBtX2NvbnRleHQg
KmRhcG0sCiBzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCAqCiBzbmRfc29jX2RhcG1fbmV3X2Nv
bnRyb2woc3RydWN0IHNuZF9zb2NfZGFwbV9jb250ZXh0ICpkYXBtLAogCQkJIGNvbnN0IHN0cnVj
dCBzbmRfc29jX2RhcG1fd2lkZ2V0ICp3aWRnZXQpOworc3RhdGljIHZvaWQgc29jX3RwbGdfZGVu
dW1fcmVtb3ZlX3RleHRzKHN0cnVjdCBzb2NfZW51bSAqc2UpOworc3RhdGljIHZvaWQgc29jX3Rw
bGdfZGVudW1fcmVtb3ZlX3ZhbHVlcyhzdHJ1Y3Qgc29jX2VudW0gKnNlKTsKIAogLyogY2hlY2sg
d2UgZG9udCBvdmVyZmxvdyB0aGUgZGF0YSBmb3IgdGhpcyBjb250cm9sIGNodW5rICovCiBzdGF0
aWMgaW50IHNvY190cGxnX2NoZWNrX2VsZW1fY291bnQoc3RydWN0IHNvY190cGxnICp0cGxnLCBz
aXplX3QgZWxlbV9zaXplLApAQCAtMzk4LDcgKzQwMCw2IEBAIHN0YXRpYyB2b2lkIHJlbW92ZV9l
bnVtKHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcCwKIHsKIAlzdHJ1Y3Qgc25kX2NhcmQg
KmNhcmQgPSBjb21wLT5jYXJkLT5zbmRfY2FyZDsKIAlzdHJ1Y3Qgc29jX2VudW0gKnNlID0gY29u
dGFpbmVyX29mKGRvYmosIHN0cnVjdCBzb2NfZW51bSwgZG9iaik7Ci0JaW50IGk7CiAKIAlpZiAo
cGFzcyAhPSBTT0NfVFBMR19QQVNTX01JWEVSKQogCQlyZXR1cm47CkBAIC00MDksMTAgKzQxMCw4
IEBAIHN0YXRpYyB2b2lkIHJlbW92ZV9lbnVtKHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29t
cCwKIAlzbmRfY3RsX3JlbW92ZShjYXJkLCBkb2JqLT5jb250cm9sLmtjb250cm9sKTsKIAlsaXN0
X2RlbCgmZG9iai0+bGlzdCk7CiAKLQlrZnJlZShkb2JqLT5jb250cm9sLmR2YWx1ZXMpOwotCWZv
ciAoaSA9IDA7IGkgPCBzZS0+aXRlbXM7IGkrKykKLQkJa2ZyZWUoZG9iai0+Y29udHJvbC5kdGV4
dHNbaV0pOwotCWtmcmVlKGRvYmotPmNvbnRyb2wuZHRleHRzKTsKKwlzb2NfdHBsZ19kZW51bV9y
ZW1vdmVfdmFsdWVzKHNlKTsKKwlzb2NfdHBsZ19kZW51bV9yZW1vdmVfdGV4dHMoc2UpOwogCWtm
cmVlKHNlKTsKIH0KIApAQCAtNDgwLDE1ICs0NzksMTIgQEAgc3RhdGljIHZvaWQgcmVtb3ZlX3dp
ZGdldChzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXAsCiAJCQlzdHJ1Y3Qgc25kX2tjb250
cm9sICprY29udHJvbCA9IHctPmtjb250cm9sc1tpXTsKIAkJCXN0cnVjdCBzb2NfZW51bSAqc2Ug
PQogCQkJCShzdHJ1Y3Qgc29jX2VudW0gKilrY29udHJvbC0+cHJpdmF0ZV92YWx1ZTsKLQkJCWlu
dCBqOwogCiAJCQlzbmRfY3RsX3JlbW92ZShjYXJkLCBrY29udHJvbCk7CiAKIAkJCS8qIGZyZWUg
ZW51bSBrY29udHJvbCdzIGR2YWx1ZXMgYW5kIGR0ZXh0cyAqLwotCQkJa2ZyZWUoc2UtPmRvYmou
Y29udHJvbC5kdmFsdWVzKTsKLQkJCWZvciAoaiA9IDA7IGogPCBzZS0+aXRlbXM7IGorKykKLQkJ
CQlrZnJlZShzZS0+ZG9iai5jb250cm9sLmR0ZXh0c1tqXSk7Ci0JCQlrZnJlZShzZS0+ZG9iai5j
b250cm9sLmR0ZXh0cyk7CisJCQlzb2NfdHBsZ19kZW51bV9yZW1vdmVfdmFsdWVzKHNlKTsKKwkJ
CXNvY190cGxnX2RlbnVtX3JlbW92ZV90ZXh0cyhzZSk7CiAKIAkJCWtmcmVlKHNlKTsKIAkJCWtm
cmVlKHctPmtjb250cm9sX25ld3NbaV0ubmFtZSk7CkBAIC05NTYsMTQgKzk1MiwyMyBAQCBzdGF0
aWMgaW50IHNvY190cGxnX2RlbnVtX2NyZWF0ZV90ZXh0cyhzdHJ1Y3Qgc29jX2VudW0gKnNlLAog
CQl9CiAJfQogCisJc2UtPml0ZW1zID0gbGUzMl90b19jcHUoZWMtPml0ZW1zKTsKIAlzZS0+dGV4
dHMgPSAoY29uc3QgY2hhciAqIGNvbnN0ICopc2UtPmRvYmouY29udHJvbC5kdGV4dHM7CiAJcmV0
dXJuIDA7CiAKIGVycjoKKwlzZS0+aXRlbXMgPSBpOworCXNvY190cGxnX2RlbnVtX3JlbW92ZV90
ZXh0cyhzZSk7CisJcmV0dXJuIHJldDsKK30KKworc3RhdGljIGlubGluZSB2b2lkIHNvY190cGxn
X2RlbnVtX3JlbW92ZV90ZXh0cyhzdHJ1Y3Qgc29jX2VudW0gKnNlKQoreworCWludCBpID0gc2Ut
Pml0ZW1zOworCiAJZm9yICgtLWk7IGkgPj0gMDsgaS0tKQogCQlrZnJlZShzZS0+ZG9iai5jb250
cm9sLmR0ZXh0c1tpXSk7CiAJa2ZyZWUoc2UtPmRvYmouY29udHJvbC5kdGV4dHMpOwotCXJldHVy
biByZXQ7CiB9CiAKIHN0YXRpYyBpbnQgc29jX3RwbGdfZGVudW1fY3JlYXRlX3ZhbHVlcyhzdHJ1
Y3Qgc29jX2VudW0gKnNlLApAQCAtOTg4LDYgKzk5MywxMSBAQCBzdGF0aWMgaW50IHNvY190cGxn
X2RlbnVtX2NyZWF0ZV92YWx1ZXMoc3RydWN0IHNvY19lbnVtICpzZSwKIAlyZXR1cm4gMDsKIH0K
IAorc3RhdGljIGlubGluZSB2b2lkIHNvY190cGxnX2RlbnVtX3JlbW92ZV92YWx1ZXMoc3RydWN0
IHNvY19lbnVtICpzZSkKK3sKKwlrZnJlZShzZS0+ZG9iai5jb250cm9sLmR2YWx1ZXMpOworfQor
CiBzdGF0aWMgaW50IHNvY190cGxnX2RlbnVtX2NyZWF0ZShzdHJ1Y3Qgc29jX3RwbGcgKnRwbGcs
IHVuc2lnbmVkIGludCBjb3VudCwKIAlzaXplX3Qgc2l6ZSkKIHsKQEAgLTEwMzUsNyArMTA0NSw2
IEBAIHN0YXRpYyBpbnQgc29jX3RwbGdfZGVudW1fY3JlYXRlKHN0cnVjdCBzb2NfdHBsZyAqdHBs
ZywgdW5zaWduZWQgaW50IGNvdW50LAogCQlzZS0+c2hpZnRfciA9IHRwbGNfY2hhbl9nZXRfc2hp
ZnQodHBsZywgZWMtPmNoYW5uZWwsCiAJCQlTTkRSVl9DSE1BUF9GTCk7CiAKLQkJc2UtPml0ZW1z
ID0gbGUzMl90b19jcHUoZWMtPml0ZW1zKTsKIAkJc2UtPm1hc2sgPSBsZTMyX3RvX2NwdShlYy0+
bWFzayk7CiAJCXNlLT5kb2JqLmluZGV4ID0gdHBsZy0+aW5kZXg7CiAJCXNlLT5kb2JqLnR5cGUg
PSBTTkRfU09DX0RPQkpfRU5VTTsKQEAgLTEzODEsNyArMTM5MCw3IEBAIHN0YXRpYyBzdHJ1Y3Qg
c25kX2tjb250cm9sX25ldyAqc29jX3RwbGdfZGFwbV93aWRnZXRfZGVudW1fY3JlYXRlKAogCXN0
cnVjdCBzbmRfa2NvbnRyb2xfbmV3ICprYzsKIAlzdHJ1Y3Qgc25kX3NvY190cGxnX2VudW1fY29u
dHJvbCAqZWM7CiAJc3RydWN0IHNvY19lbnVtICpzZTsKLQlpbnQgaSwgaiwgZXJyOworCWludCBp
LCBlcnI7CiAKIAlrYyA9IGtjYWxsb2MobnVtX2tjb250cm9scywgc2l6ZW9mKCprYyksIEdGUF9L
RVJORUwpOwogCWlmIChrYyA9PSBOVUxMKQpAQCAtMTQ3NiwxMCArMTQ4NSw4IEBAIHN0YXRpYyBz
dHJ1Y3Qgc25kX2tjb250cm9sX25ldyAqc29jX3RwbGdfZGFwbV93aWRnZXRfZGVudW1fY3JlYXRl
KAogCQlpZiAoIXNlKQogCQkJY29udGludWU7CiAKLQkJa2ZyZWUoc2UtPmRvYmouY29udHJvbC5k
dmFsdWVzKTsKLQkJZm9yIChqID0gMDsgaiA8IGVjLT5pdGVtczsgaisrKQotCQkJa2ZyZWUoc2Ut
PmRvYmouY29udHJvbC5kdGV4dHNbal0pOwotCQlrZnJlZShzZS0+ZG9iai5jb250cm9sLmR0ZXh0
cyk7CisJCXNvY190cGxnX2RlbnVtX3JlbW92ZV92YWx1ZXMoc2UpOworCQlzb2NfdHBsZ19kZW51
bV9yZW1vdmVfdGV4dHMoc2UpOwogCiAJCWtmcmVlKHNlKTsKIAkJa2ZyZWUoa2NbaV0ubmFtZSk7
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpo
dHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2
ZWwK
