Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 575269EAA8
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 16:16:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9C971658;
	Tue, 27 Aug 2019 16:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9C971658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566915383;
	bh=Q4Lw5RC1R9ed97prkht31q9tT/CpaxFj6lhZ0MiG9P4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gkHgATD3tmkzHxyNcnaRHkbWq/NsS1QGEbs967lSlKQJjFlPwwmUl/W30QUDVKlj1
	 CkLMMyaUSA/JHVWVyBXR621ggAKiU4NYdDtJmgSy7PNMYpjTEcgXrMKVptstQWCeU1
	 WSxQn5JzCKOuWb/AiM2EkhYEcy5qLz+CKo/PpDv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD486F805F9;
	Tue, 27 Aug 2019 16:13:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D2A0F80444; Tue, 27 Aug 2019 16:13:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D432BF80273
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 16:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D432BF80273
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 07:12:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="264282412"
Received: from xxx.igk.intel.com ([10.237.93.170])
 by orsmga001.jf.intel.com with ESMTP; 27 Aug 2019 07:12:54 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 27 Aug 2019 16:17:08 +0200
Message-Id: <20190827141712.21015-3-amadeuszx.slawinski@linux.intel.com>
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
Subject: [alsa-devel] [PATCH 2/6] ASoC: Intel: Fix use of potentially
	uninitialized variable
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
PgoKSWYgaXBjLT5vcHMucmVwbHlfbXNnX21hdGNoIGlzIE5VTEwsIHdlIG1heSBlbmQgdXAgdXNp
bmcgdW5pbml0aWFsaXplZAptYXNrIHZhbHVlLgoKcmVwb3J0ZWQgYnkgc21hdGNoOgpzb3VuZC9z
b2MvaW50ZWwvY29tbW9uL3NzdC1pcGMuYzoyNjYgc3N0X2lwY19yZXBseV9maW5kX21zZygpIGVy
cm9yOiB1bmluaXRpYWxpemVkIHN5bWJvbCAnbWFzaycuCgpTaWduZWQtb2ZmLWJ5OiBBbWFkZXVz
eiBTxYJhd2nFhHNraSA8YW1hZGV1c3p4LnNsYXdpbnNraUBpbnRlbC5jb20+Ci0tLQogc291bmQv
c29jL2ludGVsL2NvbW1vbi9zc3QtaXBjLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtaXBjLmMg
Yi9zb3VuZC9zb2MvaW50ZWwvY29tbW9uL3NzdC1pcGMuYwppbmRleCAxMTg2YTAzYTg4ZDYuLjYw
NjhiYjY5N2UyMiAxMDA2NDQKLS0tIGEvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtaXBjLmMK
KysrIGIvc291bmQvc29jL2ludGVsL2NvbW1vbi9zc3QtaXBjLmMKQEAgLTIyMyw2ICsyMjMsOCBA
QCBzdHJ1Y3QgaXBjX21lc3NhZ2UgKnNzdF9pcGNfcmVwbHlfZmluZF9tc2coc3RydWN0IHNzdF9n
ZW5lcmljX2lwYyAqaXBjLAogCiAJaWYgKGlwYy0+b3BzLnJlcGx5X21zZ19tYXRjaCAhPSBOVUxM
KQogCQloZWFkZXIgPSBpcGMtPm9wcy5yZXBseV9tc2dfbWF0Y2goaGVhZGVyLCAmbWFzayk7CisJ
ZWxzZQorCQltYXNrID0gKHU2NCktMTsKIAogCWlmIChsaXN0X2VtcHR5KCZpcGMtPnJ4X2xpc3Qp
KSB7CiAJCWRldl9lcnIoaXBjLT5kZXYsICJlcnJvcjogcnggbGlzdCBlbXB0eSBidXQgcmVjZWl2
ZWQgMHglbGx4XG4iLAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2Et
cHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbHNhLWRldmVsCg==
