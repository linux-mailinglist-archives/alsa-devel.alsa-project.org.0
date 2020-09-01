Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3211D25A37D
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 05:01:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E28B917CC;
	Wed,  2 Sep 2020 05:00:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E28B917CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599015698;
	bh=0kiSKvRW1DF1zc4iScfW4XA5FRDVP5i0myq2+/M+Sxs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=olDAFWWXPn4FUdWKHT+EuUWz7Do4HGyX22NaYCPcl2y6AaowiFoEncklCFuL0bH/p
	 4p+yfb9hCNou+/2BlNDHZQQVw0QGnVWFCGVHjhfwJeTjiN58le9JHX5HqZKO5SSWnu
	 f2rxKapFNzFm9bQ0Gs927Tzb60gc3xHDXDwEO8Ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DCCEF802FB;
	Wed,  2 Sep 2020 04:56:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD341F802F7; Wed,  2 Sep 2020 04:56:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C579EF802DD
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 04:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C579EF802DD
IronPort-SDR: T/+dvYFMeqOk9IGzubvgRozDNZESer3fsfwiy/Yis7x91DG0Fu9Y0cp4kQokjyUv8fwU5+r+Gm
 iQxMydinyR2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="158305777"
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="158305777"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 19:56:47 -0700
IronPort-SDR: vENoVZho5q0tjfgz/0WduM04h9mHi5k60nxyL1OATxWm9K0T1eqriCsAtqoWo8cMD1BaBAjjT+
 MkE0noA68WOw==
X-IronPort-AV: E=Sophos;i="5.76,381,1592895600"; d="scan'208";a="477457317"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2020 19:56:43 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 6/7] soundwire: intel: remove .trigger operation
Date: Tue,  1 Sep 2020 23:02:39 +0800
Message-Id: <20200901150240.19288-7-yung-chuan.liao@linux.intel.com>
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

Now that the stream trigger is handled at the dai-link level, there is
no need for a dai-level trigger any longer.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 39 ---------------------------------------
 1 file changed, 39 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index bbfb86ffa653..39d3186335ac 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -977,43 +977,6 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static int intel_trigger(struct snd_pcm_substream *substream, int cmd,
-			 struct snd_soc_dai *dai)
-{
-	struct sdw_cdns_dma_data *dma;
-	int ret;
-
-	dma = snd_soc_dai_get_dma_data(dai, substream);
-	if (!dma) {
-		dev_err(dai->dev, "failed to get dma data in %s", __func__);
-		return -EIO;
-	}
-
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-	case SNDRV_PCM_TRIGGER_RESUME:
-		ret = sdw_enable_stream(dma->stream);
-		break;
-
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_STOP:
-		ret = sdw_disable_stream(dma->stream);
-		break;
-
-	default:
-		ret = -EINVAL;
-		break;
-	}
-
-	if (ret)
-		dev_err(dai->dev,
-			"%s trigger %d failed: %d",
-			__func__, cmd, ret);
-	return ret;
-}
-
 static int
 intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
@@ -1115,7 +1078,6 @@ static const struct snd_soc_dai_ops intel_pcm_dai_ops = {
 	.startup = intel_startup,
 	.hw_params = intel_hw_params,
 	.prepare = intel_prepare,
-	.trigger = intel_trigger,
 	.hw_free = intel_hw_free,
 	.shutdown = intel_shutdown,
 	.set_sdw_stream = intel_pcm_set_sdw_stream,
@@ -1126,7 +1088,6 @@ static const struct snd_soc_dai_ops intel_pdm_dai_ops = {
 	.startup = intel_startup,
 	.hw_params = intel_hw_params,
 	.prepare = intel_prepare,
-	.trigger = intel_trigger,
 	.hw_free = intel_hw_free,
 	.shutdown = intel_shutdown,
 	.set_sdw_stream = intel_pdm_set_sdw_stream,
-- 
2.17.1

