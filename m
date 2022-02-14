Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5EC4B5108
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 14:05:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41ECA1767;
	Mon, 14 Feb 2022 14:04:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41ECA1767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644843938;
	bh=xdxIjiqOGOnqG1esxtzAPtgpschni9BAAC7rbq6X7xo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q2DC6lGjJYA1XYCUe4fMdjck2YwWBRxlC+J+i0PxzNhSyD0w9wkFYQZeJZYfbjhiT
	 roqWfREP7936ZxwuI4Wsx3e16+422LjQRoepzqKl3V3a79CSycyEsZHDJdDHwd2rOX
	 c+nF93Z7M6Ny0J6UeEtt8Nq1XO/ksRKISQJawsIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84428F80430;
	Mon, 14 Feb 2022 14:04:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB34EF80310; Mon, 14 Feb 2022 14:04:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5330F800D8
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 14:04:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5330F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="NmrmFgfs"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="DIGwCl2p"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 94531210E6;
 Mon, 14 Feb 2022 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644843851; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9K4NjcCoyd1LM9QiTIF28hEP8naBuXj/X3Zd4w906PY=;
 b=NmrmFgfsOfiMFe5mF68tZmupS6e622RBcA6c9J6X+f+smzyYycc+qcO8b53hOtCu2oSWD4
 UW9CG8iKhzyRwFgN8sokiKj5tnk/KL3evwKL3B271UU0naNJrrKE1TQSHnCW9UIiWgULUg
 kx+Tg5qDSe1xLyMshEGTMJRpcDpVsS4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644843851;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9K4NjcCoyd1LM9QiTIF28hEP8naBuXj/X3Zd4w906PY=;
 b=DIGwCl2pnTTXTKdcnqu8oH/3lIiryCpOOQeZkhoOZwa6oyfbXM+gErfoicQsoKkXx9XfdJ
 f8F1PnvqmaKTjqAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 8EBBAA3B84;
 Mon, 14 Feb 2022 13:04:11 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Fix deadlock by COEF mutex
Date: Mon, 14 Feb 2022 14:04:10 +0100
Message-Id: <20220214130410.21230-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Julian Wollrath <jwollrath@web.de>
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

The recently introduced coef_mutex for Realtek codec seems causing a
deadlock when the relevant code is invoked from the power-off state;
then the HD-audio core tries to power-up internally, and this kicks
off the codec runtime PM code that tries to take the same coef_mutex.

In order to avoid the deadlock, do the temporary power up/down around
the coef_mutex acquisition and release.  This assures that the
power-up sequence runs before the mutex, hence no re-entrance will
happen.

Fixes: b837a9f5ab3b ("ALSA: hda: realtek: Fix race at concurrent COEF updates")
Reported-and-tested-by: Julian Wollrath <jwollrath@web.de>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/20220214132838.4db10fca@schienar
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 39 +++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 9473fb76ff19..3a42457984e9 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -138,6 +138,22 @@ struct alc_spec {
  * COEF access helper functions
  */
 
+static void coef_mutex_lock(struct hda_codec *codec)
+{
+	struct alc_spec *spec = codec->spec;
+
+	snd_hda_power_up_pm(codec);
+	mutex_lock(&spec->coef_mutex);
+}
+
+static void coef_mutex_unlock(struct hda_codec *codec)
+{
+	struct alc_spec *spec = codec->spec;
+
+	mutex_unlock(&spec->coef_mutex);
+	snd_hda_power_down_pm(codec);
+}
+
 static int __alc_read_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
 				 unsigned int coef_idx)
 {
@@ -151,12 +167,11 @@ static int __alc_read_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
 static int alc_read_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
 			       unsigned int coef_idx)
 {
-	struct alc_spec *spec = codec->spec;
 	unsigned int val;
 
-	mutex_lock(&spec->coef_mutex);
+	coef_mutex_lock(codec);
 	val = __alc_read_coefex_idx(codec, nid, coef_idx);
-	mutex_unlock(&spec->coef_mutex);
+	coef_mutex_unlock(codec);
 	return val;
 }
 
@@ -173,11 +188,9 @@ static void __alc_write_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
 static void alc_write_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
 				 unsigned int coef_idx, unsigned int coef_val)
 {
-	struct alc_spec *spec = codec->spec;
-
-	mutex_lock(&spec->coef_mutex);
+	coef_mutex_lock(codec);
 	__alc_write_coefex_idx(codec, nid, coef_idx, coef_val);
-	mutex_unlock(&spec->coef_mutex);
+	coef_mutex_unlock(codec);
 }
 
 #define alc_write_coef_idx(codec, coef_idx, coef_val) \
@@ -198,11 +211,9 @@ static void alc_update_coefex_idx(struct hda_codec *codec, hda_nid_t nid,
 				  unsigned int coef_idx, unsigned int mask,
 				  unsigned int bits_set)
 {
-	struct alc_spec *spec = codec->spec;
-
-	mutex_lock(&spec->coef_mutex);
+	coef_mutex_lock(codec);
 	__alc_update_coefex_idx(codec, nid, coef_idx, mask, bits_set);
-	mutex_unlock(&spec->coef_mutex);
+	coef_mutex_unlock(codec);
 }
 
 #define alc_update_coef_idx(codec, coef_idx, mask, bits_set)	\
@@ -235,9 +246,7 @@ struct coef_fw {
 static void alc_process_coef_fw(struct hda_codec *codec,
 				const struct coef_fw *fw)
 {
-	struct alc_spec *spec = codec->spec;
-
-	mutex_lock(&spec->coef_mutex);
+	coef_mutex_lock(codec);
 	for (; fw->nid; fw++) {
 		if (fw->mask == (unsigned short)-1)
 			__alc_write_coefex_idx(codec, fw->nid, fw->idx, fw->val);
@@ -245,7 +254,7 @@ static void alc_process_coef_fw(struct hda_codec *codec,
 			__alc_update_coefex_idx(codec, fw->nid, fw->idx,
 						fw->mask, fw->val);
 	}
-	mutex_unlock(&spec->coef_mutex);
+	coef_mutex_unlock(codec);
 }
 
 /*
-- 
2.31.1

