Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C1425D3E7
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 10:46:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAEB71AE6;
	Fri,  4 Sep 2020 10:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAEB71AE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599209210;
	bh=P0GPtWGL6s2J5KEW3CPzE3w+2OucpuhyEkEHvt6sN+s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lQkFsVi+RMxyA7twGN7tldc4aYGRYVLbwG9JXZm9JCPWfcj7pKEu+ASF53oSk/cL9
	 bsG5VAegIUsJjTewp4hzaXuaxj+gQR3Nb/6JqmRaBDSWY48D6m2IWAJpXVJWPRTSik
	 D6FtqXGuKx68u035Xo0KAZ1sgUc6kljoQY32DwUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB1B4F80306;
	Fri,  4 Sep 2020 10:41:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD2F7F80306; Fri,  4 Sep 2020 10:41:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E818F802E0
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 10:41:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E818F802E0
IronPort-SDR: miAKrA5yu/k3RumDybudcDu9BIZCuPK0HiUAfziqOKjLmHu0SxYCTFIwm0Z7GJ+y0TSpPqFQ6B
 d5WwGKbGPYvQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="175765424"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="175765424"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 01:41:37 -0700
IronPort-SDR: +41t/VS2hSWWaxdGLnWlVJ1+O3XYm7q28Gwb7SqZ22y47R7HThh6ts1dka0oIUXikUWt38SVzs
 2JGHGtx5eT8A==
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="284358934"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 01:41:34 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 4/4] soundwire: intel: remove stream handling from .prepare
 and .hw_free
Date: Fri,  4 Sep 2020 04:47:39 +0800
Message-Id: <20200903204739.31206-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200903204739.31206-1-yung-chuan.liao@linux.intel.com>
References: <20200903204739.31206-1-yung-chuan.liao@linux.intel.com>
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

Now that the stream is handled at the dai-link level (in the machine
driver), we can remove the stream handling at the dai level. We still
need these callbacks to perform dai-level resource handling
(i.e. addition/removal of a master).

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index d208c49b157a..a254f271acf2 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -967,7 +967,7 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_cdns_dma_data *dma;
 	int ch, dir;
-	int ret;
+	int ret = 0;
 
 	dma = snd_soc_dai_get_dma_data(dai, substream);
 	if (!dma) {
@@ -1003,13 +1003,8 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 					  dma->hw_params,
 					  sdw->instance,
 					  dma->pdi->intel_alh_id);
-		if (ret)
-			goto err;
 	}
 
-	ret = sdw_prepare_stream(dma->stream);
-
-err:
 	return ret;
 }
 
@@ -1025,12 +1020,12 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 	if (!dma)
 		return -EIO;
 
-	ret = sdw_deprepare_stream(dma->stream);
-	if (ret) {
-		dev_err(dai->dev, "sdw_deprepare_stream: failed %d", ret);
-		return ret;
-	}
-
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

