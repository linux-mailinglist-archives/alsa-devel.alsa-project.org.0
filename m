Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7182E9BD9
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jan 2021 18:19:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE4171681;
	Mon,  4 Jan 2021 18:18:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE4171681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609780765;
	bh=kIXHkYwbUmmpWS0jjfhOl2fuwgzJ9//8uxJKxn7Yvs8=;
	h=Subject:From:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UITQJ0EupPM+NX2de7GTdnNye/rTG2L1OlZZhujis9imi2ZtyEMUT1PUpstMVzcU3
	 vElE95gV3OqD2cBg+H6oMErM3CBwhlEoDxloT8r76pDOFybelXI7cjjkgKkAjaXS0j
	 BzU9tk5qiMICQRuGi24KqlQ2XdN7RUlz9aZzuErg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 331BFF80167;
	Mon,  4 Jan 2021 18:17:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F294EF80166; Mon,  4 Jan 2021 18:17:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=KHOP_HELO_FCRDNS, PRX_BODYSUB_1,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0166.hostedemail.com
 [216.40.44.166])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29328F80158
 for <alsa-devel@alsa-project.org>; Mon,  4 Jan 2021 18:17:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29328F80158
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 0FDDB1802912E;
 Mon,  4 Jan 2021 17:17:39 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: paint83_5911201274d2
X-Filterd-Recvd-Size: 64017
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf17.hostedemail.com (Postfix) with ESMTPA;
 Mon,  4 Jan 2021 17:17:36 +0000 (UTC)
Message-ID: <22b393d1790bb268769d0bab7bacf0866dcb0c14.camel@perches.com>
Subject: [PATCH resend] sound: Convert strlcpy to strscpy when return value
 is unused
From: Joe Perches <joe@perches.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 04 Jan 2021 09:17:34 -0800
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Julia Lawall <Julia.Lawall@inria.fr>,
 alsa-devel <alsa-devel@alsa-project.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
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

strlcpy is deprecated.  see: Documentation/process/deprecated.rst

Change the calls that do not use the strlcpy return value to the
preferred strscpy.

Done with cocci script:

@@
expression e1, e2, e3;
@@

