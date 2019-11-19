Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB52F101E92
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 09:50:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7046C169F;
	Tue, 19 Nov 2019 09:50:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7046C169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574153457;
	bh=Re8bG9x5hah486rez5h8yY19GEQFLjLMzCsff/BzHj8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iQX1TW0DQQTVJcad5My9VjpIc3EQYU/UmLytA6h6kzwxoDKmGFWg6jZnDxLqyhbah
	 8LBchNpI4HnGI3r2B0mJY1gucMmXXI3pIkvkslTLf9YN8NuHf7QD/HjNzydZD3QIED
	 oHyV9XD6gg83lx/ZBb5YU1WSdtVPgc+ndpJGIxpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23446F8015A;
	Tue, 19 Nov 2019 09:47:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CDC3F80159; Tue, 19 Nov 2019 09:47:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 540E3F800F4
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 09:47:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 540E3F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="niEigjc+"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd3ac310000>; Tue, 19 Nov 2019 00:47:45 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 19 Nov 2019 00:47:42 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 19 Nov 2019 00:47:42 -0800
Received: from nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 19 Nov 2019 08:47:39 +0000
From: Nikhil Mahale <nmahale@nvidia.com>
To: <tiwai@suse.com>
Date: Tue, 19 Nov 2019 14:17:08 +0530
Message-ID: <20191119084710.29267-3-nmahale@nvidia.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191119084710.29267-1-nmahale@nvidia.com>
References: <20191119084710.29267-1-nmahale@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574153265; bh=G96qVhBOQdFeIy2ATqfKsfv18oCKDRBzI2Dx6u6bfIw=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=niEigjc+aWgZj+19IlQdFFvV+VqNwyiWlbZHMsaqRGNqsnX+cM5s6OSCuoiqhgjNz
 pnMKL1uNbdeoNo63pssG8rYwKDT/h/2Tigos0DWZLmwBcYZPRgNSe7dyn5Nf70gs3R
 iUYUUzhOQwQE5kN0bwgiWEEoWBG5bgwqg2EIJBfzn0xQO3At8/zumy2aEj9UA8Dkol
 tFsNHWlcj3PXr/tmu7rVDm/C3qnlzf3uhzVImJ1J4AUR5dmHHQl5WtY794DF7LDZH/
 t3NTDz+Wqup1KB4dUQvzywwVr/vBg+MdCpeHHdh6OiKJfz5B1LGC7hQUwJqKERor/s
 NJkRUzlx1l/dw==
Cc: alsa-devel@alsa-project.org, nmahale@nvidia.com, aplattner@nvidia.com
Subject: [alsa-devel] [PATCH v3 2/4] ALSA: hda - Add DP-MST jack support
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
---
 sound/pci/hda/hda_jack.c   | 147 ++++++++++++++++++++++++++++++++-------------
 sound/pci/hda/hda_jack.h   | 107 +++++++++++++++++++++++++++++----
 sound/pci/hda/patch_hdmi.c |  70 ++++++++++++---------
 3 files changed, 244 insertions(+), 80 deletions(-)

diff --git a/sound/pci/hda/hda_jack.c b/sound/pci/hda/hda_jack.c
index 1ea42447278f..bf0255cb0515 100644
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
@@ -55,19 +55,20 @@ static u32 read_pin_sense(struct hda_codec *codec, hda_nid_t nid)
 					AC_VERB_SET_PIN_SENSE, 0);
 	}
 	val = snd_hda_codec_read(codec, nid, 0,
-				  AC_VERB_GET_PIN_SENSE, 0);
+				  AC_VERB_GET_PIN_SENSE, dev_id);
 	if (codec->inv_jack_detect)
 		val ^= AC_PINSENSE_PRESENCE;
 	return val;
 }
 
 /**
- * snd_hda_jack_tbl_get - query the jack-table entry for the given NID
+ * snd_hda_jack_tbl_get_mst - query the jack-table entry for the given NID
  * @codec: the HDA codec
  * @nid: pin NID to refer to
+ * @dev_id: pin device entry id
  */
 struct hda_jack_tbl *
