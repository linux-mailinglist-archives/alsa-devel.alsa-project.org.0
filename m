Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B29BDFC03F
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 07:38:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 281A41669;
	Thu, 14 Nov 2019 07:37:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 281A41669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573713487;
	bh=dg8H3gBzeW+/XvRTMLGp7VTCUf2fieSxdHA8Ythz86k=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oRSLcI2hacM8Juv3ZYgEH9MKXnbAnfT5MTYstq+3WdJvoW9zgXEX3aYYSuAHF5wqf
	 epAO8PgVKZzY3KrgAHCxUPgDeIXfwIWMI7fG/9sQHAxI2rM22+YtMtIQHJSCTSyjpi
	 CJFiulqBAfm7YIXUKigXlNjBEOGQ+M/euVT/EIl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1748F8010B;
	Thu, 14 Nov 2019 07:34:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE395F800EC; Thu, 14 Nov 2019 04:37:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93E6FF800CD
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 04:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93E6FF800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="jxjP5Zm6"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcccc070000>; Wed, 13 Nov 2019 19:37:44 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 19:37:41 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 13 Nov 2019 19:37:41 -0800
Received: from nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 14 Nov 2019 03:37:37 +0000
From: Nikhil Mahale <nmahale@nvidia.com>
To: <tiwai@suse.com>
Date: Thu, 14 Nov 2019 09:07:01 +0530
Message-ID: <20191114033704.18171-3-nmahale@nvidia.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191114033704.18171-1-nmahale@nvidia.com>
References: <20191114033704.18171-1-nmahale@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573702664; bh=2/mPzMXk5KgYG79QZqZNZhYrpoudxeYvidOSUp8aR5Q=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=jxjP5Zm6TnHlCCmI8XjTQJGhg+98Qd1RtTnakHvkEvPbWh/I0fF48C746EEmpSbTG
 A5YUV9yIM6bl0LIN9PLfmXYzr0x3xUlU5fTgs2x6c+tyyWsyaWeWpccmADO1eovGB8
 JoVxyeqvYw1gjHv22r2PzpCebra1ZsQCFURqAoNY5P9/0vkjO7P8evJTN6bvYNEbC1
 sFqhMN2VE03E2E8/Mv4hPsA1q9zN8/whmr8KqPzSyBiDVUMqjyhJsg9zxkzcmxke8F
 j1NkMWGfpw99p8aqru1JLY734BqNGtXPq4eLx7U08tLuaCqAgM1Nnxo8GaQEwdBKQr
 mJKVZCYUiA7Pw==
X-Mailman-Approved-At: Thu, 14 Nov 2019 07:34:48 +0100
Cc: alsa-devel@alsa-project.org, nmahale@nvidia.com, aplattner@nvidia.com
Subject: [alsa-devel] [PATCH v1 2/5] ALSA: hda - Add DP-MST jack support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds DP-MST jack support which will be used on NVIDIA
platforms. Today, DP-MST audio is supported only if the codec has
acomp support. This patch makes it possible to add DP-MST support
for non-acomp codecs.

For the codecs supporting DP-MST audio, each pin can contain several
device entries. Each device entry is a virtual pin, described by
pin_nid and dev_id in struct hdmi_spec_per_pin. For monitor hotplug
event handling, non-acomp codecs enable and register jack-detection
for every hdmi_spec_per_pin.

This patch updates every relevant function in hda_jack.h and its
implementation in hda_jack.c, to consider dev_id along with pin_nid.

Changes to the HD Audio specification to support DP-MST audio are
described in the Intel Document Change Notification (DCN) number
HDA040-A.

From HDA040-A, "For the case of multi stream capable Digital Display
Pin Widget, [the Get Pin Sense verb] can be used to read a specific
Device Entry state as reported in Get Device List Entry verb." This
patch updates the read_pin_sense() function to take the dev_id as an
argument and pass it as a parameter to the Get Pin Sense verb.

Bits 15 through 20 from the Unsolicited Response for intrinsic
events contain the index of the Device Entry that generated the
event. This patch updates the Unsolicited Response event handlers to
extract the device entry index from the response and pass it to
snd_hda_jack_tbl_get_from_tag().

This patch updates snd_hda_jack_tbl_new() to take a dev_id argument
and store it in the jack structure, and to make sure not to generate
a different tag when called more than once for the same nid.

Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>
Reviewed-by: Aaron Plattner <aplattner@nvidia.com>
---
 sound/pci/hda/hda_generic.c    |  16 +++---
 sound/pci/hda/hda_jack.c       | 107 +++++++++++++++++++++++++++++------------
 sound/pci/hda/hda_jack.h       |  26 ++++++----
 sound/pci/hda/patch_ca0132.c   |  24 ++++-----
 sound/pci/hda/patch_cirrus.c   |   4 +-
 sound/pci/hda/patch_conexant.c |   2 +-
 sound/pci/hda/patch_hdmi.c     |  47 +++++++++---------
 sound/pci/hda/patch_realtek.c  |  46 +++++++++---------
 sound/pci/hda/patch_sigmatel.c |  12 ++---
 9 files changed, 167 insertions(+), 117 deletions(-)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index 10d502328b76..0340c192b185 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -4203,7 +4203,7 @@ static bool detect_pin_state(struct hda_codec *codec, hda_nid_t pin)
 {
 	if (!is_jack_detectable(codec, pin))
 		return true;
-	return snd_hda_jack_detect_state(codec, pin) != HDA_JACK_NOT_PRESENT;
+	return snd_hda_jack_detect_state(codec, pin, 0) != HDA_JACK_NOT_PRESENT;
 }
 
 /* power up/down the paths of the given pin according to the jack state;
@@ -4260,7 +4260,7 @@ static void add_pin_power_ctls(struct hda_codec *codec, int num_pins,
 
 	for (i = 0; i < num_pins && pins[i]; i++) {
 		if (is_jack_detectable(codec, pins[i]))
-			snd_hda_jack_detect_enable_callback(codec, pins[i], cb);
+			snd_hda_jack_detect_enable_callback(codec, pins[i], 0, cb);
 		else
 			set_path_power(codec, pins[i], true, -1);
 	}
@@ -4413,7 +4413,7 @@ static bool detect_jacks(struct hda_codec *codec, int num_pins, hda_nid_t *pins)
 		/* don't detect pins retasked as inputs */
 		if (snd_hda_codec_get_pin_target(codec, nid) & AC_PINCTL_IN_EN)
 			continue;
-		if (snd_hda_jack_detect_state(codec, nid) == HDA_JACK_PRESENT)
+		if (snd_hda_jack_detect_state(codec, nid, 0) == HDA_JACK_PRESENT)
 			present = true;
 	}
 	return present;
