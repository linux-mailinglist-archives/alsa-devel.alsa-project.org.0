Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C3812F5AF
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:46:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACDA51776;
	Fri,  3 Jan 2020 09:45:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACDA51776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578041184;
	bh=S7kcLoJ8aTilTnjBZ34zYeoLTApWUKzAPh/WnQiLias=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X4pAqonZAjfId/wFQVw8XboIYD6qZ3pBU4bDt8FGld1Nz4Jsgvw9Q3X6Yx8h9/E35
	 k5fhybkwwZxYvwIURi8v1JL6SHmYD2DmCQDtnTTb9y/YmwnA0U/NC6v7xl+yQS5Uge
	 9zJFmR6/l+wuIUC+lLN5houjdgCRyRLGrIcNMA1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF7DAF8049B;
	Fri,  3 Jan 2020 09:19:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52F7EF80390; Fri,  3 Jan 2020 09:18:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CEAFF802A2
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CEAFF802A2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 77920B279
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:53 +0100
Message-Id: <20200103081714.9560-38-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 37/58] ALSA: pci: Constify snd_kcontrol_new
	items
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

Most of snd_kcontrol_new definitions are read-only and passed as-is.
Let's declare them as const for further optimization.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ak4531_codec.c                 |  2 +-
 sound/pci/ali5451/ali5451.c              |  2 +-
 sound/pci/au88x0/au88x0_pcm.c            |  2 +-
 sound/pci/azt3328.c                      |  2 +-
 sound/pci/ca0106/ca0106_mixer.c          |  4 ++--
 sound/pci/cmipci.c                       | 16 ++++++++--------
 sound/pci/cs46xx/cs46xx_lib.c            |  4 ++--
 sound/pci/cs5535audio/cs5535audio_olpc.c |  2 +-
 sound/pci/emu10k1/emumixer.c             | 14 +++++++-------
 sound/pci/emu10k1/p16v.c                 |  2 +-
 sound/pci/ens1370.c                      |  4 ++--
 sound/pci/es1938.c                       |  2 +-
 sound/pci/fm801.c                        |  4 ++--
 sound/pci/ice1712/aureon.c               | 10 +++++-----
 sound/pci/ice1712/delta.c                | 10 +++++-----
 sound/pci/ice1712/ews.c                  |  6 +++---
 sound/pci/ice1712/ice1712.c              |  2 +-
 sound/pci/ice1712/juli.c                 |  2 +-
 sound/pci/ice1712/maya44.c               |  2 +-
 sound/pci/ice1712/phase.c                |  4 ++--
 sound/pci/ice1712/pontis.c               |  2 +-
 sound/pci/ice1712/prodigy192.c           |  4 ++--
 sound/pci/ice1712/prodigy_hifi.c         |  4 ++--
 sound/pci/ice1712/quartet.c              |  2 +-
 sound/pci/ice1712/wtm.c                  |  2 +-
 sound/pci/korg1212/korg1212.c            |  2 +-
 sound/pci/rme32.c                        |  2 +-
 sound/pci/rme96.c                        |  2 +-
 sound/pci/rme9652/hdsp.c                 |  8 ++++----
 sound/pci/rme9652/hdspm.c                | 14 +++++++-------
 sound/pci/rme9652/rme9652.c              |  6 +++---
 sound/pci/sonicvibes.c                   |  6 +++---
 sound/pci/ymfpci/ymfpci_main.c           |  2 +-
 33 files changed, 76 insertions(+), 76 deletions(-)

diff --git a/sound/pci/ak4531_codec.c b/sound/pci/ak4531_codec.c
index fbf9a93a8053..c00c65726a34 100644
--- a/sound/pci/ak4531_codec.c
+++ b/sound/pci/ak4531_codec.c
@@ -255,7 +255,7 @@ static const DECLARE_TLV_DB_SCALE(db_scale_master, -6200, 200, 0);
 static const DECLARE_TLV_DB_SCALE(db_scale_mono, -2800, 400, 0);
 static const DECLARE_TLV_DB_SCALE(db_scale_input, -5000, 200, 0);
 
