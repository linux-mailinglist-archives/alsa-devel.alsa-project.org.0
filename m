Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 300BA91DF77
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 14:37:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDEEC20C1;
	Mon,  1 Jul 2024 14:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDEEC20C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719837462;
	bh=2fLNT1nXHgsFGK9SfQggEdsqimQIX4e/hXkHKmU5TxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Li/BaHHaGXit4dezkMAC4udIUHOqccjn53kS7AXC/jwN22oydQroErrKhKLrv88G6
	 iSJPPXtf68p04XWo/OSxg7KMJdQoqy+dR5zFuly5PLlQXQs0FtPU64dnLH+BDDddKe
	 MXk0XQzrZLOWB8WhiYVNkQWkquAD98coB0WlDIzM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 815D7F89B3E; Mon,  1 Jul 2024 14:24:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A32E7F80864;
	Mon,  1 Jul 2024 14:24:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50E55F805A1; Fri, 28 Jun 2024 03:07:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17E25F8049C
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 03:07:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17E25F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=X9m1W20w
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4249196a361so623995e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 18:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719536840; x=1720141640;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJhqgpKH8xpri6xgGQ+p8sz4lqzbwizt046mSH+TQQE=;
        b=X9m1W20wkr4yxE4Zsre5ML49OP1Vv5B/2gyE9mQ1IaY/yKb8UIyog5mRBvm4EeGdDI
         DJwR23Pio6j+ytzc59lDxUGZC7cxThFB7OGIqfPBwPThOvhD5E150zlU/5+LqQaMRek2
         FE7f/7baM/2DhnaGjnddelraU2ieeZvJHgR2LotHA3dT5S0FU9J0W+ArIKjv+RfS4zRa
         IzMHexqDJy9d+i9q4qMav2EcexOc7WwxR68MQfYd3AJTykVToz9Nd64r8Jj7do7HgwMg
         uq1KFPFseEWMVllreQb5erd0uObmDSnY7nMJ3C1q3sf5mGGH0N2Ffrz+ry2x0sOzYzL9
         h+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719536840; x=1720141640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJhqgpKH8xpri6xgGQ+p8sz4lqzbwizt046mSH+TQQE=;
        b=hF8BiGib5YK3RY0nKH8rrbU3FkDfBjj+f+Xj9fqbCI6IVZy3Ezcgh07h6qp8BGMnAk
         ntYSLN/zVH7OMszg/1h4dfVcJkqL4Aiyzxoop7mNuiRe6ITJgyXuolAsMgyiOFr4r8L0
         jGjsu74GFfePIyZrTB+z6e2pqdMjJGTJy4DbJOCti3SCPlGVhw1ay89WyXJR3wJ9O4w5
         KG5DfhpJLXJC2geQkF89B6GZGEZbZqnFbF1zxiybtkkerXQOoCOzOFWmkDn3hR3MzYvp
         kqeQvUiw6PYJCw+nxdpG/0nPDBtABJGj3AZemf98+NLwW2Heu05ARDYw1uLWn05PvcRa
         4dsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx+Vy7CL7PUCAJ9jOP3MNeWL7Zo5nocwFfGEjMrNNQ3k09j7q2qA0uTYGE/c68jY3O1VLqm0Co6lsMoqpiJjeTM2TN4mnYkPdoVao=
X-Gm-Message-State: AOJu0YyzNfXpYkvpj9E8NIsK4SzmWkHjBOpIvzx01VKYfTHgfQNQh73+
	2X/cxfmtyl9A0Xh7UgbFY5N5GeWcs6YTTStxYgzkRHoINuxpywm694R7NGvwbP8=
X-Google-Smtp-Source: 
 AGHT+IHxICLv8rGCo59jeDyowuTcbYQXuR/fFVeImMfjYukUzMJrpYuiyKtWcPlrPunnuKXL3er48A==
X-Received: by 2002:a7b:c8cf:0:b0:425:63a9:f96e with SMTP id
 5b1f17b1804b1-42563a9fadbmr30979815e9.36.1719536839842;
        Thu, 27 Jun 2024 18:07:19 -0700 (PDT)
Received: from fuerta.Home ([2a02:c7c:7213:c700:2cd1:b0e8:abb:540])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af3c27dsm13075805e9.7.2024.06.27.18.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 18:07:19 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	elder@linaro.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	alexey.klimov@linaro.org
Subject: [PATCH 3/7] ASoC: qcom: sm8250: add handling of secondary MI2S clock
Date: Fri, 28 Jun 2024 02:07:11 +0100
Message-ID: <20240628010715.438471-4-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628010715.438471-1-alexey.klimov@linaro.org>
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alexey.klimov@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TWMTROK7ZQNX4HAOFXD2FI6QTYQGG2UG
X-Message-ID-Hash: TWMTROK7ZQNX4HAOFXD2FI6QTYQGG2UG
X-Mailman-Approved-At: Mon, 01 Jul 2024 12:23:58 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWMTROK7ZQNX4HAOFXD2FI6QTYQGG2UG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add handling of clock related to secondary MI2S_RX in
sm8250_snd_startup() and sm2450_snd_shutdown().

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sm8250.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 50e175fd521c..9864d803114d 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -55,6 +55,14 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	switch (cpu_dai->id) {
+	case SECONDARY_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	case TERTIARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
 		snd_soc_dai_set_sysclk(cpu_dai,
@@ -77,6 +85,16 @@ static void sm2450_snd_shutdown(struct snd_pcm_substream *substream)
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
+	switch (cpu_dai->id) {
+	case SECONDARY_MI2S_RX:
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
+			0, SNDRV_PCM_STREAM_PLAYBACK);
+		break;
+	default:
+		break;
+	}
+
 	data->sruntime[cpu_dai->id] = NULL;
 	sdw_release_stream(sruntime);
 }
-- 
2.45.2

