Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66601700E8A
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 20:19:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCD4DE99;
	Fri, 12 May 2023 20:18:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCD4DE99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683915568;
	bh=ydK/r2JHXPfGT+V1IIADfAgM+ZsKbIkuXlTEsk1R7pM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RgEirf817zi/NfOdkou8iTK+PWofvADpc1pEbPEQBgcgXJQTHYyiL2R2/XU0XR7Fh
	 0uSLa1V5pdS2HDLmWuVt4w5bfKmyW+4iKl9xLg9WCcp35sC2XAUYeIii96SJUhknvq
	 wbGD3RhbjELu81G0wjnwx4fYMJ+X+axymbkHmgGY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71EDDF80563; Fri, 12 May 2023 20:17:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5D4DF8053D;
	Fri, 12 May 2023 20:17:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E10B1F8053B; Fri, 12 May 2023 20:17:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF6D3F8032D
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 20:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF6D3F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=L6UUH6WQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683915459; x=1715451459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ydK/r2JHXPfGT+V1IIADfAgM+ZsKbIkuXlTEsk1R7pM=;
  b=L6UUH6WQKQJOGYYOJwKPDlPc3qB4wdK+U16SsWBI/SZbFn09/s6G86OE
   VASblqyaSolLQROtUYt9Aa8GpS2spt3y+JW3EyuIeIzw4o4oYbFR1+Hky
   wwsAA/XBA4mdsYCb38I3hjI9nMzwF3ZNvHOxpZREABjrLoRmW/T/euHo+
   QO6C/YsPO3kZmV8TqNCUqorZUy4JUY1KZU3WXAp5LmIJhUyKnuwEJCLHC
   CfVdbZ+qYYUD42bnVvA3hf1HMXkHii7Bv/wndOCQwfMWYXqmJh5UKlMEG
   Nqrr2kq0gTwNpbicqMnlCpGSH7Yi8cPp2vwK8xgXkf5cPr9w7hxIynsPL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="331223194"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="331223194"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:17:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="769895047"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="769895047"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 11:17:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vkoul@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 1/9] ASoC: SOF: Intel: hda-dai: simplify .prepare callback
Date: Fri, 12 May 2023 13:16:54 -0500
Message-Id: <20230512181702.117483-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512181702.117483-1-pierre-louis.bossart@linux.intel.com>
References: <20230512181702.117483-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZAJWWBFKP3IPMC6RUO2GKIMRZZ6C774A
X-Message-ID-Hash: ZAJWWBFKP3IPMC6RUO2GKIMRZZ6C774A
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZAJWWBFKP3IPMC6RUO2GKIMRZZ6C774A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The code has been cleaned-up multiple times, but while adding the new
abstractions for DMIC/SSP/SoundWire it appears that we don't really
need a specific sequence for .prepare, and we can reuse what
.hw_params already does.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 34 +++-------------------------------
 1 file changed, 3 insertions(+), 31 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 44a5d94c5050..61eb25cfdbe1 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -188,14 +188,6 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int hda_link_dma_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
-{
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	int stream = substream->stream;
-
-	return hda_link_dma_hw_params(substream, &rtd->dpcm[stream].hw_params, cpu_dai);
-}
-
 static int hda_dai_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(cpu_dai->component);
@@ -251,30 +243,10 @@ static int hda_dai_hw_params(struct snd_pcm_substream *substream,
 
 static int hda_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
-	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(dai, substream->stream);
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
-	const struct hda_dai_widget_dma_ops *ops = hda_dai_get_ops(substream, dai);
-	struct hdac_ext_stream *hext_stream;
-	struct snd_sof_dai_config_data data = { 0 };
-	unsigned int flags = SOF_DAI_CONFIG_FLAGS_HW_PARAMS;
-	int ret;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	int stream = substream->stream;
 
-	hext_stream = ops->get_hext_stream(sdev, dai, substream);
-	if (hext_stream && hext_stream->link_prepared)
-		return 0;
-
-	dev_dbg(sdev->dev, "prepare stream dir %d\n", substream->stream);
-
-	ret = hda_link_dma_prepare(substream, dai);
-	if (ret < 0)
-		return ret;
-
-	hext_stream = ops->get_hext_stream(sdev, dai, substream);
-
-	flags |= SOF_DAI_CONFIG_FLAGS_2_STEP_STOP << SOF_DAI_CONFIG_FLAGS_QUIRK_SHIFT;
-	data.dai_data = hdac_stream(hext_stream)->stream_tag - 1;
-
-	return hda_dai_config(w, flags, &data);
+	return hda_dai_hw_params(substream, &rtd->dpcm[stream].hw_params, dai);
 }
 
 /*
-- 
2.37.2

