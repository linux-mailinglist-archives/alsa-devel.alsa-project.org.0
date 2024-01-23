Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A3D8390FF
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 15:14:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C75749F6;
	Tue, 23 Jan 2024 15:14:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C75749F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706019295;
	bh=DeKmmRTD5CNQ6B+HeX8UYe9vDMCdXGtr2srSjXnVNns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mWXFVPl49syFxGm/IawAHRig2azjO4unIAocazupsEu0piymmz0DMSrUahoLaV9df
	 /IIakNstYAbGBOP0qM5WkzVy2VPRS1JEevD7g9Awmj418cYKRYNuf/pA0BRsZOYwDN
	 oZ7hLmIJ7a+BWPSbToSiZRebgl886z8pRwvc6/BI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D69B3F805D2; Tue, 23 Jan 2024 15:13:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0958F805C7;
	Tue, 23 Jan 2024 15:13:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36929F80494; Tue, 23 Jan 2024 15:13:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40F07F8003A
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 15:13:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40F07F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WP/RDrJ6
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-336c8ab0b20so4431262f8f.1
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Jan 2024 06:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706019215; x=1706624015;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMoHux/To4Z52U5G1RVrMYaeJYsNbnrs52rE7GNgAZI=;
        b=WP/RDrJ6RBCRTpeWyWYFye0JHH5QXuOhy+4wOMdBYzFYhFX6giapvpn2XsDZMUgogN
         69bWIaGFgiZvNXgwVIrUdZIsfGfbyh9o/eQbq8CZTj4s5yK+1OXXM0d+Dd1hbS0gJNCB
         hvPELnUTDzlO/oXGPM1hCTzCbUOxI7AuylvRtyxsRWExpMsiweU9lBbOn1pSxjdDY94j
         6Smz8Q/2mhOXSSbC7brwFpJqqGi1KeGJt/krqow1w8cqPymVRFnlZ3KI/FlwsG1gxPWB
         l3NLAtQ7Rp9IsvQ6KvfvcyASICHdwsifsjja0/5WdScZasXKgaoKZPQf2Se6ty97RmMZ
         JgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706019215; x=1706624015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMoHux/To4Z52U5G1RVrMYaeJYsNbnrs52rE7GNgAZI=;
        b=KKbhLcL9Zt4aN51eJjXf4MItiKqzE1jRwZ4wSRqgrCEdtrRYpLVma2Q4wMLqOQK0YM
         9QQuWehRp4wj9gnb10RpE+znEROA+lQkMGFMyayt2VFuwAN/IqU3TMOwemifFlG1gQPU
         BlN7pttUpNR2MS7iBhJtrYYTpFEejDfA5X3NSu7bL/M8OF4zz+NX5qTNcvlR+xSSgs0g
         ivMoGpjDDhOK1grH82Az4AkwdTP3EovDgLBaedphvaUohEds1F51rPcXspFKS8iSM+m7
         +Erbgqq25vjRwY2WBH1P3vY0Gq3uV/6enz/sTMpneazBazqOEB2AKKVXb/3WouwpsyH0
         U8Yw==
X-Gm-Message-State: AOJu0YwAhT8bdRxAOEbnnADQE/t0m1EAIWLtNvUbPBiFEbcceiKKo9W5
	cH5/ZGCjLeVZJakQeMKz9/2wHzFiqNUN+iFfjcEayRzOkGWGRv0otiCr1sgU8MA=
X-Google-Smtp-Source: 
 AGHT+IHo9L/aNhs2YMpki7iiHaEqAW0G6bDJZdhRv+OHQG2adVInlM0yES+a35JGzEx8ngUBwfPJ4g==
X-Received: by 2002:adf:e546:0:b0:337:c702:98f7 with SMTP id
 z6-20020adfe546000000b00337c70298f7mr3509879wrm.95.1706019215345;
        Tue, 23 Jan 2024 06:13:35 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id
 r8-20020adfe688000000b00337d97338b0sm12132298wrm.76.2024.01.23.06.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 06:13:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/6] of: Add of_phandle_args_equal() helper
Date: Tue, 23 Jan 2024 15:13:06 +0100
Message-Id: <20240123141311.220505-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240123141311.220505-1-krzysztof.kozlowski@linaro.org>
References: <20240123141311.220505-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3FLVWJCTRZUMGWIO5LZRPAXD7REA4QZE
X-Message-ID-Hash: 3FLVWJCTRZUMGWIO5LZRPAXD7REA4QZE
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a helper comparing two "struct of_phandle_args" to avoid
reinventing the wheel.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Dependency of cpufreq and reset change.
---
 include/linux/of.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 6a9ddf20e79a..85bcc05b278d 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1065,6 +1065,22 @@ static inline int of_parse_phandle_with_optional_args(const struct device_node *
 					    0, index, out_args);
 }
 
+/**
+ * of_phandle_args_equal() - Compare two of_phandle_args
+ * @a1:		First of_phandle_args to compare
+ * @a2:		Second of_phandle_args to compare
+ *
+ * Return: True if a1 and a2 are the same (same node pointer, same phandle
+ * args), false otherwise.
+ */
+static inline bool of_phandle_args_equal(const struct of_phandle_args *a1,
+					 const struct of_phandle_args *a2)
+{
+	return a1->np == a2->np &&
+	       a1->args_count == a2->args_count &&
+	       !memcmp(a1->args, a2->args, sizeof(a1->args[0]) * a1->args_count);
+}
+
 /**
  * of_property_count_u8_elems - Count the number of u8 elements in a property
  *
-- 
2.34.1