-snd_hda_jack_tbl_get(struct hda_codec *codec, hda_nid_t nid)
+snd_hda_jack_tbl_get_mst(struct hda_codec *codec, hda_nid_t nid, int dev_id)
 {
 	struct hda_jack_tbl *jack = codec->jacktbl.list;
 	int i;
@@ -75,19 +76,21 @@ snd_hda_jack_tbl_get(struct hda_codec *codec, hda_nid_t nid)
 	if (!nid || !jack)
 		return NULL;
 	for (i = 0; i < codec->jacktbl.used; i++, jack++)
-		if (jack->nid == nid)
+		if (jack->nid == nid && jack->dev_id == dev_id)
 			return jack;
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(snd_hda_jack_tbl_get);
+EXPORT_SYMBOL_GPL(snd_hda_jack_tbl_get_mst);
 
 /**
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
@@ -95,29 +98,62 @@ snd_hda_jack_tbl_get_from_tag(struct hda_codec *codec, unsigned char tag)
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
+	struct hda_jack_tbl *jack =
+		snd_hda_jack_tbl_get_mst(codec, nid, dev_id);
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
+	if (existing_nid_jack) {
+		jack->tag = existing_nid_jack->tag;
+
+		/*
+		 * Copy jack_detect from existing_nid_jack to avoid
+		 * snd_hda_jack_detect_enable_callback_mst() making multiple
+		 * SET_UNSOLICITED_ENABLE calls on the same pin.
+		 */
+		jack->jack_detect = existing_nid_jack->jack_detect;
+	} else {
+		jack->tag = codec->jacktbl.used;
+	}
+
 	return jack;
 }
 
