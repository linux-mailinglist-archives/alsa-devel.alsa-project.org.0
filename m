Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B747204DBC
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 11:20:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2ECA1756;
	Tue, 23 Jun 2020 11:19:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2ECA1756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592904027;
	bh=yg0uTm7lWQ6Bm0SUfduT5IML3b3RQDQ0b2LlMnaKYN4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DdWFIiYdKUTygL1d94vR6Zr4c3x6tpeeiFWS88yoaNJMvXhpCYbzQOG850F3kvli6
	 3MCFv3FydrDunXwB3PbuTBAlIHOpKJZjk9hKFjVCPbyk33w12cU1QajdB1FT9cQWjw
	 GHnATsab7IvQWHirObEVhXvIJ1umGYxepXBO1Hi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E47DDF800B2;
	Tue, 23 Jun 2020 11:18:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE804F80259; Tue, 23 Jun 2020 11:17:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00E2FF80218
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 11:17:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00E2FF80218
IronPort-SDR: a0Vgm98ZmzEoeC+/udwR1U6MU8MQMsvgDQZbf802Tu1Abvv7K6ZMj8+2S7E0Ahizxwpst72dsa
 iyShvKOUo6mA==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="145508124"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="145508124"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 02:17:49 -0700
IronPort-SDR: vskMJucPb+R1VIzhuxMThdau6Tt1vUwQ0SpHfor7iHBG278CgZX3l6UxHx8+Ioyh64j10Dt5PJ
 OCwmQWfC44Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="293141975"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga002.jf.intel.com with ESMTP; 23 Jun 2020 02:17:45 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/5] soundwire: intel: implement get_sdw_stream() operations
Date: Tue, 23 Jun 2020 05:23:28 +0800
Message-Id: <20200622212332.16277-2-yung-chuan.liao@linux.intel.com>
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

This is needed to retrieve the information when the stream is
allocated at the dai_link level.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 13d3877bc6bb..861beb785171 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1062,6 +1062,22 @@ static int intel_pdm_set_sdw_stream(struct snd_soc_dai *dai,
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
@@ -1070,6 +1086,7 @@ static const struct snd_soc_dai_ops intel_pcm_dai_ops = {
 	.hw_free = intel_hw_free,
 	.shutdown = intel_shutdown,
 	.set_sdw_stream = intel_pcm_set_sdw_stream,
+	.get_sdw_stream = intel_get_sdw_stream,
 };
 
 static const struct snd_soc_dai_ops intel_pdm_dai_ops = {
@@ -1080,6 +1097,7 @@ static const struct snd_soc_dai_ops intel_pdm_dai_ops = {
 	.hw_free = intel_hw_free,
 	.shutdown = intel_shutdown,
 	.set_sdw_stream = intel_pdm_set_sdw_stream,
+	.get_sdw_stream = intel_get_sdw_stream,
 };
 
 static const struct snd_soc_component_driver dai_component = {
-- 
2.17.1

