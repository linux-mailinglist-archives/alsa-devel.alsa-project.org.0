Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 333B954ECC1
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 23:43:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AAF7B1B15;
	Thu, 16 Jun 2022 23:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AAF7B1B15
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655415830;
	bh=TwVH+rj1SMkrLPemj9Z+mLJJ6yR/mN1VnRoqtto2G6E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lJBMgqZhNIiydfmpQQRJvSvxcb6ifMYyLldHHIkc2szRFsLErH+1Nw7XVD00Uwk74
	 AGAkbsVd8judXXL19eeNDgWG+1UO0OvwlevZDMdJeEqyPLN+FyUqJax3HMq6iw8hGh
	 ATquqtAxMLKRliC+SF/bt87R26C+whyTv6t17gW8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 928DBF8054A;
	Thu, 16 Jun 2022 23:41:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE17BF80310; Thu, 16 Jun 2022 23:41:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE3D6F8047C
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 23:41:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE3D6F8047C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="REqsx6Vs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655415673; x=1686951673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TwVH+rj1SMkrLPemj9Z+mLJJ6yR/mN1VnRoqtto2G6E=;
 b=REqsx6VsvlUgtG33QEINVmq59B8a2tyQaR9ezlkxbNI76TIDz1Bw2Yw3
 otV4V6A3IKxkLlopWhWwzmLXjSgn/9jUUsrd9OloXMGr7Qn8YTHFBnvNG
 7PCwEFW0mcY92sGsVZLbyxN2htrPvi8oafNWP+hYkmcqVaT27OQucuZVn
 BEoh1871vakImZHQ5hUWEspbpX8LCKtOC1sPOPijRmxTNTckk2saJXmjQ
 YsSJqy3AgHigFJbjD8UwnncyL51iOfY09KTTJ3gmOt/BoTYyZjimCFroF
 XnK50HQnifFotjkayU2XuZgGMukK3N58Nvfe9MRFfOZU7Ow/U9ghcHBFw Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="276932433"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="276932433"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:41:08 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="831746754"
Received: from buckkenx-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.52.70])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 14:41:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/13] ASoC: Intel: kbl_da7219_max98927: remap jack pins
Date: Thu, 16 Jun 2022 16:40:47 -0500
Message-Id: <20220616214055.134943-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616214055.134943-1-pierre-louis.bossart@linux.intel.com>
References: <20220616214055.134943-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The card did not map jack pins to controls, which prevents
PulseAudio/PipeWire from dealing with jack detection. It's likely that
jack detection was only tested with the CRAS server and extensions of
UCM.

Suggested-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/kbl_da7219_max98927.c | 21 ++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index 703ccff634b01..362579f25835e 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -119,6 +119,17 @@ static const struct snd_soc_dapm_widget kabylake_widgets[] = {
 			SND_SOC_DAPM_POST_PMD),
 };
 
+static struct snd_soc_jack_pin jack_pins[] = {
+	{
+		.pin    = "Headphone Jack",
+		.mask   = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin    = "Headset Mic",
+		.mask   = SND_JACK_MICROPHONE,
+	},
+};
+
 static const struct snd_soc_dapm_route kabylake_map[] = {
 	/* speaker */
 	{ "Left Spk", NULL, "Left BE_OUT" },
@@ -354,10 +365,12 @@ static int kabylake_da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	 * Headset buttons map to the google Reference headset.
 	 * These can be configured by userspace.
 	 */
-	ret = snd_soc_card_jack_new(kabylake_audio_card, "Headset Jack",
-			SND_JACK_HEADSET | SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-			SND_JACK_BTN_2 | SND_JACK_BTN_3 | SND_JACK_LINEOUT,
-			&ctx->kabylake_headset);
+	ret = snd_soc_card_jack_new_pins(kabylake_audio_card, "Headset Jack",
+					 SND_JACK_HEADSET | SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					 SND_JACK_BTN_2 | SND_JACK_BTN_3 | SND_JACK_LINEOUT,
+					 &ctx->kabylake_headset,
+					 jack_pins,
+					 ARRAY_SIZE(jack_pins));
 	if (ret) {
 		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
 		return ret;
-- 
2.34.1