@@ -153,10 +189,12 @@ static void jack_detect_update(struct hda_codec *codec,
 	if (jack->phantom_jack)
 		jack->pin_sense = AC_PINSENSE_PRESENCE;
 	else
-		jack->pin_sense = read_pin_sense(codec, jack->nid);
+		jack->pin_sense = read_pin_sense(codec, jack->nid,
+						 jack->dev_id);
 
 	/* A gating jack indicates the jack is invalid if gating is unplugged */
-	if (jack->gating_jack && !snd_hda_jack_detect(codec, jack->gating_jack))
+	if (jack->gating_jack &&
+	    !snd_hda_jack_detect_mst(codec, jack->gating_jack, jack->dev_id))
 		jack->pin_sense &= ~AC_PINSENSE_PRESENCE;
 
 	jack->jack_dirty = 0;
@@ -164,7 +202,8 @@ static void jack_detect_update(struct hda_codec *codec,
 	/* If a jack is gated by this one update it. */
 	if (jack->gated_jack) {
 		struct hda_jack_tbl *gated =
-			snd_hda_jack_tbl_get(codec, jack->gated_jack);
+			snd_hda_jack_tbl_get_mst(codec, jack->gated_jack,
+						 jack->dev_id);
 		if (gated) {
 			gated->jack_dirty = 1;
 			jack_detect_update(codec, gated);
@@ -198,56 +237,62 @@ EXPORT_SYMBOL_GPL(snd_hda_jack_set_dirty_all);
  * Execute necessary pin sense measurement and return its Presence Detect,
  * Impedance, ELD Valid etc. status bits.
  */
-u32 snd_hda_jack_pin_sense(struct hda_codec *codec, hda_nid_t nid)
+u32 snd_hda_jack_pin_sense(struct hda_codec *codec, hda_nid_t nid, int dev_id)
 {
-	struct hda_jack_tbl *jack = snd_hda_jack_tbl_get(codec, nid);
+	struct hda_jack_tbl *jack =
+		snd_hda_jack_tbl_get_mst(codec, nid, dev_id);
 	if (jack) {
 		jack_detect_update(codec, jack);
 		return jack->pin_sense;
 	}
-	return read_pin_sense(codec, nid);
+	return read_pin_sense(codec, nid, dev_id);
 }
 EXPORT_SYMBOL_GPL(snd_hda_jack_pin_sense);
 
 /**
- * snd_hda_jack_detect_state - query pin Presence Detect status
+ * snd_hda_jack_detect_state_mst - query pin Presence Detect status
  * @codec: the CODEC to sense
  * @nid: the pin NID to sense
+ * @dev_id: pin device entry id
  *
  * Query and return the pin's Presence Detect status, as either
  * HDA_JACK_NOT_PRESENT, HDA_JACK_PRESENT or HDA_JACK_PHANTOM.
  */
-int snd_hda_jack_detect_state(struct hda_codec *codec, hda_nid_t nid)
+int snd_hda_jack_detect_state_mst(struct hda_codec *codec,
+				  hda_nid_t nid, int dev_id)
 {
-	struct hda_jack_tbl *jack = snd_hda_jack_tbl_get(codec, nid);
+	struct hda_jack_tbl *jack =
+		snd_hda_jack_tbl_get_mst(codec, nid, dev_id);
 	if (jack && jack->phantom_jack)
 		return HDA_JACK_PHANTOM;
-	else if (snd_hda_jack_pin_sense(codec, nid) & AC_PINSENSE_PRESENCE)
+	else if (snd_hda_jack_pin_sense(codec, nid, dev_id) &
+		 AC_PINSENSE_PRESENCE)
 		return HDA_JACK_PRESENT;
 	else
 		return HDA_JACK_NOT_PRESENT;
 }
-EXPORT_SYMBOL_GPL(snd_hda_jack_detect_state);
+EXPORT_SYMBOL_GPL(snd_hda_jack_detect_state_mst);
 
 /**
- * snd_hda_jack_detect_enable - enable the jack-detection
+ * snd_hda_jack_detect_enable_mst - enable the jack-detection
  * @codec: the HDA codec
  * @nid: pin NID to enable
  * @func: callback function to register
+ * @dev_id: pin device entry id
  *
  * In the case of error, the return value will be a pointer embedded with
  * errno.  Check and handle the return value appropriately with standard
  * macros such as @IS_ERR() and @PTR_ERR().
  */
 struct hda_jack_callback *
-snd_hda_jack_detect_enable_callback(struct hda_codec *codec, hda_nid_t nid,
-				    hda_jack_callback_fn func)
+snd_hda_jack_detect_enable_callback_mst(struct hda_codec *codec, hda_nid_t nid,
+					int dev_id, hda_jack_callback_fn func)
 {
 	struct hda_jack_tbl *jack;
 	struct hda_jack_callback *callback = NULL;
 	int err;
 
-	jack = snd_hda_jack_tbl_new(codec, nid);
+	jack = snd_hda_jack_tbl_new(codec, nid, dev_id);
 	if (!jack)
 		return ERR_PTR(-ENOMEM);
 	if (func) {
@@ -256,6 +301,7 @@ snd_hda_jack_detect_enable_callback(struct hda_codec *codec, hda_nid_t nid,
 			return ERR_PTR(-ENOMEM);
 		callback->func = func;
 		callback->nid = jack->nid;
+		callback->dev_id = jack->dev_id;
 		callback->next = jack->callback;
 		jack->callback = callback;
 	}
@@ -272,19 +318,24 @@ snd_hda_jack_detect_enable_callback(struct hda_codec *codec, hda_nid_t nid,
 		return ERR_PTR(err);
 	return callback;
 }
-EXPORT_SYMBOL_GPL(snd_hda_jack_detect_enable_callback);
+EXPORT_SYMBOL_GPL(snd_hda_jack_detect_enable_callback_mst);
 
 /**
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
+	return PTR_ERR_OR_ZERO(snd_hda_jack_detect_enable_callback_mst(codec,
+								       nid,
+								       dev_id,
+								       NULL));
 }
 EXPORT_SYMBOL_GPL(snd_hda_jack_detect_enable);
 
@@ -299,8 +350,11 @@ EXPORT_SYMBOL_GPL(snd_hda_jack_detect_enable);
 int snd_hda_jack_set_gating_jack(struct hda_codec *codec, hda_nid_t gated_nid,
 				 hda_nid_t gating_nid)
 {
-	struct hda_jack_tbl *gated = snd_hda_jack_tbl_new(codec, gated_nid);
-	struct hda_jack_tbl *gating = snd_hda_jack_tbl_new(codec, gating_nid);
+	struct hda_jack_tbl *gated = snd_hda_jack_tbl_new(codec, gated_nid, 0);
+	struct hda_jack_tbl *gating =
+		snd_hda_jack_tbl_new(codec, gating_nid, 0);
+
+	WARN_ON(codec->dp_mst);
 
 	if (!gated || !gating)
 		return -EINVAL;
@@ -376,9 +430,10 @@ static void hda_free_jack_priv(struct snd_jack *jack)
 }
 
 /**
- * snd_hda_jack_add_kctl - Add a kctl for the given pin
+ * snd_hda_jack_add_kctl_mst - Add a kctl for the given pin
  * @codec: the HDA codec
  * @nid: pin NID to assign
+ * @dev_id : pin device entry id
  * @name: string name for the jack
  * @phantom_jack: flag to deal as a phantom jack
  * @type: jack type bits to be reported, 0 for guessing from pincfg
@@ -387,15 +442,15 @@ static void hda_free_jack_priv(struct snd_jack *jack)
  * This assigns a jack-detection kctl to the given pin.  The kcontrol
  * will have the given name and index.
  */
-int snd_hda_jack_add_kctl(struct hda_codec *codec, hda_nid_t nid,
-			  const char *name, bool phantom_jack,
-			  int type, const struct hda_jack_keymap *keymap)
+int snd_hda_jack_add_kctl_mst(struct hda_codec *codec, hda_nid_t nid,
+			      int dev_id, const char *name, bool phantom_jack,
+			      int type, const struct hda_jack_keymap *keymap)
 {
 	struct hda_jack_tbl *jack;
 	const struct hda_jack_keymap *map;
 	int err, state, buttons;
 
-	jack = snd_hda_jack_tbl_new(codec, nid);
+	jack = snd_hda_jack_tbl_new(codec, nid, dev_id);
 	if (!jack)
 		return 0;
 	if (jack->jack)
@@ -425,12 +480,12 @@ int snd_hda_jack_add_kctl(struct hda_codec *codec, hda_nid_t nid,
 			snd_jack_set_key(jack->jack, map->type, map->key);
 	}
 
-	state = snd_hda_jack_detect(codec, nid);
+	state = snd_hda_jack_detect_mst(codec, nid, dev_id);
 	snd_jack_report(jack->jack, state ? jack->type : 0);
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_hda_jack_add_kctl);
+EXPORT_SYMBOL_GPL(snd_hda_jack_add_kctl_mst);
 
 static int add_jack_kctl(struct hda_codec *codec, hda_nid_t nid,
 			 const struct auto_pin_cfg *cfg,
@@ -441,6 +496,8 @@ static int add_jack_kctl(struct hda_codec *codec, hda_nid_t nid,
 	int err;
 	bool phantom_jack;
 
+	WARN_ON(codec->dp_mst);
+
 	if (!nid)
 		return 0;
 	def_conf = snd_hda_codec_get_pincfg(codec, nid);
@@ -462,7 +519,7 @@ static int add_jack_kctl(struct hda_codec *codec, hda_nid_t nid,
 		return err;
 
 	if (!phantom_jack)
-		return snd_hda_jack_detect_enable(codec, nid);
+		return snd_hda_jack_detect_enable(codec, nid, 0);
 	return 0;
 }
 
@@ -540,7 +597,8 @@ static void call_jack_callback(struct hda_codec *codec, unsigned int res,
 	}
 	if (jack->gated_jack) {
 		struct hda_jack_tbl *gated =
-			snd_hda_jack_tbl_get(codec, jack->gated_jack);
+			snd_hda_jack_tbl_get_mst(codec, jack->gated_jack,
+						 jack->dev_id);
 		if (gated) {
 			for (cb = gated->callback; cb; cb = cb->next) {
 				cb->jack = gated;
@@ -561,7 +619,14 @@ void snd_hda_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 	struct hda_jack_tbl *event;
 	int tag = (res & AC_UNSOL_RES_TAG) >> AC_UNSOL_RES_TAG_SHIFT;
 
-	event = snd_hda_jack_tbl_get_from_tag(codec, tag);
+	if (codec->dp_mst) {
+		int dev_entry =
+			(res & AC_UNSOL_RES_DE) >> AC_UNSOL_RES_DE_SHIFT;
+
+		event = snd_hda_jack_tbl_get_from_tag(codec, tag, dev_entry);
+	} else {
+		event = snd_hda_jack_tbl_get_from_tag(codec, tag, 0);
+	}
 	if (!event)
 		return;
 	event->jack_dirty = 1;
diff --git a/sound/pci/hda/hda_jack.h b/sound/pci/hda/hda_jack.h
index cd9b47f51fab..727b6d3ba454 100644
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
@@ -49,46 +51,129 @@ struct hda_jack_keymap {
 };
 
 struct hda_jack_tbl *
-snd_hda_jack_tbl_get(struct hda_codec *codec, hda_nid_t nid);
+snd_hda_jack_tbl_get_mst(struct hda_codec *codec, hda_nid_t nid, int dev_id);
+
+/**
+ * snd_hda_jack_tbl_get - query the jack-table entry for the given NID
+ * @codec: the HDA codec
+ * @nid: pin NID to refer to
+ */
+static inline struct hda_jack_tbl *
+snd_hda_jack_tbl_get(struct hda_codec *codec, hda_nid_t nid)
+{
+	return snd_hda_jack_tbl_get_mst(codec, nid, 0);
+}
+
 struct hda_jack_tbl *
-snd_hda_jack_tbl_get_from_tag(struct hda_codec *codec, unsigned char tag);
+snd_hda_jack_tbl_get_from_tag(struct hda_codec *codec,
+			      unsigned char tag, int dev_id);
 
 void snd_hda_jack_tbl_clear(struct hda_codec *codec);
 
 void snd_hda_jack_set_dirty_all(struct hda_codec *codec);
 
-int snd_hda_jack_detect_enable(struct hda_codec *codec, hda_nid_t nid);
+int snd_hda_jack_detect_enable(struct hda_codec *codec, hda_nid_t nid,
+			       int dev_id);
+
 struct hda_jack_callback *
+snd_hda_jack_detect_enable_callback_mst(struct hda_codec *codec, hda_nid_t nid,
+					int dev_id, hda_jack_callback_fn cb);
+
+/**
+ * snd_hda_jack_detect_enable - enable the jack-detection
+ * @codec: the HDA codec
+ * @nid: pin NID to enable
+ * @func: callback function to register
+ *
+ * In the case of error, the return value will be a pointer embedded with
+ * errno.  Check and handle the return value appropriately with standard
+ * macros such as @IS_ERR() and @PTR_ERR().
+ */
+static inline struct hda_jack_callback *
 snd_hda_jack_detect_enable_callback(struct hda_codec *codec, hda_nid_t nid,
-				    hda_jack_callback_fn cb);
+				    hda_jack_callback_fn cb)
+{
+	return snd_hda_jack_detect_enable_callback_mst(codec, nid, 0, cb);
+}
 
 int snd_hda_jack_set_gating_jack(struct hda_codec *codec, hda_nid_t gated_nid,
 				 hda_nid_t gating_nid);
 
-u32 snd_hda_jack_pin_sense(struct hda_codec *codec, hda_nid_t nid);
+u32 snd_hda_jack_pin_sense(struct hda_codec *codec, hda_nid_t nid, int dev_id);
 
 /* the jack state returned from snd_hda_jack_detect_state() */
 enum {
 	HDA_JACK_NOT_PRESENT, HDA_JACK_PRESENT, HDA_JACK_PHANTOM,
 };
 
-int snd_hda_jack_detect_state(struct hda_codec *codec, hda_nid_t nid);
+int snd_hda_jack_detect_state_mst(struct hda_codec *codec, hda_nid_t nid,
+				  int dev_id);
+
+/**
+ * snd_hda_jack_detect_state - query pin Presence Detect status
+ * @codec: the CODEC to sense
+ * @nid: the pin NID to sense
+ *
+ * Query and return the pin's Presence Detect status, as either
+ * HDA_JACK_NOT_PRESENT, HDA_JACK_PRESENT or HDA_JACK_PHANTOM.
+ */
+static inline int
+snd_hda_jack_detect_state(struct hda_codec *codec, hda_nid_t nid)
+{
+	return snd_hda_jack_detect_state_mst(codec, nid, 0);
+}
+
+/**
+ * snd_hda_jack_detect_mst - Detect the jack
+ * @codec: the HDA codec
+ * @nid: pin NID to check jack detection
+ * @dev_id: pin device entry id
+ */
+static inline bool
+snd_hda_jack_detect_mst(struct hda_codec *codec, hda_nid_t nid, int dev_id)
+{
+	return snd_hda_jack_detect_state_mst(codec, nid, dev_id) !=
+			HDA_JACK_NOT_PRESENT;
+}
 
 /**
  * snd_hda_jack_detect - Detect the jack
  * @codec: the HDA codec
  * @nid: pin NID to check jack detection
  */
-static inline bool snd_hda_jack_detect(struct hda_codec *codec, hda_nid_t nid)
+static inline bool
+snd_hda_jack_detect(struct hda_codec *codec, hda_nid_t nid)
 {
-	return snd_hda_jack_detect_state(codec, nid) != HDA_JACK_NOT_PRESENT;
+	return snd_hda_jack_detect_mst(codec, nid, 0);
 }
 
 bool is_jack_detectable(struct hda_codec *codec, hda_nid_t nid);
 
-int snd_hda_jack_add_kctl(struct hda_codec *codec, hda_nid_t nid,
-			  const char *name, bool phantom_jack,
-			  int type, const struct hda_jack_keymap *keymap);
+int snd_hda_jack_add_kctl_mst(struct hda_codec *codec, hda_nid_t nid,
+			      int dev_id, const char *name, bool phantom_jack,
+			      int type, const struct hda_jack_keymap *keymap);
+
+/**
+ * snd_hda_jack_add_kctl - Add a kctl for the given pin
+ * @codec: the HDA codec
+ * @nid: pin NID to assign
+ * @name: string name for the jack
+ * @phantom_jack: flag to deal as a phantom jack
+ * @type: jack type bits to be reported, 0 for guessing from pincfg
+ * @keymap: optional jack / key mapping
+ *
+ * This assigns a jack-detection kctl to the given pin.  The kcontrol
+ * will have the given name and index.
+ */
+static inline int
+snd_hda_jack_add_kctl(struct hda_codec *codec, hda_nid_t nid,
+		      const char *name, bool phantom_jack,
+		      int type, const struct hda_jack_keymap *keymap)
+{
+	return snd_hda_jack_add_kctl_mst(codec, nid, 0,
+					 name, phantom_jack, type, keymap);
+}
+
 int snd_hda_jack_add_kctls(struct hda_codec *codec,
 			   const struct auto_pin_cfg *cfg);
 
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index c1eee2274fb5..84d410a93ed8 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -774,34 +774,32 @@ static void jack_callback(struct hda_codec *codec,
 	if (codec_has_acomp(codec))
 		return;
 
-	/* hda_jack don't support DP MST */
-	check_presence_and_report(codec, jack->nid, 0);
+	check_presence_and_report(codec, jack->nid, jack->dev_id);
 }
 
 static void hdmi_intrinsic_event(struct hda_codec *codec, unsigned int res)
 {
 	int tag = res >> AC_UNSOL_RES_TAG_SHIFT;
 	struct hda_jack_tbl *jack;
-	int dev_entry = (res & AC_UNSOL_RES_DE) >> AC_UNSOL_RES_DE_SHIFT;
 
-	/*
-	 * assume DP MST uses dyn_pcm_assign and acomp and
-	 * never comes here
-	 * if DP MST supports unsol event, below code need
-	 * consider dev_entry
-	 */
-	jack = snd_hda_jack_tbl_get_from_tag(codec, tag);
+	if (codec->dp_mst) {
+		int dev_entry =
+			(res & AC_UNSOL_RES_DE) >> AC_UNSOL_RES_DE_SHIFT;
+
+		jack = snd_hda_jack_tbl_get_from_tag(codec, tag, dev_entry);
+	} else {
+		jack = snd_hda_jack_tbl_get_from_tag(codec, tag, 0);
+	}
 	if (!jack)
 		return;
 	jack->jack_dirty = 1;
 
 	codec_dbg(codec,
 		"HDMI hot plug event: Codec=%d Pin=%d Device=%d Inactive=%d Presence_Detect=%d ELD_Valid=%d\n",
-		codec->addr, jack->nid, dev_entry, !!(res & AC_UNSOL_RES_IA),
+		codec->addr, jack->nid, jack->dev_id, !!(res & AC_UNSOL_RES_IA),
 		!!(res & AC_UNSOL_RES_PD), !!(res & AC_UNSOL_RES_ELDV));
 
-	/* hda_jack don't support DP MST */
-	check_presence_and_report(codec, jack->nid, 0);
+	check_presence_and_report(codec, jack->nid, jack->dev_id);
 }
 
 static void hdmi_non_intrinsic_event(struct hda_codec *codec, unsigned int res)
@@ -831,11 +829,21 @@ static void hdmi_unsol_event(struct hda_codec *codec, unsigned int res)
 {
 	int tag = res >> AC_UNSOL_RES_TAG_SHIFT;
 	int subtag = (res & AC_UNSOL_RES_SUBTAG) >> AC_UNSOL_RES_SUBTAG_SHIFT;
+	struct hda_jack_tbl *jack;
 
 	if (codec_has_acomp(codec))
 		return;
 
-	if (!snd_hda_jack_tbl_get_from_tag(codec, tag)) {
+	if (codec->dp_mst) {
+		int dev_entry =
+			(res & AC_UNSOL_RES_DE) >> AC_UNSOL_RES_DE_SHIFT;
+
+		jack = snd_hda_jack_tbl_get_from_tag(codec, tag, dev_entry);
+	} else {
+		jack = snd_hda_jack_tbl_get_from_tag(codec, tag, 0);
+	}
+
+	if (!jack) {
 		codec_dbg(codec, "Unexpected HDMI event tag 0x%x\n", tag);
 		return;
 	}
@@ -1521,7 +1529,7 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	bool ret;
 	bool do_repoll = false;
 
-	present = snd_hda_jack_pin_sense(codec, pin_nid);
+	present = snd_hda_jack_pin_sense(codec, pin_nid, per_pin->dev_id);
 
 	mutex_lock(&per_pin->lock);
 	eld->monitor_present = !!(present & AC_PINSENSE_PRESENCE);
@@ -1554,7 +1562,7 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 
 	ret = !repoll || !eld->monitor_present || eld->eld_valid;
 
-	jack = snd_hda_jack_tbl_get(codec, pin_nid);
+	jack = snd_hda_jack_tbl_get_mst(codec, pin_nid, per_pin->dev_id);
 	if (jack) {
 		jack->block_report = !ret;
 		jack->pin_sense = (eld->monitor_present && eld->eld_valid) ?
@@ -1585,7 +1593,8 @@ static struct snd_jack *pin_idx_to_jack(struct hda_codec *codec,
 		 * DP MST will use dyn_pcm_assign,
 		 * so DP MST will never come here
 		 */
-		jack_tbl = snd_hda_jack_tbl_get(codec, per_pin->pin_nid);
+		jack_tbl = snd_hda_jack_tbl_get_mst(codec, per_pin->pin_nid,
+						    per_pin->dev_id);
 		if (jack_tbl)
 			jack = jack_tbl->jack;
 	}
@@ -1666,7 +1675,8 @@ static void hdmi_repoll_eld(struct work_struct *work)
 	struct hdmi_spec *spec = codec->spec;
 	struct hda_jack_tbl *jack;
 
-	jack = snd_hda_jack_tbl_get(codec, per_pin->pin_nid);
+	jack = snd_hda_jack_tbl_get_mst(codec, per_pin->pin_nid,
+					per_pin->dev_id);
 	if (jack)
 		jack->jack_dirty = 1;
 
@@ -2158,11 +2168,13 @@ static int generic_hdmi_build_jack(struct hda_codec *codec, int pcm_idx)
 	if (phantom_jack)
 		strncat(hdmi_str, " Phantom",
 			sizeof(hdmi_str) - strlen(hdmi_str) - 1);
-	ret = snd_hda_jack_add_kctl(codec, per_pin->pin_nid, hdmi_str,
-				    phantom_jack, 0, NULL);
+	ret = snd_hda_jack_add_kctl_mst(codec, per_pin->pin_nid,
+					per_pin->dev_id, hdmi_str, phantom_jack,
+					0, NULL);
 	if (ret < 0)
 		return ret;
-	jack = snd_hda_jack_tbl_get(codec, per_pin->pin_nid);
+	jack = snd_hda_jack_tbl_get_mst(codec, per_pin->pin_nid,
+					per_pin->dev_id);
 	if (jack == NULL)
 		return 0;
 	/* assign jack->jack to pcm_rec[].jack to
@@ -2271,10 +2283,11 @@ static int generic_hdmi_init(struct hda_codec *codec)
 		if (codec_has_acomp(codec))
 			continue;
 		if (spec->use_jack_detect)
-			snd_hda_jack_detect_enable(codec, pin_nid);
+			snd_hda_jack_detect_enable(codec, pin_nid, dev_id);
 		else
-			snd_hda_jack_detect_enable_callback(codec, pin_nid,
-							    jack_callback);
+			snd_hda_jack_detect_enable_callback_mst(codec, pin_nid,
+								dev_id,
+								jack_callback);
 	}
 	mutex_unlock(&spec->bind_lock);
 	return 0;
@@ -2424,11 +2437,11 @@ static int patch_generic_hdmi(struct hda_codec *codec)
 
 /* turn on / off the unsol event jack detection dynamically */
 static void reprogram_jack_detect(struct hda_codec *codec, hda_nid_t nid,
-				  bool use_acomp)
+				  int dev_id, bool use_acomp)
 {
 	struct hda_jack_tbl *tbl;
 
-	tbl = snd_hda_jack_tbl_get(codec, nid);
+	tbl = snd_hda_jack_tbl_get_mst(codec, nid, dev_id);
 	if (tbl) {
 		/* clear unsol even if component notifier is used, or re-enable
 		 * if notifier is cleared
@@ -2441,7 +2454,7 @@ static void reprogram_jack_detect(struct hda_codec *codec, hda_nid_t nid,
 		 * at need (i.e. only when notifier is cleared)
 		 */
 		if (!use_acomp)
-			snd_hda_jack_detect_enable(codec, nid);
+			snd_hda_jack_detect_enable(codec, nid, dev_id);
 	}
 }
 
@@ -2461,6 +2474,7 @@ static void generic_acomp_notifier_set(struct drm_audio_component *acomp,
 		for (i = 0; i < spec->num_pins; i++)
 			reprogram_jack_detect(spec->codec,
 					      get_pin(spec, i)->pin_nid,
+					      get_pin(spec, i)->dev_id,
 					      use_acomp);
 	}
 	mutex_unlock(&spec->bind_lock);
@@ -2968,7 +2982,7 @@ static int simple_playback_init(struct hda_codec *codec)
 	if (get_wcaps(codec, pin) & AC_WCAP_OUT_AMP)
 		snd_hda_codec_write(codec, pin, 0, AC_VERB_SET_AMP_GAIN_MUTE,
 				    AMP_OUT_UNMUTE);
-	snd_hda_jack_detect_enable(codec, pin);
+	snd_hda_jack_detect_enable(codec, pin, per_pin->dev_id);
 	return 0;
 }
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
