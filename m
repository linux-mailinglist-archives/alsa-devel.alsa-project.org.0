Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA47713E3BE
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 18:04:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A75C17CC;
	Thu, 16 Jan 2020 18:03:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A75C17CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579194258;
	bh=DSDF+yaTvMtQ24P3MeglrmZ3Isyr3++47TMcCuFOnAQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vjaIVWiShQ56T5B0VsPUBW6twbOQh6vfpA8+oze8FkAWimKgK5HbwUGMb5sNrnrTA
	 z80/1FmcYd8sPetdZZ7w6a0C0PJn+S9ELXP8UHFs8wKHCmxBL31aEHCEh3uay+QzzA
	 qW2ZKnnbI85DFcyJvMfwx9c2ahUoiodKuu4xUuGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5011F8028A;
	Thu, 16 Jan 2020 18:01:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32D9CF80276; Thu, 16 Jan 2020 18:00:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14A6EF80216
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 18:00:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14A6EF80216
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Rf/SMBtY"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E494E24679;
 Thu, 16 Jan 2020 16:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579193712;
 bh=/AMNoWp4t08t2W0p2s4AAZai3FYHJpG3gzo7Kc+7B0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rf/SMBtYZp2VsnBbw5CBA69lVeFezlZ3g6JajqziyLbKSeHZg0jpZDLtryvvPbiJ+
 DJF+abxvyrBUl5Z2HfBGsgfNoT10GG8k7QaP0kpEwqZh2szioA6c7gU8KRPlRyyakV
 0qAg6VFvdKBuTIRe1WqSNY6snePhxgAnR85+FlVQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 16 Jan 2020 11:43:59 -0500
Message-Id: <20200116165502.8838-8-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116165502.8838-1-sashal@kernel.org>
References: <20200116165502.8838-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Anders Roxell <anders.roxell@linaro.org>
Subject: [alsa-devel] [PATCH AUTOSEL 4.19 008/671] ALSA: hda: fix unused
	variable warning
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

RnJvbTogQW5kZXJzIFJveGVsbCA8YW5kZXJzLnJveGVsbEBsaW5hcm8ub3JnPgoKWyBVcHN0cmVh
bSBjb21taXQgNWIwMzAwNmQ1YzU4ZGRkMzFjYWY1NDJlZWY0ZDAyNjliY2YyNjViMyBdCgpXaGVu
IENPTkZJR19YODY9biBmdW5jdGlvbiBhenhfc25vb3AgZG9lc24ndCB1c2UgdGhlIHZhcmlhYmxl
IGNoaXAgaXQKb25seSByZXR1cm5zIHRydWUuCgpzb3VuZC9wY2kvaGRhL2hkYV9pbnRlbC5jOiBJ
biBmdW5jdGlvbiDigJhkbWFfYWxsb2NfcGFnZXPigJk6CnNvdW5kL3BjaS9oZGEvaGRhX2ludGVs
LmM6MjAwMjoxNDogd2FybmluZzogdW51c2VkIHZhcmlhYmxlIOKAmGNoaXDigJkgWy1XdW51c2Vk
LXZhcmlhYmxlXQogIHN0cnVjdCBhenggKmNoaXAgPSBidXNfdG9fYXp4KGJ1cyk7CiAgICAgICAg
ICAgICAgXn5+fgoKQ3JlYXRlIGEgaW5saW5lIGZ1bmN0aW9uIG9mIGF6eF9zbm9vcC4KCkZpeGVz
OiBhNDFkMTIyNDQ5YmUgKCJBTFNBOiBoZGEgLSBFbWJlZCBidXMgaW50byBjb250cm9sbGVyIG9i
amVjdCIpClNpZ25lZC1vZmYtYnk6IEFuZGVycyBSb3hlbGwgPGFuZGVycy5yb3hlbGxAbGluYXJv
Lm9yZz4KU2lnbmVkLW9mZi1ieTogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPgpTaWduZWQt
b2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogc291bmQvcGNpL2hk
YS9oZGFfY29udHJvbGxlci5oIHwgOSArKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQvcGNpL2hkYS9oZGFf
Y29udHJvbGxlci5oIGIvc291bmQvcGNpL2hkYS9oZGFfY29udHJvbGxlci5oCmluZGV4IDhhOWRk
NDc2N2IxZS4uNjNjYzEwNjA0YWZjIDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL2hkYV9jb250
cm9sbGVyLmgKKysrIGIvc291bmQvcGNpL2hkYS9oZGFfY29udHJvbGxlci5oCkBAIC0xNzYsMTEg
KzE3NiwxMCBAQCBzdHJ1Y3QgYXp4IHsKICNkZWZpbmUgYXp4X2J1cyhjaGlwKQkoJihjaGlwKS0+
YnVzLmNvcmUpCiAjZGVmaW5lIGJ1c190b19hengoX2J1cykJY29udGFpbmVyX29mKF9idXMsIHN0
cnVjdCBhengsIGJ1cy5jb3JlKQogCi0jaWZkZWYgQ09ORklHX1g4NgotI2RlZmluZSBhenhfc25v
b3AoY2hpcCkJCSgoY2hpcCktPnNub29wKQotI2Vsc2UKLSNkZWZpbmUgYXp4X3Nub29wKGNoaXAp
CQl0cnVlCi0jZW5kaWYKK3N0YXRpYyBpbmxpbmUgYm9vbCBhenhfc25vb3Aoc3RydWN0IGF6eCAq
Y2hpcCkKK3sKKwlyZXR1cm4gIUlTX0VOQUJMRUQoQ09ORklHX1g4NikgfHwgY2hpcC0+c25vb3A7
Cit9CiAKIC8qCiAgKiBtYWNyb3MgZm9yIGVhc3kgdXNlCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
