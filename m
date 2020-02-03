Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B96F41503D6
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Feb 2020 11:08:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A4A4168B;
	Mon,  3 Feb 2020 11:07:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A4A4168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580724527;
	bh=xdZVtCV7gGw20RoHS6hq9klloXDjy86bIfWuUJ8hq8c=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KbNGoc5n1mB0LPJJ4WGuKRhCMKLgcA2m3Ozh3zpR7lYOoeD3UHeRfmK/Cfy1wOjbE
	 lm20SWmov1ULi+suT6BA43XYWSSHuIqObVhP9kQAxRfy3SQej/sF80oVqZ6y6fpevq
	 Qz6vdazHd8u8GXz7K3F2Uv7XXnUAEF+SdUsbPDCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06A60F80051;
	Mon,  3 Feb 2020 11:07:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8644DF80148; Mon,  3 Feb 2020 11:07:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F914F80051
 for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2020 11:06:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F914F80051
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="KHQ/EQcg"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e37f0a70000>; Mon, 03 Feb 2020 02:06:31 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 03 Feb 2020 02:06:53 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 03 Feb 2020 02:06:53 -0800
Received: from nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 3 Feb 2020 10:06:51 +0000
From: Nikhil Mahale <nmahale@nvidia.com>
To: <tiwai@suse.com>, <kai.vehmanen@linux.intel.com>
Date: Mon, 3 Feb 2020 15:36:17 +0530
Message-ID: <20200203100617.3856-1-nmahale@nvidia.com>
X-Mailer: git-send-email 2.16.4
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580724391; bh=ND4KdA3FJRtfsT75nyVJMDjTLlff1KmcKNUOjjStcmg=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 X-NVConfidentiality:MIME-Version:X-Originating-IP:
 X-ClientProxiedBy:Content-Type;
 b=KHQ/EQcgZoRhDrprRZkGGowO3f3MvfCZTUukNctHZskVZgHMGaQKNnyTGkIyeLzV2
 Lb7FtGv6itd4Hh2n3Q+1RVw2FXoIe/XYUSEv8NoH0h8v7Md0WANJKp85VjNPi5ZRXb
 TLMPTNglbCGrC2YkAXWADppkb6jvO3TLkpUDmfbRG43u6xLJQMg6+3oIeD+b4R35EM
 OKMcsJxEm3nRNAgS1w+SwVg2/DnQ9O3FJkracQl3lBlKtffvhwdo6hYJrc8wNOnrgz
 pC/4ywc1oCv1BHVdeBSXk70wM8NxtbXzmE1iJaZ5JXRveBy38AWfRfN16ZT+2VFuUV
 NcOyUbF65gAPQ==
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

Rename pin_idx_to_jack() to pin_idx_to_pcm_jack(). The code to
report status change of pcm jack, move it to update_eld() which is
common for acomp and !acomp code paths.

Fixes: 5398e94fb753 ALSA: hda - Add DP-MST support for NVIDIA codecs
Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>
---
 sound/pci/hda/patch_hdmi.c | 87 ++++++++++++++++++++++++----------------------
 1 file changed, 45 insertions(+), 42 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 48bddc218829..7b5360037217 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1480,6 +1480,35 @@ static void hdmi_pcm_reset_pin(struct hdmi_spec *spec,
 	per_pin->channels = 0;
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
+
 /* update per_pin ELD from the given new ELD;
  * setup info frame and notification accordingly
  */
@@ -1490,9 +1519,15 @@ static bool update_eld(struct hda_codec *codec,
 	struct hdmi_eld *pin_eld = &per_pin->sink_eld;
 	struct hdmi_spec *spec = codec->spec;
 	bool old_eld_valid = pin_eld->eld_valid;
+	struct snd_jack *pcm_jack;
 	bool eld_changed;
 	int pcm_idx;
 
+	/* pcm_idx >=0 before update_eld() means it is in monitor
+	 * disconnected event. Jack must be fetched before update_eld()
+	 */
+	pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
+
 	/* for monitor disconnection, save pcm_idx firstly */
 	pcm_idx = per_pin->pcm_idx;
 	if (spec->dyn_pcm_assign) {
@@ -1547,6 +1582,14 @@ static bool update_eld(struct hda_codec *codec,
 			       SNDRV_CTL_EVENT_MASK_VALUE |
 			       SNDRV_CTL_EVENT_MASK_INFO,
 			       &get_hdmi_pcm(spec, pcm_idx)->eld_ctl->id);
+
+	if (!pcm_jack)
+		pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
+	if (eld_changed && pcm_jack)
+		snd_jack_report(pcm_jack,
+				(eld->monitor_present && eld->eld_valid) ?
+				SND_JACK_AVOUT : 0);
+
 	return eld_changed;
 }
 
@@ -1615,43 +1658,12 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	return ret;
 }
 
-static struct snd_jack *pin_idx_to_jack(struct hda_codec *codec,
-				 struct hdmi_spec_per_pin *per_pin)
-{
-	struct hdmi_spec *spec = codec->spec;
-	struct snd_jack *jack = NULL;
-	struct hda_jack_tbl *jack_tbl;
-
-	/* if !dyn_pcm_assign, get jack from hda_jack_tbl
-	 * in !dyn_pcm_assign case, spec->pcm_rec[].jack is not
-	 * NULL even after snd_hda_jack_tbl_clear() is called to
-	 * free snd_jack. This may cause access invalid memory
-	 * when calling snd_jack_report
-	 */
-	if (per_pin->pcm_idx >= 0 && spec->dyn_pcm_assign)
-		jack = spec->pcm_rec[per_pin->pcm_idx].jack;
-	else if (!spec->dyn_pcm_assign) {
-		/*
-		 * jack tbl doesn't support DP MST
-		 * DP MST will use dyn_pcm_assign,
-		 * so DP MST will never come here
-		 */
-		jack_tbl = snd_hda_jack_tbl_get_mst(codec, per_pin->pin_nid,
-						    per_pin->dev_id);
-		if (jack_tbl)
-			jack = jack_tbl->jack;
-	}
-	return jack;
-}
-
 /* update ELD and jack state via audio component */
 static void sync_eld_via_acomp(struct hda_codec *codec,
 			       struct hdmi_spec_per_pin *per_pin)
 {
 	struct hdmi_spec *spec = codec->spec;
 	struct hdmi_eld *eld = &spec->temp_eld;
-	struct snd_jack *jack = NULL;
-	bool changed;
 	int size;
 
 	mutex_lock(&per_pin->lock);
@@ -1674,17 +1686,8 @@ static void sync_eld_via_acomp(struct hda_codec *codec,
 		eld->eld_size = 0;
 	}
 
-	/* pcm_idx >=0 before update_eld() means it is in monitor
-	 * disconnected event. Jack must be fetched before update_eld()
-	 */
-	jack = pin_idx_to_jack(codec, per_pin);
-	changed = update_eld(codec, per_pin, eld);
-	if (jack == NULL)
-		jack = pin_idx_to_jack(codec, per_pin);
-	if (changed && jack)
-		snd_jack_report(jack,
-				(eld->monitor_present && eld->eld_valid) ?
-				SND_JACK_AVOUT : 0);
+	update_eld(codec, per_pin, eld);
+
 	mutex_unlock(&per_pin->lock);
 }
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
