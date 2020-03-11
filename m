Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3674182066
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 19:07:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73A4B166E;
	Wed, 11 Mar 2020 19:06:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73A4B166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583950052;
	bh=06TVpJq7Lpr9x+viR36ITuT468fatJSftcFPkcw1fes=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k7lyFOhP7VuE3I8ilnRcjgLvWWC3D/GWpX7T00VdQiQM99tRC2Lxss6AlktN+HrR1
	 gM/tFsedXxBhkktPITB8ifD71gj0SZFEMWvqMDH3FunBiOx1z5pfH/1U9ItzOiCrVf
	 kQ3XfU3Qoder0SZVc9zQ8/jlvG7EjuJzVjBnBnBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2F80F8028C;
	Wed, 11 Mar 2020 19:04:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66BE6F801A3; Wed, 11 Mar 2020 19:04:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E131F801A3
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 19:04:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E131F801A3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="h4Lr7F+6"
Received: by mail-wm1-x342.google.com with SMTP id x3so3733192wmj.1
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 11:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4omj6yAnna4dJSDx6mgWTPNUU3WmtYx8C7r3eY7KJR8=;
 b=h4Lr7F+6v/hE6dalw5i+9v/T+aEcsjQazcSL+w4L8CeLySvy6RvJLOM3X9+74Ek9DO
 nhAYQtP9yUbK71IC6rY1v/SZKYwaGWBRTgiH+skZHaqaa452ul7KJT6CPjICbCQad7rg
 Mmhz2xiFvJHQ7O2UJ++ZhXLis3WQN0vrzSca47MuSn2g35SMb6hXvU0d34V+Y2jmn6ik
 VsIQJF+ySk+scY60ttpsCK+t63v4lsmVVVMw70acLn+crd8u/INAS1DLMxkk2pTQKpgN
 sr2pzPN9kPM296nb1VXTBPuFs+CQ4nJxrxT2D4p5am9veDPox5Q13YpZW5desLi6j1Ct
 uaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4omj6yAnna4dJSDx6mgWTPNUU3WmtYx8C7r3eY7KJR8=;
 b=Z9we9FQOCfaqdJcnEHspBewQF2jwNo5PsIoFkoVsCpoDoZ0m9ViVCpCBOOkpNWAOty
 RSnrCzpStUJv1FqmjVVq01tydXjN7k0oYkPzuZwFiJhIJvmCeLNDM7tQ8bvsPtfFcIhD
 WWP01FWeW9LpzPk8WVOD3BYiAopTyaBXmS/9+HE43OehXcv8MtW5wAlhwiShlAD6+/v9
 d8+J/t811RjGCYxuvWWOrs3vLwTT7Fky39SbCgAReCpLV8f/cDvM7LXZR015j1fn2cHx
 DLrzcQXXA1OtTIRGG5MQlLEYm4V+5sm6+7a66Xc3DH2LcjCFu1XY/9nKDHjBKzkMoTP5
 bZTA==
X-Gm-Message-State: ANhLgQ0spxMzHYFN3rsZSDaF2lrTY/4gFVXcjq+uMT5uk/sV4grI/NrJ
 Bfl2s7pLTPwP42nTR+qHVqEnbQ==
X-Google-Smtp-Source: ADFU+vvR5T/YJ0xN9O5b1ViU6reQXdGd7Z+15MpCetrHskMG8KW1ZFhX4v9Gsux7i8Rp5TuBYyt6Ug==
X-Received: by 2002:a7b:cc14:: with SMTP id f20mr4562610wmh.132.1583949885317; 
 Wed, 11 Mar 2020 11:04:45 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id z11sm8997840wmd.47.2020.03.11.11.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 11:04:44 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/2] ASoC: qdsp6: q6routing: remove default routing
Date: Wed, 11 Mar 2020 18:04:22 +0000
Message-Id: <20200311180422.28363-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200311180422.28363-1-srinivas.kandagatla@linaro.org>
References: <20200311180422.28363-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Vinod Koul <vinod.koul@linaro.org>,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
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

Frontend dais can be configured to rx or tx or both, however having default
routes without considering this configuration can lead to failures during
card probe as below for compress rx only case. These routing have to come
from sound card routing table in device tree.

"routing: ASoC: Failed to add route MM_UL1 -> direct -> MultiMedia1 Capture
msm-snd-sdm845 sound: ASoC: failed to instantiate card -19
"

Reported-by: Vinod Koul <vinod.koul@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6routing.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 20724102e85a..4d5915b9a06d 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -918,25 +918,6 @@ static const struct snd_soc_dapm_route intercon[] = {
 	{"MM_UL6", NULL, "MultiMedia6 Mixer"},
 	{"MM_UL7", NULL, "MultiMedia7 Mixer"},
 	{"MM_UL8", NULL, "MultiMedia8 Mixer"},
-
-	{"MM_DL1",  NULL, "MultiMedia1 Playback" },
-	{"MM_DL2",  NULL, "MultiMedia2 Playback" },
-	{"MM_DL3",  NULL, "MultiMedia3 Playback" },
-	{"MM_DL4",  NULL, "MultiMedia4 Playback" },
-	{"MM_DL5",  NULL, "MultiMedia5 Playback" },
-	{"MM_DL6",  NULL, "MultiMedia6 Playback" },
-	{"MM_DL7",  NULL, "MultiMedia7 Playback" },
-	{"MM_DL8",  NULL, "MultiMedia8 Playback" },
-
-	{"MultiMedia1 Capture", NULL, "MM_UL1"},
-	{"MultiMedia2 Capture", NULL, "MM_UL2"},
-	{"MultiMedia3 Capture", NULL, "MM_UL3"},
-	{"MultiMedia4 Capture", NULL, "MM_UL4"},
-	{"MultiMedia5 Capture", NULL, "MM_UL5"},
-	{"MultiMedia6 Capture", NULL, "MM_UL6"},
-	{"MultiMedia7 Capture", NULL, "MM_UL7"},
-	{"MultiMedia8 Capture", NULL, "MM_UL8"},
-
 };
 
 static int routing_hw_params(struct snd_soc_component *component,
-- 
2.21.0

