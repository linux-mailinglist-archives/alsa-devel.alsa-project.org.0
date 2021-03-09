Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA4C332875
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 15:23:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51942185A;
	Tue,  9 Mar 2021 15:22:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51942185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615299781;
	bh=HH2x5oels53ssIUxm/YoXzgch96H6KJtMoW5DdDY0mU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QdbOCQ6Q//aNLAjVXDQTGQ3DLWybzNGzvQAa7C2e1bCe+ERyuEFsuV2LXS+GEDZ07
	 hznW7GnnXAayssUP7xirbx1I1I08NM8ykc+Hy1rsd6b5iIQnt3gwDfQ6+LFnbusAt0
	 NC5SbkZBMbScclW4U0JRI5e3Ush303wq0n6AfZik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFCDFF8029B;
	Tue,  9 Mar 2021 15:21:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCD50F80166; Tue,  9 Mar 2021 15:21:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B45AF80166
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 15:21:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B45AF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZjYFfHHM"
Received: by mail-wr1-x42d.google.com with SMTP id h98so15900356wrh.11
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 06:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7SC3b5p8KCrikFDvbH6RkupntFDK0hUEiUc11Ocw6b0=;
 b=ZjYFfHHMPU1GSEGxy+aUr8HnsSN0WaY9mrC7mCccdGr/Fz9YNCK7a4NU+MUZLNRuu4
 q6vgSODxMs3509ZhsFRJVg0NbQeePxj+ZD0rmcs666nAwCEakjLc5J86eQkzPHAIQPgj
 lFvX43AYDJ4Du/7rEQFgmExVuHqBigutDRplslMCNEUtmL2yf8lddLAQCGrOvlZl8RKJ
 P/7pZ0BYqEu0YxTEjsim6fyzxTusPVZGkWKF3u2gIXTeusDhEukBIQsSPS9e6ELLR7Hw
 qD+Mp7+/HARdwBTHa+eLGboLwOuRWjPketW19KwckDK5HRe69cmgcmyP6Z75ukQEXygK
 SdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7SC3b5p8KCrikFDvbH6RkupntFDK0hUEiUc11Ocw6b0=;
 b=nrl70YSMMAu+hvFvgIGgl/WsjoAVrTNNgG0PAOSCgpBd+DFVNGJAWnX9w6vJ2to/kt
 dTR174+sR6TwOYjleMN5a78W/ln7WSKoJMw3Gtkq559FerZodu4vVhgwl4UA+zurbpmF
 z1h2tt8mjePP6AnY9fXJ9j/wAR26oXdTCvwBjbaM9MkgCrMPuEZY7E+l+rOd3KimEnZG
 BQyVaXgjKrQaThPVHMsWOw9XEtoWExNul+gdZTSX08MEeN8c0h7i4cn/UXjCMM4EQG2s
 JDQUEJeBZp6ge/yqtmaID4lWUFNL4Gi1EH4zZB6Bys33Rwxp7iWrGnodXRcG4swroSA9
 ms5w==
X-Gm-Message-State: AOAM532FrV2uBc86GxbNZxwpPDo+ZxFkS2wsgr1ZcpQXeWKzF8Vlzpz1
 Gi2aVUrcrka1hUwf1GlhsvYOVw==
X-Google-Smtp-Source: ABdhPJxjfJmsj6wcZ6mWd395YhO8e0N+Y5BahWUgBX7oVvKHjeizC9yhxYugXazs9FVzQyn+8YItsw==
X-Received: by 2002:adf:8562:: with SMTP id 89mr28558921wrh.101.1615299705585; 
 Tue, 09 Mar 2021 06:21:45 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id j14sm22265123wrw.69.2021.03.09.06.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:21:45 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 1/3] ASoC: qcom: sdm845: Fix array out of bounds access
Date: Tue,  9 Mar 2021 14:21:27 +0000
Message-Id: <20210309142129.14182-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210309142129.14182-1-srinivas.kandagatla@linaro.org>
References: <20210309142129.14182-1-srinivas.kandagatla@linaro.org>
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

