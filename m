Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EB5216F27
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:46:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CE2484D;
	Tue,  7 Jul 2020 16:45:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CE2484D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594133191;
	bh=oIhMeaRyWHuQrrO9ZjTQyEP5zb4OPwgZdAZpU6Brrf8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XKapE8c45i9h2V9JINHlv9YeNmhL5qsYmZE8uv1h8gpz8q9kmRt2BBqLFB0PGpX4w
	 4hBgKhD8QMlfiClRfv2DVJqO1UXLJGX45NTxf/36NfsXy/AXs8u9wdX5LKLS3YWW84
	 3rf7J/UhYL0Lf2NnG2DhaTaHX/AJ9RBCH992TKhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BC3AF80345;
	Tue,  7 Jul 2020 16:38:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB910F80322; Tue,  7 Jul 2020 16:38:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8A55F802F7
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8A55F802F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jXqgCo/x"
Received: by mail-wm1-x342.google.com with SMTP id o2so46779098wmh.2
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MeJNmc8Tyj+Q0twt9zY+vng7Jbsk0DhIYimyC4Uuyj0=;
 b=jXqgCo/xrVf3wccOvx8zSZXI+4BMW/Sxa9JnuReURq5CKjzu/p7Scdr4XGrE9TNNN+
 9fI1VvqahoInrASq2Evq+lKAJIcPXs74067opxQ++jtWGSJ4eq2iEbseCWXJ7qJsGsLR
 +Bgnk6U/P3g6XKgTnQ1jij1TCJF6yb1z9pUnQeWB3YC7D8IL06B4AOtvJVyKvTnMdj2j
 Z/pHNqfU3VeiF248cB4q/lHEOuY5rez80ebVMeMijOpZs/JJWSsFuS2/ee8OlasaVc7H
 S1Da87TMz5/HQwfNcl1QQl88zaV5Jd0SgMSaSIfTpmcOLam279PZtmLm2QrmwbOLz9hi
 H89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MeJNmc8Tyj+Q0twt9zY+vng7Jbsk0DhIYimyC4Uuyj0=;
 b=tKQI01luJBNb8Umu9DmvwUQc//Dd1pd7eWNcsoybSAVt9tMXbUXSQW+FISCPJbQlfX
 U9+CG/Sv36V0glBBDhhawRtjTe409W8kpYuWYKiCZju6chjWBTM8vdwlZQHfg6obRKuf
 oJI63g/39/vUQEEjqQDh6kzQVU4wbohk0QnbMJb5r5vOnqjfm9vhVet2TZbHsu0m/Au0
 NsjUFcBwCrS7u4D9Fu7w9i59n4X4ml4axFnWLNjErsG5BZolLPuWjAivjrnMrnZzsU9a
 CWBIqllZQaZROFwbZ3SIyhdU7YnhJaxfA7hJCRPNujxItqM9RuLV6vz3gXN9+EUom9l1
 zTLg==
X-Gm-Message-State: AOAM532DpskGkSlwS17RVhhbHyksstoMy/3g9ZdjzS10IfZg1jbMvtZa
 Ur04Gq2k7CoNpXhgeTYyJcPXZL2LIm0=
X-Google-Smtp-Source: ABdhPJx4EGK+a98YUUNvZXG/6XzKwko1V/11TSzbBj53QSByas+d2hxb2ueuJBY/bfG6WSQIaQcvlA==
X-Received: by 2002:a1c:2ec7:: with SMTP id u190mr4463500wmu.48.1594132688648; 
 Tue, 07 Jul 2020 07:38:08 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:38:08 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 15/28] ASoC: samsung: spdif: Fix 3 misspelled struct
 properties
Date: Tue,  7 Jul 2020 15:37:29 +0100
Message-Id: <20200707143742.2959960-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Sangbeom Kim <sbkim73@samsung.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Seungwhan Youn <sw.youn@samsung.com>
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

When documenting structure properties, they must match the names exactly.

Fixes the following W=1 kernel build warning(s):

 sound/soc/samsung/spdif.c:89: warning: Function parameter or member 'saved_clkcon' not described in 'samsung_spdif_info'
 sound/soc/samsung/spdif.c:89: warning: Function parameter or member 'saved_con' not described in 'samsung_spdif_info'
 sound/soc/samsung/spdif.c:89: warning: Function parameter or member 'saved_cstas' not described in 'samsung_spdif_info'

Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Seungwhan Youn <sw.youn@samsung.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/samsung/spdif.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 759fc66443298..4ae7ff623b826 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -70,9 +70,9 @@
  * @clk_rate: Current clock rate for calcurate ratio.
  * @pclk: The peri-clock pointer for spdif master operation.
  * @sclk: The source clock pointer for making sync signals.
- * @save_clkcon: Backup clkcon reg. in suspend.
- * @save_con: Backup con reg. in suspend.
- * @save_cstas: Backup cstas reg. in suspend.
+ * @saved_clkcon: Backup clkcon reg. in suspend.
+ * @saved_con: Backup con reg. in suspend.
+ * @saved_cstas: Backup cstas reg. in suspend.
  * @dma_playback: DMA information for playback channel.
  */
 struct samsung_spdif_info {
-- 
2.25.1

