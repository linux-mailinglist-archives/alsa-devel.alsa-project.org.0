Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E5944B67B
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 23:24:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8599D1657;
	Tue,  9 Nov 2021 23:23:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8599D1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636496670;
	bh=OXp0f50fIwKe5A8ng8EYY+C7aGVgb0MmMfZBWxF7nFE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YNgou7fD7Gg6NOJqjqrLnpRvJzhHTMpyAXKRv4t6RBNghZrCUYYLlMRBeoiFj8W1s
	 P5vVcW647euVFXZl8TAkuPFRjXVKCeABerWt6CWVoFRL9QEhRY7nV81cifawNkyd8q
	 yNVPVuc2pus0KwP6gp4KadRuJ3+QGBK6qDEl9LHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 933C2F8053B;
	Tue,  9 Nov 2021 23:20:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86B94F804FA; Tue,  9 Nov 2021 23:20:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F57AF804FD
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 23:20:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F57AF804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p8jVYlU6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D723361A50;
 Tue,  9 Nov 2021 22:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636496405;
 bh=OXp0f50fIwKe5A8ng8EYY+C7aGVgb0MmMfZBWxF7nFE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p8jVYlU6jlxguOj9ePJ1imn0OquIT/VLLEEb2uxiHshEFUXXT1HvqUd4xE/fRG9BN
 069QUvr8Zc8zY62U50mGfZgGKqJQILcwZGiNz+JnLdItJNV6YrtcSGKMo812pGzQ+D
 8/2zJJ7BxSBxpjfE2kRsb17ZUI5HvFO+dN8oKxx6QPCyMBCIfn2TkTHPntKUvHTtHO
 rmJNspmhpNVOOXAQhyaAUABrN9yLrlH9Jdst4lFndmYmh2x55MkKoT08RuXzvQzK1V
 e+2E1k/YDTaCgx1VU7K9KOZZP7IeRKhzMPq9XFNWF6oeYIkhqgGdJgxAIkTuevP/S7
 nVn0FWEhzapzQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 35/75] ALSA: usb-audio: disable implicit feedback
 sync for Behringer UFX1204 and UFX1604
Date: Tue,  9 Nov 2021 17:18:25 -0500
Message-Id: <20211109221905.1234094-35-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211109221905.1234094-1-sashal@kernel.org>
References: <20211109221905.1234094-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, tiwai@suse.com,
 Geraldo Nascimento <geraldogabriel@gmail.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Geraldo Nascimento <geraldogabriel@gmail.com>

[ Upstream commit 28c369e60827f706cef4604a3e2848198f25bd26 ]

Behringer UFX1204 and UFX1604 have Synchronous endpoints to which
current ALSA code applies implicit feedback sync as if they were
Asynchronous endpoints. This breaks UAC compliance and is unneeded.

The commit 5e35dc0338d85ccebacf3f77eca1e5dea73155e8 and subsequent
1a15718b41df026cffd0e42cfdc38a1384ce19f9 were meant to clear up noise.

Unfortunately, noise persisted for those using higher sample rates and
this was only solved by commit d2e8f641257d0d3af6e45d6ac2d6f9d56b8ea964

Since there are no more reports of noise, let's get rid of the
implicit-fb quirks breaking UAC compliance.

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
Link: https://lore.kernel.org/r/YVYSnoQ7nxLXT0Dq@geday
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/implicit.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 590a0dbba7a21..34461947260b2 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -54,8 +54,6 @@ static const struct snd_usb_implicit_fb_match playback_implicit_fb_quirks[] = {
 
 	/* Fixed EP */
 	/* FIXME: check the availability of generic matching */
-	IMPLICIT_FB_FIXED_DEV(0x1397, 0x0001, 0x81, 1), /* Behringer UFX1604 */
-	IMPLICIT_FB_FIXED_DEV(0x1397, 0x0002, 0x81, 1), /* Behringer UFX1204 */
 	IMPLICIT_FB_FIXED_DEV(0x2466, 0x8010, 0x81, 2), /* Fractal Audio Axe-Fx III */
 	IMPLICIT_FB_FIXED_DEV(0x31e9, 0x0001, 0x81, 2), /* Solid State Logic SSL2 */
 	IMPLICIT_FB_FIXED_DEV(0x31e9, 0x0002, 0x81, 2), /* Solid State Logic SSL2+ */
-- 
2.33.0

