Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 872019EAAA
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 16:16:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8317E1670;
	Tue, 27 Aug 2019 16:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8317E1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566915391;
	bh=uOBnbBJX+FcGbXVs8qahuUbgjo3Y0HG4ut6DMaOPLrU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WEpfLStl7cZi5xGp95c2xHqwQdfsXdHjJK0I015HWoTeoYjrIpBU9YQ7ppoQ14bGs
	 H6o0MTdqVTQMLE9Cw0Co+UeCd1q9SGt460xwUxXCnm9RUpSu78uYAxRfcglW7hEFRe
	 QJc4v3HTEUdkFVGoosaAfUhLiDipVnsMLs50SL4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E3CBF805FA;
	Tue, 27 Aug 2019 16:13:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77370F805F5; Tue, 27 Aug 2019 16:13:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D0C5F80273
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 16:13:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D0C5F80273
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 07:12:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="264282427"
Received: from xxx.igk.intel.com ([10.237.93.170])
 by orsmga001.jf.intel.com with ESMTP; 27 Aug 2019 07:12:57 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 27 Aug 2019 16:17:09 +0200
Message-Id: <20190827141712.21015-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190827141712.21015-1-amadeuszx.slawinski@linux.intel.com>
References: <20190827141712.21015-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@intel.com>
Subject: [alsa-devel] [PATCH 3/6] ASoC: dapm: Expose
	snd_soc_dapm_new_control_unlocked properly
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

RnJvbTogQW1hZGV1c3ogU8WCYXdpxYRza2kgPGFtYWRldXN6eC5zbGF3aW5za2lAaW50ZWwuY29t
PgoKV2UgdXNlIHNuZF9zb2NfZGFwbV9uZXdfY29udHJvbF91bmxvY2tlZCBmb3IgdG9wb2xvZ3kg
YW5kIGhhdmUgbG9jYWwKZGVjbGFyYXRpb24sIGluc3RlYWQgZGVjbGFyZSBpdCBwcm9wZXJseSBp
biBoZWFkZXIgbGlrZSBhbHJlYWR5IGRlY2xhcmVkCnNuZF9zb2NfZGFwbV9uZXdfY29udHJvbC4K
ClNpZ25lZC1vZmYtYnk6IEFtYWRldXN6IFPFgmF3acWEc2tpIDxhbWFkZXVzenguc2xhd2luc2tp
QGludGVsLmNvbT4KLS0tCiBpbmNsdWRlL3NvdW5kL3NvYy1kYXBtLmggfCAzICsrKwogc291bmQv
c29jL3NvYy10b3BvbG9neS5jIHwgNiAtLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvc291bmQvc29jLWRh
cG0uaCBiL2luY2x1ZGUvc291bmQvc29jLWRhcG0uaAppbmRleCAyYWE3M2Q2ZGQ3YmUuLjMwZDhk
MDQxMDk1MiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9zb3VuZC9zb2MtZGFwbS5oCisrKyBiL2luY2x1
ZGUvc291bmQvc29jLWRhcG0uaApAQCAtNDA0LDYgKzQwNCw5IEBAIGludCBzbmRfc29jX2RhcG1f
bmV3X2NvbnRyb2xzKHN0cnVjdCBzbmRfc29jX2RhcG1fY29udGV4dCAqZGFwbSwKIHN0cnVjdCBz
bmRfc29jX2RhcG1fd2lkZ2V0ICpzbmRfc29jX2RhcG1fbmV3X2NvbnRyb2woCiAJCXN0cnVjdCBz
bmRfc29jX2RhcG1fY29udGV4dCAqZGFwbSwKIAkJY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFwbV93
aWRnZXQgKndpZGdldCk7CitzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCAqc25kX3NvY19kYXBt
X25ld19jb250cm9sX3VubG9ja2VkKAorCQlzdHJ1Y3Qgc25kX3NvY19kYXBtX2NvbnRleHQgKmRh
cG0sCisJCWNvbnN0IHN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0ICp3aWRnZXQpOwogaW50IHNu
ZF9zb2NfZGFwbV9uZXdfZGFpX3dpZGdldHMoc3RydWN0IHNuZF9zb2NfZGFwbV9jb250ZXh0ICpk
YXBtLAogCQkJCSBzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSk7CiBpbnQgc25kX3NvY19kYXBtX2xp
bmtfZGFpX3dpZGdldHMoc3RydWN0IHNuZF9zb2NfY2FyZCAqY2FyZCk7CmRpZmYgLS1naXQgYS9z
b3VuZC9zb2Mvc29jLXRvcG9sb2d5LmMgYi9zb3VuZC9zb2Mvc29jLXRvcG9sb2d5LmMKaW5kZXgg
Yjg2OTA3MTVhYmI1Li5hYTlhMWZjYTQ2ZmEgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zb2MtdG9w
b2xvZ3kuYworKysgYi9zb3VuZC9zb2Mvc29jLXRvcG9sb2d5LmMKQEAgLTgwLDEyICs4MCw2IEBA
IHN0cnVjdCBzb2NfdHBsZyB7CiAKIHN0YXRpYyBpbnQgc29jX3RwbGdfcHJvY2Vzc19oZWFkZXJz
KHN0cnVjdCBzb2NfdHBsZyAqdHBsZyk7CiBzdGF0aWMgdm9pZCBzb2NfdHBsZ19jb21wbGV0ZShz
dHJ1Y3Qgc29jX3RwbGcgKnRwbGcpOwotc3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQgKgotc25k
X3NvY19kYXBtX25ld19jb250cm9sX3VubG9ja2VkKHN0cnVjdCBzbmRfc29jX2RhcG1fY29udGV4
dCAqZGFwbSwKLQkJCSBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCAqd2lkZ2V0KTsK
LXN0cnVjdCBzbmRfc29jX2RhcG1fd2lkZ2V0ICoKLXNuZF9zb2NfZGFwbV9uZXdfY29udHJvbChz
dHJ1Y3Qgc25kX3NvY19kYXBtX2NvbnRleHQgKmRhcG0sCi0JCQkgY29uc3Qgc3RydWN0IHNuZF9z
b2NfZGFwbV93aWRnZXQgKndpZGdldCk7CiBzdGF0aWMgdm9pZCBzb2NfdHBsZ19kZW51bV9yZW1v
dmVfdGV4dHMoc3RydWN0IHNvY19lbnVtICpzZSk7CiBzdGF0aWMgdm9pZCBzb2NfdHBsZ19kZW51
bV9yZW1vdmVfdmFsdWVzKHN0cnVjdCBzb2NfZW51bSAqc2UpOwogCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFp
bGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxz
YS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
