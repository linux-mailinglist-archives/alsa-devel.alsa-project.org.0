Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 882E813087C
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 15:58:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2018917B2;
	Sun,  5 Jan 2020 15:57:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2018917B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236300;
	bh=ccccHVtIm56mAsnDrwTQUxmTz8JQa0pDaQPSWeaawUQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MHn2lEEF9Orb1un7I7tx6+1U98zNW0DdJFc3lGBUwqW7mXbcOtfVjk4WZtC4Vv7DA
	 /0XwZIOW1fs8GolbWh0UPJvJh7Jxvdsg4XS1g66UABtLTRvZRA8E1LlgRfqTgm4HLC
	 LRIdVmC4VbG4V8bgCviIyT3yDB5JpIKDtK1hS9sk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FD8FF8027D;
	Sun,  5 Jan 2020 15:49:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2870AF8032A; Sun,  5 Jan 2020 15:48:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9E6FF8026F
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9E6FF8026F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0459DB191
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:24 +0100
Message-Id: <20200105144823.29547-10-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 09/68] ALSA: hda: More constifications
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

Apply const prefix to the remaining possible places: the string
tables, the rate tables, the verb tables, the index tables, etc.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/hdac_device.c      |  4 ++--
 sound/hda/hdmi_chmap.c       |  2 +-
 sound/hda/intel-nhlt.c       |  2 +-
 sound/pci/hda/hda_codec.c    |  6 +++---
 sound/pci/hda/hda_eld.c      |  6 +++---
 sound/pci/hda/hda_intel.c    |  8 ++++----
 sound/pci/hda/hda_proc.c     |  2 +-
 sound/pci/hda/hda_sysfs.c    |  2 +-
 sound/pci/hda/patch_analog.c |  2 +-
 sound/pci/hda/patch_ca0132.c | 18 +++++++++---------
 10 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index 9f3e37511408..b4f8725f5ddf 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -637,7 +637,7 @@ struct hda_vendor_id {
 	const char *name;
 };
 
