Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 277B75B8438
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 11:08:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2ADC189B;
	Wed, 14 Sep 2022 11:07:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2ADC189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663146527;
	bh=mOq3bZhWB9k345JibXBrxgU7rRRFOigtopbDGHTtbz4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gHr56tuiLYbeV4rEz6YWblKhW0qutlmq478/vEcAFCNPUyvkd8DB/UU+njBAPsSU+
	 ttL5TF3EYvBGgKRrn4XA9nrgQtxu0T5pykyBv4oiVGx42OkKO7by0mVMddgpy3ZHdp
	 rk1hgcCeNzI9EJcwlhbDwTlr0hfBoZv5MsnIAJpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25CBCF80588;
	Wed, 14 Sep 2022 11:05:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7003CF8055A; Wed, 14 Sep 2022 11:05:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2B08F80553
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 11:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2B08F80553
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HHPsPTEs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 52105619C2;
 Wed, 14 Sep 2022 09:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EEBC4347C;
 Wed, 14 Sep 2022 09:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663146328;
 bh=mOq3bZhWB9k345JibXBrxgU7rRRFOigtopbDGHTtbz4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HHPsPTEsQxHgUFHsE+enS8dB8WXSerpXyevGxo1bZE0FzULxEFPvCk6f1TndG65pp
 41xzpoFYKvxTbVxVOzT5HC7SlWp2bQuxY7PB/nXeI6CTVVH84pNRl0SCFoVderlVkG
 l9EUP/MPlTsMD6Tpz4Ffe2k4nMstOJ3wJxCiD0zXHGp4Y/69NBa2c+C1DpI2Rmmt9A
 YyKz+rrTkVzGEja2bVousL9Oqw7lHnWAWPaFoxOisy0UNB+4ynSGH7gXQ/Rw4lf3eJ
 qae9CAc8uZ/Ocwiw6KOm0xj872KdXwuh0EYe8NEpFUOkBfi7eUSpxh0HMeObt8du0e
 X+f2PI0hPxgDg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 4/8] ALSA: usb-audio: Fix an out-of-bounds bug in
 __snd_usb_parse_audio_interface()
Date: Wed, 14 Sep 2022 05:05:08 -0400
Message-Id: <20220914090514.471614-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220914090514.471614-1-sashal@kernel.org>
References: <20220914090514.471614-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Dongxiang Ke <kdx.glider@gmail.com>, Takashi Iwai <tiwai@suse.de>,
 tiwai@suse.com
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

From: Dongxiang Ke <kdx.glider@gmail.com>

[ Upstream commit e53f47f6c1a56d2af728909f1cb894da6b43d9bf ]

There may be a bad USB audio device with a USB ID of (0x04fa, 0x4201) and
the number of it's interfaces less than 4, an out-of-bounds read bug occurs
when parsing the interface descriptor for this device.

Fix this by checking the number of interfaces.

Signed-off-by: Dongxiang Ke <kdx.glider@gmail.com>
Link: https://lore.kernel.org/r/20220906024928.10951-1-kdx.glider@gmail.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index 7b86bf38f10e7..133a66a7f90e4 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -502,7 +502,7 @@ int snd_usb_parse_audio_interface(struct snd_usb_audio *chip, int iface_no)
 	 * Dallas DS4201 workaround: It presents 5 altsettings, but the last
 	 * one misses syncpipe, and does not produce any sound.
 	 */
-	if (chip->usb_id == USB_ID(0x04fa, 0x4201))
+	if (chip->usb_id == USB_ID(0x04fa, 0x4201) && num >= 4)
 		num = 4;
 
 	for (i = 0; i < num; i++) {
-- 
2.35.1

