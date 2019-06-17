Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA5A480FF
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 13:39:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB269171D;
	Mon, 17 Jun 2019 13:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB269171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560771557;
	bh=92cD3e0HxEnPYdF3QoMPJhzlqI6EfghfeLdvoUWXvM0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rwXrPgvnDkxAtTqKpKX9Nf553pK2ibcpRd3gDGSCS7IXjRp/oTAX5tPa5AqX1PTpf
	 k6lAL5r53Pp0KGuqCs0Mj/C0pyADIb1A/oUVsmty9UzEWgNWfNSAdRQ/U44Yw/Jbn+
	 /ohYBDp1pLGxFRBDOCgmbV/yvi8LLYVhuslJyOWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF212F8973F;
	Mon, 17 Jun 2019 13:35:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5593F89731; Mon, 17 Jun 2019 13:35:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9222DF89717
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 13:35:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9222DF89717
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 04:35:01 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by fmsmga006.fm.intel.com with ESMTP; 17 Jun 2019 04:34:59 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 17 Jun 2019 13:36:37 +0200
Message-Id: <20190617113644.25621-5-amadeuszx.slawinski@linux.intel.com>
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
Subject: [alsa-devel] [PATCH v2 04/11] ASoC: Intel: Skylake: Don't return
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
a2wtcGNtLmMKaW5kZXggNDg5ZWNlZjMxMWFkLi41ZTM0MjFjYzBmZWIgMTAwNjQ0Ci0tLSBhL3Nv
dW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1wY20uYworKysgYi9zb3VuZC9zb2MvaW50ZWwvc2t5
bGFrZS9za2wtcGNtLmMKQEAgLTE0MTgsMTEgKzE0MTgsNiBAQCBzdGF0aWMgaW50IHNrbF9wbGF0
Zm9ybV9zb2NfcHJvYmUoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQpCiAJCWlm
ICghb3BzKQogCQkJcmV0dXJuIC1FSU87CiAKLQkJaWYgKCFza2wtPnNrbF9zc3QtPmlzX2ZpcnN0
X2Jvb3QpIHsKLQkJCWRldl9lcnIoY29tcG9uZW50LT5kZXYsICJEU1AgcmVwb3J0cyBmaXJzdCBi
b290IGRvbmUhISFcbiIpOwotCQkJcmV0dXJuIC1FSU87Ci0JCX0KLQogCQkvKgogCQkgKiBEaXNh
YmxlIGR5bmFtaWMgY2xvY2sgYW5kIHBvd2VyIGdhdGluZyBkdXJpbmcgZmlybXdhcmUKIAkJICog
YW5kIGxpYnJhcnkgZG93bmxvYWQKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZl
bEBhbHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
