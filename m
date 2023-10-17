Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 310257CC88C
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 18:15:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F1A084B;
	Tue, 17 Oct 2023 18:15:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F1A084B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697559352;
	bh=8MsZxKlQSomp4cvUDuCqCGsXZAXLl47rG2jGkaVeLSI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vMgythL6P60RG4VgHKJByMQ2D5FhuvDdMIILpwDY0XjkSCojGCSWhT/IeXZ3J+viK
	 odBOdoY8WmP68XezUd+sgA5CLLTWyYP6K8WWBSfqLbd3EkoFZd+m6/zH8s+JJx1KE0
	 Q03YqmgZqSMPZ/e2DYXE4Zw6+AzsLtXF71mA0GB0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BA09F80552; Tue, 17 Oct 2023 18:14:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BD22F8024E;
	Tue, 17 Oct 2023 18:14:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 039C8F8025F; Tue, 17 Oct 2023 18:14:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62340F80166
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 18:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62340F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FbMyfy/O
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9b95622c620so1026595766b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 17 Oct 2023 09:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697559273; x=1698164073;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sqta/Ta79wVcWXCXNCV11oVf8kvXjcJa0MxKMtJZ3AE=;
        b=FbMyfy/OcTHMREP/FYyqvQikmkyFfUAm8jjAnoknDNbDrTNLAW7r6pvKS6wUrN2sR1
         hFIPIHv/zwgG+yP+HpYY7QB5YFlRxlaUk+Q87eClO3AiRw+rDnvo4ck426JEMF84eCRs
         bixQD0q/3s+zlSG+yXK4nultlKz0KyXa+flFDzLIAbWFQJm0V2DLfpGR+NYy5RsjZOj8
         PqOmUAaaBDSh+HKZGUxWun3Cyc+Iefmar8zSKZav3JWtu0ll1cDzcVAcEGDSMqaAU130
         BeVNIqkxJBQxxhe9AqRtkHx/SVK40fGZsoNLnbL5z166OiIF81aTFt6PwpKeb8UiECLC
         5OPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697559273; x=1698164073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sqta/Ta79wVcWXCXNCV11oVf8kvXjcJa0MxKMtJZ3AE=;
        b=bVCRzJ6/4xeWv2F5M+sZOSKpI7tNxnzuYFmZXpm64IYGksOHNcLp3iTRfx3kP8kf4C
         /TRGTvNHwth2hqsWNeFLdAQj/yO0aX1TdRX3JwUpStXRkQtkFXGxit1pNd5bFJO+7AM7
         6difZGdWtIW4UBJTsv+0LlB6zGNXDmfsST05d0cNtR+jHhqMxj7Pxr4GahqRCDTeDLiC
         JF7HinFakMGyXMc8zMI5zm5FIkze/D1gMbkG24UuP06hyhzIEvbl7rju80s7LacuZWHv
         HEZsdCwbHKi/UcygBpZYJbYs2f6D+tVcXplGqc1a1wdnYT/OyBCvxe1NCkLNSD6dWNBM
         yxcA==
X-Gm-Message-State: AOJu0YwteRCPdkGUgEFsM5l8y88utLr/MVY3AZKPxWuQjEifYNfbkIr4
	eYEvuRecmOSo5hodTzZH/zh5uQ6zqhnWHVj+vhU=
X-Google-Smtp-Source: 
 AGHT+IEkArJiEQ52iBEL5uXIZHn0gatrsf9WltFV37rGzxsJzomcF8p1Va5TsIwC72FuiYd/Ek1LDg==
X-Received: by 2002:a17:907:c19:b0:9ad:a59f:331a with SMTP id
 ga25-20020a1709070c1900b009ada59f331amr2485924ejc.57.1697559273257;
        Tue, 17 Oct 2023 09:14:33 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.154])
        by smtp.gmail.com with ESMTPSA id
 a14-20020a170906190e00b0099b7276235esm78040eje.93.2023.10.17.09.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 09:14:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: qcom: q6apm-lpass-dais: pass max number of channels to
 Audioreach
Date: Tue, 17 Oct 2023 18:14:29 +0200
Message-Id: <20231017161429.431663-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NSE45C6W6OCCYAZGJZJ3QTTC3JVADWAO
X-Message-ID-Hash: NSE45C6W6OCCYAZGJZJ3QTTC3JVADWAO
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NSE45C6W6OCCYAZGJZJ3QTTC3JVADWAO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Using the params_channels() helper when setting hw_params, results in
passing to Audioreach minimum number of channels valid for given
hardware.  This is not valid for any hardware which sets minimum
channels to two and maximum to something bigger, like four channels.

Instead pass the maximum number of supported channels to allow playback
of multi-channel formats.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 7ad604b80e25..c5e065a21e27 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -97,7 +97,7 @@ static int q6hdmi_hw_params(struct snd_pcm_substream *substream,
 {
 	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
 	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
-	int channels = params_channels(params);
+	int channels = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max;
 	int ret;
 
 	cfg->bit_width = params_width(params);
@@ -130,7 +130,7 @@ static int q6dma_hw_params(struct snd_pcm_substream *substream,
 
 	cfg->bit_width = params_width(params);
 	cfg->sample_rate = params_rate(params);
-	cfg->num_channels = params_channels(params);
+	cfg->num_channels = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max;
 
 	return 0;
 }
-- 
2.34.1

