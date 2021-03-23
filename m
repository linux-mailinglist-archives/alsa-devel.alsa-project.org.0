Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE925345461
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 02:01:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CE83852;
	Tue, 23 Mar 2021 02:00:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CE83852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616461307;
	bh=cLIP8K+LkqazoLu9xIg2wi43QjcXg0Wic/umLxzupC8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DvJCmnPg5CMtRPzJ1u4izrN7HPP514m6SO5IHcE/GXn8pLZPU/uFwqsCKObulk0ra
	 78xjZp1EY+i/Q3do4QwPULe2h5XrsQqUG6c22qE5AAPMcMfdBdHnyvsZ/7c28TnL/L
	 Yj3hDpeockBoia7/AZVLiODJjxLWvxdAEVbzO8gk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E184BF8028D;
	Tue, 23 Mar 2021 01:59:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2D69F8028D; Tue, 23 Mar 2021 01:59:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5827F8025F
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 01:59:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5827F8025F
IronPort-SDR: O54tHKnlhG9qxUVvihqn94HJk9ntRuMmjWSMPxVZ/1ynuH33x/PvkwESmLvdRq/YyTEtGW/YJJ
 17BtdIOSuMjA==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="275477953"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="275477953"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 17:59:18 -0700
IronPort-SDR: Lwab92Cr7e8SJhfBRRzpWRBNK6FYvjtDlZ187zYcbUamm18txlaKHZ3WgWVvogPlikmHNZjD9k
 Nec8vWvQHhwQ==
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="414728360"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 17:59:15 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 4/5] soundwire: stream: add missing \n in dev_err()
Date: Tue, 23 Mar 2021 08:58:54 +0800
Message-Id: <20210323005855.20890-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323005855.20890-1-yung-chuan.liao@linux.intel.com>
References: <20210323005855.20890-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
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

We fixed a lot of warnings in 2019 but the magic of copy-paste keeps
adding new ones...

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 1099b5d1262b..4915676c4ac2 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1513,7 +1513,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
 		if (bus->compute_params) {
 			ret = bus->compute_params(bus);
 			if (ret < 0) {
-				dev_err(bus->dev, "Compute params failed: %d",
+				dev_err(bus->dev, "Compute params failed: %d\n",
 					ret);
 				return ret;
 			}
@@ -1791,7 +1791,7 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 		if (bus->compute_params) {
 			ret = bus->compute_params(bus);
 			if (ret < 0) {
-				dev_err(bus->dev, "Compute params failed: %d",
+				dev_err(bus->dev, "Compute params failed: %d\n",
 					ret);
 				return ret;
 			}
@@ -1855,7 +1855,7 @@ static int set_stream(struct snd_pcm_substream *substream,
 	for_each_rtd_dais(rtd, i, dai) {
 		ret = snd_soc_dai_set_sdw_stream(dai, sdw_stream, substream->stream);
 		if (ret < 0) {
-			dev_err(rtd->dev, "failed to set stream pointer on dai %s", dai->name);
+			dev_err(rtd->dev, "failed to set stream pointer on dai %s\n", dai->name);
 			break;
 		}
 	}
@@ -1888,7 +1888,7 @@ int sdw_startup_stream(void *sdw_substream)
 
 	sdw_stream = sdw_alloc_stream(name);
 	if (!sdw_stream) {
-		dev_err(rtd->dev, "alloc stream failed for substream DAI %s", substream->name);
+		dev_err(rtd->dev, "alloc stream failed for substream DAI %s\n", substream->name);
 		ret = -ENOMEM;
 		goto error;
 	}
@@ -1927,7 +1927,7 @@ void sdw_shutdown_stream(void *sdw_substream)
 	sdw_stream = snd_soc_dai_get_sdw_stream(dai, substream->stream);
 
 	if (IS_ERR(sdw_stream)) {
-		dev_err(rtd->dev, "no stream found for DAI %s", dai->name);
+		dev_err(rtd->dev, "no stream found for DAI %s\n", dai->name);
 		return;
 	}
 
-- 
2.17.1