-static struct snd_kcontrol_new snd_ak4531_controls[] = {
+static const struct snd_kcontrol_new snd_ak4531_controls[] = {
 
 AK4531_DOUBLE_TLV("Master Playback Switch", 0,
 		  AK4531_LMASTER, AK4531_RMASTER, 7, 7, 1, 1,
diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index b2374266c52c..4f524a9dbbca 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -1776,7 +1776,7 @@ static int snd_ali5451_spdif_put(struct snd_kcontrol *kcontrol,
 	return change;
 }
 
-static struct snd_kcontrol_new snd_ali5451_mixer_spdif[] = {
+static const struct snd_kcontrol_new snd_ali5451_mixer_spdif[] = {
 	/* spdif aplayback switch */
 	/* FIXME: "IEC958 Playback Switch" may conflict with one on ac97_codec */
 	ALI5451_SPDIF(SNDRV_CTL_NAME_IEC958("Output ",NONE,SWITCH), 0, 0),
diff --git a/sound/pci/au88x0/au88x0_pcm.c b/sound/pci/au88x0/au88x0_pcm.c
index 787c79aba441..2cdb7845f651 100644
--- a/sound/pci/au88x0/au88x0_pcm.c
+++ b/sound/pci/au88x0/au88x0_pcm.c
@@ -497,7 +497,7 @@ static int snd_vortex_spdif_put(struct snd_kcontrol *kcontrol, struct snd_ctl_el
 }
 
 /* spdif controls */
-static struct snd_kcontrol_new snd_vortex_mixer_spdif[] = {
+static const struct snd_kcontrol_new snd_vortex_mixer_spdif[] = {
 	{
 		.iface =	SNDRV_CTL_ELEM_IFACE_PCM,
 		.name =		SNDRV_CTL_NAME_IEC958("",PLAYBACK,DEFAULT),
diff --git a/sound/pci/azt3328.c b/sound/pci/azt3328.c
index 898ba55fc0dd..73745352c55d 100644
--- a/sound/pci/azt3328.c
+++ b/sound/pci/azt3328.c
@@ -1094,7 +1094,7 @@ snd_azf3328_put_mixer_enum(struct snd_kcontrol *kcontrol,
 	return (nreg != oreg);
 }
 
-static struct snd_kcontrol_new snd_azf3328_mixer_controls[] = {
+static const struct snd_kcontrol_new snd_azf3328_mixer_controls[] = {
 	AZF3328_MIXER_SWITCH("Master Playback Switch", IDX_MIXER_PLAY_MASTER, 15, 1),
 	AZF3328_MIXER_VOL_STEREO("Master Playback Volume", IDX_MIXER_PLAY_MASTER, 0x1f, 1),
 	AZF3328_MIXER_SWITCH("PCM Playback Switch", IDX_MIXER_WAVEOUT, 15, 1),
diff --git a/sound/pci/ca0106/ca0106_mixer.c b/sound/pci/ca0106/ca0106_mixer.c
index 38f7f0a8c810..729d757c900a 100644
--- a/sound/pci/ca0106/ca0106_mixer.c
+++ b/sound/pci/ca0106/ca0106_mixer.c
@@ -550,7 +550,7 @@ static int spi_mute_put(struct snd_kcontrol *kcontrol,
 	.private_value = ((chid) << 8) | (reg)			\
 }
 
-static struct snd_kcontrol_new snd_ca0106_volume_ctls[] = {
+static const struct snd_kcontrol_new snd_ca0106_volume_ctls[] = {
 	CA_VOLUME("Analog Front Playback Volume",
 		  CONTROL_FRONT_CHANNEL, PLAYBACK_VOLUME2),
         CA_VOLUME("Analog Rear Playback Volume",
@@ -631,7 +631,7 @@ static struct snd_kcontrol_new snd_ca0106_volume_ctls[] = {
 	.private_value = chid					\
 }
 
-static struct snd_kcontrol_new snd_ca0106_volume_i2c_adc_ctls[] = {
+static const struct snd_kcontrol_new snd_ca0106_volume_i2c_adc_ctls[] = {
         I2C_VOLUME("Phone Capture Volume", 0),
         I2C_VOLUME("Mic Capture Volume", 1),
         I2C_VOLUME("Line in Capture Volume", 2),
diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
index ff5525722d58..7f91742ed6f0 100644
--- a/sound/pci/cmipci.c
+++ b/sound/pci/cmipci.c
@@ -2256,7 +2256,7 @@ static int snd_cmipci_put_native_mixer_sensitive(struct snd_kcontrol *kcontrol,
 }
 
 
-static struct snd_kcontrol_new snd_cmipci_mixers[] = {
+static const struct snd_kcontrol_new snd_cmipci_mixers[] = {
 	CMIPCI_SB_VOL_STEREO("Master Playback Volume", SB_DSP4_MASTER_DEV, 3, 31),
 	CMIPCI_MIXER_SW_MONO("3D Control - Switch", CM_REG_MIXER1, CM_X3DEN_SHIFT, 0),
 	CMIPCI_SB_VOL_STEREO("PCM Playback Volume", SB_DSP4_PCM_DEV, 3, 31),
@@ -2567,7 +2567,7 @@ static int snd_cmipci_mic_in_mode_put(struct snd_kcontrol *kcontrol,
 }
 
 /* both for CM8338/8738 */
-static struct snd_kcontrol_new snd_cmipci_mixer_switches[] = {
+static const struct snd_kcontrol_new snd_cmipci_mixer_switches[] = {
 	DEFINE_MIXER_SWITCH("Four Channel Mode", fourch),
 	{
 		.name = "Line-In Mode",
@@ -2579,11 +2579,11 @@ static struct snd_kcontrol_new snd_cmipci_mixer_switches[] = {
 };
 
 /* for non-multichannel chips */
-static struct snd_kcontrol_new snd_cmipci_nomulti_switch =
+static const struct snd_kcontrol_new snd_cmipci_nomulti_switch =
 DEFINE_MIXER_SWITCH("Exchange DAC", exchange_dac);
 
 /* only for CM8738 */
-static struct snd_kcontrol_new snd_cmipci_8738_mixer_switches[] = {
+static const struct snd_kcontrol_new snd_cmipci_8738_mixer_switches[] = {
 #if 0 /* controlled in pcm device */
 	DEFINE_MIXER_SWITCH("IEC958 In Record", spdif_in),
 	DEFINE_MIXER_SWITCH("IEC958 Out", spdif_out),
@@ -2605,14 +2605,14 @@ static struct snd_kcontrol_new snd_cmipci_8738_mixer_switches[] = {
 };
 
 /* only for model 033/037 */
-static struct snd_kcontrol_new snd_cmipci_old_mixer_switches[] = {
+static const struct snd_kcontrol_new snd_cmipci_old_mixer_switches[] = {
 	DEFINE_MIXER_SWITCH("IEC958 Mix Analog", spdif_dac_out),
 	DEFINE_MIXER_SWITCH("IEC958 In Phase Inverse", spdi_phase),
 	DEFINE_MIXER_SWITCH("IEC958 In Select", spdif_in_sel1),
 };
 
 /* only for model 039 or later */
-static struct snd_kcontrol_new snd_cmipci_extra_mixer_switches[] = {
+static const struct snd_kcontrol_new snd_cmipci_extra_mixer_switches[] = {
 	DEFINE_MIXER_SWITCH("IEC958 In Select", spdif_in_sel2),
 	DEFINE_MIXER_SWITCH("IEC958 In Phase Inverse", spdi_phase2),
 	{
@@ -2625,14 +2625,14 @@ static struct snd_kcontrol_new snd_cmipci_extra_mixer_switches[] = {
 };
 
 /* card control switches */
-static struct snd_kcontrol_new snd_cmipci_modem_switch =
+static const struct snd_kcontrol_new snd_cmipci_modem_switch =
 DEFINE_CARD_SWITCH("Modem", modem);
 
 
 static int snd_cmipci_mixer_new(struct cmipci *cm, int pcm_spdif_device)
 {
 	struct snd_card *card;
-	struct snd_kcontrol_new *sw;
+	const struct snd_kcontrol_new *sw;
 	struct snd_kcontrol *kctl;
 	unsigned int idx;
 	int err;
diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 5bb84303f577..cbac9f1edc51 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -2238,7 +2238,7 @@ static int snd_cs46xx_spdif_stream_put(struct snd_kcontrol *kcontrol,
 #endif /* CONFIG_SND_CS46XX_NEW_DSP */
 
 
-static struct snd_kcontrol_new snd_cs46xx_controls[] = {
+static const struct snd_kcontrol_new snd_cs46xx_controls[] = {
 {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "DAC Volume",
@@ -2364,7 +2364,7 @@ static const struct snd_kcontrol_new snd_cs46xx_front_dup_ctl = {
 
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
 /* Only available on the Hercules Game Theater XP soundcard */
-static struct snd_kcontrol_new snd_hercules_controls[] = {
+static const struct snd_kcontrol_new snd_hercules_controls[] = {
 {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Optical/Coaxial SPDIF Input Switch",
diff --git a/sound/pci/cs5535audio/cs5535audio_olpc.c b/sound/pci/cs5535audio/cs5535audio_olpc.c
index bd246b10636e..4e295303b041 100644
--- a/sound/pci/cs5535audio/cs5535audio_olpc.c
+++ b/sound/pci/cs5535audio/cs5535audio_olpc.c
@@ -111,7 +111,7 @@ static int olpc_mic_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *v)
 	return 1;
 }
 
-static struct snd_kcontrol_new olpc_cs5535audio_ctls[] = {
+static const struct snd_kcontrol_new olpc_cs5535audio_ctls[] = {
 {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "DC Mode Enable",
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 0b3dfc71fa69..46c79dfe9844 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -484,7 +484,7 @@ static int snd_emu1010_input_source_put(struct snd_kcontrol *kcontrol,
 	.private_value = chid					\
 }
 
-static struct snd_kcontrol_new snd_emu1010_output_enum_ctls[] = {
+static const struct snd_kcontrol_new snd_emu1010_output_enum_ctls[] = {
 	EMU1010_SOURCE_OUTPUT("Dock DAC1 Left Playback Enum", 0),
 	EMU1010_SOURCE_OUTPUT("Dock DAC1 Right Playback Enum", 1),
 	EMU1010_SOURCE_OUTPUT("Dock DAC2 Left Playback Enum", 2),
@@ -513,7 +513,7 @@ static struct snd_kcontrol_new snd_emu1010_output_enum_ctls[] = {
 
 
 /* 1616(m) cardbus */
-static struct snd_kcontrol_new snd_emu1616_output_enum_ctls[] = {
+static const struct snd_kcontrol_new snd_emu1616_output_enum_ctls[] = {
 	EMU1010_SOURCE_OUTPUT("Dock DAC1 Left Playback Enum", 0),
 	EMU1010_SOURCE_OUTPUT("Dock DAC1 Right Playback Enum", 1),
 	EMU1010_SOURCE_OUTPUT("Dock DAC2 Left Playback Enum", 2),
@@ -545,7 +545,7 @@ static struct snd_kcontrol_new snd_emu1616_output_enum_ctls[] = {
 	.private_value = chid					\
 }
 
-static struct snd_kcontrol_new snd_emu1010_input_enum_ctls[] = {
+static const struct snd_kcontrol_new snd_emu1010_input_enum_ctls[] = {
 	EMU1010_SOURCE_INPUT("DSP 0 Capture Enum", 0),
 	EMU1010_SOURCE_INPUT("DSP 1 Capture Enum", 1),
 	EMU1010_SOURCE_INPUT("DSP 2 Capture Enum", 2),
@@ -613,7 +613,7 @@ static int snd_emu1010_adc_pads_put(struct snd_kcontrol *kcontrol, struct snd_ct
 	.private_value = chid					\
 }
 
-static struct snd_kcontrol_new snd_emu1010_adc_pads[] = {
+static const struct snd_kcontrol_new snd_emu1010_adc_pads[] = {
 	EMU1010_ADC_PADS("ADC1 14dB PAD Audio Dock Capture Switch", EMU_HANA_DOCK_ADC_PAD1),
 	EMU1010_ADC_PADS("ADC2 14dB PAD Audio Dock Capture Switch", EMU_HANA_DOCK_ADC_PAD2),
 	EMU1010_ADC_PADS("ADC3 14dB PAD Audio Dock Capture Switch", EMU_HANA_DOCK_ADC_PAD3),
@@ -661,7 +661,7 @@ static int snd_emu1010_dac_pads_put(struct snd_kcontrol *kcontrol, struct snd_ct
 	.private_value = chid					\
 }
 
-static struct snd_kcontrol_new snd_emu1010_dac_pads[] = {
+static const struct snd_kcontrol_new snd_emu1010_dac_pads[] = {
 	EMU1010_DAC_PADS("DAC1 Audio Dock 14dB PAD Playback Switch", EMU_HANA_DOCK_DAC_PAD1),
 	EMU1010_DAC_PADS("DAC2 Audio Dock 14dB PAD Playback Switch", EMU_HANA_DOCK_DAC_PAD2),
 	EMU1010_DAC_PADS("DAC3 Audio Dock 14dB PAD Playback Switch", EMU_HANA_DOCK_DAC_PAD3),
@@ -1051,7 +1051,7 @@ static int snd_audigy_i2c_volume_put(struct snd_kcontrol *kcontrol,
 }
 
 
-static struct snd_kcontrol_new snd_audigy_i2c_volume_ctls[] = {
+static const struct snd_kcontrol_new snd_audigy_i2c_volume_ctls[] = {
 	I2C_VOLUME("Mic Capture Volume", 0),
 	I2C_VOLUME("Line Capture Volume", 0)
 };
@@ -1125,7 +1125,7 @@ static int snd_audigy_spdif_output_rate_put(struct snd_kcontrol *kcontrol,
 	return change;
 }
 
-static struct snd_kcontrol_new snd_audigy_spdif_output_rate =
+static const struct snd_kcontrol_new snd_audigy_spdif_output_rate =
 {
 	.access =	SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.iface =        SNDRV_CTL_ELEM_IFACE_MIXER,
diff --git a/sound/pci/emu10k1/p16v.c b/sound/pci/emu10k1/p16v.c
index 1cdbad494e13..1099f102b365 100644
--- a/sound/pci/emu10k1/p16v.c
+++ b/sound/pci/emu10k1/p16v.c
@@ -776,7 +776,7 @@ static const DECLARE_TLV_DB_SCALE(snd_p16v_db_scale1, -5175, 25, 1);
 	.private_value = ((xreg) | ((xhl) << 8)) \
 }
 
-static struct snd_kcontrol_new p16v_mixer_controls[] = {
+static const struct snd_kcontrol_new p16v_mixer_controls[] = {
 	P16V_VOL("HD Analog Front Playback Volume", PLAYBACK_VOLUME_MIXER9, 0),
 	P16V_VOL("HD Analog Rear Playback Volume", PLAYBACK_VOLUME_MIXER10, 1),
 	P16V_VOL("HD Analog Center/LFE Playback Volume", PLAYBACK_VOLUME_MIXER9, 1),
diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 15e6d2377ecf..4f8202980b61 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -1433,7 +1433,7 @@ static int snd_es1371_spdif_put(struct snd_kcontrol *kcontrol,
 
 
 /* spdif controls */
-static struct snd_kcontrol_new snd_es1371_mixer_spdif[] = {
+static const struct snd_kcontrol_new snd_es1371_mixer_spdif[] = {
 	ES1371_SPDIF(SNDRV_CTL_NAME_IEC958("",PLAYBACK,SWITCH)),
 	{
 		.iface =	SNDRV_CTL_ELEM_IFACE_PCM,
@@ -1698,7 +1698,7 @@ static int snd_ensoniq_control_put(struct snd_kcontrol *kcontrol,
  * ENS1370 mixer
  */
 
-static struct snd_kcontrol_new snd_es1370_controls[2] = {
+static const struct snd_kcontrol_new snd_es1370_controls[2] = {
 ENSONIQ_CONTROL("PCM 0 Output also on Line-In Jack", ES_1370_XCTL0),
 ENSONIQ_CONTROL("Mic +5V bias", ES_1370_XCTL1)
 };
diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index 9d5568509387..8336b20fbafc 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -1307,7 +1307,7 @@ static const DECLARE_TLV_DB_RANGE(db_scale_line,
 
 static const DECLARE_TLV_DB_SCALE(db_scale_capture, 0, 150, 0);
 
-static struct snd_kcontrol_new snd_es1938_controls[] = {
+static const struct snd_kcontrol_new snd_es1938_controls[] = {
 ES1938_DOUBLE_TLV("Master Playback Volume", 0, 0x60, 0x62, 0, 0, 63, 0,
 		  db_scale_master),
 ES1938_DOUBLE("Master Playback Switch", 0, 0x60, 0x62, 6, 6, 1, 1),
diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index ae2b413ff489..4117a053eb18 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -969,7 +969,7 @@ static const DECLARE_TLV_DB_SCALE(db_scale_dsp, -3450, 150, 0);
 
 #define FM801_CONTROLS ARRAY_SIZE(snd_fm801_controls)
 
-static struct snd_kcontrol_new snd_fm801_controls[] = {
+static const struct snd_kcontrol_new snd_fm801_controls[] = {
 FM801_DOUBLE_TLV("Wave Playback Volume", FM801_PCM_VOL, 0, 8, 31, 1,
 		 db_scale_dsp),
 FM801_SINGLE("Wave Playback Switch", FM801_PCM_VOL, 15, 1, 1),
@@ -990,7 +990,7 @@ FM801_SINGLE("FM Playback Switch", FM801_FM_VOL, 15, 1, 1),
 
 #define FM801_CONTROLS_MULTI ARRAY_SIZE(snd_fm801_controls_multi)
 
-static struct snd_kcontrol_new snd_fm801_controls_multi[] = {
+static const struct snd_kcontrol_new snd_fm801_controls_multi[] = {
 FM801_SINGLE("AC97 2ch->4ch Copy Switch", FM801_CODEC_CTRL, 7, 1, 0),
 FM801_SINGLE("AC97 18-bit Switch", FM801_CODEC_CTRL, 10, 1, 0),
 FM801_SINGLE(SNDRV_CTL_NAME_IEC958("",CAPTURE,SWITCH), FM801_I2S_MODE, 8, 1, 0),
diff --git a/sound/pci/ice1712/aureon.c b/sound/pci/ice1712/aureon.c
index 4556ba76b791..025fe7820620 100644
--- a/sound/pci/ice1712/aureon.c
+++ b/sound/pci/ice1712/aureon.c
@@ -1389,7 +1389,7 @@ static int aureon_oversampling_put(struct snd_kcontrol *kcontrol, struct snd_ctl
  * mixers
  */
 
-static struct snd_kcontrol_new aureon_dac_controls[] = {
+static const struct snd_kcontrol_new aureon_dac_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "Master Playback Switch",
@@ -1504,7 +1504,7 @@ static struct snd_kcontrol_new aureon_dac_controls[] = {
 	}
 };
 
-static struct snd_kcontrol_new wm_controls[] = {
+static const struct snd_kcontrol_new wm_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "PCM Playback Switch",
@@ -1570,7 +1570,7 @@ static struct snd_kcontrol_new wm_controls[] = {
 	}
 };
 
-static struct snd_kcontrol_new ac97_controls[] = {
+static const struct snd_kcontrol_new ac97_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "AC97 Playback Switch",
@@ -1675,7 +1675,7 @@ static struct snd_kcontrol_new ac97_controls[] = {
 	}
 };
 
-static struct snd_kcontrol_new universe_ac97_controls[] = {
+static const struct snd_kcontrol_new universe_ac97_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "AC97 Playback Switch",
@@ -1807,7 +1807,7 @@ static struct snd_kcontrol_new universe_ac97_controls[] = {
 
 };
 
-static struct snd_kcontrol_new cs8415_controls[] = {
+static const struct snd_kcontrol_new cs8415_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = SNDRV_CTL_NAME_IEC958("", CAPTURE, SWITCH),
diff --git a/sound/pci/ice1712/delta.c b/sound/pci/ice1712/delta.c
index 519c9fbcff1e..81929063b2fa 100644
--- a/sound/pci/ice1712/delta.c
+++ b/sound/pci/ice1712/delta.c
@@ -753,15 +753,15 @@ static int snd_ice1712_delta_init(struct snd_ice1712 *ice)
  * additional controls for M-Audio cards
  */
 
-static struct snd_kcontrol_new snd_ice1712_delta1010_wordclock_select =
+static const struct snd_kcontrol_new snd_ice1712_delta1010_wordclock_select =
 ICE1712_GPIO(SNDRV_CTL_ELEM_IFACE_MIXER, "Word Clock Sync", 0, ICE1712_DELTA_WORD_CLOCK_SELECT, 1, 0);
-static struct snd_kcontrol_new snd_ice1712_delta1010lt_wordclock_select =
+static const struct snd_kcontrol_new snd_ice1712_delta1010lt_wordclock_select =
 ICE1712_GPIO(SNDRV_CTL_ELEM_IFACE_MIXER, "Word Clock Sync", 0, ICE1712_DELTA_1010LT_WORDCLOCK, 0, 0);
-static struct snd_kcontrol_new snd_ice1712_delta1010_wordclock_status =
+static const struct snd_kcontrol_new snd_ice1712_delta1010_wordclock_status =
 ICE1712_GPIO(SNDRV_CTL_ELEM_IFACE_MIXER, "Word Clock Status", 0, ICE1712_DELTA_WORD_CLOCK_STATUS, 1, SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE);
-static struct snd_kcontrol_new snd_ice1712_deltadio2496_spdif_in_select =
+static const struct snd_kcontrol_new snd_ice1712_deltadio2496_spdif_in_select =
 ICE1712_GPIO(SNDRV_CTL_ELEM_IFACE_MIXER, "IEC958 Input Optical", 0, ICE1712_DELTA_SPDIF_INPUT_SELECT, 0, 0);
-static struct snd_kcontrol_new snd_ice1712_delta_spdif_in_status =
+static const struct snd_kcontrol_new snd_ice1712_delta_spdif_in_status =
 ICE1712_GPIO(SNDRV_CTL_ELEM_IFACE_MIXER, "Delta IEC958 Input Status", 0, ICE1712_DELTA_SPDIF_IN_STAT, 1, SNDRV_CTL_ELEM_ACCESS_READ | SNDRV_CTL_ELEM_ACCESS_VOLATILE);
 
 
diff --git a/sound/pci/ice1712/ews.c b/sound/pci/ice1712/ews.c
index fe08dd9f1564..3794308313bf 100644
--- a/sound/pci/ice1712/ews.c
+++ b/sound/pci/ice1712/ews.c
@@ -597,7 +597,7 @@ static int snd_ice1712_ewx_io_sense_put(struct snd_kcontrol *kcontrol, struct sn
 	return val != nval;
 }
 
-static struct snd_kcontrol_new snd_ice1712_ewx2496_controls[] = {
+static const struct snd_kcontrol_new snd_ice1712_ewx2496_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "Input Sensitivity Switch",
@@ -792,7 +792,7 @@ static int snd_ice1712_ews88d_control_put(struct snd_kcontrol *kcontrol, struct
   .private_value = xshift | (xinvert << 8),\
 }
 
-static struct snd_kcontrol_new snd_ice1712_ews88d_controls[] = {
+static const struct snd_kcontrol_new snd_ice1712_ews88d_controls[] = {
 	EWS88D_CONTROL(SNDRV_CTL_ELEM_IFACE_MIXER, "IEC958 Input Optical", 0, 1, 0), /* inverted */
 	EWS88D_CONTROL(SNDRV_CTL_ELEM_IFACE_MIXER, "ADAT Output Optical", 1, 0, 0),
 	EWS88D_CONTROL(SNDRV_CTL_ELEM_IFACE_MIXER, "ADAT External Master Clock", 2, 0, 0),
@@ -928,7 +928,7 @@ static int snd_ice1712_6fire_select_input_put(struct snd_kcontrol *kcontrol, str
   .private_value = xshift | (xinvert << 8),\
 }
 
-static struct snd_kcontrol_new snd_ice1712_6fire_controls[] = {
+static const struct snd_kcontrol_new snd_ice1712_6fire_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "Analog Input Select",
diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 9794bbedffc3..5202e4c06fc4 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -1335,7 +1335,7 @@ static int snd_ice1712_pro_mixer_volume_put(struct snd_kcontrol *kcontrol, struc
 
 static const DECLARE_TLV_DB_SCALE(db_scale_playback, -14400, 150, 0);
 
-static struct snd_kcontrol_new snd_ice1712_multi_playback_ctrls[] = {
+static const struct snd_kcontrol_new snd_ice1712_multi_playback_ctrls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "Multi Playback Switch",
diff --git a/sound/pci/ice1712/juli.c b/sound/pci/ice1712/juli.c
index 0da7e940f264..079e58ec8b09 100644
--- a/sound/pci/ice1712/juli.c
+++ b/sound/pci/ice1712/juli.c
@@ -343,7 +343,7 @@ static int juli_mute_put(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static struct snd_kcontrol_new juli_mute_controls[] = {
+static const struct snd_kcontrol_new juli_mute_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "Master Playback Switch",
diff --git a/sound/pci/ice1712/maya44.c b/sound/pci/ice1712/maya44.c
index 3af5abed1e3c..c2761e009c67 100644
--- a/sound/pci/ice1712/maya44.c
+++ b/sound/pci/ice1712/maya44.c
@@ -424,7 +424,7 @@ static int maya_pb_route_put(struct snd_kcontrol *kcontrol,
  * controls to be added
  */
 
-static struct snd_kcontrol_new maya_controls[] = {
+static const struct snd_kcontrol_new maya_controls[] = {
 	{
 		.name = "Crossmix Playback Volume",
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
diff --git a/sound/pci/ice1712/phase.c b/sound/pci/ice1712/phase.c
index 699051154bf9..ced4a2bfd08e 100644
--- a/sound/pci/ice1712/phase.c
+++ b/sound/pci/ice1712/phase.c
@@ -745,7 +745,7 @@ static int phase28_oversampling_put(struct snd_kcontrol *kcontrol,
 static const DECLARE_TLV_DB_SCALE(db_scale_wm_dac, -12700, 100, 1);
 static const DECLARE_TLV_DB_SCALE(db_scale_wm_pcm, -6400, 50, 1);
 
-static struct snd_kcontrol_new phase28_dac_controls[] = {
+static const struct snd_kcontrol_new phase28_dac_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "Master Playback Switch",
@@ -860,7 +860,7 @@ static struct snd_kcontrol_new phase28_dac_controls[] = {
 	}
 };
 
-static struct snd_kcontrol_new wm_controls[] = {
+static const struct snd_kcontrol_new wm_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "PCM Playback Switch",
diff --git a/sound/pci/ice1712/pontis.c b/sound/pci/ice1712/pontis.c
index 56cbc966d7a9..8ddb6c35a5e6 100644
--- a/sound/pci/ice1712/pontis.c
+++ b/sound/pci/ice1712/pontis.c
@@ -529,7 +529,7 @@ static const DECLARE_TLV_DB_SCALE(db_scale_volume, -6400, 50, 1);
  * mixers
  */
 
-static struct snd_kcontrol_new pontis_controls[] = {
+static const struct snd_kcontrol_new pontis_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.access = (SNDRV_CTL_ELEM_ACCESS_READWRITE |
diff --git a/sound/pci/ice1712/prodigy192.c b/sound/pci/ice1712/prodigy192.c
index 98f8ac658796..105716961e39 100644
--- a/sound/pci/ice1712/prodigy192.c
+++ b/sound/pci/ice1712/prodigy192.c
@@ -346,7 +346,7 @@ static const DECLARE_TLV_DB_SCALE(db_scale_adc, 0, 150, 0);
  * mixers
  */
 
-static struct snd_kcontrol_new stac_controls[] = {
+static const struct snd_kcontrol_new stac_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "Master Playback Switch",
@@ -578,7 +578,7 @@ static int ak4114_input_sw_put(struct snd_kcontrol *kcontrol,
 }
 
 
-static struct snd_kcontrol_new ak4114_controls[] = {
+static const struct snd_kcontrol_new ak4114_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "MIODIO IEC958 Capture Input",
diff --git a/sound/pci/ice1712/prodigy_hifi.c b/sound/pci/ice1712/prodigy_hifi.c
index 9d71e9d5c9a0..ba37f7eab166 100644
--- a/sound/pci/ice1712/prodigy_hifi.c
+++ b/sound/pci/ice1712/prodigy_hifi.c
@@ -284,7 +284,7 @@ static int ak4396_dac_vol_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem
 static const DECLARE_TLV_DB_SCALE(db_scale_wm_dac, -12700, 100, 1);
 static const DECLARE_TLV_DB_LINEAR(ak4396_db_scale, TLV_DB_GAIN_MUTE, 0);
 
-static struct snd_kcontrol_new prodigy_hd2_controls[] = {
+static const struct snd_kcontrol_new prodigy_hd2_controls[] = {
     {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = (SNDRV_CTL_ELEM_ACCESS_READWRITE |
@@ -741,7 +741,7 @@ static int wm_chswap_put(struct snd_kcontrol *kcontrol,
  * mixers
  */
 
-static struct snd_kcontrol_new prodigy_hifi_controls[] = {
+static const struct snd_kcontrol_new prodigy_hifi_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.access = (SNDRV_CTL_ELEM_ACCESS_READWRITE |
diff --git a/sound/pci/ice1712/quartet.c b/sound/pci/ice1712/quartet.c
index 9e2149fd42f8..bfd811a08d90 100644
--- a/sound/pci/ice1712/quartet.c
+++ b/sound/pci/ice1712/quartet.c
@@ -720,7 +720,7 @@ static int qtet_sw_put(struct snd_kcontrol *kcontrol,
 	.put = qtet_sw_put,\
 	.private_value = xpriv }
 
-static struct snd_kcontrol_new qtet_controls[] = {
+static const struct snd_kcontrol_new qtet_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "Master Playback Switch",
diff --git a/sound/pci/ice1712/wtm.c b/sound/pci/ice1712/wtm.c
index 4ca96ec6d687..4a7315ad51e8 100644
--- a/sound/pci/ice1712/wtm.c
+++ b/sound/pci/ice1712/wtm.c
@@ -477,7 +477,7 @@ static const DECLARE_TLV_DB_SCALE(db_scale_adc, 0, 150, 0);
 /*
  * Control tabs
  */
-static struct snd_kcontrol_new stac9640_controls[] = {
+static const struct snd_kcontrol_new stac9640_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.access = (SNDRV_CTL_ELEM_ACCESS_READWRITE |
diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index f605926a0709..685a60551c71 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -2019,7 +2019,7 @@ static int snd_korg1212_control_sync_put(struct snd_kcontrol *kcontrol,
 		.private_value = ord,								\
         }
 
-static struct snd_kcontrol_new snd_korg1212_controls[] = {
+static const struct snd_kcontrol_new snd_korg1212_controls[] = {
         MON_MIXER(8, "Analog"),
 	MON_MIXER(10, "SPDIF"), 
         MON_MIXER(0, "ADAT-1"), MON_MIXER(1, "ADAT-2"), MON_MIXER(2, "ADAT-3"), MON_MIXER(3, "ADAT-4"),
diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 15029b2be233..16d726da74bf 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -1796,7 +1796,7 @@ static int snd_rme32_control_spdif_mask_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static struct snd_kcontrol_new snd_rme32_controls[] = {
+static const struct snd_kcontrol_new snd_rme32_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
 		.name =	SNDRV_CTL_NAME_IEC958("", PLAYBACK, DEFAULT),
diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
index 537381632be7..db576b7e5d5b 100644
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -2253,7 +2253,7 @@ snd_rme96_dac_volume_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_valu
         return change;
 }
 
-static struct snd_kcontrol_new snd_rme96_controls[] = {
+static const struct snd_kcontrol_new snd_rme96_controls[] = {
 {
 	.iface =	SNDRV_CTL_ELEM_IFACE_PCM,
 	.name =		SNDRV_CTL_NAME_IEC958("",PLAYBACK,DEFAULT),
diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index b4c42c4fa201..632f7878ff3e 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -2879,7 +2879,7 @@ static int snd_hdsp_put_dds_offset(struct snd_kcontrol *kcontrol, struct snd_ctl
 	return change;
 }
 
-static struct snd_kcontrol_new snd_hdsp_9632_controls[] = {
+static const struct snd_kcontrol_new snd_hdsp_9632_controls[] = {
 HDSP_DA_GAIN("DA Gain", 0),
 HDSP_AD_GAIN("AD Gain", 0),
 HDSP_PHONE_GAIN("Phones Gain", 0),
@@ -2887,7 +2887,7 @@ HDSP_TOGGLE_SETTING("XLR Breakout Cable", HDSP_XLRBreakoutCable),
 HDSP_DDS_OFFSET("DDS Sample Rate Offset", 0)
 };
 
-static struct snd_kcontrol_new snd_hdsp_controls[] = {
+static const struct snd_kcontrol_new snd_hdsp_controls[] = {
 {
 	.iface =	SNDRV_CTL_ELEM_IFACE_PCM,
 	.name =		SNDRV_CTL_NAME_IEC958("",PLAYBACK,DEFAULT),
@@ -3216,7 +3216,7 @@ static int snd_hdsp_info_rpm_disconnect(struct snd_kcontrol *kcontrol, struct sn
 	return snd_ctl_enum_info(uinfo, 1, 2, texts);
 }
 
-static struct snd_kcontrol_new snd_hdsp_rpm_controls[] = {
+static const struct snd_kcontrol_new snd_hdsp_rpm_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "RPM Bypass",
@@ -3249,7 +3249,7 @@ static struct snd_kcontrol_new snd_hdsp_rpm_controls[] = {
 	HDSP_MIXER("Mixer", 0)
 };
 
-static struct snd_kcontrol_new snd_hdsp_96xx_aeb =
+static const struct snd_kcontrol_new snd_hdsp_96xx_aeb =
 	HDSP_TOGGLE_SETTING("Analog Extension Board",
 			HDSP_AnalogExtensionBoard);
 static struct snd_kcontrol_new snd_hdsp_adat_sync_check = HDSP_ADAT_SYNC_CHECK;
diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 9e3263395f98..f926899e4755 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -4478,7 +4478,7 @@ static int snd_hdspm_put_tco_word_term(struct snd_kcontrol *kcontrol,
 
 
 
-static struct snd_kcontrol_new snd_hdspm_controls_madi[] = {
+static const struct snd_kcontrol_new snd_hdspm_controls_madi[] = {
 	HDSPM_MIXER("Mixer", 0),
 	HDSPM_INTERNAL_CLOCK("Internal Clock", 0),
 	HDSPM_SYSTEM_CLOCK_MODE("System Clock Mode", 0),
@@ -4500,7 +4500,7 @@ static struct snd_kcontrol_new snd_hdspm_controls_madi[] = {
 };
 
 
-static struct snd_kcontrol_new snd_hdspm_controls_madiface[] = {
+static const struct snd_kcontrol_new snd_hdspm_controls_madiface[] = {
 	HDSPM_MIXER("Mixer", 0),
 	HDSPM_INTERNAL_CLOCK("Internal Clock", 0),
 	HDSPM_SYSTEM_CLOCK_MODE("System Clock Mode", 0),
@@ -4513,7 +4513,7 @@ static struct snd_kcontrol_new snd_hdspm_controls_madiface[] = {
 	HDSPM_MADI_SPEEDMODE("MADI Speed Mode", 0)
 };
 
-static struct snd_kcontrol_new snd_hdspm_controls_aio[] = {
+static const struct snd_kcontrol_new snd_hdspm_controls_aio[] = {
 	HDSPM_MIXER("Mixer", 0),
 	HDSPM_INTERNAL_CLOCK("Internal Clock", 0),
 	HDSPM_SYSTEM_CLOCK_MODE("System Clock Mode", 0),
@@ -4554,7 +4554,7 @@ static struct snd_kcontrol_new snd_hdspm_controls_aio[] = {
 		   */
 };
 
-static struct snd_kcontrol_new snd_hdspm_controls_raydat[] = {
+static const struct snd_kcontrol_new snd_hdspm_controls_raydat[] = {
 	HDSPM_MIXER("Mixer", 0),
 	HDSPM_INTERNAL_CLOCK("Internal Clock", 0),
 	HDSPM_SYSTEM_CLOCK_MODE("Clock Mode", 0),
@@ -4582,7 +4582,7 @@ static struct snd_kcontrol_new snd_hdspm_controls_raydat[] = {
 	HDSPM_TOGGLE_SETTING("Single Speed WordClock Out", HDSPM_c0_Wck48)
 };
 
-static struct snd_kcontrol_new snd_hdspm_controls_aes32[] = {
+static const struct snd_kcontrol_new snd_hdspm_controls_aes32[] = {
 	HDSPM_MIXER("Mixer", 0),
 	HDSPM_INTERNAL_CLOCK("Internal Clock", 0),
 	HDSPM_SYSTEM_CLOCK_MODE("System Clock Mode", 0),
@@ -4624,7 +4624,7 @@ static struct snd_kcontrol_new snd_hdspm_controls_aes32[] = {
 
 
 /* Control elements for the optional TCO module */
-static struct snd_kcontrol_new snd_hdspm_controls_tco[] = {
+static const struct snd_kcontrol_new snd_hdspm_controls_tco[] = {
 	HDSPM_TCO_SAMPLE_RATE("TCO Sample Rate", 0),
 	HDSPM_TCO_PULL("TCO Pull", 0),
 	HDSPM_TCO_WCK_CONVERSION("TCO WCK Conversion", 0),
@@ -4671,7 +4671,7 @@ static int snd_hdspm_create_controls(struct snd_card *card,
 	unsigned int idx, limit;
 	int err;
 	struct snd_kcontrol *kctl;
-	struct snd_kcontrol_new *list = NULL;
+	const struct snd_kcontrol_new *list = NULL;
 
 	switch (hdspm->io_type) {
 	case MADI:
diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index 6fda027d28a4..2cb5b03f84d3 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -1454,7 +1454,7 @@ static int snd_rme9652_get_tc_value(void *private_data,
 
 #endif				/* ALSA_HAS_STANDARD_WAY_OF_RETURNING_TIMECODE */
 
-static struct snd_kcontrol_new snd_rme9652_controls[] = {
+static const struct snd_kcontrol_new snd_rme9652_controls[] = {
 {
 	.iface =	SNDRV_CTL_ELEM_IFACE_PCM,
 	.name =		SNDRV_CTL_NAME_IEC958("",PLAYBACK,DEFAULT),
@@ -1509,10 +1509,10 @@ RME9652_TC_VALID("Timecode Valid", 0),
 RME9652_PASSTHRU("Passthru", 0)
 };
 
-static struct snd_kcontrol_new snd_rme9652_adat3_check =
+static const struct snd_kcontrol_new snd_rme9652_adat3_check =
 RME9652_ADAT_SYNC("ADAT3 Sync Check", 0, 2);
 
-static struct snd_kcontrol_new snd_rme9652_adat1_input =
+static const struct snd_kcontrol_new snd_rme9652_adat1_input =
 RME9652_ADAT1_IN("ADAT1 Input Source", 0);
 
 static int snd_rme9652_create_controls(struct snd_card *card, struct snd_rme9652 *rme9652)
diff --git a/sound/pci/sonicvibes.c b/sound/pci/sonicvibes.c
index dcdf5a534c4e..ecdd54d7a4e1 100644
--- a/sound/pci/sonicvibes.c
+++ b/sound/pci/sonicvibes.c
@@ -1050,7 +1050,7 @@ static int snd_sonicvibes_put_double(struct snd_kcontrol *kcontrol, struct snd_c
 	return change;
 }
 
-static struct snd_kcontrol_new snd_sonicvibes_controls[] = {
+static const struct snd_kcontrol_new snd_sonicvibes_controls[] = {
 SONICVIBES_DOUBLE("Capture Volume", 0, SV_IREG_LEFT_ADC, SV_IREG_RIGHT_ADC, 0, 0, 15, 0),
 SONICVIBES_DOUBLE("Aux Playback Switch", 0, SV_IREG_LEFT_AUX1, SV_IREG_RIGHT_AUX1, 7, 7, 1, 1),
 SONICVIBES_DOUBLE("Aux Playback Volume", 0, SV_IREG_LEFT_AUX1, SV_IREG_RIGHT_AUX1, 0, 0, 31, 1),
@@ -1149,7 +1149,7 @@ static void snd_sonicvibes_proc_init(struct sonicvibes *sonic)
  */
 
 #ifdef SUPPORT_JOYSTICK
-static struct snd_kcontrol_new snd_sonicvibes_game_control =
+static const struct snd_kcontrol_new snd_sonicvibes_game_control =
 SONICVIBES_SINGLE("Joystick Speed", 0, SV_IREG_GAME_PORT, 1, 15, 0);
 
 static int snd_sonicvibes_create_gameport(struct sonicvibes *sonic)
@@ -1375,7 +1375,7 @@ static int snd_sonicvibes_create(struct snd_card *card,
  *  MIDI section
  */
 
-static struct snd_kcontrol_new snd_sonicvibes_midi_controls[] = {
+static const struct snd_kcontrol_new snd_sonicvibes_midi_controls[] = {
 SONICVIBES_SINGLE("SonicVibes Wave Source RAM", 0, SV_IREG_WAVE_SOURCE, 0, 1, 0),
 SONICVIBES_SINGLE("SonicVibes Wave Source RAM+ROM", 0, SV_IREG_WAVE_SOURCE, 1, 1, 0),
 SONICVIBES_SINGLE("SonicVibes Onboard Synth", 0, SV_IREG_MPU401, 0, 1, 0),
diff --git a/sound/pci/ymfpci/ymfpci_main.c b/sound/pci/ymfpci/ymfpci_main.c
index a531f4d2605d..1cffd988b616 100644
--- a/sound/pci/ymfpci/ymfpci_main.c
+++ b/sound/pci/ymfpci/ymfpci_main.c
@@ -1588,7 +1588,7 @@ static const struct snd_kcontrol_new snd_ymfpci_dup4ch = {
 	.put = snd_ymfpci_put_dup4ch,
 };
 
-static struct snd_kcontrol_new snd_ymfpci_controls[] = {
+static const struct snd_kcontrol_new snd_ymfpci_controls[] = {
 {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Wave Playback Volume",
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
