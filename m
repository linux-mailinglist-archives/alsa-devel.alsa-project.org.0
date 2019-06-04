Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA82E344C2
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 12:51:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41B26168A;
	Tue,  4 Jun 2019 12:50:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41B26168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559645469;
	bh=KvjZAJ1zCl8o1od4vDi0NRTMFcUHEllwR0Eap++F0tI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dCHtSSlhnFwC8tfPhhMe/1Nzf6JVOJLQcsbeViGywANvLHqCz3bmtJ0JTpba3M1+r
	 dpA0mDZDGUXP05R+Z2/IQzlFRTmxwhBNuV97pGLZR6iHWqM1TvFjOHkvYxKnLSTx1y
	 HYfnoXwlu9SWBCXKvaq5jwFuFNnBiLykKA/xNyd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 695ABF896CE;
	Tue,  4 Jun 2019 12:49:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55BB2F896F7; Tue,  4 Jun 2019 12:49:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A844CF896CE
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 12:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A844CF896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="YWO/syDC"
Received: by mail-pg1-x541.google.com with SMTP id d30so10126308pgm.7
 for <alsa-devel@alsa-project.org>; Tue, 04 Jun 2019 03:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zVdAVLyjiflcU0ps0EKzymMcq4A5v7TsqYFbDMRESZU=;
 b=YWO/syDCkgZiRB+HC/V3lus5PVTug7lCbKFAX4Z4ac7q/PlTWnPFWLnKO1Zq5hHwVd
 QMrbp2kcz/5p/yPgH8KTrXmOTx2d7EA8IrfmuvO/lofYIFeoC525wAQymtKAV8qbvZzj
 cZmcSkFMvHWkuqVod+gxST5bRwZtEE4jsEdZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zVdAVLyjiflcU0ps0EKzymMcq4A5v7TsqYFbDMRESZU=;
 b=kdtBqHd6yeB6tZfpFPlpyjei47FEYQIf8Y1Jnc4C0GBp+pz3lY6ucaCeEQg4ZybMhC
 sMZl9nktnJrPx1AeK2utAJFTqmiZShuUe5LiDtXwYgSdVq1XbpVoRKuDsh4eeoth3IZn
 TRkz1QogA5jiptyTs0gEzEK+CF9JNPAKAI+fIrJYnOhQmzKg0eSAQeE1OXz/o/Bv1N6w
 owpt6Ro5axNpwL0RwR9m1iYpDZGBaXaO5XkJaXdBYLaFWw92DanI/xNA4/qY4FKwwsWd
 NDN2C07t9ScaINEewSZUkhQDFve8GuQWoLtqGBsX3GjGlRQaAieT7ZsGKHNI13t4t/Wa
 bA8Q==
X-Gm-Message-State: APjAAAXsdug1vMl6HyJ2nbi+mYFx/O2GkP4z0XTH+pwmXgu4V1D2K5y/
 BQKADjODJVaDbAFlHjIBwg94+A==
X-Google-Smtp-Source: APXvYqxFO4T5pnpnaDfl7jzar3sBTOU0RrWCHrOo6PGDUf8ezMo2rLIzPHqwb90ABDu6r2PwyZY9qg==
X-Received: by 2002:a62:a508:: with SMTP id v8mr36469341pfm.87.1559645357166; 
 Tue, 04 Jun 2019 03:49:17 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:845f:e35d:e30c:4b47])
 by smtp.gmail.com with ESMTPSA id s5sm16418564pgj.60.2019.06.04.03.49.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Jun 2019 03:49:16 -0700 (PDT)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Tue,  4 Jun 2019 18:49:09 +0800
Message-Id: <20190604104909.112984-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 Jon Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 dgreid@chromium.org, cychiang@chromium.org
Subject: [alsa-devel] [PATCH v4] ASoC: max98090: remove 24-bit format
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
 Remove Change-Id.

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
