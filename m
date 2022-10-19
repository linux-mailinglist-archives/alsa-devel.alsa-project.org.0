Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 611EE604F02
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 19:39:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03CE2AF6B;
	Wed, 19 Oct 2022 19:38:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03CE2AF6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666201187;
	bh=X6ERsaplFZcFyluM7SM6wtFgzqvW5XPJkxeS/1o8WWg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qhiDTeYRdxlOVeFj7gfsz8V8MH2m/AAQSodOVaivO5i8oWAQCn7G3U3rS8IVpZ55k
	 gSc9PM6M2NgBKLI6mH7Xm0JuC0s96u3JmJRejX7JKs5mZobbn9fd8KciZD+iPoTCmG
	 twi7UhgbtPatE0TN0RuV/WMaubsHYVSAD/NtdFvg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BBC9F80137;
	Wed, 19 Oct 2022 19:37:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 315B6F80552; Wed, 19 Oct 2022 19:37:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB3A7F80137
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 19:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB3A7F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="C2H0X8Hp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666201054; x=1697737054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X6ERsaplFZcFyluM7SM6wtFgzqvW5XPJkxeS/1o8WWg=;
 b=C2H0X8HpNhUDvbc6pFyQReCpU8hRkWQvTyVQrJHWc8wKWPuYgmyIAbyT
 gvc/UXhbA13uolPy1q1PswkZuiW9pYtgziGW/AZj0fHQmFg0VagXYWBMJ
 2l0mC2jOCmLHEebvfnhqA11Ury0aKwTvxSoflTDtay9kMyOxJ7KbsPsMe
 iI/1crjMQYWTU4oLJfkkpKFZnstUJeHhXIHiGFOoheINq/QTHMSZcpXKN
 w9hGFBhiqdSmU4J7uDE0kGkF3laSr4JI2cNXeYx4gcJJC3IyzK6F86hul
 7WgLUbzOmeOFlxGyFW8W0kJQHNAd5aunY9Vosxh8zjOpcHv6Z+ekBVX38 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333045664"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="333045664"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 10:37:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="771898531"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="771898531"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2022 10:37:15 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/8] ASoC: Intel: avs: Handle SUSPEND and RESUME triggers
Date: Wed, 19 Oct 2022 19:53:12 +0200
Message-Id: <20221019175317.1540919-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019175317.1540919-1-cezary.rojewski@intel.com>
References: <20221019175317.1540919-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

