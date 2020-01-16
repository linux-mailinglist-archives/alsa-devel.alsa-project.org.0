Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE97C13E3A1
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 18:03:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 371C917E2;
	Thu, 16 Jan 2020 18:02:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 371C917E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579194200;
	bh=cOLuhSEYtFTkEe9EwBb2lhRAHwvJKtdO2xGJKT11dXE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TTWLHmz7lnm6UREWO9WizfyPSPJRKf9mVSaUL9f/B1DMZiz+Fy+mUfFja3p0SYsHt
	 aEThthjJiwqSIFjJYDy3xh6CDskK+EA+89rQ//kUV1zSCEkikdhdwBuefeTW/Isjnh
	 ZGic+jAs2JSJkp6KOzTXnFn55ckmyyM0eRh9KNAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10166F801F2;
	Thu, 16 Jan 2020 18:00:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA093F8016F; Thu, 16 Jan 2020 18:00:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C6AEF800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 18:00:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C6AEF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qegqH12d"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 668D524653;
 Thu, 16 Jan 2020 16:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579193574;
 bh=KA6r6uhzWScbjS1G8ybuqW922xv9nzdxSFBb9Cr0Z7w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qegqH12dvY1XY/Gw98fWlc6udRJq0biK27t9rsvyKzQ04J8OfpeRT6H+bFZ7Q39+b
 9I4HvgkGp7KEfnVjnEdiQyxM9FXmeKm0nOt1hqP9HCy3CMWYMSbZESO08SoS6sYcHC
 RVm7x4VpKY0r5bCDyFAkbYmBYIX02UMFftLciIAI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 16 Jan 2020 11:41:32 -0500
Message-Id: <20200116164300.6705-117-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116164300.6705-1-sashal@kernel.org>
References: <20200116164300.6705-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH AUTOSEL 5.4 117/205] ASoC: core: Fix compile
	warning with CONFIG_DEBUG_FS=n
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

RnJvbTogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPgoKWyBVcHN0cmVhbSBjb21taXQgYmQw
YjYwOWUwYzMzNjJjYjE2N2M1MWQ0YmQ0MzMwZDc5ZmMwMDk4NyBdCgpQYXBlciBvdmVyIGEgY29t
cGlsZSB3YXJuaW5nOgogIHNvdW5kL3NvYy9zb2MtcGNtLmM6MTE4NTo4OiB3YXJuaW5nOiB1bnVz
ZWQgdmFyaWFibGUg4oCYbmFtZeKAmQoKRml4ZXM6IDA2MzJmYTA0MjU0MSAoIkFTb0M6IGNvcmU6
IEZpeCBwY20gY29kZSBkZWJ1Z2ZzIGVycm9yIikKU2lnbmVkLW9mZi1ieTogVGFrYXNoaSBJd2Fp
IDx0aXdhaUBzdXNlLmRlPgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMTkxMTA3
MTM0ODMzLjE1MDItMS10aXdhaUBzdXNlLmRlClNpZ25lZC1vZmYtYnk6IE1hcmsgQnJvd24gPGJy
b29uaWVAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJu
ZWwub3JnPgotLS0KIHNvdW5kL3NvYy9zb2MtcGNtLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3NvYy1wY20uYyBiL3NvdW5k
L3NvYy9zb2MtcGNtLmMKaW5kZXggYTZlOTZjZjFkOGZmLi5kMDcwMjZhODQ2YjkgMTAwNjQ0Ci0t
LSBhL3NvdW5kL3NvYy9zb2MtcGNtLmMKKysrIGIvc291bmQvc29jL3NvYy1wY20uYwpAQCAtMTE0
OCw3ICsxMTQ4LDkgQEAgc3RhdGljIGludCBkcGNtX2JlX2Nvbm5lY3Qoc3RydWN0IHNuZF9zb2Nf
cGNtX3J1bnRpbWUgKmZlLAogewogCXN0cnVjdCBzbmRfc29jX2RwY20gKmRwY207CiAJdW5zaWdu
ZWQgbG9uZyBmbGFnczsKKyNpZmRlZiBDT05GSUdfREVCVUdfRlMKIAljaGFyICpuYW1lOworI2Vu
ZGlmCiAKIAkvKiBvbmx5IGFkZCBuZXcgZHBjbXMgKi8KIAlmb3JfZWFjaF9kcGNtX2JlKGZlLCBz
dHJlYW0sIGRwY20pIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNh
LXByb2plY3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYWxzYS1kZXZlbAo=
