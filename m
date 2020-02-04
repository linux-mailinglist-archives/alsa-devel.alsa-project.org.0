Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3A11518CE
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 11:30:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BB7E1612;
	Tue,  4 Feb 2020 11:29:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BB7E1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580812202;
	bh=XuT3AJLSlcrxqlIhTOZwy8YHEkcZ2f7ruUxS0egylvk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Uzt5xZikCyaOmC+6lexOICYB1d0yx53tef/gkmbYgbpVD1hpy3/6LrswzjOYmkGDz
	 J+hWrPkeiDxe5sR5kEtduRyd+MMu/78llJP9NfpJHhpOCbvN89Bfdx3Pks/UqvmN5U
	 lQaHbyQKysqApRZfdukgwAB3orT5aVfI+/6fmUHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9AABF801DB;
	Tue,  4 Feb 2020 11:28:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FC8BF80162; Tue,  4 Feb 2020 11:28:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9053F800F4
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 11:28:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9053F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="m2YwGau/"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e39471e0000>; Tue, 04 Feb 2020 02:27:42 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 04 Feb 2020 02:28:05 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 04 Feb 2020 02:28:05 -0800
Received: from nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 4 Feb 2020 10:28:03 +0000
From: Nikhil Mahale <nmahale@nvidia.com>
To: <tiwai@suse.com>, <kai.vehmanen@linux.intel.com>
Date: Tue, 4 Feb 2020 15:57:46 +0530
Message-ID: <20200204102746.1356-1-nmahale@nvidia.com>
X-Mailer: git-send-email 2.16.4
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580812062; bh=GcyldMuEOagzLCS3jiApbLwEdQ7bN3ftglIKU7oEjfg=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:X-Originating-IP:
 X-ClientProxiedBy:Content-Type;
 b=m2YwGau/Wsn/T190C0d2QwQiW6VuPXxEdHfF9dXMPk3pF27NrgJ72yQnDcGRBog3m
 IMlD88bHuOVd8d0ohgpct2tsdcwo/H04uL+FuKDXTBuJQH61Kxjy8ZxfVvE97Ntqcq
 mEAP9gCFoyyTTsjG0IIrv1gNvW+aPqrJZTRLxjOC+18dejE4680l9wK1KiOTIt20XF
 Qg9djlYqT+gs0NzBtDV9DhuZL6FPXIpjsFRDQcyjLI923e9ZZSxXisgPm7eUaNLRE0
 W/1LZDmRzcJ6Yhmhm4ZDEJ50HiuYdBj2WAnwJtkM//kMe6TbqdiDthQzfvFDmv+B5K
 bgsMB6YCLgdgg==
Cc: alsa-devel@alsa-project.org, martin@larkos.de,
 Nikhil Mahale <nmahale@nvidia.com>, aplattner@nvidia.com
Subject: [alsa-devel] [PATCH] ALSA: hda - Fix DP-MST support for NVIDIA
	codecs
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

If dyn_pcm_assign is set, different jack objects are being created
for pcm and pins.

If dyn_pcm_assign is set, generic_hdmi_build_jack() calls into
add_hdmi_jack_kctl() to create and track separate jack object for
pcm. Like sync_eld_via_acomp(), hdmi_present_sense_via_verbs() also
need to report status change of the pcm jack.

Rename pin_idx_to_jack() to pin_idx_to_pcm_jack(). Update
hdmi_present_sense_via_verbs() to report plug state of pcm jack
object. Unlike sync_eld_via_acomp(), for !acomp drivers the pcm
jack's plug state must be consistent with plug state
of pin's jack.

Fixes: 5398e94fb753 ("ALSA: hda - Add DP-MST support for NVIDIA codecs")
Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>
---
 sound/pci/hda/patch_hdmi.c | 94 +++++++++++++++++++++++++++++++---------------
 1 file changed, 63 insertions(+), 31 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 48bddc218829..c1d3ce423142 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1550,6 +1550,34 @@ static bool update_eld(struct hda_codec *codec,
 	return eld_changed;
 }
 
+static struct snd_jack *pin_idx_to_pcm_jack(struct hda_codec *codec,
+					    struct hdmi_spec_per_pin *per_pin)
+{
+	struct hdmi_spec *spec = codec->spec;
+	struct snd_jack *jack = NULL;
+	struct hda_jack_tbl *jack_tbl;
+
+	/* if !dyn_pcm_assign, get jack from hda_jack_tbl
+	 * in !dyn_pcm_assign case, spec->pcm_rec[].jack is not
+	 * NULL even after snd_hda_jack_tbl_clear() is called to
+	 * free snd_jack. This may cause access invalid memory
+	 * when calling snd_jack_report
+	 */
+	if (per_pin->pcm_idx >= 0 && spec->dyn_pcm_assign) {
+		jack = spec->pcm_rec[per_pin->pcm_idx].jack;
+	} else if (!spec->dyn_pcm_assign) {
+		/*
+		 * jack tbl doesn't support DP MST
+		 * DP MST will use dyn_pcm_assign,
+		 * so DP MST will never come here
+		 */
+		jack_tbl = snd_hda_jack_tbl_get_mst(codec, per_pin->pin_nid,
+						    per_pin->dev_id);
+		if (jack_tbl)
+			jack = jack_tbl->jack;
+	}
+	return jack;
+}
 /* update ELD and jack state via HD-audio verbs */
 static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 					 int repoll)
