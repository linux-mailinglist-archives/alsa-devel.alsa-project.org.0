Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 297F08FE808
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 15:39:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85BCAE82;
	Thu,  6 Jun 2024 15:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85BCAE82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717681155;
	bh=qHWlxpFKIi4ZJRKhFJ6yviYELggHBICqrfli+fF5mFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G3dvYez3uAPiAKenItjmIghI7QBOsGgmH6KcchSgwtOQ8Rhqc+6n2iFgSBfnMz5nn
	 6h7GSoekuTulmzcPyu+RPQO61vcxPJEEqXOzsaPSsdFE39lBKha4aO4jjP2nQWATum
	 SomYdE5JQZ1Vn9ZP6/jod/UBXPZ2T7uF4bUHULvI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5AA9F805B6; Thu,  6 Jun 2024 15:38:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F012F805C7;
	Thu,  6 Jun 2024 15:38:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50F3FF805B6; Thu,  6 Jun 2024 15:38:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26943F80088
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 15:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26943F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DA6+OVHj
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-354be94c874so720508f8f.3
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jun 2024 06:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717681104; x=1718285904;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFjmjZCpuVMeVMSSZ9J5s/fgM9j+bExLlEMG9Wd+tX4=;
        b=DA6+OVHjzsQffD2KGOtCqvQrkDREvao62p1hJ0ASgUBbZyTbV+Bu7EIDpN3zNgI5nJ
         Tev4B45PATggPK+fpf1SU1ek0JT6zoh8uakcg7Di1+587nccEaIi9hjh83hIpk6Ey6XM
         mLmNSO5xWiubTkpU/QpuaJmjDwjAXonthffknD/d/qBMxfNHn6ebkKdncftI8fjd0l7T
         pFGb3LyL09PRryCnjp2wHw1m8KAKSya+YOn0ifL8sUEpp2Ws+P3YR26DKKzA8YkNyQlu
         gIGRT4RYGt2Pjq4UYz9OCL4EJqnr5PoaSZeH+iqJo3eyDhnlgIsSpRrgVlACyPAkdUsU
         Degg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717681104; x=1718285904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFjmjZCpuVMeVMSSZ9J5s/fgM9j+bExLlEMG9Wd+tX4=;
        b=FCYVRN/10+tKZIgv0cDK8Nn9f9o4y9mdQC/qSy5PUc9TVuit7zXjnjhNSR0Ug07gXH
         C9RSU8FICKbl3rwc8rVBE9XMrxehhSC4OfRLE9pL0iycLGEKpxYMP47dTfxDjtQW6Dza
         cGsPtKAe8mXaqbR4SQCJp327LiTLcxeKc1KzSYckpD8dywmz0o/uDCjmuKrMRpSoCCDk
         uWJehhUUOsQ0QAC+ZoC03LnALyU8t5p0qZy2yVXwObzCi3VmDbXiF/lzTDelIE/VJRMv
         VAluSlQq053uI0Eht5gZOBFEgWoSKle7ZE4ZJjgtTWrRuU0g2AcchMy0rQzpOpzlOnHy
         VqWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4Ak+Q32obrcqySDtg3WGXR0dUWNAbxcZgySvtpw6LU4zSAOpsjUsiA2Y26T1US1DFS4lniCb9TKMG1BEj4t6cB2DmjIsAhnhvSRY=
X-Gm-Message-State: AOJu0Yy+RLN7bzok9yq1S0czrE1aQ7LfKWJOQcw8opODwU6pVOIMGJ2y
	3K1Pnt6Xic9hQ//96qtEAqR7fj/xBVpDNnLHHwvSqBFprRMx5XfzzYgUsYvsVb5LpZWKGhfwg1t
	e
X-Google-Smtp-Source: 
 AGHT+IFrJTWqZqxqkmRXJjiBbTJRhM5hctfxjX7aPSnP6H7xrVvbFZndee+upzSGoOZpViZqPllHig==
X-Received: by 2002:adf:f1cb:0:b0:35e:83f4:3e6c with SMTP id
 ffacd0b85a97d-35e84068663mr4179223f8f.1.1717670973671;
        Thu, 06 Jun 2024 03:49:33 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e95bcesm1223185f8f.77.2024.06.06.03.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 03:49:32 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	krzk+dt@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 4/4] ASoC: qcom: x1e80100: Add USB DisplayPort plug support
Date: Thu,  6 Jun 2024 11:49:22 +0100
Message-Id: <20240606104922.114229-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439;
 i=srinivas.kandagatla@linaro.org; h=from:subject;
 bh=aELUqEAbcStwE5eRIXyqcVJh7MVh9ydfsnLQA9m5aQM=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmYZQyleYwhYg7GUGgaJK8aE6/zw2kc1Ju8QTt5
 ZQIM5rziDSJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmGUMgAKCRB6of1ZxzRV
 NwZwCACWECAUPnMVqnsYVA8kkFJLMatOnY4Uo6a5LdtFl6yj+PfWPe/zTI3ZM2H26/l2nlZ3x48
 SvMA3uJZRqUeh+VXApLea7IdpznQDLzMWq3nWXSHZMoOe/xrXPAcFIm26hndm/G9h8oeqKeQ0HD
 AR2+GI5TWtZn9nWvTYlSi3P5BMwxMFvVsOtAu57x48GVJP+OgG1pW0nNPYPuMl0nYk2jEyN+8x6
 iFRGevvk5HZF8nXiREKEtLoIG/Xz+uoKDidFhrgajnFYmVcA7/2ZqmFwEYPz7pVg6R4lfAVmkeT
 qhN6Pmso/nRR3bl589QsGTVrxCcu7rawXUj4j9SYCQ4YSOl7
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MZ5UH5OXM4XYJLMJV2WG4WOWBVAOG7KP
X-Message-ID-Hash: MZ5UH5OXM4XYJLMJV2WG4WOWBVAOG7KP
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MZ5UH5OXM4XYJLMJV2WG4WOWBVAOG7KP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Add support for handling jack events of USB (DisplayPort).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/x1e80100.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index 0e0773a85809..789d833bcd2f 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -19,12 +19,32 @@ struct x1e80100_snd_data {
 	struct snd_soc_card *card;
 	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 	struct snd_soc_jack jack;
+	struct snd_soc_jack dp_jack[8];
 	bool jack_setup;
 };
 
 static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_jack *dp_jack = NULL;
+	int dp_pcm_id = 0;
+
+	switch (cpu_dai->id) {
+	case DISPLAY_PORT_RX_0:
+		dp_pcm_id = 0;
+		dp_jack = &data->dp_jack[dp_pcm_id];
+		break;
+	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
+		dp_pcm_id = cpu_dai->id - DISPLAY_PORT_RX_1 + 1;
+		dp_jack = &data->dp_jack[dp_pcm_id];
+		break;
+	default:
+		break;
+	}
+
+	if (dp_jack)
+		return qcom_snd_dp_jack_setup(rtd, dp_jack, dp_pcm_id);
 
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
-- 
2.43.0

