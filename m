Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C20A215493E
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 17:32:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6371C16B3;
	Thu,  6 Feb 2020 17:31:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6371C16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581006743;
	bh=oQjUSWoFq7aKeIFzbuRpcajMFIEPDKYsAn57JwXQE34=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eq+0fKdWgjew6OMaTpfDZ2u92QCO3nRLLRuICdiuvdSoacC8xPmP+Y4PUJ4KC6fIH
	 LcJJjUprvgJT40zUeQt1P+x3XrH29nC+Y3J8hagK0dNan9E3EGSgSREU0Y9QfcLyZU
	 /QPiq330Wm6fpLDS/NEopFaa898YpYfZUuBufCyY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55774F8028B;
	Thu,  6 Feb 2020 17:28:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 710F8F8015B; Thu,  6 Feb 2020 17:28:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 891EDF80059
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 17:28:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 891EDF80059
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 06F50AFA7;
 Thu,  6 Feb 2020 16:28:08 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  6 Feb 2020 17:28:04 +0100
Message-Id: <20200206162804.4734-5-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200206162804.4734-1-tiwai@suse.de>
References: <20200206162804.4734-1-tiwai@suse.de>
Cc: Nikhil Mahale <nmahale@nvidia.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 4/4] ALSA: hda/hdmi: Move ELD parse and jack
	reporting into update_eld()
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

This is a final step of the cleanup series: move the HDMI ELD parser
call into update_eld() function so that we can unify the calls.
The ELD validity check is unified in update_eld(), too.

Along with it, the repoll scheduling is moved to update_eld() as well,
where sync_eld_via_acomp() just passes 0 for skipping it.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_hdmi.c | 110 ++++++++++++++++++++-------------------------
 1 file changed, 48 insertions(+), 62 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 437177294d78..bb287a916dae 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1466,21 +1466,60 @@ static void hdmi_pcm_reset_pin(struct hdmi_spec *spec,
 	per_pin->channels = 0;
 }
 
+static struct snd_jack *pin_idx_to_pcm_jack(struct hda_codec *codec,
+					    struct hdmi_spec_per_pin *per_pin)
+{
+	struct hdmi_spec *spec = codec->spec;
+
+	if (per_pin->pcm_idx >= 0)
+		return spec->pcm_rec[per_pin->pcm_idx].jack;
+	else
+		return NULL;
+}
+
 /* update per_pin ELD from the given new ELD;
  * setup info frame and notification accordingly
+ * also notify ELD kctl and report jack status changes
  */
