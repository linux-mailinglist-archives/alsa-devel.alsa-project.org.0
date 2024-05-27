Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5751B8D0E4F
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:40:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89A2D82B;
	Mon, 27 May 2024 21:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89A2D82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716838848;
	bh=xbtyfMP+dOw4ckNn9T0gy9jjMzAo2gIJpbMQ1H4TmOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MPduNByBG7wXcUSi2gSfSLt8ogWN3ECoNJPceF9HrvuxjQ+v8ht95bKiTCO8Ttvmf
	 QzQUiAC6NkgPtu/mYOZKCKbwgEEsizIfT/sQ6kvUr2PCe+WTCNQWLr7ny/WLPdS4E0
	 Dzcrptj2VWSmMa03SPd3VO2InijCjbyM2tNw2SzU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E044F80854; Mon, 27 May 2024 21:37:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18348F8085C;
	Mon, 27 May 2024 21:37:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EC9CF807D0; Mon, 27 May 2024 21:37:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D67AF805BD
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D67AF805BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DRqsHOcb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838588; x=1748374588;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xbtyfMP+dOw4ckNn9T0gy9jjMzAo2gIJpbMQ1H4TmOA=;
  b=DRqsHOcbqSdgei/mijkfK2I0zgu+1FAaFEkvks8y1Iggid4mn7y8eA3D
   RxOdchKn5DHrPeVtPEgBoObFxLdbJvwh0wiL4sBnwtwAOZpekLbAKvo0s
   aD7cS1W3PH/S0c5DxfiBt8iwpf1+7r5ThNYqQ8JQnXNl6Zw+RQfXEHlBY
   vlymWZiV4bye2D0q4Iiw0jRcCp7I42hfuNej1ilEuUX5WcC8yw30zkArR
   PN9kYknqbS4HMJugyyzwZruajl8z1E6y/T58BcCJTLZeWp00wR2x3SSQg
   H5v+URlrNUv0+03qEt/XXrmmIZ1eVJuxXrPVWuc5RvOLUAjhoFgh/ova1
   w==;
X-CSE-ConnectionGUID: 5HQBGACbRSOnIvApB1C9kA==
X-CSE-MsgGUID: LFIOYnfuQ0iZUMCJ4YbWGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339405"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="13339405"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:23 -0700
X-CSE-ConnectionGUID: kgm4U/XGRfKKkf10mf7Q6Q==
X-CSE-MsgGUID: JhswT7RSRQ+jrCL2p9xU+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="58029803"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 18/18] ASoC: Intel: sof_da7219: disable max98373 speaker pins
 in late_probe
Date: Mon, 27 May 2024 14:35:52 -0500
Message-ID: <20240527193552.165567-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G4A7HVYBVKSJL577K5E7D3647TQWKN2J
X-Message-ID-Hash: G4A7HVYBVKSJL577K5E7D3647TQWKN2J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G4A7HVYBVKSJL577K5E7D3647TQWKN2J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Commit 94d2d0897474 ("ASoC: Intel: Boards: tgl_max98373: add dai_trigger
function") disables speaker pins in late_probe to allow DSP to enter
low power state. Add same code to sof_da7219 driver.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 0e3c352a1672..fa1f7d2d8278 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -180,6 +180,19 @@ static void da7219_codec_exit(struct snd_soc_pcm_runtime *rtd)
 
 static int card_late_probe(struct snd_soc_card *card)
 {
+	struct sof_card_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dapm_context *dapm = &card->dapm;
+	int err;
+
+	if (ctx->amp_type == CODEC_MAX98373) {
+		/* Disable Left and Right Spk pin after boot */
+		snd_soc_dapm_disable_pin(dapm, "Left Spk");
+		snd_soc_dapm_disable_pin(dapm, "Right Spk");
+		err = snd_soc_dapm_sync(dapm);
+		if (err < 0)
+			return err;
+	}
+
 	return sof_intel_board_card_late_probe(card);
 }
 
-- 
2.43.0

