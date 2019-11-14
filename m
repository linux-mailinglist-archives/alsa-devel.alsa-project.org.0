Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55292FC03D
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 07:37:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDAAC839;
	Thu, 14 Nov 2019 07:36:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDAAC839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573713440;
	bh=n/WtOnXq9zoWg6et7zK+bgYhYHqE/qkNjW2R8XgIQuM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k4OPjbqpUOR6sGrOcH3TFLAbtwwfjdUN5RE/q+rE5RIxzSyrIeg82d6ZkLedLr9bP
	 LuI6BFkqJZy2pJeobSkfAZKUpqewtvo82Lh5m1yWzIX2JsD+1k9TNmKEkNZlIarKSJ
	 sx5DpYICVaZ+OAjF3bwdMmhaSmGkDdXb0//Emj3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1EF5F80101;
	Thu, 14 Nov 2019 07:34:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8079FF800E9; Thu, 14 Nov 2019 04:37:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78373F80084
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 04:37:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78373F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="BW3SV5IP"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcccbfe0000>; Wed, 13 Nov 2019 19:37:34 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 19:37:35 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 13 Nov 2019 19:37:35 -0800
Received: from nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 14 Nov 2019 03:37:33 +0000
From: Nikhil Mahale <nmahale@nvidia.com>
To: <tiwai@suse.com>
Date: Thu, 14 Nov 2019 09:07:00 +0530
Message-ID: <20191114033704.18171-2-nmahale@nvidia.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191114033704.18171-1-nmahale@nvidia.com>
References: <20191114033704.18171-1-nmahale@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1573702654; bh=Ut1sS2kDd5HiDDgeTKhlpYi5pzsGfMp26reLAkEKJgs=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 X-Originating-IP:X-ClientProxiedBy:Content-Type;
 b=BW3SV5IPKMfNUMC1On8L5ALOjoBdXmBTgeX4SDx6qH6fD3S3DG+A+o02XnmJQBF+n
 beKgabChuxum6xtc61WJEuL53nVeKjHbQuz5scD/nD3DZfaGhES00nBMFTBizr71al
 vFovFz91kxCvUJcMCgWkXOQ7cAxpnfJwk77U+y0dbC9rjkjGaDJs9NdxsdoiRRfGIx
 L5DS7H81R9rgEBvHmlRu6Dp+9pTc5ukup+dycVdRu4yQDylQjrqw9kcUIMVxRaODJf
 mPASoHLhND1NK0BFlwLce4j9//37tgvZIklndcbpGN8jqQiX7TuYj6R0uDZHRwRhLF
 4kCUfMsJeVlQw==
X-Mailman-Approved-At: Thu, 14 Nov 2019 07:34:48 +0100
Cc: alsa-devel@alsa-project.org, nmahale@nvidia.com, aplattner@nvidia.com
Subject: [alsa-devel] [PATCH v1 1/5] ALSA: hda - Rename snd_hda_pin_sense to
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
