Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5478876C511
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 07:56:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F0BD7F8;
	Wed,  2 Aug 2023 07:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F0BD7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690955799;
	bh=VVqZYO0rARdOBU1oajHtmOXAGKSye6Y9eY3xVnlO75w=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qxIJxK2LBag4jCQBaBDbxrhiVUZaApdzhs9XaFjJtz5RmYi9powJolmOMMpFX3XgU
	 ibUScq3KBHVR6F6VeYx5aJoL3RYg2v3FA5tFuCHpAOYf6y1LqON/O6GZMCVREI3pIp
	 oHPigLKlqHl07Yl/LmvMOhVTjIRlnCaq+h3GFQck=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ADB8F80535; Wed,  2 Aug 2023 07:55:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8443CF8016D;
	Wed,  2 Aug 2023 07:55:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01811F80149; Wed,  2 Aug 2023 07:53:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2895F80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 07:51:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2895F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WsKkXnPd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690955496; x=1722491496;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VVqZYO0rARdOBU1oajHtmOXAGKSye6Y9eY3xVnlO75w=;
  b=WsKkXnPde/EA/u5ILSVNwSxYkVca3zKAXz6M0moMYMQYwX2PMS3KPzEf
   vZ1Uu0XshF8r2QSEB6jopz0xoCs48PrXUHd+mARdaPzGnHGhhZ9ICUrE5
   LhQMVjcoPFgtXv+ilH7SDcX9hmPqzFUOsqMv6RQyCHtTe/KAeH3eZJnxi
   n6lHKhXy6d4NAnm8kOAiujYWY+WpiI7wMES++lO9Us+6YTPmDWxo1S7gK
   YmE11kbBWltqYg7epAlK+g+yt9cfepl5zLxIn/ATLfE6SCKUaaYGdST95
   TZukfH7GKT6/hEmhY4i6GorLEBKVViLJlWnJP0SPrN9z06Jw2c+/iQ1fe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="455856584"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200";
   d="scan'208";a="455856584"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 22:51:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="678920393"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200";
   d="scan'208";a="678920393"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 22:51:26 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH] soundwire: intel_ace2x: add DAI hw_params/prepare/hw_free
 callbacks
Date: Wed,  2 Aug 2023 14:19:47 +0800
Message-Id: <20230802061947.3788679-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I47TQJS6ZZ5KFNJSDUS3AASKCDME2XKB
X-Message-ID-Hash: I47TQJS6ZZ5KFNJSDUS3AASKCDME2XKB
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I47TQJS6ZZ5KFNJSDUS3AASKCDME2XKB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The code is fork-lifted from intel.c and is mostly similar *except*
for the SHIM configuration which cannot be done here with the
introduction of HDAudio Extended links. The ACE2.x SOF side also
requires the hw_free and trigger callbacks to be implemented for
HDaudio DMA management

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel_ace2x.c | 283 ++++++++++++++++++++++++++++++++
 1 file changed, 283 insertions(+)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 1be0bea5f40f..a9d25ae0b73f 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -10,6 +10,7 @@
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_intel.h>
+#include <sound/pcm_params.h>
 #include <sound/hda-mlink.h>
 #include "cadence_master.h"
 #include "bus.h"
@@ -191,10 +192,292 @@ static bool intel_check_cmdsync_unlocked(struct sdw_intel *sdw)
 	return hdac_bus_eml_sdw_check_cmdsync_unlocked(sdw->link_res->hbus);
 }
 
