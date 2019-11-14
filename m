Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B5FFCCD3
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 19:09:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4F911670;
	Thu, 14 Nov 2019 19:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4F911670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573754951;
	bh=HKmlAAQFtIwlYpallS1rPvOSW6U4gbF2iRIEsox6KFY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NTruditIn6z7LfFzwdXLofekzEadZO97Ena9qRKqdDiSEGIa2w98prcd74/fadD/1
	 oGcEVC4MvzI/CYb4REcnMW+ljYjPRiZCCLZ7mON4QAfD+ZZJYoVkDdXzcWZ8+Pz3El
	 /WBwMglxn/4heUT7aGMlRoR1yhhLyv+GLMA4KMOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5357F801F7;
	Thu, 14 Nov 2019 19:00:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC401F8012E; Thu, 14 Nov 2019 19:00:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4F6AF80119
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 19:00:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4F6AF80119
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 10:00:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="207871652"
Received: from chiahuil-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.228.77])
 by orsmga003.jf.intel.com with ESMTP; 14 Nov 2019 10:00:10 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 14 Nov 2019 11:59:30 -0600
Message-Id: <20191114175933.21992-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191114175933.21992-1-pierre-louis.bossart@linux.intel.com>
References: <20191114175933.21992-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v3 12/15] soundwire: intel: add trigger support
	in sdw dai driver
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

From: Rander Wang <rander.wang@linux.intel.com>

The existing code does not expose a trigger callback, which is very
much required for streaming.

The SoundWire stream is enabled and disabled in trigger function.

Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index c50aebda7f4d..862dde9a9b86 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -712,6 +712,43 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 	return sdw_prepare_stream(dma->stream);
 }
 
+static int intel_trigger(struct snd_pcm_substream *substream, int cmd,
+			 struct snd_soc_dai *dai)
+{
+	struct sdw_cdns_dma_data *dma;
+	int ret;
+
+	dma = snd_soc_dai_get_dma_data(dai, substream);
+	if (!dma) {
+		dev_err(dai->dev, "failed to get dma data in %s", __func__);
+		return -EIO;
+	}
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		ret = sdw_enable_stream(dma->stream);
+		break;
+
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+		ret = sdw_disable_stream(dma->stream);
+		break;
+
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret)
+		dev_err(dai->dev,
+			"%s trigger %d failed: %d",
+			__func__, cmd, ret);
+	return ret;
+}
+
 static int
 intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
@@ -759,6 +796,7 @@ static int intel_pdm_set_sdw_stream(struct snd_soc_dai *dai,
 static const struct snd_soc_dai_ops intel_pcm_dai_ops = {
 	.hw_params = intel_hw_params,
 	.prepare = intel_prepare,
+	.trigger = intel_trigger,
 	.hw_free = intel_hw_free,
 	.shutdown = intel_shutdown,
 	.set_sdw_stream = intel_pcm_set_sdw_stream,
@@ -767,6 +805,7 @@ static const struct snd_soc_dai_ops intel_pcm_dai_ops = {
 static const struct snd_soc_dai_ops intel_pdm_dai_ops = {
 	.hw_params = intel_hw_params,
 	.prepare = intel_prepare,
+	.trigger = intel_trigger,
 	.hw_free = intel_hw_free,
 	.shutdown = intel_shutdown,
 	.set_sdw_stream = intel_pdm_set_sdw_stream,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
