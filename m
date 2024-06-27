Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3107391A5D6
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2024 13:57:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4E181E93;
	Thu, 27 Jun 2024 13:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4E181E93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719489429;
	bh=9h2qcrpoMJqhhywZCecMu80SrM7XnP1kk9SFCuNDm9I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EYhlUlLE5xmDJuX5sWbVy7Q35Y2gBSRbmK3kbqD45+Zt0Boql+IGx4d87TaQr05Us
	 oQKDHFM4EHpf5oDDHcJ/QupCNOCbtslsCaFsPqEhQFI0dLYPuGYU7JwJ53MjNW/6Pv
	 AXN6GnWadxQceHvKx+Xod2BI67m3hvnfH9SVaed0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5B49F805C9; Thu, 27 Jun 2024 13:56:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23BE1F805D8;
	Thu, 27 Jun 2024 13:56:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1803BF80578; Thu, 27 Jun 2024 13:56:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F5FBF80423
	for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2024 13:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F5FBF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=OiLx70lL
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4248e28de9eso40276695e9.2
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 04:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719489361; x=1720094161;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQkTyAteb5scd6wwSGd6gcSdcAYbAHAYfVMyNIn/xpY=;
        b=OiLx70lLOgOXBJWQV9MOJ65WXHmFudQplc5EAGIgtqjXDagVjbsOQmb1X2wlF2D11S
         Qa//6C4esdUYhRGni9htTjAAKe06OxfMZ223JCScfndzoy04A8VdNxrD6WB0+bN6lPhw
         TX3AduhRHECjZbU4ADQ1z8gOs9lZOh9EsqpWVlIh/ed5tawaQ4BShqR3U2eIBa1FCftI
         K5teYpWFLxAJSlO8sdkHSjsZ5SSWSlNjS9jPBwpOhGgvSwV/e/td6+oPs6S60wD3dYid
         VPmSLzoHYoZjZVJIUtRiNnWicUJrvyAiVIbtsvkAdJ3a5IyduQ9d3i4R4dJdexwyC2XU
         YMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489361; x=1720094161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQkTyAteb5scd6wwSGd6gcSdcAYbAHAYfVMyNIn/xpY=;
        b=GKeu0HeZniW1mwZ54PIxnKdruv40J/LGri38o5kypiIOnzx6a0zvbiNfBoyLjRVFgn
         OiVK8qn5knN/IryW7lAlYgJhfK7jvLAf97a36lqyp8hY7SemBkJKcScyQqomVwuB6AG4
         pN+NsCxwYyassK2bhotV9rwNv8TaO2qltqLmQrDWD17jeiP7PODenWOrFQj3CUiCSY32
         d7wZVsCIH8bcToOtXaRrI/CTjHFcaLGt6eB2Znr+Oopj4UoFCzJFyLI8G9+RZt3OrT28
         xTHCTS2JSzSYgffBfJRCwG0qJ//4l/9rBBJjImDOHLJeGQevGUiBhLbI1FhjBTrDeYuJ
         tFGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhgocnmxHUnzVMLamQ+YWye0+hYJAYwE3+wkwdMdRkVFDWOJkxJ+dLWzOJH/yCCNHfAoxx7NBsgwGkK0NJL+vRjBtRUGZH7hi00kc=
X-Gm-Message-State: AOJu0YzE2jGI73QuuaWdMpJTk13+MwlV4Ly5x5c37VWtIXB1vEqWIJVn
	MiDwxPRYpDhHeb9+r2G3j2YPF6sn1ptf8uKoyA6GS0LTVKcVRKIbcU74prVcxUg=
X-Google-Smtp-Source: 
 AGHT+IEvySmQxU5UelHvcHtqpuhdOW6EjC0yNYf7f6/v4w6iuTt7cS5NAQr7ZFDjG5jJuRh0GQh/YQ==
X-Received: by 2002:adf:ce0c:0:b0:361:d3ec:1031 with SMTP id
 ffacd0b85a97d-366e94d152emr8445646f8f.31.1719489361249;
        Thu, 27 Jun 2024 04:56:01 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674369980asm1597552f8f.80.2024.06.27.04.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:56:00 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 27 Jun 2024 12:55:18 +0100
Subject: [PATCH 2/6] ASoC: codecs: wsa883x: parse port-mapping information
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-port-map-v1-2-bd8987d2b332@linaro.org>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
In-Reply-To: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1041;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=9h2qcrpoMJqhhywZCecMu80SrM7XnP1kk9SFCuNDm9I=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmfVNN/jaGM/HtFpEzFVuUA0E9budoN92MdAdGO
 mqOUIOy79uJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZn1TTQAKCRB6of1ZxzRV
 N3B2B/sEKGfd/FUn+br9tS/11gSupaR+3TgZKVnsqecnVlh9xuS9uT9XOYzF8NhJkYn7BzDXbLD
 zVD8VM+FKHB5ifuv2oYHSG5kGFIIYiOq6i72J4i44116J56pFw6/e0FvJBGELqiq2Nre2WVkLRs
 GXYDIWZBI93WkhUuULf6Azo3RCEbUVtwwihhfOCt1NKwz9d0hFRL5m//15I4AWvhb0jSnuVkcJw
 DTec8AY81GsgGpyq36I6j+rubCfQAX2Sp4rygiir/0p7jUot2XCCHDqA2tQdXpHzLedQOTOV2ox
 fy9pJsbObZCRchRYg3rGH7l1lcq22UEHaybqVmOf6WUnN6jy
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Message-ID-Hash: G2HLIPGTVNCQ4ZZUCOPERQ5PJ2FJ7VIV
X-Message-ID-Hash: G2HLIPGTVNCQ4ZZUCOPERQ5PJ2FJ7VIV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G2HLIPGTVNCQ4ZZUCOPERQ5PJ2FJ7VIV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support to parse static master port map information from device tree.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index a2e86ef7d18f..43156d39480f 100644
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
+		dev_info(dev, "Static Port mapping not specified\n");
+
 	pdev->prop.sink_ports = GENMASK(WSA883X_MAX_SWR_PORTS, 0);
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;

-- 
2.25.1

