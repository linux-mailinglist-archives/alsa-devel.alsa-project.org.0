Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1965F154C9D
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 21:05:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7DBA16E0;
	Thu,  6 Feb 2020 21:04:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7DBA16E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581019503;
	bh=YFfrztoNigSFXbunzb8k5OEpxv1b0VoKTRHlvGuirKk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YeGKR3usrJKLVrIf7YHuOBhyLH9+cCzLx8j23PAPk7mbqFp914cP3x+yWDzMXMCb/
	 qFfNJvlz4XghlfrCinIoAaAN6Nu3lvadELxYY87BKz6jO4rRlVWip9m9hRWuK4KIul
	 KhecLn7st3Dw6w7Qah+uyzHa4OWFvcF22lfKvwlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C06FBF80162;
	Thu,  6 Feb 2020 21:02:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44A25F80255; Thu,  6 Feb 2020 21:02:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9923F800C6
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 21:02:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9923F800C6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Feb 2020 12:02:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,410,1574150400"; d="scan'208";a="255197721"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 06 Feb 2020 12:02:38 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Date: Thu,  6 Feb 2020 22:02:23 +0200
Message-Id: <20200206200223.7715-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200206200223.7715-1-kai.vehmanen@linux.intel.com>
References: <20200206200223.7715-1-kai.vehmanen@linux.intel.com>
Cc: tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, ranjani.sridharan@linux.intel.com
Subject: [alsa-devel] [PATCH 3/3] ASoC: SOF: Intel: hda: move i915 init
	earlier
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

To be compliant with i915 display driver requirements, i915 power-up
must be done before any HDA communication takes place, including
parsing the bus capabilities. Otherwise the initial codec probe
may fail.

Move i915 initialization earlier in the SOF HDA sequence. This
sequence is now aligned with the snd-hda-intel driver where the
display_power() call is before snd_hdac_bus_parse_capabilities()
and rest of the capability parsing.

Also remove unnecessary ifdef around hda_codec_i915_init(). There's
a dummy implementation provided if CONFIG_SND_SOC_SOF_HDA is not
enabled.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 8fddafb5c1d4..25946a1c2822 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -286,6 +286,13 @@ static int hda_init(struct snd_sof_dev *sdev)
 	/* HDA base */
 	sdev->bar[HDA_DSP_HDA_BAR] = bus->remap_addr;
 
+	/* init i915 and HDMI codecs */
+	ret = hda_codec_i915_init(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: init i915 and HDMI codec failed\n");
+		return ret;
+	}
+
 	/* get controller capabilities */
 	ret = hda_dsp_ctrl_get_caps(sdev);
 	if (ret < 0)
@@ -353,15 +360,6 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	if (bus->ppcap)
 		dev_dbg(sdev->dev, "PP capability, will probe DSP later.\n");
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	/* init i915 and HDMI codecs */
-	ret = hda_codec_i915_init(sdev);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: init i915 and HDMI codec failed\n");
-		return ret;
-	}
-#endif
-
 	/* Init HDA controller after i915 init */
 	ret = hda_dsp_ctrl_init_chip(sdev, true);
 	if (ret < 0) {
@@ -611,6 +609,7 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	iounmap(sdev->bar[HDA_DSP_BAR]);
 hdac_bus_unmap:
 	iounmap(bus->remap_addr);
+	hda_codec_i915_exit(sdev);
 err:
 	return ret;
 }
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
