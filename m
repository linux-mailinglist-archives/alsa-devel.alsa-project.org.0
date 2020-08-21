Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1A724DB33
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 18:36:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B3021719;
	Fri, 21 Aug 2020 18:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B3021719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598027772;
	bh=4RWpZvOoJA/5UINqIY4RDIvOA2ssL54rfpG3Hg+9Hsk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JnTYdUcbekNBBOVpi6piRBIT3LNfMwEHHDpldGlsK0PKnhqwoQzpTOs9LbReNtdtd
	 /Sx47HNETXy0J8JtB6NEtJ5q6yzLUoZoMFuWF46L6BwtcZ8r/w/ndyb1Z+hi4tNliz
	 rhd2/nqP70SV0Is5MG5SijmLzqF2YGsvNfrh1h50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A05BDF803D6;
	Fri, 21 Aug 2020 18:20:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70EE5F80260; Fri, 21 Aug 2020 18:20:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8200DF80304
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 18:20:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8200DF80304
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GAys6x+P"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B125922B40;
 Fri, 21 Aug 2020 16:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598026816;
 bh=4RWpZvOoJA/5UINqIY4RDIvOA2ssL54rfpG3Hg+9Hsk=;
 h=From:To:Cc:Subject:Date:From;
 b=GAys6x+PK8KwLDVTKbANrGXfHsMp9uHpnRZkp7vSTe1Llt9kHMm+tHSeruhHzKYTZ
 MutNerPmg4NuPwLxYbNaCCgXZipXa05BYAEXhTRa7+t/M3TB0hsAMSfeDtnuP80QdT
 Si01ohWVh+zF08OC/PjIvLYgt4KFBwAGS+Lv6CvM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 01/22] ALSA: pci: delete repeated words in comments
Date: Fri, 21 Aug 2020 12:19:53 -0400
Message-Id: <20200821162014.349506-1-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Randy Dunlap <rdunlap@infradead.org>
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

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit c7fabbc51352f50cc58242a6dc3b9c1a3599849b ]

Drop duplicated words in sound/pci/.
{and, the, at}

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/r/20200806021926.32418-1-rdunlap@infradead.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/cs46xx/cs46xx_lib.c       | 2 +-
 sound/pci/cs46xx/dsp_spos_scb_lib.c | 2 +-
 sound/pci/hda/hda_codec.c           | 2 +-
 sound/pci/hda/hda_generic.c         | 2 +-
 sound/pci/hda/patch_sigmatel.c      | 2 +-
 sound/pci/ice1712/prodigy192.c      | 2 +-
 sound/pci/oxygen/xonar_dg.c         | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 2706f271a83b0..8a174c170e0aa 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -780,7 +780,7 @@ static void snd_cs46xx_set_capture_sample_rate(struct snd_cs46xx *chip, unsigned
 		rate = 48000 / 9;
 
 	/*
-	 *  We can not capture at at rate greater than the Input Rate (48000).
+	 *  We can not capture at a rate greater than the Input Rate (48000).
 	 *  Return an error if an attempt is made to stray outside that limit.
 	 */
 	if (rate > 48000)
diff --git a/sound/pci/cs46xx/dsp_spos_scb_lib.c b/sound/pci/cs46xx/dsp_spos_scb_lib.c
index 7488e1b7a7707..4e726d39b05d1 100644
--- a/sound/pci/cs46xx/dsp_spos_scb_lib.c
+++ b/sound/pci/cs46xx/dsp_spos_scb_lib.c
@@ -1742,7 +1742,7 @@ int cs46xx_iec958_pre_open (struct snd_cs46xx *chip)
 	struct dsp_spos_instance * ins = chip->dsp_spos_instance;
 
 	if ( ins->spdif_status_out & DSP_SPDIF_STATUS_OUTPUT_ENABLED ) {
-		/* remove AsynchFGTxSCB and and PCMSerialInput_II */
+		/* remove AsynchFGTxSCB and PCMSerialInput_II */
 		cs46xx_dsp_disable_spdif_out (chip);
 
 		/* save state */
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 825d9b27dbe12..4962a9d8a572b 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -3496,7 +3496,7 @@ EXPORT_SYMBOL_GPL(snd_hda_set_power_save);
  * @nid: NID to check / update
  *
  * Check whether the given NID is in the amp list.  If it's in the list,
- * check the current AMP status, and update the the power-status according
+ * check the current AMP status, and update the power-status according
  * to the mute status.
  *
  * This function is supposed to be set or called from the check_power_status
diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index 869c322ddae31..7cd1047a4edf3 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -837,7 +837,7 @@ static void activate_amp_in(struct hda_codec *codec, struct nid_path *path,
 	}
 }
 
-/* sync power of each widget in the the given path */
+/* sync power of each widget in the given path */
 static hda_nid_t path_power_update(struct hda_codec *codec,
 				   struct nid_path *path,
 				   bool allow_powerdown)
diff --git a/sound/pci/hda/patch_sigmatel.c b/sound/pci/hda/patch_sigmatel.c
index d1a6d20ace0da..80b72d0702c5e 100644
--- a/sound/pci/hda/patch_sigmatel.c
+++ b/sound/pci/hda/patch_sigmatel.c
@@ -862,7 +862,7 @@ static int stac_auto_create_beep_ctls(struct hda_codec *codec,
 	static struct snd_kcontrol_new beep_vol_ctl =
 		HDA_CODEC_VOLUME(NULL, 0, 0, 0);
 
-	/* check for mute support for the the amp */
+	/* check for mute support for the amp */
 	if ((caps & AC_AMPCAP_MUTE) >> AC_AMPCAP_MUTE_SHIFT) {
 		const struct snd_kcontrol_new *temp;
 		if (spec->anabeep_nid == nid)
diff --git a/sound/pci/ice1712/prodigy192.c b/sound/pci/ice1712/prodigy192.c
index 3919aed39ca03..5e52086d7b986 100644
--- a/sound/pci/ice1712/prodigy192.c
+++ b/sound/pci/ice1712/prodigy192.c
@@ -31,7 +31,7 @@
  *		  Experimentally I found out that only a combination of
  *		  OCKS0=1, OCKS1=1 (128fs, 64fs output) and ice1724 -
  *		  VT1724_MT_I2S_MCLK_128X=0 (256fs input) yields correct
- *		  sampling rate. That means the the FPGA doubles the
+ *		  sampling rate. That means that the FPGA doubles the
  *		  MCK01 rate.
  *
  *	Copyright (c) 2003 Takashi Iwai <tiwai@suse.de>
diff --git a/sound/pci/oxygen/xonar_dg.c b/sound/pci/oxygen/xonar_dg.c
index 4cf3200e988b0..df44135e1b0c9 100644
--- a/sound/pci/oxygen/xonar_dg.c
+++ b/sound/pci/oxygen/xonar_dg.c
@@ -39,7 +39,7 @@
  *   GPIO 4 <- headphone detect
  *   GPIO 5 -> enable ADC analog circuit for the left channel
  *   GPIO 6 -> enable ADC analog circuit for the right channel
- *   GPIO 7 -> switch green rear output jack between CS4245 and and the first
+ *   GPIO 7 -> switch green rear output jack between CS4245 and the first
  *             channel of CS4361 (mechanical relay)
  *   GPIO 8 -> enable output to speakers
  *
-- 
2.25.1

