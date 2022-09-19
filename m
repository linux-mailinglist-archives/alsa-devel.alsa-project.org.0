Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A39115BCDB3
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 15:56:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37C27868;
	Mon, 19 Sep 2022 15:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37C27868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663595766;
	bh=ZeHIFsZX0wgAbro1Yu/dnWB/dd+j8iVyFrRtCDGPCqQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KnwTa+zcwF9g5BF4aUJRFwYk216Ty4B+2TakjXCYS20Xc4aLRQT3gw9a2t4m1Zzyy
	 ATBTYGEdTFn9qBD1LwKoZE+ppiXdtddC5zBmd7yRNS4c1RHVJEHbVJjIWVKo9RDiM0
	 doW56yviYietk65GIu5xqN0SpE2ezT2UFCAPPyj8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AF2FF8032B;
	Mon, 19 Sep 2022 15:55:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD19CF8023A; Mon, 19 Sep 2022 15:55:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48A13F80134
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 15:54:55 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3DEC8A0040;
 Mon, 19 Sep 2022 15:54:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3DEC8A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1663595694; bh=nfMv+XPgLINBOGWK7jrxpBQizLO2u4YHU+DXzk/0p6c=;
 h=From:To:Cc:Subject:Date:From;
 b=lXZa79HeinWplARwuTcrlUxG60o0LmEj0AJGNHG9bY08QaH3IWID09E+SC8mN0jsY
 tjOElw521dBhribWGgaNAFcNa0YGZvmxOcq3O15tWCcAEZxX/sauCI8limmJYEjZPf
 XGzLTXWTt8+nlCcrLwdDH7OvEVnXu9F+R898IVN0=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 19 Sep 2022 15:54:50 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: hda/hdmi: Fix the converter allocation for the silent
 stream
Date: Mon, 19 Sep 2022 15:54:44 +0200
Message-Id: <20220919135444.3554982-1-perex@perex.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Track the converters handling the silent stream using a new
variable to avoid mixing of the open/close and silent stream
use. This change ensures the proper allocation of the converters.

Fixes: 5f80d6bd2b01 ("ALSA: hda/hdmi: Fix the converter reuse for the silent stream")

Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/pci/hda/patch_hdmi.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 4576af4cff90..dc36af2928b7 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -54,6 +54,7 @@ MODULE_PARM_DESC(enable_all_pins, "Forcibly enable all pins");
 struct hdmi_spec_per_cvt {
 	hda_nid_t cvt_nid;
 	bool assigned;		/* the stream has been assigned */
+	bool silent_stream;	/* silent stream activated */
 	unsigned int channels_min;
 	unsigned int channels_max;
 	u32 rates;
@@ -977,7 +978,8 @@ static int hdmi_setup_stream(struct hda_codec *codec, hda_nid_t cvt_nid,
  * of the pin.
  */
 static int hdmi_choose_cvt(struct hda_codec *codec,
-			   int pin_idx, int *cvt_id)
+			   int pin_idx, int *cvt_id,
+			   bool silent)
 {
 	struct hdmi_spec *spec = codec->spec;
 	struct hdmi_spec_per_pin *per_pin;
@@ -992,6 +994,9 @@ static int hdmi_choose_cvt(struct hda_codec *codec,
 
 	if (per_pin && per_pin->silent_stream) {
 		cvt_idx = cvt_nid_to_cvt_index(codec, per_pin->cvt_nid);
+		per_cvt = get_cvt(spec, cvt_idx);
+		if (per_cvt->assigned && !silent)
+			return -EBUSY;
 		if (cvt_id)
 			*cvt_id = cvt_idx;
 		return 0;
@@ -1002,7 +1007,7 @@ static int hdmi_choose_cvt(struct hda_codec *codec,
 		per_cvt = get_cvt(spec, cvt_idx);
 
 		/* Must not already be assigned */
-		if (per_cvt->assigned)
+		if (per_cvt->assigned || per_cvt->silent_stream)
 			continue;
 		if (per_pin == NULL)
 			break;
@@ -1188,7 +1193,7 @@ static int hdmi_pcm_open_no_pin(struct hda_pcm_stream *hinfo,
 	if (pcm_idx < 0)
 		return -EINVAL;
 
-	err = hdmi_choose_cvt(codec, -1, &cvt_idx);
+	err = hdmi_choose_cvt(codec, -1, &cvt_idx, false);
 	if (err)
 		return err;
 
@@ -1256,7 +1261,7 @@ static int hdmi_pcm_open(struct hda_pcm_stream *hinfo,
 		}
 	}
 
-	err = hdmi_choose_cvt(codec, pin_idx, &cvt_idx);
+	err = hdmi_choose_cvt(codec, pin_idx, &cvt_idx, false);
 	if (err < 0)
 		goto unlock;
 
@@ -1267,7 +1272,6 @@ static int hdmi_pcm_open(struct hda_pcm_stream *hinfo,
 	set_bit(pcm_idx, &spec->pcm_in_use);
 	per_pin = get_pin(spec, pin_idx);
 	per_pin->cvt_nid = per_cvt->cvt_nid;
-	per_pin->silent_stream = false;
 	hinfo->nid = per_cvt->cvt_nid;
 
 	/* flip stripe flag for the assigned stream if supported */
@@ -1749,14 +1753,14 @@ static void silent_stream_enable(struct hda_codec *codec,
 	}
 
 	pin_idx = pin_id_to_pin_index(codec, per_pin->pin_nid, per_pin->dev_id);
-	err = hdmi_choose_cvt(codec, pin_idx, &cvt_idx);
+	err = hdmi_choose_cvt(codec, pin_idx, &cvt_idx, true);
 	if (err) {
 		codec_err(codec, "hdmi: no free converter to enable silent mode\n");
 		goto unlock_out;
 	}
 
 	per_cvt = get_cvt(spec, cvt_idx);
-	per_cvt->assigned = true;
+	per_cvt->silent_stream = true;
 	per_pin->cvt_nid = per_cvt->cvt_nid;
 	per_pin->silent_stream = true;
 
@@ -1816,7 +1820,7 @@ static void silent_stream_disable(struct hda_codec *codec,
 	cvt_idx = cvt_nid_to_cvt_index(codec, per_pin->cvt_nid);
 	if (cvt_idx >= 0 && cvt_idx < spec->num_cvts) {
 		per_cvt = get_cvt(spec, cvt_idx);
-		per_cvt->assigned = false;
+		per_cvt->silent_stream = false;
 	}
 
 	if (spec->silent_stream_type == SILENT_STREAM_I915) {
-- 
2.35.3
