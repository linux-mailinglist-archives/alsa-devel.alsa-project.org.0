Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2062115DDFB
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 17:02:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA2FD1687;
	Fri, 14 Feb 2020 17:01:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA2FD1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581696122;
	bh=cBIHMNe4Yfufalcje8h0rEccB0qEiFzrIO0HCxE9npQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=spoe4a+zdEPOFCy3hA0qZ3U9BYgv0Cumgv2EtlTOjMtpQWmrsXTMoLYqpCoAfSXbC
	 OuN3KORCCp3LCsrtOC81YYMvaJMPFq1C1YvhR0YGQJJ/og1SJonmKAttx86eUNrBvZ
	 A0lZtvb3Rb5uWK/l/ITHCOxuSLBoxUZHRcFXcbJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BE41F80158;
	Fri, 14 Feb 2020 16:56:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB250F802D2; Fri, 14 Feb 2020 16:56:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F66BF802C3
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 16:56:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F66BF802C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Tv+FnrA7"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C9312082F;
 Fri, 14 Feb 2020 15:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695784;
 bh=cBFPbr8CVvdMgTjBagQOmxmbeGJeF3llcrP0PGr67TY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Tv+FnrA7Iaj9m0LNlO0UH+q17RzMRLX8VJ5uquS68rvOGdfMEeSoTn55fyfy0cpK5
 aPzxiGih0+tsvuCPNm6PL8077e32fRAot2tqR01Tdi44vLOYv74RvO7hwzdkDRM+Qh
 z//8I4mK1VvpU9XEB1Teb3EzVS2JDCHfsZjXE1Ek=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 14 Feb 2020 10:45:40 -0500
Message-Id: <20200214154854.6746-348-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH AUTOSEL 5.5 348/542] ASoC: SOF: Intel: hda-dai:
	fix compilation warning in pcm_prepare
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

RnJvbTogUGllcnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4Lmlu
dGVsLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IGQ4NzM5OTcxOTJkZGNhY2I1MzMzNTc1NTAyYmUy
ZjkxZWE0YjQ3YjggXQoKRml4IEdDQyB3YXJuaW5nIHdpdGggVz0xLCBwcmV2aW91cyBjbGVhbnVw
IGRpZCBub3QgcmVtb3ZlIHVubmVjZXNzYXJ5CnZhcmlhYmxlLgoKc291bmQvc29jL3NvZi9pbnRl
bC9oZGEtZGFpLmM6IEluIGZ1bmN0aW9uIOKAmGhkYV9saW5rX3BjbV9wcmVwYXJl4oCZOgoKc291
bmQvc29jL3NvZi9pbnRlbC9oZGEtZGFpLmM6MjY1OjMxOiB3YXJuaW5nOiB2YXJpYWJsZSDigJho
ZGFfc3RyZWFt4oCZCnNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVd
CiAgMjY1IHwgIHN0cnVjdCBzb2ZfaW50ZWxfaGRhX3N0cmVhbSAqaGRhX3N0cmVhbTsKICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+CgpGaXhlczogYTNlYmNj
YjUyZWZkZiAoIkFTb0M6IFNPRjogSW50ZWw6IGhkYTogcmVzZXQgbGluayBETUEgc3RhdGUgaW4g
cHJlcGFyZSIpCkNjOiBLYWkgVmVobWFuZW4gPGthaS52ZWhtYW5lbkBsaW51eC5pbnRlbC5jb20+
ClNpZ25lZC1vZmYtYnk6IFBpZXJyZS1Mb3VpcyBCb3NzYXJ0IDxwaWVycmUtbG91aXMuYm9zc2Fy
dEBsaW51eC5pbnRlbC5jb20+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMDAx
MTMyMDU2MjAuMjcyODUtMS1waWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20KU2ln
bmVkLW9mZi1ieTogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5
OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogc291bmQvc29jL3NvZi9pbnRl
bC9oZGEtZGFpLmMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvc291bmQvc29jL3NvZi9pbnRlbC9oZGEtZGFpLmMgYi9zb3VuZC9zb2Mvc29mL2lu
dGVsL2hkYS1kYWkuYwppbmRleCA4OTZkMjE5ODRiNzM1Li4xOTIzYjBjMzZiY2VmIDEwMDY0NAot
LS0gYS9zb3VuZC9zb2Mvc29mL2ludGVsL2hkYS1kYWkuYworKysgYi9zb3VuZC9zb2Mvc29mL2lu
dGVsL2hkYS1kYWkuYwpAQCAtMjYxLDE0ICsyNjEsMTEgQEAgc3RhdGljIGludCBoZGFfbGlua19w
Y21fcHJlcGFyZShzdHJ1Y3Qgc25kX3BjbV9zdWJzdHJlYW0gKnN1YnN0cmVhbSwKIHsKIAlzdHJ1
Y3QgaGRhY19leHRfc3RyZWFtICpsaW5rX2RldiA9CiAJCQkJc25kX3NvY19kYWlfZ2V0X2RtYV9k
YXRhKGRhaSwgc3Vic3RyZWFtKTsKLQlzdHJ1Y3Qgc29mX2ludGVsX2hkYV9zdHJlYW0gKmhkYV9z
dHJlYW07CiAJc3RydWN0IHNuZF9zb2ZfZGV2ICpzZGV2ID0KIAkJCQlzbmRfc29jX2NvbXBvbmVu
dF9nZXRfZHJ2ZGF0YShkYWktPmNvbXBvbmVudCk7CiAJc3RydWN0IHNuZF9zb2NfcGNtX3J1bnRp
bWUgKnJ0ZCA9IHNuZF9wY21fc3Vic3RyZWFtX2NoaXAoc3Vic3RyZWFtKTsKIAlpbnQgc3RyZWFt
ID0gc3Vic3RyZWFtLT5zdHJlYW07CiAKLQloZGFfc3RyZWFtID0gaHN0cmVhbV90b19zb2ZfaGRh
X3N0cmVhbShsaW5rX2Rldik7Ci0KIAlpZiAobGlua19kZXYtPmxpbmtfcHJlcGFyZWQpCiAJCXJl
dHVybiAwOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
