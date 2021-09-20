Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B88C410FB2
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 08:56:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3087F1685;
	Mon, 20 Sep 2021 08:55:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3087F1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632121003;
	bh=8o84tJdg0eyrnddKxz+BXpKzlZhAc9kIzqUblrQRvE4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BY22IQrl2UpbG7QCspJOVUZSpDUySpr2eTjQ0ASyUSM8p4sjwif/+SBW7RszH6zWH
	 9r7HSEYbTOcXZJifQqWkvsVF6hKtmE3L9Zmae0aGWnKAFsWnDHbs9oY5wkZqsyA2FT
	 k87i9tGJDE5nq9wjbS+7xmKFHnr2le6AH00yV1xE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99AEEF80124;
	Mon, 20 Sep 2021 08:55:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8468F80152; Mon, 20 Sep 2021 08:55:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF58FF80152
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 08:55:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF58FF80152
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="202571374"
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; d="scan'208";a="202571374"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2021 23:55:10 -0700
X-IronPort-AV: E=Sophos;i="5.85,307,1624345200"; d="scan'208";a="473698712"
Received: from tataruax-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.35.119])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2021 23:55:07 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: liam.r.girdwood@linux.intel.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 yang.jie@linux.intel.com
Subject: [PATCH] ASoC: Intel: boards: Update to modern clocking terminology
Date: Mon, 20 Sep 2021 09:55:08 +0300
Message-Id: <20210920065508.7854-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, tiwai@suse.com,
 ranjani.sridharan@linux.intel.com, hdegoede@redhat.com
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

As part of the effort to remove our old APIs based on outdated terminology
update the Intel board drivers to use modern terminology.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/bdw-rt5650.c                 | 2 +-
 sound/soc/intel/boards/bdw-rt5677.c                 | 2 +-
 sound/soc/intel/boards/broadwell.c                  | 2 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c       | 4 ++--
 sound/soc/intel/boards/bxt_rt298.c                  | 2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c             | 4 ++--
 sound/soc/intel/boards/bytcht_da7213.c              | 4 ++--
 sound/soc/intel/boards/bytcht_es8316.c              | 4 ++--
 sound/soc/intel/boards/bytcht_nocodec.c             | 4 ++--
 sound/soc/intel/boards/bytcr_rt5640.c               | 4 ++--
 sound/soc/intel/boards/bytcr_rt5651.c               | 4 ++--
 sound/soc/intel/boards/bytcr_wm5102.c               | 4 ++--
 sound/soc/intel/boards/cht_bsw_max98090_ti.c        | 4 ++--
 sound/soc/intel/boards/cht_bsw_nau8824.c            | 2 +-
 sound/soc/intel/boards/cht_bsw_rt5645.c             | 6 +++---
 sound/soc/intel/boards/cht_bsw_rt5672.c             | 2 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c       | 4 ++--
 sound/soc/intel/boards/haswell.c                    | 2 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c       | 4 ++--
 sound/soc/intel/boards/kbl_da7219_max98927.c        | 6 +++---
 sound/soc/intel/boards/kbl_rt5660.c                 | 2 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c        | 6 +++---
 sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c | 4 ++--
 sound/soc/intel/boards/skl_nau88l25_max98357a.c     | 4 ++--
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c       | 4 ++--
 sound/soc/intel/boards/skl_rt286.c                  | 2 +-
 26 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5650.c b/sound/soc/intel/boards/bdw-rt5650.c
