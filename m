Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 557B02C01C7
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 09:57:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAB771657;
	Mon, 23 Nov 2020 09:56:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAB771657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606121841;
	bh=3G+gs1B9J3zSMze+zPyR6fDqiHVdOC9Snzva+H2kqYA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iSmq4kaFTdl2/KQS0VdFWPHFWI6MqqQA9ZpHS/ItSTZakaqXZv2HTeGSqm0UvFlZj
	 dHpdhkl9GGQAGcgHFRzIGLf1BI3aZz0RSCK32H4iEu5ASDDMPaL0xJdcr1H7bx4uDD
	 jZ9HhkxOFsx+aIMGWP8436wtmD8N1wnQzlYqGLDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27B57F8051E;
	Mon, 23 Nov 2020 09:54:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DE30F80517; Mon, 23 Nov 2020 09:54:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A16ADF8015B
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:53:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A16ADF8015B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 00DF5AF86;
 Mon, 23 Nov 2020 08:53:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/41] ALSA: usb-audio: Check valid altsetting at parsing
 rates for UAC2/3
Date: Mon, 23 Nov 2020 09:53:09 +0100
Message-Id: <20201123085347.19667-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201123085347.19667-1-tiwai@suse.de>
References: <20201123085347.19667-1-tiwai@suse.de>
Cc: Matwey Kornilov <matwey.kornilov@gmail.com>,
 Dylan Robinson <dylan_robinson@motu.com>,
 Keith Milner <kamilner@superlative.org>
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

The current driver code assumes blindly that all found sample rates for
the same endpoint from the UAC2 and UAC3 descriptors can be used no
matter which altsetting, but actually this was wrong: some devices
accept only limited sample rates in each altsetting.  For determining
which altsetting supports which rate, we need to verify each sample rate
and check the validity via UAC2_AS_VAL_ALT_SETTINGS.  This control
reports back the available altsettings as a bitmap.

This patch implements the missing piece above, the verification and
reconstructs the sample rate tables based on the result.

An open question is how to deal with the altsettings that ended up
with no valid sample rates after verification.  At least, there is a
device that showed this problem although the sample rates did work in
the later usage (see bug link).  For now, we accept such an altset as
is, assuming that it's a firmware bug.

