Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC2899F5B
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:06:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4365A1654;
	Thu, 22 Aug 2019 21:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4365A1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566500801;
	bh=1YzCpB3TKMcUh5Eh34aH1Aw6VZ/D4QBFwH1junHQ9No=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aRDlPviyG3UzyU7XliUUkdOlihyDevvzPZrvhCdmSmdXoDYpBpVFeL5NkF7i8R+mr
	 o/pu1gPMRnmjrI+BZuNVp6VGlWtwHsBZPq5WOKmkHA+mBN3gY2VM1V9Qzhot9CMTV6
	 c3VZA7rr6ezbFJT6IWon6962rfOB94ffCVeyQqC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33641F805F5;
	Thu, 22 Aug 2019 21:05:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 433DBF805E0; Thu, 22 Aug 2019 21:04:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 324D2F803D5
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:04:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 324D2F803D5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:04:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524203"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:04:41 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:03:51 +0200
Message-Id: <20190822190425.23001-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Cc: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 01/35] ASoC: Intel: Skylake: Put FW runtime
	params defs in one place
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

RnJvbTogQW1hZGV1c3ogU8WCYXdpxYRza2kgPGFtYWRldXN6eC5zbGF3aW5za2lAbGludXguaW50
ZWwuY29tPgoKQ2hhbmdlIFJ1bnRpbWUgUGFyYW1ldGVycyBlbnVtIHRvIGhhdmUgaXRzIG93biBw
cmVmaXggYW5kIHRoZW4gcmV1c2UKdGhvc2UgZGVmaW5lcyBpbiBhbGwgcGxhY2VzIHdoZXJlIHdl
IGFjdHVhbGx5IHVzZSB0aG9zZSBwYXJhbWV0ZXJzLgoKU2lnbmVkLW9mZi1ieTogQW1hZGV1c3og
U8WCYXdpxYRza2kgPGFtYWRldXN6eC5zbGF3aW5za2lAbGludXguaW50ZWwuY29tPgotLS0KIHNv
dW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1tZXNzYWdlcy5jIHwgNyArKy0tLS0tCiBzb3VuZC9z
b2MvaW50ZWwvc2t5bGFrZS9za2wtc3N0LWlwYy5oICB8IDUgKysrKysKIDIgZmlsZXMgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3Nv
Yy9pbnRlbC9za3lsYWtlL3NrbC1tZXNzYWdlcy5jIGIvc291bmQvc29jL2ludGVsL3NreWxha2Uv
c2tsLW1lc3NhZ2VzLmMKaW5kZXggZDQzNDk2YzVmMjllLi5iNmNlZmIxZjliMTIgMTAwNjQ0Ci0t
LSBhL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1tZXNzYWdlcy5jCisrKyBiL3NvdW5kL3Nv
Yy9pbnRlbC9za3lsYWtlL3NrbC1tZXNzYWdlcy5jCkBAIC0zNCwxMyArMzQsMTEgQEAgc3RhdGlj
IGludCBza2xfZnJlZV9kbWFfYnVmKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHNuZF9kbWFf
YnVmZmVyICpkbWFiKQogCXJldHVybiAwOwogfQogCi0jZGVmaW5lIFNLTF9BU1RBVEVfUEFSQU1f
SUQJNAotCiB2b2lkIHNrbF9kc3Bfc2V0X2FzdGF0ZV9jZmcoc3RydWN0IHNrbF9kZXYgKnNrbCwg
dTMyIGNudCwgdm9pZCAqZGF0YSkKIHsKIAlzdHJ1Y3Qgc2tsX2lwY19sYXJnZV9jb25maWdfbXNn
CW1zZyA9IHswfTsKIAotCW1zZy5sYXJnZV9wYXJhbV9pZCA9IFNLTF9BU1RBVEVfUEFSQU1fSUQ7
CisJbXNnLmxhcmdlX3BhcmFtX2lkID0gU0tMX0JBU0VGV19BU1RBVEVfVEFCTEU7CiAJbXNnLnBh
cmFtX2RhdGFfc2l6ZSA9IChjbnQgKiBzaXplb2Yoc3RydWN0IHNrbF9hc3RhdGVfcGFyYW0pICsK
IAkJCQlzaXplb2YoY250KSk7CiAKQEAgLTYxNCw3ICs2MTIsNiBAQCBzdGF0aWMgdm9pZCBza2xf
c2V0dXBfY3ByX2dhdGV3YXlfY2ZnKHN0cnVjdCBza2xfZGV2ICpza2wsCiAJc2tsX2NvcHlfY29w
aWVyX2NhcHMobWNvbmZpZywgY3ByX21jb25maWcpOwogfQogCi0jZGVmaW5lIERNQV9DT05UUk9M
X0lEIDUKICNkZWZpbmUgRE1BX0kyU19CTE9CX1NJWkUgMjEKIAogaW50IHNrbF9kc3Bfc2V0X2Rt
YV9jb250cm9sKHN0cnVjdCBza2xfZGV2ICpza2wsIHUzMiAqY2FwcywKQEAgLTYzMSw3ICs2Mjgs
NyBAQCBpbnQgc2tsX2RzcF9zZXRfZG1hX2NvbnRyb2woc3RydWN0IHNrbF9kZXYgKnNrbCwgdTMy
ICpjYXBzLAogCWlmIChjYXBzX3NpemUgPT0gMCkKIAkJcmV0dXJuIDA7CiAKLQltc2cubGFyZ2Vf
cGFyYW1faWQgPSBETUFfQ09OVFJPTF9JRDsKKwltc2cubGFyZ2VfcGFyYW1faWQgPSBTS0xfQkFT
RUZXX0RNQV9DT05UUk9MOwogCW1zZy5wYXJhbV9kYXRhX3NpemUgPSBzaXplb2Yoc3RydWN0IHNr
bF9kbWFfY29udHJvbCkgKyBjYXBzX3NpemU7CiAKIAlkbWFfY3RybCA9IGt6YWxsb2MobXNnLnBh
cmFtX2RhdGFfc2l6ZSwgR0ZQX0tFUk5FTCk7CmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwv
c2t5bGFrZS9za2wtc3N0LWlwYy5oIGIvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXNzdC1p
cGMuaAppbmRleCAwOGFjMzE3NzgzMjUuLjAwNThkODJiZDVhNCAxMDA2NDQKLS0tIGEvc291bmQv
c29jL2ludGVsL3NreWxha2Uvc2tsLXNzdC1pcGMuaAorKysgYi9zb3VuZC9zb2MvaW50ZWwvc2t5
bGFrZS9za2wtc3N0LWlwYy5oCkBAIC02Nyw2ICs2NywxMSBAQCBzdHJ1Y3Qgc2tsX2xpYl9pbmZv
IHsKIAljb25zdCBzdHJ1Y3QgZmlybXdhcmUgKmZ3OwogfTsKIAorZW51bSBza2xfYmFzZWZ3X3J1
bnRpbWVfcGFyYW0geworCVNLTF9CQVNFRldfQVNUQVRFX1RBQkxFID0gNCwKKwlTS0xfQkFTRUZX
X0RNQV9DT05UUk9MID0gNSwKK307CisKIHN0cnVjdCBza2xfaXBjX2luaXRfaW5zdGFuY2VfbXNn
IHsKIAl1MzIgbW9kdWxlX2lkOwogCXUzMiBpbnN0YW5jZV9pZDsKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWls
aW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNh
LXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
