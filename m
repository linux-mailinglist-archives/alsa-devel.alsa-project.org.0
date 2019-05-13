Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D87411B2AF
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 11:16:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71F8F16F8;
	Mon, 13 May 2019 11:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71F8F16F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557739006;
	bh=S+28acv4K+oWUjToNaei8aoeE62be01DzXYfSEEMRsw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QYm6R+ALUtCsSBy/T8VdB/3cLhLfuim3spxQUKXD/6ten3bVzPuFN9fZFKXUFlimV
	 dfw3UcWZUxR8lrpiJH2UHoyfxXNfy/VxmuHwnOShnG5t6GxjvoP2qTp5f3+/3G8oF8
	 fhcEgky71ZxdHqh8end9S4inU64PcjXtxYCLYj2o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F2D3F8972E;
	Mon, 13 May 2019 11:14:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C93FDF8972C; Mon, 13 May 2019 11:14:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89E31F80733
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 11:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89E31F80733
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 May 2019 02:14:32 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by fmsmga001.fm.intel.com with ESMTP; 13 May 2019 02:14:31 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 13 May 2019 11:18:01 +0200
Message-Id: <20190513091801.985-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Takashi Iwai <tiwai@suse.com>
Subject: [alsa-devel] [PATCH v2] ALSA: hda: Fix race between creating and
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
dXguaW50ZWwuY29tPgotLS0KCkNoYW5nZXMgc2luY2UgdjE6CiAtIE1vdmVkIG11dGV4ZXMgYXJv
dW5kIHRoZSBjYWxsZXJzCiAtIEFkZGVkIGNvbW1lbnRzIG5vdGluZyB0aGF0IGZ1bmN0aW9ucyBz
aG91bGQgYmUgY2FsbGVkIHdpdGggbXV0ZXggaGVsZAoKLS0tCiBpbmNsdWRlL3NvdW5kL2hkYXVk
aW8uaCB8IDEgKwogc291bmQvaGRhL2hkYWNfZGV2aWNlLmMgfCA3ICsrKysrKysKIHNvdW5kL2hk
YS9oZGFjX3N5c2ZzLmMgIHwgMyArKysKIDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvc291bmQvaGRhdWRpby5oIGIvaW5jbHVkZS9zb3VuZC9o
ZGF1ZGlvLmgKaW5kZXggNDVmOTQ0ZDU3OTgyLi44NTgzNWQwYzMzY2MgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvc291bmQvaGRhdWRpby5oCisrKyBiL2luY2x1ZGUvc291bmQvaGRhdWRpby5oCkBAIC04
MSw2ICs4MSw3IEBAIHN0cnVjdCBoZGFjX2RldmljZSB7CiAJYXRvbWljX3QgaW5fcG07CQkvKiBz
dXNwZW5kL3Jlc3VtZSBiZWluZyBwZXJmb3JtZWQgKi8KIAogCS8qIHN5c2ZzICovCisJc3RydWN0
IG11dGV4IHdpZGdldF9sb2NrOwogCXN0cnVjdCBoZGFjX3dpZGdldF90cmVlICp3aWRnZXRzOwog
CiAJLyogcmVnbWFwICovCmRpZmYgLS1naXQgYS9zb3VuZC9oZGEvaGRhY19kZXZpY2UuYyBiL3Nv
dW5kL2hkYS9oZGFjX2RldmljZS5jCmluZGV4IDk1YjA3M2VlNGIzMi4uNDc2OWY0YzAzZTE0IDEw
MDY0NAotLS0gYS9zb3VuZC9oZGEvaGRhY19kZXZpY2UuYworKysgYi9zb3VuZC9oZGEvaGRhY19k
ZXZpY2UuYwpAQCAtNTUsNiArNTUsNyBAQCBpbnQgc25kX2hkYWNfZGV2aWNlX2luaXQoc3RydWN0
IGhkYWNfZGV2aWNlICpjb2RlYywgc3RydWN0IGhkYWNfYnVzICpidXMsCiAJY29kZWMtPmJ1cyA9
IGJ1czsKIAljb2RlYy0+YWRkciA9IGFkZHI7CiAJY29kZWMtPnR5cGUgPSBIREFfREVWX0NPUkU7
CisJbXV0ZXhfaW5pdCgmY29kZWMtPndpZGdldF9sb2NrKTsKIAlwbV9ydW50aW1lX3NldF9hY3Rp
dmUoJmNvZGVjLT5kZXYpOwogCXBtX3J1bnRpbWVfZ2V0X25vcmVzdW1lKCZjb2RlYy0+ZGV2KTsK
IAlhdG9taWNfc2V0KCZjb2RlYy0+aW5fcG0sIDApOwpAQCAtMTQxLDcgKzE0Miw5IEBAIGludCBz
bmRfaGRhY19kZXZpY2VfcmVnaXN0ZXIoc3RydWN0IGhkYWNfZGV2aWNlICpjb2RlYykKIAllcnIg
PSBkZXZpY2VfYWRkKCZjb2RlYy0+ZGV2KTsKIAlpZiAoZXJyIDwgMCkKIAkJcmV0dXJuIGVycjsK
KwltdXRleF9sb2NrKCZjb2RlYy0+d2lkZ2V0X2xvY2spOwogCWVyciA9IGhkYV93aWRnZXRfc3lz
ZnNfaW5pdChjb2RlYyk7CisJbXV0ZXhfdW5sb2NrKCZjb2RlYy0+d2lkZ2V0X2xvY2spOwogCWlm
IChlcnIgPCAwKSB7CiAJCWRldmljZV9kZWwoJmNvZGVjLT5kZXYpOwogCQlyZXR1cm4gZXJyOwpA
QCAtMTU4LDcgKzE2MSw5IEBAIEVYUE9SVF9TWU1CT0xfR1BMKHNuZF9oZGFjX2RldmljZV9yZWdp
c3Rlcik7CiB2b2lkIHNuZF9oZGFjX2RldmljZV91bnJlZ2lzdGVyKHN0cnVjdCBoZGFjX2Rldmlj
ZSAqY29kZWMpCiB7CiAJaWYgKGRldmljZV9pc19yZWdpc3RlcmVkKCZjb2RlYy0+ZGV2KSkgewor
CQltdXRleF9sb2NrKCZjb2RlYy0+d2lkZ2V0X2xvY2spOwogCQloZGFfd2lkZ2V0X3N5c2ZzX2V4
aXQoY29kZWMpOworCQltdXRleF91bmxvY2soJmNvZGVjLT53aWRnZXRfbG9jayk7CiAJCWRldmlj
ZV9kZWwoJmNvZGVjLT5kZXYpOwogCQlzbmRfaGRhY19idXNfcmVtb3ZlX2RldmljZShjb2RlYy0+
YnVzLCBjb2RlYyk7CiAJfQpAQCAtNDA0LDcgKzQwOSw5IEBAIGludCBzbmRfaGRhY19yZWZyZXNo
X3dpZGdldHMoc3RydWN0IGhkYWNfZGV2aWNlICpjb2RlYywgYm9vbCBzeXNmcykKIAl9CiAKIAlp
ZiAoc3lzZnMpIHsKKwkJbXV0ZXhfbG9jaygmY29kZWMtPndpZGdldF9sb2NrKTsKIAkJZXJyID0g
aGRhX3dpZGdldF9zeXNmc19yZWluaXQoY29kZWMsIHN0YXJ0X25pZCwgbnVtcyk7CisJCW11dGV4
X3VubG9jaygmY29kZWMtPndpZGdldF9sb2NrKTsKIAkJaWYgKGVyciA8IDApCiAJCQlyZXR1cm4g
ZXJyOwogCX0KZGlmZiAtLWdpdCBhL3NvdW5kL2hkYS9oZGFjX3N5c2ZzLmMgYi9zb3VuZC9oZGEv
aGRhY19zeXNmcy5jCmluZGV4IGZiMmFhMzQ0OTgxZS4uOTA5ZDVlZjExNzljIDEwMDY0NAotLS0g
YS9zb3VuZC9oZGEvaGRhY19zeXNmcy5jCisrKyBiL3NvdW5kL2hkYS9oZGFjX3N5c2ZzLmMKQEAg
LTM5NSw2ICszOTUsNyBAQCBzdGF0aWMgaW50IHdpZGdldF90cmVlX2NyZWF0ZShzdHJ1Y3QgaGRh
Y19kZXZpY2UgKmNvZGVjKQogCXJldHVybiAwOwogfQogCisvKiBjYWxsIHdpdGggY29kZWMtPndp
ZGdldF9sb2NrIGhlbGQgKi8KIGludCBoZGFfd2lkZ2V0X3N5c2ZzX2luaXQoc3RydWN0IGhkYWNf
ZGV2aWNlICpjb2RlYykKIHsKIAlpbnQgZXJyOwpAQCAtNDExLDExICs0MTIsMTMgQEAgaW50IGhk
YV93aWRnZXRfc3lzZnNfaW5pdChzdHJ1Y3QgaGRhY19kZXZpY2UgKmNvZGVjKQogCXJldHVybiAw
OwogfQogCisvKiBjYWxsIHdpdGggY29kZWMtPndpZGdldF9sb2NrIGhlbGQgKi8KIHZvaWQgaGRh
X3dpZGdldF9zeXNmc19leGl0KHN0cnVjdCBoZGFjX2RldmljZSAqY29kZWMpCiB7CiAJd2lkZ2V0
X3RyZWVfZnJlZShjb2RlYyk7CiB9CiAKKy8qIGNhbGwgd2l0aCBjb2RlYy0+d2lkZ2V0X2xvY2sg
aGVsZCAqLwogaW50IGhkYV93aWRnZXRfc3lzZnNfcmVpbml0KHN0cnVjdCBoZGFjX2RldmljZSAq
Y29kZWMsCiAJCQkgICAgaGRhX25pZF90IHN0YXJ0X25pZCwgaW50IG51bV9ub2RlcykKIHsKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
QWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBz
Oi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
