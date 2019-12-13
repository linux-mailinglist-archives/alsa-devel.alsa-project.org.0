Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0C911DD7F
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 06:15:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C894F1737;
	Fri, 13 Dec 2019 06:14:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C894F1737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576214139;
	bh=+qdFyMDFNXr58QGBOVXqMeeCbsQj2mSEDlG/Uep2eIE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jOUiBubQZv9DO8dWf6Odyh1kgraLBR61iYGkwoWTY1pBiFceCUsbK8j6BdG9yaAIP
	 I9nJQeSAmjjomrAHwDs9pZsbY7X2hYWSZvCJU7PS78cqxChOvjZwvuudcILZYmhILB
	 ZxvAg41ZWHAnJ6ZJjcUrrfvjVyqG5sESXUmTbiJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EC57F80321;
	Fri, 13 Dec 2019 06:05:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 874C8F80273; Fri, 13 Dec 2019 06:05:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B452BF80271
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 06:04:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B452BF80271
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Dec 2019 21:04:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,308,1571727600"; d="scan'208";a="208340782"
Received: from vbagrodi-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.130.70])
 by orsmga008.jf.intel.com with ESMTP; 12 Dec 2019 21:04:43 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 12 Dec 2019 23:04:08 -0600
Message-Id: <20191213050409.12776-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
References: <20191213050409.12776-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v4 14/15] soundwire: intel: free all resources
	on hw_free()
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

Make sure all calls to the SoundWire stream API are done and involve
callback

Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c | 40 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 30b0ff5b7abd..1e293e7374ed 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -549,6 +549,25 @@ static int intel_params_stream(struct sdw_intel *sdw,
 	return -EIO;
 }
 
+static int intel_free_stream(struct sdw_intel *sdw,
+			     struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai,
+			     int link_id)
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
  * bank switch routines
  */
@@ -817,6 +836,7 @@ static int
 intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_cdns_dma_data *dma;
 	int ret;
 
@@ -824,12 +844,28 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 	if (!dma)
 		return -EIO;
 
+	ret = sdw_deprepare_stream(dma->stream);
+	if (ret) {
+		dev_err(dai->dev, "sdw_deprepare_stream: failed %d", ret);
+		return ret;
+	}
+
 	ret = sdw_stream_remove_master(&cdns->bus, dma->stream);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(dai->dev, "remove master from stream %s failed: %d\n",
 			dma->stream->name, ret);
+		return ret;
+	}
 
-	return ret;
+	ret = intel_free_stream(sdw, substream, dai, sdw->instance);
+	if (ret < 0) {
+		dev_err(dai->dev, "intel_free_stream: failed %d", ret);
+		return ret;
+	}
+
+	sdw_release_stream(dma->stream);
+
+	return 0;
 }
 
 static void intel_shutdown(struct snd_pcm_substream *substream,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
