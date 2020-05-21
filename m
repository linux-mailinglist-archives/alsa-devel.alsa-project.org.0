Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 598301DD314
	for <lists+alsa-devel@lfdr.de>; Thu, 21 May 2020 18:28:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0F341848;
	Thu, 21 May 2020 18:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0F341848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590078497;
	bh=W9tvwbByNFVKl65rQ6y3nSJL3JgygFG5GHg+v2fwRds=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HixOg1ZCiqZK7ikvQ9DZBb+yKhUsY0Yk3k/E0R/r+PKHgnNtoFr9Ydbsw0RZFw/G3
	 11usPNhVa/cgjAJ8V3WR4NdnUXMORuf2G8n5XERAKM9RLfQQwkJGePB43qLP0ZnA/n
	 tBpZN0uyCKHe9jsyJxOt+TWR8dTT+T9kXGmlw19Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8359F801F8;
	Thu, 21 May 2020 18:26:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E7A6F801D8; Thu, 21 May 2020 18:26:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E2FCF800E1
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 18:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E2FCF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="MY6zs4LZ"
Received: by mail-lf1-x142.google.com with SMTP id u16so3030145lfl.8
 for <alsa-devel@alsa-project.org>; Thu, 21 May 2020 09:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U9/periDH8UfNWS+nfaTMqExZdGPDGD6GSusPfDw/70=;
 b=MY6zs4LZhaRCsyF7UgDCRjc2UMi0QWWMNcScPT7hpcVAT2J1th3fZ+O0iVRy7F2+AP
 k+qFPkw4KCzAH9/mCYX2jW4uYdWIMqTJYGh1FaMMt9oBuvqLxpp3lf9N3SSyIw/YRubV
 H3nAo6lEfZZ1IiT/1A36PC7xdYTcR6lSwaAyoDGAO7ymaEBNi03SkmOzKxZmepwfDS1y
 A4D8FbkuZOXTcEo7oTPiwVJ7MaKtrcvbX9jkZkGlXwcqp49g+5PnU3zrLVC7mYX9IQvK
 4pdcEtPN00DJHLUtMmJqoaz3WoEBOxGPnninywoRQz2+e/gjLhoSzkfV0KVaswB8BuIP
 bR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U9/periDH8UfNWS+nfaTMqExZdGPDGD6GSusPfDw/70=;
 b=WyQRbu6JqT6H3QNZ36Nc1YZFzCEDCGwLcpeTpT4EFyC0ATxBg/DG2eVrKFzpLJGCjv
 Sfprz+vnqXYYKdHS51HJM2v8T3u5e2PbTbUCfGypAKNcrx6JqWKXaRgklWN0r1eTEMbf
 36HHt2mlglAawjh4Z31o9PrKpNfXceCUC3Cyp26LPcjhb3ak0PvNSuo+hSYFrlK6tDti
 OXmqA49tzmUxMQWUbsQpHrQY+w0QLxnKx1sZxgeFIJ1EN9dMg6h+ehvpVTbFd5zNx/Rk
 eXzLTSIt/wySVdYl2XnsfWeOw3lgsiSa6y942sdgK+/iqPDKVe042P1GdNgWwwPHWiYq
 lmKg==
X-Gm-Message-State: AOAM530yeRNO9rc9+WwOPAknVUbbaVcs/9NlGUHUIvwohpg5+pzphk7a
 8UEtGlCXXeD0nopv6b2DKgHURg==
X-Google-Smtp-Source: ABdhPJzx1yIyb5qLyd01JzMJ0tM71GTSAtTyKtIPcVKLiSU0oGNOkK++bi81UdUJ4ZmU/DW5tvbMdQ==
X-Received: by 2002:a05:6512:411:: with SMTP id
 u17mr5461789lfk.106.1590078379853; 
 Thu, 21 May 2020 09:26:19 -0700 (PDT)
Received: from localhost.localdomain (89-70-221-122.dynamic.chello.pl.
 [89.70.221.122])
 by smtp.gmail.com with ESMTPSA id g3sm2089212ljk.27.2020.05.21.09.26.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 09:26:19 -0700 (PDT)
From: Lukasz Majczak <lma@semihalf.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>
Subject: [PATCH v3] ASoC: Intel: kbl_rt5663_rt5514_max98927: Split
 be_hw_params_fixup function
Date: Thu, 21 May 2020 18:25:18 +0200
Message-Id: <20200521162518.1809995-1-lma@semihalf.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Radoslaw Biernacki <rad@semihalf.com>,
 Ross Zwisler <zwisler@google.com>, linux-kernel@vger.kernel.org,
 Bob Brandt <brndt@google.com>, Marcin Wojtas <mw@semihalf.com>,
 Alex Levin <levinale@chromium.org>, Lukasz Majczak <lma@semihalf.com>
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

