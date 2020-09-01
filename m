Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3E625A377
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 05:00:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AD9717A9;
	Wed,  2 Sep 2020 05:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AD9717A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599015657;
	bh=JGhILqCzejFN4PgB/NPwA8DkW+GH5YHyw9L6eI3Yq+A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lINMw4cbD4MHqO11F/aQXTO9ckzedzglnvEkHD3ayGxXJCUYwLerRK5CPwQmWKEbH
	 WphYQUw6XA/+tRAVxdqZonRexaUGy0N7H0zYXdnw6yFZw5I98UZao5/Ozi6MbnQObT
	 0FJygKs48AMitrn/4t9O0JU9oiiW3gnmwvooxLDY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D0DEF802EC;
	Wed,  2 Sep 2020 04:56:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB01FF802EA; Wed,  2 Sep 2020 04:56:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6FA0F802E8
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 04:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6FA0F802E8
IronPort-SDR: NAXsNrnzL8NmNe6VwRdS2byjHaxziP3/FKgCwH2keb42fu85+lWfhjrvvbP+LgNY2EyUnGsbNS
 bkruAQY8sQDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="158305772"
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="158305772"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 19:56:43 -0700
IronPort-SDR: tjP7i/wo++4lunbnZEQfUwqlKHxew/92yzEpf8ytkXpq3IvXAFZvcuaTq8D5r04mZSeB0t/WWN
 2zEU6d4NfJYQ==
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="477457301"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 19:56:39 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 5/7] ASOC: Intel: sof_sdw: add dailink .prepare and .hw_free
 callback
Date: Tue,  1 Sep 2020 23:02:38 +0800
Message-Id: <20200901150240.19288-6-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901150240.19288-1-yung-chuan.liao@linux.intel.com>
References: <20200901150240.19288-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

Add .prepare and .hw_free callback to dailink.

The companion patch for this patch is the removal of stream operations
in the .prepare and .hw_free callbacks at the DAI level in
drivers/soundwire/intel.c

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 40 ++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index f251e046d74d..16503772965c 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -195,6 +195,25 @@ int sdw_startup(struct snd_pcm_substream *substream)
 	return sdw_startup_stream(substream);
 }
 
+static int sdw_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct sdw_stream_runtime *sdw_stream;
+	struct snd_soc_dai *dai;
+
+	/* Find stream from first CPU DAI */
+	dai = asoc_rtd_to_cpu(rtd, 0);
+
+	sdw_stream = snd_soc_dai_get_sdw_stream(dai, substream->stream);
+
+	if (IS_ERR(sdw_stream)) {
+		dev_err(rtd->dev, "no stream found for DAI %s", dai->name);
+		return PTR_ERR(sdw_stream);
+	}
+
+	return sdw_prepare_stream(sdw_stream);
+}
+
 static int sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
@@ -235,6 +254,25 @@ static int sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 	return ret;
 }
 
+static int sdw_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct sdw_stream_runtime *sdw_stream;
+	struct snd_soc_dai *dai;
+
+	/* Find stream from first CPU DAI */
+	dai = asoc_rtd_to_cpu(rtd, 0);
+
+	sdw_stream = snd_soc_dai_get_sdw_stream(dai, substream->stream);
+
+	if (IS_ERR(sdw_stream)) {
+		dev_err(rtd->dev, "no stream found for DAI %s", dai->name);
+		return PTR_ERR(sdw_stream);
+	}
+
+	return sdw_deprepare_stream(sdw_stream);
+}
+
 void sdw_shutdown(struct snd_pcm_substream *substream)
 {
 	sdw_shutdown_stream(substream);
@@ -242,7 +280,9 @@ void sdw_shutdown(struct snd_pcm_substream *substream)
 
 static const struct snd_soc_ops sdw_ops = {
 	.startup = sdw_startup,
+	.prepare = sdw_prepare,
 	.trigger = sdw_trigger,
+	.hw_free = sdw_hw_free,
 	.shutdown = sdw_shutdown,
 };
 
-- 
2.17.1

