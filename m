Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 102A6216F43
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:48:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB82E11C;
	Tue,  7 Jul 2020 16:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB82E11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594133334;
	bh=OpuTpsPUqQgNdRyulOppnnJDfOYVl4J8PGfggRev+qk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ljk+1GGa5w6XFsaimv5Jz6hw94QOlNzhtSUKI8+cxBHCwlHgNUXmVsSAPso0GMQ9s
	 +SixHFIo/thpCihvpstAnMDfRM9G9rb+5TiH+0nTGamAm2GKqOX12Vk9F+X3PR+7f8
	 Y4ZqomHBIVcvp0bcKuXRQGb3zOGLE+QcC2HVCvCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D63CF80367;
	Tue,  7 Jul 2020 16:38:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1ECDF802F9; Tue,  7 Jul 2020 16:38:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DA45F802FE
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DA45F802FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="IhOXTjVM"
Received: by mail-wm1-x343.google.com with SMTP id l2so45291231wmf.0
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=joYuVrqjbvze3xQNhXb1qygj1A0MIp/q6w6MCrvUZ8U=;
 b=IhOXTjVMYFUujmZaEgHv/pfMwLaNnDUdlNNgKSMoflKYkAmtWB/h0Diq5Zqy29FQBQ
 F3vXbY5HCuGwkbT/EYmHPySO7bxH35ASeHizHBLQH1nh8gflpFpOx1g8eOLQjM0P2c63
 HKWW8jBApZKsX8R+p811F2DJSoQCoLxnt5EVBODnXS10b/HK6sqDvByi72gsifAqvQmM
 1lqFcvELQOIU/9ba1F5yBI8x1CQkcuoD5wDVDCq54bRRMWhm8ua0sDhhIcwQ1/kMPwY+
 ylGno9KJF/Uh2qp9/gCgKcIiMpheTfbCQ8x8GKQ4dBfFGnRL4n/N0y0Blxr2OymdB37K
 ahUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=joYuVrqjbvze3xQNhXb1qygj1A0MIp/q6w6MCrvUZ8U=;
 b=UlAePlxOQW/kqKDLACf8WdWbVfxn+4ABTeuBLaqLBwv5uy6/AS5/uU8yDzE8C1kbJy
 bBlSqCXG8l3sR14vDtfNDeuxgyA1GSCWE4DQhHRZeQvQjh7I3BOnohJx3d8Hq9QUqVB4
 WYFq+vR1du0dXUE8JoN6ezzdu1R0Jutlh0jbzpImvw8NNxZU00FnjR9u20lzDZONISlr
 Wi2Qpo0QOrUxxcRCSQnBvqfCvSoo9fHjSG5Zo1hatoQK/p6qM3n9o2ZtdtZjSzy4UpC7
 NEeeHJGfmf7ZYWS2tDCEpyySt0r7ol+jVwtR0m7D3VEtCP+SJskvhQIOaXFtQvgFm6Cr
 d6iA==
X-Gm-Message-State: AOAM530aQtMAKnEbbw2dfXY+FcQZlJEwuE/N8yZ+GrMe/05bmfphZM71
 q7xOk611Az5K4eCWDScG9fI68Q==
X-Google-Smtp-Source: ABdhPJxASJgMCHSlaAT+jnWR7OEUQ6kVVPxeeJQfiNe4Wt79qgXR6a0wnra5Mhr9+Tx8zJpe57W47g==
X-Received: by 2002:a1c:2503:: with SMTP id l3mr4472344wml.188.1594132687466; 
 Tue, 07 Jul 2020 07:38:07 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:38:06 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 14/28] ASoC: samsung: pcm: Demote half-documented kerneldoc
 header
Date: Tue,  7 Jul 2020 15:37:28 +0100
Message-Id: <20200707143742.2959960-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Sangbeom Kim <sbkim73@samsung.com>,
 Jaswinder Singh <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
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

Ideally the author or someone 'in the know' should come back and
provide the remainder of the documentation.  Until the kerneldoc
checkers have been satisfied, let's just demote the header to a
standard comment block.

Fixes the following W=1 kernel build warning(s):

 sound/soc/samsung/pcm.c:127: warning: Function parameter or member 'lock' not described in 's3c_pcm_info'
 sound/soc/samsung/pcm.c:127: warning: Function parameter or member 'sclk_per_fs' not described in 's3c_pcm_info'
 sound/soc/samsung/pcm.c:127: warning: Function parameter or member 'idleclk' not described in 's3c_pcm_info'
 sound/soc/samsung/pcm.c:127: warning: Function parameter or member 'pclk' not described in 's3c_pcm_info'
 sound/soc/samsung/pcm.c:127: warning: Function parameter or member 'cclk' not described in 's3c_pcm_info'

Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Jaswinder Singh <jassisinghbrar@gmail.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/samsung/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index a5b1a12b34966..3116be4239f59 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -102,7 +102,7 @@
 #define S3C_PCM_FIFOSTAT_RXFIFOFULL		(0x1 << 1)
 #define S3C_PCM_FIFOSTAT_RXFIFOALMSTFULL	(0x1 << 0)
 
-/**
+/*
  * struct s3c_pcm_info - S3C PCM Controller information
  * @dev: The parent device passed to use from the probe.
  * @regs: The pointer to the device register block.
-- 
2.25.1