-static bool update_eld(struct hda_codec *codec,
+static void update_eld(struct hda_codec *codec,
 		       struct hdmi_spec_per_pin *per_pin,
-		       struct hdmi_eld *eld)
+		       struct hdmi_eld *eld,
+		       int repoll)
 {
 	struct hdmi_eld *pin_eld = &per_pin->sink_eld;
 	struct hdmi_spec *spec = codec->spec;
+	struct snd_jack *pcm_jack;
 	bool old_eld_valid = pin_eld->eld_valid;
 	bool eld_changed;
 	int pcm_idx;
 
+	if (eld->eld_valid) {
+		if (eld->eld_size <= 0 ||
+		    snd_hdmi_parse_eld(codec, &eld->info, eld->eld_buffer,
+				       eld->eld_size) < 0) {
+			eld->eld_valid = false;
+			if (repoll) {
+				schedule_delayed_work(&per_pin->work,
+						      msecs_to_jiffies(300));
+				return;
+			}
+		}
+	}
+
+	if (!eld->eld_valid || eld->eld_size <= 0) {
+		eld->eld_valid = false;
+		eld->eld_size = 0;
+	}
+
 	/* for monitor disconnection, save pcm_idx firstly */
 	pcm_idx = per_pin->pcm_idx;
+
+	/*
+	 * pcm_idx >=0 before update_eld() means it is in monitor
+	 * disconnected event. Jack must be fetched before update_eld().
+	 */
+	pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
+
 	if (spec->dyn_pcm_assign) {
 		if (eld->eld_valid) {
 			hdmi_attach_hda_pcm(spec, per_pin);
@@ -1495,6 +1534,8 @@ static bool update_eld(struct hda_codec *codec,
 	 */
 	if (pcm_idx == -1)
 		pcm_idx = per_pin->pcm_idx;
+	if (!pcm_jack)
+		pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
 
 	if (eld->eld_valid)
 		snd_hdmi_show_eld(codec, &eld->info);
@@ -1533,36 +1574,8 @@ static bool update_eld(struct hda_codec *codec,
 			       SNDRV_CTL_EVENT_MASK_VALUE |
 			       SNDRV_CTL_EVENT_MASK_INFO,
 			       &get_hdmi_pcm(spec, pcm_idx)->eld_ctl->id);
-	return eld_changed;
-}
-
-static struct snd_jack *pin_idx_to_pcm_jack(struct hda_codec *codec,
-					    struct hdmi_spec_per_pin *per_pin)
-{
-	struct hdmi_spec *spec = codec->spec;
 
-	if (per_pin->pcm_idx >= 0)
-		return spec->pcm_rec[per_pin->pcm_idx].jack;
-	else
-		return NULL;
-}
-
-static void do_update_eld(struct hda_codec *codec,
-			  struct hdmi_spec_per_pin *per_pin,
-			  struct hdmi_eld *eld)
-{
-	struct snd_jack *pcm_jack;
-	bool changed;
-
-	/*
-	 * pcm_idx >=0 before update_eld() means it is in monitor
-	 * disconnected event. Jack must be fetched before update_eld().
-	 */
-	pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
-	changed = update_eld(codec, per_pin, eld);
-	if (!pcm_jack)
-		pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
-	if (changed && pcm_jack)
+	if (eld_changed && pcm_jack)
 		snd_jack_report(pcm_jack,
 				(eld->monitor_present && eld->eld_valid) ?
 				SND_JACK_AVOUT : 0);
@@ -1586,7 +1599,6 @@ static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	 * the unsolicited response to avoid custom WARs.
 	 */
 	int present;
-	bool do_repoll = false;
 	int ret;
 
 	ret = snd_hda_power_up_pm(codec);
@@ -1610,20 +1622,9 @@ static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 		if (spec->ops.pin_get_eld(codec, pin_nid, dev_id,
 					  eld->eld_buffer, &eld->eld_size) < 0)
 			eld->eld_valid = false;
-		else {
-			if (snd_hdmi_parse_eld(codec, &eld->info, eld->eld_buffer,
-						    eld->eld_size) < 0)
-				eld->eld_valid = false;
-		}
-		if (!eld->eld_valid && repoll)
-			do_repoll = true;
 	}
 
-	if (do_repoll)
-		schedule_delayed_work(&per_pin->work, msecs_to_jiffies(300));
-	else
-		do_update_eld(codec, per_pin, eld);
-
+	update_eld(codec, per_pin, eld, repoll);
 	mutex_unlock(&per_pin->lock);
  out:
 	snd_hda_power_down_pm(codec);
@@ -1635,29 +1636,14 @@ static void sync_eld_via_acomp(struct hda_codec *codec,
 {
 	struct hdmi_spec *spec = codec->spec;
 	struct hdmi_eld *eld = &spec->temp_eld;
-	int size;
 
 	mutex_lock(&per_pin->lock);
 	eld->monitor_present = false;
-	size = snd_hdac_acomp_get_eld(&codec->core, per_pin->pin_nid,
+	eld->eld_size = snd_hdac_acomp_get_eld(&codec->core, per_pin->pin_nid,
 				      per_pin->dev_id, &eld->monitor_present,
 				      eld->eld_buffer, ELD_MAX_SIZE);
-	if (size > 0) {
-		size = min(size, ELD_MAX_SIZE);
-		if (snd_hdmi_parse_eld(codec, &eld->info,
-				       eld->eld_buffer, size) < 0)
-			size = -EINVAL;
-	}
-
-	if (size > 0) {
-		eld->eld_valid = true;
-		eld->eld_size = size;
-	} else {
-		eld->eld_valid = false;
-		eld->eld_size = 0;
-	}
-
-	do_update_eld(codec, per_pin, eld);
+	eld->eld_valid = (eld->eld_size > 0);
+	update_eld(codec, per_pin, eld, 0);
 	mutex_unlock(&per_pin->lock);
 }
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
