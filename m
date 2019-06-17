Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 232BE48116
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 13:43:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A27E41721;
	Mon, 17 Jun 2019 13:42:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A27E41721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560771804;
	bh=sbLrhj+2yhuS0f5ND/+nuE4rJKBkOVKBooYBwlBm4CA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bfI9M0ebYUpJ/rmCGxUMUozs56BXN7S2nsrLEP4onJBCLTQ3KJ14IWyY6AU6BT+rC
	 2TwZjy+8zuQ2fAb54/qrpiTSNO/98TZVg+/UyTLD/uJRZ3fuBusMbdr8kRP1950dXY
	 5K+a1RjlRjZxHUnAG2GOxmHSo1fmQ7Z4BzZn+lMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95A03F89757;
	Mon, 17 Jun 2019 13:35:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DA69F89748; Mon, 17 Jun 2019 13:35:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79EF1F89748
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 13:35:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79EF1F89748
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 04:35:15 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by fmsmga006.fm.intel.com with ESMTP; 17 Jun 2019 04:35:12 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 17 Jun 2019 13:36:42 +0200
Message-Id: <20190617113644.25621-10-amadeuszx.slawinski@linux.intel.com>
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
Subject: [alsa-devel] [PATCH v2 09/11] ASoC: Intel: hdac_hdmi: Set ops to
	NULL on remove
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

V2hlbiB3ZSB1bmxvYWQgU2t5bGFrZSBkcml2ZXIgd2UgbWF5IGVuZCB1cCBjYWxsaW5nCmhkYWNf
Y29tcG9uZW50X21hc3Rlcl91bmJpbmQoKSwgaXQgdXNlcyBhY29tcC0+YXVkaW9fb3BzLCB3aGlj
aCB3ZSBzZXQKaW4gaGRtaV9jb2RlY19wcm9iZSgpLCBzbyB3ZSBuZWVkIHRvIHNldCBpdCB0byBO
VUxMIGluIGhkbWlfY29kZWNfcmVtb3ZlKCksCm90aGVyd2lzZSB3ZSB3aWxsIGRlcmVmZXJlbmNl
IG5vIGxvbmdlciBleGlzdGluZyBwb2ludGVyLgoKU2lnbmVkLW9mZi1ieTogQW1hZGV1c3ogU8WC
YXdpxYRza2kgPGFtYWRldXN6eC5zbGF3aW5za2lAbGludXguaW50ZWwuY29tPgotLS0KIHNvdW5k
L3NvYy9jb2RlY3MvaGRhY19oZG1pLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvaGRhY19oZG1pLmMgYi9z
b3VuZC9zb2MvY29kZWNzL2hkYWNfaGRtaS5jCmluZGV4IDkxMWJiNmUyYTFhYy4uOWVlMWJmZjU0
OGQ4IDEwMDY0NAotLS0gYS9zb3VuZC9zb2MvY29kZWNzL2hkYWNfaGRtaS5jCisrKyBiL3NvdW5k
L3NvYy9jb2RlY3MvaGRhY19oZG1pLmMKQEAgLTE4OTAsNiArMTg5MCwxMiBAQCBzdGF0aWMgdm9p
ZCBoZG1pX2NvZGVjX3JlbW92ZShzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCkK
IHsKIAlzdHJ1Y3QgaGRhY19oZG1pX3ByaXYgKmhkbWkgPSBzbmRfc29jX2NvbXBvbmVudF9nZXRf
ZHJ2ZGF0YShjb21wb25lbnQpOwogCXN0cnVjdCBoZGFjX2RldmljZSAqaGRldiA9IGhkbWktPmhk
ZXY7CisJaW50IHJldDsKKworCXJldCA9IHNuZF9oZGFjX2Fjb21wX3JlZ2lzdGVyX25vdGlmaWVy
KGhkZXYtPmJ1cywgTlVMTCk7CisJaWYgKHJldCA8IDApCisJCWRldl9lcnIoJmhkZXYtPmRldiwg
Im5vdGlmaWVyIHVucmVnaXN0ZXIgZmFpbGVkOiBlcnI6ICVkXG4iLAorCQkJCXJldCk7CiAKIAlw
bV9ydW50aW1lX2Rpc2FibGUoJmhkZXYtPmRldik7CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
