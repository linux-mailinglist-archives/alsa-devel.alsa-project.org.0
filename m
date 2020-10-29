Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF3C29E51C
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:53:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14C7C1676;
	Thu, 29 Oct 2020 08:52:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14C7C1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603957983;
	bh=WUZGwbarNTHGvi7gBUTWsHRAY5KD5HAbD2ljqy5o4mQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FJrb9QXPLKBzYMKy80UkHKyXtWOw7MXe6v/2/VmGbOeMkw6KAS5pZFxaGSVe9nd5Z
	 45J5+DfYnK3BoJJM66FRfMZ7YcQ1o9YdklMSYYgOsYjkkrTckXwyHt5wvb42OW+fLD
	 wecFHmikqn4yNdvUUTdutXEnYh47PwQPE8c1hzMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CF71F804D2;
	Thu, 29 Oct 2020 08:50:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C73DF8020D; Thu, 29 Oct 2020 08:43:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B0AEF80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:43:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B0AEF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MetyxOei"
Received: by mail-pf1-x442.google.com with SMTP id j18so1665258pfa.0
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2f76QX6KjllBHRbyn8bbNM8MHRGSvgg1fTn2FXp9kIk=;
 b=MetyxOeiFIfccE3es6OdzGpM16CvXTlwFUbayjCo80V8vzGg71aanERZA/rSMHq57V
 yDaqdUwD8D3Q1atgb5CdG3c/XcBhaR3pDGlRd+WP5J942NshDkLWwPYlPY6Y8Sbffc1A
 ftOwJdlht0Fak+gTaqd+TT0+s5qzDf3KzUuyvWM+EHSOjr2/Ymvn+dAgVWWWK2RLCCMh
 fvlQAVgXt7CekrChkpBJDv4panvHeF9QwK070Erpwrx3KMMRSEaTiLMqn76dEt2BBCWX
 6tl9TWzUT7aHkNeTYFDKvC1A1Vvbj4oymVa8c2iEa0Kc83CBRQtUv1LmRKGV24uUfOCT
 s7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2f76QX6KjllBHRbyn8bbNM8MHRGSvgg1fTn2FXp9kIk=;
 b=cQ6yzOWfjq7q7E/OYcx7rtEVZm7uRvmvFiCfPCzMeDTYd4gbjhGerpMqqRy5aUQYW+
 974H65LYLJawoHDjeCAH9Gskg+PIEqeFSh1RBEnDjyiwcKidXsi33A+5opQz7ZdzuivS
 hJy7SZXDjDST2qL+d4lmk0KtsjGIxtwiWdAkgYhJrAO8wWZPAugXti7YRmXewgDbj9zC
 XBnBIajQUlSrjiZagqLOS/rlYtDtzPbmQ6DHV3YtRaQc8j2ufTy/SdzPtS6j5cscYLWu
 hM1dihY00dwVsepsyP935leCNZhU12/2ne2khuAY6rRFItSzkN561j7c0QNsVr3r5PJD
 8Zlg==
X-Gm-Message-State: AOAM530m0LiwTFQZ3plZ0M+fOEPqYRUR3isL1ggCIWmKl+xEiPgGFCr1
 xXtozNjO4li8ZzC44QAYG3E=
X-Google-Smtp-Source: ABdhPJyWkELF8JgWYyu3kFPwXgZM+B8iEgdd3IgoUA4QLO4kayW+2sAMfjxjJYUYVDIWfpSWvCK8Gg==
X-Received: by 2002:a63:7d49:: with SMTP id m9mr3024402pgn.60.1603957429902;
 Thu, 29 Oct 2020 00:43:49 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id t9sm1569687pgp.90.2020.10.29.00.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:43:49 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 05/25] ASoC: img: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:41 +0800
Message-Id: <20201029074301.226644-5-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:54 +0100
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>
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

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 sound/soc/img/img-i2s-in.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index 0843235d73c9..8364eb9c44bc 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -545,7 +545,6 @@ static int img_i2s_in_dev_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int img_i2s_in_suspend(struct device *dev)
 {
 	struct img_i2s_in *i2s = dev_get_drvdata(dev);
@@ -592,7 +591,6 @@ static int img_i2s_in_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct of_device_id img_i2s_in_of_match[] = {
 	{ .compatible = "img,i2s-in" },
-- 
2.28.0