index c5122d3b0e6c..6cba5552f7a2 100644
--- a/sound/soc/intel/boards/bdw-rt5650.c
+++ b/sound/soc/intel/boards/bdw-rt5650.c
@@ -251,7 +251,7 @@ static struct snd_soc_dai_link bdw_rt5650_dais[] = {
 		.id = 0,
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broadwell_ssp0_fixup,
 		.ops = &bdw_rt5650_ops,
diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index e01b7a90ca6c..119c441f4c10 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -351,7 +351,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		.id = 0,
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broadwell_ssp0_fixup,
 		.ops = &bdw_rt5677_ops,
diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/broadwell.c
index 3c3aff9c61cc..618d0645ed8d 100644
--- a/sound/soc/intel/boards/broadwell.c
+++ b/sound/soc/intel/boards/broadwell.c
@@ -217,7 +217,7 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] = {
 		.no_pcm = 1,
 		.init = broadwell_rt286_codec_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broadwell_ssp0_fixup,
 		.ops = &broadwell_rt286_ops,
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index e67ddfb8e469..b768d9b8ec02 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -572,7 +572,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broxton_ssp_fixup,
 		.dpcm_playback = 1,
@@ -585,7 +585,7 @@ static struct snd_soc_dai_link broxton_dais[] = {
 		.no_pcm = 1,
 		.init = broxton_da7219_codec_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broxton_ssp_fixup,
 		.dpcm_playback = 1,
diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index 47f6b1523ae6..920e575b4314 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -468,7 +468,7 @@ static struct snd_soc_dai_link broxton_rt298_dais[] = {
 		.no_pcm = 1,
 		.init = broxton_rt298_codec_init,
 		.dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF |
-						SND_SOC_DAIFMT_CBS_CFS,
+						SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broxton_ssp5_fixup,
 		.ops = &broxton_rt298_ops,
diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index a9e51bbf018c..0a736308052a 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -126,7 +126,7 @@ static int byt_cht_cx2072x_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				SND_SOC_DAIFMT_I2S     |
 				SND_SOC_DAIFMT_NB_NF   |
-				SND_SOC_DAIFMT_CBS_CFS);
+				SND_SOC_DAIFMT_CBC_CFC);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
 		return ret;
@@ -195,7 +195,7 @@ static struct snd_soc_dai_link byt_cht_cx2072x_dais[] = {
 		.id = 0,
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-					      | SND_SOC_DAIFMT_CBS_CFS,
+					      | SND_SOC_DAIFMT_CBC_CFC,
 		.init = byt_cht_cx2072x_init,
 		.be_hw_params_fixup = byt_cht_cx2072x_fixup,
 		.dpcm_playback = 1,
diff --git a/sound/soc/intel/boards/bytcht_da7213.c b/sound/soc/intel/boards/bytcht_da7213.c
index a28773fb7892..fae1e7e785b0 100644
--- a/sound/soc/intel/boards/bytcht_da7213.c
+++ b/sound/soc/intel/boards/bytcht_da7213.c
@@ -81,7 +81,7 @@ static int codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
-				  SND_SOC_DAIFMT_CBS_CFS);
+				  SND_SOC_DAIFMT_CBC_CFC);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
 		return ret;
@@ -195,7 +195,7 @@ static struct snd_soc_dai_link dailink[] = {
 		.id = 0,
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-						| SND_SOC_DAIFMT_CBS_CFS,
+						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = codec_fixup,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 055248f104b2..1bb9b8e7bcc7 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -265,7 +265,7 @@ static int byt_cht_es8316_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				SND_SOC_DAIFMT_I2S     |
 				SND_SOC_DAIFMT_NB_NF   |
-				SND_SOC_DAIFMT_CBS_CFS
+				SND_SOC_DAIFMT_CBC_CFC
 		);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
@@ -336,7 +336,7 @@ static struct snd_soc_dai_link byt_cht_es8316_dais[] = {
 		.id = 0,
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-						| SND_SOC_DAIFMT_CBS_CFS,
+						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_cht_es8316_codec_fixup,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
diff --git a/sound/soc/intel/boards/bytcht_nocodec.c b/sound/soc/intel/boards/bytcht_nocodec.c
index 9b48fe701a2c..67b3c4e97864 100644
--- a/sound/soc/intel/boards/bytcht_nocodec.c
+++ b/sound/soc/intel/boards/bytcht_nocodec.c
@@ -61,7 +61,7 @@ static int codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
-				  SND_SOC_DAIFMT_CBS_CFS);
+				  SND_SOC_DAIFMT_CBC_CFC);
 
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
@@ -141,7 +141,7 @@ static struct snd_soc_dai_link dais[] = {
 		.id = 0,
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-						| SND_SOC_DAIFMT_CBS_CFS,
+						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = codec_fixup,
 		.ignore_suspend = 1,
 		.dpcm_playback = 1,
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index a6e837290c7d..c28abe74816f 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1336,7 +1336,7 @@ static int byt_rt5640_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
-				  SND_SOC_DAIFMT_CBS_CFS);
+				  SND_SOC_DAIFMT_CBC_CFC);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
 		return ret;
