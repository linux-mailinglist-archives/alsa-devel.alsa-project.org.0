Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D94AA7FBFD3
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 17:57:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A63EDF1;
	Tue, 28 Nov 2023 17:57:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A63EDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701190671;
	bh=/crke6rva+jNDbNgEcPEHA5cn9I0AIlcJJY9pEsy1Bo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZQ71L5V/ZhFoEtrrcjIdzPhLRInG5bY4TvRLDFNHnyeu88ga6YTjlsy/ZNM22XT1K
	 ERWDSKTkBjA15b8BV7XrzVrHGIsMdnvE4B3K2yWjnc3ozL6YTOgmateuDuOXHKq5YP
	 G55qPlVPSl6cAeVG0JSqiDY3I0PG3w3nkbVqgLfw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10195F805C2; Tue, 28 Nov 2023 17:57:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8BA9F805BB;
	Tue, 28 Nov 2023 17:56:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D07BF8016E; Tue, 28 Nov 2023 17:56:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5C98F800F5
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 17:56:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5C98F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dXjoJoDj
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a00c200782dso830894666b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Nov 2023 08:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701190608; x=1701795408;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idILoaA2JqRIC25Fjf9nyuPXcQlZpZOQtMl2iaoFfrw=;
        b=dXjoJoDjLGOD/mOCRJxa9Hp/am7DxVISySTrv2NBLK9AlqrhSK9LKDdeay/eVGk4cp
         6X7E+WQnVIYZvJ5vbBiLYiFunGh/bxFteG2EINfYIS/V6KCgCuZK2jKmCP9RGRMXdYDI
         vIx9dG1byKchzBpoESvwn2EK/+ECBYYdlafyr2l18IRDTXDu77Bx69AhQqw1epTzgDnk
         EK9U/ugmXQ6zsEZDC4DkLpuPtXsXllEQINK1z7I0LJn0cCOvj9WXLwko4mSzotP5U0zW
         3vbcH5ZaaAABSCxke5KXgFDMBPYcjYG3CVzMIJVNeBCjDIY+HCF2znV4sYioUqlTUwhU
         R/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701190608; x=1701795408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idILoaA2JqRIC25Fjf9nyuPXcQlZpZOQtMl2iaoFfrw=;
        b=dL4b5CkA5OTpo1tbHkZTTS/h0f2thssL36pgROtvVCew54OREREMfPT/zGzNVdvBhd
         AXCMYD1/T+BRk9OvLqibn32sLts/zBp4lkZ7VmlcaGH8byxmpK7kLtxpm8VdQQ+zDR1j
         4//LihTqhslfp6mMRInqkVrT5qezn1hfYRXC+YTRlf8j8lHUXJNWocaXTey4XL5wUudP
         QRxJoi2q9grSuSOOnCiSXWZ5y+vQyiD8F5LHJ4QDzDMJp0/g9P1kKFjvW9YUi6bOlCRU
         77bGXbP8iQRZHUXMXD4k3HjQRx1fgT/CfEzzI9zWMvtKHs2XcBRUXfhxMQpKSD6b/nUo
         mleQ==
X-Gm-Message-State: AOJu0YxE4Oi4Wc2IzUhGkd4YiRovt2fGt51AQJHGDAv9kBHkgnd3n8Sq
	N87lIgPBu5+c2Ouw7+/kF5ycAg==
X-Google-Smtp-Source: 
 AGHT+IFifNuJpcawcpWiUxQK4fn6U2n7H3bqGqSV8Mhuvr/erPBff7VzJpLR21GhXuqTUDqAPhVJZQ==
X-Received: by 2002:a17:906:749c:b0:a14:b151:72e4 with SMTP id
 e28-20020a170906749c00b00a14b15172e4mr1775658ejl.73.1701190608259;
        Tue, 28 Nov 2023 08:56:48 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id
 cw18-20020a170906c79200b009bf7a4d591csm7126252ejb.11.2023.11.28.08.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 08:56:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ASoC: qcom: Move Soundwire runtime stream alloc to
 soundcards
Date: Tue, 28 Nov 2023 17:56:38 +0100
Message-Id: <20231128165638.757665-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231128165638.757665-1-krzysztof.kozlowski@linaro.org>
References: <20231128165638.757665-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CKSK2C5WXMTD7RB5MASYUOTX5EGD3WLG
X-Message-ID-Hash: CKSK2C5WXMTD7RB5MASYUOTX5EGD3WLG
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CKSK2C5WXMTD7RB5MASYUOTX5EGD3WLG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently the Qualcomm Soundwire controller in its DAI startup op
allocates the Soundwire stream runtime.  This works fine for existing
designs, but has limitations for stream runtimes with multiple
controllers, like upcoming Qualcomm X1E80100 SoC with four WSA8840
speakers on two Soundwire controllers.

