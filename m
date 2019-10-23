Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E85BE2511
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 23:18:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDECD1678;
	Wed, 23 Oct 2019 23:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDECD1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571865533;
	bh=1F5ok7vfKGfGZfKatifDeHWevbA5qrlakZje8Vg3n4E=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O3wJMIg/yMO0fquLBHF+sE1Sg8mQlR4l3lR0FbpQ0Wdn5hYVljcsGOfn3Hy2sOWWF
	 llFo4huKQKYmNlCasoNTwfQboU6kxQYDhYaQkL/qY8IuMU8DsrlLS4qYqHSEj2vTlh
	 G68i0Wa0foQEy+5iGh+wdH2fDqwcQbCWSRDm8N1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 793CBF80636;
	Wed, 23 Oct 2019 23:15:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66CF1F80634; Wed, 23 Oct 2019 23:15:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47022F80610
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 23:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47022F80610
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 14:15:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,222,1569308400"; d="scan'208";a="373003450"
Received: from ayamada-mobl1.gar.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.95.208])
 by orsmga005.jf.intel.com with ESMTP; 23 Oct 2019 14:15:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 23 Oct 2019 16:15:02 -0500
Message-Id: <20191023211504.32675-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191023211504.32675-1-pierre-louis.bossart@linux.intel.com>
References: <20191023211504.32675-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de, gregkh@linuxfoundation.org,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/5] ASoC: SOF: Intel: hda: add SoundWire
	stream config/free callbacks
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

These callbacks are invoked when a matching hw_params/hw_free() DAI
operation takes place, and will result in IPC operations with the SOF
firmware.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 70 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 7e36f3bd6b39..98ac38ca0afa 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -38,6 +38,74 @@
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 
+static int sdw_params_stream(struct device *dev,
+			     struct sdw_intel_stream_params_data *params_data)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	struct snd_soc_dai *d = params_data->dai;
+	struct sof_ipc_dai_config config;
+	struct sof_ipc_reply reply;
+	int link_id = params_data->link_id;
+	int alh_stream_id = params_data->alh_stream_id;
+	int ret;
+	u32 size = sizeof(config);
+
+	memset(&config, 0, size);
+	config.hdr.size = size;
+	config.hdr.cmd = SOF_IPC_GLB_DAI_MSG | SOF_IPC_DAI_CONFIG;
+	config.type = SOF_DAI_INTEL_ALH;
+	config.dai_index = (link_id << 8) | (d->id);
+	config.alh.stream_id = alh_stream_id;
+
+	/* send message to DSP */
+	ret = sof_ipc_tx_message(sdev->ipc,
+				 config.hdr.cmd, &config, size, &reply,
+				 sizeof(reply));
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: failed to set DAI hw_params for link %d dai->id %d ALH %d\n",
+			link_id, d->id, alh_stream_id);
+	}
+
+	return ret;
+}
+
+static int sdw_free_stream(struct device *dev,
+			   struct sdw_intel_stream_free_data *free_data)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	struct snd_soc_dai *d = free_data->dai;
+	struct sof_ipc_dai_config config;
+	struct sof_ipc_reply reply;
+	int link_id = free_data->link_id;
+	int ret;
+	u32 size = sizeof(config);
+
+	memset(&config, 0, size);
+	config.hdr.size = size;
+	config.hdr.cmd = SOF_IPC_GLB_DAI_MSG | SOF_IPC_DAI_CONFIG;
+	config.type = SOF_DAI_INTEL_ALH;
+	config.dai_index = (link_id << 8) | d->id;
+	config.alh.stream_id = 0xFFFF; /* invalid value on purpose */
+
+	/* send message to DSP */
+	ret = sof_ipc_tx_message(sdev->ipc,
+				 config.hdr.cmd, &config, size, &reply,
+				 sizeof(reply));
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: failed to free stream for link %d dai->id %d\n",
+			link_id, d->id);
+	}
+
+	return ret;
+}
+
+static const struct sdw_intel_ops sdw_callback = {
+	.params_stream = sdw_params_stream,
+	.free_stream = sdw_free_stream,
+};
+
 void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable)
 {
 	sdw_intel_enable_irq(sdev->bar[HDA_DSP_BAR], enable);
@@ -80,6 +148,8 @@ static int hda_sdw_probe(struct snd_sof_dev *sdev)
 	res.irq = sdev->ipc_irq;
 	res.handle = hdev->info.handle;
 	res.parent = sdev->dev;
+	res.ops = &sdw_callback;
+	res.dev = sdev->dev;
 
 	/*
 	 * ops and arg fields are not populated for now,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
