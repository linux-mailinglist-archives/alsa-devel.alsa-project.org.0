Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D338FF1F1C
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 20:39:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7488D16CC;
	Wed,  6 Nov 2019 20:38:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7488D16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573069175;
	bh=hqsgckgmsHWsPbFMLkyWA7iTJafTNQsat8rJUmYVeTs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JDzArrwn2LvPcpUi07eJR32CYPk3OLgU5we/Kd5or1TNMKFByTE1REP2n8Ok/5wnG
	 tcFbPw9WLxDkDqg8nFANMvkEHkVbeIBogXh08oOLmm4tGQVd9NqaSnkQwKeDuLtT63
	 w1cELxSd6JD8gTOfW92NPCSnYnMhRsYK8vvCH2Ns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11D91F8086C;
	Wed,  6 Nov 2019 20:23:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F57BF80713; Wed,  6 Nov 2019 20:23:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF0B5F80709
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 20:22:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF0B5F80709
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 11:22:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="403835200"
Received: from vidhipat-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.33.70])
 by fmsmga006.fm.intel.com with ESMTP; 06 Nov 2019 11:22:56 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  6 Nov 2019 13:22:23 -0600
Message-Id: <20191106192223.6003-20-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191106192223.6003-1-pierre-louis.bossart@linux.intel.com>
References: <20191106192223.6003-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 19/19] soundwire: intel: reinitialize IP+DSP
	in .prepare()
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The .prepare() callback is invoked for normal streaming, underflows or
during the system resume transition. In the latter case, the context
for the ALH PDIs is lost, and the DSP is not initialized properly
either, but the bus parameters don't need to be recomputed.

To avoid keeping track of state variables, it's simpler to just
reinitialize the SHIM/ALH/Cadence/DSP settings in .prepare.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c | 40 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index f0f9a6252522..ec6c58635a99 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -117,6 +117,8 @@ struct sdw_intel {
 	struct sdw_cdns cdns;
 	int instance;
 	struct sdw_intel_link_res *link_res;
+	struct snd_pcm_hw_params *hw_params;
+	struct sdw_cdns_pdi *pdi;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs;
 #endif
@@ -813,6 +815,8 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	intel_pdi_alh_configure(sdw, pdi);
 	sdw_cdns_config_stream(cdns, ch, dir, pdi);
 
+	sdw->pdi = pdi;
+	sdw->hw_params = params;
 
 	/* Inform DSP about PDI stream number */
 	ret = intel_params_stream(sdw, substream, dai, params,
@@ -856,7 +860,11 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 static int intel_prepare(struct snd_pcm_substream *substream,
 			 struct snd_soc_dai *dai)
 {
+	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_cdns_dma_data *dma;
+	int ch, dir;
+	int ret;
 
 	dma = snd_soc_dai_get_dma_data(dai, substream);
 	if (!dma) {
@@ -865,7 +873,35 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 		return -EIO;
 	}
 
-	return sdw_prepare_stream(dma->stream);
+	/*
+	 * .prepare() is called after system resume, where we need to
+	 * reinitialize the SHIM/ALH/Cadence IP. To avoid dealing with
+	 * complicated state machines, we just re-initialize in all
+	 * cases since there are no side effects.
+	 */
+
+	/* configure stream */
+	ch = params_channels(sdw->hw_params);
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		dir = SDW_DATA_DIR_RX;
+	else
+		dir = SDW_DATA_DIR_TX;
+
+	intel_pdi_shim_configure(sdw, sdw->pdi);
+	intel_pdi_alh_configure(sdw, sdw->pdi);
+	sdw_cdns_config_stream(cdns, ch, dir, sdw->pdi);
+
+	/* Inform DSP about PDI stream number */
+	ret = intel_params_stream(sdw, substream, dai, sdw->hw_params,
+				  sdw->instance,
+				  sdw->pdi->intel_alh_id);
+	if (ret)
+		goto err;
+
+	ret = sdw_prepare_stream(dma->stream);
+
+err:
+	return ret;
 }
 
 static int intel_trigger(struct snd_pcm_substream *substream, int cmd,
@@ -936,6 +972,8 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 		return ret;
 	}
 
+	sdw->hw_params = NULL;
+	sdw->pdi = NULL;
 	sdw_release_stream(dma->stream);
 
 	return 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
