Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A8D15166A
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 08:23:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86685167B;
	Tue,  4 Feb 2020 08:22:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86685167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580800997;
	bh=CaCMoNJOvCAiDpjgsMH3g/OqV7NeiqSEWKmfin9PewA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l9FZ7itzAcACrvtXvwHvNwMdVqmZLW4VbB+SKxodtgM9yMVyuUS7RYf8IjseqcGL4
	 OpZ8J9KaUQG4lImt7gFDhbGqDWp3fxWKrzqTgmEolwgHNHgOOtj9vCWMbLRG/UtSxn
	 Y/vmIeC7NyaEEhLjMOIZHonjDlcAfEc2vJhu4GfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 682E3F80051;
	Tue,  4 Feb 2020 08:20:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1440BF80051; Tue,  4 Feb 2020 08:20:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02BE2F8015B
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 08:20:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02BE2F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="MU7w4mKi"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e391b310000>; Mon, 03 Feb 2020 23:20:17 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 03 Feb 2020 23:20:40 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 03 Feb 2020 23:20:40 -0800
Received: from nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 4 Feb 2020 07:20:38 +0000
From: Nikhil Mahale <nmahale@nvidia.com>
To: <tiwai@suse.com>, <kai.vehmanen@linux.intel.com>
Date: Tue, 4 Feb 2020 12:50:15 +0530
Message-ID: <20200204072017.9554-2-nmahale@nvidia.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200204072017.9554-1-nmahale@nvidia.com>
References: <20200204072017.9554-1-nmahale@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580800817; bh=W4PTUk9HE8ycuzboWa7ZxZXtdISz/Vp2rvUltn9s8RA=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=MU7w4mKis6nmhA4rpBBhRRzGiNsp259AqruvkRZW1h8zKzRp9u4l8++DowvBsZXnp
 VoqJzN4nHnGCeUqGygbEvE5Xgl/wV72883yU/GshtZyN4hOqARoN7ljh8tEfKHR9uY
 wwS8KWS1WfAiB/v8zB5EM9DCrZheT4jPC2oYiQft5Pd/SEJPA1PE9o98lw5eagDVGM
 MU4pd0RqyFIwneDb5rMM5i9/bbg7Dwa8jL/U2f6M1MD7C2qUG+kMhc/pREGKlc/90w
 +4+/ZXqXa48dKjewwJYbJih1MI88wEhc/eKXpUeq+q+mvZCHME0YSlnoo7dnY7UNVb
 T2MBcZoM+sRxA==
Cc: alsa-devel@alsa-project.org, martin@larkos.de,
 Nikhil Mahale <nmahale@nvidia.com>, aplattner@nvidia.com
Subject: [alsa-devel] [PATCH v1 2/4] ALSA: hda - Move
	snd_hda_jack_report_sync() call inside
	hdmi_present_sense_via_verbs()
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

Move snd_hda_jack_report_sync() call inside
hdmi_present_sense_via_verbs(), and add parameter to control it.
snd_hda_jack_report_sync() should get called only for !acomp
drivers.

Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>
---
 sound/pci/hda/patch_hdmi.c | 41 +++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index ee084676f625..de45f5e5c724 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -753,7 +753,9 @@ static void hdmi_setup_audio_infoframe(struct hda_codec *codec,
  * Unsolicited events
  */
 
-static bool hdmi_present_sense(struct hdmi_spec_per_pin *per_pin, int repoll);
+static void hdmi_present_sense(struct hdmi_spec_per_pin *per_pin,
+			       int repoll,
+			       bool jack_report_sync);
 
 static void check_presence_and_report(struct hda_codec *codec, hda_nid_t nid,
 				      int dev_id)
@@ -764,8 +766,8 @@ static void check_presence_and_report(struct hda_codec *codec, hda_nid_t nid,
 	if (pin_idx < 0)
 		return;
 	mutex_lock(&spec->pcm_lock);
-	if (hdmi_present_sense(get_pin(spec, pin_idx), 1))
-		snd_hda_jack_report_sync(codec);
+	hdmi_present_sense(get_pin(spec, pin_idx),
+			   1, true /* jack_report_sync */);
 	mutex_unlock(&spec->pcm_lock);
 }
 
@@ -1551,8 +1553,9 @@ static bool update_eld(struct hda_codec *codec,
 }
 
 /* update ELD and jack state via HD-audio verbs */
-static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
-					 int repoll)
+static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
+					 int repoll,
+					 bool jack_report_sync)
 {
 	struct hda_jack_tbl *jack;
 	struct hda_codec *codec = per_pin->codec;
@@ -1608,9 +1611,11 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 		jack->pin_sense = (eld->monitor_present && eld->eld_valid) ?
 			AC_PINSENSE_PRESENCE : 0;
 	}
