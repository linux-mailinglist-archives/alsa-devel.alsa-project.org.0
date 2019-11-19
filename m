Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 488E8101E8B
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 09:50:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D26CC1694;
	Tue, 19 Nov 2019 09:49:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D26CC1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574153410;
	bh=n/WtOnXq9zoWg6et7zK+bgYhYHqE/qkNjW2R8XgIQuM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d11zzaHzZCKAMlhJ8PEIKigRTcYOfnDVpDwVB6nOH9vcCfiBoU8TclDjrO1+2ShMK
	 NUEcVPEhD/3uYu4jqr/EwHgXWHJKWEIm2sBeK/lvgD5o8D2jrf9rHV/nkwN3RvSTBi
	 VcNidv1CDXGJJJ9V+wfCGw8KlB7CdU4Iz2H5sPkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DF02F80146;
	Tue, 19 Nov 2019 09:47:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D7ACF80147; Tue, 19 Nov 2019 09:47:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6A3EF80119
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 09:47:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6A3EF80119
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="BmFMSkpj"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd3ac270000>; Tue, 19 Nov 2019 00:47:35 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 19 Nov 2019 00:47:38 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 19 Nov 2019 00:47:38 -0800
Received: from nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 19 Nov 2019 08:47:36 +0000
From: Nikhil Mahale <nmahale@nvidia.com>
To: <tiwai@suse.com>
Date: Tue, 19 Nov 2019 14:17:07 +0530
Message-ID: <20191119084710.29267-2-nmahale@nvidia.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191119084710.29267-1-nmahale@nvidia.com>
References: <20191119084710.29267-1-nmahale@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574153255; bh=Ut1sS2kDd5HiDDgeTKhlpYi5pzsGfMp26reLAkEKJgs=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=BmFMSkpjQ/W0+we9eGXUvISSQjaax+nzFv0JsxG6hCYu9TDLBj/CLOCACe1Y/8Pjm
 RI3vnQGoklm9C+I56DBjDN44rsFxcwQSP2ZoKBUJMAx50bjonguLc+O457+gC+y08a
 qDee6TYz3bGL28fYEKNyfdBtRWR5Z5WyOJ18Yv633K5XCvy5nkyjyuP+s2bPu4aZf4
 jTtxlkjJ2wd4uNUrYVuZl4IR0sgKO3rTTAmUOmagvIMMyaFb6a4Swd0Me04icIiHb5
 r6C8gSLKkJB9K8FCRWhPFUIqG0YpDnVQwnxHbL4OCAk4J4WYlUTHQU6SPO+LyIJd83
 kE6eeNcf+hI7w==
Cc: alsa-devel@alsa-project.org, nmahale@nvidia.com, aplattner@nvidia.com
Subject: [alsa-devel] [PATCH v3 1/4] ALSA: hda - Rename snd_hda_pin_sense to
	snd_hda_jack_pin_sense
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

s/snd_hda_pin_sense/snd_hda_jack_pin_sense/g

This aligns the snd_hda_pin_sense function name with the names of
other functions in hda_jack.h.

Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>
Reviewed-by: Aaron Plattner <aplattner@nvidia.com>
---
 sound/pci/hda/hda_jack.c   | 8 ++++----
 sound/pci/hda/hda_jack.h   | 2 +-
 sound/pci/hda/patch_hdmi.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/hda_jack.c b/sound/pci/hda/hda_jack.c
index 1fb7b06457ae..1ea42447278f 100644
--- a/sound/pci/hda/hda_jack.c
+++ b/sound/pci/hda/hda_jack.c
@@ -191,14 +191,14 @@ void snd_hda_jack_set_dirty_all(struct hda_codec *codec)
 EXPORT_SYMBOL_GPL(snd_hda_jack_set_dirty_all);
 
 /**
- * snd_hda_pin_sense - execute pin sense measurement
+ * snd_hda_jack_pin_sense - execute pin sense measurement
  * @codec: the CODEC to sense
  * @nid: the pin NID to sense
  *
  * Execute necessary pin sense measurement and return its Presence Detect,
  * Impedance, ELD Valid etc. status bits.
  */
-u32 snd_hda_pin_sense(struct hda_codec *codec, hda_nid_t nid)
+u32 snd_hda_jack_pin_sense(struct hda_codec *codec, hda_nid_t nid)
 {
 	struct hda_jack_tbl *jack = snd_hda_jack_tbl_get(codec, nid);
 	if (jack) {
@@ -207,7 +207,7 @@ u32 snd_hda_pin_sense(struct hda_codec *codec, hda_nid_t nid)
 	}
 	return read_pin_sense(codec, nid);
 }
-EXPORT_SYMBOL_GPL(snd_hda_pin_sense);
+EXPORT_SYMBOL_GPL(snd_hda_jack_pin_sense);
 
 /**
  * snd_hda_jack_detect_state - query pin Presence Detect status
@@ -222,7 +222,7 @@ int snd_hda_jack_detect_state(struct hda_codec *codec, hda_nid_t nid)
 	struct hda_jack_tbl *jack = snd_hda_jack_tbl_get(codec, nid);
 	if (jack && jack->phantom_jack)
 		return HDA_JACK_PHANTOM;
-	else if (snd_hda_pin_sense(codec, nid) & AC_PINSENSE_PRESENCE)
+	else if (snd_hda_jack_pin_sense(codec, nid) & AC_PINSENSE_PRESENCE)
 		return HDA_JACK_PRESENT;
 	else
 		return HDA_JACK_NOT_PRESENT;
diff --git a/sound/pci/hda/hda_jack.h b/sound/pci/hda/hda_jack.h
index 22fe7ee43e82..cd9b47f51fab 100644
--- a/sound/pci/hda/hda_jack.h
+++ b/sound/pci/hda/hda_jack.h
@@ -65,7 +65,7 @@ snd_hda_jack_detect_enable_callback(struct hda_codec *codec, hda_nid_t nid,
 int snd_hda_jack_set_gating_jack(struct hda_codec *codec, hda_nid_t gated_nid,
 				 hda_nid_t gating_nid);
 
-u32 snd_hda_pin_sense(struct hda_codec *codec, hda_nid_t nid);
+u32 snd_hda_jack_pin_sense(struct hda_codec *codec, hda_nid_t nid);
 
 /* the jack state returned from snd_hda_jack_detect_state() */
 enum {
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 3c720703ebb8..c1eee2274fb5 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1521,7 +1521,7 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 	bool ret;
 	bool do_repoll = false;
 
-	present = snd_hda_pin_sense(codec, pin_nid);
+	present = snd_hda_jack_pin_sense(codec, pin_nid);
 
 	mutex_lock(&per_pin->lock);
 	eld->monitor_present = !!(present & AC_PINSENSE_PRESENCE);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
