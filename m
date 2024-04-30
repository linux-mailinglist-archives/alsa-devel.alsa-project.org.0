Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD908B789F
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 16:12:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C316EB6;
	Tue, 30 Apr 2024 16:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C316EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714486374;
	bh=NP40aYhBKcCbFWugAPRlpgWlc6py/IRGpooV4oIaReo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=u/vPKz2YO4qbNM8EYfwz2NrIZGrgFtJDx9k7YW2Eyev1PSngqkAF6TLdThuvWV4ZH
	 FKzI21QLE69i2opsxApzNqZrDqWP3M+lA2QJls6ae/Q17MAi6TRvccaMO3NxHMgLY+
	 NnX7QSG02g8s2oVaUjCDvVqucvfwg79Tj2jgvWEg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9CA6F8059F; Tue, 30 Apr 2024 16:12:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58B98F8057B;
	Tue, 30 Apr 2024 16:12:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7815CF80266; Tue, 30 Apr 2024 16:10:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D707AF8003C
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 16:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D707AF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oYxce0iU
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a55ab922260so759098566b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 30 Apr 2024 07:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714486198; x=1715090998;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CRndhXKIBc4clIT/57/JCzLDQofvnx8lXgRkee8Nqks=;
        b=oYxce0iUI8j/+QkdsWp+KtZYla87W5iy6VKVKBi5gKs9ylLg58zkGZzoCDWN1Ucbjm
         S3EJ9q0wG2+cPyaY90PM+ZXqY1MATm6L+u7l5VyRSWjpklCtlxutTUF9UkfeTzYUy/rP
         WxiEwxCwO8GBKkzRHJxO4jFsGIoNCYSWwt1Hn8c1vVk9fGc24jDAdxDySu4p8lX2TYP+
         TqB0r4upF3F20U2MZQlVGfQQ276HG5I9KG0qQagFcKOiN9CvV/hbOR/l1/i95n+I6r5X
         sQJFtPeN7sGySFKkojbqaOABbAfTxpcHe5JFR/LIBG6Io5eKYNAk7xmfDvDR1uBL3QCF
         qrGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714486198; x=1715090998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRndhXKIBc4clIT/57/JCzLDQofvnx8lXgRkee8Nqks=;
        b=ShQTXOtNJInP7uCI87XIIO9fwc5zbLFeZ/jCQMbhbOZNGDXz1uusDb34G7FqO8H1xB
         LvuDX5P0Iaosq8Nl94fX+23inE43uT7gOwAIYoxSOYsm/Z+JgASAsobr+Mxn1jMOwOql
         MVE73ahu5zV2OQWrnd1MNOnftbvgTPLMkPBuEeowKG7kAyblQGT3uD4CKDuK5JZXEopv
         Q1pQ0O2xfHuvyBqIiDnKS0EW4eS0OW8oL9HmAChDyAkJ+aCjMID1M5SoeC63sb93pzfI
         n+TSqd6QTTU3GxWNe1kiS1Nbh7+wQzbkZ8i31Mari/2BpTi+xpl595WoDO3675ZjIa9P
         nzuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrOvc6Xgw/sWfL38rlUtS0EyesqOyKiwMUMKtsjqqi22zO1aL25t1UT9sqJjcFCjU/NV0rSmfmyo5cc4Jhtb+14qXGqc8HMcBw9D8=
X-Gm-Message-State: AOJu0YzvxQ4iGla68blO716g/4HJlpXKiD75OCXEO5SmKfny1jEnffca
	OR0rmXVdGo8jXl7qL8QEC30RUldDN8shivSWwSzITnn0mBePYOzbLTw/YuO9p40=
X-Google-Smtp-Source: 
 AGHT+IFCPAQ//K1ZeCU6+XJpInRutAEizrqbETeiZ9aAaGWrio0jHz4KsPSkvUZEQrLyoAbjpdN+HA==
X-Received: by 2002:a17:906:f18d:b0:a58:7298:fdfe with SMTP id
 gs13-20020a170906f18d00b00a587298fdfemr11362096ejb.53.1714486197628;
        Tue, 30 Apr 2024 07:09:57 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 r18-20020a17090638d200b00a589ce6803asm7260901ejd.110.2024.04.30.07.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:09:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: qcom: q6apm-dai: drop unused 'q6apm_dai_rtd' fields
Date: Tue, 30 Apr 2024 16:09:54 +0200
Message-ID: <20240430140954.328127-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: A6SGLMQOKRBRTTCVARRVOFJR43Y6UX5D
X-Message-ID-Hash: A6SGLMQOKRBRTTCVARRVOFJR43Y6UX5D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A6SGLMQOKRBRTTCVARRVOFJR43Y6UX5D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove few unused fields from 'struct q6apm_dai_rtd'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 00bbd291be5c..cee23d4bda6f 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -70,14 +70,10 @@ struct q6apm_dai_rtd {
 	unsigned int bytes_received;
 	unsigned int copied_total;
 	uint16_t bits_per_sample;
-	uint16_t source; /* Encoding source bit mask */
-	uint16_t session_id;
 	bool next_track;
 	enum stream_state state;
 	struct q6apm_graph *graph;
 	spinlock_t lock;
-	uint32_t initial_samples_drop;
-	uint32_t trailing_samples_drop;
 	bool notify_on_drain;
 };
 
@@ -720,14 +716,12 @@ static int q6apm_dai_compr_set_metadata(struct snd_soc_component *component,
 
 	switch (metadata->key) {
 	case SNDRV_COMPRESS_ENCODER_PADDING:
-		prtd->trailing_samples_drop = metadata->value[0];
 		q6apm_remove_trailing_silence(component->dev, prtd->graph,
-					      prtd->trailing_samples_drop);
+					      metadata->value[0]);
 		break;
 	case SNDRV_COMPRESS_ENCODER_DELAY:
-		prtd->initial_samples_drop = metadata->value[0];
 		q6apm_remove_initial_silence(component->dev, prtd->graph,
-					     prtd->initial_samples_drop);
+					     metadata->value[0]);
 		break;
 	default:
 		ret = -EINVAL;
-- 
2.43.0

