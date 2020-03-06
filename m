Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FA417BD7F
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Mar 2020 14:03:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DD4215E5;
	Fri,  6 Mar 2020 14:03:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DD4215E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583499833;
	bh=8K5ZcukzeZNwTnekrmDzD1sny+S7qGyqpQLkIgaDlVI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dc25SHEvY+S4yUwoMQZv/iYBN56iZB+Tm+GE2UkzeXmzVGGRUYHiF8G6YstiSWFOE
	 KCcd3PmMl6uPzhledbnSVD1HGbUGOD2jai5lko+WJHqFavSbwRCD7qt88OdESJ1XDE
	 Df2+foTXaCgFcYgVS5es0PDKzuevTJ7DcsCqrIYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81525F801F5;
	Fri,  6 Mar 2020 14:02:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C00AF801ED; Fri,  6 Mar 2020 14:02:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8FB0F8012D
 for <alsa-devel@alsa-project.org>; Fri,  6 Mar 2020 14:02:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8FB0F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vHwDKD8W"
Received: by mail-wm1-x342.google.com with SMTP id a132so2325403wme.1
 for <alsa-devel@alsa-project.org>; Fri, 06 Mar 2020 05:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pUTUKe1ETsrKt03/K8XFrOHiuViiNejQfkx377kvHWs=;
 b=vHwDKD8WnVD4XGaGQWK1nRjEz3HT5MOG0IwqkPkUYSKJ3zNOik7vRThpI8QHYziLGM
 Y+vvyU5kcAjcJa5kMOyPCOTyH0ILFVZNJrb1w7Gbm7Ezvj9C+8X3PW/9Pn9shjowUfBU
 upHnpztrOipG2J3TgYnIfhi+9izI3Ss1XD+RskCSPuCIsLXV02X7ENKkmyJIBQfsj2MM
 QIS8I2i1HteFYou44w6VUzs6Hv9VGFz0lwoFJJPx6uPSoSI8Hk5416hkSHhuAQ0pvTHo
 ouAX++E6x74XgASA1tBqutLnxD9Tba3j2VDqQNF7sTtwePututbASVPiVkKzERIvU6L1
 Qbqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pUTUKe1ETsrKt03/K8XFrOHiuViiNejQfkx377kvHWs=;
 b=Fjy8SikwIQXgvq71FOT/RwBUS8RmfIk0hgyLvtbgnqz8p+M147VDyuKC6nTOHDeu3j
 qNjbW4OIYcrY7NxqAGRiZBk70Gj8fc08dEUKxImm040R/qvLE6q4lRMhW7/8/3syRgWF
 2PY4E/Ng1GSfgv9JxxI0voij0qTjU2PgaLEMwmEMTLzSOzg5T2M1lTls6ev4WZrW6qdE
 kYbvW5xJCrC9Kpx93CGIAPWCZDFLrohOwhjhRlgUkSn59yXgEi+ru8gkMfe2NNzaLA7P
 rZMx8K0ZBmANNfhufhkJ5+9HRezjkW9vGRKV902wjOOU4V3ccbnYSBkQo7cWNYcWjXs1
 hvOg==
X-Gm-Message-State: ANhLgQ3tjq+3vQWx0y6R9NpeTcSw9RR43Z9FKG60VdwsSKK412GkI0/X
 6m4031LteZK3UpHTP2OlW8/WSg==
X-Google-Smtp-Source: ADFU+vuqmeh78SXaWsiXYy8hXlNrfLgWnmSHgXkI8A59hRejEmU+31cdoU6sL3oIm2qw7aI5XIZ2yA==
X-Received: by 2002:a1c:41c3:: with SMTP id o186mr3876274wma.27.1583499721445; 
 Fri, 06 Mar 2020 05:02:01 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id b5sm3128324wrn.22.2020.03.06.05.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 05:01:59 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: qcom: lpass-cpu: support full duplex operation
Date: Fri,  6 Mar 2020 13:01:47 +0000
Message-Id: <20200306130147.27452-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org, Takahide Higuchi <takahidehiguchi@gmail.com>,
 linux-kernel@vger.kernel.org
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

From: Takahide Higuchi <takahidehiguchi@gmail.com>

This patch fixes a bug where playback on bidirectional I2S interface stops
when we start recording on the same interface.

