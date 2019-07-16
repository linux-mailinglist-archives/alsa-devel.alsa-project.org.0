Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A72786A2A9
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jul 2019 09:07:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A585168B;
	Tue, 16 Jul 2019 09:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A585168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563260860;
	bh=CmDOnPo/W4nSQQtnbxZtMKeV9ozzvikbEhYgZ0gOT9w=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tPIA9LWQ0ZO/evTw1Q4HUuP9/GqbArmcwk4BHpEze+nqu2ChnlP03jfHCRmD3Dimp
	 obTH/HnReHHtmXRkc7a2YAuR5P+FyPfswb6Lvg/jHpCCgvK/jZGjM8/J7klU1ZvVVx
	 EyIvQ8y7014wDwmojFfhXdWuztPFD9lXxOi7yrV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BA62F80376;
	Tue, 16 Jul 2019 09:05:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC20BF80376; Tue, 16 Jul 2019 09:05:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69576F802BC
 for <alsa-devel@alsa-project.org>; Tue, 16 Jul 2019 09:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69576F802BC
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DF03AAE9A;
 Tue, 16 Jul 2019 07:05:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 16 Jul 2019 09:05:39 +0200
Message-Id: <20190716070539.10424-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Todd Brandt <todd.e.brandt@linux.intel.com>, Len Brown <lenb@kernel.org>
Subject: [alsa-devel] [PATCH] ALSA: hda - Don't resume forcibly i915 HDMI/DP
	codec
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

We apply the codec resume forcibly at system resume callback for
updating and syncing the jack detection state that may have changed
during sleeping.  This is, however, superfluous for the codec like
Intel HDMI/DP, where the jack detection is managed via the audio
component notification; i.e. the jack state change shall be reported
sooner or later from the graphics side at mode change.

This patch changes the codec resume callback to avoid the forcible
resume conditionally with a new flag, codec->relaxed_resume, for
reducing the resume time.  The flag is set in the codec probe.

Although this doesn't fix the entire bug mentioned in the bugzilla
entry below, it's still a good optimization and some improvements are
seen.

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=201901
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hda_codec.h  | 2 ++
 sound/pci/hda/hda_codec.c  | 8 ++++++--
 sound/pci/hda/patch_hdmi.c | 6 +++++-
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 8f46ff3449d5..871993696c5f 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -252,6 +252,8 @@ struct hda_codec {
 	unsigned int auto_runtime_pm:1; /* enable automatic codec runtime pm */
 	unsigned int force_pin_prefix:1; /* Add location prefix */
 	unsigned int link_down_at_suspend:1; /* link down at runtime suspend */
+	unsigned int relaxed_resume:1;	/* don't resume forcibly for jack */
+
 #ifdef CONFIG_PM
 	unsigned long power_on_acct;
 	unsigned long power_off_acct;
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 5346631df1ec..e30e86ca6b72 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -2941,15 +2941,19 @@ static int hda_codec_runtime_resume(struct device *dev)
 #ifdef CONFIG_PM_SLEEP
 static int hda_codec_force_resume(struct device *dev)
 {
+	struct hda_codec *codec = dev_to_hda_codec(dev);
+	bool forced_resume = !codec->relaxed_resume;
 	int ret;
 
 	/* The get/put pair below enforces the runtime resume even if the
 	 * device hasn't been used at suspend time.  This trick is needed to
 	 * update the jack state change during the sleep.
 	 */
-	pm_runtime_get_noresume(dev);
+	if (forced_resume)
+		pm_runtime_get_noresume(dev);
 	ret = pm_runtime_force_resume(dev);
-	pm_runtime_put(dev);
+	if (forced_resume)
+		pm_runtime_put(dev);
 	return ret;
 }
 
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 40323d91f9e4..72000f6fedca 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2292,8 +2292,10 @@ static void generic_hdmi_free(struct hda_codec *codec)
 	struct hdmi_spec *spec = codec->spec;
 	int pin_idx, pcm_idx;
 
-	if (codec_has_acomp(codec))
+	if (codec_has_acomp(codec)) {
 		snd_hdac_acomp_register_notifier(&codec->bus->core, NULL);
+		codec->relaxed_resume = 0;
+	}
 
 	for (pin_idx = 0; pin_idx < spec->num_pins; pin_idx++) {
 		struct hdmi_spec_per_pin *per_pin = get_pin(spec, pin_idx);
@@ -2566,6 +2568,8 @@ static void register_i915_notifier(struct hda_codec *codec)
 	spec->drm_audio_ops.pin_eld_notify = intel_pin_eld_notify;
 	snd_hdac_acomp_register_notifier(&codec->bus->core,
 					&spec->drm_audio_ops);
+	/* no need for forcible resume for jack check thanks to notifier */
+	codec->relaxed_resume = 1;
 }
 
 /* setup_stream ops override for HSW+ */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
