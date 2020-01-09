Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA6E13543C
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jan 2020 09:22:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2597B175D;
	Thu,  9 Jan 2020 09:21:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2597B175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578558150;
	bh=bQbHvU1eIWrY/q7d4kTsrSgE23TRHVAcXnEaE/rZYUg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Pz4jAWWYm7lCaLUqWA6wePmWDg8jk7o1mm8dVgiOSBcJUvvXizODVDs2NqhKE3Pbf
	 BozsbpBZFjZ2UTFQ/XGmLEQyYZjNgm66mBO4eQRd/etmT5Y+LN+JQo+hSepMblKcLO
	 l2OEPIXfGbiPouW9XnQ87ZuHbmwXmjxsQCn0uE+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B150CF8015B;
	Thu,  9 Jan 2020 09:20:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BC52F8015B; Thu,  9 Jan 2020 09:20:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 782EEF800E4
 for <alsa-devel@alsa-project.org>; Thu,  9 Jan 2020 09:20:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 782EEF800E4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D324EB1DB;
 Thu,  9 Jan 2020 08:20:13 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu,  9 Jan 2020 09:20:00 +0100
Message-Id: <20200109082000.26729-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ALSA: hda: Rename back to dmic_detect option
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

We've got quite a few bug reports showing the SOF driver being loaded
unintentionally recently, and the reason seems to be that users didn't
know the module option change: with the recent kernel, a new option
dsp_driver=1 has to be passed to a new module snd-intel-dspcfg
instead of snd_hda_intel.dmic_detect=0 option.

That is, actually there are two tricky things here:
- We changed the whole detection in another module and another
  option semantics.
- The existing option for skipping the DSP probe was also renamed.

For avoiding the confusion and giving user more hint, this patch
reverts the renamed option dsp_driver back to dmic_detect for
snd-hda-intel module, and show the warning about the module option
change when the non-default value is passed.

Fixes: 82d9d54a6c0e ("ALSA: hda: add Intel DSP configuration / probe code")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 5b92f290cbb0..8ef223aa1e37 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -125,7 +125,7 @@ static char *patch[SNDRV_CARDS];
 static bool beep_mode[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS-1)] =
 					CONFIG_SND_HDA_INPUT_BEEP_MODE};
 #endif
-static bool dsp_driver = 1;
+static bool dmic_detect = 1;
 
 module_param_array(index, int, NULL, 0444);
 MODULE_PARM_DESC(index, "Index value for Intel HD audio interface.");
@@ -160,9 +160,10 @@ module_param_array(beep_mode, bool, NULL, 0444);
 MODULE_PARM_DESC(beep_mode, "Select HDA Beep registration mode "
 			    "(0=off, 1=on) (default=1).");
 #endif
-module_param(dsp_driver, bool, 0444);
-MODULE_PARM_DESC(dsp_driver, "Allow DSP driver selection (bypass this driver) "
-			     "(0=off, 1=on) (default=1)");
+module_param(dmic_detect, bool, 0444);
+MODULE_PARM_DESC(dmic_detect, "Allow DSP driver selection (bypass this driver) "
+			     "(0=off, 1=on) (default=1); "
+		 "deprecated, use snd-intel-dspcfg.dsp_driver option instead");
 
 #ifdef CONFIG_PM
 static int param_set_xint(const char *val, const struct kernel_param *kp);
@@ -2099,11 +2100,13 @@ static int azx_probe(struct pci_dev *pci,
 	/*
 	 * stop probe if another Intel's DSP driver should be activated
 	 */
-	if (dsp_driver) {
+	if (dmic_detect) {
 		err = snd_intel_dsp_driver_probe(pci);
 		if (err != SND_INTEL_DSP_DRIVER_ANY &&
 		    err != SND_INTEL_DSP_DRIVER_LEGACY)
 			return -ENODEV;
+	} else {
+		dev_warn(&pci->dev, "dmic_detect option is deprecated, pass snd-intel-dspcfg.dsp_driver=1 option instead\n");
 	}
 
 	err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
