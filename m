Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E801C56BFD
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 16:31:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55361168E;
	Wed, 26 Jun 2019 16:30:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55361168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561559487;
	bh=1nLRPIKu4/LxwnbsTpL9UMsfqviXhSWcUMsnlZvaEiA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DvCS3UgnY+O5TMPONMIMvZyp1NyxQoGarKGkD4Gnmz3KTpDp9I8orv5ZhECJlDhN9
	 1pYetxfwa8cD3E9QrNlDlZELQH2mCtdVluGwF/GFpNqjBRUxj7wO1qDX0hKffkaRDn
	 f2jWv4XPim4/WR5DcxVsCoHOviKCHapLSsuzxz4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB040F8070C;
	Wed, 26 Jun 2019 16:29:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75C29F896B9; Wed, 26 Jun 2019 16:29:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B7BEF8070C
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 16:29:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B7BEF8070C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 07:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,420,1557212400"; d="scan'208";a="183181947"
Received: from xxx.igk.intel.com ([10.237.93.170])
 by fmsmga001.fm.intel.com with ESMTP; 26 Jun 2019 07:29:29 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 26 Jun 2019 16:33:26 +0200
Message-Id: <20190626143326.22515-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [alsa-devel] [PATCH v3 1/1] ASoC: Intel: Skylake: Remove static
	table index when parsing topology
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

