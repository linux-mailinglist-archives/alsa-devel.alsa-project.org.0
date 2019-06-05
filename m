Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EAA35E39
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2019 15:47:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 612B2167D;
	Wed,  5 Jun 2019 15:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 612B2167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559742446;
	bh=jostamoAdm26L4klR8GBdb2mRAnjoth1tTMuhs/9LW4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r0iCq9uZV8U4Tf4umVtG7+kemLuKmRMH/KnGnHc0wLFxHJHJ6FPDCJYdtTPTV5OBK
	 k8HwlJzBhN5SNVDEqLF0PXotYjH3gzva2+wR1pxc5vBbz5YvsqYOziCIIpmtGF9Pp7
	 nmI4hUZ469m+zwDtymyT3NmeUwZfbllBb4PXqO2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 137EDF89743;
	Wed,  5 Jun 2019 15:42:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D242F89741; Wed,  5 Jun 2019 15:42:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A2FCF8973C
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 15:42:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A2FCF8973C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2019 06:42:30 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by orsmga004.jf.intel.com with ESMTP; 05 Jun 2019 06:42:28 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  5 Jun 2019 15:45:47 +0200
Message-Id: <20190605134556.10322-6-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605134556.10322-1-amadeuszx.slawinski@linux.intel.com>
References: <20190605134556.10322-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [alsa-devel] [PATCH 05/14] ASoC: Intel: Skylake: Don't return
	failure on machine driver reload
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

V2hlbiB3ZSB1bmxvYWQgYW5kIHJlbG9hZCBtYWNoaW5lIGRyaXZlciwgd2Ugc2hvdWxkbid0IHJl
dHVybiB0aGF0IHdlCmZhaWxlZCB0byBpbml0aWFsaXplLiBUaGlzIGFsbG93cyB0byByZWxvYWQg
bWFjaGluZSBkcml2ZXIsIHdpdGhvdXQKaGF2aW5nIHRvIHVubG9hZCB3aG9sZSBzdGFjay4KClNp
Z25lZC1vZmYtYnk6IEFtYWRldXN6IFPFgmF3acWEc2tpIDxhbWFkZXVzenguc2xhd2luc2tpQGxp
bnV4LmludGVsLmNvbT4KLS0tCiBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtcGNtLmMgfCA1
IC0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zb3Vu
ZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtcGNtLmMgYi9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9z
a2wtcGNtLmMKaW5kZXggMmEwYmE0MGQ4MDk4Li40NDA2MjgwNmZiZWQgMTAwNjQ0Ci0tLSBhL3Nv
dW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1wY20uYworKysgYi9zb3VuZC9zb2MvaW50ZWwvc2t5
bGFrZS9za2wtcGNtLmMKQEAgLTE0MjcsMTEgKzE0MjcsNiBAQCBzdGF0aWMgaW50IHNrbF9wbGF0
Zm9ybV9zb2NfcHJvYmUoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQpCiAJCWlm
ICghb3BzKQogCQkJcmV0dXJuIC1FSU87CiAKLQkJaWYgKCFza2wtPnNrbF9zc3QtPmlzX2ZpcnN0
X2Jvb3QpIHsKLQkJCWRldl9lcnIoY29tcG9uZW50LT5kZXYsICJEU1AgcmVwb3J0cyBmaXJzdCBi
b290IGRvbmUhISFcbiIpOwotCQkJcmV0dXJuIC1FSU87Ci0JCX0KLQogCQkvKgogCQkgKiBEaXNh
YmxlIGR5bmFtaWMgY2xvY2sgYW5kIHBvd2VyIGdhdGluZyBkdXJpbmcgZmlybXdhcmUKIAkJICog
YW5kIGxpYnJhcnkgZG93bmxvYWQKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
