Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E26FF8C130C
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 18:36:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EF70E9A;
	Thu,  9 May 2024 18:35:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EF70E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715272561;
	bh=GqULhJRi1unMt5mH+4JgxuoIxqMP1UxS9DsIZ2rk91M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nbhfv83Iij0K6zdjRUKvLa9aZefZ3QAQx23yhFrGb/sJe34ba7J80TlZc0kvn1Vo8
	 XUWyx9Fx8g9h5OnNcwh124MbM7i+TpEtR7+ta4/zcM4CW/3ygDNrNIrOu2+az85GCV
	 vOzfWp8eQPl5DE/SPQzyuRjQEBKn7INrR/qYrVAs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 518D1F80602; Thu,  9 May 2024 18:34:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77C2DF805F2;
	Thu,  9 May 2024 18:34:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 378F0F80580; Thu,  9 May 2024 18:34:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3521AF804F2
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 18:34:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3521AF804F2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WCIq8uy/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272476; x=1746808476;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GqULhJRi1unMt5mH+4JgxuoIxqMP1UxS9DsIZ2rk91M=;
  b=WCIq8uy/9kL8Zzf5QDjTAP512gYZm2u2kxEWrIQ03QM+d6zE3zpRpygV
   PDDbIcgAxlNxG4Xo8QVg0joVMdKSGgcpWVGiQfZqBHxP+V3YszKUzwIaP
   LTANLBd6RWmz8VO0RBLmyvCUS3W1JuqRSr5ffjF3KwW8i/V3pervvBdD4
   fmxD9XJPjr8xD7bEq6bQwuEKDhQnFhFpLmJQxIqLmXnTzZ82IJcWVa2zO
   fAWrFIDyWtx6bc3u9d8Nju8saq7YZ3KhCzP1WKgOluv9PLMVDCZ9KWZe1
   W2b+KbA5L8q4qbxNAxeZAwGCJ6/2BUC39WFkRrnzWyOLvMvJ34hx2DGbO
   g==;
X-CSE-ConnectionGUID: /LhAD4j4Q2SUIFk0Dyp6Hg==
X-CSE-MsgGUID: gYDbS2oiQAOHNqgukrCXMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017534"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="15017534"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:27 -0700
X-CSE-ConnectionGUID: 5s2dpUBkQ/egIWSiOrwKyA==
X-CSE-MsgGUID: ScSCAIlPQRG6yiuiIKRPTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000";
   d="scan'208";a="33760990"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 09:34:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 04/18] ASoC: Intel: realtek-common: remove 2-spk rt1015p
 config
Date: Thu,  9 May 2024 11:34:04 -0500
Message-Id: <20240509163418.67746-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DVODAVA5B3TPMFYHRHZBR5PJQXRFLWQT
X-Message-ID-Hash: DVODAVA5B3TPMFYHRHZBR5PJQXRFLWQT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DVODAVA5B3TPMFYHRHZBR5PJQXRFLWQT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

The original code for rt1015p could support 1 or 2 rt1015p device
instances in ACPI. However, all designs implement only 1 instance in
ACPI table so we remove the code segment which is for 2 instances.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_realtek_common.c | 57 ++-------------------
 sound/soc/intel/boards/sof_realtek_common.h |  1 -
 2 files changed, 5 insertions(+), 53 deletions(-)

diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index 6915ff8b8716..dda346e0f737 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -314,59 +314,21 @@ EXPORT_SYMBOL_NS(sof_rt1011_codec_conf, SND_SOC_INTEL_SOF_REALTEK_COMMON);
  *
  * For stereo output, there are always two amplifiers on the board.
  * However, the ACPI implements only one device instance (UID=0) if they
- * are sharing the same enable pin. The code will detect the number of
- * device instance and use corresponding DAPM structures for
- * initialization.
+ * are sharing the same enable pin. This is the case of rt1015p.
  */
