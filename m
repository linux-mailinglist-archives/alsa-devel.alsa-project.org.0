Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E63C1216F0D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:43:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90F7F1670;
	Tue,  7 Jul 2020 16:42:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90F7F1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594132983;
	bh=T5qEoa4LLJEyAlO2YVu8nzFeOf7HGJiK/IyWBEAVAeA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iKwfgaIfLdHhkJ1YLiZI9yF5kkadcCFwDiIkJRyXs3RPOmchdDM9hRKcp+BAn+RrL
	 VnnKUifTEUmLENEJGfq7KFtFPA5EmpU5bl4yeFrCApQeiBmPD/RNa0oWebjwf0/FK4
	 o7yi6iHC50mr/nBrgs3wVg0Six5fM6xPXhkL3WUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A555DF80303;
	Tue,  7 Jul 2020 16:38:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A481F802DC; Tue,  7 Jul 2020 16:38:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51545F8025A
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51545F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fOdzTEcf"
Received: by mail-wm1-x344.google.com with SMTP id f139so46802441wmf.5
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KDb2cHewYsZWIM9X5BweTMn+o+Wme2rV/mNBj7f6Kc0=;
 b=fOdzTEcfqDWXHHGsK3RSk6klgVeOq4kKl1yqa8GPt8rsKxfPxvACiPgftfArSdTfkn
 +bQP4l0HPEwtB2OpMJKUC/eVmcBLrAEqMXMmhXguk81lmiE8Y52qpuOWTZsCHqU7hg7w
 mZFrHdufwhigmefa9nvoXDFxevuX0x3LowKfRY2BwYO3xmos96rbsa3JWfwZj03d9zhO
 3WB9PjUPT/yWwNWC4Tb0zonDWluOEIN5raUub5n3CcGXhPTUBpA1xb8+4p5wOKWpGZBO
 Rh+Arwk0kubZqjIDBZJbBFATGww6GSpX81zAvCfNfFEq2bSBtDks044WHz4zpeln4+mm
 C7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KDb2cHewYsZWIM9X5BweTMn+o+Wme2rV/mNBj7f6Kc0=;
 b=cqRxwR7vZ0zjbjnXkfrVJt1wt9qnT/ZvaHwS3e+FuyncDBB/KwxGF37THMjQOjSmqq
 1j35lyzlhxYnWLJuqcBUIRBZ0VrNqu7E8AxsoNgw1LPPOFncEI/9oWNjXeBaiUMu7qLj
 gblb6zVakztc+IKjgvqzNNdi175G/9KOCYQIwOW9LZyRwKGiBBqXEYuCtlvOXZSg9kvM
 eoQNN8kD/ot4eYanKFkL1+aWbtaFkljgBaK6mhR4ABccPudOUy0r/nWSVwB9CmiH/0go
 +F9bL1AA2+RRHQj72HTbAntqQJh+0VnjVH34tuo1tGLG0r77/Ev4h4eei2wOGX3KBwrU
 gdNQ==
X-Gm-Message-State: AOAM533MndUKW9yWjhf7acW3pT44Ns4bqm+vOapO3QoMQMlC7LZ8J6oq
 DGgQeRCF9AaJGRAUmEvxaw+5sw==
X-Google-Smtp-Source: ABdhPJzv0lUCdAZV7Tzonh9ODAAoKJ3ODB1Ka6SB0h4CZrG5qt7dZrtoXm09LT11yngBdC4AIyvYEw==
X-Received: by 2002:a7b:c394:: with SMTP id s20mr4794988wmj.31.1594132669656; 
 Tue, 07 Jul 2020 07:37:49 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:37:49 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 03/28] ASoC: fsl: fsl-asoc-card: Use correct format when
 providing struct documentation
Date: Tue,  7 Jul 2020 15:37:17 +0100
Message-Id: <20200707143742.2959960-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Lee Jones <lee.jones@linaro.org>,
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

Struct kerneldoc headers need to be prefixed with 'struct $NAME', else
the checker gets confused.

Fixes the following W=1 kernel build warning(s):

 sound/soc/fsl/fsl-asoc-card.c:43: warning: cannot understand function prototype: 'struct codec_priv '
 sound/soc/fsl/fsl-asoc-card.c:60: warning: cannot understand function prototype: 'struct cpu_priv '
 sound/soc/fsl/fsl-asoc-card.c:83: warning: cannot understand function prototype: 'struct fsl_asoc_card_priv '
 sound/soc/fsl/fsl-asoc-card.c:104: warning: cannot understand function prototype: 'const struct snd_soc_dapm_route audio_map[] = '

Also the size of the struct does not belong in the description:

 sound/soc/fsl/fsl-asoc-card.c:65: warning: Function parameter or member 'sysclk_freq' not described in 'cpu_priv'
 sound/soc/fsl/fsl-asoc-card.c:65: warning: Function parameter or member 'sysclk_dir' not described in 'cpu_priv'
 sound/soc/fsl/fsl-asoc-card.c:65: warning: Function parameter or member 'sysclk_id' not described in 'cpu_priv'
 sound/soc/fsl/fsl-asoc-card.c:95: warning: Function parameter or member 'dai_link' not described in 'fsl_asoc_card_priv'

Cc: Timur Tabi <timur@kernel.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/fsl/fsl-asoc-card.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 57ea1b072326b..3b1fd8c9316d8 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -33,7 +33,7 @@
 #define DAI_FMT_BASE (SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF)
 
 /**
- * CODEC private data
+ * struct codec_priv - CODEC private data
  *
  * @mclk_freq: Clock rate of MCLK
  * @mclk_id: MCLK (or main clock) id for set_sysclk()
@@ -48,11 +48,11 @@ struct codec_priv {
 };
 
 /**
- * CPU private data
+ * struct cpu_priv - CPU private data
  *
- * @sysclk_freq[2]: SYSCLK rates for set_sysclk()
- * @sysclk_dir[2]: SYSCLK directions for set_sysclk()
- * @sysclk_id[2]: SYSCLK ids for set_sysclk()
+ * @sysclk_freq: SYSCLK rates for set_sysclk()
+ * @sysclk_dir: SYSCLK directions for set_sysclk()
+ * @sysclk_id: SYSCLK ids for set_sysclk()
  * @slot_width: Slot width of each frame
  *
  * Note: [1] for tx and [0] for rx
@@ -65,9 +65,9 @@ struct cpu_priv {
 };
 
 /**
- * Freescale Generic ASOC card private data
+ * struct fsl_asoc_card_priv - Freescale Generic ASOC card private data
  *
- * @dai_link[3]: DAI link structure including normal one and DPCM link
+ * @dai_link: DAI link structure including normal one and DPCM link
  * @pdev: platform device pointer
  * @codec_priv: CODEC private data
  * @cpu_priv: CPU private data
@@ -94,7 +94,7 @@ struct fsl_asoc_card_priv {
 	char name[32];
 };
 
-/**
+/*
  * This dapm route map exsits for DPCM link only.
  * The other routes shall go through Device Tree.
  *
-- 
2.25.1