Split be_hw_params_fixup function for different codecs as current common
function, leads to crash while trying to get snd_soc_dpcm with
container_of() macro in kabylake_ssp_fixup().
The crash call path looks as below:
soc_pcm_hw_params()
snd_soc_dai_hw_params(codec_dai, substream, &codec_params);
rtd->dai_link->be_hw_params_fixup(rtd, params)
kabylake_ssp_fixup()
In this case, codec_params is just a copy of an internal structure and is
not embedded into struct snd_soc_dpcm thus we cannot use
container_of() on it.

v1 -> v2:
- Extract dmic from SSP0 as every BE should have own fixup function.
v2 -> v3:
- Restore naming in the dapm route table to not confuse with other
drivers
- Fixed indentations

Signed-off-by: Lukasz Majczak <lma@semihalf.com>
---
 .../intel/boards/kbl_rt5663_rt5514_max98927.c | 130 +++++++++++-------
 1 file changed, 84 insertions(+), 46 deletions(-)

diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index 1b1f8d7a4ea3..b9596cf3a6c4 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -328,42 +328,51 @@ static const struct snd_soc_ops kabylake_rt5663_fe_ops = {
 	.startup = kbl_fe_startup,
 };
 
-static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
-					struct snd_pcm_hw_params *params)
+static void kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
+	struct snd_pcm_hw_params *params, snd_pcm_format_t pcm_fmt)
 {
 	struct snd_interval *rate = hw_param_interval(params,
 			SNDRV_PCM_HW_PARAM_RATE);
-	struct snd_interval *chan = hw_param_interval(params,
+	struct snd_interval *channels = hw_param_interval(params,
 			SNDRV_PCM_HW_PARAM_CHANNELS);
 	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
-	struct snd_soc_dpcm *dpcm = container_of(
-			params, struct snd_soc_dpcm, hw_params);
-	struct snd_soc_dai_link *fe_dai_link = dpcm->fe->dai_link;
-	struct snd_soc_dai_link *be_dai_link = dpcm->be->dai_link;
 
 	/*
 	 * The ADSP will convert the FE rate to 48k, stereo, 24 bit
 	 */
-	if (!strcmp(fe_dai_link->name, "Kbl Audio Port") ||
-	    !strcmp(fe_dai_link->name, "Kbl Audio Headset Playback") ||
-	    !strcmp(fe_dai_link->name, "Kbl Audio Capture Port")) {
-		rate->min = rate->max = 48000;
-		chan->min = chan->max = 2;
-		snd_mask_none(fmt);
-		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
-	} else if (!strcmp(fe_dai_link->name, "Kbl Audio DMIC cap")) {
-		if (params_channels(params) == 2 ||
-				DMIC_CH(dmic_constraints) == 2)
-			chan->min = chan->max = 2;
-		else
-			chan->min = chan->max = 4;
-	}
-	/*
-	 * The speaker on the SSP0 supports S16_LE and not S24_LE.
-	 * thus changing the mask here
-	 */
-	if (!strcmp(be_dai_link->name, "SSP0-Codec"))
-		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
+
+	rate->min = rate->max = 48000;
+	channels->min = channels->max = 2;
+
+	snd_mask_none(fmt);
+	snd_mask_set_format(fmt, pcm_fmt);
+}
+
+static int kabylake_ssp0_fixup(struct snd_soc_pcm_runtime *rtd,
+	struct snd_pcm_hw_params *params)
+{
+	kabylake_ssp_fixup(rtd, params, SNDRV_PCM_FORMAT_S16_LE);
+	return 0;
+}
+
+static int kabylake_ssp1_fixup(struct snd_soc_pcm_runtime *rtd,
+	struct snd_pcm_hw_params *params)
+{
+
+	kabylake_ssp_fixup(rtd, params, SNDRV_PCM_FORMAT_S24_LE);
+	return 0;
+}
+
+static int kabylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
+					struct snd_pcm_hw_params *params)
+{
+	struct snd_interval *channels = hw_param_interval(params,
+			SNDRV_PCM_HW_PARAM_CHANNELS);
+
+	if (params_channels(params) == 2 || DMIC_CH(dmic_constraints) == 2)
+		channels->min = channels->max = 2;
+	else
+		channels->min = channels->max = 4;
 
 	return 0;
 }
