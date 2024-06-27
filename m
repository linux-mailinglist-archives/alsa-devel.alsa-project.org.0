Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4361591A988
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 16:45:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92D1220C5;
	Thu, 27 Jun 2024 16:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92D1220C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719499546;
	bh=F35vvznymN/8f2H0UImbT7wPJ9fTXmwdtHkeoQQ+rQs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mTbRViIyVMcfJFJVncXlNCx8W1vHQzssenU5GRyvhNwIsMtwxeLY+JABc+pc0KGka
	 l1HKz4ONuVCgY6DOhpPlmPI5kvlVA2PP+9ThI81eE8kQmIzBN/Gj5ZGJWNexZWr9vz
	 aEmkVZqmFLVtMkytSM5ivx6oWPgbZUZFC7xkgKDQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A704F805E7; Thu, 27 Jun 2024 16:44:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 314DBF805D7;
	Thu, 27 Jun 2024 16:44:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D4CCF80495; Thu, 27 Jun 2024 16:44:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C07AF80423
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 16:44:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C07AF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=u4BrZJfL
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a7fso98280661fa.0
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 07:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719499487; x=1720104287;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlNY/dyZo4bLPWLizU4SMkpFGmMEgHoN8M4MjWgPapY=;
        b=u4BrZJfL5RC+GOnSlseF+xn8VBVoKcBZuX0Wz5p/CSjzS4Ouw2ZUxMspXjfj8M/eND
         8GEdgpsAiAk0MJih3GUROYizcjPjnXRmMewpK+yd9JKHNbGG2ssXjCZv3nTYPQHobjmW
         cBBgWjKfTERgp7CMgYvUKZnGKNKI7p9QvaV0rr4dN3TqN2Bv35hR4ojHIOQJPD7+zh0p
         uN0yTWbw4Zy08E+Sm1ZQJwxdfhpIloio0dsNizHKZV+fOhW5ieFQax17wnaJyIUQTi1S
         DG5n0klPFVGvo/7ko86Ggk0khvlOzcRhC59oorGBxw3eF+z160XLiPtAuocWXZxKjW+9
         NqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719499487; x=1720104287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlNY/dyZo4bLPWLizU4SMkpFGmMEgHoN8M4MjWgPapY=;
        b=IVkXk35Tmv7Wln7oiaZk6SlYQWJCiEbraiQtUlG7xtQm5L5aEs8thUnP7ID5kYb50M
         0zQip4j+nVQdgj4ALg4QD5S+T15Q/BJQVkD8qV3NG6Ypf8cbxPq2GGPWX27dD/zx/Dub
         3D02qxtGBUWlVUw6s+X/wXT5CsG1AeHxluTCu4JiG9lI032nY9eY/DkDlr1r0JEZ+2AW
         WD7TZKuAs43emltWde/APGS/fe1BgROndlOPHSrR8kyozBLrbUkHhMtTlhkCujmkE4EB
         3tECNKmgJUyWlD9pV+amaTxmGqpMNi+LENlpID9+UfHe2iiPakfAnBPz7nezqT7qU2+i
         CE8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsPijrlGc4roKNcMrsXdY6K5gl1p1HWuHeSY1Ww3wK+qcZpQq4r6ccIZ1GtD07926IdKw9DeyDfEvqQKqBWyDwP8usbM6pEqqYj7M=
X-Gm-Message-State: AOJu0Yy9fRa26DJjTPCiKlofc30WgImLx6BBTlMl+JS3kGe8l8Sj5P0V
	5m2r+XLTGwaxb9HrXu8ofjMmWgnM8sJuyHeD2r4qXWosMCXco26AnYq4bzePm+4=
X-Google-Smtp-Source: 
 AGHT+IF7MinfYvXVoTXJi5SETWWXqYH/k8D5k7VHPbg+6myxhpRpGj2sS5YLKdpHsMBPQimcfJStLA==
X-Received: by 2002:a2e:bc88:0:b0:2ee:4c72:204e with SMTP id
 38308e7fff4ca-2ee4c7223e0mr13713361fa.0.1719499487248;
        Thu, 27 Jun 2024 07:44:47 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42564b7b7c1sm31254075e9.23.2024.06.27.07.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 07:44:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 27 Jun 2024 15:44:39 +0100
Subject: [PATCH v2 2/6] ASoC: codecs: wsa883x: parse port-mapping
 information
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v2-2-6cc1c5608cdd@linaro.org>
References: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
In-Reply-To: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1243;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=F35vvznymN/8f2H0UImbT7wPJ9fTXmwdtHkeoQQ+rQs=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfXrYdYtEgJSwT/6tXfD237j0hmBqYC3Ai+LFf
 uvQizkgZgyJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn162AAKCRB6of1ZxzRV
 NyDtCACJtoKKlxy2htKGj3YtUwpRZwvO/uEyIApp3T8ZS37ZV/CqYNLXodSsxp/aZ3+YqxD/ZGH
 995VMVZ0aB5Z9TL63bvifep1aKuH9nyJuQaJFeRqG3vMyHe22T+ODBZlxOeHxl6fCs3eTv1XdsP
 kPGFKixVGZFfP33jxRmndIphWK4VCm8LijB1dp49PkK33wJ3UWQ/hjXVwEh2/FsiQr8hRXVPZZg
 3RftzNggXmHQ1vvnXibfpibFeubdq4GJYNILbUurD6dW8TjopF+NdbWGew15Kd0q44Z7CEXznn2
 hf7pVnjeNmV+DdPt1F1fjuyGXdAh4mCciyK86uBNCfklHoIp
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: 6PHTLUO577LSKC4VGMXILAJZ56VRKBG2
X-Message-ID-Hash: 6PHTLUO577LSKC4VGMXILAJZ56VRKBG2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6PHTLUO577LSKC4VGMXILAJZ56VRKBG2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support to parse static master port map information from device tree.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index a2e86ef7d18f..5443a5c4100c 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1399,6 +1399,14 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	wsa883x->sconfig.direction = SDW_DATA_DIR_RX;
 	wsa883x->sconfig.type = SDW_STREAM_PDM;
 
+	/**
+	 * Port map index starts with 0, however the data port for this codec
+	 * are from index 1
+	 */
+	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
+					WSA883X_MAX_SWR_PORTS))
+		dev_dbg(dev, "Static Port mapping not specified\n");
+
 	pdev->prop.sink_ports = GENMASK(WSA883X_MAX_SWR_PORTS, 0);
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;

-- 
2.25.1