Reported-by: Dylan Robinson <dylan_robinson@motu.com>
Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1178203
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/clock.c  | 106 ++++++++++++++++++++++++++++++-----------------------
 sound/usb/clock.h  |   4 ++
 sound/usb/format.c |  93 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 158 insertions(+), 45 deletions(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index f3ca59005d91..f174230d07d5 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -560,16 +560,60 @@ static int get_sample_rate_v2v3(struct snd_usb_audio *chip, int iface,
 	return le32_to_cpu(data);
 }
 
+/*
+ * Try to set the given sample rate:
+ *
+ * Return 0 if the clock source is read-only, the actual rate on success,
+ * or a negative error code.
+ *
+ * This function gets called from format.c to validate each sample rate, too.
+ * Hence no message is shown upon error
+ */
+int snd_usb_set_sample_rate_v2v3(struct snd_usb_audio *chip,
+				 const struct audioformat *fmt,
+				 int clock, int rate)
+{
+	bool writeable;
+	u32 bmControls;
+	__le32 data;
+	int err;
+
+	if (fmt->protocol == UAC_VERSION_3) {
+		struct uac3_clock_source_descriptor *cs_desc;
+
+		cs_desc = snd_usb_find_clock_source_v3(chip->ctrl_intf, clock);
+		bmControls = le32_to_cpu(cs_desc->bmControls);
+	} else {
+		struct uac_clock_source_descriptor *cs_desc;
+
+		cs_desc = snd_usb_find_clock_source(chip->ctrl_intf, clock);
+		bmControls = cs_desc->bmControls;
+	}
+
+	writeable = uac_v2v3_control_is_writeable(bmControls,
+						  UAC2_CS_CONTROL_SAM_FREQ);
+	if (!writeable)
+		return 0;
+
+	data = cpu_to_le32(rate);
+	err = snd_usb_ctl_msg(chip->dev, usb_sndctrlpipe(chip->dev, 0), UAC2_CS_CUR,
+			      USB_TYPE_CLASS | USB_RECIP_INTERFACE | USB_DIR_OUT,
+			      UAC2_CS_CONTROL_SAM_FREQ << 8,
+			      snd_usb_ctrl_intf(chip) | (clock << 8),
+			      &data, sizeof(data));
+	if (err < 0)
+		return err;
+
+	return get_sample_rate_v2v3(chip, fmt->iface, fmt->altsetting, clock);
+}
+
 static int set_sample_rate_v2v3(struct snd_usb_audio *chip, int iface,
-			      struct usb_host_interface *alts,
-			      struct audioformat *fmt, int rate)
+				struct usb_host_interface *alts,
+				struct audioformat *fmt, int rate)
 {
 	struct usb_device *dev = chip->dev;
-	__le32 data;
-	int err, cur_rate, prev_rate;
+	int cur_rate, prev_rate;
 	int clock;
-	bool writeable;
-	u32 bmControls;
 
 	/* First, try to find a valid clock. This may trigger
 	 * automatic clock selection if the current clock is not
@@ -592,50 +636,22 @@ static int set_sample_rate_v2v3(struct snd_usb_audio *chip, int iface,
 	if (prev_rate == rate)
 		goto validation;
 
-	if (fmt->protocol == UAC_VERSION_3) {
-		struct uac3_clock_source_descriptor *cs_desc;
-
-		cs_desc = snd_usb_find_clock_source_v3(chip->ctrl_intf, clock);
-		bmControls = le32_to_cpu(cs_desc->bmControls);
-	} else {
-		struct uac_clock_source_descriptor *cs_desc;
-
-		cs_desc = snd_usb_find_clock_source(chip->ctrl_intf, clock);
-		bmControls = cs_desc->bmControls;
+	cur_rate = snd_usb_set_sample_rate_v2v3(chip, fmt, clock, rate);
+	if (cur_rate < 0) {
+		usb_audio_err(chip,
+			      "%d:%d: cannot set freq %d (v2/v3): err %d\n",
+			      iface, fmt->altsetting, rate, cur_rate);
+		return cur_rate;
 	}
 
-	writeable = uac_v2v3_control_is_writeable(bmControls,
-						  UAC2_CS_CONTROL_SAM_FREQ);
-	if (writeable) {
-		data = cpu_to_le32(rate);
-		err = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), UAC2_CS_CUR,
-				      USB_TYPE_CLASS | USB_RECIP_INTERFACE | USB_DIR_OUT,
-				      UAC2_CS_CONTROL_SAM_FREQ << 8,
-				      snd_usb_ctrl_intf(chip) | (clock << 8),
-				      &data, sizeof(data));
-		if (err < 0) {
-			usb_audio_err(chip,
-				"%d:%d: cannot set freq %d (v2/v3): err %d\n",
-				iface, fmt->altsetting, rate, err);
-			return err;
-		}
-
-		cur_rate = get_sample_rate_v2v3(chip, iface,
-						fmt->altsetting, clock);
-	} else {
+	if (!cur_rate)
 		cur_rate = prev_rate;
-	}
 
 	if (cur_rate != rate) {
-		if (!writeable) {
-			usb_audio_warn(chip,
-				 "%d:%d: freq mismatch (RO clock): req %d, clock runs @%d\n",
-				 iface, fmt->altsetting, rate, cur_rate);
-			return -ENXIO;
-		}
-		usb_audio_dbg(chip,
-			"current rate %d is different from the runtime rate %d\n",
-			cur_rate, rate);
+		usb_audio_warn(chip,
+			       "%d:%d: freq mismatch (RO clock): req %d, clock runs @%d\n",
+			       fmt->iface, fmt->altsetting, rate, cur_rate);
+		return -ENXIO;
 	}
 
 	/* Some devices doesn't respond to sample rate changes while the
diff --git a/sound/usb/clock.h b/sound/usb/clock.h
index 68df0fbe09d0..97597f5a3c18 100644
--- a/sound/usb/clock.h
+++ b/sound/usb/clock.h
@@ -9,4 +9,8 @@ int snd_usb_init_sample_rate(struct snd_usb_audio *chip, int iface,
 int snd_usb_clock_find_source(struct snd_usb_audio *chip,
 			      struct audioformat *fmt, bool validate);
 
+int snd_usb_set_sample_rate_v2v3(struct snd_usb_audio *chip,
+				 const struct audioformat *fmt,
+				 int clock, int rate);
+
 #endif /* __USBAUDIO_CLOCK_H */
diff --git a/sound/usb/format.c b/sound/usb/format.c
index 3bfead393aa3..3348032daa16 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -417,6 +417,97 @@ static int line6_parse_audio_format_rates_quirk(struct snd_usb_audio *chip,
 	return -ENODEV;
 }
 
+/* check whether the given altsetting is supported for the already set rate */
+static bool check_valid_altsetting_v2v3(struct snd_usb_audio *chip, int iface,
+					int altsetting)
+{
+	struct usb_device *dev = chip->dev;
+	__le64 raw_data = 0;
+	u64 data;
+	int err;
+
+	/* we assume 64bit is enough for any altsettings */
+	if (snd_BUG_ON(altsetting >= 64 - 8))
+		return false;
+
+	err = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0), UAC2_CS_CUR,
+			      USB_TYPE_CLASS | USB_RECIP_INTERFACE | USB_DIR_IN,
+			      UAC2_AS_VAL_ALT_SETTINGS << 8,
+			      iface, &raw_data, sizeof(raw_data));
+	if (err < 0)
+		return false;
+
+	data = le64_to_cpu(raw_data);
+	/* first byte contains the bitmap size */
+	if ((data & 0xff) * 8 < altsetting)
+		return false;
+	if (data & (1ULL << (altsetting + 8)))
+		return true;
+
+	return false;
+}
+
+/*
+ * Validate each sample rate with the altsetting
+ * Rebuild the rate table if only partial values are valid
+ */
+static int validate_sample_rate_table_v2v3(struct snd_usb_audio *chip,
+					   struct audioformat *fp,
+					   int clock)
+{
+	struct usb_device *dev = chip->dev;
+	unsigned int *table;
+	unsigned int nr_rates;
+	unsigned int rate_min = 0x7fffffff;
+	unsigned int rate_max = 0;
+	unsigned int rates = 0;
+	int i, err;
+
+	table = kcalloc(fp->nr_rates, sizeof(*table), GFP_KERNEL);
+	if (!table)
+		return -ENOMEM;
+
+	/* clear the interface altsetting at first */
+	usb_set_interface(dev, fp->iface, 0);
+
+	nr_rates = 0;
+	for (i = 0; i < fp->nr_rates; i++) {
+		err = snd_usb_set_sample_rate_v2v3(chip, fp, clock,
+						   fp->rate_table[i]);
+		if (err < 0)
+			continue;
+
+		if (check_valid_altsetting_v2v3(chip, fp->iface, fp->altsetting)) {
+			table[nr_rates++] = fp->rate_table[i];
+			if (rate_min > fp->rate_table[i])
+				rate_min = fp->rate_table[i];
+			if (rate_max < fp->rate_table[i])
+				rate_max = fp->rate_table[i];
+			rates |= snd_pcm_rate_to_rate_bit(fp->rate_table[i]);
+		}
+	}
+
+	if (!nr_rates) {
+		usb_audio_dbg(chip,
+			      "No valid sample rate available for %d:%d, assuming a firmware bug\n",
+			      fp->iface, fp->altsetting);
+		nr_rates = fp->nr_rates; /* continue as is */
+	}
+
+	if (fp->nr_rates == nr_rates) {
+		kfree(table);
+		return 0;
+	}
+
+	kfree(fp->rate_table);
+	fp->rate_table = table;
+	fp->nr_rates = nr_rates;
+	fp->rate_min = rate_min;
+	fp->rate_max = rate_max;
+	fp->rates = rates;
+	return 0;
+}
+
 /*
  * parse the format descriptor and stores the possible sample rates
  * on the audioformat table (audio class v2 and v3).
@@ -509,6 +600,8 @@ static int parse_audio_format_rates_v2v3(struct snd_usb_audio *chip,
 	 * allocated, so the rates will be stored */
 	parse_uac2_sample_rate_range(chip, fp, nr_triplets, data);
 
+	ret = validate_sample_rate_table_v2v3(chip, fp, clock);
+
 err_free:
 	kfree(data);
 err:
-- 
2.16.4

