Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE12296C6C
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 12:00:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0CC317F4;
	Fri, 23 Oct 2020 11:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0CC317F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603447238;
	bh=/CecSK7qOfCnQsk22hCpRqSwsxYpWt/DxZDlhO0y9Ro=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g1FaHWnWDXeTZ//9OJ4fxwjl+EU+LyVcUxN8wKYkBDGLfMnr1pWzP4ZGZpE3l/kv4
	 jyocLU6TnYMvIUMQ3D2t8/tD8Gtbi8UZ4wiXgGnTISMb2yU5atfYOA3z3xp2Su/LwT
	 dWwx/t3gAV6Y9CkmqlLQ5aM2GxJ2iUTBgq0UNCa4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21723F80264;
	Fri, 23 Oct 2020 11:59:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC64FF8025A; Fri, 23 Oct 2020 11:59:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32E4DF80245
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 11:58:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32E4DF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="UxLyK6oK"
Received: by mail-wm1-x344.google.com with SMTP id q5so859953wmq.0
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 02:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cxohQKBvb3GUQ4FxSbykrXuPjhnG3MBUNJ9DSLhuLjw=;
 b=UxLyK6oKIRTBIldHNdeAS+DKqkLJXJ3VEQxW/9LJmMlH9O/NM+t8YW7sGMEqoKXhfr
 9c4BIVumnwdgGcX5HUC4PyPSWB2kKvUJ1x2RJFn5TArCC7SuYveLGqvEa2fespacREsX
 o3oEFQLJsunVyK75MYb+HM3UOF3T2vsnl9LP0fnVbGHibu/Ah70kvuojNG6clLklYPKI
 wNt7qHboBGglZ1gelM5GY7cT8Pk0nzZAxzy5qBJB2xDxhjB94inFuXOYmwUiEAgtctHc
 dYvKlNPCcEPV4aWGkJks1jGwowF/nHxY7MBZujEjsotFkbFLSjF93ms8uUxVVzvCBnU1
 tHag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cxohQKBvb3GUQ4FxSbykrXuPjhnG3MBUNJ9DSLhuLjw=;
 b=FpSKYr5kdcAVA31OAq91CQlbQ1OPDjaLVxUPO4U0YSfVE1kYUE/2BXRHGOtVuXb5MK
 9OJ8WABnfoQOI+ABVN9QUjBIEYy+AOO8V4TnGn05do1pf+5df36UNzPpyZvmC+eERe3J
 L0FklZqoxXmZztmadcrO2rfMue7RhBLc/MTBCJ3rigWqBsYSmJDwdhrcC7AXv17BzvbA
 lc0wHJ3ulnPvMsoPJFpxmNnNq0z6gJcBxV78qbbiFL94x7gpH/G804/2iukzImNniC6w
 dBum9FnYdK+/09cjehH4H0hNpq+2KSMQe2xOdPcOqNaSlqS24EsQFI3ZN2+Q5NA5ToyP
 h9Ag==
X-Gm-Message-State: AOAM531TG1FI8Ycfmbr/CpN/j8VDc2PO2rfEifsotqsBixBu98LFl3Kq
 2/U1Eu+Qwm2sFzDTBYXZcQl2Cg==
X-Google-Smtp-Source: ABdhPJzqTNcUTOqYP502Jyth4LVEL5M3woMGdz0XtNLqm5lVr0ZAxKrhneb3fmBu0eHp6jHsRQ9B2Q==
X-Received: by 2002:a7b:ce8f:: with SMTP id q15mr1482900wmj.88.1603447132098; 
 Fri, 23 Oct 2020 02:58:52 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id f139sm2311579wme.47.2020.10.23.02.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 02:58:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: qcom: sdm845: set driver name correctly
Date: Fri, 23 Oct 2020 10:58:49 +0100
Message-Id: <20201023095849.22894-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
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

With the current state of code, we would endup with something like
below in /proc/asound/cards for 2 machines based on this driver.

Machine 1:
 0 [DB845c            ]: DB845c - DB845c
                       DB845c
Machine 2:
 0 [LenovoYOGAC6301]: Lenovo-YOGA-C63 - Lenovo-YOGA-C630-13Q50
                     LENOVO-81JL-LenovoYOGAC630_13Q50-LNVNB161216

This is not very UCM friendly both w.r.t to common up configs and
card identification, and UCM2 became totally not usefull with just
one ucm sdm845.conf for two machines which have different setups
w.r.t HDMI and other dais.

Reasons for such thing is partly because Qualcomm machine drivers never
cared to set driver_name.

This patch sets up driver name for the this driver to sort out the
UCM integration issues!

after this patch contents of /proc/asound/cards:

Machine 1:
 0 [DB845c         ]: sdm845 - DB845c
                      DB845c
Machine 2:
 0 [LenovoYOGAC6301]: sdm845 - Lenovo-YOGA-C630-13Q50
                     LENOVO-81JL-LenovoYOGAC630_13Q50-LNVNB161216

with this its possible to align with what UCM2 expects and we can have
sdm845/DB845.conf
sdm845/LENOVO-81JL-LenovoYOGAC630_13Q50-LNVNB161216.conf
... for board variants. This should scale much better!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
I will post the ucm changes once this patch is merged!

 sound/soc/qcom/sdm845.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index ab1bf23c21a6..6c2760e27ea6 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -17,6 +17,7 @@
 #include "qdsp6/q6afe.h"
 #include "../codecs/rt5663.h"
 
+#define DRIVER_NAME	"sdm845"
 #define DEFAULT_SAMPLE_RATE_48K		48000
 #define DEFAULT_MCLK_RATE		24576000
 #define TDM_BCLK_RATE		6144000
@@ -552,6 +553,7 @@ static int sdm845_snd_platform_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	card->driver_name = DRIVER_NAME;
 	card->dapm_widgets = sdm845_snd_widgets;
 	card->num_dapm_widgets = ARRAY_SIZE(sdm845_snd_widgets);
 	card->dev = dev;
-- 
2.21.0

