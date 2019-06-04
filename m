Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 546A0342E3
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 11:14:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 897FE16A0;
	Tue,  4 Jun 2019 11:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 897FE16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559639643;
	bh=xr20imOPIVqpv/1e9KYOL/k81g7o7e+prno+hvyh5s4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LwO5ZhvT+SZpJw6oyFca0WOUe+fFgGqjuCAG/XhFlGwXS3BP2Or1o5MYR5YC9qnrV
	 VI8jZNikhhSh1CtLtDc1/1WCtanQqP7tnN/eG/aLzeh4WxJZ3L/zaEOfNccwph5As2
	 /E+j5TzFYCTgk6Ogwawb9aNUpz0eBHlnbJmD1EBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7DC1F896FE;
	Tue,  4 Jun 2019 11:12:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0383F80054; Tue,  4 Jun 2019 11:12:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 101DAF80054
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 11:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 101DAF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="XLsvONrF"
Received: by mail-pl1-x641.google.com with SMTP id d21so8103944plr.3
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 02:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PkvAy0HG/cZzH7p73LTDgLYGpVT1MehWvYFfFdnT2Fc=;
 b=XLsvONrFeGHoW3EfQRkoyPM7lWU3JuUCXY3/sd7tNiIwxHShI/cMEKKFLrma4d6TQ3
 fpgQ+RtwMent0S3STZcQk5dhjKKKDFKirRchZ0nxX+tawmlWqJZMILnadviSRkJMxLth
 gfA6mrJ6r3qG+GBkDg9Yl9yjjJtsvmkyYNNqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PkvAy0HG/cZzH7p73LTDgLYGpVT1MehWvYFfFdnT2Fc=;
 b=BFzICHADDCMGQyz6ta3lwOeLqndaF/ffn4VKiS73GN+cDIEyVJkOmdAd5bDq0gFYP9
 fxjPuxqRkm/wOofB3+CZQ6VDhuhk07/XxUaNsJpwUvbFzWhoTE7f0ynTCCVAIElDCozA
 VFtV8xLAmDCDaxqhYzM6P/Y3EANfM9BnjfRJVzFXR/QNv6yioWk/y3rmsg4b8O+/2yRV
 PNAB5N47GAfMmr+biVgHvWq0Zsna8/yWMnHmC2E3OyKJdF60LTvQevTT82WBNg2ZDN0/
 sXCpg2o0yMfD7vcvNBIZXBSQc3eI152SDzuofqK4rBVHq9OwfRnHNxhFUvcD44ULfVve
 afDA==
X-Gm-Message-State: APjAAAWUlfjB2rzvffDBuXq4s1FtKwJVRBzNqKF3ak0OrEKsEo82zC/Q
 p1abZzfNfu5M+Gz0BjvPUQDipA==
X-Google-Smtp-Source: APXvYqxDyY0ozrmSHzomFvWje7xUaWGpFIWh42pUXi1Mg8hI3/M46iMnwG1Ys2iAiNUMGp3qdug8tg==
X-Received: by 2002:a17:902:9f93:: with SMTP id
 g19mr20221589plq.223.1559639530118; 
 Tue, 04 Jun 2019 02:12:10 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:845f:e35d:e30c:4b47])
 by smtp.gmail.com with ESMTPSA id x21sm773591pfi.91.2019.06.04.02.12.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 02:12:09 -0700 (PDT)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue,  4 Jun 2019 17:11:50 +0800
Message-Id: <20190604091150.154384-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 dgreid@chromium.org, cychiang@chromium.org
Subject: [alsa-devel] [PATCH v2] ASoC: max98090: remove 24-bit format
	support if RJ is 0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The supported formats are S16_LE and S24_LE now. However, by datasheet
of max98090, S24_LE is only supported when it is in the right justified
mode. We should remove 24-bit format if it is not in that mode to avoid
triggering error.

Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
---
 sound/soc/codecs/max98090.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 7619ea31ab50..a6c2cb89767c 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1909,6 +1909,21 @@ static int max98090_configure_dmic(struct max98090_priv *max98090,
 	return 0;
 }
 
+static int max98090_dai_startup(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
+	unsigned int fmt = max98090->dai_fmt;
+
+	/* Remove 24-bit format support if it is not in right justified mode. */
+	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_RIGHT_J) {
+		runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
+		snd_pcm_hw_constraint_msbits(substream->runtime, 0, 16, 16);
+	}
+	return 0;
+}
+
 static int max98090_dai_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params,
 				   struct snd_soc_dai *dai)
@@ -2316,6 +2331,7 @@ EXPORT_SYMBOL_GPL(max98090_mic_detect);
 #define MAX98090_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
 static const struct snd_soc_dai_ops max98090_dai_ops = {
+	.startup = max98090_dai_startup,
 	.set_sysclk = max98090_dai_set_sysclk,
 	.set_fmt = max98090_dai_set_fmt,
 	.set_tdm_slot = max98090_set_tdm_slot,
-- 
2.22.0.rc1.311.g5d7573a151-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
