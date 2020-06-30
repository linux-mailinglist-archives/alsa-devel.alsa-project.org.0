Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4914D210408
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 08:41:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2D821686;
	Wed,  1 Jul 2020 08:40:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2D821686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593585662;
	bh=qpvLWRuoGyDqymRIHLBMpxu+r29/u2cNOHKcbYcX2wE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ipw9oD7IZ9LI4X6Y993auZQJI3xAFuuF05rW3cHTv/gHM3PSfcUSW1Ibs4mE1FcgP
	 X2uk4DTTsSzlk+CRQfQFDGZxX/5aUCXNgZHCkVglL+bvwYiWZoukQnZPoVEvE8uTxt
	 QP5ILQ3ylBv1LtCIJFGjifnkyTizP73NZEUXVI70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25D29F80256;
	Wed,  1 Jul 2020 08:38:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4FDBF80229; Wed,  1 Jul 2020 08:38:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 992CFF800EA
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 08:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 992CFF800EA
IronPort-SDR: qMGZJ6Pcj/CFYi6f2A4iFPt4Qs+QL44rEygNUMm/K+DotWWRSuqtRBle6ROSZzxg6kyYml75AD
 aXY7LdjOPC6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="126109904"
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="126109904"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 23:38:24 -0700
IronPort-SDR: DopED51pkOpFQqTZBuHlCOqKafRIlM3nrgJFXIkKKeMri/KfRg2V2Ls2iVMlHAo5JPn1gQgKRy
 BatCnWKMcLMg==
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="454946614"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 23:38:20 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 1/5] soundwire: intel: implement get_sdw_stream() operations
Date: Wed,  1 Jul 2020 02:43:52 +0800
Message-Id: <20200630184356.24939-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630184356.24939-1-yung-chuan.liao@linux.intel.com>
References: <20200630184356.24939-1-yung-chuan.liao@linux.intel.com>
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

This is needed to retrieve the information when the stream is
allocated at the dai_link level.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 950e4cf09f2a..3f2f23cf8020 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -883,6 +883,22 @@ static int intel_pdm_set_sdw_stream(struct snd_soc_dai *dai,
 	return cdns_set_sdw_stream(dai, stream, false, direction);
 }
 
+static void *intel_get_sdw_stream(struct snd_soc_dai *dai,
+				  int direction)
+{
+	struct sdw_cdns_dma_data *dma;
+
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
+		dma = dai->playback_dma_data;
+	else
+		dma = dai->capture_dma_data;
+
+	if (!dma)
+		return NULL;
+
+	return dma->stream;
+}
+
 static const struct snd_soc_dai_ops intel_pcm_dai_ops = {
 	.startup = intel_startup,
 	.hw_params = intel_hw_params,
@@ -891,6 +907,7 @@ static const struct snd_soc_dai_ops intel_pcm_dai_ops = {
 	.hw_free = intel_hw_free,
 	.shutdown = intel_shutdown,
 	.set_sdw_stream = intel_pcm_set_sdw_stream,
+	.get_sdw_stream = intel_get_sdw_stream,
 };
 
 static const struct snd_soc_dai_ops intel_pdm_dai_ops = {
@@ -901,6 +918,7 @@ static const struct snd_soc_dai_ops intel_pdm_dai_ops = {
 	.hw_free = intel_hw_free,
 	.shutdown = intel_shutdown,
 	.set_sdw_stream = intel_pdm_set_sdw_stream,
+	.get_sdw_stream = intel_get_sdw_stream,
 };
 
 static const struct snd_soc_component_driver dai_component = {
-- 
2.17.1

