Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A8119D20
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 14:20:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 915BA193A;
	Fri, 10 May 2019 14:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 915BA193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557490808;
	bh=N63O6mjIXM/wzL7NKqIUt7eO3R4Spqh/sr459HX/haI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cnt1yqkOB+0nEU0a9lpM1MTxuVHLEol5/JpYAc7heJtKfc+t/u7iGO0xeGJ4ufxgf
	 E112lWTuh4WVil0EvvX6cH2X7cjkG7eZYb/BdNR+SOVW9UdzKspvhsyW/VfSUks/pY
	 mJiS5iaRzDWTZpghfTH6lNXx37czvCXEuFNc9/40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2C54F896F0;
	Fri, 10 May 2019 14:18:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74E9EF896FD; Fri, 10 May 2019 14:18:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AC2BF80730
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 14:18:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AC2BF80730
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2019 05:18:13 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by orsmga004.jf.intel.com with ESMTP; 10 May 2019 05:18:11 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 10 May 2019 14:21:41 +0200
Message-Id: <20190510122141.8802-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Takashi Iwai <tiwai@suse.com>
Subject: [alsa-devel] [PATCH] ALSA: hda: Fix race between creating and
	refreshing sysfs entries
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

aGRhX3dpZGdldF9zeXNmc19yZWluaXQoKSBjYW4gZnJlZSB1bmRlcmx5aW5nIGNvZGVjLT53aWRn
ZXRzIHN0cnVjdHVyZQpvbiB3aGljaCB3aWRnZXRfdHJlZV9jcmVhdGUoKSBvcGVyYXRlcy4gQWRk
IGxvY2tpbmcgdG8gcHJldmVudCBzdWNoCmlzc3VlcyBmcm9tIGhhcHBlbmluZy4KCkJ1Z3ppbGxh
OiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTAzODIKU2ln
bmVkLW9mZi1ieTogQW1hZGV1c3ogU8WCYXdpxYRza2kgPGFtYWRldXN6eC5zbGF3aW5za2lAbGlu
dXguaW50ZWwuY29tPgotLS0KIGluY2x1ZGUvc291bmQvaGRhdWRpby5oICAgfCAgMSArCiBzb3Vu
ZC9oZGEvaGRhY19zeXNmcy5jICAgIHwgMjIgKysrKysrKysrKysrKysrKysrKy0tLQogc291bmQv
cGNpL2hkYS9oZGFfY29kZWMuYyB8ICAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zb3VuZC9oZGF1ZGlv
LmggYi9pbmNsdWRlL3NvdW5kL2hkYXVkaW8uaAppbmRleCA0NWY5NDRkNTc5ODIuLjg1ODM1ZDBj
MzNjYyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9zb3VuZC9oZGF1ZGlvLmgKKysrIGIvaW5jbHVkZS9z
b3VuZC9oZGF1ZGlvLmgKQEAgLTgxLDYgKzgxLDcgQEAgc3RydWN0IGhkYWNfZGV2aWNlIHsKIAlh
dG9taWNfdCBpbl9wbTsJCS8qIHN1c3BlbmQvcmVzdW1lIGJlaW5nIHBlcmZvcm1lZCAqLwogCiAJ
Lyogc3lzZnMgKi8KKwlzdHJ1Y3QgbXV0ZXggd2lkZ2V0X2xvY2s7CiAJc3RydWN0IGhkYWNfd2lk
Z2V0X3RyZWUgKndpZGdldHM7CiAKIAkvKiByZWdtYXAgKi8KZGlmZiAtLWdpdCBhL3NvdW5kL2hk
YS9oZGFjX3N5c2ZzLmMgYi9zb3VuZC9oZGEvaGRhY19zeXNmcy5jCmluZGV4IGZiMmFhMzQ0OTgx
ZS4uNTM1MmU1ZGI4MTRjIDEwMDY0NAotLS0gYS9zb3VuZC9oZGEvaGRhY19zeXNmcy5jCisrKyBi
L3NvdW5kL2hkYS9oZGFjX3N5c2ZzLmMKQEAgLTM5OSwyMSArMzk5LDI4IEBAIGludCBoZGFfd2lk
Z2V0X3N5c2ZzX2luaXQoc3RydWN0IGhkYWNfZGV2aWNlICpjb2RlYykKIHsKIAlpbnQgZXJyOwog
Ci0JaWYgKGNvZGVjLT53aWRnZXRzKQorCW11dGV4X2xvY2soJmNvZGVjLT53aWRnZXRfbG9jayk7
CisJaWYgKGNvZGVjLT53aWRnZXRzKSB7CisJCW11dGV4X3VubG9jaygmY29kZWMtPndpZGdldF9s
b2NrKTsKIAkJcmV0dXJuIDA7IC8qIGFscmVhZHkgY3JlYXRlZCAqLworCX0KIAogCWVyciA9IHdp
ZGdldF90cmVlX2NyZWF0ZShjb2RlYyk7CiAJaWYgKGVyciA8IDApIHsKIAkJd2lkZ2V0X3RyZWVf
ZnJlZShjb2RlYyk7CisJCW11dGV4X3VubG9jaygmY29kZWMtPndpZGdldF9sb2NrKTsKIAkJcmV0
dXJuIGVycjsKIAl9CiAKKwltdXRleF91bmxvY2soJmNvZGVjLT53aWRnZXRfbG9jayk7CiAJcmV0
dXJuIDA7CiB9CiAKIHZvaWQgaGRhX3dpZGdldF9zeXNmc19leGl0KHN0cnVjdCBoZGFjX2Rldmlj
ZSAqY29kZWMpCiB7CisJbXV0ZXhfbG9jaygmY29kZWMtPndpZGdldF9sb2NrKTsKIAl3aWRnZXRf
dHJlZV9mcmVlKGNvZGVjKTsKKwltdXRleF91bmxvY2soJmNvZGVjLT53aWRnZXRfbG9jayk7CiB9
CiAKIGludCBoZGFfd2lkZ2V0X3N5c2ZzX3JlaW5pdChzdHJ1Y3QgaGRhY19kZXZpY2UgKmNvZGVj
LApAQCAtNDI0LDE2ICs0MzEsMjMgQEAgaW50IGhkYV93aWRnZXRfc3lzZnNfcmVpbml0KHN0cnVj
dCBoZGFjX2RldmljZSAqY29kZWMsCiAJaGRhX25pZF90IG5pZDsKIAlpbnQgaTsKIAotCWlmICgh
Y29kZWMtPndpZGdldHMpCisJbXV0ZXhfbG9jaygmY29kZWMtPndpZGdldF9sb2NrKTsKKworCWlm
ICghY29kZWMtPndpZGdldHMpIHsKKwkJbXV0ZXhfdW5sb2NrKCZjb2RlYy0+d2lkZ2V0X2xvY2sp
OwogCQlyZXR1cm4gaGRhX3dpZGdldF9zeXNmc19pbml0KGNvZGVjKTsKKwl9CiAKIAl0cmVlID0g
a21lbWR1cChjb2RlYy0+d2lkZ2V0cywgc2l6ZW9mKCp0cmVlKSwgR0ZQX0tFUk5FTCk7Ci0JaWYg
KCF0cmVlKQorCWlmICghdHJlZSkgeworCQltdXRleF91bmxvY2soJmNvZGVjLT53aWRnZXRfbG9j
ayk7CiAJCXJldHVybiAtRU5PTUVNOworCX0KIAogCXRyZWUtPm5vZGVzID0ga2NhbGxvYyhudW1f
bm9kZXMgKyAxLCBzaXplb2YoKnRyZWUtPm5vZGVzKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCF0cmVl
LT5ub2RlcykgewogCQlrZnJlZSh0cmVlKTsKKwkJbXV0ZXhfdW5sb2NrKCZjb2RlYy0+d2lkZ2V0
X2xvY2spOwogCQlyZXR1cm4gLUVOT01FTTsKIAl9CiAKQEAgLTQ2MCw1ICs0NzQsNyBAQCBpbnQg
aGRhX3dpZGdldF9zeXNmc19yZWluaXQoc3RydWN0IGhkYWNfZGV2aWNlICpjb2RlYywKIAljb2Rl
Yy0+d2lkZ2V0cyA9IHRyZWU7CiAKIAlrb2JqZWN0X3VldmVudCh0cmVlLT5yb290LCBLT0JKX0NI
QU5HRSk7CisKKwltdXRleF91bmxvY2soJmNvZGVjLT53aWRnZXRfbG9jayk7CiAJcmV0dXJuIDA7
CiB9CmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL2hkYV9jb2RlYy5jIGIvc291bmQvcGNpL2hk
YS9oZGFfY29kZWMuYwppbmRleCA3MDFhNjlkODU2ZjUuLmE1NzQ2ZGY1Yzk0YiAxMDA2NDQKLS0t
IGEvc291bmQvcGNpL2hkYS9oZGFfY29kZWMuYworKysgYi9zb3VuZC9wY2kvaGRhL2hkYV9jb2Rl
Yy5jCkBAIC04NzAsNiArODcwLDggQEAgc3RhdGljIGludCBzbmRfaGRhX2NvZGVjX2RldmljZV9p
bml0KHN0cnVjdCBoZGFfYnVzICpidXMsIHN0cnVjdCBzbmRfY2FyZCAqY2FyZCwKIAlpZiAoIWNv
ZGVjKQogCQlyZXR1cm4gLUVOT01FTTsKIAorCW11dGV4X2luaXQoJmNvZGVjLT53aWRnZXRfbG9j
ayk7CisKIAlzcHJpbnRmKG5hbWUsICJoZGF1ZGlvQyVkRCVkIiwgY2FyZC0+bnVtYmVyLCBjb2Rl
Y19hZGRyKTsKIAllcnIgPSBzbmRfaGRhY19kZXZpY2VfaW5pdCgmY29kZWMtPmNvcmUsICZidXMt
PmNvcmUsIG5hbWUsIGNvZGVjX2FkZHIpOwogCWlmIChlcnIgPCAwKSB7Ci0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwg
bWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4u
YWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
