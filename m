Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB48725238
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 04:51:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00179826;
	Wed,  7 Jun 2023 04:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00179826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686106309;
	bh=PB0vD4pkf2OkiR1KomsE1YWj392NzkwHJC8dKQ7tELE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iNV8asIBaQFkTnuDdEuRHy9jR0CYDICVi4CqSwhAg4K3HnGR6ZuGDQ9CBBZtT5dI9
	 Llx+RJ5tnGwc04PHyci39hwo/Vboc1FoQRjFLaZ3J+hmLcfPJDV6cg0tOu6XQgUmPv
	 hKG8zUEll/B4+U2k6PCRzZoJ5EBQq51+NxKgFqFQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E97FF804DA; Wed,  7 Jun 2023 04:50:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31BBEF80130;
	Wed,  7 Jun 2023 04:50:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83FA1F80254; Wed,  7 Jun 2023 04:50:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03222F8016C
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 04:50:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03222F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NFMnwa4o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686106212; x=1717642212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PB0vD4pkf2OkiR1KomsE1YWj392NzkwHJC8dKQ7tELE=;
  b=NFMnwa4oms8R36y5GeczkoFwICZk6hIdY/+dWrIOuqqQj2lQwdnz3VU1
   hawtSowoC3zc2wSwUYJyMt++TVgIPpH8LPmF/EcaGEKgwleny2+xBc6Gh
   UC9FHXcVAFKn89JtL7ugwRaOfH2aCUOzNMBWoklFivMODWn0oP9eK0TsO
   K/igFp0KP99AHdoRsvdzQVhqc1UJayvzaEKL/0xND5v90LcJxDYJjrBlp
   Op/YslQLIPXTg/yMCP0Slvc758kG/aZ4fNBvVgbwoDaidaW+AL8vOpjNt
   7lYnYQFUj1n01xz4/XayRCSVb7dOlq7BcSBGWZu3miRAegGD3PXPntk4c
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="360183332"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400";
   d="scan'208";a="360183332"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 19:50:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="833478893"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400";
   d="scan'208";a="833478893"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 19:50:00 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 2/2] ASoC: Intel: sof_sdw: add dai_link_codec_ch_map
Date: Wed,  7 Jun 2023 11:12:42 +0800
Message-Id: <20230607031242.1032060-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230607031242.1032060-1-yung-chuan.liao@linux.intel.com>
References: <20230607031242.1032060-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UTMNIJM42DSB52XKGRK7ZKFQYIXZL3GL
X-Message-ID-Hash: UTMNIJM42DSB52XKGRK7ZKFQYIXZL3GL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UTMNIJM42DSB52XKGRK7ZKFQYIXZL3GL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The captured data will be combined from each cpu DAI if the dai link
has more than one cpu DAIs. We can set channel number indirectly by
adding sdw_codec_ch_maps.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 69 +++++++++++++++++++++++++
 sound/soc/intel/boards/sof_sdw_common.h |  2 +
 sound/soc/intel/boards/sof_sdw_maxim.c  |  1 +
 3 files changed, 72 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d942696b36cd..f2f56150e1da 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -560,6 +560,55 @@ int sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 	return ret;
 }
 
+int sdw_hw_params(struct snd_pcm_substream *substream,
+		  struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	int ch = params_channels(params);
+	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *cpu_dai;
+	unsigned int ch_mask;
+	int num_codecs;
+	int step;
+	int i;
+	int j;
+
+	if (!rtd->dai_link->codec_ch_maps)
+		return 0;
+
+	/* Identical data will be sent to all codecs in playback */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		ch_mask = GENMASK(ch - 1, 0);
+		step = 0;
+	} else {
+		num_codecs = rtd->dai_link->num_codecs;
+
+		if (ch < num_codecs || ch % num_codecs != 0) {
+			dev_err(rtd->dev, "Channels number %d is invalid when codec number = %d\n",
+				ch, num_codecs);
+			return -EINVAL;
+		}
+
+		ch_mask = GENMASK(ch / num_codecs - 1, 0);
+		step = hweight_long(ch_mask);
+
+	}
+
+	/*
+	 * The captured data will be combined from each cpu DAI if the dai
+	 * link has more than one codec DAIs. Set codec channel mask and
+	 * ASoC will set the corresponding channel numbers for each cpu dai.
+	 */
+	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+		for_each_rtd_codec_dais(rtd, j, codec_dai) {
+			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id != i)
+				continue;
+			rtd->dai_link->codec_ch_maps[j].ch_mask = ch_mask << (j * step);
+		}
+	}
+	return 0;
+}
+
 int sdw_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