-	strlcpy(
+	strscpy(
	e1, e2, e3);

This cocci script leaves the instances where the return value is
used unchanged.

After this patch, sound/ has 3 uses of strlcpy() that need to be
manually inspected for conversion and changed one day.

$ git grep -w strlcpy sound/
sound/usb/card.c:               len = strlcpy(card->longname, s, sizeof(card->longname));
sound/usb/mixer.c:      return strlcpy(buf, p->name, buflen);
sound/usb/mixer.c:                      return strlcpy(buf, p->names[index], buflen);

Miscellenea:

o Remove trailing whitespace in conversion of sound/core/hwdep.c

Link: https://lore.kernel.org/lkml/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/

Signed-off-by: Joe Perches <joe@perches.com>
---

Resend adding alsa-devel as requested by Takashi Iwai <tiwai@suse.de>

 sound/aoa/codecs/onyx.c                    |  2 +-
 sound/aoa/codecs/tas.c                     |  2 +-
 sound/aoa/codecs/toonie.c                  |  2 +-
 sound/aoa/core/alsa.c                      |  8 ++++----
 sound/aoa/fabrics/layout.c                 |  6 +++---
 sound/aoa/soundbus/sysfs.c                 |  2 +-
 sound/arm/aaci.c                           |  6 +++---
 sound/arm/pxa2xx-ac97.c                    |  2 +-
 sound/core/compress_offload.c              |  2 +-
 sound/core/control.c                       | 16 ++++++++--------
 sound/core/ctljack.c                       |  2 +-
 sound/core/hwdep.c                         |  6 +++---
 sound/core/init.c                          |  4 ++--
 sound/core/oss/mixer_oss.c                 | 12 ++++++------
 sound/core/pcm.c                           |  2 +-
 sound/core/pcm_native.c                    |  6 +++---
 sound/core/rawmidi.c                       |  2 +-
 sound/core/seq/oss/seq_oss_midi.c          |  4 ++--
 sound/core/seq/oss/seq_oss_synth.c         |  6 +++---
 sound/core/seq/seq_clientmgr.c             |  2 +-
 sound/core/seq/seq_ports.c                 |  6 +++---
 sound/core/timer.c                         | 10 +++++-----
 sound/core/timer_compat.c                  |  4 ++--
 sound/drivers/opl3/opl3_oss.c              |  2 +-
 sound/drivers/opl3/opl3_synth.c            |  2 +-
 sound/firewire/bebob/bebob_hwdep.c         |  2 +-
 sound/firewire/dice/dice-hwdep.c           |  2 +-
 sound/firewire/digi00x/digi00x-hwdep.c     |  2 +-
 sound/firewire/fireface/ff-hwdep.c         |  2 +-
 sound/firewire/fireworks/fireworks_hwdep.c |  2 +-
 sound/firewire/motu/motu-hwdep.c           |  2 +-
 sound/firewire/oxfw/oxfw-hwdep.c           |  2 +-
 sound/firewire/tascam/tascam-hwdep.c       |  2 +-
 sound/i2c/i2c.c                            |  4 ++--
 sound/isa/ad1848/ad1848.c                  |  4 ++--
 sound/isa/cs423x/cs4231.c                  |  4 ++--
 sound/isa/cs423x/cs4236.c                  |  4 ++--
 sound/isa/es1688/es1688.c                  |  4 ++--
 sound/isa/sb/sb16_csp.c                    |  2 +-
 sound/isa/sb/sb_mixer.c                    |  2 +-
 sound/oss/dmasound/dmasound_core.c         |  4 ++--
 sound/pci/cs5535audio/cs5535audio_olpc.c   |  4 ++--
 sound/pci/ctxfi/ctpcm.c                    |  2 +-
 sound/pci/emu10k1/emu10k1.c                |  4 ++--
 sound/pci/emu10k1/emu10k1_main.c           |  2 +-
 sound/pci/emu10k1/emufx.c                  |  6 +++---
 sound/pci/es1968.c                         |  2 +-
 sound/pci/fm801.c                          |  2 +-
 sound/pci/hda/hda_auto_parser.c            |  2 +-
 sound/pci/hda/hda_codec.c                  |  2 +-
 sound/pci/hda/hda_controller.c             |  2 +-
 sound/pci/hda/hda_eld.c                    |  2 +-
 sound/pci/hda/hda_generic.c                |  2 +-
 sound/pci/hda/hda_intel.c                  |  2 +-
 sound/pci/hda/hda_jack.c                   |  2 +-
 sound/pci/ice1712/juli.c                   |  2 +-
 sound/pci/ice1712/psc724.c                 |  4 ++--
 sound/pci/ice1712/quartet.c                |  2 +-
 sound/pci/ice1712/wm8776.c                 |  2 +-
 sound/pci/lola/lola.c                      |  2 +-
 sound/pci/lola/lola_pcm.c                  |  2 +-
 sound/pci/rme9652/hdspm.c                  |  2 +-
 sound/ppc/keywest.c                        |  2 +-
 sound/soc/qcom/qdsp6/q6afe.c               |  2 +-
 sound/soc/sh/rcar/core.c                   |  2 +-
 sound/usb/bcd2000/bcd2000.c                |  2 +-
 sound/usb/caiaq/audio.c                    |  2 +-
 sound/usb/caiaq/device.c                   |  6 +++---
 sound/usb/caiaq/midi.c                     |  2 +-
 sound/usb/card.c                           |  4 ++--
 sound/usb/hiface/chip.c                    |  6 +++---
 sound/usb/hiface/pcm.c                     |  2 +-
 sound/usb/mixer.c                          | 12 ++++++------
 sound/usb/mixer_quirks.c                   |  2 +-
 sound/usb/mixer_scarlett.c                 |  2 +-
 sound/usb/mixer_scarlett_gen2.c            |  2 +-
 sound/usb/mixer_us16x08.c                  |  2 +-
 sound/x86/intel_hdmi_audio.c               |  2 +-
 sound/xen/xen_snd_front_cfg.c              |  2 +-
 79 files changed, 134 insertions(+), 134 deletions(-)

diff --git a/sound/aoa/codecs/onyx.c b/sound/aoa/codecs/onyx.c
index 12028b3e2eee..1abee841cc45 100644
--- a/sound/aoa/codecs/onyx.c
+++ b/sound/aoa/codecs/onyx.c
@@ -1013,7 +1013,7 @@ static int onyx_i2c_probe(struct i2c_client *client,
 		goto fail;
 	}
 
-	strlcpy(onyx->codec.name, "onyx", MAX_CODEC_NAME_LEN);
+	strscpy(onyx->codec.name, "onyx", MAX_CODEC_NAME_LEN);
 	onyx->codec.owner = THIS_MODULE;
 	onyx->codec.init = onyx_init_codec;
 	onyx->codec.exit = onyx_exit_codec;
diff --git a/sound/aoa/codecs/tas.c b/sound/aoa/codecs/tas.c
index d3e37577b529..ac246dd3ab49 100644
--- a/sound/aoa/codecs/tas.c
+++ b/sound/aoa/codecs/tas.c
@@ -894,7 +894,7 @@ static int tas_i2c_probe(struct i2c_client *client,
 	/* seems that half is a saner default */
 	tas->drc_range = TAS3004_DRC_MAX / 2;
 
-	strlcpy(tas->codec.name, "tas", MAX_CODEC_NAME_LEN);
+	strscpy(tas->codec.name, "tas", MAX_CODEC_NAME_LEN);
 	tas->codec.owner = THIS_MODULE;
 	tas->codec.init = tas_init_codec;
 	tas->codec.exit = tas_exit_codec;
diff --git a/sound/aoa/codecs/toonie.c b/sound/aoa/codecs/toonie.c
index c2d014486c33..0da5af129492 100644
--- a/sound/aoa/codecs/toonie.c
+++ b/sound/aoa/codecs/toonie.c
@@ -126,7 +126,7 @@ static int __init toonie_init(void)
 	if (!toonie)
 		return -ENOMEM;
 
-	strlcpy(toonie->codec.name, "toonie", sizeof(toonie->codec.name));
+	strscpy(toonie->codec.name, "toonie", sizeof(toonie->codec.name));
 	toonie->codec.owner = THIS_MODULE;
 	toonie->codec.init = toonie_init_codec;
 	toonie->codec.exit = toonie_exit_codec;
diff --git a/sound/aoa/core/alsa.c b/sound/aoa/core/alsa.c
index b61081342266..7fce8581ddbd 100644
--- a/sound/aoa/core/alsa.c
+++ b/sound/aoa/core/alsa.c
@@ -28,10 +28,10 @@ int aoa_alsa_init(char *name, struct module *mod, struct device *dev)
 		return err;
 	aoa_card = alsa_card->private_data;
 	aoa_card->alsa_card = alsa_card;
-	strlcpy(alsa_card->driver, "AppleOnbdAudio", sizeof(alsa_card->driver));
-	strlcpy(alsa_card->shortname, name, sizeof(alsa_card->shortname));
-	strlcpy(alsa_card->longname, name, sizeof(alsa_card->longname));
-	strlcpy(alsa_card->mixername, name, sizeof(alsa_card->mixername));
+	strscpy(alsa_card->driver, "AppleOnbdAudio", sizeof(alsa_card->driver));
+	strscpy(alsa_card->shortname, name, sizeof(alsa_card->shortname));
+	strscpy(alsa_card->longname, name, sizeof(alsa_card->longname));
+	strscpy(alsa_card->mixername, name, sizeof(alsa_card->mixername));
 	err = snd_card_register(aoa_card->alsa_card);
 	if (err < 0) {
 		printk(KERN_ERR "snd-aoa: couldn't register alsa card\n");
diff --git a/sound/aoa/fabrics/layout.c b/sound/aoa/fabrics/layout.c
index d2e85b83f7ed..ec4ef18555bc 100644
--- a/sound/aoa/fabrics/layout.c
+++ b/sound/aoa/fabrics/layout.c
@@ -948,7 +948,7 @@ static void layout_attached_codec(struct aoa_codec *codec)
 				ldev->gpio.methods->set_lineout(codec->gpio, 1);
 			ctl = snd_ctl_new1(&lineout_ctl, codec->gpio);
 			if (cc->connected & CC_LINEOUT_LABELLED_HEADPHONE)
-				strlcpy(ctl->id.name,
+				strscpy(ctl->id.name,
 					"Headphone Switch", sizeof(ctl->id.name));
 			ldev->lineout_ctrl = ctl;
 			aoa_snd_ctl_add(ctl);
@@ -962,14 +962,14 @@ static void layout_attached_codec(struct aoa_codec *codec)
 				ctl = snd_ctl_new1(&lineout_detect_choice,
 						   ldev);
 				if (cc->connected & CC_LINEOUT_LABELLED_HEADPHONE)
-					strlcpy(ctl->id.name,
+					strscpy(ctl->id.name,
 						"Headphone Detect Autoswitch",
 						sizeof(ctl->id.name));
 				aoa_snd_ctl_add(ctl);
 				ctl = snd_ctl_new1(&lineout_detected,
 						   ldev);
 				if (cc->connected & CC_LINEOUT_LABELLED_HEADPHONE)
-					strlcpy(ctl->id.name,
+					strscpy(ctl->id.name,
 						"Headphone Detected",
 						sizeof(ctl->id.name));
 				ldev->lineout_detected_ctrl = ctl;
diff --git a/sound/aoa/soundbus/sysfs.c b/sound/aoa/soundbus/sysfs.c
index a2d55e15afbb..dead3105689b 100644
--- a/sound/aoa/soundbus/sysfs.c
+++ b/sound/aoa/soundbus/sysfs.c
@@ -13,7 +13,7 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
 	int length;
 
 	if (*sdev->modalias) {
-		strlcpy(buf, sdev->modalias, sizeof(sdev->modalias) + 1);
+		strscpy(buf, sdev->modalias, sizeof(sdev->modalias) + 1);
 		strcat(buf, "\n");
 		length = strlen(buf);
 	} else {
diff --git a/sound/arm/aaci.c b/sound/arm/aaci.c
index a0996c47e58f..f02a91bdaa97 100644
--- a/sound/arm/aaci.c
+++ b/sound/arm/aaci.c
@@ -890,8 +890,8 @@ static struct aaci *aaci_init_card(struct amba_device *dev)
 
 	card->private_free = aaci_free_card;
 
-	strlcpy(card->driver, DRIVER_NAME, sizeof(card->driver));
-	strlcpy(card->shortname, "ARM AC'97 Interface", sizeof(card->shortname));
+	strscpy(card->driver, DRIVER_NAME, sizeof(card->driver));
+	strscpy(card->shortname, "ARM AC'97 Interface", sizeof(card->shortname));
 	snprintf(card->longname, sizeof(card->longname),
 		 "%s PL%03x rev%u at 0x%08llx, irq %d",
 		 card->shortname, amba_part(dev), amba_rev(dev),
@@ -921,7 +921,7 @@ static int aaci_init_pcm(struct aaci *aaci)
 		pcm->private_data = aaci;
 		pcm->info_flags = 0;
 
-		strlcpy(pcm->name, DRIVER_NAME, sizeof(pcm->name));
+		strscpy(pcm->name, DRIVER_NAME, sizeof(pcm->name));
 
 		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &aaci_playback_ops);
 		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &aaci_capture_ops);
diff --git a/sound/arm/pxa2xx-ac97.c b/sound/arm/pxa2xx-ac97.c
index ea8e233150c8..6322e6392594 100644
--- a/sound/arm/pxa2xx-ac97.c
+++ b/sound/arm/pxa2xx-ac97.c
@@ -235,7 +235,7 @@ static int pxa2xx_ac97_probe(struct platform_device *dev)
 	if (ret < 0)
 		goto err;
 
-	strlcpy(card->driver, dev->dev.driver->name, sizeof(card->driver));
+	strscpy(card->driver, dev->dev.driver->name, sizeof(card->driver));
 
 	ret = pxa2xx_ac97_pcm_new(card);
 	if (ret)
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index debc30fcf5b3..21ce4c056a92 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -1132,7 +1132,7 @@ static void snd_compress_proc_done(struct snd_compr *compr)
 
 static inline void snd_compress_set_id(struct snd_compr *compr, const char *id)
 {
-	strlcpy(compr->id, id, sizeof(compr->id));
+	strscpy(compr->id, id, sizeof(compr->id));
 }
 #else
 static inline int snd_compress_proc_init(struct snd_compr *compr)
diff --git a/sound/core/control.c b/sound/core/control.c
index 3b44378b9dec..8f41aba6acac 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -261,7 +261,7 @@ struct snd_kcontrol *snd_ctl_new1(const struct snd_kcontrol_new *ncontrol,
 	kctl->id.device = ncontrol->device;
 	kctl->id.subdevice = ncontrol->subdevice;
 	if (ncontrol->name) {
-		strlcpy(kctl->id.name, ncontrol->name, sizeof(kctl->id.name));
+		strscpy(kctl->id.name, ncontrol->name, sizeof(kctl->id.name));
 		if (strcmp(ncontrol->name, kctl->id.name) != 0)
 			pr_warn("ALSA: Control name '%s' truncated to '%s'\n",
 				ncontrol->name, kctl->id.name);
@@ -701,12 +701,12 @@ static int snd_ctl_card_info(struct snd_card *card, struct snd_ctl_file * ctl,
 		return -ENOMEM;
 	down_read(&snd_ioctl_rwsem);
 	info->card = card->number;
-	strlcpy(info->id, card->id, sizeof(info->id));
-	strlcpy(info->driver, card->driver, sizeof(info->driver));
-	strlcpy(info->name, card->shortname, sizeof(info->name));
-	strlcpy(info->longname, card->longname, sizeof(info->longname));
-	strlcpy(info->mixername, card->mixername, sizeof(info->mixername));
-	strlcpy(info->components, card->components, sizeof(info->components));
+	strscpy(info->id, card->id, sizeof(info->id));
+	strscpy(info->driver, card->driver, sizeof(info->driver));
+	strscpy(info->name, card->shortname, sizeof(info->name));
+	strscpy(info->longname, card->longname, sizeof(info->longname));
+	strscpy(info->mixername, card->mixername, sizeof(info->mixername));
+	strscpy(info->components, card->components, sizeof(info->components));
 	up_read(&snd_ioctl_rwsem);
 	if (copy_to_user(arg, info, sizeof(struct snd_ctl_card_info))) {
 		kfree(info);
@@ -2137,7 +2137,7 @@ int snd_ctl_enum_info(struct snd_ctl_elem_info *info, unsigned int channels,
 	WARN(strlen(names[info->value.enumerated.item]) >= sizeof(info->value.enumerated.name),
 	     "ALSA: too long item name '%s'\n",
 	     names[info->value.enumerated.item]);
-	strlcpy(info->value.enumerated.name,
+	strscpy(info->value.enumerated.name,
 		names[info->value.enumerated.item],
 		sizeof(info->value.enumerated.name));
 	return 0;
diff --git a/sound/core/ctljack.c b/sound/core/ctljack.c
index 9be4e282f2e0..709b1a9c2caa 100644
--- a/sound/core/ctljack.c
+++ b/sound/core/ctljack.c
@@ -35,7 +35,7 @@ static int get_available_index(struct snd_card *card, const char *name)
 
 	sid.index = 0;
 	sid.iface = SNDRV_CTL_ELEM_IFACE_CARD;
-	strlcpy(sid.name, name, sizeof(sid.name));
+	strscpy(sid.name, name, sizeof(sid.name));
 
 	while (snd_ctl_find_id(card, &sid)) {
 		sid.index++;
diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
index 0c029892880a..e01602bcd674 100644
--- a/sound/core/hwdep.c
+++ b/sound/core/hwdep.c
@@ -177,8 +177,8 @@ static int snd_hwdep_info(struct snd_hwdep *hw,
 	
 	memset(&info, 0, sizeof(info));
 	info.card = hw->card->number;
-	strlcpy(info.id, hw->id, sizeof(info.id));	
-	strlcpy(info.name, hw->name, sizeof(info.name));
+	strscpy(info.id, hw->id, sizeof(info.id));
+	strscpy(info.name, hw->name, sizeof(info.name));
 	info.iface = hw->iface;
 	if (copy_to_user(_info, &info, sizeof(info)))
 		return -EFAULT;
@@ -379,7 +379,7 @@ int snd_hwdep_new(struct snd_card *card, char *id, int device,
 	hwdep->card = card;
 	hwdep->device = device;
 	if (id)
-		strlcpy(hwdep->id, id, sizeof(hwdep->id));
+		strscpy(hwdep->id, id, sizeof(hwdep->id));
 
 	snd_device_initialize(&hwdep->dev, card);
 	hwdep->dev.release = release_hwdep_device;
diff --git a/sound/core/init.c b/sound/core/init.c
index 75aec71c48a8..56834febc7a4 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -174,7 +174,7 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
 	if (extra_size > 0)
 		card->private_data = (char *)card + sizeof(struct snd_card);
 	if (xid)
-		strlcpy(card->id, xid, sizeof(card->id));
+		strscpy(card->id, xid, sizeof(card->id));
 	err = 0;
 	mutex_lock(&snd_card_mutex);
 	if (idx < 0) /* first check the matching module-name slot */
@@ -623,7 +623,7 @@ static void snd_card_set_id_no_lock(struct snd_card *card, const char *src,
 	/* last resort... */
 	dev_err(card->dev, "unable to set card id (%s)\n", id);
 	if (card->proc_root->name)
-		strlcpy(card->id, card->proc_root->name, sizeof(card->id));
+		strscpy(card->id, card->proc_root->name, sizeof(card->id));
 }
 
 /**
diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index f702c96a7478..2f53750a9875 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -87,8 +87,8 @@ static int snd_mixer_oss_info(struct snd_mixer_oss_file *fmixer,
 	struct mixer_info info;
 	
 	memset(&info, 0, sizeof(info));
-	strlcpy(info.id, mixer && mixer->id[0] ? mixer->id : card->driver, sizeof(info.id));
-	strlcpy(info.name, mixer && mixer->name[0] ? mixer->name : card->mixername, sizeof(info.name));
+	strscpy(info.id, mixer && mixer->id[0] ? mixer->id : card->driver, sizeof(info.id));
+	strscpy(info.name, mixer && mixer->name[0] ? mixer->name : card->mixername, sizeof(info.name));
 	info.modify_counter = card->mixer_oss_change_count;
 	if (copy_to_user(_info, &info, sizeof(info)))
 		return -EFAULT;
@@ -103,8 +103,8 @@ static int snd_mixer_oss_info_obsolete(struct snd_mixer_oss_file *fmixer,
 	_old_mixer_info info;
 	
 	memset(&info, 0, sizeof(info));
-	strlcpy(info.id, mixer && mixer->id[0] ? mixer->id : card->driver, sizeof(info.id));
-	strlcpy(info.name, mixer && mixer->name[0] ? mixer->name : card->mixername, sizeof(info.name));
+	strscpy(info.id, mixer && mixer->id[0] ? mixer->id : card->driver, sizeof(info.id));
+	strscpy(info.name, mixer && mixer->name[0] ? mixer->name : card->mixername, sizeof(info.name));
 	if (copy_to_user(_info, &info, sizeof(info)))
 		return -EFAULT;
 	return 0;
@@ -499,7 +499,7 @@ static struct snd_kcontrol *snd_mixer_oss_test_id(struct snd_mixer_oss *mixer, c
 	
 	memset(&id, 0, sizeof(id));
 	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	strlcpy(id.name, name, sizeof(id.name));
+	strscpy(id.name, name, sizeof(id.name));
 	id.index = index;
 	return snd_ctl_find_id(card, &id);
 }
@@ -1355,7 +1355,7 @@ static int snd_mixer_oss_notify_handler(struct snd_card *card, int cmd)
 		mixer->oss_dev_alloc = 1;
 		mixer->card = card;
 		if (*card->mixername)
-			strlcpy(mixer->name, card->mixername, sizeof(mixer->name));
+			strscpy(mixer->name, card->mixername, sizeof(mixer->name));
 		else
 			snprintf(mixer->name, sizeof(mixer->name),
 				 "mixer%i", card->number);
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index be5714f1bb58..e5947281e5fc 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -729,7 +729,7 @@ static int _snd_pcm_new(struct snd_card *card, const char *id, int device,
 	init_waitqueue_head(&pcm->open_wait);
 	INIT_LIST_HEAD(&pcm->list);
 	if (id)
-		strlcpy(pcm->id, id, sizeof(pcm->id));
+		strscpy(pcm->id, id, sizeof(pcm->id));
 
 	err = snd_pcm_new_stream(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 				 playback_count);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 9f3f8e953ff0..66ae1e248103 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -209,13 +209,13 @@ int snd_pcm_info(struct snd_pcm_substream *substream, struct snd_pcm_info *info)
 	info->device = pcm->device;
 	info->stream = substream->stream;
 	info->subdevice = substream->number;
-	strlcpy(info->id, pcm->id, sizeof(info->id));
-	strlcpy(info->name, pcm->name, sizeof(info->name));
+	strscpy(info->id, pcm->id, sizeof(info->id));
+	strscpy(info->name, pcm->name, sizeof(info->name));
 	info->dev_class = pcm->dev_class;
 	info->dev_subclass = pcm->dev_subclass;
 	info->subdevices_count = pstr->substream_count;
 	info->subdevices_avail = pstr->substream_count - pstr->substream_opened;
-	strlcpy(info->subname, substream->name, sizeof(info->subname));
+	strscpy(info->subname, substream->name, sizeof(info->subname));
 
 	return 0;
 }
diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
index 257ad5206240..aca00af93afe 100644
--- a/sound/core/rawmidi.c
+++ b/sound/core/rawmidi.c
@@ -1686,7 +1686,7 @@ int snd_rawmidi_new(struct snd_card *card, char *id, int device,
 	INIT_LIST_HEAD(&rmidi->streams[SNDRV_RAWMIDI_STREAM_OUTPUT].substreams);
 
 	if (id != NULL)
-		strlcpy(rmidi->id, id, sizeof(rmidi->id));
+		strscpy(rmidi->id, id, sizeof(rmidi->id));
 
 	snd_device_initialize(&rmidi->dev, card);
 	rmidi->dev.release = release_rawmidi_device;
diff --git a/sound/core/seq/oss/seq_oss_midi.c b/sound/core/seq/oss/seq_oss_midi.c
index 2ddfe2226651..3f82c196de46 100644
--- a/sound/core/seq/oss/seq_oss_midi.c
+++ b/sound/core/seq/oss/seq_oss_midi.c
@@ -173,7 +173,7 @@ snd_seq_oss_midi_check_new_port(struct snd_seq_port_info *pinfo)
 	snd_use_lock_init(&mdev->use_lock);
 
 	/* copy and truncate the name of synth device */
-	strlcpy(mdev->name, pinfo->name, sizeof(mdev->name));
+	strscpy(mdev->name, pinfo->name, sizeof(mdev->name));
 
 	/* create MIDI coder */
 	if (snd_midi_event_new(MAX_MIDI_EVENT_BUF, &mdev->coder) < 0) {
@@ -647,7 +647,7 @@ snd_seq_oss_midi_make_info(struct seq_oss_devinfo *dp, int dev, struct midi_info
 	inf->device = dev;
 	inf->dev_type = 0; /* FIXME: ?? */
 	inf->capabilities = 0; /* FIXME: ?? */
-	strlcpy(inf->name, mdev->name, sizeof(inf->name));
+	strscpy(inf->name, mdev->name, sizeof(inf->name));
 	snd_use_lock_free(&mdev->use_lock);
 	return 0;
 }
diff --git a/sound/core/seq/oss/seq_oss_synth.c b/sound/core/seq/oss/seq_oss_synth.c
index 11554d0412f0..136dc663887a 100644
--- a/sound/core/seq/oss/seq_oss_synth.c
+++ b/sound/core/seq/oss/seq_oss_synth.c
@@ -107,7 +107,7 @@ snd_seq_oss_synth_probe(struct device *_dev)
 	snd_use_lock_init(&rec->use_lock);
 
 	/* copy and truncate the name of synth device */
-	strlcpy(rec->name, dev->name, sizeof(rec->name));
+	strscpy(rec->name, dev->name, sizeof(rec->name));
 
 	/* registration */
 	spin_lock_irqsave(&register_lock, flags);
@@ -616,7 +616,7 @@ snd_seq_oss_synth_make_info(struct seq_oss_devinfo *dp, int dev, struct synth_in
 		inf->synth_subtype = 0;
 		inf->nr_voices = 16;
 		inf->device = dev;
-		strlcpy(inf->name, minf.name, sizeof(inf->name));
+		strscpy(inf->name, minf.name, sizeof(inf->name));
 	} else {
 		if ((rec = get_synthdev(dp, dev)) == NULL)
 			return -ENXIO;
@@ -624,7 +624,7 @@ snd_seq_oss_synth_make_info(struct seq_oss_devinfo *dp, int dev, struct synth_in
 		inf->synth_subtype = rec->synth_subtype;
 		inf->nr_voices = rec->nr_voices;
 		inf->device = dev;
-		strlcpy(inf->name, rec->name, sizeof(inf->name));
+		strscpy(inf->name, rec->name, sizeof(inf->name));
 		snd_use_lock_free(&rec->use_lock);
 	}
 	return 0;
diff --git a/sound/core/seq/seq_clientmgr.c b/sound/core/seq/seq_clientmgr.c
index f9f2fea58b32..b6a24fb5e76b 100644
--- a/sound/core/seq/seq_clientmgr.c
+++ b/sound/core/seq/seq_clientmgr.c
@@ -1584,7 +1584,7 @@ static int snd_seq_ioctl_get_queue_info(struct snd_seq_client *client,
 	info->queue = q->queue;
 	info->owner = q->owner;
 	info->locked = q->locked;
-	strlcpy(info->name, q->name, sizeof(info->name));
+	strscpy(info->name, q->name, sizeof(info->name));
 	queuefree(q);
 
 	return 0;
diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index 83be6b982a87..b9c2ce2b8d5a 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -327,7 +327,7 @@ int snd_seq_set_port_info(struct snd_seq_client_port * port,
 
 	/* set port name */
 	if (info->name[0])
-		strlcpy(port->name, info->name, sizeof(port->name));
+		strscpy(port->name, info->name, sizeof(port->name));
 	
 	/* set capabilities */
 	port->capability = info->capability;
@@ -356,7 +356,7 @@ int snd_seq_get_port_info(struct snd_seq_client_port * port,
 		return -EINVAL;
 
 	/* get port name */
-	strlcpy(info->name, port->name, sizeof(info->name));
+	strscpy(info->name, port->name, sizeof(info->name));
 	
 	/* get capabilities */
 	info->capability = port->capability;
@@ -654,7 +654,7 @@ int snd_seq_event_port_attach(int client,
 	/* Set up the port */
 	memset(&portinfo, 0, sizeof(portinfo));
 	portinfo.addr.client = client;
-	strlcpy(portinfo.name, portname ? portname : "Unnamed port",
+	strscpy(portinfo.name, portname ? portname : "Unnamed port",
 		sizeof(portinfo.name));
 
 	portinfo.capability = cap;
diff --git a/sound/core/timer.c b/sound/core/timer.c
index 765ea66665a8..6898b1ac0d7f 100644
--- a/sound/core/timer.c
+++ b/sound/core/timer.c
@@ -959,7 +959,7 @@ int snd_timer_new(struct snd_card *card, char *id, struct snd_timer_id *tid,
 	timer->tmr_device = tid->device;
 	timer->tmr_subdevice = tid->subdevice;
 	if (id)
-		strlcpy(timer->id, id, sizeof(timer->id));
+		strscpy(timer->id, id, sizeof(timer->id));
 	timer->sticks = 1;
 	INIT_LIST_HEAD(&timer->device_list);
 	INIT_LIST_HEAD(&timer->open_list_head);
@@ -1659,8 +1659,8 @@ static int snd_timer_user_ginfo(struct file *file,
 		ginfo->card = t->card ? t->card->number : -1;
 		if (t->hw.flags & SNDRV_TIMER_HW_SLAVE)
 			ginfo->flags |= SNDRV_TIMER_FLG_SLAVE;
-		strlcpy(ginfo->id, t->id, sizeof(ginfo->id));
-		strlcpy(ginfo->name, t->name, sizeof(ginfo->name));
+		strscpy(ginfo->id, t->id, sizeof(ginfo->id));
+		strscpy(ginfo->name, t->name, sizeof(ginfo->name));
 		ginfo->resolution = t->hw.resolution;
 		if (t->hw.resolution_min > 0) {
 			ginfo->resolution_min = t->hw.resolution_min;
@@ -1814,8 +1814,8 @@ static int snd_timer_user_info(struct file *file,
 	info->card = t->card ? t->card->number : -1;
 	if (t->hw.flags & SNDRV_TIMER_HW_SLAVE)
 		info->flags |= SNDRV_TIMER_FLG_SLAVE;
-	strlcpy(info->id, t->id, sizeof(info->id));
-	strlcpy(info->name, t->name, sizeof(info->name));
+	strscpy(info->id, t->id, sizeof(info->id));
+	strscpy(info->name, t->name, sizeof(info->name));
 	info->resolution = t->hw.resolution;
 	if (copy_to_user(_info, info, sizeof(*_info)))
 		err = -EFAULT;
diff --git a/sound/core/timer_compat.c b/sound/core/timer_compat.c
index 0103d16f6f9f..ee973b7b8044 100644
--- a/sound/core/timer_compat.c
+++ b/sound/core/timer_compat.c
@@ -61,8 +61,8 @@ static int snd_timer_user_info_compat(struct file *file,
 	info.card = t->card ? t->card->number : -1;
 	if (t->hw.flags & SNDRV_TIMER_HW_SLAVE)
 		info.flags |= SNDRV_TIMER_FLG_SLAVE;
-	strlcpy(info.id, t->id, sizeof(info.id));
-	strlcpy(info.name, t->name, sizeof(info.name));
+	strscpy(info.id, t->id, sizeof(info.id));
+	strscpy(info.name, t->name, sizeof(info.name));
 	info.resolution = t->hw.resolution;
 	if (copy_to_user(_info, &info, sizeof(*_info)))
 		return -EFAULT;
diff --git a/sound/drivers/opl3/opl3_oss.c b/sound/drivers/opl3/opl3_oss.c
index 7bf0d5f3fedd..c82c7c1c0714 100644
--- a/sound/drivers/opl3/opl3_oss.c
+++ b/sound/drivers/opl3/opl3_oss.c
@@ -97,7 +97,7 @@ void snd_opl3_init_seq_oss(struct snd_opl3 *opl3, char *name)
 		return;
 
 	opl3->oss_seq_dev = dev;
-	strlcpy(dev->name, name, sizeof(dev->name));
+	strscpy(dev->name, name, sizeof(dev->name));
 	arg = SNDRV_SEQ_DEVICE_ARGPTR(dev);
 	arg->type = SYNTH_TYPE_FM;
 	if (opl3->hardware < OPL3_HW_OPL3) {
diff --git a/sound/drivers/opl3/opl3_synth.c b/sound/drivers/opl3/opl3_synth.c
index 08c10ac9d6c8..97d30a833ac8 100644
--- a/sound/drivers/opl3/opl3_synth.c
+++ b/sound/drivers/opl3/opl3_synth.c
@@ -290,7 +290,7 @@ int snd_opl3_load_patch(struct snd_opl3 *opl3,
 	}
 
 	if (name)
-		strlcpy(patch->name, name, sizeof(patch->name));
+		strscpy(patch->name, name, sizeof(patch->name));
 
 	return 0;
 }
diff --git a/sound/firewire/bebob/bebob_hwdep.c b/sound/firewire/bebob/bebob_hwdep.c
index c362eb38ab90..8677e3ec8d14 100644
--- a/sound/firewire/bebob/bebob_hwdep.c
+++ b/sound/firewire/bebob/bebob_hwdep.c
@@ -80,7 +80,7 @@ hwdep_get_info(struct snd_bebob *bebob, void __user *arg)
 	info.card = dev->card->index;
 	*(__be32 *)&info.guid[0] = cpu_to_be32(dev->config_rom[3]);
 	*(__be32 *)&info.guid[4] = cpu_to_be32(dev->config_rom[4]);
-	strlcpy(info.device_name, dev_name(&dev->device),
+	strscpy(info.device_name, dev_name(&dev->device),
 		sizeof(info.device_name));
 
 	if (copy_to_user(arg, &info, sizeof(info)))
diff --git a/sound/firewire/dice/dice-hwdep.c b/sound/firewire/dice/dice-hwdep.c
index f69f7996762f..ffc0b97782d6 100644
--- a/sound/firewire/dice/dice-hwdep.c
+++ b/sound/firewire/dice/dice-hwdep.c
@@ -79,7 +79,7 @@ static int hwdep_get_info(struct snd_dice *dice, void __user *arg)
 	info.card = dev->card->index;
 	*(__be32 *)&info.guid[0] = cpu_to_be32(dev->config_rom[3]);
 	*(__be32 *)&info.guid[4] = cpu_to_be32(dev->config_rom[4]);
-	strlcpy(info.device_name, dev_name(&dev->device),
+	strscpy(info.device_name, dev_name(&dev->device),
 		sizeof(info.device_name));
 
 	if (copy_to_user(arg, &info, sizeof(info)))
diff --git a/sound/firewire/digi00x/digi00x-hwdep.c b/sound/firewire/digi00x/digi00x-hwdep.c
index 41c5857c612e..aadf7d724856 100644
--- a/sound/firewire/digi00x/digi00x-hwdep.c
+++ b/sound/firewire/digi00x/digi00x-hwdep.c
@@ -87,7 +87,7 @@ static int hwdep_get_info(struct snd_dg00x *dg00x, void __user *arg)
 	info.card = dev->card->index;
 	*(__be32 *)&info.guid[0] = cpu_to_be32(dev->config_rom[3]);
 	*(__be32 *)&info.guid[4] = cpu_to_be32(dev->config_rom[4]);
-	strlcpy(info.device_name, dev_name(&dev->device),
+	strscpy(info.device_name, dev_name(&dev->device),
 		sizeof(info.device_name));
 
 	if (copy_to_user(arg, &info, sizeof(info)))
diff --git a/sound/firewire/fireface/ff-hwdep.c b/sound/firewire/fireface/ff-hwdep.c
index e73e8d2865a5..4b2e0dff5ddb 100644
--- a/sound/firewire/fireface/ff-hwdep.c
+++ b/sound/firewire/fireface/ff-hwdep.c
@@ -79,7 +79,7 @@ static int hwdep_get_info(struct snd_ff *ff, void __user *arg)
 	info.card = dev->card->index;
 	*(__be32 *)&info.guid[0] = cpu_to_be32(dev->config_rom[3]);
 	*(__be32 *)&info.guid[4] = cpu_to_be32(dev->config_rom[4]);
-	strlcpy(info.device_name, dev_name(&dev->device),
+	strscpy(info.device_name, dev_name(&dev->device),
 		sizeof(info.device_name));
 
 	if (copy_to_user(arg, &info, sizeof(info)))
diff --git a/sound/firewire/fireworks/fireworks_hwdep.c b/sound/firewire/fireworks/fireworks_hwdep.c
index e93eb4616c5f..626c0c34b0b6 100644
--- a/sound/firewire/fireworks/fireworks_hwdep.c
+++ b/sound/firewire/fireworks/fireworks_hwdep.c
@@ -212,7 +212,7 @@ hwdep_get_info(struct snd_efw *efw, void __user *arg)
 	info.card = dev->card->index;
 	*(__be32 *)&info.guid[0] = cpu_to_be32(dev->config_rom[3]);
 	*(__be32 *)&info.guid[4] = cpu_to_be32(dev->config_rom[4]);
-	strlcpy(info.device_name, dev_name(&dev->device),
+	strscpy(info.device_name, dev_name(&dev->device),
 		sizeof(info.device_name));
 
 	if (copy_to_user(arg, &info, sizeof(info)))
diff --git a/sound/firewire/motu/motu-hwdep.c b/sound/firewire/motu/motu-hwdep.c
index 0764a477052a..b5ced5d27758 100644
--- a/sound/firewire/motu/motu-hwdep.c
+++ b/sound/firewire/motu/motu-hwdep.c
@@ -86,7 +86,7 @@ static int hwdep_get_info(struct snd_motu *motu, void __user *arg)
 	info.card = dev->card->index;
 	*(__be32 *)&info.guid[0] = cpu_to_be32(dev->config_rom[3]);
 	*(__be32 *)&info.guid[4] = cpu_to_be32(dev->config_rom[4]);
-	strlcpy(info.device_name, dev_name(&dev->device),
+	strscpy(info.device_name, dev_name(&dev->device),
 		sizeof(info.device_name));
 
 	if (copy_to_user(arg, &info, sizeof(info)))
diff --git a/sound/firewire/oxfw/oxfw-hwdep.c b/sound/firewire/oxfw/oxfw-hwdep.c
index eba33d050060..9e1b3e151bad 100644
--- a/sound/firewire/oxfw/oxfw-hwdep.c
+++ b/sound/firewire/oxfw/oxfw-hwdep.c
@@ -79,7 +79,7 @@ static int hwdep_get_info(struct snd_oxfw *oxfw, void __user *arg)
 	info.card = dev->card->index;
 	*(__be32 *)&info.guid[0] = cpu_to_be32(dev->config_rom[3]);
 	*(__be32 *)&info.guid[4] = cpu_to_be32(dev->config_rom[4]);
-	strlcpy(info.device_name, dev_name(&dev->device),
+	strscpy(info.device_name, dev_name(&dev->device),
 		sizeof(info.device_name));
 
 	if (copy_to_user(arg, &info, sizeof(info)))
diff --git a/sound/firewire/tascam/tascam-hwdep.c b/sound/firewire/tascam/tascam-hwdep.c
index 6f38335fe10b..74eed9505665 100644
--- a/sound/firewire/tascam/tascam-hwdep.c
+++ b/sound/firewire/tascam/tascam-hwdep.c
@@ -154,7 +154,7 @@ static int hwdep_get_info(struct snd_tscm *tscm, void __user *arg)
 	info.card = dev->card->index;
 	*(__be32 *)&info.guid[0] = cpu_to_be32(dev->config_rom[3]);
 	*(__be32 *)&info.guid[4] = cpu_to_be32(dev->config_rom[4]);
-	strlcpy(info.device_name, dev_name(&dev->device),
+	strscpy(info.device_name, dev_name(&dev->device),
 		sizeof(info.device_name));
 
 	if (copy_to_user(arg, &info, sizeof(info)))
diff --git a/sound/i2c/i2c.c b/sound/i2c/i2c.c
index a684faa771ef..847e3b6ca601 100644
--- a/sound/i2c/i2c.c
+++ b/sound/i2c/i2c.c
@@ -84,7 +84,7 @@ int snd_i2c_bus_create(struct snd_card *card, const char *name,
 		list_add_tail(&bus->buses, &master->buses);
 		bus->master = master;
 	}
-	strlcpy(bus->name, name, sizeof(bus->name));
+	strscpy(bus->name, name, sizeof(bus->name));
 	err = snd_device_new(card, SNDRV_DEV_BUS, bus, &ops);
 	if (err < 0) {
 		snd_i2c_bus_free(bus);
@@ -108,7 +108,7 @@ int snd_i2c_device_create(struct snd_i2c_bus *bus, const char *name,
 	if (device == NULL)
 		return -ENOMEM;
 	device->addr = addr;
-	strlcpy(device->name, name, sizeof(device->name));
+	strscpy(device->name, name, sizeof(device->name));
 	list_add_tail(&device->list, &bus->devices);
 	device->bus = bus;
 	*rdevice = device;
diff --git a/sound/isa/ad1848/ad1848.c b/sound/isa/ad1848/ad1848.c
index 593c6e959afe..47bffe623105 100644
--- a/sound/isa/ad1848/ad1848.c
+++ b/sound/isa/ad1848/ad1848.c
@@ -95,8 +95,8 @@ static int snd_ad1848_probe(struct device *dev, unsigned int n)
 	if (error < 0)
 		goto out;
 
-	strlcpy(card->driver, "AD1848", sizeof(card->driver));
-	strlcpy(card->shortname, chip->pcm->name, sizeof(card->shortname));
+	strscpy(card->driver, "AD1848", sizeof(card->driver));
+	strscpy(card->shortname, chip->pcm->name, sizeof(card->shortname));
 
 	if (!thinkpad[n])
 		snprintf(card->longname, sizeof(card->longname),
diff --git a/sound/isa/cs423x/cs4231.c b/sound/isa/cs423x/cs4231.c
index 2135963eba78..bcbea6962d7e 100644
--- a/sound/isa/cs423x/cs4231.c
+++ b/sound/isa/cs423x/cs4231.c
@@ -95,8 +95,8 @@ static int snd_cs4231_probe(struct device *dev, unsigned int n)
 	if (error < 0)
 		goto out;
 
-	strlcpy(card->driver, "CS4231", sizeof(card->driver));
-	strlcpy(card->shortname, chip->pcm->name, sizeof(card->shortname));
+	strscpy(card->driver, "CS4231", sizeof(card->driver));
+	strscpy(card->shortname, chip->pcm->name, sizeof(card->shortname));
 
 	if (dma2[n] < 0)
 		snprintf(card->longname, sizeof(card->longname),
diff --git a/sound/isa/cs423x/cs4236.c b/sound/isa/cs423x/cs4236.c
index fa3c39cff5f8..fb9d8a4b7084 100644
--- a/sound/isa/cs423x/cs4236.c
+++ b/sound/isa/cs423x/cs4236.c
@@ -405,8 +405,8 @@ static int snd_cs423x_probe(struct snd_card *card, int dev)
 		if (err < 0)
 			return err;
 	}
-	strlcpy(card->driver, chip->pcm->name, sizeof(card->driver));
-	strlcpy(card->shortname, chip->pcm->name, sizeof(card->shortname));
+	strscpy(card->driver, chip->pcm->name, sizeof(card->driver));
+	strscpy(card->shortname, chip->pcm->name, sizeof(card->shortname));
 	if (dma2[dev] < 0)
 		snprintf(card->longname, sizeof(card->longname),
 			 "%s at 0x%lx, irq %i, dma %i",
diff --git a/sound/isa/es1688/es1688.c b/sound/isa/es1688/es1688.c
index 64610571a5e1..766ab43aaf77 100644
--- a/sound/isa/es1688/es1688.c
+++ b/sound/isa/es1688/es1688.c
@@ -133,8 +133,8 @@ static int snd_es1688_probe(struct snd_card *card, unsigned int n)
 	if (error < 0)
 		return error;
 
-	strlcpy(card->driver, "ES1688", sizeof(card->driver));
-	strlcpy(card->shortname, chip->pcm->name, sizeof(card->shortname));
+	strscpy(card->driver, "ES1688", sizeof(card->driver));
+	strscpy(card->shortname, chip->pcm->name, sizeof(card->shortname));
 	snprintf(card->longname, sizeof(card->longname),
 		"%s at 0x%lx, irq %i, dma %i", chip->pcm->name, chip->port,
 		 chip->irq, chip->dma8);
diff --git a/sound/isa/sb/sb16_csp.c b/sound/isa/sb/sb16_csp.c
index 270af863e198..8635a2b6b36b 100644
--- a/sound/isa/sb/sb16_csp.c
+++ b/sound/isa/sb/sb16_csp.c
@@ -388,7 +388,7 @@ static int snd_sb_csp_riff_load(struct snd_sb_csp * p,
 				return err;
 
 			/* fill in codec header */
-			strlcpy(p->codec_name, info.codec_name, sizeof(p->codec_name));
+			strscpy(p->codec_name, info.codec_name, sizeof(p->codec_name));
 			p->func_nr = func_nr;
 			p->mode = le16_to_cpu(funcdesc_h.flags_play_rec);
 			switch (le16_to_cpu(funcdesc_h.VOC_type)) {
diff --git a/sound/isa/sb/sb_mixer.c b/sound/isa/sb/sb_mixer.c
index 3f703b4a304d..5de5506e7e60 100644
--- a/sound/isa/sb/sb_mixer.c
+++ b/sound/isa/sb/sb_mixer.c
@@ -482,7 +482,7 @@ int snd_sbmixer_add_ctl(struct snd_sb *chip, const char *name, int index, int ty
 	ctl = snd_ctl_new1(&newctls[type], chip);
 	if (! ctl)
 		return -ENOMEM;
-	strlcpy(ctl->id.name, name, sizeof(ctl->id.name));
+	strscpy(ctl->id.name, name, sizeof(ctl->id.name));
 	ctl->id.index = index;
 	ctl->private_value = value;
 	if ((err = snd_ctl_add(chip->card, ctl)) < 0)
diff --git a/sound/oss/dmasound/dmasound_core.c b/sound/oss/dmasound/dmasound_core.c
index 38f25e97538f..49679aa8631d 100644
--- a/sound/oss/dmasound/dmasound_core.c
+++ b/sound/oss/dmasound/dmasound_core.c
@@ -355,8 +355,8 @@ static int mixer_ioctl(struct file *file, u_int cmd, u_long arg)
 		{
 		    mixer_info info;
 		    memset(&info, 0, sizeof(info));
-		    strlcpy(info.id, dmasound.mach.name2, sizeof(info.id));
-		    strlcpy(info.name, dmasound.mach.name2, sizeof(info.name));
+		    strscpy(info.id, dmasound.mach.name2, sizeof(info.id));
+		    strscpy(info.name, dmasound.mach.name2, sizeof(info.name));
 		    info.modify_counter = mixer.modify_counter;
 		    if (copy_to_user((void __user *)arg, &info, sizeof(info)))
 			    return -EFAULT;
diff --git a/sound/pci/cs5535audio/cs5535audio_olpc.c b/sound/pci/cs5535audio/cs5535audio_olpc.c
index 4e295303b041..110d3209441b 100644
--- a/sound/pci/cs5535audio/cs5535audio_olpc.c
+++ b/sound/pci/cs5535audio/cs5535audio_olpc.c
@@ -158,13 +158,13 @@ int olpc_quirks(struct snd_card *card, struct snd_ac97 *ac97)
 	/* drop the original AD1888 HPF control */
 	memset(&elem, 0, sizeof(elem));
 	elem.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	strlcpy(elem.name, "High Pass Filter Enable", sizeof(elem.name));
+	strscpy(elem.name, "High Pass Filter Enable", sizeof(elem.name));
 	snd_ctl_remove_id(card, &elem);
 
 	/* drop the original V_REFOUT control */
 	memset(&elem, 0, sizeof(elem));
 	elem.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	strlcpy(elem.name, "V_REFOUT Enable", sizeof(elem.name));
+	strscpy(elem.name, "V_REFOUT Enable", sizeof(elem.name));
 	snd_ctl_remove_id(card, &elem);
 
 	/* add the OLPC-specific controls */
diff --git a/sound/pci/ctxfi/ctpcm.c b/sound/pci/ctxfi/ctpcm.c
index 3f48ad0e27e7..81dfc6a76b18 100644
--- a/sound/pci/ctxfi/ctpcm.c
+++ b/sound/pci/ctxfi/ctpcm.c
@@ -433,7 +433,7 @@ int ct_alsa_pcm_create(struct ct_atc *atc,
 	pcm->private_data = atc;
 	pcm->info_flags = 0;
 	pcm->dev_subclass = SNDRV_PCM_SUBCLASS_GENERIC_MIX;
-	strlcpy(pcm->name, device_name, sizeof(pcm->name));
+	strscpy(pcm->name, device_name, sizeof(pcm->name));
 
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &ct_pcm_playback_ops);
 
diff --git a/sound/pci/emu10k1/emu10k1.c b/sound/pci/emu10k1/emu10k1.c
index 29b7720d7961..353934c88cbd 100644
--- a/sound/pci/emu10k1/emu10k1.c
+++ b/sound/pci/emu10k1/emu10k1.c
@@ -168,9 +168,9 @@ static int snd_card_emu10k1_probe(struct pci_dev *pci,
 	}
 #endif
  
-	strlcpy(card->driver, emu->card_capabilities->driver,
+	strscpy(card->driver, emu->card_capabilities->driver,
 		sizeof(card->driver));
-	strlcpy(card->shortname, emu->card_capabilities->name,
+	strscpy(card->shortname, emu->card_capabilities->name,
 		sizeof(card->shortname));
 	snprintf(card->longname, sizeof(card->longname),
 		 "%s (rev.%d, serial:0x%x) at 0x%lx, irq %i",
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index bd70e112ffd7..24a2fd706d69 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -1869,7 +1869,7 @@ int snd_emu10k1_create(struct snd_card *card,
 			emu->serial);
 
 	if (!*card->id && c->id)
-		strlcpy(card->id, c->id, sizeof(card->id));
+		strscpy(card->id, c->id, sizeof(card->id));
 
 	is_audigy = emu->audigy = c->emu10k2_chip;
 
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 4e76ed0e91d5..80ef62a4a7c0 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -940,7 +940,7 @@ static int snd_emu10k1_list_controls(struct snd_emu10k1 *emu,
 			memset(gctl, 0, sizeof(*gctl));
 			id = &ctl->kcontrol->id;
 			gctl->id.iface = (__force int)id->iface;
-			strlcpy(gctl->id.name, id->name, sizeof(gctl->id.name));
+			strscpy(gctl->id.name, id->name, sizeof(gctl->id.name));
 			gctl->id.index = id->index;
 			gctl->id.device = id->device;
 			gctl->id.subdevice = id->subdevice;
@@ -976,7 +976,7 @@ static int snd_emu10k1_icode_poke(struct snd_emu10k1 *emu,
 	err = snd_emu10k1_verify_controls(emu, icode, in_kernel);
 	if (err < 0)
 		goto __error;
-	strlcpy(emu->fx8010.name, icode->name, sizeof(emu->fx8010.name));
+	strscpy(emu->fx8010.name, icode->name, sizeof(emu->fx8010.name));
 	/* stop FX processor - this may be dangerous, but it's better to miss
 	   some samples than generate wrong ones - [jk] */
 	if (emu->audigy)
@@ -1015,7 +1015,7 @@ static int snd_emu10k1_icode_peek(struct snd_emu10k1 *emu,
 	int err;
 
 	mutex_lock(&emu->fx8010.lock);
-	strlcpy(icode->name, emu->fx8010.name, sizeof(icode->name));
+	strscpy(icode->name, emu->fx8010.name, sizeof(icode->name));
 	/* ok, do the main job */
 	err = snd_emu10k1_gpr_peek(emu, icode);
 	if (err >= 0)
diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index 34332d008b27..c6be14c4f311 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -2768,7 +2768,7 @@ static int snd_es1968_create(struct snd_card *card,
 		if (!snd_tea575x_init(&chip->tea, THIS_MODULE)) {
 			dev_info(card->dev, "detected TEA575x radio type %s\n",
 				   get_tea575x_gpio(chip)->name);
-			strlcpy(chip->tea.card, get_tea575x_gpio(chip)->name,
+			strscpy(chip->tea.card, get_tea575x_gpio(chip)->name,
 				sizeof(chip->tea.card));
 			break;
 		}
diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index 0a95032fd297..c6ad6235a669 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -1300,7 +1300,7 @@ static int snd_fm801_create(struct snd_card *card,
 		chip->tea575x_tuner |= tuner_only;
 	}
 	if (!(chip->tea575x_tuner & TUNER_DISABLED)) {
-		strlcpy(chip->tea.card, get_tea575x_gpio(chip)->name,
+		strscpy(chip->tea.card, get_tea575x_gpio(chip)->name,
 			sizeof(chip->tea.card));
 	}
 #endif
diff --git a/sound/pci/hda/hda_auto_parser.c b/sound/pci/hda/hda_auto_parser.c
index 4dc01647753c..1a001ecf7f63 100644
--- a/sound/pci/hda/hda_auto_parser.c
+++ b/sound/pci/hda/hda_auto_parser.c
@@ -764,7 +764,7 @@ int snd_hda_get_pin_label(struct hda_codec *codec, hda_nid_t nid,
 	}
 	if (!name)
 		return 0;
-	strlcpy(label, name, maxlen);
+	strscpy(label, name, maxlen);
 	return 1;
 }
 EXPORT_SYMBOL_GPL(snd_hda_get_pin_label);
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 687216e74526..bc3b51eb8390 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -4009,7 +4009,7 @@ int snd_hda_add_imux_item(struct hda_codec *codec,
 			 sizeof(imux->items[imux->num_items].label),
 			 "%s %d", label, label_idx);
 	else
-		strlcpy(imux->items[imux->num_items].label, label,
+		strscpy(imux->items[imux->num_items].label, label,
 			sizeof(imux->items[imux->num_items].label));
 	imux->items[imux->num_items].index = index;
 	imux->num_items++;
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 80016b7b6849..9087981cd1f7 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -735,7 +735,7 @@ int snd_hda_attach_pcm_stream(struct hda_bus *_bus, struct hda_codec *codec,
 			  &pcm);
 	if (err < 0)
 		return err;
-	strlcpy(pcm->name, cpcm->name, sizeof(pcm->name));
+	strscpy(pcm->name, cpcm->name, sizeof(pcm->name));
 	apcm = kzalloc(sizeof(*apcm), GFP_KERNEL);
 	if (apcm == NULL) {
 		snd_device_free(chip->card, pcm);
diff --git a/sound/pci/hda/hda_eld.c b/sound/pci/hda/hda_eld.c
index 136477ed46ae..9e97443795f8 100644
--- a/sound/pci/hda/hda_eld.c
+++ b/sound/pci/hda/hda_eld.c
@@ -260,7 +260,7 @@ int snd_hdmi_parse_eld(struct hda_codec *codec, struct parsed_hdmi_eld *e,
 		codec_info(codec, "HDMI: out of range MNL %d\n", mnl);
 		goto out_fail;
 	} else
-		strlcpy(e->monitor_name, buf + ELD_FIXED_BYTES, mnl + 1);
+		strscpy(e->monitor_name, buf + ELD_FIXED_BYTES, mnl + 1);
 
 	for (i = 0; i < e->sad_count; i++) {
 		if (ELD_FIXED_BYTES + mnl + 3 * (i + 1) > size) {
diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index 8060cc86dfea..5e40944e7342 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -5721,7 +5721,7 @@ static void fill_pcm_stream_name(char *str, size_t len, const char *sfx,
 
 	if (*str)
 		return;
-	strlcpy(str, chip_name, len);
+	strscpy(str, chip_name, len);
 
 	/* drop non-alnum chars after a space */
 	for (p = strchr(str, ' '); p; p = strchr(p + 1, ' ')) {
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 18cdd67bcb86..84c8e3e06ca8 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2037,7 +2037,7 @@ static int azx_first_init(struct azx *chip)
 		return -EBUSY;
 
 	strcpy(card->driver, "HDA-Intel");
-	strlcpy(card->shortname, driver_short_names[chip->driver_type],
+	strscpy(card->shortname, driver_short_names[chip->driver_type],
 		sizeof(card->shortname));
 	snprintf(card->longname, sizeof(card->longname),
 		 "%s at 0x%lx irq %i",
diff --git a/sound/pci/hda/hda_jack.c b/sound/pci/hda/hda_jack.c
index 588059428d8f..b8b568046592 100644
--- a/sound/pci/hda/hda_jack.c
+++ b/sound/pci/hda/hda_jack.c
@@ -530,7 +530,7 @@ static int add_jack_kctl(struct hda_codec *codec, hda_nid_t nid,
 		       !is_jack_detectable(codec, nid);
 
 	if (base_name)
-		strlcpy(name, base_name, sizeof(name));
+		strscpy(name, base_name, sizeof(name));
 	else
 		snd_hda_get_pin_label(codec, nid, cfg, name, sizeof(name), NULL);
 	if (phantom_jack)
diff --git a/sound/pci/ice1712/juli.c b/sound/pci/ice1712/juli.c
index e57a55cebc5a..f0f8324b08b6 100644
--- a/sound/pci/ice1712/juli.c
+++ b/sound/pci/ice1712/juli.c
@@ -413,7 +413,7 @@ static struct snd_kcontrol *ctl_find(struct snd_card *card,
 {
 	struct snd_ctl_elem_id sid = {0};
 
-	strlcpy(sid.name, name, sizeof(sid.name));
+	strscpy(sid.name, name, sizeof(sid.name));
 	sid.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	return snd_ctl_find_id(card, &sid);
 }
diff --git a/sound/pci/ice1712/psc724.c b/sound/pci/ice1712/psc724.c
index 7aa3f92040d0..82cf365cda10 100644
--- a/sound/pci/ice1712/psc724.c
+++ b/sound/pci/ice1712/psc724.c
@@ -189,12 +189,12 @@ static void psc724_set_jack_state(struct snd_ice1712 *ice, bool hp_connected)
 	/* notify about master speaker mute change */
 	memset(&elem_id, 0, sizeof(elem_id));
 	elem_id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	strlcpy(elem_id.name, "Master Speakers Playback Switch",
+	strscpy(elem_id.name, "Master Speakers Playback Switch",
 						sizeof(elem_id.name));
 	kctl = snd_ctl_find_id(ice->card, &elem_id);
 	snd_ctl_notify(ice->card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
 	/* and headphone mute change */
-	strlcpy(elem_id.name, spec->wm8776.ctl[WM8776_CTL_HP_SW].name,
+	strscpy(elem_id.name, spec->wm8776.ctl[WM8776_CTL_HP_SW].name,
 						sizeof(elem_id.name));
 	kctl = snd_ctl_find_id(ice->card, &elem_id);
 	snd_ctl_notify(ice->card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
diff --git a/sound/pci/ice1712/quartet.c b/sound/pci/ice1712/quartet.c
index 0e3e04aa9faf..0dfa093f7dca 100644
--- a/sound/pci/ice1712/quartet.c
+++ b/sound/pci/ice1712/quartet.c
@@ -771,7 +771,7 @@ static struct snd_kcontrol *ctl_find(struct snd_card *card,
 {
 	struct snd_ctl_elem_id sid = {0};
 
-	strlcpy(sid.name, name, sizeof(sid.name));
+	strscpy(sid.name, name, sizeof(sid.name));
 	sid.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	return snd_ctl_find_id(card, &sid);
 }
diff --git a/sound/pci/ice1712/wm8776.c b/sound/pci/ice1712/wm8776.c
index d96008df880d..6eda86119dff 100644
--- a/sound/pci/ice1712/wm8776.c
+++ b/sound/pci/ice1712/wm8776.c
@@ -38,7 +38,7 @@ static void snd_wm8776_activate_ctl(struct snd_wm8776 *wm,
 	unsigned int index_offset;
 
 	memset(&elem_id, 0, sizeof(elem_id));
-	strlcpy(elem_id.name, ctl_name, sizeof(elem_id.name));
+	strscpy(elem_id.name, ctl_name, sizeof(elem_id.name));
 	elem_id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
 	kctl = snd_ctl_find_id(card, &elem_id);
 	if (!kctl)
diff --git a/sound/pci/lola/lola.c b/sound/pci/lola/lola.c
index cdd8db79bcfa..491c90f83fbc 100644
--- a/sound/pci/lola/lola.c
+++ b/sound/pci/lola/lola.c
@@ -669,7 +669,7 @@ static int lola_create(struct snd_card *card, struct pci_dev *pci,
 	}
 
 	strcpy(card->driver, "Lola");
-	strlcpy(card->shortname, "Digigram Lola", sizeof(card->shortname));
+	strscpy(card->shortname, "Digigram Lola", sizeof(card->shortname));
 	snprintf(card->longname, sizeof(card->longname),
 		 "%s at 0x%lx irq %i",
 		 card->shortname, chip->bar[0].addr, chip->irq);
diff --git a/sound/pci/lola/lola_pcm.c b/sound/pci/lola/lola_pcm.c
index f647c7ed00c4..684faaf40f31 100644
--- a/sound/pci/lola/lola_pcm.c
+++ b/sound/pci/lola/lola_pcm.c
@@ -601,7 +601,7 @@ int lola_create_pcm(struct lola *chip)
 			  &pcm);
 	if (err < 0)
 		return err;
-	strlcpy(pcm->name, "Digigram Lola", sizeof(pcm->name));
+	strscpy(pcm->name, "Digigram Lola", sizeof(pcm->name));
 	pcm->private_data = chip;
 	for (i = 0; i < 2; i++) {
 		if (chip->pcm[i].num_streams)
diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 04e878a0f773..b66711574b1a 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6329,7 +6329,7 @@ static int snd_hdspm_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
 		memset(&hdspm_version, 0, sizeof(hdspm_version));
 
 		hdspm_version.card_type = hdspm->io_type;
-		strlcpy(hdspm_version.cardname, hdspm->card_name,
+		strscpy(hdspm_version.cardname, hdspm->card_name,
 				sizeof(hdspm_version.cardname));
 		hdspm_version.serial = hdspm->serial;
 		hdspm_version.firmware_rev = hdspm->firmware_rev;
diff --git a/sound/ppc/keywest.c b/sound/ppc/keywest.c
index 9554a0c506af..a6c1905039de 100644
--- a/sound/ppc/keywest.c
+++ b/sound/ppc/keywest.c
@@ -49,7 +49,7 @@ static int keywest_attach_adapter(struct i2c_adapter *adapter)
 		return -EINVAL; /* ignored */
 
 	memset(&info, 0, sizeof(struct i2c_board_info));
-	strlcpy(info.type, "keywest", I2C_NAME_SIZE);
+	strscpy(info.type, "keywest", I2C_NAME_SIZE);
 	info.addr = keywest_ctx->addr;
 	client = i2c_new_client_device(adapter, &info);
 	if (IS_ERR(client))
diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index daa58b5f941e..cad1cd1bfdf0 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1707,7 +1707,7 @@ int q6afe_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
 	pkt->hdr.token = hw_block_id;
 	pkt->hdr.opcode = AFE_CMD_REMOTE_LPASS_CORE_HW_VOTE_REQUEST;
 	vote_cfg->hw_block_id = hw_block_id;
-	strlcpy(vote_cfg->client_name, client_name,
+	strscpy(vote_cfg->client_name, client_name,
 			sizeof(vote_cfg->client_name));
 
 	ret = afe_apr_send_pkt(afe, pkt, NULL,
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 6e670b3e92a0..6dd5659db44c 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1472,7 +1472,7 @@ static int rsnd_kctrl_info(struct snd_kcontrol *kctrl,
 		uinfo->value.enumerated.items = cfg->max;
 		if (uinfo->value.enumerated.item >= cfg->max)
 			uinfo->value.enumerated.item = cfg->max - 1;
-		strlcpy(uinfo->value.enumerated.name,
+		strscpy(uinfo->value.enumerated.name,
 			cfg->texts[uinfo->value.enumerated.item],
 			sizeof(uinfo->value.enumerated.name));
 	} else {
diff --git a/sound/usb/bcd2000/bcd2000.c b/sound/usb/bcd2000/bcd2000.c
index 010976d9ceb2..cd4a0bc6d278 100644
--- a/sound/usb/bcd2000/bcd2000.c
+++ b/sound/usb/bcd2000/bcd2000.c
@@ -300,7 +300,7 @@ static int bcd2000_init_midi(struct bcd2000 *bcd2k)
 	if (ret < 0)
 		return ret;
 
-	strlcpy(rmidi->name, bcd2k->card->shortname, sizeof(rmidi->name));
+	strscpy(rmidi->name, bcd2k->card->shortname, sizeof(rmidi->name));
 
 	rmidi->info_flags = SNDRV_RAWMIDI_INFO_DUPLEX;
 	rmidi->private_data = bcd2k;
diff --git a/sound/usb/caiaq/audio.c b/sound/usb/caiaq/audio.c
index 3b6bb2cbe886..4981753652a7 100644
--- a/sound/usb/caiaq/audio.c
+++ b/sound/usb/caiaq/audio.c
@@ -804,7 +804,7 @@ int snd_usb_caiaq_audio_init(struct snd_usb_caiaqdev *cdev)
 	}
 
 	cdev->pcm->private_data = cdev;
-	strlcpy(cdev->pcm->name, cdev->product_name, sizeof(cdev->pcm->name));
+	strscpy(cdev->pcm->name, cdev->product_name, sizeof(cdev->pcm->name));
 
 	memset(cdev->sub_playback, 0, sizeof(cdev->sub_playback));
 	memset(cdev->sub_capture, 0, sizeof(cdev->sub_capture));
diff --git a/sound/usb/caiaq/device.c b/sound/usb/caiaq/device.c
index 2af3b7eb0a88..e03481caf7f6 100644
--- a/sound/usb/caiaq/device.c
+++ b/sound/usb/caiaq/device.c
@@ -477,9 +477,9 @@ static int init_card(struct snd_usb_caiaqdev *cdev)
 	usb_string(usb_dev, usb_dev->descriptor.iProduct,
 		   cdev->product_name, CAIAQ_USB_STR_LEN);
 
-	strlcpy(card->driver, MODNAME, sizeof(card->driver));
-	strlcpy(card->shortname, cdev->product_name, sizeof(card->shortname));
-	strlcpy(card->mixername, cdev->product_name, sizeof(card->mixername));
+	strscpy(card->driver, MODNAME, sizeof(card->driver));
+	strscpy(card->shortname, cdev->product_name, sizeof(card->shortname));
+	strscpy(card->mixername, cdev->product_name, sizeof(card->mixername));
 
 	/* if the id was not passed as module option, fill it with a shortened
 	 * version of the product string which does not contain any
diff --git a/sound/usb/caiaq/midi.c b/sound/usb/caiaq/midi.c
index 512fbb3ee604..c656d0162432 100644
--- a/sound/usb/caiaq/midi.c
+++ b/sound/usb/caiaq/midi.c
@@ -125,7 +125,7 @@ int snd_usb_caiaq_midi_init(struct snd_usb_caiaqdev *device)
 	if (ret < 0)
 		return ret;
 
-	strlcpy(rmidi->name, device->product_name, sizeof(rmidi->name));
+	strscpy(rmidi->name, device->product_name, sizeof(rmidi->name));
 
 	rmidi->info_flags = SNDRV_RAWMIDI_INFO_DUPLEX;
 	rmidi->private_data = device;
diff --git a/sound/usb/card.c b/sound/usb/card.c
index d731ca62d599..85e79b9ecb08 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -474,7 +474,7 @@ static void usb_audio_make_shortname(struct usb_device *dev,
 	else if (quirk && quirk->product_name)
 		s = quirk->product_name;
 	if (s && *s) {
-		strlcpy(card->shortname, s, sizeof(card->shortname));
+		strscpy(card->shortname, s, sizeof(card->shortname));
 		return;
 	}
 
@@ -506,7 +506,7 @@ static void usb_audio_make_longname(struct usb_device *dev,
 	if (preset && preset->profile_name)
 		s = preset->profile_name;
 	if (s && *s) {
-		strlcpy(card->longname, s, sizeof(card->longname));
+		strscpy(card->longname, s, sizeof(card->longname));
 		return;
 	}
 
diff --git a/sound/usb/hiface/chip.c b/sound/usb/hiface/chip.c
index b2d9623e9934..c2824188d142 100644
--- a/sound/usb/hiface/chip.c
+++ b/sound/usb/hiface/chip.c
@@ -80,12 +80,12 @@ static int hiface_chip_create(struct usb_interface *intf,
 		return ret;
 	}
 
-	strlcpy(card->driver, DRIVER_NAME, sizeof(card->driver));
+	strscpy(card->driver, DRIVER_NAME, sizeof(card->driver));
 
 	if (quirk && quirk->device_name)
-		strlcpy(card->shortname, quirk->device_name, sizeof(card->shortname));
+		strscpy(card->shortname, quirk->device_name, sizeof(card->shortname));
 	else
-		strlcpy(card->shortname, "M2Tech generic audio", sizeof(card->shortname));
+		strscpy(card->shortname, "M2Tech generic audio", sizeof(card->shortname));
 
 	strlcat(card->longname, card->shortname, sizeof(card->longname));
 	len = strlcat(card->longname, " at ", sizeof(card->longname));
diff --git a/sound/usb/hiface/pcm.c b/sound/usb/hiface/pcm.c
index d942179ca095..71f17f02f341 100644
--- a/sound/usb/hiface/pcm.c
+++ b/sound/usb/hiface/pcm.c
@@ -594,7 +594,7 @@ int hiface_pcm_init(struct hiface_chip *chip, u8 extra_freq)
 	pcm->private_data = rt;
 	pcm->private_free = hiface_pcm_free;
 
-	strlcpy(pcm->name, "USB-SPDIF Audio", sizeof(pcm->name));
+	strscpy(pcm->name, "USB-SPDIF Audio", sizeof(pcm->name));
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &pcm_ops);
 	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
 				       NULL, 0, 0);
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 12b15ed59eaa..60569d64c990 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1556,7 +1556,7 @@ static void check_no_speaker_on_headset(struct snd_kcontrol *kctl,
 	if (!found)
 		return;
 
-	strlcpy(kctl->id.name, "Headphone", sizeof(kctl->id.name));
+	strscpy(kctl->id.name, "Headphone", sizeof(kctl->id.name));
 }
 
 static const struct usb_feature_control_info *get_feature_control_info(int control)
@@ -1691,7 +1691,7 @@ static void __build_feature_ctl(struct usb_mixer_interface *mixer,
 		break;
 	default:
 		if (!len)
-			strlcpy(kctl->id.name, audio_feature_info[control-1].name,
+			strscpy(kctl->id.name, audio_feature_info[control-1].name,
 				sizeof(kctl->id.name));
 		break;
 	}
@@ -1770,7 +1770,7 @@ static void get_connector_control_name(struct usb_mixer_interface *mixer,
 	int name_len = get_term_name(mixer->chip, term, name, name_size, 0);
 
 	if (name_len == 0)
-		strlcpy(name, "Unknown", name_size);
+		strscpy(name, "Unknown", name_size);
 
 	/*
 	 *  sound/core/ctljack.c has a convention of naming jack controls
@@ -2490,7 +2490,7 @@ static int build_audio_procunit(struct mixer_build *state, int unitid,
 		if (check_mapped_name(map, kctl->id.name, sizeof(kctl->id.name))) {
 			/* nothing */ ;
 		} else if (info->name) {
-			strlcpy(kctl->id.name, info->name, sizeof(kctl->id.name));
+			strscpy(kctl->id.name, info->name, sizeof(kctl->id.name));
 		} else {
 			if (extension_unit)
 				nameid = uac_extension_unit_iExtension(desc, state->mixer->protocol);
@@ -2503,7 +2503,7 @@ static int build_audio_procunit(struct mixer_build *state, int unitid,
 							       kctl->id.name,
 							       sizeof(kctl->id.name));
 			if (!len)
-				strlcpy(kctl->id.name, name, sizeof(kctl->id.name));
+				strscpy(kctl->id.name, name, sizeof(kctl->id.name));
 		}
 		append_ctl_name(kctl, " ");
 		append_ctl_name(kctl, valinfo->suffix);
@@ -2743,7 +2743,7 @@ static int parse_audio_selector_unit(struct mixer_build *state, int unitid,
 				    kctl->id.name, sizeof(kctl->id.name), 0);
 		/* ... or use the fixed string "USB" as the last resort */
 		if (!len)
-			strlcpy(kctl->id.name, "USB", sizeof(kctl->id.name));
+			strscpy(kctl->id.name, "USB", sizeof(kctl->id.name));
 
 		/* and add the proper suffix */
 		if (desc->bDescriptorSubtype == UAC2_CLOCK_SELECTOR ||
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index df036a359f2f..abad1d61a536 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2725,7 +2725,7 @@ static int snd_pioneer_djm_controls_info(struct snd_kcontrol *kctl, struct snd_c
 	if (info->value.enumerated.item >= count)
 		info->value.enumerated.item = count - 1;
 	name = group->options[info->value.enumerated.item].name;
-	strlcpy(info->value.enumerated.name, name, sizeof(info->value.enumerated.name));
+	strscpy(info->value.enumerated.name, name, sizeof(info->value.enumerated.name));
 	info->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
 	info->count = 1;
 	info->value.enumerated.items = count;
diff --git a/sound/usb/mixer_scarlett.c b/sound/usb/mixer_scarlett.c
index 49fcd2505443..691b95466d0f 100644
--- a/sound/usb/mixer_scarlett.c
+++ b/sound/usb/mixer_scarlett.c
@@ -569,7 +569,7 @@ static int add_new_ctl(struct usb_mixer_interface *mixer,
 	}
 	kctl->private_free = snd_usb_mixer_elem_free;
 
-	strlcpy(kctl->id.name, name, sizeof(kctl->id.name));
+	strscpy(kctl->id.name, name, sizeof(kctl->id.name));
 
 	err = snd_usb_mixer_add_control(&elem->head, kctl);
 	if (err < 0)
diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 4bbec56c7df3..560c2ade829d 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -961,7 +961,7 @@ static int scarlett2_add_new_ctl(struct usb_mixer_interface *mixer,
 	}
 	kctl->private_free = snd_usb_mixer_elem_free;
 
-	strlcpy(kctl->id.name, name, sizeof(kctl->id.name));
+	strscpy(kctl->id.name, name, sizeof(kctl->id.name));
 
 	err = snd_usb_mixer_add_control(&elem->head, kctl);
 	if (err < 0)
diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
index bd63a9ce6a70..b7b6f3834ed5 100644
--- a/sound/usb/mixer_us16x08.c
+++ b/sound/usb/mixer_us16x08.c
@@ -1076,7 +1076,7 @@ static int add_new_ctl(struct usb_mixer_interface *mixer,
 	else
 		kctl->private_free = snd_usb_mixer_elem_free;
 
-	strlcpy(kctl->id.name, name, sizeof(kctl->id.name));
+	strscpy(kctl->id.name, name, sizeof(kctl->id.name));
 
 	err = snd_usb_mixer_add_control(&elem->head, kctl);
 	if (err < 0)
diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index 9f9fcd2749f2..5b351f4ca543 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1790,7 +1790,7 @@ static int hdmi_lpe_audio_probe(struct platform_device *pdev)
 		/* setup private data which can be retrieved when required */
 		pcm->private_data = ctx;
 		pcm->info_flags = 0;
-		strlcpy(pcm->name, card->shortname, strlen(card->shortname));
+		strscpy(pcm->name, card->shortname, strlen(card->shortname));
 		/* setup the ops for playabck */
 		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &had_pcm_ops);
 
diff --git a/sound/xen/xen_snd_front_cfg.c b/sound/xen/xen_snd_front_cfg.c
index eda077c8087a..63b0398c3276 100644
--- a/sound/xen/xen_snd_front_cfg.c
+++ b/sound/xen/xen_snd_front_cfg.c
@@ -398,7 +398,7 @@ static int cfg_device(struct xen_snd_front_info *front_info,
 
 	str = xenbus_read(XBT_NIL, device_path, XENSND_FIELD_DEVICE_NAME, NULL);
 	if (!IS_ERR(str)) {
-		strlcpy(pcm_instance->name, str, sizeof(pcm_instance->name));
+		strscpy(pcm_instance->name, str, sizeof(pcm_instance->name));
 		kfree(str);
 	}
 