@@ -1571,6 +1599,7 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	int present;
 	bool ret;
 	bool do_repoll = false;
+	struct snd_jack *pcm_jack = NULL;
 
 	present = snd_hda_jack_pin_sense(codec, pin_nid, dev_id);
 
@@ -1598,10 +1627,19 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 			do_repoll = true;
 	}
 
-	if (do_repoll)
+	if (do_repoll) {
 		schedule_delayed_work(&per_pin->work, msecs_to_jiffies(300));
-	else
+	} else {
+		/*
+		 * pcm_idx >=0 before update_eld() means it is in monitor
+		 * disconnected event. Jack must be fetched before
+		 * update_eld().
+		 */
+		pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
 		update_eld(codec, per_pin, eld);
+		if (!pcm_jack)
+			pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
+	}
 
 	ret = !repoll || !eld->monitor_present || eld->eld_valid;
 
@@ -1610,38 +1648,32 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 		jack->block_report = !ret;
 		jack->pin_sense = (eld->monitor_present && eld->eld_valid) ?
 			AC_PINSENSE_PRESENCE : 0;
-	}
-	mutex_unlock(&per_pin->lock);
-	return ret;
-}
 
-static struct snd_jack *pin_idx_to_jack(struct hda_codec *codec,
-				 struct hdmi_spec_per_pin *per_pin)
-{
-	struct hdmi_spec *spec = codec->spec;
-	struct snd_jack *jack = NULL;
-	struct hda_jack_tbl *jack_tbl;
+		if (spec->dyn_pcm_assign && pcm_jack && !do_repoll) {
+			int state = 0;
+
+			if (!!(jack->pin_sense & AC_PINSENSE_PRESENCE))
+				state = SND_JACK_AVOUT;
+			snd_jack_report(pcm_jack, state);
+		}
 
-	/* if !dyn_pcm_assign, get jack from hda_jack_tbl
-	 * in !dyn_pcm_assign case, spec->pcm_rec[].jack is not
-	 * NULL even after snd_hda_jack_tbl_clear() is called to
-	 * free snd_jack. This may cause access invalid memory
-	 * when calling snd_jack_report
-	 */
-	if (per_pin->pcm_idx >= 0 && spec->dyn_pcm_assign)
-		jack = spec->pcm_rec[per_pin->pcm_idx].jack;
-	else if (!spec->dyn_pcm_assign) {
 		/*
-		 * jack tbl doesn't support DP MST
-		 * DP MST will use dyn_pcm_assign,
-		 * so DP MST will never come here
+		 * snd_hda_jack_pin_sense() call at the beginning of this
+		 * function, updates jack->pins_sense and clears
+		 * jack->jack_dirty, therefore snd_hda_jack_report_sync() will
+		 * not override the jack->pin_sense.
+		 *
+		 * snd_hda_jack_report_sync() is superfluous for dyn_pcm_assign
+		 * case. The jack->pin_sense update was already performed, and
+		 * hda_jack->jack is NULL for dyn_pcm_assign.
+		 *
+		 * Don't call snd_hda_jack_report_sync() for
+		 * dyn_pcm_assign.
 		 */
-		jack_tbl = snd_hda_jack_tbl_get_mst(codec, per_pin->pin_nid,
-						    per_pin->dev_id);
-		if (jack_tbl)
-			jack = jack_tbl->jack;
+		ret = ret && !spec->dyn_pcm_assign;
 	}
-	return jack;
+	mutex_unlock(&per_pin->lock);
+	return ret;
 }
 
 /* update ELD and jack state via audio component */
@@ -1677,10 +1709,10 @@ static void sync_eld_via_acomp(struct hda_codec *codec,
 	/* pcm_idx >=0 before update_eld() means it is in monitor
 	 * disconnected event. Jack must be fetched before update_eld()
 	 */
-	jack = pin_idx_to_jack(codec, per_pin);
+	jack = pin_idx_to_pcm_jack(codec, per_pin);
 	changed = update_eld(codec, per_pin, eld);
 	if (jack == NULL)
-		jack = pin_idx_to_jack(codec, per_pin);
+		jack = pin_idx_to_pcm_jack(codec, per_pin);
 	if (changed && jack)
 		snd_jack_report(jack,
 				(eld->monitor_present && eld->eld_valid) ?
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
