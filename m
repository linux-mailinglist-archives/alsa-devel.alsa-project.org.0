Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3502752FC
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 10:12:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF1D0173E;
	Wed, 23 Sep 2020 10:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF1D0173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600848737;
	bh=kZNsLboqergst/y0Bxui5L7yBiv0roaNgp0SkMuuivY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tYU3swCyCDENt5RYxUxNWG/xCKUAd8A4sq58Cf/st0TO8zm2vvQMchnNnIlh61RDk
	 ADfGNxyZdTA6GI1rfdEoUYVO3UNpiAhEfxVTaQ5uME2elVuLVQNN1AHxHgWmzPPHNS
	 9X1C3bw11GAfvFEPd+2Sic1Ovs6KuFI8GnbTMA7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89ACAF802FF;
	Wed, 23 Sep 2020 10:07:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBA79F802C4; Wed, 23 Sep 2020 10:07:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7079F8010A
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 10:07:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7079F8010A
IronPort-SDR: wccTlD4SZBXMA4NXoDCdf2hGrPFLG7ZTbTHBiw5nvjCPuvE6HK6WcSbzkN41bfawMph/j3Dl0c
 Qs2A2sbYRPDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="158178503"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="158178503"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 01:07:03 -0700
IronPort-SDR: 0XZX5PimAujP4ZTvsB2Su1iIanLSDoiMBPkN3R3uhLiTMkpQEsULPYayCP+kfEu8sUUFq+flza
 hsL6Ld6clXWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="335371208"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 23 Sep 2020 01:07:01 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/6] ASOC: Intel: sof_sdw: restore playback functionality with
 max98373 amps
Date: Wed, 23 Sep 2020 11:05:09 +0300
Message-Id: <20200923080514.3242858-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923080514.3242858-1-kai.vehmanen@linux.intel.com>
References: <20200923080514.3242858-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Keyon Jie <yang.jie@linux.intel.com>, lgirdwood@gmail.com,
 Rander Wang <rander.wang@intel.com>, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

From: Rander Wang <rander.wang@intel.com>

The Max98373 amplifier provides I/V feedback information, which keeps
a DAPM path active even when there is no playback happening. This
prevents entry in low-power mode. Rather than adding new controls and
require UCM/user interaction, the method previously applied is to
enable/disable the Speaker pin during the dailink trigger operations.

Recent changes in the SoundWire stream management moved the stream
trigger to the dailink trigger. This change removed the Maxim-specific
pin handling and resulted in a regression. This patch restores
functionality by combining the SoundWire stream trigger with the pin
enable/disable.

Fixes: 7eec07f389a60 ('ASOC: Intel: sof_sdw: add dailink .trigger callback')
Fixes: 5595f95c32650 ('ASOC: Intel: sof_sdw: add dailink .prepare and .hw_free callback').
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c          |  6 ++--
 sound/soc/intel/boards/sof_sdw_common.h   |  3 ++
 sound/soc/intel/boards/sof_sdw_max98373.c | 36 ++++++++++++++++++++++-
 3 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 210b66d1f9a2..efd96c9c6e39 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -225,7 +225,7 @@ int sdw_startup(struct snd_pcm_substream *substream)
 	return sdw_startup_stream(substream);
 }
 
-static int sdw_prepare(struct snd_pcm_substream *substream)
+int sdw_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct sdw_stream_runtime *sdw_stream;
@@ -244,7 +244,7 @@ static int sdw_prepare(struct snd_pcm_substream *substream)
 	return sdw_prepare_stream(sdw_stream);
 }
 
-static int sdw_trigger(struct snd_pcm_substream *substream, int cmd)
+int sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct sdw_stream_runtime *sdw_stream;
@@ -284,7 +284,7 @@ static int sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 	return ret;
 }
 
-static int sdw_hw_free(struct snd_pcm_substream *substream)
+int sdw_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct sdw_stream_runtime *sdw_stream;
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 6a5d46589baf..f3cb6796363e 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -79,6 +79,9 @@ struct mc_private {
 extern unsigned long sof_sdw_quirk;
 
 int sdw_startup(struct snd_pcm_substream *substream);
+int sdw_prepare(struct snd_pcm_substream *substream);
+int sdw_trigger(struct snd_pcm_substream *substream, int cmd);
+int sdw_hw_free(struct snd_pcm_substream *substream);
 void sdw_shutdown(struct snd_pcm_substream *substream);
 
 /* generic HDMI support */
diff --git a/sound/soc/intel/boards/sof_sdw_max98373.c b/sound/soc/intel/boards/sof_sdw_max98373.c
index 905582aaf58c..cfdf970c5800 100644
--- a/sound/soc/intel/boards/sof_sdw_max98373.c
+++ b/sound/soc/intel/boards/sof_sdw_max98373.c
@@ -55,9 +55,43 @@ static int spk_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
+static int max98373_sdw_trigger(struct snd_pcm_substream *substream, int cmd)
+{
+	int ret;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		/* enable max98373 first */
+		ret = max98373_trigger(substream, cmd);
+		if (ret < 0)
+			break;
+
+		ret = sdw_trigger(substream, cmd);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		ret = sdw_trigger(substream, cmd);
+		if (ret < 0)
+			break;
+
+		ret = max98373_trigger(substream, cmd);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
 static const struct snd_soc_ops max_98373_sdw_ops = {
 	.startup = sdw_startup,
-	.trigger = max98373_trigger,
+	.prepare = sdw_prepare,
+	.trigger = max98373_sdw_trigger,
+	.hw_free = sdw_hw_free,
 	.shutdown = sdw_shutdown,
 };
 
-- 
2.27.0

