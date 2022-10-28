Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F52D6130AA
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 07:47:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0196A165E;
	Mon, 31 Oct 2022 07:46:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0196A165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667198847;
	bh=iPGyt+84wCb1NFI5iNvvlUF9KHEY0odzw+g+6aRargU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dy0QoqUVShwgDhyE4qSO3wdK1ki9fh0iDHjNr9thok+r2YbuEXgyjR0ZV9xx6fmBN
	 K2O0v/vwURRvvEBHRxFlFtLWmIgdGEq/wMlJ1a6gHjnIj29SlfiZIFMfZrfttLqEn8
	 usxY+/TW5vDEkD5A60yMMqOzB5Egwd7VJwjAUwfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57D11F8055A;
	Mon, 31 Oct 2022 07:45:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26BA4F80095; Fri, 28 Oct 2022 16:12:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA82DF80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 16:12:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA82DF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.b="aSCxH4V0"
Received: by mail-lj1-x22f.google.com with SMTP id u2so8540455ljl.3
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 07:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Sj8HqllYMhfqKSvoQNCAihSbEuI4FzdlLzmNIw46HS4=;
 b=aSCxH4V0xWhwnLfV9pMe0XfN4ID4YAlJ0P8AuJMDr8MQsLUgliJ7DKMek2AnNfLxEF
 +2ppRP9SBmJR4ZgjRhHXuoDFBvPUp+ysV89R+Y67dKWSM4Y0v5Dt/t0MTlKsPimJ/QvN
 rXO98VseuYdpDVBiRSEIcdFxJF1u7xzWzXAjUN0lmnIbuL/tgscSTCSS/fDCfT5ZkBlz
 cIHso4eLUO6aunBIclS8lDu4VwjxEFxQbjzuY0lRT54CvhK80AwArFkgGf+m6Qjw992p
 68Nt/z1nNqEd0x9wDZYv1iSokRqTappf3lsaBaidhhkB1lvrK03uLtBMfMTGvgo4iHFF
 Vkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sj8HqllYMhfqKSvoQNCAihSbEuI4FzdlLzmNIw46HS4=;
 b=YxqLSpgA9gkMzWh49bdb1p7W7tNsBC4ezb/VtHOtyWDJvwBfu4WomDfPmICkFBCU70
 c9EeuVg2o13RilFcLY/OuBWMQN3EarppCDhZj+jB5nKV4zOTtGjK7FO0PP4A88BdZzJU
 mNrZIkIKUo1aT3rmtFOUZa4qTeqK6X8bA+XikpAk4ogjGJaZc8UMgCAj5JP4Tj9AR8Aw
 yPHwKhwkB6E+bpyEEYG0ZNRGy6AbQ4SPuxilAtLQOyEacFsBQHrTBrbWAHrquJsL/0tI
 HmgBooXXh/P7AcQaEOPB5M/a3x4+PwVfXGccZ3K0E2tpnN6g6LJDExg3eKQW5BjyaduA
 xfyQ==
X-Gm-Message-State: ACrzQf0pATDqHNe4ArtbTivKT0t40CeKVhgEL+E5ZaiYGk2KFiCwhogr
 r6gO3XC+0t3CaGNyc76ZGuZKRMradwlJu7vlt3U=
X-Google-Smtp-Source: AMsMyM6mA6aj5cK7n1IOR21s4CGJnScN3SYaB+eu81S/8fo6cgpjaWtiWo/dcNJNNXbaJgS8HtwxcQ==
X-Received: by 2002:a17:907:16a6:b0:78e:f140:a9b9 with SMTP id
 hc38-20020a17090716a600b0078ef140a9b9mr47339126ejc.502.1666966314346; 
 Fri, 28 Oct 2022 07:11:54 -0700 (PDT)
Received: from dtpc.zanders.be (78-22-137-109.access.telenet.be.
 [78.22.137.109]) by smtp.gmail.com with ESMTPSA id
 9-20020a170906300900b0073d753759fasm2241902ejz.172.2022.10.28.07.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 07:11:53 -0700 (PDT)
From: Maarten Zanders <maarten.zanders@mind.be>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl_asrc fsl_esai fsl_sai: allow CONFIG_PM=N
Date: Fri, 28 Oct 2022 16:11:28 +0200
Message-Id: <20221028141129.100702-1-maarten.zanders@mind.be>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 Oct 2022 07:45:34 +0100
Cc: alsa-devel@alsa-project.org, Maarten Zanders <maarten.zanders@mind.be>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

When CONFIG_PM=N, pm_runtime_put_sync() returns -ENOSYS
which breaks the probe function of these drivers.

Other users of pm_runtime_put_sync() typically don't check
the return value. In order to keep the program flow as
intended, check for -ENOSYS.

This commit is similar to commit 0434d3f (omap-mailbox.c).

This commit fixes:
cab04ab (ASoC: fsl_asrc: Don't use devm_regmap_init_mmio_clk)
203773e (ASoC: fsl_esai: Don't use devm_regmap_init_mmio_clk)
2277e7e (ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk)

Signed-off-by: Maarten Zanders <maarten.zanders@mind.be>
---
 sound/soc/fsl/fsl_asrc.c | 2 +-
 sound/soc/fsl/fsl_esai.c | 2 +-
 sound/soc/fsl/fsl_sai.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 44dcbf49456c..08ca410ef551 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1226,7 +1226,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	}
 
 	ret = pm_runtime_put_sync(&pdev->dev);
-	if (ret < 0)
+	if (ret < 0 && ret != -ENOSYS)
 		goto err_pm_get_sync;
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index bda66b30e063..763f5f0592af 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -1070,7 +1070,7 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	regmap_write(esai_priv->regmap, REG_ESAI_RSMB, 0);
 
 	ret = pm_runtime_put_sync(&pdev->dev);
-	if (ret < 0)
+	if (ret < 0 && ret != -ENOSYS)
 		goto err_pm_get_sync;
 
 	/*
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 38f6362099d5..01f3463c0e47 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1149,7 +1149,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	}
 
 	ret = pm_runtime_put_sync(dev);
-	if (ret < 0)
+	if (ret < 0 && ret != -ENOSYS)
 		goto err_pm_get_sync;
 
 	/*
