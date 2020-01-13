Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E998313AA72
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:15:41 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B7BB26C6;
	Mon, 13 Jan 2020 22:21:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B7BB26C6
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8811FF802A2;
	Mon, 13 Jan 2020 22:14:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6B89F802A0; Mon, 13 Jan 2020 22:14:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 234A7F80290
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 22:14:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 234A7F80290
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jan 2020 13:14:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,430,1571727600"; d="scan'208";a="218775932"
Received: from pboliset-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.152.72])
 by fmsmga007.fm.intel.com with ESMTP; 13 Jan 2020 13:14:16 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 13 Jan 2020 15:14:05 -0600
Message-Id: <20200113211405.28070-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113211405.28070-1-pierre-louis.bossart@linux.intel.com>
References: <20200113211405.28070-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/2] ALSA: HDA: patch_hdmi: remove warnings
	with empty body
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

bWFrZSBXPTEgcmVwb3J0cyB0aGUgZm9sbG93aW5nIHdhcm5pbmdzLCBmaXggYXMgc3VnZ2VzdGVk
Cgpzb3VuZC9wY2kvaGRhL3BhdGNoX2hkbWkuYzogSW4gZnVuY3Rpb24g4oCYaGRtaV9ub25faW50
cmluc2ljX2V2ZW504oCZOgpzb3VuZC9wY2kvaGRhL3BhdGNoX2hkbWkuYzo4MjQ6Mzogd2Fybmlu
Zzogc3VnZ2VzdCBicmFjZXMgYXJvdW5kIGVtcHR5CmJvZHkgaW4gYW4g4oCYaWbigJkgc3RhdGVt
ZW50IFstV2VtcHR5LWJvZHldCiAgODI0IHwgICA7CiAgICAgIHwgICBeCnNvdW5kL3BjaS9oZGEv
cGF0Y2hfaGRtaS5jOjgyNjozOiB3YXJuaW5nOiBzdWdnZXN0IGJyYWNlcyBhcm91bmQgZW1wdHkK
Ym9keSBpbiBhbiDigJhpZuKAmSBzdGF0ZW1lbnQgWy1XZW1wdHktYm9keV0KICA4MjYgfCAgIDsK
ICAgICAgfCAgIF4KClNpZ25lZC1vZmYtYnk6IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUt
bG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+Ci0tLQogc291bmQvcGNpL2hkYS9wYXRjaF9o
ZG1pLmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zb3VuZC9wY2kvaGRhL3BhdGNoX2hkbWkuYyBiL3NvdW5k
L3BjaS9oZGEvcGF0Y2hfaGRtaS5jCmluZGV4IDNhMThmYTRmOGMyMS4uY2UzYzIxMmVlNDY3IDEw
MDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNoX2hkbWkuYworKysgYi9zb3VuZC9wY2kvaGRh
L3BhdGNoX2hkbWkuYwpAQCAtODIwLDEwICs4MjAsMTIgQEAgc3RhdGljIHZvaWQgaGRtaV9ub25f
aW50cmluc2ljX2V2ZW50KHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLCB1bnNpZ25lZCBpbnQgcmVz
KQogCQljcF9yZWFkeSk7CiAKIAkvKiBUT0RPICovCi0JaWYgKGNwX3N0YXRlKQorCWlmIChjcF9z
dGF0ZSkgewogCQk7Ci0JaWYgKGNwX3JlYWR5KQorCX0KKwlpZiAoY3BfcmVhZHkpIHsKIAkJOwor
CX0KIH0KIAogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