We use regmap_update_bits instead of regmap_write so that we will not clear
SPKEN and SPKMODE bits when we start/stop recording.

Signed-off-by: Takahide Higuchi <takahidehiguchi@gmail.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/lpass-apq8016.c   |  2 ++
 sound/soc/qcom/lpass-cpu.c       | 24 ++++++++++++++++++------
 sound/soc/qcom/lpass-lpaif-reg.h |  2 +-
 3 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 6575da549237..85079c697faa 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -121,6 +121,8 @@ static struct snd_soc_dai_driver apq8016_lpass_cpu_dai_driver[] = {
 		},
 		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
+		.symmetric_samplebits   = 1,
+		.symmetric_rates        = 1,
 	},
 };
 
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index dbce7e92baf3..dc8acb380b6f 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -72,6 +72,7 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 	snd_pcm_format_t format = params_format(params);
 	unsigned int channels = params_channels(params);
 	unsigned int rate = params_rate(params);
+	unsigned int mask;
 	unsigned int regval;
 	int bitwidth, ret;
 
@@ -81,6 +82,9 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 		return bitwidth;
 	}
 
+	mask   = LPAIF_I2SCTL_LOOPBACK_MASK |
+			LPAIF_I2SCTL_WSSRC_MASK |
+			LPAIF_I2SCTL_BITWIDTH_MASK;
 	regval = LPAIF_I2SCTL_LOOPBACK_DISABLE |
 			LPAIF_I2SCTL_WSSRC_INTERNAL;
 
@@ -100,6 +104,7 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		mask   |= LPAIF_I2SCTL_SPKMODE_MASK | LPAIF_I2SCTL_SPKMONO_MASK;
 		switch (channels) {
 		case 1:
 			regval |= LPAIF_I2SCTL_SPKMODE_SD0;
@@ -127,6 +132,7 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 			return -EINVAL;
 		}
 	} else {
+		mask   |= LPAIF_I2SCTL_MICMODE_MASK | LPAIF_I2SCTL_MICMONO_MASK;
 		switch (channels) {
 		case 1:
 			regval |= LPAIF_I2SCTL_MICMODE_SD0;
@@ -155,9 +161,9 @@ static int lpass_cpu_daiops_hw_params(struct snd_pcm_substream *substream,
 		}
 	}
 
-	ret = regmap_write(drvdata->lpaif_map,
-			   LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
-			   regval);
+	ret = regmap_update_bits(drvdata->lpaif_map,
+			 LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
+			 mask, regval);
 	if (ret) {
 		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
 		return ret;
@@ -178,11 +184,17 @@ static int lpass_cpu_daiops_hw_free(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	unsigned int mask;
 	int ret;
 
-	ret = regmap_write(drvdata->lpaif_map,
-			   LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
-			   0);
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		mask   = LPAIF_I2SCTL_SPKMODE_MASK;
+	else
+		mask   = LPAIF_I2SCTL_MICMODE_MASK;
+
+	ret = regmap_update_bits(drvdata->lpaif_map,
+			 LPAIF_I2SCTL_REG(drvdata->variant, dai->driver->id),
+			 mask, 0);
 	if (ret)
 		dev_err(dai->dev, "error writing to i2sctl reg: %d\n", ret);
 
diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
index 3d74ae123e9d..7a2b9cf99976 100644
--- a/sound/soc/qcom/lpass-lpaif-reg.h
+++ b/sound/soc/qcom/lpass-lpaif-reg.h
@@ -56,7 +56,7 @@
 #define LPAIF_I2SCTL_MICMODE_6CH	(7 << LPAIF_I2SCTL_MICMODE_SHIFT)
 #define LPAIF_I2SCTL_MICMODE_8CH	(8 << LPAIF_I2SCTL_MICMODE_SHIFT)
 
-#define LPAIF_I2SCTL_MIMONO_MASK	GENMASK(3, 3)
+#define LPAIF_I2SCTL_MICMONO_MASK	GENMASK(3, 3)
 #define LPAIF_I2SCTL_MICMONO_SHIFT	3
 #define LPAIF_I2SCTL_MICMONO_STEREO	(0 << LPAIF_I2SCTL_MICMONO_SHIFT)
 #define LPAIF_I2SCTL_MICMONO_MONO	(1 << LPAIF_I2SCTL_MICMONO_SHIFT)
-- 
2.21.0

