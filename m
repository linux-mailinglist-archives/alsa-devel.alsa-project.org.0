Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB2B2169FE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:21:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C31BD15DC;
	Tue,  7 Jul 2020 12:20:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C31BD15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117266;
	bh=T5qEoa4LLJEyAlO2YVu8nzFeOf7HGJiK/IyWBEAVAeA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JqFFkVn1sJbAQwtTOf2KtgMxNw9ksffJhyCMTKE3Yu0u0pk2ufqRbdG6W6upsI33V
	 1skZ6OhKh6W7qz/qxY2Y6JU12HhN/cC0XzLUdxHxjh2GrZ49Ft+ZeoxCiES1PZwCr6
	 vs/H6mDy2SxgVPVYAidf6Afol8TF5Y28QxMsspr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06835F802FF;
	Tue,  7 Jul 2020 12:17:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EAE7F802EA; Tue,  7 Jul 2020 12:17:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA0FFF80274
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:16:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA0FFF80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KWAySNzy"
Received: by mail-wr1-x444.google.com with SMTP id q5so44517175wru.6
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KDb2cHewYsZWIM9X5BweTMn+o+Wme2rV/mNBj7f6Kc0=;
 b=KWAySNzyfzgA6L35OqDEdMfxyRW6P5mNQ/VoKFi3SPOGxlROBgL/6G+0MYrllTvY+U
 CwdWcR0JaSnDwr0jP1J9a/WGbXKdNpkAw4F9cqrIhLwhxLXc/QuvLC/+rCJ95WSCocwi
 5u8Ofosz9530ws8xxT5Le5pgKaBsFBSqXZ4KnG9+ar+gJv8obmLu8DxsTKzFLZhfNu6X
 xSbgp8e/buyq7tf5WVYb6aqlEwHk3L1kA1BS0Ar0tAd3bhnm1DgmIL/fQUYbIL0Kz56v
 HRbSh3uo5DzQiBe0Cs6+GdH1OK9V/sDl1+PEBHLNW8xOmIZjYUq36JRRw1Zo5Z5+Q1ld
 P1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KDb2cHewYsZWIM9X5BweTMn+o+Wme2rV/mNBj7f6Kc0=;
 b=pKkM8aXYVAGjn43aqGLQ9FXlgep6NNPGexWO5KVdX5EoNmJlw2L+2brEI6zD85Msog
 k5p/UW231/L4WE6WIIqOVnnGg7PF7r5wXJ4y4SX1Ms8y3BfkUR7HnmrCcmFlXK1DalhL
 jl0XQ2bxCMViLPPz1GkQqtRZHYFldhcAgP9R3EDj4ypohvbV+GgJguu6Hd6XIncFdYNK
 a7mNgSJRwxJBnDTibZwICBCt01JXjXpYY6R5rbVCuDIFeLaRxgf4Dw3H3aXxn0PYyb+I
 Y8rcsDZ/5fqSfuLL7YHsQ86oSyOGlchAuqfOajoRAMlR1yFjNH5TYvRho5rcOD9KXbO8
 R6EA==
X-Gm-Message-State: AOAM532T7ihBJvc7M/gp/MT4zpwAynZ7n51BXZS3bgxw5F+jy312g9H7
 Ul71qnXNwo98Umt6CbwTMO3DHw==
X-Google-Smtp-Source: ABdhPJyuLSFDg+DgyQWYS0Sp/uZ2Uz32rktUaElyVytRNJtrr6b4EIZCqaiZhAvG7a8BZrItq4OaWA==
X-Received: by 2002:a5d:69c5:: with SMTP id s5mr53007426wrw.197.1594117011646; 
 Tue, 07 Jul 2020 03:16:51 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:16:51 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 03/28] ASoC: fsl: fsl-asoc-card: Use correct format when
 providing struct documentation
Date: Tue,  7 Jul 2020 11:16:17 +0100
Message-Id: <20200707101642.1747944-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
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

