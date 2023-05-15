Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C9D702589
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:57:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F251AE9;
	Mon, 15 May 2023 08:56:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F251AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133849;
	bh=HnNtbwiDrZNBgzzJYA3WKKwmdCK9fTg/aHcJpktUXV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CThUi4YwliOogk68bq7P+uP+/YyfNi0o0jvS6OcrcuWVZqSaxoM1yoro4MD91O7tD
	 8xECYx62HdUEtwWsOKzeA05wIaaum0pVmGg2mUYrRAO9V1Yl3DHszmQOvaDfkS/42Q
	 WAtA2k9qvESylNA9nMeFYyJTS0lOjgE7Cpz3GBKA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0733DF8065C; Mon, 15 May 2023 08:51:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63DCFF8065E;
	Mon, 15 May 2023 08:51:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C9C0F8061E; Mon, 15 May 2023 08:51:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AA1CF80614
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:51:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AA1CF80614
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HiohpTP0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133481; x=1715669481;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HnNtbwiDrZNBgzzJYA3WKKwmdCK9fTg/aHcJpktUXV0=;
  b=HiohpTP0FtHzv//fDJfK4zE94uC67+PRzZlaSQTAgQPaaZcBiCz7Wt7d
   oj9ZYaSQoyR/YBuwlbuP3faOkiERtPOOFauFskmBZcxBda38ON4cLhOol
   Wou1V98pSrkov85+rs9LgckPWPELzLMYppEgqHitmUo1mxoSQZF2EuY8b
   aTUYgHv7LMD6RspW5M1fJyyn3JE3k/G3TX/cg11jpYlDPWdpDWxIRn0vV
   PExiVNMMcZNJCYmJyPj1pCmo8uI7X67l4HEY9zvrFU9kz7Qw85mE8lKtx
   09BWsjfWOSJ+GBDjKNInp+jdUcYEV7HuUaprAM9MDKb1WXyJr9HLJnP8x
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966547"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966547"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:51:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908784"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908784"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:51:11 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 22/26] ASoC: SOF/soundwire: re-add substream in
 params_stream structure
Date: Mon, 15 May 2023 15:10:38 +0800
Message-Id: <20230515071042.2038-23-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EAE2XV7SZQTKT6LFNTBD36N2T7XUQZSV
X-Message-ID-Hash: EAE2XV7SZQTKT6LFNTBD36N2T7XUQZSV
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EAE2XV7SZQTKT6LFNTBD36N2T7XUQZSV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

An earlier simplification to only pass the direction is no longer
suitable, all the ACE2.x HDaudio DMA management relies on access to
the substream structure.

This patch is an iso-functionality change, the HDaudio DMA parts will
be provided separately.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c           | 8 ++++----
 include/linux/soundwire/sdw_intel.h | 2 +-
 sound/soc/sof/intel/hda.c           | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 238acf5c97a9..c8eb1ec512c4 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -643,7 +643,7 @@ intel_pdi_alh_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
 }
 
 static int intel_params_stream(struct sdw_intel *sdw,
-			       int stream,
+			       struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai,
 			       struct snd_pcm_hw_params *hw_params,
 			       int link_id, int alh_stream_id)
@@ -651,7 +651,7 @@ static int intel_params_stream(struct sdw_intel *sdw,
 	struct sdw_intel_link_res *res = sdw->link_res;
 	struct sdw_intel_stream_params_data params_data;
 
-	params_data.stream = stream; /* direction */
+	params_data.substream = substream;
 	params_data.dai = dai;
 	params_data.hw_params = hw_params;
 	params_data.link_id = link_id;
@@ -727,7 +727,7 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	dai_runtime->pdi = pdi;
 
 	/* Inform DSP about PDI stream number */
-	ret = intel_params_stream(sdw, substream->stream, dai, params,
+	ret = intel_params_stream(sdw, substream, dai, params,
 				  sdw->instance,
 				  pdi->intel_alh_id);
 	if (ret)
@@ -804,7 +804,7 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 		sdw_cdns_config_stream(cdns, ch, dir, dai_runtime->pdi);
 
 		/* Inform DSP about PDI stream number */
-		ret = intel_params_stream(sdw, substream->stream, dai,
+		ret = intel_params_stream(sdw, substream, dai,
 					  hw_params,
 					  sdw->instance,
 					  dai_runtime->pdi->intel_alh_id);
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 1a8f32059cd8..ccb228eebc65 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -182,7 +182,7 @@
  * firmware.
  */
 struct sdw_intel_stream_params_data {
-	int stream;
+	struct snd_pcm_substream *substream;
 	struct snd_soc_dai *dai;
 	struct snd_pcm_hw_params *hw_params;
 	int link_id;
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 388e41057172..511c927b6696 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -94,7 +94,7 @@ static int sdw_params_stream(struct device *dev,
 			     struct sdw_intel_stream_params_data *params_data)
 {
 	struct snd_soc_dai *d = params_data->dai;
-	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(d, params_data->stream);
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(d, params_data->substream->stream);
 	struct snd_sof_dai_config_data data = { 0 };
 
 	data.dai_index = (params_data->link_id << 8) | d->id;
-- 
2.25.1

