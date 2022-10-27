Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3066101C9
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:37:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2E942DBD;
	Thu, 27 Oct 2022 21:37:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2E942DBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899472;
	bh=jp84543Dz5iSmY7f0aaxD/1wl33rSRQ129XLjUbL2Mw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rBR8Mf6Y8f9zr1xMmWRrf0CT4y/FthZaJ5ycRyENEpvLNWYvaKU0Njj2mcwRn2MKC
	 OeWU0+iyzZkzyt41PQ/qCJEQS5IH5FzmG4/DGu3GYITeQ5BdrTBidx0Brwx+KuEuLj
	 ZUHNW1fQbF9ylS5rMtmIWxs0sW0GnFPIt37vxKTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA14EF80563;
	Thu, 27 Oct 2022 21:36:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DE29F80557; Thu, 27 Oct 2022 21:36:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF237F8025E
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF237F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="azvmozec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899368; x=1698435368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jp84543Dz5iSmY7f0aaxD/1wl33rSRQ129XLjUbL2Mw=;
 b=azvmozec/WtVbU969HbW1I0ASC3ip4z3cwnKx5QDQT4ezH3VauHRG1S2
 vQb869mVxHoA+YOOIWJiujL41GLKvkSToKvAFx3oIMVDXmK/iW9o88TMf
 A1nJ1IdmxX/4xZAR8Y5LmaGMZnJ9zwAYwVDGctBH6RC9yUyZepmI/2Dt6
 8v3WZ7jZNvBgrH5kOMd7nbihJ2rtgqjS7nhzKE1LtQMNn2zYU4IdHwJGm
 w+1DNJJ3WI3h1Wpuc37iB8Cka9a7O9DqaKpfXyXevuM0HxY8SpPuQfXku
 72pEfqg6xV473Kg8xZI0TH3fPuN9FsD7j1LTtBuMtVneQGUfWgbWmxGM5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957807"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957807"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:05 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632526957"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632526957"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/21] ASoC: SOF: Intel: remove all dependencies on
 SND_SOC_HDAC_HDMI
Date: Thu, 27 Oct 2022 15:35:21 -0400
Message-Id: <20221027193540.259520-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
References: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

remove all dependencies on SND_SOC_HDAC_HDMI and
clean-up ifdefs. The machine driver still supports this configuration
used by the Skylake driver.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 3 +--
 sound/soc/sof/intel/hda.h       | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index d5242b6e1552..7feaf2ccb642 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -231,8 +231,7 @@ void hda_codec_probe_bus(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL_NS(hda_codec_probe_bus, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
-#if IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI) || \
-	IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC) && IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI)
 
 void hda_codec_i915_display_power(struct snd_sof_dev *sdev, bool enable)
 {
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index e715bae32cad..7a3184ed8b70 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -720,9 +720,7 @@ void hda_codec_jack_check(struct snd_sof_dev *sdev);
 
 #endif /* CONFIG_SND_SOC_SOF_HDA */
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) && \
-	(IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI) || \
-	 IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI))
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC) && IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI)
 
 void hda_codec_i915_display_power(struct snd_sof_dev *sdev, bool enable);
 int hda_codec_i915_init(struct snd_sof_dev *sdev);
-- 
2.34.1