@@ -400,20 +409,6 @@ static int kabylake_ssp0_hw_params(struct snd_pcm_substream *substream,
 	int ret = 0, j;
 
 	for_each_rtd_codec_dais(rtd, j, codec_dai) {
-		if (!strcmp(codec_dai->component->name, RT5514_DEV_NAME)) {
-			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0xF, 0, 8, 16);
-			if (ret < 0) {
-				dev_err(rtd->dev, "set TDM slot err:%d\n", ret);
-				return ret;
-			}
-
-			ret = snd_soc_dai_set_sysclk(codec_dai,
-				RT5514_SCLK_S_MCLK, 24576000, SND_SOC_CLOCK_IN);
-			if (ret < 0) {
-				dev_err(rtd->dev, "set sysclk err: %d\n", ret);
-				return ret;
-			}
-		}
 		if (!strcmp(codec_dai->component->name, MAXIM_DEV0_NAME)) {
 			ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x30, 3, 8, 16);
 			if (ret < 0) {
@@ -433,10 +428,36 @@ static int kabylake_ssp0_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static int kabylake_dmic01_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	int ret = 0;
+
+	ret = snd_soc_dai_set_tdm_slot(rtd->codec_dai, 0xF, 0, 8, 16);
+	if (ret < 0) {
+		dev_err(rtd->dev, "set TDM slot err:%d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_sysclk(rtd->codec_dai,
+		RT5514_SCLK_S_MCLK, 24576000, SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(rtd->dev, "set sysclk err: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
 static struct snd_soc_ops kabylake_ssp0_ops = {
 	.hw_params = kabylake_ssp0_hw_params,
 };
 
+static struct snd_soc_ops kabylake_dmic01_ops = {
+	.hw_params = kabylake_dmic01_hw_params,
+};
+
 static const unsigned int channels_dmic[] = {
 	4,
 };
@@ -507,14 +528,19 @@ SND_SOC_DAILINK_DEF(ssp0_pin,
 SND_SOC_DAILINK_DEF(ssp0_codec,
 	DAILINK_COMP_ARRAY(
 	/* Left */ COMP_CODEC(MAXIM_DEV0_NAME, KBL_MAXIM_CODEC_DAI),
-	/* Right */COMP_CODEC(MAXIM_DEV1_NAME, KBL_MAXIM_CODEC_DAI),
-	/* dmic */ COMP_CODEC(RT5514_DEV_NAME, KBL_REALTEK_DMIC_CODEC_DAI)));
+	/* Right */COMP_CODEC(MAXIM_DEV1_NAME, KBL_MAXIM_CODEC_DAI)));
 
 SND_SOC_DAILINK_DEF(ssp1_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
 SND_SOC_DAILINK_DEF(ssp1_codec,
 	DAILINK_COMP_ARRAY(COMP_CODEC(RT5663_DEV_NAME, KBL_REALTEK_CODEC_DAI)));
 
+SND_SOC_DAILINK_DEF(dmic01_pin,
+	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
+SND_SOC_DAILINK_DEF(dmic01_codec,
+	DAILINK_COMP_ARRAY(
+		COMP_CODEC(RT5514_DEV_NAME, KBL_REALTEK_DMIC_CODEC_DAI)));
+
 SND_SOC_DAILINK_DEF(idisp1_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("iDisp1 Pin")));
 SND_SOC_DAILINK_DEF(idisp1_codec,
@@ -618,9 +644,8 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 			SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
 		.ignore_pmdown_time = 1,
-		.be_hw_params_fixup = kabylake_ssp_fixup,
+		.be_hw_params_fixup = kabylake_ssp0_fixup,
 		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.ops = &kabylake_ssp0_ops,
 		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
 	},
@@ -632,12 +657,25 @@ static struct snd_soc_dai_link kabylake_dais[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
 		.ignore_pmdown_time = 1,
-		.be_hw_params_fixup = kabylake_ssp_fixup,
+		.be_hw_params_fixup = kabylake_ssp1_fixup,
 		.ops = &kabylake_rt5663_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
+	{
+		.name = "dmic01",
+		.id = 2,
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_DSP_B |
+			SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS,
+		.ignore_pmdown_time = 1,
+		.be_hw_params_fixup = kabylake_dmic_fixup,
+		.dpcm_capture = 1,
+		.ops = &kabylake_dmic01_ops,
+		SND_SOC_DAILINK_REG(dmic01_pin, dmic01_codec, platform),
+	},
 	{
 		.name = "iDisp1",
 		.id = 3,

base-commit: a4f6fc98cd2fa1774bcaeb248c67156ef9402a56
-- 
2.25.1

