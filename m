Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC0316065D
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Feb 2020 21:37:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B573D1674;
	Sun, 16 Feb 2020 21:36:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B573D1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581885426;
	bh=GEJRlp5F4V5J4/lWrCG2Z8OvHySUlTglwfWPok62jA4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TvDHs3wtLKWiz4b5zlGi7EQIEKYhMtXUWezrKfGCvO7G9tUzpSzwF4hAHiouBF6l4
	 EAoDteN8h+ukhnBoR5iiaq+fAp2D8kFxy7tsPtDuAKXyUCUj7W2crRFHV1JO97fVmz
	 1aFnebDz1sZVRD9VC69KuKo+uUDi8bvQjIhWr+I0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5F64F80096;
	Sun, 16 Feb 2020 21:35:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24514F80145; Sun, 16 Feb 2020 21:35:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01C33F800B6
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 21:35:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01C33F800B6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9DE7EAF6E;
 Sun, 16 Feb 2020 20:35:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun, 16 Feb 2020 21:35:16 +0100
Message-Id: <20200216203516.10869-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: SOF: intel: Fix probe error without i915
	graphics
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

When the driver is configured with CONFIG_SND_SOC_SOF_HDA, the SOF
driver tries to bind with i915 audio component.  But there is also a
system without Intel graphics.  On such a system, snd_hdac_i915_init()
returns -ENODEV error and it leads to the whole probe error of SOF
driver.

For avoiding this spurious probe error, this patch changes
snd_hdac_i915_init() to return -ENOENT for non-existing i915 graphics
case.  Then the caller can check the error code and handle as no fatal
error.

In SOF side, a few changes have been added to hda_codec_i915_init()
and hda_codec_i915_exit() for skipping the i915 init and exit calls
on such a system.

BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1163677
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=206085
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

This is an attempt to fix the regression for HP OMEN 17, which showed
the probe error as:
  [    6.278811] sof-audio-pci 0000:00:1f.3: error: init i915 and HDMI codec failed
  [    6.278907] sof-audio-pci 0000:00:1f.3: error: failed to probe DSP -19

Although the i915 binding error is gone by the patch, it still fails
to probe:

  [    6.298259] sof-audio-pci 0000:00:1f.3: error: no matching ASoC machine driver found - aborting probe
  [    6.298299] sof-audio-pci 0000:00:1f.3: error: failed to get machine info -19
  [    6.298668] sof-audio-pci 0000:00:1f.3: error: sof_probe_work failed err: -19

I'm submitting this fix as is for now since the i915 error itself
gets fixed, and the rest seems to be another unsolved problem.


Takashi

 sound/hda/hdac_i915.c           | 4 +++-
 sound/soc/sof/intel/hda-codec.c | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 3c2db3816029..a451df3efc8a 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -116,6 +116,8 @@ static const struct drm_audio_component_audio_ops i915_init_ops = {
  * with i915 graphics driver.
  *
  * Returns zero for success or a negative error code.
+ * -ENOENT indicates that i915 graphics doesn't exist.
+ * -ENODEV means the binding with i915 graphics failed.
  */
 int snd_hdac_i915_init(struct hdac_bus *bus)
 {
@@ -123,7 +125,7 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 	int err;
 
 	if (!i915_gfx_present())
-		return -ENODEV;
+		return -ENOENT;
 
 	init_completion(&bind_complete);
 
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 9106ab8dac6f..7202355a701e 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -186,6 +186,8 @@ int hda_codec_i915_init(struct snd_sof_dev *sdev)
 
 	/* i915 exposes a HDA codec for HDMI audio */
 	ret = snd_hdac_i915_init(bus);
+	if (ret == -ENOENT)
+		return 0; /* no i915 graphics present on the system */
 	if (ret < 0)
 		return ret;
 
@@ -200,6 +202,9 @@ int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	int ret;
 
+	if (!bus->audio_component) /* not bound with i915 */
+		return 0;
+
 	hda_codec_i915_display_power(sdev, false);
 
 	ret = snd_hdac_i915_exit(bus);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
