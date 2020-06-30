Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CF420F167
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 11:18:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9A671614;
	Tue, 30 Jun 2020 11:17:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9A671614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593508696;
	bh=bWTX15zX8AU7H1RsP7Y+2Mcd6BEu4yxcLZBZZOcE2FA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BAPjHtp1T9Zfo+j4OFQxQj8yEGekpyUkocgrUh64TXxmlnc7w3Tu9SXMv2nRHH0/3
	 S3wkJmRzhY42Z0Fm4Av9rkfvJRJRphdXYttQhRmu3mKmjDGTXu/Ecd4I9NN5PVCqXT
	 8XFCpC96Qj0vmWKVIg/nS3HUOgBTZXFRkH6T7ves=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C70BEF8013E;
	Tue, 30 Jun 2020 11:16:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C24ADF80135; Tue, 30 Jun 2020 11:16:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AAFCF80135
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 11:16:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AAFCF80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="TGpitUnX"
Received: by mail-pf1-x444.google.com with SMTP id b184so2749901pfa.6
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 02:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rd5iEUzyhkHEGXF29pak/hhB1EC5ycMxxyjQQksAAqY=;
 b=TGpitUnXwHKi/7l9y2kirXGLuOu95q2WsJQIWx2gn6HmUOzZRHlv/rlVSHSscwZ8kO
 AWvctomRCfaXqs2PK7ouUWeHgZg28RgwQSbDk3UoZKVdLm1cSAxnWuNvj0FeTwoFOl2D
 kHAgkHFtTyvVaIkNA3gVCvEE0SQWezS2ndkoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rd5iEUzyhkHEGXF29pak/hhB1EC5ycMxxyjQQksAAqY=;
 b=eSNBr4U9Kw9a6Q4w+1K9Ax5kDgwTw7mX5Svf+NARHRkQ9ImHgnqqOecB9Jq0Spa1wJ
 Ixyh5XwgsPudwnJSLZACu+dAglkS5+UNd7jLcDcwVw0rudA/iMip9It6cqB/irXag83a
 1clFNrKG9GIOW+7Pl93zXg+EzpIX/56tsT13Mc2ZQCdG8IVHPXk41ornU9xTjR9ZIDgB
 GoX707qtWumhgZCA5nqW8wv7xkAwNnvxnxRVsrLB+CmPgW5I2lWQf9ydOtF4OE5kP2GO
 i0SyUdJehtmA6E09Xq8FrXOBfyesGOaMEHJ1GRjN/GKGZ223aSMboRVoxyhZ9X1aXK1V
 +EzA==
X-Gm-Message-State: AOAM533cd2T6xGSwpxSy3tDY08lu2oTucYkSxUkDcSG9rSJOSY7EJKsz
 2OWPRLdbT2ZpeghF/2fWBml/cA==
X-Google-Smtp-Source: ABdhPJzB0kxAs3Rg/ffbxdy/cFXz9S5fvLhyfDQ8RVSkxRv0SuSfKCfoSQnEObJ51pxzQORK5k+Sjg==
X-Received: by 2002:a63:5863:: with SMTP id i35mr11672772pgm.390.1593508583749; 
 Tue, 30 Jun 2020 02:16:23 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:845f:e35d:e30c:4b47])
 by smtp.gmail.com with ESMTPSA id q13sm2142575pfk.8.2020.06.30.02.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2020 02:16:22 -0700 (PDT)
From: Yu-Hsuan Hsu <yuhsuan@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rockchip: add format and rate constraints on rk3399
Date: Tue, 30 Jun 2020 17:16:15 +0800
Message-Id: <20200630091615.4020059-1-yuhsuan@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Yu-Hsuan Hsu <yuhsuan@chromium.org>,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
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

S8 and S24 formats does not work on this machine driver so force to use
S16_LE instead.

In addition, add constraint to limit the max value of rate because the
rate higher than 96000(172000, 192000) is not stable either.

Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
---
 sound/soc/rockchip/rk3399_gru_sound.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index f45e5aaa4b302..9539b0d024fed 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -219,19 +219,32 @@ static int rockchip_sound_dmic_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int rockchip_sound_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
+	return snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE,
+			8000, 96000);
+}
+
 static const struct snd_soc_ops rockchip_sound_max98357a_ops = {
+	.startup = rockchip_sound_startup,
 	.hw_params = rockchip_sound_max98357a_hw_params,
 };
 
 static const struct snd_soc_ops rockchip_sound_rt5514_ops = {
+	.startup = rockchip_sound_startup,
 	.hw_params = rockchip_sound_rt5514_hw_params,
 };
 
 static const struct snd_soc_ops rockchip_sound_da7219_ops = {
+	.startup = rockchip_sound_startup,
 	.hw_params = rockchip_sound_da7219_hw_params,
 };
 
 static const struct snd_soc_ops rockchip_sound_dmic_ops = {
+	.startup = rockchip_sound_startup,
 	.hw_params = rockchip_sound_dmic_hw_params,
 };
 
-- 
2.27.0.212.ge8ba1cc988-goog

