Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D129857F
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 22:22:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FD781664;
	Wed, 21 Aug 2019 22:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FD781664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566418971;
	bh=DGtT1NI66vgJloFOi7QdCwzapGK2bdPBegwnET08cBE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RE2OMqFWvTdmbh4WWzkAaZbsxhfGQTzy2N7P5ag/UIMhGXHS+WWIu5bh2pK+d5sk6
	 MetSSttqNhZVvD6p1a4QUSaB6Gl3HYHGrf4qI8PiBNx66G3g4zVBG7ZVSHqs336k5k
	 7RXpBtgEipheRZd5yqrTTAQBJsbbxGINZo/GTqYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A614F80635;
	Wed, 21 Aug 2019 22:18:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2657F80635; Wed, 21 Aug 2019 22:18:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48D02F80633
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 22:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48D02F80633
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 13:18:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="186344260"
Received: from smasango-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.100])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Aug 2019 13:18:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 21 Aug 2019 15:17:20 -0500
Message-Id: <20190821201720.17768-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821201720.17768-1-pierre-louis.bossart@linux.intel.com>
References: <20190821201720.17768-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Keyon Jie <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 srinivas.kandagatla@linaro.org, jank@cadence.com,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 YueHaibing <yuehaibing@huawei.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Fred Oh <fred.oh@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, gregkh@linuxfoundation.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, slawomir.blauciak@intel.com
Subject: [alsa-devel] [RFC PATCH 5/5] ASoC: SOF: Intel: add support for
	SoundWire suspend/resume
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

Somehow the core0 needs to be on to set-up the interrupts and power-up
the SoundWire IP.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 11 +++++++++++
 sound/soc/sof/intel/hda.c     |  2 +-
 sound/soc/sof/intel/hda.h     |  5 +++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index fb55a3c5afd0..e1ade59ac6e1 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -374,6 +374,17 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 	hda_dsp_ctrl_ppcap_enable(sdev, true);
 	hda_dsp_ctrl_ppcap_int_enable(sdev, true);
 
+#if IS_ENABLED(CONFIG_SOUNDWIRE_INTEL)
+	/* need to power-up core before setting-up capabilities */
+	ret = hda_dsp_core_power_up(sdev, HDA_DSP_CORE_MASK(0));
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: could not power-up DSP subsystem\n");
+		return ret;
+	}
+
+	hda_sdw_int_enable(sdev, true);
+#endif
+
 	return 0;
 }
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 1e84ea9e6fce..09aa0cfa6099 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -39,7 +39,7 @@
 
 #if IS_ENABLED(CONFIG_SOUNDWIRE_INTEL)
 
-static void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable)
+void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable)
 {
 	if (enable)
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 48e09b7daf0a..de71c92b2f39 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -591,6 +591,11 @@ int hda_dsp_trace_init(struct snd_sof_dev *sdev, u32 *stream_tag);
 int hda_dsp_trace_release(struct snd_sof_dev *sdev);
 int hda_dsp_trace_trigger(struct snd_sof_dev *sdev, int cmd);
 
+/*
+ * SoundWire support
+ */
+void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable);
+
 /* common dai driver */
 extern struct snd_soc_dai_driver skl_dai[];
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
