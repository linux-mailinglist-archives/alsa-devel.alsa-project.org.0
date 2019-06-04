Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D7B344B8
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 12:47:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE1BB168B;
	Tue,  4 Jun 2019 12:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE1BB168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559645251;
	bh=6wx+JUlHWic/kYICjpGkc/JTwsMAX7rQNsc8nOxkPHU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=psiZdH0KxcI731sNQ60iHUiI1jayfB8sMEqXBQMbJD/59aAD4c8343gp3r2g0lo1q
	 yzC72YEh1z2m7s8+ll/6RudqM4qTN09bcbLPGFsbJrQw93fskB7jR6hJ1s4NthsS4g
	 wValxTfofeGRwr8kXq0kh4icklkGGm9z9kvel/nM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12E3BF896FE;
	Tue,  4 Jun 2019 12:45:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEDF7F896F7; Tue,  4 Jun 2019 12:45:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43AB2F896CE
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 12:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43AB2F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Lhbk6CaR"
Received: by mail-pl1-x644.google.com with SMTP id g21so8200652plq.0
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tnxaz1jFi+0c70adFdZwh4smT92+AgzJSxKEKHIEhF4=;
 b=Lhbk6CaRYULPnEKNSyq8RYLlZKVu0r/YOy5oOmx4UPBjmsxzCga0HaKw+Z60/X04OK
 GJ6slNfxshzwmy+Sk4gmQlinmXFXyRbTnIRFZ2ctwS8EZW85i4fmCX7gqfNNeKWpJcZd
 eaLMNpFWIOg95t5sHxnxp2cdnsuFv5BLyGijo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Tnxaz1jFi+0c70adFdZwh4smT92+AgzJSxKEKHIEhF4=;
 b=evsfjdAvyQM6I+xRALxwK90I2G1p8JxbZOM2Gcp0wSVDlJPMmrJ51DosTxHOBaKREt
 3B/Q8Cg/uZhd9nFnIfvXyX9qlFSWAVnTFFptM4j612At6Z7cnKMx8HDuQLM+AK0A1ekh
 K8K5NWJ1KLPBg9oQabgZX6IHBGnldV7JbSVPfzwXn1M/kn0Mm4DWTQQ3j6rQulfK3yFH
 z61T3u+EUx5QR+LQfANsF5zqOloV5oEY1XAdGxJWh0/175SIlRX8Jwfr/uxvBVaWj3cG
 2t8jY5MzgTF5lk0J10VY9jI8Jc1RpQiSzSPsBU8MiStFLG4OR3PrKfVmtWVAcHz+diN8
 D3GQ==
X-Gm-Message-State: APjAAAVTJ158ApEB+2BrHuXSvOU9rkkD9y3dRN9eaQ3U3c3NkFaI6laY
 rzLsB0KySjhc+PScz+fwjHJLwQ==
X-Google-Smtp-Source: APXvYqwh/4ffwfhgvj6Uv62eFrI0oVq5vlDa+xCXZjEBrFlgI5XBmHVEkkd3NqjNx2+6PfY2MIM85Q==
X-Received: by 2002:a17:902:1cb:: with SMTP id
 b69mr36438915plb.1.1559645139983; 
 Tue, 04 Jun 2019 03:45:39 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:845f:e35d:e30c:4b47])
 by smtp.gmail.com with ESMTPSA id j20sm14171954pff.183.2019.06.04.03.45.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 03:45:39 -0700 (PDT)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue,  4 Jun 2019 18:45:32 +0800
Message-Id: <20190604104532.110492-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 dgreid@chromium.org, cychiang@chromium.org
Subject: [alsa-devel] [PATCH v3] ASoC: max98090: remove 24-bit format
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

Change-Id: I304882e0b67974f8fe4c2a47c61a41a04635b2df
Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
---
Fix compile error.
codec->dai => dai
runtime => substream->runtime

 sound/soc/codecs/max98090.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 7619ea31ab50..ada8c25e643d 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -1909,6 +1909,21 @@ static int max98090_configure_dmic(struct max98090_priv *max98090,
 	return 0;
 }
 
+static int max98090_dai_startup(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
+	unsigned int fmt = max98090->dai_fmt;
+
+	/* Remove 24-bit format support if it is not in right justified mode. */
+	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_RIGHT_J) {
+		substream->runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
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