Q3VycmVudGx5IHdoZW4gd2UgcmVtb3ZlIGFuZCByZWxvYWQgZHJpdmVyIHdlIHVzZSBwcmV2aW91
cyByZWZfY291bnQKdmFsdWUgdG8gc3RhcnQgaXRlcmF0aW5nIG92ZXIgc2tsLT5tb2R1bGVzIHdo
aWNoIGxlYWRzIHRvIG91dCBvZiB0YWJsZQphY2Nlc3MuIFRvIGZpeCB0aGlzIGp1c3QgaW5saW5l
IHRoZSBmdW5jdGlvbiBhbmQgY2FsY3VsYXRlIGluZGV4ZXMKZXZlcnl0aW1lIHdlIHBhcnNlIFVV
SUQgdG9rZW4uCgpDaGFuZ2UtSWQ6IEljMWRlMDYxNDM1NzljMTJlYjE1MTIwZDVkN2MyMTk3Njdh
OTM5MDQyClNpZ25lZC1vZmYtYnk6IEFtYWRldXN6IFPFgmF3acWEc2tpIDxhbWFkZXVzenguc2xh
d2luc2tpQGxpbnV4LmludGVsLmNvbT4KLS0tCiBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wt
dG9wb2xvZ3kuYyB8IDM0ICsrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQv
c29jL2ludGVsL3NreWxha2Uvc2tsLXRvcG9sb2d5LmMgYi9zb3VuZC9zb2MvaW50ZWwvc2t5bGFr
ZS9za2wtdG9wb2xvZ3kuYwppbmRleCA2MjQxZTM1MjEzYWYuLjZmOTkxYWY3YWYyMyAxMDA2NDQK
LS0tIGEvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLXRvcG9sb2d5LmMKKysrIGIvc291bmQv
c29jL2ludGVsL3NreWxha2Uvc2tsLXRvcG9sb2d5LmMKQEAgLTM0NjUsMjUgKzM0NjUsNiBAQCBz
dGF0aWMgaW50IHNrbF90cGxnX2dldF9pbnRfdGtuKHN0cnVjdCBkZXZpY2UgKmRldiwKIAlyZXR1
cm4gdGtuX2NvdW50OwogfQogCi1zdGF0aWMgaW50IHNrbF90cGxnX2dldF9tYW5pZmVzdF91dWlk
KHN0cnVjdCBkZXZpY2UgKmRldiwKLQkJCQlzdHJ1Y3Qgc2tsICpza2wsCi0JCQkJc3RydWN0IHNu
ZF9zb2NfdHBsZ192ZW5kb3JfdXVpZF9lbGVtICp1dWlkX3RrbikKLXsKLQlzdGF0aWMgaW50IHJl
Zl9jb3VudDsKLQlzdHJ1Y3Qgc2tsX21vZHVsZSAqbW9kOwotCi0JaWYgKHV1aWRfdGtuLT50b2tl
biA9PSBTS0xfVEtOX1VVSUQpIHsKLQkJbW9kID0gc2tsLT5tb2R1bGVzW3JlZl9jb3VudF07Ci0J
CWd1aWRfY29weSgmbW9kLT51dWlkLCAoZ3VpZF90ICopJnV1aWRfdGtuLT51dWlkKTsKLQkJcmVm
X2NvdW50Kys7Ci0JfSBlbHNlIHsKLQkJZGV2X2VycihkZXYsICJOb3QgYW4gVVVJRCB0b2tlbiB0
a24gJWRcbiIsIHV1aWRfdGtuLT50b2tlbik7Ci0JCXJldHVybiAtRUlOVkFMOwotCX0KLQotCXJl
dHVybiAwOwotfQotCiAvKgogICogRmlsbCB0aGUgbWFuaWZlc3Qgc3RydWN0dXJlIGJ5IHBhcnNp
bmcgdGhlIHRva2VucyBiYXNlZCBvbiB0aGUKICAqIHR5cGUuCkBAIC0zNDk0LDYgKzM0NzUsNyBA
QCBzdGF0aWMgaW50IHNrbF90cGxnX2dldF9tYW5pZmVzdF90a24oc3RydWN0IGRldmljZSAqZGV2
LAogewogCWludCB0a25fY291bnQgPSAwLCByZXQ7CiAJaW50IG9mZiA9IDAsIHR1cGxlX3NpemUg
PSAwOworCXU4IHV1aWRfaW5kZXggPSAwOwogCXN0cnVjdCBzbmRfc29jX3RwbGdfdmVuZG9yX2Fy
cmF5ICphcnJheTsKIAlzdHJ1Y3Qgc25kX3NvY190cGxnX3ZlbmRvcl92YWx1ZV9lbGVtICp0a25f
ZWxlbTsKIApAQCAtMzUxNiw5ICszNDk4LDE3IEBAIHN0YXRpYyBpbnQgc2tsX3RwbGdfZ2V0X21h
bmlmZXN0X3RrbihzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJCQljb250aW51ZTsKIAogCQljYXNlIFNO
RF9TT0NfVFBMR19UVVBMRV9UWVBFX1VVSUQ6Ci0JCQlyZXQgPSBza2xfdHBsZ19nZXRfbWFuaWZl
c3RfdXVpZChkZXYsIHNrbCwgYXJyYXktPnV1aWQpOwotCQkJaWYgKHJldCA8IDApCi0JCQkJcmV0
dXJuIHJldDsKKwkJCWlmIChhcnJheS0+dXVpZC0+dG9rZW4gIT0gU0tMX1RLTl9VVUlEKSB7CisJ
CQkJZGV2X2VycihkZXYsICJOb3QgYW4gVVVJRCB0b2tlbjogJWRcbiIsCisJCQkJCWFycmF5LT51
dWlkLT50b2tlbik7CisJCQkJcmV0dXJuIC1FSU5WQUw7CisJCQl9CisJCQlpZiAodXVpZF9pbmRl
eCA+PSBza2wtPm5yX21vZHVsZXMpIHsKKwkJCQlkZXZfZXJyKGRldiwgIlRvbyBtYW55IFVVSUQg
dG9rZW5zXG4iKTsKKwkJCQlyZXR1cm4gLUVJTlZBTDsKKwkJCX0KKwkJCWd1aWRfY29weSgmc2ts
LT5tb2R1bGVzW3V1aWRfaW5kZXgrK10tPnV1aWQsCisJCQkJICAoZ3VpZF90ICopJmFycmF5LT51
dWlkLT51dWlkKTsKIAogCQkJdHVwbGVfc2l6ZSArPSBzaXplb2YoKmFycmF5LT51dWlkKTsKIAkJ
CWNvbnRpbnVlOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbHNhLWRldmVsCg==
