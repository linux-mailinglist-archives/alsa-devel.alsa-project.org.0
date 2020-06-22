Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C275204DC6
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 11:21:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 026BE1753;
	Tue, 23 Jun 2020 11:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 026BE1753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592904081;
	bh=MRyiWfhc7ebYRgltaLWi4pxNMA0Z5QSjkdD4h4vXzAg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=exeg7oR1NVgLIH4+tHEIcPcYjDZ3z4dcg9gTAXVeWLGibqPKdIGV9ZZcoMGWOpI/Z
	 Mc0/pXzTL2cP6e2QiI4s4eh/1xSWHTOtMCxFOcWaJbL7gZKK9KjZ6ywrD2O5VmqfAl
	 n/Z/QvBC6GJ5U2w9KM4lb2X8zIqXfaTvO6xjS4Ss=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F181F802A9;
	Tue, 23 Jun 2020 11:18:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEE14F802A2; Tue, 23 Jun 2020 11:18:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19F94F80249
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 11:17:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19F94F80249
IronPort-SDR: oWNAu+a+B9MmoiHe0k5xeAg8U3IdSrHSK7z1VjkPJHIMsAFjATd4F42uIvn0s5KfLCN7msAL0H
 989gbakpB3hQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="145508146"
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="145508146"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 02:17:57 -0700
IronPort-SDR: 57cGruvZmAQ5R0b+Uy+e5KMLAKH3U7b8dTNNWwN6p0yQuxYTA5c+MBYU/46R3o6eK9seFjpn2C
 SBNMM522uE5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,270,1589266800"; d="scan'208";a="293141989"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga002.jf.intel.com with ESMTP; 23 Jun 2020 02:17:53 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 3/5] soundwire: intel: remove stream allocation/free
Date: Tue, 23 Jun 2020 05:23:30 +0800
Message-Id: <20200622212332.16277-4-yung-chuan.liao@linux.intel.com>
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

To support streaming across multiple links, the stream allocation/free
needs to be at the dailink level, not the dai.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 57 +--------------------------------------
 1 file changed, 1 insertion(+), 56 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 861beb785171..72ba3d22daf9 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -804,57 +804,6 @@ static int intel_post_bank_switch(struct sdw_bus *bus)
  * DAI routines
  */
 
-static int sdw_stream_setup(struct snd_pcm_substream *substream,
-			    struct snd_soc_dai *dai)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct sdw_stream_runtime *sdw_stream = NULL;
-	char *name;
-	int i, ret;
-
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		name = kasprintf(GFP_KERNEL, "%s-Playback", dai->name);
-	else
-		name = kasprintf(GFP_KERNEL, "%s-Capture", dai->name);
-
-	if (!name)
-		return -ENOMEM;
-
-	sdw_stream = sdw_alloc_stream(name);
-	if (!sdw_stream) {
-		dev_err(dai->dev, "alloc stream failed for DAI %s", dai->name);
-		ret = -ENOMEM;
-		goto error;
-	}
-
-	/* Set stream pointer on CPU DAI */
-	ret = snd_soc_dai_set_sdw_stream(dai, sdw_stream, substream->stream);
-	if (ret < 0) {
-		dev_err(dai->dev, "failed to set stream pointer on cpu dai %s",
-			dai->name);
-		goto release_stream;
-	}
-
-	/* Set stream pointer on all CODEC DAIs */
-	for (i = 0; i < rtd->num_codecs; i++) {
-		ret = snd_soc_dai_set_sdw_stream(asoc_rtd_to_codec(rtd, i), sdw_stream,
-						 substream->stream);
-		if (ret < 0) {
-			dev_err(dai->dev, "failed to set stream pointer on codec dai %s",
-				asoc_rtd_to_codec(rtd, i)->name);
-			goto release_stream;
-		}
-	}
-
-	return 0;
-
-release_stream:
-	sdw_release_stream(sdw_stream);
-error:
-	kfree(name);
-	return ret;
-}
-
 static int intel_startup(struct snd_pcm_substream *substream,
 			 struct snd_soc_dai *dai)
 {
@@ -862,8 +811,7 @@ static int intel_startup(struct snd_pcm_substream *substream,
 	 * TODO: add pm_runtime support here, the startup callback
 	 * will make sure the IP is 'active'
 	 */
-
-	return sdw_stream_setup(substream, dai);
+	return 0;
 }
 
 static int intel_hw_params(struct snd_pcm_substream *substream,
@@ -1031,9 +979,6 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 		return ret;
 	}
 
-	kfree(dma->stream->name);
-	sdw_release_stream(dma->stream);
-
 	return 0;
 }
 
-- 
2.17.1

