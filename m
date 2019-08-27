Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 757CA9EAA3
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 16:15:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF53C166D;
	Tue, 27 Aug 2019 16:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF53C166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566915333;
	bh=os1eWkfrBAf+rVUGKFE70syBzk7S4/ZVZkwdEhsdjDA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VDYy7qXvawAhc4fWXj0eCugYNmbDC+e7XUaTds44vzajh0ANxpxzYBGgUsUyQgmEu
	 bhnDq/3xa5PQrx8j4w8HVXozgNCEii296Fdkc/adcEYqz3E1ToBaaoGPyP3qWZ6yRR
	 yLZPhE744fktl8tCuurJnQzzFPGlm/R1ro+FtCgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 696B5F80445;
	Tue, 27 Aug 2019 16:13:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C74AF802A0; Tue, 27 Aug 2019 16:13:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F27EF801ED
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 16:12:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F27EF801ED
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 07:12:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,437,1559545200"; d="scan'208";a="264282392"
Received: from xxx.igk.intel.com ([10.237.93.170])
 by orsmga001.jf.intel.com with ESMTP; 27 Aug 2019 07:12:51 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 27 Aug 2019 16:17:07 +0200
Message-Id: <20190827141712.21015-2-amadeuszx.slawinski@linux.intel.com>
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
Subject: [alsa-devel] [PATCH 1/6] ASoC: Intel: Skylake: Use correct function
	to access iomem space
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
PgoKRm9yIGNvcHlpbmcgZnJvbSBfX2lvbWVtLCB3ZSBzaG91bGQgdXNlIF9faW9yZWFkMzJfY29w
eS4KCnJlcG9ydGVkIGJ5IHNwYXJzZToKc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLWRlYnVn
LmM6NDM3OjM0OiB3YXJuaW5nOiBpbmNvcnJlY3QgdHlwZSBpbiBhcmd1bWVudCAxIChkaWZmZXJl
bnQgYWRkcmVzcyBzcGFjZXMpCnNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1kZWJ1Zy5jOjQz
NzozNDogICAgZXhwZWN0ZWQgdm9pZCBbbm9kZXJlZl0gPGFzbjoyPiAqdG8Kc291bmQvc29jL2lu
dGVsL3NreWxha2Uvc2tsLWRlYnVnLmM6NDM3OjM0OiAgICBnb3QgdW5zaWduZWQgY2hhciAqCnNv
dW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1kZWJ1Zy5jOjQzNzo1MTogd2FybmluZzogaW5jb3Jy
ZWN0IHR5cGUgaW4gYXJndW1lbnQgMiAoZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2VzKQpzb3VuZC9z
b2MvaW50ZWwvc2t5bGFrZS9za2wtZGVidWcuYzo0Mzc6NTE6ICAgIGV4cGVjdGVkIHZvaWQgY29u
c3QgKmZyb20Kc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLWRlYnVnLmM6NDM3OjUxOiAgICBn
b3Qgdm9pZCBbbm9kZXJlZl0gPGFzbjoyPiAqW2Fzc2lnbmVkXSBmd19yZWdfYWRkcgoKU2lnbmVk
LW9mZi1ieTogQW1hZGV1c3ogU8WCYXdpxYRza2kgPGFtYWRldXN6eC5zbGF3aW5za2lAaW50ZWwu
Y29tPgotLS0KIHNvdW5kL3NvYy9pbnRlbC9za3lsYWtlL3NrbC1kZWJ1Zy5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
c291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLWRlYnVnLmMgYi9zb3VuZC9zb2MvaW50ZWwvc2t5
bGFrZS9za2wtZGVidWcuYwppbmRleCAyMTIzNzBiZjcwNGMuLjM0NjY2NzVmMjY3OCAxMDA2NDQK
LS0tIGEvc291bmQvc29jL2ludGVsL3NreWxha2Uvc2tsLWRlYnVnLmMKKysrIGIvc291bmQvc29j
L2ludGVsL3NreWxha2Uvc2tsLWRlYnVnLmMKQEAgLTE4OCw3ICsxODgsNyBAQCBzdGF0aWMgc3Np
emVfdCBmd19zb2Z0cmVnX3JlYWQoc3RydWN0IGZpbGUgKmZpbGUsIGNoYXIgX191c2VyICp1c2Vy
X2J1ZiwKIAltZW1zZXQoZC0+ZndfcmVhZF9idWZmLCAwLCBGV19SRUdfQlVGKTsKIAogCWlmICh3
MF9zdGF0X3N6ID4gMCkKLQkJX19pb3dyaXRlMzJfY29weShkLT5md19yZWFkX2J1ZmYsIGZ3X3Jl
Z19hZGRyLCB3MF9zdGF0X3N6ID4+IDIpOworCQlfX2lvcmVhZDMyX2NvcHkoZC0+ZndfcmVhZF9i
dWZmLCBmd19yZWdfYWRkciwgdzBfc3RhdF9zeiA+PiAyKTsKIAogCWZvciAob2Zmc2V0ID0gMDsg
b2Zmc2V0IDwgRldfUkVHX1NJWkU7IG9mZnNldCArPSAxNikgewogCQlyZXQgKz0gc25wcmludGYo
dG1wICsgcmV0LCBGV19SRUdfQlVGIC0gcmV0LCAiJSMuNHg6ICIsIG9mZnNldCk7Ci0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2Et
ZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21h
aWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