@@ -1411,7 +1411,7 @@ static struct snd_soc_dai_link byt_rt5640_dais[] = {
 		.id = 0,
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-						| SND_SOC_DAIFMT_CBS_CFS,
+						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_rt5640_codec_fixup,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index e94c9124d4f4..00c347b52863 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -713,7 +713,7 @@ static int byt_rt5651_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
-				  SND_SOC_DAIFMT_CBS_CFS
+				  SND_SOC_DAIFMT_CBC_CFC
 				  );
 
 	if (ret < 0) {
@@ -798,7 +798,7 @@ static struct snd_soc_dai_link byt_rt5651_dais[] = {
 		.id = 0,
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-						| SND_SOC_DAIFMT_CBS_CFS,
+						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_rt5651_codec_fixup,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index 580d5fddae5a..504ef4cab111 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -265,7 +265,7 @@ static int byt_wm5102_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
-				  SND_SOC_DAIFMT_CBS_CFS);
+				  SND_SOC_DAIFMT_CBC_CFC);
 	if (ret) {
 		dev_err(rtd->dev, "Error setting format to I2S: %d\n", ret);
 		return ret;
@@ -349,7 +349,7 @@ static struct snd_soc_dai_link byt_wm5102_dais[] = {
 		.id = 0,
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-						| SND_SOC_DAIFMT_CBS_CFS,
+						| SND_SOC_DAIFMT_CBC_CFC,
 		.be_hw_params_fixup = byt_wm5102_codec_fixup,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index 131882378a59..1bc21434c9de 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -264,7 +264,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-				| SND_SOC_DAIFMT_CBS_CFS;
+				| SND_SOC_DAIFMT_CBC_CFC;
 
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0), fmt);
 	if (ret < 0) {
@@ -372,7 +372,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.id = 0,
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
-					| SND_SOC_DAIFMT_CBS_CFS,
+					| SND_SOC_DAIFMT_CBC_CFC,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
 		.dpcm_playback = 1,
diff --git a/sound/soc/intel/boards/cht_bsw_nau8824.c b/sound/soc/intel/boards/cht_bsw_nau8824.c
index da5a5cbc8759..da534a0b2133 100644
--- a/sound/soc/intel/boards/cht_bsw_nau8824.c
+++ b/sound/soc/intel/boards/cht_bsw_nau8824.c
@@ -214,7 +214,7 @@ static struct snd_soc_dai_link cht_dailink[] = {
 		.id = 0,
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B | SND_SOC_DAIFMT_IB_NF
-			| SND_SOC_DAIFMT_CBS_CFS,
+			| SND_SOC_DAIFMT_CBC_CFC,
 		.init = cht_codec_init,
 		.be_hw_params_fixup = cht_codec_fixup,
 		.dpcm_playback = 1,
diff --git a/sound/soc/intel/boards/cht_bsw_rt5645.c b/sound/soc/intel/boards/cht_bsw_rt5645.c
index 804dbc7911d5..e182012d0c60 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5645.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5645.c
@@ -362,7 +362,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 					SND_SOC_DAIFMT_I2S     |
 					SND_SOC_DAIFMT_NB_NF   |
-					SND_SOC_DAIFMT_CBS_CFS
+					SND_SOC_DAIFMT_CBC_CFC
 			);
 		if (ret < 0) {
 			dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
@@ -372,7 +372,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0),
 					SND_SOC_DAIFMT_I2S     |
 					SND_SOC_DAIFMT_NB_NF   |
-					SND_SOC_DAIFMT_CBS_CFS
+					SND_SOC_DAIFMT_CBC_CFC
 			);
 		if (ret < 0) {
 			dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
@@ -396,7 +396,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 		ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0),
 					SND_SOC_DAIFMT_DSP_B |
 					SND_SOC_DAIFMT_IB_NF |
-					SND_SOC_DAIFMT_CBS_CFS);
+					SND_SOC_DAIFMT_CBC_CFC);
 		if (ret < 0) {
 			dev_err(rtd->dev, "can't set format to TDM %d\n", ret);
 			return ret;
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 9509b6e161b8..26eb8ad0d262 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -300,7 +300,7 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
 	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
 				  SND_SOC_DAIFMT_I2S     |
 				  SND_SOC_DAIFMT_NB_NF   |
-				  SND_SOC_DAIFMT_CBS_CFS);
+				  SND_SOC_DAIFMT_CBC_CFC);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
 		return ret;
diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
index 71fe26a1b701..9d75beec09d1 100644
--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
@@ -473,7 +473,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = geminilake_ssp_fixup,
 		.dpcm_playback = 1,
