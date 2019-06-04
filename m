Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E57DE342B2
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 11:08:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E96616A3;
	Tue,  4 Jun 2019 11:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E96616A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559639316;
	bh=vn1BVDvVu2HW+t1eDs0+nIro+Xojvd0aXtLL5sLRe1s=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z5eFHvUH01hkoXbhVNBTGVVCmSxxxzWQ5jk6xFLe3HXMKUGvFraUxH8bzqyNsJal3
	 BN+q9tVLYD744bhxEb6jL2YWz1GPBr9f67uKrOpry/T2awPr0Ukfc0k1Ae0a9sbsgl
	 aprnYlpRbirD7Cmv3bgiu5tDbf7Z72JDTgUw0UaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B464BF896FE;
	Tue,  4 Jun 2019 11:06:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B5F9F896F7; Tue,  4 Jun 2019 11:06:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FB9BF89673
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 11:06:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FB9BF89673
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="cGz20g9t"
Received: by mail-pg1-x544.google.com with SMTP id 83so3153698pgg.8
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 02:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xfFtTOSVe4GXuDzP0da8mgJsCVGqfo1O1ofIicvNlPw=;
 b=cGz20g9tu97nNM3OpJWcrJM++3f2oaf5mAfdN4TQLbuqDjwgzW9jcVJXuvnTmSlyn+
 xnh073pF5HgUHFAcBzdnb9SMgXe/JTvrtkzkj5SwJq2K0oMZ0MTXEIOuxlyu9DedN7VP
 hdizIYIU8uxumJWUNtGF3HWEBVSLTDB9E4N9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xfFtTOSVe4GXuDzP0da8mgJsCVGqfo1O1ofIicvNlPw=;
 b=jLwwCXIDGwQ98lScAlfbG2qIEpRir37kxeIDuWVHkNwTAn6+JuV43tUXkGtqfr/E7L
 n446DTiMBdddUoWkTFynMzbO2uo3hd2+b3y9KmF00aalSlc2aHBrFf9Q3hYXuS9aidhS
 Goyd70og1+L0aygSBI7pGZ8NDL19H5N8Zj0fDOp7s50qfYf+EuSPuAJdmRurH5GCt8xO
 okL2W4u5y++GtuQ7iPlpsBTm8K1twWX0yMQv2xbUWYyNty61UC2e0dzIgsoAYb1Eu49R
 Kezznh6fsjCnW/AeX8hw+FvpCd42PZowCIBCFoa0wYMJtiS6mITPVB6oDA5OgsUGNsRj
 8cdg==
X-Gm-Message-State: APjAAAX04GccbCuuj8LXmB8nLk0yaMgmjtFoQw6cTGbIi5BWFzjg/TlK
 VNP2AAy4gsv39OEzoDBmEhBYRw==
X-Google-Smtp-Source: APXvYqw0MrZPhbHOIZ5oCl8sVuLhD95RjKVOtq7qegsufs09L3nAESMfj4hjD6C55317hrMQIYi4bw==
X-Received: by 2002:a63:6b08:: with SMTP id g8mr35261104pgc.106.1559639203881; 
 Tue, 04 Jun 2019 02:06:43 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:845f:e35d:e30c:4b47])
 by smtp.gmail.com with ESMTPSA id s4sm4238038pgg.55.2019.06.04.02.06.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 02:06:43 -0700 (PDT)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue,  4 Jun 2019 17:06:30 +0800
Message-Id: <20190604090630.151610-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 dgreid@chromium.org, cychiang@chromium.org
Subject: [alsa-devel] [PATCH] ASoC: max98090: remove 24-bit format support
	if RJ is 0
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
index 7619ea31ab50..4cbfb0b95404 100644
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
+	/* Remove 24-bit format support if RJ is 1. */
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
