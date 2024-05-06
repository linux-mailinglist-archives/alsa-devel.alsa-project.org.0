Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A7B8BCD80
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2024 14:11:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82273845;
	Mon,  6 May 2024 14:11:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82273845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714997473;
	bh=5F831Z1wy0b/p56+Y1qBr7mGK/DpXpQ/FDOxaBHXJl4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JXkYNhU4G+say9UXe4Hw5wzBoXwdVgyMhT3xI+lM9/obfAbrp1byABhdk7fTKtRUD
	 sYq/S34yoShYLNhyQi4wUDmyinNhTesAz4FrsWhJboPWyRtKNwnPdfXJUDzljuvuCY
	 yiOM6/K2kegRtt/BDbbwxa49n4EZu/EMtFxN+qEg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7C22F80588; Mon,  6 May 2024 14:10:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3EB8F804FB;
	Mon,  6 May 2024 14:10:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02DFEF8049C; Mon,  6 May 2024 14:10:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26B15F800E2
	for <alsa-devel@alsa-project.org>; Mon,  6 May 2024 14:10:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26B15F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=oCg1cdjH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714997435; x=1746533435;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5F831Z1wy0b/p56+Y1qBr7mGK/DpXpQ/FDOxaBHXJl4=;
  b=oCg1cdjHvPtHPxLJ1xHCIzws2+eKsfNYKYvgSyOv6Q8naTC214IO2cGA
   28wk3L26t+Dl3pSqMXRoqjUPtf00EI21L61WD42Nv1Ysd5zvGMfnlW0sy
   ozOJLg0jgZYTfjK5U763orao5BSHmc4LjRTSIEKDIUb1IMccUapv/qsLq
   1RMO7kwtGwzvRQj0Ey0Py5ifoqZ98LnqjyOUIrzlaAFW6MV/Tgz+kOdNy
   nLetArjggeiQPmFLJ+VTHuBzXxnvmX6lel8gLNscyP9bql8gEKnrOTKV0
   gKgASROPD/xS/RMiy+nvp3SUsYsrQSlaBFEtfcJwopkf16y+Km2re7JM2
   Q==;
X-CSE-ConnectionGUID: QY6ZNztXQ1CgJo/wte8/rA==
X-CSE-MsgGUID: 1sq/plw3SWiYgBQxc8eKJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10664980"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000";
   d="scan'208";a="10664980"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 05:10:31 -0700
X-CSE-ConnectionGUID: E4K9X5sLSJ2mQXz5tyGIfQ==
X-CSE-MsgGUID: 6tFQnvHRQJ6C2eMALS2Yhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000";
   d="scan'208";a="59019862"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa002.jf.intel.com with ESMTP; 06 May 2024 05:10:29 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v2] ASoC: Intel: avs: boards: Properly name input device
Date: Mon,  6 May 2024 14:11:06 +0200
Message-Id: <20240506121106.3792340-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BYXTYSEGLA3YLTG6SGSJTADLLXMDMYYS
X-Message-ID-Hash: BYXTYSEGLA3YLTG6SGSJTADLLXMDMYYS
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BYXTYSEGLA3YLTG6SGSJTADLLXMDMYYS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Machine boards expose input device for use with userspace. Current name
in some cases is incorrect, fix it.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---

v2:
 - Rebase on top of correct tree.

---
 sound/soc/intel/avs/boards/es8336.c  | 2 +-
 sound/soc/intel/avs/boards/nau8825.c | 2 +-
 sound/soc/intel/avs/boards/rt274.c   | 3 ++-
 sound/soc/intel/avs/boards/rt286.c   | 4 ++--
 sound/soc/intel/avs/boards/rt298.c   | 4 ++--
 5 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index ff3bd15132694..f4919a6abc278 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -113,7 +113,7 @@ static int avs_es8336_codec_init(struct snd_soc_pcm_runtime *runtime)
 	if (!pins)
 		return -ENOMEM;
 
-	ret = snd_soc_card_jack_new_pins(card, "Headset", SND_JACK_HEADSET | SND_JACK_BTN_0,
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack", SND_JACK_HEADSET | SND_JACK_BTN_0,
 					 &data->jack, pins, num_pins);
 	if (ret)
 		return ret;
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 3164745b15167..eef718c6b8ad9 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -96,7 +96,7 @@ static int avs_nau8825_codec_init(struct snd_soc_pcm_runtime *runtime)
 	 * 4 buttons here map to the google Reference headset.
 	 * The use of these buttons can be decided by the user space.
 	 */
-	ret = snd_soc_card_jack_new_pins(card, "Headset", SND_JACK_HEADSET | SND_JACK_BTN_0 |
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack", SND_JACK_HEADSET | SND_JACK_BTN_0 |
 					 SND_JACK_BTN_1 | SND_JACK_BTN_2 | SND_JACK_BTN_3,
 					 jack, pins, num_pins);
 	if (ret)
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index e3aa28780df5a..51ebc790c6b4d 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -102,7 +102,8 @@ static int avs_rt274_codec_init(struct snd_soc_pcm_runtime *runtime)
 	if (!pins)
 		return -ENOMEM;
 
-	ret = snd_soc_card_jack_new_pins(card, "Headset", SND_JACK_HEADSET, jack, pins, num_pins);
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack", SND_JACK_HEADSET, jack, pins,
+					 num_pins);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index d24316fc4db9c..67fd362962c40 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -63,8 +63,8 @@ static int avs_rt286_codec_init(struct snd_soc_pcm_runtime *runtime)
 	if (!pins)
 		return -ENOMEM;
 
-	ret = snd_soc_card_jack_new_pins(card, "Headset", SND_JACK_HEADSET | SND_JACK_BTN_0, jack,
-					 pins, num_pins);
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack", SND_JACK_HEADSET | SND_JACK_BTN_0,
+					 jack, pins, num_pins);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 7fd28544f7869..1003e8689eacc 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -74,8 +74,8 @@ static int avs_rt298_codec_init(struct snd_soc_pcm_runtime *runtime)
 	if (!pins)
 		return -ENOMEM;
 
-	ret = snd_soc_card_jack_new_pins(card, "Headset", SND_JACK_HEADSET | SND_JACK_BTN_0, jack,
-					 pins, num_pins);
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack", SND_JACK_HEADSET | SND_JACK_BTN_0,
+					 jack, pins, num_pins);
 	if (ret)
 		return ret;
 
-- 
2.34.1

