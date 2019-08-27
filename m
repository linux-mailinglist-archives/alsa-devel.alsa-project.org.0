Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B72EB9EAB5
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 16:18:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CD73166B;
	Tue, 27 Aug 2019 16:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CD73166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566915488;
	bh=gGXogYtX+NAKJP6ycBHMRD/0iDwzRO+n1pUkLO7st7M=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cNGScRHvseGE9+q13QgM/xLCTnlgBX3gQIfTa1gXZgSPcfGucJ/ZAiBeG14Wh65fE
	 Oy2hEdwM5HOPfITt5gnyXBh1yi4DSMzqfcVENpcSRhzyqcRI5iSyfm7rdFXUAR4sAx
	 18e2jes4lIfydjQIO0UVkf66jqz3hv9+6aQkJjcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8D4BF80612;
	Tue, 27 Aug 2019 16:13:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA6FCF805FA; Tue, 27 Aug 2019 16:13:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 650BDF80273
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 16:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 650BDF80273
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 07:13:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="264282475"
Received: from xxx.igk.intel.com ([10.237.93.170])
 by orsmga001.jf.intel.com with ESMTP; 27 Aug 2019 07:13:03 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 27 Aug 2019 16:17:11 +0200
Message-Id: <20190827141712.21015-6-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190827141712.21015-1-amadeuszx.slawinski@linux.intel.com>
References: <20190827141712.21015-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [alsa-devel] [PATCH 5/6] ASoC: Intel: Skylake: Release topology
	when we are done with it
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

Q3VycmVudGx5IHRvcG9sb2d5IGlzIGtlcHQgaW4gbWVtb3J5IHdoaWxlIGRyaXZlciBpcyBydW5u
aW5nLiBJdCdzCnVubmVjZXNzYXJ5LCBhcyBpdCdzIG9ubHkgbmVlZGVkIGR1cmluZyBwYXJzaW5n
LgoKU2lnbmVkLW9mZi1ieTogQW1hZGV1c3ogU8WCYXdpxYRza2kgPGFtYWRldXN6eC5zbGF3aW5z
a2lAbGludXguaW50ZWwuY29tPgotLS0KIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC10b3Bv
bG9neS5jIHwgMjAgKysrKysrKysrKy0tLS0tLS0tLS0KIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtl
L3NrbC5oICAgICAgICAgIHwgIDEgLQogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
LCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9z
a2wtdG9wb2xvZ3kuYyBiL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC10b3BvbG9neS5jCmlu
ZGV4IGFlNWM3NWQwM2ZkYy4uNjljZDdhODFiZjJhIDEwMDY0NAotLS0gYS9zb3VuZC9zb2MvaW50
ZWwvc2t5bGFrZS9za2wtdG9wb2xvZ3kuYworKysgYi9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9z
a2wtdG9wb2xvZ3kuYwpAQCAtMzU3OSwyMyArMzU3OSwyNSBAQCBpbnQgc2tsX3RwbGdfaW5pdChz
dHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwgc3RydWN0IGhkYWNfYnVzICpidXMp
CiAJICogVGhlIGNvbXBsZXRlIHRwbGcgZm9yIFNLTCBpcyBsb2FkZWQgYXMgaW5kZXggMCwgd2Ug
ZG9uJ3QgdXNlCiAJICogYW55IG90aGVyIGluZGV4CiAJICovCi0JcmV0ID0gc25kX3NvY190cGxn
X2NvbXBvbmVudF9sb2FkKGNvbXBvbmVudCwKLQkJCQkJJnNrbF90cGxnX29wcywgZncsIDApOwor
CXJldCA9IHNuZF9zb2NfdHBsZ19jb21wb25lbnRfbG9hZChjb21wb25lbnQsICZza2xfdHBsZ19v
cHMsIGZ3LCAwKTsKIAlpZiAocmV0IDwgMCkgewogCQlkZXZfZXJyKGJ1cy0+ZGV2LCAidHBsZyBj
b21wb25lbnQgbG9hZCBmYWlsZWQlZFxuIiwgcmV0KTsKLQkJcmVsZWFzZV9maXJtd2FyZShmdyk7
Ci0JCXJldHVybiAtRUlOVkFMOworCQlnb3RvIGVycjsKIAl9CiAKLQlza2wtPnRwbGcgPSBmdzsK
IAlyZXQgPSBza2xfdHBsZ19jcmVhdGVfcGlwZV93aWRnZXRfbGlzdChjb21wb25lbnQpOwotCWlm
IChyZXQgPCAwKQotCQlyZXR1cm4gcmV0OworCWlmIChyZXQgPCAwKSB7CisJCWRldl9lcnIoYnVz
LT5kZXYsICJ0cGxnIGNyZWF0ZSBwaXBlIHdpZGdldCBsaXN0IGZhaWxlZCVkXG4iLAorCQkJCXJl
dCk7CisJCWdvdG8gZXJyOworCX0KIAogCWxpc3RfZm9yX2VhY2hfZW50cnkocHBsLCAmc2tsLT5w
cGxfbGlzdCwgbm9kZSkKIAkJc2tsX3RwbGdfc2V0X3BpcGVfdHlwZShza2wsIHBwbC0+cGlwZSk7
CiAKLQlyZXR1cm4gMDsKK2VycjoKKwlyZWxlYXNlX2Zpcm13YXJlKGZ3KTsKKwlyZXR1cm4gcmV0
OwogfQogCiB2b2lkIHNrbF90cGxnX2V4aXQoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21w
b25lbnQsIHN0cnVjdCBoZGFjX2J1cyAqYnVzKQpAQCAtMzYwOSw2ICszNjExLDQgQEAgdm9pZCBz
a2xfdHBsZ19leGl0KHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50LCBzdHJ1Y3Qg
aGRhY19idXMgKmJ1cykKIAogCS8qIGNsZWFuIHVwIHRvcG9sb2d5ICovCiAJc25kX3NvY190cGxn
X2NvbXBvbmVudF9yZW1vdmUoY29tcG9uZW50LCBTTkRfU09DX1RQTEdfSU5ERVhfQUxMKTsKLQot
CXJlbGVhc2VfZmlybXdhcmUoc2tsLT50cGxnKTsKIH0KZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9p
bnRlbC9za3lsYWtlL3NrbC5oIGIvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLmgKaW5kZXgg
ZjhjNzE0MTUzNjEwLi4yYmZiZjU5Mjc3YzQgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9pbnRlbC9z
a3lsYWtlL3NrbC5oCisrKyBiL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC5oCkBAIC03NSw3
ICs3NSw2IEBAIHN0cnVjdCBza2xfZGV2IHsKIAljb25zdCBjaGFyICpmd19uYW1lOwogCWNoYXIg
dHBsZ19uYW1lWzY0XTsKIAl1bnNpZ25lZCBzaG9ydCBwY2lfaWQ7Ci0JY29uc3Qgc3RydWN0IGZp
cm13YXJlICp0cGxnOwogCiAJaW50IHN1cGVuZF9hY3RpdmU7CiAKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWls
aW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNh
LXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