@@ -4614,7 +4614,7 @@ void snd_hda_gen_mic_autoswitch(struct hda_codec *codec,
 		/* don't detect pins retasked as outputs */
 		if (snd_hda_codec_get_pin_target(codec, pin) & AC_PINCTL_OUT_EN)
 			continue;
-		if (snd_hda_jack_detect_state(codec, pin) == HDA_JACK_PRESENT) {
+		if (snd_hda_jack_detect_state(codec, pin, 0) == HDA_JACK_PRESENT) {
 			mux_select(codec, 0, spec->am_entry[i].idx);
 			return;
 		}
@@ -4794,7 +4794,7 @@ static int check_auto_mute_availability(struct hda_codec *codec)
 		if (!is_jack_detectable(codec, nid))
 			continue;
 		codec_dbg(codec, "Enable HP auto-muting on NID 0x%x\n", nid);
-		snd_hda_jack_detect_enable_callback(codec, nid,
+		snd_hda_jack_detect_enable_callback(codec, nid, 0,
 						    call_hp_automute);
 		spec->detect_hp = 1;
 	}
@@ -4806,7 +4806,7 @@ static int check_auto_mute_availability(struct hda_codec *codec)
 				if (!is_jack_detectable(codec, nid))
 					continue;
 				codec_dbg(codec, "Enable Line-Out auto-muting on NID 0x%x\n", nid);
-				snd_hda_jack_detect_enable_callback(codec, nid,
+				snd_hda_jack_detect_enable_callback(codec, nid, 0,
 								    call_line_automute);
 				spec->detect_lo = 1;
 			}
@@ -4847,7 +4847,7 @@ static bool auto_mic_check_imux(struct hda_codec *codec)
 	/* we don't need the jack detection for the first pin */
 	for (i = 1; i < spec->am_num_entries; i++)
 		snd_hda_jack_detect_enable_callback(codec,
-						    spec->am_entry[i].pin,
+						    spec->am_entry[i].pin, 0,
 						    call_mic_autoswitch);
 	return true;
 }
@@ -5990,7 +5990,7 @@ static void clear_unsol_on_unused_pins(struct hda_codec *codec)
 	snd_array_for_each(&codec->init_pins, i, pin) {
 		hda_nid_t nid = pin->nid;
 		if (is_jack_detectable(codec, nid) &&
-		    !snd_hda_jack_tbl_get(codec, nid))
+		    !snd_hda_jack_tbl_get(codec, nid, 0))
 			snd_hda_codec_write_cache(codec, nid, 0,
 					AC_VERB_SET_UNSOLICITED_ENABLE, 0);
 	}
diff --git a/sound/pci/hda/hda_jack.c b/sound/pci/hda/hda_jack.c
index 1ea42447278f..59934b0eca8e 100644
--- a/sound/pci/hda/hda_jack.c
+++ b/sound/pci/hda/hda_jack.c
@@ -43,7 +43,7 @@ bool is_jack_detectable(struct hda_codec *codec, hda_nid_t nid)
 EXPORT_SYMBOL_GPL(is_jack_detectable);
 
 /* execute pin sense measurement */
-static u32 read_pin_sense(struct hda_codec *codec, hda_nid_t nid)
+static u32 read_pin_sense(struct hda_codec *codec, hda_nid_t nid, int dev_id)
 {
 	u32 pincap;
 	u32 val;
@@ -55,7 +55,7 @@ static u32 read_pin_sense(struct hda_codec *codec, hda_nid_t nid)
 					AC_VERB_SET_PIN_SENSE, 0);
 	}
 	val = snd_hda_codec_read(codec, nid, 0,
-				  AC_VERB_GET_PIN_SENSE, 0);
+				  AC_VERB_GET_PIN_SENSE, dev_id);
 	if (codec->inv_jack_detect)
 		val ^= AC_PINSENSE_PRESENCE;
 	return val;
@@ -65,9 +65,10 @@ static u32 read_pin_sense(struct hda_codec *codec, hda_nid_t nid)
  * snd_hda_jack_tbl_get - query the jack-table entry for the given NID
  * @codec: the HDA codec
  * @nid: pin NID to refer to
+ * @dev_id: pin device entry id
  */
 struct hda_jack_tbl *
-snd_hda_jack_tbl_get(struct hda_codec *codec, hda_nid_t nid)
+snd_hda_jack_tbl_get(struct hda_codec *codec, hda_nid_t nid, int dev_id)
 {
 	struct hda_jack_tbl *jack = codec->jacktbl.list;
 	int i;
@@ -75,7 +76,7 @@ snd_hda_jack_tbl_get(struct hda_codec *codec, hda_nid_t nid)
 	if (!nid || !jack)
 		return NULL;
 	for (i = 0; i < codec->jacktbl.used; i++, jack++)
-		if (jack->nid == nid)
+		if (jack->nid == nid && jack->dev_id == dev_id)
 			return jack;
 	return NULL;
 }
@@ -85,9 +86,11 @@ EXPORT_SYMBOL_GPL(snd_hda_jack_tbl_get);
  * snd_hda_jack_tbl_get_from_tag - query the jack-table entry for the given tag
  * @codec: the HDA codec
  * @tag: tag value to refer to
+ * @dev_id: pin device entry id
  */
 struct hda_jack_tbl *
-snd_hda_jack_tbl_get_from_tag(struct hda_codec *codec, unsigned char tag)
+snd_hda_jack_tbl_get_from_tag(struct hda_codec *codec,
+			      unsigned char tag, int dev_id)
 {
 	struct hda_jack_tbl *jack = codec->jacktbl.list;
 	int i;
@@ -95,29 +98,53 @@ snd_hda_jack_tbl_get_from_tag(struct hda_codec *codec, unsigned char tag)
 	if (!tag || !jack)
 		return NULL;
 	for (i = 0; i < codec->jacktbl.used; i++, jack++)
-		if (jack->tag == tag)
+		if (jack->tag == tag && jack->dev_id == dev_id)
 			return jack;
 	return NULL;
 }
 EXPORT_SYMBOL_GPL(snd_hda_jack_tbl_get_from_tag);
 
+static struct hda_jack_tbl *
+any_jack_tbl_get_from_nid(struct hda_codec *codec, hda_nid_t nid)
+{
+	struct hda_jack_tbl *jack = codec->jacktbl.list;
+	int i;
+
+	if (!nid || !jack)
+		return NULL;
+	for (i = 0; i < codec->jacktbl.used; i++, jack++)
+		if (jack->nid == nid)
+			return jack;
+	return NULL;
+}
+
 /**
  * snd_hda_jack_tbl_new - create a jack-table entry for the given NID
  * @codec: the HDA codec
  * @nid: pin NID to assign
  */
 static struct hda_jack_tbl *
-snd_hda_jack_tbl_new(struct hda_codec *codec, hda_nid_t nid)
+snd_hda_jack_tbl_new(struct hda_codec *codec, hda_nid_t nid, int dev_id)
 {
-	struct hda_jack_tbl *jack = snd_hda_jack_tbl_get(codec, nid);
+	struct hda_jack_tbl *jack = snd_hda_jack_tbl_get(codec, nid, dev_id);
+	struct hda_jack_tbl *existing_nid_jack =
+		any_jack_tbl_get_from_nid(codec, nid);
+
+	WARN_ON(dev_id != 0 && !codec->dp_mst);
+
 	if (jack)
 		return jack;
 	jack = snd_array_new(&codec->jacktbl);
 	if (!jack)
 		return NULL;
 	jack->nid = nid;
+	jack->dev_id = dev_id;
 	jack->jack_dirty = 1;
-	jack->tag = codec->jacktbl.used;
+	if (existing_nid_jack == NULL) {
+		jack->tag = codec->jacktbl.used;
+	} else {
+		jack->tag = existing_nid_jack->tag;
+	}
 	return jack;
 }
 