-	mutex_unlock(&per_pin->lock);
 
-	return !do_repoll;
+	if (!do_repoll && jack_report_sync)
+		snd_hda_jack_report_sync(codec);
+
+	mutex_unlock(&per_pin->lock);
 }
 
 static struct snd_jack *pin_idx_to_jack(struct hda_codec *codec,
@@ -1686,26 +1691,25 @@ static void sync_eld_via_acomp(struct hda_codec *codec,
 	mutex_unlock(&per_pin->lock);
 }
 
-static bool hdmi_present_sense(struct hdmi_spec_per_pin *per_pin, int repoll)
+static void hdmi_present_sense(struct hdmi_spec_per_pin *per_pin,
+			       int repoll,
+			       bool jack_report_sync)
 {
 	struct hda_codec *codec = per_pin->codec;
-	int ret;
 
 	/* no temporary power up/down needed for component notifier */
 	if (!codec_has_acomp(codec)) {
+		int ret;
+
 		ret = snd_hda_power_up_pm(codec);
 		if (ret < 0 && pm_runtime_suspended(hda_codec_dev(codec))) {
 			snd_hda_power_down_pm(codec);
-			return false;
 		}
-		ret = hdmi_present_sense_via_verbs(per_pin, repoll);
+		hdmi_present_sense_via_verbs(per_pin, repoll, jack_report_sync);
 		snd_hda_power_down_pm(codec);
 	} else {
 		sync_eld_via_acomp(codec, per_pin);
-		ret = false; /* don't call snd_hda_jack_report_sync() */
 	}
-
-	return ret;
 }
 
 static void hdmi_repoll_eld(struct work_struct *work)
@@ -1725,8 +1729,9 @@ static void hdmi_repoll_eld(struct work_struct *work)
 		per_pin->repoll_count = 0;
 
 	mutex_lock(&spec->pcm_lock);
-	if (hdmi_present_sense(per_pin, per_pin->repoll_count))
-		snd_hda_jack_report_sync(per_pin->codec);
+	hdmi_present_sense(per_pin,
+			   per_pin->repoll_count,
+			   true /* jack_report_sync */);
 	mutex_unlock(&spec->pcm_lock);
 }
 
@@ -2281,7 +2286,7 @@ static int generic_hdmi_build_controls(struct hda_codec *codec)
 	for (pin_idx = 0; pin_idx < spec->num_pins; pin_idx++) {
 		struct hdmi_spec_per_pin *per_pin = get_pin(spec, pin_idx);
 
-		hdmi_present_sense(per_pin, 0);
+		hdmi_present_sense(per_pin, 0, false /* jack_report_sync */);
 	}
 
 	/* add channel maps */
@@ -2408,7 +2413,7 @@ static int generic_hdmi_resume(struct hda_codec *codec)
 
 	for (pin_idx = 0; pin_idx < spec->num_pins; pin_idx++) {
 		struct hdmi_spec_per_pin *per_pin = get_pin(spec, pin_idx);
-		hdmi_present_sense(per_pin, 1);
+		hdmi_present_sense(per_pin, 1, false /* jack_report_sync */);
 	}
 	return 0;
 }
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
