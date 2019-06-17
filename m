Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3658B480E8
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 13:37:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1BF3171D;
	Mon, 17 Jun 2019 13:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1BF3171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560771445;
	bh=n84SS8HEnJLiffOiKlbalBUV0ejbC1qadBWRFLT47+0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ufU9lSs23bfs9gT6oegeeTjJ5m1056R3cyySlgAitG9b7HND2VwzPmCB3iMR77dxg
	 QoSL6c4mh3ljfutNbMHADJRzfg2ZT1URmpzhcdpgCIN2HYDxLMoEZ5b7uqvJq3pou6
	 yeMalCyR4wY6sEW8vbwPsY6Bp5bq77dt47ipaeBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6EE5F89732;
	Mon, 17 Jun 2019 13:35:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C0FEF80764; Mon, 17 Jun 2019 13:34:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9DB6F80764
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 13:34:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9DB6F80764
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 04:34:54 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by fmsmga006.fm.intel.com with ESMTP; 17 Jun 2019 04:34:51 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 17 Jun 2019 13:36:34 +0200
Message-Id: <20190617113644.25621-2-amadeuszx.slawinski@linux.intel.com>
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
Subject: [alsa-devel] [PATCH v2 01/11] ASoC: Intel: Skylake: Initialize
	lists before access so they are safe to use
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

SWYgc2tsX3Byb2JlX3dvcmsoKSB3YXMgbm90IHJ1biBkcml2ZXIgZW5kcyB1cCBkZXJlZmVyZW5j
aW5nIE5VTEwKcG9pbnRlciB3aGVuIG9wZXJhdGluZyBvbiBsaXN0cyBpbiBza2xfcGxhdGZvcm1f
dW5yZWdpc3RlcigpLgpUbyBmaXggdGhpcyBpbml0aWFsaXplIGxpc3RzIGluIHNrbF9jcmVhdGUo
KS4gQWxzbyBydW4KY2FuY2VsX3dvcmtfc3luYygpIGJlZm9yZSBhbGwgY2xlYW51cCBmdW5jdGlv
bnMsIHNvIHdlIGRvbid0IGVuZCB1cAp1bm5lY2Vzc2FyaWx5IHJ1bm5pbmcgcHJvYmUgd29yay4K
CkVhc2lseSByZXByb2R1Y2libGUgd2l0aDoKd2hpbGUgdHJ1ZTsgZG8gbW9kcHJvYmUgc25kX3Nv
Y19za2w7IHJtbW9kIHNuZF9zb2Nfc2tsOyBkb25lCih3aXRoIHRoZSBhc3N1bXB0aW9uIHRoYXQg
cmVsZXZhbnQgZHJpdmVycyBhcmUgYWRkZWQgdG8gYmxhY2tsaXN0IG9uCnN5c3RlbSBib290KQoK
U2lnbmVkLW9mZi1ieTogQW1hZGV1c3ogU8WCYXdpxYRza2kgPGFtYWRldXN6eC5zbGF3aW5za2lA
bGludXguaW50ZWwuY29tPgotLS0KIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1wY20uYyB8
IDMgLS0tCiBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wuYyAgICAgfCA1ICsrKystCiAyIGZp
bGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9zb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtcGNtLmMgYi9zb3VuZC9zb2MvaW50ZWwvc2t5
bGFrZS9za2wtcGNtLmMKaW5kZXggOGI3MjMyZDNmZmVlLi40ODllY2VmMzExYWQgMTAwNjQ0Ci0t
LSBhL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1wY20uYworKysgYi9zb3VuZC9zb2MvaW50
ZWwvc2t5bGFrZS9za2wtcGNtLmMKQEAgLTE0NzcsOSArMTQ3Nyw2IEBAIGludCBza2xfcGxhdGZv
cm1fcmVnaXN0ZXIoc3RydWN0IGRldmljZSAqZGV2KQogCXN0cnVjdCBoZGFjX2J1cyAqYnVzID0g
ZGV2X2dldF9kcnZkYXRhKGRldik7CiAJc3RydWN0IHNrbCAqc2tsID0gYnVzX3RvX3NrbChidXMp
OwogCi0JSU5JVF9MSVNUX0hFQUQoJnNrbC0+cHBsX2xpc3QpOwotCUlOSVRfTElTVF9IRUFEKCZz
a2wtPmJpbmRfbGlzdCk7Ci0KIAlza2wtPmRhaXMgPSBrbWVtZHVwKHNrbF9wbGF0Zm9ybV9kYWks
IHNpemVvZihza2xfcGxhdGZvcm1fZGFpKSwKIAkJCSAgICBHRlBfS0VSTkVMKTsKIAlpZiAoIXNr
bC0+ZGFpcykgewpkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLmMgYi9z
b3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wuYwppbmRleCBmYzc5NDAxY2Q0NzQuLmNhZTk3YzY1
ZWVmOCAxMDA2NDQKLS0tIGEvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLmMKKysrIGIvc291
bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLmMKQEAgLTQzMCw3ICs0MzAsNiBAQCBzdGF0aWMgaW50
IHNrbF9mcmVlKHN0cnVjdCBoZGFjX2J1cyAqYnVzKQogCiAJc25kX2hkYWNfZXh0X2J1c19leGl0
KGJ1cyk7CiAKLQljYW5jZWxfd29ya19zeW5jKCZza2wtPnByb2JlX3dvcmspOwogCWlmIChJU19F
TkFCTEVEKENPTkZJR19TTkRfU09DX0hEQUNfSERNSSkpIHsKIAkJc25kX2hkYWNfZGlzcGxheV9w
b3dlcihidXMsIEhEQV9DT0RFQ19JRFhfQ09OVFJPTExFUiwgZmFsc2UpOwogCQlzbmRfaGRhY19p
OTE1X2V4aXQoYnVzKTsKQEAgLTg1OSw2ICs4NTgsOSBAQCBzdGF0aWMgaW50IHNrbF9jcmVhdGUo
c3RydWN0IHBjaV9kZXYgKnBjaSwKIAloYnVzID0gc2tsX3RvX2hidXMoc2tsKTsKIAlidXMgPSBz
a2xfdG9fYnVzKHNrbCk7CiAKKwlJTklUX0xJU1RfSEVBRCgmc2tsLT5wcGxfbGlzdCk7CisJSU5J
VF9MSVNUX0hFQUQoJnNrbC0+YmluZF9saXN0KTsKKwogI2lmIElTX0VOQUJMRUQoQ09ORklHX1NO
RF9TT0NfSU5URUxfU0tZTEFLRV9IREFVRElPX0NPREVDKQogCWV4dF9vcHMgPSBzbmRfc29jX2hk
YWNfaGRhX2dldF9vcHMoKTsKICNlbmRpZgpAQCAtMTEwOCw2ICsxMTEwLDcgQEAgc3RhdGljIHZv
aWQgc2tsX3JlbW92ZShzdHJ1Y3QgcGNpX2RldiAqcGNpKQogCXN0cnVjdCBoZGFjX2J1cyAqYnVz
ID0gcGNpX2dldF9kcnZkYXRhKHBjaSk7CiAJc3RydWN0IHNrbCAqc2tsID0gYnVzX3RvX3NrbChi
dXMpOwogCisJY2FuY2VsX3dvcmtfc3luYygmc2tsLT5wcm9iZV93b3JrKTsKIAlyZWxlYXNlX2Zp
cm13YXJlKHNrbC0+dHBsZyk7CiAKIAlwbV9ydW50aW1lX2dldF9ub3Jlc3VtZSgmcGNpLT5kZXYp
OwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcK
aHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRl
dmVsCg==
