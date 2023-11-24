Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EE77F73F2
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 13:40:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BC2FE7B;
	Fri, 24 Nov 2023 13:40:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BC2FE7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700829650;
	bh=woKsYxqA2S88S98VVn5QxVC44in9IgDwqXqe0NroGIs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=c1W9vPWXNok98pu68t3BPIKsoK2gTi/NSPTJrbgayJtT7WsVtdwVouSxp2yhD/czm
	 S0SOIb7G9YAs5RPF5RFA9hPB93ZvjfeRgHmcVgouicHu3sLoNgAI0ImrDlMuTHwJF/
	 TB8bRpsFXuHydOAxBjE+yPsv+hznHNEkBLiKr2GQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7891F805B4; Fri, 24 Nov 2023 13:40:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2379FF805B4;
	Fri, 24 Nov 2023 13:40:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FDF8F805A8; Fri, 24 Nov 2023 13:40:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65F96F80246
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 13:40:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65F96F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ntoZJFn3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700829606; x=1732365606;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=woKsYxqA2S88S98VVn5QxVC44in9IgDwqXqe0NroGIs=;
  b=ntoZJFn3jH2uBZ9D0i+xBt5WhZYv3b3qVph8FOptfkWQzu21kkVK6ykR
   MXlNgvCp3p3BQTLYVW0D+cVYYq4vjTk6tSFekzIXC6i327zcUbNybn6/h
   ZVrfvzylvn/Il7lniTLaGf9+JM9ihAic9ug62byy6Y62MW+eqJPDR24gq
   3WoAnjIc5Ml29GmwG5U/XjmHHAOLp+T883qKAUmi9UV9+MPOKKTtIkakE
   NRXIjfwUzhI3llTgA7zwjM0iyZ7hVDf3MlMzErm2MGGq8m3+Mf9/wGhWh
   C/iCG5fBoYx//h79UUk3dStklxBNwEEQsuu1cfVfP7r95f+Ne45/fAck8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5572886"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600";
   d="scan'208";a="5572886"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:40:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="885268815"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600";
   d="scan'208";a="885268815"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.182])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:39:58 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	cezary.rojewski@intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH] ASoC: Intel: sof_sdw: Always register the HDMI dai links
Date: Fri, 24 Nov 2023 14:40:32 +0200
Message-ID: <20231124124032.15946-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PBTRTSTE7JN7ZYDM5KVZKNJW3TJRK6SD
X-Message-ID-Hash: PBTRTSTE7JN7ZYDM5KVZKNJW3TJRK6SD
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBTRTSTE7JN7ZYDM5KVZKNJW3TJRK6SD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The topology files for SDW devices require HDMI dai links to be present and
this is granted under normal conditions but in case of special use cases
the display (i915) driver might not be enabled due to deny-listing,
booting with nomodeset or just not compiled at all.

This should not block the non HDMI audio to be usable so register the dai
links unconditionally. The code has been prepared for this and in case of
no HDMI audio the link is created with dummy codec.

Closes: https://github.com/thesofproject/linux/issues/4594
Closes: https://github.com/thesofproject/linux/issues/4648
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 3312ad8a563b..4e4284729773 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1546,7 +1546,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
-	int sdw_be_num = 0, ssp_num = 0, dmic_num = 0, hdmi_num = 0, bt_num = 0;
+	int sdw_be_num = 0, ssp_num = 0, dmic_num = 0, bt_num = 0;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	const struct snd_soc_acpi_link_adr *adr_link = mach_params->links;
@@ -1564,6 +1564,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	char *codec_name, *codec_dai_name;
 	int i, j, be_id = 0;
 	int codec_index;
+	int hdmi_num;
 	int ret;
 
 	ret = get_dailink_info(dev, adr_link, &sdw_be_num, &codec_conf_num);
@@ -1584,14 +1585,13 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		ssp_num = hweight_long(ssp_mask);
 	}
 
-	if (mach_params->codec_mask & IDISP_CODEC_MASK) {
+	if (mach_params->codec_mask & IDISP_CODEC_MASK)
 		ctx->hdmi.idisp_codec = true;
 
-		if (sof_sdw_quirk & SOF_SDW_TGL_HDMI)
-			hdmi_num = SOF_TGL_HDMI_COUNT;
-		else
-			hdmi_num = SOF_PRE_TGL_HDMI_COUNT;
-	}
+	if (sof_sdw_quirk & SOF_SDW_TGL_HDMI)
+		hdmi_num = SOF_TGL_HDMI_COUNT;
+	else
+		hdmi_num = SOF_PRE_TGL_HDMI_COUNT;
 
 	/* enable dmic01 & dmic16k */
 	if (sof_sdw_quirk & SOF_SDW_PCH_DMIC || mach_params->dmic_num)
@@ -1601,7 +1601,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		bt_num = 1;
 
 	dev_dbg(dev, "sdw %d, ssp %d, dmic %d, hdmi %d, bt: %d\n",
-		sdw_be_num, ssp_num, dmic_num, hdmi_num, bt_num);
+		sdw_be_num, ssp_num, dmic_num,
+		ctx->hdmi.idisp_codec ? hdmi_num : 0, bt_num);
 
 	/* allocate BE dailinks */
 	num_links = sdw_be_num + ssp_num + dmic_num + hdmi_num + bt_num;
-- 
2.42.1

