Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B87898C3339
	for <lists+alsa-devel@lfdr.de>; Sat, 11 May 2024 20:44:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 189E9DF6;
	Sat, 11 May 2024 20:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 189E9DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715453089;
	bh=QRhuwChDYHfSPQDVxVEglvM+ecX/SMlFXeAYPZHFFd4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dFVj5ohYowwzJcWOV9CZGv2Ur/8y/R0NG6kdlQDk2BalsbnSwJGPR2bCPo+n/ibsh
	 MAFO8Qm3zMpm125XIUnbWJgg/MFZJc8Kyc8UFs05ux2Vp6C2jxa4lApURK07l9rpXx
	 7iP9kzLg9uzZJnzygZ9ighk73SQDGyuk73aYXrjg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27935F8057F; Sat, 11 May 2024 20:44:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDA23F8057F;
	Sat, 11 May 2024 20:44:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06B7DF8049C; Sat, 11 May 2024 20:42:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from msa.smtpout.orange.fr (smtp-80.smtpout.orange.fr
 [80.12.242.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0ABEF8024C
	for <alsa-devel@alsa-project.org>; Sat, 11 May 2024 20:42:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0ABEF8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=Y3VJ7XTV
Received: from localhost.localdomain ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 5rfsszsjshrFP5rftsVhsx; Sat, 11 May 2024 20:42:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1715452948;
	bh=yubBFbXCfuOJIrYbX5F8iTYSJEFdBYtURyEVumq/GbQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Y3VJ7XTVwLs4HI8QEKT7vp28VPD2tciEdbe1dR3qBt7yP0ehdWVg0gTZl5cFCiJ1X
	 iprGBZmJ+EdMSvlN1dcxTPc+FkjiCgF/Xaasod8a7xNw03v796knNnWdrBMT9cWKTJ
	 bN5W3BJlgDVg3MEihuy3QBuwL1Y2aOMd8GZhs+z5WkxTizBtxG8VRfpjMWZhcUe1Ka
	 P2mIvNYWsTHFUzDLbGy2AXXiQ9es8iKmoDuV/jy2D8ijvZWP8UU5ximsVn7CCmy6jL
	 Oj4e3P3qKooQt9xj/f/Z9VpvEkZl5k1Gn9vcsrRAaug6Dkzh10IL0UGDPkQc56QmKa
	 ch3bZxwu/ZfvQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 11 May 2024 20:42:28 +0200
X-ME-IP: 86.243.17.157
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: intel: Constify struct snd_soc_ops
Date: Sat, 11 May 2024 20:42:06 +0200
Message-ID: 
 <242aef53b5b9533ae4cca78148622f5fe752b7ee.1715452901.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MDOCPUAUVLCSZDSLTOZ63274XA4IA3LY
X-Message-ID-Hash: MDOCPUAUVLCSZDSLTOZ63274XA4IA3LY
X-MailFrom: christophe.jaillet@wanadoo.fr
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MDOCPUAUVLCSZDSLTOZ63274XA4IA3LY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Constifying "struct snd_soc_ops" moves some data to a read-only section, so
increase overall security.

This structure is also part of scripts/const_structs.checkpatch.

As an example, on a x86_64, with allmodconfig:
Before:
   text	   data	    bss	    dec	    hex	filename
   6315	   3696	      0	  10011	   271b	sound/soc/intel/boards/ehl_rt5660.o

After:
   text	   data	    bss	    dec	    hex	filename
   6379	   3648	      0	  10027	   272b	sound/soc/intel/boards/ehl_rt5660.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

I hope that it can be applied with this single patch because all files are
in sound/soc/intel/boards/
---
 sound/soc/intel/boards/bdw-rt5650.c                 | 2 +-
 sound/soc/intel/boards/ehl_rt5660.c                 | 2 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c       | 4 ++--
 sound/soc/intel/boards/kbl_da7219_max98927.c        | 6 +++---
 sound/soc/intel/boards/kbl_rt5660.c                 | 2 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c        | 8 ++++----
 sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c | 6 +++---
 sound/soc/intel/boards/sof_es8336.c                 | 2 +-
 sound/soc/intel/boards/sof_maxim_common.c           | 2 +-
 sound/soc/intel/boards/sof_maxim_common.h           | 2 +-
 sound/soc/intel/boards/sof_nau8825.c                | 2 +-
 sound/soc/intel/boards/sof_realtek_common.c         | 2 +-
 sound/soc/intel/boards/sof_rt5682.c                 | 2 +-
 sound/soc/intel/boards/sof_sdw_common.h             | 2 +-
 sound/soc/intel/boards/sof_sdw_rt_amp.c             | 2 +-
 sound/soc/intel/boards/sof_wm8804.c                 | 2 +-
 16 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index 3ae26f21458f..3c7cee03a02e 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -131,7 +131,7 @@ static int bdw_rt5650_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static struct snd_soc_ops bdw_rt5650_ops = {
+static const struct snd_soc_ops bdw_rt5650_ops = {
 	.hw_params = bdw_rt5650_hw_params,
 };
 
diff --git a/sound/soc/intel/boards/ehl_rt5660.c b/sound/soc/intel/boards/ehl_rt5660.c
index 686e60321224..26289e8fdd87 100644
--- a/sound/soc/intel/boards/ehl_rt5660.c
+++ b/sound/soc/intel/boards/ehl_rt5660.c
@@ -132,7 +132,7 @@ static int rt5660_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static struct snd_soc_ops rt5660_ops = {
+static const struct snd_soc_ops rt5660_ops = {
 	.hw_params = rt5660_hw_params,
 };
 
diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index 9dbc15f9d1c9..154f6a74ed15 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -354,7 +354,7 @@ static int kabylake_dmic_startup(struct snd_pcm_substream *substream)
 			SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
 }
 
-static struct snd_soc_ops kabylake_dmic_ops = {
+static const struct snd_soc_ops kabylake_dmic_ops = {
 	.startup = kabylake_dmic_startup,
 };
 
@@ -388,7 +388,7 @@ static int kabylake_refcap_startup(struct snd_pcm_substream *substream)
 					&constraints_16000);
 }
 
-static struct snd_soc_ops skylake_refcap_ops = {
+static const struct snd_soc_ops skylake_refcap_ops = {
 	.startup = kabylake_refcap_startup,
 };
 
diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index e662da5af83b..02ed77a07e23 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -288,7 +288,7 @@ static int kabylake_ssp0_trigger(struct snd_pcm_substream *substream, int cmd)
 	return 0;
 }
 
-static struct snd_soc_ops kabylake_ssp0_ops = {
+static const struct snd_soc_ops kabylake_ssp0_ops = {
 	.hw_params = kabylake_ssp0_hw_params,
 	.trigger = kabylake_ssp0_trigger,
 };
@@ -535,7 +535,7 @@ static int kabylake_dmic_startup(struct snd_pcm_substream *substream)
 			SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
 }
 
-static struct snd_soc_ops kabylake_dmic_ops = {
+static const struct snd_soc_ops kabylake_dmic_ops = {
 	.startup = kabylake_dmic_startup,
 };
 
@@ -569,7 +569,7 @@ static int kabylake_refcap_startup(struct snd_pcm_substream *substream)
 }
 
 
-static struct snd_soc_ops skylake_refcap_ops = {
+static const struct snd_soc_ops skylake_refcap_ops = {
 	.startup = kabylake_refcap_startup,
 };
 
diff --git a/sound/soc/intel/boards/kbl_rt5660.c b/sound/soc/intel/boards/kbl_rt5660.c
index 894d127c482a..66885cb36f24 100644
--- a/sound/soc/intel/boards/kbl_rt5660.c
+++ b/sound/soc/intel/boards/kbl_rt5660.c
@@ -277,7 +277,7 @@ static int kabylake_rt5660_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static struct snd_soc_ops kabylake_rt5660_ops = {
+static const struct snd_soc_ops kabylake_rt5660_ops = {
 	.hw_params = kabylake_rt5660_hw_params,
 };
 
diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
index e16c42e81eca..9da89436a917 100644
--- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
@@ -489,7 +489,7 @@ static int kabylake_rt5663_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static struct snd_soc_ops kabylake_rt5663_ops = {
+static const struct snd_soc_ops kabylake_rt5663_ops = {
 	.hw_params = kabylake_rt5663_hw_params,
 };
 
@@ -539,7 +539,7 @@ static int kabylake_ssp0_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static struct snd_soc_ops kabylake_ssp0_ops = {
+static const struct snd_soc_ops kabylake_ssp0_ops = {
 	.hw_params = kabylake_ssp0_hw_params,
 };
 
@@ -575,7 +575,7 @@ static int kabylake_dmic_startup(struct snd_pcm_substream *substream)
 			SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
 }
 
-static struct snd_soc_ops kabylake_dmic_ops = {
+static const struct snd_soc_ops kabylake_dmic_ops = {
 	.startup = kabylake_dmic_startup,
 };
 
@@ -609,7 +609,7 @@ static int kabylake_refcap_startup(struct snd_pcm_substream *substream)
 				&constraints_16000);
 }
 
-static struct snd_soc_ops skylake_refcap_ops = {
+static const struct snd_soc_ops skylake_refcap_ops = {
 	.startup = kabylake_refcap_startup,
 };
 
diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index a9501cd106ff..a32ce8f972f3 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -424,7 +424,7 @@ static int kabylake_rt5663_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static struct snd_soc_ops kabylake_rt5663_ops = {
+static const struct snd_soc_ops kabylake_rt5663_ops = {
 	.hw_params = kabylake_rt5663_hw_params,
 };
 
@@ -469,7 +469,7 @@ static int kabylake_ssp0_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static struct snd_soc_ops kabylake_ssp0_ops = {
+static const struct snd_soc_ops kabylake_ssp0_ops = {
 	.hw_params = kabylake_ssp0_hw_params,
 };
 
@@ -508,7 +508,7 @@ static int kabylake_dmic_startup(struct snd_pcm_substream *substream)
 			SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
 }
 
-static struct snd_soc_ops kabylake_dmic_ops = {
+static const struct snd_soc_ops kabylake_dmic_ops = {
 	.startup = kabylake_dmic_startup,
 };
 
diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index c1fcc156a575..2a88efaa6d26 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -371,7 +371,7 @@ static int sof_es8336_hw_params(struct snd_pcm_substream *substream,
 }
 
 /* machine stream operations */
-static struct snd_soc_ops sof_es8336_ops = {
+static const struct snd_soc_ops sof_es8336_ops = {
 	.hw_params = sof_es8336_hw_params,
 	.trigger = sof_8336_trigger,
 };
diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index 7e1f485dce7a..f49354193f13 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -141,7 +141,7 @@ int max_98373_trigger(struct snd_pcm_substream *substream, int cmd)
 }
 EXPORT_SYMBOL_NS(max_98373_trigger, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
-struct snd_soc_ops max_98373_ops = {
+const struct snd_soc_ops max_98373_ops = {
 	.hw_params = max_98373_hw_params,
 	.trigger = max_98373_trigger,
 };
diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
index 8886f985de68..638fba0b43bc 100644
--- a/sound/soc/intel/boards/sof_maxim_common.h
+++ b/sound/soc/intel/boards/sof_maxim_common.h
@@ -21,7 +21,7 @@
 #define MAX_98373_DEV1_NAME	"i2c-" MAX_98373_ACPI_HID ":01"
 
 extern struct snd_soc_dai_link_component max_98373_components[2];
-extern struct snd_soc_ops max_98373_ops;
+extern const struct snd_soc_ops max_98373_ops;
 extern const struct snd_soc_dapm_route max_98373_dapm_routes[];
 
 int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd);
diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index dd4dc4ec4255..5e781c45d51a 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -115,7 +115,7 @@ static int sof_nau8825_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static struct snd_soc_ops sof_nau8825_ops = {
+static const struct snd_soc_ops sof_nau8825_ops = {
 	.hw_params = sof_nau8825_hw_params,
 };
 
diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index 6915ff8b8716..af1654f6d551 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -499,7 +499,7 @@ static int rt1015_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static struct snd_soc_ops rt1015_ops = {
+static const struct snd_soc_ops rt1015_ops = {
 	.hw_params = rt1015_hw_params,
 };
 
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index e3a2ec6b4c7c..ced5661d882a 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -406,7 +406,7 @@ static int sof_rt5682_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static struct snd_soc_ops sof_rt5682_ops = {
+static const struct snd_soc_ops sof_rt5682_ops = {
 	.hw_params = sof_rt5682_hw_params,
 };
 
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 94657dd210f5..cc749c8becc0 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -165,7 +165,7 @@ int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
 /* RT1308 I2S support */
-extern struct snd_soc_ops sof_sdw_rt1308_i2s_ops;
+extern const struct snd_soc_ops sof_sdw_rt1308_i2s_ops;
 
 /* generic amp support */
 int sof_sdw_rt_amp_init(struct snd_soc_card *card,
diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index 1b415708500e..434e59624f69 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -259,7 +259,7 @@ static int rt1308_i2s_hw_params(struct snd_pcm_substream *substream,
 }
 
 /* machine stream operations */
-struct snd_soc_ops sof_sdw_rt1308_i2s_ops = {
+const struct snd_soc_ops sof_sdw_rt1308_i2s_ops = {
 	.hw_params = rt1308_i2s_hw_params,
 };
 
diff --git a/sound/soc/intel/boards/sof_wm8804.c b/sound/soc/intel/boards/sof_wm8804.c
index 4cb0d463bf40..b2d02cc92a6a 100644
--- a/sound/soc/intel/boards/sof_wm8804.c
+++ b/sound/soc/intel/boards/sof_wm8804.c
@@ -148,7 +148,7 @@ static int sof_wm8804_hw_params(struct snd_pcm_substream *substream,
 }
 
 /* machine stream operations */
-static struct snd_soc_ops sof_wm8804_ops = {
+static const struct snd_soc_ops sof_wm8804_ops = {
 	.hw_params = sof_wm8804_hw_params,
 };
 
-- 
2.45.0