@@ -588,6 +637,7 @@ static const struct snd_soc_ops sdw_ops = {
 	.startup = sdw_startup,
 	.prepare = sdw_prepare,
 	.trigger = sdw_trigger,
+	.hw_params = sdw_hw_params,
 	.hw_free = sdw_hw_free,
 	.shutdown = sdw_shutdown,
 };
@@ -1281,6 +1331,17 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 	return 0;
 }
 
+static void set_dailink_map(struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps,
+			    int codec_num, int cpu_num)
+{
+	int step;
+	int i;
+
+	step = codec_num / cpu_num;
+	for (i = 0; i < codec_num; i++)
+		sdw_codec_ch_maps[i].connected_cpu_id = i / step;
+}
+
 static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
 
 static int create_sdw_dailink(struct snd_soc_card *card,
@@ -1357,6 +1418,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 	cpu_dai_index = *cpu_id;
 	for_each_pcm_streams(stream) {
+		struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps;
 		char *name, *cpu_name;
 		int playback, capture;
 		static const char * const sdw_stream_name[] = {
@@ -1375,6 +1437,11 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			return -EINVAL;
 		}
 
+		sdw_codec_ch_maps = devm_kcalloc(dev, codec_num,
+						 sizeof(*sdw_codec_ch_maps), GFP_KERNEL);
+		if (!sdw_codec_ch_maps)
+			return -ENOMEM;
+
 		/* create stream name according to first link id */
 		if (append_dai_type) {
 			name = devm_kasprintf(dev, GFP_KERNEL,
@@ -1435,6 +1502,8 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		 */
 		dai_links[*link_index].nonatomic = true;
 
+		set_dailink_map(sdw_codec_ch_maps, codec_num, cpu_dai_num);
+		dai_links[*link_index].codec_ch_maps = sdw_codec_ch_maps;
 		ret = set_codec_init_func(card, link, dai_links + (*link_index)++,
 					  playback, group_id, adr_index, dai_index);
 		if (ret < 0) {
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 64cfa5d1aceb..37402170d5f9 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -103,6 +103,8 @@ extern unsigned long sof_sdw_quirk;
 int sdw_startup(struct snd_pcm_substream *substream);
 int sdw_prepare(struct snd_pcm_substream *substream);
 int sdw_trigger(struct snd_pcm_substream *substream, int cmd);
+int sdw_hw_params(struct snd_pcm_substream *substream,
+		  struct snd_pcm_hw_params *params);
 int sdw_hw_free(struct snd_pcm_substream *substream);
 void sdw_shutdown(struct snd_pcm_substream *substream);
 
diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/intel/boards/sof_sdw_maxim.c
index 8d40a83ad98e..414c4d8dac77 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/intel/boards/sof_sdw_maxim.c
@@ -123,6 +123,7 @@ static const struct snd_soc_ops max_98373_sdw_ops = {
 	.startup = sdw_startup,
 	.prepare = mx8373_sdw_prepare,
 	.trigger = sdw_trigger,
+	.hw_params = sdw_hw_params,
 	.hw_free = mx8373_sdw_hw_free,
 	.shutdown = sdw_shutdown,
 };
-- 
2.25.1

