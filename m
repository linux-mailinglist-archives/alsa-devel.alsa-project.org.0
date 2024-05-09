Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E94E38C131D
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 18:38:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BC77E72;
	Thu,  9 May 2024 18:38:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BC77E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715272701;
	bh=SSO8v9kaRxW6CIjWQOztJRB40fZ4Z0Ad64qhN+fKaeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=akXnEHUOYJFhkoeWKKrl2yp3f/9L+e9NNjXUO0nR6N+J+PsQHOjDULXPsnIZY8OTD
	 zkgo0NZz3piuWhhOAHPqAfQ/4rjSFzsRzMQ+7yJaF3SBvf0kRdjecIk5L+szDaMo2S
	 Uf3pR64NSUspEumcL2JRHQMGO4J5CnG+1ERByyhM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0ED88F8078F; Thu,  9 May 2024 18:35:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 859BCF80727;
	Thu,  9 May 2024 18:35:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7C7EF80605; Thu,  9 May 2024 18:35:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1542F8057B
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 18:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1542F8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HpPRW5wM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272483; x=1746808483;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SSO8v9kaRxW6CIjWQOztJRB40fZ4Z0Ad64qhN+fKaeA=;
  b=HpPRW5wMVLQxl5zb5DcpErto1JKzw3b+CwxjvmxKGi/hJTMyMJqmM6vv
   HhbmOMzMHDPvHwJcLfzSN7SaN+w+BQgfA/VxtVFYF3Pj/FbB647yTXeF/
   3EqhbmKANPQoaYh2/7xWY0f7Ey1wgbZGJ8TeMR1NZU3g3qlZNqZTUs6YR
   kObfwrJ/giaSbMfDWdr7C2sXVXmKGY+MIW7be0RpBznUsNevCSbkQVYBH
   mNDrne7AdJ4tdi8M0LVuBbQvmpUOI9aIj7WR+ucYFqIxeij8BWXT5XObX
   r5XqDSsgL7WcEhxqCiCmqAdKuGNwL664pWXEH/2srSkMUZ02FG6fDhYXe
   A==;
X-CSE-ConnectionGUID: LP7xxsvcSnS8ZwOxODZNtw==
X-CSE-MsgGUID: tz8MxJ3ZTEC8nrth83huOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017611"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="15017611"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:33 -0700
X-CSE-ConnectionGUID: x0Pbh5TnQFyUHhAxMzbBbQ==
X-CSE-MsgGUID: zI2g/JLAQSW9L8lm15egXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="33761042"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 15/18] ASoC: Intel: sof_sdw: add controls and dapm widgets in
 codec_info
Date: Thu,  9 May 2024 11:34:15 -0500
Message-Id: <20240509163418.67746-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BMIRBLGGL3R7SWY3T3UJLJTTPO7SCTKC
X-Message-ID-Hash: BMIRBLGGL3R7SWY3T3UJLJTTPO7SCTKC
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BMIRBLGGL3R7SWY3T3UJLJTTPO7SCTKC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Currently, we add card controls and dapm widgets one by one in the
codec_info->dais->rtd_init callback. Duplicated controls and dapm
widgets will be added if there are more than one types of amps in the
dai link. Moving it to sof_sdw_rtd_init() and only add the
controls/widgets of the first codec dai can avoid the duplications.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 31 +++++++++++++++++++++++++
 sound/soc/intel/boards/sof_sdw_common.h |  4 ++++
 2 files changed, 35 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 2b97972f85ef..3acc2db61b35 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1248,6 +1248,7 @@ static const char *get_codec_name(struct device *dev,
 
 static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
+	struct snd_soc_card *card = rtd->card;
 	struct sof_sdw_codec_info *codec_info;
 	struct snd_soc_dai *dai;
 	int dai_index;
@@ -1267,6 +1268,36 @@ static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 		 */
 		if (codec_info->dais[dai_index].rtd_init_done)
 			continue;
+
+		/*
+		 * Add card controls and dapm widgets for the first codec dai.
+		 * The controls and widgets will be used for all codec dais.
+		 */
+
+		if (i > 0)
+			goto skip_add_controls_widgets;
+
+		if (codec_info->dais[dai_index].controls) {
+			ret = snd_soc_add_card_controls(card, codec_info->dais[dai_index].controls,
+							codec_info->dais[dai_index].num_controls);
+			if (ret) {
+				dev_err(card->dev, "%#x controls addition failed: %d\n",
+					codec_info->part_id, ret);
+				return ret;
+			}
+		}
+		if (codec_info->dais[dai_index].widgets) {
+			ret = snd_soc_dapm_new_controls(&card->dapm,
+							codec_info->dais[dai_index].widgets,
+							codec_info->dais[dai_index].num_widgets);
+			if (ret) {
+				dev_err(card->dev, "%#x widgets addition failed: %d\n",
+					codec_info->part_id, ret);
+				return ret;
+			}
+		}
+
+skip_add_controls_widgets:
 		if (codec_info->dais[dai_index].rtd_init) {
 			ret = codec_info->dais[dai_index].rtd_init(rtd);
 			if (ret)
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 94657dd210f5..a8ba39bd5fd8 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -86,6 +86,10 @@ struct sof_sdw_dai_info {
 	const char *dai_name;
 	const int dai_type;
 	const int dailink[2]; /* dailink id for each direction */
+	const struct snd_kcontrol_new *controls;
+	const int num_controls;
+	const struct snd_soc_dapm_widget *widgets;
+	const int num_widgets;
 	int  (*init)(struct snd_soc_card *card,
 		     struct snd_soc_dai_link *dai_links,
 		     struct sof_sdw_codec_info *info,
-- 
2.40.1