-static const struct snd_soc_dapm_route rt1015p_1dev_dapm_routes[] = {
+static const struct snd_soc_dapm_route rt1015p_dapm_routes[] = {
 	/* speaker */
 	{ "Left Spk", NULL, "Speaker" },
 	{ "Right Spk", NULL, "Speaker" },
 };
 
-static const struct snd_soc_dapm_route rt1015p_2dev_dapm_routes[] = {
-	/* speaker */
-	{ "Left Spk", NULL, "Left Speaker" },
-	{ "Right Spk", NULL, "Right Speaker" },
-};
-
-static struct snd_soc_codec_conf rt1015p_codec_confs[] = {
-	{
-		.dlc = COMP_CODEC_CONF(RT1015P_DEV0_NAME),
-		.name_prefix = "Left",
-	},
-	{
-		.dlc = COMP_CODEC_CONF(RT1015P_DEV1_NAME),
-		.name_prefix = "Right",
-	},
-};
-
 static struct snd_soc_dai_link_component rt1015p_dai_link_components[] = {
 	{
 		.name = RT1015P_DEV0_NAME,
 		.dai_name = RT1015P_CODEC_DAI,
 	},
-	{
-		.name = RT1015P_DEV1_NAME,
-		.dai_name = RT1015P_CODEC_DAI,
-	},
 };
 
-static int rt1015p_get_num_codecs(void)
-{
-	static int dev_num;
-
-	if (dev_num)
-		return dev_num;
-
-	if (!acpi_dev_present("RTL1015", "1", -1))
-		dev_num = 1;
-	else
-		dev_num = 2;
-
-	return dev_num;
-}
-
 static int rt1015p_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
@@ -398,12 +360,8 @@ static int rt1015p_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	if (rt1015p_get_num_codecs() == 1)
-		ret = snd_soc_dapm_add_routes(&card->dapm, rt1015p_1dev_dapm_routes,
-					      ARRAY_SIZE(rt1015p_1dev_dapm_routes));
-	else
-		ret = snd_soc_dapm_add_routes(&card->dapm, rt1015p_2dev_dapm_routes,
-					      ARRAY_SIZE(rt1015p_2dev_dapm_routes));
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt1015p_dapm_routes,
+				      ARRAY_SIZE(rt1015p_dapm_routes));
 	if (ret)
 		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
 	return ret;
@@ -412,7 +370,7 @@ static int rt1015p_init(struct snd_soc_pcm_runtime *rtd)
 void sof_rt1015p_dai_link(struct snd_soc_dai_link *link)
 {
 	link->codecs = rt1015p_dai_link_components;
-	link->num_codecs = rt1015p_get_num_codecs();
+	link->num_codecs = ARRAY_SIZE(rt1015p_dai_link_components);
 	link->init = rt1015p_init;
 	link->ops = &rt1015p_ops;
 }
@@ -420,11 +378,6 @@ EXPORT_SYMBOL_NS(sof_rt1015p_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
 
 void sof_rt1015p_codec_conf(struct snd_soc_card *card)
 {
-	if (rt1015p_get_num_codecs() == 1)
-		return;
-
-	card->codec_conf = rt1015p_codec_confs;
-	card->num_configs = ARRAY_SIZE(rt1015p_codec_confs);
 }
 EXPORT_SYMBOL_NS(sof_rt1015p_codec_conf, SND_SOC_INTEL_SOF_REALTEK_COMMON);
 
diff --git a/sound/soc/intel/boards/sof_realtek_common.h b/sound/soc/intel/boards/sof_realtek_common.h
index d0e331530b39..876290555c22 100644
--- a/sound/soc/intel/boards/sof_realtek_common.h
+++ b/sound/soc/intel/boards/sof_realtek_common.h
@@ -31,7 +31,6 @@ void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card *card);
  */
 #define RT1015P_CODEC_DAI	"HiFi"
 #define RT1015P_DEV0_NAME	RT1015P_ACPI_HID ":00"
-#define RT1015P_DEV1_NAME	RT1015P_ACPI_HID ":01"
 
 void sof_rt1015p_dai_link(struct snd_soc_dai_link *link);
 void sof_rt1015p_codec_conf(struct snd_soc_card *card);
-- 
2.40.1