@@ -486,7 +486,7 @@ static struct snd_soc_dai_link geminilake_dais[] = {
 		.no_pcm = 1,
 		.init = geminilake_rt5682_codec_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = geminilake_ssp_fixup,
 		.ops = &geminilake_rt5682_ops,
diff --git a/sound/soc/intel/boards/haswell.c b/sound/soc/intel/boards/haswell.c
index c763bfeb1f38..36e136acbef5 100644
--- a/sound/soc/intel/boards/haswell.c
+++ b/sound/soc/intel/boards/haswell.c
@@ -145,7 +145,7 @@ static struct snd_soc_dai_link haswell_rt5640_dais[] = {
 		.id = 0,
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = haswell_ssp0_fixup,
 		.ops = &haswell_rt5640_ops,
diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index 14b625e947f5..a4bdf634e9b9 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -518,7 +518,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.dpcm_playback = 1,
@@ -531,7 +531,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.no_pcm = 1,
 		.init = kabylake_da7219_codec_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.dpcm_playback = 1,
diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index 2b43459adc33..620a9fbcb08f 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -764,7 +764,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B |
 			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ignore_pmdown_time = 1,
@@ -779,7 +779,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.no_pcm = 1,
 		.init = kabylake_da7219_codec_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.dpcm_playback = 1,
@@ -907,7 +907,7 @@ static struct snd_soc_dai_link kabylake_max98_927_373_dais[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B |
 			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		.ignore_pmdown_time = 1,
diff --git a/sound/soc/intel/boards/kbl_rt5660.c b/sound/soc/intel/boards/kbl_rt5660.c
index 289ca39b8206..1cb56ec363e8 100644
--- a/sound/soc/intel/boards/kbl_rt5660.c
+++ b/sound/soc/intel/boards/kbl_rt5660.c
@@ -436,7 +436,7 @@ static struct snd_soc_dai_link kabylake_rt5660_dais[] = {
 		.exit = kabylake_rt5660_codec_exit,
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 		SND_SOC_DAIFMT_NB_NF |
-		SND_SOC_DAIFMT_CBS_CFS,
+		SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp0_fixup,
 		.ops = &kabylake_rt5660_ops,
diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
index a3e040a249f6..f24e0ce5d49f 100644
--- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
@@ -767,7 +767,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B |
 			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.dpcm_playback = 1,
@@ -781,7 +781,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.no_pcm = 1,
 		.init = kabylake_rt5663_max98927_codec_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.ops = &kabylake_rt5663_ops,
@@ -879,7 +879,7 @@ static struct snd_soc_dai_link kabylake_5663_dais[] = {
 		.no_pcm = 1,
 		.init = kabylake_rt5663_codec_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.ops = &kabylake_rt5663_ops,
diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index dd38fdaf2ff5..6874e981c8df 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -639,7 +639,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_DSP_B |
 			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.dpcm_playback = 1,
@@ -653,7 +653,7 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.no_pcm = 1,
 		.init = kabylake_rt5663_codec_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = kabylake_ssp_fixup,
 		.ops = &kabylake_rt5663_ops,
diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
index e3a1f04a8b53..7297eb05613c 100644
--- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
+++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
@@ -539,7 +539,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp_fixup,
 		.dpcm_playback = 1,
@@ -552,7 +552,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.no_pcm = 1,
 		.init = skylake_nau8825_codec_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp_fixup,
 		.ops = &skylake_nau8825_ops,
diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
index adf5992a9ec5..68efde1633b3 100644
--- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
+++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
@@ -578,7 +578,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.no_pcm = 1,
 		.dai_fmt = SND_SOC_DAIFMT_DSP_A |
 			SND_SOC_DAIFMT_IB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.init = skylake_ssm4567_codec_init,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp_fixup,
@@ -593,7 +593,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
 		.no_pcm = 1,
 		.init = skylake_nau8825_codec_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp_fixup,
 		.ops = &skylake_nau8825_ops,
diff --git a/sound/soc/intel/boards/skl_rt286.c b/sound/soc/intel/boards/skl_rt286.c
index 75dab5405380..eca4a78668af 100644
--- a/sound/soc/intel/boards/skl_rt286.c
+++ b/sound/soc/intel/boards/skl_rt286.c
@@ -434,7 +434,7 @@ static struct snd_soc_dai_link skylake_rt286_dais[] = {
 		.init = skylake_rt286_codec_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S |
 			SND_SOC_DAIFMT_NB_NF |
-			SND_SOC_DAIFMT_CBS_CFS,
+			SND_SOC_DAIFMT_CBC_CFC,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = skylake_ssp0_fixup,
 		.ops = &skylake_rt286_ops,
-- 
2.33.0

