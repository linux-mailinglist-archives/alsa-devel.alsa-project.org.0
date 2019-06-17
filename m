Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6532C48108
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 13:40:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0445D16E4;
	Mon, 17 Jun 2019 13:39:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0445D16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560771648;
	bh=4CNQYP/UmLcEi8xNtqq9YS8ZiVZI9VNH088LSlZhm3s=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JJWCGIocETBnW9+jTAD02jcgrxo/xf0/xNs+8A/I8L7sT93stlVos7Cu+RyB6hV1v
	 5OclR+MDx5NDrrYdMOaQZ2QsWMS8EElWVE+PdmCnLh5TUyDcwfNGMQZeLIbUSTPNI5
	 fhuFupzl/fnixrAJT8nkMMOW1O1kq5bpeym3vPkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFE42F8974E;
	Mon, 17 Jun 2019 13:35:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F10FFF89740; Mon, 17 Jun 2019 13:35:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D93DF89738
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 13:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D93DF89738
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 04:35:06 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by fmsmga006.fm.intel.com with ESMTP; 17 Jun 2019 04:35:04 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 17 Jun 2019 13:36:39 +0200
Message-Id: <20190617113644.25621-7-amadeuszx.slawinski@linux.intel.com>
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
Subject: [alsa-devel] [PATCH v2 06/11] ASoC: Intel: Skylake: Add function to
	cleanup debugfs interface
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

Q3VycmVudGx5IGRlYnVnZnMgaGFzIG5vIGNsZWFudXAgZnVuY3Rpb24uIEFkZCBza2xfZGVidWZz
X2V4aXQgZnVuY3Rpb24Kc28gd2UgY2FuIGNsZWFuIGFmdGVyIG91cnNlbHZlcyBwcm9wZXJseS4K
ClNpZ25lZC1vZmYtYnk6IEFtYWRldXN6IFPFgmF3acWEc2tpIDxhbWFkZXVzenguc2xhd2luc2tp
QGxpbnV4LmludGVsLmNvbT4KLS0tCiBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wtZGVidWcu
YyB8IDkgKysrKysrKysrCiBzb3VuZC9zb2MvaW50ZWwvc2t5bGFrZS9za2wuaCAgICAgICB8IDUg
KysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Nv
dW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1kZWJ1Zy5jIGIvc291bmQvc29jL2ludGVsL3NreWxh
a2Uvc2tsLWRlYnVnLmMKaW5kZXggNjljYmU5ZWIwMjZiLi5iOWI0YTcyYTQzMzQgMTAwNjQ0Ci0t
LSBhL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1kZWJ1Zy5jCisrKyBiL3NvdW5kL3NvYy9p
bnRlbC9za3lsYWtlL3NrbC1kZWJ1Zy5jCkBAIC0yNTEsMyArMjUxLDEyIEBAIHN0cnVjdCBza2xf
ZGVidWcgKnNrbF9kZWJ1Z2ZzX2luaXQoc3RydWN0IHNrbCAqc2tsKQogCWRlYnVnZnNfcmVtb3Zl
X3JlY3Vyc2l2ZShkLT5mcyk7CiAJcmV0dXJuIE5VTEw7CiB9CisKK3ZvaWQgc2tsX2RlYnVnZnNf
ZXhpdChzdHJ1Y3Qgc2tsICpza2wpCit7CisJc3RydWN0IHNrbF9kZWJ1ZyAqZCA9IHNrbC0+ZGVi
dWdmczsKKworCWRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZShkLT5mcyk7CisKKwlkID0gTlVMTDsK
K30KZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC5oIGIvc291bmQvc29j
L2ludGVsL3NreWxha2Uvc2tsLmgKaW5kZXggZTc4NzBlYzgxYTliLi42ZmFiMWEyZTEzM2EgMTAw
NjQ0Ci0tLSBhL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC5oCisrKyBiL3NvdW5kL3NvYy9p
bnRlbC9za3lsYWtlL3NrbC5oCkBAIC0xNTUsNiArMTU1LDcgQEAgc3RydWN0IHNrbF9tb2R1bGVf
Y2ZnOwogCiAjaWZkZWYgQ09ORklHX0RFQlVHX0ZTCiBzdHJ1Y3Qgc2tsX2RlYnVnICpza2xfZGVi
dWdmc19pbml0KHN0cnVjdCBza2wgKnNrbCk7Cit2b2lkIHNrbF9kZWJ1Z2ZzX2V4aXQoc3RydWN0
IHNrbCAqc2tsKTsKIHZvaWQgc2tsX2RlYnVnX2luaXRfbW9kdWxlKHN0cnVjdCBza2xfZGVidWcg
KmQsCiAJCQlzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCAqdywKIAkJCXN0cnVjdCBza2xfbW9k
dWxlX2NmZyAqbWNvbmZpZyk7CkBAIC0xNjMsNiArMTY0LDEwIEBAIHN0YXRpYyBpbmxpbmUgc3Ry
dWN0IHNrbF9kZWJ1ZyAqc2tsX2RlYnVnZnNfaW5pdChzdHJ1Y3Qgc2tsICpza2wpCiB7CiAJcmV0
dXJuIE5VTEw7CiB9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCBza2xfZGVidWdmc19leGl0KHN0cnVj
dCBza2wgKnNrbCkKK3t9CisKIHN0YXRpYyBpbmxpbmUgdm9pZCBza2xfZGVidWdfaW5pdF9tb2R1
bGUoc3RydWN0IHNrbF9kZWJ1ZyAqZCwKIAkJCQkJIHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0
ICp3LAogCQkJCQkgc3RydWN0IHNrbF9tb2R1bGVfY2ZnICptY29uZmlnKQotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
