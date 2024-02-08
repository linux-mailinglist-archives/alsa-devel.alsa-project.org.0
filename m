Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B43F784E5B5
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 17:58:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06913857;
	Thu,  8 Feb 2024 17:58:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06913857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411519;
	bh=4n8aJxdWfRtljlJtGHex4bY9uxESjHTI/pSkkgcvYhs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oFwqCSx3/0GYoSOmZ2Vk6IzxwzvLlYX1dzDc8oDiEanKSy/G566dnN/aeP/FLsn0F
	 99goY8aLjU1EFucUffKjN81qX8RFthoD5ATwyjdC+PAxvdPv2r09QEE01Y30jfqtfY
	 cAqD9IcMnPqiFjBxNsxJ2vYdkzT3ST8V4N0gPvYM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7502EF806B9; Thu,  8 Feb 2024 17:56:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74A8FF806B4;
	Thu,  8 Feb 2024 17:56:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77906F805FB; Thu,  8 Feb 2024 17:56:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F304DF804E7
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:56:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F304DF804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YLJAvjdQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411369; x=1738947369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4n8aJxdWfRtljlJtGHex4bY9uxESjHTI/pSkkgcvYhs=;
  b=YLJAvjdQafj5ll1mu+ELvqPvn3DLfPuUUMAKdihe/13Z7/6Qc0JFN78u
   6DdAhZ81zqTlYae8CVd7NDijX071kIMir1N4qB1j7kp7bIZ0Mg+FLUeqp
   XyE3ttJKZnjXlW/3wxfwIOvRVTDdf+GrAlThZZBECEvmT/mdp4jr2X0UW
   zSeTPuyyo2YXoRh5vxoQfzu5abHMmjldK/N0apKTxtHaHAlzR8oO2oO6N
   hb/QxiKI8EvZGpHbbj3HieRae7gbcgd6v4OiRMjPeS9mtOnpRElIejMk2
   Blhs3L28bIEaopBGutQZTCgniKP3Usb/nwj4r/qSNle3MTn/bOmpGX55v
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675355"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675355"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690190"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:00 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/24] ASoC: Intel: add get_codec_dai_by_name helper function
Date: Thu,  8 Feb 2024 10:55:31 -0600
Message-Id: <20240208165545.93811-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SAG7HMJKP4R2DDFSO5IJCSVDAP6K36ZW
X-Message-ID-Hash: SAG7HMJKP4R2DDFSO5IJCSVDAP6K36ZW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SAG7HMJKP4R2DDFSO5IJCSVDAP6K36ZW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Currently, we assume the codecs in a dai link are all the same.
So that we get codec dai with snd_soc_rtd_to_codec(rtd, 0) in dai_links
->init callback. However, a link can include different codecs.
For example, a 4 speakers link can consist of rt712 and rt1316.
Therefore, we need to select the codec dai by name in the dai link.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_board_helpers.c | 18 ++++++++++++++++++
 sound/soc/intel/boards/sof_board_helpers.h |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 25f9ff12618c..9c08d3e54e3b 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -584,6 +584,24 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_NS(sof_intel_board_set_dai_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
 
+struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
+					  const char *dai_name[], int num_dais)
+{
+	struct snd_soc_dai *dai;
+	int index;
+	int i;
+
+	for (index = 0; index < num_dais; index++)
+		for_each_rtd_codec_dais(rtd, i, dai)
+			if (strstr(dai->name, dai_name[index])) {
+				dev_dbg(rtd->card->dev, "get dai %s\n", dai->name);
+				return dai;
+			}
+
+	return NULL;
+}
+EXPORT_SYMBOL_NS(get_codec_dai_by_name, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+
 MODULE_DESCRIPTION("ASoC Intel SOF Machine Driver Board Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index c5d6e7bec5d4..b626198f685d 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -118,4 +118,7 @@ int sof_intel_board_set_hdmi_in_link(struct device *dev,
 				     struct snd_soc_dai_link *link, int be_id,
 				     int ssp_hdmi);
 
+struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
+					  const char *dai_name[], int num_dais);
+
 #endif /* __SOF_INTEL_BOARD_HELPERS_H */
-- 
2.40.1

