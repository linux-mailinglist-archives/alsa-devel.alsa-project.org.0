Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B3A1FDD52
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:25:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4B1C16AA;
	Thu, 18 Jun 2020 03:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4B1C16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592443558;
	bh=TNCde89qMsDt3lwOoVvwuyjPZiBciZnqF2mqdJ5bh8g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YhKnrVmUbLIJvOh6Sf94b0euo88mOBW8x4e6Pf1GAZ+t3HkY9jClf1Q+b/AgD8HE3
	 A/raqI+3hwApT5/JjEvjB13h+JqRjhaiuBTvZCoiy9uTyJsMJykS0x636c6hu77dHz
	 X/2+o4ECpaxYkJHVbVQCJB5OadggVhCxcFgc49vw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2F2BF802F7;
	Thu, 18 Jun 2020 03:12:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D777AF80390; Thu, 18 Jun 2020 03:12:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E64AF802E2
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 03:12:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E64AF802E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FWoWCqnv"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 268A021924;
 Thu, 18 Jun 2020 01:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592442758;
 bh=TNCde89qMsDt3lwOoVvwuyjPZiBciZnqF2mqdJ5bh8g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FWoWCqnvgk5jawV+64YU8C/00ihD3fN8AkWK750rSWNHFVXvgfAhpkGTAaRvT2mZB
 k5Wqpz0Rh2S9RzSN034cA2B36dD9CeRYBFIGzjzIhkEIXi0lqbkp7EdlUcrMRR1e2o
 Fp1PDErmtpo5sc0LFqG18mxTaZWguNtKnGu1JU+8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 209/388] ALSA: usb-audio: fixing upper volume
 limit for RME Babyface Pro routing crosspoints
Date: Wed, 17 Jun 2020 21:05:06 -0400
Message-Id: <20200618010805.600873-209-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Thomas Ebeling <penguins@bollie.de>
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

From: Thomas Ebeling <penguins@bollie.de>

[ Upstream commit 47b4f5f5b65680fbef7a7a9a4796b35f38a6e43e ]

In my initial patch, these were set too low.

Fixes: 3e8f3bd04716 ("ALSA: usb-audio: RME Babyface Pro mixer patch")
Signed-off-by: Thomas Ebeling <penguins@bollie.de>
Link: https://lore.kernel.org/r/20200515114556.vtspnonzvp4xp44m@bollie.ca9.eu
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/mixer_quirks.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index bdff8674942e..aad2683ff793 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2191,7 +2191,7 @@ static int snd_rme_controls_create(struct usb_mixer_interface *mixer)
  * These devices exposes a couple of DSP functions via request to EP0.
  * Switches are available via control registers, while routing is controlled
  * by controlling the volume on each possible crossing point.
- * Volume control is linear, from -inf (dec. 0) to +6dB (dec. 46341) with
+ * Volume control is linear, from -inf (dec. 0) to +6dB (dec. 65536) with
  * 0dB being at dec. 32768.
  */
 enum {
@@ -2220,7 +2220,7 @@ enum {
 #define SND_BBFPRO_MIXER_VAL_MASK 0x3ffff
 #define SND_BBFPRO_MIXER_VAL_SHIFT 9
 #define SND_BBFPRO_MIXER_VAL_MIN 0 // -inf
-#define SND_BBFPRO_MIXER_VAL_MAX 46341 // +6dB
+#define SND_BBFPRO_MIXER_VAL_MAX 65536 // +6dB
 
 #define SND_BBFPRO_USBREQ_CTL_REG1 0x10
 #define SND_BBFPRO_USBREQ_CTL_REG2 0x17
-- 
2.25.1

