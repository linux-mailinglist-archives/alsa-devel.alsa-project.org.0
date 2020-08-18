Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 247D82487ED
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 16:41:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C79C71757;
	Tue, 18 Aug 2020 16:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C79C71757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597761666;
	bh=B76lsxEILOrjwV9qVRYxDcW4wMOzpKlsrEBIUR5QsUQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gnl+ijqY6As3i45ELBHr/1iPiDRxzk5Cy6PP+ENmaLO9Ur/JtzlYp72P7M/5m70Ec
	 q2Hf27L9CCGa7rizoW64DmWF4hWbz8myi8deyNxOicR/R408eRlJA+BQU1/KRKqFEb
	 oif29/4WJ2sdFHFhPLbHtxINHzBaeurvrAJRocXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAC89F80304;
	Tue, 18 Aug 2020 16:35:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E9F0F802E9; Tue, 18 Aug 2020 16:35:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F22CF802E3
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 16:35:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F22CF802E3
IronPort-SDR: 1NLGSsYVnhiVrL8xQbSWXXDjtdGrXEh027NT5EQD3rvePKy6WCHFpTwCc7Xe/hedqUUlicSluV
 SJM0mV0uSWdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="219223540"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="219223540"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:35:42 -0700
IronPort-SDR: Rd01k4E1jz1u2BQBSB1sC9wDF7umGbQerY8BfBGLcnjFmedBi+OCudLNXRyt/hHE9lw3vAo90N
 SdR/JrgtV0Qg==
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; d="scan'208";a="471830647"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 07:35:39 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 07/11] soundwire: intel: Only call sdw stream APIs for the
 first cpu_dai
Date: Tue, 18 Aug 2020 10:41:16 +0800
Message-Id: <20200818024120.20721-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
References: <20200818024120.20721-1-yung-chuan.liao@linux.intel.com>
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

We should call these APIs once per stream. So we can only call it
when the dai ops is invoked for the first cpu dai.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/intel.c | 45 +++++++++++++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 89a8ad1f80e8..7c63581270fd 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -941,11 +941,13 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 static int intel_prepare(struct snd_pcm_substream *substream,
 			 struct snd_soc_dai *dai)
 {
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *first_cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_cdns_dma_data *dma;
 	int ch, dir;
-	int ret;
+	int ret = 0;
 
 	dma = snd_soc_dai_get_dma_data(dai, substream);
 	if (!dma) {
@@ -985,7 +987,13 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 			goto err;
 	}
 
-	ret = sdw_prepare_stream(dma->stream);
+	/*
+	 * All cpu dais belong to a stream. To ensure sdw_prepare_stream
+	 * is called once per stream, we should call it only when
+	 * dai = first_cpu_dai.
+	 */
+	if (first_cpu_dai == dai)
+		ret = sdw_prepare_stream(dma->stream);
 
 err:
 	return ret;
@@ -994,9 +1002,19 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 static int intel_trigger(struct snd_pcm_substream *substream, int cmd,
 			 struct snd_soc_dai *dai)
 {
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *first_cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct sdw_cdns_dma_data *dma;
 	int ret;
 
+	/*
+	 * All cpu dais belong to a stream. To ensure sdw_enable/disable_stream
+	 * are called once per stream, we should call them only when
+	 * dai = first_cpu_dai.
+	 */
+	if (first_cpu_dai != dai)
+		return 0;
+
 	dma = snd_soc_dai_get_dma_data(dai, substream);
 	if (!dma) {
 		dev_err(dai->dev, "failed to get dma data in %s", __func__);
@@ -1031,6 +1049,8 @@ static int intel_trigger(struct snd_pcm_substream *substream, int cmd,
 static int
 intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *first_cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_cdns_dma_data *dma;
@@ -1040,12 +1060,25 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 	if (!dma)
 		return -EIO;
 
-	ret = sdw_deprepare_stream(dma->stream);
-	if (ret) {
-		dev_err(dai->dev, "sdw_deprepare_stream: failed %d", ret);
-		return ret;
+	/*
+	 * All cpu dais belong to a stream. To ensure sdw_deprepare_stream
+	 * is called once per stream, we should call it only when
+	 * dai = first_cpu_dai.
+	 */
+	if (first_cpu_dai == dai) {
+		ret = sdw_deprepare_stream(dma->stream);
+		if (ret) {
+			dev_err(dai->dev, "sdw_deprepare_stream: failed %d", ret);
+			return ret;
+		}
 	}
 
+	/*
+	 * The sdw stream state will transition to RELEASED when stream->
+	 * master_list is empty. So the stream state will transition to
+	 * DEPREPARED for the first cpu-dai and to RELEASED for the last
+	 * cpu-dai.
+	 */
 	ret = sdw_stream_remove_master(&cdns->bus, dma->stream);
 	if (ret < 0) {
 		dev_err(dai->dev, "remove master from stream %s failed: %d\n",
-- 
2.17.1

