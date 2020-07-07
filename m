Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F1A216A3C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:29:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BEB19F6;
	Tue,  7 Jul 2020 12:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BEB19F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117749;
	bh=eIjc6K4C6AG0CP+nO7f716vsFKUAonS1/pXfGr1bI5E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGW48SsFYb4MwrWPuhUS1KcgRMC24rywVkjzS9a6Xe1/9Zh7M+GImSXSPuIrAH7VV
	 dVVIYG8KQ20dOuAC94mH3BGpPasCaX/A/jmgfyRgxalfSFILHqnOS7q/oLnVSNjn9t
	 6U4OMpO9PeG+TIuMOgq/mAVnm3jZgBlpnz2fUbdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5A16F8036E;
	Tue,  7 Jul 2020 12:17:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA491F80339; Tue,  7 Jul 2020 12:17:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D6E5F802FE
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:17:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D6E5F802FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LCQfc/e5"
Received: by mail-wm1-x342.google.com with SMTP id o2so45891057wmh.2
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GMUYidfrIwBoQwr04cGElMGH9ZhgIrwlDOw4is85pEg=;
 b=LCQfc/e5ty78KnRBAWkN5lY+b68RFMYCz8nZm/KdhRS9l+QtjMn+DGKkzXQpAfRwuD
 n8dndQB0ha994npwPP+9EdI4y10eYHeLl7rqUAivaYJyPvaYJ5ovzn9eJrfwLoqCqK4D
 X1AiU35rKsZhW8y7U7JVvYJ3Hdc6bOWnrjH3pdc0D7QzdCRmlTGMuowrhG6zEB0mjcko
 uRbhznr83cxoJYNTTqCOsMg7hp/Eqo6YLYBOePqhVcVBAlo/BOJld4J9auQWVMDG2fff
 aH0a3GrNPvm2pIMPUemmoUKXAZVmeTlnqbZWMT93sJR7zuapWpadYGEV9ssJwOGmt31Q
 jRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GMUYidfrIwBoQwr04cGElMGH9ZhgIrwlDOw4is85pEg=;
 b=GrPnodKUDIK6lhJS4mQAPHOio20nAPtg/9kaI7SqFaf7K/MFhWQjzDQLR8sTuwnvbu
 ccq3oLBzJz3BFSV6MO2TqLxetoRUZmt+CTpn+tUU/aW187OGVJm/2vWagB1f02gpIK4V
 Irj9H7nOzG+Apmomvnh9cn2mBb06/m9r/X17UPChv7/QjglK9wWkJK9Yr2y39ywpZGYc
 k8RIGVt1KUKXif8tSpw30/1AnZxcrcK++ys7GgxIMspmoJx9bNAG4dYpwWicvzRLblpx
 aGPetv6qke0vW+X51daKx97OCmSGvqtbowLLHhOnNrNFlguJdSgSdnrf7BKS7R/9fD1Q
 VIgg==
X-Gm-Message-State: AOAM533YgougiVRdgv2aunych7T16euGiG8MuTKRLX+HTPRpp24kEk7r
 6dj4KAboW+KmnVIHVUaBGpCXVlAHnho=
X-Google-Smtp-Source: ABdhPJy3UpRnh1pbIW5TM69XcTo8ALmp1/bv7rxoyf8ZQ1E28518TJ8Xw2HwfBX5mnOEi/HYkpRqNA==
X-Received: by 2002:a7b:cbcb:: with SMTP id n11mr3217967wmi.99.1594117032905; 
 Tue, 07 Jul 2020 03:17:12 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:17:12 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 20/28] ASoC: sti: uniperif: Mark 'uni_tdm_hw' as __maybe_unused
Date: Tue,  7 Jul 2020 11:16:34 +0100
Message-Id: <20200707101642.1747944-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: Arnaud Pouliquen <arnaud.pouliquen@st.com>, alsa-devel@alsa-project.org,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
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

Only 2 of the 3 source files which include this headerfile actually
reference 'uni_tdm_hw'.  The other source file 'sti_uniperif.c' sees
as it as being unused.  Mark it as __maybe_unused to show that this
behaviour is not only known, it's intentional.

Fixes the following W=1 kernel build warning(s):

 sound/soc/sti/uniperif.h:1351:38: warning: ‘uni_tdm_hw’ defined but not used [-Wunused-const-variable=]
 1351 | static const struct snd_pcm_hardware uni_tdm_hw = {
 | ^~~~~~~~~~

Cc: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/sti/uniperif.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sti/uniperif.h b/sound/soc/sti/uniperif.h
index 2dc2da5d458bd..e22d045d5cd99 100644
--- a/sound/soc/sti/uniperif.h
+++ b/sound/soc/sti/uniperif.h
@@ -1348,7 +1348,7 @@ struct sti_uniperiph_data {
 	struct sti_uniperiph_dai dai_data;
 };
 
-static const struct snd_pcm_hardware uni_tdm_hw = {
+static const struct snd_pcm_hardware __maybe_unused uni_tdm_hw = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_MMAP_VALID,
-- 
2.25.1

