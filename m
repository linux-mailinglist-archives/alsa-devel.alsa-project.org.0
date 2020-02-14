Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A96415E331
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 17:28:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40DFA16F0;
	Fri, 14 Feb 2020 17:27:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40DFA16F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581697708;
	bh=r9RxxY0UzhHnIuz5tK+YFA71W9cDXxaiBoaV+vKvNPU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SexeXAQeimPnJrS8sgZlHjztVIhBEPNv6spn3ijb+S59DjUvj6EuMZfBI8DeMwHUD
	 CpILP62/+q6FNFScrOMCxCS6zEtqT2oi/nf2smNhmCd/t+yyh0lYJqRnWRR9iWy35t
	 ljYSsn0yaF/mL3izPcDusjIQRo8JgzArI7s46890=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1C12F8027C;
	Fri, 14 Feb 2020 17:23:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DA38F8028A; Fri, 14 Feb 2020 17:23:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7EE5F80277
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 17:23:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7EE5F80277
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="boffenqQ"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4DFA324773;
 Fri, 14 Feb 2020 16:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581697424;
 bh=1iM4YE0k6wVlE4KaGD8aHEfcNJFfXxlyVDWaVfEOIqc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=boffenqQlBeUsNM/30/oAy5Aq9G9ZX1SbLSgja65McthHsvQxz7vljH5A+Qk+Nh3k
 Ji3Gdpp6crBPSGLkWn3I8e7ddgtRnHnUwZ2CmaQQyA49CdTPiGQs/6oLYqSA03Rg8x
 TgRzi5YvlR80zti38g+nHAykD3sBI2Ew0/5arous=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 14 Feb 2020 11:20:53 -0500
Message-Id: <20200214162122.19794-113-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214162122.19794-1-sashal@kernel.org>
References: <20200214162122.19794-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, =?UTF-8?q?Peter=20Gro=C3=9Fe?= <pegro@friiks.de>
Subject: [alsa-devel] [PATCH AUTOSEL 4.9 113/141] ALSA: hda - Add docking
	station support for Lenovo Thinkpad T420s
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

RnJvbTogUGV0ZXIgR3Jvw59lIDxwZWdyb0Bmcmlpa3MuZGU+CgpbIFVwc3RyZWFtIGNvbW1pdCBl
ZjdkODRjYWE1OTI4YjQwYjFjOTNhMjZkYmU1YTNmMTI3MzdjNmFiIF0KCkxlbm92byBUaGlua3Bh
ZCBUNDIwcyB1c2VzIHRoZSBzYW1lIGNvZGVjIGFzIFQ0MjAsIHNvIGFwcGx5IHRoZQpzYW1lIHF1
aXJrIHRvIGVuYWJsZSBhdWRpbyBvdXRwdXQgb24gYSBkb2NraW5nIHN0YXRpb24uCgpTaWduZWQt
b2ZmLWJ5OiBQZXRlciBHcm/Dn2UgPHBlZ3JvQGZyaWlrcy5kZT4KTGluazogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDIwMDEyMjE4MDEwNi45MzUxLTEtcGVncm9AZnJpaWtzLmRlClNpZ25l
ZC1vZmYtYnk6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4KU2lnbmVkLW9mZi1ieTogU2Fz
aGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIHNvdW5kL3BjaS9oZGEvcGF0Y2hfY29u
ZXhhbnQuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0
IGEvc291bmQvcGNpL2hkYS9wYXRjaF9jb25leGFudC5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9j
b25leGFudC5jCmluZGV4IDg1NTdiOTRlNDYyY2IuLjFlOTk1MDBkYmI2YzggMTAwNjQ0Ci0tLSBh
L3NvdW5kL3BjaS9oZGEvcGF0Y2hfY29uZXhhbnQuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNo
X2NvbmV4YW50LmMKQEAgLTg1Myw2ICs4NTMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9w
Y2lfcXVpcmsgY3h0NTA2Nl9maXh1cHNbXSA9IHsKIAlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgy
MTVmLCAiTGVub3ZvIFQ1MTAiLCBDWFRfUElOQ0ZHX0xFTk9WT19UUDQxMCksCiAJU05EX1BDSV9R
VUlSSygweDE3YWEsIDB4MjFjZSwgIkxlbm92byBUNDIwIiwgQ1hUX1BJTkNGR19MRU5PVk9fVFA0
MTApLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDIxY2YsICJMZW5vdm8gVDUyMCIsIENYVF9Q
SU5DRkdfTEVOT1ZPX1RQNDEwKSwKKwlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgyMWQyLCAiTGVu
b3ZvIFQ0MjBzIiwgQ1hUX1BJTkNGR19MRU5PVk9fVFA0MTApLAogCVNORF9QQ0lfUVVJUksoMHgx
N2FhLCAweDIxZGEsICJMZW5vdm8gWDIyMCIsIENYVF9QSU5DRkdfTEVOT1ZPX1RQNDEwKSwKIAlT
TkRfUENJX1FVSVJLKDB4MTdhYSwgMHgyMWRiLCAiTGVub3ZvIFgyMjAtdGFibGV0IiwgQ1hUX1BJ
TkNGR19MRU5PVk9fVFA0MTApLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDM4YWYsICJMZW5v
dm8gSWRlYVBhZCBaNTYwIiwgQ1hUX0ZJWFVQX01VVEVfTEVEX0VBUEQpLAotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
