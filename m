Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C0513AAC5
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:23:28 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B633722F9;
	Mon, 13 Jan 2020 21:57:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B633722F9
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4212FF8014B;
	Mon, 13 Jan 2020 21:56:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DF87F801EB; Mon, 13 Jan 2020 21:56:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3BABF80149
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 21:56:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3BABF80149
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 12:56:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,430,1571727600"; d="scan'208";a="397270458"
Received: from pboliset-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.152.72])
 by orsmga005.jf.intel.com with ESMTP; 13 Jan 2020 12:56:27 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 13 Jan 2020 14:56:20 -0600
Message-Id: <20200113205620.27285-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: SOF: Intel: hda-dai: fix compilation
	warning in pcm_prepare
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

Rml4IEdDQyB3YXJuaW5nIHdpdGggVz0xLCBwcmV2aW91cyBjbGVhbnVwIGRpZCBub3QgcmVtb3Zl
IHVubmVjZXNzYXJ5CnZhcmlhYmxlLgoKc291bmQvc29jL3NvZi9pbnRlbC9oZGEtZGFpLmM6IElu
IGZ1bmN0aW9uIOKAmGhkYV9saW5rX3BjbV9wcmVwYXJl4oCZOgoKc291bmQvc29jL3NvZi9pbnRl
bC9oZGEtZGFpLmM6MjY1OjMxOiB3YXJuaW5nOiB2YXJpYWJsZSDigJhoZGFfc3RyZWFt4oCZCnNl
dCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCiAgMjY1IHwgIHN0cnVj
dCBzb2ZfaW50ZWxfaGRhX3N0cmVhbSAqaGRhX3N0cmVhbTsKICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+CgpGaXhlczogYTNlYmNjYjUyZWZkZiAoIkFTb0M6
IFNPRjogSW50ZWw6IGhkYTogcmVzZXQgbGluayBETUEgc3RhdGUgaW4gcHJlcGFyZSIpCkNjOiBL
YWkgVmVobWFuZW4gPGthaS52ZWhtYW5lbkBsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6
IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5j
b20+Ci0tLQogc291bmQvc29jL3NvZi9pbnRlbC9oZGEtZGFpLmMgfCAzIC0tLQogMSBmaWxlIGNo
YW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NvZi9pbnRlbC9o
ZGEtZGFpLmMgYi9zb3VuZC9zb2Mvc29mL2ludGVsL2hkYS1kYWkuYwppbmRleCAzMTM2MTFkY2I1
ZTQuLjljNmUzZjk5MGVlMyAxMDA2NDQKLS0tIGEvc291bmQvc29jL3NvZi9pbnRlbC9oZGEtZGFp
LmMKKysrIGIvc291bmQvc29jL3NvZi9pbnRlbC9oZGEtZGFpLmMKQEAgLTI2MiwxNCArMjYyLDEx
IEBAIHN0YXRpYyBpbnQgaGRhX2xpbmtfcGNtX3ByZXBhcmUoc3RydWN0IHNuZF9wY21fc3Vic3Ry
ZWFtICpzdWJzdHJlYW0sCiB7CiAJc3RydWN0IGhkYWNfZXh0X3N0cmVhbSAqbGlua19kZXYgPQog
CQkJCXNuZF9zb2NfZGFpX2dldF9kbWFfZGF0YShkYWksIHN1YnN0cmVhbSk7Ci0Jc3RydWN0IHNv
Zl9pbnRlbF9oZGFfc3RyZWFtICpoZGFfc3RyZWFtOwogCXN0cnVjdCBzbmRfc29mX2RldiAqc2Rl
diA9CiAJCQkJc25kX3NvY19jb21wb25lbnRfZ2V0X2RydmRhdGEoZGFpLT5jb21wb25lbnQpOwog
CXN0cnVjdCBzbmRfc29jX3BjbV9ydW50aW1lICpydGQgPSBzbmRfcGNtX3N1YnN0cmVhbV9jaGlw
KHN1YnN0cmVhbSk7CiAJaW50IHN0cmVhbSA9IHN1YnN0cmVhbS0+c3RyZWFtOwogCi0JaGRhX3N0
cmVhbSA9IGhzdHJlYW1fdG9fc29mX2hkYV9zdHJlYW0obGlua19kZXYpOwotCiAJaWYgKGxpbmtf
ZGV2LT5saW5rX3ByZXBhcmVkKQogCQlyZXR1cm4gMDsKIAotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcg
bGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
