Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FC42FDB17
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 21:47:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1685317ED;
	Wed, 20 Jan 2021 21:46:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1685317ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611175657;
	bh=+pyVqusL77J0P3caMC83YiqC7s33CgceeqpypLU8ZBo=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LutMT7rFzEskhRYaHWcRpzNAiazIr4tjxskzDj36EotgjccyNAYhyMMYaIDRdjONT
	 5IpAduEPULE9p6HHz2NQVZ0Cf+UNcfUK+k6GumNcNOtCjv2puUYroVJkBYak9TsDUj
	 qslabfX3sLq7eZQ7LjdKzkDcnnTMgDa0aiGnJIL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 884A2F8019B;
	Wed, 20 Jan 2021 21:46:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71514F80137; Wed, 20 Jan 2021 21:46:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6EDFF80137
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 21:45:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6EDFF80137
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73C79ABDA
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 20:45:55 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Fix hw constraints dependencies
Date: Wed, 20 Jan 2021 21:45:54 +0100
Message-Id: <20210120204554.30177-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Since the recent refactoring, it's been reported that some USB-audio
devices (typically webcams) are no longer detected properly by
PulseAudio.  The debug session revealed that it's failing at probing
by PA to try the sample rate 44.1kHz while the device has discrete
sample rates other than 44.1kHz.  But the puzzle was that arecord
works as is, and some other devices with the discrete rates work,
either.

After all, this turned out to be the lack of the dependencies in a few
hw constraint rules: snd_pcm_hw_rule_add() has the (variable)
arguments specifying the dependent parameters, and some functions
didn't set the target parameter itself as the dependencies.  This
resulted in an invalid parameter that could be generated only in a
certain call pattern.  This bug itself has been present in the code,
but it didn't trigger errors just because the rules were casually
avoiding such a corner case.  After the recent refactoring and
cleanup, however, the hw constraints work "as expected", and the
problem surfaced now.

For fixing the problem above, this patch adds the missing dependent
parameters to each snd_pcm_hw_rule() call.

Fixes: bc4e94aa8e72 ("ALSA: usb-audio: Handle discrete rates properly in hw constraints")
BugLink: http://bugzilla.opensuse.org/show_bug.cgi?id=1181014
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index f71965bf815f..078bb4c94033 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -981,6 +981,7 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 
 	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
 				  hw_rule_rate, subs,
+				  SNDRV_PCM_HW_PARAM_RATE,
 				  SNDRV_PCM_HW_PARAM_FORMAT,
 				  SNDRV_PCM_HW_PARAM_CHANNELS,
 				  param_period_time_if_needed,
@@ -990,6 +991,7 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 
 	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 				  hw_rule_channels, subs,
+				  SNDRV_PCM_HW_PARAM_CHANNELS,
 				  SNDRV_PCM_HW_PARAM_FORMAT,
 				  SNDRV_PCM_HW_PARAM_RATE,
 				  param_period_time_if_needed,
@@ -998,6 +1000,7 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 		return err;
 	err = snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_FORMAT,
 				  hw_rule_format, subs,
+				  SNDRV_PCM_HW_PARAM_FORMAT,
 				  SNDRV_PCM_HW_PARAM_RATE,
 				  SNDRV_PCM_HW_PARAM_CHANNELS,
 				  param_period_time_if_needed,
-- 
2.26.2

