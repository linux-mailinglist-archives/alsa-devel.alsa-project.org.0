Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE0D44BC9
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 21:11:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32A3C185D;
	Thu, 13 Jun 2019 21:10:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32A3C185D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560453065;
	bh=zR2dtoS7iMnyqH3+8gJ761nU/32LxYEaV1W2itDXcYI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dTwOailFTVS4tiHup/R2+BymsZ1PmJ4lBzmdrJ+TTlDdv/jhSK+68Ff03p4BDjFr5
	 h3PvEglpbQBMRMIsrlJUZzwy6WPx4oMivEJRaH7RTolGl/YPfcB9Kzr4Cmo+cM2tmC
	 T8ZSu7Aku8ZNcSXbh0tg0XjMPBQnWotUoB7fZv4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFFCCF8974F;
	Thu, 13 Jun 2019 21:05:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 151F7F8973D; Thu, 13 Jun 2019 21:05:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FF6AF89733
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 21:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FF6AF89733
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 12:05:34 -0700
X-ExtLoop1: 1
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 13 Jun 2019 12:05:32 -0700
From: cezary.rojewski@intel.com
To: alsa-devel@alsa-project.org
Date: Thu, 13 Jun 2019 21:04:35 +0200
Message-Id: <20190613190436.20156-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190613190436.20156-1-cezary.rojewski@intel.com>
References: <20190613190436.20156-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@intel.com>
Subject: [alsa-devel] [PATCH 6/7] ASoC: Intel: Skylake: Reset pipeline
	before its deletion
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

