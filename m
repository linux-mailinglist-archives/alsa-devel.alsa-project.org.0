Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C031A3A05
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 20:51:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F1FA1693;
	Thu,  9 Apr 2020 20:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F1FA1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586458297;
	bh=vqCBEYg3HBJ/cEJLpXfe/7ESElL5B3SxGDh3K+OHpOg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SaVnugzcYJUmHf4rgE9x/XA146QQYebapyus4GkzqWLikjworwAXd+nu+UxgGXzSD
	 ktRozXg8DwOkbYI12uu1rlIkUudpa1BN0RCtUaqiSXpVR+gPOVco5AUrO03q/OqZBB
	 IVBfm+9n9IPRQFDniE2J/bf7ywznoBPxYRz5/Fto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FBAAF80216;
	Thu,  9 Apr 2020 20:49:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E816FF80216; Thu,  9 Apr 2020 20:49:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2372EF800CB
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 20:49:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2372EF800CB
IronPort-SDR: hiIf8fjRC+G7IElbk5PYzVjIvdpltzdltOLM6KAe/lEurArRsfmq0/NFI+tuCzonV5ErOGpF/E
 PZV02mI/LaQw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 11:49:04 -0700
IronPort-SDR: 1qJKRcu9yOK167bkvI9al0vvu1pYqxd49A0XP2sLFySQCk/SMEe3eAhxD/gCgYNi7m7psEkIui
 03Qq7VVeP4ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="255246433"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by orsmga006.jf.intel.com with ESMTP; 09 Apr 2020 11:49:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: SOF: remove unneeded variables
Date: Thu,  9 Apr 2020 13:48:52 -0500
Message-Id: <20200409184853.15896-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409184853.15896-1-pierre-louis.bossart@linux.intel.com>
References: <20200409184853.15896-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Payal Kshirsagar <payalskshirsagar1234@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Payal Kshirsagar <payalskshirsagar1234@gmail.com>

Remove unneeded temporary local variables and their declarations.
Change suggested by coccinelle.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Payal Kshirsagar <payalskshirsagar1234@gmail.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 5 +----
 sound/soc/sof/nocodec.c         | 6 ++----
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 3041fbbb010a..7e7e296a3953 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -207,7 +207,6 @@ EXPORT_SYMBOL_NS(hda_codec_i915_init, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
-	int ret;
 
 	if (!bus->audio_component)
 		return 0;
@@ -215,9 +214,7 @@ int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 	/* power down unconditionally */
 	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, false);
 
-	ret = snd_hdac_i915_exit(bus);
-
-	return ret;
+	return snd_hdac_i915_exit(bus);
 }
 EXPORT_SYMBOL_NS(hda_codec_i915_exit, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 
diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 2233146386cc..5bf67b2aa4e7 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -66,7 +66,6 @@ int sof_nocodec_setup(struct device *dev,
 		      const struct snd_sof_dsp_ops *ops)
 {
 	struct snd_soc_dai_link *links;
-	int ret;
 
 	/* create dummy BE dai_links */
 	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
@@ -74,9 +73,8 @@ int sof_nocodec_setup(struct device *dev,
 	if (!links)
 		return -ENOMEM;
 
-	ret = sof_nocodec_bes_setup(dev, ops, links, ops->num_drv,
-				    &sof_nocodec_card);
-	return ret;
+	return sof_nocodec_bes_setup(dev, ops, links, ops->num_drv,
+				     &sof_nocodec_card);
 }
 EXPORT_SYMBOL(sof_nocodec_setup);
 
-- 
2.20.1

