Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D9035E55
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2019 15:50:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B77D166E;
	Wed,  5 Jun 2019 15:49:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B77D166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559742611;
	bh=4oIs3JMO2NLj6r4RUX2vU1RhpWuOj89cboTUOBIaqfI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r5xX4sZT5sMI6Z/BafK7UcNMGDZnwmdcp8o+5i8LFxrLjUngnA5Y9sz2WuQYJCubQ
	 lzBXwX/t3+fsDbAnoy0hrsx+dUOAmXcqAhcTLjMmXGfQVJoLAK5QuniCgqVn7zxNWj
	 tgKmRD+HZS/LbHX5Kkj7huL/XSYijz8Vjh995lz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF28BF8975D;
	Wed,  5 Jun 2019 15:42:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4F05F8975A; Wed,  5 Jun 2019 15:42:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80734F89750
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 15:42:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80734F89750
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2019 06:42:41 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by orsmga004.jf.intel.com with ESMTP; 05 Jun 2019 06:42:39 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  5 Jun 2019 15:45:51 +0200
Message-Id: <20190605134556.10322-10-amadeuszx.slawinski@linux.intel.com>
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
Subject: [alsa-devel] [PATCH 09/14] ASoC: Intel: Skylake: Fix NULL ptr
	dereference when unloading clk dev
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

V2hlbiBkcml2ZXIgaXMgcHJvYmVkLCB3ZSBpdGVyYXRlIG92ZXIgTkhMVCBhbmQgY2hlY2sgaWYg
Y2xrIGVudHJpZXMgYXJlCnByZXNlbnQuIEZvciBlYWNoIHN1Y2ggZW50cnkgd2UgY2FsbCByZWdp
c3Rlcl9za2xfY2xrIGFuZCBrZWVwIHRoZQpyZXN1bHQgaW4gZGF0YS0+Y2xrW10uCkN1cnJlbnRs
eSBkYXRhLT5jbGsgaXMgc3BhcnNlbHkgaW5kZXhlZCB1c2luZyBOSExUIHRhYmxlIGl0ZXJhdG9y
LCB3aGlsZQp3aGVuIGZyZWVpbmcgd2UgdXNlIG51bWJlciBvZiByZWdpc3RlcmVkIGVudHJpZXMu
IExldCdzIGp1c3QgdXNlCmRhdGEtPmF2YWlsX2Nsa19jbnQgYXMgaW5kZXgsIHNvIGl0IGNhbiBi
ZSByZXNldCBiYWNrIGluCnVucmVnaXN0ZXJfc3JjX2Nsay4KClNpZ25lZC1vZmYtYnk6IEFtYWRl
dXN6IFPFgmF3acWEc2tpIDxhbWFkZXVzenguc2xhd2luc2tpQGxpbnV4LmludGVsLmNvbT4KLS0t
CiBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtc3NwLWNsay5jIHwgMTYgKysrKysrKy0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtc3NwLWNsay5jIGIvc291bmQv
c29jL2ludGVsL3NreWxha2Uvc2tsLXNzcC1jbGsuYwppbmRleCBjZGExYjVmYTc0MzYuLjViYjZl
NDBkNGQzZSAxMDA2NDQKLS0tIGEvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXNzcC1jbGsu
YworKysgYi9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtc3NwLWNsay5jCkBAIC0yNzYsMTAg
KzI3Niw4IEBAIHN0YXRpYyB2b2lkIHVucmVnaXN0ZXJfcGFyZW50X3NyY19jbGsoc3RydWN0IHNr
bF9jbGtfcGFyZW50ICpwY2xrLAogCiBzdGF0aWMgdm9pZCB1bnJlZ2lzdGVyX3NyY19jbGsoc3Ry
dWN0IHNrbF9jbGtfZGF0YSAqZGNsaykKIHsKLQl1OCBjbnQgPSBkY2xrLT5hdmFpbF9jbGtfY250
OwotCi0Jd2hpbGUgKGNudC0tKQotCQljbGtkZXZfZHJvcChkY2xrLT5jbGtbY250XS0+bG9va3Vw
KTsKKwl3aGlsZSAoZGNsay0+YXZhaWxfY2xrX2NudC0tKQorCQljbGtkZXZfZHJvcChkY2xrLT5j
bGtbZGNsay0+YXZhaWxfY2xrX2NudF0tPmxvb2t1cCk7CiB9CiAKIHN0YXRpYyBpbnQgc2tsX3Jl
Z2lzdGVyX3BhcmVudF9jbGtzKHN0cnVjdCBkZXZpY2UgKmRldiwKQEAgLTM4MSwxMyArMzc5LDEz
IEBAIHN0YXRpYyBpbnQgc2tsX2Nsa19kZXZfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAkJaWYgKGNsa3NbaV0ucmF0ZV9jZmdbMF0ucmF0ZSA9PSAwKQogCQkJY29udGludWU7
CiAKLQkJZGF0YS0+Y2xrW2ldID0gcmVnaXN0ZXJfc2tsX2NsayhkZXYsICZjbGtzW2ldLCBjbGtf
cGRhdGEsIGkpOwotCQlpZiAoSVNfRVJSKGRhdGEtPmNsa1tpXSkpIHsKLQkJCXJldCA9IFBUUl9F
UlIoZGF0YS0+Y2xrW2ldKTsKKwkJZGF0YS0+Y2xrW2RhdGEtPmF2YWlsX2Nsa19jbnRdID0gcmVn
aXN0ZXJfc2tsX2NsayhkZXYsCisJCQkJJmNsa3NbaV0sIGNsa19wZGF0YSwgaSk7CisKKwkJaWYg
KElTX0VSUihkYXRhLT5jbGtbZGF0YS0+YXZhaWxfY2xrX2NudF0pKSB7CisJCQlyZXQgPSBQVFJf
RVJSKGRhdGEtPmNsa1tkYXRhLT5hdmFpbF9jbGtfY250KytdKTsKIAkJCWdvdG8gZXJyX3VucmVn
X3NrbF9jbGs7CiAJCX0KLQotCQlkYXRhLT5hdmFpbF9jbGtfY250Kys7CiAJfQogCiAJcGxhdGZv
cm1fc2V0X2RydmRhdGEocGRldiwgZGF0YSk7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