+/* DAI callbacks */
+static int intel_params_stream(struct sdw_intel *sdw,
+			       struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai,
+			       struct snd_pcm_hw_params *hw_params,
+			       int link_id, int alh_stream_id)
+{
+	struct sdw_intel_link_res *res = sdw->link_res;
+	struct sdw_intel_stream_params_data params_data;
+
+	params_data.substream = substream;
+	params_data.dai = dai;
+	params_data.hw_params = hw_params;
+	params_data.link_id = link_id;
+	params_data.alh_stream_id = alh_stream_id;
+
+	if (res->ops && res->ops->params_stream && res->dev)
+		return res->ops->params_stream(res->dev,
+					       &params_data);
+	return -EIO;
+}
+
+static int intel_free_stream(struct sdw_intel *sdw,
+			     struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai,
+			     int link_id)
+
+{
+	struct sdw_intel_link_res *res = sdw->link_res;
+	struct sdw_intel_stream_free_data free_data;
+
+	free_data.substream = substream;
+	free_data.dai = dai;
+	free_data.link_id = link_id;
+
+	if (res->ops && res->ops->free_stream && res->dev)
+		return res->ops->free_stream(res->dev,
+					     &free_data);
+
+	return 0;
+}
+
 /*
  * DAI operations
  */
