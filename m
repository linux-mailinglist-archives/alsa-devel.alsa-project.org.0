Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4823A204DC1
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 11:20:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAB141689;
	Tue, 23 Jun 2020 11:19:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAB141689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592904044;
	bh=lh4waOHilk3dvCUPjCqJmIDZT4LIsi2bPJ+ypKKuoXw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vQcxIg0iKmQGrYu5PR3sb+bAqCs7p0lYScbPEslDHkncXERA5FwTTP4yLUEnF6wN6
	 30RXIUo499a+mjiYyShT1Lp9Yn9fMGceeDrMai01/HByBcNDq8FxD/3CYsbvU+R2Hh
	 zqZoM17LlN3MOaW2/o5pfofKO09iwR7p1NaagZAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A6FFF80291;
	Tue, 23 Jun 2020 11:18:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B595EF8025E; Tue, 23 Jun 2020 11:18:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23EFEF800B2
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 11:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23EFEF800B2
IronPort-SDR: RUBa78uiutHRlxMWe3N6KuVrsBIkguv0N2zrONpOJQShuiiOF2nYZTe5/S9WXRoe+Ydke3v9tU
 7D0ivNCQ7OMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="145508135"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="145508135"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 02:17:53 -0700
IronPort-SDR: tfyBTA+OrLrVc1xPcJxkQzm1oxRhE9iotU3HGD3dUo0rECfJdeNpmMMgZxmHnfIvz7vnLF37rA
 9Ut8263okeog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="293141982"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga002.jf.intel.com with ESMTP; 23 Jun 2020 02:17:49 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 2/5] soundwire: stream: add helper to startup/shutdown streams
Date: Tue, 23 Jun 2020 05:23:29 +0800
Message-Id: <20200622212332.16277-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622212332.16277-1-yung-chuan.liao@linux.intel.com>
References: <20200622212332.16277-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

To handle streams at the dailink level, expose two helpers that will
be called from machine drivers.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c    | 90 +++++++++++++++++++++++++++++++++++
 include/linux/soundwire/sdw.h |  2 +
 2 files changed, 92 insertions(+)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index a9a72574b34a..48daf4b48f51 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -13,6 +13,9 @@
 #include <linux/slab.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
 #include "bus.h"
 
 /*
@@ -1826,3 +1829,90 @@ int sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 	return ret;
 }
 EXPORT_SYMBOL(sdw_deprepare_stream);
+
+static int set_stream(struct snd_pcm_substream *substream,
+		      struct sdw_stream_runtime *sdw_stream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *dai;
+	int ret = 0;
+	int i;
+
+	/* Set stream pointer on all DAIs */
+	for_each_rtd_dais(rtd, i, dai) {
+		ret = snd_soc_dai_set_sdw_stream(dai, sdw_stream,
+						 substream->stream);
+		if (ret < 0) {
+			dev_err(rtd->dev,
+				"failed to set stream pointer on dai %s",
+				dai->name);
+			break;
+		}
+	}
+
+	return ret;
+}
+
+int sdw_startup_stream(void *sdw_substream)
+{
+	struct snd_pcm_substream *substream = sdw_substream;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sdw_stream_runtime *sdw_stream;
+	char *name;
+	int ret;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		name = kasprintf(GFP_KERNEL, "%s-Playback", substream->name);
+	else
+		name = kasprintf(GFP_KERNEL, "%s-Capture", substream->name);
+
+	if (!name)
+		return -ENOMEM;
+
+	sdw_stream = sdw_alloc_stream(name);
+	if (!sdw_stream) {
+		dev_err(rtd->dev, "alloc stream failed for substream DAI %s",
+			substream->name);
+		ret = -ENOMEM;
+		goto error;
+	}
+
+	ret = set_stream(substream, sdw_stream);
+	if (ret < 0)
+		goto release_stream;
+	return 0;
+
+release_stream:
+	sdw_release_stream(sdw_stream);
+	set_stream(substream, NULL);
+error:
+	kfree(name);
+	return ret;
+}
+EXPORT_SYMBOL(sdw_startup_stream);
+
+void sdw_shutdown_stream(void *sdw_substream)
+{
+	struct snd_pcm_substream *substream = sdw_substream;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sdw_stream_runtime *sdw_stream;
+	struct snd_soc_dai *dai;
+
+	/* Find stream from first CPU DAI */
+	dai = asoc_rtd_to_cpu(rtd, 0);
+
+	sdw_stream = snd_soc_dai_get_sdw_stream(dai, substream->stream);
+
+	if (!sdw_stream) {
+		dev_err(rtd->dev, "no stream found for DAI %s", dai->name);
+		return;
+	}
+
+	/* release memory */
+	kfree(sdw_stream->name);
+	sdw_release_stream(sdw_stream);
+
+	/* clear DAI data */
+	set_stream(substream, NULL);
+}
+EXPORT_SYMBOL(sdw_shutdown_stream);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 9c27a32df9bb..51ecbd8faa8c 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -952,10 +952,12 @@ int sdw_stream_remove_master(struct sdw_bus *bus,
 		struct sdw_stream_runtime *stream);
 int sdw_stream_remove_slave(struct sdw_slave *slave,
 		struct sdw_stream_runtime *stream);
+int sdw_startup_stream(void *sdw_substream);
 int sdw_prepare_stream(struct sdw_stream_runtime *stream);
 int sdw_enable_stream(struct sdw_stream_runtime *stream);
 int sdw_disable_stream(struct sdw_stream_runtime *stream);
 int sdw_deprepare_stream(struct sdw_stream_runtime *stream);
+void sdw_shutdown_stream(void *sdw_substream);
 int sdw_bus_prep_clk_stop(struct sdw_bus *bus);
 int sdw_bus_clk_stop(struct sdw_bus *bus);
 int sdw_bus_exit_clk_stop(struct sdw_bus *bus);
-- 
2.17.1

