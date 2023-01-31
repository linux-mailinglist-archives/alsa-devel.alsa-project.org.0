Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFE868293F
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 10:43:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14C291E8;
	Tue, 31 Jan 2023 10:42:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14C291E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675158213;
	bh=UT+NZKX/vxNv4Vu5HOlOxFkFDloi3ctrdN+KQD9272s=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=tlC/3vaj1lHBxPTwO4OCQ81LrY5iI/YqTTQE5z3s/C7ojjHBECbS/947dFmegWDWP
	 oX7MtZeZFU5fnFODtVNUhKQOmUhpp2Z/y6pF133OPWbIaD/y1pGKNq8K4tor7abYwR
	 ZgJDX54T82ctGFHp/5WE8FD+iYOvBLGXrdr/LDDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63370F80155;
	Tue, 31 Jan 2023 10:42:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A855F804C2; Tue, 31 Jan 2023 10:42:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1C9CF80155
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 10:42:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1C9CF80155
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=cmWzNFBl
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id CBE3E400;
 Tue, 31 Jan 2023 10:42:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz CBE3E400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1675158143; bh=0YAr0dv0i2dKZiBauoSgIysmXP5uqjbn7ED/PxvjXkI=;
 h=From:To:Cc:Subject:Date:From;
 b=cmWzNFBlNRRNB7UWrCNZXfWPhgWNeSqcmj6a2esQNhnQ9jDG1e1owWij+90/V8zwX
 en2R04u2RicAwjlqFVHl8asCnVFBt/3Isb6mRf6jy8Mq78euP2IU3wjac1nrVo5g3a
 7n5JukFyy1qQGVdYWl5yuJJSwYp0KDuRnKwDe7iU=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 31 Jan 2023 10:42:20 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: hda: Fix the control element identification for
 multiple codecs
Date: Tue, 31 Jan 2023 10:42:15 +0100
Message-Id: <20230131094215.3545993-1-perex@perex.cz>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Takashi Iwai <tiwai@suse.de>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Some motherboards have multiple HDA codecs connected to the serial bus.
The current code may create multiple mixer controls with the almost
identical identification.

The current code use id.device field from the control element structure
to store the codec address to avoid such clashes for multiple codecs.
Unfortunately, the user space do not handle this correctly. For mixer
controls, only name and index are used for the identifiers.

This patch fixes this problem to compose the index using the codec
address as an offset in case, when the control already exists. It is
really unlikely that one codec will create 10 similar controls.

This patch adds new kernel module parameter 'ctl_dev_id' to allow
select the old behaviour, too. The CONFIG_SND_HDA_CTL_DEV_ID Kconfig
option sets the default value.

BugLink: https://github.com/alsa-project/alsa-lib/issues/294
BugLink: https://github.com/alsa-project/alsa-lib/issues/205
Fixes: 54d174031576 ("[ALSA] hda-codec - Fix connection list parsing")
Fixes: 1afe206ab699 ("ALSA: hda - Try to find an empty control index when it's occupied")
Signed-off-by: Jaroslav Kysela <perex@perex.cz>

--

rfc..v1:
 - added CONFIG_SND_HDA_CTL_DEV_ID Kconfig option
