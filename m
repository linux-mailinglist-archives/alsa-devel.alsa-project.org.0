Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6240B480FD
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2019 13:38:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8E801724;
	Mon, 17 Jun 2019 13:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8E801724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560771492;
	bh=8mK+QxqEkOZpb7EhsjTuyiYDd2mVFXmpx8K40CTmAZ8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dlHWWsWZdHCLp2wFDcQAFKff4+a7xYOWveAuASGwPwQ3K/g2Ey/n9WpsXt1yZDmfh
	 VssQJTHbBHmz4r3dYFhXPGFgZTD5XPlVXAQOaJ6DbYQtSDmwo2VI22GD34LR3AWoVv
	 mmPxKBVuk75v9/iJ1diAGAx3bhM6hAJk6A9QtNOQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C083F89731;
	Mon, 17 Jun 2019 13:35:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 554C8F89729; Mon, 17 Jun 2019 13:35:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA0F8F89693
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 13:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA0F8F89693
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 04:34:56 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by fmsmga006.fm.intel.com with ESMTP; 17 Jun 2019 04:34:54 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 17 Jun 2019 13:36:35 +0200
Message-Id: <20190617113644.25621-3-amadeuszx.slawinski@linux.intel.com>
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
Subject: [alsa-devel] [PATCH v2 02/11] ALSA: hdac: Fix codec name after
	machine driver is unloaded and reloaded
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

Q3VycmVudGx5IG9uIGVhY2ggZHJpdmVyIHJlbG9hZCBpbnRlcm5hbCBjb3VudGVyIGlzIGJlaW5n
IGluY3JlYXNlZC4gSXQKY2F1c2VzIGZhaWx1cmUgdG8gZW51bWVyYXRlIGRyaXZlciBkZXZpY2Vz
LCBhcyB0aGV5IGhhdmUgaGFyZGNvZGVkOgouY29kZWNfbmFtZSA9ICJlaGRhdWRpbzBEMiIsCkFz
IHRoZXJlIGlzIGN1cnJlbnRseSBubyBkZXZpY2VzIHdpdGggbXVsdGlwbGUgaGRhIGNvZGVjcyBh
bmQgdGhlcmUgaXMKY3VycmVudGx5IG5vIGVzdGFibGlzaGVkIHdheSB0byByZWxpYWJseSBkaWZm
ZXJlbnRpYXRlLCBiZXR3ZWVuIHRoZW0sCmFsd2F5cyBhc3NpZ24gYnVzLT5pZHggPSAwOwoKVGhp
cyBmaXhlcyBhIHByb2JsZW0gd2hlbiB3ZSB1bmxvYWQgYW5kIHJlbG9hZCBtYWNoaW5lIGRyaXZl
ciBpZHggZ2V0cwppbmNyZW1lbnRlZCwgc28gLmNvZGVjX25hbWUgd291bGQndmUgbmVlZGVkIHRv
IGJlIHNldCB0byAiZWhkYXVkaW8xRDIiCmFmdGVyIGZpcnN0IHJlbG9hZCBhbmQgc28gb24uCgpT
aWduZWQtb2ZmLWJ5OiBBbWFkZXVzeiBTxYJhd2nFhHNraSA8YW1hZGV1c3p4LnNsYXdpbnNraUBs
aW51eC5pbnRlbC5jb20+Ci0tLQogc291bmQvaGRhL2V4dC9oZGFjX2V4dF9idXMuYyB8IDggKysr
KysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvc291bmQvaGRhL2V4dC9oZGFjX2V4dF9idXMuYyBiL3NvdW5kL2hkYS9leHQv
aGRhY19leHRfYnVzLmMKaW5kZXggYTNhMTEzZWY1ZDU2Li40ZjlmMWQyYTJlYzUgMTAwNjQ0Ci0t
LSBhL3NvdW5kL2hkYS9leHQvaGRhY19leHRfYnVzLmMKKysrIGIvc291bmQvaGRhL2V4dC9oZGFj
X2V4dF9idXMuYwpAQCAtODUsNyArODUsNiBAQCBpbnQgc25kX2hkYWNfZXh0X2J1c19pbml0KHN0
cnVjdCBoZGFjX2J1cyAqYnVzLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJCQljb25zdCBzdHJ1Y3Qg
aGRhY19leHRfYnVzX29wcyAqZXh0X29wcykKIHsKIAlpbnQgcmV0OwotCXN0YXRpYyBpbnQgaWR4
OwogCiAJLyogY2hlY2sgaWYgaW8gb3BzIGFyZSBwcm92aWRlZCwgaWYgbm90IGxvYWQgdGhlIGRl
ZmF1bHRzICovCiAJaWYgKGlvX29wcyA9PSBOVUxMKQpAQCAtOTYsNyArOTUsMTIgQEAgaW50IHNu
ZF9oZGFjX2V4dF9idXNfaW5pdChzdHJ1Y3QgaGRhY19idXMgKmJ1cywgc3RydWN0IGRldmljZSAq
ZGV2LAogCQlyZXR1cm4gcmV0OwogCiAJYnVzLT5leHRfb3BzID0gZXh0X29wczsKLQlidXMtPmlk
eCA9IGlkeCsrOworCS8qIEZJWE1FOgorCSAqIEN1cnJlbnRseSBvbmx5IG9uZSBidXMgaXMgc3Vw
cG9ydGVkLCBpZiB0aGVyZSBpcyBkZXZpY2Ugd2l0aCBtb3JlCisJICogYnVzZXMsIGJ1cy0+aWR4
IHNob3VsZCBiZSBncmVhdGVyIHRoYW4gMCwgYnV0IHRoZXJlIG5lZWRzIHRvIGJlIGEKKwkgKiBy
ZWxpYWJsZSB3YXkgdG8gYWx3YXlzIGFzc2lnbiBzYW1lIG51bWJlci4KKwkgKi8KKwlidXMtPmlk
eCA9IDA7CiAJYnVzLT5jbWRfZG1hX3N0YXRlID0gdHJ1ZTsKIAogCXJldHVybiAwOwotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNh
LWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9t
YWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
