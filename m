Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A01F03322CF
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 11:18:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 117E317DD;
	Tue,  9 Mar 2021 11:17:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 117E317DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615285085;
	bh=HH2x5oels53ssIUxm/YoXzgch96H6KJtMoW5DdDY0mU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DbQoxvDV+h60m/7CPb35qa3C38fm33EX+XKje44eDqdLHUZawnIILRRex8dOFsraL
	 Lqo4GnIXS0Sqd0+WIOgztmjS3uM812KsTpQa8xGGQOTgZ3pz4EHM+8SXWfY1C3LUoR
	 ti3/0QwIYGMsouLpdocLXSgbHOxQV40esz6Vl5Fg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F083DF8028B;
	Tue,  9 Mar 2021 11:16:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 286E4F80227; Tue,  9 Mar 2021 11:16:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2A1AF80166
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 11:16:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2A1AF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="iUEr5zGc"
Received: by mail-wm1-x332.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so5568687wmy.5
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 02:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7SC3b5p8KCrikFDvbH6RkupntFDK0hUEiUc11Ocw6b0=;
 b=iUEr5zGceE8+/7/m0L48oYW6R+wRzRzdZyKswX3XC7nqAOveY6c5JXSRotZGpPCYmW
 7BzzSUj07puMvOdkaYigM6brsgxXhFTrHd2e0CAww5IWkMEoG/0XpMKahYzuLGybG+j5
 X1IJxTBo6IsKVtEnFxHAtzT9zWKcSVFkyRgQBzI/jyqLnuSLUb4L8OxEX31eirYRgoPe
 m9MJGvzC7tD2DvUGh3PRk0ivlS4Q/Bt+Uf87m1qnumj+4RuFEn867Aq/KOAbsUvMSyaR
 jT4e8mMJyFmMEVHHy0mzFDJbix14iuCwcRUduaiosftVartrXFrGRrAdOFvJ81ocQI7p
 vu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7SC3b5p8KCrikFDvbH6RkupntFDK0hUEiUc11Ocw6b0=;
 b=X64DiFi37EfWCqjRpqtPWNTpP62HKbVElX9F+xg7mKo2Ye4Az0lKzqifUMKKKF4yLr
 qFGGYQjS60bktzLEXgidzYvofpN8czskO5s+FP5f87+xtB6JYjGuui+IaPJYsozieurX
 TM5ClHvdqjZ9ca0UNFpcR+fmN1J+tfa/2dzhPDCNKtrl4qBpnGVzED2oqf1ACy3tMI+k
 nu2+hziKpGcgUiEBmr9fd8MJYMOXW6/R901mlybnr4PbNTyDQWx+84A1Dl5igGKM4F+I
 A7CGKD1RyvxgfZf1EzmiPM4JhsUm3lutyI9hDrvmHAJ4GsAUwGSbrgNBCmZGe5ogcSJ2
 dN6w==
X-Gm-Message-State: AOAM530iqulniqDyE+icJKhxIXdjtzlbXDPD3g2pjkGfTsSbsr5qTtHT
 Xi93Ng4y7OLQSR7vjMpvgLKRlw==
X-Google-Smtp-Source: ABdhPJyjP9o7LviiwTh3yXCbAa9pkMn+bLirElNITQyZFrbR2RAgXQ8Tosz1vNZ68GAL66UEo2XgMQ==
X-Received: by 2002:a05:600c:19d1:: with SMTP id
 u17mr3119882wmq.141.1615284976563; 
 Tue, 09 Mar 2021 02:16:16 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id r2sm22552248wrt.8.2021.03.09.02.16.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 02:16:16 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/3] ASoC: qcom: sdm845: Fix array out of bounds access
Date: Tue,  9 Mar 2021 10:16:11 +0000
Message-Id: <20210309101613.25995-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210309101613.25995-1-srinivas.kandagatla@linaro.org>
References: <20210309101613.25995-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: amit.pundir@linaro.org, alsa-devel@alsa-project.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
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

Static analysis Coverity had detected a potential array out-of-bounds
write issue due to the fact that MAX AFE port Id was set to 16 instead
of using AFE_PORT_MAX macro.

Fix this by properly using AFE_PORT_MAX macro.

Fixes: 1b93a8843147 ("ASoC: qcom: sdm845: handle soundwire stream")
Reported-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/sdm845.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 6c2760e27ea6..1e2c2d0902ea 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -33,12 +33,12 @@
 struct sdm845_snd_data {
 	struct snd_soc_jack jack;
 	bool jack_setup;
-	bool stream_prepared[SLIM_MAX_RX_PORTS];
+	bool stream_prepared[AFE_PORT_MAX];
 	struct snd_soc_card *card;
 	uint32_t pri_mi2s_clk_count;
 	uint32_t sec_mi2s_clk_count;
 	uint32_t quat_tdm_clk_count;
-	struct sdw_stream_runtime *sruntime[SLIM_MAX_RX_PORTS];
+	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 };
 
 static unsigned int tdm_slot_offset[8] = {0, 4, 8, 12, 16, 20, 24, 28};
-- 
2.21.0

