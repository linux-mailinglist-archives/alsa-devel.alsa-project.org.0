Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC2915166E
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 08:24:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C77FE168F;
	Tue,  4 Feb 2020 08:23:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C77FE168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580801057;
	bh=d40i2Kcj5A4GeEbF6v1I2WGmJFxurYbXemzWQrLDaw4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qvvT4XwSAEgupdY+7/HNG1F6PywTlgvuMkAQ1EeoVOePTxB6/gPtydeJVvqgBTWrA
	 pMUqoS7EIymMinFV5RlkqyK7mY0C2MSzkIc2fz++AM0c5RPbkIoX7J88LfSC/FISBJ
	 t48xqblAhvhjPxnri7flFeR2mR0jrChOUEICiytc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 583B7F8028A;
	Tue,  4 Feb 2020 08:20:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC798F8027B; Tue,  4 Feb 2020 08:20:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2882BF80051
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 08:20:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2882BF80051
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="RHSjqgG+"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e391b170000>; Mon, 03 Feb 2020 23:19:51 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 03 Feb 2020 23:20:47 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 03 Feb 2020 23:20:47 -0800
Received: from nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 4 Feb 2020 07:20:45 +0000
From: Nikhil Mahale <nmahale@nvidia.com>
To: <tiwai@suse.com>, <kai.vehmanen@linux.intel.com>
Date: Tue, 4 Feb 2020 12:50:17 +0530
Message-ID: <20200204072017.9554-4-nmahale@nvidia.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200204072017.9554-1-nmahale@nvidia.com>
References: <20200204072017.9554-1-nmahale@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580800791; bh=kCy9fAKwheK3ADaCT7sqTfpvLiAud5Ex4FRiqG0PBg8=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=RHSjqgG+vcq/8dcX5p7f3lNcyUA4WtB5PP0/cNQHga+1y+HnbmVlRvoZ2eK7l4fM6
 P/+cR1Vb+C4uPO24WX4ClLtYLONrC/oe6x/6Mc84RTla/Yw1H9YPEkZ+BuSKJ6htm5
 xDpqpjNngwVlVF7w0inrYJ8o9uAWlxWTa2trdBdlkKBJd9iDyT8QyNpc448g6wc+xo
 C1uHFHhrILt0+W/eZ6Lv3+hq4+jJyzoS9A5Vc8SCLlgu685M142D7PKLwhhi4z7v77
 ucOvJcMXs4TU54PZ2M0q3VQZilNKyvDpAaGYWbEC9w+QIU7CTg6EcKVuTgUVeob36/
 gQZSEPPiay2Pw==
Cc: alsa-devel@alsa-project.org, martin@larkos.de,
 Nikhil Mahale <nmahale@nvidia.com>, aplattner@nvidia.com
Subject: [alsa-devel] [PATCH v1 4/4] ALSA: hda - Fix DP-MST support for
	NVIDIA codecs
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

Fixes: 5398e94fb753 ALSA: hda - Add DP-MST support for NVIDIA codecs
Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>
---
 sound/pci/hda/patch_hdmi.c | 80 +++++++++++++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 32 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 1cf0604020bc..6da87dad03ff 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1551,6 +1551,34 @@ static void update_eld(struct hda_codec *codec,
 			       &get_hdmi_pcm(spec, pcm_idx)->eld_ctl->id);
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
 static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 					 int repoll,
@@ -1572,6 +1600,7 @@ static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	 */
 	int present;
 	bool do_repoll = false;
+	struct snd_jack *pcm_jack = NULL;
 
 	present = snd_hda_jack_pin_sense(codec, pin_nid, dev_id);
 
@@ -1599,10 +1628,17 @@ static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 			do_repoll = true;
 	}
 
-	if (do_repoll)
+	if (do_repoll) {
 		schedule_delayed_work(&per_pin->work, msecs_to_jiffies(300));
-	else
+	} else {
+		/* pcm_idx >=0 before update_eld() means it is in monitor
+		 * disconnected event. Jack must be fetched before update_eld()
+		 */
+		pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
 		update_eld(codec, per_pin, eld);
+		if (!pcm_jack)
+			pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
+	}
 
 	jack = snd_hda_jack_tbl_get_mst(codec, pin_nid, per_pin->dev_id);
 	if (jack) {
@@ -1614,36 +1650,16 @@ static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	if (!do_repoll && jack_report_sync)
 		snd_hda_jack_report_sync(codec);
 
-	mutex_unlock(&per_pin->lock);
-}
-
-static struct snd_jack *pin_idx_to_jack(struct hda_codec *codec,
-				 struct hdmi_spec_per_pin *per_pin)
-{
-	struct hdmi_spec *spec = codec->spec;
-	struct snd_jack *jack = NULL;
-	struct hda_jack_tbl *jack_tbl;
+	/* snd_hda_jack_report_sync() updates jack->pin_sense */
+	if (spec->dyn_pcm_assign && pcm_jack && !do_repoll) {
+		int state = 0;
 
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
+		if (jack && !!(jack->pin_sense & AC_PINSENSE_PRESENCE))
+			state = SND_JACK_AVOUT;
+		snd_jack_report(pcm_jack, state);
 	}
-	return jack;
+
+	mutex_unlock(&per_pin->lock);
 }
 
 /* update ELD and jack state via audio component */
@@ -1678,10 +1694,10 @@ static void sync_eld_via_acomp(struct hda_codec *codec,
 	/* pcm_idx >=0 before update_eld() means it is in monitor
 	 * disconnected event. Jack must be fetched before update_eld()
 	 */
-	jack = pin_idx_to_jack(codec, per_pin);
+	jack = pin_idx_to_pcm_jack(codec, per_pin);
 	update_eld(codec, per_pin, eld);
 	if (jack == NULL)
-		jack = pin_idx_to_jack(codec, per_pin);
+		jack = pin_idx_to_pcm_jack(codec, per_pin);
 	if (jack)
 		snd_jack_report(jack,
 				(eld->monitor_present && eld->eld_valid) ?
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
