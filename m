Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C47A35E4E
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2019 15:49:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3DC61684;
	Wed,  5 Jun 2019 15:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3DC61684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559742566;
	bh=okxNmnUGEdbHB2KGH27MDypOyNd5SVevPMkSwuRjjMw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JZnmFWNMxGSlTFZGs1SlbnWeXChYtiecJf9msqXN7S5TARvslhUfQSA+UC9A8rNOR
	 uc1tNwLjneE0duHttRULGSjDGoQ9dRMrtJtXCYZj87rTHaBb9fn21q0e5xIkPs2b4h
	 9AfLd6iAD7gqtFxkRzIpmEvTPagPgeeatmlvnzd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 576B0F89758;
	Wed,  5 Jun 2019 15:42:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14B54F89750; Wed,  5 Jun 2019 15:42:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3462F89747
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 15:42:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3462F89747
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2019 06:42:36 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by orsmga004.jf.intel.com with ESMTP; 05 Jun 2019 06:42:33 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  5 Jun 2019 15:45:49 +0200
Message-Id: <20190605134556.10322-8-amadeuszx.slawinski@linux.intel.com>
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
Subject: [alsa-devel] [PATCH 07/14] ASoC: Intel: Skylake: Add function to
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
a2Uvc2tsLWRlYnVnLmMKaW5kZXggNWQ3YWMyZWU3YTNjLi5lODFjM2RhZmMwZDAgMTAwNjQ0Ci0t
LSBhL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1kZWJ1Zy5jCisrKyBiL3NvdW5kL3NvYy9p
bnRlbC9za3lsYWtlL3NrbC1kZWJ1Zy5jCkBAIC0yNTksMyArMjU5LDEyIEBAIHN0cnVjdCBza2xf
ZGVidWcgKnNrbF9kZWJ1Z2ZzX2luaXQoc3RydWN0IHNrbCAqc2tsKQogCWRlYnVnZnNfcmVtb3Zl
X3JlY3Vyc2l2ZShkLT5mcyk7CiAJcmV0dXJuIE5VTEw7CiB9CisKK3ZvaWQgc2tsX2RlYnVnZnNf
ZXhpdChzdHJ1Y3Qgc2tsICpza2wpCit7CisJc3RydWN0IHNrbF9kZWJ1ZyAqZCA9IHNrbC0+ZGVi
dWdmczsKKworCWRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZShkLT5mcyk7CisKKwlkID0gTlVMTDsK
K30KZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC5oIGIvc291bmQvc29j
L2ludGVsL3NreWxha2Uvc2tsLmgKaW5kZXggODVmOGJiNjY4N2RjLi5kMmUyNjk4NjdhNDQgMTAw
NjQ0Ci0tLSBhL3NvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC5oCisrKyBiL3NvdW5kL3NvYy9p
bnRlbC9za3lsYWtlL3NrbC5oCkBAIC0xNjQsNiArMTY0LDcgQEAgc3RydWN0IHNrbF9tb2R1bGVf
Y2ZnOwogCiAjaWZkZWYgQ09ORklHX0RFQlVHX0ZTCiBzdHJ1Y3Qgc2tsX2RlYnVnICpza2xfZGVi
dWdmc19pbml0KHN0cnVjdCBza2wgKnNrbCk7Cit2b2lkIHNrbF9kZWJ1Z2ZzX2V4aXQoc3RydWN0
IHNrbCAqc2tsKTsKIHZvaWQgc2tsX2RlYnVnX2luaXRfbW9kdWxlKHN0cnVjdCBza2xfZGVidWcg
KmQsCiAJCQlzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCAqdywKIAkJCXN0cnVjdCBza2xfbW9k
dWxlX2NmZyAqbWNvbmZpZyk7CkBAIC0xNzIsNiArMTczLDEwIEBAIHN0YXRpYyBpbmxpbmUgc3Ry
dWN0IHNrbF9kZWJ1ZyAqc2tsX2RlYnVnZnNfaW5pdChzdHJ1Y3Qgc2tsICpza2wpCiB7CiAJcmV0
dXJuIE5VTEw7CiB9CisKK3N0YXRpYyBpbmxpbmUgdm9pZCBza2xfZGVidWdmc19leGl0KHN0cnVj
dCBza2wgKnNrbCkKK3t9CisKIHN0YXRpYyBpbmxpbmUgdm9pZCBza2xfZGVidWdfaW5pdF9tb2R1
bGUoc3RydWN0IHNrbF9kZWJ1ZyAqZCwKIAkJCQkJIHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0
ICp3LAogCQkJCQkgc3RydWN0IHNrbF9tb2R1bGVfY2ZnICptY29uZmlnKQotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
