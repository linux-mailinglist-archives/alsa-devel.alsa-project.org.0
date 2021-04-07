Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A03AE357113
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Apr 2021 17:53:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F6C3166B;
	Wed,  7 Apr 2021 17:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F6C3166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617810822;
	bh=YefepU0YPUuujqbwqIdRpYLJZNUrxR3OjckSALCh6N8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tFG9JKjisZJo/pLcwmcdYnu8clo1NVdDnKbsphNrNhb0YClnGNyx/xCnZv+HMcUcR
	 aIoK6PXgkGDM/J39f/tYcKocQiCDvOZ7wJViKQJ5Zt2Hhm+icZmXUC88SrsGTA7Fud
	 hkRb3tFvgUPzaOwD76zPowkxD3vFX2otsUh5ge+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99601F80162;
	Wed,  7 Apr 2021 17:52:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6D9CF8016A; Wed,  7 Apr 2021 17:52:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE711F80124
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 17:52:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE711F80124
IronPort-SDR: WbN1VrEDCshtqcmwM5JkwHfhAg98LPsUar5ny9zb7jiro6uUlRROidxSnCX+u8bD5K63SQjsgL
 1cbE/o+tWrXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9947"; a="180882819"
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="180882819"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 08:51:41 -0700
IronPort-SDR: WCBHW/EBzOCEqchv9BygkXq7P1uZtDEOzi1mf9CxJSFdkBDF1N7Dn7Y3M15jZx/aK9EDJ0UovP
 yLIBoyOXjJ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,203,1613462400"; d="scan'208";a="421758293"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008.jf.intel.com with ESMTP; 07 Apr 2021 08:51:39 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [RFC PATCH] ALSA: hda/hdmi: fix race in handling acomp ELD
 notification at resume
Date: Wed,  7 Apr 2021 18:47:27 +0300
Message-Id: <20210407154727.589017-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com
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

Fix the issue by modifying the check to only skip ELD notification
processing if power state is D3 or deeper. This helps in the ASoC
controller case as card power state is set to D2 at start of
soc_resume_deferred().

BugLink: https://github.com/thesofproject/linux/issues/2825
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/pci/hda/patch_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

NOTES:
 - I wonder if there is a better way to check for system suspend
   case than looking at snd_power_get_state()
 - 'chip->pm_prepared' is one option, but this is not directly available
   to codec drivers
 - storing PM target is hda_codec_pm_prepare() is perhaps one option

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 5de3666a7101..a43df036db1d 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2654,7 +2654,7 @@ static void generic_acomp_pin_eld_notify(void *audio_ptr, int port, int dev_id)
 	/* skip notification during system suspend (but not in runtime PM);
 	 * the state will be updated at resume
 	 */
-	if (snd_power_get_state(codec->card) != SNDRV_CTL_POWER_D0)
+	if (snd_power_get_state(codec->card) >= SNDRV_CTL_POWER_D3)
 		return;
 	/* ditto during suspend/resume process itself */
 	if (snd_hdac_is_in_pm(&codec->core))
@@ -2840,7 +2840,7 @@ static void intel_pin_eld_notify(void *audio_ptr, int port, int pipe)
 	/* skip notification during system suspend (but not in runtime PM);
 	 * the state will be updated at resume
 	 */
-	if (snd_power_get_state(codec->card) != SNDRV_CTL_POWER_D0)
+	if (snd_power_get_state(codec->card) >= SNDRV_CTL_POWER_D3)
 		return;
 	/* ditto during suspend/resume process itself */
 	if (snd_hdac_is_in_pm(&codec->core))

base-commit: 7dc53a38e4ac00d68943bab91deadc67f07d4a0b
-- 
2.31.0

