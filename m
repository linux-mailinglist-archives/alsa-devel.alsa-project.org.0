Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0D1241AC2
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 14:04:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEBD41665;
	Tue, 11 Aug 2020 14:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEBD41665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597147496;
	bh=qRHEls1vEzBzly/NaWz6gypSbYGLmyWf3Q2UsepB4zI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FCUVtjmGBG5gpPuyYixwmJvtUdHOVGlVqWMl9qsOgICG8wcWJu1++5bQyukpJDUK6
	 blwQmSYmA22DnKgRVNWuI/4681pBFGdVdPK3Sbi2HP2cXf1uQVDb1omXM5ofRjsB2E
	 4NreFETwMkcsIheAcbRNJFiGFU9aWPSYincSRZOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C271F80162;
	Tue, 11 Aug 2020 14:02:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0374CF8015B; Tue, 11 Aug 2020 14:02:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F980F800D3
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 14:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F980F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Sfr0g5fJ"
Received: by mail-ej1-x644.google.com with SMTP id o23so12809954ejr.1
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 05:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UtO337UuhwrHztkf/uXMNcdRJRUGGo/p2OPF/qdxl2E=;
 b=Sfr0g5fJMimBf15dE6fMhdMgI0QznVXtfJt+gZEla2kYWaDQAf8FGWzxAx7q0DtYhS
 HL3QWZD2Bf7+3J0wt9peBnWV1Fs+iPXsIXyeD1TEiYDTb5Lc//Qn2YiFpq3nFIXcHqIG
 QbLFTYed/Aeo4gfv+UwO+PJRuYcGlbAaLUyelMi2EMPUwwQnvt4wQw9deYkSZZ8QjPJu
 6FTQ1jPuLy6D9z2Vs+MjwVbvaNbbOMxNl/agMbyuGOCNZq47gQS0laVH5PoCqlQ+M7YO
 foepncG0wwI0G0EyUbJDVVKmrk3Dm8iy/ikAs2ZGyBacodY7D2F+hz4jrsoK3uyMBNMd
 N91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UtO337UuhwrHztkf/uXMNcdRJRUGGo/p2OPF/qdxl2E=;
 b=XM/QEzblbD+dqlW+PjAiknZRhCLMrgxyxL+8/hmhBjdDIrxUym0bUEBIz2ocJjF7J4
 GNMXo5xpaXUO/YW7a9IhR4/OS76OwyvG35ucjfdh+0PL5jCnF4jsq2pbTG0OuyZQ6po0
 JGhi0aypuLcMPuYQJ85FIFqplUU1zs42QwR/lb8Ni+gWqj5LJwtnXsBjTZWrFygLbGuE
 GtGR3D9qKBHygLPZuEY85cYWQfTvgTg8iZ5Yg8qBNwa7ZFvxTuzN+12LJZG4zL5RxxnK
 PrTZy6mg+0+NtBvkQAYXwKvCVfjpa8t1StIDrY/UjQGaGoRSwF4ikqEnurDeynkeQdP4
 kXgg==
X-Gm-Message-State: AOAM533Ypp4OEQ5+H8G8oTa54NTM2NqMMYKgQgJx9JtgMcNWOTiXAAU3
 1oK0ATafntWkUjtd5WBvgZIcVQ==
X-Google-Smtp-Source: ABdhPJynE3JraElTEyvaK4HUeYOem+y7v5bgGfQh1UqOS+jNIUVSQ8t3NnSIo9Bn040DIQpQ6LntPg==
X-Received: by 2002:a17:906:403:: with SMTP id
 d3mr25577883eja.522.1597147334476; 
 Tue, 11 Aug 2020 05:02:14 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f21sm14238363edv.66.2020.08.11.05.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 05:02:13 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 2/2] ASoC: q6routing: add dummy register read/write function
Date: Tue, 11 Aug 2020 13:02:05 +0100
Message-Id: <20200811120205.21805-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200811120205.21805-1-srinivas.kandagatla@linaro.org>
References: <20200811120205.21805-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, stephan@gerhold.net,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 john.stultz@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Most of the DAPM widgets for DSP ASoC components reuse reg field
of the widgets for its internal calculations, however these are not
real registers. So read/writes to these numbers are not really
valid. However ASoC core will read these registers to get default
state during startup.

With recent changes to ASoC core, every register read/write
failures are reported very verbosely. Prior to this fails to reads
are totally ignored, so we never saw any error messages.

To fix this add dummy read/write function to return default value.

Reported-by: John Stultz <john.stultz@linaro.org>
Fixes: e3a33673e845 ("ASoC: qdsp6: q6routing: Add q6routing driver")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v1:
	- added reg write callback

 sound/soc/qcom/qdsp6/q6routing.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index eaa95b5a7b66..25d23e0266c7 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -973,6 +973,20 @@ static int msm_routing_probe(struct snd_soc_component *c)
 	return 0;
 }
 
+static unsigned int q6routing_reg_read(struct snd_soc_component *component,
+				       unsigned int reg)
+{
+	/* default value */
+	return 0;
+}
+
+static int q6routing_reg_write(struct snd_soc_component *component,
+			       unsigned int reg, unsigned int val)
+{
+	/* dummy */
+	return 0;
+}
+
 static const struct snd_soc_component_driver msm_soc_routing_component = {
 	.probe = msm_routing_probe,
 	.name = DRV_NAME,
@@ -981,6 +995,8 @@ static const struct snd_soc_component_driver msm_soc_routing_component = {
 	.num_dapm_widgets = ARRAY_SIZE(msm_qdsp6_widgets),
 	.dapm_routes = intercon,
 	.num_dapm_routes = ARRAY_SIZE(intercon),
+	.read = q6routing_reg_read,
+	.write = q6routing_reg_write,
 };
 
 static int q6pcm_routing_probe(struct platform_device *pdev)
-- 
2.21.0