@@ -153,10 +180,12 @@ static void jack_detect_update(struct hda_codec *codec,
 	if (jack->phantom_jack)
 		jack->pin_sense = AC_PINSENSE_PRESENCE;
 	else
-		jack->pin_sense = read_pin_sense(codec, jack->nid);
+		jack->pin_sense = read_pin_sense(codec, jack->nid,
+						 jack->dev_id);
 
 	/* A gating jack indicates the jack is invalid if gating is unplugged */
-	if (jack->gating_jack && !snd_hda_jack_detect(codec, jack->gating_jack))
+	if (jack->gating_jack &&
+	    !snd_hda_jack_detect(codec, jack->gating_jack, jack->dev_id))
 		jack->pin_sense &= ~AC_PINSENSE_PRESENCE;
 
 	jack->jack_dirty = 0;
@@ -164,7 +193,8 @@ static void jack_detect_update(struct hda_codec *codec,
 	/* If a jack is gated by this one update it. */
 	if (jack->gated_jack) {
 		struct hda_jack_tbl *gated =
-			snd_hda_jack_tbl_get(codec, jack->gated_jack);
+			snd_hda_jack_tbl_get(codec, jack->gated_jack,
+					     jack->dev_id);
 		if (gated) {
 			gated->jack_dirty = 1;
 			jack_detect_update(codec, gated);
@@ -198,14 +228,14 @@ EXPORT_SYMBOL_GPL(snd_hda_jack_set_dirty_all);
  * Execute necessary pin sense measurement and return its Presence Detect,
  * Impedance, ELD Valid etc. status bits.
  */
-u32 snd_hda_jack_pin_sense(struct hda_codec *codec, hda_nid_t nid)
+u32 snd_hda_jack_pin_sense(struct hda_codec *codec, hda_nid_t nid, int dev_id)
 {
-	struct hda_jack_tbl *jack = snd_hda_jack_tbl_get(codec, nid);
+	struct hda_jack_tbl *jack = snd_hda_jack_tbl_get(codec, nid, dev_id);
 	if (jack) {
 		jack_detect_update(codec, jack);
 		return jack->pin_sense;
 	}
-	return read_pin_sense(codec, nid);
+	return read_pin_sense(codec, nid, dev_id);
 }
 EXPORT_SYMBOL_GPL(snd_hda_jack_pin_sense);
 
@@ -213,16 +243,19 @@ EXPORT_SYMBOL_GPL(snd_hda_jack_pin_sense);
  * snd_hda_jack_detect_state - query pin Presence Detect status
  * @codec: the CODEC to sense
  * @nid: the pin NID to sense
+ * @dev_id: pin device entry id
  *
  * Query and return the pin's Presence Detect status, as either
  * HDA_JACK_NOT_PRESENT, HDA_JACK_PRESENT or HDA_JACK_PHANTOM.
  */
-int snd_hda_jack_detect_state(struct hda_codec *codec, hda_nid_t nid)
+int snd_hda_jack_detect_state(struct hda_codec *codec, hda_nid_t nid,
+			      int dev_id)
 {
-	struct hda_jack_tbl *jack = snd_hda_jack_tbl_get(codec, nid);
+	struct hda_jack_tbl *jack = snd_hda_jack_tbl_get(codec, nid, dev_id);
 	if (jack && jack->phantom_jack)
 		return HDA_JACK_PHANTOM;
-	else if (snd_hda_jack_pin_sense(codec, nid) & AC_PINSENSE_PRESENCE)
+	else if (snd_hda_jack_pin_sense(codec, nid, dev_id) &
+		 AC_PINSENSE_PRESENCE)
 		return HDA_JACK_PRESENT;
 	else
 		return HDA_JACK_NOT_PRESENT;
@@ -234,6 +267,7 @@ EXPORT_SYMBOL_GPL(snd_hda_jack_detect_state);
  * @codec: the HDA codec
  * @nid: pin NID to enable
  * @func: callback function to register
+ * @dev_id: pin device entry id
  *
  * In the case of error, the return value will be a pointer embedded with
  * errno.  Check and handle the return value appropriately with standard
@@ -241,13 +275,13 @@ EXPORT_SYMBOL_GPL(snd_hda_jack_detect_state);
  */
 struct hda_jack_callback *
 snd_hda_jack_detect_enable_callback(struct hda_codec *codec, hda_nid_t nid,
-				    hda_jack_callback_fn func)
+				    int dev_id, hda_jack_callback_fn func)
 {
 	struct hda_jack_tbl *jack;
 	struct hda_jack_callback *callback = NULL;
 	int err;
 
-	jack = snd_hda_jack_tbl_new(codec, nid);
+	jack = snd_hda_jack_tbl_new(codec, nid, dev_id);
 	if (!jack)
 		return ERR_PTR(-ENOMEM);
 	if (func) {
@@ -256,6 +290,7 @@ snd_hda_jack_detect_enable_callback(struct hda_codec *codec, hda_nid_t nid,
 			return ERR_PTR(-ENOMEM);
 		callback->func = func;
 		callback->nid = jack->nid;
+		callback->dev_id = jack->dev_id;
 		callback->next = jack->callback;
 		jack->callback = callback;
 	}
@@ -278,13 +313,16 @@ EXPORT_SYMBOL_GPL(snd_hda_jack_detect_enable_callback);
  * snd_hda_jack_detect_enable - Enable the jack detection on the given pin
  * @codec: the HDA codec
  * @nid: pin NID to enable jack detection
+ * @dev_id: pin device entry id
  *
  * Enable the jack detection with the default callback.  Returns zero if
  * successful or a negative error code.
  */
-int snd_hda_jack_detect_enable(struct hda_codec *codec, hda_nid_t nid)
+int snd_hda_jack_detect_enable(struct hda_codec *codec, hda_nid_t nid,
+			       int dev_id)
 {
-	return PTR_ERR_OR_ZERO(snd_hda_jack_detect_enable_callback(codec, nid, NULL));
+	return PTR_ERR_OR_ZERO(
+		snd_hda_jack_detect_enable_callback(codec, nid, dev_id, NULL));
 }
 EXPORT_SYMBOL_GPL(snd_hda_jack_detect_enable);
 
@@ -299,8 +337,10 @@ EXPORT_SYMBOL_GPL(snd_hda_jack_detect_enable);
 int snd_hda_jack_set_gating_jack(struct hda_codec *codec, hda_nid_t gated_nid,
 				 hda_nid_t gating_nid)
 {
-	struct hda_jack_tbl *gated = snd_hda_jack_tbl_new(codec, gated_nid);
-	struct hda_jack_tbl *gating = snd_hda_jack_tbl_new(codec, gating_nid);
+	struct hda_jack_tbl *gated = snd_hda_jack_tbl_new(codec, gated_nid, 0);
+	struct hda_jack_tbl *gating = snd_hda_jack_tbl_new(codec, gating_nid, 0);
+
+	WARN_ON(codec->dp_mst);
 
 	if (!gated || !gating)
 		return -EINVAL;
@@ -379,6 +419,7 @@ static void hda_free_jack_priv(struct snd_jack *jack)
  * snd_hda_jack_add_kctl - Add a kctl for the given pin
  * @codec: the HDA codec
  * @nid: pin NID to assign
+ * @dev_id : pin device entry id
  * @name: string name for the jack
  * @phantom_jack: flag to deal as a phantom jack
  * @type: jack type bits to be reported, 0 for guessing from pincfg
@@ -388,14 +429,14 @@ static void hda_free_jack_priv(struct snd_jack *jack)
  * will have the given name and index.
  */
 int snd_hda_jack_add_kctl(struct hda_codec *codec, hda_nid_t nid,
-			  const char *name, bool phantom_jack,
+			  int dev_id, const char *name, bool phantom_jack,
 			  int type, const struct hda_jack_keymap *keymap)
 {
 	struct hda_jack_tbl *jack;
 	const struct hda_jack_keymap *map;
 	int err, state, buttons;
 
-	jack = snd_hda_jack_tbl_new(codec, nid);
+	jack = snd_hda_jack_tbl_new(codec, nid, dev_id);
 	if (!jack)
 		return 0;
 	if (jack->jack)
@@ -425,7 +466,7 @@ int snd_hda_jack_add_kctl(struct hda_codec *codec, hda_nid_t nid,
 			snd_jack_set_key(jack->jack, map->type, map->key);
 	}
 
-	state = snd_hda_jack_detect(codec, nid);
+	state = snd_hda_jack_detect(codec, nid, dev_id);
 	snd_jack_report(jack->jack, state ? jack->type : 0);
 
 	return 0;
@@ -441,6 +482,8 @@ static int add_jack_kctl(struct hda_codec *codec, hda_nid_t nid,
 	int err;
 	bool phantom_jack;
 
+	WARN_ON(codec->dp_mst);
+
 	if (!nid)
 		return 0;
 	def_conf = snd_hda_codec_get_pincfg(codec, nid);
@@ -457,12 +500,12 @@ static int add_jack_kctl(struct hda_codec *codec, hda_nid_t nid,
 	if (phantom_jack)
 		/* Example final name: "Internal Mic Phantom Jack" */
 		strncat(name, " Phantom", sizeof(name) - strlen(name) - 1);
-	err = snd_hda_jack_add_kctl(codec, nid, name, phantom_jack, 0, NULL);
+	err = snd_hda_jack_add_kctl(codec, nid, 0, name, phantom_jack, 0, NULL);
 	if (err < 0)
 		return err;
 
 	if (!phantom_jack)
-		return snd_hda_jack_detect_enable(codec, nid);
+		return snd_hda_jack_detect_enable(codec, nid, 0);
 	return 0;
 }
 
@@ -540,7 +583,8 @@ static void call_jack_callback(struct hda_codec *codec, unsigned int res,
 	}
 	if (jack->gated_jack) {
 		struct hda_jack_tbl *gated =
-			snd_hda_jack_tbl_get(codec, jack->gated_jack);
+			snd_hda_jack_tbl_get(codec, jack->gated_jack,
+					     jack->dev_id);
 		if (gated) {
 			for (cb = gated->callback; cb; cb = cb->next) {
 				cb->jack = gated;
@@ -560,8 +604,9 @@ void snd_hda_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 {
 	struct hda_jack_tbl *event;
 	int tag = (res & AC_UNSOL_RES_TAG) >> AC_UNSOL_RES_TAG_SHIFT;
+	int dev_entry = (res & AC_UNSOL_RES_DE) >> AC_UNSOL_RES_DE_SHIFT;
 
-	event = snd_hda_jack_tbl_get_from_tag(codec, tag);
+	event = snd_hda_jack_tbl_get_from_tag(codec, tag, dev_entry);
 	if (!event)
 		return;
 	event->jack_dirty = 1;
diff --git a/sound/pci/hda/hda_jack.h b/sound/pci/hda/hda_jack.h
index cd9b47f51fab..860cb9db8686 100644
--- a/sound/pci/hda/hda_jack.h
+++ b/sound/pci/hda/hda_jack.h
@@ -19,6 +19,7 @@ typedef void (*hda_jack_callback_fn) (struct hda_codec *, struct hda_jack_callba
 
 struct hda_jack_callback {
 	hda_nid_t nid;
+	int dev_id;
 	hda_jack_callback_fn func;
 	unsigned int private_data;	/* arbitrary data */
 	unsigned int unsol_res;		/* unsolicited event bits */
@@ -28,6 +29,7 @@ struct hda_jack_callback {
 
 struct hda_jack_tbl {
 	hda_nid_t nid;
+	int dev_id;
 	unsigned char tag;		/* unsol event tag */
 	struct hda_jack_callback *callback;
 	/* jack-detection stuff */
@@ -49,45 +51,51 @@ struct hda_jack_keymap {
 };
 
 struct hda_jack_tbl *
-snd_hda_jack_tbl_get(struct hda_codec *codec, hda_nid_t nid);
+snd_hda_jack_tbl_get(struct hda_codec *codec, hda_nid_t nid, int dev_id);
 struct hda_jack_tbl *
-snd_hda_jack_tbl_get_from_tag(struct hda_codec *codec, unsigned char tag);
+snd_hda_jack_tbl_get_from_tag(struct hda_codec *codec,
+			      unsigned char tag, int dev_id);
 
 void snd_hda_jack_tbl_clear(struct hda_codec *codec);
 
 void snd_hda_jack_set_dirty_all(struct hda_codec *codec);
 
-int snd_hda_jack_detect_enable(struct hda_codec *codec, hda_nid_t nid);
+int snd_hda_jack_detect_enable(struct hda_codec *codec, hda_nid_t nid,
+			       int dev_id);
 struct hda_jack_callback *
 snd_hda_jack_detect_enable_callback(struct hda_codec *codec, hda_nid_t nid,
-				    hda_jack_callback_fn cb);
+				    int dev_id, hda_jack_callback_fn cb);
 
 int snd_hda_jack_set_gating_jack(struct hda_codec *codec, hda_nid_t gated_nid,
 				 hda_nid_t gating_nid);
 
-u32 snd_hda_jack_pin_sense(struct hda_codec *codec, hda_nid_t nid);
+u32 snd_hda_jack_pin_sense(struct hda_codec *codec, hda_nid_t nid, int dev_id);
 
 /* the jack state returned from snd_hda_jack_detect_state() */
 enum {
 	HDA_JACK_NOT_PRESENT, HDA_JACK_PRESENT, HDA_JACK_PHANTOM,
 };
 
-int snd_hda_jack_detect_state(struct hda_codec *codec, hda_nid_t nid);
+int snd_hda_jack_detect_state(struct hda_codec *codec, hda_nid_t nid,
+			      int dev_id);
 
 /**
  * snd_hda_jack_detect - Detect the jack
  * @codec: the HDA codec
  * @nid: pin NID to check jack detection
+ * @dev_id: pin device entry id
  */
-static inline bool snd_hda_jack_detect(struct hda_codec *codec, hda_nid_t nid)
+static inline bool
+snd_hda_jack_detect(struct hda_codec *codec, hda_nid_t nid, int dev_id)
 {
-	return snd_hda_jack_detect_state(codec, nid) != HDA_JACK_NOT_PRESENT;
+	return snd_hda_jack_detect_state(codec, nid, dev_id) !=
+		HDA_JACK_NOT_PRESENT;
 }
 
 bool is_jack_detectable(struct hda_codec *codec, hda_nid_t nid);
 
 int snd_hda_jack_add_kctl(struct hda_codec *codec, hda_nid_t nid,
-			  const char *name, bool phantom_jack,
+			  int dev_id, const char *name, bool phantom_jack,
 			  int type, const struct hda_jack_keymap *keymap);
 int snd_hda_jack_add_kctls(struct hda_codec *codec,
 			   const struct auto_pin_cfg *cfg);
diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index b7a1abb3e231..76e2e15c7331 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -4064,7 +4064,7 @@ static int ca0132_select_out(struct hda_codec *codec)
 	auto_jack = spec->vnode_lswitch[VNID_HP_ASEL - VNODE_START_NID];
 
 	if (auto_jack)
-		jack_present = snd_hda_jack_detect(codec, spec->unsol_tag_hp);
+		jack_present = snd_hda_jack_detect(codec, spec->unsol_tag_hp, 0);
 	else
 		jack_present =
 			spec->vnode_lswitch[VNID_HP_SEL - VNODE_START_NID];
@@ -4320,8 +4320,8 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 	 * hp/speaker auto detect is enabled.
 	 */
 	if (auto_jack) {
-		jack_present = snd_hda_jack_detect(codec, spec->unsol_tag_hp) ||
-			   snd_hda_jack_detect(codec, spec->unsol_tag_front_hp);
+		jack_present = snd_hda_jack_detect(codec, spec->unsol_tag_hp, 0) ||
+			   snd_hda_jack_detect(codec, spec->unsol_tag_front_hp, 0);
 
 		if (jack_present)
 			spec->cur_out_type = HEADPHONE_OUT;
@@ -4376,9 +4376,9 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 
 		/* enable headphone, either front or rear */
 
-		if (snd_hda_jack_detect(codec, spec->unsol_tag_front_hp))
+		if (snd_hda_jack_detect(codec, spec->unsol_tag_front_hp, 0))
 			headphone_nid = spec->out_pins[2];
-		else if (snd_hda_jack_detect(codec, spec->unsol_tag_hp))
+		else if (snd_hda_jack_detect(codec, spec->unsol_tag_hp, 0))
 			headphone_nid = spec->out_pins[1];
 
 		pin_ctl = snd_hda_codec_read(codec, headphone_nid, 0,
@@ -4460,7 +4460,7 @@ static void ca0132_unsol_hp_delayed(struct work_struct *work)
 	else
 		ca0132_select_out(spec->codec);
 
-	jack = snd_hda_jack_tbl_get(spec->codec, spec->unsol_tag_hp);
+	jack = snd_hda_jack_tbl_get(spec->codec, spec->unsol_tag_hp, 0);
 	if (jack) {
 		jack->block_report = 0;
 		snd_hda_jack_report_sync(spec->codec);
@@ -4599,7 +4599,7 @@ static int ca0132_select_mic(struct hda_codec *codec)
 	auto_jack = spec->vnode_lswitch[VNID_AMIC1_ASEL - VNODE_START_NID];
 
 	if (auto_jack)
-		jack_present = snd_hda_jack_detect(codec, spec->unsol_tag_amic1);
+		jack_present = snd_hda_jack_detect(codec, spec->unsol_tag_amic1, 0);
 	else
 		jack_present =
 			spec->vnode_lswitch[VNID_AMIC1_SEL - VNODE_START_NID];
@@ -7606,7 +7606,7 @@ static void hp_callback(struct hda_codec *codec, struct hda_jack_callback *cb)
 	 */
 	cancel_delayed_work(&spec->unsol_hp_work);
 	schedule_delayed_work(&spec->unsol_hp_work, msecs_to_jiffies(500));
-	tbl = snd_hda_jack_tbl_get(codec, cb->nid);
+	tbl = snd_hda_jack_tbl_get(codec, cb->nid, 0);
 	if (tbl)
 		tbl->block_report = 1;
 }
@@ -7624,15 +7624,15 @@ static void amic_callback(struct hda_codec *codec, struct hda_jack_callback *cb)
 static void ca0132_init_unsol(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec = codec->spec;
-	snd_hda_jack_detect_enable_callback(codec, spec->unsol_tag_hp, hp_callback);
-	snd_hda_jack_detect_enable_callback(codec, spec->unsol_tag_amic1,
+	snd_hda_jack_detect_enable_callback(codec, spec->unsol_tag_hp, 0, hp_callback);
+	snd_hda_jack_detect_enable_callback(codec, spec->unsol_tag_amic1, 0,
 					    amic_callback);
-	snd_hda_jack_detect_enable_callback(codec, UNSOL_TAG_DSP,
+	snd_hda_jack_detect_enable_callback(codec, UNSOL_TAG_DSP, 0,
 					    ca0132_process_dsp_response);
 	/* Front headphone jack detection */
 	if (ca0132_use_alt_functions(spec))
 		snd_hda_jack_detect_enable_callback(codec,
-			spec->unsol_tag_front_hp, hp_callback);
+			spec->unsol_tag_front_hp, 0, hp_callback);
 }
 
 /*
diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index f46204ab0b90..46e10de43ed6 100644
--- a/sound/pci/hda/patch_cirrus.c
+++ b/sound/pci/hda/patch_cirrus.c
@@ -1028,7 +1028,7 @@ static void cs4210_spdif_automute(struct hda_codec *codec,
 	    spec->vendor_nid != CS4210_VENDOR_NID)
 		return;
 
-	spdif_present = snd_hda_jack_detect(codec, spdif_pin);
+	spdif_present = snd_hda_jack_detect(codec, spdif_pin, 0);
 	if (spdif_present == spec->spdif_present)
 		return;
 
@@ -1049,7 +1049,7 @@ static void parse_cs421x_digital(struct hda_codec *codec)
 		hda_nid_t nid = cfg->dig_out_pins[i];
 		if (get_wcaps(codec, nid) & AC_WCAP_UNSOL_CAP) {
 			spec->spdif_detect = 1;
-			snd_hda_jack_detect_enable_callback(codec, nid,
+			snd_hda_jack_detect_enable_callback(codec, nid, 0,
 							    cs4210_spdif_automute);
 		}
 	}
diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index 968d3caab6ac..178c95356037 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -261,7 +261,7 @@ static void cxt_update_headset_mode(struct hda_codec *codec)
 		spec->gen.hp_jack_present = false;
 	} else {
 		snd_hda_codec_write_cache(codec, 0x1c, 0, 0x410, 0x54); /* disable merged mode for analog int-mic */
-		spec->gen.hp_jack_present = snd_hda_jack_detect(codec, spec->gen.autocfg.hp_pins[0]);
+		spec->gen.hp_jack_present = snd_hda_jack_detect(codec, spec->gen.autocfg.hp_pins[0], 0);
 	}
 
 	snd_hda_gen_update_outputs(codec);
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index c1eee2274fb5..39eeb7c7407c 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -774,8 +774,7 @@ static void jack_callback(struct hda_codec *codec,
 	if (codec_has_acomp(codec))
 		return;
 
-	/* hda_jack don't support DP MST */
-	check_presence_and_report(codec, jack->nid, 0);
+	check_presence_and_report(codec, jack->nid, jack->dev_id);
 }
 
 static void hdmi_intrinsic_event(struct hda_codec *codec, unsigned int res)
@@ -784,24 +783,18 @@ static void hdmi_intrinsic_event(struct hda_codec *codec, unsigned int res)
 	struct hda_jack_tbl *jack;
 	int dev_entry = (res & AC_UNSOL_RES_DE) >> AC_UNSOL_RES_DE_SHIFT;
 
-	/*
-	 * assume DP MST uses dyn_pcm_assign and acomp and
-	 * never comes here
-	 * if DP MST supports unsol event, below code need
-	 * consider dev_entry
-	 */
-	jack = snd_hda_jack_tbl_get_from_tag(codec, tag);
+	jack = snd_hda_jack_tbl_get_from_tag(codec, tag, dev_entry);
 	if (!jack)
 		return;
 	jack->jack_dirty = 1;
 
 	codec_dbg(codec,
 		"HDMI hot plug event: Codec=%d Pin=%d Device=%d Inactive=%d Presence_Detect=%d ELD_Valid=%d\n",
-		codec->addr, jack->nid, dev_entry, !!(res & AC_UNSOL_RES_IA),
+		codec->addr, jack->nid, jack->dev_id, !!(res & AC_UNSOL_RES_IA),
 		!!(res & AC_UNSOL_RES_PD), !!(res & AC_UNSOL_RES_ELDV));
 
 	/* hda_jack don't support DP MST */
-	check_presence_and_report(codec, jack->nid, 0);
+	check_presence_and_report(codec, jack->nid, jack->dev_id);
 }
 
 static void hdmi_non_intrinsic_event(struct hda_codec *codec, unsigned int res)
@@ -831,11 +824,12 @@ static void hdmi_unsol_event(struct hda_codec *codec, unsigned int res)
 {
 	int tag = res >> AC_UNSOL_RES_TAG_SHIFT;
 	int subtag = (res & AC_UNSOL_RES_SUBTAG) >> AC_UNSOL_RES_SUBTAG_SHIFT;
+	int dev_entry = (res & AC_UNSOL_RES_DE) >> AC_UNSOL_RES_DE_SHIFT;
 
 	if (codec_has_acomp(codec))
 		return;
 
-	if (!snd_hda_jack_tbl_get_from_tag(codec, tag)) {
+	if (!snd_hda_jack_tbl_get_from_tag(codec, tag, dev_entry)) {
 		codec_dbg(codec, "Unexpected HDMI event tag 0x%x\n", tag);
 		return;
 	}
@@ -1521,7 +1515,7 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	bool ret;
 	bool do_repoll = false;
 
-	present = snd_hda_jack_pin_sense(codec, pin_nid);
+	present = snd_hda_jack_pin_sense(codec, pin_nid, per_pin->dev_id);
 
 	mutex_lock(&per_pin->lock);
 	eld->monitor_present = !!(present & AC_PINSENSE_PRESENCE);
@@ -1554,7 +1548,7 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 
 	ret = !repoll || !eld->monitor_present || eld->eld_valid;
 
-	jack = snd_hda_jack_tbl_get(codec, pin_nid);
+	jack = snd_hda_jack_tbl_get(codec, pin_nid, per_pin->dev_id);
 	if (jack) {
 		jack->block_report = !ret;
 		jack->pin_sense = (eld->monitor_present && eld->eld_valid) ?
@@ -1585,7 +1579,8 @@ static struct snd_jack *pin_idx_to_jack(struct hda_codec *codec,
 		 * DP MST will use dyn_pcm_assign,
 		 * so DP MST will never come here
 		 */
-		jack_tbl = snd_hda_jack_tbl_get(codec, per_pin->pin_nid);
+		jack_tbl = snd_hda_jack_tbl_get(codec, per_pin->pin_nid,
+					        per_pin->dev_id);
 		if (jack_tbl)
 			jack = jack_tbl->jack;
 	}
@@ -1666,7 +1661,7 @@ static void hdmi_repoll_eld(struct work_struct *work)
 	struct hdmi_spec *spec = codec->spec;
 	struct hda_jack_tbl *jack;
 
-	jack = snd_hda_jack_tbl_get(codec, per_pin->pin_nid);
+	jack = snd_hda_jack_tbl_get(codec, per_pin->pin_nid, per_pin->dev_id);
 	if (jack)
 		jack->jack_dirty = 1;
 
@@ -2158,11 +2153,11 @@ static int generic_hdmi_build_jack(struct hda_codec *codec, int pcm_idx)
 	if (phantom_jack)
 		strncat(hdmi_str, " Phantom",
 			sizeof(hdmi_str) - strlen(hdmi_str) - 1);
-	ret = snd_hda_jack_add_kctl(codec, per_pin->pin_nid, hdmi_str,
-				    phantom_jack, 0, NULL);
+	ret = snd_hda_jack_add_kctl(codec, per_pin->pin_nid, per_pin->dev_id,
+				    hdmi_str, phantom_jack, 0, NULL);
 	if (ret < 0)
 		return ret;
-	jack = snd_hda_jack_tbl_get(codec, per_pin->pin_nid);
+	jack = snd_hda_jack_tbl_get(codec, per_pin->pin_nid, per_pin->dev_id);
 	if (jack == NULL)
 		return 0;
 	/* assign jack->jack to pcm_rec[].jack to
@@ -2271,9 +2266,9 @@ static int generic_hdmi_init(struct hda_codec *codec)
 		if (codec_has_acomp(codec))
 			continue;
 		if (spec->use_jack_detect)
-			snd_hda_jack_detect_enable(codec, pin_nid);
+			snd_hda_jack_detect_enable(codec, pin_nid, 0);
 		else
-			snd_hda_jack_detect_enable_callback(codec, pin_nid,
+			snd_hda_jack_detect_enable_callback(codec, pin_nid, 0,
 							    jack_callback);
 	}
 	mutex_unlock(&spec->bind_lock);
@@ -2423,12 +2418,13 @@ static int patch_generic_hdmi(struct hda_codec *codec)
  */
 
 /* turn on / off the unsol event jack detection dynamically */
-static void reprogram_jack_detect(struct hda_codec *codec, hda_nid_t nid,
+static void reprogram_jack_detect(struct hda_codec *codec,
+				  hda_nid_t nid, int dev_id,
 				  bool use_acomp)
 {
 	struct hda_jack_tbl *tbl;
 
-	tbl = snd_hda_jack_tbl_get(codec, nid);
+	tbl = snd_hda_jack_tbl_get(codec, nid, dev_id);
 	if (tbl) {
 		/* clear unsol even if component notifier is used, or re-enable
 		 * if notifier is cleared
@@ -2441,7 +2437,7 @@ static void reprogram_jack_detect(struct hda_codec *codec, hda_nid_t nid,
 		 * at need (i.e. only when notifier is cleared)
 		 */
 		if (!use_acomp)
-			snd_hda_jack_detect_enable(codec, nid);
+			snd_hda_jack_detect_enable(codec, nid, dev_id);
 	}
 }
 
@@ -2461,6 +2457,7 @@ static void generic_acomp_notifier_set(struct drm_audio_component *acomp,
 		for (i = 0; i < spec->num_pins; i++)
 			reprogram_jack_detect(spec->codec,
 					      get_pin(spec, i)->pin_nid,
+					      get_pin(spec, i)->dev_id,
 					      use_acomp);
 	}
 	mutex_unlock(&spec->bind_lock);
@@ -2968,7 +2965,7 @@ static int simple_playback_init(struct hda_codec *codec)
 	if (get_wcaps(codec, pin) & AC_WCAP_OUT_AMP)
 		snd_hda_codec_write(codec, pin, 0, AC_VERB_SET_AMP_GAIN_MUTE,
 				    AMP_OUT_UNMUTE);
-	snd_hda_jack_detect_enable(codec, pin);
+	snd_hda_jack_detect_enable(codec, pin, per_pin->dev_id);
 	return 0;
 }
 
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 80f66ba85f87..a779967d8f46 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -1177,7 +1177,7 @@ static void alc880_fixup_vol_knob(struct hda_codec *codec,
 				  const struct hda_fixup *fix, int action)
 {
 	if (action == HDA_FIXUP_ACT_PROBE)
-		snd_hda_jack_detect_enable_callback(codec, 0x21,
+		snd_hda_jack_detect_enable_callback(codec, 0x21, 0,
 						    alc_update_knob_master);
 }
 
@@ -1644,7 +1644,7 @@ static void alc260_fixup_gpio1_toggle(struct hda_codec *codec,
 		spec->gen.detect_hp = 1;
 		spec->gen.automute_speaker = 1;
 		spec->gen.autocfg.hp_pins[0] = 0x0f; /* copy it for automute */
-		snd_hda_jack_detect_enable_callback(codec, 0x0f,
+		snd_hda_jack_detect_enable_callback(codec, 0x0f, 0,
 						    snd_hda_gen_hp_automute);
 		alc_setup_gpio(codec, 0x01);
 	}
@@ -3038,7 +3038,7 @@ static void alc282_init(struct hda_codec *codec)
 
 	if (!hp_pin)
 		return;
-	hp_pin_sense = snd_hda_jack_detect(codec, hp_pin);
+	hp_pin_sense = snd_hda_jack_detect(codec, hp_pin, 0);
 	coef78 = alc_read_coef_idx(codec, 0x78);
 
 	/* Index 0x78 Direct Drive HP AMP LPM Control 1 */
@@ -3076,7 +3076,7 @@ static void alc282_shutup(struct hda_codec *codec)
 		return;
 	}
 
-	hp_pin_sense = snd_hda_jack_detect(codec, hp_pin);
+	hp_pin_sense = snd_hda_jack_detect(codec, hp_pin, 0);
 	coef78 = alc_read_coef_idx(codec, 0x78);
 	alc_write_coef_idx(codec, 0x78, 0x9004);
 
@@ -3155,7 +3155,7 @@ static void alc283_init(struct hda_codec *codec)
 		return;
 
 	msleep(30);
-	hp_pin_sense = snd_hda_jack_detect(codec, hp_pin);
+	hp_pin_sense = snd_hda_jack_detect(codec, hp_pin, 0);
 
 	/* Index 0x43 Direct Drive HP AMP LPM Control 1 */
 	/* Headphone capless set to high power mode */
@@ -3190,7 +3190,7 @@ static void alc283_shutup(struct hda_codec *codec)
 		return;
 	}
 
-	hp_pin_sense = snd_hda_jack_detect(codec, hp_pin);
+	hp_pin_sense = snd_hda_jack_detect(codec, hp_pin, 0);
 
 	alc_write_coef_idx(codec, 0x43, 0x9004);
 
@@ -3227,7 +3227,7 @@ static void alc256_init(struct hda_codec *codec)
 
 	msleep(30);
 
-	hp_pin_sense = snd_hda_jack_detect(codec, hp_pin);
+	hp_pin_sense = snd_hda_jack_detect(codec, hp_pin, 0);
 
 	if (hp_pin_sense)
 		msleep(2);
@@ -3270,7 +3270,7 @@ static void alc256_shutup(struct hda_codec *codec)
 	if (!hp_pin)
 		hp_pin = 0x21;
 
-	hp_pin_sense = snd_hda_jack_detect(codec, hp_pin);
+	hp_pin_sense = snd_hda_jack_detect(codec, hp_pin, 0);
 
 	if (hp_pin_sense)
 		msleep(2);
@@ -3315,8 +3315,8 @@ static void alc225_init(struct hda_codec *codec)
 		hp_pin = 0x21;
 	msleep(30);
 
-	hp1_pin_sense = snd_hda_jack_detect(codec, hp_pin);
-	hp2_pin_sense = snd_hda_jack_detect(codec, 0x16);
+	hp1_pin_sense = snd_hda_jack_detect(codec, hp_pin, 0);
+	hp2_pin_sense = snd_hda_jack_detect(codec, 0x16, 0);
 
 	if (hp1_pin_sense || hp2_pin_sense)
 		msleep(2);
@@ -3364,8 +3364,8 @@ static void alc225_shutup(struct hda_codec *codec)
 	/* 3k pull low control for Headset jack. */
 	alc_update_coef_idx(codec, 0x4a, 0, 3 << 10);
 
-	hp1_pin_sense = snd_hda_jack_detect(codec, hp_pin);
-	hp2_pin_sense = snd_hda_jack_detect(codec, 0x16);
+	hp1_pin_sense = snd_hda_jack_detect(codec, hp_pin, 0);
+	hp2_pin_sense = snd_hda_jack_detect(codec, 0x16, 0);
 
 	if (hp1_pin_sense || hp2_pin_sense)
 		msleep(2);
@@ -3413,7 +3413,7 @@ static void alc_default_init(struct hda_codec *codec)
 
 	msleep(30);
 
-	hp_pin_sense = snd_hda_jack_detect(codec, hp_pin);
+	hp_pin_sense = snd_hda_jack_detect(codec, hp_pin, 0);
 
 	if (hp_pin_sense)
 		msleep(2);
@@ -3442,7 +3442,7 @@ static void alc_default_shutup(struct hda_codec *codec)
 		return;
 	}
 
-	hp_pin_sense = snd_hda_jack_detect(codec, hp_pin);
+	hp_pin_sense = snd_hda_jack_detect(codec, hp_pin, 0);
 
 	if (hp_pin_sense)
 		msleep(2);
@@ -4117,7 +4117,7 @@ static void alc280_fixup_hp_gpio2_mic_hotkey(struct hda_codec *codec,
 		spec->gpio_data |= 0x02;
 		snd_hda_codec_write_cache(codec, codec->core.afg, 0,
 					  AC_VERB_SET_GPIO_UNSOLICITED_RSP_MASK, 0x04);
-		snd_hda_jack_detect_enable_callback(codec, codec->core.afg,
+		snd_hda_jack_detect_enable_callback(codec, codec->core.afg, 0,
 						    gpio2_mic_hotkey_event);
 		return;
 	}
@@ -4146,7 +4146,7 @@ static void alc233_fixup_lenovo_line2_mic_hotkey(struct hda_codec *codec,
 		if (alc_register_micmute_input_device(codec) != 0)
 			return;
 
-		snd_hda_jack_detect_enable_callback(codec, 0x1b,
+		snd_hda_jack_detect_enable_callback(codec, 0x1b, 0,
 						    gpio2_mic_hotkey_event);
 		return;
 	}
@@ -4989,7 +4989,7 @@ static void alc_update_headset_mode(struct hda_codec *codec)
 
 	int new_headset_mode;
 
-	if (!snd_hda_jack_detect(codec, hp_pin))
+	if (!snd_hda_jack_detect(codec, hp_pin, 0))
 		new_headset_mode = ALC_HEADSET_MODE_UNPLUGGED;
 	else if (mux_pin == spec->headset_mic_pin)
 		new_headset_mode = ALC_HEADSET_MODE_HEADSET;
@@ -5466,7 +5466,7 @@ static void asus_tx300_automute(struct hda_codec *codec)
 {
 	struct alc_spec *spec = codec->spec;
 	snd_hda_gen_update_outputs(codec);
-	if (snd_hda_jack_detect(codec, 0x1b))
+	if (snd_hda_jack_detect(codec, 0x1b, 0))
 		spec->gen.mute_bits |= (1ULL << 0x14);
 }
 
@@ -5487,7 +5487,7 @@ static void alc282_fixup_asus_tx300(struct hda_codec *codec,
 		snd_hda_apply_pincfgs(codec, dock_pins);
 		spec->gen.auto_mute_via_amp = 1;
 		spec->gen.automute_hook = asus_tx300_automute;
-		snd_hda_jack_detect_enable_callback(codec, 0x1b,
+		snd_hda_jack_detect_enable_callback(codec, 0x1b, 0,
 						    snd_hda_gen_hp_automute);
 		break;
 	case HDA_FIXUP_ACT_PROBE:
@@ -5677,9 +5677,9 @@ static void alc_fixup_headset_jack(struct hda_codec *codec,
 
 	switch (action) {
 	case HDA_FIXUP_ACT_PRE_PROBE:
-		snd_hda_jack_detect_enable_callback(codec, 0x55,
+		snd_hda_jack_detect_enable_callback(codec, 0x55, 0,
 						    alc_headset_btn_callback);
-		snd_hda_jack_add_kctl(codec, 0x55, "Headset Jack", false,
+		snd_hda_jack_add_kctl(codec, 0x55, 0, "Headset Jack", false,
 				      SND_JACK_HEADSET, alc_headset_btn_keymap);
 		break;
 	case HDA_FIXUP_ACT_INIT:
@@ -8435,7 +8435,7 @@ static void alc662_aspire_ethos_mute_speakers(struct hda_codec *codec,
 	 * 0x15 - front left/front right
 	 * 0x18 - front center/ LFE
 	 */
-	if (snd_hda_jack_detect_state(codec, 0x1b) == HDA_JACK_PRESENT) {
+	if (snd_hda_jack_detect_state(codec, 0x1b, 0) == HDA_JACK_PRESENT) {
 		snd_hda_set_pin_ctl_cache(codec, 0x15, 0);
 		snd_hda_set_pin_ctl_cache(codec, 0x18, 0);
 	} else {
@@ -8453,7 +8453,7 @@ static void alc662_fixup_aspire_ethos_hp(struct hda_codec *codec,
 
 	switch (action) {
 	case HDA_FIXUP_ACT_PRE_PROBE:
-		snd_hda_jack_detect_enable_callback(codec, 0x1b,
+		snd_hda_jack_detect_enable_callback(codec, 0x1b, 0,
 				alc662_aspire_ethos_mute_speakers);
 		break;
 	case HDA_FIXUP_ACT_INIT:
diff --git a/sound/pci/hda/patch_sigmatel.c b/sound/pci/hda/patch_sigmatel.c
index 894f3f509e76..504a874a1543 100644
--- a/sound/pci/hda/patch_sigmatel.c
+++ b/sound/pci/hda/patch_sigmatel.c
@@ -466,7 +466,7 @@ static void jack_update_power(struct hda_codec *codec,
 
 	if (jack && jack->nid) {
 		stac_toggle_power_map(codec, jack->nid,
-				      snd_hda_jack_detect(codec, jack->nid),
+				      snd_hda_jack_detect(codec, jack->nid, 0),
 				      true);
 		return;
 	}
@@ -474,10 +474,10 @@ static void jack_update_power(struct hda_codec *codec,
 	/* update all jacks */
 	for (i = 0; i < spec->num_pwrs; i++) {
 		hda_nid_t nid = spec->pwr_nids[i];
-		if (!snd_hda_jack_tbl_get(codec, nid))
+		if (!snd_hda_jack_tbl_get(codec, nid, 0))
 			continue;
 		stac_toggle_power_map(codec, nid,
-				      snd_hda_jack_detect(codec, nid),
+				      snd_hda_jack_detect(codec, nid, 0),
 				      false);
 	}
 
@@ -513,7 +513,7 @@ static void stac_init_power_map(struct hda_codec *codec)
 		if (def_conf == AC_JACK_PORT_COMPLEX &&
 		    spec->vref_mute_led_nid != nid &&
 		    is_jack_detectable(codec, nid)) {
-			snd_hda_jack_detect_enable_callback(codec, nid,
+			snd_hda_jack_detect_enable_callback(codec, nid, 0,
 							    jack_update_power);
 		} else {
 			if (def_conf == AC_JACK_PORT_NONE)
@@ -3063,7 +3063,7 @@ static void stac92hd71bxx_fixup_hp_m4(struct hda_codec *codec,
 	/* Enable VREF power saving on GPIO1 detect */
 	snd_hda_codec_write_cache(codec, codec->core.afg, 0,
 				  AC_VERB_SET_GPIO_UNSOLICITED_RSP_MASK, 0x02);
-	jack = snd_hda_jack_detect_enable_callback(codec, codec->core.afg,
+	jack = snd_hda_jack_detect_enable_callback(codec, codec->core.afg, 0,
 						   stac_vref_event);
 	if (!IS_ERR(jack))
 		jack->private_data = 0x02;
@@ -4105,7 +4105,7 @@ static void stac9205_fixup_dell_m43(struct hda_codec *codec,
 		/* Enable unsol response for GPIO4/Dock HP connection */
 		snd_hda_codec_write_cache(codec, codec->core.afg, 0,
 			AC_VERB_SET_GPIO_UNSOLICITED_RSP_MASK, 0x10);
-		jack = snd_hda_jack_detect_enable_callback(codec, codec->core.afg,
+		jack = snd_hda_jack_detect_enable_callback(codec, codec->core.afg, 0,
 							   stac_vref_event);
 		if (!IS_ERR(jack))
 			jack->private_data = 0x01;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
