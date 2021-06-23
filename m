Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 792283B1B82
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 15:47:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 001A282C;
	Wed, 23 Jun 2021 15:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 001A282C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624456071;
	bh=VZ9dMcy8if+qpRdfooKiik6IaNR8XTPMhIXUPf3EuK4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iVl6o1AvmW+dtq2S4sANT8qZm2UGB03BRqEzs56sCu2jC9HPKkH+OFEpELlfk/0Qs
	 loBEnB1BwC6D3uq8sMKsJpK0AWM4PMiuhY/12ElOmcJIk3HxbSg1ZqtGzZv0wtTEr0
	 oCadmLXN+YFHk68j1feEyn4HGzxXNmF2iebxCLEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73ABCF801D5;
	Wed, 23 Jun 2021 15:46:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F343F801D5; Wed, 23 Jun 2021 15:46:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2551EF800B5
 for <alsa-devel@alsa-project.org>; Wed, 23 Jun 2021 15:46:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2551EF800B5
IronPort-SDR: lYFF8+jcubFO9+QOy8purGYBo6Gt/SNQjyIV+qF3BmiHl+S5DCDuezE2VTHTKxbo11SMMiv7/E
 t2ouXCJ3CvNA==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="207200310"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="207200310"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 06:46:07 -0700
IronPort-SDR: QmmaNyHPt/kDF2exNRI2+7bBZe9G4nt/yVAQCu1fTk9gokGRCW0YPhozcX57YLRoNMcZcoj8xy
 XKITrhfi37tA==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; d="scan'208";a="453039198"
Received: from ideak-desk.fi.intel.com ([10.237.68.141])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 06:46:06 -0700
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] ALSA: hda: Release codec display power during
 shutdown/reboot
Date: Wed, 23 Jun 2021 16:46:01 +0300
Message-Id: <20210623134601.2128663-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210623134601.2128663-1-imre.deak@intel.com>
References: <20210623134601.2128663-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

Similarly to the previous patch for the HDA controller make sure here
that codecs also drop the display power reference during shutdown and
reboot.

This fixes a power ref leaked WARN in i915 during shutdown if the HDA
driver is built with CONFIG_PM=n.

Suggested-by: Takashi Iwai <tiwai@suse.de>
References: https://gitlab.freedesktop.org/drm/intel/-/issues/3618
References: https://lore.kernel.org/intel-gfx/s5hzgvhngw6.wl-tiwai@suse.de
Cc: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 sound/pci/hda/hda_bind.c  |  7 +++++--
 sound/pci/hda/hda_codec.c | 10 +++++-----
 sound/pci/hda/hda_local.h |  2 ++
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/sound/pci/hda/hda_bind.c b/sound/pci/hda/hda_bind.c
index 17a25e453f60c..e8dee24c309da 100644
--- a/sound/pci/hda/hda_bind.c
+++ b/sound/pci/hda/hda_bind.c
@@ -167,8 +167,11 @@ static void hda_codec_driver_shutdown(struct device *dev)
 {
 	struct hda_codec *codec = dev_to_hda_codec(dev);
 
-	if (!pm_runtime_suspended(dev) && codec->patch_ops.reboot_notify)
-		codec->patch_ops.reboot_notify(codec);
+	if (!pm_runtime_suspended(dev)) {
+		if (codec->patch_ops.reboot_notify)
+			codec->patch_ops.reboot_notify(codec);
+		snd_hda_codec_display_power(codec, false);
+	}
 }
 
 int __hda_codec_driver_register(struct hda_codec_driver *drv, const char *name,
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 5462f771c2f90..7a717e1511569 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -798,7 +798,7 @@ static unsigned int hda_set_power_state(struct hda_codec *codec,
 				unsigned int power_state);
 
 /* enable/disable display power per codec */
-static void codec_display_power(struct hda_codec *codec, bool enable)
+void snd_hda_codec_display_power(struct hda_codec *codec, bool enable)
 {
 	if (codec->display_power_control)
 		snd_hdac_display_power(&codec->bus->core, codec->addr, enable);
@@ -810,7 +810,7 @@ void snd_hda_codec_register(struct hda_codec *codec)
 	if (codec->registered)
 		return;
 	if (device_is_registered(hda_codec_dev(codec))) {
-		codec_display_power(codec, true);
+		snd_hda_codec_display_power(codec, true);
 		pm_runtime_enable(hda_codec_dev(codec));
 		/* it was powered up in snd_hda_codec_new(), now all done */
 		snd_hda_power_down(codec);
@@ -836,7 +836,7 @@ static int snd_hda_codec_dev_free(struct snd_device *device)
 	 */
 	if (codec->core.type == HDA_DEV_LEGACY)
 		snd_hdac_device_unregister(&codec->core);
-	codec_display_power(codec, false);
+	snd_hda_codec_display_power(codec, false);
 
 	/*
 	 * In the case of ASoC HD-audio bus, the device refcount is released in
@@ -2893,7 +2893,7 @@ static int hda_codec_runtime_suspend(struct device *dev)
 	    (codec_has_clkstop(codec) && codec_has_epss(codec) &&
 	     (state & AC_PWRST_CLK_STOP_OK)))
 		snd_hdac_codec_link_down(&codec->core);
-	codec_display_power(codec, false);
+	snd_hda_codec_display_power(codec, false);
 	return 0;
 }
 
@@ -2905,7 +2905,7 @@ static int hda_codec_runtime_resume(struct device *dev)
 	if (!codec->card)
 		return 0;
 
-	codec_display_power(codec, true);
+	snd_hda_codec_display_power(codec, true);
 	snd_hdac_codec_link_up(&codec->core);
 	hda_call_codec_resume(codec);
 	pm_runtime_mark_last_busy(dev);
diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
index 4c5589c10f1d6..8d2503e8dad86 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -709,6 +709,8 @@ void snd_hdmi_write_eld_info(struct hdmi_eld *eld,
 #define SND_PRINT_CHANNEL_ALLOCATION_ADVISED_BUFSIZE 80
 void snd_print_channel_allocation(int spk_alloc, char *buf, int buflen);
 
+void snd_hda_codec_display_power(struct hda_codec *codec, bool enable);
+
 /*
  */
 #define codec_err(codec, fmt, args...) \
-- 
2.27.0

