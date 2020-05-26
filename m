Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C991A8D6D
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 23:12:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA77B1665;
	Tue, 14 Apr 2020 23:11:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA77B1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586898753;
	bh=ZHlPgZpTQ/IcKcuao0jJuBUFgfSJLq2z62oSbuaxYGc=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LaPHim7jkK/B1fSpU0lQ2/Qt8AkfeRIGArDAKqKigOVC7v2+hwIlanQIZjiWizH0Q
	 fYubW9nrY3yme9btO1a6IR4dexWnnkgmqUCSU2uTAbQ9Zsx7MDxdQ+VjUw1xNv/TuK
	 LLU7SK1HXrhup/TZWIes6/U4QRNHU2l7xQKFg66w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E46DDF80115;
	Tue, 14 Apr 2020 23:10:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BDA7F8013D; Tue, 14 Apr 2020 23:10:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bollie.ca9.eu (bollie.ca9.eu [81.169.254.190])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEDDDF80115
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 23:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEDDDF80115
Received: by bollie.ca9.eu (Postfix, from userid 1000)
 id 216E7C488A; Tue, 14 Apr 2020 23:10:29 +0200 (CEST)
Date: Tue, 14 Apr 2020 23:10:29 +0200
From: Thomas Ebeling <penguins@bollie.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: RME Babyface Pro mixer patch
Message-ID: <20200414211019.qprg7whepg2y7nei@bollie.ca9.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20180716
Cc: tiwai@suse.com
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

Added mixer quirks to allow controlling the internal DSP of the
RME Babyface Pro and its successor Babyface Pro FS.

Signed-off-by: Thomas Ebeling <penguins@bollie.de>
---
 sound/usb/mixer_quirks.c | 418 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 418 insertions(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 02b036b2aefb..f0302ad7f5a0 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2181,6 +2181,421 @@ static int snd_rme_controls_create(struct usb_mixer_interface *mixer)
 	return 0;
 }
 
