Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3440935E35
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2019 15:45:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EABF41686;
	Wed,  5 Jun 2019 15:45:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EABF41686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559742358;
	bh=+EcL/b6xd52WFwN+pEP+6UzCZ8p+MrJgDDHDJgejOyQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CHyfWQe34+xl1PjsjLZLeZu6CsdE+jXCasvrFhQn0txgx6lFPkjPsy+gDIISCQq5L
	 UxAl3rSe9GAgwx7FxkbVWKTf4GLf2EcKgNUok/83izfVk/3eJJEPNpMoYESnJQJtfJ
	 cKVaTu75XDOQGBYbzy2lnwJCkXngWWHx1GsV7ZP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE80AF89737;
	Wed,  5 Jun 2019 15:42:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 061C5F8972E; Wed,  5 Jun 2019 15:42:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5453F8972E
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 15:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5453F8972E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2019 06:42:25 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by orsmga004.jf.intel.com with ESMTP; 05 Jun 2019 06:42:22 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  5 Jun 2019 15:45:45 +0200
Message-Id: <20190605134556.10322-4-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605134556.10322-1-amadeuszx.slawinski@linux.intel.com>
References: <20190605134556.10322-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@intel.com>
Subject: [alsa-devel] [PATCH 03/14] ALSA: hdac: Fix codec name after machine
	driver is unloaded and reloaded
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
PgoKVGhpcyByZXNldHMgaW50ZXJuYWwgaW5kZXggdXNlZCBmb3IgZW51bWFyYXRpbmcgY29kZWNz
LiBUaGlzIHdpbGwgb25seQp3b3JrIG9uIGFzc3VtcHRpb24gdGhhdCBwbGF0Zm9ybSBoYXMgb25l
IGNvZGVjLiBBbnl3YXkgaWYgdGhlcmUgaXMgbW9yZSwKaXQgd29uJ3Qgd29yayB3aXRoIGN1cnJl
bnQgbWFjaGluZSBkcml2ZXJzLCBiZWNhdXNlIHdlIGNhbid0IGd1YXJhbnRlZQpvcmRlciBpbiB3
aGljaCB0aGV5IGFyZSBlbnVtZXJhdGVkLiBUaGlzIHdvcmthcm91bmRzIHRoZSBmYWN0IHRoYXQg
bW9zdAppbnRlbCBtYWNoaW5lIGRyaXZlcnMgaGF2ZSB0aGUgZm9sbG93aW5nIGRlZmluZWQ6Ci5j
b2RlY19uYW1lID0gImVoZGF1ZGlvMEQyIiwKSG93ZXZlciB3aGVuIHdlIHVubG9hZCBhbmQgcmVs
b2FkIG1hY2hpbmUgZHJpdmVyIGlkeCBnZXRzIGluY3JlbWVudGVkLApzbyAuY29kZWNfbmFtZSB3
b3VsZCd2ZSBuZWVkZWQgdG8gYmUgc2V0IHRvIGVoZGF1ZGlvMUQyIG9uIGZpcnN0IHJlbG9hZAph
bmQgc28gb24uCgpTaWduZWQtb2ZmLWJ5OiBBbWFkZXVzeiBTxYJhd2nFhHNraSA8YW1hZGV1c3p4
LnNsYXdpbnNraUBpbnRlbC5jb20+Ci0tLQogc291bmQvaGRhL2V4dC9oZGFjX2V4dF9idXMuYyB8
IDExICsrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL2hkYS9leHQvaGRhY19leHRfYnVzLmMgYi9zb3Vu
ZC9oZGEvZXh0L2hkYWNfZXh0X2J1cy5jCmluZGV4IGYzM2JhNThiNzUzYy4uYzg0ZDY5YzJlYmE0
IDEwMDY0NAotLS0gYS9zb3VuZC9oZGEvZXh0L2hkYWNfZXh0X2J1cy5jCisrKyBiL3NvdW5kL2hk
YS9leHQvaGRhY19leHRfYnVzLmMKQEAgLTc3LDYgKzc3LDggQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBoZGFjX2lvX29wcyBoZGFjX2V4dF9kZWZhdWx0X2lvID0gewogCS5kbWFfZnJlZV9wYWdlcyA9
IGhkYWNfZXh0X2RtYV9mcmVlX3BhZ2VzLAogfTsKIAorc3RhdGljIGludCBpZHg7CisKIC8qKgog
ICogc25kX2hkYWNfZXh0X2J1c19pbml0IC0gaW5pdGlhbGl6ZSBhIEhELWF1ZGlvIGV4dGVuZGVk
IGJ1cwogICogQGVidXM6IHRoZSBwb2ludGVyIHRvIGV4dGVuZGVkIGJ1cyBvYmplY3QKQEAgLTkz
LDcgKzk1LDYgQEAgaW50IHNuZF9oZGFjX2V4dF9idXNfaW5pdChzdHJ1Y3QgaGRhY19idXMgKmJ1
cywgc3RydWN0IGRldmljZSAqZGV2LAogCQkJY29uc3Qgc3RydWN0IGhkYWNfZXh0X2J1c19vcHMg
KmV4dF9vcHMpCiB7CiAJaW50IHJldDsKLQlzdGF0aWMgaW50IGlkeDsKIAogCS8qIGNoZWNrIGlm
IGlvIG9wcyBhcmUgcHJvdmlkZWQsIGlmIG5vdCBsb2FkIHRoZSBkZWZhdWx0cyAqLwogCWlmIChp
b19vcHMgPT0gTlVMTCkKQEAgLTExOCw2ICsxMTksMTQgQEAgRVhQT1JUX1NZTUJPTF9HUEwoc25k
X2hkYWNfZXh0X2J1c19pbml0KTsKIHZvaWQgc25kX2hkYWNfZXh0X2J1c19leGl0KHN0cnVjdCBo
ZGFjX2J1cyAqYnVzKQogewogCXNuZF9oZGFjX2J1c19leGl0KGJ1cyk7CisJLyogRklYTUU6IHRo
aXMgaXMgd29ya2Fyb3VuZAorCSAqIHJlc2V0IGluZGV4IHVzZWQgZm9yIGJ1cy0+aWR4LCBiZWNh
dXNlIG1hY2hpbmUgZHJpdmVycyBleHBlY3QKKwkgKiB0aGUgY29kZWMgbmFtZSB0byBiZSBlaGRh
dWRpbzBEMiwgd2hlcmUgMCBpcyBidXMtPmlkeAorCSAqIHdlIG9ubHkgcGVyZm9ybSByZXNldCBp
ZiB0aGVyZSBpcyBvbmUgdXNlZCBkZXZpY2UsIGlmIHRoZXJlIGlzIG1vcmUKKwkgKiBhbGwgYmV0
cyBhcmUgb2ZmCisJICovCisJaWYgKGlkeCA9PSAxKQorCQlpZHggPSAwOwogCVdBUk5fT04oIWxp
c3RfZW1wdHkoJmJ1cy0+aGxpbmtfbGlzdCkpOwogfQogRVhQT1JUX1NZTUJPTF9HUEwoc25kX2hk
YWNfZXh0X2J1c19leGl0KTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBh
bHNhLXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYWxzYS1kZXZlbAo=