With power management operations added, service SUSPEND and RESUME
trigger commands for running streams.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 81 +++++++++++++++++++++++++++++++--------
 1 file changed, 66 insertions(+), 15 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 55f213d5bab9..5c9923cba126 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -208,30 +208,43 @@ static int avs_dai_nonhda_be_prepare(struct snd_pcm_substream *substream, struct
 static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 				     struct snd_soc_dai *dai)
 {
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
 	struct avs_dma_data *data;
 	int ret = 0;
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
 
 	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_RESUME:
+		if (rtd->dai_link->ignore_suspend)
+			break;
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		ret = avs_path_pause(data->path);
+		if (ret < 0) {
+			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
+			break;
+		}
+
 		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
 		if (ret < 0)
 			dev_err(dai->dev, "run BE path failed: %d\n", ret);
 		break;
 
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		if (rtd->dai_link->ignore_suspend)
+			break;
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
 		ret = avs_path_pause(data->path);
 		if (ret < 0)
 			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
 
-		if (cmd == SNDRV_PCM_TRIGGER_STOP) {
-			ret = avs_path_reset(data->path);
-			if (ret < 0)
-				dev_err(dai->dev, "reset BE path failed: %d\n", ret);
-		}
+		ret = avs_path_reset(data->path);
+		if (ret < 0)
+			dev_err(dai->dev, "reset BE path failed: %d\n", ret);
 		break;
 
 	default:
@@ -351,6 +364,7 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 				  struct snd_soc_dai *dai)
 {
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
 	struct hdac_ext_stream *link_stream;
 	struct avs_dma_data *data;
 	int ret = 0;
@@ -361,15 +375,29 @@ static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 	link_stream = substream->runtime->private_data;
 
 	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_RESUME:
+		if (rtd->dai_link->ignore_suspend)
+			break;
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		snd_hdac_ext_link_stream_start(link_stream);
 
+		ret = avs_path_pause(data->path);
+		if (ret < 0) {
+			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
+			break;
+		}
+
 		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
 		if (ret < 0)
 			dev_err(dai->dev, "run BE path failed: %d\n", ret);
 		break;
 
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		if (rtd->dai_link->ignore_suspend)
+			break;
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
 		ret = avs_path_pause(data->path);
@@ -378,11 +406,9 @@ static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 
 		snd_hdac_ext_link_stream_clear(link_stream);
 
-		if (cmd == SNDRV_PCM_TRIGGER_STOP) {
-			ret = avs_path_reset(data->path);
-			if (ret < 0)
-				dev_err(dai->dev, "reset BE path failed: %d\n", ret);
-		}
+		ret = avs_path_reset(data->path);
+		if (ret < 0)
+			dev_err(dai->dev, "reset BE path failed: %d\n", ret);
 		break;
 
 	default:
@@ -587,6 +613,7 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 
 static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, struct snd_soc_dai *dai)
 {
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
 	struct avs_dma_data *data;
 	struct hdac_ext_stream *host_stream;
 	struct hdac_bus *bus;
@@ -598,17 +625,42 @@ static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, stru
 	bus = hdac_stream(host_stream)->bus;
 
 	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_RESUME:
+		if (rtd->dai_link->ignore_suspend)
+			break;
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		spin_lock_irqsave(&bus->reg_lock, flags);
 		snd_hdac_stream_start(hdac_stream(host_stream), true);
 		spin_unlock_irqrestore(&bus->reg_lock, flags);
 
+		if (cmd == SNDRV_PCM_TRIGGER_RESUME) {
+			u32 mask = 1 << hdac_stream(host_stream)->index;
+			u32 reg;
+
+			ret = readb_poll_timeout(bus->drsmcap + AZX_REG_DRSM_CTL, reg,
+						 (reg & mask) == 0, 250, 2000);
+			if (ret)
+				dev_dbg(dai->dev, "polling RSM 0x%08x failed: %d\n", mask, ret);
+		}
+
+		ret = avs_path_pause(data->path);
+		if (ret < 0) {
+			dev_err(dai->dev, "pause FE path failed: %d\n", ret);
+			break;
+		}
+
 		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
 		if (ret < 0)
 			dev_err(dai->dev, "run FE path failed: %d\n", ret);
+
 		break;
 
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		if (rtd->dai_link->ignore_suspend)
+			break;
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
 		ret = avs_path_pause(data->path);
@@ -619,11 +671,9 @@ static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, stru
 		snd_hdac_stream_stop(hdac_stream(host_stream));
 		spin_unlock_irqrestore(&bus->reg_lock, flags);
 
-		if (cmd == SNDRV_PCM_TRIGGER_STOP) {
-			ret = avs_path_reset(data->path);
-			if (ret < 0)
-				dev_err(dai->dev, "reset FE path failed: %d\n", ret);
-		}
+		ret = avs_path_reset(data->path);
+		if (ret < 0)
+			dev_err(dai->dev, "reset FE path failed: %d\n", ret);
 		break;
 
 	default:
@@ -987,6 +1037,7 @@ static int avs_component_open(struct snd_soc_component *component,
 			SNDRV_PCM_INFO_MMAP_VALID |
 			SNDRV_PCM_INFO_INTERLEAVED |
 			SNDRV_PCM_INFO_PAUSE |
+			SNDRV_PCM_INFO_RESUME |
 			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP;
 
 	hwparams.formats = SNDRV_PCM_FMTBIT_S16_LE |
-- 
2.25.1

