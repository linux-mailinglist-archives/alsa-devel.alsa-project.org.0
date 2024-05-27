Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAE78D0E54
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:42:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD2F0E69;
	Mon, 27 May 2024 21:41:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD2F0E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716838919;
	bh=2m3wXl1aloLbGCx8+3UjrcvRoYSfSH2cV7nQxeM9yPM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g5VpkSZPShQZtEWLZOX1dYLGqCoSkiFm8fQFKAEDUqw+scBn7MTExcJjfwbCufRoj
	 MCep2f4jADHh2+0KW3oRt/SH3IwpErqN1rmbAplt6wzTVjmEOxXXzRTBWxlEnAk2Bi
	 k3Q5l73ctcpRubksJXvLMVWr7BTy3uUejlGK0z0A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9ABEDF8068D; Mon, 27 May 2024 21:38:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BEFD4F80679;
	Mon, 27 May 2024 21:38:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43A5FF80578; Mon, 27 May 2024 21:38:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 42A96F8047C
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42A96F8047C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MI2mLxc0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838580; x=1748374580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2m3wXl1aloLbGCx8+3UjrcvRoYSfSH2cV7nQxeM9yPM=;
  b=MI2mLxc0b5ZFFxvpvYDdFROKlSxwUln4WjAIBy4h9QKkfFI7r6d5V/lS
   jeKhrnSH3vKSTXKAfIiEV8rB5duV6asbMzWPJgiT6vOEswphqULhJpdiF
   A0LnHY+0X+hc1HYoDBtkVog/u3HwrwigVv/8sO2GwNQ2Q2WveGP59CtPB
   U03PFS6RLz9Sy4QwdWptkrLJzYLw2U7pNfp9xRHSbxw2K2mndIWFnfbA9
   LjWy9zwzy3q4zpEqxwmX0wDXPEAPfDZirj568LrageTBZyWvovpd+Hplc
   ZCZLzgiVnis5YUDJNnzpwiVP5T7qABC0d0hIUWO6ev9VcXPyVAqkPaytc
   Q==;
X-CSE-ConnectionGUID: sGVKuj9WQGiolgzLXJ9ZBQ==
X-CSE-MsgGUID: XKW7weSyT8SZXay18odbiw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339348"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="13339348"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:15 -0700
X-CSE-ConnectionGUID: SzXWC9yzTX6l47CeOqX5AQ==
X-CSE-MsgGUID: lZ55y1mQQva053ZLa7PkXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="58029767"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:36:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 08/18] ASoC: Intel: sof_sdw: Add missing controls for
 cs42l43/cs35l56
Date: Mon, 27 May 2024 14:35:42 -0500
Message-ID: <20240527193552.165567-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AF4BLXQME5Y47OUT4A5CMINQ4QMLRTU6
X-Message-ID-Hash: AF4BLXQME5Y47OUT4A5CMINQ4QMLRTU6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AF4BLXQME5Y47OUT4A5CMINQ4QMLRTU6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

No reason for cs42l43 and cs35l56 not to offer pin switch controls for
the headphones and speakers, add these controls.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 9dc50a6d5301..0516ae660824 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1059,6 +1059,8 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_AMP_IN_DAI_ID},
 				.init = sof_sdw_cs_amp_init,
 				.rtd_init = cs_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
 				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
 			},
@@ -1094,6 +1096,8 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
 				.rtd_init = cs42l43_hs_rtd_init,
+				.controls = generic_jack_controls,
+				.num_controls = ARRAY_SIZE(generic_jack_controls),
 				.widgets = generic_jack_widgets,
 				.num_widgets = ARRAY_SIZE(generic_jack_widgets),
 			},
@@ -1119,6 +1123,8 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
 				.init = sof_sdw_cs42l43_spk_init,
 				.rtd_init = cs42l43_spk_rtd_init,
+				.controls = generic_spk_controls,
+				.num_controls = ARRAY_SIZE(generic_spk_controls),
 				.widgets = generic_spk_widgets,
 				.num_widgets = ARRAY_SIZE(generic_spk_widgets),
 				.quirk = SOF_CODEC_SPKR | SOF_SIDECAR_AMPS,
-- 
2.43.0

