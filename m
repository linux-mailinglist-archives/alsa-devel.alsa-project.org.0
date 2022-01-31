Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F574A3E69
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jan 2022 08:58:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 372C41630;
	Mon, 31 Jan 2022 08:58:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 372C41630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643615934;
	bh=aRwL28NqNoZQ4WkKZ5nunS1/rJeXBxLKUjOfjHmQ2qc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=M30IDeV/CPDb01ybXymz+KpU5eiBbuRXtuDUDC7bEJ8DB4Bg2p1vA361Jpxf56wcv
	 w+2Kf0OIsOmlLKoBCFzwVQcfzMQ9UK7FPiX6u5KHOQdxgGwzSFffVql1VxscXxTD25
	 w0BkMfHXwhNL/kvghXF9KTcQ1/8H4iKtOeBj+Xo4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97109F80302;
	Mon, 31 Jan 2022 08:57:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53777F800FF; Mon, 31 Jan 2022 08:57:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E87DF800FF
 for <alsa-devel@alsa-project.org>; Mon, 31 Jan 2022 08:57:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E87DF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="yX3i4fam"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="GcFleSFE"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9DF26212B9;
 Mon, 31 Jan 2022 07:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643615859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JhHMZtNoVM6Xhy79Kwjn4pqOjmO+e0lWMYiMyyefCyg=;
 b=yX3i4famw8Sgl66MSIJE1nPtrQteRaGDjpxihXbjPdDGJU+fGSmOWsLuLIFJJiiGV+xqjj
 CHMwyvSXCNItH23emoKCNdby2AFQYHMoD3VG6AoYyIh36my4fcn147LXTszy9GlrXuRubO
 ltKTdZSuuYwVpxJ7oRLqhC1SNcIqbso=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643615859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=JhHMZtNoVM6Xhy79Kwjn4pqOjmO+e0lWMYiMyyefCyg=;
 b=GcFleSFEVSqOwwkp1sfzeAXnDPULMZponA4ITk07iG6ek+k5NeLVLzaJpTxeDmbHpv9BAq
 u8cAMssaRrAu24Ag==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 8BDA5A3B84;
 Mon, 31 Jan 2022 07:57:39 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: realtek: Fix race at concurrent COEF updates
Date: Mon, 31 Jan 2022 08:57:38 +0100
Message-Id: <20220131075738.24323-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alexander Sergeyev <sergeev917@gmail.com>
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

The COEF access is done with two steps: setting the index then read or
write the data.  When multiple COEF accesses are performed
concurrently, the index and data might be paired unexpectedly.
In most cases, this isn't a big problem as the COEF setup is done at
the initialization, but some dynamic changes like the mute LED may hit
such a race.

For avoiding the racy COEF accesses, this patch introduces a new
mutex coef_mutex to alc_spec, and wrap the COEF accessing functions
with it.

Reported-by: Alexander Sergeyev <sergeev917@gmail.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/20220111195229.a77wrpjclqwrx4bx@localhost.localdomain
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 61 ++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 11 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 668274e52674..a5677be0a405 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -98,6 +98,7 @@ struct alc_spec {
 	unsigned int gpio_mic_led_mask;
 	struct alc_coef_led mute_led_coef;
 	struct alc_coef_led mic_led_coef;
+	struct mutex coef_mutex;
 
 	hda_nid_t headset_mic_pin;
 	hda_nid_t headphone_mic_pin;
@@ -137,8 +138,8 @@ struct alc_spec {
  * COEF access helper functions
  */
 
-static int alc_read_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
-			       unsigned int coef_idx)
+static int __alc_read_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
+				 unsigned int coef_idx)
 {
 	unsigned int val;
 
@@ -147,28 +148,61 @@ static int alc_read_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
 	return val;
 }
 
+static int alc_read_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
+			       unsigned int coef_idx)
+{
+	struct alc_spec *spec = codec->spec;
+	unsigned int val;
+
+	mutex_lock(&spec->coef_mutex);
+	val = __alc_read_coefex_idx(codec, nid, coef_idx);
+	mutex_unlock(&spec->coef_mutex);
+	return val;
+}
+
 #define alc_read_coef_idx(codec, coef_idx) \
 	alc_read_coefex_idx(codec, 0x20, coef_idx)
 
-static void alc_write_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
-				 unsigned int coef_idx, unsigned int coef_val)
+static void __alc_write_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
+				   unsigned int coef_idx, unsigned int coef_val)
 {
 	snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_COEF_INDEX, coef_idx);
 	snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_PROC_COEF, coef_val);
 }
 
+static void alc_write_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
+				 unsigned int coef_idx, unsigned int coef_val)
+{
+	struct alc_spec *spec = codec->spec;
+
+	mutex_lock(&spec->coef_mutex);
+	__alc_write_coefex_idx(codec, nid, coef_idx, coef_val);
+	mutex_unlock(&spec->coef_mutex);
+}
+
 #define alc_write_coef_idx(codec, coef_idx, coef_val) \
 	alc_write_coefex_idx(codec, 0x20, coef_idx, coef_val)
 
+static void __alc_update_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
+				    unsigned int coef_idx, unsigned int mask,
+				    unsigned int bits_set)
+{
+	unsigned int val = __alc_read_coefex_idx(codec, nid, coef_idx);
+
+	if (val != -1)
+		__alc_write_coefex_idx(codec, nid, coef_idx,
+				       (val & ~mask) | bits_set);
+}
+
 static void alc_update_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
 				  unsigned int coef_idx, unsigned int mask,
 				  unsigned int bits_set)
 {
-	unsigned int val = alc_read_coefex_idx(codec, nid, coef_idx);
+	struct alc_spec *spec = codec->spec;
 
-	if (val != -1)
-		alc_write_coefex_idx(codec, nid, coef_idx,
-				     (val & ~mask) | bits_set);
+	mutex_lock(&spec->coef_mutex);
+	__alc_update_coefex_idx(codec, nid, coef_idx, mask, bits_set);
+	mutex_unlock(&spec->coef_mutex);
 }
 
 #define alc_update_coef_idx(codec, coef_idx, mask, bits_set)	\
@@ -201,13 +235,17 @@ struct coef_fw {
 static void alc_process_coef_fw(struct hda_codec *codec,
 				const struct coef_fw *fw)
 {
+	struct alc_spec *spec = codec->spec;
+
+	mutex_lock(&spec->coef_mutex);
 	for (; fw->nid; fw++) {
 		if (fw->mask == (unsigned short)-1)
-			alc_write_coefex_idx(codec, fw->nid, fw->idx, fw->val);
+			__alc_write_coefex_idx(codec, fw->nid, fw->idx, fw->val);
 		else
-			alc_update_coefex_idx(codec, fw->nid, fw->idx,
-					      fw->mask, fw->val);
+			__alc_update_coefex_idx(codec, fw->nid, fw->idx,
+						fw->mask, fw->val);
 	}
+	mutex_unlock(&spec->coef_mutex);
 }
 
 /*
@@ -1153,6 +1191,7 @@ static int alc_alloc_spec(struct hda_codec *codec, hda_nid_t mixer_nid)
 	codec->spdif_status_reset = 1;
 	codec->forced_resume = 1;
 	codec->patch_ops = alc_patch_ops;
+	mutex_init(&spec->coef_mutex);
 
 	err = alc_codec_rename_from_preset(codec);
 	if (err < 0) {
-- 
2.31.1