When two Soundwire controllers are added to sound card codecs, Soundwire
startup() is called twice, one for each Soundwire controller, and second
execution overwrites what was set before.  During shutdown() this causes
double free.

It is expected to have only one Soundwire stream runtime, thus it should
be allocated from SoC soundcard context startup(), not from each
Soundwire startup().  Such way will properly handle both cases: one and
two Soundwire controllers in the stream runtime.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This is an entirely different approach than my previous try here:
https://lore.kernel.org/all/20231025144601.268645-1-krzysztof.kozlowski@linaro.org/
---
 drivers/soundwire/qcom.c  | 33 +--------------------------------
 sound/soc/qcom/sc8280xp.c | 13 +++++++++++++
 sound/soc/qcom/sm8250.c   | 15 ++++++++++++++-
 3 files changed, 28 insertions(+), 33 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index f42c83c390ff..ac9176f714bf 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1291,10 +1291,7 @@ static int qcom_swrm_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct sdw_stream_runtime *sruntime;
-	struct snd_soc_dai *codec_dai;
-	int ret, i;
+	int ret;
 
 	ret = pm_runtime_get_sync(ctrl->dev);
 	if (ret < 0 && ret != -EACCES) {
@@ -1305,33 +1302,7 @@ static int qcom_swrm_startup(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	sruntime = sdw_alloc_stream(dai->name);
-	if (!sruntime) {
-		ret = -ENOMEM;
-		goto err_alloc;
-	}
-
-	ctrl->sruntime[dai->id] = sruntime;
-
-	for_each_rtd_codec_dais(rtd, i, codec_dai) {
-		ret = snd_soc_dai_set_stream(codec_dai, sruntime,
-					     substream->stream);
-		if (ret < 0 && ret != -ENOTSUPP) {
-			dev_err(dai->dev, "Failed to set sdw stream on %s\n",
-				codec_dai->name);
-			goto err_set_stream;
-		}
-	}
-
 	return 0;
-
-err_set_stream:
-	sdw_release_stream(sruntime);
-err_alloc:
-	pm_runtime_mark_last_busy(ctrl->dev);
-	pm_runtime_put_autosuspend(ctrl->dev);
-
-	return ret;
 }
 
 static void qcom_swrm_shutdown(struct snd_pcm_substream *substream,
@@ -1340,8 +1311,6 @@ static void qcom_swrm_shutdown(struct snd_pcm_substream *substream,
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
 
 	swrm_wait_for_wr_fifo_done(ctrl);
-	sdw_release_stream(ctrl->sruntime[dai->id]);
-	ctrl->sruntime[dai->id] = NULL;
 	pm_runtime_mark_last_busy(ctrl->dev);
 	pm_runtime_put_autosuspend(ctrl->dev);
 
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index d93b18f07be5..7c20b25ba3de 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -31,6 +31,17 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
+static void sc8280xp_snd_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sc8280xp_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
+	struct sdw_stream_runtime *sruntime = pdata->sruntime[cpu_dai->id];
+
+	pdata->sruntime[cpu_dai->id] = NULL;
+	sdw_release_stream(sruntime);
+}
+
 static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
@@ -91,6 +102,8 @@ static int sc8280xp_snd_hw_free(struct snd_pcm_substream *substream)
 }
 
 static const struct snd_soc_ops sc8280xp_be_ops = {
+	.startup = qcom_snd_sdw_startup,
+	.shutdown = sc8280xp_snd_shutdown,
 	.hw_params = sc8280xp_snd_hw_params,
 	.hw_free = sc8280xp_snd_hw_free,
 	.prepare = sc8280xp_snd_prepare,
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 9cc869fd70ac..f298167c2a23 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -66,7 +66,19 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 	default:
 		break;
 	}
-	return 0;
+
+	return qcom_snd_sdw_startup(substream);
+}
+
+static void sm2450_snd_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+
+	data->sruntime[cpu_dai->id] = NULL;
+	sdw_release_stream(sruntime);
 }
 
 static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
@@ -103,6 +115,7 @@ static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
 
 static const struct snd_soc_ops sm8250_be_ops = {
 	.startup = sm8250_snd_startup,
+	.shutdown = sm2450_snd_shutdown,
 	.hw_params = sm8250_snd_hw_params,
 	.hw_free = sm8250_snd_hw_free,
 	.prepare = sm8250_snd_prepare,
-- 
2.34.1

