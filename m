Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFF68BCD32
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2024 13:51:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DF5E741;
	Mon,  6 May 2024 13:51:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DF5E741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714996294;
	bh=mBLK0MUQ/HcVL9wLI47JM6TB+GZw4U2WKLwf5kIZPPw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=N/1LdtVycrifUUm5lANy5WiXTQ8LHUyMdQzz8rmpjmePlhslOps5HHRJlji92VJ6B
	 C6MwqY+9E/DOZNcLTGsmxf7LUcKerZW4mECVZh7zrcjCdxXJ7L+OHDjOAEdHgio/jw
	 z4k4n/9XVeMMCp6CP73p+xWzWfZINGZOcELvU0Bc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 922DFF804E7; Mon,  6 May 2024 13:51:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2829F8057A;
	Mon,  6 May 2024 13:51:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74AEEF8049C; Mon,  6 May 2024 13:50:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85842F800E2
	for <alsa-devel@alsa-project.org>; Mon,  6 May 2024 13:50:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85842F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=c7ZAQcNJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714996245; x=1746532245;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mBLK0MUQ/HcVL9wLI47JM6TB+GZw4U2WKLwf5kIZPPw=;
  b=c7ZAQcNJ561n4NfRu0gV5eylzSKSpOnvP327WkHJ2UZZyE+gvdtUxcO8
   mAW/jhoItq+hAGpDnfOggefV3B/qcMhvKuMn1KkInW72b91R7h1ReJ02z
   3Qpk/bHgJzrHYV2clN373TkMobiJWVRUUYRcOMkwWeD4WRdpb5FD9SEZV
   j+6eZWVam673p089xzo7g14c2AHjQ1XSzKtPBWWlxr8qyqS6kQUwaRSix
   WvX/pJWrNJAinqhHQyr29rrRpkLiNo6USmxTqJkOpfCyEZly8z6jPCcEa
   4ua2OnFJBjGusK2Zdm8/4PPqUFr4s/ql9NmHQ23ODNozvcrJe8s5lWmeg
   g==;
X-CSE-ConnectionGUID: xJoXZKnERw296P5MxXBmoQ==
X-CSE-MsgGUID: LX5zvYpYQ1SsJC+7hsEnkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="36122426"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000";
   d="scan'208";a="36122426"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 04:50:35 -0700
X-CSE-ConnectionGUID: Zd9krN7ySumkUpLdbxTDdQ==
X-CSE-MsgGUID: Z6NW9O9sQsu5mHDzipVQlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000";
   d="scan'208";a="32814693"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa003.jf.intel.com with ESMTP; 06 May 2024 04:50:33 -0700
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
Subject: [PATCH] ASoC: Intel: avs: boards: Properly name input device
Date: Mon,  6 May 2024 13:51:11 +0200
Message-Id: <20240506115111.3717095-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ON53GT2UHVQAACPDY37RXWRSFCB3U2NP
X-Message-ID-Hash: ON53GT2UHVQAACPDY37RXWRSFCB3U2NP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ON53GT2UHVQAACPDY37RXWRSFCB3U2NP/>
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
 sound/soc/intel/avs/boards/es8336.c  | 2 +-
 sound/soc/intel/avs/boards/nau8825.c | 2 +-
 sound/soc/intel/avs/boards/rt274.c   | 3 ++-
 sound/soc/intel/avs/boards/rt286.c   | 4 ++--
 sound/soc/intel/avs/boards/rt298.c   | 4 ++--
 sound/soc/intel/avs/boards/rt5640.c  | 3 ++-
 6 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index 3d77bc3344702..6440a46e795ec 100644
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
 
diff --git a/sound/soc/intel/avs/boards/rt5640.c b/sound/soc/intel/avs/boards/rt5640.c
index 07cd8db4e6c2b..7c94680c4b3ad 100644
--- a/sound/soc/intel/avs/boards/rt5640.c
+++ b/sound/soc/intel/avs/boards/rt5640.c
@@ -62,7 +62,8 @@ static int avs_rt5640_codec_init(struct snd_soc_pcm_runtime *runtime)
 	if (!pins)
 		return -ENOMEM;
 
-	ret = snd_soc_card_jack_new_pins(card, "Headset", SND_JACK_HEADSET, jack, pins, num_pins);
+	ret = snd_soc_card_jack_new_pins(card, "Headset Jack", SND_JACK_HEADSET, jack, pins,
+					 num_pins);
 	if (ret)
 		return ret;
 
-- 
2.34.1