+/*
+ * RME Babyface Pro (FS)
+ *
+ * These devices exposes a couple of DSP functions via request to EP0.
+ * Switches are available via control registers, while routing is controlled
+ * by controlling the volume on each possible crossing point.
+ * Volume control is linear, from -inf (dec. 0) to +6dB (dec. 46341) with
+ * 0dB being at dec. 32768.
+ */
+enum {
+	SND_BBFPRO_CTL_REG1 = 0,
+	SND_BBFPRO_CTL_REG2
+};
+
+#define SND_BBFPRO_CTL_REG_MASK 1
+#define SND_BBFPRO_CTL_IDX_MASK 0xff
+#define SND_BBFPRO_CTL_IDX_SHIFT 1
+#define SND_BBFPRO_CTL_VAL_MASK 1
+#define SND_BBFPRO_CTL_VAL_SHIFT 9
+#define SND_BBFPRO_CTL_REG1_CLK_MASTER 0
+#define SND_BBFPRO_CTL_REG1_CLK_OPTICAL 1
+#define SND_BBFPRO_CTL_REG1_SPDIF_PRO 7
+#define SND_BBFPRO_CTL_REG1_SPDIF_EMPH 8
+#define SND_BBFPRO_CTL_REG1_SPDIF_OPTICAL 10
+#define SND_BBFPRO_CTL_REG2_48V_AN1 0
+#define SND_BBFPRO_CTL_REG2_48V_AN2 1
+#define SND_BBFPRO_CTL_REG2_SENS_IN3 2
+#define SND_BBFPRO_CTL_REG2_SENS_IN4 3
+#define SND_BBFPRO_CTL_REG2_PAD_AN1 4
+#define SND_BBFPRO_CTL_REG2_PAD_AN2 5
+
+#define SND_BBFPRO_MIXER_IDX_MASK 0x1ff
+#define SND_BBFPRO_MIXER_VAL_MASK 0x3ffff
+#define SND_BBFPRO_MIXER_VAL_SHIFT 9
+#define SND_BBFPRO_MIXER_VAL_MIN 0 // -inf
+#define SND_BBFPRO_MIXER_VAL_MAX 46341 // +6dB
+
+#define SND_BBFPRO_USBREQ_CTL_REG1 0x10
+#define SND_BBFPRO_USBREQ_CTL_REG2 0x17
+#define SND_BBFPRO_USBREQ_MIXER 0x12
+
+static int snd_bbfpro_ctl_update(struct usb_mixer_interface *mixer, u8 reg,
+				 u8 index, u8 value)
+{
+	int err;
+	u16 usb_req, usb_idx, usb_val;
+	struct snd_usb_audio *chip = mixer->chip;
+
+	err = snd_usb_lock_shutdown(chip);
+	if (err < 0)
+		return err;
+
+	if (reg == SND_BBFPRO_CTL_REG1) {
+		usb_req = SND_BBFPRO_USBREQ_CTL_REG1;
+		if (index == SND_BBFPRO_CTL_REG1_CLK_OPTICAL) {
+			usb_idx = 3;
+			usb_val = value ? 3 : 0;
+		} else {
+			usb_idx = 1 << index;
+			usb_val = value ? usb_idx : 0;
+		}
+	} else {
+		usb_req = SND_BBFPRO_USBREQ_CTL_REG2;
+		usb_idx = 1 << index;
+		usb_val = value ? usb_idx : 0;
+	}
+
+	err = snd_usb_ctl_msg(chip->dev,
+			      usb_sndctrlpipe(chip->dev, 0), usb_req,
+			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			      usb_val, usb_idx, 0, 0);
+
+	snd_usb_unlock_shutdown(chip);
+	return err;
+}
+
+static int snd_bbfpro_ctl_get(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	u8 reg, idx, val;
+	int pv;
+
+	pv = kcontrol->private_value;
+	reg = pv & SND_BBFPRO_CTL_REG_MASK;
+	idx = (pv >> SND_BBFPRO_CTL_IDX_SHIFT) & SND_BBFPRO_CTL_IDX_MASK;
+	val = kcontrol->private_value >> SND_BBFPRO_CTL_VAL_SHIFT;
+
+	if ((reg == SND_BBFPRO_CTL_REG1 &&
+	     idx == SND_BBFPRO_CTL_REG1_CLK_OPTICAL) ||
+	    (reg == SND_BBFPRO_CTL_REG2 &&
+	    (idx == SND_BBFPRO_CTL_REG2_SENS_IN3 ||
+	     idx == SND_BBFPRO_CTL_REG2_SENS_IN4))) {
+		ucontrol->value.enumerated.item[0] = val;
+	} else {
+		ucontrol->value.integer.value[0] = val;
+	}
+	return 0;
+}
+
+static int snd_bbfpro_ctl_info(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_info *uinfo)
+{
+	u8 reg, idx;
+	int pv;
+
+	pv = kcontrol->private_value;
+	reg = pv & SND_BBFPRO_CTL_REG_MASK;
+	idx = (pv >> SND_BBFPRO_CTL_IDX_SHIFT) & SND_BBFPRO_CTL_IDX_MASK;
+
+	if (reg == SND_BBFPRO_CTL_REG1 &&
+	    idx == SND_BBFPRO_CTL_REG1_CLK_OPTICAL) {
+		static const char * const texts[2] = {
+			"AutoSync",
+			"Internal"
+		};
+		return snd_ctl_enum_info(uinfo, 1, 2, texts);
+	} else if (reg == SND_BBFPRO_CTL_REG2 &&
+		   (idx == SND_BBFPRO_CTL_REG2_SENS_IN3 ||
+		    idx == SND_BBFPRO_CTL_REG2_SENS_IN4)) {
+		static const char * const texts[2] = {
+			"-10dBV",
+			"+4dBu"
+		};
+		return snd_ctl_enum_info(uinfo, 1, 2, texts);
+	}
+
+	uinfo->count = 1;
+	uinfo->value.integer.min = 0;
+	uinfo->value.integer.max = 1;
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+	return 0;
+}
+
+static int snd_bbfpro_ctl_put(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	int err;
+	u8 reg, idx;
+	int old_value, pv, val;
+
+	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kcontrol);
+	struct usb_mixer_interface *mixer = list->mixer;
+
+	pv = kcontrol->private_value;
+	reg = pv & SND_BBFPRO_CTL_REG_MASK;
+	idx = (pv >> SND_BBFPRO_CTL_IDX_SHIFT) & SND_BBFPRO_CTL_IDX_MASK;
+	old_value = (pv >> SND_BBFPRO_CTL_VAL_SHIFT) & SND_BBFPRO_CTL_VAL_MASK;
+
+	if ((reg == SND_BBFPRO_CTL_REG1 &&
+	     idx == SND_BBFPRO_CTL_REG1_CLK_OPTICAL) ||
+	    (reg == SND_BBFPRO_CTL_REG2 &&
+	    (idx == SND_BBFPRO_CTL_REG2_SENS_IN3 ||
+	     idx == SND_BBFPRO_CTL_REG2_SENS_IN4))) {
+		val = ucontrol->value.enumerated.item[0];
+	} else {
+		val = ucontrol->value.integer.value[0];
+	}
+
+	if (val > 1)
+		return -EINVAL;
+
+	if (val == old_value)
+		return 0;
+
+	kcontrol->private_value = reg
+		| ((idx & SND_BBFPRO_CTL_IDX_MASK) << SND_BBFPRO_CTL_IDX_SHIFT)
+		| ((val & SND_BBFPRO_CTL_VAL_MASK) << SND_BBFPRO_CTL_VAL_SHIFT);
+
+	err = snd_bbfpro_ctl_update(mixer, reg, idx, val);
+	return err < 0 ? err : 1;
+}
+
+static int snd_bbfpro_ctl_resume(struct usb_mixer_elem_list *list)
+{
+	u8 reg, idx;
+	int value, pv;
+
+	pv = list->kctl->private_value;
+	reg = pv & SND_BBFPRO_CTL_REG_MASK;
+	idx = (pv >> SND_BBFPRO_CTL_IDX_SHIFT) & SND_BBFPRO_CTL_IDX_MASK;
+	value = (pv >> SND_BBFPRO_CTL_VAL_SHIFT) & SND_BBFPRO_CTL_VAL_MASK;
+
+	return snd_bbfpro_ctl_update(list->mixer, reg, idx, value);
+}
+
+static int snd_bbfpro_vol_update(struct usb_mixer_interface *mixer, u16 index,
+				 u32 value)
+{
+	struct snd_usb_audio *chip = mixer->chip;
+	int err;
+	u16 idx;
+	u16 usb_idx, usb_val;
+	u32 v;
+
+	err = snd_usb_lock_shutdown(chip);
+	if (err < 0)
+		return err;
+
+	idx = index & SND_BBFPRO_MIXER_IDX_MASK;
+	// 18 bit linear volume, split so 2 bits end up in index.
+	v = value & SND_BBFPRO_MIXER_VAL_MASK;
+	usb_idx = idx | (v & 0x3) << 14;
+	usb_val = (v >> 2) & 0xffff;
+
+	err = snd_usb_ctl_msg(chip->dev,
+			      usb_sndctrlpipe(chip->dev, 0),
+			      SND_BBFPRO_USBREQ_MIXER,
+			      USB_DIR_OUT | USB_TYPE_VENDOR |
+			      USB_RECIP_DEVICE,
+			      usb_val, usb_idx, 0, 0);
+
+	snd_usb_unlock_shutdown(chip);
+	return err;
+}
+
+static int snd_bbfpro_vol_get(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.integer.value[0] =
+		kcontrol->private_value >> SND_BBFPRO_MIXER_VAL_SHIFT;
+	return 0;
+}
+
+static int snd_bbfpro_vol_info(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_info *uinfo)
+{
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+	uinfo->count = 1;
+	uinfo->value.integer.min = SND_BBFPRO_MIXER_VAL_MIN;
+	uinfo->value.integer.max = SND_BBFPRO_MIXER_VAL_MAX;
+	return 0;
+}
+
+static int snd_bbfpro_vol_put(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	int err;
+	u16 idx;
+	u32 new_val, old_value, uvalue;
+	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kcontrol);
+	struct usb_mixer_interface *mixer = list->mixer;
+
+	uvalue = ucontrol->value.integer.value[0];
+	idx = kcontrol->private_value & SND_BBFPRO_MIXER_IDX_MASK;
+	old_value = kcontrol->private_value >> SND_BBFPRO_MIXER_VAL_SHIFT;
+
+	if (uvalue > SND_BBFPRO_MIXER_VAL_MAX)
+		return -EINVAL;
+
+	if (uvalue == old_value)
+		return 0;
+
+	new_val = uvalue & SND_BBFPRO_MIXER_VAL_MASK;
+
+	kcontrol->private_value = idx
+		| (new_val << SND_BBFPRO_MIXER_VAL_SHIFT);
+
+	err = snd_bbfpro_vol_update(mixer, idx, new_val);
+	return err < 0 ? err : 1;
+}
+
+static int snd_bbfpro_vol_resume(struct usb_mixer_elem_list *list)
+{
+	int pv = list->kctl->private_value;
+	u16 idx = pv & SND_BBFPRO_MIXER_IDX_MASK;
+	u32 val = (pv >> SND_BBFPRO_MIXER_VAL_SHIFT)
+		& SND_BBFPRO_MIXER_VAL_MASK;
+	return snd_bbfpro_vol_update(list->mixer, idx, val);
+}
+
+// Predfine elements
+static const struct snd_kcontrol_new snd_bbfpro_ctl_control = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.index = 0,
+	.info = snd_bbfpro_ctl_info,
+	.get = snd_bbfpro_ctl_get,
+	.put = snd_bbfpro_ctl_put
+};
+
+static const struct snd_kcontrol_new snd_bbfpro_vol_control = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+	.index = 0,
+	.info = snd_bbfpro_vol_info,
+	.get = snd_bbfpro_vol_get,
+	.put = snd_bbfpro_vol_put
+};
+
+static int snd_bbfpro_ctl_add(struct usb_mixer_interface *mixer, u8 reg,
+			      u8 index, char *name)
+{
+	struct snd_kcontrol_new knew = snd_bbfpro_ctl_control;
+
+	knew.name = name;
+	knew.private_value = (reg & SND_BBFPRO_CTL_REG_MASK)
+		| ((index & SND_BBFPRO_CTL_IDX_MASK)
+			<< SND_BBFPRO_CTL_IDX_SHIFT);
+
+	return add_single_ctl_with_resume(mixer, 0, snd_bbfpro_ctl_resume,
+		&knew, NULL);
+}
+
+static int snd_bbfpro_vol_add(struct usb_mixer_interface *mixer, u16 index,
+			      char *name)
+{
+	struct snd_kcontrol_new knew = snd_bbfpro_vol_control;
+
+	knew.name = name;
+	knew.private_value = index & SND_BBFPRO_MIXER_IDX_MASK;
+
+	return add_single_ctl_with_resume(mixer, 0, snd_bbfpro_vol_resume,
+		&knew, NULL);
+}
+
+static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
+{
+	int err, i, o;
+	char name[48];
+
+	static const char * const input[] = {
+		"AN1", "AN2", "IN3", "IN4", "AS1", "AS2", "ADAT3",
+		"ADAT4", "ADAT5", "ADAT6", "ADAT7", "ADAT8"};
+
+	static const char * const output[] = {
+		"AN1", "AN2", "PH3", "PH4", "AS1", "AS2", "ADAT3", "ADAT4",
+		"ADAT5", "ADAT6", "ADAT7", "ADAT8"};
+
+	for (o = 0 ; o < 12 ; ++o) {
+		for (i = 0 ; i < 12 ; ++i) {
+			// Line routing
+			snprintf(name, sizeof(name),
+				 "%s-%s-%s Playback Volume",
+				 (i < 2 ? "Mic" : "Line"),
+				 input[i], output[o]);
+			err = snd_bbfpro_vol_add(mixer, (26 * o + i), name);
+			if (err < 0)
+				return err;
+
+			// PCM routing... yes, it is output remapping
+			snprintf(name, sizeof(name),
+				 "PCM-%s-%s Playback Volume",
+				 output[i], output[o]);
+			err = snd_bbfpro_vol_add(mixer, (26 * o + 12 + i),
+						 name);
+			if (err < 0)
+				return err;
+		}
+	}
+
+	// Control Reg 1
+	err = snd_bbfpro_ctl_add(mixer, SND_BBFPRO_CTL_REG1,
+				 SND_BBFPRO_CTL_REG1_CLK_OPTICAL,
+				 "Sample Clock Source");
+	if (err < 0)
+		return err;
+
+	err = snd_bbfpro_ctl_add(mixer, SND_BBFPRO_CTL_REG1,
+				 SND_BBFPRO_CTL_REG1_SPDIF_PRO,
+				 "IEC958 Pro Mask");
+	if (err < 0)
+		return err;
+
+	err = snd_bbfpro_ctl_add(mixer, SND_BBFPRO_CTL_REG1,
+				 SND_BBFPRO_CTL_REG1_SPDIF_EMPH,
+				 "IEC958 Emphasis");
+	if (err < 0)
+		return err;
+
+	err = snd_bbfpro_ctl_add(mixer, SND_BBFPRO_CTL_REG1,
+				 SND_BBFPRO_CTL_REG1_SPDIF_OPTICAL,
+				 "IEC958 Switch");
+	if (err < 0)
+		return err;
+
+	// Control Reg 2
+	err = snd_bbfpro_ctl_add(mixer, SND_BBFPRO_CTL_REG2,
+				 SND_BBFPRO_CTL_REG2_48V_AN1,
+				 "Mic-AN1 48V");
+	if (err < 0)
+		return err;
+
+	err = snd_bbfpro_ctl_add(mixer, SND_BBFPRO_CTL_REG2,
+				 SND_BBFPRO_CTL_REG2_48V_AN2,
+				 "Mic-AN2 48V");
+	if (err < 0)
+		return err;
+
+	err = snd_bbfpro_ctl_add(mixer, SND_BBFPRO_CTL_REG2,
+				 SND_BBFPRO_CTL_REG2_SENS_IN3,
+				 "Line-IN3 Sens.");
+	if (err < 0)
+		return err;
+
+	err = snd_bbfpro_ctl_add(mixer, SND_BBFPRO_CTL_REG2,
+				 SND_BBFPRO_CTL_REG2_SENS_IN4,
+				 "Line-IN4 Sens.");
+	if (err < 0)
+		return err;
+
+	err = snd_bbfpro_ctl_add(mixer, SND_BBFPRO_CTL_REG2,
+				 SND_BBFPRO_CTL_REG2_PAD_AN1,
+				 "Mic-AN1 PAD");
+	if (err < 0)
+		return err;
+
+	err = snd_bbfpro_ctl_add(mixer, SND_BBFPRO_CTL_REG2,
+				 SND_BBFPRO_CTL_REG2_PAD_AN2,
+				 "Mic-AN2 PAD");
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
 int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 {
 	int err = 0;
@@ -2282,6 +2697,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x0194f, 0x010c): /* Presonus Studio 1810c */
 		err = snd_sc1810_init_mixer(mixer);
 		break;
+	case USB_ID(0x2a39, 0x3fb0): /* RME Babyface Pro FS */
+		err = snd_bbfpro_controls_create(mixer);
+		break;
 	}
 
 	return err;
-- 
2.26.0

