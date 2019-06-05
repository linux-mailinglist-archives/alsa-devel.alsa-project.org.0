Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D0035E34
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jun 2019 15:45:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 090341662;
	Wed,  5 Jun 2019 15:44:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 090341662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559742336;
	bh=U1iaYBNoWJ5OPjufobK9+VUm16WCOE1SbwS3bZOgmUU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eee+E7FIuoD2XSmf+5SecaYYjNj1jOC9ybvLG5yk6KZY8uCqEQgUxxQ/4jKvE507H
	 4jHQTs0r44rZgSnSt1SLT4RMxt6wjzMh/FMr2mkh3wWS2sIgMjglWhCQmThrNQGK7h
	 tO7vH0ByLJ3vrYr4C0lvih1O4KghDQZ3rQv+/RjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4FADF89735;
	Wed,  5 Jun 2019 15:42:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B9CBF896DD; Wed,  5 Jun 2019 15:42:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FBCAF896DB
 for <alsa-devel@alsa-project.org>; Wed,  5 Jun 2019 15:42:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FBCAF896DB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jun 2019 06:42:22 -0700
X-ExtLoop1: 1
Received: from xxx.igk.intel.com ([10.237.93.170])
 by orsmga004.jf.intel.com with ESMTP; 05 Jun 2019 06:42:20 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  5 Jun 2019 15:45:44 +0200
Message-Id: <20190605134556.10322-3-amadeuszx.slawinski@linux.intel.com>
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
Subject: [alsa-devel] [PATCH 02/14] ALSA: hdac: fix memory release for SST
	and SOF drivers
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

RHVyaW5nIHRoZSBpbnRlZ3JhdGlvbiBvZiBIRGF1ZGlvIHN1cHBvcnQsIHdlIGNoYW5nZWQgdGhl
IHdheSBpbiB3aGljaAp3ZSBnZXQgaGRldiBpbiBzbmRfaGRhY19leHRfYnVzX2RldmljZV9pbml0
KCkgdG8gdXNlIG9uZSBwcmVhbGxvY2F0ZWQKd2l0aCBkZXZtX2t6YWxsb2MoKSwgaG93ZXZlciBp
dCBzdGlsbCBsZWZ0IGtmcmVlKGhkZXYpIGluCnNuZF9oZGFjX2V4dF9idXNfZGV2aWNlX2V4aXQo
KS4gSXQgbGVhZHMgdG8gb29wc2VzIHdoZW4gdHJ5aW5nIHRvCnJtbW9kIGFuZCBtb2Rwcm9iZS4g
Rml4IGl0LCBieSBqdXN0IHJlbW92aW5nIGtmcmVlIGNhbGwuCgpTT0YgYWxzbyB1c2VzIHNvbWUg
b2YgdGhlIHNuZF9oZGFjXyBmdW5jdGlvbnMgZm9yIEhEQXVkaW8gc3VwcG9ydCBidXQKYWxsb2Nh
dGVkIHRoZSBtZW1vcnkgd2l0aCBremFsbG9jLiBBIG1hdGNoaW5nIGZpeCBpcyBwcm92aWRlZApz
ZXBhcmF0ZWx5IHRvIGFsaWduIGFsbCB1c2VycyBvZiB0aGUgc25kX2hkYWNfIGxpYnJhcnkuCgpG
aXhlczogNjI5ODU0MmZhMzNiICgiQUxTQTogaGRhYzogcmVtb3ZlIG1lbW9yeSBhbGxvY2F0aW9u
IGZyb20gc25kX2hkYWNfZXh0X2J1c19kZXZpY2VfaW5pdCIpClJldmlld2VkLWJ5OiBUYWthc2hp
IEl3YWkgPHRpd2FpQHN1c2UuZGU+ClNpZ25lZC1vZmYtYnk6IEFtYWRldXN6IFPFgmF3acWEc2tp
IDxhbWFkZXVzenguc2xhd2luc2tpQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogUGll
cnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4K
LS0tCiBzb3VuZC9oZGEvZXh0L2hkYWNfZXh0X2J1cy5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL2hkYS9leHQvaGRhY19leHRfYnVzLmMg
Yi9zb3VuZC9oZGEvZXh0L2hkYWNfZXh0X2J1cy5jCmluZGV4IGMyMDNhZjcxYTA5OS4uZjMzYmE1
OGI3NTNjIDEwMDY0NAotLS0gYS9zb3VuZC9oZGEvZXh0L2hkYWNfZXh0X2J1cy5jCisrKyBiL3Nv
dW5kL2hkYS9leHQvaGRhY19leHRfYnVzLmMKQEAgLTE3MCw3ICsxNzAsNiBAQCBFWFBPUlRfU1lN
Qk9MX0dQTChzbmRfaGRhY19leHRfYnVzX2RldmljZV9pbml0KTsKIHZvaWQgc25kX2hkYWNfZXh0
X2J1c19kZXZpY2VfZXhpdChzdHJ1Y3QgaGRhY19kZXZpY2UgKmhkZXYpCiB7CiAJc25kX2hkYWNf
ZGV2aWNlX2V4aXQoaGRldik7Ci0Ja2ZyZWUoaGRldik7CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChz
bmRfaGRhY19leHRfYnVzX2RldmljZV9leGl0KTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlz
dApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
