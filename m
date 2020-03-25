Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD9A193325
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 22:57:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D65001682;
	Wed, 25 Mar 2020 22:56:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D65001682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585173437;
	bh=xX00ycJ41j+Vu+51mYGZpnhFXf71Ot01+H1yEKpkCYc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EVPU0Uo5qHXVTAL++J2qFgw2H81bIhUOWgOfxR9rUv/gikiAq0rzWPqJHlju6HNUp
	 F0lxY3NPkNc7krq3xIcdnAN6a9MmPVxfhNnUBJcEPdGJ7jUUrkAhq6yvkJQvoTY65l
	 1jcBw/Inx/Yfa+03Zc2HH4Z/LKAh5+B920x8cnd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D53AF802F9;
	Wed, 25 Mar 2020 22:51:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1718F802E8; Wed, 25 Mar 2020 22:50:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FAA2F801DA
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 22:50:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FAA2F801DA
IronPort-SDR: yeAMh3AY3NM5bcID5N62Cc6z+RiZJP8PUYTm1SRaaWOkVxdPVaXIv4CgiV0odpALmjCf4u+Vcz
 Axw++mHWNQaw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 14:50:40 -0700
IronPort-SDR: okGQOdSUjBvCgZ1CUF5b1a046ZPbZWGXX6SWtdJDdsqX7Ea8qFuBk0OQMDQOwxaMPwjo3NOB06
 3mciY+wdqLug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="265666168"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by orsmga002.jf.intel.com with ESMTP; 25 Mar 2020 14:50:39 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 04/11] ASoC: SOF: Intel: hda: add SoundWire stream
 config/free callbacks
Date: Wed, 25 Mar 2020 16:50:20 -0500
Message-Id: <20200325215027.28716-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325215027.28716-1-pierre-louis.bossart@linux.intel.com>
References: <20200325215027.28716-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

These callbacks are invoked when a matching hw_params/hw_free() DAI
operation takes place, and will result in IPC operations with the SOF
firmware.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 71 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index c1fe94800da1..1f93124a63cd 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -24,6 +24,7 @@
 #include <sound/intel-nhlt.h>
 #include <sound/sof.h>
 #include <sound/sof/xtensa.h>
+#include "../sof-audio.h"
 #include "../ops.h"
 #include "hda.h"
 
@@ -38,6 +39,74 @@
 
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
@@ -80,6 +149,8 @@ static int hda_sdw_probe(struct snd_sof_dev *sdev)
 	res.irq = sdev->ipc_irq;
 	res.handle = hdev->info.handle;
 	res.parent = sdev->dev;
+	res.ops = &sdw_callback;
+	res.dev = sdev->dev;
 
 	/*
 	 * ops and arg fields are not populated for now,
-- 
2.20.1