---
 include/sound/hda_codec.h      |  1 +
 sound/pci/hda/Kconfig          | 14 ++++++++++++++
 sound/pci/hda/hda_codec.c      | 13 ++++++++++---
 sound/pci/hda/hda_controller.c |  1 +
 sound/pci/hda/hda_controller.h |  1 +
 sound/pci/hda/hda_intel.c      |  6 ++++++
 6 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index eba23daf2c29..bbb7805e85d8 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -259,6 +259,7 @@ struct hda_codec {
 	unsigned int relaxed_resume:1;	/* don't resume forcibly for jack */
 	unsigned int forced_resume:1; /* forced resume for jack */
 	unsigned int no_stream_clean_at_suspend:1; /* do not clean streams at suspend */
+	unsigned int ctl_dev_id:1; /* old control element id build behaviour */
 
 #ifdef CONFIG_PM
 	unsigned long power_on_acct;
diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 06d304db4183..886255a03e8b 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -302,6 +302,20 @@ config SND_HDA_INTEL_HDMI_SILENT_STREAM
 	  This feature can impact power consumption as resources
 	  are kept reserved both at transmitter and receiver.
 
+config SND_HDA_CTL_DEV_ID
+	bool "Use the device identifier field for controls"
+	depends on SND_HDA_INTEL
+	help
+	  Say Y to use the device identifier field for (mixer)
+	  controls (old behaviour until this option is available).
+
+	  When enabled, the multiple HDA codecs may set the device
+	  field in control (mixer) element identifiers. The use
+	  of this field is not recommended and defined for mixer controls.
+
+	  The old behaviour (Y) is obsolete and will be removed. Consider
+	  to not enable this option.
+
 endif
 
 endmenu
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index edd653ece70d..8f20abc036bf 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -3390,7 +3390,12 @@ int snd_hda_add_new_ctls(struct hda_codec *codec,
 			kctl = snd_ctl_new1(knew, codec);
 			if (!kctl)
 				return -ENOMEM;
-			if (addr > 0)
+			/* Do not use the id.device field for MIXER elements.
+			 * This field is for real device numbers (like PCM) but codecs
+			 * are hidden components from the user space view (unrelated
+			 * to the mixer element identification).
+			 */
+			if (addr > 0 && codec->ctl_dev_id)
 				kctl->id.device = addr;
 			if (idx > 0)
 				kctl->id.index = idx;
@@ -3401,9 +3406,11 @@ int snd_hda_add_new_ctls(struct hda_codec *codec,
 			 * the codec addr; if it still fails (or it's the
 			 * primary codec), then try another control index
 			 */
-			if (!addr && codec->core.addr)
+			if (!addr && codec->core.addr) {
 				addr = codec->core.addr;
-			else if (!idx && !knew->index) {
+				if (!codec->ctl_dev_id)
+					idx += 10 * addr;
+			} else if (!idx && !knew->index) {
 				idx = find_empty_mixer_ctl_idx(codec,
 							       knew->name, 0);
 				if (idx <= 0)
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 0ff286b7b66b..083df287c1a4 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -1231,6 +1231,7 @@ int azx_probe_codecs(struct azx *chip, unsigned int max_slots)
 				continue;
 			codec->jackpoll_interval = chip->jackpoll_interval;
 			codec->beep_mode = chip->beep_mode;
+			codec->ctl_dev_id = chip->ctl_dev_id;
 			codecs++;
 		}
 	}
diff --git a/sound/pci/hda/hda_controller.h b/sound/pci/hda/hda_controller.h
index f5bf295eb830..8556031bcd68 100644
--- a/sound/pci/hda/hda_controller.h
+++ b/sound/pci/hda/hda_controller.h
@@ -124,6 +124,7 @@ struct azx {
 	/* HD codec */
 	int  codec_probe_mask; /* copied from probe_mask option */
 	unsigned int beep_mode;
+	bool ctl_dev_id;
 
 #ifdef CONFIG_SND_HDA_PATCH_LOADER
 	const struct firmware *fw;
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 87002670c0c9..048656234280 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -119,6 +119,8 @@ static bool beep_mode[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] =
 					CONFIG_SND_HDA_INPUT_BEEP_MODE};
 #endif
 static bool dmic_detect = 1;
+static bool ctl_dev_id[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] =
+					CONFIG_SND_HDA_CTL_DEV_ID};
 
 module_param_array(index, int, NULL, 0444);
 MODULE_PARM_DESC(index, "Index value for Intel HD audio interface.");
@@ -157,6 +159,8 @@ module_param(dmic_detect, bool, 0444);
 MODULE_PARM_DESC(dmic_detect, "Allow DSP driver selection (bypass this driver) "
 			     "(0=off, 1=on) (default=1); "
 		 "deprecated, use snd-intel-dspcfg.dsp_driver option instead");
+module_param_array(ctl_dev_id, bool, NULL, 0444);
+MODULE_PARM_DESC(ctl_dev_id, "Use control device identifier (based on codec address).");
 
 #ifdef CONFIG_PM
 static int param_set_xint(const char *val, const struct kernel_param *kp);
@@ -2278,6 +2282,8 @@ static int azx_probe_continue(struct azx *chip)
 	chip->beep_mode = beep_mode[dev];
 #endif
 
+	chip->ctl_dev_id = ctl_dev_id[dev];
+
 	/* create codec instances */
 	if (bus->codec_mask) {
 		err = azx_probe_codecs(chip, azx_max_codecs[chip->driver_type]);
-- 
2.39.0

