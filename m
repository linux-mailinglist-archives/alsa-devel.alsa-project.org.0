Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEDE41C1A6
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 11:33:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5121D169F;
	Wed, 29 Sep 2021 11:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5121D169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632907987;
	bh=MwOAfykhP5zgTLQ4vSXRzdd3GZS2toXMaqtYclRZEY8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=smsJ+QU186A+It3qPHpuDHCcr71Aaf/PQA10f+2333fF4313r9vM28P/e7E27BR22
	 RmmAUDYqF6L/vxUD3n5cWFEvP9lcjWbiekj9mHJXnjfiGDlVLx3SpbFaWooxNg5RPt
	 nep/U7itlEcdmsIy1MLnwytiNia048jB7btgazk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7F1AF801F7;
	Wed, 29 Sep 2021 11:31:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2227F80227; Wed, 29 Sep 2021 11:31:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9DD2F80105
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 11:31:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9DD2F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ThxTKH8U"
Received: by mail-lf1-x133.google.com with SMTP id m3so8124902lfu.2
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 02:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v/UGSy92lBMO//Gz9RL9r0Z90ZEqI/HZ9DcXU2pm2WA=;
 b=ThxTKH8UE/PEbqm5nMiArOtjD3zpEzB8+HfD6CI7jeQJqe8q7HIYMBrhSgU+LaAuto
 smh8NC4aah7HbtZXgq3EkQ4pPfBs3gEt23lg7NITWTJmxZOAW/hW6BQx4cU6nyBxTHdS
 4NJI0alZIqHjaPLhvaPbaqHdYt5dHTieCfMKI0iORFIVElhidD/TaMWptD3B30HuAwaf
 xztX5EQ8GbEISHs27HfqDhHBi4u82UUJfWHELvgDD3Op5QokttLtCpAnbo9TmYn64Uwv
 OR5aG4bPFDGuwGAhT8zdiVwcqrWgitZF+6luHiIytjfjqLtUhmxNVOQRki/vScQZGwsj
 IdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v/UGSy92lBMO//Gz9RL9r0Z90ZEqI/HZ9DcXU2pm2WA=;
 b=rX81bAH+cf8+KXRGrDbQsONrEyLyrxs5TuqGlF/4gWjBEdyNiZNmni8Y6YiuvY9d1e
 W8bNF5LvbjKNUV2cWZCCoPPKNfvh2uJOxr24ft6dygW4teIvvYzP4ZYSKEQ68V+3fZOP
 l465siaGbE6Yfd+3mMTy5O6HPfd04tz/hIM24PIpvJ6iCL+Beu8wTDD+0vOoI75AFKE0
 slhNEglYf7NYpbf7oF56VtIKevX0YW4/JDHZt77O3UNGlU/jg2S1Sitx2FQMOIEMLCWf
 t6uNuwU6yZ/62RyqZmsbxutbfS7D2o+AazUi3OtySHAO7pLcVAFadY8jkowP6yc0m7Y3
 sP7g==
X-Gm-Message-State: AOAM532PzUC5OOmBWsbeiIm3EujurOdAGZj4i66x6gelcAuLpvC9woGk
 KjIWLnq3kreTjho83aunwpk=
X-Google-Smtp-Source: ABdhPJwW4/4zsW63VKddIGXUEAZY6myLvIRsXoZS6oK5Kniynr0ocbgfm+QATYDGdfGFM9XeHDO40Q==
X-Received: by 2002:a2e:a22a:: with SMTP id i10mr4879367ljm.464.1632907902914; 
 Wed, 29 Sep 2021 02:31:42 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se.
 [98.128.228.193])
 by smtp.gmail.com with ESMTPSA id a25sm181519lfk.63.2021.09.29.02.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 02:31:42 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: [PATCH] ASoC: ti: Constify static snd_soc_ops
Date: Wed, 29 Sep 2021 11:31:21 +0200
Message-Id: <20210929093121.21253-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-omap@vger.kernel.org
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

These are only assigned to the ops field in the snd_soc_dai_link struct
which is a pointer to const struct snd_soc_ops. Make them const to allow
the compiler to put them in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/ti/davinci-evm.c      | 2 +-
 sound/soc/ti/omap-abe-twl6040.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
index b043a0070d20..68d69e32681a 100644
--- a/sound/soc/ti/davinci-evm.c
+++ b/sound/soc/ti/davinci-evm.c
@@ -73,7 +73,7 @@ static int evm_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops evm_ops = {
+static const struct snd_soc_ops evm_ops = {
 	.startup = evm_startup,
 	.shutdown = evm_shutdown,
 	.hw_params = evm_hw_params,
diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
index 2e3d1eea77c1..da809c7f25a4 100644
--- a/sound/soc/ti/omap-abe-twl6040.c
+++ b/sound/soc/ti/omap-abe-twl6040.c
@@ -96,7 +96,7 @@ static int omap_abe_dmic_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops omap_abe_dmic_ops = {
+static const struct snd_soc_ops omap_abe_dmic_ops = {
 	.hw_params = omap_abe_dmic_hw_params,
 };
 
-- 
2.33.0

