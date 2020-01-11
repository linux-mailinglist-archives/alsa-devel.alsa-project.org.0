Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A404C1383BD
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jan 2020 22:51:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44FD91697;
	Sat, 11 Jan 2020 22:50:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44FD91697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578779475;
	bh=P7byAB3ly4TKhPVrn4wzxacarDMM6UrxI7WizI+9xgc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DDCFyiijOJL3X1cvtUAqCWfU+HidxBxDyemeiktklfaOvwl4SbqYQ6TGqtvO2v0bn
	 ZpIJJRP9F9SC2HAc4C46jK64CxB31wUl1zC8cW2Ig70IKrSDVlMq2bHRRg5OQ1EwWr
	 BqxUeNxnHme1eqiEEyG2T0AX4JJ+Dy9Rv0CTCIPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B496F80274;
	Sat, 11 Jan 2020 22:48:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18D43F8010B; Sat, 11 Jan 2020 22:47:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85C78F8010B
 for <alsa-devel@alsa-project.org>; Sat, 11 Jan 2020 22:47:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85C78F8010B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Jan 2020 13:47:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,422,1571727600"; d="scan'208";a="247358432"
Received: from kfoley1-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.191.191])
 by fmsmga004.fm.intel.com with ESMTP; 11 Jan 2020 13:47:41 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Sat, 11 Jan 2020 15:47:36 -0600
Message-Id: <20200111214736.3002-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200111214736.3002-1-pierre-louis.bossart@linux.intel.com>
References: <20200111214736.3002-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/2] ALSA: usb: update old-style static const
	declaration
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

R0NDIHJlcG9ydHMgdGhlIGZvbGxvd2luZyB3YXJuaW5nIHdpdGggVz0xCgpzb3VuZC91c2IvbWl4
ZXJfcXVpcmtzLmM6IEluIGZ1bmN0aW9uIOKAmHNuZF9taWNyb2lpX2NvbnRyb2xzX2NyZWF0ZeKA
mToKc291bmQvdXNiL21peGVyX3F1aXJrcy5jOjE2OTQ6Mjogd2FybmluZzog4oCYc3RhdGlj4oCZ
IGlzIG5vdCBhdCBiZWdpbm5pbmcKb2YgZGVjbGFyYXRpb24gWy1Xb2xkLXN0eWxlLWRlY2xhcmF0
aW9uXQogMTY5NCB8ICBjb25zdCBzdGF0aWMgdXNiX21peGVyX2VsZW1fcmVzdW1lX2Z1bmNfdCBy
ZXN1bWVfZnVuY3NbXSA9IHsKICAgICAgfCAgXn5+fn4KCk1vdmUgc3RhdGljIHRvIHRoZSBiZWdp
bm5pbmcgb2YgZGVjbGFyYXRpb24KClNpZ25lZC1vZmYtYnk6IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0
IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+Ci0tLQogc291bmQvdXNiL21p
eGVyX3F1aXJrcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQvdXNiL21peGVyX3F1aXJrcy5jIGIvc291bmQv
dXNiL21peGVyX3F1aXJrcy5jCmluZGV4IGI5ZjVhOWMxODA0MC4uYzIzN2UyNGYwOGQ5IDEwMDY0
NAotLS0gYS9zb3VuZC91c2IvbWl4ZXJfcXVpcmtzLmMKKysrIGIvc291bmQvdXNiL21peGVyX3F1
aXJrcy5jCkBAIC0xNjkxLDcgKzE2OTEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9rY29u
dHJvbF9uZXcgc25kX21pY3JvaWlfbWl4ZXJfc3BkaWZbXSA9IHsKIHN0YXRpYyBpbnQgc25kX21p
Y3JvaWlfY29udHJvbHNfY3JlYXRlKHN0cnVjdCB1c2JfbWl4ZXJfaW50ZXJmYWNlICptaXhlcikK
IHsKIAlpbnQgZXJyLCBpOwotCWNvbnN0IHN0YXRpYyB1c2JfbWl4ZXJfZWxlbV9yZXN1bWVfZnVu
Y190IHJlc3VtZV9mdW5jc1tdID0geworCXN0YXRpYyBjb25zdCB1c2JfbWl4ZXJfZWxlbV9yZXN1
bWVfZnVuY190IHJlc3VtZV9mdW5jc1tdID0gewogCQlzbmRfbWljcm9paV9zcGRpZl9kZWZhdWx0
X3VwZGF0ZSwKIAkJTlVMTCwKIAkJc25kX21pY3JvaWlfc3BkaWZfc3dpdGNoX3VwZGF0ZQotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpB
bHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6
Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
