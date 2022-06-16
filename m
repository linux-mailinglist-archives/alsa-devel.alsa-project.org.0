Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF0154ECF7
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 23:59:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9162B1B1B;
	Thu, 16 Jun 2022 23:58:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9162B1B1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655416747;
	bh=+v5BbZAXtUz30qJrlHYR22iR9R12sH3C0O+pizuvBLA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I585xUZvcb7kzC8ULi1ylyZhbW7kkOWJv+SIlPRm2QR+DQUsr5yPpw5VUpvSRDfGm
	 IHZVwb08A4JcgbBkVR03KOULUdAQ6HlT/61r9UMPolihhrovqa0Fb3bX/Ab0nwTUe4
	 HV6UQEIVuw2ArZl3Sjpk4mnEKw8WOl38hRgwNkuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75F77F8057A;
	Thu, 16 Jun 2022 23:55:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3603F8053D; Thu, 16 Jun 2022 23:54:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 682A7F80534
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 23:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 682A7F80534
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="g9lXQyfu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655416488; x=1686952488;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+v5BbZAXtUz30qJrlHYR22iR9R12sH3C0O+pizuvBLA=;
 b=g9lXQyfuwEw59WmtazQZC6aS27qifHN9iGT8xj1lCaXariYDisr4ovE9
 OVoGDF55BdfDzqsrAzWDdAW8ewlv6Lq/iY7RGhMI3lS2oba+cGb5bwyP1
 1rrYRad2w6qJNA8ejpjX+Y5jmwUvW91L9l4kTc7sJuesH1lnl1PYF3AhR
 9MhGuQJi9N686zY8EksaNizHRovfzPv5IEakVGPUOBClLiyZccjZOTrdJ
 46bQoKoKIUFX6JOgKQDrkZAXKDH5CPvohkYKGVCRb4ii3GrSDRZ83dyN1
 wK64luVIAREfugXXIV8oGAPQp8QaIbNeyvPJi+T4g4yMhz41HcqgiBOvu A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="268047842"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="268047842"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:23 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="675212715"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:54:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/13] ASoC: Intel: boards: hda: remove use of __func__ in
 dev_dbg
Date: Thu, 16 Jun 2022 16:53:50 -0500
Message-Id: <20220616215351.135643-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
References: <20220616215351.135643-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

The module and function information can be added with
'modprobe foo dyndbg=+pmf'

Suggested-by: Greg KH <gregkh@linuxfoundation.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/hda_dsp_common.c      | 4 ++--
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/hda_dsp_common.c b/sound/soc/intel/boards/hda_dsp_common.c
index 5c31ddc0884ab..83c7dfbccd9d4 100644
--- a/sound/soc/intel/boards/hda_dsp_common.c
+++ b/sound/soc/intel/boards/hda_dsp_common.c
@@ -62,8 +62,8 @@ int hda_dsp_hdmi_build_controls(struct snd_soc_card *card,
 			hpcm->pcm = spcm;
 			hpcm->device = spcm->device;
 			dev_dbg(card->dev,
-				"%s: mapping HDMI converter %d to PCM %d (%p)\n",
-				__func__, i, hpcm->device, spcm);
+				"mapping HDMI converter %d to PCM %d (%p)\n",
+				i, hpcm->device, spcm);
 		} else {
 			hpcm->pcm = NULL;
 			hpcm->device = SNDRV_PCM_INVALID_DEVICE;
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index f4b4eeca3e03c..81144efb4b44e 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -75,7 +75,7 @@ skl_hda_add_dai_link(struct snd_soc_card *card, struct snd_soc_dai_link *link)
 	struct skl_hda_private *ctx = snd_soc_card_get_drvdata(card);
 	int ret = 0;
 
-	dev_dbg(card->dev, "%s: dai link name - %s\n", __func__, link->name);
+	dev_dbg(card->dev, "dai link name - %s\n", link->name);
 	link->platforms->name = ctx->platform_name;
 	link->nonatomic = 1;
 
@@ -203,7 +203,7 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
 	struct skl_hda_private *ctx;
 	int ret;
 
-	dev_dbg(&pdev->dev, "%s: entry\n", __func__);
+	dev_dbg(&pdev->dev, "entry\n");
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
-- 
2.34.1

