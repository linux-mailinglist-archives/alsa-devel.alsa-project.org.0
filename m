Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 832EE9ACA53
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2024 14:42:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52FDE85D;
	Wed, 23 Oct 2024 14:42:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52FDE85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729687357;
	bh=r4xQBSHSzqBbjSO15B6LqQBSJLlq/rBG7/qkg8UtW2c=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=D42ISRhXX/WHCKfnriRk2t6UCPTG4RINv97RR0fmqVBr5qRwxQ7fICpoQnNhhZ6o+
	 H02lBgegw+Bg7PgmWc0NmcMrE7ctB71Lzp0nTjL2w0wAEG3Njp0siIn/T1TgeWs2mo
	 4OlbdSrt/TtG5gffU0iOy+xVNrOH3Qx/7H0Wq+Ws=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5396DF805B3; Wed, 23 Oct 2024 14:42:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A5C9F8058C;
	Wed, 23 Oct 2024 14:42:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46EBCF8016C; Wed, 23 Oct 2024 14:41:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84ECBF800ED
	for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2024 14:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84ECBF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hufviTMd
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43155a6c3a6so9295565e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 23 Oct 2024 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729687316; x=1730292116;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OC1GUo6u6ogIaP+998OmJFrdwx6E7b3ebTutyLvUJYE=;
        b=hufviTMdFCl7XbS6HhI5D0JPXUsJes3jb+irrjU1eaKONG7vbQ+irjnGhh/1UO/qVX
         mIkNwJPkOfm4nwXUKyRp1sTBjSbQ+r7xuUyiQEkZyTCdL1V7FH+dmKoo7x7vHAZCZqGR
         3xHL92HtOAq79PZwBl/tsmU+JPZmVL6yvYigYiX5jJ7nGBDBWGK+z3lCZqLwZ3dtHr/O
         Dg3A/B5XAbc8cRYGG9WohnvLC7o7i8UYiCCY0jDfVhA2SvcEfmkN/NLlpMnR6vtkTBoi
         bGrW3c3SwYiRKD8hn1JiutvoFQQc2MnXtymd37I+PDQEWel1OjlHj+N2DUDsNKq78EaT
         SmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729687316; x=1730292116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OC1GUo6u6ogIaP+998OmJFrdwx6E7b3ebTutyLvUJYE=;
        b=F+hJR2ywF4JUenHPPEflZ3n1u7KfA5LIRU6Pfq69p8SSJeDlV6YbS4Zbq3s+DA+nzt
         yQWig1qm2m2hQ7UHK99NT6E6qeyy9R9Up/GAecGtvrTMFr3a8g3EDEJ5MCGvMMjmWLO3
         EL54ukvB0XgmhaNd+uZ9j0mh/0b30DzDVyrBQN3oyCXXsLCnbeVsfO976AO0vBealxED
         x7vnS1K+BB+tdMdi21dNFFp6lZpu2i7aTCuRSkz2ed4eL7pv4a9XCv0TMGHWge9qvZ3f
         ZlE/8XVtQ+hboS+8fiP44jyb9d9zOU3LZQvk3ZKhXp4thYPgYx9KlG8tZlHp3NyPu64O
         nfKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQtv9DTCxNAJi8RAyUzlgPoctfHTYQlqQkrzQpgbk23S4VEOy/jj4FxdGfw46Ow8uHofN4X3JE1G1x@alsa-project.org
X-Gm-Message-State: AOJu0YxREEGuQG+uVc/yc3W/UC2Z/e0V0+e2hI4hA7cw/Q88gVTkHnbY
	8ng2c/ovP3RJVuSlyo3a/ElSvonWDaM6kaSzMGWbih4jedjivzc567kGizAfM48=
X-Google-Smtp-Source: 
 AGHT+IGOOLD010FpGoIXn//GRg/EMY8PWXk1Rdw1ltM3+wHFz9aINxy6HV8Thsw/0R78Sp9Fi09moA==
X-Received: by 2002:a05:600c:1d06:b0:42c:bfd6:9d2f with SMTP id
 5b1f17b1804b1-43184133ef0mr9814505e9.1.1729687316420;
        Wed, 23 Oct 2024 05:41:56 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43186befc90sm15101675e9.26.2024.10.23.05.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:41:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: qcom: x1e80100: Support boards with two speakers
Date: Wed, 23 Oct 2024 14:41:52 +0200
Message-ID: <20241023124152.130706-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XYS3GSFVRCRG5ZTRVYEX2C3HI5MZJNKW
X-Message-ID-Hash: XYS3GSFVRCRG5ZTRVYEX2C3HI5MZJNKW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XYS3GSFVRCRG5ZTRVYEX2C3HI5MZJNKW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some Qualcomm X1E laptops have only two speakers.  Regardless whether
this sound card driver is suitable for them (we could re-use one for
some older SoC), we should set reasonable channel map depending on the
number of channels, not always 4-speaker setup.

This change is necessary for bringing audio support on Lenovo Thinkpad
T14s with Qualcomm X1E78100 and only two speakers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/x1e80100.c | 40 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 898b5c26bf1e..8eb57fc12f0d 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -95,23 +95,53 @@ static int x1e80100_snd_hw_params(struct snd_pcm_substream *substream,
 	return qcom_snd_sdw_hw_params(substream, params, &data->sruntime[cpu_dai->id]);
 }
 
+static int x1e80100_snd_hw_map_channels(unsigned int *ch_map, int num)
+{
+	switch (num) {
+	case 1:
+		ch_map[0] = PCM_CHANNEL_FC;
+		break;
+	case 2:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		break;
+	case 3:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_FR;
+		ch_map[2] = PCM_CHANNEL_FC;
+		break;
+	case 4:
+		ch_map[0] = PCM_CHANNEL_FL;
+		ch_map[1] = PCM_CHANNEL_LB;
+		ch_map[2] = PCM_CHANNEL_FR;
+		ch_map[3] = PCM_CHANNEL_RB;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int x1e80100_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
-	const unsigned int rx_slot[4] = { PCM_CHANNEL_FL,
-					  PCM_CHANNEL_LB,
-					  PCM_CHANNEL_FR,
-					  PCM_CHANNEL_RB };
+	unsigned int channels = substream->runtime->channels;
+	unsigned int rx_slot[4];
 	int ret;
 
 	switch (cpu_dai->id) {
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
+		ret = x1e80100_snd_hw_map_channels(rx_slot, channels);
+		if (ret)
+			return ret;
+
 		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
-						  ARRAY_SIZE(rx_slot), rx_slot);
+						  channels, rx_slot);
 		if (ret)
 			return ret;
 		break;
-- 
2.43.0

