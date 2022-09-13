Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DA15B685A
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 09:04:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DAAD1734;
	Tue, 13 Sep 2022 09:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DAAD1734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663052662;
	bh=A9gCeCOzwJUVQRWOsSAzppPtzGFxaYPxDBtJKJvadnk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QZ8q2vhoartJ+PPcrlKhp8VnXlBjbOhlmYLg0vfT5QyPQZYmUy8uPzyUwjUXUOBUI
	 WL7xLfIzKXpc/8ccGQOlW1hS5FrpC7Oocu9Xh6GTVpiu4hMR8Um7bOBPoZg9cqWnc3
	 c5mHFx8PpPiORqBRHP3tUAao8xalOYtZVXvbfNr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 008D7F80154;
	Tue, 13 Sep 2022 09:03:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19C2CF8028B; Tue, 13 Sep 2022 09:03:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04270F801EC
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 09:03:14 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 72F3EA003F;
 Tue, 13 Sep 2022 09:03:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 72F3EA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1663052594; bh=S7VQ5yPMRmONkMLXzGF0XhH44+0FPPSf91A/d4v6BSs=;
 h=From:To:Cc:Subject:Date:From;
 b=2J2xUkwmcrVZcXqTJFYIqm+XBx1hzrWxpuI8IKh+MT206HPDQnlAlhgrH4dVHuAOz
 c7gsrAagolmMZMiiSjsp5xCG0CKu561uSnx/nxYTqURowBcQkPse3WZoPgFktjKFVn
 7ip2Ga9r1Wr8ieboSknLrZw/ya8Qohz8iNondzhs=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 13 Sep 2022 09:03:11 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: hda/hdmi: change type for the 'assigned' variable
Date: Tue, 13 Sep 2022 09:03:07 +0200
Message-Id: <20220913070307.3234038-1-perex@perex.cz>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

This change converts the assigned value from int type to
the bool type to retain consistency with other structure
members like 'setup', 'non_pcm' etc.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/pci/hda/patch_hdmi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 22766810635b..4576af4cff90 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -53,7 +53,7 @@ MODULE_PARM_DESC(enable_all_pins, "Forcibly enable all pins");
 
 struct hdmi_spec_per_cvt {
 	hda_nid_t cvt_nid;
-	int assigned;
+	bool assigned;		/* the stream has been assigned */
 	unsigned int channels_min;
 	unsigned int channels_max;
 	u32 rates;
@@ -1193,7 +1193,7 @@ static int hdmi_pcm_open_no_pin(struct hda_pcm_stream *hinfo,
 		return err;
 
 	per_cvt = get_cvt(spec, cvt_idx);
-	per_cvt->assigned = 1;
+	per_cvt->assigned = true;
 	hinfo->nid = per_cvt->cvt_nid;
 
 	pin_cvt_fixup(codec, NULL, per_cvt->cvt_nid);
@@ -1262,7 +1262,7 @@ static int hdmi_pcm_open(struct hda_pcm_stream *hinfo,
 
 	per_cvt = get_cvt(spec, cvt_idx);
 	/* Claim converter */
-	per_cvt->assigned = 1;
+	per_cvt->assigned = true;
 
 	set_bit(pcm_idx, &spec->pcm_in_use);
 	per_pin = get_pin(spec, pin_idx);
@@ -1297,7 +1297,7 @@ static int hdmi_pcm_open(struct hda_pcm_stream *hinfo,
 		snd_hdmi_eld_update_pcm_info(&eld->info, hinfo);
 		if (hinfo->channels_min > hinfo->channels_max ||
 		    !hinfo->rates || !hinfo->formats) {
-			per_cvt->assigned = 0;
+			per_cvt->assigned = false;
 			hinfo->nid = 0;
 			snd_hda_spdif_ctls_unassign(codec, pcm_idx);
 			err = -ENODEV;
@@ -1756,7 +1756,7 @@ static void silent_stream_enable(struct hda_codec *codec,
 	}
 
 	per_cvt = get_cvt(spec, cvt_idx);
-	per_cvt->assigned = 1;
+	per_cvt->assigned = true;
 	per_pin->cvt_nid = per_cvt->cvt_nid;
 	per_pin->silent_stream = true;
 
@@ -1816,7 +1816,7 @@ static void silent_stream_disable(struct hda_codec *codec,
 	cvt_idx = cvt_nid_to_cvt_index(codec, per_pin->cvt_nid);
 	if (cvt_idx >= 0 && cvt_idx < spec->num_cvts) {
 		per_cvt = get_cvt(spec, cvt_idx);
-		per_cvt->assigned = 0;
+		per_cvt->assigned = false;
 	}
 
 	if (spec->silent_stream_type == SILENT_STREAM_I915) {
@@ -2212,7 +2212,7 @@ static int hdmi_pcm_close(struct hda_pcm_stream *hinfo,
 			goto unlock;
 		}
 		per_cvt = get_cvt(spec, cvt_idx);
-		per_cvt->assigned = 0;
+		per_cvt->assigned = false;
 		hinfo->nid = 0;
 
 		azx_stream(get_azx_dev(substream))->stripe = 0;
-- 
2.35.3