RnJvbTogQW1hZGV1c3ogU8WCYXdpxYRza2kgPGFtYWRldXN6eC5zbGF3aW5za2lAaW50ZWwuY29t
PgoKQmVmb3JlIGFjdHVhbCBkZWxldGlvbiwgcGlwZWxpbmUgc2hvdWxkIGVudGVyIFJFU0VUIHN0
YXRlLiBDdXJyZW50bHksCnBpcGUgc2tpcHMgdGhpcyBjaGVja3BvaW50IGFuZCBnb2VzIHN0cmFp
Z2h0IHRvIHRoZSBmaW5pc2ggbGluZS4KVGhpcyBpcyBub3QgdGhlIGV4cGVjdGVkIHBhdGggYnkg
dGhlIEZXLCBzbyBjb3JyZWN0IGl0LgoKU2lnbmVkLW9mZi1ieTogQW1hZGV1c3ogU8WCYXdpxYRz
a2kgPGFtYWRldXN6eC5zbGF3aW5za2lAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBDZXphcnkg
Um9qZXdza2kgPGNlemFyeS5yb2pld3NraUBpbnRlbC5jb20+Ci0tLQogc291bmQvc29jL2ludGVs
L3NreWxha2Uvc2tsLW1lc3NhZ2VzLmMgfCAyMyArKysrKysrKysrKysrKysrLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLW1lc3NhZ2VzLmMgYi9zb3VuZC9zb2MvaW50
ZWwvc2t5bGFrZS9za2wtbWVzc2FnZXMuYwppbmRleCBkZjAxZGM5NTI1MjEuLjc5YmFmOTBlNjEx
NiAxMDA2NDQKLS0tIGEvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLW1lc3NhZ2VzLmMKKysr
IGIvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLW1lc3NhZ2VzLmMKQEAgLTEyNjUsMTAgKzEy
NjUsMTAgQEAgaW50IHNrbF9jcmVhdGVfcGlwZWxpbmUoc3RydWN0IHNrbF9zc3QgKmN0eCwgc3Ry
dWN0IHNrbF9waXBlICpwaXBlKQogfQogCiAvKgotICogQSBwaXBlbGluZSBuZWVkcyB0byBiZSBk
ZWxldGVkIG9uIGNsZWFudXAuIElmIGEgcGlwZWxpbmUgaXMgcnVubmluZywgdGhlbgotICogcGF1
c2UgdGhlIHBpcGVsaW5lIGZpcnN0IGFuZCB0aGVuIGRlbGV0ZSBpdAotICogVGhlIHBpcGUgZGVs
ZXRlIGlzIGRvbmUgYnkgc2VuZGluZyBkZWxldGUgcGlwZWxpbmUgSVBDLiBEU1Agd2lsbCBzdG9w
IHRoZQotICogRE1BIGVuZ2luZXMgYW5kIHJlbGVhc2VzIHJlc291cmNlcworICogQSBwaXBlbGlu
ZSBuZWVkcyB0byBiZSBkZWxldGVkIG9uIGNsZWFudXAuIElmIGEgcGlwZWxpbmUgaXMgcnVubmlu
ZywKKyAqIHRoZW4gcGF1c2UgaXQgZmlyc3QuIEJlZm9yZSBhY3R1YWwgZGVsZXRpb24sIHBpcGVs
aW5lIHNob3VsZCBlbnRlcgorICogcmVzZXQgc3RhdGUuIEZpbmlzaCB0aGUgcHJvY2VkdXJlIGJ5
IHNlbmRpbmcgZGVsZXRlIHBpcGVsaW5lIElQQy4KKyAqIERTUCB3aWxsIHN0b3AgdGhlIERNQSBl
bmdpbmVzIGFuZCByZWxlYXNlIHJlc291cmNlcwogICovCiBpbnQgc2tsX2RlbGV0ZV9waXBlKHN0
cnVjdCBza2xfc3N0ICpjdHgsIHN0cnVjdCBza2xfcGlwZSAqcGlwZSkKIHsKQEAgLTEyNzYsNiAr
MTI3NiwxMCBAQCBpbnQgc2tsX2RlbGV0ZV9waXBlKHN0cnVjdCBza2xfc3N0ICpjdHgsIHN0cnVj
dCBza2xfcGlwZSAqcGlwZSkKIAogCWRldl9kYmcoY3R4LT5kZXYsICIlczogcGlwZSA9ICVkXG4i
LCBfX2Z1bmNfXywgcGlwZS0+cHBsX2lkKTsKIAorCS8qIElmIHBpcGUgd2FzIG5vdCBjcmVhdGVk
IGluIEZXLCBkbyBub3QgdHJ5IHRvIGRlbGV0ZSBpdCAqLworCWlmIChwaXBlLT5zdGF0ZSA8IFNL
TF9QSVBFX0NSRUFURUQpCisJCXJldHVybiAwOworCiAJLyogSWYgcGlwZSBpcyBzdGFydGVkLCBk
byBzdG9wIHRoZSBwaXBlIGluIEZXLiAqLwogCWlmIChwaXBlLT5zdGF0ZSA+PSBTS0xfUElQRV9T
VEFSVEVEKSB7CiAJCXJldCA9IHNrbF9zZXRfcGlwZV9zdGF0ZShjdHgsIHBpcGUsIFBQTF9QQVVT
RUQpOwpAQCAtMTI4Nyw5ICsxMjkxLDE0IEBAIGludCBza2xfZGVsZXRlX3BpcGUoc3RydWN0IHNr
bF9zc3QgKmN0eCwgc3RydWN0IHNrbF9waXBlICpwaXBlKQogCQlwaXBlLT5zdGF0ZSA9IFNLTF9Q
SVBFX1BBVVNFRDsKIAl9CiAKLQkvKiBJZiBwaXBlIHdhcyBub3QgY3JlYXRlZCBpbiBGVywgZG8g
bm90IHRyeSB0byBkZWxldGUgaXQgKi8KLQlpZiAocGlwZS0+c3RhdGUgPCBTS0xfUElQRV9DUkVB
VEVEKQotCQlyZXR1cm4gMDsKKwkvKiByZXNldCBwaXBlIHN0YXRlIGJlZm9yZSBkZWxldGlvbiAq
LworCXJldCA9IHNrbF9zZXRfcGlwZV9zdGF0ZShjdHgsIHBpcGUsIFBQTF9SRVNFVCk7CisJaWYg
KHJldCA8IDApIHsKKwkJZGV2X2VycihjdHgtPmRldiwgIkZhaWxlZCB0byByZXNldCBwaXBlIHJl
dD0lZFxuIiwgcmV0KTsKKwkJcmV0dXJuIHJldDsKKwl9CisKKwlwaXBlLT5zdGF0ZSA9IFNLTF9Q
SVBFX1JFU0VUOwogCiAJcmV0ID0gc2tsX2lwY19kZWxldGVfcGlwZWxpbmUoJmN0eC0+aXBjLCBw
aXBlLT5wcGxfaWQpOwogCWlmIChyZXQgPCAwKSB7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0
CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
