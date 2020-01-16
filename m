Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 056E313EB53
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 18:49:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95F851824;
	Thu, 16 Jan 2020 18:48:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95F851824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579196973;
	bh=6DlNE6mdvKeNztF9sVEFB9P3QSphWeXAeqhOSJTPVOE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qRWBwRq2/au216YMN1f+gemK0CujKw6rAUp78Oc7iQDhyt8Eqsu3AaaUZxCz6QJRc
	 m9H/B0MOLcg85MF8c0mFJGr9l9RX4dUmpX6u/dbQj+HSXzW73jMtt40pbGOCFA1Xfu
	 fd6AbB/OzAnh1rnWZKaXNgqLNHq/frEbR7u8M52M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F79BF8016F;
	Thu, 16 Jan 2020 18:43:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCD01F8016F; Thu, 16 Jan 2020 18:43:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82899F80086
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 18:42:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82899F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BqchPcY/"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3765F24695;
 Thu, 16 Jan 2020 17:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579196574;
 bh=oxvTDftx1tbTSMTc3Vnyd0GHi7VxIP1tUq0pbm11jsQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BqchPcY/xWG2pCQgYSh6auRvtV1xV2vuhlIi1iSvm27UsnfKCIE5qTvfUP8slE+k7
 qUAy7zNqAAs+m9T60H7JuLdQXHYhWx5OSvv97lDtdlIax5zWl3CEVA0dHmBwwAG1tF
 zsfM4/vusQFYtY52Y0gFkTlDm07SzJrR/Y2d1zB0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 16 Jan 2020 12:39:59 -0500
Message-Id: <20200116174251.24326-2-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116174251.24326-1-sashal@kernel.org>
References: <20200116174251.24326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Anders Roxell <anders.roxell@linaro.org>
Subject: [alsa-devel] [PATCH AUTOSEL 4.4 002/174] ALSA: hda: fix unused
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
Y29udHJvbGxlci5oIGIvc291bmQvcGNpL2hkYS9oZGFfY29udHJvbGxlci5oCmluZGV4IDU1ZWM0
NDcwZjZiNi4uNDk5ODczZDI5Y2MxIDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL2hkYV9jb250
cm9sbGVyLmgKKysrIGIvc291bmQvcGNpL2hkYS9oZGFfY29udHJvbGxlci5oCkBAIC0xNjQsMTEg
KzE2NCwxMCBAQCBzdHJ1Y3QgYXp4IHsKICNkZWZpbmUgYXp4X2J1cyhjaGlwKQkoJihjaGlwKS0+
YnVzLmNvcmUpCiAjZGVmaW5lIGJ1c190b19hengoX2J1cykJY29udGFpbmVyX29mKF9idXMsIHN0
cnVjdCBhengsIGJ1cy5jb3JlKQogCi0jaWZkZWYgQ09ORklHX1g4NgotI2RlZmluZSBhenhfc25v
b3AoY2hpcCkJCSgoY2hpcCktPnNub29wKQotI2Vsc2UKLSNkZWZpbmUgYXp4X3Nub29wKGNoaXAp
CQl0cnVlCi0jZW5kaWYKK3N0YXRpYyBpbmxpbmUgYm9vbCBhenhfc25vb3Aoc3RydWN0IGF6eCAq
Y2hpcCkKK3sKKwlyZXR1cm4gIUlTX0VOQUJMRUQoQ09ORklHX1g4NikgfHwgY2hpcC0+c25vb3A7
Cit9CiAKIC8qCiAgKiBtYWNyb3MgZm9yIGVhc3kgdXNlCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBs
aXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
