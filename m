Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF0B6AE1A6
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 15:06:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B9EF1482;
	Tue,  7 Mar 2023 15:05:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B9EF1482
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678198000;
	bh=JdcUyWBSxvFKiwiIZ5G02tDeUpdK74jSMGWVLFfvlh0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e1YdRetKMwUoEdhHwnccClQJmxjvKCmU9jtfOLzVqiDx19a/4+e7jszGuvc77rp6h
	 3h6qZcfCQq7J8EUKRFdhpZrPb/hcGQpcN0g+rIMK/xQVENCW09haJA/lBzDxGlVpex
	 R3g93UBTlLnqS1bDtAqQQf/zmy7dDQssYPC8Wwu4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20E91F80527;
	Tue,  7 Mar 2023 15:04:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04C49F8042F; Tue,  7 Mar 2023 15:04:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D4EDF80482
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 15:04:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D4EDF80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=V8LtMPuT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678197872; x=1709733872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JdcUyWBSxvFKiwiIZ5G02tDeUpdK74jSMGWVLFfvlh0=;
  b=V8LtMPuT0q4E2y7K/uiTkDVk4oQr7OgQEPcsHs/gLVO1QsqPmnSvqXVH
   NPUvXvTlaxrOUlu7wgIB8TGbmJovEouMl+iP4chuK9F3GsNdkhRWxOO8v
   +b8KyrB5vqmLk6dxOBH2QyBpQIU7hcnFxVgdKZpopGZ+nmdCW5HpoaNzH
   gK3Z53NuRJDQ/7rSh5QF498bGwsmyPAyuTp5oeRUqAca5ANU5YESwMP2W
   UiLCJfE0GHwCRE8GIWrtZcufrFAtRKf3GNmGQVCNv3k2PdIxFP48diuIe
   ACYwnAMyiYMj4NsiVKboeBKuJjYjf7Ijmz2hL+G38PwodjeVHSbsXtSl6
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="316255230"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="316255230"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="786706950"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400";
   d="scan'208";a="786706950"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 06:04:25 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 05/14] ASoC: SOF: Intel: hda-dai: Pass the CPU dai pointer
Date: Tue,  7 Mar 2023 16:04:26 +0200
Message-Id: <20230307140435.2808-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
References: <20230307140435.2808-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UOJCO7MXS6X524HJTMESHVCVOTMTOTDZ
X-Message-ID-Hash: UOJCO7MXS6X524HJTMESHVCVOTMTOTDZ
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOJCO7MXS6X524HJTMESHVCVOTMTOTDZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Pass the CPU DAI pointer from the ASoC core to hda_link_dma_hw_params() and
ipc3_hda_dai_trigger(). This will avoid looking up the CPU DAI pointer
multiple times.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index d4b98bfe2adf..e448c653cfe1 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -157,10 +157,9 @@ static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
 }
 
 static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
-				  struct snd_pcm_hw_params *params)
+				  struct snd_pcm_hw_params *params, struct snd_soc_dai *cpu_dai)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct hdac_ext_stream *hext_stream;
 	struct hdac_stream *hstream;
@@ -216,18 +215,18 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int hda_link_dma_prepare(struct snd_pcm_substream *substream)
+static int hda_link_dma_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	int stream = substream->stream;
 
-	return hda_link_dma_hw_params(substream, &rtd->dpcm[stream].hw_params);
+	return hda_link_dma_hw_params(substream, &rtd->dpcm[stream].hw_params, cpu_dai);
 }
 
-static int hda_link_dma_trigger(struct snd_pcm_substream *substream, int cmd)
+static int hda_link_dma_trigger(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai,
+				int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct hdac_ext_stream *hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
 	int ret;
@@ -258,10 +257,9 @@ static int hda_link_dma_trigger(struct snd_pcm_substream *substream, int cmd)
 	return 0;
 }
 
-static int hda_link_dma_hw_free(struct snd_pcm_substream *substream)
+static int hda_link_dma_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *cpu_dai)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
 	struct hdac_ext_stream *hext_stream;
 
@@ -317,7 +315,7 @@ static int hda_dai_hw_params(struct snd_pcm_substream *substream,
 	if (hext_stream && hext_stream->link_prepared)
 		return 0;
 
-	ret = hda_link_dma_hw_params(substream, params);
+	ret = hda_link_dma_hw_params(substream, params, dai);
 	if (ret < 0)
 		return ret;
 
@@ -357,7 +355,7 @@ static int hda_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_d
 
 	dev_dbg(sdev->dev, "prepare stream dir %d\n", substream->stream);
 
-	ret = hda_link_dma_prepare(substream);
+	ret = hda_link_dma_prepare(substream, dai);
 	if (ret < 0)
 		return ret;
 
@@ -384,7 +382,7 @@ static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
 	dev_dbg(dai->dev, "cmd=%d dai %s direction %d\n", cmd,
 		dai->name, substream->stream);
 
-	ret = hda_link_dma_trigger(substream, cmd);
+	ret = hda_link_dma_trigger(substream, dai, cmd);
 	if (ret < 0)
 		return ret;
 
@@ -512,7 +510,7 @@ static int hda_dai_hw_free(struct snd_pcm_substream *substream,
 {
 	int ret;
 
-	ret = hda_link_dma_hw_free(substream);
+	ret = hda_link_dma_hw_free(substream, dai);
 	if (ret < 0)
 		return ret;
 
-- 
2.39.2

