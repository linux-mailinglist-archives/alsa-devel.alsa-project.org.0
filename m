Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3512488C8C9
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:15:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8752B2C50;
	Tue, 26 Mar 2024 17:15:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8752B2C50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469744;
	bh=ZgXWLJa803Tcz4lHMH5IzQhQvBYtscxSaM1zxM0uUrc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fqEAsAiR1IXO8pAgqjJckLRrEps1sRykd+iXwcaF55UG6Iee8oh/KOfdXYgfyXzmf
	 IM2sMubf9/B/D7UVS/wFGQmm+qC4YvxgyXkMOiYJo3+SpNQ+9eKUs3wOdw42tPL3Vf
	 e/B/HX6Doo3up5ZFcKurX7XFhrhUXShPdGvfWo2A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90EEDF89873; Tue, 26 Mar 2024 17:07:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2CE5F89855;
	Tue, 26 Mar 2024 17:07:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73201F80CBC; Tue, 26 Mar 2024 17:06:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2847EF8060C
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:06:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2847EF8060C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=X8gNNqsm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469162; x=1743005162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZgXWLJa803Tcz4lHMH5IzQhQvBYtscxSaM1zxM0uUrc=;
  b=X8gNNqsmBKMuoiNgLvGAmb+MraoZKOmTEZcNNBrmvFx/EUmdhsRlDYaQ
   HcIXOembH884BqAUcFvo/APgEs0ryr+T5AbPUnth6t6xfdI28KJ5C0PTs
   lMrlfK2Vx8SeEPlXLhnu0c/6/C6Xrl9Yx2+Br0FHS5UWodhDdvwM7Ec2B
   Rin9+VF63bAXsWvJXYwf1bB1fJ0fqXCvNMLnITfI7QvJBrMjr6wtoO5uH
   zM04pkG02IOyOMUfDb0/BQQWL4mrNmpAl/xB9rQdVqLNr8VQJdZkcDCRV
   ZrKVSDfRdUzlLPLtYVJdXbINt6XlwBM7DJLvMHssBFpcUC4Pf1tG/UUmX
   w==;
X-CSE-ConnectionGUID: +6liy8alTxKre/Iw6PWJnw==
X-CSE-MsgGUID: QG1jHc4nRImSF69o065Ktw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260578"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260578"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482510"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 33/34] ASoC: Intel: sof_sdw: Add quirk for optional codec
 speakers
Date: Tue, 26 Mar 2024 11:04:28 -0500
Message-Id: <20240326160429.13560-34-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: APQL7M5A275OZ3UHW2AWALLBA232ZLIQ
X-Message-ID-Hash: APQL7M5A275OZ3UHW2AWALLBA232ZLIQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/APQL7M5A275OZ3UHW2AWALLBA232ZLIQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Some codecs have speaker drivers that may or may not be used in a
given system. Add a quirk (SOF_CODEC_SPKR) that defines if a system
uses the codec speaker, this is kept generic such that any codec
with such a speaker DAI can reuse the quirk.

For implementation of this, add a quirk field into the
sof_sdw_dai_info structure. This field is not used to specify
if a system uses a particular quirk, that is still done through
the sof_sdw_quirk variable, this field is used to flag a DAI as
conditional on a certain quirk. This means the DAI will only be
included in the card if sof_sdw_quirk and the DAI quirk field have
a matching set bit.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 5 +++++
 sound/soc/intel/boards/sof_sdw_common.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 5a7014d82d6c..4fc15f597e28 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -37,6 +37,8 @@ static void log_quirks(struct device *dev)
 			SOF_SSP_GET_PORT(sof_sdw_quirk));
 	if (sof_sdw_quirk & SOF_SDW_NO_AGGREGATION)
 		dev_err(dev, "quirk SOF_SDW_NO_AGGREGATION enabled but no longer supported\n");
+	if (sof_sdw_quirk & SOF_CODEC_SPKR)
+		dev_dbg(dev, "quirk SOF_CODEC_SPKR enabled\n");
 }
 
 static int sof_sdw_quirk_cb(const struct dmi_system_id *id)
@@ -1382,6 +1384,9 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 				dai_info = &codec_info->dais[adr_end->num];
 				sof_dai = find_dailink(sof_dais, adr_end);
 
+				if (dai_info->quirk && !(dai_info->quirk & sof_sdw_quirk))
+					continue;
+
 				dev_dbg(dev,
 					"Add dev: %d, 0x%llx end: %d, %s, %c/%c to %s: %d\n",
 					ffs(adr_link->mask) - 1, adr_dev->adr,
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 8d8c2ca68a7f..81181627b406 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -52,6 +52,8 @@ enum {
 #define SOF_SSP_GET_PORT(quirk)	(((quirk) >> 7) & GENMASK(5, 0))
 /* Deprecated and no longer supported by the code */
 #define SOF_SDW_NO_AGGREGATION		BIT(14)
+/* If a CODEC has an optional speaker output, this quirk will enable it */
+#define SOF_CODEC_SPKR			BIT(15)
 
 /* BT audio offload: reserve 3 bits for future */
 #define SOF_BT_OFFLOAD_SSP_SHIFT	15
@@ -80,6 +82,7 @@ struct sof_sdw_dai_info {
 	int (*exit)(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 	int (*rtd_init)(struct snd_soc_pcm_runtime *rtd);
 	bool rtd_init_done; /* Indicate that the rtd_init callback is done */
+	unsigned long quirk;
 };
 
 struct sof_sdw_codec_info {
-- 
2.40.1

