Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A41D4453130
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 12:48:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D32DF16A0;
	Tue, 16 Nov 2021 12:47:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D32DF16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637063304;
	bh=dRzVuikCD2mUd5TDYlprpbrhwNYExGmvz/bLlpe1j00=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H0R3iYtR7rPd0zVSCcpKJDI3uJwOmk4XvSNPGIYRBQt/a327KFRZnOcTxiaI0W1Ck
	 MxlBvIZHi2G4VGNaRbNFJ/iFnQjlBjtfx518SvQ7t1FxPC9UACdfafmkKdaEzcYNdu
	 5fwCqqbdi73Zei8P+gEoMoR1gUnC/LvBTPXGSPY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39BAFF804E0;
	Tue, 16 Nov 2021 12:46:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 208E2F804C3; Tue, 16 Nov 2021 12:46:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0C76F8026D
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 12:46:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0C76F8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Xl+s/Y+c"
Received: by mail-wm1-x329.google.com with SMTP id
 k37-20020a05600c1ca500b00330cb84834fso1700333wms.2
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 03:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d1giUkCfPq6BR7uk0WV+6luLzyXkW70izeBPdkRQixI=;
 b=Xl+s/Y+c6nx9/ssKwbB11JGD0OU2RJVsDDn63pKqMVpiNeTHVx6K9hiW8FIVHP+bED
 ITKubhlPT6+5nxng0+XsDdWfi6wMF/ZesmW9XJSiwV+/3TnK4/MMbm3h0Zpgh5vvSdRp
 I7UOBnwfqlPb+l9BbNgAvqF39e+0aUOA+mx0WADkeNj7nkaXmZ+rQm9ojBaA4uCMqhn3
 qT8cAWndIAnRwwawgi8BTXl9DVk2aqQ4glDG1AcUExeOcqm8VSWIeWFJwqoFhIOuR3H+
 Snc4FvKNc+iBDSYTmOR39Zjb7sXBvE25N44egbMmsM007cB763IJw27M/zj/T3ZVX1Gg
 UmXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d1giUkCfPq6BR7uk0WV+6luLzyXkW70izeBPdkRQixI=;
 b=e0xAAAmO8ckTl/Qdai9HujhuxSNPtZldMot52zDF8DoPf6m+KIP4FOyY71ZLF6co2Z
 DwRB1sFYbiYJqsY8jxk2EvKnHbwbZB3iLxrXY07ippoaDCaTHulhu21+SHwHKoqv1RaI
 jn7zBJXozxCQ7JtV3BqFxsgTYh7evWfa1Ef5G37bhdayJjLaoVEE4U5UK/S339MFMaYW
 5PreZ/l1Rw/Jiy9qlmcDNXdYRELrs+mIB/zI80KDhjPsPkbXJ6NBQ1lEMYfj+mX8qbOe
 FtgCo2r7Gf8aFQMLpeyQo6OT/Me7djpzLEJA/mIi5xM33sAwrdoj21zSmoFp5MTX1YWW
 X5NQ==
X-Gm-Message-State: AOAM532ztACXNKzCS5c4JGeYeN86gh6tx+JdZRiyroqby9+NzwBFGxIE
 doe/LFM4aQ318fEidYpzPADjSQ==
X-Google-Smtp-Source: ABdhPJxaw+wUnniAUrUtV7PikZ66OiA9SnbGXVSJR1Yh/NAhlhXK+STZmfyX2180s1YmVLDGNmCg0g==
X-Received: by 2002:a05:600c:3b8f:: with SMTP id
 n15mr68986799wms.180.1637063197566; 
 Tue, 16 Nov 2021 03:46:37 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id z11sm16934698wrt.58.2021.11.16.03.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:46:36 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/3] ASoC: codecs: wcd938x: fix volatile register range
Date: Tue, 16 Nov 2021 11:46:21 +0000
Message-Id: <20211116114623.11891-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211116114623.11891-1-srinivas.kandagatla@linaro.org>
References: <20211116114623.11891-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

Interrupt Clear registers WCD938X_INTR_CLEAR_0 -  WCD938X_INTR_CLEAR_2
are not marked as volatile. This has resulted in a missing interrupt bug
while performing runtime pm. regcache_sync() during runtime pm resume path
will write to Interrupt clear registers with previous values which basically
clears the pending interrupt and actual interrupt handler never sees this
interrupt.

This issue is more visible with headset plug-in plug-out case compared to
headset button.

Fix this by adding the Interrupt clear registers to volatile range

Fixes: 8d78602aa87a ("ASoC: codecs: wcd938x: add basic driver")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 52de7d14b139..67151c7770c6 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1174,6 +1174,9 @@ static bool wcd938x_readonly_register(struct device *dev, unsigned int reg)
 	case WCD938X_DIGITAL_INTR_STATUS_0:
 	case WCD938X_DIGITAL_INTR_STATUS_1:
 	case WCD938X_DIGITAL_INTR_STATUS_2:
+	case WCD938X_DIGITAL_INTR_CLEAR_0:
+	case WCD938X_DIGITAL_INTR_CLEAR_1:
+	case WCD938X_DIGITAL_INTR_CLEAR_2:
 	case WCD938X_DIGITAL_SWR_HM_TEST_0:
 	case WCD938X_DIGITAL_SWR_HM_TEST_1:
 	case WCD938X_DIGITAL_EFUSE_T_DATA_0:
-- 
2.21.0