+static int intel_hw_params(struct snd_pcm_substream *substream,
+			   struct snd_pcm_hw_params *params,
+			   struct snd_soc_dai *dai)
+{
+	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+	struct sdw_cdns_dai_runtime *dai_runtime;
+	struct sdw_cdns_pdi *pdi;
+	struct sdw_stream_config sconfig;
+	struct sdw_port_config *pconfig;
+	int ch, dir;
+	int ret;
+
+	dai_runtime = cdns->dai_runtime_array[dai->id];
+	if (!dai_runtime)
+		return -EIO;
+
+	ch = params_channels(params);
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		dir = SDW_DATA_DIR_RX;
+	else
+		dir = SDW_DATA_DIR_TX;
+
+	pdi = sdw_cdns_alloc_pdi(cdns, &cdns->pcm, ch, dir, dai->id);
+
+	if (!pdi) {
+		ret = -EINVAL;
+		goto error;
+	}
+
+	/* the SHIM will be configured in the callback functions */
+
+	sdw_cdns_config_stream(cdns, ch, dir, pdi);
+
+	/* store pdi and state, may be needed in prepare step */
+	dai_runtime->paused = false;
+	dai_runtime->suspended = false;
+	dai_runtime->pdi = pdi;
+
+	/* Inform DSP about PDI stream number */
+	ret = intel_params_stream(sdw, substream, dai, params,
+				  sdw->instance,
+				  pdi->intel_alh_id);
+	if (ret)
+		goto error;
+
+	sconfig.direction = dir;
+	sconfig.ch_count = ch;
+	sconfig.frame_rate = params_rate(params);
+	sconfig.type = dai_runtime->stream_type;
+
+	sconfig.bps = snd_pcm_format_width(params_format(params));
+
+	/* Port configuration */
+	pconfig = kzalloc(sizeof(*pconfig), GFP_KERNEL);
+	if (!pconfig) {
+		ret =  -ENOMEM;
+		goto error;
+	}
+
+	pconfig->num = pdi->num;
+	pconfig->ch_mask = (1 << ch) - 1;
+
+	ret = sdw_stream_add_master(&cdns->bus, &sconfig,
+				    pconfig, 1, dai_runtime->stream);
+	if (ret)
+		dev_err(cdns->dev, "add master to stream failed:%d\n", ret);
+
+	kfree(pconfig);
+error:
+	return ret;
+}
+
+static int intel_prepare(struct snd_pcm_substream *substream,
+			 struct snd_soc_dai *dai)
+{
+	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+	struct sdw_cdns_dai_runtime *dai_runtime;
+	int ch, dir;
+	int ret = 0;
+
+	dai_runtime = cdns->dai_runtime_array[dai->id];
+	if (!dai_runtime) {
+		dev_err(dai->dev, "failed to get dai runtime in %s\n",
+			__func__);
+		return -EIO;
+	}
+
+	if (dai_runtime->suspended) {
+		struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+		struct snd_pcm_hw_params *hw_params;
+
+		hw_params = &rtd->dpcm[substream->stream].hw_params;
+
+		dai_runtime->suspended = false;
+
+		/*
+		 * .prepare() is called after system resume, where we
+		 * need to reinitialize the SHIM/ALH/Cadence IP.
+		 * .prepare() is also called to deal with underflows,
+		 * but in those cases we cannot touch ALH/SHIM
+		 * registers
+		 */
+
+		/* configure stream */
+		ch = params_channels(hw_params);
+		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+			dir = SDW_DATA_DIR_RX;
+		else
+			dir = SDW_DATA_DIR_TX;
+
+		/* the SHIM will be configured in the callback functions */
+
+		sdw_cdns_config_stream(cdns, ch, dir, dai_runtime->pdi);
+
+		/* Inform DSP about PDI stream number */
+		ret = intel_params_stream(sdw, substream, dai,
+					  hw_params,
+					  sdw->instance,
+					  dai_runtime->pdi->intel_alh_id);
+	}
+
+	return ret;
+}
+
+static int
+intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
+{
+	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+	struct sdw_cdns_dai_runtime *dai_runtime;
+	int ret;
+
+	dai_runtime = cdns->dai_runtime_array[dai->id];
+	if (!dai_runtime)
+		return -EIO;
+
+	/*
+	 * The sdw stream state will transition to RELEASED when stream->
+	 * master_list is empty. So the stream state will transition to
+	 * DEPREPARED for the first cpu-dai and to RELEASED for the last
+	 * cpu-dai.
+	 */
+	ret = sdw_stream_remove_master(&cdns->bus, dai_runtime->stream);
+	if (ret < 0) {
+		dev_err(dai->dev, "remove master from stream %s failed: %d\n",
+			dai_runtime->stream->name, ret);
+		return ret;
+	}
+
+	ret = intel_free_stream(sdw, substream, dai, sdw->instance);
+	if (ret < 0) {
+		dev_err(dai->dev, "intel_free_stream: failed %d\n", ret);
+		return ret;
+	}
+
+	dai_runtime->pdi = NULL;
+
+	return 0;
+}
+
+static int intel_pcm_set_sdw_stream(struct snd_soc_dai *dai,
+				    void *stream, int direction)
+{
+	return cdns_set_sdw_stream(dai, stream, direction);
+}
+
+static void *intel_get_sdw_stream(struct snd_soc_dai *dai,
+				  int direction)
+{
+	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
+	struct sdw_cdns_dai_runtime *dai_runtime;
+
+	dai_runtime = cdns->dai_runtime_array[dai->id];
+	if (!dai_runtime)
+		return ERR_PTR(-EINVAL);
+
+	return dai_runtime->stream;
+}
+
+static int intel_trigger(struct snd_pcm_substream *substream, int cmd, struct snd_soc_dai *dai)
+{
+	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+	struct sdw_intel_link_res *res = sdw->link_res;
+	struct sdw_cdns_dai_runtime *dai_runtime;
+	int ret = 0;
+
+	/*
+	 * The .trigger callback is used to program HDaudio DMA and send required IPC to audio
+	 * firmware.
+	 */
+	if (res->ops && res->ops->trigger) {
+		ret = res->ops->trigger(substream, cmd, dai);
+		if (ret < 0)
+			return ret;
+	}
+
+	dai_runtime = cdns->dai_runtime_array[dai->id];
+	if (!dai_runtime) {
+		dev_err(dai->dev, "failed to get dai runtime in %s\n",
+			__func__);
+		return -EIO;
+	}
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+
+		/*
+		 * The .prepare callback is used to deal with xruns and resume operations.
+		 * In the case of xruns, the DMAs and SHIM registers cannot be touched,
+		 * but for resume operations the DMAs and SHIM registers need to be initialized.
+		 * the .trigger callback is used to track the suspend case only.
+		 */
+
+		dai_runtime->suspended = true;
+
+		break;
+
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		dai_runtime->paused = true;
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		dai_runtime->paused = false;
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
 static const struct snd_soc_dai_ops intel_pcm_dai_ops = {
+	.hw_params = intel_hw_params,
+	.prepare = intel_prepare,
+	.hw_free = intel_hw_free,
+	.trigger = intel_trigger,
+	.set_stream = intel_pcm_set_sdw_stream,
+	.get_stream = intel_get_sdw_stream,
 };
 
 static const struct snd_soc_component_driver dai_component = {
-- 
2.25.1

