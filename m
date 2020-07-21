Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F018228685
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 18:56:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9FDC1674;
	Tue, 21 Jul 2020 18:56:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9FDC1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595350614;
	bh=0Ww5S3LGn5mE+tmFJ09gHxRgooZB1XnIjgEfbSFK3xY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bFLn48pUGWUuSCREkGwkvBNF+dU6HzmQdijgpBew69FIxSuMCq0nnUJmQRrrhUPTM
	 eWl7ZEfzZ037Joh2HkiLnWlzid9YN5c/BzxOZuMxF5iRm1p9PkIOLcFlIqafXBqc0/
	 c3vXu6jqryX9B5AzRuskqmT0M3n/qw2Dy3I9IsBI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16F29F802E0;
	Tue, 21 Jul 2020 18:53:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1266F80274; Tue, 21 Jul 2020 18:53:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D657F80274
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 18:53:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D657F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="chie8Xjt"
Received: by mail-wm1-x343.google.com with SMTP id f139so3564617wmf.5
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 09:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v4d6uJsLJvDI3EJji05BLPVCBZ1m0E3vug5jjH5kFXI=;
 b=chie8XjtT37iTiWXV3e9tqsfxkDgQ44yavVsczy53hYtGLnOVDMK5CDq6rymQQxA5B
 GdOXxKfqAqy3L+DhC+3OKB5HO9runPNSsM1frOp/ayKh8yikxDXiBmX4X9V/RwR9Keq5
 eJ+W529TTLghEKp53X4rWGHTDAcD26a2tpxEyLPBvOQt8S6gpr7jq5QEH3Mcjn00Zwrb
 JBIwo9E5RnGdk0auEcyTllGM7EAi4vw8YmW150LovoWUGEfhTeqq0Vbz3DLcf6HNCgq3
 PKDIDT5mZ6cNtPBtRe7SwDFY8cGGNm3Qiat1SXpPMwlbiPGGxByV+7nohDYEfSXoF7Vf
 rEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v4d6uJsLJvDI3EJji05BLPVCBZ1m0E3vug5jjH5kFXI=;
 b=aTZMhvgnLTuU73ankyXhR13GJBodB0Cc/9RFOxBIzH4IfC0MzgkosPrP87LfpjEBeH
 XLaMOsB/js0l4coJhRHI5B5T+SJPkIgR3zH+UCLw8j9xdI/THMDJ1ym4dm17s6s/7dTy
 Zi1aVolCgFBRbVOFpwSQehwlL1YigC1dd8+7JqczLeBME+vOL7Hn9QxltloVYk2uJ8dO
 Py3qsVm17u5CLGTX8UAUmIc8+AlV6hDtfafacPtPgviXrvvscCVj8cVp5Uhl9m4Xkg9L
 XPDCxQrTrR6ler+bo4UdR0nstLfL14NvjA0hDQOsEx8PbvalIiF8vkYs0/t2uKz8YEBD
 c7GA==
X-Gm-Message-State: AOAM533HVxqBKediIyJohSQXdrIhLm/dd3yM0XBe2Zl+L5rW2Hd5DJM1
 p/SYxLkkWTtfPPqEvbpl2SR8wg==
X-Google-Smtp-Source: ABdhPJw7o3sUFFHWUSJehrm8NF6cu/74FiVHutUKWnF0yTjmioNJ5QwT490SHkdX3h/XL2YYY5i0JQ==
X-Received: by 2002:a1c:7916:: with SMTP id l22mr5319125wme.91.1595350405320; 
 Tue, 21 Jul 2020 09:53:25 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id c25sm4058648wml.18.2020.07.21.09.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 09:53:24 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 3/9] ASoC: q6asm: use flags directly from q6asm-dai
Date: Tue, 21 Jul 2020 17:53:00 +0100
Message-Id: <20200721165306.29082-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200721165306.29082-1-srinivas.kandagatla@linaro.org>
References: <20200721165306.29082-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

use flags set by q6asm-dais directly!

This will be useful gapless case where write needs a special flag to indicate
that last buffer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6asm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index f5d1f3c2c1ec..d6728304ce6a 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -1546,10 +1546,7 @@ int q6asm_write_async(struct audio_client *ac, uint32_t stream_id, uint32_t len,
 	write->mem_map_handle =
 	    ac->port[SNDRV_PCM_STREAM_PLAYBACK].mem_map_handle;
 
-	if (wflags == NO_TIMESTAMP)
-		write->flags = (wflags & 0x800000FF);
-	else
-		write->flags = (0x80000000 | wflags);
+	write->flags = wflags;
 
 	port->dsp_buf++;
 
-- 
2.21.0

