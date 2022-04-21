Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2636A50AA08
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 22:35:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC477170D;
	Thu, 21 Apr 2022 22:34:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC477170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650573337;
	bh=o+mMWXAvFe19uyMop4LdT2C6mcucAHVTxYqbqJO1LUg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FQ0NwzS0SVZtUvx8iBkUbnwhkgW6xSS18CF0AzlrDl+Kp4Slm55dM9SIBEVvrxRaC
	 0JyF5U6fWCRAw/evGuV7Pv86DgpyjpCQ6hC4blbhI8NKX/fCoQaPay/+KkfXOfbLrP
	 BsoOBRW0vMCXNdpIhIK4niIleDkaoTaLWaBzk/jY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21C33F80542;
	Thu, 21 Apr 2022 22:33:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87770F80125; Thu, 21 Apr 2022 22:32:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 549F4F804DA
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 22:32:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 549F4F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="O24gzYqa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650573166; x=1682109166;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o+mMWXAvFe19uyMop4LdT2C6mcucAHVTxYqbqJO1LUg=;
 b=O24gzYqaq/imcmsneKymNxnlbz4ZuuIAjHJviVrcVjYexxe5OHqw5OUj
 o8p6eW3Yg213UOHNQWtAHtt0k1RzrFAhIObiifC/dlHM0lWlxLHzaqyZk
 Lz1KvS893KjA/tAVVbSNydJ7Lt7PQw6FWKGGk76NZAXS0XZBZ/qFoBnS1
 cuTyAbxWHYvybI3cEdx7M8amlNYCvp344m6oU+jlj0iOeobnj7+MkRh1t
 mCbTTc2B9s+V55N2UyhJP/wFQqVS5MBrRG+WdfRiPpBjvbReRlMJtSvJ7
 zhrmVAiYKDO3sZ8crZQ+ovZkZ9LEKGewnGzr3nkiiOaI0S8+IUIXTtq2g A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245047628"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="245047628"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="577455794"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/14] ASOC: SOF: Intel: hda-dai: add hda_dai_hw_free_ipc()
 helper
Date: Thu, 21 Apr 2022 15:31:56 -0500
Message-Id: <20220421203201.1550328-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
References: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Rander Wang <rander.wang@intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

We do the same thing from different places, let's use a helper.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 20eb4097ce753..0521cb755a8af 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -382,6 +382,16 @@ static int ipc3_hda_dai_prepare(struct snd_pcm_substream *substream,
 	return hda_dai_hw_params_update(substream, &rtd->dpcm[stream].hw_params, dai);
 }
 
+static int hda_dai_hw_free_ipc(int stream, /* direction */
+			       struct snd_soc_dai *dai)
+{
+	struct snd_soc_dapm_widget *w;
+
+	w = snd_soc_dai_get_widget(dai, stream);
+
+	/* free the link DMA channel in the FW and the DAI widget */
+	return hda_dai_widget_update(w, DMA_CHAN_INVALID, false);
+}
 
 static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
 				int cmd, struct snd_soc_dai *dai)
@@ -402,7 +412,7 @@ static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
 		/*
 		 * free DAI widget during stop/suspend to keep widget use_count's balanced.
 		 */
-		ret = hda_dai_widget_update(w, DMA_CHAN_INVALID, false);
+		ret = hda_dai_hw_free_ipc(substream->stream, dai);
 		if (ret < 0)
 			return ret;
 
@@ -422,21 +432,13 @@ static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
 static int hda_dai_hw_free(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
-	struct snd_soc_dapm_widget *w;
 	int ret;
 
 	ret = hda_link_dma_hw_free(substream);
 	if (ret < 0)
 		return ret;
 
-	w = snd_soc_dai_get_widget(dai, substream->stream);
-
-	/* free the link DMA channel in the FW and the DAI widget */
-	ret = hda_dai_widget_update(w, DMA_CHAN_INVALID, false);
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return hda_dai_hw_free_ipc(substream->stream, dai);
 }
 
 static const struct snd_soc_dai_ops ipc3_hda_dai_ops = {
-- 
2.30.2

