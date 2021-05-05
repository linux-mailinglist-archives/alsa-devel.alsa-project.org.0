Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CAA3740C5
	for <lists+alsa-devel@lfdr.de>; Wed,  5 May 2021 18:38:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8525416D1;
	Wed,  5 May 2021 18:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8525416D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620232683;
	bh=+jyHgxAPc73OHt2eH+HMNJcBfYBff92VJHqGAg42OQ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bq6793Q39b86Rr4/sFWFB5anpN/x/PsdDfKCN367JLezBie6knfuXjArgvkOGU5ig
	 J4788gahbpweoHwEyeg/O/6yi4OPIbdSDjpAeQhG8oTKVdOHDc6twCjKJfnpQxl3zw
	 Q/IA29zlGNqsvfdmF5uWeTL/ptE0ooyOawpS1QKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7803FF80506;
	Wed,  5 May 2021 18:33:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB95BF804FA; Wed,  5 May 2021 18:33:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDB05F804FE
 for <alsa-devel@alsa-project.org>; Wed,  5 May 2021 18:33:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDB05F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MTXzRbjm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F71761447;
 Wed,  5 May 2021 16:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232401;
 bh=+jyHgxAPc73OHt2eH+HMNJcBfYBff92VJHqGAg42OQ8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MTXzRbjm6KzFvZjLzzdByuXMs3c/IEgnzcL6dHHqxDzArSBpH3eMDFxEDxviPDAO/
 P481gRaCF1d9ywvVlRPGC3w6rvMYo6F+lwzT193uSIjjP8rnC4YaSjdW0ti70h4CRb
 S4GcOq7PZb9rnJ4cePlRCGSzR3QDENmwRbXthsjdQuFk5wREITvnX8Xv2u9v68V7sv
 Jx1Vu1DGuKRm63xp27kjx3m0Vexsu6d18SK7NuIAf24Fj+G0dP4Arc01X92Z/K2YiF
 B4q34leDSa0XW+AfYBeDeAOXRGt0OC1gZFqUp9lroJDUBRS2LLyWt0Jc+jVYbSjSld
 l8g8kFFGQDd2Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 082/116] ALSA: hda/hdmi: fix race in handling
 acomp ELD notification at resume
Date: Wed,  5 May 2021 12:30:50 -0400
Message-Id: <20210505163125.3460440-82-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163125.3460440-1-sashal@kernel.org>
References: <20210505163125.3460440-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

[ Upstream commit 0c37e2eb6b83e375e8a654d01598292d5591fc65 ]

When snd-hda-codec-hdmi is used with ASoC HDA controller like SOF (acomp
used for ELD notifications), display connection change done during suspend,
can be lost due to following sequence of events:

  1. system in S3 suspend
  2. DP/HDMI receiver connected
  3. system resumed
  4. HDA controller resumed, but card->deferred_resume_work not complete
  5. acomp eld_notify callback
  6. eld_notify ignored as power state is not CTL_POWER_D0
  7. HDA resume deferred work completed, power state set to CTL_POWER_D0

This results in losing the notification, and the jack state reported to
user-space is not correct.

The check on step 6 was added in commit 8ae743e82f0b ("ALSA: hda - Skip
ELD notification during system suspend"). It would seem with the deferred
resume logic in ASoC core, this check is not safe.

Fix the issue by modifying the check to use "dev.power.power_state.event"
instead of ALSA specific card power state variable.

BugLink: https://github.com/thesofproject/linux/issues/2825
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20210416131157.1881366-1-kai.vehmanen@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 5de3666a7101..4b2cc8cb55c4 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2654,7 +2654,7 @@ static void generic_acomp_pin_eld_notify(void *audio_ptr, int port, int dev_id)
 	/* skip notification during system suspend (but not in runtime PM);
 	 * the state will be updated at resume
 	 */
-	if (snd_power_get_state(codec->card) != SNDRV_CTL_POWER_D0)
+	if (codec->core.dev.power.power_state.event == PM_EVENT_SUSPEND)
 		return;
 	/* ditto during suspend/resume process itself */
 	if (snd_hdac_is_in_pm(&codec->core))
@@ -2840,7 +2840,7 @@ static void intel_pin_eld_notify(void *audio_ptr, int port, int pipe)
 	/* skip notification during system suspend (but not in runtime PM);
 	 * the state will be updated at resume
 	 */
-	if (snd_power_get_state(codec->card) != SNDRV_CTL_POWER_D0)
+	if (codec->core.dev.power.power_state.event == PM_EVENT_SUSPEND)
 		return;
 	/* ditto during suspend/resume process itself */
 	if (snd_hdac_is_in_pm(&codec->core))
-- 
2.30.2