-static struct hda_vendor_id hda_vendor_ids[] = {
+static const struct hda_vendor_id hda_vendor_ids[] = {
 	{ 0x1002, "ATI" },
 	{ 0x1013, "Cirrus Logic" },
 	{ 0x1057, "Motorola" },
@@ -692,7 +692,7 @@ struct hda_rate_tbl {
 	(AC_FMT_BASE_##base##K | (((mult) - 1) << AC_FMT_MULT_SHIFT) | \
 	 (((div) - 1) << AC_FMT_DIV_SHIFT))
 
-static struct hda_rate_tbl rate_bits[] = {
+static const struct hda_rate_tbl rate_bits[] = {
 	/* rate in Hz, ALSA rate bitmask, HDA format value */
 
 	/* autodetected value used in snd_hda_query_supported_pcm */
diff --git a/sound/hda/hdmi_chmap.c b/sound/hda/hdmi_chmap.c
index 886cb7811bd6..5fd6d575e123 100644
--- a/sound/hda/hdmi_chmap.c
+++ b/sound/hda/hdmi_chmap.c
@@ -59,7 +59,7 @@ static const char * const cea_speaker_allocation_names[] = {
 /*
  * ELD SA bits in the CEA Speaker Allocation data block
  */
-static int eld_speaker_allocation_bits[] = {
+static const int eld_speaker_allocation_bits[] = {
 	[0] = FL | FR,
 	[1] = LFE,
 	[2] = FC,
diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index 097ff6c10099..99a23fe7fab9 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -7,7 +7,7 @@
 #define NHLT_ACPI_HEADER_SIG	"NHLT"
 
 /* Unique identification for getting NHLT blobs */
-static guid_t osc_guid =
+static const guid_t osc_guid =
 	GUID_INIT(0xA69F886E, 0x6CEB, 0x4594,
 		  0xA4, 0x1F, 0x7B, 0x5D, 0xCE, 0x24, 0xC5, 0x53);
 
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index d039eeec080f..4377b2aba835 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -3201,7 +3201,7 @@ static int get_empty_pcm_device(struct hda_bus *bus, unsigned int type)
 	/* assigned to static slots up to dev#10; if more needed, assign
 	 * the later slot dynamically (when CONFIG_SND_DYNAMIC_MINORS=y)
 	 */
-	static int audio_idx[HDA_PCM_NTYPES][5] = {
+	static const int audio_idx[HDA_PCM_NTYPES][5] = {
 		[HDA_PCM_TYPE_AUDIO] = { 0, 2, 4, 5, -1 },
 		[HDA_PCM_TYPE_SPDIF] = { 1, -1 },
 		[HDA_PCM_TYPE_HDMI]  = { 3, 7, 8, 9, -1 },
@@ -3869,7 +3869,7 @@ EXPORT_SYMBOL_GPL(snd_hda_get_default_vref);
 unsigned int snd_hda_correct_pin_ctl(struct hda_codec *codec,
 				     hda_nid_t pin, unsigned int val)
 {
-	static unsigned int cap_lists[][2] = {
+	static const unsigned int cap_lists[][2] = {
 		{ AC_PINCTL_VREF_100, AC_PINCAP_VREF_100 },
 		{ AC_PINCTL_VREF_80, AC_PINCAP_VREF_80 },
 		{ AC_PINCTL_VREF_50, AC_PINCAP_VREF_50 },
@@ -4014,7 +4014,7 @@ void snd_hda_bus_reset_codecs(struct hda_bus *bus)
  */
 void snd_print_pcm_bits(int pcm, char *buf, int buflen)
 {
-	static unsigned int bits[] = { 8, 16, 20, 24, 32 };
+	static const unsigned int bits[] = { 8, 16, 20, 24, 32 };
 	int i, j;
 
 	for (i = 0, j = 0; i < ARRAY_SIZE(bits); i++)
diff --git a/sound/pci/hda/hda_eld.c b/sound/pci/hda/hda_eld.c
index d081fb2880a0..bb46c89b7f63 100644
--- a/sound/pci/hda/hda_eld.c
+++ b/sound/pci/hda/hda_eld.c
@@ -98,7 +98,7 @@ static const char * const cea_audio_coding_type_names[] = {
 /*
  * SS1:SS0 index => sample size
  */
-static int cea_sample_sizes[4] = {
+static const int cea_sample_sizes[4] = {
 	0,	 		/* 0: Refer to Stream Header */
 	AC_SUPPCM_BITS_16,	/* 1: 16 bits */
 	AC_SUPPCM_BITS_20,	/* 2: 20 bits */
@@ -108,7 +108,7 @@ static int cea_sample_sizes[4] = {
 /*
  * SF2:SF1:SF0 index => sampling frequency
  */
-static int cea_sampling_frequencies[8] = {
+static const int cea_sampling_frequencies[8] = {
 	0,			/* 0: Refer to Stream Header */
 	SNDRV_PCM_RATE_32000,	/* 1:  32000Hz */
 	SNDRV_PCM_RATE_44100,	/* 2:  44100Hz */
@@ -352,7 +352,7 @@ int snd_hdmi_get_eld(struct hda_codec *codec, hda_nid_t nid,
  */
 static void hdmi_print_pcm_rates(int pcm, char *buf, int buflen)
 {
-	static unsigned int alsa_rates[] = {
+	static const unsigned int alsa_rates[] = {
 		5512, 8000, 11025, 16000, 22050, 32000, 44100, 48000, 64000,
 		88200, 96000, 176400, 192000, 384000
 	};
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 49f1638969e3..617143a44a10 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -372,7 +372,7 @@ enum {
 
 #define IS_BXT(pci) ((pci)->vendor == 0x8086 && (pci)->device == 0x5a98)
 
-static char *driver_short_names[] = {
+static const char * const driver_short_names[] = {
 	[AZX_DRIVER_ICH] = "HDA Intel",
 	[AZX_DRIVER_PCH] = "HDA Intel PCH",
 	[AZX_DRIVER_SCH] = "HDA Intel MID",
@@ -499,7 +499,7 @@ static void bxt_reduce_dma_latency(struct azx *chip)
 static int intel_get_lctl_scf(struct azx *chip)
 {
 	struct hdac_bus *bus = azx_bus(chip);
-	static int preferred_bits[] = { 2, 3, 1, 4, 5 };
+	static const int preferred_bits[] = { 2, 3, 1, 4, 5 };
 	u32 val, t;
 	int i;
 
@@ -1564,7 +1564,7 @@ static int check_position_fix(struct azx *chip, int fix)
 
 static void assign_position_fix(struct azx *chip, int fix)
 {
-	static azx_get_pos_callback_t callbacks[] = {
+	static const azx_get_pos_callback_t callbacks[] = {
 		[POS_FIX_AUTO] = NULL,
 		[POS_FIX_LPIB] = azx_get_pos_lpib,
 		[POS_FIX_POSBUF] = azx_get_pos_posbuf,
@@ -2231,7 +2231,7 @@ static void set_default_power_save(struct azx *chip)
 }
 
 /* number of codec slots for each chipset: 0 = default slots (i.e. 4) */
-static unsigned int azx_max_codecs[AZX_NUM_DRIVERS] = {
+static const unsigned int azx_max_codecs[AZX_NUM_DRIVERS] = {
 	[AZX_DRIVER_NVIDIA] = 8,
 	[AZX_DRIVER_TERA] = 1,
 };
diff --git a/sound/pci/hda/hda_proc.c b/sound/pci/hda/hda_proc.c
index 468836c65445..0631f31ef87f 100644
--- a/sound/pci/hda/hda_proc.c
+++ b/sound/pci/hda/hda_proc.c
@@ -160,7 +160,7 @@ static void print_amp_vals(struct snd_info_buffer *buffer,
 
 static void print_pcm_rates(struct snd_info_buffer *buffer, unsigned int pcm)
 {
-	static unsigned int rates[] = {
+	static const unsigned int rates[] = {
 		8000, 11025, 16000, 22050, 32000, 44100, 48000, 88200,
 		96000, 176400, 192000, 384000
 	};
diff --git a/sound/pci/hda/hda_sysfs.c b/sound/pci/hda/hda_sysfs.c
index fcc34417cbce..0607ed5d1959 100644
--- a/sound/pci/hda/hda_sysfs.c
+++ b/sound/pci/hda/hda_sysfs.c
@@ -611,7 +611,7 @@ struct hda_patch_item {
 	void (*parser)(char *buf, struct hda_bus *bus, struct hda_codec **retc);
 };
 
-static struct hda_patch_item patch_items[NUM_LINE_MODES] = {
+static const struct hda_patch_item patch_items[NUM_LINE_MODES] = {
 	[LINE_MODE_CODEC] = {
 		.tag = "[codec]",
 		.parser = parse_codec_mode,
diff --git a/sound/pci/hda/patch_analog.c b/sound/pci/hda/patch_analog.c
index c64895f99299..88c46b051d14 100644
--- a/sound/pci/hda/patch_analog.c
+++ b/sound/pci/hda/patch_analog.c
@@ -812,7 +812,7 @@ static int ad1988_add_spdif_mux_ctl(struct hda_codec *codec)
 	/* we create four static faked paths, since AD codecs have odd
 	 * widget connections regarding the SPDIF out source
 	 */
-	static struct nid_path fake_paths[4] = {
+	static const struct nid_path fake_paths[4] = {
 		{
 			.depth = 3,
 			.path = { 0x02, 0x1d, 0x1b },
diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 250534f90ce0..46e105244ad3 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -3768,7 +3768,7 @@ static const unsigned int float_xbass_xover_lookup[] = {
 /* The following are for tuning of products */
 #ifdef ENABLE_TUNING_CONTROLS
 
-static unsigned int voice_focus_vals_lookup[] = {
+static const unsigned int voice_focus_vals_lookup[] = {
 0x41A00000, 0x41A80000, 0x41B00000, 0x41B80000, 0x41C00000, 0x41C80000,
 0x41D00000, 0x41D80000, 0x41E00000, 0x41E80000, 0x41F00000, 0x41F80000,
 0x42000000, 0x42040000, 0x42080000, 0x420C0000, 0x42100000, 0x42140000,
@@ -3798,7 +3798,7 @@ static unsigned int voice_focus_vals_lookup[] = {
 0x43300000, 0x43310000, 0x43320000, 0x43330000, 0x43340000
 };
 
-static unsigned int mic_svm_vals_lookup[] = {
+static const unsigned int mic_svm_vals_lookup[] = {
 0x00000000, 0x3C23D70A, 0x3CA3D70A, 0x3CF5C28F, 0x3D23D70A, 0x3D4CCCCD,
 0x3D75C28F, 0x3D8F5C29, 0x3DA3D70A, 0x3DB851EC, 0x3DCCCCCD, 0x3DE147AE,
 0x3DF5C28F, 0x3E051EB8, 0x3E0F5C29, 0x3E19999A, 0x3E23D70A, 0x3E2E147B,
@@ -3818,7 +3818,7 @@ static unsigned int mic_svm_vals_lookup[] = {
 0x3F75C28F, 0x3F7851EC, 0x3F7AE148, 0x3F7D70A4, 0x3F800000
 };
 
-static unsigned int equalizer_vals_lookup[] = {
+static const unsigned int equalizer_vals_lookup[] = {
 0xC1C00000, 0xC1B80000, 0xC1B00000, 0xC1A80000, 0xC1A00000, 0xC1980000,
 0xC1900000, 0xC1880000, 0xC1800000, 0xC1700000, 0xC1600000, 0xC1500000,
 0xC1400000, 0xC1300000, 0xC1200000, 0xC1100000, 0xC1000000, 0xC0E00000,
@@ -3831,7 +3831,7 @@ static unsigned int equalizer_vals_lookup[] = {
 };
 
 static int tuning_ctl_set(struct hda_codec *codec, hda_nid_t nid,
-			  unsigned int *lookup, int idx)
+			  const unsigned int *lookup, int idx)
 {
 	int i = 0;
 
@@ -7642,14 +7642,14 @@ static void ca0132_init_unsol(struct hda_codec *codec)
  */
 
 /* Sends before DSP download. */
-static struct hda_verb ca0132_base_init_verbs[] = {
+static const struct hda_verb ca0132_base_init_verbs[] = {
 	/*enable ct extension*/
 	{0x15, VENDOR_CHIPIO_CT_EXTENSIONS_ENABLE, 0x1},
 	{}
 };
 
 /* Send at exit. */
-static struct hda_verb ca0132_base_exit_verbs[] = {
+static const struct hda_verb ca0132_base_exit_verbs[] = {
 	/*set afg to D3*/
 	{0x01, AC_VERB_SET_POWER_STATE, 0x03},
 	/*disable ct extension*/
@@ -7659,7 +7659,7 @@ static struct hda_verb ca0132_base_exit_verbs[] = {
 
 /* Other verbs tables. Sends after DSP download. */
 
-static struct hda_verb ca0132_init_verbs0[] = {
+static const struct hda_verb ca0132_init_verbs0[] = {
 	/* chip init verbs */
 	{0x15, 0x70D, 0xF0},
 	{0x15, 0x70E, 0xFE},
@@ -7692,7 +7692,7 @@ static struct hda_verb ca0132_init_verbs0[] = {
 };
 
 /* Extra init verbs for desktop cards. */
-static struct hda_verb ca0132_init_verbs1[] = {
+static const struct hda_verb ca0132_init_verbs1[] = {
 	{0x15, 0x70D, 0x20},
 	{0x15, 0x70E, 0x19},
 	{0x15, 0x707, 0x00},
@@ -8869,7 +8869,7 @@ static int patch_ca0132(struct hda_codec *codec)
 /*
  * patch entries
  */
-static struct hda_device_id snd_hda_id_ca0132[] = {
+static const struct hda_device_id snd_hda_id_ca0132[] = {
 	HDA_CODEC_ENTRY(0x11020011, "CA0132", patch_ca0132),
 	{} /* terminator */
 };
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
